
org $868000


;;; $8000: Enable enemy projectiles ;;;
Enable_Enemy_Projectiles:
    PHP
    REP #$20
    LDA.W #$8000 : TSB.W EnemyProjectile_Enable
    PLP
    RTL


;;; $800B: Disable enemy projectiles ;;;
Disable_Enemy_Projectiles:
    PHP
    REP #$20
    LDA.W #$8000 : TRB.W EnemyProjectile_Enable
    PLP
    RTL


;;; $8016: Clear enemy projectiles ;;;
Clear_Enemy_Projectiles:
    PHP
    REP #$30
    PHX
    LDX.W #$0022

  .loop:
    STZ.W EnemyProjectile_ID,X
    DEX #2 : BPL .loop
    PLX : PLP
    RTL


;;; $8027: Spawn enemy projectile [Y] with parameter [A] using enemy [X] graphics ;;;
SpawnEnemyProjectileY_ParameterA_XGraphics:
;; Parameters:
;;     A: Enemy projectile initialisation parameter
;;     X: Enemy index, determines enemy projectile graphics indices
;;     Y: Enemy projectile ID
;; Returns:
;;     Carry: Set if enemy projectile could not be spawned
;;     A: Enemy projectile index if spawned
    PHP : PHB : PHX : PHY
    STA.W EnemyProjectile_InitParam0
    PHK : PLB
    LDA.W Enemy.palette,X : ORA.W Enemy.GFXOffset,X : PHA
    TYX
    LDY.W #$0022

  .loop:
    LDA.W EnemyProjectile_ID,Y : BEQ .found
    DEY #2
    BPL .loop
    PLA : PLY : PLX : PLB : PLP
    SEC
    RTL

  .found:
    PLA : STA.W EnemyProjectile_GraphicsIndices,Y
    TXA : STA.W EnemyProjectile_ID,Y
    LDA.W $0002,X : STA.W EnemyProjectile_PreInstructions,Y
    LDA.W $0004,X : STA.W EnemyProjectile_InstListPointers,Y
    LDA.W $0006,X : STA.W EnemyProjectile_Radii,Y
    LDA.W $0008,X : STA.W EnemyProjectile_Properties,Y
    LDA.W #$0001 : STA.W EnemyProjectile_InstructionTimers,Y
    LDA.W #EnemyProjSpritemaps_Blank_Default : STA.W EnemyProjectile_SpritemapPointers,Y
    LDA.W #$0000 : STA.W EnemyProjectile_Var0,Y : STA.W EnemyProjectile_Var1,Y : STA.W EnemyProjectile_Timers,Y
    STA.W EnemyProjectile_XSubPositions,Y : STA.W EnemyProjectile_YSubPositions,Y : STA.W EnemyProjectile_CollidedProjectileType,Y
    PHY
    JSR.W ($0000,X)
    PLA : PLY : PLX : PLB : PLP
    CLC
    RTL


;;; $8097: Spawn enemy projectile [Y] with parameter [A] using room graphics ;;;
SpawnEnemyProjectileY_ParameterA_RoomGraphics:
;; Parameters:
;;     A: Enemy projectile initialisation parameter
;;     Y: Enemy projectile ID
;; Returns:
;;     Carry: Set if enemy projectile could not be spawned
;;     A: Enemy projectile index if spawned

; (0 used for palette and graphics index)
; Used by some enemies, also gate PLMs
    PHP : PHB : PHX : PHY
    STA.W EnemyProjectile_InitParam0
    PHK : PLB
    TYX
    LDY.W #$0022

  .loop:
    LDA.W EnemyProjectile_ID,Y : BEQ .found
    DEY #2 : BPL .loop
    PLY : PLX : PLB : PLP
    SEC
    RTL

  .found:
    LDA.W #$0000 : STA.W EnemyProjectile_GraphicsIndices,Y
    TXA : STA.W EnemyProjectile_ID,Y
    LDA.W $0002,X : STA.W EnemyProjectile_PreInstructions,Y
    LDA.W $0004,X : STA.W EnemyProjectile_InstListPointers,Y
    LDA.W $0006,X : STA.W EnemyProjectile_Radii,Y
    LDA.W $0008,X : STA.W EnemyProjectile_Properties,Y
    LDA.W #$0001 : STA.W EnemyProjectile_InstructionTimers,Y
    LDA.W #EnemyProjSpritemaps_Blank_Default : STA.W EnemyProjectile_SpritemapPointers,Y
    LDA.W #$0000 : STA.W EnemyProjectile_Var0,Y : STA.W EnemyProjectile_Var1,Y
    STA.W EnemyProjectile_Timers,Y : STA.W EnemyProjectile_Timers,Y ; >.<
    STA.W EnemyProjectile_XSubPositions,Y : STA.W EnemyProjectile_YSubPositions,Y
    STA.W EnemyProjectile_CollidedProjectileType,Y
    PHY
    JSR.W ($0000,X)
    PLA : PLY : PLX : PLB : PLP
    CLC
    RTL


;;; $8104: Enemy projectile handler ;;;
Enemy_Projectile_Handler:
    PHP : PHB
    PHK : PLB
    BIT.W EnemyProjectile_Enable : BPL .return
    LDX.W #$0022

  .loop:
    STX.W EnemyProjectile_Index
    LDA.W EnemyProjectile_ID,X : BEQ .next
    JSR Process_Enemy_Projectile
    LDX.W EnemyProjectile_Index

  .next:
    DEX #2 : BPL .loop

  .return:
    PLB : PLP
    RTL


;;; $8125: Process enemy projectile ;;;
Process_Enemy_Projectile:
;; Parameters:
;;     X: Enemy projectile index

; Some instructions (e.g. sleep) pop the return address pushed to the stack by $813C to return out of *this* routine
; (marked "terminate processing enemy projectile")
    JSR.W (EnemyProjectile_PreInstructions,X)
    LDX.W EnemyProjectile_Index
    DEC.W EnemyProjectile_InstructionTimers,X : BNE .return
    LDY.W EnemyProjectile_InstListPointers,X

  .loop:
    LDA.W $0000,Y : BPL .timer
    STA.B DP_Temp12
    INY #2
    PEA .loop-1
    JMP.W (DP_Temp12)

  .timer:
    STA.W EnemyProjectile_InstructionTimers,X
    LDA.W $0002,Y : STA.W EnemyProjectile_SpritemapPointers,X
    TYA : CLC : ADC.W #$0004 : STA.W EnemyProjectile_InstListPointers,X

  .return:
    RTS


;;; $8154: Instruction - delete ;;;
Instruction_EnemyProjectile_Delete:
;; Parameters:
;;     X: Enemy projectile index
    STZ.W EnemyProjectile_ID,X
    PLA
    RTS


;;; $8159: Instruction - sleep ;;;
Instruction_EnemyProjectile_Sleep:
;; Parameters:
;;     X: Enemy projectile index
;;     Y: Pointer to after this instruction
    DEY #2 : TYA : STA.W EnemyProjectile_InstListPointers,X
    PLA
    RTS


;;; $8161: Instruction - pre-instruction = [[Y]] ;;;
Instruction_EnemyProjectile_PreInstructionInY:
;; Parameters:
;;     X: Enemy projectile index
;;     Y: Pointer to instruction arguments
;; Returns:
;;     Y: Pointer to next instruction
    LDA.W $0000,Y : STA.W EnemyProjectile_PreInstructions,X
    INY #2
    RTS


;;; $816A: Instruction - clear pre-instruction ;;;
Instruction_EnemyProjectile_ClearPreInstruction:
;; Parameters:
;;     X: Enemy projectile index
    LDA.W #.return : STA.W EnemyProjectile_PreInstructions,X

  .return:
    RTS


;;; $8171: Instruction - call external function [[Y]] ;;;
Instruction_EnemyProjectile_CallExternalFunctionInY:
;; Parameters:
;;     Y: Pointer to instruction arguments
;; Returns:
;;     Y: Pointer to next instruction
    LDA.W $0000,Y : STA.B DP_Temp12
    LDA.W $0001,Y : STA.B DP_Temp13
    PHY
    JSL .externalFunction
    PLY
    LDX.W EnemyProjectile_Index
    INY #3
    RTS

  .externalFunction:
    JML.W [DP_Temp12]


if !FEATURE_KEEP_UNREFERENCED
;;; $818B: Unused. Instruction - call external function [[Y]] with 2 byte parameter [[Y] + 3] ;;;
UNUSED_Inst_EnemyProjectile_CallExternalFuncWith2ByteParam:
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
    LDX.W EnemyProjectile_Index
    TYA : CLC : ADC.W #$0005 : TAY
    RTS

  .externalFunction:
    JML.W [DP_Temp12]
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $81AB: Instruction - go to [[Y]] ;;;
Instruction_EnemyProjectile_GotoY:
;; Parameters:
;;     Y: Pointer to instruction arguments
;; Returns:
;;     Y: Pointer to next instruction
    LDA.W $0000,Y : TAY
    RTS


;;; $81B0: Instruction - go to [Y] + ±[[Y]] ;;;
Instruction_EnemyProjectile_GotoY_Y:
;; Parameters:
;;     Y: Pointer to instruction arguments
;; Returns:
;;     Y: Pointer to next instruction
    STY.B DP_Temp12
    DEY
    LDA.W $0000,Y : XBA : BMI .highByte
    AND.W #$00FF
    BRA +

  .highByte:
    ORA.W #$FF00

+   CLC : ADC.B DP_Temp12 : TAY
    RTS


;;; $81C6: Instruction - decrement timer and go to [[Y]] if non-zero ;;;
Instruction_EnemyProjectile_DecrementTimer_GotoYIfNonZero:
;; Parameters:
;;     X: Enemy projectile index
;;     Y: Pointer to instruction arguments
;; Returns:
;;     Y: Pointer to next instruction
    DEC.W EnemyProjectile_Timers,X : BNE Instruction_EnemyProjectile_GotoY
    INY #2
    RTS


if !FEATURE_KEEP_UNREFERENCED
;;; $81CE: Unused. Instruction - decrement timer and go to [Y] + ±[[Y]] if non-zero ;;;
UNUSED_Inst_EnemyProj_DecrementTimer_GotoY_YIfNonZero_8681CE:
;; Parameters:
;;     X: Enemy projectile index
;;     Y: Pointer to instruction arguments
;; Returns:
;;     Y: Pointer to next instruction
    DEC.W EnemyProjectile_Timers,X : BNE Instruction_EnemyProjectile_GotoY_Y
    INY
    RTS
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $81D5: Instruction - timer = [[Y]] ;;;
Instruction_EnemyProjectile_TimerInY:
;; Parameters:
;;     X: Enemy projectile index
;;     Y: Pointer to instruction arguments
;; Returns:
;;     Y: Pointer to next instruction
    LDA.W $0000,Y : STA.W EnemyProjectile_Timers,X
    INY #2
    RTS


;;; $81DE: RTS. Instruction - NOP ;;;
RTS_8681DE:
    RTS


;;; $81DF: Instruction - move randomly within X radius [[Y]] - [[Y] - 1] and Y radius [[Y] - 2] - [[Y] - 3] ;;;
Instruction_MoveRandomlyWithinXRadius_YRadius:
;; Parameters:
;;     X: Enemy projectile index
;;     Y: Pointer to instruction arguments
;; Returns:
;;     Y: Pointer to next instruction

; Assumes [[Y]] + 1 and [[Y] + 2] + 1 are powers of 2
    JSL GenerateRandomNumber
    STA.B DP_Temp12

  .loopX:
    JSL GenerateRandomNumber
    SEP #$20
    AND.W $0000,Y : SEC : SBC.W $0001,Y
    REP #$20
    BMI .loopX
    AND.W #$00FF : BIT.B DP_Temp12 : BPL .Xpos
    EOR.W #$FFFF : INC

  .Xpos:
    CLC : ADC.W EnemyProjectile_XPositions,X : STA.W EnemyProjectile_XPositions,X

  .loopY:
    JSL GenerateRandomNumber
    SEP #$20
    AND.W $0002,Y : SEC : SBC.W $0003,Y
    REP #$20
    BMI .loopY
    AND.W #$00FF : BIT.B DP_Temp12 : BVC .Ypos
    EOR.W #$FFFF : INC

  .Ypos:
    CLC : ADC.W EnemyProjectile_YPositions,X : STA.W EnemyProjectile_YPositions,X
    INY #4
    RTS


;;; $8230: Instruction - enemy projectile properties |= [[Y]] ;;;
Instruction_EnemyProjectile_Properties_OrY:
;; Parameters:
;;     X: Enemy projectile index
;;     Y: Pointer to instruction arguments
;; Returns:
;;     Y: Pointer to next instruction
    LDA.W EnemyProjectile_Properties,X : ORA.W $0000,Y : STA.W EnemyProjectile_Properties,X
    INY #2
    RTS


;;; $823C: Instruction - enemy projectile properties &= [[Y]] ;;;
Instruction_EnemyProjectile_Properties_AndY:
;; Parameters:
;;     X: Enemy projectile index
;;     Y: Pointer to instruction arguments
;; Returns:
;;     Y: Pointer to next instruction
    LDA.W EnemyProjectile_Properties,X : AND.W $0000,Y : STA.W EnemyProjectile_Properties,X
    INY #2
    RTS


if !FEATURE_KEEP_UNREFERENCED
;;; $8248: Unused. Instruction - enable collision with Samus projectiles ;;;
UNUSED_Inst_EnemyProj_EnableCollisionWithSamusProj_868248:
;; Parameters:
;;     X: Enemy projectile index
    LDA.W EnemyProjectile_Properties,X : ORA.W #$8000 : STA.W EnemyProjectile_Properties,X
    RTS
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $8252: Instruction - disable collision with Samus projectiles ;;;
Instruction_EnemyProjectile_DisableCollisionWIthSamusProj:
;; Parameters:
;;     X: Enemy projectile index
    LDA.W EnemyProjectile_Properties,X : AND.W #$7FFF : STA.W EnemyProjectile_Properties,X
    RTS


;;; $825C: Instruction - disable collision with Samus ;;;
Instruction_EnemyProjectile_DisableCollisionWithSamus:
;; Parameters:
;;     X: Enemy projectile index
    LDA.W EnemyProjectile_Properties,X : ORA.W #$2000 : STA.W EnemyProjectile_Properties,X
    RTS


if !FEATURE_KEEP_UNREFERENCED
;;; $8266: Unused. Instruction - enable collision with Samus ;;;
UNUSED_Inst_EnemyProjectile_EnableCollisionWithSamus_868266:
;; Parameters:
;;     X: Enemy projectile index
    LDA.W EnemyProjectile_Properties,X : AND.W #$DFFF : STA.W EnemyProjectile_Properties,X
    RTS


;;; $8270: Unused. Instruction - set to not die on contact ;;;
UNUSED_Inst_EnemyProjectile_SetToNotDieOnContact_868270:
;; Parameters:
;;     X: Enemy projectile index
    LDA.W EnemyProjectile_Properties,X : ORA.W #$4000 : STA.W EnemyProjectile_Properties,X
    RTS


;;; $827A: Unused. Instruction - set to die on contact ;;;
UNUSED_Instruction_EnemyProjectile_SetToDieOnContact_86827A:
;; Parameters:
;;     X: Enemy projectile index
    LDA.W EnemyProjectile_Properties,X : AND.W #$BFFF : STA.W EnemyProjectile_Properties,X
    RTS
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $8284: Instruction - set high priority ;;;
Instruction_EnemyProjectile_SetHighPriority:
;; Parameters:
;;     X: Enemy projectile index
    LDA.W EnemyProjectile_Properties,X : ORA.W #$1000 : STA.W EnemyProjectile_Properties,X
    RTS


if !FEATURE_KEEP_UNREFERENCED
;;; $828E: Unused. Instruction - set low priority ;;;
UNUSED_Instruction_EnemyProjectile_SetLowPriority_86828E:
;; Parameters:
;;     X: Enemy projectile index
    LDA.W EnemyProjectile_Properties,X : AND.W #$EFFF : STA.W EnemyProjectile_Properties,X
    RTS
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $8298: Instruction - X radius = [[Y]], Y radius = [[Y] + 1] ;;;
Instruction_EnemyProjectile_XYRadiusInY:
;; Parameters:
;;     X: Enemy projectile index
;;     Y: Pointer to instruction arguments
;; Returns:
;;     Y: Pointer to next instruction
    LDA.W $0000,Y : STA.W EnemyProjectile_Radii,X
    INY #2
    RTS


if !FEATURE_KEEP_UNREFERENCED
;;; $82A1: Unused. Instruction - X radius = 0, Y radius = 0 ;;;
UNUSED_Instruction_EnemyProjectile_XYRadius_0:
;; Parameters:
;;     X: Enemy projectile index
    STZ.W EnemyProjectile_Radii,X
    RTS
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $82A5: Instruction - calculate direction towards Samus ;;;
Instruction_EnemyProjectile_CalculateDirectionTowardsSamus:
;; Parameters:
;;     X: Enemy projectile index

; Used only by eye door projectile
    PHY
    LDA.W SamusXPosition : SEC : SBC.W EnemyProjectile_XPositions,X : STA.B DP_Temp12
    LDA.W SamusYPosition : SEC : SBC.W EnemyProjectile_YPositions,X : STA.B DP_Temp14
    JSL CalculateAngleOf_12_14_Offset
    ASL
    LDY.W EnemyProjectile_Index
    STA.W EnemyProjectile_Var0,Y
    TAX
    LDA.L SineCosineTables_8bitSine_SignExtended,X : STA.W EnemyProjectile_XVelocity,Y
    LDA.L SineCosineTables_NegativeCosine_SignExtended,X : STA.W EnemyProjectile_YVelocity,Y
    TYX
    PLY
    RTS


if !FEATURE_KEEP_UNREFERENCED
;;; $82D5: Unused. Instruction - write [[Y] + 4] colours from [[Y]] to colour index [[Y] + 2] ;;;
UNUSED_Inst_EnemyProj_WriteColorsFromYToColorIndex_8682D5:
;; Parameters:
;;     Y: Pointer to instruction arguments
;; Returns:
;;     Y: Pointer to next instruction
    PHY : PHX
    LDX.W $0002,Y
    LDA.W $0004,Y : AND.W #$00FF : STA.B DP_Temp12
    LDA.W $0000,Y : TAY

  .loop:
    LDA.W $0000,Y : STA.L Palettes,X
    INY #2
    INX #2
    DEC.B DP_Temp12 : BPL .loop
    PLX
    PLA : CLC : ADC.W #$0005 : TAY
    RTS


;;; $82FD: Unused. Instruction - queue music track [[Y]] ;;;
UNUSED_Instruction_EnemyProjectile_QueueMusicTrackInY:
;; Parameters:
;;     Y: Pointer to instruction arguments
;; Returns:
;;     Y: Pointer to next instruction
    LDA.W $0000,Y : AND.W #$00FF
    JSL QueueMusicDataOrTrack_8FrameDelay
    INY
    RTS


;;; $8309: Unused. Instruction - queue sound [[Y]], sound library 1, max queued sounds allowed = 6 ;;;
UNUSED_Inst_EnemyProjectile_QueueSoundInY_Lib1_Max6_868309:
;; Parameters:
;;     Y: Pointer to instruction arguments
;; Returns:
;;     Y: Pointer to next instruction
    LDA.W $0000,Y
    JSL QueueSound_Lib1_Max6
    INY
    RTS
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $8312: Instruction - queue sound [[Y]], sound library 2, max queued sounds allowed = 6 ;;;
Instruction_EnemyProjectile_QueueSoundInY_Lib2_Max6:
;; Parameters:
;;     Y: Pointer to instruction arguments
;; Returns:
;;     Y: Pointer to next instruction
    LDA.W $0000,Y
    JSL QueueSound_Lib2_Max6
    INY
    RTS


;;; $831B: Instruction - queue sound [[Y]], sound library 3, max queued sounds allowed = 6 ;;;
Instruction_EnemyProjectile_QueueSoundInY_Lib3_Max6:
;; Parameters:
;;     Y: Pointer to instruction arguments
;; Returns:
;;     Y: Pointer to next instruction
    LDA.W $0000,Y
    JSL QueueSound_Lib3_Max6
    INY
    RTS


;;; $8324: Instruction - queue sound [[Y]], sound library 1, max queued sounds allowed = 15 ;;;
Instruction_EnemyProjectile_QueueSoundInY_Lib1_Max15:
;; Parameters:
;;     Y: Pointer to instruction arguments
;; Returns:
;;     Y: Pointer to next instruction
    LDA.W $0000,Y
    JSL QueueSound
    INY
    RTS


if !FEATURE_KEEP_UNREFERENCED
;;; $832D: Unused. Instruction - queue sound [[Y]], sound library 2, max queued sounds allowed = 15 ;;;
UNUSED_Inst_EnemyProjectile_QueueSoundInY_Lib2_Max15_86832D:
;; Parameters:
;;     Y: Pointer to instruction arguments
;; Returns:
;;     Y: Pointer to next instruction
    LDA.W $0000,Y
    JSL QueueSound_Lib2_Max15
    INY
    RTS


;;; $8336: Unused. Instruction - queue sound [[Y]], sound library 3, max queued sounds allowed = 15 ;;;
UNUSED_Inst_EnemyProjectile_QueueSoundInY_Lib3_Max15_868336:
;; Parameters:
;;     Y: Pointer to instruction arguments
;; Returns:
;;     Y: Pointer to next instruction
    LDA.W $0000,Y
    JSL QueueSound_Lib3_Max15
    INY
    RTS


;;; $833F: Unused. Instruction - queue sound [[Y]], sound library 1, max queued sounds allowed = 3 ;;;
UNUSED_Inst_EnemyProjectile_QueueSoundInY_Lib1_Max3_86833F:
;; Parameters:
;;     Y: Pointer to instruction arguments
;; Returns:
;;     Y: Pointer to next instruction
    LDA.W $0000,Y
    JSL QueueSound_Lib1_Max3
    INY
    RTS


;;; $8348: Unused. Instruction - queue sound [[Y]], sound library 2, max queued sounds allowed = 3 ;;;
UNUSED_Inst_EnemyProjectile_QueueSoundInY_Lib2_Max3_868348:
;; Parameters:
;;     Y: Pointer to instruction arguments
;; Returns:
;;     Y: Pointer to next instruction
    LDA.W $0000,Y
    JSL QueueSound_Lib2_Max3
    INY
    RTS


;;; $8351: Unused. Instruction - queue sound [[Y]], sound library 3, max queued sounds allowed = 3 ;;;
UNUSED_Inst_EnemyProjectile_QueueSoundInY_Lib3_Max3_868351:
;; Parameters:
;;     Y: Pointer to instruction arguments
;; Returns:
;;     Y: Pointer to next instruction
    LDA.W $0000,Y
    JSL QueueSound_Lib3_Max3
    INY
    RTS


;;; $835A: Unused. Instruction - queue sound [[Y]], sound library 1, max queued sounds allowed = 9 ;;;
UNUSED_Inst_EnemyProjectile_QueueSoundInY_Lib1_Max9_86835A:
;; Parameters:
;;     Y: Pointer to instruction arguments
;; Returns:
;;     Y: Pointer to next instruction
    LDA.W $0000,Y
    JSL QueueSound_Lib1_Max9
    INY
    RTS


;;; $8363: Unused. Instruction - queue sound [[Y]], sound library 2, max queued sounds allowed = 9 ;;;
UNUSED_Inst_EnemyProjectile_QueueSoundInY_Lib2_Max9_868363:
;; Parameters:
;;     Y: Pointer to instruction arguments
;; Returns:
;;     Y: Pointer to next instruction
    LDA.W $0000,Y
    JSL QueueSound_Lib2_Max9
    INY
    RTS


;;; $836C: Unused. Instruction - queue sound [[Y]], sound library 3, max queued sounds allowed = 9 ;;;
UNUSED_Inst_EnemyProjectile_QueueSoundInY_Lib1_Max9_86836C:
;; Parameters:
;;     Y: Pointer to instruction arguments
;; Returns:
;;     Y: Pointer to next instruction
    LDA.W $0000,Y
    JSL QueueSound_Lib3_Max9
    INY
    RTS


;;; $8375: Unused. Instruction - queue sound [[Y]], sound library 1, max queued sounds allowed = 1 ;;;
UNUSED_Inst_EnemyProjectile_QueueSoundInY_Lib1_Max1_868375:
;; Parameters:
;;     Y: Pointer to instruction arguments
;; Returns:
;;     Y: Pointer to next instruction
    LDA.W $0000,Y
    JSL QueueSound_Lib1_Max1
    INY
    RTS
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $837E: Instruction - queue sound [[Y]], sound library 2, max queued sounds allowed = 1 ;;;
Instruction_EnemyProjectile_QueueSoundInY_Lib2_Max1:
;; Parameters:
;;     Y: Pointer to instruction arguments
;; Returns:
;;     Y: Pointer to next instruction
    LDA.W $0000,Y
    JSL QueueSound_Lib2_Max1
    INY
    RTS


;;; $8387: Instruction - queue sound [[Y]], sound library 3, max queued sounds allowed = 1 ;;;
Instruction_EnemyProjectile_QueueSoundInY_Lib3_Max1:
;; Parameters:
;;     Y: Pointer to instruction arguments
;; Returns:
;;     Y: Pointer to next instruction
    LDA.W $0000,Y
    JSL QueueSound_Lib3_Max1
    INY
    RTS


;;; $8390: Draw high priority enemy projectiles ;;;
Draw_HighPriority_EnemyProjectile:
    PHB
    PEA.W EnemyProjSpritemaps>>8&$FF00 : PLB : PLB
    JSR Get_Values_for_Screen_Shaking
    LDX.W #$0022

  .loop:
    LDA.W EnemyProjectile_ID,X : BEQ .next
    LDA.W EnemyProjectile_Properties,X : AND.W #$1000 : BEQ .next
    JSR Draw_EnemyProjectile

  .next:
    DEX #2 : BPL .loop
    PLB
    RTL


;;; $83B2: Draw low priority enemy projectiles ;;;
Draw_LowPriority_EnemyProjectile:
    PHB
    REP #$30
    PEA.W EnemyProjSpritemaps>>8&$FF00 : PLB : PLB
    JSR Get_Values_for_Screen_Shaking
    LDX.W #$0022

  .loop:
    LDA.W EnemyProjectile_ID,X : BEQ .next
    LDA.W EnemyProjectile_Properties,X : AND.W #$1000 : BNE .next
    JSR Draw_EnemyProjectile

  .next:
    DEX #2 : BPL .loop
    PLB
    RTL


;;; $83D6: Draw enemy projectile ;;;
Draw_EnemyProjectile:
;; Parameters:
;;     X: Enemy projectile index
;;     $22: Y displacement (due to screen shaking)
;;     $24: X displacement (due to screen shaking)
    LDY.W EnemyProjectile_SpritemapPointers,X
    LDA.W EnemyProjectile_GraphicsIndices,X : AND.W #$00FF : STA.B DP_Temp1A
    LDA.W EnemyProjectile_GraphicsIndices,X : AND.W #$FF00 : STA.B DP_Temp1C
    LDA.W EnemyProjectile_XPositions,X : SEC : SBC.W Layer1XPosition
    CLC : ADC.B DP_Temp24 : STA.B DP_Temp14
    CLC : ADC.W #$0080 : BIT.W #$FE00 : BNE .return
    LDA.W EnemyProjectile_YPositions,X : SEC : SBC.W Layer1YPosition
    CLC : ADC.B DP_Temp22 : STA.B DP_Temp12
    BIT.W #$FF00 : BNE +
    PHX
    JSL AddSpritemapToOAM_WithBaseTileNumber_8C0A
    PLX
    BRA .return

+   CLC : ADC.W #$0080 : BIT.W #$FE00 : BNE .return
    PHX
    JSL AddSpritemapToOAM_WithBaseTileNumber_Offscreen_8C7F
    PLX

  .return:
    RTS


;;; $8427: Get values for screen shaking ;;;
Get_Values_for_Screen_Shaking:
;; Returns:
;;     $22: Y displacement
;;     $24: X displacement
    LDA.W EarthquakeTimer : BEQ .returnZero
    LDA.W TimeIsFrozenFlag : BNE .returnZero
    LDA.W EarthquakeType : CMP.W #$0024 : BPL .returnZero
    ASL #2 : TAX
    LDA.W EarthquakeTimer : BIT.W #$0002 : BEQ +
    LDA.L .horizontalX,X : EOR.W #$FFFF : INC : STA.B DP_Temp24
    LDA.L .horizontalY,X : EOR.W #$FFFF : INC : STA.B DP_Temp22
    RTS


+   LDA.L .horizontalX,X : STA.B DP_Temp24
    LDA.L .horizontalY,X : STA.B DP_Temp22
    RTS


  .returnZero:
    STZ.B DP_Temp22 : STZ.B DP_Temp24
    RTS

; [X displacement], [Y displacement]

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


;;; $84FB: RTS ;;;
RTS_8684FB:
    RTS


;;; $84FC: Instruction list - delete ;;;
InstList_EnemyProjectile_Delete:
    dw Instruction_EnemyProjectile_Delete


if !FEATURE_KEEP_UNREFERENCED
;;; $84FE: Unused. Instruction list - blank spritemap ;;;
UNUSED_InstList_EnemyProjectile_BlankSpritemap:
    dw $1000,EnemyProjSpritemaps_Blank_Default
    dw Instruction_EnemyProjectile_GotoY
    dw UNUSED_InstList_EnemyProjectile_BlankSpritemap
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $8506: Enemy projectile block collision - horizontal extension ;;;
EnemyProjectile_BlockCollision_HorizontalExtension:
;; Returns:
;;     Carry: Clear. No collision

; If BTS is 0, acts like air
; Otherwise, offsets block index by block BTS, updates X, and loops back to the `JSR (xxxx, X)` instruction that jumped to here
    LDX.W CurrentBlockIndex
    LDA.L BTS,X : AND.W #$00FF : BEQ .return
    BIT.W #$0080 : BNE .highByte
    AND.W #$00FF
    BRA +

  .highByte:
    ORA.W #$FF00

+   CLC : ADC.W CurrentBlockIndex : STA.W CurrentBlockIndex
    ASL : TAX
    LDA.L LevelData,X : AND.W #$F000 : XBA : LSR #3 : TAX
    PLA : SEC : SBC.W #$0003 : PHA

  .return:
    CLC
    RTS


;;; $853C: Enemy projectile block collision - vertical extension ;;;
EnemyProjectile_BlockCollision_VerticalExtension:
;; Returns:
;;     Carry: Clear. No collision

; If BTS is 0, acts like air
; Otherwise, offsets block index by block BTS, updates X, and loops back to the `JSR (xxxx, X)` instruction that jumped to here
; Uses an addition/subtraction loop for multiplication, which is probably faster for an offset of 1 or maybe 2
    LDX.W CurrentBlockIndex
    LDA.L BTS,X : AND.W #$00FF : BEQ .return
    BIT.W #$0080 : BNE .negative
    STA.W CollisionMultiplicationCounter
    LDA.W CurrentBlockIndex

  .loop:
    CLC : ADC.W RoomWidthBlocks
    DEC.W CollisionMultiplicationCounter : BNE .loop
    JMP .merge


  .negative:
    ORA.W #$FF00 : STA.W CollisionMultiplicationCounter
    LDA.W CurrentBlockIndex

  .loop2:
    SEC : SBC.W RoomWidthBlocks
    INC.W CollisionMultiplicationCounter : BNE .loop2

  .merge:
    STA.W CurrentBlockIndex : ASL : TAX
    LDA.L LevelData,X : AND.W #$F000 : XBA : LSR #3 : TAX
    PLA : SEC : SBC.W #$0003 : PHA

  .return:
    CLC
    RTS


;;; $858A: Clear carry ;;;
CLCRTS_86858A:
    CLC
    RTS


;;; $858C: Set carry ;;;
SECRTS_86858C:
    SEC
    RTS


;;; $858E: Enemy projectile block collision - horizontal - slope ;;;
EnemyProjectile_BlockCollision_HorizontalSlope:
;; Parameters:
;;     $14: Enemy projectile X velocity (used only for sign)
;;     $1A: Number of blocks left to check (0 if final (bottom) block)
;;     $1C: Enemy projectile X radius
;;     $1E: Enemy projectile Y radius
;;     $20: Enemy projectile Y block span
;;     $22: Target boundary position (left/right depending on sign of enemy projectile X velocity)
;; Returns:
;;     Carry: Set if collision, clear otherwise
    LDX.W CurrentBlockIndex
    LDA.L BTS,X : AND.W #$001F : CMP.W #$0005 : BCS .nonSquare
    JMP EnemyProjectile_BlockCollision_HorizontalSlopeSquare

  .nonSquare:
    LDA.L BTS,X : AND.W #$00FF : STA.W CurrentSlopeBTS
    JMP EnemyProjectile_BlockCollision_HorizontalSlopeNonSquare


;;; $85AD: Enemy projectile block collision - vertical - slope ;;;
EnemyProjectile_BlockCollision_VerticalSlope:
;; Parameters:
;;     $14: Enemy projectile Y velocity (used only for sign)
;;     $18: Target Y position
;;     $1A: Number of blocks left to check (0 if final (rightmost) block)
;;     $1C: Enemy projectile X radius
;;     $1E: Enemy projectile Y radius
;;     $20: Enemy projectile X block span
;;     $22: Target boundary position (top/bottom depending on sign of enemy projectile Y velocity)
;; Returns:
;;     Carry: Set if collision, clear otherwise
    LDX.W CurrentBlockIndex
    LDA.L BTS,X : AND.W #$001F : CMP.W #$0005 : BCS .nonSquare
    JMP EnemyProjectile_BlockCollision_VerticalSlopeSquare

  .nonSquare:
    JMP EnemyProjectile_BlockCollision_VerticalSlopeNonSquare


;;; $85C2: Enemy projectile block collision reaction - horizontal - slope - square ;;;
EnemyProjectile_BlockCollision_HorizontalSlopeSquare:
;; Parameters:
;;     A: [Block BTS] & 1Fh
;;     X: Block index
;;     $14: Enemy projectile X velocity (used only for sign)
;;     $1A: Number of blocks left to check (0 if final (bottom) block)
;;     $1C: Enemy projectile X radius
;;     $1E: Enemy projectile Y radius
;;     $20: Enemy projectile Y block span
;;     $22: Target boundary position (left/right depending on sign of enemy projectile X velocity)
;; Returns:
;;     Carry: Set if collision, clear otherwise
    ASL #2
    STA.W CollisionMultiplicationCounter
    LDA.L BTS-1,X : ROL #3 : AND.W #$0003 : STA.W SlopeCollisionFlipFlags
    LDA.B DP_Temp22 : AND.W #$0008 : LSR #3
    EOR.W SlopeCollisionFlipFlags : ADC.W CollisionMultiplicationCounter : TAX
    LDY.W EnemyProjectile_Index
    LDA.B DP_Temp20 : BNE .multiBlock
    LDA.W EnemyProjectile_YPositions,Y : SEC : SBC.B DP_Temp1E : AND.W #$0008 : BNE +
    LDA.L SquareSlopeDefinitions_Bank86_topLeft-1,X : BMI .gotoCollision

+   TXA : EOR.W #$0002 : TAX
    LDA.W EnemyProjectile_YPositions,Y : CLC : ADC.B DP_Temp1E
    DEC : AND.W #$0008 : BEQ .returnCollision
    LDA.L SquareSlopeDefinitions_Bank86_topLeft-1,X : BMI .gotoCollision

  .returnCollision:
    CLC
    RTS

  .gotoCollision:
    JMP .collision

  .multiBlock:
    LDA.B DP_Temp1A : BNE +
    LDA.W EnemyProjectile_YPositions,Y : CLC : ADC.B DP_Temp1E
    DEC : AND.W #$0008 : BNE .bothHalves
    LDA.L SquareSlopeDefinitions_Bank86_topLeft-1,X : BMI .gotoCollision_duplicate
    BRA .returnNoCollision

+   CMP.B DP_Temp20 : BNE .bothHalves
    LDA.W EnemyProjectile_YPositions,Y : SEC : SBC.B DP_Temp1E : AND.W #$0008 : BNE .checkBottomHalf

  .bothHalves:
    LDA.L SquareSlopeDefinitions_Bank86_topLeft-1,X : BMI .gotoCollision_duplicate

  .checkBottomHalf:
    TXA : EOR.W #$0002 : TAX
    LDA.L SquareSlopeDefinitions_Bank86_topLeft-1,X : BMI .gotoCollision_duplicate

  .returnNoCollision:
    CLC
    RTS

  .gotoCollision_duplicate:
    JMP .collision ; >.<

  .collision:
    LDX.W EnemyProjectile_Index
    STZ.W EnemyProjectile_XSubPositions,X
    LDA.B DP_Temp22 : BIT.B DP_Temp14 : BMI +
    AND.W #$FFF8 : SEC : SBC.B DP_Temp1C : STA.W EnemyProjectile_XPositions,X
    SEC
    RTS

+   ORA.W #$0007 : SEC : ADC.B DP_Temp1C : STA.W EnemyProjectile_XPositions,X
    SEC
    RTS


;;; $8676: Enemy projectile block collision reaction - vertical - slope - square ;;;
EnemyProjectile_BlockCollision_VerticalSlopeSquare:
;; Parameters:
;;     A: [Block BTS] & 1Fh
;;     X: Block index
;;     $14: Enemy projectile Y velocity (used only for sign)
;;     $1A: Number of blocks left to check (0 if final (rightmost) block)
;;     $1C: Enemy projectile X radius
;;     $1E: Enemy projectile Y radius
;;     $20: Enemy projectile X block span
;;     $22: Target boundary position (top/bottom depending on sign of enemy projectile Y velocity)
;; Returns:
;;     Carry: Set if collision, clear otherwise

; BUG: The single block branch ($869A) doesn't load the enemy projectile index into Y,
;      so it loads garbage for the enemy projectile X position
;      Result is the enemy projectile might erroneously consider the slope to be X flipped
;      (which only affects the quarter and three-quarter slopes)
    ASL #2 : STA.W CollisionMultiplicationCounter
    LDA.L BTS-1,X : ROL #3 : AND.W #$0003 : STA.W SlopeCollisionFlipFlags
    LDA.B DP_Temp22 : AND.W #$0008 : LSR #2
    EOR.W SlopeCollisionFlipFlags : ADC.W CollisionMultiplicationCounter : TAX
    LDA.B DP_Temp20 : BNE .multiBlock
    LDA.W EnemyProjectile_XPositions,Y : SEC : SBC.B DP_Temp1C : AND.W #$0008 : BNE +
    LDA.L SquareSlopeDefinitions_Bank86_topLeft-1,X : BMI .gotoCollision

+   TXA : EOR.W #$0001 : TAX
    LDA.W EnemyProjectile_XPositions,Y : CLC : ADC.B DP_Temp1C
    DEC : AND.W #$0008 : BEQ .returnNoCollision
    LDA.L SquareSlopeDefinitions_Bank86_topLeft-1,X : BMI .gotoCollision

  .returnNoCollision:
    CLC
    RTS

  .gotoCollision:
    JMP .collision

  .multiBlock:
    LDY.W EnemyProjectile_Index
    LDA.B DP_Temp1A : BNE +
    LDA.W EnemyProjectile_XPositions,Y : CLC : ADC.B DP_Temp1C
    DEC : AND.W #$0008 : BNE .checkBothHalves
    LDA.L SquareSlopeDefinitions_Bank86_topLeft-1,X : BMI .gotoCollision_duplicate
    BRA .noCollisionReturn

+   CMP.B DP_Temp20 : BNE .checkBothHalves
    LDA.W EnemyProjectile_XPositions,Y : SEC : SBC.B DP_Temp1C : AND.W #$0008 : BNE .checkLeftHalf

  .checkBothHalves:
    LDA.L SquareSlopeDefinitions_Bank86_topLeft-1,X : BMI .gotoCollision_duplicate

  .checkLeftHalf:
    TXA : EOR.W #$0001 : TAX
    LDA.L SquareSlopeDefinitions_Bank86_topLeft-1,X : BMI .gotoCollision_duplicate

  .noCollisionReturn:
    CLC
    RTS

  .gotoCollision_duplicate:
    JMP .collision ; >.<

  .collision:
    LDX.W EnemyProjectile_Index
    STZ.W EnemyProjectile_YSubPositions,X
    LDA.B DP_Temp22 : BIT.B DP_Temp14 : BMI +
    AND.W #$FFF8 : SEC : SBC.B DP_Temp1E : STA.W EnemyProjectile_YPositions,X
    SEC
    RTS

+   ORA.W #$0007 : SEC : ADC.B DP_Temp1E : STA.W EnemyProjectile_YPositions,X
    SEC
    RTS


;;; $8729: Square slope definitions ;;;
SquareSlopeDefinitions_Bank86:
; Copy of $94:8E54 for enemy projectiles
; 7Fh- = air, 80h+ = solid

;        _____________ Top-left
;       |    _________ Top-right
;       |   |    _____ Bottom-left
;       |   |   |    _ Bottom-right
;       |   |   |   |
  .topLeft:
    db $00
  .topRight:
    db     $01
  .bottomLeft:
    db         $82
  .bottomRight:
    db             $83 ; 0: Half height
    db $00,$81,$02,$83 ; 1: Half width
    db $00,$01,$02,$83 ; 2: Quarter
    db $00,$81,$82,$83 ; 3: Three-quarters
    db $80,$81,$82,$83 ; 4: Whole


;;; $873D: Clear carry. Enemy projectile block collision reaction - horizontal - slope - non-square ;;;
EnemyProjectile_BlockCollision_HorizontalSlopeNonSquare:
;; Returns:
;;     Carry: Clear (no collision)
    LDA.W CurrentSlopeBTS : AND.W #$001F : ASL #2 : TAX
    LDA.B DP_Temp14 : BPL .return ; >.<
    CLC
    RTS

  .return:
    CLC
    RTS


;;; $874E: Enemy projectile block collision reaction - vertical - slope - non-square ;;;
EnemyProjectile_BlockCollision_VerticalSlopeNonSquare:
;; Parameters:
;;     $14: Enemy projectile Y velocity (used only for sign)
;;     $18: Target Y position
;;     $1E: Enemy projectile Y radius
;; Returns:
;;     Carry: Set if collision, clear otherwise
    LDY.W EnemyProjectile_Index
    LDA.B DP_Temp14 : BPL +
    JMP .up

+   LDX.W CurrentBlockIndex : STX.W $4204
    SEP #$20
    LDA.W RoomWidthBlocks : STA.W $4206
    REP #$20
    LDA.W EnemyProjectile_XPositions,Y : LSR #4 : CMP.W $4216 : BEQ +
    CLC
    RTS

+   LDA.B DP_Temp18 : CLC : ADC.B DP_Temp1E
    DEC : AND.W #$000F : STA.W CollisionMultiplicationCounter
    LDA.L BTS,X : AND.W #$001F : ASL #4 : STA.W SlopeCollisionFlipFlags
    LDA.L BTS-1,X : BMI .returnNoCollision
    ASL : BMI .nonZero
    LDA.W EnemyProjectile_XPositions,Y
    BRA +

  .nonZero:
    LDA.W EnemyProjectile_XPositions,Y : EOR.W #$000F

+   AND.W #$000F : CLC : ADC.W SlopeCollisionFlipFlags : TAX
    LDA.L SlopeDefinitions_SlopeTopXOffsetByYPixel,X : AND.W #$001F : SEC : SBC.W CollisionMultiplicationCounter
    DEC : BEQ .setYpos
    BPL .returnNoCollision

  .setYpos:
    CLC : ADC.B DP_Temp18 : STA.W EnemyProjectile_YPositions,Y
    LDA.W #$FFFF : STA.W EnemyProjectile_YSubPositions,Y
    SEC
    RTS


  .returnNoCollision:
    CLC
    RTS

  .up:
    LDX.W CurrentBlockIndex : STX.W $4204
    SEP #$20
    LDA.W RoomWidthBlocks : STA.W $4206
    REP #$20
    LDA.W EnemyProjectile_XPositions,Y : LSR #4 : CMP.W $4216 : BEQ +
    CLC
    RTS

+   LDA.B DP_Temp18 : SEC : SBC.B DP_Temp1E
    AND.W #$000F : EOR.W #$000F : STA.W CollisionMultiplicationCounter
    LDA.L BTS,X : AND.W #$001F : ASL #4 : STA.W SlopeCollisionFlipFlags
    LDA.L BTS-1,X : BPL .noCollisionReturn
    ASL : BMI .notZero
    LDA.W EnemyProjectile_XPositions,Y
    BRA +

  .notZero:
    LDA.W EnemyProjectile_XPositions,Y : EOR.W #$000F

+   AND.W #$000F : CLC : ADC.W SlopeCollisionFlipFlags : TAX
    LDA.L SlopeDefinitions_SlopeTopXOffsetByYPixel,X : AND.W #$001F : SEC : SBC.W CollisionMultiplicationCounter
    DEC : BEQ .Ypos
    BPL .noCollisionReturn

  .Ypos:
    EOR.W #$FFFF : INC
    CLC : ADC.B DP_Temp18 : STA.W EnemyProjectile_YPositions,Y
    LDA.W #$0000 : STA.W EnemyProjectile_YSubPositions,Y
    SEC
    RTS

  .noCollisionReturn:
    CLC
    RTS


;;; $8846: Enemy projectile block collision reaction pointers - horizontal ;;;
EnemyProjectile_BlockCollision_Horizontal_Pointers:
    dw CLCRTS_86858A
    dw EnemyProjectile_BlockCollision_HorizontalSlope                    ; 1: Slope
    dw CLCRTS_86858A
    dw CLCRTS_86858A
    dw CLCRTS_86858A
    dw EnemyProjectile_BlockCollision_HorizontalExtension                ; 5: Horizontal extension
    dw CLCRTS_86858A
    dw CLCRTS_86858A
    dw SECRTS_86858C
    dw SECRTS_86858C
    dw SECRTS_86858C
    dw SECRTS_86858C
    dw SECRTS_86858C
    dw EnemyProjectile_BlockCollision_VerticalExtension                  ; Dh: Vertical extension
    dw CLCRTS_86858A
    dw SECRTS_86858C


;;; $8866: Enemy projectile block collision reaction pointers - vertical ;;;
EnemyProjectile_BlockCollision_Vertical_Pointers:
    dw CLCRTS_86858A
    dw EnemyProjectile_BlockCollision_VerticalSlope                      ; 1: Slope
    dw CLCRTS_86858A
    dw CLCRTS_86858A
    dw CLCRTS_86858A
    dw EnemyProjectile_BlockCollision_HorizontalExtension                ; 5: Horizontal extension
    dw CLCRTS_86858A
    dw CLCRTS_86858A
    dw SECRTS_86858C
    dw SECRTS_86858C
    dw SECRTS_86858C
    dw SECRTS_86858C
    dw SECRTS_86858C
    dw EnemyProjectile_BlockCollision_VerticalExtension                  ; Dh: Vertical extension
    dw CLCRTS_86858A
    dw SECRTS_86858C


;;; $8886: Enemy projectile block collision reaction - horizontal ;;;
EnemyProjectile_BlockReaction_Horizontal:
;; Parameters:
;;     X: Block index (multiple of 2)
;;     $14: Enemy projectile X velocity (used only for sign)
;;     $1A: Number of blocks left to check (0 if final (bottom) block)
;;     $1C: Enemy projectile X radius
;;     $1E: Enemy projectile Y radius
;;     $20: Enemy projectile Y block span
;;     $22: Target boundary position (left/right depending on sign of enemy projectile velocity)
;; Returns:
;;     Carry: Set if collision, clear otherwise
    PHX
    STX.W CurrentBlockIndex
    LSR.W CurrentBlockIndex
    LDA.L LevelData,X : AND.W #$F000 : XBA : LSR #3 : TAX
    JSR.W (EnemyProjectile_BlockCollision_Horizontal_Pointers,X)
    PLX
    RTS


;;; $889E: Enemy projectile block collision reaction - vertical ;;;
EnemyProjectile_BlockReaction_Vertical:
;; Parameters:
;;     $14: Enemy projectile Y velocity (used only for sign)
;;     $18: Target Y position
;;     $1A: Number of blocks left to check (0 if final (rightmost) block)
;;     $1C: Enemy projectile X radius
;;     $1E: Enemy projectile Y radius
;;     $20: Enemy projectile X block span
;;     $22: Target boundary position (top/bottom depending on sign of enemy projectile velocity)
;; Returns:
;;     Carry: Set if collision, clear otherwise
    PHX
    STX.W CurrentBlockIndex
    LSR.W CurrentBlockIndex
    LDA.L LevelData,X : AND.W #$F000 : XBA : LSR #3 : TAX
    JSR.W (EnemyProjectile_BlockCollision_Vertical_Pointers,X)
    PLX
    RTS


;;; $88B6: Move enemy projectile horizontally ;;;
Move_EnemyProjectile_Horizontally:
;; Parameters:
;;     X: Enemy projectile index
;; Returns:
;;     Carry: Set if collided with block

; This routine expects:
;     EnemyProjectile_XSubPositions: X subposition
;     EnemyProjectile_XVelocity: X velocity (unit 1/100h px/frame)
    PHX
    STZ.B DP_Temp12 : STZ.B DP_Temp14
    LDA.W EnemyProjectile_XVelocity,X : BPL +
    DEC.B DP_Temp14

+   STA.B DP_Temp13
    LDA.W EnemyProjectile_Radii+1,X : AND.W #$00FF : STA.B DP_Temp1E
    LDA.W EnemyProjectile_Radii,X : AND.W #$00FF : STA.B DP_Temp1C
    LDA.W EnemyProjectile_YPositions,X : SEC : SBC.B DP_Temp1E
    AND.W #$FFF0 : STA.B DP_Temp1A
    LDA.W EnemyProjectile_YPositions,X : CLC : ADC.B DP_Temp1E
    DEC : SEC : SBC.B DP_Temp1A
    LSR #4 : STA.B DP_Temp1A : STA.B DP_Temp20
    LDA.W EnemyProjectile_YPositions,X : SEC : SBC.B DP_Temp1E : LSR #4
    SEP #$20
    STA.W $4202
    LDA.W RoomWidthBlocks : STA.W $4203
    REP #$20
    LDA.W EnemyProjectile_XSubPositions,X : CLC : ADC.B DP_Temp12 : STA.B DP_Temp16
    LDA.W EnemyProjectile_XPositions,X : ADC.B DP_Temp14 : STA.B DP_Temp18
    BIT.B DP_Temp14 : BMI .lessThanZero
    CLC : ADC.B DP_Temp1C
    DEC
    BRA +

  .lessThanZero:
    SEC : SBC.B DP_Temp1C

+   STA.B DP_Temp22
    LSR #4 : CLC : ADC.W $4216 : ASL : TAX

  .loop:
    JSR EnemyProjectile_BlockReaction_Horizontal
    BCS .solid
    TXA : CLC : ADC.W RoomWidthBlocks : ADC.W RoomWidthBlocks : TAX
    DEC.B DP_Temp1A : BPL .loop
    PLX
    LDA.B DP_Temp16 : STA.W EnemyProjectile_XSubPositions,X
    LDA.B DP_Temp18 : STA.W EnemyProjectile_XPositions,X
    CLC
    RTS

  .solid:
    PLX
    STZ.W EnemyProjectile_XSubPositions,X
    LDA.B DP_Temp22 : BIT.B DP_Temp14 : BMI .movingLeft
    AND.W #$FFF0 : SEC : SBC.B DP_Temp1C : CMP.W EnemyProjectile_XPositions,X : BCC .returnCollision
    STA.W EnemyProjectile_XPositions,X

  .returnCollision:
    SEC
    RTS

  .movingLeft:
    ORA.W #$000F : SEC : ADC.B DP_Temp1C : CMP.W EnemyProjectile_XPositions,X : BEQ +
    BCS .returnCollisionLeft

+   STA.W EnemyProjectile_XPositions,X

  .returnCollisionLeft:
    SEC
    RTS


;;; $897B: Move enemy projectile vertically ;;;
Move_EnemyProjectile_Vertically:
;; Parameters:
;;     X: Enemy projectile index
;; Returns:
;;     Carry: Set if collided with block

; This routine expects:
;     EnemyProjectile_YSubPositions: Y subposition
;     EnemyProjectile_YVelocity: Y velocity (unit 1/100h px/frame)
    PHX
    STZ.B DP_Temp12 : STZ.B DP_Temp14
    LDA.W EnemyProjectile_YVelocity,X : BPL +
    DEC.B DP_Temp14

+   STA.B DP_Temp13
    LDA.W EnemyProjectile_Radii+1,X : AND.W #$00FF : STA.B DP_Temp1E
    LDA.W EnemyProjectile_Radii,X : AND.W #$00FF : STA.B DP_Temp1C
    LDA.W EnemyProjectile_XPositions,X : SEC : SBC.B DP_Temp1C
    AND.W #$FFF0 : STA.B DP_Temp1A
    LDA.W EnemyProjectile_XPositions,X : CLC : ADC.B DP_Temp1C
    DEC : SEC : SBC.B DP_Temp1A : LSR #4 : STA.B DP_Temp1A : STA.B DP_Temp20
    LDA.W EnemyProjectile_YSubPositions,X : CLC : ADC.B DP_Temp12 : STA.B DP_Temp16
    LDA.W EnemyProjectile_YPositions,X : ADC.B DP_Temp14 : STA.B DP_Temp18
    BIT.B DP_Temp14 : BMI .lessThanZero
    CLC : ADC.B DP_Temp1E
    DEC
    BRA +

  .lessThanZero:
    SEC : SBC.B DP_Temp1E

+   STA.B DP_Temp22
    LSR #4
    SEP #$20
    STA.W $4202
    LDA.W RoomWidthBlocks : STA.W $4203
    REP #$20
    LDA.W EnemyProjectile_XPositions,X : SEC : SBC.B DP_Temp1C
    LSR #4 : CLC : ADC.W $4216 : ASL : TAX

  .loop:
    JSR EnemyProjectile_BlockReaction_Vertical
    BCS .solid
    INX #2
    DEC.B DP_Temp1A : BPL .loop
    PLX
    LDA.B DP_Temp16 : STA.W EnemyProjectile_YSubPositions,X
    LDA.B DP_Temp18 : STA.W EnemyProjectile_YPositions,X
    CLC
    RTS

  .solid:
    PLX
    STZ.W EnemyProjectile_YSubPositions,X
    LDA.B DP_Temp22 : BIT.B DP_Temp14 : BMI .movingUp
    AND.W #$FFF0 : SEC : SBC.B DP_Temp1E : CMP.W EnemyProjectile_YPositions,X : BCC .returnCollision
    STA.W EnemyProjectile_YPositions,X

  .returnCollision:
    SEC
    RTS

  .movingUp:
    ORA.W #$000F : SEC : ADC.B DP_Temp1E : CMP.W EnemyProjectile_YPositions,X : BEQ +
    BCS .returnCollisionUp

+   STA.W EnemyProjectile_YPositions,X

  .returnCollisionUp:
    SEC
    RTS


if !FEATURE_KEEP_UNREFERENCED
;;; $8A39: Initialisation AI - enemy projectile $8AAF ;;;
UNUSED_EnemyProjectile_868A39:
;; Parameters:
;;     Y: Enemy projectile index
    JSL GenerateRandomNumber
    LDX.W EnemyIndex
    LDA.W Enemy.YPosition,X : CLC : ADC.W #$000C : STA.W EnemyProjectile_YPositions,Y
    ADC.W #$0048 : STA.W EnemyProjectile_Timers,Y
    LDA.W Enemy.var3,X : STA.W EnemyProjectile_YVelocity,Y
    LDA.W RandomNumberSeed : AND.W #$001F : SEC : SBC.W #$0010
    CLC : ADC.W Enemy.XPosition,X : STA.W EnemyProjectile_XPositions,Y
    LDA.W EnemyProjectile_YVelocity+1,Y : AND.W #$0006 : TAX
    LDA.W .pointers,X : STA.W EnemyProjectile_InstListPointers,Y
    RTS

  .pointers:
; Garbage instruction list pointers
    dw UNUSED_EnemyProjectile_868A39
    dw UNUSED_EnemyProjectile_868A39
    dw UNUSED_EnemyProjectile_868A39
    dw UNUSED_EnemyProjectile_868A39


;;; $8A7D: Pre-instruction - enemy projectile $8AAF ;;;
UNUSED_PreInstruction_EnemyProjectile_868A7D:
;; Parameters:
;;     X: Enemy projectile index
    LDA.W EnemyProjectile_YVelocity-1,X : AND.W #$FF00 : STA.B DP_Temp14
    LDA.W EnemyProjectile_YVelocity,X : XBA : BPL +
    ORA.W #$FF00
    BRA .storeYVelocity

+   AND.W #$00FF

  .storeYVelocity:
    STA.B DP_Temp12
    LDA.W EnemyProjectile_YSubPositions,X : CLC : ADC.B DP_Temp14 : STA.W EnemyProjectile_YSubPositions,X
    LDA.W EnemyProjectile_YPositions,X : ADC.B DP_Temp12 : STA.W EnemyProjectile_YPositions,X
    CMP.W EnemyProjectile_Timers,X : BCC .return
    STZ.W EnemyProjectile_ID,X

  .return:
    RTS


;;; $8AAF: Unused. Enemy projectile ;;;
UNUSED_EnemyProjectile_868AAF:
; There's no way of knowing what this enemy projectile might have been (especially with the garbage instruction lists)
; It has no hitbox and falls 48h pixels at a constant velocity (initialised to Enemy.var3),
; so my best guess would have to be a sweat drop (a la eye door) or falling debris (a la Ceres pre elevator hall)

; Initial instruction list ignored
    %EnemyProjectile(\
    %initAI(UNUSED_EnemyProjectile_868A39),
    %preInst(UNUSED_PreInstruction_EnemyProjectile_868A7D),
    %instList(UNUSED_EnemyProjectile_868A39),
    %radius(0, 0),
    %properties($0002),
    %hitList(0),
    %shotList(InstList_EnemyProjectile_Delete))
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $8ABD: Instruction list - enemy projectile $8BC2/$8BD0/$8BDE/$8BEC (skree particle) ;;;
InstList_SkreeParticle:
    dw $0010,EnemyProjSpritemaps_SkreeParticle
    dw Instruction_EnemyProjectile_GotoY
    dw InstList_SkreeParticle


;;; $8AC5: Instruction list - enemy projectile $8BFA/$8C08/$8C16/$8C24 (metaree particle) ;;;
InstList_MetalSkreeParticle:
    dw $0010,EnemyProjSpritemaps_MetareeParticle
    dw Instruction_EnemyProjectile_GotoY
    dw InstList_MetalSkreeParticle


;;; $8ACD: Initialisation AI - enemy projectile $8BC2/$8BFA ((metal) skree - down-right) ;;;
InitAI_EnemyProjectile_MetalSkreeParticle_DownRight:
;; Parameters:
;;     Y: Enemy projectile index
    LDX.W EnemyIndex
    LDA.W Enemy.YPosition,X : SEC : SBC.W #$0000 : STA.W EnemyProjectile_YPositions,Y
    LDA.W #$FCFF : STA.W EnemyProjectile_YVelocity,Y
    LDA.W Enemy.XPosition,X : CLC : ADC.W #$0006 : STA.W EnemyProjectile_XPositions,Y
    LDA.W #$0140 : STA.W EnemyProjectile_XVelocity,Y
    RTS


;;; $8AF1: Initialisation AI - enemy projectile $8BD0/$8C08 ((metal) skree - up-right) ;;;
InitAI_EnemyProjectile_MetalSkreeParticle_UpRight:
;; Parameters:
;;     Y: Enemy projectile index
    LDX.W EnemyIndex
    LDA.W Enemy.YPosition,X : SEC : SBC.W #$0000 : STA.W EnemyProjectile_YPositions,Y
    LDA.W #$FBFF : STA.W EnemyProjectile_YVelocity,Y
    LDA.W Enemy.XPosition,X : CLC : ADC.W #$0006 : STA.W EnemyProjectile_XPositions,Y
    LDA.W #$0060 : STA.W EnemyProjectile_XVelocity,Y
    RTS


;;; $8B15: Initialisation AI - enemy projectile $8BDE/$8C16 ((metal) skree - down-left) ;;;
InitAI_EnemyProjectile_MetalSkreeParticle_DownLeft:
;; Parameters:
;;     Y: Enemy projectile index
    LDX.W EnemyIndex
    LDA.W Enemy.YPosition,X : SEC : SBC.W #$0000 : STA.W EnemyProjectile_YPositions,Y
    LDA.W #$FCFF : STA.W EnemyProjectile_YVelocity,Y
    LDA.W Enemy.XPosition,X : CLC
    ADC.W #$FFFA : STA.W EnemyProjectile_XPositions,Y
    LDA.W #$FEC0 : STA.W EnemyProjectile_XVelocity,Y
    RTS


;;; $8B39: Initialisation AI - enemy projectile $8BEC/$8C24 ((metal) skree - up-left) ;;;
InitAI_EnemyProjectile_MetalSkreeParticle_UpLeft:
;; Parameters:
;;     Y: Enemy projectile index
    LDX.W EnemyIndex
    LDA.W Enemy.YPosition,X : SEC : SBC.W #$0000 : STA.W EnemyProjectile_YPositions,Y
    LDA.W #$FBFF : STA.W EnemyProjectile_YVelocity,Y
    LDA.W Enemy.XPosition,X : CLC : ADC.W #$FFFA : STA.W EnemyProjectile_XPositions,Y
    LDA.W #$FFA0 : STA.W EnemyProjectile_XVelocity,Y
    RTS


;;; $8B5D: Pre-instruction - enemy projectile $8BC2/$8BD0/$8BDE/$8BEC/$8BFA/$8C08/$8C16/$8C24 ((metal) skree particle) ;;;
PreInstruction_EnemyProjectile_MetalSkreeParticle:
;; Parameters:
;;     Y: Enemy projectile index
    LDA.W EnemyProjectile_XVelocity-1,X : AND.W #$FF00 : STA.B DP_Temp14
    LDA.W EnemyProjectile_XVelocity,X : XBA : BPL +
    ORA.W #$FF00
    BRA .storeXVelocity

+   AND.W #$00FF

  .storeXVelocity:
    STA.B DP_Temp12
    LDA.W EnemyProjectile_XSubPositions,X : CLC : ADC.B DP_Temp14 : STA.W EnemyProjectile_XSubPositions,X
    LDA.W EnemyProjectile_XPositions,X : ADC.B DP_Temp12 : STA.W EnemyProjectile_XPositions,X
    LDA.W EnemyProjectile_YVelocity-1,X : AND.W #$FF00 : STA.B DP_Temp14
    LDA.W EnemyProjectile_YVelocity,X : XBA : BPL +
    ORA.W #$FF00
    BRA .storeYVelocity

+   AND.W #$00FF

  .storeYVelocity:
    STA.B DP_Temp12
    LDA.W EnemyProjectile_YSubPositions,X : CLC : ADC.B DP_Temp14 : STA.W EnemyProjectile_YSubPositions,X
    LDA.W EnemyProjectile_YPositions,X : ADC.B DP_Temp12 : STA.W EnemyProjectile_YPositions,X
    LDA.W EnemyProjectile_YVelocity,X : CLC : ADC.W #$0050 : STA.W EnemyProjectile_YVelocity,X
    JSR CheckIf_EnemyProjectile_IsOffScreen_duplicate_again4
    BEQ .return
    STZ.W EnemyProjectile_ID,X

  .return:
    RTS


;;; $8BC2: Enemy projectiles - skree particles ;;;
EnemyProjectile_SkreeParticles_DownRight:
    %EnemyProjectile(\
    %initAI(InitAI_EnemyProjectile_MetalSkreeParticle_DownRight),
    %preInst(PreInstruction_EnemyProjectile_MetalSkreeParticle),
    %instList(InstList_SkreeParticle),
    %radius(2, 2),
    %properties($0004),
    %hitList(0),
    %shotList(InstList_EnemyProjectile_Delete))

EnemyProjectile_SkreeParticles_UpRight:
    %EnemyProjectile(\
    %initAI(InitAI_EnemyProjectile_MetalSkreeParticle_UpRight),
    %preInst(PreInstruction_EnemyProjectile_MetalSkreeParticle),
    %instList(InstList_SkreeParticle),
    %radius(2, 2),
    %properties($0004),
    %hitList(0),
    %shotList(InstList_EnemyProjectile_Delete))

EnemyProjectile_SkreeParticles_DownLeft:
    %EnemyProjectile(\
    %initAI(InitAI_EnemyProjectile_MetalSkreeParticle_DownLeft),
    %preInst(PreInstruction_EnemyProjectile_MetalSkreeParticle),
    %instList(InstList_SkreeParticle),
    %radius(2, 2),
    %properties($0004),
    %hitList(0),
    %shotList(InstList_EnemyProjectile_Delete))

EnemyProjectile_SkreeParticles_UpLeft:
    %EnemyProjectile(\
    %initAI(InitAI_EnemyProjectile_MetalSkreeParticle_UpLeft),
    %preInst(PreInstruction_EnemyProjectile_MetalSkreeParticle),
    %instList(InstList_SkreeParticle),
    %radius(2, 2),
    %properties($0004),
    %hitList(0),
    %shotList(InstList_EnemyProjectile_Delete))

EnemyProjectile_MetalSkreeParticles_DownRight:
    %EnemyProjectile(\
    %initAI(InitAI_EnemyProjectile_MetalSkreeParticle_DownRight),
    %preInst(PreInstruction_EnemyProjectile_MetalSkreeParticle),
    %instList(InstList_MetalSkreeParticle),
    %radius(2, 2),
    %properties($0004),
    %hitList(0),
    %shotList(InstList_EnemyProjectile_Delete))

EnemyProjectile_MetalSkreeParticles_UpRight:
    %EnemyProjectile(\
    %initAI(InitAI_EnemyProjectile_MetalSkreeParticle_UpRight),
    %preInst(PreInstruction_EnemyProjectile_MetalSkreeParticle),
    %instList(InstList_MetalSkreeParticle),
    %radius(2, 2),
    %properties($0004),
    %hitList(0),
    %shotList(InstList_EnemyProjectile_Delete))

EnemyProjectile_MetalSkreeParticles_DownLeft:
    %EnemyProjectile(\
    %initAI(InitAI_EnemyProjectile_MetalSkreeParticle_DownLeft),
    %preInst(PreInstruction_EnemyProjectile_MetalSkreeParticle),
    %instList(InstList_MetalSkreeParticle),
    %radius(2, 2),
    %properties($0004),
    %hitList(0),
    %shotList(InstList_EnemyProjectile_Delete))

EnemyProjectile_MetalSkreeParticles_UpLeft:
    %EnemyProjectile(\
    %initAI(InitAI_EnemyProjectile_MetalSkreeParticle_UpLeft),
    %preInst(PreInstruction_EnemyProjectile_MetalSkreeParticle),
    %instList(InstList_MetalSkreeParticle),
    %radius(2, 2),
    %properties($0004),
    %hitList(0),
    %shotList(InstList_EnemyProjectile_Delete))


if !FEATURE_KEEP_UNREFERENCED
;;; $8C32: Unused. Instruction list ;;;
UNUSED_InstList_Draygon_868C32:
    dw $0010,UNUSED_EnemyProjSpritemaps_Draygon_8D8A0F
    dw Instruction_EnemyProjectile_Sleep
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $8C38: Touch instruction list - enemy projectile $8E50 (Draygon goop) ;;;
InstList_EnemyProjectile_DraygonGoop_Touch:
    dw Instruction_DraygonGoop_SamusCollision


;;; $8C3A: Instruction list - enemy projectile $8E50 (Draygon goop) ;;;
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


;;; $8C58: Shot instruction list - enemy projectile $8E50 (Draygon goop) ;;;
InstList_EnemyProjectile_DraygonGoop_Shot:
    dw $0008,EnemyProjSpritemaps_DraygonGoop_4
    dw $0008,EnemyProjSpritemaps_DraygonGoop_5
    dw Instruction_SpawnEnemyDropsWIthDraygonEyeDropChances
    dw Instruction_EnemyProjectile_GotoY
    dw InstList_EnemyProjectile_Delete
    dw Instruction_EnemyProjectile_Delete


;;; $8C68: Instruction - spawn enemy drops with Draygon eye's drop chances ;;;
Instruction_SpawnEnemyDropsWIthDraygonEyeDropChances:
;; Parameters:
;;     X: Enemy projectile index
    PHY : PHX
    LDA.W EnemyProjectile_XPositions,X : STA.B DP_Temp12
    LDA.W EnemyProjectile_YPositions,X : STA.B DP_Temp14
    LDA.W #EnemyHeaders_DraygonEye
    JSL Spawn_Enemy_Drops
    PLX : PLY
    RTS


if !FEATURE_KEEP_UNREFERENCED
;;; $8C7E: Unused. Instruction list ;;;
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


;;; $8CA4: Instruction list - enemy projectile $8E5E (Draygon's wall turret projectile) ;;;
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


;;; $8CF6: Instruction - pre-instruction = $8DFF (Draygon's wall turret projectile - fired) ;;;
Instruction_SetPreInst_DraygonsWallTurretProjectile_Fired:
;; Parameters:
;;     X: Enemy projectile index
    LDA.W #PreInstruction_EnemyProj_DraygonsWallTurretProjectile_Fired : STA.W EnemyProjectile_PreInstructions,X
    RTS


if !FEATURE_KEEP_UNREFERENCED
;;; $8CFD: Unused. Pre-instruction = $8DCA (Draygon goop - stuck to Samus) ;;;
UNUSED_Inst_PreInstruction_DraygonGoop_StuckToSamus_868CFD:
;; Parameters:
;;     X: Enemy projectile index
    LDA.W #PreInstruction_DraygonGoop_StuckToSamus : STA.W EnemyProjectile_PreInstructions,X
    RTS
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $8D04: Initialisation AI - enemy projectile $8E50 (Draygon goop) ;;;
InitAI_EnemyProjectile_DraygonGoop:
;; Parameters:
;;     Y: Enemy projectile index
;;     $12: X position
;;     $14: Y position
;;     EnemyProjectile_InitParam0: Speed
;;     EnemyProjectile_InitParam1: Angle (using common maths convention)
    PHY : PHX
    TYX
    LDA.B DP_Temp12 : STA.W EnemyProjectile_XPositions,Y
    LDA.B DP_Temp14 : STA.W EnemyProjectile_YPositions,Y
    LDA.W EnemyProjectile_InitParam1 : STA.L EnemyProjectileAngles,X : STA.B DP_Temp12
    LDA.W EnemyProjectile_InitParam0 : STA.B DP_Temp14
    JSL Do_Some_Math_With_Sine_Cosine_Terrible_Label_Name              ; ($16.$18, $1A.$1C) = ([$14] * |cos([$12] * pi / 80h)|, [$14] * |sin([$12] * pi / 80h)|)
    LDA.B DP_Temp16 : STA.W EnemyProjectile_XVelocity,Y
    LDA.B DP_Temp18 : STA.W EnemyProjectile_Var0,Y
    LDA.B DP_Temp1A : STA.W EnemyProjectile_YVelocity,Y
    LDA.B DP_Temp1C : STA.W EnemyProjectile_Var1,Y
    LDA.W #$0400 : STA.W EnemyProjectile_GraphicsIndices,Y
    PLX : PLY
    RTS


;;; $8D40: Initialisation AI - enemy projectile $8E5E (Draygon's wall turret projectile) ;;;
InitAI_EnemyProjectile_DraygonsWallTurretProjectile:
;; Parameters:
;;     Y: Enemy projectile index
;;     $12: X position
;;     $14: Y position
;;     EnemyProjectile_InitParam0: Speed
    PHY : PHX
    JSR PlaceAndAim_DraygonsWallTurretProjectile
    LDA.W #$0A00 : STA.W EnemyProjectile_GraphicsIndices,Y
    LDA.W #RTS_868D54 : STA.W EnemyProjectile_PreInstructions,Y
    PLX : PLY
    RTS


;;; $8D54: RTS ;;;
RTS_868D54:
    RTS


if !FEATURE_KEEP_UNREFERENCED
;;; $8D55: Unused. Delete enemy projectile [Y] ;;;
UNUSED_Delete_EnemyProjectile_Y_868D55:
;; Parameters:
;;     Y: Enemy projectile index
    LDA.W #$0000 : STA.W EnemyProjectile_ID,Y
    RTS
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $8D5C: Delete enemy projectile if power bombed ;;;
Delete_EnemyProjectile_IfPowerBombed:
;; Parameters:
;;     X: Enemy projectile index
    PHY : PHX
    LDA.W SamusProjectile_PowerBombExplosionRadius+1 : AND.W #$00FF : STA.B DP_Temp12 : BEQ .return
    LSR : ADC.B DP_Temp12 : LSR : STA.B DP_Temp14
    LDA.W SamusProjectile_PowerBombExplosionXPosition : SEC : SBC.W EnemyProjectile_XPositions,X : BPL +
    EOR.W #$FFFF : INC

+   CMP.B DP_Temp12 : BCS .return
    LDA.W SamusProjectile_PowerBombExplosionYPosition : SEC : SBC.W EnemyProjectile_YPositions,X : BPL +
    EOR.W #$FFFF : INC

+   CMP.B DP_Temp14 : BCS .return
    STZ.W EnemyProjectile_ID,X : STZ.W XSpeedDivisor

  .return:
    PLX : PLY
    RTS


;;; $8D99: Instruction - Draygon goop / Samus collision ;;;
Instruction_DraygonGoop_SamusCollision:
;; Parameters:
;;     X: Enemy projectile index
    JSR Delete_EnemyProjectile_IfPowerBombed
    LDA.W XSpeedDivisor : INC : CMP.W #$0006 : BPL .return
    STA.W XSpeedDivisor : STA.W EnemyProjectile_Var1,X
    LDA.W #$0100 : STA.W EnemyProjectile_Var0,X
    LDA.W #PreInstruction_DraygonGoop_StuckToSamus : STA.W EnemyProjectile_PreInstructions,X
    LDA.W EnemyProjectile_Properties,X : AND.W #$7FFF : ORA.W #$2000 : STA.W EnemyProjectile_Properties,X
    STZ.W SamusInvincibilityTimer : STZ.W SamusKnockbackTimer

  .return:
    RTS


;;; $8DCA: Pre-instruction - Draygon goop - stuck to Samus ;;;
PreInstruction_DraygonGoop_StuckToSamus:
;; Parameters:
;;     X: Enemy projectile index
    JSR Delete_EnemyProjectile_IfPowerBombed
    LDA.W ContactDamageIndex : BNE +
    LDA.W SamusXPosition : STA.W EnemyProjectile_XPositions,X
    LDA.W EnemyProjectile_Var1,X : ASL #2 : CLC : ADC.W SamusYPosition
    SEC : SBC.W #$000C : STA.W EnemyProjectile_YPositions,X
    DEC.W EnemyProjectile_Var0,X
    LDA.W EnemyProjectile_Var0,X : BNE .return

+   STZ.W EnemyProjectile_ID,X
    DEC.W XSpeedDivisor
    LDA.W XSpeedDivisor : BPL .return
    STZ.W XSpeedDivisor

  .return:
    RTS


;;; $8DFF: Pre-instruction - Draygon's wall turret projectile - fired ;;;
PreInstruction_EnemyProj_DraygonsWallTurretProjectile_Fired:
;; Parameters:
;;     X: Enemy projectile index
    JSR Delete_EnemyProjectile_IfPowerBombed
    JSR Move_EnemyProjectile_AccordingToAngleAndSpeed
    JSR CheckIf_EnemyProjectile_IsInDraygonRoomBoundaries
    BNE .delete
    RTS

  .delete:
    STZ.W EnemyProjectile_ID,X
    RTS


;;; $8E0F: Pre-instruction - enemy projectile $8E50 (Draygon goop) ;;;
PreInstruction_EnemyProjectile_DraygonGoop:
;; Parameters:
;;     X: Enemy projectile index
    JSR Delete_EnemyProjectile_IfPowerBombed
    JSR Move_EnemyProjectile_AccordingToAngleAndSpeed
    LDA.W SamusXPosition : SEC : SBC.W EnemyProjectile_XPositions,X : BPL +
    EOR.W #$FFFF : INC

+   CMP.W #$0010 : BPL .checkRoomBoundaries
    LDA.W SamusYPosition : SEC : SBC.W EnemyProjectile_YPositions,X : BPL +
    EOR.W #$FFFF : INC

+   CMP.W #$0014 : BPL .checkRoomBoundaries
    LDA.W #InstList_EnemyProjectile_DraygonGoop_Touch : STA.W EnemyProjectile_InstListPointers,X
    LDA.W #$0001 : STA.W EnemyProjectile_InstructionTimers,X
    RTS

  .checkRoomBoundaries:
    JSR CheckIf_EnemyProjectile_IsInDraygonRoomBoundaries
    BNE .delete
    RTS

  .delete:
    STZ.W EnemyProjectile_ID,X
    RTS


;;; $8E50: Enemy projectiles - Draygon ;;;
EnemyProjectile_DraygonGoop:
    %EnemyProjectile(\
    %initAI(InitAI_EnemyProjectile_DraygonGoop),
    %preInst(PreInstruction_EnemyProjectile_DraygonGoop),
    %instList(InstList_EnemyProjectile_DraygonGoop),
    %radius(8, 8),
    %properties($D000),
    %hitList(InstList_EnemyProjectile_DraygonGoop_Touch),
    %shotList(InstList_EnemyProjectile_DraygonGoop_Shot))

EnemyProjectile_DraygonWallTurret:
    %EnemyProjectile(\
    %initAI(InitAI_EnemyProjectile_DraygonsWallTurretProjectile),
    %preInst(PreInstruction_EnemyProj_DraygonsWallTurretProjectile_Fired),
    %instList(InstList_EnemyProjectile_DraygonsWallTurretProjectile_0),
    %radius(8, 8),
    %properties($1080),
    %hitList(0),
    %shotList(InstList_EnemyProj_MiscDust_3_SmallExplosion))

if !FEATURE_KEEP_UNREFERENCED
UNUSED_EnemyProjectile_Draygon_868E6C:
; This enemy projectile is a partially coded, small sprite with a fairly short animation loop that travels towards Draygon
; It doesn't collide with Samus, but it is shootable
; Uses the last row of evir tiles ($B1:9400), though I doubt those are the correct graphics for this enemy projectile
    %EnemyProjectile(\
    %initAI(UNUSED_InitAI_EnemyProjectile_Draygon_868E7A),
    %preInst(UNUSED_PreInstruction_EnemyProjectile_Draygon_868E99),
    %instList(InstList_EnemyProjectile_DraygonsWallTurretProjectile_0),
    %radius(8, 8),
    %properties($7000),
    %hitList(0),
    %shotList(InstList_EnemyProj_MiscDust_3_SmallExplosion))


;;; $8E7A: Initialisation AI - enemy projectile $8E6C ;;;
UNUSED_InitAI_EnemyProjectile_Draygon_868E7A:
;; Parameters:
;;     Y: Enemy projectile index
;;     $12: X position
;;     $14: Y position
    PHX
    LDA.W #$03F0 : STA.W EnemyProjectile_GraphicsIndices,Y
    LDA.B DP_Temp12 : STA.W EnemyProjectile_XPositions,Y
    LDA.B DP_Temp14 : STA.W EnemyProjectile_YPositions,Y
    LDA.W #UNUSED_InstList_EnemyProjectile_Draygon_868EDF : STA.W EnemyProjectile_InstListPointers,Y
    LDA.W #$0001 : STA.W EnemyProjectile_InstructionTimers,Y
    PLX
    RTS


;;; $8E99: Pre-instruction - enemy projectile $8E6C ;;;
UNUSED_PreInstruction_EnemyProjectile_Draygon_868E99:
;; Parameters:
;;     X: Enemy projectile index
    LDA.W Enemy.XPosition : SEC : SBC.B DP_Temp12 : STA.B DP_Temp12
    LDA.W Enemy.YPosition : SEC : SBC.B DP_Temp14 : STA.B DP_Temp14
    JSL CalculateAngleOf_12_14_Offset
    EOR.W #$00FF : INC
    CLC : ADC.W #$0040 : AND.W #$00FF : STA.L EnemyProjectileAngles,X : STA.B DP_Temp12
    LDA.W #$0001 : STA.B DP_Temp14
    JSL Do_Some_Math_With_Sine_Cosine_Terrible_Label_Name                                                      ; ($16.$18, $1A.$1C) = ([$14] * |cos([$12] * pi / 80h)|, [$14] * |sin([$12] * pi / 80h)|)
    LDA.B DP_Temp16 : STA.W EnemyProjectile_XVelocity,X
    LDA.B DP_Temp18 : STA.W EnemyProjectile_Var0,X
    LDA.B DP_Temp1A : STA.W EnemyProjectile_YVelocity,X
    LDA.B DP_Temp1C : STA.W EnemyProjectile_Var1,X
    JSR Move_EnemyProjectile_AccordingToAngleAndSpeed
    RTS


;;; $8EDF: Instruction list - enemy projectile $8E6C ;;;
UNUSED_InstList_EnemyProjectile_Draygon_868EDF:
    dw $0005,UNUSED_EnemyProjSpritemaps_Draygon_0_8D8967
    dw $0005,UNUSED_EnemyProjSpritemaps_Draygon_1_8D896E
    dw $0005,UNUSED_EnemyProjSpritemaps_Draygon_0_8D8967
    dw $0005,UNUSED_EnemyProjSpritemaps_Draygon_2_8D8975
    dw Instruction_EnemyProjectile_GotoY
    dw UNUSED_InstList_EnemyProjectile_Draygon_868EDF


;;; $8EF3: Unused. Instruction list ;;;
UNUSED_InstList_EnemyProjectile_868EF3:
    dw $0005,UNUSED_EnemyProjSpritemaps_0_8D897C
    dw $0005,UNUSED_EnemyProjSpritemaps_1_8D8983
    dw $0005,UNUSED_EnemyProjSpritemaps_0_8D897C
    dw $0005,UNUSED_EnemyProjSpritemaps_2_8D898A
    dw Instruction_EnemyProjectile_GotoY
    dw UNUSED_InstList_EnemyProjectile_868EF3


;;; $8F07: Unused. Instruction list ;;;
UNUSED_InstList_EnemyProjectile_868F07:
    dw $0005,UNUSED_EnemyProjSpritemaps_0_8D8991
    dw $0005,UNUSED_EnemyProjSpritemaps_1_8D8998
    dw $0005,UNUSED_EnemyProjSpritemaps_0_8D8991
    dw $0005,UNUSED_EnemyProjSpritemaps_2_8D899F
    dw Instruction_EnemyProjectile_GotoY
    dw UNUSED_InstList_EnemyProjectile_868F07


;;; $8F1B: Unused. Instruction list ;;;
UNUSED_InstList_EnemyProjectile_868F1B:
    dw $0005,UNUSED_EnemyProjSpritemaps_0_8D89A6
    dw $0005,UNUSED_EnemyProjSpritemaps_1_8D89AD
    dw $0005,UNUSED_EnemyProjSpritemaps_0_8D89A6
    dw $0005,UNUSED_EnemyProjSpritemaps_2_8D89B4
    dw Instruction_EnemyProjectile_GotoY
    dw UNUSED_InstList_EnemyProjectile_868F1B


;;; $8F2F: Unused. Instruction list ;;;
UNUSED_InstList_EnemyProjectile_868F2F:
    dw $0005,UNUSED_EnemyProjSpritemaps_0_8D89BB
    dw $0005,UNUSED_EnemyProjSpritemaps_1_8D89C2
    dw $0005,UNUSED_EnemyProjSpritemaps_0_8D89BB
    dw $0005,UNUSED_EnemyProjSpritemaps_2_8D89C9
    dw Instruction_EnemyProjectile_GotoY
    dw UNUSED_InstList_EnemyProjectile_868F2F


;;; $8F43: Unused. Instruction list ;;;
UNUSED_InstList_EnemyProjectile_868F43:
    dw $0005,UNUSED_EnemyProjSpritemaps_0_8D89D0
    dw $0005,UNUSED_EnemyProjSpritemaps_1_8D89D7
    dw $0005,UNUSED_EnemyProjSpritemaps_0_8D89D0
    dw $0005,UNUSED_EnemyProjSpritemaps_2_8D89DE
    dw Instruction_EnemyProjectile_GotoY
    dw UNUSED_InstList_EnemyProjectile_868F43


;;; $8F57: Unused. Instruction list ;;;
UNUSED_InstList_EnemyProjectile_868F57:
    dw $0005,UNUSED_EnemyProjSpritemaps_0_8D89E5
    dw $0005,UNUSED_EnemyProjSpritemaps_1_8D89EC
    dw $0005,UNUSED_EnemyProjSpritemaps_0_8D89E5
    dw $0005,UNUSED_EnemyProjSpritemaps_2_8D89F3
    dw Instruction_EnemyProjectile_GotoY
    dw UNUSED_InstList_EnemyProjectile_868F57


;;; $8F6B: Unused. Instruction list ;;;
UNUSED_InstList_EnemyProjectile_868F6B:
    dw $0005,UNUSED_EnemyProjSpritemaps_0_8D89FA
    dw $0005,UNUSED_EnemyProjSpritemaps_1_8D8A01
    dw $0005,UNUSED_EnemyProjSpritemaps_0_8D89FA
    dw $0005,UNUSED_EnemyProjSpritemaps_2_8D8A08
    dw Instruction_EnemyProjectile_GotoY
    dw UNUSED_InstList_EnemyProjectile_868F6B


;;; $8F7F: Unused. Instruction list pointers ;;;
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


;;; $8F8F: Enemy projectiles - Crocomire ;;;
EnemyProjectile_CrocomiresProjectile:
    %EnemyProjectile(\
    %initAI(InitAI_EnemyProjectile_CrocomiresProjectile),
    %preInst(PreInstruction_EnemyProjectile_CrocomiresProjectile_Setup),
    %instList(InstList_EnemyProjectile_CrocomiresProjectile),
    %radius(8, 8),
    %properties($8014),
    %hitList(0),
    %shotList(InstList_EnemyProjectile_Shot_CrocomiresProjectile))

EnemyProjectile_CrocomireBridgeCrumbling:
    %EnemyProjectile(\
    %initAI(InitAI_EnemyProjectile_CrocomireBridgeCrumbling),
    %preInst(PreInstruction_EnemyProjectile_CrocomireBridgeCrumbling),
    %instList(InstList_EnemyProjectile_CrocomireBridgeCrumbling),
    %radius(4, 4),
    %properties($8000),
    %hitList(0),
    %shotList(InstList_EnemyProjectile_Delete))


;;; $8FAB: Unused. Instruction list - Crocomire's projectile - part 1/3 ;;;
if !FEATURE_KEEP_UNREFERENCED
UNUSED_InstList_EnemyProj_CrocomiresProjectile_Part1_868FAB:
    dw $0005,EnemyProjSpritemaps_CrocomiresProjectile_0
    dw $0005,EnemyProjSpritemaps_CrocomiresProjectile_1
    dw Instruction_EnemyProjectile_GotoY
    dw UNUSED_InstList_EnemyProj_CrocomiresProjectile_Part1_868FAB


;;; $8FB7: Unused. Instruction list - Crocomire's projectile - part 2/3 ;;;
UNUSED_InstList_EnemyProj_CrocomiresProjectile_Part2_868FB7:
    dw $0005,EnemyProjSpritemaps_CrocomiresProjectile_2
    dw $0005,EnemyProjSpritemaps_CrocomiresProjectile_3
    dw Instruction_EnemyProjectile_GotoY
    dw UNUSED_InstList_EnemyProj_CrocomiresProjectile_Part2_868FB7


;;; $8FC3: Unused. Instruction list ;;;
UNUSED_InstList_EnemyProj_OldCrocomiresProjectile_868FC3:
; Might have been an old version of Crocomire's projectile that uses enemy graphics
    dw $0005,UNUSED_EnemyProjSpritemaps_OldCrocomiresProjectile_0_8D8082
    dw $0005,UNUSED_EnemyProjSpritemaps_OldCrocomiresProjectile_1_8D8098
    dw Instruction_EnemyProjectile_GotoY
    dw UNUSED_InstList_EnemyProj_OldCrocomiresProjectile_868FC3
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $8FCF: Instruction list - enemy projectile $8F8F (Crocomire's projectile) ;;;
InstList_EnemyProjectile_CrocomiresProjectile:
    dw $0003,EnemyProjSpritemaps_CrocomiresProjectile_0
    dw $0003,EnemyProjSpritemaps_CrocomiresProjectile_1
    dw $0003,EnemyProjSpritemaps_CrocomiresProjectile_2
    dw $0003,EnemyProjSpritemaps_CrocomiresProjectile_3
    dw $0003,EnemyProjSpritemaps_CrocomiresProjectile_2
    dw $0003,EnemyProjSpritemaps_CrocomiresProjectile_1
    dw Instruction_EnemyProjectile_GotoY
    dw InstList_EnemyProjectile_CrocomiresProjectile


;;; $8FEB: Instruction list - enemy projectile $8F9D (Crocomire bridge crumbling) ;;;
InstList_EnemyProjectile_CrocomireBridgeCrumbling:
    dw $7FFF,EnemyProjSpritemaps_CrocomiresBridgeCrumbling
    dw Instruction_EnemyProjectile_GotoY
    dw InstList_EnemyProjectile_CrocomireBridgeCrumbling


;;; $8FF3: Instruction list - enemy projectile $90C1 (Crocomire spike wall pieces) ;;;
InstList_EnemyProjectile_CrocomireSpikeWallPieces:
    dw $7FFF,EnemyProjSpritemaps_CrocomiresSpikeWallPieces
    dw Instruction_EnemyProjectile_GotoY
    dw InstList_EnemyProjectile_CrocomireSpikeWallPieces


if !FEATURE_KEEP_UNREFERENCED
;;; $8FFB: Unused. Instruction list ;;;
UNUSED_InstList_EnemyProj_CrocomireBridgeCrumbling_868FFB:
; Referenced by unused routine UNUSED_MoveEnemyProjectileUpFor6FramesThenDelete_86922F
; Looks vaguely related to Crocomire bridge crumbling
    dw $0002,UNUSED_EnemyProjSpritemaps_CrocomireBridgeCrumbling_0_8D8132
    dw $0002,UNUSED_EnemyProjSpritemaps_CrocomireBridgeCrumbling_1_8D813E
    dw $7FFF,UNUSED_EnemyProjSpritemaps_CrocomireBridgeCrumbling_2_8D815E
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $9007: Shot instruction list - enemy projectile $8F8F (Crocomire's projectile) ;;;
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


;;; $9023: Initialisation AI - enemy projectile $8F8F (Crocomire's projectile) ;;;
InitAI_EnemyProjectile_CrocomiresProjectile:
;; Parameters:
;;     Y: Enemy projectile index
    LDX.W EnemyIndex
    LDA.W #$FE00 : STA.W EnemyProjectile_XVelocity,Y
    LDA.W #$0001 : STA.W EnemyProjectile_YVelocity,Y
    LDA.W Enemy.XPosition,X : SEC : SBC.W #$0020 : STA.W EnemyProjectile_XPositions,Y
    LDA.W Enemy.YPosition,X : SEC : SBC.W #$0010 : STA.W EnemyProjectile_YPositions,Y
    LDA.W #$0000 : STA.W EnemyProjectile_Timers,Y
    STA.W EnemyProjectile_XSubPositions,Y : STA.W EnemyProjectile_YSubPositions,Y
    LDA.W #$0A00 : STA.W EnemyProjectile_GraphicsIndices,Y
    RTS


;;; $9059: Crocomire's projectile gradients ;;;
CrocomiresProjectile_Gradients:
; Signed values v such that v / -40h is the actual gradient
; (so v = 40h is the down-left diagonal, v = 0 is straight left, v = FFC0h is the up-left diagonal)
; Indexed by Enemy.var5
    dw $FFF0,$0000,$0020
    dw $FFF0,$0000,$0020
    dw $FFF0,$0000,$0020


;;; $906B: Pre-instruction - Crocomire's projectile - setup ;;;
PreInstruction_EnemyProjectile_CrocomiresProjectile_Setup:
;; Parameters:
;;     X: Enemy projectile index
    JSR Move_EnemyProjectile_Horizontally
    LDA.W #$0A00 : STA.W EnemyProjectile_GraphicsIndices
    LDA.W EnemyProjectile_Timers,X : CLC : ADC.W EnemyProjectile_XVelocity,X : STA.W EnemyProjectile_Timers,X
    LDA.W #$FFC0 : STA.B DP_Temp12
    PHX
    LDX.W Enemy.var5
    LDA.W CrocomiresProjectile_Gradients,X : STA.B DP_Temp14
    PLX : TXY
    JSL CalculateAngleOf_12_14_Offset
    ASL : TAX
    CLC
    LDA.L SineCosineTables_8bitSine_SignExtended,X : STA.B DP_Temp12
    ASL #2 : STA.W EnemyProjectile_XVelocity,Y
    CLC
    LDA.L SineCosineTables_NegativeCosine_SignExtended,X : STA.B DP_Temp12
    ASL #2 : STA.W EnemyProjectile_YVelocity,Y
    LDA.W #PreInstruction_EnemyProjectile_CrocomiresProjectile_Fired : STA.W EnemyProjectile_PreInstructions,Y
    RTS


;;; $90B3: Pre-instruction - Crocomire's projectile - fired ;;;
PreInstruction_EnemyProjectile_CrocomiresProjectile_Fired:
;; Parameters:
;;     X: Enemy projectile index
    JSR Move_EnemyProjectile_Horizontally
    BCS .delete
    JSR Move_EnemyProjectile_Vertically
    BCC .return

  .delete:
    STZ.W EnemyProjectile_ID,X

  .return:
    RTS


;;; $90C1: Enemy projectile - Crocomire spike wall pieces ;;;
EnemyProjectile_CrocomireSpikeWallPieces:
    %EnemyProjectile(\
    %initAI(InitAI_EnemyProjectile_CrocomireSpikeWallPieces),
    %preInst(PreInstruction_EnemyProjectile_CrocomireSpikeWallPieces),
    %instList(InstList_EnemyProjectile_CrocomireSpikeWallPieces),
    %radius(0, 0),
    %properties($0000),
    %hitList(0),
    %shotList(InstList_EnemyProjectile_Delete))


;;; $90CF: Initialisation AI - enemy projectile $90C1 (Crocomire spike wall pieces) ;;;
InitAI_EnemyProjectile_CrocomireSpikeWallPieces:
;; Parameters:
;;     Y: Enemy projectile index

; This code assumes the Crocomire spike wall piece enemy projectiles are the last 8 slots
; (enemy projectiles are spawned starting from the last slot)
    REP #$20
    TYA : SEC : SBC.W #$0014 : TAX
    LDA.W .Ypositions,X : STA.W EnemyProjectile_YPositions,Y
    LDA.W #$0210 : STA.W EnemyProjectile_XPositions,Y
    LDA.W #$0000 : STA.W EnemyProjectile_XVelocity,Y : STA.W EnemyProjectile_YVelocity,Y
    STA.W EnemyProjectile_Var0,Y : STA.W EnemyProjectile_Var1,Y
    STA.W EnemyProjectile_XSubPositions,Y : STA.W EnemyProjectile_YSubPositions,Y
    LDA.W #$FFFB : STA.W EnemyProjectile_YVelocity,Y
    LDA.W #$8800 : STA.W EnemyProjectile_Var1,Y
    RTS

  .Ypositions:
; Y positions, indexed by [enemy projectile index] - 14h
    dw $0038,$0048,$0058,$0068,$0078,$0088,$0098,$00A8


;;; $9115: Pre-instruction - enemy projectile $90C1 (Crocomire spike wall pieces) ;;;
PreInstruction_EnemyProjectile_CrocomireSpikeWallPieces:
;; Parameters:
;;     X: Enemy projectile index
    REP #$20
    LDA.W EnemyProjectile_Var0,X : CMP.W .maxAcceleration,X : BEQ .storeAcceleration
    CLC : ADC.W .accelerationDelta,X : CMP.W .maxAcceleration,X : BCC .storeAcceleration
    LDA.W .maxAcceleration,X

  .storeAcceleration:
    STA.W EnemyProjectile_Var0,X
    SEP #$20
    LDA.W EnemyProjectile_Var0+1,X : CLC : ADC.W EnemyProjectile_XVelocity,X : STA.W EnemyProjectile_XVelocity,X
    LDA.W EnemyProjectile_XVelocity+1,X : ADC.B #$00 : CMP.W .maxVelocity,X : BMI .storeVelocity
    LDA.W .maxVelocity,X

  .storeVelocity:
    STA.W EnemyProjectile_XVelocity+1,X
    LDA.W EnemyProjectile_XVelocity,X : CLC : ADC.W EnemyProjectile_XSubPositions+1,X : STA.W EnemyProjectile_XSubPositions+1,X
    LDA.W EnemyProjectile_XVelocity+1,X : ADC.W EnemyProjectile_XPositions,X : STA.W EnemyProjectile_XPositions,X
    LDA.W EnemyProjectile_XPositions+1,X : ADC.B #$00 : STA.W EnemyProjectile_XPositions+1,X
    REP #$20
    LDA.W EnemyProjectile_Var1,X : CLC : ADC.W #$3000 : STA.W EnemyProjectile_Var1,X
    LDA.W EnemyProjectile_YVelocity,X : ADC.W #$0000 : STA.W EnemyProjectile_YVelocity,X
    LDA.W EnemyProjectile_YSubPositions,X : CLC : ADC.W EnemyProjectile_Var1,X : STA.W EnemyProjectile_YSubPositions,X
    LDA.W EnemyProjectile_YPositions,X : ADC.W EnemyProjectile_YVelocity,X : STA.W EnemyProjectile_YPositions,X
    LDA.W EnemyProjectile_YPositions,X : CMP.W #$00A8 : BCC .return
    STZ.W EnemyProjectile_ID,X
    TXA : BIT.W #$0002 : BNE +
    PHX
    LDA.W #$0029
    JSL QueueSound_Lib2_Max6
    PLX

+   LDA.W EnemyProjectile_XPositions,X : STA.B DP_Temp12
    LDA.W EnemyProjectile_YPositions,X : STA.B DP_Temp14
    LDA.W #$0015
    LDY.W #EnemyProjectile_MiscDust
    JSL SpawnEnemyProjectileY_ParameterA_RoomGraphics
    LDA.W #$0025
    JSL QueueSound_Lib2_Max6

  .return:
    RTS

; Indexed by enemy projectile index
  .accelerationDelta:
; X acceleration delta (unit 1/10000h px/frame^3)
    dw $0000,$0000,$0FF0,$0EE0,$0CC0,$0AA0,$0880,$0660
    dw $0440,$0220,$0FF0,$0EE0,$0CC0,$0AA0,$0880,$0660
    dw $0440,$0220

  .maxAcceleration:
; Max X acceleration (unit 1/10000h px/frame^2)
    dw $0000,$0000,$FF00,$EE00,$CC00,$AA00,$8800,$6600
    dw $4400,$2200,$FF00,$EE00,$CC00,$AA00,$8800,$6600
    dw $4400,$2200

  .maxVelocity:
; Max X velocity (unit 1/100h px/frame)
    dw $0000,$0000,$0004,$0004,$0003,$0003,$0002,$0002
    dw $0001,$0001,$0006,$0005,$0004,$0003,$0002,$0002
    dw $0001,$0001


if !FEATURE_KEEP_UNREFERENCED
;;; $922F: Unused. Move enemy projectile up for 6 frames and then delete ;;;
UNUSED_MoveEnemyProjectileUpFor6FramesThenDelete_86922F:
;; Parameters:
;;     X: Enemy projectile index
    LDA.W SamusProjectile_XPositions,X ; >.<
    LDA.W #$0001 : STA.W EnemyProjectile_InstructionTimers,X
    LDA.W #UNUSED_InstList_EnemyProj_CrocomireBridgeCrumbling_868FFB : STA.W EnemyProjectile_InstListPointers,X
    LDA.W #UNUSED_PreInstruction_EnemyProjectile_MovingUp_869259 : STA.W EnemyProjectile_PreInstructions,X
    LDA.W #$0000 : STA.W EnemyProjectile_XVelocity,X
    LDA.W #$0002 : STA.W EnemyProjectile_YVelocity,X
    LDA.W #$0006 : STA.W EnemyProjectile_Var0,X : STA.W EnemyProjectile_Var1,X
; fallthrough to UNUSED_PreInstruction_EnemyProjectile_MovingUp_869259


;;; $9259: Unused. Pre-instruction - moving up ;;;
UNUSED_PreInstruction_EnemyProjectile_MovingUp_869259:
;; Parameters:
;;     X: Enemy projectile index
    LDA.W EnemyProjectile_YPositions,X : SEC : SBC.W EnemyProjectile_YVelocity,X : STA.W EnemyProjectile_YPositions,X
    LDA.W EnemyProjectile_Var0,X : DEC : STA.W EnemyProjectile_Var0,X : BNE .return
    STZ.W EnemyProjectile_ID,X

  .return:
    RTS
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $9270: Instruction - spawn enemy drops with Crocomire's drop chances ;;;
Instruction_SpawnEnemyDropsWithCrocomiresDropChances:
;; Parameters:
;;     X: Enemy projectile index
    PHY : PHX
    LDA.W EnemyProjectile_XPositions,X : STA.B DP_Temp12
    LDA.W EnemyProjectile_YPositions,X : STA.B DP_Temp14
    LDA.W #EnemyHeaders_Crocomire
    JSL Spawn_Enemy_Drops
    PLX : PLY
    RTS


;;; $9286: Initialisation AI - enemy projectile $8F9D (Crocomire bridge crumbling) ;;;
InitAI_EnemyProjectile_CrocomireBridgeCrumbling:
;; Parameters:
;;     Y: Enemy projectile index
;;     EnemyProjectile_InitParam0: X position
    PHX
    LDX.W EnemyIndex
    LDA.W EnemyProjectile_InitParam0 : STA.W EnemyProjectile_XPositions,Y
    LDA.W #$00BB : STA.W EnemyProjectile_YPositions,Y
    LDA.W #$0000 : STA.W EnemyProjectile_YSubPositions,Y : STA.W EnemyProjectile_XSubPositions,Y
    LDA.W #$0000 : STA.W EnemyProjectile_XVelocity,Y
    LDA.W RandomNumberSeed : AND.W #$003F : CLC : ADC.W #$0040 : STA.W EnemyProjectile_YVelocity,Y
    LDA.W #$0400 : STA.W EnemyProjectile_GraphicsIndices,Y
    PLX
    RTS


;;; $92BA: Pre-instruction - enemy projectile $8F9D (Crocomire bridge crumbling) ;;;
PreInstruction_EnemyProjectile_CrocomireBridgeCrumbling:
;; Parameters:
;;     X: Enemy projectile index
    PHP
    REP #$20
    JSR Move_EnemyProjectile_Vertically
    BCS .delete
    LDA.W EnemyProjectile_YVelocity,X : CLC : ADC.W #$0018 : AND.W #$3FFF : STA.W EnemyProjectile_YVelocity,X
    PLP
    RTS

  .delete:
    STZ.W EnemyProjectile_ID,X
    PLP
    RTS


;;; $92D6: Move enemy projectile according to enemy projectile velocity ;;;
Move_EnemyProjectile_AccordingToVelocity:
;; Parameters:
;;     X: Enemy projectile index

; Uses EnemyProjectile_XVelocity / 100h as X velocity
; Uses EnemyProjectile_YVelocity / 100h as Y velocity
; Uses EnemyProjectile_XSubPositions+1 as 1/100h px X subposition
; Uses EnemyProjectile_YSubPositions+1 as 1/100h px Y subposition
    LDA.W EnemyProjectile_XVelocity,X
    SEP #$20
    CLC : ADC.W EnemyProjectile_XSubPositions+1,X : STA.W EnemyProjectile_XSubPositions+1,X
    REP #$20
    AND.W #$FF00 : XBA : BPL +
    ORA.W #$FF00

+   ADC.W EnemyProjectile_XPositions,X : STA.W EnemyProjectile_XPositions,X
; fallthrough to Move_EnemyProjectile_Vertically_AccordingToVelocity


;;; $92F3: Move enemy projectile according to enemy projectile Y velocity ;;;
Move_EnemyProjectile_Vertically_AccordingToVelocity:
;; Parameters:
;;     X: Enemy projectile index

; Uses [enemy projectile EnemyProjectile_YVelocity] / 100h as Y velocity
; Uses enemy projectile EnemyProjectile_YSubPositions+1 as 1/100h px Y subposition (or equivalently enemy projectile EnemyProjectile_YSubPositions as 1/10000h px Y subposition)
    LDA.W EnemyProjectile_YVelocity,X
    SEP #$20
    CLC : ADC.W EnemyProjectile_YSubPositions+1,X : STA.W EnemyProjectile_YSubPositions+1,X
    REP #$20
    AND.W #$FF00 : XBA : BPL +
    ORA.W #$FF00

+   ADC.W EnemyProjectile_YPositions,X : STA.W EnemyProjectile_YPositions,X
    RTS


;;; $9311: Move enemy projectile according to enemy projectile X velocity ;;;
Move_EnemyProjectile_Horizontally_AccordingToVelocity:
;; Parameters:
;;     X: Enemy projectile index

; Uses EnemyProjectile_XVelocity / 100h as X velocity
; Uses EnemyProjectile_XSubPositions+1 as 1/100h px X subposition (or equivalently EnemyProjectile_XSubPositions as 1/10000h px X subposition)
    LDA.W EnemyProjectile_XVelocity,X
    SEP #$20
    CLC : ADC.W EnemyProjectile_XSubPositions+1,X : STA.W EnemyProjectile_XSubPositions+1,X
    REP #$20
    AND.W #$FF00 : XBA : BPL +
    ORA.W #$FF00

+   ADC.W EnemyProjectile_XPositions,X : STA.W EnemyProjectile_XPositions,X
    RTS


;;; $932F: Set Ridley's fireball / afterburn damage ;;;
Set_RidleysFireball_Afterburn_Damage:
;; Parameters:
;;     X: Pointer to enemy projectile properties values
;;     Y: Enemy projectile index
    LDA.W AreaIndex : CMP.W #$0002 : BEQ .norfair
    CMP.W #$0005 : BEQ .tourian
    LDA.W $0000,X
    BRA .store

  .tourian:
    LDA.W $0004,X
    BRA .store

  .norfair:
    LDA.W $0002,X

  .store:
    STA.W EnemyProjectile_Properties,Y
    RTS


if !FEATURE_KEEP_UNREFERENCED
;;; $934D: Initialisation AI - enemy projectile $9634 (unused) ;;;
UNUSED_InitAI_EnemyProj_RidleysFireball_Afterburn_86934D:
;; Parameters:
;;     Y: Enemy projectile index
    LDA.W #$0000 : STA.W EnemyProjectile_Var0,Y : STA.W EnemyProjectile_Var1,Y
    LDA.W Enemy.XPosition : CLC : ADC.W #$FFE3 : STA.W EnemyProjectile_XPositions,Y
    LDA.W Enemy.YPosition : CLC : ADC.W #$FFDD : STA.W EnemyProjectile_YPositions,Y
    LDA.W #$0A00 : STA.W EnemyProjectile_GraphicsIndices,Y
    LDA.W Enemy.init0 : ASL : TAX
    LDA.W .Xvelocity,X : STA.W EnemyProjectile_XVelocity,Y
    LDA.W .Yvelocity,X : STA.W EnemyProjectile_YVelocity,Y
    RTS

  .Xvelocity:
    dw $FE00,$FE10,$FE44,$FE96

  .Yvelocity:
    dw $0000,$0088,$00FC,$016A


;;; $9392: Pre-instruction - enemy projectile $9634 (unused) ;;;
UNUSED_PreInst_EnemyProj_RidleyFireball_Afterburn_869392:
;; Parameters:
;;     X: Enemy projectile index
    LDA.W EnemyProjectile_Var0,X : CMP.W #$0008 : BCS .greaterThan8
    INC.W EnemyProjectile_Var0,X
    RTS

  .greaterThan8:
    JSR Move_EnemyProjectile_AccordingToVelocity
    JSR Move_EnemyProjectile_Vertically
    BCS .collision
    RTS

  .collision:
    LDA.W #InstList_EnemyProjectile_Afterburn_Final : STA.W EnemyProjectile_InstListPointers,X
    INC.W EnemyProjectile_Var0,X
    LDA.W #$0001 : STA.W EnemyProjectile_InstructionTimers,X
    STZ.W EnemyProjectile_XVelocity,X : STZ.W EnemyProjectile_YVelocity,X
    LDA.W #$0A00 : STA.W EnemyProjectile_GraphicsIndices,X
    LDA.W #$002B
    JSL QueueSound_Lib2_Max6
    RTS
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $93CA: Initialisation AI - enemy projectile $9642 (Ridley's fireball) ;;;
InitAI_EnemyProjectile_RidleyFireball:
;; Parameters:
;;     Y: Enemy projectile index
;;     EnemyProjectile_InitParam0: Ridley facing direction. 0 = left, otherwise = right
;;     EnemyProjectile_InitParam1: Afterburn flag. 0 = spawn afterburn
    LDA.W EnemyProjectile_InitParam1 : STA.W EnemyProjectile_Var1,Y
    LDA.W EnemyProjectile_InitParam0 : BNE .right
    LDA.W #$FFE7
    BRA +

  .right:
    LDA.W #$0019

+   CLC : ADC.W Enemy.XPosition : STA.W EnemyProjectile_XPositions,Y
    LDA.W #$FFD5 : CLC : ADC.W Enemy.YPosition : STA.W EnemyProjectile_YPositions,Y
    LDA.W #$0A00 : STA.W EnemyProjectile_GraphicsIndices,Y
    LDA.L Ridley.fireballXComponentOfSpeed : STA.W EnemyProjectile_XVelocity,Y
    LDA.L Ridley.fireballYComponentOfSpeed : STA.W EnemyProjectile_YVelocity,Y
; fallthrough to Set_RidleyFireball_Afterburn_Properties


;;; $9402: Set Ridley's fireball / afterburn properties ;;;
Set_RidleyFireball_Afterburn_Properties:
;; Parameters:
;;     Y: Enemy projectile index
    LDX.W #.propertyValues
    JMP Set_RidleysFireball_Afterburn_Damage

  .propertyValues
    dw $5003 ; Default
    dw $503C ; Norfair
    dw $5050 ; Tourian


;;; $940E: Pre-instruction - enemy projectile $9642 (Ridley's fireball) ;;;
PreInstruction_EnemyProjectile_RidleyFireball:
;; Parameters:
;;     X: Enemy projectile index
    JSR Move_EnemyProjectile_Horizontally
    BCS .hitWall
    JSR Move_EnemyProjectile_Vertically
    BCS .collision
    RTS

  .collision:
    LDY.W #EnemyProjectile_RidleyHorizontalAfterburn_Center
    BRA .merge

  .hitWall:
    LDY.W #EnemyProjectile_RidleyVerticalAfterburn_Center

  .merge:
    STZ.W EnemyProjectile_ID,X
    LDA.W EnemyProjectile_Var1,X : BNE .return
    LDA.W EnemyProjectile_XPositions,X : STA.B DP_Temp12
    LDA.W EnemyProjectile_YPositions,X : STA.B DP_Temp14
    LDA.W #$0003
    JSL SpawnEnemyProjectileY_ParameterA_RoomGraphics
    LDA.W #$002B
    JSL QueueSound_Lib2_Max6

  .return:
    RTS


if !FEATURE_KEEP_UNREFERENCED
;;; $9442: Unused. Do fireball damage to Samus and turn into smoke ;;;
UNUSED_DoFireballDamageToSamus_TurnIntoSmoke_869442:
;; Parameters:
;;     X: Enemy projectile index
    LDA.W #UNUSED_InstList_Smoke_86945F : STA.W EnemyProjectile_InstListPointers,X
    LDA.W #$0001 : STA.W EnemyProjectile_InstructionTimers,X
    LDA.W #$0003
    LDY.W AreaIndex : CPY.W #$0002 : BNE .gotoHurtSamus
    LDA.W #$003C

  .gotoHurtSamus:
    JMP Hurt_Samus


;;; $945F: Unused. Instruction list - smoke ;;;
UNUSED_InstList_Smoke_86945F:
; Used by unused routine UNUSED_DoFireballDamageToSamus_TurnIntoSmoke_869442
    dw UNUSED_Instruction_DisableCollisionsWithSamus_869475
    dw Instruction_EnemyProjectile_ClearPreInstruction
    dw $0008,EnemyProjSpritemaps_Common_Smoke_0
    dw $0008,EnemyProjSpritemaps_Common_Smoke_1
    dw $0008,EnemyProjSpritemaps_Common_Smoke_2
    dw $0008,EnemyProjSpritemaps_Common_Smoke_3
    dw Instruction_EnemyProjectile_Delete


;;; $9475: Unused. Instruction - disable collisions with Samus ;;;
UNUSED_Instruction_DisableCollisionsWithSamus_869475:
;; Parameters:
;;     X: Enemy projectile index
    LDA.W EnemyProjectile_Properties,X : ORA.W #$2000 : STA.W EnemyProjectile_Properties,X
    RTS
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $947F: Initialisation AI - enemy projectile $9650/$965E (afterburn - centre) ;;;
InitAI_EnemyProjectile_Afterburn_Center:
;; Parameters:
;;     Y: Enemy projectile index
;;     EnemyProjectile_InitParam0: Number of afterburn enemy projectiles
    TYX
    LDA.W #$0A00 : STA.W EnemyProjectile_GraphicsIndices,X
    LDA.B DP_Temp12 : STA.W EnemyProjectile_XPositions,X
    LDA.B DP_Temp14 : STA.W EnemyProjectile_YPositions,X
    LDA.W EnemyProjectile_InitParam0 : STA.W EnemyProjectile_Var0,X
    STZ.W EnemyProjectile_Var1,X
    STZ.W EnemyProjectile_XVelocity,X : STZ.W EnemyProjectile_YVelocity,X
    RTS


;;; $94A0: Initialisation AI - enemy projectile $9688/$96C0 (vertical afterburn - up) ;;;
InitAI_EnemyProjectile_VerticalAfterburn_Up:
;; Parameters:
;;     Y: Enemy projectile index
;;     EnemyProjectile_InitParam0: Old enemy projectile index
    LDX.W EnemyProjectile_InitParam0
    LDA.W #$0000 : STA.W EnemyProjectile_XVelocity,Y
    LDA.W #$F200 : STA.W EnemyProjectile_YVelocity,Y
    LDA.W #EnemyProjectile_RidleyVerticalAfterburn_Up
    BRA InitAI_EnemyProjectile_Afterburn_Common


;;; $94B4: Initialisation AI - enemy projectile $9696/$96CE (vertical afterburn - down) ;;;
InitAI_EnemyProjectile_VerticalAfterburn_Down:
;; Parameters:
;;     Y: Enemy projectile index
;;     EnemyProjectile_InitParam0: Old enemy projectile index
    LDX.W EnemyProjectile_InitParam0
    LDA.W #$0000 : STA.W EnemyProjectile_XVelocity,Y
    LDA.W #$0E00 : STA.W EnemyProjectile_YVelocity,Y
    LDA.W #EnemyProjectile_RidleyVerticalAfterburn_Down
    BRA InitAI_EnemyProjectile_Afterburn_Common


;;; $94C8: Initialisation AI - enemy projectile $966C/$96A4 (horizontal afterburn - right) ;;;
InitAI_EnemyProjectile_HorizontalAfterburn_Right:
;; Parameters:
;;     Y: Enemy projectile index
;;     EnemyProjectile_InitParam0: Old enemy projectile index
    LDX.W EnemyProjectile_InitParam0
    LDA.W #$0E00 : STA.W EnemyProjectile_XVelocity,Y
    LDA.W #$0000 : STA.W EnemyProjectile_YVelocity,Y
    LDA.W #EnemyProjectile_RidleyHorizontalAfterburn_Right
    BRA InitAI_EnemyProjectile_Afterburn_Common


;;; $94DC: Initialisation AI - enemy projectile $967A/$96B2 (horizontal afterburn - left) ;;;
InitAI_EnemyProjectile_HorizontalAfterburn_Left:
;; Parameters:
;;     Y: Enemy projectile index
;;     EnemyProjectile_InitParam0: Old enemy projectile index
    LDX.W EnemyProjectile_InitParam0
    LDA.W #$F200 : STA.W EnemyProjectile_XVelocity,Y
    LDA.W #$0000 : STA.W EnemyProjectile_YVelocity,Y
    LDA.W #EnemyProjectile_RidleyHorizontalAfterburn_Left
; fallthrough to InitAI_EnemyProjectile_Afterburn_Common


;;; $94EE: Common afterburn initialisation - right/left/up/down ;;;
InitAI_EnemyProjectile_Afterburn_Common:
;; Parameters:
;;     A: Next afterburn enemy projectile ID
;;     X: Old enemy projectile index
;;     Y: Enemy projectile index
    STA.W EnemyProjectile_Var1,Y
    LDA.W EnemyProjectile_XPositions,X : STA.W EnemyProjectile_XPositions,Y
    LDA.W EnemyProjectile_YPositions,X : STA.W EnemyProjectile_YPositions,Y
    LDA.W EnemyProjectile_Var0,X : STA.W EnemyProjectile_Var0,Y
    LDA.W #$0A00 : STA.W EnemyProjectile_GraphicsIndices,Y
    JMP Set_RidleyFireball_Afterburn_Properties


;;; $950C: RTS. Pre-instruction - enemy projectile $9650/$965E (afterburn - centre) ;;;
RTS_86950C:
    RTS


;;; $950D: Pre-instruction - enemy projectile $966C/$967A (horizontal afterburn - right/left) ;;;
PreInstruction_EnemyProjectile_HorizontalAfterburn:
;; Parameters:
;;     X: Enemy projectile index
    JSR Move_EnemyProjectile_Horizontally_AccordingToVelocity
    JSR Move_EnemyProjectile_Vertically
    BCC .return
    LDA.W #InstList_EnemyProjectile_Afterburn_Final : STA.W EnemyProjectile_InstListPointers,X
    LDA.W #$0001 : STA.W EnemyProjectile_InstructionTimers,X

  .return:
    RTS


;;; $9522: Pre-instruction - enemy projectile $9688/$9696 (vertical afterburn - up/down) ;;;
PreInstruction_EnemyProjectile_VerticalAfterburn:
;; Parameters:
;;     X: Enemy projectile index
    JSR Move_EnemyProjectile_Vertically_AccordingToVelocity
    JSR Move_EnemyProjectile_Horizontally
    BCC .return
    LDA.W #InstList_EnemyProjectile_Afterburn_Final : STA.W EnemyProjectile_InstListPointers,X
    LDA.W #$0001 : STA.W EnemyProjectile_InstructionTimers,X

  .return:
    RTS


if !FEATURE_KEEP_UNREFERENCED
;;; $9537: Pre-instruction - enemy projectile $96A4/$96B2 (unused. Proto horizontal afterburn - right/left) ;;;
UNUSED_PreInstruction_ProtoHorizontalAfterburn_869537:
;; Parameters:
;;     X: Enemy projectile index
    JSR Move_EnemyProjectile_Horizontally
    BCC .return
    STZ.W EnemyProjectile_ID,X

  .return:
    RTS


;;; $9540: Pre-instruction - enemy projectile $96C0 (unused. Proto vertical afterburn - up) ;;;
UNUSED_PreInstruction_ProtoVerticalAfterburn_Up_869540:
;; Parameters:
;;     X: Enemy projectile index
    JSR Move_EnemyProjectile_Vertically
    BCC .return
    STZ.W EnemyProjectile_ID,X

  .return:
    RTS


;;; $9549: Pre-instruction - enemy projectile $96CE (unused. Proto vertical afterburn - down) ;;;
UNUSED_PreInstruction_ProtoVerticalAfterburn_Down_869549:
;; Parameters:
;;     X: Enemy projectile index

; Clone of UNUSED_PreInstruction_ProtoVerticalAfterburn_Up_869540
    JSR Move_EnemyProjectile_Vertically
    BCC .return
    STZ.W EnemyProjectile_ID,X

  .return:
    RTS
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $9552: Instruction list - enemy projectile $9634/$9642 (Ridley's fireball) ;;;
InstList_EnemyProjectile_RidleysFireball_0:
; Doesn't really make sense to use this instruction list with UNUSED_EnemyProjectile_Ridley_869634
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


;;; $9574: Instruction list - afterburn - final ;;;
InstList_EnemyProjectile_Afterburn_Final:
    dw Instruction_EnemyProjectile_ClearPreInstruction
    dw $0005,EnemyProjSpritemaps_RidleysFireball_MBBombExplosion_0
    dw $0005,EnemyProjSpritemaps_RidleysFireball_MBBombExplosion_1
    dw $0005,EnemyProjSpritemaps_RidleysFireball_MBBombExplosion_2
    dw $0005,EnemyProjSpritemaps_RidleysFireball_MBBombExplosion_3
    dw $0005,EnemyProjSpritemaps_RidleysFireball_MBBombExplosion_4
    dw Instruction_EnemyProjectile_Delete


if !FEATURE_KEEP_UNREFERENCED
;;; $958C: Unused. Instruction list ;;;
UNUSED_InstList_EnemyProjectile_86958C:
; References graphics not in Ridley or Mother Brain's VRAM
; But looks like an 8x8 px² version of the InstList_EnemyProjectile_RidleysFireball_1 loop
    dw $0002,UNUSED_EnemyProjSpritemaps_0_8D80AE
    dw $0002,UNUSED_EnemyProjSpritemaps_1_8D80B5
    dw $0002,UNUSED_EnemyProjSpritemaps_2_8D80BC
    dw $0002,UNUSED_EnemyProjSpritemaps_3_8D80C3
    dw Instruction_EnemyProjectile_GotoY
    dw UNUSED_InstList_EnemyProjectile_86958C
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $95A0: Instruction list - enemy projectile $9650 (horizontal afterburn - center) ;;;
InstList_EnemyProjectile_HorizontalAfterburn_Center:
    dw Instruction_EnemyProjectile_ClearPreInstruction
    dw $0005,EnemyProjSpritemaps_RidleysFireball_MBBombExplosion_0
    dw Instruction_Spawn_HorizontalAfterburn_EnemyProjectiles
    dw $0005,EnemyProjSpritemaps_RidleysFireball_MBBombExplosion_1
    dw $0005,EnemyProjSpritemaps_RidleysFireball_MBBombExplosion_2
    dw $0005,EnemyProjSpritemaps_RidleysFireball_MBBombExplosion_3
    dw $0005,EnemyProjSpritemaps_RidleysFireball_MBBombExplosion_4
    dw Instruction_EnemyProjectile_Delete


;;; $95BA: Instruction - spawn horizontal afterburn enemy projectiles ;;;
Instruction_Spawn_HorizontalAfterburn_EnemyProjectiles:
;; Parameters:
;;     X: Enemy projectile index
    PHY
    STZ.W EnemyProjectile_InitParam1
    TXA
    LDY.W #EnemyProjectile_RidleyHorizontalAfterburn_Right
    JSL SpawnEnemyProjectileY_ParameterA_RoomGraphics
    STZ.W EnemyProjectile_InitParam1
    TXA
    LDY.W #EnemyProjectile_RidleyHorizontalAfterburn_Left
    JSL SpawnEnemyProjectileY_ParameterA_RoomGraphics
    PLY
    RTS


;;; $95D3: Instruction list - enemy projectile $965E (vertical afterburn - center) ;;;
InstList_EnemyProjectile_VerticalAfterburn_Center:
    dw Instruction_EnemyProjectile_ClearPreInstruction
    dw $0005,EnemyProjSpritemaps_RidleysFireball_MBBombExplosion_0
    dw Instruction_Spawn_VerticalAfterburn_EnemyProjectiles
    dw $0005,EnemyProjSpritemaps_RidleysFireball_MBBombExplosion_1
    dw $0005,EnemyProjSpritemaps_RidleysFireball_MBBombExplosion_2
    dw $0005,EnemyProjSpritemaps_RidleysFireball_MBBombExplosion_3
    dw $0005,EnemyProjSpritemaps_RidleysFireball_MBBombExplosion_4
    dw Instruction_EnemyProjectile_Delete


;;; $95ED: Instruction - spawn vertical afterburn enemy projectiles ;;;
Instruction_Spawn_VerticalAfterburn_EnemyProjectiles:
;; Parameters:
;;     X: Enemy projectile index
    PHY
    STZ.W EnemyProjectile_InitParam1
    TXA
    LDY.W #EnemyProjectile_RidleyVerticalAfterburn_Up
    JSL SpawnEnemyProjectileY_ParameterA_RoomGraphics
    STZ.W EnemyProjectile_InitParam1
    TXA
    LDY.W #EnemyProjectile_RidleyVerticalAfterburn_Down
    JSL SpawnEnemyProjectileY_ParameterA_RoomGraphics
    PLY
    RTS


;;; $9606: Instruction list - enemy projectile $966C/$967A/$9688/$9696/$96A4/$96B2/$96C0/$96CE (afterburn - right/left/up/down) ;;;
InstList_EnemyProjectile_Afterburn:
    dw Instruction_EnemyProjectile_ClearPreInstruction
    dw $0005,EnemyProjSpritemaps_RidleysFireball_MBBombExplosion_0
    dw Instruction_SpawnNext_Afterburn_EnemyProjectile
    dw $0005,EnemyProjSpritemaps_RidleysFireball_MBBombExplosion_1
    dw $0005,EnemyProjSpritemaps_RidleysFireball_MBBombExplosion_2
    dw $0005,EnemyProjSpritemaps_RidleysFireball_MBBombExplosion_3
    dw $0005,EnemyProjSpritemaps_RidleysFireball_MBBombExplosion_4
    dw Instruction_EnemyProjectile_Delete


;;; $9620: Instruction - spawn next afterburn enemy projectile ;;;
Instruction_SpawnNext_Afterburn_EnemyProjectile:
;; Parameters:
;;     X: Enemy projectile index
    SEP #$20
    DEC.W EnemyProjectile_Var0,X
    REP #$20
    BMI .return
    PHY
    TXA
    LDY.W EnemyProjectile_Var1,X
    JSL SpawnEnemyProjectileY_ParameterA_RoomGraphics
    PLY

  .return:
    RTS


if !FEATURE_KEEP_UNREFERENCED
;;; $9634: Enemy projectiles - Ridley / afterburn ;;;
; Enemy projectile $9634 seems to be a version of the fireball that has no afterburn
; It's fired at one of 4 down-left angles, the angle and its spawn position depend on enemy 0
; It's possible that it was intended to use the unused instruction list $958C, which uses 8x8 sprites
; Hard to guess what this must have been for, but I would guess an abandoned version of Ceres Ridley's fireballs

; Enemy projectiles $96A4/B2/C0/CE are just the same as $966C/7A/88/96 except they instantly delete themselves on collision instead of playing the $9574 animation

; Note that Mother Brain's bombs also spawn the afterburn, not just Ridley's fireballs
UNUSED_EnemyProjectile_Ridley_869634:
    %EnemyProjectile(\
    %initAI(UNUSED_InitAI_EnemyProj_RidleysFireball_Afterburn_86934D),
    %preInst(UNUSED_PreInst_EnemyProj_RidleyFireball_Afterburn_869392),
    %instList(InstList_EnemyProjectile_RidleysFireball_0),
    %radius(6, 6),
    %properties($1003),
    %hitList(0),
    %shotList(InstList_EnemyProjectile_Delete))
endif ; !FEATURE_KEEP_UNREFERENCED

EnemyProjectile_RidleysFireball:
    %EnemyProjectile(\
    %initAI(InitAI_EnemyProjectile_RidleyFireball),
    %preInst(PreInstruction_EnemyProjectile_RidleyFireball),
    %instList(InstList_EnemyProjectile_RidleysFireball_0),
    %radius(6, 6),
    %properties($5003),
    %hitList(0),
    %shotList(InstList_EnemyProjectile_Delete))

EnemyProjectile_RidleyHorizontalAfterburn_Center:
    %EnemyProjectile(\
    %initAI(InitAI_EnemyProjectile_Afterburn_Center),
    %preInst(RTS_86950C),
    %instList(InstList_EnemyProjectile_HorizontalAfterburn_Center),
    %radius(6, 6),
    %properties($5003),
    %hitList(0),
    %shotList(InstList_EnemyProjectile_Delete))

EnemyProjectile_RidleyVerticalAfterburn_Center:
    %EnemyProjectile(\
    %initAI(InitAI_EnemyProjectile_Afterburn_Center),
    %preInst(RTS_86950C),
    %instList(InstList_EnemyProjectile_VerticalAfterburn_Center),
    %radius(6, 6),
    %properties($5003),
    %hitList(0),
    %shotList(InstList_EnemyProjectile_Delete))

EnemyProjectile_RidleyHorizontalAfterburn_Right:
    %EnemyProjectile(\
    %initAI(InitAI_EnemyProjectile_HorizontalAfterburn_Right),
    %preInst(PreInstruction_EnemyProjectile_HorizontalAfterburn),
    %instList(InstList_EnemyProjectile_Afterburn),
    %radius(6, 6),
    %properties($5003),
    %hitList(0),
    %shotList(InstList_EnemyProjectile_Delete))

EnemyProjectile_RidleyHorizontalAfterburn_Left:
    %EnemyProjectile(\
    %initAI(InitAI_EnemyProjectile_HorizontalAfterburn_Left),
    %preInst(PreInstruction_EnemyProjectile_HorizontalAfterburn),
    %instList(InstList_EnemyProjectile_Afterburn),
    %radius(6, 6),
    %properties($5003),
    %hitList(0),
    %shotList(InstList_EnemyProjectile_Delete))

EnemyProjectile_RidleyVerticalAfterburn_Up:
    %EnemyProjectile(\
    %initAI(InitAI_EnemyProjectile_VerticalAfterburn_Up),
    %preInst(PreInstruction_EnemyProjectile_VerticalAfterburn),
    %instList(InstList_EnemyProjectile_Afterburn),
    %radius(6, 6),
    %properties($5003),
    %hitList(0),
    %shotList(InstList_EnemyProjectile_Delete))

EnemyProjectile_RidleyVerticalAfterburn_Down:
    %EnemyProjectile(\
    %initAI(InitAI_EnemyProjectile_VerticalAfterburn_Down),
    %preInst(PreInstruction_EnemyProjectile_VerticalAfterburn),
    %instList(InstList_EnemyProjectile_Afterburn),
    %radius(6, 6),
    %properties($5003),
    %hitList(0),
    %shotList(InstList_EnemyProjectile_Delete))

if !FEATURE_KEEP_UNREFERENCED
UNUSED_EnemyProjectile_RidleyProtoHorizontalAfterburn_8696A4:
    %EnemyProjectile(\
    %initAI(InitAI_EnemyProjectile_HorizontalAfterburn_Right),
    %preInst(UNUSED_PreInstruction_ProtoHorizontalAfterburn_869537),
    %instList(InstList_EnemyProjectile_Afterburn),
    %radius(6, 6),
    %properties($5003),
    %hitList(0),
    %shotList(InstList_EnemyProjectile_Delete))

UNUSED_EnemyProjectile_RidleyProtoHorizontalAfterburn_8696B2:
    %EnemyProjectile(\
    %initAI(InitAI_EnemyProjectile_HorizontalAfterburn_Left),
    %preInst(UNUSED_PreInstruction_ProtoHorizontalAfterburn_869537),
    %instList(InstList_EnemyProjectile_Afterburn),
    %radius(6, 6),
    %properties($5003),
    %hitList(0),
    %shotList(InstList_EnemyProjectile_Delete))

UNUSED_EnemyProjectile_RidleyProtoVerticalAfterburn_8696C0:
    %EnemyProjectile(\
    %initAI(InitAI_EnemyProjectile_VerticalAfterburn_Up),
    %preInst(UNUSED_PreInstruction_ProtoVerticalAfterburn_Up_869540),
    %instList(InstList_EnemyProjectile_Afterburn),
    %radius(6, 6),
    %properties($5003),
    %hitList(0),
    %shotList(InstList_EnemyProjectile_Delete))

UNUSED_EnemyProjectile_RidleyProtoVerticalAfterburn_8696CE:
    %EnemyProjectile(\
    %initAI(InitAI_EnemyProjectile_VerticalAfterburn_Down),
    %preInst(UNUSED_PreInstruction_ProtoVerticalAfterburn_Down_869549),
    %instList(InstList_EnemyProjectile_Afterburn),
    %radius(6, 6),
    %properties($5003),
    %hitList(0),
    %shotList(InstList_EnemyProjectile_Delete))
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $96DC: Initialisation AI - enemy projectile $9734/$9742 (Ceres falling debris) ;;;
InitAI_EnemyProjectile_CeresFallingTile:
;; Parameters:
;;     Y: Enemy projectile index
;;     EnemyProjectile_InitParam0: X position
    LDA.W #$0000
    STA.W EnemyProjectile_Var0,Y : STA.W EnemyProjectile_Var1,Y : STA.W EnemyProjectile_XVelocity,Y
    LDA.W #$0E00 : STA.W EnemyProjectile_GraphicsIndices,Y
    LDA.W EnemyProjectile_InitParam0 : STA.W EnemyProjectile_XPositions,Y
    LDA.W #$002A : STA.W EnemyProjectile_YPositions,Y
    LDA.W #$0010 : STA.W EnemyProjectile_YVelocity,Y
    RTS


;;; $9701: Pre-instruction - enemy projectile $9734/$9742 (Ceres falling debris) ;;;
PreInstruction_EnemyProjectile_CeresFallingTile:
;; Parameters:
;;     X: Enemy projectile index
    LDA.W #$0010 : CLC : ADC.W EnemyProjectile_YVelocity,X : STA.W EnemyProjectile_YVelocity,X
    JSR Move_EnemyProjectile_Vertically
    BCS .collision
    RTS

  .collision:
    STZ.W EnemyProjectile_ID,X
    LDA.W EnemyProjectile_XPositions,X : STA.B DP_Temp12
    LDA.W EnemyProjectile_YPositions,X : CLC : ADC.W #$0000 : STA.B DP_Temp14
    LDA.W #$0009
    LDY.W #EnemyProjectile_MiscDust
    JSL SpawnEnemyProjectileY_ParameterA_RoomGraphics
    LDA.W #$006D
    JSL QueueSound_Lib2_Max6
    RTS


;;; $9734: Enemy projectiles - Ceres falling debris ;;;
EnemyProjectile_CeresFallingTile_Light:
    %EnemyProjectile(\
    %initAI(InitAI_EnemyProjectile_CeresFallingTile),
    %preInst(PreInstruction_EnemyProjectile_CeresFallingTile),
    %instList(InstList_EnemyProjectile_CeresFallingTile_Light),
    %radius(8, 8),
    %properties($4000),
    %hitList(0),
    %shotList(InstList_EnemyProjectile_Delete))

EnemyProjectile_CeresFallingTile_Dark:
    %EnemyProjectile(\
    %initAI(InitAI_EnemyProjectile_CeresFallingTile),
    %preInst(PreInstruction_EnemyProjectile_CeresFallingTile),
    %instList(InstList_EnemyProjectile_CeresFallingTile_Dark),
    %radius(8, 8),
    %properties($4000),
    %hitList(0),
    %shotList(InstList_EnemyProjectile_Delete))


;;; $9750: Instruction list - enemy projectile $9734 (Ceres falling debris - light coloured) ;;;
InstList_EnemyProjectile_CeresFallingTile_Light:
    dw $0001,EnemyProjSpritemaps_CeresFallingTile_Light
    dw Instruction_EnemyProjectile_Sleep


;;; $9756: Instruction list - enemy projectile $9742 (Ceres falling debris - dark coloured) ;;;
InstList_EnemyProjectile_CeresFallingTile_Dark:
    dw $0001,EnemyProjSpritemaps_CeresFallingTile_Dark
    dw Instruction_EnemyProjectile_Sleep


;;; $975C: Instruction list - Phantoon destroyable flame - idle ;;;
InstList_EnemyProjectile_PhantoonDestroyableFlame_Idle:
    dw $0005,EnemyProjSpritemaps_PhantoonFlames_0
    dw $0005,EnemyProjSpritemaps_PhantoonFlames_1
    dw $0005,EnemyProjSpritemaps_PhantoonFlames_2
    dw Instruction_EnemyProjectile_GotoY
    dw InstList_EnemyProjectile_PhantoonDestroyableFlame_Idle


;;; $976C: Instruction list - Phantoon destroyable flame - casual flame - hit ground ;;;
InstList_EnemyProj_PhantoonDestroyableFlame_Casual_HitGround:
    dw $0001,EnemyProjSpritemaps_PhantoonFlames_3
    dw Instruction_EnemyProjectile_Sleep


;;; $9772: Instruction list - Phantoon destroyable flame - casual flame - bouncing ;;;
InstList_EnemyProj_PhantoonDestroyableFlame_Casual_Bouncing:
    dw $0005,EnemyProjSpritemaps_PhantoonFlames_0
    dw $0005,EnemyProjSpritemaps_PhantoonFlames_1
    dw $0005,EnemyProjSpritemaps_PhantoonFlames_2
    dw Instruction_EnemyProjectile_GotoY
    dw InstList_EnemyProj_PhantoonDestroyableFlame_Casual_Bouncing


;;; $9782: Instruction list - Phantoon destroyable flame - casual flame - resting ;;;
InstList_EnemyProj_PhantoonDestroyableFlame_Casual_Resetting:
    dw $0005,EnemyProjSpritemaps_PhantoonStartingFlames_0
    dw $0005,EnemyProjSpritemaps_PhantoonStartingFlames_1
    dw $0005,EnemyProjSpritemaps_PhantoonStartingFlames_2
    dw $0005,EnemyProjSpritemaps_PhantoonStartingFlames_3
    dw $0005,EnemyProjSpritemaps_PhantoonStartingFlames_4
    dw $0005,EnemyProjSpritemaps_PhantoonStartingFlames_5


;;; $979A: Instruction list - Phantoon destroyable flame - dying ;;;
InstList_EnemyProj_PhantoonDestroyableFlame_Dying:
    dw $0005,EnemyProjSpritemaps_PhantoonFlames_4
    dw $0005,EnemyProjSpritemaps_PhantoonFlames_5
    dw $0005,EnemyProjSpritemaps_PhantoonFlames_6
    dw $0005,EnemyProjSpritemaps_PhantoonFlames_7
    dw Instruction_EnemyProjectile_Delete


;;; $97AC: Instruction list - Phantoon destroyable flame - flame rain - falling ;;;
InstList_EnemyProj_PhantoonDestroyableFlame_Rain_Falling:
    dw $0008,EnemyProjSpritemaps_PhantoonFlames_3
    dw Instruction_EnemyProjectile_GotoY
    dw InstList_EnemyProj_PhantoonDestroyableFlame_Dying


;;; $97B4: Instruction list - Phantoon destroyable flame - casual flame - falling ;;;
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


;;; $97E8: Instruction list - enemy projectile $9C37 (Phantoon starting flames) ;;;
InstList_EnemyProjectile_PhantoonStartingFlames:
    dw $0005,EnemyProjSpritemaps_PhantoonFlames_8
    dw $0005,EnemyProjSpritemaps_PhantoonFlames_9
    dw $0005,EnemyProjSpritemaps_PhantoonFlames_A
    dw Instruction_EnemyProjectile_GotoY
    dw InstList_EnemyProjectile_PhantoonStartingFlames


;;; $97F8: Instruction list - delete ;;;
InstList_EnemyProjectile_PhantoonDestroyableFlame_Delete:
    dw Instruction_EnemyProjectile_Delete


;;; $97FA: Shot instruction list - enemy projectile $9C29 (Phantoon destroyable flames) ;;;
InstList_EnemyProjectile_Shot_PhantoonDestroyableFlames:
    dw $0005,EnemyProjSpritemaps_PhantoonFlames_4
    dw $0005,EnemyProjSpritemaps_PhantoonFlames_5
    dw $0005,EnemyProjSpritemaps_PhantoonFlames_6
    dw $0005,EnemyProjSpritemaps_PhantoonFlames_7
    dw Instruction_SpawnPhantoonDrop
    dw Instruction_EnemyProjectile_Delete


;;; $980E: Instruction - spawn Phantoon drop ;;;
Instruction_SpawnPhantoonDrop:
;; Parameters:
;;     X: Enemy projectile index
    PHY : PHX
    LDA.W EnemyProjectile_XPositions,X : STA.B DP_Temp12
    LDA.W EnemyProjectile_YPositions,X : STA.B DP_Temp14
    LDA.W #EnemyHeaders_PhantoonEye
    JSL Spawn_Enemy_Drops
    PLX : PLY
    RTS


;;; $9824: Initialisation AI - enemy projectile $9C29 (Phantoon destroyable flames) ;;;
InitAI_EnemyProjectile_PhantoonDestroyableFlames:
;; Parameters:
;;     Y: Enemy projectile index
;;     EnemyProjectile_InitParam0:
;;         0000: Casual flame
;;         020i: Enraged flame
;;             i: Direction index. 0..7 are clockwise with initial angle 10h + i * 10h, 8..Fh are anti-clockwise with initial angle F0h - (i - 8) * 10h
;;         04dx: Flame rain
;;             x: X position index. X position = 30h + x * 14h
;;             d: Fall delay. Fall timer = d * 8
;;         060i: Flame spiral
;;             i: Direction index. Initial angle = i * 20h
    PHP
    REP #$30
    LDA.W EnemyProjectile_InitParam0 : AND.W #$FF00 : XBA : TAX
    JMP.W (.pointers,X)

  .pointers:
    dw PhantoonDestroyableFlameInit_Type0_Casual
    dw PhantoonDestroyableFlameInit_Type2_Enraged
    dw PhantoonDestroyableFlameInit_Type4_Rain
    dw PhantoonDestroyableFlameInit_Type6_Spiral


;;; $983A: Phantoon destroyable flame initialisation - type 0 (casual flame) ;;;
PhantoonDestroyableFlameInit_Type0_Casual:
;; Parameters:
;;     Y: Enemy projectile index
    LDA.W #$0000
    STA.W EnemyProjectile_XSubPositions,Y : STA.W EnemyProjectile_YSubPositions,Y
    STA.W EnemyProjectile_XVelocity,Y : STA.W EnemyProjectile_YVelocity,Y
    LDA.W Enemy.XPosition : STA.W EnemyProjectile_XPositions,Y
    LDA.W Enemy.YPosition : CLC : ADC.W #$0020 : STA.W EnemyProjectile_YPositions,Y
    LDA.W #InstList_EnemyProj_PhantoonDestroyableFlame_Casual_Falling_0 : STA.W EnemyProjectile_InstListPointers,Y
    LDA.W EnemyProjectile_Properties,Y : AND.W #$0FFF : ORA.W #$2000 : STA.W EnemyProjectile_Properties,Y
    PLP
    RTS


;;; $986D: Phantoon destroyable flame initialisation - type 2 (enraged flame) ;;;
PhantoonDestroyableFlameInit_Type2_Enraged:
;; Parameters:
;;     Y: Enemy projectile index
;;     EnemyProjectile_InitParam0 low: Direction index. 0..7 are clockwise with initial angle 10h + i * 10h, 8..Fh are anti-clockwise with initial angle F0h - (i - 8) * 10h
    LDA.W #$0000
    STA.W EnemyProjectile_XSubPositions,Y : STA.W EnemyProjectile_YSubPositions,Y : STA.W EnemyProjectile_YVelocity,Y
    LDA.W EnemyProjectile_InitParam0 : AND.W #$00FF : TAX
    CPX.W #$0008 : BPL .greaterThan7
    LDA.W #$0002 : STA.W EnemyProjectile_XVelocity,Y
    BRA +

  .greaterThan7:
    LDA.W #$FFFE : STA.W EnemyProjectile_XVelocity,Y

+   LDA.W .angles,X : AND.W #$00FF : STA.W EnemyProjectile_Var0,Y
    LDA.W Enemy.XPosition : STA.W EnemyProjectile_XPositions,Y
    LDA.W Enemy.YPosition : CLC : ADC.W #$0020 : STA.W EnemyProjectile_YPositions,Y
    LDA.W #PreInst_EnemyProj_PhantoonDestroyableFlame_Enraged : STA.W EnemyProjectile_PreInstructions,Y
    PLP
    RTS

  .angles:
    db $10,$20,$30,$40,$50,$60,$70,$80
    db $F0,$E0,$D0,$C0,$B0,$A0,$90,$80


;;; $98C4: Phantoon destroyable flame initialisation - type 4 (flame rain) ;;;
PhantoonDestroyableFlameInit_Type4_Rain:
;; Parameters:
;;     Y: Enemy projectile index
;;     EnemyProjectile_InitParam0 low:
;;         dx: Flame rain
;;             x: X position index. X position = 30h + x * 14h
;;             d: Fall delay. Fall timer = d * 8
    LDA.W #$0000
    STA.W EnemyProjectile_XSubPositions,Y : STA.W EnemyProjectile_YSubPositions,Y : STA.W EnemyProjectile_YVelocity,Y
    LDA.W EnemyProjectile_InitParam0 : PHA
    AND.W #$000F : TAX
    PLA : AND.W #$00F0 : LSR : STA.W EnemyProjectile_XVelocity,Y
    LDA.W .XPositions,X : AND.W #$00FF : STA.W EnemyProjectile_XPositions,Y
    LDA.W #$0028 : STA.W EnemyProjectile_YPositions,Y
    LDA.W #PreInst_EnemyProj_PhantoonDestroyableFlame_Rain : STA.W EnemyProjectile_PreInstructions,Y
    PLP
    RTS

  .XPositions:
    db $30,$44,$58,$6C,$80,$94,$A8,$BC,$D0


;;; $9900: Phantoon destroyable flame initialisation - type 6 (flame spiral) ;;;
PhantoonDestroyableFlameInit_Type6_Spiral:
;; Parameters:
;;     Y: Enemy projectile index
;;     EnemyProjectile_InitParam0 low: Direction index. Initial angle = i * 20h
    LDA.W #$0000
    STA.W EnemyProjectile_XSubPositions,Y : STA.W EnemyProjectile_YSubPositions,Y : STA.W EnemyProjectile_YVelocity,Y
    LDA.W #$0080 : STA.W EnemyProjectile_XVelocity,Y
    LDA.W EnemyProjectile_InitParam0 : AND.W #$00FF : TAX
    LDA.W PhantoonFlameAngles,X : AND.W #$00FF : STA.W EnemyProjectile_Var0,Y
    LDA.W Enemy.XPosition : STA.W EnemyProjectile_XPositions,Y
    LDA.W Enemy.YPosition : CLC : ADC.W #$0010 : STA.W EnemyProjectile_YPositions,Y
    LDA.W #PreInst_EnemyProj_PhantoonDestroyableFlame_Spiral : STA.W EnemyProjectile_PreInstructions,Y
    PLP
    RTS


;;; $993A: Initialisation AI - enemy projectile $9C37 (Phantoon starting flames) ;;;
InitAI_EnemyProjectile_PhantoonStartingFlames:
;; Parameters:
;;     Y: Enemy projectile index
;;     EnemyProjectile_InitParam0: Direction index. Initial angle = i * 20h
    PHP
    REP #$30
    LDA.W #$0000
    STA.W EnemyProjectile_XSubPositions,Y : STA.W EnemyProjectile_YSubPositions,Y
    STA.W EnemyProjectile_XVelocity,Y : STA.W EnemyProjectile_YVelocity,Y
    PHY
    LDX.W EnemyProjectile_InitParam0
    LDA.W PhantoonFlameAngles,X : AND.W #$00FF : STA.W EnemyProjectile_Var0,Y
    TAY
    LDA.W #$0030
    JSR Calculate_XY_ComponentsOf_RadiusA_AngleY
    PLY
    LDA.W Enemy.XPosition : CLC : ADC.B DP_Temp14 : STA.W EnemyProjectile_XPositions,Y
    LDA.W Enemy.YPosition : CLC : ADC.W #$0010 : CLC : ADC.B DP_Temp16 : STA.W EnemyProjectile_YPositions,Y
    PLP
    RTS


;;; $9979: Phantoon flame angles ;;;
PhantoonFlameAngles:
    db $00,$20,$40,$60,$80,$A0,$C0,$E0


;;; $9981: Pre-instruction - Phantoon destroyable flame - casual flame - falling ;;;
PreInst_EnemyProj_PhantoonDestroyableFlame_Casual_Falling:
;; Parameters:
;;     X: Enemy projectile index
    LDA.W EnemyProjectile_YVelocity,X : CLC : ADC.W #$0010 : STA.W EnemyProjectile_YVelocity,X
    JSR Move_EnemyProjectile_Vertically
    BCC .return
    LDA.W EnemyProjectile_Properties,X : AND.W #$0FFF : ORA.W #$8000 : STA.W EnemyProjectile_Properties,X
    LDA.W #PreInst_EnemyProj_PhantoonDestroyableFlame_Casual_HitGround : STA.W EnemyProjectile_PreInstructions,X
    LDA.W #InstList_EnemyProj_PhantoonDestroyableFlame_Casual_HitGround : STA.W EnemyProjectile_InstListPointers,X
    LDA.W #$0001 : STA.W EnemyProjectile_InstructionTimers,X
    LDA.W #$0008 : STA.W EnemyProjectile_Var0,X
    LDA.W EnemyProjectile_YPositions,X : CLC : ADC.W #$0008 : STA.W EnemyProjectile_YPositions,X

  .return:
    RTS


;;; $99BF: Pre-instruction - Phantoon destroyable flame - casual flame - hit ground ;;;
PreInst_EnemyProj_PhantoonDestroyableFlame_Casual_HitGround:
;; Parameters:
;;     X: Enemy projectile index
    DEC.W EnemyProjectile_Var0,X : BEQ .timerExpired
    BPL .return

  .timerExpired:
    LDA.W #PreInst_EnemyProj_PhantoonDestroyableFlame_Casual_Bouncing : STA.W EnemyProjectile_PreInstructions,X
    LDA.W #InstList_EnemyProj_PhantoonDestroyableFlame_Casual_Bouncing : STA.W EnemyProjectile_InstListPointers,X
    LDA.W #$0001 : STA.W EnemyProjectile_InstructionTimers,X
    LDA.W EnemyProjectile_YPositions,X : SEC : SBC.W #$0008 : STA.W EnemyProjectile_YPositions,X
    LDA.W #$FD00 : STA.W EnemyProjectile_YVelocity,X
    STZ.W EnemyProjectile_Var0,X
    LDA.W NMI_FrameCounter : BIT.W #$0001 : BNE .negative
    LDA.W #$0080 : STA.W EnemyProjectile_XVelocity,X
    RTS

  .negative:
    LDA.W #$FF80 : STA.W EnemyProjectile_XVelocity,X

  .return:
    RTS


;;; $9A01: Pre-instruction - Phantoon destroyable flame - casual flame - bouncing ;;;
PreInst_EnemyProj_PhantoonDestroyableFlame_Casual_Bouncing:
;; Parameters:
;;     X: Enemy projectile index
    LDA.W EnemyProjectile_YVelocity,X : CLC : ADC.W #$0010 : STA.W EnemyProjectile_YVelocity,X
    JSR Move_EnemyProjectile_Vertically
    BCC .noCollision
    LDA.W EnemyProjectile_Var0,X : INC : STA.W EnemyProjectile_Var0,X
    CMP.W #$0003 : BPL .rest
    ASL : TAY
    LDA.W .Yvelocity,Y : STA.W EnemyProjectile_YVelocity,X
    RTS

  .noCollision:
    JSR Move_EnemyProjectile_Horizontally
    BCS .rest
    RTS

  .rest:
    LDA.W #InstList_EnemyProj_PhantoonDestroyableFlame_Casual_Resetting : STA.W EnemyProjectile_InstListPointers,X
    LDA.W #$0001 : STA.W EnemyProjectile_InstructionTimers,X
    LDA.W #RTS_869A44 : STA.W EnemyProjectile_PreInstructions,X
    RTS

  .Yvelocity:
; Y velocity, indexed by bounce counter. First entry is unused
    dw $FD00,$FE00,$FF00


;;; $9A44: RTS ;;;
RTS_869A44:
    RTS


;;; $9A45: Pre-instruction - Phantoon destroyable flame - enraged flame ;;;
PreInst_EnemyProj_PhantoonDestroyableFlame_Enraged:
;; Parameters:
;;     X: Enemy projectile index
    LDA.W EnemyProjectile_YVelocity,X : CLC : ADC.W #$0004 : STA.W EnemyProjectile_YVelocity,X
    LDA.W EnemyProjectile_Var0,X : CLC : ADC.W EnemyProjectile_XVelocity,X : AND.W #$00FF : STA.W EnemyProjectile_Var0,X
    TAY
    LDA.W EnemyProjectile_YVelocity,X
    JSR Calculate_XY_ComponentsOf_RadiusA_AngleY
    LDA.W Enemy.XPosition : CLC : ADC.B DP_Temp14 : STA.W EnemyProjectile_XPositions,X : BMI +
    CMP.W #$0100 : BPL +
    LDA.W Enemy.YPosition : CLC : ADC.W #$0010
    CLC : ADC.B DP_Temp16 : STA.W EnemyProjectile_YPositions,X : BMI +
    CMP.W #$0100 : BMI .return

+   LDA.W #InstList_EnemyProjectile_PhantoonDestroyableFlame_Delete : STA.W EnemyProjectile_InstListPointers,X
    LDA.W #$0001 : STA.W EnemyProjectile_InstructionTimers,X

  .return:
    RTS


;;; $9A94: Pre-instruction - Phantoon destroyable flame - flame rain ;;;
PreInst_EnemyProj_PhantoonDestroyableFlame_Rain:
;; Parameters:
;;     X: Enemy projectile index
    LDA.W EnemyProjectile_XVelocity,X : BEQ .falling
    DEC.W EnemyProjectile_XVelocity,X : BEQ .playSFX
    BPL .return

  .playSFX:
    LDA.W #$001D
    JSL QueueSound_Lib3_Max6

  .falling:
    LDA.W EnemyProjectile_YVelocity,X : CLC : ADC.W #$0010 : STA.W EnemyProjectile_YVelocity,X
    JSR Move_EnemyProjectile_Vertically
    BCC .return
    LDA.W #InstList_EnemyProj_PhantoonDestroyableFlame_Rain_Falling : STA.W EnemyProjectile_InstListPointers,X
    LDA.W #$0001 : STA.W EnemyProjectile_InstructionTimers,X
    LDA.W EnemyProjectile_YPositions,X : CLC : ADC.W #$0008 : STA.W EnemyProjectile_YPositions,X
    LDA.W #RTS_869A44 : STA.W EnemyProjectile_PreInstructions,X
    LDA.W #$001D
    JSL QueueSound_Lib3_Max6

  .return:
    RTS


;;; $9ADA: Pre-instruction - Phantoon destroyable flame - flame spiral ;;;
PreInst_EnemyProj_PhantoonDestroyableFlame_Spiral:
;; Parameters:
;;     X: Enemy projectile index
    LDA.W EnemyProjectile_YVelocity,X : CLC : ADC.W #$0002 : STA.W EnemyProjectile_YVelocity,X
    LDA.W EnemyProjectile_Var0,X : CLC : ADC.W #$0002 : AND.W #$00FF : STA.W EnemyProjectile_Var0,X
    TAY
    LDA.W EnemyProjectile_YVelocity,X
    JSR Calculate_XY_ComponentsOf_RadiusA_AngleY
    LDA.W Enemy.XPosition : CLC : ADC.B DP_Temp14 : STA.W EnemyProjectile_XPositions,X : BMI +
    CMP.W #$0100 : BPL +
    LDA.W Enemy.YPosition : CLC : ADC.W #$0010
    CLC : ADC.B DP_Temp16 : STA.W EnemyProjectile_YPositions,X : BMI +
    CMP.W #$0100 : BMI .return

+   LDA.W #InstList_EnemyProjectile_PhantoonDestroyableFlame_Delete : STA.W EnemyProjectile_InstListPointers,X
    LDA.W #$0001 : STA.W EnemyProjectile_InstructionTimers,X

  .return:
    RTS


;;; $9B29: Pre-instruction - enemy projectile $9C37 (Phantoon starting flames) ;;;
PreInstruction_EnemyProjectile_PhantoonStartingFlames:
;; Parameters:
;;     X: Enemy projectile index
    LDA.W Enemy.var1 : BEQ .return
    LDA.W #PreInst_EnemyProjectile_PhantoonStartingFlames_Activated : STA.W EnemyProjectile_PreInstructions,X
    LDA.W #$00B4 : STA.W EnemyProjectile_XVelocity,X
    LDA.W #$0030 : STA.W EnemyProjectile_YVelocity,X

  .return:
    RTS


;;; $9B41: Pre-instruction - Phantoon starting flames - activated ;;;
PreInst_EnemyProjectile_PhantoonStartingFlames_Activated:
;; Parameters:
;;     X: Enemy projectile index
    LDA.W EnemyProjectile_XVelocity,X : BEQ .timerExpired
    DEC : STA.W EnemyProjectile_XVelocity,X
    BRA +

  .timerExpired:
    LDA.W NMI_FrameCounter : BIT.W #$0001 : BEQ +
    LDA.W EnemyProjectile_YVelocity,X : DEC : STA.W EnemyProjectile_YVelocity,X : BEQ .delete

+   LDA.W EnemyProjectile_Var0,X : INC : AND.W #$00FF : STA.W EnemyProjectile_Var0,X
    TAY
    LDA.W EnemyProjectile_YVelocity,X
    JSR Calculate_XY_ComponentsOf_RadiusA_AngleY
    LDA.W Enemy.XPosition : CLC : ADC.B DP_Temp14 : STA.W EnemyProjectile_XPositions,X
    LDA.W Enemy.YPosition : CLC : ADC.W #$0010
    CLC : ADC.B DP_Temp16 : STA.W EnemyProjectile_YPositions,X
    RTS

  .delete:
    LDA.W Enemy.XPosition : STA.W EnemyProjectile_XPositions,X
    LDA.W Enemy.YPosition : CLC : ADC.W #$0010 : STA.W EnemyProjectile_YPositions,X
    LDA.W #$0001 : STA.W EnemyProjectile_InstructionTimers,X
    LDA.W #InstList_EnemyProjectile_PhantoonDestroyableFlame_Delete : STA.W EnemyProjectile_InstListPointers,X
    RTS


;;; $9BA2: Calculate X/Y components of radius [A], angle [Y] ;;;
Calculate_XY_ComponentsOf_RadiusA_AngleY:
;; Parameters:
;;     A: Radius
;;     Y: Angle. Origin = up, positive direction = clockwise
;; Returns:
;;     $14: X component of radius
;;     $16: Y component of radius
    PHP
    REP #$30
    PHX
    STA.B DP_Temp18
    TYA : STA.B DP_Temp1A
    CMP.W #$0080 : BPL .greaterThan80
    ASL : TAX
    JSR DoSomeMathWithSineAndPi_869BF3
    BRA +

  .greaterThan80:
    SEC : SBC.W #$0080 : AND.W #$00FF : ASL : TAX
    JSR DoSomeMathWithSineAndPi_869BF3
    EOR.W #$FFFF : INC

+   STA.B DP_Temp14
    LDA.B DP_Temp1A : SEC : SBC.W #$0040
    AND.W #$00FF : CMP.W #$0080 : BPL .stillGreaterThan80
    ASL : TAX
    JSR DoSomeMathWithSineAndPi_869BF3
    BRA +

  .stillGreaterThan80:
    SEC : SBC.W #$0080
    AND.W #$00FF : ASL : TAX
    JSR DoSomeMathWithSineAndPi_869BF3
    EOR.W #$FFFF : INC

+   STA.B DP_Temp16
    PLX : PLP
    RTS


;;; $9BF3: A = [$18] * sin([X] / 2 * pi / 80h) ;;;
DoSomeMathWithSineAndPi_869BF3:
;; Parameters:
;;     X: Angle * 2
;;     $18: Radius
;; Returns:
;;     A: Sine component

; Angle [X] / 2 must be less than 80h, as this routine does unsigned multiplication
    SEP #$20
    LDA.L SineCosineTables_8bitSine_SignExtended,X : STA.W $4202
    LDA.B DP_Temp18 : STA.W $4203
    NOP #3
    REP #$20
    LDA.W $4216 : XBA : AND.W #$00FF : STA.B DP_Temp12
    SEP #$20
    LDA.L SineCosineTables_8bitSine_SignExtended+1,X : STA.W $4202
    LDA.B DP_Temp18 : STA.W $4203
    NOP #3
    REP #$20
    LDA.W $4216 : CLC : ADC.B DP_Temp12
    RTS


;;; $9C29: Phantoon flame enemy projectiles ;;;
EnemyProjectile_PhantoonDestroyableFlames:
    %EnemyProjectile(\
    %initAI(InitAI_EnemyProjectile_PhantoonDestroyableFlames),
    %preInst(PreInst_EnemyProj_PhantoonDestroyableFlame_Casual_Falling),
    %instList(InstList_EnemyProjectile_PhantoonDestroyableFlame_Idle),
    %radius(8, $10),
    %properties($8028),
    %hitList(0),
    %shotList(InstList_EnemyProjectile_Shot_PhantoonDestroyableFlames))

EnemyProjectile_PhantoonStartingFlames:
    %EnemyProjectile(\
    %initAI(InitAI_EnemyProjectile_PhantoonStartingFlames),
    %preInst(PreInstruction_EnemyProjectile_PhantoonStartingFlames),
    %instList(InstList_EnemyProjectile_PhantoonStartingFlames),
    %radius(8, $10),
    %properties($4028),
    %hitList(0),
    %shotList(InstList_EnemyProjectile_PhantoonDestroyableFlame_Idle))


;;; $9C45: Kraid rock enemy projectiles ;;;
EnemyProjectile_KraidRockSpit:
    %EnemyProjectile(\
    %initAI(InitAI_EnemyProjectile_KraidRockSpit),
    %preInst(PreInstruction_EnemyProjectile_KraidRocks),
    %instList(InstList_EnemyProjectile_KraidRocks_KagoBug),
    %radius(4, 4),
    %properties($8002),
    %hitList(0),
    %shotList(InstList_EnemyProjectile_Shot_KraidRockSpit))

EnemyProjectile_KraidCeilingRocks:
    %EnemyProjectile(\
    %initAI(Instruction_EnemyProjectile_KraidCeilingRocks),
    %preInst(PreInstruction_EnemyProjectile_KraidCeilingRocks),
    %instList(InstList_EnemyProjectile_KraidRocks_KagoBug),
    %radius(4, 4),
    %properties($A000),
    %hitList(0),
    %shotList(InstList_EnemyProjectile_Delete))

EnemyProjectile_KraidFloorRocks_Left:
    %EnemyProjectile(\
    %initAI(Instruction_EnemyProjectile_KraidRisingRocks),
    %preInst(PreInstruction_EnemyProjectile_KraidRocks),
    %instList(InstList_EnemyProjectile_KraidRocks_KagoBug),
    %radius(4, 4),
    %properties($A000),
    %hitList(0),
    %shotList(InstList_EnemyProjectile_Delete))

EnemyProjectile_KraidFloorRocks_Right:
    %EnemyProjectile(\
    %initAI(Instruction_EnemyProjectile_KraidRisingRocks),
    %preInst(PreInstruction_EnemyProjectile_KraidRocks),
    %instList(InstList_EnemyProjectile_KraidFloorRocks_Right),
    %radius(4, 4),
    %properties($A000),
    %hitList(0),
    %shotList(InstList_EnemyProjectile_Delete))


;;; $9C7D: Instruction list - enemy projectile $9C45/$9C53/$9C61/$D02E (Kraid rocks / kago bug) ;;;
InstList_EnemyProjectile_KraidRocks_KagoBug:
    dw $7FFF,EnemyProjSpritemaps_KraidRocks_KagoBugs
    dw Instruction_EnemyProjectile_Sleep


;;; $9C83: Instruction list - enemy projectile $9C6F (rocks when Kraid rises - right) ;;;
InstList_EnemyProjectile_KraidFloorRocks_Right:
    dw $7FFF,EnemyProjSpritemaps_KraidRisingRocks_Right
    dw Instruction_EnemyProjectile_Sleep


;;; $9C89: Shot instruction list - enemy projectile $9C45 (rocks Kraid spits at you) ;;;
InstList_EnemyProjectile_Shot_KraidRockSpit:
    dw Instruction_EnemyProjectile_PreInstructionInY
    dw PreInstruction_EnemyProjectile_KraidRockSpit_UsePalette0
    dw $0004,EnemyProjSpritemaps_Common_0
    dw $0004,EnemyProjSpritemaps_Common_1
    dw $0004,EnemyProjSpritemaps_Common_2
    dw $0004,EnemyProjSpritemaps_Common_3
    dw $0004,EnemyProjSpritemaps_Common_4
    dw Instruction_EnemyProjectile_Delete


;;; $9CA3: Initialisation AI - enemy projectile $9C45 (rocks Kraid spits at you) ;;;
InitAI_EnemyProjectile_KraidRockSpit:
;; Parameters:
;;     Y: Enemy projectile index
;;     EnemyProjectile_InitParam0: X velocity
    PHX
    LDX.W EnemyIndex
    LDA.W Enemy.XPosition,X : CLC : ADC.W #$0010 : STA.W EnemyProjectile_XPositions,Y
    LDA.W Enemy.YPosition,X : SEC : SBC.W #$0060 : STA.W EnemyProjectile_YPositions,Y
    LDA.W #$0000 : STA.W EnemyProjectile_YSubPositions,Y : STA.W EnemyProjectile_XSubPositions,Y
    LDA.W EnemyProjectile_InitParam0 : STA.W EnemyProjectile_XVelocity,Y
    LDA.W #$FC00 : STA.W EnemyProjectile_YVelocity,Y
    LDA.W #$0600 : STA.W EnemyProjectile_GraphicsIndices,Y
    PLX
    RTS


;;; $9CD8: Initialisation AI - enemy projectile $9C53 (rocks that fall when Kraid's ceiling crumbles) ;;;
Instruction_EnemyProjectile_KraidCeilingRocks:
;; Parameters:
;;     Y: Enemy projectile index
;;     EnemyProjectile_InitParam0: X position
    PHX
    LDX.W EnemyIndex
    LDA.W EnemyProjectile_InitParam0 : STA.W EnemyProjectile_XPositions,Y
    LDA.W #$0138 : STA.W EnemyProjectile_YPositions,Y
    LDA.W #$0000 : STA.W EnemyProjectile_YSubPositions,Y : STA.W EnemyProjectile_XSubPositions,Y
    LDA.W #$0000 : STA.W EnemyProjectile_XVelocity,Y
    LDA.W RandomNumberSeed : AND.W #$003F : CLC : ADC.W #$0040 : STA.W EnemyProjectile_YVelocity,Y
    LDA.W #$0600 : STA.W EnemyProjectile_GraphicsIndices,Y
    PLX
    RTS


;;; $9D0C: Initialisation AI - enemy projectile $9C61/$9C6F (rocks when Kraid rises) ;;;
Instruction_EnemyProjectile_KraidRisingRocks:
;; Parameters:
;;     Y: Enemy projectile index
;;     EnemyProjectile_InitParam0: X velocity
    PHX
    LDA.W RandomNumberSeed : AND.W #$003F : TAX
    LDA.W RandomNumberSeed : BIT.W #$0001 : BNE +
    TXA : EOR.W #$FFFF : TAX

+   TXA
    LDX.W EnemyIndex
    CLC : ADC.W Enemy.XPosition,X : STA.W EnemyProjectile_XPositions,Y
    LDA.W #$01B0 : STA.W EnemyProjectile_YPositions,Y
    LDA.W #$0000 : STA.W EnemyProjectile_YSubPositions,Y : STA.W EnemyProjectile_XSubPositions,Y
    LDA.W EnemyProjectile_InitParam0 : STA.W EnemyProjectile_XVelocity,Y
    LDA.W #$FB00 : STA.W EnemyProjectile_YVelocity,Y
    LDA.W #$0600 : STA.W EnemyProjectile_GraphicsIndices,Y
    LDA.W #$001E
    JSL QueueSound_Lib3_Max6
    PLX
    RTS


;;; $9D56: Pre-instruction - enemy projectile $9C45/$9C61/$9C6F (Kraid rocks) ;;;
PreInstruction_EnemyProjectile_KraidRocks:
;; Parameters:
;;     X: Enemy projectile index
    PHP
    REP #$20
    JSR Move_EnemyProjectile_Horizontally
    BCS .delete
    JSR Move_EnemyProjectile_Vertically
    BCS .delete
    LDA.W EnemyProjectile_XVelocity,X : CLC : ADC.W #$0008 : STA.W EnemyProjectile_XVelocity,X
    CMP.W #$0100 : BMI +
    LDA.W #$FF00

+   STA.W EnemyProjectile_XVelocity,X
    LDA.W EnemyProjectile_YVelocity,X : CLC : ADC.W #$0040 : STA.W EnemyProjectile_YVelocity,X
    PLP
    RTS

  .delete:
    STZ.W EnemyProjectile_ID,X
    PLP
    RTS


;;; $9D89: Pre-instruction - enemy projectile $9C53 (rocks that fall when Kraid's ceiling crumbles) ;;;
PreInstruction_EnemyProjectile_KraidCeilingRocks:
;; Parameters:
;;     X: Enemy projectile index
    PHP
    REP #$20
    JSR Move_EnemyProjectile_Vertically
    BCS .collision
    LDA.W EnemyProjectile_YVelocity,X : CLC : ADC.W #$0018 : AND.W #$3FFF : STA.W EnemyProjectile_YVelocity,X
    PLP
    RTS

  .collision:
    STZ.W EnemyProjectile_ID,X
    PLP
    RTS


;;; $9DA5: Pre-instruction - rocks Kraid spits at you - use palette 0 ;;;
PreInstruction_EnemyProjectile_KraidRockSpit_UsePalette0:
;; Parameters:
;;     X: Enemy projectile index
    PHP
    REP #$30
    LDA.W #$0000 : STA.W EnemyProjectile_GraphicsIndices,X
    PLP
    RTS


;;; $9DB0: Enemy projectiles - fake Kraid ;;;
EnemyProjectile_MiniKraidSpit:
    %EnemyProjectile(\
    %initAI(InitAI_EnemyProjectile_MiniKraidSpit),
    %preInst(PreInstruction_EnemyProjectile_MiniKraidSpit),
    %instList(InstList_EnemyProjectile_MiniKraidSpit),
    %radius(4, 4),
    %properties($0014),
    %hitList(0),
    %shotList(InstList_EnemyProjectile_Delete))

EnemyProjectile_MiniKraidSpikes_Left:
    %EnemyProjectile(\
    %initAI(InitAI_EnemyProjectile_MiniKraidSpikes_Left),
    %preInst(PreInstruction_EnemyProjectile_MiniKraidSpikes),
    %instList(InstList_EnemyProjectile_MiniKraidSpikes_Left),
    %radius(4, 2),
    %properties($0006),
    %hitList(0),
    %shotList(InstList_EnemyProjectile_Delete))

EnemyProjectile_MiniKraidSpikes_Right:
    %EnemyProjectile(\
    %initAI(InitAI_EnemyProjectile_MiniKraidSpikes_Right),
    %preInst(PreInstruction_EnemyProjectile_MiniKraidSpikes),
    %instList(InstList_EnemyProjectile_MiniKraidSpikes_Right),
    %radius(4, 2),
    %properties($0006),
    %hitList(0),
    %shotList(InstList_EnemyProjectile_Delete))


;;; $9DDA: Instruction list - enemy projectile $9DB0 (fake Kraid spit) ;;;
InstList_EnemyProjectile_MiniKraidSpit:
    dw $7FFF,EnemyProjSpritemaps_MiniKraidSpit
    dw Instruction_EnemyProjectile_Sleep


;;; $9DE0: Instruction list - enemy projectile $9DBE (fake Kraid spikes - left) ;;;
InstList_EnemyProjectile_MiniKraidSpikes_Left:
    dw $7FFF,EnemyProjSpritemaps_MiniKraidSpikes_Left
    dw Instruction_EnemyProjectile_Sleep


;;; $9DE6: Instruction list - enemy projectile $9DCC (fake Kraid spikes - right) ;;;
InstList_EnemyProjectile_MiniKraidSpikes_Right:
    dw $7FFF,EnemyProjSpritemaps_MiniKraidSpikes_Right
    dw Instruction_EnemyProjectile_Sleep


;;; $9DEC: Initialisation AI - enemy projectile $9DB0 (fake Kraid spit) ;;;
InitAI_EnemyProjectile_MiniKraidSpit:
;; Parameters:
;;     Y: Enemy projectile index
    PHX
    LDX.W EnemyIndex
    LDA.W Enemy.XPosition,X : CLC : ADC.L MiniKraid.spitXOffset,X : STA.W EnemyProjectile_XPositions,Y
    LDA.W Enemy.YPosition,X : SEC : SBC.W #$0010 : STA.W EnemyProjectile_YPositions,Y
    LDA.W #$0000 : STA.W EnemyProjectile_YSubPositions,Y : STA.W EnemyProjectile_XSubPositions,Y
    LDA.L MiniKraid.spitXVelocity,X : STA.W EnemyProjectile_XVelocity,Y
    LDA.L MiniKraid.spitYVelocity,X : STA.W EnemyProjectile_YVelocity,Y
    PLX
    RTS


;;; $9E1E: Pre-instruction - enemy projectile $9DB0 (fake Kraid spit) ;;;
PreInstruction_EnemyProjectile_MiniKraidSpit:
;; Parameters:
;;     X: Enemy projectile index
    PHP
    REP #$20
    JSR Move_EnemyProjectile_Horizontally
    BCS .delete
    JSR Move_EnemyProjectile_Vertically
    BCS .delete
    LDA.W EnemyProjectile_YVelocity,X : CLC : ADC.W #$0040 : BMI .setYvelocity
    CMP.W #$0400 : BMI .setYvelocity
    LDA.W #$0400

  .setYvelocity:
    STA.W EnemyProjectile_YVelocity,X
    PLP
    RTS

  .delete:
    STZ.W EnemyProjectile_ID,X
    PLP
    RTS


;;; $9E46: Initialisation AI - enemy projectile $9DBE (fake Kraid spikes - left) ;;;
InitAI_EnemyProjectile_MiniKraidSpikes_Left:
;; Parameters:
;;     Y: Enemy projectile index
    LDA.W #$FE00
    BRA InitAI_EnemyProjectile_MiniKraidSpikes_Common


;;; $9E4B: Initialisation AI - enemy projectile $9DCC (fake Kraid spikes - right) ;;;
InitAI_EnemyProjectile_MiniKraidSpikes_Right:
;; Parameters:
;;     Y: Enemy projectile index
    LDA.W #$0200
; fallthrough to InitAI_EnemyProjectile_MiniKraidSpikes_Common


;;; $9E4E: Fake Kraid spikes common initialisation ;;;
InitAI_EnemyProjectile_MiniKraidSpikes_Common:
;; Parameters:
;;     Y: Enemy projectile index
    STA.W EnemyProjectile_XVelocity,Y
    LDX.W EnemyIndex
    LDA.L MiniKraid.spikeIndex,X : TAX
    LDA.W .data,X : STA.B DP_Temp12
    LDX.W EnemyIndex
    LDA.W Enemy.XPosition,X : STA.W EnemyProjectile_XPositions,Y
    LDA.W Enemy.YPosition,X : CLC : ADC.B DP_Temp12 : STA.W EnemyProjectile_YPositions,Y
    LDA.W #$0000 : STA.W EnemyProjectile_YSubPositions,Y
    STA.W EnemyProjectile_XSubPositions,Y : STA.W EnemyProjectile_YVelocity,Y
    RTS

  .data:
    dw $FFFE,$000C,$0018


;;; $9E83: Pre-instruction - enemy projectile $9DBE/$9DCC (fake Kraid spikes) ;;;
PreInstruction_EnemyProjectile_MiniKraidSpikes:
;; Parameters:
;;     X: Enemy projectile index
    PHP
    REP #$20
    JSR Move_EnemyProjectile_Horizontally
    BCC .return
    STZ.W EnemyProjectile_ID,X

  .return:
    PLP
    RTS


;;; $9E90: Enemy projectile - alcoon fireball ;;;
EnemyProjectile_AlcoonFireball:
    %EnemyProjectile(\
    %initAI(InitAI_EnemyProjectile_AlcoonFireball),
    %preInst(PreInstruction_EnemyProjectile_AlcoonFireball),
    %instList(InstList_EnemyProjectile_AlcoonFireball),
    %radius(4, 4),
    %properties($0014),
    %hitList(0),
    %shotList(InstList_EnemyProjectile_Delete))


;;; $9E9E: Instruction list - enemy projectile $9E90 (alcoon fireball) ;;;
InstList_EnemyProjectile_AlcoonFireball:
    dw $0003,EnemyProjSpritemaps_AlcoonFireball_0
    dw $0003,EnemyProjSpritemaps_AlcoonFireball_1
    dw $0003,EnemyProjSpritemaps_AlcoonFireball_2
    dw $0003,EnemyProjSpritemaps_AlcoonFireball_3
    dw Instruction_EnemyProjectile_GotoY
    dw InstList_EnemyProjectile_AlcoonFireball


;;; $9EB2: Initialisation AI - enemy projectile $9E90 (alcoon fireball) ;;;
InitAI_EnemyProjectile_AlcoonFireball:
;; Parameters:
;;     Y: Enemy projectile index
;;     EnemyProjectile_InitParam0: Y velocity index
    PHX
    LDX.W EnemyIndex
    LDA.W Enemy.YPosition,X : SEC : SBC.W #$000C : STA.W EnemyProjectile_YPositions,Y
    LDA.W #$FC00 : STA.W EnemyProjectile_XVelocity,Y
    LDA.W Enemy.XPosition,X : SEC : SBC.W #$0010 : STA.W EnemyProjectile_XPositions,Y
    LDA.W Enemy.var3,X : BMI +
    LDA.W #$0400 : STA.W EnemyProjectile_XVelocity,Y
    LDA.W Enemy.XPosition,X : CLC : ADC.W #$0010 : STA.W EnemyProjectile_XPositions,Y

+   LDX.W EnemyProjectile_InitParam0
    LDA.W .Yvelocity,X : STA.W EnemyProjectile_YVelocity,Y
    LDA.W #$0000 : STA.W EnemyProjectile_YSubPositions,Y : STA.W EnemyProjectile_XSubPositions,Y
    PLX
    RTS

  .Yvelocity:
; Y velocities
    dw $FF00,$0000,$0100


;;; $9EFF: Pre-instruction - enemy projectile $9E90 (alcoon fireball) ;;;
PreInstruction_EnemyProjectile_AlcoonFireball:
;; Parameters:
;;     X: Enemy projectile index
    REP #$30
    JSR Move_EnemyProjectile_Vertically
    BCS .delete
    JSR Move_EnemyProjectile_Horizontally
    BCS .delete
    LDA.W EnemyProjectile_XVelocity,X : BPL .positive
    LDA.W EnemyProjectile_XVelocity,X : CLC : ADC.W #$0040 : STA.W EnemyProjectile_XVelocity,X
    CMP.W #$FE00 : BMI .return
    LDA.W #$FE00
    BRA .return

  .positive:
    LDA.W EnemyProjectile_XVelocity,X : SEC : SBC.W #$0040 : STA.W EnemyProjectile_XVelocity,X
    CMP.W #$0200 : BPL .return
    LDA.W #$0200

  .return:
    STA.W EnemyProjectile_XVelocity,X
    RTS

  .delete:
    LDA.W #$0000 : STA.W EnemyProjectile_ID,X
    RTS


;;; $9F41: Instruction list - pirate / Mother Brain laser - moving left ;;;
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


;;; $9F7D: Instruction list - pirate / Mother Brain laser - moving right ;;;
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


;;; $9FB9: Instruction list - pirate claw - thrown left ;;;
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


;;; $9FE1: Instruction list - pirate claw - thrown right ;;;
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


;;; $A009: Initialisation AI - enemy projectile $A17B (pirate / Mother Brain laser) ;;;
InitAI_EnemyProjectile_Pirate_MotherBrain_Laser:
;; Parameters:
;;     Y: Enemy projectile index
;;     $12: X position
;;     $14: Y position
;;     $16: Direction. 0 = left, otherwise right

; Enemy projectile damage is taken from enemy header
; If [enemy parameter 1] & 8000h = 0, then movement is 4 px/frame, otherwise 2 px/frame
    PHY : PHX
    LDX.W #InstList_EnemyProjectile_Pirate_MotherBrain_Laser_Left_0
    LDA.B DP_Temp16 : AND.W #$FFFF : BEQ +
    LDX.W #InstList_EnemyProjectile_Pirate_MotherBrain_Laser_Right_0

+   TXA : STA.W EnemyProjectile_InstListPointers,Y
    LDA.W #RTS_86A05B : STA.W EnemyProjectile_PreInstructions,Y
    LDA.B DP_Temp12 : STA.W EnemyProjectile_XPositions,Y
    LDA.B DP_Temp14 : STA.W EnemyProjectile_YPositions,Y
    LDX.W EnemyIndex
    LDA.W Enemy.ID,X : TAX
    LDA.L EnemyHeaders_damage,X : ORA.W #$1000 : STA.W EnemyProjectile_Properties,Y
    LDX.W EnemyIndex
    LDA.W Enemy.init0,X : STA.W EnemyProjectile_Var0,Y
    LDA.W #$0067
    JSL QueueSound_Lib2_Max6
    PLX
    PLY
    RTS


;;; $A050: Instruction - pre-instruction = [[Y]], execute [[Y]] ;;;
Instruction_PreInstructionInY_ExecuteY:
;; Parameters:
;;     X: Enemy projectile index
;;     Y: Pointer to instruction arguments
;; Returns:
;;     Y: Pointer to next instruction

; Honestly not sure if they forgot to add 2 to Y or not
    PHX : PHY
    LDA.W $0000,Y : STA.W EnemyProjectile_PreInstructions,X
    PLY : PLX
    RTS


;;; $A05B: RTS ;;;
RTS_86A05B:
    RTS


;;; $A05C: Pre-instruction - pirate / Mother Brain laser - move left ;;;
PreInstruction_EnemyProjectile_Pirate_MotherBrain_Laser_Left:
;; Parameters:
;;     X: Enemy projectile index
    DEC.W EnemyProjectile_XPositions,X : DEC.W EnemyProjectile_XPositions,X
    LDA.W EnemyProjectile_Var0,X : BIT.W #$8000 : BNE +
    DEC.W EnemyProjectile_XPositions,X : DEC.W EnemyProjectile_XPositions,X

+   JSR CheckIf_EnemyProjectile_IsOffScreen_duplicate_again4
    BNE .offScreen
    RTS

  .offScreen:
    STZ.W EnemyProjectile_ID,X
    RTS


;;; $A07A: Pre-instruction - pirate / Mother Brain laser - move right ;;;
PreInst_EnemyProjectile_Pirate_MotherBrain_Laser_Right:
;; Parameters:
;;     X: Enemy projectile index
    INC.W EnemyProjectile_XPositions,X : INC.W EnemyProjectile_XPositions,X
    LDA.W EnemyProjectile_Var0,X : BIT.W #$8000 : BNE +
    INC.W EnemyProjectile_XPositions,X : INC.W EnemyProjectile_XPositions,X

+   JSR CheckIf_EnemyProjectile_IsOffScreen_duplicate_again4
    BNE .offScreen
    RTS

  .offScreen:
    STZ.W EnemyProjectile_ID,X
    RTS


;;; $A098: Initialisation AI - enemy projectile $A189 (pirate claw) ;;;
PreInstruction_EnemyProjectile_PirateClaw:
;; Parameters:
;;     Y: Enemy projectile index
;;     $12: X position
;;     $14: Y position
;;     $16: X offset
;;     $18: Y offset
;;     EnemyProjectile_InitParam0: Direction. 0 = left, otherwise right
    PHY : PHX
    LDA.B DP_Temp14 : CLC : ADC.B DP_Temp18 : STA.W EnemyProjectile_YPositions,Y
    LDA.B DP_Temp12 : CLC : ADC.B DP_Temp16 : STA.W EnemyProjectile_XPositions,Y
    LDX.W #InstList_EnemyProjectile_PirateClaw_Left_0
    LDA.W EnemyProjectile_InitParam0 : AND.W #$FFFF : BEQ +
    LDX.W #InstList_EnemyProjectile_PirateClaw_Right_0

+   TXA : STA.W EnemyProjectile_InstListPointers,Y
    LDA.W #RTS_86A05B : STA.W EnemyProjectile_PreInstructions,Y
    LDA.W #$0800 : STA.W EnemyProjectile_Var0,Y
    LDA.W #$0001 : STA.W EnemyProjectile_Var1,Y
    PLX : PLY
    RTS


;;; $A0D1: Pre-instruction - pirate claw - thrown left ;;;
PreInstruction_EnemyProjectile_PirateClaw_Left:
;; Parameters:
;;     X: Enemy projectile index
    LDA.W EnemyProjectile_Var1,X : BEQ +
    LDA.W EnemyProjectile_Var0,X : XBA : AND.W #$00FF : STA.B DP_Temp12
    LDA.W EnemyProjectile_XPositions,X : SEC : SBC.B DP_Temp12 : STA.W EnemyProjectile_XPositions,X
    LDA.W EnemyProjectile_Var0,X : SEC : SBC.W #$0020 : STA.W EnemyProjectile_Var0,X : BNE .YPlus1
    STZ.W EnemyProjectile_Var1,X
    BRA .YPlus1

+   LDA.W EnemyProjectile_Var0,X : XBA : AND.W #$00FF
    CLC : ADC.W EnemyProjectile_XPositions,X : STA.W EnemyProjectile_XPositions,X
    LDA.W EnemyProjectile_Var0,X : CLC : ADC.W #$0020 : STA.W EnemyProjectile_Var0,X

  .YPlus1:
    LDA.W EnemyProjectile_YPositions,X : CLC : ADC.W #$0001 : STA.W EnemyProjectile_YPositions,X
    JSR CheckIf_EnemyProjectile_IsOffScreen_duplicate_again4
    BEQ .return
    STZ.W EnemyProjectile_ID,X

  .return:
    RTS


;;; $A124: Pre-instruction - pirate claw - thrown right ;;;
PreInstruction_EnemyProjectile_PirateClaw_Right:
;; Parameters:
;;     X: Enemy projectile index
    LDA.W EnemyProjectile_Var1,X : BEQ +
    LDA.W EnemyProjectile_Var0,X : XBA : AND.W #$00FF : STA.B DP_Temp12
    LDA.W EnemyProjectile_XPositions,X : CLC : ADC.B DP_Temp12 : STA.W EnemyProjectile_XPositions,X
    LDA.W EnemyProjectile_Var0,X : SEC : SBC.W #$0020 : STA.W EnemyProjectile_Var0,X : BNE .YPlus1
    STZ.W EnemyProjectile_Var1,X
    BRA .YPlus1

+   LDA.W EnemyProjectile_Var0,X : XBA : AND.W #$00FF : STA.B DP_Temp12
    LDA.W EnemyProjectile_XPositions,X : SEC : SBC.B DP_Temp12 : STA.W EnemyProjectile_XPositions,X
    LDA.W EnemyProjectile_Var0,X : CLC : ADC.W #$0020 : STA.W EnemyProjectile_Var0,X

  .YPlus1:
    LDA.W EnemyProjectile_YPositions,X : CLC : ADC.W #$0001 : STA.W EnemyProjectile_YPositions,X
    JSR CheckIf_EnemyProjectile_IsOffScreen_duplicate_again4
    BEQ .return
    STZ.W EnemyProjectile_ID,X

  .return:
    RTS


;;; $A17B: Enemy projectiles - pirate ;;;
EnemyProjectile_PirateMotherBrainLaser:
    %EnemyProjectile(\
    %initAI(InitAI_EnemyProjectile_Pirate_MotherBrain_Laser),
    %preInst(PreInstruction_EnemyProjectile_Pirate_MotherBrain_Laser_Left),
    %instList(InstList_EnemyProjectile_Pirate_MotherBrain_Laser_Left_0),
    %radius($10, 4),
    %properties($100A),
    %hitList(0),
    %shotList(InstList_EnemyProjectile_Delete))

EnemyProjectile_PirateClaw:
    %EnemyProjectile(\
    %initAI(PreInstruction_EnemyProjectile_PirateClaw),
    %preInst(RTS_86A05B),
    %instList(0),
    %radius(8, 8),
    %properties($1014),
    %hitList(0),
    %shotList(InstList_EnemyProjectile_Delete))


;;; $A197: Instruction list - gunship liftoff dust clouds - index = 0 ;;;
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


;;; $A1C1: Instruction list - gunship liftoff dust clouds - index = 2 ;;;
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


;;; $A1EB: Instruction list - gunship liftoff dust clouds - index = 4 ;;;
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


;;; $A211: Instruction list - gunship liftoff dust clouds - index = 6 ;;;
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


;;; $A23B: Instruction list - gunship liftoff dust clouds - index = 8 ;;;
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


;;; $A265: Instruction list - gunship liftoff dust clouds - index = Ah ;;;
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


;;; $A28B: Instruction list - delete ;;;
InstList_EnemyProjectile_Delete_A28B:
    dw Instruction_EnemyProjectile_Delete


;;; $A28D: Instruction list / shot instruction list - enemy projectile $A387 (Ceres elevator pad) ;;;
InstList_EnemyProjectile_Shot_CeresElevatorPad:
    dw $0001,EnemyProjSpritemaps_CeresElevatorPad_DustCloud_Explosion_0
    dw $0001,EnemyProjSpritemaps_CeresElevatorPad_DustCloud_Explosion_1
    dw Instruction_EnemyProjectile_GotoY
    dw InstList_EnemyProjectile_Shot_CeresElevatorPad


;;; $A299: Instruction list / shot instruction list - enemy projectile $A395 (Ceres elevator pad level data concealer) ;;;
InstList_EnemyProj_Shot_CeresElevatorPadLevelDataConcealer:
    dw $0001,EnemyProjSpritemaps_CeresElevatorPadLevelDataConcealer
    dw Instruction_EnemyProjectile_GotoY
    dw InstList_EnemyProj_Shot_CeresElevatorPadLevelDataConcealer


;;; $A2A1: Initialisation AI - enemy projectile $A379 (gunship liftoff dust clouds) ;;;
InitAI_EnemyProjectile_GunshipLiftoffDustClouds:
;; Parameters:
;;     Y: Enemy projectile index
;;     EnemyProjectile_InitParam0: Index. Multiple of 2, range 0..Ah. 0/2/4 are on the right side, 6/8/Ah on the left side
    PHP
    REP #$30
    LDA.W #$0000
    STA.W EnemyProjectile_XSubPositions,Y : STA.W EnemyProjectile_YSubPositions,Y
    STA.W EnemyProjectile_XVelocity,Y : STA.W EnemyProjectile_YVelocity,Y
    LDX.W EnemyProjectile_InitParam0
    LDA.W SamusXPosition : CLC : ADC.W .Xoffsets,X : STA.W EnemyProjectile_XPositions,Y
    LDA.W SamusYPosition : CLC : ADC.W #$0050 : STA.W EnemyProjectile_YPositions,Y
    LDA.W .InstListPointers,X : STA.W EnemyProjectile_InstListPointers,Y
    TXA : STA.W EnemyProjectile_Var0,Y
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


;;; $A2EE: Initialisation AI - enemy projectile $A387 (Ceres elevator pad) ;;;
InitAI_EnemyProjectile_CeresElevatorPad:
;; Parameters:
;;     Y: Enemy projectile index
    PHP
    REP #$30
    LDA.W SamusYPosition : CLC : ADC.W #$001C : STA.W EnemyProjectile_YPositions,Y
    LDA.W #$003C : STA.W EnemyProjectile_Var0,Y
; fallthrough to InitAI_EnemyProjectile_CeresElevatorPad_Common


;;; $A301: Ceres elevator common initialisation ;;;
InitAI_EnemyProjectile_CeresElevatorPad_Common:
;; Parameters:
;;     Y: Enemy projectile index

; Expects a pushed PSR
    LDA.W #$0000
    STA.W EnemyProjectile_XSubPositions,Y : STA.W EnemyProjectile_YSubPositions,Y
    STA.W EnemyProjectile_XVelocity,Y : STA.W EnemyProjectile_YVelocity,Y
    STA.W EnemyProjectile_GraphicsIndices,Y
    LDA.W SamusXPosition : STA.W EnemyProjectile_XPositions,Y
    PLP
    RTS


;;; $A31B: Initialisation AI - enemy projectile $A395 (Ceres elevator pad level data concealer) ;;;
InitAI_EnemyProjectile_CeresElevatorPadLevelDataConcealer:
;; Parameters:
;;     Y: Enemy projectile index
    PHP
    REP #$30
    LDA.W #$0061 : STA.W EnemyProjectile_YPositions,Y
    JMP InitAI_EnemyProjectile_CeresElevatorPad_Common


;;; $A327: RTS. Pre-instruction - enemy projectile $A379 (gunship liftoff dust clouds) ;;;
RTS_86A327:
    RTS


;;; $A328: Pre-instruction - enemy projectile $A387 (Ceres elevator pad) ;;;
PreInstruction_EnemyProjectile_CeresElevatorPad:
;; Parameters:
;;     X: Enemy projectile index
    LDA.W EnemyProjectile_Var0,X : BEQ .timerExpired
    DEC.W EnemyProjectile_Var0,X : BEQ .timerExpired
    BPL .return

  .timerExpired:
    LDA.W SamusYPosition : CLC : ADC.W #$001C : STA.W EnemyProjectile_YPositions,X
    LDA.W SamusYPosition : INC : STA.W SamusYPosition
    CMP.W #$0049 : BMI .return
    LDA.W #$0048 : STA.W SamusYPosition
    LDA.W #$0001 : STA.W EnemyProjectile_InstructionTimers,X
    LDA.W #InstList_EnemyProjectile_Delete_A28B : STA.W EnemyProjectile_InstListPointers,X
    LDA.W #$000E
    JSL Run_Samus_Command

  .return:
    RTS


;;; $A364: Pre-instruction - enemy projectile $A395 (Ceres elevator pad level data concealer) ;;;
PreInst_EnemyProjectile_CeresElevatorPadLevelDataConcealer:
;; Parameters:
;;     X: Enemy projectile index
    LDA.W SamusYPosition : CMP.W #$0048 : BNE .return
    LDA.W #$0001 : STA.W EnemyProjectile_InstructionTimers,X
    LDA.W #InstList_EnemyProjectile_Delete_A28B : STA.W EnemyProjectile_InstListPointers,X

  .return:
    RTS


;;; $A379: Enemy projectiles - gunship liftoff dust clouds / Ceres elevator ;;;
EnemyProjectile_GunShipLiftoffDustClouds:
    %EnemyProjectile(\
    %initAI(InitAI_EnemyProjectile_GunshipLiftoffDustClouds),
    %preInst(RTS_86A327),
    %instList(InstList_EnemyProjectile_GunshipLiftoffDustClouds_Index0_0),
    %radius(8, 8),
    %properties($3000),
    %hitList(0),
    %shotList(InstList_EnemyProjectile_GunshipLiftoffDustClouds_Index0_0))

EnemyProjectile_CeresElevatorPad:
    %EnemyProjectile(\
    %initAI(InitAI_EnemyProjectile_CeresElevatorPad),
    %preInst(PreInstruction_EnemyProjectile_CeresElevatorPad),
    %instList(InstList_EnemyProjectile_Shot_CeresElevatorPad),
    %radius(1, 1),
    %properties($3000),
    %hitList(0),
    %shotList(InstList_EnemyProjectile_Shot_CeresElevatorPad))

EnemyProjectile_CeresElevatorPadLevelDataConcealer:
    %EnemyProjectile(\
    %initAI(InitAI_EnemyProjectile_CeresElevatorPadLevelDataConcealer),
    %preInst(PreInst_EnemyProjectile_CeresElevatorPadLevelDataConcealer),
    %instList(InstList_EnemyProj_Shot_CeresElevatorPadLevelDataConcealer),
    %radius(1, 1),
    %properties($3000),
    %hitList(0),
    %shotList(InstList_EnemyProj_Shot_CeresElevatorPadLevelDataConcealer))


;;; $A3A3: Initialisation AI / pre-instruction - enemy projectile $A3B0 (pre-Phantoon room) ;;;
InitAI_PreInstruction_EnemyProjectile_PrePhantoonRoom:
    LDA.W #$0000
    STA.W BG2YOffset
    RTS


;;; $A3AA: Instruction list - enemy projectile $A3B0 (pre-Phantoon room) ;;;
InstList_EnemyProjectile_PrePhantoonRoom:
    dw $0020,EnemyProjSpritemaps_Blank_Default
    dw Instruction_EnemyProjectile_Delete


;;; $A3B0: Enemy projectile - pre-Phantoon room ;;;
EnemyProjectile_PrePhantoonRoom:
    %EnemyProjectile(\
    %initAI(InitAI_PreInstruction_EnemyProjectile_PrePhantoonRoom),
    %preInst(InitAI_PreInstruction_EnemyProjectile_PrePhantoonRoom),
    %instList(InstList_EnemyProjectile_PrePhantoonRoom),
    %radius(0, 0),
    %properties($3000),
    %hitList(0),
    %shotList(InstList_EnemyProjectile_Delete))


;;; $A3BE: Instruction - reset position ;;;
Instruction_EnemyProjectile_Torizo_ResetPosition:
;; Parameters:
;;     X: Enemy projectile index
    LDA.W EnemyProjectile_Var0,X : STA.W EnemyProjectile_XPositions,X
    LDA.W EnemyProjectile_Var1,X : STA.W EnemyProjectile_YPositions,X
    RTS


;;; $A3CB: Instruction list - enemy projectile $A9A1 (Bomb Torizo low-health explosion) ;;;
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


;;; $A3FA: Instruction list - enemy projectile $A9AF (Torizo death explosion) ;;;
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


;;; $A456: Instruction - go to [[Y]] with probability 1/4 ;;;
Instruction_EnemyProjectile_GotoY_Probability_1_4:
;; Parameters:
;;     Y: Pointer to instruction arguments
;; Returns:
;;     Y: Pointer to next instruction
    JSL GenerateRandomNumber
    AND.W #$C000 : CMP.W #$C000 : BEQ .gotoY
    INY #2
    RTS

  .gotoY:
    LDA.W $0000,Y : TAY
    RTS


;;; $A46A: Instruction list - Bomb Torizo low-health drool - 4 frame delay ;;;
InstList_EnemyProj_BombTorizoLowHealthDrool_4FrameDelay:
    dw $0002,EnemyProjSpritemaps_Blank_Default


;;; $A46E: Instruction list - Bomb Torizo low-health drool - 2 frame delay ;;;
InstList_EnemyProj_BombTorizoLowHealthDrool_2FrameDelay:
    dw $0002,EnemyProjSpritemaps_Blank_Default


;;; $A472: Instruction list - Bomb Torizo low-health drool - no delay ;;;
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


;;; $A48A: Instruction list - Bomb Torizo low-health drool - hit wall ;;;
InstList_EnemyProj_BombTorizoLowHealthDrool_HitWall:
    dw Instruction_EnemyProjectile_ClearPreInstruction
    dw Instruction_EnemyProjectile_Delete


;;; $A48E: Instruction list - Bomb Torizo low-health drool - hit floor ;;;
InstList_EnemyProj_BombTorizoLowHealthDrool_HitFloor:
    dw Instruction_EnemyProjectile_ClearPreInstruction
    dw $0008,UNUSED_EnemyProjSpritemaps_BombTorizoLowHealthDrool_1_8D8C5B
    dw $0008,UNUSED_EnemyProjSpritemaps_BombTorizoLowHealthDrool_2_8D8C62
    dw $0008,UNUSED_EnemyProjSpritemaps_BombTorizoLowHealthDrool_3_8D8C69
    dw Instruction_EnemyProjectile_Delete


if !FEATURE_KEEP_UNREFERENCED
;;; $A49E: Instruction list - enemy projectile $A977 ;;;
UNUSED_InstList_EnemyProjectile_BombTorizo_86A49E:
    dw Instruction_EnemyProjectile_Properties_OrY,$3000
    dw $0024,UNUSED_EnemyProjSpritemaps_BombTorizoLowHealthDrool_0_8D8C54
    dw Instruction_EnemyProjectile_GotoY
    dw InstList_EnemyProj_BombTorizoLowHealthDrool_HitFloor
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $A4AA: Instruction list - enemy projectile $A985 (Bomb Torizo explosive swipe) ;;;
InstList_EnemyProjectile_BombTorizoExplosionSwipe:
    dw Instruction_EnemyProjectile_QueueSoundInY_Lib2_Max1 : db $26
    dw $0005,EnemyProjSpritemaps_Common_0
    dw $0005,EnemyProjSpritemaps_Common_1
    dw $0005,EnemyProjSpritemaps_Common_2
    dw $0005,EnemyProjSpritemaps_Common_3
    dw $0005,EnemyProjSpritemaps_Common_4
    dw Instruction_EnemyProjectile_Delete


;;; $A4C3: Instruction list - Bomb Torizo statue breaking - index = 0 ;;;
InstList_EnemyProjectile_BombTorizoChozoBreaking_Index0:
    dw $0080,EnemyProjSpritemaps_BombTorizoChozoBreaking_0
    dw Instruction_EnemyProjectile_QueueSoundInY_Lib2_Max6 : db $0C
    dw Instruction_EnemyProjectile_PreInstructionInY
    dw PreInst_EnemyProjectile_BombTorizoChozoBreaking_Falling
    dw $0070,EnemyProjSpritemaps_BombTorizoChozoBreaking_0
    dw Instruction_EnemyProjectile_Delete


;;; $A4D4: Instruction list - Bomb Torizo statue breaking - index = 2 ;;;
InstList_EnemyProjectile_BombTorizoChozoBreaking_Index2:
    dw $0078,EnemyProjSpritemaps_BombTorizoChozoBreaking_1
    dw Instruction_EnemyProjectile_QueueSoundInY_Lib2_Max6 : db $0C
    dw Instruction_EnemyProjectile_PreInstructionInY
    dw PreInst_EnemyProjectile_BombTorizoChozoBreaking_Falling
    dw $0070,EnemyProjSpritemaps_BombTorizoChozoBreaking_1
    dw Instruction_EnemyProjectile_Delete


;;; $A4E5: Instruction list - Bomb Torizo statue breaking - index = 4 ;;;
InstList_EnemyProjectile_BombTorizoChozoBreaking_Index4:
    dw $0070,EnemyProjSpritemaps_BombTorizoChozoBreaking_2
    dw Instruction_EnemyProjectile_QueueSoundInY_Lib2_Max6 : db $0C
    dw Instruction_EnemyProjectile_PreInstructionInY
    dw PreInst_EnemyProjectile_BombTorizoChozoBreaking_Falling
    dw $0070,EnemyProjSpritemaps_BombTorizoChozoBreaking_2
    dw Instruction_EnemyProjectile_Delete


;;; $A4F6: Instruction list - Bomb Torizo statue breaking - index = 6 ;;;
InstList_EnemyProjectile_BombTorizoChozoBreaking_Index6:
    dw $0068,EnemyProjSpritemaps_BombTorizoChozoBreaking_3
    dw Instruction_EnemyProjectile_QueueSoundInY_Lib2_Max6 : db $0C
    dw Instruction_EnemyProjectile_PreInstructionInY
    dw PreInst_EnemyProjectile_BombTorizoChozoBreaking_Falling
    dw $0070,EnemyProjSpritemaps_BombTorizoChozoBreaking_3
    dw Instruction_EnemyProjectile_Delete


;;; $A507: Instruction list - Bomb Torizo statue breaking - index = 8 ;;;
InstList_EnemyProjectile_BombTorizoChozoBreaking_Index8:
    dw $0060,EnemyProjSpritemaps_BombTorizoChozoBreaking_4
    dw Instruction_EnemyProjectile_QueueSoundInY_Lib2_Max6 : db $0C
    dw Instruction_EnemyProjectile_PreInstructionInY
    dw PreInst_EnemyProjectile_BombTorizoChozoBreaking_Falling
    dw $0070,EnemyProjSpritemaps_BombTorizoChozoBreaking_4
    dw Instruction_EnemyProjectile_Delete


;;; $A518: Instruction list - Bomb Torizo statue breaking - index = Ah ;;;
InstList_EnemyProjectile_BombTorizoChozoBreaking_IndexA:
    dw $0058,EnemyProjSpritemaps_BombTorizoChozoBreaking_5
    dw Instruction_EnemyProjectile_QueueSoundInY_Lib2_Max6 : db $0C
    dw Instruction_EnemyProjectile_PreInstructionInY
    dw PreInst_EnemyProjectile_BombTorizoChozoBreaking_Falling
    dw $0070,EnemyProjSpritemaps_BombTorizoChozoBreaking_5
    dw Instruction_EnemyProjectile_Delete


;;; $A529: Instruction list - Bomb Torizo statue breaking - index = Ch ;;;
InstList_EnemyProjectile_BombTorizoChozoBreaking_IndexC:
    dw $0050,EnemyProjSpritemaps_BombTorizoChozoBreaking_6
    dw Instruction_EnemyProjectile_QueueSoundInY_Lib2_Max6 : db $0C
    dw Instruction_EnemyProjectile_PreInstructionInY
    dw PreInst_EnemyProjectile_BombTorizoChozoBreaking_Falling
    dw $0070,EnemyProjSpritemaps_BombTorizoChozoBreaking_6
    dw Instruction_EnemyProjectile_Delete


;;; $A53A: Instruction list - Bomb Torizo statue breaking - index = Eh ;;;
InstList_EnemyProjectile_BombTorizoChozoBreaking_IndexE:
    dw $0048,EnemyProjSpritemaps_BombTorizoChozoBreaking_7
    dw Instruction_EnemyProjectile_QueueSoundInY_Lib2_Max6 : db $0C
    dw Instruction_EnemyProjectile_PreInstructionInY
    dw PreInst_EnemyProjectile_BombTorizoChozoBreaking_Falling
    dw $0070,EnemyProjSpritemaps_BombTorizoChozoBreaking_7
    dw Instruction_EnemyProjectile_Delete


;;; $A54B: Instruction list - Bomb Torizo statue breaking - index = 10h ;;;
InstList_EnemyProjectile_BombTorizoChozoBreaking_Index10:
    dw $0040,EnemyProjSpritemaps_BombTorizoChozoBreaking_8
    dw Instruction_EnemyProjectile_QueueSoundInY_Lib2_Max6 : db $0C
    dw Instruction_EnemyProjectile_PreInstructionInY
    dw PreInst_EnemyProjectile_BombTorizoChozoBreaking_Falling
    dw $0070,EnemyProjSpritemaps_BombTorizoChozoBreaking_8
    dw Instruction_EnemyProjectile_Delete


;;; $A55C: Instruction list - Bomb Torizo statue breaking - index = 12h ;;;
InstList_EnemyProjectile_BombTorizoChozoBreaking_Index12:
    dw $0040,EnemyProjSpritemaps_BombTorizoChozoBreaking_9
    dw Instruction_EnemyProjectile_QueueSoundInY_Lib2_Max6 : db $0C
    dw Instruction_EnemyProjectile_PreInstructionInY
    dw PreInst_EnemyProjectile_BombTorizoChozoBreaking_Falling
    dw $0070,EnemyProjSpritemaps_BombTorizoChozoBreaking_9
    dw Instruction_EnemyProjectile_Delete


;;; $A56D: Instruction list - Bomb Torizo statue breaking - index = 14h ;;;
InstList_EnemyProjectile_BombTorizoChozoBreaking_Index14:
    dw $0040,EnemyProjSpritemaps_BombTorizoChozoBreaking_A
    dw Instruction_EnemyProjectile_QueueSoundInY_Lib2_Max6 : db $0C
    dw Instruction_EnemyProjectile_PreInstructionInY
    dw PreInst_EnemyProjectile_BombTorizoChozoBreaking_Falling
    dw $0070,EnemyProjSpritemaps_BombTorizoChozoBreaking_A
    dw Instruction_EnemyProjectile_Delete


;;; $A57E: Instruction list - Bomb Torizo statue breaking - index = 16h ;;;
InstList_EnemyProjectile_BombTorizoChozoBreaking_Index16:
    dw $0040,EnemyProjSpritemaps_BombTorizoChozoBreaking_B
    dw Instruction_EnemyProjectile_QueueSoundInY_Lib2_Max6 : db $0C
    dw Instruction_EnemyProjectile_PreInstructionInY
    dw PreInst_EnemyProjectile_BombTorizoChozoBreaking_Falling
    dw $0070,EnemyProjSpritemaps_BombTorizoChozoBreaking_B
    dw Instruction_EnemyProjectile_Delete


;;; $A58F: Instruction list - Bomb Torizo statue breaking - index = 18h ;;;
InstList_EnemyProjectile_BombTorizoChozoBreaking_Index18:
    dw $0040,EnemyProjSpritemaps_BombTorizoChozoBreaking_C
    dw Instruction_EnemyProjectile_QueueSoundInY_Lib2_Max6 : db $0C
    dw Instruction_EnemyProjectile_PreInstructionInY
    dw PreInst_EnemyProjectile_BombTorizoChozoBreaking_Falling
    dw $0070,EnemyProjSpritemaps_BombTorizoChozoBreaking_C
    dw Instruction_EnemyProjectile_Delete


;;; $A5A0: Instruction list - Bomb Torizo statue breaking - index = 1Ah ;;;
InstList_EnemyProjectile_BombTorizoChozoBreaking_Index1A:
    dw $0040,EnemyProjSpritemaps_BombTorizoChozoBreaking_D
    dw Instruction_EnemyProjectile_QueueSoundInY_Lib2_Max6 : db $0C
    dw Instruction_EnemyProjectile_PreInstructionInY
    dw PreInst_EnemyProjectile_BombTorizoChozoBreaking_Falling
    dw $0070,EnemyProjSpritemaps_BombTorizoChozoBreaking_D
    dw Instruction_EnemyProjectile_Delete


;;; $A5B1: Instruction list - Bomb Torizo statue breaking - index = 1Ch ;;;
InstList_EnemyProjectile_BombTorizoChozoBreaking_Index1C:
    dw $0040,EnemyProjSpritemaps_BombTorizoChozoBreaking_E
    dw Instruction_EnemyProjectile_QueueSoundInY_Lib2_Max6 : db $0C
    dw Instruction_EnemyProjectile_PreInstructionInY
    dw PreInst_EnemyProjectile_BombTorizoChozoBreaking_Falling
    dw $0070,EnemyProjSpritemaps_BombTorizoChozoBreaking_E
    dw Instruction_EnemyProjectile_Delete


;;; $A5C2: Instruction list - Bomb Torizo statue breaking - index = 1Eh ;;;
InstList_EnemyProjectile_BombTorizoChozoBreaking_Index1E:
    dw $0040,EnemyProjSpritemaps_BombTorizoChozoBreaking_F
    dw Instruction_EnemyProjectile_QueueSoundInY_Lib2_Max6 : db $0C
    dw Instruction_EnemyProjectile_PreInstructionInY
    dw PreInst_EnemyProjectile_BombTorizoChozoBreaking_Falling
    dw $0070,EnemyProjSpritemaps_BombTorizoChozoBreaking_F
    dw Instruction_EnemyProjectile_Delete


;;; $A5D3: Initialisation AI - enemy projectile $A95B (Bomb Torizo low-health continuous drool) ;;;
InitAI_EnemyProjectile_BombTorizoContinuousDrool:
;; Parameters:
;;     Y: Enemy projectile index
    LDA.W #$0000 : STA.W EnemyProjectile_GraphicsIndices,Y
    JSL GenerateRandomNumber
    LSR : AND.W #$000E : TAX
    LDA.W .InstListPointers,X : STA.W EnemyProjectile_InstListPointers,Y
    JSL GenerateRandomNumber
    LDX.W EnemyIndex
    LDA.W Enemy.YPosition,X : CLC : ADC.W #$FFFB : STA.W EnemyProjectile_YPositions,Y
    BIT.W Enemy.init0,X : BVC .checkLeft
    LDA.W RandomNumberSeed : AND.W #$01FE : BRA .angleDetermined

  .checkLeft:
    BMI .checkRight
    LDA.W #$00E0
    BRA .facingRight

  .checkRight:
    LDA.W #$0020

  .facingRight:
    STA.B DP_Temp12
    LDA.W RandomNumberSeed : AND.W #$000F : SEC : SBC.W #$0008
    CLC : ADC.B DP_Temp12
    ASL

  .angleDetermined:
    TAX
    LDA.L SineCosineTables_8bitSine_SignExtended,X : STA.W EnemyProjectile_XVelocity,Y
    LDA.L SineCosineTables_NegativeCosine_SignExtended,X : STA.W EnemyProjectile_YVelocity,Y
    LDX.W EnemyIndex
    BIT.W Enemy.init0,X : BMI .move
    LDA.W Enemy.XPosition,X : CLC : ADC.W #$FFF8 : STA.W EnemyProjectile_XPositions,Y
    RTS

  .move:
    LDA.W Enemy.XPosition,X : CLC : ADC.W #$0008 : STA.W EnemyProjectile_XPositions,Y
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


;;; $A65D: Initialisation AI - enemy projectile $A969 (Bomb Torizo low-health initial drool) ;;;
InitAI_EnemyProjectile_BombTorizoInitialDrool:
;; Parameters:
;;     Y: Enemy projectile index
    LDA.W #$0000 : STA.W EnemyProjectile_GraphicsIndices,Y
    JSL GenerateRandomNumber
    LDX.W EnemyIndex
    LDA.W RandomNumberSeed : AND.W #$0003
    CLC : ADC.W Enemy.YPosition,X : ADC.W #$FFFB : STA.W EnemyProjectile_YPositions,Y
    LDA.W RandomNumberSeed : AND.W #$001F : ADC.W #$0030 : STA.W EnemyProjectile_YVelocity,Y
    JSL GenerateRandomNumber
    LDA.W RandomNumberSeed : AND.W #$0003 : BIT.W Enemy.init0,X : BVC .notTurning
    CLC : ADC.W Enemy.XPosition,X : STA.W EnemyProjectile_XPositions,Y
    LDA.W #$0000 : STA.W EnemyProjectile_XVelocity,Y
    RTS

  .notTurning:
    BMI .facingRight
    CLC : ADC.W Enemy.XPosition,X : ADC.W #$FFF8 : STA.W EnemyProjectile_XPositions,Y
    LDA.W #$0000 : STA.W EnemyProjectile_XVelocity,Y
    RTS

  .facingRight:
    CLC : ADC.W Enemy.XPosition,X : ADC.W #$0008 : STA.W EnemyProjectile_XPositions,Y
    LDA.W #$0000 : STA.W EnemyProjectile_XVelocity,Y
    RTS


if !FEATURE_KEEP_UNREFERENCED
;;; $A6C7: Initialisation AI - enemy projectile $A977 ;;;
UNUSED_InitAI_EnemyProjectile_BombTorizo_86A6C7:
;; Parameters:
;;     Y: Enemy projectile index
    LDA.W #$0000 : STA.W EnemyProjectile_GraphicsIndices,Y
    LDX.W PLM_Index
    JSL Calculate_PLM_Block_Coordinates
    LDA.W PLM_XBlock : ASL #4 : STA.W EnemyProjectile_XPositions,Y
    LDA.W PLM_YBlock : ASL #4 : SEC : SBC.W #$0004 : STA.W EnemyProjectile_YPositions,Y
    LDA.W #$0000 : STA.W EnemyProjectile_XSubPositions,Y : STA.W EnemyProjectile_YSubPositions,Y
    RTS
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $A6F6: Initialisation AI - enemy projectile $A985 (Bomb Torizo explosive swipe) ;;;
InitAI_EnemyProjectile_BombTorizoExplosiveSwipe:
;; Parameters:
;;     Y: Enemy projectile index
;;     EnemyProjectile_InitParam0: Index. Multiple of 2, range 0..14h
    LDX.W EnemyIndex
    LDA.W Enemy.XPosition,X : STA.B DP_Temp12
    LDA.W Enemy.YPosition,X : STA.B DP_Temp14
    BIT.W Enemy.init0,X : BMI .facingRight
    LDX.W EnemyProjectile_InitParam0
    LDA.W .Xpositions,X : CLC : ADC.B DP_Temp12 : STA.W EnemyProjectile_XPositions,Y
    LDA.W .Yposition,X : CLC : ADC.B DP_Temp14 : STA.W EnemyProjectile_YPositions,Y
    RTS

  .facingRight:
    LDX.W EnemyProjectile_InitParam0
    LDA.W .Xpositions,X : EOR.W #$FFFF : INC
    CLC : ADC.B DP_Temp12 : STA.W EnemyProjectile_XPositions,Y
    LDA.W .Yposition,X : CLC : ADC.B DP_Temp14 : STA.W EnemyProjectile_YPositions,Y
    RTS

  .Xpositions:
    dw $FFE2,$FFD8,$FFD1,$FFE1,$FFEB,$FFFF,$FFE4,$FFD5,$FFD0,$FFE1
    dw $FFEB ; Unused

  .Yposition:
    dw $FFCC,$FFE4,$FFF5,$0009,$0015,$0014,$FFCC,$FFE5,$FFF6,$0009
    dw $0014 ; Unused


;;; $A764: Initialisation AI - enemy projectile $A993 (Bomb Torizo statue breaking) ;;;
InitAI_EnemyProj_BombTorizoChozoBreaking:
;; Parameters:
;;     Y: Enemy projectile index
;;     EnemyProjectile_InitParam0: Index. Multiple of 2, range 0..1Eh
    LDX.W PLM_Index
    JSL Calculate_PLM_Block_Coordinates
    LDX.W EnemyProjectile_InitParam0
    LDA.W .InstListPointers,X : STA.W EnemyProjectile_InstListPointers,Y
    LDA.W PLM_XBlock : ASL #4 : CLC : ADC.W .Xoffsets,X : STA.W EnemyProjectile_XPositions,Y
    TXA : AND.W #$000F : TAX
    LDA.W PLM_YBlock : ASL #4 : CLC : ADC.W .Yoffsets,X : STA.W EnemyProjectile_YPositions,Y
    LDA.W .Yvelocities,X : STA.W EnemyProjectile_YVelocity,Y
    LDA.W .Yaccelerations,X : STA.W EnemyProjectile_Var1,Y
    LDA.W EnemyProjectile_Properties,Y : ORA.W #$1000 : STA.W EnemyProjectile_Properties,Y
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
; Y velocities (unit 1/100h px/frame)
    dw $0100,$0100,$0100,$0100,$0100,$0100,$0100,$0100

  .Yaccelerations:
; Y accelerations (unit 1/100h px/frame²)
    dw $0010,$0010,$0010,$0010,$0010,$0010,$0010,$0010


;;; $A81B: Initialisation AI - enemy projectile $A9A1 (Bomb Torizo low-health explosion) ;;;
InitAI_EnemyProjectile_BombTorizoLowHealthExplosion:
;; Parameters:
;;     Y: Enemy projectile index
;;     EnemyProjectile_InitParam0: Index. 0 (BT's gut) or 6 (BT's face)
    LDX.W EnemyIndex
    LDA.W Enemy.XPosition,X : STA.W EnemyProjectile_XPositions,Y
    LDA.W Enemy.YPosition,X : STA.W EnemyProjectile_YPositions,Y : BIT.W Enemy.init0,X : BMI .facingRight
    INC.W EnemyProjectile_InitParam0 : INC.W EnemyProjectile_InitParam0

  .facingRight:
    INC.W EnemyProjectile_InitParam0 : INC.W EnemyProjectile_InitParam0
    LDX.W EnemyProjectile_InitParam0
    LDA.W EnemyProjectile_XPositions,Y : CLC : ADC.W .Xoffsets,X : STA.W EnemyProjectile_XPositions,Y
    STA.W EnemyProjectile_Var0,Y
    LDA.W EnemyProjectile_YPositions,Y : CLC : ADC.W .Yoffsets,X : STA.W EnemyProjectile_YPositions,Y
    STA.W EnemyProjectile_Var1,Y
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


;;; $A871: Initialisation AI - enemy projectile $A9AF (torizo death explosion) ;;;
InitAI_EnemyProjectile_TorizoDeathExplosion:
;; Parameters:
;;     Y: Enemy projectile index
    LDX.W EnemyIndex
    LDA.W Enemy.XPosition,X : STA.W EnemyProjectile_XPositions,Y : STA.W EnemyProjectile_Var0,Y
    LDA.W Enemy.YPosition,X : STA.W EnemyProjectile_YPositions,Y : STA.W EnemyProjectile_Var1,Y
    RTS


;;; $A887: Pre-instruction - Bomb Torizo low-health drool - falling ;;;
PreInst_EnemyProjectile_BombTorizoLowHealthDrool_Falling:
;; Parameters:
;;     X: Enemy projectile index
    JSR Move_EnemyProjectile_Horizontally
    BCS .hitWall
    LDA.W EnemyProjectile_XVelocity,X : BPL .right
    CLC : ADC.W #$0004 : BMI +
    LDA.W #$0003

+   STA.W EnemyProjectile_XVelocity,X
    BRA .merge

  .right:
    SEC : SBC.W #$0004 : BPL +
    LDA.W #$0003

+   STA.W EnemyProjectile_XVelocity,X

  .merge:
    JSR Move_EnemyProjectile_Vertically
    BIT.W EnemyProjectile_YVelocity,X : BMI +
    BCS .hitFloor

+   LDA.W EnemyProjectile_YVelocity,X : CLC : ADC.W #$0010 : STA.W EnemyProjectile_YVelocity,X
    AND.W #$F000 : CMP.W #$1000 : BNE .return
    STZ.W EnemyProjectile_ID,X

  .return:
    RTS

  .hitWall:
    LDA.W #InstList_EnemyProj_BombTorizoLowHealthDrool_HitWall : STA.W EnemyProjectile_InstListPointers,X
    LDA.W #$0001 : STA.W EnemyProjectile_InstructionTimers,X
    RTS

  .hitFloor:
    LDA.W EnemyProjectile_YPositions,X : SEC : SBC.W #$0003 : STA.W EnemyProjectile_YPositions,X
    LDA.W #InstList_EnemyProj_BombTorizoLowHealthDrool_HitFloor : STA.W EnemyProjectile_InstListPointers,X
    LDA.W #$0001 : STA.W EnemyProjectile_InstructionTimers,X
    RTS


;;; $A8EF: Pre-instruction - Bomb Torizo statue breaking - falling / enemy projectile $A977 ;;;
PreInst_EnemyProjectile_BombTorizoChozoBreaking_Falling:
;; Parameters:
;;     X: Enemy projectile index
    JSR Move_EnemyProjectile_Vertically
    BIT.W EnemyProjectile_YVelocity,X : BMI .negative
    BCS .hitFloor

  .negative:
    LDA.W EnemyProjectile_YVelocity,X : CLC : ADC.W EnemyProjectile_Var1 : STA.W EnemyProjectile_YVelocity,X
    AND.W #$F000 : CMP.W #$1000 : BNE .return
    LDA.W #$1000 : STA.W EnemyProjectile_YVelocity,X

  .return:
    RTS

  .hitFloor:
    LDA.W #.return2 : STA.W EnemyProjectile_PreInstructions,X

  .return2:
    RTS


;;; $A919: RTS. Pre-instruction - enemy projectile $A985 (Bomb Torizo explosive swipe) ;;;
RTS_86A919:
    RTS


if !FEATURE_KEEP_UNREFERENCED
;;; $A91A: Unused. Debug. Move enemy projectile with controller 2 ;;;
UNUSED_Debug_MoveEnemyProjectileWithController2:
;; Parameters:
;;     X: Enemy projectile index
    STZ.W EnemyProjectile_XVelocity,X
    LDA.B DP_Controller2Input : BIT.W #$0100 : BEQ .checkLeft
    LDA.W #$0100 : STA.W EnemyProjectile_XVelocity,X

  .checkLeft:
    LDA.B DP_Controller2Input : BIT.W #$0200 : BEQ .moveHorizontally
    LDA.W #$FF00 : STA.W EnemyProjectile_XVelocity,X

  .moveHorizontally:
    JSR Move_EnemyProjectile_Horizontally
    STZ.W EnemyProjectile_YVelocity,X
    LDA.B DP_Controller2Input : BIT.W #$0400 : BEQ .checkUp
    LDA.W #$0100 : STA.W EnemyProjectile_YVelocity,X

  .checkUp:
    LDA.B DP_Controller2Input : BIT.W #$0800 : BEQ .moveVertically
    LDA.W #$FF00 : STA.W EnemyProjectile_YVelocity,X

  .moveVertically:
    JSR Move_EnemyProjectile_Vertically
    RTS
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $A95B: Enemy projectiles - torizo ;;;
EnemyProjectile_BombTorizoContinuousDrool:
    %EnemyProjectile(\
    %initAI(InitAI_EnemyProjectile_BombTorizoContinuousDrool),
    %preInst(RTS_8684FB),
    %instList(InstList_EnemyProj_BombTorizoLowHealthDrool_NoDelay_0),
    %radius(1, 2),
    %properties($3000),
    %hitList(0),
    %shotList(InstList_EnemyProjectile_Delete))

EnemyProjectile_BombTorizoInitialDrool:
    %EnemyProjectile(\
    %initAI(InitAI_EnemyProjectile_BombTorizoInitialDrool),
    %preInst(RTS_8684FB),
    %instList(InstList_EnemyProj_BombTorizoLowHealthDrool_NoDelay_0),
    %radius(1, 2),
    %properties($2000),
    %hitList(0),
    %shotList(InstList_EnemyProjectile_Delete))

if !FEATURE_KEEP_UNREFERENCED
UNUSED_EnemyProjectile_BombTorizo_86A977:
    %EnemyProjectile(\
    %initAI(UNUSED_InitAI_EnemyProjectile_BombTorizo_86A6C7),
    %preInst(PreInst_EnemyProjectile_BombTorizoChozoBreaking_Falling),
    %instList(UNUSED_InstList_EnemyProjectile_BombTorizo_86A49E),
    %radius(0, 0),
    %properties($3000),
    %hitList(0),
    %shotList(InstList_EnemyProjectile_Delete))
endif ; !FEATURE_KEEP_UNREFERENCED

EnemyProjectile_BombTorizoExplosiveSwipe:
    %EnemyProjectile(\
    %initAI(InitAI_EnemyProjectile_BombTorizoExplosiveSwipe),
    %preInst(RTS_86A919),
    %instList(InstList_EnemyProjectile_BombTorizoExplosionSwipe),
    %radius($10, $10),
    %properties($500A),
    %hitList(0),
    %shotList(InstList_EnemyProjectile_Delete))

EnemyProjectile_BombTorizoStatueBreaking:
    %EnemyProjectile(\
    %initAI(InitAI_EnemyProj_BombTorizoChozoBreaking),
    %preInst(RTS_8684FB),
    %instList(InstList_EnemyProjectile_BombTorizoChozoBreaking_Index10),
    %radius(8, 8),
    %properties($3000),
    %hitList(0),
    %shotList(InstList_EnemyProjectile_Delete))

EnemyProjectile_BombTorizoLowHealthExplosion:
    %EnemyProjectile(\
    %initAI(InitAI_EnemyProjectile_BombTorizoLowHealthExplosion),
    %preInst(RTS_8684FB),
    %instList(InstList_EnemyProjectile_BombTorizoLowHealthExplosion_0),
    %radius(4, $10),
    %properties($3000),
    %hitList(0),
    %shotList(InstList_EnemyProjectile_Delete))

EnemyProjectile_BombTorizoDeathExplosion:
    %EnemyProjectile(\
    %initAI(InitAI_EnemyProjectile_TorizoDeathExplosion),
    %preInst(RTS_8684FB),
    %instList(InstList_EnemyProjectile_TorizoDeathExplosion_0),
    %radius(4, $10),
    %properties($3000),
    %hitList(0),
    %shotList(InstList_EnemyProjectile_Delete))


if !FEATURE_KEEP_UNREFERENCED
;;; $A9BD: Tiles ;;;
UNUSED_EnemyProjectile_Graphics_QuestionMark_86A9BD:
incbin "../data/Tiles_EnemyProj_QuestionMark.bin" ; $80 bytes


;;; $AA3D: Initialisation AI - enemy projectile $AB07 ;;;
UNUSED_InitAI_EnemyProjectile_QuestionMark_86AA3D:
;; Parameters:
;;     Y: Enemy projectile index
    LDX.W VRAMWriteStack
    LDA.W #$0040 : STA.B VRAMWrite.size,X
    LDA.W #UNUSED_EnemyProjectile_Graphics_QuestionMark_86A9BD : STA.B VRAMWrite.src,X
    LDA.W #$0086 : STA.B VRAMWrite.src+2,X
    LDA.W #$6E00 : STA.B VRAMWrite.dest,X
    TXA : CLC : ADC.W #$0007 : STA.W VRAMWriteStack
    LDX.W VRAMWriteStack ; >.< TAX
    LDA.W #$0040 : STA.B VRAMWrite.size,X
    LDA.W #UNUSED_EnemyProjectile_Graphics_QuestionMark_86A9BD+$40 : STA.B VRAMWrite.src,X
    LDA.W #UNUSED_EnemyProjectile_Graphics_QuestionMark_86A9BD>>16 : STA.B VRAMWrite.src+2,X
    LDA.W #$6F00 : STA.B VRAMWrite.dest,X
    TXA : CLC : ADC.W #$0007 : STA.W VRAMWriteStack
    LDA.W SamusXPosition : STA.W EnemyProjectile_XPositions,Y
    LDA.W SamusYPosition : SEC : SBC.W #$0024 : STA.W EnemyProjectile_YPositions,Y
    RTS


;;; $AA8C: Pre-instruction - enemy projectile $AB07 ;;;
UNUSED_PreInstruction_EnemyProjectile_QuestionMark:
;; Parameters:
;;     X: Enemy projectile index

; The `BPL + : DEC $14 : +` should really be done *before* the `ASL #3` >_<;
; Oh well
    STZ.B DP_Temp12 : STZ.B DP_Temp14
    LDA.W SamusXPosition : SEC : SBC.W EnemyProjectile_XPositions,X : ASL #3 : BPL +
    DEC.B DP_Temp14

+   STA.B DP_Temp13
    LDA.B DP_Temp12 : CLC : ADC.W EnemyProjectile_XSubPositions,X : STA.W EnemyProjectile_XSubPositions,X
    LDA.B DP_Temp14 : ADC.W EnemyProjectile_XPositions,X : STA.W EnemyProjectile_XPositions,X
    STZ.B DP_Temp12 : STZ.B DP_Temp14
    LDA.W SamusYPosition : SEC : SBC.W #$0024 : SEC : SBC.W EnemyProjectile_YPositions,X
    ASL #3 : BPL +
    DEC.B DP_Temp14

+   STA.B DP_Temp13
    LDA.B DP_Temp12 : CLC : ADC.W EnemyProjectile_YSubPositions,X : STA.W EnemyProjectile_YSubPositions,X
    LDA.B DP_Temp14 : ADC.W EnemyProjectile_YPositions,X : STA.W EnemyProjectile_YPositions,X
    RTS


;;; $AADB: Instruction list - enemy projectile $AB07 ;;;
UNUSED_InstList_EnemyProjectile_QuestionMark_0_86AADB:
    dw Instruction_EnemyProjectile_QueueSoundInY_Lib3_Max6 : db $09
    dw $012C,UNUSED_EnemyProjSpritemaps_QuestionMark_8D8C4D
    dw Instruction_EnemyProjectile_TimerInY,$0018

UNUSED_InstList_EnemyProjectile_QuestionMark_1_86AAE6:
    dw $0002,UNUSED_EnemyProjSpritemaps_QuestionMark_8D8C4D
    dw $0002,EnemyProjSpritemaps_Blank_Default
    dw Instruction_EnemyProjectile_DecrementTimer_GotoYIfNonZero
    dw UNUSED_InstList_EnemyProjectile_QuestionMark_1_86AAE6


;;; $AAF2: Shot instruction list - enemy projectile $AB07 ;;;
UNUSED_InstList_EnemyProjectile_Shot_QuestionMark_86AAF2:
    dw Instruction_EnemyProjectile_QueueSoundInY_Lib2_Max6 : db $0D
    dw $0008,EnemyProjSpritemaps_Common_Smoke_0
    dw $0008,EnemyProjSpritemaps_Common_Smoke_1
    dw $0008,EnemyProjSpritemaps_Common_Smoke_2
    dw $0008,EnemyProjSpritemaps_Common_Smoke_3
    dw Instruction_EnemyProjectile_Delete


;;; $AB07: Unused. Enemy projectile $AB07 ;;;
UNUSED_EnemyProjectile_QuestionMark_86AB07:
    %EnemyProjectile(\
    %initAI(UNUSED_InitAI_EnemyProjectile_QuestionMark_86AA3D),
    %preInst(UNUSED_PreInstruction_EnemyProjectile_QuestionMark),
    %instList(UNUSED_InstList_EnemyProjectile_QuestionMark_0_86AADB),
    %radius(0, 0),
    %properties($B000),
    %hitList(0),
    %shotList(UNUSED_InstList_EnemyProjectile_Shot_QuestionMark_86AAF2))
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $AB15: Instruction list - torizo chozo orbs - leftwards ;;;
InstList_EnemyProjectile_TorizoChozoOrbs_Left:
    dw $0055,EnemyProjSpritemaps_TorizoChozoOrbs_0
    dw Instruction_EnemyProjectile_GotoY
    dw InstList_EnemyProjectile_TorizoChozoOrbs_Left


;;; $AB1D: Instruction list - torizo chozo orbs - rightwards ;;;
InstList_EnemyProjectile_TorizoChozoOrbs_Right:
    dw $0055,EnemyProjSpritemaps_TorizoChozoOrbs_1
    dw Instruction_EnemyProjectile_GotoY
    dw InstList_EnemyProjectile_TorizoChozoOrbs_Right


;;; $AB25: Instruction list - torizo chozo orbs - break on wall / shot instruction list - enemy projectile $B1C0 (Golden Torizo egg) ;;;
InstList_EnemyProjectile_TorizoChozoOrbs_BreakOnWall:
    dw Instruction_EnemyProjectile_ClearPreInstruction
    dw Instruction_EnemyProjectile_Properties_OrY,$5000
    dw $0004,EnemyProjSpritemaps_Common_0
    dw $0004,EnemyProjSpritemaps_Common_1
    dw $0004,EnemyProjSpritemaps_Common_2
    dw $0004,EnemyProjSpritemaps_Common_3
    dw $0004,EnemyProjSpritemaps_Common_4
    dw Instruction_EnemyProjectile_Delete


;;; $AB41: Instruction list - torizo chozo orbs - break on floor ;;;
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


;;; $AB68: Shot instruction list - enemy projectile $AD5E/$AD6C/$AD7A (torizo chozo orbs) ;;;
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


;;; $AB8A: Instruction - spawn enemy drops with enemy [[Y]] or enemy [[Y] + 2]'s drop chances ;;;
Instruction_EnemyProjectile_SpawnEnemyDropsWIthYDropChances:
;; Parameters:
;;     X: Enemy projectile index
;;     Y: Pointer to instruction arguments
;; Returns:
;;     Y: Pointer to next instruction
    PHY : PHX
    LDA.W EnemyProjectile_XPositions,X : STA.B DP_Temp12
    LDA.W EnemyProjectile_YPositions,X : STA.B DP_Temp14
    LDA.W AreaIndex : BEQ .crateria
    LDA.W $0002,Y
    BRA .spawnDrops

  .crateria:
    LDA.W $0000,Y

  .spawnDrops:
    JSL Spawn_Enemy_Drops
    PLX : PLY
    INY #4
    RTS


;;; $ABAE: Torizo chozo orbs / egg / eye beam common initialisation ;;;
InitAI_EnemyProjectile_TorizoChozoOrbs_Egg_EyeBeam_Common:
;; Parameters:
;;     X: Pointer to constants (see $AC08/$AC99)
;;     Y: Enemy projectile index
;;     $12: Enemy X position
;;     $14: Enemy Y position
    LDA.W $0000,X : STA.W EnemyProjectile_InstListPointers,Y
    LDA.B DP_Temp12 : CLC : ADC.W $0002,X : STA.W EnemyProjectile_XPositions,Y
    JSL GenerateRandomNumber
    AND.W #$00FF : SEC : SBC.W #$0080
    CLC : ADC.W $0004,X : STA.W EnemyProjectile_XVelocity,Y
    LDA.B DP_Temp14 : CLC : ADC.W $0006,X : STA.W EnemyProjectile_YPositions,Y
    JSL GenerateRandomNumber
    AND.W #$00FF : SEC : SBC.W #$0080
    CLC : ADC.W $0008,X : STA.W EnemyProjectile_YVelocity,Y
    RTS


;;; $ABEB: Initialisation AI - enemy projectile $AD5E/$AD6C (Bomb Torizo's chozo orbs) ;;;
InitAI_EnemyProjectile_BombTorizoChozoOrbs:
;; Parameters:
;;     Y: Enemy projectile index
    LDX.W EnemyIndex
    LDA.W Enemy.XPosition,X : STA.B DP_Temp12
    LDA.W Enemy.YPosition,X : STA.B DP_Temp14 : BIT.W Enemy.init0,X : BMI .facingRight
    LDX.W #.left
    BRA .gotoCommon

  .facingRight:
    LDX.W #.right

  .gotoCommon:
    JMP InitAI_EnemyProjectile_TorizoChozoOrbs_Egg_EyeBeam_Common

;        _____________________ Instruction list pointer
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
;;; $AC1C: Unused. Initialise torizo chozo orb to target Samus ;;;
UNUSED_InitializeTorizoChozoOrbToTargetSamus:
;; Parameters:
;;     Y: Enemy projectile index
    JSL GenerateRandomNumber
    LDX.W EnemyIndex
    JSL CalculateAngleOfSamusFromEnemy
    STA.B DP_Temp12
    LDA.W RandomNumberSeed : AND.W #$000F
    SEC : SBC.W #$0008 : CLC : ADC.B DP_Temp12 : ASL : TAX
    LDA.L SineCosineTables_8bitSine_SignExtended,X : ASL : STA.W EnemyProjectile_XVelocity,Y
    LDA.L SineCosineTables_NegativeCosine_SignExtended,X : ASL : STA.W EnemyProjectile_YVelocity,Y
    LDX.W EnemyIndex
    LDA.W Enemy.YPosition,X : CLC : ADC.W #$FFD8 : STA.W EnemyProjectile_YPositions,Y
    BIT.W Enemy.init0,X : BMI .facingRight
    LDA.W Enemy.XPosition,X : CLC : ADC.W #$FFE5 : STA.W EnemyProjectile_XPositions,Y
    LDA.W #InstList_EnemyProjectile_TorizoChozoOrbs_Left : STA.W EnemyProjectile_InstListPointers,Y
    RTS

  .facingRight:
    LDA.W Enemy.XPosition,X : CLC : ADC.W #$001B : STA.W EnemyProjectile_XPositions,Y
    LDA.W #InstList_EnemyProjectile_TorizoChozoOrbs_Right : STA.W EnemyProjectile_InstListPointers,Y
    RTS
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $AC7C: Initialisation AI - enemy projectile $AD7A (Golden Torizo's chozo orbs) ;;;
InitAI_EnemyProjectile_GoldenTorizosChozoOrbs:
;; Parameters:
;;     Y: Enemy projectile index
    LDX.W EnemyIndex
    LDA.W Enemy.XPosition,X : STA.B DP_Temp12
    LDA.W Enemy.YPosition,X : STA.B DP_Temp14 : BIT.W Enemy.init0,X : BMI .facingRight
    LDX.W #.left
    BRA .gotoCommon

  .facingRight:
    LDX.W #.right

  .gotoCommon:
    JMP InitAI_EnemyProjectile_TorizoChozoOrbs_Egg_EyeBeam_Common

;        _____________________ Instruction list pointer
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


;;; $ACAD: Pre-instruction - enemy projectile $AD5E/$AD6C (Bomb Torizo's chozo orbs) ;;;
PreInstruction_EnemyProjectile_BombTorizosChozoOrbs:
;; Parameters:
;;     X: Enemy projectile index
    JSR Move_EnemyProjectile_Horizontally
    BCS .hitWall
    JSR Move_EnemyProjectile_Vertically
    BIT.W EnemyProjectile_YVelocity,X : BMI .greaterThanZero
    BCS .hitFloor

  .greaterThanZero:
    LDA.W EnemyProjectile_YVelocity,X : CLC : ADC.W #$0012 : STA.W EnemyProjectile_YVelocity,X
    AND.W #$F000 : CMP.W #$1000 : BNE .return
    STZ.W EnemyProjectile_ID,X

  .return:
    RTS

  .hitWall:
    LDA.W #InstList_EnemyProjectile_TorizoChozoOrbs_BreakOnWall : STA.W EnemyProjectile_InstListPointers,X
    LDA.W #$0001 : STA.W EnemyProjectile_InstructionTimers,X
    RTS

  .hitFloor:
    LDA.W EnemyProjectile_YPositions,X : AND.W #$FFF0 : ORA.W #$0008
    DEC #2 : STA.W EnemyProjectile_YPositions,X
    LDA.W #InstList_EnemyProjectile_TorizoChozoOrbs_BreakOnFloor : STA.W EnemyProjectile_InstListPointers,X
    LDA.W #$0001 : STA.W EnemyProjectile_InstructionTimers,X
    RTS


;;; $ACFA: Pre-instruction - enemy projectile $AD7A (Golden Torizo's chozo orbs) ;;;
PreInstruction_EnemyProjectile_GoldenTorizosChozoOrbs:
;; Parameters:
;;     X: Enemy projectile index
    JSR Move_EnemyProjectile_Horizontally
    BCC .noCollision
    LDA.W EnemyProjectile_XVelocity,X : EOR.W #$FFFF : INC : STA.W EnemyProjectile_XVelocity,X

  .noCollision:
    JSR Move_EnemyProjectile_Vertically
    BCC .bounceEnd
    BIT.W EnemyProjectile_YVelocity,X : BMI .bounceEnd
    LDA.W EnemyProjectile_XVelocity,X : BPL .subtract40
    CLC : ADC.W #$0040
    BRA +

  .subtract40:
    SEC : SBC.W #$0040

+   STA.W EnemyProjectile_XVelocity,X
    LDA.W EnemyProjectile_YVelocity,X : LSR : EOR.W #$FFFF : INC : STA.W EnemyProjectile_YVelocity,X
    AND.W #$FF80 : CMP.W #$FF80 : BEQ .break

  .bounceEnd:
    LDA.W EnemyProjectile_YVelocity,X : CLC : ADC.W #$0018 : STA.W EnemyProjectile_YVelocity,X
    RTS

  .break:
    LDA.W EnemyProjectile_YPositions,X : AND.W #$FFF0 : ORA.W #$0008
    DEC #2 : STA.W EnemyProjectile_YPositions,X
    LDA.W #InstList_EnemyProjectile_TorizoChozoOrbs_BreakOnFloor : STA.W EnemyProjectile_InstListPointers,X
    LDA.W #$0001 : STA.W EnemyProjectile_InstructionTimers,X
    RTS


;;; $AD5E: Enemy projectiles - torizo chozo orbs ;;;
EnemyProjectile_BombTorizoChozoOrbs:
    %EnemyProjectile(\
    %initAI(InitAI_EnemyProjectile_BombTorizoChozoOrbs),
    %preInst(PreInstruction_EnemyProjectile_BombTorizosChozoOrbs),
    %instList(InstList_EnemyProjectile_TorizoChozoOrbs_Left),
    %radius(7, 7),
    %properties($9008),
    %hitList(0),
    %shotList(InstList_EnemyProjectile_Shot_TorizoChozoOrbs))

EnemyProjectile_BombTorizoChozoOrbsHigherDamage:
    %EnemyProjectile(\
    %initAI(InitAI_EnemyProjectile_BombTorizoChozoOrbs),
    %preInst(PreInstruction_EnemyProjectile_BombTorizosChozoOrbs),
    %instList(InstList_EnemyProjectile_TorizoChozoOrbs_Left),
    %radius(7, 7),
    %properties($900A),
    %hitList(0),
    %shotList(InstList_EnemyProjectile_Shot_TorizoChozoOrbs))

EnemyProjectile_GoldenTorizoChozoOrbs:
    %EnemyProjectile(\
    %initAI(InitAI_EnemyProjectile_GoldenTorizosChozoOrbs),
    %preInst(PreInstruction_EnemyProjectile_GoldenTorizosChozoOrbs),
    %instList(InstList_EnemyProjectile_TorizoChozoOrbs_Left),
    %radius(7, 7),
    %properties($B050),
    %hitList(0),
    %shotList(InstList_EnemyProjectile_Shot_TorizoChozoOrbs))


if !FEATURE_KEEP_UNREFERENCED
;;; $AD88: Unused. Instruction list ;;;
UNUSED_InstList_EnemyProjectile_86AD88:
    dw Instruction_EnemyProjectile_PreInstructionInY
    dw PreInstruction_EnemyProjectile_TorizoSonicBoom
    dw UNUSED_Instruction_EnemyProj_MoveHorizontally_GotoY_86AD92
    dw InstList_EnemyProjectile_TorizoSonicBoom_MovingLeft
    dw InstList_EnemyProjectile_TorizoSonicBoom_MovingRight


;;; $AD92: Instruction - move horizontally and go to [[Y]] or [[Y] + 2] ;;;
UNUSED_Instruction_EnemyProj_MoveHorizontally_GotoY_86AD92:
;; Parameters:
;;     X: Enemy projectile index
;;     Y: Pointer to instruction arguments
;; Returns:
;;     Y: Pointer to next instruction

; Used by UNUSED_InstList_EnemyProjectile_86AD88
    STZ.B DP_Temp12 : STZ.B DP_Temp14
    LDA.W EnemyProjectile_XVelocity,X : BPL +
    DEC.B DP_Temp14

+   STA.B DP_Temp13
    LDA.W EnemyProjectile_XSubPositions,X : CLC : ADC.B DP_Temp12 : STA.W EnemyProjectile_XSubPositions,X
    LDA.W EnemyProjectile_XPositions,X : ADC.B DP_Temp14 : STA.W EnemyProjectile_XPositions,X
    LDA.W EnemyProjectile_XVelocity,X : BPL .greaterThan0
    LDA.W $0000,Y : TAY
    RTS

  .greaterThan0:
    LDA.W $0002,Y : TAY
    RTS
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $ADBF: Instruction list - torizo sonic boom - fired leftwards ;;;
InstList_EnemyProjectile_TorizoSonicBoom_FiredLeft:
    dw Instruction_EnemyProjectile_QueueSoundInY_Lib2_Max6 : db $48
    dw $0006,EnemyProjSpritemaps_TorizoSonicBoom_0
    dw $0006,EnemyProjSpritemaps_TorizoSonicBoom_1


;;; $ADCA: Instruction list - torizo sonic boom - moving leftwards ;;;
InstList_EnemyProjectile_TorizoSonicBoom_MovingLeft:
    dw $0050,EnemyProjSpritemaps_TorizoSonicBoom_2
    dw Instruction_EnemyProjectile_GotoY
    dw InstList_EnemyProjectile_TorizoSonicBoom_MovingLeft


;;; $ADD2: Instruction list - torizo sonic boom - fired rightwards ;;;
InstList_EnemyProjectile_TorizoSonicBoom_FiredRight:
    dw Instruction_EnemyProjectile_QueueSoundInY_Lib2_Max6 : db $48
    dw $0006,EnemyProjSpritemaps_TorizoSonicBoom_3
    dw $0006,EnemyProjSpritemaps_TorizoSonicBoom_4


;;; $ADDD: Instruction list - torizo sonic boom - moving rightwards ;;;
InstList_EnemyProjectile_TorizoSonicBoom_MovingRight:
    dw $0050,EnemyProjSpritemaps_TorizoSonicBoom_5
    dw Instruction_EnemyProjectile_GotoY
    dw InstList_EnemyProjectile_TorizoSonicBoom_MovingRight


;;; $ADE5: Instruction list - torizo sonic boom - hit wall ;;;
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


;;; $AE15: Initialisation AI - enemy projectile $AEA8/$AEB6 (torizo sonic boom) ;;;
InitAI_EnemyProjectile_TorizoSonicBoom:
;; Parameters:
;;     Y: Enemy projectile index
    JSL GenerateRandomNumber
    LDX.W EnemyIndex
    LDA.W RandomNumberSeed : AND.W #$0001 : BEQ .A14
    LDA.W #$FFF4
    BRA +

  .A14:
    LDA.W #$0014

+   CLC : ADC.W Enemy.YPosition,X : STA.W EnemyProjectile_YPositions,Y
    LDA.W #$0000 : STA.W EnemyProjectile_YVelocity,Y
    BIT.W Enemy.init0,X : BMI .facingRight
    LDA.W Enemy.XPosition,X : CLC : ADC.W #$FFE0 : STA.W EnemyProjectile_XPositions,Y
    LDA.W #$FD90 : STA.W EnemyProjectile_XVelocity,Y
    LDA.W #InstList_EnemyProjectile_TorizoSonicBoom_FiredLeft : STA.W EnemyProjectile_InstListPointers,Y
    RTS

  .facingRight:
    LDA.W Enemy.XPosition,X : CLC : ADC.W #$0020 : STA.W EnemyProjectile_XPositions,Y
    LDA.W #$0270 : STA.W EnemyProjectile_XVelocity,Y
    LDA.W #InstList_EnemyProjectile_TorizoSonicBoom_FiredRight : STA.W EnemyProjectile_InstListPointers,Y
    RTS


;;; $AE6C: Pre-instruction - enemy projectile $AEA8/$AEB6 (torizo sonic boom) ;;;
PreInstruction_EnemyProjectile_TorizoSonicBoom:
;; Parameters:
;;     X: Enemy projectile index
    JSR Move_EnemyProjectile_Horizontally
    BCS .hitWall
    LDA.W EnemyProjectile_XVelocity,X : BMI .subtract10
    CLC : ADC.W #$0010
    BRA +

  .subtract10:
    SEC : SBC.W #$0010

+   STA.W EnemyProjectile_XVelocity,X
    AND.W #$F000 : CMP.W #$1000 : BNE .return
    STZ.W EnemyProjectile_ID,X

  .return:
    RTS

  .hitWall:
    LDA.W #InstList_EnemyProjectile_TorizoSonicBoom_HitWall_0 : STA.W EnemyProjectile_InstListPointers,X
    LDA.W #$0001 : STA.W EnemyProjectile_InstructionTimers,X
    LDA.W EnemyProjectile_XPositions,X : STA.W EnemyProjectile_Var0,X
    LDA.W EnemyProjectile_YPositions,X : STA.W EnemyProjectile_Var1,X
    RTS


;;; $AEA8: Enemy projectiles - torizo sonic boom ;;;
EnemyProjectile_BombTorizoSonicBoom:
    %EnemyProjectile(\
    %initAI(InitAI_EnemyProjectile_TorizoSonicBoom),
    %preInst(PreInstruction_EnemyProjectile_TorizoSonicBoom),
    %instList(InstList_EnemyProjectile_TorizoSonicBoom_FiredLeft),
    %radius(3, $14),
    %properties($100A),
    %hitList(0),
    %shotList(InstList_EnemyProjectile_Delete))

EnemyProjectile_GoldenTorizoSonicBoom:
    %EnemyProjectile(\
    %initAI(InitAI_EnemyProjectile_TorizoSonicBoom),
    %preInst(PreInstruction_EnemyProjectile_TorizoSonicBoom),
    %instList(InstList_EnemyProjectile_TorizoSonicBoom_FiredLeft),
    %radius(3, $14),
    %properties($1078),
    %hitList(0),
    %shotList(InstList_EnemyProjectile_Delete))


;;; $AEC4: Instruction list - enemy projectile $AF68 (Wrecked Ship chozo spike clearing footsteps) ;;;
InstList_EnemyProj_WreckedShipChozoSpikeClearingFootsteps:
    dw Instruction_MoveRandomlyWithinXRadius_YRadius
    db $0F,$00,$0F,$03
    dw $0002,EnemyProjSpritemaps_Common_BigDustCloud_0
    dw $0002,EnemyProjSpritemaps_Common_BigDustCloud_1
    dw $0002,EnemyProjSpritemaps_Common_BigDustCloud_2
    dw $0002,EnemyProjSpritemaps_Common_BigDustCloud_3
    dw Instruction_EnemyProjectile_Delete


if !FEATURE_KEEP_UNREFERENCED
;;; $AEDC: Instruction list - enemy projectile $AF76 (unused. Spike clearing explosions) ;;;
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


;;; $AEFC: Initialisation AI - enemy projectile $AF68/$AF76 (Wrecked Ship chozo spike clearing footsteps / spike clearing explosions) ;;;
InitAI_EnemyProj_WreckedShipChozoSpikeClearingFootsteps:
;; Parameters:
;;     Y: Enemy projectile index
;;     EnemyProjectile_InitParam0: X offset
    LDX.W EnemyIndex
    LDA.W Enemy.XPosition,X : CLC : ADC.W EnemyProjectile_InitParam0 : STA.W EnemyProjectile_XPositions,Y
    LDA.W Enemy.YPosition,X : CLC : ADC.W #$001C : STA.W EnemyProjectile_YPositions,Y
    RTS


;;; $AF14: Instruction list - enemy projectile $AF84 (Tourian entrance statue dust clouds) ;;;
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


;;; $AF36: Instruction - reset position ;;;
Instruction_EnemyProjectile_ResetPosition:
;; Parameters:
;;     X: Enemy projectile index

; Clone of Instruction_EnemyProjectile_Torizo_ResetPosition
    LDA.W EnemyProjectile_Var0,X : STA.W EnemyProjectile_XPositions,X
    LDA.W EnemyProjectile_Var1,X : STA.W EnemyProjectile_YPositions,X
    RTS


;;; $AF43: Initialisation AI - enemy projectile $AF84 (Tourian entrance statue dust clouds) ;;;
InitAI_EnemyProjectile_TourianStatueDustClouds:
;; Parameters:
;;     Y: Enemy projectile index
    LDA.W #$0080 : STA.W EnemyProjectile_Var0,Y
    LDA.W #$00BC : STA.W EnemyProjectile_Var1,Y
    RTS


;;; $AF50: Initialisation AI - enemy projectile $AFE5 (Torizo landing dust cloud - right foot) ;;;
InitAI_EnemyProjectile_TorizoLandingDustCloud_RightFoot:
;; Parameters:
;;     Y: Enemy projectile index
    LDX.W EnemyIndex
    LDA.W Enemy.YPosition,X : CLC : ADC.W #$0030 : STA.W EnemyProjectile_YPositions,Y
    LDA.W Enemy.XPosition,X : CLC : ADC.W #$0018 : STA.W EnemyProjectile_XPositions,Y
    RTS


;;; $AF68: Enemy projectiles ;;;
EnemyProjectile_WreckedShipChozoSpikeClearingFootsteps:
    %EnemyProjectile(\
    %initAI(InitAI_EnemyProj_WreckedShipChozoSpikeClearingFootsteps),
    %preInst(RTS_8684FB),
    %instList(InstList_EnemyProj_WreckedShipChozoSpikeClearingFootsteps),
    %radius(0, 0),
    %properties($3000),
    %hitList(0),
    %shotList(InstList_EnemyProjectile_Delete))

if !FEATURE_KEEP_UNREFERENCED
UNUSED_EnemyProjectile_SpikeClearingExplosions_86AF76:
    %EnemyProjectile(\
    %initAI(InitAI_EnemyProj_WreckedShipChozoSpikeClearingFootsteps),
    %preInst(RTS_8684FB),
    %instList(UNUSED_InstList_EnemyProj_SpikeClearingExplosions_86AEDC),
    %radius(0, 0),
    %properties($3000),
    %hitList(0),
    %shotList(InstList_EnemyProjectile_Delete))
endif ; !FEATURE_KEEP_UNREFERENCED

EnemyProjectile_TourianStatueDustClouds:
    %EnemyProjectile(\
    %initAI(InitAI_EnemyProjectile_TourianStatueDustClouds),
    %preInst(RTS_8684FB),
    %instList(InstList_EnemyProj_TourianStatueDustClouds_0),
    %radius(0, 0),
    %properties($3000),
    %hitList(0),
    %shotList(InstList_EnemyProjectile_Delete))


;;; $AF92: Instruction - enemy projectile Y position -= 4 ;;;
Instruction_EnemyProjectile_TorizoLandingDustClouds:
;; Parameters:
;;     X: Enemy projectile index
    LDA.W EnemyProjectile_YPositions,X : SEC : SBC.W #$0004 : STA.W EnemyProjectile_YPositions,X
    RTS


;;; $AF9D: Instruction list - enemy projectile $AFE5 (Torizo landing dust cloud - right foot) ;;;
InstList_EnemyProjectile_TorizoLandingDustCloud_RightFoot:
    dw $0004,EnemyProjSpritemaps_TorizoLandingDustCloud_Right_0
    dw Instruction_EnemyProjectile_TorizoLandingDustClouds
    dw $0004,EnemyProjSpritemaps_TorizoLandingDustCloud_Right_1
    dw Instruction_EnemyProjectile_TorizoLandingDustClouds
    dw $0004,EnemyProjSpritemaps_TorizoLandingDustCloud_Right_2
    dw Instruction_EnemyProjectile_TorizoLandingDustClouds
    dw $0004,EnemyProjSpritemaps_TorizoLandingDustCloud_Right_3
    dw Instruction_EnemyProjectile_Delete


;;; $AFB5: Instruction list - enemy projectile $AFF3 (Torizo landing dust cloud - left foot) ;;;
InstList_EnemyProjectile_TorizoLandingDustCloud_LeftFoot:
    dw $0004,EnemyProjSpritemaps_TorizoLandingDustCloud_Left_0
    dw Instruction_EnemyProjectile_TorizoLandingDustClouds
    dw $0004,EnemyProjSpritemaps_TorizoLandingDustCloud_Left_1
    dw Instruction_EnemyProjectile_TorizoLandingDustClouds
    dw $0004,EnemyProjSpritemaps_TorizoLandingDustCloud_Left_2
    dw Instruction_EnemyProjectile_TorizoLandingDustClouds
    dw $0004,EnemyProjSpritemaps_TorizoLandingDustCloud_Left_3
    dw Instruction_EnemyProjectile_Delete


;;; $AFCD: Initialisation AI - enemy projectile $AFF3 (Torizo landing dust cloud - left foot) ;;;
InitAI_EnemyProjectile_TorizoLandingDustCloud_LeftFoot:
;; Parameters:
;;     Y: Enemy projectile index
    LDX.W EnemyIndex
    LDA.W Enemy.YPosition,X : CLC : ADC.W #$0030 : STA.W EnemyProjectile_YPositions,Y
    LDA.W Enemy.XPosition,X : SEC : SBC.W #$0018 : STA.W EnemyProjectile_XPositions,Y
    RTS


;;; $AFE5: Enemy projectiles - torizo landing dust cloud ;;;
EnemyProjectile_TorizoLandingDustCloud_RightFoot:
    %EnemyProjectile(\
    %initAI(InitAI_EnemyProjectile_TorizoLandingDustCloud_RightFoot),
    %preInst(RTS_8684FB),
    %instList(InstList_EnemyProjectile_TorizoLandingDustCloud_RightFoot),
    %radius(0, 0),
    %properties($3000),
    %hitList(0),
    %shotList(InstList_EnemyProjectile_Delete))

EnemyProjectile_TorizoLandingDustCloud_LeftFoot:
    %EnemyProjectile(\
    %initAI(InitAI_EnemyProjectile_TorizoLandingDustCloud_LeftFoot),
    %preInst(RTS_8684FB),
    %instList(InstList_EnemyProjectile_TorizoLandingDustCloud_LeftFoot),
    %radius(0, 0),
    %properties($3000),
    %hitList(0),
    %shotList(InstList_EnemyProjectile_Delete))


;;; $B001: Initialisation AI - enemy projectile $B1C0 (Golden Torizo egg) ;;;
InitAI_EnemyProjectile_GoldenTorizoEgg:
;; Parameters:
;;     Y: Enemy projectile index
    LDX.W EnemyIndex
    LDA.W Enemy.XPosition,X : STA.B DP_Temp12
    LDA.W Enemy.YPosition,X : STA.B DP_Temp14
    LDA.L GenerateRandomNumber ; >_<
    AND.W #$001F : CLC : ADC.W #$0040 : STA.W EnemyProjectile_Var1,Y
    LDA.W Enemy.init0,X : STA.W EnemyProjectile_Var0,Y : BMI .right
    LDX.W #.leftwards
    BRA .gotoCommon

  .right:
    LDX.W #.rightwards

  .gotoCommon:
    JMP InitAI_EnemyProjectile_TorizoChozoOrbs_Egg_EyeBeam_Common

;        _____________________ Instruction list pointer
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


;;; $B043: Pre-instruction - Golden Torizo egg - bouncing ;;;
PreInstruction_EnemyProjectile_GoldenTorizoEgg_Bouncing:
;; Parameters:
;;     X: Enemy projectile index
    DEC.W EnemyProjectile_Var1,X : BMI .hatch
    JSR Move_EnemyProjectile_Horizontally
    BCC .moveVertically
    LDA.W EnemyProjectile_XVelocity,X : EOR.W #$FFFF : INC : STA.W EnemyProjectile_XVelocity,X
    LDA.W EnemyProjectile_Var0,X : EOR.W #$8000 : STA.W EnemyProjectile_Var0,X

  .moveVertically:
    JSR Move_EnemyProjectile_Vertically
    BCC .bounceEnd
    BIT.W EnemyProjectile_YVelocity,X : BMI .bounceEnd
    LDA.W EnemyProjectile_XVelocity,X : BPL .subtract20
    CLC : ADC.W #$0020
    BRA +

  .subtract20:
    SEC : SBC.W #$0020

+   STA.W EnemyProjectile_XVelocity,X
    LDA.W EnemyProjectile_YVelocity,X : EOR.W #$FFFF : INC : STA.W EnemyProjectile_YVelocity,X

  .bounceEnd:
    LDA.W EnemyProjectile_YVelocity,X : CLC : ADC.W #$0030 : STA.W EnemyProjectile_YVelocity,X
    AND.W #$F000 : CMP.W #$1000 : BNE .return
    STZ.W EnemyProjectile_ID,X

  .return:
    RTS

  .hatch:
    INC.W EnemyProjectile_InstListPointers,X : INC.W EnemyProjectile_InstListPointers,X
    LDA.W #$0001 : STA.W EnemyProjectile_InstructionTimers,X
    BIT.W EnemyProjectile_Var0,X : BMI .rightwards
    LDA.W #$FF00
    BRA +

  .rightwards:
    LDA.W #$0100

+   STA.W EnemyProjectile_XVelocity,X
    RTS


;;; $B0B9: Pre-instruction - Golden Torizo egg - hatched ;;;
PreInstruction_EnemyProjectile_GoldenTorizoEgg_Hatched:
;; Parameters:
;;     X: Enemy projectile index
    JSR Move_EnemyProjectile_Horizontally
    BCS .hitWall
    BIT.W EnemyProjectile_Var0,X : BMI .rightwards
    LDA.W #$FFD0
    BRA +

  .rightwards:
    LDA.W #$0030

+   CLC : ADC.W EnemyProjectile_XVelocity,X : STA.W EnemyProjectile_XVelocity,X
    RTS

  .hitWall:
    LDA.W #PreInstruction_EnemyProjectile_GoldenTorizoEgg_HitWall : STA.W EnemyProjectile_PreInstructions,X
    STZ.W EnemyProjectile_YVelocity,X
    RTS


;;; $B0DD: Pre-instruction - Golden Torizo egg - hit wall ;;;
PreInstruction_EnemyProjectile_GoldenTorizoEgg_HitWall:
;; Parameters:
;;     X: Enemy projectile index
    JSR Move_EnemyProjectile_Vertically
    BCS .collision
    LDA.W #$0030 : CLC : ADC.W EnemyProjectile_YVelocity,X : STA.W EnemyProjectile_YVelocity,X
    RTS

  .collision:
    BIT.W EnemyProjectile_Var0,X : BMI .rightwards
    LDA.W #InstList_EnemyProjectile_GoldenTorizoEgg_Break_FacingLeft
    BRA +

  .rightwards:
    LDA.W #InstList_EnemyProjectile_GoldenTorizoEgg_Break_FacingRight

+   STA.W EnemyProjectile_InstListPointers,X
    LDA.W #$0001 : STA.W EnemyProjectile_InstructionTimers,X
    RTS


;;; $B104: Instruction list - Golden Torizo egg - bouncing - leftwards ;;;
InstList_EnemyProjectile_GoldenTorizoEgg_BouncingLeft:
    dw $0030,EnemyProjSpritemaps_GoldenTorizoEgg_0
    dw Instruction_EnemyProjectile_Sleep
    dw Instruction_EnemyProjectile_ClearPreInstruction
    dw $0004,EnemyProjSpritemaps_GoldenTorizoEgg_1
    dw $0004,EnemyProjSpritemaps_GoldenTorizoEgg_2
    dw $0004,EnemyProjSpritemaps_GoldenTorizoEgg_3
    dw Instruction_EnemyProjectile_GotoY
    dw InstList_EnemyProjectile_GoldenTorizoEgg_Hatch


;;; $B11C: Instruction list - Golden Torizo egg - bouncing - rightwards ;;;
InstList_EnemyProjectile_GoldenTorizoEgg_BouncingRight:
    dw $0030,EnemyProjSpritemaps_GoldenTorizoEgg_C
    dw Instruction_EnemyProjectile_Sleep
    dw Instruction_EnemyProjectile_ClearPreInstruction
    dw $0004,EnemyProjSpritemaps_GoldenTorizoEgg_D
    dw $0004,EnemyProjSpritemaps_GoldenTorizoEgg_E
    dw $0004,EnemyProjSpritemaps_GoldenTorizoEgg_F
    dw Instruction_EnemyProjectile_GotoY
    dw InstList_EnemyProjectile_GoldenTorizoEgg_Hatch


;;; $B134: Instruction list - Golden Torizo egg - hatch ;;;
InstList_EnemyProjectile_GoldenTorizoEgg_Hatch:
    dw Instruction_EnemyProjectile_Properties_AndY,$DFFF
    dw Instruction_EnemyProjectile_Properties_OrY,$8000
    dw Instruction_EnemyProjectile_GoldenTorizoEgg_GoToHatched


;;; $B13E: Instruction - go to hatched ;;;
Instruction_EnemyProjectile_GoldenTorizoEgg_GoToHatched:
;; Parameters:
;;     X: Enemy projectile index
;; Returns:
;;     Y: Pointer to next instruction
    BIT.W EnemyProjectile_Var0,X : BMI .rightwards
    LDY.W #InstList_EnemyProjectile_GoldenTorizoEgg_Hatched_Left_0
    RTS

  .rightwards:
    LDY.W #InstList_EnemyProjectile_GoldenTorizoEgg_Hatched_Right_0
    RTS


;;; $B14B: Instruction list - Golden Torizo egg - hatched - leftwards ;;;
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


;;; $B166: Instruction list - Golden Torizo egg - hatched - rightwards ;;;
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
;;; $B181: Unused. Instruction list - break ;;;
UNUSED_InstList_EnemyProjectile_Break_86B181:
    dw UNUSED_Instruction_EnemyProjectile_GotoBreak_86B183


;;; $B183: Unused. Instruction - go to break ;;;
UNUSED_Instruction_EnemyProjectile_GotoBreak_86B183:
;; Parameters:
;;     X: Enemy projectile index
;; Returns:
;;     Y: Pointer to next instruction

; Used by UNUSED_InstList_EnemyProjectile_Break_86B181
    LDA.W EnemyProjectile_Var0,X : BMI .facingRight
    LDY.W #InstList_EnemyProjectile_GoldenTorizoEgg_Break_FacingLeft
    RTS

  .facingRight:
    LDY.W #InstList_EnemyProjectile_GoldenTorizoEgg_Break_FacingRight
    RTS
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $B190: Instruction list - Golden Torizo egg - break - facing left ;;;
InstList_EnemyProjectile_GoldenTorizoEgg_Break_FacingLeft:
    dw Instruction_EnemyProjectile_ClearPreInstruction
    dw $0004,EnemyProjSpritemaps_GoldenTorizoEgg_7
    dw $0004,EnemyProjSpritemaps_GoldenTorizoEgg_8
    dw $0004,EnemyProjSpritemaps_GoldenTorizoEgg_9
    dw $0004,EnemyProjSpritemaps_GoldenTorizoEgg_A
    dw $000A,EnemyProjSpritemaps_GoldenTorizoEgg_B
    dw Instruction_EnemyProjectile_Delete


;;; $B1A8: Instruction list - Golden Torizo egg - break - facing right ;;;
InstList_EnemyProjectile_GoldenTorizoEgg_Break_FacingRight:
    dw Instruction_EnemyProjectile_ClearPreInstruction
    dw $0004,EnemyProjSpritemaps_GoldenTorizoEgg_13
    dw $0004,EnemyProjSpritemaps_GoldenTorizoEgg_14
    dw $0004,EnemyProjSpritemaps_GoldenTorizoEgg_15
    dw $0004,EnemyProjSpritemaps_GoldenTorizoEgg_16
    dw $0008,EnemyProjSpritemaps_GoldenTorizoEgg_17
    dw Instruction_EnemyProjectile_Delete


;;; $B1C0: Enemy projectile - Golden Torizo egg ;;;
EnemyProjectile_GoldenTorizoEgg:
    %EnemyProjectile(\
    %initAI(InitAI_EnemyProjectile_GoldenTorizoEgg),
    %preInst(PreInstruction_EnemyProjectile_GoldenTorizoEgg_Bouncing),
    %instList(InstList_EnemyProjectile_GoldenTorizoEgg_BouncingLeft),
    %radius(7, 7),
    %properties($6064),
    %hitList(0),
    %shotList(InstList_EnemyProjectile_TorizoChozoOrbs_BreakOnWall))


;;; $B1CE: Initialisation AI - enemy projectile $B31A (Golden Torizo super missile) ;;;
InitAI_EnemyProjectile_GoldenTorizoSuperMissile:
;; Parameters:
;;     Y: Enemy projectile index
    LDA.W EnemyIndex : STA.W EnemyProjectile_Var0,Y : TAX
    LDA.W Enemy.XPosition,X : STA.B DP_Temp12
    LDA.W Enemy.YPosition,X : STA.B DP_Temp14
    BIT.W Enemy.init0,X : BMI .facingRight
    LDX.W #$0000
    BRA +

  .facingRight:
    LDX.W #$0002

+   LDA.W .Xoffsets,X : CLC : ADC.B DP_Temp12 : STA.W EnemyProjectile_XPositions,Y
    LDA.W #$FFCC : CLC : ADC.B DP_Temp14 : STA.W EnemyProjectile_YPositions,Y
    LDA.W .InstListPointers,X : STA.W EnemyProjectile_InstListPointers,Y
    RTS

;        _________ Leftwards
;       |      ___ Rightwards
;       |     |
  .Xoffsets:
    dw $FFE2,$001E
  .InstListPointers:
    dw InstList_EnemyProj_GoldenTorizoSuperMissile_Leftwards_0
    dw InstList_EnemyProj_GoldenTorizoSuperMissile_Rightwards_0


;;; $B20D: Pre-instruction - Golden Torizo super missile - held ;;;
PreInstruction_EnemyProjectile_GoldenTorizoSuperMissile_Held:
;; Parameters:
;;     X: Enemy projectile index

; If Golden Torizo is killed, its Y position will be 0, so this projectile will teleport off-screen
    LDY.W EnemyProjectile_Var0,X
    LDA.W Enemy.XPosition,Y : STA.B DP_Temp12
    LDA.W Enemy.YPosition,Y : STA.B DP_Temp14
    LDA.W Enemy.init0,Y : BMI .facingRight
    LDA.W #$FFE0
    BRA +

  .facingRight:
    LDA.W #$0020

+   CLC : ADC.B DP_Temp12 : STA.W EnemyProjectile_XPositions,X
    LDA.W #$FFCC : CLC : ADC.B DP_Temp14 : STA.W EnemyProjectile_YPositions,X
    RTS


;;; $B237: Pre-instruction - Golden Torizo super missile - thrown ;;;
PreInst_EnemyProjectile_GoldenTorizoSuperMissile_Thrown:
;; Parameters:
;;     X: Enemy projectile index
    JSR Move_EnemyProjectile_Horizontally
    BCS .collision
    JSR Move_EnemyProjectile_Vertically
    BIT.W EnemyProjectile_YVelocity,X : BMI +
    BCS .collision

+   LDA.W EnemyProjectile_YVelocity,X : CLC : ADC.W #$0010 : STA.W EnemyProjectile_YVelocity,X
    AND.W #$F000 : CMP.W #$1000 : BNE .return
    STZ.W EnemyProjectile_ID,X

  .return:
    RTS

  .collision:
    LDA.W #InstList_EnemyProjectile_Shot_GoldenTorizoSuperMissile : STA.W EnemyProjectile_InstListPointers,X
    LDA.W #$0001 : STA.W EnemyProjectile_InstructionTimers,X
    RTS


;;; $B269: Instruction - aim super missile - rightwards ;;;
Instruction_AimSuperMissile_Rightwards:
;; Parameters:
;;     X: Enemy projectile index
    JSL CalculateAngleOfSamusFromEnemyProjectile
    AND.W #$007F
    BRA CalculateGoldenTorizoSuperMissileVelocitiesFromAngle


;;; $B272: Instruction - aim super missile - leftwards ;;;
Instruction_AimSuperMissile_Leftwards:
;; Parameters:
;;     X: Enemy projectile index
    JSL CalculateAngleOfSamusFromEnemyProjectile
    ORA.W #$0080                                                         ; fallthrough to CalculateGoldenTorizoSuperMissileVelocitiesFromAngle


;;; $B279: Calculate Golden Torizo super missile velocities from angle ;;;
CalculateGoldenTorizoSuperMissileVelocitiesFromAngle:
    PHX : PHY
    TXY : ASL : TAX
    LDA.L SineCosineTables_8bitSine_SignExtended,X : ASL #2 : STA.W EnemyProjectile_XVelocity,Y
    LDA.L SineCosineTables_NegativeCosine_SignExtended,X : ASL #2 : STA.W EnemyProjectile_YVelocity,Y
    PLY : PLX
    RTS


;;; $B293: Instruction list - Golden Torizo super missile - rightwards ;;;
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


;;; $B2C1: Instruction list - Golden Torizo super missile - leftwards ;;;
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


;;; $B2EF: Instruction list - Golden Torizo super missile - explode / shot instruction list - enemy projectile $B31A (Golden Torizo super missile) ;;;
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


;;; $B31A: Enemy projectile - Golden Torizo super missile ;;;
EnemyProjectile_GoldenTorizoSuperMissile:
    %EnemyProjectile(\
    %initAI(InitAI_EnemyProjectile_GoldenTorizoSuperMissile),
    %preInst(PreInstruction_EnemyProjectile_GoldenTorizoSuperMissile_Held),
    %instList(InstList_EnemyProj_GoldenTorizoSuperMissile_Rightwards_0),
    %radius(4, 4),
    %properties($A0C8),
    %hitList(0),
    %shotList(InstList_EnemyProjectile_Shot_GoldenTorizoSuperMissile))


;;; $B328: Initialisation AI - enemy projectile $B428 (Golden Torizo eye beam) ;;;
InitAI_EnemyProjectile_GoldenTorizoEyeBeam:
;; Parameters:
;;     Y: Enemy projectile index
    LDX.W EnemyIndex
    LDA.W Enemy.XPosition,X : STA.B DP_Temp12
    LDA.W Enemy.YPosition,X : STA.B DP_Temp14
    BIT.W Enemy.init0,X : BMI .facingRight
    LDX.W #.leftwards
    BRA +

  .facingRight:
    LDX.W #.rightwards

+   JSR InitAI_EnemyProjectile_TorizoChozoOrbs_Egg_EyeBeam_Common
    JSL GenerateRandomNumber
    AND.W #$001E : SEC : SBC.W #$0010
    CLC : ADC.W #$00C0
    LDX.W EnemyIndex
    BIT.W Enemy.init0,X : BMI .facingRight2
    CLC
    ADC.W #$0080

  .facingRight2:
    TAX
    LDA.L SineCosineTables_8bitSine_SignExtended,X : ASL #3 : STA.W EnemyProjectile_XVelocity,Y
    LDA.L SineCosineTables_NegativeCosine_SignExtended,X : ASL #3 : STA.W EnemyProjectile_YVelocity,Y
    RTS

;        _____________________ Instruction list pointer
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


;;; $B38A: Pre-instruction - enemy projectile $B428 (Golden Torizo eye beam) ;;;
PreInstruction_EnemyProjectile_GoldenTorizoEyeBeam:
;; Parameters:
;;     X: Enemy projectile index
    JSR Move_EnemyProjectile_Horizontally
    BCS .collision
    JSR Move_EnemyProjectile_Vertically
    BCS .hitFloor
    RTS

  .collision:
    LDA.W #InstList_EnemyProjectile_GoldenTorizoEyeBeam_HitWall : STA.W EnemyProjectile_InstListPointers,X
    BRA .instructionListSet

  .hitFloor:
    LDA.W EnemyProjectile_YPositions,X : AND.W #$FFF0 : ORA.W #$0008 : DEC #2 : STA.W EnemyProjectile_YPositions,X
    LDA.W #InstList_EnemyProjectile_GoldenTorizoEyeBeam_HitFloor_0 : STA.W EnemyProjectile_InstListPointers,X

  .instructionListSet:
    LDA.W #$0001 : STA.W EnemyProjectile_InstructionTimers,X
    RTS


;;; $B3B8: Instruction - go to [[Y]] if eye beam explosions are disabled ;;;
Instruction_EnemyProjectile_GotoYIfEyeBeamExplosionsDisabled:
;; Parameters:
;;     X: Enemy projectile index
;;     Y: Pointer to instruction arguments
;; Returns:
;;     Y: Pointer to next instruction

; I'm guessing that EnemyProjectile_Var1 is enemy index here, it's never actually initialised, but 0 is correct for vanilla anyway
    PHX
    LDA.W EnemyProjectile_Var1,X : TAX
    LDA.L Torizo.eyeBeamExplosionsFlag,X : BPL .gotoY
    PLX
    INY #2
    RTS

  .gotoY:
    PLX
    LDA.W $0000,Y : TAY
    RTS


;;; $B3CD: Instruction list - Golden Torizo eye beam - hit wall ;;;
InstList_EnemyProjectile_GoldenTorizoEyeBeam_HitWall:
    dw Instruction_EnemyProjectile_ClearPreInstruction
    dw $0004,EnemyProjSpritemaps_Common_0
    dw $0004,EnemyProjSpritemaps_Common_1
    dw $0004,EnemyProjSpritemaps_Common_2
    dw $0004,EnemyProjSpritemaps_Common_3
    dw $0004,EnemyProjSpritemaps_Common_4
    dw Instruction_EnemyProjectile_Delete


;;; $B3E5: Instruction list - Golden Torizo eye beam - hit floor ;;;
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


;;; $B410: Instruction list - Golden Torizo eye beam - normal ;;;
InstList_EnemyProjectile_GoldenTorizoEyeBeam_Normal:
    dw $0001,EnemyProjSpritemaps_Common_4
    dw $0001,EnemyProjSpritemaps_Common_3
    dw $0001,EnemyProjSpritemaps_Common_2
    dw $0001,EnemyProjSpritemaps_Common_1
    dw $0001,EnemyProjSpritemaps_Common_0
    dw Instruction_EnemyProjectile_GotoY
    dw InstList_EnemyProjectile_GoldenTorizoEyeBeam_Normal


;;; $B428: Enemy projectile - Golden Torizo eye beam ;;;
EnemyProjectile_GoldenTorizoEyeBeam:
    %EnemyProjectile(\
    %initAI(InitAI_EnemyProjectile_GoldenTorizoEyeBeam),
    %preInst(PreInstruction_EnemyProjectile_GoldenTorizoEyeBeam),
    %instList(InstList_EnemyProjectile_GoldenTorizoEyeBeam_Normal),
    %radius(3, 3),
    %properties($700A),
    %hitList(0),
    %shotList(InstList_EnemyProjectile_Delete))


if !FEATURE_KEEP_UNREFERENCED
;;; $B436: Unused. Instruction - reset position ;;;
UNUSED_Instruction_ResetPosition_86B436:
;; Parameters:
;;     X: Enemy projectile index

; Clone of Instruction_EnemyProjectile_Torizo_ResetPosition
    LDA.W EnemyProjectile_Var0,X : STA.W EnemyProjectile_XPositions,X
    LDA.W EnemyProjectile_Var1,X : STA.W EnemyProjectile_YPositions,X
    RTS
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $B443: Instruction list - enemy projectile $B4B1 (old Tourian escape shaft fake wall explosion) ;;;
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
;;; $B470: Unused. Instruction list ;;;
UNUSED_InstList_EnemyProjectile_86B470:
    dw Instruction_EnemyProjectile_QueueSoundInY_Lib2_Max6 : db $24
    dw $0008,EnemyProjSpritemaps_Common_Smoke_0
    dw $0008,EnemyProjSpritemaps_Common_Smoke_1
    dw $0008,EnemyProjSpritemaps_Common_Smoke_2
    dw $0008,EnemyProjSpritemaps_Common_Smoke_3
    dw Instruction_EnemyProjectile_DecrementTimer_GotoYIfNonZero
    dw InstList_EnemyProj_OldTourianEscapeShaftFakeWallExplosion_1
    dw Instruction_EnemyProjectile_Delete


;;; $B489: Unused. Instruction - go to [[Y]] with probability 1/4 ;;;
UNUSED_Instruction_GotoY_Probability_1_4:
;; Parameters:
;;     Y: Pointer to instruction arguments
;; Returns:
;;     Y: Pointer to next instruction

; Clone of Instruction_EnemyProjectile_GotoY_Probability_1_4
    JSL GenerateRandomNumber
    AND.W #$C000 : CMP.W #$C000 : BEQ .gotoY
    INY #2
    RTS

  .gotoY:
    LDA.W $0000,Y : TAY
    RTS
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $B49D: Initialisation AI - enemy projectile $B4B1 (old Tourian escape shaft fake wall explosion) ;;;
InitAI_EnemyProj_OldTourianEscapeShaftFakeWallExplosion:
;; Parameters:
;;     Y: Enemy projectile index

; Set position to middle of wall that breaks
    LDA.W #$0110 : STA.W EnemyProjectile_XPositions,Y : STA.W EnemyProjectile_Var0,Y
    LDA.W #$0888 : STA.W EnemyProjectile_YPositions,Y : STA.W EnemyProjectile_Var1,Y
    RTS


;;; $B4B0: RTS. Pre-instruction - enemy projectile $B4B1 (old Tourian escape shaft fake wall explosion) ;;;
RTS_86B4B0:
    RTS


;;; $B4B1: Enemy projectile - old Tourian escape shaft fake wall explosion ;;;
EnemyProjectile_OldTourianEscapeShaftFakeWallExplosion:
    %EnemyProjectile(\
    %initAI(InitAI_EnemyProj_OldTourianEscapeShaftFakeWallExplosion),
    %preInst(RTS_86B4B0),
    %instList(InstList_EnemyProj_OldTourianEscapeShaftFakeWallExplosion_0),
    %radius(0, 0),
    %properties($3000),
    %hitList(0),
    %shotList(InstList_EnemyProjectile_Delete))


;;; $B4BF: Instruction list - dragon fireball - rising - leftwards ;;;
InstList_EnemyProjectile_DragonFireball_Rising_Left:
    dw $0005,EnemyProjSpritemaps_DragonFireball_0
    dw $0005,EnemyProjSpritemaps_DragonFireball_1
    dw Instruction_EnemyProjectile_GotoY
    dw InstList_EnemyProjectile_DragonFireball_Rising_Left


;;; $B4CB: Instruction list - dragon fireball - rising - rightwards ;;;
InstList_EnemyProjectile_DragonFireball_Rising_Right:
    dw $0005,EnemyProjSpritemaps_DragonFireball_4
    dw $0005,EnemyProjSpritemaps_DragonFireball_5
    dw Instruction_EnemyProjectile_GotoY
    dw InstList_EnemyProjectile_DragonFireball_Rising_Right


;;; $B4D7: Instruction list - dragon fireball - falling - leftwards ;;;
InstList_EnemyProjectile_DragonFireball_Falling_Left:
    dw $0005,EnemyProjSpritemaps_DragonFireball_2
    dw $0005,EnemyProjSpritemaps_DragonFireball_3
    dw Instruction_EnemyProjectile_GotoY
    dw InstList_EnemyProjectile_DragonFireball_Falling_Left


;;; $B4E3: Instruction list - dragon fireball - falling - rightwards ;;;
InstList_EnemyProjectile_DragonFireball_Falling_Right:
    dw $0005,EnemyProjSpritemaps_DragonFireball_6
    dw $0005,EnemyProjSpritemaps_DragonFireball_7
    dw Instruction_EnemyProjectile_GotoY
    dw InstList_EnemyProjectile_DragonFireball_Falling_Right


;;; $B4EF: Initialisation AI - enemy projectile $B5CB (dragon fireball) ;;;
InitAI_EnemyProjectile_DragonFireball:
;; Parameters:
;;     Y: Enemy projectile index
    LDX.W EnemyIndex
    LDA.W Enemy.YPosition,X : SEC : SBC.W #$001C : STA.W EnemyProjectile_YPositions,Y
    LDA.W #$FC3F : STA.W EnemyProjectile_YVelocity,Y
    BIT.W Enemy.var0,X : BPL .pointer
    LDA.W Enemy.XPosition,X : CLC : ADC.W #$FFF4 : STA.W EnemyProjectile_XPositions,Y
    LDA.W #$FD40 : STA.W EnemyProjectile_XVelocity,Y
    LDA.W #InstList_EnemyProjectile_DragonFireball_Rising_Left : STA.W EnemyProjectile_InstListPointers,Y
    RTS

  .pointer:
    LDA.W Enemy.XPosition,X : CLC : ADC.W #$000C : STA.W EnemyProjectile_XPositions,Y
    LDA.W #$02C0 : STA.W EnemyProjectile_XVelocity,Y
    LDA.W #InstList_EnemyProjectile_DragonFireball_Rising_Right : STA.W EnemyProjectile_InstListPointers,Y
    RTS


;;; $B535: Pre-instruction - enemy projectile $B5CB (dragon fireball) ;;;
PreInstruction_EnemyProjectile_DragonFireball:
;; Parameters:
;;     X: Enemy projectile index
    LDA.W EnemyProjectile_XVelocity-1,X : AND.W #$FF00 : STA.B DP_Temp14
    LDA.W EnemyProjectile_XVelocity,X : XBA : BPL .lowByteX
    ORA.W #$FF00
    BRA +

  .lowByteX:
    AND.W #$00FF

+   STA.B DP_Temp12
    LDA.W EnemyProjectile_XSubPositions,X : CLC : ADC.B DP_Temp14 : STA.W EnemyProjectile_XSubPositions,X
    LDA.W EnemyProjectile_XPositions,X : ADC.B DP_Temp12 : STA.W EnemyProjectile_XPositions,X
    LDA.W EnemyProjectile_YVelocity-1,X : AND.W #$FF00 : STA.B DP_Temp14
    LDA.W EnemyProjectile_YVelocity,X : XBA : BPL .lowByteY
    ORA.W #$FF00
    BRA +

  .lowByteY:
    AND.W #$00FF

+   STA.B DP_Temp12
    LDA.W EnemyProjectile_YSubPositions,X : CLC : ADC.B DP_Temp14 : STA.W EnemyProjectile_YSubPositions,X
    LDA.W EnemyProjectile_YPositions,X : ADC.B DP_Temp12 : STA.W EnemyProjectile_YPositions,X
    LDA.W EnemyProjectile_YVelocity,X : BPL .movingDown
    CLC : ADC.W #$0020 : STA.W EnemyProjectile_YVelocity,X : BMI .return
    BIT.W EnemyProjectile_XVelocity,X : BPL .right
    LDA.W #InstList_EnemyProjectile_DragonFireball_Falling_Left
    BRA .instructionListSet

  .right:
    LDA.W #InstList_EnemyProjectile_DragonFireball_Falling_Right
    BRA .instructionListSet

  .movingDown:
    CLC : ADC.W #$0020 : STA.W EnemyProjectile_YVelocity,X
    JSR Delete_EnemyProjectile_IfVerticallyOffScreen

  .return:
    RTS

  .instructionListSet:
    STA.W EnemyProjectile_InstListPointers,X
    LDA.W #$0001 : STA.W EnemyProjectile_InstructionTimers,X
    RTS


;;; $B5B9: Delete enemy projectile if vertically off-screen ;;;
Delete_EnemyProjectile_IfVerticallyOffScreen:
;; Parameters:
;;     X: Enemy projectile index
    LDA.W EnemyProjectile_YPositions,X : SEC : SBC.W Layer1YPosition : BMI .return
    CMP.W #$0120 : BCC .return
    STZ.W EnemyProjectile_ID,X

  .return:
    RTS


;;; $B5CB: Enemy projectile - dragon fireball ;;;
EnemyProjectile_DragonFireball:
    %EnemyProjectile(\
    %initAI(InitAI_EnemyProjectile_DragonFireball),
    %preInst(PreInstruction_EnemyProjectile_DragonFireball),
    %instList(InstList_EnemyProjectile_DragonFireball_Rising_Left),
    %radius(2, 2),
    %properties($000A),
    %hitList(0),
    %shotList(InstList_EnemyProjectile_Delete))


;;; $B5D9: Instruction list - eye door projectile - normal ;;;
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


;;; $B5F3: Instruction list - eye door projectile - explode ;;;
InstList_EnemyProjectile_EyeDoorProjectile_Explode:
    dw Instruction_EnemyProjectile_ClearPreInstruction
    dw $0002,EnemyProjSpritemaps_EyeDoorProjectile_6
    dw $0003,EnemyProjSpritemaps_EyeDoorProjectile_5
    dw $0004,EnemyProjSpritemaps_EyeDoorProjectile_4
    dw Instruction_EnemyProjectile_Delete


;;; $B603: Shot instruction list - enemy projectile $B743 (eye door projectile) ;;;
InstList_EnemyProjectile_Shot_EyeDoorProjectile:
    dw $0004,EnemyProjSpritemaps_EyeDoorProjectile_0
    dw $0004,EnemyProjSpritemaps_EyeDoorProjectile_1
    dw $0004,EnemyProjSpritemaps_EyeDoorProjectile_2
    dw $0004,EnemyProjSpritemaps_EyeDoorProjectile_3
    dw Instruction_EnemyProjectile_Delete


;;; $B615: Instruction list - eye door sweat - falling ;;;
InstList_EnemyProjectile_EyeDoorSweat_Falling:
    dw $0006,EnemyProjSpritemaps_EyeDoorSweat_0
    dw Instruction_EnemyProjectile_GotoY
    dw InstList_EnemyProjectile_EyeDoorSweat_Falling


;;; $B61D: Instruction list - eye door sweat - hit floor ;;;
InstList_EnemyProjectile_EyeDoorSweat_HitFloor:
    dw Instruction_EnemyProjectile_ClearPreInstruction
    dw $0006,EnemyProjSpritemaps_EyeDoorSweat_1
    dw $0006,EnemyProjSpritemaps_EyeDoorSweat_2
    dw $0006,EnemyProjSpritemaps_EyeDoorSweat_3
    dw Instruction_EnemyProjectile_Delete


;;; $B62D: Initialisation AI - enemy projectile $B743 (eye door projectile) ;;;
InitAI_EnemyProjectile_EyeDoorProjectile:
;; Parameters:
;;     Y: Enemy projectile index
;;     EnemyProjectile_InitParam0: Index. Multiple of 4, range 0..24h. Only 0 and 14h are used
    LDX.W PLM_Index
    LDA.W PLM_RoomArgs,X : STA.W EnemyProjectile_Var1,Y
    JSL Calculate_PLM_Block_Coordinates
    LDX.W EnemyProjectile_InitParam0
    LDA.W PLM_XBlock : SEC : ROL : ASL #3
    CLC : ADC.W .Xpositions,X : STA.W EnemyProjectile_XPositions,Y
    LDA.W PLM_YBlock : ASL #4 : CLC : ADC.W .Ypositions,X : STA.W EnemyProjectile_YPositions,Y
    RTS

  .Xpositions:
    dw $FFF0
  .Ypositions:
    dw       $0010, $FFA0,$FFC0, $FF80,$FFE0, $FFA0,$0040, $FF80,$0020
    dw $0010,$0010, $0060,$FFC0, $0070,$FFC0, $0080,$FFC0, $0090,$FFC0


;;; $B683: Initialisation AI - enemy projectile $B751 (eye door sweat) ;;;
InitAI_EnemyProjectile_EyeDoorSweat:
;; Parameters:
;;     Y: Enemy projectile index
;;     EnemyProjectile_InitParam0: Direction. 0 = left, 4 = right
    LDX.W PLM_Index
    JSL Calculate_PLM_Block_Coordinates
    LDA.W PLM_XBlock : DEC
    SEC : ROL : ASL #3 : STA.W EnemyProjectile_XPositions,Y
    LDA.W PLM_YBlock : INC : ASL #4 : STA.W EnemyProjectile_YPositions,Y
    LDX.W EnemyProjectile_InitParam0
    LDA.W .Xvelocity,X : STA.W EnemyProjectile_XVelocity,Y
    LDA.W .Yvelocity,X : STA.W EnemyProjectile_YVelocity,Y
    RTS

  .Xvelocity:
    dw $FFC0
  .Yvelocity:
    dw       $0200
    dw $0040,$0200


;;; $B6B9: Pre-instruction - eye door projectile - moving ;;;
PreInstruction_EnemyProjectile_EyeDoorProjectile_Moving:
;; Parameters:
;;     X: Enemy projectile index

; BUG: the $B707 branch assumes the enemy projectile index is in X, but this is only true if the .collision branch is taken,
; otherwise the enemy projectile index is in Y, and the door bit array index is in X,
; causing misaligned writes to enemy projectile RAM if X is odd, eventually causing a crash when the garbage instruction pointer gets executed
; (which happens after a delay of 100h+ frames due to the misaligned write to the instruction timer)

; The X/Y velocity calculations were already done as a part of calculating the angle to Samus in Instruction_EnemyProjectile_CalculateDirectionTowardsSamus,
; they don't need to be here
    JSR Move_EnemyProjectile_Horizontally
    BCS .collision
    JSR Move_EnemyProjectile_Vertically
    BCS .collision
    TXY
    LDA.W EnemyProjectile_Var0,X : TAX
    LDA.L SineCosineTables_8bitSine_SignExtended,X : LSR #4 : BIT.W #$0800 : BEQ .addXvelocity
    ORA.W #$F000

  .addXvelocity:
    CLC : ADC.W EnemyProjectile_XVelocity,Y : STA.W EnemyProjectile_XVelocity,Y
    LDA.L SineCosineTables_NegativeCosine_SignExtended,X
    LSR #4 : BIT.W #$0800 : BEQ .addYvelocity
    ORA.W #$F000

  .addYvelocity:
    CLC : ADC.W EnemyProjectile_YVelocity,Y : STA.W EnemyProjectile_YVelocity,Y
    LDA.W EnemyProjectile_Var1,Y
    JSL BitIndexToByteIndexAndBitmask
    LDA.L SRAMMirror_Doors,X : AND.W Bitmask : BNE .collision
    RTS

  .collision:
    LDA.W #InstList_EnemyProjectile_EyeDoorProjectile_Explode : STA.W EnemyProjectile_InstListPointers,X
    LDA.W #$0001 : STA.W EnemyProjectile_InstructionTimers,X
    RTS


;;; $B714: Pre-instruction - enemy projectile $B751 (eye door sweat) ;;;
PreInstruction_EnemyProjectile_EyeDoorSweat:
;; Parameters:
;;     X: Enemy projectile index
    JSR Move_EnemyProjectile_Horizontally
    JSR Move_EnemyProjectile_Vertically
    BIT.W EnemyProjectile_YVelocity,X : BMI .positive
    BCS .hitFloor

  .positive:
    LDA.W EnemyProjectile_YVelocity,X : CLC : ADC.W #$000C : STA.W EnemyProjectile_YVelocity,X
    RTS

  .hitFloor:
    LDA.W EnemyProjectile_YPositions,X : SEC : SBC.W #$0004 : STA.W EnemyProjectile_YPositions,X
    LDA.W #InstList_EnemyProjectile_EyeDoorSweat_HitFloor : STA.W EnemyProjectile_InstListPointers,X
    LDA.W #$0001 : STA.W EnemyProjectile_InstructionTimers,X
    RTS


;;; $B743: Enemy projectiles - eye door ;;;
EnemyProjectile_EyeDoorProjectile:
    %EnemyProjectile(\
    %initAI(InitAI_EnemyProjectile_EyeDoorProjectile),
    %preInst(RTS_8684FB),
    %instList(InstList_EnemyProjectile_EyeDoorProjectile_Normal_0),
    %radius(8, 8),
    %properties($8004),
    %hitList(0),
    %shotList(InstList_EnemyProjectile_Shot_EyeDoorProjectile))

EnemyProjectile_EyeDoorSweat:
    %EnemyProjectile(\
    %initAI(InitAI_EnemyProjectile_EyeDoorSweat),
    %preInst(PreInstruction_EnemyProjectile_EyeDoorSweat),
    %instList(InstList_EnemyProjectile_EyeDoorSweat_Falling),
    %radius(0, 0),
    %properties($0004),
    %hitList(0),
    %shotList(InstList_EnemyProjectile_Delete))


if !FEATURE_KEEP_UNREFERENCED
;;; $B75F: Unused. Colours ;;;
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


;;; $B79F: Instruction list - delete ;;;
InstList_EnemyProjectile_TourianStatue_Delete:
    dw Instruction_EnemyProjectile_Delete


;;; $B7A1: Instruction list - enemy projectile $BA5C (Tourian entrance statue unlocking particle water splash) ;;;
InstList_EnemyProj_TourianStatueUnlockingParticleWaterSplash:
    dw $0008,EnemyProjSpritemaps_TourianStatueUnlockParticleWaterSplash_0
    dw $0008,EnemyProjSpritemaps_TourianStatueUnlockParticleWaterSplash_1
    dw $0008,EnemyProjSpritemaps_TourianStatueUnlockParticleWaterSplash_2
    dw $0008,EnemyProjSpritemaps_TourianStatueUnlockParticleWaterSplash_3
    dw Instruction_EnemyProjectile_Delete


;;; $B7B3: Instruction list - enemy projectile $BA6A (Tourian entrance statue eye glow) ;;;
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


;;; $B7EA: Instruction - spawn Tourian entrance statue unlocking particle enemy projectile ;;;
Instruction_EnemyProj_SpawnTourianStatueUnlockingParticle:
;; Parameters:
;;     X: Enemy projectile index
    PHY
    TXA
    LDY.W #EnemyProjectile_TourianStatueUnlockingParticle
    JSL SpawnEnemyProjectileY_ParameterA_RoomGraphics
    PLY
    RTS


;;; $B7F5: Instruction - Tourian entrance statue unlocking earthquake ;;;
Instruction_EnemyProj_TourianStatueUnlockingEarthquake:
    LDA.W #$0001 : STA.W EarthquakeType
    LDA.W #$0020 : TSB.W EarthquakeTimer
    RTS


;;; $B802: Instruction list - enemy projectile $BA78 (Tourian entrance statue unlocking particle) ;;;
InstList_EnemyProjectile_TourianStatueUnlockingParticle:
; Timer isn't set, making the instruction loop effectively infinite
    dw $0003,EnemyProjSpritemaps_TourianStatueUnlockingParticle_0
    dw $0003,EnemyProjSpritemaps_TourianStatueUnlockingParticle_1
    dw Inst_EnemyProj_SpawnTourianStatueUnlockingParticleTail
    dw $0003,EnemyProjSpritemaps_TourianStatueUnlockingParticle_3
    dw $0003,EnemyProjSpritemaps_TourianStatueUnlockingParticle_2
    dw Instruction_EnemyProjectile_DecrementTimer_GotoYIfNonZero
    dw InstList_EnemyProjectile_TourianStatueUnlockingParticle


;;; $B818: Instruction - spawn Tourian entrance statue unlocking particle tail enemy projectile ;;;
Inst_EnemyProj_SpawnTourianStatueUnlockingParticleTail:
;; Parameters:
;;     X: Enemy projectile index
    PHY
    TXA
    LDY.W #EnemyProjectile_TourianStatueUnlockingParticleTail
    JSL SpawnEnemyProjectileY_ParameterA_RoomGraphics
    PLY
    RTS


;;; $B823: Instruction list - enemy projectile $BA86 (Tourian entrance statue unlocking particle tail) ;;;
InstList_EnemyProj_SpawnTourianStatueUnlockingParticleTail:
    dw $0004,EnemyProjSpritemaps_TourianStatueUnlockingParticleTail_0
    dw Instruction_EnemyProjectile_YPositionInY,$0008
    dw $0004,EnemyProjSpritemaps_TourianStatueUnlockingParticleTail_1
    dw Instruction_EnemyProjectile_YPositionInY,$0004
    dw $0004,EnemyProjSpritemaps_TourianStatueUnlockingParticleTail_2
    dw Instruction_EnemyProjectile_YPositionInY,$0002
    dw $0004,EnemyProjSpritemaps_TourianStatueUnlockingParticleTail_3
    dw Instruction_EnemyProjectile_Delete


;;; $B841: Instruction - enemy projectile Y position += [[Y]] ;;;
Instruction_EnemyProjectile_YPositionInY:
;; Parameters:
;;     X: Enemy projectile index
;;     Y: Pointer to instruction arguments
;; Returns:
;;     Y: Pointer to next instruction
    LDA.W EnemyProjectile_YPositions,X : CLC
    ADC.W $0000,Y : STA.W EnemyProjectile_YPositions,X
    INY #2
    RTS


;;; $B84E: Instruction list - enemy projectile $BA94 (Tourian entrance statue's soul) ;;;
InstList_EnemyProjectile_TourianStatuesSoul:
    dw $0008,EnemyProjSpritemaps_TourianStatuesSoul_0
    dw $0008,EnemyProjSpritemaps_TourianStatuesSoul_1
    dw Instruction_EnemyProjectile_GotoY
    dw InstList_EnemyProjectile_TourianStatuesSoul


;;; $B85A: Instruction list - enemy projectile $BABE (Tourian entrance statue - base decoration) ;;;
InstList_EnemyProjectile_TourianStatueBaseDecoration_0:
    dw $0080,EnemyProjSpritemaps_TourianStatueBaseDecoration
    dw Instruction_EnemyProjectile_PreInstructionInY
    dw PreInst_EnemyProj_TourianStatueBaseDecoration_AllowProcess

InstList_EnemyProjectile_TourianStatueBaseDecoration_1:
    dw $0777,EnemyProjSpritemaps_TourianStatueBaseDecoration
    dw Instruction_EnemyProjectile_GotoY
    dw InstList_EnemyProjectile_TourianStatueBaseDecoration_1


;;; $B86A: Instruction list - enemy projectile $BAA2 (Tourian entrance statue - Ridley) ;;;
InstList_EnemyProjectile_TourianStatueRidley:
    dw $0777,EnemyProjSpritemaps_TourianStatueRidley
    dw Instruction_EnemyProjectile_GotoY
    dw InstList_EnemyProjectile_TourianStatueRidley


;;; $B872: Instruction list - enemy projectile $BAB0 (Tourian entrance statue - Phantoon) ;;;
InstList_EnemyProjectile_TourianStatuePhantoon:
    dw $0777,EnemyProjSpritemaps_TourianStatuePhantoon
    dw Instruction_EnemyProjectile_GotoY
    dw InstList_EnemyProjectile_TourianStatuePhantoon


;;; $B87A: Initialisation AI - enemy projectile $BA5C (Tourian entrance statue unlocking particle water splash) ;;;
InitAI_EnemyProj_TourianStatueUnlockingParticleWaterSplash:
;; Parameters:
;;     Y: Enemy projectile index
;;     EnemyProjectile_InitParam0: Tourian entrance statue unlocking particle enemy projectile index
    LDX.W EnemyProjectile_InitParam0
    LDA.W EnemyProjectile_XPositions,X : STA.W EnemyProjectile_XPositions,Y
    LDA.W FX_YPosition : SEC : SBC.W #$0004 : STA.W EnemyProjectile_YPositions,Y
    RTS


;;; $B88E: Initialisation AI - enemy projectile $BA6A (Tourian entrance statue eye glow) ;;;
InitAI_EnemyProjectile_TourianStatueEyeGlow:
;; Parameters:
;;     Y: Enemy projectile index
;;     EnemyProjectile_InitParam0: Boss
;;         0: Phantoon
;;         2: Ridley
;;         4: Draygon
;;         6: Kraid
    LDX.W EnemyProjectile_InitParam0
    LDA.W TourianStatueEyeData_Xposition,X : STA.W EnemyProjectile_XPositions,Y
    LDA.W TourianStatueEyeData_Yposition,X : STA.W EnemyProjectile_YPositions,Y
    TXA : ASL #2 : TAY
    LDX.W #$01F2

  .loop:
    LDA.W TourianStatueEyeData_Phantoon,Y : STA.L Palettes,X
    INY #2
    INX #2 : CPX.W #$01FA : BNE .loop
    RTS


;;; $B8B5: Initialisation AI - enemy projectile $BA78 (Tourian entrance statue unlocking particle) ;;;
InitAI_EnemyProjectile_TourianStatueUnlockingParticle:
;; Parameters:
;;     Y: Enemy projectile index
;;     EnemyProjectile_InitParam0: Tourian entrance statue eye glow enemy projectile index
    LDX.W EnemyProjectile_InitParam0
    LDA.W EnemyProjectile_XPositions,X : STA.W EnemyProjectile_XPositions,Y
    LDA.W EnemyProjectile_YPositions,X : STA.W EnemyProjectile_YPositions,Y
    JSL GenerateRandomNumber
    AND.W #$003F : SEC : SBC.W #$0020
    AND.W #$00FF : ASL : STA.W EnemyProjectile_Var0,Y
    TAX
    LDA.L SineCosineTables_8bitSine_SignExtended,X : STA.W EnemyProjectile_XVelocity,Y
    LDA.L SineCosineTables_NegativeCosine_SignExtended,X : ASL #2 : STA.W EnemyProjectile_YVelocity,Y
    RTS


;;; $B8E8: Initialisation AI - enemy projectile $BA86 (Tourian entrance statue unlocking particle tail) ;;;
InitAI_EnemyProjectile_TourianStatueUnlockingParticleTail:
;; Parameters:
;;     Y: Enemy projectile index
;;     EnemyProjectile_InitParam0: Tourian entrance statue unlocking particle enemy projectile index
    LDX.W EnemyProjectile_InitParam0
    LDA.W EnemyProjectile_XPositions,X : STA.W EnemyProjectile_XPositions,Y
    LDA.W EnemyProjectile_YPositions,X : STA.W EnemyProjectile_YPositions,Y
    RTS


InitAI_EnemyProjectile_TourianStatuesSoul:
;; Parameters:
;;     Y: Enemy projectile index
;;     EnemyProjectile_InitParam0: Boss
;;         0: Phantoon
;;         2: Ridley
;;         4: Draygon
;;         6: Kraid
    LDX.W EnemyProjectile_InitParam0
    LDA.W TourianStatueEyeData_Xposition,X : STA.W EnemyProjectile_XPositions,Y
    LDA.W TourianStatueEyeData_Yposition,X : STA.W EnemyProjectile_YPositions,Y
    LDA.W #$FC00 : STA.W EnemyProjectile_YVelocity,Y
    RTS


;;; $B90E: Tourian entrance statue eye data ;;;
TourianStatueEyeData:
; Tourian entrance statue eye/soul positions
;        _____________________ Phantoon
;       |      _______________ Ridley
;       |     |      _________ Draygon
;       |     |     |      ___ Kraid
;       |     |     |     |
  .Xposition:
    dw $0084,$007A,$009E,$0068
  .Yposition:
    dw $0090,$0051,$0080,$0072

; Sprite palette 7 colours 9..Ch. Eye glow colours
  .Phantoon:
    dw $6BFF,$033B,$0216,$0173                                           ; yellow
  .Ridley:
    dw $7F5F,$7C1F,$5816,$300C                                           ; red
  .Draygon:
    dw $7F5A,$7EC0,$6DE0,$54E0                                           ; blue
  .Kraid:
    dw $6BFA,$3BE0,$2680,$1580                                           ; green


;;; $B93E: Initialisation AI - enemy projectile $BABE (Tourian entrance statue - base decoration) ;;;
InitAI_EnemyProjectile_TourianStatueBaseDecoration:
;; Parameters:
;;     Y: Enemy projectile index
    LDA.W #$0078 : STA.W EnemyProjectile_Var0,Y : STA.W EnemyProjectile_XPositions,Y
    LDA.W #$00B8 : STA.W EnemyProjectile_Var1,Y : STA.W EnemyProjectile_YPositions,Y
    RTS


;;; $B951: Initialisation AI - enemy projectile $BAA2 (Tourian entrance statue - Ridley) ;;;
InitAI_EnemyProjectile_TourianStatue_Ridley:
;; Parameters:
;;     Y: Enemy projectile index
    LDA.W #$008E : STA.W EnemyProjectile_Var0,Y : STA.W EnemyProjectile_XPositions,Y
    LDA.W #$0055 : STA.W EnemyProjectile_Var1,Y : STA.W EnemyProjectile_YPositions,Y
    RTS


;;; $B964: Initialisation AI - enemy projectile $BAB0 (Tourian entrance statue - Phantoon) ;;;
InitAI_EnemyProjectile_TourianStatue_Phantoon:
;; Parameters:
;;     Y: Enemy projectile index
    LDA.W #$0084 : STA.W EnemyProjectile_Var0,Y : STA.W EnemyProjectile_XPositions,Y
    LDA.W #$0088 : STA.W EnemyProjectile_Var1,Y : STA.W EnemyProjectile_YPositions,Y
    RTS


;;; $B977: Pre-instruction - enemy projectile $BA5C (Tourian entrance statue unlocking particle water splash) ;;;
PreInst_EnemyProj_TourianStatueUnlockingParticleWaterSplash:
;; Parameters:
;;     X: Enemy projectile index
    LDA.W FX_YPosition : SEC : SBC.W #$0004 : STA.W EnemyProjectile_YPositions,X
    RTS


;;; $B982: Pre-instruction - enemy projectile $BA78 (Tourian entrance statue unlocking particle) ;;;
PreInst_EnemyProjectile_TourianStatueUnlockingParticle:
;; Parameters:
;;     X: Enemy projectile index
    STZ.B DP_Temp12
    STZ.B DP_Temp14
    LDA.W EnemyProjectile_XVelocity,X : BPL +
    DEC.B DP_Temp14

+   STA.B DP_Temp13
    LDA.W EnemyProjectile_XSubPositions,X : CLC : ADC.B DP_Temp12 : STA.W EnemyProjectile_XSubPositions,X
    LDA.W EnemyProjectile_XPositions,X : ADC.B DP_Temp14 : STA.W EnemyProjectile_XPositions,X
    LDA.W FX_YPosition : SEC : SBC.W EnemyProjectile_YPositions,X : PHA
    STZ.B DP_Temp12 : STZ.B DP_Temp14
    LDA.W EnemyProjectile_YVelocity,X : BPL +
    DEC.B DP_Temp14

+   STA.B DP_Temp13
    LDA.W EnemyProjectile_YSubPositions,X : CLC : ADC.B DP_Temp12 : STA.W EnemyProjectile_YSubPositions,X
    LDA.W EnemyProjectile_YPositions,X : ADC.B DP_Temp14 : STA.W EnemyProjectile_YPositions,X
    LDA.W FX_YPosition : SEC : SBC.W EnemyProjectile_YPositions,X : EOR.B $01,S : BPL +
    TXA
    LDY.W #EnemyProjectile_TourianStatueWaterSplash
    JSL SpawnEnemyProjectileY_ParameterA_RoomGraphics

+   PLA
    LDA.W EnemyProjectile_YPositions,X : AND.W #$FF00 : CMP.W #$0100 : BEQ .delete
    LDA.W EnemyProjectile_YVelocity,X : CLC : ADC.W #$0010 : STA.W EnemyProjectile_YVelocity,X
    RTS

  .delete:
    LDA.W #InstList_EnemyProjectile_TourianStatue_Delete : STA.W EnemyProjectile_InstListPointers,X
    LDA.W #$0001 : STA.W EnemyProjectile_InstructionTimers,X
    RTS


;;; $B9FD: Pre-instruction - enemy projectile $BA94 (Tourian entrance statue's soul) ;;;
PreInstruction_EnemyProjectile_TourianStatuesSoul:
;; Parameters:
;;     X: Enemy projectile index
    STZ.B DP_Temp12 : STZ.B DP_Temp14
    LDA.W EnemyProjectile_YVelocity,X : BPL +
    DEC.B DP_Temp14

+   STA.B DP_Temp13
    LDA.W EnemyProjectile_YSubPositions,X : CLC : ADC.B DP_Temp12 : STA.W EnemyProjectile_YSubPositions,X
    LDA.W EnemyProjectile_YPositions,X : ADC.B DP_Temp14 : STA.W EnemyProjectile_YPositions,X
    BIT.W #$0100 : BEQ +
    LDA.W #InstList_EnemyProjectile_TourianStatue_Delete : STA.W EnemyProjectile_InstListPointers,X
    LDA.W #$0001 : STA.W EnemyProjectile_InstructionTimers,X

+   LDA.W EnemyProjectile_YVelocity,X : CLC : ADC.W #$FF80 : STA.W EnemyProjectile_YVelocity,X
    RTS


;;; $BA37: Pre-instruction - Tourian entrance statue - base decoration - allow processing to finish ;;;
PreInst_EnemyProj_TourianStatueBaseDecoration_AllowProcess:
;; Parameters:
;;     X: Enemy projectile index
    LDA.W TourianStatueAnimationState : BNE PreInst_EnemyProj_TourianStatue_Ridley_Phantoon_BaseDecor
    LDA.W #$8000 : TSB.W TourianStatueFinishedProcessing
; fallthrough to PreInst_EnemyProj_TourianStatue_Ridley_Phantoon_BaseDecor


;;; $BA42: Pre-instruction - enemy projectile $BAA2/$BAB0/$BABE (Tourian entrance statue - Ridley / Phantoon / base decoration) ;;;
PreInst_EnemyProj_TourianStatue_Ridley_Phantoon_BaseDecor:
;; Parameters:
;;     X: Enemy projectile index
    LDA.W EnemyProjectile_Var0,X : STA.W EnemyProjectile_XPositions,X
    LDA.L TourianStatueBG2YScroll : EOR.W #$FFFF : INC
    CLC : ADC.W Layer1YPosition
    CLC : ADC.W EnemyProjectile_Var1,X : STA.W EnemyProjectile_YPositions,X
    RTS


;;; $BA5C: Enemy projectiles - Tourian entrance statue ;;;
EnemyProjectile_TourianStatueWaterSplash:
    %EnemyProjectile(\
    %initAI(InitAI_EnemyProj_TourianStatueUnlockingParticleWaterSplash),
    %preInst(PreInst_EnemyProj_TourianStatueUnlockingParticleWaterSplash),
    %instList(InstList_EnemyProj_TourianStatueUnlockingParticleWaterSplash),
    %radius(0, 0),
    %properties($3000),
    %hitList(0),
    %shotList(InstList_EnemyProjectile_Delete))

EnemyProjectile_TourianStatueEyeGlow:
    %EnemyProjectile(\
    %initAI(InitAI_EnemyProjectile_TourianStatueEyeGlow),
    %preInst(RTS_8684FB),
    %instList(InstList_EnemyProj_TourianStatueEyeGlow),
    %radius(0, 0),
    %properties($3000),
    %hitList(0),
    %shotList(InstList_EnemyProjectile_Delete))

EnemyProjectile_TourianStatueUnlockingParticle:
    %EnemyProjectile(\
    %initAI(InitAI_EnemyProjectile_TourianStatueUnlockingParticle),
    %preInst(PreInst_EnemyProjectile_TourianStatueUnlockingParticle),
    %instList(InstList_EnemyProjectile_TourianStatueUnlockingParticle),
    %radius(0, 0),
    %properties($3000),
    %hitList(0),
    %shotList(InstList_EnemyProjectile_Delete))

EnemyProjectile_TourianStatueUnlockingParticleTail:
    %EnemyProjectile(\
    %initAI(InitAI_EnemyProjectile_TourianStatueUnlockingParticleTail),
    %preInst(RTS_8684FB),
    %instList(InstList_EnemyProj_SpawnTourianStatueUnlockingParticleTail),
    %radius(0, 0),
    %properties($3000),
    %hitList(0),
    %shotList(InstList_EnemyProjectile_Delete))

EnemyProjectile_TourianStatueSoul:
    %EnemyProjectile(\
    %initAI(InitAI_EnemyProjectile_TourianStatuesSoul),
    %preInst(PreInstruction_EnemyProjectile_TourianStatuesSoul),
    %instList(InstList_EnemyProjectile_TourianStatuesSoul),
    %radius(0, 0),
    %properties($3000),
    %hitList(0),
    %shotList(InstList_EnemyProjectile_Delete))

EnemyProjectile_TourianStatueRidley:
    %EnemyProjectile(\
    %initAI(InitAI_EnemyProjectile_TourianStatue_Ridley),
    %preInst(PreInst_EnemyProj_TourianStatue_Ridley_Phantoon_BaseDecor),
    %instList(InstList_EnemyProjectile_TourianStatueRidley),
    %radius(0, 0),
    %properties($2000),
    %hitList(0),
    %shotList(InstList_EnemyProjectile_Delete))

EnemyProjectile_TourianStatuePhantoon:
    %EnemyProjectile(\
    %initAI(InitAI_EnemyProjectile_TourianStatue_Phantoon),
    %preInst(PreInst_EnemyProj_TourianStatue_Ridley_Phantoon_BaseDecor),
    %instList(InstList_EnemyProjectile_TourianStatuePhantoon),
    %radius(0, 0),
    %properties($2000),
    %hitList(0),
    %shotList(InstList_EnemyProjectile_Delete))

EnemyProjectile_TourianStatueBaseDecoration:
    %EnemyProjectile(\
    %initAI(InitAI_EnemyProjectile_TourianStatueBaseDecoration),
    %preInst(PreInst_EnemyProj_TourianStatue_Ridley_Phantoon_BaseDecor),
    %instList(InstList_EnemyProjectile_TourianStatueBaseDecoration_0),
    %radius(0, 0),
    %properties($2000),
    %hitList(0),
    %shotList(InstList_EnemyProjectile_Delete))


if !FEATURE_KEEP_UNREFERENCED
;;; $BACC: Instruction list - enemy projectile $BB50 - parameter 0 ;;;
UNUSED_InstList_EnemyProjectile_Parameter0_86BACC:
    dw $0002,UNUSED_EnemyProjSpritemaps_0_8D9268
    dw $0002,UNUSED_EnemyProjSpritemaps_1_8D926F
    dw $0002,UNUSED_EnemyProjSpritemaps_2_8D9276
    dw $0002,UNUSED_EnemyProjSpritemaps_3_8D927D
    dw $0002,UNUSED_EnemyProjSpritemaps_4_8D9284
    dw $0002,UNUSED_EnemyProjSpritemaps_5_8D928B
    dw $0002,UNUSED_EnemyProjSpritemaps_6_8D9292
    dw Instruction_EnemyProjectile_Delete


;;; $BAEA: Instruction list - enemy projectile $BB50 - parameter 1 ;;;
UNUSED_InstList_EnemyProjectile_Parameter1_86BAEA:
    dw $0002,UNUSED_EnemyProjSpritemaps_7_8D9299
    dw $0002,UNUSED_EnemyProjSpritemaps_8_8D92A0
    dw $0002,UNUSED_EnemyProjSpritemaps_9_8D92A7
    dw $0002,UNUSED_EnemyProjSpritemaps_A_8D92AE
    dw $0002,UNUSED_EnemyProjSpritemaps_B_8D92B5
    dw $0002,UNUSED_EnemyProjSpritemaps_C_8D92BC
    dw $0002,UNUSED_EnemyProjSpritemaps_D_8D92C3
    dw Instruction_EnemyProjectile_Delete


;;; $BB08: Instruction list - enemy projectile $BB50 - parameter 2 ;;;
UNUSED_InstList_EnemyProjectile_Parameter2_86BB08:
    dw $0002,UNUSED_EnemyProjSpritemaps_E_8D92CA
    dw $0002,UNUSED_EnemyProjSpritemaps_E_8D92CA
    dw $0002,UNUSED_EnemyProjSpritemaps_F_8D92D6
    dw $0002,UNUSED_EnemyProjSpritemaps_10_8D92E2
    dw $0002,UNUSED_EnemyProjSpritemaps_12_8D92FA
    dw Instruction_EnemyProjectile_Delete


;;; $BB1E: Instruction list pointers ;;;
UNUSED_InstList_Pointers_86BB1E:
    dw UNUSED_InstList_EnemyProjectile_Parameter0_86BACC
    dw UNUSED_InstList_EnemyProjectile_Parameter1_86BAEA
    dw UNUSED_InstList_EnemyProjectile_Parameter2_86BB08


;;; $BB24: Unused. Random buggy code ;;;
UNUSED_RandomBuggyCode_86BB24:
; This code makes no sense
    PHY
    LDY.W UNUSED_EnemyProjectile_86BB50
    LDA.W #$0000 : STA.W EnemyProjectile_InstListPointers,Y
    PLY
    RTS


;;; $BB30: Initialisation AI - enemy projectile $BB50 ;;;
UNUSED_InitAI_EnemyProjectile_86BB30:
;; Parameters:
;;     Y: Enemy projectile index

; Ceres Ridley is the only enemy that uses both $7E:8022 and $7E:8024, but it uses them as flags
; So there's no way of knowing what enemy was supposed to spawn this projectile (if any)
    LDX.W EnemyIndex
    LDA.L $7E8022,X : STA.W EnemyProjectile_XPositions,Y ; ?
    LDA.L $7E8024,X : STA.W EnemyProjectile_YPositions,Y ; ?
    PHY
    LDA.W EnemyProjectile_InitParam0 : ASL : TAY
    LDA.W UNUSED_InstList_Pointers_86BB1E,Y
    PLY
    STA.W EnemyProjectile_InstListPointers,Y
    RTS
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $BB4F: RTS. Pre-instruction - enemy projectile $BB50 ;;;
RTS_86BB4F:
    RTS


if !FEATURE_KEEP_UNREFERENCED
;;; $BB50: Unused. Enemy projectile $BB50 ;;;
UNUSED_EnemyProjectile_86BB50:
    %EnemyProjectile(\
    %initAI(UNUSED_InitAI_EnemyProjectile_86BB30),
    %preInst(RTS_86BB4F),
    %instList(UNUSED_InstList_EnemyProjectile_Parameter0_86BACC),
    %radius(0, 0),
    %properties($0000),
    %hitList($7000),
    %shotList(InstList_EnemyProjectile_Delete))
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $BB5E: Instruction list - enemy projectile $BBC7 (fire arc body) ;;;
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


;;; $BB92: Initialisation AI - enemy projectile $BBC7 (fire arc body) ;;;
InitAI_EnemyProjectile_PuromiBody:
;; Parameters:
;;     Y: Enemy projectile index
    LDX.W EnemyIndex
    LDA.W Enemy.XPosition,X : STA.W EnemyProjectile_XPositions,Y
    LDA.W Enemy.XSubPosition,X : STA.W EnemyProjectile_XSubPositions,Y
    LDA.W Enemy.YPosition,X : STA.W EnemyProjectile_YPositions,Y
    LDA.W Enemy.YSubPosition,X : STA.W EnemyProjectile_YSubPositions,Y
    PHX
    LDA.L Puromi.bodyIndex,X : CLC : ADC.W EnemyIndex : TAX
    TYA : STA.L Puromi.projectileIndex0,X
    TYX
    LDA.W #$0001 : STA.L EnemyProjectileData_CollisionOptions,X
    PLX
    RTS


;;; $BBC6: RTS. Pre-instruction - enemy projectile $BBC7 (fire arc body) ;;;
RTS_86BBC6:
    RTS


;;; $BBC7: Enemy projectile - fire arc body ;;;
EnemyProjectile_Puromi:
    %EnemyProjectile(\
    %initAI(InitAI_EnemyProjectile_PuromiBody),
    %preInst(RTS_86BBC6),
    %instList(InstList_EnemyProjectile_PuromiBody),
    %radius(8, 8),
    %properties($C040),
    %hitList(0),
    %shotList(InstList_EnemyProjectile_Delete))


;;; $BBD5: Instruction list - enemy projectile $BD5A (polyp rock) ;;;
InstList_EnemyProjectile_NorfairLavaquakeRocks:
    dw $0001,EnemyProjSpritemaps_LavaquakeRocks
    dw Instruction_EnemyProjectile_Sleep


;;; $BBDB: Initialisation AI - enemy projectile $BD5A (polyp rock) ;;;
InitAI_EnemyProjectile_NorfairLavaquakeRocks:
;; Parameters:
;;     Y: Enemy projectile index
;;     EnemyProjectile_InitParam0: Initial Y speed table index. Range 0..5Eh
;;     EnemyProjectile_InitParam1: X velocity
    LDA.W #InstList_EnemyProjectile_NorfairLavaquakeRocks : STA.W EnemyProjectile_InstListPointers,Y
    LDA.W #NorfairLavaquakeRocksFunction_Rising : STA.W EnemyProjectile_Var0,Y
    LDA.W EnemyProjectile_InitParam0 : STA.W EnemyProjectile_YVelocity,Y
    LDA.W EnemyProjectile_InitParam1 : STA.W EnemyProjectile_XVelocity,Y
    LDX.W EnemyIndex
    LDA.W Enemy.XPosition,X : STA.W EnemyProjectile_XPositions,Y
    LDA.W Enemy.XSubPosition,X : STA.W EnemyProjectile_XSubPositions,Y
    LDA.W Enemy.YPosition,X : STA.W EnemyProjectile_YPositions,Y
    LDA.W Enemy.YSubPosition,X : STA.W EnemyProjectile_YSubPositions,Y
    RTS


;;; $BC0F: Pre-instruction - enemy projectile $BD5A (polyp rock) ;;;
PreInstruction_EnemyProjectile_NorfairLavaquakeRocks:
;; Parameters:
;;     X: Enemy projectile index
    JSR.W (EnemyProjectile_Var0,X)
    JSR Delete_EnemyProjectile_IfOffScreen
    RTS


;;; $BC16: Polyp rock function - rising ;;;
NorfairLavaquakeRocksFunction_Rising:
;; Parameters:
;;     X: Enemy projectile index
    LDA.W EnemyProjectile_YVelocity,X : SEC : SBC.W #$0002 : STA.W EnemyProjectile_YVelocity,X : BPL .lessThanZero
    STZ.W EnemyProjectile_YVelocity,X
    LDA.W #NorfairLavaquakeRocks_Falling : STA.W EnemyProjectile_Var0,X
    BRA .return

  .lessThanZero:
    LDA.W #$0002 : STA.B DP_Temp12

  .loop:
    PHX
    LDA.W EnemyProjectile_YVelocity,X : CLC : ADC.B DP_Temp12 : DEC : BPL +
    LDA.W #$0000

+   ASL #3 : INC #4 : TAX
    LDA.L CommonEnemyProjectileSpeeds_QuadraticallyIncreasing,X
    PLX
    STA.W EnemyProjectile_Var1,X
    LDA.W EnemyProjectile_YSubPositions,X : CLC : ADC.W EnemyProjectile_Var1,X : BCC +
    INC.W EnemyProjectile_YPositions,X

+   STA.W EnemyProjectile_YSubPositions,X
    PHX
    LDA.W EnemyProjectile_YVelocity,X : CLC : ADC.B DP_Temp12 : DEC : BPL +
    LDA.W #$0000

+   ASL #3 : INC #6 : TAX
    LDA.L CommonEnemyProjectileSpeeds_QuadraticallyIncreasing,X
    PLX
    STA.W EnemyProjectile_Var1,X
    LDA.W EnemyProjectile_YPositions,X : CLC : ADC.W EnemyProjectile_Var1,X : STA.W EnemyProjectile_YPositions,X
    DEC.B DP_Temp12 : BNE .loop
    JSR Move_EnemyProjectile_AccordingToXVelocity

  .return:
    RTS


;;; $BC8F: Polyp rock function - falling ;;;
NorfairLavaquakeRocks_Falling:
;; Parameters:
;;     X: Enemy projectile index
    LDA.W EnemyProjectile_YVelocity,X : CLC : ADC.W #$0002 : STA.W EnemyProjectile_YVelocity,X
    CMP.W #$0040 : BMI +
    LDA.W #$0040 : STA.W EnemyProjectile_YVelocity,X

+   LDA.W #$0002 : STA.B DP_Temp12

  .loop:
    PHX
    LDA.W EnemyProjectile_YVelocity,X : SEC : SBC.B DP_Temp12
    INC : ASL #3 : TAX
    LDA.L CommonEnemyProjectileSpeeds_QuadraticallyIncreasing,X
    PLX
    STA.W EnemyProjectile_Var1,X
    LDA.W EnemyProjectile_YSubPositions,X : CLC : ADC.W EnemyProjectile_Var1,X : BCC +
    INC.W EnemyProjectile_YPositions,X

+   STA.W EnemyProjectile_YSubPositions,X
    PHX
    LDA.W EnemyProjectile_YVelocity,X : SEC : SBC.B DP_Temp12
    INC : ASL #3 : INC #2 : TAX
    LDA.L CommonEnemyProjectileSpeeds_QuadraticallyIncreasing,X
    PLX
    STA.W EnemyProjectile_Var1,X
    LDA.W EnemyProjectile_YPositions,X : CLC : ADC.W EnemyProjectile_Var1,X : STA.W EnemyProjectile_YPositions,X
    DEC.B DP_Temp12 : BNE .loop
    JSR Move_EnemyProjectile_AccordingToXVelocity
    RTS


;;; $BCF4: Move enemy projectile according to X velocity ;;;
Move_EnemyProjectile_AccordingToXVelocity:
;; Parameters:
;;     X: Enemy projectile index
    LDA.W EnemyProjectile_XVelocity,X : AND.W #$FF00 : XBA
    JSL Sign_Extend_A
    CLC : ADC.W EnemyProjectile_XPositions,X : STA.W EnemyProjectile_XPositions,X
    LDA.W EnemyProjectile_XVelocity,X : AND.W #$00FF : XBA
    JSL Sign_Extend_A
    CLC : ADC.W EnemyProjectile_XSubPositions,X : BCC +
    INC.W EnemyProjectile_XPositions,X

+   STA.W EnemyProjectile_XSubPositions,X
    RTS


;;; $BD1E: Delete enemy projectile if off screen ;;;
Delete_EnemyProjectile_IfOffScreen:
;; Parameters:
;;     X: Enemy projectile index
    JSR CheckIf_EnemyProjectile_IsOffScreen
    BEQ .return
    LDA.W #$0000 : STA.W EnemyProjectile_ID,X

  .return:
    RTS


;;; $BD2A: Check if enemy projectile is off screen ;;;
CheckIf_EnemyProjectile_IsOffScreen:
;; Parameters:
;;     X: Enemy projectile index
;; Returns:
;;     A: 1 if off-screen, 0 otherwise
    LDA.W EnemyProjectile_XPositions,X : CMP.W Layer1XPosition : BMI .offScreen
    LDA.W Layer1XPosition : CLC : ADC.W #$0100 : CMP.W EnemyProjectile_XPositions,X : BMI .offScreen
    LDA.W EnemyProjectile_YPositions,X : CMP.W Layer1YPosition : BMI .offScreen
    LDA.W Layer1YPosition : CLC : ADC.W #$0100 : CMP.W EnemyProjectile_YPositions,X : BMI .offScreen
    LDA.W #$0000
    RTS

  .offScreen:
    LDA.W #$0001
    RTS


;;; $BD5A: Enemy projectile - polyp rock ;;;
EnemyProjectile_LavaquakeRocks:
    %EnemyProjectile(\
    %initAI(InitAI_EnemyProjectile_NorfairLavaquakeRocks),
    %preInst(PreInstruction_EnemyProjectile_NorfairLavaquakeRocks),
    %instList(InstList_EnemyProjectile_NorfairLavaquakeRocks),
    %radius(2, 2),
    %properties($0010),
    %hitList(0),
    %shotList(InstList_EnemyProjectile_Delete))


;;; $BD68: Instruction list - enemy projectile $BE25 (Shaktool's attack - front circle) ;;;
InstList_EnemyProjectile_ShaktoolsAttack_FrontCircle_0:
    dw $0004,EnemyProjSpritemaps_ShaktoolsAttack
    dw $0004,EnemyProjSpritemaps_ShaktoolsAttack_FrontMiddleCircle

InstList_EnemyProjectile_ShaktoolsAttack_FrontCircle_1:
    dw $0077,EnemyProjSpritemaps_ShaktoolsAttack_FrontCircle
    dw Instruction_EnemyProjectile_GotoY
    dw InstList_EnemyProjectile_ShaktoolsAttack_FrontCircle_1


;;; $BD78: Instruction list - enemy projectile $BE33 (Shaktool's attack - middle circle) ;;;
InstList_EnemyProjectile_ShaktoolsAttack_MiddleCircle_0:
    dw $0006,EnemyProjSpritemaps_ShaktoolsAttack
    dw Instruction_EnemyProjectile_PreInstructionInY
    dw PreInst_EnemyProjectile_ShaktoolsAttack_MiddleBack_Moving
    dw $0004,EnemyProjSpritemaps_ShaktoolsAttack

InstList_EnemyProjectile_ShaktoolsAttack_MiddleCircle_1:
    dw $0077,EnemyProjSpritemaps_ShaktoolsAttack_FrontMiddleCircle
    dw Instruction_EnemyProjectile_GotoY
    dw InstList_EnemyProjectile_ShaktoolsAttack_MiddleCircle_1


;;; $BD8C: Instruction list - enemy projectile $BE41 (Shaktool's attack - back circle) ;;;
InstList_EnemyProjectile_ShaktoolsAttack_BackCircle_0:
    dw $000A,EnemyProjSpritemaps_ShaktoolsAttack
    dw Instruction_EnemyProjectile_PreInstructionInY
    dw PreInst_EnemyProjectile_ShaktoolsAttack_MiddleBack_Moving

InstList_EnemyProjectile_ShaktoolsAttack_BackCircle_1:
    dw $0077,EnemyProjSpritemaps_ShaktoolsAttack
    dw Instruction_EnemyProjectile_GotoY
    dw InstList_EnemyProjectile_ShaktoolsAttack_BackCircle_1


;;; $BD9C: Initialisation AI - enemy projectile $BE33/$BE41 (Shaktool's attack - middle/back circle) ;;;
InitAI_EnemyProjectile_ShaktoolsAttack_Middle_Back:
;; Parameters:
;;     Y: Enemy projectile index
;;     EnemyProjectile_InitParam0: Front circle enemy projectile index
    LDA.W EnemyProjectile_InitParam0 : STA.W EnemyProjectile_Var0,Y
; fallthrough to InitAI_EnemyProjectile_ShaktoolsAttack_Front


;;; $BDA2: Initialisation AI - enemy projectile $BE25 (Shaktool's attack - front circle) ;;;
InitAI_EnemyProjectile_ShaktoolsAttack_Front:
;; Parameters:
;;     Y: Enemy projectile index
    LDX.W EnemyIndex
    LDA.W Enemy.XPosition,X : STA.W EnemyProjectile_XPositions,Y
    LDA.W Enemy.YPosition,X : STA.W EnemyProjectile_YPositions,Y
    LDA.W Enemy.var3,X : AND.W #$00FF : ASL : TAX
    LDA.L SineCosineTables_8bitSine_SignExtended,X : STA.W EnemyProjectile_XVelocity,Y
    LDA.L SineCosineTables_NegativeCosine_SignExtended,X : STA.W EnemyProjectile_YVelocity,Y
    TXA : LSR #5 : TAX
    LDA.W .Xoffset,X : CLC : ADC.W EnemyProjectile_XPositions,Y : STA.W EnemyProjectile_XPositions,Y
    LDA.W .Yoffset,X : CLC : ADC.W EnemyProjectile_YPositions,Y : STA.W EnemyProjectile_YPositions,Y
    RTS

  .Xoffset:
    dw $0000,$000C,$0010,$000C,$0000,$FFF4,$FFF0,$FFF4

  .Yoffset:
    dw $FFF0,$FFF4,$0000,$000C,$0010,$000C,$0000,$FFF4


;;; $BE03: Pre-instruction - enemy projectile $BE25 (Shaktool's attack - front circle) ;;;
PreInstruction_EnemyProjectile_ShaktoolsAttack_Front:
;; Parameters:
;;     X: Enemy projectile index
    JSR Move_EnemyProjectile_Horizontally
    BCS .delete
    JSR Move_EnemyProjectile_Vertically
    BCS .delete
    RTS


  .delete:
    STZ.W EnemyProjectile_ID,X
    RTS


;;; $BE12: Pre-instruction - Shaktool's attack - middle/back circle - moving ;;;
PreInst_EnemyProjectile_ShaktoolsAttack_MiddleBack_Moving:
;; Parameters:
;;     X: Enemy projectile index
    LDY.W EnemyProjectile_Var0,X
    LDA.W EnemyProjectile_ID,Y : BEQ .delete
    JSR Move_EnemyProjectile_Horizontally
    JSR Move_EnemyProjectile_Vertically
    RTS

  .delete:
    STZ.W EnemyProjectile_ID,X
    RTS


;;; $BE25: Enemy projectiles - Shaktool's attack ;;;
EnemyProjectile_ShaktoolFrontCircle:
    %EnemyProjectile(\
    %initAI(InitAI_EnemyProjectile_ShaktoolsAttack_Front),
    %preInst(PreInstruction_EnemyProjectile_ShaktoolsAttack_Front),
    %instList(InstList_EnemyProjectile_ShaktoolsAttack_FrontCircle_0),
    %radius(4, 4),
    %properties($000A),
    %hitList(0),
    %shotList(InstList_EnemyProjectile_Delete))

EnemyProjectile_ShaktoolMiddleCircle:
    %EnemyProjectile(\
    %initAI(InitAI_EnemyProjectile_ShaktoolsAttack_Middle_Back),
    %preInst(RTS_8684FB),
    %instList(InstList_EnemyProjectile_ShaktoolsAttack_MiddleCircle_0),
    %radius(4, 4),
    %properties($2000),
    %hitList(0),
    %shotList(InstList_EnemyProjectile_Delete))

EnemyProjectile_ShaktoolBackCircle:
    %EnemyProjectile(\
    %initAI(InitAI_EnemyProjectile_ShaktoolsAttack_Middle_Back),
    %preInst(RTS_8684FB),
    %instList(InstList_EnemyProjectile_ShaktoolsAttack_BackCircle_0),
    %radius(4, 4),
    %properties($2000),
    %hitList(0),
    %shotList(InstList_EnemyProjectile_Delete))


;;; $BE4F: Initialisation AI - enemy projectile $C17E (Mother Brain's room turrets) ;;;
InitAI_EnemyProjectile_MotherBrainsTurrets:
;; Parameters:
;;     Y: Enemy projectile index
;;     EnemyProjectile_InitParam0: Index. Range 0..Bh
    LDA.W #$0400 : STA.W EnemyProjectile_GraphicsIndices,Y
    LDA.W EnemyProjectile_InitParam0 : ASL : TAX
    LDA.W .directionIndices,X : ORA.W #$0100 : STA.W EnemyProjectile_YSubPositions,Y
    PHX
    AND.W #$00FF : ASL : TAX
    LDA.W .InstListPointers,X : STA.W EnemyProjectile_InstListPointers,Y
    PLX
    LDA.W .Xpositions,X : STA.W EnemyProjectile_XPositions,Y
    LDA.W .Ypositions,X : STA.W EnemyProjectile_YPositions,Y
    LDA.W .allowedRotationPointers,X : STA.W EnemyProjectile_XSubPositions,Y
    TYX
    JSR Set_Rotation_Timer
    JMP Set_Cooldown_Timer

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


;;; $BEF9: Mother's Brain room turret allowed rotations ;;;
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


;;; $BF59: Initialisation AI - enemy projectile $C18C (Mother Brain's room turret bullets) ;;;
InitAI_EnemyProjectile_MotherBrainsTurretBullets:
;; Parameters:
;;     Y: Enemy projectile index
;;     EnemyProjectile_InitParam0: Mother Brain's room turrets enemy projectile index
    LDA.W #$0000 : STA.W EnemyProjectile_Var1,Y
    LDA.W #$0400 : STA.W EnemyProjectile_GraphicsIndices,Y
    LDX.W EnemyProjectile_InitParam0
    LDA.W EnemyProjectile_YSubPositions,X : AND.W #$00FF : ASL : STA.W EnemyProjectile_Var0,Y
    TAX
    LDA.W .Xoffset,X : STA.B DP_Temp12
    LDA.W .Yoffset,X : STA.B DP_Temp14
    LDA.W .Xvelocity,X : STA.W EnemyProjectile_XVelocity,Y
    LDA.W .Yvelocity,X : STA.W EnemyProjectile_YVelocity,Y
    LDX.W EnemyProjectile_InitParam0
    LDA.W EnemyProjectile_XPositions,X : CLC : ADC.B DP_Temp12 : STA.W EnemyProjectile_XPositions,Y
    LDA.W EnemyProjectile_YPositions,X : CLC : ADC.B DP_Temp14 : STA.W EnemyProjectile_YPositions,Y
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


;;; $BFDF: Pre-instruction - enemy projectile $C17E (Mother Brain's room turrets) ;;;
PreInstruction_EnemyProjectile_MotherBrainsTurrets:
    JSR Check_If_Turret_Is_On_Screen
    BCC .onScreen
    LDA.L MotherBrainBody.deleteTurretsRinkasFlag : BNE .deleteOffScreen
    RTS

  .onScreen:
    LDA.L MotherBrainBody.deleteTurretsRinkasFlag : BNE .deleteOnScreen
    DEC.W EnemyProjectile_XVelocity,X : BNE .nonZeroTimer
    PHX
    JSR Set_Rotation_Timer
    JSR Set_Next_Turret_Direction
    PLY
    LDA.W EnemyProjectile_YSubPositions,Y : AND.W #$00FF : ASL : TAX
    LDA.W .InstListPointers,X : STA.W EnemyProjectile_InstListPointers,Y
    LDA.W #$0001 : STA.W EnemyProjectile_InstructionTimers,Y
    TYX

  .nonZeroTimer:
    DEC.W EnemyProjectile_YVelocity,X : BNE .return
    JSR Set_Cooldown_Timer
    LDY.W #EnemyProjectile_MotherBrainTurretBullets
    TXA
    JSL SpawnEnemyProjectileY_ParameterA_RoomGraphics

  .return:
    RTS

  .deleteOffScreen:
    STZ.W EnemyProjectile_ID,X
    RTS

  .deleteOnScreen:
    STZ.W EnemyProjectile_ID,X
    LDA.W EnemyProjectile_XPositions,X : STA.B DP_Temp12
    LDA.W EnemyProjectile_YPositions,X : STA.B DP_Temp14
    LDA.W #$000C
    LDY.W #EnemyProjectile_MiscDust
    JSL SpawnEnemyProjectileY_ParameterA_RoomGraphics
    RTS

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


;;; $C050: Set next turret direction ;;;
Set_Next_Turret_Direction:
;; Parameters:
;;     X: Enemy projectile index
    SEP #$20
    LDA.W EnemyProjectile_YSubPositions,X : CLC : ADC.W EnemyProjectile_YSubPositions+1,X
    AND.B #$07 : STA.B DP_Temp14
    REP #$20
    AND.W #$0007 : TAY
    LDA.W EnemyProjectile_XSubPositions,X : STA.B DP_Temp12
    LDA.B (DP_Temp12),Y : AND.W #$00FF : BEQ +
    SEP #$20
    LDA.B DP_Temp14 : STA.W EnemyProjectile_YSubPositions,X
    REP #$20
    RTS

+   SEP #$20
    LDA.W EnemyProjectile_YSubPositions+1,X : EOR.B #$FF : INC : STA.W EnemyProjectile_YSubPositions+1,X
    CLC : ADC.W EnemyProjectile_YSubPositions,X : STA.W EnemyProjectile_YSubPositions,X
    REP #$20
    RTS


;;; $C08E: Set rotation timer ;;;
Set_Rotation_Timer:
;; Parameters:
;;     X: Enemy projectile index
    JSL GenerateRandomNumber
    AND.W #$00FF : CMP.W #$0020 : BPL .setTimer
    LDA.W #$0020

  .setTimer:
    STA.W EnemyProjectile_XVelocity,X
    RTS


;;; $C0A1: Set cooldown timer ;;;
Set_Cooldown_Timer:
;; Parameters:
;;     X: Enemy projectile index
    JSL GenerateRandomNumber
    AND.W #$00FF : CMP.W #$0080 : BPL .setTimer
    LDA.W #$0080

  .setTimer:
    STA.W EnemyProjectile_YVelocity,X
    RTS


;;; $C0B4: Check if turret is on-screen ;;;
Check_If_Turret_Is_On_Screen:
;; Parameters:
;;     X: Enemy projectile index
;; Returns:
;;     Carry: Clear if on-screen, set otherwise
    LDA.W EnemyProjectile_YPositions,X : BMI .returnOffScreen
    CLC : ADC.W #$0010
    SEC : SBC.W Layer1YPosition : BMI .returnOffScreen
    CMP.W #$0100 : BPL .returnOffScreen
    LDA.W EnemyProjectile_XPositions,X : BMI .returnOffScreen
    CLC : ADC.W #$0004
    SEC : SBC.W Layer1XPosition : BMI .returnOffScreen
    CMP.W #$0108 : BPL .returnOffScreen
    CLC
    RTS

  .returnOffScreen:
    SEC
    RTS


;;; $C0E0: Pre-instruction - enemy projectile $C18C (Mother Brain's room turret bullets) ;;;
PreInstruction_EnemyProjectile_MotherBrainsTurretBullets:
;; Parameters:
;;     X: Enemy projectile index
    LDA.W EnemyProjectile_Properties,X : EOR.W #$8000 : STA.W EnemyProjectile_Properties,X
    JSR Move_EnemyProjectile_AccordingToVelocity
    LDA.W EnemyProjectile_YPositions,X : TAY
    LDA.W EnemyProjectile_XPositions,X : TAX
    JSL CheckForCollisionWithNonAirBlock
    BCC .return
    LDX.W EnemyProjectile_Index
    STZ.W EnemyProjectile_ID,X

  .return:
    RTS


;;; $C101: Instruction list - pointing left ;;;
InstList_EnemyProjectile_MotherBrainsTurret_Left:
    dw $0001,EnemyProjSpritemaps_MotherBrainsTurrets_Left
    dw Instruction_EnemyProjectile_Sleep


;;; $C107: Instruction list - pointing down-left ;;;
InstList_EnemyProjectile_MotherBrainsTurret_DownLeft:
    dw $0001,EnemyProjSpritemaps_MotherBrainsTurrets_DownLeft
    dw Instruction_EnemyProjectile_Sleep


;;; $C10D: Instruction list - pointing down ;;;
InstList_EnemyProjectile_MotherBrainsTurret_Down:
    dw $0001,EnemyProjSpritemaps_MotherBrainsTurrets_Down
    dw Instruction_EnemyProjectile_Sleep


;;; $C113: Instruction list - pointing down-right ;;;
InstList_EnemyProjectile_MotherBrainsTurret_DownRight:
    dw $0001,EnemyProjSpritemaps_MotherBrainsTurrets_DownRight
    dw Instruction_EnemyProjectile_Sleep


;;; $C119: Instruction list - pointing right ;;;
InstList_EnemyProjectile_MotherBrainsTurret_Right:
    dw $0001,EnemyProjSpritemaps_MotherBrainsTurrets_Right
    dw Instruction_EnemyProjectile_Sleep


;;; $C11F: Instruction list - pointing up-right ;;;
InstList_EnemyProjectile_MotherBrainsTurret_UpRight:
    dw $0001,EnemyProjSpritemaps_MotherBrainsTurrets_UpRight
    dw Instruction_EnemyProjectile_Sleep


;;; $C125: Instruction list - pointing up ;;;
InstList_EnemyProjectile_MotherBrainsTurret_Up:
    dw $0001,EnemyProjSpritemaps_MotherBrainsTurrets_Up
    dw Instruction_EnemyProjectile_Sleep


;;; $C12B: Instruction list - pointing up-left ;;;
InstList_EnemyProjectile_MotherBrainsTurret_UpLeft:
    dw $0001,EnemyProjSpritemaps_MotherBrainsTurrets_UpLeft
    dw Instruction_EnemyProjectile_Sleep


;;; $C131: Instruction list - enemy projectile $C18C (Mother Brain's room turret bullets) ;;;
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


;;; $C173: Instruction - go to [[Y] + [enemy projectile direction index]] ;;;
Instruction_EnemyProjectile_MotherBrainsTurretBullets_GotoY:
;; Parameters:
;;     X: Enemy projectile index
;;     Y: Pointer to after this instruction
;; Returns:
;;     Y: Pointer to next instruction
    TYA : CLC : ADC.W EnemyProjectile_Var0,X : TAY
    LDA.W $0000,Y : TAY
    RTS


;;; $C17E: Enemy projectiles - Mother Brain's room turrets ;;;
EnemyProjectile_MotherBrainTurret:
    %EnemyProjectile(\
    %initAI(InitAI_EnemyProjectile_MotherBrainsTurrets),
    %preInst(PreInstruction_EnemyProjectile_MotherBrainsTurrets),
    %instList(InstList_EnemyProjectile_MotherBrainsTurret_Down),
    %radius(0, 0),
    %properties($6000),
    %hitList(0),
    %shotList(InstList_EnemyProjectile_Delete))

EnemyProjectile_MotherBrainTurretBullets:
    %EnemyProjectile(\
    %initAI(InitAI_EnemyProjectile_MotherBrainsTurretBullets),
    %preInst(PreInstruction_EnemyProjectile_MotherBrainsTurretBullets),
    %instList(InstList_EnemyProj_MotherBrainsTurretBullets_GotoDirection),
    %radius(3, 3),
    %properties($4014),
    %hitList(InstList_EnemyProjectile_Shot_MotherBrainTurretBullets),
    %shotList(InstList_EnemyProjectile_Shot_MotherBrainTurretBullets))


;;; $C19A: Shot/touch instruction list - enemy projectile $C18C (Mother Brain's room turret bullets) ;;;
InstList_EnemyProjectile_Shot_MotherBrainTurretBullets:
    dw Instruction_EnemyProjectile_UsePalette0
    dw Instruction_EnemyProjectile_ClearPreInstruction
    dw $0008,EnemyProjSpritemaps_Common_Smoke_0
    dw $0008,EnemyProjSpritemaps_Common_Smoke_1
    dw $0008,EnemyProjSpritemaps_Common_Smoke_2
    dw $0008,EnemyProjSpritemaps_Common_Smoke_3
    dw $0020,EnemyProjSpritemaps_MotherBrainsTurretBullets
    dw Instruction_EnemyProjectile_Delete


;;; $C1B4: Instruction - use palette 0 ;;;
Instruction_EnemyProjectile_UsePalette0:
;; Parameters:
;;     X: Enemy projectile index
    STZ.W EnemyProjectile_GraphicsIndices,X
    RTS


;;; $C1B8: Check for bomb collision with rectangle ;;;
Check_for_Bomb_Collision_with_Rectangle:
;; Parameters:
;;     $12: Rectangle centre X position
;;     $14: Rectangle centre Y position
;;     $16: Rectangle X radius
;;     $18: Rectangle Y radius
;; Returns:
;;     Carry: Set if collision, clear otherwise

; Used only by Mother Brain's bomb / bomb collision detection
    LDA.W SamusProjectile_BombCounter : BNE .bombActive
    CLC
    RTS

  .bombActive:
    LDY.W #$000A

  .loop:
    LDA.W SamusProjectile_Types,Y : AND.W #$0F00 : CMP.W #$0500 : BNE .next
    LDA.W SamusProjectile_Variables,Y : BNE .next
    LDA.W SamusProjectile_XPositions,Y : SEC : SBC.B DP_Temp12 : BPL +
    EOR.W #$FFFF : INC

+   SEC : SBC.W SamusProjectile_XRadii,Y : BCC +
    CMP.B DP_Temp16 : BCS .next

+   LDA.W SamusProjectile_YPositions,Y : SEC : SBC.B DP_Temp14 : BPL +
    EOR.W #$FFFF : INC

+   SEC : SBC.W SamusProjectile_YRadii,Y : BCC .returnCollision
    CMP.B DP_Temp18 : BCC .returnCollision

  .next:
    INY #2 : CPY.W #$0014 : BMI .loop
    CLC
    RTS

  .returnCollision:
    SEC
    RTS


;;; $C209: Check for enemy collision with rectangle ;;;
Check_for_Enemy_Collision_with_Rectangle:
;; Parameters:
;;     X: Enemy index
;;     $12: Rectangle centre X position
;;     $14: Rectangle centre Y position
;;     $16: Rectangle X radius
;;     $18: Rectangle Y radius
;; Returns:
;;     Carry: Set if collision, clear otherwise
    LDA.W Enemy.XPosition,X : SEC : SBC.B DP_Temp12 : BPL +
    EOR.W #$FFFF : INC

+   SEC : SBC.W Enemy.XHitboxRadius,X : BCC +
    CMP.B DP_Temp16 : BCS .returnNoCollision

+   LDA.W Enemy.YPosition,X : SEC : SBC.B DP_Temp14 : BPL +
    EOR.W #$FFFF : INC

+   SEC : SBC.W Enemy.YHitboxRadius,X : BCC .returnCollision
    CMP.B DP_Temp18 : BCC .returnCollision

  .returnNoCollision:
    CLC
    RTS

  .returnCollision:
    SEC
    RTS


;;; $C239: Check for collision with Samus ;;;
Check_for_Collision_with_Samus:
;; Parameters:
;;     X: Enemy projectile index

; After executing $C3E9:
;     $12: Enemy projectile centre X position
;     $14: Enemy projectile centre Y position
;     $16: Enemy projectile X radius
;     $18: Enemy projectile Y radius
    JSR Setup_Variables_for_EnemyProjectile_Collision_Detection
    LDA.W SamusXPosition : SEC : SBC.B DP_Temp12 : BPL +
    EOR.W #$FFFF : INC

+   SEC : SBC.W SamusXRadius : BCC +
    CMP.B DP_Temp16 : BCS .returnNoCollision

+   LDA.W SamusYPosition : SEC : SBC.B DP_Temp14 : BPL +
    EOR.W #$FFFF : INC

+   SEC : SBC.W SamusYRadius : BCC .returnCollision
    CMP.B DP_Temp18 : BCC .returnCollision

  .returnNoCollision:
    CLC
    RTS

  .returnCollision:
    SEC
    RTS


;;; $C26C: Calculate X velocity from speed and angle ;;;
CalculateXVelocityFromSpeedAndAngle:
;; Parameters:
;;     A: Speed
;;     $12: Angle. Origin = down, positive direction = anti-clockwise
;; Returns:
;;     A: X velocity
    STA.B DP_Temp26
    LDA.B DP_Temp12
    BRA Math_86C27A


;;; $C272: Calculate Y velocity from speed and angle ;;;
CalculateYVelocityFromSpeedAndAngle:
;; Parameters:
;;     A: Speed
;;     $12: Angle. Origin = down, positive direction = anti-clockwise
;; Returns:
;;     A: Y velocity
    STA.B DP_Temp26
    LDA.B DP_Temp12 : CLC : ADC.W #$0040
; fallthrough to Math_86C27A


;;; $C27A: A = [$26] * sin([A] * pi / 80h) ;;;
Math_86C27A:
;; Parameters:
;;     A: Angle
;;     $26: Radius
;; Returns:
;;     A: Sine component
    ASL : AND.W #$01FE : TAX
    LDA.L SineCosineTables_8bitSine_SignExtended,X : STA.B DP_Temp2E : BPL +
    EOR.W #$FFFF : INC

+   STA.B DP_Temp28
    JSR Math_16bitUnsignedMultiplication_86C29B
    LDA.B DP_Temp2B : BIT.B DP_Temp2E : BPL .return
    EOR.W #$FFFF : INC

  .return:
    RTL


;;; $C29B: $2A = [$26] * [$28] (16-bit unsigned multiplication) ;;;
Math_16bitUnsignedMultiplication_86C29B:
;; Parameters:
;;     $26: Multiplicand
;;     $28: Multiplicand
;; Returns:
;;     $2A..2D: 32-bit result

; Compared to $8B:85EE, this routine puts the words of the result in (the more useful) little endian order.
; Compared to $80:82D6, this routine produces correct results in all cases

; Let:
;     $26 = a + b * 100h
;     $28 = c + d * 100h
    REP #$20 : SEP #$10
    LDX.B DP_Temp26 : STX.W $4202
    LDX.B DP_Temp28 : STX.W $4203
    XBA : NOP
    LDA.W $4216 : STA.B DP_Temp2A
    LDX.B DP_Temp27 : STX.W $4202
    LDX.B DP_Temp29 : STX.W $4203
    XBA : NOP
    LDX.W $4216 : STX.B DP_Temp2C
    LDY.W $4217
    LDX.B DP_Temp27 : STX.W $4202
    LDX.B DP_Temp28 : STX.W $4203
    LDA.B DP_Temp2B : CLC : ADC.W $4216 : STA.B DP_Temp2B : BCC +
    INY

+   LDX.B DP_Temp26 : STX.W $4202
    LDX.B DP_Temp29 : STX.W $4203
    LDA.B DP_Temp2B : CLC : ADC.W $4216 : STA.B DP_Temp2B : BCC +
    INY

+   STY.B DP_Temp2D
    REP #$10
    RTS


;;; $C2F3: Initialisation AI - enemy projectile $CB4B (Mother Brain's blue ring lasers) ;;;
InitAI_EnemyProjectile_MotherBrainsOnionRings:
;; Parameters:
;;     Y: Enemy projectile index
;;     EnemyProjectile_InitParam0: Angle. Anti-clockwise where 0 = down

; The initial delay is good for some marginal telegraphing, but also gives time for the next ring to spawn under the current one
    TYX
    LDA.W #$0008 : STA.W EnemyProjectile_Var0,X
    STZ.W EnemyProjectile_Var1,X
    LDA.W #$0400 : STA.W EnemyProjectile_GraphicsIndices,X
    LDA.W EnemyProjectile_InitParam0 : STA.B DP_Temp12
    LDA.W #$0450
    PHX
    JSL CalculateXVelocityFromSpeedAndAngle
    PLX
    STA.W EnemyProjectile_XVelocity,X
    LDA.W #$0450
    PHX
    JSL CalculateYVelocityFromSpeedAndAngle
    PLX
    STA.W EnemyProjectile_YVelocity,X
; fallthrough to Move_to_OnionRing_Spawn_Position


;;; $C320: Move to blue ring spawn position ;;;
Move_to_OnionRing_Spawn_Position:
;; Parameters:
;;     X: Enemy projectile index
    LDA.W Enemy[1].XPosition : CLC : ADC.W #$000A : STA.W EnemyProjectile_XPositions,X
    LDA.W Enemy[1].YPosition : CLC : ADC.W #$0010 : STA.W EnemyProjectile_YPositions,X
    RTS


;;; $C335: Pre-instruction - enemy projectile $CB4B (Mother Brain's blue ring lasers) ;;;
PreInstruction_EnemyProjectile_MotherBrainsOnionRings:
;; Parameters:
;;     X: Enemy projectile index
    LDA.W EnemyProjectile_Var0,X : BEQ .active
    DEC.W EnemyProjectile_Var0,X
    JMP Move_to_OnionRing_Spawn_Position

  .return:
    RTS

  .active:
    JSR Move_EnemyProjectile_AccordingToVelocity
    JSR Check_for_Collision_with_BabyMetroid
    BCS Handle_OnionRing_Collision_with_BabyMetroid
    JSR Check_for_Collision_with_Samus
    BCS Handle_OnionRing_Collision_with_Samus
    JSR Check_for_OnionRing_Collision_with_Room
    BCC .return
    JMP Handle_OnionRing_Collision_with_Room


;;; $C356: Handle blue ring collision with Samus ;;;
Handle_OnionRing_Collision_with_Samus:
;; Parameters:
;;     X: Enemy projectile index
    JSR OnionRing_Contact_Explosion
    LDA.W #$0050
; fallthrough to Hurt_Samus


;;; $C35C: Hurt Samus ;;;
Hurt_Samus:
;; Parameters:
;;     A: Damage
;;     X: Enemy projectile index

; Called only by UNUSED_DoFireballDamageToSamus_TurnIntoSmoke_869442
    JSL Suit_Damage_Division
    JSL Deal_A_Damage_to_Samus
    LDA.W #$0060 : STA.W SamusInvincibilityTimer
    LDA.W #$0005 : STA.W SamusKnockbackTimer
    LDY.W #$0000
    LDA.W SamusXPosition : SEC : SBC.W EnemyProjectile_XPositions,X : BMI .left
    INY

  .left:
    STY.W KnockbackXDirection
    RTS


;;; $C381: Handle blue ring collision with Shitroid ;;;
Handle_OnionRing_Collision_with_BabyMetroid:
;; Parameters:
;;     X: Enemy projectile index
    LDA.L MotherBrainBody.playBabyMetroidCryFlag : INC : STA.L MotherBrainBody.playBabyMetroidCryFlag
    JSR OnionRing_Contact_Explosion
    LDA.L MotherBrainBody.BabyMetroidEnemyIndex : TAX
    LDA.W #$0010 : STA.L MotherBrainBody.disableAttacks,X
    LDA.W Enemy.health,X : SEC : SBC.W #$0050 : BPL .storeHealth
    LDA.W #$0000

  .storeHealth:
    STA.W Enemy.health,X
    RTS


;;; $C3A9: Check for collision with Shitroid ;;;
Check_for_Collision_with_BabyMetroid:
;; Parameters:
;;     X: Enemy projectile index
;; Returns:
;;     Carry: Set if collision, clear otherwise
    CLC
    LDA.L MotherBrainBody.BabyMetroidEnemyIndex : BEQ .return
    TAY
    LDA.W Enemy.health,Y : BEQ .delete
    PHX
    JSR Setup_Variables_for_EnemyProjectile_Collision_Detection
    LDA.L MotherBrainBody.BabyMetroidEnemyIndex : TAX
    JSR Check_for_Enemy_Collision_with_Rectangle
    PLX

  .return:
    RTS

  .delete:
    PLA
    STZ.W EnemyProjectile_ID,X
    RTS


;;; $C3C9: Check for blue ring collision with room ;;;
Check_for_OnionRing_Collision_with_Room:
;; Parameters:
;;     X: Enemy projectile index
;; Returns:
;;     Carry: Set if collision, clear otherwise
    LDA.W EnemyProjectile_YPositions,X : CMP.W #$0020 : BMI .returnCollision
    CMP.W #$00D8 : BCS .returnCollision
    LDA.W EnemyProjectile_XPositions,X : BMI .returnCollision
    SEC : SBC.W Layer1XPosition : BMI .returnCollision
    CMP.W #$00F8 : BPL .returnCollision
    RTS

  .returnCollision:
    SEC
    RTS


;;; $C3E9: Set up variables for enemy projectile collision detection ;;;
Setup_Variables_for_EnemyProjectile_Collision_Detection:
;; Parameters:
;;     X: Enemy projectile index
;; Returns:
;;     $12: Enemy projectile centre X position
;;     $14: Enemy projectile centre Y position
;;     $16: Enemy projectile X radius
;;     $18: Enemy projectile Y radius
    LDA.W EnemyProjectile_XPositions,X : STA.B DP_Temp12
    LDA.W EnemyProjectile_YPositions,X : STA.B DP_Temp14
    LDA.W EnemyProjectile_Radii,X : AND.W #$00FF : STA.B DP_Temp16
    LDA.W EnemyProjectile_Radii+1,X : AND.W #$00FF : STA.B DP_Temp18
    RTS


;;; $C404: Handle blue ring collision with room ;;;
Handle_OnionRing_Collision_with_Room:
;; Parameters:
;;     X: Enemy projectile index
    LDA.W #$000A : STA.W EarthquakeTimer
    LDA.W #$0005 : STA.W EarthquakeType
; fallthrough to OnionRing_Contact_Explosion


;;; $C410: Blue ring contact explosion ;;;
OnionRing_Contact_Explosion:
;; Parameters:
;;     X: Enemy projectile index
    STZ.W EnemyProjectile_ID,X
    LDA.W EnemyProjectile_XPositions,X : STA.B DP_Temp12
    LDA.W EnemyProjectile_YPositions,X : STA.B DP_Temp14
    LDA.W #$0003
    LDY.W #EnemyProjectile_MiscDust
    JSL SpawnEnemyProjectileY_ParameterA_RoomGraphics
    LDA.W #$0013
    JSL QueueSound_Lib3_Max6
; fallthrough to Instruction_EnemyProjectile_UsePalette0_duplicate


;;; $C42E: Instruction - use palette 0 ;;;
Instruction_EnemyProjectile_UsePalette0_duplicate:
;; Parameters:
;;     X: Enemy projectile index
    STZ.W EnemyProjectile_GraphicsIndices,X
    RTS


;;; $C432: Instruction list - enemy projectile $CB4B (Mother Brain's blue ring lasers) ;;;
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


;;; $C464: Hit instruction list - enemy projectile $CB4B (Mother Brain's blue ring lasers) ;;;
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


;;; $C482: Initialisation AI - enemy projectile $CB59 (Mother Brain's bomb) ;;;
InitAI_EnemyProjectile_MotherBrainsBomb:
;; Parameters:
;;     Y: Enemy projectile index
;;     EnemyProjectile_InitParam0: Number of afterburn enemy projectiles
    SEP #$20
    LDA.W EnemyProjectile_InitParam0 : STA.W EnemyProjectile_XSubPositions,Y
    REP #$20
    LDA.W #$0100 : STA.W EnemyProjectile_YVelocity,Y
    LDA.W #$00E0 : STA.W EnemyProjectile_XVelocity,Y
    LDA.W Enemy[1].XPosition : CLC : ADC.W #$000C : STA.W EnemyProjectile_XPositions,Y
    LDA.W Enemy[1].YPosition : CLC : ADC.W #$0010 : STA.W EnemyProjectile_YPositions,Y
    LDA.W #$0400 : STA.W EnemyProjectile_GraphicsIndices,Y
    LDA.W #$0070 : STA.W EnemyProjectile_Var0,Y
    LDA.W #$0000 : STA.W EnemyProjectile_Var1,Y
    LDA.L MotherBrainBody.bombCounter : INC : STA.L MotherBrainBody.bombCounter
    RTS


;;; $C4C8: Pre-instruction - enemy projectile $CB59 (Mother Brain's bomb) ;;;
PreInstruction_EnemyProjectile_MotherBrainsBomb:
;; Parameters:
;;     X: Enemy projectile index
    JSR MotherBrainsBomb_Bomb_Collision_Detection
    LDA.W EnemyProjectile_Var1,X : BNE .haveBounced
    LDA.W EnemyProjectile_XVelocity,X : BPL +
    EOR.W #$FFFF : INC

+   SEC : SBC.W #$0002 : BPL +
    LDA.W #$0000

+   BIT.W EnemyProjectile_XVelocity,X : BPL +
    EOR.W #$FFFF : INC

+   STA.W EnemyProjectile_XVelocity,X
    LDA.W #$0007
    JSR Move_MotherBrains_Bomb
    BCC .return

  .bounced:
    INC.W EnemyProjectile_Var1,X : INC.W EnemyProjectile_Var1,X

  .return:
    RTS

  .haveBounced:
    LDY.W EnemyProjectile_Var1,X
    LDA.W .Yaccelerations,Y : BEQ .delete
    JSR Move_MotherBrains_Bomb
    BCS .bounced
    RTS

  .delete:
    STZ.W EnemyProjectile_XVelocity,X : STZ.W EnemyProjectile_YVelocity,X
    LDA.L MotherBrainBody.bombCounter : DEC : STA.L MotherBrainBody.bombCounter
    STZ.W EnemyProjectile_ID,X
    LDA.W EnemyProjectile_XPositions,X : STA.B DP_Temp12
    LDA.W EnemyProjectile_YPositions,X : STA.B DP_Temp14
    LDA.W EnemyProjectile_XSubPositions,X : AND.W #$00FF
    LDY.W #EnemyProjectile_RidleyHorizontalAfterburn_Center
    JSL SpawnEnemyProjectileY_ParameterA_RoomGraphics
    LDA.W EnemyProjectile_XPositions,X : STA.B DP_Temp12
    LDA.W EnemyProjectile_YPositions,X : STA.B DP_Temp14
    LDA.W #$0003
    LDY.W #EnemyProjectile_MiscDust
    JSL SpawnEnemyProjectileY_ParameterA_RoomGraphics
    LDA.W #$0013
    JSL QueueSound_Lib3_Max6
    RTS

  .Yaccelerations:
; (1/100h px/frame^2) indexed by bounce counter
    dw $0007,$0010,$0020,$0040,$0070,$00B0,$00F0,$0130
    dw $0170,$0000


;;; $C564: Mother Brain's bomb / bomb collision detection ;;;
MotherBrainsBomb_Bomb_Collision_Detection:
;; Parameters:
;;     X: Enemy projectile index

; Relies on caller having nothing pushed
    LDA.W EnemyProjectile_XPositions,X : STA.B DP_Temp12
    LDA.W EnemyProjectile_YPositions,X : STA.B DP_Temp14
    LDA.W EnemyProjectile_Radii,X : AND.W #$00FF : STA.B DP_Temp16
    LDA.W EnemyProjectile_Radii,X : XBA : AND.W #$00FF : STA.B DP_Temp18
    JSR Check_for_Bomb_Collision_with_Rectangle
    BCS .collision
    RTS

  .collision:
    PLA
    LDA.L MotherBrainBody.bombCounter : DEC : STA.L MotherBrainBody.bombCounter
    STZ.W EnemyProjectile_XVelocity,X : STZ.W EnemyProjectile_YVelocity,X
    STZ.W EnemyProjectile_ID,X
    LDA.W EnemyProjectile_XPositions,X : STA.B DP_Temp12
    LDA.W EnemyProjectile_YPositions,X : STA.B DP_Temp14
    LDA.W #$0009
    LDY.W #EnemyProjectile_MiscDust
    JSL SpawnEnemyProjectileY_ParameterA_RoomGraphics
    LDA.W EnemyProjectile_XPositions,X : STA.B DP_Temp12
    LDA.W EnemyProjectile_YPositions,X : STA.B DP_Temp14
    LDA.W #EnemyHeaders_MotherBrainHead
    PHX : PHY
    JSL Spawn_Enemy_Drops
    PLY : PLX
    RTS


;;; $C5C2: Move Mother Brain's bomb ;;;
Move_MotherBrains_Bomb:
;; Parameters:
;;     X: Enemy projectile index
;;     A: Y acceleration as 1/100h px/frame^2
;; Returns:
;;     Carry: Set if bounced, otherwise clear
    CLC : ADC.W EnemyProjectile_YVelocity,X : STA.W EnemyProjectile_YVelocity,X
    JSR Move_EnemyProjectile_AccordingToVelocity
    LDA.W EnemyProjectile_XPositions,X : CMP.W #$00F0 : BMI +
    LDA.W EnemyProjectile_XVelocity,X : EOR.W #$FFFF : INC : STA.W EnemyProjectile_XVelocity,X

+   LDA.W EnemyProjectile_YPositions,X : CMP.W #$00D0 : BMI .returnNoBounce
    LDA.W #$00D0 : STA.W EnemyProjectile_YPositions,X
    LDA.W EnemyProjectile_Var0,X : BIT.W EnemyProjectile_XVelocity,X : BPL +
    EOR.W #$FFFF : INC

+   STA.W EnemyProjectile_XVelocity,X
    LDA.W #$FE00 : STA.W EnemyProjectile_YVelocity,X
    SEC
    RTS

  .returnNoBounce:
    CLC
    RTS


;;; $C605: Initialisation AI - enemy projectile $CB67 (Mother Brain's death beam - charging) ;;;
InitAI_EnemyProjectile_MotherBrainRedBeam_Charging:
;; Parameters:
;;     Y: Enemy projectile index
    LDA.W #$0000
    STA.W EnemyProjectile_Var0,Y : STA.W EnemyProjectile_Var1,Y
    STA.W EnemyProjectile_XVelocity,Y : STA.W EnemyProjectile_YVelocity,Y
    STA.W EnemyProjectile_XSubPositions,Y : STA.W EnemyProjectile_YSubPositions,Y
    STA.L MotherBrainBody.deathBeamNextXSubPosition : STA.L MotherBrainBody.deathBeamNextYSubPosition
    LDA.W #$0400 : STA.W EnemyProjectile_GraphicsIndices,Y
    LDA.W Enemy.XPosition : CLC : ADC.W #$0040 : STA.W EnemyProjectile_XPositions,Y
    STA.L MotherBrainBody.deathBeamNextXPosition
    LDA.W SamusXPosition : SEC : SBC.L MotherBrainBody.deathBeamNextXPosition : STA.B DP_Temp12
    LDA.W Enemy.YPosition : CLC : ADC.W #$FFD0 : STA.W EnemyProjectile_YPositions,Y
    STA.L MotherBrainBody.deathBeamNextYPosition
    LDA.W SamusYPosition : SEC : SBC.L MotherBrainBody.deathBeamNextYPosition : STA.B DP_Temp14
    JSL CalculateAngleOf_12_14_Offset
    SEC : SBC.W #$0080
    EOR.W #$FFFF : INC
    AND.W #$00FF : STA.B DP_Temp12 : STA.L MotherBrainBody.deathBeamNextAngle
    LDA.W #$0C00
    JSL CalculateXVelocityFromSpeedAndAngle
    STA.L MotherBrainBody.deathBeamNextXVelocity
    LDA.W #$0C00
    JSL CalculateYVelocityFromSpeedAndAngle
    STA.L MotherBrainBody.deathBeamNextYVelocity
    RTS


;;; $C684: Initialisation AI - enemy projectile $CB75 (Mother Brain's death beam - fired) ;;;
InitAI_EnemyProjectile_MotherBrainRedBeam_Fired:
;; Parameters:
;;     Y: Enemy projectile index
    LDA.L MotherBrainBody.deathBeamNextXPosition : STA.W EnemyProjectile_XPositions,Y
    LDA.L MotherBrainBody.deathBeamNextXSubPosition : STA.W EnemyProjectile_XSubPositions,Y
    LDA.L MotherBrainBody.deathBeamNextYPosition : STA.W EnemyProjectile_YPositions,Y
    LDA.L MotherBrainBody.deathBeamNextYSubPosition : STA.W EnemyProjectile_YSubPositions,Y
    LDA.L MotherBrainBody.deathBeamNextXVelocity : STA.W EnemyProjectile_XVelocity,Y
    LDA.L MotherBrainBody.deathBeamNextYVelocity : STA.W EnemyProjectile_YVelocity,Y
    TYX
    JSR Move_EnemyProjectile_AccordingToVelocity
    LDA.W EnemyProjectile_XPositions,X : STA.L MotherBrainBody.deathBeamNextXPosition
    LDA.W EnemyProjectile_XSubPositions,X : STA.L MotherBrainBody.deathBeamNextXSubPosition
    LDA.W EnemyProjectile_YPositions,X : STA.L MotherBrainBody.deathBeamNextYPosition
    LDA.W EnemyProjectile_YSubPositions,X : STA.L MotherBrainBody.deathBeamNextYSubPosition
    JSL GenerateRandomNumber
    AND.W #$00FF : CLC : ADC.L MotherBrainBody.deathBeamNextAngle : AND.W #$00FF : STA.B DP_Temp12
    JSL GenerateRandomNumber
    AND.W #$0700
    PHX
    JSL CalculateXVelocityFromSpeedAndAngle
    PLX
    STA.W EnemyProjectile_XVelocity,X
    LDA.W RandomNumberSeed : AND.W #$0700
    PHX
    JSL CalculateYVelocityFromSpeedAndAngle
    PLX
    STA.W EnemyProjectile_YVelocity,X
    JSR Move_EnemyProjectile_AccordingToVelocity
    LDA.W EnemyProjectile_YPositions,X : CMP.W #$0022 : BMI .delete
    CMP.W #$00CE : BPL .delete
    LDA.W EnemyProjectile_XPositions,X : CMP.W #$0002 : BMI .delete
    CMP.W #$00EE : BPL .delete
    LDA.W EnemyProjectile_Var0,X : INC : AND.W #$0003 : STA.W EnemyProjectile_Var0,X
    LDA.W #$0000 : STA.W EnemyProjectile_Var1,X
    STA.W EnemyProjectile_XVelocity,X : STA.W EnemyProjectile_YVelocity,X
    RTS

  .delete:
    STZ.W EnemyProjectile_ID,X
    LDA.W EnemyProjectile_XPositions,X : STA.B DP_Temp12
    LDA.W EnemyProjectile_YPositions,X : STA.B DP_Temp14
    LDY.W #EnemyProjectile_MiscDust
    LDA.W #$001D
    JSL SpawnEnemyProjectileY_ParameterA_RoomGraphics
    LDA.W #$0013
    JSL QueueSound_Lib3_Max6
    LDA.W #$000A : STA.W EarthquakeTimer
    LDA.W #$0005 : STA.W EarthquakeType
    RTS

if !FEATURE_KEEP_UNREFERENCED
  .unused:
; Guessing that [enemy projectile EnemyProjectile_Var0] was used to index this table at one point
    dw $0002,$FFFE,$0002,$FFFE,$FFFE,$0002,$FFFE,$0002
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $C76D: RTS. Pre-instruction - enemy projectile $CB67/$CB75 (Mother Brain's death beam) ;;;
RTS_86C76D:
    RTS


;;; $C76E: Instruction list - enemy projectile $CB59 (Mother Brain's bomb) ;;;
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


;;; $C796: Instruction list - enemy projectile $CB67/$CB75 (Mother Brain's death beam) ;;;
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


;;; $C7FB: Spawn Mother Brain's death beam - fired enemy projectile ;;;
Spawn_MotherBrainRedBeam_Fired:
;; Parameters:
;;     X: Enemy projectile index
    PHX : PHY
    LDA.W EnemyProjectile_Var0,X
    LDY.W #EnemyProjectile_MotherBrainRedBeam_Fired
    JSL SpawnEnemyProjectileY_ParameterA_RoomGraphics
    PLY : PLX
    RTL


;;; $C80A: Initialisation AI - enemy projectile $CB83 (Mother Brain's rainbow beam charging) ;;;
InitAI_EnemyProjectile_MotherBrainRainbowBeam_Charging:
;; Parameters:
;;     X: Enemy projectile index
    TYX
    STZ.W EnemyProjectile_GraphicsIndices,X
    STZ.W EnemyProjectile_XVelocity,X : STZ.W EnemyProjectile_YVelocity,X
; fallthrough to PreInst_EnemyProjectile_MotherBrainRainbowBeam_Charging


;;; $C814: Pre-instruction - enemy projectile $CB83 (Mother Brain's rainbow beam charging) ;;;
PreInst_EnemyProjectile_MotherBrainRainbowBeam_Charging:
;; Parameters:
;;     X: Enemy projectile index
    LDA.W Enemy[1].XPosition : CLC : ADC.W #$0000 : STA.W EnemyProjectile_XPositions,X
    LDA.W Enemy[1].YPosition : CLC : ADC.W #$0000 : STA.W EnemyProjectile_YPositions,X
    RTS


;;; $C829: Instruction list - enemy projectile $CB83 (Mother Brain's rainbow beam charging) ;;;
InstList_EnemyProjectile_MotherBrainRainbowBeam_Charging:
    dw $0005,EnemyProjSpritemaps_MotherBrainsRainbowBeamCharging_5
    dw $0005,EnemyProjSpritemaps_MotherBrainsRainbowBeamCharging_4
    dw $0005,EnemyProjSpritemaps_MotherBrainsRainbowBeamCharging_3
    dw $0005,EnemyProjSpritemaps_MotherBrainsRainbowBeamCharging_2
    dw $0005,EnemyProjSpritemaps_MotherBrainsRainbowBeamCharging_1
    dw $0005,EnemyProjSpritemaps_MotherBrainsRainbowBeamCharging_0
    dw Instruction_EnemyProjectile_Delete


;;; $C843: Initialisation AI - enemy projectile $CB91/$CB9F (Mother Brain's drool) ;;;
InitAI_EnemyProjectile_MotherBrainsDrool:
;; Parameters:
;;     Y: Enemy projectile index
;;     EnemyProjectile_InitParam0: Attached position offset index. Range 0..5 (see .Xoffsets)
    TYX
    STZ.W EnemyProjectile_GraphicsIndices,X
    LDA.W EnemyProjectile_InitParam0 : STA.W EnemyProjectile_Var0,X
; fallthrough to PreInstruction_EnemyProjectile_MotherBrainsDrool


;;; $C84D: Pre-instruction - Mother Brain's drool - attached to Mother Brain ;;;
PreInstruction_EnemyProjectile_MotherBrainsDrool:
;; Parameters:
;;     X: Enemy projectile index
    LDA.W EnemyProjectile_Var0,X : ASL #2 : TAY
    LDA.W .Xoffsets,Y : CLC : ADC.W Enemy[1].XPosition : STA.W EnemyProjectile_XPositions,X
    LDA.W .Yoffsets,Y : CLC : ADC.W Enemy[1].YPosition : STA.W EnemyProjectile_YPositions,X
    STZ.W EnemyProjectile_XVelocity,X : STZ.W EnemyProjectile_YVelocity,X
    RTS

; X/Y position offsets
  .Xoffsets:
    dw $0006
  .Yoffsets:
    dw       $0014
    dw $000E,$0012
    dw $0008,$0017
    dw $000A,$0013
    dw $000B,$0019
    dw $000C,$0012


;;; $C886: Pre-instruction - Mother Brain's drool - falling ;;;
PreInstruction_EnemyProjectile_MotherBrainsDrool_Falling:
;; Parameters:
;;     X: Enemy projectile index
    LDA.W EnemyProjectile_YVelocity,X : CLC : ADC.W #$000C : STA.W EnemyProjectile_YVelocity,X
    JSR Move_EnemyProjectile_Vertically_AccordingToVelocity
    CMP.W #$00D7 : BCS .hitFloor
    RTS

  .hitFloor:
    LDA.W EnemyProjectile_YPositions,X : CLC
    ADC.W #$FFFC : STA.W EnemyProjectile_YPositions,X
    LDA.W #InstList_EnemyProjectile_MotherBrainsDrool_HitFloor : STA.W EnemyProjectile_InstListPointers,X
    LDA.W #$0001 : STA.W EnemyProjectile_InstructionTimers,X
    RTS


;;; $C8B0: Instruction list - enemy projectile $CB91/$CB9F (Mother Brain's drool) ;;;
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


;;; $C8D0: Instruction - move down Ch pixels ;;;
Instruction_EnemyProj_MotherBrainsDrool_MoveDownCPixels:
;; Parameters:
;;     X: Enemy projectile index
    LDA.W EnemyProjectile_YPositions,X : CLC
    ADC.W #$000C : STA.W EnemyProjectile_YPositions,X
    RTS


if !FEATURE_KEEP_UNREFERENCED
;;; $C8DB: Unused. Instruction list ;;;
UNUSED_InstList_EnemyProjectile_MotherBrainsDrool_86C8DB:
    dw $000A,EnemyProjSpritemaps_MotherBrainsDrool_2
    dw Instruction_EnemyProjectile_Sleep
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $C8E1: Instruction list - Mother Brain's drool - hit floor ;;;
InstList_EnemyProjectile_MotherBrainsDrool_HitFloor:
    dw Instruction_EnemyProjectile_ClearPreInstruction
    dw $000A,EnemyProjSpritemaps_MotherBrainsDrool_3
    dw $000A,EnemyProjSpritemaps_MotherBrainsDrool_4
    dw $000A,EnemyProjSpritemaps_MotherBrainsDrool_5
    dw $000A,EnemyProjSpritemaps_MotherBrainsDrool_6
    dw Instruction_EnemyProjectile_Delete


;;; $C8F5: Initialisation AI - enemy projectile $CB13 (Mother Brain's death explosion) ;;;
InitAI_EnemyProjectile_MotherBrainsDeathExplosion:
;; Parameters:
;;     Y: Enemy projectile index
;;     EnemyProjectile_InitParam0: Explosion type
;;         0: Small explosion
;;         1: Smoke
;;         2: Big explosion
    TYX
    LDA.W EnemyProjectile_InitParam0 : ASL : TAY
    LDA.W MotherBrainsDeathExplosion_InstListPointers,Y : STA.W EnemyProjectile_InstListPointers,X
    LDA.W #$0001 : STA.W EnemyProjectile_InstructionTimers,X
    STZ.W EnemyProjectile_GraphicsIndices,X
    LDA.B DP_Temp12 : STA.W EnemyProjectile_XVelocity,X
    LDA.B DP_Temp14 : STA.W EnemyProjectile_YVelocity,X
; fallthrough to PreInstruction_EnemyProjectile_MotherBrainsDeathExplosion


;;; $C914: Pre-instruction - enemy projectile $CB13 (Mother Brain's death explosion) ;;;
PreInstruction_EnemyProjectile_MotherBrainsDeathExplosion:
;; Parameters:
;;     X: Enemy projectile index
    LDA.W EnemyProjectile_XVelocity,X : CLC : ADC.W Enemy.XPosition : STA.W EnemyProjectile_XPositions,X
    LDA.W EnemyProjectile_YVelocity,X : CLC : ADC.W Enemy.YPosition : STA.W EnemyProjectile_YPositions,X
    RTS


;;; $C929: Mother Brain's death explosion instruction list pointers ;;;
MotherBrainsDeathExplosion_InstListPointers:
    dw InstList_EnemyProj_MiscDust_3_SmallExplosion
    dw InstList_EnemyProj_MiscDust_C_Smoke
    dw InstList_EnemyProj_MiscDust_1D_BigExplosion


;;; $C92F: Initialisation AI - enemy projectile $CBAD (Mother Brain's rainbow beam explosion) ;;;
InitAI_EnemyProjectile_MotherBrainsRainbowBeamExplosion:
;; Parameters:
;;     Y: Enemy projectile index
    TYX
    STZ.W EnemyProjectile_GraphicsIndices,X
    LDA.B DP_Temp12 : STA.W EnemyProjectile_XVelocity,X
    CLC : ADC.W SamusXPosition : STA.W EnemyProjectile_XPositions,X
    LDA.B DP_Temp14 : STA.W EnemyProjectile_YVelocity,X
    CLC : ADC.W SamusYPosition : STA.W EnemyProjectile_YPositions,X
    RTS


;;; $C94C: Pre-instruction - enemy projectile $CBAD (Mother Brain's rainbow beam explosion) ;;;
PreInstruction_EnemyProj_MotherBrainsRainbowBeamExplosion:
;; Parameters:
;;     X: Enemy projectile index
    LDA.W EnemyProjectile_XVelocity,X : CLC : ADC.W SamusXPosition : STA.W EnemyProjectile_XPositions,X
    LDA.W EnemyProjectile_YVelocity,X : CLC : ADC.W SamusYPosition : STA.W EnemyProjectile_YPositions,X
    RTS


;;; $C961: Initialisation AI - enemy projectile $CB21 (Mother Brain's exploded escape door particles) ;;;
InitAI_EnemyProjectile_MotherBrainExplodedEscapeDoorParticle:
;; Parameters:
;;     Y: Enemy projectile index
;;     EnemyProjectile_InitParam0: Index. Range 0..7. Determines Y offset and Y velocity
    TYX
    STZ.W EnemyProjectile_GraphicsIndices,X
    LDA.W EnemyProjectile_InitParam0 : ASL #2 : TAY
    LDA.W .Xoffsets,Y : CLC : ADC.W #$0010 : STA.W EnemyProjectile_XPositions,X
    LDA.W .Yoffsets,Y : CLC : ADC.W #$0080 : STA.W EnemyProjectile_YPositions,X
    LDA.W .Xvelocities,Y : STA.W EnemyProjectile_XVelocity,X
    LDA.W .Yvelocities,Y : STA.W EnemyProjectile_YVelocity,X
    LDA.W #$0020 : STA.W EnemyProjectile_Var0,X
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


;;; $C9D2: Pre-instruction - enemy projectile $CB21 (Mother Brain's exploded escape door particles) ;;;
PreInst_EnemyProj_MotherBrainExplodedEscapeDoorParticles:
;; Parameters:
;;     X: Enemy projectile index
    LDA.W EnemyProjectile_XVelocity,X : BPL +
    EOR.W #$FFFF : INC

+   SEC : SBC.W #$0010 : BPL +
    LDA.W #$0000

+   BIT.W EnemyProjectile_XVelocity,X : BPL +
    EOR.W #$FFFF : INC

+   STA.W EnemyProjectile_XVelocity,X
    LDA.W EnemyProjectile_YVelocity,X : CLC : ADC.W #$0020 : STA.W EnemyProjectile_YVelocity,X
    JSR Move_EnemyProjectile_AccordingToVelocity
    DEC.W EnemyProjectile_Var0,X : BMI +
    RTS

+   STZ.W EnemyProjectile_ID,X
    LDA.W EnemyProjectile_YPositions,X : CLC : ADC.W #$FFFC : STA.W EnemyProjectile_YPositions,X : STA.B DP_Temp14
    LDA.W EnemyProjectile_XPositions,X : STA.B DP_Temp12
    LDA.W #$0009
    LDY.W #EnemyProjectile_MiscDust
    JSL SpawnEnemyProjectileY_ParameterA_RoomGraphics
    RTS


;;; $CA22: Instruction list - enemy projectile $CB21 (Mother Brain's exploded escape door particles) ;;;
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
;;; $CA46: Unused. Instruction list ;;;
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


;;; $CA6A: Initialisation AI - enemy projectile $CB2F (Mother Brain's purple breath - big) ;;;
InitAI_EnemyProjectile_MotherBrainPurpleBreath_Big:
;; Parameters:
;;     Y: Enemy projectile index
    TYX
    STZ.W EnemyProjectile_GraphicsIndices,X
    LDA.W Enemy[1].XPosition : CLC : ADC.W #$0006 : STA.W EnemyProjectile_XPositions,X
    LDA.W Enemy[1].YPosition : CLC : ADC.W #$0010 : STA.W EnemyProjectile_YPositions,X
    RTS


;;; $CA83: Initialisation AI - enemy projectile $CB3D (Mother Brain's purple breath - small) ;;;
InitAI_EnemyProjectile_MotherBrainPurpleBreath_Small:
;; Parameters:
;;     Y: Enemy projectile index
    TYX
    STZ.W EnemyProjectile_GraphicsIndices,X
    LDA.W Enemy[1].XPosition : CLC : ADC.W #$0006 : STA.W EnemyProjectile_XPositions,X
    LDA.W Enemy[1].YPosition : CLC : ADC.W #$0010 : STA.W EnemyProjectile_YPositions,X
    LDA.W #$0001 : STA.L MotherBrainBody.smallPurpleBreathActiveFlag
    RTS


;;; $CAA3: RTS. Pre-instruction - enemy projectile $CB2F/$CB3D (Mother Brain's purple breath) ;;;
RTS_86CAA3:
    RTS


;;; $CAA4: Instruction list - enemy projectile $CB2F (Mother Brain's purple breath - big) ;;;
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


;;; $CAC8: Instruction list - enemy projectile $CB3D (Mother Brain's purple breath - small) ;;;
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


;;; $CAEE: Instruction - Mother Brain's small purple breath is active flag = 0 ;;;
Instruction_EnemyProjectile_MotherBrainPurpleBreath_Inactive:
    LDA.W #$0000 : STA.L MotherBrainBody.smallPurpleBreathActiveFlag
    RTS


;;; $CAF6: Initialisation AI - enemy projectile $CBBB (time bomb set Japanese text) ;;;
InitAI_EnemyProjectile_TimeBombSetJapanText:
;; Parameters:
;;     Y: Enemy projectile index
    TYX
    STZ.W EnemyProjectile_GraphicsIndices,X
; fallthrough to PreInstruction_EnemyProjectile_TimeBombSetJapanText


;;; $CAFA: Pre-instruction - enemy projectile $CBBB (time bomb set Japanese text) ;;;
PreInstruction_EnemyProjectile_TimeBombSetJapanText:
;; Parameters:
;;     X: Enemy projectile index
    STZ.W EnemyProjectile_XVelocity,X : STZ.W EnemyProjectile_YVelocity,X
    LDA.W #$0080 : STA.W EnemyProjectile_XPositions,X
    LDA.W #$00C0 : STA.W EnemyProjectile_YPositions,X
    RTS


;;; $CB0D: Instruction list - enemy projectile $CBBB (time bomb set Japanese text) ;;;
InstList_EnemyProjectile_TimeBombSetJapanText:
    dw $0001,EnemyProjSpritemaps_TimeBombSetJapanSet
    dw Instruction_EnemyProjectile_Sleep


;;; $CB13: Enemy projectiles - Mother Brain ;;;
EnemyProjectile_MotherBrainDeathExplosion:
    %EnemyProjectile(\
    %initAI(InitAI_EnemyProjectile_MotherBrainsDeathExplosion),
    %preInst(PreInstruction_EnemyProjectile_MotherBrainsDeathExplosion),
    %instList(0),
    %radius(0, 0),
    %properties($2000),
    %hitList(0),
    %shotList(InstList_EnemyProjectile_Delete))

EnemyProjectile_MotherBrainExplodedEscapeDoorParticles:
    %EnemyProjectile(\
    %initAI(InitAI_EnemyProjectile_MotherBrainExplodedEscapeDoorParticle),
    %preInst(PreInst_EnemyProj_MotherBrainExplodedEscapeDoorParticles),
    %instList(InstList_EnemyProj_MotherBrainExplodedEscapeDoorParticle),
    %radius(0, 0),
    %properties($3000),
    %hitList(0),
    %shotList(InstList_EnemyProjectile_Delete))

EnemyProjectile_MotherBrainPurpleBreath_Big:
    %EnemyProjectile(\
    %initAI(InitAI_EnemyProjectile_MotherBrainPurpleBreath_Big),
    %preInst(RTS_86CAA3),
    %instList(InstList_EnemyProjectile_MotherBrainPurpleBreath_Big),
    %radius(0, 0),
    %properties($3000),
    %hitList(0),
    %shotList(InstList_EnemyProjectile_Delete))

EnemyProjectile_MotherBrainPurpleBreath_Small:
    %EnemyProjectile(\
    %initAI(InitAI_EnemyProjectile_MotherBrainPurpleBreath_Small),
    %preInst(RTS_86CAA3),
    %instList(InstList_EnemyProjectile_MotherBrainPurpleBreath_Small),
    %radius(0, 0),
    %properties($3000),
    %hitList(0),
    %shotList(InstList_EnemyProjectile_Delete))

EnemyProjectile_MotherBrainOnionRings:
    %EnemyProjectile(\
    %initAI(InitAI_EnemyProjectile_MotherBrainsOnionRings),
    %preInst(PreInstruction_EnemyProjectile_MotherBrainsOnionRings),
    %instList(InstList_EnemyProjectile_MotherBrainsOnionRings),
    %radius(6, 6),
    %properties($3050),
    %hitList(InstList_EnemyProjectile_Hit_MotherBrainsOnionRings),
    %shotList(InstList_EnemyProjectile_Delete))

EnemyProjectile_MotherBrainBomb:
    %EnemyProjectile(\
    %initAI(InitAI_EnemyProjectile_MotherBrainsBomb),
    %preInst(PreInstruction_EnemyProjectile_MotherBrainsBomb),
    %instList(InstList_EnemyProjectile_MotherBrainBomb),
    %radius(6, 6),
    %properties($40A0),
    %hitList(0),
    %shotList(InstList_EnemyProjectile_Delete))

EnemyProjectile_MotherBrainRedBeam_Charging:
    %EnemyProjectile(\
    %initAI(InitAI_EnemyProjectile_MotherBrainRedBeam_Charging),
    %preInst(RTS_86C76D),
    %instList(InstList_EnemyProjectile_MotherBrainRedBeam),
    %radius(6, 6),
    %properties($1190),
    %hitList(0),
    %shotList(InstList_EnemyProjectile_Delete))

EnemyProjectile_MotherBrainRedBeam_Fired:
    %EnemyProjectile(\
    %initAI(InitAI_EnemyProjectile_MotherBrainRedBeam_Fired),
    %preInst(RTS_86C76D),
    %instList(InstList_EnemyProjectile_MotherBrainRedBeam),
    %radius(6, 6),
    %properties($1190),
    %hitList(0),
    %shotList(InstList_EnemyProjectile_Delete))

EnemyProjectile_MotherBrainRainbowBeam_Charging:
    %EnemyProjectile(\
    %initAI(InitAI_EnemyProjectile_MotherBrainRainbowBeam_Charging),
    %preInst(PreInst_EnemyProjectile_MotherBrainRainbowBeam_Charging),
    %instList(InstList_EnemyProjectile_MotherBrainRainbowBeam_Charging),
    %radius(0, 0),
    %properties($7000),
    %hitList(0),
    %shotList(InstList_EnemyProjectile_Delete))

EnemyProjectile_MotherBrainDrool:
    %EnemyProjectile(\
    %initAI(InitAI_EnemyProjectile_MotherBrainsDrool),
    %preInst(PreInstruction_EnemyProjectile_MotherBrainsDrool),
    %instList(InstList_EnemyProjectile_MotherBrainsDrool),
    %radius(0, 0),
    %properties($7000),
    %hitList(0),
    %shotList(InstList_EnemyProjectile_Delete))

EnemyProjectile_MotherBrainDyingDrool:
    %EnemyProjectile(\
    %initAI(InitAI_EnemyProjectile_MotherBrainsDrool),
    %preInst(PreInstruction_EnemyProjectile_MotherBrainsDrool),
    %instList(InstList_EnemyProjectile_MotherBrainsDrool),
    %radius(0, 0),
    %properties($7000),
    %hitList(0),
    %shotList(InstList_EnemyProjectile_Delete))

EnemyProjectile_MotherBrainRainbowBeam_Explosion:
    %EnemyProjectile(\
    %initAI(InitAI_EnemyProjectile_MotherBrainsRainbowBeamExplosion),
    %preInst(PreInstruction_EnemyProj_MotherBrainsRainbowBeamExplosion),
    %instList(InstList_EnemyProj_MiscDust_4_MotherBrainRainbowBeamExplosion),
    %radius(1, 1),
    %properties($7000),
    %hitList(0),
    %shotList(InstList_EnemyProjectile_Delete))

EnemyProjectile_TimeBombSetJapanText:
    %EnemyProjectile(\
    %initAI(InitAI_EnemyProjectile_TimeBombSetJapanText),
    %preInst(PreInstruction_EnemyProjectile_TimeBombSetJapanText),
    %instList(InstList_EnemyProjectile_TimeBombSetJapanText),
    %radius(0, 0),
    %properties($1000),
    %hitList(0),
    %shotList(InstList_EnemyProjectile_Delete))


;;; $CBC9: Initialisation AI - enemy projectile $CC5B/$CC69/$CC77/$CC85 (Mother Brain tube falling) ;;;
InitAI_EnemyProjectile_MotherBrainsTubeFalling:
;; Parameters:
;;     Y: Enemy projectile index
    TYX
    LDA.W #$0E00 : STA.W EnemyProjectile_GraphicsIndices,X
    STZ.W EnemyProjectile_XVelocity,X : STZ.W EnemyProjectile_YVelocity,X
    LDA.B DP_Temp12 : STA.W EnemyProjectile_XPositions,X
    LDA.B DP_Temp14 : STA.W EnemyProjectile_YPositions,X
    LDA.W #MotherBrainsTubeFallingFunction_GenerateExplosion : STA.W EnemyProjectile_Var0,X
    RTS


;;; $CBE7: Pre-instruction - enemy projectile $CC5B/$CC69/$CC77/$CC85 (Mother Brain tube falling) ;;;
PreInstruction_EnemyProjectile_MotherBrainsTubeFalling:
;; Parameters:
;;     X: Enemy projectile index
    JMP.W (EnemyProjectile_Var0,X)


;;; $CBEA: Mother Brain tube falling function - generate explosion ;;;
MotherBrainsTubeFallingFunction_GenerateExplosion:
;; Parameters:
;;     X: Enemy projectile index
    LDA.W EnemyProjectile_XPositions,X : STA.B DP_Temp12
    LDA.W EnemyProjectile_YPositions,X : CLC : ADC.W #$0008 : STA.B DP_Temp14
    LDA.W #$0009
    LDY.W #EnemyProjectile_MiscDust
    JSL SpawnEnemyProjectileY_ParameterA_RoomGraphics
    LDA.W #MotherBrainsTubeFallingFunction_Falling : STA.W EnemyProjectile_Var0,X
; fallthrough to MotherBrainsTubeFallingFunction_Falling


;;; $CC08: Mother Brain tube falling function - falling ;;;
MotherBrainsTubeFallingFunction_Falling:
;; Parameters:
;;     X: Enemy projectile index
    REP #$21 ; carry clear
    LDA.W EnemyProjectile_YVelocity,X : ADC.W #$0006 : STA.W EnemyProjectile_YVelocity,X
    JSR Move_EnemyProjectile_Vertically_AccordingToVelocity
    CMP.W #$00D0 : BMI .return
    STZ.W EnemyProjectile_ID,X
    LDA.W EnemyProjectile_XPositions,X : STA.B DP_Temp12
    LDA.W EnemyProjectile_YPositions,X : STA.B DP_Temp14
    LDA.W #$000C
    LDY.W #EnemyProjectile_MiscDust
    JSL SpawnEnemyProjectileY_ParameterA_RoomGraphics

  .return:
    RTS


if !FEATURE_KEEP_UNREFERENCED
;;; $CC33: Unused ;;;
UNUSED_86CC33:
    dw $FF00,$0100, $0100,$0000, $FF00,$FF00, $0100,$0000
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $CC43: Instruction list - enemy projectile $CC5B (Mother Brain's top-right tube falling) ;;;
InstList_EnemyProjectile_MotherBrainsTubeFalling_TopRight:
    dw $0001,EnemyProjSpritemaps_MotherBrainsTubeFalling_TopRight
    dw Instruction_EnemyProjectile_Sleep


;;; $CC49: Instruction list - enemy projectile $CC69 (Mother Brain's top-left tube falling) ;;;
InstList_EnemyProjectile_MotherBrainsTubeFalling_TopLeft:
    dw $0001,EnemyProjSpritemaps_MotherBrainsTubeFalling_TopLeft
    dw Instruction_EnemyProjectile_Sleep


;;; $CC4F: Instruction list - enemy projectile $CC77 (Mother Brain's top-middle-left tube falling) ;;;
InstList_EnemyProj_MotherBrainsTubeFalling_TopMiddleLeft:
    dw $0001,EnemyProjSpritemaps_MotherBrainsTubeFalling_TopMiddleLeft
    dw Instruction_EnemyProjectile_Sleep


;;; $CC55: Instruction list - enemy projectile $CC85 (Mother Brain's top-middle-right tube falling) ;;;
InstList_EnemyProj_MotherBrainsTubeFalling_TopMiddleRight:
    dw $0001,EnemyProjSpritemaps_MotherBrainsTubeFalling_TopMiddleRight
    dw Instruction_EnemyProjectile_Sleep


;;; $CC5B: Enemy projectiles - Mother Brain's top tube falling ;;;
EnemyProjectile_MotherBrainTubeFalling_TopRight:
    %EnemyProjectile(\
    %initAI(InitAI_EnemyProjectile_MotherBrainsTubeFalling),
    %preInst(PreInstruction_EnemyProjectile_MotherBrainsTubeFalling),
    %instList(InstList_EnemyProjectile_MotherBrainsTubeFalling_TopRight),
    %radius(8, $10),
    %properties($5000),
    %hitList(0),
    %shotList(InstList_EnemyProjectile_Delete))

EnemyProjectile_MotherBrainTubeFalling_TopLeft:
    %EnemyProjectile(\
    %initAI(InitAI_EnemyProjectile_MotherBrainsTubeFalling),
    %preInst(PreInstruction_EnemyProjectile_MotherBrainsTubeFalling),
    %instList(InstList_EnemyProjectile_MotherBrainsTubeFalling_TopLeft),
    %radius(8, $10),
    %properties($5000),
    %hitList(0),
    %shotList(InstList_EnemyProjectile_Delete))

EnemyProjectile_MotherBrainTubeFalling_TopMiddleLeft:
    %EnemyProjectile(\
    %initAI(InitAI_EnemyProjectile_MotherBrainsTubeFalling),
    %preInst(PreInstruction_EnemyProjectile_MotherBrainsTubeFalling),
    %instList(InstList_EnemyProj_MotherBrainsTubeFalling_TopMiddleLeft),
    %radius(8, $18),
    %properties($5000),
    %hitList(0),
    %shotList(InstList_EnemyProjectile_Delete))

EnemyProjectile_MotherBrainTubeFalling_TopMiddleRight:
    %EnemyProjectile(\
    %initAI(InitAI_EnemyProjectile_MotherBrainsTubeFalling),
    %preInst(PreInstruction_EnemyProjectile_MotherBrainsTubeFalling),
    %instList(InstList_EnemyProj_MotherBrainsTubeFalling_TopMiddleRight),
    %radius(8, $18),
    %properties($5000),
    %hitList(0),
    %shotList(InstList_EnemyProjectile_Delete))


;;; $CC93: Instruction list - Mother Brain's glass shattering 0 ;;;
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


;;; $CCB7: Instruction list - Mother Brain's glass shattering 1/2 ;;;
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


;;; $CCDB: Instruction list - Mother Brain's glass shattering 3..5 ;;;
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


;;; $CCFF: Instruction list - Mother Brain's glass shattering 6/7 ;;;
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


;;; $CD23: Instruction list - Mother Brain's glass shattering 8 ;;;
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


;;; $CD47: Instruction list - Mother Brain's glass shattering 9/Ah ;;;
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


;;; $CD6B: Instruction list - Mother Brain's glass shattering Bh..Dh ;;;
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


;;; $CD8F: Instruction list - Mother Brain's glass shattering Eh/Fh ;;;
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


;;; $CDB3: Instruction list - enemy projectile $CF0A (Mother Brain's glass shattering - sparkle) ;;;
InstList_EnemyProjectile_MotherBrainsGlassShattering_Sparkle:
    dw $0006,EnemyProjSpritemaps_MotherBrainsGlassShattering_Sparkle_0
    dw $0008,EnemyProjSpritemaps_MotherBrainsGlassShattering_Sparkle_1
    dw $0006,EnemyProjSpritemaps_MotherBrainsGlassShattering_Sparkle_2
    dw $0008,EnemyProjSpritemaps_MotherBrainsGlassShattering_Sparkle_3
    dw Instruction_EnemyProjectile_Delete


;;; $CDC5: Initialisation AI - enemy projectile $CEFC (Mother Brain's glass shattering - shard) ;;;
InitAI_EnemyProjectile_MotherBrainsGlassShattering_Shard:
;; Parameters:
;;     Y: Enemy projectile index
;;     EnemyProjectile_InitParam0: X offset index
;;         0: 8
;;         2: -28h
;;         4: -10h
    JSL GenerateRandomNumber
    ASL : AND.W #$01FE : STA.W EnemyProjectile_Var0,Y
    TAX
    LDA.L SineCosineTables_8bitSine_SignExtended,X : STA.W EnemyProjectile_XVelocity,Y
    LDA.L SineCosineTables_NegativeCosine_SignExtended,X : ASL #2 : STA.W EnemyProjectile_YVelocity,Y
    TXA : LSR #4 : AND.W #$001E : TAX
    LDA.W .InstListPointers,X : STA.W EnemyProjectile_InstListPointers,Y
    LDA.W #$0640 : STA.W EnemyProjectile_GraphicsIndices,Y
    LDX.W PLM_Index
    JSL Calculate_PLM_Block_Coordinates
    LDX.W EnemyProjectile_InitParam0
    LDA.W PLM_XBlock : ASL #4 : CLC : ADC.W .Xoffsets,X : STA.W EnemyProjectile_XPositions,Y
    LDA.W PLM_YBlock : ASL #4 : CLC : ADC.W .Yoffsets,X : STA.W EnemyProjectile_YPositions,Y
    JSL GenerateRandomNumber
    AND.W #$000F : SEC : SBC.W #$0008
    CLC : ADC.W EnemyProjectile_XPositions,Y : STA.W EnemyProjectile_XPositions,Y
    JSL GenerateRandomNumber
    AND.W #$000F : SEC : SBC.W #$0008
    CLC : ADC.W EnemyProjectile_YPositions,Y : STA.W EnemyProjectile_YPositions,Y
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


;;; $CE6D: Initialisation AI - enemy projectile $CF0A (Mother Brain's glass shattering - sparkle) ;;;
InitAI_EnemyProjectile_MotherBrainGlassShattering_Sparkle:
;; Parameters:
;;     Y: Enemy projectile index
;;     EnemyProjectile_InitParam0: Shard enemy projectile index
    LDX.W EnemyProjectile_InitParam0
    JSL GenerateRandomNumber
    AND.W #$001F : SEC : SBC.W #$0010
    CLC : ADC.W EnemyProjectile_XPositions,X : STA.W EnemyProjectile_XPositions,Y
    JSL GenerateRandomNumber
    AND.W #$001F : SEC : SBC.W #$0010
    CLC : ADC.W EnemyProjectile_YPositions,X : STA.W EnemyProjectile_YPositions,Y
    LDA.W #$0640 : STA.W EnemyProjectile_GraphicsIndices,Y
    RTS


;;; $CE9B: Pre-instruction - enemy projectile $CEFC (Mother Brain's glass shattering - shard) ;;;
PreInstruction_EnemyProj_MotherBrainGlassShattering_Shard:
;; Parameters:
;;     X: Enemy projectile index
    STZ.B DP_Temp12 : STZ.B DP_Temp14
    LDA.W EnemyProjectile_XVelocity,X : BPL +
    DEC.B DP_Temp14

+   STA.B DP_Temp13
    LDA.W EnemyProjectile_XSubPositions,X : CLC : ADC.B DP_Temp12 : STA.W EnemyProjectile_XSubPositions,X
    LDA.W EnemyProjectile_XPositions,X : ADC.B DP_Temp14 : STA.W EnemyProjectile_XPositions,X
    STZ.B DP_Temp12 : STZ.B DP_Temp14
    LDA.W EnemyProjectile_YVelocity,X : BPL +
    DEC.B DP_Temp14

+   STA.B DP_Temp13
    LDA.W EnemyProjectile_YSubPositions,X : CLC : ADC.B DP_Temp12 : STA.W EnemyProjectile_YSubPositions,X
    LDA.W EnemyProjectile_YPositions,X : ADC.B DP_Temp14 : STA.W EnemyProjectile_YPositions,X
    AND.W #$FF00 : BNE .delete
    LDA.W EnemyProjectile_YVelocity,X : CLC : ADC.W #$0020 : STA.W EnemyProjectile_YVelocity,X
    JSL GenerateRandomNumber
    AND.W #$0420 : BNE .return
    TXA
    LDY.W #EnemyProjectile_MotherBrainGlassShattering_Sparkle
    JSL SpawnEnemyProjectileY_ParameterA_RoomGraphics

  .return:
    RTS

  .delete:
    STZ.W EnemyProjectile_ID,X
    RTS


;;; $CEFC: Enemy projectiles - Mother Brain's glass shattering ;;;
EnemyProjectile_MotherBrainGlassShattering_Shard:
    %EnemyProjectile(\
    %initAI(InitAI_EnemyProjectile_MotherBrainsGlassShattering_Shard),
    %preInst(PreInstruction_EnemyProj_MotherBrainGlassShattering_Shard),
    %instList(InstList_EnemyProjectile_MotherBrainsGlassShattering_0),
    %radius(0, 0),
    %properties($3000),
    %hitList(0),
    %shotList(InstList_EnemyProjectile_Delete))

EnemyProjectile_MotherBrainGlassShattering_Sparkle:
    %EnemyProjectile(\
    %initAI(InitAI_EnemyProjectile_MotherBrainGlassShattering_Sparkle),
    %preInst(RTS_8684FB),
    %instList(InstList_EnemyProjectile_MotherBrainsGlassShattering_Sparkle),
    %radius(0, 0),
    %properties($3000),
    %hitList(0),
    %shotList(InstList_EnemyProjectile_Delete))


;;; $CF18: Enemy projectiles - ki hunter acid spit ;;;
EnemyProjectile_KiHunterAcidSpit_Left:
    %EnemyProjectile(\
    %initAI(InitAI_EnemyProjectile_KiHunterAcidSpit_Left),
    %preInst(RTS_86CFF7),
    %instList(InstList_EnemyProjectile_KiHunterAcidSpit_Left),
    %radius(2, 8),
    %properties($0014),
    %hitList(0),
    %shotList(InstList_EnemyProjectile_Delete))

EnemyProjectile_KiHunterAcidSpit_Right:
    %EnemyProjectile(\
    %initAI(InitAI_EnemyProjectile_KiHunterAcidSpit_Right),
    %preInst(RTS_86CFF7),
    %instList(InstList_EnemyProjectile_KiHunterAcidSpit_Right),
    %radius(2, 8),
    %properties($0014),
    %hitList(0),
    %shotList(InstList_EnemyProjectile_Delete))


;;; $CF34: Instruction list - enemy projectile $CF18 (ki hunter acid spit - left) ;;;
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


;;; $CF56: Instruction list - ki hunter acid spit - hit floor ;;;
InstList_EnemyProjectile_KiHunterAcidSpit_HitFloor:
    dw Instruction_EnemyProjectile_ClearPreInstruction
    dw $000C,EnemyProjSpritemaps_KihunterAcidSpit_0
    dw $000A,EnemyProjSpritemaps_KihunterAcidSpit_1
    dw $000A,EnemyProjSpritemaps_KihunterAcidSpit_2
    dw $0008,EnemyProjSpritemaps_KihunterAcidSpit_3
    dw $0008,EnemyProjSpritemaps_KihunterAcidSpit_4
    dw Instruction_EnemyProjectile_Delete


;;; $CF6E: Instruction list - enemy projectile $CF26 (ki hunter acid spit - right) ;;;
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


;;; $CF90: Initialisation AI - enemy projectile $CF18 (ki hunter acid spit - left) ;;;
InitAI_EnemyProjectile_KiHunterAcidSpit_Left:
;; Parameters:
;;     Y: Enemy projectile index
    PHX
    LDX.W EnemyIndex
    LDA.W #$FD00 : STA.W EnemyProjectile_XVelocity,Y
    LDA.W Enemy.XPosition,X : SEC : SBC.W #$0016 : STA.W EnemyProjectile_XPositions,Y
    BRA InitAI_EnemyProjectile_KiHunterAcidSpit_Common


;;; $CFA6: Initialisation AI - enemy projectile $CF26 (ki hunter acid spit - right) ;;;
InitAI_EnemyProjectile_KiHunterAcidSpit_Right:
;; Parameters:
;;     Y: Enemy projectile index
    PHX
    LDX.W EnemyIndex
    LDA.W #$0300 : STA.W EnemyProjectile_XVelocity,Y
    LDA.W Enemy.XPosition,X : CLC : ADC.W #$0016 : STA.W EnemyProjectile_XPositions,Y
; fallthrough to InitAI_EnemyProjectile_KiHunterAcidSpit_Common


;;; $CFBA: Ki hunter acid spit common initialisation ;;;
InitAI_EnemyProjectile_KiHunterAcidSpit_Common:
;; Parameters:
;;     X: Enemy index
;;     Y: Enemy projectile index

; Expects a pushed X
    LDA.W #$0000 : STA.W EnemyProjectile_YVelocity,Y
    LDA.W Enemy.YPosition,X : SEC : SBC.W #$0010 : STA.W EnemyProjectile_YPositions,Y
    LDA.W #$0000 : STA.W EnemyProjectile_YSubPositions,Y : STA.W EnemyProjectile_XSubPositions,Y
    PLX
    RTS


;;; $CFD5: Pre-instruction - ki hunter acid spit - left - start moving ;;;
PreInstruction_EnemyProj_KiHunterAcidSpit_Left_StartMoving:
;; Parameters:
;;     X: Enemy projectile index
    LDA.W #PreInstruction_EnemyProj_KiHunterAcidSpit_Moving : STA.W EnemyProjectile_PreInstructions,X
    LDA.W EnemyProjectile_XPositions,X : SEC : SBC.W #$0013 : STA.W EnemyProjectile_XPositions,X
    RTS


;;; $CFE6: Pre-instruction - ki hunter acid spit - right - start moving ;;;
PreInstruction_EnemyProj_KiHunterAcidSpit_Right_StartMoving:
;; Parameters:
;;     X: Enemy projectile index
    LDA.W #PreInstruction_EnemyProj_KiHunterAcidSpit_Moving : STA.W EnemyProjectile_PreInstructions,X
    LDA.W EnemyProjectile_XPositions,X : CLC : ADC.W #$0013 : STA.W EnemyProjectile_XPositions,X
    RTS


;;; $CFF7: RTS. Pre-instruction - enemy projectile $CF18/$CF26 (ki hunter acid spit) ;;;
RTS_86CFF7:
    RTS


;;; $CFF8: Pre-instruction - ki hunter acid spit - moving ;;;
PreInstruction_EnemyProj_KiHunterAcidSpit_Moving:
;; Parameters:
;;     X: Enemy projectile index
    REP #$30
    JSR Move_EnemyProjectile_Vertically
    BCS .hitFloor
    JSR Move_EnemyProjectile_Horizontally
    BCS .hitWall
    LDA.W EnemyProjectile_YVelocity,X : CLC : ADC.W #$0010 : STA.W EnemyProjectile_YVelocity,X
    CMP.W #$0200 : BMI +
    LDA.W #$0200

+   STA.W EnemyProjectile_YVelocity,X
    RTS

  .hitFloor:
    LDA.W #InstList_EnemyProjectile_KiHunterAcidSpit_HitFloor : STA.W EnemyProjectile_InstListPointers,X
    LDA.W #$0001 : STA.W EnemyProjectile_InstructionTimers,X
    RTS

  .hitWall:
    LDA.W #$0000 : STA.W EnemyProjectile_XVelocity,X
    RTS


;;; $D02E: Enemy projectile - kago bug ;;;
EnemyProjectile_KagoBug:
    %EnemyProjectile(\
    %initAI(InitAI_EnemyProjectile_KagoBug),
    %preInst(RTS_86D0EB),
    %instList(InstList_EnemyProjectile_KraidRocks_KagoBug),
    %radius(4, 4),
    %properties($0014),
    %hitList(0),
    %shotList(InstList_EnemyProjectile_Shot_KagoBug))


;;; $D03C: Instruction list - kago bug - hit floor ;;;
InstList_EnemyProjectile_KagoBug_HitFloor:
    dw $0005,EnemyProjSpritemaps_KagoBugs_2
    dw Instruction_EnemyProjectile_KagoBug_StartIdling
    dw $7FFF,EnemyProjSpritemaps_KagoBugs_1
    dw Instruction_EnemyProjectile_GotoY
    dw InstList_EnemyProjectile_KagoBug_HitFloor


;;; $D04A: Instruction list - kago bug - falling ;;;
InstList_EnemyProjectile_KagoBug_Falling:
    dw $7FFF,EnemyProjSpritemaps_KagoBugs_1
    dw Instruction_EnemyProjectile_GotoY
    dw InstList_EnemyProjectile_KagoBug_Falling


;;; $D052: Instruction list - kago bug - jump ;;;
InstList_EnemyProjectile_KagoBug_Jump_0:
    dw $0010,EnemyProjSpritemaps_KagoBugs_2
    dw $0005,EnemyProjSpritemaps_KagoBugs_1
    dw Instruction_EnemyProjectile_KagoBug_StartJumping

InstList_EnemyProjectile_KagoBug_Jump_1:
    dw $7FFF,EnemyProjSpritemaps_KagoBugs_0
    dw Instruction_EnemyProjectile_GotoY
    dw InstList_EnemyProjectile_KagoBug_Jump_1


;;; $D064: Shot instruction list - enemy projectile $D02E (kago bug) ;;;
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


;;; $D080: Instruction list - delete ;;;
InstList_EnemyProjectile_Delete_duplicate:
    dw Instruction_EnemyProjectile_Delete


;;; $D082: Kago bug constants ;;;
KagoBug_Constants:
  .Yacceleration:
    dw $00E0                                                             ; Unit 1/100h px/frame²
  .Xproximity:
    dw $0030                                                             ; Kago bug will jump towards kago if it's at least this many pixels away
  .Xvelocity:
    dw $0200                                                             ; Unit 1/100h px/frame


;;; $D088: Initialisation AI - enemy projectile $D02E (kago bug) ;;;
InitAI_EnemyProjectile_KagoBug:
;; Parameters:
;;     Y: Enemy projectile index
    LDA.W EnemyIndex : STA.W EnemyProjectile_Var1,Y : TAX
    LDA.W Enemy.XPosition,X : STA.W EnemyProjectile_XPositions,Y
    LDA.W Enemy.YPosition,X : STA.W EnemyProjectile_YPositions,Y
    LDA.W RandomNumberSeed : AND.W #$0007 : INC : STA.W EnemyProjectile_CollidedProjectileType,Y
    CLC : ADC.W #$0004 : STA.W EnemyProjectile_Var0,Y
    LDA.W #PreInstruction_EnemyProjectile_KagoBug_Idling : STA.W EnemyProjectile_PreInstructions,Y
    RTS


;;; $D0B3: Handle kago bug sound effect ;;;
Handle_KagoBug_SoundEffect:
;; Parameters:
;;     X: Enemy projectile index
    PHX : PHY
    LDA.W EnemyProjectile_Var0,X : BEQ .return
    DEC : STA.W EnemyProjectile_Var0,X : BNE .return
    LDA.W #$006C
    JSL QueueSound_Lib2_Max6

  .return:
    PLY : PLX
    RTS


;;; $D0CA: Pre-instruction - kago bug - idling ;;;
PreInstruction_EnemyProjectile_KagoBug_Idling:
    JSR Handle_KagoBug_SoundEffect
    JSR Enable_KagoBug_Collision_with_SamusProj_IfFarEnoughFromKago
    LDA.W EnemyProjectile_CollidedProjectileType,X : BEQ .timerExpired
    DEC.W EnemyProjectile_CollidedProjectileType,X
    RTS

  .timerExpired:
    LDA.W #InstList_EnemyProjectile_KagoBug_Jump_0 : STA.W EnemyProjectile_InstListPointers,X
    LDA.W #$0001 : STA.W EnemyProjectile_InstructionTimers,X
    LDA.W #RTS_86D0EB : STA.W EnemyProjectile_PreInstructions,X


RTS_86D0EB:
    RTS


;;; $D0EC: Pre-instruction - kago bug - jumping ;;;
PreInstruction_EnemyProjectile_KagoBug_Jumping:
;; Parameters:
;;     X: Enemy projectile index
    JSR Handle_KagoBug_SoundEffect
    JSR Enable_KagoBug_Collision_with_SamusProj_IfFarEnoughFromKago
    JSR Move_EnemyProjectile_Horizontally
    BCS .hitWall
    JSR Move_EnemyProjectile_Vertically
    BCS .hitCeiling
    LDA.W EnemyProjectile_YVelocity,X : CLC : ADC.W KagoBug_Constants_Yacceleration : STA.W EnemyProjectile_YVelocity,X
    BPL .falling
    RTS

  .hitWall:
    LDA.W #$0000 : STA.W EnemyProjectile_XVelocity,X

  .hitCeiling:
    LDA.W #$0100 : STA.W EnemyProjectile_YVelocity,X

  .falling:
    LDA.W #PreInstruction_EnemyProjectile_KagoBug_Falling : STA.W EnemyProjectile_PreInstructions,X
    LDA.W #InstList_EnemyProjectile_KagoBug_Falling : STA.W EnemyProjectile_InstListPointers,X
    LDA.W #$0001 : STA.W EnemyProjectile_InstructionTimers,X
    RTS


;;; $D128: Pre-instruction - kago bug - falling ;;;
PreInstruction_EnemyProjectile_KagoBug_Falling:
;; Parameters:
;;     X: Enemy projectile index
    JSR Handle_KagoBug_SoundEffect
    JSR Enable_KagoBug_Collision_with_SamusProj_IfFarEnoughFromKago
    JSR Move_EnemyProjectile_Horizontally
    BCS .hitWall
    JSR Move_EnemyProjectile_Vertically
    BCS .hitFloor
    LDA.W EnemyProjectile_YVelocity,X : ADC.W KagoBug_Constants_Yacceleration : STA.W EnemyProjectile_YVelocity,X
    RTS

  .hitWall:
    LDA.W #$0000 : STA.W EnemyProjectile_XVelocity,X
    RTS

  .hitFloor:
    LDA.W #RTS_86D0EB : STA.W EnemyProjectile_PreInstructions,X
    LDA.W #InstList_EnemyProjectile_KagoBug_HitFloor : STA.W EnemyProjectile_InstListPointers,X
    LDA.W #$0001 : STA.W EnemyProjectile_InstructionTimers,X
    RTS


;;; $D15C: Instruction - start jumping ;;;
Instruction_EnemyProjectile_KagoBug_StartJumping:
;; Parameters:
;;     X: Enemy projectile index

; Keeping the X direction flag on the stack was... not the least awkward approach
; If the kago is killed, its X position will be 0, which will cause the bugs to (usually) jump left
    JSR Handle_KagoBug_SoundEffect
    JSR Enable_KagoBug_Collision_with_SamusProj_IfFarEnoughFromKago
    LDA.W RandomNumberSeed : AND.W #$0300 : CLC : ADC.W #$0800
    BIT.W #$0100 : PHP
    EOR.W #$FFFF : INC : STA.W EnemyProjectile_YVelocity,X
    PHX
    LDA.W EnemyProjectile_Var1,X : TAX
    LDA.W Enemy.XPosition,X
    PLX
    SEC : SBC.W EnemyProjectile_XPositions,X
    PHP
    BPL +
    EOR.W #$FFFF : INC

+   CMP.W KagoBug_Constants_Xproximity : BMI .nearKago
    PLP : BPL .right
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
    PLP : BEQ +
    EOR.W #$FFFF : INC

+   STA.W EnemyProjectile_XVelocity,X
    LDA.W #PreInstruction_EnemyProjectile_KagoBug_Jumping : STA.W EnemyProjectile_PreInstructions,X
    RTS


;;; $D1B6: Instruction - start idling ;;;
Instruction_EnemyProjectile_KagoBug_StartIdling:
;; Parameters:
;;     X: Enemy projectile index
    LDA.W RandomNumberSeed : AND.W #$001F : INC : STA.W EnemyProjectile_CollidedProjectileType,X
    LDA.W #PreInstruction_EnemyProjectile_KagoBug_Idling : STA.W EnemyProjectile_PreInstructions,X
    RTS


;;; $D1C7: Instruction - use palette 0 ;;;
Instruction_EnemyProjectile_UsePalette0_duplicate_again:
;; Parameters:
;;     X: Enemy projectile index
    LDA.W #$0000 : STA.W EnemyProjectile_GraphicsIndices,X
    RTS


;;; $D1CE: Instruction - spawn kago enemy drop ;;;
PreInstruction_EnemyProjectile_KagoBug_SpawnDrop:
;; Parameters:
;;     X: Enemy projectile index
    PHY : PHX
    LDA.W EnemyProjectile_XPositions,X : STA.B DP_Temp12
    LDA.W EnemyProjectile_YPositions,X : STA.B DP_Temp14
    LDA.W #EnemyHeaders_Kago
    JSL Spawn_Enemy_Drops
    PLX : PLY
    RTS


;;; $D1E4: Enable kago bug collision with Samus projectiles if far enough from kago ;;;
Enable_KagoBug_Collision_with_SamusProj_IfFarEnoughFromKago:
;; Parameters:
;;     X: Enemy projectile index

; If the kago is killed, its X position will be 0, which will (usually) cause the Samus projectile collision to be enabled
    PHX : PHY
    LDA.W EnemyProjectile_Var1,X : TAY
    LDA.W Enemy.XPosition,Y : SEC : SBC.W EnemyProjectile_XPositions,X : BPL .enable
    EOR.W #$FFFF : INC

  .enable:
    CMP.W #$0017 : BMI .return
    LDA.W EnemyProjectile_Properties,X : ORA.W #$8000 : STA.W EnemyProjectile_Properties,X

  .return:
    PLY : PLX
    RTS


;;; $D208: Instruction list - enemy projectile $D298 (powamp spike) ;;;
InstList_EnemyProjectile_PowampSpike:
    dw $0006,EnemyProjSpritemaps_PowampSpikes_0
    dw $0006,EnemyProjSpritemaps_PowampSpikes_1
    dw $0006,EnemyProjSpritemaps_PowampSpikes_2
    dw Instruction_EnemyProjectile_GotoY
    dw InstList_EnemyProjectile_PowampSpike


;;; $D218: Instruction list - delete / shot instruction list - enemy projectile $D298 (powamp spike) ;;;
InstList_EnemyProjectile_PowampSpike_Delete:
    dw Instruction_EnemyProjectile_Delete


;;; $D21A: Powamp spike velocity table ;;;
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


;;; $D23A: Initialisation AI - enemy projectile $D298 (powamp spike) ;;;
InitAI_EnemyProjectile_PowampSpike:
;; Parameters:
;;     Y: Enemy projectile index
;;     EnemyProjectile_InitParam0: Direction
;;         0: Up
;;         1: Up-right
;;         2: Right
;;         3: Down-right
;;         4: Down
;;         5: Down-left
;;         6: Left
;;         7: Up-left
    PHP
    REP #$30
    LDA.W #$0000
    STA.W EnemyProjectile_XSubPositions,Y : STA.W EnemyProjectile_YSubPositions,Y
    STA.W EnemyProjectile_XVelocity,Y : STA.W EnemyProjectile_YVelocity,Y
    LDX.W EnemyIndex
    LDA.W Enemy.XPosition,X : STA.W EnemyProjectile_XPositions,Y
    LDA.W Enemy.YPosition,X : STA.W EnemyProjectile_YPositions,Y
    LDA.W EnemyProjectile_InitParam0 : STA.W EnemyProjectile_Var0,Y
    PLP
    RTS


;;; $D263: Pre-instruction - enemy projectile $D298 (powamp spike) ;;;
PreInstruction_EnemyProjectile_PowampSpike:
;; Parameters:
;;     X: Enemy projectile index
    LDA.W EnemyProjectile_Var0,X : ASL : TAY
    LDA.W EnemyProjectile_XVelocity,X : CLC : ADC.W PowampSpike_VelocityTable_X,Y : STA.W EnemyProjectile_XVelocity,X
    JSR Move_EnemyProjectile_Horizontally
    BCS .collision
    LDA.W EnemyProjectile_Var0,X : ASL : TAY
    LDA.W EnemyProjectile_YVelocity,X : CLC : ADC.W PowampSpike_VelocityTable_Y,Y : STA.W EnemyProjectile_YVelocity,X
    JSR Move_EnemyProjectile_Vertically
    BCC .return

  .collision:
    LDA.W #InstList_EnemyProjectile_PowampSpike_Delete : STA.W EnemyProjectile_InstListPointers,X
    LDA.W #$0001 : STA.W EnemyProjectile_InstructionTimers,X

  .return:
    RTS


;;; $D298: Enemy projectile - powamp spike ;;;
EnemyProjectile_Powamp:
    %EnemyProjectile(\
    %initAI(InitAI_EnemyProjectile_PowampSpike),
    %preInst(PreInstruction_EnemyProjectile_PowampSpike),
    %instList(InstList_EnemyProjectile_PowampSpike),
    %radius(4, 4),
    %properties($0014),
    %hitList(0),
    %shotList(InstList_EnemyProjectile_PowampSpike_Delete))


;;; $D2A6: Enemy projectiles - work robot laser ;;;
EnemyProjectile_RobotLaser_UpLeft:
    %EnemyProjectile(\
    %initAI(InitAI_EnemyProjectile_WreckedShipRobotLaser_UpLeft_Right),
    %preInst(PreInstruction_EnemyProjectile_WreckedShipRobotLaser),
    %instList(InstList_EnemyProjectile_WreckedShipRobotLaser_0),
    %radius($0C, $0C),
    %properties($0004),
    %hitList(0),
    %shotList(InstList_EnemyProjectile_Delete))

EnemyProjectile_RobotLaser_Horizontal:
    %EnemyProjectile(\
    %initAI(InitAI_EnemyProjectile_WreckedShipRobotLaser_Horizontal),
    %preInst(PreInstruction_EnemyProjectile_WreckedShipRobotLaser),
    %instList(InstList_EnemyProjectile_WreckedShipRobotLaser_0),
    %radius($0F, 2),
    %properties($0014),
    %hitList(0),
    %shotList(InstList_EnemyProjectile_Delete))

EnemyProjectile_RobotLaser_DownLeft:
    %EnemyProjectile(\
    %initAI(InitAI_EnemyProjectile_WreckedShipRobotLaser_DownLeft_Right),
    %preInst(PreInstruction_EnemyProjectile_WreckedShipRobotLaser),
    %instList(InstList_EnemyProjectile_WreckedShipRobotLaser_0),
    %radius($0C, $0C),
    %properties($0004),
    %hitList(0),
    %shotList(InstList_EnemyProjectile_Delete))

EnemyProjectile_RobotLaser_UpRight:
    %EnemyProjectile(\
    %initAI(InitAI_EnemyProjectile_WreckedShipRobotLaser_UpLeft_Right),
    %preInst(PreInstruction_EnemyProjectile_WreckedShipRobotLaser),
    %instList(InstList_EnemyProjectile_WreckedShipRobotLaser_0),
    %radius($0C, $0C),
    %properties($0004),
    %hitList(0),
    %shotList(InstList_EnemyProjectile_Delete))

EnemyProjectile_RobotLaser_DownRight:
    %EnemyProjectile(\
    %initAI(InitAI_EnemyProjectile_WreckedShipRobotLaser_DownLeft_Right),
    %preInst(PreInstruction_EnemyProjectile_WreckedShipRobotLaser),
    %instList(InstList_EnemyProjectile_WreckedShipRobotLaser_0),
    %radius($0C, $0C),
    %properties($0004),
    %hitList(0),
    %shotList(InstList_EnemyProjectile_Delete))


;;; $D2EC: Instruction list - enemy projectile $D2A6/$D2B4/$D2C2/$D2D0/$D2DE (work robot laser) ;;;
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


;;; $D30C: Initialisation AI - enemy projectile $D2C2/$D2DE (work robot laser - down-left/right) ;;;
InitAI_EnemyProjectile_WreckedShipRobotLaser_DownLeft_Right:
;; Parameters:
;;     Y: Enemy projectile index
    PHX
    LDX.W EnemyIndex
    LDA.W Robot.laserXVelocity,X : PHP : STA.W EnemyProjectile_XVelocity,Y
    BPL .pointlessBranch
    EOR.W #$FF00 : CLC : ADC.W #$0100

  .pointlessBranch:
    LDA.W #$0080 : STA.W EnemyProjectile_YVelocity,Y
    LDA.W #$0000 : STA.W EnemyProjectile_GraphicsIndices,Y
    BRA InitAI_EnemyProjectile_WreckedShipRobotLaser_Common


;;; $D32E: Initialisation AI - enemy projectile $D2B4 (work robot laser - horizontal) ;;;
InitAI_EnemyProjectile_WreckedShipRobotLaser_Horizontal:
;; Parameters:
;;     Y: Enemy projectile index
    PHX
    LDX.W EnemyIndex
    LDA.W Robot.laserXVelocity,X : PHP : STA.W EnemyProjectile_XVelocity,Y
    LDA.W #$0000 : STA.W EnemyProjectile_YVelocity,Y
    BRA InitAI_EnemyProjectile_WreckedShipRobotLaser_Common


;;; $D341: Initialisation AI - enemy projectile $D2A6/$D2D0 (work robot laser - up-left/right) ;;;
InitAI_EnemyProjectile_WreckedShipRobotLaser_UpLeft_Right:
;; Parameters:
;;     Y: Enemy projectile index
    PHX
    LDX.W EnemyIndex
    LDA.W Robot.laserXVelocity,X : PHP : STA.W EnemyProjectile_XVelocity,Y
    BMI .pointlessBranch
    EOR.W #$FF00 : CLC : ADC.W #$0100

  .pointlessBranch:
    LDA.W #$FF80 : STA.W EnemyProjectile_YVelocity,Y
; fallthrough to InitAI_EnemyProjectile_WreckedShipRobotLaser_Common


;;; $D35B: Work robot laser common initialisation ;;;
InitAI_EnemyProjectile_WreckedShipRobotLaser_Common:
;; Parameters:
;;     X: Enemy index
;;     Y: Enemy projectile index

; Expects a pushed PSR and X
; BUG: Missing `CMP Layer1YPosition` at $D3B4 causes laser sound effect to only play if the robot is in the top row of scrolls
    LDA.W Enemy.YPosition,X : SEC : SBC.W #$0010 : STA.W EnemyProjectile_YPositions,Y
    LDA.W Enemy.XPosition,X : PLP : BMI .subtract
    CLC : ADC.W #$0004
    BRA +

  .subtract:
    SEC : SBC.W #$0004

+   STA.W EnemyProjectile_XPositions,Y
    LDA.W #$0000 : STA.W EnemyProjectile_YSubPositions,Y : STA.W EnemyProjectile_XSubPositions,Y
    LDA.W Enemy.XPosition,X : CLC : ADC.W Enemy.XHitboxRadius,X : CMP.W Layer1XPosition : BMI .return
    LDA.W Enemy.XPosition,X : SEC : SBC.W Enemy.XHitboxRadius,X
    SEC : SBC.W #$0101 : CMP.W Layer1XPosition : BPL .return
    LDA.W Enemy.YPosition,X : CLC : ADC.W Enemy.YHitboxRadius,X : CMP.W Layer1YPosition : BMI .return
    LDA.W Enemy.YPosition,X : SEC : SBC.W Enemy.YHitboxRadius,X
    SEC : SBC.W #$00E0 : BPL .return
    LDA.W #$0067
    JSL QueueSound_Lib2_Max6

  .return:
    PLX
    RTS


;;; $D3BF: Pre-instruction - enemy projectile $D2A6/$D2B4/$D2C2/$D2D0/$D2DE (work robot laser) ;;;
PreInstruction_EnemyProjectile_WreckedShipRobotLaser:
;; Parameters:
;;     X: Enemy projectile index
    PHP
    REP #$20
    LDA.W #$0000 : STA.W EnemyProjectile_GraphicsIndices,X
    JSR Move_EnemyProjectile_Horizontally
    BCS .collision
    JSR Move_EnemyProjectile_Vertically
    BCC .return

  .collision:
    STZ.W EnemyProjectile_ID,X

  .return:
    PLP
    RTS


;;; $D3D7: Instruction list - enemy projectile $D904 (n00b tube crack) ;;;
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


;;; $D47D: Instruction list - n00b tube shard - parameter = 0 ;;;
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


;;; $D4A1: Instruction list - n00b tube shard - parameter = 2 ;;;
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


;;; $D4C5: Instruction list - n00b tube shard - parameter = 4 ;;;
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


;;; $D4E9: Instruction list - n00b tube shard - parameter = 6 ;;;
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


;;; $D50D: Instruction list - n00b tube shard - parameter = 8 ;;;
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


;;; $D531: Instruction list - n00b tube shard - parameter = Ah ;;;
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


;;; $D555: Instruction list - n00b tube shard - parameter = Ch ;;;
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


;;; $D579: Instruction list - n00b tube shard - parameter = Eh ;;;
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


;;; $D59D: Instruction list - n00b tube shard - parameter = 10h ;;;
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


;;; $D5BD: Instruction list - n00b tube shard - parameter = 12h ;;;
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


;;; $D5E1: Instruction - assign n00b tube shard falling angle ;;;
Instruction_EnemyProjectile_AssignNoobTubeShardFallingAngle:
;; Parameters:
;;     X: Enemy projectile index

; TODO: seems that Bitmask (the bitmask result of $80:818E) is assumed to be 0 (or the low byte at least),
;       need to check if that's actually true (due to the n00b tube event check?)
;       Related: Inststruction_EnemyProjectile_NoobTubeReleasedAirBubbles
    JSL GenerateRandomNumber
    LDA.W RandomNumberSeed+1 : STA.W EnemyProjectile_XVelocity,X
    LDA.W #$00C0 : STA.W EnemyProjectile_YVelocity,X
    RTS


;;; $D5F2: Instruction - reflect-flicker n00b tube shard with left-side spritemap [[Y]] or right-side spritemap [[Y] + 2] ;;;
Instruction_EnemyProj_FlickerNoobTubeShardLeftRightSpritemap:
;; Parameters:
;;     X: Enemy projectile index
;;     Y: Pointer to instruction arguments
;; Returns:
;;     Y: Pointer to next instruction
    LDA.W NMI_FrameCounter : LSR : BCC .right
    LDA.W EnemyProjectile_Var1,X : STA.W EnemyProjectile_XPositions,X
    LDA.W $0000,Y : STA.W EnemyProjectile_SpritemapPointers,X
    BRA .merge

  .right:
    LDA.W #$0080 : SEC : SBC.W EnemyProjectile_Var1,X
    CLC : ADC.W #$0080 : STA.W EnemyProjectile_XPositions,X
    LDA.W $0002,Y : STA.W EnemyProjectile_SpritemapPointers,X

  .merge:
    INY #4 : TYA : STA.W EnemyProjectile_InstListPointers,X
    LDA.W #$0001 : STA.W EnemyProjectile_InstructionTimers,X
    PLA
    RTS


;;; $D62A: Instruction - flicker n00b tube shard with spritemap [[Y]] ;;;
Instruction_EnemyProjectile_NoobTubeShard_FlickerSpritemap:
;; Parameters:
;;     X: Enemy projectile index
;;     Y: Pointer to instruction arguments
;; Returns:
;;     Y: Pointer to next instruction
    LDA.W NMI_FrameCounter : LSR : BCC .zero
    LDA.W EnemyProjectile_Var1,X : STA.W EnemyProjectile_XPositions,X
    BRA +

  .zero:
    LDA.W #$EE00 : STA.W EnemyProjectile_XPositions,X

+   LDA.W $0000,Y : STA.W EnemyProjectile_SpritemapPointers,X
    INY #2 : TYA : STA.W EnemyProjectile_InstListPointers,X
    LDA.W #$0001 : STA.W EnemyProjectile_InstructionTimers,X
    PLA
    RTS


;;; $D652: Instruction list - enemy projectile $D920 (n00b tube released air bubbles) ;;;
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


;;; $D69A: Instruction - assign n00b tube released air bubbles falling angle ;;;
Inststruction_EnemyProjectile_NoobTubeReleasedAirBubbles:
;; Parameters:
;;     X: Enemy projectile index
    JSL GenerateRandomNumber
    LDA.W RandomNumberSeed+1 : STA.W EnemyProjectile_XVelocity,X
    RTS


;;; $D6A5: Initialisation AI - enemy projectile $D904 (n00b tube crack) ;;;
Instruction_EnemyProjectile_NoobTubeCrack:
;; Parameters:
;;     Y: Enemy projectile index
    LDX.W PLM_Index
    JSL Calculate_PLM_Block_Coordinates
    LDA.W PLM_XBlock : ASL #4 : CLC : ADC.W #$0060 : STA.W EnemyProjectile_XPositions,Y
    LDA.W PLM_YBlock : ASL #4 : CLC : ADC.W #$0030 : STA.W EnemyProjectile_YPositions,Y
    RTS


;;; $D6C9: Initialisation AI - enemy projectile $D912 (n00b tube shard) ;;;
InitAI_EnemyProjectile_NoobTubeShard:
;; Parameters:
;;     Y: Enemy projectile index
;;     EnemyProjectile_InitParam0: Index. Multiple of 2, range 0..12h
    LDX.W PLM_Index
    JSL Calculate_PLM_Block_Coordinates
    LDX.W EnemyProjectile_InitParam0
    LDA.W PLM_XBlock : ASL #4 : CLC : ADC.W #$0060
    CLC : ADC.W .Xoffset,X : STA.W EnemyProjectile_Var1,Y
    LDA.W #$0000 : STA.W EnemyProjectile_Var0,Y
    LDA.W PLM_YBlock : ASL #4 : CLC : ADC.W #$0030
    CLC : ADC.W .Yoffsets,X : STA.W EnemyProjectile_YPositions,Y
    LDA.W .InstListPointer,X : STA.W EnemyProjectile_InstListPointers,Y
    LDA.W .Xvelocity,X : STA.W EnemyProjectile_XVelocity,Y
    LDA.W .Yvelocity,X : STA.W EnemyProjectile_YVelocity,Y
    RTS

  .Xoffset:
    dw $FFC8,$FFC0,$FFEC,$FFD8,$FFC0,$FFD0,$FFE8,$FFD8
    dw $0000,$FFF8
  .Yoffsets:
    dw $0008,$FFF4,$FFE6,$FFE8,$FFE0,$001C,$0010,$FFF8
    dw $FFE8,$0010
  .Xvelocity:
    dw $FE80,$FE80,$FF60,$FEE0,$FEE0,$FEC0,$FFA0,$FEA0                   ; Unit 1/100h px/frame
    dw $0000,$FFC0
  .Yvelocity:
    dw $0140,$FF00,$FE60,$FEE0,$FEE0,$01C0,$0240,$FFA0                   ; Unit 1/100h px/frame
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


;;; $D774: Initialisation AI - enemy projectile $D920 (n00b tube released air bubbles) ;;;
InitAI_EnemyProjectile_NoobTubeReleasedAirBubbles:
;; Parameters:
;;     Y: Enemy projectile index
;;     EnemyProjectile_InitParam0: Position table index. Multiple of 2, range 0..Ah
    LDX.W PLM_Index
    JSL Calculate_PLM_Block_Coordinates
    LDX.W EnemyProjectile_InitParam0
    LDA.W PLM_XBlock : ASL #4 : CLC : ADC.W .Xoffset,X : STA.W EnemyProjectile_Var1,Y
    LDA.W #$0000 : STA.W EnemyProjectile_Var0,Y
    LDA.W PLM_YBlock : ASL #4 : CLC : ADC.W .Yoffset,X : STA.W EnemyProjectile_YPositions,Y
    LDA.W #$FB00 : STA.W EnemyProjectile_YVelocity,Y
    RTS

  .Xoffset:
    dw $0028,$0050,$0068,$0078,$0098,$00B8
  .Yoffset:
    dw $0050,$0048,$0054,$0020,$0040,$0054


;;; $D7BF: Pre-instruction - n00b tube crack - flickering ;;;
PreInstruction_EnemyProjectile_NoobTubeCrack_Flickering:
;; Parameters:
;;     X: Enemy projectile index
    LDA.W EnemyProjectile_XPositions,X : CMP.W #$EE00 : BEQ +
    STA.W EnemyProjectile_Var0,X

+   LDA.W NMI_FrameCounter : LSR : BCC +
    LDA.W #$EE00 : STA.W EnemyProjectile_XPositions,X
    RTS

+   LDA.W EnemyProjectile_Var0,X : STA.W EnemyProjectile_XPositions,X
    RTS


;;; $D7DE: Pre-instruction - n00b tube crack - falling ;;;
PreInstruction_EnemyProjectile_NoobTubeCrack_Falling:
;; Parameters:
;;     X: Enemy projectile index

; >_<;
; Here's my optimisation:
;     LDA EnemyProjectile_YSubPositions,x : CLC : ADC #$C000 : STA EnemyProjectile_YSubPositions,x
;     LDA EnemyProjectile_YPositions,x : ADC #$0000 : STA EnemyProjectile_YPositions,x
    STZ.B DP_Temp12 : STZ.B DP_Temp14
    LDA.W #$00C0 : BPL +
    DEC.B DP_Temp14

+   STA.B DP_Temp13
    LDA.W EnemyProjectile_YSubPositions,X : CLC : ADC.B DP_Temp12 : STA.W EnemyProjectile_YSubPositions,X
    LDA.W EnemyProjectile_YPositions,X : ADC.B DP_Temp14 : STA.W EnemyProjectile_YPositions,X
    RTS


;;; $D7FD: Pre-instruction - n00b tube shard - flying ;;;
PreInstruction_EnemyProjectile_NoobTubeShard_Flying:
;; Parameters:
;;     X: Enemy projectile index
    STZ.B DP_Temp12 : STZ.B DP_Temp14
    LDA.W EnemyProjectile_XVelocity,X : BPL +
    DEC.B DP_Temp14

+   STA.B DP_Temp13
    LDA.W EnemyProjectile_Var0,X : CLC : ADC.B DP_Temp12 : STA.W EnemyProjectile_Var0,X
    LDA.W EnemyProjectile_Var1,X : ADC.B DP_Temp14 : STA.W EnemyProjectile_Var1,X
    STZ.B DP_Temp12 : STZ.B DP_Temp14
    LDA.W EnemyProjectile_YVelocity,X : BPL +
    DEC.B DP_Temp14

+   STA.B DP_Temp13
    LDA.W EnemyProjectile_YSubPositions,X : CLC : ADC.B DP_Temp12 : STA.W EnemyProjectile_YSubPositions,X
    LDA.W EnemyProjectile_YPositions,X : ADC.B DP_Temp14 : STA.W EnemyProjectile_YPositions,X
    JSR Delete_EnemyProjectile_IfVerticallyOffScreen
    RTS


;;; $D83D: Pre-instruction - n00b tube shard - falling ;;;
Instruction_EnemyProjectile_NoobTubeCrack_Falling:
;; Parameters:
;;     X: Enemy projectile index

; The `ORA #$0080` seems random/pointless. Given that the angle is chosen randomly, it has no real effect
    LDA.W EnemyProjectile_XVelocity,X : AND.W #$01FE : ORA.W #$0080 : TAX ; >_<
    STZ.B DP_Temp12 : STZ.B DP_Temp14
    CLC
    LDA.L SineCosineTables_8bitSine_SignExtended,X : AND.W #$FFFE : BPL +
    DEC.B DP_Temp14 : SEC : ORA.W #$0001

+   ROR #2 : STA.B DP_Temp13
    LDX.W EnemyProjectile_Index
    LDA.W EnemyProjectile_Var0,X : CLC : ADC.B DP_Temp12 : STA.W EnemyProjectile_Var0,X
    LDA.W EnemyProjectile_Var1,X : ADC.B DP_Temp14 : STA.W EnemyProjectile_Var1,X
    LDA.W EnemyProjectile_XVelocity,X : CLC : ADC.W #$0002 : STA.W EnemyProjectile_XVelocity,X
    STZ.B DP_Temp12 : STZ.B DP_Temp14
    LDA.W EnemyProjectile_YVelocity,X : BPL +
    DEC.B DP_Temp14

+   STA.B DP_Temp13
    LDA.W EnemyProjectile_YSubPositions,X : CLC : ADC.B DP_Temp12 : STA.W EnemyProjectile_YSubPositions,X
    LDA.W EnemyProjectile_YPositions,X : ADC.B DP_Temp14 : STA.W EnemyProjectile_YPositions,X
    JSR Delete_EnemyProjectile_IfVerticallyOffScreen
    RTS


;;; $D89F: Pre-instruction - n00b tube released air bubbles - falling ;;;
PreInstruction_EnemyProj_NoobTubeReleasedAirBubbles_Falling:
;; Parameters:
;;     X: Enemy projectile index

; The `ORA #$0080` seems random/pointless. Given that the angle is chosen randomly, it has no real effect
    LDA.W EnemyProjectile_XVelocity,X : AND.W #$01FE : ORA.W #$0080 : TAX ; >_<
    STZ.B DP_Temp12 : STZ.B DP_Temp14
    CLC
    LDA.L SineCosineTables_8bitSine_SignExtended,X : AND.W #$FFFE : BPL +
    DEC.B DP_Temp14 : SEC : ORA.W #$0001

+   ROR #2 : STA.B DP_Temp13
    LDX.W EnemyProjectile_Index
    LDA.W EnemyProjectile_Var0,X : CLC : ADC.B DP_Temp12 : STA.W EnemyProjectile_Var0,X
    LDA.W EnemyProjectile_Var1,X : ADC.B DP_Temp14 : STA.W EnemyProjectile_Var1,X
    LDA.W EnemyProjectile_XVelocity,X : CLC : ADC.W #$0004 : STA.W EnemyProjectile_XVelocity,X
; fallthrough to PreInstruction_EnemyProj_NoobTubeReleasedAirBubbles_Flying


;;; $D8DF: Pre-instruction - n00b tube released air bubbles - flying ;;;
PreInstruction_EnemyProj_NoobTubeReleasedAirBubbles_Flying:
;; Parameters:
;;     X: Enemy projectile index
    STZ.B DP_Temp12 : STZ.B DP_Temp14
    LDA.W EnemyProjectile_YVelocity,X : BPL +
    DEC.B DP_Temp14

+   STA.B DP_Temp13
    LDA.W EnemyProjectile_YSubPositions,X : CLC : ADC.B DP_Temp12 : STA.W EnemyProjectile_YSubPositions,X
    LDA.W EnemyProjectile_YPositions,X : ADC.B DP_Temp14 : STA.W EnemyProjectile_YPositions,X
    LDA.W EnemyProjectile_Var1,X : STA.W EnemyProjectile_XPositions,X
    RTS


;;; $D904: Enemy projectiles - n00b tube ;;;
EnemyProjectile_NoobTubeCrack:
    %EnemyProjectile(\
    %initAI(Instruction_EnemyProjectile_NoobTubeCrack),
    %preInst(RTS_8684FB),
    %instList(InstList_EnemyProjectile_NoobTubeCrack_0),
    %radius(0, 0),
    %properties($3000),
    %hitList(0),
    %shotList(InstList_EnemyProjectile_Delete))

EnemyProjectile_NoobTubeShard:
    %EnemyProjectile(\
    %initAI(InitAI_EnemyProjectile_NoobTubeShard),
    %preInst(PreInstruction_EnemyProjectile_NoobTubeShard_Flying),
    %instList(InstList_EnemyProjectile_NoobTubeShard_Parameter0_0),
    %radius(0, 0),
    %properties($3000),
    %hitList(0),
    %shotList(InstList_EnemyProjectile_Delete))

EnemyProjectile_NoobTubeAirBubbles:
    %EnemyProjectile(\
    %initAI(InitAI_EnemyProjectile_NoobTubeReleasedAirBubbles),
    %preInst(RTS_8684FB),
    %instList(InstList_EnemyProjectile_NoobTubeReleasedAirBubbles),
    %radius(0, 0),
    %properties($3000),
    %hitList(0),
    %shotList(InstList_EnemyProjectile_Delete))


;;; $D92E: Instruction list - cacatac spike - left - facing up ;;;
InstList_EnemyProjectile_CacatacSpike_Left_FacingUp:
    dw $0001,EnemyProjSpritemaps_CacatacSpikes_0
    dw Instruction_EnemyProjectile_Sleep


;;; $D934: Instruction list - cacatac spike - up-left ;;;
InstList_EnemyProjectile_CacatacSpike_UpLeft:
    dw $0001,EnemyProjSpritemaps_CacatacSpikes_1
    dw Instruction_EnemyProjectile_Sleep


;;; $D93A: Instruction list - cacatac spike - up ;;;
InstList_EnemyProjectile_CacatacSpike_Up:
    dw $0001,EnemyProjSpritemaps_CacatacSpikes_2
    dw Instruction_EnemyProjectile_Sleep


;;; $D940: Instruction list - cacatac spike - up-right ;;;
InstList_EnemyProjectile_CacatacSpike_UpRight:
    dw $0001,EnemyProjSpritemaps_CacatacSpikes_3
    dw Instruction_EnemyProjectile_Sleep


;;; $D946: Instruction list - cacatac spike - right - facing up ;;;
InstList_EnemyProjectile_CacatacSpike_Right_FacingUp:
    dw $0001,EnemyProjSpritemaps_CacatacSpikes_4
    dw Instruction_EnemyProjectile_Sleep


;;; $D94C: Instruction list - cacatac spike - left - facing down ;;;
InstList_EnemyProjectile_CacatacSpike_Left_FacingDown:
    dw $0001,EnemyProjSpritemaps_CacatacSpikes_5
    dw Instruction_EnemyProjectile_Sleep


;;; $D952: Instruction list - cacatac spike - down-left ;;;
InstList_EnemyProjectile_CacatacSpike_DownLeft:
    dw $0001,EnemyProjSpritemaps_CacatacSpikes_6
    dw Instruction_EnemyProjectile_Sleep


;;; $D958: Instruction list - cacatac spike - down ;;;
InstList_EnemyProjectile_CacatacSpike_Down:
    dw $0001,EnemyProjSpritemaps_CacatacSpikes_7
    dw Instruction_EnemyProjectile_Sleep


;;; $D95E: Instruction list - cacatac spike - down-right ;;;
InstList_EnemyProjectile_CacatacSpike_DownRight:
    dw $0001,EnemyProjSpritemaps_CacatacSpikes_8
    dw Instruction_EnemyProjectile_Sleep


;;; $D964: Instruction list - cacatac spike - right - facing down ;;;
InstList_EnemyProjectile_CacatacSpike_Down_FacingRight:
    dw $0001,EnemyProjSpritemaps_CacatacSpikes_9
    dw Instruction_EnemyProjectile_Sleep


;;; $D96A: Cacatac instruction list pointers ;;;
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


;;; $D97E: Cacatac function pointers ;;;
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


;;; $D992: Initialisation AI - enemy projectile $DAFE (cacatac spike) ;;;
InitAI_EnemyProjectile_CacatacSpike:
;; Parameters:
;;     Y: Enemy projectile index
;;     EnemyProjectile_InitParam0: Direction
;;         0: Left - facing up
;;         2: Up
;;         4: Right - facing up
;;         6: Left - facing down
;;         8: Down
;;         Ah: Right - facing down
;;         Ch: Up-left
;;         Eh: Up-right
;;         10h: Down-left
;;         12h: Down-right
    LDA.W EnemyProjectile_InitParam0 : STA.W EnemyProjectile_Var0,Y : TAX
    LDA.W CacatacSpike_InstListPointers,X : STA.W EnemyProjectile_InstListPointers,Y
    LDX.W EnemyIndex
    LDA.W Enemy.XPosition,X : STA.W EnemyProjectile_XPositions,Y
    LDA.W Enemy.XSubPosition,X : STA.W EnemyProjectile_XSubPositions,Y
    LDA.W Enemy.YPosition,X : STA.W EnemyProjectile_YPositions,Y
    LDA.W Enemy.YSubPosition,X : STA.W EnemyProjectile_YSubPositions,Y
    LDA.W #$FE00 : STA.W EnemyProjectile_YVelocity,Y
    LDA.W #$0200 : STA.W EnemyProjectile_XVelocity,Y
    LDA.W EnemyProjectile_InitParam0 : CMP.W #$000C : BMI .return
    LDA.W #$FE80 : STA.W EnemyProjectile_YVelocity,Y
    LDA.W #$0180 : STA.W EnemyProjectile_XVelocity,Y

  .return:
    RTS


;;; $D9DB: Pre-instruction - enemy projectile $DAFE (cacatac spike) ;;;
PreInstruction_EnemyProjectile_CacatacSpike:
;; Parameters:
;;     X: Enemy projectile index
    TXY
    LDX.W EnemyProjectile_Var0,Y
    JSR.W (CacatacSpike_FunctionPointers,X)
    JSR Delete_EnemyProjectile_IfOffScreen_duplicate
    RTS


;;; $D9E6: Move cacatac spike up ;;;
MoveCacatacSpikeUp:
;; Parameters:
;;     X: Enemy projectile index
    LDA.W EnemyProjectile_YVelocity,X : AND.W #$FF00 : XBA
    JSL Sign_Extend_A
    CLC : ADC.W EnemyProjectile_YPositions,X : STA.W EnemyProjectile_YPositions,X
    LDA.W EnemyProjectile_YVelocity,X : AND.W #$00FF : XBA
    CLC : ADC.W EnemyProjectile_YSubPositions,X : STA.W EnemyProjectile_YSubPositions,X
    BCC .return
    LDA.W EnemyProjectile_YPositions,X : INC : STA.W EnemyProjectile_YPositions,X

  .return:
    RTS


;;; $DA10: Move cacatac spike down ;;;
MoveCacatacSpikeDown:
;; Parameters:
;;     X: Enemy projectile index
    LDA.W EnemyProjectile_XVelocity,X : AND.W #$FF00 : XBA
    JSL Sign_Extend_A
    CLC : ADC.W EnemyProjectile_YPositions,X : STA.W EnemyProjectile_YPositions,X
    LDA.W EnemyProjectile_XVelocity,X : AND.W #$00FF : XBA
    CLC : ADC.W EnemyProjectile_YSubPositions,X : STA.W EnemyProjectile_YSubPositions,X
    BCC .return
    LDA.W EnemyProjectile_YPositions,X : INC : STA.W EnemyProjectile_YPositions,X

  .return:
    RTS


;;; $DA3A: Move cacatac spike left ;;;
MoveCacatacSpikeLeft:
;; Parameters:
;;     X: Enemy projectile index
    LDA.W EnemyProjectile_YVelocity,X : AND.W #$FF00 : XBA
    JSL Sign_Extend_A
    CLC : ADC.W EnemyProjectile_XPositions,X : STA.W EnemyProjectile_XPositions,X
    LDA.W EnemyProjectile_YVelocity,X : AND.W #$00FF : XBA
    CLC : ADC.W EnemyProjectile_XSubPositions,X : STA.W EnemyProjectile_XSubPositions,X
    BCC .return
    LDA.W EnemyProjectile_XPositions,X : INC : STA.W EnemyProjectile_XPositions,X

  .return:
    RTS


;;; $DA64: Move cacatac spike right ;;;
MoveCacatacSpikeRight:
    LDA.W EnemyProjectile_XVelocity,X : AND.W #$FF00 : XBA
    JSL Sign_Extend_A
    CLC : ADC.W EnemyProjectile_XPositions,X : STA.W EnemyProjectile_XPositions,X
    LDA.W EnemyProjectile_XVelocity,X : AND.W #$00FF : XBA
    CLC : ADC.W EnemyProjectile_XSubPositions,X : STA.W EnemyProjectile_XSubPositions,X
    BCC .return
    LDA.W EnemyProjectile_XPositions,X : INC : STA.W EnemyProjectile_XPositions,X

  .return:
    RTS


;;; $DA8E: Move cacatac spike left ;;;
MoveCacatacSpike_Left:
;; Parameters:
;;     Y: Enemy projectile index
    TYX
    JSR MoveCacatacSpikeLeft
    RTS


;;; $DA93: Move cacatac spike right ;;;
MoveCacatacSpike_Right:
;; Parameters:
;;     Y: Enemy projectile index
    TYX
    JSR MoveCacatacSpikeRight
    RTS


;;; $DA98: Move cacatac spike up ;;;
MoveCacatacSpike_Up:
;; Parameters:
;;     Y: Enemy projectile index
    TYX
    JSR MoveCacatacSpikeUp
    RTS


;;; $DA9D: Move cacatac spike down ;;;
MoveCacatacSpike_Down:
;; Parameters:
;;     Y: Enemy projectile index
    TYX
    JSR MoveCacatacSpikeDown
    RTS


;;; $DAA2: Move cacatac spike up-left ;;;
MoveCacatacSpike_UpLeft:
;; Parameters:
;;     Y: Enemy projectile index
    TYX
    JSR MoveCacatacSpikeLeft
    JSR MoveCacatacSpikeUp
    RTS


;;; $DAAA: Move cacatac spike down-left ;;;
MoveCacatacSpike_DownLeft:
;; Parameters:
;;     Y: Enemy projectile index
    TYX
    JSR MoveCacatacSpikeLeft
    JSR MoveCacatacSpikeDown
    RTS


;;; $DAB2: Move cacatac spike up-right ;;;
MoveCacatacSpike_UpRight:
;; Parameters:
;;     Y: Enemy projectile index
    TYX
    JSR MoveCacatacSpikeRight
    JSR MoveCacatacSpikeUp
    RTS


;;; $DABA: Move cacatac spike down-right ;;;
MoveCacatacSpike_DownRight:
;; Parameters:
;;     Y: Enemy projectile index
    TYX
    JSR MoveCacatacSpikeRight
    JSR MoveCacatacSpikeDown
    RTS


;;; $DAC2: Delete enemy projectile if off screen ;;;
Delete_EnemyProjectile_IfOffScreen_duplicate:
;; Parameters:
;;     X: Enemy projectile index

; Clone of Delete_EnemyProjectile_IfOffScreen
    JSR CheckIf_EnemyProjectile_IsOffScreen_duplicate
    BEQ .return
    LDA.W #$0000 : STA.W EnemyProjectile_ID,X

  .return:
    RTS


;;; $DACE: Check if enemy projectile is off screen ;;;
CheckIf_EnemyProjectile_IsOffScreen_duplicate:
;; Parameters:
;;     X: Enemy projectile index
;; Returns:
;;     A: 1 if off-screen, 0 otherwise

; Clone of CheckIf_EnemyProjectile_IsOffScreen
    LDA.W EnemyProjectile_XPositions,X : CMP.W Layer1XPosition : BMI .returnOffScreen
    LDA.W Layer1XPosition : CLC : ADC.W #$0100 : CMP.W EnemyProjectile_XPositions,X : BMI .returnOffScreen
    LDA.W EnemyProjectile_YPositions,X : CMP.W Layer1YPosition : BMI .returnOffScreen
    LDA.W Layer1YPosition : CLC : ADC.W #$0100 : CMP.W EnemyProjectile_YPositions,X : BMI .returnOffScreen
    LDA.W #$0000
    RTS

  .returnOffScreen:
    LDA.W #$0001
    RTS


;;; $DAFE: Enemy projectile - cacatac spike ;;;
EnemyProjectile_Cacatac:
    %EnemyProjectile(\
    %initAI(InitAI_EnemyProjectile_CacatacSpike),
    %preInst(PreInstruction_EnemyProjectile_CacatacSpike),
    %instList(InstList_EnemyProjectile_CacatacSpike_Left_FacingUp),
    %radius(2, 2),
    %properties($0005),
    %hitList(0),
    %shotList(InstList_EnemyProjectile_Delete))


;;; $DB0C: Instruction list - mini-Crocomire projectile ;;;
UNUSED_InstList_EnemyProjectile_StokeProjectile_86DB0B:
    dw $0010,UNUSED_EnemyProjSpritemaps_StokeProjectile_0_8DA94E
    dw $0010,UNUSED_EnemyProjSpritemaps_StokeProjectile_1_8DA955
    dw Instruction_EnemyProjectile_GotoY
    dw UNUSED_InstList_EnemyProjectile_StokeProjectile_86DB0B


;;; $DB18: Initialisation AI - mini-Crocomire projectile ;;;
UNUSED_InitAI_EnemyProjectile_StokeProjectile_86DB18:
;; Parameters:
;;     Y: Enemy projectile index
;;     EnemyProjectile_InitParam0: Direction. 0 = left, otherwise = right
    LDX.W EnemyIndex
    LDA.W #UNUSED_InstList_EnemyProjectile_StokeProjectile_86DB0B : STA.W EnemyProjectile_InstListPointers,Y
    LDA.W #UNUSED_EnemyProjectile_StokeProjectile_MoveLeft_86DB62 : STA.W EnemyProjectile_Var0,Y
    LDA.W EnemyProjectile_InitParam0 : BEQ .move
    LDA.W #UNUSED_EnemyProjectile_StokeProjectile_MoveRight_86DB8C : STA.W EnemyProjectile_Var0,Y

  .move:
    LDA.W Enemy.XPosition,X : STA.W EnemyProjectile_XPositions,Y
    LDA.W Enemy.XSubPosition,X : STA.W EnemyProjectile_XSubPositions,Y
    LDA.W Enemy.YPosition,X : CLC : ADC.W #$0002 : STA.W EnemyProjectile_YPositions,Y
    LDA.W Enemy.YSubPosition,X : STA.W EnemyProjectile_YSubPositions,Y
    LDA.W #$FF00 : STA.W EnemyProjectile_YVelocity,Y
    LDA.W #$0100 : STA.W EnemyProjectile_XVelocity,Y
    RTS


;;; $DB5B: Pre-instruction - mini-Crocomire projectile ;;;
UNUSED_PreInstruction_EnemyProjectile_StokeProjectile_86DB5B:
;; Parameters:
;;     X: Enemy projectile index
    JSR.W (EnemyProjectile_Var0,X)
    JSR UNUSED_Delete_EnemyProjectile_IfOffScreen_86DBB6
    RTS


;;; $DB62: Mini-Crocomire projectile function - move left ;;;
UNUSED_EnemyProjectile_StokeProjectile_MoveLeft_86DB62:
;; Parameters:
;;     X: Enemy projectile index
    LDA.W EnemyProjectile_YVelocity,X : AND.W #$FF00 : XBA
    JSL Sign_Extend_A
    CLC : ADC.W EnemyProjectile_XPositions,X : STA.W EnemyProjectile_XPositions,X
    LDA.W EnemyProjectile_YVelocity,X : AND.W #$00FF : XBA
    CLC : ADC.W EnemyProjectile_XSubPositions,X : STA.W EnemyProjectile_XSubPositions,X
    BCC .return
    LDA.W EnemyProjectile_XPositions,X : INC : STA.W EnemyProjectile_XPositions,X

  .return:
    RTS


;;; $DB8C: Mini-Crocomire projectile function - move right ;;;
UNUSED_EnemyProjectile_StokeProjectile_MoveRight_86DB8C:
;; Parameters:
;;     X: Enemy projectile index
    LDA.W EnemyProjectile_XVelocity,X : AND.W #$FF00 : XBA
    JSL Sign_Extend_A
    CLC : ADC.W EnemyProjectile_XPositions,X : STA.W EnemyProjectile_XPositions,X
    LDA.W EnemyProjectile_XVelocity,X : AND.W #$00FF : XBA
    CLC : ADC.W EnemyProjectile_XSubPositions,X : STA.W EnemyProjectile_XSubPositions,X
    BCC .return
    LDA.W EnemyProjectile_XPositions,X : INC : STA.W EnemyProjectile_XPositions,X

  .return:
    RTS


;;; $DBB6: Delete enemy projectile if off screen ;;;
UNUSED_Delete_EnemyProjectile_IfOffScreen_86DBB6:
;; Parameters:
;;     X: Enemy projectile index

; Clone of Delete_EnemyProjectile_IfOffScreen
    JSR CheckIf_EnemyProjectile_IsOffScreen_duplicate_again
    BEQ .return
    LDA.W #$0000 : STA.W EnemyProjectile_ID,X

  .return:
    RTS


;;; $DBC2: Check if enemy projectile is off screen ;;;
CheckIf_EnemyProjectile_IsOffScreen_duplicate_again:
;; Parameters:
;;     X: Enemy projectile index
;; Returns:
;;     A: 1 if off-screen, 0 otherwise

; Clone of CheckIf_EnemyProjectile_IsOffScreen
    LDA.W EnemyProjectile_XPositions,X : CMP.W Layer1XPosition : BMI .returnOffScreen
    LDA.W Layer1XPosition : CLC : ADC.W #$0100 : CMP.W EnemyProjectile_XPositions,X : BMI .returnOffScreen
    LDA.W EnemyProjectile_YPositions,X : CMP.W Layer1YPosition : BMI .returnOffScreen
    LDA.W Layer1YPosition : CLC : ADC.W #$0100 : CMP.W EnemyProjectile_YPositions,X : BMI .returnOffScreen
    LDA.W #$0000
    RTS

  .returnOffScreen:
    LDA.W #$0001
    RTS


;;; $DBF2: Enemy projectile - mini-Crocomire projectile ;;;
UNUSED_EnemyProjectile_Stoke_86DBF2:
    %EnemyProjectile(\
    %initAI(UNUSED_InitAI_EnemyProjectile_StokeProjectile_86DB18),
    %preInst(UNUSED_PreInstruction_EnemyProjectile_StokeProjectile_86DB5B),
    %instList(UNUSED_InstList_EnemyProjectile_StokeProjectile_86DB0B),
    %radius(2, 2),
    %properties($0005),
    %hitList(0),
    %shotList(InstList_EnemyProjectile_Delete))


;;; $DC00: (Shot) instruction list - enemy projectile $DE88 (spore spawner) ;;;
InstList_EnemyProjectile_Shot_SporeSpawner:
    dw $0001,EnemyProjSpritemaps_SporeSpawners_0
    dw Instruction_EnemyProjectile_Sleep


;;; $DC06: Instruction list - spore spawner - spawn spore ;;;
InstList_EnemyProjectile_SporeSpawner_SpawnSpore:
    dw $0001,EnemyProjSpritemaps_SporeSpawners_0
    dw $0006,EnemyProjSpritemaps_SporeSpawners_1
    dw Instruction_EnemyProjectile_SporeSpawner_SpawnSpore
    dw $0010,EnemyProjSpritemaps_SporeSpawners_2
    dw $0006,EnemyProjSpritemaps_SporeSpawners_1
    dw $0001,EnemyProjSpritemaps_SporeSpawners_0
    dw Instruction_EnemyProjectile_Sleep


;;; $DC1E: Instruction list - enemy projectile $DE7A (spores) ;;;
InstList_EnemyProjectile_Spores:
    dw $0005,EnemyProjSpritemaps_Spores_0
    dw $0005,EnemyProjSpritemaps_Spores_1
    dw $0005,EnemyProjSpritemaps_Spores_2
    dw Instruction_EnemyProjectile_GotoY
    dw InstList_EnemyProjectile_Spores


;;; $DC2E: (Shot) instruction list - enemy projectile $DE6C (Spore Spawn's stalk) ;;;
InstList_EnemyProjectile_SporeSpawnsStalk:
    dw $0005,EnemyProjSpritemaps_SporeSpawnsStalk
    dw Instruction_EnemyProjectile_Sleep


;;; $DC34: Shot instruction list - enemy projectile $DE7A (spores) ;;;
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


;;; $DC5A: Instruction - enemy projectile properties = 3000h ;;;
Instruction_EnemyProjectile_Spores_SetProperties3000:
;; Parameters:
;;     X: Enemy projectile index

; Disable collisions with projectiles, die on contact, enable collisions with Samus, high priority
    LDA.W #$3000 : STA.W EnemyProjectile_Properties,X
    RTS


;;; $DC61: Instruction - spawn enemy drops with Spore Spawn's drop chances ;;;
Instruction_EnemyProjectile_Spores_SpawnEnemyDrops:
;; Parameters:
;;     X: Enemy projectile index
    PHX : PHY
    LDA.W EnemyProjectile_XPositions,X : STA.B DP_Temp12
    LDA.W EnemyProjectile_YPositions,X : STA.B DP_Temp14
    LDA.W #EnemyHeaders_SporeSpawnStalk
    JSL Spawn_Enemy_Drops
    PLY : PLX
    RTS


;;; $DC77: Instruction - spawn spore enemy projectile ;;;
Instruction_EnemyProjectile_SporeSpawner_SpawnSpore:
;; Parameters:
;;     X: Enemy projectile index
    PHX : PHY
    LDA.W EnemyProjectile_XPositions,X : STA.B DP_Temp12
    LDA.W EnemyProjectile_YPositions,X : STA.B DP_Temp14
    LDY.W #EnemyProjectile_SporeSpawnSpores
    JSL SpawnEnemyProjectileY_ParameterA_RoomGraphics
    PLY : PLX
    RTS


;;; $DC8D: Initialisation AI - enemy projectile $DE7A (spores) ;;;
InitAI_EnemyProjectile_Spores:
;; Parameters:
;;     Y: Enemy projectile index
;;     $12: X position
;;     $14: Y position
    PHX
    LDA.B DP_Temp12 : STA.W EnemyProjectile_XPositions,Y : STA.W EnemyProjectile_Var1,Y
    LDA.B DP_Temp14 : STA.W EnemyProjectile_YPositions,Y
    LDA.W #$0200 : STA.W EnemyProjectile_GraphicsIndices,Y
    PLX
    RTS


;;; $DCA3: Initialisation AI - enemy projectile $DE6C (Spore Spawn's stalk) ;;;
InitAI_EnemyProjectile_SporeSpawnsStalk:
;; Parameters:
;;     Y: Enemy projectile index
;;     EnemyProjectile_InitParam0: Y offset. Unit 8px
    LDA.W EnemyProjectile_InitParam0 : ASL : TAX
    LDA.W .data,X : CLC : ADC.W Enemy.YPosition : STA.W EnemyProjectile_YPositions,Y
    LDA.W Enemy.XPosition : STA.W EnemyProjectile_XPositions,Y
    RTS

  .data:
    dw $FFC0,$FFC8,$FFD0,$FFD8,$FFE0


if !FEATURE_KEEP_UNREFERENCED
;;; $DCC3: Unused. Alternate Spore Spawn stalk initialisation AI ;;;
UNUSED_InitAI_EnemyProjectile_SporeSpawnsStalk_86DCC3:
; Spawns 20h px above the highest Spore Spawn stalk
; Could maybe be an abandoned version of the breaking of the ceiling, but I'm going with the unused stalk guess
    LDA.W Enemy.YPosition : CLC : ADC.W #$FFA0 : STA.W EnemyProjectile_YPositions,Y
    LDA.W Enemy.XPosition : STA.W EnemyProjectile_XPositions,Y
    RTS
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $DCD4: Initialisation AI - enemy projectile $DE88 (spore spawner) ;;;
InitAI_EnemyProjectile_SporeSpawner:
;; Parameters:
;;     Y: Enemy projectile index
;;     EnemyProjectile_InitParam0: X offset. Unit 40h px
    LDA.W EnemyProjectile_InitParam0 : ASL : TAX
    LDA.W .data,X : STA.W EnemyProjectile_XPositions,Y
    LDA.W #$0208 : STA.W EnemyProjectile_YPositions,Y
    RTS

  .data:
    dw $0020,$0060,$00A0,$00E0


;;; $DCEE: Pre-instruction - enemy projectile $DE7A (spores) ;;;
PreInstruction_EnemyProjectile_Spores:
;; Parameters:
;;     X: Enemy projectile index
    LDA.W EnemyProjectile_Var0,X : AND.W #$00FF : TAY
    LDA.W SporeMovementData,Y : AND.W #$00FF
    JSL Sign_Extend_A
    STA.B DP_Temp12
    LDA.W EnemyProjectile_Var1,X : BIT.W #$0080 : BEQ +
    LDA.B DP_Temp12 : EOR.W #$FFFF : INC : STA.B DP_Temp12

+   LDA.B DP_Temp12 : CLC : ADC.W EnemyProjectile_XPositions,X : STA.W EnemyProjectile_XPositions,X
    LDA.W SporeMovementData+1,Y : AND.W #$00FF
    JSL Sign_Extend_A
    STA.B DP_Temp12
    CLC : ADC.W EnemyProjectile_YPositions,X
    CLC : ADC.B DP_Temp12 : STA.W EnemyProjectile_YPositions,X
    CMP.W #$0300 : BMI +
    STZ.W EnemyProjectile_ID,X

+   LDA.W EnemyProjectile_Var0,X : INC #2 : AND.W #$00FF : STA.W EnemyProjectile_Var0,X
    RTS


;;; $DD44: RTS. Pre-instruction - enemy projectile $DE6C (Spore Spawn's stalk) ;;;
RTS_86DD44:
    RTS


;;; $DD45: RTS ;;;
RTS_86DD45:
    RTS


;;; $DD46: Pre-instruction - enemy projectile $DE88 (spore spawner) ;;;
PreInstruction_EnemyProjectile_SporeSpawner:
;; Parameters:
;;     X: Enemy projectile index
    LDA.L SporeSpawn.sporeGenerationFlag : BEQ .enabled
    RTS

  .enabled:
    LDA.W EnemyProjectile_Var1,X : BNE .decrementTimer
    LDA.W #InstList_EnemyProjectile_SporeSpawner_SpawnSpore : STA.W EnemyProjectile_InstListPointers,X
    LDA.W #$0001 : STA.W EnemyProjectile_InstructionTimers,X
    JSL GenerateRandomNumber
    AND.W #$01FF : STA.W EnemyProjectile_Var1,X

  .decrementTimer:
    DEC.W EnemyProjectile_Var1,X
    RTS


;;; $DD6C: Spore movement data ;;;
SporeMovementData:
    db $00,$01, $01,$00, $00,$01, $01,$00, $00,$01, $01,$00, $00,$01, $01,$00
    db $00,$01, $01,$00, $01,$00, $00,$01, $01,$00, $00,$01, $01,$00, $00,$01
    db $01,$00, $00,$01, $01,$00, $01,$00, $00,$01, $01,$00, $00,$01, $01,$00
    db $01,$00, $00,$01, $01,$00, $00,$01, $01,$00, $01,$00, $00,$01, $01,$00
    db $01,$00, $00,$01, $01,$00, $01,$00, $00,$01, $01,$00, $01,$00, $01,$00
    db $00,$01, $01,$00, $01,$00, $01,$00, $00,$01, $01,$00, $01,$00, $01,$00
    db $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00
    db $01,$00, $00,$FF, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00
    db $00,$FF, $01,$00, $01,$00, $00,$00, $FF,$01, $FF,$01, $FF,$01, $FF,$00
    db $00,$01, $FF,$01, $FF,$01, $FF,$00, $00,$01, $FF,$01, $FF,$00, $00,$01
    db $FF,$00, $00,$01, $FF,$00, $00,$01, $FF,$00, $FF,$01, $FF,$01, $FF,$00
    db $00,$01, $FF,$00, $FF,$01, $FF,$00, $00,$01, $FF,$00, $FF,$01, $FF,$00
    db $FF,$00, $00,$01, $FF,$00, $FF,$00, $00,$01, $FF,$00, $FF,$00, $FF,$00
    db $FF,$01, $FF,$00, $FF,$00, $FF,$00, $FF,$00, $FF,$00, $FF,$00, $FF,$00
    db $FF,$00, $FF,$00, $00,$FF, $FF,$00, $FF,$00, $FF,$00, $FF,$FF, $FF,$00
    db $FF,$00, $FF,$00, $00,$FF, $FF,$00, $FF,$00, $FF,$FF, $FF,$00, $00,$00


;;; $DE6C: Enemy projectiles - Spore Spawn ;;;
EnemyProjectile_SporeSpawnStalk:
    %EnemyProjectile(\
    %initAI(InitAI_EnemyProjectile_SporeSpawnsStalk),
    %preInst(RTS_86DD44),
    %instList(InstList_EnemyProjectile_SporeSpawnsStalk),
    %radius(8, 8),
    %properties($2000),
    %hitList(0),
    %shotList(InstList_EnemyProjectile_SporeSpawnsStalk))

EnemyProjectile_SporeSpawnSpores:
    %EnemyProjectile(\
    %initAI(InitAI_EnemyProjectile_Spores),
    %preInst(PreInstruction_EnemyProjectile_Spores),
    %instList(InstList_EnemyProjectile_Spores),
    %radius(2, 2),
    %properties($8004),
    %hitList(0),
    %shotList(InstList_EnemyProjectile_Shot_Spores))

EnemyProjectile_SporeSpawnSporeSpawner:
    %EnemyProjectile(\
    %initAI(InitAI_EnemyProjectile_SporeSpawner),
    %preInst(PreInstruction_EnemyProjectile_SporeSpawner),
    %instList(InstList_EnemyProjectile_Shot_SporeSpawner),
    %radius(2, 2),
    %properties($2000),
    %hitList(0),
    %shotList(InstList_EnemyProjectile_Shot_SporeSpawner))


;;; $DE96: Instruction list - namihe/fune fireball - left ;;;
InstList_EnemyProjectile_NamiFuneFireball_Left:
    dw $0005,EnemyProjSpritemaps_Namihe_Fune_Fireball_0
    dw $0005,EnemyProjSpritemaps_Namihe_Fune_Fireball_1
    dw $0005,EnemyProjSpritemaps_Namihe_Fune_Fireball_2
    dw Instruction_EnemyProjectile_GotoY
    dw InstList_EnemyProjectile_NamiFuneFireball_Left


;;; $DEA6: Instruction list - namihe/fune fireball - right ;;;
InstList_EnemyProjectile_NamiFuneFireball_Right:
    dw $0005,EnemyProjSpritemaps_Namihe_Fune_Fireball_3
    dw $0005,EnemyProjSpritemaps_Namihe_Fune_Fireball_4
    dw $0005,EnemyProjSpritemaps_Namihe_Fune_Fireball_5
    dw Instruction_EnemyProjectile_GotoY
    dw InstList_EnemyProjectile_NamiFuneFireball_Right


;;; $DEB6: Namihe/fune fireball X velocity table ;;;
NamiFuneFireball_XVelocityTable:
; Left velocity, right velocity
  .left:
    dw $FFC0
  .right:
    dw       $0040, $FF80,$0080, $FF40,$00C0, $FF00,$0100
    dw $FEC0,$0140, $FE80,$0180, $FE40,$01C0, $FE00,$0200


;;; $DED6: Initialisation AI - enemy projectile $DFBC/$DFCA (namihe/fune fireball) ;;;
InitAI_EnemyProjectile_NamiFuneFireball:
;; Parameters:
;;     Y: Enemy projectile index
;;     EnemyProjectile_InitParam0: Direction. 0 = left, otherwise = right
    LDX.W EnemyIndex
    LDA.W #InstList_EnemyProjectile_NamiFuneFireball_Left : STA.W EnemyProjectile_InstListPointers,Y
    LDA.W #Function_EnemyProjectile_NamiFuneFireball_Left : STA.W EnemyProjectile_Var0,Y
    LDA.W EnemyProjectile_InitParam0 : BEQ .setPosition
    LDA.W #InstList_EnemyProjectile_NamiFuneFireball_Right : STA.W EnemyProjectile_InstListPointers,Y
    LDA.W #Function_EnemyProjectile_NamiFuneFireball_Right : STA.W EnemyProjectile_Var0,Y

  .setPosition:
    LDA.W Enemy.XPosition,X : STA.W EnemyProjectile_XPositions,Y
    LDA.W Enemy.XSubPosition,X : STA.W EnemyProjectile_XSubPositions,Y
    LDA.W Enemy.YPosition,X : STA.W EnemyProjectile_YPositions,Y
    LDA.W Enemy.YSubPosition,X : STA.W EnemyProjectile_YSubPositions,Y
    LDA.W Enemy.init0,X : AND.W #$000F : BEQ .Fune
    LDA.W EnemyProjectile_YPositions,Y : CLC : ADC.W #$0004 : STA.W EnemyProjectile_YPositions,Y

  .Fune:
    LDA.W Enemy.init1,X : AND.W #$00FF : ASL #2 : TAX
    LDA.W NamiFuneFireball_XVelocityTable_left,X : STA.W EnemyProjectile_YVelocity,Y
    LDA.W NamiFuneFireball_XVelocityTable_right,X : STA.W EnemyProjectile_XVelocity,Y
    LDX.W EnemyIndex
    RTS


;;; $DF39: Pre-instruction - enemy projectile $DFBC/$DFCA (namihe/fune fireball) ;;;
PreInstruction_EnemyProjectile_NamiFuneFireball:
;; Parameters:
;;     X: Enemy projectile index
    JSR.W (EnemyProjectile_Var0,X)
    JSR Delete_EnemyProjectile_ifOffScreen_duplicate_again
    RTS


;;; $DF40: Namihe/fune fireball function - left ;;;
Function_EnemyProjectile_NamiFuneFireball_Left:
;; Parameters:
;;     X: Enemy projectile index
    LDA.W EnemyProjectile_YVelocity,X : AND.W #$FF00 : XBA
    JSL Sign_Extend_A
    CLC : ADC.W EnemyProjectile_XPositions,X : STA.W EnemyProjectile_XPositions,X
    LDA.W EnemyProjectile_YVelocity,X : AND.W #$00FF : XBA
    CLC : ADC.W EnemyProjectile_XSubPositions,X : STA.W EnemyProjectile_XSubPositions,X
    BCC .return
    LDA.W EnemyProjectile_XPositions,X : INC : STA.W EnemyProjectile_XPositions,X

  .return:
    RTS


;;; $DF6A: Namihe/fune fireball function - right ;;;
Function_EnemyProjectile_NamiFuneFireball_Right:
;; Parameters:
;;     X: Enemy projectile index
    LDA.W EnemyProjectile_XVelocity,X : AND.W #$FF00 : XBA
    JSL Sign_Extend_A
    CLC : ADC.W EnemyProjectile_XPositions,X : STA.W EnemyProjectile_XPositions,X
    LDA.W EnemyProjectile_XVelocity,X : AND.W #$00FF : XBA
    CLC : ADC.W EnemyProjectile_XSubPositions,X : STA.W EnemyProjectile_XSubPositions,X
    BCC .return
    LDA.W EnemyProjectile_XPositions,X : INC : STA.W EnemyProjectile_XPositions,X

  .return:
    RTS


;;; $DF94: Delete enemy projectile if off screen ;;;
Delete_EnemyProjectile_ifOffScreen_duplicate_again:
;; Parameters:
;;     X: Enemy projectile index
    JSR CheckIf_EnemyProjectile_IsOffScreen_duplicate_again
    BEQ .return
    LDA.W #$0000 : STA.W EnemyProjectile_ID,X

  .return:
    RTS


if !FEATURE_KEEP_UNREFERENCED
;;; $DFA0: Unused. Check if enemy projectile is horizontally off screen ;;;
UNUSED_CheckIf_EnemyProj_isHorizontallyOffScreen_86DFA0:
;; Parameters:
;;     X: Enemy projectile index
;; Returns:
;;     A: 1 if off-screen, 0 otherwise
    LDA.W EnemyProjectile_XPositions,X : CMP.W Layer1XPosition : BMI .returnOffScreen
    LDA.W Layer1XPosition : CLC : ADC.W #$0100 : CMP.W EnemyProjectile_XPositions,X : BMI .returnOffScreen
    LDA.W #$0000
    RTS

  .returnOffScreen:
    LDA.W #$0001
    RTS
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $DFBC: Enemy projectiles - namihe/fune fireball ;;;
EnemyProjectile_NamiheFireball:
    %EnemyProjectile(\
    %initAI(InitAI_EnemyProjectile_NamiFuneFireball),
    %preInst(PreInstruction_EnemyProjectile_NamiFuneFireball),
    %instList(InstList_EnemyProjectile_NamiFuneFireball_Left),
    %radius(4, 8),
    %properties($00C8),
    %hitList(0),
    %shotList(InstList_EnemyProjectile_Delete))

EnemyProjectile_FuneFireball:
    %EnemyProjectile(\
    %initAI(InitAI_EnemyProjectile_NamiFuneFireball),
    %preInst(PreInstruction_EnemyProjectile_NamiFuneFireball),
    %instList(InstList_EnemyProjectile_NamiFuneFireball_Left),
    %radius(4, 8),
    %properties($003C),
    %hitList(0),
    %shotList(InstList_EnemyProjectile_Delete))


;;; $DFD8: Instruction list - lava thrown by magdollite - left ;;;
InstList_EnemyProjectile_MagdolliteFlame_Left:
    dw $0001,EnemyProjSpritemaps_MagdolliteFlame_0
    dw Instruction_EnemyProjectile_Sleep


;;; $DFDE: Instruction list - lava thrown by magdollite - right ;;;
InstList_EnemyProjectile_MagdolliteFlame_Right:
    dw $0001,EnemyProjSpritemaps_MagdolliteFlame_1
    dw Instruction_EnemyProjectile_Sleep


;;; $DFE4: Shot instruction list - enemy projectile $E0E0 (lava thrown by magdollite) ;;;
InstList_EnemyProjectile_Shot_MagdolliteFlame:
    dw Instruction_EnemyProjectile_MagdolliteFlame_SpawnDrops
    dw Instruction_EnemyProjectile_GotoY
    dw InstList_EnemyProjectile_Delete


;;; $DFEA: Instruction - spawn enemy drops with magdollite's drop chances ;;;
Instruction_EnemyProjectile_MagdolliteFlame_SpawnDrops:
;; Parameters:
;;     X: Enemy projectile index
    PHY : PHX
    LDA.W EnemyProjectile_XPositions,X : STA.B DP_Temp12
    LDA.W EnemyProjectile_YPositions,X : STA.B DP_Temp14
    LDA.W #EnemyHeaders_Magdollite
    JSL Spawn_Enemy_Drops
    PLX : PLY
    RTS


;;; $E000: Initialisation AI - enemy projectile $E0E0 (lava thrown by magdollite) ;;;
InitAI_EnemyProjectile_MagdolliteFlame:
;; Parameters:
;;     Y: Enemy projectile index
;;     EnemyProjectile_InitParam0: Direction. 0 = left, otherwise = right
    LDX.W EnemyIndex
    LDA.W #InstList_EnemyProjectile_MagdolliteFlame_Left : STA.W EnemyProjectile_InstListPointers,Y
    LDA.W #Function_EnemyProjectile_MagdolliteFlame_Left : STA.W EnemyProjectile_Var0,Y
    LDA.W EnemyProjectile_InitParam0 : BEQ .notRight
    LDA.W #InstList_EnemyProjectile_MagdolliteFlame_Right : STA.W EnemyProjectile_InstListPointers,Y
    LDA.W #Function_EnemyProjectile_MagdolliteFlame_Right : STA.W EnemyProjectile_Var0,Y

  .notRight:
    LDA.W Enemy.XPosition,X : STA.W EnemyProjectile_XPositions,Y
    LDA.W Enemy.XSubPosition,X : STA.W EnemyProjectile_XSubPositions,Y
    LDA.W Enemy.YPosition,X : CLC : ADC.W #$0002 : STA.W EnemyProjectile_YPositions,Y
    LDA.W Enemy.YSubPosition,X : STA.W EnemyProjectile_YSubPositions,Y
    LDA.W #$FD00 : STA.W EnemyProjectile_YVelocity,Y
    LDA.W #$0300 : STA.W EnemyProjectile_XVelocity,Y
    RTS


;;; $E049: Pre-instruction - enemy projectile $E0E0 (lava thrown by magdollite) ;;;
PreInstruction_EnemyProjectile_MagdolliteFlame:
;; Parameters:
;;     X: Enemy projectile index
    JSR.W (EnemyProjectile_Var0,X)
    JSR Delete_EnemyProjectile_IfOffScreen_duplicate_again2
    RTS


;;; $E050: Lava thrown by magdollite function - left ;;;
Function_EnemyProjectile_MagdolliteFlame_Left:
;; Parameters:
;;     X: Enemy projectile index

; Clone of Function_EnemyProjectile_NamiFuneFireball_Left
    LDA.W EnemyProjectile_YVelocity,X : AND.W #$FF00 : XBA
    JSL Sign_Extend_A
    CLC : ADC.W EnemyProjectile_XPositions,X : STA.W EnemyProjectile_XPositions,X
    LDA.W EnemyProjectile_YVelocity,X : AND.W #$00FF : XBA
    CLC : ADC.W EnemyProjectile_XSubPositions,X : STA.W EnemyProjectile_XSubPositions,X : BCC .return
    LDA.W EnemyProjectile_XPositions,X : INC : STA.W EnemyProjectile_XPositions,X

  .return:
    RTS


;;; $E07A: Lava thrown by magdollite function - right ;;;
Function_EnemyProjectile_MagdolliteFlame_Right:
;; Parameters:
;;     X: Enemy projectile index

; Clone of Function_EnemyProjectile_NamiFuneFireball_Right
    LDA.W EnemyProjectile_XVelocity,X : AND.W #$FF00 : XBA
    JSL Sign_Extend_A
    CLC : ADC.W EnemyProjectile_XPositions,X : STA.W EnemyProjectile_XPositions,X
    LDA.W EnemyProjectile_XVelocity,X : AND.W #$00FF : XBA
    CLC : ADC.W EnemyProjectile_XSubPositions,X : STA.W EnemyProjectile_XSubPositions,X : BCC .return
    LDA.W EnemyProjectile_XPositions,X : INC : STA.W EnemyProjectile_XPositions,X

  .return:
    RTS


;;; $E0A4: Delete enemy projectile if off screen ;;;
Delete_EnemyProjectile_IfOffScreen_duplicate_again2:
;; Parameters:
;;     X: Enemy projectile index

; Clone of Delete_EnemyProjectile_IfOffScreen
    JSR CheckIf_EnemyProjectile_IsOffScreen_duplicate_again3
    BEQ .return
    LDA.W #$0000 : STA.W EnemyProjectile_ID,X

  .return:
    RTS


;;; $E0B0: Check if enemy projectile is off screen ;;;
CheckIf_EnemyProjectile_IsOffScreen_duplicate_again3:
;; Parameters:
;;     X: Enemy projectile index
;; Returns:
;;     A: 1 if off-screen, 0 otherwise

; Clone of CheckIf_EnemyProjectile_IsOffScreen
    LDA.W EnemyProjectile_XPositions,X : CMP.W Layer1XPosition : BMI .returnOffScreen
    LDA.W Layer1XPosition : CLC : ADC.W #$0100 : CMP.W EnemyProjectile_XPositions,X : BMI .returnOffScreen
    LDA.W EnemyProjectile_YPositions,X : CMP.W Layer1YPosition : BMI .returnOffScreen
    LDA.W Layer1YPosition : CLC : ADC.W #$0100 : CMP.W EnemyProjectile_YPositions,X : BMI .returnOffScreen
    LDA.W #$0000
    RTS

  .returnOffScreen:
    LDA.W #$0001
    RTS


;;; $E0E0: Enemy projectile - lava thrown by magdollite ;;;
EnemyProjectile_Magdollite:
    %EnemyProjectile(\
    %initAI(InitAI_EnemyProjectile_MagdolliteFlame),
    %preInst(PreInstruction_EnemyProjectile_MagdolliteFlame),
    %instList(InstList_EnemyProjectile_MagdolliteFlame_Left),
    %radius(2, 2),
    %properties($8028),
    %hitList(0),
    %shotList(InstList_EnemyProjectile_Shot_MagdolliteFlame))


;;; $E0EE: Instruction list - dust cloud / explosion - index = 0 (unused. Beam charge) ;;;
UNUSED_InstList_EnemyProj_MiscDust_0_BeamCharge_86E0EE:
    dw $0003,EnemyProjSpritemaps_DustCloud_Explosion_35
    dw $0003,EnemyProjSpritemaps_DustCloud_Explosion_36
    dw $0003,EnemyProjSpritemaps_DustCloud_Explosion_37
    dw $0003,EnemyProjSpritemaps_DustCloud_Explosion_38
    dw Instruction_EnemyProjectile_Delete


;;; $E100: Instruction list - dust cloud / explosion - index = 1 (Mother Brain elbow charge particles) ;;;
InstList_EnemyProj_MiscDust_1_MotherBrainElbowChargeParticle:
    dw $0005,EnemyProjSpritemaps_DrayTurretProj_DustCloud_Explosion_0
    dw $0004,EnemyProjSpritemaps_DrayTurretProj_DustCloud_Explosion_1
    dw $0003,EnemyProjSpritemaps_DrayTurretProj_DustCloud_Explosion_2
    dw $0003,EnemyProjSpritemaps_DrayTurretProj_DustCloud_Explosion_3
    dw $0003,EnemyProjSpritemaps_DrayTurretProj_DustCloud_Explosion_4
    dw $0003,EnemyProjSpritemaps_DrayTurretProj_DustCloud_Explosion_5
    dw Instruction_EnemyProjectile_Delete


;;; $E11A: Instruction list - dust cloud / explosion - index = 2 (Mother Brain elbow charge energy) ;;;
InstList_EnemyProj_MiscDust_2_MotherBrainElbowChargeEnergy:
    dw $0004,EnemyProjSpritemaps_DrayTurretProj_DustCloud_Explosion_6
    dw $0003,EnemyProjSpritemaps_DrayTurretProj_DustCloud_Explosion_7
    dw $0002,EnemyProjSpritemaps_DrayTurretProj_DustCloud_Explosion_8
    dw $0002,EnemyProjSpritemaps_DrayTurretProj_DustCloud_Explosion_9
    dw $0002,EnemyProjSpritemaps_DrayTurretProj_DustCloud_Explosion_A
    dw $0002,EnemyProjSpritemaps_DrayTurretProj_DustCloud_Explosion_B
    dw $000C,EnemyProjSpritemaps_Common_SmallExplosion_0
    dw Instruction_EnemyProjectile_Delete


;;; $E138: Instruction list - dust cloud / explosion - index = 3 (small explosion) ;;;
InstList_EnemyProj_MiscDust_3_SmallExplosion:
    dw $0004,EnemyProjSpritemaps_Common_SmallExplosion_0
    dw $0006,EnemyProjSpritemaps_Common_SmallExplosion_1
    dw $0005,EnemyProjSpritemaps_Common_SmallExplosion_2
    dw $0005,EnemyProjSpritemaps_Common_SmallExplosion_3
    dw $0005,EnemyProjSpritemaps_Common_SmallExplosion_4
    dw $0006,EnemyProjSpritemaps_Common_SmallExplosion_5
    dw Instruction_EnemyProjectile_Delete


;;; $E152: Instruction list - dust cloud / explosion - index = 4 (unused. Bomb explosion) / enemy projectile $CBAD (Mother Brain's rainbow beam explosion) ;;;
InstList_EnemyProj_MiscDust_4_MotherBrainRainbowBeamExplosion:
    dw $0003,EnemyProjSpritemaps_DustCloud_Explosion_39
    dw $0003,EnemyProjSpritemaps_DustCloud_Explosion_3A
    dw $0004,EnemyProjSpritemaps_DustCloud_Explosion_3B
    dw $0004,EnemyProjSpritemaps_DustCloud_Explosion_3C
    dw $0004,EnemyProjSpritemaps_DustCloud_Explosion_3D
    dw Instruction_EnemyProjectile_Delete


;;; $E168: Instruction list - dust cloud / explosion - index = 5 (unused. Beam trail) ;;;
UNUSED_InstList_EnemyProj_MiscDust_5_BeamTrail_86E168:
    dw $0008,EnemyProjSpritemaps_DustCloud_Explosion_3E
    dw $0008,EnemyProjSpritemaps_DustCloud_Explosion_3F
    dw $0008,EnemyProjSpritemaps_DustCloud_Explosion_40
    dw $0008,EnemyProjSpritemaps_DustCloud_Explosion_41
    dw $0018,EnemyProjSpritemaps_DrayTurretProj_DustCloud_Explosion_9
    dw Instruction_EnemyProjectile_Delete


;;; $E17E: Instruction list - dust cloud / explosion - index = 6 (dud shot / tiny explosion) ;;;
InstList_EnemyProj_MiscDust_6_DudShot_TinyExplosion:
    dw $0004,EnemyProjSpritemaps_DustCloud_Explosion_45
    dw $0004,EnemyProjSpritemaps_DustCloud_Explosion_46
    dw $0004,EnemyProjSpritemaps_DustCloud_Explosion_47
    dw $0004,EnemyProjSpritemaps_DustCloud_Explosion_48
    dw $0004,EnemyProjSpritemaps_DustCloud_Explosion_49
    dw $0004,EnemyProjSpritemaps_DustCloud_Explosion_4A
    dw Instruction_EnemyProjectile_Delete


;;; $E198: Instruction list - dust cloud / explosion - index = 7 (unused. Power bomb) ;;;
UNUSED_InstList_EnemyProj_MiscDust_7_PowerBomb_86E198:
    dw $0005,EnemyProjSpritemaps_DustCloud_Explosion_42
    dw $0005,EnemyProjSpritemaps_DustCloud_Explosion_43
    dw $0005,EnemyProjSpritemaps_DustCloud_Explosion_44
    dw Instruction_EnemyProjectile_Delete


;;; $E1A6: Instruction list - dust cloud / explosion - index = 8 (unused. Elevator pad) ;;;
UNUSED_InstList_EnemyProj_MiscDust_8_ElevatorPad_86E1A6:
    dw $0001,EnemyProjSpritemaps_CeresElevatorPad_DustCloud_Explosion_0
    dw $0001,EnemyProjSpritemaps_CeresElevatorPad_DustCloud_Explosion_1
    dw Instruction_EnemyProjectile_Delete


;;; $E1B0: Instruction list - dust cloud / explosion - index = 9 (small dust cloud) ;;;
InstList_EnemyProj_MiscDust_9_SmallDustCloud:
    dw $0005,EnemyProjSpritemaps_DustCloud_Explosion_4F
    dw $0005,EnemyProjSpritemaps_DustCloud_Explosion_4B
    dw $0005,EnemyProjSpritemaps_DustCloud_Explosion_4C
    dw $0005,EnemyProjSpritemaps_DustCloud_Explosion_4D
    dw $0005,EnemyProjSpritemaps_DustCloud_Explosion_4E
    dw Instruction_EnemyProjectile_Delete


;;; $E1C6: Instruction list - dust cloud / explosion - index = Ah (corpse dust cloud) ;;;
InstList_EnemyProj_MiscDust_A_CorpseDustCloud:
    dw $0003,EnemyProjSpritemaps_DustCloud_Explosion_4F
    dw $0003,EnemyProjSpritemaps_DustCloud_Explosion_50
    dw $0003,EnemyProjSpritemaps_DustCloud_Explosion_51
    dw $0003,EnemyProjSpritemaps_DustCloud_Explosion_52
    dw Instruction_EnemyProjectile_Delete


;;; $E1D8: Instruction list - dust cloud / explosion - index = Bh (eye door sweat drop) ;;;
InstList_EnemyProj_MiscDust_B_EyeDoorSweatDrop:
    dw $0005,EnemyProjSpritemaps_DustCloud_Explosion_53
    dw $0005,EnemyProjSpritemaps_DustCloud_Explosion_54
    dw $0005,EnemyProjSpritemaps_DustCloud_Explosion_55
    dw $0005,EnemyProjSpritemaps_DustCloud_Explosion_56
    dw Instruction_EnemyProjectile_Delete


;;; $E1EA: Instruction list - dust cloud / explosion - index = Ch (smoke) ;;;
InstList_EnemyProj_MiscDust_C_Smoke:
    dw $0008,EnemyProjSpritemaps_Common_Smoke_0
    dw $0008,EnemyProjSpritemaps_Common_Smoke_1
    dw $0008,EnemyProjSpritemaps_Common_Smoke_2
    dw $0008,EnemyProjSpritemaps_Common_Smoke_3
    dw Instruction_EnemyProjectile_Delete


;;; $E1FC: Instruction list - dust cloud / explosion - index = 1Ch (unused. Elevator pad) ;;;
UNUSED_InstList_EnemyProj_MiscDust_1C_ElevatorPad_86E1FC:
    dw $0001,EnemyProjSpritemaps_CeresElevatorPad_DustCloud_Explosion_0
    dw $0001,EnemyProjSpritemaps_CeresElevatorPad_DustCloud_Explosion_1
    dw Instruction_EnemyProjectile_GotoY
    dw UNUSED_InstList_EnemyProj_MiscDust_1C_ElevatorPad_86E1FC


;;; $E208: Instruction list - dust cloud / explosion - index = 1Dh (big explosion) ;;;
InstList_EnemyProj_MiscDust_1D_BigExplosion:
    dw $0005,EnemyProjSpritemaps_Common_BigExplosion_0
    dw $0005,EnemyProjSpritemaps_Common_BigExplosion_1
    dw $0005,EnemyProjSpritemaps_Common_BigExplosion_2
    dw $0005,EnemyProjSpritemaps_Common_BigExplosion_3
    dw $0005,EnemyProjSpritemaps_Common_BigExplosion_4
    dw $0005,EnemyProjSpritemaps_Common_BigExplosion_5
    dw Instruction_EnemyProjectile_Delete


;;; $E222: Instruction list - dust cloud / explosion - index = Dh (unused. Small health drop) ;;;
UNUSED_InstList_EnemyProj_MiscDust_D_SmallEnergyDrop_86E222:
    dw $0008,EnemyProjSpritemaps_DustCloud_Explosion_57
    dw $0008,EnemyProjSpritemaps_DustCloud_Explosion_58
    dw $0008,EnemyProjSpritemaps_DustCloud_Explosion_59
    dw $0008,EnemyProjSpritemaps_DustCloud_Explosion_5A
    dw Instruction_EnemyProjectile_Delete


;;; $E234: Instruction list - dust cloud / explosion - index = Eh (unused. Big health drop) ;;;
UNUSED_InstList_EnemyProj_MiscDust_E_BigEnergyDrop_86E22E:
    dw $0008,EnemyProjSpritemaps_DustCloud_Explosion_5B
    dw $0008,EnemyProjSpritemaps_DustCloud_Explosion_5C
    dw $0008,EnemyProjSpritemaps_DustCloud_Explosion_5D
    dw $0008,EnemyProjSpritemaps_DustCloud_Explosion_5E
    dw Instruction_EnemyProjectile_Delete


;;; $E246: Instruction list - dust cloud / explosion - index = Fh (unused. Bomb) ;;;
UNUSED_InstList_EnemyProj_MiscDust_F_Bomb_86E246:
    dw $0005,EnemyProjSpritemaps_DustCloud_Explosion_5F
    dw $0005,EnemyProjSpritemaps_DustCloud_Explosion_60
    dw $0005,EnemyProjSpritemaps_DustCloud_Explosion_61
    dw $0005,EnemyProjSpritemaps_DustCloud_Explosion_62
    dw Instruction_EnemyProjectile_Delete


;;; $E258: Instruction list - dust cloud / explosion - index = 10h (unused. Weird small health drop) ;;;
UNUSED_InstList_EnemyProj_MiscDust_10_WeirdEnergyDrop_86E258:
    dw $0010,EnemyProjSpritemaps_DustCloud_Explosion_63
    dw $0010,EnemyProjSpritemaps_DustCloud_Explosion_64
    dw $0010,EnemyProjSpritemaps_DustCloud_Explosion_65
    dw Instruction_EnemyProjectile_Delete


;;; $E266: Instruction list - dust cloud / explosion - index = 11h (rock particles) ;;;
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


;;; $E2A8: Instruction list - dust cloud / explosion - index = 12h (short big dust cloud) ;;;
InstList_EnemyProj_MiscDust_12_ShortBigDustCloud:
    dw $0002,EnemyProjSpritemaps_Common_BigDustCloud_0
    dw $0002,EnemyProjSpritemaps_Common_BigDustCloud_1
    dw $0002,EnemyProjSpritemaps_Common_BigDustCloud_2
    dw $0002,EnemyProjSpritemaps_Common_BigDustCloud_3
    dw Instruction_EnemyProjectile_Delete


;;; $E2BA: Instruction list - dust cloud / explosion - index = 13h (unused. Short big dust cloud with weird short beam) ;;;
UNUSED_InstList_EnemyProj_MiscDust_13_CloudShortBeam_86E2BA:
    dw $0003,EnemyProjSpritemaps_DustCloud_Explosion_10
    dw $0003,EnemyProjSpritemaps_DustCloud_Explosion_11
    dw $0003,EnemyProjSpritemaps_DustCloud_Explosion_12
    dw $0003,EnemyProjSpritemaps_DustCloud_Explosion_13
    dw $0003,EnemyProjSpritemaps_DustCloud_Explosion_14
    dw $0005,EnemyProjSpritemaps_DustCloud_Explosion_15
    dw Instruction_EnemyProjectile_Delete


;;; $E2D4: Instruction list - dust cloud / explosion - index = 14h (unused. Short big dust cloud with weird medium beam) ;;;
UNUSED_InstList_EnemyProj_MiscDust_14_CloudMediumBeam_86E2D4:
    dw $0003,EnemyProjSpritemaps_DustCloud_Explosion_10
    dw $0003,EnemyProjSpritemaps_DustCloud_Explosion_11
    dw $0003,EnemyProjSpritemaps_DustCloud_Explosion_12
    dw $0003,EnemyProjSpritemaps_DustCloud_Explosion_13
    dw $0003,EnemyProjSpritemaps_DustCloud_Explosion_14
    dw $0003,EnemyProjSpritemaps_DustCloud_Explosion_15
    dw $0003,EnemyProjSpritemaps_DustCloud_Explosion_16
    dw Instruction_EnemyProjectile_Delete


;;; $E2F2: Instruction list - dust cloud / explosion - index = 15h (big dust cloud) ;;;
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


;;; $E314: Instruction list - dust cloud / explosion - index = 16h (unused. Weird long beam) ;;;
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


;;; $E392: Instruction list - dust cloud / explosion - index = 17h (unused. Weird long flickering beam) ;;;
UNUSED_InstList_EnemyProj_MiscDust_17_FlickerLongBeam_86E392:
    dw $0001,EnemyProjSpritemaps_DustCloud_Explosion_1A
    dw $0001,EnemyProjSpritemaps_DustCloud_Explosion_1B
    dw $0001,EnemyProjSpritemaps_DustCloud_Explosion_1A
    dw Instruction_EnemyProjectile_Delete


;;; $E3A0: Instruction list - dust cloud / explosion - index = 18h (long Draygon breath bubbles) ;;;
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


;;; $E3C6: Instruction list - dust cloud / explosion - index = 19h (unused. Save station electricity) ;;;
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


;;; $E3E8: Instruction list - dust cloud / explosion - index = 1Ah (unused. Expanding vertical gate) ;;;
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


;;; $E40A: Instruction list - dust cloud / explosion - index = 1Bh (unused. Contracting vertical gate) ;;;
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


;;; $E42C: Dust cloud / explosion instruction list pointers ;;;
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


;;; $E468: Initialisation AI - enemy projectile $E509/$E525 (dust cloud / explosion) ;;;
InitAI_EnemyProj_MiscDust:
;; Parameters:
;;     Y: Enemy projectile index
;;     EnemyProjectile_InitParam0: Index. Range 0..1Dh. Same animations as sprite objects 0..1Dh
;;         {
;;         0: Unused. Beam charge
;;         1: Mother Brain elbow charge particles
;;         2: Mother Brain elbow charge energy
;;         3: Small explosion
;;         4: Unused. Bomb explosion
;;         5: Unused. Beam trail
;;         6: Dud shot
;;         7: Unused. Power bomb
;;         8: Unused. Elevator pad (same as 1Ch)
;;         9: Small dust cloud
;;         Ah: Corpse dust cloud
;;         Bh: Eye door sweat drop
;;         Ch: Smoke
;;         Dh: Unused. Small health drop
;;         Eh: Unused. Big health drop
;;         Fh: Unused. Bomb
;;         10h: Unused. Weird small health drop
;;         11h: Rock particles
;;         12h: Short big dust cloud
;;         13h: Unused. Short big dust cloud with weird short beam
;;         14h: Unused. Short big dust cloud with weird medium beam
;;         15h: Big dust cloud
;;         16h: Unused. Weird long beam
;;         17h: Unused. Weird long flickering beam
;;         18h: Long Draygon breath bubbles
;;         19h: Unused. Save station electricity
;;         1Ah: Unused. Expanding vertical gate
;;         1Bh: Unused. Contracting vertical gate
;;         1Ch: Unused. Elevator pad (same as 8)
;;         1Dh: Big explosion
;;         }
;;     $12: X position
;;     $14: Y position
    LDA.W EnemyProjectile_InitParam0 : ASL : TAX
    LDA.W MiscDust_InstListPointers,X : STA.W EnemyProjectile_InstListPointers,Y
    LDA.B DP_Temp12 : STA.W EnemyProjectile_XPositions,Y
    LDA.B DP_Temp14 : STA.W EnemyProjectile_YPositions,Y
    RTS


;;; $E47E: PLM dust cloud / explosion X/Y offset table ;;;
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


;;; $E4A6: Initialisation AI - enemy projectile $E517 (PLM dust cloud / explosion) ;;;
InitAI_EnemyProj_MiscDustPLM:
;; Parameters:
;;     Y: Enemy projectile index
;;     EnemyProjectile_InitParam0 low: Index. Range 0..1Dh. Only Ah (corpse dust cloud) and Bh (eye door sweat drop) are used. See $E468 for other values
;;     EnemyProjectile_InitParam0 high: X/Y offset table index. Range 0..4. Only 0 and 3 are used
    LDA.W EnemyProjectile_InitParam0 : AND.W #$00FF : ASL : TAX
    LDA.W MiscDust_InstListPointers,X : STA.W EnemyProjectile_InstListPointers,Y
    LDA.W EnemyProjectile_InitParam0+1 : AND.W #$00FF : ASL #3 : TAX
    LDA.W RandomNumberSeed : AND.W PLM_MiscDust_XYOffsetTable_randomX,X
    CLC : ADC.W PLM_MiscDust_XYOffsetTable_minX,X : STA.B DP_Temp12
    LDA.W RandomNumberSeed+1 : AND.W PLM_MiscDust_XYOffsetTable_randomY,X
    CLC : ADC.W PLM_MiscDust_XYOffsetTable_minY,X : STA.B DP_Temp14
    LDX.W PLM_Index
    JSL Calculate_PLM_Block_Coordinates
    LDA.W PLM_XBlock : SEC : ROL : ASL #3
    CLC : ADC.B DP_Temp12 : STA.W EnemyProjectile_XPositions,Y
    LDA.W PLM_YBlock : SEC : ROL : ASL #3
    CLC : ADC.B DP_Temp14 : STA.W EnemyProjectile_YPositions,Y
    JSL GenerateRandomNumber
    RTS


;;; $E4FE: Pre-instruction - enemy projectile $E509 (dust cloud / explosion) ;;;
PreInstruction_EnemyProjectile_MiscDust:
;; Parameters:
;;     X: Enemy projectile index
    JSR CheckIf_EnemyProjectile_IsOffScreen_duplicate_again4
    BNE .offScreen
    RTS

  .offScreen:
    STZ.W EnemyProjectile_ID,X
    RTS


;;; $E508: RTS. Pre-instruction - enemy projectile $E517 (PLM dust cloud / explosion) ;;;
RTS_86E508:
    RTS


;;; $E509: Enemy projectiles - dust cloud / explosion ;;;
; Enemy projectile $E525 is broken due to its bogus pre-instruction pointer and is otherwise just a low priority version of $E509
; Only difference between $E509 and $E517 is the former deletes itself once off-screen and takes position parameters in $12/$14,
; and the latter places itself at the current PLM block and takes a random X/Y offset parameter
EnemyProjectile_MiscDust:
    %EnemyProjectile(\
    %initAI(InitAI_EnemyProj_MiscDust),
    %preInst(PreInstruction_EnemyProjectile_MiscDust),
    %instList(UNUSED_InstList_EnemyProj_MiscDust_0_BeamCharge_86E0EE),
    %radius(0, 0),
    %properties($1000),
    %hitList(0),
    %shotList(InstList_EnemyProjectile_Delete))

EnemyProjectile_MiscDustPLM:
    %EnemyProjectile(\
    %initAI(InitAI_EnemyProj_MiscDustPLM),
    %preInst(RTS_86E508),
    %instList(InstList_EnemyProj_MiscDust_3_SmallExplosion),
    %radius(0, 0),
    %properties($0000),
    %hitList(0),
    %shotList(InstList_EnemyProjectile_Delete))

if !FEATURE_KEEP_UNREFERENCED
UNUSED_EnemyProjectile_DustCloudExplosion_86E525:
    %EnemyProjectile(\
    %initAI(InitAI_EnemyProj_MiscDust),
    %preInst(InstList_EnemyProjectile_GunshipLiftoffDustClouds_Index0_0), ; >_< this is not a pre-instruction, its an instruction list
    %instList(InstList_EnemyProj_MiscDust_3_SmallExplosion),
    %radius(0, 0),
    %properties($0000),
    %hitList(0),
    %shotList(InstList_EnemyProjectile_Delete))
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $E533: Instruction - enemy projectile Y velocity = [[Y]] ;;;
Instruction_EnemyProjectile_ShotGate_EnemyVelocityInY:
;; Parameters:
;;     X: Enemy projectile index
;;     Y: Pointer to instruction arguments
;; Returns:
;;     Y: Pointer to next instruction
    LDA.W $0000,Y : STA.W EnemyProjectile_YVelocity,X
    INY #2
    RTS


;;; $E53C: Instruction list - enemy projectile $E64B (spawned downwards shot gate) ;;;
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


;;; $E55E: Instruction list - enemy projectile $E659 (initial closed downwards shot gate) ;;;
InstList_EnemyProjectile_ShotGate_InitialClosedDownwards:
    dw Instruction_EnemyProjectile_ShotGate_EnemyVelocityInY,$FF00
    dw $0001,EnemyProjSpritemaps_DownwardsShotGate_3

InstList_EnemyProjectile_ShotGate_InitialClosedDownwards_sleep:
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


;;; $E586: Instruction list - enemy projectile $E667 (spawned upwards shot gate) ;;;
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


;;; $E5A8: Instruction list - enemy projectile $E675 (initial closed upwards shot gate) ;;;
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


;;; $E5D0: Initialisation AI - enemy projectile $E64B/$E667 (spawned shot gate) ;;;
InitAI_EnemyProjectile_ShotGate_Spawned:
;; Parameters:
;;     Y: Enemy projectile index
    LDA.W #$0000
    BRA InitAI_EnemyProjectile_ShotGate_Common


;;; $E5D5: Initialisation AI - enemy projectile $E659 (initial closed downwards shot gate) ;;;
InitAI_EnemyProjectile_ShotGate_InitialClosedDownwards:
;; Parameters:
;;     Y: Enemy projectile index
    LDA.W #$0040
    BRA InitAI_EnemyProjectile_ShotGate_Common


;;; $E5DA: Initialisation AI - enemy projectile $E675 (initial closed upwards shot gate) ;;;
InitAI_EnemyProjectile_ShotGate_InitialClosedUpwards:
;; Parameters:
;;     Y: Enemy projectile index
    LDA.W #$FFC0
; fallthrough to InitAI_EnemyProjectile_ShotGate_Common


;;; $E5DD: Shot gate common initialisation ;;;
InitAI_EnemyProjectile_ShotGate_Common:
;; Parameters:
;;     A: Y offset
;;     Y: Enemy projectile index
    STA.B DP_Temp12
    LDX.W PLM_Index
    JSL Calculate_PLM_Block_Coordinates
    LDA.W PLM_BlockIndices,X : STA.W EnemyProjectile_Var0,Y
    LDA.W PLM_XBlock : ASL #4 : STA.W EnemyProjectile_XPositions,Y
    LDA.W PLM_YBlock : ASL #4 : CLC : ADC.B DP_Temp12 : STA.W EnemyProjectile_YPositions,Y
    RTS


;;; $E604: RTS. Pre-instruction - enemy projectile $E64B/$E659/$E667/$E675 (shot gate) ;;;
RTS_86E604:
    RTS


;;; $E605: Pre-instruction - moving ;;;
PreInstruction_EnemyProjectile_ShotGate_InitialClosed:
;; Parameters:
;;     X: Enemy projectile index
    LDA.W EnemyProjectile_YVelocity,X : BPL +
    EOR.W #$FFFF : INC

+   CLC : ADC.W EnemyProjectile_Timers,X : CMP.W #$1000 : BCC +
    LDA.W #$0001 : STA.W EnemyProjectile_InstructionTimers,X
    INC.W EnemyProjectile_InstListPointers,X : INC.W EnemyProjectile_InstListPointers,X
    LDA.W #$0000

+   STA.W EnemyProjectile_Timers,X
    LDA.W EnemyProjectile_YVelocity-1,X : AND.W #$FF00
    CLC : ADC.W EnemyProjectile_YSubPositions,X : STA.W EnemyProjectile_YSubPositions,X
    LDA.W EnemyProjectile_YVelocity,X : XBA : BPL .lowByte
    ORA.W #$FF00
    BRA +

  .lowByte:
    AND.W #$00FF

+   ADC.W EnemyProjectile_YPositions,X : STA.W EnemyProjectile_YPositions,X
    RTS


;;; $E64B: Enemy projectiles - shot gates ;;;
EnemyProjectile_SpawnedDownwardsShotGate:
    %EnemyProjectile(\
    %initAI(InitAI_EnemyProjectile_ShotGate_Spawned),
    %preInst(RTS_86E604),
    %instList(InstList_EnemyProjectile_ShotGate_SpawnedDownwards),
    %radius(0, 0),
    %properties($2000),
    %hitList(0),
    %shotList(InstList_EnemyProjectile_Delete))

EnemyProjectile_DownwardsShotGateInitiallyClosed:
    %EnemyProjectile(\
    %initAI(InitAI_EnemyProjectile_ShotGate_InitialClosedDownwards),
    %preInst(RTS_86E604),
    %instList(InstList_EnemyProjectile_ShotGate_InitialClosedDownwards),
    %radius(0, 0),
    %properties($2000),
    %hitList(0),
    %shotList(InstList_EnemyProjectile_Delete))

EnemyProjectile_SpawnedUpwardsShotGate:
    %EnemyProjectile(\
    %initAI(InitAI_EnemyProjectile_ShotGate_Spawned),
    %preInst(RTS_86E604),
    %instList(InstList_EnemyProjectile_ShotGate_SpawnedUpwards),
    %radius(0, 0),
    %properties($2000),
    %hitList(0),
    %shotList(InstList_EnemyProjectile_Delete))

EnemyProjectile_UpwardsShotGateInitiallyClosed:
    %EnemyProjectile(\
    %initAI(InitAI_EnemyProjectile_ShotGate_InitialClosedUpwards),
    %preInst(RTS_86E604),
    %instList(InstList_EnemyProjectile_ShotGate_InitialClosedUpwards),
    %radius(0, 0),
    %properties($2000),
    %hitList(0),
    %shotList(InstList_EnemyProjectile_Delete))


;;; $E683: Instruction list - enemy projectile $E6D2 (save station electricity) ;;;
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


;;; $E6AD: Initialisation AI - enemy projectile $E6D2 (save station electricity) ;;;
InitAI_EnemyProjectile_SaveStationElectrictiy:
;; Parameters:
;;     Y: Enemy projectile index
    LDX.W PLM_Index
    JSL Calculate_PLM_Block_Coordinates
    LDA.W PLM_XBlock : CLC : ADC.W #$0001 : ASL #4 : STA.W EnemyProjectile_XPositions,Y
    LDA.W PLM_YBlock : SEC : SBC.W #$0002 : ASL #4 : STA.W EnemyProjectile_YPositions,Y
    RTS


;;; $E6D1: RTS. Pre-instruction - enemy projectile $E6D2 (save station electricity) ;;;
RTS_86E6D1:
    RTS


;;; $E6D2: Enemy projectile - save station electricity ;;;
EnemyProjectile_SaveStationElectricity:
    %EnemyProjectile(\
    %initAI(InitAI_EnemyProjectile_SaveStationElectrictiy),
    %preInst(RTS_86E6D1),
    %instList(InstList_EnemyProjectile_SaveStationElectricity_0),
    %radius(0, 0),
    %properties($3000),
    %hitList(0),
    %shotList(InstList_EnemyProjectile_Delete))


;;; $E6E0: Check if enemy projectile is off screen ;;;
CheckIf_EnemyProjectile_IsOffScreen_duplicate_again4:
;; Parameters:
;;     X: Enemy projectile index
;; Returns:
;;     A: 1 if off-screen, 0 otherwise
    PHX : PHY
    LDA.W EnemyProjectile_XPositions,X : CMP.W Layer1XPosition : BMI .returnOffScreen
    LDA.W Layer1XPosition : CLC : ADC.W #$0100 : STA.W Temp_ProjectilePositionOnScreen
    LDA.W EnemyProjectile_XPositions,X : CMP.W Temp_ProjectilePositionOnScreen : BPL .returnOffScreen
    LDA.W EnemyProjectile_YPositions,X : CMP.W Layer1YPosition : BMI .returnOffScreen
    LDA.W Layer1YPosition : CLC : ADC.W #$0100 : STA.W Temp_ProjectilePositionOnScreen
    LDA.W EnemyProjectile_YPositions,X : CMP.W Temp_ProjectilePositionOnScreen : BPL .returnOffScreen
    PLY : PLX
    LDA.W #$0000
    RTS

  .returnOffScreen:
    PLY : PLX
    LDA.W #$0001
    RTS


;;; $E722: Check if enemy projectile is in Draygon room boundaries ;;;
CheckIf_EnemyProjectile_IsInDraygonRoomBoundaries:
;; Parameters:
;;     X: Enemy projectile index
;; Returns:
;;     A: 1 if out of Draygon room boundaries, 0 otherwise
    LDA.W EnemyProjectile_XPositions,X : BMI .returnOutOfRoom
    CMP.W #$0200 : BPL .returnOutOfRoom
    LDA.W EnemyProjectile_YPositions,X : BMI .returnOutOfRoom
    CMP.W #$0200 : BPL .returnOutOfRoom
    LDA.W #$0000
    RTS

  .returnOutOfRoom:
    LDA.W #$0001
    RTS


;;; $E73E: Move enemy projectile according to enemy projectile angle and speed ;;;
Move_EnemyProjectile_AccordingToAngleAndSpeed:
;; Parameters:
;;     X: Enemy projectile index

; Uses EnemyProjectile_XVelocity as X speed
; Uses EnemyProjectile_Var0 as X subspeed
; Uses EnemyProjectile_YVelocity as Y speed
; Uses EnemyProjectile_Var1 as Y subspeed
; Uses EnemyProjectile_XSubPositions as X subposition
; Uses EnemyProjectile_YSubPositions as Y subposition
; Uses $7E:97DC(!) as angle
    PHX
    LDA.L EnemyProjectileAngles,X : CLC : ADC.W #$0040 : BIT.W #$0080 : BNE .subtractX
    LDA.W EnemyProjectile_XSubPositions,X : CLC : ADC.W EnemyProjectile_Var0,X : STA.W EnemyProjectile_XSubPositions,X
    LDA.W EnemyProjectile_XPositions,X : ADC.W EnemyProjectile_XVelocity,X : STA.W EnemyProjectile_XPositions,X
    BRA +

  .subtractX:
    LDA.W EnemyProjectile_XSubPositions,X : SEC : SBC.W EnemyProjectile_Var0,X : STA.W EnemyProjectile_XSubPositions,X
    LDA.W EnemyProjectile_XPositions,X : SBC.W EnemyProjectile_XVelocity,X : STA.W EnemyProjectile_XPositions,X

+   LDA.L EnemyProjectileAngles,X : CLC : ADC.W #$0080 : BIT.W #$0080 : BNE .subtractY
    LDA.W EnemyProjectile_YSubPositions,X : CLC : ADC.W EnemyProjectile_Var1,X : STA.W EnemyProjectile_YSubPositions,X
    LDA.W EnemyProjectile_YPositions,X : ADC.W EnemyProjectile_YVelocity,X : STA.W EnemyProjectile_YPositions,X
    BRA .return

  .subtractY:
    LDA.W EnemyProjectile_YSubPositions,X : SEC : SBC.W EnemyProjectile_Var1,X : STA.W EnemyProjectile_YSubPositions,X
    LDA.W EnemyProjectile_YPositions,X : SBC.W EnemyProjectile_YVelocity,X : STA.W EnemyProjectile_YPositions,X

  .return:
    PLX
    RTS


;;; $E7AB: Place and aim Draygon's wall turret projectile ;;;
PlaceAndAim_DraygonsWallTurretProjectile:
;; Parameters:
;;     Y: Enemy projectile index
;;     $12: X position
;;     $14: Y position
;;     EnemyProjectile_InitParam0: Speed

; Uses EnemyProjectile_XVelocity as X speed
; Uses EnemyProjectile_Var0 as X subspeed
; Uses EnemyProjectile_YVelocity as Y speed
; Uses EnemyProjectile_Var1 as Y subspeed
    TYX
    LDA.B DP_Temp12 : STA.W EnemyProjectile_XPositions,Y
    LDA.B DP_Temp14 : STA.W EnemyProjectile_YPositions,Y
    LDA.W SamusXPosition : SEC : SBC.W EnemyProjectile_XPositions,Y : STA.B DP_Temp12
    LDA.W SamusYPosition : SEC : SBC.W EnemyProjectile_YPositions,Y : STA.B DP_Temp14
    JSL CalculateAngleOf_12_14_Offset
    EOR.W #$00FF : INC
    CLC : ADC.W #$0040 : AND.W #$00FF : STA.L EnemyProjectileAngles,X
    STA.B DP_Temp12
    LDA.W EnemyProjectile_InitParam0 : STA.B DP_Temp14
    JSL Do_Some_Math_With_Sine_Cosine_Terrible_Label_Name ; ($16.$18, $1A.$1C) = ([$14] * |cos([$12] * pi / 80h)|, [$14] * |sin([$12] * pi / 80h)|)
    LDA.B DP_Temp16 : STA.W EnemyProjectile_XVelocity,Y
    LDA.B DP_Temp18 : STA.W EnemyProjectile_Var0,Y
    LDA.B DP_Temp1A : STA.W EnemyProjectile_YVelocity,Y
    LDA.B DP_Temp1C : STA.W EnemyProjectile_Var1,Y
    RTS


if !FEATURE_KEEP_UNREFERENCED
;;; $E7FB: Unused. Instruction list - body segment - up (facing left) ;;;
UNUSED_InstList_EnemyProj_BotwoonsBody_UpFacingLeft_86E7FB:
    dw $0008,EnemyProjSpritemaps_BotwoonsBody_UpFacingLeft_0
    dw $0008,EnemyProjSpritemaps_BotwoonsBody_UpFacingLeft_1
    dw $0008,EnemyProjSpritemaps_BotwoonsBody_UpFacingLeft_2
    dw $0008,EnemyProjSpritemaps_BotwoonsBody_UpFacingLeft_3
    dw Instruction_EnemyProjectile_GotoY
    dw UNUSED_InstList_EnemyProj_BotwoonsBody_UpFacingLeft_86E7FB
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $E80F: Instruction list - body segment - up-left ;;;
InstList_EnemyProjectile_BotwoonsBody_UpLeft:
    dw $0008,EnemyProjSpritemaps_BotwoonsBody_0
    dw $0008,EnemyProjSpritemaps_BotwoonsBody_1
    dw $0008,EnemyProjSpritemaps_BotwoonsBody_2
    dw $0008,EnemyProjSpritemaps_BotwoonsBody_3
    dw Instruction_EnemyProjectile_GotoY
    dw InstList_EnemyProjectile_BotwoonsBody_UpLeft


;;; $E823: Instruction list - body segment - left ;;;
InstList_EnemyProjectile_BotwoonsBody_Left:
    dw $0008,EnemyProjSpritemaps_BotwoonsBody_4
    dw $0008,EnemyProjSpritemaps_BotwoonsBody_5
    dw $0008,EnemyProjSpritemaps_BotwoonsBody_6
    dw $0008,EnemyProjSpritemaps_BotwoonsBody_7
    dw Instruction_EnemyProjectile_GotoY
    dw InstList_EnemyProjectile_BotwoonsBody_Left


;;; $E837: Instruction list - body segment - down-left ;;;
InstList_EnemyProjectile_BotwoonsBody_DownLeft:
    dw $0008,EnemyProjSpritemaps_BotwoonsBody_8
    dw $0008,EnemyProjSpritemaps_BotwoonsBody_9
    dw $0008,EnemyProjSpritemaps_BotwoonsBody_A
    dw $0008,EnemyProjSpritemaps_BotwoonsBody_B
    dw Instruction_EnemyProjectile_GotoY
    dw InstList_EnemyProjectile_BotwoonsBody_DownLeft


if !FEATURE_KEEP_UNREFERENCED
;;; $E84B: Unused. Instruction list - body segment - down (facing left) ;;;
UNUSED_InstList_EnemyProj_BotwoonsBody_DownFacingLeft_86E84B:
    dw $0008,UNUSED_EnemyProjSpritemap_BotwoonsBody_DownFacingLeft_8DB682
    dw $0008,UNUSED_EnemyProjSpritemap_BotwoonsBody_DownFacingLeft_8DB689
    dw $0008,UNUSED_EnemyProjSpritemap_BotwoonsBody_DownFacingLeft_8DB690
    dw $0008,UNUSED_EnemyProjSpritemap_BotwoonsBody_DownFacingLeft_8DB697
    dw Instruction_EnemyProjectile_GotoY
    dw UNUSED_InstList_EnemyProj_BotwoonsBody_DownFacingLeft_86E84B
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $E85F: Instruction list - body segment - down (facing right) ;;;
InstList_EnemyProjectile_BotwoonsBody_Down_FacingRight:
    dw $0008,EnemyProjSpritemaps_BotwoonsBody_C
    dw $0008,EnemyProjSpritemaps_BotwoonsBody_D
    dw $0008,EnemyProjSpritemaps_BotwoonsBody_E
    dw $0008,EnemyProjSpritemaps_BotwoonsBody_F
    dw Instruction_EnemyProjectile_GotoY
    dw InstList_EnemyProjectile_BotwoonsBody_Down_FacingRight


;;; $E873: Instruction list - body segment - down-right ;;;
InstList_EnemyProjectile_BotwoonsBody_DownRight:
    dw $0008,EnemyProjSpritemaps_BotwoonsBody_10
    dw $0008,EnemyProjSpritemaps_BotwoonsBody_11
    dw $0008,EnemyProjSpritemaps_BotwoonsBody_12
    dw $0008,EnemyProjSpritemaps_BotwoonsBody_13
    dw Instruction_EnemyProjectile_GotoY
    dw InstList_EnemyProjectile_BotwoonsBody_DownRight


;;; $E887: Instruction list - body segment - right ;;;
InstList_EnemyProjectile_BotwoonsBody_Right:
    dw $0008,EnemyProjSpritemaps_BotwoonsBody_14
    dw $0008,EnemyProjSpritemaps_BotwoonsBody_15
    dw $0008,EnemyProjSpritemaps_BotwoonsBody_16
    dw $0008,EnemyProjSpritemaps_BotwoonsBody_17
    dw Instruction_EnemyProjectile_GotoY
    dw InstList_EnemyProjectile_BotwoonsBody_Right


;;; $E89B: Instruction list - body segment - up-right ;;;
InstList_EnemyProjectile_BotwoonsBody_UpRight:
    dw $0008,EnemyProjSpritemaps_BotwoonsBody_18
    dw $0008,EnemyProjSpritemaps_BotwoonsBody_19
    dw $0008,EnemyProjSpritemaps_BotwoonsBody_1A
    dw $0008,EnemyProjSpritemaps_BotwoonsBody_1B
    dw Instruction_EnemyProjectile_GotoY
    dw InstList_EnemyProjectile_BotwoonsBody_UpRight


;;; $E8AF: Instruction list - body segment - up (facing right) ;;;
InstList_EnemyProjectile_BotwoonsBody_Up_FacingRight:
    dw $0008,EnemyProjSpritemaps_BotwoonsBody_1C
    dw $0008,EnemyProjSpritemaps_BotwoonsBody_1D
    dw $0008,EnemyProjSpritemaps_BotwoonsBody_1E
    dw $0008,EnemyProjSpritemaps_BotwoonsBody_1F
    dw Instruction_EnemyProjectile_GotoY
    dw InstList_EnemyProjectile_BotwoonsBody_Up_FacingRight


;;; $E8C3: Instruction list - tail - up (facing right) ;;;
InstList_EnemyProjectile_BotwoonsTail_Up_FacingRight:
    dw $0001,EnemyProjSpritemaps_BotwoonsBody_20
    dw Instruction_EnemyProjectile_Sleep


;;; $E8C9: Instruction list - tail - up-left ;;;
InstList_EnemyProjectile_BotwoonsTail_UpLeft:
    dw $0001,EnemyProjSpritemaps_BotwoonsBody_21
    dw Instruction_EnemyProjectile_Sleep


;;; $E8CF: Instruction list - tail - left ;;;
InstList_EnemyProjectile_BotwoonsTail_Left:
    dw $0001,EnemyProjSpritemaps_BotwoonsBody_22
    dw Instruction_EnemyProjectile_Sleep


;;; $E8D5: Instruction list - tail - down-left ;;;
InstList_EnemyProjectile_BotwoonsTail_DownLeft:
    dw $0001,EnemyProjSpritemaps_BotwoonsBody_23
    dw Instruction_EnemyProjectile_Sleep


;;; $E8DB: Instruction list - tail - down ;;;
InstList_EnemyProjectile_BotwoonsTail_Down:
    dw $0001,EnemyProjSpritemaps_BotwoonsBody_24
    dw Instruction_EnemyProjectile_Sleep


;;; $E8E1: Instruction list - tail - down-right ;;;
InstList_EnemyProjectile_BotwoonsTail_DownRight:
    dw $0001,EnemyProjSpritemaps_BotwoonsBody_25
    dw Instruction_EnemyProjectile_Sleep


;;; $E8E7: Instruction list - tail - right ;;;
InstList_EnemyProjectile_BotwoonsTail_Right:
    dw $0001,EnemyProjSpritemaps_BotwoonsBody_26
    dw Instruction_EnemyProjectile_Sleep


;;; $E8ED: Instruction list - tail - up-right ;;;
InstList_EnemyProjectile_BotwoonsTail_UpRight:
    dw $0001,EnemyProjSpritemaps_BotwoonsBody_27
    dw Instruction_EnemyProjectile_Sleep


;;; $E8F3: Instruction list - hidden ;;;
InstList_EnemyProjectile_BotwoonsBodyTail_Hidden:
    dw $0001,EnemyProjSpritemaps_BotwoonsBody_28
    dw Instruction_EnemyProjectile_Sleep


if !FEATURE_KEEP_UNREFERENCED
;;; $E8F9: Unused. Instruction list ;;;
UNUSED_InstList_EnemyProjectile_BotwoonsBodyTail_86E8F9:
    dw $0008,UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_0_8DB762
    dw $0008,UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_1_8DB769
    dw $0008,UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_2_8DB770
    dw $0008,UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_3_8DB777
    dw Instruction_EnemyProjectile_GotoY
    dw UNUSED_InstList_EnemyProjectile_BotwoonsBodyTail_86E8F9


;;; $E90D: Unused. Instruction list ;;;
UNUSED_InstList_EnemyProjectile_BotwoonsBodyTail_86E90D:
    dw $0008,UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_4_8DB77E
    dw $0008,UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_5_8DB785
    dw $0008,UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_6_8DB78C
    dw $0008,UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_7_8DB793
    dw Instruction_EnemyProjectile_GotoY
    dw UNUSED_InstList_EnemyProjectile_BotwoonsBodyTail_86E90D


;;; $E921: Unused. Instruction list ;;;
UNUSED_InstList_EnemyProjectile_BotwoonsBodyTail_86E921:
    dw $0008,UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_8_8DB79A
    dw $0008,UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_9_8DB7A1
    dw $0008,UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_A_8DB7A8
    dw $0008,UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_B_8DB7AF
    dw Instruction_EnemyProjectile_GotoY
    dw UNUSED_InstList_EnemyProjectile_BotwoonsBodyTail_86E921


;;; $E935: Unused. Instruction list ;;;
UNUSED_InstList_EnemyProjectile_BotwoonsBodyTail_86E935:
    dw $0008,UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_C_8DB7B6
    dw $0008,UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_D_8DB7BD
    dw $0008,UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_E_8DB7C4
    dw $0008,UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_F_8DB7CB
    dw Instruction_EnemyProjectile_GotoY
    dw UNUSED_InstList_EnemyProjectile_BotwoonsBodyTail_86E935


;;; $E949: Unused. Instruction list ;;;
UNUSED_InstList_EnemyProjectile_BotwoonsBodyTail_86E949:
    dw $0008,UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_10_8DB7D2
    dw $0008,UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_11_8DB7D9
    dw $0008,UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_12_8DB7E0
    dw $0008,UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_13_8DB7E7
    dw Instruction_EnemyProjectile_GotoY
    dw UNUSED_InstList_EnemyProjectile_BotwoonsBodyTail_86E949


;;; $E95D: Unused. Instruction list ;;;
UNUSED_InstList_EnemyProjectile_BotwoonsBodyTail_86E95D:
    dw $0008,UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_14_8DB7EE
    dw $0008,UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_15_8DB7F5
    dw $0008,UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_16_8DB7FC
    dw $0008,UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_17_8DB803
    dw Instruction_EnemyProjectile_GotoY
    dw UNUSED_InstList_EnemyProjectile_BotwoonsBodyTail_86E95D


;;; $E971: Unused. Instruction list ;;;
UNUSED_InstList_EnemyProjectile_BotwoonsBodyTail_86E971:
    dw $0008,UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_18_8DB80A
    dw $0008,UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_19_8DB811
    dw $0008,UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_1A_8DB818
    dw $0008,UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_1B_8DB81F
    dw Instruction_EnemyProjectile_GotoY
    dw UNUSED_InstList_EnemyProjectile_BotwoonsBodyTail_86E971


;;; $E985: Unused. Instruction list ;;;
UNUSED_InstList_EnemyProjectile_BotwoonsBodyTail_86E985:
    dw $0008,UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_1C_8DB826
    dw $0008,UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_1D_8DB82D
    dw $0008,UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_1E_8DB834
    dw $0008,UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_1F_8DB83B
    dw Instruction_EnemyProjectile_GotoY
    dw UNUSED_InstList_EnemyProjectile_BotwoonsBodyTail_86E985


;;; $E999: Unused. Instruction list ;;;
UNUSED_InstList_EnemyProjectile_BotwoonsBodyTail_86E999:
    dw $0008,UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_20_8DB842
    dw $0008,UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_21_8DB849
    dw $0008,UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_22_8DB850
    dw $0008,UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_23_8DB857
    dw Instruction_EnemyProjectile_GotoY
    dw UNUSED_InstList_EnemyProjectile_BotwoonsBodyTail_86E999


;;; $E9AD: Unused. Instruction list ;;;
UNUSED_InstList_EnemyProjectile_BotwoonsBodyTail_86E9AD:
    dw $0008,UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_24_8DB85E
    dw $0008,UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_25_8DB865
    dw $0008,UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_26_8DB86C
    dw $0008,UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_27_8DB873
    dw Instruction_EnemyProjectile_GotoY
    dw UNUSED_InstList_EnemyProjectile_BotwoonsBodyTail_86E9AD


;;; $E9C1: Unused. Instruction list ;;;
UNUSED_InstList_EnemyProjectile_BotwoonsBodyTail_86E9C1:
    dw $0001,UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_28_8DB87A
    dw Instruction_EnemyProjectile_Sleep


;;; $E9C7: Unused. Instruction list ;;;
UNUSED_InstList_EnemyProjectile_BotwoonsBodyTail_86E9C7:
    dw $0001,UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_29_8DB881
    dw Instruction_EnemyProjectile_Sleep


;;; $E9CD: Unused. Instruction list ;;;
UNUSED_InstList_EnemyProjectile_BotwoonsBodyTail_86E9CD:
    dw $0001,UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_2A_8DB888
    dw Instruction_EnemyProjectile_Sleep


;;; $E9D3: Unused. Instruction list ;;;
UNUSED_InstList_EnemyProjectile_BotwoonsBodyTail_86E9D3:
    dw $0001,UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_2B_8DB88F
    dw Instruction_EnemyProjectile_Sleep


;;; $E9D9: Unused. Instruction list ;;;
UNUSED_InstList_EnemyProjectile_BotwoonsBodyTail_86E9D9:
    dw $0001,UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_2C_8DB896
    dw Instruction_EnemyProjectile_Sleep


;;; $E9DF: Unused. Instruction list ;;;
UNUSED_InstList_EnemyProjectile_BotwoonsBodyTail_86E9DF:
    dw $0001,UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_2D_8DB89D
    dw Instruction_EnemyProjectile_Sleep


;;; $E9E5: Unused. Instruction list ;;;
UNUSED_InstList_EnemyProjectile_BotwoonsBodyTail_86E9E5:
    dw $0001,UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_2E_8DB8A4
    dw Instruction_EnemyProjectile_Sleep


;;; $E9EB: Unused. Instruction list ;;;
UNUSED_InstList_EnemyProjectile_BotwoonsBodyTail_86E9EB:
    dw $0001,UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_2F_8DB8AB
    dw Instruction_EnemyProjectile_Sleep
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $E9F1: Botwoon's body instruction list table ;;;
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


;;; $EA31: Initialisation AI - enemy projectile $EBA0 (Botwoon's body) ;;;
InitAI_EnemyProjectile_BotwoonsBody:
;; Parameters:
;;     Y: Enemy projectile index
    LDA.W Enemy.XPosition : STA.W EnemyProjectile_XPositions,Y
    LDA.W Enemy.YPosition : STA.W EnemyProjectile_YPositions,Y
    LDA.W #$0000 : STA.W EnemyProjectile_YVelocity,Y
    PHY
    LDY.W #$0010
    LDA.W Botwoon.bodyProjectileIndex : BNE .notTail
    LDY.W #$0030

  .notTail:
    STY.B DP_Temp12
    LDA.W BotwoonsBodyTail_InstListPointers,Y
    PLY
    STA.W EnemyProjectile_InstListPointers,Y : STA.W EnemyProjectile_Var1,Y
    LDA.B DP_Temp12 : STA.W EnemyProjectile_Var0,Y
    LDA.W #Function_EnemyProjectile_BotwoonsBody_Main : STA.W EnemyProjectile_XVelocity,Y
    LDX.W Botwoon.bodyProjectileIndex
    TYA : STA.L Botwoon.projectileIndices,X
    PHX
    TAX
    LDA.W #$0002 : STA.L EnemyProjectileData_CollisionOptions,X
    PLX
    LDA.W #$0001 : STA.L Botwoon.bodyHiddenFlag,X
    RTS


;;; $EA80: Pre-instruction - enemy projectile $EBA0 (Botwoon's body) ;;;
PreInstruction_EnemyProjectile_BotwoonsBody:
;; Parameters:
;;     X: Enemy projectile index
    LDA.L Botwoon.bodyDeathFlag : BEQ .executeFunction
    LDA.W EnemyProjectile_XVelocity,X : CMP.W #Function_EnemyProjectile_BotwoonsBody_Main : BNE .executeFunction
    LDA.W #Function_EnemyProjectile_BotwoonsBody_Dying_SetDelay : STA.W EnemyProjectile_XVelocity,X

  .executeFunction:
    JSR.W (EnemyProjectile_XVelocity,X)
    RTS


;;; $EA98: Botwoon's body function - main ;;;
Function_EnemyProjectile_BotwoonsBody_Main:
;; Parameters:
;;     X: Enemy projectile index

; Enemy projectile instruction list table index (EnemyProjectile_Var0,x) is set by Botwoon, see $B3:9D4D
    LDA.W EnemyProjectile_Var0,X : TAY
    LDA.W BotwoonsBodyTail_InstListPointers,Y : CMP.W EnemyProjectile_Var1,X : BEQ .noChange
    STA.W EnemyProjectile_InstListPointers,X : STA.W EnemyProjectile_Var1,X
    LDA.W #$0001 : STA.W EnemyProjectile_InstructionTimers,X

  .noChange:
    JSR Function_EnemyProjectile_BotwoonsBody_HurtFlashHandling
    RTS


;;; $EAB4: Botwoon's body hurt flash handling ;;;
Function_EnemyProjectile_BotwoonsBody_HurtFlashHandling:
;; Parameters:
;;     X: Enemy projectile index
    LDA.W EnemyProjectile_GraphicsIndices,X : ORA.W #$0E00 : STA.W EnemyProjectile_GraphicsIndices,X
    LDA.W Enemy.flashTimer : BEQ .return
    LDA.W NumberOfTimesMainEnemyRoutineExecuted : BIT.W #$0002 : BEQ .return
    LDA.W EnemyProjectile_GraphicsIndices,X : AND.W #$F1FF : STA.W EnemyProjectile_GraphicsIndices,X

  .return:
    RTS


;;; $EAD4: Botwoon's body hurt flash handling ;;;
Function_EnemyProj_BotwoonsBody_HurtFlashHandling_duplicate:
;; Parameters:
;;     Y: Enemy projectile index

; Clone of Function_EnemyProjectile_BotwoonsBody_HurtFlashHandling, except using Y instead of X
    LDA.W EnemyProjectile_GraphicsIndices,Y : ORA.W #$0E00 : STA.W EnemyProjectile_GraphicsIndices,Y
    LDA.W Enemy.flashTimer : BEQ .return
    LDA.W NumberOfTimesMainEnemyRoutineExecuted : BIT.W #$0002 : BEQ .return
    LDA.W EnemyProjectile_GraphicsIndices,Y : AND.W #$F1FF : STA.W EnemyProjectile_GraphicsIndices,Y

  .return:
    RTS


;;; $EAF4: Botwoon's body function - dying - set delay ;;;
Function_EnemyProjectile_BotwoonsBody_Dying_SetDelay:
;; Parameters:
;;     X: Enemy projectile index
    TXA : ASL #2 : CLC : ADC.W #$0060 : STA.W EnemyProjectile_Var0,X
    LDA.W #Function_EnemyProjectile_BotwoonsBody_Dying_Waiting : STA.W EnemyProjectile_XVelocity,X
; fallthrough to Function_EnemyProjectile_BotwoonsBody__Dying_Waiting


;;; $EB04: Botwoon's body function - dying - waiting ;;;
Function_EnemyProjectile_BotwoonsBody_Dying_Waiting:
;; Parameters:
;;     X: Enemy projectile index
    INC.W EnemyProjectile_Var0,X
    LDA.W EnemyProjectile_Var0,X : CMP.W #$0100 : BMI .greaterThanEqualTo100
    LDA.W #Function_EnemyProjectile_BotwoonsBody_Dying_Falling : STA.W EnemyProjectile_XVelocity,X

  .greaterThanEqualTo100:
    LDA.W #$0000 : STA.W EnemyProjectile_InstructionTimers,X
    JSR Function_EnemyProjectile_BotwoonsBody_HurtFlashHandling
    RTS


;;; $EB1F: Botwoon's body function - dying - falling ;;;
Function_EnemyProjectile_BotwoonsBody_Dying_Falling:
;; Parameters:
;;     X: Enemy projectile index
    TXY
    LDA.W EnemyProjectile_YVelocity,Y : AND.W #$FF00 : XBA : ASL #3 : TAX
    LDA.W EnemyProjectile_YSubPositions,Y : CLC : ADC.L CommonEnemyProjectileSpeeds_QuadraticallyIncreasing,X : BCC +
    PHA
    LDA.W EnemyProjectile_YPositions,Y : INC : STA.W EnemyProjectile_YPositions,Y
    PLA

+   STA.W EnemyProjectile_YSubPositions,Y
    LDA.W EnemyProjectile_YPositions,Y : CLC : ADC.L CommonEnemyProjectileSpeeds_QuadraticallyIncreasing+2,X : STA.W EnemyProjectile_YPositions,Y
    CMP.W #$00C8 : BMI .falling
    LDA.W #$00C8 : STA.W EnemyProjectile_YPositions,Y
    LDA.W #RTS_86EB93 : STA.W EnemyProjectile_XVelocity,Y
    LDA.W #InstList_EnemyProj_MiscDust_1D_BigExplosion : STA.W EnemyProjectile_InstListPointers,Y
    LDA.W #$0A00 : STA.W EnemyProjectile_GraphicsIndices,Y
    LDA.W #$0001 : STA.W EnemyProjectile_InstructionTimers,Y
    JSR Function_EnemyProj_BotwoonsBody_QueueSmallExplosionSoundFX
    CPY.W #$000A : BNE .return
    LDA.W #$0001 : STA.L Botwoon.bodyDeathFlag2

  .return:
    RTS

  .falling:
    LDA.W EnemyProjectile_YVelocity,Y : CLC : ADC.W #$00C0 : STA.W EnemyProjectile_YVelocity,Y
    LDA.W #$0000 : STA.W EnemyProjectile_InstructionTimers,Y
    JSR Function_EnemyProj_BotwoonsBody_HurtFlashHandling_duplicate
    RTS


;;; $EB93: RTS ;;;
RTS_86EB93:
    RTS


;;; $EB94: Queue small explosion sound effect ;;;
Function_EnemyProj_BotwoonsBody_QueueSmallExplosionSoundFX:
    PHY : PHX
    LDA.W #$0024
    JSL QueueSound_Lib2_Max6
    PLX : PLY
    RTS


;;; $EBA0: Enemy projectile - Botwoon's body ;;;
EnemyProjectile_BotwoonsBody:
    %EnemyProjectile(\
    %initAI(InitAI_EnemyProjectile_BotwoonsBody),
    %preInst(PreInstruction_EnemyProjectile_BotwoonsBody),
    %instList(InstList_EnemyProjectile_BotwoonsBodyTail_Hidden),
    %radius(2, 2),
    %properties($E080),
    %hitList(0),
    %shotList(InstList_EnemyProjectile_Delete))


;;; $EBAE: Instruction list - enemy projectile $EC48 (Botwoon's spit) ;;;
InstList_EnemyProjectile_BotwoonsSpit:
    dw $0003,EnemyProjSpritemaps_BotwoonsSpit_0
    dw $0003,EnemyProjSpritemaps_BotwoonsSpit_1
    dw $0003,EnemyProjSpritemaps_BotwoonsSpit_2
    dw $0003,EnemyProjSpritemaps_BotwoonsSpit_3
    dw $0003,EnemyProjSpritemaps_BotwoonsSpit_4
    dw Instruction_EnemyProjectile_GotoY
    dw InstList_EnemyProjectile_BotwoonsSpit


;;; $EBC6: Initialisation AI - enemy projectile $EC48 (Botwoon's spit) ;;;
InitAI_EnemyProjectile_BotwoonsSpit:
;; Parameters:
;;     Y: Enemy projectile index
;;     EnemyProjectile_InitParam0: Speed
;;     BotwoonSpitAngleParam: Angle
    PHX
    LDX.W EnemyIndex
    LDA.W Enemy.XPosition,X : STA.W EnemyProjectile_XPositions,Y
    LDA.W Enemy.YPosition,X : STA.W EnemyProjectile_YPositions,Y
    LDA.W #InstList_EnemyProjectile_BotwoonsSpit : STA.W EnemyProjectile_InstListPointers,Y
    TYX
    LDA.W BotwoonSpitAngleParam : STA.L EnemyProjectileAngles,X : STA.B DP_Temp12
    LDA.W EnemyProjectile_InitParam0 : STA.B DP_Temp14
    JSL Do_Some_Math_With_Sine_Cosine_Terrible_Label_Name ; ($16.$18, $1A.$1C) = ([$14] * |cos([$12] * pi / 80h)|, [$14] * |sin([$12] * pi / 80h)|)
    LDA.B DP_Temp16 : STA.W EnemyProjectile_XVelocity,Y
    LDA.B DP_Temp18 : STA.W EnemyProjectile_Var0,Y
    LDA.B DP_Temp1A : STA.W EnemyProjectile_YVelocity,Y
    LDA.B DP_Temp1C : STA.W EnemyProjectile_Var1,Y
    PLX
    RTS


;;; $EC05: Pre-instruction - enemy projectile $EC48 (Botwoon's spit) ;;;
PreInstruction_EnemyProjectile_BotwoonsSpit:
;; Parameters:
;;     X: Enemy projectile index
    JSR Move_EnemyProjectile_AccordingToAngleAndSpeed
    JSR Delete_EnemyProjectile_IfOffScreen_duplicate_again3
    RTS


;;; $EC0C: Delete enemy projectile if off-screen ;;;
Delete_EnemyProjectile_IfOffScreen_duplicate_again3:
;; Parameters:
;;     X: Enemy projectile index

; Clone of Delete_EnemyProjectile_IfOffScreen
    JSR CheckIf_EnemyProjectile_IsOffScreen_duplicate_again5
    BEQ .return
    LDA.W #$0000 : STA.W EnemyProjectile_ID,X

  .return:
    RTS


;;; $EC18: Check if enemy projectile is off-screen ;;;
CheckIf_EnemyProjectile_IsOffScreen_duplicate_again5:
;; Parameters:
;;     X: Enemy projectile index
;; Returns:
;;     A: 1 if off-screen, 0 otherwise

; Clone of CheckIf_EnemyProjectile_IsOffScreen
    LDA.W EnemyProjectile_XPositions,X : CMP.W Layer1XPosition : BMI .returnOffScreen
    LDA.W Layer1XPosition : CLC : ADC.W #$0100 : CMP.W EnemyProjectile_XPositions,X : BMI .returnOffScreen
    LDA.W EnemyProjectile_YPositions,X : CMP.W Layer1YPosition : BMI .returnOffScreen
    LDA.W Layer1YPosition : CLC : ADC.W #$0100 : CMP.W EnemyProjectile_YPositions,X : BMI .returnOffScreen
    LDA.W #$0000
    RTS

  .returnOffScreen:
    LDA.W #$0001
    RTS


;;; $EC48: Enemy projectile - Botwoon's spit ;;;
EnemyProjectile_BotwoonsSpit:
    %EnemyProjectile(\
    %initAI(InitAI_EnemyProjectile_BotwoonsSpit),
    %preInst(PreInstruction_EnemyProjectile_BotwoonsSpit),
    %instList(InstList_EnemyProjectile_BotwoonsSpit),
    %radius(2, 2),
    %properties($1060),
    %hitList(0),
    %shotList(InstList_EnemyProjectile_Delete))


;;; $EC56: Instruction list - yapping maw's body - facing down ;;;
InstList_EnemyProjectile_YappingMawsBody_FacingDown:
    dw $0001,EnemyProjSpritemaps_YappingMawsBody_0
    dw Instruction_EnemyProjectile_Sleep


;;; $EC5C: Instruction list - yapping maw's body - facing up ;;;
InstList_EnemyProjectile_YappingMawsBody_FacingUp:
    dw $0001,EnemyProjSpritemaps_YappingMawsBody_1
    dw Instruction_EnemyProjectile_Sleep


;;; $EC62: Initialisation AI - enemy projectile $EC95 (yapping maw's body) ;;;
InitAI_EnemyProjectile_YappingMawsBody:
;; Parameters:
;;     Y: Enemy projectile index
    LDX.W EnemyIndex
    LDA.W Enemy.XPosition,X : STA.W EnemyProjectile_XPositions,Y
    LDA.W Enemy.YPosition,X : STA.W EnemyProjectile_YPositions,Y
    LDA.W #InstList_EnemyProjectile_YappingMawsBody_FacingUp : STA.W EnemyProjectile_InstListPointers,Y
    LDA.W Enemy.init1,X : BNE .facingUp
    LDA.W #InstList_EnemyProjectile_YappingMawsBody_FacingDown : STA.W EnemyProjectile_InstListPointers,Y

  .facingUp:
    PHX
    LDA.L YappingMaw.bodySegmentIndex,X : ASL : CLC : ADC.W EnemyIndex : TAX
    TYA : STA.L YappingMaw.bodySegment0ProjectileIndex,X
    PLX
    RTS


;;; $EC94: RTS. Pre-instruction - enemy projectile $EC95 (yapping maw's body) ;;;
RTS_86EC94:
    RTS


;;; $EC95: Enemy projectile - yapping maw's body ;;;
EnemyProjectile_YappingMawsBody:
    %EnemyProjectile(\
    %initAI(InitAI_EnemyProjectile_YappingMawsBody),
    %preInst(RTS_86EC94),
    %instList(InstList_EnemyProjectile_YappingMawsBody_FacingDown),
    %radius(2, 2),
    %properties($2005),
    %hitList(0),
    %shotList(InstList_EnemyProjectile_Delete))


;;; $ECA3: Instruction list - handle respawning enemy ;;;
InstList_EnemyProjectile_Pickup_HandleRespawningEnemy:
    dw $0040,EnemyProjSpritemaps_Blank_Default
    dw Instruction_EnemyProjectile_Pickup_HandleRespawningEnemy
    dw Instruction_EnemyProjectile_Delete


;;; $ECAB: Instruction list - enemy death explosion - type 4 (big explosion) ;;;
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


;;; $ECC5: Instruction list - enemy death explosion - type 3 (fake Kraid explosion) ;;;
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


;;; $ECE3: Instruction - spawn sprite object [[Y]] randomly within radius 20h ;;;
Instruction_EnemyProj_EnemyDeathExpl_SpawnSpriteObjectInY_20:
;; Parameters:
;;     X: Enemy projectile index
;;     Y: Pointer to instruction arguments
;; Returns:
;;     Y: Pointer to next instruction
    PHX : PHY
    JSL GenerateRandomNumber
    AND.W #$003F : SEC : SBC.W #$0020 : CLC : ADC.W EnemyProjectile_XPositions,X : STA.B DP_Temp12
    LDA.W RandomNumberSeed : AND.W #$3F00 : XBA : SEC : SBC.W #$0020
    CLC : ADC.W EnemyProjectile_YPositions,X : STA.B DP_Temp14
    LDA.W $0000,Y : STA.B DP_Temp16
    STZ.B DP_Temp18
    JSL Create_Sprite_Object
    PLY : PLX
    INY #2
    RTS


;;; $ED17: Instruction - spawn sprite object [[Y]] randomly within radius 10h ;;;
Instruction_EnemyProj_EnemyDeathExpl_SpawnSpriteObjectInY_10:
;; Parameters:
;;     X: Enemy projectile index
;;     Y: Pointer to instruction arguments
;; Returns:
;;     Y: Pointer to next instruction
    PHX : PHY
    JSL GenerateRandomNumber
    AND.W #$001F : SEC : SBC.W #$0010
    CLC : ADC.W EnemyProjectile_XPositions,X : STA.B DP_Temp12
    LDA.W RandomNumberSeed : AND.W #$1F00 : XBA : SEC : SBC.W #$0010
    CLC : ADC.W EnemyProjectile_YPositions,X : STA.B DP_Temp14
    LDA.W $0000,Y : STA.B DP_Temp16
    STZ.B DP_Temp18
    JSL Create_Sprite_Object
    PLY : PLX
    INY #2
    RTS


;;; $ED4B: Instruction list - enemy death explosion - type 2 (normal explosion) ;;;
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


;;; $ED69: Instruction list - enemy death explosion - type 0 (small explosion) ;;;
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
;;; $ED87: Unused. Instruction list - delete ;;;
UNUSED_InstList_EnemyProj_EnemyDeathExplo_GotoDelete_86ED87:
    dw Instruction_EnemyProjectile_GotoY
    dw InstList_EnemyProjectile_Delete


;;; $ED8B: Unused. Instruction list - delete ;;;
UNUSED_InstList_EnemyProj_EnemyDeathExplosion_Delete_86ED8B:
    dw Instruction_EnemyProjectile_Delete
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $ED8D: Instruction list - pickup - small health ;;;
InstList_EnemyProjectile_Pickup_SmallEnergy:
    dw $0008,EnemyProjSpritemaps_Pickup_EnemyDeathExplosion_4
    dw $0008,EnemyProjSpritemaps_Pickup_EnemyDeathExplosion_5
    dw $0008,EnemyProjSpritemaps_Pickup_EnemyDeathExplosion_6
    dw $0008,EnemyProjSpritemaps_Pickup_EnemyDeathExplosion_7
    dw Instruction_EnemyProjectile_GotoY
    dw InstList_EnemyProjectile_Pickup_SmallEnergy
    dw Instruction_EnemyProjectile_Sleep


;;; $EDA3: Instruction list - pickup - big health ;;;
InstList_EnemyProjectile_Pickup_BigEnergy:
    dw $0008,EnemyProjSpritemaps_Pickup_EnemyDeathExplosion_8
    dw $0008,EnemyProjSpritemaps_Pickup_EnemyDeathExplosion_9
    dw $0008,EnemyProjSpritemaps_Pickup_EnemyDeathExplosion_A
    dw $0008,EnemyProjSpritemaps_Pickup_EnemyDeathExplosion_B
    dw Instruction_EnemyProjectile_GotoY
    dw InstList_EnemyProjectile_Pickup_BigEnergy
    dw Instruction_EnemyProjectile_Sleep


;;; $EDB9: Instruction list - pickup - missiles ;;;
InstList_EnemyProjectile_Pickup_Missiles:
    dw $0005,EnemyProjSpritemaps_Pickup_EnemyDeathExplosion_C
    dw $0005,EnemyProjSpritemaps_Pickup_EnemyDeathExplosion_D
    dw Instruction_EnemyProjectile_GotoY
    dw InstList_EnemyProjectile_Pickup_Missiles
    dw Instruction_EnemyProjectile_Sleep


if !FEATURE_KEEP_UNREFERENCED
;;; $EDC7: Unused. Instruction list - pickup - bombs ;;;
UNUSED_InstList_EnemyProjectile_Pickup_Bombs_86EDC7:
    dw $0005,UNUSED_EnemyProjSpritemaps_Pickup_Bombs_0_8DC0C9
    dw $0005,UNUSED_EnemyProjSpritemaps_Pickup_Bombs_1_8DC0D0
    dw $0005,UNUSED_EnemyProjSpritemaps_Pickup_Bombs_2_8DC0D7
    dw $0005,UNUSED_EnemyProjSpritemaps_Pickup_Bombs_3_8DC0DE
    dw Instruction_EnemyProjectile_GotoY
    dw UNUSED_InstList_EnemyProjectile_Pickup_Bombs_86EDC7
    dw Instruction_EnemyProjectile_Sleep
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $EDDD: Instruction list - pickup - super missiles ;;;
InstList_EnemyProjectile_Pickup_SuperMissiles:
    dw $0005,EnemyProjSpritemaps_Pickup_EnemyDeathExplosion_E
    dw $0005,EnemyProjSpritemaps_Pickup_EnemyDeathExplosion_F
    dw Instruction_EnemyProjectile_GotoY
    dw InstList_EnemyProjectile_Pickup_SuperMissiles
    dw Instruction_EnemyProjectile_Sleep


;;; $EDEB: Instruction list - pickup - power bombs ;;;
InstList_EnemyProjectile_Pickup_PowerBombs:
    dw $0005,EnemyProjSpritemaps_Pickup_EnemyDeathExplosion_0
    dw $0005,EnemyProjSpritemaps_Pickup_EnemyDeathExplosion_1
    dw $0005,EnemyProjSpritemaps_Pickup_EnemyDeathExplosion_2
    dw $0005,EnemyProjSpritemaps_Pickup_EnemyDeathExplosion_3
    dw Instruction_EnemyProjectile_GotoY
    dw InstList_EnemyProjectile_Pickup_PowerBombs


;;; $EDFF: Instruction list - enemy death explosion - type 1 (killed by Samus contact) ;;;
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
;;; $EE45: Unused. Instruction list - enemy death explosion ;;;
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


;;; $EE8B: Instruction - queue enemy killed sound effect ;;;
Instruction_EnemyProj_EnemyDeathExpl_QueueEnemyKilledSoundFX:
    PHX : PHY
    LDA.W #$0009
    JSL QueueSound_Lib2_Max1
    PLY : PLX
    RTS


;;; $EE97: Instruction - queue small explosion sound effect ;;;
Instruction_EnemyProj_EDeathExplo_QueueSmallExplosionSoundFX:
    PHX : PHY
    LDA.W #$0024
    JSL QueueSound_Lib2_Max1
    PLY : PLX
    RTS


;;; $EEA3: Instruction - queue enemy killed by contact damage sound effect ;;;
Instruction_EnemyProj_EDeathExplo_QueueContactKilledSoundFX:
    PHX : PHY
    LDA.W #$000B
    JSL QueueSound_Lib2_Max1
    PLY : PLX
    RTS


;;; $EEAF: Instruction - become pickup ;;;
Instruction_EnemyProjectile_EnemyDeathExplosion_BecomePickup:
;; Parameters:
;;     X: Enemy projectile index
;; Returns:
;;     Y: Pointer to next instruction

; BUG: The BEQ after the JSR Random_Drop_Routine causes enemy projectile 0 to be unable to become a pickup
;      The intention I guess is to check if the returned drop type in A is zero,
;      although zero isn't even one of the drop types that can be returned
    PHX : PHY
    JSR Random_Drop_Routine
    BEQ .nothingDrop
    CMP.W #$0006 : BPL .nothingDrop
    ASL : STA.W EnemyProjectile_Var0,X
    TAY
    LDA.W EnemyProjectile_Pickup_InstListPointers,Y : STA.W EnemyProjectile_InstListPointers,X
    LDA.W #$0001 : STA.W EnemyProjectile_InstructionTimers,X
    LDA.W #$0190 : STA.W EnemyProjectile_Var1,X
    LDA.W #PreInstruction_EnemyProjectile_Pickup : STA.W EnemyProjectile_PreInstructions,X
    LDA.W EnemyProjectile_Properties,X : AND.W #$BFFF : STA.W EnemyProjectile_Properties,X
    LDA.W EnemyProjectile_InstListPointers,X
    PLY : PLX
    TAY
    RTS

  .nothingDrop:
    LDA.W #$0001 : STA.W EnemyProjectile_InstructionTimers,X
    LDA.W #$3000 : STA.W EnemyProjectile_Properties,X
    LDA.W #RTS_86EFDF : STA.W EnemyProjectile_PreInstructions,X
    LDA.W #InstList_EnemyProjectile_Pickup_HandleRespawningEnemy : STA.W EnemyProjectile_InstListPointers,X
    PLY : PLX
    TAY
    RTS


;;; $EF04: Instruction list pointers - pickup ;;;
EnemyProjectile_Pickup_InstListPointers:
    dw $0000
    dw InstList_EnemyProjectile_Pickup_SmallEnergy
    dw InstList_EnemyProjectile_Pickup_BigEnergy
    dw InstList_EnemyProjectile_Pickup_PowerBombs
    dw InstList_EnemyProjectile_Pickup_Missiles
    dw InstList_EnemyProjectile_Pickup_SuperMissiles


;;; $EF10: Instruction - handle respawning enemy ;;;
Instruction_EnemyProjectile_Pickup_HandleRespawningEnemy:
    PHY : PHX
    LDA.L EnemyProjectileData_KilledEnemyIndex,X : CMP.W #$FFFF : BEQ .return
    BIT.W #$8000 : BEQ .return
    AND.W #$7FFF
    JSR Respawn_Enemy

  .return:
    PLX : PLY
    RTS


;;; $EF29: Initialisation AI - enemy projectile $F337 (pickup) ;;;
InitAI_EnemyProjectile_Pickup:
;; Parameters:
;;     Y: Enemy projectile index
;;     $12: X position
;;     $14: Y position
;;     Temp_EnemyHeaderPointer: Enemy header pointer (to check drop rates)

; BUG: The BEQ after the JSR Random_Drop_Routine causes enemy projectile 0 to be unable to become a pickup
;      The intention I guess is to check if the returned drop type in A is zero,
;      although zero isn't even one of the drop types that can be returned
    PHX : PHY
    LDA.B DP_Temp12 : STA.W EnemyProjectile_XPositions,Y
    LDA.B DP_Temp14 : STA.W EnemyProjectile_YPositions,Y
    LDA.W #$0000 : STA.W EnemyProjectile_GraphicsIndices,Y
    LDA.W Temp_EnemyHeaderPointer : STA.L EnemyProjectileData_EnemyHeaderPointer,X
    JSR Random_Drop_Routine
    BEQ .nothingDrop
    CMP.W #$0006 : BPL .nothingDrop
    ASL : STA.W EnemyProjectile_Var0,Y
    TAX
    LDA.W EnemyProjectile_Pickup_InstListPointers,X : STA.W EnemyProjectile_InstListPointers,Y
    LDA.W #$0001 : STA.W EnemyProjectile_InstructionTimers,Y
    LDA.W #$0190 : STA.W EnemyProjectile_Var1,Y
    TYX
    LDA.W #$FFFF : STA.L EnemyProjectileData_KilledEnemyIndex,X
    PLY : PLX
    RTS

  .nothingDrop:
    LDA.W #InstList_EnemyProjectile_Pickup_HandleRespawningEnemy : STA.W EnemyProjectile_InstListPointers,Y
    LDA.W #$0001 : STA.W EnemyProjectile_InstructionTimers,Y
    LDA.W #$3000 : STA.W EnemyProjectile_Properties,Y
    LDA.W #RTS_86EFDF : STA.W EnemyProjectile_PreInstructions,Y
    PLY : PLX
    RTS


;;; $EF89: Initialisation AI - enemy projectile $F345 (enemy death explosion) ;;;
InitAI_EnemyProjectile_EnemyDeathExplosion:
;; Parameters:
;;     Y: Enemy projectile index
;;     EnemyProjectile_InitParam0: Death animation. Range 0..4
;;         0: Small explosion
;;         1: Killed by Samus contact
;;         2: Normal explosion
;;         3: Fake Kraid explosion
;;         4: Big explosion
    PHX : PHY
    TYX
    LDY.W EnemyIndex
    LDA.W Enemy.XPosition,Y : STA.W EnemyProjectile_XPositions,X
    LDA.W Enemy.YPosition,Y : STA.W EnemyProjectile_YPositions,X
    LDA.W EnemyIndex : STA.L EnemyProjectileData_KilledEnemyIndex,X
    LDA.W Enemy.properties,Y : BIT.W #$4000 : BEQ .noRespawn
    LDA.W EnemyIndex : ORA.W #$8000 : STA.L EnemyProjectileData_KilledEnemyIndex,X

  .noRespawn:
    LDA.W Enemy.ID,Y : STA.L EnemyProjectileData_EnemyHeaderPointer,X
    LDA.W #$0000 : STA.W EnemyProjectile_GraphicsIndices,X
    LDA.W EnemyProjectile_InitParam0 : ASL : TAY
    LDA.W .InstListPointers,Y : STA.W EnemyProjectile_InstListPointers,X
    LDA.W #$0001 : STA.W EnemyProjectile_InstructionTimers,X
    PLY : PLX
    RTS

  .InstListPointers:
    dw InstList_EnemyProjectile_EnemyDeathExplosion_SmallExplosion
    dw InstList_EnemyProj_EnemyDeathExplosion_KilledBySamusContact
    dw InstList_EnemyProjectile_EnemyDeathExplosion_NormalExplosion
    dw InstList_EnemyProj_EnemyDeathExplosion_MiniKraidExplosion_0
    dw InstList_EnemyProjectile_EnemyDeathExplosion_BigExplosion_0


;;; $EFDF: RTS. Pre-instruction - enemy projectile $F345 (enemy death explosion) ;;;
RTS_86EFDF:
    RTS


;;; $EFE0: Pre-instruction - enemy projectile $F337 (pickup) ;;;
PreInstruction_EnemyProjectile_Pickup:
    PHX : PHY
    DEC.W EnemyProjectile_Var1,X
    LDA.W EnemyProjectile_Var1,X : BEQ .timerExpired
    LDA.W #$000D
    JSL Run_Samus_Command
    AND.W #$FFFF : BEQ .notGrappled
    LDA.W EnemyProjectile_Var1,X : CMP.W #$0180 : BPL .notGrappled
    LDA.W EnemyProjectile_XPositions,X : SEC : SBC.W GrappleBeam_EndXPosition : BPL +
    EOR.W #$FFFF : INC

+   CMP.W #$0010 : BPL .notGrappled
    LDA.W EnemyProjectile_YPositions,X : SEC : SBC.W GrappleBeam_EndYPosition : BPL +
    EOR.W #$FFFF : INC

+   CMP.W #$0010 : BPL .notGrappled
    PHX
    LDA.W EnemyProjectile_Var0,X : TAX
    JSR.W (.functionPointers,X)
    PLX

  .timerExpired:
    LDA.W #InstList_EnemyProjectile_Pickup_HandleRespawningEnemy : STA.W EnemyProjectile_InstListPointers,X
    LDA.W #$0001 : STA.W EnemyProjectile_InstructionTimers,X
    LDA.W #$3000 : STA.W EnemyProjectile_Properties,X
    LDA.W #RTS_86EFDF : STA.W EnemyProjectile_PreInstructions,X
    BRA .return

  .notGrappled:
    LDA.W EnemyProjectile_Radii,X : AND.W #$00FF : STA.W Temp_ProjectileXRadius
    LDA.W EnemyProjectile_Radii+1,X : AND.W #$00FF : STA.W Temp_ProjectileYRadius
    LDA.W SamusXPosition : SEC : SBC.W EnemyProjectile_XPositions,X : BPL +
    EOR.W #$FFFF : INC

+   SEC : SBC.W SamusXRadius : BCC +
    CMP.W Temp_ProjectileXRadius : BCS .return

+   LDA.W SamusYPosition : SEC : SBC.W EnemyProjectile_YPositions,X : BPL +
    EOR.W #$FFFF : INC

+   SEC : SBC.W SamusYRadius : BCC +
    CMP.W Temp_ProjectileYRadius : BCC +
    BRA .return

+   PHX
    LDA.W EnemyProjectile_Var0,X : TAX
    JSR.W (.functionPointers,X)
    PLX
    LDA.W #InstList_EnemyProjectile_Pickup_HandleRespawningEnemy : STA.W EnemyProjectile_InstListPointers,X
    LDA.W #$0001 : STA.W EnemyProjectile_InstructionTimers,X
    LDA.W #$3000 : STA.W EnemyProjectile_Properties,X
    LDA.W #RTS_86EFDF : STA.W EnemyProjectile_PreInstructions,X

  .return:
    PLY : PLX
    RTS

  .functionPointers:
    dw $0000
    dw Function_EnemyProjectile_Pickup_ApplySmallEnergy                  ; 2: Small health
    dw Function_EnemyProjectile_Pickup_ApplyBigEnergy                    ; 4: Big health
    dw Function_EnemyProjectile_Pickup_ApplyPowerBombs                   ; 6: Power bombs
    dw Function_EnemyProjectile_Pickup_ApplyMissiles                     ; 8: Missiles
    dw Function_EnemyProjectile_Pickup_ApplySuperMissiles                ; Ah: Super missiles
    dw $0000


;;; $F0BB: Apply pickup to Samus - small health ;;;
Function_EnemyProjectile_Pickup_ApplySmallEnergy:
    LDA.W #$0005
    JSL Restore_A_Energy_ToSamus
    LDA.W #$0001
    JSL QueueSound_Lib2_Max1
    RTS


;;; $F0CA: Apply pickup to Samus - big health ;;;
Function_EnemyProjectile_Pickup_ApplyBigEnergy:
    LDA.W #$0014
    JSL Restore_A_Energy_ToSamus
    LDA.W #$0002
    JSL QueueSound_Lib2_Max1
    RTS


;;; $F0D9: Apply pickup to Samus - power bombs ;;;
Function_EnemyProjectile_Pickup_ApplyPowerBombs:
    LDA.W #$0001
    JSL Restore_A_PowerBombs_ToSamus
    LDA.W #$0005
    JSL QueueSound_Lib2_Max1
    RTS


;;; $F0E8: Apply pickup to Samus - missiles ;;;
Function_EnemyProjectile_Pickup_ApplyMissiles:
    LDA.W #$0002
    JSL Restore_A_Missiles_ToSamus
    LDA.W #$0003
    JSL QueueSound_Lib2_Max1
    RTS


;;; $F0F7: Apply pickup to Samus - super missiles ;;;
Function_EnemyProjectile_Pickup_ApplySuperMissiles:
    LDA.W #$0001
    JSL Restore_A_SuperMissiles_ToSamus
    LDA.W #$0004
    JSL QueueSound_Lib2_Max1
    RTS


;;; $F106: Random drop routine ;;;
Random_Drop_Routine:
;; Parameters:
;;     X: Enemy projectile index
;; Returns:
;;     A: Drop type
;;         1: Small health
;;         2: Big health
;;         3: Power bombs
;;         4: Missiles
;;         5: Super missiles
;;         6: Nothing

; A random target value is chosen in 1..FFh
; In principle, the random selection process works by accumulating the drop chances until the random target is met
; If we assume the sum of the drop chances is FFh, this is a correct algorithm as:
;     Pr(small energy) = small energy chance / 255
;     Pr(big energy) = (Pr(not small energy)) * big energy chance / (255 - small energy chance)
;                    = (1 - Pr(small energy)) * big energy chance / (255 - small energy chance)
;                    = (1 - Pr(small energy)) * big energy chance / ((1 - Pr(small energy)) * 255)
;                    = big energy chance / 255
; The other cases follow similarly
; In practice, the selection system has to deal with:
;     Item drops being unavailable due to having full energy/missiles/super missiles/power bombs
;     Energy being guaranteed when Samus health is low (this is easy to deal with)
; For the first issue, rather than rescaling the drop chances, the system resolves these in such a way that
; the probability of getting super missiles (resp. power bombs) doesn't change,
; but the other items (inc. nothing) become more likely.
; In detail:
;     Define minor items as small energy, big energy, missiles and nothing, major items are super missiles and power bombs
;     The minor and major drop chances are pooled (summed) separately
;     If Samus is low on health, then the pooled major drop chance will be 0
;     If Samus has full of whatever item, it is not pooled
;     For the minor items, the accumulator of the drop chances is multiplied by (255 - pooled major drop chance) / (pooled minor drop chance)
;     The accumulator for the major items will then start at
;           (pooled minor drop chance) * (255 - pooled major drop chance) / (pooled minor drop chance)
;         = 255 - pooled major drop chance
;     as it would normally be
    PHX : PHY : PHB
    PEA.W EnemyHeaders>>8 : PLB : PLB
    LDA.L EnemyProjectileData_KilledEnemyIndex,X : AND.W #$7FFF : STA.W Temp_NeverRead0E2A
    LDA.L EnemyProjectileData_EnemyHeaderPointer,X : TAX : STA.W Temp_NeverRead0E28
    LDA.L EnemyHeaders_dropChances,X : TAX : BNE .enemyHasDrops
    JMP .returnNothing

  .enemyHasDrops:
    JSL GenerateRandomNumber
    AND.W #$00FF : BEQ .enemyHasDrops
    STA.B DP_Temp1A
    LDA.W #$00FF : STA.B DP_Temp14
    STZ.B DP_Temp18
    LDY.W #$0001
    LDA.W Energy : CLC : ADC.W ReserveEnergy : CMP.W #$001E : BCC .healthBombFlag
    CMP.W #$0032 : BCC .gracePeriod
    DEY

  .healthBombFlag:
    STY.W CriticalEnergyFlag

  .gracePeriod:
    SEP #$20
    LDA.W CriticalEnergyFlag : BEQ .noHealthBomb
    LDA.L EnemyDropChances_smallEnergy,X : CLC : ADC.L EnemyDropChances_bigEnergy,X : STA.B DP_Temp12
    LDA.B #$03 : STA.B DP_Temp16
    JMP .dropChancesPooled

  .noHealthBomb:
    LDA.L EnemyDropChances_nothing,X : STA.B DP_Temp12
    LDA.B #$08 : STA.B DP_Temp16
    LDY.W Energy : CPY.W MaxEnergy : BNE .energyAllowed
    LDY.W ReserveEnergy : CPY.W MaxReserveEnergy : BEQ .fullEnergy

  .energyAllowed:
    LDA.B DP_Temp12 : CLC : ADC.L EnemyDropChances_smallEnergy,X : ADC.L EnemyDropChances_bigEnergy,X : STA.B DP_Temp12
    LDA.B DP_Temp16 : ORA.B #$03 : STA.B DP_Temp16

  .fullEnergy:
    LDY.W Missiles : CPY.W MaxMissiles : BEQ .checkSuperMissiles
    LDA.B DP_Temp12 : CLC : ADC.L EnemyDropChances_missiles,X : STA.B DP_Temp12
    LDA.B DP_Temp16 : ORA.B #$04 : STA.B DP_Temp16

  .checkSuperMissiles:
    LDY.W SuperMissiles : CPY.W MaxSuperMissiles : BEQ .checkPowerBombs
    LDA.B DP_Temp14 : SEC : SBC.L EnemyDropChances_superMissiles,X : STA.B DP_Temp14
    LDA.B DP_Temp16 : ORA.B #$10 : STA.B DP_Temp16

  .checkPowerBombs:
    LDY.W PowerBombs : CPY.W MaxPowerBombs : BEQ .dropChancesPooled
    LDA.B DP_Temp14 : SEC : SBC.L EnemyDropChances_powerBombs,X : STA.B DP_Temp14
    LDA.B DP_Temp16 : ORA.B #$20 : STA.B DP_Temp16

  .dropChancesPooled:
    LDY.W #$0000

  .loopMinorDrops:
    SEP #$20
    LDA.B DP_Temp12 : BEQ .noMinorDrops
    LSR.B DP_Temp16 : BCC .nextMinorDrop
    LDA.B DP_Temp14 : STA.W $4202
    LDA.L EnemyDropChances_smallEnergy,X : STA.W $4203
    PHY
    NOP #2
    LDY.W $4216 : STY.W $4204
    LDA.B DP_Temp12 : STA.W $4206
    PLY
    NOP
    REP #$20
    LDA.B DP_Temp18 : CLC : ADC.W $4214 : CMP.B DP_Temp1A : BCS .return
    STA.B DP_Temp18

  .nextMinorDrop:
    INX
    INY : CPY.W #$0004 : BNE .loopMinorDrops
    BRA .loopMajorDrops

  .noMinorDrops:
    LDA.B DP_Temp16 : LSR #4 : STA.B DP_Temp16
    INX #4
    LDY.W #$0004

  .loopMajorDrops:
    SEP #$20
    LSR.B DP_Temp16 : BCC .nextMajorDrop
    REP #$20
    LDA.L EnemyDropChances_smallEnergy,X : AND.W #$00FF : CLC : ADC.B DP_Temp18
    CMP.B DP_Temp1A : BCS .return
    STA.B DP_Temp18

  .nextMajorDrop:
    INX
    INY : CPY.W #$0006 : BNE .loopMajorDrops

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


;;; $F264: Respawn enemy ;;;
Respawn_Enemy:
;; Parameters:
;;     A: Enemy index
    PHB : PHX : PHY
    PEA.W EnemyHeaders>>8&$FF00 : PLB : PLB
    REP #$30
    STA.W EnemyIndex
    LSR #2 : CLC : ADC.W EnemyPopulationPointer : TAX
    LDY.W EnemyIndex
    LDA.L EnemyPopulations_ID,X : STA.W Enemy.ID,Y
    LDA.L EnemyPopulations_XPosition,X : STA.W Enemy.XPosition,Y
    LDA.L EnemyPopulations_YPosition,X : STA.W Enemy.YPosition,Y
    LDA.L EnemyPopulations_init,X : STA.W Enemy.instList,Y
    LDA.L EnemyPopulations_properties,X : STA.W Enemy.properties,Y
    LDA.L EnemyPopulations_extraProperties,X : STA.W Enemy.properties2,Y
    LDA.L EnemyPopulations_param1,X : STA.W Enemy.init0,Y
    LDA.L EnemyPopulations_param2,X : STA.W Enemy.init1,Y
    PHX
    TYX
    LDA.L EnemySpawnData.paletteIndex,X : STA.W Enemy.palette,X
    LDA.L EnemySpawnData.VRAMTilesIndex,X : STA.W Enemy.GFXOffset,X
    PLX
    LDA.W #$0000 : STA.W Enemy.freezeTimer,Y : STA.W Enemy.flashTimer,Y
    STA.W Enemy.invincibilityTimer,Y : STA.W Enemy.loopCounter,Y : STA.W Enemy.frameCounter,Y
    STA.W Enemy.var0,Y : STA.W Enemy.var1,Y : STA.W Enemy.var2,Y
    STA.W Enemy.var3,Y : STA.W Enemy.var4,Y : STA.W Enemy.var5,Y
    LDA.W #$0001 : STA.W Enemy.instTimer,Y
    LDX.W EnemyIndex
    LDA.W Enemy.ID,X : TAX
    LDA.W $0012,X : STA.W EnemyAIPointer
    LDA.W $0008,X : STA.W Enemy.XHitboxRadius,Y
    LDA.W $000A,X : STA.W Enemy.YHitboxRadius,Y
    LDA.W $0004,X : STA.W Enemy.health,Y
    LDA.W $0039,X : AND.W #$00FF : STA.W Enemy.layer,Y
    LDA.W $000C,X : STA.W Enemy.bank,Y : STA.W EnemyAIPointer+2
    JSL .executeEnemyInitAI
    PLY : PLX : PLB
    RTS

  .executeEnemyInitAI:
    LDX.W EnemyIndex
    LDA.W Enemy.bank,X : STA.W EnemyAIPointer+2
    XBA : PHA : PLB : PLB
    JML.W [EnemyAIPointer]


;;; $F337: Enemy projectiles - enemy death explosion / pickup ;;;
EnemyProjectile_EnemyDeathPickup:
    %EnemyProjectile(\
    %initAI(InitAI_EnemyProjectile_Pickup),
    %preInst(PreInstruction_EnemyProjectile_Pickup),
    %instList(InstList_EnemyProjectile_Pickup_SmallEnergy),
    %radius($10, $10),
    %properties($3000),
    %hitList(InstList_EnemyProjectile_Delete),
    %shotList(InstList_EnemyProjectile_Delete))

EnemyProjectile_EnemyDeathExplosion:
    %EnemyProjectile(\
    %initAI(InitAI_EnemyProjectile_EnemyDeathExplosion),
    %preInst(RTS_86EFDF),
    %instList(InstList_EnemyProjectile_Pickup_SmallEnergy),
    %radius($10, $10),
    %properties($7000),
    %hitList(InstList_EnemyProjectile_Delete),
    %shotList(InstList_EnemyProjectile_Delete))


;;; $F353: Instruction list - falling spark - falling ;;;
InstList_EnemyProjectile_FallingSpark_Falling:
    dw $0003,EnemyProjSpritemaps_Sparks_0
    dw $0003,EnemyProjSpritemaps_Sparks_1
    dw $0003,EnemyProjSpritemaps_Sparks_2
    dw Instruction_EnemyProjectile_GotoY
    dw InstList_EnemyProjectile_FallingSpark_Falling


;;; $F363: Instruction list - falling spark - hit floor ;;;
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


;;; $F391: Initialisation AI - enemy projectile $F498 (falling spark) ;;;
InitAI_EnemyProjectile_FallingSpark:
;; Parameters:
;;     Y: Enemy projectile index
    LDX.W EnemyIndex
    LDA.W #InstList_EnemyProjectile_FallingSpark_Falling : STA.W EnemyProjectile_InstListPointers,Y
    LDA.W Enemy.XPosition,X : STA.W EnemyProjectile_XPositions,Y
    LDA.W Enemy.XSubPosition,X : STA.W EnemyProjectile_XSubPositions,Y
    LDA.W Enemy.YPosition,X : CLC : ADC.W #$0008 : STA.W EnemyProjectile_YPositions,Y
    LDA.W Enemy.YSubPosition,X : STA.W EnemyProjectile_YSubPositions,Y
    LDA.W #$0000 : STA.W EnemyProjectile_XVelocity,Y : STA.W EnemyProjectile_YVelocity,Y
    JSL GenerateRandomNumber
    AND.W #$001C : TAX
    LDA.W .distance,X : STA.W EnemyProjectile_Var1,Y
    LDA.W .subdistance,X : STA.W EnemyProjectile_Var0,Y
    RTS

; This table is one entry too short to be indexed with 1Ch >_<;
  .distance:
    dw $FFFF
  .subdistance:
    dw       $B800
    dw $FFFF,$C000
    dw $FFFF,$E000
    dw $FFFF,$FF00
    dw $0000,$0100
    dw $0000,$2000
    dw $0000,$4000


;;; $F3F0: Pre-instruction - enemy projectile $F498 (falling spark) ;;;
PreInstruction_EnemyProjectile_FallingSpark:
;; Parameters:
;;     X: Enemy projectile index
    LDA.W EnemyProjectile_YVelocity,X : BMI .positiveVelocity
    JSR Move_EnemyProjectile_Vertically
    BCS .hitFloor
    CLC
    LDA.W EnemyProjectile_XVelocity,X : ADC.W #$4000 : STA.W EnemyProjectile_XVelocity,X
    LDA.W EnemyProjectile_YVelocity,X : ADC.W #$0000 : CMP.W #$0004 : BCS .positiveVelocity
    STA.W EnemyProjectile_YVelocity,X

  .positiveVelocity:
    CLC
    LDA.W EnemyProjectile_YSubPositions,X : ADC.W EnemyProjectile_XVelocity,X : STA.W EnemyProjectile_YSubPositions,X
    LDA.W EnemyProjectile_YPositions,X : ADC.W EnemyProjectile_YVelocity,X : STA.W EnemyProjectile_YPositions,X
    CLC
    LDA.W EnemyProjectile_XSubPositions,X : ADC.W EnemyProjectile_Var0,X : STA.W EnemyProjectile_XSubPositions,X
    LDA.W EnemyProjectile_XPositions,X : ADC.W EnemyProjectile_Var1,X : STA.W EnemyProjectile_XPositions,X
    LDA.W NMI_8bitFrameCounter : BIT.W #$0003 : BNE .return
    LDA.W EnemyProjectile_XPositions,X : STA.B DP_Temp12
    LDA.W EnemyProjectile_YPositions,X : STA.B DP_Temp14
    LDA.W #$0030 : STA.B DP_Temp16
    LDA.W EnemyProjectile_GraphicsIndices,X : STA.B DP_Temp18
    JSL Create_Sprite_Object

  .return:
    RTS

  .hitFloor:
    LDA.W #InstList_EnemyProjectile_FallingSpark_HitFloor : STA.W EnemyProjectile_InstListPointers,X
    LDA.W #$0001 : STA.W EnemyProjectile_InstructionTimers,X
    LDA.W EnemyProjectile_Var0,X : ASL : STA.W EnemyProjectile_Var0,X
    LDA.W EnemyProjectile_Var1,X : ROL : STA.W EnemyProjectile_Var1,X
    LDA.W EnemyProjectile_Var0,X : ASL : STA.W EnemyProjectile_Var0,X
    LDA.W EnemyProjectile_Var1,X : ROL : STA.W EnemyProjectile_Var1,X
    LDA.W #$8000 : STA.W EnemyProjectile_XVelocity,X
    LDA.W #$FFFF : STA.W EnemyProjectile_YVelocity,X
    LDA.W EnemyProjectile_YPositions,X : SEC : SBC.W #$0002 : STA.W EnemyProjectile_YPositions,X
    RTS


;;; $F498: Enemy projectile - falling spark ;;;
EnemyProjectile_FallingSpark:
    %EnemyProjectile(\
    %initAI(InitAI_EnemyProjectile_FallingSpark),
    %preInst(PreInstruction_EnemyProjectile_FallingSpark),
    %instList(InstList_EnemyProjectile_FallingSpark_Falling),
    %radius(4, 4),
    %properties($0005),
    %hitList(0),
    %shotList(InstList_EnemyProjectile_Delete))


Freespace_Bank86_F4A6:
; $B5A bytes
