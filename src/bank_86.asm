
org $868000


Enable_Enemy_Projectiles:
    PHP 
    REP #$20 
    LDA.W #$8000 
    TSB.W $198D 
    PLP 
    RTL 


Disable_Enemy_Projectiles:
    PHP 
    REP #$20 
    LDA.W #$8000 
    TRB.W $198D 
    PLP 
    RTL 


Clear_Enemy_Projectiles:
    PHP 
    REP #$30 
    PHX 
    LDX.W #$0022 

.loop:
    STZ.W $1997,X 
    DEX #2
    BPL .loop 
    PLX : PLP 
    RTL 


SpawnEnemyProjectileY_ParameterA_XGraphics:
    PHP : PHB : PHX : PHY 
    STA.W $1993 
    PHK : PLB 
    LDA.W $0F96,X 
    ORA.W $0F98,X 
    PHA 
    TYX 
    LDY.W #$0022 

.loop:
    LDA.W $1997,Y : BEQ .found 
    DEY #2
    BPL .loop 
    PLA : PLY : PLX : PLB : PLP 
    SEC 
    RTL 


.found:
    PLA 
    STA.W $19BB,Y 
    TXA 
    STA.W $1997,Y 
    LDA.W $0002,X : STA.W $1A03,Y 
    LDA.W $0004,X : STA.W $1B47,Y 
    LDA.W $0006,X : STA.W $1BB3,Y 
    LDA.W $0008,X : STA.W $1BD7,Y 
    LDA.W #$0001 : STA.W $1B8F,Y 
    LDA.W #EnemyProjSpritemaps_Blank_Default : STA.W $1B6B,Y 
    LDA.W #$0000 : STA.W $1AFF,Y 
    STA.W $1B23,Y 
    STA.W $19DF,Y 
    STA.W $1A27,Y 
    STA.W $1A6F,Y 
    STA.W $1BFB,Y 
    PHY 
    JSR.W ($0000,X) 
    PLA : PLY : PLX : PLB : PLP 
    CLC 
    RTL 


SpawnEnemyProjectileY_ParameterA_RoomGraphics:
    PHP : PHB : PHX : PHY 
    STA.W $1993 
    PHK : PLB 
    TYX 
    LDY.W #$0022 

.loop:
    LDA.W $1997,Y : BEQ .found 
    DEY #2
    BPL .loop 
    PLY : PLX : PLB : PLP 
    SEC 
    RTL 


.found:
    LDA.W #$0000 : STA.W $19BB,Y 
    TXA 
    STA.W $1997,Y 
    LDA.W $0002,X : STA.W $1A03,Y 
    LDA.W $0004,X : STA.W $1B47,Y 
    LDA.W $0006,X : STA.W $1BB3,Y 
    LDA.W $0008,X : STA.W $1BD7,Y 
    LDA.W #$0001 : STA.W $1B8F,Y 
    LDA.W #EnemyProjSpritemaps_Blank_Default : STA.W $1B6B,Y 
    LDA.W #$0000 : STA.W $1AFF,Y 
    STA.W $1B23,Y 
    STA.W $19DF,Y 
    STA.W $19DF,Y 
    STA.W $1A27,Y 
    STA.W $1A6F,Y 
    STA.W $1BFB,Y 
    PHY 
    JSR.W ($0000,X) 
    PLA : PLY : PLX : PLB : PLP 
    CLC 
    RTL 


Enemy_Projectile_Handler:
    PHP : PHB : PHK : PLB 
    BIT.W $198D 
    BPL .return 
    LDX.W #$0022 

.loop:
    STX.W $1991 
    LDA.W $1997,X : BEQ .next 
    JSR.W Process_Enemy_Projectile 
    LDX.W $1991 

.next:
    DEX #2
    BPL .loop 

.return:
    PLB : PLP 
    RTL 


Process_Enemy_Projectile:
    JSR.W ($1A03,X) 
    LDX.W $1991 
    DEC.W $1B8F,X 
    BNE .return 
    LDY.W $1B47,X 

.loop:
    LDA.W $0000,Y : BPL .timer 
    STA.B $12 
    INY #2
    PEA.W .loop-1 
    JMP.W ($0012) 


.timer:
    STA.W $1B8F,X 
    LDA.W $0002,Y : STA.W $1B6B,X 
    TYA 
    CLC : ADC.W #$0004 : STA.W $1B47,X 

.return:
    RTS 


Instruction_EnemyProjectile_Delete:
    STZ.W $1997,X 
    PLA 
    RTS 


Instruction_EnemyProjectile_Sleep:
    DEY #2
    TYA 
    STA.W $1B47,X 
    PLA 
    RTS 


Instruction_EnemyProjectile_PreInstructionInY:
    LDA.W $0000,Y : STA.W $1A03,X 
    INY #2
    RTS 


Instruction_EnemyProjectile_ClearPreInstruction:
    LDA.W #RTS_868170 : STA.W $1A03,X 

RTS_868170:
    RTS 


Instruction_EnemyProjectile_CallExternalFunctionInY:
    LDA.W $0000,Y : STA.B $12 
    LDA.W $0001,Y : STA.B $13 
    PHY 
    JSL.L .externalFunction 
    PLY 
    LDX.W $1991 
    INY #3
    RTS 


.externalFunction:
    JML.W [$0012] 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_Inst_EnemyProjectile_CallExternalFuncWith2ByteParam:
    LDA.W $0000,Y : STA.B $12 
    LDA.W $0001,Y : STA.B $13 
    LDA.W $0003,Y 
    PHY 
    JSL.L .externalFunction 
    PLY 
    LDX.W $1991 
    TYA 
    CLC : ADC.W #$0005 : TAY 
    RTS 


.externalFunction:
    JML.W [$0012] 
endif ; !FEATURE_KEEP_UNREFERENCED


Instruction_EnemyProjectile_GotoY:
    LDA.W $0000,Y 
    TAY 
    RTS 


Instruction_EnemyProjectile_GotoY_Y:
    STY.B $12 
    DEY 
    LDA.W $0000,Y 
    XBA 
    BMI .highByte 
    AND.W #$00FF 
    BRA + 


.highByte:
    ORA.W #$FF00 

  + CLC : ADC.B $12 : TAY 
    RTS 


Instruction_EnemyProjectile_DecrementTimer_GotoYIfNonZero:
    DEC.W $19DF,X 
    BNE Instruction_EnemyProjectile_GotoY 
    INY #2
    RTS 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_Inst_EnemyProj_DecrementTimer_GotoY_YIfNonZero_8681CE:
    DEC.W $19DF,X 
    BNE Instruction_EnemyProjectile_GotoY_Y 
    INY 
    RTS 
endif ; !FEATURE_KEEP_UNREFERENCED


Instruction_EnemyProjectile_TimerInY:
    LDA.W $0000,Y : STA.W $19DF,X 
    INY #2
    RTS 


RTS_8681DE:
    RTS 


Instruction_MoveRandomlyWithinXRadius_YRadius:
    JSL.L GenerateRandomNumber 
    STA.B $12 

.loopX:
    JSL.L GenerateRandomNumber 
    SEP #$20 
    AND.W $0000,Y 
    SEC : SBC.W $0001,Y : REP #$20 
    BMI .loopX 
    AND.W #$00FF 
    BIT.B $12 
    BPL .Xpos 
    EOR.W #$FFFF 
    INC A 

.Xpos:
    CLC : ADC.W $1A4B,X : STA.W $1A4B,X 

.loopY:
    JSL.L GenerateRandomNumber 
    SEP #$20 
    AND.W $0002,Y 
    SEC : SBC.W $0003,Y : REP #$20 
    BMI .loopY 
    AND.W #$00FF 
    BIT.B $12 
    BVC .Ypos 
    EOR.W #$FFFF 
    INC A 

.Ypos:
    CLC : ADC.W $1A93,X : STA.W $1A93,X 
    INY #4
    RTS 


Instruction_EnemyProjectile_Properties_OrY:
    LDA.W $1BD7,X : ORA.W $0000,Y : STA.W $1BD7,X 
    INY #2
    RTS 


Instruction_EnemyProjectile_Properties_AndY:
    LDA.W $1BD7,X : AND.W $0000,Y : STA.W $1BD7,X 
    INY #2
    RTS 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_Inst_EnemyProj_EnableCollisionWithSamusProj_868248:
    LDA.W $1BD7,X : ORA.W #$8000 : STA.W $1BD7,X 
    RTS 
endif ; !FEATURE_KEEP_UNREFERENCED


Instruction_EnemyProjectile_DisableCollisionWIthSamusProj:
    LDA.W $1BD7,X : AND.W #$7FFF : STA.W $1BD7,X 
    RTS 


Instruction_EnemyProjectile_DisableCollisionWithSamus:
    LDA.W $1BD7,X : ORA.W #$2000 : STA.W $1BD7,X 
    RTS 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_Inst_EnemyProjectile_EnableCollisionWithSamus_868266:
    LDA.W $1BD7,X : AND.W #$DFFF : STA.W $1BD7,X 
    RTS 


UNUSED_Inst_EnemyProjectile_SetToNotDieOnContact_868270:
    LDA.W $1BD7,X : ORA.W #$4000 : STA.W $1BD7,X 
    RTS 


UNUSED_Instruction_EnemyProjectile_SetToDieOnContact_86827A:
    LDA.W $1BD7,X : AND.W #$BFFF : STA.W $1BD7,X 
    RTS 
endif ; !FEATURE_KEEP_UNREFERENCED


Instruction_EnemyProjectile_SetHighPriority:
    LDA.W $1BD7,X : ORA.W #$1000 : STA.W $1BD7,X 
    RTS 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_Instruction_EnemyProjectile_SetLowPriority_86828E:
    LDA.W $1BD7,X : AND.W #$EFFF : STA.W $1BD7,X 
    RTS 
endif ; !FEATURE_KEEP_UNREFERENCED


Instruction_EnemyProjectile_XYRadiusInY:
    LDA.W $0000,Y : STA.W $1BB3,X 
    INY #2
    RTS 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_Instruction_EnemyProjectile_XYRadius_0:
    STZ.W $1BB3,X 
    RTS 
endif ; !FEATURE_KEEP_UNREFERENCED


Instruction_EnemyProjectile_CalculateDirectionTowardsSamus:
    PHY 
    LDA.W $0AF6 : SEC : SBC.W $1A4B,X : STA.B $12 
    LDA.W $0AFA : SEC : SBC.W $1A93,X : STA.B $14 
    JSL.L CalculateAngleOf_12_14_Offset 
    ASL A 
    LDY.W $1991 
    STA.W $1AFF,Y 
    TAX 
    LDA.L SineCosineTables_8bitSine_SignExtended,X : STA.W $1AB7,Y 
    LDA.L SineCosineTables_NegativeCosine_SignExtended,X : STA.W $1ADB,Y 
    TYX 
    PLY 
    RTS 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_Inst_EnemyProj_WriteColorsFromYToColorIndex_8682D5:
    PHY : PHX 
    LDX.W $0002,Y 
    LDA.W $0004,Y : AND.W #$00FF : STA.B $12 
    LDA.W $0000,Y 
    TAY 

.loop:
    LDA.W $0000,Y : STA.L $7EC000,X 
    INY #2
    INX #2
    DEC.B $12 
    BPL .loop 
    PLX : PLA 
    CLC : ADC.W #$0005 : TAY 
    RTS 


UNUSED_Instruction_EnemyProjectile_QueueMusicTrackInY:
    LDA.W $0000,Y : AND.W #$00FF 
    JSL.L QueueMusicDataOrTrack_8FrameDelay 
    INY 
    RTS 


UNUSED_Inst_EnemyProjectile_QueueSoundInY_Lib1_Max6_868309:
    LDA.W $0000,Y : JSL.L QueueSound_Lib1_Max6 
    INY 
    RTS 
endif ; !FEATURE_KEEP_UNREFERENCED


Instruction_EnemyProjectile_QueueSoundInY_Lib2_Max6:
    LDA.W $0000,Y : JSL.L QueueSound_Lib2_Max6 
    INY 
    RTS 


Instruction_EnemyProjectile_QueueSoundInY_Lib3_Max6:
    LDA.W $0000,Y : JSL.L QueueSound_Lib3_Max6 
    INY 
    RTS 


Instruction_EnemyProjectile_QueueSoundInY_Lib1_Max15:
    LDA.W $0000,Y : JSL.L QueueSound 
    INY 
    RTS 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_Inst_EnemyProjectile_QueueSoundInY_Lib2_Max15_86832D:
    LDA.W $0000,Y : JSL.L QueueSound_Lib2_Max15 
    INY 
    RTS 


UNUSED_Inst_EnemyProjectile_QueueSoundInY_Lib3_Max15_868336:
    LDA.W $0000,Y : JSL.L QueueSound_Lib3_Max15 
    INY 
    RTS 


UNUSED_Inst_EnemyProjectile_QueueSoundInY_Lib1_Max3_86833F:
    LDA.W $0000,Y : JSL.L QueueSound_Lib1_Max3 
    INY 
    RTS 


UNUSED_Inst_EnemyProjectile_QueueSoundInY_Lib2_Max3_868348:
    LDA.W $0000,Y : JSL.L QueueSound_Lib2_Max3 
    INY 
    RTS 


UNUSED_Inst_EnemyProjectile_QueueSoundInY_Lib3_Max3_868351:
    LDA.W $0000,Y : JSL.L QueueSound_Lib3_Max3 
    INY 
    RTS 


UNUSED_Inst_EnemyProjectile_QueueSoundInY_Lib1_Max9_86835A:
    LDA.W $0000,Y : JSL.L QueueSound_Lib1_Max9 
    INY 
    RTS 


UNUSED_Inst_EnemyProjectile_QueueSoundInY_Lib2_Max9_868363:
    LDA.W $0000,Y : JSL.L QueueSound_Lib2_Max9 
    INY 
    RTS 


UNUSED_Inst_EnemyProjectile_QueueSoundInY_Lib1_Max9_86836C:
    LDA.W $0000,Y : JSL.L QueueSound_Lib3_Max9 
    INY 
    RTS 


UNUSED_Inst_EnemyProjectile_QueueSoundInY_Lib1_Max1_868375:
    LDA.W $0000,Y : JSL.L QueueSound_Lib1_Max1 
    INY 
    RTS 
endif ; !FEATURE_KEEP_UNREFERENCED


Instruction_EnemyProjectile_QueueSoundInY_Lib2_Max1:
    LDA.W $0000,Y : JSL.L QueueSound_Lib2_Max1 
    INY 
    RTS 


Instruction_EnemyProjectile_QueueSoundInY_Lib3_Max1:
    LDA.W $0000,Y : JSL.L QueueSound_Lib3_Max1 
    INY 
    RTS 


Draw_HighPriority_EnemyProjectile:
    PHB : PEA.W EnemyProjSpritemaps>>8&$FF00 
    PLB : PLB 
    JSR.W Get_Values_for_Screen_Shaking 
    LDX.W #$0022 

.loop:
    LDA.W $1997,X : BEQ .next 
    LDA.W $1BD7,X : AND.W #$1000 
    BEQ .next 
    JSR.W Draw_EnemyProjectile 

.next:
    DEX #2
    BPL .loop 
    PLB 
    RTL 


Draw_LowPriority_EnemyProjectile:
    PHB 
    REP #$30 
    PEA.W EnemyProjSpritemaps>>8&$FF00 
    PLB : PLB 
    JSR.W Get_Values_for_Screen_Shaking 
    LDX.W #$0022 

.loop:
    LDA.W $1997,X : BEQ .next 
    LDA.W $1BD7,X : AND.W #$1000 
    BNE .next 
    JSR.W Draw_EnemyProjectile 

.next:
    DEX #2
    BPL .loop 
    PLB 
    RTL 


Draw_EnemyProjectile:
    LDY.W $1B6B,X 
    LDA.W $19BB,X : AND.W #$00FF : STA.B $1A 
    LDA.W $19BB,X : AND.W #$FF00 : STA.B $1C 
    LDA.W $1A4B,X : SEC : SBC.W $0911 : CLC : ADC.B $24 : STA.B $14 
    CLC : ADC.W #$0080 : BIT.W #$FE00 
    BNE .return 
    LDA.W $1A93,X : SEC : SBC.W $0915 : CLC : ADC.B $22 : STA.B $12 
    BIT.W #$FF00 
    BNE + 
    PHX 
    JSL.L AddSpritemapToOAM_WithBaseTileNumber_8C0A 
    PLX 
    BRA .return 


  + CLC : ADC.W #$0080 : BIT.W #$FE00 
    BNE .return 
    PHX 
    JSL.L AddSpritemapToOAM_WithBaseTileNumber_Offscreen_8C7F 
    PLX 

.return:
    RTS 


Get_Values_for_Screen_Shaking:
    LDA.W $1840 : BEQ .returnZero 
    LDA.W $0A78 : BNE .returnZero 
    LDA.W $183E : CMP.W #$0024 : BPL .returnZero 
    ASL #2
    TAX 
    LDA.W $1840 : BIT.W #$0002 
    BEQ + 
    LDA.L .horizontalX,X 
    EOR.W #$FFFF 
    INC A 
    STA.B $24 
    LDA.L .horizontalY,X 
    EOR.W #$FFFF 
    INC A 
    STA.B $22 
    RTS 


  + LDA.L .horizontalX,X : STA.B $24 
    LDA.L .horizontalY,X : STA.B $22 
    RTS 


.returnZero:
    STZ.B $22 
    STZ.B $24 
    RTS 

;        __________________________________ Horizontal shaking
;       |             _____________________ Vertical shaking
;       |            |             ________ Diagonal shaking
;       |            |            |
.horizontalX:
    dw $0000
.horizontalY:
    dw       $0000
.verticalX:
    dw              $0000
.verticalY:
    dw                    $0000
.diagonalX:
    dw                           $0000
.diagonalY:
    dw                                 $0000 ;\
    dw $0000,$0000, $0000,$0000, $0000,$0000 ;} BG1 only
    dw $0000,$0000, $0000,$0000, $0000,$0000 ;/
    dw $0000,$0000, $0000,$0000, $0000,$0000 ;\
    dw $0000,$0000, $0000,$0000, $0000,$0000 ;} BG1 and BG2
    dw $0000,$0000, $0000,$0000, $0000,$0000 ;/
    dw $0001,$0000, $0000,$0001, $0001,$0001 ;\
    dw $0002,$0000, $0000,$0002, $0002,$0002 ;} BG1, BG2 and enemies
    dw $0003,$0000, $0000,$0003, $0003,$0003 ;/
    dw $0001,$0000, $0000,$0001, $0001,$0001 ;\
    dw $0002,$0000, $0000,$0002, $0002,$0002 ;} BG2 only and enemies
    dw $0003,$0000, $0000,$0003, $0003,$0003 ;/

RTS_8684FB:
    RTS 


InstList_EnemyProjectile_Delete:
    dw Instruction_EnemyProjectile_Delete 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_InstList_EnemyProjectile_BlankSpritemap:
    dw $1000,EnemyProjSpritemaps_Blank_Default 
    dw Instruction_EnemyProjectile_GotoY 
    dw UNUSED_InstList_EnemyProjectile_BlankSpritemap 
endif ; !FEATURE_KEEP_UNREFERENCED

EnemyProjectile_BlockCollision_HorizontalExtension:
    LDX.W $0DC4 
    LDA.L $7F6402,X : AND.W #$00FF 
    BEQ .return 
    BIT.W #$0080 
    BNE .highByte 
    AND.W #$00FF 
    BRA + 


.highByte:
    ORA.W #$FF00 

  + CLC : ADC.W $0DC4 : STA.W $0DC4 
    ASL A 
    TAX 
    LDA.L $7F0002,X : AND.W #$F000 
    XBA 
    LSR #3
    TAX 
    PLA 
    SEC : SBC.W #$0003 : PHA 

.return:
    CLC 
    RTS 


EnemyProjectile_BlockCollision_VerticalExtension:
    LDX.W $0DC4 
    LDA.L $7F6402,X : AND.W #$00FF 
    BEQ .return 
    BIT.W #$0080 
    BNE .negative 
    STA.W $0DD4 
    LDA.W $0DC4 

.loop:
    CLC : ADC.W $07A5 : DEC.W $0DD4 
    BNE .loop 
    JMP.W .merge 


.negative:
    ORA.W #$FF00 
    STA.W $0DD4 
    LDA.W $0DC4 

.loop2:
    SEC : SBC.W $07A5 : INC.W $0DD4 
    BNE .loop2 

.merge:
    STA.W $0DC4 
    ASL A 
    TAX 
    LDA.L $7F0002,X : AND.W #$F000 
    XBA 
    LSR #3
    TAX 
    PLA 
    SEC : SBC.W #$0003 : PHA 

.return:
    CLC 
    RTS 


CLCRTS_86858A:
    CLC 
    RTS 


SECRTS_86858C:
    SEC 
    RTS 


EnemyProjectile_BlockCollision_HorizontalSlope:
    LDX.W $0DC4 
    LDA.L $7F6402,X : AND.W #$001F 
    CMP.W #$0005 : BCS .nonSquare 
    JMP.W EnemyProjectile_BlockCollision_HorizontalSlopeSquare 


.nonSquare:
    LDA.L $7F6402,X : AND.W #$00FF : STA.W $1E77 
    JMP.W EnemyProjectile_BlockCollision_HorizontalSlopeNonSquare 


EnemyProjectile_BlockCollision_VerticalSlope:
    LDX.W $0DC4 
    LDA.L $7F6402,X : AND.W #$001F 
    CMP.W #$0005 : BCS .nonSquare 
    JMP.W EnemyProjectile_BlockCollision_VerticalSlopeSquare 


.nonSquare:
    JMP.W EnemyProjectile_BlockCollision_VerticalSlopeNonSquare 


EnemyProjectile_BlockCollision_HorizontalSlopeSquare:
    ASL #2
    STA.W $0DD4 
    LDA.L $7F6401,X 
    ROL A 
    ROL A 
    ROL A 
    AND.W #$0003 
    STA.W $0DD6 
    LDA.B $22 : AND.W #$0008 
    LSR #3
    EOR.W $0DD6 
    ADC.W $0DD4 : TAX 
    LDY.W $1991 
    LDA.B $20 : BNE .multiBlock 
    LDA.W $1A93,Y : SEC : SBC.B $1E : AND.W #$0008 
    BNE + 
    LDA.L SquareSlopeDefinitions_Bank86_topLeft-1,X : BMI .gotoCollision 

  + TXA 
    EOR.W #$0002 
    TAX 
    LDA.W $1A93,Y : CLC : ADC.B $1E : DEC A 
    AND.W #$0008 
    BEQ .returnCollision 
    LDA.L SquareSlopeDefinitions_Bank86_topLeft-1,X : BMI .gotoCollision 

.returnCollision:
    CLC 
    RTS 


.gotoCollision:
    JMP.W .collision 


.multiBlock:
    LDA.B $1A : BNE + 
    LDA.W $1A93,Y : CLC : ADC.B $1E : DEC A 
    AND.W #$0008 
    BNE .bothHalves 
    LDA.L SquareSlopeDefinitions_Bank86_topLeft-1,X : BMI .gotoCollision_duplicate 
    BRA .returnNoCollision 


  + CMP.B $20 : BNE .bothHalves 
    LDA.W $1A93,Y : SEC : SBC.B $1E : AND.W #$0008 
    BNE .checkBottomHalf 

.bothHalves:
    LDA.L SquareSlopeDefinitions_Bank86_topLeft-1,X : BMI .gotoCollision_duplicate 

.checkBottomHalf:
    TXA 
    EOR.W #$0002 
    TAX 
    LDA.L SquareSlopeDefinitions_Bank86_topLeft-1,X : BMI .gotoCollision_duplicate 

.returnNoCollision:
    CLC 
    RTS 


.gotoCollision_duplicate:
    JMP.W .collision ; >.<


.collision:
    LDX.W $1991 
    STZ.W $1A27,X 
    LDA.B $22 : BIT.B $14 
    BMI + 
    AND.W #$FFF8 
    SEC : SBC.B $1C : STA.W $1A4B,X 
    SEC 
    RTS 


  + ORA.W #$0007 
    SEC 
    ADC.B $1C : STA.W $1A4B,X 
    SEC 
    RTS 


EnemyProjectile_BlockCollision_VerticalSlopeSquare:
    ASL #2
    STA.W $0DD4 
    LDA.L $7F6401,X 
    ROL A 
    ROL A 
    ROL A 
    AND.W #$0003 
    STA.W $0DD6 
    LDA.B $22 : AND.W #$0008 
    LSR #2
    EOR.W $0DD6 
    ADC.W $0DD4 : TAX 
    LDA.B $20 : BNE .multiBlock 
    LDA.W $1A4B,Y : SEC : SBC.B $1C : AND.W #$0008 
    BNE + 
    LDA.L SquareSlopeDefinitions_Bank86_topLeft-1,X : BMI .gotoCollision 

  + TXA 
    EOR.W #$0001 
    TAX 
    LDA.W $1A4B,Y : CLC : ADC.B $1C : DEC A 
    AND.W #$0008 
    BEQ .returnNoCollision 
    LDA.L SquareSlopeDefinitions_Bank86_topLeft-1,X : BMI .gotoCollision 

.returnNoCollision:
    CLC 
    RTS 


.gotoCollision:
    JMP.W .collision 


.multiBlock:
    LDY.W $1991 
    LDA.B $1A : BNE + 
    LDA.W $1A4B,Y : CLC : ADC.B $1C : DEC A 
    AND.W #$0008 
    BNE .checkBothHalves 
    LDA.L SquareSlopeDefinitions_Bank86_topLeft-1,X : BMI .gotoCollision_duplicate 
    BRA .noCollisionReturn 


  + CMP.B $20 : BNE .checkBothHalves 
    LDA.W $1A4B,Y : SEC : SBC.B $1C : AND.W #$0008 
    BNE .checkLeftHalf 

.checkBothHalves:
    LDA.L SquareSlopeDefinitions_Bank86_topLeft-1,X : BMI .gotoCollision_duplicate 

.checkLeftHalf:
    TXA 
    EOR.W #$0001 
    TAX 
    LDA.L SquareSlopeDefinitions_Bank86_topLeft-1,X : BMI .gotoCollision_duplicate 

.noCollisionReturn:
    CLC 
    RTS 


.gotoCollision_duplicate:
    JMP.W .collision ; >.<


.collision:
    LDX.W $1991 
    STZ.W $1A6F,X 
    LDA.B $22 : BIT.B $14 
    BMI + 
    AND.W #$FFF8 
    SEC : SBC.B $1E : STA.W $1A93,X 
    SEC 
    RTS 


  + ORA.W #$0007 
    SEC 
    ADC.B $1E : STA.W $1A93,X 
    SEC 
    RTS 


SquareSlopeDefinitions_Bank86: 
;        _____________ Top-left
;       |    _________ Top-right
;       |   |    _____ Bottom-left
;       |   |   |    _ Bottom-right
;       |   |   |   |
  .topLeft
    db $00
  .topRight
    db     $01
  .bottomLeft
    db         $82
  .bottomRight
    db             $83 ; 0: Half height
    db $00,$81,$02,$83 ; 1: Half width
    db $00,$01,$02,$83 ; 2: Quarter
    db $00,$81,$82,$83 ; 3: Three-quarters
    db $80,$81,$82,$83 ; 4: Whole

EnemyProjectile_BlockCollision_HorizontalSlopeNonSquare:
    LDA.W $1E77 : AND.W #$001F 
    ASL #2
    TAX 
    LDA.B $14 : BPL .return ; >.<
    CLC 
    RTS 


.return:
    CLC 
    RTS 


EnemyProjectile_BlockCollision_VerticalSlopeNonSquare:
    LDY.W $1991 
    LDA.B $14 : BPL + 
    JMP.W .up 


  + LDX.W $0DC4 
    STX.W $4204 
    SEP #$20 
    LDA.W $07A5 : STA.W $4206 
    REP #$20 
    LDA.W $1A4B,Y 
    LSR #4
    CMP.W $4216 : BEQ + 
    CLC 
    RTS 


  + LDA.B $18 : CLC : ADC.B $1E : DEC A 
    AND.W #$000F 
    STA.W $0DD4 
    LDA.L $7F6402,X : AND.W #$001F 
    ASL #4
    STA.W $0DD6 
    LDA.L $7F6401,X : BMI .returnNoCollision 
    ASL A 
    BMI .nonZero 
    LDA.W $1A4B,Y : BRA + 


.nonZero:
    LDA.W $1A4B,Y 
    EOR.W #$000F 

  + AND.W #$000F 
    CLC : ADC.W $0DD6 : TAX 
    LDA.L SlopeDefinitions_SlopeTopXOffsetByYPixel,X : AND.W #$001F 
    SEC : SBC.W $0DD4 : DEC A 
    BEQ .setYpos 
    BPL .returnNoCollision 

.setYpos:
    CLC : ADC.B $18 : STA.W $1A93,Y 
    LDA.W #$FFFF : STA.W $1A6F,Y 
    SEC 
    RTS 


.returnNoCollision:
    CLC 
    RTS 


.up:
    LDX.W $0DC4 
    STX.W $4204 
    SEP #$20 
    LDA.W $07A5 : STA.W $4206 
    REP #$20 
    LDA.W $1A4B,Y 
    LSR #4
    CMP.W $4216 : BEQ + 
    CLC 
    RTS 


  + LDA.B $18 : SEC : SBC.B $1E : AND.W #$000F 
    EOR.W #$000F 
    STA.W $0DD4 
    LDA.L $7F6402,X : AND.W #$001F 
    ASL #4
    STA.W $0DD6 
    LDA.L $7F6401,X : BPL .noCollisionReturn 
    ASL A 
    BMI .notZero 
    LDA.W $1A4B,Y : BRA + 


.notZero:
    LDA.W $1A4B,Y 
    EOR.W #$000F 

  + AND.W #$000F 
    CLC : ADC.W $0DD6 : TAX 
    LDA.L SlopeDefinitions_SlopeTopXOffsetByYPixel,X : AND.W #$001F 
    SEC : SBC.W $0DD4 : DEC A 
    BEQ .Ypos 
    BPL .noCollisionReturn 

.Ypos:
    EOR.W #$FFFF 
    INC A 
    CLC : ADC.B $18 : STA.W $1A93,Y 
    LDA.W #$0000 : STA.W $1A6F,Y 
    SEC 
    RTS 


.noCollisionReturn:
    CLC 
    RTS 


EnemyProjectile_BlockCollision_Horizontal_Pointers:
    dw CLCRTS_86858A 
    dw EnemyProjectile_BlockCollision_HorizontalSlope ; 1: Slope
    dw CLCRTS_86858A 
    dw CLCRTS_86858A 
    dw CLCRTS_86858A 
    dw EnemyProjectile_BlockCollision_HorizontalExtension ; 5: Horizontal extension
    dw CLCRTS_86858A 
    dw CLCRTS_86858A 
    dw SECRTS_86858C 
    dw SECRTS_86858C 
    dw SECRTS_86858C 
    dw SECRTS_86858C 
    dw SECRTS_86858C 
    dw EnemyProjectile_BlockCollision_VerticalExtension ; Dh: Vertical extension
    dw CLCRTS_86858A 
    dw SECRTS_86858C 

EnemyProjectile_BlockCollision_Vertical_Pointers:
    dw CLCRTS_86858A 
    dw EnemyProjectile_BlockCollision_VerticalSlope ; 1: Slope
    dw CLCRTS_86858A 
    dw CLCRTS_86858A 
    dw CLCRTS_86858A 
    dw EnemyProjectile_BlockCollision_HorizontalExtension ; 5: Horizontal extension
    dw CLCRTS_86858A 
    dw CLCRTS_86858A 
    dw SECRTS_86858C 
    dw SECRTS_86858C 
    dw SECRTS_86858C 
    dw SECRTS_86858C 
    dw SECRTS_86858C 
    dw EnemyProjectile_BlockCollision_VerticalExtension ; Dh: Vertical extension
    dw CLCRTS_86858A 
    dw SECRTS_86858C 

EnemyProjectile_BlockReaction_Horizontal:
    PHX 
    STX.W $0DC4 
    LSR.W $0DC4 
    LDA.L $7F0002,X : AND.W #$F000 
    XBA 
    LSR #3
    TAX 
    JSR.W (EnemyProjectile_BlockCollision_Horizontal_Pointers,X) 
    PLX 
    RTS 


EnemyProjectile_BlockReaction_Vertical:
    PHX 
    STX.W $0DC4 
    LSR.W $0DC4 
    LDA.L $7F0002,X : AND.W #$F000 
    XBA 
    LSR #3
    TAX 
    JSR.W (EnemyProjectile_BlockCollision_Vertical_Pointers,X) 
    PLX 
    RTS 


Move_EnemyProjectile_Horizontally:
    PHX 
    STZ.B $12 
    STZ.B $14 
    LDA.W $1AB7,X : BPL + 
    DEC.B $14 

  + STA.B $13 
    LDA.W $1BB4,X : AND.W #$00FF : STA.B $1E 
    LDA.W $1BB3,X : AND.W #$00FF : STA.B $1C 
    LDA.W $1A93,X : SEC : SBC.B $1E : AND.W #$FFF0 
    STA.B $1A 
    LDA.W $1A93,X : CLC : ADC.B $1E : DEC A 
    SEC : SBC.B $1A : LSR #4
    STA.B $1A 
    STA.B $20 
    LDA.W $1A93,X : SEC : SBC.B $1E : LSR #4
    SEP #$20 
    STA.W $4202 
    LDA.W $07A5 : STA.W $4203 
    REP #$20 
    LDA.W $1A27,X : CLC : ADC.B $12 : STA.B $16 
    LDA.W $1A4B,X : ADC.B $14 : STA.B $18 
    BIT.B $14 
    BMI .lessThanZero 
    CLC : ADC.B $1C : DEC A 
    BRA + 


.lessThanZero:
    SEC : SBC.B $1C 

  + STA.B $22 
    LSR #4
    CLC : ADC.W $4216 : ASL A 
    TAX 

.loop:
    JSR.W EnemyProjectile_BlockReaction_Horizontal 
    BCS .solid 
    TXA 
    CLC : ADC.W $07A5 : ADC.W $07A5 : TAX 
    DEC.B $1A 
    BPL .loop 
    PLX 
    LDA.B $16 : STA.W $1A27,X 
    LDA.B $18 : STA.W $1A4B,X 
    CLC 
    RTS 


.solid:
    PLX 
    STZ.W $1A27,X 
    LDA.B $22 : BIT.B $14 
    BMI .movingLeft 
    AND.W #$FFF0 
    SEC : SBC.B $1C : CMP.W $1A4B,X : BCC .returnCollision 
    STA.W $1A4B,X 

.returnCollision:
    SEC 
    RTS 


.movingLeft:
    ORA.W #$000F 
    SEC 
    ADC.B $1C : CMP.W $1A4B,X : BEQ + 
    BCS .returnCollisionLeft 

  + STA.W $1A4B,X 

.returnCollisionLeft:
    SEC 
    RTS 


Move_EnemyProjectile_Vertically:
    PHX 
    STZ.B $12 
    STZ.B $14 
    LDA.W $1ADB,X : BPL + 
    DEC.B $14 

  + STA.B $13 
    LDA.W $1BB4,X : AND.W #$00FF : STA.B $1E 
    LDA.W $1BB3,X : AND.W #$00FF : STA.B $1C 
    LDA.W $1A4B,X : SEC : SBC.B $1C : AND.W #$FFF0 
    STA.B $1A 
    LDA.W $1A4B,X : CLC : ADC.B $1C : DEC A 
    SEC : SBC.B $1A : LSR #4
    STA.B $1A 
    STA.B $20 
    LDA.W $1A6F,X : CLC : ADC.B $12 : STA.B $16 
    LDA.W $1A93,X : ADC.B $14 : STA.B $18 
    BIT.B $14 
    BMI .lessThanZero 
    CLC : ADC.B $1E : DEC A 
    BRA + 


.lessThanZero:
    SEC : SBC.B $1E 

  + STA.B $22 
    LSR #4
    SEP #$20 
    STA.W $4202 
    LDA.W $07A5 : STA.W $4203 
    REP #$20 
    LDA.W $1A4B,X : SEC : SBC.B $1C : LSR #4
    CLC : ADC.W $4216 : ASL A 
    TAX 

.loop:
    JSR.W EnemyProjectile_BlockReaction_Vertical 
    BCS .solid 
    INX #2
    DEC.B $1A 
    BPL .loop 
    PLX 
    LDA.B $16 : STA.W $1A6F,X 
    LDA.B $18 : STA.W $1A93,X 
    CLC 
    RTS 


.solid:
    PLX 
    STZ.W $1A6F,X 
    LDA.B $22 : BIT.B $14 
    BMI .movingUp 
    AND.W #$FFF0 
    SEC : SBC.B $1E : CMP.W $1A93,X : BCC .returnCollision 
    STA.W $1A93,X 

.returnCollision:
    SEC 
    RTS 


.movingUp:
    ORA.W #$000F 
    SEC 
    ADC.B $1E : CMP.W $1A93,X : BEQ + 
    BCS .returnCollisionUp 

  + STA.W $1A93,X 

.returnCollisionUp:
    SEC 
    RTS 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_EnemyProjectile_868A39:
    JSL.L GenerateRandomNumber 
    LDX.W $0E54 
    LDA.W $0F7E,X : CLC : ADC.W #$000C : STA.W $1A93,Y 
    ADC.W #$0048 : STA.W $19DF,Y 
    LDA.W $0FAE,X : STA.W $1ADB,Y 
    LDA.W $05E5 : AND.W #$001F 
    SEC : SBC.W #$0010 : CLC : ADC.W $0F7A,X : STA.W $1A4B,Y 
    LDA.W $1ADC,Y : AND.W #$0006 
    TAX 
    LDA.W .pointers,X : STA.W $1B47,Y 
    RTS 


.pointers:
    dw UNUSED_EnemyProjectile_868A39 
    dw UNUSED_EnemyProjectile_868A39 
    dw UNUSED_EnemyProjectile_868A39 
    dw UNUSED_EnemyProjectile_868A39 

UNUSED_PreInstruction_EnemyProjectile_868A7D:
    LDA.W $1ADA,X : AND.W #$FF00 : STA.B $14 
    LDA.W $1ADB,X 
    XBA 
    BPL + 
    ORA.W #$FF00 
    BRA .storeYVelocity 


  + AND.W #$00FF 

.storeYVelocity:
    STA.B $12 
    LDA.W $1A6F,X : CLC : ADC.B $14 : STA.W $1A6F,X 
    LDA.W $1A93,X : ADC.B $12 : STA.W $1A93,X 
    CMP.W $19DF,X : BCC .return 
    STZ.W $1997,X 

.return:
    RTS 


UNUSED_EnemyProjectile_868AAF:
; Initial instruction list ignored
    dw UNUSED_EnemyProjectile_868A39 ; Initialisation AI
    dw UNUSED_PreInstruction_EnemyProjectile_868A7D ; Initial pre-instruction
    dw UNUSED_EnemyProjectile_868A39 ; Initial instruction list
    db $00,$00 ; X/Y radius
    dw $0002,$0000 ; Properties, Hit instruction list
    dw InstList_EnemyProjectile_Delete ; Shot instruction list
endif ; !FEATURE_KEEP_UNREFERENCED

InstList_SkreeParticle:
    dw $0010,EnemyProjSpritemaps_SkreeParticle 
    dw Instruction_EnemyProjectile_GotoY 
    dw InstList_SkreeParticle 

InstList_MetalSkreeParticle:
    dw $0010,EnemyProjSpritemaps_MetareeParticle 
    dw Instruction_EnemyProjectile_GotoY 
    dw InstList_MetalSkreeParticle 

InitAI_EnemyProjectile_MetalSkreeParticle_DownRight:
    LDX.W $0E54 
    LDA.W $0F7E,X : SEC : SBC.W #$0000 : STA.W $1A93,Y 
    LDA.W #$FCFF : STA.W $1ADB,Y 
    LDA.W $0F7A,X : CLC : ADC.W #$0006 : STA.W $1A4B,Y 
    LDA.W #$0140 : STA.W $1AB7,Y 
    RTS 


InitAI_EnemyProjectile_MetalSkreeParticle_UpRight:
    LDX.W $0E54 
    LDA.W $0F7E,X : SEC : SBC.W #$0000 : STA.W $1A93,Y 
    LDA.W #$FBFF : STA.W $1ADB,Y 
    LDA.W $0F7A,X : CLC : ADC.W #$0006 : STA.W $1A4B,Y 
    LDA.W #$0060 : STA.W $1AB7,Y 
    RTS 


InitAI_EnemyProjectile_MetalSkreeParticle_DownLeft:
    LDX.W $0E54 
    LDA.W $0F7E,X : SEC : SBC.W #$0000 : STA.W $1A93,Y 
    LDA.W #$FCFF : STA.W $1ADB,Y 
    LDA.W $0F7A,X : CLC : ADC.W #$FFFA : STA.W $1A4B,Y 
    LDA.W #$FEC0 : STA.W $1AB7,Y 
    RTS 


InitAI_EnemyProjectile_MetalSkreeParticle_UpLeft:
    LDX.W $0E54 
    LDA.W $0F7E,X : SEC : SBC.W #$0000 : STA.W $1A93,Y 
    LDA.W #$FBFF : STA.W $1ADB,Y 
    LDA.W $0F7A,X : CLC : ADC.W #$FFFA : STA.W $1A4B,Y 
    LDA.W #$FFA0 : STA.W $1AB7,Y 
    RTS 


PreInstruction_EnemyProjectile_MetalSkreeParticle:
    LDA.W $1AB6,X : AND.W #$FF00 : STA.B $14 
    LDA.W $1AB7,X 
    XBA 
    BPL + 
    ORA.W #$FF00 
    BRA .storeXVelocity 


  + AND.W #$00FF 

.storeXVelocity:
    STA.B $12 
    LDA.W $1A27,X : CLC : ADC.B $14 : STA.W $1A27,X 
    LDA.W $1A4B,X : ADC.B $12 : STA.W $1A4B,X 
    LDA.W $1ADA,X : AND.W #$FF00 : STA.B $14 
    LDA.W $1ADB,X 
    XBA 
    BPL + 
    ORA.W #$FF00 
    BRA .storeYVelocity 


  + AND.W #$00FF 

.storeYVelocity:
    STA.B $12 
    LDA.W $1A6F,X : CLC : ADC.B $14 : STA.W $1A6F,X 
    LDA.W $1A93,X : ADC.B $12 : STA.W $1A93,X 
    LDA.W $1ADB,X : CLC : ADC.W #$0050 : STA.W $1ADB,X 
    JSR.W CheckIf_EnemyProjectile_IsOffScreen_duplicate_again4 
    BEQ .return 
    STZ.W $1997,X 

.return:
    RTS 


EnemyProjectile_SkreeParticles_DownRight:
    dw InitAI_EnemyProjectile_MetalSkreeParticle_DownRight ; Initialisation AI
    dw PreInstruction_EnemyProjectile_MetalSkreeParticle ; Initial pre-instruction
    dw InstList_SkreeParticle ; Initial instruction list
    db $02,$02 ; X/Y radius
    dw $0004,$0000 ; Properties, Hit instruction list
    dw InstList_EnemyProjectile_Delete ; Shot instruction list

EnemyProjectile_SkreeParticles_UpRight:
    dw InitAI_EnemyProjectile_MetalSkreeParticle_UpRight ; Initialisation AI
    dw PreInstruction_EnemyProjectile_MetalSkreeParticle ; Initial pre-instruction
    dw InstList_SkreeParticle ; Initial instruction list
    db $02,$02 ; X/Y radius
    dw $0004,$0000 ; Properties, Hit instruction list
    dw InstList_EnemyProjectile_Delete ; Shot instruction list

EnemyProjectile_SkreeParticles_DownLeft:
    dw InitAI_EnemyProjectile_MetalSkreeParticle_DownLeft ; Initialisation AI
    dw PreInstruction_EnemyProjectile_MetalSkreeParticle ; Initial pre-instruction
    dw InstList_SkreeParticle ; Initial instruction list
    db $02,$02 ; X/Y radius
    dw $0004,$0000 ; Properties, Hit instruction list
    dw InstList_EnemyProjectile_Delete ; Shot instruction list

EnemyProjectile_SkreeParticles_UpLeft:
    dw InitAI_EnemyProjectile_MetalSkreeParticle_UpLeft ; Initialisation AI
    dw PreInstruction_EnemyProjectile_MetalSkreeParticle ; Initial pre-instruction
    dw InstList_SkreeParticle ; Initial instruction list
    db $02,$02 ; X/Y radius
    dw $0004,$0000 ; Properties, Hit instruction list
    dw InstList_EnemyProjectile_Delete ; Shot instruction list

EnemyProjectile_MetalSkreeParticles_DownRight:
    dw InitAI_EnemyProjectile_MetalSkreeParticle_DownRight ; Initialisation AI
    dw PreInstruction_EnemyProjectile_MetalSkreeParticle ; Initial pre-instruction
    dw InstList_MetalSkreeParticle ; Initial instruction list
    db $02,$02 ; X/Y radius
    dw $0004,$0000 ; Properties, Hit instruction list
    dw InstList_EnemyProjectile_Delete ; Shot instruction list

EnemyProjectile_MetalSkreeParticles_UpRight:
    dw InitAI_EnemyProjectile_MetalSkreeParticle_UpRight ; Initialisation AI
    dw PreInstruction_EnemyProjectile_MetalSkreeParticle ; Initial pre-instruction
    dw InstList_MetalSkreeParticle ; Initial instruction list
    db $02,$02 ; X/Y radius
    dw $0004,$0000 ; Properties, Hit instruction list
    dw InstList_EnemyProjectile_Delete ; Shot instruction list

EnemyProjectile_MetalSkreeParticles_DownLeft:
    dw InitAI_EnemyProjectile_MetalSkreeParticle_DownLeft ; Initialisation AI
    dw PreInstruction_EnemyProjectile_MetalSkreeParticle ; Initial pre-instruction
    dw InstList_MetalSkreeParticle ; Initial instruction list
    db $02,$02 ; X/Y radius
    dw $0004,$0000 ; Properties, Hit instruction list
    dw InstList_EnemyProjectile_Delete ; Shot instruction list

EnemyProjectile_MetalSkreeParticles_UpLeft:
    dw InitAI_EnemyProjectile_MetalSkreeParticle_UpLeft ; Initialisation AI
    dw PreInstruction_EnemyProjectile_MetalSkreeParticle ; Initial pre-instruction
    dw InstList_MetalSkreeParticle ; Initial instruction list
    db $02,$02 ; X/Y radius
    dw $0004,$0000 ; Properties, Hit instruction list
    dw InstList_EnemyProjectile_Delete ; Shot instruction list

if !FEATURE_KEEP_UNREFERENCED
UNUSED_InstList_Draygon_868C32:
    dw $0010,UNUSED_EnemyProjSpritemaps_Draygon_8D8A0F 
    dw Instruction_EnemyProjectile_Sleep 
endif ; !FEATURE_KEEP_UNREFERENCED

InstList_EnemyProjectile_DraygonGoop_Touch:
    dw Instruction_DraygonGoop_SamusCollision 

InstList_EnemyProjectile_DraygonGoop:
    dw $000A,EnemyProjSpritemaps_DraygonGoop_0 
    dw $000A,EnemyProjSpritemaps_DraygonGoop_1 
    dw $000A,EnemyProjSpritemaps_DraygonGoop_2 
    dw $000A,EnemyProjSpritemaps_DraygonGoop_3 
    dw $000A,EnemyProjSpritemaps_DraygonGoop_2 
    dw $000A,EnemyProjSpritemaps_DraygonGoop_1 
    dw Instruction_EnemyProjectile_GotoY 
    dw InstList_EnemyProjectile_DraygonGoop 
    dw Instruction_EnemyProjectile_Sleep 

InstList_EnemyProjectile_DraygonGoop_Shot:
    dw $0008,EnemyProjSpritemaps_DraygonGoop_4 
    dw $0008,EnemyProjSpritemaps_DraygonGoop_5 
    dw Instruction_SpawnEnemyDropsWIthDraygonEyeDropChances 
    dw Instruction_EnemyProjectile_GotoY 
    dw InstList_EnemyProjectile_Delete 
    dw Instruction_EnemyProjectile_Delete 

Instruction_SpawnEnemyDropsWIthDraygonEyeDropChances:
    PHY : PHX 
    LDA.W $1A4B,X : STA.B $12 
    LDA.W $1A93,X : STA.B $14 
    LDA.W #EnemyHeaders_DraygonEye : JSL.L Spawn_Enemy_Drops 
    PLX : PLY 
    RTS 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_InstList_Draygon_868C7E:
    dw $0004,UNUSED_EnemyProjSpritemaps_Draygon_0_8D8A32 
    dw $0006,UNUSED_EnemyProjSpritemaps_Draygon_1_8D8A39 
    dw $0008,UNUSED_EnemyProjSpritemaps_Draygon_2_8D8A40 
    dw $0018,UNUSED_EnemyProjSpritemaps_Draygon_3_8D8A47 
    dw $0018,UNUSED_EnemyProjSpritemaps_Draygon_4_8D8A4E 
    dw $0018,UNUSED_EnemyProjSpritemaps_Draygon_5_8D8A55 
    dw $0018,UNUSED_EnemyProjSpritemaps_Draygon_6_8D8A5C 
    dw $0018,UNUSED_EnemyProjSpritemaps_Draygon_3_8D8A47 
    dw Instruction_EnemyProjectile_GotoY 
    dw UNUSED_InstList_Draygon_868C7E 
    dw Instruction_EnemyProjectile_Sleep 
endif ; !FEATURE_KEEP_UNREFERENCED

InstList_EnemyProjectile_DraygonsWallTurretProjectile_0:
    dw $0005,EnemyProjSpritemaps_DrayTurretProj_DustCloud_Explosion_0 
    dw $0004,EnemyProjSpritemaps_DrayTurretProj_DustCloud_Explosion_1 
    dw $0003,EnemyProjSpritemaps_DrayTurretProj_DustCloud_Explosion_2 
    dw $0003,EnemyProjSpritemaps_DrayTurretProj_DustCloud_Explosion_3 
    dw $0003,EnemyProjSpritemaps_DrayTurretProj_DustCloud_Explosion_4 
    dw $0003,EnemyProjSpritemaps_DrayTurretProj_DustCloud_Explosion_5 
    dw $0004,EnemyProjSpritemaps_DrayTurretProj_DustCloud_Explosion_6 
    dw $0003,EnemyProjSpritemaps_DrayTurretProj_DustCloud_Explosion_7 
    dw $0002,EnemyProjSpritemaps_DrayTurretProj_DustCloud_Explosion_8 
    dw $0002,EnemyProjSpritemaps_DrayTurretProj_DustCloud_Explosion_9 
    dw $0002,EnemyProjSpritemaps_DrayTurretProj_DustCloud_Explosion_A 
    dw $0002,EnemyProjSpritemaps_DrayTurretProj_DustCloud_Explosion_B 
    dw $000A,EnemyProjSpritemaps_DraygonsWallTurretProjectile_0 
    dw $000A,EnemyProjSpritemaps_DraygonsWallTurretProjectile_1 
    dw $000A,EnemyProjSpritemaps_DraygonsWallTurretProjectile_2 
    dw $000A,EnemyProjSpritemaps_DraygonsWallTurretProjectile_3 
    dw Instruction_SetPreInst_DraygonsWallTurretProjectile_Fired 

InstList_EnemyProjectile_DraygonsWallTurretProjectile_1:
    dw $0008,EnemyProjSpritemaps_DraygonsWallTurretProjectile_4 
    dw $0008,EnemyProjSpritemaps_DraygonsWallTurretProjectile_5 
    dw $0008,EnemyProjSpritemaps_DraygonsWallTurretProjectile_6 
    dw Instruction_EnemyProjectile_GotoY 
    dw InstList_EnemyProjectile_DraygonsWallTurretProjectile_1 

Instruction_SetPreInst_DraygonsWallTurretProjectile_Fired:
    LDA.W #PreInstruction_EnemyProj_DraygonsWallTurretProjectile_Fired : STA.W $1A03,X 
    RTS 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_Inst_PreInstruction_DraygonGoop_StuckToSamus_868CFD:
    LDA.W #PreInstruction_DraygonGoop_StuckToSamus : STA.W $1A03,X 
    RTS 
endif ; !FEATURE_KEEP_UNREFERENCED


InitAI_EnemyProjectile_DraygonGoop:
    PHY : PHX 
    TYX 
    LDA.B $12 : STA.W $1A4B,Y 
    LDA.B $14 : STA.W $1A93,Y 
    LDA.W $1995 : STA.L $7E97DC,X 
    STA.B $12 
    LDA.W $1993 : STA.B $14 
    JSL.L Do_Some_Math_With_Sine_Cosine_Terrible_Label_Name ; ($16.$18, $1A.$1C) = ([$14] * |cos([$12] * pi / 80h)|, [$14] * |sin([$12] * pi / 80h)|)
    LDA.B $16 : STA.W $1AB7,Y 
    LDA.B $18 : STA.W $1AFF,Y 
    LDA.B $1A : STA.W $1ADB,Y 
    LDA.B $1C : STA.W $1B23,Y 
    LDA.W #$0400 : STA.W $19BB,Y 
    PLX : PLY 
    RTS 


InitAI_EnemyProjectile_DraygonsWallTurretProjectile:
    PHY : PHX 
    JSR.W PlaceAndAim_DraygonsWallTurretProjectile 
    LDA.W #$0A00 : STA.W $19BB,Y 
    LDA.W #RTS_868D54 : STA.W $1A03,Y 
    PLX : PLY 
    RTS 


RTS_868D54:
    RTS 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_Delete_EnemyProjectile_Y_868D55:
    LDA.W #$0000 : STA.W $1997,Y 
    RTS 
endif ; !FEATURE_KEEP_UNREFERENCED


Delete_EnemyProjectile_IfPowerBombed:
    PHY : PHX 
    LDA.W $0CEB : AND.W #$00FF : STA.B $12 
    BEQ .return 
    LSR A 
    ADC.B $12 : LSR A 
    STA.B $14 
    LDA.W $0CE2 : SEC : SBC.W $1A4B,X : BPL + 
    EOR.W #$FFFF 
    INC A 

  + CMP.B $12 : BCS .return 
    LDA.W $0CE4 : SEC : SBC.W $1A93,X : BPL + 
    EOR.W #$FFFF 
    INC A 

  + CMP.B $14 : BCS .return 
    STZ.W $1997,X 
    STZ.W $0A66 

.return:
    PLX : PLY 
    RTS 


Instruction_DraygonGoop_SamusCollision:
    JSR.W Delete_EnemyProjectile_IfPowerBombed 
    LDA.W $0A66 
    INC A 
    CMP.W #$0006 : BPL .return 
    STA.W $0A66 
    STA.W $1B23,X 
    LDA.W #$0100 : STA.W $1AFF,X 
    LDA.W #PreInstruction_DraygonGoop_StuckToSamus : STA.W $1A03,X 
    LDA.W $1BD7,X : AND.W #$7FFF 
    ORA.W #$2000 
    STA.W $1BD7,X 
    STZ.W $18A8 
    STZ.W $18AA 

.return:
    RTS 


PreInstruction_DraygonGoop_StuckToSamus:
    JSR.W Delete_EnemyProjectile_IfPowerBombed 
    LDA.W $0A6E : BNE + 
    LDA.W $0AF6 : STA.W $1A4B,X 
    LDA.W $1B23,X 
    ASL #2
    CLC : ADC.W $0AFA : SEC : SBC.W #$000C : STA.W $1A93,X 
    DEC.W $1AFF,X 
    LDA.W $1AFF,X : BNE .return 

  + STZ.W $1997,X 
    DEC.W $0A66 
    LDA.W $0A66 : BPL .return 
    STZ.W $0A66 

.return:
    RTS 


PreInstruction_EnemyProj_DraygonsWallTurretProjectile_Fired:
    JSR.W Delete_EnemyProjectile_IfPowerBombed 
    JSR.W Move_EnemyProjectile_AccordingToAngleAndSpeed 
    JSR.W CheckIf_EnemyProjectile_IsInDraygonRoomBoundaries 
    BNE .delete 
    RTS 


.delete:
    STZ.W $1997,X 
    RTS 


PreInstruction_EnemyProjectile_DraygonGoop:
    JSR.W Delete_EnemyProjectile_IfPowerBombed 
    JSR.W Move_EnemyProjectile_AccordingToAngleAndSpeed 
    LDA.W $0AF6 : SEC : SBC.W $1A4B,X : BPL + 
    EOR.W #$FFFF 
    INC A 

  + CMP.W #$0010 : BPL .checkRoomBoundaries 
    LDA.W $0AFA : SEC : SBC.W $1A93,X : BPL + 
    EOR.W #$FFFF 
    INC A 

  + CMP.W #$0014 : BPL .checkRoomBoundaries 
    LDA.W #InstList_EnemyProjectile_DraygonGoop_Touch : STA.W $1B47,X 
    LDA.W #$0001 : STA.W $1B8F,X 
    RTS 


.checkRoomBoundaries:
    JSR.W CheckIf_EnemyProjectile_IsInDraygonRoomBoundaries 
    BNE .delete 
    RTS 


.delete:
    STZ.W $1997,X 
    RTS 


EnemyProjectile_DraygonGoop:
    dw InitAI_EnemyProjectile_DraygonGoop ; Initialisation AI
    dw PreInstruction_EnemyProjectile_DraygonGoop ; Initial pre-instruction
    dw InstList_EnemyProjectile_DraygonGoop ; Initial instruction list
    db $08,$08 ; X/Y radius
    dw $D000 ; Properties
    dw InstList_EnemyProjectile_DraygonGoop_Touch ; Hit instruction list
    dw InstList_EnemyProjectile_DraygonGoop_Shot ; Shot instruction list

EnemyProjectile_DraygonWallTurret:
    dw InitAI_EnemyProjectile_DraygonsWallTurretProjectile ; Initialisation AI
    dw PreInstruction_EnemyProj_DraygonsWallTurretProjectile_Fired ; Initial pre-instruction
    dw InstList_EnemyProjectile_DraygonsWallTurretProjectile_0 ; Initial instruction list
    db $08,$08 ; X/Y radius
    dw $1080 ; Properties
    dw $0000 ; Hit instruction list
    dw InstList_EnemyProj_MiscDust_3_SmallExplosion ; Shot instruction list

if !FEATURE_KEEP_UNREFERENCED
UNUSED_EnemyProjectile_Draygon_868E6C:
    dw UNUSED_InitAI_EnemyProjectile_Draygon_868E7A ; Initialisation AI
    dw UNUSED_PreInstruction_EnemyProjectile_Draygon_868E99 ; Initial pre-instruction
    dw InstList_EnemyProjectile_DraygonsWallTurretProjectile_0 ; Initial instruction list
    db $08,$08 ; X/Y radius
    dw $7000 ; Properties
    dw $0000 ; Hit instruction list
    dw InstList_EnemyProj_MiscDust_3_SmallExplosion ; Shot instruction list

UNUSED_InitAI_EnemyProjectile_Draygon_868E7A:
    PHX 
    LDA.W #$03F0 : STA.W $19BB,Y 
    LDA.B $12 : STA.W $1A4B,Y 
    LDA.B $14 : STA.W $1A93,Y 
    LDA.W #UNUSED_InstList_EnemyProjectile_Draygon_868EDF : STA.W $1B47,Y 
    LDA.W #$0001 : STA.W $1B8F,Y 
    PLX 
    RTS 


UNUSED_PreInstruction_EnemyProjectile_Draygon_868E99:
    LDA.W $0F7A : SEC : SBC.B $12 : STA.B $12 
    LDA.W $0F7E : SEC : SBC.B $14 : STA.B $14 
    JSL.L CalculateAngleOf_12_14_Offset 
    EOR.W #$00FF 
    INC A 
    CLC : ADC.W #$0040 : AND.W #$00FF 
    STA.L $7E97DC,X 
    STA.B $12 
    LDA.W #$0001 : STA.B $14 ; ($16.$18, $1A.$1C) = ([$14] * |cos([$12] * pi / 80h)|, [$14] * |sin([$12] * pi / 80h)|)
    JSL.L Do_Some_Math_With_Sine_Cosine_Terrible_Label_Name 
    LDA.B $16 : STA.W $1AB7,X 
    LDA.B $18 : STA.W $1AFF,X 
    LDA.B $1A : STA.W $1ADB,X 
    LDA.B $1C : STA.W $1B23,X 
    JSR.W Move_EnemyProjectile_AccordingToAngleAndSpeed 
    RTS 


UNUSED_InstList_EnemyProjectile_Draygon_868EDF:
    dw $0005,UNUSED_EnemyProjSpritemaps_Draygon_0_8D8967 
    dw $0005,UNUSED_EnemyProjSpritemaps_Draygon_1_8D896E 
    dw $0005,UNUSED_EnemyProjSpritemaps_Draygon_0_8D8967 
    dw $0005,UNUSED_EnemyProjSpritemaps_Draygon_2_8D8975 
    dw Instruction_EnemyProjectile_GotoY 
    dw UNUSED_InstList_EnemyProjectile_Draygon_868EDF 

UNUSED_InstList_EnemyProjectile_868EF3:
    dw $0005,UNUSED_EnemyProjSpritemaps_0_8D897C 
    dw $0005,UNUSED_EnemyProjSpritemaps_1_8D8983 
    dw $0005,UNUSED_EnemyProjSpritemaps_0_8D897C 
    dw $0005,UNUSED_EnemyProjSpritemaps_2_8D898A 
    dw Instruction_EnemyProjectile_GotoY 
    dw UNUSED_InstList_EnemyProjectile_868EF3 

UNUSED_InstList_EnemyProjectile_868F07:
    dw $0005,UNUSED_EnemyProjSpritemaps_0_8D8991 
    dw $0005,UNUSED_EnemyProjSpritemaps_1_8D8998 
    dw $0005,UNUSED_EnemyProjSpritemaps_0_8D8991 
    dw $0005,UNUSED_EnemyProjSpritemaps_2_8D899F 
    dw Instruction_EnemyProjectile_GotoY 
    dw UNUSED_InstList_EnemyProjectile_868F07 

UNUSED_InstList_EnemyProjectile_868F1B:
    dw $0005,UNUSED_EnemyProjSpritemaps_0_8D89A6 
    dw $0005,UNUSED_EnemyProjSpritemaps_1_8D89AD 
    dw $0005,UNUSED_EnemyProjSpritemaps_0_8D89A6 
    dw $0005,UNUSED_EnemyProjSpritemaps_2_8D89B4 
    dw Instruction_EnemyProjectile_GotoY 
    dw UNUSED_InstList_EnemyProjectile_868F1B 

UNUSED_InstList_EnemyProjectile_868F2F:
    dw $0005,UNUSED_EnemyProjSpritemaps_0_8D89BB 
    dw $0005,UNUSED_EnemyProjSpritemaps_1_8D89C2 
    dw $0005,UNUSED_EnemyProjSpritemaps_0_8D89BB 
    dw $0005,UNUSED_EnemyProjSpritemaps_2_8D89C9 
    dw Instruction_EnemyProjectile_GotoY 
    dw UNUSED_InstList_EnemyProjectile_868F2F 

UNUSED_InstList_EnemyProjectile_868F43:
    dw $0005,UNUSED_EnemyProjSpritemaps_0_8D89D0 
    dw $0005,UNUSED_EnemyProjSpritemaps_1_8D89D7 
    dw $0005,UNUSED_EnemyProjSpritemaps_0_8D89D0 
    dw $0005,UNUSED_EnemyProjSpritemaps_2_8D89DE 
    dw Instruction_EnemyProjectile_GotoY 
    dw UNUSED_InstList_EnemyProjectile_868F43 

UNUSED_InstList_EnemyProjectile_868F57:
    dw $0005,UNUSED_EnemyProjSpritemaps_0_8D89E5 
    dw $0005,UNUSED_EnemyProjSpritemaps_1_8D89EC 
    dw $0005,UNUSED_EnemyProjSpritemaps_0_8D89E5 
    dw $0005,UNUSED_EnemyProjSpritemaps_2_8D89F3 
    dw Instruction_EnemyProjectile_GotoY 
    dw UNUSED_InstList_EnemyProjectile_868F57 

UNUSED_InstList_EnemyProjectile_868F6B:
    dw $0005,UNUSED_EnemyProjSpritemaps_0_8D89FA 
    dw $0005,UNUSED_EnemyProjSpritemaps_1_8D8A01 
    dw $0005,UNUSED_EnemyProjSpritemaps_0_8D89FA 
    dw $0005,UNUSED_EnemyProjSpritemaps_2_8D8A08 
    dw Instruction_EnemyProjectile_GotoY 
    dw UNUSED_InstList_EnemyProjectile_868F6B 

UNUSED_EnemyProjectile_InstListPointers_868F7F:
    dw UNUSED_InstList_EnemyProjectile_Draygon_868EDF 
    dw UNUSED_InstList_EnemyProjectile_868EF3 
    dw UNUSED_InstList_EnemyProjectile_868F07 
    dw UNUSED_InstList_EnemyProjectile_868F1B 
    dw UNUSED_InstList_EnemyProjectile_868F2F 
    dw UNUSED_InstList_EnemyProjectile_868F43 
    dw UNUSED_InstList_EnemyProjectile_868F57 
    dw UNUSED_InstList_EnemyProjectile_868F6B 
endif ; !FEATURE_KEEP_UNREFERENCED

EnemyProjectile_CrocomiresProjectile:
    dw InitAI_EnemyProjectile_CrocomiresProjectile ; Initialisation AI
    dw PreInstruction_EnemyProjectile_CrocomiresProjectile_Setup ; Initial pre-instruction
    dw InstList_EnemyProjectile_CrocomiresProjectile ; Initial instruction list
    db $08,$08 ; X/Y radius
    dw $8014 ; Properties
    dw $0000 ; Hit instruction list
    dw InstList_EnemyProjectile_Shot_CrocomiresProjectile ; Shot instruction list

EnemyProjectile_CrocomireBridgeCrumbling:
    dw InitAI_EnemyProjectile_CrocomireBridgeCrumbling ; Initialisation AI
    dw PreInstruction_EnemyProjectile_CrocomireBridgeCrumbling ; Initial pre-instruction
    dw InstList_EnemyProjectile_CrocomireBridgeCrumbling ; Initial instruction list
    db $04,$04 ; X/Y radius
    dw $8000 ; Properties
    dw $0000 ; Hit instruction list
    dw InstList_EnemyProjectile_Delete ; Shot instruction list

if !FEATURE_KEEP_UNREFERENCED
UNUSED_InstList_EnemyProj_CrocomiresProjectile_Part1_868FAB:
    dw $0005,EnemyProjSpritemaps_CrocomiresProjectile_0 
    dw $0005,EnemyProjSpritemaps_CrocomiresProjectile_1 
    dw Instruction_EnemyProjectile_GotoY 
    dw UNUSED_InstList_EnemyProj_CrocomiresProjectile_Part1_868FAB 

UNUSED_InstList_EnemyProj_CrocomiresProjectile_Part2_868FB7:
    dw $0005,EnemyProjSpritemaps_CrocomiresProjectile_2 
    dw $0005,EnemyProjSpritemaps_CrocomiresProjectile_3 
    dw Instruction_EnemyProjectile_GotoY 
    dw UNUSED_InstList_EnemyProj_CrocomiresProjectile_Part2_868FB7 

UNUSED_InstList_EnemyProj_OldCrocomiresProjectile_868FC3:
    dw $0005,UNUSED_EnemyProjSpritemaps_OldCrocomiresProjectile_0_8D8082 
    dw $0005,UNUSED_EnemyProjSpritemaps_OldCrocomiresProjectile_1_8D8098 
    dw Instruction_EnemyProjectile_GotoY 
    dw UNUSED_InstList_EnemyProj_OldCrocomiresProjectile_868FC3 
endif ; !FEATURE_KEEP_UNREFERENCED

InstList_EnemyProjectile_CrocomiresProjectile:
    dw $0003,EnemyProjSpritemaps_CrocomiresProjectile_0 
    dw $0003,EnemyProjSpritemaps_CrocomiresProjectile_1 
    dw $0003,EnemyProjSpritemaps_CrocomiresProjectile_2 
    dw $0003,EnemyProjSpritemaps_CrocomiresProjectile_3 
    dw $0003,EnemyProjSpritemaps_CrocomiresProjectile_2 
    dw $0003,EnemyProjSpritemaps_CrocomiresProjectile_1 
    dw Instruction_EnemyProjectile_GotoY 
    dw InstList_EnemyProjectile_CrocomiresProjectile 

InstList_EnemyProjectile_CrocomireBridgeCrumbling:
    dw $7FFF,EnemyProjSpritemaps_CrocomiresBridgeCrumbling 
    dw Instruction_EnemyProjectile_GotoY 
    dw InstList_EnemyProjectile_CrocomireBridgeCrumbling 

InstList_EnemyProjectile_CrocomireSpikeWallPieces:
    dw $7FFF,EnemyProjSpritemaps_CrocomiresSpikeWallPieces 
    dw Instruction_EnemyProjectile_GotoY 
    dw InstList_EnemyProjectile_CrocomireSpikeWallPieces 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_InstList_EnemyProj_CrocomireBridgeCrumbling_868FFB:
    dw $0002,UNUSED_EnemyProjSpritemaps_CrocomireBridgeCrumbling_0_8D8132 
    dw $0002,UNUSED_EnemyProjSpritemaps_CrocomireBridgeCrumbling_1_8D813E 
    dw $7FFF,UNUSED_EnemyProjSpritemaps_CrocomireBridgeCrumbling_2_8D815E 
endif ; !FEATURE_KEEP_UNREFERENCED

InstList_EnemyProjectile_Shot_CrocomiresProjectile:
    dw $0004,EnemyProjSpritemaps_Common_0 
    dw $0004,EnemyProjSpritemaps_Common_1 
    dw $0004,EnemyProjSpritemaps_Common_2 
    dw $0004,EnemyProjSpritemaps_Common_3 
    dw $0004,EnemyProjSpritemaps_Common_4 
    dw Instruction_SpawnEnemyDropsWithCrocomiresDropChances 
    dw Instruction_EnemyProjectile_GotoY 
    dw InstList_EnemyProjectile_Delete 
    dw Instruction_EnemyProjectile_Delete 

InitAI_EnemyProjectile_CrocomiresProjectile:
    LDX.W $0E54 
    LDA.W #$FE00 : STA.W $1AB7,Y 
    LDA.W #$0001 : STA.W $1ADB,Y 
    LDA.W $0F7A,X : SEC : SBC.W #$0020 : STA.W $1A4B,Y 
    LDA.W $0F7E,X : SEC : SBC.W #$0010 : STA.W $1A93,Y 
    LDA.W #$0000 : STA.W $19DF,Y 
    STA.W $1A27,Y 
    STA.W $1A6F,Y 
    LDA.W #$0A00 : STA.W $19BB,Y 
    RTS 


CrocomiresProjectile_Gradients: 
; Signed values v such that v / -40h is the actual gradient
; (so v = 40h is the down-left diagonal, v = 0 is straight left, v = FFC0h is the up-left diagonal)
; Indexed by [enemy 0 $0FB2]
    dw $FFF0,$0000,$0020
    dw $FFF0,$0000,$0020
    dw $FFF0,$0000,$0020 

PreInstruction_EnemyProjectile_CrocomiresProjectile_Setup:
    JSR.W Move_EnemyProjectile_Horizontally 
    LDA.W #$0A00 : STA.W $19BB 
    LDA.W $19DF,X : CLC : ADC.W $1AB7,X : STA.W $19DF,X 
    LDA.W #$FFC0 : STA.B $12 
    PHX 
    LDX.W $0FB2 
    LDA.W CrocomiresProjectile_Gradients,X : STA.B $14 
    PLX 
    TXY 
    JSL.L CalculateAngleOf_12_14_Offset 
    ASL A 
    TAX 
    CLC 
    LDA.L SineCosineTables_8bitSine_SignExtended,X : STA.B $12 
    ASL #2
    STA.W $1AB7,Y 
    CLC 
    LDA.L SineCosineTables_NegativeCosine_SignExtended,X : STA.B $12 
    ASL #2
    STA.W $1ADB,Y 
    LDA.W #PreInstruction_EnemyProjectile_CrocomiresProjectile_Fired : STA.W $1A03,Y 
    RTS 


PreInstruction_EnemyProjectile_CrocomiresProjectile_Fired:
    JSR.W Move_EnemyProjectile_Horizontally 
    BCS .delete 
    JSR.W Move_EnemyProjectile_Vertically 
    BCC .return 

.delete:
    STZ.W $1997,X 

.return:
    RTS 


EnemyProjectile_CrocomireSpikeWallPieces:
    dw InitAI_EnemyProjectile_CrocomireSpikeWallPieces ; Initialisation AI
    dw PreInstruction_EnemyProjectile_CrocomireSpikeWallPieces ; Initial pre-instruction
    dw InstList_EnemyProjectile_CrocomireSpikeWallPieces ; Initial instruction list
    db $00,$00 ; X/Y radius
    dw $0000 ; Properties
    dw $0000 ; Hit instruction list
    dw InstList_EnemyProjectile_Delete ; Shot instruction list

InitAI_EnemyProjectile_CrocomireSpikeWallPieces:
    REP #$20 
    TYA 
    SEC : SBC.W #$0014 : TAX 
    LDA.W .Ypositions,X : STA.W $1A93,Y 
    LDA.W #$0210 : STA.W $1A4B,Y 
    LDA.W #$0000 : STA.W $1AB7,Y 
    STA.W $1ADB,Y 
    STA.W $1AFF,Y 
    STA.W $1B23,Y 
    STA.W $1A27,Y 
    STA.W $1A6F,Y 
    LDA.W #$FFFB : STA.W $1ADB,Y 
    LDA.W #$8800 : STA.W $1B23,Y 
    RTS 


  .Ypositions
; Y positions, indexed by [enemy projectile index] - 14h
    dw $0038,$0048,$0058,$0068,$0078,$0088,$0098,$00A8 

PreInstruction_EnemyProjectile_CrocomireSpikeWallPieces:
    REP #$20 
    LDA.W $1AFF,X : CMP.W .maxAcceleration,X : BEQ .storeAcceleration 
    CLC : ADC.W .accelerationDelta,X : CMP.W .maxAcceleration,X : BCC .storeAcceleration 
    LDA.W .maxAcceleration,X 

.storeAcceleration:
    STA.W $1AFF,X 
    SEP #$20 
    LDA.W $1B00,X : CLC : ADC.W $1AB7,X : STA.W $1AB7,X 
    LDA.W $1AB8,X : ADC.B #$00 : CMP.W .maxVelocity,X : BMI .storeVelocity 
    LDA.W .maxVelocity,X 

.storeVelocity:
    STA.W $1AB8,X 
    LDA.W $1AB7,X : CLC : ADC.W $1A28,X : STA.W $1A28,X 
    LDA.W $1AB8,X : ADC.W $1A4B,X : STA.W $1A4B,X 
    LDA.W $1A4C,X : ADC.B #$00 : STA.W $1A4C,X 
    REP #$20 
    LDA.W $1B23,X : CLC : ADC.W #$3000 : STA.W $1B23,X 
    LDA.W $1ADB,X : ADC.W #$0000 : STA.W $1ADB,X 
    LDA.W $1A6F,X : CLC : ADC.W $1B23,X : STA.W $1A6F,X 
    LDA.W $1A93,X : ADC.W $1ADB,X : STA.W $1A93,X 
    LDA.W $1A93,X : CMP.W #$00A8 : BCC .return 
    STZ.W $1997,X 
    TXA 
    BIT.W #$0002 
    BNE + 
    PHX 
    LDA.W #$0029 : JSL.L QueueSound_Lib2_Max6 
    PLX 

  + LDA.W $1A4B,X : STA.B $12 
    LDA.W $1A93,X : STA.B $14 
    LDA.W #$0015 
    LDY.W #EnemyProjectile_MiscDust 
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics 
    LDA.W #$0025 : JSL.L QueueSound_Lib2_Max6 

.return:
    RTS 


  .accelerationDelta
; X acceleration delta (unit 1/10000h px/frame^3)
    dw $0000,$0000,$0FF0,$0EE0,$0CC0,$0AA0,$0880,$0660 
    dw $0440,$0220,$0FF0,$0EE0,$0CC0,$0AA0,$0880,$0660 
    dw $0440,$0220 

  .maxAcceleration
; Max X acceleration (unit 1/10000h px/frame^2)
    dw $0000,$0000,$FF00,$EE00,$CC00,$AA00,$8800,$6600 
    dw $4400,$2200,$FF00,$EE00,$CC00,$AA00,$8800,$6600 
    dw $4400,$2200 

  .maxVelocity
; Max X velocity (unit 1/100h px/frame)
    dw $0000,$0000,$0004,$0004,$0003,$0003,$0002,$0002 
    dw $0001,$0001,$0006,$0005,$0004,$0003,$0002,$0002 
    dw $0001,$0001 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_MoveEnemyProjectileUpFor6FramesThenDelete_86922F:
    LDA.W $0B64,X 
    LDA.W #$0001 : STA.W $1B8F,X 
    LDA.W #UNUSED_InstList_EnemyProj_CrocomireBridgeCrumbling_868FFB : STA.W $1B47,X 
    LDA.W #UNUSED_PreInstruction_EnemyProjectile_MovingUp_869259 : STA.W $1A03,X 
    LDA.W #$0000 : STA.W $1AB7,X 
    LDA.W #$0002 : STA.W $1ADB,X 
    LDA.W #$0006 : STA.W $1AFF,X 
    STA.W $1B23,X 

UNUSED_PreInstruction_EnemyProjectile_MovingUp_869259:
    LDA.W $1A93,X : SEC : SBC.W $1ADB,X : STA.W $1A93,X 
    LDA.W $1AFF,X 
    DEC A 
    STA.W $1AFF,X 
    BNE .return 
    STZ.W $1997,X 

.return:
    RTS 
endif ; !FEATURE_KEEP_UNREFERENCED


Instruction_SpawnEnemyDropsWithCrocomiresDropChances:
    PHY : PHX 
    LDA.W $1A4B,X : STA.B $12 
    LDA.W $1A93,X : STA.B $14 
    LDA.W #EnemyHeaders_Crocomire : JSL.L Spawn_Enemy_Drops 
    PLX : PLY 
    RTS 


InitAI_EnemyProjectile_CrocomireBridgeCrumbling:
    PHX 
    LDX.W $0E54 
    LDA.W $1993 : STA.W $1A4B,Y 
    LDA.W #$00BB : STA.W $1A93,Y 
    LDA.W #$0000 : STA.W $1A6F,Y 
    STA.W $1A27,Y 
    LDA.W #$0000 : STA.W $1AB7,Y 
    LDA.W $05E5 : AND.W #$003F 
    CLC : ADC.W #$0040 : STA.W $1ADB,Y 
    LDA.W #$0400 : STA.W $19BB,Y 
    PLX 
    RTS 


PreInstruction_EnemyProjectile_CrocomireBridgeCrumbling:
    PHP 
    REP #$20 
    JSR.W Move_EnemyProjectile_Vertically 
    BCS .delete 
    LDA.W $1ADB,X : CLC : ADC.W #$0018 : AND.W #$3FFF 
    STA.W $1ADB,X 
    PLP 
    RTS 


.delete:
    STZ.W $1997,X 
    PLP 
    RTS 


Move_EnemyProjectile_AccordingToVelocity:
    LDA.W $1AB7,X 
    SEP #$20 
    CLC : ADC.W $1A28,X : STA.W $1A28,X 
    REP #$20 
    AND.W #$FF00 
    XBA 
    BPL + 
    ORA.W #$FF00 

  + ADC.W $1A4B,X : STA.W $1A4B,X 

Move_EnemyProjectile_Vertically_AccordingToVelocity:
    LDA.W $1ADB,X 
    SEP #$20 
    CLC : ADC.W $1A70,X : STA.W $1A70,X 
    REP #$20 
    AND.W #$FF00 
    XBA 
    BPL + 
    ORA.W #$FF00 

  + ADC.W $1A93,X : STA.W $1A93,X 
    RTS 


Move_EnemyProjectile_Horizontally_AccordingToVelocity:
    LDA.W $1AB7,X 
    SEP #$20 
    CLC : ADC.W $1A28,X : STA.W $1A28,X 
    REP #$20 
    AND.W #$FF00 
    XBA 
    BPL + 
    ORA.W #$FF00 

  + ADC.W $1A4B,X : STA.W $1A4B,X 
    RTS 


Set_RidleysFireball_Afterburn_Damage:
    LDA.W $079F : CMP.W #$0002 : BEQ .norfair 
    CMP.W #$0005 : BEQ .tourian 
    LDA.W $0000,X : BRA .store 


.tourian:
    LDA.W $0004,X : BRA .store 


.norfair:
    LDA.W $0002,X 

.store:
    STA.W $1BD7,Y 
    RTS 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_InitAI_EnemyProj_RidleysFireball_Afterburn_86934D:
    LDA.W #$0000 : STA.W $1AFF,Y 
    STA.W $1B23,Y 
    LDA.W $0F7A : CLC : ADC.W #$FFE3 : STA.W $1A4B,Y 
    LDA.W $0F7E : CLC : ADC.W #$FFDD : STA.W $1A93,Y 
    LDA.W #$0A00 : STA.W $19BB,Y 
    LDA.W $0FB4 
    ASL A 
    TAX 
    LDA.W .Xvelocity,X : STA.W $1AB7,Y 
    LDA.W .Yvelocity,X : STA.W $1ADB,Y 
    RTS 

.Xvelocity:
    dw $FE00,$FE10,$FE44,$FE96 

.Yvelocity:
    dw $0000,$0088,$00FC,$016A 


UNUSED_PreInst_EnemyProj_RidleyFireball_Afterburn_869392:
    LDA.W $1AFF,X : CMP.W #$0008 : BCS .greaterThan8 
    INC.W $1AFF,X 
    RTS 


.greaterThan8:
    JSR.W Move_EnemyProjectile_AccordingToVelocity 
    JSR.W Move_EnemyProjectile_Vertically 
    BCS .collision 
    RTS 


.collision:
    LDA.W #InstList_EnemyProjectile_Afterburn_Final : STA.W $1B47,X 
    INC.W $1AFF,X 
    LDA.W #$0001 : STA.W $1B8F,X 
    STZ.W $1AB7,X 
    STZ.W $1ADB,X 
    LDA.W #$0A00 : STA.W $19BB,X 
    LDA.W #$002B : JSL.L QueueSound_Lib2_Max6 
    RTS 
endif ; !FEATURE_KEEP_UNREFERENCED


InitAI_EnemyProjectile_RidleyFireball:
    LDA.W $1995 : STA.W $1B23,Y 
    LDA.W $1993 : BNE .right 
    LDA.W #$FFE7 : BRA + 


.right:
    LDA.W #$0019 

  + CLC : ADC.W $0F7A : STA.W $1A4B,Y 
    LDA.W #$FFD5 : CLC : ADC.W $0F7E : STA.W $1A93,Y 
    LDA.W #$0A00 : STA.W $19BB,Y 
    LDA.L $7E7832 : STA.W $1AB7,Y 
    LDA.L $7E7834 : STA.W $1ADB,Y 

Set_RidleyFireball_Afterburn_Properties:
    LDX.W #EnemyProjectile_PropertyValues_default 
    JMP.W Set_RidleysFireball_Afterburn_Damage 


EnemyProjectile_PropertyValues:
  .default
    dw $5003 
  .norfair
    dw $503C 
  .tourian
    dw $5050 

PreInstruction_EnemyProjectile_RidleyFireball:
    JSR.W Move_EnemyProjectile_Horizontally 
    BCS .hitWall 
    JSR.W Move_EnemyProjectile_Vertically 
    BCS .collision 
    RTS 


.collision:
    LDY.W #EnemyProjectile_RidleyHorizontalAfterburn_Center 
    BRA .merge 


.hitWall:
    LDY.W #EnemyProjectile_RidleyVerticalAfterburn_Center 

.merge:
    STZ.W $1997,X 
    LDA.W $1B23,X : BNE .return 
    LDA.W $1A4B,X : STA.B $12 
    LDA.W $1A93,X : STA.B $14 
    LDA.W #$0003 : JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics 
    LDA.W #$002B : JSL.L QueueSound_Lib2_Max6 

.return:
    RTS 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_DoFireballDamageToSamus_TurnIntoSmoke_869442:
    LDA.W #UNUSED_InstList_Smoke_86945F : STA.W $1B47,X 
    LDA.W #$0001 : STA.W $1B8F,X 
    LDA.W #$0003 
    LDY.W $079F 
    CPY.W #$0002 : BNE .gotoHurtSamus 
    LDA.W #$003C 

.gotoHurtSamus:
    JMP.W Hurt_Samus 


UNUSED_InstList_Smoke_86945F:
    dw UNUSED_Instruction_DisableCollisionsWithSamus_869475 
    dw Instruction_EnemyProjectile_ClearPreInstruction 
    dw $0008,EnemyProjSpritemaps_Common_Smoke_0 
    dw $0008,EnemyProjSpritemaps_Common_Smoke_1 
    dw $0008,EnemyProjSpritemaps_Common_Smoke_2 
    dw $0008,EnemyProjSpritemaps_Common_Smoke_3 
    dw Instruction_EnemyProjectile_Delete 

UNUSED_Instruction_DisableCollisionsWithSamus_869475:
    LDA.W $1BD7,X : ORA.W #$2000 : STA.W $1BD7,X 
    RTS 
endif ; !FEATURE_KEEP_UNREFERENCED


InitAI_EnemyProjectile_Afterburn_Center:
    TYX 
    LDA.W #$0A00 : STA.W $19BB,X 
    LDA.B $12 : STA.W $1A4B,X 
    LDA.B $14 : STA.W $1A93,X 
    LDA.W $1993 : STA.W $1AFF,X 
    STZ.W $1B23,X 
    STZ.W $1AB7,X 
    STZ.W $1ADB,X 
    RTS 


InitAI_EnemyProjectile_VerticalAfterburn_Up:
    LDX.W $1993 
    LDA.W #$0000 : STA.W $1AB7,Y 
    LDA.W #$F200 : STA.W $1ADB,Y 
    LDA.W #EnemyProjectile_RidleyVerticalAfterburn_Up : BRA InitAI_EnemyProjectile_Afterburn_Common 


InitAI_EnemyProjectile_VerticalAfterburn_Down:
    LDX.W $1993 
    LDA.W #$0000 : STA.W $1AB7,Y 
    LDA.W #$0E00 : STA.W $1ADB,Y 
    LDA.W #EnemyProjectile_RidleyVerticalAfterburn_Down : BRA InitAI_EnemyProjectile_Afterburn_Common 


InitAI_EnemyProjectile_HorizontalAfterburn_Right:
    LDX.W $1993 
    LDA.W #$0E00 : STA.W $1AB7,Y 
    LDA.W #$0000 : STA.W $1ADB,Y 
    LDA.W #EnemyProjectile_RidleyHorizontalAfterburn_Right : BRA InitAI_EnemyProjectile_Afterburn_Common 


InitAI_EnemyProjectile_HorizontalAfterburn_Left:
    LDX.W $1993 
    LDA.W #$F200 : STA.W $1AB7,Y 
    LDA.W #$0000 : STA.W $1ADB,Y 
    LDA.W #EnemyProjectile_RidleyHorizontalAfterburn_Left 

InitAI_EnemyProjectile_Afterburn_Common:
    STA.W $1B23,Y 
    LDA.W $1A4B,X : STA.W $1A4B,Y 
    LDA.W $1A93,X : STA.W $1A93,Y 
    LDA.W $1AFF,X : STA.W $1AFF,Y 
    LDA.W #$0A00 : STA.W $19BB,Y 
    JMP.W Set_RidleyFireball_Afterburn_Properties 


RTS_86950C:
    RTS 


PreInstruction_EnemyProjectile_HorizontalAfterburn:
    JSR.W Move_EnemyProjectile_Horizontally_AccordingToVelocity 
    JSR.W Move_EnemyProjectile_Vertically 
    BCC .return 
    LDA.W #InstList_EnemyProjectile_Afterburn_Final : STA.W $1B47,X 
    LDA.W #$0001 : STA.W $1B8F,X 

.return:
    RTS 


PreInstruction_EnemyProjectile_VerticalAfterburn:
    JSR.W Move_EnemyProjectile_Vertically_AccordingToVelocity 
    JSR.W Move_EnemyProjectile_Horizontally 
    BCC .return 
    LDA.W #InstList_EnemyProjectile_Afterburn_Final : STA.W $1B47,X 
    LDA.W #$0001 : STA.W $1B8F,X 

.return:
    RTS 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_PreInstruction_ProtoHorizontalAfterburn_869537:
    JSR.W Move_EnemyProjectile_Horizontally 
    BCC .return 
    STZ.W $1997,X 

.return:
    RTS 


UNUSED_PreInstruction_ProtoVerticalAfterburn_Up_869540:
    JSR.W Move_EnemyProjectile_Vertically 
    BCC .return 
    STZ.W $1997,X 

.return:
    RTS 


UNUSED_PreInstruction_ProtoVerticalAfterburn_Down_869549:
    JSR.W Move_EnemyProjectile_Vertically 
    BCC .return 
    STZ.W $1997,X 

.return:
    RTS 
endif ; !FEATURE_KEEP_UNREFERENCED


InstList_EnemyProjectile_RidleysFireball_0:
    dw Instruction_EnemyProjectile_ClearPreInstruction 
    dw $0004,EnemyProjSpritemaps_RidleysFireball_0 
    dw Instruction_EnemyProjectile_PreInstructionInY 
    dw PreInstruction_EnemyProjectile_RidleyFireball 
    dw $0004,EnemyProjSpritemaps_RidleysFireball_0 

InstList_EnemyProjectile_RidleysFireball_1:
    dw $0002,EnemyProjSpritemaps_RidleysFireball_0 
    dw $0002,EnemyProjSpritemaps_RidleysFireball_1 
    dw $0002,EnemyProjSpritemaps_RidleysFireball_2 
    dw $0002,EnemyProjSpritemaps_RidleysFireball_3 
    dw Instruction_EnemyProjectile_GotoY 
    dw InstList_EnemyProjectile_RidleysFireball_1 

InstList_EnemyProjectile_Afterburn_Final:
    dw Instruction_EnemyProjectile_ClearPreInstruction 
    dw $0005,EnemyProjSpritemaps_RidleysFireball_MBBombExplosion_0 
    dw $0005,EnemyProjSpritemaps_RidleysFireball_MBBombExplosion_1 
    dw $0005,EnemyProjSpritemaps_RidleysFireball_MBBombExplosion_2 
    dw $0005,EnemyProjSpritemaps_RidleysFireball_MBBombExplosion_3 
    dw $0005,EnemyProjSpritemaps_RidleysFireball_MBBombExplosion_4 
    dw Instruction_EnemyProjectile_Delete 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_InstList_EnemyProjectile_86958C:
    dw $0002,UNUSED_EnemyProjSpritemaps_0_8D80AE 
    dw $0002,UNUSED_EnemyProjSpritemaps_1_8D80B5 
    dw $0002,UNUSED_EnemyProjSpritemaps_2_8D80BC 
    dw $0002,UNUSED_EnemyProjSpritemaps_3_8D80C3 
    dw Instruction_EnemyProjectile_GotoY 
    dw UNUSED_InstList_EnemyProjectile_86958C 
endif ; !FEATURE_KEEP_UNREFERENCED

InstList_EnemyProjectile_HorizontalAfterburn_Center:
    dw Instruction_EnemyProjectile_ClearPreInstruction 
    dw $0005,EnemyProjSpritemaps_RidleysFireball_MBBombExplosion_0 
    dw Instruction_Spawn_HorizontalAfterburn_EnemyProjectiles 
    dw $0005,EnemyProjSpritemaps_RidleysFireball_MBBombExplosion_1 
    dw $0005,EnemyProjSpritemaps_RidleysFireball_MBBombExplosion_2 
    dw $0005,EnemyProjSpritemaps_RidleysFireball_MBBombExplosion_3 
    dw $0005,EnemyProjSpritemaps_RidleysFireball_MBBombExplosion_4 
    dw Instruction_EnemyProjectile_Delete 

Instruction_Spawn_HorizontalAfterburn_EnemyProjectiles:
    PHY 
    STZ.W $1995 
    TXA 
    LDY.W #EnemyProjectile_RidleyHorizontalAfterburn_Right 
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics 
    STZ.W $1995 
    TXA 
    LDY.W #EnemyProjectile_RidleyHorizontalAfterburn_Left 
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics 
    PLY 
    RTS 


InstList_EnemyProjectile_VerticalAfterburn_Center:
    dw Instruction_EnemyProjectile_ClearPreInstruction 
    dw $0005,EnemyProjSpritemaps_RidleysFireball_MBBombExplosion_0 
    dw Instruction_Spawn_VerticalAfterburn_EnemyProjectiles 
    dw $0005,EnemyProjSpritemaps_RidleysFireball_MBBombExplosion_1 
    dw $0005,EnemyProjSpritemaps_RidleysFireball_MBBombExplosion_2 
    dw $0005,EnemyProjSpritemaps_RidleysFireball_MBBombExplosion_3 
    dw $0005,EnemyProjSpritemaps_RidleysFireball_MBBombExplosion_4 
    dw Instruction_EnemyProjectile_Delete 

Instruction_Spawn_VerticalAfterburn_EnemyProjectiles:
    PHY 
    STZ.W $1995 
    TXA 
    LDY.W #EnemyProjectile_RidleyVerticalAfterburn_Up 
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics 
    STZ.W $1995 
    TXA 
    LDY.W #EnemyProjectile_RidleyVerticalAfterburn_Down 
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics 
    PLY 
    RTS 


InstList_EnemyProjectile_Afterburn:
    dw Instruction_EnemyProjectile_ClearPreInstruction 
    dw $0005,EnemyProjSpritemaps_RidleysFireball_MBBombExplosion_0 
    dw Instruction_SpawnNext_Afterburn_EnemyProjectile 
    dw $0005,EnemyProjSpritemaps_RidleysFireball_MBBombExplosion_1 
    dw $0005,EnemyProjSpritemaps_RidleysFireball_MBBombExplosion_2 
    dw $0005,EnemyProjSpritemaps_RidleysFireball_MBBombExplosion_3 
    dw $0005,EnemyProjSpritemaps_RidleysFireball_MBBombExplosion_4 
    dw Instruction_EnemyProjectile_Delete 

Instruction_SpawnNext_Afterburn_EnemyProjectile:
    SEP #$20 
    DEC.W $1AFF,X 
    REP #$20 
    BMI .return 
    PHY 
    TXA 
    LDY.W $1B23,X 
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics 
    PLY 

.return:
    RTS 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_EnemyProjectile_Ridley_869634:
    dw UNUSED_InitAI_EnemyProj_RidleysFireball_Afterburn_86934D ; Initialisation AI
    dw UNUSED_PreInst_EnemyProj_RidleyFireball_Afterburn_869392 ; Initial pre-instruction
    dw InstList_EnemyProjectile_RidleysFireball_0 ; Initial instruction list
    db $06,$06 ; X/Y radius
    dw $1003 ; Properties
    dw $0000 ; Hit instruction list
    dw InstList_EnemyProjectile_Delete ; Shot instruction list
endif ; !FEATURE_KEEP_UNREFERENCED

EnemyProjectile_RidleysFireball:
    dw InitAI_EnemyProjectile_RidleyFireball ; Initialisation AI
    dw PreInstruction_EnemyProjectile_RidleyFireball ; Initial pre-instruction
    dw InstList_EnemyProjectile_RidleysFireball_0 ; Initial instruction list
    db $06,$06 ; X/Y radius
    dw $5003 ; Properties
    dw $0000 ; Hit instruction list
    dw InstList_EnemyProjectile_Delete ; Shot instruction list

EnemyProjectile_RidleyHorizontalAfterburn_Center:
    dw InitAI_EnemyProjectile_Afterburn_Center ; Initialisation AI
    dw RTS_86950C ; Initial pre-instruction
    dw InstList_EnemyProjectile_HorizontalAfterburn_Center ; Initial instruction list
    db $06,$06 ; X/Y radius
    dw $5003 ; Properties
    dw $0000 ; Hit instruction list
    dw InstList_EnemyProjectile_Delete ; Shot instruction list

EnemyProjectile_RidleyVerticalAfterburn_Center:
    dw InitAI_EnemyProjectile_Afterburn_Center ; Initialisation AI
    dw RTS_86950C ; Initial pre-instruction
    dw InstList_EnemyProjectile_VerticalAfterburn_Center ; Initial instruction list
    db $06,$06 ; X/Y radius
    dw $5003 ; Properties
    dw $0000 ; Hit instruction list
    dw InstList_EnemyProjectile_Delete ; Shot instruction list

EnemyProjectile_RidleyHorizontalAfterburn_Right:
    dw InitAI_EnemyProjectile_HorizontalAfterburn_Right ; Initialisation AI
    dw PreInstruction_EnemyProjectile_HorizontalAfterburn ; Initial pre-instruction
    dw InstList_EnemyProjectile_Afterburn ; Initial instruction list
    db $06,$06 ; X/Y radius
    dw $5003 ; Properties
    dw $0000 ; Hit instruction list
    dw InstList_EnemyProjectile_Delete ; Shot instruction list

EnemyProjectile_RidleyHorizontalAfterburn_Left:
    dw InitAI_EnemyProjectile_HorizontalAfterburn_Left ; Initialisation AI
    dw PreInstruction_EnemyProjectile_HorizontalAfterburn ; Initial pre-instruction
    dw InstList_EnemyProjectile_Afterburn ; Initial instruction list
    db $06,$06 ; X/Y radius
    dw $5003 ; Properties
    dw $0000 ; Hit instruction list
    dw InstList_EnemyProjectile_Delete ; Shot instruction list

EnemyProjectile_RidleyVerticalAfterburn_Up:
    dw InitAI_EnemyProjectile_VerticalAfterburn_Up ; Initialisation AI
    dw PreInstruction_EnemyProjectile_VerticalAfterburn ; Initial pre-instruction
    dw InstList_EnemyProjectile_Afterburn ; Initial instruction list
    db $06,$06 ; X/Y radius
    dw $5003 ; Properties
    dw $0000 ; Hit instruction list
    dw InstList_EnemyProjectile_Delete ; Shot instruction list

EnemyProjectile_RidleyVerticalAfterburn_Down:
    dw InitAI_EnemyProjectile_VerticalAfterburn_Down ; Initialisation AI
    dw PreInstruction_EnemyProjectile_VerticalAfterburn ; Initial pre-instruction
    dw InstList_EnemyProjectile_Afterburn ; Initial instruction list
    db $06,$06 ; X/Y radius
    dw $5003 ; Properties
    dw $0000 ; Hit instruction list
    dw InstList_EnemyProjectile_Delete ; Shot instruction list

if !FEATURE_KEEP_UNREFERENCED
UNUSED_EnemyProjectile_RidleyProtoHorizontalAfterburn_8696A4:
    dw InitAI_EnemyProjectile_HorizontalAfterburn_Right ; Initialisation AI
    dw UNUSED_PreInstruction_ProtoHorizontalAfterburn_869537 ; Initial pre-instruction
    dw InstList_EnemyProjectile_Afterburn ; Initial instruction list
    db $06,$06 ; X/Y radius
    dw $5003 ; Properties
    dw $0000 ; Hit instruction list
    dw InstList_EnemyProjectile_Delete ; Shot instruction list

UNUSED_EnemyProjectile_RidleyProtoHorizontalAfterburn_8696B2:
    dw InitAI_EnemyProjectile_HorizontalAfterburn_Left ; Initialisation AI
    dw UNUSED_PreInstruction_ProtoHorizontalAfterburn_869537 ; Initial pre-instruction
    dw InstList_EnemyProjectile_Afterburn ; Initial instruction list
    db $06,$06 ; X/Y radius
    dw $5003 ; Properties
    dw $0000 ; Hit instruction list
    dw InstList_EnemyProjectile_Delete ; Shot instruction list

UNUSED_EnemyProjectile_RidleyProtoVerticalAfterburn_8696C0:
    dw InitAI_EnemyProjectile_VerticalAfterburn_Up ; Initialisation AI
    dw UNUSED_PreInstruction_ProtoVerticalAfterburn_Up_869540 ; Initial pre-instruction
    dw InstList_EnemyProjectile_Afterburn ; Initial instruction list
    db $06,$06 ; X/Y radius
    dw $5003 ; Properties
    dw $0000 ; Hit instruction list
    dw InstList_EnemyProjectile_Delete ; Shot instruction list

UNUSED_EnemyProjectile_RidleyProtoVerticalAfterburn_8696CE:
    dw InitAI_EnemyProjectile_VerticalAfterburn_Down ; Initialisation AI
    dw UNUSED_PreInstruction_ProtoVerticalAfterburn_Down_869549 ; Initial pre-instruction
    dw InstList_EnemyProjectile_Afterburn ; Initial instruction list
    db $06,$06 ; X/Y radius
    dw $5003 ; Properties
    dw $0000 ; Hit instruction list
    dw InstList_EnemyProjectile_Delete ; Shot instruction list
endif ; !FEATURE_KEEP_UNREFERENCED

InitAI_EnemyProjectile_CeresFallingTile:
    LDA.W #$0000 : STA.W $1AFF,Y 
    STA.W $1B23,Y 
    STA.W $1AB7,Y 
    LDA.W #$0E00 : STA.W $19BB,Y 
    LDA.W $1993 : STA.W $1A4B,Y 
    LDA.W #$002A : STA.W $1A93,Y 
    LDA.W #$0010 : STA.W $1ADB,Y 
    RTS 


PreInstruction_EnemyProjectile_CeresFallingTile:
    LDA.W #$0010 : CLC : ADC.W $1ADB,X : STA.W $1ADB,X 
    JSR.W Move_EnemyProjectile_Vertically 
    BCS .collision 
    RTS 


.collision:
    STZ.W $1997,X 
    LDA.W $1A4B,X : STA.B $12 
    LDA.W $1A93,X : CLC : ADC.W #$0000 : STA.B $14 
    LDA.W #$0009 
    LDY.W #EnemyProjectile_MiscDust 
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics 
    LDA.W #$006D : JSL.L QueueSound_Lib2_Max6 
    RTS 


EnemyProjectile_CeresFallingTile_Light:
    dw InitAI_EnemyProjectile_CeresFallingTile ; Initialisation AI
    dw PreInstruction_EnemyProjectile_CeresFallingTile ; Initial pre-instruction
    dw InstList_EnemyProjectile_CeresFallingTile_Light ; Initial instruction list
    db $08,$08 ; X/Y radius
    dw $4000 ; Properties
    dw $0000 ; Hit instruction list
    dw InstList_EnemyProjectile_Delete ; Shot instruction list

EnemyProjectile_CeresFallingTile_Dark:
    dw InitAI_EnemyProjectile_CeresFallingTile ; Initialisation AI
    dw PreInstruction_EnemyProjectile_CeresFallingTile ; Initial pre-instruction
    dw InstList_EnemyProjectile_CeresFallingTile_Dark ; Initial instruction list
    db $08,$08 ; X/Y radius
    dw $4000 ; Properties
    dw $0000 ; Hit instruction list
    dw InstList_EnemyProjectile_Delete ; Shot instruction list

InstList_EnemyProjectile_CeresFallingTile_Light:
    dw $0001,EnemyProjSpritemaps_CeresFallingTile_Light 
    dw Instruction_EnemyProjectile_Sleep 

InstList_EnemyProjectile_CeresFallingTile_Dark:
    dw $0001,EnemyProjSpritemaps_CeresFallingTile_Dark 
    dw Instruction_EnemyProjectile_Sleep 

InstList_EnemyProjectile_PhantoonDestroyableFlame_Idle:
    dw $0005,EnemyProjSpritemaps_PhantoonFlames_0 
    dw $0005,EnemyProjSpritemaps_PhantoonFlames_1 
    dw $0005,EnemyProjSpritemaps_PhantoonFlames_2 
    dw Instruction_EnemyProjectile_GotoY 
    dw InstList_EnemyProjectile_PhantoonDestroyableFlame_Idle 

InstList_EnemyProj_PhantoonDestroyableFlame_Casual_HitGround:
    dw $0001,EnemyProjSpritemaps_PhantoonFlames_3 
    dw Instruction_EnemyProjectile_Sleep 

InstList_EnemyProj_PhantoonDestroyableFlame_Casual_Bouncing:
    dw $0005,EnemyProjSpritemaps_PhantoonFlames_0 
    dw $0005,EnemyProjSpritemaps_PhantoonFlames_1 
    dw $0005,EnemyProjSpritemaps_PhantoonFlames_2 
    dw Instruction_EnemyProjectile_GotoY 
    dw InstList_EnemyProj_PhantoonDestroyableFlame_Casual_Bouncing 

InstList_EnemyProj_PhantoonDestroyableFlame_Casual_Resetting:
    dw $0005,EnemyProjSpritemaps_PhantoonStartingFlames_0 
    dw $0005,EnemyProjSpritemaps_PhantoonStartingFlames_1 
    dw $0005,EnemyProjSpritemaps_PhantoonStartingFlames_2 
    dw $0005,EnemyProjSpritemaps_PhantoonStartingFlames_3 
    dw $0005,EnemyProjSpritemaps_PhantoonStartingFlames_4 
    dw $0005,EnemyProjSpritemaps_PhantoonStartingFlames_5 

InstList_EnemyProj_PhantoonDestroyableFlame_Dying:
    dw $0005,EnemyProjSpritemaps_PhantoonFlames_4 
    dw $0005,EnemyProjSpritemaps_PhantoonFlames_5 
    dw $0005,EnemyProjSpritemaps_PhantoonFlames_6 
    dw $0005,EnemyProjSpritemaps_PhantoonFlames_7 
    dw Instruction_EnemyProjectile_Delete 

InstList_EnemyProj_PhantoonDestroyableFlame_Rain_Falling:
    dw $0008,EnemyProjSpritemaps_PhantoonFlames_3 
    dw Instruction_EnemyProjectile_GotoY 
    dw InstList_EnemyProj_PhantoonDestroyableFlame_Dying 

InstList_EnemyProj_PhantoonDestroyableFlame_Casual_Falling_0:
    dw Instruction_EnemyProjectile_TimerInY,$0004 

InstList_EnemyProj_PhantoonDestroyableFlame_Casual_Falling_1:
    dw $0001,EnemyProjSpritemaps_PhantoonFlames_8 
    dw $0001,EnemyProjSpritemaps_Blank_Default 
    dw Instruction_EnemyProjectile_DecrementTimer_GotoYIfNonZero 
    dw InstList_EnemyProj_PhantoonDestroyableFlame_Casual_Falling_1 
    dw Instruction_EnemyProjectile_TimerInY,$0004 

InstList_EnemyProj_PhantoonDestroyableFlame_Casual_Falling_2:
    dw $0001,EnemyProjSpritemaps_PhantoonFlames_9 
    dw $0001,EnemyProjSpritemaps_Blank_Default 
    dw Instruction_EnemyProjectile_DecrementTimer_GotoYIfNonZero 
    dw InstList_EnemyProj_PhantoonDestroyableFlame_Casual_Falling_2 
    dw Instruction_EnemyProjectile_TimerInY,$0004 

InstList_EnemyProj_PhantoonDestroyableFlame_Casual_Falling_3:
    dw $0001,EnemyProjSpritemaps_PhantoonFlames_A 
    dw $0001,EnemyProjSpritemaps_Blank_Default 
    dw Instruction_EnemyProjectile_DecrementTimer_GotoYIfNonZero 
    dw InstList_EnemyProj_PhantoonDestroyableFlame_Casual_Falling_3 
    dw Instruction_EnemyProjectile_GotoY 
    dw InstList_EnemyProj_PhantoonDestroyableFlame_Casual_Falling_0 

InstList_EnemyProjectile_PhantoonStartingFlames:
    dw $0005,EnemyProjSpritemaps_PhantoonFlames_8 
    dw $0005,EnemyProjSpritemaps_PhantoonFlames_9 
    dw $0005,EnemyProjSpritemaps_PhantoonFlames_A 
    dw Instruction_EnemyProjectile_GotoY 
    dw InstList_EnemyProjectile_PhantoonStartingFlames 

InstList_EnemyProjectile_PhantoonDestroyableFlame_Delete:
    dw Instruction_EnemyProjectile_Delete 

InstList_EnemyProjectile_Shot_PhantoonDestroyableFlames:
    dw $0005,EnemyProjSpritemaps_PhantoonFlames_4 
    dw $0005,EnemyProjSpritemaps_PhantoonFlames_5 
    dw $0005,EnemyProjSpritemaps_PhantoonFlames_6 
    dw $0005,EnemyProjSpritemaps_PhantoonFlames_7 
    dw Instruction_SpawnPhantoonDrop 
    dw Instruction_EnemyProjectile_Delete 

Instruction_SpawnPhantoonDrop:
    PHY : PHX 
    LDA.W $1A4B,X : STA.B $12 
    LDA.W $1A93,X : STA.B $14 
    LDA.W #EnemyHeaders_PhantoonEye : JSL.L Spawn_Enemy_Drops 
    PLX : PLY 
    RTS 


InitAI_EnemyProjectile_PhantoonDestroyableFlames:
    PHP 
    REP #$30 
    LDA.W $1993 : AND.W #$FF00 
    XBA 
    TAX 
    JMP.W (.pointers,X) 


.pointers:
    dw PhantoonDestroyableFlameInit_Type0_Casual 
    dw PhantoonDestroyableFlameInit_Type2_Enraged 
    dw PhantoonDestroyableFlameInit_Type4_Rain 
    dw PhantoonDestroyableFlameInit_Type6_Spiral 

PhantoonDestroyableFlameInit_Type0_Casual:
    LDA.W #$0000 : STA.W $1A27,Y 
    STA.W $1A6F,Y 
    STA.W $1AB7,Y 
    STA.W $1ADB,Y 
    LDA.W $0F7A : STA.W $1A4B,Y 
    LDA.W $0F7E : CLC : ADC.W #$0020 : STA.W $1A93,Y 
    LDA.W #InstList_EnemyProj_PhantoonDestroyableFlame_Casual_Falling_0 : STA.W $1B47,Y 
    LDA.W $1BD7,Y : AND.W #$0FFF 
    ORA.W #$2000 
    STA.W $1BD7,Y 
    PLP 
    RTS 


PhantoonDestroyableFlameInit_Type2_Enraged:
    LDA.W #$0000 : STA.W $1A27,Y 
    STA.W $1A6F,Y 
    STA.W $1ADB,Y 
    LDA.W $1993 : AND.W #$00FF 
    TAX 
    CPX.W #$0008 : BPL .greaterThan7 
    LDA.W #$0002 : STA.W $1AB7,Y 
    BRA + 


.greaterThan7:
    LDA.W #$FFFE : STA.W $1AB7,Y 

  + LDA.W .angles,X : AND.W #$00FF : STA.W $1AFF,Y 
    LDA.W $0F7A : STA.W $1A4B,Y 
    LDA.W $0F7E : CLC : ADC.W #$0020 : STA.W $1A93,Y 
    LDA.W #PreInst_EnemyProj_PhantoonDestroyableFlame_Enraged : STA.W $1A03,Y 
    PLP 
    RTS 


.angles: 
    db $10,$20,$30,$40,$50,$60,$70,$80
    db $F0,$E0,$D0,$C0,$B0,$A0,$90,$80

PhantoonDestroyableFlameInit_Type4_Rain:
    LDA.W #$0000 : STA.W $1A27,Y 
    STA.W $1A6F,Y 
    STA.W $1ADB,Y 
    LDA.W $1993 
    PHA 
    AND.W #$000F 
    TAX 
    PLA 
    AND.W #$00F0 
    LSR A 
    STA.W $1AB7,Y 
    LDA.W .XPositions,X : AND.W #$00FF : STA.W $1A4B,Y 
    LDA.W #$0028 : STA.W $1A93,Y 
    LDA.W #PreInst_EnemyProj_PhantoonDestroyableFlame_Rain : STA.W $1A03,Y 
    PLP 
    RTS 


.XPositions:
    db $30,$44,$58,$6C,$80,$94,$A8,$BC,$D0 

PhantoonDestroyableFlameInit_Type6_Spiral:
    LDA.W #$0000 : STA.W $1A27,Y 
    STA.W $1A6F,Y 
    STA.W $1ADB,Y 
    LDA.W #$0080 : STA.W $1AB7,Y 
    LDA.W $1993 : AND.W #$00FF 
    TAX 
    LDA.W PhantoonFlameAngles,X : AND.W #$00FF : STA.W $1AFF,Y 
    LDA.W $0F7A : STA.W $1A4B,Y 
    LDA.W $0F7E : CLC : ADC.W #$0010 : STA.W $1A93,Y 
    LDA.W #PreInst_EnemyProj_PhantoonDestroyableFlame_Spiral : STA.W $1A03,Y 
    PLP 
    RTS 


InitAI_EnemyProjectile_PhantoonStartingFlames:
    PHP 
    REP #$30 
    LDA.W #$0000 : STA.W $1A27,Y 
    STA.W $1A6F,Y 
    STA.W $1AB7,Y 
    STA.W $1ADB,Y 
    PHY 
    LDX.W $1993 
    LDA.W PhantoonFlameAngles,X : AND.W #$00FF : STA.W $1AFF,Y 
    TAY 
    LDA.W #$0030 : JSR.W Calculate_XY_ComponentsOf_RadiusA_AngleY 
    PLY 
    LDA.W $0F7A : CLC : ADC.B $14 : STA.W $1A4B,Y 
    LDA.W $0F7E : CLC : ADC.W #$0010 : CLC : ADC.B $16 : STA.W $1A93,Y 
    PLP 
    RTS 


PhantoonFlameAngles:
    db $00,$20,$40,$60,$80,$A0,$C0,$E0 

PreInst_EnemyProj_PhantoonDestroyableFlame_Casual_Falling:
    LDA.W $1ADB,X : CLC : ADC.W #$0010 : STA.W $1ADB,X 
    JSR.W Move_EnemyProjectile_Vertically 
    BCC .return 
    LDA.W $1BD7,X : AND.W #$0FFF 
    ORA.W #$8000 
    STA.W $1BD7,X 
    LDA.W #PreInst_EnemyProj_PhantoonDestroyableFlame_Casual_HitGround : STA.W $1A03,X 
    LDA.W #InstList_EnemyProj_PhantoonDestroyableFlame_Casual_HitGround : STA.W $1B47,X 
    LDA.W #$0001 : STA.W $1B8F,X 
    LDA.W #$0008 : STA.W $1AFF,X 
    LDA.W $1A93,X : CLC : ADC.W #$0008 : STA.W $1A93,X 

.return:
    RTS 


PreInst_EnemyProj_PhantoonDestroyableFlame_Casual_HitGround:
    DEC.W $1AFF,X 
    BEQ .timerExpired 
    BPL .return 

.timerExpired:
    LDA.W #PreInst_EnemyProj_PhantoonDestroyableFlame_Casual_Bouncing : STA.W $1A03,X 
    LDA.W #InstList_EnemyProj_PhantoonDestroyableFlame_Casual_Bouncing : STA.W $1B47,X 
    LDA.W #$0001 : STA.W $1B8F,X 
    LDA.W $1A93,X : SEC : SBC.W #$0008 : STA.W $1A93,X 
    LDA.W #$FD00 : STA.W $1ADB,X 
    STZ.W $1AFF,X 
    LDA.W $05B6 : BIT.W #$0001 
    BNE .negative 
    LDA.W #$0080 : STA.W $1AB7,X 
    RTS 


.negative:
    LDA.W #$FF80 : STA.W $1AB7,X 

.return:
    RTS 


PreInst_EnemyProj_PhantoonDestroyableFlame_Casual_Bouncing:
    LDA.W $1ADB,X : CLC : ADC.W #$0010 : STA.W $1ADB,X 
    JSR.W Move_EnemyProjectile_Vertically 
    BCC .noCollision 
    LDA.W $1AFF,X 
    INC A 
    STA.W $1AFF,X 
    CMP.W #$0003 : BPL .rest 
    ASL A 
    TAY 
    LDA.W .Yvelocity,Y : STA.W $1ADB,X 
    RTS 


.noCollision:
    JSR.W Move_EnemyProjectile_Horizontally 
    BCS .rest 
    RTS 


.rest:
    LDA.W #InstList_EnemyProj_PhantoonDestroyableFlame_Casual_Resetting : STA.W $1B47,X 
    LDA.W #$0001 : STA.W $1B8F,X 
    LDA.W #RTS_869A44 : STA.W $1A03,X 
    RTS 


.Yvelocity:
    dw $FD00,$FE00,$FF00 

RTS_869A44:
    RTS 


PreInst_EnemyProj_PhantoonDestroyableFlame_Enraged:
    LDA.W $1ADB,X : CLC : ADC.W #$0004 : STA.W $1ADB,X 
    LDA.W $1AFF,X : CLC : ADC.W $1AB7,X : AND.W #$00FF 
    STA.W $1AFF,X 
    TAY 
    LDA.W $1ADB,X : JSR.W Calculate_XY_ComponentsOf_RadiusA_AngleY 
    LDA.W $0F7A : CLC : ADC.B $14 : STA.W $1A4B,X 
    BMI + 
    CMP.W #$0100 : BPL + 
    LDA.W $0F7E : CLC : ADC.W #$0010 : CLC : ADC.B $16 : STA.W $1A93,X 
    BMI + 
    CMP.W #$0100 : BMI .return 

  + LDA.W #InstList_EnemyProjectile_PhantoonDestroyableFlame_Delete : STA.W $1B47,X 
    LDA.W #$0001 : STA.W $1B8F,X 

.return:
    RTS 


PreInst_EnemyProj_PhantoonDestroyableFlame_Rain:
    LDA.W $1AB7,X : BEQ .falling 
    DEC.W $1AB7,X 
    BEQ .playSFX 
    BPL .return 

.playSFX:
    LDA.W #$001D : JSL.L QueueSound_Lib3_Max6 

.falling:
    LDA.W $1ADB,X : CLC : ADC.W #$0010 : STA.W $1ADB,X 
    JSR.W Move_EnemyProjectile_Vertically 
    BCC .return 
    LDA.W #InstList_EnemyProj_PhantoonDestroyableFlame_Rain_Falling : STA.W $1B47,X 
    LDA.W #$0001 : STA.W $1B8F,X 
    LDA.W $1A93,X : CLC : ADC.W #$0008 : STA.W $1A93,X 
    LDA.W #RTS_869A44 : STA.W $1A03,X 
    LDA.W #$001D : JSL.L QueueSound_Lib3_Max6 

.return:
    RTS 


PreInst_EnemyProj_PhantoonDestroyableFlame_Spiral:
    LDA.W $1ADB,X : CLC : ADC.W #$0002 : STA.W $1ADB,X 
    LDA.W $1AFF,X : CLC : ADC.W #$0002 : AND.W #$00FF 
    STA.W $1AFF,X 
    TAY 
    LDA.W $1ADB,X : JSR.W Calculate_XY_ComponentsOf_RadiusA_AngleY 
    LDA.W $0F7A : CLC : ADC.B $14 : STA.W $1A4B,X 
    BMI + 
    CMP.W #$0100 : BPL + 
    LDA.W $0F7E : CLC : ADC.W #$0010 : CLC : ADC.B $16 : STA.W $1A93,X 
    BMI + 
    CMP.W #$0100 : BMI .return 

  + LDA.W #InstList_EnemyProjectile_PhantoonDestroyableFlame_Delete : STA.W $1B47,X 
    LDA.W #$0001 : STA.W $1B8F,X 

.return:
    RTS 


PreInstruction_EnemyProjectile_PhantoonStartingFlames:
    LDA.W $0FAA : BEQ .return 
    LDA.W #PreInst_EnemyProjectile_PhantoonStartingFlames_Activated : STA.W $1A03,X 
    LDA.W #$00B4 : STA.W $1AB7,X 
    LDA.W #$0030 : STA.W $1ADB,X 

.return:
    RTS 


PreInst_EnemyProjectile_PhantoonStartingFlames_Activated:
    LDA.W $1AB7,X : BEQ .timerExpired 
    DEC A 
    STA.W $1AB7,X 
    BRA + 


.timerExpired:
    LDA.W $05B6 : BIT.W #$0001 
    BEQ + 
    LDA.W $1ADB,X 
    DEC A 
    STA.W $1ADB,X 
    BEQ .delete 

  + LDA.W $1AFF,X 
    INC A 
    AND.W #$00FF 
    STA.W $1AFF,X 
    TAY 
    LDA.W $1ADB,X : JSR.W Calculate_XY_ComponentsOf_RadiusA_AngleY 
    LDA.W $0F7A : CLC : ADC.B $14 : STA.W $1A4B,X 
    LDA.W $0F7E : CLC : ADC.W #$0010 : CLC : ADC.B $16 : STA.W $1A93,X 
    RTS 


.delete:
    LDA.W $0F7A : STA.W $1A4B,X 
    LDA.W $0F7E : CLC : ADC.W #$0010 : STA.W $1A93,X 
    LDA.W #$0001 : STA.W $1B8F,X 
    LDA.W #InstList_EnemyProjectile_PhantoonDestroyableFlame_Delete : STA.W $1B47,X 
    RTS 


Calculate_XY_ComponentsOf_RadiusA_AngleY:
    PHP 
    REP #$30 
    PHX 
    STA.B $18 
    TYA 
    STA.B $1A 
    CMP.W #$0080 : BPL .greaterThan80 
    ASL A 
    TAX 
    JSR.W DoSomeMathWithSineAndPi_869BF3 
    BRA + 


.greaterThan80:
    SEC : SBC.W #$0080 : AND.W #$00FF 
    ASL A 
    TAX 
    JSR.W DoSomeMathWithSineAndPi_869BF3 
    EOR.W #$FFFF 
    INC A 

  + STA.B $14 
    LDA.B $1A : SEC : SBC.W #$0040 : AND.W #$00FF 
    CMP.W #$0080 : BPL .stillGreaterThan80 
    ASL A 
    TAX 
    JSR.W DoSomeMathWithSineAndPi_869BF3 
    BRA + 


.stillGreaterThan80:
    SEC : SBC.W #$0080 : AND.W #$00FF 
    ASL A 
    TAX 
    JSR.W DoSomeMathWithSineAndPi_869BF3 
    EOR.W #$FFFF 
    INC A 

  + STA.B $16 
    PLX : PLP 
    RTS 


DoSomeMathWithSineAndPi_869BF3:
    SEP #$20 
    LDA.L SineCosineTables_8bitSine_SignExtended,X : STA.W $4202 
    LDA.B $18 : STA.W $4203 
    NOP #3
    REP #$20 
    LDA.W $4216 
    XBA 
    AND.W #$00FF 
    STA.B $12 
    SEP #$20 
    LDA.L SineCosineTables_8bitSine_SignExtended+1,X : STA.W $4202 
    LDA.B $18 : STA.W $4203 
    NOP #3
    REP #$20 
    LDA.W $4216 : CLC : ADC.B $12 : RTS 


EnemyProjectile_PhantoonDestroyableFlames:
    dw InitAI_EnemyProjectile_PhantoonDestroyableFlames ; Initialisation AI
    dw PreInst_EnemyProj_PhantoonDestroyableFlame_Casual_Falling ; Initial pre-instruction
    dw InstList_EnemyProjectile_PhantoonDestroyableFlame_Idle ; Initial instruction list
    db $08,$10 ; X/Y radius
    dw $8028,$0000 ; Properties, Hit instruction list
    dw InstList_EnemyProjectile_Shot_PhantoonDestroyableFlames ; Shot instruction list

EnemyProjectile_PhantoonStartingFlames:
    dw InitAI_EnemyProjectile_PhantoonStartingFlames ; Initialisation AI
    dw PreInstruction_EnemyProjectile_PhantoonStartingFlames ; Initial pre-instruction
    dw InstList_EnemyProjectile_PhantoonStartingFlames ; Initial instruction list
    db $08,$10 ; X/Y radius
    dw $4028,$0000 ; Properties, Hit instruction list
    dw InstList_EnemyProjectile_PhantoonDestroyableFlame_Idle ; Shot instruction list

EnemyProjectile_KraidRockSpit:
    dw InitAI_EnemyProjectile_KraidRockSpit ; Initialisation AI
    dw PreInstruction_EnemyProjectile_KraidRocks ; Initial pre-instruction
    dw InstList_EnemyProjectile_KraidRocks_KagoBug ; Initial instruction list
    db $04,$04 ; X/Y radius
    dw $8002,$0000 ; Properties, Hit instruction list
    dw InstList_EnemyProjectile_Shot_KraidRockSpit ; Shot instruction list

EnemyProjectile_KraidCeilingRocks:
    dw Instruction_EnemyProjectile_KraidCeilingRocks ; Initialisation AI
    dw PreInstruction_EnemyProjectile_KraidCeilingRocks ; Initial pre-instruction
    dw InstList_EnemyProjectile_KraidRocks_KagoBug ; Initial instruction list
    db $04,$04 ; X/Y radius
    dw $A000,$0000 ; Properties, Hit instruction list
    dw InstList_EnemyProjectile_Delete ; Shot instruction list

EnemyProjectile_KraidFloorRocks_Left:
    dw Instruction_EnemyProjectile_KraidRisingRocks ; Initialisation AI
    dw PreInstruction_EnemyProjectile_KraidRocks ; Initial pre-instruction
    dw InstList_EnemyProjectile_KraidRocks_KagoBug ; Initial instruction list
    db $04,$04 ; X/Y radius
    dw $A000,$0000 ; Properties, Hit instruction list
    dw InstList_EnemyProjectile_Delete ; Shot instruction list

EnemyProjectile_KraidFloorRocks_Right:
    dw Instruction_EnemyProjectile_KraidRisingRocks ; Initialisation AI
    dw PreInstruction_EnemyProjectile_KraidRocks ; Initial pre-instruction
    dw InstList_EnemyProjectile_KraidFloorRocks_Right ; Initial instruction list
    db $04,$04 ; X/Y radius
    dw $A000,$0000 ; Properties, Hit instruction list
    dw InstList_EnemyProjectile_Delete ; Shot instruction list

InstList_EnemyProjectile_KraidRocks_KagoBug:
    dw $7FFF,EnemyProjSpritemaps_KraidRocks_KagoBugs 
    dw Instruction_EnemyProjectile_Sleep 

InstList_EnemyProjectile_KraidFloorRocks_Right:
    dw $7FFF,EnemyProjSpritemaps_KraidRisingRocks_Right 
    dw Instruction_EnemyProjectile_Sleep 

InstList_EnemyProjectile_Shot_KraidRockSpit:
    dw Instruction_EnemyProjectile_PreInstructionInY 
    dw PreInstruction_EnemyProjectile_KraidRockSpit_UsePalette0 
    dw $0004,EnemyProjSpritemaps_Common_0 
    dw $0004,EnemyProjSpritemaps_Common_1 
    dw $0004,EnemyProjSpritemaps_Common_2 
    dw $0004,EnemyProjSpritemaps_Common_3 
    dw $0004,EnemyProjSpritemaps_Common_4 
    dw Instruction_EnemyProjectile_Delete 

InitAI_EnemyProjectile_KraidRockSpit:
    PHX 
    LDX.W $0E54 
    LDA.W $0F7A,X : CLC : ADC.W #$0010 : STA.W $1A4B,Y 
    LDA.W $0F7E,X : SEC : SBC.W #$0060 : STA.W $1A93,Y 
    LDA.W #$0000 : STA.W $1A6F,Y 
    STA.W $1A27,Y 
    LDA.W $1993 : STA.W $1AB7,Y 
    LDA.W #$FC00 : STA.W $1ADB,Y 
    LDA.W #$0600 : STA.W $19BB,Y 
    PLX 
    RTS 


Instruction_EnemyProjectile_KraidCeilingRocks:
    PHX 
    LDX.W $0E54 
    LDA.W $1993 : STA.W $1A4B,Y 
    LDA.W #$0138 : STA.W $1A93,Y 
    LDA.W #$0000 : STA.W $1A6F,Y 
    STA.W $1A27,Y 
    LDA.W #$0000 : STA.W $1AB7,Y 
    LDA.W $05E5 : AND.W #$003F 
    CLC : ADC.W #$0040 : STA.W $1ADB,Y 
    LDA.W #$0600 : STA.W $19BB,Y 
    PLX 
    RTS 


Instruction_EnemyProjectile_KraidRisingRocks:
    PHX 
    LDA.W $05E5 : AND.W #$003F 
    TAX 
    LDA.W $05E5 : BIT.W #$0001 
    BNE + 
    TXA 
    EOR.W #$FFFF 
    TAX 

  + TXA 
    LDX.W $0E54 
    CLC : ADC.W $0F7A,X : STA.W $1A4B,Y 
    LDA.W #$01B0 : STA.W $1A93,Y 
    LDA.W #$0000 : STA.W $1A6F,Y 
    STA.W $1A27,Y 
    LDA.W $1993 : STA.W $1AB7,Y 
    LDA.W #$FB00 : STA.W $1ADB,Y 
    LDA.W #$0600 : STA.W $19BB,Y 
    LDA.W #$001E : JSL.L QueueSound_Lib3_Max6 
    PLX 
    RTS 


PreInstruction_EnemyProjectile_KraidRocks:
    PHP 
    REP #$20 
    JSR.W Move_EnemyProjectile_Horizontally 
    BCS .delete 
    JSR.W Move_EnemyProjectile_Vertically 
    BCS .delete 
    LDA.W $1AB7,X : CLC : ADC.W #$0008 : STA.W $1AB7,X 
    CMP.W #$0100 : BMI + 
    LDA.W #$FF00 

  + STA.W $1AB7,X 
    LDA.W $1ADB,X : CLC : ADC.W #$0040 : STA.W $1ADB,X 
    PLP 
    RTS 


.delete:
    STZ.W $1997,X 
    PLP 
    RTS 


PreInstruction_EnemyProjectile_KraidCeilingRocks:
    PHP 
    REP #$20 
    JSR.W Move_EnemyProjectile_Vertically 
    BCS .collision 
    LDA.W $1ADB,X : CLC : ADC.W #$0018 : AND.W #$3FFF 
    STA.W $1ADB,X 
    PLP 
    RTS 


.collision:
    STZ.W $1997,X 
    PLP 
    RTS 


PreInstruction_EnemyProjectile_KraidRockSpit_UsePalette0:
    PHP 
    REP #$30 
    LDA.W #$0000 : STA.W $19BB,X 
    PLP 
    RTS 


EnemyProjectile_MiniKraidSpit:
    dw InitAI_EnemyProjectile_MiniKraidSpit ; Initialisation AI
    dw PreInstruction_EnemyProjectile_MiniKraidSpit ; Initial pre-instruction
    dw InstList_EnemyProjectile_MiniKraidSpit ; Initial instruction list
    db $04,$04 ; X/Y radius
    dw $0014 ; Properties
    dw $0000 ; Hit instruction list
    dw InstList_EnemyProjectile_Delete ; Shot instruction list

EnemyProjectile_MiniKraidSpikes_Left:
    dw InitAI_EnemyProjectile_MiniKraidSpikes_Left ; Initialisation AI
    dw PreInstruction_EnemyProjectile_MiniKraidSpikes ; Initial pre-instruction
    dw InstList_EnemyProjectile_MiniKraidSpikes_Left ; Initial instruction list
    db $04,$02 ; X/Y radius
    dw $0006 ; Properties
    dw $0000 ; Hit instruction list
    dw InstList_EnemyProjectile_Delete ; Shot instruction list

EnemyProjectile_MiniKraidSpikes_Right:
    dw InitAI_EnemyProjectile_MiniKraidSpikes_Right ; Initialisation AI
    dw PreInstruction_EnemyProjectile_MiniKraidSpikes ; Initial pre-instruction
    dw InstList_EnemyProjectile_MiniKraidSpikes_Right ; Initial instruction list
    db $04,$02 ; X/Y radius
    dw $0006,$0000 ; Properties, Hit instruction list
    dw InstList_EnemyProjectile_Delete ; Shot instruction list

InstList_EnemyProjectile_MiniKraidSpit:
    dw $7FFF,EnemyProjSpritemaps_MiniKraidSpit 
    dw Instruction_EnemyProjectile_Sleep 

InstList_EnemyProjectile_MiniKraidSpikes_Left:
    dw $7FFF,EnemyProjSpritemaps_MiniKraidSpikes_Left 
    dw Instruction_EnemyProjectile_Sleep 

InstList_EnemyProjectile_MiniKraidSpikes_Right:
    dw $7FFF,EnemyProjSpritemaps_MiniKraidSpikes_Right 
    dw Instruction_EnemyProjectile_Sleep 

InitAI_EnemyProjectile_MiniKraidSpit:
    PHX 
    LDX.W $0E54 
    LDA.W $0F7A,X : CLC : ADC.L $7E7804,X : STA.W $1A4B,Y 
    LDA.W $0F7E,X : SEC : SBC.W #$0010 : STA.W $1A93,Y 
    LDA.W #$0000 : STA.W $1A6F,Y 
    STA.W $1A27,Y 
    LDA.L $7E7800,X : STA.W $1AB7,Y 
    LDA.L $7E7802,X : STA.W $1ADB,Y 
    PLX 
    RTS 


PreInstruction_EnemyProjectile_MiniKraidSpit:
    PHP 
    REP #$20 
    JSR.W Move_EnemyProjectile_Horizontally 
    BCS .delete 
    JSR.W Move_EnemyProjectile_Vertically 
    BCS .delete 
    LDA.W $1ADB,X : CLC : ADC.W #$0040 : BMI .setYvelocity 
    CMP.W #$0400 : BMI .setYvelocity 
    LDA.W #$0400 

.setYvelocity:
    STA.W $1ADB,X 
    PLP 
    RTS 


.delete:
    STZ.W $1997,X 
    PLP 
    RTS 


InitAI_EnemyProjectile_MiniKraidSpikes_Left:
    LDA.W #$FE00 : BRA InitAI_EnemyProjectile_MiniKraidSpikes_Common 


InitAI_EnemyProjectile_MiniKraidSpikes_Right:
    LDA.W #$0200 

InitAI_EnemyProjectile_MiniKraidSpikes_Common:
    STA.W $1AB7,Y 
    LDX.W $0E54 
    LDA.L $7E780C,X 
    TAX 
    LDA.W .data,X : STA.B $12 
    LDX.W $0E54 
    LDA.W $0F7A,X : STA.W $1A4B,Y 
    LDA.W $0F7E,X : CLC : ADC.B $12 : STA.W $1A93,Y 
    LDA.W #$0000 : STA.W $1A6F,Y 
    STA.W $1A27,Y 
    STA.W $1ADB,Y 
    RTS 


.data:
    dw $FFFE,$000C,$0018 

PreInstruction_EnemyProjectile_MiniKraidSpikes:
    PHP 
    REP #$20 
    JSR.W Move_EnemyProjectile_Horizontally 
    BCC .return 
    STZ.W $1997,X 

.return:
    PLP 
    RTS 


EnemyProjectile_AlcoonFireball:
    dw InitAI_EnemyProjectile_AlcoonFireball ; Initialisation AI
    dw PreInstruction_EnemyProjectile_AlcoonFireball ; Initial pre-instruction
    dw InstList_EnemyProjectile_AlcoonFireball ; Initial instruction list
    db $04,$04 ; X/Y radius
    dw $0014,$0000 ; Properties, Hit instruction list
    dw InstList_EnemyProjectile_Delete ; Shot instruction list

InstList_EnemyProjectile_AlcoonFireball:
    dw $0003,EnemyProjSpritemaps_AlcoonFireball_0 
    dw $0003,EnemyProjSpritemaps_AlcoonFireball_1 
    dw $0003,EnemyProjSpritemaps_AlcoonFireball_2 
    dw $0003,EnemyProjSpritemaps_AlcoonFireball_3 
    dw Instruction_EnemyProjectile_GotoY 
    dw InstList_EnemyProjectile_AlcoonFireball 

InitAI_EnemyProjectile_AlcoonFireball:
    PHX 
    LDX.W $0E54 
    LDA.W $0F7E,X : SEC : SBC.W #$000C : STA.W $1A93,Y 
    LDA.W #$FC00 : STA.W $1AB7,Y 
    LDA.W $0F7A,X : SEC : SBC.W #$0010 : STA.W $1A4B,Y 
    LDA.W $0FAE,X : BMI + 
    LDA.W #$0400 : STA.W $1AB7,Y 
    LDA.W $0F7A,X : CLC : ADC.W #$0010 : STA.W $1A4B,Y 

  + LDX.W $1993 
    LDA.W .Yvelocity,X : STA.W $1ADB,Y 
    LDA.W #$0000 : STA.W $1A6F,Y 
    STA.W $1A27,Y 
    PLX 
    RTS 


.Yvelocity:
    dw $FF00,$0000,$0100 

PreInstruction_EnemyProjectile_AlcoonFireball:
    REP #$30 
    JSR.W Move_EnemyProjectile_Vertically 
    BCS .delete 
    JSR.W Move_EnemyProjectile_Horizontally 
    BCS .delete 
    LDA.W $1AB7,X : BPL .positive 
    LDA.W $1AB7,X : CLC : ADC.W #$0040 : STA.W $1AB7,X 
    CMP.W #$FE00 : BMI .return 
    LDA.W #$FE00 : BRA .return 


.positive:
    LDA.W $1AB7,X : SEC : SBC.W #$0040 : STA.W $1AB7,X 
    CMP.W #$0200 : BPL .return 
    LDA.W #$0200 

.return:
    STA.W $1AB7,X 
    RTS 


.delete:
    LDA.W #$0000 : STA.W $1997,X 
    RTS 


InstList_EnemyProjectile_Pirate_MotherBrain_Laser_Left_0:
    dw $0002,EnemyProjSpritemaps_Pirate_MotherBrain_Laser_8 
    dw $0002,EnemyProjSpritemaps_Pirate_MotherBrain_Laser_9 
    dw $0002,EnemyProjSpritemaps_Pirate_MotherBrain_Laser_A 
    dw Instruction_PreInstructionInY_ExecuteY 
    dw PreInstruction_EnemyProjectile_Pirate_MotherBrain_Laser_Left 
    dw $0001,EnemyProjSpritemaps_Pirate_MotherBrain_Laser_0 
    dw $0001,EnemyProjSpritemaps_Pirate_MotherBrain_Laser_1 
    dw $0001,EnemyProjSpritemaps_Pirate_MotherBrain_Laser_2 
    dw $0001,EnemyProjSpritemaps_Pirate_MotherBrain_Laser_3 
    dw $0001,EnemyProjSpritemaps_Pirate_MotherBrain_Laser_4 
    dw $0001,EnemyProjSpritemaps_Pirate_MotherBrain_Laser_5 
    dw $0001,EnemyProjSpritemaps_Pirate_MotherBrain_Laser_6 
    dw $0001,EnemyProjSpritemaps_Pirate_MotherBrain_Laser_7 

InstList_EnemyProjectile_Pirate_MotherBrain_Laser_Left_1:
    dw $0001,EnemyProjSpritemaps_Pirate_MotherBrain_Laser_6 
    dw $0001,EnemyProjSpritemaps_Pirate_MotherBrain_Laser_7 
    dw Instruction_EnemyProjectile_GotoY 
    dw InstList_EnemyProjectile_Pirate_MotherBrain_Laser_Left_1 

InstList_EnemyProjectile_Pirate_MotherBrain_Laser_Right_0:
    dw $0002,EnemyProjSpritemaps_Pirate_MotherBrain_Laser_8 
    dw $0002,EnemyProjSpritemaps_Pirate_MotherBrain_Laser_9 
    dw $0002,EnemyProjSpritemaps_Pirate_MotherBrain_Laser_A 
    dw Instruction_PreInstructionInY_ExecuteY 
    dw PreInst_EnemyProjectile_Pirate_MotherBrain_Laser_Right 
    dw $0001,EnemyProjSpritemaps_Pirate_MotherBrain_Laser_0 
    dw $0001,EnemyProjSpritemaps_Pirate_MotherBrain_Laser_1 
    dw $0001,EnemyProjSpritemaps_Pirate_MotherBrain_Laser_2 
    dw $0001,EnemyProjSpritemaps_Pirate_MotherBrain_Laser_3 
    dw $0001,EnemyProjSpritemaps_Pirate_MotherBrain_Laser_4 
    dw $0001,EnemyProjSpritemaps_Pirate_MotherBrain_Laser_5 
    dw $0001,EnemyProjSpritemaps_Pirate_MotherBrain_Laser_6 
    dw $0001,EnemyProjSpritemaps_Pirate_MotherBrain_Laser_7 

InstList_EnemyProjectile_Pirate_MotherBrain_Laser_Right_1:
    dw $0001,EnemyProjSpritemaps_Pirate_MotherBrain_Laser_6 
    dw $0001,EnemyProjSpritemaps_Pirate_MotherBrain_Laser_7 
    dw Instruction_EnemyProjectile_GotoY 
    dw InstList_EnemyProjectile_Pirate_MotherBrain_Laser_Right_1 

InstList_EnemyProjectile_PirateClaw_Left_0:
    dw Instruction_EnemyProjectile_PreInstructionInY 
    dw PreInstruction_EnemyProjectile_PirateClaw_Left 

InstList_EnemyProjectile_PirateClaw_Left_1:
    dw $0001,EnemyProjSpritemaps_PirateClaw_0 
    dw $0001,EnemyProjSpritemaps_PirateClaw_1 
    dw $0001,EnemyProjSpritemaps_PirateClaw_2 
    dw $0001,EnemyProjSpritemaps_PirateClaw_3 
    dw $0001,EnemyProjSpritemaps_PirateClaw_4 
    dw $0001,EnemyProjSpritemaps_PirateClaw_5 
    dw $0001,EnemyProjSpritemaps_PirateClaw_6 
    dw $0001,EnemyProjSpritemaps_PirateClaw_7 
    dw Instruction_EnemyProjectile_GotoY 
    dw InstList_EnemyProjectile_PirateClaw_Left_1 

InstList_EnemyProjectile_PirateClaw_Right_0:
    dw Instruction_EnemyProjectile_PreInstructionInY 
    dw PreInstruction_EnemyProjectile_PirateClaw_Right 

InstList_EnemyProjectile_PirateClaw_Right_1:
    dw $0001,EnemyProjSpritemaps_PirateClaw_8 
    dw $0001,EnemyProjSpritemaps_PirateClaw_9 
    dw $0001,EnemyProjSpritemaps_PirateClaw_A 
    dw $0001,EnemyProjSpritemaps_PirateClaw_B 
    dw $0001,EnemyProjSpritemaps_PirateClaw_C 
    dw $0001,EnemyProjSpritemaps_PirateClaw_D 
    dw $0001,EnemyProjSpritemaps_PirateClaw_E 
    dw $0001,EnemyProjSpritemaps_PirateClaw_F 
    dw Instruction_EnemyProjectile_GotoY 
    dw InstList_EnemyProjectile_PirateClaw_Right_1 

InitAI_EnemyProjectile_Pirate_MotherBrain_Laser:
    PHY : PHX 
    LDX.W #InstList_EnemyProjectile_Pirate_MotherBrain_Laser_Left_0 
    LDA.B $16 : AND.W #$FFFF 
    BEQ + 
    LDX.W #InstList_EnemyProjectile_Pirate_MotherBrain_Laser_Right_0 

  + TXA 
    STA.W $1B47,Y 
    LDA.W #RTS_86A05B : STA.W $1A03,Y 
    LDA.B $12 : STA.W $1A4B,Y 
    LDA.B $14 : STA.W $1A93,Y 
    LDX.W $0E54 
    LDA.W $0F78,X 
    TAX 
    LDA.L $A00006,X : ORA.W #$1000 : STA.W $1BD7,Y 
    LDX.W $0E54 
    LDA.W $0FB4,X : STA.W $1AFF,Y 
    LDA.W #$0067 : JSL.L QueueSound_Lib2_Max6 
    PLX : PLY 
    RTS 


Instruction_PreInstructionInY_ExecuteY:
    PHX : PHY 
    LDA.W $0000,Y : STA.W $1A03,X 
    PLY : PLX 
    RTS 


RTS_86A05B:
    RTS 


PreInstruction_EnemyProjectile_Pirate_MotherBrain_Laser_Left:
    DEC.W $1A4B,X 
    DEC.W $1A4B,X 
    LDA.W $1AFF,X : BIT.W #$8000 
    BNE + 
    DEC.W $1A4B,X 
    DEC.W $1A4B,X 

  + JSR.W CheckIf_EnemyProjectile_IsOffScreen_duplicate_again4 
    BNE .offScreen 
    RTS 


.offScreen:
    STZ.W $1997,X 
    RTS 


PreInst_EnemyProjectile_Pirate_MotherBrain_Laser_Right:
    INC.W $1A4B,X 
    INC.W $1A4B,X 
    LDA.W $1AFF,X : BIT.W #$8000 
    BNE + 
    INC.W $1A4B,X 
    INC.W $1A4B,X 

  + JSR.W CheckIf_EnemyProjectile_IsOffScreen_duplicate_again4 
    BNE .offScreen 
    RTS 


.offScreen:
    STZ.W $1997,X 
    RTS 


PreInstruction_EnemyProjectile_PirateClaw:
    PHY : PHX 
    LDA.B $14 : CLC : ADC.B $18 : STA.W $1A93,Y 
    LDA.B $12 : CLC : ADC.B $16 : STA.W $1A4B,Y 
    LDX.W #InstList_EnemyProjectile_PirateClaw_Left_0 
    LDA.W $1993 : AND.W #$FFFF 
    BEQ + 
    LDX.W #InstList_EnemyProjectile_PirateClaw_Right_0 

  + TXA 
    STA.W $1B47,Y 
    LDA.W #RTS_86A05B : STA.W $1A03,Y 
    LDA.W #$0800 : STA.W $1AFF,Y 
    LDA.W #$0001 : STA.W $1B23,Y 
    PLX : PLY 
    RTS 


PreInstruction_EnemyProjectile_PirateClaw_Left:
    LDA.W $1B23,X : BEQ + 
    LDA.W $1AFF,X 
    XBA 
    AND.W #$00FF 
    STA.B $12 
    LDA.W $1A4B,X : SEC : SBC.B $12 : STA.W $1A4B,X 
    LDA.W $1AFF,X : SEC : SBC.W #$0020 : STA.W $1AFF,X 
    BNE .YPlus1 
    STZ.W $1B23,X 
    BRA .YPlus1 


  + LDA.W $1AFF,X 
    XBA 
    AND.W #$00FF 
    CLC : ADC.W $1A4B,X : STA.W $1A4B,X 
    LDA.W $1AFF,X : CLC : ADC.W #$0020 : STA.W $1AFF,X 

.YPlus1:
    LDA.W $1A93,X : CLC : ADC.W #$0001 : STA.W $1A93,X 
    JSR.W CheckIf_EnemyProjectile_IsOffScreen_duplicate_again4 
    BEQ .return 
    STZ.W $1997,X 

.return:
    RTS 


PreInstruction_EnemyProjectile_PirateClaw_Right:
    LDA.W $1B23,X : BEQ + 
    LDA.W $1AFF,X 
    XBA 
    AND.W #$00FF 
    STA.B $12 
    LDA.W $1A4B,X : CLC : ADC.B $12 : STA.W $1A4B,X 
    LDA.W $1AFF,X : SEC : SBC.W #$0020 : STA.W $1AFF,X 
    BNE .YPlus1 
    STZ.W $1B23,X 
    BRA .YPlus1 


  + LDA.W $1AFF,X 
    XBA 
    AND.W #$00FF 
    STA.B $12 
    LDA.W $1A4B,X : SEC : SBC.B $12 : STA.W $1A4B,X 
    LDA.W $1AFF,X : CLC : ADC.W #$0020 : STA.W $1AFF,X 

.YPlus1:
    LDA.W $1A93,X : CLC : ADC.W #$0001 : STA.W $1A93,X 
    JSR.W CheckIf_EnemyProjectile_IsOffScreen_duplicate_again4 
    BEQ .return 
    STZ.W $1997,X 

.return:
    RTS 


EnemyProjectile_PirateMotherBrainLaser:
    dw InitAI_EnemyProjectile_Pirate_MotherBrain_Laser ; Initialisation AI
    dw PreInstruction_EnemyProjectile_Pirate_MotherBrain_Laser_Left ; Initial pre-instruction
    dw InstList_EnemyProjectile_Pirate_MotherBrain_Laser_Left_0 ; Initial instruction list
    db $10,$04 ; X,Y radius
    dw $100A ; Properties
    dw $0000 ; Hit instruction list
    dw InstList_EnemyProjectile_Delete ; Shot instruction list

EnemyProjectile_PirateClaw:
    dw PreInstruction_EnemyProjectile_PirateClaw ; Initialisation AI
    dw RTS_86A05B ; Initial pre-instruction
    dw $0000 ; Initial instruction list
    db $08,$08 ; X,Y radius
    dw $1014,$0000 ; Properties, Hit instruction list
    dw InstList_EnemyProjectile_Delete ; Shot instruction list

InstList_EnemyProjectile_GunshipLiftoffDustClouds_Index0_0:
    dw Instruction_EnemyProjectile_TimerInY,$0001 

InstList_EnemyProjectile_GunshipLiftoffDustClouds_Index0_1:
    dw $0008,EnemyProjSpritemaps_GunshipLiftoffDustClouds_0 
    dw $0008,EnemyProjSpritemaps_GunshipLiftoffDustClouds_1 
    dw $0009,EnemyProjSpritemaps_GunshipLiftoffDustClouds_2 
    dw $0009,EnemyProjSpritemaps_GunshipLiftoffDustClouds_3 
    dw $000A,EnemyProjSpritemaps_GunshipLiftoffDustClouds_4 
    dw $000A,EnemyProjSpritemaps_GunshipLiftoffDustClouds_5 
    dw $000A,EnemyProjSpritemaps_GunshipLiftoffDustClouds_6 
    dw $000A,EnemyProjSpritemaps_GunshipLiftoffDustClouds_7 
    dw Instruction_EnemyProjectile_DecrementTimer_GotoYIfNonZero 
    dw InstList_EnemyProjectile_GunshipLiftoffDustClouds_Index0_1 
    dw Instruction_EnemyProjectile_Delete 

InstList_EnemyProjectile_GunshipLiftoffDustClouds_Index2_0:
    dw Instruction_EnemyProjectile_TimerInY,$0001 

InstList_EnemyProjectile_GunshipLiftoffDustClouds_Index2_1:
    dw $0006,EnemyProjSpritemaps_GunshipLiftoffDustClouds_8 
    dw $0006,EnemyProjSpritemaps_GunshipLiftoffDustClouds_9 
    dw $0007,EnemyProjSpritemaps_GunshipLiftoffDustClouds_A 
    dw $0007,EnemyProjSpritemaps_GunshipLiftoffDustClouds_B 
    dw $0008,EnemyProjSpritemaps_GunshipLiftoffDustClouds_C 
    dw $0008,EnemyProjSpritemaps_GunshipLiftoffDustClouds_D 
    dw $0008,EnemyProjSpritemaps_GunshipLiftoffDustClouds_E 
    dw $0008,EnemyProjSpritemaps_GunshipLiftoffDustClouds_F 
    dw Instruction_EnemyProjectile_DecrementTimer_GotoYIfNonZero 
    dw InstList_EnemyProjectile_GunshipLiftoffDustClouds_Index2_1 
    dw Instruction_EnemyProjectile_Delete 

InstList_EnemyProjectile_GunshipLiftoffDustClouds_Index4_0:
    dw Instruction_EnemyProjectile_TimerInY,$0001 

InstList_EnemyProjectile_GunshipLiftoffDustClouds_Index4_1:
    dw $000B,EnemyProjSpritemaps_GunshipLiftoffDustClouds_10 
    dw $000B,EnemyProjSpritemaps_GunshipLiftoffDustClouds_11 
    dw $000C,EnemyProjSpritemaps_GunshipLiftoffDustClouds_12 
    dw $000C,EnemyProjSpritemaps_GunshipLiftoffDustClouds_13 
    dw $000D,EnemyProjSpritemaps_GunshipLiftoffDustClouds_14 
    dw $000D,EnemyProjSpritemaps_GunshipLiftoffDustClouds_15 
    dw $000D,EnemyProjSpritemaps_GunshipLiftoffDustClouds_16 
    dw Instruction_EnemyProjectile_DecrementTimer_GotoYIfNonZero 
    dw InstList_EnemyProjectile_GunshipLiftoffDustClouds_Index4_1 
    dw Instruction_EnemyProjectile_Delete 

InstList_EnemyProjectile_GunshipLiftoffDustClouds_Index6_0:
    dw Instruction_EnemyProjectile_TimerInY,$0001 

InstList_EnemyProjectile_GunshipLiftoffDustClouds_Index6_1:
    dw $0008,EnemyProjSpritemaps_GunshipLiftoffDustClouds_17 
    dw $0008,EnemyProjSpritemaps_GunshipLiftoffDustClouds_18 
    dw $0009,EnemyProjSpritemaps_GunshipLiftoffDustClouds_19 
    dw $0009,EnemyProjSpritemaps_GunshipLiftoffDustClouds_1A 
    dw $000A,EnemyProjSpritemaps_GunshipLiftoffDustClouds_1B 
    dw $000A,EnemyProjSpritemaps_GunshipLiftoffDustClouds_1C 
    dw $000A,EnemyProjSpritemaps_GunshipLiftoffDustClouds_1D 
    dw $000A,EnemyProjSpritemaps_GunshipLiftoffDustClouds_1E 
    dw Instruction_EnemyProjectile_DecrementTimer_GotoYIfNonZero 
    dw InstList_EnemyProjectile_GunshipLiftoffDustClouds_Index6_1 
    dw Instruction_EnemyProjectile_Delete 

InstList_EnemyProjectile_GunshipLiftoffDustClouds_Index8_0:
    dw Instruction_EnemyProjectile_TimerInY,$0001 

InstList_EnemyProjectile_GunshipLiftoffDustClouds_Index8_1:
    dw $0006,EnemyProjSpritemaps_GunshipLiftoffDustClouds_1F 
    dw $0006,EnemyProjSpritemaps_GunshipLiftoffDustClouds_20 
    dw $0007,EnemyProjSpritemaps_GunshipLiftoffDustClouds_21 
    dw $0007,EnemyProjSpritemaps_GunshipLiftoffDustClouds_22 
    dw $0008,EnemyProjSpritemaps_GunshipLiftoffDustClouds_23 
    dw $0008,EnemyProjSpritemaps_GunshipLiftoffDustClouds_24 
    dw $0008,EnemyProjSpritemaps_GunshipLiftoffDustClouds_25 
    dw $0008,EnemyProjSpritemaps_GunshipLiftoffDustClouds_26 
    dw Instruction_EnemyProjectile_DecrementTimer_GotoYIfNonZero 
    dw InstList_EnemyProjectile_GunshipLiftoffDustClouds_Index8_1 
    dw Instruction_EnemyProjectile_Delete 

InstList_EnemyProjectile_GunshipLiftoffDustClouds_IndexA_0:
    dw Instruction_EnemyProjectile_TimerInY,$0001 

InstList_EnemyProjectile_GunshipLiftoffDustClouds_IndexA_1:
    dw $000B,EnemyProjSpritemaps_GunshipLiftoffDustClouds_27 
    dw $000B,EnemyProjSpritemaps_GunshipLiftoffDustClouds_28 
    dw $000C,EnemyProjSpritemaps_GunshipLiftoffDustClouds_29 
    dw $000C,EnemyProjSpritemaps_GunshipLiftoffDustClouds_2A 
    dw $000D,EnemyProjSpritemaps_GunshipLiftoffDustClouds_2B 
    dw $000D,EnemyProjSpritemaps_GunshipLiftoffDustClouds_2C 
    dw $000D,EnemyProjSpritemaps_GunshipLiftoffDustClouds_2D 
    dw Instruction_EnemyProjectile_DecrementTimer_GotoYIfNonZero 
    dw InstList_EnemyProjectile_GunshipLiftoffDustClouds_IndexA_1 
    dw Instruction_EnemyProjectile_Delete 

InstList_EnemyProjectile_Delete_A28B:
    dw Instruction_EnemyProjectile_Delete 

InstList_EnemyProjectile_Shot_CeresElevatorPad:
    dw $0001,EnemyProjSpritemaps_CeresElevatorPad_DustCloud_Explosion_0 
    dw $0001,EnemyProjSpritemaps_CeresElevatorPad_DustCloud_Explosion_1 
    dw Instruction_EnemyProjectile_GotoY 
    dw InstList_EnemyProjectile_Shot_CeresElevatorPad 

InstList_EnemyProj_Shot_CeresElevatorPadLevelDataConcealer:
    dw $0001,EnemyProjSpritemaps_CeresElevatorPadLevelDataConcealer 
    dw Instruction_EnemyProjectile_GotoY 
    dw InstList_EnemyProj_Shot_CeresElevatorPadLevelDataConcealer 

InitAI_EnemyProjectile_GunshipLiftoffDustClouds:
    PHP 
    REP #$30 
    LDA.W #$0000 : STA.W $1A27,Y 
    STA.W $1A6F,Y 
    STA.W $1AB7,Y 
    STA.W $1ADB,Y 
    LDX.W $1993 
    LDA.W $0AF6 : CLC : ADC.W .Xoffsets,X : STA.W $1A4B,Y 
    LDA.W $0AFA : CLC : ADC.W #$0050 : STA.W $1A93,Y 
    LDA.W .InstListPointers,X : STA.W $1B47,Y 
    TXA 
    STA.W $1AFF,Y 
    PLP 
    RTS 


.Xoffsets:
    dw $0040,$0048,$0050,$FFC0,$FFB8,$FFB0 

.InstListPointers:
    dw InstList_EnemyProjectile_GunshipLiftoffDustClouds_Index0_0 
    dw InstList_EnemyProjectile_GunshipLiftoffDustClouds_Index2_0 
    dw InstList_EnemyProjectile_GunshipLiftoffDustClouds_Index4_0 
    dw InstList_EnemyProjectile_GunshipLiftoffDustClouds_Index6_0 
    dw InstList_EnemyProjectile_GunshipLiftoffDustClouds_Index8_0 
    dw InstList_EnemyProjectile_GunshipLiftoffDustClouds_IndexA_0 

InitAI_EnemyProjectile_CeresElevatorPad:
    PHP 
    REP #$30 
    LDA.W $0AFA : CLC : ADC.W #$001C : STA.W $1A93,Y 
    LDA.W #$003C : STA.W $1AFF,Y 

InitAI_EnemyProjectile_CeresElevatorPad_Common:
    LDA.W #$0000 : STA.W $1A27,Y 
    STA.W $1A6F,Y 
    STA.W $1AB7,Y 
    STA.W $1ADB,Y 
    STA.W $19BB,Y 
    LDA.W $0AF6 : STA.W $1A4B,Y 
    PLP 
    RTS 


InitAI_EnemyProjectile_CeresElevatorPadLevelDataConcealer:
    PHP 
    REP #$30 
    LDA.W #$0061 : STA.W $1A93,Y 
    JMP.W InitAI_EnemyProjectile_CeresElevatorPad_Common 


RTS_86A327:
    RTS 


PreInstruction_EnemyProjectile_CeresElevatorPad:
    LDA.W $1AFF,X : BEQ .timerExpired 
    DEC.W $1AFF,X 
    BEQ .timerExpired 
    BPL .return 

.timerExpired:
    LDA.W $0AFA : CLC : ADC.W #$001C : STA.W $1A93,X 
    LDA.W $0AFA 
    INC A 
    STA.W $0AFA 
    CMP.W #$0049 : BMI .return 
    LDA.W #$0048 : STA.W $0AFA 
    LDA.W #$0001 : STA.W $1B8F,X 
    LDA.W #InstList_EnemyProjectile_Delete_A28B : STA.W $1B47,X 
    LDA.W #$000E : JSL.L Run_Samus_Command 

.return:
    RTS 


PreInst_EnemyProjectile_CeresElevatorPadLevelDataConcealer:
    LDA.W $0AFA : CMP.W #$0048 : BNE .return 
    LDA.W #$0001 : STA.W $1B8F,X 
    LDA.W #InstList_EnemyProjectile_Delete_A28B : STA.W $1B47,X 

.return:
    RTS 


EnemyProjectile_GunShipLiftoffDustClouds:
    dw InitAI_EnemyProjectile_GunshipLiftoffDustClouds ; Initialisation AI
    dw RTS_86A327 ; Initial pre-instruction
    dw InstList_EnemyProjectile_GunshipLiftoffDustClouds_Index0_0 ; Initial instruction list
    db $08,$08 ; X,Y radius
    dw $3000 ; Properties
    dw $0000 ; Hit instruction list
    dw InstList_EnemyProjectile_GunshipLiftoffDustClouds_Index0_0 ; Shot instruction list

EnemyProjectile_CeresElevatorPad:
    dw InitAI_EnemyProjectile_CeresElevatorPad ; Initialisation AI
    dw PreInstruction_EnemyProjectile_CeresElevatorPad ; Initial pre-instruction
    dw InstList_EnemyProjectile_Shot_CeresElevatorPad ; Initial instruction list
    db $01,$01 ; X,Y radius
    dw $3000 ; Properties
    dw $0000 ; Hit instruction list
    dw InstList_EnemyProjectile_Shot_CeresElevatorPad ; Shot instruction list

EnemyProjectile_CeresElevatorPadLevelDataConcealer:
    dw InitAI_EnemyProjectile_CeresElevatorPadLevelDataConcealer ; Initialisation AI
    dw PreInst_EnemyProjectile_CeresElevatorPadLevelDataConcealer ; Initial pre-instruction
    dw InstList_EnemyProj_Shot_CeresElevatorPadLevelDataConcealer ; Initial instruction list
    db $01,$01 ; X,Y radius
    dw $3000 ; Properties
    dw $0000 ; Hit instruction list
    dw InstList_EnemyProj_Shot_CeresElevatorPadLevelDataConcealer ; Shot instruction list

InitAI_PreInstruction_EnemyProjectile_PrePhantoonRoom:
    LDA.W #$0000 : STA.W $0923 
    RTS 


InstList_EnemyProjectile_PrePhantoonRoom:
    dw $0020,EnemyProjSpritemaps_Blank_Default 
    dw Instruction_EnemyProjectile_Delete 

EnemyProjectile_PrePhantoonRoom:
    dw InitAI_PreInstruction_EnemyProjectile_PrePhantoonRoom ; Initialisation AI
    dw InitAI_PreInstruction_EnemyProjectile_PrePhantoonRoom ; Initial pre-instruction
    dw InstList_EnemyProjectile_PrePhantoonRoom ; Initial instruction list
    db $00,$00 ; X,Y radius
    dw $3000,$0000 ; Properties, Hit instruction list
    dw InstList_EnemyProjectile_Delete ; Shot instruction list

Instruction_EnemyProjectile_Torizo_ResetPosition:
    LDA.W $1AFF,X : STA.W $1A4B,X 
    LDA.W $1B23,X : STA.W $1A93,X 
    RTS 


InstList_EnemyProjectile_BombTorizoLowHealthExplosion_0:
    dw Instruction_EnemyProjectile_ClearPreInstruction 
    dw Instruction_EnemyProjectile_Properties_OrY,$3000 
    dw Instruction_EnemyProjectile_TimerInY,$0003 

InstList_EnemyProjectile_BombTorizoLowHealthExplosion_1:
    dw Instruction_EnemyProjectile_Torizo_ResetPosition 
    dw Instruction_MoveRandomlyWithinXRadius_YRadius 
    db $0F,$00,$0F,$00 
    dw Instruction_EnemyProjectile_QueueSoundInY_Lib2_Max6 : db $24 
    dw $0002,EnemyProjSpritemaps_Common_0 
    dw $0002,EnemyProjSpritemaps_Common_1 
    dw $0003,EnemyProjSpritemaps_Common_2 
    dw $0003,EnemyProjSpritemaps_Common_3 
    dw $0002,EnemyProjSpritemaps_Common_4 
    dw Instruction_EnemyProjectile_DecrementTimer_GotoYIfNonZero 
    dw InstList_EnemyProjectile_BombTorizoLowHealthExplosion_1 
    dw Instruction_EnemyProjectile_Delete 

InstList_EnemyProjectile_TorizoDeathExplosion_0:
    dw Instruction_EnemyProjectile_ClearPreInstruction 
    dw Instruction_EnemyProjectile_Properties_OrY,$3000 
    dw Instruction_EnemyProjectile_GotoY_Probability_1_4 
    dw InstList_EnemyProjectile_TorizoDeathExplosion_2 
    dw Instruction_EnemyProjectile_TimerInY,$0002 

InstList_EnemyProjectile_TorizoDeathExplosion_1:
    dw Instruction_EnemyProjectile_Torizo_ResetPosition 
    dw Instruction_MoveRandomlyWithinXRadius_YRadius 
    db $1F,$00,$3F,$10 
    dw Instruction_EnemyProjectile_QueueSoundInY_Lib2_Max6 : db $24 
    dw $0004,EnemyProjSpritemaps_Common_SmallExplosion_0 
    dw $0006,EnemyProjSpritemaps_Common_SmallExplosion_1 
    dw $0005,EnemyProjSpritemaps_Common_SmallExplosion_2 
    dw $0005,EnemyProjSpritemaps_Common_SmallExplosion_3 
    dw $0005,EnemyProjSpritemaps_Common_SmallExplosion_4 
    dw $0006,EnemyProjSpritemaps_Common_SmallExplosion_5 
    dw Instruction_EnemyProjectile_DecrementTimer_GotoYIfNonZero 
    dw InstList_EnemyProjectile_TorizoDeathExplosion_1 
    dw Instruction_EnemyProjectile_Delete 

InstList_EnemyProjectile_TorizoDeathExplosion_2:
    dw Instruction_EnemyProjectile_TimerInY,$0002 

InstList_EnemyProjectile_TorizoDeathExplosion_3:
    dw Instruction_EnemyProjectile_Torizo_ResetPosition 
    dw Instruction_MoveRandomlyWithinXRadius_YRadius 
    db $1F,$00,$3F,$04 
    dw Instruction_EnemyProjectile_QueueSoundInY_Lib2_Max6 : db $24 
    dw $0008,EnemyProjSpritemaps_Common_Smoke_0 
    dw $0008,EnemyProjSpritemaps_Common_Smoke_1 
    dw $0008,EnemyProjSpritemaps_Common_Smoke_2 
    dw $0008,EnemyProjSpritemaps_Common_Smoke_3 
    dw Instruction_EnemyProjectile_DecrementTimer_GotoYIfNonZero 
    dw InstList_EnemyProjectile_TorizoDeathExplosion_3 
    dw Instruction_EnemyProjectile_Delete 

Instruction_EnemyProjectile_GotoY_Probability_1_4:
    JSL.L GenerateRandomNumber 
    AND.W #$C000 
    CMP.W #$C000 : BEQ .gotoY 
    INY #2
    RTS 


.gotoY:
    LDA.W $0000,Y 
    TAY 
    RTS 


InstList_EnemyProj_BombTorizoLowHealthDrool_4FrameDelay:
    dw $0002,EnemyProjSpritemaps_Blank_Default 

InstList_EnemyProj_BombTorizoLowHealthDrool_2FrameDelay:
    dw $0002,EnemyProjSpritemaps_Blank_Default 

InstList_EnemyProj_BombTorizoLowHealthDrool_NoDelay_0:
    dw Instruction_EnemyProjectile_PreInstructionInY 
    dw PreInst_EnemyProjectile_BombTorizoLowHealthDrool_Falling 
    dw Instruction_EnemyProjectile_Properties_OrY,$3000 
    dw $0005,UNUSED_EnemyProjSpritemaps_BombTorizoLowHealthDrool_0_8D8C54 
    dw Instruction_EnemyProjectile_Properties_AndY,$EFFF 

InstList_EnemyProj_BombTorizoLowHealthDrool_NoDelay_1:
    dw $0040,UNUSED_EnemyProjSpritemaps_BombTorizoLowHealthDrool_0_8D8C54 
    dw Instruction_EnemyProjectile_GotoY 
    dw InstList_EnemyProj_BombTorizoLowHealthDrool_NoDelay_1 

InstList_EnemyProj_BombTorizoLowHealthDrool_HitWall:
    dw Instruction_EnemyProjectile_ClearPreInstruction 
    dw Instruction_EnemyProjectile_Delete 

InstList_EnemyProj_BombTorizoLowHealthDrool_HitFloor:
    dw Instruction_EnemyProjectile_ClearPreInstruction 
    dw $0008,UNUSED_EnemyProjSpritemaps_BombTorizoLowHealthDrool_1_8D8C5B 
    dw $0008,UNUSED_EnemyProjSpritemaps_BombTorizoLowHealthDrool_2_8D8C62 
    dw $0008,UNUSED_EnemyProjSpritemaps_BombTorizoLowHealthDrool_3_8D8C69 
    dw Instruction_EnemyProjectile_Delete 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_InstList_EnemyProjectile_BombTorizo_86A49E:
    dw Instruction_EnemyProjectile_Properties_OrY,$3000 
    dw $0024,UNUSED_EnemyProjSpritemaps_BombTorizoLowHealthDrool_0_8D8C54 
    dw Instruction_EnemyProjectile_GotoY 
    dw InstList_EnemyProj_BombTorizoLowHealthDrool_HitFloor 
endif ; !FEATURE_KEEP_UNREFERENCED

InstList_EnemyProjectile_BombTorizoExplosionSwipe:
    dw Instruction_EnemyProjectile_QueueSoundInY_Lib2_Max1 : db $26 
    dw $0005,EnemyProjSpritemaps_Common_0 
    dw $0005,EnemyProjSpritemaps_Common_1 
    dw $0005,EnemyProjSpritemaps_Common_2 
    dw $0005,EnemyProjSpritemaps_Common_3 
    dw $0005,EnemyProjSpritemaps_Common_4 
    dw Instruction_EnemyProjectile_Delete 

InstList_EnemyProjectile_BombTorizoChozoBreaking_Index0:
    dw $0080,EnemyProjSpritemaps_BombTorizoChozoBreaking_0 
    dw Instruction_EnemyProjectile_QueueSoundInY_Lib2_Max6 : db $0C 
    dw Instruction_EnemyProjectile_PreInstructionInY 
    dw PreInst_EnemyProjectile_BombTorizoChozoBreaking_Falling 
    dw $0070,EnemyProjSpritemaps_BombTorizoChozoBreaking_0 
    dw Instruction_EnemyProjectile_Delete 

InstList_EnemyProjectile_BombTorizoChozoBreaking_Index2:
    dw $0078,EnemyProjSpritemaps_BombTorizoChozoBreaking_1 
    dw Instruction_EnemyProjectile_QueueSoundInY_Lib2_Max6 : db $0C 
    dw Instruction_EnemyProjectile_PreInstructionInY 
    dw PreInst_EnemyProjectile_BombTorizoChozoBreaking_Falling 
    dw $0070,EnemyProjSpritemaps_BombTorizoChozoBreaking_1 
    dw Instruction_EnemyProjectile_Delete 

InstList_EnemyProjectile_BombTorizoChozoBreaking_Index4:
    dw $0070,EnemyProjSpritemaps_BombTorizoChozoBreaking_2 
    dw Instruction_EnemyProjectile_QueueSoundInY_Lib2_Max6 : db $0C 
    dw Instruction_EnemyProjectile_PreInstructionInY 
    dw PreInst_EnemyProjectile_BombTorizoChozoBreaking_Falling 
    dw $0070,EnemyProjSpritemaps_BombTorizoChozoBreaking_2 
    dw Instruction_EnemyProjectile_Delete 

InstList_EnemyProjectile_BombTorizoChozoBreaking_Index6:
    dw $0068,EnemyProjSpritemaps_BombTorizoChozoBreaking_3 
    dw Instruction_EnemyProjectile_QueueSoundInY_Lib2_Max6 : db $0C 
    dw Instruction_EnemyProjectile_PreInstructionInY 
    dw PreInst_EnemyProjectile_BombTorizoChozoBreaking_Falling 
    dw $0070,EnemyProjSpritemaps_BombTorizoChozoBreaking_3 
    dw Instruction_EnemyProjectile_Delete 

InstList_EnemyProjectile_BombTorizoChozoBreaking_Index8:
    dw $0060,EnemyProjSpritemaps_BombTorizoChozoBreaking_4 
    dw Instruction_EnemyProjectile_QueueSoundInY_Lib2_Max6 : db $0C 
    dw Instruction_EnemyProjectile_PreInstructionInY 
    dw PreInst_EnemyProjectile_BombTorizoChozoBreaking_Falling 
    dw $0070,EnemyProjSpritemaps_BombTorizoChozoBreaking_4 
    dw Instruction_EnemyProjectile_Delete 

InstList_EnemyProjectile_BombTorizoChozoBreaking_IndexA:
    dw $0058,EnemyProjSpritemaps_BombTorizoChozoBreaking_5 
    dw Instruction_EnemyProjectile_QueueSoundInY_Lib2_Max6 : db $0C 
    dw Instruction_EnemyProjectile_PreInstructionInY 
    dw PreInst_EnemyProjectile_BombTorizoChozoBreaking_Falling 
    dw $0070,EnemyProjSpritemaps_BombTorizoChozoBreaking_5 
    dw Instruction_EnemyProjectile_Delete 

InstList_EnemyProjectile_BombTorizoChozoBreaking_IndexC:
    dw $0050,EnemyProjSpritemaps_BombTorizoChozoBreaking_6 
    dw Instruction_EnemyProjectile_QueueSoundInY_Lib2_Max6 : db $0C 
    dw Instruction_EnemyProjectile_PreInstructionInY 
    dw PreInst_EnemyProjectile_BombTorizoChozoBreaking_Falling 
    dw $0070,EnemyProjSpritemaps_BombTorizoChozoBreaking_6 
    dw Instruction_EnemyProjectile_Delete 

InstList_EnemyProjectile_BombTorizoChozoBreaking_IndexE:
    dw $0048,EnemyProjSpritemaps_BombTorizoChozoBreaking_7 
    dw Instruction_EnemyProjectile_QueueSoundInY_Lib2_Max6 : db $0C 
    dw Instruction_EnemyProjectile_PreInstructionInY 
    dw PreInst_EnemyProjectile_BombTorizoChozoBreaking_Falling 
    dw $0070,EnemyProjSpritemaps_BombTorizoChozoBreaking_7 
    dw Instruction_EnemyProjectile_Delete 

InstList_EnemyProjectile_BombTorizoChozoBreaking_Index10:
    dw $0040,EnemyProjSpritemaps_BombTorizoChozoBreaking_8 
    dw Instruction_EnemyProjectile_QueueSoundInY_Lib2_Max6 : db $0C 
    dw Instruction_EnemyProjectile_PreInstructionInY 
    dw PreInst_EnemyProjectile_BombTorizoChozoBreaking_Falling 
    dw $0070,EnemyProjSpritemaps_BombTorizoChozoBreaking_8 
    dw Instruction_EnemyProjectile_Delete 

InstList_EnemyProjectile_BombTorizoChozoBreaking_Index12:
    dw $0040,EnemyProjSpritemaps_BombTorizoChozoBreaking_9 
    dw Instruction_EnemyProjectile_QueueSoundInY_Lib2_Max6 : db $0C 
    dw Instruction_EnemyProjectile_PreInstructionInY 
    dw PreInst_EnemyProjectile_BombTorizoChozoBreaking_Falling 
    dw $0070,EnemyProjSpritemaps_BombTorizoChozoBreaking_9 
    dw Instruction_EnemyProjectile_Delete 

InstList_EnemyProjectile_BombTorizoChozoBreaking_Index14:
    dw $0040,EnemyProjSpritemaps_BombTorizoChozoBreaking_A 
    dw Instruction_EnemyProjectile_QueueSoundInY_Lib2_Max6 : db $0C 
    dw Instruction_EnemyProjectile_PreInstructionInY 
    dw PreInst_EnemyProjectile_BombTorizoChozoBreaking_Falling 
    dw $0070,EnemyProjSpritemaps_BombTorizoChozoBreaking_A 
    dw Instruction_EnemyProjectile_Delete 

InstList_EnemyProjectile_BombTorizoChozoBreaking_Index16:
    dw $0040,EnemyProjSpritemaps_BombTorizoChozoBreaking_B 
    dw Instruction_EnemyProjectile_QueueSoundInY_Lib2_Max6 : db $0C 
    dw Instruction_EnemyProjectile_PreInstructionInY 
    dw PreInst_EnemyProjectile_BombTorizoChozoBreaking_Falling 
    dw $0070,EnemyProjSpritemaps_BombTorizoChozoBreaking_B 
    dw Instruction_EnemyProjectile_Delete 

InstList_EnemyProjectile_BombTorizoChozoBreaking_Index18:
    dw $0040,EnemyProjSpritemaps_BombTorizoChozoBreaking_C 
    dw Instruction_EnemyProjectile_QueueSoundInY_Lib2_Max6 : db $0C 
    dw Instruction_EnemyProjectile_PreInstructionInY 
    dw PreInst_EnemyProjectile_BombTorizoChozoBreaking_Falling 
    dw $0070,EnemyProjSpritemaps_BombTorizoChozoBreaking_C 
    dw Instruction_EnemyProjectile_Delete 

InstList_EnemyProjectile_BombTorizoChozoBreaking_Index1A:
    dw $0040,EnemyProjSpritemaps_BombTorizoChozoBreaking_D 
    dw Instruction_EnemyProjectile_QueueSoundInY_Lib2_Max6 : db $0C 
    dw Instruction_EnemyProjectile_PreInstructionInY 
    dw PreInst_EnemyProjectile_BombTorizoChozoBreaking_Falling 
    dw $0070,EnemyProjSpritemaps_BombTorizoChozoBreaking_D 
    dw Instruction_EnemyProjectile_Delete 

InstList_EnemyProjectile_BombTorizoChozoBreaking_Index1C:
    dw $0040,EnemyProjSpritemaps_BombTorizoChozoBreaking_E 
    dw Instruction_EnemyProjectile_QueueSoundInY_Lib2_Max6 : db $0C 
    dw Instruction_EnemyProjectile_PreInstructionInY 
    dw PreInst_EnemyProjectile_BombTorizoChozoBreaking_Falling 
    dw $0070,EnemyProjSpritemaps_BombTorizoChozoBreaking_E 
    dw Instruction_EnemyProjectile_Delete 

InstList_EnemyProjectile_BombTorizoChozoBreaking_Index1E:
    dw $0040,EnemyProjSpritemaps_BombTorizoChozoBreaking_F 
    dw Instruction_EnemyProjectile_QueueSoundInY_Lib2_Max6 : db $0C 
    dw Instruction_EnemyProjectile_PreInstructionInY 
    dw PreInst_EnemyProjectile_BombTorizoChozoBreaking_Falling 
    dw $0070,EnemyProjSpritemaps_BombTorizoChozoBreaking_F 
    dw Instruction_EnemyProjectile_Delete 

InitAI_EnemyProjectile_BombTorizoContinuousDrool:
    LDA.W #$0000 : STA.W $19BB,Y 
    JSL.L GenerateRandomNumber 
    LSR A 
    AND.W #$000E 
    TAX 
    LDA.W .InstListPointers,X : STA.W $1B47,Y 
    JSL.L GenerateRandomNumber 
    LDX.W $0E54 
    LDA.W $0F7E,X : CLC : ADC.W #$FFFB : STA.W $1A93,Y 
    BIT.W $0FB4,X 
    BVC .checkLeft 
    LDA.W $05E5 : AND.W #$01FE 
    BRA .angleDetermined 


.checkLeft:
    BMI .checkRight 
    LDA.W #$00E0 : BRA .facingRight 


.checkRight:
    LDA.W #$0020 

.facingRight:
    STA.B $12 
    LDA.W $05E5 : AND.W #$000F 
    SEC : SBC.W #$0008 : CLC : ADC.B $12 : ASL A 

.angleDetermined:
    TAX 
    LDA.L SineCosineTables_8bitSine_SignExtended,X : STA.W $1AB7,Y 
    LDA.L SineCosineTables_NegativeCosine_SignExtended,X : STA.W $1ADB,Y 
    LDX.W $0E54 
    BIT.W $0FB4,X 
    BMI .move 
    LDA.W $0F7A,X : CLC : ADC.W #$FFF8 : STA.W $1A4B,Y 
    RTS 


.move:
    LDA.W $0F7A,X : CLC : ADC.W #$0008 : STA.W $1A4B,Y 
    RTS 


.InstListPointers:
    dw InstList_EnemyProj_BombTorizoLowHealthDrool_NoDelay_0 
    dw InstList_EnemyProj_BombTorizoLowHealthDrool_2FrameDelay 
    dw InstList_EnemyProj_BombTorizoLowHealthDrool_4FrameDelay 
    dw InstList_EnemyProj_BombTorizoLowHealthDrool_NoDelay_0 
    dw InstList_EnemyProj_BombTorizoLowHealthDrool_2FrameDelay 
    dw InstList_EnemyProj_BombTorizoLowHealthDrool_4FrameDelay 
    dw InstList_EnemyProj_BombTorizoLowHealthDrool_NoDelay_0 
    dw InstList_EnemyProj_BombTorizoLowHealthDrool_2FrameDelay 

InitAI_EnemyProjectile_BombTorizoInitialDrool:
    LDA.W #$0000 : STA.W $19BB,Y 
    JSL.L GenerateRandomNumber 
    LDX.W $0E54 
    LDA.W $05E5 : AND.W #$0003 
    CLC : ADC.W $0F7E,X : ADC.W #$FFFB : STA.W $1A93,Y 
    LDA.W $05E5 : AND.W #$001F 
    ADC.W #$0030 : STA.W $1ADB,Y 
    JSL.L GenerateRandomNumber 
    LDA.W $05E5 : AND.W #$0003 
    BIT.W $0FB4,X 
    BVC .notTurning 
    CLC : ADC.W $0F7A,X : STA.W $1A4B,Y 
    LDA.W #$0000 : STA.W $1AB7,Y 
    RTS 


.notTurning:
    BMI .facingRight 
    CLC : ADC.W $0F7A,X : ADC.W #$FFF8 : STA.W $1A4B,Y 
    LDA.W #$0000 : STA.W $1AB7,Y 
    RTS 


.facingRight:
    CLC : ADC.W $0F7A,X : ADC.W #$0008 : STA.W $1A4B,Y 
    LDA.W #$0000 : STA.W $1AB7,Y 
    RTS 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_InitAI_EnemyProjectile_BombTorizo_86A6C7:
    LDA.W #$0000 : STA.W $19BB,Y 
    LDX.W $1C27 
    JSL.L Calculate_PLM_Block_Coordinates 
    LDA.W $1C29 
    ASL #4
    STA.W $1A4B,Y 
    LDA.W $1C2B 
    ASL #4
    SEC : SBC.W #$0004 : STA.W $1A93,Y 
    LDA.W #$0000 : STA.W $1A27,Y 
    STA.W $1A6F,Y 
    RTS 
endif ; !FEATURE_KEEP_UNREFERENCED


InitAI_EnemyProjectile_BombTorizoExplosiveSwipe:
    LDX.W $0E54 
    LDA.W $0F7A,X : STA.B $12 
    LDA.W $0F7E,X : STA.B $14 
    BIT.W $0FB4,X 
    BMI .facingRight 
    LDX.W $1993 
    LDA.W .Xpositions,X : CLC : ADC.B $12 : STA.W $1A4B,Y 
    LDA.W .Yposition,X : CLC : ADC.B $14 : STA.W $1A93,Y 
    RTS 


.facingRight:
    LDX.W $1993 
    LDA.W .Xpositions,X 
    EOR.W #$FFFF 
    INC A 
    CLC : ADC.B $12 : STA.W $1A4B,Y 
    LDA.W .Yposition,X : CLC : ADC.B $14 : STA.W $1A93,Y 
    RTS 


.Xpositions:
    dw $FFE2,$FFD8,$FFD1,$FFE1,$FFEB,$FFFF,$FFE4,$FFD5,$FFD0,$FFE1 
    dw $FFEB ; Unused

.Yposition:
    dw $FFCC,$FFE4,$FFF5,$0009,$0015,$0014,$FFCC,$FFE5,$FFF6,$0009 
    dw $0014 ; Unused

InitAI_EnemyProj_BombTorizoChozoBreaking:
    LDX.W $1C27 
    JSL.L Calculate_PLM_Block_Coordinates 
    LDX.W $1993 
    LDA.W .InstListPointers,X : STA.W $1B47,Y 
    LDA.W $1C29 
    ASL #4
    CLC : ADC.W .Xoffsets,X : STA.W $1A4B,Y 
    TXA 
    AND.W #$000F 
    TAX 
    LDA.W $1C2B 
    ASL #4
    CLC : ADC.W .Yoffsets,X : STA.W $1A93,Y 
    LDA.W .Yvelocities,X : STA.W $1ADB,Y 
    LDA.W .Yaccelerations,X : STA.W $1B23,Y 
    LDA.W $1BD7,Y : ORA.W #$1000 : STA.W $1BD7,Y 
    RTS 


.InstListPointers:
    dw InstList_EnemyProjectile_BombTorizoChozoBreaking_Index0 
    dw InstList_EnemyProjectile_BombTorizoChozoBreaking_Index2 
    dw InstList_EnemyProjectile_BombTorizoChozoBreaking_Index4 
    dw InstList_EnemyProjectile_BombTorizoChozoBreaking_Index6 
    dw InstList_EnemyProjectile_BombTorizoChozoBreaking_Index8 
    dw InstList_EnemyProjectile_BombTorizoChozoBreaking_IndexA 
    dw InstList_EnemyProjectile_BombTorizoChozoBreaking_IndexC 
    dw InstList_EnemyProjectile_BombTorizoChozoBreaking_IndexE 
    dw InstList_EnemyProjectile_BombTorizoChozoBreaking_Index10 ; The rest are unused
    dw InstList_EnemyProjectile_BombTorizoChozoBreaking_Index12 
    dw InstList_EnemyProjectile_BombTorizoChozoBreaking_Index14 
    dw InstList_EnemyProjectile_BombTorizoChozoBreaking_Index16 
    dw InstList_EnemyProjectile_BombTorizoChozoBreaking_Index18 
    dw InstList_EnemyProjectile_BombTorizoChozoBreaking_Index1A 
    dw InstList_EnemyProjectile_BombTorizoChozoBreaking_Index1C 
    dw InstList_EnemyProjectile_BombTorizoChozoBreaking_Index1E 

.Xoffsets:
    dw $0008,$0018,$FFF8,$0008,$0018,$FFF8,$0008,$0018 
    dw $0008,$FFF8,$0018,$0008,$FFF8,$0018,$0008,$FFF8 ; Unused

.Yoffsets:
    dw $FFF8,$FFF8,$0008,$0008,$0008,$0018,$0018,$0018 

.Yvelocities:
    dw $0100,$0100,$0100,$0100,$0100,$0100,$0100,$0100 

.Yaccelerations:
    dw $0010,$0010,$0010,$0010,$0010,$0010,$0010,$0010 

InitAI_EnemyProjectile_BombTorizoLowHealthExplosion:
    LDX.W $0E54 
    LDA.W $0F7A,X : STA.W $1A4B,Y 
    LDA.W $0F7E,X : STA.W $1A93,Y 
    BIT.W $0FB4,X 
    BMI .facingRight 
    INC.W $1993 
    INC.W $1993 

.facingRight:
    INC.W $1993 
    INC.W $1993 
    LDX.W $1993 
    LDA.W $1A4B,Y : CLC : ADC.W .Xoffsets,X : STA.W $1A4B,Y 
    STA.W $1AFF,Y 
    LDA.W $1A93,Y : CLC : ADC.W .Yoffsets,X : STA.W $1A93,Y 
    STA.W $1B23,Y 
    RTS 

;        _______________ Unused
;       |      _________ Facing right
;       |     |      ___ Facing left
;       |     |     |
.Xoffsets: 
    dw $0000,$000C,$FFF4
    dw $0000,$0010,$FFF0                               
.Yoffsets: 
    dw $FFF8,$FFF8,$FFF8
    dw $FFEC,$FFEC,$FFEC                               

InitAI_EnemyProjectile_TorizoDeathExplosion:
    LDX.W $0E54 
    LDA.W $0F7A,X : STA.W $1A4B,Y 
    STA.W $1AFF,Y 
    LDA.W $0F7E,X : STA.W $1A93,Y 
    STA.W $1B23,Y 
    RTS 


PreInst_EnemyProjectile_BombTorizoLowHealthDrool_Falling:
    JSR.W Move_EnemyProjectile_Horizontally 
    BCS .hitWall 
    LDA.W $1AB7,X : BPL .right 
    CLC : ADC.W #$0004 : BMI + 
    LDA.W #$0003 

  + STA.W $1AB7,X 
    BRA .merge 


.right:
    SEC : SBC.W #$0004 : BPL + 
    LDA.W #$0003 

  + STA.W $1AB7,X 

.merge:
    JSR.W Move_EnemyProjectile_Vertically 
    BIT.W $1ADB,X 
    BMI + 
    BCS .hitFloor 

  + LDA.W $1ADB,X : CLC : ADC.W #$0010 : STA.W $1ADB,X 
    AND.W #$F000 
    CMP.W #$1000 : BNE .return 
    STZ.W $1997,X 

.return:
    RTS 


.hitWall:
    LDA.W #InstList_EnemyProj_BombTorizoLowHealthDrool_HitWall : STA.W $1B47,X 
    LDA.W #$0001 : STA.W $1B8F,X 
    RTS 


.hitFloor:
    LDA.W $1A93,X : SEC : SBC.W #$0003 : STA.W $1A93,X 
    LDA.W #InstList_EnemyProj_BombTorizoLowHealthDrool_HitFloor : STA.W $1B47,X 
    LDA.W #$0001 : STA.W $1B8F,X 
    RTS 


PreInst_EnemyProjectile_BombTorizoChozoBreaking_Falling:
    JSR.W Move_EnemyProjectile_Vertically 
    BIT.W $1ADB,X 
    BMI .negative 
    BCS .hitFloor 

.negative:
    LDA.W $1ADB,X : CLC : ADC.W $1B23 : STA.W $1ADB,X 
    AND.W #$F000 
    CMP.W #$1000 : BNE .return 
    LDA.W #$1000 : STA.W $1ADB,X 

.return:
    RTS 


.hitFloor:
    LDA.W #RTS_86A918 : STA.W $1A03,X 

RTS_86A918:
    RTS 


RTS_86A919:
    RTS 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_Debug_MoveEnemyProjectileWithController2:
    STZ.W $1AB7,X 
    LDA.B $8D : BIT.W #$0100 
    BEQ .checkLeft 
    LDA.W #$0100 : STA.W $1AB7,X 

.checkLeft:
    LDA.B $8D : BIT.W #$0200 
    BEQ .moveHorizontally 
    LDA.W #$FF00 : STA.W $1AB7,X 

.moveHorizontally:
    JSR.W Move_EnemyProjectile_Horizontally 
    STZ.W $1ADB,X 
    LDA.B $8D : BIT.W #$0400 
    BEQ .checkUp 
    LDA.W #$0100 : STA.W $1ADB,X 

.checkUp:
    LDA.B $8D : BIT.W #$0800 
    BEQ .moveVertically 
    LDA.W #$FF00 : STA.W $1ADB,X 

.moveVertically:
    JSR.W Move_EnemyProjectile_Vertically 
    RTS 
endif ; !FEATURE_KEEP_UNREFERENCED


EnemyProjectile_BombTorizoContinuousDrool:
    dw InitAI_EnemyProjectile_BombTorizoContinuousDrool ; Initialisation AI
    dw RTS_8684FB ; Initial pre-instruction
    dw InstList_EnemyProj_BombTorizoLowHealthDrool_NoDelay_0 ; Initial instruction list
    db $01,$02 ; X,Y radius
    dw $3000 ; Properties
    dw $0000 ; Hit instruction list
    dw InstList_EnemyProjectile_Delete ; Shot instruction list

EnemyProjectile_BombTorizoInitialDrool:
    dw InitAI_EnemyProjectile_BombTorizoInitialDrool ; Initialisation AI
    dw RTS_8684FB ; Initial pre-instruction
    dw InstList_EnemyProj_BombTorizoLowHealthDrool_NoDelay_0 ; Initial instruction list
    db $01,$02 ; X,Y radius
    dw $2000 ; Properties
    dw $0000 ; Hit instruction list
    dw InstList_EnemyProjectile_Delete ; Shot instruction list

if !FEATURE_KEEP_UNREFERENCED
UNUSED_EnemyProjectile_BombTorizo_86A977:
    dw UNUSED_InitAI_EnemyProjectile_BombTorizo_86A6C7 ; Initialisation AI
    dw PreInst_EnemyProjectile_BombTorizoChozoBreaking_Falling ; Initial pre-instruction
    dw UNUSED_InstList_EnemyProjectile_BombTorizo_86A49E ; Initial instruction list
    db $00,$00 ; X,Y radius
    dw $3000 ; Properties
    dw $0000 ; Hit instruction list
    dw InstList_EnemyProjectile_Delete ; Shot instruction list
endif ; !FEATURE_KEEP_UNREFERENCED

EnemyProjectile_BombTorizoExplosiveSwipe:
    dw InitAI_EnemyProjectile_BombTorizoExplosiveSwipe ; Initialisation AI
    dw RTS_86A919 ; Initial pre-instruction
    dw InstList_EnemyProjectile_BombTorizoExplosionSwipe ; Initial instruction list
    db $10,$10 ; X,Y radius
    dw $500A ; Properties
    dw $0000 ; Hit instruction list
    dw InstList_EnemyProjectile_Delete ; Shot instruction list

EnemyProjectile_BombTorizoStatueBreaking:
    dw InitAI_EnemyProj_BombTorizoChozoBreaking ; Initialisation AI
    dw RTS_8684FB ; Initial pre-instruction
    dw InstList_EnemyProjectile_BombTorizoChozoBreaking_Index10 ; Initial instruction list
    db $08,$08 ; X,Y radius
    dw $3000 ; Properties
    dw $0000 ; Hit instruction list
    dw InstList_EnemyProjectile_Delete ; Shot instruction list

EnemyProjectile_BombTorizoLowHealthExplosion:
    dw InitAI_EnemyProjectile_BombTorizoLowHealthExplosion ; Initialisation AI
    dw RTS_8684FB ; Initial pre-instruction
    dw InstList_EnemyProjectile_BombTorizoLowHealthExplosion_0 ; Initial instruction list
    db $04,$10 ; X,Y radius
    dw $3000 ; Properties
    dw $0000 ; Hit instruction list
    dw InstList_EnemyProjectile_Delete ; Shot instruction list

EnemyProjectile_BombTorizoDeathExplosion:
    dw InitAI_EnemyProjectile_TorizoDeathExplosion ; Initialisation AI
    dw RTS_8684FB ; Initial pre-instruction
    dw InstList_EnemyProjectile_TorizoDeathExplosion_0 ; Initial instruction list
    db $04,$10 ; X,Y radius
    dw $3000 ; Properties
    dw $0000 ; Hit instruction list
    dw InstList_EnemyProjectile_Delete ; Shot instruction list


if !FEATURE_KEEP_UNREFERENCED
UNUSED_EnemyProjectile_Graphics_QuestionMark_86A9BD:
incbin "../data/Tiles_EnemyProj_QuestionMark.bin" ; $80 bytes


UNUSED_InitAI_EnemyProjectile_QuestionMark_86AA3D:
    LDX.W $0330 
    LDA.W #$0040 : STA.B $D0,X 
    LDA.W #UNUSED_EnemyProjectile_Graphics_QuestionMark_86A9BD : STA.B $D2,X 
    LDA.W #$0086 : STA.B $D4,X 
    LDA.W #$6E00 : STA.B $D5,X 
    TXA 
    CLC : ADC.W #$0007 : STA.W $0330 
    LDX.W $0330 
    LDA.W #$0040 : STA.B $D0,X 
    LDA.W #UNUSED_EnemyProjectile_Graphics_QuestionMark_86A9BD+$40 : STA.B $D2,X 
    LDA.W #$0086 : STA.B $D4,X 
    LDA.W #$6F00 : STA.B $D5,X 
    TXA 
    CLC : ADC.W #$0007 : STA.W $0330 
    LDA.W $0AF6 : STA.W $1A4B,Y 
    LDA.W $0AFA : SEC : SBC.W #$0024 : STA.W $1A93,Y 
    RTS 


UNUSED_PreInstruction_EnemyProjectile_QuestionMark:
    STZ.B $12 
    STZ.B $14 
    LDA.W $0AF6 : SEC : SBC.W $1A4B,X : ASL #3
    BPL + 
    DEC.B $14 

  + STA.B $13 
    LDA.B $12 : CLC : ADC.W $1A27,X : STA.W $1A27,X 
    LDA.B $14 : ADC.W $1A4B,X : STA.W $1A4B,X 
    STZ.B $12 
    STZ.B $14 
    LDA.W $0AFA : SEC : SBC.W #$0024 : SEC : SBC.W $1A93,X : ASL #3
    BPL + 
    DEC.B $14 

  + STA.B $13 
    LDA.B $12 : CLC : ADC.W $1A6F,X : STA.W $1A6F,X 
    LDA.B $14 : ADC.W $1A93,X : STA.W $1A93,X 
    RTS 


UNUSED_InstList_EnemyProjectile_QuestionMark_0_86AADB:
    dw Instruction_EnemyProjectile_QueueSoundInY_Lib3_Max6 : db $09 
    dw $012C,UNUSED_EnemyProjSpritemaps_QuestionMark_8D8C4D 
    dw Instruction_EnemyProjectile_TimerInY,$0018 

UNUSED_InstList_EnemyProjectile_QuestionMark_1_86AAE6:
    dw $0002,UNUSED_EnemyProjSpritemaps_QuestionMark_8D8C4D 
    dw $0002,EnemyProjSpritemaps_Blank_Default 
    dw Instruction_EnemyProjectile_DecrementTimer_GotoYIfNonZero 
    dw UNUSED_InstList_EnemyProjectile_QuestionMark_1_86AAE6 

UNUSED_InstList_EnemyProjectile_Shot_QuestionMark_86AAF2:
    dw Instruction_EnemyProjectile_QueueSoundInY_Lib2_Max6 : db $0D 
    dw $0008,EnemyProjSpritemaps_Common_Smoke_0 
    dw $0008,EnemyProjSpritemaps_Common_Smoke_1 
    dw $0008,EnemyProjSpritemaps_Common_Smoke_2 
    dw $0008,EnemyProjSpritemaps_Common_Smoke_3 
    dw Instruction_EnemyProjectile_Delete 

UNUSED_EnemyProjectile_QuestionMark_86AB07:
    dw UNUSED_InitAI_EnemyProjectile_QuestionMark_86AA3D ; Initialisation AI
    dw UNUSED_PreInstruction_EnemyProjectile_QuestionMark ; Initial pre-instruction
    dw UNUSED_InstList_EnemyProjectile_QuestionMark_0_86AADB ; Initial instruction list
    db $00,$00 ; X,Y radius
    dw $B000,$0000 ; Properties, Hit instruction list
    dw UNUSED_InstList_EnemyProjectile_Shot_QuestionMark_86AAF2 ; Shot instruction list
endif ; !FEATURE_KEEP_UNREFERENCED

InstList_EnemyProjectile_TorizoChozoOrbs_Left:
    dw $0055,EnemyProjSpritemaps_TorizoChozoOrbs_0 
    dw Instruction_EnemyProjectile_GotoY 
    dw InstList_EnemyProjectile_TorizoChozoOrbs_Left 

InstList_EnemyProjectile_TorizoChozoOrbs_Right:
    dw $0055,EnemyProjSpritemaps_TorizoChozoOrbs_1 
    dw Instruction_EnemyProjectile_GotoY 
    dw InstList_EnemyProjectile_TorizoChozoOrbs_Right 

InstList_EnemyProjectile_TorizoChozoOrbs_BreakOnWall:
    dw Instruction_EnemyProjectile_ClearPreInstruction 
    dw Instruction_EnemyProjectile_Properties_OrY,$5000 
    dw $0004,EnemyProjSpritemaps_Common_0 
    dw $0004,EnemyProjSpritemaps_Common_1 
    dw $0004,EnemyProjSpritemaps_Common_2 
    dw $0004,EnemyProjSpritemaps_Common_3 
    dw $0004,EnemyProjSpritemaps_Common_4 
    dw Instruction_EnemyProjectile_Delete 

InstList_EnemyProjectile_TorizoChozoOrbs_BreakOnFloor:
    dw Instruction_EnemyProjectile_ClearPreInstruction 
    dw Instruction_EnemyProjectile_Properties_AndY,$DFFF 
    dw Instruction_EnemyProjectile_Properties_OrY,$5000 
    dw Instruction_EnemyProjectile_QueueSoundInY_Lib3_Max6 : db $13 
    dw $0004,EnemyProjSpritemaps_TorizoChozoOrbs_GoldenTorizoEyeBeam_0 
    dw $0005,EnemyProjSpritemaps_TorizoChozoOrbs_GoldenTorizoEyeBeam_1 
    dw $0006,EnemyProjSpritemaps_TorizoChozoOrbs_GoldenTorizoEyeBeam_2 
    dw $0007,EnemyProjSpritemaps_TorizoChozoOrbs_GoldenTorizoEyeBeam_3 
    dw $0008,EnemyProjSpritemaps_TorizoChozoOrbs_GoldenTorizoEyeBeam_4 
    dw $0009,EnemyProjSpritemaps_TorizoChozoOrbs_GoldenTorizoEyeBeam_5 
    dw Instruction_EnemyProjectile_Delete 

InstList_EnemyProjectile_Shot_TorizoChozoOrbs:
    dw Instruction_EnemyProjectile_ClearPreInstruction 
    dw Instruction_EnemyProjectile_Properties_OrY,$5000 
    dw $0004,EnemyProjSpritemaps_Common_0 
    dw $0004,EnemyProjSpritemaps_Common_1 
    dw $0004,EnemyProjSpritemaps_Common_2 
    dw $0004,EnemyProjSpritemaps_Common_3 
    dw $0004,EnemyProjSpritemaps_Common_4 
    dw Instruction_EnemyProjectile_SpawnEnemyDropsWIthYDropChances 
    dw EnemyHeaders_BombTorizoOrb 
    dw EnemyHeaders_GoldenTorizoOrb 
    dw Instruction_EnemyProjectile_Delete 

Instruction_EnemyProjectile_SpawnEnemyDropsWIthYDropChances:
    PHY : PHX 
    LDA.W $1A4B,X : STA.B $12 
    LDA.W $1A93,X : STA.B $14 
    LDA.W $079F : BEQ .crateria 
    LDA.W $0002,Y : BRA .spawnDrops 


.crateria:
    LDA.W $0000,Y 

.spawnDrops:
    JSL.L Spawn_Enemy_Drops 
    PLX : PLY 
    INY #4
    RTS 


InitAI_EnemyProjectile_TorizoChozoOrbs_Egg_EyeBeam_Common:
    LDA.W $0000,X : STA.W $1B47,Y 
    LDA.B $12 : CLC : ADC.W $0002,X : STA.W $1A4B,Y 
    JSL.L GenerateRandomNumber 
    AND.W #$00FF 
    SEC : SBC.W #$0080 : CLC : ADC.W $0004,X : STA.W $1AB7,Y 
    LDA.B $14 : CLC : ADC.W $0006,X : STA.W $1A93,Y 
    JSL.L GenerateRandomNumber 
    AND.W #$00FF 
    SEC : SBC.W #$0080 : CLC : ADC.W $0008,X : STA.W $1ADB,Y 
    RTS 


InitAI_EnemyProjectile_BombTorizoChozoOrbs:
    LDX.W $0E54 
    LDA.W $0F7A,X : STA.B $12 
    LDA.W $0F7E,X : STA.B $14 
    BIT.W $0FB4,X 
    BMI .facingRight 
    LDX.W #.left 
    BRA .gotoCommon 


.facingRight:
    LDX.W #.right 

.gotoCommon:
    JMP.W InitAI_EnemyProjectile_TorizoChozoOrbs_Egg_EyeBeam_Common 

;        _____________________ X offset
;       |      _______________ X velocity (unit 1/100h px/frame)
;       |     |      _________ Y offset
;       |     |     |      ___ Y velocity (unit 1/100h px/frame)
;       |     |     |     |
.right:
    dw InstList_EnemyProjectile_TorizoChozoOrbs_Right 
    dw $001B,$0190,$FFD8,$FE60 
.left:
    dw InstList_EnemyProjectile_TorizoChozoOrbs_Left 
    dw $FFE5,$FE70,$FFD8,$FE60 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_InitializeTorizoChozoOrbToTargetSamus:
    JSL.L GenerateRandomNumber 
    LDX.W $0E54 
    JSL.L CalculateAngleOfSamusFromEnemy 
    STA.B $12 
    LDA.W $05E5 : AND.W #$000F 
    SEC : SBC.W #$0008 : CLC : ADC.B $12 : ASL A 
    TAX 
    LDA.L SineCosineTables_8bitSine_SignExtended,X 
    ASL A 
    STA.W $1AB7,Y 
    LDA.L SineCosineTables_NegativeCosine_SignExtended,X 
    ASL A 
    STA.W $1ADB,Y 
    LDX.W $0E54 
    LDA.W $0F7E,X : CLC : ADC.W #$FFD8 : STA.W $1A93,Y 
    BIT.W $0FB4,X 
    BMI .facingRight 
    LDA.W $0F7A,X : CLC : ADC.W #$FFE5 : STA.W $1A4B,Y 
    LDA.W #InstList_EnemyProjectile_TorizoChozoOrbs_Left : STA.W $1B47,Y 
    RTS 


.facingRight:
    LDA.W $0F7A,X : CLC : ADC.W #$001B : STA.W $1A4B,Y 
    LDA.W #InstList_EnemyProjectile_TorizoChozoOrbs_Right : STA.W $1B47,Y 
    RTS 
endif ; !FEATURE_KEEP_UNREFERENCED


InitAI_EnemyProjectile_GoldenTorizosChozoOrbs:
    LDX.W $0E54 
    LDA.W $0F7A,X : STA.B $12 
    LDA.W $0F7E,X : STA.B $14 
    BIT.W $0FB4,X 
    BMI .facingRight 
    LDX.W #.left 
    BRA .gotoCommon 


.facingRight:
    LDX.W #.right 

.gotoCommon:
    JMP.W InitAI_EnemyProjectile_TorizoChozoOrbs_Egg_EyeBeam_Common 

;        _____________________ X offset
;       |      _______________ X velocity (unit 1/100h px/frame)
;       |     |      _________ Y offset
;       |     |     |      ___ Y velocity (unit 1/100h px/frame)
;       |     |     |     |
.right:
    dw InstList_EnemyProjectile_TorizoChozoOrbs_Right 
    dw $001B,$0100,$FFD8,$FE40 
.left:
    dw InstList_EnemyProjectile_TorizoChozoOrbs_Left 
    dw $FFE5,$FF00,$FFD8,$FE40 


PreInstruction_EnemyProjectile_BombTorizosChozoOrbs:
    JSR.W Move_EnemyProjectile_Horizontally 
    BCS .hitWall 
    JSR.W Move_EnemyProjectile_Vertically 
    BIT.W $1ADB,X 
    BMI .greaterThanZero 
    BCS .hitFloor 

.greaterThanZero:
    LDA.W $1ADB,X : CLC : ADC.W #$0012 : STA.W $1ADB,X 
    AND.W #$F000 
    CMP.W #$1000 : BNE .return 
    STZ.W $1997,X 

.return:
    RTS 


.hitWall:
    LDA.W #InstList_EnemyProjectile_TorizoChozoOrbs_BreakOnWall : STA.W $1B47,X 
    LDA.W #$0001 : STA.W $1B8F,X 
    RTS 


.hitFloor:
    LDA.W $1A93,X : AND.W #$FFF0 
    ORA.W #$0008 
    DEC #2
    STA.W $1A93,X 
    LDA.W #InstList_EnemyProjectile_TorizoChozoOrbs_BreakOnFloor : STA.W $1B47,X 
    LDA.W #$0001 : STA.W $1B8F,X 
    RTS 


PreInstruction_EnemyProjectile_GoldenTorizosChozoOrbs:
    JSR.W Move_EnemyProjectile_Horizontally 
    BCC .noCollision 
    LDA.W $1AB7,X 
    EOR.W #$FFFF 
    INC A 
    STA.W $1AB7,X 

.noCollision:
    JSR.W Move_EnemyProjectile_Vertically 
    BCC .bounceEnd 
    BIT.W $1ADB,X 
    BMI .bounceEnd 
    LDA.W $1AB7,X : BPL .subtract40 
    CLC : ADC.W #$0040 : BRA + 


.subtract40:
    SEC : SBC.W #$0040 

  + STA.W $1AB7,X 
    LDA.W $1ADB,X 
    LSR A 
    EOR.W #$FFFF 
    INC A 
    STA.W $1ADB,X 
    AND.W #$FF80 
    CMP.W #$FF80 : BEQ .break 

.bounceEnd:
    LDA.W $1ADB,X : CLC : ADC.W #$0018 : STA.W $1ADB,X 
    RTS 


.break:
    LDA.W $1A93,X : AND.W #$FFF0 
    ORA.W #$0008 
    DEC #2
    STA.W $1A93,X 
    LDA.W #InstList_EnemyProjectile_TorizoChozoOrbs_BreakOnFloor : STA.W $1B47,X 
    LDA.W #$0001 : STA.W $1B8F,X 
    RTS 


EnemyProjectile_BombTorizoChozoOrbs:
    dw InitAI_EnemyProjectile_BombTorizoChozoOrbs ; Initialisation AI
    dw PreInstruction_EnemyProjectile_BombTorizosChozoOrbs ; Initial pre-instruction
    dw InstList_EnemyProjectile_TorizoChozoOrbs_Left ; Initial instruction list
    db $07,$07 ; X,Y radius
    dw $9008 ; Properties
    dw $0000 ; Hit instruction list
    dw InstList_EnemyProjectile_Shot_TorizoChozoOrbs ; Shot instruction list

EnemyProjectile_BombTorizoChozoOrbsHigherDamage:
    dw InitAI_EnemyProjectile_BombTorizoChozoOrbs ; Initialisation AI
    dw PreInstruction_EnemyProjectile_BombTorizosChozoOrbs ; Initial pre-instruction
    dw InstList_EnemyProjectile_TorizoChozoOrbs_Left ; Initial instruction list
    db $07,$07 ; X,Y radius
    dw $900A ; Properties
    dw $0000 ; Hit instruction list
    dw InstList_EnemyProjectile_Shot_TorizoChozoOrbs ; Shot instruction list

EnemyProjectile_GoldenTorizoChozoOrbs:
    dw InitAI_EnemyProjectile_GoldenTorizosChozoOrbs ; Initialisation AI
    dw PreInstruction_EnemyProjectile_GoldenTorizosChozoOrbs ; Initial pre-instruction
    dw InstList_EnemyProjectile_TorizoChozoOrbs_Left ; Initial instruction list
    db $07,$07 ; X,Y radius
    dw $B050 ; Properties
    dw $0000 ; Hit instruction list
    dw InstList_EnemyProjectile_Shot_TorizoChozoOrbs ; Shot instruction list

if !FEATURE_KEEP_UNREFERENCED
UNUSED_InstList_EnemyProjectile_86AD88:
    dw Instruction_EnemyProjectile_PreInstructionInY 
    dw PreInstruction_EnemyProjectile_TorizoSonicBoom 
    dw UNUSED_Instruction_EnemyProj_MoveHorizontally_GotoY_86AD92 
    dw InstList_EnemyProjectile_TorizoSonicBoom_MovingLeft 
    dw InstList_EnemyProjectile_TorizoSonicBoom_MovingRight 

UNUSED_Instruction_EnemyProj_MoveHorizontally_GotoY_86AD92:
    STZ.B $12 
    STZ.B $14 
    LDA.W $1AB7,X : BPL + 
    DEC.B $14 

  + STA.B $13 
    LDA.W $1A27,X : CLC : ADC.B $12 : STA.W $1A27,X 
    LDA.W $1A4B,X : ADC.B $14 : STA.W $1A4B,X 
    LDA.W $1AB7,X : BPL .greaterThan0 
    LDA.W $0000,Y 
    TAY 
    RTS 


.greaterThan0:
    LDA.W $0002,Y 
    TAY 
    RTS 
endif ; !FEATURE_KEEP_UNREFERENCED


InstList_EnemyProjectile_TorizoSonicBoom_FiredLeft:
    dw Instruction_EnemyProjectile_QueueSoundInY_Lib2_Max6 : db $48 
    dw $0006,EnemyProjSpritemaps_TorizoSonicBoom_0 
    dw $0006,EnemyProjSpritemaps_TorizoSonicBoom_1 

InstList_EnemyProjectile_TorizoSonicBoom_MovingLeft:
    dw $0050,EnemyProjSpritemaps_TorizoSonicBoom_2 
    dw Instruction_EnemyProjectile_GotoY 
    dw InstList_EnemyProjectile_TorizoSonicBoom_MovingLeft 

InstList_EnemyProjectile_TorizoSonicBoom_FiredRight:
    dw Instruction_EnemyProjectile_QueueSoundInY_Lib2_Max6 : db $48 
    dw $0006,EnemyProjSpritemaps_TorizoSonicBoom_3 
    dw $0006,EnemyProjSpritemaps_TorizoSonicBoom_4 

InstList_EnemyProjectile_TorizoSonicBoom_MovingRight:
    dw $0050,EnemyProjSpritemaps_TorizoSonicBoom_5 
    dw Instruction_EnemyProjectile_GotoY 
    dw InstList_EnemyProjectile_TorizoSonicBoom_MovingRight 

InstList_EnemyProjectile_TorizoSonicBoom_HitWall_0:
    dw Instruction_EnemyProjectile_ClearPreInstruction 
    dw Instruction_EnemyProjectile_DisableCollisionWIthSamusProj 
    dw Instruction_EnemyProjectile_DisableCollisionWithSamus 
    dw Instruction_EnemyProjectile_SetHighPriority 
    dw Instruction_EnemyProjectile_TimerInY,$0005 

InstList_EnemyProjectile_TorizoSonicBoom_HitWall_1:
    dw Instruction_EnemyProjectile_Torizo_ResetPosition 
    dw Instruction_MoveRandomlyWithinXRadius_YRadius 
    db $0F,$00,$1F,$00 
    dw $0002,EnemyProjSpritemaps_Common_0 
    dw $0002,EnemyProjSpritemaps_Common_1 
    dw $0003,EnemyProjSpritemaps_Common_2 
    dw $0003,EnemyProjSpritemaps_Common_3 
    dw $0002,EnemyProjSpritemaps_Common_4 
    dw RTS_8681DE 
    dw Instruction_EnemyProjectile_DecrementTimer_GotoYIfNonZero 
    dw InstList_EnemyProjectile_TorizoSonicBoom_HitWall_1 
    dw Instruction_EnemyProjectile_Delete 

InitAI_EnemyProjectile_TorizoSonicBoom:
    JSL.L GenerateRandomNumber 
    LDX.W $0E54 
    LDA.W $05E5 : AND.W #$0001 
    BEQ .A14 
    LDA.W #$FFF4 : BRA + 


.A14:
    LDA.W #$0014 

  + CLC : ADC.W $0F7E,X : STA.W $1A93,Y 
    LDA.W #$0000 : STA.W $1ADB,Y 
    BIT.W $0FB4,X 
    BMI .facingRight 
    LDA.W $0F7A,X : CLC : ADC.W #$FFE0 : STA.W $1A4B,Y 
    LDA.W #$FD90 : STA.W $1AB7,Y 
    LDA.W #InstList_EnemyProjectile_TorizoSonicBoom_FiredLeft : STA.W $1B47,Y 
    RTS 


.facingRight:
    LDA.W $0F7A,X : CLC : ADC.W #$0020 : STA.W $1A4B,Y 
    LDA.W #$0270 : STA.W $1AB7,Y 
    LDA.W #InstList_EnemyProjectile_TorizoSonicBoom_FiredRight : STA.W $1B47,Y 
    RTS 


PreInstruction_EnemyProjectile_TorizoSonicBoom:
    JSR.W Move_EnemyProjectile_Horizontally 
    BCS .hitWall 
    LDA.W $1AB7,X : BMI .subtract10 
    CLC : ADC.W #$0010 : BRA + 


.subtract10:
    SEC : SBC.W #$0010 

  + STA.W $1AB7,X 
    AND.W #$F000 
    CMP.W #$1000 : BNE .return 
    STZ.W $1997,X 

.return:
    RTS 


.hitWall:
    LDA.W #InstList_EnemyProjectile_TorizoSonicBoom_HitWall_0 : STA.W $1B47,X 
    LDA.W #$0001 : STA.W $1B8F,X 
    LDA.W $1A4B,X : STA.W $1AFF,X 
    LDA.W $1A93,X : STA.W $1B23,X 
    RTS 


EnemyProjectile_BombTorizoSonicBoom:
    dw InitAI_EnemyProjectile_TorizoSonicBoom ; Initialisation AI
    dw PreInstruction_EnemyProjectile_TorizoSonicBoom ; Initial pre-instruction
    dw InstList_EnemyProjectile_TorizoSonicBoom_FiredLeft ; Initial instruction list
    db $03,$14 ; X,Y radius
    dw $100A ; Properties
    dw $0000 ; Hit instruction list
    dw InstList_EnemyProjectile_Delete ; Shot instruction list

EnemyProjectile_GoldenTorizoSonicBoom:
    dw InitAI_EnemyProjectile_TorizoSonicBoom ; Initialisation AI
    dw PreInstruction_EnemyProjectile_TorizoSonicBoom ; Initial pre-instruction
    dw InstList_EnemyProjectile_TorizoSonicBoom_FiredLeft ; Initial instruction list
    db $03,$14 ; X,Y radius
    dw $1078 ; Properties
    dw $0000 ; Hit instruction list
    dw InstList_EnemyProjectile_Delete ; Shot instruction list

InstList_EnemyProj_WreckedShipChozoSpikeClearingFootsteps:
    dw Instruction_MoveRandomlyWithinXRadius_YRadius 
    db $0F,$00,$0F,$03 
    dw $0002,EnemyProjSpritemaps_Common_BigDustCloud_0 
    dw $0002,EnemyProjSpritemaps_Common_BigDustCloud_1 
    dw $0002,EnemyProjSpritemaps_Common_BigDustCloud_2 
    dw $0002,EnemyProjSpritemaps_Common_BigDustCloud_3 
    dw Instruction_EnemyProjectile_Delete 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_InstList_EnemyProj_SpikeClearingExplosions_86AEDC:
    dw Instruction_MoveRandomlyWithinXRadius_YRadius 
    db $0F,$00,$0F,$03 
    dw $0005,EnemyProjSpritemaps_Common_BigExplosion_0 
    dw $0005,EnemyProjSpritemaps_Common_BigExplosion_1 
    dw $0005,EnemyProjSpritemaps_Common_BigExplosion_2 
    dw $0005,EnemyProjSpritemaps_Common_BigExplosion_3 
    dw $0005,EnemyProjSpritemaps_Common_BigExplosion_4 
    dw $0005,EnemyProjSpritemaps_Common_BigExplosion_5 
    dw Instruction_EnemyProjectile_Delete 
endif ; !FEATURE_KEEP_UNREFERENCED

InitAI_EnemyProj_WreckedShipChozoSpikeClearingFootsteps:
    LDX.W $0E54 
    LDA.W $0F7A,X : CLC : ADC.W $1993 : STA.W $1A4B,Y 
    LDA.W $0F7E,X : CLC : ADC.W #$001C : STA.W $1A93,Y 
    RTS 


InstList_EnemyProj_TourianStatueDustClouds_0:
    dw Instruction_EnemyProjectile_TimerInY,$0040 

InstList_EnemyProj_TourianStatueDustClouds_1:
    dw Instruction_EnemyProjectile_ResetPosition 
    dw Instruction_MoveRandomlyWithinXRadius_YRadius 
    db $3F,$00,$03,$00 
    dw $0002,EnemyProjSpritemaps_Common_BigDustCloud_0 
    dw $0002,EnemyProjSpritemaps_Common_BigDustCloud_1 
    dw $0002,EnemyProjSpritemaps_Common_BigDustCloud_2 
    dw $0002,EnemyProjSpritemaps_Common_BigDustCloud_3 
    dw Instruction_EnemyProjectile_DecrementTimer_GotoYIfNonZero 
    dw InstList_EnemyProj_TourianStatueDustClouds_1 
    dw Instruction_EnemyProjectile_Delete 

Instruction_EnemyProjectile_ResetPosition:
    LDA.W $1AFF,X : STA.W $1A4B,X 
    LDA.W $1B23,X : STA.W $1A93,X 
    RTS 


InitAI_EnemyProjectile_TourianStatueDustClouds:
    LDA.W #$0080 : STA.W $1AFF,Y 
    LDA.W #$00BC : STA.W $1B23,Y 
    RTS 


InitAI_EnemyProjectile_TorizoLandingDustCloud_RightFoot:
    LDX.W $0E54 
    LDA.W $0F7E,X : CLC : ADC.W #$0030 : STA.W $1A93,Y 
    LDA.W $0F7A,X : CLC : ADC.W #$0018 : STA.W $1A4B,Y 
    RTS 


EnemyProjectile_WreckedShipChozoSpikeClearingFootsteps:
    dw InitAI_EnemyProj_WreckedShipChozoSpikeClearingFootsteps ; Initialisation AI
    dw RTS_8684FB ; Initial pre-instruction
    dw InstList_EnemyProj_WreckedShipChozoSpikeClearingFootsteps ; Initial instruction list
    db $00,$00 ; X,Y radius
    dw $3000,$0000 ; Properties, Hit instruction list
    dw InstList_EnemyProjectile_Delete ; Shot instruction list

if !FEATURE_KEEP_UNREFERENCED
UNUSED_EnemyProjectile_SpikeClearingExplosions_86AF76:
    dw InitAI_EnemyProj_WreckedShipChozoSpikeClearingFootsteps ; Initialisation AI
    dw RTS_8684FB ; Initial pre-instruction
    dw UNUSED_InstList_EnemyProj_SpikeClearingExplosions_86AEDC ; Initial instruction list
    db $00,$00 ; X,Y radius
    dw $3000,$0000 ; Properties, Hit instruction list
    dw InstList_EnemyProjectile_Delete ; Shot instruction list
endif ; !FEATURE_KEEP_UNREFERENCED

EnemyProjectile_TourianStatueDustClouds:
    dw InitAI_EnemyProjectile_TourianStatueDustClouds ; Initialisation AI
    dw RTS_8684FB ; Initial pre-instruction
    dw InstList_EnemyProj_TourianStatueDustClouds_0 ; Initial instruction list
    db $00,$00 ; X,Y radius
    dw $3000,$0000 ; Properties, Hit instruction list
    dw InstList_EnemyProjectile_Delete ; Shot instruction list

Instruction_EnemyProjectile_TorizoLandingDustClouds:
    LDA.W $1A93,X : SEC : SBC.W #$0004 : STA.W $1A93,X 
    RTS 


InstList_EnemyProjectile_TorizoLandingDustCloud_RightFoot:
    dw $0004,EnemyProjSpritemaps_TorizoLandingDustCloud_Right_0 
    dw Instruction_EnemyProjectile_TorizoLandingDustClouds 
    dw $0004,EnemyProjSpritemaps_TorizoLandingDustCloud_Right_1 
    dw Instruction_EnemyProjectile_TorizoLandingDustClouds 
    dw $0004,EnemyProjSpritemaps_TorizoLandingDustCloud_Right_2 
    dw Instruction_EnemyProjectile_TorizoLandingDustClouds 
    dw $0004,EnemyProjSpritemaps_TorizoLandingDustCloud_Right_3 
    dw Instruction_EnemyProjectile_Delete 

InstList_EnemyProjectile_TorizoLandingDustCloud_LeftFoot:
    dw $0004,EnemyProjSpritemaps_TorizoLandingDustCloud_Left_0 
    dw Instruction_EnemyProjectile_TorizoLandingDustClouds 
    dw $0004,EnemyProjSpritemaps_TorizoLandingDustCloud_Left_1 
    dw Instruction_EnemyProjectile_TorizoLandingDustClouds 
    dw $0004,EnemyProjSpritemaps_TorizoLandingDustCloud_Left_2 
    dw Instruction_EnemyProjectile_TorizoLandingDustClouds 
    dw $0004,EnemyProjSpritemaps_TorizoLandingDustCloud_Left_3 
    dw Instruction_EnemyProjectile_Delete 

InitAI_EnemyProjectile_TorizoLandingDustCloud_LeftFoot:
    LDX.W $0E54 
    LDA.W $0F7E,X : CLC : ADC.W #$0030 : STA.W $1A93,Y 
    LDA.W $0F7A,X : SEC : SBC.W #$0018 : STA.W $1A4B,Y 
    RTS 


EnemyProjectile_TorizoLandingDustCloud_RightFoot:
    dw InitAI_EnemyProjectile_TorizoLandingDustCloud_RightFoot ; Initialisation AI
    dw RTS_8684FB ; Initial pre-instruction
    dw InstList_EnemyProjectile_TorizoLandingDustCloud_RightFoot ; Initial instruction list
    db $00,$00 ; X,Y radius
    dw $3000 ; Properties
    dw $0000 ; Hit instruction list
    dw InstList_EnemyProjectile_Delete ; Shot instruction list

EnemyProjectile_TorizoLandingDustCloud_LeftFoot:
    dw InitAI_EnemyProjectile_TorizoLandingDustCloud_LeftFoot ; Initialisation AI
    dw RTS_8684FB ; Initial pre-instruction
    dw InstList_EnemyProjectile_TorizoLandingDustCloud_LeftFoot ; Initial instruction list
    db $00,$00 ; X,Y radius
    dw $3000 ; Properties
    dw $0000 ; Hit instruction list
    dw InstList_EnemyProjectile_Delete ; Shot instruction list

InitAI_EnemyProjectile_GoldenTorizoEgg:
    LDX.W $0E54 
    LDA.W $0F7A,X : STA.B $12 
    LDA.W $0F7E,X : STA.B $14 
    LDA.L GenerateRandomNumber ; >_<
    AND.W #$001F 
    CLC : ADC.W #$0040 : STA.W $1B23,Y 
    LDA.W $0FB4,X : STA.W $1AFF,Y 
    BMI .right 
    LDX.W #.leftwards 
    BRA .gotoCommon 


.right:
    LDX.W #.rightwards 

.gotoCommon:
    JMP.W InitAI_EnemyProjectile_TorizoChozoOrbs_Egg_EyeBeam_Common 

;        _____________________ X offset
;       |      _______________ X velocity (unit 1/100h px/frame)
;       |     |      _________ Y offset
;       |     |     |      ___ Y velocity (unit 1/100h px/frame)
;       |     |     |     |
.rightwards:
    dw InstList_EnemyProjectile_GoldenTorizoEgg_BouncingRight 
    dw $0010,$0080,$FFFF,$FE80 
.leftwards:
    dw InstList_EnemyProjectile_GoldenTorizoEgg_BouncingLeft 
    dw $FFF0,$FF80,$FFFF,$FE80 

PreInstruction_EnemyProjectile_GoldenTorizoEgg_Bouncing:
    DEC.W $1B23,X 
    BMI .hatch 
    JSR.W Move_EnemyProjectile_Horizontally 
    BCC .moveVertically 
    LDA.W $1AB7,X 
    EOR.W #$FFFF 
    INC A 
    STA.W $1AB7,X 
    LDA.W $1AFF,X : EOR.W #$8000 : STA.W $1AFF,X 

.moveVertically:
    JSR.W Move_EnemyProjectile_Vertically 
    BCC .bounceEnd 
    BIT.W $1ADB,X 
    BMI .bounceEnd 
    LDA.W $1AB7,X : BPL .subtract20 
    CLC : ADC.W #$0020 : BRA + 


.subtract20:
    SEC : SBC.W #$0020 

  + STA.W $1AB7,X 
    LDA.W $1ADB,X 
    EOR.W #$FFFF 
    INC A 
    STA.W $1ADB,X 

.bounceEnd:
    LDA.W $1ADB,X : CLC : ADC.W #$0030 : STA.W $1ADB,X 
    AND.W #$F000 
    CMP.W #$1000 : BNE .return 
    STZ.W $1997,X 

.return:
    RTS 


.hatch:
    INC.W $1B47,X 
    INC.W $1B47,X 
    LDA.W #$0001 : STA.W $1B8F,X 
    BIT.W $1AFF,X 
    BMI .rightwards 
    LDA.W #$FF00 : BRA + 


.rightwards:
    LDA.W #$0100 

  + STA.W $1AB7,X 
    RTS 


PreInstruction_EnemyProjectile_GoldenTorizoEgg_Hatched:
    JSR.W Move_EnemyProjectile_Horizontally 
    BCS .hitWall 
    BIT.W $1AFF,X 
    BMI .rightwards 
    LDA.W #$FFD0 : BRA + 


.rightwards:
    LDA.W #$0030 

  + CLC : ADC.W $1AB7,X : STA.W $1AB7,X 
    RTS 


.hitWall:
    LDA.W #PreInstruction_EnemyProjectile_GoldenTorizoEgg_HitWall : STA.W $1A03,X 
    STZ.W $1ADB,X 
    RTS 


PreInstruction_EnemyProjectile_GoldenTorizoEgg_HitWall:
    JSR.W Move_EnemyProjectile_Vertically 
    BCS .collision 
    LDA.W #$0030 : CLC : ADC.W $1ADB,X : STA.W $1ADB,X 
    RTS 


.collision:
    BIT.W $1AFF,X 
    BMI .rightwards 
    LDA.W #InstList_EnemyProjectile_GoldenTorizoEgg_Break_FacingLeft : BRA + 


.rightwards:
    LDA.W #InstList_EnemyProjectile_GoldenTorizoEgg_Break_FacingRight 

  + STA.W $1B47,X 
    LDA.W #$0001 : STA.W $1B8F,X 
    RTS 


InstList_EnemyProjectile_GoldenTorizoEgg_BouncingLeft:
    dw $0030,EnemyProjSpritemaps_GoldenTorizoEgg_0 
    dw Instruction_EnemyProjectile_Sleep 
    dw Instruction_EnemyProjectile_ClearPreInstruction 
    dw $0004,EnemyProjSpritemaps_GoldenTorizoEgg_1 
    dw $0004,EnemyProjSpritemaps_GoldenTorizoEgg_2 
    dw $0004,EnemyProjSpritemaps_GoldenTorizoEgg_3 
    dw Instruction_EnemyProjectile_GotoY 
    dw InstList_EnemyProjectile_GoldenTorizoEgg_Hatch 

InstList_EnemyProjectile_GoldenTorizoEgg_BouncingRight:
    dw $0030,EnemyProjSpritemaps_GoldenTorizoEgg_C 
    dw Instruction_EnemyProjectile_Sleep 
    dw Instruction_EnemyProjectile_ClearPreInstruction 
    dw $0004,EnemyProjSpritemaps_GoldenTorizoEgg_D 
    dw $0004,EnemyProjSpritemaps_GoldenTorizoEgg_E 
    dw $0004,EnemyProjSpritemaps_GoldenTorizoEgg_F 
    dw Instruction_EnemyProjectile_GotoY 
    dw InstList_EnemyProjectile_GoldenTorizoEgg_Hatch 

InstList_EnemyProjectile_GoldenTorizoEgg_Hatch:
    dw Instruction_EnemyProjectile_Properties_AndY,$DFFF 
    dw Instruction_EnemyProjectile_Properties_OrY,$8000 
    dw Instruction_EnemyProjectile_GoldenTorizoEgg_GoToHatched 

Instruction_EnemyProjectile_GoldenTorizoEgg_GoToHatched:
    BIT.W $1AFF,X 
    BMI .rightwards 
    LDY.W #InstList_EnemyProjectile_GoldenTorizoEgg_Hatched_Left_0 
    RTS 


.rightwards:
    LDY.W #InstList_EnemyProjectile_GoldenTorizoEgg_Hatched_Right_0 
    RTS 


InstList_EnemyProjectile_GoldenTorizoEgg_Hatched_Left_0:
    dw Instruction_EnemyProjectile_QueueSoundInY_Lib2_Max6 : db $22 
    dw Instruction_EnemyProjectile_PreInstructionInY 
    dw PreInstruction_EnemyProjectile_GoldenTorizoEgg_Hatched 

InstList_EnemyProjectile_GoldenTorizoEgg_Hatched_Left_1:
    dw $0006,EnemyProjSpritemaps_GoldenTorizoEgg_4 
    dw $0006,EnemyProjSpritemaps_GoldenTorizoEgg_5 
    dw $0006,EnemyProjSpritemaps_GoldenTorizoEgg_6 
    dw $0006,EnemyProjSpritemaps_GoldenTorizoEgg_5 
    dw Instruction_EnemyProjectile_GotoY 
    dw InstList_EnemyProjectile_GoldenTorizoEgg_Hatched_Left_1 

InstList_EnemyProjectile_GoldenTorizoEgg_Hatched_Right_0:
    dw Instruction_EnemyProjectile_QueueSoundInY_Lib2_Max6 : db $22 
    dw Instruction_EnemyProjectile_PreInstructionInY 
    dw PreInstruction_EnemyProjectile_GoldenTorizoEgg_Hatched 

InstList_EnemyProjectile_GoldenTorizoEgg_Hatched_Right_1:
    dw $0006,EnemyProjSpritemaps_GoldenTorizoEgg_10 
    dw $0006,EnemyProjSpritemaps_GoldenTorizoEgg_11 
    dw $0006,EnemyProjSpritemaps_GoldenTorizoEgg_12 
    dw $0006,EnemyProjSpritemaps_GoldenTorizoEgg_11 
    dw Instruction_EnemyProjectile_GotoY 
    dw InstList_EnemyProjectile_GoldenTorizoEgg_Hatched_Right_1 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_InstList_EnemyProjectile_Break_86B181:
    dw UNUSED_Instruction_EnemyProjectile_GotoBreak_86B183 

UNUSED_Instruction_EnemyProjectile_GotoBreak_86B183:
    LDA.W $1AFF,X : BMI .facingRight 
    LDY.W #InstList_EnemyProjectile_GoldenTorizoEgg_Break_FacingLeft 
    RTS 

.facingRight:
    LDY.W #InstList_EnemyProjectile_GoldenTorizoEgg_Break_FacingRight 
    RTS 
endif ; !FEATURE_KEEP_UNREFERENCED


InstList_EnemyProjectile_GoldenTorizoEgg_Break_FacingLeft:
    dw Instruction_EnemyProjectile_ClearPreInstruction 
    dw $0004,EnemyProjSpritemaps_GoldenTorizoEgg_7 
    dw $0004,EnemyProjSpritemaps_GoldenTorizoEgg_8 
    dw $0004,EnemyProjSpritemaps_GoldenTorizoEgg_9 
    dw $0004,EnemyProjSpritemaps_GoldenTorizoEgg_A 
    dw $000A,EnemyProjSpritemaps_GoldenTorizoEgg_B 
    dw Instruction_EnemyProjectile_Delete 

InstList_EnemyProjectile_GoldenTorizoEgg_Break_FacingRight:
    dw Instruction_EnemyProjectile_ClearPreInstruction 
    dw $0004,EnemyProjSpritemaps_GoldenTorizoEgg_13 
    dw $0004,EnemyProjSpritemaps_GoldenTorizoEgg_14 
    dw $0004,EnemyProjSpritemaps_GoldenTorizoEgg_15 
    dw $0004,EnemyProjSpritemaps_GoldenTorizoEgg_16 
    dw $0008,EnemyProjSpritemaps_GoldenTorizoEgg_17 
    dw Instruction_EnemyProjectile_Delete 

EnemyProjectile_GoldenTorizoEgg:
    dw InitAI_EnemyProjectile_GoldenTorizoEgg ; Initialisation AI
    dw PreInstruction_EnemyProjectile_GoldenTorizoEgg_Bouncing ; Initial pre-instruction
    dw InstList_EnemyProjectile_GoldenTorizoEgg_BouncingLeft ; Initial instruction list
    db $07,$07 ; X,Y radius
    dw $6064,$0000 ; Properties, Hit instruction list
    dw InstList_EnemyProjectile_TorizoChozoOrbs_BreakOnWall ; Shot instruction list

InitAI_EnemyProjectile_GoldenTorizoSuperMissile:
    LDA.W $0E54 : STA.W $1AFF,Y 
    TAX 
    LDA.W $0F7A,X : STA.B $12 
    LDA.W $0F7E,X : STA.B $14 
    BIT.W $0FB4,X 
    BMI .facingRight 
    LDX.W #$0000 
    BRA + 


.facingRight:
    LDX.W #$0002 

  + LDA.W .Xoffsets,X : CLC : ADC.B $12 : STA.W $1A4B,Y 
    LDA.W #$FFCC : CLC : ADC.B $14 : STA.W $1A93,Y 
    LDA.W .InstListPointers,X : STA.W $1B47,Y 
    RTS 

;        _________ Leftwards
;       |      ___ Rightwards
;       |     |
.Xoffsets:
    dw $FFE2,$001E 
.InstListPointers:
    dw InstList_EnemyProj_GoldenTorizoSuperMissile_Leftwards_0 
    dw InstList_EnemyProj_GoldenTorizoSuperMissile_Rightwards_0 

PreInstruction_EnemyProjectile_GoldenTorizoSuperMissile_Held:
    LDY.W $1AFF,X 
    LDA.W $0F7A,Y : STA.B $12 
    LDA.W $0F7E,Y : STA.B $14 
    LDA.W $0FB4,Y : BMI .facingRight 
    LDA.W #$FFE0 : BRA + 


.facingRight:
    LDA.W #$0020 

  + CLC : ADC.B $12 : STA.W $1A4B,X 
    LDA.W #$FFCC : CLC : ADC.B $14 : STA.W $1A93,X 
    RTS 


PreInst_EnemyProjectile_GoldenTorizoSuperMissile_Thrown:
    JSR.W Move_EnemyProjectile_Horizontally 
    BCS .collision 
    JSR.W Move_EnemyProjectile_Vertically 
    BIT.W $1ADB,X 
    BMI + 
    BCS .collision 

  + LDA.W $1ADB,X : CLC : ADC.W #$0010 : STA.W $1ADB,X 
    AND.W #$F000 
    CMP.W #$1000 : BNE .return 
    STZ.W $1997,X 

.return:
    RTS 


.collision:
    LDA.W #InstList_EnemyProjectile_Shot_GoldenTorizoSuperMissile : STA.W $1B47,X 
    LDA.W #$0001 : STA.W $1B8F,X 
    RTS 


Instruction_AimSuperMissile_Rightwards:
    JSL.L CalculateAngleOfSamusFromEnemyProjectile 
    AND.W #$007F 
    BRA CalculateGoldenTorizoSuperMissileVelocitiesFromAngle 


Instruction_AimSuperMissile_Leftwards:
    JSL.L CalculateAngleOfSamusFromEnemyProjectile 
    ORA.W #$0080 

CalculateGoldenTorizoSuperMissileVelocitiesFromAngle:
    PHX : PHY 
    TXY 
    ASL A 
    TAX 
    LDA.L SineCosineTables_8bitSine_SignExtended,X 
    ASL #2
    STA.W $1AB7,Y 
    LDA.L SineCosineTables_NegativeCosine_SignExtended,X 
    ASL #2
    STA.W $1ADB,Y 
    PLY : PLX 
    RTS 


InstList_EnemyProj_GoldenTorizoSuperMissile_Rightwards_0:
    dw $0030,EnemyProjSpritemaps_GoldenTorizoSuperMissile_6 
    dw Instruction_AimSuperMissile_Rightwards 
    dw Instruction_EnemyProjectile_PreInstructionInY 
    dw PreInst_EnemyProjectile_GoldenTorizoSuperMissile_Thrown 

InstList_EnemyProj_GoldenTorizoSuperMissile_Rightwards_1:
    dw $0002,EnemyProjSpritemaps_GoldenTorizoSuperMissile_5 
    dw $0002,EnemyProjSpritemaps_GoldenTorizoSuperMissile_4 
    dw $0002,EnemyProjSpritemaps_GoldenTorizoSuperMissile_3 
    dw $0002,EnemyProjSpritemaps_GoldenTorizoSuperMissile_2 
    dw $0002,EnemyProjSpritemaps_GoldenTorizoSuperMissile_1 
    dw $0002,EnemyProjSpritemaps_GoldenTorizoSuperMissile_0 
    dw $0002,EnemyProjSpritemaps_GoldenTorizoSuperMissile_7 
    dw $0002,EnemyProjSpritemaps_GoldenTorizoSuperMissile_6 
    dw Instruction_EnemyProjectile_GotoY 
    dw InstList_EnemyProj_GoldenTorizoSuperMissile_Rightwards_1 

InstList_EnemyProj_GoldenTorizoSuperMissile_Leftwards_0:
    dw $0030,EnemyProjSpritemaps_GoldenTorizoSuperMissile_6 
    dw Instruction_AimSuperMissile_Leftwards 
    dw Instruction_EnemyProjectile_PreInstructionInY 
    dw PreInst_EnemyProjectile_GoldenTorizoSuperMissile_Thrown 

InstList_EnemyProj_GoldenTorizoSuperMissile_Leftwards_1:
    dw $0002,EnemyProjSpritemaps_GoldenTorizoSuperMissile_7 
    dw $0002,EnemyProjSpritemaps_GoldenTorizoSuperMissile_0 
    dw $0002,EnemyProjSpritemaps_GoldenTorizoSuperMissile_1 
    dw $0002,EnemyProjSpritemaps_GoldenTorizoSuperMissile_2 
    dw $0002,EnemyProjSpritemaps_GoldenTorizoSuperMissile_3 
    dw $0002,EnemyProjSpritemaps_GoldenTorizoSuperMissile_4 
    dw $0002,EnemyProjSpritemaps_GoldenTorizoSuperMissile_5 
    dw $0002,EnemyProjSpritemaps_GoldenTorizoSuperMissile_6 
    dw Instruction_EnemyProjectile_GotoY 
    dw InstList_EnemyProj_GoldenTorizoSuperMissile_Leftwards_1 

InstList_EnemyProjectile_Shot_GoldenTorizoSuperMissile:
    dw Instruction_EnemyProjectile_XYRadiusInY : db $10,$10 
    dw Instruction_EnemyProjectile_ClearPreInstruction 
    dw Instruction_EnemyProjectile_Properties_OrY,$5000 
    dw Instruction_EnemyProjectile_Properties_AndY,$5FFF 
    dw Instruction_EnemyProjectile_QueueSoundInY_Lib2_Max6 : db $24 
    dw $0005,EnemyProjSpritemaps_Common_BigExplosion_0 
    dw $0005,EnemyProjSpritemaps_Common_BigExplosion_1 
    dw $0005,EnemyProjSpritemaps_Common_BigExplosion_2 
    dw $0005,EnemyProjSpritemaps_Common_BigExplosion_3 
    dw $0005,EnemyProjSpritemaps_Common_BigExplosion_4 
    dw $0005,EnemyProjSpritemaps_Common_BigExplosion_5 
    dw Instruction_EnemyProjectile_Delete 

EnemyProjectile_GoldenTorizoSuperMissile:
    dw InitAI_EnemyProjectile_GoldenTorizoSuperMissile ; Initialisation AI
    dw PreInstruction_EnemyProjectile_GoldenTorizoSuperMissile_Held ; Initial pre-instruction
    dw InstList_EnemyProj_GoldenTorizoSuperMissile_Rightwards_0 ; Initial instruction list
    db $04,$04 ; X,Y radius
    dw $A0C8,$0000 ; Properties, Hit instruction list
    dw InstList_EnemyProjectile_Shot_GoldenTorizoSuperMissile ; Shot instruction list

InitAI_EnemyProjectile_GoldenTorizoEyeBeam:
    LDX.W $0E54 
    LDA.W $0F7A,X : STA.B $12 
    LDA.W $0F7E,X : STA.B $14 
    BIT.W $0FB4,X 
    BMI .facingRight 
    LDX.W #.leftwards 
    BRA + 


.facingRight:
    LDX.W #.rightwards 

  + JSR.W InitAI_EnemyProjectile_TorizoChozoOrbs_Egg_EyeBeam_Common 
    JSL.L GenerateRandomNumber 
    AND.W #$001E 
    SEC : SBC.W #$0010 : CLC : ADC.W #$00C0 : LDX.W $0E54 
    BIT.W $0FB4,X 
    BMI .facingRight2 
    CLC : ADC.W #$0080 

.facingRight2:
    TAX 
    LDA.L SineCosineTables_8bitSine_SignExtended,X 
    ASL #3
    STA.W $1AB7,Y 
    LDA.L SineCosineTables_NegativeCosine_SignExtended,X 
    ASL #3
    STA.W $1ADB,Y 
    RTS 

;        _____________________ X offset
;       |      _______________ X velocity (unit 1/100h px/frame)
;       |     |      _________ Y offset
;       |     |     |      ___ Y velocity (unit 1/100h px/frame)
;       |     |     |     |
.rightwards:
    dw InstList_EnemyProjectile_GoldenTorizoEyeBeam_Normal 
    dw $0014,$0400,$FFE2,$0400 
.leftwards:
    dw InstList_EnemyProjectile_GoldenTorizoEyeBeam_Normal 
    dw $FFEC,$FC00,$FFE2,$0400 

PreInstruction_EnemyProjectile_GoldenTorizoEyeBeam:
    JSR.W Move_EnemyProjectile_Horizontally 
    BCS .collision 
    JSR.W Move_EnemyProjectile_Vertically 
    BCS .hitFloor 
    RTS 


.collision:
    LDA.W #InstList_EnemyProjectile_GoldenTorizoEyeBeam_HitWall : STA.W $1B47,X 
    BRA .instructionListSet 


.hitFloor:
    LDA.W $1A93,X : AND.W #$FFF0 
    ORA.W #$0008 
    DEC #2
    STA.W $1A93,X 
    LDA.W #InstList_EnemyProjectile_GoldenTorizoEyeBeam_HitFloor_0 : STA.W $1B47,X 

.instructionListSet:
    LDA.W #$0001 : STA.W $1B8F,X 
    RTS 


Instruction_EnemyProjectile_GotoYIfEyeBeamExplosionsDisabled:
    PHX 
    LDA.W $1B23,X 
    TAX 
    LDA.L $7E780C,X : BPL .gotoY 
    PLX 
    INY #2
    RTS 


.gotoY:
    PLX 
    LDA.W $0000,Y 
    TAY 
    RTS 


InstList_EnemyProjectile_GoldenTorizoEyeBeam_HitWall:
    dw Instruction_EnemyProjectile_ClearPreInstruction 
    dw $0004,EnemyProjSpritemaps_Common_0 
    dw $0004,EnemyProjSpritemaps_Common_1 
    dw $0004,EnemyProjSpritemaps_Common_2 
    dw $0004,EnemyProjSpritemaps_Common_3 
    dw $0004,EnemyProjSpritemaps_Common_4 
    dw Instruction_EnemyProjectile_Delete 

InstList_EnemyProjectile_GoldenTorizoEyeBeam_HitFloor_0:
    dw Instruction_EnemyProjectile_ClearPreInstruction 

InstList_EnemyProjectile_GoldenTorizoEyeBeam_HitFloor_1:
    dw $0008,EnemyProjSpritemaps_Blank_Default 
    dw Instruction_EnemyProjectile_GotoYIfEyeBeamExplosionsDisabled 
    dw InstList_EnemyProjectile_GoldenTorizoEyeBeam_HitFloor_1 
    dw Instruction_EnemyProjectile_QueueSoundInY_Lib3_Max6 : db $13 
    dw $0004,EnemyProjSpritemaps_TorizoChozoOrbs_GoldenTorizoEyeBeam_0 
    dw $0005,EnemyProjSpritemaps_TorizoChozoOrbs_GoldenTorizoEyeBeam_1 
    dw Instruction_EnemyProjectile_Properties_AndY,$DFFF 
    dw $0006,EnemyProjSpritemaps_TorizoChozoOrbs_GoldenTorizoEyeBeam_2 
    dw $0007,EnemyProjSpritemaps_TorizoChozoOrbs_GoldenTorizoEyeBeam_3 
    dw $0008,EnemyProjSpritemaps_TorizoChozoOrbs_GoldenTorizoEyeBeam_4 
    dw $0009,EnemyProjSpritemaps_TorizoChozoOrbs_GoldenTorizoEyeBeam_5 
    dw Instruction_EnemyProjectile_Delete 

InstList_EnemyProjectile_GoldenTorizoEyeBeam_Normal:
    dw $0001,EnemyProjSpritemaps_Common_4 
    dw $0001,EnemyProjSpritemaps_Common_3 
    dw $0001,EnemyProjSpritemaps_Common_2 
    dw $0001,EnemyProjSpritemaps_Common_1 
    dw $0001,EnemyProjSpritemaps_Common_0 
    dw Instruction_EnemyProjectile_GotoY 
    dw InstList_EnemyProjectile_GoldenTorizoEyeBeam_Normal 

EnemyProjectile_GoldenTorizoEyeBeam:
    dw InitAI_EnemyProjectile_GoldenTorizoEyeBeam ; Initialisation AI
    dw PreInstruction_EnemyProjectile_GoldenTorizoEyeBeam ; Initial pre-instruction
    dw InstList_EnemyProjectile_GoldenTorizoEyeBeam_Normal ; Initial instruction list
    db $03,$03 ; X,Y radius
    dw $700A,$0000 ; Properties, Hit instruction list
    dw InstList_EnemyProjectile_Delete ; Shot instruction list

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Instruction_ResetPosition_86B436:
    LDA.W $1AFF,X : STA.W $1A4B,X 
    LDA.W $1B23,X : STA.W $1A93,X 
    RTS 
endif ; !FEATURE_KEEP_UNREFERENCED


InstList_EnemyProj_OldTourianEscapeShaftFakeWallExplosion_0:
    dw Instruction_EnemyProjectile_ClearPreInstruction 
    dw Instruction_EnemyProjectile_TimerInY,$0001 

InstList_EnemyProj_OldTourianEscapeShaftFakeWallExplosion_1:
    dw Instruction_MoveRandomlyWithinXRadius_YRadius 
    db $07,$00,$0F,$00 
    dw Instruction_EnemyProjectile_QueueSoundInY_Lib2_Max6 : db $24 
    dw $0004,EnemyProjSpritemaps_Common_SmallExplosion_0 
    dw $0006,EnemyProjSpritemaps_Common_SmallExplosion_1 
    dw $0005,EnemyProjSpritemaps_Common_SmallExplosion_2 
    dw $0005,EnemyProjSpritemaps_Common_SmallExplosion_3 
    dw $0005,EnemyProjSpritemaps_Common_SmallExplosion_4 
    dw $0006,EnemyProjSpritemaps_Common_SmallExplosion_5 
    dw Instruction_EnemyProjectile_DecrementTimer_GotoYIfNonZero 
    dw InstList_EnemyProj_OldTourianEscapeShaftFakeWallExplosion_1 
    dw Instruction_EnemyProjectile_Delete 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_InstList_EnemyProjectile_86B470:
    dw Instruction_EnemyProjectile_QueueSoundInY_Lib2_Max6 : db $24 
    dw $0008,EnemyProjSpritemaps_Common_Smoke_0 
    dw $0008,EnemyProjSpritemaps_Common_Smoke_1 
    dw $0008,EnemyProjSpritemaps_Common_Smoke_2 
    dw $0008,EnemyProjSpritemaps_Common_Smoke_3 
    dw Instruction_EnemyProjectile_DecrementTimer_GotoYIfNonZero 
    dw InstList_EnemyProj_OldTourianEscapeShaftFakeWallExplosion_1 
    dw Instruction_EnemyProjectile_Delete 

UNUSED_Instruction_GotoY_Probability_1_4:
    JSL.L GenerateRandomNumber 
    AND.W #$C000 
    CMP.W #$C000 : BEQ .gotoY 
    INY #2
    RTS 


.gotoY:
    LDA.W $0000,Y 
    TAY 
    RTS 
endif ; !FEATURE_KEEP_UNREFERENCED


InitAI_EnemyProj_OldTourianEscapeShaftFakeWallExplosion:
    LDA.W #$0110 : STA.W $1A4B,Y 
    STA.W $1AFF,Y 
    LDA.W #$0888 : STA.W $1A93,Y 
    STA.W $1B23,Y 
    RTS 


RTS_86B4B0:
    RTS 


EnemyProjectile_OldTourianEscapeShaftFakeWallExplosion:
    dw InitAI_EnemyProj_OldTourianEscapeShaftFakeWallExplosion ; Initialisation AI
    dw RTS_86B4B0 ; Initial pre-instruction
    dw InstList_EnemyProj_OldTourianEscapeShaftFakeWallExplosion_0 ; Initial instruction list
    db $00,$00 ; X,Y radius
    dw $3000,$0000 ; Properties, Hit instruction list
    dw InstList_EnemyProjectile_Delete ; Shot instruction list

InstList_EnemyProjectile_DragonFireball_Rising_Left:
    dw $0005,EnemyProjSpritemaps_DragonFireball_0 
    dw $0005,EnemyProjSpritemaps_DragonFireball_1 
    dw Instruction_EnemyProjectile_GotoY 
    dw InstList_EnemyProjectile_DragonFireball_Rising_Left 

InstList_EnemyProjectile_DragonFireball_Rising_Right:
    dw $0005,EnemyProjSpritemaps_DragonFireball_4 
    dw $0005,EnemyProjSpritemaps_DragonFireball_5 
    dw Instruction_EnemyProjectile_GotoY 
    dw InstList_EnemyProjectile_DragonFireball_Rising_Right 

InstList_EnemyProjectile_DragonFireball_Falling_Left:
    dw $0005,EnemyProjSpritemaps_DragonFireball_2 
    dw $0005,EnemyProjSpritemaps_DragonFireball_3 
    dw Instruction_EnemyProjectile_GotoY 
    dw InstList_EnemyProjectile_DragonFireball_Falling_Left 

InstList_EnemyProjectile_DragonFireball_Falling_Right:
    dw $0005,EnemyProjSpritemaps_DragonFireball_6 
    dw $0005,EnemyProjSpritemaps_DragonFireball_7 
    dw Instruction_EnemyProjectile_GotoY 
    dw InstList_EnemyProjectile_DragonFireball_Falling_Right 

InitAI_EnemyProjectile_DragonFireball:
    LDX.W $0E54 
    LDA.W $0F7E,X : SEC : SBC.W #$001C : STA.W $1A93,Y 
    LDA.W #$FC3F : STA.W $1ADB,Y 
    BIT.W $0FA8,X 
    BPL .pointer 
    LDA.W $0F7A,X : CLC : ADC.W #$FFF4 : STA.W $1A4B,Y 
    LDA.W #$FD40 : STA.W $1AB7,Y 
    LDA.W #InstList_EnemyProjectile_DragonFireball_Rising_Left : STA.W $1B47,Y 
    RTS 


.pointer:
    LDA.W $0F7A,X : CLC : ADC.W #$000C : STA.W $1A4B,Y 
    LDA.W #$02C0 : STA.W $1AB7,Y 
    LDA.W #InstList_EnemyProjectile_DragonFireball_Rising_Right : STA.W $1B47,Y 
    RTS 


PreInstruction_EnemyProjectile_DragonFireball:
    LDA.W $1AB6,X : AND.W #$FF00 : STA.B $14 
    LDA.W $1AB7,X 
    XBA 
    BPL .lowByteX 
    ORA.W #$FF00 
    BRA + 


.lowByteX:
    AND.W #$00FF 

  + STA.B $12 
    LDA.W $1A27,X : CLC : ADC.B $14 : STA.W $1A27,X 
    LDA.W $1A4B,X : ADC.B $12 : STA.W $1A4B,X 
    LDA.W $1ADA,X : AND.W #$FF00 : STA.B $14 
    LDA.W $1ADB,X 
    XBA 
    BPL .lowByteY 
    ORA.W #$FF00 
    BRA + 


.lowByteY:
    AND.W #$00FF 

  + STA.B $12 
    LDA.W $1A6F,X : CLC : ADC.B $14 : STA.W $1A6F,X 
    LDA.W $1A93,X : ADC.B $12 : STA.W $1A93,X 
    LDA.W $1ADB,X : BPL .movingDown 
    CLC : ADC.W #$0020 : STA.W $1ADB,X 
    BMI .return 
    BIT.W $1AB7,X 
    BPL .right 
    LDA.W #InstList_EnemyProjectile_DragonFireball_Falling_Left : BRA .instructionListSet 


.right:
    LDA.W #InstList_EnemyProjectile_DragonFireball_Falling_Right : BRA .instructionListSet 


.movingDown:
    CLC : ADC.W #$0020 : STA.W $1ADB,X 
    JSR.W Delete_EnemyProjectile_IfVerticallyOffScreen 

.return:
    RTS 


.instructionListSet:
    STA.W $1B47,X 
    LDA.W #$0001 : STA.W $1B8F,X 
    RTS 


Delete_EnemyProjectile_IfVerticallyOffScreen:
    LDA.W $1A93,X : SEC : SBC.W $0915 : BMI .return 
    CMP.W #$0120 : BCC .return 
    STZ.W $1997,X 

.return:
    RTS 


EnemyProjectile_DragonFireball:
    dw InitAI_EnemyProjectile_DragonFireball ; Initialisation AI
    dw PreInstruction_EnemyProjectile_DragonFireball ; Initial pre-instruction
    dw InstList_EnemyProjectile_DragonFireball_Rising_Left ; Initial instruction list
    db $02,$02 ; X,Y radius
    dw $000A,$0000 ; Properties, Hit instruction list
    dw InstList_EnemyProjectile_Delete ; Shot instruction list

InstList_EnemyProjectile_EyeDoorProjectile_Normal_0:
    dw $0004,EnemyProjSpritemaps_EyeDoorProjectile_4 
    dw $0003,EnemyProjSpritemaps_EyeDoorProjectile_5 
    dw $0002,EnemyProjSpritemaps_EyeDoorProjectile_6 
    dw Instruction_EnemyProjectile_CalculateDirectionTowardsSamus 
    dw Instruction_EnemyProjectile_PreInstructionInY 
    dw PreInstruction_EnemyProjectile_EyeDoorProjectile_Moving 

InstList_EnemyProjectile_EyeDoorProjectile_Normal_1:
    dw $0010,EnemyProjSpritemaps_EyeDoorProjectile_7 
    dw Instruction_EnemyProjectile_GotoY 
    dw InstList_EnemyProjectile_EyeDoorProjectile_Normal_1 

InstList_EnemyProjectile_EyeDoorProjectile_Explode:
    dw Instruction_EnemyProjectile_ClearPreInstruction 
    dw $0002,EnemyProjSpritemaps_EyeDoorProjectile_6 
    dw $0003,EnemyProjSpritemaps_EyeDoorProjectile_5 
    dw $0004,EnemyProjSpritemaps_EyeDoorProjectile_4 
    dw Instruction_EnemyProjectile_Delete 

InstList_EnemyProjectile_Shot_EyeDoorProjectile:
    dw $0004,EnemyProjSpritemaps_EyeDoorProjectile_0 
    dw $0004,EnemyProjSpritemaps_EyeDoorProjectile_1 
    dw $0004,EnemyProjSpritemaps_EyeDoorProjectile_2 
    dw $0004,EnemyProjSpritemaps_EyeDoorProjectile_3 
    dw Instruction_EnemyProjectile_Delete 

InstList_EnemyProjectile_EyeDoorSweat_Falling:
    dw $0006,EnemyProjSpritemaps_EyeDoorSweat_0 
    dw Instruction_EnemyProjectile_GotoY 
    dw InstList_EnemyProjectile_EyeDoorSweat_Falling 

InstList_EnemyProjectile_EyeDoorSweat_HitFloor:
    dw Instruction_EnemyProjectile_ClearPreInstruction 
    dw $0006,EnemyProjSpritemaps_EyeDoorSweat_1 
    dw $0006,EnemyProjSpritemaps_EyeDoorSweat_2 
    dw $0006,EnemyProjSpritemaps_EyeDoorSweat_3 
    dw Instruction_EnemyProjectile_Delete 

InitAI_EnemyProjectile_EyeDoorProjectile:
    LDX.W $1C27 
    LDA.W $1DC7,X : STA.W $1B23,Y 
    JSL.L Calculate_PLM_Block_Coordinates 
    LDX.W $1993 
    LDA.W $1C29 
    SEC 
    ROL A 
    ASL #3
    CLC : ADC.W .Xpositions,X : STA.W $1A4B,Y 
    LDA.W $1C2B 
    ASL #4
    CLC : ADC.W .Ypositions,X : STA.W $1A93,Y 
    RTS 


.Xpositions:
    dw $FFF0 
.Ypositions:
    dw       $0010, $FFA0,$FFC0, $FF80,$FFE0, $FFA0,$0040, $FF80,$0020 
    dw $0010,$0010, $0060,$FFC0, $0070,$FFC0, $0080,$FFC0, $0090,$FFC0 

InitAI_EnemyProjectile_EyeDoorSweat:
    LDX.W $1C27 
    JSL.L Calculate_PLM_Block_Coordinates 
    LDA.W $1C29 
    DEC A 
    SEC 
    ROL A 
    ASL #3
    STA.W $1A4B,Y 
    LDA.W $1C2B 
    INC A 
    ASL #4
    STA.W $1A93,Y 
    LDX.W $1993 
    LDA.W .Xvelocity,X : STA.W $1AB7,Y 
    LDA.W .Yvelocity,X : STA.W $1ADB,Y 
    RTS 

  .Xvelocity
    dw $FFC0 
  .Yvelocity
    dw       $0200, $0040,$0200 


PreInstruction_EnemyProjectile_EyeDoorProjectile_Moving:
    JSR.W Move_EnemyProjectile_Horizontally 
    BCS .collision 
    JSR.W Move_EnemyProjectile_Vertically 
    BCS .collision 
    TXY 
    LDA.W $1AFF,X 
    TAX 
    LDA.L SineCosineTables_8bitSine_SignExtended,X 
    LSR #4
    BIT.W #$0800 
    BEQ .addXvelocity 
    ORA.W #$F000 

.addXvelocity:
    CLC : ADC.W $1AB7,Y : STA.W $1AB7,Y 
    LDA.L SineCosineTables_NegativeCosine_SignExtended,X 
    LSR #4
    BIT.W #$0800 
    BEQ .addYvelocity 
    ORA.W #$F000 

.addYvelocity:
    CLC : ADC.W $1ADB,Y : STA.W $1ADB,Y 
    LDA.W $1B23,Y : JSL.L BitIndexToByteIndexAndBitmask 
    LDA.L $7ED8B0,X : AND.W $05E7 
    BNE .collision 
    RTS 


.collision:
    LDA.W #InstList_EnemyProjectile_EyeDoorProjectile_Explode : STA.W $1B47,X 
    LDA.W #$0001 : STA.W $1B8F,X 
    RTS 


PreInstruction_EnemyProjectile_EyeDoorSweat:
    JSR.W Move_EnemyProjectile_Horizontally 
    JSR.W Move_EnemyProjectile_Vertically 
    BIT.W $1ADB,X 
    BMI .positive 
    BCS .hitFloor 

.positive:
    LDA.W $1ADB,X : CLC : ADC.W #$000C : STA.W $1ADB,X 
    RTS 


.hitFloor:
    LDA.W $1A93,X : SEC : SBC.W #$0004 : STA.W $1A93,X 
    LDA.W #InstList_EnemyProjectile_EyeDoorSweat_HitFloor : STA.W $1B47,X 
    LDA.W #$0001 : STA.W $1B8F,X 
    RTS 


EnemyProjectile_EyeDoorProjectile:
    dw InitAI_EnemyProjectile_EyeDoorProjectile ; Initialisation AI
    dw RTS_8684FB ; Initial pre-instruction
    dw InstList_EnemyProjectile_EyeDoorProjectile_Normal_0 ; Initial instruction list
    db $08,$08 ; X,Y radius
    dw $8004 ; Properties
    dw $0000 ; Hit instruction list
    dw InstList_EnemyProjectile_Shot_EyeDoorProjectile ; Shot instruction list

EnemyProjectile_EyeDoorSweat:
    dw InitAI_EnemyProjectile_EyeDoorSweat ; Initialisation AI
    dw PreInstruction_EnemyProjectile_EyeDoorSweat ; Initial pre-instruction
    dw InstList_EnemyProjectile_EyeDoorSweat_Falling ; Initial instruction list
    db $00,$00 ; X,Y radius
    dw $0004 ; Properties
    dw $0000 ; Hit instruction list
    dw InstList_EnemyProjectile_Delete ; Shot instruction list

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Colors_86B75F: 
; "5294, 39CE, 2108, 2484" is colours Bh..Eh of lots of sprite palette 5s (common sprites)
    dw $5294,$39CE,$2108,$2484 ; (14h, 14h, 14h), (Eh, Eh, Eh), (8, 8, 8), (4, 4, 9)
    dw $35AD,$2529,$14A5,$1842 ; ( Dh,  Dh,  Dh), ( 9,  9,  9), (5, 5, 5), (2, 2, 6)
    dw $2108,$1084,$14A5,$1842 ; (  8,   8,   8), ( 4,  4,  4), (5, 5, 5), (2, 2, 6)
    dw $0C63,$0421,$0842,$0000 ; (  3,   3,   3), ( 1,  1,  1), (2, 2, 2), (0, 0, 0)
    dw $5294,$39CE,$2108,$2484
    dw $5294,$39CE,$2108,$2484
    dw $5294,$39CE,$2108,$2484
    dw $5294,$39CE,$2108,$2484
endif ; !FEATURE_KEEP_UNREFERENCED

InstList_EnemyProjectile_TourianStatue_Delete:
    dw Instruction_EnemyProjectile_Delete 

InstList_EnemyProj_TourianStatueUnlockingParticleWaterSplash:
    dw $0008,EnemyProjSpritemaps_TourianStatueUnlockParticleWaterSplash_0 
    dw $0008,EnemyProjSpritemaps_TourianStatueUnlockParticleWaterSplash_1 
    dw $0008,EnemyProjSpritemaps_TourianStatueUnlockParticleWaterSplash_2 
    dw $0008,EnemyProjSpritemaps_TourianStatueUnlockParticleWaterSplash_3 
    dw Instruction_EnemyProjectile_Delete 

InstList_EnemyProj_TourianStatueEyeGlow:
    dw $0008,EnemyProjSpritemaps_TourianStatueEyeGlow_8 
    dw $0008,EnemyProjSpritemaps_TourianStatueEyeGlow_7 
    dw $0008,EnemyProjSpritemaps_TourianStatueEyeGlow_6 
    dw $0007,EnemyProjSpritemaps_TourianStatueEyeGlow_5 
    dw $0007,EnemyProjSpritemaps_TourianStatueEyeGlow_4 
    dw $0007,EnemyProjSpritemaps_TourianStatueEyeGlow_3 
    dw $0006,EnemyProjSpritemaps_TourianStatueEyeGlow_2 
    dw $0006,EnemyProjSpritemaps_TourianStatueEyeGlow_1 
    dw $0005,EnemyProjSpritemaps_TourianStatueEyeGlow_0 
    dw $0030,EnemyProjSpritemaps_Blank_Default 
    dw Instruction_EnemyProjectile_QueueSoundInY_Lib2_Max6 : db $19 
    dw Instruction_EnemyProj_TourianStatueUnlockingEarthquake 
    dw Instruction_EnemyProj_SpawnTourianStatueUnlockingParticle 
    dw Instruction_EnemyProj_SpawnTourianStatueUnlockingParticle 
    dw Instruction_EnemyProj_SpawnTourianStatueUnlockingParticle 
    dw Instruction_EnemyProj_SpawnTourianStatueUnlockingParticle 
    dw Instruction_EnemyProjectile_Delete 

Instruction_EnemyProj_SpawnTourianStatueUnlockingParticle:
    PHY 
    TXA 
    LDY.W #EnemyProjectile_TourianStatueUnlockingParticle 
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics 
    PLY 
    RTS 


Instruction_EnemyProj_TourianStatueUnlockingEarthquake:
    LDA.W #$0001 : STA.W $183E 
    LDA.W #$0020 
    TSB.W $1840 
    RTS 


InstList_EnemyProjectile_TourianStatueUnlockingParticle:
    dw $0003,EnemyProjSpritemaps_TourianStatueUnlockingParticle_0 
    dw $0003,EnemyProjSpritemaps_TourianStatueUnlockingParticle_1 
    dw Inst_EnemyProj_SpawnTourianStatueUnlockingParticleTail 
    dw $0003,EnemyProjSpritemaps_TourianStatueUnlockingParticle_3 
    dw $0003,EnemyProjSpritemaps_TourianStatueUnlockingParticle_2 
    dw Instruction_EnemyProjectile_DecrementTimer_GotoYIfNonZero 
    dw InstList_EnemyProjectile_TourianStatueUnlockingParticle 

Inst_EnemyProj_SpawnTourianStatueUnlockingParticleTail:
    PHY 
    TXA 
    LDY.W #EnemyProjectile_TourianStatueUnlockingParticleTail 
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics 
    PLY 
    RTS 


InstList_EnemyProj_SpawnTourianStatueUnlockingParticleTail:
    dw $0004,EnemyProjSpritemaps_TourianStatueUnlockingParticleTail_0 
    dw Instruction_EnemyProjectile_YPositionInY,$0008 
    dw $0004,EnemyProjSpritemaps_TourianStatueUnlockingParticleTail_1 
    dw Instruction_EnemyProjectile_YPositionInY,$0004 
    dw $0004,EnemyProjSpritemaps_TourianStatueUnlockingParticleTail_2 
    dw Instruction_EnemyProjectile_YPositionInY,$0002 
    dw $0004,EnemyProjSpritemaps_TourianStatueUnlockingParticleTail_3 
    dw Instruction_EnemyProjectile_Delete 

Instruction_EnemyProjectile_YPositionInY:
    LDA.W $1A93,X : CLC : ADC.W $0000,Y : STA.W $1A93,X 
    INY #2
    RTS 


InstList_EnemyProjectile_TourianStatuesSoul:
    dw $0008,EnemyProjSpritemaps_TourianStatuesSoul_0 
    dw $0008,EnemyProjSpritemaps_TourianStatuesSoul_1 
    dw Instruction_EnemyProjectile_GotoY 
    dw InstList_EnemyProjectile_TourianStatuesSoul 

InstList_EnemyProjectile_TourianStatueBaseDecoration_0:
    dw $0080,EnemyProjSpritemaps_TourianStatueBaseDecoration 
    dw Instruction_EnemyProjectile_PreInstructionInY 
    dw PreInst_EnemyProj_TourianStatueBaseDecoration_AllowProcess 

InstList_EnemyProjectile_TourianStatueBaseDecoration_1:
    dw $0777,EnemyProjSpritemaps_TourianStatueBaseDecoration 
    dw Instruction_EnemyProjectile_GotoY 
    dw InstList_EnemyProjectile_TourianStatueBaseDecoration_1 

InstList_EnemyProjectile_TourianStatueRidley:
    dw $0777,EnemyProjSpritemaps_TourianStatueRidley 
    dw Instruction_EnemyProjectile_GotoY 
    dw InstList_EnemyProjectile_TourianStatueRidley 

InstList_EnemyProjectile_TourianStatuePhantoon:
    dw $0777,EnemyProjSpritemaps_TourianStatuePhantoon 
    dw Instruction_EnemyProjectile_GotoY 
    dw InstList_EnemyProjectile_TourianStatuePhantoon 

InitAI_EnemyProj_TourianStatueUnlockingParticleWaterSplash:
    LDX.W $1993 
    LDA.W $1A4B,X : STA.W $1A4B,Y 
    LDA.W $195E : SEC : SBC.W #$0004 : STA.W $1A93,Y 
    RTS 


InitAI_EnemyProjectile_TourianStatueEyeGlow:
    LDX.W $1993 
    LDA.W TourianStatueEyeData_Xposition,X : STA.W $1A4B,Y 
    LDA.W TourianStatueEyeData_Yposition,X : STA.W $1A93,Y 
    TXA 
    ASL #2
    TAY 
    LDX.W #$01F2 

.loop:
    LDA.W TourianStatueEyeData_Phantoon,Y : STA.L $7EC000,X 
    INY #2
    INX #2
    CPX.W #$01FA : BNE .loop 
    RTS 


InitAI_EnemyProjectile_TourianStatueUnlockingParticle:
    LDX.W $1993 
    LDA.W $1A4B,X : STA.W $1A4B,Y 
    LDA.W $1A93,X : STA.W $1A93,Y 
    JSL.L GenerateRandomNumber 
    AND.W #$003F 
    SEC : SBC.W #$0020 : AND.W #$00FF 
    ASL A 
    STA.W $1AFF,Y 
    TAX 
    LDA.L SineCosineTables_8bitSine_SignExtended,X : STA.W $1AB7,Y 
    LDA.L SineCosineTables_NegativeCosine_SignExtended,X 
    ASL #2
    STA.W $1ADB,Y 
    RTS 


InitAI_EnemyProjectile_TourianStatueUnlockingParticleTail:
    LDX.W $1993 
    LDA.W $1A4B,X : STA.W $1A4B,Y 
    LDA.W $1A93,X : STA.W $1A93,Y 
    RTS 


InitAI_EnemyProjectile_TourianStatuesSoul:
    LDX.W $1993 
    LDA.W TourianStatueEyeData_Xposition,X : STA.W $1A4B,Y 
    LDA.W TourianStatueEyeData_Yposition,X : STA.W $1A93,Y 
    LDA.W #$FC00 : STA.W $1ADB,Y 
    RTS 

;        _____________________ Phantoon
;       |      _______________ Ridley
;       |     |      _________ Draygon
;       |     |     |      ___ Kraid
;       |     |     |     |
TourianStatueEyeData:
  .Xposition:
    dw $0084,$007A,$009E,$0068 
  .Yposition:
    dw $0090,$0051,$0080,$0072 

; Sprite palette 7 colours 9..Ch. Eye glow colours
  .Phantoon:
    dw $6BFF,$033B,$0216,$0173 ; yellow
  .Ridley:
    dw $7F5F,$7C1F,$5816,$300C ; red
  .Draygon:
    dw $7F5A,$7EC0,$6DE0,$54E0 ; blue
  .Kraid:
    dw $6BFA,$3BE0,$2680,$1580 ; green

InitAI_EnemyProjectile_TourianStatueBaseDecoration:
    LDA.W #$0078 : STA.W $1AFF,Y 
    STA.W $1A4B,Y 
    LDA.W #$00B8 : STA.W $1B23,Y 
    STA.W $1A93,Y 
    RTS 


InitAI_EnemyProjectile_TourianStatue_Ridley:
    LDA.W #$008E : STA.W $1AFF,Y 
    STA.W $1A4B,Y 
    LDA.W #$0055 : STA.W $1B23,Y 
    STA.W $1A93,Y 
    RTS 


InitAI_EnemyProjectile_TourianStatue_Phantoon:
    LDA.W #$0084 : STA.W $1AFF,Y 
    STA.W $1A4B,Y 
    LDA.W #$0088 : STA.W $1B23,Y 
    STA.W $1A93,Y 
    RTS 


PreInst_EnemyProj_TourianStatueUnlockingParticleWaterSplash:
    LDA.W $195E : SEC : SBC.W #$0004 : STA.W $1A93,X 
    RTS 


PreInst_EnemyProjectile_TourianStatueUnlockingParticle:
    STZ.B $12 
    STZ.B $14 
    LDA.W $1AB7,X : BPL + 
    DEC.B $14 

  + STA.B $13 
    LDA.W $1A27,X : CLC : ADC.B $12 : STA.W $1A27,X 
    LDA.W $1A4B,X : ADC.B $14 : STA.W $1A4B,X 
    LDA.W $195E : SEC : SBC.W $1A93,X : PHA 
    STZ.B $12 
    STZ.B $14 
    LDA.W $1ADB,X : BPL + 
    DEC.B $14 

  + STA.B $13 
    LDA.W $1A6F,X : CLC : ADC.B $12 : STA.W $1A6F,X 
    LDA.W $1A93,X : ADC.B $14 : STA.W $1A93,X 
    LDA.W $195E : SEC : SBC.W $1A93,X : EOR.B $01,S 
    BPL + 
    TXA 
    LDY.W #EnemyProjectile_TourianStatueWaterSplash 
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics 

  + PLA 
    LDA.W $1A93,X : AND.W #$FF00 
    CMP.W #$0100 : BEQ .delete 
    LDA.W $1ADB,X : CLC : ADC.W #$0010 : STA.W $1ADB,X 
    RTS 


.delete:
    LDA.W #InstList_EnemyProjectile_TourianStatue_Delete : STA.W $1B47,X 
    LDA.W #$0001 : STA.W $1B8F,X 
    RTS 


PreInstruction_EnemyProjectile_TourianStatuesSoul:
    STZ.B $12 
    STZ.B $14 
    LDA.W $1ADB,X : BPL + 
    DEC.B $14 

  + STA.B $13 
    LDA.W $1A6F,X : CLC : ADC.B $12 : STA.W $1A6F,X 
    LDA.W $1A93,X : ADC.B $14 : STA.W $1A93,X 
    BIT.W #$0100 
    BEQ + 
    LDA.W #InstList_EnemyProjectile_TourianStatue_Delete : STA.W $1B47,X 
    LDA.W #$0001 : STA.W $1B8F,X 

  + LDA.W $1ADB,X : CLC : ADC.W #$FF80 : STA.W $1ADB,X 
    RTS 


PreInst_EnemyProj_TourianStatueBaseDecoration_AllowProcess:
    LDA.W $1E6F : BNE PreInst_EnemyProj_TourianStatue_Ridley_Phantoon_BaseDecor 
    LDA.W #$8000 
    TSB.W $1E6D 

PreInst_EnemyProj_TourianStatue_Ridley_Phantoon_BaseDecor:
    LDA.W $1AFF,X : STA.W $1A4B,X 
    LDA.L $7E9E00 
    EOR.W #$FFFF 
    INC A 
    CLC : ADC.W $0915 : CLC : ADC.W $1B23,X : STA.W $1A93,X 
    RTS 


EnemyProjectile_TourianStatueWaterSplash:
    dw InitAI_EnemyProj_TourianStatueUnlockingParticleWaterSplash ; Initialisation AI
    dw PreInst_EnemyProj_TourianStatueUnlockingParticleWaterSplash ; Initial pre-instruction
    dw InstList_EnemyProj_TourianStatueUnlockingParticleWaterSplash ; Initial instruction list
    db $00,$00 ; X,Y radius
    dw $3000 ; Properties
    dw $0000 ; Hit instruction list
    dw InstList_EnemyProjectile_Delete ; Shot instruction list

EnemyProjectile_TourianStatueEyeGlow:
    dw InitAI_EnemyProjectile_TourianStatueEyeGlow ; Initialisation AI
    dw RTS_8684FB ; Initial pre-instruction
    dw InstList_EnemyProj_TourianStatueEyeGlow ; Initial instruction list
    db $00,$00 ; X,Y radius
    dw $3000 ; Properties
    dw $0000 ; Hit instruction list
    dw InstList_EnemyProjectile_Delete ; Shot instruction list

EnemyProjectile_TourianStatueUnlockingParticle:
    dw InitAI_EnemyProjectile_TourianStatueUnlockingParticle ; Initialisation AI
    dw PreInst_EnemyProjectile_TourianStatueUnlockingParticle ; Initial pre-instruction
    dw InstList_EnemyProjectile_TourianStatueUnlockingParticle ; Initial instruction list
    db $00,$00 ; X,Y radius
    dw $3000 ; Properties
    dw $0000 ; Hit instruction list
    dw InstList_EnemyProjectile_Delete ; Shot instruction list

EnemyProjectile_TourianStatueUnlockingParticleTail:
    dw InitAI_EnemyProjectile_TourianStatueUnlockingParticleTail ; Initialisation AI
    dw RTS_8684FB ; Initial pre-instruction
    dw InstList_EnemyProj_SpawnTourianStatueUnlockingParticleTail ; Initial instruction list
    db $00,$00 ; X,Y radius
    dw $3000 ; Properties
    dw $0000 ; Hit instruction list
    dw InstList_EnemyProjectile_Delete ; Shot instruction list

EnemyProjectile_TourianStatueSoul:
    dw InitAI_EnemyProjectile_TourianStatuesSoul ; Initialisation AI
    dw PreInstruction_EnemyProjectile_TourianStatuesSoul ; Initial pre-instruction
    dw InstList_EnemyProjectile_TourianStatuesSoul ; Initial instruction list
    db $00,$00 ; X,Y radius
    dw $3000 ; Properties
    dw $0000 ; Hit instruction list
    dw InstList_EnemyProjectile_Delete ; Shot instruction list

EnemyProjectile_TourianStatueRidley:
    dw InitAI_EnemyProjectile_TourianStatue_Ridley ; Initialisation AI
    dw PreInst_EnemyProj_TourianStatue_Ridley_Phantoon_BaseDecor ; Initial pre-instruction
    dw InstList_EnemyProjectile_TourianStatueRidley ; Initial instruction list
    db $00,$00 ; X,Y radius
    dw $2000 ; Properties
    dw $0000 ; Hit instruction list
    dw InstList_EnemyProjectile_Delete ; Shot instruction list

EnemyProjectile_TourianStatuePhantoon:
    dw InitAI_EnemyProjectile_TourianStatue_Phantoon ; Initialisation AI
    dw PreInst_EnemyProj_TourianStatue_Ridley_Phantoon_BaseDecor ; Initial pre-instruction
    dw InstList_EnemyProjectile_TourianStatuePhantoon ; Initial instruction list
    db $00,$00 ; X,Y radius
    dw $2000 ; Properties
    dw $0000 ; Hit instruction list
    dw InstList_EnemyProjectile_Delete ; Shot instruction list

EnemyProjectile_TourianStatueBaseDecoration:
    dw InitAI_EnemyProjectile_TourianStatueBaseDecoration ; Initialisation AI
    dw PreInst_EnemyProj_TourianStatue_Ridley_Phantoon_BaseDecor ; Initial pre-instruction
    dw InstList_EnemyProjectile_TourianStatueBaseDecoration_0 ; Initial instruction list
    db $00,$00 ; X,Y radius
    dw $2000 ; Properties
    dw $0000 ; Hit instruction list
    dw InstList_EnemyProjectile_Delete ; Shot instruction list

if !FEATURE_KEEP_UNREFERENCED
UNUSED_InstList_EnemyProjectile_Parameter0_86BACC:
    dw $0002,UNUSED_EnemyProjSpritemaps_0_8D9268 
    dw $0002,UNUSED_EnemyProjSpritemaps_1_8D926F 
    dw $0002,UNUSED_EnemyProjSpritemaps_2_8D9276 
    dw $0002,UNUSED_EnemyProjSpritemaps_3_8D927D 
    dw $0002,UNUSED_EnemyProjSpritemaps_4_8D9284 
    dw $0002,UNUSED_EnemyProjSpritemaps_5_8D928B 
    dw $0002,UNUSED_EnemyProjSpritemaps_6_8D9292 
    dw Instruction_EnemyProjectile_Delete 

UNUSED_InstList_EnemyProjectile_Parameter1_86BAEA:
    dw $0002,UNUSED_EnemyProjSpritemaps_7_8D9299 
    dw $0002,UNUSED_EnemyProjSpritemaps_8_8D92A0 
    dw $0002,UNUSED_EnemyProjSpritemaps_9_8D92A7 
    dw $0002,UNUSED_EnemyProjSpritemaps_A_8D92AE 
    dw $0002,UNUSED_EnemyProjSpritemaps_B_8D92B5 
    dw $0002,UNUSED_EnemyProjSpritemaps_C_8D92BC 
    dw $0002,UNUSED_EnemyProjSpritemaps_D_8D92C3 
    dw Instruction_EnemyProjectile_Delete 

UNUSED_InstList_EnemyProjectile_Parameter2_86BB08:
    dw $0002,UNUSED_EnemyProjSpritemaps_E_8D92CA 
    dw $0002,UNUSED_EnemyProjSpritemaps_E_8D92CA 
    dw $0002,UNUSED_EnemyProjSpritemaps_F_8D92D6 
    dw $0002,UNUSED_EnemyProjSpritemaps_10_8D92E2 
    dw $0002,UNUSED_EnemyProjSpritemaps_12_8D92FA 
    dw Instruction_EnemyProjectile_Delete 

UNUSED_InstList_Pointers_86BB1E:
    dw UNUSED_InstList_EnemyProjectile_Parameter0_86BACC 
    dw UNUSED_InstList_EnemyProjectile_Parameter1_86BAEA 
    dw UNUSED_InstList_EnemyProjectile_Parameter2_86BB08 

UNUSED_RandomBuggyCode_86BB24:
    PHY 
    LDY.W UNUSED_EnemyProjectile_86BB50 
    LDA.W #$0000 : STA.W $1B47,Y 
    PLY 
    RTS 


UNUSED_InitAI_EnemyProjectile_86BB30:
    LDX.W $0E54 
    LDA.L $7E8022,X : STA.W $1A4B,Y 
    LDA.L $7E8024,X : STA.W $1A93,Y 
    PHY 
    LDA.W $1993 
    ASL A 
    TAY 
    LDA.W UNUSED_InstList_Pointers_86BB1E,Y 
    PLY 
    STA.W $1B47,Y 
    RTS 
endif ; !FEATURE_KEEP_UNREFERENCED


RTS_86BB4F:
    RTS 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_EnemyProjectile_86BB50:
    dw UNUSED_InitAI_EnemyProjectile_86BB30 ; Initialisation AI
    dw RTS_86BB4F ; Initial pre-instruction
    dw UNUSED_InstList_EnemyProjectile_Parameter0_86BACC ; Initial instruction list
    db $00,$00 ; X,Y radius
    dw $0000,$7000 ; Properties, Hit instruction list
    dw InstList_EnemyProjectile_Delete ; Shot instruction list
endif ; !FEATURE_KEEP_UNREFERENCED

InstList_EnemyProjectile_PuromiBody:
    dw $0003,EnemyProjSpritemaps_PuromiBody_0 
    dw $0003,EnemyProjSpritemaps_PuromiBody_1 
    dw $0003,EnemyProjSpritemaps_PuromiBody_4 
    dw $0003,EnemyProjSpritemaps_PuromiBody_2 
    dw $0003,EnemyProjSpritemaps_PuromiBody_3 
    dw $0003,EnemyProjSpritemaps_PuromiBody_5 
    dw $0003,EnemyProjSpritemaps_PuromiBody_0 
    dw $0003,EnemyProjSpritemaps_PuromiBody_1 
    dw $0003,EnemyProjSpritemaps_PuromiBody_6 
    dw $0003,EnemyProjSpritemaps_PuromiBody_2 
    dw $0003,EnemyProjSpritemaps_PuromiBody_3 
    dw $0003,EnemyProjSpritemaps_PuromiBody_7 
    dw Instruction_EnemyProjectile_GotoY 
    dw InstList_EnemyProjectile_PuromiBody 

InitAI_EnemyProjectile_PuromiBody:
    LDX.W $0E54 
    LDA.W $0F7A,X : STA.W $1A4B,Y 
    LDA.W $0F7C,X : STA.W $1A27,Y 
    LDA.W $0F7E,X : STA.W $1A93,Y 
    LDA.W $0F80,X : STA.W $1A6F,Y 
    PHX 
    LDA.L $7E8014,X : CLC : ADC.W $0E54 : TAX 
    TYA 
    STA.L $7E7800,X 
    TYX 
    LDA.W #$0001 : STA.L $7EF380,X 
    PLX 
    RTS 


RTS_86BBC6:
    RTS 


EnemyProjectile_Puromi:
    dw InitAI_EnemyProjectile_PuromiBody ; Initialisation AI
    dw RTS_86BBC6 ; Initial pre-instruction
    dw InstList_EnemyProjectile_PuromiBody ; Initial instruction list
    db $08,$08 ; X,Y radius
    dw $C040,$0000 ; Properties, Hit instruction list
    dw InstList_EnemyProjectile_Delete ; Shot instruction list

InstList_EnemyProjectile_NorfairLavaquakeRocks:
    dw $0001,EnemyProjSpritemaps_LavaquakeRocks 
    dw Instruction_EnemyProjectile_Sleep 

InitAI_EnemyProjectile_NorfairLavaquakeRocks:
    LDA.W #InstList_EnemyProjectile_NorfairLavaquakeRocks : STA.W $1B47,Y 
    LDA.W #NorfairLavaquakeRocksFunction_Rising : STA.W $1AFF,Y 
    LDA.W $1993 : STA.W $1ADB,Y 
    LDA.W $1995 : STA.W $1AB7,Y 
    LDX.W $0E54 
    LDA.W $0F7A,X : STA.W $1A4B,Y 
    LDA.W $0F7C,X : STA.W $1A27,Y 
    LDA.W $0F7E,X : STA.W $1A93,Y 
    LDA.W $0F80,X : STA.W $1A6F,Y 
    RTS 


PreInstruction_EnemyProjectile_NorfairLavaquakeRocks:
    JSR.W ($1AFF,X) 
    JSR.W Delete_EnemyProjectile_IfOffScreen 
    RTS 


NorfairLavaquakeRocksFunction_Rising:
    LDA.W $1ADB,X : SEC : SBC.W #$0002 : STA.W $1ADB,X 
    BPL .lessThanZero 
    STZ.W $1ADB,X 
    LDA.W #NorfairLavaquakeRocks_Falling : STA.W $1AFF,X 
    BRA .return 


.lessThanZero:
    LDA.W #$0002 : STA.B $12 

.loop:
    PHX 
    LDA.W $1ADB,X : CLC : ADC.B $12 : DEC A 
    BPL + 
    LDA.W #$0000 

  + ASL #3
    INC #4
    TAX 
    LDA.L CommonEnemyProjectileSpeeds_QuadraticallyIncreasing,X 
    PLX 
    STA.W $1B23,X 
    LDA.W $1A6F,X : CLC : ADC.W $1B23,X : BCC + 
    INC.W $1A93,X 

  + STA.W $1A6F,X 
    PHX 
    LDA.W $1ADB,X : CLC : ADC.B $12 : DEC A 
    BPL + 
    LDA.W #$0000 

  + ASL #3
    INC #6
    TAX 
    LDA.L CommonEnemyProjectileSpeeds_QuadraticallyIncreasing,X 
    PLX 
    STA.W $1B23,X 
    LDA.W $1A93,X : CLC : ADC.W $1B23,X : STA.W $1A93,X 
    DEC.B $12 
    BNE .loop 
    JSR.W Move_EnemyProjectile_AccordingToXVelocity 

.return:
    RTS 


NorfairLavaquakeRocks_Falling:
    LDA.W $1ADB,X : CLC : ADC.W #$0002 : STA.W $1ADB,X 
    CMP.W #$0040 : BMI + 
    LDA.W #$0040 : STA.W $1ADB,X 

  + LDA.W #$0002 : STA.B $12 

.loop:
    PHX 
    LDA.W $1ADB,X : SEC : SBC.B $12 : INC A 
    ASL #3
    TAX 
    LDA.L CommonEnemyProjectileSpeeds_QuadraticallyIncreasing,X 
    PLX 
    STA.W $1B23,X 
    LDA.W $1A6F,X : CLC : ADC.W $1B23,X : BCC + 
    INC.W $1A93,X 

  + STA.W $1A6F,X 
    PHX 
    LDA.W $1ADB,X : SEC : SBC.B $12 : INC A 
    ASL #3
    INC #2
    TAX 
    LDA.L CommonEnemyProjectileSpeeds_QuadraticallyIncreasing,X 
    PLX 
    STA.W $1B23,X 
    LDA.W $1A93,X : CLC : ADC.W $1B23,X : STA.W $1A93,X 
    DEC.B $12 
    BNE .loop 
    JSR.W Move_EnemyProjectile_AccordingToXVelocity 
    RTS 


Move_EnemyProjectile_AccordingToXVelocity:
    LDA.W $1AB7,X : AND.W #$FF00 
    XBA 
    JSL.L Sign_Extend_A 
    CLC : ADC.W $1A4B,X : STA.W $1A4B,X 
    LDA.W $1AB7,X : AND.W #$00FF 
    XBA 
    JSL.L Sign_Extend_A 
    CLC : ADC.W $1A27,X : BCC + 
    INC.W $1A4B,X 

  + STA.W $1A27,X 
    RTS 


Delete_EnemyProjectile_IfOffScreen:
    JSR.W CheckIf_EnemyProjectile_IsOffScreen 
    BEQ .return 
    LDA.W #$0000 : STA.W $1997,X 

.return:
    RTS 


CheckIf_EnemyProjectile_IsOffScreen:
    LDA.W $1A4B,X : CMP.W $0911 : BMI .offScreen 
    LDA.W $0911 : CLC : ADC.W #$0100 : CMP.W $1A4B,X : BMI .offScreen 
    LDA.W $1A93,X : CMP.W $0915 : BMI .offScreen 
    LDA.W $0915 : CLC : ADC.W #$0100 : CMP.W $1A93,X : BMI .offScreen 
    LDA.W #$0000 
    RTS 


.offScreen:
    LDA.W #$0001 
    RTS 


EnemyProjectile_LavaquakeRocks:
    dw InitAI_EnemyProjectile_NorfairLavaquakeRocks ; Initialisation AI
    dw PreInstruction_EnemyProjectile_NorfairLavaquakeRocks ; Initial pre-instruction
    dw InstList_EnemyProjectile_NorfairLavaquakeRocks ; Initial instruction list
    db $02,$02 ; X,Y radius
    dw $0010,$0000 ; Properties, Hit instruction list
    dw InstList_EnemyProjectile_Delete ; Shot instruction list

InstList_EnemyProjectile_ShaktoolsAttack_FrontCircle_0:
    dw $0004,EnemyProjSpritemaps_ShaktoolsAttack 
    dw $0004,EnemyProjSpritemaps_ShaktoolsAttack_FrontMiddleCircle 

InstList_EnemyProjectile_ShaktoolsAttack_FrontCircle_1:
    dw $0077,EnemyProjSpritemaps_ShaktoolsAttack_FrontCircle 
    dw Instruction_EnemyProjectile_GotoY 
    dw InstList_EnemyProjectile_ShaktoolsAttack_FrontCircle_1 

InstList_EnemyProjectile_ShaktoolsAttack_MiddleCircle_0:
    dw $0006,EnemyProjSpritemaps_ShaktoolsAttack 
    dw Instruction_EnemyProjectile_PreInstructionInY 
    dw PreInst_EnemyProjectile_ShaktoolsAttack_MiddleBack_Moving 
    dw $0004,EnemyProjSpritemaps_ShaktoolsAttack 

InstList_EnemyProjectile_ShaktoolsAttack_MiddleCircle_1:
    dw $0077,EnemyProjSpritemaps_ShaktoolsAttack_FrontMiddleCircle 
    dw Instruction_EnemyProjectile_GotoY 
    dw InstList_EnemyProjectile_ShaktoolsAttack_MiddleCircle_1 

InstList_EnemyProjectile_ShaktoolsAttack_BackCircle_0:
    dw $000A,EnemyProjSpritemaps_ShaktoolsAttack 
    dw Instruction_EnemyProjectile_PreInstructionInY 
    dw PreInst_EnemyProjectile_ShaktoolsAttack_MiddleBack_Moving 

InstList_EnemyProjectile_ShaktoolsAttack_BackCircle_1:
    dw $0077,EnemyProjSpritemaps_ShaktoolsAttack 
    dw Instruction_EnemyProjectile_GotoY 
    dw InstList_EnemyProjectile_ShaktoolsAttack_BackCircle_1 

InitAI_EnemyProjectile_ShaktoolsAttack_Middle_Back:
    LDA.W $1993 : STA.W $1AFF,Y 

InitAI_EnemyProjectile_ShaktoolsAttack_Front:
    LDX.W $0E54 
    LDA.W $0F7A,X : STA.W $1A4B,Y 
    LDA.W $0F7E,X : STA.W $1A93,Y 
    LDA.W $0FAE,X : AND.W #$00FF 
    ASL A 
    TAX 
    LDA.L SineCosineTables_8bitSine_SignExtended,X : STA.W $1AB7,Y 
    LDA.L SineCosineTables_NegativeCosine_SignExtended,X : STA.W $1ADB,Y 
    TXA 
    LSR #5
    TAX 
    LDA.W .Xoffset,X : CLC : ADC.W $1A4B,Y : STA.W $1A4B,Y 
    LDA.W .Yoffset,X : CLC : ADC.W $1A93,Y : STA.W $1A93,Y 
    RTS 


.Xoffset:
    dw $0000,$000C,$0010,$000C,$0000,$FFF4,$FFF0,$FFF4 

.Yoffset:
    dw $FFF0,$FFF4,$0000,$000C,$0010,$000C,$0000,$FFF4 

PreInstruction_EnemyProjectile_ShaktoolsAttack_Front:
    JSR.W Move_EnemyProjectile_Horizontally 
    BCS .delete 
    JSR.W Move_EnemyProjectile_Vertically 
    BCS .delete 
    RTS 


.delete:
    STZ.W $1997,X 
    RTS 


PreInst_EnemyProjectile_ShaktoolsAttack_MiddleBack_Moving:
    LDY.W $1AFF,X 
    LDA.W $1997,Y : BEQ .delete 
    JSR.W Move_EnemyProjectile_Horizontally 
    JSR.W Move_EnemyProjectile_Vertically 
    RTS 


.delete:
    STZ.W $1997,X 
    RTS 


EnemyProjectile_ShaktoolFrontCircle:
    dw InitAI_EnemyProjectile_ShaktoolsAttack_Front ; Initialisation AI
    dw PreInstruction_EnemyProjectile_ShaktoolsAttack_Front ; Initial pre-instruction
    dw InstList_EnemyProjectile_ShaktoolsAttack_FrontCircle_0 ; Initial instruction list
    db $04,$04 ; X,Y radius
    dw $000A ; Properties
    dw $0000 ; Hit instruction list
    dw InstList_EnemyProjectile_Delete ; Shot instruction list

EnemyProjectile_ShaktoolMiddleCircle:
    dw InitAI_EnemyProjectile_ShaktoolsAttack_Middle_Back ; Initialisation AI
    dw RTS_8684FB ; Initial pre-instruction
    dw InstList_EnemyProjectile_ShaktoolsAttack_MiddleCircle_0 ; Initial instruction list
    db $04,$04 ; X,Y radius
    dw $2000 ; Properties
    dw $0000 ; Hit instruction list
    dw InstList_EnemyProjectile_Delete ; Shot instruction list

EnemyProjectile_ShaktoolBackCircle:
    dw InitAI_EnemyProjectile_ShaktoolsAttack_Middle_Back ; Initialisation AI
    dw RTS_8684FB ; Initial pre-instruction
    dw InstList_EnemyProjectile_ShaktoolsAttack_BackCircle_0 ; Initial instruction list
    db $04,$04 ; X,Y radius
    dw $2000 ; Properties
    dw $0000 ; Hit instruction list
    dw InstList_EnemyProjectile_Delete ; Shot instruction list

InitAI_EnemyProjectile_MotherBrainsTurrets:
    LDA.W #$0400 : STA.W $19BB,Y 
    LDA.W $1993 
    ASL A 
    TAX 
    LDA.W .directionIndices,X : ORA.W #$0100 : STA.W $1A6F,Y 
    PHX 
    AND.W #$00FF 
    ASL A 
    TAX 
    LDA.W .InstListPointers,X : STA.W $1B47,Y 
    PLX 
    LDA.W .Xpositions,X : STA.W $1A4B,Y 
    LDA.W .Ypositions,X : STA.W $1A93,Y 
    LDA.W .allowedRotationPointers,X : STA.W $1A27,Y 
    TYX 
    JSR.W Set_Rotation_Timer 
    JMP.W Set_Cooldown_Timer 


.Xpositions:
    dw $0398,$0348,$0328,$02D8,$0288,$0268,$0218,$01C8 
    dw $01A8,$0158,$0108,$00E8 
.Ypositions:
    dw $0030,$0040,$0040,$0030,$0040,$0040,$0030,$0040 
    dw $0040,$0030,$0040,$0040 
.InstListPointers:
; indexed by [enemy projectile direction index]
    dw InstList_EnemyProjectile_MotherBrainsTurret_Left 
    dw InstList_EnemyProjectile_MotherBrainsTurret_DownLeft 
    dw InstList_EnemyProjectile_MotherBrainsTurret_Down 
    dw InstList_EnemyProjectile_MotherBrainsTurret_DownRight 
    dw InstList_EnemyProjectile_MotherBrainsTurret_Right 
    dw InstList_EnemyProjectile_MotherBrainsTurret_UpRight 
    dw InstList_EnemyProjectile_MotherBrainsTurret_Up 
    dw InstList_EnemyProjectile_MotherBrainsTurret_UpLeft 
.allowedRotationPointers:
    dw MotherBrainTurret_AllowedRotations_0 
    dw MotherBrainTurret_AllowedRotations_1 
    dw MotherBrainTurret_AllowedRotations_2 
    dw MotherBrainTurret_AllowedRotations_3 
    dw MotherBrainTurret_AllowedRotations_4 
    dw MotherBrainTurret_AllowedRotations_5 
    dw MotherBrainTurret_AllowedRotations_6 
    dw MotherBrainTurret_AllowedRotations_7 
    dw MotherBrainTurret_AllowedRotations_8 
    dw MotherBrainTurret_AllowedRotations_9 
    dw MotherBrainTurret_AllowedRotations_A 
    dw MotherBrainTurret_AllowedRotations_B 
.directionIndices:
    dw $0003,$0004,$0002,$0003,$0004,$0002,$0003,$0004 
    dw $0002,$0003,$0004,$0001 

;        ______________________________ Pointing left
;       |    __________________________ Pointing down-left
;       |   |    ______________________ Pointing down
;       |   |   |    __________________ Pointing down-right
;       |   |   |   |    ______________ Pointing right
;       |   |   |   |   |     _________ Pointing up-right
;       |   |   |   |   |    |    _____ Pointing up
;       |   |   |   |   |    |   |    _ Pointing up-left
;       |   |   |   |   |    |   |   |
MotherBrainTurret_AllowedRotations_0:
    db $00,$01,$01,$01,$00, $00,$00,$00 
MotherBrainTurret_AllowedRotations_1:
    db $00,$00,$01,$01,$01, $00,$00,$00 
MotherBrainTurret_AllowedRotations_2:
    db $01,$01,$01,$00,$00, $00,$00,$00 
MotherBrainTurret_AllowedRotations_3:
    db $00,$01,$01,$01,$00, $00,$00,$00 
MotherBrainTurret_AllowedRotations_4:
    db $00,$01,$01,$01,$01, $00,$00,$00 
MotherBrainTurret_AllowedRotations_5:
    db $01,$01,$01,$01,$00, $00,$00,$00 
MotherBrainTurret_AllowedRotations_6:
    db $00,$01,$01,$01,$00, $00,$00,$00 
MotherBrainTurret_AllowedRotations_7:
    db $00,$00,$01,$01,$01, $00,$00,$00 
MotherBrainTurret_AllowedRotations_8:
    db $01,$01,$01,$00,$00, $00,$00,$00 
MotherBrainTurret_AllowedRotations_9:
    db $00,$01,$01,$01,$00, $00,$00,$00 
MotherBrainTurret_AllowedRotations_A:
    db $00,$01,$01,$01,$01, $00,$00,$00 
MotherBrainTurret_AllowedRotations_B:
    db $01,$01,$01,$01,$00, $00,$00,$00 

InitAI_EnemyProjectile_MotherBrainsTurretBullets:
    LDA.W #$0000 : STA.W $1B23,Y 
    LDA.W #$0400 : STA.W $19BB,Y 
    LDX.W $1993 
    LDA.W $1A6F,X : AND.W #$00FF 
    ASL A 
    STA.W $1AFF,Y 
    TAX 
    LDA.W .Xoffset,X : STA.B $12 
    LDA.W .Yoffset,X : STA.B $14 
    LDA.W .Xvelocity,X : STA.W $1AB7,Y 
    LDA.W .Yvelocity,X : STA.W $1ADB,Y 
    LDX.W $1993 
    LDA.W $1A4B,X : CLC : ADC.B $12 : STA.W $1A4B,Y 
    LDA.W $1A93,X : CLC : ADC.B $14 : STA.W $1A93,Y 
    RTS 

;        _____________________________________________ Left
;       |      _______________________________________ Down-left
;       |     |      _________________________________ Down
;       |     |     |      ___________________________ Down-right
;       |     |     |     |      _____________________ Right
;       |     |     |     |     |      _______________ Up-right
;       |     |     |     |     |     |      _________ Up
;       |     |     |     |     |     |     |      ___ Up-left
;       |     |     |     |     |     |     |     |
.Xoffset:
    dw $FFEF,$FFF4,$0000,$000C,$0011,$000C,$0000,$FFF4 
.Yoffset:
    dw $FFF7,$0003,$0007,$0003,$FFF7,$FFED,$FFEB,$FFED 
.Xvelocity:
    dw $FD40,$FE0E,$0000,$01F2,$02C0,$01F2,$0000,$FE0E 
.Yvelocity:
    dw $0000,$01F2,$02C0,$01F2,$0000,$FE0E,$FD40,$FE0E 


PreInstruction_EnemyProjectile_MotherBrainsTurrets:
    JSR.W Check_If_Turret_Is_On_Screen 
    BCC .onScreen 
    LDA.L $7E783A : BNE .deleteOffScreen 
    RTS 


.onScreen:
    LDA.L $7E783A : BNE .deleteOnScreen 
    DEC.W $1AB7,X 
    BNE .nonZeroTimer 
    PHX 
    JSR.W Set_Rotation_Timer 
    JSR.W Set_Next_Turret_Direction 
    PLY 
    LDA.W $1A6F,Y : AND.W #$00FF 
    ASL A 
    TAX 
    LDA.W .InstListPointers,X : STA.W $1B47,Y 
    LDA.W #$0001 : STA.W $1B8F,Y 
    TYX 

.nonZeroTimer:
    DEC.W $1ADB,X 
    BNE .return 
    JSR.W Set_Cooldown_Timer 
    LDY.W #EnemyProjectile_MotherBrainTurretBullets 
    TXA 
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics 

.return:
    RTS 


.deleteOffScreen:
    STZ.W $1997,X 
    RTS 


.deleteOnScreen:
    STZ.W $1997,X 
    LDA.W $1A4B,X : STA.B $12 
    LDA.W $1A93,X : STA.B $14 
    LDA.W #$000C 
    LDY.W #EnemyProjectile_MiscDust 
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics 
    RTS 


.InstListPointers:
    dw InstList_EnemyProjectile_MotherBrainsTurret_Left 
    dw InstList_EnemyProjectile_MotherBrainsTurret_DownLeft 
    dw InstList_EnemyProjectile_MotherBrainsTurret_Down 
    dw InstList_EnemyProjectile_MotherBrainsTurret_DownRight 
    dw InstList_EnemyProjectile_MotherBrainsTurret_Right 
    dw InstList_EnemyProjectile_MotherBrainsTurret_UpRight 
    dw InstList_EnemyProjectile_MotherBrainsTurret_Up 
    dw InstList_EnemyProjectile_MotherBrainsTurret_UpLeft 

Set_Next_Turret_Direction:
    SEP #$20 
    LDA.W $1A6F,X : CLC : ADC.W $1A70,X : AND.B #$07 
    STA.B $14 
    REP #$20 
    AND.W #$0007 
    TAY 
    LDA.W $1A27,X : STA.B $12 
    LDA.B ($12),Y : AND.W #$00FF 
    BEQ + 
    SEP #$20 
    LDA.B $14 : STA.W $1A6F,X 
    REP #$20 
    RTS 


  + SEP #$20 
    LDA.W $1A70,X 
    EOR.B #$FF 
    INC A 
    STA.W $1A70,X 
    CLC : ADC.W $1A6F,X : STA.W $1A6F,X 
    REP #$20 
    RTS 


Set_Rotation_Timer:
    JSL.L GenerateRandomNumber 
    AND.W #$00FF 
    CMP.W #$0020 : BPL .setTimer 
    LDA.W #$0020 

.setTimer:
    STA.W $1AB7,X 
    RTS 


Set_Cooldown_Timer:
    JSL.L GenerateRandomNumber 
    AND.W #$00FF 
    CMP.W #$0080 : BPL .setTimer 
    LDA.W #$0080 

.setTimer:
    STA.W $1ADB,X 
    RTS 


Check_If_Turret_Is_On_Screen:
    LDA.W $1A93,X : BMI .returnOffScreen 
    CLC : ADC.W #$0010 : SEC : SBC.W $0915 : BMI .returnOffScreen 
    CMP.W #$0100 : BPL .returnOffScreen 
    LDA.W $1A4B,X : BMI .returnOffScreen 
    CLC : ADC.W #$0004 : SEC : SBC.W $0911 : BMI .returnOffScreen 
    CMP.W #$0108 : BPL .returnOffScreen 
    CLC 
    RTS 


.returnOffScreen:
    SEC 
    RTS 


PreInstruction_EnemyProjectile_MotherBrainsTurretBullets:
    LDA.W $1BD7,X : EOR.W #$8000 : STA.W $1BD7,X 
    JSR.W Move_EnemyProjectile_AccordingToVelocity 
    LDA.W $1A93,X 
    TAY 
    LDA.W $1A4B,X 
    TAX 
    JSL.L CheckForCollisionWithNonAirBlock 
    BCC .return 
    LDX.W $1991 
    STZ.W $1997,X 

.return:
    RTS 


InstList_EnemyProjectile_MotherBrainsTurret_Left:
    dw $0001,EnemyProjSpritemaps_MotherBrainsTurrets_Left 
    dw Instruction_EnemyProjectile_Sleep 

InstList_EnemyProjectile_MotherBrainsTurret_DownLeft:
    dw $0001,EnemyProjSpritemaps_MotherBrainsTurrets_DownLeft 
    dw Instruction_EnemyProjectile_Sleep 

InstList_EnemyProjectile_MotherBrainsTurret_Down:
    dw $0001,EnemyProjSpritemaps_MotherBrainsTurrets_Down 
    dw Instruction_EnemyProjectile_Sleep 

InstList_EnemyProjectile_MotherBrainsTurret_DownRight:
    dw $0001,EnemyProjSpritemaps_MotherBrainsTurrets_DownRight 
    dw Instruction_EnemyProjectile_Sleep 

InstList_EnemyProjectile_MotherBrainsTurret_Right:
    dw $0001,EnemyProjSpritemaps_MotherBrainsTurrets_Right 
    dw Instruction_EnemyProjectile_Sleep 

InstList_EnemyProjectile_MotherBrainsTurret_UpRight:
    dw $0001,EnemyProjSpritemaps_MotherBrainsTurrets_UpRight 
    dw Instruction_EnemyProjectile_Sleep 

InstList_EnemyProjectile_MotherBrainsTurret_Up:
    dw $0001,EnemyProjSpritemaps_MotherBrainsTurrets_Up 
    dw Instruction_EnemyProjectile_Sleep 

InstList_EnemyProjectile_MotherBrainsTurret_UpLeft:
    dw $0001,EnemyProjSpritemaps_MotherBrainsTurrets_UpLeft 
    dw Instruction_EnemyProjectile_Sleep 

InstList_EnemyProj_MotherBrainsTurretBullets_GotoDirection:
    dw Instruction_EnemyProjectile_MotherBrainsTurretBullets_GotoY 
    dw InstList_EnemyProjectile_MotherBrainsTurretBullets_Left 
    dw InstList_EnemyProjectile_MotherBrainsTurretBullets_DownLeft 
    dw InstList_EnemyProjectile_MotherBrainsTurretBullets_Down 
    dw InstList_EnemyProjectile_MotherBrainsTurretBullets_DownRight 
    dw InstList_EnemyProjectile_MotherBrainsTurretBullets_Right 
    dw InstList_EnemyProjectile_MotherBrainsTurretBullets_UpRight 
    dw InstList_EnemyProjectile_MotherBrainsTurretBullets_Up 
    dw InstList_EnemyProjectile_MotherBrainsTurretBullets_UpLeft 

InstList_EnemyProjectile_MotherBrainsTurretBullets_Left:
    dw $0001,EnemyProjSpritemaps_MotherBrainsTurretBullets_Left 
    dw Instruction_EnemyProjectile_Sleep 

InstList_EnemyProjectile_MotherBrainsTurretBullets_DownLeft:
    dw $0001,EnemyProjSpritemaps_MotherBrainsTurretBullets_DownLeft 
    dw Instruction_EnemyProjectile_Sleep 

InstList_EnemyProjectile_MotherBrainsTurretBullets_Down:
    dw $0001,EnemyProjSpritemaps_MotherBrainsTurretBullets_Down 
    dw Instruction_EnemyProjectile_Sleep 

InstList_EnemyProjectile_MotherBrainsTurretBullets_DownRight:
    dw $0001,EnemyProjSpritemaps_MotherBrainsTurretBullets_DownRight 
    dw Instruction_EnemyProjectile_Sleep 

InstList_EnemyProjectile_MotherBrainsTurretBullets_Right:
    dw $0001,EnemyProjSpritemaps_MotherBrainsTurretBullets_Right 
    dw Instruction_EnemyProjectile_Sleep 

InstList_EnemyProjectile_MotherBrainsTurretBullets_UpRight:
    dw $0001,EnemyProjSpritemaps_MotherBrainsTurretBullets_UpRight 
    dw Instruction_EnemyProjectile_Sleep 

InstList_EnemyProjectile_MotherBrainsTurretBullets_Up:
    dw $0001,EnemyProjSpritemaps_MotherBrainsTurretBullets_Up 
    dw Instruction_EnemyProjectile_Sleep 

InstList_EnemyProjectile_MotherBrainsTurretBullets_UpLeft:
    dw $0001,EnemyProjSpritemaps_MotherBrainsTurretBullets_UpLeft 
    dw Instruction_EnemyProjectile_Sleep 

Instruction_EnemyProjectile_MotherBrainsTurretBullets_GotoY:
    TYA 
    CLC : ADC.W $1AFF,X : TAY 
    LDA.W $0000,Y 
    TAY 
    RTS 


EnemyProjectile_MotherBrainTurret:
    dw InitAI_EnemyProjectile_MotherBrainsTurrets ; Initialisation AI
    dw PreInstruction_EnemyProjectile_MotherBrainsTurrets ; Initial pre-instruction
    dw InstList_EnemyProjectile_MotherBrainsTurret_Down ; Initial instruction list
    db $00,$00 ; X,Y radius
    dw $6000,$0000 ; Properties, Hit instruction list
    dw InstList_EnemyProjectile_Delete ; Shot instruction list

EnemyProjectile_MotherBrainTurretBullets:
    dw InitAI_EnemyProjectile_MotherBrainsTurretBullets ; Initialisation AI
    dw PreInstruction_EnemyProjectile_MotherBrainsTurretBullets ; Initial pre-instruction
    dw InstList_EnemyProj_MotherBrainsTurretBullets_GotoDirection ; Initial instruction list
    db $03,$03 ; X,Y radius
    dw $4014 ; Properties
    dw InstList_EnemyProjectile_Shot_MotherBrainTurretBullets ; Hit instruction list
    dw InstList_EnemyProjectile_Shot_MotherBrainTurretBullets ; Shot instruction list

InstList_EnemyProjectile_Shot_MotherBrainTurretBullets:
    dw Instruction_EnemyProjectile_UsePalette0 
    dw Instruction_EnemyProjectile_ClearPreInstruction 
    dw $0008,EnemyProjSpritemaps_Common_Smoke_0 
    dw $0008,EnemyProjSpritemaps_Common_Smoke_1 
    dw $0008,EnemyProjSpritemaps_Common_Smoke_2 
    dw $0008,EnemyProjSpritemaps_Common_Smoke_3 
    dw $0020,EnemyProjSpritemaps_MotherBrainsTurretBullets 
    dw Instruction_EnemyProjectile_Delete 

Instruction_EnemyProjectile_UsePalette0:
    STZ.W $19BB,X 
    RTS 


Check_for_Bomb_Collision_with_Rectangle:
    LDA.W $0CD2 : BNE .bombActive 
    CLC 
    RTS 


.bombActive:
    LDY.W #$000A 

.loop:
    LDA.W $0C18,Y : AND.W #$0F00 
    CMP.W #$0500 : BNE .next 
    LDA.W $0C7C,Y : BNE .next 
    LDA.W $0B64,Y : SEC : SBC.B $12 : BPL + 
    EOR.W #$FFFF 
    INC A 

  + SEC : SBC.W $0BB4,Y : BCC + 
    CMP.B $16 : BCS .next 

  + LDA.W $0B78,Y : SEC : SBC.B $14 : BPL + 
    EOR.W #$FFFF 
    INC A 

  + SEC : SBC.W $0BC8,Y : BCC .returnCollision 
    CMP.B $18 : BCC .returnCollision 

.next:
    INY #2
    CPY.W #$0014 : BMI .loop 
    CLC 
    RTS 


.returnCollision:
    SEC 
    RTS 


Check_for_Enemy_Collision_with_Rectangle:
    LDA.W $0F7A,X : SEC : SBC.B $12 : BPL + 
    EOR.W #$FFFF 
    INC A 

  + SEC : SBC.W $0F82,X : BCC + 
    CMP.B $16 : BCS .returnNoCollision 

  + LDA.W $0F7E,X : SEC : SBC.B $14 : BPL + 
    EOR.W #$FFFF 
    INC A 

  + SEC : SBC.W $0F84,X : BCC .returnCollision 
    CMP.B $18 : BCC .returnCollision 

.returnNoCollision:
    CLC 
    RTS 


.returnCollision:
    SEC 
    RTS 


Check_for_Collision_with_Samus:
    JSR.W Setup_Variables_for_EnemyProjectile_Collision_Detection 
    LDA.W $0AF6 : SEC : SBC.B $12 : BPL + 
    EOR.W #$FFFF 
    INC A 

  + SEC : SBC.W $0AFE : BCC + 
    CMP.B $16 : BCS .returnNoCollision 

  + LDA.W $0AFA : SEC : SBC.B $14 : BPL + 
    EOR.W #$FFFF 
    INC A 

  + SEC : SBC.W $0B00 : BCC .returnCollision 
    CMP.B $18 : BCC .returnCollision 

.returnNoCollision:
    CLC 
    RTS 


.returnCollision:
    SEC 
    RTS 


Math_86C26C:
    STA.B $26 
    LDA.B $12 : BRA Math_86C27A 


Math_86C272:
    STA.B $26 
    LDA.B $12 : CLC : ADC.W #$0040 

Math_86C27A:
    ASL A 
    AND.W #$01FE 
    TAX 
    LDA.L SineCosineTables_8bitSine_SignExtended,X : STA.B $2E 
    BPL + 
    EOR.W #$FFFF 
    INC A 

  + STA.B $28 
    JSR.W Math_16bitUnsignedMultiplication_86C29B 
    LDA.B $2B : BIT.B $2E 
    BPL .return 
    EOR.W #$FFFF 
    INC A 

.return:
    RTL 


Math_16bitUnsignedMultiplication_86C29B:
    REP #$20 
    SEP #$10 
    LDX.B $26 
    STX.W $4202 
    LDX.B $28 
    STX.W $4203 
    XBA 
    NOP 
    LDA.W $4216 : STA.B $2A 
    LDX.B $27 
    STX.W $4202 
    LDX.B $29 
    STX.W $4203 
    XBA 
    NOP 
    LDX.W $4216 
    STX.B $2C 
    LDY.W $4217 
    LDX.B $27 
    STX.W $4202 
    LDX.B $28 
    STX.W $4203 
    LDA.B $2B : CLC : ADC.W $4216 : STA.B $2B 
    BCC + 
    INY 

  + LDX.B $26 
    STX.W $4202 
    LDX.B $29 
    STX.W $4203 
    LDA.B $2B : CLC : ADC.W $4216 : STA.B $2B 
    BCC + 
    INY 

  + STY.B $2D 
    REP #$10 
    RTS 


InitAI_EnemyProjectile_MotherBrainsOnionRings:
    TYX 
    LDA.W #$0008 : STA.W $1AFF,X 
    STZ.W $1B23,X 
    LDA.W #$0400 : STA.W $19BB,X 
    LDA.W $1993 : STA.B $12 
    LDA.W #$0450 
    PHX 
    JSL.L Math_86C26C 
    PLX 
    STA.W $1AB7,X 
    LDA.W #$0450 
    PHX 
    JSL.L Math_86C272 
    PLX 
    STA.W $1ADB,X 

Move_to_OnionRing_Spawn_Position:
    LDA.W $0FBA : CLC : ADC.W #$000A : STA.W $1A4B,X 
    LDA.W $0FBE : CLC : ADC.W #$0010 : STA.W $1A93,X 
    RTS 


PreInstruction_EnemyProjectile_MotherBrainsOnionRings:
    LDA.W $1AFF,X : BEQ .active 
    DEC.W $1AFF,X 
    JMP.W Move_to_OnionRing_Spawn_Position 


.return:
    RTS 


.active:
    JSR.W Move_EnemyProjectile_AccordingToVelocity 
    JSR.W Check_for_Collision_with_BabyMetroid 
    BCS Handle_OnionRing_Collision_with_BabyMetroid 
    JSR.W Check_for_Collision_with_Samus 
    BCS Handle_OnionRing_Collision_with_Samus 
    JSR.W Check_for_OnionRing_Collision_with_Room 
    BCC .return 
    JMP.W Handle_OnionRing_Collision_with_Room 


Handle_OnionRing_Collision_with_Samus:
    JSR.W OnionRing_Contact_Explosion 
    LDA.W #$0050 ; fallthrough to Hurt_Samus

Hurt_Samus:
    JSL.L Suit_Damage_Division 
    JSL.L Deal_A_Damage_to_Samus 
    LDA.W #$0060 : STA.W $18A8 
    LDA.W #$0005 : STA.W $18AA 
    LDY.W #$0000 
    LDA.W $0AF6 : SEC : SBC.W $1A4B,X : BMI .left 
    INY 

.left:
    STY.W $0A54 
    RTS 


Handle_OnionRing_Collision_with_BabyMetroid:
    LDA.L $7E7828 
    INC A 
    STA.L $7E7828 
    JSR.W OnionRing_Contact_Explosion 
    LDA.L $7E7854 
    TAX 
    LDA.W #$0010 : STA.L $7E780C,X 
    LDA.W $0F8C,X : SEC : SBC.W #$0050 : BPL .storeHealth 
    LDA.W #$0000 

.storeHealth:
    STA.W $0F8C,X 
    RTS 


Check_for_Collision_with_BabyMetroid:
    CLC 
    LDA.L $7E7854 : BEQ .return 
    TAY 
    LDA.W $0F8C,Y : BEQ .delete 
    PHX 
    JSR.W Setup_Variables_for_EnemyProjectile_Collision_Detection 
    LDA.L $7E7854 
    TAX 
    JSR.W Check_for_Enemy_Collision_with_Rectangle 
    PLX 

.return:
    RTS 


.delete:
    PLA 
    STZ.W $1997,X 
    RTS 


Check_for_OnionRing_Collision_with_Room:
    LDA.W $1A93,X : CMP.W #$0020 : BMI .returnCollision 
    CMP.W #$00D8 : BCS .returnCollision 
    LDA.W $1A4B,X : BMI .returnCollision 
    SEC : SBC.W $0911 : BMI .returnCollision 
    CMP.W #$00F8 : BPL .returnCollision 
    RTS 


.returnCollision:
    SEC 
    RTS 


Setup_Variables_for_EnemyProjectile_Collision_Detection:
    LDA.W $1A4B,X : STA.B $12 
    LDA.W $1A93,X : STA.B $14 
    LDA.W $1BB3,X : AND.W #$00FF : STA.B $16 
    LDA.W $1BB4,X : AND.W #$00FF : STA.B $18 
    RTS 


Handle_OnionRing_Collision_with_Room:
    LDA.W #$000A : STA.W $1840 
    LDA.W #$0005 : STA.W $183E 

OnionRing_Contact_Explosion:
    STZ.W $1997,X 
    LDA.W $1A4B,X : STA.B $12 
    LDA.W $1A93,X : STA.B $14 
    LDA.W #$0003 
    LDY.W #EnemyProjectile_MiscDust 
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics 
    LDA.W #$0013 : JSL.L QueueSound_Lib3_Max6 

Instruction_EnemyProjectile_UsePalette0_duplicate:
    STZ.W $19BB,X 
    RTS 


InstList_EnemyProjectile_MotherBrainsOnionRings:
    dw Instruction_EnemyProjectile_XYRadiusInY : db $01,$01 
    dw $0010,EnemyProjSpritemaps_MotherBrainOnionRings_0 
    dw Instruction_EnemyProjectile_XYRadiusInY : db $02,$02 
    dw $000A,EnemyProjSpritemaps_MotherBrainOnionRings_1 
    dw Instruction_EnemyProjectile_XYRadiusInY : db $03,$03 
    dw $0008,EnemyProjSpritemaps_MotherBrainOnionRings_2 
    dw Instruction_EnemyProjectile_XYRadiusInY : db $04,$04 
    dw $0007,EnemyProjSpritemaps_MotherBrainOnionRings_3 
    dw Instruction_EnemyProjectile_XYRadiusInY : db $05,$05 
    dw $0006,EnemyProjSpritemaps_MotherBrainOnionRings_4 
    dw Instruction_EnemyProjectile_XYRadiusInY : db $06,$06 
    dw $0005,EnemyProjSpritemaps_MotherBrainOnionRings_5 
    dw Instruction_EnemyProjectile_Sleep 

InstList_EnemyProjectile_Hit_MotherBrainsOnionRings:
    dw Instruction_EnemyProjectile_UsePalette0_duplicate 
    dw Instruction_EnemyProjectile_ClearPreInstruction 
    dw $0005,EnemyProjSpritemaps_Common_BigExplosion_0 
    dw $0005,EnemyProjSpritemaps_Common_BigExplosion_1 
    dw $0005,EnemyProjSpritemaps_Common_BigExplosion_2 
    dw $0005,EnemyProjSpritemaps_Common_BigExplosion_3 
    dw $0005,EnemyProjSpritemaps_Common_BigExplosion_4 
    dw $0005,EnemyProjSpritemaps_Common_BigExplosion_5 
    dw Instruction_EnemyProjectile_Delete 

InitAI_EnemyProjectile_MotherBrainsBomb:
    SEP #$20 
    LDA.W $1993 : STA.W $1A27,Y 
    REP #$20 
    LDA.W #$0100 : STA.W $1ADB,Y 
    LDA.W #$00E0 : STA.W $1AB7,Y 
    LDA.W $0FBA : CLC : ADC.W #$000C : STA.W $1A4B,Y 
    LDA.W $0FBE : CLC : ADC.W #$0010 : STA.W $1A93,Y 
    LDA.W #$0400 : STA.W $19BB,Y 
    LDA.W #$0070 : STA.W $1AFF,Y 
    LDA.W #$0000 : STA.W $1B23,Y 
    LDA.L $7E784A 
    INC A 
    STA.L $7E784A 
    RTS 


PreInstruction_EnemyProjectile_MotherBrainsBomb:
    JSR.W MotherBrainsBomb_Bomb_Collision_Detection 
    LDA.W $1B23,X : BNE .haveBounced 
    LDA.W $1AB7,X : BPL + 
    EOR.W #$FFFF 
    INC A 

  + SEC : SBC.W #$0002 : BPL + 
    LDA.W #$0000 

  + BIT.W $1AB7,X 
    BPL + 
    EOR.W #$FFFF 
    INC A 

  + STA.W $1AB7,X 
    LDA.W #$0007 : JSR.W Move_MotherBrains_Bomb 
    BCC .return 

.bounced:
    INC.W $1B23,X 
    INC.W $1B23,X 

.return:
    RTS 


.haveBounced:
    LDY.W $1B23,X 
    LDA.W .Yaccelerations,Y : BEQ .delete 
    JSR.W Move_MotherBrains_Bomb 
    BCS .bounced 
    RTS 


.delete:
    STZ.W $1AB7,X 
    STZ.W $1ADB,X 
    LDA.L $7E784A 
    DEC A 
    STA.L $7E784A 
    STZ.W $1997,X 
    LDA.W $1A4B,X : STA.B $12 
    LDA.W $1A93,X : STA.B $14 
    LDA.W $1A27,X : AND.W #$00FF 
    LDY.W #EnemyProjectile_RidleyHorizontalAfterburn_Center 
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics 
    LDA.W $1A4B,X : STA.B $12 
    LDA.W $1A93,X : STA.B $14 
    LDA.W #$0003 
    LDY.W #EnemyProjectile_MiscDust 
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics 
    LDA.W #$0013 : JSL.L QueueSound_Lib3_Max6 
    RTS 


.Yaccelerations:
; (1/100h px/frame^2) indexed by bounce counter
    dw $0007,$0010,$0020,$0040,$0070,$00B0,$00F0,$0130 
    dw $0170,$0000 

MotherBrainsBomb_Bomb_Collision_Detection:
    LDA.W $1A4B,X : STA.B $12 
    LDA.W $1A93,X : STA.B $14 
    LDA.W $1BB3,X : AND.W #$00FF : STA.B $16 
    LDA.W $1BB3,X 
    XBA 
    AND.W #$00FF 
    STA.B $18 
    JSR.W Check_for_Bomb_Collision_with_Rectangle 
    BCS .collision 
    RTS 


.collision:
    PLA 
    LDA.L $7E784A 
    DEC A 
    STA.L $7E784A 
    STZ.W $1AB7,X 
    STZ.W $1ADB,X 
    STZ.W $1997,X 
    LDA.W $1A4B,X : STA.B $12 
    LDA.W $1A93,X : STA.B $14 
    LDA.W #$0009 
    LDY.W #EnemyProjectile_MiscDust 
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics 
    LDA.W $1A4B,X : STA.B $12 
    LDA.W $1A93,X : STA.B $14 
    LDA.W #EnemyHeaders_MotherBrainHead 
    PHX : PHY 
    JSL.L Spawn_Enemy_Drops 
    PLY : PLX 
    RTS 


Move_MotherBrains_Bomb:
    CLC : ADC.W $1ADB,X : STA.W $1ADB,X 
    JSR.W Move_EnemyProjectile_AccordingToVelocity 
    LDA.W $1A4B,X : CMP.W #$00F0 : BMI + 
    LDA.W $1AB7,X 
    EOR.W #$FFFF 
    INC A 
    STA.W $1AB7,X 

  + LDA.W $1A93,X : CMP.W #$00D0 : BMI .returnNoBounce 
    LDA.W #$00D0 : STA.W $1A93,X 
    LDA.W $1AFF,X : BIT.W $1AB7,X 
    BPL + 
    EOR.W #$FFFF 
    INC A 

  + STA.W $1AB7,X 
    LDA.W #$FE00 : STA.W $1ADB,X 
    SEC 
    RTS 


.returnNoBounce:
    CLC 
    RTS 


InitAI_EnemyProjectile_MotherBrainRedBeam_Charging:
    LDA.W #$0000 : STA.W $1AFF,Y 
    STA.W $1B23,Y 
    STA.W $1AB7,Y 
    STA.W $1ADB,Y 
    STA.W $1A27,Y 
    STA.W $1A6F,Y 
    STA.L $7E8006 
    STA.L $7E800A 
    LDA.W #$0400 : STA.W $19BB,Y 
    LDA.W $0F7A : CLC : ADC.W #$0040 : STA.W $1A4B,Y 
    STA.L $7E8008 
    LDA.W $0AF6 : SEC : SBC.L $7E8008 : STA.B $12 
    LDA.W $0F7E : CLC : ADC.W #$FFD0 : STA.W $1A93,Y 
    STA.L $7E800C 
    LDA.W $0AFA : SEC : SBC.L $7E800C : STA.B $14 
    JSL.L CalculateAngleOf_12_14_Offset 
    SEC : SBC.W #$0080 : EOR.W #$FFFF 
    INC A 
    AND.W #$00FF 
    STA.B $12 
    STA.L $7E8012 
    LDA.W #$0C00 : JSL.L Math_86C26C 
    STA.L $7E800E 
    LDA.W #$0C00 : JSL.L Math_86C272 
    STA.L $7E8010 
    RTS 


InitAI_EnemyProjectile_MotherBrainRedBeam_Fired:
    LDA.L $7E8008 : STA.W $1A4B,Y 
    LDA.L $7E8006 : STA.W $1A27,Y 
    LDA.L $7E800C : STA.W $1A93,Y 
    LDA.L $7E800A : STA.W $1A6F,Y 
    LDA.L $7E800E : STA.W $1AB7,Y 
    LDA.L $7E8010 : STA.W $1ADB,Y 
    TYX 
    JSR.W Move_EnemyProjectile_AccordingToVelocity 
    LDA.W $1A4B,X : STA.L $7E8008 
    LDA.W $1A27,X : STA.L $7E8006 
    LDA.W $1A93,X : STA.L $7E800C 
    LDA.W $1A6F,X : STA.L $7E800A 
    JSL.L GenerateRandomNumber 
    AND.W #$00FF 
    CLC : ADC.L $7E8012 : AND.W #$00FF 
    STA.B $12 
    JSL.L GenerateRandomNumber 
    AND.W #$0700 
    PHX 
    JSL.L Math_86C26C 
    PLX 
    STA.W $1AB7,X 
    LDA.W $05E5 : AND.W #$0700 
    PHX 
    JSL.L Math_86C272 
    PLX 
    STA.W $1ADB,X 
    JSR.W Move_EnemyProjectile_AccordingToVelocity 
    LDA.W $1A93,X : CMP.W #$0022 : BMI .delete 
    CMP.W #$00CE : BPL .delete 
    LDA.W $1A4B,X : CMP.W #$0002 : BMI .delete 
    CMP.W #$00EE : BPL .delete 
    LDA.W $1AFF,X 
    INC A 
    AND.W #$0003 
    STA.W $1AFF,X 
    LDA.W #$0000 : STA.W $1B23,X 
    STA.W $1AB7,X 
    STA.W $1ADB,X 
    RTS 


.delete:
    STZ.W $1997,X 
    LDA.W $1A4B,X : STA.B $12 
    LDA.W $1A93,X : STA.B $14 
    LDY.W #EnemyProjectile_MiscDust 
    LDA.W #$001D : JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics 
    LDA.W #$0013 : JSL.L QueueSound_Lib3_Max6 
    LDA.W #$000A : STA.W $1840 
    LDA.W #$0005 : STA.W $183E 
    RTS 

if !FEATURE_KEEP_UNREFERENCED
.unused:
; Guessing that [enemy projectile $1AFF] was used to index this table at one point
    dw $0002,$FFFE,$0002,$FFFE,$FFFE,$0002,$FFFE,$0002 
endif ; !FEATURE_KEEP_UNREFERENCED

RTS_86C76D:
    RTS 


InstList_EnemyProjectile_MotherBrainBomb:
    dw $0006,EnemyProjSpritemaps_MotherBrainsBomb_0 
    dw $0005,EnemyProjSpritemaps_MotherBrainsBomb_1 
    dw $0004,EnemyProjSpritemaps_MotherBrainsBomb_2 
    dw $0003,EnemyProjSpritemaps_MotherBrainsBomb_3 
    dw $0002,EnemyProjSpritemaps_MotherBrainsBomb_4 
    dw $0002,EnemyProjSpritemaps_MotherBrainsBomb_5 
    dw $0003,EnemyProjSpritemaps_MotherBrainsBomb_6 
    dw $0004,EnemyProjSpritemaps_MotherBrainsBomb_7 
    dw $0005,EnemyProjSpritemaps_MotherBrainsBomb_8 
    dw Instruction_EnemyProjectile_GotoY 
    dw InstList_EnemyProjectile_MotherBrainBomb 

InstList_EnemyProjectile_MotherBrainRedBeam:
    dw $0003,EnemyProjSpritemaps_MotherBrainsRedBeam_0 
    dw Instruction_EnemyProjectile_CallExternalFunctionInY 
    dl Spawn_MotherBrainRedBeam_Fired 
    dw $0003,EnemyProjSpritemaps_MotherBrainsRedBeam_1 
    dw $0002,EnemyProjSpritemaps_MotherBrainsRedBeam_2 
    dw $0002,EnemyProjSpritemaps_MotherBrainsRedBeam_3 
    dw $0001,EnemyProjSpritemaps_MotherBrainsRedBeam_4 
    dw $0001,EnemyProjSpritemaps_MotherBrainsRedBeam_5 
    dw $0001,EnemyProjSpritemaps_MotherBrainsRedBeam_6 
    dw $0003,EnemyProjSpritemaps_MotherBrainsRedBeam_0 
    dw Instruction_EnemyProjectile_CallExternalFunctionInY 
    dl Spawn_MotherBrainRedBeam_Fired 
    dw $0003,EnemyProjSpritemaps_MotherBrainsRedBeam_1 
    dw $0002,EnemyProjSpritemaps_MotherBrainsRedBeam_2 
    dw $0002,EnemyProjSpritemaps_MotherBrainsRedBeam_3 
    dw $0001,EnemyProjSpritemaps_MotherBrainsRedBeam_4 
    dw $0001,EnemyProjSpritemaps_MotherBrainsRedBeam_5 
    dw $0001,EnemyProjSpritemaps_MotherBrainsRedBeam_6 
    dw $0003,EnemyProjSpritemaps_MotherBrainsRedBeam_0 
    dw Instruction_EnemyProjectile_CallExternalFunctionInY 
    dl Spawn_MotherBrainRedBeam_Fired 
    dw $0003,EnemyProjSpritemaps_MotherBrainsRedBeam_1 
    dw $0002,EnemyProjSpritemaps_MotherBrainsRedBeam_2 
    dw $0002,EnemyProjSpritemaps_MotherBrainsRedBeam_3 
    dw $0001,EnemyProjSpritemaps_MotherBrainsRedBeam_4 
    dw $0001,EnemyProjSpritemaps_MotherBrainsRedBeam_5 
    dw $0001,EnemyProjSpritemaps_MotherBrainsRedBeam_6 
    dw Instruction_EnemyProjectile_Delete 

Spawn_MotherBrainRedBeam_Fired:
    PHX : PHY 
    LDA.W $1AFF,X 
    LDY.W #EnemyProjectile_MotherBrainRedBeam_Fired 
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics 
    PLY : PLX 
    RTL 


InitAI_EnemyProjectile_MotherBrainRainbowBeam_Charging:
    TYX 
    STZ.W $19BB,X 
    STZ.W $1AB7,X 
    STZ.W $1ADB,X 

PreInst_EnemyProjectile_MotherBrainRainbowBeam_Charging:
    LDA.W $0FBA : CLC : ADC.W #$0000 : STA.W $1A4B,X 
    LDA.W $0FBE : CLC : ADC.W #$0000 : STA.W $1A93,X 
    RTS 


InstList_EnemyProjectile_MotherBrainRainbowBeam_Charging:
    dw $0005,EnemyProjSpritemaps_MotherBrainsRainbowBeamCharging_5 
    dw $0005,EnemyProjSpritemaps_MotherBrainsRainbowBeamCharging_4 
    dw $0005,EnemyProjSpritemaps_MotherBrainsRainbowBeamCharging_3 
    dw $0005,EnemyProjSpritemaps_MotherBrainsRainbowBeamCharging_2 
    dw $0005,EnemyProjSpritemaps_MotherBrainsRainbowBeamCharging_1 
    dw $0005,EnemyProjSpritemaps_MotherBrainsRainbowBeamCharging_0 
    dw Instruction_EnemyProjectile_Delete 

InitAI_EnemyProjectile_MotherBrainsDrool:
    TYX 
    STZ.W $19BB,X 
    LDA.W $1993 : STA.W $1AFF,X 

PreInstruction_EnemyProjectile_MotherBrainsDrool:
    LDA.W $1AFF,X 
    ASL #2
    TAY 
    LDA.W .Xoffsets,Y : CLC : ADC.W $0FBA : STA.W $1A4B,X 
    LDA.W .Yoffsets,Y : CLC : ADC.W $0FBE : STA.W $1A93,X 
    STZ.W $1AB7,X 
    STZ.W $1ADB,X 
    RTS 

.Xoffsets:
    dw $0006 
.Yoffsets:
    dw       $0014 
    dw $000E,$0012
    dw $0008,$0017
    dw $000A,$0013
    dw $000B,$0019
    dw $000C,$0012


PreInstruction_EnemyProjectile_MotherBrainsDrool_Falling:
    LDA.W $1ADB,X : CLC : ADC.W #$000C : STA.W $1ADB,X 
    JSR.W Move_EnemyProjectile_Vertically_AccordingToVelocity 
    CMP.W #$00D7 : BCS .hitFloor 
    RTS 


.hitFloor:
    LDA.W $1A93,X : CLC : ADC.W #$FFFC : STA.W $1A93,X 
    LDA.W #InstList_EnemyProjectile_MotherBrainsDrool_HitFloor : STA.W $1B47,X 
    LDA.W #$0001 : STA.W $1B8F,X 
    RTS 


InstList_EnemyProjectile_MotherBrainsDrool:
    dw $000A,EnemyProjSpritemaps_MotherBrainsDrool_0 
    dw $000A,EnemyProjSpritemaps_MotherBrainsDrool_1 
    dw $000A,EnemyProjSpritemaps_MotherBrainsDrool_7 
    dw $000A,EnemyProjSpritemaps_MotherBrainsDrool_8 
    dw $000A,EnemyProjSpritemaps_MotherBrainsDrool_9 
    dw Instruction_EnemyProjectile_PreInstructionInY 
    dw PreInstruction_EnemyProjectile_MotherBrainsDrool_Falling 
    dw Instruction_EnemyProj_MotherBrainsDrool_MoveDownCPixels 
    dw $000A,EnemyProjSpritemaps_MotherBrainsDrool_2 
    dw Instruction_EnemyProjectile_Sleep 

Instruction_EnemyProj_MotherBrainsDrool_MoveDownCPixels:
    LDA.W $1A93,X : CLC : ADC.W #$000C : STA.W $1A93,X 
    RTS 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_InstList_EnemyProjectile_MotherBrainsDrool_86C8DB:
    dw $000A,EnemyProjSpritemaps_MotherBrainsDrool_2 
    dw Instruction_EnemyProjectile_Sleep 
endif ; !FEATURE_KEEP_UNREFERENCED

InstList_EnemyProjectile_MotherBrainsDrool_HitFloor:
    dw Instruction_EnemyProjectile_ClearPreInstruction 
    dw $000A,EnemyProjSpritemaps_MotherBrainsDrool_3 
    dw $000A,EnemyProjSpritemaps_MotherBrainsDrool_4 
    dw $000A,EnemyProjSpritemaps_MotherBrainsDrool_5 
    dw $000A,EnemyProjSpritemaps_MotherBrainsDrool_6 
    dw Instruction_EnemyProjectile_Delete 

InitAI_EnemyProjectile_MotherBrainsDeathExplosion:
    TYX 
    LDA.W $1993 
    ASL A 
    TAY 
    LDA.W MotherBrainsDeathExplosion_InstListPointers,Y : STA.W $1B47,X 
    LDA.W #$0001 : STA.W $1B8F,X 
    STZ.W $19BB,X 
    LDA.B $12 : STA.W $1AB7,X 
    LDA.B $14 : STA.W $1ADB,X 

PreInstruction_EnemyProjectile_MotherBrainsDeathExplosion:
    LDA.W $1AB7,X : CLC : ADC.W $0F7A : STA.W $1A4B,X 
    LDA.W $1ADB,X : CLC : ADC.W $0F7E : STA.W $1A93,X 
    RTS 


MotherBrainsDeathExplosion_InstListPointers:
    dw InstList_EnemyProj_MiscDust_3_SmallExplosion 
    dw InstList_EnemyProj_MiscDust_C_Smoke 
    dw InstList_EnemyProj_MiscDust_1D_BigExplosion 

InitAI_EnemyProjectile_MotherBrainsRainbowBeamExplosion:
    TYX 
    STZ.W $19BB,X 
    LDA.B $12 : STA.W $1AB7,X 
    CLC : ADC.W $0AF6 : STA.W $1A4B,X 
    LDA.B $14 : STA.W $1ADB,X 
    CLC : ADC.W $0AFA : STA.W $1A93,X 
    RTS 


PreInstruction_EnemyProj_MotherBrainsRainbowBeamExplosion:
    LDA.W $1AB7,X : CLC : ADC.W $0AF6 : STA.W $1A4B,X 
    LDA.W $1ADB,X : CLC : ADC.W $0AFA : STA.W $1A93,X 
    RTS 


InitAI_EnemyProjectile_MotherBrainExplodedEscapeDoorParticle:
    TYX 
    STZ.W $19BB,X 
    LDA.W $1993 
    ASL #2
    TAY 
    LDA.W .Xoffsets,Y : CLC : ADC.W #$0010 : STA.W $1A4B,X 
    LDA.W .Yoffsets,Y : CLC : ADC.W #$0080 : STA.W $1A93,X 
    LDA.W .Xvelocities,Y : STA.W $1AB7,X 
    LDA.W .Yvelocities,Y : STA.W $1ADB,X 
    LDA.W #$0020 : STA.W $1AFF,X 
    RTS 

.Xoffsets:
    dw $0000 
.Yoffsets:
    dw       $FFE0,$0000,$FFE8,$0000,$FFF0,$0000,$FFF8 
    dw $0000,$0000,$0000,$0008,$0000,$0010,$0000,$0018 

.Xvelocities:
    dw $0500 
.Yvelocities:
    dw       $FE00,$0500,$FF00,$0500,$FF00,$0500,$FF80 
    dw $0500,$FF80,$0500,$0080,$0500,$FF00,$0500,$0200 


PreInst_EnemyProj_MotherBrainExplodedEscapeDoorParticles:
    LDA.W $1AB7,X : BPL + 
    EOR.W #$FFFF 
    INC A 

  + SEC : SBC.W #$0010 : BPL + 
    LDA.W #$0000 

  + BIT.W $1AB7,X 
    BPL + 
    EOR.W #$FFFF 
    INC A 

  + STA.W $1AB7,X 
    LDA.W $1ADB,X : CLC : ADC.W #$0020 : STA.W $1ADB,X 
    JSR.W Move_EnemyProjectile_AccordingToVelocity 
    DEC.W $1AFF,X 
    BMI + 
    RTS 


  + STZ.W $1997,X 
    LDA.W $1A93,X : CLC : ADC.W #$FFFC : STA.W $1A93,X 
    STA.B $14 
    LDA.W $1A4B,X : STA.B $12 
    LDA.W #$0009 
    LDY.W #EnemyProjectile_MiscDust 
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics 
    RTS 


InstList_EnemyProj_MotherBrainExplodedEscapeDoorParticle:
    dw $0001,EnemyProjSpritemaps_MotherBrainExplodedEscapeDoorParticles_0 
    dw $0001,EnemyProjSpritemaps_MotherBrainExplodedEscapeDoorParticles_1 
    dw $0001,EnemyProjSpritemaps_MotherBrainExplodedEscapeDoorParticles_2 
    dw $0001,EnemyProjSpritemaps_MotherBrainExplodedEscapeDoorParticles_3 
    dw $0003,EnemyProjSpritemaps_MotherBrainExplodedEscapeDoorParticles_4 
    dw $0003,EnemyProjSpritemaps_MotherBrainExplodedEscapeDoorParticles_5 
    dw $0004,EnemyProjSpritemaps_MotherBrainExplodedEscapeDoorParticles_6 
    dw $0004,EnemyProjSpritemaps_MotherBrainExplodedEscapeDoorParticles_7 
    dw Instruction_EnemyProjectile_GotoY 
    dw InstList_EnemyProj_MotherBrainExplodedEscapeDoorParticle 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_InstList_86CA46:
    dw $0001,UNUSED_EnemyProjSpritemaps_0_8D96D3 
    dw $0001,UNUSED_EnemyProjSpritemaps_1_8D96DA 
    dw $0001,UNUSED_EnemyProjSpritemaps_2_8D96E1 
    dw $0001,UNUSED_EnemyProjSpritemaps_3_8D96E8 
    dw $0003,UNUSED_EnemyProjSpritemaps_4_8D96EF 
    dw $0003,UNUSED_EnemyProjSpritemaps_5_8D96F6 
    dw $0004,UNUSED_EnemyProjSpritemaps_6_8D96FD 
    dw $0004,UNUSED_EnemyProjSpritemaps_7_8D9704 
    dw Instruction_EnemyProjectile_GotoY 
    dw UNUSED_InstList_86CA46 
endif ; !FEATURE_KEEP_UNREFERENCED

InitAI_EnemyProjectile_MotherBrainPurpleBreath_Big:
    TYX 
    STZ.W $19BB,X 
    LDA.W $0FBA : CLC : ADC.W #$0006 : STA.W $1A4B,X 
    LDA.W $0FBE : CLC : ADC.W #$0010 : STA.W $1A93,X 
    RTS 


InitAI_EnemyProjectile_MotherBrainPurpleBreath_Small:
    TYX 
    STZ.W $19BB,X 
    LDA.W $0FBA : CLC : ADC.W #$0006 : STA.W $1A4B,X 
    LDA.W $0FBE : CLC : ADC.W #$0010 : STA.W $1A93,X 
    LDA.W #$0001 : STA.L $7E786A 
    RTS 


RTS_86CAA3:
    RTS 


InstList_EnemyProjectile_MotherBrainPurpleBreath_Big:
    dw Instruction_EnemyProjectile_ClearPreInstruction 
    dw $0008,EnemyProjSpritemaps_MotherBrainsPurpleBreath_Big_0 
    dw $0008,EnemyProjSpritemaps_MotherBrainsPurpleBreath_Big_1 
    dw $0009,EnemyProjSpritemaps_MotherBrainsPurpleBreath_Big_2 
    dw $0009,EnemyProjSpritemaps_MotherBrainsPurpleBreath_Big_3 
    dw $000A,EnemyProjSpritemaps_MotherBrainsPurpleBreath_Big_4 
    dw $000A,EnemyProjSpritemaps_MotherBrainsPurpleBreath_Big_5 
    dw $000B,EnemyProjSpritemaps_MotherBrainsPurpleBreath_Big_6 
    dw $000B,EnemyProjSpritemaps_MotherBrainsPurpleBreath_Big_7 
    dw Instruction_EnemyProjectile_Delete 

InstList_EnemyProjectile_MotherBrainPurpleBreath_Small:
    dw Instruction_EnemyProjectile_ClearPreInstruction 
    dw $0008,EnemyProjSpritemaps_MotherBrainsPurpleBreath_Small_0 
    dw $0008,EnemyProjSpritemaps_MotherBrainsPurpleBreath_Small_1 
    dw $000A,EnemyProjSpritemaps_MotherBrainsPurpleBreath_Small_2 
    dw $000A,EnemyProjSpritemaps_MotherBrainsPurpleBreath_Small_3 
    dw $000B,EnemyProjSpritemaps_MotherBrainsPurpleBreath_Small_4 
    dw $000B,EnemyProjSpritemaps_MotherBrainsPurpleBreath_Small_5 
    dw $000C,EnemyProjSpritemaps_MotherBrainsPurpleBreath_Small_6 
    dw $000C,EnemyProjSpritemaps_MotherBrainsPurpleBreath_Small_7 
    dw Instruction_EnemyProjectile_MotherBrainPurpleBreath_Inactive 
    dw Instruction_EnemyProjectile_Delete 

Instruction_EnemyProjectile_MotherBrainPurpleBreath_Inactive:
    LDA.W #$0000 : STA.L $7E786A 
    RTS 


InitAI_EnemyProjectile_TimeBombSetJapanText:
    TYX 
    STZ.W $19BB,X 

PreInstruction_EnemyProjectile_TimeBombSetJapanText:
    STZ.W $1AB7,X 
    STZ.W $1ADB,X 
    LDA.W #$0080 : STA.W $1A4B,X 
    LDA.W #$00C0 : STA.W $1A93,X 
    RTS 


InstList_EnemyProjectile_TimeBombSetJapanText:
    dw $0001,EnemyProjSpritemaps_TimeBombSetJapanSet 
    dw Instruction_EnemyProjectile_Sleep 

EnemyProjectile_MotherBrainDeathExplosion:
    dw InitAI_EnemyProjectile_MotherBrainsDeathExplosion ; Initialisation AI
    dw PreInstruction_EnemyProjectile_MotherBrainsDeathExplosion ; Initial pre-instruction
    dw $0000 ; Initial instruction list
    db $00,$00 ; X,Y radius
    dw $2000 ; Properties
    dw $0000 ; Hit instruction list
    dw InstList_EnemyProjectile_Delete ; Shot instruction list

EnemyProjectile_MotherBrainExplodedEscapeDoorParticles:
    dw InitAI_EnemyProjectile_MotherBrainExplodedEscapeDoorParticle ; Initialisation AI
    dw PreInst_EnemyProj_MotherBrainExplodedEscapeDoorParticles ; Initial pre-instruction
    dw InstList_EnemyProj_MotherBrainExplodedEscapeDoorParticle ; Initial instruction list
    db $00,$00 ; X,Y radius
    dw $3000 ; Properties
    dw $0000 ; Hit instruction list
    dw InstList_EnemyProjectile_Delete ; Shot instruction list

EnemyProjectile_MotherBrainPurpleBreath_Big:
    dw InitAI_EnemyProjectile_MotherBrainPurpleBreath_Big ; Initialisation AI
    dw RTS_86CAA3 ; Initial pre-instruction
    dw InstList_EnemyProjectile_MotherBrainPurpleBreath_Big ; Initial instruction list
    db $00,$00 ; X,Y radius
    dw $3000 ; Properties
    dw $0000 ; Hit instruction list
    dw InstList_EnemyProjectile_Delete ; Shot instruction list

EnemyProjectile_MotherBrainPurpleBreath_Small:
    dw InitAI_EnemyProjectile_MotherBrainPurpleBreath_Small ; Initialisation AI
    dw RTS_86CAA3 ; Initial pre-instruction
    dw InstList_EnemyProjectile_MotherBrainPurpleBreath_Small ; Initial instruction list
    db $00,$00 ; X,Y radius
    dw $3000 ; Properties
    dw $0000 ; Hit instruction list
    dw InstList_EnemyProjectile_Delete ; Shot instruction list

EnemyProjectile_MotherBrainOnionRings:
    dw InitAI_EnemyProjectile_MotherBrainsOnionRings ; Initialisation AI
    dw PreInstruction_EnemyProjectile_MotherBrainsOnionRings ; Initial pre-instruction
    dw InstList_EnemyProjectile_MotherBrainsOnionRings ; Initial instruction list
    db $06,$06 ; X,Y radius
    dw $3050 ; Properties
    dw InstList_EnemyProjectile_Hit_MotherBrainsOnionRings ; Hit instruction list
    dw InstList_EnemyProjectile_Delete ; Shot instruction list

EnemyProjectile_MotherBrainBomb:
    dw InitAI_EnemyProjectile_MotherBrainsBomb ; Initialisation AI
    dw PreInstruction_EnemyProjectile_MotherBrainsBomb ; Initial pre-instruction
    dw InstList_EnemyProjectile_MotherBrainBomb ; Initial instruction list
    db $06,$06 ; X,Y radius
    dw $40A0 ; Properties
    dw $0000 ; Hit instruction list
    dw InstList_EnemyProjectile_Delete ; Shot instruction list

EnemyProjectile_MotherBrainRedBeam_Charging:
    dw InitAI_EnemyProjectile_MotherBrainRedBeam_Charging ; Initialisation AI
    dw RTS_86C76D ; Initial pre-instruction
    dw InstList_EnemyProjectile_MotherBrainRedBeam ; Initial instruction list
    db $06,$06 ; X,Y radius
    dw $1190 ; Properties
    dw $0000 ; Hit instruction list
    dw InstList_EnemyProjectile_Delete ; Shot instruction list

EnemyProjectile_MotherBrainRedBeam_Fired:
    dw InitAI_EnemyProjectile_MotherBrainRedBeam_Fired ; Initialisation AI
    dw RTS_86C76D ; Initial pre-instruction
    dw InstList_EnemyProjectile_MotherBrainRedBeam ; Initial instruction list
    db $06,$06 ; X,Y radius
    dw $1190 ; Properties
    dw $0000 ; Hit instruction list
    dw InstList_EnemyProjectile_Delete ; Shot instruction list

EnemyProjectile_MotherBrainRainbowBeam_Charging:
    dw InitAI_EnemyProjectile_MotherBrainRainbowBeam_Charging ; Initialisation AI
    dw PreInst_EnemyProjectile_MotherBrainRainbowBeam_Charging ; Initial pre-instruction
    dw InstList_EnemyProjectile_MotherBrainRainbowBeam_Charging ; Initial instruction list
    db $00,$00 ; X,Y radius
    dw $7000 ; Properties
    dw $0000 ; Hit instruction list
    dw InstList_EnemyProjectile_Delete ; Shot instruction list

EnemyProjectile_MotherBrainDrool:
    dw InitAI_EnemyProjectile_MotherBrainsDrool ; Initialisation AI
    dw PreInstruction_EnemyProjectile_MotherBrainsDrool ; Initial pre-instruction
    dw InstList_EnemyProjectile_MotherBrainsDrool ; Initial instruction list
    db $00,$00 ; X,Y radius
    dw $7000 ; Properties
    dw $0000 ; Hit instruction list
    dw InstList_EnemyProjectile_Delete ; Shot instruction list

EnemyProjectile_MotherBrainDyingDrool:
    dw InitAI_EnemyProjectile_MotherBrainsDrool ; Initialisation AI
    dw PreInstruction_EnemyProjectile_MotherBrainsDrool ; Initial pre-instruction
    dw InstList_EnemyProjectile_MotherBrainsDrool ; Initial instruction list
    db $00,$00 ; X,Y radius
    dw $7000 ; Properties
    dw $0000 ; Hit instruction list
    dw InstList_EnemyProjectile_Delete ; Shot instruction list

EnemyProjectile_MotherBrainRainbowBeam_Explosion:
    dw InitAI_EnemyProjectile_MotherBrainsRainbowBeamExplosion ; Initialisation AI
    dw PreInstruction_EnemyProj_MotherBrainsRainbowBeamExplosion ; Initial pre-instruction
    dw InstList_EnemyProj_MiscDust_4_MotherBrainRainbowBeamExplosion ; Initial instruction list
    db $01,$01 ; X,Y radius
    dw $7000 ; Properties
    dw $0000 ; Hit instruction list
    dw InstList_EnemyProjectile_Delete ; Shot instruction list

EnemyProjectile_TimeBombSetJapanText:
    dw InitAI_EnemyProjectile_TimeBombSetJapanText ; Initialisation AI
    dw PreInstruction_EnemyProjectile_TimeBombSetJapanText ; Initial pre-instruction
    dw InstList_EnemyProjectile_TimeBombSetJapanText ; Initial instruction list
    db $00,$00 ; X,Y radius
    dw $1000 ; Properties
    dw $0000 ; Hit instruction list
    dw InstList_EnemyProjectile_Delete ; Shot instruction list

InitAI_EnemyProjectile_MotherBrainsTubeFalling:
    TYX 
    LDA.W #$0E00 : STA.W $19BB,X 
    STZ.W $1AB7,X 
    STZ.W $1ADB,X 
    LDA.B $12 : STA.W $1A4B,X 
    LDA.B $14 : STA.W $1A93,X 
    LDA.W #MotherBrainsTubeFallingFunction_GenerateExplosion : STA.W $1AFF,X 
    RTS 


PreInstruction_EnemyProjectile_MotherBrainsTubeFalling:
    JMP.W ($1AFF,X) 


MotherBrainsTubeFallingFunction_GenerateExplosion:
    LDA.W $1A4B,X : STA.B $12 
    LDA.W $1A93,X : CLC : ADC.W #$0008 : STA.B $14 
    LDA.W #$0009 
    LDY.W #EnemyProjectile_MiscDust 
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics 
    LDA.W #MotherBrainsTubeFallingFunction_Falling : STA.W $1AFF,X 

MotherBrainsTubeFallingFunction_Falling:
    REP #$21 
    LDA.W $1ADB,X : ADC.W #$0006 : STA.W $1ADB,X 
    JSR.W Move_EnemyProjectile_Vertically_AccordingToVelocity 
    CMP.W #$00D0 : BMI .return 
    STZ.W $1997,X 
    LDA.W $1A4B,X : STA.B $12 
    LDA.W $1A93,X : STA.B $14 
    LDA.W #$000C 
    LDY.W #EnemyProjectile_MiscDust 
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics 

.return:
    RTS 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_86CC33:
    dw $FF00,$0100, $0100,$0000, $FF00,$FF00, $0100,$0000 
endif ; !FEATURE_KEEP_UNREFERENCED

InstList_EnemyProjectile_MotherBrainsTubeFalling_TopRight:
    dw $0001,EnemyProjSpritemaps_MotherBrainsTubeFalling_TopRight 
    dw Instruction_EnemyProjectile_Sleep 

InstList_EnemyProjectile_MotherBrainsTubeFalling_TopLeft:
    dw $0001,EnemyProjSpritemaps_MotherBrainsTubeFalling_TopLeft 
    dw Instruction_EnemyProjectile_Sleep 

InstList_EnemyProj_MotherBrainsTubeFalling_TopMiddleLeft:
    dw $0001,EnemyProjSpritemaps_MotherBrainsTubeFalling_TopMiddleLeft 
    dw Instruction_EnemyProjectile_Sleep 

InstList_EnemyProj_MotherBrainsTubeFalling_TopMiddleRight:
    dw $0001,EnemyProjSpritemaps_MotherBrainsTubeFalling_TopMiddleRight 
    dw Instruction_EnemyProjectile_Sleep 

EnemyProjectile_MotherBrainTubeFalling_TopRight:
    dw InitAI_EnemyProjectile_MotherBrainsTubeFalling ; Initialisation AI
    dw PreInstruction_EnemyProjectile_MotherBrainsTubeFalling ; Initial pre-instruction
    dw InstList_EnemyProjectile_MotherBrainsTubeFalling_TopRight ; Initial instruction list
    db $08,$10 ; X,Y radius
    dw $5000 ; Properties
    dw $0000 ; Hit instruction list
    dw InstList_EnemyProjectile_Delete ; Shot instruction list

EnemyProjectile_MotherBrainTubeFalling_TopLeft:
    dw InitAI_EnemyProjectile_MotherBrainsTubeFalling ; Initialisation AI
    dw PreInstruction_EnemyProjectile_MotherBrainsTubeFalling ; Initial pre-instruction
    dw InstList_EnemyProjectile_MotherBrainsTubeFalling_TopLeft ; Initial instruction list
    db $08,$10 ; X,Y radius
    dw $5000 ; Properties
    dw $0000 ; Hit instruction list
    dw InstList_EnemyProjectile_Delete ; Shot instruction list

EnemyProjectile_MotherBrainTubeFalling_TopMiddleLeft:
    dw InitAI_EnemyProjectile_MotherBrainsTubeFalling ; Initialisation AI
    dw PreInstruction_EnemyProjectile_MotherBrainsTubeFalling ; Initial pre-instruction
    dw InstList_EnemyProj_MotherBrainsTubeFalling_TopMiddleLeft ; Initial instruction list
    db $08,$18 ; X,Y radius
    dw $5000 ; Properties
    dw $0000 ; Hit instruction list
    dw InstList_EnemyProjectile_Delete ; Shot instruction list

EnemyProjectile_MotherBrainTubeFalling_TopMiddleRight:
    dw InitAI_EnemyProjectile_MotherBrainsTubeFalling ; Initialisation AI
    dw PreInstruction_EnemyProjectile_MotherBrainsTubeFalling ; Initial pre-instruction
    dw InstList_EnemyProj_MotherBrainsTubeFalling_TopMiddleRight ; Initial instruction list
    db $08,$18 ; X,Y radius
    dw $5000 ; Properties
    dw $0000 ; Hit instruction list
    dw InstList_EnemyProjectile_Delete ; Shot instruction list

InstList_EnemyProjectile_MotherBrainsGlassShattering_0:
    dw $0004,EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_0 
    dw $0003,EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_1 
    dw $0002,EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_2 
    dw $0003,EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_3 
    dw $0004,EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_4 
    dw $0003,EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_5 
    dw $0002,EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_6 
    dw $0003,EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_7 
    dw Instruction_EnemyProjectile_GotoY 
    dw InstList_EnemyProjectile_MotherBrainsGlassShattering_0 

InstList_EnemyProjectile_MotherBrainsGlassShattering_1_2:
    dw $0004,EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_10 
    dw $0003,EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_11 
    dw $0002,EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_12 
    dw $0003,EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_13 
    dw $0004,EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_14 
    dw $0003,EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_15 
    dw $0002,EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_16 
    dw $0003,EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_17 
    dw Instruction_EnemyProjectile_GotoY 
    dw InstList_EnemyProjectile_MotherBrainsGlassShattering_1_2 

InstList_EnemyProjectile_MotherBrainsGlassShattering_3_4_5:
    dw $0004,EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_8 
    dw $0003,EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_9 
    dw $0002,EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_A 
    dw $0003,EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_B 
    dw $0004,EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_C 
    dw $0003,EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_D 
    dw $0002,EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_E 
    dw $0003,EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_F 
    dw Instruction_EnemyProjectile_GotoY 
    dw InstList_EnemyProjectile_MotherBrainsGlassShattering_3_4_5 

InstList_EnemyProjectile_MotherBrainsGlassShattering_6_7:
    dw $0004,EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_18 
    dw $0003,EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_19 
    dw $0002,EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_1A 
    dw $0003,EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_1B 
    dw $0004,EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_1C 
    dw $0003,EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_1D 
    dw $0002,EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_1E 
    dw $0003,EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_1F 
    dw Instruction_EnemyProjectile_GotoY 
    dw InstList_EnemyProjectile_MotherBrainsGlassShattering_6_7 

InstList_EnemyProjectile_MotherBrainsGlassShattering_8:
    dw $0004,EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_20 
    dw $0003,EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_21 
    dw $0002,EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_22 
    dw $0003,EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_23 
    dw $0004,EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_24 
    dw $0003,EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_25 
    dw $0002,EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_26 
    dw $0003,EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_27 
    dw Instruction_EnemyProjectile_GotoY 
    dw InstList_EnemyProjectile_MotherBrainsGlassShattering_8 

InstList_EnemyProjectile_MotherBrainsGlassShattering_9_A:
    dw $0004,EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_30 
    dw $0003,EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_31 
    dw $0002,EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_32 
    dw $0003,EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_33 
    dw $0004,EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_34 
    dw $0003,EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_35 
    dw $0002,EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_36 
    dw $0003,EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_37 
    dw Instruction_EnemyProjectile_GotoY 
    dw InstList_EnemyProjectile_MotherBrainsGlassShattering_9_A 

InstList_EnemyProjectile_MotherBrainsGlassShattering_B_C_D:
    dw $0004,EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_28 
    dw $0003,EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_29 
    dw $0002,EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_2A 
    dw $0003,EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_2B 
    dw $0004,EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_2C 
    dw $0003,EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_2D 
    dw $0002,EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_2E 
    dw $0003,EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_2F 
    dw Instruction_EnemyProjectile_GotoY 
    dw InstList_EnemyProjectile_MotherBrainsGlassShattering_B_C_D 

InstList_EnemyProjectile_MotherBrainsGlassShattering_E_F:
    dw $0004,EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_38 
    dw $0003,EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_39 
    dw $0002,EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_3A 
    dw $0003,EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_3B 
    dw $0004,EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_3C 
    dw $0003,EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_3D 
    dw $0002,EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_3E 
    dw $0003,EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_3F 
    dw Instruction_EnemyProjectile_GotoY 
    dw InstList_EnemyProjectile_MotherBrainsGlassShattering_E_F 

InstList_EnemyProjectile_MotherBrainsGlassShattering_Sparkle:
    dw $0006,EnemyProjSpritemaps_MotherBrainsGlassShattering_Sparkle_0 
    dw $0008,EnemyProjSpritemaps_MotherBrainsGlassShattering_Sparkle_1 
    dw $0006,EnemyProjSpritemaps_MotherBrainsGlassShattering_Sparkle_2 
    dw $0008,EnemyProjSpritemaps_MotherBrainsGlassShattering_Sparkle_3 
    dw Instruction_EnemyProjectile_Delete 

InitAI_EnemyProjectile_MotherBrainsGlassShattering_Shard:
    JSL.L GenerateRandomNumber 
    ASL A 
    AND.W #$01FE 
    STA.W $1AFF,Y 
    TAX 
    LDA.L SineCosineTables_8bitSine_SignExtended,X : STA.W $1AB7,Y 
    LDA.L SineCosineTables_NegativeCosine_SignExtended,X 
    ASL #2
    STA.W $1ADB,Y 
    TXA 
    LSR #4
    AND.W #$001E 
    TAX 
    LDA.W .InstListPointers,X : STA.W $1B47,Y 
    LDA.W #$0640 : STA.W $19BB,Y 
    LDX.W $1C27 
    JSL.L Calculate_PLM_Block_Coordinates 
    LDX.W $1993 
    LDA.W $1C29 
    ASL #4
    CLC : ADC.W .Xoffsets,X : STA.W $1A4B,Y 
    LDA.W $1C2B 
    ASL #4
    CLC : ADC.W .Yoffsets,X : STA.W $1A93,Y 
    JSL.L GenerateRandomNumber 
    AND.W #$000F 
    SEC : SBC.W #$0008 : CLC : ADC.W $1A4B,Y : STA.W $1A4B,Y 
    JSL.L GenerateRandomNumber 
    AND.W #$000F 
    SEC : SBC.W #$0008 : CLC : ADC.W $1A93,Y : STA.W $1A93,Y 
    RTS 

.InstListPointers:
    dw InstList_EnemyProjectile_MotherBrainsGlassShattering_0 
    dw InstList_EnemyProjectile_MotherBrainsGlassShattering_1_2 
    dw InstList_EnemyProjectile_MotherBrainsGlassShattering_1_2 
    dw InstList_EnemyProjectile_MotherBrainsGlassShattering_3_4_5 
    dw InstList_EnemyProjectile_MotherBrainsGlassShattering_3_4_5 
    dw InstList_EnemyProjectile_MotherBrainsGlassShattering_3_4_5 
    dw InstList_EnemyProjectile_MotherBrainsGlassShattering_6_7 
    dw InstList_EnemyProjectile_MotherBrainsGlassShattering_6_7 
    dw InstList_EnemyProjectile_MotherBrainsGlassShattering_8 
    dw InstList_EnemyProjectile_MotherBrainsGlassShattering_9_A 
    dw InstList_EnemyProjectile_MotherBrainsGlassShattering_9_A 
    dw InstList_EnemyProjectile_MotherBrainsGlassShattering_B_C_D 
    dw InstList_EnemyProjectile_MotherBrainsGlassShattering_B_C_D 
    dw InstList_EnemyProjectile_MotherBrainsGlassShattering_B_C_D 
    dw InstList_EnemyProjectile_MotherBrainsGlassShattering_E_F 
    dw InstList_EnemyProjectile_MotherBrainsGlassShattering_E_F 

.Xoffsets:
; Indexed by initialisation parameter
    dw $0008,$FFD8,$FFF0 

.Yoffsets:
; Indexed by initialisation parameter
    dw $0020,$0020,$0020 


InitAI_EnemyProjectile_MotherBrainGlassShattering_Sparkle:
    LDX.W $1993 
    JSL.L GenerateRandomNumber 
    AND.W #$001F 
    SEC : SBC.W #$0010 : CLC : ADC.W $1A4B,X : STA.W $1A4B,Y 
    JSL.L GenerateRandomNumber 
    AND.W #$001F 
    SEC : SBC.W #$0010 : CLC : ADC.W $1A93,X : STA.W $1A93,Y 
    LDA.W #$0640 : STA.W $19BB,Y 
    RTS 


PreInstruction_EnemyProj_MotherBrainGlassShattering_Shard:
    STZ.B $12 
    STZ.B $14 
    LDA.W $1AB7,X : BPL + 
    DEC.B $14 

  + STA.B $13 
    LDA.W $1A27,X : CLC : ADC.B $12 : STA.W $1A27,X 
    LDA.W $1A4B,X : ADC.B $14 : STA.W $1A4B,X 
    STZ.B $12 
    STZ.B $14 
    LDA.W $1ADB,X : BPL + 
    DEC.B $14 

  + STA.B $13 
    LDA.W $1A6F,X : CLC : ADC.B $12 : STA.W $1A6F,X 
    LDA.W $1A93,X : ADC.B $14 : STA.W $1A93,X 
    AND.W #$FF00 
    BNE .delete 
    LDA.W $1ADB,X : CLC : ADC.W #$0020 : STA.W $1ADB,X 
    JSL.L GenerateRandomNumber 
    AND.W #$0420 
    BNE .return 
    TXA 
    LDY.W #EnemyProjectile_MotherBrainGlassShattering_Sparkle 
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics 

.return:
    RTS 


.delete:
    STZ.W $1997,X 
    RTS 


EnemyProjectile_MotherBrainGlassShattering_Shard:
    dw InitAI_EnemyProjectile_MotherBrainsGlassShattering_Shard ; Initialisation AI
    dw PreInstruction_EnemyProj_MotherBrainGlassShattering_Shard ; Initial pre-instruction
    dw InstList_EnemyProjectile_MotherBrainsGlassShattering_0 ; Initial instruction list
    db $00,$00 ; X,Y radius
    dw $3000 ; Properties
    dw $0000 ; Hit instruction list
    dw InstList_EnemyProjectile_Delete ; Shot instruction list

EnemyProjectile_MotherBrainGlassShattering_Sparkle:
    dw InitAI_EnemyProjectile_MotherBrainGlassShattering_Sparkle ; Initialisation AI
    dw RTS_8684FB ; Initial pre-instruction
    dw InstList_EnemyProjectile_MotherBrainsGlassShattering_Sparkle ; Initial instruction list
    db $00,$00 ; X,Y radius
    dw $3000 ; Properties
    dw $0000 ; Hit instruction list
    dw InstList_EnemyProjectile_Delete ; Shot instruction list

EnemyProjectile_KiHunterAcidSpit_Left:
    dw InitAI_EnemyProjectile_KiHunterAcidSpit_Left ; Initialisation AI
    dw RTS_86CFF7 ; Initial pre-instruction
    dw InstList_EnemyProjectile_KiHunterAcidSpit_Left ; Initial instruction list
    db $02,$08 ; X,Y radius
    dw $0014 ; Properties
    dw $0000 ; Hit instruction list
    dw InstList_EnemyProjectile_Delete ; Shot instruction list

EnemyProjectile_KiHunterAcidSpit_Right:
    dw InitAI_EnemyProjectile_KiHunterAcidSpit_Right ; Initialisation AI
    dw RTS_86CFF7 ; Initial pre-instruction
    dw InstList_EnemyProjectile_KiHunterAcidSpit_Right ; Initial instruction list
    db $02,$08 ; X,Y radius
    dw $0014 ; Properties
    dw $0000 ; Hit instruction list
    dw InstList_EnemyProjectile_Delete ; Shot instruction list

InstList_EnemyProjectile_KiHunterAcidSpit_Left:
    dw $0003,EnemyProjSpritemaps_KihunterAcidSpit_Left_0 
    dw $0003,EnemyProjSpritemaps_KihunterAcidSpit_Left_1 
    dw $0004,EnemyProjSpritemaps_KihunterAcidSpit_Left_2 
    dw $0003,EnemyProjSpritemaps_KihunterAcidSpit_Left_3 
    dw $0001,EnemyProjSpritemaps_KihunterAcidSpit_Left_4 
    dw Instruction_EnemyProjectile_PreInstructionInY 
    dw PreInstruction_EnemyProj_KiHunterAcidSpit_Left_StartMoving 
    dw $0001,EnemyProjSpritemaps_KihunterAcidSpit_Left_4 
    dw $0001,EnemyProjSpritemaps_KihunterAcidSpit_Left_5 
    dw Instruction_EnemyProjectile_Sleep 

InstList_EnemyProjectile_KiHunterAcidSpit_HitFloor:
    dw Instruction_EnemyProjectile_ClearPreInstruction 
    dw $000C,EnemyProjSpritemaps_KihunterAcidSpit_0 
    dw $000A,EnemyProjSpritemaps_KihunterAcidSpit_1 
    dw $000A,EnemyProjSpritemaps_KihunterAcidSpit_2 
    dw $0008,EnemyProjSpritemaps_KihunterAcidSpit_3 
    dw $0008,EnemyProjSpritemaps_KihunterAcidSpit_4 
    dw Instruction_EnemyProjectile_Delete 

InstList_EnemyProjectile_KiHunterAcidSpit_Right:
    dw $0003,EnemyProjSpritemaps_KihunterAcidSpit_Right_0 
    dw $0003,EnemyProjSpritemaps_KihunterAcidSpit_Right_1 
    dw $0004,EnemyProjSpritemaps_KihunterAcidSpit_Right_2 
    dw $0003,EnemyProjSpritemaps_KihunterAcidSpit_Right_3 
    dw $0001,EnemyProjSpritemaps_KihunterAcidSpit_Right_4 
    dw Instruction_EnemyProjectile_PreInstructionInY 
    dw PreInstruction_EnemyProj_KiHunterAcidSpit_Right_StartMoving 
    dw $0001,EnemyProjSpritemaps_KihunterAcidSpit_Right_4 
    dw $0001,EnemyProjSpritemaps_KihunterAcidSpit_Right_5 
    dw Instruction_EnemyProjectile_Sleep 

InitAI_EnemyProjectile_KiHunterAcidSpit_Left:
    PHX 
    LDX.W $0E54 
    LDA.W #$FD00 : STA.W $1AB7,Y 
    LDA.W $0F7A,X : SEC : SBC.W #$0016 : STA.W $1A4B,Y 
    BRA InitAI_EnemyProjectile_KiHunterAcidSpit__Common 


InitAI_EnemyProjectile_KiHunterAcidSpit_Right:
    PHX 
    LDX.W $0E54 
    LDA.W #$0300 : STA.W $1AB7,Y 
    LDA.W $0F7A,X : CLC : ADC.W #$0016 : STA.W $1A4B,Y 

InitAI_EnemyProjectile_KiHunterAcidSpit__Common:
    LDA.W #$0000 : STA.W $1ADB,Y 
    LDA.W $0F7E,X : SEC : SBC.W #$0010 : STA.W $1A93,Y 
    LDA.W #$0000 : STA.W $1A6F,Y 
    STA.W $1A27,Y 
    PLX 
    RTS 


PreInstruction_EnemyProj_KiHunterAcidSpit_Left_StartMoving:
    LDA.W #PreInstruction_EnemyProj_KiHunterAcidSpit_Moving : STA.W $1A03,X 
    LDA.W $1A4B,X : SEC : SBC.W #$0013 : STA.W $1A4B,X 
    RTS 


PreInstruction_EnemyProj_KiHunterAcidSpit_Right_StartMoving:
    LDA.W #PreInstruction_EnemyProj_KiHunterAcidSpit_Moving : STA.W $1A03,X 
    LDA.W $1A4B,X : CLC : ADC.W #$0013 : STA.W $1A4B,X 
    RTS 


RTS_86CFF7:
    RTS 


PreInstruction_EnemyProj_KiHunterAcidSpit_Moving:
    REP #$30 
    JSR.W Move_EnemyProjectile_Vertically 
    BCS .hitFloor 
    JSR.W Move_EnemyProjectile_Horizontally 
    BCS .hitWall 
    LDA.W $1ADB,X : CLC : ADC.W #$0010 : STA.W $1ADB,X 
    CMP.W #$0200 : BMI + 
    LDA.W #$0200 

  + STA.W $1ADB,X 
    RTS 


.hitFloor:
    LDA.W #InstList_EnemyProjectile_KiHunterAcidSpit_HitFloor : STA.W $1B47,X 
    LDA.W #$0001 : STA.W $1B8F,X 
    RTS 


.hitWall:
    LDA.W #$0000 : STA.W $1AB7,X 
    RTS 


EnemyProjectile_KagoBug:
    dw InitAI_EnemyProjectile_KagoBug ; Initialisation AI
    dw RTS_86D0EB ; Initial pre-instruction
    dw InstList_EnemyProjectile_KraidRocks_KagoBug ; Initial instruction list
    db $04,$04 ; X,Y radius
    dw $0014,$0000 ; Properties, Hit instruction list
    dw InstList_EnemyProjectile_Shot_KagoBug ; Shot instruction list

InstList_EnemyProjectile_KagoBug_HitFloor:
    dw $0005,EnemyProjSpritemaps_KagoBugs_2 
    dw Instruction_EnemyProjectile_KagoBug_StartIdling 
    dw $7FFF,EnemyProjSpritemaps_KagoBugs_1 
    dw Instruction_EnemyProjectile_GotoY 
    dw InstList_EnemyProjectile_KagoBug_HitFloor 

InstList_EnemyProjectile_KagoBug_Falling:
    dw $7FFF,EnemyProjSpritemaps_KagoBugs_1 
    dw Instruction_EnemyProjectile_GotoY 
    dw InstList_EnemyProjectile_KagoBug_Falling 

InstList_EnemyProjectile_KagoBug_Jump_0:
    dw $0010,EnemyProjSpritemaps_KagoBugs_2 
    dw $0005,EnemyProjSpritemaps_KagoBugs_1 
    dw Instruction_EnemyProjectile_KagoBug_StartJumping 

InstList_EnemyProjectile_KagoBug_Jump_1:
    dw $7FFF,EnemyProjSpritemaps_KagoBugs_0 
    dw Instruction_EnemyProjectile_GotoY 
    dw InstList_EnemyProjectile_KagoBug_Jump_1 

InstList_EnemyProjectile_Shot_KagoBug:
    dw Instruction_EnemyProjectile_UsePalette0_duplicate_again 
    dw $0004,EnemyProjSpritemaps_Common_0 
    dw $0004,EnemyProjSpritemaps_Common_1 
    dw $0004,EnemyProjSpritemaps_Common_2 
    dw $0004,EnemyProjSpritemaps_Common_3 
    dw $0004,EnemyProjSpritemaps_Common_4 
    dw PreInstruction_EnemyProjectile_KagoBug_SpawnDrop 
    dw Instruction_EnemyProjectile_GotoY 
    dw InstList_EnemyProjectile_Delete 

InstList_EnemyProjectile_Delete_duplicate:
    dw Instruction_EnemyProjectile_Delete 

KagoBug_Constants:
  .Yacceleration
    dw $00E0 ; Unit 1/100h px/frame²
  .Xproximity
    dw $0030 ; Kago bug will jump towards kago if it's at least this many pixels away
  .Xvelocity
    dw $0200 ; Unit 1/100h px/frame

InitAI_EnemyProjectile_KagoBug:
    LDA.W $0E54 : STA.W $1B23,Y 
    TAX 
    LDA.W $0F7A,X : STA.W $1A4B,Y 
    LDA.W $0F7E,X : STA.W $1A93,Y 
    LDA.W $05E5 : AND.W #$0007 
    INC A 
    STA.W $1BFB,Y 
    CLC : ADC.W #$0004 : STA.W $1AFF,Y 
    LDA.W #PreInstruction_EnemyProjectile_KagoBug_Idling : STA.W $1A03,Y 
    RTS 


Handle_KagoBug_SoundEffect:
    PHX : PHY 
    LDA.W $1AFF,X : BEQ .return 
    DEC A 
    STA.W $1AFF,X 
    BNE .return 
    LDA.W #$006C : JSL.L QueueSound_Lib2_Max6 

.return:
    PLY : PLX 
    RTS 


PreInstruction_EnemyProjectile_KagoBug_Idling:
    JSR.W Handle_KagoBug_SoundEffect 
    JSR.W Enable_KagoBug_Collision_with_SamusProj_IfFarEnoughFromKago 
    LDA.W $1BFB,X : BEQ .timerExpired 
    DEC.W $1BFB,X 
    RTS 


.timerExpired:
    LDA.W #InstList_EnemyProjectile_KagoBug_Jump_0 : STA.W $1B47,X 
    LDA.W #$0001 : STA.W $1B8F,X 
    LDA.W #RTS_86D0EB : STA.W $1A03,X 

RTS_86D0EB:
    RTS 


PreInstruction_EnemyProjectile_KagoBug_Jumping:
    JSR.W Handle_KagoBug_SoundEffect 
    JSR.W Enable_KagoBug_Collision_with_SamusProj_IfFarEnoughFromKago 
    JSR.W Move_EnemyProjectile_Horizontally 
    BCS .hitWall 
    JSR.W Move_EnemyProjectile_Vertically 
    BCS .hitCeiling 
    LDA.W $1ADB,X : CLC : ADC.W KagoBug_Constants_Yacceleration : STA.W $1ADB,X 
    BPL .falling 
    RTS 


.hitWall:
    LDA.W #$0000 : STA.W $1AB7,X 

.hitCeiling:
    LDA.W #$0100 : STA.W $1ADB,X 

.falling:
    LDA.W #PreInstruction_EnemyProjectile_KagoBug_Falling : STA.W $1A03,X 
    LDA.W #InstList_EnemyProjectile_KagoBug_Falling : STA.W $1B47,X 
    LDA.W #$0001 : STA.W $1B8F,X 
    RTS 


PreInstruction_EnemyProjectile_KagoBug_Falling:
    JSR.W Handle_KagoBug_SoundEffect 
    JSR.W Enable_KagoBug_Collision_with_SamusProj_IfFarEnoughFromKago 
    JSR.W Move_EnemyProjectile_Horizontally 
    BCS .hitWall 
    JSR.W Move_EnemyProjectile_Vertically 
    BCS .hitFloor 
    LDA.W $1ADB,X : ADC.W KagoBug_Constants_Yacceleration : STA.W $1ADB,X 
    RTS 


.hitWall:
    LDA.W #$0000 : STA.W $1AB7,X 
    RTS 


.hitFloor:
    LDA.W #RTS_86D0EB : STA.W $1A03,X 
    LDA.W #InstList_EnemyProjectile_KagoBug_HitFloor : STA.W $1B47,X 
    LDA.W #$0001 : STA.W $1B8F,X 
    RTS 


Instruction_EnemyProjectile_KagoBug_StartJumping:
    JSR.W Handle_KagoBug_SoundEffect 
    JSR.W Enable_KagoBug_Collision_with_SamusProj_IfFarEnoughFromKago 
    LDA.W $05E5 : AND.W #$0300 
    CLC : ADC.W #$0800 : BIT.W #$0100 
    PHP 
    EOR.W #$FFFF 
    INC A 
    STA.W $1ADB,X 
    PHX 
    LDA.W $1B23,X 
    TAX 
    LDA.W $0F7A,X 
    PLX 
    SEC : SBC.W $1A4B,X : PHP 
    BPL + 
    EOR.W #$FFFF 
    INC A 

  + CMP.W KagoBug_Constants_Xproximity : BMI .nearKago 
    PLP 
    BPL .right 
    PLP 
    LDA.W #$0001 
    PHP 
    BRA .directionDetermined 


.right:
    PLP 
    LDA.W #$0000 
    PHP 
    BRA .directionDetermined 


.nearKago:
    PLP 

.directionDetermined:
    LDA.W KagoBug_Constants_Xvelocity 
    PLP 
    BEQ + 
    EOR.W #$FFFF 
    INC A 

  + STA.W $1AB7,X 
    LDA.W #PreInstruction_EnemyProjectile_KagoBug_Jumping : STA.W $1A03,X 
    RTS 


Instruction_EnemyProjectile_KagoBug_StartIdling:
    LDA.W $05E5 : AND.W #$001F 
    INC A 
    STA.W $1BFB,X 
    LDA.W #PreInstruction_EnemyProjectile_KagoBug_Idling : STA.W $1A03,X 
    RTS 


Instruction_EnemyProjectile_UsePalette0_duplicate_again:
    LDA.W #$0000 : STA.W $19BB,X 
    RTS 


PreInstruction_EnemyProjectile_KagoBug_SpawnDrop:
    PHY : PHX 
    LDA.W $1A4B,X : STA.B $12 
    LDA.W $1A93,X : STA.B $14 
    LDA.W #EnemyHeaders_Kago : JSL.L Spawn_Enemy_Drops 
    PLX : PLY 
    RTS 


Enable_KagoBug_Collision_with_SamusProj_IfFarEnoughFromKago:
    PHX : PHY 
    LDA.W $1B23,X 
    TAY 
    LDA.W $0F7A,Y : SEC : SBC.W $1A4B,X : BPL .enable 
    EOR.W #$FFFF 
    INC A 

.enable:
    CMP.W #$0017 : BMI .return 
    LDA.W $1BD7,X : ORA.W #$8000 : STA.W $1BD7,X 

.return:
    PLY : PLX 
    RTS 


InstList_EnemyProjectile_PowampSpike:
    dw $0006,EnemyProjSpritemaps_PowampSpikes_0 
    dw $0006,EnemyProjSpritemaps_PowampSpikes_1 
    dw $0006,EnemyProjSpritemaps_PowampSpikes_2 
    dw Instruction_EnemyProjectile_GotoY 
    dw InstList_EnemyProjectile_PowampSpike 

InstList_EnemyProjectile_PowampSpike_Delete:
    dw Instruction_EnemyProjectile_Delete 

;        _____________________________________________ 0: Up
;       |      _______________________________________ 1: Up-right
;       |     |      _________________________________ 2: Right
;       |     |     |      ___________________________ 3: Down-right
;       |     |     |     |      _____________________ 4: Down
;       |     |     |     |     |      _______________ 5: Down-left
;       |     |     |     |     |     |      _________ 6: Left
;       |     |     |     |     |     |     |      ___ 7: Up-left
;       |     |     |     |     |     |     |     |
PowampSpike_VelocityTable_X:
    dw $0000,$0020,$0020,$0020,$0000,$FFE0,$FFE0,$FFE0 
PowampSpike_VelocityTable_Y:
    dw $FFE0,$FFE0,$0000,$0020,$0020,$0020,$0000,$FFE0 

InitAI_EnemyProjectile_PowampSpike:
    PHP 
    REP #$30 
    LDA.W #$0000 : STA.W $1A27,Y 
    STA.W $1A6F,Y 
    STA.W $1AB7,Y 
    STA.W $1ADB,Y 
    LDX.W $0E54 
    LDA.W $0F7A,X : STA.W $1A4B,Y 
    LDA.W $0F7E,X : STA.W $1A93,Y 
    LDA.W $1993 : STA.W $1AFF,Y 
    PLP 
    RTS 


PreInstruction_EnemyProjectile_PowampSpike:
    LDA.W $1AFF,X 
    ASL A 
    TAY 
    LDA.W $1AB7,X : CLC : ADC.W PowampSpike_VelocityTable_X,Y : STA.W $1AB7,X 
    JSR.W Move_EnemyProjectile_Horizontally 
    BCS .collision 
    LDA.W $1AFF,X 
    ASL A 
    TAY 
    LDA.W $1ADB,X : CLC : ADC.W PowampSpike_VelocityTable_Y,Y : STA.W $1ADB,X 
    JSR.W Move_EnemyProjectile_Vertically 
    BCC .return 

.collision:
    LDA.W #InstList_EnemyProjectile_PowampSpike_Delete : STA.W $1B47,X 
    LDA.W #$0001 : STA.W $1B8F,X 

.return:
    RTS 


EnemyProjectile_Powamp:
    dw InitAI_EnemyProjectile_PowampSpike ; Initialisation AI
    dw PreInstruction_EnemyProjectile_PowampSpike ; Initial pre-instruction
    dw InstList_EnemyProjectile_PowampSpike ; Initial instruction list
    db $04,$04 ; X,Y radius
    dw $0014,$0000 ; Properties, Hit instruction list
    dw InstList_EnemyProjectile_PowampSpike_Delete ; Shot instruction list

EnemyProjectile_RobotLaser_UpLeft:
    dw InitAI_EnemyProjectile_WreckedShipRobotLaser_UpLeft_Right ; Initialisation AI
    dw PreInstruction_EnemyProjectile_WreckedShipRobotLaser ; Initial pre-instruction
    dw InstList_EnemyProjectile_WreckedShipRobotLaser_0 ; Initial instruction list
    db $0C,$0C ; X,Y radius
    dw $0004,$0000 ; Properties, Hit instruction list
    dw InstList_EnemyProjectile_Delete ; Shot instruction list

EnemyProjectile_RobotLaser_Horizontal:
    dw InitAI_EnemyProjectile_WreckedShipRobotLaser_Horizontal ; Initialisation AI
    dw PreInstruction_EnemyProjectile_WreckedShipRobotLaser ; Initial pre-instruction
    dw InstList_EnemyProjectile_WreckedShipRobotLaser_0 ; Initial instruction list
    db $0F,$02 ; X,Y radius
    dw $0014,$0000 ; Properties, Hit instruction list
    dw InstList_EnemyProjectile_Delete ; Shot instruction list

EnemyProjectile_RobotLaser_DownLeft:
    dw InitAI_EnemyProjectile_WreckedShipRobotLaser_DownLeft_Right ; Initialisation AI
    dw PreInstruction_EnemyProjectile_WreckedShipRobotLaser ; Initial pre-instruction
    dw InstList_EnemyProjectile_WreckedShipRobotLaser_0 ; Initial instruction list
    db $0C,$0C ; X,Y radius
    dw $0004,$0000 ; Properties, Hit instruction list
    dw InstList_EnemyProjectile_Delete ; Shot instruction list

EnemyProjectile_RobotLaser_UpRight:
    dw InitAI_EnemyProjectile_WreckedShipRobotLaser_UpLeft_Right ; Initialisation AI
    dw PreInstruction_EnemyProjectile_WreckedShipRobotLaser ; Initial pre-instruction
    dw InstList_EnemyProjectile_WreckedShipRobotLaser_0 ; Initial instruction list
    db $0C,$0C ; X,Y radius
    dw $0004,$0000 ; Properties, Hit instruction list
    dw InstList_EnemyProjectile_Delete ; Shot instruction list

EnemyProjectile_RobotLaser_DownRight:
    dw InitAI_EnemyProjectile_WreckedShipRobotLaser_DownLeft_Right ; Initialisation AI
    dw PreInstruction_EnemyProjectile_WreckedShipRobotLaser ; Initial pre-instruction
    dw InstList_EnemyProjectile_WreckedShipRobotLaser_0 ; Initial instruction list
    db $0C,$0C ; X,Y radius
    dw $0004,$0000 ; Properties, Hit instruction list
    dw InstList_EnemyProjectile_Delete ; Shot instruction list

InstList_EnemyProjectile_WreckedShipRobotLaser_0:
    dw $0004,EnemyProjSpritemaps_WorkRobotLaser_0 
    dw $0004,EnemyProjSpritemaps_WorkRobotLaser_1 
    dw $0004,EnemyProjSpritemaps_WorkRobotLaser_2 

InstList_EnemyProjectile_WreckedShipRobotLaser_1:
    dw $0004,EnemyProjSpritemaps_WorkRobotLaser_3 
    dw $0004,EnemyProjSpritemaps_WorkRobotLaser_4 
    dw $0004,EnemyProjSpritemaps_WorkRobotLaser_5 
    dw $0004,EnemyProjSpritemaps_WorkRobotLaser_4 
    dw Instruction_EnemyProjectile_GotoY 
    dw InstList_EnemyProjectile_WreckedShipRobotLaser_1 

InitAI_EnemyProjectile_WreckedShipRobotLaser_DownLeft_Right:
    PHX 
    LDX.W $0E54 
    LDA.W $0FA8,X 
    PHP 
    STA.W $1AB7,Y 
    BPL .pointlessBranch 
    EOR.W #$FF00 
    CLC : ADC.W #$0100 

.pointlessBranch:
    LDA.W #$0080 : STA.W $1ADB,Y 
    LDA.W #$0000 : STA.W $19BB,Y 
    BRA InitAI_EnemyProjectile_WreckedShipRobotLaser_Common 


InitAI_EnemyProjectile_WreckedShipRobotLaser_Horizontal:
    PHX 
    LDX.W $0E54 
    LDA.W $0FA8,X 
    PHP 
    STA.W $1AB7,Y 
    LDA.W #$0000 : STA.W $1ADB,Y 
    BRA InitAI_EnemyProjectile_WreckedShipRobotLaser_Common 


InitAI_EnemyProjectile_WreckedShipRobotLaser_UpLeft_Right:
    PHX 
    LDX.W $0E54 
    LDA.W $0FA8,X 
    PHP 
    STA.W $1AB7,Y 
    BMI .pointlessBranch 
    EOR.W #$FF00 
    CLC : ADC.W #$0100 

.pointlessBranch:
    LDA.W #$FF80 : STA.W $1ADB,Y 

InitAI_EnemyProjectile_WreckedShipRobotLaser_Common:
    LDA.W $0F7E,X : SEC : SBC.W #$0010 : STA.W $1A93,Y 
    LDA.W $0F7A,X 
    PLP 
    BMI .subtract 
    CLC : ADC.W #$0004 : BRA + 


.subtract:
    SEC : SBC.W #$0004 

  + STA.W $1A4B,Y 
    LDA.W #$0000 : STA.W $1A6F,Y 
    STA.W $1A27,Y 
    LDA.W $0F7A,X : CLC : ADC.W $0F82,X : CMP.W $0911 : BMI .return 
    LDA.W $0F7A,X : SEC : SBC.W $0F82,X : SEC : SBC.W #$0101 : CMP.W $0911 : BPL .return 
    LDA.W $0F7E,X : CLC : ADC.W $0F84,X : CMP.W $0915 : BMI .return 
    LDA.W $0F7E,X : SEC : SBC.W $0F84,X : SEC : SBC.W #$00E0 : BPL .return 
    LDA.W #$0067 : JSL.L QueueSound_Lib2_Max6 

.return:
    PLX 
    RTS 


PreInstruction_EnemyProjectile_WreckedShipRobotLaser:
    PHP 
    REP #$20 
    LDA.W #$0000 : STA.W $19BB,X 
    JSR.W Move_EnemyProjectile_Horizontally 
    BCS .collision 
    JSR.W Move_EnemyProjectile_Vertically 
    BCC .return 

.collision:
    STZ.W $1997,X 

.return:
    PLP 
    RTS 


InstList_EnemyProjectile_NoobTubeCrack_0:
    dw $000C,EnemyProjSpritemaps_NoobTubeCrack_0 
    dw $000A,EnemyProjSpritemaps_NoobTubeCrack_1 
    dw $0008,EnemyProjSpritemaps_NoobTubeCrack_2 
    dw $0006,EnemyProjSpritemaps_NoobTubeCrack_3 
    dw $0006,EnemyProjSpritemaps_NoobTubeCrack_4 
    dw $0006,EnemyProjSpritemaps_NoobTubeCrack_5 
    dw Instruction_EnemyProjectile_PreInstructionInY 
    dw PreInstruction_EnemyProjectile_NoobTubeCrack_Flickering 
    dw $0001,EnemyProjSpritemaps_NoobTubeCrack_6 
    dw $0001,EnemyProjSpritemaps_NoobTubeCrack_7 
    dw $0001,EnemyProjSpritemaps_NoobTubeCrack_8 
    dw $0001,EnemyProjSpritemaps_NoobTubeCrack_9 
    dw $0001,EnemyProjSpritemaps_NoobTubeCrack_A 
    dw $0002,EnemyProjSpritemaps_NoobTubeCrack_B 
    dw $0003,EnemyProjSpritemaps_NoobTubeCrack_C 
    dw $0006,EnemyProjSpritemaps_NoobTubeCrack_D 
    dw $0009,EnemyProjSpritemaps_NoobTubeCrack_E 
    dw $0008,EnemyProjSpritemaps_NoobTubeCrack_F 
    dw Instruction_EnemyProjectile_PreInstructionInY 
    dw PreInstruction_EnemyProjectile_NoobTubeCrack_Falling 
    dw $0007,EnemyProjSpritemaps_NoobTubeCrack_10 
    dw $0007,EnemyProjSpritemaps_NoobTubeCrack_11 
    dw $0007,EnemyProjSpritemaps_NoobTubeCrack_12 
    dw $0007,EnemyProjSpritemaps_NoobTubeCrack_13 
    dw $0007,EnemyProjSpritemaps_NoobTubeCrack_14 
    dw $0007,EnemyProjSpritemaps_NoobTubeCrack_15 
    dw $0007,EnemyProjSpritemaps_NoobTubeCrack_16 
    dw $0007,EnemyProjSpritemaps_NoobTubeCrack_17 
    dw $0007,EnemyProjSpritemaps_NoobTubeCrack_18 
    dw $0007,EnemyProjSpritemaps_NoobTubeCrack_19 
    dw $0007,EnemyProjSpritemaps_NoobTubeCrack_1A 
    dw $0007,EnemyProjSpritemaps_NoobTubeCrack_1B 
    dw $0007,EnemyProjSpritemaps_NoobTubeCrack_1C 
    dw $0007,EnemyProjSpritemaps_NoobTubeCrack_1D 
    dw $0007,EnemyProjSpritemaps_NoobTubeCrack_1E 
    dw $0007,EnemyProjSpritemaps_NoobTubeCrack_1F 
    dw $0007,EnemyProjSpritemaps_NoobTubeCrack_20 
    dw $0007,EnemyProjSpritemaps_NoobTubeCrack_21 
    dw $0010,EnemyProjSpritemaps_NoobTubeCrack_22 
    dw Instruction_EnemyProjectile_TimerInY 
    dw $0006 

InstList_EnemyProjectile_NoobTubeCrack_1:
    dw $0010,EnemyProjSpritemaps_NoobTubeCrack_23 
    dw $0010,EnemyProjSpritemaps_NoobTubeCrack_22 
    dw Instruction_EnemyProjectile_DecrementTimer_GotoYIfNonZero 
    dw InstList_EnemyProjectile_NoobTubeCrack_1 
    dw Instruction_EnemyProjectile_Delete 

InstList_EnemyProjectile_NoobTubeShard_Parameter0_0:
    dw Instruction_EnemyProjectile_TimerInY,$0020 

InstList_EnemyProjectile_NoobTubeShard_Parameter0_1:
    dw Instruction_EnemyProj_FlickerNoobTubeShardLeftRightSpritemap 
    dw EnemyProjSpritemaps_NoobTubeShards_0 
    dw EnemyProjSpritemaps_NoobTubeShards_1 
    dw Instruction_EnemyProjectile_DecrementTimer_GotoYIfNonZero 
    dw InstList_EnemyProjectile_NoobTubeShard_Parameter0_1 
    dw Instruction_EnemyProjectile_AssignNoobTubeShardFallingAngle 
    dw Instruction_EnemyProjectile_PreInstructionInY 
    dw Instruction_EnemyProjectile_NoobTubeCrack_Falling 
    dw Instruction_EnemyProjectile_TimerInY,$0110 

InstList_EnemyProjectile_NoobTubeShard_Parameter0_2:
    dw Instruction_EnemyProj_FlickerNoobTubeShardLeftRightSpritemap 
    dw EnemyProjSpritemaps_NoobTubeShards_0 
    dw EnemyProjSpritemaps_NoobTubeShards_1 
    dw Instruction_EnemyProjectile_DecrementTimer_GotoYIfNonZero 
    dw InstList_EnemyProjectile_NoobTubeShard_Parameter0_2 
    dw Instruction_EnemyProjectile_Delete 

InstList_EnemyProjectile_NoobTubeShard_Parameter2_0:
    dw Instruction_EnemyProjectile_TimerInY,$0020 

InstList_EnemyProjectile_NoobTubeShard_Parameter2_1:
    dw Instruction_EnemyProj_FlickerNoobTubeShardLeftRightSpritemap 
    dw EnemyProjSpritemaps_NoobTubeShards_2 
    dw EnemyProjSpritemaps_NoobTubeShards_3 
    dw Instruction_EnemyProjectile_DecrementTimer_GotoYIfNonZero 
    dw InstList_EnemyProjectile_NoobTubeShard_Parameter2_1 
    dw Instruction_EnemyProjectile_AssignNoobTubeShardFallingAngle 
    dw Instruction_EnemyProjectile_PreInstructionInY 
    dw Instruction_EnemyProjectile_NoobTubeCrack_Falling 
    dw Instruction_EnemyProjectile_TimerInY,$0110 

InstList_EnemyProjectile_NoobTubeShard_Parameter2_2:
    dw Instruction_EnemyProj_FlickerNoobTubeShardLeftRightSpritemap 
    dw EnemyProjSpritemaps_NoobTubeShards_2 
    dw EnemyProjSpritemaps_NoobTubeShards_3 
    dw Instruction_EnemyProjectile_DecrementTimer_GotoYIfNonZero 
    dw InstList_EnemyProjectile_NoobTubeShard_Parameter2_2 
    dw Instruction_EnemyProjectile_Delete 

InstList_EnemyProjectile_NoobTubeShard_Parameter4_0:
    dw Instruction_EnemyProjectile_TimerInY,$0020 

InstList_EnemyProjectile_NoobTubeShard_Parameter4_1:
    dw Instruction_EnemyProj_FlickerNoobTubeShardLeftRightSpritemap 
    dw EnemyProjSpritemaps_NoobTubeShards_4 
    dw EnemyProjSpritemaps_NoobTubeShards_5 
    dw Instruction_EnemyProjectile_DecrementTimer_GotoYIfNonZero 
    dw InstList_EnemyProjectile_NoobTubeShard_Parameter4_1 
    dw Instruction_EnemyProjectile_AssignNoobTubeShardFallingAngle 
    dw Instruction_EnemyProjectile_PreInstructionInY 
    dw Instruction_EnemyProjectile_NoobTubeCrack_Falling 
    dw Instruction_EnemyProjectile_TimerInY,$0110 

InstList_EnemyProjectile_NoobTubeShard_Parameter4_2:
    dw Instruction_EnemyProj_FlickerNoobTubeShardLeftRightSpritemap 
    dw EnemyProjSpritemaps_NoobTubeShards_4 
    dw EnemyProjSpritemaps_NoobTubeShards_5 
    dw Instruction_EnemyProjectile_DecrementTimer_GotoYIfNonZero 
    dw InstList_EnemyProjectile_NoobTubeShard_Parameter4_2 
    dw Instruction_EnemyProjectile_Delete 

InstList_EnemyProjectile_NoobTubeShard_Parameter6_0:
    dw Instruction_EnemyProjectile_TimerInY,$0020 

InstList_EnemyProjectile_NoobTubeShard_Parameter6_1:
    dw Instruction_EnemyProj_FlickerNoobTubeShardLeftRightSpritemap 
    dw EnemyProjSpritemaps_NoobTubeShards_6 
    dw EnemyProjSpritemaps_NoobTubeShards_7 
    dw Instruction_EnemyProjectile_DecrementTimer_GotoYIfNonZero 
    dw InstList_EnemyProjectile_NoobTubeShard_Parameter6_1 
    dw Instruction_EnemyProjectile_AssignNoobTubeShardFallingAngle 
    dw Instruction_EnemyProjectile_PreInstructionInY 
    dw Instruction_EnemyProjectile_NoobTubeCrack_Falling 
    dw Instruction_EnemyProjectile_TimerInY,$0110 

InstList_EnemyProjectile_NoobTubeShard_Parameter6_2:
    dw Instruction_EnemyProj_FlickerNoobTubeShardLeftRightSpritemap 
    dw EnemyProjSpritemaps_NoobTubeShards_6 
    dw EnemyProjSpritemaps_NoobTubeShards_7 
    dw Instruction_EnemyProjectile_DecrementTimer_GotoYIfNonZero 
    dw InstList_EnemyProjectile_NoobTubeShard_Parameter6_2 
    dw Instruction_EnemyProjectile_Delete 

InstList_EnemyProjectile_NoobTubeShard_Parameter8_0:
    dw Instruction_EnemyProjectile_TimerInY,$0020 

InstList_EnemyProjectile_NoobTubeShard_Parameter8_1:
    dw Instruction_EnemyProj_FlickerNoobTubeShardLeftRightSpritemap 
    dw EnemyProjSpritemaps_NoobTubeShards_8 
    dw EnemyProjSpritemaps_NoobTubeShards_9 
    dw Instruction_EnemyProjectile_DecrementTimer_GotoYIfNonZero 
    dw InstList_EnemyProjectile_NoobTubeShard_Parameter8_1 
    dw Instruction_EnemyProjectile_AssignNoobTubeShardFallingAngle 
    dw Instruction_EnemyProjectile_PreInstructionInY 
    dw Instruction_EnemyProjectile_NoobTubeCrack_Falling 
    dw Instruction_EnemyProjectile_TimerInY,$0110 

InstList_EnemyProjectile_NoobTubeShard_Parameter8_2:
    dw Instruction_EnemyProj_FlickerNoobTubeShardLeftRightSpritemap 
    dw EnemyProjSpritemaps_NoobTubeShards_8 
    dw EnemyProjSpritemaps_NoobTubeShards_9 
    dw Instruction_EnemyProjectile_DecrementTimer_GotoYIfNonZero 
    dw InstList_EnemyProjectile_NoobTubeShard_Parameter8_2 
    dw Instruction_EnemyProjectile_Delete 

InstList_EnemyProjectile_NoobTubeShard_ParameterA_0:
    dw Instruction_EnemyProjectile_TimerInY,$0020 

InstList_EnemyProjectile_NoobTubeShard_ParameterA_1:
    dw Instruction_EnemyProj_FlickerNoobTubeShardLeftRightSpritemap 
    dw EnemyProjSpritemaps_NoobTubeShards_A 
    dw EnemyProjSpritemaps_NoobTubeShards_B 
    dw Instruction_EnemyProjectile_DecrementTimer_GotoYIfNonZero 
    dw InstList_EnemyProjectile_NoobTubeShard_ParameterA_1 
    dw Instruction_EnemyProjectile_AssignNoobTubeShardFallingAngle 
    dw Instruction_EnemyProjectile_PreInstructionInY 
    dw Instruction_EnemyProjectile_NoobTubeCrack_Falling 
    dw Instruction_EnemyProjectile_TimerInY,$0110 

InstList_EnemyProjectile_NoobTubeShard_ParameterA_2:
    dw Instruction_EnemyProj_FlickerNoobTubeShardLeftRightSpritemap 
    dw EnemyProjSpritemaps_NoobTubeShards_A 
    dw EnemyProjSpritemaps_NoobTubeShards_B 
    dw Instruction_EnemyProjectile_DecrementTimer_GotoYIfNonZero 
    dw InstList_EnemyProjectile_NoobTubeShard_ParameterA_2 
    dw Instruction_EnemyProjectile_Delete 

InstList_EnemyProjectile_NoobTubeShard_ParameterC_0:
    dw Instruction_EnemyProjectile_TimerInY,$0020 

InstList_EnemyProjectile_NoobTubeShard_ParameterC_1:
    dw Instruction_EnemyProj_FlickerNoobTubeShardLeftRightSpritemap 
    dw EnemyProjSpritemaps_NoobTubeShards_C 
    dw EnemyProjSpritemaps_NoobTubeShards_D 
    dw Instruction_EnemyProjectile_DecrementTimer_GotoYIfNonZero 
    dw InstList_EnemyProjectile_NoobTubeShard_ParameterC_1 
    dw Instruction_EnemyProjectile_AssignNoobTubeShardFallingAngle 
    dw Instruction_EnemyProjectile_PreInstructionInY 
    dw Instruction_EnemyProjectile_NoobTubeCrack_Falling 
    dw Instruction_EnemyProjectile_TimerInY,$0110 

InstList_EnemyProjectile_NoobTubeShard_ParameterC_2:
    dw Instruction_EnemyProj_FlickerNoobTubeShardLeftRightSpritemap 
    dw EnemyProjSpritemaps_NoobTubeShards_C 
    dw EnemyProjSpritemaps_NoobTubeShards_D 
    dw Instruction_EnemyProjectile_DecrementTimer_GotoYIfNonZero 
    dw InstList_EnemyProjectile_NoobTubeShard_ParameterC_2 
    dw Instruction_EnemyProjectile_Delete 

InstList_EnemyProjectile_NoobTubeShard_ParameterE_0:
    dw Instruction_EnemyProjectile_TimerInY,$0020 

InstList_EnemyProjectile_NoobTubeShard_ParameterE_1:
    dw Instruction_EnemyProj_FlickerNoobTubeShardLeftRightSpritemap 
    dw EnemyProjSpritemaps_NoobTubeShards_E 
    dw EnemyProjSpritemaps_NoobTubeShards_F 
    dw Instruction_EnemyProjectile_DecrementTimer_GotoYIfNonZero 
    dw InstList_EnemyProjectile_NoobTubeShard_ParameterE_1 
    dw Instruction_EnemyProjectile_AssignNoobTubeShardFallingAngle 
    dw Instruction_EnemyProjectile_PreInstructionInY 
    dw Instruction_EnemyProjectile_NoobTubeCrack_Falling 
    dw Instruction_EnemyProjectile_TimerInY,$0110 

InstList_EnemyProjectile_NoobTubeShard_ParameterE_2:
    dw Instruction_EnemyProj_FlickerNoobTubeShardLeftRightSpritemap 
    dw EnemyProjSpritemaps_NoobTubeShards_E 
    dw EnemyProjSpritemaps_NoobTubeShards_F 
    dw Instruction_EnemyProjectile_DecrementTimer_GotoYIfNonZero 
    dw InstList_EnemyProjectile_NoobTubeShard_ParameterE_2 
    dw Instruction_EnemyProjectile_Delete 

InstList_EnemyProjectile_NoobTubeShard_Parameter10_0:
    dw Instruction_EnemyProjectile_TimerInY,$0020 

InstList_EnemyProjectile_NoobTubeShard_Parameter10_1:
    dw Instruction_EnemyProjectile_NoobTubeShard_FlickerSpritemap 
    dw EnemyProjSpritemaps_NoobTubeShards_10 
    dw Instruction_EnemyProjectile_DecrementTimer_GotoYIfNonZero 
    dw InstList_EnemyProjectile_NoobTubeShard_Parameter10_1 
    dw Instruction_EnemyProjectile_AssignNoobTubeShardFallingAngle 
    dw Instruction_EnemyProjectile_PreInstructionInY 
    dw Instruction_EnemyProjectile_NoobTubeCrack_Falling 
    dw Instruction_EnemyProjectile_TimerInY,$0110 

InstList_EnemyProjectile_NoobTubeShard_Parameter10_2:
    dw Instruction_EnemyProjectile_NoobTubeShard_FlickerSpritemap 
    dw EnemyProjSpritemaps_NoobTubeShards_10 
    dw Instruction_EnemyProjectile_DecrementTimer_GotoYIfNonZero 
    dw InstList_EnemyProjectile_NoobTubeShard_Parameter10_2 
    dw Instruction_EnemyProjectile_Delete 

InstList_EnemyProjectile_NoobTubeShard_Parameter12_0:
    dw Instruction_EnemyProjectile_TimerInY,$0020 

InstList_EnemyProjectile_NoobTubeShard_Parameter12_1:
    dw Instruction_EnemyProj_FlickerNoobTubeShardLeftRightSpritemap 
    dw EnemyProjSpritemaps_NoobTubeShards_11 
    dw EnemyProjSpritemaps_NoobTubeShards_12 
    dw Instruction_EnemyProjectile_DecrementTimer_GotoYIfNonZero 
    dw InstList_EnemyProjectile_NoobTubeShard_Parameter12_1 
    dw Instruction_EnemyProjectile_AssignNoobTubeShardFallingAngle 
    dw Instruction_EnemyProjectile_PreInstructionInY 
    dw Instruction_EnemyProjectile_NoobTubeCrack_Falling 
    dw Instruction_EnemyProjectile_TimerInY,$0110 

InstList_EnemyProjectile_NoobTubeShard_Parameter12_2:
    dw Instruction_EnemyProj_FlickerNoobTubeShardLeftRightSpritemap 
    dw EnemyProjSpritemaps_NoobTubeShards_11 
    dw EnemyProjSpritemaps_NoobTubeShards_12 
    dw Instruction_EnemyProjectile_DecrementTimer_GotoYIfNonZero 
    dw InstList_EnemyProjectile_NoobTubeShard_Parameter12_2 
    dw Instruction_EnemyProjectile_Delete 

Instruction_EnemyProjectile_AssignNoobTubeShardFallingAngle:
    JSL.L GenerateRandomNumber 
    LDA.W $05E6 : STA.W $1AB7,X 
    LDA.W #$00C0 : STA.W $1ADB,X 
    RTS 


Instruction_EnemyProj_FlickerNoobTubeShardLeftRightSpritemap:
    LDA.W $05B6 
    LSR A 
    BCC .right 
    LDA.W $1B23,X : STA.W $1A4B,X 
    LDA.W $0000,Y : STA.W $1B6B,X 
    BRA .merge 


.right:
    LDA.W #$0080 : SEC : SBC.W $1B23,X : CLC : ADC.W #$0080 : STA.W $1A4B,X 
    LDA.W $0002,Y : STA.W $1B6B,X 

.merge:
    INY #4
    TYA 
    STA.W $1B47,X 
    LDA.W #$0001 : STA.W $1B8F,X 
    PLA 
    RTS 


Instruction_EnemyProjectile_NoobTubeShard_FlickerSpritemap:
    LDA.W $05B6 
    LSR A 
    BCC .zero 
    LDA.W $1B23,X : STA.W $1A4B,X 
    BRA + 


.zero:
    LDA.W #$EE00 : STA.W $1A4B,X 

  + LDA.W $0000,Y : STA.W $1B6B,X 
    INY #2
    TYA 
    STA.W $1B47,X 
    LDA.W #$0001 : STA.W $1B8F,X 
    PLA 
    RTS 


InstList_EnemyProjectile_NoobTubeReleasedAirBubbles:
    dw Instruction_EnemyProjectile_PreInstructionInY 
    dw PreInstruction_EnemyProj_NoobTubeReleasedAirBubbles_Flying 
    dw $0002,EnemyProjSpritemaps_NoobTubeReleasedAirBubbles_0 
    dw $0002,EnemyProjSpritemaps_NoobTubeReleasedAirBubbles_1 
    dw $0002,EnemyProjSpritemaps_NoobTubeReleasedAirBubbles_2 
    dw $0002,EnemyProjSpritemaps_NoobTubeReleasedAirBubbles_3 
    dw Inststruction_EnemyProjectile_NoobTubeReleasedAirBubbles 
    dw Instruction_EnemyProjectile_PreInstructionInY 
    dw PreInstruction_EnemyProj_NoobTubeReleasedAirBubbles_Falling 
    dw $0002,EnemyProjSpritemaps_NoobTubeReleasedAirBubbles_3 
    dw $0002,EnemyProjSpritemaps_NoobTubeReleasedAirBubbles_4 
    dw $0002,EnemyProjSpritemaps_NoobTubeReleasedAirBubbles_5 
    dw $0002,EnemyProjSpritemaps_NoobTubeReleasedAirBubbles_6 
    dw $0002,EnemyProjSpritemaps_NoobTubeReleasedAirBubbles_7 
    dw $0002,EnemyProjSpritemaps_NoobTubeReleasedAirBubbles_8 
    dw $0004,EnemyProjSpritemaps_NoobTubeReleasedAirBubbles_9 
    dw $0004,EnemyProjSpritemaps_NoobTubeReleasedAirBubbles_A 
    dw $0004,EnemyProjSpritemaps_NoobTubeReleasedAirBubbles_B 
    dw $0004,EnemyProjSpritemaps_NoobTubeReleasedAirBubbles_C 
    dw $0004,EnemyProjSpritemaps_NoobTubeReleasedAirBubbles_D 
    dw Instruction_EnemyProjectile_Delete 

Inststruction_EnemyProjectile_NoobTubeReleasedAirBubbles:
    JSL.L GenerateRandomNumber 
    LDA.W $05E6 : STA.W $1AB7,X 
    RTS 


Instruction_EnemyProjectile_NoobTubeCrack:
    LDX.W $1C27 
    JSL.L Calculate_PLM_Block_Coordinates 
    LDA.W $1C29 
    ASL #4
    CLC : ADC.W #$0060 : STA.W $1A4B,Y 
    LDA.W $1C2B 
    ASL #4
    CLC : ADC.W #$0030 : STA.W $1A93,Y 
    RTS 


InitAI_EnemyProjectile_NoobTubeShard:
    LDX.W $1C27 
    JSL.L Calculate_PLM_Block_Coordinates 
    LDX.W $1993 
    LDA.W $1C29 
    ASL #4
    CLC : ADC.W #$0060 : CLC : ADC.W .Xoffset,X : STA.W $1B23,Y 
    LDA.W #$0000 : STA.W $1AFF,Y 
    LDA.W $1C2B 
    ASL #4
    CLC : ADC.W #$0030 : CLC : ADC.W .Yoffsets,X : STA.W $1A93,Y 
    LDA.W .InstListPointer,X : STA.W $1B47,Y 
    LDA.W .Xvelocity,X : STA.W $1AB7,Y 
    LDA.W .Yvelocity,X : STA.W $1ADB,Y 
    RTS 


.Xoffset:
    dw $FFC8,$FFC0,$FFEC,$FFD8,$FFC0,$FFD0,$FFE8,$FFD8 
    dw $0000,$FFF8 
.Yoffsets:
    dw $0008,$FFF4,$FFE6,$FFE8,$FFE0,$001C,$0010,$FFF8 
    dw $FFE8,$0010 
.Xvelocity:
    dw $FE80,$FE80,$FF60,$FEE0,$FEE0,$FEC0,$FFA0,$FEA0 ; Unit 1/100h px/frame
    dw $0000,$FFC0 
.Yvelocity:
    dw $0140,$FF00,$FE60,$FEE0,$FEE0,$01C0,$0240,$FFA0 ; Unit 1/100h px/frame
    dw $FEE0,$0180 
.InstListPointer:
    dw InstList_EnemyProjectile_NoobTubeShard_Parameter0_0 
    dw InstList_EnemyProjectile_NoobTubeShard_Parameter2_0 
    dw InstList_EnemyProjectile_NoobTubeShard_Parameter4_0 
    dw InstList_EnemyProjectile_NoobTubeShard_Parameter6_0 
    dw InstList_EnemyProjectile_NoobTubeShard_Parameter8_0 
    dw InstList_EnemyProjectile_NoobTubeShard_ParameterA_0 
    dw InstList_EnemyProjectile_NoobTubeShard_ParameterC_0 
    dw InstList_EnemyProjectile_NoobTubeShard_ParameterE_0 
    dw InstList_EnemyProjectile_NoobTubeShard_Parameter10_0 
    dw InstList_EnemyProjectile_NoobTubeShard_Parameter12_0 

InitAI_EnemyProjectile_NoobTubeReleasedAirBubbles:
    LDX.W $1C27 
    JSL.L Calculate_PLM_Block_Coordinates 
    LDX.W $1993 
    LDA.W $1C29 
    ASL #4
    CLC : ADC.W .Xoffset,X : STA.W $1B23,Y 
    LDA.W #$0000 : STA.W $1AFF,Y 
    LDA.W $1C2B 
    ASL #4
    CLC : ADC.W .Yoffset,X : STA.W $1A93,Y 
    LDA.W #$FB00 : STA.W $1ADB,Y 
    RTS 

.Xoffset:
    dw $0028,$0050,$0068,$0078,$0098,$00B8 
.Yoffset:
    dw $0050,$0048,$0054,$0020,$0040,$0054 


PreInstruction_EnemyProjectile_NoobTubeCrack_Flickering:
    LDA.W $1A4B,X : CMP.W #$EE00 : BEQ + 
    STA.W $1AFF,X 

  + LDA.W $05B6 
    LSR A 
    BCC + 
    LDA.W #$EE00 : STA.W $1A4B,X 
    RTS 


  + LDA.W $1AFF,X : STA.W $1A4B,X 
    RTS 


PreInstruction_EnemyProjectile_NoobTubeCrack_Falling:
    STZ.B $12 
    STZ.B $14 
    LDA.W #$00C0 : BPL + 
    DEC.B $14 

  + STA.B $13 
    LDA.W $1A6F,X : CLC : ADC.B $12 : STA.W $1A6F,X 
    LDA.W $1A93,X : ADC.B $14 : STA.W $1A93,X 
    RTS 


PreInstruction_EnemyProjectile_NoobTubeShard_Flying:
    STZ.B $12 
    STZ.B $14 
    LDA.W $1AB7,X : BPL + 
    DEC.B $14 

  + STA.B $13 
    LDA.W $1AFF,X : CLC : ADC.B $12 : STA.W $1AFF,X 
    LDA.W $1B23,X : ADC.B $14 : STA.W $1B23,X 
    STZ.B $12 
    STZ.B $14 
    LDA.W $1ADB,X : BPL + 
    DEC.B $14 

  + STA.B $13 
    LDA.W $1A6F,X : CLC : ADC.B $12 : STA.W $1A6F,X 
    LDA.W $1A93,X : ADC.B $14 : STA.W $1A93,X 
    JSR.W Delete_EnemyProjectile_IfVerticallyOffScreen 
    RTS 


Instruction_EnemyProjectile_NoobTubeCrack_Falling:
    LDA.W $1AB7,X : AND.W #$01FE 
    ORA.W #$0080 ; >_<
    TAX 
    STZ.B $12 
    STZ.B $14 
    CLC 
    LDA.L SineCosineTables_8bitSine_SignExtended,X : AND.W #$FFFE 
    BPL + 
    DEC.B $14 
    SEC 
    ORA.W #$0001 

  + ROR A 
    ROR A 
    STA.B $13 
    LDX.W $1991 
    LDA.W $1AFF,X : CLC : ADC.B $12 : STA.W $1AFF,X 
    LDA.W $1B23,X : ADC.B $14 : STA.W $1B23,X 
    LDA.W $1AB7,X : CLC : ADC.W #$0002 : STA.W $1AB7,X 
    STZ.B $12 
    STZ.B $14 
    LDA.W $1ADB,X : BPL + 
    DEC.B $14 

  + STA.B $13 
    LDA.W $1A6F,X : CLC : ADC.B $12 : STA.W $1A6F,X 
    LDA.W $1A93,X : ADC.B $14 : STA.W $1A93,X 
    JSR.W Delete_EnemyProjectile_IfVerticallyOffScreen 
    RTS 


PreInstruction_EnemyProj_NoobTubeReleasedAirBubbles_Falling:
    LDA.W $1AB7,X : AND.W #$01FE 
    ORA.W #$0080 ; >_<
    TAX 
    STZ.B $12 
    STZ.B $14 
    CLC 
    LDA.L SineCosineTables_8bitSine_SignExtended,X : AND.W #$FFFE 
    BPL + 
    DEC.B $14 
    SEC 
    ORA.W #$0001 

  + ROR A 
    ROR A 
    STA.B $13 
    LDX.W $1991 
    LDA.W $1AFF,X : CLC : ADC.B $12 : STA.W $1AFF,X 
    LDA.W $1B23,X : ADC.B $14 : STA.W $1B23,X 
    LDA.W $1AB7,X : CLC : ADC.W #$0004 : STA.W $1AB7,X ; fallthrough to PreInstruction_EnemyProj_NoobTubeReleasedAirBubbles_Flying

PreInstruction_EnemyProj_NoobTubeReleasedAirBubbles_Flying:
    STZ.B $12 
    STZ.B $14 
    LDA.W $1ADB,X : BPL + 
    DEC.B $14 

  + STA.B $13 
    LDA.W $1A6F,X : CLC : ADC.B $12 : STA.W $1A6F,X 
    LDA.W $1A93,X : ADC.B $14 : STA.W $1A93,X 
    LDA.W $1B23,X : STA.W $1A4B,X 
    RTS 


EnemyProjectile_NoobTubeCrack:
    dw Instruction_EnemyProjectile_NoobTubeCrack ; Initialisation AI
    dw RTS_8684FB ; Initial pre-instruction
    dw InstList_EnemyProjectile_NoobTubeCrack_0 ; Initial instruction list
    db $00,$00 ; X,Y radius
    dw $3000,$0000 ; Properties, Hit instruction list
    dw InstList_EnemyProjectile_Delete ; Shot instruction list

EnemyProjectile_NoobTubeShard:
    dw InitAI_EnemyProjectile_NoobTubeShard ; Initialisation AI
    dw PreInstruction_EnemyProjectile_NoobTubeShard_Flying ; Initial pre-instruction
    dw InstList_EnemyProjectile_NoobTubeShard_Parameter0_0 ; Initial instruction list
    db $00,$00 ; X,Y radius
    dw $3000,$0000 ; Properties, Hit instruction list
    dw InstList_EnemyProjectile_Delete ; Shot instruction list

EnemyProjectile_NoobTubeAirBubbles:
    dw InitAI_EnemyProjectile_NoobTubeReleasedAirBubbles ; Initialisation AI
    dw RTS_8684FB ; Initial pre-instruction
    dw InstList_EnemyProjectile_NoobTubeReleasedAirBubbles ; Initial instruction list
    db $00,$00 ; X,Y radius
    dw $3000,$0000 ; Properties, Hit instruction list
    dw InstList_EnemyProjectile_Delete ; Shot instruction list

InstList_EnemyProjectile_CacatacSpike_Left_FacingUp:
    dw $0001,EnemyProjSpritemaps_CacatacSpikes_0 
    dw Instruction_EnemyProjectile_Sleep 

InstList_EnemyProjectile_CacatacSpike_UpLeft:
    dw $0001,EnemyProjSpritemaps_CacatacSpikes_1 
    dw Instruction_EnemyProjectile_Sleep 

InstList_EnemyProjectile_CacatacSpike_Up:
    dw $0001,EnemyProjSpritemaps_CacatacSpikes_2 
    dw Instruction_EnemyProjectile_Sleep 

InstList_EnemyProjectile_CacatacSpike_UpRight:
    dw $0001,EnemyProjSpritemaps_CacatacSpikes_3 
    dw Instruction_EnemyProjectile_Sleep 

InstList_EnemyProjectile_CacatacSpike_Right_FacingUp:
    dw $0001,EnemyProjSpritemaps_CacatacSpikes_4 
    dw Instruction_EnemyProjectile_Sleep 

InstList_EnemyProjectile_CacatacSpike_Left_FacingDown:
    dw $0001,EnemyProjSpritemaps_CacatacSpikes_5 
    dw Instruction_EnemyProjectile_Sleep 

InstList_EnemyProjectile_CacatacSpike_DownLeft:
    dw $0001,EnemyProjSpritemaps_CacatacSpikes_6 
    dw Instruction_EnemyProjectile_Sleep 

InstList_EnemyProjectile_CacatacSpike_Down:
    dw $0001,EnemyProjSpritemaps_CacatacSpikes_7 
    dw Instruction_EnemyProjectile_Sleep 

InstList_EnemyProjectile_CacatacSpike_DownRight:
    dw $0001,EnemyProjSpritemaps_CacatacSpikes_8 
    dw Instruction_EnemyProjectile_Sleep 

InstList_EnemyProjectile_CacatacSpike_Down_FacingRight:
    dw $0001,EnemyProjSpritemaps_CacatacSpikes_9 
    dw Instruction_EnemyProjectile_Sleep 

CacatacSpike_InstListPointers:
    dw InstList_EnemyProjectile_CacatacSpike_Left_FacingUp 
    dw InstList_EnemyProjectile_CacatacSpike_Up 
    dw InstList_EnemyProjectile_CacatacSpike_Right_FacingUp 
    dw InstList_EnemyProjectile_CacatacSpike_Left_FacingDown 
    dw InstList_EnemyProjectile_CacatacSpike_Down 
    dw InstList_EnemyProjectile_CacatacSpike_Down_FacingRight 
    dw InstList_EnemyProjectile_CacatacSpike_UpLeft 
    dw InstList_EnemyProjectile_CacatacSpike_UpRight 
    dw InstList_EnemyProjectile_CacatacSpike_DownLeft 
    dw InstList_EnemyProjectile_CacatacSpike_DownRight 

CacatacSpike_FunctionPointers:
    dw MoveCacatacSpike_Left 
    dw MoveCacatacSpike_Up 
    dw MoveCacatacSpike_Right 
    dw MoveCacatacSpike_Left 
    dw MoveCacatacSpike_Down 
    dw MoveCacatacSpike_Right 
    dw MoveCacatacSpike_UpLeft 
    dw MoveCacatacSpike_UpRight 
    dw MoveCacatacSpike_DownLeft 
    dw MoveCacatacSpike_DownRight 

InitAI_EnemyProjectile_CacatacSpike:
    LDA.W $1993 : STA.W $1AFF,Y 
    TAX 
    LDA.W CacatacSpike_InstListPointers,X : STA.W $1B47,Y 
    LDX.W $0E54 
    LDA.W $0F7A,X : STA.W $1A4B,Y 
    LDA.W $0F7C,X : STA.W $1A27,Y 
    LDA.W $0F7E,X : STA.W $1A93,Y 
    LDA.W $0F80,X : STA.W $1A6F,Y 
    LDA.W #$FE00 : STA.W $1ADB,Y 
    LDA.W #$0200 : STA.W $1AB7,Y 
    LDA.W $1993 : CMP.W #$000C : BMI .return 
    LDA.W #$FE80 : STA.W $1ADB,Y 
    LDA.W #$0180 : STA.W $1AB7,Y 

.return:
    RTS 


PreInstruction_EnemyProjectile_CacatacSpike:
    TXY 
    LDX.W $1AFF,Y 
    JSR.W (CacatacSpike_FunctionPointers,X) 
    JSR.W Delete_EnemyProjectile_IfOffScreen_duplicate 
    RTS 


MoveCacatacSpikeUp:
    LDA.W $1ADB,X : AND.W #$FF00 
    XBA 
    JSL.L Sign_Extend_A 
    CLC : ADC.W $1A93,X : STA.W $1A93,X 
    LDA.W $1ADB,X : AND.W #$00FF 
    XBA 
    CLC : ADC.W $1A6F,X : STA.W $1A6F,X 
    BCC .return 
    LDA.W $1A93,X 
    INC A 
    STA.W $1A93,X 

.return:
    RTS 


MoveCacatacSpikeDown:
    LDA.W $1AB7,X : AND.W #$FF00 
    XBA 
    JSL.L Sign_Extend_A 
    CLC : ADC.W $1A93,X : STA.W $1A93,X 
    LDA.W $1AB7,X : AND.W #$00FF 
    XBA 
    CLC : ADC.W $1A6F,X : STA.W $1A6F,X 
    BCC .return 
    LDA.W $1A93,X 
    INC A 
    STA.W $1A93,X 

.return:
    RTS 


MoveCacatacSpikeLeft:
    LDA.W $1ADB,X : AND.W #$FF00 
    XBA 
    JSL.L Sign_Extend_A 
    CLC : ADC.W $1A4B,X : STA.W $1A4B,X 
    LDA.W $1ADB,X : AND.W #$00FF 
    XBA 
    CLC : ADC.W $1A27,X : STA.W $1A27,X 
    BCC .return 
    LDA.W $1A4B,X 
    INC A 
    STA.W $1A4B,X 

.return:
    RTS 


MoveCacatacSpikeRight:
    LDA.W $1AB7,X : AND.W #$FF00 
    XBA 
    JSL.L Sign_Extend_A 
    CLC : ADC.W $1A4B,X : STA.W $1A4B,X 
    LDA.W $1AB7,X : AND.W #$00FF 
    XBA 
    CLC : ADC.W $1A27,X : STA.W $1A27,X 
    BCC .return 
    LDA.W $1A4B,X 
    INC A 
    STA.W $1A4B,X 

.return:
    RTS 


MoveCacatacSpike_Left:
    TYX 
    JSR.W MoveCacatacSpikeLeft 
    RTS 


MoveCacatacSpike_Right:
    TYX 
    JSR.W MoveCacatacSpikeRight 
    RTS 


MoveCacatacSpike_Up:
    TYX 
    JSR.W MoveCacatacSpikeUp 
    RTS 


MoveCacatacSpike_Down:
    TYX 
    JSR.W MoveCacatacSpikeDown 
    RTS 


MoveCacatacSpike_UpLeft:
    TYX 
    JSR.W MoveCacatacSpikeLeft 
    JSR.W MoveCacatacSpikeUp 
    RTS 


MoveCacatacSpike_DownLeft:
    TYX 
    JSR.W MoveCacatacSpikeLeft 
    JSR.W MoveCacatacSpikeDown 
    RTS 


MoveCacatacSpike_UpRight:
    TYX 
    JSR.W MoveCacatacSpikeRight 
    JSR.W MoveCacatacSpikeUp 
    RTS 


MoveCacatacSpike_DownRight:
    TYX 
    JSR.W MoveCacatacSpikeRight 
    JSR.W MoveCacatacSpikeDown 
    RTS 


Delete_EnemyProjectile_IfOffScreen_duplicate:
    JSR.W CheckIf_EnemyProjectile_IsOffScreen_duplicate 
    BEQ .return 
    LDA.W #$0000 : STA.W $1997,X 

.return:
    RTS 


CheckIf_EnemyProjectile_IsOffScreen_duplicate:
    LDA.W $1A4B,X : CMP.W $0911 : BMI .returnOffScreen 
    LDA.W $0911 : CLC : ADC.W #$0100 : CMP.W $1A4B,X : BMI .returnOffScreen 
    LDA.W $1A93,X : CMP.W $0915 : BMI .returnOffScreen 
    LDA.W $0915 : CLC : ADC.W #$0100 : CMP.W $1A93,X : BMI .returnOffScreen 
    LDA.W #$0000 
    RTS 


.returnOffScreen:
    LDA.W #$0001 
    RTS 


EnemyProjectile_Cacatac:
    dw InitAI_EnemyProjectile_CacatacSpike ; Initialisation AI
    dw PreInstruction_EnemyProjectile_CacatacSpike ; Initial pre-instruction
    dw InstList_EnemyProjectile_CacatacSpike_Left_FacingUp ; Initial instruction list
    db $02,$02 ; X,Y radius
    dw $0005,$0000 ; Properties, Hit instruction list
    dw InstList_EnemyProjectile_Delete ; Shot instruction list

UNUSED_InstList_EnemyProjectile_StokeProjectile_86DB0B:
    dw $0010,UNUSED_EnemyProjSpritemaps_StokeProjectile_0_8DA94E 
    dw $0010,UNUSED_EnemyProjSpritemaps_StokeProjectile_1_8DA955 
    dw Instruction_EnemyProjectile_GotoY 
    dw UNUSED_InstList_EnemyProjectile_StokeProjectile_86DB0B 

UNUSED_InitAI_EnemyProjectile_StokeProjectile_86DB18:
    LDX.W $0E54 
    LDA.W #UNUSED_InstList_EnemyProjectile_StokeProjectile_86DB0B : STA.W $1B47,Y 
    LDA.W #UNUSED_EnemyProjectile_StokeProjectile_MoveLeft_86DB62 : STA.W $1AFF,Y 
    LDA.W $1993 : BEQ .move 
    LDA.W #UNUSED_EnemyProjectile_StokeProjectile_MoveRight_86DB8C : STA.W $1AFF,Y 

.move:
    LDA.W $0F7A,X : STA.W $1A4B,Y 
    LDA.W $0F7C,X : STA.W $1A27,Y 
    LDA.W $0F7E,X : CLC : ADC.W #$0002 : STA.W $1A93,Y 
    LDA.W $0F80,X : STA.W $1A6F,Y 
    LDA.W #$FF00 : STA.W $1ADB,Y 
    LDA.W #$0100 : STA.W $1AB7,Y 
    RTS 


UNUSED_PreInstruction_EnemyProjectile_StokeProjectile_86DB5B:
    JSR.W ($1AFF,X) 
    JSR.W UNUSED_Delete_EnemyProjectile_IfOffScreen_86DBB6 
    RTS 


UNUSED_EnemyProjectile_StokeProjectile_MoveLeft_86DB62:
    LDA.W $1ADB,X : AND.W #$FF00 
    XBA 
    JSL.L Sign_Extend_A 
    CLC : ADC.W $1A4B,X : STA.W $1A4B,X 
    LDA.W $1ADB,X : AND.W #$00FF 
    XBA 
    CLC : ADC.W $1A27,X : STA.W $1A27,X 
    BCC .return 
    LDA.W $1A4B,X 
    INC A 
    STA.W $1A4B,X 

.return:
    RTS 


UNUSED_EnemyProjectile_StokeProjectile_MoveRight_86DB8C:
    LDA.W $1AB7,X : AND.W #$FF00 
    XBA 
    JSL.L Sign_Extend_A 
    CLC : ADC.W $1A4B,X : STA.W $1A4B,X 
    LDA.W $1AB7,X : AND.W #$00FF 
    XBA 
    CLC : ADC.W $1A27,X : STA.W $1A27,X 
    BCC .return 
    LDA.W $1A4B,X 
    INC A 
    STA.W $1A4B,X 

.return:
    RTS 


UNUSED_Delete_EnemyProjectile_IfOffScreen_86DBB6:
    JSR.W CheckIf_EnemyProjectile_IsOffScreen_duplicate_again 
    BEQ .return 
    LDA.W #$0000 : STA.W $1997,X 

.return:
    RTS 


CheckIf_EnemyProjectile_IsOffScreen_duplicate_again:
    LDA.W $1A4B,X : CMP.W $0911 : BMI .returnOffScreen 
    LDA.W $0911 : CLC : ADC.W #$0100 : CMP.W $1A4B,X : BMI .returnOffScreen 
    LDA.W $1A93,X : CMP.W $0915 : BMI .returnOffScreen 
    LDA.W $0915 : CLC : ADC.W #$0100 : CMP.W $1A93,X : BMI .returnOffScreen 
    LDA.W #$0000 
    RTS 


.returnOffScreen:
    LDA.W #$0001 
    RTS 


UNUSED_EnemyProjectile_Stoke_86DBF2:
    dw UNUSED_InitAI_EnemyProjectile_StokeProjectile_86DB18 ; Initialisation AI
    dw UNUSED_PreInstruction_EnemyProjectile_StokeProjectile_86DB5B ; Initial pre-instruction
    dw UNUSED_InstList_EnemyProjectile_StokeProjectile_86DB0B ; Initial instruction list
    db $02,$02 ; X,Y radius
    dw $0005,$0000 ; Properties, Hit instruction list
    dw InstList_EnemyProjectile_Delete ; Shot instruction list

InstList_EnemyProjectile_Shot_SporeSpawner:
    dw $0001,EnemyProjSpritemaps_SporeSpawners_0 
    dw Instruction_EnemyProjectile_Sleep 

InstList_EnemyProjectile_SporeSpawner_SpawnSpore:
    dw $0001,EnemyProjSpritemaps_SporeSpawners_0 
    dw $0006,EnemyProjSpritemaps_SporeSpawners_1 
    dw Instruction_EnemyProjectile_SporeSpawner_SpawnSpore 
    dw $0010,EnemyProjSpritemaps_SporeSpawners_2 
    dw $0006,EnemyProjSpritemaps_SporeSpawners_1 
    dw $0001,EnemyProjSpritemaps_SporeSpawners_0 
    dw Instruction_EnemyProjectile_Sleep 

InstList_EnemyProjectile_Spores:
    dw $0005,EnemyProjSpritemaps_Spores_0 
    dw $0005,EnemyProjSpritemaps_Spores_1 
    dw $0005,EnemyProjSpritemaps_Spores_2 
    dw Instruction_EnemyProjectile_GotoY 
    dw InstList_EnemyProjectile_Spores 

InstList_EnemyProjectile_SporeSpawnsStalk:
    dw $0005,EnemyProjSpritemaps_SporeSpawnsStalk 
    dw Instruction_EnemyProjectile_Sleep 

InstList_EnemyProjectile_Shot_Spores:
    dw $0001,EnemyProjSpritemaps_Common_SmallExplosion_0 
    dw Instruction_EnemyProjectile_Spores_SetProperties3000 
    dw $0003,EnemyProjSpritemaps_Common_SmallExplosion_0 
    dw $0006,EnemyProjSpritemaps_Common_SmallExplosion_1 
    dw $0005,EnemyProjSpritemaps_Common_SmallExplosion_2 
    dw Instruction_EnemyProj_EnemyDeathExpl_QueueEnemyKilledSoundFX 
    dw $0005,EnemyProjSpritemaps_Common_SmallExplosion_3 
    dw $0005,EnemyProjSpritemaps_Common_SmallExplosion_4 
    dw $0006,EnemyProjSpritemaps_Common_SmallExplosion_5 
    dw Instruction_EnemyProjectile_Spores_SpawnEnemyDrops 
    dw Instruction_EnemyProjectile_GotoY 
    dw InstList_EnemyProjectile_Delete 

Instruction_EnemyProjectile_Spores_SetProperties3000:
    LDA.W #$3000 : STA.W $1BD7,X 
    RTS 


Instruction_EnemyProjectile_Spores_SpawnEnemyDrops:
    PHX : PHY 
    LDA.W $1A4B,X : STA.B $12 
    LDA.W $1A93,X : STA.B $14 
    LDA.W #EnemyHeaders_SporeSpawnStalk : JSL.L Spawn_Enemy_Drops 
    PLY : PLX 
    RTS 


Instruction_EnemyProjectile_SporeSpawner_SpawnSpore:
    PHX : PHY 
    LDA.W $1A4B,X : STA.B $12 
    LDA.W $1A93,X : STA.B $14 
    LDY.W #EnemyProjectile_SporeSpawnSpores 
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics 
    PLY : PLX 
    RTS 


InitAI_EnemyProjectile_Spores:
    PHX 
    LDA.B $12 : STA.W $1A4B,Y 
    STA.W $1B23,Y 
    LDA.B $14 : STA.W $1A93,Y 
    LDA.W #$0200 : STA.W $19BB,Y 
    PLX 
    RTS 


InitAI_EnemyProjectile_SporeSpawnsStalk:
    LDA.W $1993 
    ASL A 
    TAX 
    LDA.W .data,X : CLC : ADC.W $0F7E : STA.W $1A93,Y 
    LDA.W $0F7A : STA.W $1A4B,Y 
    RTS 


.data:
    dw $FFC0,$FFC8,$FFD0,$FFD8,$FFE0 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_InitAI_EnemyProjectile_SporeSpawnsStalk_86DCC3:
    LDA.W $0F7E : CLC : ADC.W #$FFA0 : STA.W $1A93,Y 
    LDA.W $0F7A : STA.W $1A4B,Y 
    RTS 
endif ; !FEATURE_KEEP_UNREFERENCED


InitAI_EnemyProjectile_SporeSpawner:
    LDA.W $1993 
    ASL A 
    TAX 
    LDA.W .data,X : STA.W $1A4B,Y 
    LDA.W #$0208 : STA.W $1A93,Y 
    RTS 


.data:
    dw $0020,$0060,$00A0,$00E0 

PreInstruction_EnemyProjectile_Spores:
    LDA.W $1AFF,X : AND.W #$00FF 
    TAY 
    LDA.W SporeMovementData,Y : AND.W #$00FF 
    JSL.L Sign_Extend_A 
    STA.B $12 
    LDA.W $1B23,X : BIT.W #$0080 
    BEQ + 
    LDA.B $12 
    EOR.W #$FFFF 
    INC A 
    STA.B $12 

  + LDA.B $12 : CLC : ADC.W $1A4B,X : STA.W $1A4B,X 
    LDA.W SporeMovementData+1,Y : AND.W #$00FF 
    JSL.L Sign_Extend_A 
    STA.B $12 
    CLC : ADC.W $1A93,X : CLC : ADC.B $12 : STA.W $1A93,X 
    CMP.W #$0300 : BMI + 
    STZ.W $1997,X 

  + LDA.W $1AFF,X 
    INC #2
    AND.W #$00FF 
    STA.W $1AFF,X 
    RTS 


RTS_86DD44:
    RTS 


RTS_86DD45:
    RTS 


PreInstruction_EnemyProjectile_SporeSpawner:
    LDA.L $7E9000 : BEQ .enabled 
    RTS 


.enabled:
    LDA.W $1B23,X : BNE .decrementTimer 
    LDA.W #InstList_EnemyProjectile_SporeSpawner_SpawnSpore : STA.W $1B47,X 
    LDA.W #$0001 : STA.W $1B8F,X 
    JSL.L GenerateRandomNumber 
    AND.W #$01FF 
    STA.W $1B23,X 

.decrementTimer:
    DEC.W $1B23,X 
    RTS 


SporeMovementData:
; TODO: This data should 8bit
    dw $0100,$0001,$0100,$0001,$0100,$0001,$0100,$0001 
    dw $0100,$0001,$0001,$0100,$0001,$0100,$0001,$0100 
    dw $0001,$0100,$0001,$0001,$0100,$0001,$0100,$0001 
    dw $0001,$0100,$0001,$0100,$0001,$0001,$0100,$0001 
    dw $0001,$0100,$0001,$0001,$0100,$0001,$0001,$0001 
    dw $0100,$0001,$0001,$0001,$0100,$0001,$0001,$0001 
    dw $0001,$0001,$0001,$0001,$0001,$0001,$0001,$0001 
    dw $0001,$FF00,$0001,$0001,$0001,$0001,$0001,$0001 
    dw $FF00,$0001,$0001,$0000,$01FF,$01FF,$01FF,$00FF 
    dw $0100,$01FF,$01FF,$00FF,$0100,$01FF,$00FF,$0100 
    dw $00FF,$0100,$00FF,$0100,$00FF,$01FF,$01FF,$00FF 
    dw $0100,$00FF,$01FF,$00FF,$0100,$00FF,$01FF,$00FF 
    dw $00FF,$0100,$00FF,$00FF,$0100,$00FF,$00FF,$00FF 
    dw $01FF,$00FF,$00FF,$00FF,$00FF,$00FF,$00FF,$00FF 
    dw $00FF,$00FF,$FF00,$00FF,$00FF,$00FF,$FFFF,$00FF 
    dw $00FF,$00FF,$FF00,$00FF,$00FF,$FFFF,$00FF,$0000 

EnemyProjectile_SporeSpawnStalk:
    dw InitAI_EnemyProjectile_SporeSpawnsStalk ; Initialisation AI
    dw RTS_86DD44 ; Initial pre-instruction
    dw InstList_EnemyProjectile_SporeSpawnsStalk ; Initial instruction list
    db $08,$08 ; X,Y radius
    dw $2000,$0000 ; Properties, Hit instruction list
    dw InstList_EnemyProjectile_SporeSpawnsStalk ; Shot instruction list

EnemyProjectile_SporeSpawnSpores:
    dw InitAI_EnemyProjectile_Spores ; Initialisation AI
    dw PreInstruction_EnemyProjectile_Spores ; Initial pre-instruction
    dw InstList_EnemyProjectile_Spores ; Initial instruction list
    db $02,$02 ; X,Y radius
    dw $8004,$0000 ; Properties, Hit instruction list
    dw InstList_EnemyProjectile_Shot_Spores ; Shot instruction list

EnemyProjectile_SporeSpawnSporeSpawner:
    dw InitAI_EnemyProjectile_SporeSpawner ; Initialisation AI
    dw PreInstruction_EnemyProjectile_SporeSpawner ; Initial pre-instruction
    dw InstList_EnemyProjectile_Shot_SporeSpawner ; Initial instruction list
    db $02,$02 ; X,Y radius
    dw $2000,$0000 ; Properties, Hit instruction list
    dw InstList_EnemyProjectile_Shot_SporeSpawner ; Shot instruction list

InstList_EnemyProjectile_NamiFuneFireball_Left:
    dw $0005,EnemyProjSpritemaps_Namihe_Fune_Fireball_0 
    dw $0005,EnemyProjSpritemaps_Namihe_Fune_Fireball_1 
    dw $0005,EnemyProjSpritemaps_Namihe_Fune_Fireball_2 
    dw Instruction_EnemyProjectile_GotoY 
    dw InstList_EnemyProjectile_NamiFuneFireball_Left 

InstList_EnemyProjectile_NamiFuneFireball_Right:
    dw $0005,EnemyProjSpritemaps_Namihe_Fune_Fireball_3 
    dw $0005,EnemyProjSpritemaps_Namihe_Fune_Fireball_4 
    dw $0005,EnemyProjSpritemaps_Namihe_Fune_Fireball_5 
    dw Instruction_EnemyProjectile_GotoY 
    dw InstList_EnemyProjectile_NamiFuneFireball_Right 

NamiFuneFireball_XVelocityTable:
  .left
    dw $FFC0 
  .right
    dw       $0040, $FF80,$0080, $FF40,$00C0, $FF00,$0100 
    dw $FEC0,$0140, $FE80,$0180, $FE40,$01C0, $FE00,$0200 

InitAI_EnemyProjectile_NamiFuneFireball:
    LDX.W $0E54 
    LDA.W #InstList_EnemyProjectile_NamiFuneFireball_Left : STA.W $1B47,Y 
    LDA.W #Function_EnemyProjectile_NamiFuneFireball_Left : STA.W $1AFF,Y 
    LDA.W $1993 : BEQ .setPosition 
    LDA.W #InstList_EnemyProjectile_NamiFuneFireball_Right : STA.W $1B47,Y 
    LDA.W #Function_EnemyProjectile_NamiFuneFireball_Right : STA.W $1AFF,Y 

.setPosition:
    LDA.W $0F7A,X : STA.W $1A4B,Y 
    LDA.W $0F7C,X : STA.W $1A27,Y 
    LDA.W $0F7E,X : STA.W $1A93,Y 
    LDA.W $0F80,X : STA.W $1A6F,Y 
    LDA.W $0FB4,X : AND.W #$000F 
    BEQ .Fune 
    LDA.W $1A93,Y : CLC : ADC.W #$0004 : STA.W $1A93,Y 

.Fune:
    LDA.W $0FB6,X : AND.W #$00FF 
    ASL #2
    TAX 
    LDA.W NamiFuneFireball_XVelocityTable_left,X : STA.W $1ADB,Y 
    LDA.W NamiFuneFireball_XVelocityTable_right,X : STA.W $1AB7,Y 
    LDX.W $0E54 
    RTS 


PreInstruction_EnemyProjectile_NamiFuneFireball:
    JSR.W ($1AFF,X) 
    JSR.W Delete_EnemyProjectile_ifOffScreen_duplicate_again 
    RTS 


Function_EnemyProjectile_NamiFuneFireball_Left:
    LDA.W $1ADB,X : AND.W #$FF00 
    XBA 
    JSL.L Sign_Extend_A 
    CLC : ADC.W $1A4B,X : STA.W $1A4B,X 
    LDA.W $1ADB,X : AND.W #$00FF 
    XBA 
    CLC : ADC.W $1A27,X : STA.W $1A27,X 
    BCC .return 
    LDA.W $1A4B,X 
    INC A 
    STA.W $1A4B,X 

.return:
    RTS 


Function_EnemyProjectile_NamiFuneFireball_Right:
    LDA.W $1AB7,X : AND.W #$FF00 
    XBA 
    JSL.L Sign_Extend_A 
    CLC : ADC.W $1A4B,X : STA.W $1A4B,X 
    LDA.W $1AB7,X : AND.W #$00FF 
    XBA 
    CLC : ADC.W $1A27,X : STA.W $1A27,X 
    BCC .return 
    LDA.W $1A4B,X 
    INC A 
    STA.W $1A4B,X 

.return:
    RTS 


Delete_EnemyProjectile_ifOffScreen_duplicate_again:
    JSR.W CheckIf_EnemyProjectile_IsOffScreen_duplicate_again 
    BEQ .return 
    LDA.W #$0000 : STA.W $1997,X 

.return:
    RTS 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_CheckIf_EnemyProj_isHorizontallyOffScreen_86DFA0:
    LDA.W $1A4B,X : CMP.W $0911 : BMI .returnOffScreen 
    LDA.W $0911 : CLC : ADC.W #$0100 : CMP.W $1A4B,X : BMI .returnOffScreen 
    LDA.W #$0000 
    RTS 


.returnOffScreen:
    LDA.W #$0001 
    RTS 
endif ; !FEATURE_KEEP_UNREFERENCED


EnemyProjectile_NamiheFireball:
    dw InitAI_EnemyProjectile_NamiFuneFireball ; Initialisation AI
    dw PreInstruction_EnemyProjectile_NamiFuneFireball ; Initial pre-instruction
    dw InstList_EnemyProjectile_NamiFuneFireball_Left ; Initial instruction list
    db $04,$08 ; X,Y radius
    dw $00C8,$0000 ; Properties, Hit instruction list
    dw InstList_EnemyProjectile_Delete ; Shot instruction list

EnemyProjectile_FuneFireball:
    dw InitAI_EnemyProjectile_NamiFuneFireball ; Initialisation AI
    dw PreInstruction_EnemyProjectile_NamiFuneFireball ; Initial pre-instruction
    dw InstList_EnemyProjectile_NamiFuneFireball_Left ; Initial instruction list
    db $04,$08 ; X,Y radius
    dw $003C,$0000 ; Properties, Hit instruction list
    dw InstList_EnemyProjectile_Delete ; Shot instruction list

InstList_EnemyProjectile_MagdolliteFlame_Left:
    dw $0001,EnemyProjSpritemaps_MagdolliteFlame_0 
    dw Instruction_EnemyProjectile_Sleep 

InstList_EnemyProjectile_MagdolliteFlame_Right:
    dw $0001,EnemyProjSpritemaps_MagdolliteFlame_1 
    dw Instruction_EnemyProjectile_Sleep 

InstList_EnemyProjectile_Shot_MagdolliteFlame:
    dw Instruction_EnemyProjectile_MagdolliteFlame_SpawnDrops 
    dw Instruction_EnemyProjectile_GotoY 
    dw InstList_EnemyProjectile_Delete 

Instruction_EnemyProjectile_MagdolliteFlame_SpawnDrops:
    PHY : PHX 
    LDA.W $1A4B,X : STA.B $12 
    LDA.W $1A93,X : STA.B $14 
    LDA.W #EnemyHeaders_Magdollite : JSL.L Spawn_Enemy_Drops 
    PLX : PLY 
    RTS 


InitAI_EnemyProjectile_MagdolliteFlame:
    LDX.W $0E54 
    LDA.W #InstList_EnemyProjectile_MagdolliteFlame_Left : STA.W $1B47,Y 
    LDA.W #Function_EnemyProjectile_MagdolliteFlame_Left : STA.W $1AFF,Y 
    LDA.W $1993 : BEQ .notRight 
    LDA.W #InstList_EnemyProjectile_MagdolliteFlame_Right : STA.W $1B47,Y 
    LDA.W #Function_EnemyProjectile_MagdolliteFlame_Right : STA.W $1AFF,Y 

.notRight:
    LDA.W $0F7A,X : STA.W $1A4B,Y 
    LDA.W $0F7C,X : STA.W $1A27,Y 
    LDA.W $0F7E,X : CLC : ADC.W #$0002 : STA.W $1A93,Y 
    LDA.W $0F80,X : STA.W $1A6F,Y 
    LDA.W #$FD00 : STA.W $1ADB,Y 
    LDA.W #$0300 : STA.W $1AB7,Y 
    RTS 


PreInstruction_EnemyProjectile_MagdolliteFlame:
    JSR.W ($1AFF,X) 
    JSR.W Delete_EnemyProjectile_IfOffScreen_duplicate_again2 
    RTS 


Function_EnemyProjectile_MagdolliteFlame_Left:
    LDA.W $1ADB,X : AND.W #$FF00 
    XBA 
    JSL.L Sign_Extend_A 
    CLC : ADC.W $1A4B,X : STA.W $1A4B,X 
    LDA.W $1ADB,X : AND.W #$00FF 
    XBA 
    CLC : ADC.W $1A27,X : STA.W $1A27,X 
    BCC .return 
    LDA.W $1A4B,X 
    INC A 
    STA.W $1A4B,X 

.return:
    RTS 


Function_EnemyProjectile_MagdolliteFlame_Right:
    LDA.W $1AB7,X : AND.W #$FF00 
    XBA 
    JSL.L Sign_Extend_A 
    CLC : ADC.W $1A4B,X : STA.W $1A4B,X 
    LDA.W $1AB7,X : AND.W #$00FF 
    XBA 
    CLC : ADC.W $1A27,X : STA.W $1A27,X 
    BCC .return 
    LDA.W $1A4B,X 
    INC A 
    STA.W $1A4B,X 

.return:
    RTS 


Delete_EnemyProjectile_IfOffScreen_duplicate_again2:
    JSR.W CheckIf_EnemyProjectile_IsOffScreen_duplicate_again3 
    BEQ .return 
    LDA.W #$0000 : STA.W $1997,X 

.return:
    RTS 


CheckIf_EnemyProjectile_IsOffScreen_duplicate_again3:
    LDA.W $1A4B,X : CMP.W $0911 : BMI .returnOffScreen 
    LDA.W $0911 : CLC : ADC.W #$0100 : CMP.W $1A4B,X : BMI .returnOffScreen 
    LDA.W $1A93,X : CMP.W $0915 : BMI .returnOffScreen 
    LDA.W $0915 : CLC : ADC.W #$0100 : CMP.W $1A93,X : BMI .returnOffScreen 
    LDA.W #$0000 
    RTS 


.returnOffScreen:
    LDA.W #$0001 
    RTS 


EnemyProjectile_Magdollite:
    dw InitAI_EnemyProjectile_MagdolliteFlame ; Initialisation AI
    dw PreInstruction_EnemyProjectile_MagdolliteFlame ; Initial pre-instruction
    dw InstList_EnemyProjectile_MagdolliteFlame_Left ; Initial instruction list
    db $02,$02 ; X,Y radius
    dw $8028,$0000 ; Properties, Hit instruction list
    dw InstList_EnemyProjectile_Shot_MagdolliteFlame ; Shot instruction list

UNUSED_InstList_EnemyProj_MiscDust_0_BeamCharge_86E0EE:
    dw $0003,EnemyProjSpritemaps_DustCloud_Explosion_35 
    dw $0003,EnemyProjSpritemaps_DustCloud_Explosion_36 
    dw $0003,EnemyProjSpritemaps_DustCloud_Explosion_37 
    dw $0003,EnemyProjSpritemaps_DustCloud_Explosion_38 
    dw Instruction_EnemyProjectile_Delete 

InstList_EnemyProj_MiscDust_1_MotherBrainElbowChargeParticle:
    dw $0005,EnemyProjSpritemaps_DrayTurretProj_DustCloud_Explosion_0 
    dw $0004,EnemyProjSpritemaps_DrayTurretProj_DustCloud_Explosion_1 
    dw $0003,EnemyProjSpritemaps_DrayTurretProj_DustCloud_Explosion_2 
    dw $0003,EnemyProjSpritemaps_DrayTurretProj_DustCloud_Explosion_3 
    dw $0003,EnemyProjSpritemaps_DrayTurretProj_DustCloud_Explosion_4 
    dw $0003,EnemyProjSpritemaps_DrayTurretProj_DustCloud_Explosion_5 
    dw Instruction_EnemyProjectile_Delete 

InstList_EnemyProj_MiscDust_2_MotherBrainElbowChargeEnergy:
    dw $0004,EnemyProjSpritemaps_DrayTurretProj_DustCloud_Explosion_6 
    dw $0003,EnemyProjSpritemaps_DrayTurretProj_DustCloud_Explosion_7 
    dw $0002,EnemyProjSpritemaps_DrayTurretProj_DustCloud_Explosion_8 
    dw $0002,EnemyProjSpritemaps_DrayTurretProj_DustCloud_Explosion_9 
    dw $0002,EnemyProjSpritemaps_DrayTurretProj_DustCloud_Explosion_A 
    dw $0002,EnemyProjSpritemaps_DrayTurretProj_DustCloud_Explosion_B 
    dw $000C,EnemyProjSpritemaps_Common_SmallExplosion_0 
    dw Instruction_EnemyProjectile_Delete 

InstList_EnemyProj_MiscDust_3_SmallExplosion:
    dw $0004,EnemyProjSpritemaps_Common_SmallExplosion_0 
    dw $0006,EnemyProjSpritemaps_Common_SmallExplosion_1 
    dw $0005,EnemyProjSpritemaps_Common_SmallExplosion_2 
    dw $0005,EnemyProjSpritemaps_Common_SmallExplosion_3 
    dw $0005,EnemyProjSpritemaps_Common_SmallExplosion_4 
    dw $0006,EnemyProjSpritemaps_Common_SmallExplosion_5 
    dw Instruction_EnemyProjectile_Delete 

InstList_EnemyProj_MiscDust_4_MotherBrainRainbowBeamExplosion:
    dw $0003,EnemyProjSpritemaps_DustCloud_Explosion_39 
    dw $0003,EnemyProjSpritemaps_DustCloud_Explosion_3A 
    dw $0004,EnemyProjSpritemaps_DustCloud_Explosion_3B 
    dw $0004,EnemyProjSpritemaps_DustCloud_Explosion_3C 
    dw $0004,EnemyProjSpritemaps_DustCloud_Explosion_3D 
    dw Instruction_EnemyProjectile_Delete 

UNUSED_InstList_EnemyProj_MiscDust_5_BeamTrail_86E168:
    dw $0008,EnemyProjSpritemaps_DustCloud_Explosion_3E 
    dw $0008,EnemyProjSpritemaps_DustCloud_Explosion_3F 
    dw $0008,EnemyProjSpritemaps_DustCloud_Explosion_40 
    dw $0008,EnemyProjSpritemaps_DustCloud_Explosion_41 
    dw $0018,EnemyProjSpritemaps_DrayTurretProj_DustCloud_Explosion_9 
    dw Instruction_EnemyProjectile_Delete 

InstList_EnemyProj_MiscDust_6_DudShot_TinyExplosion:
    dw $0004,EnemyProjSpritemaps_DustCloud_Explosion_45 
    dw $0004,EnemyProjSpritemaps_DustCloud_Explosion_46 
    dw $0004,EnemyProjSpritemaps_DustCloud_Explosion_47 
    dw $0004,EnemyProjSpritemaps_DustCloud_Explosion_48 
    dw $0004,EnemyProjSpritemaps_DustCloud_Explosion_49 
    dw $0004,EnemyProjSpritemaps_DustCloud_Explosion_4A 
    dw Instruction_EnemyProjectile_Delete 

UNUSED_InstList_EnemyProj_MiscDust_7_PowerBomb_86E198:
    dw $0005,EnemyProjSpritemaps_DustCloud_Explosion_42 
    dw $0005,EnemyProjSpritemaps_DustCloud_Explosion_43 
    dw $0005,EnemyProjSpritemaps_DustCloud_Explosion_44 
    dw Instruction_EnemyProjectile_Delete 

UNUSED_InstList_EnemyProj_MiscDust_8_ElevatorPad_86E1A6:
    dw $0001,EnemyProjSpritemaps_CeresElevatorPad_DustCloud_Explosion_0 
    dw $0001,EnemyProjSpritemaps_CeresElevatorPad_DustCloud_Explosion_1 
    dw Instruction_EnemyProjectile_Delete 

InstList_EnemyProj_MiscDust_9_SmallDustCloud:
    dw $0005,EnemyProjSpritemaps_DustCloud_Explosion_4F 
    dw $0005,EnemyProjSpritemaps_DustCloud_Explosion_4B 
    dw $0005,EnemyProjSpritemaps_DustCloud_Explosion_4C 
    dw $0005,EnemyProjSpritemaps_DustCloud_Explosion_4D 
    dw $0005,EnemyProjSpritemaps_DustCloud_Explosion_4E 
    dw Instruction_EnemyProjectile_Delete 

InstList_EnemyProj_MiscDust_A_CorpseDustCloud:
    dw $0003,EnemyProjSpritemaps_DustCloud_Explosion_4F 
    dw $0003,EnemyProjSpritemaps_DustCloud_Explosion_50 
    dw $0003,EnemyProjSpritemaps_DustCloud_Explosion_51 
    dw $0003,EnemyProjSpritemaps_DustCloud_Explosion_52 
    dw Instruction_EnemyProjectile_Delete 

InstList_EnemyProj_MiscDust_B_EyeDoorSweatDrop:
    dw $0005,EnemyProjSpritemaps_DustCloud_Explosion_53 
    dw $0005,EnemyProjSpritemaps_DustCloud_Explosion_54 
    dw $0005,EnemyProjSpritemaps_DustCloud_Explosion_55 
    dw $0005,EnemyProjSpritemaps_DustCloud_Explosion_56 
    dw Instruction_EnemyProjectile_Delete 

InstList_EnemyProj_MiscDust_C_Smoke:
    dw $0008,EnemyProjSpritemaps_Common_Smoke_0 
    dw $0008,EnemyProjSpritemaps_Common_Smoke_1 
    dw $0008,EnemyProjSpritemaps_Common_Smoke_2 
    dw $0008,EnemyProjSpritemaps_Common_Smoke_3 
    dw Instruction_EnemyProjectile_Delete 

UNUSED_InstList_EnemyProj_MiscDust_1C_ElevatorPad_86E1FC:
    dw $0001,EnemyProjSpritemaps_CeresElevatorPad_DustCloud_Explosion_0 
    dw $0001,EnemyProjSpritemaps_CeresElevatorPad_DustCloud_Explosion_1 
    dw Instruction_EnemyProjectile_GotoY 
    dw UNUSED_InstList_EnemyProj_MiscDust_1C_ElevatorPad_86E1FC 

InstList_EnemyProj_MiscDust_1D_BigExplosion:
    dw $0005,EnemyProjSpritemaps_Common_BigExplosion_0 
    dw $0005,EnemyProjSpritemaps_Common_BigExplosion_1 
    dw $0005,EnemyProjSpritemaps_Common_BigExplosion_2 
    dw $0005,EnemyProjSpritemaps_Common_BigExplosion_3 
    dw $0005,EnemyProjSpritemaps_Common_BigExplosion_4 
    dw $0005,EnemyProjSpritemaps_Common_BigExplosion_5 
    dw Instruction_EnemyProjectile_Delete 

UNUSED_InstList_EnemyProj_MiscDust_D_SmallEnergyDrop_86E222:
    dw $0008,EnemyProjSpritemaps_DustCloud_Explosion_57 
    dw $0008,EnemyProjSpritemaps_DustCloud_Explosion_58 
    dw $0008,EnemyProjSpritemaps_DustCloud_Explosion_59 
    dw $0008,EnemyProjSpritemaps_DustCloud_Explosion_5A 
    dw Instruction_EnemyProjectile_Delete 

UNUSED_InstList_EnemyProj_MiscDust_E_BigEnergyDrop_86E22E:
    dw $0008,EnemyProjSpritemaps_DustCloud_Explosion_5B 
    dw $0008,EnemyProjSpritemaps_DustCloud_Explosion_5C 
    dw $0008,EnemyProjSpritemaps_DustCloud_Explosion_5D 
    dw $0008,EnemyProjSpritemaps_DustCloud_Explosion_5E 
    dw Instruction_EnemyProjectile_Delete 

UNUSED_InstList_EnemyProj_MiscDust_F_Bomb_86E246:
    dw $0005,EnemyProjSpritemaps_DustCloud_Explosion_5F 
    dw $0005,EnemyProjSpritemaps_DustCloud_Explosion_60 
    dw $0005,EnemyProjSpritemaps_DustCloud_Explosion_61 
    dw $0005,EnemyProjSpritemaps_DustCloud_Explosion_62 
    dw Instruction_EnemyProjectile_Delete 

UNUSED_InstList_EnemyProj_MiscDust_10_WeirdEnergyDrop_86E258:
    dw $0010,EnemyProjSpritemaps_DustCloud_Explosion_63 
    dw $0010,EnemyProjSpritemaps_DustCloud_Explosion_64 
    dw $0010,EnemyProjSpritemaps_DustCloud_Explosion_65 
    dw Instruction_EnemyProjectile_Delete 

InstList_EnemyProj_MiscDust_11_RockParticles:
    dw $0002,EnemyProjSpritemaps_DustCloud_Explosion_0 
    dw $0002,EnemyProjSpritemaps_DustCloud_Explosion_1 
    dw $0002,EnemyProjSpritemaps_DustCloud_Explosion_2 
    dw $0002,EnemyProjSpritemaps_DustCloud_Explosion_3 
    dw $0002,EnemyProjSpritemaps_DustCloud_Explosion_4 
    dw $0002,EnemyProjSpritemaps_DustCloud_Explosion_5 
    dw $0002,EnemyProjSpritemaps_DustCloud_Explosion_6 
    dw $0002,EnemyProjSpritemaps_DustCloud_Explosion_7 
    dw $0002,EnemyProjSpritemaps_DustCloud_Explosion_8 
    dw $0002,EnemyProjSpritemaps_DustCloud_Explosion_9 
    dw $0002,EnemyProjSpritemaps_DustCloud_Explosion_A 
    dw $0002,EnemyProjSpritemaps_DustCloud_Explosion_B 
    dw $0002,EnemyProjSpritemaps_DustCloud_Explosion_C 
    dw $0002,EnemyProjSpritemaps_DustCloud_Explosion_D 
    dw $0002,EnemyProjSpritemaps_DustCloud_Explosion_E 
    dw $0002,EnemyProjSpritemaps_DustCloud_Explosion_F 
    dw Instruction_EnemyProjectile_Delete 

InstList_EnemyProj_MiscDust_12_ShortBigDustCloud:
    dw $0002,EnemyProjSpritemaps_Common_BigDustCloud_0 
    dw $0002,EnemyProjSpritemaps_Common_BigDustCloud_1 
    dw $0002,EnemyProjSpritemaps_Common_BigDustCloud_2 
    dw $0002,EnemyProjSpritemaps_Common_BigDustCloud_3 
    dw Instruction_EnemyProjectile_Delete 

UNUSED_InstList_EnemyProj_MiscDust_13_CloudShortBeam_86E2BA:
    dw $0003,EnemyProjSpritemaps_DustCloud_Explosion_10 
    dw $0003,EnemyProjSpritemaps_DustCloud_Explosion_11 
    dw $0003,EnemyProjSpritemaps_DustCloud_Explosion_12 
    dw $0003,EnemyProjSpritemaps_DustCloud_Explosion_13 
    dw $0003,EnemyProjSpritemaps_DustCloud_Explosion_14 
    dw $0005,EnemyProjSpritemaps_DustCloud_Explosion_15 
    dw Instruction_EnemyProjectile_Delete 

UNUSED_InstList_EnemyProj_MiscDust_14_CloudMediumBeam_86E2D4:
    dw $0003,EnemyProjSpritemaps_DustCloud_Explosion_10 
    dw $0003,EnemyProjSpritemaps_DustCloud_Explosion_11 
    dw $0003,EnemyProjSpritemaps_DustCloud_Explosion_12 
    dw $0003,EnemyProjSpritemaps_DustCloud_Explosion_13 
    dw $0003,EnemyProjSpritemaps_DustCloud_Explosion_14 
    dw $0003,EnemyProjSpritemaps_DustCloud_Explosion_15 
    dw $0003,EnemyProjSpritemaps_DustCloud_Explosion_16 
    dw Instruction_EnemyProjectile_Delete 

InstList_EnemyProj_MiscDust_15_BigDustCloud:
    dw $0005,EnemyProjSpritemaps_Common_BigDustCloud_0 
    dw $0005,EnemyProjSpritemaps_Common_BigDustCloud_1 
    dw $0005,EnemyProjSpritemaps_Common_BigDustCloud_2 
    dw $0005,EnemyProjSpritemaps_Common_BigDustCloud_3 
    dw $0005,EnemyProjSpritemaps_DustCloud_Explosion_10 
    dw $0005,EnemyProjSpritemaps_DustCloud_Explosion_11 
    dw $0005,EnemyProjSpritemaps_DustCloud_Explosion_12 
    dw $0005,EnemyProjSpritemaps_DustCloud_Explosion_13 
    dw Instruction_EnemyProjectile_Delete 

UNUSED_InstList_EnemyProj_MiscDust_16_LongBeam_86E314:
    dw $0001,EnemyProjSpritemaps_DustCloud_Explosion_14 
    dw $0001,EnemyProjSpritemaps_DustCloud_Explosion_15 
    dw $0001,EnemyProjSpritemaps_DustCloud_Explosion_16 
    dw $0001,EnemyProjSpritemaps_DustCloud_Explosion_17 
    dw $0001,EnemyProjSpritemaps_DustCloud_Explosion_18 
    dw $0001,EnemyProjSpritemaps_DustCloud_Explosion_19 
    dw $0001,EnemyProjSpritemaps_DustCloud_Explosion_1A 
    dw $0001,EnemyProjSpritemaps_DustCloud_Explosion_1B 
    dw $0001,EnemyProjSpritemaps_DustCloud_Explosion_1A 
    dw $0001,EnemyProjSpritemaps_DustCloud_Explosion_1B 
    dw $0001,EnemyProjSpritemaps_DustCloud_Explosion_1A 
    dw $0001,EnemyProjSpritemaps_DustCloud_Explosion_1B 
    dw $0001,EnemyProjSpritemaps_DustCloud_Explosion_1A 
    dw $0001,EnemyProjSpritemaps_DustCloud_Explosion_1B 
    dw $0001,EnemyProjSpritemaps_DustCloud_Explosion_1A 
    dw $0001,EnemyProjSpritemaps_DustCloud_Explosion_1B 
    dw $0001,EnemyProjSpritemaps_DustCloud_Explosion_1A 
    dw $0001,EnemyProjSpritemaps_DustCloud_Explosion_1B 
    dw $0001,EnemyProjSpritemaps_DustCloud_Explosion_1A 
    dw $0001,EnemyProjSpritemaps_DustCloud_Explosion_1B 
    dw $0001,EnemyProjSpritemaps_DustCloud_Explosion_1A 
    dw $0001,EnemyProjSpritemaps_DustCloud_Explosion_1B 
    dw $0001,EnemyProjSpritemaps_DustCloud_Explosion_1A 
    dw $0001,EnemyProjSpritemaps_DustCloud_Explosion_1B 
    dw $0001,EnemyProjSpritemaps_DustCloud_Explosion_1A 
    dw $0001,EnemyProjSpritemaps_DustCloud_Explosion_1B 
    dw $0001,EnemyProjSpritemaps_DustCloud_Explosion_1A 
    dw $0001,EnemyProjSpritemaps_DustCloud_Explosion_1B 
    dw $0001,EnemyProjSpritemaps_DustCloud_Explosion_1A 
    dw $0001,EnemyProjSpritemaps_DustCloud_Explosion_1B 
    dw $0001,EnemyProjSpritemaps_DustCloud_Explosion_1A 
    dw Instruction_EnemyProjectile_Delete 

UNUSED_InstList_EnemyProj_MiscDust_17_FlickerLongBeam_86E392:
    dw $0001,EnemyProjSpritemaps_DustCloud_Explosion_1A 
    dw $0001,EnemyProjSpritemaps_DustCloud_Explosion_1B 
    dw $0001,EnemyProjSpritemaps_DustCloud_Explosion_1A 
    dw Instruction_EnemyProjectile_Delete 

InstList_EnemyProj_MiscDust_18_LongDraygonBreathBubbles:
    dw $0008,EnemyProjSpritemaps_DustCloud_Explosion_1C 
    dw $0008,EnemyProjSpritemaps_DustCloud_Explosion_1D 
    dw $0008,EnemyProjSpritemaps_DustCloud_Explosion_1E 
    dw $0008,EnemyProjSpritemaps_DustCloud_Explosion_1F 
    dw $0008,EnemyProjSpritemaps_DustCloud_Explosion_20 
    dw $0008,EnemyProjSpritemaps_DustCloud_Explosion_21 
    dw $0008,EnemyProjSpritemaps_DustCloud_Explosion_22 
    dw $0008,EnemyProjSpritemaps_DustCloud_Explosion_23 
    dw $0008,EnemyProjSpritemaps_DustCloud_Explosion_24 
    dw Instruction_EnemyProjectile_Delete 

UNUSED_InstList_EnemyProj_MiscDust_19_SaveStationElec_86E3C6:
    dw $0001,EnemyProjSpritemaps_DustCloud_Explosion_25 
    dw $0001,EnemyProjSpritemaps_DustCloud_Explosion_26 
    dw $0001,EnemyProjSpritemaps_DustCloud_Explosion_27 
    dw $0001,EnemyProjSpritemaps_DustCloud_Explosion_28 
    dw $0001,EnemyProjSpritemaps_DustCloud_Explosion_29 
    dw $0001,EnemyProjSpritemaps_DustCloud_Explosion_2A 
    dw $0001,EnemyProjSpritemaps_DustCloud_Explosion_2B 
    dw $0001,EnemyProjSpritemaps_DustCloud_Explosion_2C 
    dw Instruction_EnemyProjectile_Delete 

UNUSED_InstList_EnemyProj_MiscDust_ExpandVerticalGate_86E3E8:
    dw $0010,EnemyProjSpritemaps_DustCloud_Explosion_2D 
    dw $0010,EnemyProjSpritemaps_DustCloud_Explosion_2E 
    dw $0010,EnemyProjSpritemaps_DustCloud_Explosion_2F 
    dw $0010,EnemyProjSpritemaps_DustCloud_Explosion_30 
    dw $0010,EnemyProjSpritemaps_DustCloud_Explosion_31 
    dw $0010,EnemyProjSpritemaps_DustCloud_Explosion_32 
    dw $0010,EnemyProjSpritemaps_DustCloud_Explosion_33 
    dw $0010,EnemyProjSpritemaps_DustCloud_Explosion_34 
    dw Instruction_EnemyProjectile_Delete 

UNUSED_InstList_EnemyProj_MiscDust_ContractVertGate_86E40A:
    dw $0004,EnemyProjSpritemaps_DustCloud_Explosion_34 
    dw $0004,EnemyProjSpritemaps_DustCloud_Explosion_33 
    dw $0004,EnemyProjSpritemaps_DustCloud_Explosion_32 
    dw $0004,EnemyProjSpritemaps_DustCloud_Explosion_31 
    dw $0004,EnemyProjSpritemaps_DustCloud_Explosion_30 
    dw $0004,EnemyProjSpritemaps_DustCloud_Explosion_2F 
    dw $0004,EnemyProjSpritemaps_DustCloud_Explosion_2E 
    dw $0004,EnemyProjSpritemaps_DustCloud_Explosion_2D 
    dw Instruction_EnemyProjectile_Delete 

MiscDust_InstListPointers:
    dw UNUSED_InstList_EnemyProj_MiscDust_0_BeamCharge_86E0EE 
    dw InstList_EnemyProj_MiscDust_1_MotherBrainElbowChargeParticle 
    dw InstList_EnemyProj_MiscDust_2_MotherBrainElbowChargeEnergy 
    dw InstList_EnemyProj_MiscDust_3_SmallExplosion 
    dw InstList_EnemyProj_MiscDust_4_MotherBrainRainbowBeamExplosion 
    dw UNUSED_InstList_EnemyProj_MiscDust_5_BeamTrail_86E168 
    dw InstList_EnemyProj_MiscDust_6_DudShot_TinyExplosion 
    dw UNUSED_InstList_EnemyProj_MiscDust_7_PowerBomb_86E198 
    dw UNUSED_InstList_EnemyProj_MiscDust_8_ElevatorPad_86E1A6 
    dw InstList_EnemyProj_MiscDust_9_SmallDustCloud 
    dw InstList_EnemyProj_MiscDust_A_CorpseDustCloud 
    dw InstList_EnemyProj_MiscDust_B_EyeDoorSweatDrop 
    dw InstList_EnemyProj_MiscDust_C_Smoke 
    dw UNUSED_InstList_EnemyProj_MiscDust_D_SmallEnergyDrop_86E222 
    dw UNUSED_InstList_EnemyProj_MiscDust_E_BigEnergyDrop_86E22E 
    dw UNUSED_InstList_EnemyProj_MiscDust_F_Bomb_86E246 
    dw UNUSED_InstList_EnemyProj_MiscDust_10_WeirdEnergyDrop_86E258 
    dw InstList_EnemyProj_MiscDust_11_RockParticles 
    dw InstList_EnemyProj_MiscDust_12_ShortBigDustCloud 
    dw UNUSED_InstList_EnemyProj_MiscDust_13_CloudShortBeam_86E2BA 
    dw UNUSED_InstList_EnemyProj_MiscDust_14_CloudMediumBeam_86E2D4 
    dw InstList_EnemyProj_MiscDust_15_BigDustCloud 
    dw UNUSED_InstList_EnemyProj_MiscDust_16_LongBeam_86E314 
    dw UNUSED_InstList_EnemyProj_MiscDust_17_FlickerLongBeam_86E392 
    dw InstList_EnemyProj_MiscDust_18_LongDraygonBreathBubbles 
    dw UNUSED_InstList_EnemyProj_MiscDust_19_SaveStationElec_86E3C6 
    dw UNUSED_InstList_EnemyProj_MiscDust_ExpandVerticalGate_86E3E8 
    dw UNUSED_InstList_EnemyProj_MiscDust_ContractVertGate_86E40A 
    dw UNUSED_InstList_EnemyProj_MiscDust_1C_ElevatorPad_86E1FC 
    dw InstList_EnemyProj_MiscDust_1D_BigExplosion 

InitAI_EnemyProj_MiscDust:
    LDA.W $1993 
    ASL A 
    TAX 
    LDA.W MiscDust_InstListPointers,X : STA.W $1B47,Y 
    LDA.B $12 : STA.W $1A4B,Y 
    LDA.B $14 : STA.W $1A93,Y 
    RTS 

;        _____________________ Random X offset range
;       |      _______________ Random Y offset range
;       |     |      _________ Minimum X offset
;       |     |     |      ___ Minimum Y offset
;       |     |     |     |
PLM_MiscDust_XYOffsetTable_randomX:
    dw $0000 
PLM_MiscDust_XYOffsetTable_randomY:
    dw       $0000 
PLM_MiscDust_XYOffsetTable_minX:
    dw             $0000 
PLM_MiscDust_XYOffsetTable_minY:
    dw                   $0000 
    dw $0007,$0007,$FFFC,$FFFC
    dw $000F,$000F,$FFF8,$FFF8
    dw $000F,$001F,$FFF8,$FFF0
    dw $001F,$003F,$FFF0,$FFE0


InitAI_EnemyProj_MiscDustPLM:
    LDA.W $1993 : AND.W #$00FF 
    ASL A 
    TAX 
    LDA.W MiscDust_InstListPointers,X : STA.W $1B47,Y 
    LDA.W $1994 : AND.W #$00FF 
    ASL #3
    TAX 
    LDA.W $05E5 : AND.W PLM_MiscDust_XYOffsetTable_randomX,X 
    CLC : ADC.W PLM_MiscDust_XYOffsetTable_minX,X : STA.B $12 
    LDA.W $05E6 : AND.W PLM_MiscDust_XYOffsetTable_randomY,X 
    CLC : ADC.W PLM_MiscDust_XYOffsetTable_minY,X : STA.B $14 
    LDX.W $1C27 
    JSL.L Calculate_PLM_Block_Coordinates 
    LDA.W $1C29 
    SEC 
    ROL A 
    ASL #3
    CLC : ADC.B $12 : STA.W $1A4B,Y 
    LDA.W $1C2B 
    SEC 
    ROL A 
    ASL #3
    CLC : ADC.B $14 : STA.W $1A93,Y 
    JSL.L GenerateRandomNumber 
    RTS 


PreInstruction_EnemyProjectile_MiscDust:
    JSR.W CheckIf_EnemyProjectile_IsOffScreen_duplicate_again4 
    BNE .offScreen 
    RTS 


.offScreen:
    STZ.W $1997,X 
    RTS 


RTS_86E508:
    RTS 


EnemyProjectile_MiscDust:
    dw InitAI_EnemyProj_MiscDust ; Initialisation AI
    dw PreInstruction_EnemyProjectile_MiscDust ; Initial pre-instruction
    dw UNUSED_InstList_EnemyProj_MiscDust_0_BeamCharge_86E0EE ; Initial instruction list
    db $00,$00 ; X,Y radius
    dw $1000,$0000 ; Properties, Hit instruction list
    dw InstList_EnemyProjectile_Delete ; Shot instruction list

EnemyProjectile_MiscDustPLM:
    dw InitAI_EnemyProj_MiscDustPLM ; Initialisation AI
    dw RTS_86E508 ; Initial pre-instruction
    dw InstList_EnemyProj_MiscDust_3_SmallExplosion ; Initial instruction list
    db $00,$00 ; X,Y radius
    dw $0000,$0000 ; Properties, Hit instruction list
    dw InstList_EnemyProjectile_Delete ; Shot instruction list

if !FEATURE_KEEP_UNREFERENCED
UNUSED_EnemyProjectile_DustCloudExplosion_86E525:
    dw InitAI_EnemyProj_MiscDust ; Initialisation AI
    dw InstList_EnemyProjectile_GunshipLiftoffDustClouds_Index0_0 ; >_< this is not a pre-instruction, its an instruction list
    dw InstList_EnemyProj_MiscDust_3_SmallExplosion ; Initial instruction list
    db $00,$00 ; X,Y radius
    dw $0000,$0000 ; Properties, Hit instruction list
    dw InstList_EnemyProjectile_Delete ; Shot instruction list
endif ; !FEATURE_KEEP_UNREFERENCED

Instruction_EnemyProjectile_ShotGate_EnemyVelocityInY:
    LDA.W $0000,Y : STA.W $1ADB,X 
    INY #2
    RTS 


InstList_EnemyProjectile_ShotGate_SpawnedDownwards:
    dw Instruction_EnemyProjectile_ShotGate_EnemyVelocityInY,$0100 
    dw Instruction_EnemyProjectile_PreInstructionInY 
    dw PreInstruction_EnemyProjectile_ShotGate_InitialClosed 
    dw $0001,EnemyProjSpritemaps_DownwardsShotGate_0 
    dw Instruction_EnemyProjectile_Sleep 
    dw $0001,EnemyProjSpritemaps_DownwardsShotGate_1 
    dw Instruction_EnemyProjectile_Sleep 
    dw $0001,EnemyProjSpritemaps_DownwardsShotGate_2 
    dw Instruction_EnemyProjectile_Sleep 
    dw $0001,EnemyProjSpritemaps_DownwardsShotGate_3 
    dw Instruction_EnemyProjectile_Sleep 
    dw Instruction_EnemyProjectile_ClearPreInstruction 

InstList_EnemyProjectile_ShotGate_InitialClosedDownwards:
    dw Instruction_EnemyProjectile_ShotGate_EnemyVelocityInY,$FF00 
    dw $0001,EnemyProjSpritemaps_DownwardsShotGate_3 
    dw Instruction_EnemyProjectile_Sleep 
    dw Instruction_EnemyProjectile_PreInstructionInY 
    dw PreInstruction_EnemyProjectile_ShotGate_InitialClosed 
    dw $0001,EnemyProjSpritemaps_DownwardsShotGate_3 
    dw Instruction_EnemyProjectile_Sleep 
    dw $0001,EnemyProjSpritemaps_DownwardsShotGate_2 
    dw Instruction_EnemyProjectile_Sleep 
    dw $0001,EnemyProjSpritemaps_DownwardsShotGate_1 
    dw Instruction_EnemyProjectile_Sleep 
    dw $0001,EnemyProjSpritemaps_DownwardsShotGate_0 
    dw Instruction_EnemyProjectile_Sleep 
    dw Instruction_EnemyProjectile_Delete 

InstList_EnemyProjectile_ShotGate_SpawnedUpwards:
    dw Instruction_EnemyProjectile_ShotGate_EnemyVelocityInY,$FF00 
    dw Instruction_EnemyProjectile_PreInstructionInY 
    dw PreInstruction_EnemyProjectile_ShotGate_InitialClosed 
    dw $0001,EnemyProjSpritemaps_UpwardsShotGate_0 
    dw Instruction_EnemyProjectile_Sleep 
    dw $0001,EnemyProjSpritemaps_UpwardsShotGate_1 
    dw Instruction_EnemyProjectile_Sleep 
    dw $0001,EnemyProjSpritemaps_UpwardsShotGate_2 
    dw Instruction_EnemyProjectile_Sleep 
    dw $0001,EnemyProjSpritemaps_UpwardsShotGate_3 
    dw Instruction_EnemyProjectile_Sleep 
    dw Instruction_EnemyProjectile_ClearPreInstruction 

InstList_EnemyProjectile_ShotGate_InitialClosedUpwards:
    dw Instruction_EnemyProjectile_ShotGate_EnemyVelocityInY,$0100 
    dw $0001,EnemyProjSpritemaps_UpwardsShotGate_3 

InstList_EnemyProjectile_ShotGate_InitialClosedUpwards_sleep:
    dw Instruction_EnemyProjectile_Sleep 
    dw Instruction_EnemyProjectile_PreInstructionInY 
    dw PreInstruction_EnemyProjectile_ShotGate_InitialClosed 
    dw $0001,EnemyProjSpritemaps_UpwardsShotGate_3 
    dw Instruction_EnemyProjectile_Sleep 
    dw $0001,EnemyProjSpritemaps_UpwardsShotGate_2 
    dw Instruction_EnemyProjectile_Sleep 
    dw $0001,EnemyProjSpritemaps_UpwardsShotGate_1 
    dw Instruction_EnemyProjectile_Sleep 
    dw $0001,EnemyProjSpritemaps_UpwardsShotGate_0 
    dw Instruction_EnemyProjectile_Sleep 
    dw Instruction_EnemyProjectile_Delete 

InitAI_EnemyProjectile_ShotGate_Spawned:
    LDA.W #$0000 : BRA InitAI_EnemyProjectile_ShotGate_Common 


InitAI_EnemyProjectile_ShotGate_InitialClosedDownwards:
    LDA.W #$0040 : BRA InitAI_EnemyProjectile_ShotGate_Common 


InitAI_EnemyProjectile_ShotGate_InitialClosedUpwards:
    LDA.W #$FFC0 

InitAI_EnemyProjectile_ShotGate_Common:
    STA.B $12 
    LDX.W $1C27 
    JSL.L Calculate_PLM_Block_Coordinates 
    LDA.W $1C87,X : STA.W $1AFF,Y 
    LDA.W $1C29 
    ASL #4
    STA.W $1A4B,Y 
    LDA.W $1C2B 
    ASL #4
    CLC : ADC.B $12 : STA.W $1A93,Y 
    RTS 


RTS_86E604:
    RTS 


PreInstruction_EnemyProjectile_ShotGate_InitialClosed:
    LDA.W $1ADB,X : BPL + 
    EOR.W #$FFFF 
    INC A 

  + CLC : ADC.W $19DF,X : CMP.W #$1000 : BCC + 
    LDA.W #$0001 : STA.W $1B8F,X 
    INC.W $1B47,X 
    INC.W $1B47,X 
    LDA.W #$0000 

  + STA.W $19DF,X 
    LDA.W $1ADA,X : AND.W #$FF00 
    CLC : ADC.W $1A6F,X : STA.W $1A6F,X 
    LDA.W $1ADB,X 
    XBA 
    BPL .lowByte 
    ORA.W #$FF00 
    BRA + 


.lowByte:
    AND.W #$00FF 

  + ADC.W $1A93,X : STA.W $1A93,X 
    RTS 


EnemyProjectile_SpawnedDownwardsShotGate:
    dw InitAI_EnemyProjectile_ShotGate_Spawned ; Initialisation AI
    dw RTS_86E604 ; Initial pre-instruction
    dw InstList_EnemyProjectile_ShotGate_SpawnedDownwards ; Initial instruction list
    db $00,$00 ; X,Y radius
    dw $2000,$0000 ; Properties, Hit instruction list
    dw InstList_EnemyProjectile_Delete ; Shot instruction list

EnemyProjectile_DownwardsShotGateInitiallyClosed:
    dw InitAI_EnemyProjectile_ShotGate_InitialClosedDownwards ; Initialisation AI
    dw RTS_86E604 ; Initial pre-instruction
    dw InstList_EnemyProjectile_ShotGate_InitialClosedDownwards ; Initial instruction list
    db $00,$00 ; X,Y radius
    dw $2000,$0000 ; Properties, Hit instruction list
    dw InstList_EnemyProjectile_Delete ; Shot instruction list

EnemyProjectile_SpawnedUpwardsShotGate:
    dw InitAI_EnemyProjectile_ShotGate_Spawned ; Initialisation AI
    dw RTS_86E604 ; Initial pre-instruction
    dw InstList_EnemyProjectile_ShotGate_SpawnedUpwards ; Initial instruction list
    db $00,$00 ; X,Y radius
    dw $2000,$0000 ; Properties, Hit instruction list
    dw InstList_EnemyProjectile_Delete ; Shot instruction list

EnemyProjectile_UpwardsShotGateInitiallyClosed:
    dw InitAI_EnemyProjectile_ShotGate_InitialClosedUpwards ; Initialisation AI
    dw RTS_86E604 ; Initial pre-instruction
    dw InstList_EnemyProjectile_ShotGate_InitialClosedUpwards ; Initial instruction list
    db $00,$00 ; X,Y radius
    dw $2000,$0000 ; Properties, Hit instruction list
    dw InstList_EnemyProjectile_Delete ; Shot instruction list

InstList_EnemyProjectile_SaveStationElectricity_0:
    dw Instruction_EnemyProjectile_TimerInY,$0014 

InstList_EnemyProjectile_SaveStationElectricity_1:
    dw $0001,EnemyProjSpritemaps_SaveStationElectricity_0 
    dw $0001,EnemyProjSpritemaps_SaveStationElectricity_1 
    dw $0001,EnemyProjSpritemaps_SaveStationElectricity_2 
    dw $0001,EnemyProjSpritemaps_SaveStationElectricity_3 
    dw $0001,EnemyProjSpritemaps_SaveStationElectricity_4 
    dw $0001,EnemyProjSpritemaps_SaveStationElectricity_5 
    dw $0001,EnemyProjSpritemaps_SaveStationElectricity_6 
    dw $0001,EnemyProjSpritemaps_SaveStationElectricity_7 
    dw Instruction_EnemyProjectile_DecrementTimer_GotoYIfNonZero 
    dw InstList_EnemyProjectile_SaveStationElectricity_1 
    dw Instruction_EnemyProjectile_Delete 

InitAI_EnemyProjectile_SaveStationElectrictiy:
    LDX.W $1C27 
    JSL.L Calculate_PLM_Block_Coordinates 
    LDA.W $1C29 : CLC : ADC.W #$0001 : ASL #4
    STA.W $1A4B,Y 
    LDA.W $1C2B : SEC : SBC.W #$0002 : ASL #4
    STA.W $1A93,Y 
    RTS 


RTS_86E6D1:
    RTS 


EnemyProjectile_SaveStationElectricity:
    dw InitAI_EnemyProjectile_SaveStationElectrictiy ; Initialisation AI
    dw RTS_86E6D1 ; Initial pre-instruction
    dw InstList_EnemyProjectile_SaveStationElectricity_0 ; Initial instruction list
    db $00,$00 ; X,Y radius
    dw $3000,$0000 ; Properties, Hit instruction list
    dw InstList_EnemyProjectile_Delete ; Shot instruction list

CheckIf_EnemyProjectile_IsOffScreen_duplicate_again4:
    PHX : PHY 
    LDA.W $1A4B,X : CMP.W $0911 : BMI .returnOffScreen 
    LDA.W $0911 : CLC : ADC.W #$0100 : STA.W $0E20 
    LDA.W $1A4B,X : CMP.W $0E20 : BPL .returnOffScreen 
    LDA.W $1A93,X : CMP.W $0915 : BMI .returnOffScreen 
    LDA.W $0915 : CLC : ADC.W #$0100 : STA.W $0E20 
    LDA.W $1A93,X : CMP.W $0E20 : BPL .returnOffScreen 
    PLY : PLX 
    LDA.W #$0000 
    RTS 


.returnOffScreen:
    PLY : PLX 
    LDA.W #$0001 
    RTS 


CheckIf_EnemyProjectile_IsInDraygonRoomBoundaries:
    LDA.W $1A4B,X : BMI .returnOutOfRoom 
    CMP.W #$0200 : BPL .returnOutOfRoom 
    LDA.W $1A93,X : BMI .returnOutOfRoom 
    CMP.W #$0200 : BPL .returnOutOfRoom 
    LDA.W #$0000 
    RTS 


.returnOutOfRoom:
    LDA.W #$0001 
    RTS 


Move_EnemyProjectile_AccordingToAngleAndSpeed:
    PHX 
    LDA.L $7E97DC,X : CLC : ADC.W #$0040 : BIT.W #$0080 
    BNE .subtractX 
    LDA.W $1A27,X : CLC : ADC.W $1AFF,X : STA.W $1A27,X 
    LDA.W $1A4B,X : ADC.W $1AB7,X : STA.W $1A4B,X 
    BRA + 


.subtractX:
    LDA.W $1A27,X : SEC : SBC.W $1AFF,X : STA.W $1A27,X 
    LDA.W $1A4B,X : SBC.W $1AB7,X : STA.W $1A4B,X 

  + LDA.L $7E97DC,X : CLC : ADC.W #$0080 : BIT.W #$0080 
    BNE .subtractY 
    LDA.W $1A6F,X : CLC : ADC.W $1B23,X : STA.W $1A6F,X 
    LDA.W $1A93,X : ADC.W $1ADB,X : STA.W $1A93,X 
    BRA .return 


.subtractY:
    LDA.W $1A6F,X : SEC : SBC.W $1B23,X : STA.W $1A6F,X 
    LDA.W $1A93,X : SBC.W $1ADB,X : STA.W $1A93,X 

.return:
    PLX 
    RTS 


PlaceAndAim_DraygonsWallTurretProjectile:
    TYX 
    LDA.B $12 : STA.W $1A4B,Y 
    LDA.B $14 : STA.W $1A93,Y 
    LDA.W $0AF6 : SEC : SBC.W $1A4B,Y : STA.B $12 
    LDA.W $0AFA : SEC : SBC.W $1A93,Y : STA.B $14 
    JSL.L CalculateAngleOf_12_14_Offset 
    EOR.W #$00FF 
    INC A 
    CLC : ADC.W #$0040 : AND.W #$00FF 
    STA.L $7E97DC,X 
    STA.B $12 
    LDA.W $1993 ; ($16.$18, $1A.$1C) = ([$14] * |cos([$12] * pi / 80h)|, [$14] * |sin([$12] * pi / 80h)|)
    STA.B $14 
    JSL.L Do_Some_Math_With_Sine_Cosine_Terrible_Label_Name 
    LDA.B $16 : STA.W $1AB7,Y 
    LDA.B $18 : STA.W $1AFF,Y 
    LDA.B $1A : STA.W $1ADB,Y 
    LDA.B $1C : STA.W $1B23,Y 
    RTS 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_InstList_EnemyProj_BotwoonsBody_UpFacingLeft_86E7FB:
    dw $0008,EnemyProjSpritemaps_BotwoonsBody_UpFacingLeft_0 
    dw $0008,EnemyProjSpritemaps_BotwoonsBody_UpFacingLeft_1 
    dw $0008,EnemyProjSpritemaps_BotwoonsBody_UpFacingLeft_2 
    dw $0008,EnemyProjSpritemaps_BotwoonsBody_UpFacingLeft_3 
    dw Instruction_EnemyProjectile_GotoY 
    dw UNUSED_InstList_EnemyProj_BotwoonsBody_UpFacingLeft_86E7FB 
endif ; !FEATURE_KEEP_UNREFERENCED

InstList_EnemyProjectile_BotwoonsBody_UpLeft:
    dw $0008,EnemyProjSpritemaps_BotwoonsBody_0 
    dw $0008,EnemyProjSpritemaps_BotwoonsBody_1 
    dw $0008,EnemyProjSpritemaps_BotwoonsBody_2 
    dw $0008,EnemyProjSpritemaps_BotwoonsBody_3 
    dw Instruction_EnemyProjectile_GotoY 
    dw InstList_EnemyProjectile_BotwoonsBody_UpLeft 

InstList_EnemyProjectile_BotwoonsBody_Left:
    dw $0008,EnemyProjSpritemaps_BotwoonsBody_4 
    dw $0008,EnemyProjSpritemaps_BotwoonsBody_5 
    dw $0008,EnemyProjSpritemaps_BotwoonsBody_6 
    dw $0008,EnemyProjSpritemaps_BotwoonsBody_7 
    dw Instruction_EnemyProjectile_GotoY 
    dw InstList_EnemyProjectile_BotwoonsBody_Left 

InstList_EnemyProjectile_BotwoonsBody_DownLeft:
    dw $0008,EnemyProjSpritemaps_BotwoonsBody_8 
    dw $0008,EnemyProjSpritemaps_BotwoonsBody_9 
    dw $0008,EnemyProjSpritemaps_BotwoonsBody_A 
    dw $0008,EnemyProjSpritemaps_BotwoonsBody_B 
    dw Instruction_EnemyProjectile_GotoY 
    dw InstList_EnemyProjectile_BotwoonsBody_DownLeft 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_InstList_EnemyProj_BotwoonsBody_DownFacingLeft_86E84B:
    dw $0008,UNUSED_EnemyProjSpritemap_BotwoonsBody_DownFacingLeft_8DB682 
    dw $0008,UNUSED_EnemyProjSpritemap_BotwoonsBody_DownFacingLeft_8DB689 
    dw $0008,UNUSED_EnemyProjSpritemap_BotwoonsBody_DownFacingLeft_8DB690 
    dw $0008,UNUSED_EnemyProjSpritemap_BotwoonsBody_DownFacingLeft_8DB697 
    dw Instruction_EnemyProjectile_GotoY 
    dw UNUSED_InstList_EnemyProj_BotwoonsBody_DownFacingLeft_86E84B 
endif ; !FEATURE_KEEP_UNREFERENCED

InstList_EnemyProjectile_BotwoonsBody_Down_FacingRight:
    dw $0008,EnemyProjSpritemaps_BotwoonsBody_C 
    dw $0008,EnemyProjSpritemaps_BotwoonsBody_D 
    dw $0008,EnemyProjSpritemaps_BotwoonsBody_E 
    dw $0008,EnemyProjSpritemaps_BotwoonsBody_F 
    dw Instruction_EnemyProjectile_GotoY 
    dw InstList_EnemyProjectile_BotwoonsBody_Down_FacingRight 

InstList_EnemyProjectile_BotwoonsBody_DownRight:
    dw $0008,EnemyProjSpritemaps_BotwoonsBody_10 
    dw $0008,EnemyProjSpritemaps_BotwoonsBody_11 
    dw $0008,EnemyProjSpritemaps_BotwoonsBody_12 
    dw $0008,EnemyProjSpritemaps_BotwoonsBody_13 
    dw Instruction_EnemyProjectile_GotoY 
    dw InstList_EnemyProjectile_BotwoonsBody_DownRight 

InstList_EnemyProjectile_BotwoonsBody_Right:
    dw $0008,EnemyProjSpritemaps_BotwoonsBody_14 
    dw $0008,EnemyProjSpritemaps_BotwoonsBody_15 
    dw $0008,EnemyProjSpritemaps_BotwoonsBody_16 
    dw $0008,EnemyProjSpritemaps_BotwoonsBody_17 
    dw Instruction_EnemyProjectile_GotoY 
    dw InstList_EnemyProjectile_BotwoonsBody_Right 

InstList_EnemyProjectile_BotwoonsBody_UpRight:
    dw $0008,EnemyProjSpritemaps_BotwoonsBody_18 
    dw $0008,EnemyProjSpritemaps_BotwoonsBody_19 
    dw $0008,EnemyProjSpritemaps_BotwoonsBody_1A 
    dw $0008,EnemyProjSpritemaps_BotwoonsBody_1B 
    dw Instruction_EnemyProjectile_GotoY 
    dw InstList_EnemyProjectile_BotwoonsBody_UpRight 

InstList_EnemyProjectile_BotwoonsBody_Up_FacingRight:
    dw $0008,EnemyProjSpritemaps_BotwoonsBody_1C 
    dw $0008,EnemyProjSpritemaps_BotwoonsBody_1D 
    dw $0008,EnemyProjSpritemaps_BotwoonsBody_1E 
    dw $0008,EnemyProjSpritemaps_BotwoonsBody_1F 
    dw Instruction_EnemyProjectile_GotoY 
    dw InstList_EnemyProjectile_BotwoonsBody_Up_FacingRight 

InstList_EnemyProjectile_BotwoonsTail_Up_FacingRight:
    dw $0001,EnemyProjSpritemaps_BotwoonsBody_20 
    dw Instruction_EnemyProjectile_Sleep 

InstList_EnemyProjectile_BotwoonsTail_UpLeft:
    dw $0001,EnemyProjSpritemaps_BotwoonsBody_21 
    dw Instruction_EnemyProjectile_Sleep 

InstList_EnemyProjectile_BotwoonsTail_Left:
    dw $0001,EnemyProjSpritemaps_BotwoonsBody_22 
    dw Instruction_EnemyProjectile_Sleep 

InstList_EnemyProjectile_BotwoonsTail_DownLeft:
    dw $0001,EnemyProjSpritemaps_BotwoonsBody_23 
    dw Instruction_EnemyProjectile_Sleep 

InstList_EnemyProjectile_BotwoonsTail_Down:
    dw $0001,EnemyProjSpritemaps_BotwoonsBody_24 
    dw Instruction_EnemyProjectile_Sleep 

InstList_EnemyProjectile_BotwoonsTail_DownRight:
    dw $0001,EnemyProjSpritemaps_BotwoonsBody_25 
    dw Instruction_EnemyProjectile_Sleep 

InstList_EnemyProjectile_BotwoonsTail_Right:
    dw $0001,EnemyProjSpritemaps_BotwoonsBody_26 
    dw Instruction_EnemyProjectile_Sleep 

InstList_EnemyProjectile_BotwoonsTail_UpRight:
    dw $0001,EnemyProjSpritemaps_BotwoonsBody_27 
    dw Instruction_EnemyProjectile_Sleep 

InstList_EnemyProjectile_BotwoonsBodyTail_Hidden:
    dw $0001,EnemyProjSpritemaps_BotwoonsBody_28 
    dw Instruction_EnemyProjectile_Sleep 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_InstList_EnemyProjectile_BotwoonsBodyTail_86E8F9:
    dw $0008,UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_0_8DB762 
    dw $0008,UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_1_8DB769 
    dw $0008,UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_2_8DB770 
    dw $0008,UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_3_8DB777 
    dw Instruction_EnemyProjectile_GotoY 
    dw UNUSED_InstList_EnemyProjectile_BotwoonsBodyTail_86E8F9 

UNUSED_InstList_EnemyProjectile_BotwoonsBodyTail_86E90D:
    dw $0008,UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_4_8DB77E 
    dw $0008,UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_5_8DB785 
    dw $0008,UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_6_8DB78C 
    dw $0008,UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_7_8DB793 
    dw Instruction_EnemyProjectile_GotoY 
    dw UNUSED_InstList_EnemyProjectile_BotwoonsBodyTail_86E90D 

UNUSED_InstList_EnemyProjectile_BotwoonsBodyTail_86E921:
    dw $0008,UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_8_8DB79A 
    dw $0008,UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_9_8DB7A1 
    dw $0008,UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_A_8DB7A8 
    dw $0008,UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_B_8DB7AF 
    dw Instruction_EnemyProjectile_GotoY 
    dw UNUSED_InstList_EnemyProjectile_BotwoonsBodyTail_86E921 

UNUSED_InstList_EnemyProjectile_BotwoonsBodyTail_86E935:
    dw $0008,UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_C_8DB7B6 
    dw $0008,UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_D_8DB7BD 
    dw $0008,UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_E_8DB7C4 
    dw $0008,UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_F_8DB7CB 
    dw Instruction_EnemyProjectile_GotoY 
    dw UNUSED_InstList_EnemyProjectile_BotwoonsBodyTail_86E935 

UNUSED_InstList_EnemyProjectile_BotwoonsBodyTail_86E949:
    dw $0008,UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_10_8DB7D2 
    dw $0008,UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_11_8DB7D9 
    dw $0008,UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_12_8DB7E0 
    dw $0008,UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_13_8DB7E7 
    dw Instruction_EnemyProjectile_GotoY 
    dw UNUSED_InstList_EnemyProjectile_BotwoonsBodyTail_86E949 

UNUSED_InstList_EnemyProjectile_BotwoonsBodyTail_86E95D:
    dw $0008,UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_14_8DB7EE 
    dw $0008,UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_15_8DB7F5 
    dw $0008,UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_16_8DB7FC 
    dw $0008,UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_17_8DB803 
    dw Instruction_EnemyProjectile_GotoY 
    dw UNUSED_InstList_EnemyProjectile_BotwoonsBodyTail_86E95D 

UNUSED_InstList_EnemyProjectile_BotwoonsBodyTail_86E971:
    dw $0008,UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_18_8DB80A 
    dw $0008,UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_19_8DB811 
    dw $0008,UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_1A_8DB818 
    dw $0008,UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_1B_8DB81F 
    dw Instruction_EnemyProjectile_GotoY 
    dw UNUSED_InstList_EnemyProjectile_BotwoonsBodyTail_86E971 

UNUSED_InstList_EnemyProjectile_BotwoonsBodyTail_86E985:
    dw $0008,UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_1C_8DB826 
    dw $0008,UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_1D_8DB82D 
    dw $0008,UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_1E_8DB834 
    dw $0008,UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_1F_8DB83B 
    dw Instruction_EnemyProjectile_GotoY 
    dw UNUSED_InstList_EnemyProjectile_BotwoonsBodyTail_86E985 

UNUSED_InstList_EnemyProjectile_BotwoonsBodyTail_86E999:
    dw $0008,UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_20_8DB842 
    dw $0008,UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_21_8DB849 
    dw $0008,UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_22_8DB850 
    dw $0008,UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_23_8DB857 
    dw Instruction_EnemyProjectile_GotoY 
    dw UNUSED_InstList_EnemyProjectile_BotwoonsBodyTail_86E999 

UNUSED_InstList_EnemyProjectile_BotwoonsBodyTail_86E9AD:
    dw $0008,UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_24_8DB85E 
    dw $0008,UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_25_8DB865 
    dw $0008,UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_26_8DB86C 
    dw $0008,UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_27_8DB873 
    dw Instruction_EnemyProjectile_GotoY 
    dw UNUSED_InstList_EnemyProjectile_BotwoonsBodyTail_86E9AD 

UNUSED_InstList_EnemyProjectile_BotwoonsBodyTail_86E9C1:
    dw $0001,UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_28_8DB87A 
    dw Instruction_EnemyProjectile_Sleep 

UNUSED_InstList_EnemyProjectile_BotwoonsBodyTail_86E9C7:
    dw $0001,UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_29_8DB881 
    dw Instruction_EnemyProjectile_Sleep 

UNUSED_InstList_EnemyProjectile_BotwoonsBodyTail_86E9CD:
    dw $0001,UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_2A_8DB888 
    dw Instruction_EnemyProjectile_Sleep 

UNUSED_InstList_EnemyProjectile_BotwoonsBodyTail_86E9D3:
    dw $0001,UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_2B_8DB88F 
    dw Instruction_EnemyProjectile_Sleep 

UNUSED_InstList_EnemyProjectile_BotwoonsBodyTail_86E9D9:
    dw $0001,UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_2C_8DB896 
    dw Instruction_EnemyProjectile_Sleep 

UNUSED_InstList_EnemyProjectile_BotwoonsBodyTail_86E9DF:
    dw $0001,UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_2D_8DB89D 
    dw Instruction_EnemyProjectile_Sleep 

UNUSED_InstList_EnemyProjectile_BotwoonsBodyTail_86E9E5:
    dw $0001,UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_2E_8DB8A4 
    dw Instruction_EnemyProjectile_Sleep 

UNUSED_InstList_EnemyProjectile_BotwoonsBodyTail_86E9EB:
    dw $0001,UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_2F_8DB8AB 
    dw Instruction_EnemyProjectile_Sleep 
endif ; !FEATURE_KEEP_UNREFERENCED

BotwoonsBodyTail_InstListPointers:
    dw InstList_EnemyProjectile_BotwoonsBody_Up_FacingRight 
    dw InstList_EnemyProjectile_BotwoonsBody_UpRight 
    dw InstList_EnemyProjectile_BotwoonsBody_Right 
    dw InstList_EnemyProjectile_BotwoonsBody_DownRight 
    dw InstList_EnemyProjectile_BotwoonsBody_Down_FacingRight 
    dw InstList_EnemyProjectile_BotwoonsBody_DownLeft 
    dw InstList_EnemyProjectile_BotwoonsBody_Left 
    dw InstList_EnemyProjectile_BotwoonsBody_UpLeft 
    dw InstList_EnemyProjectile_BotwoonsBodyTail_Hidden 
    dw InstList_EnemyProjectile_BotwoonsBodyTail_Hidden 
    dw InstList_EnemyProjectile_BotwoonsBodyTail_Hidden 
    dw InstList_EnemyProjectile_BotwoonsBodyTail_Hidden 
    dw InstList_EnemyProjectile_BotwoonsBodyTail_Hidden 
    dw InstList_EnemyProjectile_BotwoonsBodyTail_Hidden 
    dw InstList_EnemyProjectile_BotwoonsBodyTail_Hidden 
    dw InstList_EnemyProjectile_BotwoonsBodyTail_Hidden 
    dw InstList_EnemyProjectile_BotwoonsTail_Up_FacingRight 
    dw InstList_EnemyProjectile_BotwoonsTail_UpRight 
    dw InstList_EnemyProjectile_BotwoonsTail_Right 
    dw InstList_EnemyProjectile_BotwoonsTail_DownRight 
    dw InstList_EnemyProjectile_BotwoonsTail_Down 
    dw InstList_EnemyProjectile_BotwoonsTail_DownLeft 
    dw InstList_EnemyProjectile_BotwoonsTail_Left 
    dw InstList_EnemyProjectile_BotwoonsTail_UpLeft 
    dw InstList_EnemyProjectile_BotwoonsBodyTail_Hidden 
    dw InstList_EnemyProjectile_BotwoonsBodyTail_Hidden 
    dw InstList_EnemyProjectile_BotwoonsBodyTail_Hidden 
    dw InstList_EnemyProjectile_BotwoonsBodyTail_Hidden 
    dw InstList_EnemyProjectile_BotwoonsBodyTail_Hidden 
    dw InstList_EnemyProjectile_BotwoonsBodyTail_Hidden 
    dw InstList_EnemyProjectile_BotwoonsBodyTail_Hidden 
    dw InstList_EnemyProjectile_BotwoonsBodyTail_Hidden 

InitAI_EnemyProjectile_BotwoonsBody:
    LDA.W $0F7A : STA.W $1A4B,Y 
    LDA.W $0F7E : STA.W $1A93,Y 
    LDA.W #$0000 : STA.W $1ADB,Y 
    PHY 
    LDY.W #$0010 
    LDA.W $0FA8 : BNE .notTail 
    LDY.W #$0030 

.notTail:
    STY.B $12 
    LDA.W BotwoonsBodyTail_InstListPointers,Y 
    PLY 
    STA.W $1B47,Y 
    STA.W $1B23,Y 
    LDA.B $12 : STA.W $1AFF,Y 
    LDA.W #Function_EnemyProjectile_BotwoonsBody_Main : STA.W $1AB7,Y 
    LDX.W $0FA8 
    TYA 
    STA.L $7E7800,X 
    PHX 
    TAX 
    LDA.W #$0002 : STA.L $7EF380,X 
    PLX 
    LDA.W #$0001 : STA.L $7E7820,X 
    RTS 


PreInstruction_EnemyProjectile_BotwoonsBody:
    LDA.L $7E8020 : BEQ .executeFunction 
    LDA.W $1AB7,X : CMP.W #Function_EnemyProjectile_BotwoonsBody_Main : BNE .executeFunction 
    LDA.W #Function_EnemyProjectile_BotwoonsBody_Dying_SetDelay : STA.W $1AB7,X 

.executeFunction:
    JSR.W ($1AB7,X) 
    RTS 


Function_EnemyProjectile_BotwoonsBody_Main:
    LDA.W $1AFF,X 
    TAY 
    LDA.W BotwoonsBodyTail_InstListPointers,Y : CMP.W $1B23,X : BEQ .noChange 
    STA.W $1B47,X 
    STA.W $1B23,X 
    LDA.W #$0001 : STA.W $1B8F,X 

.noChange:
    JSR.W Function_EnemyProjectile_BotwoonsBody_HurtFlashHandling 
    RTS 


Function_EnemyProjectile_BotwoonsBody_HurtFlashHandling:
    LDA.W $19BB,X : ORA.W #$0E00 : STA.W $19BB,X 
    LDA.W $0F9C : BEQ .return 
    LDA.W $0E44 : BIT.W #$0002 
    BEQ .return 
    LDA.W $19BB,X : AND.W #$F1FF : STA.W $19BB,X 

.return:
    RTS 


Function_EnemyProj_BotwoonsBody_HurtFlashHandling_duplicate:
    LDA.W $19BB,Y : ORA.W #$0E00 : STA.W $19BB,Y 
    LDA.W $0F9C : BEQ .return 
    LDA.W $0E44 : BIT.W #$0002 
    BEQ .return 
    LDA.W $19BB,Y : AND.W #$F1FF : STA.W $19BB,Y 

.return:
    RTS 


Function_EnemyProjectile_BotwoonsBody_Dying_SetDelay:
    TXA 
    ASL #2
    CLC : ADC.W #$0060 : STA.W $1AFF,X 
    LDA.W #Function_EnemyProjectile_BotwoonsBody_Dying_Waiting : STA.W $1AB7,X ; fallthrough to Function_EnemyProjectile_BotwoonsBody__Dying_Waiting

Function_EnemyProjectile_BotwoonsBody_Dying_Waiting:
    INC.W $1AFF,X 
    LDA.W $1AFF,X : CMP.W #$0100 : BMI .greaterThanEqualTo100 
    LDA.W #Function_EnemyProjectile_BotwoonsBody_Dying_Falling : STA.W $1AB7,X 

.greaterThanEqualTo100:
    LDA.W #$0000 : STA.W $1B8F,X 
    JSR.W Function_EnemyProjectile_BotwoonsBody_HurtFlashHandling 
    RTS 


Function_EnemyProjectile_BotwoonsBody_Dying_Falling:
    TXY 
    LDA.W $1ADB,Y : AND.W #$FF00 
    XBA 
    ASL #3
    TAX 
    LDA.W $1A6F,Y : CLC : ADC.L CommonEnemyProjectileSpeeds_QuadraticallyIncreasing,X : BCC + 
    PHA 
    LDA.W $1A93,Y 
    INC A 
    STA.W $1A93,Y 
    PLA 

  + STA.W $1A6F,Y 
    LDA.W $1A93,Y : CLC : ADC.L CommonEnemyProjectileSpeeds_QuadraticallyIncreasing+2,X : STA.W $1A93,Y 
    CMP.W #$00C8 : BMI .falling 
    LDA.W #$00C8 : STA.W $1A93,Y 
    LDA.W #RTS_86EB93 : STA.W $1AB7,Y 
    LDA.W #InstList_EnemyProj_MiscDust_1D_BigExplosion : STA.W $1B47,Y 
    LDA.W #$0A00 : STA.W $19BB,Y 
    LDA.W #$0001 : STA.W $1B8F,Y 
    JSR.W Function_EnemyProj_BotwoonsBody_QueueSmallExplosionSoundFX 
    CPY.W #$000A : BNE .return 
    LDA.W #$0001 : STA.L $7E883E 

.return:
    RTS 


.falling:
    LDA.W $1ADB,Y : CLC : ADC.W #$00C0 : STA.W $1ADB,Y 
    LDA.W #$0000 : STA.W $1B8F,Y 
    JSR.W Function_EnemyProj_BotwoonsBody_HurtFlashHandling_duplicate 
    RTS 


RTS_86EB93:
    RTS 


Function_EnemyProj_BotwoonsBody_QueueSmallExplosionSoundFX:
    PHY : PHX 
    LDA.W #$0024 : JSL.L QueueSound_Lib2_Max6 
    PLX : PLY 
    RTS 


EnemyProjectile_BotwoonsBody:
    dw InitAI_EnemyProjectile_BotwoonsBody ; Initialisation AI
    dw PreInstruction_EnemyProjectile_BotwoonsBody ; Initial pre-instruction
    dw InstList_EnemyProjectile_BotwoonsBodyTail_Hidden ; Initial instruction list
    db $02,$02 ; X,Y radius
    dw $E080,$0000 ; Properties, Hit instruction list
    dw InstList_EnemyProjectile_Delete ; Shot instruction list

InstList_EnemyProjectile_BotwoonsSpit:
    dw $0003,EnemyProjSpritemaps_BotwoonsSpit_0 
    dw $0003,EnemyProjSpritemaps_BotwoonsSpit_1 
    dw $0003,EnemyProjSpritemaps_BotwoonsSpit_2 
    dw $0003,EnemyProjSpritemaps_BotwoonsSpit_3 
    dw $0003,EnemyProjSpritemaps_BotwoonsSpit_4 
    dw Instruction_EnemyProjectile_GotoY 
    dw InstList_EnemyProjectile_BotwoonsSpit 

InitAI_EnemyProjectile_BotwoonsSpit:
    PHX 
    LDX.W $0E54 
    LDA.W $0F7A,X : STA.W $1A4B,Y 
    LDA.W $0F7E,X : STA.W $1A93,Y 
    LDA.W #InstList_EnemyProjectile_BotwoonsSpit : STA.W $1B47,Y 
    TYX 
    LDA.W $060B : STA.L $7E97DC,X 
    STA.B $12 ; ($16.$18, $1A.$1C) = ([$14] * |cos([$12] * pi / 80h)|, [$14] * |sin([$12] * pi / 80h)|)
    LDA.W $1993 : STA.B $14 
    JSL.L Do_Some_Math_With_Sine_Cosine_Terrible_Label_Name 
    LDA.B $16 : STA.W $1AB7,Y 
    LDA.B $18 : STA.W $1AFF,Y 
    LDA.B $1A : STA.W $1ADB,Y 
    LDA.B $1C : STA.W $1B23,Y 
    PLX 
    RTS 


PreInstruction_EnemyProjectile_BotwoonsSpit:
    JSR.W Move_EnemyProjectile_AccordingToAngleAndSpeed 
    JSR.W Delete_EnemyProjectile_IfOffScreen_duplicate_again3 
    RTS 


Delete_EnemyProjectile_IfOffScreen_duplicate_again3:
    JSR.W CheckIf_EnemyProjectile_IsOffScreen_duplicate_again5 
    BEQ .return 
    LDA.W #$0000 : STA.W $1997,X 

.return:
    RTS 


CheckIf_EnemyProjectile_IsOffScreen_duplicate_again5:
    LDA.W $1A4B,X : CMP.W $0911 : BMI .returnOffScreen 
    LDA.W $0911 : CLC : ADC.W #$0100 : CMP.W $1A4B,X : BMI .returnOffScreen 
    LDA.W $1A93,X : CMP.W $0915 : BMI .returnOffScreen 
    LDA.W $0915 : CLC : ADC.W #$0100 : CMP.W $1A93,X : BMI .returnOffScreen 
    LDA.W #$0000 
    RTS 


.returnOffScreen:
    LDA.W #$0001 
    RTS 


EnemyProjectile_BotwoonsSpit:
    dw InitAI_EnemyProjectile_BotwoonsSpit ; Initialisation AI
    dw PreInstruction_EnemyProjectile_BotwoonsSpit ; Initial pre-instruction
    dw InstList_EnemyProjectile_BotwoonsSpit ; Initial instruction list
    db $02,$02 ; X,Y radius
    dw $1060,$0000 ; Properties, Hit instruction list
    dw InstList_EnemyProjectile_Delete ; Shot instruction list

InstList_EnemyProjectile_YappingMawsBody_FacingDown:
    dw $0001,EnemyProjSpritemaps_YappingMawsBody_0 
    dw Instruction_EnemyProjectile_Sleep 

InstList_EnemyProjectile_YappingMawsBody_FacingUp:
    dw $0001,EnemyProjSpritemaps_YappingMawsBody_1 
    dw Instruction_EnemyProjectile_Sleep 

InitAI_EnemyProjectile_YappingMawsBody:
    LDX.W $0E54 
    LDA.W $0F7A,X : STA.W $1A4B,Y 
    LDA.W $0F7E,X : STA.W $1A93,Y 
    LDA.W #InstList_EnemyProjectile_YappingMawsBody_FacingUp : STA.W $1B47,Y 
    LDA.W $0FB6,X : BNE .facingUp 
    LDA.W #InstList_EnemyProjectile_YappingMawsBody_FacingDown : STA.W $1B47,Y 

.facingUp:
    PHX 
    LDA.L $7E8808,X 
    ASL A 
    CLC : ADC.W $0E54 : TAX 
    TYA 
    STA.L $7E8800,X 
    PLX 
    RTS 


RTS_86EC94:
    RTS 


EnemyProjectile_YappingMawsBody:
    dw InitAI_EnemyProjectile_YappingMawsBody ; Initialisation AI
    dw RTS_86EC94 ; Initial pre-instruction
    dw InstList_EnemyProjectile_YappingMawsBody_FacingDown ; Initial instruction list
    db $02,$02 ; X,Y radius
    dw $2005,$0000 ; Properties, Hit instruction list
    dw InstList_EnemyProjectile_Delete ; Shot instruction list

InstList_EnemyProjectile_Pickup_HandleRespawningEnemy:
    dw $0040,EnemyProjSpritemaps_Blank_Default 
    dw Instruction_EnemyProjectile_Pickup_HandleRespawningEnemy 
    dw Instruction_EnemyProjectile_Delete 

InstList_EnemyProjectile_EnemyDeathExplosion_BigExplosion_0:
    dw Instruction_EnemyProjectile_TimerInY,$0005 

InstList_EnemyProjectile_EnemyDeathExplosion_BigExplosion_1:
    dw Instruction_EnemyProj_EnemyDeathExpl_SpawnSpriteObjectInY_10,$0003 
    dw Instruction_EnemyProj_EnemyDeathExpl_SpawnSpriteObjectInY_10,$000C 
    dw $0008,EnemyProjSpritemaps_Blank_Default 
    dw Instruction_EnemyProj_EDeathExplo_QueueSmallExplosionSoundFX 
    dw Instruction_EnemyProjectile_DecrementTimer_GotoYIfNonZero 
    dw InstList_EnemyProjectile_EnemyDeathExplosion_BigExplosion_1 
    dw Instruction_EnemyProjectile_EnemyDeathExplosion_BecomePickup 
    dw Instruction_EnemyProjectile_Delete 

InstList_EnemyProj_EnemyDeathExplosion_MiniKraidExplosion_0:
    dw Instruction_EnemyProjectile_TimerInY,$0010 

InstList_EnemyProj_EnemyDeathExplosion_MiniKraidExplosion_1:
    dw Instruction_EnemyProj_EnemyDeathExpl_SpawnSpriteObjectInY_20,$0003 
    dw Instruction_EnemyProj_EnemyDeathExpl_SpawnSpriteObjectInY_20,$000C 
    dw Instruction_EnemyProj_EnemyDeathExpl_SpawnSpriteObjectInY_20,$0015 
    dw $0008,EnemyProjSpritemaps_Blank_Default 
    dw Instruction_EnemyProj_EDeathExplo_QueueSmallExplosionSoundFX 
    dw Instruction_EnemyProjectile_DecrementTimer_GotoYIfNonZero 
    dw InstList_EnemyProj_EnemyDeathExplosion_MiniKraidExplosion_1 
    dw Instruction_EnemyProjectile_EnemyDeathExplosion_BecomePickup 
    dw Instruction_EnemyProjectile_Delete 

Instruction_EnemyProj_EnemyDeathExpl_SpawnSpriteObjectInY_20:
    PHX : PHY 
    JSL.L GenerateRandomNumber 
    AND.W #$003F 
    SEC : SBC.W #$0020 : CLC : ADC.W $1A4B,X : STA.B $12 
    LDA.W $05E5 : AND.W #$3F00 
    XBA 
    SEC : SBC.W #$0020 : CLC : ADC.W $1A93,X : STA.B $14 
    LDA.W $0000,Y : STA.B $16 
    STZ.B $18 
    JSL.L Create_Sprite_Object 
    PLY : PLX 
    INY #2
    RTS 


Instruction_EnemyProj_EnemyDeathExpl_SpawnSpriteObjectInY_10:
    PHX : PHY 
    JSL.L GenerateRandomNumber 
    AND.W #$001F 
    SEC : SBC.W #$0010 : CLC : ADC.W $1A4B,X : STA.B $12 
    LDA.W $05E5 : AND.W #$1F00 
    XBA 
    SEC : SBC.W #$0010 : CLC : ADC.W $1A93,X : STA.B $14 
    LDA.W $0000,Y : STA.B $16 
    STZ.B $18 
    JSL.L Create_Sprite_Object 
    PLY : PLX 
    INY #2
    RTS 


InstList_EnemyProjectile_EnemyDeathExplosion_NormalExplosion:
    dw $0005,EnemyProjSpritemaps_Common_BigExplosion_0 
    dw $0005,EnemyProjSpritemaps_Common_BigExplosion_1 
    dw $0005,EnemyProjSpritemaps_Common_BigExplosion_2 
    dw Instruction_EnemyProj_EnemyDeathExpl_QueueEnemyKilledSoundFX 
    dw $0005,EnemyProjSpritemaps_Common_BigExplosion_3 
    dw $0005,EnemyProjSpritemaps_Common_BigExplosion_4 
    dw $0005,EnemyProjSpritemaps_Common_BigExplosion_5 
    dw Instruction_EnemyProjectile_EnemyDeathExplosion_BecomePickup 
    dw Instruction_EnemyProjectile_Delete 

InstList_EnemyProjectile_EnemyDeathExplosion_SmallExplosion:
    dw $0004,EnemyProjSpritemaps_EnemyDeathExplosion_0 
    dw $0006,EnemyProjSpritemaps_EnemyDeathExplosion_1 
    dw $0005,EnemyProjSpritemaps_EnemyDeathExplosion_2 
    dw Instruction_EnemyProj_EnemyDeathExpl_QueueEnemyKilledSoundFX 
    dw $0005,EnemyProjSpritemaps_EnemyDeathExplosion_3 
    dw $0005,EnemyProjSpritemaps_EnemyDeathExplosion_4 
    dw $0006,EnemyProjSpritemaps_EnemyDeathExplosion_5 
    dw Instruction_EnemyProjectile_EnemyDeathExplosion_BecomePickup 
    dw Instruction_EnemyProjectile_Delete 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_InstList_EnemyProj_EnemyDeathExplo_GotoDelete_86ED87:
    dw Instruction_EnemyProjectile_GotoY 
    dw InstList_EnemyProjectile_Delete 

UNUSED_InstList_EnemyProj_EnemyDeathExplosion_Delete_86ED8B:
    dw Instruction_EnemyProjectile_Delete 
endif ; !FEATURE_KEEP_UNREFERENCED

InstList_EnemyProjectile_Pickup_SmallEnergy:
    dw $0008,EnemyProjSpritemaps_Pickup_EnemyDeathExplosion_4 
    dw $0008,EnemyProjSpritemaps_Pickup_EnemyDeathExplosion_5 
    dw $0008,EnemyProjSpritemaps_Pickup_EnemyDeathExplosion_6 
    dw $0008,EnemyProjSpritemaps_Pickup_EnemyDeathExplosion_7 
    dw Instruction_EnemyProjectile_GotoY 
    dw InstList_EnemyProjectile_Pickup_SmallEnergy 
    dw Instruction_EnemyProjectile_Sleep 

InstList_EnemyProjectile_Pickup_BigEnergy:
    dw $0008,EnemyProjSpritemaps_Pickup_EnemyDeathExplosion_8 
    dw $0008,EnemyProjSpritemaps_Pickup_EnemyDeathExplosion_9 
    dw $0008,EnemyProjSpritemaps_Pickup_EnemyDeathExplosion_A 
    dw $0008,EnemyProjSpritemaps_Pickup_EnemyDeathExplosion_B 
    dw Instruction_EnemyProjectile_GotoY 
    dw InstList_EnemyProjectile_Pickup_BigEnergy 
    dw Instruction_EnemyProjectile_Sleep 

InstList_EnemyProjectile_Pickup_Missiles:
    dw $0005,EnemyProjSpritemaps_Pickup_EnemyDeathExplosion_C 
    dw $0005,EnemyProjSpritemaps_Pickup_EnemyDeathExplosion_D 
    dw Instruction_EnemyProjectile_GotoY 
    dw InstList_EnemyProjectile_Pickup_Missiles 
    dw Instruction_EnemyProjectile_Sleep 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_InstList_EnemyProjectile_Pickup_Bombs_86EDC7:
    dw $0005,UNUSED_EnemyProjSpritemaps_Pickup_Bombs_0_8DC0C9 
    dw $0005,UNUSED_EnemyProjSpritemaps_Pickup_Bombs_1_8DC0D0 
    dw $0005,UNUSED_EnemyProjSpritemaps_Pickup_Bombs_2_8DC0D7 
    dw $0005,UNUSED_EnemyProjSpritemaps_Pickup_Bombs_3_8DC0DE 
    dw Instruction_EnemyProjectile_GotoY 
    dw UNUSED_InstList_EnemyProjectile_Pickup_Bombs_86EDC7 
    dw Instruction_EnemyProjectile_Sleep 
endif ; !FEATURE_KEEP_UNREFERENCED

InstList_EnemyProjectile_Pickup_SuperMissiles:
    dw $0005,EnemyProjSpritemaps_Pickup_EnemyDeathExplosion_E 
    dw $0005,EnemyProjSpritemaps_Pickup_EnemyDeathExplosion_F 
    dw Instruction_EnemyProjectile_GotoY 
    dw InstList_EnemyProjectile_Pickup_SuperMissiles 
    dw Instruction_EnemyProjectile_Sleep 

InstList_EnemyProjectile_Pickup_PowerBombs:
    dw $0005,EnemyProjSpritemaps_Pickup_EnemyDeathExplosion_0 
    dw $0005,EnemyProjSpritemaps_Pickup_EnemyDeathExplosion_1 
    dw $0005,EnemyProjSpritemaps_Pickup_EnemyDeathExplosion_2 
    dw $0005,EnemyProjSpritemaps_Pickup_EnemyDeathExplosion_3 
    dw Instruction_EnemyProjectile_GotoY 
    dw InstList_EnemyProjectile_Pickup_PowerBombs 

InstList_EnemyProj_EnemyDeathExplosion_KilledBySamusContact:
    dw $0002,EnemyProjSpritemaps_EnemyDeathExplosion_6 
    dw $0002,EnemyProjSpritemaps_EnemyDeathExplosion_7 
    dw $0002,EnemyProjSpritemaps_EnemyDeathExplosion_8 
    dw $0002,EnemyProjSpritemaps_EnemyDeathExplosion_9 
    dw $0002,EnemyProjSpritemaps_EnemyDeathExplosion_A 
    dw $0002,EnemyProjSpritemaps_EnemyDeathExplosion_B 
    dw $0002,EnemyProjSpritemaps_EnemyDeathExplosion_C 
    dw Instruction_EnemyProj_EDeathExplo_QueueContactKilledSoundFX 
    dw $0002,EnemyProjSpritemaps_EnemyDeathExplosion_D 
    dw $0002,EnemyProjSpritemaps_EnemyDeathExplosion_E 
    dw $0002,EnemyProjSpritemaps_EnemyDeathExplosion_F 
    dw $0002,EnemyProjSpritemaps_EnemyDeathExplosion_10 
    dw $0002,EnemyProjSpritemaps_EnemyDeathExplosion_11 
    dw $0002,EnemyProjSpritemaps_EnemyDeathExplosion_12 
    dw $0002,EnemyProjSpritemaps_EnemyDeathExplosion_13 
    dw $0002,EnemyProjSpritemaps_EnemyDeathExplosion_14 
    dw $0002,EnemyProjSpritemaps_EnemyDeathExplosion_15 
    dw Instruction_EnemyProjectile_EnemyDeathExplosion_BecomePickup 
    dw Instruction_EnemyProjectile_Delete 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_InstList_EnemyProj_EnemyDeathExplo_KillContact_86EE45:
    dw $0002,UNUSED_EnemyProjSpritemaps_EDeathExplo_KillContact_0_8DB8E5 
    dw $0002,UNUSED_EnemyProjSpritemaps_EDeathExplo_KillContact_1_8DB8F6 
    dw $0002,UNUSED_EnemyProjSpritemaps_EDeathExplo_KillContact_2_8DB907 
    dw $0002,UNUSED_EnemyProjSpritemaps_EDeathExplo_KillContact_3_8DB92C 
    dw $0002,UNUSED_EnemyProjSpritemaps_EDeathExplo_KillContact_4_8DB951 
    dw $0002,UNUSED_EnemyProjSpritemaps_EDeathExplo_KillContact_5_8DB976 
    dw $0002,UNUSED_EnemyProjSpritemaps_EDeathExplo_KillContact_6_8DB99B 
    dw Instruction_EnemyProj_EDeathExplo_QueueContactKilledSoundFX 
    dw $0002,UNUSED_EnemyProjSpritemaps_EDeathExplo_KillContact_7_8DB9B1 
    dw $0002,UNUSED_EnemyProjSpritemaps_EDeathExplo_KillContact_8_8DB9C7 
    dw $0002,UNUSED_EnemyProjSpritemaps_EDeathExplo_KillContact_9_8DB9DD 
    dw $0002,UNUSED_EnemyProjSpritemaps_EDeathExplo_KillContact_A_8DB9F3 
    dw $0002,UNUSED_EnemyProjSpritemaps_EDeathExplo_KillContact_B_8DBA09 
    dw $0002,UNUSED_EnemyProjSpritemaps_EDeathExplo_KillContact_C_8DBA1F 
    dw $0002,UNUSED_EnemyProjSpritemaps_EDeathExplo_KillContact_D_8DBA35 
    dw $0002,UNUSED_EnemyProjSpritemaps_EDeathExplo_KillContact_E_8DBA4B 
    dw $0002,UNUSED_EnemyProjSpritemaps_EDeathExplo_KillContact_F_8DBA61 
    dw Instruction_EnemyProjectile_EnemyDeathExplosion_BecomePickup 
    dw Instruction_EnemyProjectile_Delete 
endif ; !FEATURE_KEEP_UNREFERENCED

Instruction_EnemyProj_EnemyDeathExpl_QueueEnemyKilledSoundFX:
    PHX : PHY 
    LDA.W #$0009 : JSL.L QueueSound_Lib2_Max1 
    PLY : PLX 
    RTS 


Instruction_EnemyProj_EDeathExplo_QueueSmallExplosionSoundFX:
    PHX : PHY 
    LDA.W #$0024 : JSL.L QueueSound_Lib2_Max1 
    PLY : PLX 
    RTS 


Instruction_EnemyProj_EDeathExplo_QueueContactKilledSoundFX:
    PHX : PHY 
    LDA.W #$000B : JSL.L QueueSound_Lib2_Max1 
    PLY : PLX 
    RTS 


Instruction_EnemyProjectile_EnemyDeathExplosion_BecomePickup:
    PHX : PHY 
    JSR.W Random_Drop_Routine 
    BEQ .nothingDrop 
    CMP.W #$0006 : BPL .nothingDrop 
    ASL A 
    STA.W $1AFF,X 
    TAY 
    LDA.W EnemyProjectile_Pickup_InstListPointers,Y : STA.W $1B47,X 
    LDA.W #$0001 : STA.W $1B8F,X 
    LDA.W #$0190 : STA.W $1B23,X 
    LDA.W #PreInstruction_EnemyProjectile_Pickup : STA.W $1A03,X 
    LDA.W $1BD7,X : AND.W #$BFFF : STA.W $1BD7,X 
    LDA.W $1B47,X 
    PLY : PLX 
    TAY 
    RTS 


.nothingDrop:
    LDA.W #$0001 : STA.W $1B8F,X 
    LDA.W #$3000 : STA.W $1BD7,X 
    LDA.W #RTS_86EFDF : STA.W $1A03,X 
    LDA.W #InstList_EnemyProjectile_Pickup_HandleRespawningEnemy : STA.W $1B47,X 
    PLY : PLX 
    TAY 
    RTS 


EnemyProjectile_Pickup_InstListPointers:
    dw $0000 
    dw InstList_EnemyProjectile_Pickup_SmallEnergy 
    dw InstList_EnemyProjectile_Pickup_BigEnergy 
    dw InstList_EnemyProjectile_Pickup_PowerBombs 
    dw InstList_EnemyProjectile_Pickup_Missiles 
    dw InstList_EnemyProjectile_Pickup_SuperMissiles 

Instruction_EnemyProjectile_Pickup_HandleRespawningEnemy:
    PHY : PHX 
    LDA.L $7EF410,X : CMP.W #$FFFF : BEQ .return 
    BIT.W #$8000 
    BEQ .return 
    AND.W #$7FFF 
    JSR.W Respawn_Enemy 

.return:
    PLX : PLY 
    RTS 


InitAI_EnemyProjectile_Pickup:
    PHX : PHY 
    LDA.B $12 : STA.W $1A4B,Y 
    LDA.B $14 : STA.W $1A93,Y 
    LDA.W #$0000 : STA.W $19BB,Y 
    LDA.W $0E24 : STA.L $7EF3C8,X 
    JSR.W Random_Drop_Routine 
    BEQ .nothingDrop 
    CMP.W #$0006 : BPL .nothingDrop 
    ASL A 
    STA.W $1AFF,Y 
    TAX 
    LDA.W EnemyProjectile_Pickup_InstListPointers,X : STA.W $1B47,Y 
    LDA.W #$0001 : STA.W $1B8F,Y 
    LDA.W #$0190 : STA.W $1B23,Y 
    TYX 
    LDA.W #$FFFF : STA.L $7EF410,X 
    PLY : PLX 
    RTS 


.nothingDrop:
    LDA.W #InstList_EnemyProjectile_Pickup_HandleRespawningEnemy : STA.W $1B47,Y 
    LDA.W #$0001 : STA.W $1B8F,Y 
    LDA.W #$3000 : STA.W $1BD7,Y 
    LDA.W #RTS_86EFDF : STA.W $1A03,Y 
    PLY : PLX 
    RTS 


InitAI_EnemyProjectile_EnemyDeathExplosion:
    PHX : PHY 
    TYX 
    LDY.W $0E54 
    LDA.W $0F7A,Y : STA.W $1A4B,X 
    LDA.W $0F7E,Y : STA.W $1A93,X 
    LDA.W $0E54 : STA.L $7EF410,X 
    LDA.W $0F86,Y : BIT.W #$4000 
    BEQ .noRespawn 
    LDA.W $0E54 : ORA.W #$8000 : STA.L $7EF410,X 

.noRespawn:
    LDA.W $0F78,Y : STA.L $7EF3C8,X 
    LDA.W #$0000 : STA.W $19BB,X 
    LDA.W $1993 
    ASL A 
    TAY 
    LDA.W .InstListPointers,Y : STA.W $1B47,X 
    LDA.W #$0001 : STA.W $1B8F,X 
    PLY : PLX 
    RTS 


.InstListPointers:
    dw InstList_EnemyProjectile_EnemyDeathExplosion_SmallExplosion 
    dw InstList_EnemyProj_EnemyDeathExplosion_KilledBySamusContact 
    dw InstList_EnemyProjectile_EnemyDeathExplosion_NormalExplosion 
    dw InstList_EnemyProj_EnemyDeathExplosion_MiniKraidExplosion_0 
    dw InstList_EnemyProjectile_EnemyDeathExplosion_BigExplosion_0 

RTS_86EFDF:
    RTS 


PreInstruction_EnemyProjectile_Pickup:
    PHX : PHY 
    DEC.W $1B23,X 
    LDA.W $1B23,X : BEQ .timerExpired 
    LDA.W #$000D : JSL.L Run_Samus_Command 
    AND.W #$FFFF 
    BEQ .notGrappled 
    LDA.W $1B23,X : CMP.W #$0180 : BPL .notGrappled 
    LDA.W $1A4B,X : SEC : SBC.W $0D08 : BPL + 
    EOR.W #$FFFF 
    INC A 

  + CMP.W #$0010 : BPL .notGrappled 
    LDA.W $1A93,X : SEC : SBC.W $0D0C : BPL + 
    EOR.W #$FFFF 
    INC A 

  + CMP.W #$0010 : BPL .notGrappled 
    PHX 
    LDA.W $1AFF,X 
    TAX 
    JSR.W (.functionPointers,X) 
    PLX 

.timerExpired:
    LDA.W #InstList_EnemyProjectile_Pickup_HandleRespawningEnemy : STA.W $1B47,X 
    LDA.W #$0001 : STA.W $1B8F,X 
    LDA.W #$3000 : STA.W $1BD7,X 
    LDA.W #RTS_86EFDF : STA.W $1A03,X 
    BRA .return 


.notGrappled:
    LDA.W $1BB3,X : AND.W #$00FF : STA.W $0E20 
    LDA.W $1BB4,X : AND.W #$00FF : STA.W $0E22 
    LDA.W $0AF6 : SEC : SBC.W $1A4B,X : BPL + 
    EOR.W #$FFFF 
    INC A 

  + SEC : SBC.W $0AFE : BCC + 
    CMP.W $0E20 : BCS .return 

  + LDA.W $0AFA : SEC : SBC.W $1A93,X : BPL + 
    EOR.W #$FFFF 
    INC A 

  + SEC : SBC.W $0B00 : BCC + 
    CMP.W $0E22 : BCC + 
    BRA .return 


  + PHX 
    LDA.W $1AFF,X 
    TAX 
    JSR.W (.functionPointers,X) 
    PLX 
    LDA.W #InstList_EnemyProjectile_Pickup_HandleRespawningEnemy : STA.W $1B47,X 
    LDA.W #$0001 : STA.W $1B8F,X 
    LDA.W #$3000 : STA.W $1BD7,X 
    LDA.W #RTS_86EFDF : STA.W $1A03,X 

.return:
    PLY : PLX 
    RTS 


.functionPointers:
    dw $0000 
    dw Function_EnemyProjectile_Pickup_ApplySmallEnergy ; 2: Small health
    dw Function_EnemyProjectile_Pickup_ApplyBigEnergy ; 4: Big health
    dw Function_EnemyProjectile_Pickup_ApplyPowerBombs ; 6: Power bombs
    dw Function_EnemyProjectile_Pickup_ApplyMissiles ; 8: Missiles
    dw Function_EnemyProjectile_Pickup_ApplySuperMissiles ; Ah: Super missiles
    dw $0000 

Function_EnemyProjectile_Pickup_ApplySmallEnergy:
    LDA.W #$0005 : JSL.L Restore_A_Energy_ToSamus 
    LDA.W #$0001 : JSL.L QueueSound_Lib2_Max1 
    RTS 


Function_EnemyProjectile_Pickup_ApplyBigEnergy:
    LDA.W #$0014 : JSL.L Restore_A_Energy_ToSamus 
    LDA.W #$0002 : JSL.L QueueSound_Lib2_Max1 
    RTS 


Function_EnemyProjectile_Pickup_ApplyPowerBombs:
    LDA.W #$0001 : JSL.L Restore_A_PowerBombs_ToSamus 
    LDA.W #$0005 : JSL.L QueueSound_Lib2_Max1 
    RTS 


Function_EnemyProjectile_Pickup_ApplyMissiles:
    LDA.W #$0002 : JSL.L Restore_A_Missiles_ToSamus 
    LDA.W #$0003 : JSL.L QueueSound_Lib2_Max1 
    RTS 


Function_EnemyProjectile_Pickup_ApplySuperMissiles:
    LDA.W #$0001 : JSL.L Restore_A_SuperMissiles_ToSamus 
    LDA.W #$0004 : JSL.L QueueSound_Lib2_Max1 
    RTS 


Random_Drop_Routine:
    PHX : PHY : PHB : PEA.W EnemyHeaders>>8&$FF00 
    PLB : PLB 
    LDA.L $7EF410,X : AND.W #$7FFF : STA.W $0E2A 
    LDA.L $7EF3C8,X 
    TAX 
    STA.W $0E28 
    LDA.L EnemyHeaders_dropChances-(EnemyHeaders&$00FFFF),X ; $A0003A
    TAX 
    BNE .enemyHasDrops 
    JMP.W .returnNothing 


.enemyHasDrops:
    JSL.L GenerateRandomNumber 
    AND.W #$00FF 
    BEQ .enemyHasDrops 
    STA.B $1A 
    LDA.W #$00FF : STA.B $14 
    STZ.B $18 
    LDY.W #$0001 
    LDA.W $09C2 : CLC : ADC.W $09D6 : CMP.W #$001E : BCC .healthBombFlag 
    CMP.W #$0032 : BCC .gracePeriod 
    DEY 

.healthBombFlag:
    STY.W $0E1A 

.gracePeriod:
    SEP #$20 
    LDA.W $0E1A : BEQ .noHealthBomb 
    LDA.L EnemyDropChances_smallEnergy-(EnemyDropChances&$00FFFF),X ; $B40000
    CLC : ADC.L EnemyDropChances_bigEnergy-(EnemyDropChances&$00FFFF),X ; $B40001
    STA.B $12 
    LDA.B #$03 : STA.B $16 
    JMP.W .dropChancesPooled 


.noHealthBomb:
    LDA.L $B40003,X : STA.B $12 
    LDA.B #$08 : STA.B $16 
    LDY.W $09C2 
    CPY.W $09C4 : BNE .energyAllowed 
    LDY.W $09D6 
    CPY.W $09D4 : BEQ .fullEnergy 

.energyAllowed:
    LDA.B $12 : CLC : ADC.L EnemyDropChances_smallEnergy-(EnemyDropChances&$00FFFF),X ; $B40000
    ADC.L EnemyDropChances_bigEnergy-(EnemyDropChances&$00FFFF),X ; $B40001
    STA.B $12 
    LDA.B $16 : ORA.B #$03 : STA.B $16 

.fullEnergy:
    LDY.W $09C6 
    CPY.W $09C8 : BEQ .checkSuperMissiles 
    LDA.B $12 : CLC : ADC.L EnemyDropChances_missiles-(EnemyDropChances&$00FFFF),X ; $B40002
    STA.B $12 
    LDA.B $16 : ORA.B #$04 : STA.B $16 

.checkSuperMissiles:
    LDY.W $09CA 
    CPY.W $09CC : BEQ .checkPowerBombs 
    LDA.B $14 : SEC : SBC.L EnemyDropChances_superMissiles-(EnemyDropChances&$00FFFF),X ; $B40004
    STA.B $14 
    LDA.B $16 : ORA.B #$10 : STA.B $16 

.checkPowerBombs:
    LDY.W $09CE 
    CPY.W $09D0 : BEQ .dropChancesPooled 
    LDA.B $14 : SEC : SBC.L EnemyDropChances_powerBombs-(EnemyDropChances&$00FFFF),X ; $B40005
    STA.B $14 
    LDA.B $16 : ORA.B #$20 : STA.B $16 

.dropChancesPooled:
    LDY.W #$0000 

.loopMinorDrops:
    SEP #$20 
    LDA.B $12 : BEQ .noMinorDrops 
    LSR.B $16 
    BCC .nextMinorDrop 
    LDA.B $14 : STA.W $4202 
    LDA.L EnemyDropChances_smallEnergy-(EnemyDropChances&$00FFFF),X ; $B40000
    STA.W $4203 
    PHY 
    NOP #2
    LDY.W $4216 
    STY.W $4204 
    LDA.B $12 : STA.W $4206 
    PLY 
    NOP 
    REP #$20 
    LDA.B $18 : CLC : ADC.W $4214 : CMP.B $1A : BCS .return 
    STA.B $18 

.nextMinorDrop:
    INX 
    INY 
    CPY.W #$0004 : BNE .loopMinorDrops 
    BRA .loopMajorDrops 


.noMinorDrops:
    LDA.B $16 
    LSR #4
    STA.B $16 
    INX #4
    LDY.W #$0004 

.loopMajorDrops:
    SEP #$20 
    LSR.B $16 
    BCC .nextMajorDrop 
    REP #$20 
    LDA.L EnemyDropChances_smallEnergy-(EnemyDropChances&$00FFFF),X ; $B40000
    AND.W #$00FF 
    CLC : ADC.B $18 : CMP.B $1A : BCS .return 
    STA.B $18 

.nextMajorDrop:
    INX 
    INY 
    CPY.W #$0006 : BNE .loopMajorDrops 

.returnNothing:
    LDY.W #$0003 

.return:
    REP #$20 
    TYX 
    LDA.L .drops,X : AND.W #$00FF 
    PLB : PLY : PLX 
    RTS 


.drops: 
    db $01 ; Small health
    db $02 ; Big health
    db $04 ; Missiles
    db $06 ; Nothing
    db $05 ; Super missiles
    db $03 ; Power bombs

Respawn_Enemy:
    PHB : PHX : PHY : PEA.W $A000 
    PLB : PLB 
    REP #$30 
    STA.W $0E54 
    LSR #2
    CLC : ADC.W $07CF : TAX 
    LDY.W $0E54 
    LDA.L $A10000,X : STA.W $0F78,Y 
    LDA.L $A10002,X : STA.W $0F7A,Y 
    LDA.L $A10004,X : STA.W $0F7E,Y 
    LDA.L $A10006,X : STA.W $0F92,Y 
    LDA.L $A10008,X : STA.W $0F86,Y 
    LDA.L $A1000A,X : STA.W $0F88,Y 
    LDA.L $A1000C,X : STA.W $0FB4,Y 
    LDA.L $A1000E,X : STA.W $0FB6,Y 
    PHX 
    TYX 
    LDA.L $7E7008,X : STA.W $0F96,X 
    LDA.L $7E7006,X : STA.W $0F98,X 
    PLX 
    LDA.W #$0000 : STA.W $0F9E,Y 
    STA.W $0F9C,Y 
    STA.W $0FA0,Y 
    STA.W $0F90,Y 
    STA.W $0FA4,Y 
    STA.W $0FA8,Y 
    STA.W $0FAA,Y 
    STA.W $0FAC,Y 
    STA.W $0FAE,Y 
    STA.W $0FB0,Y 
    STA.W $0FB2,Y 
    LDA.W #$0001 : STA.W $0F94,Y 
    LDX.W $0E54 
    LDA.W $0F78,X 
    TAX 
    LDA.W $0012,X : STA.W $1784 
    LDA.W $0008,X : STA.W $0F82,Y 
    LDA.W $000A,X : STA.W $0F84,Y 
    LDA.W $0004,X : STA.W $0F8C,Y 
    LDA.W $0039,X : AND.W #$00FF : STA.W $0F9A,Y 
    LDA.W $000C,X : STA.W $0FA6,Y 
    STA.W $1786 
    JSL.L .executeEnemyInitAI 
    PLY : PLX : PLB 
    RTS 


.executeEnemyInitAI:
    LDX.W $0E54 
    LDA.W $0FA6,X : STA.W $1786 
    XBA 
    PHA : PLB : PLB 
    JML.W [$1784] 


EnemyProjectile_EnemyDeathPickup:
    dw InitAI_EnemyProjectile_Pickup ; Initialisation AI
    dw PreInstruction_EnemyProjectile_Pickup ; Initial pre-instruction
    dw InstList_EnemyProjectile_Pickup_SmallEnergy ; Initial instruction list
    db $10,$10 ; X,Y radius
    dw $3000 ; Properties
    dw InstList_EnemyProjectile_Delete ; Hit instruction list
    dw InstList_EnemyProjectile_Delete ; Shot instruction list

EnemyProjectile_EnemyDeathExplosion:
    dw InitAI_EnemyProjectile_EnemyDeathExplosion ; Initialisation AI
    dw RTS_86EFDF ; Initial pre-instruction
    dw InstList_EnemyProjectile_Pickup_SmallEnergy ; Initial instruction list
    db $10,$10 ; X,Y radius
    dw $7000 ; Properties
    dw InstList_EnemyProjectile_Delete ; Hit instruction list
    dw InstList_EnemyProjectile_Delete ; Shot instruction list

InstList_EnemyProjectile_FallingSpark_Falling:
    dw $0003,EnemyProjSpritemaps_Sparks_0 
    dw $0003,EnemyProjSpritemaps_Sparks_1 
    dw $0003,EnemyProjSpritemaps_Sparks_2 
    dw Instruction_EnemyProjectile_GotoY 
    dw InstList_EnemyProjectile_FallingSpark_Falling 

InstList_EnemyProjectile_FallingSpark_HitFloor:
    dw $0001,EnemyProjSpritemaps_Sparks_0 
    dw $0001,EnemyProjSpritemaps_Blank_Default 
    dw $0001,EnemyProjSpritemaps_Sparks_0 
    dw $0001,EnemyProjSpritemaps_Blank_Default 
    dw $0001,EnemyProjSpritemaps_Sparks_1 
    dw $0001,EnemyProjSpritemaps_Blank_Default 
    dw $0001,EnemyProjSpritemaps_Sparks_1 
    dw $0001,EnemyProjSpritemaps_Blank_Default 
    dw $0001,EnemyProjSpritemaps_Sparks_2 
    dw $0001,EnemyProjSpritemaps_Blank_Default 
    dw $0001,EnemyProjSpritemaps_Sparks_2 
    dw Instruction_EnemyProjectile_Delete 

InitAI_EnemyProjectile_FallingSpark:
    LDX.W $0E54 
    LDA.W #InstList_EnemyProjectile_FallingSpark_Falling : STA.W $1B47,Y 
    LDA.W $0F7A,X : STA.W $1A4B,Y 
    LDA.W $0F7C,X : STA.W $1A27,Y 
    LDA.W $0F7E,X : CLC : ADC.W #$0008 : STA.W $1A93,Y 
    LDA.W $0F80,X : STA.W $1A6F,Y 
    LDA.W #$0000 : STA.W $1AB7,Y 
    STA.W $1ADB,Y 
    JSL.L GenerateRandomNumber 
    AND.W #$001C 
    TAX 
    LDA.W .distance,X : STA.W $1B23,Y 
    LDA.W .subdistance,X : STA.W $1AFF,Y 
    RTS  
  .distance
    dw $FFFF 
  .subdistance
    dw       $B800 
    dw $FFFF,$C000
    dw $FFFF,$E000
    dw $FFFF,$FF00
    dw $0000,$0100
    dw $0000,$2000
    dw $0000,$4000


PreInstruction_EnemyProjectile_FallingSpark:
    LDA.W $1ADB,X : BMI .positiveVelocity 
    JSR.W Move_EnemyProjectile_Vertically 
    BCS .hitFloor 
    CLC 
    LDA.W $1AB7,X : ADC.W #$4000 : STA.W $1AB7,X 
    LDA.W $1ADB,X : ADC.W #$0000 : CMP.W #$0004 : BCS .positiveVelocity 
    STA.W $1ADB,X 

.positiveVelocity:
    CLC 
    LDA.W $1A6F,X : ADC.W $1AB7,X : STA.W $1A6F,X 
    LDA.W $1A93,X : ADC.W $1ADB,X : STA.W $1A93,X 
    CLC 
    LDA.W $1A27,X : ADC.W $1AFF,X : STA.W $1A27,X 
    LDA.W $1A4B,X : ADC.W $1B23,X : STA.W $1A4B,X 
    LDA.W $05B5 : BIT.W #$0003 
    BNE .return 
    LDA.W $1A4B,X : STA.B $12 
    LDA.W $1A93,X : STA.B $14 
    LDA.W #$0030 : STA.B $16 
    LDA.W $19BB,X : STA.B $18 
    JSL.L Create_Sprite_Object 

.return:
    RTS 


.hitFloor:
    LDA.W #InstList_EnemyProjectile_FallingSpark_HitFloor : STA.W $1B47,X 
    LDA.W #$0001 : STA.W $1B8F,X 
    LDA.W $1AFF,X 
    ASL A 
    STA.W $1AFF,X 
    LDA.W $1B23,X 
    ROL A 
    STA.W $1B23,X 
    LDA.W $1AFF,X 
    ASL A 
    STA.W $1AFF,X 
    LDA.W $1B23,X 
    ROL A 
    STA.W $1B23,X 
    LDA.W #$8000 : STA.W $1AB7,X 
    LDA.W #$FFFF : STA.W $1ADB,X 
    LDA.W $1A93,X : SEC : SBC.W #$0002 : STA.W $1A93,X 
    RTS 


EnemyProjectile_FallingSpark:
    dw InitAI_EnemyProjectile_FallingSpark ; Initialisation AI
    dw PreInstruction_EnemyProjectile_FallingSpark ; Initial pre-instruction
    dw InstList_EnemyProjectile_FallingSpark_Falling ; Initial instruction list
    db $04,$04 ; X,Y radius
    dw $0005,$0000 ; Properties, Hit instruction list
    dw InstList_EnemyProjectile_Delete ; Shot instruction list

Freespace_Bank86_F4A6: 
; $B5A bytes
