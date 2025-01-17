
org $888000


LayerBlending_Handler:
    PHP 
    SEP #$30 
    LDY.B #$00 
    LDX.W $1986 
    BEQ .powerBomb 
    JSR.W Initialize_LayerBlending 
    JSR.W (.pointers,X) 

.powerBomb:
    BIT.W $1987 
    BPL .xrayShowBlocks 
    JSR.W Handle_LayerBlending_PowerBomb 
    BRA .return 


.xrayShowBlocks:
    BIT.W $1987 
    BVC .xrayHideBlocks 
    JSR.W Handle_LayerBlending_Xray_CanShowBlocks 
    BRA .return 


.xrayHideBlocks:
    LDA.W $1987 
    BIT.B #$20 
    BEQ .xrayFirefleaRoom 
    JSR.W Handle_LayerBlending_Xray_CantShowBlocks 
    BRA .return 


.xrayFirefleaRoom:
    LDA.W $1987 
    BIT.B #$10 
    BEQ .return 
    JSR.W Handle_LayerBlending_Xray_FirefleaRoom 
    BRA .return ; >_<


.return:
    PLP 
    RTS 


.pointers:
    dw RTS_888074 
    dw RTS_888074 
    dw LayerBlending_4_Phantoon 
    dw UNUSED_LayerBlending_6_888099 
    dw LayerBlending_8_WreckedShipPowerOff 
    dw LayerBlending_A_Spores 
    dw LayerBlending_C_Fireflea 
    dw RTS_8880B7 
    dw LayerBlending_10_12_MorphBallEye_SuitPickup 
    dw LayerBlending_10_12_MorphBallEye_SuitPickup 
    dw LayerBlending_14_22_Water 
    dw LayerBlending_16_Water 
    dw LayerBlending_18_1E_30_Water_LavaAcid_Fog 
    dw LayerBlending_1A_Phantoon 
    dw LayerBlending_1C 
    dw LayerBlending_18_1E_30_Water_LavaAcid_Fog 
    dw RTS_88810C 
    dw LayerBlending_14_22_Water 
    dw LayerBlending_24_MotherBrain 
    dw LayerBlending_26 
    dw LayerBlending_28 
    dw LayerBlending_2A 
    dw LayerBlending_2C 
    dw LayerBlending_2E 
    dw LayerBlending_18_1E_30_Water_LavaAcid_Fog 
    dw LayerBlending_32 
    dw LayerBlending_34 

RTS_888074:
    RTS 


Initialize_LayerBlending:
    STZ.B $60 
    STZ.B $61 
    STZ.B $62 
    LDA.B #$13 : STA.B $69 
    LDA.B #$04 : STA.B $6B 
    STZ.B $6C 
    STZ.B $6D 
    LDA.B #$02 : STA.B $6E 
    LDA.B #$33 : STA.B $71 
    RTS 


LayerBlending_4_Phantoon:
    LDA.B #$11 : STA.B $69 
    LDA.B #$04 : STA.B $6B 
    RTS 


UNUSED_LayerBlending_6_888099:
    LDA.B #$14 : STA.B $6B 
    LDA.B #$27 : STA.B $71 
    RTS 


LayerBlending_8_WreckedShipPowerOff:
    LDA.B #$14 : STA.B $6B 
    LDA.B #$22 : STA.B $71 
    RTS 


LayerBlending_A_Spores:
    LDA.B #$32 : STA.B $71 
    RTS 


LayerBlending_C_Fireflea:
    STZ.B $6E 
    LDA.B #$A2 : STA.B $71 
    RTS 


RTS_8880B7:
    RTS 


LayerBlending_10_12_MorphBallEye_SuitPickup:
    LDA.B #$02 : STA.B $61 
    LDA.B #$20 : STA.B $62 
    LDA.B #$04 : STA.B $6D 
    RTS 


LayerBlending_14_22_Water:
    LDA.B #$B3 : STA.B $71 
    RTS 


LayerBlending_16_Water:
    LDY.B #$04 
    LDA.B #$11 : STA.B $69 
    LDA.B #$06 : STA.B $6B 
    LDA.B #$B1 : STA.B $71 
    RTS 


LayerBlending_1A_Phantoon:
    LDY.B #$04 
    LDA.B #$15 : STA.B $69 
    LDA.B #$02 : STA.B $6B 
    LDA.B #$35 : STA.B $71 
    RTS 


LayerBlending_1C:
    LDA.B #$15 : STA.B $69 
    LDA.B #$02 : STA.B $6B 
    LDA.B #$55 : STA.B $71 
    RTS 


LayerBlending_18_1E_30_Water_LavaAcid_Fog:
    LDY.B #$02 
    LDA.B $84 
    AND.B #$30 
    EOR.B #$30 
    BNE .return 
    LDA.B #$24 : STA.B $71 
    LDA.B #$13 : STA.B $6B 
    LDA.B #$04 : STA.B $69 

.return:
    RTS 


RTS_88810C:
    RTS 


LayerBlending_26:
    LDA.B #$77 : STA.B $71 
    RTS 


LayerBlending_28:
    STZ.B $6E 
    LDA.B #$B3 : STA.B $71 
    BIT.W $1987 
    BMI .return 
    LDA.B #$25 : STA.B $74 
    LDA.B #$40 : STA.B $75 
    LDA.B #$80 : STA.B $76 

.return:
    RTS 


LayerBlending_2A:
    STZ.B $6E 
    LDA.B #$B3 : STA.B $71 
    BIT.W $1987 
    BMI .return 
    LDA.B #$26 : STA.B $74 
    LDA.B #$42 : STA.B $75 
    LDA.B #$80 : STA.B $76 

.return:
    RTS 


LayerBlending_2C:
    STZ.B $6E 
    RTS 


LayerBlending_2E:
    LDA.B #$B3 : STA.B $71 
    RTS 


LayerBlending_32:
    LDA.B #$44 : STA.B $6B 
    LDA.B #$B2 : STA.B $71 
    RTS 


LayerBlending_34:
    LDY.B #$06 
    RTS 


LayerBlending_24_MotherBrain:
    LDA.B #$00 : STA.B $60 
    LDA.B #$02 : STA.B $61 
    LDA.B #$20 : STA.B $62 
    LDA.B #$13 : STA.B $69 
    LDA.B #$04 : STA.B $6B 
    LDA.B #$13 : STA.B $6C 
    LDA.B #$04 : STA.B $6D 
    LDA.B #$10 : STA.B $6E 
    LDA.B #$33 : STA.B $71 
    RTS 


Handle_LayerBlending_Xray_CanShowBlocks:
    LDA.B #$C8 : STA.B $60 
    LDA.B #$08 : STA.B $61 
    LDA.B #$80 : STA.B $62 
    LDA.B #$13 : STA.B $69 
    LDA.B #$04 : STA.B $6B 
    LDA.B #$03 : STA.B $6C 
    LDA.B #$04 : STA.B $6D 
    LDA.B #$22 : STA.B $6E 
    LDA.B $71 
    AND.B #$80 
    ORA.B #$73 
    STA.B $71 
    RTS 


Handle_LayerBlending_Xray_CantShowBlocks:
    STZ.B $60 
    LDA.B #$08 : STA.B $61 
    LDA.B #$80 : STA.B $62 
    LDA.B #$13 : STA.B $69 
    LDA.B #$04 : STA.B $6B 
    LDA.B #$03 : STA.B $6C 
    LDA.B #$04 : STA.B $6D 
    LDA.B #$22 : STA.B $6E 
    LDA.B $71 
    AND.B #$80 
    ORA.B #$61 
    STA.B $71 
    REP #$20 
    LDA.W $079B 
    CMP.W #RoomHeader_GlassTunnel 
    SEP #$20 
    BNE .return 
    LDA.B #$11 : STA.B $69 

.return:
    RTS 


Handle_LayerBlending_Xray_FirefleaRoom:
    STZ.B $60 
    LDA.B #$08 : STA.B $61 
    LDA.B #$80 : STA.B $62 
    LDA.B #$13 : STA.B $69 
    LDA.B #$04 
    STZ.B $6B 
    LDA.B #$03 : STA.B $6C 
    LDA.B #$04 : STA.B $6D 
    LDA.B #$20 : STA.B $6E 
    LDA.B #$B3 : STA.B $71 
    RTS 


Handle_LayerBlending_PowerBomb:
    REP #$30 
    LDA.W $079B 
    CMP.W #RoomHeader_Statues 
    SEP #$30 
    BNE + 
    LDY.B #$06 

  + TYX 
    JSR.W (.pointers,X) 
    RTS 


.pointers:
    dw Handle_LayerBlending_PowerBomb_0_2 
    dw Handle_LayerBlending_PowerBomb_0_2 
    dw Handle_LayerBlending_PowerBomb_4 
    dw Handle_LayerBlending_PowerBomb_6 

Handle_LayerBlending_PowerBomb_0_2:
    LDA.B #$00 : STA.B $60 
    LDA.B #$08 : STA.B $61 
    LDA.B #$80 : STA.B $62 
    LDA.B #$02 : STA.B $6E 
    LDA.B #$37 : STA.B $71 
    LDA.B #$00 : STA.B $6C 
    LDA.B #$04 : STA.B $6D 
    LDA.B #$13 : STA.B $69 
    LDA.B #$04 : STA.B $6B 
    RTS 


Handle_LayerBlending_PowerBomb_4:
    LDA.B #$80 : STA.B $60 
    LDA.B #$08 : STA.B $61 
    LDA.B #$80 : STA.B $62 
    LDA.B #$02 : STA.B $6E 
    LDA.B #$37 : STA.B $71 
    LDA.B #$00 : STA.B $6C 
    LDA.B #$06 : STA.B $6D 
    LDA.B #$11 : STA.B $69 
    LDA.B #$06 : STA.B $6B 
    RTS 


Handle_LayerBlending_PowerBomb_6:
    LDA.B #$00 : STA.B $60 
    LDA.B #$08 : STA.B $61 
    LDA.B #$80 : STA.B $62 
    LDA.B #$02 : STA.B $6E 
    LDA.B #$31 : STA.B $71 
    LDA.B #$00 : STA.B $6C 
    LDA.B #$04 : STA.B $6D 
    LDA.B #$13 : STA.B $69 
    LDA.B #$04 : STA.B $6B 
    RTS 


Enable_HDMAObjects:
    PHP 
    REP #$20 
    LDA.W #$8000 
    TSB.W $18B0 
    PLP 
    RTL 


Disable_HDMAObjects:
    PHP 
    REP #$20 
    LDA.W #$8000 
    TRB.W $18B0 
    PLP 
    RTL 


Wait_End_VBlank_Clear_HDMA:
    PHP 
    SEP #$20 
    JSL.L WaitUntilTheEndOfAVBlank 
    STZ.W $420B 
    STZ.W $420C 
    PLP ; fallthrough to Delete_HDMA_Objects

Delete_HDMAObjects:
    PHP 
    SEP #$20 
    STZ.B $85 
    REP #$30 
    PHX 
    LDX.W #$000A 

.loop:
    STZ.W $18B4,X 
    DEX #2
    BPL .loop 
    PLX 
    PLP 
    RTL 


Initialise_Special_Effects_for_New_Room:
    PHP 
    REP #$20 
    STZ.W $0607 
    STZ.W $0609 
    LDA.W $079B 
    CMP.W #RoomHeader_BombTorizo 
    BEQ .noEarthquakeSFX 
    CMP.W #RoomHeader_Climb 
    BEQ .noEarthquakeSFX 
    CMP.W #RoomHeader_Ridley 
    BEQ .noEarthquakeSFX 
    CMP.W #RoomHeader_Pillar 
    BEQ .noEarthquakeSFX 
    CMP.W #RoomHeader_MotherBrain 
    BEQ .noEarthquakeSFX 
    CMP.W #RoomHeader_TourianEscape4 
    BEQ .noEarthquakeSFX 
    BRA .earthquakeSFX 


.noEarthquakeSFX:
    LDA.W #$FFFF : STA.W $0609 

.earthquakeSFX:
    STZ.W $05F7 
    SEP #$30 
    LDX.B #$20 

.loopClearHDMARegisters:
    STZ.W $4300,X 
    LDA.B #$13 : STA.W $4301,X 
    STZ.W $4302,X 
    STZ.W $4303,X 
    STZ.W $4304,X 
    STZ.W $4305,X 
    STZ.W $4306,X 
    STZ.W $4308,X 
    STZ.W $4309,X 
    TXA 
    CLC 
    ADC.B #$10 
    TAX 
    CPX.B #$80 
    BNE .loopClearHDMARegisters 
    REP #$30 
    LDA.W #$FFFF 
    STZ.W $195C 
    STA.W $195E 
    STZ.W $1960 
    STA.W $1962 
    LDA.W #$0000 : STA.L $7ECAD8 
    STA.L $7ECADA 
    STA.L $7ECADC 
    STA.L $7ECADE 
    STZ.W $0783 
    STZ.W $0941 
    STZ.W $1E6F 
    STZ.W $1E6D 
    STZ.W $1840 
    STZ.W $1988 
    STZ.W $0592 
    STZ.W $0CEE 
    STZ.W $0CEA 
    STZ.W $1964 
    STZ.W $196E 
    LDA.W #$8000 : STA.W $1976 
    STZ.W $1978 
    STZ.W $197A 
    STZ.W $197C 
    STZ.W $197E 
    STZ.W $1980 
    STZ.W $1974 
    STZ.W $1970 
    STZ.W $1972 
    LDA.W #$0002 : STA.W $1982 
    STZ.B $B9 
    STZ.B $BB 
    STZ.W $0917 
    STZ.W $0919 
    STZ.B $A9 
    LDA.W #RTL_8883E1>>8&$FF00 : STA.W $0602 
    STA.W $0605 
    LDA.W #RTL_8883E1 : STA.W $0601 
    STA.W $0604 
    SEP #$20 
    LDA.B #$F0 : STA.W $2181 
    LDA.B #$FF : STA.W $2182 
    LDA.B #$01 : STA.W $2183 
    STZ.B $85 
    LDA.B #$20 : STA.B $74 
    LDA.B #$40 : STA.B $75 
    LDA.B #$80 : STA.B $76 
    STZ.B $57 
    LDA.B #$13 : STA.B $69 
    STZ.B $6F 
    STZ.B $72 
    STZ.B $5D 
    LDA.B #$04 : STA.B $5E 
    LDA.B #$49 : STA.B $59 
    LDA.B #$5A : STA.B $5A 
    STA.B $5B 
    PLP ; fallthrough to RTL_8883E1

RTL_8883E1:
    RTL 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_SpawnHDMAObject_Slot0_Channel4_Index20_8883E2:
    PHP 
    PHB 
    REP #$20 
    LDA.W #$0400 : STA.B $12 
    LDA.W #$0020 : STA.B $14 
    LDX.W #$0000 
    JMP.W SpawnHDMAObject_SlotX_Hardcoded 


UNUSED_SpawnHDMAObject_Slot8_Channel40_Index60_8883F6:
    PHP 
    PHB 
    REP #$20 
    LDA.W #$4000 : STA.B $12 
    LDA.W #$0060 : STA.B $14 
    LDX.W #$0008 
    JMP.W SpawnHDMAObject_SlotX_Hardcoded 
endif ; !FEATURE_KEEP_UNREFERENCED


SpawnHDMAObject_SlotA_Channel80_Index70:
    PHP 
    PHB 
    REP #$20 
    LDA.W #$8000 : STA.B $12 
    LDA.W #$0070 : STA.B $14 
    LDX.W #$000A 

SpawnHDMAObject_SlotX_Hardcoded:
    SEP #$20 
    LDA.B $05,S 
    PHA 
    PLB 
    XBA 
    LDA.B #$00 
    REP #$30 
    STA.B $18 
    LDA.B $03,S 
    TAY 
    INY 
    CLC 
    ADC.W #$0004 
    STA.B $03,S 
    JMP.W Spawn_HDMAObject_to_Slot_X 


Spawn_HDMAObject:
    PHP 
    PHB 
    SEP #$20 
    LDA.B $05,S 
    PHA 
    PLB 
    XBA 
    LDA.B #$00 
    REP #$30 
    STA.B $18 
    LDA.B $03,S 
    TAY 
    INY 
    CLC 
    ADC.W #$0004 
    STA.B $03,S 
    LDA.W #$0400 : STA.B $12 
    LDA.W #$0020 : STA.B $14 
    LDX.W #$0000 

.loop:
    LDA.W $18B4,X 
    BEQ Spawn_HDMAObject_to_Slot_X 
    ASL.B $12 
    BCS .returnFullArray 
    LDA.B $14 
    CLC 
    ADC.W #$0010 
    STA.B $14 
    INX #2
    CPX.W #$000C 
    BNE .loop 

.returnFullArray:
    PLB 
    PLP 
    SEC 
    RTL 


Spawn_HDMAObject_to_Slot_X:
    LDA.W #.return : STA.W $18F0,X 
    LDA.W #$0088 : STA.W $18FC,X 
    LDA.W $0002,Y : STA.W $18CC,X 
    LDA.W #$0001 : STA.W $18E4,X 
    STZ.W $1908,X 
    STZ.W $1914,X 
    STZ.W $1920,X 
    STZ.W $192C,X 
    STZ.W $1938,X 
    LDA.B $12 
    XBA 
    STA.W $18B4,X 
    LDA.B $14 
    ORA.B $18 
    STA.W $18C0,X 
    PHX 
    LDX.B $14 
    LDA.W $0000,Y : STA.W $4300,X 
    PLA 
    PLB 
    PLP 
    CLC 

  .return
    RTL 


HDMAObjectHandler_HandleMusicQueue:
    PHP 
    PHB 
    REP #$30 
    JSL.L HandleMusicQueue 
    LDA.W $0A78 
    BNE + 
    BIT.W $0592 
    BVC + 
    LDA.W #$8000 : STA.W $0592 
    JSL.L Spawn_HDMAObject 
    db $40,$28 
    dw InstList_PowerBombExplosion_Window2_LeftPosition 
    JSL.L Spawn_HDMAObject 
    db $40,$29 
    dw InstList_PowerBombExplosion_Window2_RightPosition 

  + PHK 
    PLB 
    REP #$30 
    LDA.W $1982 : STA.W $1986 
    BIT.W $18B0 
    BPL .return 
    SEP #$30 
    LDX.B #$00 
    STX.B $85 
    STX.W $18B3 

.loop:
    STX.W $18B2 
    LDA.W $18B4,X 
    BEQ .next 
    ORA.B $85 
    STA.B $85 
    JSR.W HDMAObject_Instruction_Handler 
    LDX.W $18B2 

.next:
    INX #2
    CPX.B #$0C 
    BNE .loop 
    JSR.W LayerBlending_Handler 
    PLB 
    PLP 
    RTL 

    STZ.B $85 ; dead code

.return:
    PLB 
    PLP 
    RTL 


HDMAObject_Instruction_Handler:
    REP #$20 
    LDA.W $18F0,X : STA.B $12 
    LDA.W $18FC,X : STA.B $14 
    PHK 
    PEA.W .manualReturn-1 
    JML.W [$0012] 


.manualReturn:
    SEP #$10 
    REP #$20 
    LDX.W $18B2 
    DEC.W $18E4,X 
    BNE .return 
    LDY.W $18C1,X 
    PHY 
    PLB 
    LDA.W $18CC,X 
    REP #$10 
    TAY 

.loop:
    LDA.W $0000,Y 
    BPL .timer 
    STA.B $12 
    INY #2
    PEA.W .loop-1 
    JMP.W ($0012) 


.timer:
    STA.W $18E4,X 
    TYA 
    CLC 
    ADC.W #$0004 
    STA.W $18CC,X 
    LDA.W $0002,Y : STA.W $18D8,X 

.return:
    SEP #$30 
    RTS 


Instruction_HDMAObject_Delete:
    STZ.W $18B4,X 
    PLA 
    SEP #$30 
    RTS 


Instruction_HDMAObject_PreInstructionInY:
    LDA.W $0000,Y : STA.W $18F0,X 
    SEP #$20 
    LDA.W $0002,Y : STA.W $18FC,X 
    REP #$20 
    INY #3
    RTS 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_Instruction_HDMAObject_ClearPreInstruction_888584:
    LDA.W #.return : STA.W $18F0,X 

  .return
    RTS 


UNUSED_Instruction_HDMAObject_CallFunctionY_88858B:
    LDA.W $0000,Y : STA.B $12 
    PHX 
    PHY 
    PEA.W .return-1 
    JMP.W ($0012) 


.return:
    PLY 
    PLX 
    INY #2
    RTS 


UNUSED_Instruction_HDMAObject_CallFunctionYWithA_88859D:
    LDA.W $0000,Y : STA.B $12 
    LDA.W $0002,Y 
    PHX 
    PHY 
    PEA.W .return-1 
    JMP.W ($0012) 


.return:
    PLY 
    PLX 
    INY #4
    RTS 
endif ; !FEATURE_KEEP_UNREFERENCED


Instruction_HDMAObject_CallExternalFunctionInY:
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


if !FEATURE_KEEP_UNREFERENCED
UNUSED_Instruction_HDMAObject_CallExternalFuncYWithA_8885CD:
    LDA.W $0000,Y : STA.B $12 
    LDA.W $0001,Y : STA.B $13 
    LDA.W $0003,Y 
    PHX 
    PHY 
    JSL.L .externalFunction 
    PLY 
    PLX 
    TYA 
    CLC 
    ADC.W #$0005 
    TAY 
    RTS 


.externalFunction:
    JML.W [$0012] 
endif ; !FEATURE_KEEP_UNREFERENCED


Instruction_HDMAObject_GotoY:
    LDA.W $0000,Y 
    TAY 
    RTS 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_Instruction_HDMAObject_GotoY_Y_8885F1:
    STY.B $12 
    DEY 
    LDA.W $0000,Y 
    XBA 
    BMI .highByte 
    AND.W #$00FF 
    BRA + 


.highByte:
    ORA.W #$FF00 

  + CLC 
    ADC.B $12 
    TAY 
    RTS 

    DEC.W $1908,X 
    BNE Instruction_HDMAObject_GotoY 
    INY #2
    RTS 


UNUSED_Instruction_HDMAObject_DecTimer_GotoYIfNonZero_88860F:
    DEC.W $1908,X 
    BNE UNUSED_Instruction_HDMAObject_GotoY_Y_8885F1 
    INY 
    RTS 


UNUSED_Instruction_HDMAObject_TimerInY_888616:
    SEP #$20 
    LDA.W $0000,Y : STA.W $1908,X 
    REP #$20 
    INY 
    RTS 


UNUSED_Instruction_HDMAObject_HDMAControlInY_888622:
    PHX 
    LDA.W $18C0,X 
    AND.W #$00FF 
    TAX 
    SEP #$20 
    LDA.W $0000,Y : STA.W $4300,X 
    REP #$20 
    PLX 
    INY 
    RTS 


UNUSED_Instruction_HDMAObject_HDMATargetInY:
    PHX 
    LDA.W $18C0,X 
    AND.W #$00FF 
    TAX 
    SEP #$20 
    LDA.W $0000,Y : STA.W $4301,X 
    REP #$20 
    PLX 
    INY 
    RTS 


UNUSED_Instruction_HDMAObject_HDMATablePointerInY_88864C:
    LDA.W $0000,Y : STA.W $18D8,X 
    INY #2
    RTS 
endif ; !FEATURE_KEEP_UNREFERENCED


Instruction_HDMAObject_HDMATableBank:
    PHX 
    LDA.W $18C0,X 
    AND.W #$00FF 
    TAX 
    SEP #$20 
    LDA.W $0000,Y : STA.W $4304,X 
    REP #$20 
    PLX 
    INY 
    RTS 


Instruction_HDMAObject_IndirectHDMATableBank:
    PHX 
    LDA.W $18C0,X 
    AND.W #$00FF 
    TAX 
    SEP #$20 
    LDA.W $0000,Y : STA.W $4307,X 
    REP #$20 
    PLX 
    INY 
    RTS 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_Instruction_HDMAObject_SkipNextInstruction_88867F:
    INY #2
    RTS 
endif ; !FEATURE_KEEP_UNREFERENCED


Instruction_HDMAObject_Sleep:
    DEY #2
    TYA 
    STA.W $18CC,X 
    PLA 
    SEP #$30 
    RTS 


RaiseOrLower_FX:
    LDA.W $197A 
    BMI .returnCarrySet 
    STZ.B $16 
    STZ.B $18 
    LDA.W $197C 
    BPL .lower 
    DEC.B $18 
    STA.B $17 
    LDA.W $1976 
    CLC 
    ADC.B $16 
    STA.W $1976 
    LDA.W $1978 
    ADC.B $18 
    BPL + 
    LDA.W #$0000 

  + STA.W $1978 
    LDA.W $197A 
    CMP.W $1978 
    BCC .return 
    STA.W $1978 
    STZ.W $1976 

.return:
    RTS 


.lower:
    STA.B $17 
    LDA.W $1976 
    CLC 
    ADC.B $16 
    STA.W $1976 
    LDA.W $1978 
    ADC.B $18 
    BPL + 
    LDA.W #$FFFF 

  + STA.W $1978 
    LDA.W $197A 
    CMP.W $1978 
    BCS .returnCarryClear 
    STA.W $1978 
    STZ.W $1976 
    SEC 
    RTS 


.returnCarryClear:
    CLC 
    RTS 


.returnCarrySet:
    SEC 
    RTS 


PreInstruction_Xray_Main:
    PHP 
    REP #$30 
    LDX.W #$1000 
    LDA.W $196E 
    CMP.W #$0024 
    BEQ + 
    LDX.W #$2000 
    JSL.L CheckIfXrayShouldShowAnyBlocks 
    BEQ + 
    LDX.W #$4000 
    LDA.W #$0027 : STA.B $74 
    LDA.W #$0047 : STA.B $75 
    LDA.W #$0087 : STA.B $76 

  + TXA 
    TSB.W $1986 
    LDA.W $0A7A 
    ASL A 
    TAX 
    JSR.W (.pointers,X) 
    PLP 
    RTL 


.pointers:
    dw HandleXrayScope_State0_NoBeam 
    dw HandleXrayScope_State1_BeamIsWidening 
    dw HandleXrayScope_State2_FullBeam 
    dw HandleXrayScope_State3_DeactivateBeam_RestoreBG2_FirstHalf 
    dw HandleXrayScope_State4_DeactivateBeam_RestoreBG2_SecondHalf 
    dw HandleXrayScope_State5_DeactivateBeam_Finish 

HandleXrayScope_State0_NoBeam:
    PHP 
    REP #$30 
    LDA.B $8B 
    BIT.W $09B6 
    BNE .calculateHDMATable 
    LDA.W #$0003 : STA.W $0A7A 
    BRA .return 


.calculateHDMATable:
    JSR.W Calculate_Xray_HDMADataTable 
    LDA.W $0A7A 
    INC A 
    STA.W $0A7A 
    JSR.W RTS_888753 

.return:
    PLP 
    RTS 


RTS_888753:
    RTS 


HandleXrayScope_State1_BeamIsWidening:
    PHP 
    REP #$30 
    LDA.B $8B 
    BIT.W $09B6 
    BNE + 
    LDA.W #$0003 : STA.W $0A7A 
    BRA .return 


  + JSR.W RTS_888753 
    REP #$20 
    LDA.W $0A7E 
    CLC 
    ADC.W #$0800 
    STA.W $0A7E 
    LDA.W $0A7C 
    ADC.W #$0000 
    STA.W $0A7C 
    LDA.W $0A86 
    CLC 
    ADC.W $0A7E 
    STA.W $0A86 
    LDA.W $0A84 
    ADC.W $0A7C 
    STA.W $0A84 
    CMP.W #$000B 
    BMI .calculateHDMATable 
    STZ.W $0A86 
    LDA.W #$000A : STA.W $0A84 
    LDA.W $0A7A 
    INC A 
    STA.W $0A7A 

.calculateHDMATable:
    JSR.W Calculate_Xray_HDMADataTable 

.return:
    PLP 
    RTS 


HandleXrayScope_State2_FullBeam:
    PHP 
    REP #$30 
    LDA.B $8B 
    BIT.W $09B6 
    BEQ .state3 
    JSR.W HandleMovingXray_UpDown 
    JSR.W Calculate_Xray_HDMADataTable 
    JSR.W RTS_888753 
    PLP 
    RTS 


.state3:
    INC.W $0A7A 
    PLP 
    RTS 


HandleMovingXray_UpDown:
    PHP 
    REP #$30 
    LDA.B $8B 
    BIT.W $09AA 
    BNE .up 
    BIT.W $09AC 
    BNE .down 
    BRA .return 


.up:
    JSR.W MoveXray_Up 
    BRA .return 


.down:
    JSR.W MoveXray_Down 

.return:
    PLP 
    RTS 


MoveXray_Up:
    PHP 
    REP #$30 
    LDA.W $0A82 
    CMP.W #$0080 
    BPL .facingLeft 
    SEC 
    SBC.W $0A84 
    BEQ .return 
    BMI .setAngularWidth 
    LDA.W $0A82 
    SEC 
    SBC.W #$0001 
    STA.W $0A82 
    SBC.W $0A84 
    BPL .return 

.setAngularWidth:
    LDA.W $0A84 : STA.W $0A82 
    BRA .return 


.facingLeft:
    CLC 
    ADC.W $0A84 
    CMP.W #$0100 
    BEQ .return 
    BPL .max100 
    LDA.W $0A82 
    CLC 
    ADC.W #$0001 
    STA.W $0A82 
    ADC.W $0A84 
    CMP.W #$0100 
    BEQ .return 
    BMI .return 

.max100:
    LDA.W #$0100 
    SEC 
    SBC.W $0A84 
    STA.W $0A82 

.return:
    PLP 
    RTS 


MoveXray_Down:
    PHP 
    REP #$30 
    LDA.W $0A82 
    CMP.W #$0080 
    BPL .facingLeft 
    CLC 
    ADC.W $0A84 
    CMP.W #$0080 
    BEQ .return 
    BPL .setAngularWidth 
    LDA.W $0A82 
    CLC 
    ADC.W #$0001 
    STA.W $0A82 
    ADC.W $0A84 
    CMP.W #$0080 
    BEQ .return 
    BMI .return 

.setAngularWidth:
    LDA.W #$0080 
    SEC 
    SBC.W $0A84 
    STA.W $0A82 
    BRA .return 


.facingLeft:
    SEC 
    SBC.W $0A84 
    CMP.W #$0080 
    BEQ .return 
    BMI + 
    LDA.W $0A82 
    SEC 
    SBC.W #$0001 
    STA.W $0A82 
    SBC.W $0A84 
    CMP.W #$0080 
    BEQ .return 
    BPL .return 

  + LDA.W #$0080 
    CLC 
    ADC.W $0A84 
    STA.W $0A82 

.return:
    PLP 
    RTS 


Calculate_Xray_HDMADataTable:
    PHP 
    REP #$30 
    LDA.W #$7E00 : STA.B $01 
    LDA.W #$9800 ; $7E
    STA.B $00 
    LDA.W $0A82 : STA.B $12 
    LDA.W $0A84 : STA.B $14 
    LDA.W $0A1E 
    AND.W #$00FF 
    CMP.W #$0004 
    BEQ .facingLeft 
    LDA.W $0AF6 
    SEC 
    SBC.W $0911 
    CLC 
    ADC.W #$0003 
    TAX 
    BRA .checkMovement 


.facingLeft:
    LDA.W $0AF6 
    SEC 
    SBC.W $0911 
    SBC.W #$0003 
    TAX 

.checkMovement:
    LDA.W $0A1F 
    AND.W #$00FF 
    CMP.W #$0005 
    BEQ .crouching 
    LDA.W $0AFA 
    SEC 
    SBC.W $0915 
    SBC.W #$0010 
    TAY 
    BRA .checkScreenPosition 


.crouching:
    LDA.W $0AFA 
    SEC 
    SBC.W $0915 
    SBC.W #$000C 
    TAY 

.checkScreenPosition:
    CPX.W #$0000 
    BMI .leftOfScreen 
    CPX.W #$0100 
    BMI .onScreen 
    LDA.W $0A1E 
    AND.W #$00FF 
    CMP.W #$0008 
    BEQ .offScreen 
    BRA .onScreenFromOffScreen 


.leftOfScreen:
    LDA.W $0A1E 
    AND.W #$00FF 
    CMP.W #$0004 
    BEQ .offScreen 
    BRA .onScreenFromOffScreen 


.onScreen:
    JSL.L Calc_Xray_HDMADataTable_OnScreen 
    PLP 
    RTS 


.onScreenFromOffScreen:
    JSL.L Calc_Xray_HDMADataTable_OffScreen 
    PLP 
    RTS 


.offScreen:
    LDX.W #$01FE 
    LDA.W #$00FF 

.loop:
    STA.L $7E9800,X 
    DEX #2
    BPL .loop 
    PLP 
    RTS 


HandleXrayScope_State3_DeactivateBeam_RestoreBG2_FirstHalf:
    PHP 
    REP #$30 
    LDA.W #$0001 : STA.W $0A88 
    LDA.W #$9800 ; $7E
    STA.W $0A89 
    STZ.W $0A8B 
    STZ.W $0A8C 
    STZ.W $0A8E 
    STZ.W $0A90 
    LDA.W #$00FF : STA.L $7E9800 
    LDX.W #$1000 
    LDA.W $196E 
    CMP.W #$0024 
    BEQ + 
    LDX.W #$2000 
    JSL.L CheckIfXrayShouldShowAnyBlocks 
    BEQ + 
    LDX.W #$4000 

  + TXA 
    TSB.W $1986 
    LDA.W #$0000 : STA.L $7EC000 
    LDX.W $18B2 
    LDA.W $1914,X : STA.B $B5 
    LDA.W $1920,X : STA.B $B7 
    SEP #$20 
    LDA.W $192C,X : STA.B $59 
    REP #$20 
    LDX.W $0330 
    CPX.W #$00F0 
    BPL .return 
    LDA.W #$0800 : STA.B $D0,X 
    LDA.W #$5000 : STA.B $D2,X 
    LDA.W #$007E : STA.B $D4,X 
    LDA.B $59 
    AND.W #$00FC 
    XBA 
    STA.B $D5,X 
    TXA 
    CLC 
    ADC.W #$0007 
    STA.W $0330 
    INC.W $0A7A 

.return:
    PLP 
    RTS 


HandleXrayScope_State4_DeactivateBeam_RestoreBG2_SecondHalf:
    PHP 
    REP #$30 
    LDX.W #$1000 
    LDA.W $196E 
    CMP.W #$0024 
    BEQ + 
    LDX.W #$2000 
    JSL.L CheckIfXrayShouldShowAnyBlocks 
    BEQ + 
    LDX.W #$4000 

  + TXA 
    TSB.W $1986 
    LDX.W $0330 
    CPX.W #$00F0 
    BPL .return 
    LDA.W #$0800 : STA.B $D0,X 
    LDA.W #$5800 : STA.B $D2,X 
    LDA.W #$007E : STA.B $D4,X 
    LDA.B $59 
    AND.W #$00FC 
    XBA 
    CLC 
    ADC.W #$0400 
    STA.B $D5,X 
    TXA 
    CLC 
    ADC.W #$0007 
    STA.W $0330 
    INC.W $0A7A 

.return:
    PLP 
    RTS 


HandleXrayScope_State5_DeactivateBeam_Finish:
    PHP 
    REP #$30 
    LDX.W #$1000 
    LDA.W $196E 
    CMP.W #$0024 
    BEQ + 
    LDX.W #$2000 
    JSL.L CheckIfXrayShouldShowAnyBlocks 
    BEQ + 
    LDX.W #$4000 

  + TXA 
    TSB.W $1986 
    LDA.W $0A78 
    BNE .timeIsFrozen 
    PLP 
    RTS 


.timeIsFrozen:
    STZ.W $0A78 
    STZ.W $0A7A 
    STZ.W $0A7C 
    STZ.W $0A7E 
    STZ.W $0A82 
    STZ.W $0A84 
    STZ.W $0A86 
    LDA.W #$0001 : STA.W $0A88 
    LDA.W #$9800 ; $7E
    STA.W $0A89 
    STZ.W $0A8B 
    STZ.W $0A8C 
    STZ.W $0A8E 
    STZ.W $0A90 
    JSL.L Set_NonXray_SamusPose 
    LDX.W $18B2 
    STZ.W $18B4,X 
    LDA.W #$000A 
    JSL.L QueueSound_Lib1_Max6 
    SEP #$20 
    LDA.W $196E 
    CMP.B #$24 
    BEQ + 
    LDA.B #$80 : STA.B $76 
    LDA.B #$40 : STA.B $75 
    LDA.B #$20 : STA.B $74 

  + LDA.B #$7E : STA.B $02 
    REP #$20 
    LDA.W #$9800 ; $7E
    STA.B $00 
    LDY.W #$01FE 
    LDA.W #$00FF 

.loop:
    STA.B [$00],Y 
    DEY #2
    BPL .loop 
    LDA.W $0A04 
    BEQ .return 
    STZ.W $09D2 
    STZ.W $0A04 

.return:
    PLP 
    RTS 


Spawn_PowerBombExplosion:
    LDA.W $0A78 
    BNE .pending 
    LDA.W #$0001 
    JSL.L QueueSound 
    LDA.W #$8000 : STA.W $0592 
    JSL.L Spawn_HDMAObject 
    db $40,$28 
    dw InstList_PowerBombExplosion_Window2_LeftPosition 
    JSL.L Spawn_HDMAObject 
    db $40,$29 
    dw InstList_PowerBombExplosion_Window2_RightPosition 
    RTL 


.pending:
    LDA.W #$4000 : STA.W $0592 
    RTL 


InstList_PowerBombExplosion_Window2_LeftPosition:
    dw Instruction_HDMAObject_HDMATableBank : db $89 
    dw Instruction_HDMAObject_IndirectHDMATableBank : db $7E 
    dw Instruction_HDMAObject_CallExternalFunctionInY 
    dl PowerBombExplosion_Setup1_PreExplosion_White 
    dw Instruction_HDMAObject_PreInstructionInY 
    dl PreInstruction_PowerBombExplosion_1_PreExplosion_White 
    dw Instruction_HDMAObject_Sleep 
    dw Instruction_HDMAObject_CallExternalFunctionInY 
    dl PowerBombExplosion_Setup2_PreExplosion_Yellow 
    dw Instruction_HDMAObject_PreInstructionInY 
    dl PreInstruction_PowerBombExplosion_2_PreExplosion_Yellow 
    dw Instruction_HDMAObject_Sleep 
    dw Instruction_HDMAObject_CallExternalFunctionInY 
    dl PowerBombExplosion_Setup3_Explosion_Yellow 
    dw Instruction_HDMAObject_PreInstructionInY 
    dl PreInstruction_PowerBombExplosion_3_Explosion_Yellow 
    dw Instruction_HDMAObject_Sleep 
    dw Instruction_HDMAObject_CallExternalFunctionInY 
    dl PowerBombExplosion_Setup4_Explosion_White 
    dw Instruction_HDMAObject_PreInstructionInY 
    dl PreInstruction_PowerBombExplosion_4_Explosion_White 
    dw Instruction_HDMAObject_Sleep 
    dw Instruction_HDMAObject_PreInstructionInY 
    dl PreInstruction_PowerBombExplosion_5_AfterGlow 
    dw Instruction_HDMAObject_Sleep 
    dw Instruction_HDMAObject_CallExternalFunctionInY 
    dl PowerBombExplosion_ClearnUp_TryCrystalFlash 
    dw Instruction_HDMAObject_Sleep 
    dw Instruction_HDMAObject_Delete 

PowerBombExplosion_Setup1_PreExplosion_White:
    SEP #$20 
    LDA.B #$FF : STA.L $7EC606 
    LDA.B #$00 : STA.L $7EC607 
    REP #$20 
    LDA.W #$0400 : STA.W $0CEC 
    LDA.L PowerBomb_PreExplosion_InitialRadiusSpeed : STA.W $0CF0 
    RTL 


PowerBombExplosion_Setup2_PreExplosion_Yellow:
    LDA.W #PowerBomb_PreExplosion_ShapeDefinitionTables_PreScaled : STA.W $0CF2 
    RTL 


PowerBombExplosion_Setup3_Explosion_Yellow:
    LDA.W #$0400 : STA.W $0CEA 
    LDA.L PowerBombExplosion_InitialRadiusSpeed : STA.W $0CF0 
    RTL 


PowerBombExplosion_Setup4_Explosion_White:
    LDA.W #PowerBomb_Explosion_ShapeDefinitionTiles_PreScaled : STA.W $0CF2 
    RTL 


PowerBombExplosion_ClearnUp_TryCrystalFlash:
    LDA.W $0AF6 
    CMP.W $0CE2 
    BNE .clearPBFlag 
    LDA.W $0AFA 
    CMP.W $0CE4 
    BNE .clearPBFlag 
    PHX 
    JSL.L CrystalFlash 
    PLX 
    BCC .crystalFlashing 

.clearPBFlag:
    STZ.W $0CEE 

.crystalFlashing:
    STZ.W $0592 
    STZ.W $18B4,X 
    STZ.W $18B6,X 
    STZ.W $0CEC 
    STZ.W $0CEA 
    LDA.W #$001E 
    JSL.L Run_Samus_Command 
    RTL 


InstList_PowerBombExplosion_Window2_RightPosition:
    dw Instruction_HDMAObject_HDMATableBank : db $89 
    dw Instruction_HDMAObject_IndirectHDMATableBank : db $7E 
    dw Instruction_HDMAObject_PreInstructionInY 
    dl PreInstruction_PowerBombExplosion_SetLayerBlendingWindow2 
    dw Instruction_HDMAObject_Sleep 
    dw Instruction_HDMAObject_Delete 

PreInstruction_PowerBombExplosion_SetLayerBlendingWindow2:
    LDA.W #$8000 
    TSB.W $1986 
    RTL 


PowerBomb_Stage5_HDMAObjectTimer:
    dw $0003 

PreInstruction_PowerBombExplosion_5_AfterGlow:
    LDA.W $0592 
    BMI .exploding 
    RTL 


.exploding:
    DEC.W $1908,X 
    BPL .return 
    SEP #$20 
    DEC.W $1938,X 
    BEQ .wake 
    LDA.W $0074 
    AND.B #$1F 
    BEQ .green 
    DEC A 
    ORA.B #$20 
    STA.W $0074 

.green:
    LDA.W $0075 
    AND.B #$1F 
    BEQ .blue 
    DEC A 
    ORA.B #$40 
    STA.W $0075 

.blue:
    LDA.W $0076 
    AND.B #$1F 
    BEQ .setTimer 
    DEC A 
    ORA.B #$80 
    STA.W $0076 

.setTimer:
    LDA.L PowerBomb_Stage5_HDMAObjectTimer : STA.W $1908,X 
    REP #$20 

.return:
    RTL 


.wake:
    REP #$20 
    LDA.W #$0001 : STA.W $18E4,X 
    INC.W $18CC,X 
    INC.W $18CC,X 
    RTL 


Calc_PowerBombExplo_HDMADataTables_PreScaled_LeftOfScreen:
    LDA.W $0CE6 
    CLC 
    ADC.W $0000,Y 
    BCS + 
    LDA.B #$00 : STA.L $7EC506,X 
    INC A 
    STA.L $7EC406,X 
    BRA .next 


  + STA.L $7EC506,X 
    LDA.B #$00 : STA.L $7EC406,X 

.next:
    INY 
    INX 
    CPX.W #$00C0 
    BNE Calc_PowerBombExplo_HDMADataTables_PreScaled_LeftOfScreen 
    RTS 


Calculate_PowerBombExplo_HDMADataTables_PreScaled_OnScreen:
    LDA.W $0000,Y 
    BEQ .return 
    CLC 
    ADC.W $0CE6 
    BCC + 
    LDA.B #$FF 

  + STA.L $7EC506,X 
    LDA.W $0CE6 
    SEC 
    SBC.W $0000,Y 
    BCS .storeTable 
    LDA.B #$00 

.storeTable:
    STA.L $7EC406,X 
    INY 
    INX 
    CPX.W #$00C0 
    BNE Calculate_PowerBombExplo_HDMADataTables_PreScaled_OnScreen 

.return:
    RTS 


Calc_PowerBombExplo_HDMADataTables_PreScaled_RightOfScreen:
    LDA.W $0CE6 
    SEC 
    SBC.W $0000,Y 
    BCC + 
    LDA.B #$FF : STA.L $7EC406,X 
    DEC A 
    STA.L $7EC506,X 
    BRA .next 


  + STA.L $7EC406,X 
    LDA.B #$FF : STA.L $7EC506,X 

.next:
    INY 
    INX 
    CPX.W #$00C0 
    BNE Calc_PowerBombExplo_HDMADataTables_PreScaled_RightOfScreen 
    RTS 


Calculate_PowerBombExplosion_HDMADataTablePointers:
    LDA.W $0592 
    BMI .exploding 
    RTL 


.exploding:
    LDA.W $0CE2 
    SEC 
    SBC.W $0911 
    CLC 
    ADC.W #$0100 
    CMP.W #$0300 
    BCC + 
    BRA .offScreen 


  + STA.W $0CE6 
    LDA.W $0CE4 
    SEC 
    SBC.W $0915 
    CLC 
    ADC.W #$0100 
    CMP.W #$0300 
    BCC .onScreen 

.offScreen:
    LDA.W #$0000 

.onScreen:
    EOR.W #$03FF 
    SEC 
    SBC.W #$0100 
    STA.W $0CE8 
    LDA.W $0CEA 
    AND.W #$FF00 
    BNE + 
    STZ.W $0CE8 

  + LDA.W $18C0,X 
    AND.W #$00FF 
    TAY 
    LDA.W $0CE8 
    ASL A 
    CLC 
    ADC.W $0CE8 
    STA.B $16 
    ADC.W #IndirectHDMATable_PowerBombExplosionWindow2_Left_200below 
    STA.W $18D8,X 
    LDA.B $16 
    CLC 
    ADC.W #IndirectHDMATable_PowerBombExplosionWindow2_Right_200below 
    STA.W $18DA,X 
    RTL 


Calculate_PowerBombExplo_HDMADataTables_Scaled_LeftOfScreen:
    LDA.W PowerBomb_ShapeDefinitionTiles_Optimization_A226,Y : STA.W $4203 
    NOP #3
    LDA.W $4217 : STA.B $14 
    LDA.W PowerBomb_ShapeDefinitionTiles_Optimization_A206,Y : STA.W $4203 
    NOP 
    LDA.W $0CE6 
    CLC 
    ADC.W $4217 
    BCS .moveToHighByte 
    LDA.B #$00 
    XBA 
    LDA.B #$FF 
    BRA .loopDataTable 


.moveToHighByte:
    XBA 
    LDA.B #$00 

.loopDataTable:
    STA.L $7EC406,X 
    XBA 
    STA.L $7EC506,X 
    XBA 
    CPX.B $14 
    BEQ .nextShapeDefinite 
    DEX 
    JMP.W .loopDataTable 


.nextShapeDefinite:
    INY 
    BPL Calculate_PowerBombExplo_HDMADataTables_Scaled_LeftOfScreen 
    RTS 


Calculate_PowerBombExplosion_HDMADataTables_Scaled_OnScreen:
    LDA.W PowerBomb_ShapeDefinitionTiles_Optimization_A226,Y : STA.W $4203 
    NOP #3
    LDA.W $4217 : STA.B $14 
    LDA.W PowerBomb_ShapeDefinitionTiles_Optimization_A206,Y : STA.W $4203 
    NOP 
    LDA.W $0CE6 
    CLC 
    ADC.W $4217 
    BCC .lowByte 
    LDA.B #$FF 

.lowByte:
    XBA 
    LDA.W $0CE6 
    SEC 
    SBC.W $4217 
    BCS .loopDataTable 
    LDA.B #$00 

.loopDataTable:
    STA.L $7EC406,X 
    XBA 
    STA.L $7EC506,X 
    XBA 
    CPX.B $14 
    BEQ .next 
    DEX 
    JMP.W .loopDataTable 


.next:
    INY 
    BPL Calculate_PowerBombExplosion_HDMADataTables_Scaled_OnScreen 
    RTS 


Calculate_PowerBombExplo_HDMADataTables_Scaled_RightOfScreen:
    LDA.W PowerBomb_ShapeDefinitionTiles_Optimization_A226,Y : STA.W $4203 
    NOP #3
    LDA.W $4217 : STA.B $14 
    LDA.W PowerBomb_ShapeDefinitionTiles_Optimization_A206,Y : STA.W $4203 
    NOP 
    LDA.W $0CE6 
    SEC 
    SBC.W $4217 
    BCC .lessThan100 
    LDA.B #$FF 
    XBA 
    LDA.B #$00 
    BRA + 


.lessThan100:
    XBA 
    LDA.B #$FF 

  + XBA 

.loopDataTable:
    STA.L $7EC406,X 
    XBA 
    STA.L $7EC506,X 
    XBA 
    CPX.B $14 
    BEQ .nextShapeDefinition 
    DEX 
    JMP.W .loopDataTable 


.nextShapeDefinition:
    INY 
    BPL Calculate_PowerBombExplo_HDMADataTables_Scaled_RightOfScreen 
    RTS 


PowerBombExplosion_Colors:
; Indexed by [power bomb explosion radius] / 800h
; Red, green, blue. Range 0..1Fh
; Yellow section
  .red
    db $0E 
  .green
    db     $0E 
  .blue
    db         $0A 
    db $0F,$0F,$09
    db $10,$10,$08
    db $11,$11,$07
    db $12,$12,$06
    db $13,$13,$05
    db $14,$14,$04
    db $15,$15,$03
    db $16,$16,$02
    db $17,$17,$01
    db $18,$18,$00
    db $19,$19,$00
    db $1A,$1A,$00
    db $1A,$1A,$00
; White section
    db $1A,$1A,$1A
    db $1A,$1A,$1A
    db $1B,$1B,$1B
    db $1B,$1B,$1B
    db $1C,$1C,$1C
    db $1B,$1B,$1B
    db $1A,$1A,$1A
    db $1A,$18,$18
    db $1A,$17,$17
    db $19,$16,$16
    db $18,$15,$15
    db $17,$15,$15
    db $16,$14,$14
    db $15,$13,$13
    db $12,$10,$10
    db $12,$0E,$0E
    db $12,$0D,$0D
    db $12,$0D,$0D

PowerBombExplosion_InitialRadiusSpeed:
    dw $0000 

PowerBombExplosion_RadiusAcceleration:
    dw $0030 

PreInstruction_PowerBombExplosion_3_Explosion_Yellow:
    LDA.W $0592 
    BMI .exploding 
    RTL 


.exploding:
    PHP 
    PHB 
    REP #$30 
    PHX 
    PHY 
    JSL.L Calculate_PowerBombExplosion_HDMADataTablePointers 
    PEA.W $8800 
    PLB 
    PLB 
    SEP #$30 
    LDA.B #$00 
    XBA 
    LDY.B #$60 
    LDA.W $0CEB : STA.W $4202 
    LDA.W PowerBombExplosion_ShapeDefinitionTable_Unscaled_topOffset : STA.W $4203 
    NOP #3
    LDA.W $4217 : STA.B $12 
    TAX 
    PEA.W .loopPadDataTableBegin-1 
    LDA.W $0CE7 
    AND.B #$FF 
    BEQ .offScreenLeft 
    DEC A 
    BEQ .onScreen 
    JMP.W Calculate_PowerBombExplo_HDMADataTables_Scaled_RightOfScreen 


.onScreen:
    JMP.W Calculate_PowerBombExplosion_HDMADataTables_Scaled_OnScreen 


.offScreenLeft:
    JMP.W Calculate_PowerBombExplo_HDMADataTables_Scaled_LeftOfScreen 


.loopPadDataTableBegin:
    STA.L $7EC406,X 
    XBA 
    STA.L $7EC506,X 
    XBA 
    DEX 
    BPL .loopPadDataTableBegin 
    LDX.B $12 
    INX 
    CPX.B #$C0 
    BEQ .finishedTable 
    LDA.B #$FF 

.loopPadDataTableEnd:
    STA.L $7EC406,X 
    INC A 
    STA.L $7EC506,X 
    DEC A 
    INX 
    CPX.B #$C0 
    BNE .loopPadDataTableEnd 

.finishedTable:
    LDA.W $0CEB 
    LSR #3
    AND.B #$1F 
    STA.B $12 
    ASL A 
    CLC 
    ADC.B $12 
    TAX 
    LDA.L PowerBombExplosion_Colors_red,X 
    ORA.B #$20 
    STA.W $0074 ; >.<
    LDA.L PowerBombExplosion_Colors_green,X 
    ORA.B #$40 
    STA.W $0075 ; >.<
    LDA.L PowerBombExplosion_Colors_blue,X 
    ORA.B #$80 
    STA.W $0076 ; >.<
    REP #$30 
    PLY 
    PLX 
    LDA.W $0CEA 
    CLC 
    ADC.W $0CF0 
    STA.W $0CEA 
    CMP.W #$8600 
    BCC .lessThan8600 
    LDA.W #$0001 : STA.W $18E4,X 
    INC.W $18CC,X 
    INC.W $18CC,X 
    STZ.W $1908,X 
    JMP.W .return 


.lessThan8600:
    LDA.W $0CF0 
    CLC 
    ADC.L PowerBombExplosion_RadiusAcceleration 
    STA.W $0CF0 

.return:
    PLB 
    PLP 
    RTL 


PreInstruction_PowerBombExplosion_4_Explosion_White:
    LDA.W $0592 
    BMI .exploding 
    RTL 


.exploding:
    PHP 
    PHB 
    REP #$30 
    PHX 
    PHY 
    JSL.L Calculate_PowerBombExplosion_HDMADataTablePointers 
    PEA.W $8800 
    PLB 
    PLB 
    LDY.W $0CF2 
    LDX.W #$0000 
    SEP #$20 
    PEA.W .manualReturn-1 
    LDA.W $0CE7 
    AND.B #$FF 
    BEQ .offScreenLeft 
    DEC A 
    BEQ .onScreen 
    JMP.W Calc_PowerBombExplo_HDMADataTables_PreScaled_RightOfScreen 


.onScreen:
    JMP.W Calculate_PowerBombExplo_HDMADataTables_PreScaled_OnScreen 


.offScreenLeft:
    JMP.W Calc_PowerBombExplo_HDMADataTables_PreScaled_LeftOfScreen 


.manualReturn:
    SEP #$30 
    LDA.B #$00 
    XBA 
    LDA.W $0CEB 
    LSR #3
    AND.B #$1F 
    STA.B $12 
    ASL A 
    CLC 
    ADC.B $12 
    TAX 
    LDA.L PowerBombExplosion_Colors_red,X 
    ORA.B #$20 
    STA.W $0074 ; >.<
    LDA.L PowerBombExplosion_Colors_green,X 
    ORA.B #$40 
    STA.W $0075 ; >.<
    LDA.L PowerBombExplosion_Colors_blue,X 
    ORA.B #$80 
    STA.W $0076 ; >.<
    REP #$30 
    PLY 
    PLX 
    LDA.W $0CF2 
    CLC 
    ADC.W #$00C0 
    STA.W $0CF2 
    CMP.W #PowerBomb_PreExplosion_ShapeDefinitionTables_PreScaled 
    BNE .notPreExplosion 
    LDA.W #$0001 : STA.W $18E4,X 
    INC.W $18CC,X 
    INC.W $18CC,X 
    STZ.W $1908,X 
    LDA.W #$0020 : STA.W $1938,X 

.notPreExplosion:
    LDA.W $0CEA 
    CLC 
    ADC.W $0CF0 
    BCS .return 
    STA.W $0CEA 
    LDA.W $0CF0 
    CLC 
    ADC.L PowerBombExplosion_RadiusAcceleration 
    STA.W $0CF0 

.return:
    PLB 
    PLP 
    RTL 


Calculate_PowerBombPreExplosion_HDMAObjectTablePointers:
    LDA.W $0592 
    BMI .exploding 
    RTL 


.exploding:
    LDA.W $0CE2 
    SEC 
    SBC.W $0911 
    CLC 
    ADC.W #$0100 
    CMP.W #$0300 
    BCC + 
    BRA .offScreen 


  + STA.W $0CE6 
    LDA.W $0CE4 
    SEC 
    SBC.W $0915 
    CLC 
    ADC.W #$0100 
    CMP.W #$0300 
    BCC .onScreen 

.offScreen:
    LDA.W #$0000 

.onScreen:
    EOR.W #$03FF 
    SEC 
    SBC.W #$0100 
    STA.W $0CE8 
    LDA.W $0CEC 
    AND.W #$FF00 
    BNE + 
    STZ.W $0CE8 

  + LDA.W $18C0,X 
    AND.W #$00FF 
    TAY 
    LDA.W $0CE8 
    ASL A 
    CLC 
    ADC.W $0CE8 
    STA.B $16 
    ADC.W #IndirectHDMATable_PowerBombExplosionWindow2_Left_200below 
    STA.W $18D8,X 
    LDA.B $16 
    CLC 
    ADC.W #IndirectHDMATable_PowerBombExplosionWindow2_Right_200below 
    STA.W $18DA,X 
    RTL 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_CalcPowerBombRelatedHDMATables_Scaled_Left_888FBA:
    LDA.W PowerBomb_ShapeDefinitionTiles_Optimization_A226,Y : STA.W $4203 
    NOP #3
    LDA.W $4217 : STA.B $14 
    LDA.W PowerBomb_ShapeDefinitionTiles_Optimization_A206,Y : STA.W $4203 
    NOP 
    LDA.W $0CE6 
    CLC 
    ADC.W $4217 
    BCS + 
    LDA.B #$00 
    XBA 
    LDA.B #$FF 
    BRA .loop 


  + XBA 
    LDA.B #$00 

.loop:
    STA.L $7EC406,X 
    XBA 
    STA.L $7EC506,X 
    XBA 
    CPX.B $14 
    BEQ .next 
    DEX 
    JMP.W .loop 


.next:
    INY 
    BPL UNUSED_CalcPowerBombRelatedHDMATables_Scaled_Left_888FBA 
    RTS 


UNUSED_CalcPBRelatedHDMADataTables_Scaled_OnScreen_888FF8:
    LDA.W PowerBomb_ShapeDefinitionTiles_Optimization_A226,Y : STA.W $4203 
    NOP #3
    LDA.W $4217 : STA.B $14 
    LDA.W PowerBomb_ShapeDefinitionTiles_Optimization_A206,Y : STA.W $4203 
    NOP 
    LDA.W $0CE6 
    CLC 
    ADC.W $4217 
    BCC + 
    LDA.B #$FF 

  + XBA 
    LDA.W $0CE6 
    SEC 
    SBC.W $4217 
    BCS .loop 
    LDA.B #$00 

.loop:
    STA.L $7EC406,X 
    XBA 
    STA.L $7EC506,X 
    XBA 
    CPX.B $14 
    BEQ .next 
    DEX 
    JMP.W .loop 


.next:
    INY 
    BPL UNUSED_CalcPBRelatedHDMADataTables_Scaled_OnScreen_888FF8 
    RTS 


UNUSED_CalPBRelatedHDMADataTables_Scaled_OnScreen_88903A:
    LDA.W PowerBomb_ShapeDefinitionTiles_Optimization_A226,Y : STA.W $4203 
    NOP #3
    LDA.W $4217 : STA.B $14 
    LDA.W PowerBomb_ShapeDefinitionTiles_Optimization_A206,Y : STA.W $4203 
    NOP 
    LDA.W $0CE6 
    SEC 
    SBC.W $4217 
    BCC .lowByteFF 
    LDA.B #$FF 
    XBA 
    LDA.B #$00 
    BRA + 


.lowByteFF:
    XBA 
    LDA.B #$FF 

  + XBA 

.loop:
    STA.L $7EC406,X 
    XBA 
    STA.L $7EC506,X 
    XBA 
    CPX.B $14 
    BEQ .next 
    DEX 
    JMP.W .loop 


.next:
    INY 
    BPL UNUSED_CalPBRelatedHDMADataTables_Scaled_OnScreen_88903A 
    RTS 
endif ; !FEATURE_KEEP_UNREFERENCED


PowerBomb_PreExplosion_Colors:
; Indexed by [power bomb pre-explosion radius] / 800h
; Red, green, blue. Range 0..1Fh
; White section
  .red
    db $10 
  .green
    db $10 
  .blue
    db $10 
    db $04,$04,$04
    db $06,$06,$06
    db $08,$08,$08
    db $0A,$0A,$0A
    db $0C,$0C,$0C
    db $0E,$0E,$0A
; Yellow section
    db $10,$10,$08
    db $12,$12,$08
    db $14,$14,$08
    db $16,$16,$08
    db $18,$18,$08
    db $1A,$1A,$0A
    db $18,$18,$08
    db $16,$16,$06
    db $14,$14,$04

if !FEATURE_KEEP_UNREFERENCED
UNUSED_PowerBomb_ExplosionRelated_Colors_8890A9:
; These might have been used for the after-glow in earlier development
    db $13,$13,$0F 
    db $11,$11,$0E
    db $0F,$0F,$0D
    db $0D,$0D,$0C
    db $0B,$0B,$0B
    db $0A,$0A,$0A
    db $09,$09,$09
    db $08,$08,$08
    db $07,$07,$07
    db $06,$06,$06
    db $05,$05,$05
    db $04,$04,$04
    db $03,$03,$03
    db $02,$02,$02
    db $01,$01,$01
    db $00,$00,$00

UNUSED_PowerBombColors_8890D9:
    dw $0001 
endif ; !FEATURE_KEEP_UNREFERENCED

PowerBomb_PreExplosion_InitialRadiusSpeed:
    dw $3000 

PowerBomb_PreExplosion_RadiusAcceleration:
    dw $0080 

PreInstruction_PowerBombExplosion_1_PreExplosion_White:
    LDA.W $0592 
    BMI .exploding 
    RTL 


.exploding:
    PHP 
    PHB 
    REP #$30 
    PHX 
    PHY 
    JSL.L Calculate_PowerBombPreExplosion_HDMAObjectTablePointers 
    PEA.W $8800 
    PLB 
    PLB 
    SEP #$30 
    LDA.B #$00 
    XBA 
    LDY.B #$60 
    LDA.W $0CED : STA.W $4202 
    LDA.W PowerBombExplosion_ShapeDefinitionTable_Unscaled_topOffset : STA.W $4203 
    NOP #3
    LDA.W $4217 : STA.B $12 
    TAX 
    PEA.W .loopPadDataTableBegin-1 
    LDA.W $0CE7 
    AND.B #$FF 
    BEQ .offScreenLeft 
    DEC A 
    BEQ .onScreen 
    JMP.W Calculate_PowerBombExplo_HDMADataTables_Scaled_RightOfScreen 


.onScreen:
    JMP.W Calculate_PowerBombExplosion_HDMADataTables_Scaled_OnScreen 


.offScreenLeft:
    JMP.W Calculate_PowerBombExplo_HDMADataTables_Scaled_LeftOfScreen 


.loopPadDataTableBegin:
    STA.L $7EC406,X 
    XBA 
    STA.L $7EC506,X 
    XBA 
    DEX 
    BPL .loopPadDataTableBegin 
    LDX.B $12 
    INX 
    CPX.B #$C0 
    BEQ .finishedTable 
    LDA.B #$FF 

.loopPadDataTableEnd:
    STA.L $7EC406,X 
    INC A 
    STA.L $7EC506,X 
    DEC A 
    INX 
    CPX.B #$C0 
    BNE .loopPadDataTableEnd 

.finishedTable:
    LDA.W $0CED 
    LSR #3
    AND.B #$0F 
    STA.B $12 
    ASL A 
    CLC 
    ADC.B $12 
    TAX 
    LDA.L PowerBomb_PreExplosion_Colors_red,X 
    ORA.B #$20 
    STA.W $0074 ; >.<
    LDA.L PowerBomb_PreExplosion_Colors_green,X 
    ORA.B #$40 
    STA.W $0075 ; >.<
    LDA.L PowerBomb_PreExplosion_Colors_blue,X 
    ORA.B #$80 
    STA.W $0076 ; >.<
    REP #$30 
    PLY 
    PLX 
    LDA.W $0CEC 
    CLC 
    ADC.W $0CF0 
    STA.W $0CEC 
    CMP.W #$9200 ; radius
    BCC .lessThan9200 
    LDA.W #$0001 : STA.W $18E4,X 
    INC.W $18CC,X 
    INC.W $18CC,X 
    STZ.W $1908,X 
    JMP.W .return 


.lessThan9200:
    LDA.W $0CF0 
    SEC 
    SBC.L PowerBomb_PreExplosion_RadiusAcceleration 
    STA.W $0CF0 

.return:
    PLB 
    PLP 
    RTL 


PreInstruction_PowerBombExplosion_2_PreExplosion_Yellow:
    LDA.W $0592 
    BMI .exploding 
    RTL 


.exploding:
    PHP 
    PHB 
    REP #$30 
    PHX 
    PHY 
    JSL.L Calculate_PowerBombPreExplosion_HDMAObjectTablePointers 
    PEA.W $8800 
    PLB 
    PLB 
    LDY.W $0CF2 
    LDX.W #$0000 
    SEP #$20 
    PEA.W .manualReturn-1 
    LDA.W $0CE7 
    AND.B #$FF 
    BEQ .offScreenLeft 
    DEC A 
    BEQ .onScreen 
    JMP.W Calc_PowerBombExplo_HDMADataTables_PreScaled_RightOfScreen 


.onScreen:
    JMP.W Calculate_PowerBombExplo_HDMADataTables_PreScaled_OnScreen 


.offScreenLeft:
    JMP.W Calc_PowerBombExplo_HDMADataTables_PreScaled_LeftOfScreen 


.manualReturn:
    SEP #$30 
    LDA.B #$00 
    XBA 
    LDA.W $0CED 
    LSR #3
    AND.B #$0F 
    STA.B $12 
    ASL A 
    CLC 
    ADC.B $12 
    TAX 
    LDA.L PowerBomb_PreExplosion_Colors_red,X 
    ORA.B #$20 
    STA.W $0074 
    LDA.L PowerBomb_PreExplosion_Colors_green,X 
    ORA.B #$40 
    STA.W $0075 
    LDA.L PowerBomb_PreExplosion_Colors_blue,X 
    ORA.B #$80 
    STA.W $0076 
    REP #$30 
    PLY 
    PLX 
    LDA.W $0CF2 
    CLC 
    ADC.W #$00C0 
    STA.W $0CF2 
    CMP.W #PowerBomb_ShapeDefinitionTiles_Optimization_A206 
    BNE .notA206 
    LDA.W #$0001 : STA.W $18E4,X 
    INC.W $18CC,X 
    INC.W $18CC,X 
    STZ.W $1908,X 

.notA206:
    LDA.W $0CEC 
    CLC 
    ADC.W $0CF0 
    BCS .return 
    STA.W $0CEC 
    LDA.W $0CF0 
    SEC 
    SBC.L PowerBomb_PreExplosion_RadiusAcceleration 
    STA.W $0CF0 

.return:
    PLB 
    PLP 
    RTL 


PowerBomb_Explosion_ShapeDefinitionTiles_PreScaled:
; Defines the shape of (the bottom) half of a power bomb explosion
; Each byte defines the width of the power bomb explosion for that pixel-row, C0h pixel-rows total
; One line per frame of explosion
    db $7F,$7F,$7F,$7F,$7F,$7F,$7F,$7F,$7F,$7F,$7F,$7F,$7F,$7E,$7E,$7E 
    db $7E,$7D,$7D,$7D,$7D,$7D,$7C,$7C,$7B,$7B,$7B,$7A,$7A,$7A,$79,$79 
    db $78,$78,$77,$77,$76,$76,$75,$75,$74,$74,$73,$72,$71,$71,$70,$6F 
    db $6E,$6E,$6D,$6C,$6B,$6A,$69,$69,$68,$67,$66,$65,$63,$62,$61,$60 
    db $5F,$5E,$5D,$5C,$5A,$59,$57,$56,$54,$53,$51,$4F,$4E,$4C,$4A,$49 
    db $47,$45,$43,$40,$3E,$3B,$39,$36,$33,$30,$2C,$28,$25,$1F,$1A,$12 
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00 
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00 
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00 
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00 
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00 
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00 
    db $86,$86,$86,$86,$86,$86,$86,$86,$86,$85,$85,$85,$85,$85,$85,$85 
    db $84,$84,$84,$84,$84,$83,$83,$83,$82,$82,$82,$81,$81,$81,$80,$80 
    db $80,$7F,$7F,$7E,$7E,$7D,$7C,$7C,$7B,$7B,$7A,$7A,$79,$78,$77,$77 
    db $76,$76,$75,$74,$73,$72,$71,$70,$6F,$6F,$6E,$6D,$6C,$6B,$6A,$68 
    db $67,$66,$65,$64,$63,$62,$61,$5F,$5E,$5D,$5B,$5A,$58,$56,$55,$53 
    db $52,$50,$4E,$4C,$4A,$48,$46,$45,$42,$40,$3D,$3B,$37,$34,$31,$2D 
    db $29,$27,$21,$1B,$13,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00 
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00 
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00 
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00 
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00 
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00 
    db $8D,$8D,$8D,$8D,$8D,$8D,$8D,$8D,$8D,$8D,$8C,$8C,$8C,$8C,$8C,$8C 
    db $8C,$8B,$8B,$8B,$8B,$8B,$8A,$8A,$8A,$89,$89,$89,$89,$88,$87,$87 
    db $87,$86,$86,$85,$85,$84,$84,$84,$83,$82,$82,$81,$80,$80,$80,$7F 
    db $7E,$7D,$7C,$7C,$7B,$7A,$7A,$78,$78,$77,$76,$75,$75,$74,$73,$72 
    db $71,$70,$6F,$6D,$6C,$6B,$6A,$69,$68,$67,$66,$64,$62,$62,$60,$5E 
    db $5D,$5A,$5A,$58,$57,$54,$52,$51,$4F,$4D,$4A,$48,$47,$44,$42,$3F 
    db $3C,$3A,$36,$33,$2F,$2B,$29,$22,$1D,$14,$00,$00,$00,$00,$00,$00 
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00 
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00 
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00 
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00 
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00 
    db $95,$95,$95,$95,$95,$95,$95,$95,$95,$95,$94,$94,$94,$94,$94,$94 
    db $94,$93,$93,$93,$93,$93,$93,$92,$92,$91,$91,$91,$90,$90,$90,$90 
    db $8F,$8E,$8E,$8E,$8D,$8D,$8D,$8C,$8C,$8B,$8A,$8A,$89,$89,$88,$87 
    db $87,$86,$86,$85,$85,$83,$83,$82,$81,$80,$80,$7F,$7E,$7D,$7C,$7B 
    db $7B,$7A,$79,$78,$76,$76,$74,$73,$72,$71,$70,$6F,$6E,$6C,$6B,$6A 
    db $68,$67,$66,$65,$63,$61,$60,$5E,$5C,$5B,$59,$57,$55,$53,$51,$4F 
    db $4E,$4B,$48,$47,$43,$41,$3E,$3C,$38,$34,$32,$2D,$28,$22,$1F,$15 
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00 
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00 
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00 
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00 
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00 
    db $9C,$9C,$9C,$9C,$9C,$9C,$9C,$9C,$9C,$9C,$9C,$9B,$9B,$9B,$9B,$9B 
    db $9B,$9B,$9A,$9A,$9A,$99,$99,$99,$99,$99,$98,$98,$98,$97,$97,$97 
    db $96,$96,$95,$95,$95,$95,$94,$93,$93,$92,$92,$91,$91,$90,$90,$8F 
    db $8E,$8E,$8E,$8D,$8D,$8B,$8B,$8A,$89,$89,$88,$87,$86,$85,$85,$84 
    db $83,$82,$81,$80,$80,$7E,$7D,$7D,$7B,$7A,$79,$78,$77,$76,$75,$73 
    db $72,$71,$70,$6F,$6D,$6C,$6A,$6A,$67,$66,$64,$63,$60,$60,$5D,$5C 
    db $5A,$57,$57,$54,$52,$50,$4D,$4C,$48,$46,$44,$41,$3C,$3A,$36,$34 
    db $2F,$2A,$26,$20,$16,$0F,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00 
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00 
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00 
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00 
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00 
    db $A4,$A4,$A4,$A4,$A4,$A4,$A4,$A4,$A4,$A4,$A4,$A3,$A3,$A3,$A3,$A3 
    db $A3,$A3,$A3,$A2,$A2,$A2,$A1,$A1,$A1,$A1,$A1,$A1,$A0,$A0,$9F,$9F 
    db $9F,$9E,$9E,$9D,$9D,$9D,$9D,$9C,$9B,$9B,$9A,$9A,$9A,$99,$98,$98 
    db $97,$96,$96,$95,$95,$94,$94,$93,$92,$92,$91,$91,$8F,$8F,$8E,$8D 
    db $8C,$8B,$8B,$8A,$89,$87,$87,$86,$86,$84,$84,$82,$82,$80,$7E,$7E 
    db $7D,$7C,$7B,$79,$78,$77,$76,$75,$73,$72,$70,$6F,$6E,$6C,$6B,$69 
    db $68,$65,$63,$62,$60,$5E,$5C,$5B,$58,$57,$54,$51,$4F,$4C,$4A,$48 
    db $46,$42,$3F,$3B,$39,$34,$2F,$2C,$26,$22,$17,$10,$00,$00,$00,$00 
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00 
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00 
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00 
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00 
    db $AC,$AC,$AC,$AC,$AC,$AC,$AC,$AC,$AC,$AC,$AC,$AC,$AB,$AB,$AB,$AB 
    db $AB,$AA,$AA,$AA,$AA,$AA,$AA,$A9,$A9,$A9,$A8,$A8,$A8,$A8,$A8,$A7 
    db $A6,$A6,$A6,$A6,$A5,$A5,$A4,$A4,$A4,$A4,$A3,$A2,$A2,$A1,$A1,$A0 
    db $A0,$A0,$9F,$9E,$9E,$9D,$9C,$9C,$9C,$9B,$9A,$99,$99,$98,$98,$96 
    db $96,$95,$94,$93,$92,$91,$91,$8F,$8F,$8E,$8D,$8D,$8B,$8B,$89,$89 
    db $87,$86,$85,$84,$83,$82,$81,$7F,$7E,$7D,$7C,$7A,$78,$78,$76,$75 
    db $73,$72,$70,$6E,$6E,$6B,$6A,$68,$67,$64,$63,$60,$5F,$5D,$5B,$58 
    db $56,$53,$52,$4E,$4D,$49,$47,$42,$40,$3C,$3A,$34,$32,$2E,$27,$23 
    db $19,$11,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00 
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00 
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00 
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00 
    db $B4,$B4,$B4,$B4,$B4,$B4,$B4,$B4,$B4,$B4,$B4,$B4,$B4,$B3,$B3,$B3 
    db $B3,$B2,$B2,$B2,$B2,$B2,$B2,$B2,$B1,$B1,$B1,$B0,$B0,$B0,$B0,$B0 
    db $AF,$AF,$AE,$AE,$AE,$AD,$AD,$AC,$AC,$AC,$AB,$AB,$AB,$AA,$A9,$A8 
    db $A8,$A8,$A8,$A7,$A6,$A6,$A5,$A5,$A4,$A4,$A3,$A2,$A2,$A1,$A0,$9F 
    db $9F,$9F,$9D,$9C,$9C,$9B,$9A,$99,$99,$98,$97,$95,$95,$95,$93,$93 
    db $91,$90,$90,$8E,$8E,$8B,$8B,$89,$89,$88,$87,$85,$84,$83,$82,$80 
    db $7F,$7D,$7D,$7B,$7A,$78,$76,$76,$73,$72,$70,$6F,$6D,$6A,$69,$67 
    db $65,$64,$61,$5F,$5C,$5A,$59,$56,$54,$51,$4F,$4D,$48,$45,$41,$3E 
    db $39,$37,$34,$2C,$29,$1F,$1A,$12,$00,$00,$00,$00,$00,$00,$00,$00 
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00 
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00 
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00 
    db $BC,$BC,$BC,$BC,$BC,$BC,$BC,$BC,$BC,$BC,$BC,$BC,$BC,$BB,$BB,$BB 
    db $BB,$BB,$BA,$BA,$BA,$BA,$BA,$BA,$BA,$B9,$B9,$B9,$B9,$B8,$B8,$B8 
    db $B7,$B7,$B7,$B6,$B6,$B6,$B5,$B5,$B4,$B4,$B4,$B4,$B3,$B3,$B2,$B1 
    db $B1,$B0,$B0,$AF,$AF,$AE,$AE,$AD,$AD,$AC,$AC,$AB,$AB,$AA,$A9,$A9 
    db $A8,$A7,$A6,$A6,$A5,$A4,$A3,$A3,$A2,$A1,$A0,$A0,$9F,$9D,$9D,$9B 
    db $9B,$9B,$99,$98,$98,$96,$95,$95,$92,$92,$91,$8F,$8F,$8E,$8D,$8B 
    db $8A,$89,$88,$86,$85,$84,$82,$81,$80,$7E,$7C,$7C,$79,$78,$77,$74 
    db $73,$70,$6F,$6E,$6B,$69,$68,$65,$63,$62,$5E,$5D,$5B,$57,$55,$52 
    db $50,$4E,$49,$46,$44,$3F,$3B,$39,$32,$2E,$2B,$21,$1B,$13,$00,$00 
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00 
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00 
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00 
    db $C5,$C5,$C5,$C5,$C5,$C5,$C5,$C5,$C5,$C5,$C5,$C5,$C5,$C5,$C4,$C4 
    db $C4,$C4,$C4,$C3,$C3,$C3,$C3,$C2,$C2,$C2,$C2,$C2,$C2,$C2,$C1,$C1 
    db $C1,$C0,$C0,$BF,$BF,$BF,$BF,$BF,$BE,$BD,$BD,$BC,$BC,$BC,$BB,$BB 
    db $BB,$BA,$BA,$B9,$B8,$B8,$B8,$B7,$B7,$B6,$B5,$B4,$B4,$B4,$B3,$B3 
    db $B2,$B1,$B1,$B0,$AF,$AE,$AE,$AE,$AC,$AB,$AA,$AA,$A9,$A8,$A7,$A7 
    db $A6,$A5,$A3,$A3,$A3,$A2,$A0,$A0,$9F,$9D,$9D,$9C,$9B,$99,$98,$97 
    db $96,$95,$94,$93,$91,$90,$8F,$8E,$8C,$8B,$89,$88,$87,$86,$84,$82 
    db $81,$7E,$7E,$7D,$7A,$79,$77,$76,$73,$71,$70,$6D,$6B,$6A,$68,$65 
    db $63,$62,$5E,$5C,$59,$58,$54,$51,$4F,$4A,$47,$44,$3E,$3C,$39,$35 
    db $2D,$28,$22,$14,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00 
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00 
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00 
    db $CD,$CD,$CD,$CD,$CD,$CD,$CD,$CD,$CD,$CD,$CD,$CD,$CD,$CD,$CC,$CC 
    db $CC,$CC,$CC,$CC,$CB,$CB,$CB,$CB,$CA,$CA,$CA,$C9,$C9,$C9,$C9,$C9 
    db $C9,$C9,$C8,$C8,$C8,$C7,$C6,$C6,$C6,$C6,$C5,$C5,$C5,$C4,$C4,$C4 
    db $C3,$C3,$C2,$C1,$C1,$C1,$C0,$C0,$BF,$BF,$BE,$BD,$BD,$BD,$BC,$BB 
    db $BA,$BA,$B9,$B9,$B9,$B8,$B7,$B6,$B5,$B5,$B5,$B3,$B2,$B1,$B1,$B0 
    db $AF,$AE,$AE,$AD,$AC,$AB,$AA,$A9,$A8,$A8,$A7,$A5,$A4,$A4,$A3,$A1 
    db $A0,$9F,$9E,$9C,$9C,$9B,$9A,$99,$97,$96,$95,$94,$92,$91,$90,$8F 
    db $8C,$8C,$8B,$89,$87,$86,$83,$83,$7F,$7F,$7E,$7C,$79,$77,$76,$75 
    db $72,$6F,$6F,$6C,$69,$67,$66,$63,$5F,$5D,$5C,$5A,$57,$52,$4F,$4D 
    db $4A,$45,$41,$3E,$3B,$32,$2F,$2A,$24,$14,$00,$00,$00,$00,$00,$00 
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00 
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00 
    db $D6,$D6,$D6,$D6,$D6,$D6,$D6,$D6,$D6,$D6,$D6,$D6,$D6,$D6,$D6,$D5 
    db $D5,$D5,$D5,$D5,$D5,$D4,$D4,$D4,$D4,$D3,$D3,$D3,$D2,$D2,$D2,$D2 
    db $D1,$D1,$D1,$D1,$D1,$D1,$D0,$D0,$CF,$CF,$CF,$CE,$CE,$CD,$CD,$CC 
    db $CC,$CC,$CC,$CC,$CB,$CA,$CA,$C9,$C8,$C8,$C7,$C7,$C7,$C7,$C6,$C5 
    db $C4,$C4,$C3,$C2,$C2,$C2,$C1,$C1,$C0,$BF,$BE,$BD,$BC,$BC,$BC,$BA 
    db $B9,$B9,$B8,$B7,$B6,$B6,$B5,$B4,$B3,$B2,$B1,$B1,$B0,$AF,$AE,$AD 
    db $AC,$AB,$AA,$A9,$A7,$A6,$A5,$A4,$A3,$A2,$A1,$A0,$9E,$9D,$9D,$9B 
    db $9A,$98,$98,$96,$94,$92,$92,$91,$8F,$8D,$8C,$89,$88,$88,$84,$83 
    db $82,$80,$7E,$7D,$7A,$78,$77,$74,$73,$70,$6E,$6B,$6A,$68,$63,$61 
    db $60,$5E,$5B,$56,$53,$50,$4E,$4A,$48,$41,$3E,$39,$34,$31,$25,$1F 
    db $15,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00 
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00 
    db $DF,$DF,$DF,$DF,$DF,$DF,$DF,$DF,$DF,$DF,$DF,$DF,$DF,$DF,$DF,$DE 
    db $DE,$DE,$DE,$DE,$DE,$DE,$DD,$DD,$DD,$DD,$DC,$DC,$DC,$DB,$DB,$DB 
    db $DB,$DB,$DA,$DA,$DA,$D9,$D9,$D9,$D9,$D9,$D8,$D8,$D8,$D7,$D7,$D6 
    db $D6,$D5,$D5,$D5,$D4,$D4,$D3,$D3,$D2,$D2,$D1,$D1,$D1,$D0,$D0,$CF 
    db $CE,$CD,$CD,$CC,$CC,$CB,$CB,$CB,$CA,$C9,$C9,$C8,$C7,$C6,$C5,$C4 
    db $C4,$C4,$C3,$C2,$C1,$C0,$BF,$BE,$BD,$BD,$BD,$BC,$BA,$B9,$B8,$B8 
    db $B7,$B6,$B6,$B4,$B3,$B2,$B1,$B0,$AF,$AE,$AC,$AB,$AA,$A9,$A8,$A8 
    db $A7,$A4,$A3,$A2,$A1,$A1,$9F,$9E,$9B,$9A,$99,$98,$97,$95,$93,$92 
    db $8F,$8E,$8D,$8B,$8A,$89,$85,$84,$82,$80,$7F,$7D,$7C,$78,$76,$75 
    db $72,$70,$6F,$6C,$68,$65,$64,$62,$5F,$5C,$5A,$54,$51,$4D,$4B,$46 
    db $44,$40,$37,$33,$2E,$27,$20,$16,$00,$00,$00,$00,$00,$00,$00,$00 
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00 
    db $E8,$E8,$E8,$E8,$E8,$E8,$E8,$E8,$E8,$E8,$E8,$E8,$E8,$E8,$E8,$E8 
    db $E7,$E7,$E7,$E7,$E7,$E7,$E6,$E6,$E6,$E6,$E6,$E5,$E5,$E5,$E5,$E4 
    db $E4,$E4,$E4,$E3,$E3,$E3,$E3,$E2,$E2,$E1,$E1,$E0,$E0,$E0,$E0,$DF 
    db $DF,$DE,$DE,$DE,$DE,$DE,$DD,$DD,$DC,$DC,$DB,$DB,$DA,$D9,$D9,$D8 
    db $D8,$D7,$D7,$D6,$D5,$D5,$D4,$D4,$D3,$D3,$D3,$D2,$D1,$D1,$D0,$CF 
    db $CE,$CE,$CC,$CC,$CB,$CA,$CA,$C9,$C9,$C8,$C7,$C6,$C5,$C4,$C3,$C2 
    db $C1,$C0,$C0,$C0,$BF,$BE,$BC,$BB,$BA,$B9,$B8,$B7,$B6,$B5,$B4,$B3 
    db $B1,$B0,$AF,$AE,$AD,$AC,$AB,$AA,$A9,$A8,$A5,$A4,$A2,$A2,$A1,$9F 
    db $9E,$9D,$9B,$99,$97,$95,$94,$93,$90,$8F,$8E,$8D,$8B,$89,$85,$84 
    db $82,$81,$7E,$7D,$7A,$79,$77,$74,$70,$6F,$6C,$69,$68,$65,$63,$60 
    db $5D,$5A,$57,$51,$4E,$49,$46,$43,$3E,$39,$35,$30,$28,$17,$00,$00 
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00 
    db $F2,$F2,$F2,$F2,$F2,$F2,$F2,$F2,$F2,$F2,$F2,$F2,$F2,$F2,$F2,$F2 
    db $F2,$F1,$F1,$F1,$F1,$F1,$F1,$F0,$F0,$F0,$F0,$F0,$EF,$EF,$EF,$EF 
    db $EE,$EE,$EE,$EE,$EE,$ED,$ED,$ED,$EC,$EC,$EC,$EB,$EB,$EA,$EA,$EA 
    db $EA,$E9,$E9,$E8,$E8,$E7,$E7,$E7,$E7,$E6,$E5,$E5,$E4,$E4,$E3,$E2 
    db $E2,$E2,$E1,$E1,$E0,$E0,$E0,$DF,$DF,$DE,$DE,$DC,$DC,$DC,$DB,$DA 
    db $DA,$D9,$D8,$D7,$D7,$D6,$D5,$D5,$D4,$D3,$D2,$D1,$D1,$D0,$CE,$CD 
    db $CD,$CD,$CC,$CB,$CA,$C9,$C8,$C8,$C7,$C6,$C5,$C4,$C3,$C2,$C1,$C0 
    db $BF,$BC,$BB,$BA,$BA,$B9,$B8,$B7,$B6,$B5,$B3,$B2,$B1,$B0,$AF,$AE 
    db $AC,$AB,$A9,$A8,$A6,$A5,$A4,$A2,$A0,$9F,$9E,$9B,$9A,$99,$96,$95 
    db $95,$93,$91,$8F,$8D,$8B,$87,$86,$83,$82,$80,$7F,$7C,$79,$78,$75 
    db $73,$70,$6E,$6D,$6A,$67,$64,$61,$5D,$58,$54,$51,$4C,$4A,$46,$41 
    db $3B,$38,$32,$2A,$23,$18,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00 
    db $FB,$FB,$FB,$FB,$FB,$FB,$FB,$FB,$FB,$FB,$FB,$FB,$FB,$FB,$FB,$FB 
    db $FB,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$F9,$F9,$F9,$F9,$F9,$F8,$F8,$F8 
    db $F8,$F7,$F7,$F7,$F7,$F7,$F6,$F6,$F6,$F6,$F5,$F5,$F5,$F4,$F4,$F3 
    db $F3,$F3,$F3,$F2,$F2,$F1,$F1,$F0,$F0,$F0,$F0,$EF,$EF,$EE,$EE,$ED 
    db $EC,$EB,$EB,$EB,$EA,$EA,$E9,$E9,$E8,$E7,$E7,$E6,$E6,$E5,$E4,$E4 
    db $E4,$E3,$E2,$E2,$E1,$E0,$DF,$DF,$DE,$DD,$DD,$DC,$DB,$DA,$D9,$D9 
    db $D8,$D7,$D6,$D5,$D5,$D4,$D3,$D2,$D1,$D0,$CF,$CF,$CE,$CD,$CC,$CB 
    db $CA,$C9,$C8,$C7,$C6,$C5,$C3,$C2,$C1,$C0,$BF,$BE,$BD,$BD,$BC,$B9 
    db $B8,$B7,$B6,$B5,$B3,$B2,$B0,$AF,$AE,$AC,$AB,$AA,$A8,$A6,$A5,$A4 
    db $A1,$A0,$9F,$9C,$9B,$9A,$98,$96,$94,$92,$90,$8F,$8C,$8B,$88,$87 
    db $84,$83,$80,$7E,$7D,$7A,$78,$75,$72,$71,$6E,$6B,$68,$65,$61,$5E 
    db $5B,$57,$54,$4F,$4C,$48,$43,$3E,$3A,$34,$2C,$24,$19,$00,$00,$00 
    db $FE,$FE,$FE,$FE,$FE,$FE,$FE,$FE,$FE,$FE,$FE,$FE,$FE,$FE,$FE,$FE 
    db $FE,$FD,$FD,$FD,$FD,$FD,$FD,$FD,$FC,$FC,$FC,$FC,$FC,$FB,$FB,$FB 
    db $FB,$FA,$FA,$FA,$FA,$FA,$F9,$F9,$F9,$F9,$F8,$F8,$F8,$F7,$F7,$F6 
    db $F6,$F6,$F6,$F5,$F5,$F4,$F4,$F3,$F3,$F3,$F3,$F2,$F2,$F1,$F1,$F0 
    db $F0,$EF,$EE,$EE,$EE,$ED,$ED,$EC,$EC,$EB,$EA,$EA,$E9,$E9,$E8,$E7 
    db $E7,$E7,$E6,$E5,$E5,$E4,$E3,$E2,$E2,$E1,$E0,$E0,$DF,$DE,$DD,$DC 
    db $DC,$DB,$DA,$D9,$D8,$D8,$D7,$D6,$D5,$D4,$D3,$D2,$D2,$D1,$D0,$CF 
    db $CE,$CD,$CC,$CB,$CA,$C9,$C8,$C6,$C5,$C4,$C3,$C2,$C1,$C0,$BF,$BE 
    db $BC,$BB,$BA,$B9,$B8,$B7,$B5,$B4,$B2,$B1,$B0,$AE,$AD,$AC,$AA,$A8 
    db $A7,$A6,$A3,$A2,$A1,$9E,$9D,$9C,$9A,$98,$96,$94,$92,$91,$8E,$8D 
    db $8A,$89,$86,$85,$82,$7F,$7E,$7B,$79,$76,$73,$72,$6F,$6C,$69,$66 
    db $62,$5F,$5C,$58,$55,$50,$4D,$49,$44,$3E,$3A,$34,$2C,$24,$19,$00 

PowerBomb_PreExplosion_ShapeDefinitionTables_PreScaled:
; Defines the shape of (the bottom) half of a power bomb explosion
; Each byte defines the width of the power bomb explosion for that pixel-row, C0h pixel-rows total
; One line per frame of explosion
    db $91,$91,$91,$91,$91,$91,$91,$91,$91,$91,$90,$90,$90,$90,$90,$90 
    db $90,$8F,$8F,$8F,$8F,$8F,$8E,$8E,$8E,$8E,$8D,$8C,$8C,$8C,$8C,$8B 
    db $8B,$8B,$8A,$8A,$89,$89,$88,$88,$87,$87,$86,$86,$85,$84,$84,$83 
    db $83,$82,$81,$80,$80,$7F,$7E,$7E,$7C,$7C,$7B,$7A,$79,$78,$78,$77 
    db $76,$75,$74,$73,$71,$70,$6F,$6E,$6D,$6C,$6B,$6A,$68,$67,$66,$64 
    db $63,$61,$60,$5F,$5C,$5A,$5A,$58,$56,$53,$53,$50,$4E,$4C,$4A,$48 
    db $45,$42,$41,$3E,$3A,$36,$35,$31,$2C,$27,$23,$1E,$15,$00,$00,$00 
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00 
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00 
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00 
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00 
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00 
    db $C0,$C0,$C0,$C0,$C0,$C0,$C0,$C0,$C0,$C0,$C0,$C0,$C0,$BF,$BF,$BF 
    db $BF,$BF,$BF,$BE,$BE,$BE,$BD,$BD,$BD,$BD,$BD,$BD,$BD,$BC,$BC,$BC 
    db $BB,$BB,$BA,$BA,$BA,$BA,$BA,$B9,$B8,$B8,$B7,$B7,$B7,$B7,$B6,$B6 
    db $B5,$B5,$B4,$B4,$B4,$B3,$B2,$B2,$B1,$B1,$B0,$AF,$AE,$AE,$AE,$AD 
    db $AD,$AB,$AB,$AB,$A9,$A9,$A8,$A7,$A6,$A6,$A5,$A4,$A3,$A2,$A2,$A1 
    db $9F,$9F,$9F,$9D,$9C,$9C,$9A,$99,$99,$97,$96,$95,$93,$93,$92,$90 
    db $8F,$8E,$8D,$8C,$8B,$8A,$88,$86,$86,$83,$83,$82,$7F,$7E,$7D,$7A 
    db $7A,$77,$76,$74,$73,$70,$6E,$6E,$6B,$68,$68,$65,$62,$60,$5D,$5B 
    db $59,$56,$54,$52,$4D,$4A,$48,$43,$40,$3D,$37,$34,$2F,$27,$21,$1B 
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00 
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00 
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00 
    db $EE,$EE,$EE,$EE,$EE,$EE,$EE,$EE,$EE,$EE,$EE,$EE,$EE,$EE,$EE,$EE 
    db $ED,$ED,$ED,$ED,$ED,$ED,$ED,$EC,$EC,$EC,$EC,$EC,$EB,$EB,$EB,$EA 
    db $EA,$EA,$EA,$EA,$E9,$E9,$E9,$E9,$E8,$E8,$E8,$E7,$E6,$E6,$E6,$E6 
    db $E5,$E5,$E4,$E4,$E3,$E3,$E3,$E3,$E2,$E1,$E1,$E0,$E0,$E0,$DF,$DF 
    db $DF,$DE,$DE,$DD,$DD,$DC,$DB,$DA,$DA,$D9,$D8,$D8,$D8,$D7,$D6,$D6 
    db $D5,$D4,$D3,$D3,$D2,$D2,$D1,$D0,$CF,$CE,$CE,$CD,$CC,$CB,$CA,$CA 
    db $C9,$C8,$C7,$C5,$C4,$C4,$C4,$C3,$C2,$C1,$C0,$BF,$BE,$BD,$BC,$BB 
    db $B9,$B7,$B6,$B6,$B5,$B4,$B3,$B2,$B0,$AF,$AE,$AD,$AC,$AB,$A9,$A7 
    db $A6,$A5,$A3,$A2,$A1,$9F,$9D,$9C,$9B,$99,$98,$97,$94,$92,$90,$8E 
    db $8C,$8B,$89,$88,$85,$84,$81,$80,$7E,$7D,$7A,$76,$73,$71,$6F,$6C 
    db $6B,$68,$65,$62,$60,$5C,$59,$56,$53,$4B,$48,$45,$40,$3A,$37,$31 
    db $2A,$22,$18,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00 
    db $FE,$FE,$FE,$FE,$FE,$FE,$FE,$FE,$FE,$FE,$FE,$FE,$FE,$FE,$FE,$FE 
    db $FE,$FD,$FD,$FD,$FD,$FD,$FD,$FD,$FC,$FC,$FC,$FC,$FC,$FB,$FB,$FB 
    db $FB,$FA,$FA,$FA,$FA,$FA,$F9,$F9,$F9,$F9,$F8,$F8,$F8,$F7,$F7,$F6 
    db $F6,$F6,$F6,$F5,$F5,$F4,$F4,$F3,$F3,$F3,$F3,$F2,$F2,$F1,$F1,$F0 
    db $F0,$EF,$EE,$EE,$EE,$ED,$ED,$EC,$EC,$EB,$EA,$EA,$E9,$E9,$E8,$E7 
    db $E7,$E7,$E6,$E5,$E5,$E4,$E3,$E2,$E2,$E1,$E0,$E0,$DF,$DE,$DD,$DC 
    db $DC,$DB,$DA,$D9,$D8,$D8,$D7,$D6,$D5,$D4,$D3,$D2,$D2,$D1,$D0,$CF 
    db $CE,$CD,$CC,$CB,$CA,$C9,$C8,$C6,$C5,$C4,$C3,$C2,$C1,$C0,$BF,$BE 
    db $BC,$BB,$BA,$B9,$B8,$B7,$B5,$B4,$B2,$B1,$B0,$AE,$AD,$AC,$AA,$A8 
    db $A7,$A6,$A3,$A2,$A1,$9E,$9D,$9C,$9A,$98,$96,$94,$92,$91,$8E,$8D 
    db $8A,$89,$86,$85,$82,$7F,$7E,$7B,$79,$76,$73,$72,$6F,$6C,$69,$66 
    db $62,$5F,$5C,$58,$55,$50,$4D,$49,$44,$3E,$3A,$34,$2C,$24,$19,$00 

PowerBomb_ShapeDefinitionTiles_Optimization_A206:
; PJ believes this padding exists purely because of the "optimisation" done in the
; "calculate power bomb explosion HDMA data tables - stage 1/3" routines ($8CC6/$8D04/$8D46)
; where Y starts at 60h so that it can be checked against 80h via inspecting the negative flag.
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF 
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF 

PowerBomb_ShapeDefinitionTiles_Optimization_A226:
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF 
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF 
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF 
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF 

PowerBombExplosion_ShapeDefinitionTable_Unscaled_width:
; This table gives the shape of (the bottom) half of a power bomb explosion with X radius = 100h (Y radius C0h),
; starting from the bottom and ending at the centre
; Width
    db $00,$0C,$19,$25,$31,$3E,$4A,$56,$61,$6D,$78,$83,$8E,$98,$A2,$AB 
    db $B5,$BD,$C5,$CD,$D4,$DB,$E1,$E7,$EC,$F1,$F4,$F8,$FB,$FD,$FE,$FF 

PowerBombExplosion_ShapeDefinitionTable_Unscaled_topOffset:
; Top offset (previous entry used as bottom offset)
    db $BF,$BF,$BE,$BD,$BA,$B8,$B6,$B2,$AF,$AB,$A6,$A2,$9C,$96,$90,$8A 
    db $84,$7D,$75,$6E,$66,$5E,$56,$4D,$45,$3C,$33,$2A,$20,$17,$0D,$04 

Spawn_CrystalFlash_HDMAObjects:
    LDA.W #$8000 : STA.W $0592 
    JSL.L Spawn_HDMAObject 
    db $40,$28 
    dw InstList_CrystalFlash_Window2_LeftPosition 
    JSL.L Spawn_HDMAObject 
    db $40,$29 
    dw InstList_CrystalFlash_Window2_RightPosition 
    RTL 


InstList_CrystalFlash_Window2_LeftPosition:
    dw Instruction_HDMAObject_HDMATableBank : db $89 
    dw Instruction_HDMAObject_IndirectHDMATableBank : db $7E 
    dw Instruction_HDMAObject_CallExternalFunctionInY 
    dl CrystalFlash_Setup_1 
    dw Instruction_HDMAObject_CallExternalFunctionInY 
    dl CrystalFlash_Setup_2 
    dw Instruction_HDMAObject_PreInstructionInY 
    dl PreInstruction_CrystalFlash_1_Explosion 
    dw Instruction_HDMAObject_Sleep 
    dw Instruction_HDMAObject_PreInstructionInY 
    dl PreInstruction_CrystalFlash_2_AfterGlow 
    dw Instruction_HDMAObject_Sleep 
    dw Instruction_HDMAObject_CallExternalFunctionInY 
    dl CrystalFlash_Cleanup 
    dw Instruction_HDMAObject_Sleep 
    dw Instruction_HDMAObject_Delete 

CrystalFlash_Setup_1:
    SEP #$20 
    LDA.B #$FF : STA.L $7EC606 
    LDA.B #$00 : STA.L $7EC607 
    REP #$20 
    LDA.W #$0400 : STA.W $0CEC 
    LDA.L PowerBomb_PreExplosion_InitialRadiusSpeed : STA.W $0CF0 
    LDA.W #$0001 
    JSL.L QueueSound_Lib1_Max6 
    RTL 


CrystalFlash_Setup_2:
    LDA.W #$0400 : STA.W $0CEA 
    LDA.L PowerBombExplosion_InitialRadiusSpeed : STA.W $0CF0 
    RTL 


CrystalFlash_Cleanup:
    STZ.W $0CEE 
    STZ.W $0592 
    STZ.W $18B4,X 
    STZ.W $18B6,X 
    STZ.W $0CEC 
    STZ.W $0CEA 
    RTL 


InstList_CrystalFlash_Window2_RightPosition:
    dw Instruction_HDMAObject_HDMATableBank : db $89 
    dw Instruction_HDMAObject_IndirectHDMATableBank : db $7E 
    dw Instruction_HDMAObject_PreInstructionInY 
    dl PreInstruction_CrystalFlash_CustomLayerBlendingWindow2Config 
    dw Instruction_HDMAObject_Sleep 
    dw Instruction_HDMAObject_Delete 

PreInstruction_CrystalFlash_CustomLayerBlendingWindow2Config:
    SEP #$20 
    STZ.W $0060 
    LDA.B #$08 : STA.W $0061 
    LDA.B #$80 : STA.W $0062 
    LDA.B #$02 : STA.W $006E 
    LDA.B #$33 : STA.W $0071 
    STZ.W $006C 
    LDA.B #$04 : STA.W $006D 
    REP #$20 
    RTL 


PreInstruction_CrystalFlash_2_AfterGlow:
    LDA.W $0592 
    BMI .exploding 
    RTL 


.exploding:
    DEC.W $1908,X 
    BPL .return 
    SEP #$20 
    LDA.W $0074 
    ORA.W $0075 
    ORA.W $0076 
    AND.B #$1F 
    BEQ .wake 
    LDA.W $0074 
    AND.B #$1F 
    BEQ .green 
    DEC A 
    ORA.B #$20 
    STA.W $0074 ; >.<

.green:
    LDA.W $0075 ; >.<
    AND.B #$1F 
    BEQ .blue 
    DEC A 
    ORA.B #$40 
    STA.W $0075 ; >.<

.blue:
    LDA.W $0076 ; >.<
    AND.B #$1F 
    BEQ .setTimer 
    DEC A 
    ORA.B #$80 
    STA.W $0076 ; >.<

.setTimer:
    LDA.L PowerBomb_Stage5_HDMAObjectTimer : STA.W $1908,X 
    REP #$20 

.return:
    RTL 


.wake:
    REP #$20 
    LDA.W #$0001 : STA.W $18E4,X 
    INC.W $18CC,X 
    INC.W $18CC,X 
    RTL 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_CalcCrystalFlashHDMADataTables_PreScaled_Left_88A3B7:
    LDA.W $0CE6 
    CLC 
    ADC.W $0000,Y 
    BCS + 
    LDA.B #$00 : STA.L $7EC506,X 
    INC A 
    STA.L $7EC406,X 
    BRA .loop 


  + STA.L $7EC506,X 
    LDA.B #$00 : STA.L $7EC406,X 

.loop:
    INY 
    INX 
    CPX.W #$00C0 
    BNE UNUSED_CalcCrystalFlashHDMADataTables_PreScaled_Left_88A3B7 
    RTS 


UNUSED_Calc_CF_HDMADataTables_PreScaled_OnScreen_88A3DF:
    LDA.W $0000,Y 
    BEQ .return 
    CLC 
    ADC.W $0CE6 
    BCC + 
    LDA.B #$FF 

  + STA.L $7EC506,X 
    LDA.W $0CE6 
    SEC 
    SBC.W $0000,Y 
    BCS + 
    LDA.B #$00 

  + STA.L $7EC406,X 
    INY 
    INX 
    CPX.W #$00C0 
    BNE UNUSED_Calc_CF_HDMADataTables_PreScaled_OnScreen_88A3DF 

.return:
    RTS 


UNUSED_Calc_CF_HDMADataTables_PreScaled_RightOfScreen_88A407:
    LDA.W $0CE6 
    SEC 
    SBC.W $0000,Y 
    BCC + 
    LDA.B #$FF : STA.L $7EC406,X 
    DEC A 
    STA.L $7EC506,X 
    BRA .next 


  + STA.L $7EC406,X 
    LDA.B #$FF : STA.L $7EC506,X 

.next:
    INY 
    INX 
    CPX.W #$00C0 
    BNE UNUSED_Calc_CF_HDMADataTables_PreScaled_RightOfScreen_88A407 
    RTS 
endif ; !FEATURE_KEEP_UNREFERENCED


Calculate_CrystalFlash_HDMAObjectTablePointers:
    LDA.W $0592 
    BMI .exploding 
    RTL 


.exploding:
    LDA.W $0CE2 
    SEC 
    SBC.W $0911 
    CLC 
    ADC.W #$0100 
    CMP.W #$0300 
    BCC + 
    BRA .offScreen 


  + STA.W $0CE6 
    LDA.W $0CE4 
    SEC 
    SBC.W $0915 
    CLC 
    ADC.W #$0100 
    CMP.W #$0300 
    BCC .onScreen 

.offScreen:
    LDA.W #$0000 

.onScreen:
    EOR.W #$03FF 
    SEC 
    SBC.W #$0100 
    STA.W $0CE8 
    LDA.W $0CEA 
    AND.W #$FF00 
    BNE + 
    STZ.W $0CE8 

  + LDA.W $18C0,X 
    AND.W #$00FF 
    TAY 
    LDA.W $0CE8 
    ASL A 
    CLC 
    ADC.W $0CE8 
    STA.B $16 
    ADC.W #IndirectHDMATable_PowerBombExplosionWindow2_Left_200below 
    STA.W $18D8,X 
    LDA.B $16 
    CLC 
    ADC.W #IndirectHDMATable_PowerBombExplosionWindow2_Right_200below 
    STA.W $18DA,X 
    RTL 


Calculate_CrystalFlash_HDMADataTables_Scaled_LeftOfScreen:
    LDA.W PowerBomb_ShapeDefinitionTiles_Optimization_A226,Y : STA.W $4203 
    NOP #3
    LDA.W $4217 : STA.B $14 
    LDA.W PowerBomb_ShapeDefinitionTiles_Optimization_A206,Y : STA.W $4203 
    NOP 
    LDA.W $0CE6 
    CLC 
    ADC.W $4217 
    BCS .lowByteZero 
    LDA.B #$00 
    XBA 
    LDA.B #$FF 
    BRA .loop 


.lowByteZero:
    XBA 
    LDA.B #$00 

.loop:
    STA.L $7EC406,X 
    XBA 
    STA.L $7EC506,X 
    XBA 
    CPX.B $14 
    BEQ .next 
    DEX 
    JMP.W .loop 


.next:
    INY 
    BPL Calculate_CrystalFlash_HDMADataTables_Scaled_LeftOfScreen 
    RTS 


Calculate_CrystalFlash_HDMADataTables_Scaled_OnScreen:
    LDA.W PowerBomb_ShapeDefinitionTiles_Optimization_A226,Y : STA.W $4203 
    NOP #3
    LDA.W $4217 : STA.B $14 
    LDA.W PowerBomb_ShapeDefinitionTiles_Optimization_A206,Y : STA.W $4203 
    NOP 
    LDA.W $0CE6 
    CLC 
    ADC.W $4217 
    BCC + 
    LDA.B #$FF 

  + XBA 
    LDA.W $0CE6 
    SEC 
    SBC.W $4217 
    BCS .loop 
    LDA.B #$00 

.loop:
    STA.L $7EC406,X 
    XBA 
    STA.L $7EC506,X 
    XBA 
    CPX.B $14 
    BEQ .next 
    DEX 
    JMP.W .loop 


.next:
    INY 
    BPL Calculate_CrystalFlash_HDMADataTables_Scaled_OnScreen 
    RTS 


Calculate_CrystalFlash_HDMADataTables_Scaled_RightOfScreen:
    LDA.W PowerBomb_ShapeDefinitionTiles_Optimization_A226,Y : STA.W $4203 
    NOP #3
    LDA.W $4217 : STA.B $14 
    LDA.W PowerBomb_ShapeDefinitionTiles_Optimization_A206,Y : STA.W $4203 
    NOP 
    LDA.W $0CE6 
    SEC 
    SBC.W $4217 
    BCC .lowByteFF 
    LDA.B #$FF 
    XBA 
    LDA.B #$00 
    BRA + 


.lowByteFF:
    XBA 
    LDA.B #$FF 

  + XBA 

.loop:
    STA.L $7EC406,X 
    XBA 
    STA.L $7EC506,X 
    XBA 
    CPX.B $14 
    BEQ .next 
    DEX 
    JMP.W .loop 


.next:
    INY 
    BPL Calculate_CrystalFlash_HDMADataTables_Scaled_RightOfScreen 
    RTS 


PreInstruction_CrystalFlash_1_Explosion:
    LDA.W $0592 
    BMI .exploding 
    RTL 


.exploding:
    PHP 
    PHB 
    REP #$30 
    PHX 
    PHY 
    JSL.L Calculate_CrystalFlash_HDMAObjectTablePointers 
    PEA.W $8800 
    PLB 
    PLB 
    SEP #$30 
    LDA.B #$00 
    XBA 
    LDY.B #$60 
    LDA.W $0CEB : STA.W $4202 
    LDA.W PowerBombExplosion_ShapeDefinitionTable_Unscaled_topOffset : STA.W $4203 
    NOP #3
    LDA.W $4217 : STA.B $12 
    TAX 
    PEA.W .loopPadDataTableBegin-1 
    LDA.W $0CE7 
    AND.B #$FF 
    BEQ .offScreenLeft 
    DEC A 
    BEQ .onScreen 
    JMP.W Calculate_CrystalFlash_HDMADataTables_Scaled_RightOfScreen 


.onScreen:
    JMP.W Calculate_CrystalFlash_HDMADataTables_Scaled_OnScreen 


.offScreenLeft:
    JMP.W Calculate_CrystalFlash_HDMADataTables_Scaled_LeftOfScreen 


.loopPadDataTableBegin:
    STA.L $7EC406,X 
    XBA 
    STA.L $7EC506,X 
    XBA 
    DEX 
    BPL .loopPadDataTableBegin 
    LDX.B $12 
    INX 
    CPX.B #$C0 
    BEQ .finishedTable 
    LDA.B #$FF 

.loopPadDataTableEnd:
    STA.L $7EC406,X 
    INC A 
    STA.L $7EC506,X 
    DEC A 
    INX 
    CPX.B #$C0 
    BNE .loopPadDataTableEnd 

.finishedTable:
    LDA.W $0CEB 
    LSR #3
    AND.B #$1F 
    STA.B $12 
    ASL A 
    CLC 
    ADC.B $12 
    TAX 
    LDA.L PowerBombExplosion_Colors_red,X 
    ORA.B #$20 
    STA.W $0074 
    LDA.L PowerBombExplosion_Colors_green,X 
    ORA.B #$40 
    STA.W $0075 
    LDA.L PowerBombExplosion_Colors_blue,X 
    ORA.B #$80 
    STA.W $0076 
    REP #$30 
    PLY 
    PLX 
    LDA.W $0CEA 
    CLC 
    ADC.W $0CF0 
    STA.W $0CEA 
    CMP.W #$2000 
    BCC .lessThan2000 
    LDA.W #$0001 : STA.W $18E4,X 
    INC.W $18CC,X 
    INC.W $18CC,X 
    STZ.W $1908,X 
    JMP.W .return 


.lessThan2000:
    LDA.W $0CF0 
    CLC 
    ADC.L PowerBombExplosion_RadiusAcceleration 
    STA.W $0CF0 

.return:
    PLB 
    PLP 
    RTL 


FXType_20_22_ScrollingSky:
    PHP 
    REP #$30 
    LDA.W #$04E0 : STA.W $195E 
    LDA.W #$0006 : STA.W $196E 
    JSL.L Spawn_HDMAObject 
    db $02,$12 
    dw InstList_FXType_22_BG3YScroll_0 
    JSL.L Spawn_HDMAObject 
    db $42,$11 
    dw InstList_FXType_22_BG3XScroll_0 
    JSL.L Spawn_HDMAObject 
    db $42,$0D 
    dw InstList_FXType_22_BG1XScroll_0 
    PLP 

PreInstruction_FXType_22_BG3Yscroll:
    REP #$30 
    JSR.W Damage_Samus_IfSheIsInTheTopRow 
    LDA.W #FXType_22_RepeatingBG3StripsTable : STA.B $00 
    LDA.W #FXType_22_RepeatingBG3StripsTable+2 : STA.B $03 
    LDA.W #FXType_22_RepeatingBG3StripsTable+4 : STA.B $06 
    LDA.W #FXType_22_RepeatingBG3StripsTable+6 : STA.B $09 
    LDA.W #$004E : STA.B $18 
    JSR.W Calculate_FXType_22_BG3YScrollHDMATable 
    LDA.W #$0000 : STA.L $7E9C00,X 
    RTL 


Instruction_HDMAObjectPhaseIncreaseTimer_1:
    LDA.W #$0001 : STA.W $1920,X 
    RTS 


PreInstruction_FXType_22_BG3XScroll:
    PHP 
    REP #$30 
    PHB 
    PHX 
    PHY 
    LDA.W $0915 
    CMP.W #$0400 
    BPL .wavy 
    LDA.W $05B5 
    AND.W #$0001 
    BNE + 
    LDA.W $0596 
    INC #2
    AND.W #$001E 
    STA.W $0596 

  + LDY.W $0596 
    LDX.W #$0000 

.loop:
    LDA.W FXType_22_BG3XScrollHDMAData,Y : STA.L $7E9E80,X 
    INX #2
    INY #2
    CPY.W #$0020 
    BMI .loop 
    BRA .merge 


.wavy:
    DEC.W $1920,X 
    BNE + 
    LDA.W #$0006 : STA.W $1920,X 
    LDA.W $1914,X 
    INC #2
    AND.W #$001F 
    STA.W $1914,X 

  + LDA.W $1914,X 
    TAX 
    LDY.W #$001E 

.loopWavy:
    LDA.B $B1 
    CLC 
    ADC.W WaveDisplacementTable_Water,Y 
    STA.L $7E9E80,X 
    TXA 
    DEC #2
    AND.W #$001F 
    TAX 
    DEY #2
    BPL .loopWavy 

.merge:
    LDA.W #$0000 : STA.L $7E9E00 
    STA.L $7E9F00 
    LDA.W #$001F : STA.L $7E9E02 
    STA.L $7E9F02 
    STA.B $12 
    LDA.W #$9E00 ; $7E
    STA.L $7E9E03 
    STA.L $7E9F03 
    LDA.W $0915 
    CMP.W #$0400 
    BMI .lessThan400 
    LDA.W #$00B1 : STA.B $14 
    STZ.B $16 
    LDX.W #$0105 
    JSR.W Calculate_FXType_22_IndirectHDMATable 
    BRA + 


.lessThan400:
    LDA.W #$0000 : STA.L $7E9F02 

  + LDX.W #$0005 
    LDA.W #$9E80 ; $7E
    STA.B $14 
    LDA.W #$0080 : STA.B $16 
    JSR.W Calculate_FXType_22_IndirectHDMATable 
    LDA.W #$00E0 
    SEC 
    SBC.B $12 
    TAY 

.loopPad:
    TYA 
    SEC 
    SBC.W #$0010 
    BMI .lessThan10 
    TAY 
    LDA.W #$0090 : STA.L $7E9E00,X 
    STA.L $7E9F00,X 
    LDA.W #$9E80 ; $7E
    STA.L $7E9E01,X 
    STA.L $7E9F01,X 
    INX #3
    BRA .loopPad 


.lessThan10:
    TYA 
    CMP.W #$0000 
    BEQ + 
    CLC 
    ADC.W #$0080 

  + STA.L $7E9E00,X 
    STA.L $7E9F00,X 
    LDA.W #$9E80 ; $7E
    STA.L $7E9E01,X 
    STA.L $7E9F01,X 
    LDA.W #$0000 : STA.L $7E9E03,X 
    STA.L $7E9F03,X 
    PLY 
    PLX 
    PLB 
    PLP 
    RTL 


Calculate_FXType_22_IndirectHDMATable:
    LDA.W #$04C0 
    SEC 
    SBC.W $0915 
    STA.B $18 
    BMI .return 
    BEQ .return 
    CMP.W #$0080 
    BMI .onlyOneEntryNeeded 
    STA.B $12 
    CMP.W #$00C1 
    BMI .remainingScanlineCounter 
    LDA.W #$00C1 

.remainingScanlineCounter:
    STA.B $12 
    STA.B $18 

.loop:
    SEC 
    SBC.W #$0010 
    BMI .done 
    STA.B $18 
    LDA.W #$0010 
    ORA.B $16 
    STA.L $7E9E00,X 
    LDA.B $14 : STA.L $7E9E01,X 
    LDA.B $18 
    INX #3
    BRA .loop 


.onlyOneEntryNeeded:
    STA.B $12 

.done:
    LDA.B $18 
    ORA.B $16 
    STA.L $7E9E00,X 
    LDA.B $14 : STA.L $7E9E01,X 
    INX #3
    .return:
    RTS 


FXType_20_ScrollingSky_RoomSetupASM_ScrollingSkyLand:
    PHP 
    SEP #$30 
    LDA.W $091B 
    ORA.B #$01 
    STA.W $091B 
    LDA.W $091C 
    ORA.B #$01 
    STA.W $091C 
    JSL.L Spawn_HDMAObject 
    db $42,$0F 
    dw InstList_ScrollingSkyLand_BG2XScroll_0 
    REP #$30 
    LDA.W #$00E0 : STA.W $059A 
    STZ.W $059C 
    PLP 
    RTL 


RoomSetupASM_ScrollingSkyOcean:
    PHP 
    SEP #$30 
    LDA.B #$4A : STA.B $59 
    JSL.L Spawn_HDMAObject 
    db $42,$0F 
    dw InstList_ScrollingSkyOcean_BG2XScroll_0 
    REP #$30 
    LDA.W #$00E0 : STA.W $059A 
    STZ.W $059C 
    PLP 
    RTL 


Calculate_FXType_22_BG3YScrollHDMATable:
    PHB 
    PHK 
    PLB 
    LDA.W #$0020 : STA.W $0598 
    DEC A 
    STA.L $7E9C00 
    LDA.W #$0000 : STA.L $7E9C01 
    LDX.W #$0003 
    LDA.W $0915 
    CLC 
    ADC.W $0598 
    STA.B $12 
    LDY.W #$0000 

.loopFirstStrip:
    CMP.B ($00),Y 
    BMI + 
    CMP.B ($09),Y 
    BMI .foundFirstStrip 

  + INY #6
    CPY.B $18 
    BMI .loopFirstStrip 
    PLB 
    RTS 


.foundFirstStrip:
    LDA.B $12 
    CMP.W #$04E0 
    BMI .YposMod10 
    AND.W #$001F 
    BRA + 


.YposMod10:
    AND.W #$000F 

  + STA.B $16 
    LDA.B ($03),Y 
    SEC 
    SBC.B $16 
    STA.L $7E9C00,X 
    LDA.B ($06),Y 
    CLC 
    ADC.B $16 
    SEC 
    SBC.W $0598 
    STA.L $7E9C01,X 
    BRA .next 


.loopHDMATable:
    LDA.B $12 

.loopStrip:
    CMP.B ($00),Y 
    BMI + 
    CMP.B ($09),Y 
    BMI .foundStrip 

  + INY #6
    CPY.B $18 
    BMI .loopStrip 
    PLB 
    RTS 


.foundStrip:
    LDA.B ($03),Y : STA.L $7E9C00,X 
    LDA.B ($06),Y 
    SEC 
    SBC.W $0598 
    STA.L $7E9C01,X 

.next:
    LDA.L $7E9C00,X 
    AND.W #$00FF 
    STA.B $14 
    CLC 
    ADC.B $12 
    STA.B $12 
    INX #3
    LDA.B $14 
    CLC 
    ADC.W $0598 
    STA.W $0598 
    CMP.W #$00E0 
    BMI .loopHDMATable 
    PLB 
    RTS 


Damage_Samus_IfSheIsInTheTopRow:
    LDA.W $0AFA 
    SEC 
    SBC.W $0B00 
    BMI .8damage 
    CMP.W #$0011 
    BMI .8damage 
    RTS 


.8damage:
    LDA.W #$0008 : STA.W $0A50 
    RTS 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_Table_88A8DA:
; Looks like the format of FXType_22_RepeatingBG3StripsTable below
    dw $0000,$0010,$0020,$0020,$0010,$0030,$0040 
endif ; !FEATURE_KEEP_UNREFERENCED

FXType_22_RepeatingBG3StripsTable:
; This table defines sections of repeating strips of BG3
;        _______________ Section top position
;       |      _________ Strip height
;       |     |      ___ BG3 tilemap Y position
;       |     |     |
    dw $0000,$0010,$0020 
    dw $0030,$0010,$0030
    dw $0040,$0010,$0040
    dw $0300,$0010,$0050
    dw $0310,$0010,$0060
    dw $0330,$0010,$0070
    dw $0340,$0010,$0080
    dw $03A0,$0010,$0090
    dw $03B0,$0010,$00A0
    dw $03D0,$0010,$00B0
    dw $03E0,$0010,$00C0
    dw $04E0,$0020,$00D0
    dw $0500,$0020,$00F0
    dw $0600

FXType_22_BG3XScrollHDMAData:
; Looks like only the first line is used (see PreInstruction_FXType_22_BG3XScroll)
    dw $0000,$0001,$0002,$0003,$0003,$0002,$0001,$0000 
    dw $0000,$FFFF,$FFFE,$FFFD,$FFFD,$FFFE,$FFFF,$0000 
    dw $0000,$0001,$0002,$0003,$0003,$0002,$0001,$0000 
    dw $0000,$FFFF,$FFFE,$FFFD,$FFFD,$FFFE,$FFFF,$0000 
    dw $0000,$0001,$0002,$0003,$0003,$0002,$0001,$0000 
    dw $0000,$FFFF,$FFFE,$FFFD,$FFFD,$FFFE,$FFFF,$0000 
    dw $0000,$0001,$0002,$0003,$0003,$0002,$0001,$0000 
    dw $0000,$FFFF,$FFFE,$FFFD,$FFFD,$FFFE,$FFFF,$0000 
    dw $0000,$0001,$0002,$0003,$0003,$0002,$0001,$0000 
    dw $0000,$FFFF,$FFFE,$FFFD,$FFFD,$FFFE,$FFFF,$0000 
    dw $0000,$0001,$0002,$0003,$0003,$0002,$0001,$0000 
    dw $0000,$FFFF,$FFFE,$FFFD,$FFFD,$FFFE,$FFFF,$0000 
    dw $0000,$0001,$0002,$0003,$0003,$0002,$0001,$0000 
    dw $0000,$FFFF,$FFFE,$FFFD,$FFFD,$FFFE,$FFFF,$0000 
    dw $0000,$0001,$0002,$0003,$0003,$0002,$0001,$0000 
    dw $0000,$FFFF,$FFFE,$FFFD,$FFFD,$FFFE,$FFFF,$0000 
    dw $0000,$0001,$0002,$0003,$0003,$0002,$0001,$0000 
    dw $0000,$FFFF,$FFFE,$FFFD,$FFFD,$FFFE,$FFFF,$0000 
    dw $0000,$0001,$0002,$0003,$0003,$0002,$0001,$0000 
    dw $0000,$FFFF,$FFFE,$FFFD,$FFFD,$FFFE,$FFFF,$0000 
    dw $0000,$0001,$0002,$0003,$0003,$0002,$0001,$0000 
    dw $0000,$FFFF,$FFFE,$FFFD,$FFFD,$FFFE,$FFFF,$0000 
    dw $0000,$0001,$0002,$0003,$0003,$0002,$0001,$0000 
    dw $0000,$FFFF,$FFFE,$FFFD,$FFFD,$FFFE,$FFFF,$0000 
    dw $0000,$0001,$0002,$0003,$0003,$0002,$0001,$0000 
    dw $0000,$FFFF,$FFFE,$FFFD,$FFFD,$FFFE,$FFFF,$0000 
    dw $0000,$0001,$0002,$0003,$0003,$0002,$0001,$0000 
    dw $0000,$FFFF,$FFFE,$FFFD,$FFFD,$FFFE,$FFFF,$0000 
    dw $0000,$0001,$0002,$0003,$0003,$0002,$0001,$0000 
    dw $0000,$FFFF,$FFFE,$FFFD,$FFFD,$FFFE,$FFFF,$0000 
    dw $0000,$0001,$0002,$0003,$0003,$0002,$0001,$0000 
    dw $0000,$FFFF,$FFFE,$FFFD,$FFFD,$FFFE,$FFFF,$0000 
    dw $0000,$0001,$0002,$0003,$0003,$0002,$0001,$0000 
    dw $0000,$FFFF,$FFFE,$FFFD,$FFFD,$FFFE,$FFFF,$0000 
    dw $0000,$0001,$0002,$0003,$0003,$0002,$0001,$0000 
    dw $0000,$FFFF,$FFFE,$FFFD,$FFFD,$FFFE,$FFFF,$0000 
    dw $0000,$0001,$0002,$0003,$0003,$0002,$0001,$0000 
    dw $0000,$FFFF,$FFFE,$FFFD,$FFFD,$FFFE,$FFFF,$0000 
    dw $0000,$0001,$0002,$0003,$0003,$0002,$0001,$0000 
    dw $0000,$FFFF,$FFFE,$FFFD,$FFFD,$FFFE,$FFFF,$0000 
    dw $0000,$0001,$0002,$0003,$0003,$0002,$0001,$0000 
    dw $0000,$FFFF,$FFFE,$FFFD,$FFFD,$FFFE,$FFFF,$0000 
    dw $0000,$0001,$0002,$0003,$0003,$0002,$0001,$0000 
    dw $0000,$FFFF,$FFFE,$FFFD,$FFFD,$FFFE,$FFFF,$0000 
    dw $0000,$0001,$0002,$0003,$0003,$0002,$0001,$0000 
    dw $0000,$FFFF,$FFFE,$FFFD,$FFFD,$FFFE,$FFFF,$0000 
    dw $0000,$0001,$0002,$0003,$0003,$0002,$0001,$0000 
    dw $0000,$FFFF,$FFFE,$FFFD,$FFFD,$FFFE,$FFFF,$0000 
    dw $0000,$0001,$0002,$0003,$0003,$0002,$0001,$0000 
    dw $0000,$FFFF,$FFFE,$FFFD,$FFFD,$FFFE,$FFFF,$0000 
    dw $0000,$0001,$0002,$0003,$0003,$0002,$0001,$0000 
    dw $0000,$FFFF,$FFFE,$FFFD,$FFFD,$FFFE,$FFFF,$0000 
    dw $0000,$0001,$0002,$0003,$0003,$0002,$0001,$0000 
    dw $0000,$FFFF,$FFFE,$FFFD,$FFFD,$FFFE,$FFFF,$0000 
    dw $0000,$0001,$0002,$0003,$0003,$0002,$0001,$0000 
    dw $0000,$FFFF,$FFFE,$FFFD,$FFFD,$FFFE,$FFFF,$0000 
    dw $0000,$0001,$0002,$0003,$0003,$0002,$0001,$0000 
    dw $0000,$FFFF,$FFFE,$FFFD,$FFFD,$FFFE,$FFFF,$0000 
    dw $0000,$0001,$0002,$0003,$0003,$0002,$0001,$0000 
    dw $0000,$FFFF,$FFFE,$FFFD,$FFFD,$FFFE,$FFFF,$0000 
    dw $0000,$0001,$0002,$0003,$0003,$0002,$0001,$0000 
    dw $0000,$FFFF,$FFFE,$FFFD,$FFFD,$FFFE,$FFFF,$0000 
    dw $0000,$0001,$0002,$0003,$0003,$0002,$0001,$0000 
    dw $0000,$FFFF,$FFFE,$FFFD,$FFFD,$FFFE,$FFFF,$0000 

RTL_88AD38:
    RTL 


InstList_FXType_22_BG1XScroll_0:
    dw Instruction_HDMAObject_HDMATableBank : db $7E 
    dw Instruction_HDMAObject_IndirectHDMATableBank : db $7E 
    dw Instruction_HDMAObjectPhaseIncreaseTimer_1 
    dw Instruction_HDMAObject_PreInstructionInY 
    dl RTL_88AD38 

InstList_FXType_22_BG1XScroll_1:
    dw $7000,$9F02 ; $7E9F02
    dw Instruction_HDMAObject_GotoY 
    dw InstList_FXType_22_BG1XScroll_1 

InstList_FXType_22_BG3XScroll_0:
    dw Instruction_HDMAObject_HDMATableBank : db $7E 
    dw Instruction_HDMAObject_IndirectHDMATableBank : db $7E 
    dw Instruction_HDMAObjectPhaseIncreaseTimer_1 
    dw Instruction_HDMAObject_PreInstructionInY 
    dl PreInstruction_FXType_22_BG3XScroll 

InstList_FXType_22_BG3XScroll_1:
    dw $7000,$9E02 ; $7E9E02
    dw Instruction_HDMAObject_GotoY 
    dw InstList_FXType_22_BG3XScroll_1 

InstList_FXType_22_BG3YScroll_0:
    dw Instruction_HDMAObject_HDMATableBank : db $7E 
    dw Instruction_HDMAObject_IndirectHDMATableBank : db $7E 
    dw Instruction_HDMAObject_PreInstructionInY 
    dl PreInstruction_FXType_22_BG3Yscroll 

InstList_FXType_22_BG3YScroll_1:
    dw $7000,$9C00 ; $7E9C00
    dw Instruction_HDMAObject_GotoY 
    dw InstList_FXType_22_BG3YScroll_1 

InstList_ScrollingSkyLand_BG2XScroll_0:
    dw Instruction_HDMAObject_HDMATableBank : db $7E 
    dw Instruction_HDMAObject_IndirectHDMATableBank : db $7E 
    dw Instruction_HDMAObject_PreInstructionInY 
    dl PreInstruction_ScrollingSkyLand_BG2XScroll 

InstList_ScrollingSkyLand_BG2XScroll_1:
    dw $7000,$9F00 ; $7E9F00
    dw Instruction_HDMAObject_GotoY 
    dw InstList_ScrollingSkyLand_BG2XScroll_1 

InstList_ScrollingSkyOcean_BG2XScroll_0:
    dw Instruction_HDMAObject_HDMATableBank : db $7E 
    dw Instruction_HDMAObject_IndirectHDMATableBank : db $7E 
    dw Instruction_HDMAObject_PreInstructionInY 
    dl PreInstruction_ScrollingSkyOcean_BG2XScroll 

InstList_ScrollingSkyOcean_BG2XScroll_1:
    dw $7000,$9F00 ; $7E9F00
    dw Instruction_HDMAObject_GotoY 
    dw InstList_ScrollingSkyOcean_BG2XScroll_1 

ScrollingSkyLand_ChunkPointers:
    dw ScrollingSky_Tilemaps_0 
    dw ScrollingSky_Tilemaps_1 
    dw ScrollingSky_Tilemaps_2 
    dw ScrollingSky_Tilemaps_3 
    dw ScrollingSky_Tilemaps_4 

ScrollingSkyOcean_ChunkPointesr:
    dw ScrollingSky_Tilemaps_0 
    dw ScrollingSky_Tilemaps_1 
    dw ScrollingSky_Tilemaps_2 
    dw ScrollingSky_Tilemaps_3 
    dw ScrollingSky_Tilemaps_5 
    dw ScrollingSky_Tilemaps_8AE180 

PreInstruction_ScrollingSkyLand_BG2XScroll:
    REP #$30 
    LDA.W $0A78 
    BEQ Handle_ScrollingSky_BG2XScroll_HDMATables 
    RTL 


PreInstruction_ScrollingSkyOcean_BG2XScroll:
    REP #$30 
    LDA.W $0A78 
    BEQ Handle_ScrollingSky_BG2XScroll_HDMATables 
    RTL 


Handle_ScrollingSky_BG2XScroll_HDMATables:
    SEP #$30 
    LDA.B #$4A : STA.B $59 
    REP #$30 
    LDY.W #$0000 

.loopDataTable:
    LDA.W ScrollingSky_ScrollingTable_HDMADataTableEntryPointer,Y 
    TAX 
    LDA.W ScrollingSky_ScrollingTable_scrollSubspeed,Y 
    CLC 
    ADC.L $7E0000,X 
    STA.L $7E0000,X 
    LDA.W ScrollingSky_ScrollingTable_scrollSpeed,Y 
    ADC.L $7E0002,X 
    STA.L $7E0002,X 
    TYA 
    CLC 
    ADC.W #$0008 
    TAY 
    CMP.W #$00B8 
    BMI .loopDataTable 
    LDA.W #$0000 : STA.L $7E9FD8 
    STA.L $7E9FDA 
    LDA.W #$001F : STA.L $7E9F00 
    LDA.W #$059E : STA.L $7E9F01 
    LDA.W $0915 
    CLC 
    ADC.W #$0020 
    STA.B $12 
    CLC 
    ADC.W #$00C0 
    STA.B $14 
    LDY.W #$0000 
    LDX.W #$0003 

.loopIndirectTable:
    LDA.B $12 
    CMP.W ScrollingSky_ScrollingTable_topPosition,Y 
    BMI + 
    CMP.W ScrollingSky_ScrollingTable_nextEntry,Y 
    BMI .scrollingSection 

  + TYA 
    CLC 
    ADC.W #$0008 
    TAY 
    CMP.W #$00B8 
    BMI .loopIndirectTable 
    LDA.W #$05FF 
    SEC 
    SBC.B $12 

.loopNonScrollingSection:
    STA.B $18 
    CMP.W #$0080 
    BMI .lessThan80 
    LDA.W #$007F : STA.L $7E9F00,X 
    LDA.W #$00B5 : STA.L $7E9F01,X 
    INX #3
    LDA.B $18 
    SEC 
    SBC.W #$007F 
    BRA .loopNonScrollingSection 


.lessThan80:
    STA.L $7E9F00,X 
    LDA.W #$00B5 : STA.L $7E9F01,X 
    LDA.W #$0000 : STA.L $7E9F03,X 
    RTL 


.scrollingSection:
    LDA.W ScrollingSky_ScrollingTable_nextEntry,Y 
    SEC 
    SBC.B $12 
    STA.B $18 
    CMP.W #$0080 
    BMI .heightLessThan80 
    LDA.W #$007F : STA.L $7E9F00,X 
    LDA.W ScrollingSky_ScrollingTable_HDMADataTableEntryPointer,Y 
    INC #2
    STA.L $7E9F01,X 
    INX #3
    LDA.B $18 
    SEC 
    SBC.W #$007F 

.heightLessThan80:
    STA.L $7E9F00,X 
    LDA.W ScrollingSky_ScrollingTable_HDMADataTableEntryPointer,Y 
    CLC 
    ADC.W #$0002 
    STA.L $7E9F01,X 
    LDA.B $18 
    CLC 
    ADC.B $12 
    STA.B $12 
    INX #3
    LDA.B $12 
    CMP.B $14 
    BPL .terminateTable 
    JMP.W .loopIndirectTable 


.terminateTable:
    LDA.W #$0000 : STA.L $7E9F03,X 
    RTL 


ScrollingSky_ScrollingTable:
; Scrolling sky scroll table
;                        ________________ Top position of scrolling section
;                       |     ___________ Scroll subspeed
;                       |    |     ______ Scroll speed
;                       |    |    |     _ Pointer to HDMA data table entry
;                       |    |    |    |
  .topPosition
    dw $0000 
  .scrollSubspeed
    dw $8000 
  .scrollSpeed
    dw $0000 
  .HDMADataTableEntryPointer
    dw $9F80 
  .nextEntry
    dw $0010,$C000,$0000,$9F84 
    dw $0038,$8000,$0000,$9F88 
    dw $00D0,$C000,$0000,$9F8C 
    dw $00E0,$8000,$0000,$9F90 
    dw $0120,$C000,$0000,$9F94 
    dw $01A0,$8000,$0000,$9F98 
    dw $01D8,$C000,$0000,$9F9C 
    dw $0238,$8000,$0000,$9FA0 
    dw $0268,$C000,$0000,$9FA4 
    dw $02A0,$8000,$0000,$9FA8 
    dw $02E0,$C000,$0000,$9FA0 
    dw $0300,$8000,$0000,$9FB0 
    dw $0320,$C000,$0000,$9FB4 
    dw $0350,$8000,$0000,$9FB8 
    dw $0378,$C000,$0000,$9FBC 
    dw $03C8,$8000,$0000,$9FC0 
    dw $0440,$7000,$0000,$9FC4 
    dw $0460,$C000,$0000,$9FC8 
    dw $0480,$8000,$0000,$9FCC 
    dw $0490,$0000,$0000,$9FD0 
    dw $04A8,$0000,$0000,$9FD4 
    dw $04B8,$0000,$0000,$9FD8 
    dw $0500
; Unused continuation
    dw $0500,$0000,$0000,$9FDC 
    dw $0578,$0000,$0000,$9FE0 
    dw $05F0 

RoomMainASM_ScrollingSkyLand:
    LDA.W #ScrollingSkyLand_ChunkPointers : STA.B $00 
    LDA.W #$0088 : STA.B $02 
    BRA RoomMainASM_ScrollingSky 


RoomMainASM_ScrollingSkyOcean:
    LDA.W #ScrollingSkyOcean_ChunkPointesr : STA.B $00 
    LDA.W #$0088 : STA.B $02 

RoomMainASM_ScrollingSky:
    LDA.W $0A78 
    BEQ .timeNotFrozen 
    LDA.W #$0000 : STA.L $7E9F00 
    RTL 


.timeNotFrozen:
    REP #$30 
    LDA.W $0915 : STA.B $B7 
    LDX.W $0330 
    LDA.W #$0040 : STA.B $D0,X 
    STA.B $D7,X 
    STA.B $DE,X 
    STA.B $E5,X 
    LDA.W $0915 
    AND.W #$07F8 
    SEC 
    SBC.W #$0010 
    PHA 
    AND.W #$FF00 
    XBA 
    ASL A 
    TAY 
    PLA 
    AND.W #$00FF 
    ASL #3
    CLC 
    ADC.B [$00],Y 
    STA.B $D2,X 
    CLC 
    ADC.W #$0040 
    STA.B $D9,X 
    LDA.W $0915 
    AND.W #$07F8 
    CLC 
    ADC.W #$00F0 
    PHA 
    AND.W #$FF00 
    XBA 
    ASL A 
    TAY 
    PLA 
    AND.W #$00FF 
    ASL #3
    CLC 
    ADC.B [$00],Y 
    STA.B $E0,X 
    CLC 
    ADC.W #$0040 
    STA.B $E7,X 
    SEP #$20 
    LDA.B #$8A : STA.B $D4,X 
    STA.B $DB,X 
    STA.B $E2,X 
    STA.B $E9,X 
    REP #$20 
    LDA.B $59 
    AND.W #$00FC 
    XBA 
    STA.B $12 
    LDA.W $0915 
    SEC 
    SBC.W #$0010 
    AND.W #$01F8 
    ASL #2
    CLC 
    ADC.B $12 
    STA.B $D5,X 
    CLC 
    ADC.W #$0020 
    STA.B $DC,X 
    LDA.W $0915 
    CLC 
    ADC.W #$00F0 
    AND.W #$01F8 
    ASL #2
    CLC 
    ADC.B $12 
    STA.B $E3,X 
    CLC 
    ADC.W #$0020 
    STA.B $EA,X 
    TXA 
    CLC 
    ADC.W #$001C 
    STA.W $0330 
    RTL 


Fireflea_Flashing_Shades:
; Indexed by [fireflea flashing index] * 2
    dw $0000,$0100,$0200,$0300,$0400,$0500,$0600,$0500 
    dw $0400,$0300,$0200,$0100 

Fireflea_Darkness_Shades:
; Indexed by [fireflea darkness level]
    dw $0000,$0600,$0C00,$1200,$1800,$1900 

FXType_24_Fireflea:
    PHP 
    REP #$30 
    LDA.W #$0006 : STA.W $1778 
    STZ.W $177A 
    JSL.L Spawn_HDMAObject 
    db $42,$11 
    dw InstList_Fireflea_BG3XScroll_0 
    LDA.W #$0000 : STA.L $7E9E00 
    STZ.W $177C 
    STZ.W $177E 
    LDA.W #$0018 : STA.W $1780 
    LDA.L Fireflea_Flashing_Shades : STA.W $1782 
    PLP 
    RTL 


InstList_Fireflea_BG3XScroll_0:
    dw Instruction_HDMAObject_HDMATableBank : db $7E 
    dw Instruction_HDMAObject_PreInstructionInY 
    dl PreInstruction_Fireflea_BG3XScroll 

InstList_Fireflea_BG3XScroll_1:
    dw $0001,$9E00 ; $7E9E00
    dw Instruction_HDMAObject_GotoY 
    dw InstList_Fireflea_BG3XScroll_1 

PreInstruction_Fireflea_BG3XScroll:
    PHP 
    REP #$30 
    LDA.W $1986 
    AND.W #$FF00 
    ORA.W #$000C 
    STA.W $1986 
    LDA.W $0A78 
    BNE .return 
    DEC.W $1778 
    BNE .nonZero 
    LDA.W #$0006 : STA.W $1778 
    LDA.W $177E 
    CMP.W #$000A 
    BMI .lessThanA 
    LDA.W #$0006 
    BRA .storeIndex 


.lessThanA:
    LDA.W $177A 
    INC A 
    CMP.W #$000C 
    BCC .storeIndex 
    LDA.W #$0000 

.storeIndex:
    STA.W $177A 

.nonZero:
    REP #$30 
    LDA.W $177A 
    ASL A 
    TAX 
    LDA.L Fireflea_Flashing_Shades,X 
    LDX.W $177E 
    CLC 
    ADC.L Fireflea_Darkness_Shades,X 
    XBA 
    TAX 
    SEP #$30 
    ORA.B #$80 
    STA.B $75 
    TXA 
    ORA.B #$40 
    STA.B $76 
    TXA 
    ORA.B #$20 
    STA.B $74 

.return:
    PLP 
    RTL 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_Spawn_ExpandingContractingEffect_HDMAObject_88B11E:
    PHP 
    REP #$30 
    STZ.W $05A0 
    STZ.W $059A 
    LDA.W #$0080 : STA.W $05A4 
    STA.W $05A6 
    LDA.W #$007F : STA.W $05A8 
    STA.W $05AA 
    LDA.W #$2000 : STA.W $05A2 
    LDA.W #$00FF : STA.L $7E9E00 
    LDA.W #$9C00 ; $7E
    STA.L $7E9E01 
    LDA.W #$00E1 : STA.L $7E9E03 
    LDA.W #$9CFE ; $7E
    STA.L $7E9E04 
    LDA.W #$0000 : STA.L $7E9E06 
    JSL.L Spawn_HDMAObject 
    db $42,$10 
    dw InstList_ExpandingContractingEffect_BG2YScroll_0 
    PLP 
    RTL 
endif ; !FEATURE_KEEP_UNREFERENCED


InstList_ExpandingContractingEffect_BG2YScroll_0:
    dw Instruction_HDMAObject_HDMATableBank : db $7E 
    dw Instruction_HDMAObject_IndirectHDMATableBank : db $7E 
    dw Instruction_HDMAObject_PreInstructionInY 
    dl PreInstruction_ExpandingContractingEffect_BG2YScroll 

InstList_ExpandingContractingEffect_BG2YScroll_1:
    dw $7777,$9E00 ; $7E9E00
    dw Instruction_HDMAObject_GotoY 
    dw InstList_ExpandingContractingEffect_BG2YScroll_1 

PreInstruction_ExpandingContractingEffect_BG2YScroll:
    PHP 
    REP #$30 
    INC.W $059A 
    LDA.W $059A 
    CMP.W #$0004 
    BMI .counterLessThan4 
    STZ.W $059A 
    LDA.W $05A0 
    BEQ .expanding 
    LDA.W $05A2 
    SEC 
    SBC.W #$0400 
    STA.W $05A2 
    CMP.W #$2000 
    BPL + 
    LDA.W #$2000 : STA.W $05A2 
    STZ.W $05A0 
    BRA + 


.expanding:
    LDA.W $05A2 
    CLC 
    ADC.W #$0400 
    STA.W $05A2 
    CMP.W #$8000 
    BMI + 
    INC.W $05A0 

  + LDA.W #$0080 : STA.W $05A4 
    STA.W $05A6 
    LDA.W #$007F : STA.W $05A8 
    STA.W $05AA 

.counterLessThan4:
    LDA.W $05A4 
    ASL A 
    TAX 
    LDA.W $05A8 
    ASL A 
    TAY 
    STZ.B $12 
    LDA.W #$0020 : STA.B $14 

.loop:
    LDA.W $05A6 
    SEC 
    SBC.W $05A4 
    STA.L $7E9C00,X 
    PHX 
    TYX 
    LDA.W $05AA 
    SEC 
    SBC.W $05A8 
    STA.L $7E9C00,X 
    PLX 
    LDA.B $12 
    CLC 
    ADC.W $05A2 
    STA.B $12 
    BVS + 
    INC.W $05A6 
    DEC.W $05AA 

  + INC.W $05A4 
    DEC.W $05A8 
    DEY #2
    INX #2
    DEC.B $14 
    BNE .loop 
    PLP 
    RTL 


Handle_Earthquake_SoundEffect:
    PHX 
    PHY 
    PHP 
    REP #$30 
    LDA.W $0609 
    BMI .return 
    DEC A 
    STA.W $0609 
    BPL .return 
    LDX.W $0607 
    LDA.W .soundIndex,X 
    BPL .quake 
    LDX.W #$0000 
    LDA.W .soundIndex,X 

.quake:
    JSL.L QueueSound_Lib2_Max6 
    LDA.W $05E5 
    AND.W #$0003 
    ADC.W .baseTimer,X 
    STA.W $0609 
    INX #4
    STX.W $0607 

.return:
    PLP 
    PLY 
    PLX 
    RTS 

;        _________ Sound index (sound library 2)
;       |      ___ Base timer
;       |     |
.soundIndex:
    dw $0046 
.baseTimer:
    dw       $0001
    dw $0046,$0003
    dw $0046,$0002
    dw $0046,$0001
    dw $0046,$0001
    dw $0046,$0002
    dw $0046,$0002
    dw $0046,$0001
    dw $8000


RTL_88B278:
    RTL 


FXType_2_Lava:
    LDA.W #FXRisingFunction_LavaAcid_Normal : STA.W $196C 
    LDA.W $1978 : STA.W $1962 
    JSL.L Spawn_HDMAObject 
    db $42,$12 
    dw InstList_LavaAcidBG3_Yscroll 
    JSL.L Spawn_HDMAObject 
    db $42,$10 
    dw InstList_LavaAcidBG2_Yscroll 
    JSL.L Spawn_BG3_Scroll_HDMA_Object 
    LDY.W #AnimatedTilesObject_Lava 
    JSL.L Spawn_AnimatedTilesObject 
    RTL 


FXType_4_Acid:
    LDA.W #FXRisingFunction_LavaAcid_Normal : STA.W $196C 
    LDA.W $1978 : STA.W $1962 
    JSL.L Spawn_HDMAObject 
    db $42,$12 
    dw InstList_LavaAcidBG3_Yscroll 
    JSL.L Spawn_HDMAObject 
    db $42,$10 
    dw InstList_LavaAcidBG2_Yscroll 
    JSL.L Spawn_BG3_Scroll_HDMA_Object 
    LDY.W #AnimatedTilesObject_Acid 
    JSL.L Spawn_AnimatedTilesObject 
    RTL 


Handle_Tide:
    BIT.W $197D 
    BMI .smallTide 
    BVS .bigTide 
    RTS 


.smallTide:
    STZ.W $1970 
    STZ.W $1972 
    LDA.W $1975 
    AND.W #$00FF 
    ASL A 
    TAX 
    LDA.L SineCosineTables_NegativeCosine_SignExtended,X 
    ASL #3
    BPL + 
    DEC.W $1972 

  + STA.W $1971 
    LDA.L SineCosineTables_NegativeCosine_SignExtended,X 
    BPL .smallBelowMidpoint 
    LDA.W $1974 
    CLC 
    ADC.W #$00C0 
    BRA .returnSmallTide 


.smallBelowMidpoint:
    LDA.W $1974 
    CLC 
    ADC.W #$0120 

.returnSmallTide:
    STA.W $1974 
    RTS 


.bigTide:
    STZ.W $1970 
    STZ.W $1972 
    LDA.W $1975 
    AND.W #$00FF 
    ASL A 
    TAX 
    LDA.L SineCosineTables_NegativeCosine_SignExtended,X 
    ASL #5
    BPL + 
    DEC.W $1972 

  + STA.W $1971 
    LDA.L SineCosineTables_NegativeCosine_SignExtended,X 
    BPL .bigBelowMidpoint 
    LDA.W $1974 
    CLC 
    ADC.W #$0080 
    BRA .returnBigTide 


.bigBelowMidpoint:
    LDA.W $1974 
    CLC 
    ADC.W #$00E0 

.returnBigTide:
    STA.W $1974 
    RTS 


RTS_88B341:
    RTS 


RTS_88B342:
    RTS 


FXRisingFunction_LavaAcid_Normal:
    LDA.W $197C 
    BEQ .return3 
    BMI .negative 
    LDA.W $197A 
    CMP.W $1978 
    BEQ .return1 
    BCS .doRise 

.return1:
    RTS 


.negative:
    LDA.W $197A 
    CMP.W $1978 
    BEQ .return2 
    BCC .doRise 

.return2:
    RTS 


.doRise:
    LDA.W #FXRisingFunction_LavaAcid_WaitToRise : STA.W $196C 

.return3:
    RTS 


FXRisingFunction_LavaAcid_WaitToRise:
    JSR.W Handle_Earthquake_SoundEffect 
    LDA.W #$0015 : STA.W $183E 
    LDA.W #$0020 
    TSB.W $1840 
    DEC.W $1980 
    BNE .return 
    LDA.W #FXRisingFunction_LavaAcid_Rising : STA.W $196C 

.return:
    RTS 


FXRisingFunction_LavaAcid_Rising:
    JSR.W Handle_Earthquake_SoundEffect 
    LDA.W #$0015 : STA.W $183E 
    LDA.W #$0020 
    TSB.W $1840 
    JSR.W RaiseOrLower_FX 
    BCS .reachedTarget 
    RTS 


.reachedTarget:
    STZ.W $197C 
    LDA.W #FXRisingFunction_LavaAcid_Normal : STA.W $196C 
    RTS 


Lava_SoundEffects:
; Sound library 2. Chosen randomly from the following
    db $12,$13,$14,$12,$13,$14,$12,$13 

Instruction_LavaSoundTimer_70:
    LDA.W #$0070 : STA.W $192C,X 
    RTS 


PreInstruction_LavaAcid_BG3YScroll:
    PHB 
    LDA.W $1984 : STA.W $1986 
    LDA.W $0A78 
    BEQ .timeNotFrozen 
    PLB 
    RTL 


.timeNotFrozen:
    REP #$30 
    PEA.W .manualReturn-1 
    JMP.W ($196C) 


.manualReturn:
    JSR.W Handle_Tide 
    SEP #$10 
    LDA.W $1976 
    CLC 
    ADC.W $1970 
    STA.W $1960 
    LDA.W $1978 
    ADC.W $1972 
    STA.W $1962 
    LDA.B $B1 : STA.L $7ECADC 
    LDA.W #$0000 : STA.L $7E9C00 
    LDA.W #$0000 : STA.L $7ECADE 
    LDA.W $1962 
    BMI .offScreen 
    SEC 
    SBC.W $0915 
    BEQ + 
    BPL .positive 

  + EOR.W #$001F 
    AND.W #$001F 
    ORA.W #$0100 
    BRA .merge 


.positive:
    CMP.W #$0100 
    BCC .onScreen 

.offScreen:
    LDA.W #$0000 
    BRA .merge 


.onScreen:
    EOR.W #$00FF 
    AND.W #$00FF 

.merge:
    STA.L $7E9C02 
    LDX.W $18B2 
    LDA.W $196E 
    CMP.W #$0002 
    BNE + 
    LDA.W $1962 
    BMI + 
    DEC.W $192C,X 
    BNE + 
    LDA.W #$0070 : STA.W $192C,X 
    LDA.W $05E5 
    AND.W #$0007 
    TAY 
    LDA.W Lava_SoundEffects,Y 
    AND.W #$00FF 
    JSL.L QueueSound_Lib2_Max6 

  + LDA.W $05E5 
    XBA 
    STA.W $05E5 
    LDX.W $18B2 
    LDA.W $18C0,X 
    AND.W #$00FF 
    TAY 
    LDA.W $1962 
    BMI .negative 
    SEC 
    SBC.W $0915 
    CLC 
    ADC.W #$0100 
    BPL + 
    LDA.W #$00FF 
    BRA .merge2 


  + CMP.W #$0200 
    BCC .merge2 

.negative:
    LDA.W #$01FF 

.merge2:
    EOR.W #$01FF 
    INC A 
    AND.W #$03FF 
    STA.B $12 
    LDA.B $12 
    ASL A 
    CLC 
    ADC.B $12 
    ADC.W #IndirectHDMATable_LavaAcid_BG3Yscroll 
    STA.W $18D8,X 
    PLB 
    RTL 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_WaveDisplacementTable_88B48E:
; Wave displacement table. Same as the data at Setup_LavaAcid_BG2YScrollDataTable_VerticallyWavy_waveDisplacementTable
    dw $0000,$0001,$0001,$0000,$0000,$FFFF,$FFFF,$0000 
    dw $0000,$0001,$0001,$0000,$0000,$FFFF,$FFFF,$0000 
    dw $0000,$0001,$0001,$0000,$0000,$FFFF,$FFFF,$0000 
    dw $0000,$0001,$0001,$0000,$0000,$FFFF,$FFFF,$0000 
endif ; !FEATURE_KEEP_UNREFERENCED

Instruction_HDMAObject_PhaseDecreaseTimer_1:
    LDA.W #$0001 : STA.W $1920,X 
    RTS 


PreInstruction_LavaAcid_BG2YScroll:
    PHB 
    LDA.B $B7 : STA.L $7E9C44 
    LDA.W $0A78 
    BNE .timeNotFrozen 
    LDA.W $197E 
    BIT.W #$0006 
    BNE .wavy 

.timeNotFrozen:
    LDX.W $18B2 
    JSR.W Setup_LavaAcid_BG2YScrollDataTable_NotWavy 
    BRA .merge 


.wavy:
    BIT.W #$0002 
    BNE .verticallyWavy 
    LDX.W $18B2 
    JSR.W Setup_LavaAcid_BG2YScrollDataTable_HorizontallyWavy 
    BRA .merge 


.verticallyWavy:
    LDX.W $18B2 
    JSR.W Setup_LavaAcid_BG2YScrollDataTable_VerticallyWavy 

.merge:
    LDX.W $18B2 
    LDA.B $B7 
    AND.W #$000F 
    STA.B $12 
    LDA.B $12 
    ASL A 
    CLC 
    ADC.B $12 
    CLC 
    ADC.W #IndirectHDMATable_LavaAcidBG2_Yscroll 
    STA.W $18D8,X 
    PLB 
    RTL 


Setup_LavaAcid_BG2YScrollDataTable_NotWavy:
    SEP #$20 
    LDY.W $18C0,X 
    LDA.B #$10 : STA.W $4301,Y 
    REP #$20 
    PHX 
    LDX.B #$1E 
    LDA.B $B7 
    AND.W #$01FF 

.loop:
    STA.L $7E9C46,X 
    DEX #2
    BPL .loop 
    PLX 
    RTS 


Setup_LavaAcid_BG2YScrollDataTable_HorizontallyWavy:
    SEP #$20 
    LDY.W $18C0,X 
    LDA.B #$0F : STA.W $4301,Y 
    REP #$20 
    DEC.W $1920,X 
    BNE .nonZeroTimer 
    LDA.W #$0006 : STA.W $1920,X 
    LDA.W $1914,X 
    DEC #2
    AND.W #$001E 
    STA.W $1914,X 

.nonZeroTimer:
    PHX 
    LDY.W $1914,X 
    LDX.B #$1E 
    LDA.W #$000F : STA.B $12 

.loop:
    LDA.B $B5 
    CLC 
    ADC.W .waveDisplacementTable,Y 
    AND.W #$01FF 
    STA.L $7E9C46,X 
    TYA 
    DEC #2
    AND.W #$001E 
    TAY 
    TXA 
    DEC #2
    AND.W #$001E 
    TAX 
    DEC.B $12 
    BPL .loop 
    PLX 
    RTS 


.waveDisplacementTable:
    dw $0000,$0000,$0001,$0001,$0001,$0001,$0000,$0000 
    dw $FFFF,$FFFF,$FFFF,$FFFF,$0000,$0000,$0000,$0000 

Setup_LavaAcid_BG2YScrollDataTable_VerticallyWavy:
    SEP #$20 
    LDY.W $18C0,X 
    LDA.B #$10 : STA.W $4301,Y 
    REP #$20 
    DEC.W $1920,X 
    BNE .nonZeroTimer 
    LDA.W #$0004 : STA.W $1920,X 
    LDA.W $1914,X 
    DEC #2
    AND.W #$001E 
    STA.W $1914,X 

.nonZeroTimer:
    PHX 
    LDA.B $B7 
    AND.W #$000F 
    ASL A 
    PHA 
    CLC 
    ADC.W $1914,X 
    AND.W #$001E 
    TAY 
    PLA 
    CLC 
    ADC.W #$001E 
    AND.W #$001E 
    TAX 
    LDA.W #$000F : STA.B $12 

.loop:
    LDA.B $B7 
    CLC 
    ADC.W .waveDisplacementTable,Y 
    AND.W #$01FF 
    STA.L $7E9C46,X 
    TXA 
    DEC #2
    AND.W #$001E 
    TAX 
    TYA 
    DEC #2
    AND.W #$001E 
    TAY 
    DEC.B $12 
    BPL .loop 
    PLX 
    RTS 

  .waveDisplacementTable
    dw $0000,$0001,$0001,$0000,$0000,$FFFF,$FFFF,$0000 
    dw $0000,$0001,$0001,$0000,$0000,$FFFF,$FFFF,$0000 


IndirectHDMATable_LavaAcid_BG3Yscroll:
; 81h,$9C00 x F0h
; 81h,$9C02 x 190h
; 60h,$9C02 x 2
; 0

; Disregarding the unnecessary nature of the lava/acid BG3 Y scroll HDMA (see $B3B0), this table is needlessly large
; There's no reason to have more than E0h scanlines of $9C02 (even less if the HUD is accounted for)
    db $81 : dw $9C00 
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $60 : dw $9C02
    db $60 : dw $9C02
    db $00

if !FEATURE_KEEP_UNREFERENCED
UNUSED_IndirectHDMATable_88BDB1:
    db $81 : dw $9C44 
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
endif ; !FEATURE_KEEP_UNREFERENCED

IndirectHDMATable_LavaAcidBG2_Yscroll:
    db $81 : dw $9C46 
    db $81 : dw $9C48
    db $81 : dw $9C4A
    db $81 : dw $9C4C
    db $81 : dw $9C4E
    db $81 : dw $9C50
    db $81 : dw $9C52
    db $81 : dw $9C54
    db $81 : dw $9C56
    db $81 : dw $9C58
    db $81 : dw $9C5A
    db $81 : dw $9C5C
    db $81 : dw $9C5E
    db $81 : dw $9C60
    db $81 : dw $9C62
    db $81 : dw $9C64
    db $81 : dw $9C46
    db $81 : dw $9C48
    db $81 : dw $9C4A
    db $81 : dw $9C4C
    db $81 : dw $9C4E
    db $81 : dw $9C50
    db $81 : dw $9C52
    db $81 : dw $9C54
    db $81 : dw $9C56
    db $81 : dw $9C58
    db $81 : dw $9C5A
    db $81 : dw $9C5C
    db $81 : dw $9C5E
    db $81 : dw $9C60
    db $81 : dw $9C62
    db $81 : dw $9C64
    db $81 : dw $9C46
    db $81 : dw $9C48
    db $81 : dw $9C4A
    db $81 : dw $9C4C
    db $81 : dw $9C4E
    db $81 : dw $9C50
    db $81 : dw $9C52
    db $81 : dw $9C54
    db $81 : dw $9C56
    db $81 : dw $9C58
    db $81 : dw $9C5A
    db $81 : dw $9C5C
    db $81 : dw $9C5E
    db $81 : dw $9C60
    db $81 : dw $9C62
    db $81 : dw $9C64
    db $81 : dw $9C46
    db $81 : dw $9C48
    db $81 : dw $9C4A
    db $81 : dw $9C4C
    db $81 : dw $9C4E
    db $81 : dw $9C50
    db $81 : dw $9C52
    db $81 : dw $9C54
    db $81 : dw $9C56
    db $81 : dw $9C58
    db $81 : dw $9C5A
    db $81 : dw $9C5C
    db $81 : dw $9C5E
    db $81 : dw $9C60
    db $81 : dw $9C62
    db $81 : dw $9C64
    db $81 : dw $9C46
    db $81 : dw $9C48
    db $81 : dw $9C4A
    db $81 : dw $9C4C
    db $81 : dw $9C4E
    db $81 : dw $9C50
    db $81 : dw $9C52
    db $81 : dw $9C54
    db $81 : dw $9C56
    db $81 : dw $9C58
    db $81 : dw $9C5A
    db $81 : dw $9C5C
    db $81 : dw $9C5E
    db $81 : dw $9C60
    db $81 : dw $9C62
    db $81 : dw $9C64
    db $81 : dw $9C46
    db $81 : dw $9C48
    db $81 : dw $9C4A
    db $81 : dw $9C4C
    db $81 : dw $9C4E
    db $81 : dw $9C50
    db $81 : dw $9C52
    db $81 : dw $9C54
    db $81 : dw $9C56
    db $81 : dw $9C58
    db $81 : dw $9C5A
    db $81 : dw $9C5C
    db $81 : dw $9C5E
    db $81 : dw $9C60
    db $81 : dw $9C62
    db $81 : dw $9C64
    db $81 : dw $9C46
    db $81 : dw $9C48
    db $81 : dw $9C4A
    db $81 : dw $9C4C
    db $81 : dw $9C4E
    db $81 : dw $9C50
    db $81 : dw $9C52
    db $81 : dw $9C54
    db $81 : dw $9C56
    db $81 : dw $9C58
    db $81 : dw $9C5A
    db $81 : dw $9C5C
    db $81 : dw $9C5E
    db $81 : dw $9C60
    db $81 : dw $9C62
    db $81 : dw $9C64
    db $81 : dw $9C46
    db $81 : dw $9C48
    db $81 : dw $9C4A
    db $81 : dw $9C4C
    db $81 : dw $9C4E
    db $81 : dw $9C50
    db $81 : dw $9C52
    db $81 : dw $9C54
    db $81 : dw $9C56
    db $81 : dw $9C58
    db $81 : dw $9C5A
    db $81 : dw $9C5C
    db $81 : dw $9C5E
    db $81 : dw $9C60
    db $81 : dw $9C62
    db $81 : dw $9C64
    db $81 : dw $9C46
    db $81 : dw $9C48
    db $81 : dw $9C4A
    db $81 : dw $9C4C
    db $81 : dw $9C4E
    db $81 : dw $9C50
    db $81 : dw $9C52
    db $81 : dw $9C54
    db $81 : dw $9C56
    db $81 : dw $9C58
    db $81 : dw $9C5A
    db $81 : dw $9C5C
    db $81 : dw $9C5E
    db $81 : dw $9C60
    db $81 : dw $9C62
    db $81 : dw $9C64
    db $81 : dw $9C46
    db $81 : dw $9C48
    db $81 : dw $9C4A
    db $81 : dw $9C4C
    db $81 : dw $9C4E
    db $81 : dw $9C50
    db $81 : dw $9C52
    db $81 : dw $9C54
    db $81 : dw $9C56
    db $81 : dw $9C58
    db $81 : dw $9C5A
    db $81 : dw $9C5C
    db $81 : dw $9C5E
    db $81 : dw $9C60
    db $81 : dw $9C62
    db $81 : dw $9C64
    db $81 : dw $9C46
    db $81 : dw $9C48
    db $81 : dw $9C4A
    db $81 : dw $9C4C
    db $81 : dw $9C4E
    db $81 : dw $9C50
    db $81 : dw $9C52
    db $81 : dw $9C54
    db $81 : dw $9C56
    db $81 : dw $9C58
    db $81 : dw $9C5A
    db $81 : dw $9C5C
    db $81 : dw $9C5E
    db $81 : dw $9C60
    db $81 : dw $9C62
    db $81 : dw $9C64
    db $81 : dw $9C46
    db $81 : dw $9C48
    db $81 : dw $9C4A
    db $81 : dw $9C4C
    db $81 : dw $9C4E
    db $81 : dw $9C50
    db $81 : dw $9C52
    db $81 : dw $9C54
    db $81 : dw $9C56
    db $81 : dw $9C58
    db $81 : dw $9C5A
    db $81 : dw $9C5C
    db $81 : dw $9C5E
    db $81 : dw $9C60
    db $81 : dw $9C62
    db $81 : dw $9C64
    db $81 : dw $9C46
    db $81 : dw $9C48
    db $81 : dw $9C4A
    db $81 : dw $9C4C
    db $81 : dw $9C4E
    db $81 : dw $9C50
    db $81 : dw $9C52
    db $81 : dw $9C54
    db $81 : dw $9C56
    db $81 : dw $9C58
    db $81 : dw $9C5A
    db $81 : dw $9C5C
    db $81 : dw $9C5E
    db $81 : dw $9C60
    db $81 : dw $9C62
    db $81 : dw $9C64
    db $81 : dw $9C46
    db $81 : dw $9C48
    db $81 : dw $9C4A
    db $81 : dw $9C4C
    db $81 : dw $9C4E
    db $81 : dw $9C50
    db $81 : dw $9C52
    db $81 : dw $9C54
    db $81 : dw $9C56
    db $81 : dw $9C58
    db $81 : dw $9C5A
    db $81 : dw $9C5C
    db $81 : dw $9C5E
    db $81 : dw $9C60
    db $81 : dw $9C62
    db $81 : dw $9C64
    db $81 : dw $9C46
    db $81 : dw $9C48
    db $81 : dw $9C4A
    db $81 : dw $9C4C
    db $81 : dw $9C4E
    db $81 : dw $9C50
    db $81 : dw $9C52
    db $81 : dw $9C54
    db $81 : dw $9C56
    db $81 : dw $9C58
    db $81 : dw $9C5A
    db $81 : dw $9C5C
    db $81 : dw $9C5E
    db $81 : dw $9C60
    db $81 : dw $9C62
    db $81 : dw $9C64
    db $81 : dw $9C46
    db $81 : dw $9C48
    db $81 : dw $9C4A
    db $81 : dw $9C4C
    db $81 : dw $9C4E
    db $81 : dw $9C50
    db $81 : dw $9C52
    db $81 : dw $9C54
    db $81 : dw $9C56
    db $81 : dw $9C58
    db $81 : dw $9C5A
    db $81 : dw $9C5C
    db $81 : dw $9C5E
    db $81 : dw $9C60
    db $81 : dw $9C62
    db $81 : dw $9C64
    db $81 : dw $9C46
    db $81 : dw $9C48
    db $81 : dw $9C4A
    db $81 : dw $9C4C
    db $81 : dw $9C4E
    db $81 : dw $9C50
    db $81 : dw $9C52
    db $81 : dw $9C54
    db $81 : dw $9C56
    db $81 : dw $9C58
    db $81 : dw $9C5A
    db $81 : dw $9C5C
    db $81 : dw $9C5E
    db $81 : dw $9C60
    db $81 : dw $9C62
    db $81 : dw $9C64


InstList_LavaAcidBG3_Yscroll:
    dw Instruction_HDMAObject_HDMATableBank : db $88 
    dw Instruction_HDMAObject_IndirectHDMATableBank : db $7E 
    dw Instruction_LavaSoundTimer_70 
    dw Instruction_HDMAObject_PreInstructionInY 
    dl PreInstruction_LavaAcid_BG3YScroll 
    dw Instruction_HDMAObject_Sleep 

InstList_LavaAcidBG2_Yscroll:
    dw Instruction_HDMAObject_HDMATableBank : db $88 
    dw Instruction_HDMAObject_IndirectHDMATableBank : db $7E 
    dw Instruction_HDMAObject_PhaseDecreaseTimer_1 
    dw Instruction_HDMAObject_PreInstructionInY 
    dl PreInstruction_LavaAcid_BG2YScroll 
    dw Instruction_HDMAObject_Sleep 

FXType_6_Water:
    LDA.W #FXRisingFunction_Water_Normal : STA.W $196C 
    LDA.W $1978 : STA.W $195E 
    JSL.L Spawn_HDMAObject 
    db $42,$11 
    dw InstList_Water_BG3_Xscroll 
    LDA.W $197E 
    AND.W #$0002 
    BEQ .notWavy 
    JSL.L Spawn_HDMAObject 
    db $42,$0F 
    dw InstList_Water_BG2_Xscroll 

.notWavy:
    JSL.L Spawn_BG3_Scroll_HDMA_Object 
    RTL 


FXRisingFunction_Water_Normal:
    LDA.W $197C 
    BEQ .return3 
    BMI .negative 
    LDA.W $197A 
    CMP.W $1978 
    BEQ .return1 
    BCS .doRise 

.return1:
    RTS 


.negative:
    LDA.W $197A 
    CMP.W $1978 
    BEQ .return2 
    BCC .doRise 

.return2:
    RTS 


.doRise:
    LDA.W #FXRisingFunction_Water_WaitToRise : STA.W $196C 

.return3:
    RTS 


FXRisingFunction_Water_WaitToRise:
    DEC.W $1980 
    BNE .return 
    LDA.W #FXRisingFunction_Water_Rising : STA.W $196C 

.return:
    RTS 


FXRisingFunction_Water_Rising:
    JSR.W RaiseOrLower_FX 
    BCC .return 
    LDA.W #FXRisingFunction_Water_Normal : STA.W $196C 
    STZ.W $197C 

.return:
    RTS 


Instruction_HDMA_Object_Phase_Increase_Timer_1:
    LDA.W #$0001 : STA.W $1920,X 
    RTS 


WaveDisplacementTable_Water:
    dw $0000,$0001,$0001,$0000,$0000,$FFFF,$FFFF,$0000 
    dw $0000,$0001,$0001,$0000,$0000,$FFFF,$FFFF,$0000 

PreInstruction_Water_BG3_Xscroll:
    PHB 
    LDA.W $1984 : STA.W $1986 
    LDA.W $0A78 
    BEQ .notFrozen 
    PLB 
    RTL 


.notFrozen:
    PHX 
    PHY 
    REP #$30 
    PEA.W .functionReturn-1 
    JMP.W ($196C) 


.functionReturn:
    JSR.W Handle_Tide 
    SEP #$10 
    LDA.W $1976 
    CLC 
    ADC.W $1970 
    STA.W $195C 
    LDA.W $1978 
    ADC.W $1972 
    STA.W $195E 
    LDA.W $195E 
    BMI .negative 
    SEC 
    SBC.W $0915 
    BEQ + 
    BPL .notAboveScreen 

  + EOR.W #$001F 
    AND.W #$001F 
    ORA.W #$0100 
    BRA .merge 


.notAboveScreen:
    CMP.W #$0100 
    BCC .onScreen 

.negative:
    LDA.W #$0000 
    BRA .merge 


.onScreen:
    EOR.W #$00FF 
    AND.W #$00FF 

.merge:
    STA.L $7ECADE 
    LDX.W $18B2 
    LDA.W $192C,X 
    XBA 
    BPL .lowByte 
    ORA.W #$FF00 
    BRA + 


.lowByte:
    AND.W #$00FF 

  + CLC 
    ADC.W $0911 
    STA.B $14 
    DEC.W $1920,X 
    BNE .loopSetup 
    LDA.W #$000A : STA.W $1920,X 
    LDA.W $1914,X 
    INC #2
    AND.W #$001E 
    STA.W $1914,X 

.loopSetup:
    LDA.W $1914,X 
    TAX 
    LDY.B #$1E 

.loop:
    LDA.B $14 
    CLC 
    ADC.W WaveDisplacementTable_Water,Y 
    STA.L $7E9C04,X 
    DEX #2
    TXA 
    AND.W #$001E 
    TAX 
    DEY #2
    BPL .loop 
    LDX.W $18B2 
    LDA.W $197E 
    AND.W #$0001 
    BEQ + 
    LDA.W $192C,X 
    CLC 
    ADC.W #$0040 
    STA.W $192C,X 

  + LDX.W $18B2 
    LDA.W $195E 
    BMI .negative2 
    SEC 
    SBC.W $0915 
    CLC 
    ADC.W #$0100 
    BPL .lessThan100 
    AND.W #$000F 
    ORA.W #$0100 
    BRA .merge2 


.lessThan100:
    CMP.W #$0200 
    BCC .merge2 

.negative2:
    LDA.W #$01FF 

.merge2:
    EOR.W #$01FF 
    INC A 
    AND.W #$03FF 
    STA.B $12 
    LDA.B $12 
    ASL A 
    CLC 
    ADC.B $12 
    ADC.W #IndirectHDMATable_WaterBG3XScroll_0 
    STA.W $18D8,X 
    PLY 
    PLX 
    PLB 
    RTL 


Instruction_HDMA_Object_Phase_Increase_Timer_1_duplicate:
    LDA.W #$0001 : STA.W $1920,X 
    RTS 


PreInstruction_Water_BG2_Xscroll:
    PHB 
    LDA.B $B5 : STA.L $7E9C44 
    LDA.W $0A78 
    BNE .notWavy 
    LDA.W $197E 
    AND.W #$0002 
    BNE .wavy 
    STZ.W $18B4,X 

.notWavy:
    JSR.W Setup_Water_BG2_Xscroll_DataTable_NotWavy 
    BRA .merge 


.wavy:
    JSR.W Setup_Water_BG2_Xscroll_DataTable_Wavy 

.merge:
    LDA.W $18C0,X 
    AND.W #$00FF 
    TAY 
    LDA.W $195E 
    BMI .negative 
    SEC 
    SBC.W $0915 
    CLC 
    ADC.W #$0100 
    BPL .lessThan100 
    AND.W #$000F 
    ORA.W #$0100 
    BRA .merge2 


.lessThan100:
    CMP.W #$0200 
    BCC .merge2 

.negative:
    LDA.W #$01FF 

.merge2:
    EOR.W #$01FF 
    AND.W #$03FF 
    STA.B $12 
    LDA.B $12 
    ASL A 
    CLC 
    ADC.B $12 
    ADC.W #IndirectHDMATable_WaterBG2XScroll 
    STA.W $18D8,X 
    PLB 
    RTL 


Setup_Water_BG2_Xscroll_DataTable_Wavy:
    DEC.W $1920,X 
    BNE + 
    LDA.W #$0006 : STA.W $1920,X 
    LDA.W $1914,X 
    INC #2
    AND.W #$001E 
    STA.W $1914,X 

  + PHX 
    LDA.B $B7 
    AND.W #$000F 
    ASL A 
    PHA 
    CLC 
    ADC.W $1914,X 
    AND.W #$001E 
    TAY 
    PLA 
    CLC 
    ADC.W #$001E 
    AND.W #$001E 
    TAX 
    LDA.W #$000F : STA.B $12 

.loop:
    LDA.B $B5 
    CLC 
    ADC.W WaveDisplacementTable_Water,Y 
    STA.L $7E9C48,X 
    DEX #2
    TXA 
    AND.W #$001E 
    TAX 
    DEY #2
    TYA 
    AND.W #$001E 
    TAY 
    DEC.B $12 
    BPL .loop 
    PLX 
    RTS 


Setup_Water_BG2_Xscroll_DataTable_NotWavy:
    PHX 
    LDX.B #$1E 
    LDA.B $B5 

.loop:
    STA.L $7E9C48,X 
    DEX #2
    BPL .loop 
    PLX 
    RTS 


IndirectHDMATable_WaterBG3XScroll_0:
    db $81 : dw $9C00 
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00

IndirectHDMATable_WaterBG3XScroll_1:
    db $81 : dw $9C04 
    db $81 : dw $9C06
    db $81 : dw $9C08
    db $81 : dw $9C0A
    db $81 : dw $9C0C
    db $81 : dw $9C0E
    db $81 : dw $9C10
    db $81 : dw $9C12
    db $81 : dw $9C14
    db $81 : dw $9C16
    db $81 : dw $9C18
    db $81 : dw $9C1A
    db $81 : dw $9C1C
    db $81 : dw $9C1E
    db $81 : dw $9C20
    db $81 : dw $9C22
    db $81 : dw $9C04
    db $81 : dw $9C06
    db $81 : dw $9C08
    db $81 : dw $9C0A
    db $81 : dw $9C0C
    db $81 : dw $9C0E
    db $81 : dw $9C10
    db $81 : dw $9C12
    db $81 : dw $9C14
    db $81 : dw $9C16
    db $81 : dw $9C18
    db $81 : dw $9C1A
    db $81 : dw $9C1C
    db $81 : dw $9C1E
    db $81 : dw $9C20
    db $81 : dw $9C22
    db $81 : dw $9C04
    db $81 : dw $9C06
    db $81 : dw $9C08
    db $81 : dw $9C0A
    db $81 : dw $9C0C
    db $81 : dw $9C0E
    db $81 : dw $9C10
    db $81 : dw $9C12
    db $81 : dw $9C14
    db $81 : dw $9C16
    db $81 : dw $9C18
    db $81 : dw $9C1A
    db $81 : dw $9C1C
    db $81 : dw $9C1E
    db $81 : dw $9C20
    db $81 : dw $9C22
    db $81 : dw $9C04
    db $81 : dw $9C06
    db $81 : dw $9C08
    db $81 : dw $9C0A
    db $81 : dw $9C0C
    db $81 : dw $9C0E
    db $81 : dw $9C10
    db $81 : dw $9C12
    db $81 : dw $9C14
    db $81 : dw $9C16
    db $81 : dw $9C18
    db $81 : dw $9C1A
    db $81 : dw $9C1C
    db $81 : dw $9C1E
    db $81 : dw $9C20
    db $81 : dw $9C22
    db $81 : dw $9C04
    db $81 : dw $9C06
    db $81 : dw $9C08
    db $81 : dw $9C0A
    db $81 : dw $9C0C
    db $81 : dw $9C0E
    db $81 : dw $9C10
    db $81 : dw $9C12
    db $81 : dw $9C14
    db $81 : dw $9C16
    db $81 : dw $9C18
    db $81 : dw $9C1A
    db $81 : dw $9C1C
    db $81 : dw $9C1E
    db $81 : dw $9C20
    db $81 : dw $9C22
    db $81 : dw $9C04
    db $81 : dw $9C06
    db $81 : dw $9C08
    db $81 : dw $9C0A
    db $81 : dw $9C0C
    db $81 : dw $9C0E
    db $81 : dw $9C10
    db $81 : dw $9C12
    db $81 : dw $9C14
    db $81 : dw $9C16
    db $81 : dw $9C18
    db $81 : dw $9C1A
    db $81 : dw $9C1C
    db $81 : dw $9C1E
    db $81 : dw $9C20
    db $81 : dw $9C22
    db $81 : dw $9C04
    db $81 : dw $9C06
    db $81 : dw $9C08
    db $81 : dw $9C0A
    db $81 : dw $9C0C
    db $81 : dw $9C0E
    db $81 : dw $9C10
    db $81 : dw $9C12
    db $81 : dw $9C14
    db $81 : dw $9C16
    db $81 : dw $9C18
    db $81 : dw $9C1A
    db $81 : dw $9C1C
    db $81 : dw $9C1E
    db $81 : dw $9C20
    db $81 : dw $9C22
    db $81 : dw $9C04
    db $81 : dw $9C06
    db $81 : dw $9C08
    db $81 : dw $9C0A
    db $81 : dw $9C0C
    db $81 : dw $9C0E
    db $81 : dw $9C10
    db $81 : dw $9C12
    db $81 : dw $9C14
    db $81 : dw $9C16
    db $81 : dw $9C18
    db $81 : dw $9C1A
    db $81 : dw $9C1C
    db $81 : dw $9C1E
    db $81 : dw $9C20
    db $81 : dw $9C22
    db $81 : dw $9C04
    db $81 : dw $9C06
    db $81 : dw $9C08
    db $81 : dw $9C0A
    db $81 : dw $9C0C
    db $81 : dw $9C0E
    db $81 : dw $9C10
    db $81 : dw $9C12
    db $81 : dw $9C14
    db $81 : dw $9C16
    db $81 : dw $9C18
    db $81 : dw $9C1A
    db $81 : dw $9C1C
    db $81 : dw $9C1E
    db $81 : dw $9C20
    db $81 : dw $9C22
    db $81 : dw $9C04
    db $81 : dw $9C06
    db $81 : dw $9C08
    db $81 : dw $9C0A
    db $81 : dw $9C0C
    db $81 : dw $9C0E
    db $81 : dw $9C10
    db $81 : dw $9C12
    db $81 : dw $9C14
    db $81 : dw $9C16
    db $81 : dw $9C18
    db $81 : dw $9C1A
    db $81 : dw $9C1C
    db $81 : dw $9C1E
    db $81 : dw $9C20
    db $81 : dw $9C22
    db $81 : dw $9C04
    db $81 : dw $9C06
    db $81 : dw $9C08
    db $81 : dw $9C0A
    db $81 : dw $9C0C
    db $81 : dw $9C0E
    db $81 : dw $9C10
    db $81 : dw $9C12
    db $81 : dw $9C14
    db $81 : dw $9C16
    db $81 : dw $9C18
    db $81 : dw $9C1A
    db $81 : dw $9C1C
    db $81 : dw $9C1E
    db $81 : dw $9C20
    db $81 : dw $9C22
    db $81 : dw $9C04
    db $81 : dw $9C06
    db $81 : dw $9C08
    db $81 : dw $9C0A
    db $81 : dw $9C0C
    db $81 : dw $9C0E
    db $81 : dw $9C10
    db $81 : dw $9C12
    db $81 : dw $9C14
    db $81 : dw $9C16
    db $81 : dw $9C18
    db $81 : dw $9C1A
    db $81 : dw $9C1C
    db $81 : dw $9C1E
    db $81 : dw $9C20
    db $81 : dw $9C22
    db $81 : dw $9C04
    db $81 : dw $9C06
    db $81 : dw $9C08
    db $81 : dw $9C0A
    db $81 : dw $9C0C
    db $81 : dw $9C0E
    db $81 : dw $9C10
    db $81 : dw $9C12
    db $81 : dw $9C14
    db $81 : dw $9C16
    db $81 : dw $9C18
    db $81 : dw $9C1A
    db $81 : dw $9C1C
    db $81 : dw $9C1E
    db $81 : dw $9C20
    db $81 : dw $9C22
    db $81 : dw $9C04
    db $81 : dw $9C06
    db $81 : dw $9C08
    db $81 : dw $9C0A
    db $81 : dw $9C0C
    db $81 : dw $9C0E
    db $81 : dw $9C10
    db $81 : dw $9C12
    db $81 : dw $9C14
    db $81 : dw $9C16
    db $81 : dw $9C18
    db $81 : dw $9C1A
    db $81 : dw $9C1C
    db $81 : dw $9C1E
    db $81 : dw $9C20
    db $81 : dw $9C22
    db $81 : dw $9C04
    db $81 : dw $9C06
    db $81 : dw $9C08
    db $81 : dw $9C0A
    db $81 : dw $9C0C
    db $81 : dw $9C0E
    db $81 : dw $9C10
    db $81 : dw $9C12
    db $81 : dw $9C14
    db $81 : dw $9C16
    db $81 : dw $9C18
    db $81 : dw $9C1A
    db $81 : dw $9C1C
    db $81 : dw $9C1E
    db $81 : dw $9C20
    db $81 : dw $9C22
    db $81 : dw $9C04
    db $81 : dw $9C06
    db $81 : dw $9C08
    db $81 : dw $9C0A
    db $81 : dw $9C0C
    db $81 : dw $9C0E
    db $81 : dw $9C10
    db $81 : dw $9C12
    db $81 : dw $9C14
    db $81 : dw $9C16
    db $81 : dw $9C18
    db $81 : dw $9C1A
    db $81 : dw $9C1C
    db $81 : dw $9C1E
    db $81 : dw $9C20
    db $81 : dw $9C22
    db $81 : dw $9C04
    db $81 : dw $9C06
    db $81 : dw $9C08
    db $81 : dw $9C0A
    db $81 : dw $9C0C
    db $81 : dw $9C0E
    db $81 : dw $9C10
    db $81 : dw $9C12
    db $81 : dw $9C14
    db $81 : dw $9C16
    db $81 : dw $9C18
    db $81 : dw $9C1A
    db $81 : dw $9C1C
    db $81 : dw $9C1E
    db $81 : dw $9C20
    db $81 : dw $9C22
    db $81 : dw $9C04
    db $81 : dw $9C06
    db $81 : dw $9C08
    db $81 : dw $9C0A
    db $81 : dw $9C0C
    db $81 : dw $9C0E
    db $81 : dw $9C10
    db $81 : dw $9C12
    db $81 : dw $9C14
    db $81 : dw $9C16
    db $81 : dw $9C18
    db $81 : dw $9C1A
    db $81 : dw $9C1C
    db $81 : dw $9C1E
    db $81 : dw $9C20
    db $81 : dw $9C22
    db $81 : dw $9C04
    db $81 : dw $9C06
    db $81 : dw $9C08
    db $81 : dw $9C0A
    db $81 : dw $9C0C
    db $81 : dw $9C0E
    db $81 : dw $9C10
    db $81 : dw $9C12
    db $81 : dw $9C14
    db $81 : dw $9C16
    db $81 : dw $9C18
    db $81 : dw $9C1A
    db $81 : dw $9C1C
    db $81 : dw $9C1E
    db $81 : dw $9C20
    db $81 : dw $9C22
    db $81 : dw $9C04
    db $81 : dw $9C06
    db $81 : dw $9C08
    db $81 : dw $9C0A
    db $81 : dw $9C0C
    db $81 : dw $9C0E
    db $81 : dw $9C10
    db $81 : dw $9C12
    db $81 : dw $9C14
    db $81 : dw $9C16
    db $81 : dw $9C18
    db $81 : dw $9C1A
    db $81 : dw $9C1C
    db $81 : dw $9C1E
    db $81 : dw $9C20
    db $81 : dw $9C22
    db $81 : dw $9C04
    db $81 : dw $9C06
    db $81 : dw $9C08
    db $81 : dw $9C0A
    db $81 : dw $9C0C
    db $81 : dw $9C0E
    db $81 : dw $9C10
    db $81 : dw $9C12
    db $81 : dw $9C14
    db $81 : dw $9C16
    db $81 : dw $9C18
    db $81 : dw $9C1A
    db $81 : dw $9C1C
    db $81 : dw $9C1E
    db $81 : dw $9C20
    db $81 : dw $9C22
    db $81 : dw $9C04
    db $81 : dw $9C06
    db $81 : dw $9C08
    db $81 : dw $9C0A
    db $81 : dw $9C0C
    db $81 : dw $9C0E
    db $81 : dw $9C10
    db $81 : dw $9C12
    db $81 : dw $9C14
    db $81 : dw $9C16
    db $81 : dw $9C18
    db $81 : dw $9C1A
    db $81 : dw $9C1C
    db $81 : dw $9C1E
    db $81 : dw $9C20
    db $81 : dw $9C22
    db $81 : dw $9C04
    db $81 : dw $9C06
    db $81 : dw $9C08
    db $81 : dw $9C0A
    db $81 : dw $9C0C
    db $81 : dw $9C0E
    db $81 : dw $9C10
    db $81 : dw $9C12
    db $81 : dw $9C14
    db $81 : dw $9C16
    db $81 : dw $9C18
    db $81 : dw $9C1A
    db $81 : dw $9C1C
    db $81 : dw $9C1E
    db $81 : dw $9C20
    db $81 : dw $9C22
    db $81 : dw $9C04
    db $81 : dw $9C06
    db $81 : dw $9C08
    db $81 : dw $9C0A
    db $81 : dw $9C0C
    db $81 : dw $9C0E
    db $81 : dw $9C10
    db $81 : dw $9C12
    db $81 : dw $9C14
    db $81 : dw $9C16
    db $81 : dw $9C18
    db $81 : dw $9C1A
    db $81 : dw $9C1C
    db $81 : dw $9C1E
    db $81 : dw $9C20
    db $81 : dw $9C22
    db $81 : dw $9C04
    db $81 : dw $9C06
    db $81 : dw $9C08
    db $81 : dw $9C0A
    db $81 : dw $9C0C
    db $81 : dw $9C0E
    db $81 : dw $9C10
    db $81 : dw $9C12
    db $81 : dw $9C14
    db $81 : dw $9C16
    db $81 : dw $9C18
    db $81 : dw $9C1A
    db $81 : dw $9C1C
    db $81 : dw $9C1E
    db $81 : dw $9C20
    db $81 : dw $9C22
    db $81 : dw $9C04
    db $81 : dw $9C06
    db $81 : dw $9C08
    db $81 : dw $9C0A
    db $81 : dw $9C0C
    db $81 : dw $9C0E
    db $81 : dw $9C10
    db $81 : dw $9C12
    db $81 : dw $9C14
    db $81 : dw $9C16
    db $81 : dw $9C18
    db $81 : dw $9C1A
    db $81 : dw $9C1C
    db $81 : dw $9C1E
    db $81 : dw $9C20
    db $81 : dw $9C22
    db $81 : dw $9C04
    db $81 : dw $9C06
    db $81 : dw $9C08
    db $81 : dw $9C0A
    db $81 : dw $9C0C
    db $81 : dw $9C0E
    db $81 : dw $9C10
    db $81 : dw $9C12
    db $81 : dw $9C14
    db $81 : dw $9C16
    db $81 : dw $9C18
    db $81 : dw $9C1A
    db $81 : dw $9C1C
    db $81 : dw $9C1E
    db $81 : dw $9C20
    db $81 : dw $9C22
    db $81 : dw $9C04
    db $81 : dw $9C06
    db $81 : dw $9C08
    db $81 : dw $9C0A
    db $81 : dw $9C0C
    db $81 : dw $9C0E
    db $81 : dw $9C10
    db $81 : dw $9C12
    db $81 : dw $9C14
    db $81 : dw $9C16
    db $81 : dw $9C18
    db $81 : dw $9C1A
    db $81 : dw $9C1C
    db $81 : dw $9C1E
    db $81 : dw $9C20
    db $81 : dw $9C22
    db $81 : dw $9C04
    db $81 : dw $9C06
    db $81 : dw $9C08
    db $81 : dw $9C0A
    db $81 : dw $9C0C
    db $81 : dw $9C0E
    db $81 : dw $9C10
    db $81 : dw $9C12
    db $81 : dw $9C14
    db $81 : dw $9C16
    db $81 : dw $9C18
    db $81 : dw $9C1A
    db $81 : dw $9C1C
    db $81 : dw $9C1E
    db $81 : dw $9C20
    db $81 : dw $9C22
    db $81 : dw $9C04
    db $81 : dw $9C06
    db $81 : dw $9C08
    db $81 : dw $9C0A
    db $81 : dw $9C0C
    db $81 : dw $9C0E
    db $81 : dw $9C10
    db $81 : dw $9C12
    db $81 : dw $9C14
    db $81 : dw $9C16
    db $81 : dw $9C18
    db $81 : dw $9C1A
    db $81 : dw $9C1C
    db $81 : dw $9C1E
    db $81 : dw $9C20
    db $81 : dw $9C22
    db $81 : dw $9C04
    db $81 : dw $9C06
    db $81 : dw $9C08
    db $81 : dw $9C0A
    db $81 : dw $9C0C
    db $81 : dw $9C0E
    db $81 : dw $9C10
    db $81 : dw $9C12
    db $81 : dw $9C14
    db $81 : dw $9C16
    db $81 : dw $9C18
    db $81 : dw $9C1A
    db $81 : dw $9C1C
    db $81 : dw $9C1E
    db $81 : dw $9C20
    db $81 : dw $9C22
    db $81 : dw $9C04
    db $81 : dw $9C06
    db $81 : dw $9C08
    db $81 : dw $9C0A
    db $81 : dw $9C0C
    db $81 : dw $9C0E
    db $81 : dw $9C10
    db $81 : dw $9C12
    db $81 : dw $9C14
    db $81 : dw $9C16
    db $81 : dw $9C18
    db $81 : dw $9C1A
    db $81 : dw $9C1C
    db $81 : dw $9C1E
    db $81 : dw $9C20
    db $81 : dw $9C22
    db $00

IndirectHDMATable_WaterBG2XScroll:
    db $81 : dw $9C44 
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C48
    db $81 : dw $9C4A
    db $81 : dw $9C4C
    db $81 : dw $9C4E
    db $81 : dw $9C50
    db $81 : dw $9C52
    db $81 : dw $9C54
    db $81 : dw $9C56
    db $81 : dw $9C58
    db $81 : dw $9C5A
    db $81 : dw $9C5C
    db $81 : dw $9C5E
    db $81 : dw $9C60
    db $81 : dw $9C62
    db $81 : dw $9C64
    db $81 : dw $9C66
    db $81 : dw $9C48
    db $81 : dw $9C4A
    db $81 : dw $9C4C
    db $81 : dw $9C4E
    db $81 : dw $9C50
    db $81 : dw $9C52
    db $81 : dw $9C54
    db $81 : dw $9C56
    db $81 : dw $9C58
    db $81 : dw $9C5A
    db $81 : dw $9C5C
    db $81 : dw $9C5E
    db $81 : dw $9C60
    db $81 : dw $9C62
    db $81 : dw $9C64
    db $81 : dw $9C66
    db $81 : dw $9C48
    db $81 : dw $9C4A
    db $81 : dw $9C4C
    db $81 : dw $9C4E
    db $81 : dw $9C50
    db $81 : dw $9C52
    db $81 : dw $9C54
    db $81 : dw $9C56
    db $81 : dw $9C58
    db $81 : dw $9C5A
    db $81 : dw $9C5C
    db $81 : dw $9C5E
    db $81 : dw $9C60
    db $81 : dw $9C62
    db $81 : dw $9C64
    db $81 : dw $9C66
    db $81 : dw $9C48
    db $81 : dw $9C4A
    db $81 : dw $9C4C
    db $81 : dw $9C4E
    db $81 : dw $9C50
    db $81 : dw $9C52
    db $81 : dw $9C54
    db $81 : dw $9C56
    db $81 : dw $9C58
    db $81 : dw $9C5A
    db $81 : dw $9C5C
    db $81 : dw $9C5E
    db $81 : dw $9C60
    db $81 : dw $9C62
    db $81 : dw $9C64
    db $81 : dw $9C66
    db $81 : dw $9C48
    db $81 : dw $9C4A
    db $81 : dw $9C4C
    db $81 : dw $9C4E
    db $81 : dw $9C50
    db $81 : dw $9C52
    db $81 : dw $9C54
    db $81 : dw $9C56
    db $81 : dw $9C58
    db $81 : dw $9C5A
    db $81 : dw $9C5C
    db $81 : dw $9C5E
    db $81 : dw $9C60
    db $81 : dw $9C62
    db $81 : dw $9C64
    db $81 : dw $9C66
    db $81 : dw $9C48
    db $81 : dw $9C4A
    db $81 : dw $9C4C
    db $81 : dw $9C4E
    db $81 : dw $9C50
    db $81 : dw $9C52
    db $81 : dw $9C54
    db $81 : dw $9C56
    db $81 : dw $9C58
    db $81 : dw $9C5A
    db $81 : dw $9C5C
    db $81 : dw $9C5E
    db $81 : dw $9C60
    db $81 : dw $9C62
    db $81 : dw $9C64
    db $81 : dw $9C66
    db $81 : dw $9C48
    db $81 : dw $9C4A
    db $81 : dw $9C4C
    db $81 : dw $9C4E
    db $81 : dw $9C50
    db $81 : dw $9C52
    db $81 : dw $9C54
    db $81 : dw $9C56
    db $81 : dw $9C58
    db $81 : dw $9C5A
    db $81 : dw $9C5C
    db $81 : dw $9C5E
    db $81 : dw $9C60
    db $81 : dw $9C62
    db $81 : dw $9C64
    db $81 : dw $9C66
    db $81 : dw $9C48
    db $81 : dw $9C4A
    db $81 : dw $9C4C
    db $81 : dw $9C4E
    db $81 : dw $9C50
    db $81 : dw $9C52
    db $81 : dw $9C54
    db $81 : dw $9C56
    db $81 : dw $9C58
    db $81 : dw $9C5A
    db $81 : dw $9C5C
    db $81 : dw $9C5E
    db $81 : dw $9C60
    db $81 : dw $9C62
    db $81 : dw $9C64
    db $81 : dw $9C66
    db $81 : dw $9C48
    db $81 : dw $9C4A
    db $81 : dw $9C4C
    db $81 : dw $9C4E
    db $81 : dw $9C50
    db $81 : dw $9C52
    db $81 : dw $9C54
    db $81 : dw $9C56
    db $81 : dw $9C58
    db $81 : dw $9C5A
    db $81 : dw $9C5C
    db $81 : dw $9C5E
    db $81 : dw $9C60
    db $81 : dw $9C62
    db $81 : dw $9C64
    db $81 : dw $9C66
    db $81 : dw $9C48
    db $81 : dw $9C4A
    db $81 : dw $9C4C
    db $81 : dw $9C4E
    db $81 : dw $9C50
    db $81 : dw $9C52
    db $81 : dw $9C54
    db $81 : dw $9C56
    db $81 : dw $9C58
    db $81 : dw $9C5A
    db $81 : dw $9C5C
    db $81 : dw $9C5E
    db $81 : dw $9C60
    db $81 : dw $9C62
    db $81 : dw $9C64
    db $81 : dw $9C66
    db $81 : dw $9C48
    db $81 : dw $9C4A
    db $81 : dw $9C4C
    db $81 : dw $9C4E
    db $81 : dw $9C50
    db $81 : dw $9C52
    db $81 : dw $9C54
    db $81 : dw $9C56
    db $81 : dw $9C58
    db $81 : dw $9C5A
    db $81 : dw $9C5C
    db $81 : dw $9C5E
    db $81 : dw $9C60
    db $81 : dw $9C62
    db $81 : dw $9C64
    db $81 : dw $9C66
    db $81 : dw $9C48
    db $81 : dw $9C4A
    db $81 : dw $9C4C
    db $81 : dw $9C4E
    db $81 : dw $9C50
    db $81 : dw $9C52
    db $81 : dw $9C54
    db $81 : dw $9C56
    db $81 : dw $9C58
    db $81 : dw $9C5A
    db $81 : dw $9C5C
    db $81 : dw $9C5E
    db $81 : dw $9C60
    db $81 : dw $9C62
    db $81 : dw $9C64
    db $81 : dw $9C66
    db $81 : dw $9C48
    db $81 : dw $9C4A
    db $81 : dw $9C4C
    db $81 : dw $9C4E
    db $81 : dw $9C50
    db $81 : dw $9C52
    db $81 : dw $9C54
    db $81 : dw $9C56
    db $81 : dw $9C58
    db $81 : dw $9C5A
    db $81 : dw $9C5C
    db $81 : dw $9C5E
    db $81 : dw $9C60
    db $81 : dw $9C62
    db $81 : dw $9C64
    db $81 : dw $9C66
    db $81 : dw $9C48
    db $81 : dw $9C4A
    db $81 : dw $9C4C
    db $81 : dw $9C4E
    db $81 : dw $9C50
    db $81 : dw $9C52
    db $81 : dw $9C54
    db $81 : dw $9C56
    db $81 : dw $9C58
    db $81 : dw $9C5A
    db $81 : dw $9C5C
    db $81 : dw $9C5E
    db $81 : dw $9C60
    db $81 : dw $9C62
    db $81 : dw $9C64
    db $81 : dw $9C66
    db $81 : dw $9C48
    db $81 : dw $9C4A
    db $81 : dw $9C4C
    db $81 : dw $9C4E
    db $81 : dw $9C50
    db $81 : dw $9C52
    db $81 : dw $9C54
    db $81 : dw $9C56
    db $81 : dw $9C58
    db $81 : dw $9C5A
    db $81 : dw $9C5C
    db $81 : dw $9C5E
    db $81 : dw $9C60
    db $81 : dw $9C62
    db $81 : dw $9C64
    db $81 : dw $9C66
    db $81 : dw $9C48
    db $81 : dw $9C4A
    db $81 : dw $9C4C
    db $81 : dw $9C4E
    db $81 : dw $9C50
    db $81 : dw $9C52
    db $81 : dw $9C54
    db $81 : dw $9C56
    db $81 : dw $9C58
    db $81 : dw $9C5A
    db $81 : dw $9C5C
    db $81 : dw $9C5E
    db $81 : dw $9C60
    db $81 : dw $9C62
    db $81 : dw $9C64
    db $81 : dw $9C66
    db $81 : dw $9C48
    db $81 : dw $9C4A
    db $81 : dw $9C4C
    db $81 : dw $9C4E
    db $81 : dw $9C50
    db $81 : dw $9C52
    db $81 : dw $9C54
    db $81 : dw $9C56
    db $81 : dw $9C58
    db $81 : dw $9C5A
    db $81 : dw $9C5C
    db $81 : dw $9C5E
    db $81 : dw $9C60
    db $81 : dw $9C62
    db $81 : dw $9C64
    db $81 : dw $9C66
    db $81 : dw $9C48
    db $81 : dw $9C4A
    db $81 : dw $9C4C
    db $81 : dw $9C4E
    db $81 : dw $9C50
    db $81 : dw $9C52
    db $81 : dw $9C54
    db $81 : dw $9C56
    db $81 : dw $9C58
    db $81 : dw $9C5A
    db $81 : dw $9C5C
    db $81 : dw $9C5E
    db $81 : dw $9C60
    db $81 : dw $9C62
    db $81 : dw $9C64
    db $81 : dw $9C66
    db $81 : dw $9C48
    db $81 : dw $9C4A
    db $81 : dw $9C4C
    db $81 : dw $9C4E
    db $81 : dw $9C50
    db $81 : dw $9C52
    db $81 : dw $9C54
    db $81 : dw $9C56
    db $81 : dw $9C58
    db $81 : dw $9C5A
    db $81 : dw $9C5C
    db $81 : dw $9C5E
    db $81 : dw $9C60
    db $81 : dw $9C62
    db $81 : dw $9C64
    db $81 : dw $9C66
    db $81 : dw $9C48
    db $81 : dw $9C4A
    db $81 : dw $9C4C
    db $81 : dw $9C4E
    db $81 : dw $9C50
    db $81 : dw $9C52
    db $81 : dw $9C54
    db $81 : dw $9C56
    db $81 : dw $9C58
    db $81 : dw $9C5A
    db $81 : dw $9C5C
    db $81 : dw $9C5E
    db $81 : dw $9C60
    db $81 : dw $9C62
    db $81 : dw $9C64
    db $81 : dw $9C66
    db $81 : dw $9C48
    db $81 : dw $9C4A
    db $81 : dw $9C4C
    db $81 : dw $9C4E
    db $81 : dw $9C50
    db $81 : dw $9C52
    db $81 : dw $9C54
    db $81 : dw $9C56
    db $81 : dw $9C58
    db $81 : dw $9C5A
    db $81 : dw $9C5C
    db $81 : dw $9C5E
    db $81 : dw $9C60
    db $81 : dw $9C62
    db $81 : dw $9C64
    db $81 : dw $9C66
    db $81 : dw $9C48
    db $81 : dw $9C4A
    db $81 : dw $9C4C
    db $81 : dw $9C4E
    db $81 : dw $9C50
    db $81 : dw $9C52
    db $81 : dw $9C54
    db $81 : dw $9C56
    db $81 : dw $9C58
    db $81 : dw $9C5A
    db $81 : dw $9C5C
    db $81 : dw $9C5E
    db $81 : dw $9C60
    db $81 : dw $9C62
    db $81 : dw $9C64
    db $81 : dw $9C66
    db $81 : dw $9C48
    db $81 : dw $9C4A
    db $81 : dw $9C4C
    db $81 : dw $9C4E
    db $81 : dw $9C50
    db $81 : dw $9C52
    db $81 : dw $9C54
    db $81 : dw $9C56
    db $81 : dw $9C58
    db $81 : dw $9C5A
    db $81 : dw $9C5C
    db $81 : dw $9C5E
    db $81 : dw $9C60
    db $81 : dw $9C62
    db $81 : dw $9C64
    db $81 : dw $9C66
    db $81 : dw $9C48
    db $81 : dw $9C4A
    db $81 : dw $9C4C
    db $81 : dw $9C4E
    db $81 : dw $9C50
    db $81 : dw $9C52
    db $81 : dw $9C54
    db $81 : dw $9C56
    db $81 : dw $9C58
    db $81 : dw $9C5A
    db $81 : dw $9C5C
    db $81 : dw $9C5E
    db $81 : dw $9C60
    db $81 : dw $9C62
    db $81 : dw $9C64
    db $81 : dw $9C66
    db $81 : dw $9C48
    db $81 : dw $9C4A
    db $81 : dw $9C4C
    db $81 : dw $9C4E
    db $81 : dw $9C50
    db $81 : dw $9C52
    db $81 : dw $9C54
    db $81 : dw $9C56
    db $81 : dw $9C58
    db $81 : dw $9C5A
    db $81 : dw $9C5C
    db $81 : dw $9C5E
    db $81 : dw $9C60
    db $81 : dw $9C62
    db $81 : dw $9C64
    db $81 : dw $9C66
    db $81 : dw $9C48
    db $81 : dw $9C4A
    db $81 : dw $9C4C
    db $81 : dw $9C4E
    db $81 : dw $9C50
    db $81 : dw $9C52
    db $81 : dw $9C54
    db $81 : dw $9C56
    db $81 : dw $9C58
    db $81 : dw $9C5A
    db $81 : dw $9C5C
    db $81 : dw $9C5E
    db $81 : dw $9C60
    db $81 : dw $9C62
    db $81 : dw $9C64
    db $81 : dw $9C66
    db $81 : dw $9C48
    db $81 : dw $9C4A
    db $81 : dw $9C4C
    db $81 : dw $9C4E
    db $81 : dw $9C50
    db $81 : dw $9C52
    db $81 : dw $9C54
    db $81 : dw $9C56
    db $81 : dw $9C58
    db $81 : dw $9C5A
    db $81 : dw $9C5C
    db $81 : dw $9C5E
    db $81 : dw $9C60
    db $81 : dw $9C62
    db $81 : dw $9C64
    db $81 : dw $9C66
    db $81 : dw $9C48
    db $81 : dw $9C4A
    db $81 : dw $9C4C
    db $81 : dw $9C4E
    db $81 : dw $9C50
    db $81 : dw $9C52
    db $81 : dw $9C54
    db $81 : dw $9C56
    db $81 : dw $9C58
    db $81 : dw $9C5A
    db $81 : dw $9C5C
    db $81 : dw $9C5E
    db $81 : dw $9C60
    db $81 : dw $9C62
    db $81 : dw $9C64
    db $81 : dw $9C66
    db $81 : dw $9C48
    db $81 : dw $9C4A
    db $81 : dw $9C4C
    db $81 : dw $9C4E
    db $81 : dw $9C50
    db $81 : dw $9C52
    db $81 : dw $9C54
    db $81 : dw $9C56
    db $81 : dw $9C58
    db $81 : dw $9C5A
    db $81 : dw $9C5C
    db $81 : dw $9C5E
    db $81 : dw $9C60
    db $81 : dw $9C62
    db $81 : dw $9C64
    db $81 : dw $9C66
    db $81 : dw $9C48
    db $81 : dw $9C4A
    db $81 : dw $9C4C
    db $81 : dw $9C4E
    db $81 : dw $9C50
    db $81 : dw $9C52
    db $81 : dw $9C54
    db $81 : dw $9C56
    db $81 : dw $9C58
    db $81 : dw $9C5A
    db $81 : dw $9C5C
    db $81 : dw $9C5E
    db $81 : dw $9C60
    db $81 : dw $9C62
    db $81 : dw $9C64
    db $81 : dw $9C66
    db $81 : dw $9C48
    db $81 : dw $9C4A
    db $81 : dw $9C4C
    db $81 : dw $9C4E
    db $81 : dw $9C50
    db $81 : dw $9C52
    db $81 : dw $9C54
    db $81 : dw $9C56
    db $81 : dw $9C58
    db $81 : dw $9C5A
    db $81 : dw $9C5C
    db $81 : dw $9C5E
    db $81 : dw $9C60
    db $81 : dw $9C62
    db $81 : dw $9C64
    db $81 : dw $9C66
    db $81 : dw $9C48
    db $81 : dw $9C4A
    db $81 : dw $9C4C
    db $81 : dw $9C4E
    db $81 : dw $9C50
    db $81 : dw $9C52
    db $81 : dw $9C54
    db $81 : dw $9C56
    db $81 : dw $9C58
    db $81 : dw $9C5A
    db $81 : dw $9C5C
    db $81 : dw $9C5E
    db $81 : dw $9C60
    db $81 : dw $9C62
    db $81 : dw $9C64
    db $81 : dw $9C66
    db $00

InstList_Water_BG2_Xscroll:
    dw Instruction_HDMAObject_HDMATableBank : db $88 
    dw Instruction_HDMAObject_IndirectHDMATableBank : db $7E 
    dw Instruction_HDMA_Object_Phase_Increase_Timer_1_duplicate 
    dw Instruction_HDMAObject_PreInstructionInY 
    dl PreInstruction_Water_BG2_Xscroll 
    dw Instruction_HDMAObject_Sleep 

InstList_Water_BG3_Xscroll:
    dw Instruction_HDMAObject_HDMATableBank : db $88 
    dw Instruction_HDMAObject_IndirectHDMATableBank : db $7E 
    dw Instruction_HDMA_Object_Phase_Increase_Timer_1 
    dw Instruction_HDMAObject_PreInstructionInY 
    dl PreInstruction_Water_BG3_Xscroll 
    dw Instruction_HDMAObject_Sleep 

Spawn_BG3_Scroll_HDMA_Object:
    JSL.L SpawnHDMAObject_SlotA_Channel80_Index70 
    db $43,$11 
    dw InstList_BG3Scroll_0 
    RTL 


RTL_88D86E:
    RTL 


IndirectHDMATable_BG3Scroll: 
    db $81 : dw $CAD8
    db $81 : dw $CAD8
    db $81 : dw $CAD8
    db $81 : dw $CAD8
    db $81 : dw $CAD8
    db $81 : dw $CAD8
    db $81 : dw $CAD8
    db $81 : dw $CAD8
    db $81 : dw $CAD8
    db $81 : dw $CAD8
    db $81 : dw $CAD8
    db $81 : dw $CAD8
    db $81 : dw $CAD8
    db $81 : dw $CAD8
    db $81 : dw $CAD8
    db $81 : dw $CAD8
    db $81 : dw $CAD8
    db $81 : dw $CAD8
    db $81 : dw $CAD8
    db $81 : dw $CAD8
    db $81 : dw $CAD8
    db $81 : dw $CAD8
    db $81 : dw $CAD8
    db $81 : dw $CAD8
    db $81 : dw $CAD8
    db $81 : dw $CAD8
    db $81 : dw $CAD8
    db $81 : dw $CAD8
    db $81 : dw $CAD8
    db $81 : dw $CAD8
    db $81 : dw $CAD8
    db $81 : dw $CADC
    db $00

InstList_BG3Scroll_0:
    dw Instruction_HDMAObject_HDMATableBank : db $88 
    dw Instruction_HDMAObject_IndirectHDMATableBank : db $7E 

InstList_BG3Scroll_1:
    dw $7FFF,IndirectHDMATable_BG3Scroll 
    dw Instruction_HDMAObject_GotoY 
    dw InstList_BG3Scroll_1 

FXType_28_CeresRidley:
    JSL.L Spawn_HDMAObject 
    db $40,$05 
    dw InstList_CeresRidleyMode_BGTileSize_0 
    JSL.L Spawn_HDMAObject 
    db $00,$2C 
    dw InstList_CeresRidley_MainScreenLayers_0 
    RTL 


RTL_88D8EF:
    RTL 


IndirectHDMATable_CeresRidleyMode_BGTileSize:
    db $1F : dw $07EB 
    db $60 : dw $07EC
    db $50 : dw $07EC
    db $10 : dw $07EB
    db $00

IndirectHDMATable_CeresRidleyMainScreenLayers: 
    db $1F,$04 ;         BG3
    db $60,$13 ; BG1/BG2/    sprites
    db $50,$13 ; BG1/BG2/    sprites
    db $10,$12 ;     BG2/    sprites
    db $00

InstList_CeresRidleyMode_BGTileSize_0:
    dw Instruction_HDMAObject_HDMATableBank : db $88 
    dw Instruction_HDMAObject_IndirectHDMATableBank : db $00 
    dw Instruction_VideoMode_for_HUD_and_Floor_1 

InstList_CeresRidleyMode_BGTileSize_1:
    dw $7FFF,IndirectHDMATable_CeresRidleyMode_BGTileSize 
    dw Instruction_HDMAObject_GotoY 
    dw InstList_CeresRidleyMode_BGTileSize_1 

Instruction_VideoMode_for_HUD_and_Floor_1:
    LDA.W #$0009 : STA.W $07EB 
    RTS 


InstList_CeresRidley_MainScreenLayers_0:
    dw Instruction_HDMAObject_HDMATableBank : db $88 

InstList_CeresRidley_MainScreenLayers_1:
    dw $7FFF,IndirectHDMATable_CeresRidleyMainScreenLayers 
    dw Instruction_HDMAObject_GotoY 
    dw InstList_CeresRidley_MainScreenLayers_1 

FXType_2A_CeresElevator:
    JSL.L Spawn_HDMAObject 
    db $40,$05 
    dw InstList_CeresElevatorMode_BGTileSize_0 
    RTL 


RTL_88D931:
    RTL 


IndirectHDMATable_CeresElevatorMode_BGTileSize: 
    db $1F : dw $07EB
    db $70 : dw $07EC
    db $00

InstList_CeresElevatorMode_BGTileSize_0:
    dw Instruction_HDMAObject_HDMATableBank : db $88 
    dw Instruction_HDMAObject_IndirectHDMATableBank : db $00 
    dw Instruction_VideoMode_for_HUD_1 

InstList_CeresElevatorMode_BGTileSize_1:
    dw $7FFF,IndirectHDMATable_CeresElevatorMode_BGTileSize 
    dw Instruction_HDMAObject_GotoY 
    dw InstList_CeresElevatorMode_BGTileSize_1 

Instruction_VideoMode_for_HUD_1:
    LDA.W #$0009 : STA.W $07EB 
    RTS 


FXType_A_Rain:
    SEP #$20 
    LDA.B #$5C : STA.B $5B 
    REP #$20 
    JSL.L Spawn_HDMAObject 
    db $43,$11 
    dw InstList_Rain_BG3Scroll_0 
    JSL.L Spawn_BG3_Scroll_HDMA_Object 
    LDY.W #AnimatedTilesObject_Rain 
    JSL.L Spawn_AnimatedTilesObject 
    RTL 


InstList_Rain_BG3Scroll_0:
    dw Instruction_HDMAObject_HDMATableBank : db $88 
    dw Instruction_HDMAObject_IndirectHDMATableBank : db $7E 
    dw Instruction_HDMAObjectBG3XVelocity 
    dw Instruction_HDMAObject_PreInstructionInY 
    dl PreInstruction_RainBG3Scroll 

InstList_Rain_BG3Scroll_1:
    dw $7FFF,IndirectHDMATable_BG3Scroll 
    dw Instruction_HDMAObject_GotoY 
    dw InstList_Rain_BG3Scroll_1 

Instruction_HDMAObjectBG3XVelocity:
    PHX 
    LDA.W $05E5 
    LSR A 
    AND.W #$0006 
    TAX 
    LDA.W .BG3XVelocities,X 
    PLX 
    STA.W $1938,X 
    RTS 


.BG3XVelocities:
    dw $FA00,$0600,$FC00,$0400 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_IndirectHDMATable_88D99A:
    db $1F : dw $CAD8 
    db $81 : dw $CADC
    db $00
endif ; !FEATURE_KEEP_UNREFERENCED

PreInstruction_RainBG3Scroll:
    PHB 
    LDY.B #$5C 
    STY.B $5B 
    LDA.W $1984 : STA.W $1986 
    LDA.W $0A78 
    BEQ .notFrozen 
    PLB 
    RTL 


.notFrozen:
    LDA.W $1944,X 
    SEC 
    SBC.W $0915 
    STA.B $12 
    LDA.W $1914,X 
    XBA 
    BPL .lowByteD9C7 
    ORA.W #$FF00 
    BRA + 


.lowByteD9C7:
    AND.W #$00FF 

  + CLC 
    ADC.B $12 
    STA.L $7ECADE 
    LDA.W $1914,X 
    CLC 
    ADC.W #$FA00 ; -$600
    STA.W $1914,X 
    LDA.W $0915 : STA.W $1944,X 
    LDA.W $1950,X 
    SEC 
    SBC.W $0911 
    STA.B $12 
    LDA.W $1920,X 
    XBA 
    BPL .lowByteD9F5 
    ORA.W #$FF00 
    BRA + 


.lowByteD9F5:
    AND.W #$00FF 

  + CLC 
    ADC.B $12 
    STA.L $7ECADC 
    LDA.W $1920,X 
    CLC 
    ADC.W $1938,X 
    STA.W $1920,X 
    LDA.W $0911 : STA.W $1950,X 
    PLB 
    RTL 


FXType_8_Spores:
    SEP #$20 
    LDA.B #$5C : STA.B $5B 
    REP #$20 
    JSL.L Spawn_HDMAObject 
    db $42,$11 
    dw InstList_Spores_BG3_Xscroll_0 
    JSL.L Spawn_BG3_Scroll_HDMA_Object 
    LDY.W #AnimatedTilesObject_Spores 
    JSL.L Spawn_AnimatedTilesObject 
    RTL 


InstList_Spores_BG3_Xscroll_0:
    dw Instruction_HDMAObject_HDMATableBank : db $88 
    dw Instruction_HDMAObject_IndirectHDMATableBank : db $7E 
    dw Instruction_HDMAObject_PreInstructionInY 
    dl PreInstruction_Spores_BG3_Xsscroll 

InstList_Spores_BG3_Xscroll_1:
    dw $7FFF,IndirectHDMATable_BG3Scroll 
    dw Instruction_HDMAObject_GotoY 
    dw InstList_Spores_BG3_Xscroll_1 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_IndirectHDMATable_88DA40:
    db $1F : dw $CAD8 
    db $81 : dw $CADC
    db $00
endif ; !FEATURE_KEEP_UNREFERENCED

PreInstruction_Spores_BG3_Xsscroll:
    PHB 
    LDY.B #$5C 
    STY.B $5B 
    LDA.W $1984 : STA.W $1986 
    LDA.W $0A78 
    BEQ .notFrozen 
    PLB 
    RTL 


.notFrozen:
    LDA.W $192C,X 
    XBA 
    BPL .lowByteDA64 
    ORA.W #$FF00 
    BRA + 


.lowByteDA64:
    AND.W #$00FF 

  + CLC 
    ADC.W $0915 
    STA.L $7ECADE 
    LDA.W $192C,X 
    CLC 
    ADC.W #$FFC0 
    STA.W $192C,X 
    STA.B $14 
    LDA.W $1938,X 
    XBA 
    BPL .lowByteDA86 
    ORA.W #$FF00 
    BRA + 


.lowByteDA86:
    AND.W #$00FF 

  + CLC 
    ADC.W $0911 
    STA.L $7ECADC 
    STA.B $12 
    LDA.W $1938,X 
    CLC 
    ADC.W #$0000 
    STA.W $1938,X 
    PLB 
    RTL 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_HandleSporesWaviness_88DA9F:
    DEC.W $1920,X 
    BNE .setupLoop 
    LDA.W #$000A : STA.W $1920,X 
    LDA.W $1914,X 
    INC #2
    AND.W #$001F 
    STA.W $1914,X 

.setupLoop:
    LDA.W $1914,X 
    TAX 
    LDY.B #$1E 

.loop:
    LDA.B $12 
    CLC 
    ADC.W $0AF6 
    ADC.W .waveDisplacementTable,Y 
    STA.L $7E9C04,X 
    TXA 
    DEC #2
    AND.W #$001F 
    TAX 
    DEY #2
    BPL .loop 
    LDX.W $18B2 
    LDA.W #$FFF0 
    TRB.B $14 
    LDA.B $14 
    ASL A 
    CLC 
    ADC.B $14 
    ADC.W #IndirectHDMATable_WaterBG3XScroll_1 
    STA.W $18D8,X 
    RTL 


.waveDisplacementTable:
; Same as WaveDisplacementTable_Water
    dw $0000,$0001,$0001,$0000,$0000,$FFFF,$FFFF,$0000 
    dw $0000,$0001,$0001,$0000,$0000,$FFFF,$FFFF,$0000 
endif ; !FEATURE_KEEP_UNREFERENCED

FXType_C_Fog:
    SEP #$20 
    LDA.B #$5C : STA.B $5B 
    REP #$20 
    JSL.L Spawn_HDMAObject 
    db $43,$11 
    dw InstList_Fog_BG3_Scroll_0 
    RTL 


InstList_Fog_BG3_Scroll_0:
    dw Instruction_HDMAObject_HDMATableBank : db $88 
    dw Instruction_HDMAObject_IndirectHDMATableBank : db $7E 
    dw RTS_88DB2E 
    dw Instruction_HDMAObject_PreInstructionInY 
    dl PreInstruction_Fog_BG3Scroll 

InstList_Fog_BG3_Scroll_1:
    dw $7FFF,IndirectHDMATable_BG3Scroll 
    dw Instruction_HDMAObject_GotoY 
    dw InstList_Fog_BG3_Scroll_1 

RTS_88DB2E:
    RTS 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_IndirectHDMATable_88DB2F:
    db $1F : dw $CAD8 
    db $81 : dw $CADC
    db $00
endif ; !FEATURE_KEEP_UNREFERENCED

PreInstruction_Fog_BG3Scroll:
    PHB 
    LDY.B #$5C 
    STY.B $5B 
    LDA.W $1984 : STA.W $1986 
    LDA.W $0A78 
    BEQ .timeNotFrozen 
    PLB 
    RTL 


.timeNotFrozen:
    LDA.W $1914,X 
    XBA 
    BPL .lowByteDB53 
    ORA.W #$FF00 
    BRA + 


.lowByteDB53:
    AND.W #$00FF 

  + CLC 
    ADC.W $0915 
    STA.L $7ECADE 
    LDA.W $1914,X 
    CLC 
    ADC.W #$FFC0 
    STA.W $1914,X 
    LDA.W $1920,X 
    XBA 
    BPL .lowByteDB73 
    ORA.W #$FF00 
    BRA + 


.lowByteDB73:
    AND.W #$00FF 

  + CLC 
    ADC.W $0911 
    STA.L $7ECADC 
    LDA.W $1920,X 
    CLC 
    ADC.W #$0050 
    STA.W $1920,X 
    PLB 
    RTL 


FXType_26_TourianEntranceStatue:
    LDA.W #$000A 
    JSL.L CheckIfEvent_inA_HasHappened 
    BCC .tourianLocked 
    JSL.L Spawn_Hardcoded_PLM 
    db $06,$0C 
    dw PLMEntries_clearAccessToTourianElevator 
    LDA.W #$0202 : STA.L $7ECD20 

.tourianLocked:
    SEP #$20 
    LDA.B #$4A : STA.B $59 
    REP #$20 
    LDA.W #FXRisingFunction_Water_Normal : STA.W $196C 
    LDA.W $1978 : STA.W $195E 
    JSL.L Spawn_HDMAObject 
    db $42,$11 
    dw InstList_Water_BG3_Xscroll 
    JSL.L Spawn_HDMAObject 
    db $42,$10 
    dw InstList_TourianEntranceStatue_BG2Yscroll_0 
    JSL.L Spawn_BG3_Scroll_HDMA_Object 
    RTL 


Set_TourianEntranceStatue_BG2_Yscroll:
    LDA.W $1920,X 
    CLC 
    ADC.W $0915 
    STA.L $7E9E00 
    RTS 


PreInst_TourianEntranceStatue_BG2_Yscroll_WaitForUnlock:
    PHP 
    REP #$30 
    LDA.W #$0006 
    JSL.L CheckIfEvent_inA_HasHappened 
    BCC .setYscroll 
    LDA.W #$0007 
    JSL.L CheckIfEvent_inA_HasHappened 
    BCC .setYscroll 
    LDA.W #$0008 
    JSL.L CheckIfEvent_inA_HasHappened 
    BCC .setYscroll 
    LDA.W #$0009 
    JSL.L CheckIfEvent_inA_HasHappened 
    BCC .setYscroll 
    LDA.W #$0010 
    TSB.W $1E6F 
    LDA.W $1E6F 
    BMI .setYscroll 
    LDA.W #$012C : STA.W $192C,X 
    LDX.W $18B2 
    LDA.W #$0001 : STA.W $18E4,X 
    INC.W $18CC,X 
    INC.W $18CC,X 

.setYscroll:
    JSR.W Set_TourianEntranceStatue_BG2_Yscroll 
    PLP 
    RTL 


PreInst_TourianEntranceStatue_BG2Yscroll_DescentDelay:
    JSR.W Handle_Earthquake_SoundEffect 
    LDA.W #$000D : STA.W $183E 
    LDA.W #$0020 
    TSB.W $1840 
    DEC.W $192C,X 
    BPL .setYscroll 
    REP #$30 
    LDY.W #EnemyProjectile_TourianStatueDustClouds 
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics 
    LDY.W #EnemyProjectile_TourianStatueDustClouds 
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics 
    LDY.W #EnemyProjectile_TourianStatueDustClouds 
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics 
    LDY.W #EnemyProjectile_TourianStatueDustClouds 
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics 
    SEP #$10 
    REP #$20 
    LDA.W #$0001 : STA.W $18E4,X 
    INC.W $18CC,X 
    INC.W $18CC,X 

.setYscroll:
    JSR.W Set_TourianEntranceStatue_BG2_Yscroll 
    RTL 


PreInstruction_TourianEntranceStatue_BG2_Yscroll_Descending:
    JSR.W Handle_Earthquake_SoundEffect 
    LDA.W #$000D : STA.W $183E 
    LDA.W #$0020 
    TSB.W $1840 
    LDA.W $0A78 
    BNE .return 
    LDA.W $1914,X 
    CLC 
    ADC.W #$C000 
    STA.W $1914,X 
    LDA.W $1920,X 
    ADC.W #$FFFF 
    STA.W $1920,X 
    CMP.W #$FF10 
    BNE .setYscroll 
    PHX 
    PHP 
    REP #$10 
    JSL.L Spawn_Hardcoded_PLM 
    db $06,$0C 
    dw PLMEntries_crumbleAccessToTourianElevator 
    PLP 
    PLX 
    LDA.W #$000A 
    JSL.L MarkEvent_inA 
    LDA.W #$0001 : STA.W $18E4,X 
    INC.W $18CC,X 
    INC.W $18CC,X 

.setYscroll:
    JSR.W Set_TourianEntranceStatue_BG2_Yscroll 

.return:
    RTL 


PreInst_TourianEntranceStatue_BG2Yscroll_EnableScrolling:
    LDA.W #$8000 : STA.W $1E6D 
    LDA.W #$0202 : STA.L $7ECD20 
    JSR.W Set_TourianEntranceStatue_BG2_Yscroll 
    RTL 


Instruction_GotoY_ifEntranceToTourianUnlocked:
    STZ.W $192C,X 
    STZ.W $1914,X 
    LDA.W #$000A 
    JSL.L CheckIfEvent_inA_HasHappened 
    BCS .gotoY 
    STZ.W $1920,X 
    STA.L $7E9E00 
    LDA.W #$0001 : STA.L $7ECD20 
    INY #2
    RTS 


.gotoY:
    LDA.W #$FF10 : STA.W $1920,X 
    STA.L $7E9E00 
    LDA.W $0000,Y 
    TAY 
    RTS 


InstList_TourianEntranceStatue_BG2Yscroll_0:
    dw Instruction_HDMAObject_HDMATableBank : db $88 
    dw Instruction_HDMAObject_IndirectHDMATableBank : db $7E 
    dw Instruction_GotoY_ifEntranceToTourianUnlocked 
    dw InstList_TourianEntranceStatue_BG2Yscroll_1 
    dw Instruction_HDMAObject_PreInstructionInY 
    dl PreInst_TourianEntranceStatue_BG2_Yscroll_WaitForUnlock 
    dw $0001,IndirectHDMATable_TourianEntranceStatue_BG2YScroll 
    dw Instruction_HDMAObject_Sleep 
    dw Instruction_HDMAObject_PreInstructionInY 
    dl PreInst_TourianEntranceStatue_BG2Yscroll_DescentDelay 
    dw Instruction_HDMAObject_Sleep 
    dw Instruction_HDMAObject_PreInstructionInY 
    dl PreInstruction_TourianEntranceStatue_BG2_Yscroll_Descending 
    dw Instruction_HDMAObject_Sleep 

InstList_TourianEntranceStatue_BG2Yscroll_1:
    dw Instruction_HDMAObject_PreInstructionInY 
    dl PreInst_TourianEntranceStatue_BG2Yscroll_EnableScrolling 
    dw $0001,IndirectHDMATable_TourianEntranceStatue_BG2YScroll 
    dw Instruction_HDMAObject_Sleep 

IndirectHDMATable_TourianEntranceStatue_BG2YScroll: 
    db $1F : dw $9E00
    db $01 : dw $9E00
    db $01 : dw $9E00
    db $00

Spawn_BombTorizoHaze:
    JSL.L Spawn_HDMAObject 
    db $02,$32 
    dw PreInst_BombTorizoHaze_ColorMathSubScnBackColor_GreenRed_0 
    JSL.L Spawn_HDMAObject 
    db $00,$32 
    dw PreInst_BombTorizoHaze_ColorMathSubScnBackdropColor_Blue_0 
    RTL 


PreInst_BombTorizoHaze_ColorMathSubScnBackdropColor:
    LDA.W #$002C : STA.W $1986 
    RTL 


PreInst_BombTorizoHaze_ColorMathSubScnBackColor_GreenRed_0:
    dw Instruction_HDMAObject_HDMATableBank : db $88 
    dw Instruction_HDMAObject_IndirectHDMATableBank : db $88 
    dw Instruction_HDMAObject_PreInstructionInY 
    dl PreInst_BombTorizoHaze_ColorMathSubScnBackdropColor 
    dw $0001,HDMATable_Nothing_88DD61 

PreInst_BombTorizoHaze_ColorMathSubScnBackColor_GreenRed_1:
    dw $7777,HDMATable_BombTorizoHaze_ColorMathSubScnBackColor_GreenRed 
    dw Instruction_HDMAObject_GotoY 
    dw PreInst_BombTorizoHaze_ColorMathSubScnBackColor_GreenRed_1 

HDMATable_Nothing_88DD61:
    db $00 

PreInst_BombTorizoHaze_ColorMathSubScnBackdropColor_Blue_0:
    dw Instruction_HDMAObject_HDMATableBank : db $88 
    dw Instruction_HDMAObject_IndirectHDMATableBank : db $88 
    dw $0001,HDMATable_Nothing_88DD74 

PreInst_BombTorizoHaze_ColorMathSubScnBackdropColor_Blue_1:
    dw $7777,HDMATable_BombTorizoHaze_ColorMathSubScnBackdropColor_Blue 
    dw Instruction_HDMAObject_GotoY 
    dw PreInst_BombTorizoHaze_ColorMathSubScnBackdropColor_Blue_1 

HDMATable_Nothing_88DD74:
    db $00 

HDMATable_BombTorizoHaze_ColorMathSubScnBackColor_GreenRed:
    db $48,$20,$40 
    db $0A,$21,$41
    db $0A,$21,$41
    db $0A,$21,$41
    db $0A,$22,$42
    db $0A,$22,$42
    db $0A,$22,$42
    db $0A,$23,$43
    db $0A,$23,$43
    db $0A,$23,$43
    db $0A,$24,$44
    db $0A,$24,$44
    db $0A,$24,$44
    db $0A,$25,$45
    db $0A,$25,$45
    db $0A,$25,$45
    db $00

HDMATable_BombTorizoHaze_ColorMathSubScnBackdropColor_Blue:
    db $48,$80 
    db $0A,$81
    db $0A,$81
    db $0A,$82
    db $0A,$82
    db $0A,$83
    db $0A,$83
    db $0A,$84
    db $0A,$84
    db $0A,$85
    db $0A,$85
    db $0A,$86
    db $0A,$86
    db $0A,$87
    db $0A,$87
    db $0A,$88
    db $00

FXType_2C_CeresHaze:
    LDA.W #$0001 
    JSL.L CheckIfBossBitsForCurrentAreaMatchAnyBitsInA 
    BCS .alive 
    JSL.L Spawn_HDMAObject 
    db $40,$32 
    dw InstList_CeresHaze_ColorMathSubScnBackColor_RidleyAlive_0 
    RTL 


.alive:
    JSL.L Spawn_HDMAObject 
    db $40,$32 
    dw InstList_CeresHaze_ColorMathSubScnBackColor_RidleyDead_0 
    RTL 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_Set_CeresHaze_PreInstruction_for_NoFade_88DDE2:
    LDA.W #UNUSED_PreInst_CeresHaze_ColorMathSubScnBackdropColor_NoFade : STA.W $18F0,X 

UNUSED_PreInst_CeresHaze_ColorMathSubScnBackdropColor_NoFade:
    LDY.B #$20 
    STY.B $74 
    LDY.B #$40 
    STY.B $75 
    LDY.B #$80 
    STY.B $76 
    LDA.W #$002C : STA.W $1986 
    SEP #$20 
    PHX 
    LDA.W $1920,X 
    ORA.B #$0F 
    LDX.B #$0F 

.loop:
    STA.L $7E9D00,X 
    DEC A 
    DEX 
    BPL .loop 
    PLX 
    REP #$20 
    RTL 
endif ; !FEATURE_KEEP_UNREFERENCED


PreInst_CeresHaze_ColorMathSubScnBackdropColor_RidleyIsAlive:
    LDA.W #$0080 
    BRA Setup_CeresHaze_ColorMathSubScnBackColor_HDMAObject_FadingIn 


PreInst_CeresHaze_ColorMathSubScnBackdropColor_RidleyIsDead:
    LDA.W #$0020 

Setup_CeresHaze_ColorMathSubScnBackColor_HDMAObject_FadingIn:
    STA.W $1920,X 
    STZ.W $1914,X 
    LDA.W $099C 
    CMP.W #DoorTransitionFunction_FadeInTheScreen_and_RunEnemies_Finish 
    BEQ .fadingIn 
    RTL 


.fadingIn:
    LDA.W #PreInstruction_CeresHaze_ColorMathSubScnBackColor_FadingIn : STA.W $18F0,X 

PreInstruction_CeresHaze_ColorMathSubScnBackColor_FadingIn:
    LDY.B #$20 
    STY.B $74 
    LDY.B #$40 
    STY.B $75 
    LDY.B #$80 
    STY.B $76 
    LDA.W #$002C : STA.W $1986 
    LDA.W $1914,X 
    CMP.W #$0010 
    BEQ .done 
    PHX 
    PHP 
    SEP #$20 
    LDA.W $1920,X : STA.B $14 
    LDA.W $1914,X 
    LDX.B #$0F 

.loop:
    STA.B $12 
    ORA.B $14 
    STA.L $7E9D00,X 
    LDA.B $12 
    DEC A 
    BPL .next 
    LDA.B #$00 

.next:
    DEX 
    BPL .loop 
    PLP 
    PLX 
    INC.W $1914,X 
    RTL 


.done:
    LDA.W #PreInstruction_CeresHaze_ColorMathSubScnBackColor_FadedIn : STA.W $18F0,X 
    RTL 


PreInstruction_CeresHaze_ColorMathSubScnBackColor_FadedIn:
    LDY.B #$20 
    STY.B $74 
    LDY.B #$40 
    STY.B $75 
    LDY.B #$80 
    STY.B $76 
    LDA.W #$002C : STA.W $1986 
    LDA.W $099C 
    CMP.W #DoorTransitionFunction_FadeOutTheScreen 
    BEQ .fadingOut 
    RTL 


.fadingOut:
    LDA.W #PreInstruction_CeresHaze_ColorMathSubScnBackColor_FadingOut : STA.W $18F0,X 
    RTL 


PreInstruction_CeresHaze_ColorMathSubScnBackColor_FadingOut:
    LDY.B #$20 
    STY.B $74 
    LDY.B #$40 
    STY.B $75 
    LDY.B #$80 
    STY.B $76 
    LDA.W #$002C : STA.W $1986 
    LDA.W $1914,X 
    BEQ .return 
    PHX 
    PHP 
    SEP #$20 
    LDA.W $1920,X : STA.B $14 
    LDA.W $1914,X 
    LDX.B #$0F 

.loop:
    STA.B $12 
    ORA.B $14 
    STA.L $7E9D00,X 
    LDA.B $12 
    DEC A 
    BPL .next 
    LDA.B #$00 

.next:
    DEX 
    BPL .loop 
    PLP 
    PLX 
    DEC.W $1914,X 

.return:
    RTL 


InstList_CeresHaze_ColorMathSubScnBackColor_RidleyAlive_0:
    dw Instruction_HDMAObject_HDMATableBank : db $88 
    dw Instruction_HDMAObject_IndirectHDMATableBank : db $7E 
    dw Instruction_HDMAObject_PreInstructionInY 
    dl PreInst_CeresHaze_ColorMathSubScnBackdropColor_RidleyIsAlive 
    dw $0001,Empty_HDMATable_88DEEA 

InstList_CeresHaze_ColorMathSubScnBackColor_RidleyAlive_1:
    dw $7777,IndirectHDMATable_CeresHaze_ColorMathSubScnBackdropColor 
    dw Instruction_HDMAObject_GotoY 
    dw InstList_CeresHaze_ColorMathSubScnBackColor_RidleyAlive_1 

Empty_HDMATable_88DEEA:
    db $00 

InstList_CeresHaze_ColorMathSubScnBackColor_RidleyDead_0:
    dw Instruction_HDMAObject_HDMATableBank : db $88 
    dw Instruction_HDMAObject_IndirectHDMATableBank : db $7E 
    dw Instruction_HDMAObject_PreInstructionInY 
    dl PreInst_CeresHaze_ColorMathSubScnBackdropColor_RidleyIsDead 
    dw $0001,Empty_HDMATable_88DF02 

InstList_CeresHaze_ColorMathSubScnBackColor_RidleyDead_1:
    dw $7777,IndirectHDMATable_CeresHaze_ColorMathSubScnBackdropColor 
    dw Instruction_HDMAObject_GotoY 
    dw InstList_CeresHaze_ColorMathSubScnBackColor_RidleyDead_1 

Empty_HDMATable_88DF02:
    db $00 

IndirectHDMATable_CeresHaze_ColorMathSubScnBackdropColor:
    db $40 : dw $9D00 
    db $08 : dw $9D01
    db $08 : dw $9D02
    db $08 : dw $9D03
    db $08 : dw $9D04
    db $08 : dw $9D05
    db $08 : dw $9D06
    db $08 : dw $9D07
    db $08 : dw $9D08
    db $08 : dw $9D09
    db $08 : dw $9D0A
    db $08 : dw $9D0B
    db $08 : dw $9D0C
    db $08 : dw $9D0D
    db $08 : dw $9D0E
    db $08 : dw $9D0F
    db $00

Spawn_DraygonMainScreenLayers_HDMAObject:
    JSL.L Spawn_HDMAObject 
    db $00,$2C 
    dw InstList_DraygonMainScreenLayers_Initial 
    RTL 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_SpawnHDMAObject_88DF3D:
    JSL.L Spawn_HDMAObject 
    db $00,$2C 
    dw InstList_DraygonMainScreenLayers_DraygonAroundTop 
    RTL 


UNUSED_SpawnHDMAObject_88DF46:
    JSL.L Spawn_HDMAObject 
    db $02,$12 
    dw UNUSED_InstList_BG3_Yscroll_0_88DF77 
    RTL 
endif ; !FEATURE_KEEP_UNREFERENCED


InstList_DraygonMainScreenLayers_Initial:
    dw Instruction_HDMAObject_HDMATableBank : db $88 
    dw Instruction_HDMAObject_IndirectHDMATableBank : db $88 
    dw Instruction_HDMAObject_CallExternalFunctionInY 
    dl RTL_88DF91 
    dw Instruction_HDMAObject_PreInstructionInY 
    dl PreInstruction_DraygonMainScreenLayers 

InstList_DraygonMainScreenLayers_DraygonAroundMiddle:
    dw $0001,HDMATable_DraygonMainScreenLayers_DraygonAroundMiddle 
    dw Instruction_HDMAObject_Sleep 

InstList_DraygonMainScreenLayers_DraygonAroundBottom:
    dw $0001,HDMATable_DraygonMainScreenLayers_DraygonAroundBottom 
    dw Instruction_HDMAObject_Sleep 

InstList_DraygonMainScreenLayers_DraygonAroundTop:
    dw $0001,HDMATable_DraygonMainScreenLayers_DraygonAroundTop 
    dw Instruction_HDMAObject_Sleep 

InstList_DraygonMainScreenLayers_DraygonOffScreen:
    dw $0001,HDMATable_DraygonMainScreenLayers_DraygonOffScreen 
    dw Instruction_HDMAObject_Sleep 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_InstList_BG3_Yscroll_0_88DF77:
    dw Instruction_HDMAObject_HDMATableBank : db $88 
    dw Instruction_HDMAObject_IndirectHDMATableBank : db $88 
    dw Instruction_HDMAObject_CallExternalFunctionInY 
    dl RTL_88DF92 
    dw Instruction_HDMAObject_PreInstructionInY 
    dl RTL_88DF93 

UNUSED_InstList_BG3_Yscroll_1_88DF87:
    dw $0001,UNUSED_HDMATable_BG3_Yscroll 
    dw Instruction_HDMAObject_GotoY 
    dw UNUSED_InstList_BG3_Yscroll_1_88DF87 
    dw Instruction_HDMAObject_Sleep 
endif ; !FEATURE_KEEP_UNREFERENCED

RTL_88DF91:
    RTL 


RTL_88DF92:
    RTL 


RTL_88DF93:
    RTL 


PreInstruction_DraygonMainScreenLayers:
    LDA.W $0F86 
    BIT.W #$0200 
    BNE .offScreen 
    LDA.W $0F7A 
    SEC 
    SBC.W $0911 
    CLC 
    ADC.W #$0040 
    BMI .offScreen 
    CMP.W #$0180 
    BPL .offScreen 
    LDA.W $0F7E 
    SEC 
    SBC.W $0915 
    CLC 
    ADC.W #$0010 
    BMI .offScreen 
    LDA.W $0F7E 
    SEC 
    SBC.W $0915 
    CMP.W #$0130 
    BPL .offScreen 
    CMP.W #$0028 
    BMI .aroundTop 
    CMP.W #$00C0 
    BMI .aroundMiddle 
    BRA .aroundBottom 


.aroundTop:
    LDA.W #$0001 : STA.W $18E4,X 
    LDA.W #InstList_DraygonMainScreenLayers_DraygonAroundTop : STA.W $18CC,X 
    RTL 


.offScreen:
    LDA.W #$0001 : STA.W $18E4,X 
    LDA.W #InstList_DraygonMainScreenLayers_DraygonOffScreen : STA.W $18CC,X 
    RTL 


.aroundBottom:
    LDA.W #$0001 : STA.W $18E4,X 
    LDA.W #InstList_DraygonMainScreenLayers_DraygonAroundBottom : STA.W $18CC,X 
    RTL 


.aroundMiddle:
    LDA.W #$0001 : STA.W $18E4,X 
    LDA.W #InstList_DraygonMainScreenLayers_DraygonAroundMiddle : STA.W $18CC,X 
    RTL 


HDMATable_DraygonMainScreenLayers_DraygonAroundMiddle: 
    db $1F,$04 ;         BG3
    db $81,$13 ; BG1/BG2/    sprites
    db $00

HDMATable_DraygonMainScreenLayers_DraygonAroundBottom: 
    db $1F,$04 ;         BG3
    db $60,$11 ; BG1/        sprites
    db $81,$13 ; BG1/BG2/    sprites
    db $00

HDMATable_DraygonMainScreenLayers_DraygonAroundTop: 
    db $1F,$04 ;         BG3
    db $40,$13 ; BG1/BG2/    sprites
    db $81,$11 ; BG1/        sprites
    db $00

HDMATable_DraygonMainScreenLayers_DraygonOffScreen: 
    db $1F,$04 ;         BG3
    db $81,$11 ; BG1/        sprites
    db $00

if !FEATURE_KEEP_UNREFERENCED
UNUSED_HDMATable_BG3_Yscroll:
    db $40 : dw $0000 
    db $81 : dw $0020
    db $00
endif ; !FEATURE_KEEP_UNREFERENCED

PreInstruction_VariaSuitPickup:
    PHP 
    REP #$30 
    LDA.W $0DEC 
    ASL A 
    TAX 
    JSR.W (.pointers,X) 
    BCC .return 
    SEP #$20 
    LDA.W $0DF0 : STA.B $74 
    LDA.W $0DF1 : STA.B $75 
    LDA.W $0DF2 : STA.B $76 
    REP #$20 
    LDA.W #$0012 : STA.W $1986 

.return:
    PLP 
    RTL 


.pointers:
    dw SuitPickup_Stage0_LightBeamAppears 
    dw SuitPickup_Stage1_LightBeamWidens_Linear 
    dw SuitPickup_Stage3_LightBeamWidens_Curved 
    dw VariaSuitPickup_Stage3_GiveSamusVariaSuit 
    dw SuitPickup_Stage4_LightBeamShrinks 
    dw SuitPickup_Stage5_LightBeamDissipates 
    dw VariaSuitPickup_Stage6 

PreInstruction_GravitySuitPickup:
    PHP 
    REP #$30 
    LDA.W $0DEC 
    ASL A 
    TAX 
    JSR.W (.poitners,X) 
    BCC .return 
    SEP #$20 
    LDA.W $0DF0 : STA.B $74 
    LDA.W $0DF1 : STA.B $75 
    LDA.W $0DF2 : STA.B $76 
    REP #$20 
    LDA.W #$0012 : STA.W $1986 

.return:
    PLP 
    RTL 


.poitners:
    dw SuitPickup_Stage0_LightBeamAppears 
    dw SuitPickup_Stage1_LightBeamWidens_Linear 
    dw SuitPickup_Stage3_LightBeamWidens_Curved 
    dw GravitySuitPickup_Stage3_GiveSamusGravitySuit 
    dw SuitPickup_Stage4_LightBeamShrinks 
    dw SuitPickup_Stage5_LightBeamDissipates 
    dw GravitySuitPickup_Stage6 

SuitPickup_Stage0_LightBeamAppears:
    LDA.W $0DEE 
    CLC 
    ADC.W #$0008 
    STA.W $0DEE 
    TAY 
    LDX.W #$0000 

.loopUpperHalf:
    LDA.W .positions : STA.L $7E9800,X 
    INX #2
    DEY 
    BEQ + 
    BPL .loopUpperHalf 

  + LDX.W #$01FE 
    LDY.W $0DEE 

.loopLowerHalf:
    LDA.W .positions : STA.L $7E9800,X 
    DEX #2
    DEY 
    BEQ + 
    BPL .loopLowerHalf 

  + LDA.W $0DEE 
    CMP.W #$0080 
    BMI .return 
    INC.W $0DEC 
    LDA.W #$7878 : STA.W $0DEE 

.return:
    SEC 
    RTS 


.positions:
    db $78,$78 

SuitPickup_Stage1_LightBeamWidens_Linear:
    SEP #$20 
    LDA.W $0DEE 
    SEC 
    SBC.W $0DDD 
    STA.W $0DEE 
    LDA.W $0DEF 
    CLC 
    ADC.W $0DDD 
    STA.W $0DEF 
    REP #$20 
    LDX.W #$01FE 

.loop:
    LDA.W $0DEE : STA.L $7E9800,X 
    DEX #2
    BPL .loop 
    LDA.W $0DEE 
    AND.W #$00FF 
    CMP.W #$0061 
    BPL .return 
    INC.W $0DEC 
    LDA.W #$846C ; Suit pickup light beam left position = 6Ch, right position = 84h
    STA.W $0DEE 

.return:
    SEC 
    RTS 


SuitPickup_Stage3_LightBeamWidens_Curved:
    JSR.W AdvanceSuitPickup_ColorMathSubScnBackdrop_TransitionToWhite 
    REP #$10 
    SEP #$20 
    LDA.W $0DEE 
    SEC 
    SBC.W $0DDD 
    STA.W $0DEE 
    BEQ .lessThanZero 
    BMI .lessThanZero 
    LDA.W $0DEF 
    CLC 
    ADC.W $0DDD 
    BCC .greaterThanZero 
    LDA.B #$FF 

.greaterThanZero:
    STA.W $0DEF 
    REP #$20 
    BRA .loopSetup 


.lessThanZero:
    REP #$20 
    LDA.W #$FF00 : STA.W $0DEE 

.loopSetup:
    SEP #$20 
    LDX.W #$0000 
    LDY.W #$0000 

.loopUpperHalf:
    LDA.W $0DEE 
    SEC 
    SBC.W SuitPickup_LightBeam_CurveWidths,Y 
    BPL + 
    LDA.B #$00 

  + STA.L $7E9800,X 
    INX 
    LDA.W $0DEF 
    CLC 
    ADC.W SuitPickup_LightBeam_CurveWidths,Y 
    BCC + 
    LDA.B #$FF 

  + STA.L $7E9800,X 
    INX 
    INY 
    CPX.W #$0100 
    BMI .loopUpperHalf 
    DEY 

.loopLowerHalf:
    LDA.W $0DEE 
    SEC 
    SBC.W SuitPickup_LightBeam_CurveWidths,Y 
    BPL + 
    LDA.B #$00 

  + STA.L $7E9800,X 
    INX 
    LDA.W $0DEF 
    CLC 
    ADC.W SuitPickup_LightBeam_CurveWidths,Y 
    BCC + 
    LDA.B #$FF 

  + STA.L $7E9800,X 
    INX 
    DEY 
    CPX.W #$0200 
    BMI .loopLowerHalf 
    REP #$20 
    LDA.W $0DDC 
    CLC 
    ADC.W #$0060 
    STA.W $0DDC 
    LDA.W $0DEE 
    CMP.W #$FF00 
    BNE .return 
    INC.W $0DEC 
    LDA.W $0DDC 
    LSR A 
    STA.W $0DDC 
    STZ.W $0DEE 

.return:
    SEC 
    RTS 


SuitPickup_Stage4_LightBeamShrinks:
    LDA.W $0DF2 
    BIT.W #$FF00 
    BNE .advanceToOrange 
    JSR.W AdvanceSuitPickup_ColorMathSubScnBackdrop_TransitionToOrange 
    BRA + 


.advanceToOrange:
    JSR.W AdvanceSuitPickup_ColorMathSubScnBackdrop_TransitionToBlue 

  + LDA.W $0DDC 
    AND.W #$FF00 
    XBA 
    STA.B $12 
    LDA.W $0DEE 
    CLC 
    ADC.B $12 
    STA.W $0DEE 
    TAY 
    LDX.W #$0000 

.loopUpperHalf:
    LDA.W #$00FF : STA.L $7E9800,X 
    INX #2
    DEY 
    BEQ .setupLowerLoop 
    BPL .loopUpperHalf 

.setupLowerLoop:
    LDX.W #$01FE 
    LDY.W $0DEE 
    DEY 

.loopLowerHalf:
    LDA.W #$00FF : STA.L $7E9800,X 
    DEX #2
    DEY 
    BEQ + 
    BPL .loopLowerHalf 

  + LDA.W $0DDC 
    SEC 
    SBC.W #$0020 
    STA.W $0DDC 
    CMP.W #$0100 
    BPL + 
    LDA.W #$0100 : STA.W $0DDC 

  + LDA.W $0DEE 
    CMP.W #$0080 
    BMI .return 
    INC.W $0DEC 
    LDA.W #$F8FF : STA.W $0DEE 

.return:
    SEC 
    RTS 


SuitPickup_Stage5_LightBeamDissipates:
    SEP #$20 
    LDA.W $0DEE 
    CLC 
    ADC.B #$08 
    STA.W $0DEE 
    LDA.W $0DEF 
    SEC 
    SBC.B #$08 
    STA.W $0DEF 
    REP #$20 
    LDA.W $0DEE : STA.L $7E9900 
    LDA.W $0DEE 
    AND.W #$00FF 
    CMP.W #$0070 
    BMI .return 
    INC.W $0DEC 

.return:
    SEC 
    RTS 


VariaSuitPickup_Stage6:
    LDA.W #$0003 
    JSL.L QueueMusicDataOrTrack_8FrameDelay 

GravitySuitPickup_Stage6:
    SEP #$20 
    LDA.B #$80 : STA.B $76 
    LDA.B #$40 : STA.B $75 
    LDA.B #$20 : STA.B $74 
    REP #$20 
    LDA.W #$0001 : STA.W $0A88 
    LDA.W #$9800 ; $7E
    STA.W $0A89 
    STZ.W $0A8B 
    STZ.W $0A8C 
    STZ.W $0A8E 
    STZ.W $0A90 
    LDA.W #$00FF : STA.L $7E9800 
    STZ.W $0DEC 
    STZ.W $0DEE 
    STZ.W $0DF0 
    STZ.W $0DF2 
    LDX.W $18B2 
    LDA.W $18CC,X 
    INC #2
    STA.W $18CC,X 
    LDA.W #$0001 : STA.W $18E4,X 
    LDA.W #$000B 
    JSL.L Run_Samus_Command 
    CLC 
    RTS 


AdvanceSuitPickup_ColorMathSubScnBackdrop_TransitionToWhite:
    SEP #$20 
    LDA.W $0DF0 
    CMP.B #$3F 
    BEQ .green 
    INC #2
    STA.W $0DF0 
    CMP.B #$40 
    BMI .green 
    LDA.B #$3F : STA.W $0DF0 

.green:
    LDA.W $0DF1 
    CMP.B #$5F 
    BEQ .blue 
    INC #2
    STA.W $0DF1 
    CMP.B #$60 
    BMI .blue 
    LDA.B #$5F : STA.W $0DF1 

.blue:
    LDA.W $0DF2 
    CMP.B #$9F 
    BEQ .return 
    INC #2
    STA.W $0DF2 
    CMP.B #$A0 
    BMI .return 
    LDA.B #$9F : STA.W $0DF2 

.return:
    REP #$20 
    SEC 
    RTS 


AdvanceSuitPickup_ColorMathSubScnBackdrop_TransitionToOrange:
    SEP #$20 
    LDA.W $0DF0 
    CMP.B #$3F 
    BEQ .green 
    DEC A 
    STA.W $0DF0 

.green:
    LDA.W $0DF1 
    CMP.B #$4D 
    BEQ .blue 
    DEC A 
    STA.W $0DF1 

.blue:
    LDA.W $0DF2 
    CMP.B #$83 
    BEQ .return 
    DEC A 
    STA.W $0DF2 

.return:
    REP #$20 
    SEC 
    RTS 


VariaSuitPickup_Stage3_GiveSamusVariaSuit:
    LDA.W $09A2 
    ORA.W #$0001 
    STA.W $09A2 
    LDA.W $09A4 
    ORA.W #$0001 
    STA.W $09A4 
    LDA.W #$009B : STA.W $0A1C 
    JSL.L InitializeSamusPose_1 
    JSL.L Set_Samus_AnimationFrame_if_PoseChanged 
    LDA.W $0A20 : STA.W $0A24 
    LDA.W $0A22 : STA.W $0A26 
    LDA.W $0A1C : STA.W $0A20 
    LDA.W $0A1E : STA.W $0A22 
    JSL.L LoadSamusSuitPalette 
    INC.W $0DEC 
    SEC 
    RTS 


GravitySuitPickup_Stage3_GiveSamusGravitySuit:
    LDA.W $09A2 
    ORA.W #$0020 
    STA.W $09A2 
    LDA.W $09A4 
    ORA.W #$0020 
    STA.W $09A4 
    LDA.W #$009B : STA.W $0A1C 
    JSL.L InitializeSamusPose_1 
    JSL.L Set_Samus_AnimationFrame_if_PoseChanged 
    LDA.W $0A20 : STA.W $0A24 
    LDA.W $0A22 : STA.W $0A26 
    LDA.W $0A1C : STA.W $0A20 
    LDA.W $0A1E : STA.W $0A22 
    JSL.L LoadSamusSuitPalette 
    INC.W $0DEC 
    SEC 
    RTS 


AdvanceSuitPickup_ColorMathSubScnBackdrop_TransitionToBlue:
    SEP #$20 
    LDA.W $0DF0 
    CMP.B #$30 
    BEQ .green 
    DEC A 
    STA.W $0DF0 

.green:
    LDA.W $0DF1 
    CMP.B #$49 
    BEQ .blue 
    DEC A 
    STA.W $0DF1 

.blue:
    LDA.W $0DF2 
    CMP.B #$90 
    BEQ .return 
    DEC A 
    STA.W $0DF2 

.return:
    REP #$20 
    SEC 
    RTS 


SuitPickup_LightBeam_CurveWidths:
; Indexed by scanline for upper half (`FFh - scanline` for lower half)
    db $01,$02,$03,$04,$05,$06,$07,$07,$08,$08,$09,$09,$0A,$0A,$0B,$0B 
    db $0B,$0C,$0C,$0C,$0D,$0D,$0D,$0E,$0E,$0E,$0E,$0F,$0F,$0F,$0F,$10 
    db $10,$10,$10,$10,$11,$11,$11,$11,$11,$11,$12,$12,$12,$12,$12,$12 
    db $13,$13,$13,$13,$13,$13,$14,$14,$14,$14,$14,$14,$14,$14,$15,$15 
    db $15,$15,$15,$15,$15,$15,$15,$15,$16,$16,$16,$16,$16,$16,$16,$16 
    db $16,$16,$16,$16,$17,$17,$17,$17,$17,$17,$17,$17,$17,$17,$17,$17 
    db $17,$17,$17,$17,$17,$17,$17,$18,$18,$18,$18,$18,$18,$18,$18,$18 
    db $18,$18,$18,$18,$18,$18,$18,$18,$18,$18,$18,$18,$18,$18,$18,$18 

PreInstruction_PhantoonSemiTransparency:
    PHP 
    SEP #$10 
    REP #$20 
    BIT.W $1988 
    BVS .semiTransparent 
    LDX.W $1074 
    BEQ .BG2Disabled 
    CPX.B #$FF 
    BEQ .delete 
    BRA .return 


.BG2Disabled:
    LDA.W #$0004 : STA.W $1986 
    BRA .return 


.semiTransparent:
    LDA.W #$001A : STA.W $1986 

.return:
    PLP 
    RTL 


.delete:
    LDA.W #$0004 : STA.W $1986 
    LDX.W $18B2 
    LDA.W $18CC,X 
    INC #2
    STA.W $18CC,X 
    LDA.W #$0001 : STA.W $18E4,X 
    PLP 
    RTL 


Spawn_WavyPhantoon_HDMAObject:
    PHP 
    PHB 
    PHK 
    PLB 
    REP #$30 
    PHX 
    STA.W $1034 
    STZ.W $106E 
    STZ.W $1070 
    LDA.B $16 : STA.W $1072 
    JSL.L Spawn_HDMAObject 
    db $42,$0F 
    dw InstList_WavyPhantoon_BG2_Xscroll 
    PLX 
    PLB 
    PLP 
    RTL 


InstList_WavyPhantoon_BG2_Xscroll:
    dw Instruction_HDMAObject_IndirectHDMATableBank : db $7E  
    dw Instruction_HDMAObject_HDMATableBank : db $7E  
    dw Instruction_Setup_WavyPhantoon 
    dw Instruction_HDMAObject_PreInstructionInY 
    dl PreInstruction_WavyPhantoon 
    dw $0001,$9000 
    dw Instruction_HDMAObject_Sleep 
    dw Instruction_HDMAObject_Delete 

Instruction_Setup_WavyPhantoon:
    PHP 
    REP #$30 
    LDA.W $1034 : STA.W $0FF4 
    BIT.W #$0001 
    BNE .wavelengthDoubled 
    LDA.W #$00A0 : STA.L $7E9000 
    STA.L $7E9003 
    STA.L $7E9006 
    STA.L $7E9009 
    STA.L $7E900C 
    STA.L $7E900F 
    STA.L $7E9012 
    STA.L $7E9015 
    LDA.W #$9100 ; $7E
    STA.L $7E9001 
    STA.L $7E9007 
    STA.L $7E900D 
    STA.L $7E9013 
    LDA.W #$9140 ; $7E
    STA.L $7E9004 
    STA.L $7E900A 
    STA.L $7E9010 
    STA.L $7E9016 
    LDA.W #$0000 : STA.L $7E9018 
    BRA .merge 


.wavelengthDoubled:
    LDA.W #$00C0 : STA.L $7E9000 
    STA.L $7E9003 
    STA.L $7E9006 
    STA.L $7E9009 
    LDA.W #$9100 ; $7E
    STA.L $7E9001 
    LDA.W #$9180 ; $7E
    STA.L $7E9004 
    LDA.W #$9100 ; $7E
    STA.L $7E9007 
    LDA.W #$9180 ; $7E
    STA.L $7E900A 
    LDA.W #$0000 : STA.L $7E900C 

.merge:
    LDA.W #$FFFE : STA.W $1914,X 
    LDA.W #$0001 : STA.W $1920,X 
    STZ.W $192C,X 
    STZ.W $1938,X 
    PLP 
    RTS 


PreInstruction_WavyPhantoon:
    PHP 
    REP #$30 
    LDA.W $0FF4 
    BNE .phantoonEnabled 
    LDX.W $18B2 
    LDA.W $18CC,X 
    INC #2
    STA.W $18CC,X 
    LDA.W #$0001 : STA.W $18E4,X 
    PLP 
    RTL 


.phantoonEnabled:
    BIT.W #$0001 
    BNE .doubledE593 
    LDA.W #$0008 : STA.B $1C 
    LDA.W #$0040 : STA.B $1E 
    BRA + 


.doubledE593:
    LDA.W #$0004 : STA.B $1C 
    LDA.W #$0080 : STA.B $1E 

  + PHX 
    DEC.W $1920,X 
    BNE .nonZeroTimer 
    LDA.W #$0001 : STA.W $1920,X 
    LDA.W $1072 
    ASL A 
    STA.B $12 
    LDA.W $1914,X 
    CLC 
    ADC.B $12 
    AND.W #$01FF 
    STA.W $1914,X 

.nonZeroTimer:
    LDA.W $1914,X : STA.B $14 
    LDX.W #$0000 

.loop:
    PHX 
    LDX.B $14 
    LDA.L SineCosineTables_8bitSine_SignExtended,X 
    BPL .positive 
    JMP.W .negative 


.positive:
    STA.B $12 
    SEP #$20 
    STA.W $4202 
    LDA.W $106E : STA.W $4203 
    NOP #3
    REP #$20 
    LDA.W $4216 
    XBA 
    AND.W #$00FF 
    STA.B $16 
    SEP #$20 
    LDA.B $13 : STA.W $4202 
    LDA.W $106E : STA.W $4203 
    NOP #3
    REP #$20 
    LDA.W $4216 
    CLC 
    ADC.B $16 
    STA.B $16 
    SEP #$20 
    LDA.B $12 : STA.W $4202 
    LDA.W $106F : STA.W $4203 
    NOP #3
    REP #$20 
    LDA.W $4216 : STA.B $18 
    SEP #$20 
    LDA.B $13 : STA.W $4202 
    LDA.W $106F : STA.W $4203 
    REP #$20 
    LDA.B $16 
    CLC 
    ADC.B $18 
    STA.B $16 
    LDA.W $4215 
    AND.W #$FF00 
    CLC 
    ADC.B $16 
    AND.W #$FF00 
    XBA 
    STA.B $12 
    TXA 
    CLC 
    ADC.B $1C 
    AND.W #$01FF 
    STA.B $14 
    PLX 
    LDA.B $B5 
    CLC 
    ADC.B $12 
    STA.L $7E9100,X 
    JMP.W .next 


.negative:
    EOR.W #$FFFF 
    INC A 
    STA.B $12 
    SEP #$20 
    STA.W $4202 
    LDA.W $106E : STA.W $4203 
    NOP #3
    REP #$20 
    LDA.W $4216 
    XBA 
    AND.W #$00FF 
    STA.B $16 
    SEP #$20 
    LDA.B $13 : STA.W $4202 
    LDA.W $106E : STA.W $4203 
    NOP #3
    REP #$20 
    LDA.W $4216 
    CLC 
    ADC.B $16 
    STA.B $16 
    SEP #$20 
    LDA.B $12 : STA.W $4202 
    LDA.W $106F : STA.W $4203 
    NOP #3
    REP #$20 
    LDA.W $4216 : STA.B $18 
    SEP #$20 
    LDA.B $13 : STA.W $4202 
    LDA.W $106F : STA.W $4203 
    REP #$20 
    LDA.B $16 
    CLC 
    ADC.B $18 
    STA.B $16 
    LDA.W $4215 
    AND.W #$FF00 
    CLC 
    ADC.B $16 
    AND.W #$FF00 
    XBA 
    STA.B $12 
    TXA 
    CLC 
    ADC.B $1C 
    AND.W #$01FF 
    STA.B $14 
    PLX 
    LDA.B $B5 
    SEC 
    SBC.B $12 
    STA.L $7E9100,X 

.next:
    INX #2
    CPX.B $1E 
    BPL + 
    JMP.W .loop 


  + LDA.W $0FF4 
    BIT.W #$0001 
    BNE .doubledE706 
    LDX.W #$003E 

.loopNotDoubled:
    LDA.B $B5 
    SEC 
    SBC.L $7E9100,X 
    CLC 
    ADC.B $B5 
    STA.L $7E9140,X 
    DEX #2
    BPL .loopNotDoubled 
    BRA .return 


.doubledE706:
    LDX.W #$007E 

.loopDoubled:
    LDA.B $B5 
    SEC 
    SBC.L $7E9100,X 
    CLC 
    ADC.B $B5 
    STA.L $7E9180,X 
    DEX #2
    BPL .loopDoubled 

.return:
    PLX 
    PLP 
    RTL 


Spawn_MotherBrainRising_HDMAObject:
    JSL.L Spawn_HDMAObject 
    db $00,$2C 
    dw InstList_MotherBrainRising_MainScreenLayers 

RTL_88E726:
    RTL 


InstList_MotherBrainRising_MainScreenLayers:
    dw Instruction_HDMAObject_HDMATableBank : db $88 
    dw Instruction_HDMAObject_IndirectHDMATableBank : db $88 
    dw Instruction_HDMAObject_CallExternalFunctionInY 
    dl RTL_88E726 
    dw Instruction_HDMAObject_PreInstructionInY 
    dl RTL_88E726 
    dw $0001,HDMATable_MotherBrainRising_MainScreenLayers 
    dw Instruction_HDMAObject_Sleep 

HDMATable_MotherBrainRising_MainScreenLayers: 
    db $20,$04 ;         BG3
    db $18,$15 ; BG1/    BG3/sprites
    db $60,$13 ; BG1/BG2/    sprites
    db $40,$13 ; BG1/BG2/    sprites
    db $08,$05 ; BG1/    BG3
    db $00

Spawn_MotherBrainRainbowBeam_HDMAObject:
    JSL.L Spawn_HDMAObject 
    db $41,$26 
    dw InstList_MotherBrainRainbowBeam_Window1Position 
    RTL 


InstList_MotherBrainRainbowBeam_Window1Position:
    dw Instruction_HDMAObject_HDMATableBank : db $7E 
    dw Instruction_HDMAObject_IndirectHDMATableBank : db $7E 
    dw Instruction_HDMAObject_CallExternalFunctionInY 
    dl Initialise_Rainbow_Beam 
    dw Instruction_HDMAObject_PreInstructionInY 
    dl PreInstruction_MotherBrainRainbowBeam 
    dw $0001,$9C00 
    dw Instruction_HDMAObject_Sleep 

Initialise_Rainbow_Beam:
    PHP 
    SEP #$20 
    REP #$10 
    LDA.B #$20 : STA.B $74 
    LDA.B #$47 : STA.B $75 
    LDA.B #$8F : STA.B $76 
    REP #$30 
    LDA.W #$0024 : STA.W $1986 
    SEP #$20 
    LDA.B #$E4 
    LDA.B #$64 : STA.L $7E9C00 
    REP #$20 
    LDA.W #$9D00 ; $7E
    STA.L $7E9C01 
    LDA.W #$0000 : STA.L $7E9C03 
    LDA.W #$0000 : STA.L $7E9D00 
    LDA.W #$8020 ; $7E:9D02 = 20h,80h
    STA.L $7E9D02 
    LDA.W #$0000 : STA.L $7E9D04 
    PHB 
    PEA.W $A900 
    PLB 
    PLB 
    JSL.L Calculate_MotherBrain_RainbowBeam_HDMATables 
    PLB 
    PLP 
    RTL 


PreInstruction_MotherBrainRainbowBeam:
    PHP 
    REP #$30 
    LDA.W $0998 
    CMP.W #$0013 
    BEQ .delete 
    LDA.W #$0024 : STA.W $1986 
    LDA.W $0998 
    CMP.W #$001B 
    BEQ .return 
    PHB 
    PEA.W $A900 
    PLB 
    PLB 
    JSL.L Calculate_MotherBrain_RainbowBeam_HDMATables 
    PLB 
    JSR.W Set_RainbowBeam_ColorMathSubscreenBackdropColor 

.return:
    PLP 
    RTL 


.delete:
    LDX.W $18B2 
    STZ.W $18B4,X 
    PLP 
    RTL 


Set_RainbowBeam_ColorMathSubscreenBackdropColor:
    LDX.W $1914 
    LDA.W .table,X 
    BPL .notSet 
    STZ.W $1914 
    LDA.W .table 
    BRA .setColor 


.notSet:
    INC.W $1914 
    INC.W $1914 
    INC.W $1914 
    INC.W $1914 

.setColor:
    PHA 
    SEP #$20 
    AND.B #$1F 
    ORA.B #$20 
    STA.B $74 
    REP #$20 
    LDA.B $01,S 
    ASL #3
    XBA 
    SEP #$20 
    AND.B #$1F 
    ORA.B #$40 
    STA.B $75 
    REP #$20 
    PLA 
    LSR #2
    XBA 
    SEP #$20 
    AND.B #$1F 
    ORA.B #$80 
    STA.B $76 
    REP #$20 
    RTS 

  .table
; Rainbow beam colour table
; The table index is incremented by 4 per frame instead of 2, so only entries 2k for some k are used
    dw $001F,$005F, $009F,$00DF, $011F,$015F, $019F,$01DF 
    dw $023F,$027F, $02BF,$02FF, $033F,$037F, $03BF,$03FF 
    dw $03FD,$03FB, $03F9,$03F7, $03F5,$03F3, $03F1,$03EF 
    dw $03EC,$03EA, $03E8,$03E6, $03E4,$03E2, $03E0,$0BA0 
    dw $1360,$1B20, $22E0,$2AA0, $3260,$3A20, $45E0,$4D80 
    dw $5540,$5D00, $64C0,$6C80, $7440,$7C00, $7C02,$7C04 
    dw $7C06,$7C08, $7C0A,$7C0C, $7C0D,$7C2F, $7C31,$7C33 
    dw $7C35,$7C37, $7C39,$7C3B, $7C1F,$741F, $6C1F,$641F 
    dw $5C1F,$541F, $4C1F,$441F, $3C1F,$301F, $281F,$201F 
    dw $181F,$101F, $081F,$FFFF, $FFFF 
    dw $FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF ; Excess terminators


Spawn_MorphBallEyeBeam_HDMAObject:
    PHP 
    PHB 
    PHK 
    PLB 
    REP #$30 
    PHX 
    JSL.L Spawn_HDMAObject 
    db $41,$26 
    dw InstList_MorphBallEyeBeam_Window1Position 
    PLX 
    PLB 
    PLP 
    RTL 


InstList_MorphBallEyeBeam_Window1Position:
    dw Instruction_HDMAObject_IndirectHDMATableBank : db $7E 
    dw Instruction_HDMAObject_HDMATableBank : db $7E 
    dw Instruction_Initialise_MorphBallEyeBeam_HDMA 
    dw Instruction_HDMAObject_PreInstructionInY 
    dl PreInstruction_MorphBallEyeBeam_BeamIsWidening 
    dw $0001,$9000 
    dw Instruction_HDMAObject_Sleep 
    dw Instruction_HDMAObject_PreInstructionInY 
    dl PreInstruction_MorphBallEyeBeamHDMA_FullBeam 
    dw $0001,$9000 
    dw Instruction_HDMAObject_Sleep 
    dw Instruction_HDMAObject_PreInstructionInY 
    dl PreInstruction_MorphBallEyeBeamHDMA_DeactivateBeam 
    dw $0001,$9000 
    dw Instruction_HDMAObject_Sleep 
    dw Instruction_HDMAObject_Delete 

Instruction_Initialise_MorphBallEyeBeam_HDMA:
    PHP 
    SEP #$20 
    REP #$10 
    LDA.B #$30 : STA.W $1914,X 
    STA.B $74 
    LDA.B #$50 : STA.W $1915,X 
    STA.B $75 
    LDA.B #$80 : STA.W $1920,X 
    STA.B $76 
    REP #$30 
    LDA.W #$0010 : STA.W $1986 
    LDA.W #$00E4 : STA.L $7E9000 
    LDA.W #$9100 ; $7E
    STA.L $7E9001 
    LDA.W #$00E4 : STA.L $7E9003 
    LDA.W #$91C8 ; $7E
    STA.L $7E9004 
    LDA.W #$0098 : STA.L $7E9006 
    LDA.W #$9290 ; $7E
    STA.L $7E9007 
    LDA.W #$0000 : STA.L $7E9009 
    LDA.W #$0001 : STA.W $0FEC 
    STZ.W $192C,X 
    STZ.W $1938,X 
    LDA.W #$0000 : STA.L $7E9080 
    STA.L $7E9082 
    STA.L $7E9090 
    PLP 
    RTS 


Update_MorphBallEyeBeam_HDMATable_ColorMathSubScnBackColor:
    PHP 
    REP #$30 
    PHX 
    LDA.W $0FEE : STA.B $12 
    LDA.W $192C,X : STA.B $14 
    LDA.W $0FBE 
    SEC 
    SBC.W $0915 
    TAY 
    LDA.W $0FBA 
    SEC 
    SBC.W $0911 
    TAX 
    BMI .offScreen 
    CMP.W #$0100 
    BPL .offScreen 
    SEP #$20 
    LDA.B #$7E : STA.B $02 
    REP #$20 
    LDA.W #$9100 ; $7E
    STA.B $00 
    JSL.L Calc_Xray_HDMADataTable_OnScreen 
    BRA .merge 


.offScreen:
    SEP #$20 
    LDA.B #$7E : STA.B $02 
    REP #$20 
    LDA.W #$9100 ; $7E
    STA.B $00 
    JSL.L Calc_Xray_HDMADataTable_OffScreen 

.merge:
    PLX 
    SEP #$20 
    LDA.W $1914,X : STA.B $74 
    LDA.W $1915,X : STA.B $75 
    LDA.W $1920,X : STA.B $76 
    REP #$20 ; >_<
    PLP 
    RTS 


PreInstruction_MorphBallEyeBeam_BeamIsWidening:
    PHP 
    REP #$30 
    LDA.W #$0010 : STA.W $1986 
    LDA.L $7E9082 
    CLC 
    ADC.W #$4000 
    STA.L $7E9082 
    LDA.L $7E9080 
    ADC.W #$0000 
    STA.L $7E9080 
    LDA.W $1938,X 
    CLC 
    ADC.L $7E9082 
    STA.W $1938,X 
    LDA.W $192C,X 
    ADC.L $7E9080 
    STA.W $192C,X 
    CMP.W #$0004 
    BMI .update 
    LDA.W #$0004 : STA.W $192C,X 
    LDX.W $18B2 
    LDA.W $18CC,X 
    INC #2
    STA.W $18CC,X 
    LDA.W #$0001 : STA.W $18E4,X 

.update:
    JSR.W Update_MorphBallEyeBeam_HDMATable_ColorMathSubScnBackColor 
    PLP 
    RTL 


PreInstruction_MorphBallEyeBeamHDMA_FullBeam:
    PHP 
    REP #$30 
    LDA.W #$0010 : STA.W $1986 
    LDA.W $0FEC 
    BNE .update 
    LDX.W $18B2 
    LDA.W $18CC,X 
    INC #2
    STA.W $18CC,X 
    LDA.W #$0001 : STA.W $18E4,X 
    PLP 
    RTL 


.update:
    JSR.W Update_MorphBallEyeBeam_HDMATable_ColorMathSubScnBackColor 
    LDA.L $7E9090 
    ASL #2
    TAY 
    SEP #$20 
    LDA.W .red,Y : STA.W $1914,X 
    LDA.W .green,Y : STA.W $1915,X 
    LDA.W .blue,Y : STA.W $1920,X 
    REP #$20 
    LDA.L $7E9090 
    INC A 
    AND.W #$000F 
    STA.L $7E9090 
    PLP 
    RTL 

;        ____________ Red component
;       |    ________ Green component
;       |   |    ____ Blue component
;       |   |   |
  .red:
    db $30 
  .green:
    db     $50 
  .blue:
    db         $80, $00 
    db $2F,$4F,$80, $00
    db $2E,$4E,$80, $00
    db $2D,$4D,$80, $00
    db $2C,$4C,$80, $00
    db $2B,$4B,$80, $00
    db $2A,$4A,$80, $00
    db $29,$49,$80, $00
    db $28,$48,$80, $00
    db $29,$49,$80, $00
    db $2A,$4A,$80, $00
    db $2B,$4B,$80, $00
    db $2C,$4C,$80, $00
    db $2D,$4D,$80, $00
    db $2E,$4E,$80, $00
    db $2F,$4F,$80, $00

PreInstruction_MorphBallEyeBeamHDMA_DeactivateBeam:
    PHP 
    REP #$30 
    LDA.W #$0010 : STA.W $1986 
    SEP #$20 
    LDA.W $1915,X 
    CMP.B #$40 
    BNE .notDone 
    LDA.B #$20 : STA.B $74 
    LDA.B #$40 : STA.B $75 
    LDA.B #$80 : STA.B $76 
    REP #$20 
    STZ.W $1938,X 
    STZ.W $192C,X 
    LDX.W #$01FE 

.loop:
    LDA.W #$00FF : STA.L $7E9100,X 
    DEX #2
    BPL .loop 
    LDA.W #$0000 : STA.L $7E9000 
    STA.L $7E9002 
    STA.L $7E9004 
    STA.L $7E9006 
    STA.L $7E9008 
    LDX.W $18B2 
    LDA.W $18CC,X 
    INC #2
    STA.W $18CC,X 
    LDA.W #$0001 : STA.W $18E4,X 
    BRA .return 


.notDone:
    REP #$20 
    JSR.W Update_MorphBallEyeBeam_HDMATable_ColorMathSubScnBackColor 
    LDX.W $18B2 
    SEP #$20 
    LDA.W $1914,X 
    CMP.B #$20 
    BEQ .green 
    DEC A 
    STA.W $1914,X 

.green:
    LDA.W $1915,X 
    CMP.B #$40 
    BEQ .blue 
    DEC A 
    STA.W $1915,X 

.blue:
    LDA.W $1920,X 
    CMP.B #$80 
    BEQ .returnREP20 
    DEC A 
    STA.W $1920,X 

.returnREP20:
    REP #$20 ; >.<

.return:
    PLP 
    RTL 


Spawn_TitleSequenceGradient_HDMAObjects:
    PHP 
    PHB 
    PHK 
    PLB 
    REP #$30 
    PHX 
    JSL.L Spawn_HDMAObject 
    db $00,$32 
    dw InstList_ColorMathSubScnBackdropColor_TitleSequenceGradient 
    JSL.L Spawn_HDMAObject 
    db $00,$31 
    dw InstList_ColorMathControlRegB_TitleSequenceGradient 
    PLX 
    PLB 
    PLP 
    RTL 


InstList_ColorMathSubScnBackdropColor_TitleSequenceGradient:
    dw Instruction_HDMAObject_HDMATableBank : db $7E 
    dw Instruction_Setup_TitleSequenceGradient_HDMATable 
    dw Instruction_HDMAObject_PreInstructionInY 
    dl PreInst_ColorMathSubScnBackdropColor_TitleSequenceGradient 
    dw $0001,$9800 
    dw Instruction_HDMAObject_Sleep 
    dw Instruction_HDMAObject_Delete 

InstList_ColorMathControlRegB_TitleSequenceGradient:
    dw Instruction_HDMAObject_HDMATableBank : db $88 
    dw Instruction_HDMAObject_PreInstructionInY 
    dl PreInstruction_ColorMathControlRegB_TitleSequenceGradient 
    dw $0001,HDMATable_ColorMathControlRegB_TitleSequenceGradient 
    dw Instruction_HDMAObject_Sleep 
    dw Instruction_HDMAObject_Delete 

HDMATable_ColorMathControlRegB_TitleSequenceGradient: 
    db $40,$A1 ;\
    db $3A,$A1 ;} Enable subtractive colour math on BG1/backdrop
    db $40,$31 ;\
    db $40,$31 ;} Enable colour math on BG1/sprites/backdrop
    db $00,$00

Instruction_Setup_TitleSequenceGradient_HDMATable:
    PHP 
    SEP #$20 
    REP #$10 
    PHX 
    PHY 
    STZ.B $6F 
    JSL.L Configure_TitleScreen_GradientHDMATable 
    PLY 
    PLX 
    PLP 
    RTS 


PreInst_ColorMathSubScnBackdropColor_TitleSequenceGradient:
    PHP 
    REP #$30 
    JSL.L Configure_TitleScreen_GradientHDMATable 
    LDA.W $1F51 
    CMP.W #CinematicFunction_LoadTitleSequence 
    BNE .return 
    LDX.W $18B2 
    LDA.W $18CC,X 
    INC #2
    STA.W $18CC,X 
    LDA.W #$0001 : STA.W $18E4,X 

.return:
    PLP 
    RTL 


PreInstruction_ColorMathControlRegB_TitleSequenceGradient:
    PHP 
    REP #$30 
    LDA.W $1F51 
    CMP.W #CinematicFunction_LoadTitleSequence 
    BNE .return 
    LDX.W $18B2 
    LDA.W $18CC,X 
    INC #2
    STA.W $18CC,X 
    LDA.W #$0001 : STA.W $18E4,X 

.return:
    PLP 
    RTL 


SpawnIntroCutsceneCrossFade_HDMAObject:
    PHP 
    PHB 
    PHK 
    PLB 
    REP #$30 
    PHX 
    JSL.L Spawn_HDMAObject 
    db $00,$31 
    dw InstList_IntroCutsceneCrossFade 
    PLX 
    PLB 
    PLP 
    RTL 


InstList_IntroCutsceneCrossFade:
    dw Instruction_HDMAObject_HDMATableBank : db $88 
    dw Instruction_HDMAObject_PreInstructionInY 
    dl PreInstruction_IntroCutsceneCrossFade 
    dw $0001,HDMATable_IntroCutsceneCrossFade_ColorMathControlRegB 
    dw Instruction_HDMAObject_Sleep 
    dw Instruction_HDMAObject_Delete 

HDMATable_IntroCutsceneCrossFade_ColorMathControlRegB: 
    db $17,$02 ; Enable colour math on BG2
    db $60,$06 ; Enable colour math on BG2/BG3
    db $40,$06 ; Enable colour math on BG2/BG3
    db $48,$02 ; Enable colour math on BG2
    db $00,$00

PreInstruction_IntroCutsceneCrossFade:
    PHP 
    REP #$30 
    LDA.W $1A4B 
    CMP.W #$0001 
    BNE .return 
    LDX.W $18B2 
    LDA.W $18CC,X 
    INC #2
    STA.W $18CC,X 
    LDA.W #$0001 : STA.W $18E4,X 

.return:
    PLP 
    RTL 


Spawn_WavySamus_HDMAObject:
    PHP 
    PHB 
    PHK 
    PLB 
    REP #$30 
    PHX 
    LDA.W #$0001 : STA.W $0D9C 
    LDA.W #$4000 : STA.W $0D9E 
    LDA.W #$0008 : STA.W $0DA0 
    LDA.W #$00C0 : STA.W $0D82 
    STA.W $0D85 
    STA.W $0D88 
    STA.W $0D8B 
    LDA.W #$9800 ; $7E
    STA.W $0D83 
    LDA.W #$9880 ; $7E
    STA.W $0D86 
    LDA.W #$9800 ; $7E
    STA.W $0D89 
    LDA.W #$9880 ; $7E
    STA.W $0D8C 
    STZ.W $0D8E 
    JSL.L Spawn_HDMAObject 
    db $42,$11 
    dw InstList_WavySamus 
    PLX 
    PLB 
    PLP 
    RTL 


InstList_WavySamus:
    dw Instruction_HDMAObject_IndirectHDMATableBank : db $7E 
    dw Instruction_HDMAObject_HDMATableBank : db $00 
    dw Instruction_Setup_WavySamus 
    dw Instruction_HDMAObject_PreInstructionInY 
    dl PreInstruction_WavySamus 
    dw $0001,$0D82 
    dw Instruction_HDMAObject_Sleep 
    dw Instruction_HDMAObject_Delete 

Instruction_Setup_WavySamus:
    PHP 
    REP #$30 
    LDA.W #$FFFE : STA.W $1914,X 
    LDA.W #$0001 : STA.W $1920,X 
    STZ.W $192C,X 
    STZ.W $1938,X 
    PLP 
    RTS 


PreInstruction_WavySamus:
    PHP 
    REP #$30 
    LDA.W $0D9C 
    BNE .enabled 
    LDX.W $18B2 
    LDA.W $18CC,X 
    INC #2
    STA.W $18CC,X 
    LDA.W #$0001 : STA.W $18E4,X 
    PLP 
    RTL 


.enabled:
    LDA.W #$0004 : STA.B $1C 
    LDA.W #$0080 : STA.B $1E 
    PHX 
    LDA.W $0DA0 
    ASL A 
    STA.B $12 
    LDA.W $1914,X 
    CLC 
    ADC.B $12 
    AND.W #$01FF 
    STA.W $1914,X 
    LDA.W $1914,X : STA.B $14 
    LDX.W #$0000 

.loop:
    PHX 
    LDX.B $14 
    LDA.L SineCosineTables_8bitSine_SignExtended,X 
    BPL + 
    JMP.W .negative 


  + STA.B $12 
    SEP #$20 
    STA.W $4202 
    LDA.W $0D9E : STA.W $4203 
    NOP #3
    REP #$20 
    LDA.W $4216 
    XBA 
    AND.W #$00FF 
    STA.B $16 
    SEP #$20 
    LDA.B $13 : STA.W $4202 
    LDA.W $0D9E : STA.W $4203 
    NOP #3
    REP #$20 
    LDA.W $4216 
    CLC 
    ADC.B $16 
    STA.B $16 
    SEP #$20 
    LDA.B $12 : STA.W $4202 
    LDA.W $0D9F : STA.W $4203 
    NOP #3
    REP #$20 
    LDA.W $4216 : STA.B $18 
    SEP #$20 
    LDA.B $13 : STA.W $4202 
    LDA.W $0D9F : STA.W $4203 
    REP #$20 
    LDA.B $16 
    CLC 
    ADC.B $18 
    STA.B $16 
    LDA.W $4215 
    AND.W #$FF00 
    CLC 
    ADC.B $16 
    AND.W #$FF00 
    XBA 
    STA.B $12 
    TXA 
    CLC 
    ADC.B $1C 
    AND.W #$01FF 
    STA.B $14 
    PLX 
    LDA.B $B9 
    CLC 
    ADC.B $12 
    STA.L $7E9800,X 
    JMP.W .next 


.negative:
    EOR.W #$FFFF 
    INC A 
    STA.B $12 
    SEP #$20 
    STA.W $4202 
    LDA.W $0D9E : STA.W $4203 
    NOP #3
    REP #$20 
    LDA.W $4216 
    XBA 
    AND.W #$00FF 
    STA.B $16 
    SEP #$20 
    LDA.B $13 : STA.W $4202 
    LDA.W $0D9E : STA.W $4203 
    NOP #3
    REP #$20 
    LDA.W $4216 
    CLC 
    ADC.B $16 
    STA.B $16 
    SEP #$20 
    LDA.B $12 : STA.W $4202 
    LDA.W $0D9F : STA.W $4203 
    NOP #3
    REP #$20 
    LDA.W $4216 : STA.B $18 
    SEP #$20 
    LDA.B $13 : STA.W $4202 
    LDA.W $0D9F : STA.W $4203 
    REP #$20 
    LDA.B $16 
    CLC 
    ADC.B $18 
    STA.B $16 
    LDA.W $4215 
    AND.W #$FF00 
    CLC 
    ADC.B $16 
    AND.W #$FF00 
    XBA 
    STA.B $12 
    TXA 
    CLC 
    ADC.B $1C 
    AND.W #$01FF 
    STA.B $14 
    PLX 
    LDA.B $B9 
    SEC 
    SBC.B $12 
    STA.L $7E9800,X 

.next:
    INX #2
    CPX.B $1E 
    BPL + 
    JMP.W .loop 


  + LDX.W #$007E 

.loopBG3XScroll:
    LDA.B $B9 
    SEC 
    SBC.L $7E9800,X 
    CLC 
    ADC.B $B9 
    STA.L $7E9880,X 
    DEX #2
    BPL .loopBG3XScroll 
    PLX 
    PLP 
    RTL 


Freespace_Bank88_EE32: 
; $11CE bytes
