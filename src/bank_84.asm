
org $848000


;;; $8000: Golden Torizo health-based palette handling ;;;
GoldenTorizo_HealthBasedPalette_Handling:
;; Parameter:
;;     A: Health. Assumed to be less than 8000h

; This is a great way to start the PLM bank
    PHX : PHY : PHB
    PHK : PLB
    XBA : AND.W #$0078 : BIT.W #$0040 : BEQ +
    LDA.W #$0038

+   ASL #2 : ORA.W #$001E : TAY
    LDX.W #$001E

  .loop:
    LDA.W .palette2,Y : STA.L Palettes_SpriteP2,X
    LDA.W .palette1,Y : STA.L Palettes_SpriteP1,X
    DEY #2
    DEX #2 : BPL .loop
    PLB : PLY : PLX
    RTL

  .palette1:
; Golden Torizo palette 1
    dw $1000,$56BA,$41B2,$1447,$0403,$4E15,$3570,$24CB,$1868,$6F7F,$51F8,$410E,$031F,$01DA,$00F5,$0C63 ; 0..7FFh
    dw $1000,$56DB,$39D3,$1047,$0403,$4636,$2D91,$20EC,$1489,$6F9B,$5215,$3D2C,$133B,$0DF6,$0CF2,$0C63 ; 800h..FFFh
    dw $1000,$52FB,$31F4,$1067,$0402,$3E76,$25B2,$192D,$10A9,$6F96,$5251,$396A,$2756,$1A13,$190F,$0863 ; 1000h..17FFh
    dw $1000,$531C,$2A15,$0C67,$0402,$3697,$1DD3,$154E,$0CCA,$6FB2,$526E,$3588,$3772,$262F,$250C,$0863 ; 1800h..1FFFh
    dw $1000,$4F5C,$1E56,$0888,$0001,$2EB8,$1A13,$116F,$0CEB,$73AD,$4EAA,$35A6,$4B8D,$364B,$3509,$0443 ; 2000h..27FFh
    dw $1000,$4F7D,$1677,$0488,$0001,$26D9,$1234,$0D90,$090C,$73C9,$4EC7,$31C4,$5BA9,$4267,$4106,$0443 ; 2800h..2FFFh
    dw $1000,$4B9D,$0E98,$04A8,$0000,$1F19,$0A55,$05D1,$052C,$73C4,$4F03,$2E02,$6FC4,$4E84,$4D23,$0043 ; 3000h..37FFh
    dw $0000,$4BBE,$06B9,$00A8,$0000,$173A,$0276,$01F2,$014D,$73E0,$4F20,$2A20,$7FE0,$5AA0,$5920,$0043 ; 3800h+

  .palette2:
; Golden Torizo palette 2
    dw $1000,$4215,$2D0D,$0002,$0000,$3970,$20CB,$0C26,$0403,$463A,$28B3,$1809,$6F7F,$51FD,$4113,$0C63 ; 0..7FFh
    dw $1000,$4236,$252E,$0002,$0000,$3191,$1CEC,$0C47,$0424,$4656,$28D0,$1428,$6F7B,$51F9,$40F0,$0C63 ; 800h..FFFh
    dw $1000,$3E56,$214F,$0002,$0000,$29D1,$190D,$0888,$0424,$4693,$290E,$1046,$6F76,$4DF5,$40EE,$0842 ; 1000h..17FFh
    dw $1000,$3E77,$1970,$0002,$0000,$21F2,$152E,$08A9,$0445,$46AF,$292B,$0C65,$6F72,$4DF1,$40CB,$0842 ; 1800h..1FFFh
    dw $1000,$3AB7,$15B1,$0003,$0000,$1A13,$0D6E,$04CA,$0066,$4ACB,$2568,$0C84,$6B4D,$4A0C,$44C8,$0421 ; 2000h..27FFh
    dw $1000,$3AD8,$0DD2,$0003,$0000,$1234,$098F,$04EB,$0087,$4AE7,$2585,$08A3,$6B49,$4A08,$44A5,$0421 ; 2800h..2FFFh
    dw $1000,$36F8,$09F3,$0003,$0000,$0A74,$05B0,$012C,$0087,$4B24,$25C3,$04C1,$6B44,$4604,$44A3,$0000 ; 3000h..37FFh
    dw $1000,$3719,$0214,$0003,$0000,$0295,$01D1,$014D,$00A8,$4B40,$25E0,$00E0,$6B40,$4600,$4480,$0000 ; 3800h+


;;; $8232: Load room PLM GFX ;;;
Load_Room_PLM_Graphics:
; Called as part of unpausing
; The call to $8764 *should* be done with the PLM index in X,
; which is where the PLM's $7E:DF0C variable is written
; In the case of unpausing, this variable doesn't need to be written again,
; but this does mean that the PLM with indexes 0/2/4/6 get their $7E:DF0C variable clobbered
    PHP : PHB
    REP #$30
    PHK : PLB
    STZ.W PLM_ItemGFXIndex
    LDX.W #$0000

  .loop:
    PHX
    LDY.W PLM_ItemGFXPointers,X
    JSR Instruction_PLM_LoadItemPLMGFX
    PLX
    INX #2 : CPX.W #$0008 : BNE .loop
    PLB : PLP
    RTL


;;; $8250: Clear sounds when going through door ;;;
Clear_Sounds_When_Going_Through_Door:
; Called at start of door transition
    LDA.W #$001D
    JSL Run_Samus_Command
    RTL


if !FEATURE_KEEP_UNREFERENCED
;;; $8258: Unused. Clear spin jump sound when going through door ;;;
UNUSED_Clear_SpinJumpSound_GoingThroughDoor_848258:
    LDA.W PoseXDirection : AND.W #$FF00 : CMP.W #$0300 : BEQ .playSound
    CMP.W #$1400 : BNE .return

  .playSound:
    LDA.W #$0032
    JSL QueueSound

  .return:
    RTL
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $8270: Play spin jump sound if spin jumping ;;;
Play_SpinJumpSound_if_SpinJumping:
; Called at end of door transition
    LDA.W #$001C
    JSL Run_Samus_Command
    RTL


if !FEATURE_KEEP_UNREFERENCED
;;; $8278: Unused. Play resumed spin jump sound ;;;
UNUSED_Play_Resumed_SpinJumpSound_848278:
    LDA.W PoseXDirection : AND.W #$FF00 : CMP.W #$0300 : BEQ .playSound
    CMP.W #$1400 : BNE .return

  .playSound:
    LDA.W #$0030
    JSL QueueSound

  .return:
    RTL
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $8290: Calculate PLM block co-ordinates ;;;
Calculate_PLM_Block_Coordinates:
;; Parameters:
;;     X: PLM index
    LDA.W PLM_BlockIndices,X : LSR : STA.W $4204
    SEP #$20
    LDA.W RoomWidthBlocks : STA.W $4206
    REP #$20
    NOP #6
    LDA.W $4214 : STA.W PLM_YBlock
    LDA.W $4216 : STA.W PLM_XBlock
    RTL


;;; $82B4: Write level data block type and BTS ;;;
Write_Level_Data_Block_Type_and_BTS:
;; Parameter:
;;     A low: BTS
;;     A high: Block type in high nybble (like level data)
;;     X: PLM block index
    PHX
    STA.B DP_Temp12
    SEP #$20
    LDA.L LevelData+1,X : AND.B #$0F : ORA.B DP_Temp13 : STA.L LevelData+1,X
    REP #$20
    TXA : LSR : TAX
    SEP #$20
    LDA.B DP_Temp12 : STA.L BTS,X
    REP #$20
    PLX
    RTS


;;; $82D6: Write row of level data block and BTS ;;;
Write_Row_of_Level_Data_Block_and_BTS:
;; Parameters:
;;     X: PLM index
;;     [[S] + 1] + 1: Level data block
;;     [[S] + 1] + 3: BTS
;;     [[S] + 1] + 5: Number of blocks
    PHX
    PHY
    LDY.W #$0001
    LDA.B ($05,S),Y : STA.B DP_Temp12
    INY #2
    LDA.B ($05,S),Y : STA.B DP_Temp14
    INY #2
    LDA.B ($05,S),Y : STA.B DP_Temp16
    LDA.B $05,S : CLC : ADC.W #$0006 : STA.B $05,S
    LDA.W PLM_BlockIndices,X : TAX
    LSR : PHA
    LDA.B DP_Temp12
    LDY.B DP_Temp16

  .loopLevelData:
    STA.L LevelData,X
    INX #2
    DEY : BNE .loopLevelData
    SEP #$20
    PLX
    LDA.B DP_Temp14
    LDY.B DP_Temp16

  .loopBTS:
    STA.L BTS,X
    INX
    DEY : BNE .loopBTS
    REP #$20
    PLY : PLX
    RTS


;;; $831A: Load item x-ray blocks (also load room special x-ray blocks) ;;;
Load_Item_and_Room_Special_Xray_Blocks:
; Note that any new PLMs created in the free space in this bank will be considered to be an "item PLM",
; meaning the PLM argument specified in the PLM populations will be used as a unique ID in the picked up items table ($7E:D870)
; and won't show an x-ray block if they've been "picked up".

; Note that these same PLMs are expected to have $7E:DF0C,x set to a 'PLM item GFX index',
; which is an index (2k for k in 0..7) to the table of draw instruction pointers responsible for drawing the x-ray tile

; see labels.asm for RoomVars:
    PHP : PHB
    REP #$30
    PHX : PHY
    PHK : PLB
    LDX.W #$004E

  .loopPLM:
    LDA.W PLM_IDs,X : CMP.W #PreInstruction_PLM_GotoLinkInstructionIfTriggered : BCC .next
    PHX
    LDA.W PLM_RoomArgs,X : BMI .next
    JSL BitIndexToByteIndexAndBitmask
    LDA.L SRAMMirror_Items,X
    PLX ; >.<
    AND.W Bitmask : BNE .next
    PHX ; >.<
    JSL Calculate_PLM_Block_Coordinates
    LDA.L PLMExtra_Vars,X : TAY
    LDX.W .InstructionPointers,Y
    LDA.W $0002,X : AND.W #$0FFF
    LDX.W PLM_XBlock
    LDY.W PLM_YBlock
    JSL LoadBlockToXrayBG2Tilemap
    PLX

  .next:
    DEX #2 : BPL .loopPLM
    LDX.W RoomStatePointer
    LDA.L RoomStates_XrayBlocks,X : BEQ .return
    TAX

  .loopRoomVar:
    LDA.L RoomVars_XPosition,X : BEQ .return
    AND.W #$00FF : STA.B DP_Temp12
    LDA.L RoomVars_YPosition,X : AND.W #$00FF : STA.B DP_Temp14
    PHX
    LDA.L RoomVars_block,X
    LDX.B DP_Temp12
    LDY.B DP_Temp14
    JSL LoadBlockToXrayBG2Tilemap
    PLX ; >.< PLA
    TXA : CLC : ADC.W #$0004 : TAX
    JMP .loopRoomVar

  .return:
    PLY : PLX : PLB : PLP
    RTL

  .InstructionPointers:
; Pointers to x-ray block drawing instructions
    dw DrawInst_DrawItemFrame0_0
    dw DrawInst_DrawItemFrame0_1
    dw DrawInst_DrawItemFrame0_2
    dw DrawInst_DrawItemFrame0_3
    dw DrawInst_EnergyTank_0
    dw DrawInst_MissileTank_1
    dw DrawInst_SuperMissileTank_1
    dw DrawInst_PowerBombTank_0


;;; $83AD: Enable PLMs ;;;
Enable_PLMs:
    PHP
    REP #$20
    LDA.W #$8000 : TSB.W PLM_Flag
    PLP
    RTL


;;; $83B8: Disable PLMs ;;;
Disable_PLMs:
    PHP
    REP #$20
    LDA.W #$8000 : TRB.W PLM_Flag
    PLP
    RTL


;;; $83C3: Clear PLMs ;;;
Clear_PLMs:
    PHP
    REP #$30
    PHX
    LDX.W #$004E

  .loop:
    STZ.W PLM_IDs,X
    DEX #2 : BPL .loop
    STZ.W PLM_ItemGFXIndex
    PLX : PLP
    RTL


;;; $83D7: Spawn hard-coded PLM ;;;
Spawn_Hardcoded_PLM:
;; Parameters:
;;     [[S] + 1] + 1: X position
;;     [[S] + 1] + 2: Y position
;;     [[S] + 1] + 3: PLM ID
;; Returns:
;;     Carry: set if PLM could not be spawned

; Must be called from lorom bank
    PHB : PHY : PHX
    PHK : PLB
    LDY.W #$004E

  .loop:
    LDA.W PLM_IDs,Y : BEQ .found
    DEY #2 : BPL .loop
    LDA.B $06,S : CLC : ADC.W #$0004 : STA.B $06,S
    PLX : PLY : PLB
    SEC
    RTL

  .found:
    SEP #$20
    LDA.B $08,S : PHA : PLB
    TYX
    LDY.W #$0002
    LDA.B ($06,S),Y : STA.W $4202
    LDA.W RoomWidthBlocks : STA.W $4203
    LDY.W #$0001
    LDA.B ($06,S),Y
    REP #$20
    AND.W #$00FF : CLC : ADC.W $4216 : ASL : STA.W PLM_BlockIndices,X
    LDY.W #$0003
    LDA.B ($06,S),Y
    TXY
    TAX
    LDA.B $06,S : CLC : ADC.W #$0004 : STA.B $06,S
    PHK : PLB
    TXA : STA.W PLM_IDs,Y
    TYX
    TAY
    LDA.W #$0000 : STA.W PLM_RoomArgs,X : STA.L PLMExtra_Vars,X
    LDA.W #.return : STA.W PLM_PreInstructions,X
    LDA.W $0002,Y : STA.W PLM_InstListPointers,X
    LDA.W #$0001 : STA.L PLMExtra_InstructionTimers,X
    LDA.W #InstList_PLM_DefaultPLMDrawInstruction : STA.L PLMExtra_DrawInstructionPointers,X
    STZ.W PLM_Timers,X : STX.W PLM_Index
    TYX
    LDY.W PLM_Index
    JSR.W ($0000,X)
    PLX : PLY : PLB
    CLC
    RTL

  .return:
    RTS


;;; $846A: Spawn room PLM ;;;
Spawn_Room_PLM:
;; Parameters:
;;     X: Pointer to room PLM entry
;;         [X]: PLM ID
;;         [X] + 2: PLM X block
;;         [X] + 3: PLM Y block
;;         [X] + 4: PLM room argument
;; Returns:
;;     Carry: set if PLM could not be spawned

; see labels.asm for PLMPopulations:
    PHP : PHB : PHY : PHX
    PHK : PLB
    LDY.W #$004E

  .loop:
    LDA.W PLM_IDs,Y : BEQ .found
    DEY #2 : BPL .loop
    PLX : PLY : PLB : PLP
    SEC
    RTL

  .found:
    SEP #$20
    LDA.L PLMPopulations_Y,X : STA.W $4202
    LDA.W RoomWidthBlocks : STA.W $4203
    LDA.L PLMPopulations_X,X
    REP #$20
    AND.W #$00FF : CLC : ADC.W $4216 : ASL : STA.W PLM_BlockIndices,Y
    LDA.L PLMPopulations_param,X : STA.W PLM_RoomArgs,Y
    LDA.L PLMPopulations_PLM,X : STA.W PLM_IDs,Y
    TYX
    TAY
    LDA.W #$0000 : STA.L PLMExtra_Vars,X
    LDA.W #.return : STA.W PLM_PreInstructions,X
    LDA.W $0002,Y : STA.W PLM_InstListPointers,X
    LDA.W #$0001 : STA.L PLMExtra_InstructionTimers,X
    LDA.W #InstList_PLM_DefaultPLMDrawInstruction : STA.L PLMExtra_DrawInstructionPointers,X
    STZ.W PLM_Timers,X : STX.W PLM_Index
    TYX
    LDY.W PLM_Index
    JSR.W ($0000,X)
    PLX : PLY : PLB : PLP
    CLC
    RTL

  .return:
    RTS


;;; $84E7: Spawn PLM (to current block index) ;;;
Spawn_PLM_to_CurrentBlockIndex:
;; Parameter:
;;     A: PLM ID
;; Returns:
;;     Carry: If PLM is not spawned, carry is unchanged. Otherwise set according to PLM setup, or clear if PLM setup doesn't change the carry (thanks to the lucky ASL at $8500)
    PHB : PHY : PHX
    PHK : PLB
    TAY
    LDX.W #$004E

  .loop:
    LDA.W PLM_IDs,X : BEQ .found
    DEX #2 : BPL .loop
    PLX : PLY : PLB
    RTL

  .found:
    LDA.W CurrentBlockIndex : ASL : STA.W PLM_BlockIndices,X
    TYA : STA.W PLM_IDs,X
    LDA.W #.return : STA.W PLM_PreInstructions,X
    LDA.W $0002,Y : STA.W PLM_InstListPointers,X
    LDA.W #$0001 : STA.L PLMExtra_InstructionTimers,X
    LDA.W #InstList_PLM_DefaultPLMDrawInstruction : STA.L PLMExtra_DrawInstructionPointers,X
    LDA.W #$0000 : STA.W PLM_Timers,X : STA.W PLM_RoomArgs,X
    STA.L PLMExtra_Vars,X : STX.W PLM_Index
    TYX
    LDY.W PLM_Index
    JSR.W ($0000,X)
    PLX : PLY : PLB
    RTL

  .return:
    RTS


if !FEATURE_KEEP_UNREFERENCED
;;; $853E: Unused. Spawn enemy PLM ;;;
UNUSED_Spawn_Enemy_PLM_84853E:
;; Parameters:
;;     A: PLM ID
;;     X: Enemy index
    PHB : PHY : PHX
    PHK : PLB
    TXY
    PHA
    LDX.W #$004E

  .loop:
    LDA.W PLM_IDs,X : BEQ .found
    DEX #2 : BPL .loop
    PLA : PLX : PLY : PLB
    RTL

  .found:
    LDA.W Enemy.YPosition,Y
    LSR #4
    SEP #$20
    STA.W $4202
    LDA.W RoomWidthBlocks : STA.W $4203
    REP #$20
    LDA.W Enemy.XPosition,Y
    LSR #4 : CLC : ADC.W $4216 : ASL : STA.W PLM_BlockIndices,X
    PLA : STA.W PLM_IDs,X
    TAY
    LDA.W #.return : STA.W PLM_PreInstructions,X
    LDA.W $0002,Y : STA.W PLM_InstListPointers,X
    LDA.W #$0001 : STA.L PLMExtra_InstructionTimers,X
    LDA.W #InstList_PLM_DefaultPLMDrawInstruction : STA.L PLMExtra_DrawInstructionPointers,X
    LDA.W #$0000 : STA.W PLM_Timers,X : STA.W PLM_RoomArgs,X
    STA.L PLMExtra_Vars,X : STX.W PLM_Index
    TYX
    LDY.W PLM_Index
    JSR.W ($0000,X)
    PLX : PLY : PLB
    RTL

  .return:
    RTS
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $85B4: PLM handler ;;;
PLM_Handler:
    PHP : PHB
    PHK : PLB
    REP #$30
    BIT.W PLM_Flag : BPL .return
    STZ.W PLM_DrawTilemapIndex
    LDX.W #$004E

  .loop:
    STX.W PLM_Index
    LDA.W PLM_IDs,X : BEQ .next
    JSR Process_PLM
    LDX.W PLM_Index

  .next:
    DEX #2 : BPL .loop

  .return:
    PLB : PLP
    RTL


;;; $85DA: Process PLM ;;;
Process_PLM:
;; Parameter:
;;     X: PLM index

; Some instructions (e.g. sleep) pop the return address pushed to the stack by $85F7 to return out of *this* routine
; (marked "terminate processing PLM")
    JSR.W (PLM_PreInstructions,X)
    LDX.W PLM_Index
    LDA.L PLMExtra_InstructionTimers,X : DEC : STA.L PLMExtra_InstructionTimers,X : BNE .return
    LDY.W PLM_InstListPointers,X

  .loop:
    LDA.W $0000,Y : BPL .nonZeroTimer
    STA.B DP_Temp12
    INY #2
    PEA .loop-1
    JMP.W (DP_Temp12)

  .nonZeroTimer:
    STA.L PLMExtra_InstructionTimers,X
    LDA.W $0002,Y : STA.L PLMExtra_DrawInstructionPointers,X
    TYA : CLC : ADC.W #$0004 : STA.W PLM_InstListPointers,X
    JSR Process_PLM_Draw_Instruction
    LDX.W PLM_Index
    JSL Calculate_PLM_Block_Coordinates
    JSR DrawPLM_HardCoded

  .return:
    RTS


;;; $861E: Process PLM draw instruction ;;;
Process_PLM_Draw_Instruction:
;; Parameter:
;;     X: PLM index
    LDA.L PLMExtra_DrawInstructionPointers,X : TAY
    LDA.W PLM_BlockIndices,X : STA.B DP_Temp12
    TAX

  .loopDrawEntry:
    LDA.W $0000,Y : BMI .column
    AND.W #$00FF : STA.B DP_Temp16
    INY #2

  .loopRow:
    LDA.W $0000,Y : STA.L LevelData,X
    INY #2
    INX #2
    DEC.B DP_Temp16 : BNE .loopRow
    JMP .next

  .column:
    AND.W #$00FF : STA.B DP_Temp16
    INY #2

  .loopColumn:
    LDA.W $0000,Y : STA.L LevelData,X
    INY #2
    TXA : CLC : ADC.W RoomWidthBlocks : ADC.W RoomWidthBlocks : TAX
    DEC.B DP_Temp16 : BNE .loopColumn

  .next:
    LDA.W $0000,Y : BNE +
    RTS

+   DEY
    LDA.W $0000,Y : XBA : BPL .positive
    ORA.W #$FF00
    BRA +

  .positive:
    AND.W #$00FF

+   ASL : CLC : ADC.B DP_Temp12 : STA.B DP_Temp14
    LDA.W $0001,Y : XBA : BPL +
    ORA.W #$FF00 : EOR.W #$FFFF : INC : TAX
    LDA.W #$0000

-   SEC : SBC.W RoomWidthBlocks
    DEX : BNE -
    BRA .setX

+   AND.W #$00FF : BEQ .setX
    TAX
    LDA.W #$0000

-   CLC : ADC.W RoomWidthBlocks
    DEX : BNE -

  .setX:
    ASL : CLC : ADC.B DP_Temp14 : TAX
    INY #3
    JMP .loopDrawEntry


;;; $86B4: Instruction - sleep ;;;
Instruction_PLM_Sleep:
;; Parameters:
;;     X: PLM index
;;     Y: Pointer to after this instruction
    DEY #2
    TYA : STA.W PLM_InstListPointers,X
    PLA
    RTS


;;; $86BC: Instruction - delete ;;;
Instruction_PLM_Delete:
;; Parameters:
;;     X: PLM index
    STZ.W PLM_IDs,X
    PLA
    RTS


;;; $86C1: Instruction - pre-instruction = [[Y]] ;;;
Instruction_PLM_PreInstruction_inY:
;; Parameters:
;;     X: PLM index
;;     Y: Pointer to instruction arguments
;; Returns:
;;     Y: Pointer to next instruction
    LDA.W $0000,Y : STA.W PLM_PreInstructions,X
    INY #2
    RTS


;;; $86CA: Instruction - clear pre-instruction ;;;
Instruction_PLM_ClearPreInstruction:
;; Parameters:
;;     X: PLM index
    LDA.W #.return : STA.W PLM_PreInstructions,X

  .return:
    RTS


if !FEATURE_KEEP_UNREFERENCED
;;; $86D1: Unused. Instruction - call function [[Y]] ;;;
UNUSED_Instruction_PLM_CallFuctionInY_8486D1:
;; Parameters:
;;     Y: Pointer to instruction arguments
;; Returns:
;;     Y: Pointer to next instruction
    LDA.W $0000,Y : STA.B DP_Temp12
    LDA.W $0001,Y : STA.B DP_Temp13
    PHY
    JSL .externalFunction
    PLY
    LDX.W PLM_Index
    INY #3
    RTS

  .externalFunction
    JML.W [DP_Temp12]


;;; $86EB: Unused. Instruction - call function [[Y]] with A = [[Y] + 3] ;;;
UNUSED_Instruction_PLM_CallFuctionInY_withA_8486EB:
;; Parameters:
;;     Y: Pointer to instruction arguments
;; Returns:
;;     Y: Pointer to next instruction
    LDA.W $0000,Y : STA.B DP_Temp12
    LDA.W $0001,Y : STA.B DP_Temp13
    LDA.W $0003,Y
    PHY
    JSL .externalFunction
    PLY
    LDX.W PLM_Index
    TYA : CLC : ADC.W #$0005 : TAY
    RTS

  .externalFunction:
    JML.W [DP_Temp12]
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $870B: Instruction - call function [[Y]] ;;;
Instruction_PLM_CallFunctionInY:
;; Parameters:
;;     Y: Pointer to instruction arguments
;; Returns:
;;     Y: Pointer to next instruction
    LDA.W $0000,Y : STA.B DP_Temp12
    LDA.W $0001,Y : STA.B DP_Temp13
    PHX : PHY
    JSL .externalFunction
    PLY : PLX
    INY #3
    RTS

  .externalFunction:
    JML.W [DP_Temp12]


;;; $8724: Instruction - go to [[Y]] ;;;
Instruction_PLM_GotoY:
;; Parameters:
;;     Y: Pointer to instruction arguments
;; Returns:
;;     Y: Pointer to next instruction
    LDA.W $0000,Y : TAY
    RTS


if !FEATURE_KEEP_UNREFERENCED
;;; $8729: Unused. Instruction - go to [Y] + ±[[Y]] ;;;
UNUSED_Instruction_PLM_GotoY_PlusMinusY_848729:
;; Parameters:
;;     Y: Pointer to instruction arguments
;; Returns:
;;     Y: Pointer to next instruction
    STY.B DP_Temp12
    DEY
    LDA.W $0000,Y : XBA : BMI .negative
    AND.W #$00FF
    BRA +

  .negative:
    ORA.W #$FF00

+   CLC : ADC.B DP_Temp12 : TAY
    RTS
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $873F: Instruction - decrement timer and go to [[Y]] if non-zero ;;;
Instruction_PLM_DecrementTimer_GotoYIfNonZero:
;; Parameters:
;;     X: PLM index
;;     Y: Pointer to instruction arguments
;; Returns:
;;     Y: Pointer to next instruction
    DEC.W PLM_Timers,X : BNE Instruction_PLM_GotoY
    INY #2
    RTS


if !FEATURE_KEEP_UNREFERENCED
;;; $8747: Unused. Instruction - decrement timer and go to [Y] + ±[[Y]] if non-zero ;;;
UNUSED_Instruction_PLM_DecrementTimer_GotoYIfNonZero_848747:
;; Parameters:
;;     X: PLM index
;;     Y: Pointer to instruction arguments
;; Returns:
;;     Y: Pointer to next instruction
    DEC.W PLM_Timers,X : BNE UNUSED_Instruction_PLM_GotoY_PlusMinusY_848729
    INY
    RTS
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $874E: Instruction - timer = [[Y]] (8-bit) ;;;
Instruction_PLM_TimerEqualsY_8Bit:
;; Parameters:
;;     X: PLM index
;;     Y: Pointer to instruction arguments
;; Returns:
;;     Y: Pointer to next instruction
    SEP #$20
    LDA.W $0000,Y : STA.W PLM_Timers,X
    REP #$20
    INY
    RTS


if !FEATURE_KEEP_UNREFERENCED
;;; $875A: Unused. Instruction - timer = [[Y]] (16-bit) ;;;
UNUSED_Instruction_PLM_TimerEqualsY_16Bit_84875A:
;; Parameters:
;;     X: PLM index
;;     Y: Pointer to instruction arguments
;; Returns:
;;     Y: Pointer to next instruction
    LDA.W $0000,Y : STA.W PLM_Timers,X
    INY #2
    RTS
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $8763: RTS ;;;
RTS_848763:
    RTS


;;; $8764: Instruction - load item PLM GFX ;;;
Instruction_PLM_LoadItemPLMGFX:
;; Parameter
;;     X: PLM index
;;     Y: Pointer to instruction arguments
;;         [Y]: Pointer to GFX of two blocks (each composed of 4 tiles in the following order)
;;         [Y] + 2: Palette index - block 1 - top-left
;;         [Y] + 3: Palette index - block 1 - top-right
;;         [Y] + 4: Palette index - block 1 - bottom-left
;;         [Y] + 5: Palette index - block 1 - bottom-right
;;         [Y] + 6: Palette index - block 2 - top-left
;;         [Y] + 7: Palette index - block 2 - top-right
;;         [Y] + 8: Palette index - block 2 - bottom-left
;;         [Y] + 9: Palette index - block 2 - bottom-right
;; Returns:
;;     Y: Pointer to next instruction
    LDA.W PLM_ItemGFXIndex : STA.L PLMExtra_Vars,X
    TAX
    INC #2 : AND.W #$0006 : STA.W PLM_ItemGFXIndex
    LDA.W .VRAMAddresses,X : STA.B DP_Temp12
    LDA.W .tileTableIndices,X : STA.B DP_Temp14
    LDA.W .startingTileNumbers,X : STA.B DP_Temp16
    TYA : STA.W PLM_ItemGFXPointers,X
    LDX.W VRAMWriteStack
    LDA.W #$0100 : STA.B VRAMWrite.size,X
    LDA.W $0000,Y : STA.B VRAMWrite.src,X
    LDA.W #$0089 : STA.B VRAMWrite.src+2,X
    LDA.B DP_Temp12 : STA.B VRAMWrite.dest,X
    TXA : CLC : ADC.W #$0007 : STA.W VRAMWriteStack
    INY #2
    LDX.B DP_Temp14
    TXA : CLC : ADC.W #$0010 : STA.B DP_Temp18

  .loop:
    LDA.W $0000,Y : AND.W #$00FF : XBA : ASL #2
    CLC : ADC.B DP_Temp16 : STA.L TileTable,X
    INC.B DP_Temp16
    INY
    INX #2 : CPX.B DP_Temp18 : BNE .loop
    LDX.W PLM_Index
    RTS

  .VRAMAddresses:
    dw $3E00,$3E80,$3F00,$3F80
  .tileTableIndices:
    dw $0470,$0480,$0490,$04A0
  .startingTileNumbers:
    dw $03E0,$03E8,$03F0,$03F8


;;; $87E5: Instruction - transfer [[Y]] bytes from [[Y] + 2] to VRAM [[Y] + 5] ;;;
Instruction_PLM_TransferBytesToVRAM:
;; Parameters:
;;     Y: Pointer to instruction arguments
;; Returns:
;;     Y: Pointer to next instruction
    LDX.W VRAMWriteStack
    LDA.W $0000,Y : STA.B VRAMWrite.size,X
    LDA.W $0002,Y : STA.B VRAMWrite.src,X
    LDA.W $0003,Y : STA.B VRAMWrite.src+1,X
    LDA.W $0005,Y : STA.B VRAMWrite.dest,X
    TXA : CLC : ADC.W #$0007 : STA.W VRAMWriteStack
    TYA : CLC : ADC.W #$0007 : TAY
    LDX.W PLM_Index
    RTS


;;; $880E: Instruction - go to [[Y] + 1] if any of the boss bits [[Y]] are set ;;;
Instruction_PLM_GotoY_ifBossBitsSet:
;; Parameters:
;;     Y: Pointer to instruction arguments
;; Returns:
;;     Y: Pointer to next instruction
    LDA.W $0000,Y
    INY
    AND.W #$00FF
    JSL CheckIfBossBitsForCurrentAreaMatchAnyBitsInA
    BCC +
    JMP Instruction_PLM_GotoY

+   INY #2
    RTS


if !FEATURE_KEEP_UNREFERENCED
;;; $8821: Unused. Instruction - set the boss bits [[Y]] ;;;
UNUSED_Instruction_PLM_SetBossBits_848821:
;; Parameters:
;;     Y: Pointer to instruction arguments
;; Returns:
;;     Y: Pointer to next instruction
    LDA.W $0000,Y : AND.W #$00FF
    JSL SetBossBitsInAForCurrentArea
    INY
    RTS
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $882D: Instruction - go to [[Y] + 2] if the event [[Y]] is set ;;;
Instruction_PLM_GotoY_ifEventIsSet:
;; Parameters:
;;     Y: Pointer to instruction arguments
;; Returns:
;;     Y: Pointer to next instruction
    LDA.W $0000,Y
    INY #2
    JSL CheckIfEvent_inA_HasHappened
    BCC .return
    JMP Instruction_PLM_GotoY

  .return:
    INY #2
    RTS


;;; $883E: Instruction - set the event [[Y]] ;;;
Instruction_PLM_SetTheEvent:
;; Parameters:
;;     Y: Pointer to instruction arguments
;; Returns:
;;     Y: Pointer to next instruction
    LDA.W $0000,Y
    JSL MarkEvent_inA
    INY #2
    RTS


;;; $8848: Instruction - go to [[Y]] if room argument chozo block destroyed ;;;
Instruction_PLM_GotoY_ifRoomArg_ChozoBlockDestroyed:
;; Parameters:
;;     X: PLM index
;;     Y: Pointer to instruction arguments
;; Returns:
;;     Y: Pointer to next instruction

; Negative room argument => chozo block is not destroyed
; Used by unused chozo block PLMs $D700/D708
    PHX
    LDA.W PLM_RoomArgs,X : BMI .pullX
    JSL BitIndexToByteIndexAndBitmask
    LDA.L SRAMMirror_ChozeBlockDestroyed,X
    PLX
    AND.W Bitmask : BEQ .return
    JMP Instruction_PLM_GotoY

  .return:
    INY #2
    RTS

  .pullX:
    PLX
    BRA .return


;;; $8865: Instruction - set room argument chozo block destroyed ;;;
Instruction_PLM_SetRoomArg_ChozoBlockDestroyed:
;; Parameters:
;;     X: PLM index

; Negative room argument => chozo block destroyed flag isn't set
; Used by unused chozo block PLMs $D700/D708
    PHX
    LDA.W PLM_RoomArgs,X : BMI .return
    JSL BitIndexToByteIndexAndBitmask
    LDA.L SRAMMirror_ChozeBlockDestroyed,X : ORA.W Bitmask : STA.L SRAMMirror_ChozeBlockDestroyed,X

  .return:
    PLX
    RTS


;;; $887C: Instruction - go to [[Y]] if the room argument item is collected ;;;
Instruction_PLM_GotoY_ifRoomArg_ItemIsCollected:
;; Parameters:
;;     X: PLM index
;;     Y: Pointer to instruction arguments
;; Returns:
;;     Y: Pointer to next instruction

; Negative room argument => item is not collected
    PHX
    LDA.W PLM_RoomArgs,X : BMI .pullX
    JSL BitIndexToByteIndexAndBitmask
    LDA.L SRAMMirror_Items,X
    PLX
    AND.W Bitmask : BEQ .return
    JMP Instruction_PLM_GotoY

  .return:
    INY #2
    RTS

  .pullX:
    PLX
    BRA .return


;;; $8899: Instruction - set the room argument item collected ;;;
Instruction_PLM_SetRoomArg_ItemCollected:
;; Parameters:
;;     X: PLM index

; Negative room argument => item collected is not set
    PHX
    LDA.W PLM_RoomArgs,X : BMI .return
    JSL BitIndexToByteIndexAndBitmask
    LDA.L SRAMMirror_Items,X : ORA.W Bitmask : STA.L SRAMMirror_Items,X

  .return:
    PLX
    RTS


;;; $88B0: Instruction - pick up beam [[Y]] and display message box [[Y] + 2] ;;;
Instruction_PLM_PickUpBeam_DisplayMessageBox:
;; Parameters:
;;     Y: Pointer to instruction arguments
;; Returns:
;;     Y: Pointer to next instruction
    LDA.W $0000,Y : ORA.W CollectedBeams : STA.W CollectedBeams
    LDA.W $0000,Y : ORA.W EquippedBeams : STA.W EquippedBeams
    LDA.W $0000,Y : ASL : AND.W #$0008 : TRB.W EquippedBeams
    LDA.W $0000,Y : LSR : AND.W #$0004 : TRB.W EquippedBeams
    PHX : PHY
    JSL Update_Beam_Tiles_and_Palette
    PLY : PLX
    LDA.W #$0168
    JSL Play_Room_Music_Track_After_A_Frames
    LDA.W $0002,Y : AND.W #$00FF
    JSL MessageBox_Routine
    INY #3
    RTS


;;; $88F3: Instruction - pick up equipment [[Y]] and display message box [[Y] + 2] ;;;
Instruction_PLM_PickUpEquipment_DisplayMessageBox:
;; Parameters:
;;     Y: Pointer to instruction arguments
;; Returns:
;;     Y: Pointer to next instruction
    LDA.W EquippedItems : ORA.W $0000,Y : STA.W EquippedItems
    LDA.W CollectedItems : ORA.W $0000,Y : STA.W CollectedItems
    LDA.W #$0168
    JSL Play_Room_Music_Track_After_A_Frames
    LDA.W $0002,Y : AND.W #$00FF
    JSL MessageBox_Routine
    INY #3
    RTS


;;; $891A: Instruction - pick up equipment [[Y]], add grapple to HUD and display grapple message box ;;;
Inst_PLM_PickUpEquipment_AddGrappleHUD_DisplayMessageBox:
;; Parameters:
;;     Y: Pointer to instruction arguments
;; Returns:
;;     Y: Pointer to next instruction
    LDA.W EquippedItems : ORA.W $0000,Y : STA.W EquippedItems
    LDA.W CollectedItems : ORA.W $0000,Y : STA.W CollectedItems
    JSL AddGrappleToHUDTilemap
    LDA.W #$0168
    JSL Play_Room_Music_Track_After_A_Frames
    LDA.W #$0005
    JSL MessageBox_Routine
    INY #2
    RTS


;;; $8941: Instruction - pick up equipment [[Y]], add x-ray to HUD and display x-ray message box ;;;
Inst_PLM_PickUpEquipment_AddXrayToHUD_DisplayMessageBox:
;; Parameters:
;;     Y: Pointer to instruction arguments
;; Returns:
;;     Y: Pointer to next instruction
    LDA.W EquippedItems : ORA.W $0000,Y : STA.W EquippedItems
    LDA.W CollectedItems : ORA.W $0000,Y : STA.W CollectedItems
    JSL AddXrayToHUDTilemap
    LDA.W #$0168
    JSL Play_Room_Music_Track_After_A_Frames
    LDA.W #$0006
    JSL MessageBox_Routine
    INY #2
    RTS


;;; $8968: Instruction - collect [[Y]] health energy tank ;;;
Instruction_PLM_CollectHealth_EnergyTank:
;; Parameters:
;;     Y: Pointer to instruction arguments
;; Returns:
;;     Y: Pointer to next instruction
    LDA.W MaxEnergy : CLC : ADC.W $0000,Y : STA.W MaxEnergy : STA.W Energy
    LDA.W #$0168
    JSL Play_Room_Music_Track_After_A_Frames
    LDA.W #$0001
    JSL MessageBox_Routine
    INY #2
    RTS


;;; $8986: Instruction - collect [[Y]] health reserve tank ;;;
Instruction_PLM_CollectHealth_ReserveTank:
;; Parameters:
;;     Y: Pointer to instruction arguments
;; Returns:
;;     Y: Pointer to next instruction
    LDA.W MaxReserveEnergy : CLC : ADC.W $0000,Y : STA.W MaxReserveEnergy
    LDA.W ReserveTankMode : BNE .playMusic
    INC.W ReserveTankMode

  .playMusic:
    LDA.W #$0168
    JSL Play_Room_Music_Track_After_A_Frames
    LDA.W #$0019
    JSL MessageBox_Routine
    INY #2
    RTS


;;; $89A9: Instruction - collect [[Y]] ammo missile tank ;;;
Instruction_PLM_CollectAmmo_MissileTank:
;; Parameters:
;;     Y: Pointer to instruction arguments
;; Returns:
;;     Y: Pointer to next instruction
    LDA.W MaxMissiles : CLC : ADC.W $0000,Y : STA.W MaxMissiles
    LDA.W Missiles : CLC : ADC.W $0000,Y : STA.W Missiles
    JSL AddMissilesToHUDTilemap
    LDA.W #$0168
    JSL Play_Room_Music_Track_After_A_Frames
    LDA.W #$0002
    JSL MessageBox_Routine
    INY #2
    RTS


;;; $89D2: Instruction - collect [[Y]] ammo super missile tank ;;;
Instruction_PLM_CollectAmmo_SuperMissileTank:
;; Parameters:
;;     Y: Pointer to instruction arguments
;; Returns:
;;     Y: Pointer to next instruction
    LDA.W MaxSuperMissiles : CLC : ADC.W $0000,Y : STA.W MaxSuperMissiles
    LDA.W SuperMissiles : CLC : ADC.W $0000,Y : STA.W SuperMissiles
    JSL AddSuperMissilesToHUDTilemap
    LDA.W #$0168
    JSL Play_Room_Music_Track_After_A_Frames
    LDA.W #$0003
    JSL MessageBox_Routine
    INY #2
    RTS


;;; $89FB: Instruction - collect [[Y]] ammo power bomb tank ;;;
Instruction_PLM_CollectAmmo_PowerBombTank:
;; Parameters:
;;     Y: Pointer to instruction arguments
;; Returns:
;;     Y: Pointer to next instruction
    LDA.W MaxPowerBombs : CLC : ADC.W $0000,Y : STA.W MaxPowerBombs
    LDA.W PowerBombs : CLC : ADC.W $0000,Y : STA.W PowerBombs
    JSL AddPowerBombsToHUDTilemap
    LDA.W #$0168
    JSL Play_Room_Music_Track_After_A_Frames
    LDA.W #$0004
    JSL MessageBox_Routine
    INY #2
    RTS


;;; $8A24: Instruction - link instruction = [[Y]] ;;;
Instruction_PLM_LinkInstruction_Y:
;; Parameters:
;;     X: PLM index
;;     Y: Pointer to instruction arguments
;; Returns:
;;     Y: Pointer to next instruction
    LDA.W $0000,Y : STA.L PLMExtra_LinkInstructions,X
    INY #2
    RTS


;;; $8A2E: Instruction - call [[Y]] ;;;
Instruction_PLM_Call_Y:
;; Parameters:
;;     X: PLM index
;;     Y: Pointer to instruction arguments
;; Returns:
;;     Y: Pointer to next instruction
    TYA : INC #2 : STA.L PLMExtra_LinkInstructions,X
    LDA.W $0000,Y : TAY
    RTS


;;; $8A3A: Instruction - return ;;;
Instruction_PLM_Return:
;; Parameters:
;;     X: PLM index
;; Returns:
;;     Y: Pointer to next instruction
    LDA.L PLMExtra_LinkInstructions,X : TAY
    RTS


if !FEATURE_KEEP_UNREFERENCED
;;; $8A40: Unused. Instruction - wait until enemy 0 is dead ;;;
UNUSED_Instruction_PLM_WaitUntil_Enemy0_IsDead_848A40:
;; Parameters:
;;     X: PLM index
    LDA.W Enemy.properties : AND.W #$0200 : BNE .return
    LDA.W Enemy.ID : CMP.W #EnemyHeaders_Respawn : BEQ .return
    PLA
    LDA.W #$0001 : STA.L PLMExtra_InstructionTimers,X

  .return:
    RTS


;;; $8A59: Unused. Instruction - wait until enemy 1 is dead ;;;
UNUSED_Instruction_PLM_WaitUntil_Enemy0_IsDead_848A59:
;; Parameters:
;;     X: PLM index
    LDA.W Enemy[1].properties : AND.W #$0200 : BNE .return
    LDA.W Enemy[1].ID : CMP.W #EnemyHeaders_Respawn : BEQ .return
    PLA
    LDA.W #$0001 : STA.L PLMExtra_InstructionTimers,X

  .return:
    RTS
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $8A72: Instruction - go to [[Y]] if the room argument door is set ;;;
Instruction_PLM_GotoY_ifRoomArg_DoorIsSet:
;; Parameters:
;;     X: PLM index
;;     Y: Pointer to instruction arguments
;; Returns:
;;     Y: Pointer to next instruction

; Negative room argument => door is not set
    PHX
    LDA.W PLM_RoomArgs,X : BMI .pullX
    JSL BitIndexToByteIndexAndBitmask
    LDA.L SRAMMirror_Doors,X
    PLX
    AND.W Bitmask : BEQ .return
    LDA.W $0000,Y : TAY
    RTS

  .return:
    INY #2
    RTS

  .pullX:
    PLX
    BRA .return


;;; $8A91: Instruction - increment door hit counter; set room argument door and go to [[Y] + 1] if [door hit counter] >= [[Y]] ;;;
Instruction_PLM_IncDoorHit_SetRoomArgDoor_GotoY:
;; Parameters:
;;     X: PLM index
;;     Y: Pointer to instruction arguments
;; Returns:
;;     Y: Pointer to next instruction
    LDA.L PLMExtra_Vars,X : INC : STA.L PLMExtra_Vars,X
    SEP #$20
    CMP.W $0000,Y
    REP #$20
    BCS .carrySet
    INY #3

  .return:
    RTS

  .carrySet:
    PHX
    LDA.W PLM_RoomArgs,X : BMI .setMSB
    JSL BitIndexToByteIndexAndBitmask
    LDA.L SRAMMirror_Doors,X : ORA.W Bitmask : STA.L SRAMMirror_Doors,X

  .setMSB:
    PLX
    ORA.W #$8000 : STA.W PLM_RoomArgs,X
    LDA.W #.return : STA.W PLM_PreInstructions,X
    INY
    JMP Instruction_PLM_GotoY


;;; $8ACD: Instruction - increment room argument; room argument = FFFFh and go to [[Y] + 1] if [room argument] >= [[Y]] ;;;
Instruction_PLM_IncRoomArg_RoomArgFFFF_GotoY:
;; Parameters:
;;     X: PLM index
;;     Y: Pointer to instruction arguments
;; Returns:
;;     Y: Pointer to next instruction

; Used by Draygon turrets
    SEP #$20
    LDA.W PLM_RoomArgs,X : INC : CMP.W $0000,Y
    REP #$20
    BCS .FFFF
    STA.W PLM_RoomArgs,X
    INY #3

  .return:
    RTS

  .FFFF:
    LDA.W #$FFFF : STA.W PLM_RoomArgs,X
    LDA.W #.return : STA.W PLM_PreInstructions,X
    INY
    JMP Instruction_PLM_GotoY


;;; $8AF1: Instruction - PLM BTS = [[Y]] ;;;
Instruction_PLM_PLMBTS_Y:
;; Parameters:
;;     X: PLM index
;;     Y: Pointer to instruction arguments
;; Returns:
;;     Y: Pointer to next instruction
    PHX
    LDA.W PLM_BlockIndices,X : LSR : TAX
    SEP #$20
    LDA.W $0000,Y : STA.L BTS,X
    REP #$20
    PLX
    INY
    RTS


;;; $8B05: Instruction - draw PLM block ;;;
Instruction_PLM_DrawPLMBlock_Clone:
;; Parameters:
;;     X: PLM index

; Clone of Instruction_PLM_DrawPLMBlock
    REP #$20
    PHX : PHY
    TXY
    LDX.W PLM_BlockIndices,Y
    LDA.W PLM_Vars,Y : STA.L LevelData,X
    JMP Instruction_PLM_DrawPLMBlock_Common


;;; $8B17: Instruction - draw PLM block ;;;
Instruction_PLM_DrawPLMBlock:
;; Parameters:
;;     X: PLM index
;;     Y: Pointer to after this instruction

; This works by creating a draw instruction in RAM and calling the PLM handler's drawing routine manually
    REP #$20
    PHX : PHY
    TXY
    LDX.W PLM_BlockIndices,Y
    LDA.W PLM_Vars,Y : STA.L LevelData,X
; fallthrough to Instruction_PLM_DrawPLMBlock_Common


Instruction_PLM_DrawPLMBlock_Common:
    STA.W CustomDrawInst_PLMBlock
    LDA.W #$0001 : STA.W CustomDrawInst_NumberOfBlocks
    STZ.W CustomDrawInst_Terminator
    PLY : PLX
    LDA.W #$0001 : STA.L PLMExtra_InstructionTimers,X
    LDA.W #CustomDrawInst_NumberOfBlocks : STA.L PLMExtra_DrawInstructionPointers,X
    TYA : STA.W PLM_InstListPointers,X
    JSR Process_PLM_Draw_Instruction
    LDX.W PLM_Index
    JSL Calculate_PLM_Block_Coordinates
    JSR DrawPLM_HardCoded
    PLA
    RTS


;;; $8B55: Instruction - process air scroll update ;;;
Instruction_PLM_ProcessAirScrollUpdate:
;; Parameters:
;;     X: PLM index
    PHB : PHX : PHY
    STZ.W PLM_Vars,X
    LDY.W PLM_RoomArgs,X
    PEA $8F00 : PLB : PLB
    LDA.W #$0000
    SEP #$20

  .loop:
    LDA.W $0000,Y : BMI .specialAir
    TAX
    LDA.W $0001,Y : STA.L Scrolls,X
    INY #2
    BRA .loop

  .specialAir:
    REP #$20
    PLY : PLX : PLB
    PHX
    LDA.W PLM_BlockIndices,X : TAX
    LDA.L LevelData,X : AND.W #$0FFF : ORA.W #$3000 : STA.L LevelData,X
    PLX
    RTS


;;; $8B93: Instruction - process solid scroll update ;;;
Instruction_PLM_ProcessSolidScrollUpdate:
;; Parameters:
;;     X: PLM index
    PHB : PHX : PHY
    STZ.W PLM_Vars,X
    LDY.W PLM_RoomArgs,X
    PEA $8F00 : PLB : PLB
    LDA.W #$0000
    SEP #$20

  .loop:
    LDA.W $0000,Y : BMI .specialBlock
    TAX
    LDA.W $0001,Y : STA.L Scrolls,X
    INY #2
    BRA .loop

  .specialBlock:
    REP #$20
    PLY : PLX : PLB : PHX
    LDA.W PLM_BlockIndices,X : TAX
    LDA.L LevelData,X : AND.W #$0FFF : ORA.W #$B000 : STA.L LevelData,X
    PLX
    RTS


if !FEATURE_KEEP_UNREFERENCED
;;; $8BD1: Unused. Instruction - queue music track [[Y]] ;;;
UNUSED_Instruction_PLM_QueueMusicTrack_Y_848BD1:
;; Parameters:
;;     Y: Pointer to instruction arguments
;; Returns:
;;     Y: Pointer to next instruction
    LDA.W $0000,Y : AND.W #$00FF
    JSL QueueMusicDataOrTrack_8FrameDelay
    INY
    RTS
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $8BDD: Instruction - clear music queue and queue music track [[Y]] ;;;
Instruction_PLM_ClearMusicQueue_QueueMusicTrack:
;; Parameters:
;;     Y: Pointer to instruction arguments
;; Returns:
;;     Y: Pointer to next instruction
    PHX
    LDX.W #$000E

  .loop:
    STZ.W APU_MusicQueueEntries,X : STZ.W APU_MusicQueueTimers,X
    DEX #2 : BPL .loop
    PLX
    LDA.W APU_MusicQueueNextIndex : STA.W APU_MusicQueueStartIndex
    LDA.W #$0000 : STA.W APU_MusicTimer : STA.W APU_MusicEntry
    LDA.W $0000,Y : AND.W #$00FF
    JSL QueueMusicDataOrTrack_8FrameDelay
    INY
    RTS


;;; $8C07: Instruction - queue sound [[Y]], sound library 1, max queued sounds allowed = 6 ;;;
Instruction_PLM_QueueSound_Y_Lib1_Max6:
;; Parameters:
;;     Y: Pointer to instruction arguments
;; Returns:
;;     Y: Pointer to next instruction
    LDA.W $0000,Y
    JSL QueueSound_Lib1_Max6
    INY
    RTS


;;; $8C10: Instruction - queue sound [[Y]], sound library 2, max queued sounds allowed = 6 ;;;
Instruction_PLM_QueueSound_Y_Lib2_Max6:
;; Parameters:
;;     Y: Pointer to instruction arguments
;; Returns:
;;     Y: Pointer to next instruction
    LDA.W $0000,Y
    JSL QueueSound_Lib2_Max6
    INY
    RTS


;;; $8C19: Instruction - queue sound [[Y]], sound library 3, max queued sounds allowed = 6 ;;;
Instruction_PLM_QueueSound_Y_Lib3_Max6:
;; Parameters:
;;     Y: Pointer to instruction arguments
;; Returns:
;;     Y: Pointer to next instruction
    LDA.W $0000,Y
    JSL QueueSound_Lib3_Max6
    INY
    RTS


if !FEATURE_KEEP_UNREFERENCED
;;; $8C22: Unused. Instruction - queue sound [[Y]], sound library 1, max queued sounds allowed = 15 ;;;
UNUSED_Instruction_PLM_QueueSound_Y_Lib1_Max15_848C22:
;; Parameters:
;;     Y: Pointer to instruction arguments
;; Returns:
;;     Y: Pointer to next instruction
    LDA.W $0000,Y
    JSL QueueSound
    INY
    RTS


;;; $8C2B: Unused. Instruction - queue sound [[Y]], sound library 2, max queued sounds allowed = 15 ;;;
UNUSED_Instruction_PLM_QueueSound_Y_Lib2_Max15_848C2B:
;; Parameters:
;;     Y: Pointer to instruction arguments
;; Returns:
;;     Y: Pointer to next instruction
    LDA.W $0000,Y
    JSL QueueSound_Lib2_Max15
    INY
    RTS


;;; $8C34: Unused. Instruction - queue sound [[Y]], sound library 3, max queued sounds allowed = 15 ;;;
UNUSED_Instruction_PLM_QueueSound_Y_Lib3_Max15_848C34:
;; Parameters:
;;     Y: Pointer to instruction arguments
;; Returns:
;;     Y: Pointer to next instruction
    LDA.W $0000,Y
    JSL QueueSound_Lib3_Max15
    INY
    RTS


;;; $8C3D: Unused. Instruction - queue sound [[Y]], sound library 1, max queued sounds allowed = 3 ;;;
UNUSED_Instruction_PLM_QueueSound_Y_Lib1_Max3_848C3D:
;; Parameters:
;;     Y: Pointer to instruction arguments
;; Returns:
;;     Y: Pointer to next instruction
    LDA.W $0000,Y
    JSL QueueSound_Lib1_Max3
    INY
    RTS
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $8C46: Instruction - queue sound [[Y]], sound library 2, max queued sounds allowed = 3 ;;;
Instruction_PLM_QueueSound_Y_Lib2_Max3:
;; Parameters:
;;     Y: Pointer to instruction arguments
;; Returns:
;;     Y: Pointer to next instruction
    LDA.W $0000,Y
    JSL QueueSound_Lib2_Max3
    INY
    RTS


if !FEATURE_KEEP_UNREFERENCED
;;; $8C4F: Unused. Instruction - queue sound [[Y]], sound library 3, max queued sounds allowed = 3 ;;;
UNUSED_Instruction_PLM_QueueSound_Y_Lib3_Max3_848C4F:
;; Parameters:
;;     Y: Pointer to instruction arguments
;; Returns:
;;     Y: Pointer to next instruction
    LDA.W $0000,Y
    JSL QueueSound_Lib3_Max3
    INY
    RTS


;;; $8C58: Unused. Instruction - queue sound [[Y]], sound library 1, max queued sounds allowed = 9 ;;;
UNUSED_Instruction_PLM_QueueSound_Y_Lib1_Max9_848C58:
;; Parameters:
;;     Y: Pointer to instruction arguments
;; Returns:
;;     Y: Pointer to next instruction
    LDA.W $0000,Y
    JSL QueueSound_Lib1_Max9
    INY
    RTS


;;; $8C61: Unused. Instruction - queue sound [[Y]], sound library 2, max queued sounds allowed = 9 ;;;
UNUSED_Instruction_PLM_QueueSound_Y_Lib2_Max9_848C61:
;; Parameters:
;;     Y: Pointer to instruction arguments
;; Returns:
;;     Y: Pointer to next instruction
    LDA.W $0000,Y
    JSL QueueSound_Lib2_Max9
    INY
    RTS


;;; $8C6A: Unused. Instruction - queue sound [[Y]], sound library 3, max queued sounds allowed = 9 ;;;
UNUSED_Instruction_PLM_QueueSound_Y_Lib3_Max9_848C6A:
;; Parameters:
;;     Y: Pointer to instruction arguments
;; Returns:
;;     Y: Pointer to next instruction
    LDA.W $0000,Y
    JSL QueueSound_Lib3_Max9
    INY
    RTS


;;; $8C73: Unused. Instruction - queue sound [[Y]], sound library 1, max queued sounds allowed = 1 ;;;
UNUSED_Instruction_PLM_QueueSound_Y_Lib1_Max1_848C73:
;; Parameters:
;;     Y: Pointer to instruction arguments
;; Returns:
;;     Y: Pointer to next instruction
    LDA.W $0000,Y
    JSL QueueSound_Lib1_Max1
    INY
    RTS
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $8C7C: Instruction - queue sound [[Y]], sound library 2, max queued sounds allowed = 1 ;;;
Instruction_PLM_QueueSound_Y_Lib2_Max1:
;; Parameters:
;;     Y: Pointer to instruction arguments
;; Returns:
;;     Y: Pointer to next instruction
    LDA.W $0000,Y
    JSL QueueSound_Lib2_Max1
    INY
    RTS


if !FEATURE_KEEP_UNREFERENCED
;;; $8C85: Unused. Instruction - queue sound [[Y]], sound library 3, max queued sounds allow = 1 ;;;
UNUSED_Instruction_PLM_QueueSound_Y_Lib3_Max1_848C85:
;; Parameters:
;;     Y: Pointer to instruction arguments
;; Returns:
;;     Y: Pointer to next instruction
    LDA.W $0000,Y
    JSL QueueSound_Lib3_Max1
    INY
    RTS
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $8C8E: RTS ;;;
RTS_848C8E:
    RTS


;;; $8C8F: Instruction - activate map station ;;;
Instruction_PLM_Activate_MapStation:
    PHX : PHY
    LDX.W AreaIndex
    LDA.L SRAMMirror_MapStations,X : ORA.W #$00FF : STA.L SRAMMirror_MapStations,X
    LDA.W #$0014
    JSL MessageBox_Routine
    LDA.W #$0001 : STA.W CurrentAreaMapCollectedFlag
    PLY : PLX
    RTS


;;; $8CAF: Instruction - activate energy station ;;;
Instruction_PLM_Activate_EnergyStation:
    PHX : PHY
    LDA.W MaxEnergy : CMP.W Energy : BEQ .unlockSamus
    LDA.W #$0015
    JSL MessageBox_Routine
    LDA.W MaxEnergy : STA.W Energy

  .unlockSamus:
    LDA.W #$0001
    JSL Run_Samus_Command
    PLY : PLX
    RTS


;;; $8CD0: Instruction - activate missile station ;;;
Instruction_PLM_Activate_MissileStation:
    PHX : PHY
    LDA.W MaxMissiles : CMP.W Missiles : BEQ .unlockSamus
    LDA.W #$0016
    JSL MessageBox_Routine
    LDA.W MaxMissiles : STA.W Missiles

  .unlockSamus:
    LDA.W #$0001
    JSL Run_Samus_Command
    PLY : PLX
    RTS


;;; $8CF1: Instruction - go to [[Y]] if [save confirmation selection] = no, otherwise activate save station ;;;
Instruction_PLM_GotoY_or_ActivateSaveStation:
;; Parameters:
;;     Y: Pointer to instruction arguments
;; Returns:
;;     Y: Pointer to next instruction
    PHX : PHY
    LDA.W #$0017
    JSL MessageBox_Routine
    CMP.W #$0002 : BEQ .gotoY
    LDX.W PLM_Index
    LDY.W #EnemyProjectile_SaveStationElectricity
    JSL SpawnEnemyProjectileY_ParameterA_RoomGraphics
    LDA.W PLM_RoomArgs,X : AND.W #$0007 : STA.W LoadStationIndex
    JSL BitIndexToByteIndexAndBitmask
    LDA.W AreaIndex : ASL : TAX
    LDA.L SRAMMirror_UsedSaveStationsElevators,X : ORA.W Bitmask : STA.L SRAMMirror_UsedSaveStationsElevators,X
    LDA.W SaveSlotSelected
    JSL SaveToSRAM
    PLY : PLX
    INY #2
    RTS

  .gotoY:
    PLY : PLX
    LDA.W $0000,Y : TAY
    RTS


if !FEATURE_KEEP_UNREFERENCED
;;; $8D39: Unused. Instruction - resume music in 6 seconds ;;;
UNUSED_Instruction_PLM_ResumeMusicIn6Seconds_848D39:
    LDA.W #$0168
    JSL Play_Room_Music_Track_After_A_Frames
    RTS
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $8D41: Instruction - go to [[Y] + 2] if Samus is within [[Y]] columns and [[Y] + 1] rows of PLM ;;;
Instruction_PLM_GotoY_ifSamusIsWithin_YColumnsRowsOfPLM:
;; Parameters:
;;     X: PLM index
;;     Y: Pointer to instruction arguments
;; Returns:
;;     Y: Pointer to next instruction
    JSL Calculate_PLM_Block_Coordinates
    LDA.W SamusXPosition : LSR #4 : SEC : SBC.W PLM_XBlock : BPL +
    EOR.W #$FFFF : INC

+   SEP #$20
    CMP.W $0000,Y
    REP #$20
    BEQ +
    BCS .tooFar

+   LDA.W SamusYPosition : LSR #4 : SEC : SBC.W PLM_YBlock : BPL +
    EOR.W #$FFFF : INC

+   SEP #$20
    CMP.W $0001,Y
    REP #$20
    BEQ .gotoY
    BCS .tooFar

  .gotoY:
    LDA.W $0002,Y : TAY
    RTS

  .tooFar:
    TYA : CLC : ADC.W #$0004 : TAY
    RTS


if !FEATURE_KEEP_UNREFERENCED
;;; $8D89: Unused. Instruction - move PLM down one block ;;;
UNUSED_Instruction_PLM_MovePLMDown1Block_848D89:
;; Parameters:
;;     X: PLM index
    LDA.W PLM_BlockIndices,X : CLC : ADC.W RoomWidthBlocks : ADC.W RoomWidthBlocks : STA.W PLM_BlockIndices,X
    RTS
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $8D97: RTS ;;;
RTS_848D97:
    RTS


if !FEATURE_KEEP_UNREFERENCED
;;; $8D98: Unused. Default PLM instruction list ;;;
UNUSED_InstList_PLM_DefaultPLM_848D98:
    dw $1000,InstList_PLM_DefaultPLMDrawInstruction
    dw Instruction_PLM_GotoY
    dw UNUSED_InstList_PLM_DefaultPLM_848D98
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $8DA0: Default PLM draw instruction ;;;
InstList_PLM_DefaultPLMDrawInstruction:
; Note that this is an invalid draw instruction
; Used by instruction list $8D98: Unused. Default PLM instruction list
    dw $0180,$0000
    dw $0000

if !FEATURE_KEEP_UNREFERENCED
;;; $8DA6: Unused. Draw PLM with custom draw instruction pointer and tilemap base addresses ;;;
UNUSED_DrawPLM_Custom_DrawInstPointer_TilemapBaseAddr_848DA6:
    JSR DrawPLM
    RTL
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $8DAA: Draw PLM ;;;
DrawPLM_HardCoded:
;; Parameter:
;;     X: PLM index

; Devs opted to pre-subtract 20h when setting $0C, rather than take ANDing [$18] with Fh before summing at $8E8C
    REP #$30
    LDA.W #$5000 : STA.B DP_Temp09
    LDA.W #$53E0 : STA.B DP_Temp0C
    LDA.L PLMExtra_DrawInstructionPointers,X : TAY
; fallthrough to DrawPLM


DrawPLM:
    LDA.W PLM_XBlock : STA.B DP_Temp1E
    LDA.W PLM_YBlock : STA.B DP_Temp20

  .loopDrawEntry:
    LDA.W Layer1YPosition : LSR #4 : STA.B DP_Temp1A
    CLC : ADC.W #$000F : CMP.B DP_Temp20 : BPL +
    RTS

+   LDA.W $0000,Y : BPL .horizontal
    JMP .vertical

  .horizontal:
    AND.W #$7FFF : STA.B DP_Temp14
    STZ.B DP_Temp1C
    LDA.B DP_Temp20 : CMP.B DP_Temp1A : BMI .return8E2F
    STA.B DP_Temp1A
    STZ.B DP_Temp12
    LDA.B DP_Temp1E : STA.B DP_Temp18
    LDA.W Layer1XPosition : CLC : ADC.W #$000F : LSR #4 : DEC : STA.B DP_Temp16
    SEC : SBC.B DP_Temp1E : BMI +
    BEQ +
    STA.B DP_Temp12
    LDA.B DP_Temp14 : CLC : ADC.B DP_Temp1E : CMP.B DP_Temp16 : BEQ .return8E2F
    BMI .return8E2F
    LDA.B DP_Temp14 ; >_<
    LDA.B DP_Temp14 : SEC : SBC.B DP_Temp12 : STA.B DP_Temp14
    LDA.B DP_Temp16 : STA.B DP_Temp18

+   LDA.B DP_Temp16 : CLC : ADC.W #$0011 : STA.B DP_Temp16
    CMP.B DP_Temp1E : BPL +

  .return8E2F:
    RTS

+   LDA.B DP_Temp18 : CLC : ADC.B DP_Temp14
    DEC : SEC : SBC.B DP_Temp16 : STA.B DP_Temp16 : BMI +
    LDA.B DP_Temp14 : SEC : SBC.B DP_Temp16 : STA.B DP_Temp14 : BEQ .return8E2F

+   PHX
    LDX.W VRAMWriteStack : CPX.W #$01E0 : BMI +

  .pullXreturn:
    PLX

  .return8E50:
    RTS

+   LDA.W #$0200 : SEC : SBC.W PLM_DrawTilemapIndex
    LSR #3 : CMP.B DP_Temp14 : BMI .pullXreturn
    LDA.B DP_Temp1A : AND.W #$000F : ORA.W #$4000 : STA.W $4202
    LDA.B DP_Temp18 : AND.W #$001F : CMP.W #$0010 : BCS .greaterThan10h
    ASL : CLC : ADC.B DP_Temp09 : ADC.W $4216 : PHA
    LDA.W BG1XOffset : AND.W #$0100 : BEQ +
    PLA : CLC : ADC.W #$0400 : PHA
    BRA +

  .greaterThan10h:
    ASL : CLC : ADC.B DP_Temp0C : ADC.W $4216 : PHA
    LDA.W BG1XOffset : AND.W #$0100 : BEQ +
    PLA : SEC : SBC.W #$0400 : PHA

+   LDA.B DP_Temp14 : ASL : STA.B DP_Temp1E
    PLA : PHA
    AND.W #$001F : STA.B DP_Temp22
    CLC : ADC.B DP_Temp1E
    DEC : AND.W #$FFE0 : BNE +
    JMP .horizOneScreen

+   CPX.W #$00E4 : BPL .return8F2C
    LDA.W #$0020 : SEC : SBC.B DP_Temp22 : BMI .return8F2C
    ASL : STA.B VRAMWrite.size,X : STA.B VRAMWrite[2].size,X
    PLA : STA.B VRAMWrite.dest,X
    AND.W #$FFE0 : EOR.W #$0400 : STA.B VRAMWrite[1].dest,X
    LDA.B VRAMWrite[1].dest,X : CLC : ADC.W #$0020 : STA.B VRAMWrite[3].dest,X ; >.< LDA
    LDA.B VRAMWrite.dest,X : CLC : ADC.W #$0020 : STA.B VRAMWrite[2].dest,X
    LDA.B DP_Temp14 : ASL #2 : STA.B DP_Temp1E
    SEC : SBC.B VRAMWrite.size,X : STA.B VRAMWrite[1].size,X : STA.B VRAMWrite[3].size,X
    LDA.W #PLMDrawTilemap : CLC : ADC.W PLM_DrawTilemapIndex : STA.B VRAMWrite.src,X : STA.B DP_Temp00
    CLC : ADC.B VRAMWrite.size,X : STA.B VRAMWrite[1].src,X
    CLC : ADC.B VRAMWrite[1].size,X : STA.B VRAMWrite[2].src,X : STA.B DP_Temp06
    CLC : ADC.B VRAMWrite[2].size,X : STA.B VRAMWrite[3].src,X
    SEP #$20
    LDA.B #$7E : STA.B VRAMWrite.src+2,X
    STA.B DP_Temp02 : STA.B VRAMWrite[1].src+2,X
    STA.B DP_Temp08
    STA.B VRAMWrite[2].src+2,X : STA.B VRAMWrite[3].src+2,X
    REP #$20
    TXA : CLC : ADC.W #$001C : STA.W VRAMWriteStack
    BRA .horizAddToVRAMWriteTableEnd

  .return8F2C:
    PLA : PLX
    RTS

  .horizOneScreen:
    PLA
    JSR PartiallySetupVRAMWriteTableEntries_SingleScrnPLMDrawTilemap
    LDA.B VRAMWrite.dest,X : CLC : ADC.W #$0020 : STA.B VRAMWrite[1].dest,X
    TXA : CLC : ADC.W #$000E : STA.W VRAMWriteStack

  .horizAddToVRAMWriteTableEnd:
    LDA.B DP_Temp12 : ASL : STA.B DP_Temp12
    INY #2
    TYA : CLC : ADC.B DP_Temp12 : STA.B DP_Temp03
    LDY.W #$0000

  .loopHorizBlock:
    LDA.B (DP_Temp03) : STA.B DP_Temp1E
    AND.W #$03FF : ASL #3 : TAX
    LDA.B DP_Temp1E : AND.W #$0C00 : BNE .horizCopyBlockWithFlip
    LDA.L TileTable_topLeft,X : STA.B [DP_Temp00],Y
    LDA.L TileTable_bottomLeft,X : STA.B [DP_Temp06],Y
    INY #2
    LDA.L TileTable_topRight,X : STA.B [DP_Temp00],Y
    LDA.L TileTable_bottomRight,X : STA.B [DP_Temp06],Y
    BRA .horizNextBlock

  .horizCopyBlockWithFlip:
    CMP.W #$0400 : BNE .horizCopyBlockWithVertFlip
    LDA.L TileTable_topRight,X : EOR.W #$4000 : STA.B [DP_Temp00],Y
    LDA.L TileTable_bottomRight,X : EOR.W #$4000 : STA.B [DP_Temp06],Y
    INY #2
    LDA.L TileTable_topLeft,X : EOR.W #$4000 : STA.B [DP_Temp00],Y
    LDA.L TileTable_bottomLeft,X : EOR.W #$4000 : STA.B [DP_Temp06],Y

  .horizNextBlock:
    INY #2
    INC.B DP_Temp03 : INC.B DP_Temp03
    LDA.W PLM_DrawTilemapIndex : CLC : ADC.W #$0008 : STA.W PLM_DrawTilemapIndex
    CMP.W #$0200 : BPL .return8FC8
    DEC.B DP_Temp14 : BNE .loopHorizBlock
    JMP .nextDrawEntry

  .return8FC8:
    PLX
    RTS

  .horizCopyBlockWithVertFlip:
    CMP.W #$0800 : BNE .horizCopyBlockWithBothFlips
    LDA.L TileTable_bottomLeft,X : EOR.W #$8000 : STA.B [DP_Temp00],Y
    LDA.L TileTable_topLeft,X : EOR.W #$8000 : STA.B [DP_Temp06],Y
    INY #2
    LDA.L TileTable_bottomRight,X : EOR.W #$8000 : STA.B [DP_Temp00],Y
    LDA.L TileTable_topRight,X : EOR.W #$8000 : STA.B [DP_Temp06],Y
    BRA .horizNextBlock

  .horizCopyBlockWithBothFlips:
    LDA.L TileTable_bottomRight,X : EOR.W #$C000 : STA.B [DP_Temp00],Y
    LDA.L TileTable_topRight,X : EOR.W #$C000 : STA.B [DP_Temp06],Y
    INY #2
    LDA.L TileTable_bottomLeft,X : EOR.W #$C000 : STA.B [DP_Temp00],Y
    LDA.L TileTable_topLeft,X : EOR.W #$C000 : STA.B [DP_Temp06],Y
    BRA .horizNextBlock

  .vertical:
    AND.W #$7FFF : STA.B DP_Temp14
    LDA.W Layer1XPosition : LSR #4 : CMP.B DP_Temp1E : BEQ +
    BPL .return903B

+   CLC : ADC.W #$0011 : CMP.B DP_Temp1E : BEQ .return903B
    BPL +

  .return903B:
    RTS

+   LDA.B DP_Temp1E : STA.B DP_Temp18
    STZ.B DP_Temp12
    LDA.B DP_Temp1A : CLC : ADC.W #$0010 : STA.B DP_Temp16
    LDA.B DP_Temp1A : SEC : SBC.B DP_Temp20 : BMI .drawBlockGreaterThanScreenBlock
    STA.B DP_Temp12
    LDA.B DP_Temp14 : CLC : ADC.B DP_Temp20 : CMP.B DP_Temp1A : BMI .return903B
    LDA.B DP_Temp14 : SEC : SBC.B DP_Temp12 : STA.B DP_Temp14

  .crash:
    BMI .crash
    BNE +
    RTS

  .drawBlockGreaterThanScreenBlock:
    LDA.B DP_Temp20 : STA.B DP_Temp1A

+   LDA.B DP_Temp1A : CLC : ADC.B DP_Temp14
    SEC : SBC.B DP_Temp16 : STA.B DP_Temp16 : BMI +
    LDA.B DP_Temp14 : SEC : SBC.B DP_Temp16 : STA.B DP_Temp14 : BEQ .return903B
    BMI .return908C

+   PHX
    LDX.W VRAMWriteStack : CPX.W #$00F0 : BMI +

  .return908C:
    PLX
    RTS

+   LDA.W #$0200 : SEC : SBC.W PLM_DrawTilemapIndex
    LSR #3 : CMP.B DP_Temp14 : BMI .return908C
    LDA.W #$8000 : STA.B DP_Temp1C
    JSR Calculate_PLMDrawTilemap_VRAMDestination
    LDA.B VRAMWrite.dest,X : INC : STA.B VRAMWrite[1].dest,X
    TXA : CLC : ADC.W #$000E : STA.W VRAMWriteStack
    LDA.B DP_Temp12 : ASL : STA.B DP_Temp12
    INY #2
    TYA : CLC : ADC.B DP_Temp12 : STA.B DP_Temp03
    LDY.W #$0000

  .loopVertBlock:
    LDA.B (DP_Temp03) : STA.B DP_Temp1E
    AND.W #$03FF : ASL #3 : TAX
    LDA.B DP_Temp1E : AND.W #$0C00 : BNE .vertCopyBlockWithFlip
    LDA.L TileTable_topLeft,X : STA.B [DP_Temp00],Y
    LDA.L TileTable_topRight,X : STA.B [DP_Temp06],Y
    INY #2
    LDA.L TileTable_bottomLeft,X : STA.B [DP_Temp00],Y
    LDA.L TileTable_bottomRight,X : STA.B [DP_Temp06],Y
    JMP .vertNextBlock

  .vertCopyBlockWithFlip:
    CMP.W #$0400 : BNE .vertCopyBlockWithVertFlip
    LDA.L TileTable_topRight,X : EOR.W #$4000 : STA.B [DP_Temp00],Y
    LDA.L TileTable_topLeft,X : EOR.W #$4000 : STA.B [DP_Temp06],Y
    INY #2
    LDA.L TileTable_bottomRight,X
    EOR.W #$4000 : STA.B [DP_Temp00],Y : LDA.L TileTable_bottomLeft,X
    EOR.W #$4000 : STA.B [DP_Temp06],Y : BRA .vertNextBlock

  .vertCopyBlockWithVertFlip:
    CMP.W #$0800 : BNE .vertCopyBlockWithBothFlips
    LDA.L TileTable_bottomLeft,X : EOR.W #$8000 : STA.B [DP_Temp00],Y
    LDA.L TileTable_bottomRight,X : EOR.W #$8000 : STA.B [DP_Temp06],Y
    INY #2
    LDA.L TileTable_topLeft,X : EOR.W #$8000 : STA.B [DP_Temp00],Y
    LDA.L TileTable_topRight,X : EOR.W #$8000 : STA.B [DP_Temp06],Y
    BRA .vertNextBlock

  .vertCopyBlockWithBothFlips:
    LDA.L TileTable_bottomRight,X : EOR.W #$C000 : STA.B [DP_Temp00],Y
    LDA.L TileTable_bottomLeft,X : EOR.W #$C000 : STA.B [DP_Temp06],Y
    INY #2
    LDA.L TileTable_topRight,X : EOR.W #$C000 : STA.B [DP_Temp00],Y
    LDA.L TileTable_topLeft,X : EOR.W #$C000 : STA.B [DP_Temp06],Y

  .vertNextBlock:
    INY #2
    INC.B DP_Temp03 : INC.B DP_Temp03
    LDA.W PLM_DrawTilemapIndex : CLC : ADC.W #$0008 : STA.W PLM_DrawTilemapIndex
    CMP.W #$0200 : BPL .return918C
    DEC.B DP_Temp14 : BEQ .nextDrawEntry
    JMP .loopVertBlock

  .return918C:
    PLX
    RTS

  .nextDrawEntry:
    PLX
    LDY.B DP_Temp03
    LDA.B DP_Temp16 : BMI +
    ASL : CLC : ADC.B DP_Temp03 : TAY

+   LDA.W $0000,Y : BNE +
    RTS

+   AND.W #$00FF : BIT.W #$0080 : BNE +
    CLC : ADC.W PLM_XBlock : STA.B DP_Temp1E
    BRA .incY

+   ORA.W #$FF00 : CLC : ADC.W PLM_XBlock : STA.B DP_Temp1E

  .incY:
    INY
    LDA.W $0000,Y : AND.W #$00FF : BIT.W #$0080 : BNE .setHighByte
    CLC : ADC.W PLM_YBlock : STA.B DP_Temp20
    INY
    JMP .loopDrawEntry

  .setHighByte:
    ORA.W #$FF00 : CLC : ADC.W PLM_YBlock : STA.B DP_Temp20
    INY
    JMP .loopDrawEntry


;;; $91DC: Calculate PLM draw tilemap VRAM destination ;;;
Calculate_PLMDrawTilemap_VRAMDestination:
    LDA.B DP_Temp1A : AND.W #$000F : ORA.W #$4000 : STA.W $4202
    LDA.B DP_Temp18 : AND.W #$001F : CMP.W #$0010 : BCS .greaterThanF
    ASL : CLC : ADC.B DP_Temp09 : ADC.W $4216 : PHA
    LDA.W BG1XOffset : AND.W #$0100 : BEQ .fallthrough
    PLA : CLC : ADC.W #$0400 : PHA
    BRA .fallthrough

  .greaterThanF:
    ASL : CLC : ADC.B DP_Temp0C : ADC.W $4216 : PHA
    LDA.W BG1XOffset : AND.W #$0100 : BEQ .fallthrough
    PLA : SEC : SBC.W #$0400 : PHA

  .fallthrough:
    PLA


;;; $9220: Partially set up VRAM write table entries for single-screen PLM draw tilemap ;;;
PartiallySetupVRAMWriteTableEntries_SingleScrnPLMDrawTilemap:
;; Parameter:
;;     A: PLM draw tilemap VRAM destination
;;     X: VRAM write table stack pointer
    ORA.B DP_Temp1C : STA.B VRAMWrite.dest,X
    LDA.B DP_Temp14 : ASL #2 : STA.B VRAMWrite.size,X : STA.B VRAMWrite[1].size,X
    LDA.W #PLMDrawTilemap : CLC : ADC.W PLM_DrawTilemapIndex : STA.B VRAMWrite.src,X : STA.B DP_Temp00
    CLC : ADC.B VRAMWrite.size,X : STA.B VRAMWrite[1].src,X : STA.B DP_Temp06
    SEP #$20
    LDA.B #$7E
    STA.B VRAMWrite.src+2,X : STA.B VRAMWrite[1].src+2,X
    STA.B DP_Temp02 : STA.B DP_Temp08
    REP #$20
    RTS


if !FEATURE_KEEP_UNREFERENCED
DrawInst_UnusedBlueBrinstarFaceBlock:
; Used by instruction list $D0EC: PLM $D0F2 (unused. Blue Brinstar face-block)
    dw $0001,$817E
    dw $0000
endif ; !FEATURE_KEEP_UNREFERENCED


DrawInst_CrateriaMainStreetEscape:
; Used by instruction list $BB19: PLM $BB30 (clear Crateria mainstreet escape passage if critters escaped)
    dw $0002,$00FF,$00FF
    dw $0000


DrawInst_CrittersEscapeBlock_0:
; Used by instruction list $B9A2: PLM $B9C1 (shot/bombed/grappled reaction, shootable, BTS 4Fh. Critters escape block)
    dw $8003,$8053,$8053,$8053
    dw $0000

DrawInst_CrittersEscapeBlock_1:
; Used by instruction list $B9A2: PLM $B9C1 (shot/bombed/grappled reaction, shootable, BTS 4Fh. Critters escape block)
    dw $8003,$8054,$8054,$8054
    dw $0000

DrawInst_CrittersEscapeBlock_2:
; Used by instruction list $B9A2: PLM $B9C1 (shot/bombed/grappled reaction, shootable, BTS 4Fh. Critters escape block)
    dw $8003,$8055,$8055,$8055
    dw $0000

DrawInst_CrittersEscapeBlock_3:
; Used by instruction list $B9A2: PLM $B9C1 (shot/bombed/grappled reaction, shootable, BTS 4Fh. Critters escape block)
    dw $8003,$80FF,$80FF,$80FF
    dw $0000


DrawInst_OldTourianEscapeShaftBlocks:
; Used by instruction list $B919: PLM $B964 (make old Tourian escape shaft fake wall explode)
    dw $8003,$00FF,$00FF,$00FF
    db $01,$00
    dw $8003,$00FF,$00FF,$00FF
    dw $0000


DrawInst_CrumbleAccessToTourianElevator_0:
; Used by instruction list $AAE5: PLM $B773 (crumble access to Tourian elevator)
    dw $0004,$00FF,$00FF,$00FF,$00FF
    dw $0000

DrawInst_CrumbleAccessToTourianElevator_1:
; Used by instruction list $AAE5: PLM $B773 (crumble access to Tourian elevator)
    dw $0004,$0053,$0053,$0053,$0053
    dw $0000

DrawInst_CrumbleAccessToTourianElevator_2:
; Used by instruction list $AAE5: PLM $B773 (crumble access to Tourian elevator)
    dw $0004,$0054,$0054,$0054,$0054
    dw $0000

DrawInst_CrumbleAccessToTourianElevator_3:
; Used by instruction list $AAE5: PLM $B773 (crumble access to Tourian elevator)
    dw $0004,$0055,$0055,$0055,$0055
    dw $0000


DrawInst_ClearAccessToTourianElevator:
; Used by instruction list $AB0C: PLM $B777 (clear access to Tourian elevator)
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
; Used by instruction list $AB67: PLM $B797 (clear Botwoon wall)
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
; Used by instruction lists:
;     $AB6D: PLM $B7A3 (crumble Kraid ceiling block into background 1)
;     $AB7F: PLM $B7AB (crumble Kraid ceiling block into background 2)
;     $AB91: PLM $B7B3 (crumble Kraid ceiling block into background 3)
;     $ABA9: PLM $B7BF (crumble Kraid spike blocks)
;     $B8F0: PLM $B8F9 (Maridia elevatube)
    dw $0001,$8180
    dw $0000


DrawInst_CrumbleKraidCeiling_CrumbleKraidSpikes_0:
; Used by instruction lists:
;     $AB6D: PLM $B7A3 (crumble Kraid ceiling block into background 1)
;     $AB7F: PLM $B7AB (crumble Kraid ceiling block into background 2)
;     $AB91: PLM $B7B3 (crumble Kraid ceiling block into background 3)
;     $ABA9: PLM $B7BF (crumble Kraid spike blocks)
    dw $0001,$8181
    dw $0000

DrawInst_CrumbleKraidCeiling_CrumbleKraidSpikes_1:
; Used by instruction lists:
;     $AB6D: PLM $B7A3 (crumble Kraid ceiling block into background 1)
;     $AB7F: PLM $B7AB (crumble Kraid ceiling block into background 2)
;     $AB91: PLM $B7B3 (crumble Kraid ceiling block into background 3)
;     $ABA9: PLM $B7BF (crumble Kraid spike blocks)
    dw $0001,$0182
    dw $0000


UNUSED_DrawInst_SetKraidCeilingBlockToBackground1_849379:
; Used by instruction list $AB79: PLM $B79F (unused. Set Kraid ceiling block to background 1)
    dw $0001,$013C
    dw $0000


DrawInst_SetKraidCeilingBlockToBackground2:
; Used by instruction list $AB8B: PLM $B7A7 (set Kraid ceiling block to background 2)
    dw $0001,$0131
    dw $0000


DrawInst_SetKraidCeilingBlockToBackground3:
; Used by instruction list $AB9D: PLM $B7AF (set Kraid ceiling block to background 3)
    dw $0001,$0130
    dw $0000


if !FEATURE_KEEP_UNREFERENCED
UNUSED_DrawInst_84938B:
    dw $0001,$011C
    dw $0000
endif ; !FEATURE_KEEP_UNREFERENCED


DrawInst_CrumbleKraidSpikeBlocks_0:
; Used by instruction list $ABA9: PLM $B7BF (crumble Kraid spike blocks)
    dw $0001,$0111
    dw $0000

DrawInst_CrumbleKraidSpikeBlocks_1:
; Used by instruction list $ABA9: PLM $B7BF (crumble Kraid spike blocks)
    dw $0001,$0110
    dw $0000


DrawInst_ClearKraidCeiling:
; Used by instruction list $ABA3: PLM $B7B7 (clear Kraid ceiling)
    dw $000F,$013C,$0131,$0130,$0131,$0130,$0131,$0130
    dw $0131,$0130,$0131,$0130,$0131,$0130,$0131,$0130
    dw $0000


DrawInst_ClearKraidSpikeBlocks:
; Used by instruction list $ABDD: PLM $B7BB (clear Kraid spike blocks)
    dw $0016,$0111,$0110,$0111,$0110,$0111,$0110,$0111
    dw $0110,$0111,$0110,$0111,$0110,$0111,$0110,$0111
    dw $0110,$0111,$0110,$0111,$0110,$0111,$0110
    dw $0000


DrawInst_DrawPhantoonsDoorDuringBossFight:
; Used by instruction list $B77B: PLM $B781 (draw Phantoon's door during boss fight)
    dw $8004,$95C1,$95E1,$9DE1,$9DC1
    db $01,$00
    dw $8004,$C5C0,$D5E0,$DDE0,$DDC0
    dw $0000


DrawInst_RestorePhantoonsDoorDuringBossFight:
; Used by instruction list $B785: PLM $B78B (restore Phantoon's door after boss fight)
    dw $8004,$9440,$9460,$9C60,$9C40
    dw $0000


DrawInst_ClearSporeSpawnCeiling:
; Used by instruction list $AB21: PLM $B793 (clear Spore Spawn ceiling)
    dw $0002,$00FF,$00FF
    db $00,$01
    dw $0002,$00FF,$00FF
    dw $0000


DrawInst_CrumbleSporeSpawnCeiling_0:
; Used by instruction list $AB12: PLM $B78F (crumble Spore Spawn ceiling)
    dw $0002,$0053,$0053
    db $00,$01
    dw $0002,$0053,$0053
    dw $0000

DrawInst_CrumbleSporeSpawnCeiling_1:
; Used by instruction list $AB12: PLM $B78F (crumble Spore Spawn ceiling)
    dw $0002,$0054,$0054
    db $00,$01
    dw $0002,$0054,$0054
    dw $0000

DrawInst_CrumbleSporeSpawnCeiling_2:
; Used by instruction list $AB12: PLM $B78F (crumble Spore Spawn ceiling)
    dw $0002,$0055,$0055
    db $00,$01
    dw $0002,$0055,$0055
    dw $0000


if !FEATURE_KEEP_UNREFERENCED
UNUSED_DrawInst_849453:
; Matches the level data of a zebetite
; Used by instruction list $ABE3: PLM $B65F (unused)
    dw $8002,$00FF,$12FB
    db $00,$FE
    dw $8002,$1AFB,$00FF
    dw $0000

UNUSED_DrawInst_849463:
; Solid version of $9453
; Used by instruction list $ABE9: PLM $B663 (unused)
    dw $8002,$80FF,$82FB
    db $00,$FE
    dw $8002,$8AFB,$80FF
    dw $0000
endif ; !FEATURE_KEEP_UNREFERENCED


DrawInst_EscapeRoom1Gate_0:
; Escape gate - open
; Used by instruction lists:
;     $ABEF: PLM $B667 (unused)
;     $BB3A: Unused
;     $BB44: Door $C8CA / PLM $C8D0 (gate that closes during escape in room after Mother Brain)
    dw $8004,$80FF,$80FF,$80FF,$80FF
    dw $0000

DrawInst_EscapeRoom1Gate_1:
; Escape gate - half closed
; Used by instruction lists:
;     $BB3A: Unused
;     $BB44: Door $C8CA / PLM $C8D0 (gate that closes during escape in room after Mother Brain)
    dw $8004,$830F,$80FF,$80FF,$830F
    dw $0000

DrawInst_EscapeRoom1Gate_2:
; Escape gate - closed
; Used by instruction lists:
;     $ABEF: PLM $B667 (unused)
;     $BB34: Door $C8CA (gate that closes during escape in room after Mother Brain)
;     $BB44: Door $C8CA / PLM $C8D0 (gate that closes during escape in room after Mother Brain)
    dw $8004,$830F,$8AE8,$82E8,$830F
    dw $0000

if !FEATURE_KEEP_UNREFERENCED
UNUSED_DrawInst_849497:
; Used by instruction list $ABF9: PLM $B66B (unused. Blank air)
    dw $0001,$00FF
    dw $0000

UNUSED_DrawInst_84949D:
; Used by instruction list $ABFF: PLM $B66F (unused. Blank solid)
    dw $0001,$80FF
    dw $0000
endif ; !FEATURE_KEEP_UNREFERENCED


DrawInst_FillMotherBrainsWall:
; Used by instruction list $AC05: PLM $B673 (fill Mother Brain's wall)
    dw $8002,$8340,$830F
    db $00,$FF
    dw $8001,$8B0F
    dw $0000


DrawInst_MotherBrainsRoomEscapeDoor:
; Used by instruction list $AC0B: PLM $B677 (Mother Brain's room escape door)
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
; Used by instruction list $AC11: PLM $B67B (Mother Brain's background row 2)
    dw $000D,$1241,$1242,$12FC,$12FC,$12FC,$1243,$1244
    dw $12FC,$1245,$1642,$1241,$1241,$1246
    dw $0000

DrawInst_MotherBrainsBackgroundRow3:
; Used by instruction list $AC17: PLM $B67F (Mother Brain's background row 3)
    dw $000D,$09EF,$01B2,$01E5,$01E5,$01E6,$01E5,$01E5
    dw $01E5,$01E5,$05B2,$09EF,$09EF,$01B2
    dw $0000

DrawInst_MotherBrainsBackgroundRow4:
; Used by instruction list $AC1D: PLM $B683 (Mother Brain's background row 4)
    dw $000D,$01B1,$01D2,$01C6,$01C7,$00FF,$0206,$0207
    dw $00FF,$01A6,$09CA,$060C,$05B1,$0A09
    dw $0000

DrawInst_MotherBrainsBackgroundRow5:
; Used by instruction list $AC23: PLM $B687 (Mother Brain's background row 5)
    dw $000D,$01D1,$01F2,$01A4,$01E7,$01A4,$0226,$0227
    dw $01A5,$01A4,$020D,$0E09,$01B1,$01AB
    dw $0000

DrawInst_MotherBrainsBackgroundRow6:
; Used by instruction list $AC29: PLM $B68B (Mother Brain's background row 6)
    dw $000D,$01B1,$0212,$01C4,$01C9,$01C4,$0206,$0207
    dw $01C5,$01C4,$0628,$01AC,$01EC,$01EC
    dw $0000

DrawInst_MotherBrainsBackgroundRow7:
; Used by instruction list $AC2F: PLM $B68F (Mother Brain's background row 7)
    dw $000D,$01B1,$0A0C,$05CA,$0DC7,$01AA,$01A8,$01A8
    dw $01A8,$01A8,$0628,$01AB,$01CD,$01CD
    dw $0000

DrawInst_MotherBrainsBackgroundRow8:
; Used by instruction list $AC35: PLM $B693 (Mother Brain's background row 8)
    dw $000D,$01D1,$01D0,$05EA,$00FF,$00FF,$0206,$0207
    dw $00FF,$01A7,$0A0D,$0609,$01EB,$01D0
    dw $0000

DrawInst_MotherBrainsBackgroundRow9:
; Used by instruction list $AC3B: PLM $B697 (Mother Brain's background row 9)
    dw $000D,$01EB,$01EB,$05EA,$00FF,$00FF,$0206,$0207
    dw $00FF,$01A6,$00FF,$0A2C,$0609,$01AE
    dw $0000

DrawInst_MotherBrainsBackgroundRowA:
; Used by instruction list $AC41: PLM $B69B (Mother Brain's background row Ah)
    dw $000D,$01EC,$01AF,$05EA,$05C7,$05C6,$0206,$0207
    dw $01A8,$01A6,$01A8,$01A8,$05D2,$01AE
    dw $0000

DrawInst_MotherBrainsBackgroundRowB:
; Used by instruction list $AC47: PLM $B69F (Mother Brain's background row Bh)
    dw $000D,$01AC,$01AF,$01B2,$05E7,$01E5,$0226,$0227
    dw $01E5,$01A6,$01E6,$01E5,$05B2,$01CD
    dw $0000

DrawInst_MotherBrainsBackgroundRowC:
; Used by instruction list $AC4D: PLM $B6A3 (Mother Brain's background row Ch)
    dw $000D,$060C,$01EF,$01B2,$01E5,$01E6,$01E5,$01E5
    dw $01E6,$01E5,$01E5,$01E5,$05B2,$01EF
    dw $0000

DrawInst_MotherBrainsBackgroundRowD:
; Used by instruction list $AC53: PLM $B6A7 (Mother Brain's background row Dh)
    dw $000D,$1248,$1249,$124A,$124B,$1339,$124C,$124D
    dw $1339,$124E,$1339,$1339,$124F,$1249
    dw $0000


if !FEATURE_KEEP_UNREFERENCED
UNUSED_DrawInst_94966D:
; Used by instruction list $AC59: PLM $B6AB (unused. Mother Brain's background row Eh)
    dw $000D,$8319,$8319,$8319,$8319,$8319,$8319,$8319
    dw $8319,$8319,$8319,$8319,$8319,$8319
    dw $0000

UNUSED_DrawInst_94968B:
; Used by instruction list $AC5F: PLM $B6AF (unused. Mother Brain's background row Fh)
    dw $000D,$8044,$8044,$8044,$8044,$8044,$8044,$8044
    dw $8044,$8044,$8044,$8044,$8044,$8044
    dw $0000
endif ; !FEATURE_KEEP_UNREFERENCED


DrawInst_ClearCeilingBlockInMotherBrainsRoom:
; Used by instruction list $AC65: PLM $B6B3 (clear ceiling block in Mother Brain's room)
    dw $8002,$12FC,$00FF
    dw $0000

DrawInst_ClearCeilingTubeInMotherBrainsRoom:
; Used by instruction list $AC6B: PLM $B6B7 (clear ceiling tube in Mother Brain's room)
    dw $8005,$12FC,$00FF,$00FF,$00FF,$00FF
    dw $0000

DrawInst_ClearMotherBrainsBottomMiddleSideTube:
; Used by instruction list $AC71: PLM $B6BB (clear Mother Brain's bottom-middle-side tube)
    dw $8004,$00FF,$00FF,$00FF,$1339
    dw $0000

DrawInst_ClearMotherBrainsBottomMiddleTubes:
; Used by instruction list $AC77: PLM $B6BF (clear Mother Brain's bottom-middle tubes)
    dw $8007,$00FF,$00FF,$00FF,$00FF,$00FF,$00FF,$1339
    db $01,$00
    dw $8007,$00FF,$00FF,$00FF,$00FF,$00FF,$00FF,$1339
    dw $0000

DrawInst_ClearMotherBrainsBottomLeftTube:
; Used by instruction list $AC7D: PLM $B6C3 (clear Mother Brain's bottom-left tube)
    dw $8005,$00FF,$00FF,$00FF,$00FF,$1339
    db $01,$00
    dw $0001,$00FF
    dw $0000

DrawInst_ClearMotherBrainsBottomRightTube:
; Used by instruction list $AC83: PLM $B6C7 (clear Mother Brain's bottom-right tube)
    dw $8005,$00FF,$00FF,$00FF,$00FF,$1339
    db $FF,$00
    dw $0001,$00FF
    dw $0000


DrawInst_MotherBrainsGlass_0:
; Used by instruction list $D202: PLM $D6DE (Mother Brain's glass)
    dw $0001,$C6C0
    dw $0000

DrawInst_MotherBrainsGlass_1:
; Used by instruction list $D202: PLM $D6DE (Mother Brain's glass)
    dw $8004,$C2C7,$D2C9,$DAC9,$5AC7
    db $FF,$01
    dw $8002,$D2C8,$DAC8
    dw $0000

DrawInst_MotherBrainsGlass_2:
; Used by instruction list $D202: PLM $D6DE (Mother Brain's glass)
    dw $8004,$C2C7,$D2CB,$DACB,$5AC7
    db $FF,$01
    dw $8002,$D2CA,$DACA
    dw $0000

DrawInst_MotherBrainsGlass_3:
; Used by instruction list $D202: PLM $D6DE (Mother Brain's glass)
    dw $8003,$C2C7,$02CC,$0ACC
    dw $0000

DrawInst_MotherBrainsGlass_4:
; Used by instruction list $D202: PLM $D6DE (Mother Brain's glass)
    dw $0001,$C2C7
    db $FD,$00
    dw $8004,$82CD,$86C9,$8EC9,$8ACD
    db $FE,$01
    dw $8002,$86C8,$8EC8
    dw $0000

DrawInst_MotherBrainsGlass_5:
; Used by instruction list $D202: PLM $D6DE (Mother Brain's glass)
    dw $0001,$C2C7
    db $FD,$01
    dw $8003,$86CB,$8ECB,$8ACD
    db $FE,$01
    dw $8002,$86CA,$8ECA
    dw $0000

DrawInst_MotherBrainsGlass_6:
; Used by instruction list $D202: PLM $D6DE (Mother Brain's glass)
    dw $0001,$C2C7
    db $FD,$01
    dw $8002,$06CC,$0ECC
    dw $0000

DrawInst_MotherBrainsGlass_7:
; Used by instruction list $D202: PLM $D6DE (Mother Brain's glass)
    dw $8004,$C2CE,$02CF,$0ACF,$5ACE
    db $FD,$00
    dw $8004,$86CE,$06CF,$0ECF,$8ECE
    db $FE,$01
    dw $8002,$D6D0,$DED0
    db $FF,$01
    dw $8002,$D2D0,$DAD0
    dw $0000

DrawInst_MotherBrainsGlass_8:
; Used by instruction list $D202: PLM $D6DE (Mother Brain's glass)
    dw $8004,$C2CE,$00FF,$00FF,$5ACE
    db $FD,$00
    dw $8004,$86CE,$00FF,$00FF,$8ECE
    db $FE,$00
    dw $8004,$52C2,$D2C3,$DAC3,$D2C4
    db $FF,$00
    dw $8004,$56C2,$D6C3,$DEC3,$D6C4
    dw $0000

DrawInst_MotherBrainsGlass_9:
; Used by instruction lists:
;     $D202: PLM $D6DE (Mother Brain's glass)
;     $D2F3: PLM $D6E6 (unused. Mother Brain's glass, no glass state)
    dw $8004,$00FF,$00FF,$00FF,$00FF
    db $FD,$00
    dw $8004,$00FF,$00FF,$00FF,$00FF
    db $FE,$00
    dw $8004,$02D2,$02D3,$0AD3,$02D4
    db $FF,$00
    dw $8004,$06D2,$06D3,$0ED3,$06D4
    dw $0000


UNUSED_DrawInst_849817:
; Used by instruction list $D2ED: PLM $D6E2 (unused. Mother Brain's glass, area boss dead state)
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
; Used by instruction list $D368: PLM $D6EA (Bomb Torizo's crumbling chozo)
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
; Used by instruction list $D368: PLM $D6EA (Bomb Torizo's crumbling chozo)
    dw $0002,$00FF,$00FF,$00FE,$0002,$00FF,$00FF,$01FE
    dw $0004,$00FF,$00FF,$00FF,$00FF,$FEFE,$0004,$00FF
    dw $00FF,$00FF,$00FF,$FFFE,$0004,$00FF,$00FF,$00FF
    dw $00FF
    dw $0000


DrawInst_NoobTube_0:
; Used by instruction list $D4D4: PLM $D70C (n00b tube)
    dw $0001,$C540
    dw $0000

DrawInst_NoobTube_1:
; Used by instruction list $D4D4: PLM $D70C (n00b tube)
    dw $0001,$8540
    dw $0000

DrawInst_NoobTube_2:
; Used by instruction list $D4D4: PLM $D70C (n00b tube)
    dw $0001,$8141
    dw $0000

DrawInst_NoobTube_3:
; Used by instruction list $D4D4: PLM $D70C (n00b tube)
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
; Used by instruction list $D4D4: PLM $D70C (n00b tube)
    dw $0001,$0141
    db $00,$04
    dw $000C,$0B22,$00FF,$00FF,$00FF,$00FF,$00FF,$00FF
    dw $00FF,$00FF,$00FF,$00FF,$0F22
    db $00,$05
    dw $000C,$814E,$814F,$00FF,$00FF,$00FF,$00FF,$00FF
    dw $00FF,$00FF,$00FF,$854F,$854E
    dw $0000

DrawInst_NoobTube_5:
; Used by instruction list $D4D4: PLM $D70C (n00b tube)
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
; Used by instruction list $D4D4: PLM $D70C (n00b tube)
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
; Used by instruction list $AFE8: PLM $B76F (save station)
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
; Used by instruction list $AFE8: PLM $B76F (save station)
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
; Used by instruction list $AFE8: PLM $B76F (save station)
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
; Used by instruction list $B03E: PLM $B75B (unused. Draw 13 blank air tiles)
    dw $000D,$00FF,$00FF,$00FF,$00FF,$00FF,$00FF,$00FF
    dw $00FF,$00FF,$00FF,$00FF,$00FF,$00FF
    dw $0000

UNUSED_DrawInst_Draw13BlankSolidTiles_849AED:
; Used by instruction list $B044: PLM $B75F (unused. Draw 13 blank solid tiles)
    dw $000D,$80FF,$80FF,$80FF,$80FF,$80FF,$80FF,$80FF
    dw $80FF,$80FF,$80FF,$80FF,$80FF,$80FF
    dw $0000


UNUSED_DrawInst_LowerNorfair2x2ChozoShotBlock_849B0B:
; Used by instruction list $D490: PLM $D708 (unused. Lower Norfair 2x2 chozo shot block)
    dw $0002,$C64A,$524A
    db $00,$01
    dw $0002,$D66A,$D26A
    dw $0000

UNUSED_DrawInst_LowerNorfair2x2ChozoShotBlock_849B1B:
; Used by instruction list $D490: PLM $D708 (unused. Lower Norfair 2x2 chozo shot block)
    dw $0002,$8053,$8053
    db $00,$01
    dw $0002,$8053,$8053
    dw $0000

UNUSED_DrawInst_LowerNorfair2x2ChozoShotBlock_849B2B:
; Used by instruction list $D490: PLM $D708 (unused. Lower Norfair 2x2 chozo shot block)
    dw $0002,$8054,$8054
    db $00,$01
    dw $0002,$8054,$8054
    dw $0000

UNUSED_DrawInst_LowerNorfair2x2ChozoShotBlock_849B3B:
; Used by instruction list $D490: PLM $D708 (unused. Lower Norfair 2x2 chozo shot block)
    dw $0002,$0055,$0055
    db $00,$01
    dw $0002,$0055,$0055
    dw $0000

UNUSED_DrawInst_LowerNorfair2x2ChozoShotBlock_849B4B:
; Used by instruction list $D490: PLM $D708 (unused. Lower Norfair 2x2 chozo shot block)
    dw $0002,$00FF,$00FF
    db $00,$01
    dw $0002,$00FF,$00FF
    dw $0000
endif ; !FEATURE_KEEP_UNREFERENCED


DrawInst_ClearCrocomiresBridge:
; Used by instruction list $AFCA: PLM $B747 (clear Crocomire's bridge)
    dw $000A,$0080,$0080,$0080,$0080,$0080,$0080,$0080
    dw $0080,$0080,$0080
    dw $0000

DrawInst_CrumbleABlockOfCrocomiresBridge:
; Used by instruction list $AFD0: PLM $B74B (crumble a block of Crocomire's bridge)
    dw $0001,$810B
    dw $0000

DrawInst_ClearABlockOfCrocomiresBridge:
; Used by instruction list $AFD6: PLM $B74F (clear a block of Crocomire's bridge)
    dw $0001,$0080
    dw $0000

DrawInst_ClearCrocomireInvisibleWall_0:
; Used by instruction list $AFDC: PLM $B753 (clear Crocomire invisible wall)
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
; Used by instruction list $AFE2: PLM $B757 (create Crocomire invisible wall)
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
; Used by instruction list $D81E: PLM $DB56 (eye door eye, facing left)
    dw $8004,$84AA,$84CC,$8CCC,$8CAA
    dw $0000

DrawInst_EyeDoorEyeFacingLeft_1:
; Used by instruction list $D81E: PLM $DB56 (eye door eye, facing left)
    dw $8002,$84CC,$8CCC
    dw $0000

DrawInst_EyeDoorEyeFacingLeft_2:
; Used by instruction list $D81E: PLM $DB56 (eye door eye, facing left)
    dw $8002,$84CB,$8CCB
    dw $0000

DrawInst_EyeDoorEyeFacingLeft_3:
; Used by instruction list $D81E: PLM $DB56 (eye door eye, facing left)
    dw $8002,$C4CA,$DCCA
    dw $0000

DrawInst_EyeDoorEyeFacingLeft_4:
; Used by instruction list $D81E: PLM $DB56 (eye door eye, facing left)
    dw $8002,$84CD,$8CCD
    dw $0000

DrawInst_EyeDoorEyeFacingLeft_5:
; Used by instruction list $D81E: PLM $DB56 (eye door eye, facing left)
    dw $8002,$84CA,$8CCA
    dw $0000


DrawInst_EyeDoorFacingLeft_0:
; Used by instruction list $D8E9: Door $DB5A (eye door, facing left)
    dw $0001,$A4AA
    dw $0000

DrawInst_EyeDoorFacingLeft_1:
; Used by instruction list $D8E9: Door $DB5A (eye door, facing left)
    dw $0001,$A4AB
    dw $0000

DrawInst_EyeDoorFacingLeft_2:
; Used by instruction list $D8E9: Door $DB5A (eye door, facing left)
    dw $0001,$A4AC
    dw $0000


DrawInst_EyeDoorBottomFacingLeft_0:
; Used by instruction list $D91F: PLM $DB60 (eye door bottom, facing left)
    dw $0001,$ACAA
    dw $0000

DrawInst_EyeDoorBottomFacingLeft_1:
; Used by instruction list $D91F: PLM $DB60 (eye door bottom, facing left)
    dw $0001,$ACAB
    dw $0000

DrawInst_EyeDoorBottomFacingLeft_2:
; Used by instruction list $D91F: PLM $DB60 (eye door bottom, facing left)
    dw $0001,$ACAC
    dw $0000


DrawInst_EyeDoorEyeFacingRight_0:
; Used by instruction list $D955: PLM $DB48 (eye door eye, facing right)
    dw $8004,$80AA,$80CC,$88CC,$88AA
    dw $0000

DrawInst_EyeDoorEyeFacingRight_1:
; Used by instruction list $D955: PLM $DB48 (eye door eye, facing right)
    dw $8002,$80CC,$88CC
    dw $0000

DrawInst_EyeDoorEyeFacingRight_2:
; Used by instruction list $D955: PLM $DB48 (eye door eye, facing right)
    dw $8002,$80CB,$88CB
    dw $0000

DrawInst_EyeDoorEyeFacingRight_3:
; Used by instruction list $D955: PLM $DB48 (eye door eye, facing right)
    dw $8002,$C0CA,$D8CA
    dw $0000

DrawInst_EyeDoorEyeFacingRight_4:
; Used by instruction list $D955: PLM $DB48 (eye door eye, facing right)
    dw $8002,$80CD,$88CD
    dw $0000

DrawInst_EyeDoorEyeFacingRight_5:
; Used by instruction list $D955: PLM $DB48 (eye door eye, facing right)
    dw $8002,$80CA,$88CA
    dw $0000


DrawInst_EyeDoorFacingRight_0:
; Used by instruction list $DA20: Door $DB4C (eye door, facing right)
    dw $0001,$A0AA
    dw $0000

DrawInst_EyeDoorFacingRight_1:
; Used by instruction list $DA20: Door $DB4C (eye door, facing right)
    dw $0001,$A0AB
    dw $0000

DrawInst_EyeDoorFacingRight_2:
; Used by instruction list $DA20: Door $DB4C (eye door, facing right)
    dw $0001,$A0AC
    dw $0000

DrawInst_EyeDoorBottomFacingRight_0:
; Used by instruction list $DA56: PLM $DB52 (eye door bottom, facing right)
    dw $0001,$A8AA
    dw $0000

DrawInst_EyeDoorBottomFacingRight_1:
; Used by instruction list $DA56: PLM $DB52 (eye door bottom, facing right)
    dw $0001,$A8AB
    dw $0000

DrawInst_EyeDoorBottomFacingRight_2:
; Used by instruction list $DA56: PLM $DB52 (eye door bottom, facing right)
    dw $0001,$A8AC
    dw $0000


if !FEATURE_KEEP_UNREFERENCED
UNUSED_DrawInst_AlternateLowerNorfairChozoHand_849CA7:
; Used by instruction list $D44E: PLM $D704 (unused. Alternate Lower Norfair chozo hand)
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
; Used by instruction list $D44E: PLM $D704 (unused. Alternate Lower Norfair chozo hand)
    dw $0001,$00FF
    dw $0000
endif ; !FEATURE_KEEP_UNREFERENCED

DrawInst_ClearSlopeAccessForWreckedShipChozo:
; Used by instruction list $D3CF: PLM $D6F8 (clear slope access for Wrecked Ship chozo)
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
; Used by instruction list $D3EC: PLM $D6FC (block slope access for Wrecked Ship chozo)
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
; Used by instruction list $D426: PLM $D700 (unused. Wrecked Ship 3x4 chozo bomb block)
    dw $8004,$C171,$D171,$D171,$D171
    db $FF,$00
    dw $8004,$8102,$8102,$8102,$8102
    db $FE,$00
    dw $8004,$8560,$8560,$8560,$8560
    dw $0000

UNUSED_DrawInst_WreckedShip3x4ChozoBombBlock_1_849D7D:
; Used by instruction list $D426: PLM $D700 (unused. Wrecked Ship 3x4 chozo bomb block)
    dw $8004,$8053,$8053,$8053,$8053
    db $FF,$00
    dw $8004,$8053,$8053,$8053,$8053
    db $FE,$00
    dw $8004,$8053,$8053,$8053,$8053
    dw $0000

UNUSED_DrawInst_WreckedShip3x4ChozoBombBlock_2_849DA1:
; Used by instruction list $D426: PLM $D700 (unused. Wrecked Ship 3x4 chozo bomb block)
    dw $8004,$0054,$0054,$0054,$0054
    db $FF,$00
    dw $8004,$0054,$0054,$0054,$0054
    db $FE,$00
    dw $8004,$0054,$0054,$0054,$0054
    dw $0000

UNUSED_DrawInst_WreckedShip3x4ChozoBombBlock_3_849DC5:
; Used by instruction list $D426: PLM $D700 (unused. Wrecked Ship 3x4 chozo bomb block)
    dw $8004,$8055,$8055,$8055,$8055
    db $FF,$00
    dw $8004,$8055,$8055,$8055,$8055
    db $FE,$00
    dw $8004,$8055,$8055,$8055,$8055
    dw $0000

UNUSED_DrawInst_WreckedShip3x4ChozoBombBlock_4_849DE9:
; Used by instruction list $D426: PLM $D700 (unused. Wrecked Ship 3x4 chozo bomb block)
    dw $8004,$00FF,$00FF,$00FF,$00FF
    db $FF,$00
    dw $8004,$D0FF,$D0FF,$D0FF,$30FF
    db $FE,$00
    dw $8004,$D0FF,$D0FF,$D0FF,$30FF
    dw $0000
endif ; !FEATURE_KEEP_UNREFERENCED


DrawInst_BrinstarFloorPlant_0:
; Used by instruction list $ACB8: PLM $B6CB (inside reaction, special air, BTS Brinstar 80h. Floor plant)
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
; Used by instruction list $ACB8: PLM $B6CB (inside reaction, special air, BTS Brinstar 80h. Floor plant)
    dw $0002,$05A3,$85A2
    db $FE,$00
    dw $0002,$81A2,$01A3
    db $FE,$FF
    dw $0004,$2182,$2183,$2583,$2582
    dw $0000

DrawInst_BrinstarFloorPlant_2:
; Used by instruction list $ACB8: PLM $B6CB (inside reaction, special air, BTS Brinstar 80h. Floor plant)
    dw $0002,$05A5,$85A4
    db $FE,$00
    dw $0002,$81A4,$01A5
    db $FE,$FF
    dw $0004,$2184,$2185,$2585,$2584
    dw $0000

DrawInst_BrinstarFloorPlant_3:
; Used by instruction list $ACB8: PLM $B6CB (inside reaction, special air, BTS Brinstar 80h. Floor plant)
    dw $0002,$05A7,$85A6
    db $FE,$00
    dw $0002,$81A6,$01A7
    db $FE,$FF
    dw $0004,$2186,$2187,$2587,$2586
    dw $0000


DrawInst_BrinstarCeilingPlant_0:
; Used by instruction list $ACF8: PLM $B6CF (inside reaction, special air, BTS Brinstar 81h. Ceiling plant)
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
; Used by instruction list $ACF8: PLM $B6CF (inside reaction, special air, BTS Brinstar 81h. Ceiling plant)
    dw $0002,$0DA3,$8DA2
    db $FE,$00
    dw $0002,$89A2,$09A3
    db $FE,$01
    dw $0004,$2982,$2983,$2D83,$2D82
    dw $0000

DrawInst_BrinstarCeilingPlant_2:
; Used by instruction list $ACF8: PLM $B6CF (inside reaction, special air, BTS Brinstar 81h. Ceiling plant)
    dw $0002,$0DA5,$8DA4
    db $FE,$00
    dw $0002,$89A4,$09A5
    db $FE,$01
    dw $0004,$2984,$2985,$2D85,$2D84
    dw $0000

DrawInst_BrinstarCeilingPlant_3:
; Used by instruction list $ACF8: PLM $B6CF (inside reaction, special air, BTS Brinstar 81h. Ceiling plant)
    dw $0002,$0DA7,$8DA6
    db $FE,$00
    dw $0002,$89A6,$09A7
    db $FE,$01
    dw $0004,$2986,$2987,$2D87,$2D86
    dw $0000


DrawInst_MapStation_0:
; Used by instruction list $AD62: PLM $B6D3 (map station)
    dw $0001,$810C
    db $FF,$00
    dw $0001,$810B
    dw $0000

DrawInst_MapStation_1:
; Used by instruction list $AD62: PLM $B6D3 (map station)
    dw $0001,$812C
    db $FF,$00
    dw $0001,$812B
    dw $0000

DrawInst_MapStation_2:
; Used by instruction list $AD62: PLM $B6D3 (map station)
    dw $0001,$814C
    db $FF,$00
    dw $0001,$814B
    dw $0000


DrawInst_MapStationRightAccess_0:
; Used by instruction list $AD86: PLM $B6D7 (collision reaction, special, BTS 47h. Map station right access)
    dw $0001,$8128
    db $FD,$00
    dw $0001,$8528
    dw $0000

DrawInst_MapStationRightAccess_1:
; Used by instruction list $AD86: PLM $B6D7 (collision reaction, special, BTS 47h. Map station right access)
    dw $0001,$8129
    dw $0000


DrawInst_MapStationLeftAccess_0:
; Used by instruction list $ADA4: PLM $B6DB (collision reaction, special, BTS 48h. Map station left access)
    dw $0001,$8528
    db $03,$00
    dw $0001,$8128
    dw $0000

DrawInst_MapStationLeftAccess_1:
; Used by instruction list $ADA4: PLM $B6DB (collision reaction, special, BTS 48h. Map station left access)
    dw $0001,$8529
    dw $0000


DrawInst_EnergyStation_0:
; Used by instruction list $ADC2: PLM $B6DF (energy station)
    dw $0001,$80C4
    db $00,$FF
    dw $0001,$10A4
    dw $0000

DrawInst_EnergyStation_1:
; Used by instruction list $ADC2: PLM $B6DF (energy station)
    dw $0001,$80C5
    db $00,$FF
    dw $0001,$10A5
    dw $0000

DrawInst_EnergyStation_2:
; Used by instruction list $ADC2: PLM $B6DF (energy station)
    dw $0001,$80C6
    db $00,$FF
    dw $0001,$10A6
    dw $0000


DrawInst_MissileStation_0:
; Used by instruction list $AE4C: PLM $B6EB (missile station)
    dw $0001,$80C7
    db $00,$FF
    dw $0001,$10A7
    dw $0000

DrawInst_MissileStation_1:
; Used by instruction list $AE4C: PLM $B6EB (missile station)
    dw $0001,$80C8
    db $00,$FF
    dw $0001,$10A8
    dw $0000

DrawInst_MissileStation_2:
; Used by instruction list $AE4C: PLM $B6EB (missile station)
    dw $0001,$80C9
    db $00,$FF
    dw $0001,$10A9
    dw $0000


DrawInst_EnergyMissileStationRightAccess_0:
; Used by instruction lists:
;     $ADF1: PLM $B6E3 (collision reaction, special, BTS 49h. Energy station right access)
;     $AE7B: PLM $B6EF (collision reaction, special, BTS 4Bh. Missile station right access)
    dw $0001,$B4C3
    dw $0000

DrawInst_EnergyMissileStationRightAccess_1:
; Used by instruction lists:
;     $ADF1: PLM $B6E3 (collision reaction, special, BTS 49h. Energy station right access)
;     $AE7B: PLM $B6EF (collision reaction, special, BTS 4Bh. Missile station right access)
    dw $0001,$84C1
    dw $0000


DrawInst_EnergyMissileStationLeftAccess_0:
; Used by instruction lists:
;     $AE13: PLM $B6E7 (collision reaction, special, BTS 4Ah. Energy station left access)
;     $AE9D: PLM $B6F3 (collision reaction, special, BTS 4Ch. Missile station left access)
    dw $0001,$B0C3
    dw $0000

DrawInst_EnergyMissileStationLeftAccess_1:
; Used by instruction lists:
;     $AE13: PLM $B6E7 (collision reaction, special, BTS 4Ah. Energy station left access)
;     $AE9D: PLM $B6F3 (collision reaction, special, BTS 4Ch. Missile station left access)
    dw $0001,$80C1
    dw $0000


DrawInst_DraygonCannonShieldRight_0:
; Used by instruction list $DCDE: PLM $DF59 (Draygon cannon, with shield, facing right)
    dw $0002,$C514,$0513
    db $00,$01
    dw $0002,$D534,$0533
    dw $0000

DrawInst_DraygonCannonShieldRight_1:
; Used by instruction list $DCDE: PLM $DF59 (Draygon cannon, with shield, facing right)
    dw $0002,$C516,$0515
    db $00,$01
    dw $0002,$D536,$0535
    dw $0000

UNUSED_DrawInst_DraygonCannonShieldDownRight_0_849FED:
; Used by instruction list $DD27: PLM $DF5D (unused. Draygon cannon, with shield, facing down-right)
    dw $0002,$C510,$550F
    db $00,$01
    dw $0002,$D530,$D52F
    dw $0000

UNUSED_DrawInst_DraygonCannonShieldDownRight_1_849FFD:
; Used by instruction list $DD27: PLM $DF5D (unused. Draygon cannon, with shield, facing down-right)
    dw $0002,$C512,$5511
    db $00,$01
    dw $0002,$D532,$D531
    dw $0000

if !FEATURE_KEEP_UNREFERENCED
UNUSED_DrawInst_DraygonCannonShieldUpRight_0_84A00D:
; Used by instruction list $DD70: PLM $DF61 (unused. Draygon cannon, with shield, facing up-right)
    dw $0002,$CD30,$5D2F
    db $00,$01
    dw $0002,$DD10,$DD0F
    dw $0000

UNUSED_DrawInst_DraygonCannonShieldUpRight_1_84A01D:
; Used by instruction list $DD70: PLM $DF61 (unused. Draygon cannon, with shield, facing up-right)
    dw $0002,$CD32,$5D31
    db $00,$01
    dw $0002,$DD12,$DD11
    dw $0000
endif ; !FEATURE_KEEP_UNREFERENCED


DrawInst_DraygonCannonRight_0:
; Used by instruction list $DD11: PLM $DF65 (Draygon cannon, facing right)
    dw $0002,$A580,$00FF
    db $00,$01
    dw $0002,$A5A0,$00FF
    dw $0000

DrawInst_DraygonCannonRight_1:
; Used by instruction list $DD11: PLM $DF65 (Draygon cannon, facing right)
    dw $0002,$A581,$00FF
    db $00,$01
    dw $0002,$A5A1,$00FF
    dw $0000

DrawInst_DraygonCannonRight_2:
; Used by instruction list $DD11: PLM $DF65 (Draygon cannon, facing right)
    dw $0002,$A582,$00FF
    db $00,$01
    dw $0002,$A5A2,$00FF
    dw $0000

DrawInst_DraygonCannonRight_3:
; Used by instruction list $DD11: PLM $DF65 (Draygon cannon, facing right)
    dw $0002,$A583,$00FF
    db $00,$01
    dw $0002,$A5A3,$00FF
    dw $0000


if !FEATURE_KEEP_UNREFERENCED
UNUSED_DrawInst_DraygonCannonDownRight_0_84A06D:
; Used by instruction list $DD5A: PLM $DF69 (unused. Draygon cannon, facing down-right)
    dw $0002,$A5A5,$A5A4
    db $00,$01
    dw $0002,$A5C5,$05C4
    dw $0000

UNUSED_DrawInst_DraygonCannonDownRight_1_84A07D:
; Used by instruction list $DD5A: PLM $DF69 (unused. Draygon cannon, facing down-right)
    dw $0002,$A5A7,$A5A6
    db $00,$01
    dw $0002,$A5C7,$05C6
    dw $0000

UNUSED_DrawInst_DraygonCannonDownRight_2_84A08D:
; Used by instruction list $DD5A: PLM $DF69 (unused. Draygon cannon, facing down-right)
    dw $0002,$A5A9,$A5A8
    db $00,$01
    dw $0002,$A5C9,$05C8
    dw $0000

UNUSED_DrawInst_DraygonCannonDownRight_3_84A09D:
; Used by instruction list $DD5A: PLM $DF69 (unused. Draygon cannon, facing down-right)
    dw $0002,$A5AB,$A5AA
    db $00,$01
    dw $0002,$A5CB,$05CA
    dw $0000


UNUSED_DrawInst_DraygonCannonUpRight_0_84A0AD:
; Used by instruction list $DDA3: PLM $DF6D (unused. Draygon cannon, facing up-right)
    dw $0002,$ADC5,$0DC4
    db $00,$01
    dw $0002,$ADA5,$ADA4
    dw $0000

UNUSED_DrawInst_DraygonCannonUpRight_1_84A0BD:
; Used by instruction list $DDA3: PLM $DF6D (unused. Draygon cannon, facing up-right)
    dw $0002,$ADC7,$0DC6
    db $00,$01
    dw $0002,$ADA7,$ADA6
    dw $0000

UNUSED_DrawInst_DraygonCannonUpRight_2_84A0CD:
; Used by instruction list $DDA3: PLM $DF6D (unused. Draygon cannon, facing up-right)
    dw $0002,$ADC9,$0DC8
    db $00,$01
    dw $0002,$ADA9,$ADA8
    dw $0000

UNUSED_DrawInst_DraygonCannonUpRight_3_84A0DD:
; Used by instruction list $DDA3: PLM $DF6D (unused. Draygon cannon, facing up-right)
    dw $0002,$ADCB,$0DCA
    db $00,$01
    dw $0002,$ADAB,$ADAA
    dw $0000
endif ; !FEATURE_KEEP_UNREFERENCED


DrawInst_DraygonCannonShieldLeft_0:
; Used by instruction list $DDB9: PLM $DF71 (Draygon cannon, with shield, facing left)
    dw $0001,$C114
    db $FF,$00
    dw $0001,$0113
    db $FF,$01
    dw $0002,$0133,$D134
    dw $0000

DrawInst_DraygonCannonShieldLeft_1:
; Used by instruction list $DDB9: PLM $DF71 (Draygon cannon, with shield, facing left)
    dw $0001,$C116
    db $FF,$00
    dw $0001,$0115
    db $FF,$01
    dw $0002,$0135,$D136
    dw $0000

if !FEATURE_KEEP_UNREFERENCED
UNUSED_DrawInst_DraygonCannonShieldDownLeft_0_84A115:
; Used by instruction list $DE02: PLM $DF75 (unused. Draygon cannon, with shield, facing down-left)
    dw $0001,$C110
    db $FF,$00
    dw $0001,$510F
    db $FF,$01
    dw $0002,$D12F,$D130
    dw $0000

UNUSED_DrawInst_DraygonCannonShieldDownLeft_1_84A129:
; Used by instruction list $DE02: PLM $DF75 (unused. Draygon cannon, with shield, facing down-left)
    dw $0001,$C112
    db $FF,$00
    dw $0001,$5111
    db $FF,$01
    dw $0002,$D131,$D132
    dw $0000

UNUSED_DrawInst_DraygonCannonShieldUpLeft_0_84A13D:
; Used by instruction list $DE4B: PLM $DF79 (unused. Draygon cannon, with shield, facing up-left)
    dw $0001,$C930
    db $FF,$00
    dw $0001,$592F
    db $FF,$01
    dw $0002,$D90F,$D910
    dw $0000

UNUSED_DrawInst_DraygonCannonShieldUpLeft_1_84A151:
; Used by instruction list $DE4B: PLM $DF79 (unused. Draygon cannon, with shield, facing up-left)
    dw $0001,$C932
    db $FF,$00
    dw $0001,$5931
    db $FF,$01
    dw $0002,$D911,$D912
    dw $0000
endif ; !FEATURE_KEEP_UNREFERENCED


DrawInst_DraygonCannonLeft_0:
; Used by instruction list $DDEC: PLM $DF7D (Draygon cannon, facing left)
    dw $0001,$A180
    db $FF,$00
    dw $0001,$00FF
    db $FF,$01
    dw $0002,$00FF,$A1A0
    dw $0000

DrawInst_DraygonCannonLeft_1:
; Used by instruction list $DDEC: PLM $DF7D (Draygon cannon, facing left)
    dw $0001,$A181
    db $FF,$00
    dw $0001,$00FF
    db $FF,$01
    dw $0002,$00FF,$A1A1
    dw $0000

DrawInst_DraygonCannonLeft_2:
; Used by instruction list $DDEC: PLM $DF7D (Draygon cannon, facing left)
    dw $0001,$A182
    db $FF,$00
    dw $0001,$00FF
    db $FF,$01
    dw $0002,$00FF,$A1A2
    dw $0000

DrawInst_DraygonCannonLeft_3:
; Used by instruction list $DDEC: PLM $DF7D (Draygon cannon, facing left)
    dw $0001,$A183
    db $FF,$00
    dw $0001,$00FF
    db $FF,$01
    dw $0002,$00FF,$A1A3
    dw $0000


if !FEATURE_KEEP_UNREFERENCED
UNUSED_DrawInst_DraygonCannonDownLeft_0_84A1B5:
; Used by instruction list $DE35: PLM $DF81 (unused. Draygon cannon, facing down-left)
    dw $0001,$A1A5
    db $FF,$00
    dw $0001,$A1A4
    db $FF,$01
    dw $0002,$01C4,$A1C5
    dw $0000

UNUSED_DrawInst_DraygonCannonDownLeft_1_84A1C9:
; Used by instruction list $DE35: PLM $DF81 (unused. Draygon cannon, facing down-left)
    dw $0001,$A1A7
    db $FF,$00
    dw $0001,$A1A6
    db $FF,$01
    dw $0002,$01C6,$A1C7
    dw $0000

UNUSED_DrawInst_DraygonCannonDownLeft_2_84A1DD:
; Used by instruction list $DE35: PLM $DF81 (unused. Draygon cannon, facing down-left)
    dw $0001,$A1A9
    db $FF,$00
    dw $0001,$A1A8
    db $FF,$01
    dw $0002,$01C8,$A1C9
    dw $0000

UNUSED_DrawInst_DraygonCannonDownLeft_3_84A1F1:
; Used by instruction list $DE35: PLM $DF81 (unused. Draygon cannon, facing down-left)
    dw $0001,$A1AB
    db $FF,$00
    dw $0001,$A1AA
    db $FF,$01
    dw $0002,$01CA,$A1CB
    dw $0000


UNUSED_DrawInst_DraygonCannonUpLeft_0_84A205:
; Used by instruction list $DE7E: PLM $DF85 (unused. Draygon cannon, facing up-left)
    dw $0001,$A9C5
    db $FF,$00
    dw $0001,$09C4
    db $FF,$01
    dw $0002,$A9A4,$A9A5
    dw $0000

UNUSED_DrawInst_DraygonCannonUpLeft_1_84A219:
; Used by instruction list $DE7E: PLM $DF85 (unused. Draygon cannon, facing up-left)
    dw $0001,$A9C7
    db $FF,$00
    dw $0001,$09C6
    db $FF,$01
    dw $0002,$A9A6,$A9A7
    dw $0000

UNUSED_DrawInst_DraygonCannonUpLeft_2_84A22D:
; Used by instruction list $DE7E: PLM $DF85 (unused. Draygon cannon, facing up-left)
    dw $0001,$A9C9
    db $FF,$00
    dw $0001,$09C8
    db $FF,$01
    dw $0002,$A9A8,$A9A9
    dw $0000

UNUSED_DrawInst_DraygonCannonUpLeft_3_84A241:
; Used by instruction list $DE7E: PLM $DF85 (unused. Draygon cannon, facing up-left)
    dw $0001,$A9CB
    db $FF,$00
    dw $0001,$09CA
    db $FF,$01
    dw $0002,$A9AA,$A9AB
    dw $0000


; Tile numbers don't match any tilesets
UNUSED_DrawInst_84A255:
; Used by instruction list $AED8: PLM $B6F7 (unused)
    dw $8002,$2330,$2350
    dw $0000

UNUSED_DrawInst_84A25D:
; Used by instruction list $AED8: PLM $B6F7 (unused)
    dw $8002,$2331,$2351
    dw $0000

UNUSED_DrawInst_84A265:
; Used by instruction list $AED8: PLM $B6F7 (unused)
    dw $8002,$2332,$2352
    dw $0000

UNUSED_DrawInst_84A26D:
; Used by instruction list $AED8: PLM $B6F7 (unused)
    dw $8002,$2333,$2353
    dw $0000


; 2x2 version of UNUSED_DrawInst_84A255
UNUSED_DrawInst_84A275:
; Used by instruction list $AF1E: PLM $B6FB (unused)
    dw $8002,$2330,$2350
    db $FF,$00
    dw $8002,$2330,$2350
    dw $0000

UNUSED_DrawInst_84A285:
; Used by instruction list $AF1E: PLM $B6FB (unused)
    dw $8002,$2331,$2351
    db $FF,$00
    dw $8002,$2331,$2351
    dw $0000

UNUSED_DrawInst_84A295:
; Used by instruction list $AF1E: PLM $B6FB (unused)
    dw $8002,$2332,$2352
    db $FF,$00
    dw $8002,$2332,$2352
    dw $0000

UNUSED_DrawInst_84A2A5:
; Used by instruction list $AF1E: PLM $B6FB (unused)
    dw $8002,$2333,$2353
    db $FF,$00
    dw $8002,$2333,$2353
    dw $0000
endif ; !FEATURE_KEEP_UNREFERENCED


DrawInst_ItemChozoOrb:
; Used by instruction lists:
;     $AADF: Unused. Draw empty tile
;     $D13F: PLM $D6D6 (Lower Norfair chozo hand)
;     $DFA9: Empty item
;     $DFC7: Item orb burst
;     $DFD7: Empty item orb
;     $E032: Empty item shot block reconcealing
;     $E44A: PLM $EF2B (energy tank, chozo orb)
;     $E47C: PLM $EF2F (missile tank, chozo orb)
;     $E4AE: PLM $EF33 (super missile tank, chozo orb)
;     $E4E0: PLM $EF37 (power bomb tank, chozo orb)
;     $E512: PLM $EF3B (bombs, chozo orb)
;     $E54D: PLM $EF3F (charge beam, chozo orb)
;     $E588: PLM $EF43 (ice beam, chozo orb)
;     $E5C3: PLM $EF47 (hi-jump, chozo orb)
;     $E5FE: PLM $EF4B (speed booster, chozo orb)
;     $E642: PLM $EF4F (wave beam, chozo orb)
;     $E67D: PLM $EF53 (spazer beam, chozo orb)
;     $E6B8: PLM $EF57 (spring ball, chozo orb)
;     $E6F3: PLM $EF5B (varia suit, chozo orb)
;     $E735: PLM $EF5F (gravity suit, chozo orb)
;     $E777: PLM $EF63 (x-ray scope, chozo orb)
;     $E7B1: PLM $EF67 (plasma beam, chozo orb)
;     $E7EC: PLM $EF6B (grapple beam, chozo orb)
;     $E826: PLM $EF6F (space jump, chozo orb)
;     $E861: PLM $EF73 (screw attack, chozo orb)
;     $E89C: PLM $EF77 (morph ball, chozo orb)
;     $E8D7: PLM $EF7B (reserve tank, chozo orb)
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
; Used by instruction list $DFAF: item orb
    dw $0001,$C072
    dw $0000

DrawInst_ItemOrb_1:
; Used by instruction list $DFAF: item orb
    dw $0001,$C073
    dw $0000

DrawInst_ItemOrb_2:
; Used by instruction list $DFAF: item orb
    dw $0001,$C074
    dw $0000


DrawInst_ItemOrbBurst:
; Used by instruction list $DFC7: item orb burst
    dw $0001,$8075
    dw $0000


DrawInst_EnergyTank_0:
; Used by instruction lists:
;     $E099: PLM $EED7 (energy tank)
;     $E44A: PLM $EF2B (energy tank, chozo orb)
;     $E911: PLM $EF7F (energy tank, shot block)
    dw $0001,$B04A
    dw $0000

DrawInst_EnergyTank_1:
; Used by instruction lists:
;     $E099: PLM $EED7 (energy tank)
;     $E44A: PLM $EF2B (energy tank, chozo orb)
;     $E911: PLM $EF7F (energy tank, shot block)
    dw $0001,$B04B
    dw $0000


DrawInst_MissileTank_0:
; Used by instruction lists:
;     $E0BE: PLM $EEDB (missile tank)
;     $E47C: PLM $EF2F (missile tank, chozo orb)
;     $E949: PLM $EF83 (missile tank, shot block)
    dw $0001,$B04C
    dw $0000

DrawInst_MissileTank_1:
; Used by instruction lists:
;     $E0BE: PLM $EEDB (missile tank)
;     $E47C: PLM $EF2F (missile tank, chozo orb)
;     $E949: PLM $EF83 (missile tank, shot block)
    dw $0001,$B04D
    dw $0000


DrawInst_SuperMissileTank_0:
; Used by instruction lists:
;     $E0E3: PLM $EEDF (super missile tank)
;     $E4AE: PLM $EF33 (super missile tank, chozo orb)
;     $E981: PLM $EF87 (super missile tank, shot block)
    dw $0001,$B04E
    dw $0000

DrawInst_SuperMissileTank_1:
; Used by instruction lists:
;     $E0E3: PLM $EEDF (super missile tank)
;     $E4AE: PLM $EF33 (super missile tank, chozo orb)
;     $E981: PLM $EF87 (super missile tank, shot block)
    dw $0001,$B04F
    dw $0000


DrawInst_PowerBombTank_0:
; Used by instruction lists:
;     $E108: PLM $EEE3 (power bomb tank)
;     $E4E0: PLM $EF37 (power bomb tank, chozo orb)
;     $E9B9: PLM $EF8B (power bomb tank, shot block)
    dw $0001,$B050
    dw $0000

DrawInst_PowerBombTank_1:
; Used by instruction lists:
;     $E108: PLM $EEE3 (power bomb tank)
;     $E4E0: PLM $EF37 (power bomb tank, chozo orb)
;     $E9B9: PLM $EF8B (power bomb tank, shot block)
    dw $0001,$B051
    dw $0000


DrawInst_DrawItemFrame0_0:
; Item frame 0 - item GFX index 0
; Used by instruction $E04F: Draw item frame 0
    dw $0001,$B08E
    dw $0000

DrawInst_DrawItemFrame1_0:
; Item frame 1 - item GFX index 0
; Used by instruction $E04F: Draw item frame 1
    dw $0001,$B08F
    dw $0000


DrawInst_DrawItemFrame0_1:
; Item frame 0 - item GFX index 1
; Used by instruction $E04F: Draw item frame 0
    dw $0001,$B090
    dw $0000

DrawInst_DrawItemFrame1_1:
; Item frame 1 - item GFX index 1
; Used by instruction $E04F: Draw item frame 1
    dw $0001,$B091
    dw $0000


DrawInst_DrawItemFrame0_2:
; Item frame 0 - item GFX index 2
; Used by instruction $E04F: Draw item frame 0
    dw $0001,$B092
    dw $0000

DrawInst_DrawItemFrame1_2:
; Item frame 1 - item GFX index 2
; Used by instruction $E04F: Draw item frame 1
    dw $0001,$B093
    dw $0000


DrawInst_DrawItemFrame0_3:
; Item frame 0 - item GFX index 3
; Used by instruction $E04F: Draw item frame 0
    dw $0001,$B094
    dw $0000

DrawInst_DrawItemFrame1_3:
; Item frame 1 - item GFX index 3
; Used by instruction $E04F: Draw item frame 1
    dw $0001,$B095
    dw $0000


DrawInst_84A33F:
; Used by instruction list $D121: PLM $D127 (unused. Shot block)
    dw $0001,$8052
    dw $0000


DrawInst_Respawn1x1_0:
; Used by instruction lists:
;     $AB31: PLM $B79B (crumble Botwoon wall)
;     $C92E: PLM $D028 (unused. Respawning screw attack block)
;     $C951: PLM $D030 (collision reaction, special, BTS Brinstar 82h. Respawning speed block, slower crumble animation)
;     $C974: PLM $D038 (collision reaction, special, BTS Eh. Respawning speed block)
;     $C997: PLM $D03C (collision reaction, special, BTS Brinstar 84h. Respawning speed block)
;     $C9BA: PLM $D02C (unused. Screw attack block)
;     $C9CF: PLM $D034 (collision reaction, special, BTS Brinstar 83h. Speed block, slower crumble animation)
;     $C9E4: PLM $D040 (collision reaction, special, BTS Fh / Brinstar 85h. Speed block)
;     $C9F9: PLM $D044 (collision reaction, special, BTS 0. 1x1 respawning crumble block)
;     $CA8B: PLM $D054 (collision reaction, special, BTS 4. 1x1 crumble block)
;     $CADF: PLM $D064 (shot/bombed/grappled reaction, shootable, BTS 0. 1x1 respawning shot block)
;     $CB71: PLM $D08C (shot/bombed/grappled reaction, shootable, BTS Ah. Respawning super missile block)
;     $CB94: PLM $D084 (shot/bombed/grappled reaction, shootable, BTS 8. Respawning power bomb block)
;     $CBB7: PLM $D074 (shot/bombed/grappled reaction, shootable, BTS 4. 1x1 shot block)
;     $CC0B: PLM $D090 (shot/bombed/grappled reaction, shootable, BTS Bh. Super missile block)
;     $CC3F: 1x1 respawning bomb block
;     $CC20: PLM $D088 (shot/bombed/grappled reaction, shootable, BTS 9. Power bomb block)
;     $CCED: 1x1 bomb block
;     $CD53: PLM $D094 (enemy collision reaction, spike block, BTS Fh. Enemy breakable block)
;     $D0F6: PLM $D113 (crumble Lower Norfair chozo room plug)
;     $E032: Empty item shot block reconcealing
    dw $0001,$0053
    dw $0000

DrawInst_Respawn1x1_1:
; Used by instruction lists:
;     $AB31: PLM $B79B (crumble Botwoon wall)
;     $C92E: PLM $D028 (unused. Respawning screw attack block)
;     $C951: PLM $D030 (collision reaction, special, BTS Brinstar 82h. Respawning speed block, slower crumble animation)
;     $C974: PLM $D038 (collision reaction, special, BTS Eh. Respawning speed block)
;     $C997: PLM $D03C (collision reaction, special, BTS Brinstar 84h. Respawning speed block)
;     $C9BA: PLM $D02C (unused. Screw attack block)
;     $C9CF: PLM $D034 (collision reaction, special, BTS Brinstar 83h. Speed block, slower crumble animation)
;     $C9E4: PLM $D040 (collision reaction, special, BTS Fh / Brinstar 85h. Speed block)
;     $C9F9: PLM $D044 (collision reaction, special, BTS 0. 1x1 respawning crumble block)
;     $CA8B: PLM $D054 (collision reaction, special, BTS 4. 1x1 crumble block)
;     $CADF: PLM $D064 (shot/bombed/grappled reaction, shootable, BTS 0. 1x1 respawning shot block)
;     $CB71: PLM $D08C (shot/bombed/grappled reaction, shootable, BTS Ah. Respawning super missile block)
;     $CB94: PLM $D084 (shot/bombed/grappled reaction, shootable, BTS 8. Respawning power bomb block)
;     $CBB7: PLM $D074 (shot/bombed/grappled reaction, shootable, BTS 4. 1x1 shot block)
;     $CC0B: PLM $D090 (shot/bombed/grappled reaction, shootable, BTS Bh. Super missile block)
;     $CC20: PLM $D088 (shot/bombed/grappled reaction, shootable, BTS 9. Power bomb block)
;     $CC3F: 1x1 respawning bomb block
;     $CCED: 1x1 bomb block
;     $CD53: PLM $D094 (enemy collision reaction, spike block, BTS Fh. Enemy breakable block)
;     $D0F6: PLM $D113 (crumble Lower Norfair chozo room plug)
;     $E032: Empty item shot block reconcealing
    dw $0001,$0054
    dw $0000

DrawInst_Respawn1x1_2:
; Used by instruction lists:
;     $AB31: PLM $B79B (crumble Botwoon wall)
;     $C92E: PLM $D028 (unused. Respawning screw attack block)
;     $C951: PLM $D030 (collision reaction, special, BTS Brinstar 82h. Respawning speed block, slower crumble animation)
;     $C974: PLM $D038 (collision reaction, special, BTS Eh. Respawning speed block)
;     $C997: PLM $D03C (collision reaction, special, BTS Brinstar 84h. Respawning speed block)
;     $C9BA: PLM $D02C (unused. Screw attack block)
;     $C9CF: PLM $D034 (collision reaction, special, BTS Brinstar 83h. Speed block, slower crumble animation)
;     $C9E4: PLM $D040 (collision reaction, special, BTS Fh / Brinstar 85h. Speed block)
;     $C9F9: PLM $D044 (collision reaction, special, BTS 0. 1x1 respawning crumble block)
;     $CA8B: PLM $D054 (collision reaction, special, BTS 4. 1x1 crumble block)
;     $CADF: PLM $D064 (shot/bombed/grappled reaction, shootable, BTS 0. 1x1 respawning shot block)
;     $CB71: PLM $D08C (shot/bombed/grappled reaction, shootable, BTS Ah. Respawning super missile block)
;     $CB94: PLM $D084 (shot/bombed/grappled reaction, shootable, BTS 8. Respawning power bomb block)
;     $CBB7: PLM $D074 (shot/bombed/grappled reaction, shootable, BTS 4. 1x1 shot block)
;     $CC0B: PLM $D090 (shot/bombed/grappled reaction, shootable, BTS Bh. Super missile block)
;     $CC20: PLM $D088 (shot/bombed/grappled reaction, shootable, BTS 9. Power bomb block)
;     $CC3F: 1x1 respawning bomb block
;     $CCED: 1x1 bomb block
;     $CD53: PLM $D094 (enemy collision reaction, spike block, BTS Fh. Enemy breakable block)
;     $D0F6: PLM $D113 (crumble Lower Norfair chozo room plug)
;     $E032: Empty item shot block reconcealing
    dw $0001,$0055
    dw $0000

DrawInst_Respawn1x1_3:
; Used by instruction lists:
;     $AB31: PLM $B79B (crumble Botwoon wall)
;     $C92E: PLM $D028 (unused. Respawning screw attack block)
;     $C951: PLM $D030 (collision reaction, special, BTS Brinstar 82h. Respawning speed block, slower crumble animation)
;     $C974: PLM $D038 (collision reaction, special, BTS Eh. Respawning speed block)
;     $C997: PLM $D03C (collision reaction, special, BTS Brinstar 84h. Respawning speed block)
;     $C9BA: PLM $D02C (unused. Screw attack block)
;     $C9CF: PLM $D034 (collision reaction, special, BTS Brinstar 83h. Speed block, slower crumble animation)
;     $C9E4: PLM $D040 (collision reaction, special, BTS Fh / Brinstar 85h. Speed block)
;     $C9F9: PLM $D044 (collision reaction, special, BTS 0. 1x1 respawning crumble block)
;     $CA8B: PLM $D054 (collision reaction, special, BTS 4. 1x1 crumble block)
;     $CADF: PLM $D064 (shot/bombed/grappled reaction, shootable, BTS 0. 1x1 respawning shot block)
;     $CB71: PLM $D08C (shot/bombed/grappled reaction, shootable, BTS Ah. Respawning super missile block)
;     $CB94: PLM $D084 (shot/bombed/grappled reaction, shootable, BTS 8. Respawning power bomb block)
;     $CBB7: PLM $D074 (shot/bombed/grappled reaction, shootable, BTS 4. 1x1 shot block)
;     $CC0B: PLM $D090 (shot/bombed/grappled reaction, shootable, BTS Bh. Super missile block)
;     $CC20: PLM $D088 (shot/bombed/grappled reaction, shootable, BTS 9. Power bomb block)
;     $CC3F: 1x1 respawning bomb block
;     $CCED: 1x1 bomb block
;     $CD53: PLM $D094 (enemy collision reaction, spike block, BTS Fh. Enemy breakable block)
;     $D0F6: PLM $D113 (crumble Lower Norfair chozo room plug)
    dw $0001,$00FF
    dw $0000


DrawInst_Respawn2x1_0:
; Used by instruction lists:
;     $CA1C: PLM $D048 (collision reaction, special, BTS 1. 2x1 respawning crumble block)
;     $CAA0: PLM $D058 (collision reaction, special, BTS 5. 2x1 crumble block)
;     $CB02: PLM $D068 (shot/bombed/grappled reaction, shootable, BTS 1. 2x1 respawning shot block)
;     $CBCC: PLM $D078 (shot/bombed/grappled reaction, shootable, BTS 5. 2x1 shot block)
;     $CC69: 2x1 respawning bomb block
;     $CD09: 2x1 bomb block
    dw $0002,$0053,$0053
    dw $0000

DrawInst_Respawn2x1_1:
; Used by instruction lists:
;     $CA1C: PLM $D048 (collision reaction, special, BTS 1. 2x1 respawning crumble block)
;     $CAA0: PLM $D058 (collision reaction, special, BTS 5. 2x1 crumble block)
;     $CB02: PLM $D068 (shot/bombed/grappled reaction, shootable, BTS 1. 2x1 respawning shot block)
;     $CBCC: PLM $D078 (shot/bombed/grappled reaction, shootable, BTS 5. 2x1 shot block)
;     $CC69: 2x1 respawning bomb block
;     $CD09: 2x1 bomb block
    dw $0002,$0054,$0054
    dw $0000

DrawInst_Respawn2x1_2:
; Used by instruction lists:
;     $CA1C: PLM $D048 (collision reaction, special, BTS 1. 2x1 respawning crumble block)
;     $CAA0: PLM $D058 (collision reaction, special, BTS 5. 2x1 crumble block)
;     $CB02: PLM $D068 (shot/bombed/grappled reaction, shootable, BTS 1. 2x1 respawning shot block)
;     $CBCC: PLM $D078 (shot/bombed/grappled reaction, shootable, BTS 5. 2x1 shot block)
;     $CC69: 2x1 respawning bomb block
;     $CD09: 2x1 bomb block
    dw $0002,$0055,$0055
    dw $0000

DrawInst_Respawn2x1_3:
; Used by instruction lists:
;     $CA1C: PLM $D048 (collision reaction, special, BTS 1. 2x1 respawning crumble block)
;     $CAA0: PLM $D058 (collision reaction, special, BTS 5. 2x1 crumble block)
;     $CB02: PLM $D068 (shot/bombed/grappled reaction, shootable, BTS 1. 2x1 respawning shot block)
;     $CBCC: PLM $D078 (shot/bombed/grappled reaction, shootable, BTS 5. 2x1 shot block)
;     $CC69: 2x1 respawning bomb block
;     $CD09: 2x1 bomb block
    dw $0002,$00FF,$00FF
    dw $0000


DrawInst_Respawn1x2_0:
; Used by instruction lists:
;     $CA41: PLM $D04C (collision reaction, special, BTS 2. 1x2 respawning crumble block)
;     $CAB5: PLM $D05C (collision reaction, special, BTS 6. 1x2 crumble block)
;     $CB27: PLM $D06C (shot/bombed/grappled reaction, shootable, BTS 2. 1x2 respawning shot block)
;     $CBE1: PLM $D07C (shot/bombed/grappled reaction, shootable, BTS 6. 1x2 shot block)
;     $CC95: 1x2 respawning bomb block
;     $CD25: 1x2 bomb block
    dw $8002,$0053,$0053
    dw $0000

DrawInst_Respawn1x2_1:
; Used by instruction lists:
;     $CA41: PLM $D04C (collision reaction, special, BTS 2. 1x2 respawning crumble block)
;     $CAB5: PLM $D05C (collision reaction, special, BTS 6. 1x2 crumble block)
;     $CB27: PLM $D06C (shot/bombed/grappled reaction, shootable, BTS 2. 1x2 respawning shot block)
;     $CBE1: PLM $D07C (shot/bombed/grappled reaction, shootable, BTS 6. 1x2 shot block)
;     $CC95: 1x2 respawning bomb block
;     $CD25: 1x2 bomb block
    dw $8002,$0054,$0054
    dw $0000

DrawInst_Respawn1x2_2:
; Used by instruction lists:
;     $CA41: PLM $D04C (collision reaction, special, BTS 2. 1x2 respawning crumble block)
;     $CAB5: PLM $D05C (collision reaction, special, BTS 6. 1x2 crumble block)
;     $CB27: PLM $D06C (shot/bombed/grappled reaction, shootable, BTS 2. 1x2 respawning shot block)
;     $CBE1: PLM $D07C (shot/bombed/grappled reaction, shootable, BTS 6. 1x2 shot block)
;     $CC95: 1x2 respawning bomb block
;     $CD25: 1x2 bomb block
    dw $8002,$0055,$0055
    dw $0000

DrawInst_Respawn1x2_3:
; Used by instruction lists:
;     $CA41: PLM $D04C (collision reaction, special, BTS 2. 1x2 respawning crumble block)
;     $CAB5: PLM $D05C (collision reaction, special, BTS 6. 1x2 crumble block)
;     $CB27: PLM $D06C (shot/bombed/grappled reaction, shootable, BTS 2. 1x2 respawning shot block)
;     $CBE1: PLM $D07C (shot/bombed/grappled reaction, shootable, BTS 6. 1x2 shot block)
;     $CC95: 1x2 respawning bomb block
;     $CD25: 1x2 bomb block
    dw $8002,$00FF,$00FF
    dw $0000


DrawInst_Respawn2x2_0:
; Used by instruction lists:
;     $CA66: PLM $D050 (collision reaction, special, BTS 3. 2x2 respawning crumble block)
;     $CACA: PLM $D060 (collision reaction, special, BTS 7. 2x2 crumble block)
;     $CB4C: PLM $D070 (shot/bombed/grappled reaction, shootable, BTS 3. 2x2 respawning shot block)
;     $CBF6: PLM $D080 (shot/bombed/grappled reaction, shootable, BTS 7. 2x2 shot block)
;     $CCC1: 2x2 respawning bomb block
;     $CD41: 2x2 bomb block
    dw $0002,$0053,$0053
    db $00,$01
    dw $0002,$0053,$0053
    dw $0000

DrawInst_Respawn2x2_1:
; Used by instruction lists:
;     $CA66: PLM $D050 (collision reaction, special, BTS 3. 2x2 respawning crumble block)
;     $CACA: PLM $D060 (collision reaction, special, BTS 7. 2x2 crumble block)
;     $CB4C: PLM $D070 (shot/bombed/grappled reaction, shootable, BTS 3. 2x2 respawning shot block)
;     $CBF6: PLM $D080 (shot/bombed/grappled reaction, shootable, BTS 7. 2x2 shot block)
;     $CCC1: 2x2 respawning bomb block
;     $CD41: 2x2 bomb block
    dw $0002,$0054,$0054
    db $00,$01
    dw $0002,$0054,$0054
    dw $0000

DrawInst_Respawn2x2_2:
; Used by instruction lists:
;     $CA66: PLM $D050 (collision reaction, special, BTS 3. 2x2 respawning crumble block)
;     $CACA: PLM $D060 (collision reaction, special, BTS 7. 2x2 crumble block)
;     $CB4C: PLM $D070 (shot/bombed/grappled reaction, shootable, BTS 3. 2x2 respawning shot block)
;     $CBF6: PLM $D080 (shot/bombed/grappled reaction, shootable, BTS 7. 2x2 shot block)
;     $CCC1: 2x2 respawning bomb block
;     $CD41: 2x2 bomb block
    dw $0002,$0055,$0055
    db $00,$01
    dw $0002,$0055,$0055
    dw $0000

DrawInst_Respawn2x2_3:
; Used by instruction lists:
;     $CA66: PLM $D050 (collision reaction, special, BTS 3. 2x2 respawning crumble block)
;     $CACA: PLM $D060 (collision reaction, special, BTS 7. 2x2 crumble block)
;     $CB4C: PLM $D070 (shot/bombed/grappled reaction, shootable, BTS 3. 2x2 respawning shot block)
;     $CBF6: PLM $D080 (shot/bombed/grappled reaction, shootable, BTS 7. 2x2 shot block)
;     $CCC1: 2x2 respawning bomb block
;     $CD41: 2x2 bomb block
    dw $0002,$00FF,$00FF
    db $00,$01
    dw $0002,$00FF,$00FF
    dw $0000


DrawInst_ItemShotBlock_0:
; Used by instruction lists:
;     $E007: Item shot block
;     $E020: Item shot block reconcealing
    dw $0001,$8053
    dw $0000

DrawInst_ItemShotBlock_1:
; Used by instruction lists:
;     $E007: Item shot block
;     $E020: Item shot block reconcealing
    dw $0001,$8054
    dw $0000

DrawInst_ItemShotBlock_2:
; Used by instruction lists:
;     $E007: Item shot block
;     $E020: Item shot block reconcealing
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
; Used by instruction list $C8D4: PLM $CFEC (unused. Draws 1x1 shot block)
    dw $0001,$C052
    dw $0000
endif ; !FEATURE_KEEP_UNREFERENCED

DrawInst_2x1RespawningShotBlock:
; Used by instruction lists:
;     $C8DA: PLM $CFF0 (unused. Draws 1x2 shot block)
;     $CB02: PLM $D068 (shot/bombed/grappled reaction, shootable, BTS 1. 2x1 respawning shot block)
    dw $0002,$C096,$5097
    dw $0000

DrawInst_1x2RespawningShotBlock:
; Used by instruction lists:
;     $C8E0: PLM $CFF4 (unused. Draws 2x1 shot block)
;     $CB27: PLM $D06C (shot/bombed/grappled reaction, shootable, BTS 2. 1x2 respawning shot block)
    dw $8002,$C098,$D0B8
    dw $0000

DrawInst_2x2RespawningShotBlock:
; Used by instruction lists:
;     $C8E6: PLM $CFF8 (unused. Draws 2x2 shot block)
;     $CB4C: PLM $D070 (shot/bombed/grappled reaction, shootable, BTS 3. 2x2 respawning shot block)
    dw $0002,$C099,$509A
    db $00,$01
    dw $0002,$D0B9,$D0BA
    dw $0000


DrawInst_1x1RespawningCrumbleBlock:
; Used by instruction list $C8EC: PLM $CFFC (bomb reaction, special block, BTS 0/4. 1x1 (respawning) crumble block)
    dw $0001,$B0BC
    dw $0000

DrawInst_2x1RespawningCrumbleBlock:
; Used by instruction lists:
;     $C8F2: PLM $D000 (bomb reaction, special block, BTS 1/5. 2x1 (respawning) crumble block)
;     $CA1C: PLM $D048 (collision reaction, special, BTS 1. 2x1 respawning crumble block)
    dw $0002,$B0BC,$50BC
    dw $0000

DrawInst_1x2RespawningCrumbleBlock:
; Used by instruction lists:
;     $C8F8: PLM $D004 (bomb reaction, special block, BTS 2/6. 1x2 (respawning) crumble block)
;     $CA41: PLM $D04C (collision reaction, special, BTS 2. 1x2 respawning crumble block)
    dw $8002,$B0BC,$D0BC
    dw $0000

DrawInst_2x2RespawningCrumbleBlock:
; Used by instruction lists:
;     $C8FE: PLM $D008 (bomb reaction, special block, BTS 3/7. 2x2 (respawning) crumble block)
;     $CA66: PLM $D050 (collision reaction, special, BTS 3. 2x2 respawning crumble block)
    dw $0002,$B0BC,$50BC
    db $00,$01
    dw $0002,$D0BC,$D0BC
    dw $0000


if !FEATURE_KEEP_UNREFERENCED
UNUSED_DrawInst_84A4C1:
; Used by instruction list $C904: PLM $D00C (unused)
    dw $0001,$F058
    dw $0000
endif ; !FEATURE_KEEP_UNREFERENCED

DrawInst_2x1RespawningBombBlock:
; Used by instruction lists:
;     $C90A: PLM $D010 (unused)
;     $CC69: 2x1 respawning bomb block
    dw $0002,$F058,$5058
    dw $0000

DrawInst_1x2RespawningBombBlock:
; Used by instruction lists:
;     $C910: PLM $D014 (unused)
;     $CC95: 1x2 respawning bomb block
    dw $8002,$F058,$D058
    dw $0000

DrawInst_2x2RespawningBombBlock:
; Used by instruction lists:
;     $C916: PLM $D018 (unused)
;     $CCC1: 2x2 respawning bomb block
    dw $0002,$F058,$5058
    db $00,$01
    dw $0002,$D058,$D058
    dw $0000


UNUSED_DrawInst_PowerBombBlockBombed_84A4E7:
; Used by instruction list $C91C: PLM $D01C (unused) / power bomb block bombed
    dw $0001,$C057
    dw $0000

UNUSED_DrawInst_SuperMissileBlockBombed_84A4ED:
; Used by instruction list $C922: PLM $D020 (unused) / super missile block bombed
    dw $0001,$C09F
    dw $0000

DrawInst_BombReactionSpeedBlock:
; Used by instruction list $C928: PLM $D024 (bomb reaction, special block, BTS Eh/Fh / Brinstar 82h/83h/84h/85h. Speed block)
    dw $0001,$B0B6
    dw $0000


DrawInst_BreakableGrappleBlock_0:
; Used by instruction lists:
;     $CD6A: PLM $D0DC (grappled reaction, grapple block, BTS 1. Respawning breakable grapple block)
;     $CDA9: PLM $D0E0 (grappled reaction, grapple block, BTS 2. Breakable grapple block)
;     $D135: PLM $D13B (unused. Grapple block)
    dw $0001,$E0B7
    dw $0000

DrawInst_BreakableGrappleBlock_1:
; Used by instruction lists:
;     $CD6A: PLM $D0DC (grappled reaction, grapple block, BTS 1. Respawning breakable grapple block)
;     $CDA9: PLM $D0E0 (grappled reaction, grapple block, BTS 2. Breakable grapple block)
    dw $0001,$0053
    dw $0000

DrawInst_BreakableGrappleBlock_2:
; Used by instruction lists:
;     $CD6A: PLM $D0DC (grappled reaction, grapple block, BTS 1. Respawning breakable grapple block)
;     $CDA9: PLM $D0E0 (grappled reaction, grapple block, BTS 2. Breakable grapple block)
    dw $0001,$0054
    dw $0000

DrawInst_BreakableGrappleBlock_3:
; Used by instruction lists:
;     $CD6A: PLM $D0DC (grappled reaction, grapple block, BTS 1. Respawning breakable grapple block)
;     $CDA9: PLM $D0E0 (grappled reaction, grapple block, BTS 2. Breakable grapple block)
    dw $0001,$0055
    dw $0000

DrawInst_BreakableGrappleBlock_4:
; Used by instruction lists:
;     $CD6A: PLM $D0DC (grappled reaction, grapple block, BTS 1. Respawning breakable grapple block)
;     $CDA9: PLM $D0E0 (grappled reaction, grapple block, BTS 2. Breakable grapple block)
    dw $0001,$00FF
    dw $0000


DrawInst_DownwardsGateOpen:
; Used by instruction list $BC13: PLM $C826 (downwards open gate)
    dw $8005,$C0D6,$00FF,$00FF,$00FF,$00FF
    dw $0000

DrawInst_DownwardsGateOpenClosed_0:
; Used by instruction lists:
;     $BC13: PLM $C826 (downwards open gate)
;     $BC3A: PLM $C82A (downwards closed gate)
    dw $8005,$C0D7,$C0FF,$00FF,$00FF,$00FF
    dw $0000

DrawInst_DownwardsGateOpenClosed_1:
; Used by instruction lists:
;     $BC13: PLM $C826 (downwards open gate)
;     $BC3A: PLM $C82A (downwards closed gate)
    dw $8005,$C0D7,$C0FF,$C0FF,$00FF,$00FF
    dw $0000

DrawInst_DownwardsGateOpenClosed_2:
; Used by instruction lists:
;     $BC13: PLM $C826 (downwards open gate)
;     $BC3A: PLM $C82A (downwards closed gate)
    dw $8005,$C0D7,$C0FF,$C0FF,$C0FF,$00FF
    dw $0000

DrawInst_DownwardsGateOpenClosed_3:
; Used by instruction lists:
;     $BC13: PLM $C826 (downwards open gate)
;     $BC3A: PLM $C82A (downwards closed gate)
    dw $8005,$C0D7,$C0FF,$C0FF,$C0FF,$C0FF
    dw $0000

DrawInst_DownwardsGateClosed:
; Used by instruction list $BC3A: PLM $C82A (downwards closed gate)
    dw $8005,$C0D6,$C0FF,$C0FF,$C0FF,$C0FF
    dw $0000

DrawInst_UpwardsGateOpen:
; Used by instruction list $BC61: PLM $C82E (upwards open gate)
    dw $8001,$C0D6
    db $00,$FC
    dw $8004,$00FF,$00FF,$00FF,$00FF
    dw $0000

DrawInst_UpwardsGateOpenClosed_0:
; Used by instruction lists:
;     $BC61: PLM $C82E (upwards open gate)
;     $BC88: PLM $C832 (upwards closed gate)
    dw $8001,$C0D7
    db $00,$FC
    dw $8004,$00FF,$00FF,$00FF,$80FF
    dw $0000

DrawInst_UpwardsGateOpenClosed_1:
; Used by instruction lists:
;     $BC61: PLM $C82E (upwards open gate)
;     $BC88: PLM $C832 (upwards closed gate)
    dw $8001,$C0D7
    db $00,$FC
    dw $8004,$00FF,$00FF,$C0FF,$C0FF
    dw $0000

DrawInst_UpwardsGateOpenClosed_2:
; Used by instruction lists:
;     $BC61: PLM $C82E (upwards open gate)
;     $BC88: PLM $C832 (upwards closed gate)
    dw $8001,$C0D7
    db $00,$FC
    dw $8004,$00FF,$C0FF,$C0FF,$C0FF
    dw $0000

DrawInst_UpwardsGateOpenClosed_3:
; Used by instruction lists:
;     $BC61: PLM $C82E (upwards open gate)
;     $BC88: PLM $C832 (upwards closed gate)
    dw $8001,$C0D7
    db $00,$FC
    dw $8004,$C0FF,$C0FF,$C0FF,$C0FF
    dw $0000

DrawInst_UpwardsGateClosed:
; Used by instruction list $BC88: PLM $C832 (upwards closed gate)
    dw $8001,$C0D6
    db $00,$FC
    dw $8004,$C0FF,$C0FF,$C0FF,$C0FF
    dw $0000

DrawInst_GateShotblockDownwardsBlueLeft:
; Used by instruction list $BCAF: PLM $C836 (downwards gate shotblock) - blue left
    dw $0001,$80D6
    db $FF,$00
    dw $0001,$C0DB
    dw $0000

DrawInst_GateShotblockDownwardsBlueRight:
; Used by instruction list $BCB5: PLM $C836 (downwards gate shotblock) - blue right
    dw $0002,$80D6,$C4DB
    dw $0000

DrawInst_GateShotblockDownwardsRedLeft:
; Used by instruction list $BCBB: PLM $C836 (downwards gate shotblock) - red left
    dw $0001,$80D6
    db $FF,$00
    dw $0001,$C0DA
    dw $0000

DrawInst_GateShotblockDownwardsRedRight:
; Used by instruction list $BCC1: PLM $C836 (downwards gate shotblock) - red right
    dw $0002,$80D6,$C4DA
    dw $0000

DrawInst_GateShotblockDownwardsGreenLeft:
; Used by instruction list $BCC7: PLM $C836 (downwards gate shotblock) - green left
    dw $0001,$80D6
    db $FF,$00
    dw $0001,$C0D9
    dw $0000

DrawInst_GateShotblockDownwardsGreenRight:
; Used by instruction list $BCCD: PLM $C836 (downwards gate shotblock) - green right
    dw $0002,$80D6,$C4D9
    dw $0000

DrawInst_GateShotblockDownwardsYellowLeft:
; Used by instruction list $BCD3: PLM $C836 (downwards gate shotblock) - yellow left
    dw $0001,$80D6
    db $FF,$00
    dw $0001,$C0D8
    dw $0000

DrawInst_GateShotblockDownwardsYellowRight:
; Used by instruction list $BCD9: PLM $C836 (downwards gate shotblock) - yellow right
    dw $0002,$80D6,$C4D8
    dw $0000

DrawInst_GateShotblockUpwardsBlueLeft:
; Used by instruction list $BCDF: PLM $C83A (upwards gate shotblock) - blue left
    dw $0001,$88D6
    db $FF,$00
    dw $0001,$C8DB
    dw $0000

DrawInst_GateShotblockUpwardsBlueRight:
; Used by instruction list $BCE5: PLM $C83A (upwards gate shotblock) - blue right
    dw $0002,$88D6,$CCDB
    dw $0000

DrawInst_GateShotblockUpwardsRedLeft:
; Used by instruction list $BCEB: PLM $C83A (upwards gate shotblock) - red left
    dw $0001,$88D6
    db $FF,$00
    dw $0001,$C8DA
    dw $0000

DrawInst_GateShotblockUpwardsRedRight:
; Used by instruction list $BCF1: PLM $C83A (upwards gate shotblock) - red right
    dw $0002,$88D6,$CCDA
    dw $0000

DrawInst_GateShotblockUpwardsGreenLeft:
; Used by instruction list $BCF7: PLM $C83A (upwards gate shotblock) - green left
    dw $0001,$88D6
    db $FF,$00
    dw $0001,$C8D9
    dw $0000

DrawInst_GateShotblockUpwardsGreenRight:
; Used by instruction list $BCFD: PLM $C83A (upwards gate shotblock) - green right
    dw $0002,$88D6,$CCD9
    dw $0000

DrawInst_GateShotblockUpwardsYellowLeft:
; Used by instruction list $BD03: PLM $C83A (upwards gate shotblock) - yellow left
    dw $0001,$88D6
    db $FF,$00
    dw $0001,$C8D8
    dw $0000

DrawInst_GateShotblockUpwardsYellowRight:
; Used by instruction list $BD09: PLM $C83A (upwards gate shotblock) - yellow right
    dw $0002,$88D6,$CCD8
    dw $0000


DrawInst_DoorFacingLeft_A677:
; Used by instruction lists:
;     $BE59: Door $C842 (grey door facing left)
;     $BE70: Door $C842 (grey door facing left)
;     $BFFD: Door $C85A (yellow door facing left)
;     $C014: Door $C85A (yellow door facing left)
;     $C185: Door $C872 (green door facing left)
;     $C19C: Door $C872 (green door facing left)
;     $C301: Door $C88A (red door facing left)
;     $C318: Door $C88A (red door facing left)
;     $C489: Door $C8A2 (shot/bombed/grappled reaction, shootable, BTS 40h. Blue door facing left)
;     $C49E: Door $C8A2 (shot/bombed/grappled reaction, shootable, BTS 40h. Blue door facing left)
    dw $8004,$0082,$00A2,$08A2,$0882
    dw $0000

DrawInst_DoorFacingRight_A683:
; Used by instruction lists:
;     $BA4C: PLM $BAF4 (Bomb Torizo grey door)
;     $BA7F: PLM $BAF4 (Bomb Torizo grey door)
;     $BEC2: Door $C848 (grey door facing right)
;     $BED9: Door $C848 (grey door facing right)
;     $C060: Door $C860 (yellow door facing right)
;     $C077: Door $C860 (yellow door facing right)
;     $C1E4: Door $C878 (green door facing right)
;     $C1FB: Door $C878 (green door facing right)
;     $C363: Door $C890 (red door facing right)
;     $C37A: Door $C890 (red door facing right)
;     $C4BA: Door $C8A8 (shot/bombed/grappled reaction, shootable, BTS 41h. Blue door facing right)
;     $C4CF: Door $C8A8 (shot/bombed/grappled reaction, shootable, BTS 41h. Blue door facing right)
    dw $8004,$0482,$04A2,$0CA2,$0C82
    dw $0000

DrawInst_DoorFacingUp_A68F:
; Used by instruction lists:
;     $BF2B: Door $C84E (grey door facing up)
;     $BF42: Door $C84E (grey door facing up)
;     $C0C3: Door $C866 (yellow door facing up)
;     $C0DA: Door $C866 (yellow door facing up)
;     $C243: Door $C87E (green door facing up)
;     $C25A: Door $C87E (green door facing up)
;     $C3C5: Door $C896 (red door facing up)
;     $C3DC: Door $C896 (red door facing up)
;     $C4EB: Door $C8AE (shot/bombed/grappled reaction, shootable, BTS 42h. Blue door facing up)
;     $C500: Door $C8AE (shot/bombed/grappled reaction, shootable, BTS 42h. Blue door facing up)
    dw $0004,$0484,$0483,$0083,$0084
    dw $0000

DrawInst_DoorFacingDown_A69B:
; Used by instruction lists:
;     $BF94: Door $C854 (grey door facing down)
;     $BFAB: Door $C854 (grey door facing down)
;     $C122: Door $C86C (yellow door facing down)
;     $C139: Door $C86C (yellow door facing down)
;     $C2A2: Door $C884 (green door facing down)
;     $C2B9: Door $C884 (green door facing down)
;     $C427: Door $C89C (red door facing down)
;     $C43E: Door $C89C (red door facing down)
;     $C51C: Door $C8B4 (shot/bombed/grappled reaction, shootable, BTS 43h. Blue door facing down)
;     $C531: Door $C8B4 (shot/bombed/grappled reaction, shootable, BTS 43h. Blue door facing down)
    dw $0004,$0C84,$0C83,$0883,$0884
    dw $0000


DrawInst_GreyDoorFacingLeft_0:
; Used by instruction lists:
;     $BE59: Door $C842 (grey door facing left)
;     $BE70: Door $C842 (grey door facing left)
    dw $8004,$C0AE,$D0CE,$D8CE,$D8AE
    dw $0000

DrawInst_GreyDoorFacingLeft_1:
; Used by instruction lists:
;     $BE59: Door $C842 (grey door facing left)
;     $BE70: Door $C842 (grey door facing left)
    dw $8004,$80AF,$80CF,$88CF,$88AF
    dw $0000

DrawInst_GreyDoorFacingLeft_2:
; Used by instruction lists:
;     $BE59: Door $C842 (grey door facing left)
;     $BE70: Door $C842 (grey door facing left)
    dw $8004,$80B0,$80D0,$88D0,$88B0
    dw $0000

DrawInst_GreyDoorFacingLeft_3:
; Used by instruction lists:
;     $BE59: Door $C842 (grey door facing left)
;     $BE70: Door $C842 (grey door facing left)
    dw $8004,$80B1,$00D1,$08D1,$88B1
    dw $0000


DrawInst_GreyDoorFacingRight_0:
; Used by instruction lists:
;     $BA4C: PLM $BAF4 (Bomb Torizo grey door)
;     $BA7F: PLM $BAF4 (Bomb Torizo grey door)
;     $BEC2: Door $C848 (grey door facing right)
;     $BED9: Door $C848 (grey door facing right)
    dw $8004,$C4AE,$D4CE,$DCCE,$DCAE
    dw $0000

DrawInst_GreyDoorFacingRight_1:
; Used by instruction lists:
;     $BA4C: PLM $BAF4 (Bomb Torizo grey door)
;     $BA7F: PLM $BAF4 (Bomb Torizo grey door)
;     $BEC2: Door $C848 (grey door facing right)
;     $BED9: Door $C848 (grey door facing right)
    dw $8004,$84AF,$84CF,$8CCF,$8CAF
    dw $0000

DrawInst_GreyDoorFacingRight_2:
; Used by instruction lists:
;     $BA4C: PLM $BAF4 (Bomb Torizo grey door)
;     $BA7F: PLM $BAF4 (Bomb Torizo grey door)
;     $BEC2: Door $C848 (grey door facing right)
;     $BED9: Door $C848 (grey door facing right)
    dw $8004,$84B0,$84D0,$8CD0,$8CB0
    dw $0000

DrawInst_GreyDoorFacingRight_3:
; Used by instruction lists:
;     $BA4C: PLM $BAF4 (Bomb Torizo grey door)
;     $BA7F: PLM $BAF4 (Bomb Torizo grey door)
;     $BEC2: Door $C848 (grey door facing right)
;     $BED9: Door $C848 (grey door facing right)
    dw $8004,$84B1,$84D1,$8CD1,$8CB1
    dw $0000


DrawInst_GreyDoorFacingUp_0:
; Used by instruction lists:
;     $BF2B: Door $C84E (grey door facing up)
;     $BF42: Door $C84E (grey door facing up)
    dw $0004,$C4B3,$54B2,$50B2,$50B3
    dw $0000

DrawInst_GreyDoorFacingUp_1:
; Used by instruction lists:
;     $BF2B: Door $C84E (grey door facing up)
;     $BF42: Door $C84E (grey door facing up)
    dw $0004,$84D3,$84D2,$80D2,$80D3
    dw $0000

DrawInst_GreyDoorFacingUp_2:
; Used by instruction lists:
;     $BF2B: Door $C84E (grey door facing up)
;     $BF42: Door $C84E (grey door facing up)
    dw $0004,$84B5,$84B4,$80B4,$80B5
    dw $0000

DrawInst_GreyDoorFacingUp_3:
; Used by instruction lists:
;     $BF2B: Door $C84E (grey door facing up)
;     $BF42: Door $C84E (grey door facing up)
    dw $0004,$84D5,$84D4,$80D4,$80D5
    dw $0000


DrawInst_GreyDoorFacingDown_0:
; Used by instruction lists:
;     $BF94: Door $C854 (grey door facing down)
;     $BFAB: Door $C854 (grey door facing down)
    dw $0004,$CCB3,$5CB2,$58B2,$58B3
    dw $0000

DrawInst_GreyDoorFacingDown_1:
; Used by instruction lists:
;     $BF94: Door $C854 (grey door facing down)
;     $BFAB: Door $C854 (grey door facing down)
    dw $0004,$8CD3,$8CD2,$88D2,$88D3
    dw $0000

DrawInst_GreyDoorFacingDown_2:
; Used by instruction lists:
;     $BF94: Door $C854 (grey door facing down)
;     $BFAB: Door $C854 (grey door facing down)
    dw $0004,$8CB5,$8CB4,$88B4,$88B5
    dw $0000

DrawInst_GreyDoorFacingDown_3:
; Used by instruction lists:
;     $BF94: Door $C854 (grey door facing down)
;     $BFAB: Door $C854 (grey door facing down)
    dw $0004,$8CD5,$0CD4,$08D4,$88D5
    dw $0000


DrawInst_YellowDoorFacingLeft_0:
; Used by instruction lists:
;     $BFFD: Door $C85A (yellow door facing left)
;     $C014: Door $C85A (yellow door facing left)
    dw $8004,$C000,$D020,$D820,$D800
    dw $0000

DrawInst_YellowDoorFacingLeft_1:
; Used by instruction lists:
;     $BFFD: Door $C85A (yellow door facing left)
;     $C014: Door $C85A (yellow door facing left)
    dw $8004,$8001,$8021,$8821,$8801
    dw $0000

DrawInst_YellowDoorFacingLeft_2:
; Used by instruction lists:
;     $BFFD: Door $C85A (yellow door facing left)
;     $C014: Door $C85A (yellow door facing left)
    dw $8004,$8002,$8022,$8822,$8802
    dw $0000

DrawInst_YellowDoorFacingLeft_3:
; Used by instruction lists:
;     $BFFD: Door $C85A (yellow door facing left)
;     $C014: Door $C85A (yellow door facing left)
    dw $8004,$8003,$0023,$0823,$8803
    dw $0000


DrawInst_YellowDoorFacingRight_0:
; Used by instruction lists:
;     $C060: Door $C860 (yellow door facing right)
;     $C077: Door $C860 (yellow door facing right)
    dw $8004,$C400,$D420,$DC20,$DC00
    dw $0000

DrawInst_YellowDoorFacingRight_1:
; Used by instruction lists:
;     $C060: Door $C860 (yellow door facing right)
;     $C077: Door $C860 (yellow door facing right)
    dw $8004,$8401,$8421,$8C21,$8C01
    dw $0000

DrawInst_YellowDoorFacingRight_2:
; Used by instruction lists:
;     $C060: Door $C860 (yellow door facing right)
;     $C077: Door $C860 (yellow door facing right)
    dw $8004,$8402,$8422,$8C22,$8C02
    dw $0000

DrawInst_YellowDoorFacingRight_3:
; Used by instruction lists:
;     $C060: Door $C860 (yellow door facing right)
;     $C077: Door $C860 (yellow door facing right)
    dw $8004,$8403,$8423,$8C23,$8C03
    dw $0000


DrawInst_YellowDoorFacingUp_0:
; Used by instruction lists:
;     $C0C3: Door $C866 (yellow door facing up)
;     $C0DA: Door $C866 (yellow door facing up)
    dw $0004,$C411,$5410,$5010,$5011
    dw $0000

DrawInst_YellowDoorFacingUp_1:
; Used by instruction lists:
;     $C0C3: Door $C866 (yellow door facing up)
;     $C0DA: Door $C866 (yellow door facing up)
    dw $0004,$8431,$8430,$8030,$8031
    dw $0000

DrawInst_YellowDoorFacingUp_2:
; Used by instruction lists:
;     $C0C3: Door $C866 (yellow door facing up)
;     $C0DA: Door $C866 (yellow door facing up)
    dw $0004,$8413,$8412,$8012,$8013
    dw $0000

DrawInst_YellowDoorFacingUp_3:
; Used by instruction lists:
;     $C0C3: Door $C866 (yellow door facing up)
;     $C0DA: Door $C866 (yellow door facing up)
    dw $0004,$8433,$8432,$8032,$8033
    dw $0000


DrawInst_YellowDoorFacingDown_0:
; Used by instruction lists:
;     $C122: Door $C86C (yellow door facing down)
;     $C139: Door $C86C (yellow door facing down)
    dw $0004,$CC11,$5C10,$5810,$5811
    dw $0000

DrawInst_YellowDoorFacingDown_1:
; Used by instruction lists:
;     $C122: Door $C86C (yellow door facing down)
;     $C139: Door $C86C (yellow door facing down)
    dw $0004,$8C31,$8C30,$8830,$8831
    dw $0000

DrawInst_YellowDoorFacingDown_2:
; Used by instruction lists:
;     $C122: Door $C86C (yellow door facing down)
;     $C139: Door $C86C (yellow door facing down)
    dw $0004,$8C13,$8C12,$8812,$8813
    dw $0000

DrawInst_YellowDoorFacingDown_3:
; Used by instruction lists:
;     $C122: Door $C86C (yellow door facing down)
;     $C139: Door $C86C (yellow door facing down)
    dw $0004,$8C33,$0C32,$0832,$8833
    dw $0000


DrawInst_GreenDoorFacingLeft_0:
; Used by instruction lists:
;     $C185: Door $C872 (green door facing left)
;     $C19C: Door $C872 (green door facing left)
    dw $8004,$C004,$D024,$D824,$D804
    dw $0000

DrawInst_GreenDoorFacingLeft_1:
; Used by instruction lists:
;     $C185: Door $C872 (green door facing left)
;     $C19C: Door $C872 (green door facing left)
    dw $8004,$8005,$8025,$8825,$8805
    dw $0000

DrawInst_GreenDoorFacingLeft_2:
; Used by instruction lists:
;     $C185: Door $C872 (green door facing left)
;     $C19C: Door $C872 (green door facing left)
    dw $8004,$8006,$8026,$8826,$8806
    dw $0000

DrawInst_GreenDoorFacingLeft_3:
; Used by instruction lists:
;     $C185: Door $C872 (green door facing left)
;     $C19C: Door $C872 (green door facing left)
    dw $8004,$8007,$0027,$0827,$8807
    dw $0000


DrawInst_GreenDoorFacingRight_0:
; Used by instruction lists:
;     $C1E4: Door $C878 (green door facing right)
;     $C1FB: Door $C878 (green door facing right)
    dw $8004,$C404,$D424,$DC24,$DC04
    dw $0000

DrawInst_GreenDoorFacingRight_1:
; Used by instruction lists:
;     $C1E4: Door $C878 (green door facing right)
;     $C1FB: Door $C878 (green door facing right)
    dw $8004,$8405,$8425,$8C25,$8C05
    dw $0000

DrawInst_GreenDoorFacingRight_2:
; Used by instruction lists:
;     $C1E4: Door $C878 (green door facing right)
;     $C1FB: Door $C878 (green door facing right)
    dw $8004,$8406,$8426,$8C26,$8C06
    dw $0000

DrawInst_GreenDoorFacingRight_3:
; Used by instruction lists:
;     $C1E4: Door $C878 (green door facing right)
;     $C1FB: Door $C878 (green door facing right)
    dw $8004,$8407,$0427,$0C27,$8C07
    dw $0000


DrawInst_GreenDoorFacingUp_0:
; Used by instruction lists:
;     $C243: Door $C87E (green door facing up)
;     $C25A: Door $C87E (green door facing up)
    dw $0004,$C415,$5414,$5014,$5015
    dw $0000

DrawInst_GreenDoorFacingUp_1:
; Used by instruction lists:
;     $C243: Door $C87E (green door facing up)
;     $C25A: Door $C87E (green door facing up)
    dw $0004,$8435,$8434,$8034,$8035
    dw $0000

DrawInst_GreenDoorFacingUp_2:
; Used by instruction lists:
;     $C243: Door $C87E (green door facing up)
;     $C25A: Door $C87E (green door facing up)
    dw $0004,$8417,$8416,$8016,$8017
    dw $0000

DrawInst_GreenDoorFacingUp_3:
; Used by instruction lists:
;     $C243: Door $C87E (green door facing up)
;     $C25A: Door $C87E (green door facing up)
    dw $0004,$8437,$8436,$8036,$8037
    dw $0000


DrawInst_GreenDoorFacingDown_0:
; Used by instruction lists:
;     $C2A2: Door $C884 (green door facing down)
;     $C2B9: Door $C884 (green door facing down)
    dw $0004,$CC15,$5C14,$5814,$5815
    dw $0000

DrawInst_GreenDoorFacingDown_1:
; Used by instruction lists:
;     $C2A2: Door $C884 (green door facing down)
;     $C2B9: Door $C884 (green door facing down)
    dw $0004,$8C35,$8C34,$8834,$8835
    dw $0000

DrawInst_GreenDoorFacingDown_2:
; Used by instruction lists:
;     $C2A2: Door $C884 (green door facing down)
;     $C2B9: Door $C884 (green door facing down)
    dw $0004,$8C17,$8C16,$8816,$8817
    dw $0000

DrawInst_GreenDoorFacingDown_3:
; Used by instruction lists:
;     $C2A2: Door $C884 (green door facing down)
;     $C2B9: Door $C884 (green door facing down)
    dw $0004,$8C37,$8C36,$8836,$8837
    dw $0000


DrawInst_RedDoorFacingLeft_0:
; Used by instruction lists:
;     $C301: Door $C88A (red door facing left)
;     $C318: Door $C88A (red door facing left)
    dw $8004,$C008,$D028,$D828,$D808
    dw $0000

DrawInst_RedDoorFacingLeft_1:
; Used by instruction lists:
;     $C301: Door $C88A (red door facing left)
;     $C318: Door $C88A (red door facing left)
    dw $8004,$8009,$8029,$8829,$8809
    dw $0000

DrawInst_RedDoorFacingLeft_2:
; Used by instruction lists:
;     $C301: Door $C88A (red door facing left)
;     $C318: Door $C88A (red door facing left)
    dw $8004,$800A,$802A,$882A,$880A
    dw $0000

DrawInst_RedDoorFacingLeft_3:
; Used by instruction lists:
;     $C301: Door $C88A (red door facing left)
;     $C318: Door $C88A (red door facing left)
    dw $8004,$800B,$002B,$082B,$880B
    dw $0000


DrawInst_RedDoorFacingRight_0:
; Used by instruction lists:
;     $C363: Door $C890 (red door facing right)
;     $C37A: Door $C890 (red door facing right)
    dw $8004,$C408,$D428,$DC28,$DC08
    dw $0000

DrawInst_RedDoorFacingRight_1:
; Used by instruction lists:
;     $C363: Door $C890 (red door facing right)
;     $C37A: Door $C890 (red door facing right)
    dw $8004,$8409,$8429,$8C29,$8C09
    dw $0000

DrawInst_RedDoorFacingRight_2:
; Used by instruction lists:
;     $C363: Door $C890 (red door facing right)
;     $C37A: Door $C890 (red door facing right)
    dw $8004,$840A,$842A,$8C2A,$8C0A
    dw $0000

DrawInst_RedDoorFacingRight_3:
; Used by instruction lists:
;     $C363: Door $C890 (red door facing right)
;     $C37A: Door $C890 (red door facing right)
    dw $8004,$840B,$042B,$0C2B,$8C0B
    dw $0000


DrawInst_RedDoorFacingUp_0:
; Used by instruction lists:
;     $C3C5: Door $C896 (red door facing up)
;     $C3DC: Door $C896 (red door facing up)
    dw $0004,$C419,$5418,$5018,$5019
    dw $0000

DrawInst_RedDoorFacingUp_1:
; Used by instruction lists:
;     $C3C5: Door $C896 (red door facing up)
;     $C3DC: Door $C896 (red door facing up)
    dw $0004,$8439,$8438,$8038,$8039
    dw $0000

DrawInst_RedDoorFacingUp_2:
; Used by instruction lists:
;     $C3C5: Door $C896 (red door facing up)
;     $C3DC: Door $C896 (red door facing up)
    dw $0004,$841B,$841A,$801A,$801B
    dw $0000

DrawInst_RedDoorFacingUp_3:
; Used by instruction lists:
;     $C3C5: Door $C896 (red door facing up)
;     $C3DC: Door $C896 (red door facing up)
    dw $0004,$843B,$843A,$803A,$803B
    dw $0000


DrawInst_RedDoorFacingDown_0:
; Used by instruction lists:
;     $C427: Door $C89C (red door facing down)
;     $C43E: Door $C89C (red door facing down)
    dw $0004,$CC19,$5C18,$5818,$5819
    dw $0000

DrawInst_RedDoorFacingDown_1:
; Used by instruction lists:
;     $C427: Door $C89C (red door facing down)
;     $C43E: Door $C89C (red door facing down)
    dw $0004,$8C39,$8C38,$8838,$8839
    dw $0000

DrawInst_RedDoorFacingDown_2:
; Used by instruction lists:
;     $C427: Door $C89C (red door facing down)
;     $C43E: Door $C89C (red door facing down)
    dw $0004,$8C1B,$8C1A,$881A,$881B
    dw $0000

DrawInst_RedDoorFacingDown_3:
; Used by instruction lists:
;     $C427: Door $C89C (red door facing down)
;     $C43E: Door $C89C (red door facing down)
    dw $0004,$8C3B,$8C3A,$883A,$883B
    dw $0000


DrawInst_EyeDoorEyeFacingLeft:
; Used by instruction list $D81E: PLM $DB56 (eye door eye, facing left)
    dw $8004,$800C,$D02C,$D82C,$D80C
    dw $0000

DrawInst_DoorFacingLeft_A9B3:
; Used by instruction lists:
;     $BE70: Door $C842 (grey door facing left)
;     $C014: Door $C85A (yellow door facing left)
;     $C19C: Door $C872 (green door facing left)
;     $C318: Door $C88A (red door facing left)
;     $C4B1: Closed blue door facing left
    dw $8004,$C00C,$D02C,$D82C,$D80C
    dw $0000

DrawInst_BlueDoorFacingLeft_0:
; Used by instruction lists:
;     $C489: Door $C8A2 (shot/bombed/grappled reaction, shootable, BTS 40h. Blue door facing left)
;     $C49E: Door $C8A2 (shot/bombed/grappled reaction, shootable, BTS 40h. Blue door facing left)
    dw $8004,$800D,$802D,$882D,$880D
    dw $0000

DrawInst_BlueDoorFacingLeft_1:
; Used by instruction lists:
;     $C489: Door $C8A2 (shot/bombed/grappled reaction, shootable, BTS 40h. Blue door facing left)
;     $C49E: Door $C8A2 (shot/bombed/grappled reaction, shootable, BTS 40h. Blue door facing left)
    dw $8004,$800E,$802E,$882E,$880E
    dw $0000

DrawInst_BlueDoorFacingLeft_2:
; Used by instruction lists:
;     $C489: Door $C8A2 (shot/bombed/grappled reaction, shootable, BTS 40h. Blue door facing left)
;     $C49E: Door $C8A2 (shot/bombed/grappled reaction, shootable, BTS 40h. Blue door facing left)
    dw $8004,$800F,$002F,$082F,$880F
    dw $0000


DrawInst_EyeDoorEyeFacingRight:
; Used by instruction list $D955: PLM $DB48 (eye door eye, facing right)
    dw $8004,$840C,$D42C,$DC2C,$DC0C
    dw $0000

DrawInst_DoorFacingRight_A9EF:
; Used by instruction lists:
;     $BA7F: PLM $BAF4 (Bomb Torizo grey door)
;     $BED9: Door $C848 (grey door facing right)
;     $C077: Door $C860 (yellow door facing right)
;     $C1FB: Door $C878 (green door facing right)
;     $C37A: Door $C890 (red door facing right)
;     $C4E2: Closed blue door facing right
    dw $8004,$C40C,$D42C,$DC2C,$DC0C
    dw $0000

DrawInst_BlueDoorFacingRight_0:
; Used by instruction lists:
;     $C4BA: Door $C8A8 (shot/bombed/grappled reaction, shootable, BTS 41h. Blue door facing right)
;     $C4CF: Door $C8A8 (shot/bombed/grappled reaction, shootable, BTS 41h. Blue door facing right)
    dw $8004,$840D,$842D,$8C2D,$8C0D
    dw $0000

DrawInst_BlueDoorFacingRight_1:
; Used by instruction lists:
;     $C4BA: Door $C8A8 (shot/bombed/grappled reaction, shootable, BTS 41h. Blue door facing right)
;     $C4CF: Door $C8A8 (shot/bombed/grappled reaction, shootable, BTS 41h. Blue door facing right)
    dw $8004,$840E,$842E,$8C2E,$8C0E
    dw $0000

DrawInst_BlueDoorFacingRight_2:
; Used by instruction lists:
;     $C4BA: Door $C8A8 (shot/bombed/grappled reaction, shootable, BTS 41h. Blue door facing right)
;     $C4CF: Door $C8A8 (shot/bombed/grappled reaction, shootable, BTS 41h. Blue door facing right)
    dw $8004,$840F,$042F,$0C2F,$8C0F
    dw $0000


if !FEATURE_KEEP_UNREFERENCED
UNUSED_DrawInst_84AA1F:
    dw $0004,$841D,$541C,$501C,$501D
    dw $0000
endif ; !FEATURE_KEEP_UNREFERENCED


DrawInst_DoorFacingUp_AA2B:
; Used by instruction lists:
;     $BF42: Door $C84E (grey door facing up)
;     $C0DA: Door $C866 (yellow door facing up)
;     $C25A: Door $C87E (green door facing up)
;     $C3DC: Door $C896 (red door facing up)
;     $C513: Closed blue door facing up
    dw $0004,$C41D,$541C,$501C,$501D
    dw $0000


DrawInst_BlueDoorFacingUp_0:
; Used by instruction lists:
;     $C4EB: Door $C8AE (shot/bombed/grappled reaction, shootable, BTS 42h. Blue door facing up)
;     $C500: Door $C8AE (shot/bombed/grappled reaction, shootable, BTS 42h. Blue door facing up)
    dw $0004,$843D,$843C,$803C,$803D
    dw $0000

DrawInst_BlueDoorFacingUp_1:
; Used by instruction lists:
;     $C4EB: Door $C8AE (shot/bombed/grappled reaction, shootable, BTS 42h. Blue door facing up)
;     $C500: Door $C8AE (shot/bombed/grappled reaction, shootable, BTS 42h. Blue door facing up)
    dw $0004,$841F,$841E,$801E,$801F
    dw $0000

DrawInst_BlueDoorFacingUp_2:
; Used by instruction lists:
;     $C4EB: Door $C8AE (shot/bombed/grappled reaction, shootable, BTS 42h. Blue door facing up)
;     $C500: Door $C8AE (shot/bombed/grappled reaction, shootable, BTS 42h. Blue door facing up)
    dw $0004,$843F,$843E,$803E,$803F
    dw $0000


if !FEATURE_KEEP_UNREFERENCED
UNUSED_DrawInst_84AA5B:
    dw $0004,$8C1D,$5C1C,$581C,$581D
    dw $0000
endif ; !FEATURE_KEEP_UNREFERENCED


DrawInst_DoorFacingDown_AA67:
; Used by instruction lists:
;     $BFAB: Door $C854 (grey door facing down)
;     $C139: Door $C86C (yellow door facing down)
;     $C2B9: Door $C884 (green door facing down)
;     $C43E: Door $C89C (red door facing down)
;     $C544: Closed blue door facing down
    dw $0004,$CC1D,$5C1C,$581C,$581D
    dw $0000

DrawInst_BlueDoorFacingDown_0:
; Used by instruction lists:
;     $C51C: Door $C8B4 (shot/bombed/grappled reaction, shootable, BTS 43h. Blue door facing down)
;     $C531: Door $C8B4 (shot/bombed/grappled reaction, shootable, BTS 43h. Blue door facing down)
    dw $0004,$8C3D,$8C3C,$883C,$883D
    dw $0000

DrawInst_BlueDoorFacingDown_1:
; Used by instruction lists:
;     $C51C: Door $C8B4 (shot/bombed/grappled reaction, shootable, BTS 43h. Blue door facing down)
;     $C531: Door $C8B4 (shot/bombed/grappled reaction, shootable, BTS 43h. Blue door facing down)
    dw $0004,$8C1F,$8C1E,$881E,$881F
    dw $0000

DrawInst_BlueDoorFacingDown_2:
; Used by instruction lists:
;     $C51C: Door $C8B4 (shot/bombed/grappled reaction, shootable, BTS 43h. Blue door facing down)
;     $C531: Door $C8B4 (shot/bombed/grappled reaction, shootable, BTS 43h. Blue door facing down)
    dw $0004,$8C3F,$8C3E,$883E,$883F
    dw $0000


DrawInst_ElevatorPlatform_0:
; Used by instruction list $AFB6: PLM $B70B (elevator platform)
    dw $0001,$8085
    db $03,$00
    dw $0001,$8485
    db $00,$01
    dw $0004,$8088,$8089,$8489,$8488
    dw $0000

DrawInst_ElevatorPlatform_1:
; Used by instruction list $AFB6: PLM $B70B (elevator platform)
    dw $0001,$8086
    db $03,$00
    dw $0001,$8486
    db $00,$01
    dw $0004,$808A,$808B,$848B,$848A
    dw $0000

DrawInst_ElevatorPlatform_2:
; Used by instruction list $AFB6: PLM $B70B (elevator platform)
    dw $0001,$8087
    db $03,$00
    dw $0001,$8487
    db $00,$01
    dw $0004,$808C,$808D,$848D,$848C
    dw $0000


if !FEATURE_KEEP_UNREFERENCED
;;; $AADF: Unused. Instruction list - draw empty tile ;;;
UNUSED_InstList_PLM_DrawEmptyTile_84AADF:
    dw $0001,DrawInst_ItemChozoOrb
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $AAE3: Instruction list - delete ;;;
InstList_PLM_Delete:
    dw Instruction_PLM_Delete


;;; $AAE5: Instruction list - PLM $B773 (crumble access to Tourian elevator) ;;;
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


;;; $AB00: Instruction - move PLM down one block ;;;
Instruction_PLM_MovePLMDown1Block_84AB00:
;; Parameters:
;;     X: PLM index

; Clone of UNUSED_Instruction_PLM_MovePLMDown1Block_848D89
    LDA.W RoomWidthBlocks : ASL : CLC : ADC.W PLM_BlockIndices,X : STA.W PLM_BlockIndices,X
    RTS


;;; $AB0C: Instruction list - PLM $B777 (clear access to Tourian elevator) ;;;
InstList_PLM_ClearAccessToTourianElevator:
    dw $0001,DrawInst_ClearAccessToTourianElevator
    dw Instruction_PLM_Delete


;;; $AB12: Instruction list - PLM $B78F (crumble Spore Spawn ceiling) ;;;
InstList_PLM_CrumbleSporeSpawnCeiling:
    dw Instruction_PLM_QueueSound_Y_Lib2_Max6 : db $0A
    dw $0004,DrawInst_CrumbleSporeSpawnCeiling_0
    dw $0004,DrawInst_CrumbleSporeSpawnCeiling_1
    dw $0004,DrawInst_CrumbleSporeSpawnCeiling_2


;;; $AB21: Instruction list - PLM $B793 (clear Spore Spawn ceiling) ;;;
InstList_PLM_ClearSporeSpawnCeiling:
    dw $0004,DrawInst_ClearSporeSpawnCeiling
    dw Instruction_PLM_Delete


;;; $AB27: RTS. Setup - PLM $B797 (clear Botwoon wall) ;;;
RTS_84AB27:
    RTS


;;; $AB28: Setup - PLM $B79B (crumble Botwoon wall) - wait 40h frames ;;;
Setup_CrumbleBotwoonWall_Wait40Frames:
;; Parameters:
;;     Y: PLM index
    TYX
    LDA.W #$0040 : STA.L PLMExtra_InstructionTimers,X
    RTS


;;; $AB31: Instruction list - PLM $B79B (crumble Botwoon wall) ;;;
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


;;; $AB51: Instruction - scroll 0..1 = blue ;;;
Instruction_PLM_Scroll_0_1_Blue:
    LDA.W #$0101 : STA.L Scrolls
    RTS


;;; $AB59: Instruction - move PLM down one block ;;;
Instruction_PLM_MovePLMDown1Block:
;; Parameters:
;;     X: PLM index

; Clone of UNUSED_Instruction_PLM_MovePLMDown1Block_848D89
    LDA.W PLM_BlockIndices,X : CLC : ADC.W RoomWidthBlocks : ADC.W RoomWidthBlocks : STA.W PLM_BlockIndices,X
    RTS


;;; $AB67: Instruction list - PLM $B797 (clear Botwoon wall) ;;;
InstList_PLM_ClearBotwoonWall:
    dw $0001,DrawInst_ClearBotwoonWall
    dw Instruction_PLM_Delete


;;; $AB6D: Instruction list - PLM $B7A3 (crumble Kraid ceiling block into background 1) ;;;
InstList_PLM_CrumbleKraidCeilingBlockIntoBackground1:
    dw $0003,DrawInst_CrumbleKraidCeiling_CrumbleKraidSpikes_Elevatube
    dw $0003,DrawInst_CrumbleKraidCeiling_CrumbleKraidSpikes_0
    dw $0003,DrawInst_CrumbleKraidCeiling_CrumbleKraidSpikes_1


;;; $AB79: Instruction list - PLM $B79F (unused. Set Kraid ceiling block to background 1) ;;;
InstList_PLM_SetKraidCeilingBlockToBackground1:
    dw $0003,UNUSED_DrawInst_SetKraidCeilingBlockToBackground1_849379
    dw Instruction_PLM_Delete


;;; $AB7F: Instruction list - PLM $B7AB (crumble Kraid ceiling block into background 2) ;;;
InstList_PLM_CrumbleKraidCeilingBlockIntoBackground2:
    dw $0003,DrawInst_CrumbleKraidCeiling_CrumbleKraidSpikes_Elevatube
    dw $0003,DrawInst_CrumbleKraidCeiling_CrumbleKraidSpikes_0
    dw $0003,DrawInst_CrumbleKraidCeiling_CrumbleKraidSpikes_1


;;; $AB8B: Instruction list - PLM $B7A7 (set Kraid ceiling block to background 2) ;;;
InstList_PLM_SetKraidCeilingBlockToBackground2:
    dw $0003,DrawInst_SetKraidCeilingBlockToBackground2
    dw Instruction_PLM_Delete


;;; $AB91: Instruction list - PLM $B7B3 (crumble Kraid ceiling block into background 3) ;;;
InstList_PLM_CrumbleKraidCeilingBlockIntoBackground3:
    dw $0003,DrawInst_CrumbleKraidCeiling_CrumbleKraidSpikes_Elevatube
    dw $0003,DrawInst_CrumbleKraidCeiling_CrumbleKraidSpikes_0
    dw $0003,DrawInst_CrumbleKraidCeiling_CrumbleKraidSpikes_1


;;; $AB9D: Instruction list - PLM $B7AF (set Kraid ceiling block to background 3) ;;;
InstList_PLM_SetKraidCeilingBlockToBackground3:
    dw $0003,DrawInst_SetKraidCeilingBlockToBackground3
    dw Instruction_PLM_Delete


;;; $ABA3: Instruction list - PLM $B7B7 (clear Kraid ceiling) ;;;
InstList_PLM_ClearKraidCeiling:
    dw $0001,DrawInst_ClearKraidCeiling
    dw Instruction_PLM_Delete


;;; $ABA9: Instruction list - PLM $B7BF (crumble Kraid spike blocks) ;;;
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


;;; $ABD6: Instruction - move PLM right one block ;;;
Instruction_PLM_MovePLMRight1Block:
;; Parameters:
;;     X: PLM index
    INC.W PLM_BlockIndices,X : INC.W PLM_BlockIndices,X
    RTS


;;; $ABDD: Instruction list - PLM $B7BB (clear Kraid spike blocks) ;;;
InstList_PLM_ClearKraidSpikeBlocks:
    dw $0001,DrawInst_ClearKraidSpikeBlocks
    dw Instruction_PLM_Delete


if !FEATURE_KEEP_UNREFERENCED
;;; $ABE3: Instruction list - PLM $B65F (unused) ;;;
UNUSED_InstList_PLM_84ABE3:
; Matches the level data of a zebetite
    dw $0001,UNUSED_DrawInst_849453
    dw Instruction_PLM_Delete


;;; $ABE9: Instruction list - PLM $B663 (unused) ;;;
UNUSED_InstList_PLM_84ABE9:
; Solid version of $B65F
    dw $0001,UNUSED_DrawInst_849463
    dw Instruction_PLM_Delete


;;; $ABEF: Instruction list - PLM $B667 (unused) ;;;
UNUSED_InstList_PLM_84ABEF_0:
; Open escape gate that becomes closed after 18h frames
    dw $0018,DrawInst_EscapeRoom1Gate_0

UNUSED_InstList_PLM_84ABF3_1:
    dw $0001,DrawInst_EscapeRoom1Gate_2
    dw Instruction_PLM_Delete


;;; $ABF9: Instruction list - PLM $B66B (unused. Blank air) ;;;
UNUSED_InstList_PLM_84ABF9:
    dw $0001,UNUSED_DrawInst_849497
    dw Instruction_PLM_Delete


;;; $ABFF: Instruction list - PLM $B66F (unused. Blank solid) ;;;
UNUSED_PLM_InstList_84ABFF:
    dw $0001,UNUSED_DrawInst_84949D
    dw Instruction_PLM_Delete
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $AC05: Instruction list - PLM $B673 (fill Mother Brain's wall) ;;;
InstList_PLM_FillMotherBrainsWall:
    dw $0001,DrawInst_FillMotherBrainsWall
    dw Instruction_PLM_Delete


;;; $AC0B: Instruction list - PLM $B677 (Mother Brain's room escape door) ;;;
InstList_PLM_MotherBrainsRoomEscapeDoor:
    dw $0001,DrawInst_MotherBrainsRoomEscapeDoor
    dw Instruction_PLM_Delete


;;; $AC11: Instruction list - PLM $B67B (Mother Brain's background row 2) ;;;
InstList_PLM_MotherBrainsBackgroundRow2:
    dw $0001,DrawInst_MotherBrainsBackgroundRow2
    dw Instruction_PLM_Delete


;;; $AC17: Instruction list - PLM $B67F (Mother Brain's background row 3) ;;;
InstList_PLM_MotherBrainsBackgroundRow3:
    dw $0001,DrawInst_MotherBrainsBackgroundRow3
    dw Instruction_PLM_Delete


;;; $AC1D: Instruction list - PLM $B683 (Mother Brain's background row 4) ;;;
InstList_PLM_MotherBrainsBackgroundRow4:
    dw $0001,DrawInst_MotherBrainsBackgroundRow4
    dw Instruction_PLM_Delete


;;; $AC23: Instruction list - PLM $B687 (Mother Brain's background row 5) ;;;
InstList_PLM_MotherBrainsBackgroundRow5:
    dw $0001,DrawInst_MotherBrainsBackgroundRow5
    dw Instruction_PLM_Delete


;;; $AC29: Instruction list - PLM $B68B (Mother Brain's background row 6) ;;;
InstList_PLM_MotherBrainsBackgroundRow6:
    dw $0001,DrawInst_MotherBrainsBackgroundRow6
    dw Instruction_PLM_Delete


;;; $AC2F: Instruction list - PLM $B68F (Mother Brain's background row 7) ;;;
InstList_PLM_MotherBrainsBackgroundRow7:
    dw $0001,DrawInst_MotherBrainsBackgroundRow7
    dw Instruction_PLM_Delete


;;; $AC35: Instruction list - PLM $B693 (Mother Brain's background row 8) ;;;
InstList_PLM_MotherBrainsBackgroundRow8:
    dw $0001,DrawInst_MotherBrainsBackgroundRow8
    dw Instruction_PLM_Delete


;;; $AC3B: Instruction list - PLM $B697 (Mother Brain's background row 9) ;;;
InstList_PLM_MotherBrainsBackgroundRow9:
    dw $0001,DrawInst_MotherBrainsBackgroundRow9
    dw Instruction_PLM_Delete


;;; $AC41: Instruction list - PLM $B69B (Mother Brain's background row Ah) ;;;
InstList_PLM_MotherBrainsBackgroundRowA:
    dw $0001,DrawInst_MotherBrainsBackgroundRowA
    dw Instruction_PLM_Delete


;;; $AC47: Instruction list - PLM $B69F (Mother Brain's background row Bh) ;;;
InstList_PLM_MotherBrainsBackgroundRowB:
    dw $0001,DrawInst_MotherBrainsBackgroundRowB
    dw Instruction_PLM_Delete


;;; $AC4D: Instruction list - PLM $B6A3 (Mother Brain's background row Ch) ;;;
InstList_PLM_MotherBrainsBackgroundRowC:
    dw $0001,DrawInst_MotherBrainsBackgroundRowC
    dw Instruction_PLM_Delete


;;; $AC53: Instruction list - PLM $B6A7 (Mother Brain's background row Dh) ;;;
InstList_PLM_MotherBrainsBackgroundRowD:
    dw $0001,DrawInst_MotherBrainsBackgroundRowD
    dw Instruction_PLM_Delete


if !FEATURE_KEEP_UNREFERENCED
;;; $AC59: Instruction list - PLM $B6AB (unused. Mother Brain's background row Eh) ;;;
UNUSED_InstList_PLM_84AC59:
    dw $0001,UNUSED_DrawInst_94966D
    dw Instruction_PLM_Delete


UNUSED_InstList_PLM_84AC5F:
;;; $AC5F: Instruction list - PLM $B6AF (unused. Mother Brain's background row Fh) ;;;
    dw $0001,UNUSED_DrawInst_94968B
    dw Instruction_PLM_Delete
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $AC65: Instruction list - PLM $B6B3 (clear ceiling block in Mother Brain's room) ;;;
InstList_PLM_ClearCeilingBlockInMotherBrainsRoom:
    dw $0001,DrawInst_ClearCeilingBlockInMotherBrainsRoom
    dw Instruction_PLM_Delete


;;; $AC6B: Instruction list - PLM $B6B7 (clear ceiling tube in Mother Brain's room) ;;;
InstList_PLM_ClearCeilingTubeInMotherBrainsRoom:
    dw $0001,DrawInst_ClearCeilingTubeInMotherBrainsRoom
    dw Instruction_PLM_Delete


;;; $AC71: Instruction list - PLM $B6BB (clear Mother Brain's bottom-middle-side tube) ;;;
InstList_PLM_ClearMotherBrainsBottomMiddleSideTube:
    dw $0001,DrawInst_ClearMotherBrainsBottomMiddleSideTube
    dw Instruction_PLM_Delete


;;; $AC77: Instruction list - PLM $B6BF (clear Mother Brain's bottom-middle tubes) ;;;
InstList_PLM_ClearMotherBrainsBottomMiddleTubes:
    dw $0001,DrawInst_ClearMotherBrainsBottomMiddleTubes
    dw Instruction_PLM_Delete


;;; $AC7D: Instruction list - PLM $B6C3 (clear Mother Brain's bottom-left tube) ;;;
InstList_PLM_ClearMotherBrainsBottomLeftTube:
    dw $0001,DrawInst_ClearMotherBrainsBottomLeftTube
    dw Instruction_PLM_Delete


;;; $AC83: Instruction list - PLM $B6C7 (clear Mother Brain's bottom-right tube) ;;;
InstList_PLM_ClearMotherBrainsBottomRightTube:
    dw $0001,DrawInst_ClearMotherBrainsBottomRightTube
    dw Instruction_PLM_Delete


;;; $AC89: Pre-instruction - position Samus and give at least 10h frames of invincibility ;;;
PreInst_PLM_PositionSamus_GiveAtLeast10FramesOfInvincibility:
;; Parameter:
;;     X: PLM index

; Used for Brinstar plants
    LDA.W PLM_Vars,X : STA.W SamusXPosition
    LDA.L PLMExtra_Vars,X : STA.W SamusYPosition
    LDA.W #$0010 : TSB.W SamusInvincibilityTimer
    RTS


;;; $AC9D: Instruction - deal 2 damage to Samus ;;;
Instruction_PLM_Deal2DamageToSamus:
    LDA.W PeriodicSubDamage : CLC : ADC.W #$0000 : STA.W PeriodicSubDamage
    LDA.W PeriodicDamage : ADC.W #$0002 : STA.W PeriodicDamage
    RTS


;;; $ACB1: Instruction - give Samus 30h frames of invincibility ;;;
Instruction_PLM_GiveSamus30FramesOfInvincibility:
    LDA.W #$0030 : STA.W SamusInvincibilityTimer
    RTS


;;; $ACB8: Instruction list - PLM $B6CB (inside reaction, special air, BTS Brinstar 80h. Floor plant) ;;;
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


;;; $ACF8: Instruction list - PLM $B6CF (inside reaction, special air, BTS Brinstar 81h. Ceiling plant) ;;;
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


;;; $AD38: Instruction list - PLM $B64B (Wrecked Ship entrance treadmill from west) ;;;
InstList_PLM_WreckedShipEntranceTreadmillFromWest_0:
    dw Instruction_PLM_GotoY_ifBossBitsSet : db $01
    dw InstList_PLM_WreckedShipEntranceTreadmillFromWest_1
    dw Instruction_PLM_Delete

InstList_PLM_WreckedShipEntranceTreadmillFromWest_1:
    dw Instruction_PLM_Draw38TilesOfBlankRightwardsTreadmill
    dw Instruction_PLM_Delete


;;; $AD43: Instruction - draw 38h tiles of blank rightwards treadmill ;;;
Instruction_PLM_Draw38TilesOfBlankRightwardsTreadmill:
;; Parameters:
;;     X: PLM index
    JSR Write_Row_of_Level_Data_Block_and_BTS
    dw $30FF,$0008,$0038
    RTS


;;; $AD4D: Instruction list - PLM $B64F (Wrecked Ship entrance treadmill from east) ;;;
InstList_PLM_WreckedShipEntranceTreadmillFromEast_0:
    dw Instruction_PLM_GotoY_ifBossBitsSet : db $01
    dw InstList_PLM_WreckedShipEntranceTreadmillFromEast_1
    dw Instruction_PLM_Delete

InstList_PLM_WreckedShipEntranceTreadmillFromEast_1:
    dw Instruction_PLM_Draw38TilesOfBlankLeftwardsTreadmill
    dw Instruction_PLM_Delete


;;; $AD58: Instruction - draw 38h tiles of blank leftwards treadmill ;;;
Instruction_PLM_Draw38TilesOfBlankLeftwardsTreadmill:
;; Parameters:
;;     X: PLM index
    JSR Write_Row_of_Level_Data_Block_and_BTS
    dw $30FF,$0009,$0038
    RTS


;;; $AD62: Instruction list - PLM $B6D3 (map station) ;;;
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


;;; $AD86: Instruction list - PLM $B6D7 (collision reaction, special, BTS 47h. Map station right access) ;;;
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


;;; $ADA4: Instruction list - PLM $B6DB (collision reaction, special, BTS 48h. Map station left access) ;;;
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


;;; $ADC2: Instruction list - PLM $B6DF (energy station) ;;;
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


;;; $ADF1: Instruction list - PLM $B6E3 (collision reaction, special, BTS 49h. Energy station right access) ;;;
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


;;; $AE13: Instruction list - PLM $B6E7 (collision reaction, special, BTS 4Ah. Energy station left access) ;;;
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


;;; $AE35: Instruction - go to [[Y]] and enable movement if Samus health is full ;;;
Instruction_PLM_GotoY_EnableMovementIfSamusEnergyIsFull:
;; Parameters:
;;     Y: Pointer to instruction arguments
;; Returns:
;;     Y: Pointer to next instruction
    LDA.W MaxEnergy : CMP.W Energy : BEQ .fullEnergy
    INY #2
    RTS

  .fullEnergy:
    LDA.W #$0001
    JSL Run_Samus_Command
    LDA.W $0000,Y : TAY
    RTS


;;; $AE4C: Instruction list - PLM $B6EB (missile station) ;;;
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


;;; $AE7B: Instruction list - PLM $B6EF (collision reaction, special, BTS 4Bh. Missile station right access) ;;;
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


;;; $AE9D: Instruction list - PLM $B6F3 (collision reaction, special, BTS 4Ch. Missile station left access) ;;;
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


;;; $AEBF: Instruction - go to [[Y]] and enable movement if Samus missiles are full ;;;
Instruction_PLM_GotoY_EnableMovementIfSamusMissilesAreFull:
;; Parameters:
;;     Y: Pointer to instruction arguments
;; Returns:
;;     Y: Pointer to next instruction
    LDA.W MaxMissiles : CMP.W Missiles : BEQ .missilesFull
    INY #2
    RTS

  .missilesFull:
    LDA.W #$0001
    JSL Run_Samus_Command
    LDA.W $0000,Y : TAY
    RTS


if !FEATURE_KEEP_UNREFERENCED
;;; $AED6: Instruction list - PLM $B6F7 (unused) ;;;
InstList_PLM_Nothing_84AED6:
; Unknown. 4 frame animation loop of 1x2 spike air blocks, tile numbers don't match any tilesets
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


;;; $AF1C: Instruction list - PLM $B6FB (unused) ;;;
InstList_PLM_Nothing_84AF1C:
; 2x2 version of $B6F7
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


;;; $AF62: Debug. Scroll PLM draw instructions ;;;
DrawInst_Debug_ScrollPLM:
; Used by instruction list $AF86: PLM $B703 (scroll PLM)
    dw $0001,$3074
    dw $0000

if !FEATURE_KEEP_UNREFERENCED
UNUSED_DrawInst_Debug_SolidScrollPLM_84AF68:
; Used by instruction list $AF92: Unused. PLM $B707 (solid scroll PLM)
    dw $0001,$B074
    dw $0000
endif ; !FEATURE_KEEP_UNREFERENCED

DrawInst_Debug_LeftwardsExtension:
; Used by instruction list $AF9E: PLM $B63F (leftwards extension)
    dw $0001,$5011
    dw $0000

DrawInst_Debug_RightwardsExtension:
; Used by instruction list $AFA4: PLM $B63B (rightwards extension)
    dw $0001,$5411
    dw $0000

DrawInst_Debug_UpwardsExtension:
; Used by instruction list $AFAA: PLM $B647 (upwards extension)
    dw $0001,$D800
    dw $0000

DrawInst_Debug_DownwardsExtension:
; Used by instruction list $AFB0: PLM $B643 (downwards extension)
    dw $0001,$D000
    dw $0000


;;; $AF86: Instruction list - PLM $B703 (scroll PLM) ;;;
InstList_PLM_ScrollPLM_0:
    dw $0001,DrawInst_Debug_ScrollPLM

InstList_PLM_ScrollPLM_1:
    dw Instruction_PLM_Sleep
    dw Instruction_PLM_ProcessAirScrollUpdate
    dw Instruction_PLM_GotoY
    dw InstList_PLM_ScrollPLM_1


if !FEATURE_KEEP_UNREFERENCED
;;; $AF92: Instruction list - PLM $B707 (solid scroll PLM) ;;;
InstList_PLM_SolidScrollPLM_0:
    dw $0001,UNUSED_DrawInst_Debug_SolidScrollPLM_84AF68
endif ; !FEATURE_KEEP_UNREFERENCED

InstList_PLM_SolidScrollPLM_1:
    dw Instruction_PLM_Sleep
    dw Instruction_PLM_ProcessSolidScrollUpdate
    dw Instruction_PLM_GotoY
    dw InstList_PLM_SolidScrollPLM_1


;;; $AF9E: Debug. Instruction list - PLM $B63F (leftwards extension) ;;;
InstList_PLM_Debug_LeftwardsExtension:
    dw $0001,DrawInst_Debug_LeftwardsExtension
    dw Instruction_PLM_Delete


;;; $AFA4: Debug. Instruction list - PLM $B63B (rightwards extension) ;;;
InstList_PLM_Debug_RightwardsExtension:
    dw $0001,DrawInst_Debug_RightwardsExtension
    dw Instruction_PLM_Delete


;;; $AFAA: Debug. Instruction list - PLM $B647 (upwards extension) ;;;
InstList_PLM_Debug_UpwardsExtension:
    dw $0001,DrawInst_Debug_UpwardsExtension
    dw Instruction_PLM_Delete


;;; $AFB0: Debug. Instruction list - PLM $B643 (downwards extension) ;;;
InstList_PLM_Debug_DownwardsExtension:
    dw $0001,DrawInst_Debug_DownwardsExtension
    dw Instruction_PLM_Delete


;;; $AFB6: Instruction list - PLM $B70B (elevator platform) ;;;
InstList_PLM_ElevatorPlatform:
    dw $0004,DrawInst_ElevatorPlatform_0
    dw $0004,DrawInst_ElevatorPlatform_1
    dw $0004,DrawInst_ElevatorPlatform_2
    dw $0004,DrawInst_ElevatorPlatform_1
    dw Instruction_PLM_GotoY
    dw InstList_PLM_ElevatorPlatform


;;; $AFCA: Instruction list - PLM $B747 (clear Crocomire's bridge) ;;;
InstList_PLM_ClearCrocomiresBridge:
    dw $0001,DrawInst_ClearCrocomiresBridge
    dw Instruction_PLM_Delete


;;; $AFD0: Instruction list - PLM $B74B (crumble a block of Crocomire's bridge) ;;;
InstList_PLM_CrumbleABlockOfCrocomiresBridge:
    dw $0001,DrawInst_CrumbleABlockOfCrocomiresBridge
    dw Instruction_PLM_Delete


;;; $AFD6: Instruction list - PLM $B74F (clear a block of Crocomire's bridge) ;;;
InstList_PLM_ClearABlockOfCrocomiresBridge:
    dw $0001,DrawInst_ClearABlockOfCrocomiresBridge
    dw Instruction_PLM_Delete


;;; $AFDC: Instruction list - PLM $B753 (clear Crocomire invisible wall) ;;;
InstList_PLM_ClearCrocomiresInvisibleWall:
    dw $0001,DrawInst_ClearCrocomireInvisibleWall_0
    dw Instruction_PLM_Delete


;;; $AFE2: Instruction list - PLM $B757 (create Crocomire invisible wall) ;;;
InstList_PLM_CreateCrocomiresInvisibleWall:
    dw $0001,DrawInst_ClearCrocomireInvisibleWall_1
    dw Instruction_PLM_Delete


;;; $AFE8: Instruction list - PLM $B76F (save station) ;;;
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


;;; $B00E: Instruction - place Samus on save station ;;;
Instruction_PLM_PlaceSamusOnSaveStation:
    LDA.W SamusXPosition : CLC : ADC.W #$0008 : AND.W #$FFF0 : STA.W SamusXPosition
    PHX : PHY
    JSL MakeSamusFaceForward
    PLY : PLX
    RTS


;;; $B024: Instruction - display game saved message box ;;;
Instruction_PLM_DisplayGameSavedMessageBox:
    PHX : PHY
    LDA.W #$0018
    JSL MessageBox_Routine
    PLY : PLX
    RTS


;;; $B030: Instruction - enable movement and set save station used ;;;
Instruction_PLM_EnableMovement_SetSaveStationUsed:
    LDA.W #$0001
    JSL Run_Samus_Command
    LDA.W #$0001 : STA.W SaveStationLockoutFlag
    RTS


if !FEATURE_KEEP_UNREFERENCED
;;; $B03E: Instruction list - PLM $B75B (unused. Draw 13 blank air tiles) ;;;
UNUSED_InstList_PLM_Draw13BlankAirTiles_84B03E:
    dw $0001,UNUSED_DrawInst_Draw13BlankAirTiles_849ACF
    dw Instruction_PLM_Delete


;;; $B044: Instruction list - PLM $B75F (unused. Draw 13 blank solid tiles) ;;;
UNUSED_InstList_PLM_Draw13BlankSolidTiles_84B044:
    dw $0001,UNUSED_DrawInst_Draw13BlankSolidTiles_849AED
    dw Instruction_PLM_Delete
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $B04A: Setup - PLM $B64B / $B64F (Wrecked Ship entrance treadmill) ;;;
Setup_WreckedShipEntranceTreadmill:
;; Parameters:
;;     Y: PLM index

; Write 38h blocks of blank air
    LDX.W PLM_BlockIndices,Y
    LDA.W #$00FF
    LDY.W #$0038

  .loop:
    STA.L LevelData,X
    INX #2
    DEY : BNE .loop
    RTS


if !FEATURE_KEEP_UNREFERENCED
;;; $B05D: Unused. Load FX entry, completely broken ;;;
UNUSED_LoadFXEntry_CompletelyBroken_84B05D:
; I guess it was supposed to be an optimised wrapper that only loads the FX data if it hasn't already been loaded,
; but it's not even close to functional.
; Wrong bank, almost guaranteed stack corruption and non-sense comparison
    PHB : PHA
    PEA $8F00 : PLB : PLB
    ASL #4 : TAX
    CMP.W FX_CurrentEntryOffset : BEQ .return
    LDA.W FX_YSubVelocity : BEQ .loadFXEntry
    LDA.W FX_BaseYPosition : BMI .loadFXEntry
    TYA : CLC : ADC.W FXPointer : TAX
    CMP.W $0002,X
    PLA : PLB
    BCC .return

  .loadFXEntry:
    JSL Load_FX_Entry

  .return:
    CLC
    RTS


;;; $B08B: Unused. Load FX entry 0 if PLM is in leftmost screen column ;;;
UNUSED_LoadFXEntry0IfPLMIsInLeftmostScreenColumn_84B08B:
    LDX.W PLM_Index
    JSL Calculate_PLM_Block_Coordinates
    LDA.W SamusXPosition : LSR #4 : CMP.W PLM_XBlock : BNE .return
    LDA.W #$0000
    JMP UNUSED_LoadFXEntry_CompletelyBroken_84B05D

  .return:
    CLC
    RTS


;;; $B0A6: Unused. Load FX entry 1 if PLM is in leftmost screen column ;;;
UNUSED_LoadFXEntry1IfPLMIsInLeftmostScreenColumn_84B0A6:
    LDX.W PLM_Index
    JSL Calculate_PLM_Block_Coordinates
    LDA.W SamusXPosition : LSR #4 : CMP.W PLM_XBlock : BNE .return
    LDA.W #$0001
    JMP UNUSED_LoadFXEntry_CompletelyBroken_84B05D

  .return:
    CLC
    RTS


;;; $B0C1: Unused. Load FX entry 2 if PLM is in leftmost screen column ;;;
UNUSED_LoadFXEntry2IfPLMIsInLeftmostScreenColumn_84B0C1:
    LDX.W PLM_Index
    JSL Calculate_PLM_Block_Coordinates
    LDA.W SamusXPosition : LSR #4 : CMP.W PLM_XBlock : BNE .return
    LDA.W #$0002
    JMP UNUSED_LoadFXEntry_CompletelyBroken_84B05D

  .return:
    CLC
    RTS
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $B0DC: Setup - PLM $B6CB (inside reaction, special air, BTS Brinstar 80h. Floor plant) ;;;
Setup_BrinstarFloorPlant:
;; Parameters:
;;     Y: PLM index
    LDA.W SamusYPosition : CLC : ADC.W SamusYRadius : DEC
    AND.W #$000F : CMP.W #$000F : BEQ .deactivate
    LDA.W #$0000 : STA.W PLM_IDs,Y
    CLC
    RTS

  .deactivate:
    LDX.W PLM_BlockIndices,Y
    LDA.L LevelData,X : AND.W #$8FFF : STA.L LevelData,X
    TYX
    LDA.W SamusXPosition : STA.W PLM_Vars,X
    LDA.W SamusYPosition : DEC : STA.L PLMExtra_Vars,X
    CLC
    RTS


;;; $B113: Setup - PLM $B6CF (inside reaction, special air, BTS Brinstar 81h. Ceiling plant) ;;;
Setup_BrinstarCeilingPlant:
;; Parameters:
;;     Y: PLM index
    LDA.W SamusYPosition : SEC : SBC.W SamusYRadius : AND.W #$000F : BEQ .deactivate
    LDA.W #$0000 : STA.W PLM_IDs,Y
    CLC
    RTS

  .deactivate:
    LDX.W PLM_BlockIndices,Y
    LDA.L LevelData,X : AND.W #$8FFF : STA.L LevelData,X
    TYX
    LDA.W SamusXPosition : STA.W PLM_Vars,X
    LDA.W SamusYPosition : INC : STA.L PLMExtra_Vars,X
    CLC
    RTS


;;; $B146: Activate the station at block index [A] if Samus arm cannon is lined up ;;;
ActivateStationIfSamusArmCannonLinedUp:
;; Parameters:
;;     A: Block index
;;     Y: PLM index
;; Returns:
;;     Carry: Set. Unconditional collision
    LDX.W #$004E

  .loop:
    CMP.W PLM_BlockIndices,X : BEQ .found
    DEX #2 : BPL .loop
    BRA .delete

  .found:
    PHX
    LDX.W PLM_Index
    JSL Calculate_PLM_Block_Coordinates
    PLX
    LDA.W PLM_YBlock : ASL #4 : ORA.W #$000B : CMP.W SamusYPosition : BNE .delete
    LDA.L PLMExtra_LinkInstructions,X : STA.W PLM_InstListPointers,X
    LDA.W #$0001 : STA.L PLMExtra_InstructionTimers,X
    LDA.W #$0006
    JSL Run_Samus_Command
    SEC
    RTS

  .delete:
    LDA.W #$0000 : STA.W PLM_IDs,Y
    SEC
    RTS


;;; $B18B: Setup - PLM $B6D3 (map station) ;;;
Setup_MapStation:
;; Parameters:
;;     Y: PLM index
    LDX.W PLM_BlockIndices,Y
    LDA.L LevelData,X : AND.W #$0FFF : ORA.W #$8000 : STA.L LevelData,X
    LDX.W AreaIndex
    LDA.L SRAMMirror_MapStations,X : AND.W #$00FF : BNE .setInstruction
    LDX.W PLM_BlockIndices,Y
    INX #2
    LDA.W #$B047 ; block type + BTS
    JSR Write_Level_Data_Block_Type_and_BTS
    LDX.W PLM_BlockIndices,Y
    DEX #4
    LDA.W #$B048 ; block type + BTS
    JSR Write_Level_Data_Block_Type_and_BTS
    RTS

  .setInstruction:
    LDA.W #InstList_PLM_MapStation_2 : STA.W PLM_InstListPointers,Y
    RTS


;;; $B1C8: Setup - PLM $B6D7 (collision reaction, special, BTS 47h. Map station right access) ;;;
Setup_MapStationRightAccess:
;; Parameters:
;;     Y: PLM index
;; Returns:
;;     Carry: Set. Unconditional collision
    LDA.W CollisionMovementDirection : AND.W #$000F : BNE .connected
    LDA.W Pose : CMP.W #$008A : BNE .connected
    LDA.W PoseXDirection : AND.W #$0004 : BEQ .connected
    LDA.W PLM_BlockIndices,Y : DEC #2
    JMP ActivateStationIfSamusArmCannonLinedUp

  .connected:
    LDA.W #$0000 : STA.W PLM_IDs,Y
    SEC
    RTS


;;; $B1F0: Setup - PLM $B6DB (collision reaction, special, BTS 48h. Map station left access) ;;;
Setup_MapStationLeftAccess:
;; Parameters:
;;     Y: PLM index
;; Returns:
;;     Carry: Set. Unconditional collision
    LDA.W CollisionMovementDirection : AND.W #$000F : CMP.W #$0001 : BNE .connected
    LDA.W Pose : CMP.W #$0089 : BNE .connected
    LDA.W PoseXDirection : AND.W #$0008 : BEQ .connected
    LDA.W PLM_BlockIndices,Y : INC #4
    JMP ActivateStationIfSamusArmCannonLinedUp

  .connected:
    LDA.W #$0000 : STA.W PLM_IDs,Y
    SEC
    RTS


;;; $B21D: Setup - PLM $B6DF (energy station) ;;;
Setup_EnergyStation:
;; Parameters:
;;     Y: PLM index
    LDX.W PLM_BlockIndices,Y
    LDA.L LevelData,X : AND.W #$0FFF : ORA.W #$8000 : STA.L LevelData,X
    LDX.W PLM_BlockIndices,Y
    INX #2
    LDA.W #$B049 ; block type + BTS
    JSR Write_Level_Data_Block_Type_and_BTS
    LDX.W PLM_BlockIndices,Y
    DEX #2
    LDA.W #$B04A ; block type + BTS
    JSR Write_Level_Data_Block_Type_and_BTS
    RTS


;;; $B245: Setup - PLM $B6EB (missile station) ;;;
Setup_MissileStation:
;; Parameters:
;;     Y: PLM index
    LDX.W PLM_BlockIndices,Y
    LDA.L LevelData,X : AND.W #$0FFF : ORA.W #$8000 : STA.L LevelData,X
    LDX.W PLM_BlockIndices,Y
    INX #2
    LDA.W #$B04B ; block type + BTS
    JSR Write_Level_Data_Block_Type_and_BTS
    LDX.W PLM_BlockIndices,Y
    DEX #2
    LDA.W #$B04C ; block type + BTS
    JSR Write_Level_Data_Block_Type_and_BTS
    RTS


;;; $B26D: Setup - PLM $B6E3 (collision reaction, special, BTS 49h. Energy station right access) ;;;
Setup_EnergyStationRightAccess:
;; Parameters:
;;     Y: PLM index
;; Returns:
;;     Carry: Set. Unconditional collision
    LDA.W CollisionMovementDirection : AND.W #$000F : BNE .connected
    LDA.W Pose : CMP.W #$008A : BNE .connected
    LDA.W PoseXDirection : AND.W #$0004 : BEQ .connected
    LDA.W Energy : CMP.W MaxEnergy : BEQ .connected
    LDA.W PLM_BlockIndices,Y : DEC #2
    JMP ActivateStationIfSamusArmCannonLinedUp

  .connected:
    LDA.W #$0000 : STA.W PLM_IDs,Y
    SEC
    RTS


;;; $B29D: Setup - PLM $B6E7 (collision reaction, special, BTS 4Ah. Energy station left access) ;;;
Setup_EnergyStationLeftAccess:
;; Parameters:
;;     Y: PLM index
;; Returns:
;;     Carry: Set. Unconditional collision
    LDA.W CollisionMovementDirection : AND.W #$000F : CMP.W #$0001 : BNE .connected
    LDA.W Pose : CMP.W #$0089 : BNE .connected
    LDA.W PoseXDirection : AND.W #$0008 : BEQ .connected
    LDA.W Energy : CMP.W MaxEnergy : BEQ .connected
    LDA.W PLM_BlockIndices,Y : INC #2
    JMP ActivateStationIfSamusArmCannonLinedUp

  .connected:
    LDA.W #$0000 : STA.W PLM_IDs,Y
    SEC
    RTS


;;; $B2D0: Setup - PLM $B6EF (collision reaction, special, BTS 4Bh. Missile station right access) ;;;
Setup_MissileStationRightAccess:
;; Parameters:
;;     Y: PLM index
;; Returns:
;;     Carry: Set. Unconditional collision
    LDA.W CollisionMovementDirection : AND.W #$000F : BNE .connected
    LDA.W Pose : CMP.W #$008A : BNE .connected
    LDA.W PoseXDirection : AND.W #$0004 : BEQ .connected
    LDA.W Missiles : CMP.W MaxMissiles : BEQ .connected
    LDA.W PLM_BlockIndices,Y : DEC #2
    JMP ActivateStationIfSamusArmCannonLinedUp

  .connected:
    LDA.W #$0000 : STA.W PLM_IDs,Y
    SEC
    RTS


;;; $B300: Setup - PLM $B6F3 (collision reaction, special, BTS 4Ch. Missile station left access) ;;;
Setup_MissileStationLeftAccess:
;; Parameters:
;;     Y: PLM index
;; Returns:
;;     Carry: Set. Unconditional collision
    LDA.W CollisionMovementDirection : AND.W #$000F : CMP.W #$0001 : BNE .connected
    LDA.W Pose : CMP.W #$0089 : BNE .connected
    LDA.W PoseXDirection : AND.W #$0008 : BEQ .connected
    LDA.W Missiles : CMP.W MaxMissiles : BEQ .connected
    LDA.W PLM_BlockIndices,Y : INC #2
    JMP ActivateStationIfSamusArmCannonLinedUp

  .connected:
    LDA.W #$0000 : STA.W PLM_IDs,Y
    SEC
    RTS


;;; $B333: Delete PLM ;;;
DeletePLM:
;; Parameters:
;;     Y: PLM index
    LDA.W #$0000 : STA.W PLM_IDs,Y
    RTS


;;; $B33A: Setup - PLM $B63B (rightwards extension) ;;;
Setup_RightwardsExtension:
;; Parameters:
;;     Y: PLM index

; Write horizontal extension block with BTS FFh and delete PLM
    LDX.W PLM_BlockIndices,Y
    LDA.W #$50FF ; block type + BTS
    JSR Write_Level_Data_Block_Type_and_BTS
    BRA DeletePLM


;;; $B345: Setup - PLM $B63F (leftwards extension) ;;;
Setup_LeftwardsExtension:
;; Parameters:
;;     Y: PLM index

; Write horizontal extension block with BTS 1 and delete PLM
    LDX.W PLM_BlockIndices,Y
    LDA.W #$5001 ; block type + BTS
    JSR Write_Level_Data_Block_Type_and_BTS
    BRA DeletePLM


;;; $B350: Setup - PLM $B643 (downwards extension) ;;;
Setup_DownwardsExtension:
;; Parameters:
;;     Y: PLM index

; Write vertical extension block with BTS FFh and delete PLM
    LDX.W PLM_BlockIndices,Y
    LDA.W #$D0FF ; block type + BTS
    JSR Write_Level_Data_Block_Type_and_BTS
    BRA DeletePLM


;;; $B35B: Setup - PLM $B647 (upwards extension) ;;;
Setup_UpwardsExtension:
;; Parameters:
;;     Y: PLM index

; Write vertical extension block with BTS 1 and delete PLM
    LDX.W PLM_BlockIndices,Y
    LDA.W #$D001 ; block type + BTS
    JSR Write_Level_Data_Block_Type_and_BTS
    BRA DeletePLM


;;; $B366: Skip debug draw instruction for scroll PLMs ;;;
Skip_Debug_DrawInstruction_for_ScrollPLM:
;; Parameters:
;;     Y: PLM index
    LDA.W PLM_InstListPointers,Y : CLC : ADC.W #$0004 : STA.W PLM_InstListPointers,Y
    RTS


;;; $B371: Setup - PLM $B703 (scroll PLM) ;;;
Setup_ScrollPLM:
;; Parameters:
;;     Y: PLM index

; Write scroll PLM trigger block, set PLM as not triggered and skip debug draw instruction
    LDX.W PLM_BlockIndices,Y
    LDA.W #$3046 ; block type + BTS
    JSR Write_Level_Data_Block_Type_and_BTS
    LDA.W #$0000 : STA.W PLM_Vars,Y
    BRA Skip_Debug_DrawInstruction_for_ScrollPLM


;;; $B382: Setup - PLM $B707 (unused. Solid scroll PLM) ;;;
Setup_SolidScrollPLM:
;; Parameters:
;;     Y: PLM index

; Write solid scroll PLM trigger block, set PLM as not triggered and skip debug draw instruction
    LDX.W PLM_BlockIndices,Y
    LDA.W #$B046 ; block type + BTS
    JSR Write_Level_Data_Block_Type_and_BTS
    LDA.W #$0000 : STA.W PLM_Vars,Y
    BRA Skip_Debug_DrawInstruction_for_ScrollPLM


;;; $B393: Setup - PLM $B6FF (collision reaction, special, BTS 46h / inside reaction, special air, BTS 46h. Scroll block touch PLM) ;;;
Setup_ScrollBlockTouchPLM:
;; Parameters:
;;     Y: PLM index
;; Returns:
;;     Carry: Set. Unconditional collision
    TYX
    LDA.W PLM_BlockIndices,X
    STZ.W PLM_BlockIndices,X
    LDX.W #$004E

  .loop:
    CMP.W PLM_BlockIndices,X : BEQ .found
    DEX #2 : BPL .loop

  .crash:
    BRA .crash

  .found:
    LDA.W PLM_Vars,X : BMI .return
    LDA.W #$8000 : STA.W PLM_Vars,X
    INC.W PLM_InstListPointers,X : INC.W PLM_InstListPointers,X
    LDA.W #$0001 : STA.L PLMExtra_InstructionTimers,X

  .return:
    RTS


;;; $B3C1: Setup - deactivate PLM ;;;
Setup_DeactivatePLM:
;; Parameters:
;;     Y: PLM index
    LDX.W PLM_BlockIndices,Y
    LDA.L LevelData,X : AND.W #$8FFF : STA.L LevelData,X
; fallthrough to RTS_84B3CF


RTS_84B3CF:
    RTS


;;; $B3D0: Clear carry. Setup - PLM $B633 (collision reaction, special, BTS Brinstar 80h/81h) ;;;
Setup_ClearCarry:
    CLC
    RTS


;;; $B3D2: Unused. Set carry. Setup - PLM $B637 (nothing) ;;;
Setup_SetCarry:
    SEC
    RTS


;;; $B3D4: Setup - PLM $D094 (enemy collision reaction, spike block, BTS Fh. Enemy breakable block) ;;;
Setup_EnemyBreakableBlock:
;; Parameters:
;;     Y: PLM index

; Make PLM block air
    LDX.W PLM_BlockIndices,Y
    LDA.L LevelData,X : AND.W #$0FFF : STA.L LevelData,X
    RTS


if !FEATURE_KEEP_UNREFERENCED
;;; $B3E3: Setup - PLM $B743 (unused. Torizo drool?) ;;;
UNUSED_Setup_TorizoDrool_84B3E3:
    LDY.W #UNUSED_EnemyProjectile_BombTorizo_86A977
    JSL SpawnEnemyProjectileY_ParameterA_RoomGraphics
    RTS
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $B3EB: Setup - PLM $B70F (inside reaction, special air, BTS Crateria/Debug 80h. Ice physics) ;;;
Setup_IcePhysics:
    LDA.W SamusYPosition : CLC : ADC.W SamusYRadius
    DEC : AND.W #$000F : CMP.W #$0007 : BEQ .decel
    CMP.W #$000F : BNE .return

  .decel:
    LDA.W #$0010 : STA.W SamusXDecelerationMultiplier

  .return:
    CLC
    RTS


;;; $B408: Setup - PLM $B713 / $B717 / $B71B (inside reaction, special air, BTS Maridia 80h/81h/82h. Quicksand surface) ;;;
Setup_QuicksandSurface:
    STZ.W SamusRunningMomentumFlag : STZ.W SamusBoostTimer
    STZ.W SamusEchoesSFXFlag : STZ.W SamusXExtraRunSubSpeed : STZ.W SamusXExtraRunSpeed
    LDA.W #$8000 : TRB.W SamusXBaseSubSpeed
    STZ.W SamusXBaseSpeed
    LDY.W #$0000
    LDA.W EquippedItems : BIT.W #$0020 : BEQ +
    LDY.W #$0002

+   LDA.W InsideBlockReactionSamusPoint : BNE InsideReaction_QuicksandSurface_SamusIsGrounded_return
    LDA.W SamusYDirection : AND.W #$0003 : ASL : TAX
    JSR.W (.pointers,X)
    RTS

  .pointers:
    dw InsideReaction_QuicksandSurface_SamusIsGrounded
    dw InsideReaction_QuicksandSurface_SamusIsMovingUp
    dw InsideReaction_QuicksandSurface_SamusIsMovingDown
    dw InsideReaction_QuicksandSurface_SamusIsGrounded


;;; $B447: Inside reaction - quicksand surface - Samus is grounded ;;;
InsideReaction_QuicksandSurface_SamusIsGrounded:
;; Parameters:
;;     Y: Quicksand physics table index. 0 = without gravity suit, 2 = with gravity suit
    STZ.W SamusYSubSpeed : STZ.W SamusYSpeed
    STZ.W ExtraSamusYSubDisplacement : STZ.W ExtraSamusYDisplacement
    LDA.W QuicksandSurface_InsideReaction_distanceOnGround,Y : STA.W ExtraSamusYSubDisplacement+1

  .return:
    RTS


;;; $B45A: Inside reaction - quicksand surface - Samus is moving up ;;;
InsideReaction_QuicksandSurface_SamusIsMovingUp:
;; Parameters:
;;     Y: Quicksand physics table index. 0 = without gravity suit, 2 = with gravity suit
    LDA.W QuicksandSurface_InsideReaction_maxVelocity,Y : CMP.W SamusYSpeedCombined : BCS +
    STZ.W SamusYSubSpeed : STZ.W SamusYSpeed
    LDA.W QuicksandSurface_InsideReaction_maxVelocity,Y : STA.W SamusYSpeedCombined

+   STZ.W ExtraSamusYSubDisplacement : STZ.W ExtraSamusYDisplacement
    LDA.W QuicksandSurface_InsideReaction_distanceInAir,Y : STA.W ExtraSamusYSubDisplacement+1
    RTS


;;; $B47B: Inside reaction - quicksand surface - Samus is moving down ;;;
InsideReaction_QuicksandSurface_SamusIsMovingDown:
;; Parameters:
;;     Y: Quicksand physics table index. 0 = without gravity suit, 2 = with gravity suit
    STZ.W ExtraSamusYSubDisplacement : STZ.W ExtraSamusYDisplacement
    LDA.W QuicksandSurface_InsideReaction_distanceInAir,Y : STA.W ExtraSamusYSubDisplacement+1
    STZ.W AutoJumpTimer
    RTS


;;; $B48B: Quicksand physics table ;;;
QuicksandSurface_InsideReaction:
;        _________ Without gravity suit
;       |      ___ With gravity suit
;       |     |
  .distanceInAir:
    dw $0200,$0200 ; Distance to move Samus vertically * 100h in air
  .distanceOnGround:
    dw $0120,$0100 ; Distance to move Samus vertically * 100h on ground
  .maxVelocity:
    dw $0280,$0380 ; Samus max vertical velocity * 100h


;;; $B497: Setup - PLM $B71F (inside reaction, special air, BTS Maridia 83h. Submerging quicksand) ;;;
Setup_Inside_SubmergingQuicksand:
    STZ.W AutoJumpTimer
    LDA.W #$2000 : STA.W ExtraSamusYSubDisplacement
    LDA.W #$0001 : STA.W ExtraSamusYDisplacement
    CLC
    RTS


;;; $B4A8: Setup - PLM $B723 (inside reaction, special air, BTS Maridia 84h. Sand falls - slow) ;;;
Setup_SandfallsSlow:
    LDA.W #$4000 : STA.W ExtraSamusYSubDisplacement
    LDA.W #$0001 : STA.W ExtraSamusYDisplacement
    CLC
    RTS


;;; $B4B6: Setup - PLM $B727 (inside reaction, special air, BTS Maridia 85h. Sand falls - fast) ;;;
Setup_SandfallsFast:
    LDA.W #$C000 : STA.W ExtraSamusYSubDisplacement
    LDA.W #$0001 : STA.W ExtraSamusYDisplacement
    CLC
    RTS


;;; $B4C4: Setup - PLM $B72B / $B72F / $B733 (collision reaction, special, BTS Maridia 80h/81h/82h. Quicksand surface) ;;;
Setup_QuicksandSurface_BTS85:
;; Parameters:
;;     $12.$14: Distance to check for collision
;; Returns:
;;     Carry: Set if collision, clear otherwise
;;     $12.$14: Adjusted distance to move Samus or distance to collision

; Effectively no effect for horizontal collisions
    LDA.W CollisionMovementDirection : AND.W #$0002 : BNE .vertical
    CLC
    RTS

  .vertical:
    LDY.W #$0000
    LDA.W EquippedItems : BIT.W #$0020 : BEQ +
    LDY.W #$0002

+   LDX.B DP_Temp12
    LDA.B DP_Temp14 : STA.B DP_Temp12
    STX.B DP_Temp14
    LDA.W SamusYDirection : AND.W #$0003 : ASL : TAX
    JSR.W (.pointers,X)
    LDX.B DP_Temp12
    LDA.B DP_Temp14 : STA.B DP_Temp12
    STX.B DP_Temp14
    RTS

  .pointers:
    dw CollisionReaction_QuicksandSurface_SamusIsGrounded
    dw ClearCarry_84B528
    dw CollisionReaction_QuicksandSurface_SamusIsMovingDown
    dw CollisionReaction_QuicksandSurface_SamusIsGrounded


;;; $B500: Collision reaction - quicksand surface - Samus is grounded ;;;
CollisionReaction_QuicksandSurface_SamusIsGrounded:
;; Parameters:
;;     Y: Quicksand surface max sinking speed table index. 0 without gravity suit, 2 with gravity suit
;;     $14.$12: Distance to check for collision
;; Returns:
;;     Carry: Set if collision, clear otherwise
;;     $14.$12: Adjusted distance to move Samus or distance to collision
    LDA.W CollisionMovementDirection : AND.W #$000F : CMP.W #$0002 : BEQ .noCollision
    CMP.W #$0003 : BEQ .up
    BRA .noCollision

  .up:
    LDA.W ContactDamageIndex : CMP.W #$0001 : BEQ CollisionReaction_QuicksandSurface_QuicksandSpeedBoosting
    LDA.W QuicksandSurface_MaxSinkingSpeed,Y : CMP.B DP_Temp13 : BCS +
    STA.B DP_Temp13

+   INC.W SamusInQuicksand

  .noCollision:
    CLC
    RTS


;;; $B528: Clear carry. Collision reaction - quicksand surface - Samus is moving up ;;;
ClearCarry_84B528:
    CLC
    RTS


;;; $B52A: Collision reaction - quicksand surface - Samus is moving down ;;;
CollisionReaction_QuicksandSurface_SamusIsMovingDown:
;; Parameters:
;;     $14.$12: Distance to check for collision
;; Returns:
;;     Carry: Set if collision, clear otherwise
;;     $14.$12: Distance to move Samus or distance to collision
    LDA.W ContactDamageIndex : CMP.W #$0001 : BEQ CollisionReaction_QuicksandSurface_QuicksandSpeedBoosting
    INC.W SamusInQuicksand
    CLC
    RTS


;;; $B537: Collision reaction - quicksand surface - quicksand speed boosting ;;;
CollisionReaction_QuicksandSurface_QuicksandSpeedBoosting:
;; Returns:
;;     Carry: Set. Unconditional collision
;;     $14.$12: 0.0. Distance to collision
    STZ.B DP_Temp12 : STZ.B DP_Temp14
    SEC
    RTS


;;; $B53D: Quicksand surface max sinking speed ;;;
QuicksandSurface_MaxSinkingSpeed:
;        _________ Without gravity suit
;       |      ___ With gravity suit
;       |     |
    dw $0030,$0030


;;; $B541: Setup - PLM $B737 (collision reaction, special, BTS Maridia 83h. Submerging quicksand) ;;;
Setup_Collision_SubmergingQuicksand:
;; Returns:
;;     Carry: Clear. No collision
    STZ.W SamusYSubSpeed : STZ.W SamusYSpeed
    STZ.W SamusYSubAcceleration : STZ.W SamusYAcceleration
    CLC
    RTS


;;; $B54F: Clear carry. Setup - PLM $B73B / $B73F (collision reaction, special, BTS Maridia  84h/85h. Sand falls) ;;;
Setup_CollisionReaction_SandFalls:
    CLC
    RTS


;;; $B551: Setup - PLM $B763 (clear Shitroid invisible wall) ;;;
Setup_ClearBabyMetroidInvisibleWall:
;; Parameters:
;;     Y: PLM index

; Make the 10-block column below this PLM air
    LDX.W PLM_BlockIndices,Y
    LDY.W #$000A

  .loop:
    LDA.L LevelData,X : AND.W #$0FFF : STA.L LevelData,X
    TXA : CLC : ADC.W RoomWidthBlocks : ADC.W RoomWidthBlocks : TAX
    DEY : BNE .loop
    RTS


;;; $B56F: Setup - PLM $B767 (create Shitroid invisible wall) ;;;
CreateBabyMetroidInvisibleWall:
;; Parameters:
;;     Y: PLM index

; Make the 10-block column below this PLM solid
    LDX.W PLM_BlockIndices,Y
    LDY.W #$000A

  .loop:
    LDA.L LevelData,X : AND.W #$0FFF : ORA.W #$8000 : STA.L LevelData,X
    TXA : CLC : ADC.W RoomWidthBlocks : ADC.W RoomWidthBlocks : TAX
    DEY : BNE .loop
    RTS


;;; $B590: Setup - PLM $B76B (collision reaction, special, BTS 4Dh. Save station trigger) ;;;
Setup_CollisionReaction_SaveStationTrigger:
;; Parameters:
;;     Y: PLM index
;; Returns:
;;     Carry: Set. Unconditional collision

; I wrote `[Samus X position] < PLM X position + 18h` below,
; but Samus X position must be less than PLM X position + 10h for the collision to happen in the first place.
; So save stations cruelly require Samus center to be within the center-left quarter of the station

; All the save stations in the game are placed in rooms that only have one PLM,
; so this (questionable) loop over all PLM slots finishes after just one iteration

; Note that having two free PLM slots before a save station PLM can cause the save station triggering mechanism to fail
; If two trigger PLMs are spawned on the same frame (e.g. the first due to vertical movement, the second due to pose change),
; and the first one returns early (e.g. due to Samus pose), then there's two situations to analyse:
; If the second trigger PLM doesn't return early (not sure if possible), then it finds the first trigger PLM in the loop
; Otherwise, if the second trigger PLM also returns early, then its block index isn't cleared,
; and a future trigger PLM will find this second trigger PLM in the loop

; In the latter situation, the second trigger PLM is deleted, so advancing its instruction list has no effect
; In the former situation (if it's possible), the first trigger PLM will not have been deleted yet (it's relying on the instruction list to do this),
; its instruction list would advance to $AAE5, which is normally used by PLM $B773 (crumble access to Tourian elevator),
; which would cause a bunch of blocks to be erased
    LDA.W PowerBombExplosionStatus : BNE .collisionReturn
    LDA.W Pose : CMP.W #$0001 : BEQ .standing
    CMP.W #$0002 : BNE .collisionReturn

  .standing:
    LDA.W SaveStationLockoutFlag : BNE .collisionReturn
    LDA.W CollisionMovementDirection : AND.W #$000F : CMP.W #$0003 : BNE .collisionReturn
    TYX
    JSL Calculate_PLM_Block_Coordinates
    LDA.W SamusXPosition : SEC : SBC.W #$0008
    LSR #4 : CMP.W PLM_XBlock : BNE .collisionReturn
    TYX
    LDA.W PLM_BlockIndices,X
    STZ.W PLM_BlockIndices,X : STZ.W PLM_IDs,X
    LDX.W #$004E

  .loop:
    CMP.W PLM_BlockIndices,X : BEQ .found
    DEX #2 : BPL .loop
    SEC
    RTS

  .found:
    INC.W PLM_InstListPointers,X : INC.W PLM_InstListPointers,X
    LDA.W #$0001 : STA.L PLMExtra_InstructionTimers,X

  .collisionReturn:
    SEC
    RTS


;;; $B5EE: Setup - PLM $B76F (save station) ;;;
Setup_SaveStation:
;; Parameters:
;;     Y: PLM index

; Make PLM block a save station trigger
    LDX.W PLM_BlockIndices,Y
    LDA.W #$B04D ; block type + BTS
    JSR Write_Level_Data_Block_Type_and_BTS
    RTS


;;; $B5F8: Setup - PLM $B677 (Mother Brain's room escape door) ;;;
Setup_MotherBrainsRoomEscapeDoor:
;; Parameters:
;;     Y: PLM index

; Make PLM block a door block with BTS 1, extended downwards by 3 blocks
    LDX.W PLM_BlockIndices,Y
    LDA.W #$9001 ; block type + BTS
    JSR Write_Level_Data_Block_Type_and_BTS
    TXA : CLC : ADC.W RoomWidthBlocks : ADC.W RoomWidthBlocks : TAX
    LDA.W #$D0FF ; block type + BTS
    JSR Write_Level_Data_Block_Type_and_BTS
    TXA : CLC : ADC.W RoomWidthBlocks : ADC.W RoomWidthBlocks : TAX
    LDA.W #$D0FF ; block type + BTS
    JSR Write_Level_Data_Block_Type_and_BTS
    TXA : CLC : ADC.W RoomWidthBlocks : ADC.W RoomWidthBlocks : TAX
    LDA.W #$D0FF ; block type + BTS
    JSR Write_Level_Data_Block_Type_and_BTS
    RTS


PLMEntries_nothing:
    dw RTS_84B3CF
    dw InstList_PLM_Delete

PLMEntries_collisionReactionClearCarry:
; Collision reaction, special, BTS Brinstar 80h/81h. Clear carry
    dw Setup_ClearCarry
    dw InstList_PLM_Delete

if !FEATURE_KEEP_UNREFERENCED
UNUSED_PLMEntries_84B637:
; Unused. Set carry
    dw Setup_SetCarry
    dw InstList_PLM_Delete
endif ; !FEATURE_KEEP_UNREFERENCED

PLMEntries_rightwardsExtension:
; Rightwards extension
    dw Setup_RightwardsExtension
    dw InstList_PLM_Debug_RightwardsExtension

PLMEntries_leftwardsExtension:
; Leftwards extension
    dw Setup_LeftwardsExtension
    dw InstList_PLM_Debug_LeftwardsExtension

PLMEntries_downwardsExtension:
; Downwards extension
    dw Setup_DownwardsExtension
    dw InstList_PLM_Debug_DownwardsExtension

PLMEntries_upwardsExtension:
; Upwards extension
    dw Setup_UpwardsExtension
    dw InstList_PLM_Debug_UpwardsExtension

PLMEntries_wreckedShipEntranceTreadmillFromWest:
; Wrecked Ship entrance treadmill from west
    dw Setup_WreckedShipEntranceTreadmill
    dw InstList_PLM_WreckedShipEntranceTreadmillFromWest_0

PLMEntries_wreckedShipEntranceTreadmillFromEast:
; Wrecked Ship entrance treadmill from east
    dw Setup_WreckedShipEntranceTreadmill
    dw InstList_PLM_WreckedShipEntranceTreadmillFromEast_0

PLMEntries_insideReactionNothing_B653:
; Inside reaction, special air, BTS Norfair 80h. Nothing
    dw RTS_84B3CF
    dw InstList_PLM_Delete

PLMEntries_insideReactionNothing_B657:
; Inside reaction, special air, BTS Norfair 81h. Nothing
    dw RTS_84B3CF
    dw InstList_PLM_Delete

PLMEntries_insideReactionNothing_B65B:
; Inside reaction, special air, BTS Norfair 82h. Nothing
    dw RTS_84B3CF
    dw InstList_PLM_Delete

if !FEATURE_KEEP_UNREFERENCED
UNUSED_PLMEntries_84B65F:
; Unused. Draws a column 1AFB,00FF,00FF,12FB centered around PLM. Matches the level data of a zebetite
    dw Setup_DeactivatePLM
    dw UNUSED_InstList_PLM_84ABE3

UNUSED_PLMEntries_84B663:
; Unused. Draws a column 8AFB,80FF,80FF,82FB centered around PLM. Solid version of $B65F
    dw Setup_DeactivatePLM
    dw UNUSED_InstList_PLM_84ABE9

UNUSED_PLMEntries_84B667:
; Unused. Open escape gate that becomes closed after 18h frames
    dw Setup_DeactivatePLM
    dw UNUSED_InstList_PLM_84ABEF_0

UNUSED_PLMEntries_84B66B:
; Unused. Blank air
    dw Setup_DeactivatePLM
    dw UNUSED_InstList_PLM_84ABF9

UNUSED_PLMEntries_84B66F:
; Unused. Blank solid
    dw Setup_DeactivatePLM
    dw UNUSED_PLM_InstList_84ABFF
endif ; !FEATURE_KEEP_UNREFERENCED

PLMEntries_fillMotherBrainsWall:
; Fill Mother Brain's wall
    dw Setup_DeactivatePLM
    dw InstList_PLM_FillMotherBrainsWall

PLMEntries_motherBrainsRoomEscapeDoor:
; Mother Brain's room escape door
    dw Setup_MotherBrainsRoomEscapeDoor
    dw InstList_PLM_MotherBrainsRoomEscapeDoor

PLMEntries_motherBrainsBackgroundRow2:
; Mother Brain's background row 2
    dw Setup_DeactivatePLM
    dw InstList_PLM_MotherBrainsBackgroundRow2

PLMEntries_motherBrainsBackgroundRow3:
; Mother Brain's background row 3
    dw Setup_DeactivatePLM
    dw InstList_PLM_MotherBrainsBackgroundRow3

PLMEntries_motherBrainsBackgroundRow4:
; Mother Brain's background row 4
    dw Setup_DeactivatePLM
    dw InstList_PLM_MotherBrainsBackgroundRow4

PLMEntries_motherBrainsBackgroundRow5:
; Mother Brain's background row 5
    dw Setup_DeactivatePLM
    dw InstList_PLM_MotherBrainsBackgroundRow5

PLMEntries_motherBrainsBackgroundRow6:
; Mother Brain's background row 6
    dw Setup_DeactivatePLM
    dw InstList_PLM_MotherBrainsBackgroundRow6

PLMEntries_motherBrainsBackgroundRow7:
; Mother Brain's background row 7
    dw Setup_DeactivatePLM
    dw InstList_PLM_MotherBrainsBackgroundRow7

PLMEntries_motherBrainsBackgroundRow8:
; Mother Brain's background row 8
    dw Setup_DeactivatePLM
    dw InstList_PLM_MotherBrainsBackgroundRow8

PLMEntries_motherBrainsBackgroundRow9:
; Mother Brain's background row 9
    dw Setup_DeactivatePLM
    dw InstList_PLM_MotherBrainsBackgroundRow9

PLMEntries_motherBrainsBackgroundRowA:
; Mother Brain's background row Ah
    dw Setup_DeactivatePLM
    dw InstList_PLM_MotherBrainsBackgroundRowA

PLMEntries_motherBrainsBackgroundRowB:
; Mother Brain's background row Bh
    dw Setup_DeactivatePLM
    dw InstList_PLM_MotherBrainsBackgroundRowB

PLMEntries_motherBrainsBackgroundRowC:
; Mother Brain's background row Ch
    dw Setup_DeactivatePLM
    dw InstList_PLM_MotherBrainsBackgroundRowC

PLMEntries_motherBrainsBackgroundRowD:
; Mother Brain's background row Dh
    dw Setup_DeactivatePLM
    dw InstList_PLM_MotherBrainsBackgroundRowD

if !FEATURE_KEEP_UNREFERENCED
UNUSED_PLMEntries_84B6AB:
; Unused. Mother Brain's background row Eh
    dw Setup_DeactivatePLM
    dw UNUSED_InstList_PLM_84AC59

UNUSED_PLMEntries_84B6AF:
; Unused. Mother Brain's background row Fh
    dw Setup_DeactivatePLM
    dw UNUSED_InstList_PLM_84AC5F
endif ; !FEATURE_KEEP_UNREFERENCED

PLMEntries_clearCeilingBlockInMotherBrainsRoom:
; Clear ceiling block in Mother Brain's room
    dw Setup_DeactivatePLM
    dw InstList_PLM_ClearCeilingBlockInMotherBrainsRoom

PLMEntries_clearCeilingTubeInMotherBrainsRoom:
; Clear ceiling tube in Mother Brain's room
    dw Setup_DeactivatePLM
    dw InstList_PLM_ClearCeilingTubeInMotherBrainsRoom

PLMEntries_clearMotherBrainsBottomMiddleSideTube:
; Clear Mother Brain's bottom-middle-side tube
    dw Setup_DeactivatePLM
    dw InstList_PLM_ClearMotherBrainsBottomMiddleSideTube

PLMEntries_clearMotherBrainsBottomMiddleTubes:
; Clear Mother Brain's bottom-middle tubes
    dw Setup_DeactivatePLM
    dw InstList_PLM_ClearMotherBrainsBottomMiddleTubes

PLMEntries_clearMotherBrainsBottomLeftTube:
; Clear Mother Brain's bottom-left tube
    dw Setup_DeactivatePLM
    dw InstList_PLM_ClearMotherBrainsBottomLeftTube

PLMEntries_clearMotherBrainsBottomRightTube:
; Clear Mother Brain's bottom-right tube
    dw Setup_DeactivatePLM
    dw InstList_PLM_ClearMotherBrainsBottomRightTube

PLMEntries_insideReactionBrinstarFloorPlant:
; Inside reaction, special air, BTS Brinstar 80h. Floor plant
    dw Setup_BrinstarFloorPlant
    dw InstList_PLM_BrinstarFloorPlant_0

PLMEntries_insideReactionBrinstarCeilingPlant:
; Inside reaction, special air, BTS Brinstar 81h. Ceiling plant
    dw Setup_BrinstarCeilingPlant
    dw InstList_PLM_BrinstarCeilingPlant_0

PLMEntries_mapStation:
; Map station
    dw Setup_MapStation
    dw InstList_PLM_MapStation_0

PLMEntries_mapStationRightAccess:
; Collision reaction, special, BTS 47h. Map station right access
    dw Setup_MapStationRightAccess
    dw InstList_PLM_MapStationRightAccess

PLMEntries_mapStationLeftAccess:
; Collision reaction, special, BTS 48h. Map station left access
    dw Setup_MapStationLeftAccess
    dw InstList_PLM_MapStationLeftAccess

PLMEntries_energyStation:
; Energy station
    dw Setup_EnergyStation
    dw InstList_PLM_EnergyStation_0

PLMEntries_energyStationRightAccess:
; Collision reaction, special, BTS 49h. Energy station right access
    dw Setup_EnergyStationRightAccess
    dw InstList_PLM_EnergyStationRightAccess_0

PLMEntries_energyStationLeftAccess:
; Collision reaction, special, BTS 4Ah. Energy station left access
    dw Setup_EnergyStationLeftAccess
    dw InstList_PLM_EnergyStationLeftAccess_0

PLMEntries_missileStation:
; Missile station
    dw Setup_MissileStation
    dw InstList_PLM_MissileStation_0

PLMEntries_missileStationRightAccess:
; Collision reaction, special, BTS 4Bh. Missile station right access
    dw Setup_MissileStationRightAccess
    dw InstList_PLM_MissileStationRightAccess_0

PLMEntries_missileStationLeftAccess:
; Collision reaction, special, BTS 4Ch. Missile station left access
    dw Setup_MissileStationLeftAccess
    dw InstList_PLM_MissileStationLeftAccess_0

if !FEATURE_KEEP_UNREFERENCED
PLMEntries_nothing_84B6F7:
; Unused. Unknown. 4 frame animation loop of 1x2 spike air blocks, tile numbers don't match any tilesets
    dw Setup_DeactivatePLM
    dw InstList_PLM_Nothing_84AED6

PLMEntries_nothing_84B6FB:
; Unused. 2x2 version of $B6F7
    dw Setup_DeactivatePLM
    dw InstList_PLM_Nothing_84AF1C
endif ; !FEATURE_KEEP_UNREFERENCED

PLMEntries_scrollPLMTrigger:
; Collision reaction, special, BTS 46h / inside reaction, special air, BTS 46h. Scroll PLM trigger
    dw Setup_ScrollBlockTouchPLM
    dw InstList_PLM_Delete

PLMEntries_ScrollPLM:
; Scroll PLM
    dw Setup_ScrollPLM
    dw InstList_PLM_ScrollPLM_0

if !FEATURE_KEEP_UNREFERENCED
PLMEntries_unusedSolidScrollPLM:
; Unused. Solid scroll PLM
    dw Setup_SolidScrollPLM
    dw InstList_PLM_SolidScrollPLM_0
endif ; !FEATURE_KEEP_UNREFERENCED

PLMEntries_elevatorPlatform:
; Elevator platform
    dw Setup_DeactivatePLM
    dw InstList_PLM_ElevatorPlatform

PLMEntries_insideReactionCrateria80:
; Inside reaction, special air, BTS Crateria/Debug 80h
    dw Setup_IcePhysics
    dw InstList_PLM_Delete

PLMEntries_insideReactionQuicksandSurface:
; Inside reaction, special air, BTS Maridia 80h/81h/82h. Quicksand surface
    dw Setup_QuicksandSurface
    dw InstList_PLM_Delete

if !FEATURE_KEEP_UNREFERENCED
UNUSED_PLMEntries_84B717:
; Unused. Clone of PLMEntries_insideReactionQuicksandSurface
    dw Setup_QuicksandSurface
    dw InstList_PLM_Delete

UNUSED_PLMEntries_84B71B:
; Unused. Clone of PLMEntries_insideReactionQuicksandSurface
    dw Setup_QuicksandSurface
    dw InstList_PLM_Delete
endif ; !FEATURE_KEEP_UNREFERENCED

PLMEntries_insideReactionSubmergingQuicksand:
; Inside reaction, special air, BTS Maridia 83h. Submerging quicksand
    dw Setup_Inside_SubmergingQuicksand
    dw InstList_PLM_Delete

PLMEntries_insideReactionSandFallsSlow:
; Inside reaction, special air, BTS Maridia 84h. Sand falls - slow
    dw Setup_SandfallsSlow
    dw InstList_PLM_Delete

PLMEntries_insideReactionSandFallsFast:
; Inside reaction, special air, BTS Maridia 85h. Sand falls - fast
    dw Setup_SandfallsFast
    dw InstList_PLM_Delete

PLMEntries_collisionReactionQuicksandSurface:
; Collision reaction, special, BTS Maridia 80h/81h/82h. Quicksand surface
    dw Setup_QuicksandSurface_BTS85
    dw InstList_PLM_Delete

if !FEATURE_KEEP_UNREFERENCED
UNUSED_PLMEntries_84B72F:
; Unused. Clone of PLMEntries_collisionReactionQuicksandSurface
    dw Setup_QuicksandSurface_BTS85
    dw InstList_PLM_Delete

UNUSED_PLMEntries_84B733:
; Unused. Clone of PLMEntries_collisionReactionQuicksandSurface
    dw Setup_QuicksandSurface_BTS85
    dw InstList_PLM_Delete
endif ; !FEATURE_KEEP_UNREFERENCED

PLMEntries_collisionReactionSubmergingQuicksand:
; Collision reaction, special, BTS Maridia 83h. Submerging quicksand
    dw Setup_Collision_SubmergingQuicksand
    dw InstList_PLM_Delete

PLMEntries_collisionReactionSandFallsSlow:
; Collision reaction, special, BTS Maridia 84h. Sand falls - slow
    dw Setup_CollisionReaction_SandFalls
    dw InstList_PLM_Delete

PLMEntries_collisionReactionSandFallsFast:
; Collision reaction, special, BTS Maridia 85h. Sand falls - fast
    dw Setup_CollisionReaction_SandFalls
    dw InstList_PLM_Delete

if !FEATURE_KEEP_UNREFERENCED
UNUSED_PLMEntries_unusedTorizoDrool_84B743:
; Unused. Torizo drool?
    dw UNUSED_Setup_TorizoDrool_84B3E3
    dw InstList_PLM_Delete
endif ; !FEATURE_KEEP_UNREFERENCED

PLMEntries_clearCrocomiresBridge:
; Clear Crocomire's bridge
    dw Setup_DeactivatePLM
    dw InstList_PLM_ClearCrocomiresBridge

PLMEntries_crumbleABlockOfCrocomiresBridge:
; Crumble a block of Crocomire's bridge
    dw Setup_DeactivatePLM
    dw InstList_PLM_CrumbleABlockOfCrocomiresBridge

PLMEntries_clearABlockOfCrocomiresBridge:
; Clear a block of Crocomire's bridge
    dw Setup_DeactivatePLM
    dw InstList_PLM_ClearABlockOfCrocomiresBridge

PLMEntries_clearCrocomireInvisibleWall:
; Clear Crocomire invisible wall
    dw Setup_DeactivatePLM
    dw InstList_PLM_ClearCrocomiresInvisibleWall

PLMEntries_createCrocomireInvisibleWall:
; Create Crocomire invisible wall
    dw Setup_DeactivatePLM
    dw InstList_PLM_CreateCrocomiresInvisibleWall

if !FEATURE_KEEP_UNREFERENCED
PLMEntries_unusedDraw13BlankAirTiles:
; Unused. Draw 13 blank air tiles
    dw RTS_84B3CF
    dw UNUSED_InstList_PLM_Draw13BlankAirTiles_84B03E

PLMEntries_unusedDraw13BlankSolidTiles:
; Unused. Draw 13 blank solid tiles
    dw RTS_84B3CF
    dw UNUSED_InstList_PLM_Draw13BlankSolidTiles_84B044
endif ; !FEATURE_KEEP_UNREFERENCED

PLMEntries_clearBabyMetroidInvisibleWall:
; Clear Shitroid invisible wall
    dw Setup_ClearBabyMetroidInvisibleWall
    dw InstList_PLM_Delete

PLMEntries_createBabyMetroidInvisibleWall:
; Create Shitroid invisible wall
    dw CreateBabyMetroidInvisibleWall
    dw InstList_PLM_Delete

PLMEntries_saveStationTrigger:
; Collision reaction, special, BTS 4Dh. Save station trigger
    dw Setup_CollisionReaction_SaveStationTrigger
    dw InstList_PLM_Delete

PLMEntries_saveStation:
; Save station
    dw Setup_SaveStation
    dw InstList_PLM_SaveStation_0

PLMEntries_crumbleAccessToTourianElevator:
; Crumble access to Tourian elevator
    dw Setup_DeactivatePLM
    dw InstList_PLM_CrumbleAccessToTourianElevator_0

PLMEntries_clearAccessToTourianElevator:
; Clear access to Tourian elevator
    dw Setup_DeactivatePLM
    dw InstList_PLM_ClearAccessToTourianElevator


;;; $B77B: Instruction list - PLM $B781 (draw Phantoon's door during boss fight) ;;;
InstList_drawPhantoonsDoorDuringBossFight:
    dw $0001,DrawInst_DrawPhantoonsDoorDuringBossFight
    dw Instruction_PLM_Delete


PLMEntries_drawPhantoonsDoorDuringBossFight:
; Draw Phantoon's door during boss fight
    dw Setup_DeactivatePLM
    dw InstList_drawPhantoonsDoorDuringBossFight


;;; $B785: Instruction list - PLM $B78B (restore Phantoon's door after boss fight) ;;;
InstList_restorePhantoonsDoorDuringBossFight:
    dw $0001,DrawInst_RestorePhantoonsDoorDuringBossFight
    dw Instruction_PLM_Delete


PLMEntries_restorePhantoonsDoorDuringBossFight:
; Restore Phantoon's door after boss fight
    dw Setup_DeactivatePLM
    dw InstList_restorePhantoonsDoorDuringBossFight

PLMEntries_crumbleSporeSpawnCeiling:
; Crumble Spore Spawn ceiling
    dw Setup_DeactivatePLM
    dw InstList_PLM_CrumbleSporeSpawnCeiling

PLMEntries_clearSporeSpawnCeiling:
; Clear Spore Spawn ceiling
    dw Setup_DeactivatePLM
    dw InstList_PLM_ClearSporeSpawnCeiling

PLMEntries_clearBotwoonWall:
; Clear Botwoon wall
    dw RTS_84AB27
    dw InstList_PLM_ClearBotwoonWall

PLMEntries_crumbleBotwoonWall:
; Crumble Botwoon wall
    dw Setup_CrumbleBotwoonWall_Wait40Frames
    dw InstList_PLM_CrumbleBotwoonWall_0

if !FEATURE_KEEP_UNREFERENCED
PLMEntries_unusedSetKraidCeilingBlockToBackground1:
; Unused. Set Kraid ceiling block to background 1
    dw Setup_DeactivatePLM
    dw InstList_PLM_SetKraidCeilingBlockToBackground1
endif ; !FEATURE_KEEP_UNREFERENCED

PLMEntries_crumbleKraidCeilingBlockIntoBackground1:
; Crumble Kraid ceiling block into background 1
    dw Setup_DeactivatePLM
    dw InstList_PLM_CrumbleKraidCeilingBlockIntoBackground1

PLMEntries_setKraidCeilingBlockToBackground2:
; Set Kraid ceiling block to background 2
    dw Setup_DeactivatePLM
    dw InstList_PLM_SetKraidCeilingBlockToBackground2

PLMEntries_crumbleKraidCeilingBlockIntoBackground2:
; Crumble Kraid ceiling block into background 2
    dw Setup_DeactivatePLM
    dw InstList_PLM_CrumbleKraidCeilingBlockIntoBackground2

PLMEntries_SetKraidCeilingBlockToBackground3:
; Set Kraid ceiling block to background 3
    dw Setup_DeactivatePLM
    dw InstList_PLM_SetKraidCeilingBlockToBackground3

PLMEntries_crumbleKraidCeilingBlockIntoBackground3:
; Crumble Kraid ceiling block into background 3
    dw Setup_DeactivatePLM
    dw InstList_PLM_CrumbleKraidCeilingBlockIntoBackground3

PLMEntries_clearKraidCeilingBlocks:
; Clear Kraid ceiling blocks
    dw Setup_DeactivatePLM
    dw InstList_PLM_ClearKraidCeiling

PLMEntries_clearKraidSpikeBlocks:
; Clear Kraid spike blocks
    dw Setup_DeactivatePLM
    dw InstList_PLM_ClearKraidSpikeBlocks

PLMEntries_crumbleKraidSpikeBlocks:
; Crumble Kraid spike blocks
    dw Setup_DeactivatePLM
    dw InstList_PLM_CrumbleKraidSpikeBlocks_0


;;; $B7C3: Setup - PLM $B7EB (enable sounds in 20h frames, or F0h frames if on Ceres) ;;;
Setup_EnableSoundsIn20Frames_F0FramesIfCeres:
;; Parameters:
;;     Y: PLM index
    LDA.W AreaIndex : CMP.W #$0006 : BNE .ceres
    LDA.W #$0020
    BRA +

  .ceres:
    LDA.W #$00F0

+   STA.W PLM_Timers,Y
    LDA.W #PreInstruction_PLM_DecTimer_EnableSounds_DeletePLMIfZero : STA.W PLM_PreInstructions,Y
    RTS


;;; $B7DD: Pre-instruction - decrement timer, enable sounds and delete PLM if zero ;;;
PreInstruction_PLM_DecTimer_EnableSounds_DeletePLMIfZero:
;; Parameter:
;;     X: PLM index

; Used by PLM $B7EB (enable sounds in 20h frames, or F0h frames if on Ceres)
    DEC.W PLM_Timers,X : BNE .return
    STZ.W DisableSounds : STZ.W PLM_IDs,X

  .return:
    RTS


;;; $B7E9: Instruction list - PLM $B7EB (enable sounds in 20h frames, or F0h frames if on Ceres) ;;;
InstList_PLM_EnableSoundsIn20Frames_F0FramesIfCeres:
    dw Instruction_PLM_Sleep


;;; $B7EB: PLM entry - enable sounds in 20h frames, or F0h frames if on Ceres ;;;
PLMEntries_enableSoundsIn20Frames_F0FramesIfCeres:
    dw Setup_EnableSoundsIn20Frames_F0FramesIfCeres
    dw InstList_PLM_EnableSoundsIn20Frames_F0FramesIfCeres


;;; $B7EF: Pre-instruction - wake PLM and start lavaquake if speed booster collected ;;;
PreInst_PLM_WakePLM_StartLavaquakeIfSpeedBoosterCollected:
;; Parameter:
;;     X: PLM index

; Used by PLM $B8AC (speed booster escape)
    LDA.W CollectedItems : AND.W #$2000 : BNE .collectedSpeedBooster
    LDA.W #$FFFF : STA.W FX_TargetYPosition
    STZ.W FX_YSubVelocity : STZ.W FX_Timer
    STZ.W EarthquakeTimer : STZ.W PLM_IDs,X
    RTS

  .collectedSpeedBooster:
    LDA.W FX_TargetYPosition : BMI .deletePLM
    LDA.W #$FF80 : STA.W FX_YSubVelocity
    LDA.W #$0001 : STA.L PLMExtra_InstructionTimers,X
    INC.W PLM_InstListPointers,X : INC.W PLM_InstListPointers,X
    STZ.W PLM_Timers,X
    RTS

  .deletePLM:
    STZ.W PLM_IDs,X
    RTS


;;; $B82A: Pre-instruction - wake PLM and start FX motion if Samus is far enough left ;;;
PreInst_PLM_WakePLM_StartFXMotionIfSamusIsFarEnoughLeft:
;; Parameter:
;;     X: PLM index

; Used by PLM $B8AC (speed booster escape)
    LDA.W #$0AE0 : CMP.W SamusXPosition : BCC .return
    LDA.W #$0001 : STA.W FX_Timer : STA.L PLMExtra_InstructionTimers,X
    INC.W PLM_InstListPointers,X : INC.W PLM_InstListPointers,X
    STZ.W PLM_Timers,X

  .return:
    RTS


;;; $B846: Pre-instruction - advance lava as Samus moves left, set speed booster lavaquake event when done ;;;
PreInst_PLM_AdvanceLavaAsSamusMovesLeft_SetLavaquakeEvent:
;; Parameter:
;;     X: PLM index

; Used by PLM $B8AC (speed booster escape)
    LDA.W PLM_Timers,X : TAY
    LDA.W .targetSamusXpos,Y : BMI .setLavaquake
    CMP.W SamusXPosition : BCC .return
    LDA.W .maxFXYpos,Y : CMP.W FX_BaseYPosition : BCS +
    STA.W FX_BaseYPosition

+   LDA.W .FXYVelocity,Y : STA.W FX_YSubVelocity
    TYA : CLC : ADC.W #$0006 : STA.W PLM_Timers,X

  .return:
    RTS

  .setLavaquake:
    LDA.W #$0015
    JSL MarkEvent_inA
    RTS

;        _______________ Target Samus X position
;       |      _________ Maximum FX Y position
;       |     |      ___ FX Y velocity
;       |     |     |
  .targetSamusXpos:
    dw $072B
  .maxFXYpos:
    dw       $01BF
  .FXYVelocity:
    dw             $FF50
    dw $050A,$0167,$FF20
    dw $0244,$0100,$FF20
    dw $8000


;;; $B88A: Instruction list - PLM $B8AC (speed booster escape) ;;;
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


;;; $B89C: Setup - PLM $B8AC (speed booster escape) ;;;
Setup_SpeedBoosterEscape:
;; Parameters:
;;     Y: PLM index
    LDA.W #$0015
    JSL CheckIfEvent_inA_HasHappened
    BCC .return
    LDA.W #$0000 : STA.W PLM_IDs,Y

  .return:
    RTS


;;; $B8AC: PLM entry - speed booster escape ;;;
PLMEntries_SpeedBoosterEscape:
    dw Setup_SpeedBoosterEscape
    dw InstList_PLM_SpeedBoosterEscape


;;; $B8B0: Pre-instruction - Shaktool's room ;;;
PreInstruction_PLM_ShaktoolsRoom:
;; Parameter:
;;     X: PLM index

; Used by PLM $B8EB (Shaktool's room)
    LDA.W PowerBombExplosionStatus : BEQ .powerBombNotActive
    LDA.W #$0101 : STA.L Scrolls
    LDA.W #$0101 : STA.L Scrolls+2

  .powerBombNotActive:
    LDA.W #$0348 : CMP.W SamusXPosition : BCS .return
    LDA.W #$000D
    JSL MarkEvent_inA
    STZ.W PLM_IDs,X

  .return:
    RTS


;;; $B8D6: Instruction list - PLM $B8EB (Shaktool's room) ;;;
InstList_PLM_ShaktoolsRoom:
    dw Instruction_PLM_PreInstruction_inY
    dw PreInstruction_PLM_ShaktoolsRoom
    dw Instruction_PLM_Sleep


;;; $B8DC: Setup - PLM $B8EB (Shaktool's room) ;;;
Setup_ShaktoolsRoom:
; Scroll 0 = blue, 1..3 = red
    LDA.W #$0001 : STA.L Scrolls
    LDA.W #$0000 : STA.L Scrolls+2
    RTS


;;; $B8EB: PLM entry - Shaktool's room ;;;
PLMEntries_shaktoolsRoom:
    dw Setup_ShaktoolsRoom
    dw InstList_PLM_ShaktoolsRoom


;;; $B8EF: RTS. Setup - PLM $B8F9 (Maridia elevatube) ;;;
Setup_MaridiaElevatube:
    RTS


;;; $B8F0: Instruction list - PLM $B8F9 (Maridia elevatube) ;;;
InstList_PLM_MaridiaElevatube:
; The draw instruction is just some garbage block, it only exists to create a 10h frame delay (this PLM is created at (1, 0) so is hidden by the HUD)
; I have no idea what sound effect this is
    dw $0010,DrawInst_CrumbleKraidCeiling_CrumbleKraidSpikes_Elevatube
    dw Instruction_PLM_QueueSound_Y_Lib2_Max6 : db $15
    dw Instruction_PLM_Delete


;;; $B8F9: PLM entry - Maridia elevatube ;;;
PLMEntries_maridiaElevatube:
; This PLM effectively does nothing
    dw Setup_MaridiaElevatube
    dw InstList_PLM_MaridiaElevatube


;;; $B8FD: Wake PLM if Samus is below and right of target position ;;;
WakePLMIfSamusIsBelowRightOfTarget:
;; Parameters:
;;     X: PLM index
;;     $12: Target X position
;;     $14: Target Y position
    LDA.B DP_Temp12 : CMP.W SamusXPosition : BCS .return
    LDA.B DP_Temp14 : CMP.W SamusYPosition : BCS .return
    INC.W PLM_InstListPointers,X : INC.W PLM_InstListPointers,X
    LDA.W #$0001 : STA.L PLMExtra_InstructionTimers,X

  .return:
    RTS


;;; $B919: Instruction list - PLM $B964 (make old Tourian escape shaft fake wall explode) ;;;
InstList_PLM_MakeOldTourianEscapeShaftFakeWallExplode:
    dw Instruction_PLM_PreInstruction_inY
    dw PreInstruction_PLM_MakeOldTourianEscapeShaftFakeWallExplode
    dw Instruction_PLM_Sleep
    dw Instruction_PLM_ClearPreInstruction
    dw $0001,DrawInst_OldTourianEscapeShaftBlocks
    dw Instruction_PLM_Delete


;;; $B927: Pre-instruction - make old Tourian escape shaft fake wall explode ;;;
PreInstruction_PLM_MakeOldTourianEscapeShaftFakeWallExplode:
;; Parameter:
;;     X: PLM index
    LDA.W #$00F0 : STA.B DP_Temp12
    LDA.W #$0820 : STA.B DP_Temp14
    JSR WakePLMIfSamusIsBelowRightOfTarget
    BCS .return
    PHY
    LDY.W #EnemyProjectile_OldTourianEscapeShaftFakeWallExplosion
    JSL SpawnEnemyProjectileY_ParameterA_RoomGraphics
    PLY

  .return:
    RTS


;;; $B940: Instruction list - PLM $B968 (raise acid in escape room before old Tourian escape shaft) ;;;
InstList_PLM_RaiseAcidInEscapeBeforeOldTourianEscapeShaft:
    dw Instruction_PLM_PreInstruction_inY
    dw PreInst_PLM_RaiseAcidInEscapeRoomBeforeOldTourianEscapeShaft
    dw Instruction_PLM_Sleep
    dw Instruction_PLM_Delete


;;; $B948: Pre-instruction - raise acid in escape room before old Tourian escape shaft ;;;
PreInst_PLM_RaiseAcidInEscapeRoomBeforeOldTourianEscapeShaft:
;; Parameter:
;;     X: PLM index
    LDA.W #$00F0 : STA.B DP_Temp12
    LDA.W #$0540 : STA.B DP_Temp14
    JSR WakePLMIfSamusIsBelowRightOfTarget
    BCS .return
    LDA.W #$FF98 : STA.W FX_YSubVelocity
    LDA.W #$0010 : STA.W FX_Timer

  .return:
    RTS


;;; $B964: PLM entry - make old Tourian escape shaft fake wall explode ;;;
PLMEntries_MakeOldTourianEscapeShaftFakeWallExplode:
    dw Setup_DeactivatePLM
    dw InstList_PLM_MakeOldTourianEscapeShaftFakeWallExplode


;;; $B968: PLM entry - raise acid in escape room before old Tourian escape shaft ;;;
PLMEntries_RaiseAcidInEscapeRoomBeforeOldTourianEscapeShaft:
    dw Setup_DeactivatePLM
    dw InstList_PLM_RaiseAcidInEscapeBeforeOldTourianEscapeShaft


;;; $B96C: Setup - PLM $B974 (shot/bombed/grappled reaction, shootable, BTS 10h. Gate block) ;;;
Setup_GateBlock:
    STZ.B DP_Temp26
    LDA.W #$FFFF : STA.B DP_Temp28
    RTS


;;; $B974: PLM entry - shot/bombed/grappled reaction, shootable, BTS 10h. Gate block ;;;
PLMEntries_gateBlock:
    dw Setup_GateBlock
    dw InstList_PLM_Delete


;;; $B978: Setup - PLM $B9C1 (shot/bombed/grappled reaction, shootable, BTS 4Fh. Critters escape block) ;;;
Setup_Reaction_CrittersEscapeBlock:
;; Parameters:
;;     Y: PLM index

; Sets the PLM respawn block, but never uses it
    LDX.W ProjectileIndex
    LDA.W SamusProjectile_Types,X : BNE .projectile
    AND.W #$0F00 ; >.<
    LDA.W #$0000 : STA.W PLM_IDs,Y
    RTS

  .projectile:
    LDX.W PLM_BlockIndices,Y
    LDA.L LevelData,X : AND.W #$F000 : ORA.W #$009F : STA.W PLM_Vars,Y
    AND.W #$8FFF : STA.L LevelData,X
    RTS


;;; $B9A2: Instruction list - PLM $B9C1 (shot/bombed/grappled reaction, shootable, BTS 4Fh. Critters escape block) ;;;
InstList_PLM_CrittersEscapeBlock:
    dw Instruction_PLM_QueueSound_Y_Lib2_Max6 : db $0A
    dw $0004,DrawInst_CrittersEscapeBlock_0
    dw $0004,DrawInst_CrittersEscapeBlock_1
    dw $0004,DrawInst_CrittersEscapeBlock_2
    dw $0001,DrawInst_CrittersEscapeBlock_3
    dw Instruction_PLM_SetCrittersEscapedEvent
    dw Instruction_PLM_Delete


;;; $B9B9: Instruction - set critters escaped event ;;;
Instruction_PLM_SetCrittersEscapedEvent:
    LDA.W #$000F
    JSL MarkEvent_inA
    RTS


;;; $B9C1: PLM entry - shot/bombed/grappled reaction, shootable, BTS 4Fh. Critters escape block ;;;
PLMEntries_Reaction_CrittersEscapeBlock:
    dw Setup_Reaction_CrittersEscapeBlock
    dw InstList_PLM_CrittersEscapeBlock


;;; $B9C5: Setup - PLM $B9ED (critters escape block) ;;;
Setup_CrittersEscapeBlock:
;; Parameters:
;;     Y: PLM index

; Make PLM block a critters escape block, extended downwards by 2 blocks
    LDX.W PLM_BlockIndices,Y
    LDA.W #$C04F ; block type + BTS
    JSR Write_Level_Data_Block_Type_and_BTS
    TXA : CLC : ADC.W RoomWidthBlocks : ADC.W RoomWidthBlocks : TAX
    LDA.W #$D0FF ; block type + BTS
    JSR Write_Level_Data_Block_Type_and_BTS
    TXA : CLC : ADC.W RoomWidthBlocks : ADC.W RoomWidthBlocks : TAX
    LDA.W #$D0FF ; block type + BTS
    JSR Write_Level_Data_Block_Type_and_BTS
    RTS


;;; $B9ED: PLM entry - critters escape block ;;;
PLMEntries_CrittersEscapeBlock:
    dw Setup_CrittersEscapeBlock
    dw InstList_PLM_Delete


;;; $B9F1: Setup - PLM $BA48 (turn Ceres elevator door to solid blocks during escape) ;;;
Setup_TurnCeresElevatorDoorToSolidBlocksDuringEscape:
;; Parameters:
;;     Y: PLM index
    LDX.W PLM_BlockIndices,Y
    LDA.L LevelData,X : AND.W #$0FFF : ORA.W #$8000 : STA.L LevelData,X
    TXA : CLC : ADC.W RoomWidthBlocks : ADC.W RoomWidthBlocks : TAX
    LDA.L LevelData,X : AND.W #$0FFF : ORA.W #$8000 : STA.L LevelData,X
    TXA : CLC : ADC.W RoomWidthBlocks : ADC.W RoomWidthBlocks : TAX
    LDA.L LevelData,X : AND.W #$0FFF : ORA.W #$8000 : STA.L LevelData,X
    TXA : CLC : ADC.W RoomWidthBlocks : ADC.W RoomWidthBlocks : TAX
    LDA.L LevelData,X : AND.W #$0FFF : ORA.W #$8000 : STA.L LevelData,X
    RTS


;;; $BA48: PLM entry - turn Ceres elevator door to solid blocks during escape ;;;
PLMEntries_turnCeresElevatorDoorToSolidBlocksDuringEscape:
    dw Setup_TurnCeresElevatorDoorToSolidBlocksDuringEscape
    dw InstList_PLM_Delete


;;; $BA4C: Instruction list - closing - PLM $BAF4 (Bomb Torizo grey door) ;;;
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


;;; $BA6F: Instruction - go to [[Y]] if Samus doesn't have bombs ;;;
Instruction_PLM_GotoYIfSamusDoesntHaveBombs:
;; Parameters:
;;     Y: Pointer to instruction arguments
;; Returns:
;;     Y: Pointer to next instruction
    LDA.W CollectedItems : BIT.W #$1000 : BEQ .noBombs
    INY #2
    RTS

  .noBombs:
    LDA.W $0000,Y : TAY
    RTS


;;; $BA7F: Instruction list - PLM $BAF4 (Bomb Torizo grey door) ;;;
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
;;; $BAD1: Unused. Setup ;;;
UNUSED_Setup_84BAD1:
;; Parameters:
;;     Y: PLM index

; Would be the setup for the Bomb Torizo grey door, just the same as the generic grey door setup, but with a hard coded grey door type
    LDA.W PLM_RoomArgs+1,Y : AND.W #$007C : LSR ; >.<
    LDA.W #$0004 : STA.W PLM_Vars,Y
    LDA.W PLM_RoomArgs,Y : AND.W #$83FF : ORA.W #$8000 : STA.W PLM_RoomArgs,Y
    LDX.W PLM_BlockIndices,Y
    LDA.W #$C044 ; block type + BTS
    JSR Write_Level_Data_Block_Type_and_BTS
    RTS
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $BAF4: PLM entry - Bomb Torizo grey door ;;;
PLMEntries_bombTorizoGreyDoor:
    dw Setup_GreyDoor
    dw InstList_PLM_BombTorizoGreyDoor_0
    dw InstList_PLM_BombTorizoGreyDoor


;;; $BAFA: Setup - PLM $BB05 (Wrecked Ship attic) ;;;
Setup_WreckedShipAttic:
    SEP #$20 : REP #$20
    RTS


;;; $BAFF: Instruction list - PLM $BB05 (Wrecked Ship attic) ;;;
InstList_PLM_WreckedShipAttic:
    dw Instruction_PLM_PreInstruction_inY
    dw Setup_WreckedShipAttic
    dw Instruction_PLM_Sleep


;;; $BB05: PLM entry - Wrecked Ship attic ;;;
PLMEntries_wreckedShipAttic:
    dw Setup_WreckedShipAttic
    dw InstList_PLM_WreckedShipAttic


;;; $BB09: Setup - PLM $BB30 (clear Crateria mainstreet escape passage if critters escaped) ;;;
Setup_ClearCrateriaMainstreetEscapePassageIfCrittersEscaped:
;; Parameters:
;;     Y: PLM index
    LDA.W #$000F
    JSL CheckIfEvent_inA_HasHappened
    BCS .return
    LDA.W #$0000 : STA.W PLM_IDs,Y

  .return:
    RTS


;;; $BB19: Instruction list - PLM $BB30 (clear Crateria mainstreet escape passage if critters escaped) ;;;
InstList_PLM_ClearCrateriaMainstreetEscPassageIfCrittersEsc:
    dw $0001,DrawInst_CrateriaMainStreetEscape
    dw Instruction_PLM_MovePLMRight4Blocks
    dw $0001,DrawInst_CrateriaMainStreetEscape
    dw Instruction_PLM_Delete


;;; $BB25: Instruction - move PLM right 4 blocks ;;;
Instruction_PLM_MovePLMRight4Blocks:
;; Parameters:
;;     X: PLM index
    LDA.W PLM_BlockIndices,X : CLC : ADC.W #$0008 : STA.W PLM_BlockIndices,X
    RTS


;;; $BB30: PLM entry - clear Crateria mainstreet escape passage if critters escaped ;;;
PLMEntries_ClearCrateriaMainstreetEscapePassageIfCrittersEsc:
    dw Setup_ClearCrateriaMainstreetEscapePassageIfCrittersEscaped
    dw InstList_PLM_ClearCrateriaMainstreetEscPassageIfCrittersEsc


;;; $BB34: Instruction list - door $C8CA (gate that closes during escape in room after Mother Brain) ;;;
InstList_PLM_GateThatClosesDuringEscapeAfterMotherBrain_0:
    dw $0006,DrawInst_EscapeRoom1Gate_2
    dw Instruction_PLM_Delete


if !FEATURE_KEEP_UNREFERENCED
;;; $BB3A: Unused. Instruction list ;;;
UNUSED_InstList_84BB34:
; Half-closed escape gate that becomes open after 6 frames
    dw $0006,DrawInst_EscapeRoom1Gate_1
    dw $005E,DrawInst_EscapeRoom1Gate_0
    dw Instruction_PLM_Delete
endif ; !FEATURE_KEEP_UNREFERENCED


InstList_PLM_GateThatClosesDuringEscapeAfterMotherBrain_1:
;;; $BB44: Instruction list - closing - door $C8CA / PLM $C8D0 (gate that closes during escape in room after Mother Brain) ;;;
    dw $0002,DrawInst_EscapeRoom1Gate_0
    dw $0002,DrawInst_EscapeRoom1Gate_1
    dw $0002,DrawInst_EscapeRoom1Gate_2
    dw Instruction_PLM_Delete


;;; $BB52: Pre-instruction - wake PLM if triggered ;;;
PreInstruction_PLM_WakePLMIfTriggered:
;; Parameter:
;;     X: PLM index
    LDA.W PLM_Timers,X : BEQ .return
    INC.W PLM_InstListPointers,X : INC.W PLM_InstListPointers,X
    LDA.W #$0001 : STA.L PLMExtra_InstructionTimers,X
    LDA.W #.return : STA.W PLM_PreInstructions,X

  .return:
    RTS


;;; $BB6B: Pre-instruction - wake PLM if triggered or Samus is within 4 block column below PLM ;;;
PreInst_PLM_WakePLMIfTriggeredOrSamusWithin4BlockColumnBelow:
;; Parameter:
;;     X: PLM index
    JSL Calculate_PLM_Block_Coordinates
    LDA.W SamusXPosition : LSR #4 : CMP.W PLM_XBlock : BNE +
    LDA.W SamusYPosition : LSR #4 : SEC : SBC.W PLM_YBlock : CMP.W #$0005 : BCC .triggered

+   LDA.W PLM_Timers,X : BEQ .return

  .triggered:
    INC.W PLM_InstListPointers,X : INC.W PLM_InstListPointers,X
    LDA.W #$0001 : STA.L PLMExtra_InstructionTimers,X
    LDA.W #.return : STA.W PLM_PreInstructions,X

  .return:
    RTS


;;; $BBA4: Pre-instruction - wake PLM if triggered or Samus is within 4 block column above PLM ;;;
PreInst_PLM_WakePLMIfTriggeredOrSamusWithin4BlockColumnAbove:
;; Parameter:
;;     X: PLM index
    JSL Calculate_PLM_Block_Coordinates
    LDA.W SamusXPosition : LSR #4 : CMP.W PLM_XBlock : BNE +
    LDA.W SamusYPosition : LSR #4 : SEC : SBC.W PLM_YBlock : CMP.W #$FFFC : BCS .triggered

+   LDA.W PLM_Timers,X : BEQ .return

  .triggered:
    INC.W PLM_InstListPointers,X : INC.W PLM_InstListPointers,X
    LDA.W #$0001 : STA.L PLMExtra_InstructionTimers,X
    LDA.W #.return : STA.W PLM_PreInstructions,X

  .return:
    RTS


;;; $BBDD: Instruction - clear trigger ;;;
Instruction_PLM_ClearTrigger:
;; Parameters:
;;     X: PLM index
    STZ.W PLM_Timers,X
    RTS


;;; $BBE1: Instruction - spawn enemy projectile [[Y]] ;;;
Instruction_PLM_SpawnEnemyProjectileY:
;; Parameters:
;;     Y: Pointer to instruction arguments
;; Returns:
;;     Y: Pointer to next instruction
    PHX : PHY
    LDA.W $0000,Y : TAY
    JSL SpawnEnemyProjectileY_ParameterA_RoomGraphics
    PLY : PLX
    INY #2
    RTS


;;; $BBF0: Instruction - wake enemy projectile at PLM's position ;;;
Instruction_PLM_WakeEnemyProjectileAtPLMsPosition:
;; Parameters:
;;     X: PLM index
;;     Y: Pointer to instruction arguments
;; Returns:
;;     Y: Pointer to next instruction

; 2-byte unused enemy projectile ID argument
    PHX : PHY
    LDA.W PLM_BlockIndices,X
    LDX.W #$0022

  .loop:
    CMP.W EnemyProjectile_Var0,X : BEQ .found
    DEX #2 : BPL .loop
    db $00 ; BRK with no operand

  .found:
    LDA.W #$0001 : STA.W EnemyProjectile_InstructionTimers,X
    INC.W EnemyProjectile_InstListPointers,X : INC.W EnemyProjectile_InstListPointers,X
    PLY : PLX
    INY #2
    RTS


;;; $BC13: Instruction list - PLM $C826 (downwards open gate) ;;;
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


;;; $BC3A: Instruction list - PLM $C82A (downwards closed gate) ;;;
InstList_PLM_DownwardsClosedGate:
    dw $0001,DrawInst_DownwardsGateClosed
    dw Instruction_PLM_ClearTrigger
    dw Instruction_PLM_PreInstruction_inY
    dw PreInst_PLM_WakePLMIfTriggeredOrSamusWithin4BlockColumnBelow
    dw Instruction_PLM_Sleep
    dw Instruction_PLM_WakeEnemyProjectileAtPLMsPosition
    dw InstList_EnemyProjectile_ShotGate_InitialClosedDownwards_sleep
    dw Instruction_PLM_QueueSound_Y_Lib3_Max6 : db $0E
    dw $0010,DrawInst_DownwardsGateOpenClosed_3
    dw $0010,DrawInst_DownwardsGateOpenClosed_2
    dw $0010,DrawInst_DownwardsGateOpenClosed_1
    dw $0018,DrawInst_DownwardsGateOpenClosed_0
    dw Instruction_PLM_GotoY
    dw InstList_PLM_DownwardsOpenGate


;;; $BC61: Instruction list - PLM $C82E (upwards open gate) ;;;
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


;;; $BC88: Instruction list - PLM $C832 (upwards closed gate) ;;;
InstList_PLM_UpwardsClosedGate:
    dw $0008,DrawInst_UpwardsGateClosed
    dw Instruction_PLM_ClearTrigger
    dw Instruction_PLM_PreInstruction_inY
    dw PreInst_PLM_WakePLMIfTriggeredOrSamusWithin4BlockColumnAbove
    dw Instruction_PLM_Sleep
    dw Instruction_PLM_WakeEnemyProjectileAtPLMsPosition
    dw InstList_EnemyProjectile_ShotGate_InitialClosedUpwards_sleep
    dw Instruction_PLM_QueueSound_Y_Lib3_Max6 : db $0E
    dw $0010,DrawInst_UpwardsGateOpenClosed_3
    dw $0010,DrawInst_UpwardsGateOpenClosed_2
    dw $0010,DrawInst_UpwardsGateOpenClosed_1
    dw $0010,DrawInst_UpwardsGateOpenClosed_0
    dw Instruction_PLM_GotoY
    dw InstList_PLM_UpwardsOpenGate


;;; $BCAF: Instruction list - PLM $C836 (downwards gate shotblock) - blue left ;;;
InstList_PLM_DownwardsGateShotblock_BlueLeft:
    dw $0001,DrawInst_GateShotblockDownwardsBlueLeft
    dw Instruction_PLM_Delete


;;; $BCB5: Instruction list - PLM $C836 (downwards gate shotblock) - blue right ;;;
InstList_PLM_DownwardsGateShotblock_BlueRight:
    dw $0001,DrawInst_GateShotblockDownwardsBlueRight
    dw Instruction_PLM_Delete


InstList_PLM_DownwardsGateShotblock_RedLeft:
;;; $BCBB: Instruction list - PLM $C836 (downwards gate shotblock) - red left ;;;
    dw $0001,DrawInst_GateShotblockDownwardsRedLeft
    dw Instruction_PLM_Delete


InstList_PLM_DownwardsGateShotblock_RedRight:
;;; $BCC1: Instruction list - PLM $C836 (downwards gate shotblock) - red right ;;;
    dw $0001,DrawInst_GateShotblockDownwardsRedRight
    dw Instruction_PLM_Delete


InstList_PLM_DownwardsGateShotblock_GreenLeft:
;;; $BCC7: Instruction list - PLM $C836 (downwards gate shotblock) - green left ;;;
    dw $0001,DrawInst_GateShotblockDownwardsGreenLeft
    dw Instruction_PLM_Delete


InstList_PLM_DownwardsGateShotblock_GreenRight:
;;; $BCCD: Instruction list - PLM $C836 (downwards gate shotblock) - green right ;;;
    dw $0001,DrawInst_GateShotblockDownwardsGreenRight
    dw Instruction_PLM_Delete


InstList_PLM_DownwardsGateShotblock_YellowLeft:
;;; $BCD3: Instruction list - PLM $C836 (downwards gate shotblock) - yellow left ;;;
    dw $0001,DrawInst_GateShotblockDownwardsYellowLeft
    dw Instruction_PLM_Delete


InstList_PLM_DownwardsGateShotblock_YellowRight:
;;; $BCD9: Instruction list - PLM $C836 (downwards gate shotblock) - yellow right ;;;
    dw $0001,DrawInst_GateShotblockDownwardsYellowRight
    dw Instruction_PLM_Delete


InstList_PLM_UpwardsGateShotblock_BlueLeft:
;;; $BCDF: Instruction list - PLM $C83A (upwards gate shotblock) - blue left ;;;
    dw $0001,DrawInst_GateShotblockUpwardsBlueLeft
    dw Instruction_PLM_Delete


InstList_PLM_UpwardsGateShotblock_BlueRight:
;;; $BCE5: Instruction list - PLM $C83A (upwards gate shotblock) - blue right ;;;
    dw $0001,DrawInst_GateShotblockUpwardsBlueRight
    dw Instruction_PLM_Delete


InstList_PLM_UpwardsGateShotblock_RedLeft:
;;; $BCEB: Instruction list - PLM $C83A (upwards gate shotblock) - red left ;;;
    dw $0001,DrawInst_GateShotblockUpwardsRedLeft
    dw Instruction_PLM_Delete


InstList_PLM_UpwardsGateShotblock_RedRight:
;;; $BCF1: Instruction list - PLM $C83A (upwards gate shotblock) - red right ;;;
    dw $0001,DrawInst_GateShotblockUpwardsRedRight
    dw Instruction_PLM_Delete


InstList_PLM_UpwardsGateShotblock_GreenLeft:
;;; $BCF7: Instruction list - PLM $C83A (upwards gate shotblock) - green left ;;;
    dw $0001,DrawInst_GateShotblockUpwardsGreenLeft
    dw Instruction_PLM_Delete


InstList_PLM_UpwardsGateShotblock_GreenRight:
;;; $BCFD: Instruction list - PLM $C83A (upwards gate shotblock) - green right ;;;
    dw $0001,DrawInst_GateShotblockUpwardsGreenRight
    dw Instruction_PLM_Delete


InstList_PLM_UpwardsGateShotblock_YellowLeft:
;;; $BD03: Instruction list - PLM $C83A (upwards gate shotblock) - yellow left ;;;
    dw $0001,DrawInst_GateShotblockUpwardsYellowLeft
    dw Instruction_PLM_Delete


InstList_PLM_UpwardsGateShotblock_YellowRight:
;;; $BD09: Instruction list - PLM $C83A (upwards gate shotblock) - yellow right ;;;
    dw $0001,DrawInst_GateShotblockUpwardsYellowRight
    dw Instruction_PLM_Delete


;;; $BD0F: Pre-instruction - go to link instruction if shot ;;;
PreInstruction_PLM_GotoLinkInstructionIfShot:
;; Parameter:
;;     X: PLM index
    LDA.W PLM_Timers,X : BEQ .return
    STZ.W PLM_Timers,X
    LDA.L PLMExtra_LinkInstructions,X : STA.W PLM_InstListPointers,X
    LDA.W #$0001 : STA.L PLMExtra_InstructionTimers,X

  .return:
    RTS


;;; $BD26: Pre-instruction - go to link instruction if shot with a power bomb ;;;
PreInstruction_PLM_GotoLinkInstructionIfHitWithPowerBomb:
;; Parameter:
;;     X: PLM index
    LDA.W PLM_Timers,X : BEQ .clearPLMShotStatus
    AND.W #$0F00 : CMP.W #$0300 : BNE .playSFX
    STZ.W PLM_Timers,X
    LDA.L PLMExtra_LinkInstructions,X : STA.W PLM_InstListPointers,X
    LDA.W #$0001 : STA.L PLMExtra_InstructionTimers,X
    RTS

  .playSFX:
    LDA.W #$0057
    JSL QueueSound_Lib2_Max6

  .clearPLMShotStatus:
    STZ.W PLM_Timers,X
    RTS


;;; $BD50: Pre-instruction - go to link instruction if shot with a (super) missile ;;;
PreInstruction_PLM_GotoLinkInstructionIfShotWithAMissile:
;; Parameter:
;;     X: PLM index
    LDA.W PLM_Timers,X : BEQ .clearPLMShotStatus
    AND.W #$0F00 : CMP.W #$0200 : BEQ .super
    CMP.W #$0100 : BNE .dud

  .missile:
    STZ.W PLM_Timers,X
    LDA.L PLMExtra_LinkInstructions,X : STA.W PLM_InstListPointers,X
    LDA.W #$0001 : STA.L PLMExtra_InstructionTimers,X
    RTS

  .dud:
    LDA.W #$0057
    JSL QueueSound_Lib2_Max6

  .clearPLMShotStatus:
    STZ.W PLM_Timers,X
    RTS

  .super:
    LDA.W #$0077 : STA.L PLMExtra_Vars,X
    BRA .missile


;;; $BD88: Pre-instruction - go to link instruction if shot with a super missile ;;;
PreInstruction_PLM_GotoLinkInstIfShotWithASuperMissile:
;; Parameter:
;;     X: PLM index
    LDA.W PLM_Timers,X : BEQ .clearPLMShotStatus
    AND.W #$0F00 : CMP.W #$0200 : BNE .playSFX
    STZ.W PLM_Timers,X
    LDA.L PLMExtra_LinkInstructions,X : STA.W PLM_InstListPointers,X
    LDA.W #$0001 : STA.L PLMExtra_InstructionTimers,X
    RTS

  .playSFX:
    LDA.W #$0057
    JSL QueueSound_Lib2_Max6

  .clearPLMShotStatus:
    STZ.W PLM_Timers,X
    RTS


;;; $BDB2: Go to link instruction ;;;
Goto_Link_Instruction:
;; Parameter:
;;     X: PLM index
    STZ.W PLM_Timers,X
    LDA.L PLMExtra_LinkInstructions,X : STA.W PLM_InstListPointers,X
    LDA.W #$0001 : STA.L PLMExtra_InstructionTimers,X
    RTS


;;; $BDC4: Play dud sound ;;;
Play_Dud_Sound:
;; Parameter:
;;     X: PLM index
    LDA.W PLM_Timers,X : BEQ .clearPLMShotStatus
    LDA.W #$0057
    JSL QueueSound_Lib2_Max6

  .clearPLMShotStatus:
    STZ.W PLM_Timers,X
    RTS


;;; $BDD4: Pre-instruction - go to link instruction if area boss is dead else play dud sound ;;;
PreInstruction_PLM_GotoLinkInstructionIfAreaBossDead:
;; Parameter:
;;     X: PLM index
    LDA.W #$0001
    JSL CheckIfBossBitsForCurrentAreaMatchAnyBitsInA
    BCC .playSFX
    JMP Goto_Link_Instruction

  .playSFX:
    JMP Play_Dud_Sound


;;; $BDE3: Pre-instruction - go to link instruction if area mini-boss (inc. Mother Brain) is dead else play dud sound ;;;
PreInstruction_PLM_GotoLinkInstructionIfAreaMiniBossIsDead:
;; Parameter:
;;     X: PLM index
    LDA.W #$0002
    JSL CheckIfBossBitsForCurrentAreaMatchAnyBitsInA
    BCC .playSFX
    JMP Goto_Link_Instruction

  .playSFX:
    JMP Play_Dud_Sound


PreInstruction_PLM_GotoLinkInstructionIfAreaTorizoIsDead:
    LDA.W #$0004
    JSL CheckIfBossBitsForCurrentAreaMatchAnyBitsInA
    BCC .playSFX
    JMP Goto_Link_Instruction

  .playSFX:
    JMP Play_Dud_Sound


;;; $BDF2: Pre-instruction - go to link instruction if area torizo is dead else play dud sound ;;;
PreInst_PLM_GotoLinkInst_SetZebesAwakeEventIfEnemiesDead:
;; Parameter:
;;     X: PLM index
    PHY : PHX
    LDA.W NumberOfEnemiesKilled : CMP.W NumberOfEnemiesRequiredToKill : BCC .playSFX
    LDA.W #$0000
    JSL MarkEvent_inA
    PLX : PLY
    JMP Goto_Link_Instruction

  .playSFX:
    PLX : PLY
    JMP Play_Dud_Sound


;;; $BE1C: Pre-instruction - play dud sound ;;;
PreInstruction_PLM_PlayDudSound:
;; Parameter:
;;     X: PLM index
    JMP Play_Dud_Sound


;;; $BE1F: Pre-instruction - go to link instruction if Tourian entrance statue has finished processing else play dud sound ;;;
PreInst_PLM_GotoLinkInstIfTourianStatueFinishedProcessing:
;; Parameter:
;;     X: PLM index
    PHY : PHX
    LDA.W TourianStatueFinishedProcessing : BPL .playSFX
    PLX : PLY
    JMP Goto_Link_Instruction

  .playSFX:
    PLX : PLY
    JMP Play_Dud_Sound


;;; $BE30: Pre-instruction - go to link instruction if critters escaped else play dud sound ;;;
PreInstruction_PLM_GotoLinkInstructionIfCrittersEscaped:
;; Parameter:
;;     X: PLM index
    LDA.W #$000F
    JSL CheckIfEvent_inA_HasHappened
    BCC .playSFX
    JMP Goto_Link_Instruction

  .playSFX:
    JMP Play_Dud_Sound


;;; $BE3F: Instruction - set grey door pre-instruction ;;;
Instruction_PLM_SetGreyDoorPreInstruction:
;; Parameter:
;;     X: PLM index
    PHY
    LDY.W PLM_Vars,X
    LDA.W .pointers,Y : STA.W PLM_PreInstructions,X
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


;;; $BE59: Instruction list - closing - door $C842 (grey door facing left) ;;;
InstList_PLM_GreyDoorFacingLeft_0:
    dw $0002,DrawInst_DoorFacingLeft_A677
    dw $0002,DrawInst_GreyDoorFacingLeft_3
    dw Instruction_PLM_QueueSound_Y_Lib3_Max6 : db $08
    dw $0002,DrawInst_GreyDoorFacingLeft_2
    dw $0002,DrawInst_GreyDoorFacingLeft_1
    dw $0001,DrawInst_GreyDoorFacingLeft_0


;;; $BE70: Instruction list - door $C842 (grey door facing left) ;;;
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


;;; $BEC2: Instruction list - closing - door $C848 (grey door facing right) ;;;
InstList_PLM_GreyDoorFacingRight_0:
    dw $0002,DrawInst_DoorFacingRight_A683
    dw $0002,DrawInst_GreyDoorFacingRight_3
    dw Instruction_PLM_QueueSound_Y_Lib3_Max6 : db $08
    dw $0002,DrawInst_GreyDoorFacingRight_2
    dw $0002,DrawInst_GreyDoorFacingRight_1
    dw $0001,DrawInst_GreyDoorFacingRight_0


;;; $BED9: Instruction list - door $C848 (grey door facing right) ;;;
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


;;; $BF2B: Instruction list - closing - door $C84E (grey door facing up) ;;;
InstList_PLM_GreyDoorFacingUp_0:
    dw $0002,DrawInst_DoorFacingUp_A68F
    dw $0002,DrawInst_GreyDoorFacingUp_3
    dw Instruction_PLM_QueueSound_Y_Lib3_Max6 : db $08
    dw $0002,DrawInst_GreyDoorFacingUp_2
    dw $0002,DrawInst_GreyDoorFacingUp_1
    dw $0001,DrawInst_GreyDoorFacingUp_0


;;; $BF42: Instruction list - door $C84E (grey door facing up) ;;;
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


;;; $BF94: Instruction list - closing - door $C854 (grey door facing down) ;;;
InstList_PLM_GreyDoorFacingDown_0:
    dw $0002,DrawInst_DoorFacingDown_A69B
    dw $0002,DrawInst_GreyDoorFacingDown_3
    dw Instruction_PLM_QueueSound_Y_Lib3_Max6 : db $08
    dw $0002,DrawInst_GreyDoorFacingDown_2
    dw $0002,DrawInst_GreyDoorFacingDown_1
    dw $0001,DrawInst_GreyDoorFacingDown_0


;;; $BFAB: Instruction list - door $C854 (grey door facing down) ;;;
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


;;; $BFFD: Instruction list - closing - door $C85A (yellow door facing left) ;;;
InstList_PLM_YellowDoorFacingLeft_0:
    dw $0002,DrawInst_DoorFacingLeft_A677
    dw $0002,DrawInst_YellowDoorFacingLeft_3
    dw Instruction_PLM_QueueSound_Y_Lib3_Max6 : db $08
    dw $0002,DrawInst_YellowDoorFacingLeft_2
    dw $0002,DrawInst_YellowDoorFacingLeft_1
    dw $0001,DrawInst_YellowDoorFacingLeft_0


;;; $C014: Instruction list - door $C85A (yellow door facing left) ;;;
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


;;; $C060: Instruction list - closing - door $C860 (yellow door facing right) ;;;
InstList_PLM_YellowDoorFacingRight_0:
    dw $0002,DrawInst_DoorFacingRight_A683
    dw $0002,DrawInst_YellowDoorFacingRight_3
    dw Instruction_PLM_QueueSound_Y_Lib3_Max6 : db $08
    dw $0002,DrawInst_YellowDoorFacingRight_2
    dw $0002,DrawInst_YellowDoorFacingRight_1
    dw $0001,DrawInst_YellowDoorFacingRight_0


;;; $C077: Instruction list - door $C860 (yellow door facing right) ;;;
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


;;; $C0C3: Instruction list - closing - door $C866 (yellow door facing up) ;;;
InstList_PLM_YellowDoorFacingUp_0:
    dw $0002,DrawInst_DoorFacingUp_A68F
    dw $0002,DrawInst_YellowDoorFacingUp_3
    dw Instruction_PLM_QueueSound_Y_Lib3_Max6 : db $08
    dw $0002,DrawInst_YellowDoorFacingUp_2
    dw $0002,DrawInst_YellowDoorFacingUp_1
    dw $0001,DrawInst_YellowDoorFacingUp_0


;;; $C0DA: Instruction list - door $C866 (yellow door facing up) ;;;
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


;;; $C122: Instruction list - closing - door $C86C (yellow door facing down) ;;;
InstList_PLM_YellowDoorFacingDown_0:
    dw $0002,DrawInst_DoorFacingDown_A69B
    dw $0002,DrawInst_YellowDoorFacingDown_3
    dw Instruction_PLM_QueueSound_Y_Lib3_Max6 : db $08
    dw $0002,DrawInst_YellowDoorFacingDown_2
    dw $0002,DrawInst_YellowDoorFacingDown_1
    dw $0001,DrawInst_YellowDoorFacingDown_0


;;; $C139: Instruction list - door $C86C (yellow door facing down) ;;;
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


;;; $C185: Instruction list - closing - door $C872 (green door facing left) ;;;
InstList_PLM_GreenDoorFacingLeft_0:
    dw $0002,DrawInst_DoorFacingLeft_A677
    dw $0002,DrawInst_GreenDoorFacingLeft_3
    dw Instruction_PLM_QueueSound_Y_Lib3_Max6 : db $08
    dw $0002,DrawInst_GreenDoorFacingLeft_2
    dw $0002,DrawInst_GreenDoorFacingLeft_1
    dw $0001,DrawInst_GreenDoorFacingLeft_0


;;; $C19C: Instruction list - door $C872 (green door facing left) ;;;
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


;;; $C1E4: Instruction list - closing - door $C878 (green door facing right) ;;;
InstList_PLM_GreenDoorFacingRight_0:
    dw $0002,DrawInst_DoorFacingRight_A683
    dw $0002,DrawInst_GreenDoorFacingRight_3
    dw Instruction_PLM_QueueSound_Y_Lib3_Max6 : db $08
    dw $0002,DrawInst_GreenDoorFacingRight_2
    dw $0002,DrawInst_GreenDoorFacingRight_1
    dw $0001,DrawInst_GreenDoorFacingRight_0


;;; $C1FB: Instruction list - door $C878 (green door facing right) ;;;
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


;;; $C243: Instruction list - closing - door $C87E (green door facing up) ;;;
InstList_PLM_GreenDoorFacingUp_0:
    dw $0002,DrawInst_DoorFacingUp_A68F
    dw $0002,DrawInst_GreenDoorFacingUp_3
    dw Instruction_PLM_QueueSound_Y_Lib3_Max6 : db $08
    dw $0002,DrawInst_GreenDoorFacingUp_2
    dw $0002,DrawInst_GreenDoorFacingUp_1
    dw $0001,DrawInst_GreenDoorFacingUp_0


;;; $C25A: Instruction list - door $C87E (green door facing up) ;;;
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


;;; $C2A2: Instruction list - closing - door $C884 (green door facing down) ;;;
InstList_PLM_GreenDoorFacingDown_0:
    dw $0002,DrawInst_DoorFacingDown_A69B
    dw $0002,DrawInst_GreenDoorFacingDown_3
    dw Instruction_PLM_QueueSound_Y_Lib3_Max6 : db $08
    dw $0002,DrawInst_GreenDoorFacingDown_2
    dw $0002,DrawInst_GreenDoorFacingDown_1
    dw $0001,DrawInst_GreenDoorFacingDown_0


;;; $C2B9: Instruction list - door $C884 (green door facing down) ;;;
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


;;; $C301: Instruction list - closing - door $C88A (red door facing left) ;;;
InstList_PLM_RedDoorFacingLeft_0:
    dw $0002,DrawInst_DoorFacingLeft_A677
    dw $0002,DrawInst_RedDoorFacingLeft_3
    dw Instruction_PLM_QueueSound_Y_Lib3_Max6 : db $08
    dw $0002,DrawInst_RedDoorFacingLeft_2
    dw $0002,DrawInst_RedDoorFacingLeft_1
    dw $0001,DrawInst_RedDoorFacingLeft_0


;;; $C318: Instruction list - door $C88A (red door facing left) ;;;
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


;;; $C363: Instruction list - closing - door $C890 (red door facing right) ;;;
InstList_PLM_RedDoorFacingRight_0:
    dw $0002,DrawInst_DoorFacingRight_A683
    dw $0002,DrawInst_RedDoorFacingRight_3
    dw Instruction_PLM_QueueSound_Y_Lib3_Max6 : db $08
    dw $0002,DrawInst_RedDoorFacingRight_2
    dw $0002,DrawInst_RedDoorFacingRight_1
    dw $0001,DrawInst_RedDoorFacingRight_0


;;; $C37A: Instruction list - door $C890 (red door facing right) ;;;
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


;;; $C3C5: Instruction list - closing - door $C896 (red door facing up) ;;;
InstList_PLM_RedDoorFacingUp_0:
    dw $0002,DrawInst_DoorFacingUp_A68F
    dw $0002,DrawInst_RedDoorFacingUp_3
    dw Instruction_PLM_QueueSound_Y_Lib3_Max6 : db $08
    dw $0002,DrawInst_RedDoorFacingUp_2
    dw $0002,DrawInst_RedDoorFacingUp_1
    dw $0001,DrawInst_RedDoorFacingUp_0


;;; $C3DC: Instruction list - door $C896 (red door facing up) ;;;
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


;;; $C427: Instruction list - closing - door $C89C (red door facing down) ;;;
InstList_PLM_RedDoorFacingDown_0:
    dw $0002,DrawInst_DoorFacingDown_A69B
    dw $0002,DrawInst_RedDoorFacingDown_3
    dw Instruction_PLM_QueueSound_Y_Lib3_Max6 : db $08
    dw $0002,DrawInst_RedDoorFacingDown_2
    dw $0002,DrawInst_RedDoorFacingDown_1
    dw $0001,DrawInst_RedDoorFacingDown_0


;;; $C43E: Instruction list - door $C89C (red door facing down) ;;;
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


;;; $C489: Instruction list - door $C8A2 (shot/bombed/grappled reaction, shootable, BTS 40h. Blue door facing left) ;;;
InstList_PLM_BlueDoorFacingLeftOpened_40:
    dw Instruction_PLM_QueueSound_Y_Lib3_Max6 : db $07
    dw $0006,DrawInst_BlueDoorFacingLeft_0
    dw $0006,DrawInst_BlueDoorFacingLeft_1
    dw $0006,DrawInst_BlueDoorFacingLeft_2
    dw $005E,DrawInst_DoorFacingLeft_A677
    dw Instruction_PLM_Delete


;;; $C49E: Instruction list - closing - door $C8A2 (shot/bombed/grappled reaction, shootable, BTS 40h. Blue door facing left) ;;;
InstList_PLM_BlueDoorFacingLeftClosed:
    dw $0002,DrawInst_DoorFacingLeft_A677
    dw $0002,DrawInst_BlueDoorFacingLeft_2
    dw Instruction_PLM_QueueSound_Y_Lib3_Max6 : db $08
    dw $0002,DrawInst_BlueDoorFacingLeft_1
    dw $0002,DrawInst_BlueDoorFacingLeft_0


;;; $C4B1: Instruction list - closed blue door facing left ;;;
InstList_PLM_ClosedBlueDoorFacingLeft_40:
    dw Instruction_PLM_PLMBTS_Y : db $40
    dw $0001,DrawInst_DoorFacingLeft_A9B3
    dw Instruction_PLM_Delete


;;; $C4BA: Instruction list - door $C8A8 (shot/bombed/grappled reaction, shootable, BTS 41h. Blue door facing right) ;;;
InstList_PLM_BlueDoorFacingLeftOpened_41:
    dw Instruction_PLM_QueueSound_Y_Lib3_Max6 : db $07
    dw $0006,DrawInst_BlueDoorFacingRight_0
    dw $0006,DrawInst_BlueDoorFacingRight_1
    dw $0006,DrawInst_BlueDoorFacingRight_2
    dw $005E,DrawInst_DoorFacingRight_A683
    dw Instruction_PLM_Delete


;;; $C4CF: Instruction list - closing - door $C8A8 (shot/bombed/grappled reaction, shootable, BTS 41h. Blue door facing right) ;;;
InstList_PLM_BlueDoorFacingRightClosed:
    dw $0002,DrawInst_DoorFacingRight_A683
    dw $0002,DrawInst_BlueDoorFacingRight_2
    dw Instruction_PLM_QueueSound_Y_Lib3_Max6 : db $08
    dw $0002,DrawInst_BlueDoorFacingRight_1
    dw $0002,DrawInst_BlueDoorFacingRight_0


;;; $C4E2: Instruction list - closed blue door facing right ;;;
InstList_PLM_ClosedBlueDoorFacingLeft_41:
    dw Instruction_PLM_PLMBTS_Y : db $41
    dw $0001,DrawInst_DoorFacingRight_A9EF
    dw Instruction_PLM_Delete


;;; $C4EB: Instruction list - door $C8AE (shot/bombed/grappled reaction, shootable, BTS 42h. Blue door facing up) ;;;
InstList_PLM_BlueDoorFacingUpOpened_42:
    dw Instruction_PLM_QueueSound_Y_Lib3_Max6 : db $07
    dw $0006,DrawInst_BlueDoorFacingUp_0
    dw $0006,DrawInst_BlueDoorFacingUp_1
    dw $0006,DrawInst_BlueDoorFacingUp_2
    dw $005E,DrawInst_DoorFacingUp_A68F
    dw Instruction_PLM_Delete


;;; $C500: Instruction list - closing - door $C8AE (shot/bombed/grappled reaction, shootable, BTS 42h. Blue door facing up) ;;;
InstList_PLM_BlueDoorFacingUpClosed_42:
    dw $0002,DrawInst_DoorFacingUp_A68F
    dw $0002,DrawInst_BlueDoorFacingUp_2
    dw Instruction_PLM_QueueSound_Y_Lib3_Max6 : db $08
    dw $0002,DrawInst_BlueDoorFacingUp_1
    dw $0002,DrawInst_BlueDoorFacingUp_0


;;; $C513: Instruction list - closed blue door facing up ;;;
InstList_PLM_ClosedBlueDoorFacingUp_42:
    dw Instruction_PLM_PLMBTS_Y : db $42
    dw $0001,DrawInst_DoorFacingUp_AA2B
    dw Instruction_PLM_Delete


;;; $C51C: Instruction list - door $C8B4 (shot/bombed/grappled reaction, shootable, BTS 43h. Blue door facing down) ;;;
InstList_PLM_BlueDoorFacingUpOpened_43:
    dw Instruction_PLM_QueueSound_Y_Lib3_Max6 : db $07
    dw $0006,DrawInst_BlueDoorFacingDown_0
    dw $0006,DrawInst_BlueDoorFacingDown_1
    dw $0006,DrawInst_BlueDoorFacingDown_2
    dw $005E,DrawInst_DoorFacingDown_A69B
    dw Instruction_PLM_Delete


;;; $C531: Instruction list - closing - door $C8B4 (shot/bombed/grappled reaction, shootable, BTS 43h. Blue door facing down) ;;;
InstList_PLM_BlueDoorFacingUpClosed_43:
    dw $0002,DrawInst_DoorFacingDown_A69B
    dw $0002,DrawInst_BlueDoorFacingDown_2
    dw Instruction_PLM_QueueSound_Y_Lib3_Max6 : db $08
    dw $0002,DrawInst_BlueDoorFacingDown_1
    dw $0002,DrawInst_BlueDoorFacingDown_0


;;; $C544: Instruction list - closed blue door facing down ;;;
InstList_PLM_ClosedBlueDoorFacingUp_43:
    dw Instruction_PLM_PLMBTS_Y : db $43
    dw $0001,DrawInst_DoorFacingDown_AA67
    dw Instruction_PLM_Delete


;;; $C54D: Setup - PLM $C806 (shot/bombed/grappled reaction, shootable, BTS 4Ah. Left green gate trigger) ;;;
Setup_LeftGreenGateTrigger:
;; Parameters:
;;     Y: PLM index
    LDX.W ProjectileIndex
    LDA.W SamusProjectile_Types,X : AND.W #$0FFF : CMP.W #$0200 : BNE .playSFX
    JMP TriggerPLMOfBlockToTheRight

  .playSFX:
    LDA.W #$0057
    JSL QueueSound_Lib2_Max6
    LDA.W #$0000 : STA.W PLM_IDs,Y
    RTS


;;; $C56C: Setup - PLM $C80A (shot/bombed/grappled reaction, shootable, BTS 4Bh. Right green gate trigger) ;;;
Setup_RightGreenGateTrigger:
;; Parameters:
;;     Y: PLM index
    LDX.W ProjectileIndex
    LDA.W SamusProjectile_Types,X : AND.W #$0FFF : CMP.W #$0200 : BNE .playSFX
    JMP TriggerPLMOfBlockToTheLeft

  .playSFX:
    LDA.W #$0057
    JSL QueueSound_Lib2_Max6
    LDA.W #$0000 : STA.W PLM_IDs,Y
    RTS


;;; $C58B: Setup - PLM $C80E (shot/bombed/grappled reaction, shootable, BTS 48h. Left red gate trigger) ;;;
Setup_LeftRedGateTrigger:
;; Parameters:
;;     Y: PLM index
    LDX.W ProjectileIndex
    LDA.W SamusProjectile_Types,X : AND.W #$0FFF : CMP.W #$0100 : BEQ .triggerPLM
    CMP.W #$0200 : BNE .playSFX

  .triggerPLM:
    JMP TriggerPLMOfBlockToTheRight

  .playSFX:
    LDA.W #$0057
    JSL QueueSound_Lib2_Max6
    LDA.W #$0000 : STA.W PLM_IDs,Y
    RTS


;;; $C5AF: Setup - PLM $C812 (shot/bombed/grappled reaction, shootable, BTS 49h. Right red gate trigger) ;;;
Setup_RightRedGateTrigger:
;; Parameters:
;;     Y: PLM index
    LDX.W ProjectileIndex
    LDA.W SamusProjectile_Types,X : AND.W #$0FFF : CMP.W #$0100 : BEQ .triggerPLM
    CMP.W #$0200 : BNE .playSFX

  .triggerPLM:
    JMP TriggerPLMOfBlockToTheLeft

  .playSFX:
    LDA.W #$0057
    JSL QueueSound_Lib2_Max6
    LDA.W #$0000 : STA.W PLM_IDs,Y
    RTS


;;; $C5D3: Setup - PLM $C81E (shot/bombed/grappled reaction, shootable, BTS 4Ch. Left yellow gate trigger) ;;;
Setup_LeftYellowGateTrigger:
;; Parameters:
;;     Y: PLM index

; Missing RTS, causes dud shot sound effect to be queued twice >_<;
    LDX.W ProjectileIndex
    LDA.W SamusProjectile_Types,X : AND.W #$0FFF : CMP.W #$0300 : BNE .playSFX
    JMP TriggerPLMOfBlockToTheRight

  .playSFX:
    LDA.W #$0057
    JSL QueueSound_Lib2_Max6
    LDA.W #$0000 : STA.W PLM_IDs,Y
; fallthrough to RightYellowGateTrigger


;;; $C5F1: Setup - PLM $C822 (shot/bombed/grappled reaction, shootable, BTS 4Dh. Right yellow gate trigger) ;;;
RightYellowGateTrigger:
;; Parameters:
;;     Y: PLM index
    LDX.W ProjectileIndex
    LDA.W SamusProjectile_Types,X : AND.W #$0FFF : CMP.W #$0300 : BNE .playSFX
    JMP TriggerPLMOfBlockToTheLeft

  .playSFX:
    LDA.W #$0057
    JSL QueueSound_Lib2_Max6
    LDA.W #$0000 : STA.W PLM_IDs,Y
    RTS


;;; $C610: Setup - PLM $C816 (shot/bombed/grappled reaction, shootable, BTS 46h. Left blue gate trigger) ;;;
Setup_LeftBlueGateTrigger:
;; Parameters:
;;     Y: PLM index

; (Harmless) missing RTS >_<;
    LDX.W ProjectileIndex
    LDA.W SamusProjectile_Types,X : AND.W #$0FFF : CMP.W #$0300 : BEQ .deletePLM
    JMP TriggerPLMOfBlockToTheRight

  .deletePLM:
    LDA.W #$0000 : STA.W PLM_IDs,Y
; fallthrough to Setup_RightBlueGateTrigger


;;; $C627: Setup - PLM $C81A (shot/bombed/grappled reaction, shootable, BTS 47h. Right blue gate trigger) ;;;
Setup_RightBlueGateTrigger:
;; Parameters:
;;     Y: PLM index
    LDX.W ProjectileIndex
    LDA.W SamusProjectile_Types,X : AND.W #$0FFF : CMP.W #$0300 : BEQ .deletePLM
    JMP TriggerPLMOfBlockToTheLeft

  .deletePLM:
    LDA.W #$0000 : STA.W PLM_IDs,Y
    RTS


;;; $C63F: Trigger PLM of block to the right ;;;
TriggerPLMOfBlockToTheRight:
;; Parameters:
;;     Y: PLM index
    LDA.W PLM_BlockIndices,Y : INC #2
    JMP TriggerPLMAtBlockIndex_A


TriggerPLMOfBlockToTheLeft:
;; Parameters:
;;     Y: PLM index
    LDA.W PLM_BlockIndices,Y : DEC #2
; fallthrough to TriggerPLMAtBlockIndex_A


;;; $C647: Trigger PLM of block to the left ;;;
TriggerPLMAtBlockIndex_A:
;; Parameters:
;;     A: Block index
;;     Y: PLM index
    LDX.W #$004E

  .loop:
    CMP.W PLM_BlockIndices,X : BEQ .found
    DEX #2 : BPL .loop
    BRA .return

  .found:
    LDA.W PLM_Timers,X : BNE .return
    INC.W PLM_Timers,X

  .return:
    LDA.W #$0000 : STA.W PLM_IDs,Y
    SEC
    RTS


;;; $C66A: Give 5-block column below PLM BTS 10h ;;;
Give5BlockColumnBelowPLM_BTS10:
;; Parameters:
;;     Y: PLM index
    LDA.W PLM_BlockIndices,Y : LSR : TAX
    JSR PLM_BTS10_MovePLMDownARow
    JSR PLM_BTS10_MovePLMDownARow
    JSR PLM_BTS10_MovePLMDownARow
    JSR PLM_BTS10_MovePLMDownARow
    JSR PLM_BTS10_MovePLMDownARow
    RTS


;;; $C67F: PLM BTS = 10h, move PLM down a row ;;;
PLM_BTS10_MovePLMDownARow:
;; Parameters:
;;     X: Block index
;; Returns:
;;     X: Next block index
    LDA.L BTS,X : AND.W #$FF00 : ORA.W #$0010 : STA.L BTS,X
    TXA : CLC : ADC.W RoomWidthBlocks : TAX
    RTS


;;; $C694: Give 5-block column above PLM BTS 10h ;;;
Give5BlockColumnAbovePLM_BTS10:
;; Parameters:
;;     Y: PLM index
    LDA.W PLM_BlockIndices,Y : LSR : TAX
    JSR PLM_BTS10_MovePLMUpARow
    JSR PLM_BTS10_MovePLMUpARow
    JSR PLM_BTS10_MovePLMUpARow
    JSR PLM_BTS10_MovePLMUpARow
    JSR PLM_BTS10_MovePLMUpARow
    RTS


;;; $C6A9: PLM BTS = 10h, move PLM up a row ;;;
PLM_BTS10_MovePLMUpARow:
;; Parameters:
;;     X: Block index
;; Returns:
;;     X: Next block index
    LDA.L BTS,X : AND.W #$FF00 : ORA.W #$0010 : STA.L BTS,X
    TXA : SEC : SBC.W RoomWidthBlocks : TAX
    RTS


;;; $C6BE: Setup - PLM $C82A (downwards closed gate) ;;;
Setup_DownwardsClosedGate:
;; Parameters:
;;     Y: PLM index
    PHY
    LDY.W #EnemyProjectile_DownwardsShotGateInitiallyClosed
    JSL SpawnEnemyProjectileY_ParameterA_RoomGraphics
    PLY
    JSR Give5BlockColumnBelowPLM_BTS10
    RTS


;;; $C6CB: Setup - PLM $C832 (upwards closed gate) ;;;
Setup_UpwardsClosedGate:
;; Parameters:
;;     Y: PLM index
    PHY
    LDY.W #EnemyProjectile_UpwardsShotGateInitiallyClosed
    JSL SpawnEnemyProjectileY_ParameterA_RoomGraphics
    PLY
    JSR Give5BlockColumnAbovePLM_BTS10
    RTS


;;; $C6D8: Setup - PLM $C826 (downwards open gate) ;;;
Setup_DownwardsOpenGate:
;; Parameters:
;;     Y: PLM index
    JSR Give5BlockColumnBelowPLM_BTS10
    RTS


;;; $C6DC: Setup - PLM $C82E (upwards open gate) ;;;
Setup_UpwardsOpenGate:
;; Parameters:
;;     Y: PLM index
    JSR Give5BlockColumnAbovePLM_BTS10
    RTS


;;; $C6E0: Setup - PLM $C836 (downwards gate shotblock) ;;;
Setup_DownwardsGateShotblock:
;; Parameters:
;;     Y: PLM index
    LDX.W PLM_RoomArgs,Y
    LDA.W .instListPointers,X : STA.W PLM_InstListPointers,Y
    LDX.W PLM_RoomArgs,Y
    LDA.W .leftBlock,X : BEQ .noRoomArg
    LDX.W PLM_BlockIndices,Y : DEX #2
    JSR Write_Level_Data_Block_Type_and_BTS

  .noRoomArg:
    LDX.W PLM_RoomArgs,Y
    LDA.W .rightBlock,X : BEQ .return
    LDX.W PLM_BlockIndices,Y : INX #2
    JSR Write_Level_Data_Block_Type_and_BTS

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


;;; $C73A: Setup - PLM $C83A (upwards gate shotblock) ;;;
Setup_UpwardsGateShotblock:
;; Parameters:
;;     Y: PLM index
    LDX.W PLM_RoomArgs,Y
    LDA.W .instListPointers,X : STA.W PLM_InstListPointers,Y
    LDX.W PLM_RoomArgs,Y
    LDA.W .leftBlock,X : BEQ .noRoomArg
    LDX.W PLM_BlockIndices,Y : DEX #2
    JSR Write_Level_Data_Block_Type_and_BTS

  .noRoomArg:
    LDX.W PLM_RoomArgs,Y
    LDA.W .rightBlock,X : BEQ .return
    LDX.W PLM_BlockIndices,Y : INX #2
    JSR Write_Level_Data_Block_Type_and_BTS

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


;;; $C794: Setup - door $BAF4/$C842/$C848/$C84E/$C854 (grey door) ;;;
Setup_GreyDoor:
;; Parameters:
;;     Y: PLM index
    LDA.W PLM_RoomArgs+1,Y : AND.W #$007C : LSR : STA.W PLM_Vars,Y
    LDA.W PLM_RoomArgs,Y : AND.W #$83FF : STA.W PLM_RoomArgs,Y
    LDX.W PLM_BlockIndices,Y
    LDA.W #$C044 ; block type + BTS
    JSR Write_Level_Data_Block_Type_and_BTS
    RTS


;;; $C7B1: Setup - door $C85A/$C860/$C866/$C86C/$C872/$C878/$C87E/$C884/$C88A/$C890/$C896/$C89C (coloured door) ;;;
Setup_ColoredDoor:
;; Parameters:
;;     Y: PLM index
    LDX.W PLM_BlockIndices,Y
    LDA.W #$C044 ; block type + BTS
    JSR Write_Level_Data_Block_Type_and_BTS
    RTS


;;; $C7BB: Setup - door $C8A2/$C8A8/$C8AE/$C8B4 (shot/bombed/grappled reaction, shootable, BTS 40h..43h. Blue door) ;;;
Setup_BlueDoor:
;; Parameters:
;;     Y: PLM index
    LDX.W ProjectileIndex
    LDA.W SamusProjectile_Types,X : AND.W #$0F00 : CMP.W #$0300 : BNE .notPowerBomb
    LDA.W #$0000 : STA.W PLM_IDs,Y
    RTS

  .notPowerBomb:
    LDX.W PLM_BlockIndices,Y
    LDA.L LevelData,X : AND.W #$0FFF : ORA.W #$8000 : STA.L LevelData,X
    RTS


;;; $C7E2: Setup - PLM $C83E (shot/bombed/grappled reaction, shootable, BTS 44h / collision reaction, special, BTS 44h. Generic shot trigger for a PLM) ;;;
Setup_GenericShotTriggerForAPLM:
;; Parameters:
;;     Y: PLM index
;; Returns:
;;     Carry: Set if PLM found (unconditional collision), garbage otherwise
    TYX
    LDA.W PLM_BlockIndices,X
    STZ.W PLM_BlockIndices,X
    LDX.W #$004E

  .loop:
    CMP.W PLM_BlockIndices,X : BEQ .found
    DEX #2 : BPL .loop
    RTS

  .found:
    LDY.W ProjectileIndex
    LDA.W SamusProjectile_Types,Y : AND.W #$1FFF : ORA.W #$8000 : STA.W PLM_Timers,X
    RTS


;;; $C806: PLM entries ;;;
PLMEntries_leftGreenGateTrigger:
; Shot/bombed/grappled reaction, shootable, BTS 4Ah. Left green gate trigger
    dw Setup_LeftGreenGateTrigger
    dw InstList_PLM_Delete

PLMEntries_rightGreenGateTrigger:
; Shot/bombed/grappled reaction, shootable, BTS 4Bh. Right green gate trigger
    dw Setup_RightGreenGateTrigger
    dw InstList_PLM_Delete

PLMEntries_leftRedGateTrigger:
; Shot/bombed/grappled reaction, shootable, BTS 48h. Left red gate trigger
    dw Setup_LeftRedGateTrigger
    dw InstList_PLM_Delete

PLMEntries_rightRedGateTrigger:
; Shot/bombed/grappled reaction, shootable, BTS 49h. Right red gate trigger
    dw Setup_RightRedGateTrigger
    dw InstList_PLM_Delete

PLMEntries_leftBlueGateTrigger:
; Shot/bombed/grappled reaction, shootable, BTS 46h. Left blue gate trigger
    dw Setup_LeftBlueGateTrigger
    dw InstList_PLM_Delete

PLMEntries_rightBlueGateTrigger:
; Shot/bombed/grappled reaction, shootable, BTS 47h. Right blue gate trigger
    dw Setup_RightBlueGateTrigger
    dw InstList_PLM_Delete

PLMEntries_leftYellowGateTrigger:
; Shot/bombed/grappled reaction, shootable, BTS 4Ch. Left yellow gate trigger
    dw Setup_LeftYellowGateTrigger
    dw InstList_PLM_Delete

PLMEntries_rightYellowGateTrigger:
; Shot/bombed/grappled reaction, shootable, BTS 4Dh. Right yellow gate trigger
    dw RightYellowGateTrigger
    dw InstList_PLM_Delete

PLMEntries_downwardsOpenGate:
; Downwards open gate
    dw Setup_DownwardsOpenGate
    dw InstList_PLM_DownwardsOpenGate

PLMEntries_downwardsClosedGate:
; Downwards closed gate
    dw Setup_DownwardsClosedGate
    dw InstList_PLM_DownwardsClosedGate

PLMEntries_upwardsOpenGate:
; Upwards open gate
    dw Setup_UpwardsOpenGate
    dw InstList_PLM_UpwardsOpenGate

PLMEntries_upwardsClosedGate:
; Upwards closed gate
    dw Setup_UpwardsClosedGate
    dw InstList_PLM_UpwardsClosedGate

PLMEntries_downwardsGateShotblock:
; Downwards gate shotblock
    dw Setup_DownwardsGateShotblock
    dw InstList_PLM_DownwardsGateShotblock_BlueLeft

PLMEntries_upwardsGateShotblock:
; Upwards gate shotblock
    dw Setup_UpwardsGateShotblock
    dw InstList_PLM_UpwardsGateShotblock_BlueLeft

PLMEntries_genericShotTriggerForAPLM:
; Shot/bombed/grappled reaction, shootable, BTS 44h / collision reaction, special, BTS 44h. Generic shot trigger for a PLM
    dw Setup_GenericShotTriggerForAPLM
    dw InstList_PLM_Delete

PLMEntries_greyDoorFacingLeft:
; Door. Grey door facing left
    dw Setup_GreyDoor
    dw InstList_PLM_GreyDoorFacingLeft_1
    dw InstList_PLM_GreyDoorFacingLeft_0

PLMEntries_greyDoorFacingRight:
; Door. Grey door facing right
    dw Setup_GreyDoor
    dw InstList_PLM_GreyDoorFacingRight_1
    dw InstList_PLM_GreyDoorFacingRight_0

PLMEntries_greyDoorFacingUp:
; Door. Grey door facing up
    dw Setup_GreyDoor
    dw InstList_PLM_GreyDoorFacingUp_1
    dw InstList_PLM_GreyDoorFacingUp_0

PLMEntries_greyDoorFacingDown:
; Door. Grey door facing down
    dw Setup_GreyDoor
    dw InstList_PLM_GreyDoorFacingDown_1
    dw InstList_PLM_GreyDoorFacingDown_0

PLMEntries_yellowDoorFacingLeft:
; Door. Yellow door facing left
    dw Setup_ColoredDoor
    dw InstList_PLM_YellowDoorFacingLeft_1
    dw InstList_PLM_YellowDoorFacingLeft_0

PLMEntries_yellowDoorFacingRight:
; Door. Yellow door facing right
    dw Setup_ColoredDoor
    dw InstList_PLM_YellowDoorFacingRight_1
    dw InstList_PLM_YellowDoorFacingRight_0

PLMEntries_yellowDoorFacingUp:
; Door. Yellow door facing up
    dw Setup_ColoredDoor
    dw InstList_PLM_YellowDoorFacingUp_1
    dw InstList_PLM_YellowDoorFacingUp_0

PLMEntries_yellowDoorFacingDown:
; Door. Yellow door facing down
    dw Setup_ColoredDoor
    dw InstList_PLM_YellowDoorFacingDown_1
    dw InstList_PLM_YellowDoorFacingDown_0

PLMEntries_greenDoorFacingLeft:
; Door. Green door facing left
    dw Setup_ColoredDoor
    dw InstList_PLM_GreenDoorFacingLeft_1
    dw InstList_PLM_GreenDoorFacingLeft_0

PLMEntries_greenDoorFacingRight:
; Door. Green door facing right
    dw Setup_ColoredDoor
    dw InstList_PLM_GreenDoorFacingRight_1
    dw InstList_PLM_GreenDoorFacingRight_0

PLMEntries_greenDoorFacingUp:
; Door. Green door facing up
    dw Setup_ColoredDoor
    dw InstList_PLM_GreenDoorFacingUp_1
    dw InstList_PLM_GreenDoorFacingUp_0

PLMEntries_greenDoorFacingDown:
; Door. Green door facing down
    dw Setup_ColoredDoor
    dw InstList_PLM_GreenDoorFacingDown_1
    dw InstList_PLM_GreenDoorFacingDown_0

PLMEntries_redDoorFacingLeft:
; Door. Red door facing left
    dw Setup_ColoredDoor
    dw InstList_PLM_RedDoorFacingLeft_1
    dw InstList_PLM_RedDoorFacingLeft_0

PLMEntries_redDoorFacingRight:
; Door. Red door facing right
    dw Setup_ColoredDoor
    dw InstList_PLM_RedDoorFacingRight_1
    dw InstList_PLM_RedDoorFacingRight_0

PLMEntries_redDoorFacingUp:
; Door. Red door facing up
    dw Setup_ColoredDoor
    dw InstList_PLM_RedDoorFacingUp_1
    dw InstList_PLM_RedDoorFacingUp_0

PLMEntries_redDoorFacingDown:
; Door. Red door facing down
    dw Setup_ColoredDoor
    dw InstList_PLM_RedDoorFacingDown_1
    dw InstList_PLM_RedDoorFacingDown_0

PLMEntries_blueDoorFacingLeft:
; Door. Shot/bombed/grappled reaction, shootable, BTS 40h. Blue facing left
    dw Setup_BlueDoor
    dw InstList_PLM_BlueDoorFacingLeftOpened_40
    dw InstList_PLM_BlueDoorFacingLeftClosed

PLMEntries_blueDoorFacingRight:
; Door. Shot/bombed/grappled reaction, shootable, BTS 41h. Blue facing right
    dw Setup_BlueDoor
    dw InstList_PLM_BlueDoorFacingLeftOpened_41
    dw InstList_PLM_BlueDoorFacingRightClosed

PLMEntries_blueDoorFacingUp:
; Door. Shot/bombed/grappled reaction, shootable, BTS 42h. Blue facing up
    dw Setup_BlueDoor
    dw InstList_PLM_BlueDoorFacingUpOpened_42
    dw InstList_PLM_BlueDoorFacingUpClosed_42

PLMEntries_blueDoorFacingDown:
; Door. Shot/bombed/grappled reaction, shootable, BTS 43h. Blue facing down
    dw Setup_BlueDoor
    dw InstList_PLM_BlueDoorFacingUpOpened_43
    dw InstList_PLM_BlueDoorFacingUpClosed_43

PLMEntries_blueDoorClosingFacingLeft:
; Blue door closing facing left
    dw Setup_DeactivatePLM
    dw InstList_PLM_BlueDoorFacingLeftClosed

PLMEntries_blueDoorClosingFacingRight:
; Blue door closing facing right
    dw Setup_DeactivatePLM
    dw InstList_PLM_BlueDoorFacingRightClosed

PLMEntries_blueDoorClosingFacingUp:
; Blue door closing facing up
    dw Setup_DeactivatePLM
    dw InstList_PLM_BlueDoorFacingUpClosed_42

PLMEntries_blueDoorClosingFacingDown:
; Blue door closing facing down
    dw Setup_DeactivatePLM
    dw InstList_PLM_BlueDoorFacingUpClosed_43

PLMEntries_gateThatClosesInEscapeRoom1:
; Door. Gate that closes during escape in room after Mother Brain
    dw Setup_DeactivatePLM
    dw InstList_PLM_GateThatClosesDuringEscapeAfterMotherBrain_0
    dw InstList_PLM_GateThatClosesDuringEscapeAfterMotherBrain_1

PLMEntries_gateThatClosesInEscapeRoom1_PLM:
; PLM version of the above
    dw Setup_DeactivatePLM
    dw InstList_PLM_GateThatClosesDuringEscapeAfterMotherBrain_1


if !FEATURE_KEEP_UNREFERENCED
;;; $C8D4: Instruction list - PLM $CFEC (unused. Draws 1x1 shot block) ;;;
UNUSED_InstList_PLM_Draws1x1ShotBlock_84C8D4:
    dw $0001,UNUSED_DrawInst_1x1ShotBlock_84A475
    dw Instruction_PLM_Delete


;;; $C8DA: Instruction list - PLM $CFF0 (unused. Draws 1x2 shot block) ;;;
UNUSED_InstList_PLM_Draws1x2ShotBlock_84C8DA:
    dw $0001,DrawInst_2x1RespawningShotBlock
    dw Instruction_PLM_Delete


;;; $C8E0: Instruction list - PLM $CFF4 (unused. Draws 2x1 shot block) ;;;
UNUSED_InstList_PLM_Draws2x1ShotBlock_84C8E0:
    dw $0001,DrawInst_1x2RespawningShotBlock
    dw Instruction_PLM_Delete


;;; $C8E6: Instruction list - PLM $CFF8 (unused. Draws 2x2 shot block) ;;;
UNUSED_InstList_PLM_Draws2x2ShotBlock_84C8E6:
    dw $0001,DrawInst_2x2RespawningShotBlock
    dw Instruction_PLM_Delete
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $C8EC: Instruction list - PLM $CFFC (bomb reaction, special block, BTS 0/4. 1x1 (respawning) crumble block) ;;;
InstList_BombReaction_PLM_1x1RespawningCrumbleBlock:
    dw $0001,DrawInst_1x1RespawningCrumbleBlock
    dw Instruction_PLM_Delete


;;; $C8F2: Instruction list - PLM $D000 (bomb reaction, special block, BTS 1/5. 2x1 (respawning) crumble block) ;;;
InstList_BombReaction_PLM_2x1RespawningCrumbleBlock:
    dw $0001,DrawInst_2x1RespawningCrumbleBlock
    dw Instruction_PLM_Delete


;;; $C8F8: Instruction list - PLM $D004 (bomb reaction, special block, BTS 2/6. 1x2 (respawning) crumble block) ;;;
InstList_BombReaction_PLM_1x2RespawningCrumbleBlock:
    dw $0001,DrawInst_1x2RespawningCrumbleBlock
    dw Instruction_PLM_Delete


;;; $C8FE: Instruction list - PLM $D008 (bomb reaction, special block, BTS 3/7. 2x2 (respawning) crumble block) ;;;
InstList_BombReaction_PLM_2x2RespawningCrumbleBlock:
    dw $0001,DrawInst_2x2RespawningCrumbleBlock
    dw Instruction_PLM_Delete


if !FEATURE_KEEP_UNREFERENCED
;;; $C904: Instruction list - PLM $D00C (unused) ;;;
UNUSED_InstList_PLM_84C904:
; Draws 1x1 bomb block
    dw $0001,UNUSED_DrawInst_84A4C1
    dw Instruction_PLM_Delete


;;; $C90A: Instruction list - PLM $D010 (unused) ;;;
UNUSED_InstList_PLM_84C90A:
; Draws 1x2 bomb block
    dw $0001,DrawInst_2x1RespawningBombBlock
    dw Instruction_PLM_Delete


;;; $C910: Instruction list - PLM $D014 (unused) ;;;
UNUSED_InstList_PLM_84C910:
; Draws 2x1 bomb block
    dw $0001,DrawInst_1x2RespawningBombBlock
    dw Instruction_PLM_Delete


;;; $C916: Instruction list - PLM $D018 (unused) ;;;
UNUSED_InstList_PLM_84C916:
; Draws 2x2 bomb block
    dw $0001,DrawInst_2x2RespawningBombBlock
    dw Instruction_PLM_Delete
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $C91C: Instruction list - power bomb block bombed / PLM $D01C (unused) ;;;
UNUSED_InstList_PLM_PowerBombBlockBombed_84C91C:
    dw $0001,UNUSED_DrawInst_PowerBombBlockBombed_84A4E7
    dw Instruction_PLM_Delete


;;; $C922: Instruction list - super missile block bombed / PLM $D020 (unused) ;;;
UNUSED_InstList_PLM_SuperMissileBlockBombed_84C922:
    dw $0001,UNUSED_DrawInst_SuperMissileBlockBombed_84A4ED
    dw Instruction_PLM_Delete


;;; $C928: Instruction list - PLM $D024 (bomb reaction, special block, BTS Eh/Fh / Brinstar 82h/83h/84h/85h. Speed block) ;;;
InstList_PLM_BombReaction_SpeedBlock:
    dw $0001,DrawInst_BombReactionSpeedBlock
    dw Instruction_PLM_Delete


if !FEATURE_KEEP_UNREFERENCED
;;; $C92E: Instruction list - PLM $D028 (unused. Respawning screw attack block) ;;;
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


;;; $C951: Instruction list - PLM $D030 (collision reaction, special, BTS Brinstar 82h. Respawning speed block, slower crumble animation) ;;;
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


;;; $C974: Instruction list - PLM $D038 (collision reaction, special, BTS Eh. Respawning speed block) ;;;
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


;;; $C997: Instruction list - PLM $D03C (collision reaction, special, BTS Brinstar 84h. Respawning speed block) ;;;
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
;;; $C9BA: Instruction list - PLM $D02C (unused. Screw attack block) ;;;
UNUSED_InstList_PLM_84C9BA:
; Even slower version of InstList_PLM_SpeedBlockSlowerCrumbleAnimation
    dw Instruction_PLM_QueueSound_Y_Lib2_Max6 : db $06
    dw $0004,DrawInst_Respawn1x1_0
    dw $0004,DrawInst_Respawn1x1_1
    dw $0004,DrawInst_Respawn1x1_2
    dw $0001,DrawInst_Respawn1x1_3
    dw Instruction_PLM_Delete
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $C9CF: Instruction list - PLM $D034 (collision reaction, special, BTS Brinstar 83h. Speed block, slower crumble animation) ;;;
InstList_PLM_SpeedBlockSlowerCrumbleAnimation:
    dw Instruction_PLM_QueueSound_Y_Lib2_Max1 : db $06
    dw $0002,DrawInst_Respawn1x1_0
    dw $0002,DrawInst_Respawn1x1_1
    dw $0002,DrawInst_Respawn1x1_2
    dw $0001,DrawInst_Respawn1x1_3
    dw Instruction_PLM_Delete


;;; $C9E4: Instruction list - PLM $D040 (collision reaction, special, BTS Fh / Brinstar 85h. Speed block) ;;;
InstList_PLM_SpeedBoostBlock:
    dw Instruction_PLM_QueueSound_Y_Lib2_Max1 : db $06
    dw $0001,DrawInst_Respawn1x1_0
    dw $0001,DrawInst_Respawn1x1_1
    dw $0001,DrawInst_Respawn1x1_2
    dw $0001,DrawInst_Respawn1x1_3
    dw Instruction_PLM_Delete


;;; $C9F9: Instruction list - PLM $D044 (collision reaction, special, BTS 0. 1x1 respawning crumble block) ;;;
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


;;; $CA1C: Instruction list - PLM $D048 (collision reaction, special, BTS 1. 2x1 respawning crumble block) ;;;
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


;;; $CA41: Instruction list - PLM $D04C (collision reaction, special, BTS 2. 1x2 respawning crumble block) ;;;
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


;;; $CA66: Instruction list - PLM $D050 (collision reaction, special, BTS 3. 2x2 respawning crumble block) ;;;
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


;;; $CA8B: Instruction list - PLM $D054 (collision reaction, special, BTS 4. 1x1 crumble block) ;;;
InstList_PLM_1x1CrumbleBlock:
    dw Instruction_PLM_QueueSound_Y_Lib2_Max1 : db $0A
    dw $0004,DrawInst_Respawn1x1_0
    dw $0004,DrawInst_Respawn1x1_1
    dw $0004,DrawInst_Respawn1x1_2
    dw $0001,DrawInst_Respawn1x1_3
    dw Instruction_PLM_Delete


;;; $CAA0: Instruction list - PLM $D058 (collision reaction, special, BTS 5. 2x1 crumble block) ;;;
InstList_PLM_2x1CrumbleBlock:
    dw Instruction_PLM_QueueSound_Y_Lib2_Max1 : db $0A
    dw $0004,DrawInst_Respawn2x1_0
    dw $0004,DrawInst_Respawn2x1_1
    dw $0004,DrawInst_Respawn2x1_2
    dw $0001,DrawInst_Respawn2x1_3
    dw Instruction_PLM_Delete


;;; $CAB5: Instruction list - PLM $D05C (collision reaction, special, BTS 6. 1x2 crumble block) ;;;
InstList_PLM_1x2CrumbleBlock:
    dw Instruction_PLM_QueueSound_Y_Lib2_Max1 : db $0A
    dw $0004,DrawInst_Respawn1x2_0
    dw $0004,DrawInst_Respawn1x2_1
    dw $0004,DrawInst_Respawn1x2_2
    dw $0001,DrawInst_Respawn1x2_3
    dw Instruction_PLM_Delete


;;; $CACA: Instruction list - PLM $D060 (collision reaction, special, BTS 7. 2x2 crumble block) ;;;
InstList_PLM_2x2CrumbleBlock:
    dw Instruction_PLM_QueueSound_Y_Lib2_Max1 : db $0A
    dw $0004,DrawInst_Respawn2x2_0
    dw $0004,DrawInst_Respawn2x2_1
    dw $0004,DrawInst_Respawn2x2_2
    dw $0001,DrawInst_Respawn2x2_3
    dw Instruction_PLM_Delete


;;; $CADF: Instruction list - PLM $D064 (shot/bombed/grappled reaction, shootable, BTS 0. 1x1 respawning shot block) ;;;
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


;;; $CB02: Instruction list - PLM $D068 (shot/bombed/grappled reaction, shootable, BTS 1. 2x1 respawning shot block) ;;;
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


;;; $CB27: Instruction list - PLM $D06C (shot/bombed/grappled reaction, shootable, BTS 2. 1x2 respawning shot block) ;;;
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


;;; $CB4C: Instruction list - PLM $D070 (shot/bombed/grappled reaction, shootable, BTS 3. 2x2 respawning shot block) ;;;
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


;;; $CB71: Instruction list - PLM $D08C (shot/bombed/grappled reaction, shootable, BTS Ah. Respawning super missile block) ;;;
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


;;; $CB94: Instruction list - PLM $D084 (shot/bombed/grappled reaction, shootable, BTS 8. Respawning power bomb block) ;;;
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


;;; $CBB7: Instruction list - PLM $D074 (shot/bombed/grappled reaction, shootable, BTS 4. 1x1 shot block) ;;;
InstList_PLM_1x1ShotBlock:
    dw Instruction_PLM_QueueSound_Y_Lib2_Max1 : db $0A
    dw $0004,DrawInst_Respawn1x1_0
    dw $0004,DrawInst_Respawn1x1_1
    dw $0004,DrawInst_Respawn1x1_2
    dw $0001,DrawInst_Respawn1x1_3
    dw Instruction_PLM_Delete


;;; $CBCC: Instruction list - PLM $D078 (shot/bombed/grappled reaction, shootable, BTS 5. 2x1 shot block) ;;;
InstList_PLM_2x1ShotBlock:
    dw Instruction_PLM_QueueSound_Y_Lib2_Max1 : db $0A
    dw $0004,DrawInst_Respawn2x1_0
    dw $0004,DrawInst_Respawn2x1_1
    dw $0004,DrawInst_Respawn2x1_2
    dw $0001,DrawInst_Respawn2x1_3
    dw Instruction_PLM_Delete


;;; $CBE1: Instruction list - PLM $D07C (shot/bombed/grappled reaction, shootable, BTS 6. 1x2 shot block) ;;;
InstList_PLM_1x2ShotBlock:
    dw Instruction_PLM_QueueSound_Y_Lib2_Max1 : db $0A
    dw $0004,DrawInst_Respawn1x2_0
    dw $0004,DrawInst_Respawn1x2_1
    dw $0004,DrawInst_Respawn1x2_2
    dw $0001,DrawInst_Respawn1x2_3
    dw Instruction_PLM_Delete


;;; $CBF6: Instruction list - PLM $D080 (shot/bombed/grappled reaction, shootable, BTS 7. 2x2 shot block) ;;;
InstList_PLM_2x2ShotBlock:
    dw Instruction_PLM_QueueSound_Y_Lib2_Max1 : db $0A
    dw $0004,DrawInst_Respawn2x2_0
    dw $0004,DrawInst_Respawn2x2_1
    dw $0004,DrawInst_Respawn2x2_2
    dw $0001,DrawInst_Respawn2x2_3
    dw Instruction_PLM_Delete


;;; $CC0B: Instruction list - PLM $D090 (shot/bombed/grappled reaction, shootable, BTS Bh. Super missile block) ;;;
InstList_PLM_SuperMissileBlock:
    dw Instruction_PLM_QueueSound_Y_Lib2_Max6 : db $0A
    dw $0004,DrawInst_Respawn1x1_0
    dw $0004,DrawInst_Respawn1x1_1
    dw $0004,DrawInst_Respawn1x1_2
    dw $0001,DrawInst_Respawn1x1_3
    dw Instruction_PLM_Delete


;;; $CC20: Instruction list - PLM $D088 (shot/bombed/grappled reaction, shootable, BTS 9. Power bomb block) ;;;
InstList_PLM_PowerBombBlock:
    dw Instruction_PLM_QueueSound_Y_Lib2_Max1 : db $0A
    dw $0003,DrawInst_Respawn1x1_0
    dw $0002,DrawInst_Respawn1x1_1
    dw $0001,DrawInst_Respawn1x1_2
    dw $0001,DrawInst_Respawn1x1_3
    dw Instruction_PLM_Delete


;;; $CC35: Instruction list - PLM $D098 (collision reaction, bombable, BTS 0. 1x1 respawning bomb block) ;;;
InstList_PLM_CollisionReaction_1x1RespawningBombBlock:
    dw Instruction_PLM_QueueSound_Y_Lib2_Max3 : db $06
    dw Instruction_PLM_GotoY
    dw InstList_PLM_1x1RespawningBombBlock


;;; $CC3C: Instruction list - PLM $D0B8 (shot/bombed/grappled reaction, bombable, BTS 0. 1x1 respawning bomb block) ;;;
InstList_PLM_Reaction_1x1RespawningBombBlock_0:
    dw Instruction_PLM_QueueSound_Y_Lib2_Max3 : db $0A


;;; $CC3F: Instruction list - 1x1 respawning bomb block ;;;
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


;;; $CC5F: Instruction list - PLM $D09C (collision reaction, bombable, BTS 1. 2x1 respawning bomb block) ;;;
InstList_PLM_Collision_2x1RespawningBombBlock:
    dw Instruction_PLM_QueueSound_Y_Lib2_Max3 : db $06
    dw Instruction_PLM_GotoY
    dw InstList_PLM_2x1RespawningBombBlock


;;; $CC66: Instruction list - PLM $D0BC (shot/bombed/grappled reaction, bombable, BTS 1. 2x1 respawning bomb block) ;;;
InstList_PLM_Reaction_2x1RespawningBombBlock:
    dw Instruction_PLM_QueueSound_Y_Lib2_Max3 : db $0A


;;; $CC69: Instruction list - 2x1 respawning bomb block ;;;
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


;;; $CC8B: Instruction list - PLM $D0A0 (collision reaction, bombable, BTS 2. 1x2 respawning bomb block) ;;;
InstList_PLM_Collision_1x2RespawningBombBlock:
    dw Instruction_PLM_QueueSound_Y_Lib2_Max3 : db $06
    dw Instruction_PLM_GotoY
    dw InstList_PLM_1x2RespawningBombBlock


;;; $CC92: Instruction list - PLM $D0C0 (shot/bombed/grappled reaction, bombable, BTS 2. 1x2 respawning bomb block) ;;;
InstList_PLM_Reaction_1x2RespawningBombBlock:
    dw Instruction_PLM_QueueSound_Y_Lib2_Max3 : db $0A


;;; $CC95: Instruction list - 1x2 respawning bomb block ;;;
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


;;; $CCB7: Instruction list - PLM $D0A4 (collision reaction, bombable, BTS 3. 2x2 respawning bomb block) ;;;
InstList_PLM_Collision_2x2RespawningBombBlock:
    dw Instruction_PLM_QueueSound_Y_Lib2_Max3 : db $06
    dw Instruction_PLM_GotoY
    dw InstList_PLM_2x2RespawningBombBlock


;;; $CCBE: Instruction list - PLM $D0C4 (shot/bombed/grappled reaction, bombable, BTS 3. 2x2 respawning bomb block) ;;;
InstList_PLM_Reaction_2x2RespawningBombBlock:
    dw Instruction_PLM_QueueSound_Y_Lib2_Max3 : db $0A


;;; $CCC1: Instruction list - 2x2 respawning bomb block ;;;
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


;;; $CCE3: Instruction list - PLM $D0A8 (collision reaction, bombable, BTS 4. 1x1 bomb block) ;;;
InstList_PLM_Collision_1x1RespawningBombBlock:
    dw Instruction_PLM_QueueSound_Y_Lib2_Max3 : db $06
    dw Instruction_PLM_GotoY
    dw InstList_PLM_1x1BombBlock


;;; $CCEA: Instruction list - PLM $D0C8 (shot/bombed/grappled reaction, bombable, BTS 4. 1x1 bomb block) ;;;
InstList_PLM_Reaction_1x1RespawningBombBlock_4:
    dw Instruction_PLM_QueueSound_Y_Lib2_Max3 : db $0A


;;; $CCED: Instruction list - 1x1 bomb block ;;;
InstList_PLM_1x1BombBlock:
    dw $0004,DrawInst_Respawn1x1_0
    dw $0004,DrawInst_Respawn1x1_1
    dw $0004,DrawInst_Respawn1x1_2
    dw $0001,DrawInst_Respawn1x1_3
    dw Instruction_PLM_Delete


;;; $CCFF: Instruction list - PLM $D0AC (collision reaction, bombable, BTS 5. 2x1 bomb block) ;;;
InstList_PLM_Collision_2x1BombBlock:
    dw Instruction_PLM_QueueSound_Y_Lib2_Max3 : db $06
    dw Instruction_PLM_GotoY
    dw InstList_PLM_2x1BombBlock


;;; $CD06: Instruction list - PLM $D0CC (shot/bombed/grappled reaction, bombable, BTS 5. 2x1 bomb block) ;;;
InstList_PLM_Reaction_2x1BombBlock:
    dw Instruction_PLM_QueueSound_Y_Lib2_Max3 : db $0A


;;; $CD09: Instruction list - 2x1 bomb block ;;;
InstList_PLM_2x1BombBlock:
    dw $0004,DrawInst_Respawn2x1_0
    dw $0004,DrawInst_Respawn2x1_1
    dw $0004,DrawInst_Respawn2x1_2
    dw $0001,DrawInst_Respawn2x1_3
    dw Instruction_PLM_Delete


;;; $CD1B: Instruction list - PLM $D0B0 (collision reaction, bombable, BTS 6. 1x2 bomb block) ;;;
InstList_PLM_Collision_1x2BombBlock:
    dw Instruction_PLM_QueueSound_Y_Lib2_Max3 : db $06
    dw Instruction_PLM_GotoY
    dw InstList_PLM_1x2BombBlock


;;; $CD22: Instruction list - PLM $D0D0 (shot/bombed/grappled reaction, bombable, BTS 6. 1x2 bomb block) ;;;
InstList_PLM_Reaction_1x2BombBlock:
    dw Instruction_PLM_QueueSound_Y_Lib2_Max3 : db $0A


;;; $CD25: Instruction list - 1x2 bomb block ;;;
InstList_PLM_1x2BombBlock:
    dw $0004,DrawInst_Respawn1x2_0
    dw $0004,DrawInst_Respawn1x2_1
    dw $0004,DrawInst_Respawn1x2_2
    dw $0001,DrawInst_Respawn1x2_3
    dw Instruction_PLM_Delete


;;; $CD37: Instruction list - PLM $D0B4 (collision reaction, bombable, BTS 7. 2x2 bomb block) ;;;
InstList_PLM_Collision_2x2BombBlock:
    dw Instruction_PLM_QueueSound_Y_Lib2_Max3 : db $06
    dw Instruction_PLM_GotoY
    dw InstList_PLM_2x2BombBlock


;;; $CD3E: Instruction list - PLM $D0D4 (shot/bombed/grappled reaction, bombable, BTS 7. 2x2 bomb block) ;;;
InstList_PLM_Reaction_2x2BombBlock:
    dw Instruction_PLM_QueueSound_Y_Lib2_Max3 : db $0A


;;; $CD41: Instruction list - 2x2 bomb block ;;;
InstList_PLM_2x2BombBlock:
    dw $0004,DrawInst_Respawn2x2_0
    dw $0004,DrawInst_Respawn2x2_1
    dw $0004,DrawInst_Respawn2x2_2
    dw $0001,DrawInst_Respawn2x2_3
    dw Instruction_PLM_Delete


;;; $CD53: Instruction list - PLM $D094 (enemy collision reaction, spike block, BTS Fh. Enemy breakable block) ;;;
InstList_PLM_EnemyBreakableBlock:
    dw Instruction_PLM_QueueSound_Y_Lib2_Max3 : db $0A
    dw $0004,DrawInst_Respawn1x1_0
    dw $0004,DrawInst_Respawn1x1_1
    dw $0004,DrawInst_Respawn1x1_2
    dw $0001,DrawInst_Respawn1x1_3
    dw Instruction_PLM_Delete


;;; $CD68: Instruction list - PLM $D0D8/$D0E4/$D0E8 (grappled reaction, spike block / grapple block, BTS 0/3. Grapple block) ;;;
InstList_PLM_GrappleBlock:
    dw Instruction_PLM_Delete


;;; $CD6A: Instruction list - PLM $D0DC (grappled reaction, grapple block, BTS 1. Respawning breakable grapple block) ;;;
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


;;; $CD93: PLM BTS = 1 ;;;
Instruction_SetPLMBTSTo1:
;; Parameters:
;;     X: PLM index
    PHX
    LDA.W PLM_BlockIndices,X : LSR : TAX
    LDA.L BTS,X : AND.W #$FF00 : ORA.W #$0001 : STA.L BTS,X
    PLX
    RTS


;;; $CDA9: Instruction list - PLM $D0E0 (grappled reaction, grapple block, BTS 2. Breakable grapple block) ;;;
InstList_PLM_BreakableGrappleBlock:
    dw $0078,DrawInst_BreakableGrappleBlock_0
    dw Instruction_PLM_QueueSound_Y_Lib2_Max6 : db $0A
    dw $0004,DrawInst_BreakableGrappleBlock_1
    dw $0004,DrawInst_BreakableGrappleBlock_2
    dw $0004,DrawInst_BreakableGrappleBlock_3
    dw $0001,DrawInst_BreakableGrappleBlock_4
    dw Instruction_PLM_Delete


if !FEATURE_KEEP_UNREFERENCED
;;; $CDC2: Setup - PLM $D028/$D02C (unused. (Respawning) screw attack block) ;;;
UNUSED_Setup_84CDC2:
;; Parameters:
;;     Y: PLM index
    LDA.W Pose : CMP.W #$0081 : BEQ .screwAttacking
    CMP.W #$0082 : BNE .deletePLM

  .screwAttacking:
    LDX.W PLM_BlockIndices,Y
    LDA.L LevelData,X : STA.W PLM_Vars,Y
    AND.W #$0FFF : STA.L LevelData,X
    CLC
    RTS

  .deletePLM:
    LDA.W #$0000 : STA.W PLM_IDs,Y
    SEC
    RTS
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $CDEA: Setup - PLM $D030/$D034/$D038/$D03C/$D040 (collision reaction, special, BTS Eh/Fh / Brinstar 82h..85h. Respawning speed block) ;;;
Setup_Collision_RespawningSpeedBoostBlock:
;; Parameters:
;;     Y: PLM index
;; Returns:
;;     Carry: Set if collision, clear otherwise
    LDA.W SamusBoostTimer : AND.W #$0F00 : CMP.W #$0400 : BEQ .speed
    LDA.W Pose : CMP.W #$00C9 : BEQ .speed
    CMP.W #$00CA : BEQ .speed
    CMP.W #$00CB : BEQ .speed
    CMP.W #$00CC : BEQ .speed
    CMP.W #$00CD : BEQ .speed
    CMP.W #$00CE : BEQ .speed
    LDA.W #$0000 : STA.W PLM_IDs,Y
    SEC
    RTS

  .speed:
    LDX.W PLM_BlockIndices,Y
    LDA.L LevelData,X : AND.W #$F000 : ORA.W #$00B6 : STA.W PLM_Vars,Y
    AND.W #$0FFF : STA.L LevelData,X
    CLC
    RTS


;;; $CE37: Setup - PLM $D044/$D048/$D04C/$D050/$D054/$D058/$D05C/$D060 (collision reaction, special, BTS 0..7. (Respawning) crumble block) ;;;
Setup_Collision_RespawningCrumbleBlock:
;; Parameters:
;;     Y: PLM index
;; Returns:
;;     Carry: Set. Unconditional collision
    LDA.W CollisionMovementDirection : AND.W #$000F : CMP.W #$0003 : BNE .deletePLM
    LDX.W PLM_BlockIndices,Y
    LDA.L LevelData,X : AND.W #$F000 : ORA.W #$00BC : STA.W PLM_Vars,Y
    AND.W #$8FFF : STA.L LevelData,X
    TYX
    LDA.W #$0004 : STA.L PLMExtra_InstructionTimers,X
    SEC
    RTS

  .deletePLM:
    LDA.W #$0000 : STA.W PLM_IDs,Y
    SEC
    RTS


;;; $CE6B: Setup - PLM $D064/$D068/$D06C/$D070 (shot/bombed/grappled reaction, shootable, BTS 0..3. Respawning shot block) ;;;
Setup_Reaction_RespawningShotBlock:
;; Parameters:
;;     Y: PLM index

; Note that the PLM respawn block is only used by the 1x1 case
    LDX.W PLM_BlockIndices,Y
    LDA.L LevelData,X : AND.W #$F000 : ORA.W #$0052 : STA.W PLM_Vars,Y
    AND.W #$8FFF : STA.L LevelData,X
    RTS


;;; $CE83: Setup - PLM $D098/$D09C/$D0A0/$D0A4/$D0A8/$D0AC/$D0B0/$D0B4 (collision reaction, bombable, BTS 0..7. (Respawning) bomb block) ;;;
Setup_Collision_RespawningBombBlock:
;; Parameters:
;;     Y: PLM index
    LDA.W SamusBoostTimer : AND.W #$0F00 : CMP.W #$0400 : BEQ .screwOrSpeed
    LDA.W Pose : CMP.W #$0081 : BEQ .screwOrSpeed
    CMP.W #$0082 : BEQ .screwOrSpeed
    CMP.W #$00C9 : BEQ .screwOrSpeed
    CMP.W #$00CA : BEQ .screwOrSpeed
    CMP.W #$00CB : BEQ .screwOrSpeed
    CMP.W #$00CC : BEQ .screwOrSpeed
    CMP.W #$00CD : BEQ .screwOrSpeed
    CMP.W #$00CE : BEQ .screwOrSpeed
    LDA.W #$0000 : STA.W PLM_IDs,Y
    SEC
    RTS

  .screwOrSpeed:
    LDX.W PLM_BlockIndices,Y
    LDA.L LevelData,X : AND.W #$F000 : ORA.W #$0058 : STA.W PLM_Vars,Y
    AND.W #$0FFF : STA.L LevelData,X
    CLC
    RTS


;;; $CEDA: Setup - PLM $D0B8/$D0BC/$D0C0/$D0C4/$D0C8/$D0CC/$D0D0/$D0D4 (shot/bombed/grappled reaction, bombable, BTS 0..7. (Respawning) bomb block) ;;;
Setup_Reaction_RespawningBombBlock:
;; Parameters:
;;     Y: PLM index
    LDX.W ProjectileIndex
    LDA.W SamusProjectile_Types,X : AND.W #$0F00 : CMP.W #$0500 : BEQ .bomb
    CMP.W #$0300 : BEQ .powerBomb
    LDA.W #$0000 : STA.W PLM_IDs,Y
    RTS

  .powerBomb:
    LDX.W PLM_BlockIndices,Y
    LDA.L LevelData,X : AND.W #$F000 : ORA.W #$0058 : STA.W PLM_Vars,Y
    AND.W #$8FFF : STA.L LevelData,X
    RTS

  .bomb:
    LDA.W PLM_InstListPointers,Y : CLC : ADC.W #$0003 : STA.W PLM_InstListPointers,Y
    LDX.W PLM_BlockIndices,Y
    LDA.L LevelData,X : AND.W #$F000 : ORA.W #$0058 : STA.W PLM_Vars,Y
    AND.W #$8FFF : STA.L LevelData,X
    RTS


;;; $CF2E: Setup - PLM $D084/$D088 (shot/bombed/grappled reaction, shootable, BTS 8/9. (Respawning) power bomb block) ;;;
Setup_Reaction_RespawningPowerBombBlock:
;; Parameters:
;;     Y: PLM index
    LDX.W ProjectileIndex
    LDA.W SamusProjectile_Types,X : AND.W #$0F00 : CMP.W #$0500 : BEQ .bomb
    CMP.W #$0300 : BEQ .powerBomb
    LDA.W #$0000 : STA.W PLM_IDs,Y
    RTS

  .powerBomb:
    LDX.W PLM_BlockIndices,Y
    LDA.L LevelData,X : AND.W #$F000 : ORA.W #$0057 : STA.W PLM_Vars,Y
    AND.W #$8FFF : STA.L LevelData,X
    RTS

  .bomb:
    LDA.W #UNUSED_InstList_PLM_PowerBombBlockBombed_84C91C : STA.W PLM_InstListPointers,Y
    RTS


;;; $CF67: Setup - PLM $D08C/$D090 (shot/bombed/grappled reaction, shootable, BTS Ah/Bh. (Respawning) super missile block) ;;;
Setup_Reaction_SuperMissileBlock:
;; Parameters:
;;     Y: PLM index
    LDX.W ProjectileIndex
    LDA.W SamusProjectile_Types,X : AND.W #$0F00 : CMP.W #$0500 : BEQ .bomb
    CMP.W #$0200 : BEQ .superMissile
    LDA.W #$0000 : STA.W PLM_IDs,Y
    RTS

  .superMissile:
    LDX.W PLM_BlockIndices,Y
    LDA.L LevelData,X : AND.W #$F000 : ORA.W #$009F : STA.W PLM_Vars,Y
    AND.W #$8FFF : STA.L LevelData,X
    RTS

  .bomb:
    LDA.W #UNUSED_InstList_PLM_SuperMissileBlockBombed_84C922 : STA.W PLM_InstListPointers,Y
    RTS


;;; $CFA0: Setup - PLM $CFEC/$CFF0/$CFF4/$CFF8/$CFFC/$D000/$D004/$D008/$D00C/$D010/$D014/$D018/$D01C/$D020/$D024 (bomb reaction, special block, BTS 0..7 / Eh/Fh / Brinstar 82h..85h. (Respawning) crumble block / speed block / unused) ;;;
Setup_Reaction_SpeedCrumbleBlock:
;; Parameters:
;;     Y: PLM index
    LDX.W ProjectileIndex
    LDA.W SamusProjectile_Types,X : AND.W #$0F00 : CMP.W #$0500 : BEQ .return
    LDA.W #$0000 : STA.W PLM_IDs,Y

  .return:
    RTS


;;; $CFB5: Setup - PLM $D0DC/$D0E0 (grappled reaction, grapple block, BTS 1/2. (Respawning) breakable grapple block) ;;;
Setup_RespawningBreakableGrappleBlock:
;; Parameters:
;;     Y: PLM index
;; Returns:
;;     Carry: Set. Unconditional collision
;;     Overflow: Set. Connect grapple beam
    LDX.W PLM_BlockIndices,Y
    LDA.L LevelData,X : STA.W PLM_Vars,Y
    TXA : LSR : TAX
    LDA.L BTS,X : AND.W #$FF00 : STA.L BTS,X
; fallthrough to Setup_GenericGrappleBlock_SetOverflow


;;; $CFCD: Setup - PLM $D0D8 (grappled reaction, grapple block, BTS 0/3. Generic grapple block) ;;;
Setup_GenericGrappleBlock_SetOverflow:
;; Returns:
;;     Carry: Set. Unconditional collision
;;     Overflow: Set. Connect grapple beam
    SEP #$40 ; >.< SEP #$41
    SEC
    RTS


;;; $CFD1: Setup - PLM $D0E4 (grappled reaction, generic spike block) ;;;
Setup_GenericGrappleBlock_ResetOverflow:
;; Returns:
;;     Carry: Set. Unconditional collision
;;     Overflow: Clear. Cancel grapple beam
    REP #$40 ; >.< SEP #$41
    SEC
    RTS


;;; $CFD5: Setup - PLM $D0E8 (grappled reaction, spike block, BTS 3. Draygon's broken turret) ;;;
Setup_DraygonsBrokenTurret:
;; Returns:
;;     Carry: Set. Unconditional collision
;;     Overflow: Set. Connect grapple beam

; Deal 1 damage to Samus
    LDA.W PeriodicSubDamage : CLC : ADC.W #$0000 : STA.W PeriodicSubDamage
    LDA.W PeriodicDamage : ADC.W #$0001 : STA.W PeriodicDamage
    SEP #$40 ; >.< SEP #$41
    SEC
    RTS


if !FEATURE_KEEP_UNREFERENCED
UNUSED_PLMEntries_Draws1x1ShotBlock_84CFEC:
; Unused. Draws 1x1 shot block
    dw Setup_Reaction_SpeedCrumbleBlock
    dw UNUSED_InstList_PLM_Draws1x1ShotBlock_84C8D4

UNUSED_PLMEntries_Draws1x2ShotBlock_84CFF0:
; Unused. Draws 1x2 shot block
    dw Setup_Reaction_SpeedCrumbleBlock
    dw UNUSED_InstList_PLM_Draws1x2ShotBlock_84C8DA

UNUSED_PLMEntries_Draws2x1ShotBlock_84CFF4:
; Unused. Draws 2x1 shot block
    dw Setup_Reaction_SpeedCrumbleBlock
    dw UNUSED_InstList_PLM_Draws2x1ShotBlock_84C8E0

UNUSED_PLMEntries_Draws2x2ShotBlock_84CFF8:
; Unused. Draws 2x2 shot block
    dw Setup_Reaction_SpeedCrumbleBlock
    dw UNUSED_InstList_PLM_Draws2x2ShotBlock_84C8E6
endif ; !FEATURE_KEEP_UNREFERENCED

PLMEntries_1x1RespawningCrumbleBlock:
; Bomb reaction, special block, BTS 0/4. 1x1 (respawning) crumble block
    dw Setup_Reaction_SpeedCrumbleBlock
    dw InstList_BombReaction_PLM_1x1RespawningCrumbleBlock

PLMEntries_2x1RespawningCrumbleBlock:
; Bomb reaction, special block, BTS 1/5. 2x1 (respawning) crumble block
    dw Setup_Reaction_SpeedCrumbleBlock
    dw InstList_BombReaction_PLM_2x1RespawningCrumbleBlock

PLMEntries_1x2RespawningCrumbleBlock:
; Bomb reaction, special block, BTS 2/6. 1x2 (respawning) crumble block
    dw Setup_Reaction_SpeedCrumbleBlock
    dw InstList_BombReaction_PLM_1x2RespawningCrumbleBlock

PLMEntries_2x2RespawningCrumbleBlock:
; Bomb reaction, special block, BTS 3/7. 2x2 (respawning) crumble block
    dw Setup_Reaction_SpeedCrumbleBlock
    dw InstList_BombReaction_PLM_2x2RespawningCrumbleBlock

if !FEATURE_KEEP_UNREFERENCED
UNUSED_PLMEntries_84D00C:
; Unused. Draws 1x1 bomb block
    dw Setup_Reaction_SpeedCrumbleBlock
    dw UNUSED_InstList_PLM_84C904

UNUSED_PLMEntries_84D010:
; Unused. Draws 1x2 bomb block
    dw Setup_Reaction_SpeedCrumbleBlock
    dw UNUSED_InstList_PLM_84C90A

UNUSED_PLMEntries_84D014:
; Unused. Draws 2x1 bomb block
    dw Setup_Reaction_SpeedCrumbleBlock
    dw UNUSED_InstList_PLM_84C910

UNUSED_PLMEntries_84D018:
; Unused. Draws 2x2 bomb block
    dw Setup_Reaction_SpeedCrumbleBlock
    dw UNUSED_InstList_PLM_84C916

UNUSED_PLMEntries_84D01C:
; Unused. Draws power bomb block
    dw Setup_Reaction_SpeedCrumbleBlock
    dw UNUSED_InstList_PLM_PowerBombBlockBombed_84C91C

UNUSED_PLMEntries_84D020:
; Unused. Draws super missile block
    dw Setup_Reaction_SpeedCrumbleBlock
    dw UNUSED_InstList_PLM_SuperMissileBlockBombed_84C922
endif ; !FEATURE_KEEP_UNREFERENCED

PLMEntries_BombReaction_SpeedBoostBlock:
; Bomb reaction, special block, BTS Eh/Fh / Brinstar 82h/83h/84h/85h. Speed block
    dw Setup_Reaction_SpeedCrumbleBlock
    dw InstList_PLM_BombReaction_SpeedBlock

if !FEATURE_KEEP_UNREFERENCED
UNUSED_PLMEntries_84D028:
; Unused. Respawning screw attack block
    dw UNUSED_Setup_84CDC2
    dw UNUSED_InstList_PLM_84C92E

UNUSED_PLMEntries_84D02C:
; Unused. Screw attack block
    dw UNUSED_Setup_84CDC2
    dw UNUSED_InstList_PLM_84C9BA
endif ; !FEATURE_KEEP_UNREFERENCED

PLMEntries_Collision_BTS82:
; Collision reaction, special, BTS Brinstar 82h. Respawning speed block, slower crumble animation
    dw Setup_Collision_RespawningSpeedBoostBlock
    dw InstList_PLM_RespawningSpeedBlock_SlowerCrumbleAnimation

PLMEntries_Collision_BTS83:
; Collision reaction, special, BTS Brinstar 83h. Speed block, slower crumble animation
    dw Setup_Collision_RespawningSpeedBoostBlock
    dw InstList_PLM_SpeedBlockSlowerCrumbleAnimation

PLMEntries_Collision_RespawningSpeedBoostBlock:
; Collision reaction, special, BTS Eh. Respawning speed block
    dw Setup_Collision_RespawningSpeedBoostBlock
    dw InstList_PLM_RespawningSpeedBoostBlock

PLMEntries_Collision_DachoraRespawningSpeedBoostBlock:
; Collision reaction, special, BTS Brinstar 84h. Respawning speed block
    dw Setup_Collision_RespawningSpeedBoostBlock
    dw InstList_PLM_RespawningSpeedBlock

PLMEntries_Collision_SpeedBoostBlock:
; Collision reaction, special, BTS Fh / Brinstar 85h. Speed block
    dw Setup_Collision_RespawningSpeedBoostBlock
    dw InstList_PLM_SpeedBoostBlock

PLMEntries_Collision_1x1RespawningCrumbleBlock:
; Collision reaction, special, BTS 0. 1x1 respawning crumble block
    dw Setup_Collision_RespawningCrumbleBlock
    dw InstList_PLM_1x1RespawningCrumbleBlock

PLMEntries_Collision_2x1RespawningCrumbleBlock:
; Collision reaction, special, BTS 1. 2x1 respawning crumble block
    dw Setup_Collision_RespawningCrumbleBlock
    dw InstList_PLM_2x1RespawningCrumbleBlock

PLMEntries_Collision_1x2RespawningCrumbleBlock:
; Collision reaction, special, BTS 2. 1x2 respawning crumble block
    dw Setup_Collision_RespawningCrumbleBlock
    dw InstList_PLM_1x2RespawningCrumbleBlock

PLMEntries_Collision_2x2RespawningCrumbleBlock:
; Collision reaction, special, BTS 3. 2x2 respawning crumble block
    dw Setup_Collision_RespawningCrumbleBlock
    dw InstList_PLM_2x2RespawningCrumbleBlock

PLMEntries_Collision_1x1CrumbleBlock:
; Collision reaction, special, BTS 4. 1x1 crumble block
    dw Setup_Collision_RespawningCrumbleBlock
    dw InstList_PLM_1x1CrumbleBlock

PLMEntries_Collision_2x1CrumbleBlock:
; Collision reaction, special, BTS 5. 2x1 crumble block
    dw Setup_Collision_RespawningCrumbleBlock
    dw InstList_PLM_2x1CrumbleBlock

PLMEntries_Collision_1x2CrumbleBlock:
; Collision reaction, special, BTS 6. 1x2 crumble block
    dw Setup_Collision_RespawningCrumbleBlock
    dw InstList_PLM_1x2CrumbleBlock

PLMEntries_Collision_2x2CrumbleBlock:
; Collision reaction, special, BTS 7. 2x2 crumble block
    dw Setup_Collision_RespawningCrumbleBlock
    dw InstList_PLM_2x2CrumbleBlock

PLMEntries_Reaction_1x1RespawningShotBlock:
; Shot/bombed/grappled reaction, shootable, BTS 0. 1x1 respawning shot block
    dw Setup_Reaction_RespawningShotBlock
    dw InstList_PLM_1x1RespawningShotBlock

PLMEntries_Reaction_2x1RespawningShotBlock:
; Shot/bombed/grappled reaction, shootable, BTS 1. 2x1 respawning shot block
    dw Setup_Reaction_RespawningShotBlock
    dw InstList_PLM_2x1RespawningShotBlock

PLMEntries_Reaction_1x2RespawningShotBlock:
; Shot/bombed/grappled reaction, shootable, BTS 2. 1x2 respawning shot block
    dw Setup_Reaction_RespawningShotBlock
    dw InstList_PLM_1x2RespawningShotBlock

PLMEntries_Reaction_2x2RespawningShotBlock:
; Shot/bombed/grappled reaction, shootable, BTS 3. 2x2 respawning shot block
    dw Setup_Reaction_RespawningShotBlock
    dw InstList_PLM_2x2RespawningShotBlock

PLMEntries_Reaction_1x1ShotBlock:
; Shot/bombed/grappled reaction, shootable, BTS 4. 1x1 shot block
    dw Setup_DeactivatePLM
    dw InstList_PLM_1x1ShotBlock

PLMEntries_Reaction_2x1ShotBlock:
; Shot/bombed/grappled reaction, shootable, BTS 5. 2x1 shot block
    dw Setup_DeactivatePLM
    dw InstList_PLM_2x1ShotBlock

PLMEntries_Reaction_1x2ShotBlock:
; Shot/bombed/grappled reaction, shootable, BTS 6. 1x2 shot block
    dw Setup_DeactivatePLM
    dw InstList_PLM_1x2ShotBlock

PLMEntries_Reaction_2x2ShotBlock:
; Shot/bombed/grappled reaction, shootable, BTS 7. 2x2 shot block
    dw Setup_DeactivatePLM
    dw InstList_PLM_2x2ShotBlock

PLMEntries_Reaction_RespawningPowerBombBlock:
; Shot/bombed/grappled reaction, shootable, BTS 8. Respawning power bomb block
    dw Setup_Reaction_RespawningPowerBombBlock
    dw InstList_PLM_RespawningPowerBombBlock

PLMEntries_Reaction_PowerBombBlock:
; Shot/bombed/grappled reaction, shootable, BTS 9. Power bomb block
    dw Setup_Reaction_RespawningPowerBombBlock
    dw InstList_PLM_PowerBombBlock

PLMEntries_Reaction_RespawningSuperMissileBlock:
; Shot/bombed/grappled reaction, shootable, BTS A. Respawning super missile block
    dw Setup_Reaction_SuperMissileBlock
    dw InstList_PLM_RespawningSuperMissileBlock

PLMEntries_Reaction_SuperMissileBlock:
; Shot/bombed/grappled reaction, shootable, BTS B. Super missile block
    dw Setup_Reaction_SuperMissileBlock
    dw InstList_PLM_SuperMissileBlock

PLMEntries_EnemyBreakableBlock:
; Enemy collision reaction, spike block, BTS Fh. Enemy breakable block
    dw Setup_EnemyBreakableBlock
    dw InstList_PLM_EnemyBreakableBlock

PLMEntries_Collision_1x1RespawningBombBlock:
; Collision reaction, bombable, BTS 0. 1x1 respawning bomb block
    dw Setup_Collision_RespawningBombBlock
    dw InstList_PLM_CollisionReaction_1x1RespawningBombBlock

PLMEntries_Collision_2x1RespawningBombBlock:
; Collision reaction, bombable, BTS 1. 2x1 respawning bomb block
    dw Setup_Collision_RespawningBombBlock
    dw InstList_PLM_Collision_2x1RespawningBombBlock

PLMEntries_Collision_1x2RespawningBombBlock:
; Collision reaction, bombable, BTS 2. 1x2 respawning bomb block
    dw Setup_Collision_RespawningBombBlock
    dw InstList_PLM_Collision_1x2RespawningBombBlock

PLMEntries_Collision_2x2RespawningBombBlock:
; Collision reaction, bombable, BTS 3. 2x2 respawning bomb block
    dw Setup_Collision_RespawningBombBlock
    dw InstList_PLM_Collision_2x2RespawningBombBlock

PLMEntries_Collision_1x1BombBlock:
; Collision reaction, bombable, BTS 4. 1x1 bomb block
    dw Setup_Collision_RespawningBombBlock
    dw InstList_PLM_Collision_1x1RespawningBombBlock

PLMEntries_Collision_2x1BombBlock:
; Collision reaction, bombable, BTS 5. 2x1 bomb block
    dw Setup_Collision_RespawningBombBlock
    dw InstList_PLM_Collision_2x1BombBlock

PLMEntries_Collision_1x2BombBlock:
; Collision reaction, bombable, BTS 6. 1x2 bomb block
    dw Setup_Collision_RespawningBombBlock
    dw InstList_PLM_Collision_1x2BombBlock

PLMEntries_Collision_2x2BombBlock:
; Collision reaction, bombable, BTS 7. 2x2 bomb block
    dw Setup_Collision_RespawningBombBlock
    dw InstList_PLM_Collision_2x2BombBlock

PLMEntries_Reaction_1x1RespawningBombBlock:
; Shot/bombed/grappled reaction, bombable, BTS 0. 1x1 respawning bomb block
    dw Setup_Reaction_RespawningBombBlock
    dw InstList_PLM_Reaction_1x1RespawningBombBlock_0

PLMEntries_Reaction_2x1RespawningBombBlock:
; Shot/bombed/grappled reaction, bombable, BTS 1. 2x1 respawning bomb block
    dw Setup_Reaction_RespawningBombBlock
    dw InstList_PLM_Reaction_2x1RespawningBombBlock

PLMEntries_Reaction_1x2RespawningBombBlock:
; Shot/bombed/grappled reaction, bombable, BTS 2. 1x2 respawning bomb block
    dw Setup_Reaction_RespawningBombBlock
    dw InstList_PLM_Reaction_1x2RespawningBombBlock

PLMEntries_Reaction_2x2RespawningBombBlock:
; Shot/bombed/grappled reaction, bombable, BTS 3. 2x2 respawning bomb block
    dw Setup_Reaction_RespawningBombBlock
    dw InstList_PLM_Reaction_2x2RespawningBombBlock

PLMEntries_Reaction_1x1BombBlock:
; Shot/bombed/grappled reaction, bombable, BTS 4. 1x1 bomb block
    dw Setup_Reaction_RespawningBombBlock
    dw InstList_PLM_Reaction_1x1RespawningBombBlock_4

PLMEntries_Reaction_2x1BombBlock:
; Shot/bombed/grappled reaction, bombable, BTS 5. 2x1 bomb block
    dw Setup_Reaction_RespawningBombBlock
    dw InstList_PLM_Reaction_2x1BombBlock

PLMEntries_Reaction_1x2BombBlock:
; Shot/bombed/grappled reaction, bombable, BTS 6. 1x2 bomb block
    dw Setup_Reaction_RespawningBombBlock
    dw InstList_PLM_Reaction_1x2BombBlock

PLMEntries_Reaction_2x2BombBlock:
; Shot/bombed/grappled reaction, bombable, BTS 7. 2x2 bomb block
    dw Setup_Reaction_RespawningBombBlock
    dw InstList_PLM_Reaction_2x2BombBlock

PLMEntries_Grappled_GrappleBlock:
; Grappled reaction, grapple block, BTS 0/3. Grapple block
    dw Setup_GenericGrappleBlock_SetOverflow
    dw InstList_PLM_GrappleBlock

PLMEntries_Grappled_RespawningBreakableGrappleBlock:
; Grappled reaction, grapple block, BTS 1. Respawning breakable grapple block
    dw Setup_RespawningBreakableGrappleBlock
    dw InstList_PLM_RespawningBreakableGrappleBlock

PLMEntries_Grappled_BreakableGrappleBlock:
; Grappled reaction, grapple block, BTS 2. Breakable grapple block
    dw Setup_RespawningBreakableGrappleBlock
    dw InstList_PLM_BreakableGrappleBlock

PLMEntries_Grappled_GenericSpikeBlock:
; Grappled reaction, generic spike block
    dw Setup_GenericGrappleBlock_ResetOverflow
    dw InstList_PLM_GrappleBlock

PLMEntries_Grappled_DraygonsBrokenTurret:
; Grappled reaction, spike block, BTS 3. Draygon's broken turret
    dw Setup_DraygonsBrokenTurret
    dw InstList_PLM_GrappleBlock


if !FEATURE_KEEP_UNREFERENCED
;;; $D0EC: Instruction list - PLM $D0F2 (unused. Blue Brinstar face-block) ;;;
InstList_PLM_UnusedBlueBrinstarFaceBlock:
    dw $0001,DrawInst_UnusedBlueBrinstarFaceBlock
    dw Instruction_PLM_Delete


;;; $D0F2: Unused. PLM entry - Blue Brinstar face-block ;;;
PLMEntries_UnusedBlueBrinstarFaceBlock:
    dw Setup_DeactivatePLM
    dw InstList_PLM_UnusedBlueBrinstarFaceBlock
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $D0F6: Instruction list - PLM $D113 (chozo crumbled block) ;;;
InstList_PLM_CrumbleLowerNorfairChozoRoomPlug:
    dw $0004,DrawInst_Respawn1x1_0
    dw $0004,DrawInst_Respawn1x1_1
    dw $0004,DrawInst_Respawn1x1_2
    dw $0001,DrawInst_Respawn1x1_3
    dw Instruction_PLM_Delete


;;; $D108: Setup - PLM $D113 (chozo crumbled block) ;;;
Setup_CrumbleLowerNorfairChozoRoomPlug:
;; Parameters:
;;     Y: PLM index

; This setup routine fails to set the block to air correctly (missing LDA)
    LDX.W PLM_BlockIndices,Y : AND.W #$0FFF : STA.L LevelData,X
    RTS


;;; $D113: PLM entry - chozo crumbled block ;;;
PLMEntries_CrumbleLowerNorfairChozoRoomPlug:
; Chozo crumbled block
    dw Setup_CrumbleLowerNorfairChozoRoomPlug
    dw InstList_PLM_CrumbleLowerNorfairChozoRoomPlug


if !FEATURE_KEEP_UNREFERENCED
;;; $D117: Setup - PLM $D127 (unused. Shot block) ;;;
Setup_UnusedShotBlock:
    LDX.W PLM_BlockIndices,Y
    LDA.W #$C000
    JSR Write_Level_Data_Block_Type_and_BTS
    RTS


;;; $D121: Instruction list - PLM $D127 (unused. Shot block) ;;;
InstList_PLM_UnusedShotBlock:
    dw $0004,DrawInst_84A33F
    dw Instruction_PLM_Delete


;;; $D127: Unused. PLM entry - shot block ;;;
PLMEntries_UnusedShotBlock:
; Unused. Shot block
    dw Setup_UnusedShotBlock
    dw InstList_PLM_UnusedShotBlock


;;; $D12B: Setup - PLM $D13B (unused. Grapple block) ;;;
Setup_UnusedGrappleBlock:
    LDX.W PLM_BlockIndices,Y
    LDA.W #$E000
    JSR Write_Level_Data_Block_Type_and_BTS
    RTS


;;; $D135: Instruction list - PLM $D13B (unused. Grapple block) ;;;
InstList_PLM_UnusedGrappleBlock:
    dw $0001,DrawInst_BreakableGrappleBlock_0
    dw Instruction_PLM_Delete


;;; $D13B: Unused. PLM entry - grapple block ;;;
PLMEntries_UnusedGrappleBlock:
    dw Setup_UnusedGrappleBlock
    dw InstList_PLM_UnusedGrappleBlock
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $D13F: Instruction list - PLM $D6D6 (Lower Norfair chozo hand) ;;;
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


;;; $D155: Instruction - FX base Y position = 2D2h ;;;
Instruction_PLM_FXBaseYPosition_2D2:
    LDA.W #$02D2 : STA.W FX_BaseYPosition
    RTS


;;; $D15C: Pre-instruction - delete PLM and spawn trigger block if block (4, 8) is a blank air block ;;;
PreInstruction_DeletePLM_SpawnTriggerBlockIf_4_8_IsBlankAir:
; Used by PLM $D6D6 (Lower Norfair chozo hand)
; Block (4, 8) is presumed to be where the chozo's hand is
    PHX
    SEP #$20
    LDA.B #$08 : STA.W $4202
    LDA.W RoomWidthBlocks : STA.W $4203
    LDA.B #$04
    REP #$20
    AND.W #$00FF : CLC : ADC.W $4216 : ASL : TAX
    LDA.L LevelData,X : CMP.W #$00FF : BNE .return
    LDA.W #$B083 ; block type + BTS
    JSR Write_Level_Data_Block_Type_and_BTS
    LDX.W PLM_Index
    STZ.W PLM_IDs,X

  .return:
    PLX
    RTS


;;; $D18E: RTS. Setup - PLM $D6D6 (Lower Norfair chozo hand) ;;;
RTS_84D18E:
    RTS


;;; $D18F: Setup - PLM $D6DA (collision reaction, special, BTS Norfair 83h. Lower Norfair chozo hand trigger) ;;;
Setup_Reaction_LowerNorfairChozoHandTrigger:
;; Parameters:
;;     Y: PLM index
;; Returns:
;;     Carry: Set. Unconditional collision

; Enemy 0 is presumed to be the chozo statue
    LDA.W CollectedItems : AND.W #$0200 : BEQ .return
    LDA.W CollisionMovementDirection : AND.W #$000F : CMP.W #$0003 : BNE .return
    LDA.W Pose : CMP.W #$001D : BEQ .react
    CMP.W #$0079 : BEQ .react
    CMP.W #$007A : BNE .return

  .react:
    LDA.W #$000C
    JSL MarkEvent_inA
    LDA.W #$0001 : STA.W Enemy.init0
    LDX.W PLM_BlockIndices,Y
    LDA.L LevelData,X : AND.W #$0FFF : STA.L LevelData,X
    LDA.W #$0000
    JSL Run_Samus_Command
    JSL Spawn_Hardcoded_PLM
    db $0C,$1D
    dw PLMEntries_CrumbleLowerNorfairChozoRoomPlug

  .return:
    LDA.W #$0000 : STA.W PLM_IDs,Y
    SEC
    RTS


;;; $D1E6: Pre-instruction - increment PLM room argument if shot by (super) missile ;;;
PreInstruction_PLM_IncrementPLMRoomArgIfShotByMissile:
;; Parameter:
;;     X: PLM index

; Used by PLM $D6DE (Mother Brain's glass)
    LDA.W PLM_Timers,X : BEQ .return
    AND.W #$0F00 : CMP.W #$0200 : BEQ .incRoomArg
    CMP.W #$0100 : BNE .return

  .incRoomArg:
    STZ.W PLM_Timers,X
    INC.W PLM_RoomArgs,X

  .return:
    STZ.W PLM_Timers,X
    RTS


;;; $D202: Instruction list - PLM $D6DE (Mother Brain's glass) ;;;
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


;;; $D2ED: Instruction list - PLM $D6E2 (unused. Mother Brain's glass, area boss dead state) ;;;
InstList_PLM_UnusedMotherBrainsGlass_AreaBossDead:
    dw $0001,UNUSED_DrawInst_849817
    dw Instruction_PLM_Delete


;;; $D2F3: Instruction list - PLM $D6E6 (unused. Mother Brain's glass, no glass state) ;;;
InstList_PLM_UnusedMotherBrainsGlass_NoGlassState:
    dw $0001,DrawInst_MotherBrainsGlass_9
    dw Instruction_PLM_Delete


;;; $D2F9: Instruction - go to [[Y] + 2] if [room argument] < [[Y]] ;;;
Instruction_PLM_GotoY_IfRoomArgGreaterThanY:
;; Parameters:
;;     X: PLM index
;;     Y: Pointer to instruction arguments
;; Returns:
;;     Y: Pointer to next instruction
    LDA.W PLM_RoomArgs,X : CMP.W $0000,Y : BCS .next
    LDA.W $0002,Y : TAY
    RTS

  .next:
    INY #4
    RTS


;;; $D30B: Instruction - spawn four Mother Brain's glass shattering shards with arguments [[Y]..[Y]+7] ;;;
Inst_PLM_Spawn4MotherBrainsGlassShatteringShardsWithArgs:
;; Parameters:
;;     Y: Pointer to instruction arguments
;; Returns:
;;     Y: Pointer to next instruction
    LDA.W #$002E
    JSL QueueSound_Lib3_Max15
    LDA.W $0000,Y
    JSR Spawn4MotherBrainsGlassShatteringShardsWithArgA
    LDA.W $0002,Y
    JSR Spawn4MotherBrainsGlassShatteringShardsWithArgA
    LDA.W $0004,Y
    JSR Spawn4MotherBrainsGlassShatteringShardsWithArgA
    LDA.W $0006,Y
    JSR Spawn4MotherBrainsGlassShatteringShardsWithArgA
    TYA : CLC : ADC.W #$0008 : TAY
    RTS


;;; $D331: Spawn Mother Brain's glass shattering shard with argument [A] ;;;
Spawn4MotherBrainsGlassShatteringShardsWithArgA:
;; Parameters:
;;     A: Enemy projectile argument
;;         0: 8
;;         2: -28h
;;         4: -10h
    PHY
    LDY.W #EnemyProjectile_MotherBrainGlassShattering_Shard
    JSL SpawnEnemyProjectileY_ParameterA_RoomGraphics
    PLY
    RTS


;;; $D33B: Pre-instruction - wake PLM if Samus has bombs ;;;
PreInstruction_PLM_WakePLMIfSamusHasBombs:
;; Parameter:
;;     X: PLM index

; Used by PLM $D6EA (Bomb Torizo's crumbling chozo)
    LDA.W CollectedItems : AND.W #$1000 : BEQ .return
    LDA.W #$0001 : STA.L PLMExtra_InstructionTimers,X
    INC.W PLM_InstListPointers,X : INC.W PLM_InstListPointers,X
    LDA.W #.return : STA.W PLM_PreInstructions,X

  .return:
    RTS


;;; $D357: Instruction - spawn Bomb Torizo statue breaking with argument [[Y]] ;;;
Instruction_PLM_SpawnBombTorizoStatueBreakingWIthArgY:
;; Parameters:
;;     Y: Pointer to instruction arguments
;; Returns:
;;     Y: Pointer to next instruction
    PHX : PHY
    LDA.W $0000,Y
    LDY.W #EnemyProjectile_BombTorizoStatueBreaking
    JSL SpawnEnemyProjectileY_ParameterA_RoomGraphics
    PLY : PLX
    INY #2
    RTS


;;; $D368: Instruction list - PLM $D6EA (Bomb Torizo's crumbling chozo) ;;;
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


;;; $D3C7: Instruction - queue song 1 music track ;;;
Instruction_PLM_QueueSong1MusicTrack:
    LDA.W #$0006
    JSL QueueMusicDataOrTrack_8FrameDelay
    RTS


;;; $D3CF: Instruction list - PLM $D6F8 (clear slope access for Wrecked Ship chozo) ;;;
InstList_PLM_ClearSlopeAccessForWreckedShipChozo:
    dw $0001,DrawInst_ClearSlopeAccessForWreckedShipChozo
    dw Instruction_PLM_TransformWreckedShipChozosSpikesIntoSlopes
    dw Instruction_PLM_Delete


;;; $D3D7: Instruction - transform Wrecked Ship chozo's spikes into slopes ;;;
Instruction_PLM_TransformWreckedShipChozosSpikesIntoSlopes:
;; Parameters:
;;     X: PLM index
    PHX
    LDX.W #$1608
    LDA.W #$1012 ; block type + BTS
    JSR Write_Level_Data_Block_Type_and_BTS
    LDX.W #$160A
    LDA.W #$1013 ; block type + BTS
    JSR Write_Level_Data_Block_Type_and_BTS
    PLX
    RTS


;;; $D3EC: Instruction list - PLM $D6FC (block slope access for Wrecked Ship chozo) ;;;
InstList_PLM_BlockSlopeAccessForWreckedShipChozo:
    dw $0001,DrawInst_BlockSlopeAccessForWreckedShipChozo
    dw Instruction_PLM_RevertWreckedShipChozosSlopesIntoSpikes
    dw Instruction_PLM_Delete


;;; $D3F4: Instruction - revert Wrecked Ship chozo's slopes into spikes ;;;
Instruction_PLM_RevertWreckedShipChozosSlopesIntoSpikes:
;; Parameters:
;;     X: PLM index
    PHX
    LDX.W #$1608
    LDA.W #$A000 ; block type + BTS
    JSR Write_Level_Data_Block_Type_and_BTS
    LDX.W #$160A
    LDA.W #$A000 ; block type + BTS
    JSR Write_Level_Data_Block_Type_and_BTS
    PLX
    RTS


if !FEATURE_KEEP_UNREFERENCED
;;; $D409: Unused. Pre-instruction - go to link instruction if shot with a bomb ;;;
UNUSED_PreInst_PLM_GotoToLinkInstructionIfBombed_84D409:
;; Parameter:
;;     X: PLM index

; Used PLM $D700 (unused. Wrecked Ship 3x4 chozo bomb block)
    LDA.W PLM_Timers,X : AND.W #$0F00 : CMP.W #$0500 : BNE .clearShotStatus
    LDA.L PLMExtra_LinkInstructions,X : STA.W PLM_InstListPointers,X
    LDA.W #$0001 : STA.L PLMExtra_InstructionTimers,X

  .clearShotStatus:
    STZ.W PLM_Timers,X
    RTS


;;; $D426: Instruction list - PLM $D700 (unused. Wrecked Ship 3x4 chozo bomb block) ;;;
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


;;; $D44E: Instruction list - PLM $D704 (unused. Alternate Lower Norfair chozo hand) ;;;
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


;;; $D476: Unused. Instruction - drain acid lake ;;;
UNUSED_Instruction_PLM_DrainAcidLake_84D476:
    LDA.W #$02D2 : STA.W FX_TargetYPosition
    LDA.W #$0070 : STA.W FX_YSubVelocity
    LDA.W #$0020 : STA.W FX_Timer
    RTS


;;; $D489: Unused. Instruction - FX base Y position = 2D2h ;;;
UNUSED_Instruction_PLM_FXBaseYPosition_2D2_84D489:
; Clone of Instruction_PLM_FXBaseYPosition_2D2
    LDA.W #$02D2 : STA.W FX_BaseYPosition
    RTS


;;; $D490: Instruction list - PLM $D708 (unused. Lower Norfair 2x2 chozo shot block) ;;;
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


;;; $D4BE: RTS. Instruction - NOP ;;;
RTS_84D4BE:
    RTS


;;; $D4BF: Pre-instruction - wake PLM if A/X/B/Y/left/right pressed ;;;
PreInstruction_PLM_WakePLMIf_A_B_X_Y_Left_Right:
;; Parameter:
;;     X: PLM index

; Used by PLM $D70C (n00b tube)
    LDA.B DP_Controller1New : AND.W #$C3C0
    BEQ .return
    LDA.W #$0001 : STA.L PLMExtra_InstructionTimers,X
    INC.W PLM_InstListPointers,X : INC.W PLM_InstListPointers,X

  .return:
    RTS


;;; $D4D4: Instruction list - PLM $D70C (n00b tube) ;;;
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


;;; $D525: Instruction - enable water physics ;;;
Instruction_PLM_EnableWaterPhysics:
    LDA.W #$0004 : TRB.W FX_LiquidOptions
    RTS


;;; $D52C: Instruction - spawn n00b tube crack enemy projectile ;;;
Instruction_PLM_SpawnNoobTubeCrackEnemyProjectile:
    PHY
    LDY.W #EnemyProjectile_NoobTubeCrack
    JSL SpawnEnemyProjectileY_ParameterA_RoomGraphics
    PLY
    RTS


;;; $D536: Instruction - trigger n00b tube earthquake ;;;
Instruction_PLM_TriggerNoobTubeEarthquake:
    LDA.W #$000B : STA.W EarthquakeType
    LDA.W #$0040 : STA.W EarthquakeTimer
    RTS


;;; $D543: Instruction - spawn ten n00b tube shards and six n00b tube released air bubbles ;;;
Inst_PLM_SpawnANoobTubeShards_6NoobTubeReleasedAirBubbles:
    PHY
    LDA.W #$0000
    LDY.W #EnemyProjectile_NoobTubeShard
    JSL SpawnEnemyProjectileY_ParameterA_RoomGraphics
    LDA.W #$0002
    LDY.W #EnemyProjectile_NoobTubeShard
    JSL SpawnEnemyProjectileY_ParameterA_RoomGraphics
    LDA.W #$0004
    LDY.W #EnemyProjectile_NoobTubeShard
    JSL SpawnEnemyProjectileY_ParameterA_RoomGraphics
    LDA.W #$0006
    LDY.W #EnemyProjectile_NoobTubeShard
    JSL SpawnEnemyProjectileY_ParameterA_RoomGraphics
    LDA.W #$0008
    LDY.W #EnemyProjectile_NoobTubeShard
    JSL SpawnEnemyProjectileY_ParameterA_RoomGraphics
    LDA.W #$000A
    LDY.W #EnemyProjectile_NoobTubeShard
    JSL SpawnEnemyProjectileY_ParameterA_RoomGraphics
    LDA.W #$000C
    LDY.W #EnemyProjectile_NoobTubeShard
    JSL SpawnEnemyProjectileY_ParameterA_RoomGraphics
    LDA.W #$000E
    LDY.W #EnemyProjectile_NoobTubeShard
    JSL SpawnEnemyProjectileY_ParameterA_RoomGraphics
    LDA.W #$0010
    LDY.W #EnemyProjectile_NoobTubeShard
    JSL SpawnEnemyProjectileY_ParameterA_RoomGraphics
    LDA.W #$0012
    LDY.W #EnemyProjectile_NoobTubeShard
    JSL SpawnEnemyProjectileY_ParameterA_RoomGraphics
    LDA.W #$0000
    LDY.W #EnemyProjectile_NoobTubeAirBubbles
    JSL SpawnEnemyProjectileY_ParameterA_RoomGraphics
    LDA.W #$0002
    LDY.W #EnemyProjectile_NoobTubeAirBubbles
    JSL SpawnEnemyProjectileY_ParameterA_RoomGraphics
    LDA.W #$0004
    LDY.W #EnemyProjectile_NoobTubeAirBubbles
    JSL SpawnEnemyProjectileY_ParameterA_RoomGraphics
    LDA.W #$0006
    LDY.W #EnemyProjectile_NoobTubeAirBubbles
    JSL SpawnEnemyProjectileY_ParameterA_RoomGraphics
    LDA.W #$0008
    LDY.W #EnemyProjectile_NoobTubeAirBubbles
    JSL SpawnEnemyProjectileY_ParameterA_RoomGraphics
    LDA.W #$000A
    LDY.W #EnemyProjectile_NoobTubeAirBubbles
    JSL SpawnEnemyProjectileY_ParameterA_RoomGraphics
    PLY
    RTS


;;; $D5E6: Instruction - lock Samus ;;;
Instruction_PLM_LockSamus:
    LDA.W #$0000
    JSL Run_Samus_Command
    RTS


;;; $D5EE: Instruction - unlock Samus ;;;
Instruction_PLM_UnlockSamus:
    LDA.W #$0001
    JSL Run_Samus_Command
    RTS


;;; $D5F6: Setup - PLM $D6DE (Mother Brain's glass) ;;;
Setup_MotherBrainsGlass:
;; Parameters:
;;     Y: PLM index

; A draw instruction changes the PLM block type to shot block, making this a generic shot trigger
    LDA.W #$0000 : STA.W PLM_RoomArgs,Y ; Clear PLM room argument (used as hit counter)
    LDX.W PLM_BlockIndices,Y
    LDA.W #$8044 ; Make PLM solid block with BTS 44h
    JSR Write_Level_Data_Block_Type_and_BTS
    RTS


;;; $D606: Setup - PLM $D6EA (Bomb Torizo's crumbling chozo) ;;;
Setup_BombTorizosCrumblingChozo:
;; Parameters:
;;     Y: PLM index

; Delete PLM if area torizo is dead
    LDA.W #$0004
    JSL CheckIfBossBitsForCurrentAreaMatchAnyBitsInA
    BCC .return
    LDA.W #$0000 : STA.W PLM_IDs,Y

  .return:
    RTS


;;; $D616: Setup - PLM $D6EE (Wrecked Ship chozo hand) ;;;
Setup_WreckedShipChozoHand:
;; Parameters:
;;     Y: PLM index

; Make PLM block a Wrecked Ship chozo hand trigger
    LDX.W PLM_BlockIndices,Y
    LDA.W #$B080 ; block type + BTS
    JSR Write_Level_Data_Block_Type_and_BTS
    RTS


;;; $D620: Setup - PLM $D6F2 (collision reaction, special, BTS Wrecked Ship 80h. Wrecked Ship chozo hand trigger) ;;;
Setup_Collision_WreckedShipChozoHandTrigger:
;; Parameters:
;;     Y: PLM index
;; Returns:
;;     Carry: Set. Unconditional collision

; Enemy 0 is presumed to be the chozo statue
    LDA.W #$0001
    JSL CheckIfBossBitsForCurrentAreaMatchAnyBitsInA
    BCC .return
    LDA.W CollisionMovementDirection : AND.W #$000F : CMP.W #$0003 : BNE .return
    LDA.W Pose : CMP.W #$001D : BEQ .trigger
    CMP.W #$0079 : BEQ .trigger
    CMP.W #$007A : BNE .return

  .trigger:
    LDA.W #$0001 : STA.W Enemy.init0
    LDA.W #$0202 : STA.L Scrolls+7
    LDA.W #$0101 : STA.L Scrolls+$D
    LDX.W PLM_BlockIndices,Y
    LDA.L LevelData,X : AND.W #$0FFF : STA.L LevelData,X
    LDA.W #$0000
    JSL Run_Samus_Command
    JSL Spawn_Hardcoded_PLM
    db $17,$1D
    dw PLMEntries_ClearSlopeAccessForWreckedShipChozo

  .return:
    LDA.W #$0000 : STA.W PLM_IDs,Y
    SEC
    RTS


if !FEATURE_KEEP_UNREFERENCED
;;; $D67F: Setup - PLM $D700 (unused. Wrecked Ship 3x4 chozo bomb block) ;;;
Setup_UnusedWreckedShip3x4ChozoBombBlock:
;; Parameters:
;;     Y: PLM index

; Make PLM block an air block with BTS 44h (BTS for generic shot trigger)
    LDX.W PLM_BlockIndices,Y
    LDA.W #$0044
    JSR Write_Level_Data_Block_Type_and_BTS
    RTS


;;; $D689: Setup - PLM $D704 (unused. Alternate Lower Norfair chozo hand) ;;;
Setup_UnusedAlternateLowerNorfairChozoHand:
;; Parameters:
;;     Y: PLM index

; Make PLM block a solid block with BTS 44h (BTS for generic shot trigger)
    LDX.W PLM_BlockIndices,Y
    LDA.W #$8044 ; block type + BTS
    JSR Write_Level_Data_Block_Type_and_BTS
    RTS


;;; $D693: Setup - PLM $D708 (unused. Lower Norfair 2x2 chozo shot block) ;;;
Setup_UnusedLowerNorfair2x2ChozoShotBlock:
;; Parameters:
;;     Y: PLM index

; Make PLM block a solid block with BTS 44h (BTS for generic shot trigger), extended to the right and down to a 2x2 block
    LDX.W PLM_BlockIndices,Y
    LDA.W #$8044 ; block type + BTS
    JSR Write_Level_Data_Block_Type_and_BTS
    LDX.W PLM_BlockIndices,Y
    INX #2
    LDA.W #$50FF ; block type + BTS
    JSR Write_Level_Data_Block_Type_and_BTS
    LDA.W PLM_BlockIndices,Y : CLC : ADC.W RoomWidthBlocks : ADC.W RoomWidthBlocks : TAX
    LDA.W #$D0FF ; block type + BTS
    JSR Write_Level_Data_Block_Type_and_BTS
    LDA.W PLM_BlockIndices,Y : CLC : ADC.W RoomWidthBlocks : ADC.W RoomWidthBlocks : TAX
    INX #2
    LDA.W #$D0FF ; block type + BTS
    JSR Write_Level_Data_Block_Type_and_BTS
    RTS
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $D6CC: Setup - PLM $D70C (n00b tube) ;;;
Setup_NoobTube:
;; Parameters:
;;     Y: PLM index

; Make PLM block a solid block with BTS 44h (BTS for generic shot trigger)
    LDX.W PLM_BlockIndices,Y
    LDA.W #$8044 ; block type + BTS
    JSR Write_Level_Data_Block_Type_and_BTS
    RTS


PLMEntries_LowerNorfairChozoHand:
; Lower Norfair chozo hand
    dw RTS_84D18E
    dw InstList_PLM_LowerNorfairChozoHand_0

PLMEntries_Collision_LowerNorfairChozoHandCheck:
; Collision reaction, special, BTS Norfair 83h. Lower Norfair chozo hand check
    dw Setup_Reaction_LowerNorfairChozoHandTrigger
    dw InstList_PLM_Delete

PLMEntries_MotherBrainsGlass:
; Mother Brain's glass
    dw Setup_MotherBrainsGlass
    dw InstList_PLM_MotherBrainsGlass_0

if !FEATURE_KEEP_UNREFERENCED
UNUSED_PLMEntries_MotherBrainsGlass_AreaBossDead_84D6E2:
; Unused. Mother Brain's glass, area boss dead state
    dw Setup_DeactivatePLM
    dw InstList_PLM_UnusedMotherBrainsGlass_AreaBossDead

UNUSED_PLMEntries_MotherBrainsGlass_NoGlassState_84D6E6:
; Unused. Mother Brain's glass, no glass state
    dw Setup_DeactivatePLM
    dw InstList_PLM_UnusedMotherBrainsGlass_NoGlassState
endif ; !FEATURE_KEEP_UNREFERENCED

PLMEntries_BombTorizosCrumblingChozo:
; Bomb Torizo's crumbling chozo
    dw Setup_BombTorizosCrumblingChozo
    dw InstList_PLM_BombTorizosCrumblingChozo

PLMEntries_WreckedShipChozoHand:
; Wrecked Ship chozo hand
    dw Setup_WreckedShipChozoHand
    dw InstList_PLM_Delete

PLMEntries_Collision_WreckedShipChozoHandCheck:
; Collision reaction, special, BTS Wrecked Ship 80h. Wrecked Ship chozo hand check
    dw Setup_Collision_WreckedShipChozoHandTrigger
    dw InstList_PLM_Delete


;;; $D6F6: RTS. Setup - PLM $D6F8 (clear slope access for Wrecked Ship chozo) ;;;
RTS_84D6F6:
    RTS


;;; $D6F7: RTS. Setup - PLM $D6FC (block slope access for Wrecked Ship chozo) ;;;
RTS_84D6F7:
    RTS


PLMEntries_ClearSlopeAccessForWreckedShipChozo:
; Clear slope access for Wrecked Ship chozo
    dw RTS_84D6F6
    dw InstList_PLM_ClearSlopeAccessForWreckedShipChozo

PLMEntries_BlockSlopeAccessForWreckedShipChozo:
; Block slope access for Wrecked Ship chozo
    dw RTS_84D6F7
    dw InstList_PLM_BlockSlopeAccessForWreckedShipChozo

if !FEATURE_KEEP_UNREFERENCED
UNUSED_PLMEntries_WreckedShip3x4ChozoShotBlock_84D700:
; Unused. Wrecked Ship 3x4 chozo bomb block
    dw Setup_UnusedWreckedShip3x4ChozoBombBlock
    dw UNUSED_InstList_PLM_WreckedShip3x4ChozoBombBlock_84D426

UNUSED_PLMEntries_AltLowerNorfairChozoHand_84D704:
; Unused. Alternate Lower Norfair chozo hand
    dw Setup_UnusedAlternateLowerNorfairChozoHand
    dw UNUSED_InstList_PLM_AlternateLowerNorfairChozoHand_84D44E

UNUSED_PLMEntries_LowerNorfair2x2ChozoShotBlock_84D708:
; Unused. Lower Norfair 2x2 chozo shot block
    dw Setup_UnusedLowerNorfair2x2ChozoShotBlock
    dw InstList_PLM_UnusedLowerNorfair2x2ChozoShotBlock_84D490
endif ; !FEATURE_KEEP_UNREFERENCED

PLMEntries_NoobTube:
; n00b tube
    dw Setup_NoobTube
    dw InstList_PLM_NoobTube_0


if !FEATURE_KEEP_UNREFERENCED
;;; $D710: Unused. Pre-instruction - wake PLM if Samus is within 4 blocks of PLM ;;;
UNUSED_PreInst_PLM_WakePLMIfSamusIsWithin4Blocks_84D710:
;; Parameter:
;;     X: PLM index
    JSL Calculate_PLM_Block_Coordinates
    LDA.W SamusXPosition : LSR #4 : SEC : SBC.W PLM_XBlock : BPL +
    EOR.W #$FFFF : INC

+   CMP.W #$0004 : BEQ +
    BCS .return

+   LDA.W SamusYPosition : LSR #4 : SEC : SBC.W PLM_YBlock : BPL +
    EOR.W #$FFFF : INC

+   CMP.W #$0004 : BEQ +
    BCS .return

+   LDA.L PLMExtra_LinkInstructions,X : STA.W PLM_InstListPointers,X
    LDA.W #$0001 : STA.L PLMExtra_InstructionTimers,X

  .return:
    RTS
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $D753: Pre-instruction - wake PLM if room argument door is set ;;;
PreInstruction_PLM_WakePLMIfRoomArgDoorIsSet:
;; Parameter:
;;     X: PLM index
    TXY
    LDA.W PLM_RoomArgs,X
    JSL BitIndexToByteIndexAndBitmask
    LDA.L SRAMMirror_Doors,X : AND.W Bitmask : BEQ .return
    TYX
    LDA.W #.return : STA.W PLM_PreInstructions,X
    LDA.L PLMExtra_LinkInstructions,X : STA.W PLM_InstListPointers,X
    LDA.W #$0001 : STA.L PLMExtra_InstructionTimers,X

  .return:
    RTS


;;; $D77A: Instruction - shoot eye door projectile with enemy projectile argument [[Y]] ;;;
Instruction_PLM_ShootEyeDoorProjectileWithEnemyProjArgY:
;; Parameters:
;;     Y: Pointer to instruction arguments
;; Returns:
;;     Y: Pointer to next instruction
    LDA.W $0000,Y
    PHY
    LDY.W #EnemyProjectile_EyeDoorProjectile
    JSL SpawnEnemyProjectileY_ParameterA_RoomGraphics
    LDA.W #$004C
    JSL QueueSound_Lib2_Max6
    PLY
    INY #2
    RTS


;;; $D790: Instruction - spawn eye door sweat enemy projectile with argument [[Y]] ;;;
Instruction_PLM_SpawnEyeDoorSweatEnemyProjectileWithArgY:
;; Parameters:
;;     Y: Pointer to instruction arguments
;; Returns:
;;     Y: Pointer to next instruction
    LDA.W $0000,Y
    PHY
    LDY.W #EnemyProjectile_EyeDoorSweat
    JSL SpawnEnemyProjectileY_ParameterA_RoomGraphics
    PLY
    INY #2
    RTS


Instruction_PLM_Spawn2EyeDoorSmokeEnemyProjectiles:
;;; $D79F: Instruction - spawn two eye door smoke enemy projectiles ;;;
    PHY
    LDA.W #$030A
    LDY.W #EnemyProjectile_MiscDustPLM
    JSL SpawnEnemyProjectileY_ParameterA_RoomGraphics
    LDA.W #$030A
    LDY.W #EnemyProjectile_MiscDustPLM
    JSL SpawnEnemyProjectileY_ParameterA_RoomGraphics
    PLY
    RTS


;;; $D7B6: Instruction - spawn eye door sweat drop projectile ;;;
Instruction_PLM_SpawnEyeDoorSweatDropProjectile:
; This enemy projectile is pretty pointless,
; it's a tiny graphic that lasts 14h frames that will almost certainly be hidden by the missile explosion or other smoke enemy projectiles
; It uses the non-random positioning argument (always spawns to the same place, the center of the door),
; so there's no reason to call this instruction multiple times in a row
; It's also just strange to draw a sweat drop in the center of the door as part of the fatal hit
    PHY
    LDA.W #$000B
    LDY.W #EnemyProjectile_MiscDustPLM
    JSL SpawnEnemyProjectileY_ParameterA_RoomGraphics
    PLY
    RTS


;;; $D7C3: Instruction - move PLM up one row and make a blue door facing right ;;;
Instruction_PLM_MovePLMUp1Row_MakeABlueDoorFacingRight:
;; Parameters:
;;     X: PLM index
    PHX
    LDA.W PLM_BlockIndices,X : SEC : SBC.W RoomWidthBlocks : SBC.W RoomWidthBlocks : STA.W PLM_BlockIndices,X
    TAX
    LDA.W #$C041 ; block type + BTS
    JSR Write_Level_Data_Block_Type_and_BTS
    BRA Create3BlockVerticalExtension


;;; $D7DA: Instruction - move PLM up one row and make a blue door facing left ;;;
Instruction_PLM_MovePLMUp1Row_MakeABlueDoorFacingLeft:
;; Parameters:
;;     X: PLM index
    PHX
    LDA.W PLM_BlockIndices,X : SEC : SBC.W RoomWidthBlocks : SBC.W RoomWidthBlocks : STA.W PLM_BlockIndices,X
    TAX
    LDA.W #$C040 ; block type + BTS
    JSR Write_Level_Data_Block_Type_and_BTS
; fallthrough to Create3BlockVerticalExtension


;;; $D7EF: Create 3 block vertical extension ;;;
Create3BlockVerticalExtension:
;; Parameters:
;;     X: PLM index

; Expects a pushed X
; Used to make the rest of the blue door the eye door spawns
    TXA : CLC : ADC.W RoomWidthBlocks : ADC.W RoomWidthBlocks : TAX
    LDA.W #$D0FF ; block type + BTS
    JSR Write_Level_Data_Block_Type_and_BTS
    TXA : CLC : ADC.W RoomWidthBlocks : ADC.W RoomWidthBlocks : TAX
    LDA.W #$D0FE ; block type + BTS
    JSR Write_Level_Data_Block_Type_and_BTS
    TXA : CLC : ADC.W RoomWidthBlocks : ADC.W RoomWidthBlocks : TAX
    LDA.W #$D0FD ; block type + BTS
    JSR Write_Level_Data_Block_Type_and_BTS
    PLX
    RTS


;;; $D81E: Instruction list - PLM $DB56 (eye door eye, facing left) ;;;
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


;;; $D8E9: Instruction list - door $DB5A (eye door, facing left) ;;;
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


;;; $D91F: Instruction list - PLM $DB60 (eye door bottom, facing left) ;;;
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


;;; $D955: Instruction list - PLM $DB48 (eye door eye, facing right) ;;;
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


;;; $DA20: Instruction list - door $DB4C (eye door, facing right) ;;;
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


;;; $DA56: Instruction list - PLM $DB52 (eye door bottom, facing right) ;;;
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


;;; $DA8C: Setup - PLM $DB48/$DB56 (eye door eye) ;;;
Setup_EyeDoorEye:
;; Parameters:
;;     Y: PLM index
    PHY
    LDA.W PLM_RoomArgs,Y
    JSL BitIndexToByteIndexAndBitmask
    LDA.L SRAMMirror_Doors,X
    PLY
    AND.W Bitmask : BNE .return
    LDX.W PLM_BlockIndices,Y
    LDA.W #$C044 ; block type + BTS
    JSR Write_Level_Data_Block_Type_and_BTS
    LDA.W PLM_BlockIndices,Y : CLC : ADC.W RoomWidthBlocks : ADC.W RoomWidthBlocks : TAX
    LDA.W #$D0FF ; block type + BTS
    JSR Write_Level_Data_Block_Type_and_BTS

  .return:
    RTS


;;; $DAB9: Setup - door $DB4C/$DB5A / PLM $DB52/$DB60 (eye door) ;;;
Setup_EyeDoor:
;; Parameters:
;;     Y: PLM index
    PHY
    LDA.W PLM_RoomArgs,Y
    JSL BitIndexToByteIndexAndBitmask
    LDA.L SRAMMirror_Doors,X
    PLY
    AND.W Bitmask : BNE .return
    LDX.W PLM_BlockIndices,Y
    LDA.W #$A000 ; block type + BTS
    JSR Write_Level_Data_Block_Type_and_BTS

  .return:
    RTS


;;; $DAD5: RTS. Pre-instruction - set Metroids cleared state when required - room argument = 0 ;;;
RTS_84DAD5:
    RTS


;;; $DAD6: RTS. Pre-instruction - set Metroids cleared state when required - room argument = 2 ;;;
RTS_84DAD6:
    RTS


;;; $DAD7: RTS. Pre-instruction - set Metroids cleared state when required - room argument = 4 ;;;
RTS_84DAD7:
    RTS


;;; $DAD8: RTS. Pre-instruction - set Metroids cleared state when required - room argument = 6 ;;;
RTS_84DAD8:
    RTS


;;; $DAD9: RTS. Pre-instruction - set Metroids cleared state when required - room argument = 8 ;;;
RTS_84DAD9:
    RTS


;;; $DADA: RTS. Pre-instruction - set Metroids cleared state when required - room argument = Ah ;;;
RTS_84DADA:
    RTS


;;; $DADB: RTS. Pre-instruction - set Metroids cleared state when required - room argument = Ch ;;;
RTS_84DADB:
    RTS


;;; $DADC: RTS. Pre-instruction - set Metroids cleared state when required - room argument = Eh ;;;
RTS_84DADC:
    RTS


;;; $DADD: RTS. Pre-instruction - set Metroids cleared state when required - room argument = 10h ;;;
RTS_84DADD:
    RTS


;;; $DADE: Pre-instruction - set Metroids cleared state when required - room argument = 12h ;;;
PreInst_PLM_SetMetroidsClearedStateWhenRequired_RoomArg12:
    LDA.W NumberOfEnemiesKilled : CMP.W NumberOfEnemiesRequiredToKill : BCC .return
    LDA.W #$0010
    JSL MarkEvent_inA

  .return:
    RTS


;;; $DAEE: Pre-instruction - set Metroids cleared state when required - room argument = 14h ;;;
PreInst_PLM_SetMetroidsClearedStateWhenRequired_RoomArg14:
    LDA.W NumberOfEnemiesKilled : CMP.W NumberOfEnemiesRequiredToKill : BCC .return
    LDA.W #$0011
    JSL MarkEvent_inA

  .return:
    RTS


;;; $DAFE: Pre-instruction - set Metroids cleared state when required - room argument = 16h ;;;
PreInst_PLM_SetMetroidsClearedStateWhenRequired_RoomArg16:
    LDA.W NumberOfEnemiesKilled : CMP.W NumberOfEnemiesRequiredToKill : BCC .return
    LDA.W #$0012
    JSL MarkEvent_inA

  .return:
    RTS


;;; $DB0E: Pre-instruction - set Metroids cleared state when required - room argument = 18h ;;;
PreInst_PLM_SetMetroidsClearedStateWhenRequired_RoomArg18:
    LDA.W NumberOfEnemiesKilled : CMP.W NumberOfEnemiesRequiredToKill : BCC .return
    LDA.W #$0013
    JSL MarkEvent_inA

  .return:
    RTS


;;; $DB1E: Setup - PLM $DB44 (sets Metroids cleared states when required) ;;;
PreInstruction_PLM_SetsMetroidsClearedStatesWhenRequired:
;; Parameters:
;;     Y: PLM index
    LDX.W PLM_RoomArgs,Y
    LDA.W .pointers,X : STA.W PLM_PreInstructions,Y
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


;;; $DB42: Instruction list - PLM $DB44 (sets Metroids cleared states when required) ;;;
InstList_PLM_SetsMetroidsClearedStatesWhenRequired:
    dw Instruction_PLM_Sleep


PLMEntries_SetsMetroidsClearedStatesWhenRequired:
; Sets Metroids cleared states when required
    dw PreInstruction_PLM_SetsMetroidsClearedStatesWhenRequired
    dw InstList_PLM_SetsMetroidsClearedStatesWhenRequired

PLMEntries_EyeDoorEyeFacingRight:
; Eye door eye, facing right
    dw Setup_EyeDoorEye
    dw InstList_PLM_EyeDoorEyeFacingRight_0

PLMEntries_EyeDoorFacingRight:
; Door. Eye door, facing right
    dw Setup_EyeDoor
    dw InstList_PLM_EyeDoorFacingRight_0
    dw InstList_PLM_Delete

PLMEntries_EyeDoorBottomFacingRight:
; Eye door bottom, facing right
    dw Setup_EyeDoor
    dw InstList_PLM_EyeDoorBottomFacingRight_0

PLMEntries_EyeDoorEyeFacingLeft:
; Eye door eye, facing left
    dw Setup_EyeDoorEye
    dw InstList_PLM_EyeDoorEyeFacingLeft_0

PLMEntries_EyeDoorFacingLeft:
; Door. Eye door, facing left
    dw Setup_EyeDoor
    dw InstList_PLM_EyeDoorFacingLeft_0
    dw InstList_PLM_Delete

PLMEntries_EyeDoorBottomFacingLeft:
; Eye door bottom, facing left
    dw Setup_EyeDoor
    dw InstList_PLM_EyeDoorBottomFacingLeft_0


;;; $DB64: Pre-instruction - go to link instruction if shot with a (super) missile ;;;
PreInst_PLM_GotoLinkInstructionIfShotWithAMissile_Draygon:
;; Parameter:
;;     X: PLM index

; Used by Draygon cannon with shield
    LDA.W PLM_Timers,X : AND.W #$0F00 : CMP.W #$0200 : BEQ .super
    CMP.W #$0100 : BNE .return

  .missile:
    STZ.W PLM_Timers,X
    LDA.L PLMExtra_LinkInstructions,X : STA.W PLM_InstListPointers,X
    LDA.W #$0001 : STA.L PLMExtra_InstructionTimers,X

  .return:
    RTS

  .super:
    LDA.W #$0077 : STA.W PLM_RoomArgs,X
    BRA .missile


;;; $DB8E: Instruction - damage Draygon turret ;;;
Instruction_PLM_DamageDraygonTurret:
;; Parameters:
;;     X: PLM index
    PHX
    LDA.W PLM_Vars,X : TAX
    LDA.W #$0001 : STA.L $7E0000,X
    PLX
    LDA.W PLM_BlockIndices,X : TAX
    LDA.W #$A003 ; block type + BTS
    JSR Write_Level_Data_Block_Type_and_BTS
    TXA : CLC : ADC.W RoomWidthBlocks : ADC.W RoomWidthBlocks : TAX
    LDA.W #$A003 ; block type + BTS
    JSR Write_Level_Data_Block_Type_and_BTS
    LDX.W PLM_Index
    RTS


;;; $DBB8: Instruction - damage Draygon turret facing down-right ;;;
Instruction_PLM_DamageDraygonTurretFacingDownRight:
;; Parameters:
;;     X: PLM index
    PHX
    LDA.W PLM_Vars,X : TAX
    LDA.W #$0001 : STA.L $7E0000,X ; ?
    PLX
    LDA.W PLM_BlockIndices,X : TAX
    LDA.W #$A003 ; block type + BTS
    JSR Write_Level_Data_Block_Type_and_BTS
    INX #2
    LDA.W #$A003 ; block type + BTS
    JSR Write_Level_Data_Block_Type_and_BTS
    LDX.W PLM_Index
    LDA.W PLM_BlockIndices,X : CLC : ADC.W RoomWidthBlocks : ADC.W RoomWidthBlocks : TAX
    LDA.W #$A003 ; block type + BTS
    JSR Write_Level_Data_Block_Type_and_BTS
    INX #2
    LDA.W #$0000 ; block type + BTS
    JSR Write_Level_Data_Block_Type_and_BTS
    LDX.W PLM_Index
    RTS


;;; $DBF7: Instruction - damage Draygon turret facing up-right ;;;
Instruction_PLM_DamageDraygonTurretFacingUpRight:
;; Parameters:
;;     X: PLM index
    PHX
    LDA.W PLM_Vars,X : TAX
    LDA.W #$0001 : STA.L $7E0000,X ; ?
    PLX
    LDA.W PLM_BlockIndices,X : TAX
    LDA.W #$A003 ; block type + BTS
    JSR Write_Level_Data_Block_Type_and_BTS
    INX #2
    LDA.W #$0000
    JSR Write_Level_Data_Block_Type_and_BTS
    LDX.W PLM_Index
    LDA.W PLM_BlockIndices,X : CLC : ADC.W RoomWidthBlocks : ADC.W RoomWidthBlocks : TAX
    LDA.W #$A003 ; block type + BTS
    JSR Write_Level_Data_Block_Type_and_BTS
    INX #2
    LDA.W #$A003 ; block type + BTS
    JSR Write_Level_Data_Block_Type_and_BTS
    LDX.W PLM_Index
    RTS


;;; $DC36: Instruction - damage Draygon turret ;;;
Instruction_PLM_DamageDraygonTurret_duplicate:
;; Parameters:
;;     X: PLM index

; Clone of Instruction_PLM_DamageDraygonTurret
    PHX
    LDA.W PLM_Vars,X : TAX
    LDA.W #$0001 : STA.L $7E0000,X ; ?
    PLX
    LDA.W PLM_BlockIndices,X : TAX
    LDA.W #$A003 ; block type + BTS
    JSR Write_Level_Data_Block_Type_and_BTS
    TXA : CLC : ADC.W RoomWidthBlocks : ADC.W RoomWidthBlocks : TAX
    LDA.W #$A003 ; block type + BTS
    JSR Write_Level_Data_Block_Type_and_BTS
    LDX.W PLM_Index
    RTS


;;; $DC60: Instruction - damage Draygon turret facing down-left ;;;
Instruction_PLM_DamageDraygonTurretFacingDownLeft:
;; Parameters:
;;     X: PLM index
    PHX
    LDA.W PLM_Vars,X : TAX
    LDA.W #$0001 : STA.L $7E0000,X ; ?
    PLX
    LDA.W PLM_BlockIndices,X : TAX
    LDA.W #$A003 ; block type + BTS
    JSR Write_Level_Data_Block_Type_and_BTS
    DEX #2
    LDA.W #$A003 ; block type + BTS
    JSR Write_Level_Data_Block_Type_and_BTS
    LDX.W PLM_Index
    LDA.W PLM_BlockIndices,X : CLC : ADC.W RoomWidthBlocks : ADC.W RoomWidthBlocks : TAX
    LDA.W #$A003 ; block type + BTS
    JSR Write_Level_Data_Block_Type_and_BTS
    DEX #2
    LDA.W #$0000 ; block type + BTS
    JSR Write_Level_Data_Block_Type_and_BTS
    LDX.W PLM_Index
    RTS


;;; $DC9F: Instruction - damage Draygon turret facing up-left ;;;
Instruction_PLM_DamageDraygonTurretFacingUpLeft:
;; Parameters:
;;     X: PLM index
    PHX
    LDA.W PLM_Vars,X : TAX
    LDA.W #$0001 : STA.L $7E0000,X ; ?
    PLX
    LDA.W PLM_BlockIndices,X : TAX
    LDA.W #$A003 ; block type + BTS
    JSR Write_Level_Data_Block_Type_and_BTS
    DEX #2
    LDA.W #$0000
    JSR Write_Level_Data_Block_Type_and_BTS
    LDX.W PLM_Index
    LDA.W PLM_BlockIndices,X : CLC : ADC.W RoomWidthBlocks : ADC.W RoomWidthBlocks : TAX
    LDA.W #$A003 ; block type + BTS
    JSR Write_Level_Data_Block_Type_and_BTS
    DEX #2
    LDA.W #$A003 ; block type + BTS
    JSR Write_Level_Data_Block_Type_and_BTS
    LDX.W PLM_Index
    RTS


;;; $DCDE: Instruction list - PLM $DF59 (Draygon cannon, with shield, facing right) ;;;
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


;;; $DD11: Instruction list - PLM $DF65 (Draygon cannon, facing right) ;;;
InstList_PLM_DraygonCannonFacingRight_0:
    dw Instruction_PLM_DamageDraygonTurret

InstList_PLM_DraygonCannonFacingRight_1:
    dw $0006,DrawInst_DraygonCannonRight_0
    dw $0006,DrawInst_DraygonCannonRight_1
    dw $0006,DrawInst_DraygonCannonRight_2
    dw $0006,DrawInst_DraygonCannonRight_3
    dw Instruction_PLM_GotoY
    dw InstList_PLM_DraygonCannonFacingRight_1


;;; $DD27: Instruction list - PLM $DF5D (unused. Draygon cannon, with shield, facing down-right) ;;;
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


;;; $DD5A: Instruction list - PLM $DF69 (unused. Draygon cannon, facing down-right) ;;;
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


;;; $DD70: Instruction list - PLM $DF61 (unused. Draygon cannon, with shield, facing up-right) ;;;
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


;;; $DDA3: Instruction list - PLM $DF6D (unused. Draygon cannon, facing up-right) ;;;
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


;;; $DDB9: Instruction list - PLM $DF71 (Draygon cannon, with shield, facing left) ;;;
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


;;; $DDEC: Instruction list - PLM $DF7D (Draygon cannon, facing left) ;;;
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
;;; $DE02: Instruction list - PLM $DF75 (unused. Draygon cannon, with shield, facing down-left) ;;;
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


;;; $DE35: Instruction list - PLM $DF81 (unused. Draygon cannon, facing down-left) ;;;
UNUSED_InstList_PLM_DraygonCannonFacingDownLeft_84DE35:
    dw Instruction_PLM_DamageDraygonTurretFacingDownLeft

UNUSED_InstList_PLM_DraygonCannonFacingDownLeft_84DE37:
    dw $0006,UNUSED_DrawInst_DraygonCannonDownLeft_0_84A1B5
    dw $0006,UNUSED_DrawInst_DraygonCannonDownLeft_1_84A1C9
    dw $0006,UNUSED_DrawInst_DraygonCannonDownLeft_2_84A1DD
    dw $0006,UNUSED_DrawInst_DraygonCannonDownLeft_3_84A1F1
    dw Instruction_PLM_GotoY
    dw UNUSED_InstList_PLM_DraygonCannonFacingDownLeft_84DE37


;;; $DE4B: Instruction list - PLM $DF79 (unused. Draygon cannon, with shield, facing up-left) ;;;
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


;;; $DE7E: Instruction list - PLM $DF85 (unused. Draygon cannon, facing up-left) ;;;
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


;;; $DE94: Setup - PLM $DF59 (Draygon cannon, with shield, facing right) ;;;
Setup_DraygonCannonWithShieldFacingRight:
;; Parameters:
;;     Y: PLM index
    LDA.W PLM_RoomArgs,Y : STA.W PLM_Vars,Y
    LDA.W #$0000 : STA.W PLM_RoomArgs,Y
    LDX.W PLM_BlockIndices,Y
    LDA.W #$C044 ; block type + BTS
    JSR Write_Level_Data_Block_Type_and_BTS
    TXA : CLC : ADC.W RoomWidthBlocks : ADC.W RoomWidthBlocks : TAX
    LDA.W #$D0FF ; block type + BTS
    JSR Write_Level_Data_Block_Type_and_BTS
    RTS


if !FEATURE_KEEP_UNREFERENCED
;;; $DEB9: Setup - PLM $DF5D/$DF61 (unused. Draygon cannon, with shield, facing down-right / up-right) ;;;
UNUSED_Setup_DraygonCannonWithShieldFacingDownUpRight_84DEB9:
;; Parameters:
;;     Y: PLM index
    LDA.W PLM_RoomArgs,Y : STA.W PLM_Vars,Y
    LDA.W #$0000 : STA.W PLM_RoomArgs,Y
    LDX.W PLM_BlockIndices,Y
    LDA.W #$C044 ; block type + BTS
    JSR Write_Level_Data_Block_Type_and_BTS
    INX #2
    LDA.W #$50FF ; block type + BTS
    JSR Write_Level_Data_Block_Type_and_BTS
    LDA.W PLM_BlockIndices,Y : CLC : ADC.W RoomWidthBlocks : ADC.W RoomWidthBlocks : TAX
    LDA.W #$D0FF ; block type + BTS
    JSR Write_Level_Data_Block_Type_and_BTS
    INX #2
    LDA.W #$D0FF ; block type + BTS
    JSR Write_Level_Data_Block_Type_and_BTS
    RTS
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $DEF0: Setup - PLM $DF71 (Draygon cannon, with shield, facing left) ;;;
Setup_DraygonCannonWithShieldFacingLeft:
;; Parameters:
;;     Y: PLM index

; Clone of Setup_DraygonCannonWithShieldFacingRight
    LDA.W PLM_RoomArgs,Y : STA.W PLM_Vars,Y
    LDA.W #$0000 : STA.W PLM_RoomArgs,Y
    LDX.W PLM_BlockIndices,Y
    LDA.W #$C044 ; block type + BTS
    JSR Write_Level_Data_Block_Type_and_BTS
    TXA : CLC : ADC.W RoomWidthBlocks : ADC.W RoomWidthBlocks : TAX
    LDA.W #$D0FF ; block type + BTS
    JSR Write_Level_Data_Block_Type_and_BTS
    RTS


if !FEATURE_KEEP_UNREFERENCED
;;; $DF15: Setup - PLM $DF75/$DF79 (unused. Draygon cannon, with shield, facing down-left / up-left) ;;;
UNUSED_Setup_DraygonCannonWithShieldFacingDownUpLeft_84DF15:
;; Parameters:
;;     Y: PLM index
    LDA.W PLM_RoomArgs,Y : STA.W PLM_Vars,Y
    LDA.W #$0000 : STA.W PLM_RoomArgs,Y
    LDX.W PLM_BlockIndices,Y
    LDA.W #$C044 ; block type + BTS
    JSR Write_Level_Data_Block_Type_and_BTS
    DEX #2
    LDA.W #$5001 ; block type + BTS
    JSR Write_Level_Data_Block_Type_and_BTS
    LDA.W PLM_BlockIndices,Y : CLC : ADC.W RoomWidthBlocks : ADC.W RoomWidthBlocks : TAX
    LDA.W #$D0FF ; block type + BTS
    JSR Write_Level_Data_Block_Type_and_BTS
    DEX #2
    LDA.W #$D0FF ; block type + BTS
    JSR Write_Level_Data_Block_Type_and_BTS
    RTS
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $DF4C: Setup - PLM $DF65/$DF69/$DF6D/$DF7D/$DF81/$DF85 (Draygon cannon) ;;;
Setup_DraygonCannon:
;; Parameters:
;;     Y: PLM index
    LDA.W PLM_RoomArgs,Y : STA.W PLM_Vars,Y
    LDA.W #$0003 : STA.W PLM_RoomArgs,Y
    RTS


PLMEntries_DraygonCannonWithShieldFacingRight:
; Draygon cannon, with shield, facing right
    dw Setup_DraygonCannonWithShieldFacingRight
    dw InstList_PLM_DraygonCannonWithShieldFacingRight_0

if !FEATURE_KEEP_UNREFERENCED
UNUSED_PLMEntries_DraygonCannonShieldFacingDownRight_84DF5D:
; Unused. Draygon cannon, with shield, facing down-right
    dw UNUSED_Setup_DraygonCannonWithShieldFacingDownUpRight_84DEB9
    dw InstList_PLM_DraygonCannonWithShieldFacingDownRight_0

UNUSED_PLMEntries_DraygonCannonShieldFacingUpRight_84DF61:
; Unused. Draygon cannon, with shield, facing up-right
    dw UNUSED_Setup_DraygonCannonWithShieldFacingDownUpRight_84DEB9
    dw UNUSED_InstList_DraygonCannonWithShieldFacingUpRight_84DD70
endif ; !FEATURE_KEEP_UNREFERENCED

PLMEntries_DraygonCannonFacingRight:
; Draygon cannon, facing right
    dw Setup_DraygonCannon
    dw InstList_PLM_DraygonCannonFacingRight_0

if !FEATURE_KEEP_UNREFERENCED
UNUSED_PLMEntries_DraygonCannonFacingDownRight_84DF69:
; Unused. Draygon cannon, facing down-right
    dw Setup_DraygonCannon
    dw UNUSED_InstList_PLM_DraygonCannonFacingDownRight_0

UNUSED_PLMEntries_DraygonCannonFacingUpRight_84DF6D:
; Unused. Draygon cannon, facing up-right
    dw Setup_DraygonCannon
    dw UNUSED_InstList_PLM_DraygonCannonFacingUpRight_84DDA3
endif ; !FEATURE_KEEP_UNREFERENCED

PLMEntries_DraygonCannonWithShieldFacingLeft:
; Draygon cannon, with shield, facing left
    dw Setup_DraygonCannonWithShieldFacingLeft
    dw InstList_PLM_DraygonCannonWithShieldFacingLeft_0

if !FEATURE_KEEP_UNREFERENCED
UNUSED_PLMEntries_DraygonCannonShieldFacingDownLeft_84DF75:
; Unused. Draygon cannon, with shield, facing down-left
    dw UNUSED_Setup_DraygonCannonWithShieldFacingDownUpLeft_84DF15
    dw UNUSED_InstList_DraygonCannonWithShieldFacingDownLeft_84DE02

UNUSED_PLMEntries_DraygonCannonWithShieldFacingUpLeft_84DF79:
; Unused. Draygon cannon, with shield, facing up-left
    dw UNUSED_Setup_DraygonCannonWithShieldFacingDownUpLeft_84DF15
    dw UNUSED_InstList_DraygonCannonWithShieldFacingUpLeft_84DE4B
endif ; !FEATURE_KEEP_UNREFERENCED

PLMEntries_DraygonCannonFacingLeft:
; Draygon cannon, facing left
    dw Setup_DraygonCannon
    dw InstList_PLM_DraygonCannonFacingLeft_0

if !FEATURE_KEEP_UNREFERENCED
UNUSED_PLMEntries_DraygonCannonFacingDownLeft_84DF81:
; Unused. Draygon cannon, facing down-left
    dw Setup_DraygonCannon
    dw UNUSED_InstList_PLM_DraygonCannonFacingDownLeft_84DE35

UNUSED_PLMEntries_DraygonCannonFacingUpLeft_84DF85:
; Unused. Draygon cannon, facing up-left
    dw Setup_DraygonCannon
    dw UNUSED_InstList_PLM_DraygonCannonFacingUpLeft_84DE7E
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $DF89: Pre-instruction - go to link instruction if triggered ;;;
PreInstruction_PLM_GotoLinkInstructionIfTriggered:
;; Parameter:
;;     X: PLM index
    LDA.W PLM_Timers,X : AND.W #$00FF : CMP.W #$00FF : BNE .return
    LDA.W #.return : STA.W PLM_PreInstructions,X
    LDA.L PLMExtra_LinkInstructions,X : STA.W PLM_InstListPointers,X
    LDA.W #$0001 : STA.L PLMExtra_InstructionTimers,X

  .return:
    RTS


;;; $DFA9: Instruction list - empty item ;;;
InstList_PLM_EmptyItem:
    dw $0001,DrawInst_ItemChozoOrb
    dw Instruction_PLM_Delete


;;; $DFAF: Instruction list - item orb ;;;
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


;;; $DFC7: Instruction list - callable - item orb burst ;;;
InstList_PLM_Callable_ItemOrbBurst:
    dw Instruction_PLM_ClearPreInstruction
    dw $0003,DrawInst_ItemChozoOrb
    dw $0003,DrawInst_ItemOrbBurst
    dw $0003,DrawInst_ItemChozoOrb
    dw Instruction_PLM_Return


;;; $DFD7: Unused. Instruction list - callable - empty item orb ;;;
InstList_PLM_Callable_EmptyItemOrb_0:
; Coded like an incomplete reconcealing orb
    dw Instruction_PLM_ClearPreInstruction
    dw Instruction_PLM_TimerEqualsY_8Bit : db $16

InstList_PLM_Callable_EmptyItemOrb_1:
    dw $0008,DrawInst_ItemChozoOrb
    dw Instruction_PLM_DecrementTimer_GotoYIfNonZero
    dw InstList_PLM_Callable_EmptyItemOrb_1
    dw Instruction_PLM_Return


;;; $DFE6: Pre-instruction - wake PLM if triggered ;;;
PreInstruction_PLM_WakePLMIfTriggered_WithDeadCodePBCheck:
;; Parameter:
;;     X: PLM index
    LDA.W PLM_Timers,X : CMP.W #$0300 : BEQ .return
    AND.W #$00FF : CMP.W #$00FF : BNE .return
    STZ.W PLM_Timers,X
    INC.W PLM_InstListPointers,X : INC.W PLM_InstListPointers,X
    LDA.W #$0001 : STA.L PLMExtra_InstructionTimers,X

  .return:
    RTS


;;; $E007: Instruction list - callable - item shot block ;;;
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


;;; $E020: Instruction list - callable - item shot block reconcealing ;;;
InstList_PLM_Callable_ItemShotBlockReconcealing:
    dw Instruction_PLM_ClearPreInstruction
    dw $0004,DrawInst_ItemShotBlock_2
    dw $0004,DrawInst_ItemShotBlock_1
    dw $0004,DrawInst_ItemShotBlock_0
    dw Instruction_PLM_DrawPLMBlock_Clone
    dw Instruction_PLM_Return


;;; $E032: Instruction list - callable - empty item shot block reconcealing ;;;
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


;;; $E04F: Instruction - draw item frame 0 ;;;
Instruction_PLM_DrawItemFrame0:
;; Parameters:
;;     X: PLM index
;;     Y: Pointer to after this instruction
    PHY
    LDA.L PLMExtra_Vars,X : TAY
    LDA.W .drawInsts,Y : STA.L PLMExtra_DrawInstructionPointers,X
    PLY
    BRA DrawPLM_Wait4Frames

  .drawInsts:
    dw DrawInst_DrawItemFrame0_0
    dw DrawInst_DrawItemFrame0_1
    dw DrawInst_DrawItemFrame0_2
    dw DrawInst_DrawItemFrame0_3


;;; $E067: Instruction - draw item frame 1 ;;;
Instruction_PLM_DrawItemFrame1:
;; Parameters:
;;     X: PLM index
;;     Y: Pointer to after this instruction
    PHY
    LDA.L PLMExtra_Vars,X : TAY
    LDA.W .drawInsts,Y : STA.L PLMExtra_DrawInstructionPointers,X
    PLY
    BRA DrawPLM_Wait4Frames

  .drawInsts:
    dw DrawInst_DrawItemFrame1_0
    dw DrawInst_DrawItemFrame1_1
    dw DrawInst_DrawItemFrame1_2
    dw DrawInst_DrawItemFrame1_3


;;; $E07F: Draw PLM and wait 4 frames ;;;
DrawPLM_Wait4Frames:
;; Parameters:
;;     X: PLM index
;;     Y: Pointer to next instruction
    LDA.W #$0004 : STA.L PLMExtra_InstructionTimers,X
    TYA : STA.W PLM_InstListPointers,X
    JSR Process_PLM_Draw_Instruction
    LDX.W PLM_Index
    JSL Calculate_PLM_Block_Coordinates
    JSR DrawPLM_HardCoded
    PLA
    RTS


;;; $E099: Instruction list - PLM $EED7 (energy tank) ;;;
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


;;; $E0BE: Instruction list - PLM $EEDB (missile tank) ;;;
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


;;; $E0E3: Instruction list - PLM $EEDF (super missile tank) ;;;
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


;;; $E108: Instruction list - PLM $EEE3 (power bomb tank) ;;;
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


;;; $E12D: Instruction list - PLM $EEE7 (bombs) ;;;
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


;;; $E15B: Instruction list - PLM $EEEB (charge beam) ;;;
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


;;; $E189: Instruction list - PLM $EEEF (ice beam) ;;;
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


;;; $E1B7: Instruction list - PLM $EEF3 (hi-jump) ;;;
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


;;; $E1E5: Instruction list - PLM $EEF7 (speed booster) ;;;
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


;;; $E213: Instruction list - PLM $EEFB (wave beam) ;;;
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


;;; $E241: Instruction list - PLM $EEFF (spazer beam) ;;;
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


;;; $E26F: Instruction list - PLM $EF03 (spring ball) ;;;
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


;;; $E29D: Instruction - clear charge beam counter ;;;
Instruction_PLM_ClearChargeBeamCounter:
    STZ.W SamusProjectile_FlareCounter
    RTS


;;; $E2A1: Instruction list - PLM $EF07 (varia suit) ;;;
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


;;; $E2D6: Instruction list - PLM $EF0B (gravity suit) ;;;
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


;;; $E30B: Instruction list - PLM $EF0F (x-ray scope) ;;;
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


;;; $E338: Instruction list - PLM $EF13 (plasma beam) ;;;
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


;;; $E366: Instruction list - PLM $EF17 (grapple beam) ;;;
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


;;; $E393: Instruction list - PLM $EF1B (space jump) ;;;
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


;;; $E3C1: Instruction list - PLM $EF1F (screw attack) ;;;
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


;;; $E3EF: Instruction list - PLM $EF23 (morph ball) ;;;
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


;;; $E41D: Instruction list - PLM $EF27 (reserve tank) ;;;
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


;;; $E44A: Instruction list - PLM $EF2B (energy tank, chozo orb) ;;;
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


;;; $E47C: Instruction list - PLM $EF2F (missile tank, chozo orb) ;;;
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


;;; $E4AE: Instruction list - PLM $EF33 (super missile tank, chozo orb) ;;;
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


;;; $E4E0: Instruction list - PLM $EF37 (power bomb tank, chozo orb) ;;;
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


;;; $E512: Instruction list - PLM $EF3B (bombs, chozo orb) ;;;
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


;;; $E54D: Instruction list - PLM $EF3F (charge beam, chozo orb) ;;;
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


;;; $E588: Instruction list - PLM $EF43 (ice beam, chozo orb) ;;;
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


;;; $E5C3: Instruction list - PLM $EF47 (hi-jump, chozo orb) ;;;
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


;;; $E5FE: Instruction list - PLM $EF4B (speed booster, chozo orb) ;;;
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


;;; $E63B: Instruction - FX Y velocity = FFE0h ;;;
Instruction_PLM_FXYVelocity_FFE0:
    LDA.W #$FFE0 : STA.W FX_YSubVelocity
    RTS


;;; $E642: Instruction list - PLM $EF4F (wave beam, chozo orb) ;;;
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


;;; $E67D: Instruction list - PLM $EF53 (spazer beam, chozo orb) ;;;
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


;;; $E6B8: Instruction list - PLM $EF57 (spring ball, chozo orb) ;;;
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


;;; $E6F3: Instruction list - PLM $EF5B (varia suit, chozo orb) ;;;
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


;;; $E735: Instruction list - PLM $EF5F (gravity suit, chozo orb) ;;;
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


;;; $E777: Instruction list - PLM $EF63 (x-ray scope, chozo orb) ;;;
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


;;; $E7B1: Instruction list - PLM $EF67 (plasma beam, chozo orb) ;;;
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


;;; $E7EC: Instruction list - PLM $EF6B (grapple beam, chozo orb) ;;;
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


;;; $E826: Instruction list - PLM $EF6F (space jump, chozo orb) ;;;
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


;;; $E861: Instruction list - PLM $EF73 (screw attack, chozo orb) ;;;
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


;;; $E89C: Instruction list - PLM $EF77 (morph ball, chozo orb) ;;;
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


;;; $E8D7: Instruction list - PLM $EF7B (reserve tank, chozo orb) ;;;
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


;;; $E911: Instruction list - PLM $EF7F (energy tank, shot block) ;;;
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


;;; $E949: Instruction list - PLM $EF83 (missile tank, shot block) ;;;
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


;;; $E981: Instruction list - PLM $EF87 (super missile tank, shot block) ;;;
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


;;; $E9B9: Instruction list - PLM $EF8B (power bomb tank, shot block) ;;;
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


;;; $E9F1: Instruction list - PLM $EF8F (bombs, shot block) ;;;
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


;;; $EA32: Instruction list - PLM $EF93 (charge beam, shot block) ;;;
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


;;; $EA73: Instruction list - PLM $EF97 (ice beam, shot block) ;;;
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


;;; $EAB4: Instruction list - PLM $EF9B (hi-jump, shot block) ;;;
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


;;; $EAF5: Instruction list - PLM $EF9F (speed booster, shot block) ;;;
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


;;; $EB36: Instruction list - PLM $EFA3 (wave beam, shot block) ;;;
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


;;; $EB77: Instruction list - PLM $EFA7 (spazer beam, shot block) ;;;
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


;;; $EBB8: Instruction list - PLM $EFAB (spring ball, shot block) ;;;
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


;;; $EBF9: Instruction list - PLM $EFAF (varia suit, shot block) ;;;
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


;;; $EC41: Instruction list - PLM $EFB3 (gravity suit, shot block) ;;;
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


;;; $EC89: Instruction list - PLM $EFB7 (x-ray scope, shot block) ;;;
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


;;; $ECC9: Instruction list - PLM $EFBB (plasma beam, shot block) ;;;
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


;;; $ED0A: Instruction list - PLM $EFBF (grapple beam, shot block) ;;;
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


;;; $ED4A: Instruction list - PLM $EFC3 (space jump, shot block) ;;;
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


;;; $ED8B: Instruction list - PLM $EFC7 (screw attack, shot block) ;;;
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


;;; $EDCC: Instruction list - PLM $EFCB (morph ball, shot block) ;;;
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


;;; $EE0D: Instruction list - PLM $EFCF (reserve tank, shot block) ;;;
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


;;; $EE4D: Setup - PLM $EED7/$EF2B (energy tank) ;;;
Setup_EnergyTank:
;; Parameters:
;;     Y: PLM index
    LDA.W #$0008
    BRA SetPLMItemGFXIndex_DoAbilitySetup


;;; $EE52: Setup - PLM $EEDB/$EF2F (missile tank) ;;;
Setup_MissileTank:
;; Parameters:
;;     Y: PLM index
    LDA.W #$000A
    BRA SetPLMItemGFXIndex_DoAbilitySetup


;;; $EE57: Setup - PLM $EEDF/$EF33 (super missile tank) ;;;
Setup_SuperMissileTank:
;; Parameters:
;;     Y: PLM index
    LDA.W #$000C
    BRA SetPLMItemGFXIndex_DoAbilitySetup


;;; $EE5C: Setup - PLM $EEE3/$EF37 (power bomb tank) ;;;
Setup_PowerBombTank:
;; Parameters:
;;     Y: PLM index
    LDA.W #$000E
; fallthrough to SetPLMItemGFXIndex_DoAbilitySetup


;;; $EE5F: Set PLM item GFX index and do ability setup ;;;
SetPLMItemGFXIndex_DoAbilitySetup:
;; Parameters:
;;     A: Item GFX index
;;     Y: PLM index
    TYX
    STA.L PLMExtra_Vars,X
; fallthrough to Setup_Ability


;;; $EE64: Setup - PLM $EEE7/$EEEB/$EEEF/$EF03/$EF07/$EF0B/$EF0F/$EF13/$EF17/$EF1B/$EF1F/$EF23/$EF27/$EF2B/$EF2F/$EF33/$EF37/$EF3B/$EF3F/$EF43/$EF47/$EF4B/$EF4F/$EF53/$EF57/$EF5B/$EF5F/$EF63/$EF67/$EF6B/$EF6F/$EF73/$EF77/$EF7B (ability) ;;;
Setup_Ability:
;; Parameters:
;;     Y: PLM index
    LDX.W PLM_BlockIndices,Y
    LDA.W #$0045 ; block type + BTS
    JSR Write_Level_Data_Block_Type_and_BTS
    LDA.L SRAMMirror_GlobalNumberOfItemsLoadedCounter : INC : STA.L SRAMMirror_GlobalNumberOfItemsLoadedCounter
    RTS


;;; $EE77: Setup - PLM $EF7F (energy tank shot block) ;;;
Setup_EnergyTankShotBlock:
;; Parameters:
;;     Y: PLM index
    LDA.W #$0008
    BRA SetPLMItemGFXINdex_DoAbilityShotBlockSetup


;;; $EE7C: Setup - PLM $EF83 (missile tank shot block) ;;;
SetupMissileTankShotBlock:
;; Parameters:
;;     Y: PLM index
    LDA.W #$000A
    BRA SetPLMItemGFXINdex_DoAbilityShotBlockSetup


;;; $EE81: Setup - PLM $EF87 (super missile tank shot block) ;;;
Setup_SuperMissileTankShotBlock:
;; Parameters:
;;     Y: PLM index
    LDA.W #$000C
    BRA SetPLMItemGFXINdex_DoAbilityShotBlockSetup


;;; $EE86: Setup - PLM $EF8B (power bomb tank shot block) ;;;
Setup_PowerBombTankShotBlock:
;; Parameters:
;;     Y: PLM index
    LDA.W #$000E
; fallthrough to SetPLMItemGFXINdex_DoAbilityShotBlockSetup


;;; $EE89: Set PLM item GFX index and do ability shot block setup ;;;
SetPLMItemGFXINdex_DoAbilityShotBlockSetup:
;; Parameters:
;;     A: Item GFX index
;;     Y: PLM index
    TYX
    STA.L PLMExtra_Vars,X
; fallthrough to Setup_AbilityShotBlock


;;; $EE8E: Setup - PLM $EF8F/$EF93/$EF97/$EF9B/$EF9F/$EFA3/$EFA7/$EFAB/$EFAF/$EFB3/$EFB7/$EFBB/$EFBF/$EFC3/$EFC7/$EFCB/$EFCF (ability shot block) ;;;
Setup_AbilityShotBlock:
;; Parameters:
;;     Y: PLM index
    LDX.W PLM_BlockIndices,Y
    LDA.W #$C045 ; block type + BTS
    JSR Write_Level_Data_Block_Type_and_BTS
    LDX.W PLM_BlockIndices,Y
    LDA.L LevelData,X : STA.W PLM_Vars,Y
    LDA.L SRAMMirror_GlobalNumberOfItemsLoadedCounter : INC : STA.L SRAMMirror_GlobalNumberOfItemsLoadedCounter
    RTS


;;; $EEAB: Setup - PLM $EED3 (shot/bombed/grappled reaction, shootable, BTS 45h / collision reaction, special, BTS 45h. Item collision detection) ;;;
Setup_ItemCollisionDetection:
;; Parameters:
;;     Y: PLM index
;; Returns:
;;     Carry: Clear (no collision) if time is not frozen, unchanged otherwise
    LDA.W TimeIsFrozenFlag : BNE .delete
    TYX
    LDA.W PLM_BlockIndices,X
    STZ.W PLM_BlockIndices,X
    LDX.W #$004E

  .loop:
    CMP.W PLM_BlockIndices,X : BEQ .found
    DEX #2 : BPL .loop
    db $00 ; BRK with no operand

  .found:
    LDA.W #$00FF : STA.W PLM_Timers,X
    CLC
    RTS

  .delete:
    LDA.W #$0000 : STA.W PLM_IDs,Y
    RTS


PLMEntries_ItemCollisionDetection:
; Shot/bombed/grappled reaction, shootable, BTS 45h / collision reaction, special, BTS 45h. Item collision detection
    dw Setup_ItemCollisionDetection
    dw InstList_PLM_Delete

PLMEntries_EnergyTank:
; Energy tank
    dw Setup_EnergyTank
    dw InstList_PLM_EnergyTank_0

PLMEntries_MissileTank:
; Missile tank
    dw Setup_MissileTank
    dw InstList_PLM_MissileTank_0

PLMEntries_SuperMissileTank:
; Super missile tank
    dw Setup_SuperMissileTank
    dw InstList_PLM_SuperMissileTank_0

PLMEntries_PowerBombTank:
; Power bomb tank
    dw Setup_PowerBombTank
    dw InstList_PLM_PowerBombTank_0

PLMEntries_Bombs:
; Bombs
    dw Setup_Ability
    dw InstList_PLM_Bombs_0

PLMEntries_ChargeBeam:
; Charge beam
    dw Setup_Ability
    dw InstList_PLM_ChargeBeam_0

PLMEntries_IceBeam:
; Ice beam
    dw Setup_Ability
    dw InstList_PLM_IceBeam_0

PLMEntries_HiJumpBoots:
; Hi-jump
    dw Setup_Ability
    dw InstList_PLM_HiJumpBoots_0

PLMEntries_SpeedBooster:
; Speed booster
    dw Setup_Ability
    dw InstList_PLM_SpeedBooster_0

PLMEntries_WaveBeam:
; Wave beam
    dw Setup_Ability
    dw InstList_PLM_WaveBeam_0

PLMEntries_Spazer:
; Spazer beam
    dw Setup_Ability
    dw InstList_PLM_Spazer_0

PLMEntries_SpringBall:
; Spring ball
    dw Setup_Ability
    dw InstList_PLM_SpringBall_0

PLMEntries_VariaSuit:
; Varia suit
    dw Setup_Ability
    dw InstList_PLM_VariaSuit_0

PLMEntries_GravitySuit:
; Gravity suit
    dw Setup_Ability
    dw InstList_PLM_GravitySuit_0

PLMEntries_XrayScope:
; X-ray scope
    dw Setup_Ability
    dw InstList_PLM_XrayScope_0

PLMEntries_PlasmaBeam:
; Plasma beam
    dw Setup_Ability
    dw InstList_PLM_PlasmaBeam_0

PLMEntries_GrappleBeam:
; Grapple beam
    dw Setup_Ability
    dw InstList_PLM_GrappleBeam_0

PLMEntries_SpaceJump:
; Space jump
    dw Setup_Ability
    dw InstList_PLM_SpaceJump_0

PLMEntries_ScrewAttack:
; Screw attack
    dw Setup_Ability
    dw InstList_PLM_ScrewAttack_0

PLMEntries_MorphBall:
; Morph ball
    dw Setup_Ability
    dw InstList_PLM_MorphBall_0

PLMEntries_ReserveTank:
; Reserve tank
    dw Setup_Ability
    dw InstList_PLM_ReserveTank_0

PLMEntries_EnergyTankChozoOrb:
; Energy tank, chozo orb
    dw Setup_EnergyTank
    dw InstList_PLM_EnergyTankChozoOrb_0

PLMEntries_MissileTankChozoOrb:
; Missile tank, chozo orb
    dw Setup_MissileTank
    dw InstList_PLM_MissileTankChozoOrb_0

PLMEntries_SuperMissileTankChozoOrb:
; Super missile tank, chozo orb
    dw Setup_SuperMissileTank
    dw InstList_PLM_SuperMissileTankChozoOrb_0

PLMEntries_PowerBombTankChozoOrb:
; Power bomb tank, chozo orb
    dw Setup_PowerBombTank
    dw InstList_PLM_PowerBombTankChozoOrb_0

PLMEntries_BombsChozoOrb:
; Bombs, chozo orb
    dw Setup_Ability
    dw InstList_PLM_BombsChozoOrb_0

PLMEntries_ChargeBeamChozoOrb:
; Charge beam, chozo orb
    dw Setup_Ability
    dw InstList_PLM_ChargeBeamChozoOrb_0

PLMEntries_IceBeamChozoOrb:
; Ice beam, chozo orb
    dw Setup_Ability
    dw InstList_PLM_IceBeamChozoOrb_0

PLMEntries_HiJumpBootsChozoOrb:
; Hi-jump, chozo orb
    dw Setup_Ability
    dw InstList_PLM_HiJumpBootsChozoOrb_0

PLMEntries_SpeedBoosterChozoOrb:
; Speed booster, chozo orb
    dw Setup_Ability
    dw InstList_PLM_SpeedBoosterChozoOrb_0

PLMEntries_WaveBeamChozoOrb:
; Wave beam, chozo orb
    dw Setup_Ability
    dw InstList_PLM_WaveBeamChozoOrb_0

PLMEntries_SpazerChozoOrb:
; Spazer beam, chozo orb
    dw Setup_Ability
    dw InstList_PLM_SpazerChozoOrb_0

PLMEntries_SpringBallChozoOrb:
; Spring ball, chozo orb
    dw Setup_Ability
    dw InstList_PLM_SpringBallChozoOrb_0

PLMEntries_VariaSuitChozoOrb:
; Varia suit, chozo orb
    dw Setup_Ability
    dw InstList_PLM_VariaSuitChozoOrb_0

PLMEntries_GravitySuitChozoOrb:
; Gravity suit, chozo orb
    dw Setup_Ability
    dw InstList_PLM_GravitySuitChozoOrb_0

PLMEntries_XrayScopeChozoOrb:
; X-ray scope, chozo orb
    dw Setup_Ability
    dw InstList_PLM_XrayScopeChozoOrb_0

PLMEntries_PlasmaBeamChozoOrb:
; Plasma beam, chozo orb
    dw Setup_Ability
    dw InstList_PLM_PlasmaBeamChozoOrb_0

PLMEntries_GrappleBeamChozoOrb:
; Grapple beam, chozo orb
    dw Setup_Ability
    dw InstList_PLM_GrappleBeamChozoOrb_0

PLMEntries_SpaceJumpChozoOrb:
; Space jump, chozo orb
    dw Setup_Ability
    dw InstList_PLM_SpaceJumpChozoOrb_0

PLMEntries_ScrewAttackChozoOrb:
; Screw attack, chozo orb
    dw Setup_Ability
    dw InstList_PLM_ScrewAttackChozoOrb_0

PLMEntries_MorphBallChozoOrb:
; Morph ball, chozo orb
    dw Setup_Ability
    dw InstList_PLM_MorphBallChozoOrb_0

PLMEntries_ReserveTankChozoOrb:
; Reserve tank, chozo orb
    dw Setup_Ability
    dw InstList_PLM_ReserveTankChozoOrb_0

PLMEntries_EnergyTankShotBlock:
; Energy tank, shot block
    dw Setup_EnergyTankShotBlock
    dw InstList_PLM_EnergyTankShotBlock_0

PLMEntries_MissileTankShotBlock:
; Missile tank, shot block
    dw SetupMissileTankShotBlock
    dw InstList_PLM_MissileTankShotBlock_0

PLMEntries_SuperMissileTankShotBlock:
; Super missile tank, shot block
    dw Setup_SuperMissileTankShotBlock
    dw InstList_PLM_SuperMissileTankShotBlock_0

PLMEntries_PowerBombTankShotBlock:
; Power bomb tank, shot block
    dw Setup_PowerBombTankShotBlock
    dw InstList_PLM_PowerBombTankShotBlock_0

PLMEntries_BombsShotBlock:
; Bombs, shot block
    dw Setup_AbilityShotBlock
    dw InstList_PLM_BombsShotBlock_0

PLMEntries_ChargeBeamShotBlock:
; Charge beam, shot block
    dw Setup_AbilityShotBlock
    dw InstList_PLM_ChargeBeamShotBlock_0

PLMEntries_IceBeamShotBlock:
; Ice beam, shot block
    dw Setup_AbilityShotBlock
    dw InstList_PLM_IceBeamShotBlock_0

PLMEntries_HiJumpBootsShotBlock:
; Hi-jump, shot block
    dw Setup_AbilityShotBlock
    dw InstList_PLM_HiJumpBootsShotBlock_0

PLMEntries_SpeedBoosterShotBlock:
; Speed booster, shot block
    dw Setup_AbilityShotBlock
    dw InstList_PLM_SpeedBoosterShotBlock_0

PLMEntries_WaveBeamShotBlock:
; Wave beam, shot block
    dw Setup_AbilityShotBlock
    dw InstList_PLM_WaveBeamShotBlock_0

PLMEntries_SpazerShotBlock:
; Spazer beam, shot block
    dw Setup_AbilityShotBlock
    dw InstList_PLM_SpazerShotBlock_0

PLMEntries_SpringBallShotBlock:
; Spring ball, shot block
    dw Setup_AbilityShotBlock
    dw InstList_PLM_SpringBallShotBlock_0

PLMEntries_VariaSuitShotBlock:
; Varia suit, shot block
    dw Setup_AbilityShotBlock
    dw InstList_PLM_VariaSuitShotBlock_0

PLMEntries_GravitySuitShotBlock:
; Gravity suit, shot block
    dw Setup_AbilityShotBlock
    dw InstList_PLM_GravitySuitShotBlock_0

PLMEntries_XrayScopeShotBlock:
; X-ray scope, shot block
    dw Setup_AbilityShotBlock
    dw InstList_PLM_XrayScopeShotBlock_0

PLMEntries_PlasmaBeamShotBlock:
; Plasma beam, shot block
    dw Setup_AbilityShotBlock
    dw InstList_PLM_PlasmaBeamShotBlock_0

PLMEntries_GrappleBeamShotBlock:
; Grapple beam, shot block
    dw Setup_AbilityShotBlock
    dw InstList_PLM_GrappleBeamShotBlock_0

PLMEntries_SpaceJumpShotBlock:
; Space jump, shot block
    dw Setup_AbilityShotBlock
    dw InstList_PLM_SpaceJumpShotBlock_0

PLMEntries_ScrewAttackShotBlock:
; Screw attack, shot block
    dw Setup_AbilityShotBlock
    dw InstList_PLM_ScrewAttackShotBlock_0

PLMEntries_MorphBallShotBlock:
; Morph ball, shot block
    dw Setup_AbilityShotBlock
    dw InstList_PLM_MorphBallShotBlock_0

PLMEntries_ReserveTankShotBlock:
; Reserve tank, shot block
    dw Setup_AbilityShotBlock
    dw InstList_PLM_ReserveTankShotBlock_0


Freespace_Bank84_EFD3:
; $102D bytes
