
org $918000


;;; $8000: Normal Samus pose input handler ;;;
NormalSamusPoseInputHandler:
; Called by Samus pose input handlers other than x-ray (which uses XraySamusPoseInputHandler instead)
    PHP : PHB
    PHK : PLB
    REP #$30
    LDA.W MovementType : AND.W #$00FF : ASL : TAX
    JSR.W (.pointers,X)
    PLB : PLP
    RTL

  .pointers:
    dw NormalSamusPoseInputHandler_Standing                              ; 0: Standing
    dw NormalSamusPoseInputHandler_1_Running                             ; 1: Running
    dw NormalSamusPoseInputHandler_NormalJumping                         ; 2: Normal jumping
    dw NormalSamusPoseInputHandler_SpinJumping                           ; 3: Spin jumping
    dw NormalSamusPoseInputHandler_MorphBall_OnGround                    ; 4: Morph ball - on ground
    dw NormalSamusPoseInputHandler_Crouching                             ; 5: Crouching
    dw NormalSamusPoseInputHandler_Falling                               ; 6: Falling
    dw RTS_918086                                                        ; 7: Unused
    dw NormalSamusPoseInputHandler_MorphBall_Falling                     ; 8: Morph ball - falling
    dw RTS_918112                                                        ; 9: Unused
    dw NormalSamusPoseInputHandler_Knockback_CrystalFlashEnding          ; Ah: Knockback / crystal flash ending
    dw RTS_91812D                                                        ; Bh: Unused
    dw NormalSamusPoseInputHandler_C_DetermineProspectivePose            ; Ch: Unused
    dw NormalSamusPoseInputHandler_D_DetermineProspectivePose            ; Dh: Unused
    dw NormalSamusPoseInputHandler_TurningAround_OnGround                ; Eh: Turning around - on ground
    dw RTS_918146                                                        ; Fh: Crouching/standing/morphing/unmorphing transition
    dw NormalSamusPoseInputHandler_Moonwalking                           ; 10h: Moonwalking
    dw NormalSamusPoseInputHandler_SpringBall_OnGround                   ; 11h: Spring ball - on ground
    dw NormalSamusPoseInputHandler_SpringBall_InAir                      ; 12h: Spring ball - in air
    dw NormalSamusPoseInputHandler_SpringBall_Falling                    ; 13h: Spring ball - falling
    dw NormalSamusPoseInputHandler_WallJumping                           ; 14h: Wall jumping
    dw NormalSamusPoseInputHandler_RanIntoAWall                          ; 15h: Ran into a wall
    dw NormalSamusPoseInputHandler_Grappling                             ; 16h: Grappling
    dw NormalSamusPoseInputHandler_TurningAround_Jumping                 ; 17h: Turning around - jumping
    dw NormalSamusPoseInputHandler_TurningAround_Falling                 ; 18h: Turning around - falling
    dw NormalSamusPoseInputHandler_DamageBoost                           ; 19h: Damage boost
    dw NormalSamusPoseInputHandler_GrabbedByDraygon                      ; 1Ah: Grabbed by Draygon
    dw NormalSamusPoseInputHandler_Shinespark_CF_Drained_DamagedMB       ; 1Bh: Shinespark / crystal flash / drained by metroid / damaged by MB's attacks


;;; $804C: RTS ;;;
RTS_91804C:
    RTS


;;; $804D: Normal Samus pose input handler - [Samus movement type] = standing ;;;
NormalSamusPoseInputHandler_Standing:
    PHP
    REP #$30
    LDA.W Pose : BEQ .facingForward
    CMP.W #$009B : BEQ .facingForward
    BRA .notFacingForward

  .facingForward:
    LDA.W ElevatorStatus : BNE .return

  .notFacingForward:
    JSR DetermineProspectivePoseFromTransitionTable

  .return:
    PLP
    RTS


;;; $8066: Normal Samus pose input handler - [Samus movement type] = running ;;;
NormalSamusPoseInputHandler_1_Running:
    PHP
    REP #$30
    JSR DetermineProspectivePoseFromTransitionTable
    PLP
    RTS


;;; $806E: Normal Samus pose input handler - [Samus movement type] = normal jumping ;;;
NormalSamusPoseInputHandler_NormalJumping:
    PHP
    REP #$30
    JSR DetermineProspectivePoseFromTransitionTable
    PLP
    RTS


;;; $8076: Normal Samus pose input handler - [Samus movement type] = spin jumping ;;;
NormalSamusPoseInputHandler_SpinJumping:
    PHP
    REP #$30
    JSR DetermineProspectivePoseFromTransitionTable
    PLP
    RTS


;;; $807E: Normal Samus pose input handler - [Samus movement type] = morph ball - on ground ;;;
NormalSamusPoseInputHandler_MorphBall_OnGround:
    PHP
    REP #$30
    JSR DetermineProspectivePoseFromTransitionTable
    PLP
    RTS


;;; $8086: RTS. Normal Samus pose input handler - [Samus movement type] = 7 ;;;
RTS_918086:
    RTS


;;; $8087: Normal Samus pose input handler - [Samus movement type] = crouching ;;;
NormalSamusPoseInputHandler_Crouching:
; Note that this routine is not called when time is frozen (CurrentStateHandler = $E713 during reserve tanks, PoseInputHandler = $E918 during x-ray),
; so the call to XraySamusPoseInputHandler is dead code
; I also don't think there's any way to transition directly from crouching to standing, so the Y position adjustment is dead code too
    PHP
    REP #$30
    LDA.W TimeIsFrozenFlag : BNE .timeIsFrozen
    JSR DetermineProspectivePoseFromTransitionTable
    LDA.W MovementType : AND.W #$00FF : BNE .return
    LDA.W SamusYPosition : SEC : SBC.W #$0005 : STA.W SamusYPosition
    LDA.W SamusPreviousYPosition : SEC : SBC.W #$0005 : STA.W SamusPreviousYPosition
    BRA .return

  .timeIsFrozen:
    JSL XraySamusPoseInputHandler

  .return:
    PLP
    RTS


;;; $80B6: Normal Samus pose input handler - [Samus movement type] = falling ;;;
NormalSamusPoseInputHandler_Falling:
    PHP
    REP #$30
    JSR DetermineProspectivePoseFromTransitionTable
    PLP
    RTS


if !FEATURE_KEEP_UNREFERENCED
;;; $80BE: Unused ;;;
UNUSED_AutoJumpFromCrouchFall_9180BE:
; Tries to make Samus jump if pressing jump and she's falling straight down but has zero Y speed and she wasn't crouching before she fell...?
; Perhaps an earlier attempt at auto-jump
    LDA.W Pose : CMP.W #$0029 : BEQ .fallingNotAiming
    CMP.W #$002A : BNE .return

  .fallingNotAiming:
    LDA.W LastDifferentPoseMovementType : AND.W #$00FF : CMP.W #$0005 : BEQ .return
    LDA.B DP_Controller1Input : BIT.W #$0300 : BNE .return
    LDA.W SamusYSpeed : BNE .return
    LDA.B DP_Controller1New : BIT.W JumpBinding : BEQ .return
    LDA.W PoseXDirection : AND.W #$00FF : CMP.W #$0004 : BEQ .facingLeft
    LDA.W #$004D : STA.W SpecialProspectivePose
    BRA .command4

  .facingLeft:
    LDA.W #$004E : STA.W SpecialProspectivePose

  .command4:
    LDA.W #$0004 : STA.W SpecialProspectivePoseChangeCommand

  .return:
    PLP
    RTS
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $810A: Normal Samus pose input handler - [Samus movement type] = morph ball - falling ;;;
NormalSamusPoseInputHandler_MorphBall_Falling:
    PHP
    REP #$30
    JSR DetermineProspectivePoseFromTransitionTable
    PLP
    RTS


;;; $8112: RTS. Normal Samus pose input handler - [Samus movement type] = 9 ;;;
RTS_918112:
    RTS


;;; $8113: Normal Samus pose input handler - [Samus movement type] = knockback / crystal flash ending ;;;
NormalSamusPoseInputHandler_Knockback_CrystalFlashEnding:
; Only processes knockback in practice as PoseInputHandler = RTS during crystal flash, so this function never gets called.
; Samus movement type cannot be changed via DetermineProspectivePoseFromTransitionTable... but if it did then Samus would jump(?!).
    PHP
    REP #$30
    JSR DetermineProspectivePoseFromTransitionTable
    LDA.W MovementType : AND.W #$00FF : CMP.W #$000A : BEQ .return
    JSL Make_Samus_Jump
    STZ.W SamusKnockbackTimer

  .return:
    PLP
    RTS


;;; $812D: RTS. Normal Samus pose input handler - [Samus movement type] = Bh ;;;
RTS_91812D:
    PHP
    REP #$30
    PLP
    RTS


;;; $8132: Normal Samus pose input handler - [Samus movement type] = Ch ;;;
NormalSamusPoseInputHandler_C_DetermineProspectivePose:
    PHP
    REP #$30
    JSR DetermineProspectivePoseFromTransitionTable
    PLP
    RTS


;;; $813A: Normal Samus pose input handler - [Samus movement type] = Dh ;;;
NormalSamusPoseInputHandler_D_DetermineProspectivePose:
    PHP
    REP #$30
    JSR DetermineProspectivePoseFromTransitionTable
    PLP
    RTS


;;; $8142: Normal Samus pose input handler - [Samus movement type] = turning around - on ground ;;;
NormalSamusPoseInputHandler_TurningAround_OnGround:
    JSR DetermineProspectivePoseFromTransitionTable
    RTS


;;; $8146: RTS. Normal Samus pose input handler - [Samus movement type] = crouching/standing/morphing/unmorphing transition ;;;
RTS_918146:
    RTS


;;; $8147: Normal Samus pose input handler - [Samus movement type] = moonwalking ;;;
NormalSamusPoseInputHandler_Moonwalking:
    PHP
    REP #$30
    JSR DetermineProspectivePoseFromTransitionTable
    PLP
    RTS


;;; $814F: Normal Samus pose input handler - [Samus movement type] = spring ball - on ground ;;;
NormalSamusPoseInputHandler_SpringBall_OnGround:
    PHP
    REP #$30
    JSR DetermineProspectivePoseFromTransitionTable
    PLP
    RTS


;;; $8157: Normal Samus pose input handler - [Samus movement type] = spring ball - in air ;;;
NormalSamusPoseInputHandler_SpringBall_InAir:
    PHP
    REP #$30
    JSR DetermineProspectivePoseFromTransitionTable
    PLP
    RTS


;;; $815F: Normal Samus pose input handler - [Samus movement type] = spring ball - falling ;;;
NormalSamusPoseInputHandler_SpringBall_Falling:
    PHP
    REP #$30
    JSR DetermineProspectivePoseFromTransitionTable
    PLP
    RTS


;;; $8167: Normal Samus pose input handler - [Samus movement type] = wall jumping ;;;
NormalSamusPoseInputHandler_WallJumping:
    PHP
    REP #$30
    JSR DetermineProspectivePoseFromTransitionTable
    PLP
    RTS


;;; $816F: Normal Samus pose input handler - [Samus movement type] = ran into a wall ;;;
NormalSamusPoseInputHandler_RanIntoAWall:
; Note that this routine is not called when time is frozen (CurrentStateHandler = $E713 during reserve tanks, PoseInputHandler = $E918 during x-ray),
; so the broken call to XraySamusPoseInputHandler is dead code.
    PHP
    REP #$30
    LDA.W TimeIsFrozenFlag : BNE .timeIsFrozen
    JSR DetermineProspectivePoseFromTransitionTable
    BRA .return

  .timeIsFrozen:
    JSR XraySamusPoseInputHandler ; >_<

  .return:
    PLP
    RTS


;;; $8181: Normal Samus pose input handler - [Samus movement type] = grappling ;;;
NormalSamusPoseInputHandler_Grappling:
    PHP
    REP #$30
    JSR DetermineProspectivePoseFromTransitionTable
    PLP
    RTS


;;; $8189: Normal Samus pose input handler - [Samus movement type] = turning around - jumping ;;;
NormalSamusPoseInputHandler_TurningAround_Jumping:
    JSR DetermineProspectivePoseFromTransitionTable
    RTS


;;; $818D: Normal Samus pose input handler - [Samus movement type] = turning around - falling ;;;
NormalSamusPoseInputHandler_TurningAround_Falling:
    JSR DetermineProspectivePoseFromTransitionTable
    RTS


;;; $8191: Normal Samus pose input handler - [Samus movement type] = damage boost ;;;
NormalSamusPoseInputHandler_DamageBoost:
    PHP
    REP #$30
    JSR DetermineProspectivePoseFromTransitionTable
    PLP
    RTS


;;; $8199: Normal Samus pose input handler - [Samus movement type] = grabbed by Draygon ;;;
NormalSamusPoseInputHandler_GrabbedByDraygon:
    PHP
    REP #$30
    JSR DetermineProspectivePoseFromTransitionTable
    PLP
    RTS


;;; $81A1: Normal Samus pose input handler - [Samus movement type] = shinespark / crystal flash / drained by metroid / damaged by MB's attacks ;;;
NormalSamusPoseInputHandler_Shinespark_CF_Drained_DamagedMB:
    PHP
    REP #$30
    JSR DetermineProspectivePoseFromTransitionTable
    PLP
    RTS


;;; $81A9: Determine prospective pose from transition table ;;;
DetermineProspectivePoseFromTransitionTable:
;; Returns:
;;     Carry: Set if pose was found, clear otherwise

; Transition table entries have the format:
;     nnnn cccc pppp
;     nnnn cccc pppp
;     ...
;     FFFF
; where:
;     n is the required newly pressed input, n = FFFF terminates the table entry
;     c is the required held input
;     p is the pose to transition to (if not currently already in that pose)

; Iterate through transition table entry for current pose, if transition found with the required inputs being pressed:
;     If transition pose is the current pose, return carry clear
;     Else, set prospective pose and return carry set
; If pressing nothing or transition table entry is non-empty, execute $91:82D9
; Return carry clear

; $12: The controller 1 input bits *not* newly pressed (not including start/select)
; $14: The controller 1 input bits *not* pressed (not including start/select)
; [[Y]]: Required newly pressed input
; [[Y] + 2]: Required input
; If [[Y]] & [$12/14] != 0 then there were some buttons specified in [[Y]] that are not being pressed
    LDA.B DP_Controller1Input : BEQ .noInput
    JSR TranslateCustomControllerBindingsToDefaultBindings
    LDA.W Pose : ASL : TAX
    LDA.W TransitionTable,X : TAY
    LDA.W $0000,Y : INC : BEQ .notFound

  .loop:
    DEC : BEQ .input
    AND.B DP_Temp12 : BNE .next

  .input:
    LDA.W $0002,Y : BEQ .foundTransition
    AND.B DP_Temp14 : BEQ .foundTransition

  .next:
    TYA : CLC : ADC.W #$0006 : TAY
    LDA.W $0000,Y : INC : BNE .loop

  .noInput:
    STZ.W neverRead0A18
    JSL HandleTransitionTableLookupFailure

  .notFound:
    CLC
    RTS

  .foundTransition:
    LDA.W $0004,Y : CMP.W Pose : BEQ .notFound
    STA.W ProspectivePose
    STZ.W BombJumpDirection
    SEC
    RTS


;;; $81F4: Translate custom controller bindings to default bindings ;;;
TranslateCustomControllerBindingsToDefaultBindings:
;; Returns:
;;     $12: The controller 1 input bits *not* newly pressed (not including start/select)
;;     $14: The controller 1 input bits *not* pressed (not including start/select)

; This contains the evil code that disallows aiming to not be L and R
; $82:F587 handles the graphical part of the controller settings menu
    LDA.B DP_Controller1New : AND.W #$0F00 : STA.B DP_Temp12
    LDA.B DP_Controller1Input : AND.W #$0F00 : STA.B DP_Temp14
    LDA.B DP_Controller1New : BIT.W ShotBinding : BEQ .checkJump12
    LDA.B DP_Temp12 : ORA.W #$0040 : STA.B DP_Temp12
    LDA.B DP_Controller1New

  .checkJump12:
    BIT.W JumpBinding : BEQ .checkRun12
    LDA.B DP_Temp12 : ORA.W #$0080 : STA.B DP_Temp12
    LDA.B DP_Controller1New

  .checkRun12:
    BIT.W DashBinding : BEQ .checkItemCancel12
    LDA.B DP_Temp12 : ORA.W #$8000 : STA.B DP_Temp12
    LDA.B DP_Controller1New

  .checkItemCancel12:
    BIT.W ItemCancelBinding : BEQ .checkAimUp12
    LDA.B DP_Temp12 : ORA.W #$4000 : STA.B DP_Temp12
    LDA.B DP_Controller1New

  .checkAimUp12:
    BIT.W AimUpBinding : BEQ .checkAimDown12
    LDA.W AimUpBinding : BIT.W #$0030 : BEQ .reloadNewInputs
    LDA.B DP_Temp12 : ORA.W #$0010 : STA.B DP_Temp12

  .reloadNewInputs:
    LDA.B DP_Controller1New

  .checkAimDown12:
    BIT.W AimDownBinding : BEQ .checkShot14
    LDA.W AimDownBinding : BIT.W #$0030 : BEQ .checkShot14
    LDA.B DP_Temp12 : ORA.W #$0020 : STA.B DP_Temp12

  .checkShot14:
    LDA.B DP_Temp12 : EOR.W #$FFFF : STA.B DP_Temp12
    LDA.B DP_Controller1Input : BIT.W ShotBinding : BEQ .checkJump14
    LDA.B DP_Temp14 : ORA.W #$0040 : STA.B DP_Temp14
    LDA.B DP_Controller1Input

  .checkJump14:
    BIT.W JumpBinding : BEQ .checkRun14
    LDA.B DP_Temp14 : ORA.W #$0080 : STA.B DP_Temp14
    LDA.B DP_Controller1Input

  .checkRun14:
    BIT.W DashBinding : BEQ .checkItemCancel14
    LDA.B DP_Temp14 : ORA.W #$8000 : STA.B DP_Temp14
    LDA.B DP_Controller1Input

  .checkItemCancel14:
    BIT.W ItemCancelBinding : BEQ .checkAimUp14
    LDA.B DP_Temp14 : ORA.W #$4000 : STA.B DP_Temp14
    LDA.B DP_Controller1Input

  .checkAimUp14:
    BIT.W AimUpBinding : BEQ .checkAimDown14
    LDA.W AimUpBinding : BIT.W #$0030 : BEQ .reloadPressedInputs
    LDA.B DP_Temp14 : ORA.W #$0010 : STA.B DP_Temp14

  .reloadPressedInputs:
    LDA.B DP_Controller1Input

  .checkAimDown14:
    BIT.W AimDownBinding : BEQ .done
    LDA.W AimDownBinding : BIT.W #$0030 : BEQ .done
    LDA.B DP_Temp14 : ORA.W #$0020 : STA.B DP_Temp14

  .done:
    LDA.B DP_Temp14 : EOR.W #$FFFF : STA.B DP_Temp14
    RTS


;;; $82D9: Handle transition table lookup failure ;;;
HandleTransitionTableLookupFailure:
; Also called when grapple beam is disconnected
    PHP : PHB
    PHK : PLB
    REP #$30
    JSR Set_ProspectivePoseChangeCommand
    BCC .consultPoseDefinition

  .retainCurrentPose:
    LDA.W Pose : STA.W ProspectivePose
    BRA .return

  .consultPoseDefinition:
    LDA.W Pose : ASL #3 : TAX
    LDA.W PoseDefinitions_newPose,X : AND.W #$00FF : CMP.W #$00FF : BEQ .retainCurrentPose
    STA.W ProspectivePose

  .return:
    PLB : PLP
    RTL


;;; $8304: Set prospective pose change command ;;;
Set_ProspectivePoseChangeCommand:
;; Returns:
;;     Carry: Set if retaining current pose (i.e. command = decelerate), clear otherwise
    LDA.W MovementType : AND.W #$00FF : TAX
    LDA.W .poseChangeCommands,X : AND.W #$00FF : CMP.W #$0001 : BEQ .decelerate

  .notRetaining:
    STA.W ProspectivePoseChangeCommand
    CLC
    RTS

  .decelerate:
    LDA.W SamusXBaseSpeed : BNE .done
    LDA.W SamusXBaseSubSpeed : BNE .done
    LDA.W #$0002
    BRA .notRetaining

  .done:
    LDA.W #$0001 : STA.W ProspectivePoseChangeCommand
    SEC
    RTS

  .poseChangeCommands:
; Value for prospective pose change command. If 1 and [Samus X base speed] = 0, use 2 instead
    db $02 ; 0: Standing
    db $01 ; 1: Running
    db $01 ; 2: Normal jumping
    db $00 ; 3: Spin jumping
    db $06 ; 4: Morph ball - on ground
    db $02 ; 5: Crouching
    db $08 ; 6: Falling
    db $02 ; 7: Unused
    db $01 ; 8: Morph ball - falling
    db $06 ; 9: Unused
    db $02 ; Ah: Knockback / crystal flash ending
    db $02 ; Bh: Unused
    db $02 ; Ch: Unused
    db $06 ; Dh: Unused
    db $02 ; Eh: Turning around - on ground
    db $02 ; Fh: Crouching/standing/morphing/unmorphing transition
    db $02 ; 10h: Moonwalking
    db $06 ; 11h: Spring ball - on ground
    db $06 ; 12h: Spring ball - in air
    db $06 ; 13h: Spring ball - falling
    db $06 ; 14h: Wall jumping
    db $02 ; 15h: Ran into a wall
    db $06 ; 16h: Grappling
    db $02 ; 17h: Turning around - jumping
    db $02 ; 18h: Turning around - falling
    db $02 ; 19h: Damage boost
    db $02 ; 1Ah: Grabbed by Draygon
    db $02 ; 1Bh: Shinespark / crystal flash / drained by metroid / damaged by MB's attacks


;;; $834E: Enable demo input ;;;
Enable_DemoInput:
    PHP
    REP #$30
    LDA.W #SamusPoseInputHandler_Demo : STA.W PoseInputHandler
    LDA.W #$8000 : TSB.W DemoInput_Enable
    PLP
    RTL


;;; $835F: Disable demo input ;;;
Disable_DemoInput:
    PHP
    REP #$30
    LDA.W #SamusPoseInputHandler_Normal : STA.W PoseInputHandler
    LDA.W #$8000 : TRB.W DemoInput_Enable
    PLP
    RTL


;;; $8370: Clear demo input RAM ;;;
Clear_DemoInput_RAM:
; Called before calling Enable_DemoInput
    PHP
    REP #$30
    PHX
    STZ.W DemoInput_PreInstruction : STZ.W DemoInput_InstructionTimer
    STZ.W DemoInput_InstListPointer : STZ.W DemoInput_Timer
    STZ.W DemoInput_InitParam
    STZ.W DemoInput_Input : STZ.W DemoInput_New
    STZ.W DemoInput_PreviousInput : STZ.W DemoInput_PreviousNew
    STZ.W DemoInput_Enable
    PLX
    PLP
    RTL


;;; $8395: Load demo input object ;;;
Load_DemoInputObject:
;; Parameters:
;;     A: Initialisation parameter
;;     Y: Pointer to demo input object
    PHP : PHB
    PHK : PLB
    REP #$30
    PHX
    STA.W DemoInput_InitParam
    TYX
    LDA.W $0002,X : STA.W DemoInput_PreInstruction
    LDA.W $0004,X : STA.W DemoInput_InstListPointer
    LDA.W #$0001 : STA.W DemoInput_InstructionTimer
    LDA.W #$0000 : STA.W DemoInput_Timer
    JSR.W ($0000,X)
    PLX : PLB : PLP
    RTL


;;; $83BF: RTS ;;;
RTS_9183BF:
    RTS


;;; $83C0: Demo input object handler ;;;
DemoInputObjectHandler:
    PHP : PHB
    PHK : PLB
    REP #$30
    BIT.W DemoInput_Enable : BPL .return
    LDA.W DemoInput_InstListPointer : BEQ .return
    JSR ProcessDemoInputObject
    LDA.W DemoInput_PreviousInput : STA.W PreviousController1InputDrawing
    LDA.W DemoInput_PreviousNew : STA.W PreviousController1NewDrawing
    LDA.W DemoInput_Input : STA.B DP_Controller1Input : STA.W DemoInput_PreviousInput
    LDA.W DemoInput_New : STA.B DP_Controller1New : STA.W DemoInput_PreviousNew

  .return:
    PLB : PLP
    RTL


;;; $83F2: Process demo input object ;;;
ProcessDemoInputObject:
    LDX.W #$0000
    JSR.W (DemoInput_PreInstruction,X)
    DEC.W DemoInput_InstructionTimer : BNE .return
    LDY.W DemoInput_InstListPointer

  .loop:
    LDA.W $0000,Y : BPL .processInput
    STA.B DP_Temp12
    INY #2
    PEA .loop-1
    JMP.W (DP_Temp12)

  .processInput:
    STA.W DemoInput_InstructionTimer
    LDA.W $0002,Y : STA.W DemoInput_Input
    LDA.W $0004,Y : STA.W DemoInput_New
    TYA : CLC : ADC.W #$0006 : STA.W DemoInput_InstListPointer

  .return:
    RTS


;;; $8427: Instruction - delete ;;;
Instruction_DemoInputObject_Delete:
    REP #$30
    STZ.W DemoInput_InstListPointer
    STZ.W DemoInput_Input : STZ.W DemoInput_New
    PLA
    RTS


;;; $8434: Instruction - pre-instruction = [[Y]] ;;;
Instruction_DemoInputObject_PreInstructionInY:
;; Parameters:
;;     Y: Pointer to instruction arguments
;; Returns:
;;     Y: Pointer to next instruction
    REP #$30
    LDA.W $0000,Y : STA.W DemoInput_PreInstruction
    INY #2
    RTS


;;; $843F: Instruction - clear pre-instruction ;;;
Instruction_DemoInputObject_ClearPreInstruction:
    REP #$30
    LDA.W #.return : STA.W DemoInput_PreInstruction

  .return:
    RTS


;;; $8448: Instruction - go to [[Y]] ;;;
Instruction_DemoInputObject_GotoY:
;; Parameters:
;;     Y: Pointer to instruction arguments
;; Returns:
;;     Y: Pointer to next instruction
    REP #$30
    LDA.W $0000,Y : TAY
    RTS


;;; $844F: Instruction - decrement timer and go to [[Y]] if non-zero ;;;
Instruction_DemoInputObject_DecrementTimer_GotoYIfNonZero:
;; Parameters:
;;     Y: Pointer to instruction arguments
;; Returns:
;;     Y: Pointer to next instruction
    REP #$30
    DEC.W DemoInput_Timer : BNE Instruction_DemoInputObject_GotoY
    INY #2
    RTS


;;; $8459: Instruction - timer = [[Y]] ;;;
Instruction_DemoInputObject_TimerInY:
;; Parameters:
;;     Y: Pointer to instruction arguments
;; Returns:
;;     Y: Pointer to next instruction
    REP #$30
    LDA.W $0000,Y : STA.W DemoInput_Timer
    INY #2
    RTS


;;; $8464: Record demo input frame ;;;
RecordDemoInputFrame:
; Controller 2 Y enables recording
    PHP : PHB
    PHK : PLB
    REP #$30
    LDA.W DemoInput_RecordedDuration : AND.W #$7FFF : STA.W Temp_DemoRecorderFrameCounter
    LDA.W #$00E0 : STA.W Temp_DemoRecorderFrameCounterXPosition
    LDA.W #$0038 : STA.W Temp_DemoRecorderFrameCounterYPosition
    JSR Draw_RecordedDemoDuration
    LDA.W DemoInput_RecordedDuration : BMI .return
    BNE .record
    LDA.B DP_Controller2New : BIT.W #$4000 : BEQ .return

  .record:
    LDA.W DemoInput_RecordedDuration : ASL #2 : STA.B DP_Temp12
    ASL : ADC.B DP_Temp12 : TAX
    LDA.B DP_Controller1Input : STA.L DemoRecorder_input,X
    LDA.B DP_Controller1New : STA.L DemoRecorder_new,X
    LDA.W Layer1XPosition : STA.L DemoRecorder_layer1X,X
    LDA.W Layer1YPosition : STA.L DemoRecorder_layer1Y,X
    LDA.W SamusXPosition : STA.L DemoRecorder_SamusX,X
    LDA.W SamusYPosition : STA.L DemoRecorder_SamusY,X
    LDA.W DemoInput_RecordedDuration : INC : CMP.W #$0A00 : BNE .cappedAtA00
    LDA.W #$0000

  .cappedAtA00:
    STA.W DemoInput_RecordedDuration

  .return:
    PLB : PLP
    RTL


;;; $84D5: Pause/terminate/reset demo recorder ;;;
Pause_Terminate_Reset_DemoRecorder:
; Controller 2 X pauses/terminates demo recorder
; Controller 2 A resets demo recorder
    PHP : PHB
    PHK : PLB
    REP #$30
    LDA.B DP_Controller2New : BIT.W #$0040 : BEQ .checkA
    LDA.W DemoInput_RecordedDuration : ASL #2 : STA.B DP_Temp12
    ASL : ADC.B DP_Temp12 : TAX
    LDA.W #$FFFF : STA.L DemoRecorder_input,X : STA.L DemoRecorder_new,X
    STA.L DemoRecorder_layer1X,X : STA.L DemoRecorder_layer1Y,X
    STA.L DemoRecorder_SamusX,X : STA.L DemoRecorder_SamusY,X
    LDA.W DoorBTS : STA.L DemoRecorder_doorBTS
    LDA.W AreaIndex : STA.L DemoRecorder_area
    LDA.W DemoInput_RecordedDuration : ORA.W #$8000 : STA.W DemoInput_RecordedDuration

  .checkA:
    LDA.B DP_Controller2New : BIT.W #$0080 : BEQ .return
    LDA.W #$0000 : STA.W DemoInput_RecordedDuration

  .return:
    PLB : PLP
    RTL


;;; $852F: Draw recorded demo duration ;;;
Draw_RecordedDemoDuration:
;; Parameters:
;;     Temp_DemoRecorderFrameCounterXPosition: X position
;;     Temp_DemoRecorderFrameCounterYPosition: Y position
;;     Temp_DemoRecorderFrameCounter: Recorded demo duration
    LDA.W Temp_DemoRecorderFrameCounterXPosition : CLC : ADC.W #$0000 : STA.B DP_Temp14
    LDA.W Temp_DemoRecorderFrameCounterYPosition : CLC : ADC.W #$0000 : STA.B DP_Temp12
    LDA.W #$0A00 : STA.B DP_Temp26
    LDA.W Temp_DemoRecorderFrameCounter : AND.W #$F000 : XBA : LSR #4 : CLC : ADC.W #$0004
    JSL Add_Debug_Spritemap_to_OAM
    LDA.W Temp_DemoRecorderFrameCounterXPosition : CLC : ADC.W #$0008 : STA.B DP_Temp14
    LDA.W Temp_DemoRecorderFrameCounterYPosition : CLC : ADC.W #$0000 : STA.B DP_Temp12
    LDA.W #$0A00 : STA.B DP_Temp26
    LDA.W Temp_DemoRecorderFrameCounter : AND.W #$0F00 : XBA : CLC : ADC.W #$0004
    JSL Add_Debug_Spritemap_to_OAM
    LDA.W Temp_DemoRecorderFrameCounterXPosition : CLC : ADC.W #$0010 : STA.B DP_Temp14
    LDA.W Temp_DemoRecorderFrameCounterYPosition : CLC : ADC.W #$0000 : STA.B DP_Temp12
    LDA.W #$0A00 : STA.B DP_Temp26
    LDA.W Temp_DemoRecorderFrameCounter : AND.W #$00F0 : LSR #4 : CLC : ADC.W #$0004
    JSL Add_Debug_Spritemap_to_OAM
    LDA.W Temp_DemoRecorderFrameCounterXPosition : CLC : ADC.W #$0018 : STA.B DP_Temp14
    LDA.W #$0A00 : STA.B DP_Temp26
    LDA.W Temp_DemoRecorderFrameCounterYPosition : CLC : ADC.W #$0000 : STA.B DP_Temp12
    LDA.W Temp_DemoRecorderFrameCounter : AND.W #$000F : CLC : ADC.W #$0004
    JSL Add_Debug_Spritemap_to_OAM
    RTS


if !FEATURE_KEEP_UNREFERENCED
;;; $85CE: Instruction list - demo input - demo input object $8778 ;;;
UNUSED_InstList_DemoInput_JumpLeft_GiveControlBack_9185CE:
; For UNUSED_DemoInputObject_Intro_JumpLeft_GiveControlBack_918778
    dw $001E,$0000,$0000 ;
    dw $0001,$0200,$0200 ;       <
    dw $001A,$0200,$0000 ;       <
    dw $0001,$0280,$0080 ;       < A
    dw $0034,$0280,$0000 ;       < A
    dw $001E,$0200,$0000 ;       <
    dw $0049,$0000,$0000
    dw Instruction_EndDemoInput_GiveControlBackToPlayer
    dw Instruction_DemoInputObject_Delete


;;; $85FC: Instruction - end demo input and give control back to player ;;;
Instruction_EndDemoInput_GiveControlBackToPlayer:
    LDA.W #SamusCurrentStateHandler_Normal : STA.W CurrentStateHandler
    LDA.W #SamusNewStateHandler_Normal : STA.W NewStateHandler
    JSL Disable_DemoInput
    RTS
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $860D: Instruction list - demo input - baby metroid discovery - running left ;;;
InstList_DemoInput_BabyMetroidDiscovery_RunningLeft_0:
    dw $005A,$0000,$0000 ;
    dw $0001,$0200,$0200 ;       <

InstList_DemoInput_BabyMetroidDiscovery_RunningLeft_1:
    dw $0001,$0200,$0000 ;       <
    dw Instruction_DemoInputObject_GotoY
    dw InstList_DemoInput_BabyMetroidDiscovery_RunningLeft_1


;;; $8623: Instruction list - demo input - baby metroid discovery - stop and look ;;;
InstList_DemoInput_BabyMetroidDiscovery_StopAndLook_0:
    dw $012C,$0000,$0000 ;
    dw $0001,$0010,$0010 ;            R
    dw $00AA,$0010,$0000 ;            R
    dw $00F0,$0000,$0000 ;
    dw $0001,$0200,$0200 ;       <

InstList_DemoInput_BabyMetroidDiscovery_StopAndLook_1:
    dw $0001,$0200,$0000 ;       <
    dw Instruction_DemoInputObject_GotoY
    dw InstList_DemoInput_BabyMetroidDiscovery_StopAndLook_1


;;; $864B: Instruction list - demo input - baby metroid discovery - end ;;;
InstList_DemoInput_BabyMetroidDiscovery_End:
    dw Instruction_EndDemoInput
    dw Instruction_DemoInputObject_Delete


;;; $864F: Pre-instruction - demo input - baby metroid discovery - running left ;;;
PreInstruction_DemoInput_BabyMetroidDiscovery_RunningLeft:
    LDA.W SamusXPosition : CMP.W #$00B2 : BPL .return
    LDA.W #PreInstruction_DemoInput_BabyMetroidDiscovery_StopAndLook : STA.W DemoInput_PreInstruction
    LDA.W #InstList_DemoInput_BabyMetroidDiscovery_StopAndLook_0 : STA.W DemoInput_InstListPointer
    LDA.W #$0001 : STA.W DemoInput_InstructionTimer

  .return:
    RTS


;;; $866A: Pre-instruction - demo input - baby metroid discovery - stop and look ;;;
PreInstruction_DemoInput_BabyMetroidDiscovery_StopAndLook:
    LDA.W IntroCrossFadeTimer : BNE .return
    LDA.W #RTS_9183BF : STA.W DemoInput_PreInstruction
    LDA.W #InstList_DemoInput_BabyMetroidDiscovery_End : STA.W DemoInput_InstListPointer
    LDA.W #$0001 : STA.W DemoInput_InstructionTimer

  .return:
    RTS


;;; $8682: Instruction - end demo input ;;;
Instruction_EndDemoInput:
    PHX : PHY
    LDA.W #RTL_90E8CD : STA.W CurrentStateHandler : STA.W NewStateHandler
    JSL Disable_DemoInput
    PLY : PLX
    RTS


;;; $8694: Instruction list - demo input - old Mother Brain fight ;;;
InstList_DemoInput_OldMotherBrainFight:
    dw $005A,$0000,$0000 ;
    dw $0001,$0040,$0040 ;          X
    dw $0028,$0040,$0000 ;          X
    dw $0001,$0040,$0040 ;          X
    dw $001D,$0040,$0000 ;          X
    dw $0046,$0000,$0000 ;


if !FEATURE_KEEP_UNREFERENCED
;;; $86B8: Instruction list - demo input - demo input object $878A ;;;
UNUSED_InstList_DemoInput_OldMotherBrainFight_9186B8:
    dw $0014,$0000,$0000 ;
    dw $0001,$0200,$0200 ;       <
    dw $0007,$0200,$0000 ;       <
    dw $0001,$0280,$0080 ;       < A
    dw $0007,$0280,$0000 ;       < A
    dw $0004,$0200,$0000 ;       <
    dw $003C,$0000,$0000 ;
    dw $0001,$0040,$0040 ;          X
    dw $0028,$0040,$0000 ;          X
    dw $0001,$0040,$0040 ;          X
    dw $0013,$0040,$0000 ;          X
    dw Instruction_EndDemoInputWithSamusFacingLeft
    dw Instruction_DemoInputObject_Delete


;;; $86FE: Unused. End demo input with Samus facing left ;;;
UNUSED_Instruction_EndDemoInputWithSamusFacingLeft_9186FE:
; Clone of Instruction_EndDemoInputWithSamusFacingLeft
    PHX : PHY
    LDA.W #SamusCurrentStateHandler_SamusIsLocked : STA.W CurrentStateHandler
    LDA.W #$0002 : STA.W Pose
    JSL InitializeSamusPose_1
    JSL Set_Samus_AnimationFrame_if_PoseChanged
    LDA.W PreviousPose : STA.W LastDifferentPose
    LDA.W PreviousPoseXDirection : STA.W LastDifferentPoseXDirection
    LDA.W Pose : STA.W PreviousPose
    LDA.W PoseXDirection : STA.W PreviousPoseXDirection
    JSL Disable_DemoInput
    LDA.W #RTS_90E90E : STA.W PoseInputHandler
    PLY : PLX
    RTS
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $8739: Instruction - end demo input with Samus facing left ;;;
Instruction_EndDemoInputWithSamusFacingLeft:
    PHX : PHY
    LDA.W #SamusCurrentStateHandler_SamusIsLocked : STA.W CurrentStateHandler
    LDA.W #$0002 : STA.W Pose
    JSL InitializeSamusPose_1
    JSL Set_Samus_AnimationFrame_if_PoseChanged
    LDA.W PreviousPose : STA.W LastDifferentPose
    LDA.W PreviousPoseXDirection : STA.W LastDifferentPoseXDirection
    LDA.W Pose : STA.W PreviousPose
    LDA.W PoseXDirection : STA.W PreviousPoseXDirection
    JSL Disable_DemoInput
    LDA.W #RTS_90E90E : STA.W PoseInputHandler
    PLY : PLX
    RTS


if !FEATURE_KEEP_UNREFERENCED
;;; $8774: Unused. Instruction list - demo input - delete ;;;
UNUSED_InstList_DemoInput_Delete_918774:
    dw Instruction_DemoInputObject_Delete
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $8776: Instruction list - demo input - delete ;;;
InstList_DemoInput_Delete:
    dw Instruction_DemoInputObject_Delete


;;; $8778: Demo input objects - intro ;;;
if !FEATURE_KEEP_UNREFERENCED
UNUSED_DemoInputObject_Intro_JumpLeft_GiveControlBack_918778:
    dw RTS_9183BF                                                        ; Initialisation (RTS)
    dw RTS_9183BF                                                        ; Pre-instruction
    dw UNUSED_InstList_DemoInput_JumpLeft_GiveControlBack_9185CE         ; Pointer to input instruction list
endif ; !FEATURE_KEEP_UNREFERENCED

DemoInputObjects_Intro_BabyMetroidDiscovery:
    dw RTS_9183BF                                                        ; Initialisation (RTS)
    dw PreInstruction_DemoInput_BabyMetroidDiscovery_RunningLeft         ; Pre-instruction
    dw InstList_DemoInput_BabyMetroidDiscovery_RunningLeft_0             ; Pointer to input instruction list

DemoInputObjects_Intro_OldMotherBrainFight:
    dw RTS_9183BF                                                        ; Initialisation (RTS)
    dw RTS_9183BF                                                        ; Pre-instruction
    dw InstList_DemoInput_OldMotherBrainFight                            ; Pointer to input instruction list

if !FEATURE_KEEP_UNREFERENCED
UNUSED_DemoInputObjects_Intro_OldMotherBrainFight_91878A:
    dw RTS_9183BF                                                        ; Initialisation (RTS)
    dw RTS_9183BF                                                        ; Pre-instruction
    dw UNUSED_InstList_DemoInput_OldMotherBrainFight_9186B8              ; Pointer to input instruction list
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $8790: Load demo data ;;;
LoadDemoData:
    LDA.W DemoScene : ASL #4 : STA.B DP_Temp12
    LDA.W DemoSet : ASL : TAX
    LDA.W DemoData_Pointers,X : CLC : ADC.B DP_Temp12 : TAX
    LDA.W $0000,X : STA.W CollectedItems : STA.W EquippedItems
    LDA.W $0002,X : STA.W MaxMissiles : STA.W Missiles
    LDA.W $0004,X : STA.W MaxSuperMissiles : STA.W SuperMissiles
    LDA.W $0006,X : STA.W MaxPowerBombs : STA.W PowerBombs
    LDA.W $0008,X : STA.W MaxEnergy : STA.W Energy
    LDA.W $000A,X : STA.W CollectedBeams
    LDA.W $000C,X : STA.W EquippedBeams
    STZ.W ReserveEnergy
    PHX
    JSL Clear_DemoInput_RAM
    JSL Enable_DemoInput
    PLX
    LDA.W $000E,X : TAY
    JSL Load_DemoInputObject
    LDA.W DemoScene : ASL : STA.B DP_Temp12
    LDA.W DemoSet : ASL : TAX
    LDA.W DemoSamusSetup_Pointers,X : CLC : ADC.B DP_Temp12 : TAX
    LDA.W $0000,X : STA.B DP_Temp12
    PEA .manualReturn-1
    JMP.W (DP_Temp12)

  .manualReturn:
    LDA.W #SamusCurrentStateHandler_Demo : STA.W CurrentStateHandler
    LDA.W #SamusNewStateHandler_TitleDemo : STA.W NewStateHandler
    STZ.W ProspectivePoseChangeCommand : STZ.W SpecialProspectivePoseChangeCommand : STZ.W SuperSpecialProspectivePoseChangeCommand
    JSL LoadSamusSuitPalette
    JSL Update_Beam_Tiles_and_Palette
    LDA.W #$0800 : STA.W UpBinding
    LDA.W #$0400 : STA.W DownBinding
    LDA.W #$0200 : STA.W LeftBinding
    LDA.W #$0100 : STA.W RightBinding
    LDA.W #$0040 : STA.W ShotBinding
    LDA.W #$0080 : STA.W JumpBinding
    LDA.W #$8000 : STA.W DashBinding
    LDA.W #$4000 : STA.W ItemCancelBinding
    LDA.W #$2000 : STA.W ItemSelectBinding
    LDA.W #$0010 : STA.W AimUpBinding
    LDA.W #$0020 : STA.W AimDownBinding
    LDA.W #$0001 : STA.W neverRead09E8 : STA.W SamusPlacementMode
    STZ.W Moonwalk : STZ.W unknown0DF8
    STZ.W neverRead0DFA : STZ.W neverRead0DFC
    RTS


;;; $8885: Demo data ;;;
DemoData_Pointers:
    dw DemoData_Set0
    dw DemoData_Set1
    dw DemoData_Set2
    dw DemoData_Set3

;        ____________________________________________ Equipment
;       |      ______________________________________ Missiles
;       |     |      ________________________________ Super missiles
;       |     |     |      __________________________ Power bombs
;       |     |     |     |      ____________________ Health
;       |     |     |     |     |      ______________ Collected beams
;       |     |     |     |     |     |      ________ Equipped beams
;       |     |     |     |     |     |     |
DemoData_Set0:
    dw $0000,$0000,$0000,$0000,$0063,$0000,$0000
    dw DemoInputObjects_Title_LandingSite

    dw $0004,$0005,$0000,$0000,$0063,$0000,$0000
    dw DemoInputObjects_Title_MissileDoor

    dw $0004,$000F,$0000,$0000,$00C7,$1000,$1000
    dw DemoInputObjects_Title_PreSporeSpawnHall

    dw $2105,$001E,$0005,$0000,$012B,$1004,$1004
    dw DemoInputObjects_Title_SpeedBooster

    dw $6105,$001E,$0005,$0005,$018F,$1006,$1006
    dw DemoInputObjects_Title_GrappleBeam

    dw $0004,$0014,$0000,$0000,$00C7,$1000,$1000
    dw DemoInputObjects_Title_PseudoScrewAttack

DemoData_Set1:
    dw $2105,$001E,$0005,$0000,$012B,$1006,$1006
    dw DemoInputObjects_Title_IceBeam

    dw $0004,$000A,$0000,$0000,$00C7,$0000,$0000
    dw DemoInputObjects_Title_FireFleaRoom

    dw $0004,$0019,$0005,$0000,$00C7,$1000,$1000
    dw DemoInputObjects_Title_BrinstarDiagonalRoom

    dw $E325,$004B,$000F,$000A,$0383,$1000,$1000
    dw DemoInputObjects_Title_LowerNorfairEntrance

    dw $E32D,$0055,$000F,$000A,$03E7,$0000,$0000
    dw DemoInputObjects_Title_ScrewAttack

    dw $E105,$002D,$0005,$0005,$018F,$1000,$1000
    dw DemoInputObjects_Title_Dachora

DemoData_Set2:
    dw $E105,$0037,$0005,$0005,$018F,$1000,$1000
    dw DemoInputObjects_Title_WreckedShipBasement

    dw $F33F,$0055,$000F,$000A,$03E7,$100F,$1000
    dw DemoInputObjects_Title_Shinespark

    dw $0104,$0019,$0005,$0000,$012B,$1004,$1004
    dw DemoInputObjects_Title_EyeDoor

    dw $2105,$001E,$0005,$0000,$012B,$0000,$0000
    dw DemoInputObjects_Title_RedBrinstarElevator

    dw $0104,$0019,$0005,$0000,$012B,$0000,$0000
    dw DemoInputObjects_Title_Kraid

    dw $2105,$001E,$0005,$0005,$012B,$1008,$1008
    dw DemoInputObjects_Title_TourianEntrance

DemoData_Set3:
    dw $F32D,$0055,$000F,$000A,$03E7,$1000,$1000
    dw DemoInputObjects_Title_GauntletEntrance

    dw $F32D,$0055,$000F,$000A,$03E7,$0000,$0000
    dw DemoInputObjects_Title_AdvancedGrappleBeam

    dw $F32D,$0055,$000F,$000A,$03E7,$0000,$0000
    dw DemoInputObjects_Title_IBJ

    dw $F32D,$0055,$000F,$000A,$03E7,$1008,$1008
    dw DemoInputObjects_Title_SBA

    dw $F32D,$0055,$0014,$0014,$03E7,$1000,$1000
    dw DemoInputObjects_Title_CrystalFlash


;;; $89FD: Demo Samus setup function pointers ;;;
DemoSamusSetup_Pointers:
    dw DemoSamusSetup_Set0
    dw DemoSamusSetup_Set1
    dw DemoSamusSetup_Set2
    dw DemoSamusSetup_Set3

DemoSamusSetup_Set0:
    dw DemoSamusSetup_LandingSite
    dw DemoSamusSetup_StandingFacingRight
    dw DemoSamusSetup_StandingFacingRight
    dw DemoSamusSetup_StandingFacingLeft
    dw DemoSamusSetup_StandingFacingRight
    dw DemoSamusSetup_MorphBallFacingLeft

DemoSamusSetup_Set1:
    dw DemoSamusSetup_StandingFacingLeft
    dw DemoSamusSetup_StandingFacingLeft
    dw DemoSamusSetup_StandingFacingRight
    dw DemoSamusSetup_StandingFacingLeft
    dw DemoSamusSetup_StandingFacingRight
    dw DemoSamusSetup_FallingFacingLeft

DemoSamusSetup_Set2:
    dw DemoSamusSetup_StandingFacingLeft
    dw DemoSamusSetup_Shinespark
    dw DemoSamusSetup_StandingFacingRight
    dw DemoSamusSetup_StandingFacingRight
    dw DemoSamusSetup_StandingFacingRight
    dw DemoSamusSetup_StandingFacingRight

DemoSamusSetup_Set3:
    dw DemoSamusSetup_GauntletEntrance
    dw DemoSamusSetup_StandingFacingLeft
    dw DemoSamusSetup_StandingFacingLeft
    dw DemoSamusSetup_StandingFacingRight
    dw DemoSamusSetup_StandingFacingLeft_LowEnergy


;;; $8A33: Demo Samus setup - landing site ;;;
DemoSamusSetup_LandingSite:
    JSL MakeSamusFaceForward
    LDA.W #SamusDrawingHandler_Default : STA.W DrawingHandler
    RTS


;;; $8A3E: Demo Samus setup - morph ball moving left ;;;
DemoSamusSetup_MorphBallFacingLeft:
    LDA.W #$001F
    BRA InitializeSamusWithPoseInA


;;; $8A43: Demo Samus setup - standing facing left - low health ;;;
DemoSamusSetup_StandingFacingLeft_LowEnergy:
    LDA.W #$0014 : STA.W Energy
; fallthrough to DemoSamusSetup_StandingFacingLeft


;;; $8A49: Demo Samus setup - standing facing left ;;;
DemoSamusSetup_StandingFacingLeft:
    LDA.W #$0002
    BRA InitializeSamusWithPoseInA


;;; $8A4E: Demo Samus setup - falling facing left ;;;
DemoSamusSetup_FallingFacingLeft:
    LDA.W #$002A
    BRA InitializeSamusWithPoseInA


;;; $8A53: Demo Samus setup - standing facing right ;;;
DemoSamusSetup_StandingFacingRight:
    LDA.W #$0001
; fallthrough to InitializeSamusWithPoseInA


;;; $8A56: Initialise Samus with pose = [A] ;;;
InitializeSamusWithPoseInA:
;; Parameters:
;;     A: Samus pose
    STA.W Pose
    JSL InitializeSamusPose_1
    JSL Set_Samus_AnimationFrame_if_PoseChanged
    LDA.W #SamusDrawingHandler_Default : STA.W DrawingHandler
    RTS


;;; $8A68: Demo Samus setup - shinespark ;;;
DemoSamusSetup_Shinespark:
    LDA.W #SamusDrawingHandler_Default : STA.W DrawingHandler
    JSL TriggerShinesparkWindup
    LDA.W #$00CD : STA.W Pose
    JSL InitializeSamusPose_1
    JSL Set_Samus_AnimationFrame_if_PoseChanged
    RTS


;;; $8A81: Demo Samus setup - gauntlet entrance ;;;
DemoSamusSetup_GauntletEntrance:
    LDA.W #SamusDrawingHandler_Default : STA.W DrawingHandler
    JSL TriggerShinesparkWindup
    LDA.W #$00CA : STA.W Pose
    JSL InitializeSamusPose_1
    JSL Set_Samus_AnimationFrame_if_PoseChanged
    RTS


;;; $8A9A: RTS ;;;
RTS_918A9A:
    RTS


;;; $8A9B: Pre-instruction - demo input - normal ;;;
PreInstruction_DemoInput_Normal:
    LDA.W GameState : CMP.W #$002C : BNE .return
    LDA.W #InstList_DemoInput_Delete : STA.W DemoInput_InstListPointer
    LDA.W #$0001 : STA.W DemoInput_InstructionTimer

  .return:
    RTS


;;; $8AB0: Pre-instruction - demo input - shinespark ;;;
PreInstruction_DemoInput_Shinespark:
    LDA.W MovementType : AND.W #$00FF : CMP.W #$001A : BEQ .return
    LDA.W #PreInstruction_DemoInput_Normal : STA.W DemoInput_PreInstruction
    LDA.W #UNUSED_InstList_DemoInput_Shinespark_Unseen_919346 : STA.W DemoInput_InstListPointer
    LDA.W #$0001 : STA.W DemoInput_InstructionTimer

  .return:
    RTS


; Format is
;     nnnn iiii IIII
;
; where
;     n: Number of frames
;     i: Current input
;     I: New input

;;; $8ACE: Instruction list - demo input - landing site ;;;
InstList_DemoInput_LandingSite:
    dw $0121,$0000,$0000 ;
    dw $0001,$0200,$0200 ;       <
    dw $0006,$0200,$0000 ;       <
    dw $0001,$0A00,$0800 ;     ^ <
    dw $0003,$0A00,$0000 ;     ^ <
    dw $0013,$0200,$0000 ;       <
    dw $0001,$0280,$0080 ;       < A
    dw $0028,$0280,$0000 ;       < A
    dw $0032,$0200,$0000 ;       <
    dw $0024,$0000,$0000 ;
    dw $0001,$0100,$0100 ;        >
    dw $0005,$0100,$0000 ;        >
    dw $000F,$0000,$0000 ;
    dw $0001,$0200,$0200 ;       <
    dw $0005,$0200,$0000 ;       <
    dw $0022,$0000,$0000 ;
    dw $0001,$0200,$0200 ;       <
    dw $004A,$0200,$0000 ;       <
    dw $0005,$0000,$0000 ;
    dw $0001,$0100,$0100 ;        >
    dw $0005,$0100,$0000 ;        >
    dw $0045,$0000,$0000 ;
    dw $0001,$0200,$0200 ;       <
    dw $0003,$0200,$0000 ;       <
    dw $0001,$8200,$8000 ; B     <
    dw $0049,$8200,$0000 ; B     <
    dw $0001,$8A00,$0800 ; B   ^ <
    dw $0003,$8A00,$0000 ; B   ^ <
    dw $0001,$0200,$0000 ;       <
    dw $0002,$0000,$0000 ;
    dw $0001,$0100,$0100 ;        >
    dw $0007,$0100,$0000 ;        >
    dw $000B,$0000,$0000 ;
    dw $0001,$0010,$0010 ;            R
    dw $001F,$0010,$0000 ;            R
    dw $0001,$0210,$0200 ;       <    R
    dw $0005,$0210,$0000 ;       <    R
    dw $001D,$0010,$0000 ;            R
    dw $0001,$0200,$0200 ;       <
    dw $005E,$0200,$0000 ;       <
    dw $0030,$0000,$0000 ;
    dw $0001,$0200,$0200 ;       <
    dw $002E,$0200,$0000 ;       <
    dw $001F,$0000,$0000 ;
    dw $0001,$0100,$0100 ;        >
    dw $0004,$0100,$0000 ;        >
    dw $0040,$0000,$0000 ;
    dw $0001,$0200,$0200 ;       <
    dw $0004,$0200,$0000 ;       <
    dw $0028,$0000,$0000 ;
    dw $0001,$0040,$0040 ;          X
    dw $0006,$0040,$0000 ;          X
    dw $002B,$0000,$0000 ;
    dw $0001,$0200,$0200 ;       <
    dw $0011,$0200,$0000 ;       <
    dw $0007,$0000,$0000 ;
    dw $0001,$0200,$0200 ;       <
    dw $0004,$0200,$0000 ;       <
    dw $0014,$0100,$0000 ;        >
    dw $0001,$0140,$0040 ;        > X
    dw $0003,$0140,$0000 ;        > X
    dw Instruction_DemoInputObject_Delete


;;; $8C3E: Instruction list - demo input - pseudo screw attack ;;;
InstList_DemoInput_PseudoScrewAttack:
    dw $0016,$0000,$0000 ;
    dw $0001,$0800,$0800 ;     ^
    dw $0003,$0800,$0000 ;     ^
    dw $0005,$0000,$0000 ;
    dw $0001,$0800,$0800 ;     ^
    dw $0006,$0800,$0000 ;     ^
    dw $0016,$0000,$0000 ;
    dw $0001,$0200,$0200 ;       <
    dw $0005,$0200,$0000 ;       <
    dw $000B,$0000,$0000 ;
    dw $0001,$0040,$0040 ;          X
    dw $004E,$0040,$0000 ;          X
    dw $0001,$0240,$0200 ;       <  X
    dw $000D,$0240,$0000 ;       <  X
    dw $0001,$02C0,$0080 ;       < AX
    dw $0014,$02C0,$0000 ;       < AX
    dw $0014,$0240,$0000 ;       <  X
    dw $0020,$0040,$0000 ;          X
    dw $0001,$0140,$0100 ;        > X
    dw $000F,$0140,$0000 ;        > X
    dw $0001,$01C0,$0080 ;        >AX
    dw $0006,$01C0,$0000 ;        >AX
    dw $0002,$00C0,$0000 ;         AX
    dw $0001,$02C0,$0200 ;       < AX
    dw $001E,$02C0,$0000 ;       < AX
    dw $0008,$0240,$0000 ;       <  X
    dw $0006,$0040,$0000 ;          X
    dw $0001,$0140,$0100 ;        > X
    dw $000B,$0140,$0000 ;        > X
    dw $0001,$01C0,$0080 ;        >AX
    dw $0023,$01C0,$0000 ;        >AX
    dw $003A,$0140,$0000 ;        > X
    dw $0001,$01C0,$0080 ;        >AX
    dw $0013,$01C0,$0000 ;        >AX
    dw $0001,$09C0,$0800 ;     ^  >AX
    dw $0002,$01C0,$0000 ;        >AX
    dw $0008,$00C0,$0000 ;         AX
    dw $000D,$0040,$0000 ;          X
    dw $0001,$0240,$0200 ;       <  X
    dw $0029,$0240,$0000 ;       <  X
    dw $0001,$02C0,$0080 ;       < AX
    dw $0007,$02C0,$0000 ;       < AX
    dw $0001,$0AC0,$0800 ;     ^ < AX
    dw $0002,$0AC0,$0000 ;     ^ < AX
    dw $0001,$08C0,$0000 ;     ^   AX
    dw $0001,$01C0,$0100 ;        >AX
    dw $0028,$01C0,$0000 ;        >AX
    dw $0010,$0140,$0000 ;        > X
    dw $0006,$0040,$0000 ;          X
    dw $0001,$00C0,$0080 ;         AX
    dw $0004,$00C0,$0000 ;         AX
    dw $0001,$00E0,$0020 ;         AXL
    dw $0012,$00E0,$0000 ;         AXL
    dw $002A,$0020,$0000 ;           L
    dw $0001,$0120,$0100 ;        >  L
    dw $0002,$0120,$0000 ;        >  L
    dw $0005,$0100,$0000 ;        >
    dw $0008,$0000,$0000 ;
    dw $0001,$0100,$0100 ;        >
    dw $0011,$0100,$0000 ;        >
    dw $0001,$0180,$0080 ;        >A
    dw $000F,$0180,$0000 ;        >A
    dw $0013,$0100,$0000 ;        >
    dw $0001,$8100,$8000 ; B      >
    dw $0029,$8100,$0000 ; B      >
    dw $0001,$8180,$0080 ; B      >A
    dw $0020,$8180,$0000 ; B      >A
    dw $0005,$8080,$0000 ; B       A
    dw $0006,$8000,$0000 ; B
    dw $0001,$0200,$0200 ;       <
    dw $000F,$0200,$0000 ;       <
    dw $0065,$0000,$0000 ;
    dw Instruction_DemoInputObject_Delete


;;; $8DF0: Instruction list - demo input - speed booster ;;;
InstList_DemoInput_SpeedBooster:
    dw $0020,$0000,$0000 ;
    dw $0001,$0200,$0200 ;       <
    dw $0002,$0200,$0000 ;       <
    dw $0001,$8200,$8000 ; B     <
    dw $00EE,$8200,$0000 ; B     <
    dw $0001,$8A00,$0800 ; B   ^ <
    dw $0002,$8200,$0000 ; B     <
    dw $0001,$8100,$0100 ; B      >
    dw $0016,$0100,$0000 ;        >
    dw $0031,$0000,$0000 ;
    dw $0001,$0200,$0200 ;       <
    dw $0005,$0200,$0000 ;       <
    dw $0013,$0000,$0000 ;
    dw $0001,$0040,$0040 ;          X
    dw $0008,$0040,$0000 ;          X
    dw $0011,$0000,$0000 ;
    dw $0001,$0200,$0200 ;       <
    dw $001B,$0200,$0000 ;       <
    dw $0063,$0000,$0000 ;
    dw Instruction_DemoInputObject_Delete


;;; $8E64: Instruction list - demo input - dachora ;;;
InstList_DemoInput_Dachora:
    dw $0008,$0000,$0000 ;
    dw $0001,$0200,$0200 ;       <
    dw $0001,$0200,$0000 ;       <
    dw $010A,$0000,$0000 ;
    dw $0001,$0100,$0100 ;        >
    dw $0004,$0100,$0000 ;        >
    dw $0011,$0000,$0000 ;
    dw $0001,$0200,$0200 ;       <
    dw $0004,$0200,$0000 ;       <
    dw $0038,$0000,$0000 ;
    dw $0001,$0200,$0200 ;       <
    dw $0164,$0200,$0000 ;       <
    dw $011E,$0000,$0000 ;
    dw Instruction_DemoInputObject_Delete


;;; $8EB4: Instruction list - demo input - Red Brinstar -> Crateria elevator ;;;
InstList_DemoInput_RedBrinstarElevator:
    dw $005A,$0000,$0000 ;
    dw $0001,$0100,$0100 ;        >
    dw $000A,$0100,$0000 ;        >
    dw $0001,$0180,$0080 ;        >A
    dw $0006,$0180,$0000 ;        >A
    dw $0011,$0100,$0000 ;        >
    dw $0020,$0000,$0000 ;
    dw $0001,$0200,$0200 ;       <
    dw $0001,$0200,$0000 ;       <
    dw $0001,$0280,$0080 ;       < A
    dw $0014,$0280,$0000 ;       < A
    dw $0003,$0200,$0000 ;       <
    dw $0014,$0000,$0000 ;
    dw $0001,$0100,$0100 ;        >
    dw $0004,$0100,$0000 ;        >
    dw $0048,$0000,$0000 ;
    dw $0001,$0080,$0080 ;         A
    dw $0011,$0080,$0000 ;         A
    dw $0001,$0180,$0100 ;        >A
    dw $000A,$0180,$0000 ;        >A
    dw $0016,$0100,$0000 ;        >
    dw $0200,$0000,$0000 ;
    dw Instruction_DemoInputObject_Delete


;;; $8F3A: Instruction list - demo input - pre Phantoon hall ;;;
InstList_DemoInput_WreckedShipBasement:
    dw $003D,$0000,$0000 ;
    dw $0001,$0100,$0100 ;        >
    dw $0005,$0100,$0000 ;        >
    dw $000F,$0000,$0000 ;
    dw $0001,$0200,$0200 ;       <
    dw $0005,$0200,$0000 ;       <
    dw $0027,$0000,$0000 ;
    dw $0001,$0200,$0200 ;       <
    dw $0066,$0200,$0000 ;       <
    dw $0001,$8200,$8000 ; B     <
    dw $0007,$8200,$0000 ; B     <
    dw $004F,$0200,$0000 ;       <
    dw $0057,$0000,$0000 ;
    dw $0001,$0100,$0100 ;        >
    dw $0002,$0100,$0000 ;        >
    dw $0064,$0000,$0000 ;
    dw $0001,$0100,$0100 ;        >
    dw $004E,$0100,$0000 ;        >
    dw $0001,$8100,$8000 ; B      >
    dw $0017,$8100,$0000 ; B      >
    dw $0006,$0100,$0000 ;        >
    dw $0001,$8100,$8000 ; B      >
    dw $0003,$8100,$0000 ; B      >
    dw $0001,$0100,$0000 ;        >
    dw $0001,$8100,$8000 ; B      >
    dw $0002,$8100,$0000 ; B      >
    dw $0034,$0100,$0000 ;        >
    dw $00A9,$0000,$0000 ;
    dw Instruction_DemoInputObject_Delete


;;; $8FE4: Instruction list - demo input - Lower Norfair entrance ;;;
InstList_DemoInput_LowerNorfairEntrance:
    dw $0013,$0000,$0000 ;
    dw $0001,$0200,$0200 ;       <
    dw $0012,$0200,$0000 ;       <
    dw $0029,$0000,$0000 ;
    dw $0001,$8000,$8000 ; B
    dw $0015,$8000,$0000 ; B
    dw $000B,$0000,$0000 ;
    dw $0001,$8000,$8000 ; B
    dw $001F,$8000,$0000 ; B
    dw $0001,$8200,$0200 ; B     <
    dw $0030,$8200,$0000 ; B     <
    dw $0003,$8000,$0000 ; B
    dw $0001,$8200,$0200 ; B     <
    dw $0007,$8200,$0000 ; B     <
    dw $0045,$8000,$0000 ; B
    dw $0001,$8200,$0200 ; B     <
    dw $0091,$8200,$0000 ; B     <
    dw $000A,$8000,$0000 ; B
    dw $0001,$8200,$0200 ; B     <
    dw $0006,$8200,$0000 ; B     <
    dw $0036,$8000,$0000 ; B
    dw $0001,$8200,$0200 ; B     <
    dw $0090,$8200,$0000 ; B     <
    dw $0011,$0200,$0000 ;       <
    dw $0001,$0280,$0080 ;       < A
    dw $0017,$0280,$0000 ;       < A
    dw $0008,$0080,$0000 ;         A
    dw $0001,$0180,$0100 ;        >A
    dw $000E,$0180,$0000 ;        >A
    dw $000F,$0100,$0000 ;        >
    dw $0002,$0000,$0000 ;
    dw $0001,$0080,$0080 ;         A
    dw $001C,$0080,$0000 ;         A
    dw $0001,$0280,$0200 ;       < A
    dw $000C,$0280,$0000 ;       < A
    dw $0002,$0200,$0000 ;       <
    dw $000F,$0000,$0000 ;
    dw $0001,$0080,$0080 ;         A
    dw $0011,$0080,$0000 ;         A
    dw $0001,$0180,$0100 ;        >A
    dw $000F,$0180,$0000 ;        >A
    dw $0002,$0080,$0000 ;         A
    dw $0010,$0000,$0000 ;
    dw $0001,$0080,$0080 ;         A
    dw $0001,$0280,$0200 ;       < A
    dw $0014,$0280,$0000 ;       < A
    dw $0015,$0200,$0000 ;       <
    dw $0001,$8200,$8000 ; B     <
    dw $000E,$8200,$0000 ; B     <
    dw $0006,$0200,$0000 ;       <
    dw $0001,$0280,$0080 ;       < A
    dw $0004,$0280,$0000 ;       < A
    dw $0011,$0200,$0000 ;       <
    dw $0001,$8200,$8000 ; B     <
    dw $0024,$8200,$0000 ; B     <
    dw $0002,$0200,$0000 ;       <
    dw $0014,$0200,$0000 ;       <
    dw $0007,$0000,$0000 ;
    dw $0001,$0100,$0100 ;        >
    dw $0009,$0100,$0000 ;        >
    dw $002D,$0000,$0000 ;
    dw Instruction_DemoInputObject_Delete


;;; $9154: Instruction list - demo input - eye door ;;;
InstList_DemoInput_EyeDoor:
    dw $000B,$0100,$0000 ;        >
    dw $0017,$0000,$0000 ;
    dw $0001,$0040,$0040 ;          X
    dw $0008,$0040,$0000 ;          X
    dw $0004,$0000,$0000 ;
    dw $0001,$0100,$0100 ;        >
    dw $0002,$0100,$0000 ;        >
    dw $000C,$0000,$0000 ;
    dw $0001,$2000,$2000 ;   s
    dw $0006,$2000,$0000 ;   s
    dw $000D,$0000,$0000 ;
    dw $0001,$0100,$0100 ;        >
    dw $000A,$0100,$0000 ;        >
    dw $0001,$0180,$0080 ;        >A
    dw $0006,$0180,$0000 ;        >A
    dw $000E,$0100,$0000 ;        >
    dw $0010,$0000,$0000 ;
    dw $0001,$0100,$0100 ;        >
    dw $0002,$0100,$0000 ;        >
    dw $0001,$0180,$0080 ;        >A
    dw $0006,$0180,$0000 ;        >A
    dw $000D,$0100,$0000 ;        >
    dw $0010,$0000,$0000 ;
    dw $0001,$0100,$0100 ;        >
    dw $0002,$0100,$0000 ;        >
    dw $0001,$0180,$0080 ;        >A
    dw $0008,$0180,$0000 ;        >A
    dw $001C,$0100,$0000 ;        >
    dw $0020,$0000,$0000 ;
    dw $0001,$0100,$0100 ;        >
    dw $0001,$0180,$0080 ;        >A
    dw $000B,$0180,$0000 ;        >A
    dw $0012,$0100,$0000 ;        >
    dw $0016,$0000,$0000 ;
    dw $0001,$0100,$0100 ;        >
    dw $0006,$0100,$0000 ;        >
    dw $0028,$0000,$0000 ;
    dw $0001,$0100,$0100 ;        >
    dw $0006,$0100,$0000 ;        >
    dw $0001,$0180,$0080 ;        >A
    dw $0008,$0180,$0000 ;        >A
    dw $0017,$0100,$0000 ;        >
    dw $000F,$0000,$0000 ;
    dw $0001,$0080,$0080 ;         A
    dw $0006,$0080,$0000 ;         A
    dw $000A,$0000,$0000 ;
    dw $0001,$0040,$0040 ;          X
    dw $0006,$0040,$0000 ;          X
    dw $0025,$0000,$0000 ;
    dw $0001,$0200,$0200 ;       <
    dw $0007,$0200,$0000 ;       <
    dw $0008,$0000,$0000 ;
    dw $0001,$0100,$0100 ;        >
    dw $0007,$0100,$0000 ;        >
    dw $0052,$0000,$0000 ;
    dw $0001,$0080,$0080 ;         A
    dw $0007,$0080,$0000 ;         A
    dw $0011,$0000,$0000 ;
    dw $0001,$0040,$0040 ;          X
    dw $0004,$0040,$0000 ;          X
    dw $000C,$0000,$0000 ;
    dw $0001,$0080,$0080 ;         A
    dw $000B,$0080,$0000 ;         A
    dw $001E,$0000,$0000 ;
    dw $0001,$0040,$0040 ;          X
    dw $0006,$0040,$0000 ;          X
    dw $000D,$0000,$0000 ;
    dw $0001,$0080,$0080 ;         A
    dw $0005,$0080,$0000 ;         A
    dw $000D,$0000,$0000 ;
    dw $0001,$0040,$0040 ;          X
    dw $0006,$0040,$0000 ;          X
    dw $007C,$0000,$0000 ;
    dw $0001,$0200,$0200 ;       <
    dw $0007,$0200,$0000 ;       <
    dw $0011,$0000,$0000 ;
    dw $0001,$0100,$0100 ;        >
    dw $0009,$0100,$0000 ;        >
    dw $0001,$0140,$0040 ;        > X
    dw $0003,$0140,$0000 ;        > X
    dw $0004,$0100,$0000 ;        >
    dw Instruction_DemoInputObject_Delete


;;; $933C: Instruction list - demo input - shinespark ;;;
InstList_DemoInput_Shinespark:
    dw $00A5,$0000,$0000 ;
    dw Instruction_DemoInputObject_GotoY
    dw InstList_DemoInput_Shinespark


;;; $9346: Instruction list - demo input - shinespark - unseen section ;;;
UNUSED_InstList_DemoInput_Shinespark_Unseen_919346:
; The demo timer expires before these inputs are used
    dw $0096,$0000,$0000 ;
    dw $0001,$0200,$0200 ;       <
    dw $00CC,$0200,$0000 ;       <
    dw $0001,$8200,$8000 ; B     <
    dw $0076,$8200,$0000 ; B     <
    dw $0002,$8000,$0000 ; B
    dw $0001,$8100,$0100 ; B      >
    dw $00B6,$8100,$0000 ; B      >
    dw $000C,$0100,$0000 ;        >
    dw $0001,$0180,$0080 ;        >A
    dw $0006,$0180,$0000 ;        >A
    dw $000E,$0100,$0000 ;        >
    dw $0024,$0000,$0000 ;
    dw $0001,$2000,$2000 ;   s
    dw $0005,$2000,$0000 ;   s
    dw $000B,$0000,$0000 ;
    dw $0001,$2000,$2000 ;   s
    dw $0004,$2000,$0000 ;   s
    dw $000E,$0000,$0000 ;
    dw $0001,$0040,$0040 ;          X
    dw $0007,$0040,$0000 ;          X
    dw $00F0,$0000,$0000 ;
    dw Instruction_DemoInputObject_Delete


;;; $93CC: Instruction list - demo input - missile door ;;;
InstList_DemoInput_MissileDoor:
    dw $0029,$0000,$0000 ;
    dw $0001,$0100,$0100 ;        >
    dw $0031,$0100,$0000 ;        >
    dw $0044,$0000,$0000 ;
    dw $0001,$2000,$2000 ;   s
    dw $0005,$2000,$0000 ;   s
    dw $0023,$0000,$0000 ;
    dw $0001,$0040,$0040 ;          X
    dw $0008,$0040,$0000 ;          X
    dw $000A,$0000,$0000 ;
    dw $0001,$0040,$0040 ;          X
    dw $0008,$0040,$0000 ;          X
    dw $0011,$0000,$0000 ;
    dw $0001,$0040,$0040 ;          X
    dw $0007,$0040,$0000 ;          X
    dw $000D,$0000,$0000 ;
    dw $0001,$0040,$0040 ;          X
    dw $0008,$0040,$0000 ;          X
    dw $0007,$0000,$0000 ;
    dw $0001,$0040,$0040 ;          X
    dw $0009,$0040,$0000 ;          X
    dw $0020,$0000,$0000 ;
    dw $0001,$8100,$8100 ; B      >
    dw $0011,$8100,$0000 ; B      >
    dw $001A,$0000,$0000 ;
    dw Instruction_DemoInputObject_Delete


;;; $9464: Instruction list - demo input - Kraid ;;;
InstList_DemoInput_Kraid:
    dw $0200,$0000,$0000 ;
    dw Instruction_DemoInputObject_Delete


;;; $946C: Instruction list - demo input - fireflea room ;;;
InstList_DemoInput_FireFleaRoom:
    dw $002B,$0000,$0000 ;
    dw $0001,$0200,$0200 ;       <
    dw $0046,$0200,$0000 ;       <
    dw $0037,$0000,$0000 ;
    dw $0001,$0200,$0200 ;       <
    dw $000C,$0200,$0000 ;       <
    dw $0001,$0280,$0080 ;       < A
    dw $0013,$0280,$0000 ;       < A
    dw $0013,$0200,$0000 ;       <
    dw $0001,$0240,$0040 ;       <  X
    dw $000B,$0240,$0000 ;       <  X
    dw $0005,$0200,$0000 ;       <
    dw $0001,$0280,$0080 ;       < A
    dw $0015,$0280,$0000 ;       < A
    dw $0025,$0200,$0000 ;       <
    dw $0001,$0280,$0080 ;       < A
    dw $000E,$0280,$0000 ;       < A
    dw $0021,$0200,$0000 ;       <
    dw $0001,$0280,$0080 ;       < A
    dw $0009,$0280,$0000 ;       < A
    dw $001D,$0200,$0000 ;       <
    dw $0008,$0000,$0000 ;
    dw $0001,$0020,$0020 ;           L
    dw $0001,$0020,$0000 ;           L
    dw $0001,$0420,$0400 ;      v    L
    dw $00C4,$0020,$0000 ;           L
    dw Instruction_DemoInputObject_Delete


;;; $950A: Instruction list - demo input - screw attack ;;;
InstList_DemoInput_ScrewAttack:
    dw $0030,$0000,$0000 ;
    dw $0001,$8100,$8100 ; B      >
    dw $001E,$8100,$0000 ; B      >
    dw $0001,$8180,$0080 ; B      >A
    dw $000C,$8180,$0000 ; B      >A
    dw $001C,$8100,$0000 ; B      >
    dw $0001,$8180,$0080 ; B      >A
    dw $0017,$8180,$0000 ; B      >A
    dw $002B,$8100,$0000 ; B      >
    dw $0001,$0400,$0400 ;      v
    dw $0003,$0000,$0000 ;
    dw $0001,$0200,$0200 ;       <
    dw $0001,$0210,$0010 ;       <    R
    dw $009D,$0010,$0000 ;            R
    dw Instruction_DemoInputObject_Delete


;;; $9560: Instruction list - demo input - Brinstar diagonal room ;;;
InstList_DemoInput_BrinstarDiagonalRoom:
    dw $0029,$0000,$0000 ;
    dw $0001,$0100,$0100 ;        >
    dw $0012,$0100,$0000 ;        >
    dw $0001,$0180,$0080 ;        >A
    dw $0016,$0180,$0000 ;        >A
    dw $0041,$0100,$0000 ;        >
    dw $0014,$0000,$0000 ;
    dw $0001,$0010,$0010 ;            R
    dw $000A,$0010,$0000 ;            R
    dw $0001,$0050,$0040 ;          X R
    dw $001D,$0050,$0000 ;          X R
    dw $0005,$0040,$0000 ;          X
    dw $0001,$0440,$0400 ;      v   X
    dw $0037,$0440,$0000 ;      v   X
    dw $00DB,$0000,$0000 ;
    dw Instruction_DemoInputObject_Delete


if !FEATURE_KEEP_UNREFERENCED
;;; $95BC: Instruction list - demo input - unused ;;;
UNUSED_InstList_DemoInput_9195BC:
    dw $0029,$0000,$0000 ;
    dw $0001,$0200,$0200 ;       <
    dw $0018,$0200,$0000 ;       <
    dw $0011,$0000,$0000 ;
    dw $0001,$0080,$0080 ;         A
    dw $0018,$0080,$0000 ;         A
    dw $0001,$0280,$0200 ;       < A
    dw $0005,$0280,$0000 ;       < A
    dw $0010,$0200,$0000 ;       <
    dw $0020,$0000,$0000 ;
    dw $0001,$0080,$0080 ;         A
    dw $0009,$0080,$0000 ;         A
    dw $0001,$0280,$0200 ;       < A
    dw $0015,$0280,$0000 ;       < A
    dw $0016,$0200,$0000 ;       <
    dw $0014,$0000,$0000 ;
    dw $0001,$0100,$0100 ;        >
    dw $0007,$0100,$0000 ;        >
    dw $0001,$0180,$0080 ;        >A
    dw $0018,$0180,$0000 ;        >A
    dw $001D,$0100,$0000 ;        >
    dw $0010,$0000,$0000 ;
    dw $0001,$0400,$0400 ;      v
    dw $0005,$0400,$0000 ;      v
    dw $0001,$0600,$0200 ;      v<
    dw $0096,$0000,$0000 ;
    dw Instruction_DemoInputObject_Delete
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $965A: Instruction list - demo input - pre Spore Spawn hall ;;;
InstList_DemoInput_PreSporeSpawnHall:
    dw $001B,$0000,$0000 ;
    dw $0001,$0200,$0200 ;       <
    dw $0005,$0200,$0000 ;       <
    dw $000F,$0000,$0000 ;
    dw $0001,$0100,$0100 ;        >
    dw $0005,$0100,$0000 ;        >
    dw $0010,$0000,$0000 ;
    dw $0001,$0100,$0100 ;        >
    dw $000D,$0100,$0000 ;        >
    dw $002A,$0100,$0000 ;        >
    dw $0007,$0000,$0000 ;
    dw $0001,$0080,$0080 ;         A
    dw $0015,$0080,$0000 ;         A
    dw $001E,$0000,$0000 ;
    dw $0001,$0200,$0200 ;       <
    dw $0013,$0200,$0000 ;       <
    dw $0010,$0000,$0000 ;
    dw $0001,$0100,$0100 ;        >
    dw $0008,$0100,$0000 ;        >
    dw $0001,$0180,$0080 ;        >A
    dw $000F,$0180,$0000 ;        >A
    dw $0001,$0080,$0000 ;         A
    dw $0001,$0280,$0200 ;       < A
    dw $0007,$0280,$0000 ;       < A
    dw $0004,$0200,$0000 ;       <
    dw $0001,$0000,$0000 ;
    dw $0001,$0100,$0100 ;        >
    dw $0004,$0100,$0000 ;        >
    dw $0001,$0140,$0040 ;        > X
    dw $0009,$0140,$0000 ;        > X
    dw $0005,$0140,$0000 ;        > X
    dw $004C,$0040,$0000 ;          X
    dw $0001,$0440,$0400 ;      v   X
    dw $0003,$0040,$0000 ;          X
    dw $0001,$0050,$0010 ;          X R
    dw $0004,$0050,$0000 ;          X R
    dw $0084,$0010,$0000 ;            R
    dw Instruction_DemoInputObject_Delete


;;; $973A: Instruction list - demo input - grapple beam ;;;
InstList_DemoInput_GrappleBeam:
    dw $0010,$0000,$0000 ;
    dw $0001,$2000,$2000 ;   s
    dw $000C,$0000,$0000 ;
    dw $0001,$2000,$2000 ;   s
    dw $000C,$0000,$0000 ;
    dw $0001,$2000,$2000 ;   s
    dw $000C,$0000,$0000 ;
    dw $0001,$2000,$2000 ;   s
    dw $000C,$0000,$0000 ;
    dw $0001,$0010,$0010 ;            R
    dw $0022,$0010,$0000 ;            R
    dw $0001,$0050,$0040 ;          X R
    dw $0010,$0050,$0000 ;          X R
    dw $0001,$0650,$0600 ;      v<  X R
    dw $0006,$0650,$0000 ;      v<  X R
    dw $000C,$0450,$0000 ;      v   X R
    dw $0001,$0550,$0100 ;      v > X R
    dw $0004,$0550,$0000 ;      v > X R
    dw $0012,$0150,$0000 ;        > X R
    dw $0006,$0110,$0000 ;        >   R
    dw $0001,$0150,$0040 ;        > X R
    dw $0007,$0150,$0000 ;        > X R
    dw $0001,$0550,$0400 ;      v > X R
    dw $0004,$0550,$0000 ;      v > X R
    dw $0016,$0450,$0000 ;      v   X R
    dw $0001,$0550,$0100 ;      v > X R
    dw $0005,$0550,$0000 ;      v > X R
    dw $000B,$0150,$0000 ;        > X R
    dw $0007,$0110,$0000 ;        >   R
    dw $0001,$0150,$0040 ;        > X R
    dw $000A,$0150,$0000 ;        > X R
    dw $0001,$0550,$0400 ;      v > X R
    dw $000C,$0550,$0000 ;      v > X R
    dw $000E,$0150,$0000 ;        > X R
    dw $000A,$0110,$0000 ;        >   R
    dw $0001,$0150,$0040 ;        > X R
    dw $0008,$0150,$0000 ;        > X R
    dw $0001,$0550,$0400 ;      v > X R
    dw $000C,$0550,$0000 ;      v > X R
    dw $000E,$0150,$0000 ;        > X R
    dw $000A,$0110,$0000 ;        >   R
    dw $0001,$0150,$0040 ;        > X R
    dw $0008,$0150,$0000 ;        > X R
    dw $0001,$0550,$0400 ;      v > X R
    dw $000D,$0550,$0000 ;      v > X R
    dw $000E,$0150,$0000 ;        > X R
    dw $000A,$0110,$0000 ;        >   R
    dw $0001,$0150,$0040 ;        > X R
    dw $0009,$0150,$0000 ;        > X R
    dw $0001,$0550,$0400 ;      v > X R
    dw $000C,$0550,$0000 ;      v > X R
    dw $0008,$0150,$0000 ;        > X R
    dw $0004,$0100,$0000 ;        >
    dw $0020,$0000,$0000 ;
    dw $0001,$0400,$0400 ;      v
    dw $0005,$0400,$0000 ;      v
    dw $0001,$0200,$0200 ;       <
    dw $0005,$0200,$0000 ;       <
    dw $0028,$0000,$0000 ;
    dw Instruction_DemoInputObject_Delete


;;; $989E: Instruction list - demo input - ice beam ;;;
InstList_DemoInput_IceBeam:
    dw $0021,$0000,$0000 ;
    dw $0001,$0040,$0040 ;          X
    dw $0005,$0040,$0000 ;          X
    dw $0006,$0000,$0000 ;
    dw $0001,$0040,$0040 ;          X
    dw $0005,$0040,$0000 ;          X
    dw $0012,$0000,$0000 ;
    dw $0001,$0200,$0200 ;       <
    dw $0017,$0200,$0000 ;       <
    dw $001C,$0000,$0000 ;
    dw $0001,$0080,$0080 ;         A
    dw $000E,$0080,$0000 ;         A
    dw $0001,$0480,$0400 ;      v  A
    dw $0005,$0480,$0000 ;      v  A
    dw $000B,$0400,$0000 ;      v
    dw $0001,$0440,$0040 ;      v   X
    dw $0006,$0440,$0000 ;      v   X
    dw $0008,$0400,$0000 ;      v
    dw $0007,$0000,$0000 ;
    dw $0001,$0200,$0200 ;       <
    dw $001D,$0200,$0000 ;       <
    dw $0009,$0000,$0000 ;
    dw $0001,$0200,$0200 ;       <
    dw $000E,$0200,$0000 ;       <
    dw $0001,$0280,$0080 ;       < A
    dw $001D,$0280,$0000 ;       < A
    dw $0038,$0200,$0000 ;       <
    dw $0001,$0280,$0080 ;       < A
    dw $0016,$0280,$0000 ;       < A
    dw $002B,$0200,$0000 ;       <
    dw $0001,$0080,$0080 ;         A
    dw $0010,$0080,$0000 ;         A
    dw $0001,$0480,$0400 ;      v  A
    dw $0008,$0480,$0000 ;      v  A
    dw $0005,$0400,$0000 ;      v
    dw $0001,$0440,$0040 ;      v   X
    dw $0008,$0440,$0000 ;      v   X
    dw $0008,$0400,$0000 ;      v
    dw $0008,$0000,$0000 ;
    dw $0001,$0200,$0200 ;       <
    dw $002B,$0200,$0000 ;       <
    dw $0001,$0280,$0080 ;       < A
    dw $0010,$0280,$0000 ;       < A
    dw $0012,$0200,$0000 ;       <
    dw $005D,$0000,$0000 ;
    dw Instruction_DemoInputObject_Delete


;;; $99AE: Instruction list - demo input - gauntlet entrance ;;;
InstList_DemoInput_GauntletEntrance:
    dw $0016,$0000,$0000 ;
    dw $0001,$0100,$0100 ;        >
    dw $0005,$0100,$0000 ;        >
    dw $0100,$0000,$0000 ;
    dw Instruction_DemoInputObject_Delete


;;; $99C8: Instruction list - demo input - advanced grapple beam ;;;
InstList_DemoInput_AdvancedGrappleBeam:
    dw $003F,$0000,$0000 ;
    dw $0001,$0100,$0100 ;        >
    dw $0005,$0100,$0000 ;        >
    dw $001E,$0000,$0000 ;
    dw $0001,$0200,$0200 ;       <
    dw $0005,$0200,$0000 ;       <
    dw $0016,$0000,$0000 ;
    dw $0001,$2000,$2000 ;   s
    dw $0004,$2000,$0000 ;   s
    dw $000D,$0000,$0000 ;
    dw $0001,$2000,$2000 ;   s
    dw $0005,$2000,$0000 ;   s
    dw $0008,$0000,$0000 ;
    dw $0001,$2000,$2000 ;   s
    dw $0006,$2000,$0000 ;   s
    dw $0007,$0000,$0000 ;
    dw $0001,$2000,$2000 ;   s
    dw $0005,$2000,$0000 ;   s
    dw $002F,$0000,$0000 ;
    dw $0001,$0200,$0200 ;       <
    dw $0014,$0200,$0000 ;       <
    dw $0002,$0000,$0000 ;
    dw $0001,$0100,$0100 ;        >
    dw $0006,$0100,$0000 ;        >
    dw $0009,$0000,$0000 ;
    dw $0001,$0040,$0040 ;          X
    dw $0019,$0040,$0000 ;          X
    dw $0001,$0440,$0400 ;      v   X
    dw $0005,$0440,$0000 ;      v   X
    dw $0001,$0540,$0100 ;      v > X
    dw $0002,$0540,$0000 ;      v > X
    dw $0006,$0140,$0000 ;        > X
    dw $0027,$0040,$0000 ;          X
    dw $0001,$0240,$0200 ;       <  X
    dw $000D,$0240,$0000 ;       <  X
    dw $0034,$0040,$0000 ;          X
    dw $0001,$0140,$0100 ;        > X
    dw $0007,$0140,$0000 ;        > X
    dw $0037,$0040,$0000 ;          X
    dw $0001,$0240,$0200 ;       <  X
    dw $000F,$0240,$0000 ;       <  X
    dw $002F,$0040,$0000 ;          X
    dw $0001,$0140,$0100 ;        > X
    dw $00B1,$0140,$0000 ;        > X
    dw $0001,$01C0,$0080 ;        >AX
    dw $000B,$01C0,$0000 ;        >AX
    dw $00BA,$0180,$0000 ;        >A
    dw $0003,$0100,$0000 ;        >
    dw $0046,$0000,$0000 ;
    dw Instruction_DemoInputObject_Delete


;;; $9AF0: Instruction list - demo input - IBJ ;;;
InstList_DemoInput_IBJ:
    dw $0019,$0000,$0000 ;
    dw $0001,$0100,$0100 ;        >
    dw $0022,$0100,$0000 ;        >
    dw $0018,$0000,$0000 ;
    dw $0001,$0080,$0080 ;         A
    dw $000B,$0080,$0000 ;         A
    dw $0001,$0480,$0400 ;      v  A
    dw $0007,$0480,$0000 ;      v  A
    dw $0002,$0080,$0000 ;         A
    dw $0001,$0480,$0400 ;      v  A
    dw $0008,$0480,$0000 ;      v  A
    dw $0001,$04C0,$0040 ;      v  AX
    dw $0003,$04C0,$0000 ;      v  AX
    dw $000A,$00C0,$0000 ;         AX
    dw $0002,$0080,$0000 ;         A
    dw $0020,$0000,$0000 ;
    dw $0001,$0040,$0040 ;          X
    dw $000B,$0040,$0000 ;          X
    dw $0025,$0000,$0000 ;
    dw $0001,$0040,$0040 ;          X
    dw $0009,$0040,$0000 ;          X
    dw $0026,$0000,$0000 ;
    dw $0001,$0040,$0040 ;          X
    dw $0009,$0040,$0000 ;          X
    dw $0026,$0000,$0000 ;
    dw $0001,$0040,$0040 ;          X
    dw $0008,$0040,$0000 ;          X
    dw $0027,$0000,$0000 ;
    dw $0001,$0040,$0040 ;          X
    dw $0009,$0040,$0000 ;          X
    dw $0028,$0000,$0000 ;
    dw $0001,$0040,$0040 ;          X
    dw $0008,$0040,$0000 ;          X
    dw $0028,$0000,$0000 ;
    dw $0001,$0040,$0040 ;          X
    dw $0009,$0040,$0000 ;          X
    dw $0026,$0000,$0000 ;
    dw $0001,$0040,$0040 ;          X
    dw $0008,$0040,$0000 ;          X
    dw $0028,$0000,$0000 ;
    dw $0001,$0040,$0040 ;          X
    dw $0007,$0040,$0000 ;          X
    dw $0029,$0000,$0000 ;
    dw $0001,$0040,$0040 ;          X
    dw $0007,$0040,$0000 ;          X
    dw $0029,$0000,$0000 ;
    dw $0001,$0040,$0040 ;          X
    dw $0007,$0040,$0000 ;          X
    dw $0028,$0000,$0000 ;
    dw $0001,$0040,$0040 ;          X
    dw $0008,$0040,$0000 ;          X
    dw $0027,$0000,$0000 ;
    dw $0001,$0040,$0040 ;          X
    dw $0007,$0040,$0000 ;          X
    dw $002A,$0000,$0000 ;
    dw $0001,$0040,$0040 ;          X
    dw $0007,$0040,$0000 ;          X
    dw $002A,$0000,$0000 ;
    dw $0001,$0040,$0040 ;          X
    dw $0007,$0040,$0000 ;          X
    dw $0028,$0000,$0000 ;
    dw $0001,$0040,$0040 ;          X
    dw $0007,$0040,$0000 ;          X
    dw $0028,$0000,$0000 ;
    dw $0001,$0040,$0040 ;          X
    dw $0007,$0040,$0000 ;          X
    dw $0010,$0000,$0000 ;
    dw $0001,$0100,$0100 ;        >
    dw $001E,$0100,$0000 ;        >
    dw $0017,$0000,$0000 ;
    dw $0001,$0800,$0800 ;     ^
    dw $0009,$0800,$0000 ;     ^
    dw $0008,$0000,$0000 ;
    dw $0001,$0800,$0800 ;     ^
    dw $0005,$0800,$0000 ;     ^
    dw $0001,$0000,$0000 ;
    dw $0001,$0800,$0800 ;     ^
    dw $0009,$0000,$0000 ;
    dw $0001,$0200,$0200 ;       <
    dw $0004,$0200,$0000 ;       <
    dw $00C4,$0000,$0000 ;
    dw Instruction_DemoInputObject_Delete


;;; $9CD8: Instruction list - demo input - SBA ;;;
InstList_DemoInput_SBA:
    dw $001A,$0000,$0000 ;
    dw $0001,$2000,$2000 ;   s
    dw $0008,$2000,$0000 ;   s
    dw $0006,$0000,$0000 ;
    dw $0001,$2000,$2000 ;   s
    dw $0006,$2000,$0000 ;   s
    dw $0006,$0000,$0000 ;
    dw $0001,$2000,$2000 ;   s
    dw $0006,$2000,$0000 ;   s
    dw $0008,$0000,$0000 ;
    dw $0001,$0080,$0080 ;         A
    dw $0003,$0080,$0000 ;         A
    dw $0001,$0180,$0100 ;        >A
    dw $0023,$0180,$0000 ;        >A
    dw $0007,$0100,$0000 ;        >
    dw $0010,$0000,$0000 ;
    dw $0001,$0080,$0080 ;         A
    dw $0010,$0080,$0000 ;         A
    dw $0001,$0280,$0200 ;       < A
    dw $0007,$0280,$0000 ;       < A
    dw $0001,$02C0,$0040 ;       < AX
    dw $0004,$02C0,$0000 ;       < AX
    dw $000E,$0240,$0000 ;       <  X
    dw $0010,$0040,$0000 ;          X
    dw $0001,$00C0,$0080 ;         AX
    dw $0008,$00C0,$0000 ;         AX
    dw $0001,$01C0,$0100 ;        >AX
    dw $000B,$01C0,$0000 ;        >AX
    dw $0014,$0140,$0000 ;        > X
    dw $0015,$0040,$0000 ;          X
    dw $0001,$0440,$0400 ;      v   X
    dw $0006,$0440,$0000 ;      v   X
    dw $0040,$0040,$0000 ;          X
    dw $0034,$0000,$0000 ;
    dw Instruction_DemoInputObject_Delete


;;; $9DA6: Instruction list - demo input - Tourian entrance ;;;
InstList_DemoInput_TourianEntrance:
    dw $0195,$0000,$0000 ;
    dw Instruction_DemoInputObject_Delete


;;; $9DAE: Instruction list - demo input - crystal flash ;;;
InstList_DemoInput_CrystalFlash:
    dw $001B,$0000,$0000 ;
    dw $0001,$0400,$0400 ;      v
    dw $0005,$0400,$0000 ;      v
    dw $0005,$0000,$0000 ;
    dw $0001,$0400,$0400 ;      v
    dw $0007,$0400,$0000 ;      v
    dw $0009,$0000,$0000 ;
    dw $0001,$2000,$2000 ;   s
    dw $0006,$2000,$0000 ;   s
    dw $0006,$0000,$0000 ;
    dw $0001,$2000,$2000 ;   s
    dw $0005,$2000,$0000 ;   s
    dw $0008,$0000,$0000 ;
    dw $0001,$2000,$2000 ;   s
    dw $0007,$2000,$0000 ;   s
    dw $0031,$0000,$0000 ;
    dw $0001,$0430,$0430 ;      v    LR
    dw $0009,$0430,$0000 ;      v    LR
    dw $0001,$0470,$0040 ;      v   XLR
    dw $0010,$0470,$0000 ;      v   XLR
    dw $001E,$0430,$0000 ;      v    LR
    dw $0001,$0470,$0040 ;      v   XLR
    dw $00BE,$0470,$0000 ;      v   XLR
    dw $0003,$0070,$0000 ;          XLR
    dw $0001,$0030,$0000 ;           LR
    dw $0001,$0010,$0000 ;            R
    dw $013C,$0000,$0000 ;
    dw Instruction_DemoInputObject_Delete


;;; $9E52: Demo input objects - title ;;;
DemoInputObjects_Title_LandingSite:
    dw RTS_9183BF                                                        ; Initialisation (RTS)
    dw PreInstruction_DemoInput_Normal                                   ; Pre-instruction (ends demo controller input)
    dw InstList_DemoInput_LandingSite                                    ; Pointer to input instruction list

DemoInputObjects_Title_PseudoScrewAttack:
    dw RTS_9183BF                                                        ; Initialisation (RTS)
    dw PreInstruction_DemoInput_Normal                                   ; Pre-instruction (ends demo controller input)
    dw InstList_DemoInput_PseudoScrewAttack                              ; Pointer to input instruction list

DemoInputObjects_Title_SpeedBooster:
    dw RTS_9183BF                                                        ; Initialisation (RTS)
    dw PreInstruction_DemoInput_Normal                                   ; Pre-instruction (ends demo controller input)
    dw InstList_DemoInput_SpeedBooster                                   ; Pointer to input instruction list

DemoInputObjects_Title_Dachora:
    dw RTS_9183BF                                                        ; Initialisation (RTS)
    dw PreInstruction_DemoInput_Normal                                   ; Pre-instruction (ends demo controller input)
    dw InstList_DemoInput_Dachora                                        ; Pointer to input instruction list

DemoInputObjects_Title_RedBrinstarElevator:
    dw RTS_9183BF                                                        ; Initialisation (RTS)
    dw PreInstruction_DemoInput_Normal                                   ; Pre-instruction (ends demo controller input)
    dw InstList_DemoInput_RedBrinstarElevator                            ; Pointer to input instruction list

DemoInputObjects_Title_WreckedShipBasement:
    dw RTS_9183BF                                                        ; Initialisation (RTS)
    dw PreInstruction_DemoInput_Normal                                   ; Pre-instruction (ends demo controller input)
    dw InstList_DemoInput_WreckedShipBasement                            ; Pointer to input instruction list

DemoInputObjects_Title_LowerNorfairEntrance:
    dw RTS_9183BF                                                        ; Initialisation (RTS)
    dw PreInstruction_DemoInput_Normal                                   ; Pre-instruction (ends demo controller input)
    dw InstList_DemoInput_LowerNorfairEntrance                           ; Pointer to input instruction list

DemoInputObjects_Title_EyeDoor:
    dw RTS_9183BF                                                        ; Initialisation (RTS)
    dw PreInstruction_DemoInput_Normal                                   ; Pre-instruction (ends demo controller input)
    dw InstList_DemoInput_EyeDoor                                        ; Pointer to input instruction list

DemoInputObjects_Title_Shinespark:
    dw RTS_9183BF                                                        ; Initialisation (RTS)
    dw PreInstruction_DemoInput_Shinespark                               ; Pre-instruction (ends demo controller input)
    dw InstList_DemoInput_Shinespark                                     ; Pointer to input instruction list

DemoInputObjects_Title_MissileDoor:
    dw RTS_9183BF                                                        ; Initialisation (RTS)
    dw PreInstruction_DemoInput_Normal                                   ; Pre-instruction (ends demo controller input)
    dw InstList_DemoInput_MissileDoor                                    ; Pointer to input instruction list

DemoInputObjects_Title_Kraid:
    dw RTS_9183BF                                                        ; Initialisation (RTS)
    dw PreInstruction_DemoInput_Normal                                   ; Pre-instruction (ends demo controller input)
    dw InstList_DemoInput_Kraid                                          ; Pointer to input instruction list

DemoInputObjects_Title_FireFleaRoom:
    dw RTS_9183BF                                                        ; Initialisation (RTS)
    dw PreInstruction_DemoInput_Normal                                   ; Pre-instruction (ends demo controller input)
    dw InstList_DemoInput_FireFleaRoom                                   ; Pointer to input instruction list

DemoInputObjects_Title_ScrewAttack:
    dw RTS_9183BF                                                        ; Initialisation (RTS)
    dw PreInstruction_DemoInput_Normal                                   ; Pre-instruction (ends demo controller input)
    dw InstList_DemoInput_ScrewAttack                                    ; Pointer to input instruction list

DemoInputObjects_Title_BrinstarDiagonalRoom:
    dw RTS_9183BF                                                        ; Initialisation (RTS)
    dw PreInstruction_DemoInput_Normal                                   ; Pre-instruction (ends demo controller input)
    dw InstList_DemoInput_BrinstarDiagonalRoom                           ; Pointer to input instruction list

if !FEATURE_KEEP_UNREFERENCED
UNUSED_DemoInputObjects_Title_919EA6:
    dw RTS_9183BF                                                        ; Initialisation (RTS)
    dw PreInstruction_DemoInput_Normal                                   ; Pre-instruction (ends demo controller input)
    dw UNUSED_InstList_DemoInput_9195BC                                  ; Pointer to input instruction list
endif ; !FEATURE_KEEP_UNREFERENCED

DemoInputObjects_Title_PreSporeSpawnHall:
    dw RTS_9183BF                                                        ; Initialisation (RTS)
    dw PreInstruction_DemoInput_Normal                                   ; Pre-instruction (ends demo controller input)
    dw InstList_DemoInput_PreSporeSpawnHall                              ; Pointer to input instruction list

DemoInputObjects_Title_GrappleBeam:
    dw RTS_9183BF                                                        ; Initialisation (RTS)
    dw PreInstruction_DemoInput_Normal                                   ; Pre-instruction (ends demo controller input)
    dw InstList_DemoInput_GrappleBeam                                    ; Pointer to input instruction list

DemoInputObjects_Title_IceBeam:
    dw RTS_9183BF                                                        ; Initialisation (RTS)
    dw PreInstruction_DemoInput_Normal                                   ; Pre-instruction (ends demo controller input)
    dw InstList_DemoInput_IceBeam                                        ; Pointer to input instruction list

DemoInputObjects_Title_GauntletEntrance:
    dw RTS_9183BF                                                        ; Initialisation (RTS)
    dw PreInstruction_DemoInput_Normal                                   ; Pre-instruction (ends demo controller input)
    dw InstList_DemoInput_GauntletEntrance                               ; Pointer to input instruction list

DemoInputObjects_Title_AdvancedGrappleBeam:
    dw RTS_9183BF                                                        ; Initialisation (RTS)
    dw PreInstruction_DemoInput_Normal                                   ; Pre-instruction (ends demo controller input)
    dw InstList_DemoInput_AdvancedGrappleBeam                            ; Pointer to input instruction list

DemoInputObjects_Title_IBJ:
    dw RTS_9183BF                                                        ; Initialisation (RTS)
    dw PreInstruction_DemoInput_Normal                                   ; Pre-instruction (ends demo controller input)
    dw InstList_DemoInput_IBJ                                            ; Pointer to input instruction list

DemoInputObjects_Title_SBA:
    dw RTS_9183BF                                                        ; Initialisation (RTS)
    dw PreInstruction_DemoInput_Normal                                   ; Pre-instruction (ends demo controller input)
    dw InstList_DemoInput_SBA                                            ; Pointer to input instruction list

DemoInputObjects_Title_TourianEntrance:
    dw RTS_9183BF                                                        ; Initialisation (RTS)
    dw PreInstruction_DemoInput_Normal                                   ; Pre-instruction (ends demo controller input)
    dw InstList_DemoInput_TourianEntrance                                ; Pointer to input instruction list

DemoInputObjects_Title_CrystalFlash:
    dw RTS_9183BF                                                        ; Initialisation (RTS)
    dw PreInstruction_DemoInput_Normal                                   ; Pre-instruction (ends demo controller input)
    dw InstList_DemoInput_CrystalFlash                                   ; Pointer to input instruction list


;;; $9EE2..B00F: Transition table ;;;
TransitionTable:
; Transition table entries have the format:
;     nnnn cccc pppp
;     nnnn cccc pppp
;     FFFF
; where:
;     n is the required newly pressed input, n = FFFF terminates the table entry
;     c is the required held input
;     p is the pose to transition to (if not currently already in that pose)

; Note that all of the buttons in c and n must be part of the respective input.
; Buttons are defined with the following bitflags:
;     8000: Run
;     4000: Cancel
;     2000: Select
;     1000: Start
;     0800: Up
;     0400: Down
;     0200: Left
;     0100: Right
;     0080: Jump
;     0040: Shoot
;     0020: Aim diagonally down
;     0010: Aim diagonally up
    dw TransitionTable_00_9B_FacingForward
    dw TransitionTable_01_03_05_07_A4_A6_E0_E2_E4_E6_FacingRight
    dw TransitionTable_02_04_06_08_A5_A7_E1_E3_E5_E7_FacingLeft
    dw TransitionTable_01_03_05_07_A4_A6_E0_E2_E4_E6_FacingRight
    dw TransitionTable_02_04_06_08_A5_A7_E1_E3_E5_E7_FacingLeft
    dw TransitionTable_01_03_05_07_A4_A6_E0_E2_E4_E6_FacingRight
    dw TransitionTable_02_04_06_08_A5_A7_E1_E3_E5_E7_FacingLeft
    dw TransitionTable_01_03_05_07_A4_A6_E0_E2_E4_E6_FacingRight
    dw TransitionTable_02_04_06_08_A5_A7_E1_E3_E5_E7_FacingLeft
    dw TransitionTable_09_0D_0F_11_MovingRight
    dw TransitionTable_0A_0E_10_12_MovingLeft
    dw TransitionTable_0B_MovingRight_GunExtended
    dw TransitionTable_0C_MovingLeft_GunExtended
    dw TransitionTable_09_0D_0F_11_MovingRight
    dw TransitionTable_0A_0E_10_12_MovingLeft
    dw TransitionTable_09_0D_0F_11_MovingRight
    dw TransitionTable_0A_0E_10_12_MovingLeft
    dw TransitionTable_09_0D_0F_11_MovingRight
    dw TransitionTable_0A_0E_10_12_MovingLeft
    dw TransitionTable_13_FaceRight_NormalJump_NotMoving_GunExtend
    dw TransitionTable_14_FacingLeft_NormalJump_NotMoving_GunExtend
    dw TransitionTable_15_4D_51_69_6B_FacingRight_NormalJump
    dw TransitionTable_16_4E_52_6A_6C_FacingLeft_NormalJump
    dw TransitionTable_17_FacingRight_NormalJump_AimingDown
    dw TransitionTable_18_FacingLeft_NormalJump_AimingDown
    dw TransitionTable_19_FacingRight_SpinJump
    dw TransitionTable_1A_FacingLeft_SpinJump
    dw TransitionTable_1B_FacingRight_SpaceJump
    dw TransitionTable_1C_FacingLeft_SpaceJump
    dw TransitionTable_1D_FaceRight_MorphBall_NoSpringBall_OnGround
    dw TransitionTable_1E_MoveRight_MorphBall_NoSpringBall_OnGround
    dw TransitionTable_1F_MoveLeft_MorphBall_NoSpringBall_OnGround
    dw UNUSED_TransitionTable_20_21_22_24_91A666
    dw UNUSED_TransitionTable_20_21_22_24_91A666
    dw UNUSED_TransitionTable_20_21_22_24_91A666
    dw UNUSED_TransitionTable_23_91A668
    dw UNUSED_TransitionTable_20_21_22_24_91A666
    dw TransitionTable_25_FacingRight_Turning_Standing
    dw TransitionTable_26_FacingLeft_Turning_Standing
    dw TransitionTable_27_71_73_85_FacingRight_Crouching
    dw TransitionTable_28_72_74_86_Crouching
    dw TransitionTable_29_2B_6D_6F_FacingRight_Falling
    dw TransitionTable_2A_2C_6E_70_FacingLeft_Falling
    dw TransitionTable_29_2B_6D_6F_FacingRight_Falling
    dw TransitionTable_2A_2C_6E_70_FacingLeft_Falling
    dw TransitionTable_2D_FacingRight_Falling_AimingDown
    dw TransitionTable_2E_FacingLeft_Falling_AimingDown
    dw TransitionTable_Terminator_91A0DE
    dw TransitionTable_Terminator_91A0DE
    dw TransitionTable_31_FacingRight_MorphBall_NoSpringBall_InAir
    dw TransitionTable_32_FacingLeft_MorphBall_NoSpringBall_InAir
    dw UNUSED_TransitionTable_33_91A7C8
    dw UNUSED_TransitionTable_34_91A7CA
    dw TransitionTable_Terminator_91A0DE
    dw TransitionTable_Terminator_91A0DE
    dw TransitionTable_Terminator_91A0DE
    dw TransitionTable_Terminator_91A0DE
    dw TransitionTable_Terminator_91A0DE
    dw TransitionTable_Terminator_91A0DE
    dw TransitionTable_Terminator_91A0DE
    dw TransitionTable_Terminator_91A0DE
    dw TransitionTable_3D_FacingRight_Unmorphing
    dw TransitionTable_3E_FacingLeft_Unmorphing
    dw TransitionTable_Terminator_91A0DE
    dw TransitionTable_Terminator_91A0DE
    dw TransitionTable_1D_FaceLeft_MorphBall_NoSpringBall_OnGround
    dw UNUSED_TransitionTable_42_91A66A
    dw TransitionTable_Terminator_91A0DE
    dw TransitionTable_Terminator_91A0DE
    dw UNUSED_TransitionTable_45_91A7CC
    dw UNUSED_TransitionTable_46_91A7E0
    dw UNUSED_TransitionTable_47_91A7F4
    dw UNUSED_TransitionTable_48_91A834
    dw TransitionTable_49_75_77_FacingLeft_Moonwalk
    dw TransitionTable_4A_76_78_FacingRight_Moonwalk
    dw TransitionTable_4B_55_57_59_FacingRight_NormalJumpTransition
    dw TransitionTable_4C_56_58_5A_FacingLeft_NormalJumpTransition
    dw TransitionTable_15_4D_51_69_6B_FacingRight_NormalJump
    dw TransitionTable_16_4E_52_6A_6C_FacingLeft_NormalJump
    dw TransitionTable_4F_FacingLeft_DamageBoost
    dw TransitionTable_50_FacingRight_DamageBoost
    dw TransitionTable_15_4D_51_69_6B_FacingRight_NormalJump
    dw TransitionTable_16_4E_52_6A_6C_FacingLeft_NormalJump
    dw TransitionTable_53_FacingRight_Knockback
    dw TransitionTable_54_FacingLeft_Knockback
    dw TransitionTable_4B_55_57_59_FacingRight_NormalJumpTransition
    dw TransitionTable_4C_56_58_5A_FacingLeft_NormalJumpTransition
    dw TransitionTable_4B_55_57_59_FacingRight_NormalJumpTransition
    dw TransitionTable_4C_56_58_5A_FacingLeft_NormalJumpTransition
    dw TransitionTable_4B_55_57_59_FacingRight_NormalJumpTransition
    dw TransitionTable_4C_56_58_5A_FacingLeft_NormalJumpTransition
    dw UNUSED_TransitionTable_5B_91A8FC
    dw UNUSED_TransitionTable_5C_91A904
    dw TransitionTable_Terminator_91A0DE
    dw TransitionTable_Terminator_91A0DE
    dw TransitionTable_Terminator_91A0DE
    dw TransitionTable_Terminator_91A0DE
    dw TransitionTable_Terminator_91A0DE
    dw TransitionTable_Terminator_91A0DE
    dw UNUSED_TransitionTable_63_91A990
    dw UNUSED_TransitionTable_64_91A998
    dw UNUSED_TransitionTable_65_91A9A0
    dw UNUSED_TransitionTable_66_91A9C6
    dw TransitionTable_67_FacingRight_Falling_GunExtended
    dw TransitionTable_68_FacingLeft_Falling_GunExtended
    dw TransitionTable_15_4D_51_69_6B_FacingRight_NormalJump
    dw TransitionTable_16_4E_52_6A_6C_FacingLeft_NormalJump
    dw TransitionTable_15_4D_51_69_6B_FacingRight_NormalJump
    dw TransitionTable_16_4E_52_6A_6C_FacingLeft_NormalJump
    dw TransitionTable_29_2B_6D_6F_FacingRight_Falling
    dw TransitionTable_2A_2C_6E_70_FacingLeft_Falling
    dw TransitionTable_29_2B_6D_6F_FacingRight_Falling
    dw TransitionTable_2A_2C_6E_70_FacingLeft_Falling
    dw TransitionTable_27_71_73_85_FacingRight_Crouching
    dw TransitionTable_28_72_74_86_Crouching
    dw TransitionTable_27_71_73_85_FacingRight_Crouching
    dw TransitionTable_28_72_74_86_Crouching
    dw TransitionTable_49_75_77_FacingLeft_Moonwalk
    dw TransitionTable_4A_76_78_FacingRight_Moonwalk
    dw TransitionTable_49_75_77_FacingLeft_Moonwalk
    dw TransitionTable_4A_76_78_FacingRight_Moonwalk
    dw TransitionTable_79_7B_FacingRight_MorphBall_Spring_OnGround
    dw TransitionTable_7A_7C_FacingLeft_MorphBall_Spring_OnGround
    dw TransitionTable_79_7B_FacingRight_MorphBall_Spring_OnGround
    dw TransitionTable_7A_7C_FacingLeft_MorphBall_Spring_OnGround
    dw TransitionTable_7D_FacingRight_MorphBall_SpringBall_Falling
    dw TransitionTable_7E_FacingLeft_MorphBall_SpringBall_Falling
    dw TransitionTable_7F_FacingRight_MorphBall_SpringBall_InAir
    dw TransitionTable_80_FacingLeft_MorphBall_SpringBall_InAir
    dw TransitionTable_81_ScrewAttack
    dw TransitionTable_82_FacingLeft_ScrewAttack
    dw TransitionTable_83_FacingRight_WallJump
    dw TransitionTable_84_FacingLeft_WallJump
    dw TransitionTable_27_71_73_85_FacingRight_Crouching
    dw TransitionTable_28_72_74_86_Crouching
    dw TransitionTable_Terminator_91A0DE
    dw TransitionTable_Terminator_91A0DE
    dw TransitionTable_89_CF_D1_FacingRight_RanIntoAWall
    dw TransitionTable_8A_D0_D2_FacingLeft_RanIntoAWall
    dw TransitionTable_8B_FacingRight_Turning_Standing_AimingUp
    dw TransitionTable_8C_FacingLeft_Turning_Standing_AimingUp
    dw TransitionTable_8D_FacingRight_Turning_Standing_AimDownRight
    dw TransitionTable_8E_FacingLeft_Turning_Standing_AimDownLeft
    dw TransitionTable_Terminator_91A0DE
    dw TransitionTable_Terminator_91A0DE
    dw TransitionTable_Terminator_91A0DE
    dw TransitionTable_Terminator_91A0DE
    dw TransitionTable_Terminator_91A0DE
    dw TransitionTable_Terminator_91A0DE
    dw TransitionTable_Terminator_91A0DE
    dw TransitionTable_Terminator_91A0DE
    dw TransitionTable_Terminator_91A0DE
    dw TransitionTable_Terminator_91A0DE
    dw TransitionTable_Terminator_91A0DE
    dw TransitionTable_Terminator_91A0DE
    dw TransitionTable_00_9B_FacingForward
    dw TransitionTable_Terminator_91A0DE
    dw TransitionTable_Terminator_91A0DE
    dw TransitionTable_Terminator_91A0DE
    dw TransitionTable_Terminator_91A0DE
    dw TransitionTable_Terminator_91A0DE
    dw TransitionTable_Terminator_91A0DE
    dw TransitionTable_Terminator_91A0DE
    dw TransitionTable_Terminator_91A0DE
    dw TransitionTable_01_03_05_07_A4_A6_E0_E2_E4_E6_FacingRight
    dw TransitionTable_02_04_06_08_A5_A7_E1_E3_E5_E7_FacingLeft
    dw TransitionTable_01_03_05_07_A4_A6_E0_E2_E4_E6_FacingRight
    dw TransitionTable_02_04_06_08_A5_A7_E1_E3_E5_E7_FacingLeft
    dw TransitionTable_Terminator_91A0DE
    dw TransitionTable_Terminator_91A0DE
    dw TransitionTable_Terminator_91A0DE
    dw TransitionTable_Terminator_91A0DE
    dw TransitionTable_Terminator_91A0DE
    dw TransitionTable_Terminator_91A0DE
    dw TransitionTable_Terminator_91A0DE
    dw TransitionTable_Terminator_91A0DE
    dw TransitionTable_Terminator_91A0DE
    dw TransitionTable_Terminator_91A0DE
    dw TransitionTable_Terminator_91A0DE
    dw TransitionTable_Terminator_91A0DE
    dw TransitionTable_Terminator_91A0DE
    dw TransitionTable_Terminator_91A0DE
    dw TransitionTable_Terminator_91A0DE
    dw TransitionTable_Terminator_91A0DE
    dw TransitionTable_Terminator_91A0DE
    dw TransitionTable_Terminator_91A0DE
    dw TransitionTable_BA_BB_BC_BD_BE_FacingLeft_GrabbedByDraygon
    dw TransitionTable_BA_BB_BC_BD_BE_FacingLeft_GrabbedByDraygon
    dw TransitionTable_BA_BB_BC_BD_BE_FacingLeft_GrabbedByDraygon
    dw TransitionTable_BA_BB_BC_BD_BE_FacingLeft_GrabbedByDraygon
    dw TransitionTable_BA_BB_BC_BD_BE_FacingLeft_GrabbedByDraygon
    dw TransitionTable_BF_FacingRight_Moonwalking_TurnJumpLeft
    dw TransitionTable_C0_FacingLeft_Moonwalking_TurnJumpRight
    dw TransitionTable_C1_FaceRight_Moonwalk_TurnJumpLeft_AimUpRight
    dw TransitionTable_C2_FaceLeft_Moonwalk_TurnJumpRight_AimUpLeft
    dw TransitionTable_C3_FaceRight_Moonwalk_TurnJumpLeft_AimDownRight
    dw TransitionTable_C4_FaceLeft_Moonwalk_TurnJumpRight_AimDownLeft
    dw TransitionTable_Terminator_91A0DE
    dw TransitionTable_Terminator_91A0DE
    dw TransitionTable_C7_FacingRight_VerticalShinesparkWindup
    dw TransitionTable_C8_FacingLeft_VerticalShinesparkWindup
    dw TransitionTable_Terminator_91A0DE
    dw TransitionTable_Terminator_91A0DE
    dw TransitionTable_Terminator_91A0DE
    dw TransitionTable_Terminator_91A0DE
    dw TransitionTable_Terminator_91A0DE
    dw TransitionTable_Terminator_91A0DE
    dw TransitionTable_89_CF_D1_FacingRight_RanIntoAWall
    dw TransitionTable_8A_D0_D2_FacingLeft_RanIntoAWall
    dw TransitionTable_89_CF_D1_FacingRight_RanIntoAWall
    dw TransitionTable_8A_D0_D2_FacingLeft_RanIntoAWall
    dw TransitionTable_Terminator_91A0DE
    dw TransitionTable_Terminator_91A0DE
    dw TransitionTable_Terminator_91A0DE
    dw TransitionTable_Terminator_91A0DE
    dw TransitionTable_Terminator_91A0DE
    dw TransitionTable_Terminator_91A0DE
    dw TransitionTable_Terminator_91A0DE
    dw TransitionTable_Terminator_91A0DE
    dw TransitionTable_Terminator_91A0DE
    dw TransitionTable_Terminator_91A0DE
    dw TransitionTable_Terminator_91A0DE
    dw TransitionTable_Terminator_91A0DE
    dw UNUSED_TransitionTable_DF_91AE10
    dw TransitionTable_01_03_05_07_A4_A6_E0_E2_E4_E6_FacingRight
    dw TransitionTable_02_04_06_08_A5_A7_E1_E3_E5_E7_FacingLeft
    dw TransitionTable_01_03_05_07_A4_A6_E0_E2_E4_E6_FacingRight
    dw TransitionTable_02_04_06_08_A5_A7_E1_E3_E5_E7_FacingLeft
    dw TransitionTable_01_03_05_07_A4_A6_E0_E2_E4_E6_FacingRight
    dw TransitionTable_02_04_06_08_A5_A7_E1_E3_E5_E7_FacingLeft
    dw TransitionTable_01_03_05_07_A4_A6_E0_E2_E4_E6_FacingRight
    dw TransitionTable_02_04_06_08_A5_A7_E1_E3_E5_E7_FacingLeft
    dw TransitionTable_Terminator_91A0DE
    dw TransitionTable_Terminator_91A0DE
    dw TransitionTable_Terminator_91A0DE
    dw TransitionTable_Terminator_91A0DE
    dw TransitionTable_EC_ED_EE_EF_F0_FacingRight_GrabbedByDraygon
    dw TransitionTable_EC_ED_EE_EF_F0_FacingRight_GrabbedByDraygon
    dw TransitionTable_EC_ED_EE_EF_F0_FacingRight_GrabbedByDraygon
    dw TransitionTable_EC_ED_EE_EF_F0_FacingRight_GrabbedByDraygon
    dw TransitionTable_EC_ED_EE_EF_F0_FacingRight_GrabbedByDraygon
    dw TransitionTable_Terminator_91A0DE
    dw TransitionTable_Terminator_91A0DE
    dw TransitionTable_Terminator_91A0DE
    dw TransitionTable_Terminator_91A0DE
    dw TransitionTable_Terminator_91A0DE
    dw TransitionTable_Terminator_91A0DE
    dw TransitionTable_Terminator_91A0DE
    dw TransitionTable_Terminator_91A0DE
    dw TransitionTable_Terminator_91A0DE
    dw TransitionTable_Terminator_91A0DE
    dw TransitionTable_Terminator_91A0DE
    dw TransitionTable_Terminator_91A0DE


;;; $A0DC: Transition table - entry 2F/30/35/36/37/38/39/3A/3B/3C/3F/40/43/44/5D/5E/5F/60/61/62/87/88/8F/90/91/92/93/94/95/96/97/98/99/9A/9C/9D/9E/9F/A0/A1/A2/A3/A8/A9/AA/AB/AC/AD/AE/AF/B0/B1/B2/B3/B4/B5/B6/B7/B8/B9/C5/C6/C9/CA/CB/CC/CD/CE/D3/D4/D5/D6/D7/D8/D9/DA/DB/DC/DD/DE/E8/E9/EA/EB/F1/F2/F3/F4/F5/F6/F7/F8/F9/FA/FB/FC ;;;
TransitionTable_Terminator_91A0DE:
    dw $FFFF


;;; $A0DE: Transition table - entry 00/9B ;;;
TransitionTable_00_9B_FacingForward:
; 00: Facing forward - power suit
; 9B: Facing forward - varia/gravity suit
    dw $0000,$0100,$0026
    dw $0000,$0200,$0025
    dw $FFFF


;;; $A0EC: Transition table - entry 01/03/05/07/A4/A6/E0/E2/E4/E6 ;;;
TransitionTable_01_03_05_07_A4_A6_E0_E2_E4_E6_FacingRight:
; 01: Facing right - normal
; 03: Facing right - aiming up
; 05: Facing right - aiming up-right
; 07: Facing right - aiming down-right
; A4: Facing right - landing from normal jump
; A6: Facing right - landing from spin jump
; E0: Facing right - landing from normal jump - aiming up
; E2: Facing right - landing from normal jump - aiming up-right
; E4: Facing right - landing from normal jump - aiming down-right
; E6: Facing right - landing from normal jump - firing
    dw $0080,$0800,$0055
    dw $0080,$0010,$0057
    dw $0080,$0020,$0059
    dw $0080,$0000,$004B
    dw $0400,$0030,$00F1
    dw $0400,$0010,$00F3
    dw $0400,$0020,$00F5
    dw $0400,$0000,$0035
    dw $0000,$0260,$0078
    dw $0000,$0250,$0076
    dw $0000,$0230,$0025
    dw $0000,$0030,$0003
    dw $0000,$0110,$000F
    dw $0000,$0120,$0011
    dw $0000,$0900,$000F
    dw $0000,$0500,$0011
    dw $0000,$0240,$004A
    dw $0000,$0200,$0025
    dw $0000,$0800,$0003
    dw $0000,$0010,$0005
    dw $0000,$0020,$0007
    dw $0000,$0100,$0009
    dw $FFFF


;;; $A172: Transition table - entry 02/04/06/08/A5/A7/E1/E3/E5/E7 ;;;
TransitionTable_02_04_06_08_A5_A7_E1_E3_E5_E7_FacingLeft:
; 02: Facing left - normal
; 04: Facing left - aiming up
; 06: Facing left - aiming up-left
; 08: Facing left - aiming down-left
; A5: Facing left - landing from normal jump
; A7: Facing left - landing from spin jump
; E1: Facing left - landing from normal jump - aiming up
; E3: Facing left - landing from normal jump - aiming up-left
; E5: Facing left - landing from normal jump - aiming down-left
; E7: Facing left - landing from normal jump - firing
    dw $0080,$0800,$0056
    dw $0080,$0010,$0058
    dw $0080,$0020,$005A
    dw $0080,$0000,$004C
    dw $0400,$0030,$00F2
    dw $0400,$0010,$00F4
    dw $0400,$0020,$00F6
    dw $0400,$0000,$0036
    dw $0000,$0160,$0077
    dw $0000,$0150,$0075
    dw $0000,$0130,$0026
    dw $0000,$0030,$0004
    dw $0000,$0210,$0010
    dw $0000,$0220,$0012
    dw $0000,$0A00,$0010
    dw $0000,$0600,$0012
    dw $0000,$0140,$0049
    dw $0000,$0100,$0026
    dw $0000,$0800,$0004
    dw $0000,$0010,$0006
    dw $0000,$0020,$0008
    dw $0000,$0200,$000A
    dw $FFFF


;;; $A1F8: Transition table - entry 09/0D/0F/11 ;;;
TransitionTable_09_0D_0F_11_MovingRight:
; 09: Moving right - not aiming
; 0D: Moving right - aiming up (unused)
; 0F: Moving right - aiming up-right
; 11: Moving right - aiming down-right
    dw $0400,$0000,$0035
    dw $0080,$0000,$0019
    dw $0000,$0110,$000F
    dw $0000,$0120,$0011
    dw $0000,$0900,$000F
    dw $0000,$0500,$0011
    dw $0000,$0140,$000B
    dw $0000,$0100,$0009
    dw $0000,$0200,$0025
    dw $0000,$0800,$0003
    dw $0000,$0010,$0005
    dw $0000,$0020,$0007
    dw $FFFF


;;; $A242: Transition table - entry 0A/0E/10/12 ;;;
TransitionTable_0A_0E_10_12_MovingLeft:
; 0A: Moving left - not aiming
; 0E: Moving left - aiming up (unused)
; 10: Moving left - aiming up-left
; 12: Moving left - aiming down-left
    dw $0400,$0000,$0036
    dw $0080,$0000,$001A
    dw $0000,$0210,$0010
    dw $0000,$0220,$0012
    dw $0000,$0A00,$0010
    dw $0000,$0600,$0012
    dw $0000,$0240,$000C
    dw $0000,$0200,$000A
    dw $0000,$0100,$0026
    dw $0000,$0800,$0004
    dw $0000,$0010,$0006
    dw $0000,$0020,$0008
    dw $FFFF


;;; $A28C: Transition table - entry 4B/55/57/59 ;;;
TransitionTable_4B_55_57_59_FacingRight_NormalJumpTransition:
; 4B: Facing right - normal jump transition
; 55: Facing right - normal jump transition - aiming up
; 57: Facing right - normal jump transition - aiming up-right
; 59: Facing right - normal jump transition - aiming down-right
    dw $0000,$0280,$002F
    dw $0000,$0880,$0015
    dw $0000,$0480,$0017
    dw $0000,$0090,$0069
    dw $0000,$00A0,$006B
    dw $0000,$0180,$0051
    dw $0000,$00C0,$0013
    dw $0000,$0040,$0013
    dw $FFFF


;;; $A2BE: Transition table - entry 4C/56/58/5A ;;;
TransitionTable_4C_56_58_5A_FacingLeft_NormalJumpTransition:
; 4C: Facing left - normal jump transition
; 56: Facing left - normal jump transition - aiming up
; 58: Facing left - normal jump transition - aiming up-left
; 5A: Facing left - normal jump transition - aiming down-left
    dw $0000,$0180,$0030
    dw $0000,$0880,$0016
    dw $0000,$0480,$0018
    dw $0000,$0090,$006A
    dw $0000,$00A0,$006C
    dw $0000,$0280,$0052
    dw $0000,$00C0,$0014
    dw $0000,$0100,$0030
    dw $0000,$0040,$0014
    dw $FFFF


;;; $A2F6: Transition table - entry 15/4D/51/69/6B ;;;
TransitionTable_15_4D_51_69_6B_FacingRight_NormalJump:
; 15: Facing right - normal jump - aiming up
; 4D: Facing right - normal jump - not aiming - not moving - gun not extended
; 51: Facing right - normal jump - not aiming - moving forward
; 69: Facing right - normal jump - aiming up-right
; 6B: Facing right - normal jump - aiming down-right
    dw $0000,$0980,$0069
    dw $0000,$0580,$006B
    dw $0000,$0190,$0069
    dw $0000,$01A0,$006B
    dw $0000,$0900,$0069
    dw $0000,$0500,$006B
    dw $0000,$0280,$002F
    dw $0000,$0880,$0015
    dw $0000,$0480,$0017
    dw $0000,$0090,$0069
    dw $0000,$00A0,$006B
    dw $0000,$0180,$0051
    dw $0000,$00C0,$0013
    dw $0000,$0200,$002F
    dw $0000,$0800,$0015
    dw $0000,$0400,$0017
    dw $0000,$0010,$0069
    dw $0000,$0020,$006B
    dw $0000,$0100,$0051
    dw $0000,$0080,$004D
    dw $0000,$0040,$0013
    dw $FFFF


;;; $A376: Transition table - entry 16/4E/52/6A/6C ;;;
TransitionTable_16_4E_52_6A_6C_FacingLeft_NormalJump:
; 16: Facing left - normal jump - aiming up
; 4E: Facing left - normal jump - not aiming - not moving - gun not extended
; 52: Facing left - normal jump - not aiming - moving forward
; 6A: Facing left - normal jump - aiming up-left
; 6C: Facing left - normal jump - aiming down-left
    dw $0000,$0A80,$006A
    dw $0000,$0680,$006C
    dw $0000,$0290,$006A
    dw $0000,$02A0,$006C
    dw $0000,$0A00,$006A
    dw $0000,$0600,$006C
    dw $0000,$0180,$0030
    dw $0000,$0880,$0016
    dw $0000,$0480,$0018
    dw $0000,$0090,$006A
    dw $0000,$00A0,$006C
    dw $0000,$0280,$0052
    dw $0000,$00C0,$0014
    dw $0000,$0100,$0030
    dw $0000,$0800,$0016
    dw $0000,$0400,$0018
    dw $0000,$0010,$006A
    dw $0000,$0020,$006C
    dw $0000,$0200,$0052
    dw $0000,$0080,$004E
    dw $0000,$0040,$0014
    dw $FFFF


;;; $A3F6: Transition table - entry 4F ;;;
TransitionTable_4F_FacingLeft_DamageBoost:
; 4F: Facing left - damage boost
    dw $0000,$0280,$0052
    dw $0000,$0180,$004F
    dw $0000,$0080
    dw $004E
    dw $FFFF


;;; $A40A: Transition table - entry 50 ;;;
TransitionTable_50_FacingRight_DamageBoost:
; 50: Facing right - damage boost
    dw $0000,$0280,$0050
    dw $0000,$0180,$0051
    dw $0000,$0080
    dw $004D
    dw $FFFF


;;; $A41E: Transition table - entry 19 ;;;
TransitionTable_19_FacingRight_SpinJump:
; 19: Facing right - spin jump
    dw $0040,$0000,$0013
    dw $0040,$0100,$0013
    dw $0000,$0840,$0015
    dw $0000,$0440,$0017
    dw $0000,$0050,$0069
    dw $0000,$0060,$006B
    dw $0000,$0180,$0019
    dw $0000,$0800,$0015
    dw $0000,$0010,$0069
    dw $0000,$0020,$006B
    dw $0000,$0400,$0017
    dw $0000,$0100,$0019
    dw $0000,$0200,$001A
    dw $FFFF


;;; $A46E: Transition table - entry 1A ;;;
TransitionTable_1A_FacingLeft_SpinJump:
; 1A: Facing left - spin jump
    dw $0040,$0000,$0014
    dw $0040,$0200,$0014
    dw $0000,$0840,$0016
    dw $0000,$0440,$0018
    dw $0000,$0050,$006A
    dw $0000,$0060,$006C
    dw $0000,$0280,$001A
    dw $0000,$0800,$0016
    dw $0000,$0010,$006A
    dw $0000,$0020,$006C
    dw $0000,$0400,$0018
    dw $0000,$0200,$001A
    dw $0000,$0100,$0019
    dw $FFFF


;;; $A4BE: Transition table - entry 1B ;;;
TransitionTable_1B_FacingRight_SpaceJump:
; 1B: Facing right - space jump
    dw $0040,$0000,$0013
    dw $0040,$0100,$0013
    dw $0000,$0840,$0015
    dw $0000,$0440,$0017
    dw $0000,$0050,$0069
    dw $0000,$0060,$006B
    dw $0000,$0180,$001B
    dw $0000,$0800,$0015
    dw $0000,$0010,$0069
    dw $0000,$0020,$006B
    dw $0000,$0400,$0017
    dw $0000,$0100,$001B
    dw $0000,$0200,$001C
    dw $FFFF


;;; $A50E: Transition table - entry 1C ;;;
TransitionTable_1C_FacingLeft_SpaceJump:
; 1C: Facing left - space jump
    dw $0040,$0000,$0014
    dw $0040,$0200,$0014
    dw $0000,$0840,$0016
    dw $0000,$0440,$0018
    dw $0000,$0050,$006A
    dw $0000,$0060,$006C
    dw $0000,$0280,$001C
    dw $0000,$0800,$0016
    dw $0000,$0010,$006A
    dw $0000,$0020,$006C
    dw $0000,$0400,$0018
    dw $0000,$0200,$001C
    dw $0000,$0100,$001B
    dw $FFFF


;;; $A55E: Transition table - entry 81 ;;;
TransitionTable_81_ScrewAttack:
; 81: Facing right - screw attack
    dw $0040,$0000,$0013
    dw $0040,$0100,$0013
    dw $0000,$0840,$0015
    dw $0000,$0440,$0017
    dw $0000,$0050,$0069
    dw $0000,$0060,$006B
    dw $0000,$0180,$0081
    dw $0000,$0800,$0015
    dw $0000,$0010,$0069
    dw $0000,$0020,$006B
    dw $0000,$0400,$0017
    dw $0000,$0100,$0081
    dw $0000,$0200,$0082
    dw $FFFF


;;; $A5AE: Transition table - entry 82 ;;;
TransitionTable_82_FacingLeft_ScrewAttack:
; 82: Facing left - screw attack
    dw $0040,$0000,$0014
    dw $0040,$0200,$0014
    dw $0000,$0840,$0016
    dw $0000,$0440,$0018
    dw $0000,$0050,$006A
    dw $0000,$0060,$006C
    dw $0000,$0280,$0082
    dw $0000,$0800,$0016
    dw $0000,$0010,$006A
    dw $0000,$0020,$006C
    dw $0000,$0400,$0018
    dw $0000,$0200,$0082
    dw $0000,$0100,$0081
    dw $FFFF


;;; $A5FE: Transition table - entry 1D ;;;
TransitionTable_1D_FaceRight_MorphBall_NoSpringBall_OnGround:
; 1D: Facing right - morph ball - no springball - on ground
    dw $0800,$0000,$003D
    dw $0080,$0000,$003D
    dw $0000,$0100,$001E
    dw $0000,$0200,$001F
    dw $FFFF


;;; $A618: Transition table - entry 1E ;;;
TransitionTable_1E_MoveRight_MorphBall_NoSpringBall_OnGround:
; 1E: Moving right - morph ball - no springball - on ground
    dw $0800,$0000,$003D
    dw $0080,$0000,$003D
    dw $0000,$0100,$001E
    dw $0000,$0200,$001F
    dw $FFFF


;;; $A632: Transition table - entry 1F ;;;
TransitionTable_1F_MoveLeft_MorphBall_NoSpringBall_OnGround:
; 1F: Moving left - morph ball - no springball - on ground
    dw $0800,$0000,$003E
    dw $0080,$0000,$003E
    dw $0000,$0100,$001E
    dw $0000,$0200,$001F
    dw $FFFF


;;; $A64C: Transition table - entry 41 ;;;
TransitionTable_1D_FaceLeft_MorphBall_NoSpringBall_OnGround:
; 41: Facing left - morph ball - no springball - on ground
    dw $0800,$0000,$003E
    dw $0080,$0000,$003E
    dw $0000,$0100,$001E
    dw $0000,$0200,$001F
    dw $FFFF


;;; $A666: Transition table - entry 20/21/22/24 ;;;
UNUSED_TransitionTable_20_21_22_24_91A666:
    dw $FFFF


;;; $A668: Transition table - entry 23 ;;;
UNUSED_TransitionTable_23_91A668:
    dw $FFFF


;;; $A66A: Transition table - entry 42 ;;;
UNUSED_TransitionTable_42_91A66A:
    dw $FFFF


;;; $A66C: Transition table - entry 27/71/73/85 ;;;
TransitionTable_27_71_73_85_FacingRight_Crouching:
; 27: Facing right - crouching
; 71: Facing right - crouching transition - aiming up-right
; 73: Facing right - crouching transition - aiming down-right
; 85: Facing right - crouching - aiming up
    dw $0800,$0030,$00F7
    dw $0800,$0010,$00F9
    dw $0800,$0020,$00FB
    dw $0800,$0000,$003B
    dw $0200,$0000,$0043
    dw $0400,$0000,$0037
    dw $0080,$0000,$004B
    dw $0000,$0030,$0085
    dw $0000,$0110,$0001
    dw $0000,$0120,$0001
    dw $0000,$0010,$0071
    dw $0000,$0020,$0073
    dw $0000,$0100,$0001
    dw $FFFF


;;; $A6BC: Transition table - entry 28/72/74/86 ;;;
TransitionTable_28_72_74_86_Crouching:
; 28: Facing left - crouching
; 72: Facing left - crouching transition - aiming up-left
; 74: Facing left - crouching transition - aiming down-left
; 86: Facing left - crouching - aiming up
    dw $0800,$0030,$00F8
    dw $0800,$0010,$00FA
    dw $0800,$0020,$00FC
    dw $0800,$0000,$003C
    dw $0100,$0000,$0044
    dw $0400,$0000,$0038
    dw $0080,$0000,$004C
    dw $0000,$0030,$0086
    dw $0000,$0220,$0002
    dw $0000,$0210,$0002
    dw $0000,$0010,$0072
    dw $0000,$0020,$0074
    dw $0000,$0200,$0002
    dw $FFFF


;;; $A70C: Transition table - entry 29/2B/6D/6F ;;;
TransitionTable_29_2B_6D_6F_FacingRight_Falling:
; 29: Facing right - falling
; 2B: Facing right - falling - aiming up
; 6D: Facing right - falling - aiming up-right
; 6F: Facing right - falling - aiming down-right
    dw $0000,$0900,$006D
    dw $0000,$0500,$006F
    dw $0000,$0A00,$0087
    dw $0000,$0600,$0087
    dw $0000,$0200,$0087
    dw $0000,$0800,$002B
    dw $0000,$0400,$002D
    dw $0000,$0010,$006D
    dw $0000,$0020,$006F
    dw $0000,$0040,$0067
    dw $0000,$0100,$0029
    dw $FFFF


;;; $A750: Transition table - entry 2A/2C/6E/70 ;;;
TransitionTable_2A_2C_6E_70_FacingLeft_Falling:
; 2A: Facing left - falling
; 2C: Facing left - falling - aiming up
; 6E: Facing left - falling - aiming up-left
; 70: Facing left - falling - aiming down-left
    dw $0000,$0A00,$006E
    dw $0000,$0600,$0070
    dw $0000,$0900,$0088
    dw $0000,$0500,$0088
    dw $0000,$0100,$0088
    dw $0000,$0800,$002C
    dw $0000,$0400,$002E
    dw $0000,$0010,$006E
    dw $0000,$0020,$0070
    dw $0000,$0040,$0068
    dw $0000,$0200,$002A
    dw $FFFF


;;; $A794: Transition table - entry 31 ;;;
TransitionTable_31_FacingRight_MorphBall_NoSpringBall_InAir:
; 31: Facing right - morph ball - no springball - in air
    dw $0800,$0000,$003D
    dw $0080,$0000,$003D
    dw $0000,$0100,$0031
    dw $0000,$0200,$0032
    dw $FFFF


;;; $A7AE: Transition table - entry 32 ;;;
TransitionTable_32_FacingLeft_MorphBall_NoSpringBall_InAir:
; 32: Facing left - morph ball - no springball - in air
    dw $0800,$0000,$003E
    dw $0080,$0000,$003E
    dw $0000,$0200,$0032
    dw $0000,$0100,$0031
    dw $FFFF


;;; $A7C8: Transition table - entry 33 ;;;
UNUSED_TransitionTable_33_91A7C8:
    dw $FFFF


;;; $A7CA: Transition table - entry 34 ;;;
UNUSED_TransitionTable_34_91A7CA:
    dw $FFFF


;;; $A7CC: Transition table - entry 45 ;;;
UNUSED_TransitionTable_45_91A7CC:
    dw $0000,$0240,$0045
    dw $0000,$0100,$0009
    dw $0000,$0200,$0025
    dw $FFFF


;;; $A7E0: Transition table - entry 46 ;;;
UNUSED_TransitionTable_46_91A7E0:
    dw $0000,$0140,$0046
    dw $0000,$0200,$000A
    dw $0000,$0100,$0026
    dw $FFFF


;;; $A7F4: Transition table - entry 47 ;;;
UNUSED_TransitionTable_47_91A7F4:
    dw $FFFF


if !FEATURE_KEEP_UNREFERENCED
;;; $A7F6: Unused ;;;
UNUSED_TransitionTable_PossiblyPartOfAbove_91A7F6:
; Possibly no-op'd sections of the above?
    dw $0080,$0000,$004B
    dw $0400,$0000,$0035
    dw $0000,$0210,$0078
    dw $0000,$0220,$0076
    dw $0000,$0240,$004A
    dw $0000,$0100,$0009
    dw $0000,$0200,$0025
    dw $0000,$0800,$0003
    dw $0000,$0010,$0005
    dw $0000,$0020,$0007
    dw $FFFF
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $A834: Transition table - entry 48 ;;;
UNUSED_TransitionTable_48_91A834:
    dw $FFFF


if !FEATURE_KEEP_UNREFERENCED
;;; $A836: Unused ;;;
UNUSED_TransitionTable_PossiblyPartOfAbove_91A836:
; Possibly no-op'd sections of the above?
    dw $0080,$0000,$004C
    dw $0400,$0000,$0036
    dw $0000,$0120,$0077
    dw $0000,$0110,$0075
    dw $0000,$0140,$0049
    dw $0000,$0200,$000A
    dw $0000,$0100,$0026
    dw $0000,$0800,$0004
    dw $0000,$0010,$0006
    dw $0000,$0020,$0008
    dw $FFFF
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $A874: Transition table - entry 49/75/77 ;;;
TransitionTable_49_75_77_FacingLeft_Moonwalk:
; 49: Facing left - moonwalk
; 75: Facing left - moonwalk - aiming up-left
; 77: Facing left - moonwalk - aiming down-left
    dw $0400,$0000,$0036
    dw $0080,$0000,$00C0
    dw $0080,$0010,$00C2
    dw $0080,$0020,$00C4
    dw $0000,$0160,$0077
    dw $0000,$0150,$0075
    dw $0000,$0140,$0049
    dw $0000,$0200,$000A
    dw $0000,$0100,$0026
    dw $FFFF


;;; $A8AC: Transition table - entry 4A/76/78 ;;;
TransitionTable_4A_76_78_FacingRight_Moonwalk:
; 4A: Facing right - moonwalk
; 76: Facing right - moonwalk - aiming up-right
; 78: Facing right - moonwalk - aiming down-right
    dw $0400,$0000,$0035
    dw $0080,$0000,$00BF
    dw $0080,$0010,$00C1
    dw $0080,$0020,$00C3
    dw $0000,$0250,$0076
    dw $0000,$0260,$0078
    dw $0000,$0240,$004A
    dw $0000,$0100,$0009
    dw $0000,$0200,$0025
    dw $FFFF


;;; $A8E4: Transition table - entry 53 ;;;
TransitionTable_53_FacingRight_Knockback:
; 53: Facing right - knockback
    dw $0000,$0280,$0050
    dw $FFFF


;;; $A8EC: Transition table - entry 54 ;;;
TransitionTable_54_FacingLeft_Knockback:
; 54: Facing left - knockback
    dw $0000,$0180,$004F
    dw $FFFF


;;; $A8F4: Unused ;;;
if !FEATURE_KEEP_UNREFERENCED
UNUSED_TransitionTable_91A8F4:
    dw $FFFF


UNUSED_TransitionTable_91A8F6:
    dw $FFFF


UNUSED_TransitionTable_91A8F8:
    dw $FFFF


UNUSED_TransitionTable_91A8FA:
    dw $FFFF
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $A8FC: Transition table - entry 5B ;;;
UNUSED_TransitionTable_5B_91A8FC:
    dw $0000,$0280,$0066
    dw $FFFF


;;; $A904: Transition table - entry 5C ;;;
UNUSED_TransitionTable_5C_91A904:
    dw $0000,$0180,$0065
    dw $FFFF


;;; $A90C: Transition table - entry 79/7B ;;;
TransitionTable_79_7B_FacingRight_MorphBall_Spring_OnGround:
; 79: Facing right - morph ball - spring ball - on ground
; 7B: Moving right - morph ball - spring ball - on ground
    dw $0800,$0000,$003D
    dw $0080,$0000,$007F
    dw $0000,$0100,$007B
    dw $0000,$0200,$007C
    dw $FFFF


;;; $A926: Transition table - entry 7A/7C ;;;
TransitionTable_7A_7C_FacingLeft_MorphBall_Spring_OnGround:
; 7A: Facing left - morph ball - spring ball - on ground
; 7C: Moving left - morph ball - spring ball - on ground
    dw $0800,$0000,$003E
    dw $0080,$0000,$0080
    dw $0000,$0100,$007B
    dw $0000,$0200,$007C
    dw $FFFF


;;; $A940: Transition table - entry 7D ;;;
TransitionTable_7D_FacingRight_MorphBall_SpringBall_Falling:
; 7D: Facing right - morph ball - spring ball - falling
    dw $0800,$0000,$003D
    dw $0000,$0200,$007E
    dw $0000,$0100,$007D
    dw $FFFF


;;; $A954: Transition table - entry 7E ;;;
TransitionTable_7E_FacingLeft_MorphBall_SpringBall_Falling:
; 7E: Facing left - morph ball - spring ball - falling
    dw $0800,$0000,$003E
    dw $0000,$0100,$007D
    dw $0000,$0200,$007E
    dw $FFFF


;;; $A968: Transition table - entry 7F ;;;
TransitionTable_7F_FacingRight_MorphBall_SpringBall_InAir:
; 7F: Facing right - morph ball - spring ball - in air
    dw $0800,$0000,$003D
    dw $0000,$0100,$007F
    dw $0000,$0200,$0080
    dw $FFFF


;;; $A97C: Transition table - entry 80 ;;;
TransitionTable_80_FacingLeft_MorphBall_SpringBall_InAir:
; 80: Facing left - morph ball - spring ball - in air
    dw $0800,$0000,$003E
    dw $0000,$0100,$007F
    dw $0000,$0200,$0080
    dw $FFFF


;;; $A990: Transition table - entry 63 ;;;
UNUSED_TransitionTable_63_91A990:
    dw $0000,$0280,$0066
    dw $FFFF


;;; $A998: Transition table - entry 64 ;;;
UNUSED_TransitionTable_64_91A998:
    dw $0000,$0180,$0065
    dw $FFFF


;;; $A9A0: Transition table - entry 65 ;;;
UNUSED_TransitionTable_65_91A9A0:
    dw $0000,$0180,$0065
    dw $0000,$0010,$0069
    dw $0000,$0020,$006B
    dw $0000,$0040,$0013
    dw $0000,$0080,$0065
    dw $0000,$0100,$0065
    dw $FFFF


;;; $A9C6: Transition table - entry 66 ;;;
UNUSED_TransitionTable_66_91A9C6:
    dw $0000,$0280,$0066
    dw $0000,$0010,$006A
    dw $0000,$0020,$006C
    dw $0000,$0040,$0014
    dw $0000,$0080,$0066
    dw $0000,$0200,$0066
    dw $FFFF


;;; $A9EC: Transition table - entry 83 ;;;
TransitionTable_83_FacingRight_WallJump:
; 83: Facing right - wall jump
    dw $0400,$0000,$0037
    dw $0000,$0200,$001A
    dw $0000,$0010,$0069
    dw $0000,$0020,$006B
    dw $0000,$0040,$0013
    dw $0000,$0080,$0083
    dw $FFFF


;;; $AA12: Transition table - entry 84 ;;;
TransitionTable_84_FacingLeft_WallJump:
; 84: Facing left - wall jump
    dw $0400,$0000,$0038
    dw $0000,$0100,$0019
    dw $0000,$0010,$006A
    dw $0000,$0020,$006C
    dw $0000,$0040,$0014
    dw $0000,$0080,$0084
    dw $FFFF


;;; $AA38: Transition table - entry 89/CF/D1 ;;;
TransitionTable_89_CF_D1_FacingRight_RanIntoAWall:
; 89: Facing right - ran into a wall
; CF: Facing right - ran into a wall - aiming up-right
; D1: Facing right - ran into a wall - aiming down-right
    dw $0080,$0000,$004B
    dw $0000,$0900,$000F
    dw $0000,$0500,$0011
    dw $0400,$0000,$0035
    dw $0000,$0220,$0078
    dw $0000,$0210,$0076
    dw $0000,$0800,$0003
    dw $0000,$0010,$0005
    dw $0000,$0020,$0007
    dw $0000,$0200,$0025
    dw $0000,$0100,$0009
    dw $FFFF


;;; $AA7C: Transition table - entry 8A/D0/D2 ;;;
TransitionTable_8A_D0_D2_FacingLeft_RanIntoAWall:
; 8A: Facing left - ran into a wall
; D0: Facing left - ran into a wall - aiming up-left
; D2: Facing left - ran into a wall - aiming down-left
    dw $0080,$0000,$004C
    dw $0000,$0A00,$0010
    dw $0000,$0600,$0012
    dw $0400,$0000,$0036
    dw $0000,$0120,$0077
    dw $0000,$0110,$0075
    dw $0000,$0800,$0004
    dw $0000,$0010,$0006
    dw $0000,$0020,$0008
    dw $0000,$0100,$0026
    dw $0000,$0200,$000A
    dw $FFFF


;;; $AAC0: Transition table - entry 13 ;;;
TransitionTable_13_FaceRight_NormalJump_NotMoving_GunExtend:
; 13: Facing right - normal jump - not aiming - not moving - gun extended
    dw $0000,$0980,$0069
    dw $0000,$0580,$006B
    dw $0000,$0190,$0069
    dw $0000,$01A0,$006B
    dw $0000,$0900,$0069
    dw $0000,$0500,$006B
    dw $0000,$0280,$002F
    dw $0000,$0880,$0015
    dw $0000,$0480,$0017
    dw $0000,$0090,$0069
    dw $0000,$00A0,$006B
    dw $0000,$0180,$0051
    dw $0000,$00C0,$0013
    dw $0000,$0200,$002F
    dw $0000,$0800,$0015
    dw $0000,$0400,$0017
    dw $0000,$0010,$0069
    dw $0000,$0020,$006B
    dw $0000,$0100,$0051
    dw $0000,$0040,$0013
    dw $FFFF


;;; $AB3A: Transition table - entry 14 ;;;
TransitionTable_14_FacingLeft_NormalJump_NotMoving_GunExtend:
; 14: Facing left - normal jump - not aiming - not moving - gun extended
    dw $0000,$0A80,$006A
    dw $0000,$0680,$006C
    dw $0000,$0290,$006A
    dw $0000,$02A0,$006C
    dw $0000,$0A00,$006A
    dw $0000,$0600,$006C
    dw $0000,$0180,$0030
    dw $0000,$0880,$0016
    dw $0000,$0480,$0018
    dw $0000,$0090,$006A
    dw $0000,$00A0,$006C
    dw $0000,$0280,$0052
    dw $0000,$00C0,$0014
    dw $0000,$0100,$0030
    dw $0000,$0800,$0016
    dw $0000,$0400,$0018
    dw $0000,$0010,$006A
    dw $0000,$0020,$006C
    dw $0000,$0200,$0052
    dw $0000,$0040,$0014
    dw $FFFF


;;; $ABB4: Transition table - entry 17 ;;;
TransitionTable_17_FacingRight_NormalJump_AimingDown:
; 17: Facing right - normal jump - aiming down
    dw $0400,$0000,$0037
    dw $0000,$0980,$0069
    dw $0000,$0580,$006B
    dw $0000,$0190,$0069
    dw $0000,$01A0,$006B
    dw $0000,$01C0,$0013
    dw $0000,$0900,$0069
    dw $0000,$0500,$006B
    dw $0000,$0280,$002F
    dw $0000,$0880,$0015
    dw $0000,$0480,$0017
    dw $0000,$0090,$0069
    dw $0000,$00A0,$006B
    dw $0000,$0180,$0051
    dw $0000,$00C0,$0013
    dw $0000,$0200,$002F
    dw $0000,$0800,$0015
    dw $0000,$0400,$0017
    dw $0000,$0010,$0069
    dw $0000,$0020,$006B
    dw $0000,$0100,$0051
    dw $0000,$0080,$0017
    dw $0000,$0040,$0013
    dw $FFFF


;;; $AC40: Transition table - entry 18 ;;;
TransitionTable_18_FacingLeft_NormalJump_AimingDown:
; 18: Facing left - normal jump - aiming down
    dw $0400,$0000,$0038
    dw $0000,$0A80,$006A
    dw $0000,$0680,$006C
    dw $0000,$0290,$006A
    dw $0000,$02A0,$006C
    dw $0000,$02A0,$006C
    dw $0000,$0A00,$006A
    dw $0000,$0600,$006C
    dw $0000,$0180,$0030
    dw $0000,$0880,$0016
    dw $0000,$0480,$0018
    dw $0000,$0090,$006A
    dw $0000,$00A0,$006C
    dw $0000,$0280,$0052
    dw $0000,$00C0,$0014
    dw $0000,$0100,$0030
    dw $0000,$0800,$0016
    dw $0000,$0400,$0018
    dw $0000,$0010,$006A
    dw $0000,$0020,$006C
    dw $0000,$0200,$0052
    dw $0000,$0080,$0018
    dw $0000,$0040,$0014
    dw $FFFF


;;; $ACCC: Transition table - entry 3D ;;;
TransitionTable_3D_FacingRight_Unmorphing:
; 3D: Facing right - unmorphing
    dw $0000,$0140,$0067
    dw $0000,$0840,$002B
    dw $0000,$0440,$002D
    dw $FFFF


;;; $ACE0: Transition table - entry 3E ;;;
TransitionTable_3E_FacingLeft_Unmorphing:
; 3E: Facing left - unmorphing
    dw $0000,$0240,$0068
    dw $0000,$0840,$002C
    dw $0000,$0440,$002E
    dw $FFFF


;;; $ACF4: Transition table - entry 25 ;;;
TransitionTable_25_FacingRight_Turning_Standing:
; 25: Facing right - turning - standing
    dw $0000,$0280,$001A
    dw $0080,$0000,$004C
    dw $0000,$0200,$0025
    dw $FFFF


;;; $AD08: Transition table - entry 26 ;;;
TransitionTable_26_FacingLeft_Turning_Standing:
; 26: Facing left - turning - standing
    dw $0000,$0180,$0019
    dw $0080,$0000,$004B
    dw $0000,$0100,$0026
    dw $FFFF


;;; $AD1C: Transition table - entry 8B ;;;
TransitionTable_8B_FacingRight_Turning_Standing_AimingUp:
; 8B: Facing right - turning - standing - aiming up
    dw $0080,$0200,$001A
    dw $0080,$0000,$004C
    dw $0000,$0200,$008B
    dw $FFFF


;;; $AD30: Transition table - entry 8C ;;;
TransitionTable_8C_FacingLeft_Turning_Standing_AimingUp:
; 8C: Facing left - turning - standing - aiming up
    dw $0080,$0100,$0019
    dw $0080,$0000,$004B
    dw $0000,$0100,$008C
    dw $FFFF


;;; $AD44: Transition table - entry 8D ;;;
TransitionTable_8D_FacingRight_Turning_Standing_AimDownRight:
; 8D: Facing right - turning - standing - aiming down-right
    dw $0080,$0200,$001A
    dw $0080,$0000,$004C
    dw $0000,$0200,$008D
    dw $FFFF


;;; $AD58: Transition table - entry 8E ;;;
TransitionTable_8E_FacingLeft_Turning_Standing_AimDownLeft:
; 8E: Facing left - turning - standing - aiming down-left
    dw $0080,$0100,$0019
    dw $0080,$0000,$004B
    dw $0000,$0100,$008E
    dw $FFFF


;;; $AD6C: Transition table - entry C7 ;;;
TransitionTable_C7_FacingRight_VerticalShinesparkWindup:
; C7: Facing right - vertical shinespark windup
    dw $0000,$0880,$00CB
    dw $0000,$0090,$00CD
    dw $0000,$0180,$00C9
    dw $FFFF


;;; $AD80: Transition table - entry C8 ;;;
TransitionTable_C8_FacingLeft_VerticalShinesparkWindup:
; C8: Facing left - vertical shinespark windup
    dw $0000,$0880,$00CC
    dw $0000,$0090,$00CE
    dw $0000,$0280,$00CA
    dw $FFFF


;;; $AD94: Transition table - entry 2D ;;;
TransitionTable_2D_FacingRight_Falling_AimingDown:
; 2D: Facing right - falling - aiming down
    dw $0400,$0000,$0037
    dw $0000,$0900,$006D
    dw $0000,$0500,$006F
    dw $0000,$0800,$002B
    dw $0000,$0400,$002D
    dw $0000,$0200,$0087
    dw $0000,$0010,$006D
    dw $0000,$0020,$006F
    dw $0000,$0040,$0067
    dw $0000,$0100,$0029
    dw $FFFF


;;; $ADD2: Transition table - entry 2E ;;;
TransitionTable_2E_FacingLeft_Falling_AimingDown:
; 2E: Facing left - falling - aiming down
    dw $0400,$0000,$0038
    dw $0000,$0A00,$006E
    dw $0000,$0600,$0070
    dw $0000,$0800,$002C
    dw $0000,$0400,$002E
    dw $0000,$0100,$0088
    dw $0000,$0010,$006E
    dw $0000,$0020,$0070
    dw $0000,$0040,$0068
    dw $0000,$0200,$002A
    dw $FFFF


;;; $AE10: Transition table - entry DF ;;;
UNUSED_TransitionTable_DF_91AE10:
    dw $0800,$0000,$00DE
    dw $FFFF


;;; $AE18: Transition table - entry BA/BB/BC/BD/BE ;;;
TransitionTable_BA_BB_BC_BD_BE_FacingLeft_GrabbedByDraygon:
; BA: Facing left - grabbed by Draygon - not moving - not aiming
; BB: Facing left - grabbed by Draygon - not moving - aiming up-left
; BC: Facing left - grabbed by Draygon - firing
; BD: Facing left - grabbed by Draygon - not moving - aiming down-left
; BE: Facing left - grabbed by Draygon - moving
    dw $0000,$0A40,$00BB
    dw $0000,$0640,$00BD
    dw $0000,$0240,$00BC
    dw $0000,$0010,$00BB
    dw $0000,$0020,$00BD
    dw $0000,$0040,$00BC
    dw $0000,$0200,$00BE
    dw $0000,$0100,$00BE
    dw $0000,$0800,$00BE
    dw $0000,$0400,$00BE
    dw $FFFF


;;; $AE56: Transition table - entry EC/ED/EE/EF/F0 ;;;
TransitionTable_EC_ED_EE_EF_F0_FacingRight_GrabbedByDraygon:
; EC: Facing right - grabbed by Draygon - not moving - not aiming
; ED: Facing right - grabbed by Draygon - not moving - aiming up-right
; EE: Facing right - grabbed by Draygon - firing
; EF: Facing right - grabbed by Draygon - not moving - aiming down-right
; F0: Facing right - grabbed by Draygon - moving
    dw $0000,$0940,$00ED
    dw $0000,$0540,$00EF
    dw $0000,$0140,$00EE
    dw $0000,$0010,$00ED
    dw $0000,$0020,$00EF
    dw $0000,$0040,$00EE
    dw $0000,$0200,$00F0
    dw $0000,$0100,$00F0
    dw $0000,$0800,$00F0
    dw $0000,$0400,$00F0
    dw $FFFF


;;; $AE94: Transition table - entry 0B ;;;
TransitionTable_0B_MovingRight_GunExtended:
; 0B: Moving right - gun extended
    dw $0400,$0000,$0035
    dw $0080,$0000,$0019
    dw $0000,$0110,$000F
    dw $0000,$0120,$0011
    dw $0000,$0900,$000F
    dw $0000,$0500,$0011
    dw $0000,$0140,$000B
    dw $0000,$0100,$000B
    dw $0000,$0200,$0025
    dw $0000,$0800,$0003
    dw $0000,$0010,$0005
    dw $0000,$0020,$0007
    dw $FFFF


;;; $AEDE: Transition table - entry 0C ;;;
TransitionTable_0C_MovingLeft_GunExtended:
; 0C: Moving left - gun extended
    dw $0400,$0000,$0036
    dw $0080,$0000,$001A
    dw $0000,$0210,$0010
    dw $0000,$0220,$0012
    dw $0000,$0A00,$0010
    dw $0000,$0600,$0012
    dw $0000,$0240,$000C
    dw $0000,$0200,$000C
    dw $0000,$0100,$0026
    dw $0000,$0800,$0004
    dw $0000,$0010,$0006
    dw $0000,$0020,$0008
    dw $FFFF


;;; $AF28: Transition table - entry 67 ;;;
TransitionTable_67_FacingRight_Falling_GunExtended:
; 67: Facing right - falling - gun extended
    dw $0000,$0900,$006D
    dw $0000,$0500,$006F
    dw $0000,$0800,$002B
    dw $0000,$0400,$002D
    dw $0000,$0200,$0087
    dw $0000,$0010,$006D
    dw $0000,$0020,$006F
    dw $0000,$0040,$0067
    dw $0000,$0100,$0067
    dw $FFFF


;;; $AF60: Transition table - entry 68 ;;;
TransitionTable_68_FacingLeft_Falling_GunExtended:
; 68: Facing left - falling - gun extended
    dw $0000,$0A00,$006E
    dw $0000,$0600,$0070
    dw $0000,$0800,$002C
    dw $0000,$0400,$002E
    dw $0000,$0100,$0088
    dw $0000,$0010,$006E
    dw $0000,$0020,$0070
    dw $0000,$0040,$0068
    dw $0000,$0200,$0068
    dw $FFFF


;;; $AF98: Transition table - entry BF ;;;
TransitionTable_BF_FacingRight_Moonwalking_TurnJumpLeft:
; BF: Facing right - moonwalking - turn/jump left
    dw $0000,$0280,$001A
    dw $0080,$0000,$004C
    dw $0000,$0200,$00BF
    dw $FFFF


;;; $AFAC: Transition table - entry C0 ;;;
TransitionTable_C0_FacingLeft_Moonwalking_TurnJumpRight:
; C0: Facing left - moonwalking - turn/jump right
    dw $0000,$0180,$0019
    dw $0080,$0000,$004B
    dw $0000,$0100,$00C0
    dw $FFFF


;;; $AFC0: Transition table - entry C1 ;;;
TransitionTable_C1_FaceRight_Moonwalk_TurnJumpLeft_AimUpRight:
; C1: Facing right - moonwalking - turn/jump left - aiming up-right
    dw $0080,$0200,$001A
    dw $0080,$0000,$004C
    dw $0000,$0200,$00C1
    dw $FFFF


;;; $AFD4: Transition table - entry C2 ;;;
TransitionTable_C2_FaceLeft_Moonwalk_TurnJumpRight_AimUpLeft:
; C2: Facing left - moonwalking - turn/jump right - aiming up-left
    dw $0080,$0100,$0019
    dw $0080,$0000,$004B
    dw $0000,$0100,$00C2
    dw $FFFF


;;; $AFE8: Transition table - entry C3 ;;;
TransitionTable_C3_FaceRight_Moonwalk_TurnJumpLeft_AimDownRight:
; C3: Facing right - moonwalking - turn/jump left - aiming down-right
    dw $0080,$0200,$001A
    dw $0080,$0000,$004C
    dw $0000,$0200,$00C3
    dw $FFFF


;;; $AFFC: Transition table - entry C4 ;;;
TransitionTable_C4_FaceLeft_Moonwalk_TurnJumpRight_AimDownLeft:
; C4: Facing left - moonwalking - turn/jump right - aiming down-left
    dw $0080,$0100,$0019
    dw $0080,$0000,$004B
    dw $0000,$0100,$00C4
    dw $FFFF


;;; $B010: Animation delay table ;;;
AnimationDelayTable:
; Indexed by [Samus pose] * 2
    dw AnimationDelays_0_9B
    dw AnimationDelays_01_02
    dw AnimationDelays_01_02
    dw AnimationDelays_03_04_85_86
    dw AnimationDelays_03_04_85_86
    dw AnimationDelays_Various_91B2B4
    dw AnimationDelays_Various_91B2B4
    dw AnimationDelays_Various_91B2B4
    dw AnimationDelays_Various_91B2B4
    dw AnimationDelays_09_0A_0B_0C_0D_0E_0F_10_11_12_45_46
    dw AnimationDelays_09_0A_0B_0C_0D_0E_0F_10_11_12_45_46
    dw AnimationDelays_09_0A_0B_0C_0D_0E_0F_10_11_12_45_46
    dw AnimationDelays_09_0A_0B_0C_0D_0E_0F_10_11_12_45_46
    dw AnimationDelays_09_0A_0B_0C_0D_0E_0F_10_11_12_45_46
    dw AnimationDelays_09_0A_0B_0C_0D_0E_0F_10_11_12_45_46
    dw AnimationDelays_09_0A_0B_0C_0D_0E_0F_10_11_12_45_46
    dw AnimationDelays_09_0A_0B_0C_0D_0E_0F_10_11_12_45_46
    dw AnimationDelays_09_0A_0B_0C_0D_0E_0F_10_11_12_45_46
    dw AnimationDelays_09_0A_0B_0C_0D_0E_0F_10_11_12_45_46
    dw AnimationDelays_13_14_69_6A_6B_6C
    dw AnimationDelays_13_14_69_6A_6B_6C
    dw AnimationDelays_15_16
    dw AnimationDelays_15_16
    dw AnimationDelays_17_18
    dw AnimationDelays_17_18
    dw AnimationDelays_19_1A
    dw AnimationDelays_19_1A
    dw AnimationDelays_1B_1C
    dw AnimationDelays_1B_1C
    dw AnimationDelays_Various_91B378
    dw AnimationDelays_Various_91B378
    dw AnimationDelays_Various_91B378
    dw AnimationDelays_Various_91B378
    dw AnimationDelays_Various_91B378
    dw AnimationDelays_Various_91B378
    dw AnimationDelays_Various_91B378
    dw AnimationDelays_Various_91B378
    dw AnimationDelays_25
    dw AnimationDelays_26
    dw AnimationDelays_27_28
    dw AnimationDelays_27_28
    dw AnimationDelays_29_2A
    dw AnimationDelays_29_2A
    dw AnimationDelays_2B_2C
    dw AnimationDelays_2B_2C
    dw AnimationDelays_2D_2E
    dw AnimationDelays_2D_2E
    dw AnimationDelays_2F
    dw AnimationDelays_30
    dw AnimationDelays_Various_91B378
    dw AnimationDelays_Various_91B378
    dw AnimationDelays_Various_91B378
    dw AnimationDelays_Various_91B378
    dw AnimationDelays_35
    dw AnimationDelays_36
    dw AnimationDelays_37
    dw AnimationDelays_38
    dw UNUSED_AnimationDelays_39_91B4DA
    dw UNUSED_AnimationDelays_3A_91B4DD
    dw AnimationDelays_3B
    dw AnimationDelays_3C
    dw AnimationDelays_3D
    dw AnimationDelays_3E
    dw UNUSED_AnimationDelays_3F_91B4EE
    dw UNUSED_AnimationDelays_40_91B4F4
    dw AnimationDelays_Various_91B378
    dw AnimationDelays_Various_91B378
    dw AnimationDelays_43
    dw AnimationDelays_44
    dw AnimationDelays_09_0A_0B_0C_0D_0E_0F_10_11_12_45_46
    dw AnimationDelays_09_0A_0B_0C_0D_0E_0F_10_11_12_45_46
    dw AnimationDelays_Various_91B2B4
    dw AnimationDelays_Various_91B2B4
    dw AnimationDelays_49_4A_75_76_77_78
    dw AnimationDelays_49_4A_75_76_77_78
    dw AnimationDelays_4B
    dw AnimationDelays_4C
    dw AnimationDelays_4D_4E_C7_C8
    dw AnimationDelays_4D_4E_C7_C8
    dw AnimationDelays_4F_50
    dw AnimationDelays_4F_50
    dw AnimationDelays_51_52
    dw AnimationDelays_51_52
    dw AnimationDelays_53_54
    dw AnimationDelays_53_54
    dw AnimationDelays_55
    dw AnimationDelays_56
    dw AnimationDelays_57
    dw AnimationDelays_58
    dw AnimationDelays_59
    dw AnimationDelays_5A
    dw AnimationDelays_Various_91B378
    dw AnimationDelays_Various_91B378
    dw AnimationDelays_Various_91B378
    dw AnimationDelays_Various_91B378
    dw AnimationDelays_Various_91B378
    dw AnimationDelays_Various_91B378
    dw AnimationDelays_Various_91B378
    dw AnimationDelays_Various_91B378
    dw UNUSED_AnimationDelays_63_91B47E
    dw UNUSED_AnimationDelays_64_91B482
    dw UNUSED_AnimationDelays_65_66_91B486
    dw UNUSED_AnimationDelays_65_66_91B486
    dw AnimationDelays_67_68
    dw AnimationDelays_67_68
    dw AnimationDelays_13_14_69_6A_6B_6C
    dw AnimationDelays_13_14_69_6A_6B_6C
    dw AnimationDelays_13_14_69_6A_6B_6C
    dw AnimationDelays_13_14_69_6A_6B_6C
    dw AnimationDelays_6D_6E_6F_70
    dw AnimationDelays_6D_6E_6F_70
    dw AnimationDelays_6D_6E_6F_70
    dw AnimationDelays_6D_6E_6F_70
    dw AnimationDelays_Various_91B2B4
    dw AnimationDelays_Various_91B2B4
    dw AnimationDelays_Various_91B2B4
    dw AnimationDelays_Various_91B2B4
    dw AnimationDelays_49_4A_75_76_77_78
    dw AnimationDelays_49_4A_75_76_77_78
    dw AnimationDelays_49_4A_75_76_77_78
    dw AnimationDelays_49_4A_75_76_77_78
    dw AnimationDelays_Various_91B378
    dw AnimationDelays_Various_91B378
    dw AnimationDelays_Various_91B378
    dw AnimationDelays_Various_91B378
    dw AnimationDelays_Various_91B378
    dw AnimationDelays_Various_91B378
    dw AnimationDelays_Various_91B378
    dw AnimationDelays_Various_91B378
    dw AnimationDelays_81_82
    dw AnimationDelays_81_82
    dw AnimationDelays_83_84
    dw AnimationDelays_83_84
    dw AnimationDelays_03_04_85_86
    dw AnimationDelays_03_04_85_86
    dw AnimationDelays_87
    dw AnimationDelays_88
    dw AnimationDelays_Various_91B2B4
    dw AnimationDelays_Various_91B2B4
    dw AnimationDelays_8B
    dw AnimationDelays_8C
    dw AnimationDelays_8D
    dw AnimationDelays_8E
    dw AnimationDelays_8F
    dw AnimationDelays_90
    dw AnimationDelays_91
    dw AnimationDelays_92
    dw AnimationDelays_93
    dw AnimationDelays_94
    dw AnimationDelays_95
    dw AnimationDelays_96
    dw AnimationDelays_97
    dw AnimationDelays_98
    dw AnimationDelays_99
    dw AnimationDelays_9A
    dw AnimationDelays_0_9B
    dw AnimationDelays_9C
    dw AnimationDelays_9D
    dw AnimationDelays_9E
    dw AnimationDelays_9F
    dw AnimationDelays_A0
    dw AnimationDelays_A1
    dw AnimationDelays_A2
    dw AnimationDelays_A3
    dw AnimationDelays_A4_E6
    dw AnimationDelays_A5_E7
    dw AnimationDelays_A6
    dw AnimationDelays_A7
    dw AnimationDelays_A8_A9_AA_AB
    dw AnimationDelays_A8_A9_AA_AB
    dw AnimationDelays_A8_A9_AA_AB
    dw AnimationDelays_A8_A9_AA_AB
    dw AnimationDelays_AC_AD
    dw AnimationDelays_AC_AD
    dw AnimationDelays_AE_AF
    dw AnimationDelays_AE_AF
    dw AnimationDelays_B0_B1
    dw AnimationDelays_B0_B1
    dw AnimationDelays_B2_B3
    dw AnimationDelays_B2_B3
    dw AnimationDelays_Various_91B2B4
    dw AnimationDelays_Various_91B2B4
    dw AnimationDelays_Various_91B2B4
    dw AnimationDelays_Various_91B2B4
    dw AnimationDelays_Various_91B2B4
    dw AnimationDelays_Various_91B2B4
    dw AnimationDelays_Various_91B2B4
    dw AnimationDelays_Various_91B2B4
    dw AnimationDelays_Various_91B2B4
    dw AnimationDelays_Various_91B2B4
    dw AnimationDelays_BE_F0
    dw AnimationDelays_BF
    dw AnimationDelays_C0
    dw AnimationDelays_C1
    dw AnimationDelays_C2
    dw AnimationDelays_C3
    dw AnimationDelays_C4
    dw AnimationDelays_Various_91B378
    dw UNUSED_AnimationDelays_C6_91B479
    dw AnimationDelays_4D_4E_C7_C8
    dw AnimationDelays_4D_4E_C7_C8
    dw AnimationDelays_C9_CA_CB_CC_CD_CE
    dw AnimationDelays_C9_CA_CB_CC_CD_CE
    dw AnimationDelays_C9_CA_CB_CC_CD_CE
    dw AnimationDelays_C9_CA_CB_CC_CD_CE
    dw AnimationDelays_C9_CA_CB_CC_CD_CE
    dw AnimationDelays_C9_CA_CB_CC_CD_CE
    dw AnimationDelays_Various_91B2B4
    dw AnimationDelays_Various_91B2B4
    dw AnimationDelays_Various_91B2B4
    dw AnimationDelays_Various_91B2B4
    dw AnimationDelays_D3
    dw AnimationDelays_D4
    dw AnimationDelays_D5_D6_D9_DA
    dw AnimationDelays_D5_D6_D9_DA
    dw AnimationDelays_D7_D8
    dw AnimationDelays_D7_D8
    dw AnimationDelays_D5_D6_D9_DA
    dw AnimationDelays_D5_D6_D9_DA
    dw UNUSED_AnimationDelays_DB_91B4FA
    dw UNUSED_AnimationDelays_DC_91B504
    dw UNUSED_AnimationDelays_DD_91B50E
    dw UNUSED_AnimationDelays_DE_91B513
    dw AnimationDelays_Various_91B378
    dw AnimationDelays_E0
    dw AnimationDelays_E1
    dw AnimationDelays_E2
    dw AnimationDelays_E3
    dw AnimationDelays_E4
    dw AnimationDelays_E5
    dw AnimationDelays_A4_E6
    dw AnimationDelays_A5_E7
    dw AnimationDelays_E8
    dw AnimationDelays_E9
    dw AnimationDelays_EA
    dw AnimationDelays_EB
    dw AnimationDelays_Various_91B2B4
    dw AnimationDelays_Various_91B2B4
    dw AnimationDelays_Various_91B2B4
    dw AnimationDelays_Various_91B2B4
    dw AnimationDelays_BE_F0
    dw AnimationDelays_F1
    dw AnimationDelays_F2
    dw AnimationDelays_F3
    dw AnimationDelays_F4
    dw AnimationDelays_F5
    dw AnimationDelays_F6
    dw AnimationDelays_F7
    dw AnimationDelays_F8
    dw AnimationDelays_F9
    dw AnimationDelays_FA
    dw AnimationDelays_FB
    dw AnimationDelays_FC

; Positive values are animation delay durations, negative values are instructions (first nybble ignored):
;     F6:                  Go to beginning if [Samus health] >= 30
;     F7:                  Set drained Samus movement handler
;     F8 pp:               Enable auto-jump hack and transition to pose p if not jumping
;     F9 eeee gg aa GG AA: Transition to pose G/A if item e equipped, otherwise g/a, and to pose g/G if Y speed = 0, otherwise a/A
;     FA gg aa:            Transition to pose g if Y speed = 0, otherwise a
;     FB:                  Select animation delay sequence for wall-jump
;     FC eeee pp PP:       Transition to pose P if item e equipped, otherwise p
;     FD pp:               Transition to pose p
;     FE nn:               Go back n bytes
;     FF:                  Go to beginning

AnimationDelays_09_0A_0B_0C_0D_0E_0F_10_11_12_45_46:; 9: Moving right - not aiming
; Ah: Moving left-   not aiming
; Bh: Moving right - gun extended
; Ch: Moving left-   gun extended
; Dh: Moving right - aiming up (unused)
; Eh: Moving left-   aiming up (unused)
; Fh: Moving right - aiming up-right
; 10h: Moving left-   aiming up-left
; 11h: Moving right - aiming down-right
; 12h: Moving left-   aiming down-left
; 45h: Unused
; 46h: Unused
    db $02,$03,$02,$03,$02,$03,$02,$03,$02,$03,$FF

if !FEATURE_KEEP_UNREFERENCED
UNUSED_AnimationDelays_91B215:
; Unused. Not a subanimation of the above, just looks like a slower version
    db $04,$04,$04,$04,$04,$04,$03,$04,$04,$03,$FF
    db $0A,$FF
endif ; !FEATURE_KEEP_UNREFERENCED

AnimationDelays_03_04_85_86:
; 3: Facing right - aiming up
; 4: Facing left-   aiming up
; 85h: Facing right - crouching - aiming up
; 86h: Facing left-   crouching - aiming up
    db $02
    db $10, $FE,$01

AnimationDelays_49_4A_75_76_77_78:
; 49h: Facing left-   moonwalk
; 4Ah: Facing right - moonwalk
; 75h: Facing left-   moonwalk - aiming up-left
; 76h: Facing right - moonwalk - aiming up-right
; 77h: Facing left-   moonwalk - aiming down-left
; 78h: Facing right - moonwalk - aiming down-right
    db $10,$10,$10,$10,$10,$10,$FF

AnimationDelays_A4_E6:
; A4h: Facing right - landing from normal jump
; E6h: Facing right - landing from normal jump - firing
    db $05,$02,$F8,$01

AnimationDelays_A5_E7:
; A5h: Facing left-   landing from normal jump
; E7h: Facing left-   landing from normal jump - firing
    db $05,$02,$F8,$02

AnimationDelays_A6:
; A6h: Facing right - landing from spin jump
    db $03,$05,$02,$F8,$01

AnimationDelays_A7:
; A7h: Facing left-   landing from spin jump
    db $03,$05,$02,$F8,$02

AnimationDelays_E0:
; E0h: Facing right - landing from normal jump - aiming up
    db $05,$02,$F8,$03

AnimationDelays_E1:
; E1h: Facing left-   landing from normal jump - aiming up
    db $05,$02,$F8,$04

AnimationDelays_E2:
; E2h: Facing right - landing from normal jump - aiming up-right
    db $05,$02,$F8,$05

AnimationDelays_E3:
; E3h: Facing left-   landing from normal jump - aiming up-left
    db $05,$02,$F8,$06

AnimationDelays_E4:
; E4h: Facing right - landing from normal jump - aiming down-right
    db $05,$02,$F8,$07

AnimationDelays_E5:
; E5h: Facing left-   landing from normal jump - aiming down-left
    db $05,$02,$F8,$08

AnimationDelays_E8:
; E8h: Facing right - Samus drained - crouching/falling
    db $02,$02,$02,$10,$F7
    db $01, $FE,$01
    db $10,$10,$10,$10, $FE,$04
    db $03,$FD,$01

AnimationDelays_E9:
; E9h: Facing left-   Samus drained - crouching/falling
    ; Falling
    db $02,$02,$10,$F7
    db $01, $FE,$01
    ; Crouching
    db $08
    db $10,$10,$10,$10, $FE,$04
    ; Samus is let up
    db $10,$10,$10, $FD,$02
    ; Samus fails to stand up
    db $10,$10,$10,$10,$10, $FE,$0E
    ; Samus gets hit
    db $10, $FE,$11
    ; Samus is frozen (receiving hyper beam)
    db $10, $FE,$01

AnimationDelays_EA:
; EAh: Facing right - Samus drained - standing
    db $10,$10,$10,$10,$FF
    ; Samus is let up
    db $03, $FD,$01

AnimationDelays_EB:
; EBh: Facing left-   Samus drained - standing
    db $10,$10,$10,$10,$FF
    ; Samus is let up
    db $03, $FD,$02

AnimationDelays_01_02:
; 1: Facing right - normal
; 2: Facing left-   normal
    db $0A,$0A,$0A,$0A,$F6
    db $08,$08,$08,$08, $FE,$04

AnimationDelays_27_28:
; 27h: Facing right - crouching
; 28h: Facing left-   crouching
    db $0A,$0A,$0A,$0A,$F6
    db $08,$08,$08,$08, $FE,$04

AnimationDelays_D5_D6_D9_DA:
; D5h: Facing right - x-ray - standing
; D6h: Facing left-   x-ray - standing
; D9h: Facing right - x-ray - crouching
; DAh: Facing left-   x-ray - crouching
; These delays don't really take effect, Samus animation frame is set every frame during x-ray
    db $0F ; Looking up
    db $0F ; Looking up-forward
    db $0F ; Looking forward
    db $0F ; Looking down-forward
    db $0F ; Looking down
    db $FF

AnimationDelays_Various_91B2B4:
; 5: Facing right - aiming up-right
; 6: Facing left-   aiming up-left
; 7: Facing right - aiming down-right
; 8: Facing left-   aiming down-left
; 47h: Unused
; 48h: Unused
; 71h: Facing right - crouching - aiming up-right
; 72h: Facing left-   crouching - aiming up-left
; 73h: Facing right - crouching - aiming down-right
; 74h: Facing left-   crouching - aiming down-left
; 89h: Facing right - ran into a wall
; 8Ah: Facing left-   ran into a wall
; B4h: Facing right - grappling - crouching
; B5h: Facing left-   grappling - crouching
; B6h: Facing right - grappling - crouching - aiming down-right
; B7h: Facing left-   grappling - crouching - aiming down-left
; B8h: Facing left-   grapple wall jump pose
; B9h: Facing right - grapple wall jump pose
; BAh: Facing left-   grabbed by Draygon - not moving - not aiming
; BBh: Facing left-   grabbed by Draygon - not moving - aiming up-left
; BCh: Facing left-   grabbed by Draygon - firing
; BDh: Facing left-   grabbed by Draygon - not moving - aiming down-left
; CFh: Facing right - ran into a wall - aiming up-right
; D0h: Facing left-   ran into a wall - aiming up-left
; D1h: Facing right - ran into a wall - aiming down-right
; D2h: Facing left-   ran into a wall - aiming down-left
; ECh: Facing right - grabbed by Draygon - not moving - not aiming
; EDh: Facing right - grabbed by Draygon - not moving - aiming up-right
; EEh: Facing right - grabbed by Draygon - firing
; EFh: Facing right - grabbed by Draygon - not moving - aiming down-right
    db $10,$FF

AnimationDelays_A8_A9_AA_AB:
; A8h: Facing right - grappling
; A9h: Facing left-   grappling
; AAh: Facing right - grappling - aiming down-right
; ABh: Facing left-   grappling - aiming down-left
    db $10,$FF

AnimationDelays_AC_AD:
; ACh: Unused. Facing right - grappling - in air
; ADh: Unused. Facing left-   grappling - in air
    db $02
    db $10, $FE,$01

AnimationDelays_AE_AF:
; AEh: Unused. Facing right - grappling - in air - aiming down
; AFh: Unused. Facing left-   grappling - in air - aiming down
    db $02
    db $10, $FE,$01

AnimationDelays_B0_B1:
; B0h: Unused. Facing right - grappling - in air - aiming down-right
; B1h: Unused. Facing left-   grappling - in air - aiming down-left
    db $02
    db $10, $FE,$01

AnimationDelays_B2_B3:
; B2h: Facing clockwise   -   grapple swinging
; B3h: Facing anticlockwise - grapple swinging
; These delays don't really take effect, Samus animation frame is set every frame during grapple swinging
    ; Swinging
    db $08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08
    db $08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08
    ; Kicking
    db $08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08
    db $08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08
    ; Hanging straight down
    db $08
    db $08, $FE,$01

AnimationDelays_4B:
; 4Bh: Facing right - normal jump transition
    db $01, $FD,$4D

AnimationDelays_4C:
; 4Ch: Facing left-   normal jump transition
    db $01, $FD,$4E

AnimationDelays_55:
; 55h: Facing right - normal jump transition - aiming up
    db $01, $FD,$15, $00

AnimationDelays_56:
; 56h: Facing left-   normal jump transition - aiming up
    db $01, $FD,$16, $00

AnimationDelays_57:
; 57h: Facing right - normal jump transition - aiming up-right
    db $01, $FD,$69, $00

AnimationDelays_58:
; 58h: Facing left-   normal jump transition - aiming up-left
    db $01, $FD,$6A, $00

AnimationDelays_59:
; 59h: Facing right - normal jump transition - aiming down-right
    db $01, $FD,$6B, $00

AnimationDelays_5A:
; 5Ah: Facing left-   normal jump transition - aiming down-left
    db $01, $FD,$6C, $00

AnimationDelays_4D_4E_C7_C8:
; 4Dh: Facing right - normal jump - not aiming - not moving - gun not extended
; 4Eh: Facing left-   normal jump - not aiming - not moving - gun not extended
; C7h: Facing right - vertical shinespark windup
; C8h: Facing left-   vertical shinespark windup
    db $03,$04,$04,$04,$04
    db $50, $FE,$01

AnimationDelays_4F_50:
; 4Fh: Facing left-   damage boost
; 50h: Facing right - damage boost
    db $08,$02,$02,$02,$02,$02,$02,$02,$02
    db $02, $FE,$01

AnimationDelays_15_16:
; 15h: Facing right - normal jump - aiming up
; 16h: Facing left-   normal jump - aiming up
    db $02
    db $10, $FE,$01

AnimationDelays_17_18:
; 17h: Facing right - normal jump - aiming down
; 18h: Facing left-   normal jump - aiming down
    db $02
    db $10, $FE,$01

AnimationDelays_51_52:
; 51h: Facing right - normal jump - not aiming - moving forward
; 52h: Facing left-   normal jump - not aiming - moving forward
    db $02
    db $03, $FE,$01

AnimationDelays_13_14_69_6A_6B_6C:
; 13h: Facing right - normal jump - not aiming - not moving - gun extended
; 14h: Facing left-   normal jump - not aiming - not moving - gun extended
; 69h: Facing right - normal jump - aiming up-right
; 6Ah: Facing left-   normal jump - aiming up-left
; 6Bh: Facing right - normal jump - aiming down-right
; 6Ch: Facing left-   normal jump - aiming down-left
    db $02
    db $10, $FE,$01

AnimationDelays_29_2A:
; 29h: Facing right - falling
; 2Ah: Facing left-   falling
    db $08,$06
    db $06, $FE,$01
    ; Terminal velocity
    db $08
    db $10, $FE,$01

AnimationDelays_67_68:
; 67h: Facing right - falling - gun extended
; 68h: Facing left-   falling - gun extended
    db $08,$06
    db $06, $FE,$01
    ; Terminal velocity
    db $08
    db $10, $FE,$01

AnimationDelays_2B_2C:
; 2Bh: Facing right - falling - aiming up
; 2Ch: Facing left-   falling - aiming up
    db $02,$10
    db $10, $FE,$01

AnimationDelays_6D_6E_6F_70:
; 6Dh: Facing right - falling - aiming up-right
; 6Eh: Facing left-   falling - aiming up-left
; 6Fh: Facing right - falling - aiming down-right
; 70h: Facing left-   falling - aiming down-left
    db $02,$F0
    db $10, $FE,$01

AnimationDelays_2D_2E:
; 2Dh: Facing right - falling - aiming down
; 2Eh: Facing left-   falling - aiming down
    db $02
    db $10, $FE,$01

AnimationDelays_53_54:
; 53h: Facing right - knockback
; 54h: Facing left-   knockback
    db $02
    db $10, $FE,$01

if !FEATURE_KEEP_UNREFERENCED
UNUSED_AnimationDelays_91B36E:
; Unused. Not a subanimation of the above
    db $06,$06,$06,$08,$FF
    db $08,$08,$FF
    db $0A,$FF
endif ; !FEATURE_KEEP_UNREFERENCED

AnimationDelays_Various_91B378:
; 1Dh: Facing right - morph ball - no springball - on ground
; 1Eh: Moving right - morph ball - no springball - on ground
; 1Fh: Moving left-   morph ball - no springball - on ground
; 20h: Unused
; 21h: Unused
; 22h: Unused
; 23h: Unused
; 24h: Unused
; 31h: Facing right - morph ball - no springball - in air
; 32h: Facing left-   morph ball - no springball - in air
; 33h: Unused
; 34h: Unused
; 41h: Facing left-   morph ball - no springball - on ground
; 42h: Unused
; 5Bh: Unused
; 5Ch: Unused
; 5Dh: Unused
; 5Eh: Unused
; 5Fh: Unused
; 60h: Unused
; 61h: Unused
; 62h: Unused
; 79h: Facing right - morph ball - spring ball - on ground
; 7Ah: Facing left-   morph ball - spring ball - on ground
; 7Bh: Moving right - morph ball - spring ball - on ground
; 7Ch: Moving left-   morph ball - spring ball - on ground
; 7Dh: Facing right - morph ball - spring ball - falling
; 7Eh: Facing left-   morph ball - spring ball - falling
; 7Fh: Facing right - morph ball - spring ball - in air
; 80h: Facing left-   morph ball - spring ball - in air
; C5h: Unused
; DFh: Unused. Related to Draygon
    db $03,$03,$03,$03,$03,$03,$03,$03,$FF
    ; Unused. Squished morph ball
    db $03, $FE,$0A

AnimationDelays_19_1A:
; 19h: Facing right - spin jump
; 1Ah: Facing left-   spin jump
    db $04
    db $03,$02,$03,$02,$03,$02,$03,$02, $FE,$08
    ; Wall jump eligible
    db $08,$FF

AnimationDelays_1B_1C:
; 1Bh: Facing right - space jump
; 1Ch: Facing left-   space jump
    db $04
    db $01,$01,$01,$01,$01,$01,$01,$01, $FE,$08
    ; Wall jump eligible
    db $08,$FF

AnimationDelays_81_82:
; 81h: Facing right - screw attack
; 82h: Facing left-   screw attack
    db $04
    db $01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01, $FE,$18
    ; Wall jump eligible
    db $08,$FF

AnimationDelays_25:
; 25h: Facing right - turning - standing
    db $02,$02,$02, $F8,$02

AnimationDelays_26:
; 26h: Facing left-   turning - standing
    db $02,$02,$02, $F8,$01

AnimationDelays_2F:
; 2Fh: Facing right - turning - jumping
    db $02,$02,$02, $F8,$52

AnimationDelays_30:
; 30h: Facing left-   turning - jumping
    db $02,$02,$02, $F8,$51

AnimationDelays_43:
; 43h: Facing right - turning - crouching
    db $02,$02,$02, $F8,$28

AnimationDelays_44:
; 44h: Facing left-   turning - crouching
    db $02,$02,$02, $F8,$27

AnimationDelays_87:
; 87h: Facing right - turning - falling
    db $02,$02,$02, $F8,$2A

AnimationDelays_88:
; 88h: Facing left-   turning - falling
    db $02,$02,$02, $F8,$29

AnimationDelays_8B:
; 8Bh: Facing right - turning - standing - aiming up
    db $02,$02,$02, $F8,$04

AnimationDelays_8C:
; 8Ch: Facing left-   turning - standing - aiming up
    db $02,$02,$02, $F8,$03

AnimationDelays_8D:
; 8Dh: Facing right - turning - standing - aiming down-right
    db $02,$02,$02, $F8,$08

AnimationDelays_8E:
; 8Eh: Facing left-   turning - standing - aiming down-left
    db $02,$02,$02, $F8,$07

AnimationDelays_8F:
; 8Fh: Facing right - turning - in air - aiming up
    db $02,$02,$02, $F8,$16

AnimationDelays_90:
; 90h: Facing left-   turning - in air - aiming up
    db $02,$02,$02, $F8,$15

AnimationDelays_91:
; 91h: Facing right - turning - in air - aiming down/down-right
    db $02,$02,$02, $F8,$18

AnimationDelays_92:
; 92h: Facing left-   turning - in air - aiming down/down-left
    db $02,$02,$02, $F8,$17

AnimationDelays_93:
; 93h: Facing right - turning - falling - aiming up
    db $02,$02,$02, $F8,$2C

AnimationDelays_94:
; 94h: Facing left-   turning - falling - aiming up
    db $02,$02,$02, $F8,$2B

AnimationDelays_95:
; 95h: Facing right - turning - falling - aiming down/down-right
    db $02,$02,$02, $F8,$2E

AnimationDelays_96:
; 96h: Facing left-   turning - falling - aiming down/down-left
    db $02,$02,$02, $F8,$2D

AnimationDelays_97:
; 97h: Facing right - turning - crouching - aiming up
    db $02,$02,$02, $F8,$86

AnimationDelays_98:
; 98h: Facing left-   turning - crouching - aiming up
    db $02,$02,$02, $F8,$85

AnimationDelays_99:
; 99h: Facing right - turning - crouching - aiming down/down-right
    db $02,$02,$02, $F8,$74

AnimationDelays_9A:
; 9Ah: Facing left-   turning - crouching - aiming down/down-left
    db $02,$02,$02, $F8,$73

AnimationDelays_9C:
; 9Ch: Facing right - turning - standing - aiming up-right
    db $02,$02,$02, $F8,$06

AnimationDelays_9D:
; 9Dh: Facing left-   turning - standing - aiming up-left
    db $02,$02,$02, $F8,$05

AnimationDelays_9E:
; 9Eh: Facing right - turning - in air - aiming up-right
    db $02,$02,$02, $F8,$6A

AnimationDelays_9F:
; 9Fh: Facing left-   turning - in air - aiming up-left
    db $02,$02,$02, $F8,$69

AnimationDelays_A0:
; A0h: Facing right - turning - falling - aiming up-right
    db $02,$02,$02, $F8,$6E

AnimationDelays_A1:
; A1h: Facing left-   turning - falling - aiming up-left
    db $02,$02,$02, $F8,$6D

AnimationDelays_A2:
; A2h: Facing right - turning - crouching - aiming up-right
    db $02,$02,$02, $F8,$72

AnimationDelays_A3:
; A3h: Facing left-   turning - crouching - aiming up-left
    db $02,$02,$02, $F8,$71

AnimationDelays_BF:
; BFh: Facing right - moonwalking - turn/jump left
    db $02,$02,$02, $F8,$1A

AnimationDelays_C0:
; C0h: Facing left-   moonwalking - turn/jump right
    db $02,$02,$02, $F8,$19

AnimationDelays_C1:
; C1h: Facing right - moonwalking - turn/jump left-   aiming up-right
    db $02,$02,$02, $F8,$1A

AnimationDelays_C2:
; C2h: Facing left-   moonwalking - turn/jump right - aiming up-left
    db $02,$02,$02, $F8,$19

AnimationDelays_C3:
; C3h: Facing right - moonwalking - turn/jump left-   aiming down-right
    db $02,$02,$02, $F8,$1A

AnimationDelays_C4:
; C4h: Facing left-   moonwalking - turn/jump right - aiming down-left
    db $02,$02,$02, $F8,$19

UNUSED_AnimationDelays_C6_91B479:
    db $02,$02,$02, $FD,$BA

UNUSED_AnimationDelays_63_91B47E:
    db $04
    db $03, $FE,$01

UNUSED_AnimationDelays_64_91B482:
    db $04
    db $03, $FE,$01

UNUSED_AnimationDelays_65_66_91B486:
; 65h: Unused. Related to movement type Dh
; 66h: Unused. Related to movement type Dh
    db $03
    db $02,$02,$02,$02,$02,$02,$02,$02, $FE,$08

AnimationDelays_83_84:
; 83h: Facing right - wall jump
; 84h: Facing left-   wall jump
    ; Wall jump start-up
    db $05,$05,$FB
    ; Normal
    db $03,$02,$03,$02,$03,$02,$03,$02,$FE,$08
    ; Space jump
    db $02,$01,$02,$01,$02,$01,$02,$01,$FE,$08
    ; Screw attack
    db $01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01, $FE,$18

AnimationDelays_35:
; 35h: Facing right - crouching transition
    db $03, $FD,$27

AnimationDelays_36:
; 36h: Facing left-   crouching transition
    db $03, $FD,$28

AnimationDelays_37:
; 37h: Facing right - morphing transition
    db $03,$03, $F9 : dw $0002 : db $1D,$31,$79,$7D

AnimationDelays_38:
; 38h: Facing left-   morphing transition
    db $03,$03, $F9 : dw $0002 : db $41,$32,$7A,$7E

UNUSED_AnimationDelays_39_91B4DA:
    db $00, $FD,$20

UNUSED_AnimationDelays_3A_91B4DD:
    db $00, $FD,$42

AnimationDelays_3B:
; 3Bh: Facing right - standing transition
    db $03, $FD,$01

AnimationDelays_3C:
; 3Ch: Facing left-   standing transition
    db $03, $FD,$02

AnimationDelays_3D:
; 3Dh: Facing right - unmorphing transition
    db $03,$03, $FD,$27

AnimationDelays_3E:
; 3Eh: Facing left-   unmorphing transition
    db $03,$03, $FD,$28

UNUSED_AnimationDelays_3F_91B4EE:
    db $00, $FC : dw $0002 : db $1D,$79

UNUSED_AnimationDelays_40_91B4F4:
    db $00, $FC : dw $0002 : db $41,$7A

UNUSED_AnimationDelays_DB_91B4FA:
    db $03,$03,$03, $F9 : dw $0002 : db $1D,$31,$79,$7D

UNUSED_AnimationDelays_DC_91B504:
    db $03,$03,$03, $F9 : dw $0002 : db $DF,$DF,$DF,$DF

UNUSED_AnimationDelays_DD_91B50E:
    db $03,$03,$03, $FD,$01

UNUSED_AnimationDelays_DE_91B513:
    db $03,$03,$03, $FD,$BA

AnimationDelays_F1:
; F1h: Facing right - crouching transition - aiming up
    db $03, $FD,$85

AnimationDelays_F2:
; F2h: Facing left-   crouching transition - aiming up
    db $03, $FD,$86

AnimationDelays_F3:
; F3h: Facing right - crouching transition - aiming up-right
    db $03, $FD,$71

AnimationDelays_F4:
; F4h: Facing left-   crouching transition - aiming up-left
    db $03, $FD,$72

AnimationDelays_F5:
; F5h: Facing right - crouching transition - aiming down-right
    db $03, $FD,$73

AnimationDelays_F6:
; F6h: Facing left-   crouching transition - aiming down-left
    db $03, $FD,$74

AnimationDelays_F7:
; F7h: Facing right - standing transition - aiming up
    db $03, $FD,$03

AnimationDelays_F8:
; F8h: Facing left-   standing transition - aiming up
    db $03, $FD,$04

AnimationDelays_F9:
; F9h: Facing right - standing transition - aiming up-right
    db $03, $FD,$05

AnimationDelays_FA:
; FAh: Facing left-   standing transition - aiming up-left
    db $03, $FD,$06

AnimationDelays_FB:
; FBh: Facing right - standing transition - aiming down-right
    db $03, $FD,$07

AnimationDelays_FC:
; FCh: Facing left-   standing transition - aiming down-left
    db $03, $FD,$08

AnimationDelays_BE_F0:
; BEh: Facing left-   grabbed by Draygon - moving
; F0h: Facing right - grabbed by Draygon - moving
    db $06,$06,$06,$06,$06,$06,$FF

AnimationDelays_C9_CA_CB_CC_CD_CE:
; C9h: Facing right - shinespark - horizontal
; CAh: Facing left-   shinespark - horizontal
; CBh: Facing right - shinespark - vertical
; CCh: Facing left-   shinespark - vertical
; CDh: Facing right - shinespark - diagonal
; CEh: Facing left-   shinespark - diagonal
    db $08,$FF

AnimationDelays_D3:
; D3h: Facing right - crystal flash
    ; Raise Samus and generate bubble
    db $03,$03
    db $01,$01, $FE,$02
    ; Main
    db $0C,$0C,$0C,$0C, $FE,$04
    ; Finish
    db $03,$03,$03, $FD,$01

AnimationDelays_D4:
; D4h: Facing left-   crystal flash
    ; Raise Samus and generate bubble
    db $03,$03
    db $01,$01, $FE,$02
    ; Main
    db $0C,$0C,$0C,$0C, $FE,$04
    ; Finish
    db $03,$03,$03, $FD,$02

AnimationDelays_D7_D8:
; D7h: Facing right - crystal flash ending
; D8h: Facing left-   crystal flash ending
    ; Transition from morphed
    db $02,$02,$02,$02,$02
    ; Unmorphed
    db $02, $FE,$01

AnimationDelays_0_9B:
; 0: Facing forward - power suit
; 9Bh: Facing forward - varia/gravity suit
    db $08,$FF
    ; Samus appears (with save station electricity)
    db $03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03
    db $03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03
    db $03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03
    db $03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03
    db $03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03
    db $03,$03,$03,$03,$03,$03,$03,$03,$03,$33,$02,$02,$02
    db $30, $FE,$01


;;; $B5D1: Animation delay table - running - speed booster not equipped ;;;
AnimationDelayTable_Running_NoSpeedBooster_pointer:
    dw AnimationDelayTable_Running_NoSpeedBooster

AnimationDelayTable_Running_NoSpeedBooster:
    db $02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$FF


;;; $B5DE: Animation delay table - running - speed booster equipped ;;;
AnimationDelayTable_Running_SpeedBooster_pointers:
; Indexed by [speed boost counter] * 2
    dw AnimationDelayTable_Running_SpeedBooster_0
    dw AnimationDelayTable_Running_SpeedBooster_1
    dw AnimationDelayTable_Running_SpeedBooster_2
    dw AnimationDelayTable_Running_SpeedBooster_3
    dw AnimationDelayTable_Running_SpeedBooster_4

AnimationDelayTable_Running_SpeedBooster_0:
; Unused, except for the first speed boosting animation cycle sometimes due to a bug (see $90:852C)
    db $03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$FF

AnimationDelayTable_Running_SpeedBooster_1:
; Speed booster stage 1 (after the first run button check)
    db $02,$03,$02,$03,$02,$03,$02,$03,$02,$03,$FF

AnimationDelayTable_Running_SpeedBooster_2:
; Speed booster stage 2
    db $02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$FF

AnimationDelayTable_Running_SpeedBooster_3:
; Speed booster stage 3
    db $01,$02,$01,$02,$01,$02,$01,$02,$01,$02,$FF

AnimationDelayTable_Running_SpeedBooster_4:
; Speed boosting (after the first speed boosting animation cycle)
    db $01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$FF


;;; $B61F: Speed boost timer reset values ;;;
SpeedBoostTimerResetValues:
; Indexed by [speed boost counter] * 2
    dw $0001,$0001,$0001,$0001,$0002


;;; $B629: Pose definitions ;;;
PoseDefinitions:
;        _____________________________ $B629: Pose X direction
;       |    _________________________ $B62A: Movement type
;       |   |    _____________________ $B62B: New pose if not affected by buttons
;       |   |   |    _________________ $B62C: Direction shots are fired. High nybble set means can't fire and grapple beam is cancelled
;       |   |   |   |    _____________ $B62D: Y offset of Samus GFX and projectile origin (but not Samus hitbox)
;       |   |   |   |   |    _________ $B62E: Unused
;       |   |   |   |   |   |    _____ $B62F: Y radius
;       |   |   |   |   |   |   |    _ $B630: Unused
;       |   |   |   |   |   |   |   |
; 0: Facing forward - power suit
  .XDirection:
    db $00
  .movementType:
    db     $00
  .newPose:
    db         $FF
  .directionShotsFired:
    db             $FF
  .YOffset:
    db                 $08,$00
  .YRadius:
    db                         $18,$00

PoseDefinitions_01:
; 1: Facing right - normal
    db $08,$00,$FF,$02,$06,$00,$15,$00

PoseDefinitions_02:
; 2: Facing left-   normal
    db $04,$00,$FF,$07,$06,$00,$15,$00

PoseDefinitions_03:
; 3: Facing right - aiming up
    db $08,$00,$01,$00,$06,$00,$15,$00

PoseDefinitions_04:
; 4: Facing left-   aiming up
    db $04,$00,$02,$09,$06,$00,$15,$00

PoseDefinitions_05:
; 5: Facing right - aiming up-right
    db $08,$00,$01,$01,$06,$00,$15,$00

PoseDefinitions_06:
; 6: Facing left-   aiming up-left
    db $04,$00,$02,$08,$06,$00,$15,$00

PoseDefinitions_07:
; 7: Facing right - aiming down-right
    db $08,$00,$01,$03,$06,$00,$15,$00

PoseDefinitions_08:
; 8: Facing left-   aiming down-left
    db $04,$00,$02,$06,$06,$00,$15,$00

PoseDefinitions_09:
; 9: Moving right - not aiming
    db $08,$01,$01,$02,$06,$00,$15,$00

PoseDefinitions_0A:
; Ah: Moving left-   not aiming
    db $04,$01,$02,$07,$06,$00,$15,$00

PoseDefinitions_0B:
; Bh: Moving right - gun extended
    db $08,$01,$01,$02,$06,$00,$15,$00

PoseDefinitions_0C:
; Ch: Moving left-   gun extended
    db $04,$01,$02,$07,$06,$00,$15,$00

PoseDefinitions_0D:
; Dh: Moving right - aiming up (unused)
    db $08,$01,$01,$00,$06,$00,$15,$00

PoseDefinitions_0E:
; Eh: Moving left-   aiming up (unused)
    db $04,$01,$02,$09,$06,$00,$15,$00

PoseDefinitions_0F:
; Fh: Moving right - aiming up-right
    db $08,$01,$01,$01,$06,$00,$15,$00

PoseDefinitions_10:
; 10h: Moving left-   aiming up-left
    db $04,$01,$02,$08,$06,$00,$15,$00

PoseDefinitions_11:
; 11h: Moving right - aiming down-right
    db $08,$01,$01,$03,$06,$00,$15,$00

PoseDefinitions_12:
; 12h: Moving left-   aiming down-left
    db $04,$01,$02,$06,$06,$00,$15,$00

PoseDefinitions_13:
; 13h: Facing right - normal jump - not aiming - not moving - gun extended
    db $08,$02,$FF,$02,$08,$00,$13,$00

PoseDefinitions_14:
; 14h: Facing left-   normal jump - not aiming - not moving - gun extended
    db $04,$02,$FF,$07,$08,$00,$13,$00

PoseDefinitions_15:
; 15h: Facing right - normal jump - aiming up
    db $08,$02,$51,$00,$08,$00,$13,$00

PoseDefinitions_16:
; 16h: Facing left-   normal jump - aiming up
    db $04,$02,$52,$09,$08,$00,$13,$00

PoseDefinitions_17:
; 17h: Facing right - normal jump - aiming down
    db $08,$02,$FF,$04,$06,$00,$0A,$00

PoseDefinitions_18:
; 18h: Facing left-   normal jump - aiming down
    db $04,$02,$FF,$05,$06,$00,$0A,$00

PoseDefinitions_19:
; 19h: Facing right - spin jump
    db $08,$03,$FF,$FF,$00,$00,$0C,$00

PoseDefinitions_1A:
; 1Ah: Facing left-   spin jump
    db $04,$03,$FF,$FF,$00,$00,$0C,$00

PoseDefinitions_1B:
; 1Bh: Facing right - space jump
    db $08,$03,$FF,$FF,$00,$00,$0C,$00

PoseDefinitions_1C:
; 1Ch: Facing left-   space jump
    db $04,$03,$FF,$FF,$00,$00,$0C,$00

PoseDefinitions_1D:
; 1Dh: Facing right - morph ball - no springball - on ground
    db $08,$04,$FF,$FF,$00,$00,$07,$00

PoseDefinitions_1E:
; 1Eh: Moving right - morph ball - no springball - on ground
    db $08,$04,$1D,$FF,$00,$00,$07,$00

PoseDefinitions_1F:
; 1Fh: Moving left-   morph ball - no springball - on ground
    db $04,$04,$41,$FF,$00,$00,$07,$00

UNUSED_PoseDefinitions_20_91B729:
    db $08,$07,$FF,$FF,$00,$00,$07,$00

UNUSED_PoseDefinitions_21_91B731:
    db $01,$07,$20,$FF,$00,$00,$07,$00

UNUSED_PoseDefinitions_22_91B739:
    db $02,$07,$20,$FF,$00,$00,$07,$00

UNUSED_PoseDefinitions_23_91B741:
    db $04,$07,$42,$FF,$00,$00,$07,$00

UNUSED_PoseDefinitions_24_91B749:
    db $08,$07,$20,$FF,$00,$00,$07,$00

PoseDefinitions_25:
; 25h: Facing right - turning - standing
    db $04,$0E,$FF,$FB,$06,$00,$15,$00

PoseDefinitions_26:
; 26h: Facing left-   turning - standing
    db $08,$0E,$FF,$FB,$06,$00,$15,$00

PoseDefinitions_27:
; 27h: Facing right - crouching
    db $08,$05,$27,$02,$00,$00,$10,$00

PoseDefinitions_28:
; 28h: Facing left-   crouching
    db $04,$05,$28,$07,$00,$00,$10,$00

PoseDefinitions_29:
; 29h: Facing right - falling
    db $08,$06,$FF,$02,$08,$00,$13,$00

PoseDefinitions_2A:
; 2Ah: Facing left-   falling
    db $04,$06,$FF,$07,$08,$00,$13,$00

PoseDefinitions_2B:
; 2Bh: Facing right - falling - aiming up
    db $08,$06,$29,$00,$08,$00,$13,$00

PoseDefinitions_2C:
; 2Ch: Facing left-   falling - aiming up
    db $04,$06,$2A,$09,$08,$00,$13,$00

PoseDefinitions_2D:
; 2Dh: Facing right - falling - aiming down
    db $08,$06,$FF,$04,$06,$00,$0A,$00

PoseDefinitions_2E:
; 2Eh: Facing left-   falling - aiming down
    db $04,$06,$FF,$05,$06,$00,$0A,$00

PoseDefinitions_2F:
; 2Fh: Facing right - turning - jumping
    db $04,$17,$FF,$FB,$08,$00,$13,$00

PoseDefinitions_30:
; 30h: Facing left-   turning - jumping
    db $08,$17,$FF,$FB,$08,$00,$13,$00

PoseDefinitions_31:
; 31h: Facing right - morph ball - no springball - in air
    db $08,$08,$FF,$FF,$00,$00,$07,$00

PoseDefinitions_32:
; 32h: Facing left-   morph ball - no springball - in air
    db $04,$08,$FF,$FF,$00,$00,$07,$00

UNUSED_PoseDefinitions_33_91B7C1:
    db $08,$09,$FF,$FF,$00,$00,$07,$00

UNUSED_PoseDefinitions_34_91B7C9:
    db $04,$09,$FF,$FF,$00,$00,$07,$00

PoseDefinitions_35:
; 35h: Facing right - crouching transition
    db $08,$0F,$FF,$02,$00,$00,$10,$00

PoseDefinitions_36:
; 36h: Facing left-   crouching transition
    db $04,$0F,$FF,$07,$00,$00,$10,$00

PoseDefinitions_37:
; 37h: Facing right - morphing transition
    db $08,$0F,$FF,$FF,$00,$00,$07,$00

PoseDefinitions_38:
; 38h: Facing left-   morphing transition
    db $04,$0F,$FF,$FF,$00,$00,$07,$00

UNUSED_PoseDefinitions_39_91B7F1:
    db $08,$0F,$FF,$FF,$00,$00,$07,$00

UNUSED_PoseDefinitions_3A_91B7F9:
    db $04,$0F,$FF,$FF,$00,$00,$07,$00

PoseDefinitions_3B:
; 3Bh: Facing right - standing transition
    db $08,$0F,$FF,$02,$06,$00,$15,$00

PoseDefinitions_3C:
; 3Ch: Facing left-   standing transition
    db $04,$0F,$FF,$07,$06,$00,$15,$00

PoseDefinitions_3D:
; 3Dh: Facing right - unmorphing transition
    db $08,$0F,$FF,$FF,$00,$00,$10,$00

PoseDefinitions_3E:
; 3Eh: Facing left-   unmorphing transition
    db $04,$0F,$FF,$FF,$00,$00,$10,$00

UNUSED_PoseDefinitions_3F_91B821:
    db $08,$0F,$FF,$FF,$00,$00,$07,$00

UNUSED_PoseDefinitions_40_91B829:
    db $04,$0F,$FF,$FF,$00,$00,$07,$00

PoseDefinitions_41:
; 41h: Facing left-   morph ball - no springball - on ground
    db $04,$04,$FF,$FF,$00,$00,$07,$00

UNUSED_PoseDefinitions_42_91B839:
    db $04,$07,$FF,$FF,$00,$00,$07,$00

PoseDefinitions_43:
; 43h: Facing right - turning - crouching
    db $04,$0E,$FF,$FB,$00,$00,$10,$00

PoseDefinitions_44:
; 44h: Facing left-   turning - crouching
    db $08,$0E,$FF,$FB,$00,$00,$10,$00

UNUSED_PoseDefinitions_45_91B851:
    db $08,$01,$01,$07,$06,$00,$15,$00

UNUSED_PoseDefinitions_46_91B859:
    db $04,$01,$02,$02,$06,$00,$15,$00

UNUSED_PoseDefinitions_47_91B861:
    db $08,$00,$FF,$02,$06,$00,$15,$00

UNUSED_PoseDefinitions_48_91B869:
    db $04,$00,$FF,$07,$06,$00,$15,$00

PoseDefinitions_49:
; 49h: Facing left-   moonwalk
    db $08,$10,$02,$07,$06,$00,$15,$00

PoseDefinitions_4A:
; 4Ah: Facing right - moonwalk
    db $04,$10,$01,$02,$06,$00,$15,$00

PoseDefinitions_4B:
; 4Bh: Facing right - normal jump transition
    db $08,$02,$FF,$02,$03,$00,$13,$00

PoseDefinitions_4C:
; 4Ch: Facing left-   normal jump transition
    db $04,$02,$FF,$07,$03,$00,$13,$00

PoseDefinitions_4D:
; 4Dh: Facing right - normal jump - not aiming - not moving - gun not extended
    db $08,$02,$FF,$02,$08,$00,$13,$00

PoseDefinitions_4E:
; 4Eh: Facing left-   normal jump - not aiming - not moving - gun not extended
    db $04,$02,$FF,$07,$08,$00,$13,$00

PoseDefinitions_4F:
; 4Fh: Facing left-   damage boost
    db $08,$19,$4E,$FF,$08,$00,$13,$00

PoseDefinitions_50:
; 50h: Facing right - damage boost
    db $04,$19,$4D,$FF,$08,$00,$13,$00

PoseDefinitions_51:
; 51h: Facing right - normal jump - not aiming - moving forward
    db $08,$02,$FF,$02,$08,$00,$13,$00

PoseDefinitions_52:
; 52h: Facing left-   normal jump - not aiming - moving forward
    db $04,$02,$FF,$07,$08,$00,$13,$00

PoseDefinitions_53:
; 53h: Facing right - knockback
    db $08,$0A,$FF,$FF,$06,$00,$15,$00

PoseDefinitions_54:
; 54h: Facing left-   knockback
    db $04,$0A,$FF,$FF,$06,$00,$15,$00

PoseDefinitions_55:
; 55h: Facing right - normal jump transition - aiming up
    db $08,$02,$FF,$00,$03,$00,$13,$00

PoseDefinitions_56:
; 56h: Facing left-   normal jump transition - aiming up
    db $04,$02,$FF,$09,$03,$00,$13,$00

PoseDefinitions_57:
; 57h: Facing right - normal jump transition - aiming up-right
    db $08,$02,$FF,$01,$03,$00,$13,$00

PoseDefinitions_58:
; 58h: Facing left-   normal jump transition - aiming up-left
    db $04,$02,$FF,$08,$03,$00,$13,$00

PoseDefinitions_59:
; 59h: Facing right - normal jump transition - aiming down-right
    db $08,$02,$FF,$03,$03,$00,$13,$00

PoseDefinitions_5A:
; 5Ah: Facing left-   normal jump transition - aiming down-left
    db $04,$02,$FF,$06,$03,$00,$13,$00

UNUSED_PoseDefinitions_5B_91B901:
    db $08,$16,$FF,$FF,$10,$00,$10,$00

UNUSED_PoseDefinitions_5C_91B909:
    db $04,$16,$FF,$FF,$10,$00,$10,$00

UNUSED_PoseDefinitions_5D_91B911:
    db $08,$0B,$5D,$FF,$10,$00,$10,$00

UNUSED_PoseDefinitions_5E_91B919:
    db $04,$0B,$5E,$FF,$10,$00,$10,$00

UNUSED_PoseDefinitions_5F_91B921:
    db $08,$0B,$5F,$FF,$10,$00,$10,$00

UNUSED_PoseDefinitions_60_91B929:
    db $04,$0B,$60,$FF,$10,$00,$10,$00

UNUSED_PoseDefinitions_61_91B931:
    db $08,$16,$B2,$FF,$10,$00,$10,$00

UNUSED_PoseDefinitions_62_91B939:
    db $04,$16,$B3,$FF,$10,$00,$10,$00

UNUSED_PoseDefinitions_63_91B941:
    db $08,$0D,$FF,$FF,$0C,$00,$0C,$00

UNUSED_PoseDefinitions_64_91B949:
    db $04,$0D,$FF,$FF,$0C,$00,$0C,$00

UNUSED_PoseDefinitions_65_91B951:
    db $08,$0D,$29,$FF,$0C,$00,$0C,$00

UNUSED_PoseDefinitions_66_91B959:
    db $04,$0D,$2A,$FF,$0C,$00,$0C,$00

PoseDefinitions_67:
; 67h: Facing right - falling - gun extended
    db $08,$06,$FF,$02,$08,$00,$13,$00

PoseDefinitions_68:
; 68h: Facing left-   falling - gun extended
    db $04,$06,$FF,$07,$08,$00,$13,$00

PoseDefinitions_69:
; 69h: Facing right - normal jump - aiming up-right
    db $08,$02,$51,$01,$08,$00,$13,$00

PoseDefinitions_6A:
; 6Ah: Facing left-   normal jump - aiming up-left
    db $04,$02,$52,$08,$08,$00,$13,$00

PoseDefinitions_6B:
; 6Bh: Facing right - normal jump - aiming down-right
    db $08,$02,$51,$03,$08,$00,$13,$00

PoseDefinitions_6C:
; 6Ch: Facing left-   normal jump - aiming down-left
    db $04,$02,$52,$06,$08,$00,$13,$00

PoseDefinitions_6D:
; 6Dh: Facing right - falling - aiming up-right
    db $08,$06,$29,$01,$08,$00,$13,$00

PoseDefinitions_6E:
; 6Eh: Facing left-   falling - aiming up-left
    db $04,$06,$2A,$08,$08,$00,$13,$00

PoseDefinitions_6F:
; 6Fh: Facing right - falling - aiming down-right
    db $08,$06,$29,$03,$08,$00,$13,$00

PoseDefinitions_70:
; 70h: Facing left-   falling - aiming down-left
    db $04,$06,$2A,$06,$08,$00,$13,$00

PoseDefinitions_71:
; 71h: Facing right - crouching - aiming up-right
    db $08,$05,$27,$01,$00,$00,$10,$00

PoseDefinitions_72:
; 72h: Facing left-   crouching - aiming up-left
    db $04,$05,$28,$08,$00,$00,$10,$00

PoseDefinitions_73:
; 73h: Facing right - crouching - aiming down-right
    db $08,$05,$27,$03,$00,$00,$10,$00

PoseDefinitions_74:
; 74h: Facing left-   crouching - aiming down-left
    db $04,$05,$28,$06,$00,$00,$10,$00

PoseDefinitions_75:
; 75h: Facing left-   moonwalk - aiming up-left
    db $08,$10,$06,$08,$06,$00,$15,$00

PoseDefinitions_76:
; 76h: Facing right - moonwalk - aiming up-right
    db $04,$10,$05,$01,$06,$00,$15,$00

PoseDefinitions_77:
; 77h: Facing left-   moonwalk - aiming down-left
    db $08,$10,$08,$06,$06,$00,$15,$00

PoseDefinitions_78:
; 78h: Facing right - moonwalk - aiming down-right
    db $04,$10,$07,$03,$06,$00,$15,$00

PoseDefinitions_79:
; 79h: Facing right - morph ball - spring ball - on ground
    db $08,$11,$FF,$FF,$00,$00,$07,$00

PoseDefinitions_7A:
; 7Ah: Facing left-   morph ball - spring ball - on ground
    db $04,$11,$FF,$FF,$00,$00,$07,$00

PoseDefinitions_7B:
; 7Bh: Moving right - morph ball - spring ball - on ground
    db $08,$11,$79,$FF,$00,$00,$07,$00

PoseDefinitions_7C:
; 7Ch: Moving left-   morph ball - spring ball - on ground
    db $04,$11,$7A,$FF,$00,$00,$07,$00

PoseDefinitions_7D:
; 7Dh: Facing right - morph ball - spring ball - falling
    db $08,$13,$FF,$FF,$00,$00,$07,$00

PoseDefinitions_7E:
; 7Eh: Facing left-   morph ball - spring ball - falling
    db $04,$13,$FF,$FF,$00,$00,$07,$00

PoseDefinitions_7F:
; 7Fh: Facing right - morph ball - spring ball - in air
    db $08,$12,$FF,$FF,$00,$00,$07,$00

PoseDefinitions_80:
; 80h: Facing left-   morph ball - spring ball - in air
    db $04,$12,$FF,$FF,$00,$00,$07,$00

PoseDefinitions_81:
; 81h: Facing right - screw attack
    db $08,$03,$FF,$FF,$00,$00,$0C,$00

PoseDefinitions_82:
; 82h: Facing left-   screw attack
    db $04,$03,$FF,$FF,$00,$00,$0C,$00

PoseDefinitions_83:
; 83h: Facing right - wall jump
    db $08,$14,$19,$FF,$08,$00,$13,$00

PoseDefinitions_84:
; 84h: Facing left-   wall jump
    db $04,$14,$1A,$FF,$08,$00,$13,$00

PoseDefinitions_85:
; 85h: Facing right - crouching - aiming up
    db $08,$05,$27,$00,$00,$00,$10,$00

PoseDefinitions_86:
; 86h: Facing left-   crouching - aiming up
    db $04,$05,$28,$09,$00,$00,$10,$00

PoseDefinitions_87:
; 87h: Facing right - turning - falling
    db $04,$18,$FF,$FB,$08,$00,$13,$00

PoseDefinitions_88:
; 88h: Facing left-   turning - falling
    db $08,$18,$FF,$FB,$08,$00,$13,$00

PoseDefinitions_89:
; 89h: Facing right - ran into a wall
    db $08,$15,$FF,$02,$06,$00,$15,$00

PoseDefinitions_8A:
; 8Ah: Facing left-   ran into a wall
    db $04,$15,$FF,$07,$06,$00,$15,$00

PoseDefinitions_8B:
; 8Bh: Facing right - turning - standing - aiming up
    db $04,$0E,$FF,$FA,$06,$00,$15,$00

PoseDefinitions_8C:
; 8Ch: Facing left-   turning - standing - aiming up
    db $08,$0E,$FF,$FA,$06,$00,$15,$00

PoseDefinitions_8D:
; 8Dh: Facing right - turning - standing - aiming down-right
    db $04,$0E,$FF,$FC,$06,$00,$15,$00

PoseDefinitions_8E:
; 8Eh: Facing left-   turning - standing - aiming down-left
    db $08,$0E,$FF,$FC,$06,$00,$15,$00

PoseDefinitions_8F:
; 8Fh: Facing right - turning - in air - aiming up
    db $04,$17,$FF,$FA,$08,$00,$13,$00

PoseDefinitions_90:
; 90h: Facing left-   turning - in air - aiming up
    db $08,$17,$FF,$FA,$08,$00,$13,$00

PoseDefinitions_91:
; 91h: Facing right - turning - in air - aiming down/down-right
    db $04,$17,$FF,$FC,$08,$00,$13,$00

PoseDefinitions_92:
; 92h: Facing left-   turning - in air - aiming down/down-left
    db $08,$17,$FF,$FC,$08,$00,$13,$00

PoseDefinitions_93:
; 93h: Facing right - turning - falling - aiming up
    db $04,$18,$FF,$FA,$08,$00,$13,$00

PoseDefinitions_94:
; 94h: Facing left-   turning - falling - aiming up
    db $08,$18,$FF,$FA,$08,$00,$13,$00

PoseDefinitions_95:
; 95h: Facing right - turning - falling - aiming down/down-right
    db $04,$18,$FF,$FC,$08,$00,$13,$00

PoseDefinitions_96:
; 96h: Facing left-   turning - falling - aiming down/down-left
    db $08,$18,$FF,$FC,$08,$00,$13,$00

PoseDefinitions_97:
; 97h: Facing right - turning - crouching - aiming up
    db $04,$17,$28,$FA,$00,$00,$10,$00

PoseDefinitions_98:
; 98h: Facing left-   turning - crouching - aiming up
    db $08,$17,$28,$FA,$00,$00,$10,$00

PoseDefinitions_99:
; 99h: Facing right - turning - crouching - aiming down/down-right
    db $04,$17,$28,$FC,$00,$00,$10,$00

PoseDefinitions_9A:
; 9Ah: Facing left-   turning - crouching - aiming down/down-left
    db $08,$17,$28,$FC,$00,$00,$10,$00

PoseDefinitions_9B:
; 9Bh: Facing forward - varia/gravity suit
    db $00,$00,$FF,$FF,$08,$00,$18,$00

PoseDefinitions_9C:
; 9Ch: Facing right - turning - standing - aiming up-right
    db $04,$0E,$FF,$FA,$06,$00,$15,$00

PoseDefinitions_9D:
; 9Dh: Facing left-   turning - standing - aiming up-left
    db $08,$0E,$FF,$FA,$06,$00,$15,$00

PoseDefinitions_9E:
; 9Eh: Facing right - turning - in air - aiming up-right
    db $04,$17,$FF,$FA,$08,$00,$13,$00

PoseDefinitions_9F:
; 9Fh: Facing left-   turning - in air - aiming up-left
    db $08,$17,$FF,$FA,$08,$00,$13,$00

PoseDefinitions_A0:
; A0h: Facing right - turning - falling - aiming up-right
    db $04,$18,$FF,$FA,$08,$00,$13,$00

PoseDefinitions_A1:
; A1h: Facing left-   turning - falling - aiming up-left
    db $08,$18,$FF,$FA,$08,$00,$13,$00

PoseDefinitions_A2:
; A2h: Facing right - turning - crouching - aiming up-right
    db $04,$17,$28,$FA,$00,$00,$10,$00

PoseDefinitions_A3:
; A3h: Facing left-   turning - crouching - aiming up-left
    db $08,$17,$28,$FA,$00,$00,$10,$00

PoseDefinitions_A4:
; A4h: Facing right - landing from normal jump
    db $08,$00,$FF,$02,$03,$00,$15,$00

PoseDefinitions_A5:
; A5h: Facing left-   landing from normal jump
    db $04,$00,$FF,$07,$03,$00,$15,$00

PoseDefinitions_A6:
; A6h: Facing right - landing from spin jump
    db $08,$00,$FF,$02,$03,$00,$15,$00

PoseDefinitions_A7:
; A7h: Facing left-   landing from spin jump
    db $04,$00,$FF,$07,$03,$00,$15,$00

UNUSED_PoseDefinitions_A8_91BB69:
    db $08,$16,$01,$02,$06,$00,$15,$00

UNUSED_PoseDefinitions_A9_91BB71:
    db $04,$16,$02,$07,$06,$00,$15,$00

UNUSED_PoseDefinitions_AA_91BB79:
    db $08,$16,$07,$03,$06,$00,$15,$00

UNUSED_PoseDefinitions_AB_91BB81:
    db $04,$16,$08,$06,$06,$00,$15,$00

UNUSED_PoseDefinitions_AC_91BB89:
    db $08,$16,$67,$02,$08,$00,$13,$00

UNUSED_PoseDefinitions_AD_91BB91:
    db $04,$16,$68,$07,$08,$00,$13,$00

UNUSED_PoseDefinitions_AE_91BB99:
    db $08,$16,$2D,$04,$06,$00,$0A,$00

UNUSED_PoseDefinitions_AF_91BBA1:
    db $04,$16,$2E,$05,$06,$00,$0A,$00

UNUSED_PoseDefinitions_B0_91BBA9:
    db $08,$16,$6F,$03,$08,$00,$13,$00

UNUSED_PoseDefinitions_B1_91BBB1:
    db $04,$16,$70,$06,$08,$00,$13,$00

PoseDefinitions_B2:
; B2h: Facing clockwise   -   grapple swinging
    db $08,$16,$B2,$FF,$10,$00,$11,$00

PoseDefinitions_B3:
; B3h: Facing anticlockwise - grapple swinging
    db $04,$16,$B3,$FF,$10,$00,$11,$00

UNUSED_PoseDefinitions_B4_91BBC9:
    db $08,$16,$27,$02,$00,$00,$10,$00

UNUSED_PoseDefinitions_B5_91BBD1:
    db $04,$16,$28,$07,$00,$00,$10,$00

UNUSED_PoseDefinitions_B6_91BBD9:
    db $08,$16,$27,$03,$00,$00,$10,$00

UNUSED_PoseDefinitions_B7_91BBE1:
    db $04,$16,$28,$06,$00,$00,$10,$00

PoseDefinitions_B8:
; B8h: Facing left-   grapple wall jump pose
    db $08,$16,$FF,$03,$00,$00,$10,$00

PoseDefinitions_B9:
; B9h: Facing right - grapple wall jump pose
    db $04,$16,$FF,$06,$00,$00,$10,$00

PoseDefinitions_BA:
; BAh: Facing left-   grabbed by Draygon - not moving - not aiming
    db $04,$1A,$FF,$07,$06,$00,$15,$00

PoseDefinitions_BB:
; BBh: Facing left-   grabbed by Draygon - not moving - aiming up-left
    db $04,$1A,$BA,$08,$06,$00,$15,$00

PoseDefinitions_BC:
; BCh: Facing left-   grabbed by Draygon - firing
    db $04,$1A,$BA,$07,$06,$00,$15,$00

PoseDefinitions_BD:
; BDh: Facing left-   grabbed by Draygon - not moving - aiming down-left
    db $04,$1A,$BA,$06,$06,$00,$15,$00

PoseDefinitions_BE:
; BEh: Facing left-   grabbed by Draygon - moving
    db $04,$1A,$BA,$FF,$06,$00,$15,$00

PoseDefinitions_BF:
; BFh: Facing right - moonwalking - turn/jump left
    db $04,$0E,$FF,$FB,$06,$00,$15,$00

PoseDefinitions_C0:
; C0h: Facing left-   moonwalking - turn/jump right
    db $08,$0E,$FF,$FB,$06,$00,$15,$00

PoseDefinitions_C1:
; C1h: Facing right - moonwalking - turn/jump left-   aiming up-right
    db $04,$0E,$FF,$FA,$08,$00,$15,$00

PoseDefinitions_C2:
; C2h: Facing left-   moonwalking - turn/jump right - aiming up-left
    db $08,$0E,$FF,$FA,$08,$00,$15,$00

PoseDefinitions_C3:
; C3h: Facing right - moonwalking - turn/jump left-   aiming down-right
    db $04,$0E,$FF,$FC,$08,$00,$15,$00

PoseDefinitions_C4:
; C4h: Facing left-   moonwalking - turn/jump right - aiming down-left
    db $08,$0E,$FF,$FC,$08,$00,$15,$00

UNUSED_PoseDefinitions_C5_91BC51:
    db $04,$1A,$FF,$FF,$00,$00,$07,$00

UNUSED_PoseDefinitions_C6_91BC59:
    db $04,$1A,$FF,$FB,$06,$00,$15,$00

PoseDefinitions_C7:
; C7h: Facing right - vertical shinespark windup
    db $08,$1B,$FF,$FF,$08,$00,$13,$00

PoseDefinitions_C8:
; C8h: Facing left-   vertical shinespark windup
    db $04,$1B,$FF,$FF,$08,$00,$13,$00

PoseDefinitions_C9:
; C9h: Facing right - shinespark - horizontal
    db $08,$1B,$FF,$02,$08,$00,$13,$00

PoseDefinitions_CA:
; CAh: Facing left-   shinespark - horizontal
    db $04,$1B,$FF,$07,$08,$00,$13,$00

PoseDefinitions_CB:
; CBh: Facing right - shinespark - vertical
    db $08,$1B,$FF,$00,$08,$00,$13,$00

PoseDefinitions_CC:
; CCh: Facing left-   shinespark - vertical
    db $04,$1B,$FF,$09,$08,$00,$13,$00

PoseDefinitions_CD:
; CDh: Facing right - shinespark - diagonal
    db $08,$1B,$FF,$01,$08,$00,$13,$00

PoseDefinitions_CE:
; CEh: Facing left-   shinespark - diagonal
    db $04,$1B,$FF,$08,$08,$00,$13,$00

PoseDefinitions_CF:
; CFh: Facing right - ran into a wall - aiming up-right
    db $08,$15,$89,$01,$06,$00,$15,$00

PoseDefinitions_D0:
; D0h: Facing left-   ran into a wall - aiming up-left
    db $04,$15,$8A,$08,$06,$00,$15,$00

PoseDefinitions_D1:
; D1h: Facing right - ran into a wall - aiming down-right
    db $08,$15,$89,$03,$06,$00,$15,$00

PoseDefinitions_D2:
; D2h: Facing left-   ran into a wall - aiming down-left
    db $04,$15,$8A,$06,$06,$00,$15,$00

PoseDefinitions_D3:
; D3h: Facing right - crystal flash
    db $08,$1B,$FF,$FF,$06,$00,$15,$00

PoseDefinitions_D4:
; D4h: Facing left-   crystal flash
    db $04,$1B,$FF,$FF,$06,$00,$15,$00

PoseDefinitions_D5:
; D5h: Facing right - x-ray - standing
    db $08,$00,$FF,$02,$06,$00,$15,$00

PoseDefinitions_D6:
; D6h: Facing left-   x-ray - standing
    db $04,$00,$FF,$07,$06,$00,$15,$00

PoseDefinitions_D7:
; D7h: Facing right - crystal flash ending
    db $08,$0A,$FF,$02,$06,$00,$15,$00

PoseDefinitions_D8:
; D8h: Facing left-   crystal flash ending
    db $04,$0A,$FF,$07,$06,$00,$15,$00

PoseDefinitions_D9:
; D9h: Facing right - x-ray - crouching
    db $08,$05,$FF,$02,$00,$00,$10,$00

PoseDefinitions_DA:
; DAh: Facing left-   x-ray - crouching
    db $04,$05,$FF,$07,$00,$00,$10,$00

UNUSED_PoseDefinitions_DB_91BD01:
    db $08,$0F,$FF,$FF,$00,$00,$07,$00

UNUSED_PoseDefinitions_DC_91BD09:
    db $04,$0F,$FF,$FF,$00,$00,$07,$00

UNUSED_PoseDefinitions_DD_91BD11:
    db $08,$0F,$FF,$FF,$06,$00,$15,$00

UNUSED_PoseDefinitions_DE_91BD19:
    db $04,$0F,$FF,$FF,$06,$00,$15,$00

UNUSED_PoseDefinitions_DF_91BD21:
    db $04,$1A,$FF,$FF,$00,$00,$07,$00

PoseDefinitions_E0:
; E0h: Facing right - landing from normal jump - aiming up
    db $08,$00,$FF,$00,$03,$00,$15,$00

PoseDefinitions_E1:
; E1h: Facing left-   landing from normal jump - aiming up
    db $04,$00,$FF,$09,$03,$00,$15,$00

PoseDefinitions_E2:
; E2h: Facing right - landing from normal jump - aiming up-right
    db $08,$00,$FF,$01,$03,$00,$15,$00

PoseDefinitions_E3:
; E3h: Facing left-   landing from normal jump - aiming up-left
    db $04,$00,$FF,$08,$03,$00,$15,$00

PoseDefinitions_E4:
; E4h: Facing right - landing from normal jump - aiming down-right
    db $08,$00,$FF,$03,$03,$00,$15,$00

PoseDefinitions_E5:
; E5h: Facing left-   landing from normal jump - aiming down-left
    db $04,$00,$FF,$06,$03,$00,$15,$00

PoseDefinitions_E6:
; E6h: Facing right - landing from normal jump - firing
    db $08,$00,$FF,$02,$03,$00,$15,$00

PoseDefinitions_E7:
; E7h: Facing left-   landing from normal jump - firing
    db $04,$00,$FF,$07,$03,$00,$15,$00

PoseDefinitions_E8:
; E8h: Facing right - Samus drained - crouching
    db $08,$1B,$FF,$FF,$FC,$00,$15,$00

PoseDefinitions_E9:
; E9h: Facing left-   Samus drained - crouching
    db $04,$1B,$FF,$FF,$FC,$00,$15,$00

PoseDefinitions_EA:
; EAh: Facing right - Samus drained - standing
    db $08,$1B,$FF,$FF,$FC,$00,$15,$00

PoseDefinitions_EB:
; EBh: Facing left-   Samus drained - standing
    db $04,$1B,$FF,$FF,$FC,$00,$15,$00

PoseDefinitions_EC:
; ECh: Facing right - grabbed by Draygon - not moving - not aiming
    db $08,$1A,$FF,$02,$06,$00,$15,$00

PoseDefinitions_ED:
; EDh: Facing right - grabbed by Draygon - not moving - aiming up-right
    db $08,$1A,$EC,$01,$06,$00,$15,$00

PoseDefinitions_EE:
; EEh: Facing right - grabbed by Draygon - firing
    db $08,$1A,$EC,$02,$06,$00,$15,$00

PoseDefinitionse_EF:
; EFh: Facing right - grabbed by Draygon - not moving - aiming down-right
    db $08,$1A,$EC,$03,$06,$00,$15,$00

PoseDefinitions_F0:
; F0h: Facing right - grabbed by Draygon - moving
    db $08,$1A,$EC,$FF,$06,$00,$15,$00

PoseDefinitions_F1:
; F1h: Facing right - crouching transition - aiming up
    db $08,$0F,$FF,$00,$08,$00,$10,$00

PoseDefinitions_F2:
; F2h: Facing left-   crouching transition - aiming up
    db $04,$0F,$FF,$09,$08,$00,$10,$00

PoseDefinitions_F3:
; F3h: Facing right - crouching transition - aiming up-right
    db $08,$0F,$FF,$01,$08,$00,$10,$00

PoseDefinitions_F4:
; F4h: Facing left-   crouching transition - aiming up-left
    db $04,$0F,$FF,$08,$08,$00,$10,$00

PoseDefinitions_F5:
; F5h: Facing right - crouching transition - aiming down-right
    db $08,$0F,$FF,$03,$08,$00,$10,$00

PoseDefinitions_F6:
; F6h: Facing left-   crouching transition - aiming down-left
    db $04,$0F,$FF,$06,$08,$00,$10,$00

PoseDefinitions_F7:
; F7h: Facing right - standing transition - aiming up
    db $08,$0F,$FF,$00,$03,$00,$15,$00

PoseDefinitions_F8:
; F8h: Facing left-   standing transition - aiming up
    db $04,$0F,$FF,$09,$03,$00,$15,$00

PoseDefinitions_F9:
; F9h: Facing right - standing transition - aiming up-right
    db $08,$0F,$FF,$01,$03,$00,$15,$00

PoseDefinitions_FA:
; FAh: Facing left-   standing transition - aiming up-left
    db $04,$0F,$FF,$08,$03,$00,$15,$00

PoseDefinitions_FB:
; FBh: Facing right - standing transition - aiming down-right
    db $08,$0F,$FF,$03,$03,$00,$15,$00

PoseDefinitions_FC:
; FCh: Facing left-   standing transition - aiming down-left
    db $04,$0F,$FF,$06,$03,$00,$15,$00


;;; $BE11: Calculate x-ray / morph ball eye beam HDMA data table - origin is off screen ;;;
Calc_Xray_HDMADataTable_OffScreen:
;; Parameters:
;;     X: Beam origin X position
;;     Y: Beam origin Y position
;;     $00: HDMA data table pointer. $7E:9100 for morph ball eye beam, $7E:9800 for x-ray
;;     $12: Beam angle
;;     $14: Beam angular width
    PHP : PHB
    PHK : PLB
    REP #$30
    TXA : XBA : AND.W #$FF00 : STA.B DP_Temp16
    STY.B DP_Temp18
    LDA.B DP_Temp12 : SEC : SBC.B DP_Temp14 : STA.B DP_Temp1A : BPL +
    LDA.W #$0100 : CLC : ADC.B DP_Temp1A : STA.B DP_Temp1A

+   LDA.B DP_Temp12 : CLC : ADC.B DP_Temp14 : STA.B DP_Temp1C
    CMP.W #$0101 : BMI +
    SEC : SBC.W #$0100 : STA.B DP_Temp1C

+   LDA.B DP_Temp14 : BNE +
    LDA.B DP_Temp12 : CMP.W #$0040 : BEQ .strictlyHorizontal
    CMP.W #$00C0 : BEQ .strictlyHorizontal

+   LDA.B DP_Temp1A : CMP.W #$0080 : BPL +
    CMP.W #$0040 : BPL .bottomHalf
    LDA.B DP_Temp1C : CMP.W #$0040 : BMI .topHalf
    BRA .right

+   CMP.W #$00C0 : BPL .topHalf
    LDA.B DP_Temp1C : CMP.W #$00C0 : BMI .bottomHalf
    BRA .left

  .right:
; [beam left edge angle] < 40h and [beam right edge angle] >= 40h
    LDY.W #$0000
    BRA .merge

  .topHalf:
; [beam right edge angle] < 40h or [beam left edge angle] >= C0h
    LDY.W #$0002
    BRA .merge

  .bottomHalf:
; 40h <= [beam left edge angle] < 80h or 80h <= [beam left edge angle] and [beam right edge angle] < C0h
    LDY.W #$0004
    BRA .merge

  .left:
; [beam left edge angle] < C0h and [beam right edge angle] >= C0h
    LDY.W #$0006
    BRA .merge

  .strictlyHorizontal:
; [beam angular width] = 0 and ([beam angle] = 40h or [beam angle] = C0h)
    LDY.W #$0008

  .merge:
    LDA.B DP_Temp1A : CMP.W #$0080 : BMI +
    SEC : SBC.W #$0080

+   ASL : TAX
    LDA.W AbsoluteTangentTable,X : STA.B DP_Temp1E
    LDA.B DP_Temp1C : CMP.W #$0080 : BMI +
    SEC : SBC.W #$0080

+   ASL : TAX
    LDA.W AbsoluteTangentTable,X : STA.B DP_Temp20
    TYX
    JSR.W (.pointers,X)
    PLB : PLP
    RTL

  .pointers:
    dw Calc_Xray_HDMADataTable_OffScreen_AimedRight
    dw Calc_Xray_HDMADataTable_OffScreen_AimedUpwards
    dw Calc_Xray_HDMADataTable_OffScreen_AimedDownwards
    dw Calc_Xray_HDMADataTable_OffScreen_AimedLeft
    dw Calc_Xray_HDMADataTable_OffScreen_HorizontalLine


;;; $BEC2: Calculate x-ray / morph ball eye beam HDMA data table - origin is off screen - beam is aimed right ;;;
Calc_Xray_HDMADataTable_OffScreen_AimedRight:
;; Parameters:
;;     $00: HDMA data table pointer. $7E:9100 for morph ball eye beam, $7E:9800 for x-ray
;;     $16: Beam origin X position * 100h (note: negative)
;;     $18: Beam origin Y position
;;     $1E: Beam left edge gradient * 100h (dx/dy)
;;     $20: Beam right edge gradient * 100h (dx/dy)

; Current left line co-ordinates = ([$22], [Y] / 2)
; Current right line co-ordinates = ([$24], [Y] / 2)
; [$12]/2 and [$14]/2 become the top and bottom Y positions of the largest rectangular region of the beam
    PHP
    REP #$30
    LDA.B DP_Temp18 : DEC : ASL : TAY
    LDA.B DP_Temp16 : STA.B DP_Temp22 : STA.B DP_Temp24

  .loopLeftOffScreen:
    LDA.B DP_Temp22 : CLC : ADC.B DP_Temp1E : STA.B DP_Temp22 : BCS +
    DEY #2 : BPL .loopLeftOffScreen
    STZ.B DP_Temp12
    JMP .leftEdgeEnd

+   LDA.B DP_Temp23 : ORA.W #$FF00 : STA.B [DP_Temp00],Y
    INY #2 : STY.B DP_Temp12
    TYA : SEC : SBC.W #$0004 : TAY

  .loopLeftOnScreen:
    LDA.B DP_Temp22 : CLC : ADC.B DP_Temp1E : STA.B DP_Temp22 : BCS ..loop
    LDA.B DP_Temp23 : ORA.W #$FF00 : STA.B [DP_Temp00],Y
    DEY #2 : BPL .loopLeftOnScreen
    BRA .leftEdgeEnd

  ..loop:
    LDA.W #$00FF : STA.B [DP_Temp00],Y
    DEY #2 : BPL ..loop

  .leftEdgeEnd:
    LDA.B DP_Temp18 : ASL : TAY

  .loopRightOffScreen:
    LDA.B DP_Temp24 : CLC : ADC.B DP_Temp20 : STA.B DP_Temp24 : BCS +
    INY #2 : CPY.W #$01CC : BMI .loopRightOffScreen
    STY.B DP_Temp14
    JMP .rightEdgeEnd

+   LDA.B DP_Temp25 : ORA.W #$FF00 : STA.B [DP_Temp00],Y
    DEY #2 : STY.B DP_Temp14
    TYA : CLC : ADC.W #$0004 : TAY

  .loopRightOnScreen:
    LDA.B DP_Temp24 : CLC : ADC.B DP_Temp20 : STA.B DP_Temp24 : BCS ..loop
    LDA.B DP_Temp25 : ORA.W #$FF00 : STA.B [DP_Temp00],Y
    INY #2 : CPY.W #$01CC : BMI .loopRightOnScreen
    BRA .rightEdgeEnd

  ..loop:
    LDA.W #$00FF : STA.B [DP_Temp00],Y
    INY #2 : CPY.W #$01CC : BMI ..loop

  .rightEdgeEnd:
    LDY.B DP_Temp12

  ..loop:
    LDA.W #$FF00 : STA.B [DP_Temp00],Y
    INY #2 : CPY.B DP_Temp14 : BMI ..loop
    BEQ ..loop
    PLP
    RTS


;;; $BF72: Calculate x-ray / morph ball eye beam HDMA data table - origin is off screen - beam is aimed left ;;;
Calc_Xray_HDMADataTable_OffScreen_AimedLeft:
;; Parameters:
;;     $00: HDMA data table pointer. $7E:9100 for morph ball eye beam, $7E:9800 for x-ray
;;     $16: Beam origin X position * 100h (note: over 10000h)
;;     $18: Beam origin Y position
;;     $1E: Beam left edge gradient * 100h (dx/dy)
;;     $20: Beam right edge gradient * 100h (dx/dy)

; Current left line co-ordinates = ([$22], [Y] / 2)
; Current right line co-ordinates = ([$24], [Y] / 2)
; [$12]/2 and [$14]/2 become the top and bottom Y positions of the largest rectangular region of the beam
    PHP
    REP #$30
    LDA.B DP_Temp18 : DEC : ASL : TAY
    LDA.B DP_Temp16 : STA.B DP_Temp22 : STA.B DP_Temp24

  .loopRightOffScreen:
    LDA.B DP_Temp24 : SEC : SBC.B DP_Temp20 : STA.B DP_Temp24 : BCC +
    DEY #2 : BPL .loopRightOffScreen
    STZ.B DP_Temp12
    JMP .rightEdgeEnd

+   LDA.B DP_Temp24 : AND.W #$FF00 : STA.B [DP_Temp00],Y
    INY #2 : STY.B DP_Temp12
    TYA : SEC : SBC.W #$0004 : TAY

  .loopRightOnScreen:
    LDA.B DP_Temp24 : SEC : SBC.B DP_Temp20 : STA.B DP_Temp24 : BCC ..loop
    LDA.B DP_Temp24 : AND.W #$FF00 : STA.B [DP_Temp00],Y
    DEY #2 : BPL .loopRightOnScreen
    BRA .rightEdgeEnd

  ..loop:
    LDA.W #$00FF : STA.B [DP_Temp00],Y
    DEY #2 : BPL ..loop

  .rightEdgeEnd:
    LDA.B DP_Temp18 : ASL : TAY

  .loopLeftOffScreen:
    LDA.B DP_Temp22 : SEC : SBC.B DP_Temp1E : STA.B DP_Temp22 : BCC +
    INY #2 : CPY.W #$01CC : BMI .loopLeftOffScreen
    STY.B DP_Temp14
    JMP .leftEdgeEnd

+   LDA.B DP_Temp22 : AND.W #$FF00 : STA.B [DP_Temp00],Y
    DEY #2 : STY.B DP_Temp14
    TYA : CLC : ADC.W #$0004 : TAY

  .leftOnScreen:
    LDA.B DP_Temp22 : SEC : SBC.B DP_Temp1E : STA.B DP_Temp22 : BCC ..loop
    LDA.B DP_Temp22 : AND.W #$FF00 : STA.B [DP_Temp00],Y
    INY #2 : CPY.W #$01CC : BMI .leftOnScreen
    BRA .leftEdgeEnd

  ..loop:
    LDA.W #$00FF : STA.B [DP_Temp00],Y
    INY #2 : CPY.W #$01CC : BMI ..loop

  .leftEdgeEnd:
    LDY.B DP_Temp12

  .leftHighByteFF:
    LDA.W #$FF00 : STA.B [DP_Temp00],Y
    INY #2 : CPY.B DP_Temp14 : BMI .leftHighByteFF
    BEQ .leftHighByteFF
    PLP
    RTS


;;; $C022: Calculate x-ray / morph ball eye beam HDMA data table - origin is off screen - beam is aimed upwards ;;;
Calc_Xray_HDMADataTable_OffScreen_AimedUpwards:
;; Parameters:
;;     $00: HDMA data table pointer. $7E:9100 for morph ball eye beam, $7E:9800 for x-ray
;;     $16: Beam origin X position * 100h
;;     $18: Beam origin Y position
;;     $1A: Beam left edge angle
;;     $1C: Beam right edge angle
;;     $1E: Beam left edge gradient * 100h (dx/dy)
;;     $20: Beam right edge gradient * 100h (dx/dy)
    PHP
    REP #$30
    LDA.B DP_Temp18 : DEC : ASL : TAY
    LDA.B DP_Temp16 : STA.B DP_Temp22 : STA.B DP_Temp24
    LDA.B DP_Temp1A : CMP.W #$00C0 : BPL +
    LDX.W #$0000
    BRA .merge

+   LDA.B DP_Temp1C : CMP.W #$00C0 : BPL +
    LDX.W #$0002
    BRA .merge

+   LDX.W #$0004

  .merge:
    LDA.B DP_Temp18 : ASL : STA.B DP_Temp1A
    JSR.W (.pointers,X)
    LDY.B DP_Temp12

  .loop:
    LDA.W #$00FF : STA.B [DP_Temp00],Y
    INY #2 : CPY.W #$01CC : BMI .loop
    PLP
    RTS

  .pointers:
    dw Calc_Xray_HDMADataTable_OffScreen_AimedUpwards_UpRight
    dw Calc_Xray_HDMADataTable_OffScreen_AimedUpwards_Up
    dw Calc_Xray_HDMADataTable_OffScreen_AimedUpwards_UpLeft


;;; $C069: Calculate x-ray / morph ball eye beam HDMA data table - origin is off screen - beam is aimed upwards - beam is aimed up-right ;;;
Calc_Xray_HDMADataTable_OffScreen_AimedUpwards_UpRight:
;; Parameters:
;;     Y: ([Beam origin Y position] - 1) * 2
;;     $00: HDMA data table pointer. $7E:9100 for morph ball eye beam, $7E:9800 for x-ray
;;     $1E: Beam left edge gradient * 100h (dx/dy)
;;     $20: Beam right edge gradient * 100h (dx/dy)
;;     $22: Beam origin X position * 100h (note: negative)
;;     $24: Beam origin X position * 100h (note: negative)

;; Returns:
;;     $12: Index of bottom Y position of the beam

; Current left line co-ordinates = ([$22], [Y] / 2)
; Current right line co-ordinates = ([$24], [Y] / 2)
; [$12]/2 and [$14]/2 become the top and bottom Y positions of the largest rectangular region of the beam
    PHP
    REP #$30
    PHY

  .loopLeftOffScreen:
    LDA.B DP_Temp22 : CLC : ADC.B DP_Temp1E : STA.B DP_Temp22 : BCS +
    DEY #2 : BPL .loopLeftOffScreen
    STZ.B DP_Temp12
    BRA .leftEdgeEnd

+   SEP #$20
    LDA.B DP_Temp23 : STA.B [DP_Temp00],Y
    REP #$20
    DEY #2 : BPL +
    LDA.W #$0002 : STA.B DP_Temp12
    BRA .leftEdgeEnd

+   TYA : CLC : ADC.W #$0004 : STA.B DP_Temp12

  .loopLeftOnScreen:
    LDA.B DP_Temp22 : CLC : ADC.B DP_Temp1E : STA.B DP_Temp22 : BCS .left8Bit
    SEP #$20
    LDA.B DP_Temp23 : STA.B [DP_Temp00],Y
    REP #$20
    DEY #2 : BPL .loopLeftOnScreen
    BRA .leftEdgeEnd

  .left8Bit:
    SEP #$20

  .loopLeft:
    LDA.B #$FF : STA.B [DP_Temp00],Y
    DEY #2 : BPL .loopLeft

  .leftEdgeEnd:
    REP #$20
    PLY : INY

  .loopRightOffScreen:
    LDA.B DP_Temp24 : CLC : ADC.B DP_Temp20 : STA.B DP_Temp24 : BCS +
    DEY #2 : BPL .loopRightOffScreen
    LDA.W #$0001 : STA.B DP_Temp14
    BRA .rightEdgeEnd

+   SEP #$20
    LDA.B DP_Temp25 : STA.B [DP_Temp00],Y
    REP #$20
    DEY #2 : BPL +
    LDA.W #$0003 : STA.B DP_Temp14
    BRA .rightEdgeEnd

+   TYA : CLC : ADC.W #$0004 : STA.B DP_Temp14

  .loopRightOnScreen:
    LDA.B DP_Temp24 : CLC : ADC.B DP_Temp20 : STA.B DP_Temp24 : BCS .right8Bit
    SEP #$20
    LDA.B DP_Temp25 : STA.B [DP_Temp00],Y
    REP #$20
    DEY #2 : BPL .loopRightOnScreen
    BRA .rightEdgeEnd

  .right8Bit:
    SEP #$20

  .loopFF:
    LDA.B #$FF : STA.B [DP_Temp00],Y
    DEY #2 : BPL .loopFF

  .rightEdgeEnd:
    SEP #$20
    LDY.B DP_Temp12

  .loop00:
    LDA.B #$00 : STA.B [DP_Temp00],Y
    INY #2 : CPY.B DP_Temp14 : BMI .loop00
    REP #$20
    LDA.B DP_Temp14 : DEC : STA.B DP_Temp12
    PLP
    RTS


;;; $C123: Calculate x-ray / morph ball eye beam HDMA data table - origin is off screen - beam is aimed upwards - beam is aimed up ;;;
Calc_Xray_HDMADataTable_OffScreen_AimedUpwards_Up:
;; Parameters:
;;     Y: ([Beam origin Y position] - 1) * 2
;;     $00: HDMA data table pointer. $7E:9100 for morph ball eye beam, $7E:9800 for x-ray
;;     $1E: Beam left edge gradient * 100h (dx/dy)
;;     $20: Beam right edge gradient * 100h (dx/dy)
;;     $22: Beam origin X position * 100h
;;     $24: Beam origin X position * 100h

;; Returns:
;;     $12: Index of bottom Y position of the beam

; Current left line co-ordinates = ([$22], [Y] / 2)
; Current right line co-ordinates = ([$24], [Y] / 2)

; This routine is never called, because x-ray is not allowed to be aimed upwards and morph ball eye isn't positioned to allow it.
; That said, this routine seems... wrong?
; It looks like it works off the assumption that the beam left/right lines both start off-screen,
; specifically that the left line comes from right off-screen and the right line comes from left off-screen,
; which is clearly impossible.
; The return value $12 is questionable too,
; it's given here as the index of the lowest Y position of the left line that's on-screen,
; rather than the minimum of left and right lines.
; This routine ought to be split into two cases depending on which side off-screen Samus is.
    PHP
    REP #$30
    PHY

  .loopLeftOffScreen:
    LDA.B DP_Temp22 : SEC : SBC.B DP_Temp1E : STA.B DP_Temp22 : BCC +
    DEY #2 : BPL .loopLeftOffScreen
    STZ.B DP_Temp12
    BRA .leftEdgeEnd

+   SEP #$20
    LDA.B DP_Temp23 : STA.B [DP_Temp00],Y
    REP #$20
    DEY #2 : BPL +
    LDA.W #$0002 : STA.B DP_Temp12
    BRA .leftEdgeEnd

+   TYA : CLC : ADC.W #$0004 : STA.B DP_Temp12

  .loopLeftOnScreen:
    LDA.B DP_Temp22 : SEC : SBC.B DP_Temp1E : STA.B DP_Temp22 : BCC +
    SEP #$20
    LDA.B DP_Temp23 : STA.B [DP_Temp00],Y
    REP #$20
    DEY #2 : BPL .loopLeftOnScreen
    BRA .leftEdgeEnd

+   SEP #$20

  .loopLeft:
    LDA.B #$00 : STA.B [DP_Temp00],Y
    DEY #2 : BPL .loopLeft

  .leftEdgeEnd:
    REP #$20
    PLY : INY

  .loopRightOffScreen:
    LDA.B DP_Temp24 : CLC : ADC.B DP_Temp20 : STA.B DP_Temp24 : BCS +
    DEY #2 : BPL .loopRightOffScreen
    LDA.W #$0001 : STA.B DP_Temp14
    BRA .return

+   SEP #$20
    LDA.B DP_Temp25 : STA.B [DP_Temp00],Y
    REP #$20
    DEY #2 : BPL +
    LDA.W #$0003 : STA.B DP_Temp14
    BRA .return

+   TYA : CLC : ADC.W #$0004 : STA.B DP_Temp14

  .loopRightOnScreen:
    LDA.B DP_Temp24 : CLC : ADC.B DP_Temp20 : STA.B DP_Temp24 : BCS +
    SEP #$20
    LDA.B DP_Temp25 : STA.B [DP_Temp00],Y
    REP #$20
    DEY #2 : BPL .loopRightOnScreen
    BRA .return

+   SEP #$20

  .loopRight:
    LDA.B #$FF : STA.B [DP_Temp00],Y
    DEY #2 : BPL .loopRight

  .return:
    REP #$20
    PLP
    RTS


;;; $C1CA: Calculate x-ray / morph ball eye beam HDMA data table - origin is off screen - beam is aimed upwards - beam is aimed up-left ;;;
Calc_Xray_HDMADataTable_OffScreen_AimedUpwards_UpLeft:
;; Parameters:
;;     Y: ([Beam origin Y position] - 1) * 2
;;     $00: HDMA data table pointer. $7E:9100 for morph ball eye beam, $7E:9800 for x-ray
;;     $1E: Beam left edge gradient * 100h (dx/dy)
;;     $20: Beam right edge gradient * 100h (dx/dy)
;;     $22: Beam origin X position * 100h (note: over 10000h)
;;     $24: Beam origin X position * 100h (note: over 10000h)

;; Returns:
;;     $12: Index of bottom Y position of the beam

; Current left line co-ordinates = ([$22], [Y] / 2)
; Current right line co-ordinates = ([$24], [Y] / 2)
; [$12]/2 and [$14]/2 become the top and bottom Y positions of the largest rectangular region of the beam
    PHP
    REP #$30
    PHY

  .loopLeftOffScreen:
    LDA.B DP_Temp22 : SEC : SBC.B DP_Temp1E : STA.B DP_Temp22 : BCC +
    DEY #2 : BPL .loopLeftOffScreen
    STZ.B DP_Temp12
    BRA .leftEdgeEnd

+   SEP #$20
    LDA.B DP_Temp23 : STA.B [DP_Temp00],Y
    REP #$20
    DEY #2 : BPL +
    LDA.W #$0002 : STA.B DP_Temp12
    BRA .leftEdgeEnd

+   TYA : CLC : ADC.W #$0004 : STA.B DP_Temp12

  .loopLeftOnScreen:
    LDA.B DP_Temp22 : SEC : SBC.B DP_Temp1E : STA.B DP_Temp22 : BCC +
    SEP #$20
    LDA.B DP_Temp23 : STA.B [DP_Temp00],Y
    REP #$20
    DEY #2 : BPL .loopLeftOnScreen
    BRA .leftEdgeEnd

+   SEP #$20

  .loopLeft:
    LDA.B #$00 : STA.B [DP_Temp00],Y
    DEY #2 : BPL .loopLeft

  .leftEdgeEnd:
    REP #$20
    PLY : INY

  .loopRightOffScreen:
    LDA.B DP_Temp24 : SEC : SBC.B DP_Temp20 : STA.B DP_Temp24 : BCC +
    DEY #2 : BPL .loopRightOffScreen
    LDA.W #$0001 : STA.B DP_Temp14
    BRA .rightEdgeEnd

+   SEP #$20
    LDA.B DP_Temp23 : STA.B [DP_Temp00],Y
    REP #$20
    DEY #2 : BPL +
    LDA.W #$0003 : STA.B DP_Temp14
    BRA .rightEdgeEnd

+   TYA : CLC : ADC.W #$0004 : STA.B DP_Temp14

  .loopRightOnScreen:
    LDA.B DP_Temp24 : SEC : SBC.B DP_Temp20 : STA.B DP_Temp24 : BCC +
    SEP #$20
    LDA.B DP_Temp25 : STA.B [DP_Temp00],Y
    REP #$20
    DEY #2 : BPL .loopRightOnScreen
    BRA .rightEdgeEnd

+   SEP #$20

  .loopRight:
    LDA.B #$00 : STA.B [DP_Temp00],Y
    DEY #2 : BPL .loopRight

  .rightEdgeEnd:
    SEP #$20
    LDY.B DP_Temp14

  .endLoop:
    LDA.B #$FF : STA.B [DP_Temp00],Y
    INY #2 : CPY.B DP_Temp12 : BMI .endLoop
    REP #$20
    PLP
    RTS


;;; $C27F: Calculate x-ray / morph ball eye beam HDMA data table - origin is off screen - beam is aimed downwards ;;;
Calc_Xray_HDMADataTable_OffScreen_AimedDownwards:
;; Parameters:
;;     $00: HDMA data table pointer. $7E:9100 for morph ball eye beam, $7E:9800 for x-ray
;;     $16: Beam origin X position * 100h
;;     $18: Beam origin Y position
;;     $1A: Beam left edge angle
;;     $1C: Beam right edge angle
;;     $1E: Beam left edge gradient * 100h (dx/dy)
;;     $20: Beam right edge gradient * 100h (dx/dy)
    PHP
    REP #$30
    LDA.B DP_Temp18 : ASL : TAY
    LDA.B DP_Temp16 : STA.B DP_Temp22 : STA.B DP_Temp24
    LDA.B DP_Temp1C : CMP.W #$0080 : BPL +
    LDX.W #$0000
    BRA .merge

+   LDA.B DP_Temp1A : CMP.W #$0080 : BPL .index4
    LDX.W #$0002
    BRA .merge

  .index4:
    LDX.W #$0004

  .merge:
    JSR.W (.pointers,X)
    LDY.B DP_Temp12
    LDA.W #$00FF

  .loop:
    STA.B [DP_Temp00],Y
    DEY #2 : BPL .loop
    PLP
    RTS

  .pointers:
    dw Calc_Xray_HDMADataTable_OffScreen_AimedDownwards_DownRight
    dw Calc_Xray_HDMADataTable_OffScreen_AimedDownwards_Down
    dw Calc_Xray_HDMADataTable_OffScreen_AimedDownwards_DownLeft


;;; $C2BD: Calculate x-ray / morph ball eye beam HDMA data table - origin is off screen - beam is aimed downwards - beam is aimed down-right ;;;
Calc_Xray_HDMADataTable_OffScreen_AimedDownwards_DownRight:
;; Parameters:
;;     Y: [Beam origin Y position] * 2
;;     $00: HDMA data table pointer. $7E:9100 for morph ball eye beam, $7E:9800 for x-ray
;;     $1E: Beam left edge gradient * 100h (dx/dy)
;;     $20: Beam right edge gradient * 100h (dx/dy)
;;     $22: Beam origin X position * 100h (note: negative)
;;     $24: Beam origin X position * 100h (note: negative)

;; Returns:
;;     $12: Index of top Y position of the beam

; Current left line co-ordinates = ([$22], [Y] / 2)
; Current right line co-ordinates = ([$24], [Y] / 2)
; [$12]/2 and [$14]/2 become the bottom and top Y positions of the largest rectangular region of the beam
    PHP
    REP #$30
    PHY

  .loopRightOffScreen:
    LDA.B DP_Temp24 : CLC : ADC.B DP_Temp20 : STA.B DP_Temp24 : BCS +
    INY #2 : CPY.W #$01CC : BMI .loopRightOffScreen
    STY.B DP_Temp12
    BRA .rightEdgeEnd

+   LDA.B DP_Temp25 : STA.B [DP_Temp00],Y
    INY #2 : CPY.W #$01CC : BMI +
    LDA.W #$01CA : STA.B DP_Temp12
    BRA .rightEdgeEnd

+   TYA : SEC : SBC.W #$0004 : STA.B DP_Temp12

  .loopRightOnScreen:
    LDA.B DP_Temp24 : CLC : ADC.B DP_Temp20 : STA.B DP_Temp24 : BCS .loopRight
    LDA.B DP_Temp25 : STA.B [DP_Temp00],Y
    INY #2 : CPY.W #$01CC : BMI .loopRightOnScreen
    BRA .rightEdgeEnd

  .loopRight:
    LDA.W #$00FF : STA.B [DP_Temp00],Y
    INY #2 : CPY.W #$01CC : BMI .loopRight

  .rightEdgeEnd:
    PLY : INY

  .loopLeftOffScreen:
    LDA.B DP_Temp22 : CLC : ADC.B DP_Temp1E : STA.B DP_Temp22 : BCS +
    INY #2 : CPY.W #$01CC : BMI .loopLeftOffScreen
    STY.B DP_Temp14
    BRA .leftEdgeEnd

+   SEP #$20
    LDA.B DP_Temp23 : STA.B [DP_Temp00],Y
    REP #$20
    INY #2 : CPY.W #$01CC : BMI +
    LDA.W #$01CB : STA.B DP_Temp14
    BRA .leftEdgeEnd

+   TYA : SEC : SBC.W #$0004 : STA.B DP_Temp14

  .loopLeftOnScreen:
    LDA.B DP_Temp22 : CLC : ADC.B DP_Temp1E : STA.B DP_Temp22 : BCS +
    SEP #$20
    LDA.B DP_Temp23 : STA.B [DP_Temp00],Y
    REP #$20
    INY #2 : CPY.W #$01CC : BMI .loopLeftOnScreen
    BRA .leftEdgeEnd

+   SEP #$20

  .loopLeft:
    LDA.B #$FF : STA.B [DP_Temp00],Y
    INY #2 : CPY.W #$01CC : BMI .loopLeft

  .leftEdgeEnd:
    SEP #$20
    LDY.B DP_Temp12

  .loopEnd:
    LDA.B #$00 : STA.B [DP_Temp00],Y
    DEY #2 : CPY.B DP_Temp14 : BPL .loopEnd
    REP #$20
    LDA.B DP_Temp14 : DEC : STA.B DP_Temp12
    PLP
    RTS


;;; $C381: Calculate x-ray / morph ball eye beam HDMA data table - origin is off screen - beam is aimed downwards - beam is aimed down ;;;
Calc_Xray_HDMADataTable_OffScreen_AimedDownwards_Down:
;; Parameters:
;;     Y: [Beam origin Y position] * 2
;;     $00: HDMA data table pointer. $7E:9100 for morph ball eye beam, $7E:9800 for x-ray
;;     $1E: Beam left edge gradient * 100h (dx/dy)
;;     $20: Beam right edge gradient * 100h (dx/dy)
;;     $22: Beam origin X position * 100h
;;     $24: Beam origin X position * 100h

;; Returns:
;;     $12: Index of top Y position of the beam

; Current left line co-ordinates = ([$22], [Y] / 2)
; Current right line co-ordinates = ([$24], [Y] / 2)
    PHP
    REP #$30
    PHY
    LDA.B DP_Temp20 : BNE .loopRightOffScreen
    STY.B DP_Temp12
    LDA.W #$0000

  .loopClear:
    STA.B [DP_Temp00],Y
    INY #2 : CPY.W #$01CC : BMI .loopClear
    BRA .rightEdgeEnd

  .loopRightOffScreen:
    LDA.B DP_Temp24 : SEC : SBC.B DP_Temp20 : STA.B DP_Temp24 : BCC +
    INY #2 : CPY.W #$01CC : BMI .loopRightOffScreen
    STY.B DP_Temp12
    BRA .rightEdgeEnd

+   LDA.B DP_Temp25 : STA.B [DP_Temp00],Y
    INY #2 : CPY.W #$01CC : BMI +
    LDA.W #$01CA : STA.B DP_Temp12
    BRA .rightEdgeEnd

+   TYA : SEC : SBC.W #$0004 : STA.B DP_Temp12

  .loopRightOnScreen:
    LDA.B DP_Temp24 : SEC : SBC.B DP_Temp20 : STA.B DP_Temp24 : BCC ..loop
    LDA.B DP_Temp25 : STA.B [DP_Temp00],Y
    INY #2 : CPY.W #$01CC : BMI .loopRightOnScreen
    BRA .rightEdgeEnd

  ..loop:
    LDA.W #$0000 : STA.B [DP_Temp00],Y
    INY #2 : CPY.W #$01CC : BMI ..loop

  .rightEdgeEnd:
    PLY : INY

  .loopLeftOffScreen:
    LDA.B DP_Temp22 : CLC : ADC.B DP_Temp1E : STA.B DP_Temp22 : BCS +
    INY #2 : CPY.W #$01CC : BMI .loopLeftOffScreen
    STY.B DP_Temp14
    BRA .return

+   SEP #$20
    LDA.B DP_Temp23 : STA.B [DP_Temp00],Y
    REP #$20
    INY #2 : CPY.W #$01CC : BMI +
    LDA.W #$01CB : STA.B DP_Temp14
    BRA .return

+   TYA : SEC : SBC.W #$0004 : STA.B DP_Temp14

  .loopLeftOnScreen:
    LDA.B DP_Temp22 : CLC : ADC.B DP_Temp1E : STA.B DP_Temp22 : BCS +
    SEP #$20
    LDA.B DP_Temp23 : STA.B [DP_Temp00],Y
    REP #$20
    INY #2 : CPY.W #$01CC : BMI .loopLeftOnScreen
    BRA .return

+   SEP #$20
    LDA.B #$FF

  ..loop:
    STA.B [DP_Temp00],Y
    INY #2 : CPY.W #$01CC : BMI ..loop
    REP #$20

  .return:
    PLP
    RTS


;;; $C446: Calculate x-ray / morph ball eye beam HDMA data table - origin is off screen - beam is aimed downwards - beam is aimed down-left ;;;
Calc_Xray_HDMADataTable_OffScreen_AimedDownwards_DownLeft:
;; Parameters:
;;     Y: [Beam origin Y position] * 2
;;     $00: HDMA data table pointer. $7E:9100 for morph ball eye beam, $7E:9800 for x-ray
;;     $1E: Beam left edge gradient * 100h (dx/dy)
;;     $20: Beam right edge gradient * 100h (dx/dy)
;;     $22: Beam origin X position * 100h (note: above 10000h)
;;     $24: Beam origin X position * 100h (note: above 10000h)

;; Returns:
;;     $12: Index of top Y position of the beam

; Current left line co-ordinates = ([$22], [Y] / 2)
; Current right line co-ordinates = ([$24], [Y] / 2)
; [$12]/2 and [$14]/2 become the bottom and top Y positions of the largest rectangular region of the beam
    PHP
    REP #$30
    PHY

  .loopRightOffScreen:
    LDA.B DP_Temp24 : SEC : SBC.B DP_Temp20 : STA.B DP_Temp24 : BCC +
    INY #2 : CPY.W #$01CC : BMI .loopRightOffScreen
    STY.B DP_Temp12
    BRA .rightEdgeEnd

+   LDA.B DP_Temp25 : STA.B [DP_Temp00],Y
    INY #2 : CPY.W #$01CC : BMI +
    LDA.W #$01CA : STA.B DP_Temp12
    BRA .rightEdgeEnd

+   TYA : SEC : SBC.W #$0004 : STA.B DP_Temp12

  .loopRightOnScreen:
    LDA.B DP_Temp24 : SEC : SBC.B DP_Temp20 : STA.B DP_Temp24 : BCC .loopRight
    LDA.B DP_Temp25 : STA.B [DP_Temp00],Y
    INY #2 : CPY.W #$01CC : BMI .loopRightOnScreen
    BRA .rightEdgeEnd

  .loopRight:
    LDA.W #$0000 : STA.B [DP_Temp00],Y
    INY #2 : CPY.W #$01CC : BMI .loopRight

  .rightEdgeEnd:
    PLY : INY

  .loopLeftOffScreen:
    LDA.B DP_Temp22 : SEC : SBC.B DP_Temp1E : STA.B DP_Temp22 : BCC +
    INY #2 : CPY.W #$01CC : BMI .loopLeftOffScreen
    STY.B DP_Temp14
    BRA .leftEdgeEnd

+   SEP #$20
    LDA.B DP_Temp23 : STA.B [DP_Temp00],Y
    REP #$20
    INY #2 : CPY.W #$01CC : BMI +
    LDA.W #$01CB : STA.B DP_Temp14
    BRA .leftEdgeEnd

+   TYA : SEC : SBC.W #$0004 : STA.B DP_Temp14

  .loopLeftOnScreen:
    LDA.B DP_Temp22 : SEC : SBC.B DP_Temp1E : STA.B DP_Temp22 : BCC +
    SEP #$20
    LDA.B DP_Temp23 : STA.B [DP_Temp00],Y
    REP #$20
    INY #2 : CPY.W #$01CC : BMI .loopLeftOnScreen
    BRA .leftEdgeEnd

+   SEP #$20

  .loopLeft:
    LDA.B #$00 : STA.B [DP_Temp00],Y
    INY #2 : CPY.W #$01CC : BMI .loopLeft

  .leftEdgeEnd:
    SEP #$20
    LDY.B DP_Temp14

  .loopEnd:
    LDA.B #$FF : STA.B [DP_Temp00],Y
    DEY #2 : CPY.B DP_Temp12 : BPL .loopEnd
    REP #$20
    PLP
    RTS


;;; $C505: Calculate x-ray / morph ball eye beam HDMA data table - origin is off screen - beam is horizontal line ;;;
Calc_Xray_HDMADataTable_OffScreen_HorizontalLine:
;; Parameters:
;;     $00: HDMA data table pointer. $7E:9100 for morph ball eye beam, $7E:9800 for x-ray
;;     $12: Beam angle
;;     $18: Beam origin Y position
    PHP
    REP #$30
    LDA.B DP_Temp18 : DEC : ASL : TAY
    LDA.B DP_Temp12 : CMP.W #$0040 : BNE +
    LDA.W #$FF00 : STA.B [DP_Temp00],Y
    BRA .next

+   LDA.W #$FF00 : STA.B [DP_Temp00],Y

  .next:
    DEY #2

  .loopTop:
    LDA.B [DP_Temp00],Y : CMP.W #$00FF : BEQ .loopBottom
    LDA.W #$00FF : STA.B [DP_Temp00],Y
    DEY #2 : BPL .loopTop

  .loopBottom:
    LDA.B DP_Temp18 : ASL : TAY

  .loop:
    LDA.B [DP_Temp00],Y : CMP.W #$00FF : BEQ .return
    LDA.W #$00FF : STA.B [DP_Temp00],Y
    INY #2 : CPY.W #$01CC : BMI .loop

  .return:
    PLP
    RTS


;;; $C54B: Calculate x-ray / morph ball eye beam HDMA data table - origin is on screen ;;;
Calc_Xray_HDMADataTable_OnScreen:
;; Parameters:
;;     X: Beam origin X position
;;     Y: Beam origin Y position
;;     $00: HDMA data table pointer. $7E:9100 for morph ball eye beam, $7E:9800 for x-ray
;;     $12: [beam angle]
;;     $14: [beam angular width]
    PHP : PHB
    PHK : PLB
    REP #$30
    TXA : XBA : AND.W #$FF00 : STA.B DP_Temp16
    STY.B DP_Temp18
    LDA.B DP_Temp12 : SEC : SBC.B DP_Temp14 : STA.B DP_Temp1A : BPL +
    LDA.W #$0100 : CLC : ADC.B DP_Temp1A : STA.B DP_Temp1A

+   LDA.B DP_Temp12 : CLC : ADC.B DP_Temp14 : STA.B DP_Temp1C
    CMP.W #$0101 : BMI +
    SEC : SBC.W #$0100 : STA.B DP_Temp1C

+   LDA.B DP_Temp14 : BNE +
    LDA.B DP_Temp12 : CMP.W #$0040 : BEQ .strictlyHorizontal
    CMP.W #$00C0 : BEQ .strictlyHorizontal

+   LDA.B DP_Temp1A : CMP.W #$0080 : BPL +
    CMP.W #$0040 : BPL .bottomHalf
    LDA.B DP_Temp1C : CMP.W #$0040 : BMI .topHalf
    BRA .right

+   CMP.W #$00C0 : BPL .topHalf
    LDA.B DP_Temp1C : CMP.W #$00C0 : BMI .bottomHalf
    BRA .left

  .right:
; [beam left edge angle] < 40h and [beam right edge angle] >= 40h
    LDY.W #$0000
    BRA .merge

  .topHalf:
; [beam right edge angle] < 40h or [beam left edge angle] >= C0h
    LDY.W #$0002
    BRA .merge

  .bottomHalf:
; 40h <= [beam left edge angle] < 80h or 80h <= [beam left edge angle] and [beam right edge angle] < C0h
    LDY.W #$0004
    BRA .merge

  .left:
; [beam left edge angle] < C0h and [beam right edge angle] >= C0h
    LDY.W #$0006
    BRA .merge

  .strictlyHorizontal:
; [beam angular width] = 0 and ([beam angle] = 40h or [beam angle] = C0h)
    LDY.W #$0008

  .merge:
    LDA.B DP_Temp1A : CMP.W #$0080 : BMI +
    SEC : SBC.W #$0080

+   ASL : TAX
    LDA.W AbsoluteTangentTable,X : STA.B DP_Temp1E
    LDA.B DP_Temp1C : CMP.W #$0080 : BMI +
    SEC : SBC.W #$0080

+   ASL : TAX
    LDA.W AbsoluteTangentTable,X : STA.B DP_Temp20
    TYX
    STZ.W OffScreenBeamHDMADataTableIndex
    JSR.W (.pointers,X)
    PLB : PLP
    RTL

  .pointers:
    dw Calc_Xray_HDMADataTable_OnScreen_AimedRight
    dw Calc_Xray_HDMADataTable_OnScreen_AimedUpwards
    dw Calc_Xray_HDMADataTable_OnScreen_AimedDownwards
    dw Calc_Xray_HDMADataTable_OnScreen_AimedLeft
    dw Calc_Xray_HDMADataTable_OnScreen_HorizontalLine


;;; $C5FF: Calculate x-ray / morph ball eye beam HDMA data table - origin is on screen - beam is aimed right ;;;
Calc_Xray_HDMADataTable_OnScreen_AimedRight:
;; Parameters:
;;     $00: HDMA data table pointer. $7E:9100 for morph ball eye beam, $7E:9800 for x-ray
;;     $16: Beam origin X position * 100h
;;     $18: Beam origin Y position
;;     $1E: Beam left edge gradient * 100h (dx/dy)
;;     $20: Beam right edge gradient * 100h (dx/dy)

; Current left line co-ordinates = ([$22], [Y] / 2)
; Current right line co-ordinates = ([$24], [Y] / 2)
    PHP
    REP #$30
    LDA.B DP_Temp18 : DEC : ASL : TAY
    LDA.B DP_Temp17 : ORA.W #$FF00 : STA.B [DP_Temp00],Y
    DEY #2
    LDA.B DP_Temp16 : STA.B DP_Temp22 : STA.B DP_Temp24

  .loopLeftOnScreen:
    LDA.B DP_Temp22 : CLC : ADC.B DP_Temp1E : STA.B DP_Temp22 : BCS .loopLeft
    LDA.B DP_Temp23 : ORA.W #$FF00 : STA.B [DP_Temp00],Y
    DEY #2 : BPL .loopLeftOnScreen
    BRA .leftEdgeEnd

  .loopLeft:
    LDA.W #$00FF : STA.B [DP_Temp00],Y
    DEY #2 : BPL .loopLeft

  .leftEdgeEnd:
    LDA.B DP_Temp18 : ASL : TAY

  .loopRightOnScreen:
    LDA.B DP_Temp24 : CLC : ADC.B DP_Temp20 : STA.B DP_Temp24 : BCS .loopRight
    LDA.B DP_Temp25 : ORA.W #$FF00 : STA.B [DP_Temp00],Y
    INY #2 : CPY.W #$01CC : BMI .loopRightOnScreen
    BRA .return

  .loopRight:
    LDA.W #$00FF : STA.B [DP_Temp00],Y
    INY #2 : CPY.W #$01CC : BMI .loopRight

  .return:
    PLP
    RTS


;;; $C660: Calculate x-ray / morph ball eye beam HDMA data table - origin is on screen - beam is aimed left ;;;
Calc_Xray_HDMADataTable_OnScreen_AimedLeft:
;; Parameters:
;;     $00: HDMA data table pointer. $7E:9100 for morph ball eye beam, $7E:9800 for x-ray
;;     $16: Beam origin X position * 100h
;;     $18: Beam origin Y position
;;     $1E: Beam left edge gradient * 100h (dx/dy)
;;     $20: Beam right edge gradient * 100h (dx/dy)

; Current left line co-ordinates = ([$22], [Y] / 2)
; Current right line co-ordinates = ([$24], [Y] / 2)
    PHP
    REP #$30
    LDA.B DP_Temp18 : DEC : ASL : TAY
    LDA.B DP_Temp16 : AND.W #$FF00 : STA.B [DP_Temp00],Y
    DEY #2
    LDA.B DP_Temp16 : STA.B DP_Temp22 : STA.B DP_Temp24

  .loopRightOnScreen:
    LDA.B DP_Temp24 : SEC : SBC.B DP_Temp20 : STA.B DP_Temp24 : BCC .loopRight
    LDA.B DP_Temp24 : AND.W #$FF00 : STA.B [DP_Temp00],Y
    DEY #2 : BPL .loopRightOnScreen
    BRA .rightEdgeEnd

  .loopRight:
    LDA.W #$00FF : STA.B [DP_Temp00],Y
    DEY #2 : BPL .loopRight

  .rightEdgeEnd:
    LDA.B DP_Temp18 : ASL : TAY

  .loopLeftOnScreen:
    LDA.B DP_Temp22 : SEC : SBC.B DP_Temp1E : STA.B DP_Temp22 : BCC .loopLeft
    LDA.B DP_Temp22 : AND.W #$FF00 : STA.B [DP_Temp00],Y
    INY #2 : CPY.W #$01CC : BMI .loopLeftOnScreen
    BRA .return

  .loopLeft:
    LDA.W #$00FF : STA.B [DP_Temp00],Y
    INY #2 : CPY.W #$01CC : BMI .loopLeft

  .return:
    PLP
    RTS


;;; $C6C1: Calculate x-ray / morph ball eye beam HDMA data table - origin is on screen - beam is aimed upwards ;;;
Calc_Xray_HDMADataTable_OnScreen_AimedUpwards:
;; Parameters:
;;     $00: HDMA data table pointer. $7E:9100 for morph ball eye beam, $7E:9800 for x-ray
;;     $16: Beam origin X position * 100h
;;     $18: Beam origin Y position
;;     $1A: Beam left edge angle
;;     $1C: Beam right edge angle
;;     $1E: Beam left edge gradient * 100h (dx/dy)
;;     $20: Beam right edge gradient * 100h (dx/dy)
    PHP
    REP #$30
    LDA.B DP_Temp18 : DEC : ASL : TAY
    SEP #$20
    LDA.B DP_Temp17 : STA.B [DP_Temp00],Y
    INY
    LDA.B DP_Temp17 : STA.B [DP_Temp00],Y
    REP #$20
    DEY #3
    LDA.B DP_Temp16 : STA.B DP_Temp22 : STA.B DP_Temp24
    LDA.B DP_Temp1A : CMP.W #$00C0 : BPL +
    LDX.W #$0000
    BRA .merge

+   LDA.B DP_Temp1C : CMP.W #$00C0 : BPL +
    LDX.W #$0002
    BRA .merge

+   LDX.W #$0004

  .merge:
    JSR.W (.pointers,X)
    LDA.B DP_Temp18 : ASL : TAY

  .loop:
    LDA.B [DP_Temp00],Y : CMP.W #$00FF : BEQ .return
    LDA.W #$00FF : STA.B [DP_Temp00],Y
    INY #2 : CPY.W #$01CC : BMI .loop

  .return:
    PLP
    RTS

  .pointers:
    dw Calc_Xray_HDMADataTable_OnScreen_AimedUpwards_UpRight
    dw Calc_Xray_HDMADataTable_OnScreen_AimedUpwards_Up
    dw Calc_Xray_HDMADataTable_OnScreen_AimedUpwards_UpLeft


;;; $C71C: Calculate x-ray / morph ball eye beam HDMA data table - origin is on screen - beam is aimed upwards - beam is aimed up-right ;;;
Calc_Xray_HDMADataTable_OnScreen_AimedUpwards_UpRight:
;; Parameters:
;;     Y: ([Beam origin Y position] - 1) * 2
;;     $00: HDMA data table pointer. $7E:9100 for morph ball eye beam, $7E:9800 for x-ray
;;     $1E: Beam left edge gradient * 100h (dx/dy)
;;     $20: Beam right edge gradient * 100h (dx/dy)
;;     $22: Beam origin X position * 100h
;;     $24: Beam origin X position * 100h

; Current left line co-ordinates = ([$22], [Y] / 2)
; Current right line co-ordinates = ([$24], [Y] / 2)
    PHP
    REP #$30
    PHY

  .loopLeftOnScreen:
    LDA.B DP_Temp22 : CLC : ADC.B DP_Temp1E : STA.B DP_Temp22 : BCS +
    SEP #$20
    LDA.B DP_Temp23 : STA.B [DP_Temp00],Y
    REP #$20
    DEY #2 : BPL .loopLeftOnScreen
    BRA .leftEdgeEnd

+   STY.W OffScreenBeamHDMADataTableIndex
    SEP #$20
    LDA.B #$FF

  .loopLeft:
    STA.B [DP_Temp00],Y
    DEY #2 : BPL .loopLeft
    REP #$20

  .leftEdgeEnd:
    PLY : INY

  .loopRightOnScreen:
    LDA.B DP_Temp24 : CLC : ADC.B DP_Temp20 : STA.B DP_Temp24 : BCS +
    SEP #$20
    LDA.B DP_Temp25 : STA.B [DP_Temp00],Y
    REP #$20
    DEY #2 : BPL .loopRightOnScreen
    BRA .return

+   SEP #$20

  .loopRight:
    LDA.B #$FF : STA.B [DP_Temp00],Y
    DEY #2 : BPL .loopRight
    REP #$20
    LDY.W OffScreenBeamHDMADataTableIndex : BEQ .return
    DEY #2 : BMI .return
    LDA.W #$00FF

  .loopEnd:
    STA.B [DP_Temp00],Y
    DEY #2 : BPL .loopEnd

  .return:
    PLP
    RTS


;;; $C77F: Calculate x-ray / morph ball eye beam HDMA data table - origin is on screen - beam is aimed upwards - beam is aimed up ;;;
Calc_Xray_HDMADataTable_OnScreen_AimedUpwards_Up:
;; Parameters:
;;     Y: ([Beam origin Y position] - 1) * 2
;;     $00: HDMA data table pointer. $7E:9100 for morph ball eye beam, $7E:9800 for x-ray
;;     $1E: Beam left edge gradient * 100h (dx/dy)
;;     $20: Beam right edge gradient * 100h (dx/dy)
;;     $22: Beam origin X position * 100h
;;     $24: Beam origin X position * 100h

; Current left line co-ordinates = ([$22], [Y] / 2)
; Current right line co-ordinates = ([$24], [Y] / 2)

; This routine is never called, because x-ray is not allowed to be aimed upwards and morph ball eye isn't positioned to allow it.
    PHP
    REP #$30
    PHY

  .loopLeftOnScreen:
    LDA.B DP_Temp22 : SEC : SBC.B DP_Temp1E : STA.B DP_Temp22 : BCC +
    SEP #$20
    LDA.B DP_Temp23 : STA.B [DP_Temp00],Y
    REP #$20
    DEY #2 : BPL .loopLeftOnScreen
    BRA .leftEdgeEnd

+   SEP #$20

  .loopLeft:
    LDA.B #$00 : STA.B [DP_Temp00],Y
    DEY #2 : BPL .loopLeft
    REP #$20

  .leftEdgeEnd:
    PLY : INY

  .loopRightOnScreen:
    LDA.B DP_Temp24 : CLC : ADC.B DP_Temp20 : STA.B DP_Temp24 : BCS +
    SEP #$20
    LDA.B DP_Temp25 : STA.B [DP_Temp00],Y
    REP #$20
    DEY #2 : BPL .loopRightOnScreen
    BRA .return

+   SEP #$20

  .loopRight:
    LDA.B #$FF : STA.B [DP_Temp00],Y
    DEY #2 : BPL .loopRight

  .return:
    PLP
    RTS


;;; $C7CB: Calculate x-ray / morph ball eye beam HDMA data table - origin is on screen - beam is aimed upwards - beam is aimed up-left ;;;
Calc_Xray_HDMADataTable_OnScreen_AimedUpwards_UpLeft:
;; Parameters:
;;     Y: ([Beam origin Y position] - 1) * 2
;;     $00: HDMA data table pointer. $7E:9100 for morph ball eye beam, $7E:9800 for x-ray
;;     $1E: Beam left edge gradient * 100h (dx/dy)
;;     $20: Beam right edge gradient * 100h (dx/dy)
;;     $22: Beam origin X position * 100h
;;     $24: Beam origin X position * 100h

; Current left line co-ordinates = ([$22], [Y] / 2)
; Current right line co-ordinates = ([$24], [Y] / 2)
    PHP
    REP #$30
    PHY

  .loopLeftOnScreen:
    LDA.B DP_Temp22 : SEC : SBC.B DP_Temp1E : STA.B DP_Temp22 : BCC +
    SEP #$20
    LDA.B DP_Temp23 : STA.B [DP_Temp00],Y
    REP #$20
    DEY #2 : BPL .loopLeftOnScreen
    BRA .leftEdgeEnd

+   SEP #$20
    LDA.B #$00

  .loopLeft:
    STA.B [DP_Temp00],Y
    DEY #2 : BPL .loopLeft
    REP #$20

  .leftEdgeEnd:
    PLY : INY

  .loopRightOnScreen:
    LDA.B DP_Temp24 : SEC : SBC.B DP_Temp20 : STA.B DP_Temp24 : BCC +
    SEP #$20
    LDA.B DP_Temp25 : STA.B [DP_Temp00],Y
    REP #$20
    DEY #2 : BPL .loopRightOnScreen
    BRA .return

+   SEP #$20
    PHY
    LDA.B #$00

  .loopRight:
    STA.B [DP_Temp00],Y
    DEY #2 : BPL .loopRight
    PLY : DEY
    LDA.B #$FF

  .loopEnd:
    STA.B [DP_Temp00],Y
    DEY #2 : BPL .loopEnd

  .return:
    PLP
    RTS


;;; $C822: Calculate x-ray / morph ball eye beam HDMA data table - origin is on screen - beam is aimed downwards ;;;
Calc_Xray_HDMADataTable_OnScreen_AimedDownwards:
;; Parameters:
;;     $00: HDMA data table pointer. $7E:9100 for morph ball eye beam, $7E:9800 for x-ray
;;     $16: Beam origin X position * 100h
;;     $18: Beam origin Y position
;;     $1A: Beam left edge angle
;;     $1C: Beam right edge angle
;;     $1E: Beam left edge gradient * 100h (dx/dy)
;;     $20: Beam right edge gradient * 100h (dx/dy)
    PHP
    REP #$30
    LDA.B DP_Temp18 : DEC : ASL : TAY
    SEP #$20
    LDA.B DP_Temp17 : STA.B [DP_Temp00],Y
    INY
    LDA.B DP_Temp17 : STA.B [DP_Temp00],Y
    REP #$20
    INY
    LDA.B DP_Temp16 : STA.B DP_Temp22 : STA.B DP_Temp24
    LDA.B DP_Temp1C : CMP.W #$0080 : BPL +
    LDX.W #$0000
    BRA .merge

+   LDA.B DP_Temp1A : CMP.W #$0080 : BPL +
    LDX.W #$0002
    BRA .merge

+   LDX.W #$0004

  .merge:
    JSR.W (.pointers,X)
    LDA.B DP_Temp18 : DEC #2 : ASL : TAY

  .loop:
    LDA.B [DP_Temp00],Y : CMP.W #$00FF : BEQ .return
    LDA.W #$00FF : STA.B [DP_Temp00],Y
    DEY #2 : BPL .loop

  .return:
    PLP
    RTS

  .pointers:
    dw Calc_Xray_HDMADataTable_OnScreen_AimedDownwards_DownRight
    dw Calc_Xray_HDMADataTable_OnScreen_AimedDownwards_Down
    dw Calc_Xray_HDMADataTable_OnScreen_AimedDownwards_DownLeft


;;; $C87A: Calculate x-ray / morph ball eye beam HDMA data table - origin is on screen - beam is aimed downwards - beam is aimed down-right ;;;
Calc_Xray_HDMADataTable_OnScreen_AimedDownwards_DownRight:
;; Parameters:
;;     Y: [Beam origin Y position] * 2
;;     $00: HDMA data table pointer. $7E:9100 for morph ball eye beam, $7E:9800 for x-ray
;;     $1E: Beam left edge gradient * 100h (dx/dy)
;;     $20: Beam right edge gradient * 100h (dx/dy)
;;     $22: Beam origin X position * 100h
;;     $24: Beam origin X position * 100h

; Current left line co-ordinates = ([$22], [Y] / 2)
; Current right line co-ordinates = ([$24], [Y] / 2)
    PHP
    REP #$30
    PHY

  .loopRightOnScreen:
    LDA.B DP_Temp24 : CLC : ADC.B DP_Temp20 : STA.B DP_Temp24 : BCS +
    LDA.B DP_Temp25 : STA.B [DP_Temp00],Y
    INY #2 : CPY.W #$01CC : BMI .loopRightOnScreen
    BRA .rightEdgeEnd

+   STY.W OffScreenBeamHDMADataTableIndex
    LDA.W #$00FF

  .loopRight:
    STA.B [DP_Temp00],Y
    INY #2 : CPY.W #$01CC : BMI .loopRight

  .rightEdgeEnd:
    PLY : INY

  .loopLeftOnScreen:
    LDA.B DP_Temp22 : CLC : ADC.B DP_Temp1E : STA.B DP_Temp22 : BCS +
    SEP #$20
    LDA.B DP_Temp23 : STA.B [DP_Temp00],Y
    REP #$20
    INY #2 : CPY.W #$01CC : BMI .loopLeftOnScreen
    BRA .return

+   SEP #$20

  .loopLeft:
    LDA.B #$FF : STA.B [DP_Temp00],Y
    INY #2 : CPY.W #$01CC : BMI .loopLeft
    REP #$20
    LDY.W OffScreenBeamHDMADataTableIndex : BEQ .return
    INY #2 : CPY.W #$01CC : BPL .return
    LDA.W #$00FF

  .loopEnd:
    STA.B [DP_Temp00],Y
    INY #2 : CPY.W #$01CC : BMI .loopEnd

  .return:
    PLP
    RTS


;;; $C8E8: Calculate x-ray / morph ball eye beam HDMA data table - origin is on screen - beam is aimed downwards - beam is aimed down ;;;
Calc_Xray_HDMADataTable_OnScreen_AimedDownwards_Down:
;; Parameters:
;;     Y: [Beam origin Y position] * 2
;;     $00: HDMA data table pointer. $7E:9100 for morph ball eye beam, $7E:9800 for x-ray
;;     $1E: Beam left edge gradient * 100h (dx/dy)
;;     $20: Beam right edge gradient * 100h (dx/dy)
;;     $22: Beam origin X position * 100h
;;     $24: Beam origin X position * 100h

; Current left line co-ordinates = ([$22], [Y] / 2)
; Current right line co-ordinates = ([$24], [Y] / 2)
    PHP
    REP #$30
    PHY

  .loopRightOnScreen:
    LDA.B DP_Temp24 : SEC : SBC.B DP_Temp20 : STA.B DP_Temp24 : BCC .loopRight
    LDA.B DP_Temp25 : STA.B [DP_Temp00],Y
    INY #2 : CPY.W #$01CC : BMI .loopRightOnScreen
    BRA .rightEdgeEnd

  .loopRight:
    LDA.W #$0000 : STA.B [DP_Temp00],Y
    INY #2 : CPY.W #$01CC : BMI .loopRight

  .rightEdgeEnd:
    PLY : INY

  .loopLeftOnScreen:
    LDA.B DP_Temp22 : CLC : ADC.B DP_Temp1E : STA.B DP_Temp22 : BCS +
    SEP #$20
    LDA.B DP_Temp23 : STA.B [DP_Temp00],Y
    REP #$20
    INY #2 : CPY.W #$01CC : BMI .loopLeftOnScreen
    BRA .return

+   SEP #$20

  .loopLeft:
    LDA.B #$FF : STA.B [DP_Temp00],Y
    INY #2 : CPY.W #$01CC : BMI .loopLeft

  .return:
    PLP
    RTS


;;; $C939: Calculate x-ray / morph ball eye beam HDMA data table - origin is on screen - beam is aimed downwards - beam is aimed down-left ;;;
Calc_Xray_HDMADataTable_OnScreen_AimedDownwards_DownLeft:
;; Parameters:
;;     Y: [Beam origin Y position] * 2
;;     $00: HDMA data table pointer. $7E:9100 for morph ball eye beam, $7E:9800 for x-ray
;;     $1E: Beam left edge gradient * 100h (dx/dy)
;;     $20: Beam right edge gradient * 100h (dx/dy)
;;     $22: Beam origin X position * 100h
;;     $24: Beam origin X position * 100h

; Current left line co-ordinates = ([$22], [Y] / 2)
; Current right line co-ordinates = ([$24], [Y] / 2)
    PHP
    REP #$30
    PHY

  .loopRightOnScreen:
    LDA.B DP_Temp24 : SEC : SBC.B DP_Temp20 : STA.B DP_Temp24 : BCC .loopRight
    LDA.B DP_Temp25 : STA.B [DP_Temp00],Y
    INY #2 : CPY.W #$01CC : BMI .loopRightOnScreen
    BRA .rightEdgeEnd

  .loopRight:
    LDA.W #$0000 : STA.B [DP_Temp00],Y
    INY #2 : CPY.W #$01CC : BMI .loopRight

  .rightEdgeEnd:
    PLY : INY

  .loopLeftOnScreen:
    LDA.B DP_Temp22 : SEC : SBC.B DP_Temp1E : STA.B DP_Temp22 : BCC +
    SEP #$20
    LDA.B DP_Temp23 : STA.B [DP_Temp00],Y
    REP #$20
    INY #2 : CPY.W #$01CC : BMI .loopLeftOnScreen
    BRA .return

+   SEP #$20
    PHY
    LDA.B #$00

  .loopLeft:
    STA.B [DP_Temp00],Y
    INY #2 : CPY.W #$01CC : BMI .loopLeft
    PLY : DEY
    LDA.B #$FF

  .loopEnd:
    STA.B [DP_Temp00],Y
    INY #2 : CPY.W #$01CC : BMI .loopEnd

  .return:
    PLP
    RTS


;;; $C998: Calculate x-ray / morph ball eye beam HDMA data table - origin is on screen - beam is horizontal line ;;;
Calc_Xray_HDMADataTable_OnScreen_HorizontalLine:
;; Parameters:
;;     $00: HDMA data table pointer. $7E:9100 for morph ball eye beam, $7E:9800 for x-ray
;;     $12: Beam angle
;;     $16: Beam origin X position * 100h
;;     $18: Beam origin Y position
    PHP
    REP #$30
    LDA.B DP_Temp18 : DEC : ASL : TAY
    LDA.B DP_Temp12 : CMP.W #$0040 : BNE .not40
    LDA.B DP_Temp17 : ORA.W #$FF00 : STA.B [DP_Temp00],Y
    BRA +

  .not40:
    LDA.B DP_Temp16 : AND.W #$FF00 : STA.B [DP_Temp00],Y

+   DEY #2
    LDA.W #$00FF

  .loopUpper:
    STA.B [DP_Temp00],Y
    DEY #2 : BPL .loopUpper
    LDA.B DP_Temp18 : ASL : TAY
    LDA.W #$00FF

  .loopLower:
    STA.B [DP_Temp00],Y
    INY #2 : CPY.W #$01CC : BMI .loopLower
    PLP
    RTS


;;; $C9D4: Absolute tangent table ;;;
AbsoluteTangentTable:
; |tan(t * pi / 80h)| * 100h
; Recall that SM angles are measured clockwise with 0 = up
; So this table provides absolute dx/dy gradients for angle t * pi / 80h
    dw $0000,$0006,$000C,$0012,$0019,$001F,$0025,$002C
    dw $0032,$0039,$0040,$0046,$004D,$0054,$005B,$0062
    dw $006A,$0071,$0079,$0080,$0088,$0091,$0099,$00A2
    dw $00AB,$00B4,$00BD,$00C7,$00D2,$00DC,$00E8,$00F3
    dw $0100,$010C,$011A,$0128,$0137,$0148,$0159,$016B
    dw $017F,$0194,$01AB,$01C3,$01DE,$01FC,$021D,$0241
    dw $026A,$0297,$02CB,$0306,$034B,$039D,$03FE,$0474
    dw $0506,$05C3,$06BD,$081B,$0A27,$0D8E,$145A,$28BB
    dw $3C00,$28BB,$145A,$0D8E,$0A27,$081B,$06BD,$05C3
    dw $0506,$0474,$03FE,$039D,$034B,$0306,$02CB,$0297
    dw $026A,$0241,$021D,$01FC,$01DE,$01C3,$01AB,$0194
    dw $017F,$016B,$0159,$0148,$0137,$0128,$011A,$010C
    dw $0100,$00F3,$00E8,$00DC,$00D2,$00C7,$00BD,$00B4
    dw $00AB,$00A2,$0099,$0091,$0088,$0080,$0079,$0071
    dw $006A,$0062,$005B,$0054,$004D,$0046,$0040,$0039
    dw $0032,$002C,$0025,$001F,$0019,$0012,$000C,$0006
    dw $0000


;;; $CAD6: X-ray handler ;;;
XrayHandler:
    PHP : PHB
    PHK : PLB
    REP #$30
    LDA.W TimeIsFrozenFlag : BNE .return
    LDA.B DP_Controller1Input : BIT.W DashBinding : BEQ .return
    JSL XraySetup
    BCC .return
    JSL Spawn_HDMAObject
    db $41,$28
    dw InstList_HDMAObject_Xray_0

  .return:
    PLB : PLP
    RTL


;;; $CAF9: X-ray setup stage 1 - freeze time and backup BG2 registers ;;;
XraySetup_1_FreezeTime_BackupBG2Registers:
    PHP
    SEP #$30
    LDA.B #$01 : STA.W TimeIsFrozenFlag
    LDA.B DP_BG2XScroll : STA.W HDMAObject_Var0,X
    LDA.B DP_BG2XScroll+1 : STA.W HDMAObject_Var0+1,X
    LDA.B DP_BG2YScroll : STA.W HDMAObject_Var1,X
    LDA.B DP_BG2YScroll+1 : STA.W HDMAObject_Var1+1,X
    LDA.B DP_BG2TilemapAddrSize : STA.W HDMAObject_Var2,X
    PLP
    RTL


;;; $CB1C: X-ray setup stage 2 - read BG1 tilemap - 2nd screen ;;;
XraySetup_2_ReadBG1Tilemap_2ndScreen:
; Queue transfer of 800h bytes from VRAM BG1 tilemap base + 400h to $7E:6800
    PHP
    REP #$30
    LDX.W VRAMReadStack
    LDA.B DP_BG1TilemapAddrSize : AND.W #$00FC : XBA : CLC : ADC.W #$0400 : STA.W VRAMRead.src,X
    LDA.W #$0081 : STA.W VRAMRead.control,X
    LDA.W #$0039 : STA.W VRAMRead.target,X
    LDA.W #XrayTilemaps_BackupBG1+$800 : STA.W VRAMRead.dest,X
    LDA.W #XrayTilemaps_BackupBG1>>16 : STA.W VRAMRead.dest+2,X
    LDA.W #$0800 : STA.W VRAMRead.size,X
    TXA : CLC : ADC.W #$0009 : STA.W VRAMReadStack
    PLP
    RTL


;;; $CB57: X-ray setup stage 3 - read BG1 tilemap - 1st screen ;;;
XraySetup_3_ReadBG1Tilemap_1stScreen:
; Queue transfer of 800h bytes from VRAM BG1 tilemap base to $7E:6000
    PHP
    REP #$30
    LDX.W VRAMReadStack
    LDA.B DP_BG1TilemapAddrSize : AND.W #$00FC : XBA : STA.W VRAMRead.src,X
    LDA.W #$0081 : STA.W VRAMRead.control,X
    LDA.W #$0039 : STA.W VRAMRead.target,X
    LDA.W #XrayTilemaps_BackupBG1 : STA.W VRAMRead.dest,X
    LDA.W #XrayTilemaps_BackupBG1>>16 : STA.W VRAMRead.dest+2,X
    LDA.W #$0800 : STA.W VRAMRead.size,X
    TXA : CLC : ADC.W #$0009 : STA.W VRAMReadStack
    PLP
    RTL


;;; $CB8E: X-ray setup stage 4 - build x-ray BG2 tilemap, read BG2 tilemap - 1st screen ;;;
XraySetup_4_BuildBG2Tilemap_ReadBG2Tilemap_1stScreen:
; Calls the $84 X-ray block graphics lookup
    PHP
    REP #$30
    LDA.W BG1YOffset : CLC : ADC.W Layer1YPosition
    AND.W #$00F0 : ASL #2 : STA.B DP_Temp18
    LDA.W BG1XOffset : CLC : ADC.W Layer1XPosition
    AND.W #$00F0 : LSR #3 : CLC : ADC.B DP_Temp18 : STA.B DP_Temp18
    LDA.W BG1XOffset : CLC : ADC.W Layer1XPosition
    AND.W #$0100 : ASL #2 : CLC : ADC.B DP_Temp18 : STA.B DP_Temp18
    STZ.B DP_Temp16
    LDA.W #$0010 : STA.B DP_Temp14

  .loopCopyBG1Row:
    LDA.W #$0010 : STA.B DP_Temp12
    LDA.B DP_Temp18 : AND.W #$07E0 : STA.B DP_Temp1A
    LDA.B DP_Temp18 : AND.W #$001F : STA.B DP_Temp1C
    STZ.B DP_Temp1E

  .loopCopyBG1Column:
    LDA.B DP_Temp1C : CLC : ADC.B DP_Temp1E : CMP.W #$0020 : BMI +
    LDA.B DP_Temp1A : CLC : ADC.W #$0400 : AND.W #$07E0 : STA.B DP_Temp1A
    LDA.W #$0000 : STA.B DP_Temp1C : STA.B DP_Temp1E

+   LDA.B DP_Temp1A : CLC : ADC.B DP_Temp1C
    ADC.B DP_Temp1E : ASL : TAX
    LDA.L XrayTilemaps_BackupBG1,X : PHA
    LDA.L XrayTilemaps_BackupBG1+2,X : PHA
    LDA.L XrayTilemaps_BackupBG1+$40,X : PHA
    LDA.L XrayTilemaps_BackupBG1+$42,X
    LDX.B DP_Temp16
    STA.L XrayTilemaps_BG2+$42,X
    PLA : STA.L XrayTilemaps_BG2+$40,X
    PLA : STA.L XrayTilemaps_BG2+2,X
    PLA : STA.L XrayTilemaps_BG2,X
    LDA.B DP_Temp16 : CLC : ADC.W #$0004 : STA.B DP_Temp16
    LDA.B DP_Temp1E : ADC.W #$0002 : STA.B DP_Temp1E
    DEC.B DP_Temp12 : BNE .loopCopyBG1Column
    JSR CopyLastBG1BlockOfRowToXrayBG2Tilemap
    LDA.B DP_Temp18 : AND.W #$0400 : STA.B DP_Temp20
    LDA.B DP_Temp18 : CLC : ADC.W #$0040
    AND.W #$03FF : CLC : ADC.B DP_Temp20 : STA.B DP_Temp18
    LDA.B DP_Temp16 : CLC : ADC.W #$0040 : STA.B DP_Temp16
    DEC.B DP_Temp14 : BEQ +
    JMP .loopCopyBG1Row

+   LDA.W Layer1YPosition : LSR #4 : XBA : ORA.W RoomWidthBlocks : STA.W $4202
    LDA.W Layer1XPosition : LSR #4 : CLC : ADC.W $4216 : STA.B DP_Temp22
    STZ.B DP_Temp16
    LDA.W #$0010 : STA.B DP_Temp14

  .loopRevealedRow:
    JSR LoadRightHalfOfRevealed2xNBlock
    LDA.W #$0010 : STA.B DP_Temp12
    LDA.B DP_Temp22 : STA.B DP_Temp24

  .loopRevealedColumn:
    JSR LoadRevealedBlock
    DEC.B DP_Temp12 : BNE .loopRevealedColumn
    LDA.B DP_Temp16 : PHA
    CLC : ADC.W #$07C0 : STA.B DP_Temp16
    JSR LoadRevealedBlock
    PLA : CLC : ADC.W #$0040 : STA.B DP_Temp16
    LDA.B DP_Temp22 : CLC : ADC.W RoomWidthBlocks : STA.B DP_Temp22
    DEC.B DP_Temp14 : BNE .loopRevealedRow
    JSL Load_Item_and_Room_Special_Xray_Blocks
    LDX.W VRAMReadStack
    LDA.B DP_BG2TilemapAddrSize : AND.W #$00FC : XBA : STA.W VRAMRead.src,X
    LDA.W #$0081 : STA.W VRAMRead.control,X
    LDA.W #$0039 : STA.W VRAMRead.target,X
    LDA.W #XrayTilemaps_BackupBG2 : STA.W VRAMRead.dest,X
    LDA.W #XrayTilemaps_BackupBG2>>16 : STA.W VRAMRead.dest+2,X
    LDA.W #$0800 : STA.W VRAMRead.size,X
    TXA : CLC : ADC.W #$0009 : STA.W VRAMReadStack
    PLP
    RTL


;;; $CCF1: Copy last BG1 block of row to x-ray BG2 tilemap ;;;
CopyLastBG1BlockOfRowToXrayBG2Tilemap:
;; Parameters:
;;     $16: X-ray BG2 tilemap index
;;     $1A: BG1 row origin block row index
;;     $1C: BG1 row origin block column index
;;     $1E: BG1 block X offset

; The last BG1 column is written to the first column of the second screen of BG2
    LDA.B DP_Temp1A : STA.B DP_Temp20
    LDA.B DP_Temp1C : CLC : ADC.B DP_Temp1E : CMP.W #$0020 : BMI +
    LDA.B DP_Temp20 : CLC : ADC.W #$0400 : AND.W #$07E0 : STA.B DP_Temp20
    LDA.W #$0000

+   CLC : ADC.B DP_Temp20 : ASL : TAX
    LDA.L XrayTilemaps_BackupBG1,X : PHA
    LDA.L XrayTilemaps_BackupBG1+2,X : PHA
    LDA.L XrayTilemaps_BackupBG1+$40,X : PHA
    LDA.L XrayTilemaps_BackupBG1+$42,X : PHA
    LDA.B DP_Temp16 : CLC : ADC.W #$07C0 : TAX
    PLA : STA.L XrayTilemaps_BG2+$42,X
    PLA : STA.L XrayTilemaps_BG2+$40,X
    PLA : STA.L XrayTilemaps_BG2+2,X
    PLA : STA.L XrayTilemaps_BG2,X
    RTS


;;; $CD42: Load right half of revealed 2xN block ;;;
LoadRightHalfOfRevealed2xNBlock:
;; Parameters:
;;     $16: X-ray BG2 tilemap index
;;     $22: Block index
    LDX.B DP_Temp22 : DEX
    JSR LoadRevealedBlockCommand
    CMP.W #RevealedBlockCommand_Copy2x1BlockToXrayBG2Tilemap : BEQ .2x1
    CMP.W #RevealedBlockCommand_Copy2x2BlockToXrayBG2Tilemap : BEQ .2x2
    RTS

  .2x2:
    PHY
    TYA : CLC : ADC.W #$0008 : TAY
    LDA.B (DP_Temp03),Y : ASL #3 : TAX
    LDA.L TileTable_topLeft,X : PHA
    LDA.L TileTable_topRight,X : PHA
    LDA.L TileTable_bottomLeft,X : PHA
    LDA.L TileTable_bottomRight,X
    LDX.B DP_Temp16
    STA.L XrayTilemaps_BG2+$C2,X
    PLA : STA.L XrayTilemaps_BG2+$C0,X
    PLA : STA.L XrayTilemaps_BG2+$82,X
    PLA : STA.L XrayTilemaps_BG2+$80,X
    PLY

  .2x1:
    TYA : CLC : ADC.W #$0004 : TAY
    LDA.B (DP_Temp03),Y : ASL #3 : TAX
    LDA.L TileTable_topLeft,X : PHA
    LDA.L TileTable_topRight,X : PHA
    LDA.L TileTable_bottomLeft,X : PHA
    LDA.L TileTable_bottomRight,X
    LDX.B DP_Temp16
    STA.L XrayTilemaps_BG2+$42,X
    PLA : STA.L XrayTilemaps_BG2+$40,X
    PLA : STA.L XrayTilemaps_BG2+2,X
    PLA : STA.L XrayTilemaps_BG2,X
    RTS


;;; $CDBE: Load revealed block ;;;
LoadRevealedBlock:
;; Parameters:
;;     $12: Tilemap column loop counter
;;     $16: X-ray BG2 tilemap index
;;     $24: Block index
    LDX.B DP_Temp24
    JSR LoadRevealedBlockCommand
    CMP.W #$FFFF : BEQ LoadRevealedBlock_Done
    JMP.W (DP_Temp00)


;;; $CDCB: Load revealed block - done ;;;
LoadRevealedBlock_Done:
;; Parameters:
;;     $16: X-ray BG2 tilemap index
;;     $24: Block index
    LDA.B DP_Temp16 : CLC : ADC.W #$0004 : STA.B DP_Temp16
    INC.B DP_Temp24
    RTS


;;; $CDD6: Load revealed block command ;;;
LoadRevealedBlockCommand:
;; Parameters:
;;     X: Block index
;; Returns:
;;     A/$00: Revealed block command or FFFFh if there is no block to reveal
;;     Y: 0 if [A] != FFFFh
;;     $03: Revealed block command pointer if [A] != FFFFh
;;     $26: Block BTS
;;     $28: Block type
    LDA.L BTS,X : AND.W #$00FF : STA.B DP_Temp26
    TXA : ASL : TAX
    LDA.L LevelData,X : AND.W #$F000 : STA.B DP_Temp28
    LDX.W #$0000

  .loopBlockType:
    LDA.W RevealedBlockTable_0_blockType,X : CMP.W #$FFFF : BEQ .return
    CMP.B DP_Temp28 : BEQ +
    INX #4
    BRA .loopBlockType

+   LDA.W RevealedBlockTable_0_pointers,X : STA.B DP_Temp00
    LDY.W #$0000

  .loopBTS:
    LDA.B (DP_Temp00),Y : CMP.W #$FFFF : BEQ .return
    CMP.W #$FF00 : BEQ +
    CMP.B DP_Temp26 : BEQ +
    INY #4
    BRA .loopBTS

+   INY #2
    LDA.B (DP_Temp00),Y : STA.B DP_Temp03
    LDY.W #$0000
    LDA.B (DP_Temp03),Y : STA.B DP_Temp00

  .return:
    RTS


;;; $CE2C: Calculate block co-ordinates ;;;
CalculateBlockCoordinates:
;; Parameters:
;;     $24: Block index
;; Returns:
;;     $2A: X block co-ordinate
;;     $2C: Y block co-ordinate

; $2C = [$24] / [room width in blocks]
; $2A = [$24] % [room width in blocks]
    SEP #$20
    LDA.B DP_Temp24 : STA.W $4204
    LDA.B DP_Temp25 : STA.W $4205
    LDA.W RoomWidthBlocks : STA.W $4206
    REP #$20
    NOP #6
    LDA.W $4214 : STA.B DP_Temp2C
    LDA.W $4216 : STA.B DP_Temp2A
    RTS


;;; $CE51: Get block type and BTS ;;;
GetBlockTypeAndBTS:
;; Parameters:
;;     $2A: X block co-ordinate
;;     $2C: Y block co-ordinate
;; Returns:
;;     A/$30: Block type
;;     $2E: Block BTS
    LDA.B DP_Temp2C : XBA : ORA.W RoomWidthBlocks : STA.W $4202
    NOP #2
    LDA.B DP_Temp2A : CLC : ADC.W $4216 : TAX
    LDA.L BTS,X : AND.W #$00FF : STA.B DP_Temp2E
    TXA : ASL : TAX
    LDA.L LevelData,X : AND.W #$F000 : STA.B DP_Temp30
    RTS


;;; $CE79: Revealed block command - vertical extension ;;;
RevealedBlockCommand_VerticalExtension:
;; Parameters:
;;     $03: Revealed block command pointer
;;     $16: X-ray BG2 tilemap index
;;     $24: Block index
;;     $26: Block BTS
;;     $28: Block type
    JSR CalculateBlockCoordinates
    LDA.B DP_Temp28 : STA.B DP_Temp30
    LDA.B DP_Temp26 : BEQ Copy1x1BlockToXrayBG2TilemapIfScrollPLMTrigger
    BIT.W #$0080 : BEQ +
    ORA.W #$FF00

+   STA.B DP_Temp2E
; fallthrough to RevealedBlockExtensionLoop_Vertical


;;; $CE8E: Revealed block extension loop - vertical ;;;
RevealedBlockExtensionLoop_Vertical:
;; Parameters:
;;     $16: X-ray BG2 tilemap index
;;     $24: Block index
;;     $2A: X block co-ordinate
;;     $2C: Y block co-ordinate
;;     $2E: Block BTS (sign extended)
    LDA.B DP_Temp2C : CLC : ADC.B DP_Temp2E : BPL +
    LDA.W #$00FF
    JSR CopyBlockToXrayBG2Tilemap
    JMP LoadRevealedBlock_Done

+   STA.B DP_Temp2C
    JSR GetBlockTypeAndBTS
    CMP.W #$D000 : BEQ RevealedBlockExtensionLoop_Vertical
    CMP.W #$5000 : BNE Copy1x1BlockToXrayBG2TilemapIfScrollPLMTrigger
    LDA.B DP_Temp2E : BIT.W #$0080 : BEQ RevealedBlockExtensionLoop_Vertical
    EOR.W #$FF00 : STA.B DP_Temp2E
    BRA RevealedBlockExtensionLoop_Horizontal


;;; $CEBB: Revealed block command - horizontal extension ;;;
RevealedBlockCommand_HorizontalExtension:
;; Parameters:
;;     $03: Revealed block command pointer
;;     $16: X-ray BG2 tilemap index
;;     $24: Block index
;;     $26: Block BTS
;;     $28: Block type
    JSR CalculateBlockCoordinates
    LDA.B DP_Temp28 : STA.B DP_Temp30
    LDA.B DP_Temp26 : BEQ Copy1x1BlockToXrayBG2TilemapIfScrollPLMTrigger
    BIT.W #$0080 : BEQ +
    ORA.W #$FF00

+   STA.B DP_Temp2E
; fallthrough to RevealedBlockExtensionLoop_Horizontal


;;; $CED0: Revealed block extension loop - horizontal ;;;
RevealedBlockExtensionLoop_Horizontal:
;; Parameters:
;;     $16: X-ray BG2 tilemap index
;;     $16: X-ray BG2 tilemap index
;;     $24: Block index
;;     $24: Block index
;;     $2A: X block co-ordinate
;;     $2C: Y block co-ordinate
;;     $2E: Block BTS (sign extended)
    LDA.B DP_Temp2A : CLC : ADC.B DP_Temp2E : BPL +
    LDA.W #$00FF
    JSR CopyBlockToXrayBG2Tilemap
    JMP LoadRevealedBlock_Done

+   STA.B DP_Temp2A
    JSR GetBlockTypeAndBTS
    CMP.W #$D000 : BEQ RevealedBlockExtensionLoop_Vertical
    CMP.W #$5000 : BNE Copy1x1BlockToXrayBG2TilemapIfScrollPLMTrigger
    LDA.B DP_Temp2E : BIT.W #$0080 : BEQ RevealedBlockExtensionLoop_Horizontal
    EOR.W #$FF00 : STA.B DP_Temp2E
    BRA RevealedBlockExtensionLoop_Horizontal


;;; $CEFD: Copy 1x1 block to x-ray BG2 tilemap if scroll PLM trigger ;;;
Copy1x1BlockToXrayBG2TilemapIfScrollPLMTrigger:
;; Parameters:
;;     $16: X-ray BG2 tilemap index
;;     $24: Block index
;;     $2E: Block BTS
;;     $30: Block type
    LDA.W RevealedBlockTable_1_blockType : CMP.B DP_Temp30 : BNE .gotoDone
    LDA.W RevealedBlockTable_1_pointers : STA.B DP_Temp00
    LDY.W #$0000

  .loop:
    LDA.B (DP_Temp00),Y : CMP.W #$FFFF : BEQ .gotoDone
    CMP.W #$FF00 : BEQ +
    CMP.B DP_Temp2E : BEQ +
    INY #4
    BRA .loop

+   INY #2
    LDA.B (DP_Temp00),Y : INC #2 : STA.B DP_Temp03
    LDY.W #$0000
    JSR CopyRevealedBlockCommandArgumentToXrayBG2Tilemap
    JMP LoadRevealedBlock_Done

  .gotoDone:
    JMP LoadRevealedBlock_Done


;;; $CF36: Revealed block command - copy 1x1 block to x-ray BG2 tilemap ;;;
RevealedBlockCommand_Copy1x1BlockToXrayBG2Tilemap:
;; Parameters:
;;     Y: 0
;;     $03: Revealed block command pointer
;;     $16: X-ray BG2 tilemap index
;;     $24: Block index
    INY #2
    JSR CopyRevealedBlockCommandArgumentToXrayBG2Tilemap
    JMP LoadRevealedBlock_Done


;;; $CF3E: Revealed block command - copy 1x1 block to x-ray BG2 tilemap if in Brinstar ;;;
RevealedBlockCommand_Copy1x1BlockToXrayBG2TilemapIfBrinstar:
;; Parameters:
;;     Y: 0
;;     $03: Revealed block command pointer
;;     $16: X-ray BG2 tilemap index
;;     $24: Block index
    INY #2
    LDA.W AreaIndex : CMP.W #$0001 : BNE .gotoDone
    JSR CopyRevealedBlockCommandArgumentToXrayBG2Tilemap

  .gotoDone:
    JMP LoadRevealedBlock_Done


;;; $CF4E: Revealed block command - copy 2x1 block to x-ray BG2 tilemap ;;;
RevealedBlockCommand_Copy2x1BlockToXrayBG2Tilemap:
;; Parameters:
;;     Y: 0
;;     $03: Revealed block command pointer
;;     $12: Tilemap column loop counter
;;     $16: X-ray BG2 tilemap index
;;     $24: Block index
    INY #2
    JSR CopyRevealedBlockCommandArgumentToXrayBG2Tilemap
    LDA.B DP_Temp12 : CMP.W #$0001 : BEQ .gotoDone
    INY #2
    JSR CopyRevealedBlockCommandArgumentToXrayBG2Tilemap_1BlockRight

  .gotoDone:
    JMP LoadRevealedBlock_Done


;;; $CF62: Revealed block command - copy 1x2 block to x-ray BG2 tilemap ;;;
RevealedBlockCommand_Copy1x2BlockToXrayBG2Tilemap:
;; Parameters:
;;     Y: 0
;;     $03: Revealed block command pointer
;;     $16: X-ray BG2 tilemap index
;;     $24: Block index
    INY #2
    JSR CopyRevealedBlockCommandArgumentToXrayBG2Tilemap
    INY #2
    JSR CopyRevealedBlockCommandArgumentToXrayBG2Tilemap_1BlockDown
    JMP LoadRevealedBlock_Done


;;; $CF6F: Revealed block command - copy 2x2 block to x-ray BG2 tilemap ;;;
RevealedBlockCommand_Copy2x2BlockToXrayBG2Tilemap:
;; Parameters:
;;     Y: 0
;;     $03: Revealed block command pointer
;;     $12: Tilemap column loop counter
;;     $16: X-ray BG2 tilemap index
;;     $24: Block index
    INY #2
    JSR CopyRevealedBlockCommandArgumentToXrayBG2Tilemap
    INY #2
    LDA.B DP_Temp12 : CMP.W #$0001 : BEQ +
    JSR CopyRevealedBlockCommandArgumentToXrayBG2Tilemap_1BlockRight

+   INY #2
    JSR CopyRevealedBlockCommandArgumentToXrayBG2Tilemap_1BlockDown
    INY #2
    LDA.B DP_Temp12 : CMP.W #$0001 : BEQ .gotoDone
    LDA.B (DP_Temp03),Y : ASL #3 : TAX
    LDA.L TileTable_topLeft,X : PHA
    LDA.L TileTable_topRight,X : PHA
    LDA.L TileTable_bottomLeft,X : PHA
    LDA.L TileTable_bottomRight,X
    LDX.B DP_Temp16
    STA.L XrayTilemaps_BG2+$C6,X
    PLA : STA.L XrayTilemaps_BG2+$C4,X
    PLA : STA.L XrayTilemaps_BG2+$86,X
    PLA : STA.L XrayTilemaps_BG2+$84,X

  .gotoDone:
    JMP LoadRevealedBlock_Done


;;; $CFBF: Copy revealed block command argument to x-ray BG2 tilemap ;;;
CopyRevealedBlockCommandArgumentToXrayBG2Tilemap:
;; Parameters:
;;     Y: Revealed block command argument offset
;;     $03: Revealed block command pointer
;;     $16: X-ray BG2 tilemap index
    LDA.B (DP_Temp03),Y
; fallthrough to CopyBlockToXrayBG2Tilemap


;;; $CFC1: Copy block to x-ray BG2 tilemap ;;;
CopyBlockToXrayBG2Tilemap:
;; Parameters:
;;     A: Tile table index
;;     $16: X-ray BG2 tilemap index
    ASL #3 : TAX
    LDA.L TileTable_topLeft,X : PHA
    LDA.L TileTable_topRight,X : PHA
    LDA.L TileTable_bottomLeft,X : PHA
    LDA.L TileTable_bottomRight,X
    LDX.B DP_Temp16
    STA.L XrayTilemaps_BG2+$42,X
    PLA : STA.L XrayTilemaps_BG2+$40,X
    PLA : STA.L XrayTilemaps_BG2+2,X
    PLA : STA.L XrayTilemaps_BG2,X
    RTS


;;; $CFEE: Copy revealed block command argument to x-ray BG2 tilemap one block right ;;;
CopyRevealedBlockCommandArgumentToXrayBG2Tilemap_1BlockRight:
;; Parameters:
;;     Y: Revealed block command argument offset
;;     $03: Revealed block command pointer
;;     $16: X-ray BG2 tilemap index
    LDA.B (DP_Temp03),Y : ASL #3 : TAX
    LDA.L TileTable_topLeft,X : PHA
    LDA.L TileTable_topRight,X : PHA
    LDA.L TileTable_bottomLeft,X : PHA
    LDA.L TileTable_bottomRight,X
    LDX.B DP_Temp16
    STA.L XrayTilemaps_BG2+$46,X
    PLA : STA.L XrayTilemaps_BG2+$44,X
    PLA : STA.L XrayTilemaps_BG2+6,X
    PLA : STA.L XrayTilemaps_BG2+4,X
    RTS


;;; $D01D: Copy revealed block command argument to x-ray BG2 tilemap one block down ;;;
CopyRevealedBlockCommandArgumentToXrayBG2Tilemap_1BlockDown:
;; Parameters:
;;     Y: Revealed block command argument offset
;;     $03: Revealed block command pointer
;;     $16: X-ray BG2 tilemap index
    LDA.B (DP_Temp03),Y : ASL #3 : TAX
    LDA.L TileTable_topLeft,X : PHA
    LDA.L TileTable_topRight,X : PHA
    LDA.L TileTable_bottomLeft,X : PHA
    LDA.L TileTable_bottomRight,X
    LDX.B DP_Temp16
    STA.L XrayTilemaps_BG2+$C2,X
    PLA : STA.L XrayTilemaps_BG2+$C0,X
    PLA : STA.L XrayTilemaps_BG2+$82,X
    PLA : STA.L XrayTilemaps_BG2+$80,X
    RTS


;;; $D04C: Load block to x-ray BG2 tilemap ;;;
LoadBlockToXrayBG2Tilemap:
;; Parameters:
;;     A: Level data block (block type ignored)
;;     X: X block
;;     Y: Y block

; Called by $84:831A (load item x-ray blocks)
; Doesn't support X flipped blocks
    PHP : PHX : PHY
    REP #$30
    STA.B DP_Temp28
    LDA.W Layer1XPosition : LSR #4 : STA.B DP_Temp18
    TXA : SEC : SBC.B DP_Temp18 : BMI .return
    STA.B DP_Temp18
    SBC.W #$0010 : BPL .return
    LDA.W Layer1YPosition : LSR #4 : STA.B DP_Temp1A
    TYA : SEC : SBC.B DP_Temp1A : BMI .return
    STA.B DP_Temp1A
    SBC.W #$0010 : BPL .return
    LDA.B DP_Temp1A : ASL #5 : CLC : ADC.B DP_Temp18 : ASL #2 : STA.B DP_Temp16
    LDA.B DP_Temp28 : BIT.W #$0800 : BNE .YFlipped
    AND.W #$03FF
    JSR CopyBlockToXrayBG2Tilemap
    BRA .return

  .YFlipped:
    AND.W #$03FF
    JSR CopyYFlippedBlockToXrayBG2Tilemap

  .return:
    PLY : PLX : PLP
    RTL


;;; $D0A6: Copy Y flipped block to x-ray BG2 tilemap ;;;
CopyYFlippedBlockToXrayBG2Tilemap:
;; Parameters:
;;     A: Tile table index
;;     $16: X-ray BG2 tilemap index
    ASL #3 : TAX
    LDA.L TileTable_topLeft,X : PHA
    LDA.L TileTable_topRight,X : PHA
    LDA.L TileTable_bottomLeft,X : PHA
    LDA.L TileTable_bottomRight,X
    LDX.B DP_Temp16
    STA.L XrayTilemaps_BG2+2,X
    PLA : STA.L XrayTilemaps_BG2,X
    PLA : STA.L XrayTilemaps_BG2+$42,X
    PLA : STA.L XrayTilemaps_BG2+$40,X
    RTS


;;; $D0D3: X-ray setup stage 5 - read BG2 tilemap - 2nd screen ;;;
XraySetup_5_ReadBG2Tilemap_2ndScreen:
    PHP
    REP #$30
    JSL CheckIfXrayShouldShowAnyBlocks
    BEQ .noReveal
    LDA.W EarthquakeTimer : BEQ +
    LDA.W BG1XOffset : CLC : ADC.W Layer1XPosition : STA.B DP_BG1XScroll
    LDA.W BG1YOffset : CLC : ADC.W Layer1YPosition : STA.B DP_BG1YScroll

+   LDA.B DP_BG1XScroll : AND.W #$000F : STA.B DP_BG2XScroll
    LDA.B DP_BG1YScroll : AND.W #$000F : STA.B DP_BG2YScroll
    SEP #$20
    LDA.B #$49 : STA.B DP_BG2TilemapAddrSize
    REP #$20

  .noReveal:
    LDX.W VRAMReadStack
    LDA.B DP_BG2TilemapAddrSize : AND.W #$00FC : XBA : CLC : ADC.W #$0400 : STA.W VRAMRead.src,X
    LDA.W #$0081 : STA.W VRAMRead.control,X
    LDA.W #$0039 : STA.W VRAMRead.target,X
    LDA.W #XrayTilemaps_BackupBG2+$800 : STA.W VRAMRead.dest,X
    LDA.W #XrayTilemaps_BackupBG2>>16 : STA.W VRAMRead.dest+2,X
    LDA.W #$0800 : STA.W VRAMRead.size,X
    TXA : CLC : ADC.W #$0009 : STA.W VRAMReadStack
    PLP
    RTL


;;; $D141: REP #$30 ;;;
REP30_91D141:
; A stray REP, seemingly split away from the below routine
    REP #$30
; fallthrough to CheckIfXrayShouldShowAnyBlocks


;;; $D143: Check if x-ray should show any blocks ;;;
CheckIfXrayShouldShowAnyBlocks:
    LDA.W RoomPointer : CMP.W #RoomHeader_Statues : BEQ .return
    CMP.W #RoomHeader_GlassTunnel : BEQ .return
    LDA.W FX_Type : CMP.W #$0024 : BEQ .return
    LDA.W BossID : CMP.W #$0003 : BEQ .return
    CMP.W #$0006 : BEQ .return
    CMP.W #$0007 : BEQ .return
    CMP.W #$0008 : BEQ .return
    CMP.W #$000A

  .return:
    RTL


;;; $D173: X-ray setup stage 6 - transfer x-ray tilemap - 1st screen ;;;
XraySetup_6_TransferXrayTilemap_1stScreen:
    PHP
    REP #$30
    JSL CheckIfXrayShouldShowAnyBlocks
    BEQ .return
    LDX.W VRAMWriteStack
    LDA.W #$0800 : STA.B VRAMWrite.size,X
    LDA.W #XrayTilemaps_BG2 : STA.B VRAMWrite.src,X
    LDA.W #XrayTilemaps_BG2>>16 : STA.B VRAMWrite.src+2,X
    LDA.B DP_BG2TilemapAddrSize : AND.W #$00FC : XBA : STA.B VRAMWrite.dest,X
    TXA : CLC : ADC.W #$0007 : STA.W VRAMWriteStack

  .return:
    PLP
    RTL


;;; $D1A0: X-ray setup stage 7 - initialise x-ray beam, transfer x-ray tilemap - 2nd screen ;;;
XraySetup_7_InitializeXray_TransferXrayTilemap_2ndScreen:
    PHP
    REP #$30
    JSL CheckIfXrayShouldShowAnyBlocks
    BEQ .dontShowBlocks
    LDX.W VRAMWriteStack
    LDA.W #$0800 : STA.B VRAMWrite.size,X
    LDA.W #XrayTilemaps_BG2+$800 : STA.B VRAMWrite.src,X
    LDA.W #XrayTilemaps_BG2>>16 : STA.B VRAMWrite.src+2,X
    LDA.B DP_BG2TilemapAddrSize : AND.W #$00FC : XBA
    CLC : ADC.W #$0400 : STA.B VRAMWrite.dest,X
    TXA : CLC : ADC.W #$0007 : STA.W VRAMWriteStack

  .dontShowBlocks:
    LDA.W #$00E4 : STA.W Xray_IndirectHDMATable
    LDA.W #XrayWindow2HDMADataTable : STA.W Xray_IndirectHDMATable+1
    LDA.W #$00E4 : STA.W Xray_IndirectHDMATable+3
    LDA.W #XrayWindow2HDMADataTable+$C8 : STA.W Xray_IndirectHDMATable+4
    LDA.W #$0098 : STA.W Xray_IndirectHDMATable+6
    LDA.W #XrayWindow2HDMADataTable+$190 : STA.W Xray_IndirectHDMATable+7
    STZ.W Xray_IndirectHDMATable+9 : STZ.W Xray_State
    STZ.W Xray_AngularWidthDelta : STZ.W Xray_AngularSubWidthDelta
    LDA.W #$0000 : STA.W Xray_AngularWidth
    STZ.W Xray_AngularSubWidth
    LDA.W PoseXDirection : AND.W #$00FF : CMP.W #$0004 : BEQ .facingLeft
    LDA.W #$0040 : STA.W Xray_Angle
    BRA .return

  .facingLeft:
    LDA.W #$00C0 : STA.W Xray_Angle

  .return:
    PLP
    RTL


;;; $D223: HDMA object instruction list - x-ray ;;;
InstList_HDMAObject_Xray_0:
    dw Instruction_HDMAObject_HDMATableBank : db $00
    dw Instruction_HDMAObject_IndirectHDMATableBank : db $7E
    dw Instruction_HDMAObject_PreInstructionInY
    dl PreInstruction_HDMAObject_XraySetup
    dw Instruction_HDMAObject_CallExternalFunctionInY
    dl XraySetup_1_FreezeTime_BackupBG2Registers
    dw $0001,Xray_IndirectHDMATable
    dw Instruction_HDMAObject_CallExternalFunctionInY
    dl XraySetup_2_ReadBG1Tilemap_2ndScreen
    dw $0001,Xray_IndirectHDMATable
    dw Instruction_HDMAObject_CallExternalFunctionInY
    dl XraySetup_3_ReadBG1Tilemap_1stScreen
    dw $0001,Xray_IndirectHDMATable
    dw Instruction_HDMAObject_CallExternalFunctionInY
    dl XraySetup_4_BuildBG2Tilemap_ReadBG2Tilemap_1stScreen
    dw $0001,Xray_IndirectHDMATable
    dw Instruction_HDMAObject_CallExternalFunctionInY
    dl XraySetup_5_ReadBG2Tilemap_2ndScreen
    dw $0001,Xray_IndirectHDMATable
    dw Instruction_HDMAObject_CallExternalFunctionInY
    dl XraySetup_6_TransferXrayTilemap_1stScreen
    dw $0001,Xray_IndirectHDMATable
    dw Instruction_HDMAObject_CallExternalFunctionInY
    dl XraySetup_7_InitializeXray_TransferXrayTilemap_2ndScreen
    dw $0001,Xray_IndirectHDMATable
    dw Instruction_HDMAObject_CallExternalFunctionInY
    dl XraySetup_8_BackdropColor
    dw Instruction_HDMAObject_PreInstructionInY
    dl PreInstruction_Xray_Main

InstList_HDMAObject_Xray_1:
    dw $0001,Xray_IndirectHDMATable
    dw Instruction_HDMAObject_GotoY
    dw InstList_HDMAObject_Xray_1


;;; $D27F: HDMA object pre-instruction - x-ray setup ;;;
PreInstruction_HDMAObject_XraySetup:
    PHP
    REP #$30
    PHX
    LDX.W #$1000
    LDA.W FX_Type : CMP.W #$0024 : BEQ .fireflea
    LDX.W #$2000
    JSL CheckIfXrayShouldShowAnyBlocks
    BEQ .setBackdropColorEnd
    LDX.W #$4000

  .setBackdropColor:
    LDA.W #$0027 : STA.B DP_ColorMathSubScreenBackdropColor0
    LDA.W #$0047 : STA.B DP_ColorMathSubScreenBackdropColor1
    LDA.W #$0087 : STA.B DP_ColorMathSubScreenBackdropColor2

  .setBackdropColorEnd:
    TXA : TSB.W LayerBlending_Config
    PLX : PLP
    RTL

  .fireflea:
    LDA.B DP_ColorMathSubScreenBackdropColor0 : AND.W #$001F : CMP.W #$0007 : BPL .setBackdropColorEnd
    BRA .setBackdropColor


;;; $D2BC: X-ray setup stage 8 - backdrop colour = (3, 3, 3) ;;;
XraySetup_8_BackdropColor:
    PHP : PHX : PHY
    SEP #$20
    LDA.B #$63 : STA.L Palettes_MainBackdrop
    LDA.B #$0C : STA.L Palettes_MainBackdrop+1
    PLY : PLX : PLP
    RTL


;;; $D2D1: Unused. RTS ;;;
RTS_91D2D1:
    PHP
    REP #$30
    PLP
    RTS


;;; $D2D6: Revealed block table pointers ;;;
RevealedBlockTable_0:
  .blockType:
    dw $0000
  .pointers:
    dw       RevealedBlockTable_Air_0
RevealedBlockTable_1:
  .blockType:
    dw $3000
  .pointers:
    dw       RevealedBlockTable_SpecialAir_0
    dw $5000,RevealedBlockTable_HorizontalExtension_0
    dw $A000,RevealedBlockTable_SpikeBlock_0
    dw $B000,RevealedBlockTable_SpecialBlock
    dw $C000,RevealedBlockTable_ShootableBlock
    dw $D000,RevealedBlockTable_VerticalExtension_0
    dw $E000,RevealedBlockTable_GrappleBlock
    dw $F000,RevealedBlockTable_BombableBlock
    dw $FFFF


;;; $D2FC: Revealed block table - air ;;;
RevealedBlockTable_Air_0:
    dw $FF00,RevealedBlockTable_Air_1
    dw $FFFF

RevealedBlockTable_Air_1:
    dw RevealedBlockCommand_Copy1x1BlockToXrayBG2Tilemap,$00FF


;;; $D306: Revealed block table - special air ;;;
RevealedBlockTable_SpecialAir_0:
    dw $0046,RevealedBlockTable_SpecialAir_1
    dw $FFFF

RevealedBlockTable_SpecialAir_1:
    dw RevealedBlockCommand_Copy1x1BlockToXrayBG2Tilemap,$00FF


;;; $D310: Revealed block table - horizontal extension ;;;
RevealedBlockTable_HorizontalExtension_0:
    dw $FF00,RevealedBlockTable_HorizontalExtension_1
    dw $FFFF

RevealedBlockTable_HorizontalExtension_1:
    dw RevealedBlockCommand_HorizontalExtension


;;; $D318: Revealed block table - spike block ;;;
RevealedBlockTable_SpikeBlock_0:
    dw $000E,RevealedBlockTable_SpikeBlock_1
    dw $FFFF

RevealedBlockTable_SpikeBlock_1:
    dw RevealedBlockCommand_Copy1x1BlockToXrayBG2Tilemap,$005F


;;; $D322: Revealed block table - special block ;;;
RevealedBlockTable_SpecialBlock:
    dw $0000,RevealedBlockTable_SpecialBlock_0                           ; 1x1 respawning crumble block
    dw $0001,RevealedBlockTable_SpecialBlock_1                           ; 2x1 respawning crumble block
    dw $0002,RevealedBlockTable_SpecialBlock_2                           ; 1x2 respawning crumble block
    dw $0003,RevealedBlockTable_SpecialBlock_3                           ; 2x2 respawning crumble block
    dw $0004,RevealedBlockTable_SpecialBlock_4                           ; 1x1 crumble block
    dw $0005,RevealedBlockTable_SpecialBlock_5                           ; 2x1 crumble block
    dw $0006,RevealedBlockTable_SpecialBlock_6                           ; 1x2 crumble block
    dw $0007,RevealedBlockTable_SpecialBlock_7                           ; 2x2 crumble block
    dw $0008,RevealedBlockTable_SpecialBlock_8                           ; Unused air
    dw $0009,RevealedBlockTable_SpecialBlock_9                           ; Unused air
    dw $000A,RevealedBlockTable_SpecialBlock_A                           ; Unused air
    dw $000B,RevealedBlockTable_SpecialBlock_B                           ; Unused air
    dw $000C,RevealedBlockTable_SpecialBlock_C                           ; Unused air
    dw $000D,RevealedBlockTable_SpecialBlock_D                           ; Unused air
    dw $000E,RevealedBlockTable_SpecialBlock_E                           ; Respawning speed block
    dw $000F,RevealedBlockTable_SpecialBlock_F                           ; Speed block
    dw $0082,RevealedBlockTable_SpecialBlock_Brinstar                    ; Brinstar only. Respawning speed block, slower crumble animation
    dw $0083,RevealedBlockTable_SpecialBlock_Brinstar                    ; Brinstar only. Speed block, slower crumble animation
    dw $0084,RevealedBlockTable_SpecialBlock_Brinstar                    ; Brinstar only. Respawning speed block (used by dachora pit)
    dw $0085,RevealedBlockTable_SpecialBlock_Brinstar                    ; Brinstar only. Speed block
    dw $FFFF

RevealedBlockTable_SpecialBlock_0:
    dw RevealedBlockCommand_Copy1x1BlockToXrayBG2Tilemap,$00BC

RevealedBlockTable_SpecialBlock_1:
    dw RevealedBlockCommand_Copy2x1BlockToXrayBG2Tilemap,$00BC,$00BC

RevealedBlockTable_SpecialBlock_2:
    dw RevealedBlockCommand_Copy1x2BlockToXrayBG2Tilemap,$00BC,$00BC

RevealedBlockTable_SpecialBlock_3:
    dw RevealedBlockCommand_Copy2x2BlockToXrayBG2Tilemap
    dw $00BC,$00BC,$00BC,$00BC

RevealedBlockTable_SpecialBlock_4:
    dw RevealedBlockCommand_Copy1x1BlockToXrayBG2Tilemap,$00BC

RevealedBlockTable_SpecialBlock_5:
    dw RevealedBlockCommand_Copy2x1BlockToXrayBG2Tilemap,$00BC,$00BC

RevealedBlockTable_SpecialBlock_6:
    dw RevealedBlockCommand_Copy1x2BlockToXrayBG2Tilemap,$00BC,$00BC

RevealedBlockTable_SpecialBlock_7:
    dw RevealedBlockCommand_Copy2x2BlockToXrayBG2Tilemap
    dw $00BC,$00BC,$00BC,$00BC

RevealedBlockTable_SpecialBlock_8:
    dw RevealedBlockCommand_Copy1x1BlockToXrayBG2Tilemap,$00BC

RevealedBlockTable_SpecialBlock_9:
    dw RevealedBlockCommand_Copy1x1BlockToXrayBG2Tilemap,$00BC

RevealedBlockTable_SpecialBlock_A:
    dw RevealedBlockCommand_Copy1x1BlockToXrayBG2Tilemap,$00BC

RevealedBlockTable_SpecialBlock_B:
    dw RevealedBlockCommand_Copy1x1BlockToXrayBG2Tilemap,$00BC

RevealedBlockTable_SpecialBlock_C:
    dw RevealedBlockCommand_Copy1x1BlockToXrayBG2Tilemap,$00BC

RevealedBlockTable_SpecialBlock_D:
    dw RevealedBlockCommand_Copy1x1BlockToXrayBG2Tilemap,$00BC

RevealedBlockTable_SpecialBlock_E:
    dw RevealedBlockCommand_Copy1x1BlockToXrayBG2Tilemap,$00B6

RevealedBlockTable_SpecialBlock_F:
    dw RevealedBlockCommand_Copy1x1BlockToXrayBG2Tilemap,$00B6

RevealedBlockTable_SpecialBlock_Brinstar:
    dw RevealedBlockCommand_Copy1x1BlockToXrayBG2TilemapIfBrinstar,$00B6


;;; $D3CC: Revealed block table - shootable block ;;;
RevealedBlockTable_ShootableBlock:
    dw $0000,RevealedBlockTable_ShootableBlock_0
    dw $0001,RevealedBlockTable_ShootableBlock_1
    dw $0002,RevealedBlockTable_ShootableBlock_2
    dw $0003,RevealedBlockTable_ShootableBlock_3
    dw $0004,RevealedBlockTable_ShootableBlock_4
    dw $0005,RevealedBlockTable_ShootableBlock_5
    dw $0006,RevealedBlockTable_ShootableBlock_6
    dw $0007,RevealedBlockTable_ShootableBlock_7
    dw $0008,RevealedBlockTable_ShootableBlock_8
    dw $0009,RevealedBlockTable_ShootableBlock_9
    dw $000A,RevealedBlockTable_ShootableBlock_A
    dw $000B,RevealedBlockTable_ShootableBlock_B
    dw $000C,RevealedBlockTable_ShootableBlock_C
    dw $000D,RevealedBlockTable_ShootableBlock_D
    dw $000E,RevealedBlockTable_ShootableBlock_E
    dw $000F,RevealedBlockTable_ShootableBlock_F
    dw $FFFF

RevealedBlockTable_ShootableBlock_0:
    dw RevealedBlockCommand_Copy1x1BlockToXrayBG2Tilemap,$0052

RevealedBlockTable_ShootableBlock_1:
    dw RevealedBlockCommand_Copy2x1BlockToXrayBG2Tilemap,$0096,$0097

RevealedBlockTable_ShootableBlock_2:
    dw RevealedBlockCommand_Copy1x2BlockToXrayBG2Tilemap,$0098,$00B8

RevealedBlockTable_ShootableBlock_3:
    dw RevealedBlockCommand_Copy2x2BlockToXrayBG2Tilemap
    dw $0099,$009A,$00B9,$00BA

RevealedBlockTable_ShootableBlock_4:
    dw RevealedBlockCommand_Copy1x1BlockToXrayBG2Tilemap,$0052

RevealedBlockTable_ShootableBlock_5:
    dw RevealedBlockCommand_Copy2x1BlockToXrayBG2Tilemap,$0096,$0097

RevealedBlockTable_ShootableBlock_6:
    dw RevealedBlockCommand_Copy1x2BlockToXrayBG2Tilemap,$0098,$00B8

RevealedBlockTable_ShootableBlock_7:
    dw RevealedBlockCommand_Copy2x2BlockToXrayBG2Tilemap
    dw $0099,$009A,$00B9,$00BA

RevealedBlockTable_ShootableBlock_8:
    dw RevealedBlockCommand_Copy1x1BlockToXrayBG2Tilemap,$0057

RevealedBlockTable_ShootableBlock_9:
    dw RevealedBlockCommand_Copy1x1BlockToXrayBG2Tilemap,$0057

RevealedBlockTable_ShootableBlock_A:
    dw RevealedBlockCommand_Copy1x1BlockToXrayBG2Tilemap,$009F

RevealedBlockTable_ShootableBlock_B:
    dw RevealedBlockCommand_Copy1x1BlockToXrayBG2Tilemap,$009F

RevealedBlockTable_ShootableBlock_C:
    dw RevealedBlockCommand_Copy1x1BlockToXrayBG2Tilemap,$009F

RevealedBlockTable_ShootableBlock_D:
    dw RevealedBlockCommand_Copy1x1BlockToXrayBG2Tilemap,$009F

RevealedBlockTable_ShootableBlock_E:
    dw RevealedBlockCommand_Copy1x1BlockToXrayBG2Tilemap,$009F

RevealedBlockTable_ShootableBlock_F:
    dw RevealedBlockCommand_Copy1x1BlockToXrayBG2Tilemap,$009F


;;; $D462: Revealed block table - vertical extension ;;;
RevealedBlockTable_VerticalExtension_0:
    dw $FF00,RevealedBlockTable_VerticalExtension_1
    dw $FFFF

RevealedBlockTable_VerticalExtension_1:
    dw RevealedBlockCommand_VerticalExtension


;;; $D46A: Revealed block table - grapple block ;;;
RevealedBlockTable_GrappleBlock:
    dw $0000,RevealedBlockTable_GrappleBlock_0
    dw $0001,RevealedBlockTable_GrappleBlock_1
    dw $0002,RevealedBlockTable_GrappleBlock_2
    dw $FFFF

RevealedBlockTable_GrappleBlock_0:
    dw RevealedBlockCommand_Copy1x1BlockToXrayBG2Tilemap,$009B

RevealedBlockTable_GrappleBlock_1:
    dw RevealedBlockCommand_Copy1x1BlockToXrayBG2Tilemap,$00B7

RevealedBlockTable_GrappleBlock_2:
    dw RevealedBlockCommand_Copy1x1BlockToXrayBG2Tilemap,$00B7


;;; $D484: Revealed block table - bombable block ;;;
RevealedBlockTable_BombableBlock:
    dw $0000,RevealedBlockTable_BombableBlock_0                          ; 1x1 respawning bomb block
    dw $0001,RevealedBlockTable_BombableBlock_1                          ; 2x1 respawning bomb block
    dw $0002,RevealedBlockTable_BombableBlock_2                          ; 1x2 respawning bomb block
    dw $0003,RevealedBlockTable_BombableBlock_3                          ; 2x2 respawning bomb block
    dw $0004,RevealedBlockTable_BombableBlock_4                          ; 1x1 bomb block
    dw $0005,RevealedBlockTable_BombableBlock_5                          ; 2x1 bomb block
    dw $0006,RevealedBlockTable_BombableBlock_6                          ; 1x2 bomb block
    dw $0007,RevealedBlockTable_BombableBlock_7                          ; 2x2 bomb block
    dw $FFFF

RevealedBlockTable_BombableBlock_0:
    dw RevealedBlockCommand_Copy1x1BlockToXrayBG2Tilemap,$0058

RevealedBlockTable_BombableBlock_1:
    dw RevealedBlockCommand_Copy2x1BlockToXrayBG2Tilemap,$0058,$0058

RevealedBlockTable_BombableBlock_2:
    dw RevealedBlockCommand_Copy1x2BlockToXrayBG2Tilemap,$0058,$0058

RevealedBlockTable_BombableBlock_3:
    dw RevealedBlockCommand_Copy2x2BlockToXrayBG2Tilemap
    dw $0058,$0058,$0058,$0058

RevealedBlockTable_BombableBlock_4:
    dw RevealedBlockCommand_Copy1x1BlockToXrayBG2Tilemap,$0058

RevealedBlockTable_BombableBlock_5:
    dw RevealedBlockCommand_Copy2x1BlockToXrayBG2Tilemap,$0058,$0058

RevealedBlockTable_BombableBlock_6:
    dw RevealedBlockCommand_Copy1x2BlockToXrayBG2Tilemap,$0058,$0058

RevealedBlockTable_BombableBlock_7:
    dw RevealedBlockCommand_Copy2x2BlockToXrayBG2Tilemap
    dw $0058,$0058,$0058,$0058


;;; $D4DA: Game state 1Ch (unused) ;;;
UNUSED_GameState1C_91D4DA:
; CrystalFlashAmmoDecrementingIndex is never set to a pointer
    PHP
    REP #$30
    JMP.W (CrystalFlashAmmoDecrementingIndex)


;;; $D4E0: Unused. PLP : RTL ;;;
PLPRTL_91D4E0:
    PLP
    RTL


;;; $D4E2: Unused. PLP : RTL ;;;
PLPRTL_91D4E2:
    PLP
    RTL


;;; $D4E4: Varia suit pick up ;;;
VariaSuit_Pickup:
    PHP : PHB
    PHK : PLB
    SEP #$30
    LDA.B #$30 : STA.W SuitPickup_ColorMathRed
    LDA.B #$50 : STA.W SuitPickup_ColorMathGreen
    LDA.B #$80 : STA.W SuitPickup_ColorMathBlue
    STZ.W SuitPickup_PaletteTransitionColor
    REP #$30
    JSL Cancel_SpeedBoosting
    STZ.W SamusXExtraRunSpeed : STZ.W SamusXExtraRunSubSpeed
    STZ.W SamusXBaseSpeed : STZ.W SamusXBaseSubSpeed
    STZ.W SamusYSubSpeed : STZ.W SamusYSpeed
    STZ.W SamusYDirection : STZ.W MorphBallBounceState
    STZ.W SamusXAccelerationMode : STZ.W ElevatorStatus
    STZ.W SuitPickup_Stage : STZ.W SuitPickup_Var
    LDA.W #$0100 : STA.W SuitPickupLightBeamWideningSpeed
    LDX.W #$01FE
    LDA.W #$00FF

  .loop:
    STA.L SuitPickupWindow1HDMADataTable,X
    DEX #2 : BPL .loop
    LDA.W MovementType : AND.W #$00FF : CMP.W #$0003 : BEQ .playSFX
    CMP.W #$0014 : BNE .notSpinning

  .playSFX:
    LDA.W #$0032
    JSL QueueSound_Lib1_Max9

  .notSpinning:
    LDA.W EquippedItems : BIT.W #$0020 : BNE .gravitySuitEquipped
    LDA.W #$0000 : STA.W Pose
    BRA .initSamus

  .gravitySuitEquipped:
    LDA.W #$009B : STA.W Pose

  .initSamus:
    JSL InitializeSamusPose_1
    JSL Set_Samus_AnimationFrame_if_PoseChanged
    LDA.W #$0015
    JSL Run_Samus_Command
    LDA.W Layer1XPosition : CLC : ADC.W #$0078 : STA.W SamusXPosition : STA.W SamusPreviousXPosition
    LDA.W Layer1YPosition : CLC : ADC.W #$0088 : STA.W SamusYPosition : STA.W SamusPreviousYPosition
    LDA.W #$0056
    JSL QueueSound_Lib2_Max6
    JSL Spawn_HDMAObject
    db $41,$26
    dw InstList_HDMAObject_Window1Position_VariaSuitPickup
    PLB : PLP
    RTL


;;; $D5A2: HDMA object instruction list - window 1 position - varia suit pickup ;;;
InstList_HDMAObject_Window1Position_VariaSuitPickup:
    dw Instruction_HDMAObject_HDMATableBank : db $00
    dw Instruction_HDMAObject_IndirectHDMATableBank : db $7E
    dw Instruction_HDMAObject_CallExternalFunctionInY
    dl InitializeSuitPickupHDMA
    dw $0001,SuitPickupIndirectHDMATable
    dw Instruction_HDMAObject_PreInstructionInY
    dl PreInstruction_VariaSuitPickup
    dw Instruction_HDMAObject_Sleep
    dw Instruction_HDMAObject_Delete


;;; $D5BA: Gravity suit pick up ;;;
GravitySuit_Pickup:
    PHP : PHB
    PHK : PLB
    SEP #$30
    LDA.B #$30 : STA.W SuitPickup_ColorMathRed
    LDA.B #$49 : STA.W SuitPickup_ColorMathGreen
    LDA.B #$90 : STA.W SuitPickup_ColorMathBlue
    LDA.B #$01 : STA.W SuitPickup_PaletteTransitionColor
    REP #$30
    JSL Cancel_SpeedBoosting
    STZ.W SamusXExtraRunSpeed : STZ.W SamusXExtraRunSubSpeed
    STZ.W SamusXBaseSpeed : STZ.W SamusXBaseSubSpeed
    STZ.W SamusYSubSpeed : STZ.W SamusYSpeed
    STZ.W SamusYDirection : STZ.W MorphBallBounceState
    STZ.W SamusXAccelerationMode : STZ.W ElevatorStatus
    STZ.W SuitPickup_Stage : STZ.W SuitPickup_Var
    LDA.W #$0100 : STA.W SuitPickupLightBeamWideningSpeed
    LDX.W #$01FE
    LDA.W #$00FF

  .loop:
    STA.L SuitPickupWindow1HDMADataTable,X
    DEX #2 : BPL .loop
    LDA.W MovementType : AND.W #$00FF : CMP.W #$0003 : BEQ .playSFX
    CMP.W #$0014 : BNE .notSpinning

  .playSFX:
    LDA.W #$0032
    JSL QueueSound_Lib1_Max9

  .notSpinning:
    LDA.W EquippedItems : BIT.W #$0001 : BNE .gravitySuitEquipped
    LDA.W #$0000 : STA.W Pose
    BRA .initSamus

  .gravitySuitEquipped:
    LDA.W #$009B : STA.W Pose

  .initSamus:
    JSL InitializeSamusPose_1
    JSL Set_Samus_AnimationFrame_if_PoseChanged
    LDA.W #$0015
    JSL Run_Samus_Command
    LDA.W Layer1XPosition : CLC : ADC.W #$0078 : STA.W SamusXPosition : STA.W SamusPreviousXPosition
    LDA.W Layer1YPosition : CLC : ADC.W #$0088 : STA.W SamusYPosition : STA.W SamusPreviousYPosition
    LDA.W #$0056
    JSL QueueSound_Lib2_Max6
    JSL Spawn_HDMAObject
    db $41,$26
    dw InstList_HDMAObject_Window1Position_GravitySuitPickup
    PLB : PLP
    RTL


;;; $D67A: HDMA object instruction list - window 1 position - gravity suit pickup ;;;
InstList_HDMAObject_Window1Position_GravitySuitPickup:
    dw Instruction_HDMAObject_HDMATableBank : db $00
    dw Instruction_HDMAObject_IndirectHDMATableBank : db $7E
    dw Instruction_HDMAObject_CallExternalFunctionInY
    dl InitializeSuitPickupHDMA
    dw $0001,SuitPickupIndirectHDMATable
    dw Instruction_HDMAObject_PreInstructionInY
    dl PreInstruction_GravitySuitPickup
    dw Instruction_HDMAObject_Sleep
    dw Instruction_HDMAObject_Delete


;;; $D692: Initialise suit pickup HDMA ;;;
InitializeSuitPickupHDMA:
    PHP : PHB
    PHK : PLB
    SEP #$30
    LDA.B #$13 : STA.B DP_MainScreenLayers
    LDA.B #$13 : STA.B DP_WindowAreaMainScreen
    LDA.B #$04 : STA.B DP_SubScreenLayers
    LDA.B #$04 : STA.B DP_WindowAreaSubScreen
    LDA.B #$10 : STA.B DP_NextGameplayColorMathA
    LDA.B #$00 : STA.B DP_WindowMaskBG12
    LDA.B #$02 : STA.B DP_WindowMaskBG34
    LDA.B #$20 : STA.B DP_WindowMaskSprite
    LDA.B #$33 : STA.B DP_NextGameplayColorMathB
    LDA.W SuitPickup_ColorMathRed : STA.B DP_ColorMathSubScreenBackdropColor0
    LDA.W SuitPickup_ColorMathGreen : STA.B DP_ColorMathSubScreenBackdropColor1
    LDA.W SuitPickup_ColorMathBlue : STA.B DP_ColorMathSubScreenBackdropColor2
    REP #$30
    LDA.W #$00E4 : STA.W SuitPickupIndirectHDMATable
    LDA.W #SuitPickupWindow1HDMADataTable : STA.W SuitPickupIndirectHDMATable+1
    LDA.W #$00E4 : STA.W SuitPickupIndirectHDMATable+3
    LDA.W #SuitPickupWindow1HDMADataTable+$C8 : STA.W SuitPickupIndirectHDMATable+4
    LDA.W #$0098 : STA.W SuitPickupIndirectHDMATable+6
    LDA.W #SuitPickupWindow1HDMADataTable+$190 : STA.W SuitPickupIndirectHDMATable+7
    STZ.W SuitPickupIndirectHDMATable+9
    PLB : PLP
    RTL


;;; $D6F7: Handle Samus palette ;;;
HandleSamusPalette:
; Also handles super jump timer
    PHP : PHB
    PHK : PLB
    REP #$30
    LDA.W SuperSpecialPaletteFlags : BPL .notHyper
    JSR HandleMiscSamusPalette
    PLB : PLP
    RTL

  .notHyper:
    JSR HandleBeamChargePalettes
    BCS .glowEnded
    LDA.W SpecialSamusPaletteType : ASL : TAX
    JSR.W (.special,X)
    BCS .return

  .glowEnded:
    LDX.W SuitPaletteIndex
    LDA.W .suits,X : TAX
    JSR Load20BytesOfSamusPaletteInX

  .return:
    JSR HandleMiscSamusPalette
    PLB : PLP
    RTL

  .suits:
; Samus palette pointers. Normal
    dw SamusPalettes_PowerSuit
    dw SamusPalettes_VariaSuit
    dw SamusPalettes_GravitySuit

  .special:
    dw Handle_ScrewAttack_SpeedBoosting_Palette                          ; 0: Screw attacking / speed boosting
    dw HandleSpeedBoosterShinePalette                                    ; 1: Speed booster shine
    dw HandleMiscSamusPalette                                            ; 2: Unused
    dw $0000
    dw $0000
    dw $0000
    dw HandleShinesparkingPalette                                        ; 6: Shinesparking
    dw HandleCrystalFlashPalette                                         ; 7: Crystal flash
    dw HandleXrayPalette                                                 ; 8: X-ray
    dw HandleVisorPalette                                                ; 9: Unused
    dw RTS_91DD31                                                        ; Ah: RTS. Unused


;;; $D743: Handle beam charge palettes ;;;
HandleBeamChargePalettes:
;; Returns:
;;     Carry: Set if charged shot glow has ended, clear otherwise

; Including beam charging, charged shot / grapple glow, pseudo screw attack, also calls visor palette handler
    LDA.W ChargedShotGlowTimer : BNE .chargedShotGlow
    LDA.W GrappleBeam_Function : CMP.W #GrappleBeamFunction_Inactive : BNE .noChargeGlow
    LDA.W SamusProjectile_FlareCounter : BEQ .noChargeGlow
    CMP.W #$003C : BMI .noChargeGlow
    LDA.W ContactDamageIndex : CMP.W #$0004 : BNE .notPseudoScrew
    LDX.W SuitPaletteIndex
    LDA.W SamusPaletteTable_PseudoScrewAttack_pointers,X : STA.B DP_Temp24
    BRA +

  .notPseudoScrew:
    LDX.W SuitPaletteIndex
    LDA.W SamusPaletteTable_BeamCharge_pointers,X : STA.B DP_Temp24

+   LDA.W SamusChargePaletteIndex : CLC : ADC.B DP_Temp24 : TAX
    LDA.W $0000,X : TAX
    JSR Load20BytesOfSamusPaletteInX
    LDA.W SamusChargePaletteIndex : INC #2 : CMP.W #$000C : BMI .setPaletteIndex
    LDA.W #$0000

  .setPaletteIndex:
    STA.W SamusChargePaletteIndex
    CLC
    RTS

  .chargedShotGlow:
    LDA.W HyperBeam : BNE .hyperBeam
    DEC.W ChargedShotGlowTimer : BEQ .returnCarrySet
    LDX.W #$001C
    LDA.W #$03FF

  .loop:
    STA.L Palettes_SpriteP4C1,X
    DEX #2 : BPL .loop
    CLC
    RTS

  .returnCarrySet:
    SEC
    RTS

  .noChargeGlow:
    STZ.W SamusChargePaletteIndex
    JMP HandleVisorPalette

  .hyperBeam:
    LDA.W ChargedShotGlowTimer : BIT.W #$0001 : BNE .decGlowTimer
    AND.W #$001E : BEQ .endGlow
    TAY
    LDA.W SamusPaletteTable_HyperBeam,Y : TAX
    JSR Load20BytesOfSamusPaletteInX

  .decGlowTimer:
    DEC.W ChargedShotGlowTimer
    CLC
    RTS

  .endGlow:
    STZ.W ChargedShotGlowTimer
    SEC
    RTS


SamusPaletteTable_BeamCharge_pointers:
; Samus palette table. Beam charge
    dw SamusPaletteTable_BeamCharge_powerSuit
    dw SamusPaletteTable_BeamCharge_variaSuit
    dw SamusPaletteTable_BeamCharge_gravitySuit

SamusPaletteTable_BeamCharge_powerSuit:
    dw SamusPalettes_PowerSuit_DeathSequence_BeamCharging_0
    dw SamusPalettes_PowerSuit_DeathSequence_BeamCharging_1
    dw SamusPalettes_PowerSuit_DeathSequence_BeamCharging_2
    dw SamusPalettes_PowerSuit_DeathSequence_BeamCharging_3
    dw SamusPalettes_PowerSuit_DeathSequence_BeamCharging_2
    dw SamusPalettes_PowerSuit_DeathSequence_BeamCharging_1

SamusPaletteTable_BeamCharge_variaSuit:
    dw SamusPalettes_VariaSuit_DeathSequence_BeamCharging_0
    dw SamusPalettes_VariaSuit_DeathSequence_BeamCharging_1
    dw SamusPalettes_VariaSuit_DeathSequence_BeamCharging_2
    dw SamusPalettes_VariaSuit_DeathSequence_BeamCharging_3
    dw SamusPalettes_VariaSuit_DeathSequence_BeamCharging_2
    dw SamusPalettes_VariaSuit_DeathSequence_BeamCharging_1

SamusPaletteTable_BeamCharge_gravitySuit:
    dw SamusPalettes_GravitySuit_DeathSequence_BeamCharging_0
    dw SamusPalettes_GravitySuit_DeathSequence_BeamCharging_1
    dw SamusPalettes_GravitySuit_DeathSequence_BeamCharging_2
    dw SamusPalettes_GravitySuit_DeathSequence_BeamCharging_3
    dw SamusPalettes_GravitySuit_DeathSequence_BeamCharging_2
    dw SamusPalettes_GravitySuit_DeathSequence_BeamCharging_1

SamusPaletteTable_PseudoScrewAttack_pointers:
; Samus palette table. Pseudo screw attack
    dw SamusPaletteTable_PseudoScrewAttack_powerSuit
    dw SamusPaletteTable_PseudoScrewAttack_variaSuit
    dw SamusPaletteTable_PseudoScrewAttack_gravitySuit

SamusPaletteTable_PseudoScrewAttack_powerSuit:
    dw SamusPalettes_PowerSuit_Shinespark_PseudoScrewAttack_3
    dw SamusPalettes_PowerSuit_Shinespark_PseudoScrewAttack_3
    dw SamusPalettes_PowerSuit_Shinespark_PseudoScrewAttack_3
    dw SamusPalettes_PowerSuit
    dw SamusPalettes_PowerSuit
    dw SamusPalettes_PowerSuit

SamusPaletteTable_PseudoScrewAttack_variaSuit:
    dw SamusPalettes_VariaSuit_Shinespark_PseudoScrewAttack_3
    dw SamusPalettes_VariaSuit_Shinespark_PseudoScrewAttack_3
    dw SamusPalettes_VariaSuit_Shinespark_PseudoScrewAttack_3
    dw SamusPalettes_VariaSuit
    dw SamusPalettes_VariaSuit
    dw SamusPalettes_VariaSuit

SamusPaletteTable_PseudoScrewAttack_gravitySuit:
    dw SamusPalettes_GravitySuit_Shinespark_3
    dw SamusPalettes_GravitySuit_Shinespark_3
    dw SamusPalettes_GravitySuit_Shinespark_3
    dw SamusPalettes_GravitySuit
    dw SamusPalettes_GravitySuit
    dw SamusPalettes_GravitySuit

SamusPaletteTable_HyperBeam:
; Hyper beam palette table (with a padding zero)
    dw $0000
    dw SamusPalettes_HyperBeam_9
    dw SamusPalettes_HyperBeam_8
    dw SamusPalettes_HyperBeam_7
    dw SamusPalettes_HyperBeam_6
    dw SamusPalettes_HyperBeam_5
    dw SamusPalettes_HyperBeam_4
    dw SamusPalettes_HyperBeam_3
    dw SamusPalettes_HyperBeam_2
    dw SamusPalettes_HyperBeam_1
    dw SamusPalettes_HyperBeam_0


;;; $D83F: Handle visor palette ;;;
HandleVisorPalette:
;; Returns:
;;     Carry: Clear

; For colour math backdrop rooms. Does not handle x-ray
    LDA.W SpecialSamusPaletteType : CMP.W #$0008 : BNE +

  .return:
    CLC
    RTS

+   LDA.W LayerBlending_DefaultConfig : CMP.W #$0028 : BEQ +
    CMP.W #$002A : BNE .normal

+   LDA.W VisorPaletteTimer : DEC : STA.W VisorPaletteTimer
    BIT.W #$00FF : BEQ +
    BNE .return

+   ORA.W #$0005 : STA.W VisorPaletteTimer
    XBA : AND.W #$00FF : TAX
    LDA.L SamusPalettes_Visor,X : STA.L Palettes_SpriteP4C4
    TXA : INC #2 : CMP.W #$000C : BMI +
    LDA.W VisorPaletteTimer : AND.W #$00FF : ORA.W #$0600 : STA.W VisorPaletteTimer
    CLC
    RTS

+   XBA : STA.B DP_Temp12
    LDA.W VisorPaletteTimer : AND.W #$00FF : ORA.B DP_Temp12 : STA.W VisorPaletteTimer
    CLC
    RTS

  .normal:
    LDA.W #$0601 : STA.W VisorPaletteTimer
    CLC
    RTS


;;; $D8A5: Handle misc. Samus palette ;;;
HandleMiscSamusPalette:
; This stuff happens after (pseudo) screw attacking / speed boosting / speed booster shine / shinesparking / crystal flash / x-ray / beam effects,
; so takes priority

; In the PAL version, there's a time is frozen check at BRANCH_NON_HURT_SFX to prevent spin jump sound playing through reserve tank activation
    LDA.W SuperSpecialPaletteFlags : BNE .gotoSuperSpecial
    LDA.W HurtFlashCounter : BNE .timerNotExpired
    RTS

  .gotoSuperSpecial:
    JMP .superSpecial

  .timerNotExpired:
    CMP.W #$0002 : BNE .notHurtFrame2
    LDA.W CinematicFunction : BNE .noSFX
    LDA.W NewStateHandler : CMP.W #RTL_90E8D9 : BNE .notDrained
    LDA.W Pose : CMP.W #$0054 : BEQ .noSFX

  .notDrained:
    LDA.W #$0035
    JSL QueueSound_Lib1_Max6
    BRA .notHurtFlash

  .noSFX:
    LDA.W HurtFlashCounter

  .notHurtFrame2:
    CMP.W #$0007 : BPL .hurtFlashDone
    BIT.W #$0001 : BEQ .notHurtFlash
    LDX.W #SamusPalettes_HurtFlash
    JSR Load20BytesOfSamusPaletteInX
    BRA .hurtFlashDone

  .notHurtFlash:
    LDA.W CinematicFunction : BEQ .loadPalette
    LDX.W #SamusPalettes_Intro
    JSR Load20BytesOfSamusPaletteInX
    BRA .hurtFlashDone

  .loadPalette:
    JSL LoadSamusSuitPalette

  .hurtFlashDone:
    LDA.W HurtFlashCounter : INC : STA.W HurtFlashCounter
    CMP.W #$0028 : BEQ .nonHurtSFX
    CMP.W #$003C : BMI .returnUpper
    STZ.W HurtFlashCounter

  .returnUpper:
    RTS

  .nonHurtSFX:
    LDA.W GrappleBeam_Function : CMP.W #GrappleBeamFunction_Inactive : BNE .grappleActive
    LDA.W MovementType : AND.W #$00FF : CMP.W #$0003 : BEQ .spinning
    CMP.W #$0014 : BEQ .spinning
    LDA.W SamusProjectile_FlareCounter : CMP.W #$0010 : BMI .returnUpper
    LDA.B DP_Controller1Input : BIT.W ShotBinding : BEQ .returnUpper
    LDA.W #$0001 : STA.W ResumeChargingBeamSFXFlag
    RTS

  .grappleActive:
    CMP.W #GrappleBeamFunction_HitNothing_Cancel : BPL .returnUpper
    LDA.W #$0006
    JSL QueueSound_Lib1_Max9
    RTS

  .spinning:
    LDA.W #$001C
    JSL Run_Samus_Command
    RTS

  .superSpecial:
    BMI .acquiringHyperBeam
    BIT.W #$0001 : BEQ .loadPalette2
    LDX.W SuitPaletteIndex
    LDA.W .pointers,X : TAX
    JSR Load20BytesOfSamusPaletteInX
    BRA .incSuperSpecialFlags

  .loadPalette2:
    JSL LoadSamusSuitPalette

  .incSuperSpecialFlags:
    INC.W SuperSpecialPaletteFlags
    RTS

  .acquiringHyperBeam:
    LDA.W SamusChargePaletteIndex : ASL : TAY
    LDA.W .hyperBeamPalettes,Y : TAX
    JSR Load20BytesOfSamusPaletteInX
    DEC.W CommonPaletteTimer : BEQ .timerExpired
    BPL .returnLower

  .timerExpired:
    LDA.W SpecialSamusPaletteFrame : STA.W CommonPaletteTimer
    LDA.W SamusChargePaletteIndex : INC : STA.W SamusChargePaletteIndex
    CMP.W #$000A : BMI .returnLower
    STZ.W SamusChargePaletteIndex

  .returnLower:
    RTS

  .pointers:
; Samus palette pointers. Speed boosting palettes
    dw SamusPalettes_PowerSuit_SpeedBoosting_BabyMetroidDrain_3
    dw SamusPalettes_VariaSuit_SpeedBoosting_BabyMetroidDrain_3
    dw SamusPalettes_GravitySuit_SpeedBoosting_BabyMetroidDrain_3

  .hyperBeamPalettes:
; Samus palette pointers. Hyper beam
    dw SamusPalettes_HyperBeam_9
    dw SamusPalettes_HyperBeam_8
    dw SamusPalettes_HyperBeam_7
    dw SamusPalettes_HyperBeam_6
    dw SamusPalettes_HyperBeam_5
    dw SamusPalettes_HyperBeam_4
    dw SamusPalettes_HyperBeam_3
    dw SamusPalettes_HyperBeam_2
    dw SamusPalettes_HyperBeam_1
    dw SamusPalettes_HyperBeam_0


;;; $D9B2: Handle screw attacking / speed boosting palette ;;;
Handle_ScrewAttack_SpeedBoosting_Palette:
;; Returns:
;;     Carry: Clear to use normal suit palette, set otherwise
    LDA.W SuitPaletteIndex : BIT.W #$0004 : BNE .nonLiquidPhysics
    JSL Get_Samus_BottomTop_Boundary
    LDA.W FX_YPosition : BMI .negativeYPosition
    CMP.B DP_Temp14 : BPL .nonLiquidPhysics
    LDA.W FX_LiquidOptions : BIT.W #$0004 : BNE .nonLiquidPhysics
    BRA .whyAreWeHere

  .negativeYPosition:
    LDA.W FX_LavaAcidYPosition : BMI .nonLiquidPhysics
    CMP.B DP_Temp14 : BMI .whyAreWeHere

  .nonLiquidPhysics:
    LDA.W MovementType : AND.W #$00FF : CMP.W #$0003 : BEQ .spinJumping
    CMP.W #$0014 : BEQ .wallJumping

  .notScrewAttacking:
    LDA.W SamusBoostTimer : AND.W #$FF00 : CMP.W #$0400 : BEQ .speedBoosting

  .whyAreWeHere:
    SEC
    RTS

  .spinJumping:
    LDA.W EquippedItems : BIT.W #$0008 : BEQ .notScrewAttacking
    LDA.W SamusAnimationFrame : BEQ .resetIndex
    CMP.W #$001B : BPL .returnNormalPalette
    BRA .merge

  .wallJumping:
    LDA.W EquippedItems : BIT.W #$0008 : BEQ .returnWallJump
    LDA.W SamusAnimationFrame : CMP.W #$0003 : BMI .resetIndex

  .merge:
    LDX.W SuitPaletteIndex
    LDA.W .screwAttackPaletteTablePointers,X : STA.B DP_Temp24
    LDA.W SpecialSamusPaletteFrame : CLC : ADC.B DP_Temp24 : TAX
    LDA.W $0000,X : TAX
    JSR Load20BytesOfSamusPaletteInX
    LDA.W SpecialSamusPaletteFrame : INC #2 : CMP.W #$000C : BMI .storeIndex
    LDA.W #$0000

  .storeIndex:
    STA.W SpecialSamusPaletteFrame
    SEC
    RTS

  .resetIndex:
    STZ.W SpecialSamusPaletteFrame

  .returnWallJump:
    SEC
    RTS

  .returnNormalPalette:
    CLC
    RTS

  .screwAttackPaletteTablePointers:
; Screw attack Samus palette table. Indexed by [Samus suit palette index]
    dw ..powerSuit
    dw ..variaSuit
    dw ..gravitySuit

; Pointers to bank $9B. Indexed by [special Samus palette frame]
  ..powerSuit:
    dw SamusPalettes_PowerSuit_ScrewAttack_0
    dw SamusPalettes_PowerSuit_ScrewAttack_1
    dw SamusPalettes_PowerSuit_ScrewAttack_2
    dw SamusPalettes_PowerSuit_ScrewAttack_3
    dw SamusPalettes_PowerSuit_ScrewAttack_2
    dw SamusPalettes_PowerSuit_ScrewAttack_1

  ..variaSuit:
    dw SamusPalettes_VariaSuit_ScrewAttack_0
    dw SamusPalettes_VariaSuit_ScrewAttack_1
    dw SamusPalettes_VariaSuit_ScrewAttack_2
    dw SamusPalettes_VariaSuit_ScrewAttack_3
    dw SamusPalettes_VariaSuit_ScrewAttack_2
    dw SamusPalettes_VariaSuit_ScrewAttack_1

  ..gravitySuit:
    dw SamusPalettes_GravitySuit_ScrewAttack_0
    dw SamusPalettes_GravitySuit_ScrewAttack_1
    dw SamusPalettes_GravitySuit_ScrewAttack_2
    dw SamusPalettes_GravitySuit_ScrewAttack_3
    dw SamusPalettes_GravitySuit_ScrewAttack_2
    dw SamusPalettes_GravitySuit_ScrewAttack_1

  .speedBoosting:
    DEC.W CommonPaletteTimer : BEQ .timerExpired
    BPL .returnSpeedBooster

  .timerExpired:
    LDA.W #$0004 : STA.W CommonPaletteTimer
    LDX.W SuitPaletteIndex
    LDA.W .speedBoosterPaletteTablePointers,X : STA.B DP_Temp24
    LDA.W SpecialSamusPaletteFrame : CLC : ADC.B DP_Temp24 : TAX
    LDA.W $0000,X : TAX
    JSR Load20BytesOfSamusPaletteInX
    LDA.W SpecialSamusPaletteFrame : INC #2 : CMP.W #$0008 : BMI .storeIndexSpeedBooster
    LDA.W #$0006

  .storeIndexSpeedBooster:
    STA.W SpecialSamusPaletteFrame

  .returnSpeedBooster:
    SEC
    RTS

; Samus palette table. Speed boosting
  .speedBoosterPaletteTablePointers:
    dw ..powerSuit
    dw ..variaSuit
    dw ..gravitySuit

  ..powerSuit:
    dw SamusPalettes_PowerSuit_SpeedBoosting_BabyMetroidDrain_0
    dw SamusPalettes_PowerSuit_SpeedBoosting_BabyMetroidDrain_1
    dw SamusPalettes_PowerSuit_SpeedBoosting_BabyMetroidDrain_2
    dw SamusPalettes_PowerSuit_SpeedBoosting_BabyMetroidDrain_3

  ..variaSuit:
    dw SamusPalettes_VariaSuit_SpeedBoosting_BabyMetroidDrain_0
    dw SamusPalettes_VariaSuit_SpeedBoosting_BabyMetroidDrain_1
    dw SamusPalettes_VariaSuit_SpeedBoosting_BabyMetroidDrain_2
    dw SamusPalettes_VariaSuit_SpeedBoosting_BabyMetroidDrain_3

  ..gravitySuit:
    dw SamusPalettes_GravitySuit_SpeedBoosting_BabyMetroidDrain_0
    dw SamusPalettes_GravitySuit_SpeedBoosting_BabyMetroidDrain_1
    dw SamusPalettes_GravitySuit_SpeedBoosting_BabyMetroidDrain_2
    dw SamusPalettes_GravitySuit_SpeedBoosting_BabyMetroidDrain_3


;;; $DAC7: Handle speed booster shine palette ;;;
HandleSpeedBoosterShinePalette:
;; Returns:
;;     Carry: Clear to use normal suit palette, set otherwise
    LDA.W SpecialPaletteTimer : CMP.W #$00AA : BNE .notAA
    PHA
    LDA.W #$000C
    JSL QueueSound_Lib3_Max9
    PLA

  .notAA:
    DEC : STA.W SpecialPaletteTimer : BEQ .finish
    BMI .finish
    LDX.W SuitPaletteIndex
    LDA.W .speedBoosterShinePaletteTablePointers,X : STA.B DP_Temp24
    LDA.W SpecialSamusPaletteFrame : CLC : ADC.B DP_Temp24 : TAX
    LDA.W $0000,X : TAX
    JSR Load20BytesOfSamusPaletteInX
    LDA.W SpecialSamusPaletteFrame : INC #2 : CMP.W #$000C : BMI .storeIndex
    LDA.W #$0000

  .storeIndex:
    STA.W SpecialSamusPaletteFrame
    SEC
    RTS

  .finish:
    STZ.W SpecialSamusPaletteFrame : STZ.W SpecialSamusPaletteType
    CLC
    RTS

  .speedBoosterShinePaletteTablePointers:
; Speed booster shine Samus palette table. Indexed by [Samus suit palette index]
    dw ..powerSuit
    dw ..variaSuit
    dw ..gravitySuit

; Pointers to bank $9B. Indexed by [special Samus palette frame]
  ..powerSuit:
    dw SamusPalettes_PowerSuit_SpeedBoosterShine_0
    dw SamusPalettes_PowerSuit_SpeedBoosterShine_1
    dw SamusPalettes_PowerSuit_SpeedBoosterShine_2
    dw SamusPalettes_PowerSuit_SpeedBoosterShine_3
    dw SamusPalettes_PowerSuit_SpeedBoosterShine_2
    dw SamusPalettes_PowerSuit_SpeedBoosterShine_1

  ..variaSuit:
    dw SamusPalettes_VariaSuit_SpeedBoosterShine_0
    dw SamusPalettes_VariaSuit_SpeedBoosterShine_1
    dw SamusPalettes_VariaSuit_SpeedBoosterShine_2
    dw SamusPalettes_VariaSuit_SpeedBoosterShine_3
    dw SamusPalettes_VariaSuit_SpeedBoosterShine_2
    dw SamusPalettes_VariaSuit_SpeedBoosterShine_1

  ..gravitySuit:
    dw SamusPalettes_GravitySuit_SpeedBoosterShine_0
    dw SamusPalettes_GravitySuit_SpeedBoosterShine_1
    dw SamusPalettes_GravitySuit_SpeedBoosterShine_2
    dw SamusPalettes_GravitySuit_SpeedBoosterShine_3
    dw SamusPalettes_GravitySuit_SpeedBoosterShine_2
    dw SamusPalettes_GravitySuit_SpeedBoosterShine_1


;;; $DB3A: Handle shinesparking palette ;;;
HandleShinesparkingPalette:
;; Returns:
;;     Carry: Clear to use normal suit palette, set otherwise
    LDA.W SpecialPaletteTimer : DEC : STA.W SpecialPaletteTimer : BEQ .finish
    BMI .finish
    LDX.W SuitPaletteIndex
    LDA.W .shinesparkPaletteTablePointers,X : STA.B DP_Temp24
    LDA.W SpecialSamusPaletteFrame : CLC : ADC.B DP_Temp24 : TAX
    LDA.W $0000,X : TAX
    JSR Load20BytesOfSamusPaletteInX
    LDA.W SpecialSamusPaletteFrame : INC #2 : CMP.W #$0008 : BMI .storeIndex
    LDA.W #$0000

  .storeIndex:
    STA.W SpecialSamusPaletteFrame
    SEC
    RTS

  .finish:
    STZ.W SpecialSamusPaletteType : STZ.W SpecialSamusPaletteFrame
    CLC
    RTS

  .shinesparkPaletteTablePointers:
; Shinespark Samus palette table. Indexed by [Samus suit palette index]
    dw ..powerSuit
    dw ..variaSuit
    dw ..gravitySuit

; Pointers to bank $9B. Indexed by [special Samus palette frame]
  ..powerSuit:
    dw SamusPalettes_PowerSuit_Shinespark_PseudoScrewAttack_0
    dw SamusPalettes_PowerSuit_Shinespark_PseudoScrewAttack_1
    dw SamusPalettes_PowerSuit_Shinespark_PseudoScrewAttack_2
    dw SamusPalettes_PowerSuit_Shinespark_PseudoScrewAttack_3

  ..variaSuit:
    dw SamusPalettes_VariaSuit_Shinespark_PseudoScrewAttack_0
    dw SamusPalettes_VariaSuit_Shinespark_PseudoScrewAttack_1
    dw SamusPalettes_VariaSuit_Shinespark_PseudoScrewAttack_2
    dw SamusPalettes_VariaSuit_Shinespark_PseudoScrewAttack_3

  ..gravitySuit:
    dw SamusPalettes_GravitySuit_Shinespark_0
    dw SamusPalettes_GravitySuit_Shinespark_1
    dw SamusPalettes_GravitySuit_Shinespark_2
    dw SamusPalettes_GravitySuit_Shinespark_3


;;; $DB93: Handle crystal flash palette  ;;;
HandleCrystalFlashPalette:
;; Returns:
;;     Carry: Clear to use normal suit palette, set otherwise
    LDA.W SpecialPaletteTimer : BMI .finish
    DEC : STA.W SpecialPaletteTimer : BEQ .specialPaletteTimerExpired
    BPL .bubbleEnd

  .specialPaletteTimerExpired:
    LDA.W #$0005 : STA.W SpecialPaletteTimer
    LDX.W SpecialSamusPaletteFrame
    LDA.W .bubblePaletteTablePointers,X : TAY
    JSR SetCrystalFlashBubbleColors
    LDA.W SpecialSamusPaletteFrame : INC #2 : CMP.W #$000C : BMI .storeIndex
    LDA.W #$0000

  .storeIndex:
    STA.W SpecialSamusPaletteFrame

  .bubbleEnd:
    DEC.W CrystalFlash_PaletteTimer : BEQ .CFPaletteTimerExpired
    BPL .returnCarrySet

  .CFPaletteTimerExpired:
    LDX.W CommonPaletteTimer
    LDA.W .crystalFlashPaletteTable_timers,X : STA.W CrystalFlash_PaletteTimer
    LDA.W .crystalFlashPaletteTable_pointers,X : TAY
    JSR SetCrystalFlashSamusColors
    LDA.W CommonPaletteTimer : CLC : ADC.W #$0004 : CMP.W #$0028 : BMI .storeTimer
    LDA.W #$0000

  .storeTimer:
    STA.W CommonPaletteTimer

  .returnCarrySet:
    SEC
    RTS

  .finish:
    LDA.W EquippedBeams
    JSL Load_Beam_Palette_Setup
    STZ.W SpecialSamusPaletteType : STZ.W SpecialSamusPaletteFrame
    STZ.W CommonPaletteTimer : STZ.W SpecialPaletteTimer
    CLC
    RTS

; Crystal flash Samus palette table. Bank $9B. Sprite palette 6 colours 0..9
; [palette pointer], [timer]
  .crystalFlashPaletteTable_pointers:
    dw SamusPalettes_CrystalFlash_0
  .crystalFlashPaletteTable_timers:
    dw                              $000A
    dw SamusPalettes_CrystalFlash_1,$000A
    dw SamusPalettes_CrystalFlash_2,$000A
    dw SamusPalettes_CrystalFlash_3,$000A
    dw SamusPalettes_CrystalFlash_4,$000A
    dw SamusPalettes_CrystalFlash_5,$000A
    dw SamusPalettes_CrystalFlash_4,$000A
    dw SamusPalettes_CrystalFlash_3,$000A
    dw SamusPalettes_CrystalFlash_2,$000A
    dw SamusPalettes_CrystalFlash_1,$000A

  .bubblePaletteTablePointers:
; Crystal flash bubble palette table. Bank $9B. Sprite palette 6 colours Ah..Fh
    dw SamusPalettes_CrystalFlash_0_bubble
    dw SamusPalettes_CrystalFlash_1_bubble
    dw SamusPalettes_CrystalFlash_2_bubble
    dw SamusPalettes_CrystalFlash_3_bubble
    dw SamusPalettes_CrystalFlash_4_bubble
    dw SamusPalettes_CrystalFlash_5_bubble


;;; $DC34: Set crystal flash Samus colours ;;;
SetCrystalFlashSamusColors:
;; Parameters:
;;     Y: Pointer to crystal flash Samus colours

; Sprite palette 6 colours 0..9 = 14h bytes from $9B:[Y]
    PHB
    PEA.W SamusPalettes_PowerSuit>>8&$FF00 : PLB : PLB
    LDA.W $0000,Y : STA.L Palettes_SpriteP6
    LDA.W $0002,Y : STA.L Palettes_SpriteP6+2
    LDA.W $0004,Y : STA.L Palettes_SpriteP6+4
    LDA.W $0006,Y : STA.L Palettes_SpriteP6+6
    LDA.W $0008,Y : STA.L Palettes_SpriteP6+8
    LDA.W $000A,Y : STA.L Palettes_SpriteP6+$A
    LDA.W $000C,Y : STA.L Palettes_SpriteP6+$C
    LDA.W $000E,Y : STA.L Palettes_SpriteP6+$E
    LDA.W $0010,Y : STA.L Palettes_SpriteP6+$10
    LDA.W $0012,Y : STA.L Palettes_SpriteP6+$12
    PLB
    RTS


;;; $DC82: Set crystal flash bubble colours ;;;
SetCrystalFlashBubbleColors:
;; Parameters:
;;     Y: Pointer to crystal flash bubble colours

; Sprite palette 6 colours Ah..Fh = Ch bytes from $9B:[Y]
    PHB
    PEA.W SamusPalettes_PowerSuit>>8&$FF00 : PLB : PLB
    LDA.W $0000,Y : STA.L Palettes_SpriteP6+$14
    LDA.W $0002,Y : STA.L Palettes_SpriteP6+$16
    LDA.W $0004,Y : STA.L Palettes_SpriteP6+$18
    LDA.W $0006,Y : STA.L Palettes_SpriteP6+$1A
    LDA.W $0008,Y : STA.L Palettes_SpriteP6+$1C
    LDA.W $000A,Y : STA.L Palettes_SpriteP6+$1E
    PLB
    RTS


;;; $DCB4: Handle x-ray palette ;;;
HandleXrayPalette:
;; Returns:
;;     Carry: Clear to use normal suit palette, set otherwise
    LDA.W Xray_BeamSizeFlag : BMI .stop
    BNE .fullBeam
    LDA.W Xray_State : CMP.W #$0002 : BPL .finishedWidening
    DEC.W CommonPaletteTimer : BEQ .timerExpired
    BPL .returnCarrySet

  .timerExpired:
    LDA.W #$0005 : STA.W CommonPaletteTimer
    LDX.W SpecialSamusPaletteFrame
    LDA.L SamusPalettes_Visor,X : STA.L Palettes_SpriteP4C4
    LDA.W SpecialSamusPaletteFrame : CMP.W #$0004 : BPL .returnCarrySet
    INC #2 : STA.W SpecialSamusPaletteFrame

  .returnCarrySet:
    SEC
    RTS

  .finishedWidening:
    LDA.W #$0006 : STA.W SpecialSamusPaletteFrame
    LDA.W #$0001 : STA.W CommonPaletteTimer : STA.W Xray_BeamSizeFlag

  .fullBeam:
    DEC.W CommonPaletteTimer : BEQ .resetTimer
    BPL .returnCarrySet

  .resetTimer:
    LDA.W #$0005 : STA.W CommonPaletteTimer
    LDX.W SpecialSamusPaletteFrame
    LDA.L SamusPalettes_Visor,X : STA.L Palettes_SpriteP4C4
    LDA.W SpecialSamusPaletteFrame : INC #2 : CMP.W #$000C : BMI .storeIndex
    LDA.W #$0006

  .storeIndex:
    STA.W SpecialSamusPaletteFrame
    SEC
    RTS

  .stop:
    STZ.W SpecialSamusPaletteType : STZ.W SpecialSamusPaletteFrame
    STZ.W CommonPaletteTimer : STZ.W Xray_BeamSizeFlag
    CLC
    RTS


;;; $DD31: RTS ;;;
RTS_91DD31:
    RTS


if !FEATURE_KEEP_UNREFERENCED
;;; $DD32: Unused ;;;
UNUSED_91DD32:
; 12 bytes of 1, 14 bytes of 0
    db $01,$00,$00
    db $01,$00,$00
    db $01,$00,$00
    db $01
    db $01,$00
    db $01,$00
    db $01,$00
    db $01,$00
    db $01,$00
    db $01,$00
    db $01,$00
    db $01,$00


;;; $DD4C: Unused. Set Samus palette to $9B:9500 ;;;
UNUSED_SetSamusPaletteToSolidWhite_91DD4C:
; For testing perhaps, palette is solid white
    PHP : PHB
    PHK : PLB
    REP #$30
    LDX.W #UNUSED_SamusPalettes_9B9500
    JSR Load20BytesOfSamusPaletteInX
    PLB : PLP
    RTL
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $DD5B: Samus palette = 20h bytes from $9B:[X] ;;;
Load20BytesOfSamusPaletteInX:
;; Parameters:
;;     X: Pointer to Samus palette
    PHP
    REP #$30
    PHB
    PEA.W SamusPalettes_PowerSuit>>8&$FF00 : PLB : PLB
    LDA.W $0000,X : STA.L Palettes_SpriteP4C0
    LDA.W $0002,X : STA.L Palettes_SpriteP4C1
    LDA.W $0004,X : STA.L Palettes_SpriteP4C2
    LDA.W $0006,X : STA.L Palettes_SpriteP4C3
    LDA.W $0008,X : STA.L Palettes_SpriteP4C4
    LDA.W $000A,X : STA.L Palettes_SpriteP4C5
    LDA.W $000C,X : STA.L Palettes_SpriteP4C6
    LDA.W $000E,X : STA.L Palettes_SpriteP4C7
    LDA.W $0010,X : STA.L Palettes_SpriteP4C8
    LDA.W $0012,X : STA.L Palettes_SpriteP4C9
    LDA.W $0014,X : STA.L Palettes_SpriteP4CA
    LDA.W $0016,X : STA.L Palettes_SpriteP4CB
    LDA.W $0018,X : STA.L Palettes_SpriteP4CC
    LDA.W $001A,X : STA.L Palettes_SpriteP4CD
    LDA.W $001C,X : STA.L Palettes_SpriteP4CE
    LDA.W $001E,X : STA.L Palettes_SpriteP4CF
    PLB : PLP
    RTS


;;; $DDD7: Target Samus palette = 20h bytes from $9B:[X] ;;;
Load20BytesOfSamusTargetPaletteInX:
;; Parameters:
;;     X: Pointer to Samus palette

; Used only by LoadSamusSuitTargetPalette
    PHP
    REP #$30
    PHB
    PEA.W SamusPalettes_PowerSuit>>8&$FF00 : PLB : PLB
    LDA.W $0000,X : STA.L TargetPalettes_SpriteP4
    LDA.W $0002,X : STA.L TargetPalettes_SpriteP4+2
    LDA.W $0004,X : STA.L TargetPalettes_SpriteP4+4
    LDA.W $0006,X : STA.L TargetPalettes_SpriteP4+6
    LDA.W $0008,X : STA.L TargetPalettes_SpriteP4+8
    LDA.W $000A,X : STA.L TargetPalettes_SpriteP4+$A
    LDA.W $000C,X : STA.L TargetPalettes_SpriteP4+$C
    LDA.W $000E,X : STA.L TargetPalettes_SpriteP4+$E
    LDA.W $0010,X : STA.L TargetPalettes_SpriteP4+$10
    LDA.W $0012,X : STA.L TargetPalettes_SpriteP4+$12
    LDA.W $0014,X : STA.L TargetPalettes_SpriteP4+$14
    LDA.W $0016,X : STA.L TargetPalettes_SpriteP4+$16
    LDA.W $0018,X : STA.L TargetPalettes_SpriteP4+$18
    LDA.W $001A,X : STA.L TargetPalettes_SpriteP4+$1A
    LDA.W $001C,X : STA.L TargetPalettes_SpriteP4+$1C
    LDA.W $001E,X : STA.L TargetPalettes_SpriteP4+$1E
    PLB : PLP
    RTS


;;; $DE53: Cancel speed boosting ;;;
Cancel_SpeedBoosting:
    PHP : PHB
    PHK : PLB
    REP #$30
    LDA.W SamusRunningMomentumFlag : BEQ .merge
    STZ.W SamusRunningMomentumFlag : STZ.W SamusBoostTimer
    STZ.W SpecialSamusPaletteFrame : STZ.W CommonPaletteTimer
    LDA.W EquippedItems : BIT.W #$0020 : BNE .gravity
    BIT.W #$0001 : BNE .varia
    LDX.W #SamusPalettes_PowerSuit
    JSR Load20BytesOfSamusPaletteInX
    BRA .merge

  .varia:
    LDX.W #SamusPalettes_VariaSuit
    JSR Load20BytesOfSamusPaletteInX
    BRA .merge

  .gravity:
    LDX.W #SamusPalettes_GravitySuit
    JSR Load20BytesOfSamusPaletteInX

  .merge:
    LDA.W SpeedEcho_Index : BMI .return
    LDA.W #$FFFF : STA.W SpeedEcho_Index
    LDA.W PoseXDirection : AND.W #$00FF : CMP.W #$0004 : BEQ .negative8
    LDA.W #$0008 : STA.W SpeedEcho_XSpeed0 : STA.W SpeedEcho_XSpeed1
    BRA .return

  .negative8:
    LDA.W #$FFF8 : STA.W SpeedEcho_XSpeed0 : STA.W SpeedEcho_XSpeed1

  .return:
    PLB : PLP
    RTL


;;; $DEBA: Load Samus suit palette ;;;
LoadSamusSuitPalette:
    PHP : PHB
    PHK : PLB
    REP #$30
    LDA.W EquippedItems : BIT.W #$0020 : BNE .gravitySuit
    BIT.W #$0001 : BNE .variaSuit
    LDX.W #SamusPalettes_PowerSuit
    JSR Load20BytesOfSamusPaletteInX
    BRA .return

  .variaSuit:
    LDX.W #SamusPalettes_VariaSuit
    JSR Load20BytesOfSamusPaletteInX
    BRA .return

  .gravitySuit:
    LDX.W #SamusPalettes_GravitySuit
    JSR Load20BytesOfSamusPaletteInX

  .return:
    PLB : PLP
    RTL


;;; $DEE6: Load Samus suit target palette ;;;
LoadSamusSuitTargetPalette:
    PHP : PHB
    PHK : PLB
    REP #$30
    LDA.W EquippedItems : BIT.W #$0020 : BNE .gravitySuit
    BIT.W #$0001 : BNE .variaSuit
    LDX.W #SamusPalettes_PowerSuit
    JSR Load20BytesOfSamusTargetPaletteInX
    BRA .return

  .variaSuit:
    LDX.W #SamusPalettes_VariaSuit
    JSR Load20BytesOfSamusTargetPaletteInX
    BRA .return

  .gravitySuit:
    LDX.W #SamusPalettes_GravitySuit
    JSR Load20BytesOfSamusTargetPaletteInX

  .return:
    PLB : PLP
    RTL


;;; $DF12: Restore [A] health to Samus ;;;
Restore_A_Energy_ToSamus:
;; Parameters:
;;     A: Health
    PHP : PHB
    PHK : PLB
    REP #$30
    STA.B DP_Temp12
    LDA.W Energy : CLC : ADC.B DP_Temp12 : STA.W Energy
    CMP.W MaxEnergy : BMI .return
    SEC : SBC.W MaxEnergy : CLC : ADC.W ReserveEnergy
    CMP.W MaxReserveEnergy : BMI .maxReserve
    LDA.W MaxReserveEnergy

  .maxReserve:
    STA.W ReserveEnergy
    BEQ .maxEnergy
    LDA.W ReserveTankMode : BNE .maxEnergy
    LDA.W #$0001 : STA.W ReserveTankMode

  .maxEnergy:
    LDA.W MaxEnergy : STA.W Energy

  .return:
    PLB : PLP
    RTL


;;; $DF51: Deal [A] damage to Samus ;;;
Deal_A_Damage_to_Samus:
;; Parameters:
;;     A: Damage. 300 is treated like 0. Negative = crash

; Ignores suits, call $A0:A45E for suit-adjusted damage
; There are no enemies or enemy projectiles that do 300 damage,
; there are some projectiles - which if reflected - could do 300 damage,
; in any case it's unclear what the 300 damage check is for
    PHP : PHB
    PHK : PLB
    REP #$30
    PHX
    STA.B DP_Temp12
    TAX : BPL .noCrash
    JML Crash_Handler

  .noCrash:
    CMP.W #$012C : BEQ .noDamage
    LDA.W TimeIsFrozenFlag : BNE .return
    LDA.W Energy : SEC : SBC.B DP_Temp12 : STA.W Energy : BPL .return
    STZ.W Energy

  .return:
    PLX : PLB : PLP
    RTL

  .noDamage:
    NOP ; >.<
    BRA .return


;;; $DF80: Restore [A] missiles to Samus ;;;
Restore_A_Missiles_ToSamus:
;; Parameters:
;;     A: Missiles

; Samus reserve missiles = min(99, [Samus max missiles], [Samus reserve missiles] + max(0, [Samus missiles] + [A] - [Samus max missiles]))
; Samus missiles = min([Samus missiles] + [A], [Samus max missiles])

; This is the only routine that uses Samus reserve missiles (other than RAM clearing routines)
    PHP : PHB
    PHK : PLB
    REP #$30
    CLC : ADC.W Missiles : STA.W Missiles
    CMP.W MaxMissiles : BMI .return
    SEC : SBC.W MaxMissiles : STA.B DP_Temp12
    LDA.W MaxMissiles : CMP.W #$0063 : BMI .lessThan99
    LDA.B DP_Temp12 : CLC : ADC.W ReserveMissiles : STA.W ReserveMissiles
    CMP.W #$0063 : BMI .maxMissiles
    LDA.W #$0063 : STA.W ReserveMissiles
    BRA .maxMissiles

  .lessThan99:
    LDA.B DP_Temp12 : CLC : ADC.W ReserveMissiles : STA.W ReserveMissiles
    CMP.W MaxMissiles : BMI .maxMissiles
    LDA.W MaxMissiles : STA.W ReserveMissiles

  .maxMissiles:
    LDA.W MaxMissiles : STA.W Missiles

  .return:
    PLB : PLP
    RTL


;;; $DFD3: Restore [A] super missiles to Samus ;;;
Restore_A_SuperMissiles_ToSamus:
;; Parameters:
;;     A: Super missiles
    PHP : PHB
    PHK : PLB
    REP #$30
    CLC : ADC.W SuperMissiles : STA.W SuperMissiles
    CMP.W MaxSuperMissiles : BMI .return
    BEQ .return
    LDA.W MaxSuperMissiles : STA.W SuperMissiles

  .return:
    PLB : PLP
    RTL


;;; $DFF0: Restore [A] power bombs to Samus ;;;
Restore_A_PowerBombs_ToSamus:
;; Parameters:
;;     A: Power bombs
    PHP : PHB
    PHK : PLB
    REP #$30
    CLC : ADC.W PowerBombs : STA.W PowerBombs
    CMP.W MaxPowerBombs : BMI .return
    BEQ .return
    LDA.W MaxPowerBombs : STA.W PowerBombs

  .return:
    PLB : PLP
    RTL


;;; $E00D: Initialise Samus ;;;
InitializeSamus:
; Executed when loading demo or starting at Ceres/Zebes
    PHP : PHB
    PHK : PLB
    REP #$30
    LDA.W DebugInvincibility : STA.B DP_Temp12
    LDX.W #DistanceToEjectSamusDownDueToPostGrappleCollision+1
    SEP #$20
    LDA.B #$00

  .loopClearSamusRAM:
    STA.W $0000,X
    DEX : CPX.W #unused0A02 : BPL .loopClearSamusRAM
    REP #$20
    LDA.W GameState : CMP.W #$0028 : BEQ .demo
    LDA.L SRAMMirror_LoadingGameState : CMP.W #$0022 : BNE .notZebesLanding
    LDA.W #RTL_90E8CD : STA.W CurrentStateHandler
    LDA.W #SamusNewStateHandler_SamusIsLocked : STA.W NewStateHandler
    LDA.W #SamusDrawingHandler_Default : STA.W DrawingHandler
    LDA.W #$FFFF : STA.W ProspectivePoseChangeCommand
    STZ.W SpecialProspectivePoseChangeCommand : STZ.W SuperSpecialProspectivePoseChangeCommand
    JSL LoadSamusSuitPalette
    LDA.W #SamusPoseInputHandler_Normal : STA.W PoseInputHandler
    BRA .demo

  .notZebesLanding:
    LDA.W #RTL_90E8CD : STA.W CurrentStateHandler
    LDA.W #SamusNewStateHandler_SamusAppearance : STA.W NewStateHandler
    LDA.W #SamusDrawingHandler_Default : STA.W DrawingHandler
    STZ.W ProspectivePoseChangeCommand : STZ.W SpecialProspectivePoseChangeCommand : STZ.W SuperSpecialProspectivePoseChangeCommand
    LDA.W #SamusPoseInputHandler_Normal : STA.W PoseInputHandler
    LDA.B DP_Temp12 : STA.W DebugInvincibility

  .demo:
    LDA.W #$FFFF
    STA.W ProspectivePose : STA.W SpecialProspectivePose : STA.W SuperSpecialProspectivePose
    LDA.W AreaIndex : CMP.W #$0006 : BNE .notCeres
    LDA.W #SamusTimerHackHandler_HandleTimer : STA.W HackHandler
    BRA +

  .notCeres:
    LDA.W #RTS_90E90E : STA.W HackHandler

+   LDA.W #SamusMovementHandler_Normal : STA.W MovementHandler
    LDA.W #RTS_90F534 : STA.W DebugCommandPointer
    LDA.W #$0032 : STA.W PreviousEnergyHurtCheck
    LDA.W #$0601 : STA.W VisorPaletteTimer
    LDX.W #$0000

  .loopProjectilePreInstructions:
    LDA.W #RTS_90B169 : STA.W SamusProjectile_PreInstructions,X
    INX #2 : CPX.W #$0014 : BMI .loopProjectilePreInstructions
    LDA.W #GrappleBeamFunction_Inactive : STA.W GrappleBeam_Function
    LDA.W #$0003 : STA.W HorizontalSlopeCollision
    STZ.W HurtFlashCounter : STZ.W SuperSpecialPaletteFlags
    LDA.L SamusPhysicsConstants_CameraXSubOffsetFromSamusWhenTurning : STA.W CameraXSubSpeed
    LDA.L SamusPhysicsConstants_CameraXOffsetFromSamusWhenTurning : STA.W CameraXSpeed
    LDA.L SamusPhysicsConstants_CameraYSubOffsetFromSamusWhenTurning : STA.W CameraYSubSpeed
    LDA.L SamusPhysicsConstants_CameraYOffsetFromSamusWhenTurning : STA.W CameraYSpeed
    LDX.W #$01FE
    LDA.W #$00FF

  .loopSamusHDMATables:
    STA.L SuitPickupWindow1HDMADataTable,X
    DEX #2 : BPL .loopSamusHDMATables
    LDA.L SamusPhysicsConstants_YSubAccelerationInAir : STA.W SamusYSubAcceleration
    LDA.L SamusPhysicsConstants_YAccelerationInAir : STA.W SamusYAcceleration
    LDA.W #$FFFF : STA.W FX_YPosition : STA.W FX_LavaAcidYPosition
    JSL Update_Beam_Tiles_and_Palette
    STZ.W CinematicFunction
    STZ.W Pose : STZ.W PoseXDirection
    STZ.W PreviousPose : STZ.W PreviousPoseXDirection
    STZ.W LastDifferentPose : STZ.W LastDifferentPoseXDirection
    LDA.W #$FFFF : STA.W EnemyIndexToShake
    STZ.W SelectedHUDItem : STZ.W AutoCancelHUDItemIndex
    STZ.W SamusInvincibilityTimer : STZ.W SamusKnockbackTimer
    STZ.W HurtFlashCounter : STZ.W DebugInvincibility
    LDA.W GameState : CMP.W #$0028 : BNE .notDemo
    JSR LoadDemoData

  .notDemo:
    LDA.W Energy : STA.W PreviousEnergyHurtCheck
    PLB : PLP
    RTL


;;; $E16D: X-ray setup ;;;
XraySetup:
;; Returns:
;;     Carry: set for success, clear for error
    PHP : PHB
    PHK : PLB
    REP #$30
    LDA.W SamusProjectile_CooldownTimer : CMP.W #$0007 : BNE +
    LDA.W SamusProjectile_BombCounter : CMP.W #$0005 : BNE +
    LDA.W XSpeedDivisor : CMP.W #$0002 : BEQ .returnCarryClear

+   LDA.W Pose : CMP.W #$00A4 : BMI .notLanding
    CMP.W #$00A8 : BMI .returnCarryClear
    CMP.W #$00E0 : BMI .notLanding
    CMP.W #$00E8 : BMI .returnCarryClear

  .notLanding:
    LDA.W GameState : CMP.W #$0008 : BNE .returnCarryClear
    LDA.W PowerBombExplosionStatus : BNE .returnCarryClear
    LDA.W SamusYSpeed : BNE .returnCarryClear
    LDA.W SamusYSubSpeed : BNE .returnCarryClear
    LDA.W PreviousMovementTypeXray : AND.W #$00FF : TAX
    LDA.W .allowedPoses,X : AND.W #$00FF : BEQ .returnCarryClear
    LDA.W MovementType : AND.W #$00FF : TAX
    LDA.W .allowedPoses,X : AND.W #$00FF : CMP.W #$0001 : BEQ .standing
    CMP.W #$0002 : BEQ .crouching

  .returnCarryClear:
    PLB : PLP
    CLC
    RTL

  .standing:
    LDA.W PoseXDirection : AND.W #$00FF : CMP.W #$0004 : BEQ .standingLeft
    LDA.W #$00D5 : STA.W SpecialProspectivePose
    BRA .merge

  .standingLeft:
    LDA.W #$00D6 : STA.W SpecialProspectivePose
    BRA .merge

  .crouching:
    LDA.W PoseXDirection : AND.W #$00FF : CMP.W #$0004 : BEQ .crouchingLeft
    LDA.W #$00D9 : STA.W SpecialProspectivePose
    BRA .merge

  .crouchingLeft:
    LDA.W #$00DA : STA.W SpecialProspectivePose

  .merge:
    LDA.W #$0001 : STA.W TimeIsFrozenFlag
    LDA.W #$0005 : STA.W SpecialProspectivePoseChangeCommand
    LDX.W #$01FE

  .loop:
    LDA.W #$00FF : STA.L XrayWindow2HDMADataTable,X
    DEX #2 : BPL .loop
    JSL Disable_Enemy_Projectiles
    JSL Disable_PLMs
    JSL Disable_AnimatedTilesObjects
    JSL Disable_PaletteFXObjects
    LDA.W #$0001 : STA.W Xray_IndirectHDMATable
    LDA.W #XrayWindow2HDMADataTable : STA.W Xray_IndirectHDMATable+1
    STZ.W Xray_IndirectHDMATable+3
    LDA.W #XrayWindow2HDMADataTable+$C8 : STA.W Xray_IndirectHDMATable+4
    LDA.W #$0098 : STA.W Xray_IndirectHDMATable+6
    LDA.W #XrayWindow2HDMADataTable+$190 : STA.W Xray_IndirectHDMATable+7
    STZ.W Xray_IndirectHDMATable+9 : STZ.W Xray_State
    STZ.W Xray_AngularWidthDelta : STZ.W Xray_AngularSubWidthDelta
    STZ.W Xray_AngularWidth : STZ.W Xray_AngularSubWidth
    LDA.W PoseXDirection : AND.W #$00FF : CMP.W #$0004 : BEQ +
    LDA.W #$0040 : STA.W Xray_Angle
    BRA .returnCarrySet

+   LDA.W #$00C0

  .facingLeft:
    STA.W Xray_Angle

  .returnCarrySet:
    PLB : PLP
    SEC
    RTL

  .allowedPoses:
    db $01 ; 0: Standing
    db $01 ; 1: Running
    db $00 ; 2: Normal jumping
    db $00 ; 3: Spin jumping
    db $00 ; 4: Morph ball - on ground
    db $02 ; 5: Crouching
    db $00 ; 6: Falling
    db $00 ; 7: Unused
    db $00 ; 8: Morph ball - falling
    db $00 ; 9: Unused
    db $00 ; Ah: Knockback / crystal flash ending
    db $00 ; Bh: Unused
    db $00 ; Ch: Unused
    db $00 ; Dh: Unused
    db $00 ; Eh: Turning around - on ground
    db $00 ; Fh: Crouching/standing/morphing/unmorphing transition
    db $00 ; 10h: Moonwalking
    db $00 ; 11h: Spring ball - on ground
    db $00 ; 12h: Spring ball - in air
    db $00 ; 13h: Spring ball - falling
    db $00 ; 14h: Wall jumping
    db $01 ; 15h: Ran into a wall
    db $00 ; 16h: Grappling
    db $00 ; 17h: Turning around - jumping
    db $00 ; 18h: Turning around - falling
    db $00 ; 19h: Damage boost
    db $00 ; 1Ah: Grabbed by Draygon
    db $00 ; 1Bh: Shinespark / crystal flash / drained by metroid / damaged by MB's attacks


;;; $E2AD: Set non x-ray Samus pose ;;;
Set_NonXray_SamusPose:
; This routine is responsible for the x-ray stand-up glitch
; The case of [Samus movement type] = turning around isn't considered, and falls into the standing case,
; even if she was crouched whilst turning
    PHP
    REP #$30
    LDA.W MovementType : AND.W #$00FF : CMP.W #$0005 : BEQ .crouching
    LDA.W PoseXDirection : AND.W #$00FF : CMP.W #$0004 : BEQ .facingLeft
    LDA.W #$0001 : STA.W Pose
    BRA .merge

  .facingLeft:
    LDA.W #$0002 : STA.W Pose
    BRA .merge

  .crouching:
    LDA.W PoseXDirection : AND.W #$00FF : CMP.W #$0004 : BEQ .crouchingFacingLeft
    LDA.W #$0027 : STA.W Pose
    BRA .merge

  .crouchingFacingLeft:
    LDA.W #$0028 : STA.W Pose

  .merge:
    JSL InitializeSamusPose_1
    JSL Set_Samus_AnimationFrame_if_PoseChanged
    LDA.W PreviousPose : STA.W LastDifferentPose
    LDA.W PreviousPoseXDirection : STA.W LastDifferentPoseXDirection
    LDA.W Pose : STA.W PreviousPose
    LDA.W PoseXDirection : STA.W PreviousPoseXDirection
    LDA.W #SamusMovementHandler_Normal : STA.W MovementHandler
    LDA.W #SamusPoseInputHandler_Normal : STA.W PoseInputHandler
    LDA.W #$FFFF : STA.W Xray_BeamSizeFlag
    LDA.W Pose : ASL #3 : TAX
    LDA.L PoseDefinitions_YRadius,X : AND.W #$00FF : SEC : SBC.W SamusYRadius : STA.B DP_Temp12 : BMI .unfreezeEnvironment
    LDA.W SamusYPosition : SEC : SBC.B DP_Temp12 : STA.W SamusYPosition : STA.W SamusPreviousYPosition

  .unfreezeEnvironment:
    JSL Enable_Enemy_Projectiles
    JSL Enable_PLMs
    JSL Enable_AnimatedTilesObjects
    JSL Enable_PaletteFXObjects
    PLP
    RTL


;;; $E355: Debug. Handle debug mode select + L + B ;;;
Debug_HandleSelectL_B:
; Give ammo, all items, switch to next beam configuration, toggle Samus tile viewer
    PHP
    REP #$30
    LDA.W Debug_InputL : AND.W #$8000 : BNE .checkTileViewer
    JMP .handledInput

  .checkTileViewer:
    LDA.W DebugSamusTileViewerFlag : BEQ .toggleOn
    JMP .toggleOff

  .toggleOn:
    LDA.W #$0001 : STA.W DebugSamusTileViewerFlag
    LDA.W EquippedBeams : INC : STA.W EquippedBeams
    AND.W #$0FFF : CMP.W #$000C : BMI +
    LDA.W EquippedBeams : AND.W #$F000 : STA.W EquippedBeams

+   JSL Update_Beam_Tiles_and_Palette
    LDA.W #$F33F : STA.W CollectedItems : STA.W EquippedItems ; Same extra bit (10) as GT Code
    LDA.W #$0384 : STA.W MaxMissiles : STA.W Missiles
    LDA.W #$005A : STA.W MaxSuperMissiles : STA.W SuperMissiles
    LDA.W #$005A : STA.W MaxPowerBombs : STA.W PowerBombs
    LDA.W #$044B : STA.W MaxEnergy : STA.W Energy
    LDA.W #$01F3 : STA.W ReserveEnergy
    STZ.W ReserveMissiles
    LDA.W #$100F : STA.W CollectedBeams
    LDA.W EquippedBeams : ORA.W #$1000 : STA.W EquippedBeams
    JSL AddGrappleToHUDTilemap
    JSL AddXrayToHUDTilemap
    JSL AddMissilesToHUDTilemap
    JSL AddSuperMissilesToHUDTilemap
    JSL AddPowerBombsToHUDTilemap
    BRA .handledInput

  .toggleOff:
    STZ.W DebugSamusTileViewerFlag

  .handledInput:
    LDA.W DebugSamusTileViewerFlag : BEQ .return
    JSL Debug_SamusTileViewer

  .return:
    PLP
    RTL


;;; $E3F6: Make Samus face forward ;;;
MakeSamusFaceForward:
    PHP : PHB
    PHK : PLB
    REP #$30
    PHX
    LDA.W EquippedItems : BIT.W #$0020 : BNE .suited
    BIT.W #$0001 : BNE .suited
    LDA.W #$0000 : STA.W Pose
    BRA .initSamus

  .suited:
    LDA.W #$009B : STA.W Pose

  .initSamus:
    JSL InitializeSamusPose_1
    JSL Set_Samus_AnimationFrame_if_PoseChanged
    LDA.W PreviousPose : STA.W LastDifferentPose
    LDA.W PreviousPoseXDirection : STA.W LastDifferentPoseXDirection
    LDA.W Pose : STA.W PreviousPose
    LDA.W PoseXDirection : STA.W PreviousPoseXDirection
    LDA.W SamusYRadius : CMP.W #$0018 : BEQ .facingForwardRadius18
    LDA.W SamusYPosition : SEC : SBC.W #$0003 : STA.W SamusYPosition : STA.W SamusPreviousYPosition

  .facingForwardRadius18:
    LDA.W #SamusCurrentStateHandler_SamusIsLocked : STA.W CurrentStateHandler
    LDA.W #SamusNewStateHandler_SamusIsLocked : STA.W NewStateHandler
    LDA.W #$FFFF
    STA.W ProspectivePose : STA.W SpecialProspectivePose : STA.W SuperSpecialProspectivePose
    STZ.W ProspectivePoseChangeCommand : STZ.W SpecialProspectivePoseChangeCommand : STZ.W SuperSpecialProspectivePoseChangeCommand
    LDA.W #$001F
    JSL Run_Samus_Command
    STZ.W SamusXExtraRunSpeed : STZ.W SamusXExtraRunSubSpeed
    STZ.W SamusXBaseSpeed : STZ.W SamusXBaseSubSpeed
    STZ.W SamusYSubSpeed : STZ.W SamusYSpeed
    STZ.W SamusYDirection : STZ.W MorphBallBounceState
    STZ.W SamusXAccelerationMode
    STZ.W SamusProjectile_FlareCounter : STZ.W SamusProjectile_FlareAnimationFrame
    STZ.W SamusProjectile_FlareSlowSparksAnimationFrame0CD8 : STZ.W SamusProjectile_FlareFastSparksAnimationFrame0CDA
    STZ.W SamusProjectile_FlareAnimationTimer
    STZ.W SamusProjectile_FlareSlowSparksAnimationFrame0CDE : STZ.W SamusProjectile_FlareFastSparksAnimationFrame0CE0
    JSL LoadSamusSuitPalette
    PLX : PLB : PLP
    RTL


;;; $E4AD: Drained Samus controller ;;;
DrainedSamusController:
;; Parameters:
;;     A: Function index
;;         0: Let drained Samus fall
;;         1: Put Samus into standing drained pose
;;         2: Release Samus from drained pose
;;         3: Enable hyper beam
;;         4: Put Samus into crouching/falling drained pose

; Very similar to Run_Samus_Command
    PHP : PHB
    PHK : PLB
    REP #$30
    PHX : PHY
    ASL : TAX
    JSR.W (.pointers,X)
    BCC .return
    LDA.W PreviousPose : STA.W LastDifferentPose
    LDA.W PreviousPoseXDirection : STA.W LastDifferentPoseXDirection
    LDA.W Pose : STA.W PreviousPose
    LDA.W PoseXDirection : STA.W PreviousPoseXDirection
    LDA.W #$FFFF
    STA.W ProspectivePose : STA.W SpecialProspectivePose : STA.W SuperSpecialProspectivePose
    STZ.W ProspectivePoseChangeCommand : STZ.W SpecialProspectivePoseChangeCommand : STZ.W SuperSpecialProspectivePoseChangeCommand

  .return:
    PLY : PLX : PLB : PLP
    RTL

  .pointers:
    dw DrainedSamusController_0_LetDrainedSamusFall
    dw DrainedSamusController_1_PutSamusIntoStandingDrainedPose
    dw DrainedSamusController_2_ReleaseSamusFromDrainedPose
    dw DrainedSamusController_3_EnableHyperBeam
    dw DrainedSamusController_4_SetSamusCrouchingFallingDrainedPose


;;; $E4F8: Drained Samus controller - 0: let drained Samus fall ;;;
DrainedSamusController_0_LetDrainedSamusFall:
;; Returns:
;;     Carry: Set. Cancel any pending pose transition
    LDA.W #$0015 : SEC : SBC.W SamusYRadius : STA.B DP_Temp12
    LDA.W SamusYPosition : SEC : SBC.B DP_Temp12 : STA.W SamusYPosition : STA.W SamusPreviousYPosition
    LDA.W PoseXDirection : AND.W #$00FF : CMP.W #$0004 : BEQ .facingLeft
    LDA.W #$00E8 : STA.W Pose
    BRA +

  .facingLeft:
    LDA.W #$00E9 : STA.W Pose

+   LDA.W #$0002 : STA.W NewPoseSamusAnimationFrame
    JSL InitializeSamusPose_1
    JSL Set_Samus_AnimationFrame_if_PoseChanged
    LDA.W Pose : ASL #3 : TAX
    LDA.W PoseDefinitions_YRadius,X : AND.W #$00FF : STA.W SamusYRadius
    STZ.W SamusXBaseSpeed : STZ.W SamusXBaseSubSpeed
    STZ.W SamusYSubSpeed : STZ.W SamusYSpeed
    LDA.W #$0002 : STA.W SamusYDirection
    STZ.W SamusProjectile_FlareCounter : STZ.W SamusProjectile_FlareAnimationFrame
    STZ.W SamusProjectile_FlareSlowSparksAnimationFrame0CD8 : STZ.W SamusProjectile_FlareFastSparksAnimationFrame0CDA
    STZ.W SamusProjectile_FlareAnimationTimer
    STZ.W SamusProjectile_FlareSlowSparksAnimationFrame0CDE : STZ.W SamusProjectile_FlareFastSparksAnimationFrame0CE0
    JSL LoadSamusSuitPalette
    SEC
    RTS


;;; $E571: Drained Samus controller - 1: put Samus into standing drained pose ;;;
DrainedSamusController_1_PutSamusIntoStandingDrainedPose:
;; Returns:
;;     Carry: Set. Cancel any pending pose transition
    LDA.W #$0010 : STA.W SamusAnimationFrameTimer
    STZ.W SamusAnimationFrame
    LDA.W PoseXDirection : AND.W #$00FF : CMP.W #$0004 : BEQ .facingLeft
    LDA.W #$00EA : STA.W Pose
    BRA +

  .facingLeft:
    LDA.W #$00EB : STA.W Pose

+   LDA.W #RTS_90E90E : STA.W HackHandler
    SEC
    RTS


;;; $E59B: Drained Samus controller - 2: release Samus from drained pose ;;;
DrainedSamusController_2_ReleaseSamusFromDrainedPose:
;; Returns:
;;     Carry: Set. Cancel any pending pose transition
    LDA.W Pose : CMP.W #$00E8 : BEQ .crouchingFalling
    CMP.W #$00E9 : BEQ .crouchingFalling
    CMP.W #$00EA : BEQ .drainedStanding
    CMP.W #$00EB : BNE .merge

  .drainedStanding:
    LDA.W #$0001 : STA.W SamusAnimationFrameTimer
    LDA.W #$0004 : STA.W SamusAnimationFrame
    BRA .merge

  .crouchingFalling:
    LDA.W #$0001 : STA.W SamusAnimationFrameTimer
    LDA.W #$000D : STA.W SamusAnimationFrame

  .merge:
    LDA.W Pose : ASL #3 : TAX
    LDA.W PoseDefinitions_YRadius,X : AND.W #$00FF : STA.W SamusYRadius
    STZ.W SamusXBaseSpeed : STZ.W SamusXBaseSubSpeed
    STZ.W SamusYSubSpeed : STZ.W SamusYSpeed
    LDA.W #$0002 : STA.W SamusYDirection
    SEC
    RTS


;;; $E5F0: Drained Samus controller - 3: enable hyper beam ;;;
DrainedSamusController_3_EnableHyperBeam:
;; Returns:
;;     Carry: Clear. Allow any pending pose transition
    LDA.W #$1009 : STA.W EquippedBeams
    JSL Update_Beam_Tiles_and_Palette
    LDY.W #PaletteFXObjects_HyperBeam
    JSL Spawn_PaletteFXObject
    LDA.W #$8000 : STA.W HyperBeam
    STZ.W ResumeChargingBeamSFXFlag
    CLC
    RTS


;;; $E60C: Drained Samus controller - 4: put Samus into crouching/falling drained pose ;;;
DrainedSamusController_4_SetSamusCrouchingFallingDrainedPose:
;; Returns:
;;     Carry: Set. Cancel any pending pose transition
    LDA.W #$0010 : STA.W SamusAnimationFrameTimer
    LDA.W #$0008 : STA.W SamusAnimationFrame
    LDA.W PoseXDirection : AND.W #$00FF : CMP.W #$0004 : BEQ .facingLeft
    LDA.W #$00E8 : STA.W Pose
    SEC
    RTS

  .facingLeft:
    LDA.W #$00E9 : STA.W Pose
    SEC
    RTS


;;; $E633: Update Samus pose due to change of equipment ;;;
UpdateSamusPoseDueToChangeOfEquipment:
; This comment seems a bit outdated
; Called by SamusCommand_C_UpdateSamusDueToUnpause
; Seems to have been coded far more generally than for just map station release
; Notably, this handles equipping speed booster mid-run
; (if it did not, the speed boost timer might be 0 and underflow during the speed boost check $90:857D)
    PHP : PHB
    PHK : PLB
    REP #$30
    LDA.W MovementType : AND.W #$00FF : ASL : TAX
    JSR.W (.pointers,X)
    LDA.W EquippedItems : BIT.W #$2000 : BNE .speedBoosterEquipped
    STZ.W SpeedEcho_Index
    STZ.W SpeedEcho_XSpeed0 : STZ.W SpeedEcho_XSpeed1
    STZ.W SamusRunningMomentumFlag : STZ.W SamusBoostTimer
    STZ.W SpecialSamusPaletteFrame : STZ.W CommonPaletteTimer
    STZ.W SpeedEcho_XPosition0 : STZ.W SpeedEcho_XPosition1
    STZ.W SpeedEcho_YPosition0 : STZ.W SpeedEcho_YPosition1
    BRA +

  .speedBoosterEquipped:
    LDA.W SamusRunningMomentumFlag : BEQ +
    LDA.W SamusBoostTimer : BNE +
    STA.W CommonPaletteTimer
    STZ.W SpecialSamusPaletteFrame
    LDA.W SpeedBoostTimerResetValues : STA.W SamusBoostTimer

+   LDA.W GrappleBeam_Function : CMP.W #GrappleBeamFunction_Inactive : BEQ .checkCharge
    LDA.W #$0002
    JSL Load_Beam_Palette_External
    LDA.W #$0006
    JSL QueueSound_Lib1_Max6
    BRA .playedSFX

  .checkCharge:
    LDA.W EquippedBeams : BIT.W #$1000 : BNE .chargeEquipped
    STZ.W SamusProjectile_FlareCounter : STZ.W SamusProjectile_FlareAnimationFrame
    STZ.W SamusProjectile_FlareSlowSparksAnimationFrame0CD8 : STZ.W SamusProjectile_FlareFastSparksAnimationFrame0CDA
    STZ.W SamusProjectile_FlareAnimationTimer
    STZ.W SamusProjectile_FlareSlowSparksAnimationFrame0CDE : STZ.W SamusProjectile_FlareFastSparksAnimationFrame0CE0
    BRA .playedSFX

  .chargeEquipped:
    LDA.W SamusProjectile_FlareCounter : CMP.W #$0010 : BMI .playedSFX
    LDA.W #$0041
    JSL QueueSound_Lib1_Max6

  .playedSFX:
    JSL LoadSamusSuitPalette
    LDA.W Energy : CMP.W #$001F : BPL .return
    LDA.W #$0002
    JSL QueueSound_Lib3_Max6

  .return:
    PLB : PLP
    RTL

  .pointers:
    dw UpdateSamusPoseEquipment_Standing                                 ; *0: Standing
    dw RTS_91E732                                                        ;  1: Running
    dw RTS_91E732                                                        ;  2: Normal jumping
    dw UpdateSamusPoseEquipment_SpinJumping                              ; *3: Spin jumping
    dw UpdateSamusPoseEquipment_MorphBall                                ; *4: Morph ball - on ground
    dw RTS_91E732                                                        ;  5: Crouching
    dw RTS_91E732                                                        ;  6: Falling
    dw RTS_91E732                                                        ;  7: Unused
    dw UpdateSamusPoseEquipment_MorphBall                                ; *8: Morph ball - falling
    dw RTS_91E732                                                        ;  9: Unused
    dw RTS_91E732                                                        ;  Ah: Knockback / crystal flash ending
    dw RTS_91E732                                                        ;  Bh: Unused
    dw RTS_91E732                                                        ;  Ch: Unused
    dw RTS_91E732                                                        ;  Dh: Unused
    dw RTS_91E732                                                        ;  Eh: Turning around - on ground
    dw RTS_91E732                                                        ;  Fh: Crouching/standing/morphing/unmorphing transition
    dw RTS_91E732                                                        ;  10h: Moonwalking
    dw UpdateSamusPoseEquipment_SpringBall                               ; *11h: Spring ball - on ground
    dw UpdateSamusPoseEquipment_SpringBall                               ; *12h: Spring ball - in air
    dw UpdateSamusPoseEquipment_SpringBall                               ; *13h: Spring ball - falling
    dw UpdateSamusPoseEquipment_WallJumping                              ; *14h: Wall jumping
    dw RTS_91E732                                                        ;  15h: Ran into a wall
    dw RTS_91E732                                                        ;  16h: Grappling
    dw RTS_91E732                                                        ;  17h: Turning around - jumping
    dw RTS_91E732                                                        ;  18h: Turning around - falling
    dw RTS_91E732                                                        ;  19h: Damage boost
    dw RTS_91E732                                                        ;  1Ah: Grabbed by Draygon
    dw RTS_91E732                                                        ;  1Bh: Shinespark / crystal flash / drained by metroid / damaged by MB's attacks


;;; $E719: Update Samus previous pose ;;;
UpdateSamusPreviousPose:
    LDA.W PreviousPose : STA.W LastDifferentPose
    LDA.W PreviousPoseXDirection : STA.W LastDifferentPoseXDirection
    LDA.W Pose : STA.W PreviousPose
    LDA.W PoseXDirection : STA.W PreviousPoseXDirection
    RTS


;;; $E732: RTS ;;;
RTS_91E732:
    RTS


;;; $E733: Update Samus pose due to change of equipment - standing ;;;
UpdateSamusPoseEquipment_Standing:
    LDA.W Pose : CMP.W #$0000 : BEQ .facingForward ; >.<
    CMP.W #$009B : BEQ .suited
    RTS

  .facingForward:
    LDA.W EquippedItems : BIT.W #$0001 : BNE .upgradeSuit
    BIT.W #$0020 : BNE .upgradeSuit
    RTS

  .upgradeSuit:
    LDA.W #$009B : STA.W Pose
    BRA .poseChanged

  .suited:
    LDA.W EquippedItems : BIT.W #$0001 : BNE .return
    BIT.W #$0020 : BNE .return
    LDA.W #$0000 : STA.W Pose

  .poseChanged:
    JSL InitializeSamusPose_1
    JSL Set_Samus_AnimationFrame_if_PoseChanged
    JSR UpdateSamusPreviousPose

  .return:
    RTS


;;; $E776: Update Samus pose due to change of equipment - spin jumping ;;;
UpdateSamusPoseEquipment_SpinJumping:
    LDA.W PoseXDirection : AND.W #$00FF : CMP.W #$0004 : BEQ .facingLeft
    LDA.W #$0108 : STA.W PreviousPoseXDirection
    BRA .checkSpaceScrew

  .facingLeft:
    LDA.W #$0104 : STA.W PreviousPoseXDirection

  .checkSpaceScrew:
    LDA.W Pose : CMP.W #$0081 : BEQ .screwAttack
    CMP.W #$0082 : BEQ .screwAttack
    CMP.W #$001B : BEQ .spaceJump
    CMP.W #$001C : BEQ .spaceJump
    BRA .merge

  .spaceJump:
    LDA.W EquippedItems : BIT.W #$0008 : BNE .changeToScrewAttack
    BIT.W #$0200 : BEQ .changeToSpinJump
    BRA .merge

  .screwAttack:
    LDA.W EquippedItems : BIT.W #$0008 : BNE .merge
    BIT.W #$0200 : BNE .changeToSpaceJump
    BRA .changeToSpinJump

  .changeToScrewAttack:
    LDA.W PoseXDirection : AND.W #$00FF : CMP.W #$0004 : BEQ ..facingLeft
    LDA.W #$0081 : STA.W Pose
    BRA .merge

  ..facingLeft:
    LDA.W #$0082 : STA.W Pose
    BRA .merge

  .changeToSpaceJump:
    LDA.W PoseXDirection : AND.W #$00FF : CMP.W #$0004 : BEQ ..facingLeft
    LDA.W #$001B : STA.W Pose
    BRA .merge

  ..facingLeft:
    LDA.W #$001C : STA.W Pose
    BRA .merge

  .changeToSpinJump:
    LDA.W PoseXDirection : AND.W #$00FF : CMP.W #$0004 : BEQ ..facingLeft
    LDA.W #$0019 : STA.W Pose
    BRA .merge

  ..facingLeft:
    LDA.W #$001A : STA.W Pose

  .merge:
    JSL InitializeSamusPose_1
    JSL Set_Samus_AnimationFrame_if_PoseChanged
    LDA.W PoseXDirection : AND.W #$00FF : CMP.W #$0004 : BEQ ..facingLeft
    LDA.W #$0308 : STA.W PreviousPoseXDirection
    BRA +

  ..facingLeft:
    LDA.W #$0304 : STA.W PreviousPoseXDirection

+   JSR UpdateSamusPreviousPose
    RTS


;;; $E83A: Update Samus pose due to change of equipment - morph ball ;;;
UpdateSamusPoseEquipment_MorphBall:
    LDA.W EquippedItems : BIT.W #$0002 : BEQ .return
    LDA.W PoseXDirection : AND.W #$00FF : CMP.W #$0004 : BEQ .facingLeft
    LDA.W #$0079 : STA.W Pose
    BRA +

  .facingLeft:
    LDA.W #$007A : STA.W Pose

+   JSL InitializeSamusPose_1
    JSL Set_Samus_AnimationFrame_if_PoseChanged
    JSR UpdateSamusPreviousPose

  .return:
    RTS


;;; $E867: Update Samus pose due to change of equipment - spring ball ;;;
UpdateSamusPoseEquipment_SpringBall:
    LDA.W EquippedItems : BIT.W #$0002 : BNE .return
    LDA.W PoseXDirection : AND.W #$00FF : CMP.W #$0004 : BEQ .facingLeft
    LDA.W #$001D : STA.W Pose
    BRA +

  .facingLeft:
    LDA.W #$0041 : STA.W Pose

+   JSL InitializeSamusPose_1
    JSL Set_Samus_AnimationFrame_if_PoseChanged
    JSR UpdateSamusPreviousPose

  .return:
    RTS


;;; $E894: Update Samus pose due to change of equipment - wall jumping ;;;
UpdateSamusPoseEquipment_WallJumping:
    LDA.W EquippedItems : BIT.W #$0008 : BNE .screwAttack
    BIT.W #$0200 : BNE .spaceJump
    LDA.W #$0003 : STA.W SamusAnimationFrame
    RTS

  .spaceJump:
    LDA.W #$000D : STA.W SamusAnimationFrame
    RTS

  .screwAttack:
    LDA.W #$0017 : STA.W SamusAnimationFrame
    RTS


;;; $E8B6: Set prospective Samus pose according to solid vertical collision result ;;;
SetProspectiveSamusPoseAccordingToSolidVerticalCollision_PSP:
; Called by "active" NewStateHandler handlers (where active = normal or title/intro demo)
    PHP : PHB
    PHK : PLB
    REP #$30
    LDA.W SamusSolidVerticalCollisionResult : BEQ .return
    AND.W #$00FF : ASL : TAX
    JSR.W (.pointers,X)

  .return:
    PLB : PLP
    RTL

  .pointers:
    dw RTS_91EFC3
    dw PSP_Landed
    dw PSP_Falling
    dw UNUSED_PSP_91E8D8
    dw PSP_HitCeiling
    dw PSP_WallJumpTriggered


;;; $E8D8: Set prospective Samus pose according to solid vertical collision result - unused ;;;
UNUSED_PSP_91E8D8:
; Set pose for unwritten Samus movement
; Clone of PSP_HitCeiling
    LDA.W Pose : STA.W ProspectivePose
    LDA.W #$0005 : STA.W ProspectivePoseChangeCommand
    RTS


;;; $E8E5: Set prospective Samus pose according to solid vertical collision result - hit ceiling ;;;
PSP_HitCeiling:
; Set pose for Samus upward movement after collision with block or solid enemy
    LDA.W Pose : STA.W ProspectivePose
    LDA.W #$0005 : STA.W ProspectivePoseChangeCommand
    RTS


;;; $E8F2: Set prospective Samus pose according to solid vertical collision result - falling ;;;
PSP_Falling:
    LDA.W SamusDownwardsMovementSolidCollisionResult : AND.W #$00FF : CMP.W #$0004 : BNE .changed
    RTS

  .changed:
    ASL #2 : TAX
    LDA.W PoseXDirection : AND.W #$00FF : CMP.W #$0004 : BEQ .facingLeft
    LDA.W .right,X : STA.W ProspectivePose
    BRA +

  .facingLeft:
    LDA.W .left,X : STA.W ProspectivePose

+   LDA.W #$0005 : STA.W ProspectivePoseChangeCommand
    RTS

;        _________ Facing right
;       |      ___ Facing left
;       |     |
  .right:
    dw $0029
  .left:
    dw       $002A ; Falling
    dw $0031,$0032 ; Morph ball - no spring ball - in air
    dw $0033,$0034 ; Unused
    dw $007D,$007E ; Morph ball - spring ball - falling


;;; $E931: Set prospective Samus pose according to solid vertical collision result - landed ;;;
PSP_Landed:
    LDA.W SamusDownwardsMovementSolidCollisionResult : AND.W #$00FF : CMP.W #$0004 : BEQ .return
    ASL : TAX
    JSR.W (.pointers,X)
    BCC .solidVerticalCollision
    LDA.W #$0000 : STA.W ProspectivePoseChangeCommand
    RTS

  .solidVerticalCollision:
    LDA.W #$0005 : STA.W ProspectivePoseChangeCommand

  .return:
    RTS

  .pointers:
    dw PSP_Landed_Grounded
    dw PSP_Landed_MorphBallGrounded
    dw UNUSED_PSP_Landed_91EA48
    dw PSP_Landed_SpringBallGrounded
    dw RTS_91EFC3
    dw UNUSED_PSP_Landed_5_91EAB6


;;; $E95D: Set prospective Samus pose according to solid vertical collision result - landed - grounded ;;;
PSP_Landed_Grounded:
;; Returns:
;;     Carry: clear
    LDA.W PreviousMovementType : AND.W #$00FF : CMP.W #$0003 : BEQ .wasSpinning
    CMP.W #$0014 : BEQ .wasSpinning
    LDA.W Pose : ASL #3 : TAX
    LDA.W PoseDefinitions_directionShotsFired,X : AND.W #$00FF : CMP.W #$00FF : BEQ .noAim
    CMP.W #$0002 : BEQ .aimHorizontal
    CMP.W #$0007 : BEQ .aimHorizontal

  .landingFromNormalJumpNoFire:
    ASL : TAX
    LDA.W .directions,X : STA.W ProspectivePose
    CLC
    RTS

  .landingFromNormalJumpNoShot:
    LDA.W PoseDefinitions_directionShotsFired,X : AND.W #$00FF
    BRA .landingFromNormalJumpNoFire

  .aimHorizontal:
    LDA.B DP_Controller1Input : BIT.W ShotBinding : BEQ .landingFromNormalJumpNoShot
    LDA.W PoseXDirection : AND.W #$00FF : CMP.W #$0004 : BEQ ..facingLeft
    LDA.W #$00E6 : STA.W ProspectivePose
    CLC
    RTS

  ..facingLeft:
    LDA.W #$00E7 : STA.W ProspectivePose
    CLC
    RTS

  .noAim:
    LDA.W PoseXDirection : AND.W #$00FF : CMP.W #$0004 : BEQ ..facingLeft
    LDA.W #$00A4 : STA.W ProspectivePose
    CLC
    RTS

  ..facingLeft:
    LDA.W #$00A5 : STA.W ProspectivePose
    CLC
    RTS

  .wasSpinning:
    LDA.W PoseXDirection : AND.W #$00FF : CMP.W #$0004 : BEQ ..facingLeft
    LDA.W #$00A6 : STA.W ProspectivePose
    CLC
    RTS

  ..facingLeft:
    LDA.W #$00A7 : STA.W ProspectivePose
    CLC
    RTS

  .directions:
    dw $00E0 ; 0: Up, facing right:   Facing right - landing from normal jump - aiming up
    dw $00E2 ; 1: Up-right:           Facing right - landing from normal jump - aiming up-right
    dw $00A4 ; 2: Right:              Facing right - landing from normal jump
    dw $00E4 ; 3: Down-right:         Facing right - landing from normal jump - aiming down-right
    dw $00A4 ; 4: Down, facing right: Facing right - landing from normal jump
    dw $00A5 ; 5: Down, facing left:  Facing left-   landing from normal jump
    dw $00E5 ; 6: Down-left:          Facing left-   landing from normal jump - aiming down-left
    dw $00A5 ; 7: Left:               Facing left-   landing from normal jump
    dw $00E3 ; 8: Up-left:            Facing left-   landing from normal jump - aiming up-left
    dw $00E1 ; 9: Up, facing left:    Facing left-   landing from normal jump - aiming up


;;; $EA07: Set prospective Samus pose according to solid vertical collision result - landed - morph ball grounded ;;;
PSP_Landed_MorphBallGrounded:
;; Returns:
;;     Carry: clear

; TODO: talk about how dequipping spring ball during bounce causes jump table overflow here due to MorphBallBounceState >= 600h
;       need to check other places like SolidVerticalCollision_Landed_MorphBallGrounded too
    LDA.W MorphBallBounceState : ASL : TAX
    JMP.W (.pointers,X)

  .pointers:
    dw PSP_Landed_MorphBallGrounded_NotBouncing
    dw PSP_Landed_MorphBallGrounded_FirstBounce
    dw PSP_Landed_MorphBallGrounded_SecondBounce


;;; $EA15: Set prospective Samus pose according to solid vertical collision result - landed - morph ball grounded - not bouncing ;;;
PSP_Landed_MorphBallGrounded_NotBouncing:
;; Returns:
;;     Carry: clear
    LDA.W SamusYSpeed : CMP.W #$0003 : BMI PSP_Landed_MorphBallGrounded_SecondBounce
    LDA.W Pose : STA.W ProspectivePose
    CLC
    RTS


;;; $EA25: Set prospective Samus pose according to solid vertical collision result - landed - morph ball grounded - first bounce ;;;
PSP_Landed_MorphBallGrounded_FirstBounce:
;; Returns:
;;     Carry: clear
    LDA.W Pose : STA.W ProspectivePose
    CLC
    RTS


;;; $EA2D: Set prospective Samus pose according to solid vertical collision result - landed - morph ball grounded - second bounce ;;;
PSP_Landed_MorphBallGrounded_SecondBounce:
;; Returns:
;;     Carry: clear
    LDA.W PoseXDirection : AND.W #$00FF : CMP.W #$0004 : BEQ .facingLeft
    LDA.W #$001D : STA.W ProspectivePose
    BRA .return

  .facingLeft:
    LDA.W #$0041 : STA.W ProspectivePose

  .return:
    CLC
    RTS


;;; $EA48: Set prospective Samus pose according to solid vertical collision result - landed - unused ;;;
UNUSED_PSP_Landed_91EA48:
;; Returns:
;;     Carry: clear
    LDA.W PoseXDirection : AND.W #$00FF : CMP.W #$0004 : BEQ .facingLeft
    LDA.W #$0020 : STA.W ProspectivePose
    BRA .return

  .facingLeft:
    LDA.W #$0042 : STA.W ProspectivePose

  .return:
    CLC
    RTS


;;; $EA63: Set prospective Samus pose according to solid vertical collision result - landed - spring ball grounded ;;;
PSP_Landed_SpringBallGrounded:
;; Returns:
;;     Carry: clear
    LDA.B DP_Controller1Input : BIT.W JumpBinding : BEQ .pressingJump
    LDA.W Pose : STA.W ProspectivePose
    CLC
    RTS

  .pressingJump:
    LDA.W MorphBallBounceState : AND.W #$00FF : ASL : TAX
    JMP.W (.pointers,X)

  .pointers:
    dw PSP_Landed_SpringBallGrounded_NotBouncing
    dw PSP_Landed_SpringBallGrounded_FirstBounce
    dw PSP_Landed_SpringBallGrounded_SecondBounce


;;; $EA83: Set prospective Samus pose according to solid vertical collision result - landed - spring ball grounded - not bouncing ;;;
PSP_Landed_SpringBallGrounded_NotBouncing:
    LDA.W SamusYSpeed : CMP.W #$0003 : BMI PSP_Landed_SpringBallGrounded_SecondBounce
    LDA.W Pose : STA.W ProspectivePose
    CLC
    RTS


;;; $EA93: Set prospective Samus pose according to solid vertical collision result - landed - spring ball grounded - first bounce ;;;
PSP_Landed_SpringBallGrounded_FirstBounce:
;; Returns:
;;     Carry: clear
    LDA.W Pose : STA.W ProspectivePose
    CLC
    RTS


;;; $EA9B: Set prospective Samus pose according to solid vertical collision result - landed - spring ball grounded - second bounce ;;;
PSP_Landed_SpringBallGrounded_SecondBounce:
;; Returns:
;;     Carry: clear
    LDA.W PoseXDirection : AND.W #$00FF : CMP.W #$0004 : BEQ .facingLeft
    LDA.W #$0079 : STA.W ProspectivePose
    BRA .return

  .facingLeft:
    LDA.W #$007A : STA.W ProspectivePose

  .return:
    CLC
    RTS


;;; $EAB6: Set prospective Samus pose according to solid vertical collision result - landed - SamusDownwardsMovementSolidCollisionResult = 5 (unused) ;;;
UNUSED_PSP_Landed_5_91EAB6:
; AFAIK, SamusDownwardsMovementSolidCollisionResult is never 5
    LDA.W Pose : STA.W ProspectivePose
    CLC
    RTS


;;; $EABE: Set prospective Samus pose according to solid vertical collision result - wall jump triggered ;;;
PSP_WallJumpTriggered:
    LDA.W PoseXDirection : AND.W #$00FF : CMP.W #$0004 : BEQ .facingLeft
    LDA.W #$0083 : STA.W ProspectivePose
    BRA +

  .facingLeft:
    LDA.W #$0084 : STA.W ProspectivePose

+   LDA.W #$0005 : STA.W ProspectivePoseChangeCommand
    RTS


;;; $EADE: Check if prospective pose runs into a wall ;;;
CheckIfProspectivePoseRunsIntoAWall:
; Check if Samus ran into a wall this frame, set the prospective pose to ran into a wall with the corresponding arm cannon aim
; Otherwise, if prospective pose is running:
;     Check if Samus can move one pixel horizontally forward,
;     if she would collide with a solid enemy, set the prospective pose to ran into a wall with the corresponding arm cannon aim
;     Otherwise, *move* Samus one pixel horizontally forward,
;     if she collided with a solid block, set the prospective pose to ran into a wall with the corresponding arm cannon aim
; Returned carry is ignored by caller

; This code is responsible for the arm pump bug
; If Samus pose changes from a running pose to another running pose (changing arm cannon aim),
; Samus is moved one pixel horizontally forwards,
; the fact that it's pure horizontal movement causes Samus to sometimes lose contact with downwards slopes
    LDA.W SamusXSpeedKilledDueToCollisionFlag : BEQ .notKilledBySolidCollision
    LDA.W MovementType : AND.W #$00FF : CMP.W #$0001 : BEQ .ranIntoWall

  .notKilledBySolidCollision:
    LDA.W ProspectivePose : CMP.W #$FFFF : BEQ .returnPoseUnchanged
    ASL #3 : TAX
    LDA.W PoseDefinitions_movementType,X : AND.W #$00FF : CMP.W #$0001 : BNE .returnPoseUnchanged
    LDA.W PoseXDirection : AND.W #$00FF : CMP.W #$0004 : BEQ .facingLeft
    LDA.W #$0001 : STA.B DP_Temp12 : STA.W CollisionMovementDirection
    STZ.B DP_Temp14
    JSL Samus_vs_SolidEnemy_CollisionDetection
    TAX : BNE .prospectivePoseRanIntoWall
    LDA.W #$0001 : STA.B DP_Temp12 : STA.W CollisionMovementDirection
    STZ.B DP_Temp14
    BRA .moveSamus

  .facingLeft:
    LDA.W #$0001 : STA.B DP_Temp12
    STZ.B DP_Temp14 : STZ.W CollisionMovementDirection
    JSL Samus_vs_SolidEnemy_CollisionDetection
    TAX : BNE .prospectivePoseRanIntoWall
    LDA.W #$FFFF : STA.B DP_Temp12
    STZ.B DP_Temp14 : STZ.W CollisionMovementDirection

  .moveSamus:
    JSL MoveSamusRight_NoSolidEnemyCollision
    BCC .returnPoseUnchanged

  .prospectivePoseRanIntoWall:
    LDA.W ProspectivePose
    BRA .setRanIntoWallPose

  .ranIntoWall:
    LDA.W Pose

  .setRanIntoWallPose:
    ASL #3 : TAX
    LDA.W PoseDefinitions_directionShotsFired,X : AND.W #$00FF : ASL : TAX
    LDA.W .poses,X : STA.W ProspectivePose
    BRA .returnPoseChanged

  .returnPoseUnchanged:
    STZ.W SamusXSpeedKilledDueToCollisionFlag
    CLC
    RTS

  .returnPoseChanged:
    STZ.W SamusXSpeedKilledDueToCollisionFlag
    SEC
    RTS

  .poses:
    dw $0003 ; 0: Up, facing right:   Facing right - aiming up
    dw $00CF ; 1: Up-right:           Facing right - ran into a wall - aiming up-right
    dw $0089 ; 2: Right:              Facing right - ran into a wall
    dw $00D1 ; 3: Down-right:         Facing right - ran into a wall - aiming down-right
    dw $0089 ; 4: Down, facing right: Facing right - ran into a wall
    dw $008A ; 5: Down, facing left:  Facing left-   ran into a wall
    dw $00D2 ; 6: Down-left:          Facing left-   ran into a wall - aiming down-left
    dw $008A ; 7: Left:               Facing left-   ran into a wall
    dw $00D0 ; 8: Up-left:            Facing left-   ran into a wall - aiming up-left
    dw $0004 ; 9: Up, facing left:    Facing left-   aiming up


;;; $EB88: Update Samus pose ;;;
UpdateSamusPose:
; See also "https://patrickjohnston.org/ASM/ROM%20data/Super%20Metroid/Samus.asm"
    PHP : PHB
    PHK : PLB
    REP #$30
    LDA.W SuperSpecialProspectivePose : BMI .notSuperSpecialProspectivePose
    PHA
    LDA.W SuperSpecialProspectivePoseChangeCommand : CMP.W #$0003 : BEQ .animationFinished
    CMP.W #$0001 : BNE .superSpecialProspectivePose
    PLA
    BRA .knockbackFinished

  .animationFinished:
    LDA.W SpecialProspectivePoseChangeCommand : CMP.W #$0009 : BNE .superSpecialProspectivePose
    PLA
    BRA .notSuperSpecialProspectivePose

  .superSpecialProspectivePose:
    PLA : STA.W Pose
    JSL InitializeSamusPose_1
    JSL Set_Samus_AnimationFrame_if_PoseChanged

  .knockbackFinished:
    LDA.W SuperSpecialProspectivePoseChangeCommand : ASL : TAX
    JSR.W (.superSpecialProspectivePoseChangeCommand,X)
    BRA .poseChanged

  .notSuperSpecialProspectivePose:
    LDA.W SpecialProspectivePose : BPL .specialProspectivePose
    JSR CheckIfProspectivePoseRunsIntoAWall
    LDA.W ProspectivePose : BMI .return
    BRA .prospectivePose

  .specialProspectivePose:
    STA.W Pose
    JSL HandleSamusPoseChange
    BCS .poseChanged
    LDA.W SpecialProspectivePoseChangeCommand : ASL : TAX
    JSR.W (.specialProspectivePoseChangeCommand,X)
    BRA .poseChanged

  .prospectivePose:
    STA.W Pose
    JSL HandleSamusPoseChange
    BCS .poseChanged
    LDA.W ProspectivePoseChangeCommand : ASL : TAX
    JSR.W (.prospectivePoseChangeCommand,X)

  .poseChanged:
    LDA.W PreviousPose : STA.W LastDifferentPose
    LDA.W PreviousPoseXDirection : STA.W LastDifferentPoseXDirection
    LDA.W Pose : STA.W PreviousPose
    LDA.W PoseXDirection : STA.W PreviousPoseXDirection

  .return:
    STZ.W SamusSolidVerticalCollisionResult
    PLB : PLP
    RTL

  .prospectivePoseChangeCommand:
; Prospective pose change command function pointers
    dw RTS_91EFC3
    dw ProspectivePoseCmd_1_Decelerate
    dw ProspectivePoseCmd_2_Stop
    dw RTS_91ECD8
    dw RTS_91ECD9
    dw SpecialProspectivePoseCmd_5_SolidVerticalCollision
    dw ProspectivePoseCmd_6_KillXSpeed
    dw ProspectivePoseCmd_7_StartTransitionAnimation
    dw ProspectivePoseCmd_8_KillRunSpeed

  .specialProspectivePoseChangeCommand:
; Special prospective pose change command function pointers
    dw RTS_91EFC3
    dw SpecialProspectivePoseCmd_1_StartKnockback
    dw UNUSED_SpecialProspectivePoseCmd_2_91EE69
    dw SpecialProspectivePoseCmd_3_StartBombJump
    dw UNUSED_SpecialProspectivePoseCmd_4_91EEA1
    dw SpecialProspectivePoseCmd_5_Xray
    dw RTS_91EF39
    dw RTS_91EF3A
    dw UNUSED_SpecialProspectivePoseCmd_8_91EF3B
    dw SpecialProspectivePoseCmd_9_ConnectingGrapple_Swinging
    dw SpecialProspectivePoseCmd_A_ConnectingGrapple_StuckInPlace

  .superSpecialProspectivePoseChangeCommand:
; Super special prospective pose change command function pointers
    dw RTS_91EFC3
    dw SuperSpecialProspectivePoseCmd_1_KnockbackFinished
    dw SuperSpecialProspectivePoseCmd_2_ShinesparkFinished
    dw SuperSpecialProspectivePoseCmd_3_TransitionAnimationFinished
    dw SuperSpecialProspectivePoseCmd_4
    dw SuperSpecialProspectivePoseCmd_5
    dw SuperSpecialProspectivePoseCmd_6_StartGrappleWallJump
    dw SuperSpecialProspectivePoseCmd_7_StartReleaseGrappleSwing
    dw SuperSpecialProspectivePoseCmd_8_KnockbackAndTransAnimFinish


;;; $EC50: Prospective pose change command 1 - decelerate ;;;
ProspectivePoseCmd_1_Decelerate:
; Running / normal jumping / morph ball in air and [Samus X base speed] != 0.0
; Samus X base speed *can* be 0.0 coming into this function
    LDA.W SamusXBaseSpeed : BNE .nonZeroXSpeed
    LDA.W SamusXBaseSubSpeed : BNE .nonZeroXSpeed
    JMP ProspectivePoseCmd_2_Stop

  .nonZeroXSpeed:
    LDA.W SamusXExtraRunSubSpeed : CLC : ADC.W SamusXBaseSubSpeed : STA.W SamusXBaseSubSpeed
    LDA.W SamusXExtraRunSpeed : ADC.W SamusXBaseSpeed : STA.W SamusXBaseSpeed
    LDA.W #$0002 : STA.W SamusXAccelerationMode
    JSL Cancel_SpeedBoosting
    STZ.W SamusXExtraRunSubSpeed : STZ.W SamusXExtraRunSpeed
    JSL PossiblyNoPurpose_91FB8E
    RTS


;;; $EC85: Prospective pose change command 6 - kill X speed ;;;
ProspectivePoseCmd_6_KillXSpeed:
; Morph ball on ground / spring ball / wall jumping / grappling
    STZ.W SamusXAccelerationMode
    STZ.W SamusXBaseSpeed : STZ.W SamusXBaseSubSpeed
; fallthrough to ProspectivePoseCmd_8_KillRunSpeed


;;; $EC8E: Prospective pose change command 8 - kill run speed ;;;
ProspectivePoseCmd_8_KillRunSpeed:
; Falling
    JSL Cancel_SpeedBoosting
    STZ.W SamusXExtraRunSubSpeed : STZ.W SamusXExtraRunSpeed
    JSL PossiblyNoPurpose_91FB8E
    RTS


if !FEATURE_KEEP_UNREFERENCED
;;; $EC9D: Unused ;;;
UNUSED_91EC9D:
    LDA.W MovementType : AND.W #$00FF : TAX
    LDA.W .data,X : AND.W #$00FF : BNE +
    RTS

+   LDA.W #$0004 : STA.W SamusAnimationFrameTimer
    RTS

  .data:
    db $00 ; 0: Standing
    db $00 ; 1: Running
    db $02 ; 2: Normal jumping
    db $00 ; 3: Spin jumping
    db $00 ; 4: Morph ball - on ground
    db $00 ; 5: Crouching
    db $00 ; 6: Falling
    db $00 ; 7: Unused
    db $00 ; 8: Morph ball - falling
    db $00 ; 9: Unused
    db $00 ; Ah: Knockback / crystal flash ending
    db $00 ; Bh: Unused
    db $00 ; Ch: Unused
    db $00 ; Dh: Unused
    db $00 ; Eh: Turning around - on ground
    db $00 ; Fh: Crouching/standing/morphing/unmorphing transition
    db $00 ; 10h: Moonwalking
    db $00 ; 11h: Spring ball - on ground
    db $00 ; 12h: Spring ball - in air
    db $00 ; 13h: Spring ball - falling
    db $00 ; 14h: Wall jumping
    db $00 ; 15h: Ran into a wall
    db $00 ; 16h: Grappling
    db $00 ; 17h: Turning around - jumping
    db $00 ; 18h: Turning around - falling
    db $02 ; 19h: Damage boost
    db $00 ; 1Ah: Grabbed by Draygon
    db $00 ; 1Bh: Shinespark / crystal flash / drained by metroid / damaged by MB's attacks
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $ECD0: Prospective pose change command 2 - stop ;;;
ProspectivePoseCmd_2_Stop:
; Default: not running / jumping / wall jumping / falling / morph ball / spring ball / grappling
; or running / normal jumping / morph ball in air and [Samus X momentum] = 0.0
    STZ.W SamusXAccelerationMode
    JSL Cancel_SpeedBoosting
    RTS


;;; $ECD8: RTS. Prospective pose change command 3 - unused ;;;
RTS_91ECD8:
    RTS


;;; $ECD9: RTS. Prospective pose change command 4 - unused ;;;
RTS_91ECD9:
    RTS


;;; $ECDA: Prospective pose change command 7 - start transition animation ;;;
ProspectivePoseCmd_7_StartTransitionAnimation:
; Run during start of transition animations.
; Corrects Samus height so crouching/morphing ends on ground instead of in the air
; Doesn't kill Samus' X speed or cancel speed boosting (because transition animations are a hack)
    LDA.W Pose : CMP.W #$00DB : BPL .aiming
    SEC : SBC.W #$0035 : ASL : TAX
    LDA.W .YRadii,X : STA.B DP_Temp12 : BEQ .notShrinking
    STZ.B DP_Temp14

  .shrinking:
    LDA.W Pose : ASL #3 : TAX
    LDA.W PoseDefinitions_YRadius,X : AND.W #$00FF : STA.W SamusYRadius
    JSL BlockCollisionDetectionDueToChangeOfPose

  .notShrinking:
    LDA.W SamusYPosition : CLC : ADC.B DP_Temp12 : STA.W SamusYPosition : STA.W SamusPreviousYPosition
    LDA.W MorphBallBounceState : BEQ .return
    STZ.W MorphBallBounceState : STZ.W SamusYSubSpeed
    STZ.W SamusYSpeed : STZ.W SamusYDirection

  .return:
    RTS

  .aiming:
    CMP.W #$00F1 : BMI .return
    CMP.W #$00F7 : BPL .return
    LDA.W #$0005 : STA.B DP_Temp12
    STZ.B DP_Temp14
    BRA .shrinking

  .YRadii:
    dw $0005 ; *35h: Facing right - crouching transition
    dw $0005 ; *36h: Facing left-   crouching transition
    dw $0009 ; *37h: Facing right - morphing transition
    dw $0009 ; *38h: Facing left-   morphing transition
    dw $0000 ;  39h: Unused
    dw $0000 ;  3Ah: Unused
    dw $0000 ;  3Bh: Facing right - standing transition
    dw $0000 ;  3Ch: Facing left-   standing transition
    dw $0000 ;  3Dh: Facing right - unmorphing transition
    dw $0000 ;  3Eh: Facing left-   unmorphing transition
    dw $0000 ;  3Fh: Unused
    dw $0000 ;  40h: Unused


;;; $ED4E: Special prospective pose change command 1 - start knockback ;;;
SpecialProspectivePoseCmd_1_StartKnockback:
    LDA.W PreviousMovementType : AND.W #$00FF : ASL : TAX
    JSR.W (.pointers,X)
    JSL SetSamusYSpeedForKnockback
    STZ.W BombJumpDirection : STZ.W ContactDamageIndex
    LDA.W #$0001 : STA.W HurtFlashCounter
    RTS

  .pointers:
    dw DetermineKnockbackDirection_Normal                                ; *0: Standing
    dw DetermineKnockbackDirection_Normal                                ; *1: Running
    dw DetermineKnockbackDirection_Normal                                ; *2: Normal jumping
    dw DetermineKnockbackDirection_Normal                                ; *3: Spin jumping
    dw DetermineKnockbackDirection_Morphed                               ; *4: Morph ball - on ground
    dw DetermineKnockbackDirection_Normal                                ; *5: Crouching
    dw DetermineKnockbackDirection_Falling                               ; *6: Falling
    dw UNUSED_DetermineKnockbackDirection_MovementType7_91EE48           ; *7: Unused
    dw DetermineKnockbackDirection_Morphed                               ; *8: Morph ball - falling
    dw DetermineKnockbackDirection_Morphed                               ; *9: Unused
    dw CLCRTS_91EDA2                                                     ;  Ah: Knockback / crystal flash ending
    dw CLCRTS_91EDA4                                                     ;  Bh: Unused
    dw CLCRTS_91EDA4                                                     ;  Ch: Unused
    dw DetermineKnockbackDirection_Normal                                ; *Dh: Unused
    dw CLCRTS_91EDA4                                                     ;  Eh: Turning around - on ground
    dw CLCRTS_91EDA4                                                     ;  Fh: Crouching/standing/morphing/unmorphing transition
    dw DetermineKnockbackDirection_Normal                                ; *10h: Moonwalking
    dw DetermineKnockbackDirection_Morphed                               ; *11h: Spring ball - on ground
    dw DetermineKnockbackDirection_Morphed                               ; *12h: Spring ball - in air
    dw DetermineKnockbackDirection_Morphed                               ; *13h: Spring ball - falling
    dw DetermineKnockbackDirection_Normal                                ; *14h: Wall jumping
    dw DetermineKnockbackDirection_Normal                                ; *15h: Ran into a wall
    dw CLCRTS_91EDA2                                                     ;  16h: Grappling
    dw CLCRTS_91EDA4                                                     ;  17h: Turning around - jumping
    dw CLCRTS_91EDA4                                                     ;  18h: Turning around - falling
    dw CLCRTS_91EDA4                                                     ;  19h: Damage boost
    dw CLCRTS_91EDA4                                                     ;  1Ah: Grabbed by Draygon
    dw CLCRTS_91EDA4                                                     ;  1Bh: Shinespark / crystal flash / drained by metroid / damaged by MB's attacks


;;; $EDA2: Clear carry ;;;
CLCRTS_91EDA2:
    CLC
    RTS


;;; $EDA4: Clear carry ;;;
CLCRTS_91EDA4:
    CLC
    RTS


;;; $EDA6: Determine knockback direction - falling ;;;
DetermineKnockbackDirection_Falling:
; Falling
    LDA.W HackHandler : CMP.W #UNUSED_SamusTimerHackHandler_SpecialFalling_90E41B : BNE DetermineKnockbackDirection_Normal
    CLC
    RTS


;;; $EDB0: Determine knockback direction - normal ;;;
DetermineKnockbackDirection_Normal:
; Standing / running / jumping / crouching / moonwalking / ran into a wall
; If [knockback X direction] = left  and not pressing forward: knockback direction = 1 (up left)
; If [knockback X direction] = right and not pressing forward: knockback direction = 2 (up right)
; If [knockback X direction] = left  and     pressing forward: knockback direction = 4 (down left)
; If [knockback X direction] = right and     pressing forward: knockback direction = 5 (down right)
    LDA.W PoseXDirection : AND.W #$00FF : CMP.W #$0004 : BEQ .facingLeft
    LDA.W KnockbackXDirection : BEQ .facingRightKnockbackLeft
    LDA.B DP_Controller1Input : BIT.W #$0100 : BNE .pressingRight
    LDA.W #$0002 : STA.W KnockbackDirection
    BRA +

  .pressingRight:
    LDA.W #$0005 : STA.W KnockbackDirection
    BRA +

  .facingRightKnockbackLeft:
    LDA.B DP_Controller1Input : BIT.W #$0100 : BNE ..pressingRight
    LDA.W #$0001 : STA.W KnockbackDirection
    BRA +

  ..pressingRight:
    LDA.W #$0004 : STA.W KnockbackDirection
    BRA +

  .facingLeft:
    LDA.W KnockbackXDirection : BEQ .facingLeftKnockbackLeft
    LDA.B DP_Controller1Input : BIT.W #$0200 : BNE ..pressingLeft
    LDA.W #$0002 : STA.W KnockbackDirection
    BRA +

  ..pressingLeft:
    LDA.W #$0005 : STA.W KnockbackDirection
    BRA +

  .facingLeftKnockbackLeft:
    LDA.B DP_Controller1Input : BIT.W #$0200 : BNE ..pressingLeft
    LDA.W #$0001 : STA.W KnockbackDirection
    BRA +

  ..pressingLeft:
    LDA.W #$0004 : STA.W KnockbackDirection

+   LDA.W #SamusMovementHandler_Knockback : STA.W MovementHandler
    SEC
    RTS


;;; $EE27: Determine knockback direction - morphed ;;;
DetermineKnockbackDirection_Morphed:
; Morph ball / spring ball
    LDA.W PoseXDirection : AND.W #$00FF : CMP.W #$0004 : BEQ .facingLeft
    LDA.W #$0002 : STA.W KnockbackDirection
    BRA +

  .facingLeft:
    LDA.W #$0001 : STA.W KnockbackDirection

+   LDA.W #SamusMovementHandler_Knockback : STA.W MovementHandler
    CLC
    RTS


;;; $EE48: Determine knockback direction - movement type 7 ;;;
UNUSED_DetermineKnockbackDirection_MovementType7_91EE48:
; 7: Unused
; Clone of $EE27 except that the (ignored) carry return is set
    LDA.W PoseXDirection : AND.W #$00FF : CMP.W #$0004 : BEQ .facingLeft
    LDA.W #$0002 : STA.W KnockbackDirection
    BRA +

  .facingLeft:
    LDA.W #$0001 : STA.W KnockbackDirection

+   LDA.W #SamusMovementHandler_Knockback : STA.W MovementHandler
    SEC
    RTS


;;; $EE69: Special prospective pose change command 2 - unused ;;;
UNUSED_SpecialProspectivePoseCmd_2_91EE69:
    STZ.W KnockbackDirection
    LDA.W #SamusMovementHandler_Normal : STA.W MovementHandler
    STZ.W SamusYSpeed : STZ.W SamusYSubSpeed : STZ.W SamusYDirection
    JSL AlignSamusBottomPositionWithPreviousPose
    RTS


;;; $EE80: Special prospective pose change command 3 - start bomb jump ;;;
SpecialProspectivePoseCmd_3_StartBombJump:
    LDA.W BombJumpDirection : AND.W #$00FF : ORA.W #$0800 : STA.W BombJumpDirection
    LDA.W #SamusMovementHandler_BombJump_Start : STA.W MovementHandler
    LDA.W PoseInputHandler : CMP.W #SamusPoseInputHandler_Demo : BEQ .return
    LDA.W #RTS_90E90E : STA.W PoseInputHandler

  .return:
    RTS


;;; $EEA1: Special prospective pose change command 4 - unused ;;;
UNUSED_SpecialProspectivePoseCmd_4_91EEA1:
    JSL Make_Samus_Jump
    RTS


;;; $EEA6: Special prospective pose change command 5 - x-ray ;;;
SpecialProspectivePoseCmd_5_Xray:
    LDA.W MovementType : AND.W #$00FF : BEQ .standing
    CMP.W #$0005 : BEQ .crouching
    CMP.W #$0015 : BEQ .standing
    CMP.W #$0001 : BEQ .standing
    RTS

  .standing:
    LDA.W PoseXDirection : AND.W #$00FF : CMP.W #$0004 : BEQ ..facingLeft
    LDA.W #$0040 : STA.W Xray_Angle
    BRA .merge

  ..facingLeft:
    LDA.W #$00C0 : STA.W Xray_Angle
    BRA .merge

  .crouching:
    LDA.W PoseXDirection : AND.W #$00FF : CMP.W #$0004 : BEQ ..facingLeft
    LDA.W #$0040 : STA.W Xray_Angle
    BRA .merge

  ..facingLeft:
    LDA.W #$00C0 : STA.W Xray_Angle

  .merge:
    LDA.W #$0002 : STA.W SamusAnimationFrame
    LDA.W #$003F : STA.W SamusAnimationFrameTimer
    LDA.W #SamusMovementHandler_Xray : STA.W MovementHandler
    LDA.W #SamusPoseInputHandler_Xray : STA.W PoseInputHandler
    LDA.W #$0008 : STA.W SpecialSamusPaletteType
    LDA.W #$0001 : STA.W CommonPaletteTimer
    STZ.W SpecialSamusPaletteFrame : STZ.W SpecialPaletteTimer
    STZ.W SamusProjectile_FlareCounter : STZ.W SamusProjectile_FlareAnimationFrame
    STZ.W SamusProjectile_FlareSlowSparksAnimationFrame0CD8 : STZ.W SamusProjectile_FlareFastSparksAnimationFrame0CDA
    STZ.W SamusProjectile_FlareAnimationTimer
    STZ.W SamusProjectile_FlareSlowSparksAnimationFrame0CDE : STZ.W SamusProjectile_FlareFastSparksAnimationFrame0CE0
    LDA.W #$0009
    JSL QueueSound_Lib1_Max6
    RTS


;;; $EF39: RTS. Special prospective pose change command 6 - unused ;;;
RTS_91EF39:
    RTS


;;; $EF3A: RTS. Special prospective pose change command 7 - unused ;;;
RTS_91EF3A:
    RTS


;;; $EF3B: Special prospective pose change command 8 - unused ;;;
UNUSED_SpecialProspectivePoseCmd_8_91EF3B:
    LDA.W SamusYPosition : SEC : SBC.W #$0005 : STA.W SamusYPosition : STA.W SamusPreviousYPosition
    LDA.W #RTL_90E8CD : STA.W CurrentStateHandler
    RTS


;;; $EF4F: Special prospective pose change command 9 - connecting grapple - swinging ;;;
SpecialProspectivePoseCmd_9_ConnectingGrapple_Swinging:
; This is like the opposite of SuperSpecialProspectivePoseCmd_5
    JSL SetSamusAnimationFrameAndPositionDuringGrappleSwinging
; fallthrough to ConnectingGrapple_KillSpeed_ClampScrollingSpeed


;;; $EF53: Connecting grapple - kill speed and clamp scrolling speed ;;;
ConnectingGrapple_KillSpeed_ClampScrollingSpeed:
    LDA.W SamusXPosition : SEC : SBC.W SamusPreviousXPosition : BMI +
    CMP.W #$000D : BMI .YPosition
    LDA.W SamusXPosition : SEC : SBC.W #$000C : STA.W SamusPreviousXPosition
    BRA .YPosition

+   CMP.W #$FFF4 : BPL .YPosition
    LDA.W SamusXPosition : CLC : ADC.W #$000C : STA.W SamusPreviousXPosition

  .YPosition:
    LDA.W SamusYPosition : SEC : SBC.W SamusPreviousYPosition : BMI +
    CMP.W #$000D : BMI .killSpeed
    LDA.W SamusYPosition : SEC : SBC.W #$000C : STA.W SamusPreviousYPosition
    BRA .killSpeed

+   CMP.W #$FFF4 : BPL .killSpeed
    LDA.W SamusYPosition : CLC : ADC.W #$000C : STA.W SamusPreviousYPosition

  .killSpeed:
    JSL Cancel_SpeedBoosting
    STZ.W SamusXBaseSpeed : STZ.W SamusXBaseSubSpeed
    STZ.W SamusYSubSpeed : STZ.W SamusYSpeed
    STZ.W SamusXExtraRunSpeed : STZ.W SamusXExtraRunSubSpeed
    RTS


;;; $EFBC: Special prospective pose change command Ah - connecting grapple - stuck in place ;;;
SpecialProspectivePoseCmd_A_ConnectingGrapple_StuckInPlace:
    JSL SetSamusAnimationFrameAndPositionForConnectingGrapple_Stuck
    JMP ConnectingGrapple_KillSpeed_ClampScrollingSpeed


;;; $EFC3: RTS ;;;
RTS_91EFC3:
    RTS


;;; $EFC4: Prospective pose change command 5 - solid vertical collision ;;;
SpecialProspectivePoseCmd_5_SolidVerticalCollision:
    LDA.W SamusSolidVerticalCollisionResult : AND.W #$00FF : ASL : TAX
    JSR.W (.pointers,X)
    RTS

  .pointers:
    dw RTS_91EFC3
    dw SolidVerticalCollision_Landed
    dw SolidVerticalCollision_Falling
    dw RTS_91EFDE
    dw SolidVerticalCollision_HitCeiling
    dw SolidVerticalCollision_WallJumpTriggered
    dw SolidVerticalCollision_6


;;; $EFDE: RTS. Solid vertical collision - [Samus solid vertical collision result] = 3 ;;;
RTS_91EFDE:
    RTS


;;; $EFDF: Solid vertical collision - [Samus solid vertical collision result] = hit ceiling ;;;
SolidVerticalCollision_HitCeiling:
    STZ.W SamusYSubSpeed : STZ.W SamusYSpeed
    STZ.W neverRead0B1A
    LDA.W #$0002 : STA.W SamusYDirection
    RTS


;;; $EFEF: Solid vertical collision - [Samus solid vertical collision result] = falling ;;;
SolidVerticalCollision_Falling:
    LDA.W SamusYDirection : CMP.W #$0001 : BEQ .fallingUp
    STZ.W MorphBallBounceState
    STZ.W SamusYSubSpeed : STZ.W SamusYSpeed
    LDA.W #$0001 : STA.W SamusIsFallingFlag
    LDA.W #$0002 : STA.W SamusYDirection

  .fallingUp:
    STZ.W neverRead0A18
    RTS


;;; $F010: Solid vertical collision - [Samus solid vertical collision result] = landed ;;;
SolidVerticalCollision_Landed:
    JSR HandleLandingSoundEffectsAndGraphics
    LDA.W SamusDownwardsMovementSolidCollisionResult : AND.W #$00FF : CMP.W #$0004 : BNE .change
    JSR SolidVerticalCollision_Landed_SetSamusAsNotBouncing
    RTS

  .change:
    ASL : TAX
    JSR.W (.pointers,X)
    BCC .carryClear
    RTS

  .carryClear:
    STZ.W neverRead0A18 : STZ.W SamusXAccelerationMode
    STZ.W SamusXBaseSpeed : STZ.W SamusXBaseSubSpeed
    JSR SolidVerticalCollision_Landed_SetSamusAsNotBouncing
    RTS

  .pointers:
    dw SolidVerticalCollision_Landed_Grounded
    dw SolidVerticalCollision_Landed_MorphBallGrounded
    dw SolidVerticalCollision_Landed_2
    dw SolidVerticalCollision_Landed_SpringBallGrounded
    dw RTS_91EFC3
    dw SolidVerticalCollision_5


;;; $F046: Handle landing sound effects and graphics ;;;
HandleLandingSoundEffectsAndGraphics:
; The playing of the end spin jump / screw attack sound effect is done more generally by Handle_UnspinSFX_CancellingEchoSound_SettingTimeUpGameState
; and doesn't really need to be here
    LDA.W PreviousMovementType : AND.W #$00FF : CMP.W #$0003 : BEQ .spinJumping
    CMP.W #$0014 : BNE .notEndingSFX

  .spinJumping:
    LDA.W CinematicFunction : BNE .notEndingSFX
    LDA.W PreviousPose : CMP.W #$0081 : BEQ .screwAttack
    CMP.W #$0082 : BEQ .screwAttack
    LDA.W #$0032
    JSL QueueSound_Lib1_Max6
    BRA .notEndingSFX

  .screwAttack:
    LDA.W #$0034
    JSL QueueSound_Lib1_Max6

  .notEndingSFX:
    LDA.W SamusYSpeed : BEQ .zeroYSpeed
    CMP.W #$0005 : BPL .hardLanding

  .zeroYSpeed:
    LDA.W SamusYSubSpeed : BEQ .return
    LDA.W CinematicFunction : BNE .merge
    LDA.W #$0005
    JSL QueueSound_Lib3_Max6
    BRA .merge

  .hardLanding:
    LDA.W CinematicFunction : BNE .merge
    LDA.W #$0004
    JSL QueueSound_Lib3_Max6

  .merge:
    JSR HandleLandingGraphics

  .return:
    RTS


;;; $F0A5: Handle landing graphics ;;;
HandleLandingGraphics:
    LDA.W AreaIndex : ASL : TAX
    JSR.W (.areaPointers,X)
    RTS

  .areaPointers:
    dw HandleLandingGraphics_Crateria                                    ; Crateria
    dw HandleLandingGraphics_Brinstar                                    ; Brinstar
    dw HandleLandingGraphics_Norfair_WreckedShip_HandleLandingDust       ; Norfair
    dw HandleLandingGraphics_Norfair_WreckedShip_HandleLandingDust       ; Wrecked Ship
    dw HandleLandingGraphics_Maridia_HandleLandingFootstepSplashes       ; Maridia
    dw HandleLandingGraphics_Tourian                                     ; Tourian
    dw DeleteLandingAtmosphericGraphics                                  ; Ceres
    dw DeleteLandingAtmosphericGraphics                                  ; Debug


;;; $F0BE: Delete landing atmospheric graphics ;;;
DeleteLandingAtmosphericGraphics:
    STZ.W AtmosphericGraphicsAnimFramesGraphicsTypes+4 : STZ.W AtmosphericGraphicsAnimFramesGraphicsTypes+6
    RTS


;;; $F0C5: Handle landing graphics - Crateria ;;;
HandleLandingGraphics_Crateria:
    LDA.W CinematicFunction : BNE DeleteLandingAtmosphericGraphics
    LDA.W RoomIndex : CMP.W #$001C : BEQ .crateriaSpacePirateShaft
    TAX : CPX.W #$0010 : BPL .gotoDelete
    LDA.W .data,X : AND.W #$00FF : BIT.W #$0001 : BNE .landingSite
    BIT.W #$0002 : BNE .wreckedShipEntrance
    BIT.W #$0004 : BNE HandleLandingGraphics_Maridia_HandleLandingFootstepSplashes

  .gotoDelete:
    JMP DeleteLandingAtmosphericGraphics

  .crateriaSpacePirateShaft:
    JMP HandleLandingGraphics_Norfair_WreckedShip_HandleLandingDust

  .data:
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
    db $00

  .wreckedShipEntrance:
    LDA.W SamusYPosition : CMP.W #$03B0 : BPL HandleLandingGraphics_Maridia_HandleLandingFootstepSplashes
    BRA DeleteLandingAtmosphericGraphics

  .landingSite:
    LDA.W FX_Type : CMP.W #$000A : BNE DeleteLandingAtmosphericGraphics
; fallthrough to HandleLandingGraphics_Maridia_HandleLandingFootstepSplashes


;;; $F116: Handle landing graphics - Maridia / handle landing footstep splashes ;;;
HandleLandingGraphics_Maridia_HandleLandingFootstepSplashes:
    JSL Get_Samus_Bottom_Boundary
    LDA.W FX_YPosition : BMI .negativeYPosition
    CMP.B DP_Temp12 : BPL .nonLiquidPhysics
    LDA.W FX_LiquidOptions : BIT.W #$0004 : BNE .nonLiquidPhysics
    BRA .return

  .negativeYPosition:
    LDA.W FX_LavaAcidYPosition : BMI .nonLiquidPhysics
    CMP.B DP_Temp12 : BMI .return

  .nonLiquidPhysics:
    LDA.W #$0100 : STA.W AtmosphericGraphicsAnimFramesGraphicsTypes+4 : STA.W AtmosphericGraphicsAnimFramesGraphicsTypes+6
    LDA.W #$0003 : STA.W AtmosphericGraphicsAnimationTimers+4 : STA.W AtmosphericGraphicsAnimationTimers+6
    LDA.W SamusXPosition : CLC : ADC.W #$0004 : STA.W AtmosphericGraphicsXPositions+4
    SEC : SBC.W #$0007 : STA.W AtmosphericGraphicsXPositions+6
    LDA.B DP_Temp12 : SEC : SBC.W #$0004 : STA.W AtmosphericGraphicsYPositions+4 : STA.W AtmosphericGraphicsYPositions+6

  .return:
    RTS


;;; $F166: Handle landing graphics - Norfair / Wrecked Ship / handle landing dust ;;;
HandleLandingGraphics_Norfair_WreckedShip_HandleLandingDust:
    JSL Get_Samus_Bottom_Boundary
    LDA.W FX_YPosition : BMI .negativeYPosition
    CMP.B DP_Temp12 : BPL .nonLiquidPhysics
    LDA.W FX_LiquidOptions : BIT.W #$0004 : BNE .nonLiquidPhysics
    BRA .return

  .negativeYPosition:
    LDA.W FX_LavaAcidYPosition : BMI .nonLiquidPhysics
    CMP.B DP_Temp12 : BMI .return

  .nonLiquidPhysics:
    LDA.W #$0600 : STA.W AtmosphericGraphicsAnimFramesGraphicsTypes+4 : STA.W AtmosphericGraphicsAnimFramesGraphicsTypes+6
    LDA.W #$0003 : STA.W AtmosphericGraphicsAnimationTimers+4 : STA.W AtmosphericGraphicsAnimationTimers+6
    LDA.W SamusXPosition : CLC : ADC.W #$0008 : STA.W AtmosphericGraphicsXPositions+4
    SEC : SBC.W #$0010 : STA.W AtmosphericGraphicsXPositions+6
    LDA.B DP_Temp12 : STA.W AtmosphericGraphicsYPositions+4 : STA.W AtmosphericGraphicsYPositions+6

  .return:
    RTS


;;; $F1B2: Handle landing graphics - Brinstar ;;;
HandleLandingGraphics_Brinstar:
; Seem to be missing an RTS (fallthrough doesn't look intentional)
    LDA.W RoomIndex : CMP.W #$0008 : BEQ HandleLandingGraphics_Norfair_WreckedShip_HandleLandingDust
; fallthrough to HandleLandingGraphics_Tourian


;;; $F1BA: Handle landing graphics - Tourian ;;;
HandleLandingGraphics_Tourian:
; Brinstar:
;     5: Brinstar map station
;     6: Fireflea room
;     7: Green Brinstar missile station
;     Bh: Spore Spawn
; Tourian:
;     5: Tourian super-sidehopper room
;     6: Drained Torizo room
;     7: Shitroid room
;     8: Post Shitroid room
;     Bh: Tourian eye-door room
    LDA.W RoomIndex : CMP.W #$0005 : BMI .greaterThan4
    CMP.W #$0009 : BMI HandleLandingGraphics_Norfair_WreckedShip_HandleLandingDust
    CMP.W #$000B : BEQ HandleLandingGraphics_Norfair_WreckedShip_HandleLandingDust

  .greaterThan4:
    STZ.W AtmosphericGraphicsAnimFramesGraphicsTypes+4 : STZ.W AtmosphericGraphicsAnimFramesGraphicsTypes+6
    RTS


;;; $F1D3: Solid vertical collision - landed - set Samus as not bouncing ;;;
SolidVerticalCollision_Landed_SetSamusAsNotBouncing:
; More of a "set grounded state" operation
    STZ.W SamusIsFallingFlag : STZ.W neverRead0B1A
    STZ.W neverRead0B2A : STZ.W SamusYSubSpeed
    STZ.W SamusYSpeed : STZ.W SamusYDirection
    STZ.W neverRead0B38 : STZ.W MorphBallBounceState
    RTS


;;; $F1EC: Solid vertical collision - landed - [Samus downwards movement solid collision result] = grounded ;;;
SolidVerticalCollision_Landed_Grounded:
;; Returns:
;;     Carry: Clear. Grounded
    LDA.W PoseInputHandler : CMP.W #SamusPoseInputHandler_Demo : BEQ .return
    LDA.W #SamusPoseInputHandler_AutoJumpHack : STA.W PoseInputHandler

  .return:
    CLC
    RTS


;;; $F1FC: Solid vertical collision - landed - [Samus downwards movement solid collision result] = morph ball grounded ;;;
SolidVerticalCollision_Landed_MorphBallGrounded:
;; Returns:
;;     Carry: Set if ungrounded, otherwise clear

; Morph ball bounce - no springball
    LDA.W MorphBallBounceState : ASL : TAX
    JMP.W (.pointers,X)

  .pointers:
    dw MorphBallBounce_MorphBall_NotBouncing
    dw MorphBallBounce_MorphBall_FirstBounce
    dw MorphBallBounce_MorphBall_SecondBounce


;;; $F20A: Morph ball bounce - morph ball - not bouncing ;;;
MorphBallBounce_MorphBall_NotBouncing:
;; Returns:
;;     Carry: Set. Ungrounded
    LDA.W SamusYSpeed : CMP.W #$0003 : BMI MorphBallBounce_MorphBall_SecondBounce
    INC.W MorphBallBounceState
    LDA.W #$0001 : STA.W SamusYDirection
    LDA.L SamusPhysicsConstants_YSubSpeedWhenBouncingInMorphBall : STA.W SamusYSubSpeed
    LDA.L SamusPhysicsConstants_YSpeedWhenBouncingInMorphBall : STA.W SamusYSpeed
    SEC
    RTS


;;; $F22B: Morph ball bounce - morph ball - first bounce ;;;
MorphBallBounce_MorphBall_FirstBounce:
;; Returns:
;;     Carry: Set. Ungrounded
    INC.W MorphBallBounceState
    LDA.W #$0001 : STA.W SamusYDirection
    LDA.L SamusPhysicsConstants_YSubSpeedWhenBouncingInMorphBall : STA.W SamusYSubSpeed
    LDA.L SamusPhysicsConstants_YSpeedWhenBouncingInMorphBall : DEC : STA.W SamusYSpeed
    SEC
    RTS


;;; $F245: Morph ball bounce - morph ball - second bounce ;;;
MorphBallBounce_MorphBall_SecondBounce:
;; Returns:
;;     Carry: Clear. Grounded
    STZ.W MorphBallBounceState : STZ.W SamusYDirection
    STZ.W SamusYSubSpeed : STZ.W SamusYSpeed
    CLC
    RTS


;;; $F253: Solid vertical collision - landed - [Samus downwards movement solid collision result] = 2 ;;;
SolidVerticalCollision_Landed_2:
;; Returns:
;;     Carry: Clear. Grounded
    STZ.W MorphBallBounceState
    LDA.W #$0003 : STA.W HorizontalSlopeCollision
    CLC
    RTS


;;; $F25E: Solid vertical collision - landed - [Samus downwards movement solid collision result] = spring ball grounded ;;;
SolidVerticalCollision_Landed_SpringBallGrounded:
;; Returns:
;;     Carry: Clear. Grounded

; Morph ball bounce - springball
    LDA.B DP_Controller1Input : BIT.W JumpBinding : BEQ .notPressingJump
    STZ.W MorphBallBounceState
    JSL Make_Samus_Jump
    SEC
    RTS

  .notPressingJump:
    LDA.W MorphBallBounceState : AND.W #$00FF : ASL : TAX
    JMP.W (.pointers,X)

  .pointers:
    dw MorphBallBounce_SpringBall_NotBouncing
    dw MorphBallBounce_SpringBall_FirstBounce
    dw MorphBallBounce_SpringBall_SecondBounce


;;; $F27F: Morph ball bounce - spring ball - not bouncing ;;;
MorphBallBounce_SpringBall_NotBouncing:
;; Returns:
;;     Carry: Set. Ungrounded
    LDA.W SamusYSpeed : CMP.W #$0003 : BMI MorphBallBounce_SpringBall_SecondBounce
    LDA.W #$0601 : STA.W MorphBallBounceState
    LDA.W #$0001 : STA.W SamusYDirection
    LDA.L SamusPhysicsConstants_YSubSpeedWhenBouncingInMorphBall : STA.W SamusYSubSpeed
    LDA.L SamusPhysicsConstants_YSpeedWhenBouncingInMorphBall : STA.W SamusYSpeed
    SEC
    RTS


;;; $F2A3: Morph ball bounce - spring ball - first bounce ;;;
MorphBallBounce_SpringBall_FirstBounce:
;; Returns:
;;     Carry: Clear. Grounded
    LDA.W #$0602 : STA.W MorphBallBounceState
    LDA.W #$0001 : STA.W SamusYDirection
    LDA.L SamusPhysicsConstants_YSubSpeedWhenBouncingInMorphBall : STA.W SamusYSubSpeed
    LDA.L SamusPhysicsConstants_YSpeedWhenBouncingInMorphBall : DEC : STA.W SamusYSpeed
    SEC
    RTS


;;; $F2C0: Morph ball bounce - spring ball - second bounce ;;;
MorphBallBounce_SpringBall_SecondBounce:
    STZ.W MorphBallBounceState : STZ.W SamusYDirection
    STZ.W SamusYSubSpeed : STZ.W SamusYSpeed
    CLC
    RTS


;;; $F2CE: Solid vertical collision - landed - [Samus downwards movement solid collision result] = 5 ;;;
SolidVerticalCollision_5:
;; Returns:
;;     Carry: Clear. Grounded
    STZ.W MorphBallBounceState
    CLC
    RTS


;;; $F2D3: Solid vertical collision - [Samus solid vertical collision result] = wall jump triggered ;;;
SolidVerticalCollision_WallJumpTriggered:
    STZ.W SamusXAccelerationMode : STZ.W SamusXSpeedKilledDueToCollisionFlag
    STZ.W SamusIsFallingFlag : STZ.W neverRead0B1A
    STZ.W SamusXBaseSpeed : STZ.W SamusXBaseSubSpeed
    STZ.W neverRead0A18
    LDA.W #$0005
    JSL QueueSound_Lib3_Max6
    RTS


;;; $F2F0: Solid vertical collision - [Samus solid vertical collision result] = 6 ;;;
SolidVerticalCollision_6:
; This is the only code in the game that sets $0A46 to a non-3 value
; Code that checks this variable only cares if the 2 bit is set or not,
; so it's not known what the intended difference between 0 and 1 is here
    LDA.W SamusXSpeedKilledDueToCollisionFlag : BEQ .return
    LDA.W PreviousMovementType : AND.W #$00FF : CMP.W #$0009 : BNE .return
    LDA.W PoseXDirection : AND.W #$00FF : CMP.W #$0004 : BEQ .disableHorizontalSlopeDetection
    LDA.W #$0001 : STA.W HorizontalSlopeCollision
    BRA .returnClear0A18

  .disableHorizontalSlopeDetection:
    STZ.W HorizontalSlopeCollision
    BRA .returnClear0A18

  .return:
    RTS

  .returnClear0A18:
    STZ.W neverRead0A18
    RTS


;;; $F31D: Super special prospective pose change command 1 - knockback finished ;;;
SuperSpecialProspectivePoseCmd_1_KnockbackFinished:
    STZ.W KnockbackDirection
    LDA.W #SamusMovementHandler_Normal : STA.W MovementHandler
    STZ.W MorphBallBounceState
    STZ.W SamusYSubSpeed : STZ.W SamusYSpeed
    LDA.W #$0001 : STA.W SamusIsFallingFlag
    LDA.W #$0002 : STA.W SamusYDirection
    JSL AlignSamusBottomPositionWithPreviousPose
    LDA.W PoseInputHandler : CMP.W #SamusPoseInputHandler_Demo : BEQ .return
    LDA.W #SamusPoseInputHandler_Normal : STA.W PoseInputHandler

  .return:
    RTS


;;; $F34E: Super special prospective pose change command 2 - shinespark finished ;;;
SuperSpecialProspectivePoseCmd_2_ShinesparkFinished:
    JSL AlignSamusBottomPositionWithPreviousPose
    LDA.W #SamusMovementHandler_Normal : STA.W MovementHandler
    LDA.W GameState : CMP.W #$002A : BEQ .demo
    LDA.W #SamusPoseInputHandler_Normal : STA.W PoseInputHandler
    RTS

  .demo:
    LDA.W #SamusPoseInputHandler_Demo : STA.W PoseInputHandler
    RTS


;;; $F36E: Super special prospective pose change command 3 - transition animation finished ;;;
SuperSpecialProspectivePoseCmd_3_TransitionAnimationFinished:
    STZ.W MorphBallBounceState
    LDA.W SamusAnimationFrameTimer : CLC : ADC.W SamusAnimationFrameBuffer : STA.W SamusAnimationFrameTimer
    RTS


;;; $F37C: Super special prospective pose change command 4 ;;;
SuperSpecialProspectivePoseCmd_4:
    LDA.W Layer1XPosition : CLC : ADC.W #$0080 : STA.W SamusXPosition : STA.W SamusPreviousXPosition
    LDA.W Layer1YPosition : CLC : ADC.W #$0080 : STA.W SamusYPosition : STA.W SamusPreviousYPosition
    RTS


;;; $F397: Super special prospective pose change command 5 ;;;
SuperSpecialProspectivePoseCmd_5:
    LDA.W SamusYPosition : CLC : ADC.W #$0005 : STA.W SamusYPosition : STA.W SamusPreviousYPosition
    RTS


;;; $F3A5: Super special prospective pose change command 6 - start grapple wall-jump ;;;
SuperSpecialProspectivePoseCmd_6_StartGrappleWallJump:
    JSL HandleJumpTransition
    RTS


;;; $F3AA: Super special prospective pose change command 7 - start release from grapple swing ;;;
SuperSpecialProspectivePoseCmd_7_StartReleaseGrappleSwing:
; Clamps scrolling speed. I guess the idea is that Samus might have moved too far due to the pose change
    LDA.W SamusXPosition : SEC : SBC.W SamusPreviousXPosition : BMI +
    CMP.W #$000D : BMI .YPosition
    LDA.W SamusXPosition : SEC : SBC.W #$000C : STA.W SamusPreviousXPosition
    BRA .YPosition

+   CMP.W #$FFF4 : BPL .YPosition
    LDA.W SamusXPosition : CLC : ADC.W #$000C : STA.W SamusPreviousXPosition

  .YPosition:
    LDA.W SamusYPosition : SEC : SBC.W SamusPreviousYPosition : BMI +
    CMP.W #$000D : BMI .return
    LDA.W SamusYPosition : SEC : SBC.W #$000C : STA.W SamusPreviousYPosition
    BRA .return

+   CMP.W #$FFF4 : BPL .return
    LDA.W SamusYPosition : CLC : ADC.W #$000C : STA.W SamusPreviousYPosition

  .return:
    RTS


;;; $F3FD: Super special prospective pose change command 8 - knockback and transition animation both finished ;;;
SuperSpecialProspectivePoseCmd_8_KnockbackAndTransAnimFinish:
    JSR SuperSpecialProspectivePoseCmd_1_KnockbackFinished
    JSR SuperSpecialProspectivePoseCmd_3_TransitionAnimationFinished
    RTS


;;; $F404: Handle Samus pose change ;;;
HandleSamusPoseChange:
;; Returns:
;;     Carry: Set if pose changed, clear otherwise
    PHP : PHB
    PHK : PLB
    REP #$30
    LDA.W Pose : PHA
    CMP.W PreviousPose : BEQ .noChange
    JSR HandlePoseChangeCollision
    JSL InitializeSamusPose_1
    JSL HandleJumpTransition
    JSL Set_Samus_AnimationFrame_if_PoseChanged
    STZ.W NewPoseSamusAnimationFrame

  .noChange:
    PLA : CMP.W Pose : BNE .poseChange
    PLB : PLP
    CLC
    RTL

  .poseChange:
    PLB : PLP
    SEC
    RTL


;;; $F433: Initialise Samus pose (1/2) ;;;
InitializeSamusPose_1:
    PHP : PHB
    PHK : PLB
    REP #$30
    LDA.W Pose : ASL #3 : TAX
    LDA.W PoseDefinitions_XDirection,X : STA.W PoseXDirection
    JSR InitializeSamusPose_2
    LDA.W PreviousMovementType : AND.W #$00FF : CMP.W #$0003 : BEQ .spinJumping
    CMP.W #$0014 : BNE .return

  .spinJumping:
    LDA.W EquippedItems : BIT.W #$0008 : BEQ .return
    JSL LoadSamusSuitPalette

  .return:
    PLB : PLP
    RTL


;;; $F468: Initialise Samus pose (2/2) ;;;
InitializeSamusPose_2:
    PHP
    REP #$30
    LDA.W MovementType : AND.W #$00FF : ASL : TAX
    JSR.W (.pointers,X)
    BCC .return
    LDA.W Pose : ASL #3 : TAX
    LDA.W PoseDefinitions_XDirection,X : STA.W PoseXDirection
    AND.W #$FF00 : CMP.W #$0E00 : BNE .return
    XBA : ASL : TAX
    JSR.W (.pointers,X)
    LDA.W Pose : ASL #3 : TAX
    LDA.W PoseDefinitions_XDirection,X : STA.W PoseXDirection

  .return:
    PLP
    RTS

  .pointers:
    dw InitializeSamusPose_Standing                                      ; *0: Standing
    dw InitializeSamusPose_Running                                       ; *1: Running
    dw InitializeSamusPose_NormalJumping                                 ; *2: Normal jumping
    dw InitializeSamusPose_SpinJumping                                   ; *3: Spin jumping
    dw InitializeSamusPose_MorphBall                                     ; *4: Morph ball - on ground
    dw InitializeSamusPose_Crouching                                     ; *5: Crouching
    dw InitializeSamusPose_Falling                                       ; *6: Falling
    dw CLCRTS_91F4DA                                                     ;  7: Unused
    dw InitializeSamusPose_MorphBall                                     ; *8: Morph ball - falling
    dw CLCRTS_91F4DA                                                     ;  9: Unused
    dw CLCRTS_91F4DA                                                     ;  Ah: Knockback / crystal flash ending
    dw CLCRTS_91F4DA                                                     ;  Bh: Unused
    dw CLCRTS_91F4DA                                                     ;  Ch: Unused
    dw CLCRTS_91F4DA                                                     ;  Dh: Unused
    dw InitializeSamusPose_TurningAround_OnGround                        ; *Eh: Turning around - on ground
    dw InitializeSamusPose_TransitionPoses                               ; *Fh: Crouching/standing/morphing/unmorphing transition
    dw InitializeSamusPose_Moonwalking                                   ; *10h: Moonwalking
    dw InitializeSamusPose_SpringBall                                    ; *11h: Spring ball - on ground
    dw InitializeSamusPose_SpringBall                                    ; *12h: Spring ball - in air
    dw InitializeSamusPose_SpringBall                                    ; *13h: Spring ball - falling
    dw InitializeSamusPose_WallJumping                                   ; *14h: Wall jumping
    dw CLCRTS_91F4DA                                                     ;  15h: Ran into a wall
    dw CLCRTS_91F4DA                                                     ;  16h: Grappling
    dw InitializeSamusPose_TurningAround_Jumping                         ; *17h: Turning around - jumping
    dw InitializeSamusPose_TurningAround_Falling                         ; *18h: Turning around - falling
    dw InitializeSamusPose_DamageBoost                                   ; *19h: Damage boost
    dw CLCRTS_91F4DA                                                     ;  1Ah: Grabbed by Draygon
    dw InitializeSamusPose_Shinespark_CF_Drained_DamagedMB               ; *1Bh: Shinespark / crystal flash / drained by metroid / damaged by MB's attacks


;;; $F4DA: Clear carry ;;;
CLCRTS_91F4DA:
    CLC
    RTS


;;; $F4DC: Initialise Samus pose - standing ;;;
InitializeSamusPose_Standing:
;; Returns:
;;     Carry: Clear. No movement change
    LDA.W Pose : ASL #3 : TAX
    LDA.W PoseDefinitions_directionShotsFired,X : AND.W #$00FF : BEQ +
    CMP.W #$0009 : BNE .returnCarryClear

+   LDA.W PreviousPose : ASL #3 : TAX
    LDA.W PoseDefinitions_directionShotsFired,X : AND.W #$00FF : BEQ .up
    CMP.W #$0009 : BNE .returnCarryClear

  .up:
    LDA.W #$0001 : STA.W NewPoseSamusAnimationFrame

  .returnCarryClear:
    CLC
    RTS


;;; $F50C: Initialise Samus pose - running ;;;
InitializeSamusPose_Running:
;; Returns:
;;     Carry: Clear. No movement change
    LDA.W PreviousMovementType : AND.W #$00FF : CMP.W #$0001 : BNE .notRunning
    LDA.W #$8000 : STA.W NewPoseSamusAnimationFrame

  .notRunning:
    LDA.W unknown0DF8 : BEQ .returnCarryClear
    LDA.W Pose : CMP.W #$0045 : BEQ .turnLeft
    CMP.W #$0046 : BEQ .turnRight
    BRA .returnCarryClear

  .turnLeft:
    LDA.W #$0025 : STA.W Pose
    BRA .returnCarrySet

  .turnRight:
    LDA.W #$0026 : STA.W Pose

  .returnCarrySet:
    SEC
    RTS

  .returnCarryClear:
    CLC
    RTS


;;; $F543: Initialise Samus pose - normal jumping ;;;
InitializeSamusPose_NormalJumping:
;; Returns:
;;     Carry: Set if movement changed, otherwise clear

; The .noAnimationSkip section seems kinda pointless(?)
; NOPing it causes fire to be required to be held for more than 1 frame to fire from a spin-jump,
; otherwise, if charge is equipped, fire only needs to be held for one frame.
; Note that if Samus has her beam charged, then she only needs to hold fire for one frame to fire the charged beam,
; regardless of whether this section is NOPed or not

; This checklist of poses notably excludes the two gun extended poses 13h/14h
    LDA.W Pose : CMP.W #$004E : BEQ .shinesparkFacingLeft
    CMP.W #$004D : BEQ .shinesparkFacingRight
    CMP.W #$0015 : BEQ .shinesparkFacingRight
    CMP.W #$0016 : BEQ .shinesparkFacingLeft
    CMP.W #$006A : BEQ .shinesparkFacingLeft
    CMP.W #$0069 : BNE .notShinespark

  .shinesparkFacingRight:
    LDA.W SpecialPaletteTimer : BEQ .notShinespark
    LDA.W #$00C7 : STA.W Pose
    BRA .shinesparkMerge

  .shinesparkFacingLeft:
    LDA.W SpecialPaletteTimer : BEQ .notShinespark
    LDA.W #$00C8 : STA.W Pose

  .shinesparkMerge:
    JSL TriggerShinesparkWindup
    LDA.W PreviousMovementType : AND.W #$00FF : CMP.W #$0002 : BNE .returnCarrySet
    LDA.W SamusYPosition : SEC : SBC.W #$0001 : STA.W SamusYPosition : STA.W SamusPreviousYPosition

  .returnCarrySet:
    SEC
    RTS

  .notShinespark:
    LDA.W SamusXExtraRunSpeed : BNE .nonZeroExtraRunSpeed
    LDA.W SamusXExtraRunSubSpeed : BNE .nonZeroExtraRunSpeed
    STZ.W SamusXAccelerationMode
    BRA +

  .nonZeroExtraRunSpeed:
    LDA.W #$0002 : STA.W SamusXAccelerationMode

+   LDA.W Pose : CMP.W #$0015 : BEQ .normalJump
    CMP.W #$0016 : BNE .noAnimationSkip

  .normalJump:
    LDA.W PreviousPose : CMP.W #$0055 : BEQ .skipArmCannonMovingUp
    CMP.W #$0056 : BNE .noAnimationSkip

  .skipArmCannonMovingUp:
    LDA.W #$0001 : STA.W NewPoseSamusAnimationFrame

  .noAnimationSkip:
    LDA.B DP_Controller1New : BIT.W ShotBinding : BEQ .returnCarryClear
    LDA.W Pose : ASL #3 : TAX
    LDA.W PoseDefinitions_directionShotsFired,X : AND.W #$00FF : ORA.W #$8000 : STA.W PoseTransitionShotDirection

  .returnCarryClear:
    CLC
    RTS


;;; $F5EB: Initialise Samus pose - crouching ;;;
InitializeSamusPose_Crouching:
;; Returns:
;;     Carry: Clear. No movement change
    LDA.W Pose : CMP.W #$0085 : BEQ .crouchingAimingUp
    CMP.W #$0086 : BNE .returnCarryClear

  .crouchingAimingUp:
    LDA.W PreviousPose : CMP.W #$00F1 : BEQ .skipArmCannonMovingUp
    CMP.W #$00F2 : BNE .returnCarryClear

  .skipArmCannonMovingUp:
    LDA.W #$0001 : STA.W NewPoseSamusAnimationFrame

  .returnCarryClear:
    CLC
    RTS


;;; $F60D: Initialise Samus pose - falling ;;;
InitializeSamusPose_Falling:
;; Returns:
;;     Carry: Clear. No movement change
    LDA.W SamusXExtraRunSpeed : BNE .nonZeroExtraRunSpeed
    LDA.W SamusXExtraRunSubSpeed : BNE .nonZeroExtraRunSpeed
    STZ.W SamusXAccelerationMode
    BRA .returnCarryClear

  .nonZeroExtraRunSpeed:
    LDA.W #$0002 : STA.W SamusXAccelerationMode

  .returnCarryClear:
    CLC
    RTS


;;; $F624: Initialise Samus pose - spin jumping ;;;
InitializeSamusPose_SpinJumping:
;; Returns:
;;     Carry: Clear. No movement change
    LDA.W PreviousMovementType : AND.W #$00FF : CMP.W #$0003 : BEQ .spinJumping
    CMP.W #$0014 : BNE .notTurningAround

  .spinJumping:
    LDA.W #$0001 : STA.W NewPoseSamusAnimationFrame
    LDA.W PreviousPoseXDirection : AND.W #$000F : CMP.W #$0008 : BEQ +
    CMP.W #$0004 : BNE .notTurningAround
    LDA.W PoseXDirection : CMP.W #$0308 : BEQ .speed
    BRA .notTurningAround

+   LDA.W PoseXDirection : CMP.W #$0304 : BNE .notTurningAround

  .speed:
    LDA.W SamusXExtraRunSubSpeed : CLC : ADC.W SamusXBaseSubSpeed : STA.W SamusXBaseSubSpeed
    LDA.W SamusXExtraRunSpeed : ADC.W SamusXBaseSpeed : STA.W SamusXBaseSpeed
    JSL Cancel_SpeedBoosting
    STZ.W SamusXExtraRunSubSpeed : STZ.W SamusXExtraRunSpeed
    LDA.W #$0001 : STA.W SamusXAccelerationMode

  .notTurningAround:
    LDA.W PoseXDirection : AND.W #$00FF : CMP.W #$0004 : BEQ .facingLeft
    LDA.W EquippedItems : BIT.W #$0020 : BNE .nonLiquidPhysicsRight
    JSL Get_Samus_BottomTop_Boundary
    LDA.W FX_YPosition : BMI .negativeYPosition
    CMP.B DP_Temp14 : BPL .nonLiquidPhysicsRight
    LDA.W FX_LiquidOptions : BIT.W #$0004 : BNE .nonLiquidPhysicsRight
    BRA .returnUpperCarryClear

  .negativeYPosition:
    LDA.W FX_LavaAcidYPosition : BMI .nonLiquidPhysicsRight
    CMP.B DP_Temp14 : BMI .returnUpperCarryClear

  .nonLiquidPhysicsRight:
    LDA.W EquippedItems : BIT.W #$0008 : BNE .screwAttackRight
    BIT.W #$0200 : BNE .spaceJumpRight
    LDA.W NewPoseSamusAnimationFrame : BEQ .spinJumpRight

  .returnUpperCarryClear:
    CLC
    RTS

  .spinJumpRight:
    LDA.W CinematicFunction : BNE .returnUpperCarryClear
    LDA.W #$0031
    JSL QueueSound_Lib1_Max6
    CLC
    RTS

  .spaceJumpRight:
    LDA.W #$003E
    JSL QueueSound_Lib1_Max6
    LDA.W #$001B : STA.W Pose
    CLC
    RTS

  .screwAttackRight:
    LDA.W #$0081 : STA.W Pose
    BRA .screwAttackSFX

  .facingLeft:
    LDA.W EquippedItems : BIT.W #$0020 : BNE .nonLiquidPhysicsLeft
    JSL Get_Samus_BottomTop_Boundary
    LDA.W FX_YPosition : BMI .negativeYPosition2
    CMP.B DP_Temp14 : BPL .nonLiquidPhysicsLeft
    LDA.W FX_LiquidOptions : BIT.W #$0004 : BNE .nonLiquidPhysicsLeft
    BRA .returnMiddleCarryClear

  .negativeYPosition2:
    LDA.W FX_LavaAcidYPosition : BMI .nonLiquidPhysicsLeft
    CMP.B DP_Temp14 : BMI .returnMiddleCarryClear

  .nonLiquidPhysicsLeft:
    LDA.W EquippedItems : BIT.W #$0008 : BNE .screwAttackLeft
    BIT.W #$0200 : BNE .spaceJumpLeft
    LDA.W NewPoseSamusAnimationFrame : BEQ .spinJumpLeft

  .returnMiddleCarryClear:
    CLC
    RTS

  .spinJumpLeft:
    LDA.W CinematicFunction : BNE .returnMiddleCarryClear
    LDA.W #$0031
    JSL QueueSound_Lib1_Max6
    CLC
    RTS

  .spaceJumpLeft:
    LDA.W #$003E
    JSL QueueSound_Lib1_Max6
    LDA.W #$001C : STA.W Pose
    CLC
    RTS

  .screwAttackLeft:
    LDA.W #$0082 : STA.W Pose

  .screwAttackSFX:
    LDA.W NewPoseSamusAnimationFrame : BNE .returnLowerCarryClear
    LDA.W #$0033
    JSL QueueSound_Lib1_Max6

  .returnLowerCarryClear:
    CLC
    RTS


;;; $F758: Initialise Samus pose - crouching/standing/morphing/unmorphing transition ;;;
InitializeSamusPose_TransitionPoses:
    LDA.W Pose : CMP.W #$00F1 : BPL .aiming
    CMP.W #$00DB : BPL .unused
    SEC : SBC.W #$0035 : ASL : TAX

-   LDA.W #$0007 : STA.W ProspectivePoseChangeCommand
    JSR.W (.pointers,X)
    RTS

  .unused:
    SEC : SBC.W #$00DB : ASL : TAX
    JSR.W (.unusedPointers,X)
    RTS

  .aiming:
    CMP.W #$00F7 : BPL .startTransition
    LDX.W #$0000
    BRA -

  .startTransition:
    LDA.W #$0007 : STA.W ProspectivePoseChangeCommand
    RTS

  .pointers:
    dw InitializeSamusPose_CrouchingTransition                           ; 35h: Facing right - crouching transition / crouching transition - aiming
    dw InitializeSamusPose_CrouchingTransition                           ; 36h: Facing left-   crouching transition
    dw InitializeSamusPose_MorphingTransition                            ; 37h: Facing right - morphing transition
    dw InitializeSamusPose_MorphingTransition                            ; 38h: Facing left-   morphing transition
    dw UNUSED_InitializeSamusPose_UnusedPose39_91F7F4                    ; 39h: Unused
    dw UNUSED_InitializeSamusPose_UnusedPose3A_91F840                    ; 3Ah: Unused
    dw CLCRTS_91F7CC                                                     ; 3Bh: Facing right - standing transition
    dw CLCRTS_91F7CC                                                     ; 3Ch: Facing left-   standing transition
    dw CLCRTS_91F7CC                                                     ; 3Dh: Facing right - unmorphing transition
    dw CLCRTS_91F7CC                                                     ; 3Eh: Facing left-   unmorphing transition
    dw CLCRTS_91F7CC                                                     ; 3Fh: Unused
    dw CLCRTS_91F7CC                                                     ; 40h: Unused

  .unusedPointers:
; Unused poses DBh..DEh
    dw InitializeSamusPose_MorphingTransition
    dw InitializeSamusPose_MorphingTransition
    dw CLCRTS_91F7CC
    dw CLCRTS_91F7CC


;;; $F7B0: Initialise Samus pose - crouching transition ;;;
InitializeSamusPose_CrouchingTransition:
;; Returns:
;;     Carry: Clear. No movement change

; Gives Samus shinespark
    LDA.W SamusBoostTimer : AND.W #$FF00 : CMP.W #$0400 : BMI .returnCarryClear
    LDA.W #$00B4 : STA.W SpecialPaletteTimer
    LDA.W #$0001 : STA.W SpecialSamusPaletteType
    STZ.W SpecialSamusPaletteFrame

  .returnCarryClear:
    CLC
    RTS


;;; $F7CC: Clear carry ;;;
CLCRTS_91F7CC:
    CLC
    RTS


;;; $F7CE: Initialise Samus pose - morphing transition ;;;
InitializeSamusPose_MorphingTransition:
;; Returns:
;;     Carry: Set if movement changed, otherwise clear
    LDA.W EquippedItems : BIT.W #$0004 : BEQ .noMorphBall
    LDA.W PreviousMovementType : AND.W #$00FF : CMP.W #$0003 : BNE .spinJumping
    LDA.W #$0002 : STA.W SamusXAccelerationMode

  .spinJumping:
    STZ.W SamusProjectile_BombSpreadChargeTimeoutCounter
    CLC
    RTS

  .noMorphBall:
    LDA.W PreviousPose : STA.W Pose
    SEC
    RTS


;;; $F7F4: Initialise Samus pose - unused pose 39h ;;;
UNUSED_InitializeSamusPose_UnusedPose39_91F7F4:
;; Returns:
;;     Carry: Set. Movement changed
    LDA.W PreviousMovementType : AND.W #$00FF : CMP.W #$0008 : BEQ .wasFalling
    CMP.W #$0013 : BEQ .wasFalling
    LDA.W EquippedItems : BIT.W #$0000 : BNE .returnCarryClear
    BIT.W #$0002 : BNE .facingRight
    LDA.W #$001D : STA.W Pose
    BRA .returnCarrySet

  .facingRight:
    LDA.W #$0079 : STA.W Pose
    BRA .returnCarrySet

  .wasFalling:
    LDA.W EquippedItems : BIT.W #$0000 : BNE .returnCarryClear
    BIT.W #$0002 : BNE ..facingRight
    LDA.W #$0031 : STA.W Pose
    BRA .returnCarrySet

  ..facingRight:
    LDA.W #$007D : STA.W Pose

  .returnCarrySet:
    SEC
    RTS

  .returnCarryClear:
    CLC
    RTS


;;; $F840: Initialise Samus pose - unused pose 3Ah ;;;
UNUSED_InitializeSamusPose_UnusedPose3A_91F840:
;; Returns:
;;     Carry: Set. Movement changed
    LDA.W PreviousMovementType : AND.W #$00FF : CMP.W #$0008 : BEQ .wasFalling
    CMP.W #$0013 : BEQ .wasFalling
    LDA.W EquippedItems : BIT.W #$0000 : BNE .returnCarryClear
    BIT.W #$0002 : BNE .springBall
    LDA.W #$0041 : STA.W Pose
    BRA .returnCarrySet

  .springBall:
    LDA.W #$007A : STA.W Pose
    BRA .returnCarrySet

  .wasFalling:
    LDA.W EquippedItems : BIT.W #$0000 : BNE .returnCarryClear
    BIT.W #$0002 : BNE ..springBall
    LDA.W #$0032 : STA.W Pose
    BRA .returnCarrySet

  ..springBall:
    LDA.W #$007E : STA.W Pose

  .returnCarrySet:
    SEC
    RTS

  .returnCarryClear:
    CLC
    RTS


;;; $F88C: Initialise Samus pose - moonwalking ;;;
InitializeSamusPose_Moonwalking:
;; Returns:
;;     Carry: Set if movement changed, otherwise clear
    LDA.W Moonwalk : BEQ .enabled
    CLC
    RTS

  .enabled:
    LDA.W PoseXDirection : AND.W #$00FF : CMP.W #$0004 : BEQ .facingLeft
    LDA.W #$0026 : STA.W Pose
    BRA .returnCarrySet

  .facingLeft:
    LDA.W #$0025 : STA.W Pose

  .returnCarrySet:
    SEC
    RTS


;;; $F8AE: Initialise Samus pose - damage boost ;;;
InitializeSamusPose_DamageBoost:
;; Returns:
;;     Carry: Clear. No movement change

; Looks like a BRA past leftover code to me
    BRA .nonDeadCode

    LDA.W PoseXDirection : AND.W #$00FF : CMP.W #$0004 : BEQ .facingLeft
    LDA.W #$0053 : STA.W Pose
    BRA .returnCarrySet

  .facingLeft:
    LDA.W #$0054 : STA.W Pose

  .returnCarrySet:
    SEC
    RTS

  .nonDeadCode:
    LDA.W #SamusMovementHandler_Normal : STA.W MovementHandler
    CLC
    RTS


;;; $F8D3: Initialise Samus pose - turning around - on ground ;;;
InitializeSamusPose_TurningAround_OnGround:
;; Returns:
;;     Carry: Set. Movement changed
    LDA.W PreviousPose : BEQ .done
    CMP.W #$009B : BEQ .done
    ASL #3 : TAX
    LDA.W PoseDefinitions_directionShotsFired,X : AND.W #$00FF : TAX
    LDA.W PreviousMovementType : AND.W #$00FF : CMP.W #$0010 : BNE .notMoonwalking
    LDA.W PreviousPose : ASL #3 : TAY
    LDA.W PoseDefinitions_directionShotsFired,Y : AND.W #$00FF : ORA.W #$0100 : STA.W PoseTransitionShotDirection
    LDA.B DP_Controller1Input : BIT.W JumpBinding : BEQ .standing
    LDA.W TurningSamusPoses_moonwalk,X : AND.W #$00FF : STA.W Pose
    BRA .done

  .notMoonwalking:
    CMP.W #$0005 : BEQ .crouching

  .standing:
    LDA.W TurningSamusPoses_standing,X : AND.W #$00FF : STA.W Pose
    BRA .done

  .crouching:
    LDA.W TurningSamusPoses_crouching,X : AND.W #$00FF : STA.W Pose

  .done:
    LDA.W SamusXExtraRunSubSpeed : CLC : ADC.W SamusXBaseSubSpeed : STA.W SamusXBaseSubSpeed
    LDA.W SamusXExtraRunSpeed : ADC.W SamusXBaseSpeed : STA.W SamusXBaseSpeed
    STZ.W SamusXExtraRunSubSpeed : STZ.W SamusXExtraRunSpeed
    LDA.W #$0001 : STA.W SamusXAccelerationMode
    SEC
    RTS


;;; $F952: Initialise Samus pose - turning around - jumping ;;;
InitializeSamusPose_TurningAround_Jumping:
;; Returns:
;;     Carry: Set. Movement changed
    LDA.W PreviousPose : ASL #3 : TAX
    LDA.W PoseDefinitions_directionShotsFired,X : AND.W #$00FF : TAX
    LDA.W TurningSamusPoses_jumpingInAir,X : AND.W #$00FF : STA.W Pose
    LDA.W SamusXExtraRunSubSpeed : CLC : ADC.W SamusXBaseSubSpeed : STA.W SamusXBaseSubSpeed
    LDA.W SamusXExtraRunSpeed : ADC.W SamusXBaseSpeed : STA.W SamusXBaseSpeed
    STZ.W SamusXExtraRunSubSpeed : STZ.W SamusXExtraRunSpeed
    LDA.W #$0001 : STA.W SamusXAccelerationMode
    SEC
    RTS


;;; $F98A: Initialise Samus pose - turning around - falling ;;;
InitializeSamusPose_TurningAround_Falling:
;; Returns:
;;     Carry: Set. Movement changed
    LDA.W PreviousPose : ASL #3 : TAX
    LDA.W PoseDefinitions_directionShotsFired,X : AND.W #$00FF : TAX
    LDA.W TurningSamusPoses_falling,X : AND.W #$00FF : STA.W Pose
    LDA.W SamusXExtraRunSubSpeed : CLC : ADC.W SamusXBaseSubSpeed : STA.W SamusXBaseSubSpeed
    LDA.W SamusXExtraRunSpeed : ADC.W SamusXBaseSpeed : STA.W SamusXBaseSpeed
    STZ.W SamusXExtraRunSubSpeed : STZ.W SamusXExtraRunSpeed
    LDA.W #$0001 : STA.W SamusXAccelerationMode
    SEC
    RTS


;;; $F9C2: Turning Samus poses ;;;
TurningSamusPoses:
;        _____________________________________ Up, facing right
;       |    _________________________________ Up-right
;       |   |    _____________________________ Right
;       |   |   |    _________________________ Down-right, facing right
;       |   |   |   |    _____________________ Down-right, facing left
;       |   |   |   |   |    _________________ Down-left
;       |   |   |   |   |   |    _____________ Down-left
;       |   |   |   |   |   |   |    _________ Left
;       |   |   |   |   |   |   |   |    _____ Up-left
;       |   |   |   |   |   |   |   |   |    _ Up, facing left
;       |   |   |   |   |   |   |   |   |   |
  .standing:
    db $8B,$9C,$25,$8D,$8D,$8E,$8E,$26,$9D,$8C
  .crouching:
    db $97,$A2,$43,$99,$99,$9A,$9A,$44,$A3,$98
  .jumpingInAir:
    db $8F,$9E,$2F,$91,$91,$92,$92,$30,$9F,$90
  .falling:
    db $93,$A0,$87,$95,$95,$96,$96,$88,$A1,$94
  .moonwalk:
    db $C1,$C1,$BF,$C3,$8D,$8E,$C4,$C0,$C2,$C2


;;; $F9F4: Initialise Samus pose - morph ball ;;;
InitializeSamusPose_MorphBall:
;; Returns:
;;     Carry: Clear. No movement change
    LDA.W PreviousMovementType : AND.W #$00FF : CMP.W #$0004 : BEQ .preserveAnimationFrame
    CMP.W #$0008 : BNE .wasNotMorphBall

  .preserveAnimationFrame:
    LDA.W #$8000 : STA.W NewPoseSamusAnimationFrame

  .wasNotMorphBall:
    JSR ApplyMomentumIfTurningInMorphBall
    CLC
    RTS


;;; $FA0F: Apply momentum if turning in morph ball ;;;
ApplyMomentumIfTurningInMorphBall:
    LDA.W PreviousPoseXDirection : AND.W #$00FF : CMP.W #$0008 : BEQ .directionChanged
    LDA.W PoseXDirection : AND.W #$00FF : CMP.W #$0008 : BEQ .speed
    BRA .return

  .directionChanged:
    LDA.W PoseXDirection : AND.W #$00FF : CMP.W #$0004 : BNE .return

  .speed:
    LDA.W SamusXExtraRunSubSpeed : CLC : ADC.W SamusXBaseSubSpeed : STA.W SamusXBaseSubSpeed
    LDA.W SamusXExtraRunSpeed : ADC.W SamusXBaseSpeed : STA.W SamusXBaseSpeed
    JSL Cancel_SpeedBoosting
    STZ.W SamusXExtraRunSubSpeed : STZ.W SamusXExtraRunSpeed
    LDA.W #$0001 : STA.W SamusXAccelerationMode

  .return:
    RTS


;;; $FA56: Initialise Samus pose - spring ball ;;;
InitializeSamusPose_SpringBall:
;; Returns:
;;     Carry: Clear. No movement change
    LDA.W PreviousMovementType : AND.W #$00FF : CMP.W #$0011 : BEQ .preserveAnimationFrame
    CMP.W #$0012 : BEQ .preserveAnimationFrame
    CMP.W #$0013 : BNE .wasNotSpringBall

  .preserveAnimationFrame:
    LDA.W #$8000 : STA.W NewPoseSamusAnimationFrame

  .wasNotSpringBall:
    JSR ApplyMomentumIfTurningInMorphBall
    CLC
    RTS


;;; $FA76: Initialise Samus pose - wall jumping ;;;
InitializeSamusPose_WallJumping:
;; Returns:
;;     Carry: Clear. No movement change
    JSL Get_Samus_Bottom_Boundary
    LDA.W FX_YPosition : BMI .negativeYPosition
    CMP.B DP_Temp12 : BPL .nonLiquidPhysics
    LDA.W FX_LiquidOptions : BIT.W #$0004 : BNE .nonLiquidPhysics
    BRA .returnCarryClear

  .negativeYPosition:
    LDA.W FX_LavaAcidYPosition : BMI .nonLiquidPhysics
    CMP.B DP_Temp12 : BMI .returnCarryClear

  .nonLiquidPhysics:
    LDA.W #$0600 : STA.W AtmosphericGraphicsAnimFramesGraphicsTypes+6
    LDA.W #$0003 : STA.W AtmosphericGraphicsAnimationTimers+6
    LDA.B DP_Temp12 : STA.W AtmosphericGraphicsYPositions+6
    LDA.W PoseXDirection : AND.W #$00FF : CMP.W #$0008 : BEQ .facingRight
    LDA.W SamusXPosition : CLC : ADC.W #$0006 : STA.W AtmosphericGraphicsXPositions+6
    CLC
    RTS

  .facingRight:
    LDA.W SamusXPosition : SEC : SBC.W #$0006 : STA.W AtmosphericGraphicsXPositions+6

  .returnCarryClear:
    CLC
    RTS


;;; $FACA: Initialise Samus pose - shinespark / crystal flash / drained by metroid / damaged by MB's attacks ;;;
InitializeSamusPose_Shinespark_CF_Drained_DamagedMB:
;; Returns:
;;     Carry: Clear. No movement change
    LDA.W Pose : CMP.W #$00CF : BPL .returnCarryClear
    SEC : SBC.W #$00C9 : ASL : TAX
    LDA.W .pointers,X : STA.W MovementHandler
    LDA.W #RTS_90E90E : STA.W PoseInputHandler
    STZ.W SpeedEcho_Index
    STZ.W SpeedEcho_XSpeed0 : STZ.W SpeedEcho_XSpeed1
    STZ.W SpeedEcho_XPosition0 : STZ.W SpeedEcho_XPosition1
    LDA.W #$000F
    JSL QueueSound_Lib3_Max9

  .returnCarryClear:
    CLC
    RTS

  .pointers:
    dw SamusMovementHandler_HorizontalShinespark                         ; C9h: Facing right - shinespark - horizontal
    dw SamusMovementHandler_HorizontalShinespark                         ; CAh: Facing left-   shinespark - horizontal
    dw SamusMovementHandler_VerticalShinespark                           ; CBh: Facing right - shinespark - vertical
    dw SamusMovementHandler_VerticalShinespark                           ; CCh: Facing left-   shinespark - vertical
    dw SamusMovementHandler_DiagonalShinespark                           ; CDh: Facing right - shinespark - diagonal
    dw SamusMovementHandler_DiagonalShinespark                           ; CEh: Facing left-   shinespark - diagonal


;;; $FB08: Set Samus animation frame if pose changed ;;;
Set_Samus_AnimationFrame_if_PoseChanged:
    PHP : PHB
    PHK : PLB
    REP #$30
    LDA.W EquippedItems : BIT.W #$0020 : BNE .normalGravity
    LDA.W Pose : ASL #3 : TAX
    LDA.L PoseDefinitions_YRadius,X : AND.W #$00FF : CLC : ADC.W SamusYPosition
    DEC : STA.B DP_Temp12
    LDA.W FX_YPosition : BMI .negativeYPosition
    CMP.B DP_Temp12 : BMI .submergedInWater
    BRA .normalGravity

  .negativeYPosition:
    LDA.W FX_LavaAcidYPosition : BMI .normalGravity
    CMP.B DP_Temp12 : BMI .submergedInAcidLava

  .normalGravity:
    LDA.W XSpeedDivisor : STA.B DP_Temp12
    BRA .merge

  .submergedInWater:
    LDA.W FX_LiquidOptions : BIT.W #$0004 : BNE .normalGravity
    LDA.L SamusPhysicsConstants_AnimationDelayInWater : STA.B DP_Temp12
    BRA .merge

  .submergedInAcidLava:
    LDA.L SamusPhysicsConstants_AnimationDelayInLavaAcid : STA.B DP_Temp12

  .merge:
    LDA.W NewPoseSamusAnimationFrame : BMI .return
    LDA.W Pose : CMP.W PreviousPose : BEQ .return
    LDA.W #$0000 : CLC : ADC.W NewPoseSamusAnimationFrame : STA.W SamusAnimationFrame
    TAY
    LDA.W Pose : ASL : TAX
    TYA : CLC : ADC.W AnimationDelayTable,X : TAY
    LDA.W $0000,Y : AND.W #$00FF : CLC : ADC.B DP_Temp12 : STA.W SamusAnimationFrameTimer

  .return:
    PLB
    PLP
    RTL


;;; $FB8E:  ;;;
PossiblyNoPurpose_91FB8E:
; Don't think this routine serves any purpose...
; Called by:
;     $EC50: Prospective pose change command 1 - decelerate
;     $EC85: Prospective pose change command 6 - kill X speed
;     $EC8E: Prospective pose change command 8 - kill run speed

; In the $EC50 case, Samus movement type is running / normal jumping / morph ball in air, so this routine will never reach $FBAC
; In the $EC85 case, Samus movement type is morph ball on ground / spring ball / wall jumping / grappling, so this routine will never reach $FBAC
; In the $EC8E case, Samus movement type is falling, but that command is only set due to transition table lookup failure, so the previous movement type will also be falling
    PHP : PHB
    PHK : PLB
    REP #$30
    LDA.W PreviousMovementType : AND.W #$00FF : CMP.W #$0006 : BEQ .return
    LDA.W MovementType : AND.W #$00FF : CMP.W #$0006 : BEQ .falling
    BRA .return

  .falling:
    STZ.W SamusYSubSpeed : STZ.W SamusYSpeed
    LDA.W #$0002 : STA.W SamusYDirection

  .return:
    PLB : PLP
    RTL


;;; $FBBB: Handle jump transition ;;;
HandleJumpTransition:
    PHP : PHB
    PHK : PLB
    REP #$30
    LDA.W MovementType : AND.W #$00FF : ASL : TAX
    JSR.W (.pointers,X)
    PLB : PLP
    RTL

  .pointers:
    dw RTS_91FC07                                                        ;  0: Standing
    dw RTS_91FC07                                                        ;  1: Running
    dw HandleJumpTransition_NormalJumping                                ; *2: Normal jumping
    dw HandleJumpTransition_SpinJumping                                  ; *3: Spin jumping
    dw RTS_91FC07                                                        ;  4: Morph ball - on ground
    dw RTS_91FC07                                                        ;  5: Crouching
    dw RTS_91FC07                                                        ;  6: Falling
    dw RTS_91FC07                                                        ;  7: Unused
    dw RTS_91FC07                                                        ;  8: Morph ball - falling
    dw RTS_91FC07                                                        ;  9: Unused
    dw RTS_91FC07                                                        ;  Ah: Knockback / crystal flash ending
    dw RTS_91FC07                                                        ;  Bh: Unused
    dw RTS_91FC07                                                        ;  Ch: Unused
    dw UNUSED_HandleJumpTransition_MovementTypeD_91FC42                  ; *Dh: Unused
    dw RTS_91FC07                                                        ;  Eh: Turning around - on ground
    dw RTS_91FC07                                                        ;  Fh: Crouching/standing/morphing/unmorphing transition
    dw RTS_91FC07                                                        ;  10h: Moonwalking
    dw RTS_91FC07                                                        ;  11h: Spring ball - on ground
    dw HandleJumpTransition_SpringBall_InAir                             ; *12h: Spring ball - in air
    dw RTS_91FC07                                                        ;  13h: Spring ball - falling
    dw HandleJumpTransition_WallJumping                                  ; *14h: Wall jumping
    dw RTS_91FC07                                                        ;  15h: Ran into a wall
    dw RTS_91FC07                                                        ;  16h: Grappling
    dw RTS_91FC07                                                        ;  17h: Turning around - jumping
    dw RTS_91FC07                                                        ;  18h: Turning around - falling
    dw RTS_91FCAE                                                        ;  19h: Damage boost
    dw RTS_91FC07                                                        ;  1Ah: Grabbed by Draygon
    dw RTS_91FC07                                                        ;  1Bh: Shinespark / crystal flash / drained by metroid / damaged by MB's attacks


;;; $FC07: RTS ;;;
RTS_91FC07:
    RTS


;;; $FC08: Handle jump transition - wall jumping ;;;
HandleJumpTransition_WallJumping:
    LDA.W PreviousMovementType : AND.W #$00FF : CMP.W #$0014 : BEQ .return
    JSL Make_Samus_WallJump

  .return:
    RTS


;;; $FC18: Handle jump transition - spring ball - in air ;;;
HandleJumpTransition_SpringBall_InAir:
    LDA.W Pose : CMP.W #$007F : BNE .facingLeft
    LDA.W PreviousMovementType : AND.W #$00FF : CMP.W #$0011 : BEQ .jump
    BRA .return

  .facingLeft:
    CMP.W #$0080 : BNE .return
    LDA.W PreviousMovementType : AND.W #$00FF : CMP.W #$0011 : BNE .return

  .jump:
    JSL Make_Samus_Jump

  .return:
    RTS


;;; $FC42: Handle jump transition - Samus movement type Dh (unused) ;;;
UNUSED_HandleJumpTransition_MovementTypeD_91FC42:
; Poses 63h..66h are all of the movement type Dh poses (and are all unused)
    LDA.W Pose : CMP.W #$0065 : BNE .notPose65
    LDA.W PreviousPose : CMP.W #$0064 : BEQ .jump
    BRA .return

  .notPose65:
    CMP.W #$0066 : BNE .return
    LDA.W PreviousPose : CMP.W #$0063 : BNE .return

  .jump:
    JSL Make_Samus_Jump

  .return:
    RTS


;;; $FC66: Handle jump transition - normal jumping ;;;
HandleJumpTransition_NormalJumping:
    LDA.W Pose : CMP.W #$004B : BEQ .normalJump
    CMP.W #$004C : BEQ .normalJump
    CMP.W #$0055 : BMI .return
    CMP.W #$005B : BPL .return

  .normalJump:
    LDA.W PreviousPose : CMP.W #$0027 : BEQ .crouchJump
    CMP.W #$0028 : BNE .jump

  .crouchJump:
    LDA.W SamusYPosition : SEC : SBC.W #$000A : STA.W SamusYPosition

  .jump:
    JSL Make_Samus_Jump

  .return:
    RTS


;;; $FC99: Handle jump transition - spin jumping ;;;
HandleJumpTransition_SpinJumping:
    LDA.W PreviousMovementType : AND.W #$00FF : CMP.W #$0003 : BEQ .return
    CMP.W #$0014 : BEQ .return
    JSL Make_Samus_Jump

  .return:
    RTS


;;; $FCAE: RTS ;;;
RTS_91FCAE:
    RTS


;;; $FCAF: X-ray Samus pose input handler ;;;
XraySamusPoseInputHandler:
    PHP
    REP #$30
    LDA.W MovementType : AND.W #$00FF : CMP.W #$000E : BNE .notTurningOnGround
    JMP .turningOnGround

  .notTurningOnGround:
    LDA.W PoseXDirection : AND.W #$00FF : CMP.W #$0004 : BEQ .notTurningFacingLeft
    LDA.B DP_Controller1Input : BIT.W LeftBinding : BEQ .returnMiddle
    LDA.W #$0100 : SEC : SBC.W Xray_Angle : STA.W Xray_Angle
    LDA.W MovementType : AND.W #$00FF : CMP.W #$0005 : BEQ ..crouching
    LDA.W #$0025 : STA.W Pose
    BRA .notTurningMerge

  ..crouching:
    LDA.W #$0043 : STA.W Pose
    BRA .notTurningMerge

  .notTurningFacingLeft:
    LDA.B DP_Controller1Input : BIT.W RightBinding : BEQ .returnMiddle
    LDA.W #$0100 : SEC : SBC.W Xray_Angle : STA.W Xray_Angle
    LDA.W MovementType : AND.W #$00FF : CMP.W #$0005 : BEQ ..crouching
    LDA.W #$0026 : STA.W Pose
    BRA .notTurningMerge

  ..crouching:
    LDA.W #$0044 : STA.W Pose

  .notTurningMerge:
    JSL InitializeSamusPose_1
    JSL Set_Samus_AnimationFrame_if_PoseChanged
    LDA.W PreviousPose : STA.W LastDifferentPose
    LDA.W PreviousPoseXDirection : STA.W LastDifferentPoseXDirection
    LDA.W Pose : STA.W PreviousPose
    LDA.W PoseXDirection : STA.W PreviousPoseXDirection

  .returnMiddle:
    PLP
    RTL

  .turningOnGround:
    LDA.W SamusAnimationFrame : CMP.W #$0002 : BNE .returnLower
    LDA.W SamusAnimationFrameTimer : CMP.W #$0001 : BNE .returnLower
    LDA.W PoseXDirection : AND.W #$00FF : CMP.W #$0004 : BEQ .turningFacingLeft
    LDA.W Pose : CMP.W #$0026 : BNE ..crouching
    LDA.W #$00D5 : STA.W Pose
    BRA .turningMerge

  ..crouching:
    LDA.W #$00D9 : STA.W Pose
    BRA .turningMerge

  .turningFacingLeft:
    LDA.W Pose : CMP.W #$0025 : BNE ..XrayCrouching
    LDA.W #$00D6 : STA.W Pose
    BRA .turningMerge

  ..XrayCrouching:
    LDA.W #$00DA : STA.W Pose

  .turningMerge:
    JSL InitializeSamusPose_1
    JSL Set_Samus_AnimationFrame_if_PoseChanged
    LDA.W PreviousPose : STA.W LastDifferentPose
    LDA.W PreviousPoseXDirection : STA.W LastDifferentPoseXDirection
    LDA.W Pose : STA.W PreviousPose
    LDA.W PoseXDirection : STA.W PreviousPoseXDirection

  .returnLower:
    PLP
    RTL


;;; $FDAE: Handle collision due to change of pose ;;;
HandlePoseChangeCollision:
; Does nothing if facing forward.

; Check for collisions with solid enemies and blocks due to change of pose,
; adjusts Samus Y position accordingly to be flush with any colliding boundaries.

; If Samus collides with surfaces in both above and below,
; attempts to put her in crouch (if not morphed) with position flush to bottom boundary,
; if morphed, disallows new pose.

; If Samus collides with surface either above or below,
; and Samus would collide with opposite surface due to position adjustment,
; new pose is disallowed.

; The result stored to SamusSolidCollisionFlag is unused
    PHP
    REP #$30
    LDA.W Pose : BEQ .returnUpper
    CMP.W #$009B : BNE .notFacingForward

  .returnUpper:
    PLP
    RTS

  .notFacingForward:
    STZ.W SolidEnemyCollisionFlags : STZ.W BlockCollisionFlags
    LDA.W Pose : ASL #3 : TAX
    LDA.L PoseDefinitions_YRadius,X : AND.W #$00FF : STA.B DP_Temp12
    LDA.W PreviousPose : ASL #3 : TAX
    LDA.L PoseDefinitions_YRadius,X : AND.W #$00FF : CMP.B DP_Temp12 : BMI .larger
    PLP
    RTS

  .larger:
    STA.W SamusYRadius
    LDA.B DP_Temp12 : SEC : SBC.W SamusYRadius : STA.W YRadiusDifference : STA.B DP_Temp12
    STZ.B DP_Temp14
    LDA.W #$0002 : STA.W CollisionMovementDirection
    JSL Samus_vs_SolidEnemy_CollisionDetection
    STA.W SamusSolidCollisionFlag
    TAX : BEQ .noCollision
    LDA.W #$0001 : STA.W SolidEnemyCollisionFlags

  .noCollision:
    LDA.B DP_Temp12 : STA.W SpaceToMoveUpEnemy
    LDA.W YRadiusDifference : STA.B DP_Temp12
    STZ.B DP_Temp14
    LDA.W #$0003 : STA.W CollisionMovementDirection
    JSL Samus_vs_SolidEnemy_CollisionDetection
    STA.W SamusSolidCollisionFlag
    TAX : BEQ .stillNoCollision
    LDA.W SolidEnemyCollisionFlags : ORA.W #$0002 : STA.W SolidEnemyCollisionFlags

  .stillNoCollision:
    LDA.B DP_Temp12 : STA.W SpaceToMoveDownEnemy
    LDA.W SolidEnemyCollisionFlags : ASL : TAX
    JSR.W (.solidEnemyPointers,X)
    BCS .revertPose
    LDA.W YRadiusDifference : EOR.W #$FFFF : INC : STA.B DP_Temp12
    STZ.B DP_Temp14
    JSL BlockCollisionDetectionDueToChangeOfPose
    BCC .noCollisionAgain
    LDA.W #$0001 : STA.W BlockCollisionFlags

  .noCollisionAgain:
    LDA.B DP_Temp12 : STA.W SpaceToMoveUpBlock
    LDA.W YRadiusDifference : STA.B DP_Temp12
    STZ.B DP_Temp14
    JSL BlockCollisionDetectionDueToChangeOfPose
    BCC .noCollisionFinal
    LDA.W BlockCollisionFlags : ORA.W #$0002 : STA.W BlockCollisionFlags

  .noCollisionFinal:
    LDA.B DP_Temp12 : STA.W SpaceToMoveDownBlock
    LDA.W BlockCollisionFlags : ASL : TAX
    JSR.W (.blockPointers,X)
    BCC .return

  .revertPose:
    LDA.W PreviousPose : STA.W Pose

  .return:
    PLP
    RTS

  .solidEnemyPointers:
    dw CLCRTS_91FE9A
    dw PoseChangeCollision_SolidEnemy_FromAbove
    dw PoseChangeCollision_SolidEnemy_FromBelow
    dw CLCRTS_91FE9C

  .blockPointers:
    dw PoseChangeCollision_NoCollision
    dw PoseChangeCollision_Block_FromAbove
    dw PoseChangeCollision_Block_FromBelow
    dw HandleCollisionFromBothSidesDueToPoseChange


;;; $FE9A: Clear carry. Handle solid enemy collision due to pose change - no collision ;;;
CLCRTS_91FE9A:
    CLC
    RTS


;;; $FE9C: Clear carry. Handle solid enemy collision due to pose change - collision from both sides ;;;
CLCRTS_91FE9C:
    CLC
    RTS


;;; $FE9E: Handle solid enemy collision due to pose change - collision from above ;;;
PoseChangeCollision_SolidEnemy_FromAbove:
;; Returns:
;;     Carry: Set if there's no space for Samus pose, clear otherwise

; The result stored to SamusSolidCollisionFlag is unused
    LDA.W YRadiusDifference : SEC : SBC.W SpaceToMoveUpEnemy : STA.B DP_Temp12
    STZ.B DP_Temp14
    LDA.W SamusYRadius : PHA
    LDA.W Pose : ASL #3 : TAX
    LDA.L PoseDefinitions_YRadius,X : AND.W #$00FF : STA.W SamusYRadius
    LDA.W #$0003 : STA.W CollisionMovementDirection
    JSL Samus_vs_SolidEnemy_CollisionDetection
    STA.W SamusSolidCollisionFlag
    TAX : BNE .collision
    LDA.B DP_Temp12 : STA.W SpaceToMoveUpEnemy
    PLA : STA.W SamusYRadius
    CLC
    RTS

  .collision:
    PLA : STA.W SamusYRadius
    SEC
    RTS


;;; $FEDF: Handle solid enemy collision due to pose change - collision from below ;;;
PoseChangeCollision_SolidEnemy_FromBelow:
;; Returns:
;;     Carry: Set if there's no space for Samus pose, clear otherwise

; The result stored to SamusSolidCollisionFlag is unused
    LDA.W YRadiusDifference : SEC : SBC.W SpaceToMoveDownEnemy : STA.B DP_Temp12
    STZ.B DP_Temp14
    LDA.W SamusYRadius : PHA
    LDA.W Pose : ASL #3 : TAX
    LDA.L PoseDefinitions_YRadius,X : AND.W #$00FF : STA.W SamusYRadius
    LDA.W #$0002 : STA.W CollisionMovementDirection
    JSL Samus_vs_SolidEnemy_CollisionDetection
    STA.W SamusSolidCollisionFlag
    TAX : BNE .collision
    LDA.B DP_Temp12 : STA.W SpaceToMoveDownEnemy
    PLA : STA.W SamusYRadius
    CLC
    RTS

  .collision:
    PLA : STA.W SamusYRadius
    SEC
    RTS


;;; $FF20: Handle block collision due to pose change - collision from above ;;;
PoseChangeCollision_Block_FromAbove:
;; Returns:
;;     Carry: Set if there's no space for Samus pose, clear otherwise
    LDA.W YRadiusDifference : SEC : SBC.W SpaceToMoveUpBlock : STA.B DP_Temp12
    STZ.B DP_Temp14
    JSL BlockCollisionDetectionDueToChangeOfPose
    BCS .returnCarrySet
    LDA.W SolidEnemyCollisionFlags : BIT.W #$0002 : BNE HandleCollisionFromBothSidesDueToPoseChange
    LDA.W SamusYPosition : CLC : ADC.B DP_Temp12 : STA.W SamusYPosition : STA.W SamusPreviousYPosition
    CLC
    RTS

  .returnCarrySet:
    SEC
    RTS


;;; $FF49: Handle block collision due to pose change - collision from below ;;;
PoseChangeCollision_Block_FromBelow:
;; Returns:
;;     Carry: Set if there's no space for Samus pose, clear otherwise
    LDA.W YRadiusDifference : SEC : SBC.W SpaceToMoveDownBlock
    EOR.W #$FFFF : INC : STA.B DP_Temp12
    STZ.B DP_Temp14
    JSL BlockCollisionDetectionDueToChangeOfPose
    BCS .returnCarrySet
    LDA.W SolidEnemyCollisionFlags : BIT.W #$0001 : BNE HandleCollisionFromBothSidesDueToPoseChange
    LDA.W SamusYPosition : SEC : SBC.B DP_Temp12 : STA.W SamusYPosition : STA.W SamusPreviousYPosition
    CLC
    RTS

  .returnCarrySet:
    SEC
    RTS


;;; $FF76: Handle block collision due to pose change - no collision ;;;
PoseChangeCollision_NoCollision:
;; Returns:
;;     Carry: Set if there's no space for Samus pose, clear otherwise
    LDA.W SolidEnemyCollisionFlags : ASL : TAX
    JMP.W (.pointers,X)
    RTS ; >.<

  .pointers:
    dw CLCRTS_91FF87
    dw HandleBlockCollisionToPoseChange_NoCollision_Enemy_FromAbove
    dw HandleBlockCollisionToPoseChange_NoCollision_Enemy_FromBelow
    dw HandleCollisionFromBothSidesDueToPoseChange


;;; $FF87: Clear carry. Handle block collision to pose change - no collision - no solid enemy collision ;;;
CLCRTS_91FF87:
    CLC
    RTS


;;; $FF89: Handle block collision to pose change - no collision - solid enemy collision from above ;;;
HandleBlockCollisionToPoseChange_NoCollision_Enemy_FromAbove:
;; Returns:
;;     Carry: Clear. There's space for Samus pose
    LDA.W SamusYPosition : CLC : ADC.W SpaceToMoveUpEnemy : STA.W SamusYPosition : STA.W SamusPreviousYPosition
    CLC
    RTS


;;; $FF98: Handle block collision to pose change - no collision - solid enemy collision from below ;;;
HandleBlockCollisionToPoseChange_NoCollision_Enemy_FromBelow:
;; Returns:
;;     Carry: Clear. There's space for Samus pose
    LDA.W SamusYPosition : SEC : SBC.W SpaceToMoveDownEnemy : STA.W SamusYPosition : STA.W SamusPreviousYPosition
    CLC
    RTS


;;; $FFA7: Handle collision from both sides due to pose change ;;;
HandleCollisionFromBothSidesDueToPoseChange:
;; Returns:
;;     Carry: Set if there's no space for Samus pose, clear otherwise
    LDA.W SamusYRadius : CMP.W #$0008 : BPL .notMorphBall
    SEC
    RTS

  .notMorphBall:
    LDA.W PoseXDirection : AND.W #$00FF : CMP.W #$0004 : BEQ .facingLeft
    LDA.W #$0027
    BRA +

  .facingLeft:
    LDA.W #$0028

+   STA.W Pose : ASL #3 : TAX
    LDA.L PoseDefinitions_YRadius,X : AND.W #$00FF : STA.B DP_Temp12
    LDA.W SamusYRadius : CMP.B DP_Temp12 : BPL .returnCarryClear
    SEC : SBC.B DP_Temp12 : STA.B DP_Temp12
    LDA.W SamusYPosition : CLC : ADC.B DP_Temp12 : STA.W SamusYPosition : STA.W SamusPreviousYPosition

  .returnCarryClear:
    CLC
    RTS


Freespace_Bank91_FFEE:
; $12 bytes
