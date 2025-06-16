
org $908000


;;; $8000: Animate Samus ;;;
AnimateSamus:
; Calls code to check FX for liquid physics (which affects the Samus animation frame buffer variable)
; That code also handles lava/acid damage and water splash / air bubble graphics
; Some special case code for keeping to frame 1 of neutral jump animation whilst rising
; Decrement the Samus animation frame timer,
; if zero then Samus animation frame is incremented and the Samus animation delay table is processed
; If an instruction is encountered in the animation delay table,
; some handling for speed booster running is called that deals with incrementing the speed booster stage
; If speed booster handling is not applicable, then the animation delay instruction is processed,
; which may cause looping or branching of the animation

; The actual drawing of Samus (using the Samus pose and Samus animation frame) happens elsewhere (draw Samus routines $85E2..8A4B)
    PHP
    REP #$30
    JSL Get_Samus_BottomTop_Boundary
    LDA.W FX_Type : AND.W #$000F : TAX
    JSR.W (.pointers,X)
    LDA.W Pose : CMP.W #$004D : BEQ .neutralJump
    CMP.W #$004E : BEQ .neutralJump
    LDA.W SamusAnimationFrameTimer : DEC : STA.W SamusAnimationFrameTimer
    BEQ +
    BPL .return

+   LDA.W SamusAnimationFrame : INC : STA.W SamusAnimationFrame
    BRA .handleDelay

  .neutralJump:
    LDA.W SamusYDirection : CMP.W #$0002 : BEQ +
    LDA.W SamusAnimationFrame : CMP.W #$0001 : BNE +
    LDA.W SamusAnimationFrameTimer : CMP.W #$0001 : BNE +
    LDA.W #$0004 : STA.W SamusAnimationFrameTimer

+   LDA.W SamusAnimationFrameTimer : DEC : STA.W SamusAnimationFrameTimer
    BEQ .incAnimFrame
    BPL .return

  .incAnimFrame:
    LDA.W SamusAnimationFrame : INC : STA.W SamusAnimationFrame

  .handleDelay:
    JSR Handle_Samus_AnimationDelay

  .return:
    PLP
    RTS

  .pointers:
    dw AnimateSamus_FX_None
    dw AnimateSamus_FX_Lava
    dw AnimateSamus_FX_Acid
    dw AnimateSamus_FX_Water
    dw RTS_908077
    dw RTS_908077
    dw RTS_908077
    dw RTS_908077


;;; $8077: RTS ;;;
RTS_908077:
; 8: Spores
; Ah: Rain
; Ch: Fog
; 28h: Ceres Ridley
; 2Ah: Ceres elevator
; 2Ch: Haze
    RTS


;;; $8078: Animate Samus - FX = none ;;;
AnimateSamus_FX_None:
;; Parameters:
;;     $12: Samus bottom boundary
;;     $14: Samus top boundary

; 0: None
; 20h: Scrolling sky

; Called by the subroutines for the other FX types too if the FX doesn't affect Samus
    LDA.W XSpeedDivisor : STA.W SamusAnimationFrameBuffer
    LDA.W LiquidPhysicsType : BEQ .return
    BIT.W #$0001 : BNE +
    STZ.W LiquidPhysicsType
    RTS

+   STZ.W LiquidPhysicsType
    LDA.W #$000E
    JSL QueueSound_Lib2_Max6
    LDA.W SuitPaletteIndex : BIT.W #$0004 : BNE .goto_Spawn_WaterSplash_AirBubbles
    LDA.W MovementType : AND.W #$00FF : CMP.W #$0003 : BEQ +
    CMP.W #$0014 : BNE .goto_Spawn_WaterSplash_AirBubbles

+   LDA.W #$0030
    JSL QueueSound_Lib1_Max6

  .goto_Spawn_WaterSplash_AirBubbles:
    BRA Spawn_WaterSplash_AirBubbles

  .return:
    RTS


;;; $80B8: Animate Samus - FX = water ;;;
AnimateSamus_FX_Water:
;; Parameters:
;;     $12: Samus bottom boundary
;;     $14: Samus top boundary

; 6h: Water
; 26h: Tourian entrance statue
    LDA.W FX_YPosition : BMI AnimateSamus_FX_None
    CMP.B DP_Temp12 : BMI +
    BRA AnimateSamus_FX_None

+   LDA.W FX_LiquidOptions : BIT.W #$0004 : BNE AnimateSamus_FX_None
    LDA.W SamusPhysicsConstants_AnimationDelayInWater : STA.W SamusAnimationFrameBuffer
    LDA.W LiquidPhysicsType : CMP.W #$0001 : BEQ Spawn_AirBubbles
    LDA.W #$0001 : STA.W LiquidPhysicsType
    LDA.W #$000D
    JSL QueueSound_Lib2_Max6
; fallthrough to Spawn_WaterSplash_AirBubbles


;;; $80E6: Spawn water splash and air bubbles ;;;
Spawn_WaterSplash_AirBubbles:
;; Parameters:
;;     $12: Samus bottom boundary
;;     $14: Samus top boundary
    LDA.W MovementType : AND.W #$00FF : TAX
    LDA.W WaterSplash_TypeTable,X : AND.W #$00FF : BNE .grounded
    LDA.W #$0300 : STA.W AtmosphericGraphicsAnimFramesGraphicsTypes
    LDA.W #$0002 : STA.W AtmosphericGraphicsAnimationTimers
    LDA.W SamusXPosition : STA.W AtmosphericGraphicsXPositions
    LDA.W FX_YPosition : STA.W AtmosphericGraphicsYPositions
    BRA Spawn_AirBubbles

  .grounded:
    LDA.W #$0100 : STA.W AtmosphericGraphicsAnimFramesGraphicsTypes : STA.W AtmosphericGraphicsAnimFramesGraphicsTypes+2
    LDA.W #$0003 : STA.W AtmosphericGraphicsAnimationTimers : STA.W AtmosphericGraphicsAnimationTimers+2
    LDA.W SamusXPosition : CLC : ADC.W #$0004 : STA.W AtmosphericGraphicsXPositions
    SEC : SBC.W #$0007 : STA.W AtmosphericGraphicsXPositions+2
    LDA.B DP_Temp12 : SEC : SBC.W #$0004 : STA.W AtmosphericGraphicsYPositions : STA.W AtmosphericGraphicsYPositions+2
; fallthrough to Spawn_AirBubbles


;;; $813E: Spawn air bubbles ;;;
Spawn_AirBubbles:
;; Parameters:
;;     $12: Samus bottom boundary
;;     $14: Samus top boundary
    LDA.B DP_Temp14 : SEC : SBC.W #$0018 : CMP.W FX_YPosition : BMI .noBubbles
    LDA.W NMI_FrameCounter : BIT.W #$007F : BNE .noBubbles
    LDA.W AtmosphericGraphicsAnimFramesGraphicsTypes+4 : BNE .noBubbles
    LDA.W #$0500 : STA.W AtmosphericGraphicsAnimFramesGraphicsTypes+4
    LDA.W #$0003 : STA.W AtmosphericGraphicsAnimationTimers+4
    LDA.W SamusXPosition : STA.W AtmosphericGraphicsXPositions+4
    LDA.W SamusYPosition : SEC : SBC.W SamusYRadius
    CLC : ADC.W #$0006 : STA.W AtmosphericGraphicsYPositions+4
    JSL GenerateRandomNumber
    BIT.W #$0001 : BEQ .bubblesSFX
    LDA.W #$000F
    BRA .queueSFX

  .bubblesSFX:
    LDA.W #$0011

  .queueSFX:
    JSL QueueSound_Lib2_Max6

  .noBubbles:
    LDA.W Pose : CMP.W #$0000 : BEQ .zeroFrameBuffer
    CMP.W #$009B : BEQ .zeroFrameBuffer
    LDA.W EquippedItems : BIT.W #$0020 : BEQ .return

  .zeroFrameBuffer:
    STZ.W SamusAnimationFrameBuffer

  .return:
    RTS


;;; $81A4: Water splash type table ;;;
WaterSplash_TypeTable:
; 0: diving splash, else footstep splashes
    db $01 ;* 0: Standing
    db $00 ; 1: Running
    db $00 ; 2: Normal jumping
    db $00 ; 3: Spin jumping
    db $01 ;* 4: Morph ball - on ground
    db $01 ;* 5: Crouching
    db $00 ; 6: Falling
    db $00 ; 7: Unused
    db $00 ; 8: Morph ball - falling
    db $00 ; 9: Unused
    db $00 ; Ah: Knockback / crystal flash ending
    db $00 ; Bh: Unused
    db $00 ; Ch: Unused
    db $00 ; Dh: Unused
    db $01 ;* Eh: Turning around - on ground
    db $01 ;* Fh: Crouching/standing/morphing/unmorphing transition
    db $01 ;* 10h: Moonwalking
    db $01 ;* 11h: Spring ball - on ground
    db $00 ; 12h: Spring ball - in air
    db $00 ; 13h: Spring ball - falling
    db $00 ; 14h: Wall jumping
    db $01 ;* 15h: Ran into a wall
    db $00 ; 16h: Grappling
    db $00 ; 17h: Turning around - jumping
    db $00 ; 18h: Turning around - falling
    db $00 ; 19h: Damage boost
    db $00 ; 1Ah: Grabbed by Draygon
    db $00 ; 1Bh: Shinespark / crystal flash / drained by metroid / damaged by MB's attacks


;;; $81C0: Animate Samus - FX = lava ;;;
AnimateSamus_FX_Lava:
;; Parameters:
;;     $12: Samus bottom boundary
;;     $14: Samus top boundary

; 2: Lava
; 22h: Unused
; Contains lava damage / gravity suit check
    LDA.W FX_LavaAcidYPosition : BMI .goto_AnimateSamus_FX_None
    CMP.B DP_Temp12 : BPL .goto_AnimateSamus_FX_None
    LDA.W SamusBoostTimer : BEQ .zeroSpeedTimer
    JSL Cancel_SpeedBoosting
    STZ.W SamusXExtraRunSpeed
    STZ.W SamusXExtraRunSubSpeed

  .zeroSpeedTimer:
    LDA.W EquippedItems : BIT.W #$0020 : BNE .gravityEquipped
    LDA.W IGTFrames : BIT.W #$0007 : BNE .periodicDamage
    LDA.W Energy : CMP.W #$0047 : BMI .periodicDamage
    LDA.W #$002D
    JSL QueueSound_Lib3_Max3

  .periodicDamage:
    LDA.W PeriodicSubDamage : CLC : ADC.W SamusPhysicsConstants_LavaSubDamagePerFrame : STA.W PeriodicSubDamage
    LDA.W PeriodicDamage : ADC.W SamusPhysicsConstants_LavaDamagePerFrame : STA.W PeriodicDamage
    BRA AnimateSamus_SubmergedInLavaAcid

  .goto_AnimateSamus_FX_None:
    JMP AnimateSamus_FX_None

  .gravityEquipped:
    STZ.W SamusAnimationFrameBuffer
    LDA.W #$0002 : STA.W LiquidPhysicsType
    RTS


;;; $8219: Animate Samus - FX = acid ;;;
AnimateSamus_FX_Acid:
;; Parameters:
;;     $12: Samus bottom boundary
;;     $14: Samus top boundary

; 4: Acid
; 24h: Fireflea
    LDA.W FX_LavaAcidYPosition : BMI AnimateSamus_FX_Lava_goto_AnimateSamus_FX_None
    CMP.B DP_Temp12 : BPL AnimateSamus_FX_Lava_goto_AnimateSamus_FX_None
    LDA.W IGTFrames : BIT.W #$0007 : BNE +
    LDA.W Energy : CMP.W #$0047 : BMI +
    LDA.W #$002D
    JSL QueueSound_Lib3_Max3

+   LDA.W PeriodicSubDamage : CLC : ADC.W SamusPhysicsConstants_AcidSubDamagePerFrame : STA.W PeriodicSubDamage
    LDA.W PeriodicDamage : ADC.W SamusPhysicsConstants_AcidDamagePerFrame : STA.W PeriodicDamage
; fallthrough to AnimateSamus_SubmergedInLavaAcid


;;; $824C: Animate Samus - Samus is submerged in lava/acid ;;;
AnimateSamus_SubmergedInLavaAcid:
;; Parameters:
;;     $12: Samus bottom boundary
;;     $14: Samus top boundary
    LDA.W SamusPhysicsConstants_AnimationDelayInLavaAcid : STA.W SamusAnimationFrameBuffer
    LDA.W #$0002 : STA.W LiquidPhysicsType
    LDA.B DP_Temp14 : CMP.W FX_LavaAcidYPosition : BPL .fullySubmerged
    LDA.W AtmosphericGraphicsAnimFramesGraphicsTypes : BIT.W #$0400 : BNE .fullySubmerged
    LDA.W #$0400 : STA.W AtmosphericGraphicsAnimFramesGraphicsTypes : STA.W AtmosphericGraphicsAnimFramesGraphicsTypes+2
    STA.W AtmosphericGraphicsAnimFramesGraphicsTypes+4 : STA.W AtmosphericGraphicsAnimFramesGraphicsTypes+6
    LDA.W #$0003 : STA.W AtmosphericGraphicsAnimationTimers : STA.W AtmosphericGraphicsAnimationTimers+6
    LDA.W #$8002 : STA.W AtmosphericGraphicsAnimationTimers+2 : STA.W AtmosphericGraphicsAnimationTimers+4
    LDA.W FX_LavaAcidYPosition : STA.W AtmosphericGraphicsYPositions : STA.W AtmosphericGraphicsYPositions+2
    STA.W AtmosphericGraphicsYPositions+4 : STA.W AtmosphericGraphicsYPositions+6
    LDA.W SamusXPosition : CLC : ADC.W #$0006 : STA.W AtmosphericGraphicsXPositions
    SEC : SBC.W #$0006 : STA.W AtmosphericGraphicsXPositions+2
    SBC.W #$0000 : STA.W AtmosphericGraphicsXPositions+4
    SBC.W #$0006 : STA.W AtmosphericGraphicsXPositions+6
    LDA.W IGTFrames : BIT.W #$0001 : BNE .fullySubmerged
    LDA.W #$0010
    JSL QueueSound_Lib2_Max6

  .fullySubmerged:
    LDA.W Pose : CMP.W #$0000 : BEQ .zeroBuffer
    CMP.W #$009B : BEQ .zeroBuffer
    LDA.W EquippedItems : BIT.W #$0020 : BEQ .return

  .zeroBuffer:
    STZ.W SamusAnimationFrameBuffer

  .return:
    RTS


;;; $82DC: Handle Samus animation delay ;;;
Handle_Samus_AnimationDelay:
    PHP
    SEP #$20
    PHB
    LDA.B #AnimationDelayTable>>16 : STA.B DP_Temp02
    PHA : PLB
    REP #$30
    LDY.W SamusAnimationFrame
    LDA.W Pose : ASL : TAX
    LDA.L AnimationDelayTable,X : STA.B DP_Temp00
    LDA.B [DP_Temp00],Y : AND.W #$00FF : BIT.W #$0080 : BNE +
    JSR Handle_NormalAnimationDelay
    BRA .return

+   JSR Handle_SpeedBooster_AnimationDelay
    TAX : BEQ .return
    AND.W #$000F : ASL : TAX
    JSR.W (.pointers,X)
    BCC .return
    LDA.B [DP_Temp00],Y : AND.W #$00FF : CLC : ADC.W SamusAnimationFrameBuffer : STA.W SamusAnimationFrameTimer

  .return:
    PLB : PLP
    RTS

  .pointers:
    dw CLCRTS_908344
    dw CLCRTS_908344
    dw CLCRTS_908344
    dw CLCRTS_908344
    dw CLCRTS_908344
    dw CLCRTS_908344
    dw AnimDelay_6_GotoBeginningIfSamusNotLowEnergy
    dw AnimDelay_7_SetDrainedSamusMovementHandler
    dw AnimDelay_8_EnableAutoJumpHack_TransitionToPoseIfNotJumping
    dw AnimDelay_9_TransitionToPoseDependingOnItemEquippedAndYSpeed
    dw UNUSED_AnimDelay_A_TransitionToPoseDependingOnYSpeed_9083F6
    dw AnimDelay_B_SelectAnimDelaySequenceForWallJump
    dw UNUSED_AnimDelay_C_TransToPoseDependingOnItemEquipped_90848B
    dw AnimDelay_D_TransitionToPose
    dw AnimDelay_E_GotoY
    dw AnimDelay_F_GotoBeginning


;;; $8344: Clear carry. Animation delay instruction 0..5 ;;;
CLCRTS_908344:
;; Returns:
;;     Carry: Clear. Samus animation frame is unchanged
    CLC
    RTS


;;; $8346: Animation delay instruction 6 - go to beginning if [Samus health] >= 30 ;;;
AnimDelay_6_GotoBeginningIfSamusNotLowEnergy:
;; Returns:
;;     Carry: Set. Samus animation frame is changed
;;     Y: New Samus animation frame

; Used by:
;     1: Facing right - normal
;     2: Facing left  - normal
;     27h: Facing right - crouching
;     28h: Facing left  - crouching
    LDA.W Energy : CMP.W #$001E : BMI .lowEnergy
    LDY.W #$0000 : STY.W SamusAnimationFrame
    SEC
    RTS

  .lowEnergy:
    LDA.W SamusAnimationFrame : INC : STA.W SamusAnimationFrame
    TAY
    SEC
    RTS


;;; $8360: Animation delay instruction 7 - set drained Samus movement handler ;;;
AnimDelay_7_SetDrainedSamusMovementHandler:
;; Returns:
;;     Carry: Set. Samus animation frame is changed
;;     Y: New Samus animation frame

; Used by:
;     E8h: Facing right - Samus drained - crouching
;     E9h: Facing left  - Samus drained - crouching
    LDA.W #SamusMovementHandler_SamusDrained_Falling : STA.W MovementHandler
    LDA.W SamusAnimationFrame : INC : STA.W SamusAnimationFrame
    TAY
    SEC
    RTS


;;; $8370: Animation delay instruction 8 - enable auto-jump hack and transition to pose if not jumping ;;;
AnimDelay_8_EnableAutoJumpHack_TransitionToPoseIfNotJumping:
;; Returns:
;;     Carry: Clear. Samus animation frame is unchanged

; Used by:
;     25h/26h / 2Fh/30h / 43h/44h / 87h/88h / 8Bh..9Ah / 9Ch..A3h: Turning -> 2/1 / 52h/51h / 28h/27h / 2Ah/29h / 4/3/8/7/16h/15h/18h/17h/2Ch/2Bh/2Eh/2Dh/86h/85h/74h/73h/6/5/6Ah/69h/6Eh/6Dh/72h/71h
;         1: Facing right - normal
;         2: Facing left  - normal
;         3: Facing right - aiming up
;         4: Facing left  - aiming up
;         5: Facing right - aiming up-right
;         6: Facing left  - aiming up-left
;         7: Facing right - aiming down-right
;         8: Facing left  - aiming down-left
;         15h: Facing right - normal jump - aiming up
;         16h: Facing left  - normal jump - aiming up
;         17h: Facing right - normal jump - aiming down
;         18h: Facing left  - normal jump - aiming down
;         27h: Facing right - crouching
;         28h: Facing left  - crouching
;         29h: Facing right - falling
;         2Ah: Facing left  - falling
;         2Bh: Facing right - falling - aiming up
;         2Ch: Facing left  - falling - aiming up
;         2Dh: Facing right - falling - aiming down
;         2Eh: Facing left  - falling - aiming down
;         51h: Facing right - normal jump - not aiming - moving forward
;         52h: Facing left  - normal jump - not aiming - moving forward
;         69h: Facing right - normal jump - aiming up-right
;         6Ah: Facing left  - normal jump - aiming up-left
;         6Dh: Facing right - falling - aiming up-right
;         6Eh: Facing left  - falling - aiming up-left
;         71h: Facing right - crouching - aiming up-right
;         72h: Facing left  - crouching - aiming up-left
;         73h: Facing right - crouching - aiming down-right
;         74h: Facing left  - crouching - aiming down-left
;         85h: Facing right - crouching - aiming up
;         86h: Facing left  - crouching - aiming up
;     A4h..A7h / E0h..E7h: Landing from jump -> 1/2/1/2 / 3..8/1/2
;     BFh..C4h: Moonwalking - turn/jump -> 1Ah/19h/1Ah/19h/1Ah/19h
;         19h: Facing right - spin jump
;         1Ah: Facing left  - spin jump
    LDA.W PoseInputHandler : CMP.W #SamusPoseInputHandler_Demo : BEQ .goto_TransitionToPose
    LDA.W ProspectivePose : CMP.W #$004B : BEQ .return
    CMP.W #$004C : BEQ .return
    CMP.W #$0019 : BEQ .return
    CMP.W #$001A : BEQ .return
    LDA.W #SamusPoseInputHandler_AutoJumpHack : STA.W PoseInputHandler

  .goto_TransitionToPose:
    JMP AnimDelay_D_TransitionToPose

  .return:
    CLC
    RTS


;;; $839A: Animation delay instruction 9 - transition to pose depending on item equipped and Y speed ;;;
AnimDelay_9_TransitionToPoseDependingOnItemEquippedAndYSpeed:
;; Returns:
;;     Carry: Clear. Samus animation frame is unchanged

; Used by:
;     37h: Facing right - morphing transition. F9,0002,1D,31,79,7D
;         1Dh: Facing right - morph ball - no springball - on ground
;         31h: Facing right - morph ball - no springball - in air
;         79h: Facing right - morph ball - spring ball - on ground
;         7Dh: Facing right - morph ball - spring ball - falling
;     38h: Facing left  - morphing transition. F9,0002,41,32,7A,7E
;         41h: Facing left - morph ball - no springball - on ground
;         32h: Facing left - morph ball - no springball - in air
;         7Ah: Facing left - morph ball - spring ball - on ground
;         7Eh: Facing left - morph ball - spring ball - falling
;     DBh: Unused. F9,0002,1D,31,79,7D
;     DCh: Unused. F9,0002,DF,DF,DF,DF (unused, related to Draygon?)
    INY
    LDA.B [DP_Temp00],Y : STA.B DP_Temp12
    LDA.W EquippedItems : BIT.B DP_Temp12 : BNE .equippedItems
    LDA.W SamusYSpeed : BNE +
    LDA.W SamusYSubSpeed : BNE +
    INY #2
    LDA.B [DP_Temp00],Y : AND.W #$00FF : STA.W SuperSpecialProspectivePose
    BRA .return

+   INY #3
    LDA.B [DP_Temp00],Y : AND.W #$00FF : STA.W SuperSpecialProspectivePose
    BRA .return

  .equippedItems:
    LDA.W SamusYSpeed : BNE +
    LDA.W SamusYSubSpeed : BNE +
    INY #4
    LDA.B [DP_Temp00],Y : AND.W #$00FF : STA.W SuperSpecialProspectivePose
    BRA .return

+   INY #5
    LDA.B [DP_Temp00],Y : AND.W #$00FF : STA.W SuperSpecialProspectivePose

  .return:
    LDA.W #$0003 : STA.W SuperSpecialProspectivePoseChangeCommand
    CLC
    RTS


;;; $83F6: Unused. Animation delay instruction Ah - transition to pose depending on Y speed ;;;
UNUSED_AnimDelay_A_TransitionToPoseDependingOnYSpeed_9083F6:
;; Returns:
;;     Carry: Clear. Samus animation frame is unchanged
    LDA.W SamusYSpeed : BNE .nonZeroYSpeed
    LDA.W SamusYSubSpeed : BNE .nonZeroYSpeed
    INY
    LDA.B [DP_Temp00],Y : AND.W #$00FF : STA.W SuperSpecialProspectivePose
    BRA +

  .nonZeroYSpeed:
    INY #2
    LDA.B [DP_Temp00],Y : AND.W #$00FF : STA.W SuperSpecialProspectivePose

+   LDA.W #$0003 : STA.W SuperSpecialProspectivePoseChangeCommand
    CLC
    RTS


;;; $841D: Animation delay instruction Bh - select animation delay sequence for wall-jump ;;;
AnimDelay_B_SelectAnimDelaySequenceForWallJump:
;; Returns:
;;     Carry: Set. Samus animation frame is changed
;;     Y: New Samus animation frame

; Used by:
;     83h: Facing right - wall jump
;     84h: Facing left  - wall jump
    LDA.W EquippedItems : BIT.W #$0020 : BNE .notSubmerged
    JSL Get_Samus_BottomTop_Boundary
    LDA.W FX_YPosition : BMI .lessThanZero
    CMP.B DP_Temp14 : BPL .notSubmerged
    LDA.W FX_LiquidOptions : BIT.W #$0004 : BNE .notSubmerged
    BRA .submerged

  .lessThanZero:
    LDA.W FX_LavaAcidYPosition : BMI .notSubmerged
    CMP.B DP_Temp14 : BMI .submerged

  .notSubmerged:
    LDA.W EquippedItems : BIT.W #$0008 : BNE .screwAttack
    BIT.W #$0200 : BNE .spaceJump

  .submerged:
    LDA.W #$0031
    JSL QueueSound_Lib1_Max6
    LDA.W SamusAnimationFrame : INC : STA.W SamusAnimationFrame
    TAY
    SEC
    RTS

  .spaceJump:
    LDA.W #$003E
    JSL QueueSound_Lib1_Max6
    LDA.W SamusAnimationFrame : CLC : ADC.W #$000B : STA.W SamusAnimationFrame
    TAY
    SEC
    RTS

  .screwAttack:
    LDA.W #$0033
    JSL QueueSound_Lib1_Max6
    LDA.W SamusAnimationFrame : CLC : ADC.W #$0015 : STA.W SamusAnimationFrame
    TAY
    SEC
    RTS


;;; $848B: Unused. Animation delay instruction Ch - transition to pose depending on item equipped ;;;
UNUSED_AnimDelay_C_TransToPoseDependingOnItemEquipped_90848B:
;; Returns:
;;     Carry: Clear. Samus animation frame is unchanged

; Used by:
;     3Fh: Unused. FC,0002,1D,79
;         1Dh: Facing right - morph ball - no springball - on ground
;         79h: Facing right - morph ball - spring ball - on ground
;     40h: Unused. FC,0002,41,7A
;         41h: Facing left - morph ball - no springball - on ground
;         7Ah: Facing left - morph ball - spring ball - on ground
    INY
    LDA.B [DP_Temp00],Y : STA.B DP_Temp12
    LDA.W EquippedItems : BIT.B DP_Temp12 : BNE .equippedItems
    INY #2
    LDA.B [DP_Temp00],Y : AND.W #$00FF : STA.W SuperSpecialProspectivePose
    BRA .return

  .equippedItems:
    INY #3
    LDA.B [DP_Temp00],Y : AND.W #$00FF : STA.W SuperSpecialProspectivePose

  .return:
    LDA.W #$0003 : STA.W SuperSpecialProspectivePoseChangeCommand
    CLC
    RTS


;;; $84B6: Animation delay instruction Dh - transition to pose ;;;
AnimDelay_D_TransitionToPose:
;; Returns:
;;     Carry: Clear. Samus animation frame is unchanged

; Also see instruction 8, which calls this instruction.

; Used by:
;     35h/36h / F1h..F6h: Crouching transition -> 27h/28h / 85h/86h/71h..74h
;         27h: Facing right - crouching
;         28h: Facing left  - crouching
;         85h: Facing right - crouching - aiming up
;         86h: Facing left  - crouching - aiming up
;         71h: Facing right - crouching - aiming up-right
;         72h: Facing left  - crouching - aiming up-left
;         73h: Facing right - crouching - aiming down-right
;         74h: Facing left  - crouching - aiming down-left

;     3Bh/3Ch / F7h..FCh: Standing transition -> 1/2 / 3..8
;         1: Facing right - normal
;         2: Facing left  - normal
;         3: Facing right - aiming up
;         4: Facing left  - aiming up
;         5: Facing right - aiming up-right
;         6: Facing left  - aiming up-left
;         7: Facing right - aiming down-right
;         8: Facing left  - aiming down-left

;     3Dh/3Eh: Unmorphing transition -> 27h/28h

;     4Bh/4Ch / 55h..5Ah: Normal jump transition -> 4Dh/4Eh / 15h/16h/69h..6Ch
;         4Dh: Facing right - normal jump - not aiming - not moving - gun not extended
;         4Eh: Facing left  - normal jump - not aiming - not moving - gun not extended
;         15h: Facing right - normal jump - aiming up
;         16h: Facing left  - normal jump - aiming up
;         69h: Facing right - normal jump - aiming up-right
;         6Ah: Facing left  - normal jump - aiming up-left
;         6Bh: Facing right - normal jump - aiming down-right
;         6Ch: Facing left  - normal jump - aiming down-left

;     D3h/D4h: Crystal flash -> 1/2

;     E8h..EBh: Samus drained -> 1/2/1/2

;     39h/3Ah / C6h / DDh/DEh: Unused -> 20h/42h / BAh / 1/BAh
;         20h: Unused
;         42h: Unused
;         BAh: Facing left  - grabbed by Draygon - not moving - not aiming
    INY
    LDA.B [DP_Temp00],Y : AND.W #$00FF : STA.W SuperSpecialProspectivePose
    LDA.W #$0003 : STA.W SuperSpecialProspectivePoseChangeCommand
    CLC
    RTS


;;; $84C7: Animation delay instruction Eh - go to [Y] - [[$00] + [Y] + 1] ;;;
AnimDelay_E_GotoY:
;; Returns:
;;     Carry: Set. Samus animation frame is changed
;;     Y: New Samus animation frame
    INY
    LDA.B [DP_Temp00],Y : AND.W #$00FF : STA.B DP_Temp12
    LDA.W SamusAnimationFrame : SEC : SBC.B DP_Temp12 : STA.W SamusAnimationFrame
    TAY
    SEC
    RTS


;;; $84DB: Animation delay instruction Fh - go to beginning ;;;
AnimDelay_F_GotoBeginning:
;; Returns:
;;     Carry: Set. Samus animation frame is changed
;;     Y: New Samus animation frame
    LDY.W #$0000 : STY.W SamusAnimationFrame
    SEC
    RTS


;;; $84E3: Handle normal animation delay ;;;
Handle_NormalAnimationDelay:
;; Parameters:
;;     Y: Samus animation frame
;;     $00: Samus animation delay data pointer

; If Samus has running momentum and running:
;     If speed booster equipped:
;         Load animation delay data pointer from $91:B5DE table
;     Else:
;         Load animation delay data pointer from $91:B5D1
; Set animation frame timer
    PHP
    SEP #$20
    PHB
    LDA.B #AnimationDelayTable_Running_SpeedBooster_pointers>>16 : STA.B DP_Temp02 : PHA : PLB
    REP #$30
    LDA.W SamusRunningMomentumFlag : BEQ .return
    LDA.W MovementType : AND.W #$00FF : CMP.W #$0001 : BNE .return
    LDA.W EquippedItems : BIT.W #$2000 : BEQ .noSpeedBooster
    LDA.W SamusBoostCounter : AND.W #$00FF : ASL : TAX
    LDA.L AnimationDelayTable_Running_SpeedBooster_pointers,X : STA.B DP_Temp00
    BRA .return

  .noSpeedBooster:
    LDA.L AnimationDelayTable_Running_NoSpeedBooster_pointer : STA.B DP_Temp00

  .return:
    LDA.B [DP_Temp00],Y : AND.W #$00FF : CLC : ADC.W SamusAnimationFrameBuffer : STA.W SamusAnimationFrameTimer
    PLB : PLP
    RTS


;;; $852C: Handle speed booster animation delay ;;;
Handle_SpeedBooster_AnimationDelay:
;; Parameters:
;;     Y: Samus animation frame
;;     $00: Samus animation delay data pointer
;; Returns:
;;     A: 0 if Samus animation frame timer is set by this routine, otherwise animation delay
;;     $00: Samus animation delay data pointer

; Called when an instruction is encountered in the Samus animation delay table
; If speed booster handling is applicable, the instruction is ignored and Samus animation frame reset to 0

; If Samus has no running momentum or not running or not pressing run:
;     A = [[$00] + [Samus animation frame]]
; Else if speed booster not equipped:
;     Samus animation frame = 0
;     Load animation delay data pointer from $91:B5D1
;     A = 0
;     Set animation frame timer
; Else:
;     Decrement speed boost timer
;     If [speed boost timer] != 0:
;         A = [[$00] + [Samus animation frame]]
;     Else:
;         If [speed boost counter] != 4:
;             Increment speed boost counter
;             If [speed boost counter] = 4:
;                 Play speed echo sound effect
;                 BUG: This clobbers A. If the sound queue is not full, A high is the number of sounds queued,
;                      which can be greater than the $91:B61F table size 4,
;                      which causes the blue suit fail when speed boosting sometimes (mostly in heated rooms)
;                      If the speed boost timer ends up being set to 0, it lasts 100h frames, which causes the apparent sliding-on-one-leg pose
;         Load speed boost timer from $91:B61F table
;         Samus animation frame = 0
;         Load animation delay data pointer from $91:B5DE
;         A = 0
;         Set animation frame timer
    PHP
    SEP #$20
    PHB
    LDA.B #AnimationDelayTable_Running_NoSpeedBooster_pointer>>16 : STA.B DP_Temp02 : PHA : PLB
    REP #$30
    LDA.W SamusRunningMomentumFlag : BNE .checkPressingRun
    JMP .finish

  .checkPressingRun:
    LDA.B DP_Controller1Input : BIT.W DashBinding : BNE .checkMovementType
    JMP .finish

  .checkMovementType:
    LDA.W MovementType : AND.W #$00FF : CMP.W #$0001 : BEQ .speedBoosterEquipped
    JMP .finish

  .speedBoosterEquipped:
    LDA.W EquippedItems : BIT.W #$2000 : BNE .speedBoostTimer
    LDY.W #$0000 : STY.W SamusAnimationFrame
    LDA.L AnimationDelayTable_Running_NoSpeedBooster_pointer : STA.B DP_Temp00
    LDA.B [DP_Temp00],Y : AND.W #$00FF : CLC : ADC.W SamusAnimationFrameBuffer : STA.W SamusAnimationFrameTimer
    LDA.W #$0000
    BRA .return

  .speedBoostTimer:
    LDA.W SamusBoostTimer : DEC : STA.W SamusBoostTimer
    BIT.W #$00FF : BNE .finish
    LDA.W SamusBoostTimer : BIT.W #$0400 : BNE +
    CLC : ADC.W #$0100 : STA.W SamusBoostTimer
    BIT.W #$0400 : BEQ +
    LDA.W #$0001 : STA.W SamusEchoesSFXFlag
    LDA.W #$0003
    JSL QueueSound_Lib3_Max6

+   XBA : AND.W #$00FF : ASL : TAX
    LDA.W SamusBoostTimer : AND.W #$FF00 : ORA.L SpeedBoostTimerResetValues,X : STA.W SamusBoostTimer
    LDY.W #$0000 : STY.W SamusAnimationFrame
    LDA.L AnimationDelayTable_Running_SpeedBooster_pointers,X : STA.B DP_Temp00
    LDA.B [DP_Temp00],Y : AND.W #$00FF : CLC : ADC.W SamusAnimationFrameBuffer : STA.W SamusAnimationFrameTimer
    LDA.W #$0000
    BRA .return

  .finish:
    LDA.B [DP_Temp00],Y : AND.W #$00FF

  .return:
    PLB : PLP
    RTS


;;; $85E2: Draw Samus (not including arm cannon nor speed echoes) ;;;
Draw_Samus:
; Does not draw non-closed arm cannon, speed echoes, nor charge / grapple flare
    PHP : PHB
    SEP #$20
    LDA.B #SamusSpritemapTableIndices_TopHalf>>16 : PHA : PLB
    REP #$30
    LDA.W SamusKnockbackTimer : BNE +
    LDA.W SamusInvincibilityTimer : BEQ +
    LDA.W SpecialPaletteTimer : BNE +
    LDA.W NMI_FrameCounter : BIT.W #$0001 : BEQ +
    JMP .invisible

+   LDA.W Pose : ASL : TAX
    PHX
    LDA.L SamusSpritemapTableIndices_TopHalf,X : CLC : ADC.W SamusAnimationFrame : STA.W SpeedEcho_SamusTopHalfSpritemapIndex
    PHA
    JSR Calculate_SamusSpritemapPosition
    PLA
    JSL AddSamusSpritemapToOAM
    PLX : STX.B DP_Temp24
    LDA.W MovementType : AND.W #$00FF : ASL : TAX
    JSR.W (Draw_Samus_pointers,X)
    BCC .invisible
    LDX.B DP_Temp24
    LDA.L SamusSpritemapTableIndices_BottomHalf,X : CLC : ADC.W SamusAnimationFrame : STA.W SpeedEcho_SamusBottomHalfSpritemapIndex
    LDX.W SamusSpritemapXPosition
    LDY.W SamusSpritemapYPosition
    JSL AddSamusSpritemapToOAM

  .invisible:
    JSL Set_SamusTilesDefinitions_ForCurrentAnimation
    PLB : PLP
    RTS


;;; $864E: Function pointer table - check if Samus bottom half drawn ;;;
Draw_Samus_pointers:
    dw DetermineIf_SamusBottomHalf_IsDrawn_Standing                      ; *0: Standing
    dw Flag_SamusBottomHalfIsDrawn                                       ;  1: Running
    dw Flag_SamusBottomHalfIsDrawn                                       ;  2: Normal jumping
    dw DetermineIf_SamusBottomHalf_IsDrawn_SpinJumping                   ; *3: Spin jumping
    dw Flag_SamusBottomHalfIsNotDrawn                                    ;  4: Morph ball - on ground
    dw Flag_SamusBottomHalfIsDrawn                                       ;  5: Crouching
    dw Flag_SamusBottomHalfIsDrawn                                       ;  6: Falling
    dw Flag_SamusBottomHalfIsNotDrawn                                    ;  7: Unused
    dw Flag_SamusBottomHalfIsNotDrawn                                    ;  8: Morph ball - falling
    dw Flag_SamusBottomHalfIsNotDrawn                                    ;  9: Unused
    dw DetermineIf_SamusBottomHalf_IsDrawn_Knockback_CFEnding            ; *Ah: Knockback
    dw Flag_SamusBottomHalfIsDrawn                                       ;  Bh: Unused
    dw Flag_SamusBottomHalfIsDrawn                                       ;  Ch: Unused
    dw DetermineIf_SamusBottomHalf_IsDrawn_UnusedMovementTypeD           ; *Dh: Unused
    dw Flag_SamusBottomHalfIsDrawn                                       ;  Eh: Turning around - on ground
    dw DetermineIf_SamusBottomHalf_IsDrawn_TransitionPoses               ; *Fh: Crouching/standing/morphing/unmorphing transition
    dw Flag_SamusBottomHalfIsDrawn                                       ;  10h: Moonwalking
    dw Flag_SamusBottomHalfIsNotDrawn                                    ;  11h: Spring ball - on ground
    dw Flag_SamusBottomHalfIsNotDrawn                                    ;  12h: Spring ball - in air
    dw Flag_SamusBottomHalfIsNotDrawn                                    ;  13h: Spring ball - falling
    dw DetermineIf_SamusBottomHalf_IsDrawn_WallJumping                   ; *14h: Wall jumping
    dw Flag_SamusBottomHalfIsDrawn                                       ;  15h: Ran into a wall
    dw Flag_SamusBottomHalfIsDrawn                                       ;  16h: Grappling
    dw Flag_SamusBottomHalfIsDrawn                                       ;  17h: Turning around - jumping
    dw Flag_SamusBottomHalfIsDrawn                                       ;  18h: Turning around - falling
    dw DetermineIf_SamusBottomHalf_IsDrawn_DamageBoost                   ; *19h: Damage boost
    dw Flag_SamusBottomHalfIsDrawn                                       ;  1Ah: Grabbed by Draygon
    dw DetermineIf_SamusBottomHalf_IsDrawn_Shinespark_CF_Drained         ; *1Bh: Shinespark / crystal flash / drained by metroid / damaged by MB's attacks


;;; $8686: Flag that Samus bottom half is drawn ;;;
Flag_SamusBottomHalfIsDrawn:
;; Returns:
;;     Carry: Set. Bottom spritemap is drawn

; 1: Running
; 2: Normal jumping
; 5: Crouching
; 6: Falling
; Bh: Unused
; Ch: Unused
; Eh: Turning around - on ground
; 10h: Moonwalking
; 15h: Ran into a wall
; 16h: Grappling
; 17h: Turning around - jumping
; 18h: Turning around - falling
; 1Ah: Grabbed by Draygon
    SEC
    RTS


;;; $8688: Flag that Samus bottom half is not drawn ;;;
Flag_SamusBottomHalfIsNotDrawn:
;; Returns:
;;     Carry: Clear. Bottom spritemap is not drawn

; 4: Morph ball - on ground
; 7: Unused
; 8: Morph ball - falling
; 9: Unused
; 11h: Spring ball - on ground
; 12h: Spring ball - in air
; 13h: Spring ball - falling
    STZ.W SpeedEcho_SamusBottomHalfSpritemapIndex
    CLC
    RTS


;;; $868D: Determine if Samus bottom half is drawn - standing ;;;
DetermineIf_SamusBottomHalf_IsDrawn_Standing:
;; Returns:
;;     Carry: Set. Bottom spritemap is drawn

; If Samus is facing forward without varia/suit, spawns an extra sprite to cover the left part of her chest
    LDA.W Pose : CMP.W #$0000 : BEQ .facingForward

  .return:
    SEC
    RTS

  .facingForward:
    LDX.W OAMStack
    LDA.W SamusXPosition : SEC : SBC.W #$0007
    SEC : SBC.W Layer1XPosition : STA.W OAMLow,X
    LDA.W SamusYPosition : SEC : SBC.W #$0011
    SEC : SBC.W Layer1YPosition : STA.W OAMLow+1,X
    LDA.W #$3821 : STA.W OAMLow+2,X
    TXA : CLC : ADC.W #$0004 : STA.W OAMStack
    BRA .return


;;; $86C6: Determine if Samus bottom half is drawn - spin jumping ;;;
DetermineIf_SamusBottomHalf_IsDrawn_SpinJumping:
;; Returns:
;;     Carry: Set if bottom spritemap is drawn, clear otherwise

; Samus animation frame is 0 during the spin jump start-up
; Samus animation frame is >= Bh during the wall jump eligible animation
    LDA.W Pose : CMP.W #$0081 : BEQ .returnCarrySet
    CMP.W #$0082 : BEQ .returnCarrySet
    CMP.W #$001B : BEQ .returnCarrySet
    CMP.W #$001C : BEQ .returnCarrySet
    LDA.W SamusAnimationFrame : BNE .spinning

  .returnCarrySet:
    SEC
    RTS

  .spinning:
    CMP.W #$000B : BPL .returnCarrySet
    STZ.W SpeedEcho_SamusBottomHalfSpritemapIndex
    CLC
    RTS


;;; $86EE: Determine if Samus bottom half is drawn - knockback / crystal flash ending ;;;
DetermineIf_SamusBottomHalf_IsDrawn_Knockback_CFEnding:
;; Returns:
;;     Carry: Set if bottom spritemap is drawn, clear otherwise
    LDA.W Pose : CMP.W #$00D7 : BEQ .crystalFlashEnding
    CMP.W #$00D8 : BEQ .crystalFlashEnding
    BRA .returnCarrySet

  .crystalFlashEnding:
    LDA.W SamusAnimationFrame : CMP.W #$0003 : BMI .noBottom

  .returnCarrySet:
    SEC
    RTS

  .noBottom:
    STZ.W SpeedEcho_SamusBottomHalfSpritemapIndex
    CLC
    RTS


;;; $870C: Determine if Samus bottom half is drawn - crouching/standing/morphing/unmorphing transition ;;;
DetermineIf_SamusBottomHalf_IsDrawn_TransitionPoses:
;; Returns:
;;     Carry: Set if bottom spritemap is drawn, clear otherwise

; .noBottom is used for poses 37h..3Ah / 3Dh..40h (morphing/unmorphing transition and some unused poses)
; .unused is used for poses DBh..DEh (unused)
    LDA.W Pose : CMP.W #$00F1 : BPL .returnCarrySet
    CMP.W #$00DB : BPL .unused
    CMP.W #$0035 : BEQ .returnCarrySet
    CMP.W #$0036 : BEQ .returnCarrySet
    CMP.W #$003B : BEQ .returnCarrySet
    CMP.W #$003C : BEQ .returnCarrySet
    BRA .noBottom

  .returnCarrySet:
    SEC
    RTS

  .noBottom:
    STZ.W SpeedEcho_SamusBottomHalfSpritemapIndex
    CLC
    RTS

  .unused:
    CMP.W #$00DD : BPL .greaterThanDD
    LDA.W SamusAnimationFrame : BEQ .returnCarrySet
    BRA .noBottom

  .greaterThanDD:
    LDA.W SamusAnimationFrame : CMP.W #$0002 : BEQ .returnCarrySet
    BRA .noBottom


;;; $874C: Determine if Samus bottom half is drawn - unused movement type Dh ;;;
DetermineIf_SamusBottomHalf_IsDrawn_UnusedMovementTypeD:
;; Returns:
;;     Carry: Set if bottom spritemap is drawn, clear otherwise
    LDA.W Pose : CMP.W #$0065 : BEQ +
    CMP.W #$0066 : BNE .returnCarrySet

+   LDA.W SamusAnimationFrame : CMP.W #$0001 : BPL .noBottom

  .returnCarrySet:
    SEC
    RTS

  .noBottom:
    STZ.W SpeedEcho_SamusBottomHalfSpritemapIndex
    CLC
    RTS


;;; $8768: Determine if Samus bottom half is drawn - wall jumping ;;;
DetermineIf_SamusBottomHalf_IsDrawn_WallJumping:
;; Returns:
;;     Carry: Set if bottom spritemap is drawn, clear otherwise
    LDA.W SamusAnimationFrame : CMP.W #$0003 : BPL .spinning

  .returnCarrySet:
    SEC
    RTS

  .spinning:
    CMP.W #$000D : BPL .returnCarrySet
    STZ.W SpeedEcho_SamusBottomHalfSpritemapIndex
    CLC
    RTS


;;; $877C: Determine if Samus bottom half is drawn - damage boost ;;;
DetermineIf_SamusBottomHalf_IsDrawn_DamageBoost:
;; Returns:
;;     Carry: Set if bottom spritemap is drawn, clear otherwise
    LDA.W SamusAnimationFrame : CMP.W #$0002 : BPL .spinning

  .returnCarrySet:
    SEC
    RTS

  .spinning:
    CMP.W #$0009 : BPL .returnCarrySet
    STZ.W SpeedEcho_SamusBottomHalfSpritemapIndex
    CLC
    RTS


;;; $8790: Determine if Samus bottom half is drawn - shinespark / crystal flash / drained by metroid / damaged by MB's attacks ;;;
DetermineIf_SamusBottomHalf_IsDrawn_Shinespark_CF_Drained:
;; Returns:
;;     Carry: Set if bottom spritemap is drawn, clear otherwise
    LDA.W Pose : CMP.W #$00CF : BPL .notShinespark
    CMP.W #$00CB : BEQ .noBottom
    CMP.W #$00CC : BEQ .noBottom
    BRA .returnCarrySet

  .notShinespark:
    CMP.W #$00E8 : BEQ +
    CMP.W #$00E9 : BNE .returnCarrySet

+   LDA.W SamusAnimationFrame : CMP.W #$0002 : BMI .noBottom

  .returnCarrySet:
    SEC
    RTS

  .noBottom:
    STZ.W SpeedEcho_SamusBottomHalfSpritemapIndex
    CLC
    RTS


;;; $87BD: Draw Samus echoes ;;;
DrawSamusEchoes:
; Draws the echoes that trail behind Samus when she's running or shinesparking, but not during the shinespark crash
    PHP
    REP #$30
    LDA.W SpeedEcho_Index : BMI .mergingEchoes
    LDA.W SamusBoostTimer : AND.W #$FF00 : CMP.W #$0400 : BEQ +
    PLP
    RTS

+   LDA.W SpeedEcho_XPosition1 : BEQ +
    LDY.W #$0002
    JSR DrawSamusEcho

+   LDA.W SpeedEcho_XPosition0 : BEQ .returnUpper
    LDY.W #$0000
    JSR DrawSamusEcho

  .returnUpper:
    PLP
    RTS

  .mergingEchoes:
    LDY.W #$0002

  .loop:
    LDA.W SpeedEcho_XPosition0,Y : BEQ .next
    LDA.W SpeedEcho_YPosition0,Y : CMP.W SamusYPosition : BEQ .noYAdjustment
    BMI +
    SEC : SBC.W #$0002 : STA.W SpeedEcho_YPosition0,Y
    BRA .noYAdjustment

+   CLC : ADC.W #$0002 : STA.W SpeedEcho_YPosition0,Y

  .noYAdjustment:
    LDA.W SpeedEcho_XSpeed0,Y : BMI .positive
    LDA.W SpeedEcho_XPosition0,Y : CLC : ADC.W SpeedEcho_XSpeed0,Y : STA.W SpeedEcho_XPosition0,Y
    CMP.W SamusXPosition : BMI .drawEcho
    LDA.W #$0000 : STA.W SpeedEcho_XPosition0,Y
    BRA .next

  .positive:
    LDA.W SpeedEcho_XPosition0,Y : CLC : ADC.W SpeedEcho_XSpeed0,Y : STA.W SpeedEcho_XPosition0,Y
    CMP.W SamusXPosition : BPL .drawEcho
    LDA.W #$0000 : STA.W SpeedEcho_XPosition0,Y
    BRA .next

  .drawEcho:
    JSR DrawSamusEcho

  .next:
    DEY #2 : BPL .loop
    LDA.W SpeedEcho_XPosition1 : BNE .returnLower
    LDA.W SpeedEcho_XPosition0 : BNE .returnLower
    STZ.W SpeedEcho_Index

  .returnLower:
    PLP
    RTS


;;; $8855: Draw Samus echo ;;;
DrawSamusEcho:
;; Parameters:
;;     Y: Speed echo index
    PHY
    LDA.W Pose : ASL #3 : TAX
    LDA.L PoseDefinitions_YOffset,X : AND.W #$00FF : STA.B DP_Temp12
    LDA.W SpeedEcho_XPosition0,Y : SEC : SBC.W Layer1XPosition : TAX
    LDA.W SpeedEcho_YPosition0,Y : SEC : SBC.B DP_Temp12 : SBC.W Layer1YPosition : BMI +
    CMP.W #$00F8 : BMI .addSpritemap

+   PLY
    RTS

  .addSpritemap:
    TAY
    LDA.W SpeedEcho_SamusTopHalfSpritemapIndex
    JSL AddSamusSpritemapToOAM
    PLY
    LDA.W SpeedEcho_SamusBottomHalfSpritemapIndex : BEQ .return
    LDA.W Pose : ASL #3 : TAX
    LDA.L PoseDefinitions_YOffset,X : AND.W #$00FF : STA.B DP_Temp12
    PHY
    LDA.W SpeedEcho_XPosition0,Y : SEC : SBC.W Layer1XPosition : TAX
    LDA.W SpeedEcho_YPosition0,Y : SEC : SBC.B DP_Temp12 : SBC.W Layer1YPosition : TAY
    LDA.W SpeedEcho_SamusBottomHalfSpritemapIndex
    JSL AddSamusSpritemapToOAM
    PLY

  .return:
    RTS


;;; $88BA: Draw shinespark crash echo circle ;;;
DrawShinesparkCrashEchoCircle:
;; Parameters:
;;     X: Speed echo index

; Draws the echoes that circle around Samus on shinespark crash
    PHP : PHB
    SEP #$20
    LDA.B #SamusSpritemapTableIndices_TopHalf>>16 : PHA : PLB
    REP #$30
    TXY
    LDA.W NMI_FrameCounter : BIT.W #$0001 : BNE +
    JMP .return

+   LDA.W Pose : ASL : TAX
    PHX : PHY
    LDA.L SamusSpritemapTableIndices_TopHalf,X : CLC : ADC.W SamusAnimationFrame : PHA
    TXA : ASL #2 : TAX
    LDA.L PoseDefinitions_YOffset,X : AND.W #$00FF : STA.B DP_Temp12
    LDA.W SpeedEcho_XPosition0,Y : SEC : SBC.W Layer1XPosition : TAX
    LDA.W SpeedEcho_YPosition0,Y : SEC : SBC.B DP_Temp12 : SBC.W Layer1YPosition : BMI .pullReturn
    CMP.W #$00F8 : BMI +

  .pullReturn:
    PLA : PLY : PLX
    BRA .return

+   TAY
    PLA
    JSL AddSamusSpritemapToOAM
    PLY
    PLX : STX.B DP_Temp24
    LDA.W MovementType : AND.W #$00FF : ASL : TAX
    JSR.W (Draw_Samus_pointers,X)
    BCC .return
    LDX.B DP_Temp24
    LDA.L SamusSpritemapTableIndices_BottomHalf,X : CLC : ADC.W SamusAnimationFrame : PHA
    TXA : ASL #2 : TAX
    LDA.L PoseDefinitions_YOffset,X : AND.W #$00FF : STA.B DP_Temp12
    LDA.W SpeedEcho_XPosition0,Y : SEC : SBC.W Layer1XPosition : TAX
    LDA.W SpeedEcho_YPosition0,Y : SEC : SBC.B DP_Temp12 : SBC.W Layer1YPosition : TAY
    PLA
    JSL AddSamusSpritemapToOAM

  .return:
    PLB : PLP
    RTS


;;; $8953: Draw shinespark crash echo projectiles ;;;
DrawShinesparkCrashEchoProjectiles:
; Draws the echoes that fire away from Samus after shinespark crash
    PHP
    REP #$30
    LDA.W NMI_FrameCounter : BIT.W #$0001 : BEQ .return
    LDA.W SpeedEcho_DrawFlag3 : BEQ +
    LDY.W #$0006
    JSR DrawSamusEcho

+   LDA.W SpeedEcho_DrawFlag2 : BEQ .return
    LDY.W #$0004
    JSR DrawSamusEcho

  .return:
    PLP
    RTL


;;; $8976: Draw Samus starting death animation ;;;
Draw_Samus_Starting_Death_Animation:
    PHP : PHB
    PHK : PLB
    REP #$30
    LDA.W SamusAnimationFrameTimer : DEC : STA.W SamusAnimationFrameTimer : BEQ +
    BPL .drawDeath

+   LDA.W SamusAnimationFrame : INC : STA.W SamusAnimationFrame
    JSR Handle_Samus_AnimationDelay

  .drawDeath:
    JSL Draw_Samus_During_Death_Animation
    PLB : PLP
    RTL


;;; $8998: Draw Samus during death animation ;;;
Draw_Samus_During_Death_Animation:
; This is the same as Draw_Inanimate_Samus, except that layer 1 position is added to Samus spritemap position for some reason,
; to account for this, there's code at $9B:B409 that subtracts the layer 1 position from Samus position...
    PHP : PHB
    SEP #$20
    LDA.B #SamusSpritemapTableIndices_TopHalf>>16 : PHA : PLB
    REP #$30
    LDA.W Pose : ASL : TAX
    PHX
    LDA.L SamusSpritemapTableIndices_TopHalf,X : CLC : ADC.W SamusAnimationFrame : PHA
    JSR Calculate_SamusSpritemapPosition
    LDA.W SamusSpritemapXPosition : CLC : ADC.W Layer1XPosition : TAX
    LDA.W SamusSpritemapYPosition : CLC : ADC.W Layer1YPosition : TAY
    PLA
    JSL AddSamusSpritemapToOAM
    PLX : STX.B DP_Temp24
    LDA.W MovementType : AND.W #$00FF : ASL : TAX
    JSR.W (Draw_Samus_pointers,X)
    BCC .setDefinitions
    LDX.B DP_Temp24
    LDA.L SamusSpritemapTableIndices_BottomHalf,X : CLC : ADC.W SamusAnimationFrame : PHA
    LDA.W SamusSpritemapXPosition : CLC : ADC.W Layer1XPosition : TAX
    LDA.W SamusSpritemapYPosition : CLC : ADC.W Layer1YPosition : TAY
    PLA
    JSL AddSamusSpritemapToOAM

  .setDefinitions:
    JSL Set_SamusTilesDefinitions_ForCurrentAnimation
    PLB : PLP
    RTL


;;; $8A00: Draw inanimate Samus ;;;
Draw_Inanimate_Samus:
; Used to draw Samus during:
;     Door transition
;     Using elevator
;     Taken fatal damage
;     Game state 15h (death sequence, pre-flashing)

; Compared to Draw_Samus, this routine doesn't update SamusAnimationFrame/SpeedEcho_SamusBottomHalfSpritemapIndex for speed echo drawing,
; and doesn't have the checks for being invisible
    PHP : PHB
    SEP #$20
    LDA.B #SamusSpritemapTableIndices_TopHalf>>16 : PHA : PLB
    REP #$30
    LDA.W Pose : ASL : TAX
    PHX
    LDA.L SamusSpritemapTableIndices_TopHalf,X : CLC : ADC.W SamusAnimationFrame : PHA
    JSR Calculate_SamusSpritemapPosition
    PLA
    JSL AddSamusSpritemapToOAM
    PLX : STX.B DP_Temp24
    LDA.W MovementType : AND.W #$00FF : ASL : TAX
    JSR.W (Draw_Samus_pointers,X)
    BCC .setDefinitions
    LDX.B DP_Temp24
    LDA.L SamusSpritemapTableIndices_BottomHalf,X : CLC : ADC.W SamusAnimationFrame
    LDX.W SamusSpritemapXPosition
    LDY.W SamusSpritemapYPosition
    JSL AddSamusSpritemapToOAM

  .setDefinitions:
    JSL Set_SamusTilesDefinitions_ForCurrentAnimation
    PLB : PLP
    RTL


;;; $8A4C: Handle atmospheric effects ;;;
Handle_AtmosphericEffects:
; Water splash, air bubbles, footsteps
    PHP
    REP #$30
    LDY.W #$0006

  .loop:
    LDA.W AtmosphericGraphicsAnimFramesGraphicsTypes,Y : BEQ .next
    PHA
    AND.W #$00FF : ASL : STA.B DP_Temp12
    PLA : XBA : AND.W #$00FF : ASL : TAX
    LDA.W AtmosphericGraphicsAnimationTimers,Y : DEC : STA.W AtmosphericGraphicsAnimationTimers,Y : BEQ +
    BPL .execute
    CMP.W #$8000 : BNE .next
    PHX
    LDA.W AtmosphericGraphics_AnimationTimers,X : CLC : ADC.B DP_Temp12 : TAX
    LDA.W $0000,X : STA.W AtmosphericGraphicsAnimationTimers,Y
    PLX
    BRA .execute

+   PHX
    LDA.W AtmosphericGraphics_AnimationTimers,X : CLC : ADC.B DP_Temp12 : TAX
    LDA.W $0000,X : STA.W AtmosphericGraphicsAnimationTimers,Y
    PLX
    LDA.W AtmosphericGraphicsAnimFramesGraphicsTypes,Y : INC : STA.W AtmosphericGraphicsAnimFramesGraphicsTypes,Y
    AND.W #$00FF : CMP.W AtmosphericGraphics_NumberOfAnimationFrames,X : BMI .execute
    LDA.W #$0000 : STA.W AtmosphericGraphicsAnimFramesGraphicsTypes,Y
    BRA .next

  .execute:
    JSR.W (.pointers,X)

  .next:
    DEY #2 : BPL .loop
    PLP
    RTS

  .pointers:
    dw $0000
    dw AtmosphericEffects_1_2_FootstepSplashes
    dw AtmosphericEffects_1_2_FootstepSplashes
    dw AtmosphericEffects_3_DivingSplash
    dw AtmosphericEffects_4_LavaSurfaceDamage
    dw AtmosphericEffects_5_Bubbles
    dw AtmosphericEffects_6_7_Dust
    dw AtmosphericEffects_6_7_Dust


;;; $8AC5: Handle atmospheric effects - [atmospheric graphic type] = 1/2 (footstep splashes) ;;;
AtmosphericEffects_1_2_FootstepSplashes:
;; Parameters:
;;     X: Atmospheric graphic type
;;     Y: Atmospheric graphic index

; Called by the subroutines for other atmospheric graphic types too
    PHY
    LDA.W AtmosphericGraphicsAnimFramesGraphicsTypes,Y : AND.W #$00FF : ASL : STA.B DP_Temp12
    PHX
    LDX.W OAMStack
    LDA.W AtmosphericGraphicsXPositions,Y : SEC : SBC.W Layer1XPosition : SBC.W #$0004 : BMI .return
    CMP.W #$0100 : BPL .return
    STA.W OAMLow,X
    LDA.W AtmosphericGraphicsYPositions,Y : SEC : SBC.W Layer1YPosition : SBC.W #$0004 : BMI .return
    CMP.W #$0100 : BPL .return
    STA.W OAMLow+1,X
    PLY
    LDA.W AtmosphericGraphics_SpriteTileNumberAttributes,Y : CLC : ADC.B DP_Temp12 : TAY
    LDA.W $0000,Y : STA.W OAMLow+2,X
    TXA : CLC : ADC.W #$0004 : STA.W OAMStack
    PLY
    RTS

  .return:
    PLY : PLY
    RTS


;;; $8B16: Handle atmospheric effects - [atmospheric graphic type] = 3 (diving splash) ;;;
AtmosphericEffects_3_DivingSplash:
;; Parameters:
;;     Y: Atmospheric graphic index
    PHY
    LDA.W AtmosphericGraphicsAnimFramesGraphicsTypes,Y : AND.W #$00FF : STA.B DP_Temp12
    LDA.W FX_YPosition : STA.W AtmosphericGraphicsYPositions,Y
    LDA.W #$018F : CLC : ADC.B DP_Temp12 : PHA
    BRA AddAtmosphericSpritemapToOAM


;;; $8B2E: Handle atmospheric effects - [atmospheric graphic type] = 4 (lava surface damage) ;;;
AtmosphericEffects_4_LavaSurfaceDamage:
;; Parameters:
;;     X: Atmospheric graphic type
;;     Y: Atmospheric graphic index
    TYA : BIT.W #$0004 : BNE .greaterThanEqualTo4
    LDA.W AtmosphericGraphicsXPositions,Y : CLC : ADC.W #$0001 : STA.W AtmosphericGraphicsXPositions,Y
    BRA +

  .greaterThanEqualTo4:
    LDA.W AtmosphericGraphicsXPositions,Y : SEC : SBC.W #$0001 : STA.W AtmosphericGraphicsXPositions,Y

+   LDA.W AtmosphericGraphicsYPositions,Y : SEC : SBC.W #$0001 : STA.W AtmosphericGraphicsYPositions,Y
    JMP AtmosphericEffects_1_2_FootstepSplashes


;;; $8B57: Handle atmospheric effects - [atmospheric graphic type] = 6/7 (dust) ;;;
AtmosphericEffects_6_7_Dust:
;; Parameters:
;;     X: Atmospheric graphic type
;;     Y: Atmospheric graphic index
    LDA.W AtmosphericGraphicsYPositions,Y : SEC : SBC.W #$0001 : STA.W AtmosphericGraphicsYPositions,Y
    JMP AtmosphericEffects_1_2_FootstepSplashes


;;; $8B64: Handle atmospheric effects - [atmospheric graphic type] = 5 (bubbles) ;;;
AtmosphericEffects_5_Bubbles:
;; Parameters:
;;     X: Atmospheric graphic type
;;     Y: Atmospheric graphic index
    PHY
    LDA.W AtmosphericGraphicsAnimFramesGraphicsTypes,Y : AND.W #$00FF : STA.B DP_Temp12
    LDA.W #$0186 : CLC : ADC.B DP_Temp12 : PHA
; fallthrough to AddAtmosphericSpritemapToOAM


;;; $8B74: Add atmospheric spritemap to OAM ;;;
AddAtmosphericSpritemapToOAM:
;; Parameters:
;;     Y: Atmospheric graphic index
;;     [[S] + 1] + 1: Samus spritemap table index

; Expects a pushed Y (in addition to the pushed table index)
    LDA.W AtmosphericGraphicsXPositions,Y : SEC : SBC.W Layer1XPosition : TAX
    LDA.W AtmosphericGraphicsYPositions,Y : SEC : SBC.W Layer1YPosition : BIT.W #$FF00 : BNE .return
    TAY
    PLA
    JSL AddSamusSpritemapToOAM
    PLY
    RTS

  .return:
    PLA : PLY
    RTS


;;; $8B93: Atmospheric graphics animation timers ;;;
AtmosphericGraphics_AnimationTimers:
; Indexed by [atmospheric graphics type] * 2
    dw $0000
    dw AtmosphericGraphics_1_FootstepSplashes
    dw AtmosphericGraphics_2_FootstepSplashes
    dw AtmosphericGraphics_3_DivingSplash
    dw AtmosphericGraphics_4_LavaSurfaceDamage
    dw AtmosphericGraphics_5_Bubbles
    dw AtmosphericGraphics_6_Dust
    dw AtmosphericGraphics_7_Dust
    dw $0000

; Indexed by [atmospheric graphics animation frame] * 2
AtmosphericGraphics_1_FootstepSplashes:
    dw $0003,$0003,$0003,$0003

AtmosphericGraphics_2_FootstepSplashes:
    dw $0003,$0003,$0003,$0003

AtmosphericGraphics_3_DivingSplash:
    dw $0002,$0002,$0003,$0003,$0003,$0005,$0005,$0006
    dw $0007

AtmosphericGraphics_4_LavaSurfaceDamage:
    dw $0002,$0002,$0002,$0002

AtmosphericGraphics_5_Bubbles:
    dw $0005,$0005,$0005,$0005,$0005,$0005,$0005,$0005

AtmosphericGraphics_6_Dust:
    dw $0003,$0004,$0005,$0006

AtmosphericGraphics_7_Dust:
    dw $0003,$0004,$0005,$0006


;;; $8BEF: Number of atmospheric graphics animation frames ;;;
AtmosphericGraphics_NumberOfAnimationFrames:
; Indexed by [atmospheric graphics type] * 2
    dw $0000,$0004,$0004,$0009,$0004,$0008,$0004,$0004


;;; $8BFF: Atmospheric graphics sprite tile number and attributes ;;;
AtmosphericGraphics_SpriteTileNumberAttributes:
; Indexed by [atmospheric graphics type] * 2
    dw $0000
    dw AtmosphericGraphics_SpriteTileNumberAttributes_1_Footstep
    dw $0000
    dw $0000
    dw AtmosphericGraphics_SpriteTileNumberAttribute_4_6_7_LavaDust
    dw $0000
    dw AtmosphericGraphics_SpriteTileNumberAttribute_4_6_7_LavaDust
    dw AtmosphericGraphics_SpriteTileNumberAttribute_4_6_7_LavaDust

AtmosphericGraphics_SpriteTileNumberAttributes_1_Footstep:
; Indexed by [atmospheric graphics animation frame] * 2
    dw $2A2C,$2A2D,$2A2E,$2A2F

AtmosphericGraphics_SpriteTileNumberAttribute_4_6_7_LavaDust:
    dw $2A48,$2A49,$2A4A,$2A4B


;;; $8C1F: Calculate Samus spritemap position ;;;
Calculate_SamusSpritemapPosition:
;; Parameters:
;;     X: Samus pose * 2
;; Returns:
;;     X: Samus spritemap X position
;;     Y: Samus spritemap Y position
    LDA.W CeresStatus : BPL .notCeres
    LDA.W SamusXPosition : STA.W BackupSamusXPosition
    LDA.W SamusYPosition : STA.W BackupSamusYPosition
    PHX
    JSL Calculate_SamusPosition_InRotatingElevatorRoom
    PLX : TXY
    LDA.W MovementType : AND.W #$00FF : ASL : TAX
    JSR.W (.pointers,X)
    LDA.W BackupSamusYPosition : STA.W SamusYPosition
    LDA.W BackupSamusXPosition : STA.W SamusXPosition
    RTS

  .notCeres:
    TXY
    LDA.W MovementType : AND.W #$00FF : ASL : TAX
    JSR.W (.pointers,X)
    RTS

  .pointers:
    dw CalculateSamusSpritemapPosition_Standing                          ; *0: Standing
    dw CalculateUsualSamusSpritemapPosition                              ;  1: Running
    dw CalculateUsualSamusSpritemapPosition                              ;  2: Normal jumping
    dw CalculateUsualSamusSpritemapPosition                              ;  3: Spin jumping
    dw CalculateUsualSamusSpritemapPosition                              ;  4: Morph ball - on ground
    dw CalculateUsualSamusSpritemapPosition                              ;  5: Crouching
    dw CalculateUsualSamusSpritemapPosition                              ;  6: Falling
    dw CalculateUsualSamusSpritemapPosition                              ;  7: Unused
    dw CalculateUsualSamusSpritemapPosition                              ;  8: Morph ball - falling
    dw CalculateUsualSamusSpritemapPosition                              ;  9: Unused
    dw CalculateUsualSamusSpritemapPosition                              ;  Ah: Knockback
    dw CalculateUsualSamusSpritemapPosition                              ;  Bh: Unused
    dw CalculateUsualSamusSpritemapPosition                              ;  Ch: Unused
    dw CalculateUsualSamusSpritemapPosition                              ;  Dh: Unused
    dw CalculateUsualSamusSpritemapPosition                              ;  Eh: Turning around - on ground
    dw CalculateSamusSpritemapPosition_TransitionPoses                   ; *Fh: Crouching/standing/morphing/unmorphing transition
    dw CalculateUsualSamusSpritemapPosition                              ;  10h: Moonwalking
    dw CalculateUsualSamusSpritemapPosition                              ;  11h: Spring ball - on ground
    dw CalculateUsualSamusSpritemapPosition                              ;  12h: Spring ball - in air
    dw CalculateUsualSamusSpritemapPosition                              ;  13h: Spring ball - falling
    dw CalculateUsualSamusSpritemapPosition                              ;  14h: Wall jumping
    dw CalculateUsualSamusSpritemapPosition                              ;  15h: Ran into a wall
    dw CalculateUsualSamusSpritemapPosition                              ;  16h: Grappling
    dw CalculateUsualSamusSpritemapPosition                              ;  17h: Turning around - jumping
    dw CalculateUsualSamusSpritemapPosition                              ;  18h: Turning around - falling
    dw CalculateUsualSamusSpritemapPosition                              ;  19h: Damage boost
    dw CalculateUsualSamusSpritemapPosition                              ;  1Ah: Grabbed by Draygon
    dw CalculateSamusSpritemapPosition_Shinespark_CF_Drained             ; *1Bh: Shinespark / crystal flash / drained by metroid / damaged by MB's attacks


;;; $8C94: Calculate usual Samus spritemap position ;;;
CalculateUsualSamusSpritemapPosition:
;; Parameters:
;;     Y: Samus pose * 2
;; Returns:
;;     X: Samus spritemap X position
;;     Y: Samus spritemap Y position
    TYA : ASL #2 : TAX
    LDA.L PoseDefinitions_YOffset,X : AND.W #$00FF : BIT.W #$0080 : BEQ +
    ORA.W #$FF00

+   STA.B DP_Temp12
    LDA.W SamusYPosition : SEC : SBC.B DP_Temp12
    SEC : SBC.W Layer1YPosition : STA.W SamusSpritemapYPosition
    TAY
    LDA.W SamusXPosition : SEC : SBC.W Layer1XPosition : STA.W SamusSpritemapXPosition
    TAX
    RTS


;;; $8CC3: Calculate Samus spritemap position - standing ;;;
CalculateSamusSpritemapPosition_Standing:
;; Parameters:
;;     Y: Samus pose * 2
;; Returns:
;;     X: Samus spritemap X position
;;     Y: Samus spritemap Y position
    PHB
    PHK : PLB
    TYA : LSR : CMP.W #$0000 : BEQ .facingForward
    CMP.W #$009B : BEQ .facingForward
    CMP.W #$00A4 : BMI Goto_CalculateUsualSamusSpritemapPosition
    CMP.W #$00A8 : BPL Goto_CalculateUsualSamusSpritemapPosition
    SEC : SBC.W #$00A4 : ASL #2
    CLC : ADC.W SamusAnimationFrame : TAX
    LDA.W .data,X : STA.B DP_Temp12
    LDA.W SamusYPosition : SEC : SBC.B DP_Temp12
    SEC : SBC.W Layer1YPosition : STA.W SamusSpritemapYPosition
    TAY
    LDA.W SamusXPosition : SEC : SBC.W Layer1XPosition : STA.W SamusSpritemapXPosition
    TAX
    PLB
    RTS

  .facingForward:
    LDA.W SamusAnimationFrame : CMP.W #$0002 : BMI Goto_CalculateUsualSamusSpritemapPosition
    LDA.W SamusYPosition : DEC : SEC : SBC.W Layer1YPosition : STA.W SamusSpritemapYPosition
    TAY
    LDA.W SamusXPosition : SEC : SBC.W Layer1XPosition : STA.W SamusSpritemapXPosition
    TAX
    PLB
    RTS

  .data:
    db $03,$06,$00,$00 ; Facing right - landing from normal jump
    db $03,$06,$00,$00 ; Facing left-   landing from normal jump
    db $03,$03,$06,$00 ; Facing right - landing from spin jump
    db $03,$03,$06,$00 ; Facing left-   landing from spin jump


;;; $8D38: Go to calculate usual Samus spritemap position ;;;
Goto_CalculateUsualSamusSpritemapPosition:
;; Parameters:
;;     Y: Samus pose * 2
;; Returns:
;;     X: Samus spritemap X position
;;     Y: Samus spritemap Y position

; Expects pushed DB
    PLB
    JMP CalculateUsualSamusSpritemapPosition


;;; $8D3C: Calculate Samus spritemap position - crouching/standing/morphing/unmorphing transition ;;;
CalculateSamusSpritemapPosition_TransitionPoses:
;; Parameters:
;;     Y: Samus pose * 2
;; Returns:
;;     X: Samus spritemap X position
;;     Y: Samus spritemap Y position
    PHB
    PHK : PLB
    TYA : LSR : CMP.W #$0035 : BMI Goto_CalculateUsualSamusSpritemapPosition
    CMP.W #$0041 : BPL Goto_CalculateUsualSamusSpritemapPosition
    SEC : SBC.W #$0035
    ASL : CLC : ADC.W SamusAnimationFrame : TAX
    LDA.W .data,X : AND.W #$00FF : BIT.W #$0080 : BEQ +
    ORA.W #$FF00

+   STA.B DP_Temp12
    LDA.W SamusYPosition : CLC : ADC.B DP_Temp12
    SEC : SBC.W Layer1YPosition : STA.W SamusSpritemapYPosition
    TAY
    LDA.W SamusXPosition : SEC : SBC.W Layer1XPosition : STA.W SamusSpritemapXPosition
    TAX
    PLB
    RTS

  .data:
    db $F8,$00 ; Facing right - crouching transition
    db $F8,$00 ; Facing left-   crouching transition
    db $FC,$FE ; Facing right - morphing transition
    db $FC,$FE ; Facing left-   morphing transition
    db $00,$00 ; Unused
    db $00,$00 ; Unused
    db $FC,$00 ; Facing right - standing transition
    db $FC,$00 ; Facing left-   standing transition
    db $05,$04 ; Facing right - unmorphing transition
    db $05,$04 ; Facing left-   unmorphing transition
    db $00,$00 ; Unused
    db $00,$00 ; Unused


;;; $8D98: Calculate Samus spritemap position - shinespark / crystal flash / drained by metroid / damaged by MB's attacks ;;;
CalculateSamusSpritemapPosition_Shinespark_CF_Drained:
;; Parameters:
;;     Y: Samus pose * 2
;; Returns:
;;     X: Samus spritemap X position
;;     Y: Samus spritemap Y position
    PHB
    PHK : PLB
    TYA : LSR : CMP.W #$00E8 : BEQ .drainedNotStanding
    CMP.W #$00E9 : BEQ .drainedNotStanding
    CMP.W #$00EA : BEQ +
    CMP.W #$00EB : BNE .goto_CalculateUsualSamusSpritemapPosition

+   LDX.W SamusAnimationFrame : CPX.W #$0005 : BMI .goto_CalculateUsualSamusSpritemapPosition
    LDA.W #$FFFD
    BRA .merge

  .goto_CalculateUsualSamusSpritemapPosition:
    JMP Goto_CalculateUsualSamusSpritemapPosition

  .drainedNotStanding:
    LDX.W SamusAnimationFrame
    LDA.W .data,X : AND.W #$00FF : BIT.W #$0080 : BEQ .merge
    ORA.W #$FF00

  .merge:
    STA.B DP_Temp12
    LDA.W SamusYPosition : CLC : ADC.B DP_Temp12
    SEC : SBC.W Layer1YPosition : STA.W SamusSpritemapYPosition
    TAY
    LDA.W SamusXPosition : SEC : SBC.W Layer1XPosition : STA.W SamusSpritemapXPosition
    TAX
    PLB
    RTS

  .data:
; Samus drained - crouching
    db $07,$05,$F8,$F8,$F8,$F8,$F8,$FB,$04,$04,$04,$04,$00,$00,$04,$FD
    db $FB,$00,$00,$04,$FD,$FB,$FD,$04,$00,$00,$04,$00,$00,$04,$00,$00


;;; $8E0F: Set liquid physics type ;;;
SetLiquidPhysicsType:
    PHP : PHB
    PHK : PLB
    REP #$30
    JSL Get_Samus_BottomTop_Boundary
    LDA.W FX_Type : AND.W #$000F : TAX
    JSR.W (.pointers,X)
    PLB : PLP
    RTL

  .pointers:
    dw SetLiquidPhysicsType_Air                                          ; ; 0: None / 20h: Unused scrolling sky
    dw SetLiquidPhysicsType_LavaAcid                                     ; ; 2: Lava / 22h: Unused
    dw SetLiquidPhysicsType_LavaAcid                                     ; ; 4: Acid / 24h: Fireflea
    dw SetLiquidPhysicsType_Water                                        ; ; 6: Water / 26h: Tourian entrance statue
    dw SetLiquidPhysicsType_Air                                          ; ; 8: Spores / 28h: Ceres Ridley
    dw SetLiquidPhysicsType_Air                                          ; ; Ah: Rain / 2Ah: Ceres elevator
    dw SetLiquidPhysicsType_Air                                          ; ; Ch: Fog / 2Ch: Ceres haze
    dw SetLiquidPhysicsType_Air


;;; $8E36: Set liquid physics type - air ;;;
SetLiquidPhysicsType_Air:
    STZ.W LiquidPhysicsType
    RTS


;;; $8E3A: Set liquid physics type - lava/acid ;;;
SetLiquidPhysicsType_LavaAcid:
;; Parameters:
;;     $12: Samus bottom boundary
    LDA.W FX_LavaAcidYPosition : BMI SetLiquidPhysicsType_Air
    CMP.B DP_Temp12 : BPL SetLiquidPhysicsType_Air
    LDA.W #$0002 : STA.W LiquidPhysicsType
    RTS


;;; $8E4A: Set liquid physics type - water ;;;
SetLiquidPhysicsType_Water:
;; Parameters:
;;     $12: Samus bottom boundary
    LDA.W FX_YPosition : BMI SetLiquidPhysicsType_Air
    CMP.B DP_Temp12 : BMI +
    BRA SetLiquidPhysicsType_Air

+   LDA.W FX_LiquidOptions : BIT.W #$0004 : BNE SetLiquidPhysicsType_Air
    LDA.W #$0001 : STA.W LiquidPhysicsType
    RTS


;;; $8E64: Samus X movement ;;;
Samus_X_Movement:
; Called by:
;     $A3E5: Samus movement - running
;     $A521: Samus movement - morph ball - on ground
;     $A67C: Samus movement - turning around - on ground
;     $A694: Samus movement - moonwalking
;     $A69F: Samus movement - spring ball - on ground
;     $A790: Samus movement - turning around - jumping
;     $A7AD: Samus movement - turning around - falling
    PHP
    REP #$30
    JSR Handle_Samus_XExtraRunSpeed
    JSR Determine_SamusXSpeedTable_EntryPointer
    JSR CalculateSamusXBaseSpeed_DecelerationAllowed
    JSR MoveSamus_Horizontally
    PLP
    RTS


if !FEATURE_KEEP_UNREFERENCED
;;; $8E75: Unused ;;;
UNUSED_SamusMovement_908E75:
; Seems vaguely close to falling X movement, Samus_Morphed_Falling_Movementin particular
    PHP
    REP #$30
    JSR Determine_SamusXSpeedTable_EntryPointer
    JSR CalculateSamusXBaseSpeed_DecelerationDisallowed
    LDA.W SamusXAccelerationMode : BNE .decelerating
    LDA.B DP_Controller1Input : BIT.W #$0100 : BNE +
    BIT.W #$0200 : BNE +
    STZ.B DP_Temp12 : STZ.B DP_Temp14
    STZ.W SamusXBaseSpeed : STZ.W SamusXBaseSubSpeed
    STZ.W SamusSolidCollisionFlag
    BRA .return

+   LDA.W #$0002 : STA.W SamusXAccelerationMode

  .decelerating:
    JSR MoveSamus_Horizontally

  .return:
    PLP
    RTS
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $8EA9: Move Samus horizontally ;;;
MoveSamus_Horizontally:
;; Parameters:
;;     $12.$14: Samus X base speed

; Called by:
;     $8E64: Samus X movement
;     $8E75: Unused
;     $8FB3: Samus jumping movement
;     $9040: Samus spin jumping movement
;     $9168: Samus falling movement
;     $919F: Samus morphed falling movement
;     $91D1: Samus morphed bouncing movement
;     $9348: Move Samus horizontally with zero base X speed
;     $946E: Samus movement handler - released from grapple swing
    LDA.W SamusXAccelerationMode : BEQ .notTurning
    CMP.W #$0002 : BEQ .notTurning
    LDA.W PoseXDirection : AND.W #$00FF : CMP.W #$0008 : BEQ .leftwards
    BRA .rightwards

  .notTurning:
    LDA.W PoseXDirection : AND.W #$00FF : CMP.W #$0004 : BEQ .leftwards

  .rightwards:
    JSR CalculateSamusXDisplacement_ForMovingRight
    BRA .merge

  .leftwards:
    JSR CalculateSamusXDisplacement_ForMovingLeft

  .merge:
    LDA.B DP_Temp12 : BMI .left
    JSR MoveSamus_Right
    RTS

  .left:
    JSR MoveSamus_Left
    RTS


;;; $8EDF: Move Samus horizontally - knockback or bomb jump ;;;
MoveSamus_Horizontally_KnockbackBombJump:
; Called by:
;     $DF53: Knockback movement - up
;     $DF64: Knockback movement - down
;     $E04C: Samus movement handler - bomb jump - main - horizontal
    PHP
    REP #$30
    LDA.W KnockbackDirection : BEQ +
    JSR Determine_SamusXSpeedTable_EntryPointer
    JSR CalculateSamusXBaseSpeed_DecelerationAllowed
    LDA.W KnockbackXDirection : BNE .rightwards
    BRA .leftwards

+   LDX.W #SamusPhysicsConstants_XAccelSpeeds_DiagonalBombJump
    JSR CalculateSamusXBaseSpeed_DecelerationAllowed
    LDA.W BombJumpDirection : AND.W #$00FF : CMP.W #$0001 : BEQ .leftwards

  .rightwards:
    JSR CalculateSamusXDisplacement_ForMovingRight
    BRA .merge

  .leftwards:
    JSR CalculateSamusXDisplacement_ForMovingLeft

  .merge:
    LDA.B DP_Temp12 : BMI .left
    JSR MoveSamus_Right
    BRA .return

  .left:
    JSR MoveSamus_Left

  .return:
    PLP
    RTS


;;; $8F1B: Handle end of bomb jump ;;;
Handle_EndOfBombJump:
    PHP
    REP #$30
    LDA.W SamusYDirection : CMP.W #$0001 : BNE .return
    LDA.W SamusYSpeed : BMI +
    CMP.W #$0001 : BPL .return
    LDA.W PoseInputHandler : CMP.W #SamusPoseInputHandler_Demo : BEQ .return
    LDA.W #SamusPoseInputHandler_Normal : STA.W PoseInputHandler
    BRA .return

+   STZ.W SamusYSubSpeed : STZ.W SamusYSpeed
    LDA.W #$0002 : STA.W SamusYDirection
    LDA.W BombJumpDirection : AND.W #$00FF : CMP.W #$0002 : BEQ .return
    LDA.W #$0002 : STA.W SamusXAccelerationMode

  .return:
    PLP
    RTS


;;; $8F5F: Move Samus horizontally - pushed by Ceres Ridley ;;;
MoveSamus_Horizontally_PushedByCeresRidley:
    PHP
    REP #$30
    JSR Determine_SamusXSpeedTable_EntryPointer
    JSR CalculateSamusXBaseSpeed_DecelerationAllowed
    LDA.W PushDirection : CMP.W #$0001 : BEQ .left
    JSR CalculateSamusXDisplacement_ForMovingRight
    BRA +

  .left:
    JSR CalculateSamusXDisplacement_ForMovingLeft

+   LDA.B DP_Temp12 : BMI .moveLeft
    JSR MoveSamus_Right
    BRA .return

  .moveLeft:
    JSR MoveSamus_Left

  .return:
    PLP
    RTS


;;; $8F86: Move Samus vertically - pushed by Ceres Ridley ;;;
MoveSamus_Vertically_PushedByCeresRidley:
    PHP
    REP #$30
    LDA.W SamusYSpeed : CMP.W #$0005 : BPL +
    LDA.W SamusYSubSpeed : CLC : ADC.W SamusYSubAcceleration : STA.W SamusYSubSpeed
    LDA.W SamusYSpeed : ADC.W SamusYAcceleration : STA.W SamusYSpeed

+   LDA.W SamusYSubSpeed : STA.B DP_Temp14
    LDA.W SamusYSpeed : STA.B DP_Temp12
    JSR MoveSamus_Down
    PLP
    RTS


;;; $8FB3: Samus jumping movement ;;;
Samus_Jumping_Movement:
; Called by:
;     $A42E: Samus movement - normal jumping
;     $A6F1: Samus movement - spring ball - in air
;     $A734: Samus movement - wall jumping
;     $A7CA: Samus movement - damage boost
    PHP
    REP #$30
    JSR Handle_Samus_XExtraRunSpeed
    LDA.W Pose : CMP.W #$004B : BEQ +
    CMP.W #$004C : BEQ +
    CMP.W #$0055 : BMI .jumping
    CMP.W #$005B : BPL .jumping

+   STZ.W SamusXAccelerationMode
    JSR MoveSamus_HorizontallyWithZeroBaseXSpeed
    JSR MoveSamus_ByExtraYDisplacement
    JMP .return ; >.<

  .jumping:
    LDA.W SamusYDirection : CMP.W #$0001 : BNE .setFallingEnd
    LDA.B DP_Controller1Input : AND.W JumpBinding : BEQ +
    LDA.W SamusYSpeed : BPL .setFallingEnd

+   STZ.W SamusYSubSpeed : STZ.W SamusYSpeed
    LDA.W #$0002 : STA.W SamusYDirection

  .setFallingEnd:
    JSR Determine_SamusXSpeedTable_EntryPointer
    JSR CalculateSamusXBaseSpeed_DecelerationDisallowed
    LDA.W MovementType : AND.W #$00FF : CMP.W #$0014 : BEQ .wallJumping
    LDA.W SamusXAccelerationMode : BNE .XMovement
    LDA.B DP_Controller1Input : BIT.W #$0100 : BNE .XMovement
    BIT.W #$0200 : BNE .XMovement
    STZ.B DP_Temp12 : STZ.B DP_Temp14
    STZ.W SamusXBaseSpeed : STZ.W SamusXBaseSubSpeed
    STZ.W SamusSolidCollisionFlag
    BRA .noXMovement

  .wallJumping:
    LDA.W SamusXAccelerationMode : BNE .XMovement
    LDA.W #$0002 : STA.W SamusXAccelerationMode

  .XMovement:
    JSR MoveSamus_Horizontally

  .noXMovement:
    JSR Samus_Y_Movement_WithSpeedCalculations

  .return:
    PLP
    RTS


;;; $9040: Samus spin jumping movement ;;;
Samus_SpinJumping_Movement:
; Called by:
;     $A436: Samus movement - spin jumping
    PHP
    REP #$30
    JSR Handle_Samus_XExtraRunSpeed
    LDA.W SamusYDirection : CMP.W #$0001 : BNE .setFallingEnd
    LDA.B DP_Controller1Input : AND.W JumpBinding : BEQ +
    LDA.W SamusYSpeed : BPL .setFallingEnd

+   STZ.W SamusYSubSpeed : STZ.W SamusYSpeed
    LDA.W #$0002 : STA.W SamusYDirection

  .setFallingEnd:
    JSR Determine_SamusXSpeedTable_EntryPointer
    JSR CalculateSamusXBaseSpeed_DecelerationDisallowed
    BCS .allowXMovement
    LDA.W SamusXAccelerationMode : CMP.W #$0001 : BEQ .allowXMovement
    LDA.W PoseXDirection : AND.W #$00FF : CMP.W #$0004 : BEQ .leftwards
    LDA.B DP_Controller1Input : BIT.W #$0100 : BEQ +
    BRA .allowXMovement

  .leftwards:
    LDA.B DP_Controller1Input : BIT.W #$0200 : BEQ +
    BRA .allowXMovement

+   STZ.B DP_Temp12 : STZ.B DP_Temp14
    STZ.W SamusXBaseSpeed : STZ.W SamusXBaseSubSpeed
    STZ.W SamusSolidCollisionFlag : STZ.W SamusXAccelerationMode
    BRA .merge

  .allowXMovement:
    LDA.W SamusXAccelerationMode : BNE .merge
    LDA.W #$0002 : STA.W SamusXAccelerationMode

  .merge:
    JSR MoveSamus_Horizontally
    LDA.W SamusPhysicsConstants_MaximumDistanceFromWallForWallJump : STA.B DP_Temp12
    STZ.B DP_Temp14
    JSR WallJump_Check
    BCS .return
    JSR Samus_Y_Movement_WithSpeedCalculations

  .return:
    PLP
    RTS


;;; $90C4: Check if Samus has started falling ;;;
CheckIfSamusHasStartedFalling:
    PHP
    REP #$30
    LDA.W SamusYDirection : CMP.W #$0001 : BNE .return
    LDA.W SamusYSpeed : BPL .return
    STZ.W SamusYSubSpeed : STZ.W SamusYSpeed
    LDA.W #$0002 : STA.W SamusYDirection

  .return:
    PLP
    RTS


;;; $90E2: Samus Y movement - with speed calculations ;;;
Samus_Y_Movement_WithSpeedCalculations:
; Called by:
;     $8FB3: Samus jumping movement
;     $9040: Samus spin jumping movement
;     $9168: Samus falling movement
;     $919F: Samus morphed falling movement
;     $91D1: Samus morphed bouncing movement
;     $92B8: Simple Samus Y movement
;     $92C7: Simple Samus Y movement
;     $946E: Samus movement handler - released from grapple swing
;     $94CB: Samus movement handler - Samus drained - falling
;     $DF53: Knockback movement - up
;     $DF5D: Knockback movement - straight up (unused)
;     $E04C: Samus movement handler - bomb jump - main - horizontal
;     $E066: Samus movement handler - bomb jump - main - straight
    PHP
    REP #$30
    LDA.W SamusYSubSpeed : STA.B DP_Temp14
    LDA.W SamusYSpeed : STA.B DP_Temp12
    LDA.W SamusYDirection : CMP.W #$0002 : BEQ .down
    LDA.W SamusYSubSpeed : SEC : SBC.W SamusYSubAcceleration : STA.W SamusYSubSpeed
    LDA.W SamusYSpeed : SBC.W SamusYAcceleration : STA.W SamusYSpeed
    BRA +

  .down:
    LDA.W SamusYSpeed : CMP.W #$0005 : BEQ +
    LDA.W SamusYSubSpeed : CLC : ADC.W SamusYSubAcceleration : STA.W SamusYSubSpeed
    LDA.W SamusYSpeed : ADC.W SamusYAcceleration : STA.W SamusYSpeed

+   LDA.W ExtraSamusYDisplacement : BEQ .checkDirection
    LDA.W ExtraSamusYSubDisplacement : BEQ .checkDirection
    NOP ; >.<

  .checkDirection:
    LDA.W SamusYDirection : CMP.W #$0002 : BEQ .notDown
    LDA.B DP_Temp12 : EOR.W #$FFFF : STA.B DP_Temp12
    LDA.B DP_Temp14 : EOR.W #$FFFF : INC : STA.B DP_Temp14
    BNE .notDown
    INC.B DP_Temp12

  .notDown:
    LDA.W ExtraSamusYSubDisplacement : CLC : ADC.B DP_Temp14 : STA.B DP_Temp14
    LDA.W ExtraSamusYDisplacement : ADC.B DP_Temp12 : STA.B DP_Temp12 : BMI .moveUp
    JSR MoveSamus_Down
    BRA .return

  .moveUp:
    JSR MoveSamus_Up

  .return:
    PLP
    RTS


;;; $9168: Samus falling movement ;;;
Samus_Falling_Movement:
; Called by:
;     $A58D: Samus movement - falling
    PHP
    REP #$30
    JSR Handle_Samus_XExtraRunSpeed
    JSR Determine_SamusXSpeedTable_EntryPointer
    JSR CalculateSamusXBaseSpeed_DecelerationDisallowed
    LDA.W SamusXAccelerationMode : BNE .pressingLeftRight
    LDA.B DP_Controller1Input : BIT.W #$0100 : BNE .pressingLeftRight
    BIT.W #$0200 : BNE .pressingLeftRight
    STZ.B DP_Temp12 : STZ.B DP_Temp14
    STZ.W SamusXBaseSpeed : STZ.W SamusXBaseSubSpeed
    STZ.W SamusSolidCollisionFlag
    BRA +

  .pressingLeftRight:
    JSR MoveSamus_Horizontally

+   JSR CheckIfSamusHasStartedFalling
    JSR Samus_Y_Movement_WithSpeedCalculations
    PLP
    RTS


;;; $919F: Samus morphed falling movement ;;;
Samus_Morphed_Falling_Movement:
; Called by:
;     $A5CA: Samus movement - morph ball - fallingMore actions
;     $A703: Samus movement - spring ball - falling
    PHP
    REP #$30
    JSR Determine_SamusXSpeedTable_EntryPointer
    JSR CalculateSamusXBaseSpeed_DecelerationDisallowed
    LDA.W SamusXAccelerationMode : BNE .moveHorizontally
    LDA.B DP_Controller1Input : BIT.W #$0100 : BNE .moveHorizontally
    BIT.W #$0200 : BNE .moveHorizontally
    STZ.B DP_Temp12 : STZ.B DP_Temp14
    STZ.W SamusXBaseSpeed : STZ.W SamusXBaseSubSpeed
    STZ.W SamusSolidCollisionFlag

  .moveHorizontally:
    JSR MoveSamus_Horizontally
    JSR CheckIfSamusHasStartedFalling
    JSR Samus_Y_Movement_WithSpeedCalculations
    PLP
    RTS


;;; $91D1: Samus morphed bouncing movement ;;;
Samus_Morphed_Bouncing_Movement:
; Called by:
;     $A5CA: Samus movement - morph ball - falling
;     $A6F1: Samus movement - spring ball - in air
;     $A703: Samus movement - spring ball - falling
    PHP
    REP #$30
    JSR Determine_SamusXSpeedTable_EntryPointer
    JSR CalculateSamusXBaseSpeed_DecelerationDisallowed
    LDA.W SamusXAccelerationMode : BNE .pressingLeftRight
    LDA.B DP_Controller1Input : BIT.W #$0100 : BNE .pressingLeftRight
    BIT.W #$0200 : BNE .pressingLeftRight
    STZ.B DP_Temp12 : STZ.B DP_Temp14
    STZ.W SamusXBaseSpeed : STZ.W SamusXBaseSubSpeed
    STZ.W SamusSolidCollisionFlag

  .pressingLeftRight:
    JSR MoveSamus_Horizontally
    LDA.W KnockbackDirection : BNE .return
    LDA.W ExtraSamusYDisplacement : BNE .extraYDisplacement
    LDA.W ExtraSamusYSubDisplacement : BEQ .noExtraDisplacement

  .extraYDisplacement:
    LDA.W #$0002 : STA.W SamusYDirection
    STZ.W SamusYSubSpeed : STZ.W SamusYSpeed
    STZ.B DP_Temp14 : STZ.B DP_Temp12
    LDA.W ExtraSamusYSubDisplacement : CLC : ADC.B DP_Temp14 : STA.B DP_Temp14
    LDA.W ExtraSamusYDisplacement : ADC.B DP_Temp12 : STA.B DP_Temp12 : BMI .moveUp
    INC.B DP_Temp12
    JSR MoveSamus_Down
    BRA .return

  .moveUp:
    JSR MoveSamus_Up
    BRA .return

  .noExtraDisplacement:
    JSR CheckIfSamusHasStartedFalling
    JSR Samus_Y_Movement_WithSpeedCalculations

  .return:
    PLP
    RTS


;;; $923F: Samus Y movement - no speed calculations ;;;
Samus_Y_Movement_NoSpeedCalculations:
; Called by:
;     $A383: Samus movement - standingMore actions
;     $A3E5: Samus movement - running
;     $A521: Samus movement - morph ball - on ground
;     $A573: Samus movement - crouching
;     $A5FC: Samus movement - knockback / crystal flash ending
;     $A61C: Samus movement - crouching/standing/morphing/unmorphing transition
;     $A67C: Samus movement - turning around - on ground
;     $A694: Samus movement - moonwalking
;     $A69F: Samus movement - spring ball - on ground
;     $A75F: Samus movement - ran into a wall
;     $A790: Samus movement - turning around - jumping
;     $A7AD: Samus movement - turning around - falling
;     $DF64: Knockback movement - down

; Total X speed is added to distance moved down in an attempt to keep Samus in contact with downwards slopes
; (unless it's already been determined that she's on a slope, in which case no adjustment is made)
; You'll note that this only works up to a steepness of 45°, which may or may not be intentional...
; If you wanted Samus to not fall off steep slopes, it might be better to just try pushing Samus to the bottom of the block that's one pixel down?
    PHP
    REP #$30
    LDA.W ExtraSamusYDisplacement : BNE .useExtraDisplacement
    LDA.W ExtraSamusYSubDisplacement : BNE .useExtraDisplacement
    LDA.W SamusPositionAdjustedBySlopeFlag : BNE .adjustedBySlope
    LDA.W TotalSamusXSubSpeed : STA.B DP_Temp14
    LDA.W TotalSamusXSpeed : INC : STA.B DP_Temp12
    BRA .gotoMoveDown

  .adjustedBySlope:
    STZ.B DP_Temp14
    LDA.W #$0001 : STA.B DP_Temp12

  .gotoMoveDown:
    BRA .moveDown

  .useExtraDisplacement:
    STZ.B DP_Temp14 : STZ.B DP_Temp12
    LDA.W ExtraSamusYSubDisplacement : CLC : ADC.B DP_Temp14 : STA.B DP_Temp14
    LDA.W ExtraSamusYDisplacement : ADC.B DP_Temp12 : STA.B DP_Temp12 : BMI .moveUp
    INC.B DP_Temp12

  .moveDown:
    JSR MoveSamus_Down
    BRA .return

  .moveUp:
    JSR MoveSamus_Up

  .return:
    PLP
    RTS


;;; $9288: Move Samus by extra Samus Y displacement ;;;
MoveSamus_ByExtraYDisplacement:
    PHP
    REP #$30
    LDA.W ExtraSamusYDisplacement : BNE .move
    LDA.W ExtraSamusYSubDisplacement : BNE .move
    PLP
    RTS

  .move:
    STZ.B DP_Temp14 : STZ.B DP_Temp12
    LDA.W ExtraSamusYSubDisplacement : CLC : ADC.B DP_Temp14 : STA.B DP_Temp14
    LDA.W ExtraSamusYDisplacement : ADC.B DP_Temp12 : STA.B DP_Temp12 : BMI .moveUp
    INC.B DP_Temp12
    JSR MoveSamus_Down
    BRA .return

  .moveUp:
    JSR MoveSamus_Up

  .return:
    PLP
    RTS


;;; $92B8: Simple Samus Y movement ;;;
Simple_Samus_Y_Movement:
;; Returns:
;;     Carry: Set if [Samus Y direction] != none, clear otherwise

; Called by:More actions
;     $A521: Samus movement - morph ball - on ground
;     $A69F: Samus movement - spring ball - on ground
;     $A790: Samus movement - turning around - jumping
;     $A7AD: Samus movement - turning around - falling

; In all cases, if this routine returns carry clear, $923F (Samus Y movement - no speed calculations) is called
    LDA.W SamusYDirection : BNE .movingUpDown
    CLC
    RTS

  .movingUpDown:
    JSR CheckIfSamusHasStartedFalling
    JSR Samus_Y_Movement_WithSpeedCalculations
    SEC
    RTS


;;; $92C7: Simple Samus Y movement ;;;
Simple_Samus_Y_Movement_duplicate:
;; Returns:
;;     Carry: set if [Samus Y direction] != none, clear otherwise

; Clone of Simple_Samus_Y_Movement
; Called by:
;     $A61C: Samus movement - crouching/standing/morphing/unmorphing transition
    LDA.W SamusYDirection : BNE .movingUpDown
    CLC
    RTS

  .movingUpDown:
    JSR CheckIfSamusHasStartedFalling
    JSR Samus_Y_Movement_WithSpeedCalculations
    SEC
    RTS


if !FEATURE_KEEP_UNREFERENCED
;;; $92D6: Unused ;;;
UNUSED_MoveSamus_9092D6:
;; Parameters:
;;     $12: Samus Y velocity
    PHP
    REP #$30
    BRA .uselessBranch ; >.<

  .uselessBranch:
    LDA.W SamusYPosition : CLC : ADC.B DP_Temp12 : STA.W SamusYPosition : STA.W SamusPreviousYPosition
    PLP
    RTS
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $92E9: RTS ;;;
RTS_9092E9:
; Looks like an old routine that was RTS'd out
; Called by $A75F: Samus movement - ran into a wall
    RTS

    PHP
    REP #$30
    LDA.W #$0001 : STA.B DP_Temp12
    STZ.B DP_Temp14
    LDA.W PoseXDirection : AND.W #$00FF : CMP.W #$0004 : BEQ .facingLeft
    LDA.B DP_Controller1Input : BIT.W #$0100 : BNE .rightwards
    BRA .return

  .facingLeft:
    LDA.B DP_Controller1Input : BIT.W #$0200 : BNE .leftwards
    BRA .return

  .rightwards:
    JSR CalculateSamusXDisplacement_ForMovingRight
    BRA .merge

  .leftwards:
    JSR CalculateSamusXDisplacement_ForMovingLeft

  .merge:
    LDA.B DP_Temp12 : BMI .moveLeft
    JSR MoveSamus_Right
    BRA +

  .moveLeft:
    JSR MoveSamus_Left

+   LDA.W SamusSolidCollisionFlag : BNE .return
    LDA.W PoseXDirection : AND.W #$00FF : CMP.W #$0004 : BEQ .leftFacing
    LDA.W #$0009 : STA.W ProspectivePose
    BRA +

  .leftFacing:
    LDA.W #$000A : STA.W ProspectivePose

+   STZ.W SamusSolidVerticalCollisionResult

  .return:
    PLP
    RTS


;;; $9348: Move Samus horizontally with zero base X speed ;;;
MoveSamus_HorizontallyWithZeroBaseXSpeed:
    STZ.B DP_Temp12 : STZ.B DP_Temp14
    JSR MoveSamus_Horizontally
    RTS


;;; $9350: Move Samus left by -[$12].[$14] ;;;
MoveSamus_Left:
    PHP
    REP #$30
    LDA.B DP_Temp12 : EOR.W #$FFFF : STA.B DP_Temp12
    LDA.B DP_Temp14 : EOR.W #$FFFF : INC : STA.B DP_Temp14 : BNE .checkSolidEnemyCollision
    INC.B DP_Temp12

  .checkSolidEnemyCollision:
    JSL Samus_vs_SolidEnemy_CollisionDetection
    STA.W SamusSolidCollisionFlag
    TAX : BEQ .noSolidEnemyCollision
    JSR Kill_SamusXSpeed_IfCollisionDetected
    JSR MoveSamus_Left_NoCollisionDetection
    JSL Align_SamusYPosition_WithNonSquareSlope
    PLP
    RTS

  .noSolidEnemyCollision:
    LDA.B DP_Temp12 : EOR.W #$FFFF : STA.B DP_Temp12
    LDA.B DP_Temp14 : EOR.W #$FFFF : INC : STA.B DP_Temp14 : BNE .moveRight
    INC.B DP_Temp12

  .moveRight:
    JSL MoveSamusRight_NoSolidEnemyCollision
    LDA.B DP_Temp14 : STA.W ProjSpeed_SubDistanceSamusMovedLeft
    LDA.B DP_Temp12 : STA.W ProjSpeed_DistanceSamusMovedLeft
    LDA.W CollisionMovementDirection : BIT.W #$0001 : BEQ +
    STZ.W SamusSolidCollisionFlag

+   JSR Kill_SamusXSpeed_IfCollisionDetected
    JSL Align_SamusYPosition_WithNonSquareSlope
    PLP
    RTS


;;; $93B1: Move Samus right by [$12].[$14] ;;;
MoveSamus_Right:
    PHP
    REP #$30
    JSL Samus_vs_SolidEnemy_CollisionDetection
    STA.W SamusSolidCollisionFlag
    TAX : BEQ +
    JSR Kill_SamusXSpeed_IfCollisionDetected
    JSR MoveSamus_Right_NoCollisionDetection
    JSL Align_SamusYPosition_WithNonSquareSlope
    PLP
    RTS

+   JSL MoveSamusRight_NoSolidEnemyCollision
    LDA.B DP_Temp14 : STA.W ProjSpeed_SubDistanceSamusMovedRight
    LDA.B DP_Temp12 : STA.W ProjSpeed_DistanceSamusMovedRight
    LDA.W CollisionMovementDirection : BIT.W #$0001 : BNE +
    STZ.W SamusSolidCollisionFlag

+   JSR Kill_SamusXSpeed_IfCollisionDetected
    JSL Align_SamusYPosition_WithNonSquareSlope
    PLP
    RTS


;;; $93EC: Move Samus up by -[$12].[$14] ;;;
MoveSamus_Up:
    PHP
    REP #$30
    LDA.W #$0002 : STA.W CollisionMovementDirection
    LDA.B DP_Temp12 : EOR.W #$FFFF : STA.B DP_Temp12
    LDA.B DP_Temp14 : EOR.W #$FFFF : INC : STA.B DP_Temp14 : BNE +
    INC.B DP_Temp12

+   JSL Samus_vs_SolidEnemy_CollisionDetection
    STA.W SamusSolidCollisionFlag
    TAX : BEQ +
    JSR SetSamusSolidVerticalCollisionResult_UpwardsMovement
    JSR MoveSamus_Up_NoCollisionDetection
    PLP
    RTS

+   LDA.B DP_Temp12 : EOR.W #$FFFF : STA.B DP_Temp12
    LDA.B DP_Temp14 : EOR.W #$FFFF : INC : STA.B DP_Temp14 : BNE +
    INC.B DP_Temp12

+   JSL MoveSamusDown_NoSolidEnemyCollision
    LDA.B DP_Temp14 : STA.W ProjSpeed_SubDistanceSamusMovedUp
    LDA.B DP_Temp12 : STA.W ProjSpeed_DistanceSamusMovedUp
    JSR SetSamusSolidVerticalCollisionResult_UpwardsMovement
    PLP
    RTS


;;; $9440: Move Samus down by [$12].[$14] ;;;
MoveSamus_Down:
    PHP
    REP #$30
    LDA.W #$0003 : STA.W CollisionMovementDirection
    JSL Samus_vs_SolidEnemy_CollisionDetection
    STA.W SamusSolidCollisionFlag
    TAX : BEQ .move
    JSR SetSamusSolidVerticalCollisionResult_DownwardsMovement
    JSR MoveSamus_Down_NoCollisionDetection
    PLP
    RTS

  .move:
    JSL MoveSamusDown_NoSolidEnemyCollision
    LDA.B DP_Temp14 : STA.W neverRead0DB8
    LDA.B DP_Temp12 : STA.W ProjSpeed_DistanceSamusMovedDown
    JSR SetSamusSolidVerticalCollisionResult_DownwardsMovement
    PLP
    RTS


;;; $946E: Samus movement handler - released from grapple swing ;;;
SamusMovementHandler_ReleasedFromGrappleSwing:
    LDA.W SamusYDirection : CMP.W #$0001 : BNE .up
    LDA.W SamusYSpeed : BPL .up
    STZ.W SamusYSubSpeed : STZ.W SamusYSpeed
    LDA.W #$0002 : STA.W SamusYDirection
    LDA.W #SamusMovementHandler_Normal : STA.W MovementHandler

  .up:
    LDA.W #$0002 : STA.W SamusXAccelerationMode
    JSR DetermineGrappleSwing_SamusXSpeedTable_EntryPointer
    JSR CalculateSamusXBaseSpeed_DecelerationAllowed
    LDA.W SamusXAccelerationMode : BNE .pressingLeftRight
    LDA.B DP_Controller1Input : BIT.W #$0100 : BNE .pressingLeftRight
    BIT.W #$0200 : BNE .pressingLeftRight
    STZ.B DP_Temp12 : STZ.B DP_Temp14
    STZ.W SamusXBaseSpeed : STZ.W SamusXBaseSubSpeed
    STZ.W SamusSolidCollisionFlag
    BRA .YMovement

  .pressingLeftRight:
    JSR MoveSamus_Horizontally

  .YMovement:
    JSR Samus_Y_Movement_WithSpeedCalculations
    LDA.W SamusSolidVerticalCollisionResult : BEQ .return
    LDA.W #SamusMovementHandler_Normal : STA.W MovementHandler

  .return:
    RTS


;;; $94CB: Samus movement handler - Samus drained - falling ;;;
SamusMovementHandler_SamusDrained_Falling:
    JSR Samus_Y_Movement_WithSpeedCalculations
    LDA.W SamusSolidCollisionFlag : BEQ .return
    LDA.W #SamusMovementHandler_Normal : STA.W MovementHandler
    LDA.W #$0008 : STA.W SamusAnimationFrameTimer
    LDA.W #$0007 : STA.W SamusAnimationFrame
    STZ.W SamusYSubSpeed : STZ.W SamusYSpeed

  .return:
    RTS


;;; $94EC: Main scrolling routine ;;;
Main_Scrolling_Routine:
; Called by:
;     $82:8B44: Game state 8 (main gameplay)
;     $82:E675 (unused door transition routine)
    PHP : PHB
    PHK : PLB
    REP #$30
    LDA.W GrappleBeam_SlowScrollingFlag : BEQ .normalScrolling
    LDA.W SamusXPosition : BMI .grappleScrollVerticalEnd
    SEC : SBC.W Layer1XPosition : BCC .grappleScrollLeft
    CMP.W #$00A0 : BCC +
    LDA.W Layer1XPosition : CLC : ADC.W #$0003 : STA.W Layer1XPosition
    BRA .grappleScrollHorizontalEnd

+   CMP.W #$0060 : BCS .grappleScrollHorizontalEnd

  .grappleScrollLeft:
    LDA.W Layer1XPosition : SEC : SBC.W #$0003 : STA.W Layer1XPosition

  .grappleScrollHorizontalEnd:
    LDA.W SamusYPosition : BMI .grappleScrollVerticalEnd
    SEC : SBC.W Layer1YPosition : BCC .grappleScrollUp
    CMP.W #$0090 : BCC +
    LDA.W Layer1YPosition : CLC : ADC.W #$0003 : STA.W Layer1YPosition
    BRA .grappleScrollVerticalEnd

+   CMP.W #$0070 : BCS .grappleScrollVerticalEnd

  .grappleScrollUp:
    LDA.W Layer1YPosition : SEC : SBC.W #$0003 : STA.W Layer1YPosition

  .grappleScrollVerticalEnd:
    JSL HandleScrollZones_HorizontalAutoscrolling
    JSL HandleScrollZones_VerticalAutoscrolling
    BRA .finishedScrolling

  .normalScrolling:
    JSR Calculate_CameraXSpeed
    JSR Handle_Horizontal_Scrolling
    JSR CalculateVerticalDistanceSamusMovedLastFrame
    JSR Handle_Vertical_Scrolling

  .finishedScrolling:
    LDX.W ScrollingSkyFinishedHook : BEQ +
    LDX.W #$0000
    JSR.W (ScrollingSkyFinishedHook,X)

+   LDA.W SamusXPosition : STA.W SamusPreviousXPosition
    LDA.W SamusXSubPosition : STA.W SamusPreviousXSubPosition
    LDA.W SamusYPosition : STA.W SamusPreviousYPosition
    LDA.W SamusYSubPosition : STA.W SamusPreviousYSubPosition
    PLB : PLP
    RTL


;;; $9589: Scrolling finished hook - Spore Spawn fight ;;;
ScrollingFinishedHook_SporeSpawnFight:
    LDA.W #$01D0 : CMP.W Layer1YPosition : BCC .return
    STA.W Layer1YPosition

  .return:
    RTS


if !FEATURE_KEEP_UNREFERENCED
;;; $9595: Unused. Camera X speed = 0.0 ;;;
UNUSED_CameraXSpeed_0_909595:
    PHP
    REP #$30
    STZ.W CameraXSubSpeed : STZ.W CameraXSpeed
    PLP
    RTS
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $95A0: Handle horizontal scrolling ;;;
Handle_Horizontal_Scrolling:
    PHP
    REP #$30
    LDA.W SamusPreviousXPosition : CMP.W SamusXPosition : BNE +
    JSL HandleScrollZones_HorizontalAutoscrolling
    JMP .return

+   LDA.W Layer1XPosition : STA.B DP_Temp12
    LDA.W KnockbackDirection : BNE .backwards
    LDA.W MovementType : AND.W #$00FF : CMP.W #$0010 : BNE .forwards

  .backwards:
    LDA.W PoseXDirection : AND.W #$00FF : CMP.W #$0004 : BEQ .right
    BRA .left

  .forwards:
    LDA.W SamusXAccelerationMode : CMP.W #$0001 : BEQ .backwards
    LDA.W PoseXDirection : AND.W #$00FF : CMP.W #$0004 : BEQ .left

  .right:
    LDX.W CameraDistanceIndex
    LDA.W SamusXPosition : SEC : SBC.W .facingRight,X : STA.W IdealLayer1XPosition
    BRA .merge

  .left:
    LDX.W CameraDistanceIndex
    LDA.W SamusXPosition : SEC : SBC.W .facingLeft,X : STA.W IdealLayer1XPosition

  .merge:
    LDA.W IdealLayer1XPosition : CMP.W Layer1XPosition : BEQ .return
    BMI +
    LDA.W Layer1XSubPosition : CLC : ADC.W CameraXSubSpeed : STA.W Layer1XSubPosition
    LDA.W Layer1XPosition : ADC.W CameraXSpeed : STA.W Layer1XPosition
    JSL HandleScrollZones_ScrollingRight
    BRA .return

+   LDA.W Layer1XSubPosition : SEC : SBC.W CameraXSubSpeed : STA.W Layer1XSubPosition
    LDA.W Layer1XPosition : SBC.W CameraXSpeed : STA.W Layer1XPosition
    JSL HandleScrollZones_ScrollingLeft

  .return:
    PLP
    RTS

; Target distance camera is to the left of Samus
  .facingRight:
    dw $0060,$0040,$0020,$00E0
  .facingLeft:
    dw $00A0,$0050,$0020,$00E0


;;; $964F: Handle vertical scrolling ;;;
Handle_Vertical_Scrolling:
    PHP
    REP #$30
    LDA.W SamusPreviousYPosition : CMP.W SamusYPosition : BNE +
    JSL HandleScrollZones_VerticalAutoscrolling
    JMP .return

+   LDA.W Layer1YPosition : STA.B DP_Temp12
    LDA.W SamusYDirection : CMP.W #$0001 : BEQ .up
    LDA.W SamusYPosition : SEC : SBC.W UpScroller : STA.W IdealLayer1YPosition
    BRA +

  .up:
    LDA.W SamusYPosition : SEC : SBC.W DownScroller : STA.W IdealLayer1YPosition

+   LDA.W IdealLayer1YPosition : CMP.W Layer1YPosition : BEQ .return
    BMI .idealLessThanActual
    LDA.W Layer1YSubPosition : CLC : ADC.W CameraYSubSpeed : STA.W Layer1YSubPosition
    LDA.W Layer1YPosition : ADC.W CameraYSpeed : STA.W Layer1YPosition
    JSL HandleScrollZones_ScrollingDown
    BRA .return

  .idealLessThanActual:
    LDA.W Layer1YSubPosition : SEC : SBC.W CameraYSubSpeed : STA.W Layer1YSubPosition
    LDA.W Layer1YPosition : SBC.W CameraYSpeed : STA.W Layer1YPosition
    JSL HandleScrollZones_ScrollingUp

  .return:
    PLP
    RTS


;;; $96C0: Calculate camera X speed ;;;
Calculate_CameraXSpeed:
; This check to go to .right doesn't include the subpixel position,
; so that branch may be taken even if Samus moved left, so long as she hasn't reached the next pixel
; In that case, the ([Samus X position] - [Samus previous X position]) calculation results in a value -1.0 < x < 0.0,
; and as such, "absolute X distance Samus moved last frame + 1" can be less than 1
; >_>;
    PHP
    REP #$30
    LDA.W SamusXPosition : CMP.W SamusPreviousXPosition : BMI +
    BRA .right

+   LDA.W SamusPreviousXSubPosition : SEC : SBC.W SamusXSubPosition : STA.W CameraXSubSpeed
    LDA.W SamusPreviousXPosition : SBC.W SamusXPosition
    CLC : ADC.W SamusPhysicsConstants_CameraXOffsetFromSamusWhenTurning : STA.W CameraXSpeed
    BRA .return

  .right:
    LDA.W SamusXSubPosition : SEC : SBC.W SamusPreviousXSubPosition : STA.W CameraXSubSpeed
    LDA.W SamusXPosition : SBC.W SamusPreviousXPosition
    CLC : ADC.W SamusPhysicsConstants_CameraXOffsetFromSamusWhenTurning : STA.W CameraXSpeed

  .return:
    PLP
    RTS


;;; $96FF: Calculate the vertical distance Samus has moved last frame + 1 ;;;
CalculateVerticalDistanceSamusMovedLastFrame:
; Result can be less than 1.0, see Calculate_CameraXSpeed
    PHP
    REP #$30
    LDA.W SamusYPosition : CMP.W SamusPreviousYPosition : BMI +
    BRA .down

+   LDA.W SamusPreviousYSubPosition : SEC : SBC.W SamusYSubPosition : STA.W CameraYSubSpeed
    LDA.W SamusPreviousYPosition : SBC.W SamusYPosition
    CLC : ADC.W SamusPhysicsConstants_CameraXOffsetFromSamusWhenTurning : STA.W CameraYSpeed
    BRA .return

  .down:
    LDA.W SamusYSubPosition : SEC : SBC.W SamusPreviousYSubPosition : STA.W CameraYSubSpeed
    LDA.W SamusYPosition : SBC.W SamusPreviousYPosition
    CLC : ADC.W SamusPhysicsConstants_CameraXOffsetFromSamusWhenTurning : STA.W CameraYSpeed

  .return:
    PLP
    RTS


;;; $973E: Handle Samus X extra run speed ;;;
Handle_Samus_XExtraRunSpeed:
; If not eligible to run or not running, set extra run speed to zero
; Otherwise accelerate and cap at max speed, depending on speed booster
    PHP
    REP #$30
    LDA.W EquippedItems : BIT.W #$0020 : BNE .gravity
    JSL Get_Samus_Bottom_Boundary
    LDA.W FX_YPosition : BMI .negativeYPosition
    CMP.B DP_Temp12 : BMI .submerged
    BRA .gravity

  .negativeYPosition:
    LDA.W FX_LavaAcidYPosition : BMI .gravity
    CMP.B DP_Temp12 : BMI .gotoNotRunning

  .gravity:
    LDX.W #$0000
    BRA .gravityContinued

  .submerged:
    LDA.W FX_LiquidOptions : BIT.W #$0004
    BNE .gravity

  .gotoNotRunning:
    JMP .notRunning

  .gravityContinued:
    LDA.W MovementType : AND.W #$00FF : CMP.W #$0001 : BEQ .checkDash
    JMP .notRunning

  .checkDash:
    LDA.B DP_Controller1Input : AND.W DashBinding : BNE .running
    JMP .notRunning

  .running:
    LDA.W EquippedItems : BIT.W #$2000 : BEQ .noSpeedBooster
    LDA.W SamusRunningMomentumFlag : BNE .hasMomentum
    LDA.W #$0001 : STA.W SamusRunningMomentumFlag : STA.W CommonPaletteTimer
    STZ.W SpecialSamusPaletteFrame
    LDA.L SpeedBoostTimerResetValues : STA.W SamusBoostTimer

  .hasMomentum:
    LDA.W SamusXExtraRunSpeed : CMP.W SamusPhysicsConstants_MaxXExtraRunSpeeds_SpeedBooster,X : BMI .accelerating
    LDA.W SamusXExtraRunSubSpeed : CMP.W SamusPhysicsConstants_MaxXExtraRunSubSpeeds_SpeedBooster,X : BMI .accelerating
    LDA.W SamusPhysicsConstants_MaxXExtraRunSpeeds_SpeedBooster,X : STA.W SamusXExtraRunSpeed
    LDA.W SamusPhysicsConstants_MaxXExtraRunSubSpeeds_SpeedBooster,X : STA.W SamusXExtraRunSubSpeed
    BRA .done

  .noSpeedBooster:
    LDA.W SamusRunningMomentumFlag : BNE +
    LDA.W #$0001 : STA.W SamusRunningMomentumFlag
    STZ.W SamusBoostTimer

+   LDA.W SamusXExtraRunSpeed : CMP.W SamusPhysicsConstants_MaxXExtraRunSpeeds_NoSpeedBooster_0,X : BMI .accelerating
    LDA.W SamusXExtraRunSubSpeed : CMP.W SamusPhysicsConstants_MaxXExtraRunSpeeds_NoSpeedBooster_1,X : BMI .accelerating
    LDA.W SamusPhysicsConstants_MaxXExtraRunSpeeds_NoSpeedBooster_0,X : STA.W SamusXExtraRunSpeed
    LDA.W SamusPhysicsConstants_MaxXExtraRunSpeeds_NoSpeedBooster_1,X : STA.W SamusXExtraRunSubSpeed
    BRA .done

  .accelerating:
    LDA.W SamusXExtraRunSubSpeed : CLC : ADC.W SamusPhysicsConstants_XSubAccelerations_DashHeld,X : STA.W SamusXExtraRunSubSpeed
    LDA.W SamusXExtraRunSpeed : ADC.W SamusPhysicsConstants_XAccelerations_DashHeld,X : STA.W SamusXExtraRunSpeed
    BRA .done

  .notRunning:
    LDA.W SamusRunningMomentumFlag : BNE .done
    STZ.W SamusXExtraRunSpeed : STZ.W SamusXExtraRunSubSpeed

  .done:
    LDA.W SamusBoostTimer : AND.W #$FF00 : CMP.W #$0400 : BNE .return
    LDA.W #$0001 : STA.W ContactDamageIndex

  .return:
    PLP
    RTS


;;; $9826: Move Samus right by [$12].[$14], no collision detection ;;;
MoveSamus_Right_NoCollisionDetection:
;; Parameters:
;;     $12.$14: Distance to move Samus
    LDA.W SamusXSubPosition : CLC : ADC.B DP_Temp14 : STA.W SamusXSubPosition
    LDA.W SamusXPosition : ADC.B DP_Temp12 : STA.W SamusXPosition
    LDA.B DP_Temp14 : STA.W ProjSpeed_SubDistanceSamusMovedRight
    LDA.B DP_Temp12 : STA.W ProjSpeed_DistanceSamusMovedRight
    RTS


;;; $9842: Move Samus left by [$12].[$14], no collision detection ;;;
MoveSamus_Left_NoCollisionDetection:
;; Parameters:
;;     $12.$14: Distance to move Samus
    LDA.W SamusXSubPosition : SEC : SBC.B DP_Temp14 : STA.W SamusXSubPosition
    LDA.W SamusXPosition : SBC.B DP_Temp12 : STA.W SamusXPosition
    LDA.B DP_Temp12 : EOR.W #$FFFF : STA.B DP_Temp12
    LDA.B DP_Temp14 : EOR.W #$FFFF : INC : STA.B DP_Temp14 : BNE +
    INC.B DP_Temp12

+   LDA.B DP_Temp14 : STA.W ProjSpeed_SubDistanceSamusMovedLeft
    LDA.B DP_Temp12 : STA.W ProjSpeed_DistanceSamusMovedLeft
    RTS


;;; $9871: Move Samus down by [$12].[$14], no collision detection ;;;
MoveSamus_Down_NoCollisionDetection:
;; Parameters:
;;     $12.$14: Distance to move Samus
    LDA.W SamusYSubPosition : CLC : ADC.B DP_Temp14 : STA.W SamusYSubPosition
    LDA.W SamusYPosition : ADC.B DP_Temp12 : STA.W SamusYPosition
    LDA.B DP_Temp14 : STA.W neverRead0DB8
    LDA.B DP_Temp12 : STA.W ProjSpeed_DistanceSamusMovedDown
    RTS


;;; $988D: Move Samus up by [$12].[$14], no collision detection ;;;
MoveSamus_Up_NoCollisionDetection:
;; Parameters:
;;     $12.$14: Distance to move Samus
    LDA.W SamusYSubPosition : SEC : SBC.B DP_Temp14 : STA.W SamusYSubPosition
    LDA.W SamusYPosition : SBC.B DP_Temp12 : STA.W SamusYPosition
    LDA.B DP_Temp12 : EOR.W #$FFFF : STA.B DP_Temp12
    LDA.B DP_Temp14 : EOR.W #$FFFF : INC : STA.B DP_Temp14 : BNE +
    INC.B DP_Temp12

+   LDA.B DP_Temp14 : STA.W ProjSpeed_SubDistanceSamusMovedUp
    LDA.B DP_Temp12 : STA.W ProjSpeed_DistanceSamusMovedUp
    RTS


;;; $98BC: Make Samus jump ;;;
Make_Samus_Jump:
    PHP : PHB
    PHK : PLB
    REP #$30
    LDA.W EquippedItems : BIT.W #$0020 : BNE .normalGravity
    JSL Get_Samus_Bottom_Boundary
    LDA.W FX_YPosition : BMI .negativeYPosition
    CMP.B DP_Temp12 : BMI .submergedInWater
    BRA .normalGravity

  .negativeYPosition:
    LDA.W FX_LavaAcidYPosition : BMI .normalGravity
    CMP.B DP_Temp12 : BMI .submergedInAcidLava

  .normalGravity:
    LDX.W #$0000
    BRA .merge

  .submergedInWater:
    LDA.W FX_LiquidOptions : BIT.W #$0004 : BNE .normalGravity
    LDX.W #$0002
    BRA .merge

  .submergedInAcidLava:
    LDX.W #$0004

  .merge:
    LDA.W EquippedItems : BIT.W #$0100 : BNE .hiJumpEquipped
    LDA.W SamusPhysicsConstants_InitialYSubSpeeds_Jumping,X : STA.W SamusYSubSpeed
    LDA.W SamusPhysicsConstants_InitialYSpeeds_Jumping,X : STA.W SamusYSpeed
    BRA +

  .hiJumpEquipped:
    LDA.W SamusPhysicsConstants_InitialYSubSpeeds_HiJumpJumping,X : STA.W SamusYSubSpeed
    LDA.W SamusPhysicsConstants_InitialYSpeeds_HiJumpJumping,X : STA.W SamusYSpeed

+   LDA.W EquippedItems : BIT.W #$2000 : BEQ +
    LDA.W SamusXExtraRunSpeed : LSR : STA.B DP_Temp12
    LDA.W SamusYSubSpeed : CLC : ADC.W SamusXExtraRunSubSpeed : STA.W SamusYSubSpeed
    LDA.W SamusYSpeed : CLC : ADC.B DP_Temp12 : STA.W SamusYSpeed

+   STZ.W GrappleWalljumpTimer : STZ.W CeresElevatorFadeTimer
    LDA.W #$0001 : STA.W SamusYDirection
    PLB : PLP
    RTL


;;; $9949: Make Samus wall-jump ;;;
Make_Samus_WallJump:
    PHP : PHB
    PHK : PLB
    REP #$30
    LDA.W EquippedItems : BIT.W #$0020 : BNE .normalGravity
    JSL Get_Samus_Bottom_Boundary
    LDA.W FX_YPosition : BMI .negativeYPosition
    CMP.B DP_Temp12 : BMI .submergedInWater
    BRA .normalGravity

  .negativeYPosition:
    LDA.W FX_LavaAcidYPosition : BMI .normalGravity
    CMP.B DP_Temp12 : BMI .submergedInAcidLava

  .normalGravity:
    LDX.W #$0000
    BRA .merge

  .submergedInWater:
    LDA.W FX_LiquidOptions : BIT.W #$0004 : BNE .normalGravity
    LDX.W #$0002
    BRA .merge

  .submergedInAcidLava:
    LDX.W #$0004

  .merge:
    LDA.W EquippedItems : BIT.W #$0100 : BNE .hiJumpEquipped
    LDA.W SamusPhysicsConstants_InitialYSubSpeeds_WallJumping,X : STA.W SamusYSubSpeed
    LDA.W SamusPhysicsConstants_InitialYSpeeds_WallJumping,X : STA.W SamusYSpeed
    BRA +

  .hiJumpEquipped:
    LDA.W SamusPhysicsConstants_InitialYSubSpeeds_HiJumpWallJumping,X : STA.W SamusYSubSpeed
    LDA.W SamusPhysicsConstants_InitialYSpeeds_HiJumpWallJumping,X : STA.W SamusYSpeed

+   LDA.W EquippedItems : BIT.W #$2000 : BEQ +
    LDA.W SamusXExtraRunSpeed : LSR : STA.B DP_Temp12
    LDA.W SamusYSubSpeed : CLC : ADC.W SamusXExtraRunSubSpeed : STA.W SamusYSubSpeed
    LDA.W SamusYSpeed : CLC : ADC.B DP_Temp12 : STA.W SamusYSpeed

+   STZ.W GrappleWalljumpTimer : STZ.W CeresElevatorFadeTimer
    LDA.W #$0001 : STA.W SamusYDirection
    PLB : PLP
    RTL


;;; $99D6: Set Samus Y speed for knockback ;;;
SetSamusYSpeedForKnockback:
    PHP : PHB
    PHK : PLB
    REP #$30
    LDA.W EquippedItems : BIT.W #$0020 : BNE .inAir
    JSL Get_Samus_Bottom_Boundary
    LDA.W FX_YPosition : BMI .negativeYPosition
    CMP.B DP_Temp12 : BMI .inWater
    BRA .inAir

  .negativeYPosition:
    LDA.W FX_LavaAcidYPosition : BMI .inAir
    CMP.B DP_Temp12 : BMI .inAcidLava

  .inAir:
    LDX.W #$0000
    BRA .merge

  .inWater:
    LDA.W FX_LiquidOptions : BIT.W #$0004 : BNE .inAir
    LDX.W #$0002
    BRA .merge

  .inAcidLava:
    LDX.W #$0004

  .merge:
    LDA.W SamusPhysicsConstants_InitialYSubSpeeds_Knockback,X : STA.W SamusYSubSpeed
    LDA.W SamusPhysicsConstants_InitialYSpeeds_Knockback,X : STA.W SamusYSpeed
    STZ.W GrappleWalljumpTimer : STZ.W CeresElevatorFadeTimer
    LDA.W #$0001 : STA.W SamusYDirection
    PLB
    PLP
    RTL


;;; $9A2C: Make Samus bomb jump ;;;
Make_Samus_BombJump:
    PHP
    REP #$30
    LDA.W EquippedItems : BIT.W #$0020 : BNE .normalGravity
    JSL Get_Samus_Bottom_Boundary
    LDA.W FX_YPosition : BMI .negativeYPosition
    CMP.B DP_Temp12 : BMI .submergedInWater
    BRA .normalGravity

  .negativeYPosition:
    LDA.W FX_LavaAcidYPosition : BMI .normalGravity
    CMP.B DP_Temp12 : BMI .submergedInAcidLava

  .normalGravity:
    LDX.W #$0000
    BRA .merge

  .submergedInWater:
    LDA.W FX_LiquidOptions : BIT.W #$0004 : BNE .normalGravity
    LDX.W #$0002
    BRA .merge

  .submergedInAcidLava:
    LDX.W #$0004

  .merge:
    LDA.W SamusPhysicsConstants_InitialYSubSpeeds_BombJump,X : STA.W SamusYSubSpeed
    LDA.W SamusPhysicsConstants_InitialYSpeeds_BombJump,X : STA.W SamusYSpeed
    STZ.W GrappleWalljumpTimer : STZ.W CeresElevatorFadeTimer
    LDA.W #$0001 : STA.W SamusYDirection
    PLP
    RTS


;;; $9A7E: Calculate Samus X base speed - deceleration allowed ;;;
CalculateSamusXBaseSpeed_DecelerationAllowed:
;; Parameters:
;;     X: Samus X speed table entry pointer
;;         [[X] + 0].[[X] + 2]: X acceleration
;;         [[X] + 4].[[X] + 6]: Max X speed
;;         [[X] + 8].[[X] + Ah]: X deceleration
;; Returns:
;;     $12.$14: Samus X base speed
    PHP
    REP #$30
    LDA.W SamusXAccelerationMode : BNE .decelerating
    LDA.W SamusXBaseSubSpeed : CLC : ADC.W $0002,X : STA.W SamusXBaseSubSpeed
    LDA.W SamusXBaseSpeed : ADC.W $0000,X : STA.W SamusXBaseSpeed
    CMP.W $0004,X : BMI .return
    BEQ .checkMaxSubSpeed

  .capXSpeed:
    LDA.W $0004,X : STA.W SamusXBaseSpeed
    LDA.W $0006,X : STA.W SamusXBaseSubSpeed
    BRA .return

  .checkMaxSubSpeed:
    LDA.W SamusXBaseSubSpeed : CMP.W $0006,X : BMI .return
    BEQ .return
    BRA .capXSpeed

  .decelerating:
    SEP #$20
    LDA.W SamusXDecelerationMultiplier : BEQ .zeroMultiplier
    STA.W $4202
    LDA.W $000B,X : STA.W $4203
    NOP #3
    REP #$20
    LDA.W $4216 : STA.B DP_Temp14
    SEP #$20
    LDA.W $0008,X : STA.W $4203
    NOP #3
    REP #$20
    LDA.W $4217 : AND.W #$00FF : STA.B DP_Temp12
    BRA +

  .zeroMultiplier:
    REP #$20
    LDA.W $000A,X : STA.B DP_Temp14
    LDA.W $0008,X : STA.B DP_Temp12

+   LDA.W SamusXBaseSubSpeed : SEC : SBC.B DP_Temp14 : STA.W SamusXBaseSubSpeed
    LDA.W SamusXBaseSpeed : SBC.B DP_Temp12 : STA.W SamusXBaseSpeed : BPL .return
    STZ.W SamusXBaseSpeed : STZ.W SamusXBaseSubSpeed
    STZ.W SamusXAccelerationMode

  .return:
    LDA.W SamusXBaseSpeed : STA.B DP_Temp12
    LDA.W SamusXBaseSubSpeed : STA.B DP_Temp14
    PLP
    RTS


;;; $9B1F: Calculate Samus X base speed - deceleration disallowed ;;;
CalculateSamusXBaseSpeed_DecelerationDisallowed:
;; Parameters:
;;     X: Samus X speed table entry pointer
;;         [[X] + 0].[[X] + 2]: X acceleration
;;         [[X] + 4].[[X] + 6]: Max X speed
;;         [[X] + 8].[[X] + Ah]: X deceleration
;; Returns:
;;     Carry: Set if reached max X speed, otherwise clear
;;     $12.$14: Samus X base speed
    PHP
    REP #$30
    LDA.W SamusXAccelerationMode : BIT.W #$0001 : BNE .turningAround
    LDA.W SamusXBaseSubSpeed : CLC : ADC.W $0002,X : STA.W SamusXBaseSubSpeed
    LDA.W SamusXBaseSpeed : ADC.W $0000,X : STA.W SamusXBaseSpeed
    CMP.W $0004,X : BMI .returnClear
    BEQ .checkMaxSubSpeed

  .capXSpeed:
    LDA.W $0004,X : STA.W SamusXBaseSpeed
    LDA.W $0006,X : STA.W SamusXBaseSubSpeed
    BRA .returnSet

  .checkMaxSubSpeed:
    LDA.W SamusXBaseSubSpeed : CMP.W $0006,X : BMI .returnClear
    BEQ .returnClear
    BRA .capXSpeed

  .turningAround:
    SEP #$20
    LDA.W SamusXDecelerationMultiplier : BEQ .zeroMultiplier
    STA.W $4202
    LDA.W $000B,X : STA.W $4203
    NOP #3
    REP #$20
    LDA.W $4216 : STA.B DP_Temp14
    SEP #$20
    LDA.W $0008,X : STA.W $4203
    NOP #3
    REP #$20
    LDA.W $4217 : AND.W #$00FF : STA.B DP_Temp12
    BRA +

  .zeroMultiplier:
    REP #$20
    LDA.W $000A,X : STA.B DP_Temp14
    LDA.W $0008,X : STA.B DP_Temp12

+   LDA.W SamusXBaseSubSpeed : SEC : SBC.B DP_Temp14 : STA.W SamusXBaseSubSpeed
    LDA.W SamusXBaseSpeed : SBC.B DP_Temp12 : STA.W SamusXBaseSpeed : BPL .returnClear
    STZ.W SamusXBaseSpeed : STZ.W SamusXBaseSubSpeed
    STZ.W SamusXAccelerationMode

  .returnClear:
    LDA.W SamusXBaseSpeed : STA.B DP_Temp12
    LDA.W SamusXBaseSubSpeed : STA.B DP_Temp14
    PLP
    CLC
    RTS

  .returnSet:
    LDA.W SamusXBaseSpeed : STA.B DP_Temp12
    LDA.W SamusXBaseSubSpeed : STA.B DP_Temp14
    PLP
    SEC
    RTS


;;; $9BD1: Determine Samus X speed table entry pointer ;;;
Determine_SamusXSpeedTable_EntryPointer:
;; Returns:
;;     X: Samus X speed table entry pointer
    PHP
    REP #$30
    LDA.W EquippedItems : BIT.W #$0020 : BNE .gotoSpeedTableSet
    JSL Get_Samus_Bottom_Boundary
    LDA.W FX_YPosition : BMI .negativeYPosition
    CMP.B DP_Temp12 : BMI .submergedInWater
    BRA .gotoSpeedTableSet

  .negativeYPosition:
    LDA.W FX_LavaAcidYPosition : BMI .gotoSpeedTableSet
    CMP.B DP_Temp12 : BMI .submergedInAcidLava

  .gotoSpeedTableSet:
    BRA .speedTableSet

  .submergedInWater:
    LDA.W FX_LiquidOptions : BIT.W #$0004 : BNE .gotoSpeedTableSet
    LDA.W #SamusXSpeedTable_InWater : STA.W XSpeedTablePointer
    BRA .speedTableSet

  .submergedInAcidLava:
    LDA.W #SamusXSpeedTable_InLavaAcid : STA.W XSpeedTablePointer

  .speedTableSet:
    LDA.W MovementType : AND.W #$00FF : STA.B DP_Temp14
    ASL : CLC : ADC.B DP_Temp14 : ASL #2
    CLC : ADC.W XSpeedTablePointer : TAX
    PLP
    RTS


;;; $9C21: Determine grapple swing Samus X speed table entry pointer ;;;
DetermineGrappleSwing_SamusXSpeedTable_EntryPointer:
;; Returns:
;;     X: Samus X speed table entry pointer
    PHP
    REP #$30
    LDA.W EquippedItems : BIT.W #$0020 : BNE .normalGravity
    JSL Get_Samus_Bottom_Boundary
    LDA.W FX_YPosition : BMI .negativeYPosition
    CMP.B DP_Temp12 : BMI .submergedInWater
    BRA .normalGravity

  .negativeYPosition:
    LDA.W FX_LavaAcidYPosition : BMI .normalGravity
    CMP.B DP_Temp12 : BMI .submergedInAcidLava

  .normalGravity:
    LDX.W #SamusPhysicsConstants_XAccelSpeeds_DisconnectGrappleInAir
    BRA .return

  .submergedInWater:
    LDA.W FX_LiquidOptions : BIT.W #$0004 : BNE .normalGravity
    LDX.W #SamusPhysicsConstants_XAccelSpeeds_DisconnectGrappleInWater
    BRA .return

  .submergedInAcidLava:
    LDX.W #SamusPhysicsConstants_XAccelSpeeds_DisconnectGrappleInLavaAcid

  .return:
    PLP
    RTS


;;; $9C5B: Determine Samus Y acceleration ;;;
Determine_Samus_YAcceleration:
    LDA.W EquippedItems : BIT.W #$0020 : BNE .notSubmerged
    JSL Get_Samus_Bottom_Boundary
    LDA.W FX_YPosition : BMI .negativeYPosition
    CMP.B DP_Temp12 : BMI .submergedInWater
    BRA .notSubmerged

  .negativeYPosition:
    LDA.W FX_LavaAcidYPosition : BMI .notSubmerged
    CMP.B DP_Temp12 : BMI .submergedInAcidLava

  .notSubmerged:
    LDA.W SamusPhysicsConstants_YSubAccelerationInAir : STA.W SamusYSubAcceleration
    LDA.W SamusPhysicsConstants_YAccelerationInAir : STA.W SamusYAcceleration
    BRA .return

  .submergedInWater:
    LDA.W FX_LiquidOptions : BIT.W #$0004 : BNE .notSubmerged
    LDA.W SamusPhysicsConstants_YSubAccelerationInWater : STA.W SamusYSubAcceleration
    LDA.W SamusPhysicsConstants_YAccelerationInWater : STA.W SamusYAcceleration
    BRA .return

  .submergedInAcidLava:
    LDA.W SamusPhysicsConstants_YSubAccelerationInAcidLava : STA.W SamusYSubAcceleration
    LDA.W SamusPhysicsConstants_YAccelerationInAcidLava : STA.W SamusYAcceleration

  .return:
    RTS


;;; $9CAC: Grapple wall jump check ;;;
Grapple_WallJump_Check:
;; Parameters:
;;     $12.$14: Distance to check for collision
;; Returns:
;;     Carry: Set if wall jump triggered, clear otherwise
    PHP : PHB
    PHK : PLB
    REP #$30
    LDA.W #$FFFF : STA.W EnemyIndexToShake
    LDA.W PoseXDirection : AND.W #$00FF : CMP.W #$0004 : BEQ .facingLeft
    CMP.W #$0008 : BEQ .facingRight

  .gotoReturnCarryClear:
    JMP .returnCarryClear

  .facingRight:
    LDA.W #$0001 : STA.W CollisionMovementDirection
    JSL Samus_vs_SolidEnemy_CollisionDetection
    TAX : BNE .checkJump
    JSL WallJumpBlockCollisionDetection
    BCC .gotoReturnCarryClear
    LDA.B DP_Controller1New : BIT.W JumpBinding : BNE .returnCarrySet
    JMP .returnCarryClear

  .checkJump:
    LDA.B DP_Controller1New : BIT.W JumpBinding : BNE .wallJumpEnemy
    BRA .returnCarryClear

  .facingLeft:
    STZ.W CollisionMovementDirection
    JSL Samus_vs_SolidEnemy_CollisionDetection
    TAX : BNE .collisionDetected
    LDA.B DP_Temp12 : EOR.W #$FFFF : STA.B DP_Temp12
    LDA.B DP_Temp14 : EOR.W #$FFFF : INC : STA.B DP_Temp14 : BNE .wallJumpCollision
    INC.B DP_Temp12

  .wallJumpCollision:
    JSL WallJumpBlockCollisionDetection
    BCC .returnCarryClear
    LDA.B DP_Controller1New : BIT.W JumpBinding : BNE .returnCarrySet
    BRA .returnCarryClear

  .collisionDetected:
    LDA.B DP_Controller1New : BIT.W JumpBinding : BEQ .returnCarryClear

  .wallJumpEnemy:
    LDA.B DP_Temp16 : STA.W EnemyIndexToShake
    PLB : PLP
    SEC
    RTL

  .returnCarrySet:
    PLB : PLP
    SEC
    RTL

  .returnCarryClear:
    PLB : PLP
    CLC
    RTL


;;; $9D35: Wall jump check ;;;
WallJump_Check:
;; Parameters:
;;     $12.$14: Distance to check for collision
;; Returns:
;;     Carry: Set if wall jump triggered, clear otherwise
    PHP
    REP #$30
    LDA.W LastDifferentPoseMovementType : AND.W #$00FF : CMP.W #$0003 : BEQ .spinJumping
    CMP.W #$0014 : BNE .carryClearReturn

  .spinJumping:
    LDA.W Pose : CMP.W #$0081 : BEQ .screwAttack
    CMP.W #$0082 : BEQ .screwAttack
    LDA.W SamusAnimationFrame : CMP.W #$000B : BMI .spinningAnimation
    JMP .wallJumpEligibleAnimation

  .screwAttack:
    LDA.W SamusAnimationFrame : CMP.W #$001B : BMI .spinningAnimation
    JMP .wallJumpEligibleAnimation

  .spinningAnimation:
    LDA.B DP_Controller1Input : BIT.W #$0200 : BNE .spinningPressingLeft
    BIT.W #$0100 : BNE .spinningPressingRight

  .carryClearReturn:
    PLP
    CLC
    RTS

  .spinningPressingLeft:
    LDA.W #$0001 : STA.W CollisionMovementDirection
    JSL Samus_vs_SolidEnemy_CollisionDetection
    TAX : BNE .collisionDetected
    JSL WallJumpBlockCollisionDetection
    BCC .carryClearReturn
    BRA .collisionDetected

  .spinningPressingRight:
    STZ.W CollisionMovementDirection
    JSL Samus_vs_SolidEnemy_CollisionDetection
    TAX : BNE .collisionDetected
    LDA.B DP_Temp12 : EOR.W #$FFFF : STA.B DP_Temp12
    LDA.B DP_Temp14 : EOR.W #$FFFF : INC : STA.B DP_Temp14 : BNE .wallJumpCollisionDetection
    INC.B DP_Temp12

  .wallJumpCollisionDetection:
    JSL WallJumpBlockCollisionDetection
    BCC .carryClearReturn

  .collisionDetected:
    LDA.W Pose : CMP.W #$0081 : BEQ .screwAttackPose
    CMP.W #$0082 : BEQ .screwAttackPose
    LDA.W #$0001 : STA.W SamusAnimationFrameTimer
    LDA.W #$000A : STA.W SamusAnimationFrame
    JMP .carryClearReturn

  .screwAttackPose:
    LDA.W #$0001 : STA.W SamusAnimationFrameTimer
    LDA.W #$001A : STA.W SamusAnimationFrame
    JMP .carryClearReturn

  .wallJumpEligibleAnimation:
    LDA.W #$FFFF : STA.W EnemyIndexToShake
    LDA.B DP_Controller1Input : BIT.W #$0200 : BNE .wallJumpEligiblePressingLeft
    BIT.W #$0100 : BNE .wallJumpEligiblePressingRight

  .gotoReturnCarryClear:
    JMP .returnCarryClear

  .wallJumpEligiblePressingLeft:
    LDA.W #$0001 : STA.W CollisionMovementDirection
    JSL Samus_vs_SolidEnemy_CollisionDetection
    TAX : BNE .collision
    JSL WallJumpBlockCollisionDetection
    BCC .gotoReturnCarryClear
    LDA.B DP_Controller1New : BIT.W JumpBinding : BNE .wallJumpBlock
    JMP .returnCarryClear

  .collision:
    LDA.B DP_Controller1New : BIT.W JumpBinding : BNE .wallJumpEnemy
    BRA .returnCarryClear

  .wallJumpEligiblePressingRight:
    STZ.W CollisionMovementDirection
    JSL Samus_vs_SolidEnemy_CollisionDetection
    TAX : BNE .leftCollisionDetected
    LDA.B DP_Temp12 : EOR.W #$FFFF : STA.B DP_Temp12
    LDA.B DP_Temp14 : EOR.W #$FFFF : INC : STA.B DP_Temp14 : BNE .wallJumpBlockCollisionDetection
    INC.B DP_Temp12

  .wallJumpBlockCollisionDetection:
    JSL WallJumpBlockCollisionDetection
    BCC .returnCarryClear
    LDA.B DP_Controller1New : BIT.W JumpBinding : BNE .wallJumpBlock
    BRA .returnCarryClear

  .leftCollisionDetected:
    LDA.B DP_Controller1New : BIT.W JumpBinding : BEQ .returnCarryClear

  .wallJumpEnemy:
    LDA.W #$0000 : BEQ .checkDistanceEnemy
    LDA.B DP_Temp12 : CMP.W #$0005 : BMI .returnCarryClear

  .checkDistanceEnemy:
    LDA.B DP_Temp12 : CMP.W #$0008 : BPL .returnCarryClear
    LDA.W #$0005 : STA.W SamusSolidVerticalCollisionResult
    LDA.B DP_Temp16 : STA.W EnemyIndexToShake
    PLP
    SEC
    RTS

  .wallJumpBlock:
    LDA.W #$0000 : BEQ .checkDistanceBlock
    LDA.B DP_Temp12 : CMP.W #$0005 : BMI .returnCarryClear

  .checkDistanceBlock:
    LDA.B DP_Temp12 : CMP.W #$0008 : BPL .returnCarryClear
    LDA.W #$0005 : STA.W SamusSolidVerticalCollisionResult
    PLP
    SEC
    RTS

  .returnCarryClear:
    PLP
    CLC
    RTS


;;; $9E8B: Samus physics constants ;;;
SamusPhysicsConstants:
  .LavaSubDamagePerFrame:
; Lava subdamage per frame
    dw $8000

  .LavaDamagePerFrame:
; Lava damage per frame
    dw $0000

  .AcidSubDamagePerFrame:
; Acid subdamage per frame
    dw $8000

  .AcidDamagePerFrame:
; Acid damage per frame
    dw $0001

  .AnimationDelayInWater:
; Samus animation delay in water
    dw $0003

  .AnimationDelayInLavaAcid:
; Samus animation delay in lava/acid
    dw $0002

  .SpaceJumpMinimumYVelocityInAir:
; Space jump minimum Y velocity in air * 100h
    dw $0280

  .SpaceJumpMaximumYVelocityInAir:
; Space jump maximum Y velocity in air * 100h
    dw $0500

  .SpaceJumpMinimumYVelocityInWater:
; Space jump minimum Y velocity in water * 100h
    dw $0080

  .SpaceJumpMaximumYVelocityInWater:
; Space jump maximum Y velocity in water * 100h
    dw $0500

  .MaximumDistanceFromWallForWallJump:
; Maximum distance from wall for wall-jump
    dw $0008

  .YSubAccelerationInAir:
; Samus Y subacceleration in air
    dw $1C00

  .YSubAccelerationInWater:
; Samus Y subacceleration in water
    dw $0800

  .YSubAccelerationInAcidLava:
; Samus Y subacceleration in acid/lava
    dw $0900

  .YAccelerationInAir:
; Samus Y acceleration in air
    dw $0000

  .YAccelerationInWater:
; Samus Y acceleration in water
    dw $0000

  .YAccelerationInAcidLava:
; Samus Y acceleration in acid/lava
    dw $0000

  .CameraXOffsetFromSamusWhenTurning:
; Camera X offset from Samus when turning
    dw $0001

  .CameraXSubOffsetFromSamusWhenTurning:
; Camera X suboffset from Samus when turning
    dw $0000

  .CameraYOffsetFromSamusWhenTurning:
; Camera Y offset from Samus when turning
    dw $0001

  .CameraYSubOffsetFromSamusWhenTurning:
; Camera Y suboffset from Samus when turning
    dw $0000

  .YSpeedWhenBouncingInMorphBall:
; Samus Y speed when bouncing in morph ball
    dw $0001

  .YSubSpeedWhenBouncingInMorphBall:
; Samus Y subspeed when bouncing in morph ball
    dw $0000

  .InitialYSpeeds_Jumping:
    dw $0004,$0001,$0002

  .InitialYSubSpeeds_Jumping:
    dw $E000,$C000,$C000

  .InitialYSpeeds_HiJumpJumping:
    dw $0006,$0002,$0003

  .InitialYSubSpeeds_HiJumpJumping:
    dw $0000,$8000,$8000

  .InitialYSpeeds_WallJumping:
    dw $0004,$0000,$0002

  .InitialYSubSpeeds_WallJumping:
    dw $A000,$4000,$A000

  .InitialYSpeeds_HiJumpWallJumping:
    dw $0005,$0000,$0003

  .InitialYSubSpeeds_HiJumpWallJumping:
    dw $8000,$8000,$8000

  .InitialYSpeeds_Knockback:
    dw $0005,$0002,$0002

  .InitialYSubSpeeds_Knockback:
    dw $0000,$0000,$0000

  .InitialYSpeeds_BombJump:
    dw $0002,$0000,$0000

  .InitialYSubSpeeds_BombJump:
    dw $C000,$1000,$1000

  .XAccelerations_DashHeld:
    dw $0000,$0000,$0000

  .XSubAccelerations_DashHeld:
    dw $1000,$0400,$0400

  .MaxXExtraRunSpeeds_SpeedBooster:
    dw $0007,$0004,$0004

  .MaxXExtraRunSubSpeeds_SpeedBooster:
    dw $0000,$0000,$0000

  .MaxXExtraRunSpeeds_NoSpeedBooster_0:
    dw $0002,$0001,$0000

  .MaxXExtraRunSpeeds_NoSpeedBooster_1:
    dw $0000,$0000,$0000

  .XAccelSpeeds_DiagonalBombJump:
    dw $0000,$3000,$0003,$0000,$0000,$0800

  .XAccelSpeeds_DisconnectGrappleInAir:
    dw $0000,$3000,$000F,$0000,$0000,$1000

  .XAccelSpeeds_DisconnectGrappleInWater:
    dw $0000,$3000,$000F,$0000,$0000,$1000

  .XAccelSpeeds_DisconnectGrappleInLavaAcid:
    dw $0000,$3000,$000F,$0000,$0000,$1000


;;; $9F55: Samus X speed table - normal ;;;
SamusXSpeedTable_Normal:
; Used for Samus X base speed (due to general movement)

;        _________________________________ X acceleration
;       |      ___________________________ X subacceleration
;       |     |      _____________________ Max X speed
;       |     |     |      _______________ Max X subspeed
;       |     |     |     |      _________ X deceleration
;       |     |     |     |     |      ___ X subdeceleration
;       |     |     |     |     |     |
    dw $0000,$C000,$0000,$0000,$0000,$8000 ; 0: Standing
    dw $0000,$3000,$0002,$C000,$0000,$8000 ; 1: Running
    dw $0000,$C000,$0001,$4000,$0000,$8000 ; 2: Normal jumping
    dw $0000,$C000,$0001,$6000,$0000,$8000 ; 3: Spin jumping
    dw $0000,$C000,$0003,$4000,$0000,$8000 ; 4: Morph ball - on ground
    dw $0000,$C000,$0000,$0000,$0000,$8000 ; 5: Crouching
    dw $0000,$C000,$0001,$0000,$0000,$8000 ; 6: Falling
    dw $0002,$0000,$0001,$0000,$0000,$8000 ; 7: Unused
    dw $0000,$C000,$0001,$0000,$0000,$8000 ; 8: Morph ball - falling
    dw $0002,$0000,$0002,$0000,$0000,$8000 ; 9: Unused
    dw $0001,$8000,$0005,$0000,$0000,$8000 ; Ah: Knockback / crystal flash ending
    dw $0000,$C000,$0000,$0000,$0000,$8000 ; Bh: Unused
    dw $0000,$C000,$0000,$0000,$0000,$8000 ; Ch: Unused
    dw $0000,$C000,$0002,$0000,$0000,$8000 ; Dh: Unused
    dw $0000,$C000,$0000,$0000,$0000,$8000 ; Eh: Turning around - on ground
    dw $0000,$C000,$0001,$4000,$0000,$8000 ; Fh: Crouching/standing/morphing/unmorphing transition
    dw $0000,$C000,$0000,$8000,$0000,$8000 ; 10h: Moonwalking
    dw $0000,$C000,$0003,$4000,$0000,$8000 ; 11h: Spring ball - on ground
    dw $0000,$C000,$0001,$4000,$0000,$8000 ; 12h: Spring ball - in air
    dw $0000,$C000,$0001,$0000,$0000,$8000 ; 13h: Spring ball - falling
    dw $0000,$C000,$0001,$6000,$0000,$8000 ; 14h: Wall jumping
    dw $0000,$C000,$0000,$0000,$0000,$8000 ; 15h: Ran into a wall
    dw $0000,$C000,$0001,$4000,$0000,$8000 ; 16h: Grappling
    dw $0000,$C000,$0000,$0000,$0000,$8000 ; 17h: Turning around - jumping
    dw $0000,$C000,$0000,$0000,$0000,$8000 ; 18h: Turning around - falling
    dw $0000,$C000,$0005,$0000,$0000,$8000 ; 19h: Damage boost


;;; $A08D: Samus X speed table - in water ;;;
SamusXSpeedTable_InWater:
; Used for Samus X base speed (due to general movement)

;        _________________________________ X acceleration
;       |      ___________________________ X subacceleration
;       |     |      _____________________ Max X speed
;       |     |     |      _______________ Max X subspeed
;       |     |     |     |      _________ X deceleration
;       |     |     |     |     |      ___ X subdeceleration
;       |     |     |     |     |     |
    dw $0000,$C000,$0000,$0000,$0000,$0800 ; 0: Standing
    dw $0000,$0400,$0002,$C000,$0000,$0800 ; 1: Running
    dw $0000,$C000,$0001,$4000,$0000,$0800 ; 2: Normal jumping
    dw $0000,$C000,$0001,$6000,$0000,$0800 ; 3: Spin jumping
    dw $0000,$0400,$0002,$C000,$0000,$0800 ; 4: Morph ball - on ground
    dw $0000,$C000,$0000,$0000,$0000,$0800 ; 5: Crouching
    dw $0000,$C000,$0001,$0000,$0000,$0800 ; 6: Falling
    dw $0002,$0000,$0001,$0000,$0000,$0800 ; 7: Unused
    dw $0000,$0400,$0001,$8000,$0000,$0800 ; 8: Morph ball - falling
    dw $0002,$0000,$0002,$0000,$0000,$0800 ; 9: Unused
    dw $0001,$8000,$0005,$0000,$0000,$0800 ; Ah: Knockback / crystal flash ending
    dw $0000,$C000,$0000,$0000,$0000,$0800 ; Bh: Unused
    dw $0000,$C000,$0000,$0000,$0000,$0800 ; Ch: Unused
    dw $0000,$C000,$0002,$0000,$0000,$0800 ; Dh: Unused
    dw $0000,$C000,$0000,$0000,$0000,$0800 ; Eh: Turning around - on ground
    dw $0000,$C000,$0001,$4000,$0000,$0800 ; Fh: Crouching/standing/morphing/unmorphing transition
    dw $0000,$C000,$0000,$8000,$0000,$0800 ; 10h: Moonwalking
    dw $0000,$0400,$0002,$C000,$0000,$0800 ; 11h: Spring ball - on ground
    dw $0000,$0400,$0001,$4000,$0000,$0800 ; 12h: Spring ball - in air
    dw $0000,$0400,$0001,$8000,$0000,$0800 ; 13h: Spring ball - falling
    dw $0000,$C000,$0001,$6000,$0000,$0800 ; 14h: Wall jumping
    dw $0000,$C000,$0000,$0000,$0000,$0800 ; 15h: Ran into a wall
    dw $0000,$C000,$0001,$4000,$0000,$0800 ; 16h: Grappling
    dw $0000,$C000,$0000,$0000,$0000,$0800 ; 17h: Turning around - jumping
    dw $0000,$C000,$0000,$0000,$0000,$0800 ; 18h: Turning around - falling
    dw $0000,$C000,$0000,$8000,$0000,$0800 ; 19h: Damage boost
    dw $0000,$C000,$0005,$0000,$0000,$0800 ; 1Ah: Grabbed by Draygon
    dw $0000,$C000,$0005,$0000,$0000,$0800 ; 1Bh: Shinespark / crystal flash / drained by metroid / damaged by MB's attacks


;;; $A1DD: Samus X speed table - in lava/acid ;;;
SamusXSpeedTable_InLavaAcid:
; Used for Samus X base speed (due to general movement)

;        _________________________________ X acceleration
;       |      ___________________________ X subacceleration
;       |     |      _____________________ Max X speed
;       |     |     |      _______________ Max X subspeed
;       |     |     |     |      _________ X deceleration
;       |     |     |     |     |      ___ X subdeceleration
;       |     |     |     |     |     |
    dw $0000,$C000,$0000,$0000,$0000,$4000 ; 0: Standing
    dw $0000,$0400,$0001,$C000,$0000,$4000 ; 1: Running
    dw $0000,$C000,$0001,$4000,$0000,$4000 ; 2: Normal jumping
    dw $0000,$C000,$0001,$6000,$0000,$4000 ; 3: Spin jumping
    dw $0000,$0400,$0002,$C000,$0000,$4000 ; 4: Morph ball - on ground
    dw $0000,$C000,$0000,$0000,$0000,$4000 ; 5: Crouching
    dw $0000,$C000,$0001,$0000,$0000,$4000 ; 6: Falling
    dw $0002,$0000,$0001,$0000,$0000,$4000 ; 7: Unused
    dw $0000,$0400,$0001,$6000,$0000,$4000 ; 8: Morph ball - falling
    dw $0002,$0000,$0002,$0000,$0000,$4000 ; 9: Unused
    dw $0001,$8000,$0005,$0000,$0000,$4000 ; Ah: Knockback / crystal flash ending
    dw $0000,$C000,$0000,$0000,$0000,$4000 ; Bh: Unused
    dw $0000,$C000,$0000,$0000,$0000,$4000 ; Ch: Unused
    dw $0000,$C000,$0002,$0000,$0000,$4000 ; Dh: Unused
    dw $0000,$C000,$0000,$0000,$0000,$4000 ; Eh: Turning around - on ground
    dw $0000,$C000,$0001,$4000,$0000,$4000 ; Fh: Crouching/standing/morphing/unmorphing transition
    dw $0000,$C000,$0000,$8000,$0000,$4000 ; 10h: Moonwalking
    dw $0000,$0400,$0002,$C000,$0000,$4000 ; 11h: Spring ball - on ground
    dw $0000,$0400,$0001,$4000,$0000,$4000 ; 12h: Spring ball - in air
    dw $0000,$0400,$0001,$6000,$0000,$4000 ; 13h: Spring ball - falling
    dw $0000,$C000,$0001,$6000,$0000,$4000 ; 14h: Wall jumping
    dw $0000,$C000,$0000,$0000,$0000,$4000 ; 15h: Ran into a wall
    dw $0000,$C000,$0001,$4000,$0000,$4000 ; 16h: Grappling
    dw $0000,$C000,$0000,$0000,$0000,$4000 ; 17h: Turning around - jumping
    dw $0000,$C000,$0000,$0000,$0000,$4000 ; 18h: Turning around - falling
    dw $0000,$C000,$0000,$8000,$0000,$4000 ; 19h: Damage boost
    dw $0000,$C000,$0005,$0000,$0000,$4000 ; 1Ah: Grabbed by Draygon
    dw $0000,$C000,$0005,$0000,$0000,$4000 ; 1Bh: Shinespark / crystal flash / drained by metroid / damaged by MB's attacks


;;; $A32D: Samus movement - movement type 7 (unused) ;;;
UNUSED_SamusMovement_7_90A32D:
    PHP
    REP #$30
    STZ.W SamusSolidVerticalCollisionResult
    PLP
    RTS


if !FEATURE_KEEP_UNREFERENCED
;;; $A335: Unused ;;;
UNUSED_90A335:
    dw $001E
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $A337: Samus movement handler - normal ;;;
SamusMovementHandler_Normal:
; Cause of elevator blue suit
    LDA.W TimeIsFrozenFlag : BNE .return
    LDA.W MovementType : AND.W #$00FF : ASL : TAX
    JSR.W (.pointers,X)
    JSR UpdateSamusEchoPosition

  .return:
    RTS

  .pointers:
    dw SamusMovement_Standing                                            ; 0: Standing
    dw SamusMovement_Running                                             ; 1: Running
    dw SamusMovement_Jumping                                             ; 2: Normal jumping
    dw SamusMovement_SpinJumping                                         ; 3: Spin jumping
    dw SamusMovement_MorphBall_OnGround                                  ; 4: Morph ball - on ground
    dw SamusMovement_Crouching                                           ; 5: Crouching
    dw SamusMovement_Falling                                             ; 6: Falling
    dw UNUSED_SamusMovement_7_90A32D                                     ; 7: Unused
    dw SamusMovement_MorphBall_Falling                                   ; 8: Morph ball - falling
    dw UNUSED_RTS_90A5FB                                                 ; 9: Unused
    dw SamusMovement_Knockback_CrystalFlashEnding                        ; Ah: Knockback / crystal flash ending
    dw UNUSED_SamusMovement_B_90A607                                     ; Bh: Unused
    dw UNUSED_SamusMovement_C_90A60F                                     ; Ch: Unused
    dw UNUSED_SamusMovement_D_90A617                                     ; Dh: Unused
    dw SamusMovement_TurningAround_OnGround                              ; Eh: Turning around - on ground
    dw SamusMovement_TransitionPoses                                     ; Fh: Crouching/standing/morphing/unmorphing transition
    dw SamusMovement_Moonwalking                                         ; 10h: Moonwalking
    dw SamusMovement_SpringBall_OnGround                                 ; 11h: Spring ball - on ground
    dw SamusMovement_SpringBall_InAir                                    ; 12h: Spring ball - in air
    dw SamusMovement_SpringBall_Falling                                  ; 13h: Spring ball - falling
    dw SamusMovement_WallJumping                                         ; 14h: Wall jumping
    dw SamusMovement_RanIntoAWall                                        ; 15h: Ran into a wall
    dw SamusMovement_Grappling                                           ; 16h: Grappling
    dw SamusMovement_TurningAround_Jumping                               ; 17h: Turning around - jumping
    dw SamusMovement_TurningAround_Falling                               ; 18h: Turning around - falling
    dw SamusMovement_DamageBoost                                         ; 19h: Damage boost
    dw SamusMovement_GrabbedByDraygon                                    ; 1Ah: Grabbed by Draygon
    dw SamusMovement_Shinespark_CF_Drained_DamagedByMotherBrain          ; 1Bh: Shinespark / crystal flash / drained by metroid / damaged by MB's attacks


;;; $A383: Samus movement - standing ;;;
SamusMovement_Standing:
; The fact that MoveSamus_HorizontallyWithZeroBaseXSpeed is called is what allows the shinespark -> suit pickup to move Samus horizontally,
; only her base X speed is set to 0 for the purposes of these calculations, her X extra run speed is taken into account
; (extra X displacement is also taken into account)
    PHP
    REP #$30
    LDA.W Pose : BEQ .facingForward
    CMP.W #$009B : BEQ .facingForward
    BRA .notFacingForward

  .facingForward:
    LDA.W ElevatorStatus : BEQ .noChange
    LDA.W #$0002 : STA.W CollisionMovementDirection
    LDA.W #$0001 : STA.B DP_Temp12
    STZ.B DP_Temp14
    JSL MoveSamusDown_NoSolidEnemyCollision

  .noChange:
    STZ.W SamusSolidVerticalCollisionResult
    BRA .return

  .notFacingForward:
    LDA.W Pose : CMP.W #$0001 : BEQ .checkPressingShot
    CMP.W #$0002 : BNE .moveSamus

  .checkPressingShot:
    LDA.B DP_Controller1Input : BIT.W ShotBinding : BEQ .moveSamus
    LDA.W #$0010 : STA.W SamusAnimationFrameTimer
    STZ.W SamusAnimationFrame

  .moveSamus:
    JSR MoveSamus_HorizontallyWithZeroBaseXSpeed
    JSR Samus_Y_Movement_NoSpeedCalculations
    JSL Cancel_SpeedBoosting
    STZ.W SamusXExtraRunSpeed : STZ.W SamusXExtraRunSubSpeed
    STZ.W SamusXBaseSpeed : STZ.W SamusXBaseSubSpeed
    STZ.W SamusXAccelerationMode

  .return:
    PLP
    RTS


;;; $A3E5: Samus movement - running ;;;
SamusMovement_Running:
    PHP
    REP #$30
    JSR Samus_X_Movement
    JSR Samus_Y_Movement_NoSpeedCalculations
    LDX.W SamusAnimationFrame
    LDA.W SamusAnimationFrameTimer : CMP.W #$0001 : BNE .return
    LDA.W .frames,X : AND.W #$00FF : BEQ .return
    JSR FootstepGraphics
    LDA.W CinematicFunction : BNE .return
    LDA.W BossID : BNE .return
    LDA.W SpecialPaletteTimer : BNE .return
    LDA.W SamusBoostTimer : BIT.W #$0400 : BNE .return
    LDA.W #$0006
    JSL QueueSound_Lib3_Max6

  .return:
    PLP
    RTS

  .frames:
; Presumably these frames correspond to the points when Samus' foot hits the ground
    db $00,$00,$01,$00,$00,$00,$00,$01,$00,$00


;;; $A42E: Samus movement - normal jumping ;;;
SamusMovement_Jumping:
    PHP
    REP #$30
    JSR Samus_Jumping_Movement
    PLP
    RTS


;;; $A436: Samus movement - spin jumping ;;;
SamusMovement_SpinJumping:
; Handles space jump
    PHP
    REP #$30
    LDA.W SuitPaletteIndex : BIT.W #$0004 : BNE .nonLiquidPhysics
    JSL Get_Samus_BottomTop_Boundary
    LDA.W FX_YPosition : BMI .negativeYPosition
    CMP.B DP_Temp14 : BPL .nonLiquidPhysics
    LDA.W FX_LiquidOptions : BIT.W #$0004 : BNE .nonLiquidPhysics
    BRA +

  .negativeYPosition:
    LDA.W FX_LavaAcidYPosition : BMI .nonLiquidPhysics
    CMP.B DP_Temp14 : BPL .nonLiquidPhysics

+   LDA.W #$0001 : STA.B DP_Temp12
    BRA .determinedLiquidPhysics

  .nonLiquidPhysics:
    STZ.B DP_Temp12

  .determinedLiquidPhysics:
    LDA.B DP_Temp12 : BNE .liquidPhysics
    LDA.W EquippedItems : BIT.W #$0200 : BNE .spaceJumpEligible
    LDA.W Pose : CMP.W #$0081 : BEQ .gotoScrewAttack
    CMP.W #$0082 : BEQ .gotoScrewAttack
    BRA .liquidPhysics

  .gotoScrewAttack:
    JMP .screwAttack

  .spaceJumpEligible:
    LDA.W SamusYDirection : CMP.W #$0002 : BNE .screwAttackEligible
    LDA.W LiquidPhysicsType : BEQ .airPhysics
    LDA.W SamusYSpeedCombined : CMP.W SamusPhysicsConstants_SpaceJumpMinimumYVelocityInWater : BMI .screwAttackEligible
    CMP.W SamusPhysicsConstants_SpaceJumpMaximumYVelocityInWater : BPL .screwAttackEligible
    BRA +

  .airPhysics:
    LDA.W SamusYSpeedCombined : CMP.W SamusPhysicsConstants_SpaceJumpMinimumYVelocityInAir : BMI .screwAttackEligible
    CMP.W SamusPhysicsConstants_SpaceJumpMaximumYVelocityInAir : BPL .screwAttackEligible

+   LDA.W neverRead0DFA : AND.W #$FF00 : ORA.W #$0001 : STA.W neverRead0DFA
    LDA.B DP_Controller1New : AND.W JumpBinding : BEQ .screwAttackEligible
    JSL Make_Samus_Jump

  .screwAttackEligible:
    LDA.W Pose : CMP.W #$0081 : BEQ .screwAttack
    CMP.W #$0082 : BEQ .screwAttack
    BRA .liquidPhysics ; >.<

  .liquidPhysics:
    LDA.B DP_Temp12 : BEQ +
    LDX.W SamusAnimationFrame
    LDA.W SamusAnimationFrameTimer : CMP.W #$0001 : BNE +
    LDA.W .framesSFX,X : AND.W #$00FF : BEQ +
    LDA.W #$002F
    JSL QueueSound_Lib1_Max6

+   LDA.W SamusProjectile_FlareCounter : CMP.W #$003C : BMI .return
    LDA.B DP_Temp12 : BNE .return
    LDA.W #$0004 : STA.W ContactDamageIndex
    BRA .return

  .screwAttack:
    LDA.W #$0003 : STA.W ContactDamageIndex

  .return:
    JSR Samus_SpinJumping_Movement
    PLP
    RTS

  .framesSFX:
; Samus animation frames on which to play underwater space jump sound effect
    db $01,$00,$00,$00,$00,$00,$00,$00,$01,$00,$00,$00,$00


;;; $A521: Samus movement - morph ball - on ground ;;;
SamusMovement_MorphBall_OnGround:
    PHP
    REP #$30
    LDA.W SamusXAccelerationMode : BNE .decelerating
    LDA.W PoseXDirection : AND.W #$00FF : CMP.W #$0004 : BEQ .facingLeft
    LDA.W Pose : CMP.W #$001D : BNE .decelerating
    BRA .moveSamus

  .facingLeft:
    LDA.W Pose : CMP.W #$0041 : BNE .decelerating

  .moveSamus:
    JSR MoveSamus_HorizontallyWithZeroBaseXSpeed
    JSR Simple_Samus_Y_Movement
    BCS .return
    JSR Samus_Y_Movement_NoSpeedCalculations
    JSL Cancel_SpeedBoosting
    STZ.W SamusXExtraRunSpeed : STZ.W SamusXExtraRunSubSpeed
    STZ.W SamusXBaseSpeed : STZ.W SamusXBaseSubSpeed
    STZ.W SamusXAccelerationMode
    BRA .return

  .decelerating:
    JSR Samus_X_Movement
    JSR Simple_Samus_Y_Movement
    BCS .return
    JSR Samus_Y_Movement_NoSpeedCalculations

  .return:
    PLP
    RTS


;;; $A573: Samus movement - crouching ;;;
SamusMovement_Crouching:
    PHP
    REP #$30
    JSR MoveSamus_HorizontallyWithZeroBaseXSpeed
    JSR Samus_Y_Movement_NoSpeedCalculations
    STZ.W SamusXExtraRunSpeed : STZ.W SamusXExtraRunSubSpeed
    STZ.W SamusXBaseSpeed : STZ.W SamusXBaseSubSpeed
    STZ.W SamusXAccelerationMode
    PLP
    RTS


;;; $A58D: Samus movement - falling ;;;
SamusMovement_Falling:
    PHP
    REP #$30
    JSR Samus_Falling_Movement
    LDA.W Pose : CMP.W #$0029 : BEQ .falling
    CMP.W #$002A : BEQ .falling
    CMP.W #$0067 : BEQ .falling
    CMP.W #$0068 : BEQ .falling
    BRA .return

  .falling:
    LDA.W SamusYSpeed : CMP.W #$0005 : BMI .return
    LDA.W SamusAnimationFrame : CMP.W #$0005 : BPL .return
    LDA.W #$0008 : STA.W SamusAnimationFrameTimer
    LDA.W #$0005 : STA.W SamusAnimationFrame

  .return:
    PLP
    RTS


;;; $A5CA: Samus movement - morph ball - falling ;;;
SamusMovement_MorphBall_Falling:
    PHP
    REP #$30
    LDA.B DP_Controller1Input : BIT.W #$0300 : BNE .pressingLeftRight
    LDA.W SamusXAccelerationMode : BNE .pressingLeftRight
    JSL Cancel_SpeedBoosting
    STZ.W SamusXExtraRunSpeed : STZ.W SamusXExtraRunSubSpeed
    STZ.W SamusXBaseSpeed : STZ.W SamusXBaseSubSpeed
    STZ.W SamusXAccelerationMode

  .pressingLeftRight:
    LDA.W MorphBallBounceState : BNE .morphBounce
    JSR Samus_Morphed_Falling_Movement
    BRA .return

  .morphBounce:
    JSR Samus_Morphed_Bouncing_Movement

  .return:
    PLP
    RTS


;;; $A5FB: RTS. Samus movement - movement type 9 (unused) ;;;
UNUSED_RTS_90A5FB:
    RTS


;;; $A5FC: Samus movement - knockback / crystal flash ending ;;;
SamusMovement_Knockback_CrystalFlashEnding:
    PHP
    REP #$30
    STZ.W SamusSolidVerticalCollisionResult
    JSR Samus_Y_Movement_NoSpeedCalculations
    PLP
    RTS


;;; $A607: Samus movement - movement type Bh (unused) ;;;
UNUSED_SamusMovement_B_90A607:
    PHP
    REP #$30
    STZ.W SamusSolidVerticalCollisionResult
    PLP
    RTS


;;; $A60F: Samus movement - movement type Ch (unused) ;;;
UNUSED_SamusMovement_C_90A60F:
    PHP
    REP #$30
    STZ.W SamusSolidVerticalCollisionResult
    PLP
    RTS


;;; $A617: RTS. Samus movement - movement type Dh (unused) ;;;
UNUSED_SamusMovement_D_90A617:
    PHP
    REP #$30
    PLP
    RTS


;;; $A61C: Samus movement - crouching/standing/morphing/unmorphing transition ;;;
SamusMovement_TransitionPoses:
    PHP
    REP #$30
    LDA.W Pose : CMP.W #$00F1 : BPL .moveSamus
    CMP.W #$00DB : BPL .noYMovement
    SEC : SBC.W #$0035 : ASL : TAX
    JSR.W (.pointers,X)

  .moveSamus:
    JSR MoveSamus_HorizontallyWithZeroBaseXSpeed
    JSR Simple_Samus_Y_Movement_duplicate
    BCS .noYMovement
    JSR Samus_Y_Movement_NoSpeedCalculations

  .noYMovement:
    LDA.W SamusSolidVerticalCollisionResult : CMP.W #$0401 : BNE .noChange
    STZ.W SamusYSubSpeed : STZ.W SamusYSpeed
    STZ.W SamusYDirection : STZ.W MorphBallBounceState

  .noChange:
    STZ.W SamusSolidVerticalCollisionResult
    PLP
    RTS

  .pointers:
    dw RTS_90A671                                                        ; 35h: Facing right - crouching transition
    dw RTS_90A671                                                        ; 36h: Facing left-   crouching transition
    dw RTS_90A671                                                        ; 37h: Facing right - morphing transition
    dw RTS_90A671                                                        ; 38h: Facing left-   morphing transition
    dw Enable_Horizontal_Slope_Detection                                 ; 39h: Unused
    dw Enable_Horizontal_Slope_Detection                                 ; 3Ah: Unused
    dw RTS_90A671                                                        ; 3Bh: Facing right - standing transition
    dw RTS_90A671                                                        ; 3Ch: Facing left-   standing transition
    dw RTS_90A671                                                        ; 3Dh: Facing right - unmorphing transition
    dw RTS_90A671                                                        ; 3Eh: Facing left-   unmorphing transition
    dw Enable_Horizontal_Slope_Detection                                 ; 3Fh: Unused
    dw Enable_Horizontal_Slope_Detection                                 ; 40h: Unused


;;; $A671: RTS ;;;
RTS_90A671:
    RTS


;;; $A672: Enable horizontal slope detection ;;;
Enable_Horizontal_Slope_Detection:
    LDA.W #$0003 : STA.W HorizontalSlopeCollision
    STZ.W neverRead0AA4
    RTS


;;; $A67C: Samus movement - turning around - on ground ;;;
SamusMovement_TurningAround_OnGround:
    PHP
    REP #$30
    JSR Samus_X_Movement
    JSR Samus_Y_Movement_NoSpeedCalculations
    JSL Cancel_SpeedBoosting
    STZ.W SamusXExtraRunSpeed : STZ.W SamusXExtraRunSubSpeed
    STZ.W SamusSolidVerticalCollisionResult
    PLP
    RTS


;;; $A694: Samus movement - moonwalking ;;;
SamusMovement_Moonwalking:
    PHP
    REP #$30
    JSR Samus_X_Movement
    JSR Samus_Y_Movement_NoSpeedCalculations
    PLP
    RTS


;;; $A69F: Samus movement - spring ball - on ground ;;;
SamusMovement_SpringBall_OnGround:
    PHP
    REP #$30
    LDA.W SamusXAccelerationMode : BNE .decelerating
    LDA.W PoseXDirection : AND.W #$00FF : CMP.W #$0004 : BEQ .facingLeft
    LDA.W Pose : CMP.W #$0079 : BNE .decelerating
    BRA +

  .facingLeft:
    LDA.W Pose : CMP.W #$007A : BNE .decelerating

+   JSR MoveSamus_HorizontallyWithZeroBaseXSpeed
    JSR Simple_Samus_Y_Movement
    BCS .return
    JSR Samus_Y_Movement_NoSpeedCalculations
    JSL Cancel_SpeedBoosting
    STZ.W SamusXExtraRunSpeed : STZ.W SamusXExtraRunSubSpeed
    STZ.W SamusXBaseSpeed : STZ.W SamusXBaseSubSpeed
    STZ.W SamusXAccelerationMode
    BRA .return

  .decelerating:
    JSR Samus_X_Movement
    JSR Simple_Samus_Y_Movement
    BCS .return
    JSR Samus_Y_Movement_NoSpeedCalculations

  .return:
    PLP
    RTS


;;; $A6F1: Samus movement - spring ball - in air ;;;
SamusMovement_SpringBall_InAir:
    PHP
    REP #$30
    LDA.W MorphBallBounceState : BNE .bouncing
    JSR Samus_Jumping_Movement
    BRA .return

  .bouncing:
    JSR Samus_Morphed_Bouncing_Movement

  .return:
    PLP
    RTS


;;; $A703: Samus movement - spring ball - falling ;;;
SamusMovement_SpringBall_Falling:
    PHP
    REP #$30
    LDA.B DP_Controller1Input : BIT.W #$0300 : BNE .checkBounce
    LDA.W SamusXAccelerationMode : BNE .checkBounce
    JSL Cancel_SpeedBoosting
    STZ.W SamusXExtraRunSpeed : STZ.W SamusXExtraRunSubSpeed
    STZ.W SamusXBaseSpeed : STZ.W SamusXBaseSubSpeed
    STZ.W SamusXAccelerationMode

  .checkBounce:
    LDA.W MorphBallBounceState : BNE .bouncing
    JSR Samus_Morphed_Falling_Movement
    BRA .return

  .bouncing:
    JSR Samus_Morphed_Bouncing_Movement

  .return:
    PLP
    RTS


;;; $A734: Samus movement - wall jumping ;;;
SamusMovement_WallJumping:
    PHP
    REP #$30
    LDA.W SamusAnimationFrame : CMP.W #$0017 : BPL .greaterThan16
    CMP.W #$0003 : BMI .jumpingMovement
    LDA.W SamusProjectile_FlareCounter : CMP.W #$003C : BMI .jumpingMovement
    LDA.W #$0004 : STA.W ContactDamageIndex
    BRA .jumpingMovement

  .greaterThan16:
    LDA.W #$0003 : STA.W ContactDamageIndex

  .jumpingMovement:
    JSR Samus_Jumping_Movement
    PLP
    RTS


;;; $A75F: Samus movement - ran into a wall ;;;
SamusMovement_RanIntoAWall:
    PHP
    REP #$30
    JSR MoveSamus_HorizontallyWithZeroBaseXSpeed
    JSR Samus_Y_Movement_NoSpeedCalculations
    JSL Cancel_SpeedBoosting
    STZ.W SamusXExtraRunSpeed : STZ.W SamusXExtraRunSubSpeed
    STZ.W SamusXBaseSpeed : STZ.W SamusXBaseSubSpeed
    STZ.W SamusXAccelerationMode
    JSR RTS_9092E9
    PLP
    RTS


;;; $A780: Samus movement - grappling ;;;
SamusMovement_Grappling:
    PHP
    REP #$30
    LDA.W SamusSolidVerticalCollisionResult : CMP.W #$0005 : BEQ .return
    STZ.W SamusSolidVerticalCollisionResult

  .return:
    PLP
    RTS


;;; $A790: Samus movement - turning around - jumping ;;;
SamusMovement_TurningAround_Jumping:
    PHP
    REP #$30
    JSR Samus_X_Movement
    JSR Simple_Samus_Y_Movement
    BCS +
    JSR Samus_Y_Movement_NoSpeedCalculations

+   JSL Cancel_SpeedBoosting
    STZ.W SamusXExtraRunSpeed : STZ.W SamusXExtraRunSubSpeed
    STZ.W SamusSolidVerticalCollisionResult
    PLP
    RTS


;;; $A7AD: Samus movement - turning around - falling ;;;
SamusMovement_TurningAround_Falling:
; Clone of SamusMovement_TurningAround_Jumping
    PHP
    REP #$30
    JSR Samus_X_Movement
    JSR Simple_Samus_Y_Movement
    BCS +
    JSR Samus_Y_Movement_NoSpeedCalculations

+   JSL Cancel_SpeedBoosting
    STZ.W SamusXExtraRunSpeed : STZ.W SamusXExtraRunSubSpeed
    STZ.W SamusSolidVerticalCollisionResult
    PLP
    RTS


;;; $A7CA: Samus movement - damage boost ;;;
SamusMovement_DamageBoost:
    PHP
    REP #$30
    JSR Samus_Jumping_Movement
    PLP
    RTS


;;; $A7D2: Samus movement - grabbed by Draygon ;;;
SamusMovement_GrabbedByDraygon:
    PHP
    REP #$30
    STZ.W SamusSolidVerticalCollisionResult
    PLP
    RTS


;;; $A7DA: Samus movement - shinespark / crystal flash / drained by metroid / damaged by MB's attacks ;;;
SamusMovement_Shinespark_CF_Drained_DamagedByMotherBrain:
    PHP
    REP #$30
    STZ.W SamusSolidVerticalCollisionResult
    PLP
    RTS


;;; $A7E2: Disable mini-map and mark boss room map tiles as explored ;;;
DisableMinimap_MarkBossRoomTilesExplored:
    PHP : PHB
    REP #$30
    PHK : PLB
    LDA.W #$0001
    STA.W DisableMinimap
    LDA.W #$001F : ORA.W #$2C00 ; >.<
    LDX.W #$0000

  .loop:
    STA.L HUDTilemap_Row1Minimap,X : STA.L HUDTilemap_Row2Minimap,X : STA.L HUDTilemap_Row3Minimap,X
    INX #2 : CPX.W #$000A : BMI .loop
    LDA.W BossID
    LDX.W #$0014

  .loopBossID:
    CMP.W .bossID,X : BEQ +
    DEX #4 : BPL .loopBossID
    PLB : PLP
    RTL

+   LDA.W .pointer,X : TAX

  .loopMapTiles:
    LDA.W $0000,X : BMI .return
    STA.B DP_Temp12
    LDA.W $0002,X : STA.B DP_Temp18
    JSR MarkMapTilesExplored
    INX #4
    BRA .loopMapTiles

  .return:
    PLB : PLP
    RTL

;        ________ Boss ID
;       |     ___ Pointer to room map tile offsets
;       |    |
  .bossID:
    dw $0003
  .pointer:
    dw       .kraid
    dw $0006,.crocomire
    dw $0007,.phantoon
    dw $0008,.draygon
    dw $000A,.motherBrain
    dw $0005,.ridley

;        _________ X offset (in pixels)
;       |      ___ Y offset (in pixels)
;       |     |
  .kraid:
    dw $0000,$0000
    dw $0100,$0000
    dw $0000,$0100
    dw $0100,$0100
    dw $FFFF
  .crocomire:
    dw $0300,$0000
    dw $0400,$0000
    dw $0500,$0000
    dw $FFFF
  .phantoon:
    dw $0000,$0000
    dw $FFFF
  .draygon:
    dw $0000,$0000
    dw $0100,$0000
    dw $0000,$0100
    dw $0100,$0100
    dw $FFFF
  .motherBrain:
    dw $0000,$0000
    dw $0100,$0000
    dw $0200,$0000
    dw $0300,$0000
    dw $FFFF
  .ridley:
    dw $0000,$0000
    dw $0000,$0100
    dw $FFFF


;;; $A8A6: Mark map tile as explored ;;;
MarkMapTilesExplored:
;; Parameters:
;;     $12: X offset of map tile in room. Unit px
;;     $18: Y offset of map tile in room. Unit px

; Set tiles explored for current area, used only for marking boss room map tiles as explored
; The first row is skipped during index calculation, that is, room (0, 0) maps to MapTilesExplored+4 rather than MapTilesExplored

; From RAM map, MapTilesExplored:
;     Map tiles explored (for current area). One bit per room.
;     Laid out like a 64x32 1bpp VRAM tilemap:
;         2x1 pages of 32x32 map tiles (80h bytes per page, 4 bytes per row, 1 bit per tile),
;         each byte is 8 map tiles where the most significant bit is the leftmost tile.

; Let
;     x = [room X co-ordinate] + [$12] / 100h
;     y = [room Y co-ordinate] + [$18] / 100h
; Then
;     MapTilesExplored+4 + (y + (x & 20h)) * 4 + (x & 1Fh) / 8 |= 80h >> (x & 7)
    PHP : PHX : PHY
    LDA.B DP_Temp12 : AND.W #$FF00 : XBA : CLC : ADC.W RoomMapX : PHA
    AND.W #$0020 : STA.B DP_Temp22
    PLA : AND.W #$001F : STA.B DP_Temp12
    AND.W #$0007 : TAY
    LDA.B DP_Temp12 : LSR #3 : STA.B DP_Temp14
    LDA.B DP_Temp18 : AND.W #$FF00 : XBA
    CLC : ADC.W RoomMapY : INC : STA.B DP_Temp16
    CLC : ADC.B DP_Temp22 : ASL #2
    CLC : ADC.B DP_Temp14 : TAX
    SEP #$20
    LDA.W MapTilesExplored,X : ORA.W Bitmasks_1bit_90AC04,Y : STA.W MapTilesExplored,X
    PLY : PLX : PLP
    RTS


;;; $A8EF: Initialise mini-map (broken) ;;;
Initialise_Minimap_broken:
; Called by:
;     $9A79: Initialise HUD

; This function isn't setting the variables needed for the call to $AA43 and otherwise is unnecessary
    PHP
    REP #$30
    LDA.W SamusXPosition : AND.W #$FF00 : XBA
    CLC : ADC.W RoomMapX : TAX : STA.B DP_Temp12
    AND.W #$0007 : TAY
    TXA : LSR #3 : STA.B DP_Temp14
    LDA.W SamusYPosition : AND.W #$FF00 : XBA
    CLC : ADC.W RoomMapY : INC : STA.B DP_Temp16
    JMP Update_HUD_Minimap_Tilemap


;;; $A91B: Update mini-map ;;;
Update_Minimap:
; Direct page usage:
;     $09: Mini-map origin map data pointer ($82:0000 + [$0F] + [$32/$30])
;     $0F: Area map data pointer ([$82:9717 + [area index] * 2])
;     $12: Samus map X co-ordinate ([room X co-ordinate] + [Samus X position] / 100h)
;     $14: Byte index of Samus map column (([room X co-ordinate] + [Samus X position] / 100h & 1Fh) / 8)
;     $16: Index of Samus map row ([room Y co-ordinate] + [Samus Y position] / 100h + 1)
;     $18: Explored row 0 map bits (([MapTilesExplored + [$32/$30]]     << 8 | [MapTilesExplored + [$32/$30] + 1]) & FC00h >> [$34] / 2)
;     $1A: Explored row 1 map bits (([MapTilesExplored + [$32/$30] + 4] << 8 | [MapTilesExplored + [$32/$30] + 5]) & FC00h >> [$34] / 2)
;     $1C: Explored row 2 map bits (([MapTilesExplored + [$32/$30] + 8] << 8 | [MapTilesExplored + [$32/$30] + 9]) & FC00h >> [$34] / 2)
;     $1E: Byte index of Samus map co-ordinate (([$16] + [$22]) * 4 + [$14])
;     $20: Bit subindex of column of Samus map position ([room X co-ordinate] + [Samus X position] / 100h & 7)
;     $22: Map page of Samus position ([room X co-ordinate] + [Samus X position] / 100h & 20h)
;     $26: Row 0 map bits ([[$09]] << 8     | [[$09] + 1])
;     $28: Row 1 map bits ([[$09] + 4] << 8 | [[$09] + 5])
;     $2A: Row 2 map bits ([[$09] + 8] << 8 | [[$09] + 9])
;     $2C: Spilt explored row map bits ([MapTilesExplored + [$30] + 0/4/8])
;     $2D: Spilt row map bits ([[$09] + 0/4/8])
;     $2E: Flag that Samus map position is in a different byte than the mini-map origin ([$20] < 2)
;     $30: Byte index of spilt map bits (if [$22] = 0 then [$32] + 7Dh else [$32] - 7Ch)
;     $32: Byte index of map co-ordinate of mini-map origin ([$1E] - 4 - [$2E])
;     $34: Bit subindex of column of mini-map origin * 2 (([$20] - 2 & 7) * 2)

; From RAM map, MapTilesExplored:
;     Map tiles explored (for current area). One bit per room.
;     Laid out like a 64x32 1bpp VRAM tilemap:
;         2x1 pages of 32x32 map tiles (80h bytes per page, 4 bytes per row, 1 bit per tile),
;         each byte is 8 map tiles where the most significant bit is the leftmost tile.
;     The first row is padding and skipped during index calculation,
;     that is, room (0, 0) maps to MapTilesExplored+4 rather than MapTilesExplored.
    PHP
    REP #$30
    LDA.W DisableMinimap : BEQ +
    PLP
    RTL

+   LDA.W SamusXPosition : LSR #4 : CMP.W RoomWidthBlocks : BCC +
    PLP
    RTL

+   LDA.W SamusYPosition : LSR #4 : CMP.W RoomHeightBlocks : BCC +
    PLP
    RTL

+   STZ.B DP_Temp2E
    LDA.W SamusXPosition : AND.W #$FF00 : XBA : CLC : ADC.W RoomMapX
    PHA
    AND.W #$0020 : STA.B DP_Temp22
    PLA
    AND.W #$001F : STA.B DP_Temp12
    AND.W #$0007 : TAY
    LDA.B DP_Temp12
    LSR #3 : STA.B DP_Temp14
    LDA.W SamusYPosition : AND.W #$FF00 : XBA
    CLC : ADC.W RoomMapY : INC : STA.B DP_Temp16
    CLC : ADC.B DP_Temp22 : ASL #2
    CLC : ADC.B DP_Temp14 : TAX
    SEP #$20
    LDA.W MapTilesExplored,X : ORA.W Bitmasks_1bit_90AC04,Y : STA.W MapTilesExplored,X
    STY.B DP_Temp20
    STX.B DP_Temp1E
    REP #$30
    DEX #4
    TYA : DEC #2 : BPL +
    AND.W #$0007
    DEX
    INC.B DP_Temp2E

+   ASL : TAY
    STX.B DP_Temp32
    STY.B DP_Temp34
    LDA.W MapTilesExplored,X : XBA : AND.W Bitmasks_6bit_90AC0C,Y : STA.B DP_Temp18
    LDA.W MapTilesExplored+4,X : XBA : AND.W Bitmasks_6bit_90AC0C,Y : STA.B DP_Temp1A
    LDA.W MapTilesExplored+8,X : XBA : AND.W Bitmasks_6bit_90AC0C,Y : STA.B DP_Temp1C
    PHX
    LDA.W AreaIndex : ASL : TAX
    LDA.W #$0082 : STA.B DP_Temp0B
    LDA.L MapData_pointers,X : STA.B DP_Temp09 : STA.B DP_Temp0F
    PLA : CLC : ADC.B DP_Temp09 : STA.B DP_Temp09
    LDA.B [DP_Temp09] : XBA : STA.B DP_Temp26
    LDA.B DP_Temp09 : CLC : ADC.W #$0004 : STA.B DP_Temp09
    LDA.B [DP_Temp09] : XBA : STA.B DP_Temp28
    LDA.B DP_Temp09 : CLC : ADC.W #$0004 : STA.B DP_Temp09
    LDA.B [DP_Temp09] : XBA : STA.B DP_Temp2A
    LDX.B DP_Temp32
    LDY.B DP_Temp34
    TXA : AND.W #$0003 : CMP.W #$0003 : BNE .singlePage

; If [X] % 4 == 3 then mini-map origin is within last 8 tiles of the row.
; If the mini-map origin is on the same page as Samus map position,
; then there's a chance that at least one of the two tiles right of Samus map position spilled onto the next map page.
; If the mini-map origin is on a different page to Samus map position,
; then at least one of the two tiles left of Samus map position spilled onto the previous map page.

; If the spilt map bits were from the next page,
; then their real address is given by subtracting 3 from [X] to get back to the start of the row,
; and then adding 80h to get to same position in the next page.
; If the spilt map bits were from the previous page,
; then their real address is given by adding 4 to [X] to get to the end of the row that the non-spilt bits are on,
; then subtracting 80h to get to the same position in the previous page.

    LDA.B DP_Temp2E : BEQ .SamusAtOrigin
    TYA : LSR
    BRA +

  .SamusAtOrigin:
    LDA.B DP_Temp20

+   CMP.W #$0006 : BMI .singlePage
    LDA.B DP_Temp22 : BNE .nonZero
    SEP #$20
    TXA : CLC : ADC.B #$7D : STA.B DP_Temp30
    BRA .adjustMapBits

  .nonZero:
    SEP #$20
    TXA : SEC : SBC.B #$7C : STA.B DP_Temp30

  .adjustMapBits:
    REP #$30
    JSR AdjustMapBitsForMapPageSpill

  .singlePage:
    LDA.B DP_Temp34 : LSR : CMP.W #$0000

  .loop:
    BEQ Update_HUD_Minimap_Tilemap
    ASL.B DP_Temp18 : ASL.B DP_Temp26 : ASL.B DP_Temp1A
    ASL.B DP_Temp28 : ASL.B DP_Temp1C : ASL.B DP_Temp2A
    DEC
    BRA .loop


;;; $AA43: Update HUD mini-map tilemap ;;;
Update_HUD_Minimap_Tilemap:
;; Parameters:
;;     $12: Samus map X co-ordinate ([room X co-ordinate] + [Samus X position] / 100h)
;;     $16: Index of Samus map row ([room Y co-ordinate] + [Samus Y position] / 100h + 1)
;;     $18: Explored row 0 map bits (([MapTilesExplored + [$32/$30]]     << 8 | [MapTilesExplored + [$32/$30] + 1]) << [$34] / 2 & FC00h)
;;     $1A: Explored row 1 map bits (([MapTilesExplored + [$32/$30] + 4] << 8 | [MapTilesExplored + [$32/$30] + 5]) << [$34] / 2 & FC00h)
;;     $1C: Explored row 2 map bits (([MapTilesExplored + [$32/$30] + 8] << 8 | [MapTilesExplored + [$32/$30] + 9]) << [$34] / 2 & FC00h)
;;     $22: Map page of Samus position ([room X co-ordinate] + [Samus X position] / 100h & 20h)
;;     $26: Row 0 map bits ([[$09]] << 8     | [[$09] + 1]) << [$34] / 2
;;     $28: Row 1 map bits ([[$09] + 4] << 8 | [[$09] + 5]) << [$34] / 2
;;     $2A: Row 2 map bits ([[$09] + 8] << 8 | [[$09] + 9]) << [$34] / 2
    LDA.B DP_Temp16 : CLC : ADC.B DP_Temp22 : XBA
    LSR #3 : CLC : ADC.B DP_Temp12 : STA.W $060B
    LDA.B DP_Temp22 : BEQ .notLeftMapPage
    LDA.W $060B : AND.W #$001F : CMP.W #$0002 : BPL .notLeftMapPage
    LDA.W $060B : SEC : SBC.W #$0402
    BRA +

  .notLeftMapPage:
    LDA.W $060B : SEC : SBC.W #$0022

+   ASL : TAY
    LDA.W AreaIndex : ASL : CLC : ADC.W AreaIndex : TAX
    LDA.L AreaMapPointers+2,X
    STA.B DP_Temp02 : STA.B DP_Temp05 : STA.B DP_Temp08
    LDA.L AreaMapPointers,X : STA.B DP_Temp00
    CLC : ADC.W #$0040 : STA.B DP_Temp03
    CLC : ADC.W #$0040 : STA.B DP_Temp06
    LDA.W #$0005 : STA.B DP_Temp12
    LDX.W #$0000
    LDA.W CurrentAreaMapCollectedFlag
    PHP

  .loop:
    ASL.B DP_Temp26 : BCC .row0BlankTile
    LDA.B [DP_Temp00],Y
    PLP : PHP
    BNE .row0NotBlank

  .row0BlankTile:
    LDA.W #$001F

  .row0NotBlank:
    AND.W #$E3FF : ORA.W #$2C00 : STA.L HUDTilemap_Row1Minimap,X
    ASL.B DP_Temp18 : BCC +
    LDA.B [DP_Temp00],Y : AND.W #$E3FF : ORA.W #$2800 : STA.L HUDTilemap_Row1Minimap,X

+   ASL.B DP_Temp28 : BCC .row1BlankTile
    LDA.B [DP_Temp03],Y
    PLP : PHP
    BNE .row1NotBlank

  .row1BlankTile:
    LDA.W #$001F

  .row1NotBlank:
    AND.W #$E3FF : ORA.W #$2C00 : STA.L HUDTilemap_Row2Minimap,X
    ASL.B DP_Temp1A : BCC +
    LDA.B [DP_Temp03],Y : AND.W #$E3FF : ORA.W #$2800 : STA.L HUDTilemap_Row2Minimap,X
    LDA.B DP_Temp12 : CMP.W #$0003 : BNE +
    LDA.L HUDTilemap_Row2Minimap,X : AND.W #$01FF : CMP.W #$0028 : BNE +
    JSR MarkMapTileAboveSamusExplored

+   ASL.B DP_Temp2A : BCC .row2BlankTile
    LDA.B [DP_Temp06],Y
    PLP : PHP
    BNE .row2NotBlank

  .row2BlankTile:
    LDA.W #$001F

  .row2NotBlank:
    AND.W #$E3FF : ORA.W #$2C00 : STA.L HUDTilemap_Row3Minimap,X
    ASL.B DP_Temp1C : BCC .next
    LDA.B [DP_Temp06],Y : AND.W #$E3FF : ORA.W #$2800 : STA.L HUDTilemap_Row3Minimap,X

  .next:
    INX #2
    INY #2
    TYA : AND.W #$003F : CMP.W #$0000 : BNE +
    TYA : CLC : ADC.W #$07C0 : TAY

+   DEC.B DP_Temp12 : BEQ .handleFlashing
    JMP .loop

  .handleFlashing:
; Note that the 8-bit frame counter used here is set to 0 by door transition,
; which usually causes the flash cycle to reset
    PLP
    LDA.W NMI_8bitFrameCounter : AND.W #$0008 : BNE .return
    LDA.L HUDTilemap_SamusMinimapPosition : ORA.W #$1C00 : STA.L HUDTilemap_SamusMinimapPosition

  .return:
    PLP
    RTL


;;; $AB5F: Mark map tile above Samus as explored ;;;
MarkMapTileAboveSamusExplored:
;; Parameters:
;;     $1E: Byte index of Samus map co-ordinate (([$16] + [$22]) * 4 + [$14])
;;     $20: Bit subindex of column of Samus map position ([room X co-ordinate] + [Samus X position] / 100h & 7)
    PHX : PHY
    LDX.B DP_Temp1E
    SEP #$20
    LDY.B DP_Temp20
    LDA.W MusicDataIndex,X : ORA.W Bitmasks_1bit_90AC04,Y : STA.W MusicDataIndex,X
    REP #$20
    PLY : PLX
    RTS


;;; $AB75: Adjust map bits for map page spill ;;;
AdjustMapBitsForMapPageSpill:
;; Parameters:
;;     $0B: $82 (bank for map data)
;;     $0F: Area map data pointer ([$82:9717 + [area index] * 2])
;;     $22: Map page of Samus position ([room X co-ordinate] + [Samus X position] / 100h & 20h)
;;     $30: Byte index of spilt map bits (if [$22] = 0 then [$32] + 7Dh else [$32] - 7Ch)

; Direct page usage:
;     $09: Spilt map data pointer ($82:0000 + [$0F] + [$30])
;     $18: Explored row 0 map bits (([MapTilesExplored + [$32/$30]]     << 8 | [MapTilesExplored + [$32/$30] + 1]) & FC00h >> [$34] / 2)
;     $1A: Explored row 1 map bits (([MapTilesExplored + [$32/$30] + 4] << 8 | [MapTilesExplored + [$32/$30] + 5]) & FC00h >> [$34] / 2)
;     $1C: Explored row 2 map bits (([MapTilesExplored + [$32/$30] + 8] << 8 | [MapTilesExplored + [$32/$30] + 9]) & FC00h >> [$34] / 2)
;     $2C: Spilt explored row map bits ([MapTilesExplored + [$30] + 0/4/8])
;     $2D: Spilt row map bits ([[$09] + 0/4/8])
    PHP
    REP #$30
    LDA.B DP_Temp30 : AND.W #$00FF : TAX
    CLC : ADC.B DP_Temp0F : STA.B DP_Temp09
    SEP #$20
    LDA.W MapTilesExplored,X : STA.B DP_Temp2C
    LDA.B [DP_Temp09] : STA.B DP_Temp2D
    LDA.B #$20 : CMP.B DP_Temp22 : BNE .leftMapPage1
    LDA.B DP_Temp2C : STA.B DP_Temp19
    LDA.B DP_Temp2D : STA.B DP_Temp27
    BRA +

  .leftMapPage1:
    LDA.B DP_Temp2C : STA.B DP_Temp18
    LDA.B DP_Temp2D : STA.B DP_Temp26

+   LDA.W MapTilesExplored+4,X : STA.B DP_Temp2C
    REP #$20
    LDA.B DP_Temp09 : CLC : ADC.W #$0004 : STA.B DP_Temp09
    SEP #$20
    LDA.B [DP_Temp09] : STA.B DP_Temp2D
    LDA.B #$20 : CMP.B DP_Temp22 : BNE .leftMapPage2
    LDA.B DP_Temp2C : STA.B DP_Temp1B
    LDA.B DP_Temp2D : STA.B DP_Temp29
    BRA +

  .leftMapPage2:
    LDA.B DP_Temp2C : STA.B DP_Temp1A
    LDA.B DP_Temp2D : STA.B DP_Temp28

+   LDA.W MapTilesExplored+8,X : STA.B DP_Temp2C
    REP #$20
    LDA.B DP_Temp09 : CLC : ADC.W #$0004 : STA.B DP_Temp09
    SEP #$20
    LDA.B [DP_Temp09] : STA.B DP_Temp2D
    LDA.B #$20 : CMP.B DP_Temp22 : BNE .leftMapPage3
    LDA.B DP_Temp2C : STA.B DP_Temp1D
    LDA.B DP_Temp2D : STA.B DP_Temp2B
    BRA .return

  .leftMapPage3:
    LDA.B DP_Temp2C : STA.B DP_Temp1C
    LDA.B DP_Temp2D : STA.B DP_Temp2A

  .return:
    REP #$30
    PLP
    RTS


;;; $AC04: 1-bit bitmasks ;;;
Bitmasks_1bit_90AC04:
    db $80,$40,$20,$10,$08,$04,$02,$01


;;; $AC0C: 6-bit bitmasks ;;;
Bitmasks_6bit_90AC0C:
; Why are these 6-bits instead of 5?
; FC00h >> i
; 3Fh << Ah - i
    dw $FC00,$7E00,$3F00,$1F80,$0FC0,$07E0,$03F0,$01F8


;;; $AC1C: Handle Samus cooldown ;;;
Handle_Samus_Cooldown:
    LDA.W TimeIsFrozenFlag : BNE .timeFrozen
    LDA.W SamusProjectile_CooldownTimer : BEQ .return
    BMI .resetCooldown
    DEC : STA.W SamusProjectile_CooldownTimer : BPL .return

  .resetCooldown:
    STZ.W SamusProjectile_CooldownTimer

  .return:
    RTS

  .timeFrozen:
    LDA.W #$0020 : STA.W SamusProjectile_CooldownTimer
    RTS


;;; $AC39: Check if Samus can fire beam ;;;
Check_if_Samus_Can_Fire_Beam:
    LDA.W SamusProjectile_ProjectileCounter : CMP.W #$0005 : BPL .noFire
    LDA.W SamusProjectile_CooldownTimer : AND.W #$00FF : BNE .noFire
    LDA.W #$0001 : STA.W SamusProjectile_CooldownTimer
    LDA.W SamusProjectile_ProjectileCounter : INC : STA.W SamusProjectile_ProjectileCounter
    SEC
    RTS

  .noFire:
    CLC
    RTS


;;; $AC5A: Check if Samus can fire (super) missile ;;;
Check_if_Samus_Can_Fire_Missile:
;; Returns:
;;     Carry: Set if Samus can fire (super) missile

; Increments projectile counter(!)
    LDA.W SelectedHUDItem : CMP.W #$0002 : BEQ .superMissile
    LDA.W SamusProjectile_ProjectileCounter : CMP.W #$0005 : BPL .noFire

  .freeSlot:
    LDA.W SamusProjectile_CooldownTimer : AND.W #$00FF : BNE .noFire
    LDA.W #$0001 : STA.W SamusProjectile_CooldownTimer
    LDA.W SamusProjectile_ProjectileCounter : INC : STA.W SamusProjectile_ProjectileCounter
    SEC
    RTS

  .noFire:
    CLC
    RTS

  .superMissile:
    LDA.W SamusProjectile_ProjectileCounter : CMP.W #$0004 : BMI .freeSlot
    CLC
    RTS


;;; $AC8D: Update beam tiles and palette ;;;
Update_Beam_Tiles_and_Palette:
    PHP : PHB
    PHK : PLB
    REP #$30
    LDA.W EquippedBeams : AND.W #$0FFF : ASL : TAY
    LDX.W VRAMWriteStack
    LDA.W #$0100 : STA.B VRAMWrite.size,X
    INX #2
    LDA.W BeamTilesPointers,Y : STA.B VRAMWrite.size,X
    INX #2
    SEP #$20
    LDA.B #Tiles_PowerBeam>>16 : STA.B VRAMWrite.size,X
    REP #$20
    INX
    LDA.W #$6300 : STA.B VRAMWrite.size,X
    INX #2 : STX.W VRAMWriteStack
    JMP Load_Beam_Palette_withStackPrepped


;;; $ACC2: Load beam palette (external) ;;;
Load_Beam_Palette_Setup:
;; Parameters:
;;     A: Equipped beams

; Same as Load_Beam_Palette_External. Called for crystal flash finish
    PHP : PHB
    PHK : PLB
    REP #$30
    AND.W #$0FFF : ASL : TAY
; fallthrough to Load_Beam_Palette_withStackPrepped


;;; $ACCD: Load beam palette ;;;
Load_Beam_Palette_withStackPrepped:
;; Parameters:
;;     Y: Beam type * 2 (without the charge beam bit)

; Requires DB and PSR to have been pushed
    LDA.W #$0090 : XBA : STA.B DP_Temp01
    LDA.W BeamPalettePointers,Y : STA.B DP_Temp00
    LDY.W #$0000
    LDX.W #$0000

  .loop:
    LDA.B [DP_Temp00],Y : STA.L Palettes_SpriteP6,X
    INX #2
    INY #2 : CPY.W #$0020 : BMI .loop
    PLB : PLP
    RTL


;;; $ACF0: Load beam palette (external) ;;;
Load_Beam_Palette_External:
;; Parameters:
;;     A: Equipped beams

; Same as $ACC2. Called for grapple start/finish
    PHP : PHB
    PHK : PLB
    REP #$30
    JSR Load_Beam_Palette
    PLB : PLP
    RTL


;;; $ACFC: Load beam palette ;;;
Load_Beam_Palette:
;; Parameters:
;;     A: Equipped beams
    AND.W #$0FFF : ASL : TAY
    LDA.W #$0090 : XBA : STA.B DP_Temp01
    LDA.W BeamPalettePointers,Y : STA.B DP_Temp00
    LDY.W #$0000
    LDX.W #$0000

  .loop:
    LDA.B [DP_Temp00],Y : STA.L Palettes_SpriteP6,X
    INX #2
    INY #2 : CPY.W #$0020 : BMI .loop
    RTS


;;; $AD22: Reset projectile data ;;;
Reset_Projectile_Data:
; Called during door transition ($82:E4A9) and when elevator is activated ($A3:9548)
    PHP
    REP #$30
    LDX.W #$0000

  .loop:
    STZ.W SamusProjectile_TrailTimers,X
    STZ.W SamusProjectile_XPositions,X : STZ.W SamusProjectile_YPositions,X
    STZ.W SamusProjectile_Directions,X
    STZ.W SamusProjectile_XVelocities,X : STZ.W SamusProjectile_YVelocities,X
    STZ.W SamusProjectile_XRadii,X : STZ.W SamusProjectile_YRadii,X
    STZ.W SamusProjectile_Types,X : STZ.W SamusProjectile_Damages,X
    STZ.W SamusProjectile_InstructionPointers,X : STZ.W SamusProjectile_InstructionTimers,X
    STZ.W SamusProjectile_Variables,X : STZ.W SamusProjectile_SpritemapPointers,X
    LDA.W #RTS_90B169 : STA.W SamusProjectile_PreInstructions,X
    INX #2 : CPX.W #$0014 : BMI .loop
    STZ.W SamusProjectile_BombCounter : STZ.W SamusProjectile_CooldownTimer
    STZ.W SamusProjectile_ProjectileCounter : STZ.W SamusProjectile_PowerBombFlag
    LDA.W IconCancel : BEQ +
    STZ.W SelectedHUDItem : STZ.W AutoCancelHUDItemIndex

+   STZ.W SpeedEcho_XPosition0 : STZ.W SpeedEcho_XPosition1
    STZ.W SpeedEcho_XPosition2 : STZ.W SpeedEcho_XPosition3
    STZ.W SpeedEcho_YPosition0 : STZ.W SpeedEcho_YPosition1
    STZ.W SpeedEcho_YPosition2 : STZ.W SpeedEcho_YPosition3
    STZ.W SpeedEcho_XSpeed0 : STZ.W SpeedEcho_XSpeed1
    STZ.W SpeedEcho_DrawFlag2 : STZ.W SpeedEcho_DrawFlag3
    STZ.W SpeedEcho_Index
    LDA.W SuperSpecialPaletteFlags : BEQ .checkHyper
    STZ.W SuperSpecialPaletteFlags
    JSL LoadSamusSuitTargetPalette

  .checkHyper:
    LDA.W HyperBeam : BEQ .return
    LDY.W #PaletteFXObjects_HyperBeam
    JSL Spawn_PaletteFXObject

  .return:
    PLP
    RTL


;;; $ADB7: Clear projectile ;;;
Clear_Projectile:
;; Parameters:
;;     X: Projectile index
    PHP
    REP #$30
    STZ.W SamusProjectile_XPositions,X : STZ.W SamusProjectile_YPositions,X
    STZ.W SamusProjectile_XSubPositions,X : STZ.W SamusProjectile_YSubPositions,X
    STZ.W SamusProjectile_Directions,X
    STZ.W SamusProjectile_XVelocities,X : STZ.W SamusProjectile_YVelocities,X
    STZ.W SamusProjectile_XRadii,X : STZ.W SamusProjectile_YRadii,X
    STZ.W SamusProjectile_Types,X : STZ.W SamusProjectile_Damages,X
    STZ.W SamusProjectile_InstructionPointers,X : STZ.W SamusProjectile_InstructionTimers,X
    STZ.W SamusProjectile_Variables,X : STZ.W SamusProjectile_SpritemapPointers,X
    LDA.W #RTS_90B169 : STA.W SamusProjectile_PreInstructions,X
    CPX.W #$000A : BPL +
    DEC.W SamusProjectile_ProjectileCounter : BPL .return
    STZ.W SamusProjectile_ProjectileCounter
    BRA .return

+   DEC.W SamusProjectile_BombCounter : BPL .return
    STZ.W SamusProjectile_BombCounter

  .return:
    PLP
    RTL


;;; $AE06: Kill projectile ;;;
Kill_Projectile:
;; Parameters:
;;     X: Projectile index
    PHP : PHB
    PHK : PLB
    REP #$30
    LDA.W SamusProjectile_Types+1,X : AND.W #$000F : BEQ .beam
    CMP.W #$0003 : BMI .missile
    JSL Clear_Projectile
    PLB : PLP
    RTL

  .beam:
    TXY
    LDA.W SamusProjectile_Directions,X : AND.W #$000F : ASL : TAX
    JSR.W (.pointers,X)
    TYX

  .missile:
    JSL PartOfKillProjectile_QueueSFX_SetInstruction
    LDA.W #RTS_90B169 : STA.W SamusProjectile_PreInstructions,X
    PLB : PLP
    RTL

  .pointers:
    dw KillBeam_Up
    dw KillBeam_UpRight
    dw KillBeam_Right
    dw KillBeam_DownRight
    dw KillBeam_Down
    dw KillBeam_Down
    dw KillBeam_DownLeft
    dw KillBeam_Left
    dw KillBeam_UpLeft
    dw KillBeam_Up


;;; $AE4E: Kill beam - up ;;;
KillBeam_Up:
;; Parameters:
;;     X: Projectile index
    LDA.W SamusProjectile_YPositions,Y : SEC : SBC.W SamusProjectile_YRadii,Y : STA.W SamusProjectile_YPositions,Y
    RTS


;;; $AE59: Kill beam - up-right ;;;
KillBeam_UpRight:
;; Parameters:
;;     X: Projectile index
    LDA.W SamusProjectile_XPositions,Y : CLC : ADC.W SamusProjectile_XRadii,Y : STA.W SamusProjectile_XPositions,Y
    LDA.W SamusProjectile_YPositions,Y : SEC : SBC.W SamusProjectile_YRadii,Y : STA.W SamusProjectile_YPositions,Y
    RTS


;;; $AE6E: Kill beam - right ;;;
KillBeam_Right:
;; Parameters:
;;     X: Projectile index
    LDA.W SamusProjectile_XPositions,Y : CLC : ADC.W SamusProjectile_XRadii,Y : STA.W SamusProjectile_XPositions,Y
    RTS


;;; $AE79: Kill beam - down-right ;;;
KillBeam_DownRight:
;; Parameters:
;;     X: Projectile index
    LDA.W SamusProjectile_XPositions,Y : CLC : ADC.W SamusProjectile_XRadii,Y : STA.W SamusProjectile_XPositions,Y
    LDA.W SamusProjectile_YPositions,Y : CLC : ADC.W SamusProjectile_YRadii,Y : STA.W SamusProjectile_YPositions,Y
    RTS


;;; $AE8E: Kill beam - down ;;;
KillBeam_Down:
;; Parameters:
;;     X: Projectile index
    LDA.W SamusProjectile_YPositions,Y : CLC : ADC.W SamusProjectile_YRadii,Y : STA.W SamusProjectile_YPositions,Y
    RTS


;;; $AE99: Kill beam - down-left ;;;
KillBeam_DownLeft:
;; Parameters:
;;     X: Projectile index
    LDA.W SamusProjectile_XPositions,Y : SEC : SBC.W SamusProjectile_XRadii,Y : STA.W SamusProjectile_XPositions,Y
    LDA.W SamusProjectile_YPositions,Y : CLC : ADC.W SamusProjectile_YRadii,Y : STA.W SamusProjectile_YPositions,Y
    RTS


;;; $AEAE: Kill beam - left ;;;
KillBeam_Left:
;; Parameters:
;;     X: Projectile index
    LDA.W SamusProjectile_XPositions,Y : SEC : SBC.W SamusProjectile_XRadii,Y : STA.W SamusProjectile_XPositions,Y
    RTS


;;; $AEB9: Kill beam - up-left ;;;
KillBeam_UpLeft:
;; Parameters:
;;     X: Projectile index
    LDA.W SamusProjectile_XPositions,Y : SEC : SBC.W SamusProjectile_XRadii,Y : STA.W SamusProjectile_XPositions,Y
    LDA.W SamusProjectile_YPositions,Y : SEC : SBC.W SamusProjectile_YRadii,Y : STA.W SamusProjectile_YPositions,Y
    RTS


;;; $AECE: Handle projectiles ;;;
Handle_Projectiles:
    PHP
    REP #$30
    LDA.W #$0012 : STA.W ProjectileIndex
    TAX

  .loop:
    LDA.W SamusProjectile_InstructionPointers,X : BEQ .next
    JSR.W (SamusProjectile_PreInstructions,X)
    JSL ProjectileInstructionHandler
    LDX.W ProjectileIndex

  .next:
    DEX #2 : STX.W ProjectileIndex : BPL .loop
    STZ.W ProjectileProtoType
    PLP
    RTS


;;; $AEF3: Projectile pre-instruction - beam - no wave beam ;;;
ProjectilePreInstruction_Beam_NoWaveBeam:
    LDA.W SamusProjectile_Directions,X : AND.W #$00F0 : BEQ .trail
    JSL Clear_Projectile
    RTS

  .trail:
    DEC.W SamusProjectile_TrailTimers,X : BNE +
    LDA.W #$0004 : STA.W SamusProjectile_TrailTimers,X
    JSL Spawn_ProjectileTrail
    LDX.W ProjectileIndex

+   LDA.W SamusProjectile_Directions,X : AND.W #$000F : ASL : TAY
    LDA.W SamusProjectile_XVelocities,X : CLC : ADC.W ProjectileAccelerations_X,Y : STA.W SamusProjectile_XVelocities,X
    LDA.W SamusProjectile_YVelocities,X : CLC : ADC.W ProjectileAccelerations_Y,Y : STA.W SamusProjectile_YVelocities,X
    TYX
    JSR.W (.pointers,X)
    JSR DeleteProjectileIfTooFarOffScreen
    RTS

  .pointers:
    dw BeamBlockCollision_NoWaveBeam_Vertical                            ; 0: Up, facing right
    dw BeamBlockCollision_NoWaveBeam_Diagonal                            ; 1: Up-right
    dw BeamBlockCollision_NoWaveBeam_Horizontal                          ; 2: Right
    dw BeamBlockCollision_NoWaveBeam_Diagonal                            ; 3: Down-right
    dw BeamBlockCollision_NoWaveBeam_Vertical                            ; 4: Down, facing right
    dw BeamBlockCollision_NoWaveBeam_Vertical                            ; 5: Down, facing left
    dw BeamBlockCollision_NoWaveBeam_Diagonal                            ; 6: Down-left
    dw BeamBlockCollision_NoWaveBeam_Horizontal                          ; 7: Left
    dw BeamBlockCollision_NoWaveBeam_Diagonal                            ; 8: Up-left
    dw BeamBlockCollision_NoWaveBeam_Vertical                            ; 9: Up, facing left


;;; $AF4A: Beam block collision - no wave beam - vertical ;;;
BeamBlockCollision_NoWaveBeam_Vertical:
    LDX.W ProjectileIndex
    JSL MoveBeamVertically_NoWaveBeam
    RTS


;;; $AF52: Beam block collision - no wave beam - diagonal ;;;
BeamBlockCollision_NoWaveBeam_Diagonal:
    LDX.W ProjectileIndex
    JSL MoveBeamHorizontally_NoWaveBeam
    BCS .return
    JSL MoveBeamVertically_NoWaveBeam

  .return:
    RTS


;;; $AF60: Beam block collision - no wave beam - horizontal ;;;
BeamBlockCollision_NoWaveBeam_Horizontal:
    LDX.W ProjectileIndex
    JSL MoveBeamHorizontally_NoWaveBeam
    RTS


;;; $AF68: Projectile pre-instruction - missile ;;;
ProjectilePreInstruction_Missile:
;; Parameters:
;;     X: Projectile index
    LDA.W SamusProjectile_Directions,X : AND.W #$00F0 : BEQ .notDeleted
    JSL Clear_Projectile
    RTS

  .notDeleted:
    DEC.W SamusProjectile_TrailTimers,X : BNE +
    LDA.W #$0004 : STA.W SamusProjectile_TrailTimers,X
    JSL Spawn_ProjectileTrail
    LDX.W ProjectileIndex

+   LDA.W SamusProjectile_Directions,X : AND.W #$000F : ASL : TAY
    LDA.W SamusProjectile_XVelocities,X : CLC : ADC.W ProjectileAccelerations_X,Y : STA.W SamusProjectile_XVelocities,X
    LDA.W SamusProjectile_YVelocities,X : CLC : ADC.W ProjectileAccelerations_Y,Y : STA.W SamusProjectile_YVelocities,X
    TYA : LSR : TAY
    JSR AccelerateMissile
    TYA : ASL : TAX
    JSR.W (.pointers,X)
    JSR DeleteProjectileIfTooFarOffScreen
    RTS

  .pointers:
    dw MissileBlockCollision_Vertical                                    ; 0: Up, facing right
    dw MissileBlockCollision_Diagonal                                    ; 1: Up-right
    dw MissileBlockCollision_Horizontal                                  ; 2: Right
    dw MissileBlockCollision_Diagonal                                    ; 3: Down-right
    dw MissileBlockCollision_Vertical                                    ; 4: Down, facing right
    dw MissileBlockCollision_Vertical                                    ; 5: Down, facing left
    dw MissileBlockCollision_Diagonal                                    ; 6: Down-left
    dw MissileBlockCollision_Horizontal                                  ; 7: Left
    dw MissileBlockCollision_Diagonal                                    ; 8: Up-left
    dw MissileBlockCollision_Vertical                                    ; 9: Up, facing left


;;; $AFC7: Missile block collision - vertical ;;;
MissileBlockCollision_Vertical:
    LDX.W ProjectileIndex
    JSL MoveMissileVertically
    RTS


;;; $AFCF: Missile block collision - diagonal ;;;
MissileBlockCollision_Diagonal:
    LDX.W ProjectileIndex
    JSL MoveMissileHorizontally
    BCS .return
    JSL MoveMissileVertically

  .return:
    RTS


;;; $AFDD: Missile block collision - horizontal ;;;
MissileBlockCollision_Horizontal:
    LDX.W ProjectileIndex
    JSL MoveMissileHorizontally
    RTS


;;; $AFE5: Projectile pre-instruction - super missile ;;;
ProjectilePreInstruction_SuperMissile:
;; Parameters:
;;     X: Projectile index
    LDA.W SamusProjectile_Directions,X : AND.W #$00F0 : BEQ .notDeleted
    JSL Clear_Projectile
    BRA .delete

  .notDeleted:
    DEC.W SamusProjectile_TrailTimers,X : BNE +
    LDA.W #$0002 : STA.W SamusProjectile_TrailTimers,X
    JSL Spawn_ProjectileTrail
    LDX.W ProjectileIndex

+   LDA.W SamusProjectile_Directions,X : AND.W #$000F : TAY
    JSR AccelerateMissile
    TYA : ASL : TAX
    JSR.W (.pointers,X)
    JSR DeleteProjectileIfTooFarOffScreen
    BCS .delete
    RTS

  .delete:
    LDY.W #$0008

  .loop:
    LDA.W SamusProjectile_Types,Y : AND.W #$0FFF : CMP.W #$0200 : BNE .next
    TYX
    JSL Clear_Projectile

  .next:
    DEY #2 : BPL .loop
    RTS

  .pointers:
    dw SuperMissileBlockCollision_Vertical                               ; 0: Up, facing right
    dw SuperMissileBlockCollision_Diagonal                               ; 1: Up-right
    dw SuperMissileBlockCollision_Horizontal                             ; 2: Right
    dw SuperMissileBlockCollision_Diagonal                               ; 3: Down-right
    dw SuperMissileBlockCollision_Vertical                               ; 4: Down, facing right
    dw SuperMissileBlockCollision_Vertical                               ; 5: Down, facing left
    dw SuperMissileBlockCollision_Diagonal                               ; 6: Down-left
    dw SuperMissileBlockCollision_Horizontal                             ; 7: Left
    dw SuperMissileBlockCollision_Diagonal                               ; 8: Up-left
    dw SuperMissileBlockCollision_Vertical                               ; 9: Up, facing left


;;; $B047: Super missile block collision - vertical ;;;
SuperMissileBlockCollision_Vertical:
    LDX.W ProjectileIndex
    JSL MoveMissileVertically
    JSR SuperMissileLink_VerticalBlockCollisionDetection
    RTS


;;; $B052: Super missile block collision - diagonal ;;;
SuperMissileBlockCollision_Diagonal:
    LDX.W ProjectileIndex
    JSL MoveMissileHorizontally
    BCS .collision
    JSR SuperMissileLink_HorizontalBlockCollisionDetection
    JSL MoveMissileVertically
    JSR SuperMissileLink_VerticalBlockCollisionDetection
    RTS

  .collision:
    JSR SuperMissileLink_HorizontalBlockCollisionDetection
    RTS


;;; $B06A: Super missile block collision - horizontal ;;;
SuperMissileBlockCollision_Horizontal:
    LDX.W ProjectileIndex
    JSL MoveMissileHorizontally
    JSR SuperMissileLink_HorizontalBlockCollisionDetection
    RTS


;;; $B075: Projectile pre-instruction - super missile link ;;;
ProjectilePreInstruction_SuperMissileLink:
;; Parameters:
;;     X: Projectile index

; If super missile link is flagged for deletion, clear *all* super missile projectiles
    LDA.W SamusProjectile_Directions,X : AND.W #$00F0 : BEQ .return
    JSL Clear_Projectile
    LDY.W #$0008

  .loop:
    LDA.W SamusProjectile_Types,Y : AND.W #$0FFF : CMP.W #$0200 : BNE .next
    TYX
    JSL Clear_Projectile

  .next:
    DEY #2 : BPL .loop

  .return:
    RTS


;;; $B099: Projectile pre-instruction - bomb ;;;
ProjectilePreInstruction_Bomb:
;; Parameters:
;;     X: Projectile index
    LDA.W SamusProjectile_Directions,X : AND.W #$00F0 : BEQ .notDeleted
    JSL Clear_Projectile
    RTS

  .notDeleted:
    JSR HandleBomb
    JSL BombAndPowerBombExplosionBlockCollisionHandling
    RTS


;;; $B0AE: Projectile pre-instruction - power bomb ;;;
ProjectilePreInstruction_PowerBomb:
;; Parameters:
;;     X: Projectile index
    LDA.W SamusProjectile_Directions,X : AND.W #$00F0 : BEQ .notDeleted
    JSL Clear_Projectile
    RTS

  .notDeleted:
    JSR HandlePowerBomb
    JSL BombAndPowerBombExplosionBlockCollisionHandling
    RTS


;;; $B0C3: Projectile pre-instruction - beam - wave + plasma/spazer / charged (ice) wave ;;;
ProjectilePreInstruction_Beam_WavePlasmaSpazer_ChargeIceWave:
;; Parameters:
;;     X: Projectile index
    LDA.W SamusProjectile_Directions,X : AND.W #$00F0 : BEQ .notDeleted
    JSL Clear_Projectile
    RTS

  .notDeleted:
    DEC.W SamusProjectile_TrailTimers,X : BNE WaveBeamSharedPreInstruction
    LDA.W #$0004 : STA.W SamusProjectile_TrailTimers,X
    JSL Spawn_ProjectileTrail
    LDX.W ProjectileIndex
    BRA WaveBeamSharedPreInstruction


;;; $B0E4: Projectile pre-instruction - beam - uncharged (ice) wave ;;;
ProjectilePreInstruction_Beam_UnchargedIceWave:
;; Parameters:
;;     X: Projectile index
    LDA.W SamusProjectile_Directions,X : AND.W #$00F0 : BEQ .notDeleted
    JSL Clear_Projectile
    RTS

  .notDeleted:
    DEC.W SamusProjectile_TrailTimers,X : BNE WaveBeamSharedPreInstruction
    LDA.W #$0003 : STA.W SamusProjectile_TrailTimers,X
    JSL Spawn_ProjectileTrail
    LDX.W ProjectileIndex
; fallthrough to WaveBeamSharedPreInstruction


;;; $B103: Wave beam shared pre-instruction ;;;
WaveBeamSharedPreInstruction:
    LDA.W SamusProjectile_Directions,X : AND.W #$000F : ASL : TAY
    LDA.W SamusProjectile_XVelocities,X : CLC : ADC.W ProjectileAccelerations_X,Y : STA.W SamusProjectile_XVelocities,X
    LDA.W SamusProjectile_YVelocities,X : CLC : ADC.W ProjectileAccelerations_Y,Y : STA.W SamusProjectile_YVelocities,X
    TYX
    JSR.W (.pointers,X)
    JSR DeleteProjectileIfTooFarOffScreen
    RTS

  .pointers:
    dw WaveBeamBlockCollision_Vertical
    dw WaveBeamBlockCollision_Diagonal
    dw WaveBeamBlockCollision_Horizontal
    dw WaveBeamBlockCollision_Diagonal
    dw WaveBeamBlockCollision_Vertical
    dw WaveBeamBlockCollision_Vertical
    dw WaveBeamBlockCollision_Diagonal
    dw WaveBeamBlockCollision_Horizontal
    dw WaveBeamBlockCollision_Diagonal
    dw WaveBeamBlockCollision_Vertical


;;; $B13B: Wave beam block collision - vertical ;;;
WaveBeamBlockCollision_Vertical:
    LDX.W ProjectileIndex
    JSL MoveBeamVertically_WaveBeam
    RTS


;;; $B143: Wave beam block collision - diagonal ;;;
WaveBeamBlockCollision_Diagonal:
    LDX.W ProjectileIndex
    JSL MoveBeamHorizontally_WaveBeam
    BCS .return
    JSL MoveBeamVertically_WaveBeam

  .return:
    RTS


;;; $B151: Wave beam block collision - horizontal ;;;
WaveBeamBlockCollision_Horizontal:
    LDX.W ProjectileIndex
    JSL MoveBeamHorizontally_WaveBeam
    RTS


;;; $B159: Projectile pre-instruction - hyper beam ;;;
ProjectilePreInstruction_HyperBeam:
;; Parameters:
;;     X: Projectile index
    LDA.W SamusProjectile_Directions,X : AND.W #$00F0 : BEQ .gotoShared
    JSL Clear_Projectile
    RTS

  .gotoShared:
    JMP WaveBeamSharedPreInstruction


;;; $B169: RTS ;;;
RTS_90B169:
    RTS


;;; $B16A: Delete projectile if too far off-screen ;;;
DeleteProjectileIfTooFarOffScreen:
;; Returns:
;;     Carry: Set if projectile deleted, clear otherwise
    LDX.W ProjectileIndex
    LDA.W SamusProjectile_XPositions,X : SEC : SBC.W Layer1XPosition : CMP.W #$FFC0 : BMI .delete
    CMP.W #$0140 : BMI .verticalCheck

  .delete:
    JSL Clear_Projectile
    SEC
    RTS

  .verticalCheck:
    LDA.W SamusProjectile_YPositions,X : SEC : SBC.W Layer1YPosition : CMP.W #$FFC0 : BMI .delete
    CMP.W #$0140 : BPL .delete
    CLC
    RTS


;;; $B197: Initialise beam velocities ;;;
InitializeBeamVelocities:
;; Parameters:
;;     $14: Projectile index
    PHP : PHB
    PHK : PLB
    REP #$30
    LDX.B DP_Temp14
    LDA.W SamusProjectile_Types,X : AND.W #$000F : ASL #2 : TAY
    LDA.W SamusProjectile_Directions,X : AND.W #$000F : ASL : TAX
    JMP.W (.pointers,X)

  .notDiagonal:
    LDA.W BeamSpeeds_Horizontal_Vertical,Y : STA.B DP_Temp16
    BRA .merge

  .diagonal:
    LDA.W BeamSpeeds_Diagonal,Y : STA.B DP_Temp16

  .merge:
    LDX.B DP_Temp14 : STX.B DP_Temp12
    JSR InitializeProjectileVelocities
    PLB : PLP
    RTL

  .pointers:
    dw .notDiagonal
    dw .diagonal
    dw .notDiagonal
    dw .diagonal
    dw .notDiagonal
    dw .notDiagonal
    dw .diagonal
    dw .notDiagonal
    dw .diagonal
    dw .notDiagonal


;;; $B1DD: Initialise (super) missile velocities ;;;
InitializeMissileVelocities:
;; Parameters:
;;     $14: Projectile index
    PHP
    REP #$30
    LDX.B DP_Temp14
    LDA.W SamusProjectile_Types,X : AND.W #$000F : ASL : TAY
    STZ.B DP_Temp16
    STX.B DP_Temp12
    JSR InitializeProjectileVelocities
    PLP
    RTS


;;; $B1F3: Initialise projectile velocities ;;;
InitializeProjectileVelocities:
;; Parameters:
;;     X: Projectile index
;;     $12: Projectile index
;;     $16: Base speed

; There's a repeating issue in all of the subroutines jumped to from here with how "distance Samus moved" is loaded
; These are the variables:
;     ProjSpeed_DistanceSamusMovedLeft.ProjSpeed_SubDistanceSamusMovedLeft: Distance Samus moved left
;     ProjSpeed_DistanceSamusMovedRight.ProjSpeed_SubDistanceSamusMovedRight: Distance Samus moved right
;     ProjSpeed_DistanceSamusMovedUp.ProjSpeed_SubDistanceSamusMovedUp: Distance Samus moved up
;     ProjSpeed_DistanceSamusMovedDown.neverRead0DB8: Distance Samus moved down

; Notice that the most significant word is stored before the least significant
; Generally speaking, it's more useful to extend little endian ordering and store the least significant word first
; If distance Samus moved left was ProjSpeed_SubDistanceSamusMovedLeft.ProjSpeed_DistanceSamusMovedLeft, then loading $0DAB would give (distance Samus moved left) * 100h,
; disregarding the high byte of ProjSpeed_SubDistanceSamusMovedLeft and low byte of ProjSpeed_DistanceSamusMovedLeft, which is a common trick used a lot in SM

; It looks like they tried to apply this trick without realising the ordering of the words isn't suitable
; E.g. CameraYSubSpeed+1 is loaded into A for (distance Samus moved left) * 100h, which does load the low byte of ProjSpeed_DistanceSamusMovedLeft into the high byte of A,
; but also loads garbage (namely the high byte of CameraYSubSpeed) into the low byte of A

; TODO: add these pesky garbage low bytes to the below calculations
    STZ.W SamusProjectile_XSubPositions,X : STZ.W SamusProjectile_YSubPositions,X
    LDA.W SamusProjectile_Directions,X : AND.W #$000F : ASL : TAX
    JMP.W (.pointers,X)

  .pointers:
    dw InitializeProjectileVelocities_Up
    dw InitializeProjectileVelocities_UpRight
    dw InitializeProjectileVelocities_Right
    dw InitializeProjectileVelocities_DownRight
    dw InitializeProjectileVelocities_Down
    dw InitializeProjectileVelocities_Down
    dw InitializeProjectileVelocities_DownLeft
    dw InitializeProjectileVelocities_Left
    dw InitializeProjectileVelocities_UpLeft
    dw InitializeProjectileVelocities_Up


;;; $B218: Initialise projectile velocities - up ;;;
InitializeProjectileVelocities_Up:
;; Parameters:
;;     $12: Projectile index
;;     $16: Base speed

; Note: [distance Samus moved up] is negative
    LDX.B DP_Temp12
    LDA.W ProjSpeed_SubDistanceSamusMovedRight+1 : BIT.W #$FF00 : BNE .left
    STZ.B DP_Temp12
    BRA +

  .left:
    LSR #2 : ORA.W #$C000 : STA.B DP_Temp12

+   LDA.B DP_Temp16 : EOR.W #$FFFF : INC
    CLC : ADC.B DP_Temp12 : STA.W SamusProjectile_YVelocities,X
    STZ.W SamusProjectile_XVelocities,X
    RTS


;;; $B23D: Initialise projectile velocities - up-right ;;;
InitializeProjectileVelocities_UpRight:
;; Parameters:
;;     $12: Projectile index
;;     $16: Base speed
    LDX.B DP_Temp12
    LDA.W ProjSpeed_SubDistanceSamusMovedRight+1 : BIT.W #$FF00 : BNE .left
    STZ.B DP_Temp12
    BRA +

  .left:
    LSR #2 : ORA.W #$C000 : STA.B DP_Temp12

+   LDA.B DP_Temp16 : EOR.W #$FFFF : INC
    CLC : ADC.B DP_Temp12 : STA.W SamusProjectile_YVelocities,X
    LDA.B DP_Temp16 : CLC : ADC.W ProjSpeed_SubDistanceSamusMovedLeft+1 : STA.W SamusProjectile_XVelocities,X
    RTS


;;; $B268: Initialise projectile velocities - right ;;;
InitializeProjectileVelocities_Right:
;; Parameters:
;;     $12: Projectile index
;;     $16: Base speed
    LDX.B DP_Temp12
    STZ.W SamusProjectile_YVelocities,X
    LDA.B DP_Temp16 : CLC : ADC.W ProjSpeed_SubDistanceSamusMovedLeft+1 : STA.W SamusProjectile_XVelocities,X
    RTS


;;; $B277: Initialise projectile velocities - down-right ;;;
InitializeProjectileVelocities_DownRight:
;; Parameters:
;;     $12: Projectile index
;;     $16: Base speed
    LDX.B DP_Temp12
    LDA.B DP_Temp16 : CLC : ADC.W ProjSpeed_SubDistanceSamusMovedUp+1 : STA.W SamusProjectile_YVelocities,X
    LDA.B DP_Temp16 : CLC : ADC.W ProjSpeed_SubDistanceSamusMovedLeft+1 : STA.W SamusProjectile_XVelocities,X
    RTS


;;; $B28C: Initialise projectile velocities - down ;;;
InitializeProjectileVelocities_Down:
;; Parameters:
;;     $12: Projectile index
;;     $16: Base speed
    LDX.B DP_Temp12
    LDA.B DP_Temp16 : CLC : ADC.W ProjSpeed_SubDistanceSamusMovedUp+1 : STA.W SamusProjectile_YVelocities,X
    STZ.W SamusProjectile_XVelocities,X
    RTS


;;; $B29B: Initialise projectile velocities - down-left ;;;
InitializeProjectileVelocities_DownLeft:
;; Parameters:
;;     $12: Projectile index
;;     $16: Base speed
    LDX.B DP_Temp12
    LDA.B DP_Temp16 : CLC : ADC.W ProjSpeed_SubDistanceSamusMovedUp+1 : STA.W SamusProjectile_YVelocities,X
    LDA.B DP_Temp16 : EOR.W #$FFFF : INC
    CLC : ADC.W CameraYSubSpeed+1 : STA.W SamusProjectile_XVelocities,X
    RTS


;;; $B2B4: Initialise projectile velocities - left ;;;
InitializeProjectileVelocities_Left:
;; Parameters:
;;     $12: Projectile index
;;     $16: Base speed

; Note: [distance Samus moved left] is negative
; The low byte of CameraYSubSpeed+1 is the high byte of camera Y subspeed
    LDX.B DP_Temp12
    STZ.W SamusProjectile_YVelocities,X
    LDA.B DP_Temp16 : EOR.W #$FFFF : INC
    CLC : ADC.W CameraYSubSpeed+1 : STA.W SamusProjectile_XVelocities,X
    RTS


;;; $B2C7: Initialise projectile velocities - up-left ;;;
InitializeProjectileVelocities_UpLeft:
;; Parameters:
;;     $12: Projectile index
;;     $16: Base speed
    LDX.B DP_Temp12
    LDA.W ProjSpeed_SubDistanceSamusMovedRight+1 : BIT.W #$FF00 : BNE .left
    STZ.B DP_Temp12
    BRA +

  .left:
    LSR #2 : ORA.W #$C000 : STA.B DP_Temp12

+   LDA.B DP_Temp16 : EOR.W #$FFFF : INC
    CLC : ADC.B DP_Temp12 : STA.W SamusProjectile_YVelocities,X
    LDA.B DP_Temp16 : EOR.W #$FFFF : INC
    CLC : ADC.W CameraYSubSpeed+1 : STA.W SamusProjectile_XVelocities,X
    RTS


;;; $B2F6: Accelerate (super) missile ;;;
AccelerateMissile:
;; Parameters:
;;     X: Projectile index
    PHP
    REP #$30
    PHX : PHY
    LDA.W SamusProjectile_Variables,X : AND.W #$FF00 : BNE .initialized
    LDA.W SamusProjectile_Variables,X : CLC : ADC.W MissileInitializedBitset : STA.W SamusProjectile_Variables,X
    AND.W #$FF00 : BEQ .return
    LDA.W SamusProjectile_Variables,X : STA.B DP_Temp16
    STX.B DP_Temp12
    JSR InitializeProjectileVelocities
    LDA.W SamusProjectile_Types,X : BIT.W #$0200 : BEQ .return
    JSR Spawn_SuperMissileLink
    BRA .return

  .initialized:
    LDA.W SamusProjectile_Directions,X : AND.W #$000F : ASL #2 : STA.B DP_Temp12
    LDA.W SamusProjectile_Types+1,X : AND.W #$000F : BIT.W #$0002 : BNE .superMissile
    LDA.W #MissileAccelerations : CLC : ADC.B DP_Temp12 : TAY
    BRA +

  .superMissile:
    LDA.W #SuperMissileAccelerations : CLC : ADC.B DP_Temp12 : TAY

+   LDA.W SamusProjectile_XVelocities,X : CLC : ADC.W $0000,Y : STA.W SamusProjectile_XVelocities,X
    LDA.W SamusProjectile_YVelocities,X : CLC : ADC.W $0002,Y : STA.W SamusProjectile_YVelocities,X

  .return:
    PLY : PLX : PLP
    RTS


;;; $B366: Super missile link vertical block collision detection ;;;
SuperMissileLink_VerticalBlockCollisionDetection:
; If the super missile is moving fast enough vertically, at least Bh px/frame,
; do an additional collision check Ah pixels ahead of the old Y position
    LDX.W ProjectileIndex
    LDA.W SamusProjectile_Types,X : AND.W #$0F00 : CMP.W #$0200 : BEQ .superMissile
    CMP.W #$0800 : BEQ .superMissile
    RTS

  .superMissile:
    LDA.W SamusProjectile_Variables,X : BIT.W #$FF00 : BNE .initialized
    RTS

  .initialized:
    AND.W #$00FF : TAY
    LDA.W SamusProjectile_YVelocities,X : BPL +
    EOR.W #$FFFF : INC

+   AND.W #$FF00 : CMP.W #$0B00 : BMI .slow
    XBA : SEC : SBC.W #$000A : STA.B DP_Temp12
    LDA.W SamusProjectile_YVelocities,X : BMI .upwards
    PHX
    LDA.W SamusProjectile_YPositions,X : SEC : SBC.B DP_Temp12 : STA.W SamusProjectile_YPositions,Y
    TYX
    STY.W ProjectileIndex
    JSL MoveMissileVertically
    TXY
    PLX : STX.W ProjectileIndex
    LDA.W SamusProjectile_Types,X : AND.W #$0F00 : CMP.W #$0800 : BNE .return
    TYX
    JSL Clear_Projectile

  .return:
    RTS

  .upwards:
    PHX
    LDA.W SamusProjectile_YPositions,X : CLC : ADC.B DP_Temp12 : STA.W SamusProjectile_YPositions,Y
    TYX
    STY.W ProjectileIndex
    JSL MoveMissileVertically
    TXY
    PLX : STX.W ProjectileIndex
    LDA.W SamusProjectile_Types,X : AND.W #$0F00 : CMP.W #$0800 : BNE .return

  .explosion:
    TYX
    JSL Clear_Projectile
    RTS

  .slow:
    LDA.W SamusProjectile_Types,X : AND.W #$0F00 : CMP.W #$0800 : BEQ .explosion
    LDA.W SamusProjectile_YPositions,X : STA.W SamusProjectile_YPositions,Y
    RTS


;;; $B406: Super missile link horizontal block collision detection ;;;
SuperMissileLink_HorizontalBlockCollisionDetection:
; If the super missile is moving fast enough horizontally, at least Bh px/frame,
; do an additional collision check Ah pixels ahead of the old X position
    LDX.W ProjectileIndex
    LDA.W SamusProjectile_Types,X : AND.W #$0F00 : CMP.W #$0200 : BEQ .superMissile
    CMP.W #$0800 : BEQ .superMissile
    RTS

  .superMissile:
    LDA.W SamusProjectile_Variables,X : BIT.W #$FF00 : BNE .initialized
    RTS

  .initialized:
    AND.W #$00FF : TAY
    LDA.W SamusProjectile_XVelocities,X : BPL +
    EOR.W #$FFFF : INC

+   AND.W #$FF00 : CMP.W #$0B00 : BMI .slow
    XBA : SEC : SBC.W #$000A : STA.B DP_Temp12
    LDA.W SamusProjectile_XVelocities,X : BMI .leftwards
    PHX
    LDA.W SamusProjectile_XPositions,X : SEC : SBC.B DP_Temp12 : STA.W SamusProjectile_XPositions,Y
    TYX
    STY.W ProjectileIndex
    JSL MoveMissileHorizontally
    TXY
    PLX : STX.W ProjectileIndex
    LDA.W SamusProjectile_Types,X : AND.W #$0F00 : CMP.W #$0800 : BNE .return
    TYX
    JSL Clear_Projectile

  .return:
    RTS

  .leftwards:
    PHX
    LDA.W SamusProjectile_XPositions,X : CLC : ADC.B DP_Temp12 : STA.W SamusProjectile_XPositions,Y
    TYX
    STY.W ProjectileIndex
    JSL MoveMissileHorizontally
    TXY
    PLX : STX.W ProjectileIndex
    LDA.W SamusProjectile_Types,X : AND.W #$0F00 : CMP.W #$0800 : BNE .return

  .explosion:
    TYX
    JSL Clear_Projectile
    RTS

  .slow:
    LDA.W SamusProjectile_Types,X : AND.W #$0F00 : CMP.W #$0800 : BEQ .explosion
    LDA.W SamusProjectile_XPositions,X : STA.W SamusProjectile_XPositions,Y
    RTS


if !FEATURE_KEEP_UNREFERENCED
;;; $B4A6: Unused. Clear linked super missile if super missile explosion ;;;
UNUSED_ClearLinkedSuperMissileIfSuperMissileExplosion_90B4A6:
;; Parameters:
;;     X: Projectile index
    PHP
    REP #$30
    LDA.W SamusProjectile_Variables,X : BIT.W #$FF00 : BNE .initialized
    PLP
    RTL

  .initialized:
    AND.W #$00FF : TAY
    LDA.W SamusProjectile_Types,X : AND.W #$0F00 : CMP.W #$0800 : BNE .return
    TYX
    JSL Clear_Projectile

  .return:
    PLP
    RTL
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $B4C9: Instruction list - beam trail - empty ;;;
InstList_BeamTrail_Empty:
    dw $0000


;;; $B4CB: Instruction list - left beam trail - ice beams / charged power beam ;;;
InstList_LeftBeamTrail_IceBeams_ChargedPowerBeam:
    dw $0001,$2C38
    dw $0001,$2C38
    dw $0001,$2C38
    dw $0001,$2C38
    dw $0001,$2C39
    dw $0001,$2C39
    dw Instruction_MoveLeftProjectileTrailDownOnePixel
    dw $0001,$2C39
    dw $0001,$2C39
    dw Instruction_MoveLeftProjectileTrailDownOnePixel
    dw $0001,$2C3A
    dw Instruction_MoveLeftProjectileTrailDownOnePixel
    dw $0001,$2C3A
    dw Instruction_MoveLeftProjectileTrailDownOnePixel
    dw $0001,$2C3A
    dw Instruction_MoveLeftProjectileTrailDownOnePixel
    dw $0001,$2C3A
    dw Instruction_MoveLeftProjectileTrailDownOnePixel
    dw $0001,$2C3A
    dw Instruction_MoveLeftProjectileTrailDownOnePixel
    dw $0001,$2C3A
    dw Instruction_MoveLeftProjectileTrailDownOnePixel
    dw $0001,$2C3A
    dw Instruction_MoveLeftProjectileTrailDownOnePixel
    dw $0001,$2C3A
    dw Instruction_MoveLeftProjectileTrailDownOnePixel
    dw $0004,$2C3B
    dw $0000


;;; $B525: Instruction - move left projectile trail down one pixel ;;;
Instruction_MoveLeftProjectileTrailDownOnePixel:
;; Parameters:
;;     Y: Projectile trail index
    LDA.W ProjectileTrail_LeftYPosition,Y : INC : STA.W ProjectileTrail_LeftYPosition,Y
    RTS


;;; $B52D: Instruction list - right beam trail - some ice beams ;;;
InstList_RightBeamTrail_SomeIceBeams:
    dw $0001,$2C38
    dw $0001,$2C38
    dw $0001,$2C38
    dw $0001,$2C38
    dw $0001,$2C39
    dw $0001,$2C39
    dw Instruction_MoveRightProjectileTrailDownOnePixel
    dw $0001,$2C39
    dw $0001,$2C39
    dw Instruction_MoveRightProjectileTrailDownOnePixel
    dw $0001,$2C3A
    dw Instruction_MoveRightProjectileTrailDownOnePixel
    dw $0001,$2C3A
    dw Instruction_MoveRightProjectileTrailDownOnePixel
    dw $0001,$2C3A
    dw Instruction_MoveRightProjectileTrailDownOnePixel
    dw $0001,$2C3A
    dw Instruction_MoveRightProjectileTrailDownOnePixel
    dw $0001,$2C3A
    dw Instruction_MoveRightProjectileTrailDownOnePixel
    dw $0001,$2C3A
    dw Instruction_MoveRightProjectileTrailDownOnePixel
    dw $0001,$2C3A
    dw Instruction_MoveRightProjectileTrailDownOnePixel
    dw $0001,$2C3A
    dw Instruction_MoveRightProjectileTrailDownOnePixel
    dw $0004,$2C3B
    dw $0000


;;; $B587: Instruction - move right projectile trail down one pixel ;;;
Instruction_MoveRightProjectileTrailDownOnePixel:
;; Parameters:
;;     Y: Projectile trail index
    LDA.W ProjectileTrail_RightYPosition,Y : INC : STA.W ProjectileTrail_RightYPosition,Y
    RTS


;;; $B58F: Instruction list - beam trail - wave beam ;;;
InstList_BeamTrail_WaveBeam:
    dw $0004,$2A3C
    dw $0004,$2A3D
    dw $0004,$2A3E
    dw $0004,$2A3F
    dw $0000


;;; $B5A1: Instruction list - beam trail - (super) missile ;;;
InstList_BeamTrail_SuperMissile:
    dw $0004,$2A48
    dw $0004,$2A49
    dw $0004,$2A4A
    dw $0004,$2A4B
    dw $0000


;;; $B5B3: Instruction - move left projectile trail up one pixel ;;;
Instruction_MoveLeftProjectileTrailUpOnePixel:
;; Parameters:
;;     Y: Projectile trail index
    LDA.W ProjectileTrail_LeftYPosition,Y : DEC : STA.W ProjectileTrail_LeftYPosition,Y
    RTS


;;; $B5BB: Projectile trail instruction list pointers - left ;;;
ProjectileTrail_InstListPointers_Left:
    dw InstList_BeamTrail_Empty                                          ;  0: Uncharged power
    dw InstList_BeamTrail_WaveBeam                                       ; *1: Uncharged wave
    dw InstList_LeftBeamTrail_IceBeams_ChargedPowerBeam                  ; *2: Uncharged ice
    dw InstList_LeftBeamTrail_IceBeams_ChargedPowerBeam                  ; *3: Uncharged ice + wave
    dw InstList_BeamTrail_Empty                                          ;  4: Uncharged spazer
    dw InstList_BeamTrail_Empty                                          ;  5: Uncharged spazer + wave
    dw InstList_LeftBeamTrail_IceBeams_ChargedPowerBeam                  ; *6: Uncharged spazer + ice
    dw InstList_LeftBeamTrail_IceBeams_ChargedPowerBeam                  ; *7: Uncharged spazer + ice + wave
    dw InstList_BeamTrail_Empty                                          ;  8: Uncharged plasma
    dw InstList_BeamTrail_Empty                                          ;  9: Uncharged plasma + wave
    dw InstList_LeftBeamTrail_IceBeams_ChargedPowerBeam                  ; *Ah: Uncharged plasma + ice
    dw InstList_LeftBeamTrail_IceBeams_ChargedPowerBeam                  ; *Bh: Uncharged plasma + ice + wave
    dw InstList_BeamTrail_Empty                                          ;  Ch
    dw InstList_BeamTrail_Empty                                          ;  Dh
    dw InstList_BeamTrail_Empty                                          ;  Eh
    dw InstList_BeamTrail_Empty                                          ;  Fh
    dw InstList_LeftBeamTrail_IceBeams_ChargedPowerBeam                  ; *10h: Charged power
    dw InstList_BeamTrail_WaveBeam                                       ; *11h: Charged wave
    dw InstList_LeftBeamTrail_IceBeams_ChargedPowerBeam                  ; *12h: Charged ice
    dw InstList_LeftBeamTrail_IceBeams_ChargedPowerBeam                  ; *13h: Charged ice + wave
    dw InstList_BeamTrail_Empty                                          ;  14h: Charged spazer
    dw InstList_BeamTrail_Empty                                          ;  15h: Charged spazer + wave
    dw InstList_LeftBeamTrail_IceBeams_ChargedPowerBeam                  ; *16h: Charged spazer + ice
    dw InstList_LeftBeamTrail_IceBeams_ChargedPowerBeam                  ; *17h: Charged spazer + ice + wave
    dw InstList_BeamTrail_Empty                                          ;  18h: Charged plasma
    dw InstList_BeamTrail_Empty                                          ;  19h: Charged plasma + wave
    dw InstList_LeftBeamTrail_IceBeams_ChargedPowerBeam                  ; *1Ah: Charged plasma + ice
    dw InstList_LeftBeamTrail_IceBeams_ChargedPowerBeam                  ; *1Bh: Charged plasma + ice + wave
    dw InstList_BeamTrail_Empty                                          ;  1Ch
    dw InstList_BeamTrail_Empty                                          ;  1Dh
    dw InstList_BeamTrail_Empty                                          ;  1Eh
    dw InstList_BeamTrail_Empty                                          ;  1Fh
    dw InstList_BeamTrail_SuperMissile                                   ; *20h: Missile
    dw InstList_BeamTrail_SuperMissile                                   ; *21h: Super missile
    dw InstList_BeamTrail_Empty                                          ;  22h
    dw InstList_BeamTrail_Empty                                          ;  23h
    dw InstList_LeftBeamTrail_IceBeams_ChargedPowerBeam                  ; *24h: Spazer SBA trail
    dw InstList_LeftBeamTrail_IceBeams_ChargedPowerBeam                  ; *25h
    dw InstList_LeftBeamTrail_IceBeams_ChargedPowerBeam                  ; *26h


;;; $B609: Projectile trail instruction list pointers - right ;;;
ProjectileTrail_InstListPointers_Right:
    dw InstList_BeamTrail_Empty                                          ;  0: Uncharged power
    dw InstList_BeamTrail_Empty                                          ;  1: Uncharged wave
    dw InstList_BeamTrail_Empty                                          ;  2: Uncharged ice
    dw InstList_BeamTrail_Empty                                          ;  3: Uncharged ice + wave
    dw InstList_BeamTrail_Empty                                          ;  4: Uncharged spazer
    dw InstList_BeamTrail_Empty                                          ;  5: Uncharged spazer + wave
    dw InstList_RightBeamTrail_SomeIceBeams                              ; *6: Uncharged spazer + ice
    dw InstList_RightBeamTrail_SomeIceBeams                              ; *7: Uncharged spazer + ice + wave
    dw InstList_BeamTrail_Empty                                          ;  8: Uncharged plasma
    dw InstList_BeamTrail_Empty                                          ;  9: Uncharged plasma + wave
    dw InstList_BeamTrail_Empty                                          ;  Ah: Uncharged plasma + ice
    dw InstList_RightBeamTrail_SomeIceBeams                              ; *Bh: Uncharged plasma + ice + wave
    dw InstList_BeamTrail_Empty                                          ;  Ch
    dw InstList_BeamTrail_Empty                                          ;  Dh
    dw InstList_BeamTrail_Empty                                          ;  Eh
    dw InstList_BeamTrail_Empty                                          ;  Fh
    dw InstList_BeamTrail_Empty                                          ;  10h: Charged power
    dw InstList_BeamTrail_WaveBeam                                       ; *11h: Charged wave
    dw InstList_BeamTrail_Empty                                          ;  12h: Charged ice
    dw InstList_RightBeamTrail_SomeIceBeams                              ; *13h: Charged ice + wave
    dw InstList_BeamTrail_Empty                                          ;  14h: Charged spazer
    dw InstList_BeamTrail_Empty                                          ;  15h: Charged spazer + wave
    dw InstList_RightBeamTrail_SomeIceBeams                              ; *16h: Charged spazer + ice
    dw InstList_RightBeamTrail_SomeIceBeams                              ; *17h: Charged spazer + ice + wave
    dw InstList_BeamTrail_Empty                                          ;  18h: Charged plasma
    dw InstList_BeamTrail_Empty                                          ;  19h: Charged plasma + wave
    dw InstList_BeamTrail_Empty                                          ;  1Ah: Charged plasma + ice
    dw InstList_RightBeamTrail_SomeIceBeams                              ; *1Bh: Charged plasma + ice + wave
    dw InstList_BeamTrail_Empty                                          ;  1Ch
    dw InstList_BeamTrail_Empty                                          ;  1Dh
    dw InstList_BeamTrail_Empty                                          ;  1Eh
    dw InstList_BeamTrail_Empty                                          ;  1Fh
    dw InstList_BeamTrail_Empty                                          ;  20h: Missile
    dw InstList_BeamTrail_Empty                                          ;  21h: Super missile
    dw InstList_BeamTrail_Empty                                          ;  22h
    dw InstList_BeamTrail_Empty                                          ;  23h
    dw InstList_LeftBeamTrail_IceBeams_ChargedPowerBeam                  ; *24h: Spazer SBA trail
    dw InstList_RightBeamTrail_SomeIceBeams                              ; *25h
    dw InstList_LeftBeamTrail_IceBeams_ChargedPowerBeam                  ; *26h


;;; $B657: Spawn projectile trail ;;;
Spawn_ProjectileTrail:
;; Parameters:
;;     X: Projectile index
    PHB
    LDA.W SamusProjectile_Types,X : BIT.W #$0F00 : BNE .notBeam
    AND.W #$003F
    BRA +

  .notBeam:
    XBA : AND.W #$000F : CMP.W #$0003 : BCS .returnCarrySet
    CLC : ADC.W #$001F

+   ASL : TAX
    PEA $7E7E : PLB : PLB
    LDY.W #$0022

  .loop:
    LDA.W ProjectileTrail_LeftInstructionTimer,Y : BEQ .found
    DEY #2 : BPL .loop

  .returnCarrySet:
    PLB
    SEC
    RTL

  .found:
    LDA.W #$0001 : STA.W ProjectileTrail_LeftInstructionTimer,Y : STA.W ProjectileTrail_RightInstructionTImer,Y
    LDA.L ProjectileTrail_InstListPointers_Left,X : STA.W ProjectileTrail_LeftInstListPointer,Y
    LDA.L ProjectileTrail_InstListPointers_Right,X : STA.W ProjectileTrail_RightInstListPointer,Y
    LDX.W ProjectileIndex
    JSL SetProjectileTrailPosition
    PLB
    CLC
    RTL


;;; $B6A9: Handle projectile trails ;;;
HandleProjectileTrails:
    PHB
    PEA $7E7E : PLB : PLB
    LDA.W TimeIsFrozenFlag : BEQ .notFrozen
    JMP .timeIsFrozen

  .notFrozen:
    LDY.W #$0022

  .main:
    LDA.W ProjectileTrail_LeftInstructionTimer,Y : BEQ .leftTrailEnd
    DEC : STA.W ProjectileTrail_LeftInstructionTimer,Y : BNE .leftInstructionsEnd
    LDX.W ProjectileTrail_LeftInstListPointer,Y

  .loopLeft:
    LDA.L BeamTrailInstLists_timer,X : BPL .notAPointer
    INX #2
    PEA .loopLeft-1
    STA.B DP_Temp12
    JMP.W (DP_Temp12)

  .notAPointer:
    STA.W ProjectileTrail_LeftInstructionTimer,Y
    BEQ .leftTrailEnd
    LDA.L BeamTrailInstLists_data,X : STA.W ProjectileTrail_LeftTileNumberAttributes,Y
    TXA : CLC : ADC.W #$0004 : STA.W ProjectileTrail_LeftInstListPointer,Y

  .leftInstructionsEnd:
    LDX.W OAMStack : CPX.W #$0200 : BPL .leftTrailEnd
    LDA.W ProjectileTrail_LeftXPosition,Y : SEC : SBC.W Layer1XPosition : BIT.W #$FF00 : BNE .leftTrailEnd
    STA.W OAMLow,X
    LDA.W ProjectileTrail_LeftYPosition,Y : SEC : SBC.W Layer1YPosition : BIT.W #$FF00 : BNE .leftTrailEnd
    STA.W OAMLow+1,X
    LDA.W ProjectileTrail_LeftTileNumberAttributes,Y : STA.W OAMLow+2,X
    TXA : CLC : ADC.W #$0004 : STA.W OAMStack

  .leftTrailEnd:
    LDA.W ProjectileTrail_RightInstructionTImer,Y : BEQ .rightTrailEnd
    DEC : STA.W ProjectileTrail_RightInstructionTImer,Y : BNE .rightInstructionsEnd
    LDX.W ProjectileTrail_RightInstListPointer,Y

  .loop:
    LDA.L BeamTrailInstLists_timer,X : BPL .notPointer
    INX #2
    PEA .loop-1
    STA.B DP_Temp12
    JMP.W (DP_Temp12)

  .notPointer:
    STA.W ProjectileTrail_RightInstructionTImer,Y
    BEQ .rightTrailEnd
    LDA.L BeamTrailInstLists_data,X : STA.W ProjectileTrail_RightTileNumberAttributes,Y
    TXA : CLC : ADC.W #$0004 : STA.W ProjectileTrail_RightInstListPointer,Y

  .rightInstructionsEnd:
    LDX.W OAMStack : CPX.W #$0200 : BPL .rightTrailEnd
    LDA.W ProjectileTrail_RightXPosition,Y : SEC : SBC.W Layer1XPosition : BIT.W #$FF00 : BNE .rightTrailEnd
    STA.W OAMLow,X
    LDA.W ProjectileTrail_RightYPosition,Y : SEC : SBC.W Layer1YPosition : BIT.W #$FF00 : BNE .rightTrailEnd
    STA.W OAMLow+1,X
    LDA.W ProjectileTrail_RightTileNumberAttributes,Y : STA.W OAMLow+2,X
    TXA : CLC : ADC.W #$0004 : STA.W OAMStack

  .rightTrailEnd:
    DEY #2 : BMI .return
    JMP .main

  .return:
    PLB
    RTL

  .timeIsFrozen:
    LDY.W #$0022

  .loopTimeIsFrozen:
    LDX.W OAMStack : CPX.W #$0200 : BPL +
    LDA.W ProjectileTrail_LeftInstructionTimer,Y : BEQ +
    LDA.W ProjectileTrail_LeftXPosition,Y : SEC : SBC.W Layer1XPosition : BIT.W #$FF00 : BNE +
    STA.W OAMLow,X
    LDA.W ProjectileTrail_LeftYPosition,Y : SEC : SBC.W Layer1YPosition : BIT.W #$FF00 : BNE +
    STA.W OAMLow+1,X
    LDA.W ProjectileTrail_LeftTileNumberAttributes,Y : STA.W OAMLow+2,X
    TXA : CLC : ADC.W #$0004 : STA.W OAMStack

+   LDX.W OAMStack : CPX.W #$0200 : BPL .next
    LDA.W ProjectileTrail_RightInstructionTImer,Y : BEQ .next
    LDA.W ProjectileTrail_RightXPosition,Y : SEC : SBC.W Layer1XPosition : BIT.W #$FF00 : BNE .next
    STA.W OAMLow,X
    LDA.W ProjectileTrail_RightYPosition,Y : SEC : SBC.W Layer1YPosition : BIT.W #$FF00 : BNE .next
    STA.W OAMLow+1,X
    LDA.W ProjectileTrail_RightTileNumberAttributes,Y : STA.W OAMLow+2,X
    TXA : CLC : ADC.W #$0004 : STA.W OAMStack

  .next:
    DEY #2 : BMI .returnFrozen
    JMP .loopTimeIsFrozen

  .returnFrozen:
    PLB
    RTL


;;; $B80D: HUD selection handler - nothing / power bombs ;;;
HUDSelectionHandler_Nothing_PowerBombs:
    PHP
    REP #$30
    LDA.W SamusProjectile_FlareCounter : STA.W PreviousBeamChargeCounter
    LDA.W HyperBeam : BNE +
    LDA.W EquippedBeams : BIT.W #$1000 : BNE .charge

+   LDA.B DP_Controller1Input : AND.W ShotBinding : BEQ .return
    JMP Fire_Uncharge_Beam

  .charge:
    LDA.W PoseTransitionShotDirection : BEQ +
    LDA.W SamusProjectile_FlareCounter : CMP.W #$003C : BPL .releaseChargedBeam
    BRA .releaseUnchargedBeam

+   LDA.B DP_Controller1Input : AND.W ShotBinding : BEQ +
    LDA.W SamusProjectile_FlareCounter : CMP.W #$0078 : BPL .SBA
    INC : STA.W SamusProjectile_FlareCounter
    CMP.W #$0001 : BNE .return
    JSR ClearFlareAnimationState
    JMP Fire_Uncharge_Beam

+   LDA.W SamusProjectile_FlareCounter : BEQ .return
    CMP.W #$003C : BPL .releaseChargedBeam

  .releaseUnchargedBeam:
    STZ.W SamusProjectile_FlareCounter
    JSR ClearFlareAnimationState
    JMP Fire_Uncharge_Beam

  .releaseChargedBeam:
    STZ.W SamusProjectile_FlareCounter
    JSR ClearFlareAnimationState
    JMP FireChargeBeam

  .SBA:
    JSR FireSBA
    BCC .return
    STZ.W SamusProjectile_FlareCounter
    JSR ClearFlareAnimationState
    JSL LoadSamusSuitPalette

  .return:
    PLP
    RTS


;;; $B887: Fire uncharged beam ;;;
Fire_Uncharge_Beam:
    LDA.W HyperBeam : BEQ .notHyper
    JMP FireHyperBeam

  .notHyper:
    JSR Check_if_Samus_Can_Fire_Beam
    BCS .fire

  .cannotFire:
    LDA.W PreviousBeamChargeCounter : CMP.W #$0010 : BPL +
    PLP
    RTS

+   STZ.W ResumeChargingBeamSFXFlag
    LDA.W #$0002
    JSL QueueSound
    PLP
    RTS

  .fire:
    LDX.W #$0000

  .loop:
    LDA.W SamusProjectile_Damages,X : BEQ .zeroDamage
    INX #2 : CPX.W #$000A : BMI .loop
    DEX #2

  .zeroDamage:
    STX.B DP_Temp14
    JSR InitializeProjectilePositionDirection
    BCS .cannotFire
    LDA.W #$000A : STA.W ProjectileInvincibilityTImer
    LDX.B DP_Temp14
    LDA.W #$0004 : STA.W SamusProjectile_TrailTimers,X
    LDA.W EquippedBeams : ORA.W #$8000 : STA.W SamusProjectile_Types,X
    AND.W #$000F : ASL : TAY
    LDA.W ProjectileSFX_Uncharged,Y
    JSL QueueSound
    STZ.W ResumeChargingBeamSFXFlag
    JSL InitializeProjectile
    LDA.W EquippedBeams : BIT.W #$1000 : BNE .chargeEquippedOrPreviouslyPressedShot
    LDA.B DP_Controller1New : BIT.W ShotBinding : BNE .chargeEquippedOrPreviouslyPressedShot
    LDA.W PreviousController1NewDrawing : BIT.W ShotBinding : BNE .chargeEquippedOrPreviouslyPressedShot
    LDA.W SamusProjectile_Types,X : PHA
    AND.W #$003F : TAY
    LDA.W BeamAutoFireCooldowns,Y : AND.W #$00FF : STA.W SamusProjectile_CooldownTimer
    PLA : BIT.W #$0001 : BNE .waveBeam
    BRA +

  .chargeEquippedOrPreviouslyPressedShot:
    LDA.W SamusProjectile_Types,X : PHA
    AND.W #$003F : TAY
    LDA.W ProjectileCooldowns_Uncharged,Y : AND.W #$00FF : STA.W SamusProjectile_CooldownTimer
    PLA : BIT.W #$0001 : BNE .waveBeam

+   STZ.W SamusProjectile_XVelocities,X : STZ.W SamusProjectile_YVelocities,X
    STX.W ProjectileIndex
    JSR InitialBeamBlockCollision_NoWaveBeam
    LDX.W ProjectileIndex
    LDA.W SamusProjectile_Types,X : BIT.W #$0F00 : BNE .return
    BRA .merge

  .waveBeam:
    STZ.W SamusProjectile_XVelocities,X : STZ.W SamusProjectile_YVelocities,X
    STX.W ProjectileIndex
    JSR InitialWaveBeamBlockCollision

  .merge:
    STX.B DP_Temp14
    LDA.W SamusProjectile_Types,X : AND.W #$000F : ASL : TAY
    LDA.W .pointers,Y : STA.W SamusProjectile_PreInstructions,X
    JSL InitializeBeamVelocities

  .return:
    PLP
    RTS

  .pointers:
; Projectile pre-instruction pointers
    dw ProjectilePreInstruction_Beam_NoWaveBeam                          ; 0: Power
    dw ProjectilePreInstruction_Beam_UnchargedIceWave                    ; 1: Wave
    dw ProjectilePreInstruction_Beam_NoWaveBeam                          ; 2: Ice
    dw ProjectilePreInstruction_Beam_UnchargedIceWave                    ; 3: Ice + wave
    dw ProjectilePreInstruction_Beam_NoWaveBeam                          ; 4: Spazer
    dw ProjectilePreInstruction_Beam_WavePlasmaSpazer_ChargeIceWave      ; 5: Spazer + wave
    dw ProjectilePreInstruction_Beam_NoWaveBeam                          ; 6: Spazer + ice
    dw ProjectilePreInstruction_Beam_WavePlasmaSpazer_ChargeIceWave      ; 7: Spazer + ice + wave
    dw ProjectilePreInstruction_Beam_NoWaveBeam                          ; 8: Plasma
    dw ProjectilePreInstruction_Beam_WavePlasmaSpazer_ChargeIceWave      ; 9: Plasma + wave
    dw ProjectilePreInstruction_Beam_NoWaveBeam                          ; Ah: Plasma + ice
    dw ProjectilePreInstruction_Beam_WavePlasmaSpazer_ChargeIceWave      ; Bh: Plasma + ice + wave


;;; $B986: Fire charged beam ;;;
FireChargeBeam:
    JSR Check_if_Samus_Can_Fire_Beam
    BCS .fire

  .cannotFire:
    LDA.W PreviousBeamChargeCounter : CMP.W #$0010 : BPL +
    PLP
    RTS

+   STZ.W ResumeChargingBeamSFXFlag
    LDA.W #$0002
    JSL QueueSound
    PLP
    RTS

  .fire:
    LDX.W #$0000

  .loop:
    LDA.W SamusProjectile_Damages,X : BEQ .zeroDamage
    INX #2 : CPX.W #$000A : BMI .loop
    DEX #2

  .zeroDamage:
    STX.B DP_Temp14
    JSR InitializeProjectilePositionDirection
    BCS .cannotFire
    LDA.W #$000A : STA.W ProjectileInvincibilityTImer
    LDX.B DP_Temp14
    LDA.W #$0004 : STA.W SamusProjectile_TrailTimers,X
    LDA.W EquippedBeams : AND.W #$100F : ORA.W #$8010 : STA.W SamusProjectile_Types,X
    AND.W #$000F : ASL : TAY
    LDA.W ProjectileSFX_Charged,Y
    JSL QueueSound
    STZ.W ResumeChargingBeamSFXFlag
    JSL InitializeProjectile
    LDA.W SamusProjectile_Types,X : PHA
    AND.W #$003F : TAY
    LDA.W ProjectileCooldowns_Uncharged,Y : AND.W #$00FF : STA.W SamusProjectile_CooldownTimer
    PLA : BIT.W #$0001 : BNE .waveBeam
    STZ.W SamusProjectile_XVelocities,X : STZ.W SamusProjectile_YVelocities,X
    STX.W ProjectileIndex
    JSR InitialBeamBlockCollision_NoWaveBeam
    LDX.W ProjectileIndex
    LDA.W SamusProjectile_Types,X : BIT.W #$0F00 : BNE .return
    BRA +

  .waveBeam:
    STZ.W SamusProjectile_XVelocities,X : STZ.W SamusProjectile_YVelocities,X
    STX.W ProjectileIndex
    JSR InitialWaveBeamBlockCollision

+   STX.B DP_Temp14
    LDA.W SamusProjectile_Types,X : AND.W #$000F : ASL : TAY
    LDA.W FireChargeBeam_pointers,Y : STA.W SamusProjectile_PreInstructions,X
    JSL InitializeBeamVelocities

  .return:
    LDA.W #$0004 : STA.W ChargedShotGlowTimer
    PLP
    RTS

  .pointers:
; Projectile pre-instruction pointers
    dw ProjectilePreInstruction_Beam_NoWaveBeam                          ; 0: Power
    dw ProjectilePreInstruction_Beam_WavePlasmaSpazer_ChargeIceWave      ; 1: Wave
    dw ProjectilePreInstruction_Beam_NoWaveBeam                          ; 2: Ice
    dw ProjectilePreInstruction_Beam_WavePlasmaSpazer_ChargeIceWave      ; 3: Ice + wave
    dw ProjectilePreInstruction_Beam_NoWaveBeam                          ; 4: Spazer
    dw ProjectilePreInstruction_Beam_WavePlasmaSpazer_ChargeIceWave      ; 5: Spazer + wave
    dw ProjectilePreInstruction_Beam_NoWaveBeam                          ; 6: Spazer + ice
    dw ProjectilePreInstruction_Beam_WavePlasmaSpazer_ChargeIceWave      ; 7: Spazer + ice + wave
    dw ProjectilePreInstruction_Beam_NoWaveBeam                          ; 8: Plasma
    dw ProjectilePreInstruction_Beam_WavePlasmaSpazer_ChargeIceWave      ; 9: Plasma + wave
    dw ProjectilePreInstruction_Beam_NoWaveBeam                          ; Ah: Plasma + ice
    dw ProjectilePreInstruction_Beam_WavePlasmaSpazer_ChargeIceWave      ; Bh: Plasma + ice + wave


;;; $BA56: Initialise projectile position / direction ;;;
InitializeProjectilePositionDirection:
;; Parameters:
;;     $14: Projectile index
;; Returns:
;;     Carry: Clear is can fire, set otherwise

; As far as I can tell, .returnNoFire can only possibly be taken when trying to shoot whilst in pose BEh/F0h (grabbed by Draygon - moving)
    LDA.W Pose : ASL #3 : TAX
    LDY.B DP_Temp14
    LDA.W PoseTransitionShotDirection : BEQ .zero
    AND.W #$00FF
    STZ.W PoseTransitionShotDirection
    BRA .initialize

  .zero:
    LDA.L PoseDefinitions_directionShotsFired,X : AND.W #$00FF : BIT.W #$00F0 : BEQ .initialize
    CMP.W #$0010 : BEQ .unused
    JMP .returnNoFire

  .initialize:
    STA.W SamusProjectile_Directions,Y
    LDA.L PoseDefinitions_YOffset,X : AND.W #$00FF : STA.B DP_Temp16
    LDA.W SamusProjectile_Directions,Y : AND.W #$000F : ASL : TAX
    LDA.W Pose : CMP.W #$0075 : BEQ .notMoonwalk
    CMP.W #$0076 : BEQ .notMoonwalk
    LDA.W MovementType : AND.W #$00FF : CMP.W #$0001 : BEQ .notMoonwalk
    LDA.W ProjectileOriginOffsetsByDirection_ProjectileX_Default,X : CLC : ADC.W SamusXPosition : STA.W SamusProjectile_XPositions,Y
    LDA.W ProjectileOriginOffsetsByDirection_ProjectileY_Default,X : CLC : ADC.W SamusYPosition
    SEC : SBC.B DP_Temp16 : STA.W SamusProjectile_YPositions,Y
    CLC
    RTS

  .notMoonwalk:
    LDA.W ProjectileOriginOffsetsByDirection_ProjX_Moonwalk_Running,X : CLC : ADC.W SamusXPosition : STA.W SamusProjectile_XPositions,Y
    LDA.W ProjectileOriginOffsetsByDirection_ProjY_Moonwalk_Running,X : CLC : ADC.W SamusYPosition
    SEC : SBC.B DP_Temp16 : STA.W SamusProjectile_YPositions,Y
    CLC
    RTS

  .unused:
    PHX
    LDA.W LastDifferentPose : ASL #3 : TAX
    LDA.L PoseDefinitions_directionShotsFired,X : BIT.W #$00F0 : BNE +
    AND.W #$00FF
    PLX
    JMP .initialize

+   PLX

  .returnNoFire:
    DEC.W SamusProjectile_ProjectileCounter
    SEC
    RTS


;;; $BAFC: Handle charging beam graphics / audio ;;;
HandleChargingBeamGraphicsAudio:
    PHP
    REP #$30
    LDA.W HyperBeam : BNE .gotoHyperBeam
    LDA.W SamusProjectile_FlareCounter : BEQ .returnUpper
    BPL .chargeBeam

  .returnUpper:
    PLP
    RTS

  .gotoHyperBeam:
    JMP .hyperBeam

  .chargeBeam:
    CMP.W #$0001 : BNE .notOne
    STZ.W SamusProjectile_FlareAnimationFrame
    STZ.W SamusProjectile_FlareSlowSparksAnimationFrame0CD8 : STZ.W SamusProjectile_FlareFastSparksAnimationFrame0CDA
    LDA.W #$0003 : STA.W SamusProjectile_FlareAnimationTimer
    LDA.W #$0005 : STA.W SamusProjectile_FlareSlowSparksAnimationFrame0CDE
    LDA.W #$0004 : STA.W SamusProjectile_FlareFastSparksAnimationFrame0CE0

  .notOne:
    LDA.W SamusProjectile_FlareCounter : CMP.W #$000F : BPL +
    JMP .returnMiddle

+   CMP.W #$0010 : BNE .zeroIndex
    LDA.W #$0008
    JSL QueueSound_Lib1_Max9

  .zeroIndex:
    LDX.W #$0000

  .loopChargeBeam:
    SEP #$20
    LDA.B #$90 : STA.B DP_Temp02
    REP #$20
    LDA.W SamusProjectile_FlareAnimationTimer,X : DEC : STA.W SamusProjectile_FlareAnimationTimer,X : BPL .chargeBeamAnimationUpdateEnd
    LDA.W SamusProjectile_FlareAnimationFrame,X : INC : STA.W SamusProjectile_FlareAnimationFrame,X
    TAY
    LDA.W FlareAnimationDelays_Pointers,X : STA.B DP_Temp00
    LDA.B [DP_Temp00],Y : AND.W #$00FF : CMP.W #$00FF : BEQ .restart
    CMP.W #$00FE : BEQ .goBack
    BRA .merge

  .restart:
    LDA.W #$0000 : STA.W SamusProjectile_FlareAnimationFrame,X
    TAY
    BRA .merge

  .goBack:
    INY
    LDA.B [DP_Temp00],Y : AND.W #$00FF : STA.B DP_Temp12
    LDA.W SamusProjectile_FlareAnimationFrame,X : SEC : SBC.B DP_Temp12 : STA.W SamusProjectile_FlareAnimationFrame,X
    TAY

  .merge:
    LDA.B [DP_Temp00],Y : AND.W #$00FF : STA.W SamusProjectile_FlareAnimationTimer,X

  .chargeBeamAnimationUpdateEnd:
    PHX
    JSR DrawFlareAnimationComponent
    PLX
    LDA.W SamusProjectile_FlareCounter : CMP.W #$001E : BMI .returnMiddle
    INX #2 : CPX.W #$0006 : BMI .loopChargeBeam

  .returnMiddle:
    PLP
    RTS

  .hyperBeam:
    LDA.W SamusProjectile_FlareCounter : BEQ .returnLower
    LDX.W #$0004

  .loopHyperBeam:
    DEC.W SamusProjectile_FlareAnimationTimer,X : BEQ .timerExpired
    BPL .hyperBeamAnimationUpdateEnd

  .timerExpired:
    DEC.W SamusProjectile_FlareAnimationFrame,X : BNE .nonZeroAnimationFrame
    CPX.W #$0004 : BNE .hyperBeamAnimationUpdateEnd
    STZ.W SamusProjectile_FlareCounter
    BRA .hyperBeamAnimationUpdateEnd

  .nonZeroAnimationFrame:
    LDA.W #$0003 : STA.W SamusProjectile_FlareAnimationTimer,X

  .hyperBeamAnimationUpdateEnd:
    PHX
    JSR DrawFlareAnimationComponent
    PLX : DEX #2 : BPL .loopHyperBeam

  .returnLower:
    PLP
    RTS


;;; $BBE1: Draw flare animation component ;;;
DrawFlareAnimationComponent:
;; Parameters:
;;     X: Flare animation index (0/2/4)

; Is this making sure charging works in the rotating elevator room?!
    PHP
    SEP #$20
    LDA.B #$93 : STA.B DP_Temp02
    REP #$30
    LDA.W SamusProjectile_FlareAnimationFrame,X : AND.W #$00FF : STA.B DP_Temp12
    LDA.W PoseXDirection : AND.W #$00FF : CMP.W #$0004 : BEQ .facingLeft
    LDA.L FlareSpritemapTable_IndexOffsets_facingRight,X : CLC : ADC.B DP_Temp12 : STA.B DP_Temp16
    BRA +

  .facingLeft:
    LDA.L FlareSpritemapTable_IndexOffsets_facingLeft,X : CLC : ADC.B DP_Temp12 : STA.B DP_Temp16

+   LDA.W Pose : ASL #3 : TAX
    LDA.L PoseDefinitions_YOffset,X : AND.W #$00FF : STA.B DP_Temp18
    LDA.L PoseDefinitions_directionShotsFired,X : AND.W #$00FF : CMP.W #$00FF : BEQ .returnUpper
    CMP.W #$0010 : BEQ .returnUpper
    CMP.W #$0010 : BNE .continue

  .returnUpper:
    PLP
    RTS

  .continue:
    AND.W #$000F : ASL : TAX
    LDA.W CeresStatus : BPL .notRotating
    LDA.W SamusXPosition : STA.W BackupSamusXPosition
    LDA.W SamusYPosition : STA.W BackupSamusYPosition
    JSL Calculate_SamusPosition_InRotatingElevatorRoom

  .notRotating:
    LDA.W MovementType : AND.W #$00FF : CMP.W #$0001 : BEQ .running
    LDA.W ProjectileOriginOffsetsByDirection_FlareX_Default,X : CLC : ADC.W SamusXPosition
    SEC : SBC.W Layer1XPosition : STA.B DP_Temp14
    LDA.W ProjectileOriginOffsetsByDirection_FlareY_Default,X : CLC : ADC.W SamusYPosition
    SEC : SBC.B DP_Temp18 : SBC.W Layer1YPosition : STA.B DP_Temp12
    BRA +

  .running:
    LDA.W ProjectileOriginOffsetsByDirection_FlareX_Running,X : CLC : ADC.W SamusXPosition
    SEC : SBC.W Layer1XPosition : STA.B DP_Temp14
    LDA.W ProjectileOriginOffsetsByDirection_FlareY_Running,X : CLC : ADC.W SamusYPosition
    SEC : SBC.B DP_Temp18 : SBC.W Layer1YPosition : STA.B DP_Temp12

+   AND.W #$FF00 : BNE .greaterThanEqualTo100
    LDA.B DP_Temp16
    JSL AddSpritemapFrom_93A1A1_TableToOAM
    BRA +

  .greaterThanEqualTo100:
    LDA.B DP_Temp16
    JSL RTL_818AB7

+   LDA.W CeresStatus : BPL .returnLower
    LDA.W BackupSamusYPosition : STA.W SamusYPosition
    LDA.W BackupSamusXPosition : STA.W SamusXPosition

  .returnLower:
    PLP
    RTS


;;; $BCBE: Clear flare animation state ;;;
ClearFlareAnimationState:
    STZ.W SamusProjectile_FlareAnimationFrame
    STZ.W SamusProjectile_FlareSlowSparksAnimationFrame0CD8 : STZ.W SamusProjectile_FlareFastSparksAnimationFrame0CDA
    STZ.W SamusProjectile_FlareAnimationTimer
    STZ.W SamusProjectile_FlareSlowSparksAnimationFrame0CDE : STZ.W SamusProjectile_FlareFastSparksAnimationFrame0CE0
    RTS


;;; $BCD1: Fire hyper beam ;;;
FireHyperBeam:
    JSR Check_if_Samus_Can_Fire_Beam
    BCS .canFire
    PLP
    RTS

  .canFire:
    LDX.W #$0000

  .loop:
    LDA.W SamusProjectile_Damages,X : BEQ .zeroDamage
    INX #2 : CPX.W #$000A : BMI .loop
    DEX #2

  .zeroDamage:
    STX.B DP_Temp14
    JSR InitializeProjectilePositionDirection
    BCS .return
    LDA.W #$000A : STA.W ProjectileInvincibilityTImer
    LDX.B DP_Temp14 : PHX
    LDA.W #$9018 : STA.W SamusProjectile_Types,X ; Projectile type = live charged plasma beam | 1000h
    AND.W #$000F : ASL : TAX
    LDA.W ProjectileSFX_Charged,X
    JSL QueueSound
    STZ.W ResumeChargingBeamSFXFlag
    PLX
    JSL InitializeProjectile
    STZ.W SamusProjectile_XVelocities,X : STZ.W SamusProjectile_YVelocities,X
    STX.W ProjectileIndex
    JSR InitialWaveBeamBlockCollision
    LDX.W ProjectileIndex
    LDA.L HyperBeamDamageValue : STA.W SamusProjectile_Damages,X
    LDA.W #ProjectilePreInstruction_HyperBeam : STA.W SamusProjectile_PreInstructions,X
    STX.B DP_Temp14
    JSL InitializeBeamVelocities
    LDA.W #$0015 : STA.W SamusProjectile_CooldownTimer
    LDA.W #$8014 : STA.W ChargedShotGlowTimer ; Charged shot glow timer = 20
    LDA.W #$001D : STA.W SamusProjectile_FlareAnimationFrame
    LDA.W #$0005 : STA.W SamusProjectile_FlareSlowSparksAnimationFrame0CD8 : STA.W SamusProjectile_FlareFastSparksAnimationFrame0CDA
    LDA.W #$0003 : STA.W SamusProjectile_FlareAnimationTimer
    STA.W SamusProjectile_FlareSlowSparksAnimationFrame0CDE : STA.W SamusProjectile_FlareFastSparksAnimationFrame0CE0
    LDA.W #$8000 : STA.W SamusProjectile_FlareCounter

  .return:
    PLP
    RTS


;;; $BD64: Initial beam block collision - no wave beam ;;;
InitialBeamBlockCollision_NoWaveBeam:
;; Parameters:
;;     X: Projectile index
    PHX
    LDA.W SamusProjectile_Directions,X : AND.W #$000F : ASL : TAX
    JSR.W (.pointers,X)
    PLX
    RTS

  .pointers:
    dw InitialBeamBlockCollision_NoWaveBeam_Vertical                     ; 0: Up, facing right
    dw InitialBeamBlockCollision_NoWaveBeam_Diagonal                     ; 1: Up-right
    dw InitialBeamBlockCollision_NoWaveBeam_Right                        ; 2: Right
    dw InitialBeamBlockCollision_NoWaveBeam_Diagonal                     ; 3: Down-right
    dw InitialBeamBlockCollision_NoWaveBeam_Vertical                     ; 4: Down, facing right
    dw InitialBeamBlockCollision_NoWaveBeam_Vertical                     ; 5: Down, facing left
    dw InitialBeamBlockCollision_NoWaveBeam_Diagonal                     ; 6: Down-left
    dw InitialBeamBlockCollision_NoWaveBeam_Left                         ; 7: Left
    dw InitialBeamBlockCollision_NoWaveBeam_Diagonal                     ; 8: Up-left
    dw InitialBeamBlockCollision_NoWaveBeam_Vertical                     ; 9: Up, facing left


;;; $BD86: Initial beam block collision - no wave beam - vertical ;;;
InitialBeamBlockCollision_NoWaveBeam_Vertical:
    LDX.W ProjectileIndex
    JSL MoveBeamVertically_NoWaveBeam
    RTS


;;; $BD8E: Initial beam block collision - no wave beam - diagonal ;;;
InitialBeamBlockCollision_NoWaveBeam_Diagonal:
    LDX.W ProjectileIndex
    JSL MoveBeamHorizontally_NoWaveBeam
    BCS .return
    JSL MoveBeamVertically_NoWaveBeam

  .return:
    RTS


;;; $BD9C: Initial beam block collision - no wave beam - right ;;;
InitialBeamBlockCollision_NoWaveBeam_Right:
    LDX.W ProjectileIndex
    JSL MoveBeamHorizontally_NoWaveBeam
    RTS


;;; $BDA4: Initial beam block collision - no wave beam - left ;;;
InitialBeamBlockCollision_NoWaveBeam_Left:
    LDX.W ProjectileIndex
    LDA.W #$FFFF : STA.W SamusProjectile_XVelocities,X
    JSL MoveBeamHorizontally_NoWaveBeam
    RTS


;;; $BDB2: Initial wave beam block collision ;;;
InitialWaveBeamBlockCollision:
;; Parameters:
;;     X: Projectile index
    PHX
    LDA.W SamusProjectile_Directions,X : AND.W #$000F : ASL : TAX
    JSR.W (.pointers,X)
    PLX
    RTS

  .pointers:
    dw InitialWaveBeamBlockCollision_Vertical ; 0: Up, facing right
    dw InitialWaveBeamBlockCollision_Diagonal ; 1: Up-right
    dw InitialWaveBeamBlockCollision_Right ; 2: Right
    dw InitialWaveBeamBlockCollision_Diagonal ; 3: Down-right
    dw InitialWaveBeamBlockCollision_Vertical ; 4: Down, facing right
    dw InitialWaveBeamBlockCollision_Vertical ; 5: Down, facing left
    dw InitialWaveBeamBlockCollision_Diagonal ; 6: Down-left
    dw InitialWaveBeamBlockCollision_Left ; 7: Left
    dw InitialWaveBeamBlockCollision_Diagonal ; 8: Up-left
    dw InitialWaveBeamBlockCollision_Vertical ; 9: Up, facing left


;;; $BDD4: Initial wave beam block collision - vertical ;;;
InitialWaveBeamBlockCollision_Vertical:
    LDX.W ProjectileIndex
    JSL MoveBeamVertically_WaveBeam
    RTS


;;; $BDDC: Initial wave beam block collision - diagonal ;;;
InitialWaveBeamBlockCollision_Diagonal:
    LDX.W ProjectileIndex
    JSL MoveBeamHorizontally_WaveBeam
    BCS .return
    JSL MoveBeamVertically_WaveBeam

  .return:
    RTS


;;; $BDEA: Initial wave beam block collision - right ;;;
InitialWaveBeamBlockCollision_Right:
    LDX.W ProjectileIndex
    JSL MoveBeamHorizontally_WaveBeam
    RTS


;;; $BDF2: Initial wave beam block collision - left ;;;
InitialWaveBeamBlockCollision_Left:
    LDX.W ProjectileIndex
    LDA.W #$FFFF : STA.W SamusProjectile_XVelocities,X
    JSL MoveBeamHorizontally_WaveBeam
    RTS


;;; $BE00: Projectile reflection ;;;
ProjectileReflection:
;; Parameters:
;;     $14: Projectile index
    PHP : PHB
    PHK : PLB
    REP #$30
    PHX
    LDX.B DP_Temp14
    LDA.W SamusProjectile_Types,X : BIT.W #$0100 : BNE .missile
    BIT.W #$0200 : BNE .super
    JSL InitializeBeamVelocities
    JSL InitializeProjectile
    LDA.W SamusProjectile_Types,X : AND.W #$000F : ASL : TAY
    LDA.W FireChargeBeam_pointers,Y : STA.W SamusProjectile_PreInstructions,X
    TXY
    BRA .return

  .missile:
    JSL InitializeProjectile
    LDA.W #ProjectilePreInstruction_Missile : STA.W SamusProjectile_PreInstructions,X
    LDA.W #$00F0 : STA.W SamusProjectile_Variables,X
    BRA .return

  .super:
    PHX
    LDA.W SamusProjectile_Variables,X : AND.W #$00FF : TAX
    JSL Clear_Projectile
    PLX
    JSL InitializeProjectile
    LDA.W #ProjectilePreInstruction_SuperMissile : STA.W SamusProjectile_PreInstructions,X
    LDA.W #$00F0 : STA.W SamusProjectile_Variables,X

  .return:
    PLX : PLB : PLP
    RTL


;;; $BE62: HUD selection handler - missiles / super missiles ;;;
HUDSelectionHandler_Missiles_SuperMissiles:
; The checks at $BE8D and $BE94 *should* be useless, due to (super) missiles getting deselected when they reach 0
; But actually, crystal flash can reduce the ammo count to zero and does *not* deselect the weapon, so the checks aren't quite useless
    PHP
    REP #$30
    LDA.B DP_Controller1New : BIT.W ShotBinding : BNE .checkIfCanFire
    LDA.W PreviousController1NewDrawing : BIT.W ShotBinding : BNE .checkIfCanFire
    PLP
    RTS

  .checkIfCanFire:
    JSR Check_if_Samus_Can_Fire_Missile
    BCS .fire

  .returnUpper:
    PLP
    RTS

  .cannotFire:
    DEC.W SamusProjectile_ProjectileCounter
    PLP
    RTS

  .fire:
    LDA.W SelectedHUDItem : CMP.W #$0002 : BEQ .selectedSupers
    LDA.W Missiles : BEQ .cannotFire
    BRA .zeroIndex

  .selectedSupers:
    LDA.W SuperMissiles : BEQ .cannotFire

  .zeroIndex:
    LDX.W #$0000

  .loop:
    LDA.W SamusProjectile_Damages,X : BEQ +
    INX #2 : CPX.W #$000A : BMI .loop
    BRA .cannotFire

+   STX.B DP_Temp14
    JSR InitializeProjectilePositionDirection
    BCC +
    JMP .returnUpper

+   LDA.W #$0014 : STA.W ProjectileInvincibilityTImer
    LDA.W SelectedHUDItem : CMP.W #$0002 : BEQ .decSuperCount
    DEC.W Missiles
    BRA +

  .decSuperCount:
    DEC.W SuperMissiles

+   LDX.B DP_Temp14
    LDA.W #$0004 : STA.W SamusProjectile_TrailTimers,X
    LDA.W SelectedHUDItem : PHA
    XBA : STA.B DP_Temp12
    LDA.W SamusProjectile_Types,X : ORA.B DP_Temp12 : ORA.W #$8000 : STA.W SamusProjectile_Types,X
    PLA : AND.W #$000F : ASL : TAX
    LDA.W CinematicFunction : BNE .init
    LDA.W ProjectileSFX_NonBeamProjectiles,X
    JSL QueueSound_Lib1_Max6

  .init:
    JSR InitializeMissileVelocities
    JSL InitializeProjectile
    LDA.W SamusProjectile_Types,X : PHA
    BIT.W #$0200 : BNE .superMissile
    LDA.W #ProjectilePreInstruction_Missile : STA.W SamusProjectile_PreInstructions,X
    BRA +

  .superMissile:
    LDA.W #ProjectilePreInstruction_SuperMissile : STA.W SamusProjectile_PreInstructions,X

+   PLA : XBA : AND.W #$000F : TAY
    LDA.W ProjectileCooldowns_NonBeamProjectiles,Y : AND.W #$00FF : STA.W SamusProjectile_CooldownTimer
    LDA.W AutoCancelHUDItemIndex : BEQ +
    STZ.W SelectedHUDItem : STZ.W AutoCancelHUDItemIndex
    BRA .returnLower

+   LDA.W SelectedHUDItem : CMP.W #$0002 : BEQ .supersSelected
    LDA.W Missiles : BNE .returnLower
    BRA .clearHUDSelection

  .supersSelected:
    LDA.W SuperMissiles : BNE .returnLower

  .clearHUDSelection:
    STZ.W SelectedHUDItem

  .returnLower:
    PLP
    RTS


;;; $BF46: Spawn super missile link ;;;
Spawn_SuperMissileLink:
    LDX.W #$0000

  .loop:
    LDA.W SamusProjectile_Damages,X : BEQ .zeroDamage
    INX #2 : CPX.W #$000A : BMI .loop
    BRA .return

  .zeroDamage:
    STX.B DP_Temp14
    TXY
    LDA.W SamusProjectile_Types,Y : ORA.W #$8200 : STA.W SamusProjectile_Types,Y
    LDX.W ProjectileIndex
    LDA.W SamusProjectile_XPositions,X : STA.W SamusProjectile_XPositions,Y
    LDA.W SamusProjectile_YPositions,X : STA.W SamusProjectile_YPositions,Y
    LDA.W SamusProjectile_Directions,X : STA.W SamusProjectile_Directions,Y
    JSR InitializeProjectilePositionDirection
    TYX
    JSL InitializeSuperMissileLink
    LDA.W #ProjectilePreInstruction_SuperMissileLink : STA.W SamusProjectile_PreInstructions,X
    STX.B DP_Temp12
    LDX.W ProjectileIndex
    LDA.W SamusProjectile_Variables,X : AND.W #$FF00 : CLC : ADC.B DP_Temp12 : STA.W SamusProjectile_Variables,X
    INC.W SamusProjectile_ProjectileCounter

  .return:
    RTS


;;; $BF9B: Bomb timer reset value ;;;
BombTimerResetValue:
    dw $003C


;;; $BF9D: HUD selection handler - morph ball ;;;
HUDSelectionHandler_MorphBall:
    PHP
    REP #$30
    LDA.B DP_Controller1Input : AND.W ShotBinding : BEQ .notPressingShot
    LDA.W SelectedHUDItem : CMP.W #$0003 : BNE .bomb
    JMP .powerBomb

  .notPressingShot:
    LDA.W SamusProjectile_FlareCounter : BEQ .return
    LDA.W #$0002
    JSL QueueSound_Lib1_Max9
    STZ.W SamusProjectile_FlareCounter
    JSR ClearFlareAnimationState
    JSL LoadSamusSuitPalette

  .return:
    PLP
    RTS

  .bomb:
    JSR FireBombOrBombSpread
    BCC .returnBomb
    LDX.W #$000A

  .loopBomb:
    LDA.W SamusProjectile_Types,X : BEQ .noProjectileType
    INX #2 : CPX.W #$0014 : BMI .loopBomb
    DEX #2

  .noProjectileType:
    STX.B DP_Temp14
    LDA.W #$0500 : STA.W SamusProjectile_Types,X
    PHA
    LDA.W #$0000 : STA.W SamusProjectile_Directions,X
    LDA.W SamusXPosition : STA.W SamusProjectile_XPositions,X
    LDA.W SamusYPosition : STA.W SamusProjectile_YPositions,X
    LDA.W BombTimerResetValue : STA.W SamusProjectile_Variables,X
    JSL InitializeBomb
    LDA.W #ProjectilePreInstruction_Bomb : STA.W SamusProjectile_PreInstructions,X
    PLA : XBA : AND.W #$000F : TAY
    LDA.W ProjectileCooldowns_NonBeamProjectiles,Y : AND.W #$00FF : STA.W SamusProjectile_CooldownTimer

  .returnBomb:
    PLP
    RTS

  .powerBomb:
    LDA.W SamusProjectile_PowerBombFlag : BPL .inactive

  .returnPowerBomb:
    PLP
    RTS

  .inactive:
    JSR FireBomb
    BCC .returnPowerBomb
    LDA.W PowerBombs : BEQ .returnFinal
    DEC : STA.W PowerBombs : BMI .returnFinal
    LDA.W #$FFFF : STA.W SamusProjectile_PowerBombFlag
    LDX.W #$000A

  .loopPowerBomb:
    LDA.W SamusProjectile_Types,X : BEQ +
    INX #2 : CPX.W #$0014 : BMI .loopPowerBomb
    DEX #2

+   STX.B DP_Temp14
    LDA.W SelectedHUDItem : XBA : STA.B DP_Temp12
    LDA.W SamusProjectile_Types,X : ORA.B DP_Temp12 : STA.W SamusProjectile_Types,X
    PHA
    LDA.W #$0000 : STA.W SamusProjectile_Directions,X
    LDA.W SamusXPosition : STA.W SamusProjectile_XPositions,X
    LDA.W SamusYPosition : STA.W SamusProjectile_YPositions,X
    LDA.W BombTimerResetValue : STA.W SamusProjectile_Variables,X
    JSL InitializeBomb
    LDA.W #ProjectilePreInstruction_PowerBomb : STA.W SamusProjectile_PreInstructions,X
    PLA : XBA : AND.W #$000F : TAY
    LDA.W ProjectileCooldowns_NonBeamProjectiles,Y : AND.W #$00FF : STA.W SamusProjectile_CooldownTimer
    LDA.W AutoCancelHUDItemIndex : BEQ +
    STZ.W SelectedHUDItem : STZ.W AutoCancelHUDItemIndex
    BRA .returnFinal

+   LDA.W SelectedHUDItem : CMP.W #$0003 : BNE .returnFinal
    LDA.W PowerBombs : BNE .returnFinal
    STZ.W SelectedHUDItem

  .returnFinal:
    PLP
    RTS


;;; $C0AB: Charge bomb spread or reserve slot to fire bomb ;;;
FireBombOrBombSpread:
;; Returns:
;;     Carry: Set if reserved bomb slot, otherwise clear
    LDA.W EquippedItems : BIT.W #$1000 : BEQ .return
    LDA.W SamusProjectile_FlareCounter : CMP.W #$003C : BMI FireBomb
    LDA.W SamusProjectile_BombCounter : BNE FireBomb
    LDA.B DP_Controller1Input : BIT.W #$0400 : BEQ .bombSpread
    LDA.W SamusProjectile_BombSpreadChargeTimeoutCounter : AND.W #$00C0 : CMP.W #$00C0 : BPL .bombSpread
    INC.W SamusProjectile_BombSpreadChargeTimeoutCounter
    BRA .return

  .bombSpread:
    JSR BombSpread
    JSL LoadSamusSuitPalette
    LDA.W #$0002
    JSL QueueSound_Lib1_Max9

  .return:
    CLC
    RTS


;;; $C0E7: Fire (power) bomb ;;;
FireBomb:
;; Returns:
;;     Carry: set if bomb fired, clear otherwise

; The caller routines overwrite the cooldown timer ($C017/$C089), so the (rather odd) increment done here has no effect
    LDA.B DP_Controller1New : BIT.W ShotBinding : BEQ .noFire
    LDA.W SamusProjectile_BombCounter : BEQ +
    CMP.W #$0005 : BPL .noFire
    LDA.W SamusProjectile_CooldownTimer : AND.W #$00FF : BNE .noFire

+   LDA.W SamusProjectile_CooldownTimer : INC : STA.W SamusProjectile_CooldownTimer
    LDA.W SamusProjectile_BombCounter : INC : STA.W SamusProjectile_BombCounter
    SEC
    RTS

  .noFire:
    LDA.W SamusProjectile_FlareCounter : BEQ .returnCarryClear
    LDA.W #$0002
    JSL QueueSound_Lib1_Max9
    STZ.W SamusProjectile_FlareCounter
    JSR ClearFlareAnimationState
    JSL LoadSamusSuitPalette

  .returnCarryClear:
    CLC
    RTS


;;; $C128: Handle bomb ;;;
HandleBomb:
    PHP
    REP #$30
    LDX.W ProjectileIndex
    LDA.W SamusProjectile_Variables,X : BEQ .return
    DEC : STA.W SamusProjectile_Variables,X : BEQ .explosion
    CMP.W #$000F : BNE .return
    LDA.W SamusProjectile_InstructionPointers,X : CLC : ADC.W #$001C : STA.W SamusProjectile_InstructionPointers,X
    BRA .return

  .explosion:
    LDA.W #$0008
    JSL QueueSound_Lib2_Max6
    JSL Initialize_Bomb_Explosion

  .return:
    PLP
    RTS


;;; $C157: Handle power bomb ;;;
HandlePowerBomb:
; The call to Clear_Projectile really shouldn't be there, there's more processing to be done to the projectile this frame
; Clearing projectile RAM should be left for ProjectilePreInstruction_PowerBomb to do, by signalling to delete the projectile
    PHP
    REP #$30
    LDX.W ProjectileIndex
    LDA.W SamusProjectile_Variables,X : BEQ .zero
    DEC : STA.W SamusProjectile_Variables,X : BEQ .explosion
    CMP.W #$000F : BNE .return
    LDA.W SamusProjectile_InstructionPointers,X : CLC : ADC.W #$001C : STA.W SamusProjectile_InstructionPointers,X
    BRA .return

  .explosion:
    LDA.W SamusProjectile_XPositions,X : STA.W SamusProjectile_PowerBombExplosionXPosition
    LDA.W SamusProjectile_YPositions,X : STA.W SamusProjectile_PowerBombExplosionYPosition
    PHX : PHY : PHP : PHB
    JSL Enable_HDMAObjects
    JSL Spawn_PowerBombExplosion
    PLB : PLP : PLY : PLX
    LDA.W #$FFFF : STA.W SamusProjectile_Variables,X
    BRA .return

  .zero:
    LDA.W SamusProjectile_PowerBombFlag : BNE .return
    JSL Clear_Projectile

  .return:
    PLP
    RTS


;;; $C1A8: Projectile origin offsets by direction ;;;
ProjectileOriginOffsetsByDirection:
;        _________________________________________________________ 0: Up, facing right
;       |      ___________________________________________________ 1: Up-right
;       |     |      _____________________________________________ 2: Right
;       |     |     |      _______________________________________ 3: Down-right
;       |     |     |     |      _________________________________ 4: Down, facing right
;       |     |     |     |     |      ___________________________ 5: Down, facing left
;       |     |     |     |     |     |      _____________________ 6: Down-left
;       |     |     |     |     |     |     |      _______________ 7: Left
;       |     |     |     |     |     |     |     |      _________ 8: Up-left
;       |     |     |     |     |     |     |     |     |      ___ 9: Up, facing left
;       |     |     |     |     |     |     |     |     |     |       _______________ Ah: Turning - aiming up / up-left / up-right
;       |     |     |     |     |     |     |     |     |     |      |      _________ Bh: Turning - neutral aim
;       |     |     |     |     |     |     |     |     |     |      |     |      ___ Ch: Turning - aiming down / down-left / down-right
;       |     |     |     |     |     |     |     |     |     |      |     |     |
  .FlareX_Default:
    dw $0002,$0012,$000F,$0011,$0003,$FFFC,$FFEF,$FFF1,$FFEE,$FFFE, $FFFC,$FFFC,$FFFC
  .FlareY_Default:
    dw $FFE4,$FFED,$0001,$0006,$0011,$0011,$0006,$0001,$FFEC,$FFE4, $FFEC,$FFFE,$0008

  .FlareX_Running:
    dw $0002,$0013,$0014,$0012,$0003,$FFFC,$FFEE,$FFEC,$FFED,$FFFE
  .FlareY_Running:
    dw $FFE0,$FFEA,$FFFD,$0006,$0019,$0019,$0006,$FFFD,$FFEC,$FFE0

  .ProjectileX_Default:
    dw $0002,$000D,$000B,$000D,$0002,$FFFB,$FFF2,$FFF5,$FFED,$FFFE
  .ProjectileY_Default:
    dw $FFF8,$FFF3,$0001,$0004,$000D,$000D,$0004,$0001,$FFED,$FFF8

  .ProjX_Moonwalk_Running:
    dw $0002,$000F,$000F,$000D,$0002,$FFFB,$FFF3,$FFF3,$FFF1,$FFFE
  .ProjY_Moonwalk_Running:
    dw $FFF8,$FFF0,$FFFE,$0001,$000D,$000D,$0001,$FFFE,$FFF0,$FFF8


;;; $C254: Projectile cooldowns ;;;
ProjectileCooldowns:
  .Uncharged:
    db $0F ; 0: Power
    db $0F ; 1: Wave
    db $0F ; 2: Ice
    db $0F ; 3: Ice + wave
    db $0F ; 4: Spazer
    db $0F ; 5: Spazer + wave
    db $0F ; 6: Spazer + ice
    db $0F ; 7: Spazer + ice + wave
    db $0F ; 8: Plasma
    db $0F ; 9: Plasma + wave
    db $0C ; Ah: Plasma + ice <-- !
    db $0F ; Bh: Plasma + ice + wave
    db $00,$00,$00,$00

  .charged:
    db $1E ; 0: Power
    db $1E ; 1: Wave
    db $1E ; 2: Ice
    db $1E ; 3: Ice + wave
    db $1E ; 4: Spazer
    db $1E ; 5: Spazer + wave
    db $1E ; 6: Spazer + ice
    db $1E ; 7: Spazer + ice + wave
    db $1E ; 8: Plasma
    db $1E ; 9: Plasma + wave
    db $1E ; Ah: Plasma + ice
    db $1E ; Bh: Plasma + ice + wave
    db $00,$00,$00,$00

if !FEATURE_KEEP_UNREFERENCED
  .unusedPadding:
; Useless padding?
    db $00,$00,$00,$00,$00,$00
endif ; !FEATURE_KEEP_UNREFERENCED

  .NonBeamProjectiles:
    db $00
    db $0A ; Missile
    db $14 ; Super missile
    db $28 ; Power bomb
    db $00
    db $10 ; Bomb
    db $00
    db $00
    db $00


;;; $C283: Beam auto-fire cooldowns ;;;
BeamAutoFireCooldowns:
    db $19,$19,$19,$19,$19,$19,$19,$19,$19,$19,$19,$19


;;; $C28F: Projectile sound effects ;;;
ProjectileSFX:
  .Uncharged:
    dw $000B ; 0: Power
    dw $000D ; 1: Wave
    dw $000C ; 2: Ice
    dw $000E ; 3: Ice + wave
    dw $000F ; 4: Spazer
    dw $0012 ; 5: Spazer + wave
    dw $0010 ; 6: Spazer + ice
    dw $0011 ; 7: Spazer + ice + wave
    dw $0013 ; 8: Plasma
    dw $0016 ; 9: Plasma + wave
    dw $0014 ; Ah: Plasma + ice
    dw $0015 ; Bh: Plasma + ice + wave

  .Charged:
    dw $0017 ; 0: Power
    dw $0019 ; 1: Wave
    dw $0018 ; 2: Ice
    dw $001A ; 3: Ice + wave
    dw $001B ; 4: Spazer
    dw $001E ; 5: Spazer + wave
    dw $001C ; 6: Spazer + ice
    dw $001D ; 7: Spazer + ice + wave
    dw $001F ; 8: Plasma
    dw $0022 ; 9: Plasma + wave
    dw $0020 ; Ah: Plasma + ice
    dw $0021 ; Bh: Plasma + ice + wave

  .NonBeamProjectiles:
;              _________ Missiles
;             |      ___ Super missiles
;             |     |
    dw $0000,$0003,$0004,$0000,$0000,$0000,$0000,$0000,$0000


;;; $C2D1: Beam speeds ;;;
BeamSpeeds_Horizontal_Vertical:
;        _________ Speed for horizontal / vertical direction
;       |      ___ Speed for diagonal direction
;       |     |
    dw $0400
BeamSpeeds_Diagonal:
    dw       $02AB ; 0: Power
    dw $0400,$02AB ; 1: Wave
    dw $0400,$02AB ; 2: Ice
    dw $0400,$02AB ; 3: Ice + wave
    dw $0400,$02AB ; 4: Spazer
    dw $0400,$02AB ; 5: Spazer + wave
    dw $0400,$02AB ; 6: Spazer + ice
    dw $0400,$02AB ; 7: Spazer + ice + wave
    dw $0400,$02AB ; 8: Plasma
    dw $0400,$02AB ; 9: Plasma + wave
    dw $0400,$02AB ; Ah: Plasma + ice
    dw $0400,$02AB ; Bh: Plasma + ice + wave


;;; $C301: (Super) missile initialised bitset ;;;
MissileInitializedBitset:
; This gets added to projectile SamusProjectile_Variables to indicate that it's been initialised
    dw $0100


;;; $C303: Missile accelerations ;;;
MissileAccelerations:
;        _________ X acceleration. Unit 1/100h px/frame²
;       |      ___ Y acceleration. Unit 1/100h px/frame²
;       |     |
    dw $0000,$FFC0 ; 0: Up, facing right
    dw $0036,$FFCA ; 1: Up-right
    dw $0040,$0000 ; 2: Right
    dw $0036,$0036 ; 3: Down-right
    dw $0000,$0040 ; 4: Down, facing right
    dw $0000,$0040 ; 5: Down, facing left
    dw $FFCA,$0036 ; 6: Down-left
    dw $FFC0,$0000 ; 7: Left
    dw $FFCA,$FFCA ; 8: Up-left
    dw $0000,$FFC0 ; 9: Up, facing left


;;; $C32B: Super missile accelerations ;;;
SuperMissileAccelerations:
;        _________ X acceleration. Unit 1/100h px/frame²
;       |      ___ Y acceleration. Unit 1/100h px/frame²
;       |     |
    dw $0000,$FF00 ; 0: Up, facing right
    dw $00B6,$FF4A ; 1: Up-right
    dw $0100,$0000 ; 2: Right
    dw $00B6,$00B6 ; 3: Down-right
    dw $0000,$0100 ; 4: Down, facing right
    dw $0000,$0100 ; 5: Down, facing left
    dw $FF4A,$00B6 ; 6: Down-left
    dw $FF00,$0000 ; 7: Left
    dw $FF4A,$FF4A ; 8: Up-left
    dw $0000,$FF00 ; 9: Up, facing left


;;; $C353: Projectile accelerations ;;;
ProjectileAccelerations:
  .X:
; X acceleration. Unit 1/100h px/frame²
    dw $0000 ; 0: Up, facing right
    dw $0010 ; 1: Up-right
    dw $0010 ; 2: Right
    dw $0010 ; 3: Down-right
    dw $0000 ; 4: Down, facing right
    dw $0000 ; 5: Down, facing left
    dw $FFF0 ; 6: Down-left
    dw $FFF0 ; 7: Left
    dw $FFF0 ; 8: Up-left
    dw $0000 ; 9: Up, facing left

  .Y:
; Y acceleration. Unit 1/100h px/frame²
    dw $FFF0 ; 0: Up, facing right
    dw $FFF0 ; 1: Up-right
    dw $0000 ; 2: Right
    dw $0010 ; 3: Down-right
    dw $0010 ; 4: Down, facing right
    dw $0010 ; 5: Down, facing left
    dw $0010 ; 6: Down-left
    dw $0000 ; 7: Left
    dw $FFF0 ; 8: Up-left
    dw $FFF0 ; 9: Up, facing left


;;; $C37B: Proto weapon constants ;;;
ProtoWeaponConstants:
  .Beams:
; Used only by $94:9C73 to set ProjectileProtoType as part of bomb explosion block collision detection
; Highly likely that these tables were supposed to be abandoned entirely and that one check was left over
;        _________ Unused. Uncharged damage?
;       |    _____ Unused. Charged damage?
;       |   |    _ Projectile proto type
;       |   |   |
    db $03,$14,$00 ; 0: Power
    db $0A,$28,$01 ; 1: Wave
    db $05,$1E,$00 ; 2: Ice
    db $0A,$28,$01 ; 3: Ice + wave
    db $14,$50,$00 ; 4: Spazer
    db $14,$50,$01 ; 5: Spazer + wave
    db $14,$50,$00 ; 6: Spazer + ice
    db $14,$50,$01 ; 7: Spazer + ice + wave
    db $1E,$64,$00 ; 8: Plasma
    db $1E,$64,$01 ; 9: Plasma + wave
    db $1E,$64,$00 ; Ah: Plasma + ice
    db $1E,$64,$01 ; Bh: Plasma + ice + wave

  .NonBeams:
;        _____ Unused. Damage?
;       |    _ Projectile proto type
;       |   |
    db $00,$00
    db $0A,$00 ; Missile
    db $32,$00 ; Super missile
    db $32,$03 ; Power bomb
    db $00,$FF
    db $0A,$02 ; Bomb
    db $00,$FF
    db $00,$FF
    db $00,$FF


;;; $C3B1: Beam tiles pointers ;;;
BeamTilesPointers:
    dw Tiles_PowerBeam                                                   ; 0: Power
    dw Tiles_WaveBeam                                                    ; 1: Wave
    dw Tiles_IceBeam                                                     ; 2: Ice
    dw Tiles_WaveBeam                                                    ; 3: Ice + wave
    dw Tiles_Spazer                                                      ; 4: Spazer
    dw Tiles_Spazer                                                      ; 5: Spazer + wave
    dw Tiles_Spazer                                                      ; 6: Spazer + ice
    dw Tiles_Spazer                                                      ; 7: Spazer + ice + wave
    dw Tiles_PlasmaBeam                                                  ; 8: Plasma
    dw Tiles_PlasmaBeam                                                  ; 9: Plasma + wave
    dw Tiles_PlasmaBeam                                                  ; Ah: Plasma + ice
    dw Tiles_PlasmaBeam                                                  ; Bh: Plasma + ice + wave


;;; $C3C9: Beam palette pointers ;;;
BeamPalettePointers:
    dw BeamPalettes_Power                                                ; 0: Power
    dw BeamPalettes_Wave                                                 ; 1: Wave
    dw BeamPalettes_Ice                                                  ; 2: Ice
    dw BeamPalettes_Ice                                                  ; 3: Ice + wave
    dw BeamPalettes_Spazer                                               ; 4: Spazer
    dw BeamPalettes_Wave                                                 ; 5: Spazer + wave
    dw BeamPalettes_Ice                                                  ; 6: Spazer + ice
    dw BeamPalettes_Ice                                                  ; 7: Spazer + ice + wave
    dw BeamPalettes_Plasma                                               ; 8: Plasma
    dw BeamPalettes_Plasma                                               ; 9: Plasma + wave
    dw BeamPalettes_Ice                                                  ; Ah: Plasma + ice
    dw BeamPalettes_Ice                                                  ; Bh: Plasma + ice + wave


;;; $C3E1: Beam palettes ;;;
BeamPalettes_Power:
    dw $3800,$7FFF,$19FF,$1D55,$10AD,$53FF,$039E,$295F
    dw $18DF,$0000,$0000,$0000,$0000,$0000,$0000,$104A

BeamPalettes_Ice:
    dw $3800,$7FFF,$7EC0,$6DE0,$54E0,$7F6E,$730A,$6665
    dw $5E22,$7FA0,$7B60,$7720,$72A0,$6E60,$7F91,$20C0

BeamPalettes_Wave:
    dw $3800,$7FFF,$7C1F,$5816,$300C,$7EDF,$7DDF,$7CDF
    dw $681A,$0000,$0000,$0000,$0000,$0000,$0000,$2409

BeamPalettes_Plasma:
    dw $3800,$7FFF,$3BE0,$2680,$1580,$6BFA,$4BF2,$2BEA
    dw $03E0,$0000,$0000,$0000,$0000,$0000,$0000,$0920

BeamPalettes_Spazer:
    dw $3800,$7FFF,$03FF,$0216,$00EE,$6BFF,$4BFF,$2BFF
    dw $037B,$0000,$0000,$0000,$0000,$0000,$0000,$00AD


;;; $C481: Flare animation delays ;;;
FlareAnimationDelays:
  .Pointers:
    dw FlareAnimationDelays_MainFlare
    dw FlareAnimationDelays_FlareSlowSparks
    dw FlareAnimationDelays_FlareFastSparks

  .MainFlare:
    db $03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03
    db $03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$FE,$0E

  .FlareSlowSparks:
    db $05,$04,$03,$03,$03,$03,$FF

  .FlareFastSparks:
    db $04,$03,$02,$02,$02,$02,$FF


;;; $C4B5: Handle switching HUD selection ;;;
HandleSwitchingHUDSelection:
    PHP
    REP #$30
    LDA.W SelectedHUDItem : STA.B DP_Temp12
    LDA.B DP_Controller1New : BIT.W ItemCancelBinding : BEQ .notItemCancel
    STZ.W AutoCancelHUDItemIndex
    BRA .itemCancel

  .notItemCancel:
    LDA.B DP_Controller1Input : BIT.W ItemCancelBinding : BNE +
    STZ.B DP_Temp16
    BRA .checkItemSelect

+   LDA.W #$0001 : STA.B DP_Temp16

  .checkItemSelect:
    LDA.B DP_Controller1New : BIT.W ItemSelectBinding : BEQ .itemSelectEnd
    LDA.W SelectedHUDItem : INC : CMP.W #$0006 : BMI .itemCancelEnd

  .itemCancel:
    LDA.W #$0000

  .itemCancelEnd:
    STA.W SelectedHUDItem

  .loop:
    ASL : TAX
    JSR.W (.pointers,X)
    BCC .checkHoldingItemCancel
    LDA.W SelectedHUDItem : INC : STA.W SelectedHUDItem
    CMP.W #$0006 : BMI .loop
    LDA.W #$0000 : STA.W SelectedHUDItem
    BRA .loop

  .checkHoldingItemCancel:
    LDA.B DP_Temp16 : BEQ .resetAutoCancel
    LDA.W SelectedHUDItem : STA.W AutoCancelHUDItemIndex
    BRA .itemSelectEnd

  .resetAutoCancel:
    STZ.W AutoCancelHUDItemIndex

  .itemSelectEnd:
    LDA.W SelectedHUDItem : CMP.B DP_Temp12 : BNE .itemChanged
    LDA.W ArmCannonToggleFlag : INC : CMP.W #$0003 : BMI .toggleArmCannon
    LDA.W #$0002

  .toggleArmCannon:
    STA.W ArmCannonToggleFlag
    BRA .return

  .itemChanged:
    LDA.W #$0001 : STA.W ArmCannonToggleFlag

  .return:
    PLP
    RTS

  .pointers:
; Switched to HUD item handlers
    dw SwitchedToHUDItemHandler_Nothing                                  ; Nothing
    dw SwitchedToHUDItemHandler_Missiles                                 ; Missiles
    dw SwitchedToHUDItemHandler_SuperMissiles                            ; Super missiles
    dw SwitchedToHUDItemHandler_PowerBombs                               ; Power bombs
    dw SwitchedToHUDItemHandler_GrappleBeam                              ; Grapple
    dw SwitchedToHUDItemHandler_XrayScope                                ; X-ray


;;; $C545: Switched to HUD item handler - nothing ;;;
SwitchedToHUDItemHandler_Nothing:
    STZ.W SamusProjectile_FlareCounter
    JSR ClearFlareAnimationState
    JSL LoadSamusSuitPalette
    CLC
    RTS


;;; $C551: Switched to HUD item handler - missiles ;;;
SwitchedToHUDItemHandler_Missiles:
    LDA.W Missiles : BNE .hasMissiles
    SEC
    RTS

  .hasMissiles:
    STZ.W SamusProjectile_FlareCounter
    JSR ClearFlareAnimationState
    JSL LoadSamusSuitPalette
    CLC
    RTS


;;; $C564: Switched to HUD item handler - super missiles ;;;
SwitchedToHUDItemHandler_SuperMissiles:
    LDA.W SuperMissiles : BNE .hasSupers
    SEC
    RTS

  .hasSupers:
    STZ.W SamusProjectile_FlareCounter
    JSR ClearFlareAnimationState
    JSL LoadSamusSuitPalette
    CLC
    RTS


;;; $C577: Switched to HUD item handler - power bombs ;;;
SwitchedToHUDItemHandler_PowerBombs:
    LDA.W PowerBombs : BNE .hasPowerBombs
    SEC
    RTS

  .hasPowerBombs:
    STZ.W SamusProjectile_FlareCounter
    JSR ClearFlareAnimationState
    JSL LoadSamusSuitPalette
    CLC
    RTS


;;; $C58A: Switched to HUD item handler - grapple ;;;
SwitchedToHUDItemHandler_GrappleBeam:
    LDA.W EquippedItems : BIT.W #$4000 : BNE .hasGrappleBeam
    SEC
    RTS

  .hasGrappleBeam:
    LDA.W GrappleBeam_Function : CMP.W #GrappleBeamFunction_Inactive : BNE .returnCarryClear
    JSL LoadSamusSuitPalette
    STZ.W SamusProjectile_FlareCounter
    JSR ClearFlareAnimationState
    LDA.W #GrappleBeamFunction_Inactive : STA.W GrappleBeam_Function

  .returnCarryClear:
    CLC
    RTS


;;; $C5AE: Switched to HUD item handler - x-ray ;;;
SwitchedToHUDItemHandler_XrayScope:
    LDA.W EquippedItems : BIT.W #$8000 : BNE .hasXrayScope
    SEC
    RTS

  .hasXrayScope:
    STZ.W SamusProjectile_FlareCounter
    JSR ClearFlareAnimationState
    JSL LoadSamusSuitPalette
    CLC
    RTS


;;; $C5C4: Handle arm cannon open state ;;;
HandleArmCannonOpenState:
    PHP
    REP #$30
    LDA.W ArmCannonCloseFlag : AND.W #$00FF : BNE .advanceArmCannonFrame
    JSR UpdateArmCannonIsOpenState
    BCC .noChange

  .advanceArmCannonFrame:
    JSR AdvanceArmCannonFrame

  .noChange:
    LDA.W Pose : ASL : TAX
    LDA.W ArmCannonDrawingData,X : TAY
    LDA.W $0001,Y : AND.W #$00FF : STA.W ArmCannonDrawingMode
    PLP
    RTS


;;; $C5EB: Update arm cannon is open flag ;;;
UpdateArmCannonIsOpenState:
    LDA.W ArmCannonToggleFlag : CMP.W #$0002 : BMI .returnCarryClear
    LDA.W SelectedHUDItem : TAX
    LDA.W ArmCannonOpenFlags,X : AND.W #$00FF : STA.B DP_Temp12
    LDA.W ArmCannonOpenFlag : AND.W #$00FF : CMP.B DP_Temp12 : BEQ .returnCarryClear
    LDA.B DP_Temp12 : BEQ .closed
    LDA.W #$0000 : STA.W ArmCannonFrame
    BRA .toggleArmCannon

  .closed:
    LDA.W #$0004 : STA.W ArmCannonFrame

  .toggleArmCannon:
    LDA.B DP_Temp12 : ORA.W #$0100 : STA.W ArmCannonOpenFlag
    SEC
    RTS

  .returnCarryClear:
    CLC
    RTS


;;; $C627: Advance arm cannon frame ;;;
AdvanceArmCannonFrame:
    PHP
    REP #$30
    LDA.W ArmCannonOpenFlag : AND.W #$00FF : BNE .open
    LDA.W ArmCannonFrame : DEC : BEQ .fullyClosed
    BMI .fullyClosed
    STA.W ArmCannonFrame
    BRA .return

  .open:
    LDA.W ArmCannonFrame : INC : CMP.W #$0003 : BPL .fullyOpen
    STA.W ArmCannonFrame
    BRA .return

  .fullyClosed:
    STZ.W ArmCannonFrame
    BRA .fullyTransitioned

  .fullyOpen:
    LDA.W #$0003 : STA.W ArmCannonFrame

  .fullyTransitioned:
    LDA.W ArmCannonOpenFlag : AND.W #$00FF : STA.W ArmCannonOpenFlag

  .return:
    PLP
    RTS


;;; $C663: Draw arm cannon ;;;
DrawArmCannon:
; Does nothing if arm cannon is fully closed
    PHP
    REP #$30
    LDA.W ArmCannonFrame : BEQ .return
    LDA.W SamusInvincibilityTimer : BEQ .draw
    LDA.W NMI_FrameCounter : AND.W #$0001 : BEQ .draw

  .return:
    PLP
    RTS

  .draw:
    LDA.W Pose : ASL : TAX
    LDA.W ArmCannonDrawingData,X : TAY
    LDA.W $0000,Y : AND.W #$00FF : BIT.W #$0080 : BEQ .spritePositive
    LDA.W SamusAnimationFrame : BNE +
    LDA.W $0000,Y : AND.W #$007F : ASL : TAX
    TYA : CLC : ADC.W #$0004 : STA.B DP_Temp16
    BRA .merge

+   LDA.W $0002,Y : AND.W #$007F : ASL : TAX
    TYA : CLC : ADC.W #$0004 : STA.B DP_Temp16
    BRA .merge

  .spritePositive:
    ASL : TAX
    TYA : INC : INC : STA.B DP_Temp16

  .merge:
    LDA.W .spriteValues,X : STA.B DP_Temp18
    LDA.W SamusAnimationFrame : ASL : CLC : ADC.B DP_Temp16 : TAY
    LDA.W $0000,Y : AND.W #$00FF : BIT.W #$0080 : BEQ +
    ORA.W #$FF00

+   STA.B DP_Temp12
    LDA.W $0001,Y : AND.W #$00FF : BIT.W #$0080 : BEQ +
    ORA.W #$FF00

+   STA.B DP_Temp14
    LDA.W Pose : ASL #3 : TAX
    LDA.L PoseDefinitions_YOffset,X : AND.W #$00FF : STA.B DP_Temp16
    LDX.W OAMStack
    LDA.W SamusXPosition : CLC : ADC.B DP_Temp12
    SEC : SBC.W Layer1XPosition : BMI +
    CMP.W #$0100 : BPL +
    STA.W OAMLow,X
    LDA.W SamusYPosition : CLC : ADC.B DP_Temp14
    SEC : SBC.B DP_Temp16 : SBC.W Layer1YPosition : BMI +
    CMP.W #$0100 : BPL +
    STA.W OAMLow+1,X
    LDA.B DP_Temp18 : STA.W OAMLow+2,X
    TXA : CLC : ADC.W #$0004 : STA.W OAMStack

+   LDA.W Pose : ASL : TAX
    LDA.W ArmCannonDrawingData,X : TAY
    LDA.W $0000,Y : AND.W #$00FF : BIT.W #$0080 : BEQ .tilesPositive
    LDA.W SamusAnimationFrame : BNE .nonZeroAnimFrame
    LDA.W $0000,Y : AND.W #$007F
    BRA .tilesPositive

  .nonZeroAnimFrame:
    INY #2
    LDA.W $0000,Y : AND.W #$007F

  .tilesPositive:
    ASL : TAX
    LDA.W .pointers,X : STA.B DP_Temp16
    LDA.W ArmCannonFrame : ASL : CLC : ADC.B DP_Temp16 : TAY
    LDX.W VRAMWriteStack
    LDA.W #$0020 : STA.B VRAMWrite.size,X
    INX #2
    LDA.W $0000,Y : STA.B VRAMWrite.size,X
    INX #2
    SEP #$20
    LDA.B #$9A : STA.B VRAMWrite.size,X
    REP #$20
    INX
    LDA.W #$61F0 : STA.B VRAMWrite.size,X
    INX #2 : STX.W VRAMWriteStack
    PLP
    RTS

  .spriteValues:
;        _________________________________________________________ 0: Up, facing right
;       |      ___________________________________________________ 1: Up-right
;       |     |      _____________________________________________ 2: Right
;       |     |     |      _______________________________________ 3: Down-right
;       |     |     |     |      _________________________________ 4: Down, facing right
;       |     |     |     |     |      ___________________________ 5: Down, facing left
;       |     |     |     |     |     |      _____________________ 6: Down-left
;       |     |     |     |     |     |     |      _______________ 7: Left
;       |     |     |     |     |     |     |     |      _________ 8: Up-left
;       |     |     |     |     |     |     |     |     |      ___ 9: Up, facing left
;       |     |     |     |     |     |     |     |     |     |
    dw $281F,$281F,$281F,$681F,$A81F,$E81F,$281F,$681F,$681F,$681F ; Sprite tile number and attributes

  .pointers:
; Pointers to below table
    dw .armCannonTiles_0
    dw .armCannonTiles_3
    dw .armCannonTiles_1
    dw .armCannonTiles_2
    dw .armCannonTiles_0
    dw .armCannonTiles_0
    dw .armCannonTiles_2
    dw .armCannonTiles_1
    dw .armCannonTiles_3
    dw .armCannonTiles_0

; Pointers to tiles in bank $9A, indexed by arm cannon frame
  .armCannonTiles_0:
    dw $0000
    dw Tiles_NonClosed_ArmCannon_Vertical_0
    dw Tiles_NonClosed_ArmCannon_Vertical_1
    dw Tiles_NonClosed_ArmCannon_Vertical_2
  .armCannonTiles_1:
    dw $0000
    dw Tiles_NonClosed_ArmCannon_Horizontal_0
    dw Tiles_NonClosed_ArmCannon_Horizontal_1
    dw Tiles_NonClosed_ArmCannon_Horizontal_2
  .armCannonTiles_2:
    dw $0000
    dw Tiles_NonClosed_ArmCannon_DownwardsDiagonal_0
    dw Tiles_NonClosed_ArmCannon_DownwardsDiagonal_1
    dw Tiles_NonClosed_ArmCannon_DownwardsDiagonal_2
  .armCannonTiles_3:
    dw $0000
    dw Tiles_NonClosed_ArmCannon_UpwardsDiagonal_0
    dw Tiles_NonClosed_ArmCannon_UpwardsDiagonal_1
    dw Tiles_NonClosed_ArmCannon_UpwardsDiagonal_2


;;; $C7D9: Arm cannon open flags ;;;
ArmCannonOpenFlags:
; Indexed by HUD item index. 1 for open arm cannon
    db $00,$01,$01,$00,$01,$00


;;; $C7DF: Arm cannon drawing data ;;;
ArmCannonDrawingData:
    dw ArmCannonDrawingData_FacingForward
    dw ArmCannonDrawingData_FacingRight
    dw ArmCannonDrawingData_FacingLeft
    dw ArmCannonDrawingData_FacingRight_AimingUp
    dw ArmCannonDrawingData_FacingLeft_AimingUp
    dw ArmCannonDrawingData_FacingRight_AimingUpRight
    dw ArmCannonDrawingData_FacingLeft_AimingUpLeft
    dw ArmCannonDrawingData_FacingRight_AimingDownRight
    dw ArmCannonDrawingData_FacingLeft_AimingDownLeft
    dw ArmCannonDrawingData_Default
    dw ArmCannonDrawingData_Default
    dw ArmCannonDrawingData_MovingRight_GunExtended
    dw ArmCannonDrawingData_MovingLeft_GunExtended
    dw ArmCannonDrawingData_Default
    dw ArmCannonDrawingData_Default
    dw ArmCannonDrawingData_MovingRight_AimingUpRight
    dw ArmCannonDrawingData_MovingLeft_AimingUpLeft
    dw ArmCannonDrawingData_MovingRight_AimingDownRight
    dw ArmCannonDrawingData_MovingLeft_AimingDownLeft
    dw ArmCannonDrawingData_FacingRight_NormalJump_NotMoving_GunExt
    dw ArmCannonDrawingData_FacingLeft_NormalJump_NotMoving_GunExt
    dw ArmCannonDrawingData_FacingRight_NormalJump_AimingUp
    dw ArmCannonDrawingData_FacingLeft_NormalJump_AimingUp
    dw ArmCannonDrawingData_FacingRight_NormalJump_AimingDown
    dw ArmCannonDrawingData_FacingLeft_NormalJump_AimingDown
    dw ArmCannonDrawingData_Default
    dw ArmCannonDrawingData_Default
    dw ArmCannonDrawingData_Default
    dw ArmCannonDrawingData_Default
    dw ArmCannonDrawingData_Default
    dw ArmCannonDrawingData_Default
    dw ArmCannonDrawingData_Default
    dw ArmCannonDrawingData_Default
    dw ArmCannonDrawingData_Default
    dw ArmCannonDrawingData_Default
    dw ArmCannonDrawingData_Default
    dw ArmCannonDrawingData_Default
    dw ArmCannonDrawingData_Default
    dw ArmCannonDrawingData_Default
    dw ArmCannonDrawingData_FacingRight_Crouching
    dw ArmCannonDrawingData_FacingLeft_Crouching
    dw ArmCannonDrawingData_Default
    dw ArmCannonDrawingData_Default
    dw ArmCannonDrawingData_FacingRight_Falling_AimingUp
    dw ArmCannonDrawingData_FacingLeft_Falling_AimingUp
    dw ArmCannonDrawingData_FacingRight_Falling_AimingDown
    dw ArmCannonDrawingData_FacingLeft_Falling_AimingDown
    dw ArmCannonDrawingData_Default
    dw ArmCannonDrawingData_Default
    dw ArmCannonDrawingData_Default
    dw ArmCannonDrawingData_Default
    dw ArmCannonDrawingData_Default
    dw ArmCannonDrawingData_Default
    dw ArmCannonDrawingData_Default
    dw ArmCannonDrawingData_Default
    dw ArmCannonDrawingData_Default
    dw ArmCannonDrawingData_Default
    dw ArmCannonDrawingData_Default
    dw ArmCannonDrawingData_Default
    dw ArmCannonDrawingData_Default
    dw ArmCannonDrawingData_Default
    dw ArmCannonDrawingData_Default
    dw ArmCannonDrawingData_Default
    dw ArmCannonDrawingData_Default
    dw ArmCannonDrawingData_Default
    dw ArmCannonDrawingData_Default
    dw ArmCannonDrawingData_Default
    dw ArmCannonDrawingData_Default
    dw ArmCannonDrawingData_Default
    dw ArmCannonDrawingData_Default
    dw ArmCannonDrawingData_Default
    dw ArmCannonDrawingData_FacingRight
    dw ArmCannonDrawingData_FacingLeft
    dw ArmCannonDrawingData_FacingLeft_Moonwalk
    dw ArmCannonDrawingData_FacingRight_Moonwalk
    dw ArmCannonDrawingData_FacingRight_NormalJumpTransition
    dw ArmCannonDrawingData_Default
    dw ArmCannonDrawingData_Default
    dw ArmCannonDrawingData_Default
    dw ArmCannonDrawingData_Default
    dw ArmCannonDrawingData_Default
    dw ArmCannonDrawingData_FacingRight_NormalJump_MovingForward
    dw ArmCannonDrawingData_FacingLeft_NormalJump_MovingForward
    dw ArmCannonDrawingData_Default
    dw ArmCannonDrawingData_Default
    dw ArmCannonDrawingData_FacingRight_Transition_AimingUp
    dw ArmCannonDrawingData_FacingLeft_Transition_AimingUp
    dw ArmCannonDrawingData_FacingRight_AimingUpRight
    dw ArmCannonDrawingData_FacingLeft_AimingUpLeft
    dw ArmCannonDrawingData_FacingRight_AimingDownRight
    dw ArmCannonDrawingData_FacingLeft_AimingDownLeft
    dw ArmCannonDrawingData_Default
    dw ArmCannonDrawingData_Default
    dw ArmCannonDrawingData_Default
    dw ArmCannonDrawingData_Default
    dw ArmCannonDrawingData_Default
    dw ArmCannonDrawingData_Default
    dw ArmCannonDrawingData_Default
    dw ArmCannonDrawingData_Default
    dw ArmCannonDrawingData_Default
    dw ArmCannonDrawingData_Default
    dw ArmCannonDrawingData_Default
    dw ArmCannonDrawingData_Default
    dw ArmCannonDrawingData_FacingRight_Falling_GunExtended
    dw ArmCannonDrawingData_FacingLeft_Falling_GunExtended
    dw ArmCannonDrawingData_FacingRight_NormalJump_AimingUpRight
    dw ArmCannonDrawingData_FacingLeft_NormalJump_AimingUpLeft
    dw ArmCannonDrawingData_FacingRight_NormalJump_AimingDownRight
    dw ArmCannonDrawingData_FacingLeft_NormalJump_AimingDownLeft
    dw ArmCannonDrawingData_FacingRight_Falling_AimingUpRight
    dw ArmCannonDrawingData_FacingLeft_Falling_AimingUpLeft
    dw ArmCannonDrawingData_FacingRight_Falling_AimingDownRight
    dw ArmCannonDrawingData_FacingLeft_Falling_AimingDownLeft
    dw ArmCannonDrawingData_FacingRight_Crouching_AimingUpRight
    dw ArmCannonDrawingData_FacingLeft_Crouching_AimingUpLeft
    dw ArmCannonDrawingData_FacingRight_Crouching_AimingDownRight
    dw ArmCannonDrawingData_FacingLeft_Crouching_AimingDownLeft
    dw ArmCannonDrawingData_FacingLeft_Moonwalk_AimingUpLeft
    dw ArmCannonDrawingData_FacingRight_Moonwalk_AimingUpRight
    dw ArmCannonDrawingData_FacingLeft_Moonwalk_AimingDownLeft
    dw ArmCannonDrawingData_FacingRight_Moonwalk_AimingDownRight
    dw ArmCannonDrawingData_Default
    dw ArmCannonDrawingData_Default
    dw ArmCannonDrawingData_Default
    dw ArmCannonDrawingData_Default
    dw ArmCannonDrawingData_Default
    dw ArmCannonDrawingData_Default
    dw ArmCannonDrawingData_Default
    dw ArmCannonDrawingData_Default
    dw ArmCannonDrawingData_Default
    dw ArmCannonDrawingData_Default
    dw ArmCannonDrawingData_Default
    dw ArmCannonDrawingData_Default
    dw ArmCannonDrawingData_FacingRight_Crouching_AimingUp
    dw ArmCannonDrawingData_FacingLeft_Crouching_AimingUp
    dw ArmCannonDrawingData_Default
    dw ArmCannonDrawingData_Default
    dw ArmCannonDrawingData_FacingRight
    dw ArmCannonDrawingData_FacingLeft
    dw ArmCannonDrawingData_Default
    dw ArmCannonDrawingData_Default
    dw ArmCannonDrawingData_Default
    dw ArmCannonDrawingData_Default
    dw ArmCannonDrawingData_Default
    dw ArmCannonDrawingData_Default
    dw ArmCannonDrawingData_Default
    dw ArmCannonDrawingData_Default
    dw ArmCannonDrawingData_Default
    dw ArmCannonDrawingData_Default
    dw ArmCannonDrawingData_Default
    dw ArmCannonDrawingData_Default
    dw ArmCannonDrawingData_Default
    dw ArmCannonDrawingData_Default
    dw ArmCannonDrawingData_Default
    dw ArmCannonDrawingData_Default
    dw ArmCannonDrawingData_FacingForward
    dw ArmCannonDrawingData_Default
    dw ArmCannonDrawingData_Default
    dw ArmCannonDrawingData_Default
    dw ArmCannonDrawingData_Default
    dw ArmCannonDrawingData_Default
    dw ArmCannonDrawingData_Default
    dw ArmCannonDrawingData_Default
    dw ArmCannonDrawingData_Default
    dw ArmCannonDrawingData_FacingRight_LandingFromNormalJump
    dw ArmCannonDrawingData_Default
    dw ArmCannonDrawingData_FacingRight_LandingFromSpinJump
    dw ArmCannonDrawingData_Default
    dw ArmCannonDrawingData_FacingRight
    dw ArmCannonDrawingData_FacingLeft
    dw ArmCannonDrawingData_FacingRight_AimingDownRight
    dw ArmCannonDrawingData_FacingLeft_AimingDownLeft
    dw ArmCannonDrawingData_FacingRight_NormalJump_NotMoving_GunExt
    dw ArmCannonDrawingData_FacingLeft_NormalJump_NotMoving_GunExt
    dw ArmCannonDrawingData_FacingRight_NormalJump_AimingDown
    dw ArmCannonDrawingData_FacingLeft_NormalJump_AimingDown
    dw ArmCannonDrawingData_FacingRight_NormalJump_AimingDownRight
    dw ArmCannonDrawingData_FacingLeft_NormalJump_AimingDownLeft
    dw ArmCannonDrawingData_Default
    dw ArmCannonDrawingData_Default
    dw ArmCannonDrawingData_FacingRight_Crouching
    dw ArmCannonDrawingData_FacingLeft_Crouching
    dw ArmCannonDrawingData_FacingRight_Crouching_AimingDownRight
    dw ArmCannonDrawingData_FacingLeft_Crouching_AimingDownLeft
    dw ArmCannonDrawingData_Default
    dw ArmCannonDrawingData_Default
    dw ArmCannonDrawingData_Default
    dw ArmCannonDrawingData_FacingLeft_AimingUpLeft
    dw ArmCannonDrawingData_FacingLeft
    dw ArmCannonDrawingData_FacingLeft_AimingDownLeft
    dw ArmCannonDrawingData_Default
    dw ArmCannonDrawingData_Default
    dw ArmCannonDrawingData_Default
    dw ArmCannonDrawingData_Default
    dw ArmCannonDrawingData_Default
    dw ArmCannonDrawingData_Default
    dw ArmCannonDrawingData_Default
    dw ArmCannonDrawingData_Default
    dw ArmCannonDrawingData_Default
    dw ArmCannonDrawingData_Default
    dw ArmCannonDrawingData_Default
    dw ArmCannonDrawingData_Default
    dw ArmCannonDrawingData_Default
    dw ArmCannonDrawingData_Default
    dw ArmCannonDrawingData_Default
    dw ArmCannonDrawingData_Default
    dw ArmCannonDrawingData_Default
    dw ArmCannonDrawingData_FacingRight_AimingUpRight
    dw ArmCannonDrawingData_FacingLeft_AimingUpLeft
    dw ArmCannonDrawingData_FacingRight_AimingDownRight
    dw ArmCannonDrawingData_FacingLeft_AimingDownLeft
    dw ArmCannonDrawingData_Default
    dw ArmCannonDrawingData_Default
    dw ArmCannonDrawingData_Default
    dw ArmCannonDrawingData_Default
    dw ArmCannonDrawingData_Default
    dw ArmCannonDrawingData_Default
    dw ArmCannonDrawingData_Default
    dw ArmCannonDrawingData_Default
    dw ArmCannonDrawingData_Default
    dw ArmCannonDrawingData_Default
    dw ArmCannonDrawingData_Default
    dw ArmCannonDrawingData_Default
    dw ArmCannonDrawingData_Default
    dw ArmCannonDrawingData_FacingRight_Transition_AimingUp
    dw ArmCannonDrawingData_FacingLeft_Transition_AimingUp
    dw ArmCannonDrawingData_FacingRight_AimingUpRight
    dw ArmCannonDrawingData_FacingLeft_AimingUpLeft
    dw ArmCannonDrawingData_FacingRight_AimingDownRight
    dw ArmCannonDrawingData_FacingLeft_AimingDownLeft
    dw ArmCannonDrawingData_FacingRight
    dw ArmCannonDrawingData_FacingLeft
    dw ArmCannonDrawingData_Default
    dw ArmCannonDrawingData_Default
    dw ArmCannonDrawingData_Default
    dw ArmCannonDrawingData_Default
    dw ArmCannonDrawingData_Default
    dw ArmCannonDrawingData_FacingRight_AimingUpRight
    dw ArmCannonDrawingData_FacingRight
    dw ArmCannonDrawingData_FacingRight_AimingDownRight
    dw ArmCannonDrawingData_Default
    dw ArmCannonDrawingData_FacingRight_Transition_AimingUp
    dw ArmCannonDrawingData_FacingLeft_Transition_AimingUp
    dw ArmCannonDrawingData_FacingRight_AimingUpRight
    dw ArmCannonDrawingData_FacingLeft_AimingUpLeft
    dw ArmCannonDrawingData_FacingRight_AimingDownRight
    dw ArmCannonDrawingData_FacingLeft_AimingDownLeft
    dw ArmCannonDrawingData_FacingRight_Transition_AimingUp
    dw ArmCannonDrawingData_FacingLeft_Transition_AimingUp
    dw ArmCannonDrawingData_FacingRight_AimingUpRight
    dw ArmCannonDrawingData_FacingLeft_AimingUpLeft
    dw ArmCannonDrawingData_FacingRight_AimingDownRight
    dw ArmCannonDrawingData_FacingLeft_AimingDownLeft


; Format:
;     dd aa
;     [DD aa] ; If d & 80h != 0
;     [xx yy]...
;
; where
;     d: Direction
;     D: Direction if [Samus animation frame] != 0
;     {
;         0: Up, facing right
;         1: Up-right
;         2: Right
;         3: Down-right
;         4: Down, facing right
;         5: Down, facing left
;         6: Down-left
;         7: Left
;         8: Up-left
;         9: Up, facing left
;     }
;     a: Arm cannon drawing mode
;     {
;         0: Arm cannon isn't drawn
;         1: Arm cannon is drawn normally
;         2: Samus is facing forward (same as 0?)
;     }
;     x/y: X/Y offsets, indexed by [Samus animation frame]
ArmCannonDrawingData_Default:
; All other poses
    db $00,$00

ArmCannonDrawingData_FacingForward:
; 0: Facing forward - power suit
; 9Bh: Facing forward - varia/gravity suit
    db $00,$02

ArmCannonDrawingData_FacingRight:
; 1: Facing right - normal
; 47h: Unused
; 89h: Facing right - ran into a wall
; A8h: Unused
; E6h: Facing right - landing from normal jump - firing
; EEh: Facing right - grabbed by Draygon - firing
    db $02,$01,$0B,$FD,$0B,$FD,$0B,$FD,$0B,$FD,$0B,$FD,$0B,$FD,$0B,$FD
    db $0B,$FD,$0B,$FD

ArmCannonDrawingData_FacingLeft:
; 2: Facing left-   normal
; 48h: Unused
; 8Ah: Facing left-   ran into a wall
; A9h: Unused
; BCh: Facing left-   grabbed by Draygon - firing
; E7h: Facing left-   landing from normal jump - firing
    db $07,$01,$ED,$FD,$ED,$FD,$ED,$FD,$ED,$FD,$ED,$FD,$ED,$FD,$ED,$FD
    db $ED,$FD,$ED,$FD

ArmCannonDrawingData_FacingRight_AimingUp:
; 3: Facing right - aiming up
    db $81,$01,$80,$01,$0E,$EA,$FE,$E1

ArmCannonDrawingData_FacingLeft_AimingUp:
; 4: Facing left-   aiming up
    db $88,$01,$89,$01,$EA,$E9,$FA,$E1

ArmCannonDrawingData_FacingRight_AimingUpRight:
; 5: Facing right - aiming up-right
; 57h: Facing right - normal jump transition - aiming up-right
; CFh: Facing right - ran into a wall - aiming up-right
; E2h: Facing right - landing from normal jump - aiming up-right
; EDh: Facing right - grabbed by Draygon - not moving - aiming up-right
; F3h: Facing right - crouching transition - aiming up-right
; F9h: Facing right - standing transition - aiming up-right
    db $01,$01,$0D,$EA

ArmCannonDrawingData_FacingLeft_AimingUpLeft:
; 6: Facing left-   aiming up-left
; 58h: Facing left-   normal jump transition - aiming up-left
; BBh: Facing left-   grabbed by Draygon - not moving - aiming up-left
; D0h: Facing left-   ran into a wall - aiming up-left
; E3h: Facing left-   landing from normal jump - aiming up-left
; F4h: Facing left-   crouching transition - aiming up-left
; FAh: Facing left-   standing transition - aiming up-left
    db $08,$01,$EB,$E9

ArmCannonDrawingData_FacingRight_AimingDownRight:
; 7: Facing right - aiming down-right
; 59h: Facing right - normal jump transition - aiming down-right
; AAh: Unused
; D1h: Facing right - ran into a wall - aiming down-right
; E4h: Facing right - landing from normal jump - aiming down-right
; EFh: Facing right - grabbed by Draygon - not moving - aiming down-right
; F5h: Facing right - crouching transition - aiming down-right
; FBh: Facing right - standing transition - aiming down-right
    db $03,$01,$0D,$02

ArmCannonDrawingData_FacingLeft_AimingDownLeft:
; 8: Facing left-   aiming down-left
; 5Ah: Facing left-   normal jump transition - aiming down-left
; ABh: Unused
; BDh: Facing left-   grabbed by Draygon - not moving - aiming down-left
; D2h: Facing left-   ran into a wall - aiming down-left
; E5h: Facing left-   landing from normal jump - aiming down-left
; F6h: Facing left-   crouching transition - aiming down-left
; FCh: Facing left-   standing transition - aiming down-left
    db $06,$01,$EB,$02

ArmCannonDrawingData_MovingRight_GunExtended:
; Bh: Moving right - gun extended
    db $02,$01,$11,$FA,$11,$FA,$11,$F9,$11,$F8,$11,$F9,$11,$FA,$11,$F9
    db $11,$F9,$11,$F8,$11,$F9

ArmCannonDrawingData_MovingLeft_GunExtended:
; Ch: Moving left-   gun extended
    db $07,$01,$E7,$FA,$E7,$FA,$E7,$F8,$E7,$F9,$E7,$F9,$E7,$FA,$E7,$F9
    db $E7,$F8,$E7,$F9,$E7,$F9

ArmCannonDrawingData_MovingRight_AimingUpRight:
; Fh: Moving right - aiming up-right
    db $01,$01,$0C,$EA,$0C,$EA,$0C,$E9,$0C,$E8,$0C,$E9,$0C,$EA,$0C,$EA
    db $0C,$E9,$0C,$E8,$0C,$E9

ArmCannonDrawingData_MovingLeft_AimingUpLeft:
; 10h: Moving left-   aiming up-left
    db $08,$01,$EC,$EA,$EC,$EA,$EC,$E9,$EC,$E8,$EC,$E9,$EC,$EA,$EC,$EA
    db $EC,$E9,$EC,$E8,$EC,$E9

ArmCannonDrawingData_MovingRight_AimingDownRight:
; 11h: Moving right - aiming down-right
    db $03,$01,$0B,$01,$0B,$01,$0B,$00,$0B,$FF,$0B,$00,$0B,$01,$0B,$01
    db $0B,$00,$0B,$FF,$0B,$00

ArmCannonDrawingData_MovingLeft_AimingDownLeft:
; 12h: Moving left-   aiming down-left
    db $06,$01,$ED,$01,$ED,$01,$ED,$00,$ED,$FF,$ED,$00,$ED,$01,$ED,$01
    db $ED,$00,$ED,$FF,$ED,$00

ArmCannonDrawingData_FacingRight_NormalJump_NotMoving_GunExt:
; 13h: Facing right - normal jump - not aiming - not moving - gun extended
; ACh: Unused
    db $02,$01,$0B,$FD,$0B,$FD

ArmCannonDrawingData_FacingLeft_NormalJump_NotMoving_GunExt:
; 14h: Facing left-   normal jump - not aiming - not moving - gun extended
; ADh: Unused
    db $07,$01,$ED,$FD,$ED,$FD

ArmCannonDrawingData_FacingRight_NormalJump_AimingUp:
; 15h: Facing right - normal jump - aiming up
    db $81,$01,$80,$01,$0E,$E9,$FE,$E0

ArmCannonDrawingData_FacingLeft_NormalJump_AimingUp:
; 16h: Facing left-   normal jump - aiming up
    db $88,$01,$89,$01,$EA,$E8,$FA,$E0

ArmCannonDrawingData_FacingRight_NormalJump_AimingDown:
; 17h: Facing right - normal jump - aiming down
; AEh: Unused
    db $04,$01,$00,$0D,$00,$0D

ArmCannonDrawingData_FacingLeft_NormalJump_AimingDown:
; 18h: Facing left-   normal jump - aiming down
; AFh: Unused
    db $05,$01,$F7,$0D,$F7,$0D

ArmCannonDrawingData_FacingRight_NormalJumpTransition:
; 4Bh: Facing right - normal jump transition
    db $03,$01,$FB,$00,$06,$02,$ED,$FE

ArmCannonDrawingData_FacingRight_NormalJump_MovingForward:
; 51h: Facing right - normal jump - not aiming - moving forward
    db $02,$01,$0B,$FD,$0B,$FD

ArmCannonDrawingData_FacingLeft_NormalJump_MovingForward:
; 52h: Facing left-   normal jump - not aiming - moving forward
    db $07,$01,$ED,$FD,$ED,$FD

ArmCannonDrawingData_FacingRight_NormalJump_AimingUpRight:
; 69h: Facing right - normal jump - aiming up-right
    db $01,$01,$0C,$EA,$0C,$EA

ArmCannonDrawingData_FacingLeft_NormalJump_AimingUpLeft:
; 6Ah: Facing left-   normal jump - aiming up-left
    db $08,$01,$EC,$EA,$EC,$EA

ArmCannonDrawingData_FacingRight_NormalJump_AimingDownRight:
; 6Bh: Facing right - normal jump - aiming down-right
; B0h: Unused
    db $03,$01,$0B,$01,$0B,$01

ArmCannonDrawingData_FacingLeft_NormalJump_AimingDownLeft:
; 6Ch: Facing left-   normal jump - aiming down-left
; B1h: Unused
    db $06,$01,$ED,$01,$ED,$01

ArmCannonDrawingData_FacingRight_Falling_GunExtended:
; 67h: Facing right - falling - gun extended
    db $02,$01,$0B,$FD,$0B,$FD,$0B,$FD,$0B,$FD,$0B,$FD,$0B,$FD,$0B,$FD

ArmCannonDrawingData_FacingLeft_Falling_GunExtended:
; 68h: Facing left-   falling - gun extended
    db $07,$01,$ED,$FD,$ED,$FD,$ED,$FD,$ED,$FD,$ED,$FD,$ED,$FD,$ED,$FD

ArmCannonDrawingData_FacingRight_Falling_AimingUp:
; 2Bh: Facing right - falling - aiming up
    db $81,$01,$80,$01,$0E,$E9,$FE,$E0,$FE,$E0

ArmCannonDrawingData_FacingLeft_Falling_AimingUp:
; 2Ch: Facing left-   falling - aiming up
    db $88,$01,$89,$01,$EA,$E8,$FA,$E4,$FA,$E4

ArmCannonDrawingData_FacingRight_Falling_AimingDown:
; 2Dh: Facing right - falling - aiming down
    db $04,$01,$00,$09,$00,$09

ArmCannonDrawingData_FacingLeft_Falling_AimingDown:
; 2Eh: Facing left-   falling - aiming down
    db $05,$01,$F7,$09,$F7,$09

ArmCannonDrawingData_FacingRight_Falling_AimingUpRight:
; 6Dh: Facing right - falling - aiming up-right
    db $01,$01,$0C,$EA,$0C,$EA,$0C,$EA

ArmCannonDrawingData_FacingLeft_Falling_AimingUpLeft:
; 6Eh: Facing left-   falling - aiming up-left
    db $08,$01,$EC,$EA,$EC,$EA,$EC,$EA

ArmCannonDrawingData_FacingRight_Falling_AimingDownRight:
; 6Fh: Facing right - falling - aiming down-right
    db $03,$01,$0B,$01,$0B,$01,$0B,$01

ArmCannonDrawingData_FacingLeft_Falling_AimingDownLeft:
; 70h: Facing left-   falling - aiming down-left
    db $06,$01,$ED,$01,$ED,$01,$ED,$01

ArmCannonDrawingData_FacingRight_Crouching:
; 27h: Facing right - crouching
; B4h: Unused
    db $02,$01,$0B,$FD,$0B,$FD,$0B,$FD,$0B,$FD,$0B,$FD,$0B,$FD,$0B,$FD
    db $0B,$FD,$0B,$FD

ArmCannonDrawingData_FacingLeft_Crouching:
; 28h: Facing left-   crouching
; B5h: Unused
    db $07,$01,$ED,$FD,$ED,$FD,$ED,$FD,$ED,$FD,$ED,$FD,$ED,$FD,$ED,$FD
    db $ED,$FD,$ED,$FD

ArmCannonDrawingData_FacingRight_Crouching_AimingUpRight:
; 71h: Facing right - crouching - aiming up-right
    db $01,$01,$0E,$E9

ArmCannonDrawingData_FacingLeft_Crouching_AimingUpLeft:
; 72h: Facing left-   crouching - aiming up-left
    db $08,$01,$EA,$E8

ArmCannonDrawingData_FacingRight_Crouching_AimingDownRight:
; 73h: Facing right - crouching - aiming down-right
    db $03,$01,$0D,$02

ArmCannonDrawingData_FacingLeft_Crouching_AimingDownLeft:
; 74h: Facing left-   crouching - aiming down-left
; B7h: Unused
    db $06,$01,$EB,$02

ArmCannonDrawingData_FacingRight_Crouching_AimingUp:
; 85h: Facing right - crouching - aiming up
    db $81,$01,$80,$01,$0E,$E9,$FE,$E0

ArmCannonDrawingData_FacingLeft_Crouching_AimingUp:
; 86h: Facing left-   crouching - aiming up
    db $88,$01,$89,$01,$EA,$E8,$FA,$E0

ArmCannonDrawingData_FacingLeft_Moonwalk:
; 49h: Facing left-   moonwalk
    db $02,$01,$F1,$FD,$F1,$FC,$F1,$FC,$F1,$FD,$F1,$FC,$F1,$FC

ArmCannonDrawingData_FacingRight_Moonwalk:
; 4Ah: Facing right - moonwalk
    db $07,$01,$07,$FD,$07,$FC,$07,$FC,$07,$FD,$07,$FC,$07,$FC

ArmCannonDrawingData_FacingLeft_Moonwalk_AimingUpLeft:
; 75h: Facing left-   moonwalk - aiming up-left
    db $08,$01,$EC,$EA,$EC,$E9,$EC,$E9,$EC,$EA,$EC,$E9,$EC,$E9

ArmCannonDrawingData_FacingRight_Moonwalk_AimingUpRight:
; 76h: Facing right - moonwalk - aiming up-right
    db $01,$01,$0C,$EA,$0C,$E9,$0C,$E9,$0C,$EA,$0C,$E9,$0C,$E9

ArmCannonDrawingData_FacingLeft_Moonwalk_AimingDownLeft:
; 77h: Facing left-   moonwalk - aiming down-left
    db $06,$01,$ED,$01,$ED,$00,$ED,$00,$ED,$01,$ED,$00,$ED,$00

ArmCannonDrawingData_FacingRight_Moonwalk_AimingDownRight:
; 78h: Facing right - moonwalk - aiming down-right
    db $03,$01,$0B,$01,$0B,$00,$0B,$00,$0B,$01,$0B,$00,$0B,$00

ArmCannonDrawingData_FacingRight_LandingFromNormalJump:
; A4h: Facing right - landing from normal jump
    db $03,$01,$FB,$00,$FB,$00,$06,$02,$ED,$FE,$ED,$FE

ArmCannonDrawingData_FacingRight_LandingFromSpinJump:
; A6h: Facing right - landing from spin jump
    db $03,$01,$FB,$00,$FB,$00,$FB,$00,$06,$02,$ED,$FE,$ED,$FE,$ED,$FE

ArmCannonDrawingData_FacingRight_Transition_AimingUp:
; 55h: Facing right - normal jump transition - aiming up
; E0h: Facing right - landing from normal jump - aiming up
; F1h: Facing right - crouching transition - aiming up
; F7h: Facing right - standing transition - aiming up
    db $00,$01,$FE,$E1,$FE,$E1

ArmCannonDrawingData_FacingLeft_Transition_AimingUp:
; 56h: Facing left-   normal jump transition - aiming up
; E1h: Facing left-   landing from normal jump - aiming up
; F2h: Facing left-   crouching transition - aiming up
; F8h: Facing left-   standing transition - aiming up
    db $09,$01,$FA,$E1,$FA,$E1


;;; $CC21: Cost of SBAs in power bombs ;;;
CostOfSBAsInPowerBombs:
; Obviously only the pure beams have non-zero values, and obviously they're all 1
; This table sucks
    dw $0000 ; 0: Power
    dw $0001 ; 1: Wave
    dw $0001 ; 2: Ice
    dw $0000 ; 3: Ice + wave
    dw $0001 ; 4: Spazer
    dw $0000 ; 5: Spazer + wave
    dw $0000 ; 6: Spazer + ice
    dw $0000 ; 7: Spazer + ice + wave
    dw $0001 ; 8: Plasma
    dw $0000 ; 9: Plasma + wave
    dw $0000 ; Ah: Plasma + ice
    dw $0000 ; Bh: Plasma + ice + wave


;;; $CC39: Calculate X/Y components of radius [A], angle [Y] ;;;
Math_90CC39:
;; Parameters:
;;     A: Radius
;;     Y: Angle. Origin = up, positive direction = clockwise
;; Returns:
;;     $14: X component of radius
;;     $16: Y component of radius

; Clone of Calculate_XY_ComponentsOf_RadiusA_AngleY
    PHP
    REP #$30
    PHX
    STA.B DP_Temp18
    TYA : STA.B DP_Temp1A
    CMP.W #$0080 : BPL .greaterThanEqualTo80
    ASL : TAX
    JSR Math_90CC8A
    BRA +

  .greaterThanEqualTo80:
    SEC : SBC.W #$0080 : AND.W #$00FF : ASL : TAX
    JSR Math_90CC8A
    EOR.W #$FFFF : INC

+   STA.B DP_Temp14
    LDA.B DP_Temp1A : SEC : SBC.W #$0040
    AND.W #$00FF : CMP.W #$0080 : BPL .AGreaterThanEqualTo80
    ASL : TAX
    JSR Math_90CC8A
    BRA +

  .AGreaterThanEqualTo80:
    SEC : SBC.W #$0080
    AND.W #$00FF : ASL : TAX
    JSR Math_90CC8A
    EOR.W #$FFFF : INC

+   STA.B DP_Temp16
    PLX : PLP
    RTS


;;; $CC8A: A = [$18] * sin([X] / 2 * pi / 80h) ;;;
Math_90CC8A:
;; Parameters:
;;     X: Angle * 2
;;     $18: Radius
;; Returns:
;;     A: Sine component

; Clone of $8B:8EA3
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


;;; $CCC0: Fire SBA ;;;
FireSBA:
;; Returns:
;;     Carry: Set if succeeded
    LDA.W SelectedHUDItem : CMP.W #$0003 : BEQ .powerBombsSelected
    CLC
    RTS

  .powerBombsSelected:
    LDA.W EquippedBeams : AND.W #$000F : ASL : TAX
    LDA.W PowerBombs : SEC : SBC.W CostOfSBAsInPowerBombs,X : BPL +
    LDA.W #$0000

+   STA.W PowerBombs
    JSR.W (.pointers,X)
    LDA.W PowerBombs : BNE .return
    STZ.W SelectedHUDItem : STZ.W AutoCancelHUDItemIndex

  .return:
    RTS

  .pointers:
    dw CLCRTS_90CD18                                                     ; 0: Power
    dw FireWaveSBA                                                       ; 1: Wave
    dw FireIceSBA                                                        ; 2: Ice
    dw CLCRTS_90CD18                                                     ; 3: Ice + wave
    dw FireSpazerSBA                                                     ; 4: Spazer
    dw CLCRTS_90CD18                                                     ; 5: Spazer + wave
    dw CLCRTS_90CD18                                                     ; 6: Spazer + ice
    dw CLCRTS_90CD18                                                     ; 7: Spazer + ice + wave
    dw FirePlasmaSBA                                                     ; 8: Plasma
    dw CLCRTS_90CD18                                                     ; 9: Plasma + wave
    dw CLCRTS_90CD18                                                     ; Ah: Plasma + ice
    dw CLCRTS_90CD18                                                     ; Bh: Plasma + ice + wave


;;; $CD08: Ice/plasma SBA projectile origin angles ;;;
IcePlasmaSBAProjectileOriginAngles:
; Angle of projectiles from Samus (2pi / 100h radians clockwise, 0 = up) for ice/plasma SBA
    dw $0000
    dw $0040
    dw $0080
    dw $00C0
    dw $0020 ; Unused
    dw $0060 ; Unused
    dw $00A0 ; Unused
    dw $00E0 ; Unused


;;; $CD18: Clear carry. Disabled SBA beam combinations ;;;
CLCRTS_90CD18:
    CLC
    RTS


;;; $CD1A: Fire wave SBA ;;;
FireWaveSBA:
;; Returns:
;;     Carry: Set. Fire SBA succeeded
    LDX.W #$0006

  .loop:
    LDA.W #$0004 : STA.W SamusProjectile_TrailTimers,X
    LDA.W EquippedBeams : AND.W #$100F : ORA.W #$8010 : STA.W SamusProjectile_Types,X
    STZ.W SamusProjectile_Directions,X
    LDA.W #ProjectilePreInstruction_WaveSBA : STA.W SamusProjectile_PreInstructions,X
    LDA.W #$0258 : STA.W SamusProjectile_YVelocities,X
    STZ.W SamusProjectile_XVelocities,X : STZ.W SamusProjectile_Variables,X
    STZ.W SamusProjectile_XSubPositions,X : STZ.W SamusProjectile_YSubPositions,X
    LDA.W SamusXPosition : CLC : ADC.W .XOffsets,X : STA.W SamusProjectile_XPositions,X
    LDA.W SamusYPosition : CLC : ADC.W .YOffsets,X : STA.W SamusProjectile_YPositions,X
    JSL InitializeSBAProjectile
    DEX #2 : BPL .loop
    LDA.W #$0004 : STA.W SamusProjectile_ProjectileCounter
    LDA.W SamusProjectile_Types : AND.W #$003F : TAY
    LDA.W ProjectileCooldowns_Uncharged,Y : AND.W #$00FF : STA.W SamusProjectile_CooldownTimer
    LDA.W #$0004 : STA.W SBAAngleDelta
    LDA.W #$0028
    JSL QueueSound_Lib1_Max6
    SEC
    RTS

  .XOffsets:
; X offsets from Samus
    dw $0080,$0080,$FF80,$FF80

  .YOffsets:
; y offsets from Samus
    dw $0080,$FF80,$FF80,$0080


;;; $CD9B: Fire ice SBA ;;;
FireIceSBA:
;; Returns:
;;     Carry: Set if succeeded
    LDA.W SamusProjectile_PreInstructions : CMP.W #ProjectilePreInstruction_IceSBA_End : BEQ .returnCarryClear
    CMP.W #ProjectilePreInstruction_IceSBA_Main : BNE .fire

  .returnCarryClear:
    CLC
    RTS

  .fire:
    LDX.W #$0006

  .loop:
    LDA.W #$0004 : STA.W SamusProjectile_TrailTimers,X
    LDA.W EquippedBeams : AND.W #$100F : ORA.W #$8010 : STA.W SamusProjectile_Types,X
    STZ.W SamusProjectile_Directions,X
    LDA.W #ProjectilePreInstruction_IceSBA_Main : STA.W SamusProjectile_PreInstructions,X
    LDA.W IcePlasmaSBAProjectileOriginAngles,X : STA.W SamusProjectile_Variables,X
    LDA.W #$0258 : STA.W SamusProjectile_YVelocities,X
    JSL InitializeProjectile
    DEX #2 : BPL .loop
    LDA.W #$0004 : STA.W SamusProjectile_ProjectileCounter
    LDA.W SamusProjectile_Types : AND.W #$003F : TAY
    LDA.W ProjectileCooldowns_Uncharged,Y : AND.W #$00FF : STA.W SamusProjectile_CooldownTimer
    LDA.W PoseXDirection : AND.W #$00FF : CMP.W #$0004 : BEQ .facingLeft
    LDA.W #$0004 : STA.W SBAAngleDelta
    BRA .finish

  .facingLeft:
    LDA.W #$FFFC : STA.W SBAAngleDelta

  .finish:
    LDA.W #$0023
    JSL QueueSound_Lib1_Max6
    SEC
    RTS


;;; $CE14: Fire spazer SBA ;;;
FireSpazerSBA:
;; Returns:
;;     Carry: Set. Fire SBA succeeded
    LDX.W #$0006

  .loop:
    LDA.W .initialTrailTimers,X : STA.W SamusProjectile_TrailTimers,X
    LDA.W #$0005 : STA.W SamusProjectile_Directions,X
    LDA.W #ProjectilePreInstruction_SpazerSBA : STA.W SamusProjectile_PreInstructions,X
    LDA.W #$0028 : STA.W SamusProjectile_XVelocities,X
    LDA.W .angleDeltas,X : STA.W SamusProjectile_YVelocities,X
    STZ.W SamusProjectile_Variables,X : STZ.W SamusProjectile_Phases,X
    STZ.W SamusProjectile_XSubPositions,X : STZ.W SamusProjectile_YSubPositions,X
    CPX.W #$0004 : BPL .greaterThanEqualTo4
    LDA.W EquippedBeams : AND.W #$100F : ORA.W #$8010 : STA.W SamusProjectile_Types,X
    JSL InitializeSBAProjectile
    BRA .next

  .greaterThanEqualTo4:
    LDA.W #$8024 : STA.W SamusProjectile_Types,X
    JSL Initialize_ShinesparkEcho_or_SpazerSBATrailProjectile

  .next:
    DEX #2 : BPL .loop
    LDA.W #$0004 : STA.W SamusProjectile_ProjectileCounter
    LDA.W SamusProjectile_Types : AND.W #$003F : TAY
    LDA.W ProjectileCooldowns_Uncharged,Y : AND.W #$00FF : STA.W SamusProjectile_CooldownTimer
    STZ.W SBAAngleDelta
    LDA.W #$0025
    JSL QueueSound_Lib1_Max6
    SEC
    RTS

  .initialTrailTimers:
    dw $0000,$0000,$0004,$0004

  .angleDeltas:
    dw $0004,$FFFC,$0004,$FFFC


;;; $CE98: Fire plasma SBA ;;;
FirePlasmaSBA:
;; Returns:
;;     Carry: Set if succeeded
    LDA.W SamusProjectile_PreInstructions : CMP.W #ProjectilePreInstruction_PlasmaSBA : BNE +
    CLC
    RTS

+   LDX.W #$0006

  .loop:
    LDA.W EquippedBeams : AND.W #$100F : ORA.W #$8010 : STA.W SamusProjectile_Types,X
    STZ.W SamusProjectile_Directions,X
    LDA.W #ProjectilePreInstruction_PlasmaSBA : STA.W SamusProjectile_PreInstructions,X
    LDA.W IcePlasmaSBAProjectileOriginAngles,X : STA.W SamusProjectile_Variables,X
    LDA.W #$0028 : STA.W SamusProjectile_XVelocities,X
    STZ.W SamusProjectile_YVelocities,X
    JSL InitializeSBAProjectile
    DEX #2 : BPL .loop
    LDA.W #$0004 : STA.W SamusProjectile_ProjectileCounter
    LDA.W SamusProjectile_Types : AND.W #$003F : TAY
    LDA.W ProjectileCooldowns_Uncharged,Y : AND.W #$00FF : STA.W SamusProjectile_CooldownTimer
    LDA.W PoseXDirection : AND.W #$00FF : CMP.W #$0004 : BEQ .facingLeft
    LDA.W #$0004 : STA.W SBAAngleDelta
    BRA .playSFX

  .facingLeft:
    LDA.W #$FFFC : STA.W SBAAngleDelta

  .playSFX:
    LDA.W #$0027
    JSL QueueSound_Lib1_Max6
    SEC
    RTS


;;; $CF09: Projectile pre-instruction - ice SBA - main ;;;
ProjectilePreInstruction_IceSBA_Main:
;; Parameters:
;;     X: Projectile index
    LDA.W SamusProjectile_Directions,X : AND.W #$00F0 : BEQ .trail
    LDA.W #$0024
    JSL QueueSound_Lib1_Max6
    JSL Clear_Projectile
    RTS

  .trail:
    DEC.W SamusProjectile_TrailTimers,X : BNE +
    LDA.W #$0004 : STA.W SamusProjectile_TrailTimers,X
    JSL Spawn_ProjectileTrail
    LDX.W ProjectileIndex

+   LDA.W SamusProjectile_Variables,X : TAY
    LDA.W #$0020
    JSR Math_90CC39
    LDA.W SamusXPosition : CLC : ADC.B DP_Temp14 : STA.W SamusProjectile_XPositions,X
    LDA.W SamusYPosition : CLC : ADC.B DP_Temp16 : STA.W SamusProjectile_YPositions,X
    LDA.W SamusProjectile_Variables,X : CLC : ADC.W SBAAngleDelta : AND.W #$00FF : STA.W SamusProjectile_Variables,X
    DEC.W SamusProjectile_YVelocities,X : BNE .done
    LDA.W #ProjectilePreInstruction_IceSBA_End : STA.W SamusProjectile_PreInstructions,X
    LDA.W #$0028 : STA.W SamusProjectile_XVelocities,X
    LDA.W #$0024
    JSL QueueSound_Lib1_Max6

  .done:
    LDA.W #$0002 : STA.W SamusProjectile_CooldownTimer
    STZ.W SamusProjectile_FlareCounter
    RTS


;;; $CF7A: Projectile pre-instruction - ice SBA - end ;;;
ProjectilePreInstruction_IceSBA_End:
;; Parameters:
;;     X: Projectile index
    LDA.W SamusProjectile_Directions,X : AND.W #$00F0 : BEQ .notDeleted
    JSL Clear_Projectile
    RTS

  .notDeleted:
    DEC.W SamusProjectile_TrailTimers,X : BNE +
    LDA.W #$0004 : STA.W SamusProjectile_TrailTimers,X
    JSL Spawn_ProjectileTrail
    LDX.W ProjectileIndex

+   LDA.W SamusProjectile_Variables,X : TAY
    LDA.W SamusProjectile_XVelocities,X
    JSR Math_90CC39
    LDA.W SamusXPosition : CLC : ADC.B DP_Temp14 : STA.W SamusProjectile_XPositions,X
    SEC : SBC.W Layer1XPosition : CMP.W #$FFE0 : BMI .clearProjectile
    CMP.W #$0120 : BPL .clearProjectile
    LDA.W SamusYPosition : CLC : ADC.B DP_Temp16 : STA.W SamusProjectile_YPositions,X
    SEC : SBC.W Layer1YPosition : CMP.W #$0010 : BMI .clearProjectile
    CMP.W #$0100 : BPL .clearProjectile
    LDA.W SamusProjectile_Variables,X : CLC : ADC.W SBAAngleDelta : AND.W #$00FF : STA.W SamusProjectile_Variables,X
    LDA.W SamusProjectile_XVelocities,X : CLC : ADC.W #$0008
    AND.W #$00FF : STA.W SamusProjectile_XVelocities,X
    LDA.W #$0002 : STA.W SamusProjectile_CooldownTimer
    STZ.W SamusProjectile_FlareCounter
    RTS

  .clearProjectile:
    JSL Clear_Projectile
    RTS


;;; $CFFA: Trigger shinespark windup ;;;
TriggerShinesparkWindup:
    PHP : PHB
    PHK : PLB
    REP #$30
    LDA.W #SamusMovementHandler_ShinesparkWindup : STA.W MovementHandler
    LDA.W #$0001 : STA.W SamusYDirection
    LDA.W #$0400 : STA.W SamusBoostTimer
    STZ.W SamusYSubSpeed : STZ.W SamusYSpeed
    STZ.W KnockbackDirection
    LDA.W #$0008 : STA.W SamusXExtraRunSpeed
    STZ.W SamusXExtraRunSubSpeed
    STZ.W SamusXBaseSpeed : STZ.W SamusXBaseSubSpeed
    LDA.W #$0007 : STA.W ShinesparkYAcceleration
    STZ.W ShinesparkYSubAcceleration
    STZ.W SamusProjectile_CooldownTimer
    LDA.W #$001E : STA.W ShinesparkWindupCrashTimer
    LDA.W #$003C : STA.W SpecialPaletteTimer
    LDA.W #$0006 : STA.W SpecialSamusPaletteType
    STZ.W SpecialSamusPaletteFrame : STZ.W BombJumpDirection
    LDA.W SamusProjectile_FlareCounter : BEQ .return
    CMP.W #$0010 : BMI .resetFlare
    LDA.W #$0002
    JSL QueueSound_Lib1_Max9

  .resetFlare:
    STZ.W SamusProjectile_FlareCounter
    JSR ClearFlareAnimationState

  .return:
    PLB : PLP
    RTL


;;; $D068: Samus movement handler - shinespark windup ;;;
SamusMovementHandler_ShinesparkWindup:
    DEC.W ShinesparkWindupCrashTimer : BEQ .timerExpired
    BPL .return

  .timerExpired:
    LDA.W PoseXDirection : AND.W #$00FF : CMP.W #$0004 : BEQ .facingLeft
    LDA.W #$00CB : STA.W SpecialProspectivePose
    BRA +

  .facingLeft:
    LDA.W #$00CC : STA.W SpecialProspectivePose

+   LDA.W #SamusMovementHandler_VerticalShinespark : STA.W MovementHandler
    LDA.W #RTS_90E90E : STA.W PoseInputHandler
    STZ.W SpeedEcho_Index
    STZ.W SpeedEcho_XSpeed0 : STZ.W SpeedEcho_XSpeed1
    STZ.W SpeedEcho_XPosition0 : STZ.W SpeedEcho_XPosition1
    LDA.W #$000F
    JSL QueueSound_Lib3_Max9

  .return:
    RTS


;;; $D0AB: Samus movement handler - vertical shinespark ;;;
SamusMovementHandler_VerticalShinespark:
    LDA.W #$0002 : STA.W ContactDamageIndex
    LDA.W #$0008 : STA.W HurtFlashCounter
    LDX.W #$0004
    LDY.W Unknown_ShinesparkMovementHandler_Unused_90EF20 ; >_<
    JSR UpdateSamusEchoPosition
    JSR Shinespark_Vertical_Movement
    JSR EndShinesparkIfCollisionDetectedOrLowEnergy
    LDA.W Energy : CMP.W #$001E : BMI .return
    DEC.W Energy : BPL .return
    STZ.W Energy ; >_<

  .return:
    RTS


;;; $D0D7: Samus movement handler - diagonal shinespark ;;;
SamusMovementHandler_DiagonalShinespark:
    LDA.W #$0002 : STA.W ContactDamageIndex
    LDA.W #$0008 : STA.W HurtFlashCounter
    LDX.W #$0004
    LDY.W Unknown_ShinesparkMovementHandler_Unused_90EF20
    JSR UpdateSamusEchoPosition ; >_<
    JSR Shinespark_Horizontal_Movement
    JSR Shinespark_Vertical_Movement
    JSR EndShinesparkIfCollisionDetectedOrLowEnergy
    LDA.W Energy : CMP.W #$001E : BMI .return
    DEC.W Energy : BPL .return
    STZ.W Energy ; >_<

  .return:
    RTS


;;; $D106: Samus movement handler - horizontal shinespark ;;;
SamusMovementHandler_HorizontalShinespark:
    LDA.W #$0002 : STA.W ContactDamageIndex
    LDA.W #$0008 : STA.W HurtFlashCounter
    LDX.W #$0008
    LDY.W Unknown_ShinesparkMovementHandler_Unused_90EF20 ; >_<
    JSR UpdateSamusEchoPosition
    JSR Shinespark_Horizontal_Movement
    JSR EndShinesparkIfCollisionDetectedOrLowEnergy
    LDA.W Energy : CMP.W #$001E : BMI .return
    DEC.W Energy : BPL .return
    STZ.W Energy ; >_<

  .return:
    RTS


;;; $D132: Shinespark horizontal movement ;;;
Shinespark_Horizontal_Movement:
    LDA.W #$000F : STA.W SpecialPaletteTimer
    LDA.W SamusXExtraRunSubSpeed : CLC : ADC.W SamusYSubAcceleration : STA.W SamusXExtraRunSubSpeed
    LDA.W SamusXExtraRunSpeed : ADC.W SamusYAcceleration : STA.W SamusXExtraRunSpeed
    CMP.W #$000F : BMI +
    LDA.W #$000F : STA.W SamusXExtraRunSpeed
    STZ.W SamusXExtraRunSubSpeed

+   STZ.B DP_Temp12 : STZ.B DP_Temp14
    LDA.W PoseXDirection : AND.W #$00FF : CMP.W #$0004 : BEQ .left
    JSR CalculateSamusXDisplacement_ForMovingRight
    LDA.B DP_Temp12 : CMP.W #$000F : BMI .rightCollision
    LDA.W #$000F : STA.B DP_Temp12

  .rightCollision:
    JSL Samus_vs_SolidEnemy_CollisionDetection
    TAX : BEQ .moveRight
    STA.W SamusSolidCollisionFlag
    BRA .merge

  .moveRight:
    JSL MoveSamusRight_NoSolidEnemyCollision
    JSL Align_SamusYPosition_WithNonSquareSlope
    BRA .merge

  .left:
    JSR CalculateSamusXDisplacement_ForMovingLeft
    LDA.B DP_Temp12 : EOR.W #$FFFF : STA.B DP_Temp12
    LDA.B DP_Temp14 : EOR.W #$FFFF : INC : STA.B DP_Temp14 : BNE +
    INC.B DP_Temp12

+   LDA.B DP_Temp12 : CMP.W #$000F : BMI .leftCollision
    LDA.W #$000F : STA.B DP_Temp12

  .leftCollision:
    JSL Samus_vs_SolidEnemy_CollisionDetection
    TAX : BEQ .flipDirection
    STA.W SamusSolidCollisionFlag
    BRA .merge

  .flipDirection:
    LDA.B DP_Temp12 : EOR.W #$FFFF : STA.B DP_Temp12
    LDA.B DP_Temp14 : EOR.W #$FFFF : INC : STA.B DP_Temp14 : BNE .moveLeft
    INC.B DP_Temp12

  .moveLeft:
    JSL MoveSamusRight_NoSolidEnemyCollision
    JSL Align_SamusYPosition_WithNonSquareSlope

  .merge:
    LDA.W SamusXPosition : SEC : SBC.W SamusPreviousXPosition : BMI +
    CMP.W #$0010 : BMI .return
    LDA.W SamusXPosition : SEC : SBC.W #$000F : STA.W SamusPreviousXPosition
    RTS

+   CMP.W #$FFF1 : BPL .return
    LDA.W SamusXPosition : CLC : ADC.W #$000F : STA.W SamusPreviousXPosition

  .return:
    RTS


;;; $D1FF: Shinespark vertical movement ;;;
Shinespark_Vertical_Movement:
    LDA.W #$000F : STA.W SpecialPaletteTimer
    LDA.W ShinesparkYSubAcceleration : CLC : ADC.W SamusYSubAcceleration : STA.W ShinesparkYSubAcceleration
    LDA.W ShinesparkYAcceleration : ADC.W SamusYAcceleration : STA.W ShinesparkYAcceleration
    LDA.W SamusYSubSpeed : CLC : ADC.W ShinesparkYSubAcceleration : STA.W SamusYSubSpeed : STA.B DP_Temp14
    LDA.W SamusYSpeed : ADC.W ShinesparkYAcceleration : STA.W SamusYSpeed : STA.B DP_Temp12
    CMP.W #$000E : BMI .flipDirection
    LDA.W #$000E : STA.B DP_Temp12

  .flipDirection:
    LDA.B DP_Temp12 : EOR.W #$FFFF : STA.B DP_Temp12
    LDA.B DP_Temp14 : EOR.W #$FFFF : INC : STA.B DP_Temp14 : BNE +
    INC.B DP_Temp12

+   LDA.W ExtraSamusYSubDisplacement : CLC : ADC.B DP_Temp14 : STA.B DP_Temp14
    LDA.W ExtraSamusYDisplacement : ADC.B DP_Temp12 : STA.B DP_Temp12
    LDA.W #$0002 : STA.W CollisionMovementDirection
    LDA.B DP_Temp12 : EOR.W #$FFFF : STA.B DP_Temp12
    LDA.B DP_Temp14 : EOR.W #$FFFF : INC : STA.B DP_Temp14 : BNE +
    INC.B DP_Temp12

+   LDA.B DP_Temp12 : CMP.W #$000F : BMI .collisionDetection
    LDA.W #$000F : STA.B DP_Temp12

  .collisionDetection:
    JSL Samus_vs_SolidEnemy_CollisionDetection
    TAX : BEQ +
    STA.W SamusSolidCollisionFlag
    BRA .noMovement

+   LDA.B DP_Temp12 : EOR.W #$FFFF : STA.B DP_Temp12
    LDA.B DP_Temp14 : EOR.W #$FFFF : INC : STA.B DP_Temp14 : BNE .moveSamus
    INC.B DP_Temp12

  .moveSamus:
    JSL MoveSamusDown_NoSolidEnemyCollision

  .noMovement:
    LDA.W SamusYPosition : SEC : SBC.W SamusPreviousYPosition : CMP.W #$FFF2 : BPL .return
    LDA.W SamusYPosition : CLC : ADC.W #$000E : STA.W SamusPreviousYPosition

  .return:
    RTS


;;; $D2BA: End shinespark if collision detected or low health ;;;
EndShinesparkIfCollisionDetectedOrLowEnergy:
;; Returns:
;;     Carry: Set if shinespark ended, otherwise clear
    LDA.W Energy : CMP.W #$001E : BMI .endShinespark
    LDA.W SamusSolidCollisionFlag : BNE .endShinespark
    CLC
    RTS

  .endShinespark:
    LDA.W PoseXDirection : AND.W #$00FF : CMP.W #$0004 : BEQ .facingLeft
    LDA.W #$00E0 : STA.W SpeedEcho_XSpeed0
    LDA.W #$0060 : STA.W SpeedEcho_XSpeed1
    LDA.W #$FFFC : STA.W SpeedEcho_XPosition2
    BRA .merge

  .facingLeft:
    LDA.W #$0020 : STA.W SpeedEcho_XSpeed0
    LDA.W #$00A0 : STA.W SpeedEcho_XSpeed1
    LDA.W #$0004 : STA.W SpeedEcho_XPosition2

  .merge:
    STZ.W SamusYSubSpeed : STZ.W SamusYSpeed
    STZ.W SamusXExtraRunSpeed : STZ.W SamusXExtraRunSubSpeed
    STZ.W SamusBoostTimer : STZ.W neverRead0B1A
    STZ.W SamusYDirection
    LDA.W #SamusMovementHandler_ShinesparkCrash_EchoesCircleSamus : STA.W MovementHandler
    LDA.W #SamusDisplayHandler_ShinesparkCrashCircle : STA.W DrawingHandler
    STZ.W SpeedEcho_Index
    LDA.W SamusXPosition : STA.W SpeedEcho_XPosition0 : STA.W SpeedEcho_XPosition1
    LDA.W SamusYPosition : STA.W SpeedEcho_YPosition0 : STA.W SpeedEcho_YPosition1
    STZ.W SpeedEcho_DrawFlag2 : STZ.W HurtFlashCounter
    LDA.W #$0035
    JSL QueueSound_Lib1_Max6
    LDA.W #$0010
    JSL QueueSound_Lib3_Max6
    SEC
    RTS


;;; $D346: Samus movement handler - shinespark crash - echoes circle Samus ;;;
SamusMovementHandler_ShinesparkCrash_EchoesCircleSamus:
    LDA.W #$000F : STA.W SpecialPaletteTimer
    LDA.W CrashEcho_Phase : AND.W #$00FF : ASL : TAX
    JSR.W (.pointers,X)
    LDX.W #$0002

  .loop:
    LDY.W SpeedEcho_XSpeed0,X
    LDA.W SpeedEcho_Index : AND.W #$00FF
    JSR Math_90CC39
    LDA.W SamusXPosition : CLC : ADC.B DP_Temp14 : STA.W SpeedEcho_XPosition0,X
    LDA.W SamusYPosition : CLC : ADC.B DP_Temp16 : STA.W SpeedEcho_YPosition0,X
    DEX #2 : BPL .loop
    RTS

  .pointers:
    dw ShinesparkCrash_EchoesCircleSamus_Phase0
    dw ShinesparkCrash_EchoesCircleSamus_Phase1
    dw ShinesparkCrash_EchoesCircleSamus_Phase2


;;; $D383: Samus movement handler - shinespark crash - echoes circle Samus - phase 0 ;;;
ShinesparkCrash_EchoesCircleSamus_Phase0:
    LDA.W SpeedEcho_Index : CLC : ADC.W #$0004 : CMP.W #$0010 : BMI +
    ORA.W #$0100

+   STA.W SpeedEcho_Index
    RTS


;;; $D396: Samus movement handler - shinespark crash - echoes circle Samus - phase 1 ;;;
ShinesparkCrash_EchoesCircleSamus_Phase1:
    LDA.W SpeedEcho_XSpeed0 : CLC : ADC.W SpeedEcho_XPosition2 : AND.W #$00FF : STA.W SpeedEcho_XSpeed0
    LDA.W SpeedEcho_XSpeed1 : CLC : ADC.W SpeedEcho_XPosition2 : AND.W #$00FF : STA.W SpeedEcho_XSpeed1
    LDA.W SpeedEcho_YPosition2 : CLC : ADC.W #$0004 : STA.W SpeedEcho_YPosition2
    CMP.W #$0080 : BMI .return
    LDA.W SpeedEcho_Index : AND.W #$00FF : ORA.W #$0200 : STA.W SpeedEcho_Index

  .return:
    RTS


;;; $D3CC: Samus movement handler - shinespark crash - echoes circle Samus - phase 2 ;;;
ShinesparkCrash_EchoesCircleSamus_Phase2:
    LDA.W SpeedEcho_Index : SEC : SBC.W #$0004 : STA.W SpeedEcho_Index
    AND.W #$00FF : BEQ .zeroDistance
    BPL .return

  .zeroDistance:
    LDA.W #ShinesparkCrash_EchoesFinishedCirclingSamus : STA.W MovementHandler
    LDA.W #$001E : STA.W ShinesparkWindupCrashTimer
    STZ.W SpeedEcho_Index
    STZ.W SpeedEcho_XSpeed0 : STZ.W SpeedEcho_XSpeed1

  .return:
    RTS


;;; $D3F3: Samus movement handler - shinespark crash - echoes finished circling Samus ;;;
ShinesparkCrash_EchoesFinishedCirclingSamus:
    LDA.W #$000F : STA.W SpecialPaletteTimer
    DEC.W ShinesparkWindupCrashTimer : BEQ .timerExpired
    BPL .return

  .timerExpired:
    LDA.W #ShinesparkCrash_Finish : STA.W MovementHandler
    LDA.W #SamusDrawingHandler_Default : STA.W DrawingHandler

  .return:
    RTS


;;; $D40D: Samus movement handler - shinespark crash - finish ;;;
ShinesparkCrash_Finish:
    STZ.W SpeedEcho_Index
    LDA.W SamusProjectile_ProjectileCounter : CMP.W #$0005 : BPL .dontFire
    CMP.W #$0004 : BPL .extraEcho
    INC.W SamusProjectile_ProjectileCounter
    LDA.W #$0040 : STA.W SpeedEcho_DrawFlag2
    LDA.W SamusXPosition : STA.W CrashEcho_AngleDelta
    LDA.W SamusYPosition : STA.W SpeedEcho_YPosition2
    LDA.W #$8029 : STA.W SamusProjectile_Types+6
    LDX.W #$0006
    JSL Initialize_ShinesparkEcho_or_SpazerSBATrailProjectile
    LDA.W #ProjectilePreInstruction_SpeedEcho : STA.W SamusProjectile_PreInstructions+6
    LDA.W Pose : SEC : SBC.W #$00C9 : ASL : TAX
    LDA.W .data0,X : AND.W #$00FF : STA.W SamusProjectile_Variables+6
    STZ.W SamusProjectile_XVelocities+6

  .extraEcho:
    INC.W SamusProjectile_ProjectileCounter
    LDA.W #$0040 : STA.W SpeedEcho_DrawFlag3
    LDA.W SamusXPosition : STA.W SpeedEcho_XPosition3
    LDA.W SamusYPosition : STA.W SpeedEcho_YPosition3
    LDA.W #$8029 : STA.W SamusProjectile_Types+8
    LDX.W #$0008
    JSL Initialize_ShinesparkEcho_or_SpazerSBATrailProjectile
    LDA.W #ProjectilePreInstruction_SpeedEcho : STA.W SamusProjectile_PreInstructions+8
    LDA.W Pose : SEC : SBC.W #$00C9 : ASL : TAX
    LDA.W .data1,X : AND.W #$00FF : STA.W SamusProjectile_Variables+8
    STZ.W SamusProjectile_XVelocities+8

  .dontFire:
    STZ.W SamusProjectile_CooldownTimer
    LDA.W #$0001 : STA.W SpecialPaletteTimer
    LDA.W PoseXDirection : AND.W #$00FF : CMP.W #$0004 : BEQ .facingLeft
    LDA.W #$0001 : STA.W SuperSpecialProspectivePose
    BRA .finish

  .facingLeft:
    LDA.W #$0002 : STA.W SuperSpecialProspectivePose

  .finish:
    LDA.W #$0002 : STA.W SuperSpecialProspectivePoseChangeCommand
    STZ.W ShinesparkYAcceleration : STZ.W ShinesparkYSubAcceleration
    RTS

  .data0:
    db $00
  .data1:
    db     $80 ; C9h: Facing right - shinespark - horizontal
    db $00,$80 ; CAh: Facing left-   shinespark - horizontal
    db $40,$C0 ; CBh: Facing right - shinespark - vertical
    db $40,$C0 ; CCh: Facing left-   shinespark - vertical
    db $E0,$60 ; CDh: Facing right - shinespark - diagonal
    db $20,$A0 ; CEh: Facing left-   shinespark - diagonal


;;; $D4D2: Projectile pre-instruction - speed echo ;;;
ProjectilePreInstruction_SpeedEcho:
;; Parameters:
;;     X: Projectile index. Must be projectile slot 3 or 4, corresponding to speed echo 2 or 3 respectively

; BUG: It's possible for the projectile distance to be F8h..FFh whilst still on-screen,
;      e.g. Samus is within 8px of the left/right edge of the screen and a horizontal echo reaches the opposite edge of the screen
;      In this case, because only the low byte of projectile distance is used,
;      adding 8 to projectile distance effectively wraps around to 0..7, causing the echo itself to warp back to Samus
    LDA.W SamusProjectile_XVelocities,X : CLC : ADC.W #$0008 : STA.W SamusProjectile_XVelocities,X
    LDY.W SamusProjectile_Variables,X
    LDA.W SamusProjectile_XVelocities,X : AND.W #$00FF
    JSR Math_90CC39
    LDA.W SamusXPosition : CLC : ADC.B DP_Temp14 : STA.W SpeedEcho_Index,X : STA.W SamusProjectile_XPositions,X
    SEC : SBC.W Layer1XPosition : BMI .done
    CMP.W #$0100 : BPL .done
    LDA.W SamusYPosition : CLC : ADC.B DP_Temp16 : STA.W SpeedEcho_XPosition3,X : STA.W SamusProjectile_YPositions,X
    SEC : SBC.W Layer1YPosition : BMI .done
    CMP.W #$0100 : BPL .done
    RTS

  .done:
    STZ.W SpeedEcho_YPosition3,X : STZ.W SpeedEcho_Index,X : STZ.W SpeedEcho_XPosition3,X
    JSL Clear_Projectile
    RTS


if !FEATURE_KEEP_UNREFERENCED
;;; $D525: Unused ;;;
UNUSED_GrappleBeam_90D525:
; Looks like this is supposed to make Samus extend and contract her grapple beam in a loop for the duration of GrappleWalljumpTimer
; No idea what this would hypothetically be used for
; This is the only place where GrappleBeam_EndAngle and $0CFC aren't mirrors of each other
    LDA.B DP_Controller1Input : BIT.W ShotBinding : BNE .holdingShot

  .cancel:
    LDA.W #GrappleBeamFunction_HitNothing_Cancel : STA.W GrappleBeam_Function
    RTS

  .holdingShot:
    LDA.W GrappleWalljumpTimer : DEC : STA.W GrappleWalljumpTimer : BEQ .cancel
    BMI .cancel
    LDA.W GrappleBeam_LengthDelta : BMI .continue
    LDA.W GrappleBeam_Length : CLC : ADC.W GrappleBeam_LengthDelta : STA.W GrappleBeam_Length
    CMP.W #$0060 : BMI .continue
    LDA.W #$0010 : EOR.W #$FFFF : INC : STA.W GrappleBeam_LengthDelta
    BRA .continue

    ; dead code
    LDA.W GrappleBeam_Length : CLC : ADC.W GrappleBeam_LengthDelta : STA.W GrappleBeam_Length : BPL .continue
    STZ.W GrappleBeam_Length
    LDA.W #$0010 : STA.W GrappleBeam_LengthDelta

  .continue:
    LDA.W GrappleBeam_EndAngle : XBA : AND.W #$00FF : TAY
    LDA.W GrappleBeam_Length
    JSR Math_90CC39
    LDA.W GrappleBeam_StartXPosition : CLC : ADC.B DP_Temp14 : STA.W GrappleBeam_EndXPosition
    LDA.W GrappleBeam_StartYPosition : CLC : ADC.B DP_Temp16 : STA.W GrappleBeam_EndYPosition
    LDA.W GrappleBeam_EndAngle : CLC : ADC.W #$0800 : STA.W GrappleBeam_EndAngle
    JSL UpdateGrappleBeamStartPositionDuringGrappleFire
    RTS
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $D5A2: Crystal flash ;;;
CrystalFlash:
;; Returns:
;;     Carry: Clear if succeeded, otherwise set
    PHP
    REP #$30
    LDA.W GameState : CMP.W #$0028 : BPL .skipInputCheck
    LDA.W #$0430 : ORA.W ShotBinding : STA.B DP_Temp12
    LDA.B DP_Controller1Input : CMP.B DP_Temp12 : BNE .returnCarrySet

  .skipInputCheck:
    LDA.W SamusYSpeed : BNE .returnCarrySet
    LDA.W SamusYSubSpeed : BNE .returnCarrySet
    LDA.W Energy : CMP.W #$0033 : BPL .returnCarrySet
    LDA.W ReserveEnergy : BNE .returnCarrySet
    LDA.W Missiles : CMP.W #$000A : BMI .returnCarrySet
    LDA.W SuperMissiles : CMP.W #$000A : BMI .returnCarrySet
    LDA.W PowerBombs : CMP.W #$000A : BPL .activate

  .returnCarrySet:
    PLP
    SEC
    RTL

  .activate:
    LDA.W PoseXDirection : AND.W #$00FF : CMP.W #$0004 : BEQ .facingLeft
    LDA.W #$00D3
    BRA .storePose

  .facingLeft:
    LDA.W #$00D4

  .storePose:
    STA.W Pose
    JSL InitializeSamusPose_1
    JSL Set_Samus_AnimationFrame_if_PoseChanged
    LDA.W MovementType : AND.W #$00FF : CMP.W #$001B : BNE .returnCarrySet
    LDA.W PreviousPose : STA.W LastDifferentPose
    LDA.W PreviousPoseXDirection : STA.W LastDifferentPoseXDirection
    LDA.W Pose : STA.W PreviousPose
    LDA.W PoseXDirection : STA.W PreviousPoseXDirection
    LDA.W #SamusMovementHandler_CrystalFlash_RaiseSamus_GenerateBubble : STA.W MovementHandler
    LDA.W PoseInputHandler : CMP.W #SamusPoseInputHandler_Demo : BEQ .skipInputHandler
    LDA.W #RTS_90E90E : STA.W PoseInputHandler

  .skipInputHandler:
    LDA.W #$0009 : STA.W ShinesparkWindupCrashTimer
    STZ.W CrystalFlashAmmoDecrementingIndex
    LDA.W #$000A : STA.W CrystalFlash_AmmoDecrementingTimer
    STZ.W ShinesparkYSubAcceleration
    STZ.W CrystalFlash_SamusYPosition : STZ.W CrystalFlash_PaletteTimer
    LDA.W #$0007 : STA.W SpecialSamusPaletteType
    STZ.W SpecialSamusPaletteFrame
    LDA.W #$0001 : STA.W SpecialPaletteTimer : STA.W CrystalFlash_PaletteTimer
    STZ.W SamusInvincibilityTimer : STZ.W SamusKnockbackTimer : STZ.W KnockbackDirection
    PLP
    CLC
    RTL


;;; $D678: Samus movement handler - crystal flash - start (raise Samus and generate bubble) ;;;
SamusMovementHandler_CrystalFlash_RaiseSamus_GenerateBubble:
    LDA.W SamusYPosition : DEC #2 : STA.W SamusYPosition
    LDA.W ShinesparkWindupCrashTimer : DEC : STA.W ShinesparkWindupCrashTimer : BPL .return
    LDA.W #$0003 : STA.W SamusAnimationFrameTimer
    LDA.W #$0006 : STA.W SamusAnimationFrame
    LDA.W SamusYPosition : STA.W $0DF0
    LDA.W #SamusMovementHandler_CrystalFlash_DecrementAmmo : STA.W MovementHandler
    STZ.W SamusInvincibilityTimer : STZ.W SamusKnockbackTimer
    LDA.W #$0001
    JSL QueueSound_Lib3_Max15
    STZ.W SamusProjectile_PowerBombFlag
    LDA.W SamusXPosition : STA.W SamusProjectile_PowerBombExplosionXPosition
    LDA.W SamusYPosition : STA.W SamusProjectile_PowerBombExplosionYPosition
    PHX : PHY : PHP : PHB
    JSL Enable_HDMAObjects
    JSL Spawn_CrystalFlash_HDMAObjects
    PLB : PLP : PLY
    PLX

  .return:
    RTS


;;; $D6CE: Samus movement handler - crystal flash - main (decrement ammo) ;;;
SamusMovementHandler_CrystalFlash_DecrementAmmo:
    LDA.W CrystalFlashAmmoDecrementingIndex : ASL : TAX
    JSR.W (.pointers,X)
    STZ.W SamusInvincibilityTimer : STZ.W SamusKnockbackTimer
    RTS

  .pointers:
    dw CrystalFlash_DecrementMissiles
    dw CrystalFlash_DecrementSuperMissiles
    dw CrystalFlash_DecrementPowerBombs


;;; $D6E3: Crystal flash - decrement missiles ;;;
CrystalFlash_DecrementMissiles:
    LDA.W NMI_FrameCounter : BIT.W #$0007 : BNE .return
    DEC.W Missiles
    LDA.W #$0032
    JSL Restore_A_Energy_ToSamus
    DEC.W CrystalFlash_AmmoDecrementingTimer : BEQ .timerExpired
    BPL .return

  .timerExpired:
    LDA.W #$000A : STA.W CrystalFlash_AmmoDecrementingTimer
    INC.W CrystalFlashAmmoDecrementingIndex

  .return:
    RTS


;;; $D706: Crystal flash - decrement super missiles ;;;
CrystalFlash_DecrementSuperMissiles:
    LDA.W NMI_FrameCounter : BIT.W #$0007 : BNE .return
    DEC.W SuperMissiles
    LDA.W #$0032
    JSL Restore_A_Energy_ToSamus
    DEC.W CrystalFlash_AmmoDecrementingTimer : BEQ .timerExpired
    BPL .return

  .timerExpired:
    LDA.W #$000A : STA.W CrystalFlash_AmmoDecrementingTimer
    INC.W CrystalFlashAmmoDecrementingIndex

  .return:
    RTS


;;; $D729: Crystal flash - decrement power bombs ;;;
CrystalFlash_DecrementPowerBombs:
    LDA.W NMI_FrameCounter : BIT.W #$0007 : BNE .return
    DEC.W PowerBombs
    LDA.W #$0032
    JSL Restore_A_Energy_ToSamus
    DEC.W CrystalFlash_AmmoDecrementingTimer : BEQ .timerExpired
    BPL .return

  .timerExpired:
    LDA.W #SamusMovementHandler_CrystalFlash_Finish : STA.W MovementHandler
    LDA.W #SamusDrawingHandler_Default : STA.W DrawingHandler
    LDA.W #$0003 : STA.W SamusAnimationFrameTimer
    LDA.W #$000C : STA.W SamusAnimationFrame

  .return:
    RTS


;;; $D75B: Samus movement handler - crystal flash - finish ;;;
SamusMovementHandler_CrystalFlash_Finish:
    LDA.W SamusYPosition : CMP.W $0DF0 : BEQ +
    INC : STA.W SamusYPosition

+   LDA.W MovementType : AND.W #$00FF : BNE .return
    STZ.W SamusProjectile_PowerBombFlag
    LDA.W #$FFFF : STA.W SpecialPaletteTimer
    LDA.W #SamusMovementHandler_Normal : STA.W MovementHandler
    LDA.W PoseInputHandler : CMP.W #SamusPoseInputHandler_Demo : BEQ .return
    LDA.W #SamusPoseInputHandler_Normal : STA.W PoseInputHandler
    STZ.W SamusInvincibilityTimer : STZ.W SamusKnockbackTimer

  .return:
    RTS


;;; $D793: Projectile pre-instruction - plasma SBA ;;;
ProjectilePreInstruction_PlasmaSBA:
;; Parameters:
;;     X: Projectile index
    LDA.W SamusProjectile_Directions,X : AND.W #$00F0 : BEQ .notDeleted
    JSL Clear_Projectile
    RTS

  .notDeleted:
    LDA.W #$0002 : STA.W SamusProjectile_CooldownTimer
    STZ.W SamusProjectile_FlareCounter
    LDA.W SamusProjectile_Variables,X : TAY
    LDA.W SamusProjectile_XVelocities,X
    JSR Math_90CC39
    LDA.W SamusXPosition : CLC : ADC.B DP_Temp14 : STA.W SamusProjectile_XPositions,X
    LDA.W SamusYPosition : CLC : ADC.B DP_Temp16 : STA.W SamusProjectile_YPositions,X
    LDA.W SamusProjectile_Variables,X : CLC : ADC.W SBAAngleDelta : AND.W #$00FF : STA.W SamusProjectile_Variables,X
    TXY
    LDA.W SamusProjectile_YVelocities,X : ASL : TAX
    JMP.W (.pointers,X)

  .pointers:
    dw PlasmaSBA_Phase0_Expanding
    dw PlasmaSBA_Phase1_Contracting
    dw PlasmaSBA_Phase2_Dispersing


;;; $D7E1: Plasma SBA - phase 0: expanding ;;;
PlasmaSBA_Phase0_Expanding:
;; Parameters:
;;     X: Projectile index
    LDA.W SamusProjectile_XVelocities,Y : CLC : ADC.W #$0004 : AND.W #$00FF : STA.W SamusProjectile_XVelocities,Y
    CMP.W #$00C0 : BMI .return
    LDA.W #$0001 : STA.W SamusProjectile_YVelocities,Y

  .return:
    RTS


;;; $D7FA: Plasma SBA - phase 1: contracting ;;;
PlasmaSBA_Phase1_Contracting:
;; Parameters:
;;     X: Projectile index
    LDA.W SamusProjectile_XVelocities,Y : SEC : SBC.W #$0004 : AND.W #$00FF : STA.W SamusProjectile_XVelocities,Y
    CMP.W #$002D : BPL .return
    LDA.W #$0002 : STA.W SamusProjectile_YVelocities,Y

  .return:
    RTS


;;; $D813: Plasma SBA - phase 2: dispersing ;;;
PlasmaSBA_Phase2_Dispersing:
;; Parameters:
;;     X: Projectile index
    LDA.W SamusProjectile_XPositions,Y : SEC : SBC.W Layer1XPosition : CMP.W #$FFE0 : BMI .clear
    CMP.W #$0120 : BPL .clear
    LDA.W SamusProjectile_YPositions,Y : SEC : SBC.W Layer1YPosition : CMP.W #$0010 : BMI .clear
    CMP.W #$0100 : BPL .clear
    LDA.W SamusProjectile_XVelocities,Y : CLC : ADC.W #$0004 : AND.W #$00FF : STA.W SamusProjectile_XVelocities,Y
    RTS

  .clear:
    TYX
    JSL Clear_Projectile
    RTS


;;; $D849: Bomb spread ;;;
BombSpread:
    LDA.W SamusProjectile_PreInstructions+$A : CMP.W #ProjectilePreInstruction_BombSpread : BNE .notYetBombSpread
    CLC
    RTS

  .notYetBombSpread:
    LDX.W #$000A

  .loop:
    LDA.W #$8500 : STA.W SamusProjectile_Types,X
    STZ.W SamusProjectile_Directions,X
    LDA.W #ProjectilePreInstruction_BombSpread : STA.W SamusProjectile_PreInstructions,X
    JSL InitializeBomb
    LDA.W SamusXPosition : STA.W SamusProjectile_XPositions,X
    STZ.W SamusProjectile_XSubPositions,X
    LDA.W SamusYPosition : STA.W SamusProjectile_YPositions,X
    STZ.W SamusProjectile_YSubPositions,X
    TXA : SEC : SBC.W #$000A : TAY
    LDA.W BombSpreadData_XVelocities,Y : STA.W SamusProjectile_XVelocities,X
    LDA.W BombSpreadData_YSubSpeeds,Y : STA.W SamusProjectile_TrailTimers,X
    LDA.W SamusProjectile_BombSpreadChargeTimeoutCounter : ASL #2 : XBA
    AND.W #$0003 : CLC : ADC.W BombSpreadData_YSpeeds,Y
    EOR.W #$FFFF : INC : STA.W SamusProjectile_YVelocities,X : STA.W SamusProjectile_Phases,X
    LDA.W BombSpreadData_timers,Y : STA.W SamusProjectile_Variables,X
    INX #2 : CPX.W #$0014 : BMI .loop
    LDA.W #$0005 : STA.W SamusProjectile_BombCounter
    LDA.W SamusProjectile_Types+$A : XBA : AND.W #$000F : TAY
    LDA.W ProjectileCooldowns_NonBeamProjectiles,Y : AND.W #$00FF : STA.W SamusProjectile_CooldownTimer
    STZ.W SamusProjectile_BombSpreadChargeTimeoutCounter : STZ.W SamusProjectile_FlareCounter
    RTS


;;; $D8CF: Bomb spread data ;;;
BombSpreadData:
  .timers:
    db $78,$00,$6E,$00,$64,$00,$6E,$00,$78,$00
  .XVelocities:
; Unit 1/100h px/frame. MSb = direction, set = left, clear = right
    db $00,$81,$80,$80,$00,$00,$80,$00,$00,$01
  .YSpeeds:
    db $00,$00,$01,$00,$02,$00,$01,$00,$00,$00
  .YSubSpeeds:
    db $00,$00,$00,$00,$00,$80,$00,$00,$00,$00


;;; $D8F7: Projectile pre-instruction - spread bomb ;;;
ProjectilePreInstruction_BombSpread:
;; Parameters:
;;     X: Projectile index
    LDA.W SamusProjectile_Directions,X : AND.W #$00F0 : BEQ .notDeleted
    JSL Clear_Projectile
    RTS

  .notDeleted:
    JSR HandleBomb
    LDA.W SamusProjectile_Variables,X : BNE .timerNotExpired
    JMP .movementDone

  .timerNotExpired:
    LDA.W SamusProjectile_TrailTimers,X : CLC : ADC.W SamusYSubAcceleration : STA.W SamusProjectile_TrailTimers,X
    LDA.W SamusProjectile_YVelocities,X : ADC.W SamusYAcceleration : STA.W SamusProjectile_YVelocities,X
    LDA.W SamusProjectile_YSubPositions,X : CLC : ADC.W SamusProjectile_TrailTimers,X : STA.W SamusProjectile_YSubPositions,X
    LDA.W SamusProjectile_YPositions,X : ADC.W SamusProjectile_YVelocities,X : STA.W SamusProjectile_YPositions,X
    JSL BombSpreadBlockCollisionDetection
    BCC .falling
    LDX.W ProjectileIndex
    TXA : SEC : SBC.W #$000A : TAY
    LDA.W SamusProjectile_YSubPositions,X : SEC : SBC.W SamusProjectile_TrailTimers,X : STA.W SamusProjectile_YSubPositions,X
    LDA.W SamusProjectile_YPositions,X : SBC.W SamusProjectile_YVelocities,X : STA.W SamusProjectile_YPositions,X
    LDA.W SamusProjectile_YVelocities,X : BMI .negativeYVelocity
    LDA.W BombSpreadData_YSubSpeeds,Y : STA.W SamusProjectile_TrailTimers,X
    LDA.W SamusProjectile_Phases,X : STA.W SamusProjectile_YVelocities,X
    JMP .return

  .negativeYVelocity:
    STZ.W SamusProjectile_YVelocities,X : STZ.W SamusProjectile_YRadii,X
    JMP .return

  .falling:
    LDX.W ProjectileIndex
    LDA.W SamusProjectile_XVelocities,X : XBA : PHA
    AND.W #$FF00 : STA.B DP_Temp14
    PLA : AND.W #$00FF : STA.B DP_Temp12
    BIT.W #$0080 : BEQ .right
    AND.W #$FF7F : STA.B DP_Temp12
    BRA .left

  .right:
    LDA.W SamusProjectile_XSubPositions,X : CLC : ADC.B DP_Temp14 : STA.W SamusProjectile_XSubPositions,X
    LDA.W SamusProjectile_XPositions,X : ADC.B DP_Temp12 : STA.W SamusProjectile_XPositions,X
    BRA .movementDone

  .left:
    LDA.W SamusProjectile_XSubPositions,X : SEC : SBC.B DP_Temp14 : STA.W SamusProjectile_XSubPositions,X
    LDA.W SamusProjectile_XPositions,X : SBC.B DP_Temp12 : STA.W SamusProjectile_XPositions,X

  .movementDone:
    JSL BombSpreadBlockCollisionDetection
    BCC .return
    LDX.W ProjectileIndex
    LDA.W SamusProjectile_XVelocities,X : PHA
    XBA : PHA
    AND.W #$FF00 : STA.B DP_Temp14
    PLA : AND.W #$007F : STA.B DP_Temp12
    PLA : BIT.W #$8000 : BEQ .bounceLeft
    AND.W #$7FFF : STA.W SamusProjectile_XVelocities,X
    LDA.W SamusProjectile_XSubPositions,X : CLC : ADC.B DP_Temp14 : STA.W SamusProjectile_XSubPositions,X
    LDA.W SamusProjectile_XPositions,X : ADC.B DP_Temp12 : STA.W SamusProjectile_XPositions,X
    BRA .return

  .bounceLeft:
    ORA.W #$8000 : STA.W SamusProjectile_XVelocities,X
    LDA.W SamusProjectile_XSubPositions,X : SEC : SBC.B DP_Temp14 : STA.W SamusProjectile_XSubPositions,X
    LDA.W SamusProjectile_XPositions,X : SBC.B DP_Temp12 : STA.W SamusProjectile_XPositions,X

  .return:
    RTS


;;; $DA08: Projectile pre-instruction - wave SBA ;;;
ProjectilePreInstruction_WaveSBA:
;; Parameters:
;;     X: Projectile index
    LDA.W SamusProjectile_Directions,X : BIT.W #$00F0 : BNE .deleted
    DEC.W SamusProjectile_YVelocities,X : BEQ .deleted
    BPL .alive

  .deleted:
    LDA.W #$0029
    JSL QueueSound_Lib1_Max6
    JSL Clear_Projectile
    RTS

  .alive:
    LDA.W SamusProjectile_XVelocities,X : STA.B DP_Temp22
    LDA.W SamusProjectile_Variables,X : STA.B DP_Temp24
    DEC.W SamusProjectile_TrailTimers,X : BNE .checkCrossingRightToLeft
    LDA.W #$0004 : STA.W SamusProjectile_TrailTimers,X
    JSL Spawn_ProjectileTrail
    LDX.W ProjectileIndex

  .checkCrossingRightToLeft:
    LDA.W SamusXPosition : CMP.W SamusProjectile_XPositions,X : BMI .checkCrossingLeftToRight
    LDA.W SamusProjectile_XVelocities,X : CMP.W #$0800 : BPL +
    CLC : ADC.W #$0040 : STA.W SamusProjectile_XVelocities,X
    BRA +

  .checkCrossingLeftToRight:
    LDA.W SamusProjectile_XVelocities,X : CMP.W #$F801 : BMI +
    SEC : SBC.W #$0040 : STA.W SamusProjectile_XVelocities,X

+   LDA.W SamusProjectile_XVelocities,X : XBA : PHA
    AND.W #$FF00 : STA.B DP_Temp14
    PLA : AND.W #$00FF : BIT.W #$0080 : BEQ +
    ORA.W #$FF00

+   STA.B DP_Temp12
    LDA.W SamusProjectile_XSubPositions,X : CLC : ADC.B DP_Temp14 : STA.W SamusProjectile_XSubPositions,X
    LDA.W SamusProjectile_XPositions,X : ADC.B DP_Temp12 : STA.W SamusProjectile_XPositions,X
    LDA.W SamusYPosition : CMP.W SamusProjectile_YPositions,X : BMI .checkYVelocity
    LDA.W SamusProjectile_Variables,X : CMP.W #$0800 : BPL .notMaxYVelocity
    CLC : ADC.W #$0040 : STA.W SamusProjectile_Variables,X
    BRA .notMaxYVelocity

  .checkYVelocity:
    LDA.W SamusProjectile_Variables,X : CMP.W #$F801 : BMI .notMaxYVelocity
    SEC : SBC.W #$0040 : STA.W SamusProjectile_Variables,X

  .notMaxYVelocity:
    LDA.W SamusProjectile_Variables,X : XBA : PHA
    AND.W #$FF00 : STA.B DP_Temp14
    PLA : AND.W #$00FF : BIT.W #$0080 : BEQ +
    ORA.W #$FF00

+   STA.B DP_Temp12
    LDA.W SamusProjectile_YSubPositions,X : CLC : ADC.B DP_Temp14 : STA.W SamusProjectile_YSubPositions,X
    LDA.W SamusProjectile_YPositions,X : ADC.B DP_Temp12 : STA.W SamusProjectile_YPositions,X
    CPX.W #$0006 : BNE .return
    LDA.W SamusProjectile_XVelocities,X : BMI .negativeXVelocity
    LDA.B DP_Temp22 : BPL .return
    BRA .playSFX

  .negativeXVelocity:
    LDA.B DP_Temp22 : BMI .return

  .playSFX:
    LDA.W #$0028
    JSL QueueSound_Lib1_Max6

  .return:
    LDA.W #$0002 : STA.W SamusProjectile_CooldownTimer
    STZ.W SamusProjectile_FlareCounter
    RTS


;;; $DB06: Projectile pre-instruction - spazer SBA ;;;
ProjectilePreInstruction_SpazerSBA:
;; Parameters:
;;     X: Projectile index
    LDA.W SamusProjectile_Directions,X : AND.W #$00F0 : BEQ .notDeleted
    JSR.W (.clearing,X)
    RTS

  .notDeleted:
    DEC.W SamusProjectile_TrailTimers,X : BNE .timerNotExpired
    LDA.W #$0004 : STA.W SamusProjectile_TrailTimers,X
    JSL Spawn_ProjectileTrail
    LDX.W ProjectileIndex

  .timerNotExpired:
    LDA.W SamusProjectile_Variables,X : TAY
    LDA.W SamusProjectile_XVelocities,X
    JSR Math_90CC39
    LDA.W SamusXPosition : CLC : ADC.B DP_Temp14 : STA.W SamusProjectile_XPositions,X
    TXY
    LDA.W SamusProjectile_Phases,X : TAX
    JSR.W (.phases,X)
    LDA.W #$0002 : STA.W SamusProjectile_CooldownTimer
    STZ.W SamusProjectile_FlareCounter
    RTS

  .phases:
    dw SpazerSBA_Phase0_Circling
    dw SpazerSBA_Phase2_FlyingUpTowardsPoint
    dw SpazerSBA_Phase4_FlyingUpAwayFromPoint

  .clearing:
; Projectile clearing subroutines
    dw ClearSpazerSBAPair_0
    dw ClearSpazerSBAPair_2
    dw ClearSpazerSBAPair_4
    dw ClearSpazerSBAPair_6


;;; $DB57: Clear spazer SBA projectile pair - projectile index 0 ;;;
ClearSpazerSBAPair_0:
;; Parameters:
;;     X: Projectile index
    JSL Clear_Projectile
    LDX.W #$0004
    JSL Clear_Projectile
    LDX.W #$0000
    RTS


;;; $DB66: Clear spazer SBA projectile pair - projectile index 2 ;;;
ClearSpazerSBAPair_2:
;; Parameters:
;;     X: Projectile index
    JSL Clear_Projectile
    LDX.W #$0006
    JSL Clear_Projectile
    LDX.W #$0002
    RTS


;;; $DB75: Clear spazer SBA projectile pair - projectile index 4 ;;;
ClearSpazerSBAPair_4:
;; Parameters:
;;     X: Projectile index
    JSL Clear_Projectile
    LDX.W #$0000
    JSL Clear_Projectile
    LDX.W #$0004
    RTS


;;; $DB84: Clear spazer SBA projectile pair - projectile index 6 ;;;
ClearSpazerSBAPair_6:
;; Parameters:
;;     X: Projectile index
    JSL Clear_Projectile
    LDX.W #$0002
    JSL Clear_Projectile
    LDX.W #$0006
    RTS


;;; $DB93: Spazer SBA - phase 0: circling ;;;
SpazerSBA_Phase0_Circling:
;; Parameters:
;;     Y: Projectile index
    LDA.W SamusYPosition : CLC : ADC.B DP_Temp16 : STA.W SamusProjectile_YPositions,Y
    LDA.W SamusProjectile_Variables,Y : CLC : ADC.W SamusProjectile_YVelocities,Y : AND.W #$00FF : STA.W SamusProjectile_Variables,Y
    CMP.W #$0080 : BNE .return
    LDA.W #$00A0 : STA.W SamusProjectile_XVelocities,Y
    LDA.W .angleDeltas,Y : STA.W SamusProjectile_YVelocities,Y
    LDA.W #$0000 : STA.W SamusProjectile_Directions,Y
    LDA.W #$0002 : STA.W SamusProjectile_Phases,Y

  .return:
    RTS

  .angleDeltas:
    dw $0002,$FFFE,$0002,$FFFE


;;; $DBCF: Spazer SBA - phase 2: flying up towards point ;;;
SpazerSBA_Phase2_FlyingUpTowardsPoint:
;; Parameters:
;;     Y: Projectile index
    LDA.W SamusYPosition : SEC : SBC.W #$0072
    CLC : ADC.B DP_Temp16 : STA.W SamusProjectile_YPositions,Y
    SEC : SBC.W Layer1YPosition : CMP.W #$0010 : BPL +
    JSR FireEndOfSpazerSBA
    RTS

+   LDA.W SamusProjectile_Variables,Y : CLC : ADC.W SamusProjectile_YVelocities,Y : AND.W #$00FF : STA.W SamusProjectile_Variables,Y
    LDA.W SamusProjectile_XVelocities,Y : SEC : SBC.W #$0005 : STA.W SamusProjectile_XVelocities,Y : BNE .return
    LDA.W .angleDeltas,Y : STA.W SamusProjectile_YVelocities,Y
    LDA.W SamusProjectile_Variables,Y : CLC : ADC.W #$0080 : AND.W #$00FF : STA.W SamusProjectile_Variables,Y
    LDA.W #$0004 : STA.W SamusProjectile_Phases,Y
    CPY.W #$0000 : BNE .return
    LDA.W #$0026
    JSL QueueSound_Lib1_Max6

  .return:
    RTS

  .angleDeltas:
    dw $FFFE,$0002,$FFFE,$0002


;;; $DC30: Spazer SBA - phase 4: flying up away from point ;;;
SpazerSBA_Phase4_FlyingUpAwayFromPoint:
;; Parameters:
;;     Y: Projectile index
    LDA.W SamusYPosition : SEC : SBC.W #$0072
    CLC : ADC.B DP_Temp16 : STA.W SamusProjectile_YPositions,Y
    SEC : SBC.W Layer1YPosition : CMP.W #$0010 : BPL .onScreen

  .fireSBAEnd:
    JSR FireEndOfSpazerSBA
    RTS

  .onScreen:
    LDA.W SamusProjectile_Variables,Y : CLC : ADC.W SamusProjectile_YVelocities,Y : AND.W #$00FF : STA.W SamusProjectile_Variables,Y
    LDA.W SamusProjectile_XVelocities,Y : CLC : ADC.W #$0005 : STA.W SamusProjectile_XVelocities,Y
    CMP.W #$0060 : BPL .fireSBAEnd
    RTS


;;; $DC67: Fire end of spazer SBA ;;;
FireEndOfSpazerSBA:
;; Parameters:
;;     Y: Projectile index
    LDA.W SamusProjectile_XPositions,Y : CLC : ADC.W .data,Y : STA.W SamusProjectile_XPositions,Y
    LDA.W #$0005 : STA.W SamusProjectile_Directions,Y
    LDA.W #$0004 : STA.W SamusProjectile_TrailTimers,Y
    LDA.W #ProjectilePreInstruction_EndOfSpazerSBA : STA.W SamusProjectile_PreInstructions,Y
    CPY.W #$0004 : BPL .return
    LDA.W #$8024 : STA.W SamusProjectile_Types,Y
    TYX
    JSL Initialize_ShinesparkEcho_or_SpazerSBATrailProjectile

  .return:
    RTS

  .data:
    dw $0010,$0010,$FFF0,$FFF0


;;; $DC9C: Projectile pre-instruction - end of spazer SBA ;;;
ProjectilePreInstruction_EndOfSpazerSBA:
;; Parameters:
;;     Y: Projectile index
    LDA.W SamusProjectile_Directions,X : AND.W #$00F0 : BEQ .notDeleted
    JSL Clear_Projectile
    RTS

  .notDeleted:
    DEC.W SamusProjectile_TrailTimers,X : BNE .timerNotExpired
    LDA.W #$0004 : STA.W SamusProjectile_TrailTimers,X
    JSL Spawn_ProjectileTrail
    LDX.W ProjectileIndex

  .timerNotExpired:
    LDA.W SamusProjectile_YPositions,X : CLC : ADC.W #$0008 : STA.W SamusProjectile_YPositions,X
    SEC : SBC.W Layer1YPosition : CMP.W #$00F8 : BMI +
    JSL Clear_Projectile
    RTS

+   LDA.W #$0002 : STA.W SamusProjectile_CooldownTimer
    STZ.W SamusProjectile_FlareCounter
    RTS


;;; $DCDD: Handle HUD specific behaviour and projectiles ;;;
HandleHUDSpecificBehaviorAndProjectiles:
    PHP
    REP #$30
    LDA.W Pose : BEQ .facingForward
    CMP.W #$009B : BEQ .facingForward
    JSR Handle_Samus_Cooldown
    JSR HandleSwitchingHUDSelection
    LDA.W MovementType : AND.W #$00FF : ASL : TAX
    JSR.W (.pointers,X)
    LDA.W TimeIsFrozenFlag : BNE .return

  .facingForward:
    JSR Handle_Projectiles

  .return:
    PLP
    RTS

  .pointers:
    dw HUDSelectionHandler_Standard                                      ; 0: Standing
    dw HUDSelectionHandler_Standard                                      ; 1: Running
    dw HUDSelectionHandler_Standard                                      ; 2: Normal jumping
    dw HUDSelectionHandler_SpinWallJump_Knockback_Shinespark_CF_etc      ; 3: Spin jumping
    dw HUDSelectionHandler_MorphBall                                     ; 4: Morph ball - on ground
    dw HUDSelectionHandler_Standard                                      ; 5: Crouching
    dw HUDSelectionHandler_Standard                                      ; 6: Falling
    dw HUDSelectionHandler_MorphBall                                     ; 7: Unused. Glitchy morph ball / spin jump
    dw HUDSelectionHandler_MorphBall                                     ; 8: Morph ball - falling
    dw HUDSelectionHandler_MorphBall                                     ; 9: Unused
    dw HUDSelectionHandler_SpinWallJump_Knockback_Shinespark_CF_etc      ; Ah: Knockback / crystal flash ending
    dw HUDSelectionHandler_Grappling                                     ; Bh: Unused
    dw HUDSelectionHandler_Grappling                                     ; Ch: Unused
    dw HUDSelectionHandler_SpinWallJump_Knockback_Shinespark_CF_etc      ; Dh: Unused
    dw HUDSelectionHandler_TurningAround                                 ; Eh: Turning around - on ground
    dw HUDSelectionHandler_TransitionPoses                               ; Fh: Crouching/standing/morphing/unmorphing transition
    dw HUDSelectionHandler_Standard                                      ; 10h: Moonwalking
    dw HUDSelectionHandler_MorphBall                                     ; 11h: Spring ball - on ground
    dw HUDSelectionHandler_MorphBall                                     ; 12h: Spring ball - in air
    dw HUDSelectionHandler_MorphBall                                     ; 13h: Spring ball - falling
    dw HUDSelectionHandler_SpinWallJump_Knockback_Shinespark_CF_etc      ; 14h: Wall jumping
    dw HUDSelectionHandler_Standard                                      ; 15h: Ran into a wall
    dw HUDSelectionHandler_Grappling                                     ; 16h: Grappling
    dw HUDSelectionHandler_TurningAround                                 ; 17h: Turning around - jumping
    dw HUDSelectionHandler_TurningAround                                 ; 18h: Turning around - falling
    dw HUDSelectionHandler_SpinWallJump_Knockback_Shinespark_CF_etc      ; 19h: Damage boost
    dw HUDSelectionHandler_GrabbedByDraygon                              ; 1Ah: Grabbed by Draygon
    dw HUDSelectionHandler_SpinWallJump_Knockback_Shinespark_CF_etc      ; 1Bh: Shinespark / crystal flash / drained by metroid / damaged by MB's attacks


;;; $DD3D: Standard HUD selection handler ;;;
HUDSelectionHandler_Standard:
; Standing, running, normal jumping, crouching, falling, moon walking, ran into a wall
    PHP
    REP #$30
    LDA.W GrappleBeam_Function : CMP.W #GrappleBeamFunction_Inactive : BEQ .notFiringGrapple
    LDX.W #$0008
    BRA .execute

  .notFiringGrapple:
    LDA.W TimeIsFrozenFlag : BEQ .Xray
    LDX.W #$000A
    BRA .execute

  .Xray:
    LDA.W SelectedHUDItem : ASL : TAX

  .execute:
    JSR.W (.pointers,X)
    PLP
    RTS

  .pointers:
    dw HUDSelectionHandler_Nothing_PowerBombs     ; Nothing
    dw HUDSelectionHandler_Missiles_SuperMissiles ; Missiles
    dw HUDSelectionHandler_Missiles_SuperMissiles ; Super missiles
    dw HUDSelectionHandler_Nothing_PowerBombs     ; Power bombs
    dw HUDSelectionHandler_Grappling              ; Grapple
    dw HUDSelectionHandler_Xray                   ; X-ray
    dw HUDSelectionHandler_TurningAround          ; HUD selection handler for turning, looks like a mistake, would cause stack overflow if Samus shoots in the air, can't be indexed anyway


;;; $DD6F: HUD selection handler - grappling ;;;
HUDSelectionHandler_Grappling:
    JSL GrappleBeamHandler
    RTS


;;; $DD74: HUD selection handler - turning around ;;;
HUDSelectionHandler_TurningAround:
    LDA.W PoseTransitionShotDirection : BEQ .notShooting
    JSR HUDSelectionHandler_Standard
    RTS

  .notShooting:
    LDA.W GrappleBeam_Function : CMP.W #GrappleBeamFunction_Inactive : BEQ .return
    LDA.W #GrappleBeamFunction_HitNothing_Cancel : STA.W GrappleBeam_Function

  .return:
    RTS


;;; $DD8C: HUD selection handler - crouching/standing/morphing/unmorphing transition ;;;
HUDSelectionHandler_TransitionPoses:
    LDA.W Pose : CMP.W #$00F1 : BPL .standard
    CMP.W #$00DB : BPL .return
    SEC : SBC.W #$0035 : TAX
    LDA.W .flags,X : AND.W #$00FF : BNE HUDSelectionHandler_SpinWallJump_Knockback_Shinespark_CF_etc

  .standard:
    JSR HUDSelectionHandler_Standard

  .return:
    RTS

  .flags:
    db $00 ; Facing right - crouching transition
    db $00 ; Facing left-   crouching transition
    db $01 ; Facing right - morphing transition
    db $01 ; Facing left-   morphing transition
    db $01 ; Unused
    db $01 ; Unused
    db $00 ; Facing right - standing transition
    db $00 ; Facing left-   standing transition
    db $01 ; Facing right - unmorphing transition
    db $01 ; Facing left-   unmorphing transition
    db $01 ; Unused
    db $01 ; Unused


;;; $DDB6: HUD selection handler - spin jumping / wall jumping / knockback / damage boosting / shinespark / crystal flash / drained by metroid / damaged by MB's attacks ;;;
HUDSelectionHandler_SpinWallJump_Knockback_Shinespark_CF_etc:
    LDA.W GrappleBeam_Function : CMP.W #GrappleBeamFunction_Inactive : BEQ .return
    LDA.W #GrappleBeamFunction_HitNothing_Cancel : STA.W GrappleBeam_Function
    JSR HUDSelectionHandler_Standard

  .return:
    RTS


;;; $DDC8: HUD selection handler - x-ray ;;;
HUDSelectionHandler_Xray:
    LDA.B DP_Controller1Input : BIT.W DashBinding : BNE .Xray
    JSR HUDSelectionHandler_Nothing_PowerBombs
    RTS

  .Xray:
    JSL XrayHandler
    RTS


;;; $DDD8: HUD selection handler - grabbed by Draygon ;;;
HUDSelectionHandler_GrabbedByDraygon:
    LDA.W Pose : CMP.W #$00DF : BEQ .morphBall
    JSR HUDSelectionHandler_Standard
    BRA .return

  .morphBall:
    JSR HUDSelectionHandler_MorphBall

  .return:
    RTS


;;; $DDE9: Samus is hit interruption ;;;
SamusIsHit_Interruption:
; Called by "active" NewStateHandler (where active = normal or title/intro demo)
; Checks for knockback start, knockback finish, and bomb jump
; The pose written to SuperSpecialProspectivePose is ignored, it just needs to be a positive value (per SuperSpecialProspectivePoseChangeCommand = 1 branch of $91:EB88)
; This is why Samus can land immediately when knockback finishes and not need to fall for a frame first
    PHP
    REP #$30
    LDA.W SamusKnockbackTimer : BEQ .knockbackTimerZero
    LDA.W DebugInvincibility : CMP.W #$0007 : BMI .notInvincible
    STZ.W SamusInvincibilityTimer : STZ.W SamusKnockbackTimer
    BRA .returnUpper

  .notInvincible:
    LDA.W TimeIsFrozenFlag : BNE .returnUpper
    LDA.W KnockbackDirection : BNE .returnUpper
    LDA.W MovementType : AND.W #$00FF : ASL : TAX
    JSR.W (.pointers,X)
    BCC .returnUpper
    LDA.W #$0001 : STA.W SpecialProspectivePoseChangeCommand

  .returnUpper:
    PLP
    RTS

  .knockbackTimerZero:
    LDA.W KnockbackDirection : BEQ .noKnockback
    LDA.W MovementType : AND.W #$00FF : CMP.W #$000A : BEQ .knockbackMovement
    LDA.W SuperSpecialProspectivePoseChangeCommand : CMP.W #$0003 : BNE .superSpecialProspectivePose
    LDA.W #$0008 : STA.W SuperSpecialProspectivePoseChangeCommand
    PLP
    RTS

  .superSpecialProspectivePose:
    LDA.W Pose : STA.W SuperSpecialProspectivePose
    BRA .knockbackFinished

  .knockbackMovement:
    LDA.W SamusProjectile_FlareCounter : CMP.W #$0010 : BMI .lessThan10
    LDA.W #$0041
    JSL QueueSound_Lib1_Max6

  .lessThan10:
    LDA.W PoseXDirection : AND.W #$00FF : CMP.W #$0004 : BEQ .facingLeft
    LDA.W #$0029 : STA.W SuperSpecialProspectivePose
    BRA .knockbackFinished

  .facingLeft:
    LDA.W #$002A : STA.W SuperSpecialProspectivePose

  .knockbackFinished:
    LDA.W #$0001 : STA.W SuperSpecialProspectivePoseChangeCommand
    PLP
    RTS

  .noKnockback:
    LDA.W BombJumpDirection : BEQ .returnLower
    JSR SerupBombJump

  .returnLower:
    PLP
    RTS

  .pointers:
    dw KnockbackTransition_Normal                                        ; 0: Standing
    dw KnockbackTransition_Normal                                        ; 1: Running
    dw KnockbackTransition_Normal                                        ; 2: Normal jumping
    dw KnockbackTransition_Normal                                        ; 3: Spin jumping
    dw KnockbackTransition_Morphed                                       ; 4: Morph ball - on ground
    dw KnockbackTransition_Normal                                        ; 5: Crouching
    dw KnockbackTransition_Normal_Falling                                ; 6: Falling
    dw UNUSED_KnockbackTransition_Movement7_90DF1D                       ; 7: Unused
    dw KnockbackTransition_Morphed                                       ; 8: Morph ball - falling
    dw KnockbackTransition_Morphed                                       ; 9: Unused
    dw KnockbackTransition_Ignore                                        ; Ah: Knockback / crystal flash ending
    dw KnockbackTransition_Ignore_ClearDirection                         ; Bh: Unused
    dw KnockbackTransition_Ignore_ClearDirection                         ; Ch: Unused
    dw KnockbackTransition_Normal                                        ; Dh: Unused
    dw KnockbackTransition_Ignore_ClearDirection                         ; Eh: Turning around - on ground
    dw KnockbackTransition_Ignore_ClearDirection                         ; Fh: Crouching/standing/morphing/unmorphing transition
    dw KnockbackTransition_Normal                                        ; 10h: Moonwalking
    dw KnockbackTransition_Morphed                                       ; 11h: Spring ball - on ground
    dw KnockbackTransition_Morphed                                       ; 12h: Spring ball - in air
    dw KnockbackTransition_Morphed                                       ; 13h: Spring ball - falling
    dw KnockbackTransition_Normal                                        ; 14h: Wall jumping
    dw KnockbackTransition_Normal                                        ; 15h: Ran into a wall
    dw KnockbackTransition_Ignore                                        ; 16h: Grappling
    dw KnockbackTransition_Ignore_ClearDirection                         ; 17h: Turning around - jumping
    dw KnockbackTransition_Ignore_ClearDirection                         ; 18h: Turning around - falling
    dw KnockbackTransition_Ignore_ClearDirection                         ; 19h: Damage boost
    dw KnockbackTransition_Ignore_ClearDirection                         ; 1Ah: Grabbed by Draygon
    dw KnockbackTransition_SetSamusDrainedHurtAnimation_OrIgnore         ; 1Bh: Shinespark / crystal flash / drained by metroid / damaged by MB's attacks


;;; $DEBA: Knockback transition - set Samus drained hurt animation or ignore ;;;
KnockbackTransition_SetSamusDrainedHurtAnimation_OrIgnore:
;; Returns:
;;     Carry: Clear. Ignore knockback

; 1Bh: Shinespark / crystal flash / drained by metroid / damaged by MB's attacks

; This routine checks for pose E8h, but the facing right version doesn't support these non-idle animations
    LDA.W Pose : CMP.W #$00E8 : BEQ .drainedCrouchingFalling
    CMP.W #$00E9 : BEQ .drainedCrouchingFalling
    BRA .return

  .drainedCrouchingFalling:
    LDA.W #$0011 : STA.W SamusAnimationFrameTimer
    LDA.W #$001A : STA.W SamusAnimationFrame

  .return:
    STZ.W SpecialProspectivePoseChangeCommand : STZ.W KnockbackDirection
    CLC
    RTS


;;; $DEDD: Knockback transition - ignore ;;;
KnockbackTransition_Ignore:
;; Returns:
;;     Carry: Clear. Ignore knockback

; Ah: Knockback / crystal flash ending
; 16h: Grappling
    STZ.W SpecialProspectivePoseChangeCommand
    CLC
    RTS


;;; $DEE2: Knockback transition - ignore ;;;
KnockbackTransition_Ignore_ClearDirection:
;; Returns:
;;     Carry: Clear. Ignore knockback

; Bh: Unused
; Ch: Unused
; Eh: Turning around - on ground
; Fh: Crouching/standing/morphing/unmorphing transition
; 17h: Turning around - jumping
; 18h: Turning around - falling
; 19h: Damage boost
; 1Ah: Grabbed by Draygon
    STZ.W SpecialProspectivePoseChangeCommand : STZ.W KnockbackDirection
    CLC
    RTS


;;; $DEEA: Knockback transition - normal ;;;
KnockbackTransition_Normal_Falling:
;; Returns:
;;     Carry: Set to start knockback, clear to ignore

; 6: Falling
    LDA.W HackHandler : CMP.W #UNUSED_SamusTimerHackHandler_SpecialFalling_90E41B : BNE KnockbackTransition_Normal
    STZ.W SpecialProspectivePoseChangeCommand : STZ.W KnockbackDirection
    CLC
    RTS


;;; $DEFA: Knockback transition - normal ;;;
KnockbackTransition_Normal:
;; Returns:
;;     Carry: Set. Start knockback

; 0: Standing
; 1: Running
; 2: Normal jumping
; 3: Spin jumping
; 5: Crouching
; Dh: Unused
; 10h: Moonwalking
; 14h: Wall jumping
; 15h: Ran into a wall
    LDA.W PoseXDirection : AND.W #$00FF : CMP.W #$0004 : BEQ .facingLeft
    LDA.W #$0053 : STA.W SpecialProspectivePose
    BRA .return

  .facingLeft:
    LDA.W #$0054 : STA.W SpecialProspectivePose

  .return:
    SEC
    RTS


;;; $DF15: Knockback transition - morphed ;;;
KnockbackTransition_Morphed:
;; Returns:
;;     Carry: Set. Start knockback

; 4: Morph ball - on ground
; 8: Morph ball - falling
; 9: Unused
; 11h: Spring ball - on ground
; 12h: Spring ball - in air
; 13h: Spring ball - falling
    LDA.W Pose : STA.W SpecialProspectivePose
    SEC
    RTS


;;; $DF1D: Knockback transition - movement type 7 ;;;
UNUSED_KnockbackTransition_Movement7_90DF1D:
;; Returns:
;;     Carry: Set. Start knockback

; 7: Unused
    LDA.W PoseXDirection : AND.W #$00FF : CMP.W #$0004 : BEQ .facingLeft
    LDA.W #$0033 : STA.W SpecialProspectivePose
    BRA .return

  .facingLeft:
    LDA.W #$0034 : STA.W SpecialProspectivePose

  .return:
    SEC
    RTS


;;; $DF38: Samus movement handler - knockback ;;;
SamusMovementHandler_Knockback:
    LDA.W KnockbackDirection : ASL : TAX
    JSR.W (.pointers,X)
    STZ.W SamusSolidVerticalCollisionResult
    RTS

  .pointers:
    dw ZeroIndex_Crash                                                   ; 0: Crashes
    dw KnockbackMoement_Up                                               ; 1: Up left
    dw KnockbackMoement_Up                                               ; 2: Up right
    dw UNUSED_KnockbackMoement_StraightUp_90DF5D                         ; 3: Straight up (unused)
    dw KnockbackMoement_Down                                             ; 4: Down left
    dw KnockbackMoement_Down                                             ; 5: Down right


;;; $DF50: Crash ;;;
ZeroIndex_Crash:
    BRA ZeroIndex_Crash
    RTS ; >.<


;;; $DF53: Knockback movement - up ;;;
KnockbackMoement_Up:
    JSR MoveSamus_Horizontally_KnockbackBombJump
    JSR Samus_Y_Movement_WithSpeedCalculations
    JSR HandleKnockbackVerticalCollision
    RTS


;;; $DF5D: Knockback movement - straight up (unused) ;;;
UNUSED_KnockbackMoement_StraightUp_90DF5D:
    JSR Samus_Y_Movement_WithSpeedCalculations
    JSR HandleKnockbackVerticalCollision
    RTS


;;; $DF64: Knockback movement - down ;;;
KnockbackMoement_Down:
    JSR MoveSamus_Horizontally_KnockbackBombJump
    JSR Samus_Y_Movement_NoSpeedCalculations
    JSR HandleKnockbackVerticalCollision
    RTS


;;; $DF6E: Handle knockback vertical collision ;;;
HandleKnockbackVerticalCollision:
; Called by Ceres to end pushing
    LDA.W SamusSolidCollisionFlag : BEQ .return
    STZ.W SamusXAccelerationMode : STZ.W SamusXSpeedKilledDueToCollisionFlag
    STZ.W SamusIsFallingFlag
    STZ.W neverRead0B1A : STZ.W neverRead0B2A
    STZ.W SamusYSubSpeed : STZ.W SamusYSpeed
    STZ.W SamusYDirection : STZ.W neverRead0B38
    STZ.W SamusXBaseSpeed : STZ.W SamusXBaseSubSpeed
    JSL AlignSamusBottomPositionWithPreviousPose

  .return:
    RTS


;;; $DF99: Set up bomb jump ;;;
SerupBombJump:
    LDA.W BombJumpDirection : BIT.W #$FF00 : BNE .return
    LDA.W MovementType : AND.W #$00FF : ASL : TAX
    JSR.W (.pointers,X)
    BCC .return
    LDA.W #$0003 : STA.W SpecialProspectivePoseChangeCommand

  .return:
    RTS

  .pointers:
    dw SetupBombJump_Standing_Crouching                                  ; 0: Standing
    dw SetupBombJump_Run_Fall_Moonwalk_WallJump_RanIntoWall_Grapple      ; 1: Running
    dw SetupBombJump_Jumping_Turning_DamageBoost_TransitionPoses         ; 2: Normal jumping
    dw SetupBombJump_Jumping_Turning_DamageBoost_TransitionPoses         ; 3: Spin jumping
    dw SetupBombJump_Morphed_Knockback_CrystalFlashEnding                ; 4: Morph ball - on ground
    dw SetupBombJump_Standing_Crouching                                  ; 5: Crouching
    dw SetupBombJump_Run_Fall_Moonwalk_WallJump_RanIntoWall_Grapple      ; 6: Falling
    dw SetupBombJump_Morphed_Knockback_CrystalFlashEnding                ; 7: Unused
    dw SetupBombJump_Morphed_Knockback_CrystalFlashEnding                ; 8: Morph ball - falling
    dw SetupBombJump_Morphed_Knockback_CrystalFlashEnding                ; 9: Unused
    dw SetupBombJump_Morphed_Knockback_CrystalFlashEnding                ; Ah: Knockback / crystal flash ending
    dw SetupBombJump_Run_Fall_Moonwalk_WallJump_RanIntoWall_Grapple      ; Bh: Unused
    dw SetupBombJump_Run_Fall_Moonwalk_WallJump_RanIntoWall_Grapple      ; Ch: Unused
    dw SetupBombJump_Run_Fall_Moonwalk_WallJump_RanIntoWall_Grapple      ; Dh: Unused
    dw SetupBombJump_Jumping_Turning_DamageBoost_TransitionPoses         ; Eh: Turning around - on ground
    dw SetupBombJump_Jumping_Turning_DamageBoost_TransitionPoses         ; Fh: Crouching/standing/morphing/unmorphing transition
    dw SetupBombJump_Run_Fall_Moonwalk_WallJump_RanIntoWall_Grapple      ; 10h: Moonwalking
    dw SetupBombJump_Morphed_Knockback_CrystalFlashEnding                ; 11h: Spring ball - on ground
    dw SetupBombJump_Morphed_Knockback_CrystalFlashEnding                ; 12h: Spring ball - in air
    dw SetupBombJump_Morphed_Knockback_CrystalFlashEnding                ; 13h: Spring ball - falling
    dw SetupBombJump_Run_Fall_Moonwalk_WallJump_RanIntoWall_Grapple      ; 14h: Wall jumping
    dw SetupBombJump_Run_Fall_Moonwalk_WallJump_RanIntoWall_Grapple      ; 15h: Ran into a wall
    dw SetupBombJump_Run_Fall_Moonwalk_WallJump_RanIntoWall_Grapple      ; 16h: Grappling
    dw SetupBombJump_Jumping_Turning_DamageBoost_TransitionPoses         ; 17h: Turning around - jumping
    dw SetupBombJump_Jumping_Turning_DamageBoost_TransitionPoses         ; 18h: Turning around - falling
    dw SetupBombJump_Jumping_Turning_DamageBoost_TransitionPoses         ; 19h: Damage boost
    dw SetupBombJump_DraygonGrab_Shinespark_CF_Drained_DamagedMB         ; 1Ah: Grabbed by Draygon
    dw SetupBombJump_DraygonGrab_Shinespark_CF_Drained_DamagedMB         ; 1Bh: Shinespark / crystal flash / drained by metroid / damaged by MB's attacks


;;; $DFED: Set up bomb jump - standing / crouching ;;;
SetupBombJump_Standing_Crouching:
;; Returns:
;;     Carry: Set if bomb jump enabled, otherwise clear
    LDA.W TimeIsFrozenFlag : BEQ SetupBombJump_Run_Fall_Moonwalk_WallJump_RanIntoWall_Grapple
    STZ.W BombJumpDirection
    CLC
    RTS


;;; $DFF7: Set up bomb jump - running / falling / moonwalking / wall jumping / ran into a wall / grappling ;;;
SetupBombJump_Run_Fall_Moonwalk_WallJump_RanIntoWall_Grapple:
;; Returns:
;;     Carry: Set. Bomb jump enabled
    LDA.W PoseXDirection : AND.W #$00FF : CMP.W #$0004 : BEQ .facingLeft
    LDA.W #$0051 : STA.W SpecialProspectivePose
    BRA .returnCarrySet

  .facingLeft:
    LDA.W #$0052 : STA.W SpecialProspectivePose

  .returnCarrySet:
    SEC
    RTS


;;; $E012: Set up bomb jump - morphed / knockback / crystal flash ending ;;;
SetupBombJump_Morphed_Knockback_CrystalFlashEnding:
;; Returns:
;;     Carry: Set. Bomb jump enabled
    LDA.W Pose : STA.W SpecialProspectivePose
    SEC
    RTS


;;; $E01A: Set up bomb jump - jumping / turning around / damage boost / crouching/standing/morphing/unmorphing transition ;;;
SetupBombJump_Jumping_Turning_DamageBoost_TransitionPoses:
;; Returns:
;;     Carry: Clear. Bomb jump not enabled
    LDA.W #SamusPoseInputHandler_Normal : STA.W PoseInputHandler
; fallthrough to SetupBombJump_DraygonGrab_Shinespark_CF_Drained_DamagedMB


;;; $E020: Set up bomb jump - grabbed by Draygon / shinespark / crystal flash / drained by metroid / damaged by MB's attacks ;;;
SetupBombJump_DraygonGrab_Shinespark_CF_Drained_DamagedMB:
;; Returns:
;;     Carry: Clear. Bomb jump not enabled
    STZ.W BombJumpDirection
    CLC
    RTS


;;; $E025: Samus movement handler - bomb jump - start ;;;
SamusMovementHandler_BombJump_Start:
    JSR Make_Samus_BombJump
    LDA.W #SamusMovementHandler_BombJump_Main : STA.W MovementHandler
    STZ.W SamusSolidVerticalCollisionResult
    RTS


;;; $E032: Samus movement handler - bomb jump - main ;;;
SamusMovementHandler_BombJump_Main:
    LDA.W BombJumpDirection : BNE .directionAssigned
    JSR EndBombJump
    RTS

  .directionAssigned:
    AND.W #$00FF : ASL : TAX
    JSR.W (.pointers,X)
    RTS

  .pointers:
    dw ZeroIndex_Crash                                                   ; 0: Crashes
    dw SamusMovementHandler_BombJump_Main_Horizontal                     ; 1: Left
    dw SamusMovementHandler_BombJump_Main_Straight                       ; 2: Straight
    dw SamusMovementHandler_BombJump_Main_Horizontal                     ; 3: Right


;;; $E04C: Samus movement handler - bomb jump - main - horizontal ;;;
SamusMovementHandler_BombJump_Main_Horizontal:
    JSR MoveSamus_Horizontally_KnockbackBombJump
    JSR Handle_EndOfBombJump
    LDA.W SamusYDirection : CMP.W #$0002 : BEQ .end
    JSR Samus_Y_Movement_WithSpeedCalculations
    LDA.W SamusSolidCollisionFlag : BEQ .return

  .end:
    JSR EndBombJump

  .return:
    RTS


;;; $E066: Samus movement handler - bomb jump - main - straight ;;;
SamusMovementHandler_BombJump_Main_Straight:
    JSR Handle_EndOfBombJump
    LDA.W SamusYDirection : CMP.W #$0002 : BEQ .end
    JSR Samus_Y_Movement_WithSpeedCalculations
    LDA.W SamusSolidCollisionFlag : BEQ .return

  .end:
    JSR EndBombJump

  .return:
    RTS


;;; $E07D: End bomb jump ;;;
EndBombJump:
    LDA.W #SamusMovementHandler_Normal : STA.W MovementHandler
    LDA.W PoseInputHandler : CMP.W #SamusPoseInputHandler_Demo : BEQ .notDemo
    LDA.W #SamusPoseInputHandler_Normal : STA.W PoseInputHandler

  .notDemo:
    STZ.W BombJumpDirection
    RTS


;;; $E095: Draygon-escape button counter target ;;;
DraygonEscapeButtonCounterTarget:
    dw $003C


;;; $E097: Timer / Samus hack handler ;;;
SamusTimerHackHandler:
    JMP.W (HackHandler)


;;; $E09A: RTS ;;;
RTS_90E09A:
    RTS


;;; $E09B: Timer / Samus hack handler - handle letting Samus up from being drained ;;;
SamusTimerHackHandler_HandleLettingSamusUpFromBeingDrained:
    LDA.W Pose : CMP.W #$00E9 : BNE .return
    LDA.W SamusAnimationFrame : CMP.W #$0008 : BMI .return
    LDA.B DP_Controller1New : BIT.W #$0800 : BEQ .return
    LDA.W #$0001 : STA.W SamusAnimationFrameTimer
    LDA.W #$000D : STA.W SamusAnimationFrame
    LDA.W #RTS_90E90E : STA.W HackHandler

  .return:
    RTS


;;; $E0C5: Timer / Samus hack handler - handle letting Samus fail to stand up from being drained ;;;
SamusTimerHackHandler_LetSamusFailToStandUpFromBeingDrained:
    LDA.W SamusAnimationFrame : CMP.W #$0008 : BMI .return
    CMP.W #$000C : BPL .return
    LDA.B DP_Controller1New : BIT.W #$0800 : BEQ .return
    LDA.W #$0001 : STA.W SamusAnimationFrameTimer
    LDA.W #$0012 : STA.W SamusAnimationFrame

  .return:
    RTS


;;; $E0E6: Timer / Samus hack handler - handle timer ;;;
SamusTimerHackHandler_HandleTimer:
    JSL ProcessTimer
    BCC .timerNotExpired
    LDA.W #$0023 : STA.W GameState
    LDX.W #$01FE
    LDA.W #$7FFF

  .loop:
    STA.L TargetPalettes_BGP0,X
    DEX #2 : BPL .loop
    LDA.W #SamusTimerHackHandler_DrawTimer : STA.W HackHandler
    JSL Disable_PaletteFXObjects

  .timerNotExpired:
    LDA.W TimerStatus : BEQ .return
    JSL DrawTimer

  .return:
    RTS


;;; $E114: Timer / Samus hack handler - draw timer ;;;
SamusTimerHackHandler_DrawTimer:
    JSL DrawTimer
    RTS


;;; $E119: Set Samus to be pushed out of Ceres Ridley's way ;;;
SetSamusToBePushedOutOfCeresRidleysWay:
    PHP : PHB
    PHK : PLB
    REP #$30
    LDA.W #RTS_90E90E : STA.W MovementHandler
    LDA.W #SamusTimerHackHandler_PushSamusOutOfCeresRidleysWay : STA.W HackHandler
    PLB : PLP
    RTL


;;; $E12E: Timer / Samus hack handler - push Samus out of Ceres Ridley's way ;;;
SamusTimerHackHandler_PushSamusOutOfCeresRidleysWay:
    LDA.W PoseXDirection : AND.W #$00FF : CMP.W #$0004 : BEQ .facingLeft
    LDA.W #$0053 : STA.W Pose
    BRA +

  .facingLeft:
    LDA.W #$0054 : STA.W Pose

+   JSL InitializeSamusPose_1
    JSL Set_Samus_AnimationFrame_if_PoseChanged
    LDA.W PreviousPose : STA.W LastDifferentPose
    LDA.W PreviousPoseXDirection : STA.W LastDifferentPoseXDirection
    LDA.W Pose : STA.W PreviousPose
    LDA.W PoseXDirection : STA.W PreviousPoseXDirection
    LDA.W #$0015 : SEC : SBC.W SamusYRadius : STA.B DP_Temp12
    LDA.W SamusYPosition : SEC : SBC.B DP_Temp12 : STA.W SamusYPosition
    LDA.W SamusXPosition : SEC : SBC.W Layer1XPosition : CMP.W #$0080 : BMI .pushLeft
    LDA.W #$0002 : STA.W PushDirection
    BRA +

  .pushLeft:
    LDA.W #$0001 : STA.W PushDirection

+   LDA.W #$0005 : STA.W SamusYSpeed
    STZ.W SamusYSubSpeed : STZ.W BombJumpDirection
    LDA.W #SamusTimerHackHandler_PushingSmausOutOfCeresRidleysWay : STA.W HackHandler
    LDA.W #$FFFF : STA.W ProspectivePose
    STA.W SpecialProspectivePose : STA.W SuperSpecialProspectivePose
    STZ.W ProspectivePoseChangeCommand : STZ.W SpecialProspectivePoseChangeCommand : STZ.W SuperSpecialProspectivePoseChangeCommand
    JSL ProcessTimer
    LDA.W TimerStatus : BEQ .return
    JSL DrawTimer

  .return:
    RTS


;;; $E1C8: Timer / Samus hack handler - pushing Samus out of Ceres Ridley's way ;;;
SamusTimerHackHandler_PushingSmausOutOfCeresRidleysWay:
    LDA.W ProspectivePose : CMP.W #$004F : BEQ .damageBoost
    CMP.W #$0050 : BNE .notDamageBoost

  .damageBoost:
    LDA.W #$FFFF : STA.W ProspectivePose
    STZ.W ProspectivePoseChangeCommand

  .notDamageBoost:
    LDA.W PushDirection : ASL : TAX
    JSR.W (.pointers,X)
    STZ.W SamusSolidVerticalCollisionResult
    JSL ProcessTimer
    LDA.W TimerStatus : BEQ .return
    JSL DrawTimer

  .return:
    RTS

  .pointers:
    dw $0000
    dw PushingSamusOutOfCeresRidleysWay_Leftwards
    dw PushingSamusOutOfCeresRidleysWay_Rightwards


;;; $E1FD: Pushing Samus out of Ceres Ridley's way - leftwards ;;;
PushingSamusOutOfCeresRidleysWay_Leftwards:
    JSR MoveSamus_Horizontally_PushedByCeresRidley
    LDA.W SamusSolidCollisionFlag : BEQ .vertical
    LDA.W #SamusMovementHandler_Normal : STA.W MovementHandler
    LDA.W #SamusTimerHackHandler_HandleTimer : STA.W HackHandler
    STZ.W PushDirection
    JSR HandleKnockbackVerticalCollision
    RTS

  .vertical:
    JSR MoveSamus_Vertically_PushedByCeresRidley
    RTS


;;; $E21C: Pushing Samus out of Ceres Ridley's way - rightwards ;;;
PushingSamusOutOfCeresRidleysWay_Rightwards:
    JSR MoveSamus_Horizontally_PushedByCeresRidley
    LDA.W SamusSolidCollisionFlag : BEQ .vertical
    LDA.W #SamusMovementHandler_Normal : STA.W MovementHandler
    LDA.W #SamusTimerHackHandler_HandleTimer : STA.W HackHandler
    STZ.W PushDirection
    JSR HandleKnockbackVerticalCollision
    RTS

  .vertical:
    JSR MoveSamus_Vertically_PushedByCeresRidley
    RTS


;;; $E23B: Set Samus into the grabbed by Draygon pose ;;;
SetSamusIntoTheGrabbedByDraygonPose:
;; Parameters:
;;     A: Draygon's direction when grabbing Samus. 0 = left, 1 = right
    PHP : PHB
    PHK : PLB
    REP #$30
    BIT.W #$0001 : BEQ .facingLeft
    LDA.W #$00EC : STA.W Pose
    BRA .merge

  .facingLeft:
    LDA.W #$00BA : STA.W Pose

  .merge:
    JSL InitializeSamusPose_1
    JSL Set_Samus_AnimationFrame_if_PoseChanged
    LDA.W #SamusTimerHackHandler_GrabbedByDraygon : STA.W HackHandler
    LDA.W #RTS_90E90E : STA.W MovementHandler
    STZ.W DraygonEscapeButtonCounter : STZ.W DraygonEscapePreviousDpadInput
    STZ.W CrystalFlash_SamusYPosition
    LDA.W PreviousPose : STA.W LastDifferentPose
    LDA.W PreviousPoseXDirection : STA.W LastDifferentPoseXDirection
    LDA.W Pose : STA.W PreviousPose
    LDA.W PoseXDirection : STA.W PreviousPoseXDirection
    LDA.W #$FFFF : STA.W ProspectivePose
    STA.W SpecialProspectivePose : STA.W SuperSpecialProspectivePose
    STZ.W ProspectivePoseChangeCommand : STZ.W SpecialProspectivePoseChangeCommand : STZ.W SuperSpecialProspectivePoseChangeCommand
    PLB : PLP
    RTL


;;; $E2A1: Timer / Samus hack handler - grabbed by Draygon ;;;
SamusTimerHackHandler_GrabbedByDraygon:
; If grapple connected: prevent pose transition due to ProspectivePose (prevents Samus from aiming elsewhere).
; Handle Draygon-escape button counter and release Samus if reached 60.
    LDA.W GrappleBeam_Function : CMP.W #GrappleBeamFunction_Connected_LockedInPlace : BNE .escape
    LDA.W #$FFFF : STA.W ProspectivePose
    STZ.W ProspectivePoseChangeCommand
    BRA .escape

  .return:
    RTS

  .escape:
    LDA.B DP_Controller1New : AND.W #$0F00 : BEQ .return
    CMP.W DraygonEscapePreviousDpadInput : BEQ .return
    STA.W DraygonEscapePreviousDpadInput
    LDA.W DraygonEscapeButtonCounter : INC : STA.W DraygonEscapeButtonCounter
    CMP.W DraygonEscapeButtonCounterTarget : BMI .return
    JSR ReleaseSamusFromDraygon
    RTS


;;; $E2D4: Release Samus from Draygon (external) ;;;
ReleaseSamusFromDraygon_external:
    PHP : PHB
    PHK : PLB
    JSR ReleaseSamusFromDraygon
    PLB : PLP
    RTL


;;; $E2DE: Release Samus from Draygon ;;;
ReleaseSamusFromDraygon:
    LDA.W PoseXDirection : AND.W #$00FF : CMP.W #$0004 : BEQ .facingLeft
    LDA.W #$0001 : STA.W Pose
    BRA .merge

  .facingLeft:
    LDA.W #$0002 : STA.W Pose

  .merge:
    JSL InitializeSamusPose_1
    JSL Set_Samus_AnimationFrame_if_PoseChanged
    LDA.W #SamusMovementHandler_Normal : STA.W MovementHandler
    LDA.W #RTS_90E90E : STA.W HackHandler
    LDA.W PreviousPose : STA.W LastDifferentPose
    LDA.W PreviousPoseXDirection : STA.W LastDifferentPoseXDirection
    LDA.W Pose : STA.W PreviousPose
    LDA.W PoseXDirection : STA.W PreviousPoseXDirection
    STZ.W SamusXBaseSpeed : STZ.W SamusXBaseSubSpeed
    LDA.W #$FFFF : STA.W ProspectivePose
    STA.W SpecialProspectivePose : STA.W SuperSpecialProspectivePose
    STZ.W ProspectivePoseChangeCommand : STZ.W SpecialProspectivePoseChangeCommand : STZ.W SuperSpecialProspectivePoseChangeCommand
    STZ.W SamusYSpeed : STZ.W SamusYSubSpeed
    STZ.W SamusYDirection : STZ.W MorphBallBounceState
    STZ.W SamusXAccelerationMode
    LDA.W GrappleConnectedFlags : AND.W #$FFFD : ORA.W #$0002 : STA.W GrappleConnectedFlags
    RTS


if !FEATURE_KEEP_UNREFERENCED
;;; $E35A: Unused ;;;
UNUSED_90E35A:
    PHP : PHB
    PHK : PLB
    REP #$30
    LDA.W #$00C5 : STA.W SpecialProspectivePose
    STZ.W SpecialProspectivePoseChangeCommand
    LDA.W #RTS_90E90E : STA.W MovementHandler
    LDA.W #RTS_90E37E : STA.W HackHandler
    LDA.W #RTS_90EBF2 : STA.W DrawingHandler
    PLB : PLP
    RTL


;;; $E37E: RTS ;;;
RTS_90E37E:
    RTS


;;; $E37F: Unused. Push morph ball Samus out of Ceres Ridley's way ;;;
UNUSED_PushMorphBallSamusOutOfCeresRidleysWay_90E37F:
; This might well be a different kind of unused Samus movement, perhaps an unused Draygon action,
; the code is just quite similar to the Ceres Ridley stuff
    PHP : PHB
    PHK : PLB
    REP #$30
    LDA.W #$0003 : STA.W SamusYSpeed
    STZ.W SamusYSubSpeed
    LDA.W #$0001 : STA.W PushDirection
    LDA.W #UNUSED_SamusTimerHackHandler_PushMorphBallCeresRidley_90E3A3 : STA.W HackHandler
    LDA.W #SamusDrawingHandler_Default : STA.W DrawingHandler
    PLB : PLP
    RTL


;;; $E3A3: Unused. Timer / Samus hack handler - pushing morph ball Samus out of Ceres Ridley's way ;;;
UNUSED_SamusTimerHackHandler_PushMorphBallCeresRidley_90E3A3:
    JSR MoveSamus_Horizontally_PushedByCeresRidley
    LDA.W SamusSolidCollisionFlag : BNE .disable
    JSR MoveSamus_Vertically_PushedByCeresRidley
    LDA.W SamusSolidCollisionFlag : BEQ .return

  .disable:
    LDA.W #SamusMovementHandler_Normal : STA.W MovementHandler
    LDA.W #RTS_90E90E : STA.W HackHandler
    STZ.W PushDirection
    JSR HandleKnockbackVerticalCollision
    LDA.W #$0041 : STA.W SpecialProspectivePose
    STZ.W SpecialProspectivePoseChangeCommand

  .return:
    RTS


;;; $E3CF: Unused. Set Samus special falling ;;;
UNUSED_SetSamusSpecialFalling_90E3CF:
    PHP : PHB
    PHK : PLB
    REP #$30
    LDA.W PoseXDirection : AND.W #$00FF : CMP.W #$0004 : BEQ .facingLeft
    LDA.W #$0029 : STA.W SpecialProspectivePose
    BRA +

  .facingLeft:
    LDA.W #$002A : STA.W SpecialProspectivePose

+   STZ.W SpecialProspectivePoseChangeCommand
    LDA.W #RTS_90E90E : STA.W MovementHandler
    LDA.W #UNUSED_SamusTimerHackHandler_SpecialFalling_90E41B : STA.W HackHandler
    PLB : PLP
    RTL


;;; $E400: Unused. Clear Samus special falling ;;;
UNUSED_ClearSamusSpecialFalling_90E400:
    PHP : PHB
    PHK : PLB
    REP #$30
    STZ.W SamusYSubSpeed : STZ.W SamusYSpeed
    LDA.W #SamusMovementHandler_Normal : STA.W MovementHandler
    LDA.W #RTS_90E90E : STA.W HackHandler
    PLB : PLP
    RTL
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $E41B: Unused. Timer / Samus hack handler - special falling ;;;
UNUSED_SamusTimerHackHandler_SpecialFalling_90E41B:
; Looks like a cut-down version of SamusMovement_Falling
; In particular, this version doesn't do any horizontal movement
; Perhaps it was used for the Maridia elevatube at one point
    LDA.W SamusYSpeed : CMP.W #$0005 : BPL .GreaterThan4
    LDA.W SamusYSubSpeed : CLC : ADC.W SamusYSubAcceleration : STA.W SamusYSubSpeed
    LDA.W SamusYSpeed : ADC.W SamusYAcceleration : STA.W SamusYSpeed

  .GreaterThan4:
    LDA.W Pose : CMP.W #$0029 : BEQ .checkPose
    CMP.W #$002A : BEQ .checkPose
    CMP.W #$0067 : BEQ .checkPose
    CMP.W #$0068 : BEQ .checkPose
    BRA .return

  .checkPose:
    LDA.W SamusYSpeed : CMP.W #$0005 : BMI .return
    LDA.W #$0010 : STA.W SamusAnimationFrameTimer
    LDA.W #$0004 : STA.W SamusAnimationFrame

  .return:
    RTS


;;; $E464: Calculate Samus X displacement for moving left ;;;
CalculateSamusXDisplacement_ForMovingLeft:
;; Parameters:
;;     $12.$14: Samus X base speed
;; Returns:
;;     $12.$14: Samus X displacement
    PHP
    REP #$30
    JSR CalculateSamusXSpeed
    STZ.W CollisionMovementDirection
    LDA.B DP_Temp12 : EOR.W #$FFFF : STA.B DP_Temp12
    LDA.B DP_Temp14 : EOR.W #$FFFF : INC : STA.B DP_Temp14 : BNE +
    INC.B DP_Temp12

+   LDA.W ExtraSamusXSubDisplacement : CLC : ADC.B DP_Temp14 : STA.B DP_Temp14
    LDA.W ExtraSamusXDisplacement : ADC.B DP_Temp12 : STA.B DP_Temp12 : BMI .clamp
    CMP.W #$0010 : BPL .maxClamp
    PLP
    RTS

  .maxClamp:
    LDA.W #$000F : STA.B DP_Temp12
    PLP
    RTS

  .clamp:
    CMP.W #$FFF1 : BMI .minClamp
    PLP
    RTS

  .minClamp:
    LDA.W #$FFF1 : STA.B DP_Temp12
    PLP
    RTS


;;; $E4AD: Calculate Samus X displacement for moving right ;;;
CalculateSamusXDisplacement_ForMovingRight:
;; Parameters:
;;     $12.$14: Samus X base speed
;; Returns:
;;     $12.$14: Samus X displacement
    PHP
    REP #$30
    JSR CalculateSamusXSpeed
    LDA.W #$0001 : STA.W CollisionMovementDirection
    LDA.W ExtraSamusXSubDisplacement : CLC : ADC.B DP_Temp14 : STA.B DP_Temp14
    LDA.W ExtraSamusXDisplacement : ADC.B DP_Temp12 : STA.B DP_Temp12 : BMI .clamp
    CMP.W #$0010 : BPL .maxClamp
    PLP
    RTS

  .maxClamp:
    LDA.W #$000F : STA.B DP_Temp12
    PLP
    RTS

  .clamp:
    CMP.W #$FFF1 : BMI .minClamp
    PLP
    RTS

  .minClamp:
    LDA.W #$FFF1 : STA.B DP_Temp12
    PLP
    RTS


;;; $E4E6: Calculate Samus X speed ;;;
CalculateSamusXSpeed:
;; Parameters:
;;     $12.$14: Samus X base speed
;; Returns:
;;     $12.$14: Total Samus X speed

; TotalSamusXSpeed.TotalSamusXSubSpeed = $12.$14 = ([$12].[$14] + [Samus X extra run speed]) / 2^min(4, [Samus X speed divisor])

; It's clear that whoever wrote this code was unaware of LSR-ROR for multi-word bitshift
    LDA.W XSpeedDivisor : CMP.W #$0005 : BMI +
    LDA.W #$0004

+   ASL : TAX
    JMP.W (.pointers,X)

  .pointers:
    dw CalculateSamusXSpeed_Divisor0
    dw CalculateSamusXSpeed_Divisor1
    dw CalculateSamusXSpeed_Divisor2
    dw CalculateSamusXSpeed_Divisor3
    dw CalculateSamusXSpeed_Divisor4


;;; $E500: Calculate Samus X speed - [Samus X speed divisor] = 0 ;;;
CalculateSamusXSpeed_Divisor0:
;; Parameters:
;;     $12.$14: Samus X base speed
;; Returns:
;;     $12.$14: Total Samus X speed
    LDA.B DP_Temp14 : CLC : ADC.W SamusXExtraRunSubSpeed : STA.B DP_Temp14 : STA.W TotalSamusXSubSpeed
    LDA.B DP_Temp12 : ADC.W SamusXExtraRunSpeed : STA.B DP_Temp12 : STA.W TotalSamusXSpeed
    RTS


;;; $E516: Calculate Samus X speed - [Samus X speed divisor] = 1 ;;;
CalculateSamusXSpeed_Divisor1:
;; Parameters:
;;     $12.$14: Samus X base speed
;; Returns:
;;     $12.$14: Total Samus X speed

; $12.$14 = ([$12].[$14] + [Samus X extra run speed]) / 2
; Calculation here is only valid for [$12] + [Samus X extra run speed] < 100h
    LDA.B DP_Temp14 : CLC : ADC.W SamusXExtraRunSubSpeed : STA.B DP_Temp14
    LDA.B DP_Temp12 : ADC.W SamusXExtraRunSpeed
    XBA : LSR : XBA : PHA
    AND.W #$00FF : STA.B DP_Temp12 : STA.W TotalSamusXSpeed
    PLA : AND.W #$FF00 : STA.B DP_Temp16
    LDA.B DP_Temp14 : LSR : CLC : ADC.B DP_Temp16 : STA.B DP_Temp14 : STA.W TotalSamusXSubSpeed
    RTS


;;; $E541: Calculate Samus X speed - [Samus X speed divisor] = 2 ;;;
CalculateSamusXSpeed_Divisor2:
;; Parameters:
;;     $12.$14: Samus X base speed
;; Returns:
;;     $12.$14: Total Samus X speed

; $12.$14 = ([$12].[$14] + [Samus X extra run speed]) / 4
; Calculation here is only valid for [$12] + [Samus X extra run speed] < 100h
    LDA.B DP_Temp14 : CLC : ADC.W SamusXExtraRunSubSpeed : STA.B DP_Temp14
    LDA.B DP_Temp12 : ADC.W SamusXExtraRunSpeed
    XBA : LSR #2 : XBA : PHA
    AND.W #$00FF : STA.B DP_Temp12 : STA.W TotalSamusXSpeed
    PLA : AND.W #$FF00 : STA.B DP_Temp16
    LDA.B DP_Temp14 : LSR #2 : CLC : ADC.B DP_Temp16 : STA.B DP_Temp14 : STA.W TotalSamusXSubSpeed
    RTS


;;; $E56E: Calculate Samus X speed - [Samus X speed divisor] = 3 ;;;
CalculateSamusXSpeed_Divisor3:
;; Parameters:
;;     $12.$14: Samus X base speed
;; Returns:
;;     $12.$14: Total Samus X speed

; $12.$14 = ([$12].[$14] + [Samus X extra run speed]) / 8
; Calculation here is only valid for [$12] + [Samus X extra run speed] < 100h
    LDA.B DP_Temp14
    CLC
    ADC.W SamusXExtraRunSubSpeed
    STA.B DP_Temp14
    LDA.B DP_Temp12 : ADC.W SamusXExtraRunSpeed
    XBA : LSR #3 : XBA : PHA
    AND.W #$00FF : STA.B DP_Temp12 : STA.W TotalSamusXSpeed
    PLA : AND.W #$FF00 : STA.B DP_Temp16
    LDA.B DP_Temp14 : LSR #3 : CLC : ADC.B DP_Temp16 : STA.B DP_Temp14 : STA.W TotalSamusXSubSpeed
    RTS


;;; $E59D: Calculate Samus X speed - [Samus X speed divisor] = 4 ;;;
CalculateSamusXSpeed_Divisor4:
;; Parameters:
;;     $12.$14: Samus X base speed
;; Returns:
;;     $12.$14: Total Samus X speed

; $12.$14 = ([$12].[$14] + [Samus X extra run speed]) / 10h
; Calculation here is only valid for [$12] + [Samus X extra run speed] < 100h
    LDA.B DP_Temp14 : CLC : ADC.W SamusXExtraRunSubSpeed : STA.B DP_Temp14
    LDA.B DP_Temp12 : ADC.W SamusXExtraRunSpeed
    XBA : LSR #4 : XBA : PHA
    AND.W #$00FF : STA.B DP_Temp12 : STA.W TotalSamusXSpeed
    PLA : AND.W #$FF00 : STA.B DP_Temp16
    LDA.B DP_Temp14 : LSR #4 : CLC : ADC.B DP_Temp16 : STA.B DP_Temp14 : STA.W TotalSamusXSubSpeed
    RTS


;;; $E5CE: Kill Samus X speed if collision detected ;;;
Kill_SamusXSpeed_IfCollisionDetected:
    PHP
    REP #$30
    LDA.W SamusSolidCollisionFlag : BEQ .noCollision
    LDA.W CollisionMovementDirection : BEQ .left
    LDA.W #$0008 : STA.W SamusXSpeedKilledDueToCollisionFlag
    BRA .killSpeed

  .left:
    LDA.W #$0004 : STA.W SamusXSpeedKilledDueToCollisionFlag

  .killSpeed:
    JSL Cancel_SpeedBoosting
    STZ.W SamusXExtraRunSpeed : STZ.W SamusXExtraRunSubSpeed
    STZ.W SamusXBaseSpeed : STZ.W SamusXBaseSubSpeed
    STZ.W SamusXAccelerationMode
    BRA .return

  .noCollision:
    STZ.W SamusSolidVerticalCollisionResult : STZ.W SamusXSpeedKilledDueToCollisionFlag

  .return:
    PLP
    RTS


;;; $E606: Set Samus solid vertical collision result - upwards movement ;;;
SetSamusSolidVerticalCollisionResult_UpwardsMovement:
    PHP
    REP #$30
    LDA.W SamusSolidCollisionFlag : BEQ .noChange
    LDA.W #$0004 : STA.W SamusSolidVerticalCollisionResult
    BRA .return

  .noChange:
    STZ.W SamusSolidVerticalCollisionResult

  .return:
    PLP
    RTS


;;; $E61B: Set Samus solid vertical collision result - downwards movement ;;;
SetSamusSolidVerticalCollisionResult_DownwardsMovement:
    PHP
    REP #$30
    LDA.W SamusSolidCollisionFlag : BEQ .noCollision
    LDA.W #$0001 : STA.W SamusSolidVerticalCollisionResult
    SEP #$30
    LDA.W MovementType : TAX
    LDA.W .data1,X : STA.W SamusDownwardsMovementSolidCollisionResult
    REP #$30
    BRA .return

  .noCollision:
    LDA.W SamusSolidVerticalCollisionResult : AND.W #$00FF : CMP.W #$0005 : BEQ .return
    LDA.W #$0002 : STA.W SamusSolidVerticalCollisionResult
    SEP #$30
    LDA.W MovementType : TAX
    LDA.W .data0,X : STA.W SamusDownwardsMovementSolidCollisionResult
    REP #$30

  .return:
    PLP
    RTS

  .data0:
; Samus downwards movement solid collision results - falling
;     0: Airborne
;     1: Morph ball airborne
;     2: Unused (unused movement type 7)
;     3: Spring ball airborne
;     4: No change
    db $00 ; 0: Standing
    db $00 ; 1: Running
    db $04 ; 2: Normal jumping
    db $04 ; 3: Spin jumping
    db $01 ; 4: Morph ball - on ground
    db $00 ; 5: Crouching
    db $04 ; 6: Falling
    db $02 ; 7: Unused
    db $04 ; 8: Morph ball - falling
    db $04 ; 9: Unused
    db $00 ; Ah: Knockback
    db $00 ; Bh: Unused
    db $00 ; Ch: Unused
    db $00 ; Dh: Unused
    db $04 ; Eh: Turning around - on ground
    db $04 ; Fh: Crouching/standing/morphing/unmorphing transition
    db $00 ; 10h: Moonwalking
    db $03 ; 11h: Spring ball - on ground
    db $04 ; 12h: Spring ball - in air
    db $04 ; 13h: Spring ball - falling
    db $04 ; 14h: Wall jumping
    db $00 ; 15h: Ran into a wall
    db $04 ; 16h: Grappling
    db $04 ; 17h: Turning around - jumping
    db $04 ; 18h: Turning around - falling
    db $04 ; 19h: Damage boost
    db $04 ; 1Ah: Grabbed by Draygon
    db $04 ; 1Bh: Shinespark / crystal flash / drained by metroid / damaged by MB's attacks

  .data1:
; Samus downwards movement solid collision results - landed
;     0: Grounded
;     1: Morph ball grounded
;     2: Unused (unused movement type 9)
;     3: Spring ball grounded
;     4: No change
;     5: Unused
    db $04 ; 0: Standing
    db $04 ; 1: Running
    db $00 ; 2: Normal jumping
    db $00 ; 3: Spin jumping
    db $04 ; 4: Morph ball - on ground
    db $04 ; 5: Crouching
    db $00 ; 6: Falling
    db $04 ; 7: Unused
    db $01 ; 8: Morph ball - falling
    db $02 ; 9: Unused
    db $00 ; Ah: Knockback
    db $04 ; Bh: Unused
    db $04 ; Ch: Unused
    db $00 ; Dh: Unused
    db $04 ; Eh: Turning around - on ground
    db $04 ; Fh: Crouching/standing/morphing/unmorphing transition
    db $04 ; 10h: Moonwalking
    db $04 ; 11h: Spring ball - on ground
    db $03 ; 12h: Spring ball - in air
    db $03 ; 13h: Spring ball - falling
    db $00 ; 14h: Wall jumping
    db $04 ; 15h: Ran into a wall
    db $04 ; 16h: Grappling
    db $04 ; 17h: Turning around - jumping
    db $04 ; 18h: Turning around - falling
    db $00 ; 19h: Damage boost
    db $04 ; 1Ah: Grabbed by Draygon
    db $04 ; 1Bh: Shinespark / crystal flash / drained by metroid / damaged by MB's attacks


;;; $E692: Samus current state handler ;;;
SamusCurrentStateHandler:
    JMP.W (CurrentStateHandler)


;;; $E695: Samus current state handler - normal ;;;
SamusCurrentStateHandler_Normal:
    PHP : PHB
    PHK : PLB
    REP #$30
    LDA.W #$FFFF : STA.W ProspectivePose : STA.W SpecialProspectivePose : STA.W SuperSpecialProspectivePose
    STZ.W ProspectivePoseChangeCommand : STZ.W SpecialProspectivePoseChangeCommand : STZ.W SuperSpecialProspectivePoseChangeCommand
    JSR SetSamusRadius
    JSR SamusPoseInputHandler
    JSR Determine_SamusSuitPalette_Index
    JSR Determine_Samus_YAcceleration
    JSL SamusBlockInsideHandling
    JSR HandleHUDSpecificBehaviorAndProjectiles
    JSR ResetMovementAndPoseChangeVariables
    PLB : PLP
    RTL


;;; $E6C9: Samus current state handler - demo ;;;
SamusCurrentStateHandler_Demo:
    PHP : PHB
    PHK : PLB
    REP #$30
    LDA.W #$FFFF : STA.W ProspectivePose : STA.W SpecialProspectivePose : STA.W SuperSpecialProspectivePose
    STZ.W ProspectivePoseChangeCommand : STZ.W SpecialProspectivePoseChangeCommand : STZ.W SuperSpecialProspectivePoseChangeCommand
    LDA.B DP_Controller1Input : STA.W BackupController1InputDemo
    LDA.B DP_Controller1New : STA.W BackupController1NewDemo
    LDA.W PreviousController1InputDrawing : STA.W DemoInput_BackupController1Input
    LDA.W PreviousController1NewDrawing : STA.W DemoInput_BackupController1New
    JSR SetSamusRadius
    JSR Determine_SamusSuitPalette_Index
    JSR SamusPoseInputHandler
    JSR Determine_Samus_YAcceleration
    JSL SamusBlockInsideHandling
    JSR HandleHUDSpecificBehaviorAndProjectiles
    JSR ResetMovementAndPoseChangeVariables
    PLB : PLP
    RTL


;;; $E713: Samus current state handler - Samus is locked ;;;
SamusCurrentStateHandler_SamusIsLocked:
    PHP : PHB
    PHK : PLB
    REP #$30
    JSR Handle_Projectiles
    JSR ResetMovementAndPoseChangeVariables
    PLB : PLP
    RTL


;;; $E722: Samus new state handler ;;;
SamusNewStateHandler:
    JMP.W (NewStateHandler)


;;; $E725: Samus new state handler - normal ;;;
SamusNewStateHandler_Normal:
; The return at $E756 was added to make the demo recorder handling inaccessible.
; On the PAL version the return was removed, exposing the demo recorder in debug mode
    PHP : PHB
    PHK : PLB
    REP #$30
    JSR DebugCommandHandler
    STZ.W ContactDamageIndex
    JSR Execute_SamusMovementHandler
    JSL Update_Minimap
    JSR SamusTimerHackHandler
    JSR AnimateSamus
    JSR SamusIsHit_Interruption
    JSL SetProspectiveSamusPoseAccordingToSolidVerticalCollision_PSP
    JSL UpdateSamusPose
    JSL HandleSamusPalette
    JSR HandlePeriodicDamageToSamus
    JSR PauseCheck
    JSR LowEnergyCheck
    PLB : PLP
    RTL

    ; Handle demo recorder
    ; Remove the three instructions above and set DebugConst_DemoRecorder at $808002 to enable
    LDA.W SamusPlacementMode : BNE +
    LDA.W TimeIsFrozenFlag : BNE +
    JSR DemoRecorder_MoveSamusWithControlPad

+   LDA.L DebugConst_DemoRecorder : BEQ .debugMode
    JSL RecordDemoInputFrame
    JSL Pause_Terminate_Reset_DemoRecorder

  .debugMode:
    JSL Debug_HandleSelectL_B
    BIT.W Debug_Options : BPL .togglePlacementMode
    JSR DemoRecorder_DisplaySamusPositionAsAmmoIfMorphed

  .togglePlacementMode:
    JSR HandleSamusPlacementModeToggles
    PLB : PLP
    RTL


;;; $E786: Handle Samus placement mode toggles ;;;
HandleSamusPlacementModeToggles:
    PHP
    REP #$30
    LDA.B DP_Controller2New : BIT.W #$8000 : BEQ .pressedB
    LDA.W SamusPlacementMode : BEQ .enabled
    LDA.W #RTS_90E90E : STA.W DrawingHandler
    STZ.W SamusPlacementMode
    BRA .return

  .enabled:
    LDA.W #$0001 : STA.W SamusPlacementMode
    LDA.W #SamusDrawingHandler_Default : STA.W DrawingHandler
    BRA .return

  .pressedB:
    LDA.W SamusPlacementMode : BNE .return
    LDA.B DP_Controller2New : BIT.W #$0080 : BEQ .return
    JSL Disable_Enemy_Projectiles
    LDA.W #$0001 : STA.W TimeIsFrozenFlag
    LDA.W #RTL_90E8CD : STA.W CurrentStateHandler
    LDA.W #SamusNewStateHandler_Debug : STA.W NewStateHandler

  .return:
    PLP
    RTS


;;; $E7D2: Samus new state handler - debug ;;;
SamusNewStateHandler_Debug:
    PHP : PHB
    PHK : PLB
    REP #$30
    LDA.B DP_Controller2New : BIT.W #$0080 : BEQ .return
    LDA.W #SamusCurrentStateHandler_Normal : STA.W CurrentStateHandler
    LDA.W #SamusNewStateHandler_Normal : STA.W NewStateHandler
    JSL Enable_Enemy_Projectiles
    STZ.W TimeIsFrozenFlag

  .return:
    PLB : PLP
    RTL


;;; $E7F5: Samus new state handler - title demo ;;;
SamusNewStateHandler_TitleDemo:
    PHP : PHB
    PHK : PLB
    REP #$30
    STZ.W ContactDamageIndex
    JSR Execute_SamusMovementHandler
    JSL Update_Minimap
    JSR AnimateSamus
    JSR SamusIsHit_Interruption
    JSL SetProspectiveSamusPoseAccordingToSolidVerticalCollision_PSP
    JSL UpdateSamusPose
    JSL HandleSamusPalette
    JSR DebugCommandHandler
    LDA.W BackupController1InputDemo : STA.B DP_Controller1Input
    LDA.W BackupController1NewDemo : STA.B DP_Controller1New
    LDA.W DemoInput_BackupController1Input : STA.W PreviousController1InputDrawing
    LDA.W DemoInput_BackupController1New : STA.W PreviousController1NewDrawing
    PLB : PLP
    RTL


;;; $E833: Samus new state handler - intro demo ;;;
SamusNewStateHandler_IntroDemo:
    PHP : PHB
    PHK : PLB
    REP #$30
    STZ.W ContactDamageIndex
    JSR Execute_SamusMovementHandler
    JSR AnimateSamus
    JSR SamusIsHit_Interruption
    JSL SetProspectiveSamusPoseAccordingToSolidVerticalCollision_PSP
    JSL UpdateSamusPose
    JSL HandleSamusPalette
    LDA.W BackupController1InputDemo : STA.B DP_Controller1Input
    LDA.W BackupController1NewDemo : STA.B DP_Controller1New
    LDA.W DemoInput_BackupController1Input : STA.W PreviousController1InputDrawing
    LDA.W DemoInput_BackupController1New : STA.W PreviousController1NewDrawing
    PLB : PLP
    RTL


;;; $E86A: Samus new state handler - Samus appearance ;;;
SamusNewStateHandler_SamusAppearance:
; The code here for disabling debug invincibility has no effect, as debug invincibility is disabled by Samus initialisation ($91:E156)
    PHP : PHB
    PHK : PLB
    REP #$30
    JSR SetSamusRadius
    JSL Update_Minimap
    JSR AnimateSamus
    STZ.W ElevatorStatus
    LDA.W SamusYPosition : STA.W SamusPreviousYPosition
    JSL PlaySamusFanfare
    BCC .return
    LDA.W DebugInvincibility : CMP.W #$0007 : BMI .disableInvincibility
    LDA.B DP_Controller2Input : BIT.W #$8000 : BNE .keepInvincibility

  .disableInvincibility:
    STZ.W DebugInvincibility

  .keepInvincibility:
    LDA.W #SamusCurrentStateHandler_Normal : STA.W CurrentStateHandler
    LDA.W #SamusNewStateHandler_Normal : STA.W NewStateHandler

  .return:
    PLB : PLP
    RTL


;;; $E8AA: Samus new state handler - Ceres ;;;
SamusNewStateHandler_Ceres:
    PHP : PHB
    PHK : PLB
    REP #$30
    JSL SamusNewStateHandler_Normal
    LDA.W HackHandler : CMP.W #SamusTimerHackHandler_DrawTimer : BNE .return
    LDA.W GameState : CMP.W #$0023 : BEQ .return
    LDA.W #$0023 : STA.W GameState

  .return:
    PLB : PLP
    RTL


;;; $E8CD: RTL ;;;
RTL_90E8CD:
    PHP : PHB
    PHK : PLB
    REP #$30
    PLB : PLP
    RTL


;;; $E8D6: RTL. Samus new state handler - Samus is locked into station ;;;
RTL_90E8D6:
    JMP RTL_90E8CD


;;; $E8D9: RTL. Samus new state handler - Samus is being drained ;;;
RTL_90E8D9:
    JMP RTL_90E8CD


;;; $E8DC: Samus new state handler - Samus is locked ;;;
SamusNewStateHandler_SamusIsLocked:
    PHP : PHB
    PHK : PLB
    REP #$30
    STZ.W ContactDamageIndex
    JSL Update_Minimap
    PLB : PLP
    RTL


;;; $E8EC: Samus new state handler - riding elevator ;;;
SamusNewStateHandler_RidingElevator:
    PHP : PHB
    PHK : PLB
    REP #$30
    STZ.W ContactDamageIndex
    JSR Execute_SamusMovementHandler
    JSL Update_Minimap
    JSR AnimateSamus
    PLB : PLP
    RTL


;;; $E902: Samus new state handler - entering/exiting gunship ;;;
SamusNewStateHandler_EnteringExitingGunship:
    PHP : PHB
    PHK : PLB
    REP #$30
    JSR LowEnergyCheck
    PLB : PLP
    RTL


;;; $E90E: RTS ;;;
RTS_90E90E:
    RTS


;;; $E90F: Samus pose input handler ;;;
SamusPoseInputHandler:
    JMP.W (PoseInputHandler)


;;; $E912: RTS ;;;
RTS_90E912:
    RTS


;;; $E913: Samus pose input handler - normal ;;;
SamusPoseInputHandler_Normal:
    JSL NormalSamusPoseInputHandler
    RTS


;;; $E918: Samus pose input handler - x-ray ;;;
SamusPoseInputHandler_Xray:
    JSL XraySamusPoseInputHandler
    RTS


;;; $E91D: Samus pose input handler - demo ;;;
SamusPoseInputHandler_Demo:
    JSL DemoInputObjectHandler
    JSL NormalSamusPoseInputHandler
    RTS


;;; $E926: Samus pose input handler - auto-jump hack ;;;
SamusPoseInputHandler_AutoJumpHack:
    LDA.B DP_Controller1New : PHA
    LDA.W AutoJumpTimer : BEQ .not1Through9
    CMP.W #$0009 : BPL .not1Through9
    LDA.B DP_Controller1New : ORA.W JumpBinding : STA.B DP_Controller1New
    STZ.W AutoJumpTimer

  .not1Through9:
    JSL NormalSamusPoseInputHandler
    PLA : STA.B DP_Controller1New
    LDA.W #SamusPoseInputHandler_Normal : STA.W PoseInputHandler
    RTS


;;; $E94B: Execute Samus movement handler ;;;
Execute_SamusMovementHandler:
    JMP.W (MovementHandler)


;;; $E94E: RTS ;;;
RTS_90E94E:
    RTS


;;; $E94F: Samus movement handler - x-ray ;;;
SamusMovementHandler_Xray:
    LDA.W MovementType : AND.W #$00FF : CMP.W #$000E : BNE .turning
    RTS

  .turning:
    LDA.W #$000F : STA.W SamusAnimationFrameTimer
    LDA.W PoseXDirection : AND.W #$00FF : CMP.W #$0004 : BEQ .facingLeft
    LDA.W Xray_Angle : CMP.W #$0019 : BPL +
    LDA.W #$0000
    BRA .storeAnimFrame

+   CMP.W #$0032 : BPL +
    LDA.W #$0001
    BRA .storeAnimFrame

+   CMP.W #$004B : BPL +
    LDA.W #$0002
    BRA .storeAnimFrame

+   CMP.W #$0064 : BPL +
    LDA.W #$0003
    BRA .storeAnimFrame

+   LDA.W #$0004
    BRA .storeAnimFrame

  .facingLeft:
    LDA.W Xray_Angle : CMP.W #$0099 : BPL +
    LDA.W #$0004
    BRA .storeAnimFrame

+   CMP.W #$00B2 : BPL +
    LDA.W #$0003
    BRA .storeAnimFrame

+   CMP.W #$00CB : BPL +
    LDA.W #$0002
    BRA .storeAnimFrame

+   CMP.W #$00E4 : BPL .lookingUp
    LDA.W #$0001
    BRA .storeAnimFrame

  .lookingUp:
    LDA.W #$0000

  .storeAnimFrame:
    STA.W SamusAnimationFrame
    RTS


;;; $E9CE: Handle periodic damage to Samus ;;;
HandlePeriodicDamageToSamus:
; (Lava, acid, heat, not Metroids)
    PHP
    REP #$30
    LDA.W TimeIsFrozenFlag : BEQ .timeIsNotFrozen
    JMP .timeIsFrozen

  .timeIsNotFrozen:
    LDA.W EquippedItems : BIT.W #$0020 : BNE .gravitySuit
    BIT.W #$0001 : BEQ .crashIfNegative
    LDA.W PeriodicSubDamage+1 : LSR : PHA
    XBA : AND.W #$FF00 : STA.W PeriodicSubDamage
    PLA : XBA : AND.W #$00FF : STA.W PeriodicDamage
    BRA .crashIfNegative

  .gravitySuit:
    LDA.W PeriodicSubDamage+1 : LSR #2 : PHA
    XBA : AND.W #$FF00 : STA.W PeriodicSubDamage
    PLA : XBA : AND.W #$00FF : STA.W PeriodicDamage

  .crashIfNegative:
    LDA.W PeriodicDamage : BPL .dontCrash
    JML Crash_Handler

  .dontCrash:
    LDA.W SubUnitEnergy : SEC : SBC.W PeriodicSubDamage : STA.W SubUnitEnergy
    LDA.W Energy : SBC.W PeriodicDamage : STA.W Energy : BPL .timeIsFrozen
    STZ.W SubUnitEnergy : STZ.W Energy
    STZ.W PeriodicSubDamage : STZ.W PeriodicDamage
    PLP
    RTS

  .timeIsFrozen:
    STZ.W PeriodicSubDamage : STZ.W PeriodicDamage
    PLP
    RTS


;;; $EA45: Pause check ;;;
PauseCheck:
    PHP
    REP #$30
    LDA.W SamusProjectile_PowerBombFlag : BNE .return
    LDA.W TimeIsFrozenFlag : BNE .return
    LDA.W DoorTransitionFlagEnemiesPause : BNE .return
    LDA.W AreaIndex : CMP.W #$0006 : BEQ .return
    LDA.W GameState : CMP.W #$0008 : BNE .return
    LDA.B DP_Controller1New : BIT.W #$1000 : BEQ .return
    LDA.W #$0001 : STA.W ScreenFadeDelay : STA.W ScreenFadeCounter
    LDA.W #$000C : STA.W GameState

  .return:
    PLP
    RTS


;;; $EA7F: Low health check ;;;
LowEnergyCheck:
; Queuing a sound effect can fail due to a power bomb explosion being active,
; and this routine sets the CriticalEnergyWarning flag regardless,
; which causes a bug where the beep doesn't turn on or off correctly even though this function is called every frame
    LDA.W Energy : CMP.W #$001F : BMI .lowEnergy
    LDA.W CriticalEnergyWarning : BEQ .return
    STZ.W CriticalEnergyWarning
    LDA.W #$0001
    JSL QueueSound_Lib3_Max6
    BRA .return

  .lowEnergy:
    LDA.W CriticalEnergyWarning : BNE .return
    LDA.W #$0002
    JSL QueueSound_Lib3_Max6
    LDA.W #$0001 : STA.W CriticalEnergyWarning

  .return:
    RTS


;;; $EAAB: Low health check (external) ;;;
Low_Health_Check_external:
    PHP
    REP #$30
    JSR LowEnergyCheck
    PLP
    RTL


;;; $EAB3: Handle auto-jump timer and Samus hurt flash counter, update previous input and Samus health ;;;
HandleSamus_AutoJumpTimer_HurtFlashCounter_PrevInputEnergy:
    PHP
    REP #$30
    LDA.B DP_Controller1Input : BIT.W JumpBinding : BEQ .noJump
    LDA.W PreviousController1InputDrawing : BIT.W JumpBinding : BEQ .noJump
    INC.W AutoJumpTimer
    BRA .previousInput

  .noJump:
    STZ.W AutoJumpTimer

  .previousInput:
    LDA.B DP_Controller1Input : STA.W PreviousController1InputDrawing
    LDA.B DP_Controller1New : STA.W PreviousController1NewDrawing
    LDA.W Energy : CMP.W PreviousEnergyHurtCheck : BPL .setPreviousEnergy
    LDA.W HurtFlashCounter : BNE .debugInvincibility
    LDA.W #$0001 : STA.W HurtFlashCounter

  .debugInvincibility:
    LDA.W DebugInvincibility : CMP.W #$0007 : BMI .setPreviousEnergy
    LDA.W PreviousEnergyHurtCheck : STA.W Energy
    BRA .return

  .setPreviousEnergy:
    LDA.W Energy : STA.W PreviousEnergyHurtCheck

  .return:
    PLP
    RTS


;;; $EB02: Reset movement and pose change variables ;;;
ResetMovementAndPoseChangeVariables:
    PHP
    REP #$30
    STZ.W ProjSpeed_DistanceSamusMovedLeft : STZ.W ProjSpeed_SubDistanceSamusMovedLeft
    STZ.W ProjSpeed_DistanceSamusMovedRight : STZ.W ProjSpeed_SubDistanceSamusMovedRight
    STZ.W ProjSpeed_DistanceSamusMovedUp : STZ.W ProjSpeed_SubDistanceSamusMovedUp
    STZ.W ProjSpeed_DistanceSamusMovedDown
    STZ.W neverRead0DB8
    STZ.W NewPoseSamusAnimationFrame : STZ.W PoseTransitionShotDirection
    LDA.W neverRead0DFA : XBA : AND.W #$FF00 : STA.W neverRead0DFA
    LDA.W PoseXDirection : STA.W neverRead0A10
    PLP
    RTS


;;; $EB35: Draw Samus and projectiles ;;;
DrawSamusAndProjectiles:
    PHP : PHB
    PHK : PLB
    REP #$30
    JSR DrawSamusSprites
    JSL DrawProjectiles
    JSR HandleSamus_AutoJumpTimer_HurtFlashCounter_PrevInputEnergy
    JSR Handle_UnspinSFX_CancellingEchoSound_SettingTimeUpGameState
    PLB : PLP
    RTL


;;; $EB4B: Draw Samus sprites ;;;
DrawSamusSprites:
    JSR HandleArmCannonOpenState
    JMP.W (DrawingHandler)


;;; $EB51: RTS ;;;
RTS_90EB51:
    RTS


;;; $EB52: Samus drawing handler - default ;;;
SamusDrawingHandler_Default:
    JSR HandleChargingBeamGraphicsAudio
; fallthrough to DrawSamus_NoCharge_NoGrapple


;;; $EB55: Draw Samus - no charge / grapple beam ;;;
DrawSamus_NoCharge_NoGrapple:
    LDA.W ArmCannonDrawingMode : AND.W #$000F : BEQ .noArmCannon
    CMP.W #$0002 : BNE .facingForward
    JSR Handle_AtmosphericEffects
    JSR Draw_Samus
    JSR DrawArmCannon
    JSR DrawSamusEchoes
    RTS

  .facingForward:
    JSR Handle_AtmosphericEffects
    JSR DrawArmCannon
    JSR Draw_Samus
    JSR DrawSamusEchoes
    RTS

  .noArmCannon:
    JSR Handle_AtmosphericEffects
    JSR Draw_Samus
    JSR DrawSamusEchoes
    RTS


;;; $EB86: Samus drawing handler - firing grapple beam ;;;
SamusDrawingHandler_FiringGrappleBeam:
    LDA.W GrappleBeam_Function : CMP.W #GrappleBeamFunction_HitNothing_Cancel : BPL DrawSamus_NoCharge_NoGrapple
    LDA.W GrappleBeam_Function : CMP.W #GrappleBeamFunction_Firing : BEQ .firing
    CMP.W #UNUSED_GrappleBeamFunction_Unfiring_9BC759 : BNE .startPositionCalculated

  .firing:
    JSL UpdateGrappleBeamStartPositionDuringGrappleFire

  .startPositionCalculated:
    JSL HandleGrappleBeamFlare
    LDA.W ArmCannonDrawingMode : AND.W #$000F : BEQ .noArmCannon
    CMP.W #$0002 : BNE .notFacingForward
    JSR Handle_AtmosphericEffects
    JSR Draw_Samus
    JSR DrawArmCannon
    JSL UpdateGrappleBeamTiles_IncrementFlareCounter
    LDA.W GrappleBeam_Length : BEQ .return
    JSL DrawGrappleBeam
    RTS

  .notFacingForward:
    JSR Handle_AtmosphericEffects
    JSR DrawArmCannon
    JSR Draw_Samus
    JSL UpdateGrappleBeamTiles_IncrementFlareCounter
    LDA.W GrappleBeam_Length : BEQ .return
    JSL DrawGrappleBeam
    RTS

  .noArmCannon:
    JSR Handle_AtmosphericEffects
    JSR Draw_Samus
    JSL UpdateGrappleBeamTiles_IncrementFlareCounter
    LDA.W GrappleBeam_Length : BEQ .return
    JSL DrawGrappleBeam

  .return:
    RTS


;;; $EBF2: RTS. Samus display handler ;;;
RTS_90EBF2:
    RTS


;;; $EBF3: Samus display handler - shinespark crash echo circle ;;;
SamusDisplayHandler_ShinesparkCrashCircle:
    JSR Draw_Samus
    LDX.W #$0002

  .loop:
    PHX
    JSR DrawShinesparkCrashEchoCircle
    PLX
    DEX #2 : BPL .loop
    RTS


if !FEATURE_KEEP_UNREFERENCED
;;; $EC03: Unused ;;;
UNUSED_SamusDisplayHandler_DrawSamusEchoes_90EC03:
; Looks like leftover code for a previous implementation of either the shinespark crash or some such
; Note how this routine is similar to $EBF3, but also note that $87BD does the loop for both echoes itself,
; so presumably $87BD used to be like $88BA and then things got refactored
    JSR SamusDrawingHandler_Default
    LDX.W #$0002

  .loop:
    PHX
    JSR DrawSamusEchoes
    PLX
    DEX #2 : BPL .loop
    RTS


;;; $EC13: RTS ;;;
RTS_90EC13:
    RTS
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $EC14: Samus display handler - using elevator ;;;
SamusDisplayHandler_UsingElevator:
    LDA.W NMI_FrameCounter : BIT.W #$0001 : BEQ SamusDisplayHandler_InanimateSamus
    RTS


;;; $EC1D: Samus display handler - inanimate Samus ;;;
SamusDisplayHandler_InanimateSamus:
    JSL Draw_Inanimate_Samus
    RTS


;;; $EC22: Set Samus radius ;;;
SetSamusRadius:
    PHP
    REP #$30
    LDA.W Pose : ASL #3 : TAX
    LDA.L PoseDefinitions_YRadius,X : AND.W #$00FF : STA.W SamusYRadius
    LDA.W #$0005 : STA.W SamusXRadius
    PLP
    RTS


;;; $EC3E: $12 = Samus bottom boundary ;;;
Get_Samus_Bottom_Boundary:
;; Returns:
;;     $12: Samus bottom boundary (Samus Y position + pose Y radius - 1)
    PHP
    REP #$30
    LDA.W Pose : ASL #3 : TAX
    LDA.L PoseDefinitions_YRadius,X : AND.W #$00FF : CLC : ADC.W SamusYPosition
    DEC : STA.B DP_Temp12
    PLP
    RTL


;;; $EC58: $12 / $14 = Samus bottom / top boundary ;;;
Get_Samus_BottomTop_Boundary:
;; Returns:
;;     $12: Samus bottom boundary (Samus Y position + pose Y radius - 1)
;;     $14: Samus top boundary (Samus Y position - pose Y radius)
    PHP
    REP #$30
    LDA.W Pose : ASL #3 : TAX
    LDA.L PoseDefinitions_YRadius,X : AND.W #$00FF : PHA
    CLC : ADC.W SamusYPosition : DEC : STA.B DP_Temp12
    PLA : STA.B DP_Temp14
    LDA.W SamusYPosition : SEC : SBC.B DP_Temp14 : STA.B DP_Temp14
    PLP
    RTL


;;; $EC7E: Align Samus bottom position with previous pose ;;;
AlignSamusBottomPositionWithPreviousPose:
; Move Samus to align Samus bottom position to be the same as with previous pose
    PHP
    REP #$30
    LDA.W Pose : ASL #3 : TAX
    LDA.L PoseDefinitions_YRadius,X : AND.W #$00FF : STA.B DP_Temp12
    LDA.W PreviousPose : ASL #3 : TAX
    LDA.L PoseDefinitions_YRadius,X : AND.W #$00FF : SEC : SBC.B DP_Temp12 : STA.B DP_Temp12
    CLC : ADC.W SamusYPosition : STA.W SamusYPosition
    LDA.B DP_Temp12 : CLC : ADC.W SamusPreviousYPosition : STA.W SamusPreviousYPosition
    PLP
    RTL


;;; $ECB6: Determine Samus suit palette index ;;;
Determine_SamusSuitPalette_Index:
    LDA.W EquippedItems : BIT.W #$0020 : BNE .gravity
    BIT.W #$0001 : BNE .varia
    STZ.W SuitPaletteIndex
    RTS

  .varia:
    LDA.W #$0002 : STA.W SuitPaletteIndex
    RTS

  .gravity:
    LDA.W #$0004 : STA.W SuitPaletteIndex
    RTS


;;; $ECD5: Demo recorder - move Samus with control pad ;;;
DemoRecorder_MoveSamusWithControlPad:
    PHP
    REP #$30
    LDA.B DP_Controller1Input : BIT.W #$0800 : BEQ .checkDown
    LDA.W #$FFFC : STA.B DP_Temp12
    STZ.B DP_Temp14
    JSR MoveSamus_Up

  .checkDown:
    LDA.B DP_Controller1Input : BIT.W #$0400 : BEQ .checkLeft
    LDA.W #$0004 : STA.B DP_Temp12
    STZ.B DP_Temp14
    JSR MoveSamus_Down

  .checkLeft:
    LDA.B DP_Controller1Input : BIT.W #$0200 : BEQ .checkRight
    LDA.W #$FFFC : STA.B DP_Temp12
    STZ.B DP_Temp14
    JSR MoveSamus_Left

  .checkRight:
    LDA.B DP_Controller1Input : BIT.W #$0100 : BEQ .return
    LDA.W #$0004 : STA.B DP_Temp12
    STZ.B DP_Temp14
    JSR MoveSamus_Right

  .return:
    PLP
    RTS


;;; $ED1E: RTS ;;;
RTS_90ED1E:
    RTS


if !FEATURE_KEEP_UNREFERENCED
;;; $ED1F: Unused. Waste time ;;;
UNUSED_WasteTime_90ED1F:
    LDX.W #$00C8

  .loop:
    DEX : BPL .loop
    RTS
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $ED26: Demo recorder - display Samus position as ammo if morphed ;;;
DemoRecorder_DisplaySamusPositionAsAmmoIfMorphed:
    LDA.W MovementType : AND.W #$00FF : TAX
    LDA.W .poses,X : AND.W #$00FF : BEQ .return
    LDA.W SamusXPosition : LSR #4 : STA.W Missiles : STA.W MaxMissiles
    LDA.W SamusYPosition : LSR #4 : STA.W SuperMissiles : STA.W MaxSuperMissiles

  .return:
    RTS

  .poses:
    db $00 ;  0: Standing
    db $00 ;  1: Running
    db $00 ;  2: Normal jumping
    db $00 ;  3: Spin jumping
    db $01 ; *4: Morph ball - on ground
    db $00 ;  5: Crouching
    db $00 ;  6: Falling
    db $01 ; *7: Unused
    db $01 ; *8: Morph ball - falling
    db $01 ; *9: Unused
    db $00 ;  Ah: Knockback / crystal flash ending
    db $00 ;  Bh: Unused
    db $00 ;  Ch: Unused
    db $00 ;  Dh: Unused
    db $00 ;  Eh: Turning around - on ground
    db $00 ;  Fh: Crouching/standing/morphing/unmorphing transition
    db $00 ;  10h: Moonwalking
    db $01 ; *11h: Spring ball - on ground
    db $01 ; *12h: Spring ball - in air
    db $01 ; *13h: Spring ball - falling
    db $00 ;  14h: Wall jumping
    db $00 ;  15h: Ran into a wall
    db $00 ;  16h: Grappling
    db $00 ;  17h: Turning around - jumping
    db $00 ;  18h: Turning around - falling
    db $00 ;  19h: Damage boost
    db $00 ;  1Ah: Grabbed by Draygon
    db $00 ;  1Bh: Shinespark / crystal flash / drained by metroid / damaged by MB's attacks


if !FEATURE_KEEP_UNREFERENCED
;;; $ED6C: Unused. Display in-game time as ammo ;;;
UNUSED_DisplayInGameTimeAsAmmo_90ED6C:
    LDA.W IGTHours : STA.W Missiles : STA.W MaxMissiles
    LDA.W IGTMinutes : STA.W SuperMissiles : STA.W MaxSuperMissiles
    LDA.W IGTSeconds : STA.W PowerBombs : STA.W MaxPowerBombs
    RTS
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $ED88: Footstep graphics ;;;
FootstepGraphics:
; Water splashing in Maridia and Crateria, dust if speedboosting.
; Only works on certain frames, assumed to be walking/running
    LDA.W AreaIndex : ASL : TAX
    JSR.W (.pointers,X)
    RTS

  .pointers:
    dw FootstepGraphics_Crateria ; Crateria
    dw FootstepGraphics_Common   ; Brinstar
    dw FootstepGraphics_Common   ; Norfair
    dw FootstepGraphics_Common   ; Wrecked Ship
    dw FootstepGraphics_Maridia  ; Maridia
    dw FootstepGraphics_Common   ; Tourian
    dw FootstepGraphics_Common   ; Ceres
    dw FootstepGraphics_Common   ; Debug


;;; $EDA1: Footstep graphics - Crateria ;;;
FootstepGraphics_Crateria:
    LDA.W CinematicFunction : BEQ .notCinematic
    JMP FootstepGraphics_Common

  .notCinematic:
    LDX.W RoomIndex : CPX.W #$0010 : BPL .gotoCommon
    LDA.W .footstepTypes,X : AND.W #$00FF : BIT.W #$0001 : BNE .landingSite
    BIT.W #$0002 : BNE .wreckedShipEntrance
    BIT.W #$0004 : BNE FootstepGraphics_Maridia

  .gotoCommon:
    JMP FootstepGraphics_Common

  .footstepTypes:
    db $01 ; 0: Landing site
    db $00
    db $00
    db $00
    db $00
    db $02 ; 5: Wrecked Ship entrance
    db $00
    db $04 ; 7: Pre moat room
    db $00
    db $04 ; 9: Wrecked Ship back door
    db $04 ; Ah: East Crateria kago shaft
    db $04 ; Bh: East Crateria maze
    db $04 ; Ch: Post Crateria maze yellow door
    db $00
    db $04 ; Eh: Moat
    db $00

  .wreckedShipEntrance:
    LDA.W SamusYPosition : CMP.W #$03B0 : BPL FootstepGraphics_Maridia
    JMP FootstepGraphics_Common

  .landingSite:
    LDA.W FX_Type : CMP.W #$000A : BNE FootstepGraphics_Common
; fallthrough to FootstepGraphics_Maridia


;;; $EDEC: Footstep graphics - Maridia ;;;
FootstepGraphics_Maridia:
; Called for some Crateria rooms too
    JSL Get_Samus_Bottom_Boundary
    LDA.W FX_YPosition : BMI .negativeYPosition
    CMP.B DP_Temp12 : BPL .nonLiquidPhysics
    LDA.W FX_LiquidOptions : BIT.W #$0004 : BNE .nonLiquidPhysics
    BRA .return

  .negativeYPosition:
    LDA.W FX_LavaAcidYPosition : BMI .nonLiquidPhysics : CMP.B DP_Temp12
    BMI .return

  .nonLiquidPhysics:
    LDA.W PoseXDirection : AND.W #$00FF : CMP.W #$0004 : BEQ .facingRight
    LDA.W SamusXPosition : CLC : ADC.W #$000C : STA.W AtmosphericGraphicsXPositions
    LDA.W SamusXPosition : SEC : SBC.W #$0008 : STA.W AtmosphericGraphicsXPositions+2
    BRA .merge

  .facingRight:
    LDA.W SamusXPosition : SEC : SBC.W #$000C : STA.W AtmosphericGraphicsXPositions
    LDA.W SamusXPosition : CLC : ADC.W #$0008 : STA.W AtmosphericGraphicsXPositions+2

  .merge:
    LDA.W SamusYPosition : CLC : ADC.W #$0010 : STA.W AtmosphericGraphicsYPositions : STA.W AtmosphericGraphicsYPositions+2
    LDA.W #$0100 : STA.W AtmosphericGraphicsAnimFramesGraphicsTypes : STA.W AtmosphericGraphicsAnimFramesGraphicsTypes+2
    LDA.W #$8002 : STA.W AtmosphericGraphicsAnimationTimers
    LDA.W #$0003 : STA.W AtmosphericGraphicsAnimationTimers+2

  .return:
    RTS


;;; $EE64: Footstep graphics - common ;;;
FootstepGraphics_Common:
    LDA.W SamusBoostTimer : AND.W #$FF00 : CMP.W #$0400 : BNE .return
    JSL Get_Samus_Bottom_Boundary
    LDA.W FX_YPosition : BMI .negativeYPosition
    CMP.B DP_Temp12 : BPL .nonLiquidPhysics
    LDA.W FX_LiquidOptions : BIT.W #$0004 : BNE .nonLiquidPhysics
    BRA .return

  .negativeYPosition:
    LDA.W FX_LavaAcidYPosition : BMI .nonLiquidPhysics
    CMP.B DP_Temp12 : BMI .return

  .nonLiquidPhysics:
    LDA.W PoseXDirection : AND.W #$00FF : CMP.W #$0004 : BEQ .facingLeft
    LDA.W SamusXPosition : CLC : ADC.W #$000C : STA.W AtmosphericGraphicsXPositions
    LDA.W SamusXPosition : SEC : SBC.W #$0008 : STA.W AtmosphericGraphicsXPositions+2
    BRA .merge

  .facingLeft:
    LDA.W SamusXPosition : SEC : SBC.W #$000C : STA.W AtmosphericGraphicsXPositions
    LDA.W SamusXPosition : CLC : ADC.W #$0008 : STA.W AtmosphericGraphicsXPositions+2

  .merge:
    LDA.W SamusYPosition : CLC : ADC.W #$0010 : STA.W AtmosphericGraphicsYPositions : STA.W AtmosphericGraphicsYPositions+2
    LDA.W #$0700 : STA.W AtmosphericGraphicsAnimFramesGraphicsTypes : STA.W AtmosphericGraphicsAnimFramesGraphicsTypes+2
    LDA.W #$8002 : STA.W AtmosphericGraphicsAnimationTimers
    LDA.W #$0003 : STA.W AtmosphericGraphicsAnimationTimers+2

  .return:
    RTS


;;; $EEE7: Update speed echo position ;;;
UpdateSamusEchoPosition:
    LDA.W SamusBoostTimer : AND.W #$FF00 : CMP.W #$0400 : BNE .return
    LDA.W SpeedEcho_Index : BMI .return
    LDA.W IGTFrames : BIT.W #$0003 : BNE .return
    LDX.W SpeedEcho_Index
    LDA.W SamusXPosition : STA.W SpeedEcho_XPosition0,X
    LDA.W SamusYPosition : STA.W SpeedEcho_YPosition0,X
    INX #2 : CPX.W #$0004 : BMI .storeDistance
    LDX.W #$0000

  .storeDistance:
    STX.W SpeedEcho_Index

  .return:
    RTS


if !FEATURE_KEEP_UNREFERENCED
;;; $EF1C: Unused ;;;
UNUSED_PossiblyFootStepGraphicOffsets_90EF1C:
; Best guess is footstep graphic offsets from Samus' position
    dw $000C,$0010
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $EF20: Unknown ;;;
Unknown_ShinesparkMovementHandler_Unused_90EF20:
; Loaded by shinespark Samus movement handlers and then unused >_<;
    dw $0010


;;; $EF22: Post grapple collision detection ;;;
PostGrappleCollisionDetection:
    PHP
    REP #$30
    JSL PostGrappleCollisionDetection_Horizontal
    JSL PostGrappleCollisionDetection_Vertical
    LDA.W DistanceToEjectSamusDownDueToPostGrappleCollision : BEQ .noEject
    LDA.W DistanceToEjectSamusUpDueToPostGrappleCollision : BNE .return

  .noEject:
    LDA.W DistanceToEjectSamusUpDueToPostGrappleCollision : BEQ .return
    LDA.W SamusYPosition : SEC : SBC.W DistanceToEjectSamusUpDueToPostGrappleCollision : STA.W SamusYPosition
    LDA.W SamusYRadius : CMP.W #$0010 : BMI .return
    JSL PostGrappleCollisionDetection_Vertical
    LDA.W SamusYPosition : SEC : SBC.W DistanceToEjectSamusUpDueToPostGrappleCollision : STA.W SamusYPosition

  .return:
    PLP
    RTL


if !FEATURE_KEEP_UNREFERENCED
;;; $EF5E: Unused. Fire unknown projectile 27h ;;;
UNUSED_FireUnknownProjectile27_90EF5E:
    LDA.W #RTS_90E90E : STA.W MovementHandler
    LDA.W #SamusCurrentStateHandler_SamusIsLocked : STA.W CurrentStateHandler
    LDA.W #$FFFF : STA.W ProspectivePose : STA.W SpecialProspectivePose : STA.W SuperSpecialProspectivePose
    STZ.W ProspectivePoseChangeCommand : STZ.W SpecialProspectivePoseChangeCommand : STZ.W SuperSpecialProspectivePoseChangeCommand
    LDX.W #$0006

  .loop:
    LDA.W #$8027 : STA.W SamusProjectile_Types,X
    STZ.W SamusProjectile_Directions,X
    LDA.W #UNUSED_ProjectilePreInstruction_UnknownProjectile27_90EFD3 : STA.W SamusProjectile_PreInstructions,X
    STZ.W SamusProjectile_YVelocities,X : STZ.W SamusProjectile_XVelocities,X
    STZ.W SamusProjectile_Variables,X
    STZ.W SamusProjectile_XSubPositions,X : STZ.W SamusProjectile_YSubPositions,X
    LDA.W SamusXPosition : CLC : ADC.W .XOffsets,X : STA.W SamusProjectile_XPositions,X
    LDA.W SamusYPosition : CLC : ADC.W .YOffsets,X : STA.W SamusProjectile_YPositions,X
    JSL Initialize_ShinesparkEcho_or_SpazerSBATrailProjectile
    DEX #2 : BPL .loop
    LDA.W #$0004 : STA.W SamusProjectile_ProjectileCounter
    RTS

; Indexed by projectile index
  .XOffsets:
; X offsets from Samus
    dw $0080,$0080,$FF80,$FF80

  .YOffsets:
; Y offsets from Samus
    dw $FF80,$0080,$0080,$FF80


;;; $EFD3: Projectile pre-instruction - unknown projectile 27h ;;;
UNUSED_ProjectilePreInstruction_UnknownProjectile27_90EFD3:
;; Parameters:
;;     Y: Projectile index

; Shinespark beam code(?)
    LDA.W SamusProjectile_XPositions,X : CLC : ADC.W .XVelocities,X : STA.W SamusProjectile_XPositions,X
    LDA.W SamusProjectile_YPositions,X : CLC : ADC.W .YVelocities,X : STA.W SamusProjectile_YPositions,X
    CMP.W SamusYPosition : BNE .return
    LDA.W SamusProjectile_Variables,X : CMP.W #$0001 : BNE .not1
    CPX.W #$0006 : BNE .clear
    LDA.W #UNUSED_SamusMovementHandler_90F04B : STA.W MovementHandler

  .clear:
    JSL Clear_Projectile
    RTS

  .not1:
    INC.W SamusProjectile_Variables,X
    LDA.W #$00B4 : STA.W SpecialPaletteTimer
    LDA.W #$0001 : STA.W SpecialSamusPaletteType
    STZ.W SpecialSamusPaletteFrame
    LDA.W SamusXPosition : CLC : ADC.W .XOffsets,X : STA.W SamusProjectile_XPositions,X
    LDA.W SamusYPosition : CLC : ADC.W .YOffsets,X : STA.W SamusProjectile_YPositions,X

  .return:
    RTS

; Indexed by projectile index
  .XVelocities:
    dw $FFFC,$FFFC,$0004,$0004
  .YVelocities:
    dw $0004,$FFFC,$FFFC,$0004
  .XOffsets:
    dw $0080,$0080,$FF80,$FF80
  .YOffsets:
    dw $FF80,$0080,$0080,$FF80


;;; $F04B: Samus movement handler - unused ;;;
UNUSED_SamusMovementHandler_90F04B:
; Shinespark beam related?
    LDA.W SpecialPaletteTimer : BNE .return
    LDA.W #$0006 : STA.W SpecialSamusPaletteFrame
    LDA.W #$0001 : STA.W CommonPaletteTimer : STA.W DemoInput_Timer
    LDA.W #$000A : STA.W SpecialSamusPaletteType
    LDA.W #$0078 : STA.W SpecialPaletteTimer
    LDA.W #UNUSED_SamusMovementHandler_90F072 : STA.W MovementHandler

  .return:
    RTS


;;; $F072: Samus movement handler - unused ;;;
UNUSED_SamusMovementHandler_90F072:
; Shinespark beam related?
    LDA.W SpecialPaletteTimer : BNE .return
    LDA.W #SamusCurrentStateHandler_Normal : STA.W CurrentStateHandler
    LDA.W #SamusMovementHandler_Normal : STA.W MovementHandler

  .return:
    RTS
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $F084: Run Samus command ;;;
Run_Samus_Command:
;; Parameters:
;;     A: Command ID. Range 0..1Fh
;;         0: Lock Samus
;;         1: Unlock Samus
;;         2: Samus reached Ceres elevator
;;         3: Unspin Samus
;;         4: End charge beam
;;         5: Set up Samus for being drained - able to stand
;;         6: Lock Samus into recharge station
;;         7: Set up Samus for elevator
;;         8: Set up Samus for Ceres start
;;         9: Set up Samus for Zebes start
;;         Ah: Stop drawing Samus
;;         Bh: Unlock Samus from facing forward
;;         Ch: Unlock Samus from map station
;;         Dh: Check if grapple beam is active
;;         Eh: Unlock Samus from Ceres elevator
;;         Fh: Enable timer handling
;;         10h: Unlock Samus from reserve tank
;;         11h: Set up Samus for death sequence
;;         12h: Enable Samus blue flashing
;;         13h: Disable Samus blue flashing
;;         14h: Queue low health and grapple sound effects
;;         15h: Lock Samus into suit pickup
;;         16h: Enable rainbow Samus
;;         17h: Disable rainbow Samus and stand her up
;;         18h: Set up Samus for being drained - unable to stand
;;         19h: Freeze drained Samus animation
;;         1Ah: Samus enters gunship
;;         1Bh: Lock Samus for reserve tank
;;         1Ch: Play spin jump sound if spin jumping
;;         1Dh: Clear sounds when going through door
;;         1Eh: Resume sounds after power bomb explosion
;;         1Fh: Kill grapple beam
;; Returns:
;;     A: If [A] = Dh: 1 if grapple beam is active, otherwise 0

; Some of these commands unconditionally return false, and you might be wondering what the point is in calling that code indirectly through this function
    PHP : PHB
    PHK : PLB
    REP #$30
    PHX
    AND.W #$001F : ASL : TAX
    JSR.W (.pointers,X)
    BCC .return
    LDA.W #$FFFF : STA.W ProspectivePose : STA.W SpecialProspectivePose : STA.W SuperSpecialProspectivePose
    STZ.W ProspectivePoseChangeCommand : STZ.W SpecialProspectivePoseChangeCommand : STZ.W SuperSpecialProspectivePoseChangeCommand

  .return:
    PLX : PLB : PLP
    RTL

  .pointers:
    dw SamusCommand_0_LockSamus
    dw SamusCommand_1_UnlockSamus
    dw SamusCommand_2_SamusReachedCeresElevator
    dw SamusCommand_3_UnspinSamus
    dw SamusCommand_4_EndChargeBeam
    dw SamusCommand_5_SetupSamusForBeingDrained_AbleToStand
    dw SamusCommand_6_LockSamusIntoRefillStation
    dw SamusCommand_7_SetupSamusForElevator
    dw SamusCommand_8_SetupSamusForCeresStart
    dw SamusCommand_9_SetupSamusForZebesStart
    dw SamusCommand_A_StopDrawingSamus
    dw SamusCommand_B_UnlockSamusFromFacingForward
    dw SamusCommand_C_UpdateSamusDueToUnpause
    dw SamusCommand_D_CheckIfGrappleBeamIsActive
    dw SamusCommand_E_UnlockSamusFromCeresElevator
    dw SamusCommand_F_EnableTimerHandling
    dw SamusCommand_10_UnlockSamusFromReserveTank
    dw SamusCommand_11_SetupSamusForDeathSequence
    dw SamusCommand_12_EnableSamusBlueFlashing
    dw SamusCommand_13_DisableSamusBlueFlashing
    dw SamusCommand_14_QueueLowEnergyAndGrappleSFX
    dw SamusCommand_15_LockSamusIntoSuitPickup
    dw SamusCommand_16_EnableRainbowSamus
    dw SamusCommand_17_DisableRainbowSamus_StandHerUp
    dw SamusCommand_18_SetupSamusForBeingDrained_UnableToStand
    dw SamusCommand_19_FreezeDrainedSamusAnimation
    dw SamusCommand_1A_SamusEntersGunship
    dw SamusCommand_1B_LockSamusForReserveTank
    dw SamusCommand_1C_PlaySpinJumpSoundIfSpinJumping
    dw SamusCommand_1D_ClearSoundsWhenGoingThroughDoor
    dw SamusCommand_1E_ResumeSoundsAfterPowerBombExplosion
    dw SamusCommand_1F_KillGrappleBeam


;;; $F0EE: Update Samus previous pose ;;;
Update_Samus_PreviousPose:
    LDA.W PreviousPose : STA.W LastDifferentPose
    LDA.W PreviousPoseXDirection : STA.W LastDifferentPoseXDirection
    LDA.W Pose : STA.W PreviousPose
    LDA.W PoseXDirection : STA.W PreviousPoseXDirection
    RTS


;;; $F107: Unused. Clear carry ;;;
CLCRTS_90F107:
    CLC
    RTS


;;; $F109: Samus command 0: lock Samus ;;;
SamusCommand_0_LockSamus:
;; Returns:
;;     Carry: Set. Cancel any pending pose transition

; Called by:
;     $82:E17D: Door transition function - handle elevator
;     $82:E6A2: Door transition function - nudge Samus if she's intercepting the door
;     $84:D18F: Setup - PLM $D6DA (collision reaction, special, BTS Norfair 83h. Lower Norfair chozo hand trigger)
;     $84:D5E6: Instruction - lock Samus
;     $84:D620: Setup - PLM $D6F2 (collision reaction, special, BTS Wrecked Ship 80h. Wrecked Ship chozo hand trigger)
;     $87:815A: Unused. Instruction - lock Samus
;     $8F:E26C: Door ASM - set up elevatube from south
;     $8F:E291: Door ASM - set up elevatube from north
;     $A6:BC68: (Ridley grabs Samus)
;     $A9:8829: Mother Brain body function - fake death - descent - lock Samus and set scroll region
    LDA.W #SamusCurrentStateHandler_SamusIsLocked : STA.W CurrentStateHandler
    LDA.W #SamusNewStateHandler_SamusIsLocked : STA.W NewStateHandler
    SEC
    RTS


;;; $F117: Samus command 1: unlock Samus ;;;
SamusCommand_1_UnlockSamus:
;; Returns:
;;     Carry: Set. Cancel any pending pose transition

; Called by:
;     $84:8CAF: Instruction - activate energy station
;     $84:8CD0: Instruction - activate missile station
;     $84:AE35: Instruction - go to [[Y]] and enable movement if Samus health is full
;     $84:AEBF: Instruction - go to [[Y]] and enable movement if Samus missiles are full
;     $84:B030: Instruction - enable movement and set save station used
;     $84:D5EE: Instruction - unlock Samus
;     $87:8162: Unused. Instruction - unlock Samus
;     $8F:E301: Door ASM - reset elevatube on north exit
;     $8F:E309: Door ASM - reset elevatube on south exit
;     $A6:BC84: (Ridley releases Samus)
;     $A9:886C: Mother Brain body function - fake death - descent - unlock Samus
;     $A9:BA5E: Mother Brain body function - second phase - firing rainbow beam - finish firing rainbow beam
;     $AA:E43D: Instruction - unlock Samus
;     $AA:E6F0: Instruction - release Samus
    LDA.W #SamusCurrentStateHandler_Normal : STA.W CurrentStateHandler
    LDA.W #SamusNewStateHandler_Normal : STA.W NewStateHandler
    SEC
    RTS


;;; $F125: Samus command 2: Samus reached Ceres elevator ;;;
SamusCommand_2_SamusReachedCeresElevator:
;; Returns:
;;     Carry: Set. Cancel any pending pose transition

; Called by:
;     $89:ACC3: Room main ASM - Ceres elevator shaft
    LDA.W PoseXDirection : AND.W #$00FF : CMP.W #$0004 : BEQ .facingLeft
    LDA.W #$0001 : STA.W Pose
    BRA +

  .facingLeft:
    LDA.W #$0002 : STA.W Pose
+   STZ.W NewPoseSamusAnimationFrame
    JSL InitializeSamusPose_1
    JSL Set_Samus_AnimationFrame_if_PoseChanged
    LDA.W #$003C : STA.W CeresElevatorFadeTimer
    JMP SamusCommand_0_LockSamus


;;; $F152: Samus command 3: unspin Samus ;;;
SamusCommand_3_UnspinSamus:
;; Returns:
;;     Carry: Set to cancel any pending pose transition, otherwise clear

; Called by:
;     $A8:A665: Move Samus with yapping maw pincers
    LDA.W GrappleBeam_Function : CMP.W #GrappleBeamFunction_Inactive : BEQ .grappleInactive
    LDA.W #GrappleBeamFunction_Dropped : STA.W GrappleBeam_Function

  .returnCarryClear:
    CLC
    RTS

  .grappleInactive:
    LDA.W MovementType : AND.W #$00FF : CMP.W #$0003 : BEQ .checkDirection
    CMP.W #$0014 : BNE .returnCarryClear

  .checkDirection:
    LDA.W PoseXDirection : AND.W #$00FF : CMP.W #$0004 : BEQ .facingLeft
    LDA.W #$0001 : STA.W Pose
    BRA +

  .facingLeft:
    LDA.W #$0002 : STA.W Pose

+   STZ.W NewPoseSamusAnimationFrame
    JSL InitializeSamusPose_1
    JSL Set_Samus_AnimationFrame_if_PoseChanged
    JSR Update_Samus_PreviousPose
    SEC
    RTS


;;; $F19B: Samus command 4: end charge beam ;;;
SamusCommand_4_EndChargeBeam:
;; Returns:
;;     Carry: Clear. Allow any pending pose transition

; Called by:
;     $A0:A4A1: Normal enemy touch AI - no death check

; $A0:A4A1 assumes that this routine preserves Y (which it does)
    STZ.W SamusChargePaletteIndex
; fallthrough to EndChargeBeam


;;; $F19E: End charge beam ;;;
EndChargeBeam:
;; Returns:
;;     Carry: Clear. Allow any pending pose transition
    STZ.W SamusProjectile_FlareCounter
    JSR ClearFlareAnimationState
    JSL LoadSamusSuitPalette
    CLC
    RTS


;;; $F1AA: Samus command 6: lock Samus into recharge station ;;;
SamusCommand_6_LockSamusIntoRefillStation:
;; Returns:
;;     Carry: Clear. Allow any pending pose transition

; Called by:
;     $84:B146: Activate the station at block index [A] if Samus arm cannon is lined up
    LDA.W #SamusCurrentStateHandler_SamusIsLocked : STA.W CurrentStateHandler
    LDA.W #RTL_90E8D6 : STA.W NewStateHandler
    LDA.W SamusProjectile_FlareCounter : CMP.W #$000F : BMI .gotoEndChargeBeam
    LDA.W #$0002
    JSL QueueSound

  .gotoEndChargeBeam:
    JMP EndChargeBeam


;;; $F1C8: Samus command 7: set up Samus for elevator ;;;
SamusCommand_7_SetupSamusForElevator:
;; Returns:
;;     Carry: Set. Cancel any pending pose transition

; Called by:
;     $82:E6A2: Door transition function - nudge Samus if she's intercepting the door
;     $A3:9548: Elevator AI - elevator status = 0: inactive
    JSL MakeSamusFaceForward
    LDA.W #SamusNewStateHandler_RidingElevator : STA.W NewStateHandler
    LDA.W #SamusMovementHandler_Normal : STA.W MovementHandler
    LDA.W #SamusDisplayHandler_UsingElevator : STA.W DrawingHandler
    LDA.W #SamusPoseInputHandler_Normal : STA.W PoseInputHandler
    STZ.W BombJumpDirection
    SEC
    RTS


;;; $F1E9: Samus command 8: set up Samus for Ceres start ;;;
SamusCommand_8_SetupSamusForCeresStart:
;; Returns:
;;     Carry: Set. Cancel any pending pose transition

; Called by:
;     $82:8000: Game state 6/1Fh/28h (loading game data / set up new game / load demo game data)
    LDA.W #RTL_90E8CD : STA.W CurrentStateHandler
    LDA.W #SamusNewStateHandler_SamusIsLocked : STA.W NewStateHandler
    LDA.W #$0000 : STA.W Pose
    STZ.W NewPoseSamusAnimationFrame
    JSL InitializeSamusPose_1
    JSL Set_Samus_AnimationFrame_if_PoseChanged
    JSL LoadSamusSuitPalette
    LDA.W #SamusDrawingHandler_Default : STA.W DrawingHandler
    LDA.W Pose : STA.W PreviousPose : STA.W LastDifferentPose
    LDA.W PoseXDirection : STA.W PreviousPoseXDirection : STA.W LastDifferentPoseXDirection
    STZ.W SamusYPosition
    LDY.W #EnemyProjectile_CeresElevatorPad
    JSL SpawnEnemyProjectileY_ParameterA_XGraphics
    LDY.W #EnemyProjectile_CeresElevatorPadLevelDataConcealer
    JSL SpawnEnemyProjectileY_ParameterA_XGraphics
    STZ.W DisableMinimap
    JSL Play_Room_Music_Track_After_A_Frames
    SEC
    RTS


;;; $F23C: Samus command 9: set up Samus for Zebes start ;;;
SamusCommand_9_SetupSamusForZebesStart:
;; Returns:
;;     Carry: Set. Cancel any pending pose transition

; Called by:
;     $82:8000: Game state 6/1Fh/28h (loading game data / set up new game / load demo game data)
    LDA.W EquippedItems : BIT.W #$0020 : BNE .gravity
    BIT.W #$0001 : BNE .varia
    LDY.W #PaletteFXObjects_SamusLoading_PowerSuit
    JSL Spawn_PaletteFXObject
    LDA.W #$0000 : STA.W Pose
    BRA .merge

  .varia:
    LDY.W #PaletteFXObjects_SamusLoading_VariaSuit
    JSL Spawn_PaletteFXObject
    LDA.W #$009B : STA.W Pose
    BRA .merge

  .gravity:
    LDY.W #PaletteFXObjects_SamusLoading_GravitySuit
    JSL Spawn_PaletteFXObject
    LDA.W #$009B : STA.W Pose

  .merge:
    JSL LoadSamusSuitPalette
    JSL InitializeSamusPose_1
    LDA.W #$0003 : STA.W SamusAnimationFrameTimer
    LDA.W #$0002 : STA.W SamusAnimationFrame
    STZ.W SamusAppearsFanfareTimer
    SEC
    RTS


;;; $F28D: Samus command Ah: stop drawing Samus ;;;
SamusCommand_A_StopDrawingSamus:
;; Returns:
;;     Carry: Clear. Allow any pending pose transition

; Called by:
;     $A2:AAA2: Gunship function - go to liftoff or restore Samus health / ammo
    LDA.W #RTS_90E90E : STA.W DrawingHandler
    CLC
    RTS


;;; $F295: Samus command Bh: unlock Samus from facing forward ;;;
SamusCommand_B_UnlockSamusFromFacingForward:
;; Returns:
;;     Carry: Set. Cancel any pending pose transition

; Called by:
;     $88:E25F: Suit pickup stage 6
;     $A3:95BC: Elevator AI - elevator status = 3: entering room
    LDA.W #SamusDrawingHandler_Default : STA.W DrawingHandler
    JMP SamusCommand_1_UnlockSamus


;;; $F29E: Samus command Ch: update Samus due to unpause ;;;
SamusCommand_C_UpdateSamusDueToUnpause:
;; Returns:
;;     Carry: Set. Cancel any pending pose transition

; Called by:
;     $82:A2E3: Continue initialising gameplay resume

; This code is responsible for unlocking Samus from map stations
    JSL UpdateSamusPoseDueToChangeOfEquipment
    LDA.W NewStateHandler : CMP.W #RTL_90E8D6 : BNE .return
    LDA.W #SamusCurrentStateHandler_Normal : STA.W CurrentStateHandler
    LDA.W #SamusNewStateHandler_Normal : STA.W NewStateHandler

  .return:
    SEC
    RTS


;;; $F2B8: Samus command Dh: check if grapple beam is active ;;;
SamusCommand_D_CheckIfGrappleBeamIsActive:
;; Returns:
;;     Carry: Clear. Allow any pending pose transition
;;     A: 1 if grapple beam is active, otherwise 0

; Called by:
;     $86:EFE0: Pre-instruction - enemy projectile $F337 (pickup)
;     $A0:9E9A: Enemy / grapple beam collision detection
;     $A5:8E19: Draygon body function - chase Samus
    LDA.W GrappleBeam_Function : CMP.W #GrappleBeamFunction_Inactive : BNE .active
    LDA.W #$0000
    CLC
    RTS

  .active:
    LDA.W #$0001
    CLC
    RTS


;;; $F2CA: Samus command Eh: unlock Samus from Ceres elevator ;;;
SamusCommand_E_UnlockSamusFromCeresElevator:
;; Returns:
;;     Carry: Set. Cancel any pending pose transition

; Called by:
;     $86:A328: Pre-instruction - enemy projectile $A387 (Ceres elevator pad)
    LDA.W #SamusCurrentStateHandler_Normal : STA.W CurrentStateHandler
    LDA.W #SamusNewStateHandler_Ceres : STA.W NewStateHandler
    SEC
    RTS


;;; $F2D8: Samus command Fh: enable timer handling ;;;
SamusCommand_F_EnableTimerHandling:
;; Returns:
;;     Carry: Clear. Allow any pending pose transition
    LDA.W #SamusTimerHackHandler_HandleTimer : STA.W HackHandler
    CLC
    RTS


;;; $F2E0: Samus command 10h: unlock Samus from reserve tank ;;;
SamusCommand_10_UnlockSamusFromReserveTank:
;; Returns:
;;     Carry: Set. Cancel any pending pose transition

; Called by:
;     $82:DC10: Game state 1Bh (reserve tank auto)
    LDA.W NewStateHandler : CMP.W #RTL_90E8D9 : BNE .noRainbowBeam
    SEC
    RTS

  .noRainbowBeam:
    LDA.W #SamusCurrentStateHandler_Normal : STA.W CurrentStateHandler
    LDA.W #SamusNewStateHandler_Normal : STA.W NewStateHandler
    SEC
    RTS


;;; $F2F8: Samus command 11h: set up Samus for death sequence ;;;
SamusCommand_11_SetupSamusForDeathSequence:
;; Returns:
;;     Carry: Set. Cancel any pending pose transition

; Called by:
;     $82:DB69: Handle Samus running out of health and increment game time
    JSL Disable_PaletteFXObjects
; fallthrough to LockSamus_SetInanimateSamusDrawingHandler


;;; $F2FC: Lock Samus and set inanimate Samus drawing handler ;;;
LockSamus_SetInanimateSamusDrawingHandler:
;; Returns:
;;     Carry: Set. Cancel any pending pose transition
    LDA.W #SamusCurrentStateHandler_SamusIsLocked : STA.W CurrentStateHandler
    LDA.W #RTL_90E8CD : STA.W NewStateHandler
    LDA.W #SamusDisplayHandler_InanimateSamus : STA.W DrawingHandler
    SEC
    RTS


;;; $F310: Samus command 15h: lock Samus into suit pickup ;;;
SamusCommand_15_LockSamusIntoSuitPickup:
;; Returns:
;;     Carry: Set. Cancel any pending pose transition

; Called by:
;     $91:D4E4: Varia suit pick up
;     $91:D5BA: Gravity suit pick up
    JSR Update_Samus_PreviousPose
    STZ.W SamusProjectile_FlareCounter
    JSR ClearFlareAnimationState
    JSL LoadSamusSuitPalette
    JMP LockSamus_SetInanimateSamusDrawingHandler


;;; $F320: Samus command 12h: enable Samus blue flashing ;;;
SamusCommand_12_EnableSamusBlueFlashing:
;; Returns:
;;     Carry: Clear. Allow any pending pose transition

; Called by:
;     $A3:EDEB: Enemy touch - enemy $DD7F (metroid)
;     $A9:F20E: Shitroid function - start draining Samus
    LDA.W #$0001 : STA.W SuperSpecialPaletteFlags
    CLC
    RTS


;;; $F328: Samus command 13h: disable Samus blue flashing ;;;
SamusCommand_13_DisableSamusBlueFlashing:
;; Returns:
;;     Carry: Clear. Allow any pending pose transition

; Called by:
;     $A3:EF07: Enemy shot - enemy $DD7F (metroid)
;     $A3:F042: Power bomb reaction - enemy $DD7F (metroid)
;     $A9:F21B: Shitroid function - draining Samus
    STZ.W SuperSpecialPaletteFlags
    JSL LoadSamusSuitPalette
    CLC
    RTS


;;; $F331: Samus command 14h: queue low health and grapple sound effects ;;;
SamusCommand_14_QueueLowEnergyAndGrappleSFX:
;; Returns:
;;     Carry: Clear. Allow any pending pose transition

; Called by:
;     $82:BE2F: Queue Samus movement sound effects

; Typo: The LDA PoseXDirection at $F34F looks like it's supposed to be LDA MovementType to check [Samus movement type] != spin jumping
    LDA.W Energy : CMP.W #$001F : BPL .notLowEnergy
    LDA.W #$0002
    JSL QueueSound_Lib3_Max6

  .notLowEnergy:
    JSR SamusCommand_D_CheckIfGrappleBeamIsActive
    TAY : BEQ .grappleInactive
    LDA.W #$0006
    JSL QueueSound_Lib1_Max6
    CLC
    RTS

  .grappleInactive:
    LDA.W PoseXDirection : AND.W #$00FF : CMP.W #$0003 : BEQ +
    CLC
    RTS

+   LDA.W Pose : CMP.W #$0081 : BEQ .screwAttack
    CMP.W #$0082 : BEQ .screwAttack
    CMP.W #$001B : BEQ .spaceJump
    CMP.W #$001C : BEQ .spaceJump
    LDA.W #$0031
    JSL QueueSound_Lib1_Max6
    CLC
    RTS

  .spaceJump:
    LDA.W #$003E
    JSL QueueSound_Lib1_Max6
    CLC
    RTS

  .screwAttack:
    LDA.W #$0033
    JSL QueueSound_Lib1_Max6
    CLC
    RTS


;;; $F38E: Samus command 5: set up Samus for being drained - able to stand ;;;
SamusCommand_5_SetupSamusForBeingDrained_AbleToStand:
;; Returns:
;;     Carry: Set. Cancel any pending pose transition

; Called by:
;     $A9:B975: Mother Brain body function - second phase - firing rainbow beam - start firing rainbow beam
    LDA.W #SamusTimerHackHandler_HandleLettingSamusUpFromBeingDrained : STA.W HackHandler
; fallthrough to SetupSamusForBeingDrained


;;; $F394: Set up Samus for being drained ;;;
SetupSamusForBeingDrained:
;; Returns:
;;     Carry: Clear. Allow any pending pose transition
    LDA.W #$0054 : STA.W Pose
    STZ.W NewPoseSamusAnimationFrame
    JSL InitializeSamusPose_1
    JSL Set_Samus_AnimationFrame_if_PoseChanged
    JSR Update_Samus_PreviousPose
    STZ.W SamusProjectile_FlareCounter
    JSR ClearFlareAnimationState
    JSL LoadSamusSuitPalette
    LDA.W #SamusCurrentStateHandler_SamusIsLocked : STA.W CurrentStateHandler
    LDA.W #RTL_90E8D9 : STA.W NewStateHandler
    SEC
    RTS


;;; $F3C0: Samus command 18h: set up Samus for being drained - unable to stand ;;;
SamusCommand_18_SetupSamusForBeingDrained_UnableToStand:
;; Returns:
;;     Carry: Set. Cancel any pending pose transition

; Called by:
;     $A9:B975: Mother Brain body function - second phase - firing rainbow beam - start firing rainbow beam
    LDA.W #SamusTimerHackHandler_LetSamusFailToStandUpFromBeingDrained : STA.W HackHandler
    JMP SetupSamusForBeingDrained


;;; $F3C9: Samus command 16h: enable rainbow Samus ;;;
SamusCommand_16_EnableRainbowSamus:
;; Returns:
;;     Carry: Clear. Allow any pending pose transition

; Called by:
;     $A9:CD30: Samus rainbow palette function - activate rainbow when enemy is low enough
    LDA.W #$8000 : STA.W SuperSpecialPaletteFlags
    LDA.W #$0001 : STA.W SpecialSamusPaletteFrame : STA.W CommonPaletteTimer
    STZ.W SamusChargePaletteIndex
    CLC
    RTS


;;; $F3DD: Samus command 17h: disable rainbow Samus and stand her up ;;;
SamusCommand_17_DisableRainbowSamus_StandHerUp:
;; Returns:
;;     Carry: Clear. Allow any pending pose transition

; Called by:
;     $90:F54C: Debug command handler - disable rainbow Samus and stand her up if controller 2 Y is newly pressed
;     $A9:CCF0: Shitroid function - finish cutscene
    STZ.W SuperSpecialPaletteFlags : STZ.W SpecialSamusPaletteFrame
    STZ.W CommonPaletteTimer : STZ.W SamusChargePaletteIndex
    JSL LoadSamusSuitPalette
    LDA.W #$0001 : STA.W SamusAnimationFrameTimer
    LDA.W #$000D : STA.W SamusAnimationFrame
    CLC
    RTS


;;; $F3FB: Samus command 19h: freeze drained Samus animation ;;;
SamusCommand_19_FreezeDrainedSamusAnimation:
;; Returns:
;;     Carry: Set. Cancel any pending pose transition

; Called by:
;     $A9:CC7F: Shitroid function - prepare Samus for hyper beam acquisition
    LDA.W #$0001 : STA.W SamusAnimationFrameTimer
    LDA.W #$001C : STA.W SamusAnimationFrame
    SEC
    RTS


;;; $F409: Samus command 1Ah: Samus enters gunship ;;;
SamusCommand_1A_SamusEntersGunship:
;; Returns:
;;     Carry: Clear. Allow any pending pose transition

; Called by:
;     $A2:A9BD: Gunship function - handle letting Samus enter
    LDA.W #SamusNewStateHandler_EnteringExitingGunship : STA.W NewStateHandler
    CLC
    RTS


;;; $F411: Samus command 1Bh: lock Samus for reserve tank ;;;
SamusCommand_1B_LockSamusForReserveTank:
;; Returns:
;;     Carry: Set. Cancel any pending pose transition

; Called by:
;     $82:DB69: Handle Samus running out of health and increment game time
    LDA.W NewStateHandler : CMP.W #RTL_90E8D9 : BEQ .rainbowBeam
    JMP SamusCommand_0_LockSamus

  .rainbowBeam:
    SEC
    RTS


;;; $F41E: Samus command 1Ch: play spin jump sound if spin jumping ;;;
SamusCommand_1C_PlaySpinJumpSoundIfSpinJumping:
;; Returns:
;;     Carry: Clear. Allow any pending pose transition

; Called by:
;     $84:8270: Play spin jump sound if spin jumping
;     $91:D8A5: Handle misc. Samus palette
;     $9B:C856: Grapple beam function - hit nothing / cancel
    LDA.W MovementType : AND.W #$00FF : CMP.W #$0014 : BEQ .wallJump
    CMP.W #$0003 : BEQ .spinJumping
    CLC
    RTS

  .spinJumping:
    LDA.W Pose : CMP.W #$0081 : BEQ .screwAttack
    CMP.W #$0082 : BEQ .screwAttack
    CMP.W #$001B : BEQ .spaceJump
    CMP.W #$001C : BEQ .spaceJump
    BRA .spinJump

  .wallJump:
    LDA.W SamusAnimationFrame : CMP.W #$0017 : BPL .screwAttack
    CMP.W #$000D : BPL .spaceJump

  .spinJump:
    LDA.W #$0031
    JSL QueueSound_Lib1_Max9
    CLC
    RTS

  .spaceJump:
    LDA.W #$003E
    JSL QueueSound_Lib1_Max9
    CLC
    RTS

  .screwAttack:
    LDA.W #$0033
    JSL QueueSound_Lib1_Max9
    CLC
    RTS


;;; $F471: Samus command 1Dh: clear sounds when going through door ;;;
SamusCommand_1D_ClearSoundsWhenGoingThroughDoor:
;; Returns:
;;     Carry: Clear. Allow any pending pose transition

; Called by:
;     $84:8250: Clear sounds when going through door
    LDA.W MovementType : AND.W #$00FF : CMP.W #$0003 : BEQ .endSpaceJumpSFX
    CMP.W #$0014 : BNE .notSpinning

  .endSpaceJumpSFX:
    LDA.W #$0032
    JSL QueueSound
    CLC
    RTS

  .notSpinning:
    LDA.B DP_Controller1Input : BIT.W ShotBinding : BNE .returnCarryClear
    LDA.W SamusProjectile_FlareCounter : CMP.W #$0010 : BPL .returnCarryClear
    LDA.W #$0002
    JSL QueueSound

  .returnCarryClear:
    CLC
    RTS


;;; $F4A2: Samus command 1Eh: resume sounds after power bomb explosion ;;;
SamusCommand_1E_ResumeSoundsAfterPowerBombExplosion:
;; Returns:
;;     Carry: Clear. Allow any pending pose transition

; Called by:
;     $88:8B4E: Power bomb explosion - clean up and try crystal flash
    LDA.W GameState : CMP.W #$0008 : BNE .returnCarryClear
    LDA.W MovementType : AND.W #$00FF : CMP.W #$0003 : BEQ .spinJumpSFX
    CMP.W #$0014 : BNE .notSpinning

  .spinJumpSFX:
    JSR SamusCommand_1C_PlaySpinJumpSoundIfSpinJumping
    CLC
    RTS

  .notSpinning:
    LDA.W SamusProjectile_FlareCounter : CMP.W #$0010 : BMI .returnCarryClear
    LDA.W #$0041
    JSL QueueSound_Lib1_Max9

  .returnCarryClear:
    CLC
    RTS


;;; $F4D0: Samus command 1Fh: kill grapple beam ;;;
SamusCommand_1F_KillGrappleBeam:
;; Returns:
;;     Carry: Clear. Allow any pending pose transition

; Called by:
;     $91:E3F6: Make Samus face forward
    LDA.W GrappleBeam_Function : CMP.W #GrappleBeamFunction_Inactive : BNE .grappleActive
    CLC
    RTS

  .grappleActive:
    STZ.W GrappleBeam_neverRead0D1E : STZ.W GrappleBeam_neverRead0D20
    STZ.W GrappleBeam_DirectionFired : STZ.W GrappleBeam_SpecialAngleHandlingFlag
    STZ.W GrappleWalljumpTimer : STZ.W GrappleBeam_SlowScrollingFlag
    STZ.W GrappleBeam_PoseChangeAutoFireTimer : STZ.W GrappleBeam_Flags
    LDA.W EquippedBeams
    JSL Load_Beam_Palette_External
    LDA.W #GrappleBeamFunction_Inactive : STA.W GrappleBeam_Function
    LDA.W #SamusDrawingHandler_Default : STA.W DrawingHandler
    CLC
    RTS


if !FEATURE_KEEP_UNREFERENCED
;;; $F507: Unused ;;;
UNUSED_ResumeSounds_90F507:
; Similar to SamusCommand_1E_ResumeSoundsAfterPowerBombExplosion, except this routine doesn't play spin jump sound if spin jumping
    LDA.W MovementType : AND.W #$00FF : CMP.W #$0003 : BEQ .return
    CMP.W #$0014 : BEQ .return
    LDA.B DP_Controller1Input : BIT.W ShotBinding : BEQ .return
    LDA.W SamusProjectile_FlareCounter : CMP.W #$0010 : BMI .return
    LDA.W #$0041
    JSL QueueSound_Lib1_Max9

  .return:
    CLC
    RTS
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $F52F: Debug command handler ;;;
DebugCommandHandler:
; RTS'd out as you can see
    RTS
    JMP.W (DebugCommandPointer)


;;; $F533: RTS ;;;
RTS_90F533:
    RTS


;;; $F534: RTS ;;;
RTS_90F534:
    RTS


;;; $F535: Debug command handler - give Samus a shinespark if Y is newly pressed ;;;
DebugCommandHandler_GiveSamusAShinesparkIfYNewlyPressed:
    LDA.B DP_Controller1New : BIT.W #$4000 : BEQ .return
    LDA.W #$00B4 : STA.W SpecialPaletteTimer
    LDA.W #$0001 : STA.W SpecialSamusPaletteType
    STZ.W SpecialSamusPaletteFrame

  .return:
    RTS


;;; $F54C: Debug command handler - disable rainbow Samus and stand her up if controller 2 Y is newly pressed ;;;
DebugCommandHandler_DisableRainbowSamus_StandHerUp:
    LDA.B DP_Controller2New : BIT.W #$4000 : BEQ .return
    LDA.W #$0017
    JSL Run_Samus_Command
    LDA.W #RTS_90F534 : STA.W DebugCommandPointer

  .return:
    RTS


;;; $F561: Debug command handler - release Samus from drained pose if Y newly pressed ;;;
DebugCommandHandler_ReleaseSamusFromDrainedPoseIfYNewlyPress:
    LDA.B DP_Controller1New : BIT.W #$4000 : BEQ .return
    LDA.W #RTS_90F534 : STA.W DebugCommandPointer
    LDA.W #$0002
    JSL DrainedSamusController

  .return:
    RTS


;;; $F576: Handle unspin sound effects, cancelling echo sound and setting time up game state ;;;
Handle_UnspinSFX_CancellingEchoSound_SettingTimeUpGameState:
; Also enables debug invincibility if debug mode is enabled and controller 2 newly presses A whilst L + R is pressed
; The code at $90:E0E6 is supposed to set the time up game state, and also sets HackHandler to $E114
; The purpose of the code at $F619 checking for HackHandler = $E114 and setting the time up game state seems to be for handling edge cases like entering at door at timer = 00'00"00
    PHP
    REP #$30
    LDA.W ResumeChargingBeamSFXFlag : BMI .negative
    BEQ .notSet
    LDA.B DP_Controller1Input : BIT.W ShotBinding : BEQ .pressingShot
    LDA.W #$0041
    JSL QueueSound_Lib1_Max9

  .pressingShot:
    STZ.W ResumeChargingBeamSFXFlag

  .notSet:
    LDA.W SamusEchoesSFXFlag : BEQ .echoes
    LDA.W SamusBoostTimer : BIT.W #$0400 : BNE .echoes
    STZ.W SamusEchoesSFXFlag
    LDA.W #$0025
    JSL QueueSound_Lib3_Max15

  .echoes:
    LDA.W PreviousMovementTypeXray : AND.W #$00FF : CMP.W #$0003 : BEQ .spinJumping
    CMP.W #$0014 : BNE .checkDebug

  .spinJumping:
    LDA.W MovementType : AND.W #$00FF : CMP.W #$0003 : BEQ .checkDebug
    CMP.W #$0014 : BEQ .checkDebug
    LDA.W #$0032
    JSL QueueSound
    LDA.W SamusProjectile_FlareCounter : CMP.W #$0010 : BMI .checkDebug
    LDA.B DP_Controller1Input : BIT.W ShotBinding : BEQ .checkDebug

  .negative:
    LDA.W #$0001 : STA.W ResumeChargingBeamSFXFlag

  .checkDebug:
    LDA.W Debug_Enable : BEQ .debugEnd
    LDA.W Pose : BEQ .checkInputs
    CMP.W #$009B : BEQ .checkInputs
    LDA.W DebugInvincibility : CMP.W #$0007 : BMI .resetInvincibility
    PLP
    RTS

  .checkInputs:
    LDA.B DP_Controller2Input : AND.W #$0030 : CMP.W #$0030 : BNE .debugEnd
    LDA.B DP_Controller2New : BIT.W #$0080 : BEQ .debugEnd
    LDA.W #$0007 : STA.W DebugInvincibility
    BRA .debugEnd

  .resetInvincibility:
    STZ.W DebugInvincibility

  .debugEnd:
    LDA.W #$000E
    JSL CheckIfEvent_inA_HasHappened
    BCC .return
    LDA.W HackHandler : CMP.W #SamusTimerHackHandler_DrawTimer : BNE .return
    LDA.W GameState : CMP.W #$0023 : BEQ .return
    LDA.W #$0023 : STA.W GameState

  .return:
    PLP
    RTS


Freespace_Bank90_F63A:
; $9C6 bytes
