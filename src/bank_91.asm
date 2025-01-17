
org $918000


NormalSamusPoseInputHandler:
    PHP 
    PHB 
    PHK 
    PLB 
    REP #$30 
    LDA.W $0A1F 
    AND.W #$00FF 
    ASL A 
    TAX 
    JSR.W (.pointers,X) 
    PLB 
    PLP 
    RTL 


.pointers:
    dw NormalSamusPoseInputHandler_Standing 
    dw NormalSamusPoseInputHandler_1_Running 
    dw NormalSamusPoseInputHandler_NormalJumping 
    dw NormalSamusPoseInputHandler_SpinJumping 
    dw NormalSamusPoseInputHandler_MorphBall_OnGround 
    dw NormalSamusPoseInputHandler_Crouching 
    dw NormalSamusPoseInputHandler_Falling 
    dw RTS_918086 
    dw NormalSamusPoseInputHandler_MorphBall_Falling 
    dw RTS_918112 
    dw NormalSamusPoseInputHandler_Knockback_CrystalFlashEnding 
    dw RTS_91812D 
    dw NormalSamusPoseInputHandler_C_DetermineProspectivePose 
    dw NormalSamusPoseInputHandler_D_DetermineProspectivePose 
    dw NormalSamusPoseInputHandler_TurningAround_OnGround 
    dw RTS_918146 
    dw NormalSamusPoseInputHandler_Moonwalking 
    dw NormalSamusPoseInputHandler_SpringBall_OnGround 
    dw NormalSamusPoseInputHandler_SpringBall_InAir 
    dw NormalSamusPoseInputHandler_SpringBall_Falling 
    dw NormalSamusPoseInputHandler_WallJumping 
    dw NormalSamusPoseInputHandler_RanIntoAWall 
    dw NormalSamusPoseInputHandler_Grappling 
    dw NormalSamusPoseInputHandler_TurningAround_Jumping 
    dw NormalSamusPoseInputHandler_TurningAround_Falling 
    dw NormalSamusPoseInputHandler_DamageBoost 
    dw NormalSamusPoseInputHandler_GrabbedByDraygon 
    dw NormalSamusPoseInputHandler_Shinespark_CF_Drained_DamagedMB 

RTS_91804C:
    RTS 


NormalSamusPoseInputHandler_Standing:
    PHP 
    REP #$30 
    LDA.W $0A1C 
    BEQ .facingForward 
    CMP.W #$009B 
    BEQ .facingForward 
    BRA .notFacingForward 


.facingForward:
    LDA.W $0E18 
    BNE .return 

.notFacingForward:
    JSR.W DetermineProspectivePoseFromTransitionTable 

.return:
    PLP 
    RTS 


NormalSamusPoseInputHandler_1_Running:
    PHP 
    REP #$30 
    JSR.W DetermineProspectivePoseFromTransitionTable 
    PLP 
    RTS 


NormalSamusPoseInputHandler_NormalJumping:
    PHP 
    REP #$30 
    JSR.W DetermineProspectivePoseFromTransitionTable 
    PLP 
    RTS 


NormalSamusPoseInputHandler_SpinJumping:
    PHP 
    REP #$30 
    JSR.W DetermineProspectivePoseFromTransitionTable 
    PLP 
    RTS 


NormalSamusPoseInputHandler_MorphBall_OnGround:
    PHP 
    REP #$30 
    JSR.W DetermineProspectivePoseFromTransitionTable 
    PLP 
    RTS 


RTS_918086:
    RTS 


NormalSamusPoseInputHandler_Crouching:
    PHP 
    REP #$30 
    LDA.W $0A78 
    BNE .timeIsFrozen 
    JSR.W DetermineProspectivePoseFromTransitionTable 
    LDA.W $0A1F 
    AND.W #$00FF 
    BNE .return 
    LDA.W $0AFA 
    SEC 
    SBC.W #$0005 
    STA.W $0AFA 
    LDA.W $0B14 
    SEC 
    SBC.W #$0005 
    STA.W $0B14 
    BRA .return 


.timeIsFrozen:
    JSL.L XraySamusPoseInputHandler 

.return:
    PLP 
    RTS 


NormalSamusPoseInputHandler_Falling:
    PHP 
    REP #$30 
    JSR.W DetermineProspectivePoseFromTransitionTable 
    PLP 
    RTS 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_AutoJumpFromCrouchFall_9180BE:
    LDA.W $0A1C 
    CMP.W #$0029 
    BEQ .fallingNotAiming 
    CMP.W #$002A 
    BNE .return 

.fallingNotAiming:
    LDA.W $0A27 
    AND.W #$00FF 
    CMP.W #$0005 
    BEQ .return 
    LDA.B $8B 
    BIT.W #$0300 
    BNE .return 
    LDA.W $0B2E 
    BNE .return 
    LDA.B $8F 
    BIT.W $09B4 
    BEQ .return 
    LDA.W $0A1E 
    AND.W #$00FF 
    CMP.W #$0004 
    BEQ .facingLeft 
    LDA.W #$004D 
    STA.W $0A2A 
    BRA .command4 


.facingLeft:
    LDA.W #$004E 
    STA.W $0A2A 

.command4:
    LDA.W #$0004 
    STA.W $0A30 

.return:
    PLP 
    RTS 
endif ; !FEATURE_KEEP_UNREFERENCED


NormalSamusPoseInputHandler_MorphBall_Falling:
    PHP 
    REP #$30 
    JSR.W DetermineProspectivePoseFromTransitionTable 
    PLP 
    RTS 


RTS_918112:
    RTS 


NormalSamusPoseInputHandler_Knockback_CrystalFlashEnding:
    PHP 
    REP #$30 
    JSR.W DetermineProspectivePoseFromTransitionTable 
    LDA.W $0A1F 
    AND.W #$00FF 
    CMP.W #$000A 
    BEQ .return 
    JSL.L Make_Samus_Jump 
    STZ.W $18AA 

.return:
    PLP 
    RTS 


RTS_91812D:
    PHP 
    REP #$30 
    PLP 
    RTS 


NormalSamusPoseInputHandler_C_DetermineProspectivePose:
    PHP 
    REP #$30 
    JSR.W DetermineProspectivePoseFromTransitionTable 
    PLP 
    RTS 


NormalSamusPoseInputHandler_D_DetermineProspectivePose:
    PHP 
    REP #$30 
    JSR.W DetermineProspectivePoseFromTransitionTable 
    PLP 
    RTS 


NormalSamusPoseInputHandler_TurningAround_OnGround:
    JSR.W DetermineProspectivePoseFromTransitionTable 
    RTS 


RTS_918146:
    RTS 


NormalSamusPoseInputHandler_Moonwalking:
    PHP 
    REP #$30 
    JSR.W DetermineProspectivePoseFromTransitionTable 
    PLP 
    RTS 


NormalSamusPoseInputHandler_SpringBall_OnGround:
    PHP 
    REP #$30 
    JSR.W DetermineProspectivePoseFromTransitionTable 
    PLP 
    RTS 


NormalSamusPoseInputHandler_SpringBall_InAir:
    PHP 
    REP #$30 
    JSR.W DetermineProspectivePoseFromTransitionTable 
    PLP 
    RTS 


NormalSamusPoseInputHandler_SpringBall_Falling:
    PHP 
    REP #$30 
    JSR.W DetermineProspectivePoseFromTransitionTable 
    PLP 
    RTS 


NormalSamusPoseInputHandler_WallJumping:
    PHP 
    REP #$30 
    JSR.W DetermineProspectivePoseFromTransitionTable 
    PLP 
    RTS 


NormalSamusPoseInputHandler_RanIntoAWall:
    PHP 
    REP #$30 
    LDA.W $0A78 
    BNE .timeIsFrozen 
    JSR.W DetermineProspectivePoseFromTransitionTable 
    BRA .return 


.timeIsFrozen:
    JSR.W XraySamusPoseInputHandler ; >_<

.return:
    PLP 
    RTS 


NormalSamusPoseInputHandler_Grappling:
    PHP 
    REP #$30 
    JSR.W DetermineProspectivePoseFromTransitionTable 
    PLP 
    RTS 


NormalSamusPoseInputHandler_TurningAround_Jumping:
    JSR.W DetermineProspectivePoseFromTransitionTable 
    RTS 


NormalSamusPoseInputHandler_TurningAround_Falling:
    JSR.W DetermineProspectivePoseFromTransitionTable 
    RTS 


NormalSamusPoseInputHandler_DamageBoost:
    PHP 
    REP #$30 
    JSR.W DetermineProspectivePoseFromTransitionTable 
    PLP 
    RTS 


NormalSamusPoseInputHandler_GrabbedByDraygon:
    PHP 
    REP #$30 
    JSR.W DetermineProspectivePoseFromTransitionTable 
    PLP 
    RTS 


NormalSamusPoseInputHandler_Shinespark_CF_Drained_DamagedMB:
    PHP 
    REP #$30 
    JSR.W DetermineProspectivePoseFromTransitionTable 
    PLP 
    RTS 


DetermineProspectivePoseFromTransitionTable:
    LDA.B $8B 
    BEQ .noInput 
    JSR.W TranslateCustomControllerBindingsToDefaultBindings 
    LDA.W $0A1C 
    ASL A 
    TAX 
    LDA.W TransitionTable,X 
    TAY 
    LDA.W $0000,Y 
    INC A 
    BEQ .notFound 

.loop:
    DEC A 
    BEQ .input 
    AND.B $12 
    BNE .next 

.input:
    LDA.W $0002,Y 
    BEQ .foundTransition 
    AND.B $14 
    BEQ .foundTransition 

.next:
    TYA 
    CLC 
    ADC.W #$0006 
    TAY 
    LDA.W $0000,Y 
    INC A 
    BNE .loop 

.noInput:
    STZ.W $0A18 
    JSL.L HandleTransitionTableLookupFailure 

.notFound:
    CLC 
    RTS 


.foundTransition:
    LDA.W $0004,Y 
    CMP.W $0A1C 
    BEQ .notFound 
    STA.W $0A28 
    STZ.W $0A56 
    SEC 
    RTS 


TranslateCustomControllerBindingsToDefaultBindings:
    LDA.B $8F 
    AND.W #$0F00 
    STA.B $12 
    LDA.B $8B 
    AND.W #$0F00 
    STA.B $14 
    LDA.B $8F 
    BIT.W $09B2 
    BEQ .checkJump12 
    LDA.B $12 
    ORA.W #$0040 
    STA.B $12 
    LDA.B $8F 

.checkJump12:
    BIT.W $09B4 
    BEQ .checkRun12 
    LDA.B $12 
    ORA.W #$0080 
    STA.B $12 
    LDA.B $8F 

.checkRun12:
    BIT.W $09B6 
    BEQ .checkItemCancel12 
    LDA.B $12 
    ORA.W #$8000 
    STA.B $12 
    LDA.B $8F 

.checkItemCancel12:
    BIT.W $09B8 
    BEQ .checkAimUp12 
    LDA.B $12 
    ORA.W #$4000 
    STA.B $12 
    LDA.B $8F 

.checkAimUp12:
    BIT.W $09BE 
    BEQ .checkAimDown12 
    LDA.W $09BE 
    BIT.W #$0030 
    BEQ .reloadNewInputs 
    LDA.B $12 
    ORA.W #$0010 
    STA.B $12 

.reloadNewInputs:
    LDA.B $8F 

.checkAimDown12:
    BIT.W $09BC 
    BEQ .checkShot14 
    LDA.W $09BC 
    BIT.W #$0030 
    BEQ .checkShot14 
    LDA.B $12 
    ORA.W #$0020 
    STA.B $12 

.checkShot14:
    LDA.B $12 
    EOR.W #$FFFF 
    STA.B $12 
    LDA.B $8B 
    BIT.W $09B2 
    BEQ .checkJump14 
    LDA.B $14 
    ORA.W #$0040 
    STA.B $14 
    LDA.B $8B 

.checkJump14:
    BIT.W $09B4 
    BEQ .checkRun14 
    LDA.B $14 
    ORA.W #$0080 
    STA.B $14 
    LDA.B $8B 

.checkRun14:
    BIT.W $09B6 
    BEQ .checkItemCancel14 
    LDA.B $14 
    ORA.W #$8000 
    STA.B $14 
    LDA.B $8B 

.checkItemCancel14:
    BIT.W $09B8 
    BEQ .checkAimUp14 
    LDA.B $14 
    ORA.W #$4000 
    STA.B $14 
    LDA.B $8B 

.checkAimUp14:
    BIT.W $09BE 
    BEQ .checkAimDown14 
    LDA.W $09BE 
    BIT.W #$0030 
    BEQ .reloadPressedInputs 
    LDA.B $14 
    ORA.W #$0010 
    STA.B $14 

.reloadPressedInputs:
    LDA.B $8B 

.checkAimDown14:
    BIT.W $09BC 
    BEQ .done 
    LDA.W $09BC 
    BIT.W #$0030 
    BEQ .done 
    LDA.B $14 
    ORA.W #$0020 
    STA.B $14 

.done:
    LDA.B $14 
    EOR.W #$FFFF 
    STA.B $14 
    RTS 


HandleTransitionTableLookupFailure:
    PHP 
    PHB 
    PHK 
    PLB 
    REP #$30 
    JSR.W Set_ProspectivePoseChangeCommand 
    BCC .consultPoseDefinition 

.retainCurrentPose:
    LDA.W $0A1C 
    STA.W $0A28 
    BRA .return 


.consultPoseDefinition:
    LDA.W $0A1C 
    ASL #3
    TAX 
    LDA.W PoseDefinitions_newPose,X 
    AND.W #$00FF 
    CMP.W #$00FF 
    BEQ .retainCurrentPose 
    STA.W $0A28 

.return:
    PLB 
    PLP 
    RTL 


Set_ProspectivePoseChangeCommand:
    LDA.W $0A1F 
    AND.W #$00FF 
    TAX 
    LDA.W .poseChangeCommands,X 
    AND.W #$00FF 
    CMP.W #$0001 
    BEQ .decelerate 

.notRetaining:
    STA.W $0A2E 
    CLC 
    RTS 


.decelerate:
    LDA.W $0B46 
    BNE .done 
    LDA.W $0B48 
    BNE .done 
    LDA.W #$0002 
    BRA .notRetaining 


.done:
    LDA.W #$0001 
    STA.W $0A2E 
    SEC 
    RTS 


.poseChangeCommands:
    db $02,$01,$01,$00,$06,$02,$08,$02,$01,$06,$02,$02,$02,$06,$02,$02 
    db $02,$06,$06,$06,$06,$02,$06,$02,$02,$02,$02,$02 

Enable_DemoInput:
    PHP 
    REP #$30 
    LDA.W #SamusPoseInputHandler_Demo 
    STA.W $0A60 
    LDA.W #$8000 
    TSB.W $0A88 
    PLP 
    RTL 


Disable_DemoInput:
    PHP 
    REP #$30 
    LDA.W #SamusPoseInputHandler_Normal 
    STA.W $0A60 
    LDA.W #$8000 
    TRB.W $0A88 
    PLP 
    RTL 


Clear_DemoInput_RAM:
    PHP 
    REP #$30 
    PHX 
    STZ.W $0A7A 
    STZ.W $0A7C 
    STZ.W $0A7E 
    STZ.W $0A80 
    STZ.W $0A82 
    STZ.W $0A84 
    STZ.W $0A86 
    STZ.W $0A8C 
    STZ.W $0A8E 
    STZ.W $0A88 
    PLX 
    PLP 
    RTL 


Load_DemoInputObject:
    PHP 
    PHB 
    PHK 
    PLB 
    REP #$30 
    PHX 
    STA.W $0A82 
    TYX 
    LDA.W $0002,X 
    STA.W $0A7A 
    LDA.W $0004,X 
    STA.W $0A7E 
    LDA.W #$0001 
    STA.W $0A7C 
    LDA.W #$0000 
    STA.W $0A80 
    JSR.W ($0000,X) 
    PLX 
    PLB 
    PLP 
    RTL 


RTS_9183BF:
    RTS 


DemoInputObjectHandler:
    PHP 
    PHB 
    PHK 
    PLB 
    REP #$30 
    BIT.W $0A88 
    BPL .return 
    LDA.W $0A7E 
    BEQ .return 
    JSR.W ProcessDemoInputObject 
    LDA.W $0A8C 
    STA.W $0DFE 
    LDA.W $0A8E 
    STA.W $0E00 
    LDA.W $0A84 
    STA.B $8B 
    STA.W $0A8C 
    LDA.W $0A86 
    STA.B $8F 
    STA.W $0A8E 

.return:
    PLB 
    PLP 
    RTL 


ProcessDemoInputObject:
    LDX.W #$0000 
    JSR.W ($0A7A,X) 
    DEC.W $0A7C 
    BNE .return 
    LDY.W $0A7E 

.loop:
    LDA.W $0000,Y 
    BPL .processInput 
    STA.B $12 
    INY #2
    PEA.W .loop-1 
    JMP.W ($0012) 


.processInput:
    STA.W $0A7C 
    LDA.W $0002,Y 
    STA.W $0A84 
    LDA.W $0004,Y 
    STA.W $0A86 
    TYA 
    CLC 
    ADC.W #$0006 
    STA.W $0A7E 

.return:
    RTS 


Instruction_DemoInputObject_Delete:
    REP #$30 
    STZ.W $0A7E 
    STZ.W $0A84 
    STZ.W $0A86 
    PLA 
    RTS 


Instruction_DemoInputObject_PreInstructionInY:
    REP #$30 
    LDA.W $0000,Y 
    STA.W $0A7A 
    INY #2
    RTS 


Instruction_DemoInputObject_ClearPreInstruction:
    REP #$30 
    LDA.W #RTS_918447 
    STA.W $0A7A ; fallthrough to RTS_918447

RTS_918447:
    RTS 


Instruction_DemoInputObject_GotoY:
    REP #$30 
    LDA.W $0000,Y 
    TAY 
    RTS 


Instruction_DemoInputObject_DecrementTimer_GotoYIfNonZero:
    REP #$30 
    DEC.W $0A80 
    BNE Instruction_DemoInputObject_GotoY 
    INY #2
    RTS 


Instruction_DemoInputObject_TimerInY:
    REP #$30 
    LDA.W $0000,Y 
    STA.W $0A80 
    INY #2
    RTS 


RecordDemoInputFrame:
    PHP 
    PHB 
    PHK 
    PLB 
    REP #$30 
    LDA.W $0A8A 
    AND.W #$7FFF 
    STA.W $0E24 
    LDA.W #$00E0 
    STA.W $0E20 
    LDA.W #$0038 
    STA.W $0E22 
    JSR.W Draw_RecordedDemoDuration 
    LDA.W $0A8A 
    BMI .return 
    BNE .record 
    LDA.B $91 
    BIT.W #$4000 
    BEQ .return 

.record:
    LDA.W $0A8A 
    ASL #2
    STA.B $12 
    ASL A 
    ADC.B $12 
    TAX 
    LDA.B $8B 
    STA.L $B88000,X 
    LDA.B $8F 
    STA.L $B88002,X 
    LDA.W $0911 
    STA.L $B88004,X 
    LDA.W $0915 
    STA.L $B88006,X 
    LDA.W $0AF6 
    STA.L $B88008,X 
    LDA.W $0AFA 
    STA.L $B8800A,X 
    LDA.W $0A8A 
    INC A 
    CMP.W #$0A00 
    BNE .cappedAtA00 
    LDA.W #$0000 

.cappedAtA00:
    STA.W $0A8A 

.return:
    PLB 
    PLP 
    RTL 


Pause_Terminate_Reset_DemoRecorder:
    PHP 
    PHB 
    PHK 
    PLB 
    REP #$30 
    LDA.B $91 
    BIT.W #$0040 
    BEQ .checkA 
    LDA.W $0A8A 
    ASL #2
    STA.B $12 
    ASL A 
    ADC.B $12 
    TAX 
    LDA.W #$FFFF 
    STA.L $B88000,X 
    STA.L $B88002,X 
    STA.L $B88004,X 
    STA.L $B88006,X 
    STA.L $B88008,X 
    STA.L $B8800A,X 
    LDA.W $078F 
    STA.L $B8FF00 
    LDA.W $079F 
    STA.L $B8FF02 
    LDA.W $0A8A 
    ORA.W #$8000 
    STA.W $0A8A 

.checkA:
    LDA.B $91 
    BIT.W #$0080 
    BEQ .return 
    LDA.W #$0000 
    STA.W $0A8A 

.return:
    PLB 
    PLP 
    RTL 


Draw_RecordedDemoDuration:
    LDA.W $0E20 
    CLC 
    ADC.W #$0000 
    STA.B $14 
    LDA.W $0E22 
    CLC 
    ADC.W #$0000 
    STA.B $12 
    LDA.W #$0A00 
    STA.B $26 
    LDA.W $0E24 
    AND.W #$F000 
    XBA 
    LSR #4
    CLC 
    ADC.W #$0004 
    JSL.L Add_Debug_Spritemap_to_OAM 
    LDA.W $0E20 
    CLC 
    ADC.W #$0008 
    STA.B $14 
    LDA.W $0E22 
    CLC 
    ADC.W #$0000 
    STA.B $12 
    LDA.W #$0A00 
    STA.B $26 
    LDA.W $0E24 
    AND.W #$0F00 
    XBA 
    CLC 
    ADC.W #$0004 
    JSL.L Add_Debug_Spritemap_to_OAM 
    LDA.W $0E20 
    CLC 
    ADC.W #$0010 
    STA.B $14 
    LDA.W $0E22 
    CLC 
    ADC.W #$0000 
    STA.B $12 
    LDA.W #$0A00 
    STA.B $26 
    LDA.W $0E24 
    AND.W #$00F0 
    LSR #4
    CLC 
    ADC.W #$0004 
    JSL.L Add_Debug_Spritemap_to_OAM 
    LDA.W $0E20 
    CLC 
    ADC.W #$0018 
    STA.B $14 
    LDA.W #$0A00 
    STA.B $26 
    LDA.W $0E22 
    CLC 
    ADC.W #$0000 
    STA.B $12 
    LDA.W $0E24 
    AND.W #$000F 
    CLC 
    ADC.W #$0004 
    JSL.L Add_Debug_Spritemap_to_OAM 
    RTS 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_InstList_DemoInput_JumpLeft_GiveControlBack_9185CE:
    dw $001E,$0000,$0000,$0001,$0200,$0200,$001A,$0200 
    dw $0000,$0001,$0280,$0080,$0034,$0280,$0000,$001E 
    dw $0200,$0000,$0049,$0000,$0000 
    dw Instruction_EndDemoInput_GiveControlBackToPlayer 
    dw Instruction_DemoInputObject_Delete 

Instruction_EndDemoInput_GiveControlBackToPlayer:
    LDA.W #SamusCurrentStateHandler_Normal 
    STA.W $0A42 
    LDA.W #SamusNewStateHandler_Normal 
    STA.W $0A44 
    JSL.L Disable_DemoInput 
    RTS 
endif ; !FEATURE_KEEP_UNREFERENCED


InstList_DemoInput_BabyMetroidDiscovery_RunningLeft_0:
    dw $005A,$0000,$0000,$0001,$0200,$0200 

InstList_DemoInput_BabyMetroidDiscovery_RunningLeft_1:
    dw $0001,$0200,$0000 
    dw Instruction_DemoInputObject_GotoY 
    dw InstList_DemoInput_BabyMetroidDiscovery_RunningLeft_1 

InstList_DemoInput_BabyMetroidDiscovery_StopAndLook_0:
    dw $012C,$0000,$0000,$0001,$0010,$0010,$00AA,$0010 
    dw $0000,$00F0,$0000,$0000,$0001,$0200,$0200 

InstList_DemoInput_BabyMetroidDiscovery_StopAndLook_1:
    dw $0001,$0200,$0000 
    dw Instruction_DemoInputObject_GotoY 
    dw InstList_DemoInput_BabyMetroidDiscovery_StopAndLook_1 

InstList_DemoInput_BabyMetroidDiscovery_End:
    dw Instruction_EndDemoInput 
    dw Instruction_DemoInputObject_Delete 

PreInstruction_DemoInput_BabyMetroidDiscovery_RunningLeft:
    LDA.W $0AF6 
    CMP.W #$00B2 
    BPL .return 
    LDA.W #PreInstruction_DemoInput_BabyMetroidDiscovery_StopAndLook 
    STA.W $0A7A 
    LDA.W #InstList_DemoInput_BabyMetroidDiscovery_StopAndLook_0 
    STA.W $0A7E 
    LDA.W #$0001 
    STA.W $0A7C 

.return:
    RTS 


PreInstruction_DemoInput_BabyMetroidDiscovery_StopAndLook:
    LDA.W $1A4B 
    BNE .return 
    LDA.W #RTS_9183BF 
    STA.W $0A7A 
    LDA.W #InstList_DemoInput_BabyMetroidDiscovery_End 
    STA.W $0A7E 
    LDA.W #$0001 
    STA.W $0A7C 

.return:
    RTS 


Instruction_EndDemoInput:
    PHX 
    PHY 
    LDA.W #RTL_90E8CD 
    STA.W $0A42 
    STA.W $0A44 
    JSL.L Disable_DemoInput 
    PLY 
    PLX 
    RTS 


InstList_DemoInput_OldMotherBrainFight:
    dw $005A,$0000,$0000,$0001,$0040,$0040,$0028,$0040 
    dw $0000,$0001,$0040,$0040,$001D,$0040,$0000,$0046 
    dw $0000,$0000 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_InstList_DemoInput_OldMotherBrainFight_9186B8:
    dw $0014,$0000,$0000,$0001,$0200,$0200,$0007,$0200 
    dw $0000,$0001,$0280,$0080,$0007,$0280,$0000,$0004 
    dw $0200,$0000,$003C,$0000,$0000,$0001,$0040,$0040 
    dw $0028,$0040,$0000,$0001,$0040,$0040,$0013,$0040 
    dw $0000 
    dw Instruction_EndDemoInputWithSamusFacingLeft 
    dw Instruction_DemoInputObject_Delete 

UNUSED_Instruction_EndDemoInputWithSamusFacingLeft_9186FE:
    PHX 
    PHY 
    LDA.W #SamusCurrentStateHandler_SamusIsLocked 
    STA.W $0A42 
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
    JSL.L Disable_DemoInput 
    LDA.W #RTS_90E90E 
    STA.W $0A60 
    PLY 
    PLX 
    RTS 
endif ; !FEATURE_KEEP_UNREFERENCED


Instruction_EndDemoInputWithSamusFacingLeft:
    PHX 
    PHY 
    LDA.W #SamusCurrentStateHandler_SamusIsLocked 
    STA.W $0A42 
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
    JSL.L Disable_DemoInput 
    LDA.W #RTS_90E90E 
    STA.W $0A60 
    PLY 
    PLX 
    RTS 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_InstList_DemoInput_Delete_918774:
    dw Instruction_DemoInputObject_Delete 
endif ; !FEATURE_KEEP_UNREFERENCED

InstList_DemoInput_Delete:
    dw Instruction_DemoInputObject_Delete 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_DemoInputObject_Intro_JumpLeft_GiveControlBack_918778:
    dw RTS_9183BF 
    dw RTS_9183BF 
    dw UNUSED_InstList_DemoInput_JumpLeft_GiveControlBack_9185CE 
endif ; !FEATURE_KEEP_UNREFERENCED

DemoInputObjects_Intro_BabyMetroidDiscovery:
    dw RTS_9183BF 
    dw PreInstruction_DemoInput_BabyMetroidDiscovery_RunningLeft 
    dw InstList_DemoInput_BabyMetroidDiscovery_RunningLeft_0 

DemoInputObjects_Intro_OldMotherBrainFight:
    dw RTS_9183BF 
    dw RTS_9183BF 
    dw InstList_DemoInput_OldMotherBrainFight 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_DemoInputObjects_Intro_OldMotherBrainFight_91878A:
    dw RTS_9183BF 
    dw RTS_9183BF 
    dw UNUSED_InstList_DemoInput_OldMotherBrainFight_9186B8 
endif ; !FEATURE_KEEP_UNREFERENCED

LoadDemoData:
    LDA.W $1F57 
    ASL #4
    STA.B $12 
    LDA.W $1F55 
    ASL A 
    TAX 
    LDA.W DemoData_Pointers,X 
    CLC 
    ADC.B $12 
    TAX 
    LDA.W $0000,X 
    STA.W $09A4 
    STA.W $09A2 
    LDA.W $0002,X 
    STA.W $09C8 
    STA.W $09C6 
    LDA.W $0004,X 
    STA.W $09CC 
    STA.W $09CA 
    LDA.W $0006,X 
    STA.W $09D0 
    STA.W $09CE 
    LDA.W $0008,X 
    STA.W $09C4 
    STA.W $09C2 
    LDA.W $000A,X 
    STA.W $09A8 
    LDA.W $000C,X 
    STA.W $09A6 
    STZ.W $09D6 
    PHX 
    JSL.L Clear_DemoInput_RAM 
    JSL.L Enable_DemoInput 
    PLX 
    LDA.W $000E,X 
    TAY 
    JSL.L Load_DemoInputObject 
    LDA.W $1F57 
    ASL A 
    STA.B $12 
    LDA.W $1F55 
    ASL A 
    TAX 
    LDA.W DemoSamusSetup_Pointers,X 
    CLC 
    ADC.B $12 
    TAX 
    LDA.W $0000,X 
    STA.B $12 
    PEA.W .manualReturn-1 
    JMP.W ($0012) 


.manualReturn:
    LDA.W #SamusCurrentStateHandler_Demo 
    STA.W $0A42 
    LDA.W #SamusNewStateHandler_TitleDemo 
    STA.W $0A44 
    STZ.W $0A2E 
    STZ.W $0A30 
    STZ.W $0A32 
    JSL.L LoadSamusSuitPalette 
    JSL.L Update_Beam_Tiles_and_Palette 
    LDA.W #$0800 
    STA.W $09AA 
    LDA.W #$0400 
    STA.W $09AC 
    LDA.W #$0200 
    STA.W $09AE 
    LDA.W #$0100 
    STA.W $09B0 
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
    LDA.W #$0010 
    STA.W $09BE 
    LDA.W #$0020 
    STA.W $09BC 
    LDA.W #$0001 
    STA.W $09E8 
    STA.W $09E6 
    STZ.W $09E4 
    STZ.W $0DF8 
    STZ.W $0DFA 
    STZ.W $0DFC 
    RTS 


DemoData_Pointers:
    dw DemoData_Set0 
    dw DemoData_Set1 
    dw DemoData_Set2 
    dw DemoData_Set3 

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

DemoSamusSetup_LandingSite:
    JSL.L MakeSamusFaceForward 
    LDA.W #SamusDrawingHandler_Default 
    STA.W $0A5C 
    RTS 


DemoSamusSetup_MorphBallFacingLeft:
    LDA.W #$001F 
    BRA InitializeSamusWithPoseInA 


DemoSamusSetup_StandingFacingLeft_LowEnergy:
    LDA.W #$0014 
    STA.W $09C2 

DemoSamusSetup_StandingFacingLeft:
    LDA.W #$0002 
    BRA InitializeSamusWithPoseInA 


DemoSamusSetup_FallingFacingLeft:
    LDA.W #$002A 
    BRA InitializeSamusWithPoseInA 


DemoSamusSetup_StandingFacingRight:
    LDA.W #$0001 

InitializeSamusWithPoseInA:
    STA.W $0A1C 
    JSL.L InitializeSamusPose_1 
    JSL.L Set_Samus_AnimationFrame_if_PoseChanged 
    LDA.W #SamusDrawingHandler_Default 
    STA.W $0A5C 
    RTS 


DemoSamusSetup_Shinespark:
    LDA.W #SamusDrawingHandler_Default 
    STA.W $0A5C 
    JSL.L TriggerShinesparkWindup 
    LDA.W #$00CD 
    STA.W $0A1C 
    JSL.L InitializeSamusPose_1 
    JSL.L Set_Samus_AnimationFrame_if_PoseChanged 
    RTS 


DemoSamusSetup_GauntletEntrance:
    LDA.W #SamusDrawingHandler_Default 
    STA.W $0A5C 
    JSL.L TriggerShinesparkWindup 
    LDA.W #$00CA 
    STA.W $0A1C 
    JSL.L InitializeSamusPose_1 
    JSL.L Set_Samus_AnimationFrame_if_PoseChanged 
    RTS 


RTS_918A9A:
    RTS 


PreInstruction_DemoInput_Normal:
    LDA.W $0998 
    CMP.W #$002C 
    BNE .return 
    LDA.W #InstList_DemoInput_Delete 
    STA.W $0A7E 
    LDA.W #$0001 
    STA.W $0A7C 

.return:
    RTS 


PreInstruction_DemoInput_Shinespark:
    LDA.W $0A1F 
    AND.W #$00FF 
    CMP.W #$001A 
    BEQ .return 
    LDA.W #PreInstruction_DemoInput_Normal 
    STA.W $0A7A 
    LDA.W #UNUSED_InstList_DemoInput_Shinespark_Unseen_919346 
    STA.W $0A7E 
    LDA.W #$0001 
    STA.W $0A7C 

.return:
    RTS 


InstList_DemoInput_LandingSite:
    dw $0121,$0000,$0000,$0001,$0200,$0200,$0006,$0200 
    dw $0000,$0001,$0A00,$0800,$0003,$0A00,$0000,$0013 
    dw $0200,$0000,$0001,$0280,$0080,$0028,$0280,$0000 
    dw $0032,$0200,$0000,$0024,$0000,$0000,$0001,$0100 
    dw $0100,$0005,$0100,$0000,$000F,$0000,$0000,$0001 
    dw $0200,$0200,$0005,$0200,$0000,$0022,$0000,$0000 
    dw $0001,$0200,$0200,$004A,$0200,$0000,$0005,$0000 
    dw $0000,$0001,$0100,$0100,$0005,$0100,$0000,$0045 
    dw $0000,$0000,$0001,$0200,$0200,$0003,$0200,$0000 
    dw $0001,$8200,$8000,$0049,$8200,$0000,$0001,$8A00 
    dw $0800,$0003,$8A00,$0000,$0001,$0200,$0000,$0002 
    dw $0000,$0000,$0001,$0100,$0100,$0007,$0100,$0000 
    dw $000B,$0000,$0000,$0001,$0010,$0010,$001F,$0010 
    dw $0000,$0001,$0210,$0200,$0005,$0210,$0000,$001D 
    dw $0010,$0000,$0001,$0200,$0200,$005E,$0200,$0000 
    dw $0030,$0000,$0000,$0001,$0200,$0200,$002E,$0200 
    dw $0000,$001F,$0000,$0000,$0001,$0100,$0100,$0004 
    dw $0100,$0000,$0040,$0000,$0000,$0001,$0200,$0200 
    dw $0004,$0200,$0000,$0028,$0000,$0000,$0001,$0040 
    dw $0040,$0006,$0040,$0000,$002B,$0000,$0000,$0001 
    dw $0200,$0200,$0011,$0200,$0000,$0007,$0000,$0000 
    dw $0001,$0200,$0200,$0004,$0200,$0000,$0014,$0100 
    dw $0000,$0001,$0140,$0040,$0003,$0140,$0000 
    dw Instruction_DemoInputObject_Delete 

InstList_DemoInput_PseudoScrewAttack:
    dw $0016,$0000,$0000,$0001,$0800,$0800,$0003,$0800 
    dw $0000,$0005,$0000,$0000,$0001,$0800,$0800,$0006 
    dw $0800,$0000,$0016,$0000,$0000,$0001,$0200,$0200 
    dw $0005,$0200,$0000,$000B,$0000,$0000,$0001,$0040 
    dw $0040,$004E,$0040,$0000,$0001,$0240,$0200,$000D 
    dw $0240,$0000,$0001,$02C0,$0080,$0014,$02C0,$0000 
    dw $0014,$0240,$0000,$0020,$0040,$0000,$0001,$0140 
    dw $0100,$000F,$0140,$0000,$0001,$01C0,$0080,$0006 
    dw $01C0,$0000,$0002,$00C0,$0000,$0001,$02C0,$0200 
    dw $001E,$02C0,$0000,$0008,$0240,$0000,$0006,$0040 
    dw $0000,$0001,$0140,$0100,$000B,$0140,$0000,$0001 
    dw $01C0,$0080,$0023,$01C0,$0000,$003A,$0140,$0000 
    dw $0001,$01C0,$0080,$0013,$01C0,$0000,$0001,$09C0 
    dw $0800,$0002,$01C0,$0000,$0008,$00C0,$0000,$000D 
    dw $0040,$0000,$0001,$0240,$0200,$0029,$0240,$0000 
    dw $0001,$02C0,$0080,$0007,$02C0,$0000,$0001,$0AC0 
    dw $0800,$0002,$0AC0,$0000,$0001,$08C0,$0000,$0001 
    dw $01C0,$0100,$0028,$01C0,$0000,$0010,$0140,$0000 
    dw $0006,$0040,$0000,$0001,$00C0,$0080,$0004,$00C0 
    dw $0000,$0001,$00E0,$0020,$0012,$00E0,$0000,$002A 
    dw $0020,$0000,$0001,$0120,$0100,$0002,$0120,$0000 
    dw $0005,$0100,$0000,$0008,$0000,$0000,$0001,$0100 
    dw $0100,$0011,$0100,$0000,$0001,$0180,$0080,$000F 
    dw $0180,$0000,$0013,$0100,$0000,$0001,$8100,$8000 
    dw $0029,$8100,$0000,$0001,$8180,$0080,$0020,$8180 
    dw $0000,$0005,$8080,$0000,$0006,$8000,$0000,$0001 
    dw $0200,$0200,$000F,$0200,$0000,$0065,$0000,$0000 
    dw Instruction_DemoInputObject_Delete 

InstList_DemoInput_SpeedBooster:
    dw $0020,$0000,$0000,$0001,$0200,$0200,$0002,$0200 
    dw $0000,$0001,$8200,$8000,$00EE,$8200,$0000,$0001 
    dw $8A00,$0800,$0002,$8200,$0000,$0001,$8100,$0100 
    dw $0016,$0100,$0000,$0031,$0000,$0000,$0001,$0200 
    dw $0200,$0005,$0200,$0000,$0013,$0000,$0000,$0001 
    dw $0040,$0040,$0008,$0040,$0000,$0011,$0000,$0000 
    dw $0001,$0200,$0200,$001B,$0200,$0000,$0063,$0000 
    dw $0000 
    dw Instruction_DemoInputObject_Delete 

InstList_DemoInput_Dachora:
    dw $0008,$0000,$0000,$0001,$0200,$0200,$0001,$0200 
    dw $0000,$010A,$0000,$0000,$0001,$0100,$0100,$0004 
    dw $0100,$0000,$0011,$0000,$0000,$0001,$0200,$0200 
    dw $0004,$0200,$0000,$0038,$0000,$0000,$0001,$0200 
    dw $0200,$0164,$0200,$0000,$011E,$0000,$0000 
    dw Instruction_DemoInputObject_Delete 

InstList_DemoInput_RedBrinstarElevator:
    dw $005A,$0000,$0000,$0001,$0100,$0100,$000A,$0100 
    dw $0000,$0001,$0180,$0080,$0006,$0180,$0000,$0011 
    dw $0100,$0000,$0020,$0000,$0000,$0001,$0200,$0200 
    dw $0001,$0200,$0000,$0001,$0280,$0080,$0014,$0280 
    dw $0000,$0003,$0200,$0000,$0014,$0000,$0000,$0001 
    dw $0100,$0100,$0004,$0100,$0000,$0048,$0000,$0000 
    dw $0001,$0080,$0080,$0011,$0080,$0000,$0001,$0180 
    dw $0100,$000A,$0180,$0000,$0016,$0100,$0000,$0200 
    dw $0000,$0000 
    dw Instruction_DemoInputObject_Delete 

InstList_DemoInput_WreckedShipBasement:
    dw $003D,$0000,$0000,$0001,$0100,$0100,$0005,$0100 
    dw $0000,$000F,$0000,$0000,$0001,$0200,$0200,$0005 
    dw $0200,$0000,$0027,$0000,$0000,$0001,$0200,$0200 
    dw $0066,$0200,$0000,$0001,$8200,$8000,$0007,$8200 
    dw $0000,$004F,$0200,$0000,$0057,$0000,$0000,$0001 
    dw $0100,$0100,$0002,$0100,$0000,$0064,$0000,$0000 
    dw $0001,$0100,$0100,$004E,$0100,$0000,$0001,$8100 
    dw $8000,$0017,$8100,$0000,$0006,$0100,$0000,$0001 
    dw $8100,$8000,$0003,$8100,$0000,$0001,$0100,$0000 
    dw $0001,$8100,$8000,$0002,$8100,$0000,$0034,$0100 
    dw $0000,$00A9,$0000,$0000 
    dw Instruction_DemoInputObject_Delete 

InstList_DemoInput_LowerNorfairEntrance:
    dw $0013,$0000,$0000,$0001,$0200,$0200,$0012,$0200 
    dw $0000,$0029,$0000,$0000,$0001,$8000,$8000,$0015 
    dw $8000,$0000,$000B,$0000,$0000,$0001,$8000,$8000 
    dw $001F,$8000,$0000,$0001,$8200,$0200,$0030,$8200 
    dw $0000,$0003,$8000,$0000,$0001,$8200,$0200,$0007 
    dw $8200,$0000,$0045,$8000,$0000,$0001,$8200,$0200 
    dw $0091,$8200,$0000,$000A,$8000,$0000,$0001,$8200 
    dw $0200,$0006,$8200,$0000,$0036,$8000,$0000,$0001 
    dw $8200,$0200,$0090,$8200,$0000,$0011,$0200,$0000 
    dw $0001,$0280,$0080,$0017,$0280,$0000,$0008,$0080 
    dw $0000,$0001,$0180,$0100,$000E,$0180,$0000,$000F 
    dw $0100,$0000,$0002,$0000,$0000,$0001,$0080,$0080 
    dw $001C,$0080,$0000,$0001,$0280,$0200,$000C,$0280 
    dw $0000,$0002,$0200,$0000,$000F,$0000,$0000,$0001 
    dw $0080,$0080,$0011,$0080,$0000,$0001,$0180,$0100 
    dw $000F,$0180,$0000,$0002,$0080,$0000,$0010,$0000 
    dw $0000,$0001,$0080,$0080,$0001,$0280,$0200,$0014 
    dw $0280,$0000,$0015,$0200,$0000,$0001,$8200,$8000 
    dw $000E,$8200,$0000,$0006,$0200,$0000,$0001,$0280 
    dw $0080,$0004,$0280,$0000,$0011,$0200,$0000,$0001 
    dw $8200,$8000,$0024,$8200,$0000,$0002,$0200,$0000 
    dw $0014,$0200,$0000,$0007,$0000,$0000,$0001,$0100 
    dw $0100,$0009,$0100,$0000,$002D,$0000,$0000 
    dw Instruction_DemoInputObject_Delete 

InstList_DemoInput_EyeDoor:
    dw $000B,$0100,$0000,$0017,$0000,$0000,$0001,$0040 
    dw $0040,$0008,$0040,$0000,$0004,$0000,$0000,$0001 
    dw $0100,$0100,$0002,$0100,$0000,$000C,$0000,$0000 
    dw $0001,$2000,$2000,$0006,$2000,$0000,$000D,$0000 
    dw $0000,$0001,$0100,$0100,$000A,$0100,$0000,$0001 
    dw $0180,$0080,$0006,$0180,$0000,$000E,$0100,$0000 
    dw $0010,$0000,$0000,$0001,$0100,$0100,$0002,$0100 
    dw $0000,$0001,$0180,$0080,$0006,$0180,$0000,$000D 
    dw $0100,$0000,$0010,$0000,$0000,$0001,$0100,$0100 
    dw $0002,$0100,$0000,$0001,$0180,$0080,$0008,$0180 
    dw $0000,$001C,$0100,$0000,$0020,$0000,$0000,$0001 
    dw $0100,$0100,$0001,$0180,$0080,$000B,$0180,$0000 
    dw $0012,$0100,$0000,$0016,$0000,$0000,$0001,$0100 
    dw $0100,$0006,$0100,$0000,$0028,$0000,$0000,$0001 
    dw $0100,$0100,$0006,$0100,$0000,$0001,$0180,$0080 
    dw $0008,$0180,$0000,$0017,$0100,$0000,$000F,$0000 
    dw $0000,$0001,$0080,$0080,$0006,$0080,$0000,$000A 
    dw $0000,$0000,$0001,$0040,$0040,$0006,$0040,$0000 
    dw $0025,$0000,$0000,$0001,$0200,$0200,$0007,$0200 
    dw $0000,$0008,$0000,$0000,$0001,$0100,$0100,$0007 
    dw $0100,$0000,$0052,$0000,$0000,$0001,$0080,$0080 
    dw $0007,$0080,$0000,$0011,$0000,$0000,$0001,$0040 
    dw $0040,$0004,$0040,$0000,$000C,$0000,$0000,$0001 
    dw $0080,$0080,$000B,$0080,$0000,$001E,$0000,$0000 
    dw $0001,$0040,$0040,$0006,$0040,$0000,$000D,$0000 
    dw $0000,$0001,$0080,$0080,$0005,$0080,$0000,$000D 
    dw $0000,$0000,$0001,$0040,$0040,$0006,$0040,$0000 
    dw $007C,$0000,$0000,$0001,$0200,$0200,$0007,$0200 
    dw $0000,$0011,$0000,$0000,$0001,$0100,$0100,$0009 
    dw $0100,$0000,$0001,$0140,$0040,$0003,$0140,$0000 
    dw $0004,$0100,$0000 
    dw Instruction_DemoInputObject_Delete 

InstList_DemoInput_Shinespark:
    dw $00A5,$0000,$0000 
    dw Instruction_DemoInputObject_GotoY 
    dw InstList_DemoInput_Shinespark 

UNUSED_InstList_DemoInput_Shinespark_Unseen_919346:
    dw $0096,$0000,$0000,$0001,$0200,$0200,$00CC,$0200 
    dw $0000,$0001,$8200,$8000,$0076,$8200,$0000,$0002 
    dw $8000,$0000,$0001,$8100,$0100,$00B6,$8100,$0000 
    dw $000C,$0100,$0000,$0001,$0180,$0080,$0006,$0180 
    dw $0000,$000E,$0100,$0000,$0024,$0000,$0000,$0001 
    dw $2000,$2000,$0005,$2000,$0000,$000B,$0000,$0000 
    dw $0001,$2000,$2000,$0004,$2000,$0000,$000E,$0000 
    dw $0000,$0001,$0040,$0040,$0007,$0040,$0000,$00F0 
    dw $0000,$0000 
    dw Instruction_DemoInputObject_Delete 

InstList_DemoInput_MissileDoor:
    dw $0029,$0000,$0000,$0001,$0100,$0100,$0031,$0100 
    dw $0000,$0044,$0000,$0000,$0001,$2000,$2000,$0005 
    dw $2000,$0000,$0023,$0000,$0000,$0001,$0040,$0040 
    dw $0008,$0040,$0000,$000A,$0000,$0000,$0001,$0040 
    dw $0040,$0008,$0040,$0000,$0011,$0000,$0000,$0001 
    dw $0040,$0040,$0007,$0040,$0000,$000D,$0000,$0000 
    dw $0001,$0040,$0040,$0008,$0040,$0000,$0007,$0000 
    dw $0000,$0001,$0040,$0040,$0009,$0040,$0000,$0020 
    dw $0000,$0000,$0001,$8100,$8100,$0011,$8100,$0000 
    dw $001A,$0000,$0000 
    dw Instruction_DemoInputObject_Delete 

InstList_DemoInput_Kraid:
    dw $0200,$0000,$0000 
    dw Instruction_DemoInputObject_Delete 

InstList_DemoInput_FireFleaRoom:
    dw $002B,$0000,$0000,$0001,$0200,$0200,$0046,$0200 
    dw $0000,$0037,$0000,$0000,$0001,$0200,$0200,$000C 
    dw $0200,$0000,$0001,$0280,$0080,$0013,$0280,$0000 
    dw $0013,$0200,$0000,$0001,$0240,$0040,$000B,$0240 
    dw $0000,$0005,$0200,$0000,$0001,$0280,$0080,$0015 
    dw $0280,$0000,$0025,$0200,$0000,$0001,$0280,$0080 
    dw $000E,$0280,$0000,$0021,$0200,$0000,$0001,$0280 
    dw $0080,$0009,$0280,$0000,$001D,$0200,$0000,$0008 
    dw $0000,$0000,$0001,$0020,$0020,$0001,$0020,$0000 
    dw $0001,$0420,$0400,$00C4,$0020,$0000 
    dw Instruction_DemoInputObject_Delete 

InstList_DemoInput_ScrewAttack:
    dw $0030,$0000,$0000,$0001,$8100,$8100,$001E,$8100 
    dw $0000,$0001,$8180,$0080,$000C,$8180,$0000,$001C 
    dw $8100,$0000,$0001,$8180,$0080,$0017,$8180,$0000 
    dw $002B,$8100,$0000,$0001,$0400,$0400,$0003,$0000 
    dw $0000,$0001,$0200,$0200,$0001,$0210,$0010,$009D 
    dw $0010,$0000 
    dw Instruction_DemoInputObject_Delete 

InstList_DemoInput_BrinstarDiagonalRoom:
    dw $0029,$0000,$0000,$0001,$0100,$0100,$0012,$0100 
    dw $0000,$0001,$0180,$0080,$0016,$0180,$0000,$0041 
    dw $0100,$0000,$0014,$0000,$0000,$0001,$0010,$0010 
    dw $000A,$0010,$0000,$0001,$0050,$0040,$001D,$0050 
    dw $0000,$0005,$0040,$0000,$0001,$0440,$0400,$0037 
    dw $0440,$0000,$00DB,$0000,$0000 
    dw Instruction_DemoInputObject_Delete 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_InstList_DemoInput_9195BC:
    dw $0029,$0000,$0000,$0001,$0200,$0200,$0018,$0200 
    dw $0000,$0011,$0000,$0000,$0001,$0080,$0080,$0018 
    dw $0080,$0000,$0001,$0280,$0200,$0005,$0280,$0000 
    dw $0010,$0200,$0000,$0020,$0000,$0000,$0001,$0080 
    dw $0080,$0009,$0080,$0000,$0001,$0280,$0200,$0015 
    dw $0280,$0000,$0016,$0200,$0000,$0014,$0000,$0000 
    dw $0001,$0100,$0100,$0007,$0100,$0000,$0001,$0180 
    dw $0080,$0018,$0180,$0000,$001D,$0100,$0000,$0010 
    dw $0000,$0000,$0001,$0400,$0400,$0005,$0400,$0000 
    dw $0001,$0600,$0200,$0096,$0000,$0000 
    dw Instruction_DemoInputObject_Delete 
endif ; !FEATURE_KEEP_UNREFERENCED

InstList_DemoInput_PreSporeSpawnHall:
    dw $001B,$0000,$0000,$0001,$0200,$0200,$0005,$0200 
    dw $0000,$000F,$0000,$0000,$0001,$0100,$0100,$0005 
    dw $0100,$0000,$0010,$0000,$0000,$0001,$0100,$0100 
    dw $000D,$0100,$0000,$002A,$0100,$0000,$0007,$0000 
    dw $0000,$0001,$0080,$0080,$0015,$0080,$0000,$001E 
    dw $0000,$0000,$0001,$0200,$0200,$0013,$0200,$0000 
    dw $0010,$0000,$0000,$0001,$0100,$0100,$0008,$0100 
    dw $0000,$0001,$0180,$0080,$000F,$0180,$0000,$0001 
    dw $0080,$0000,$0001,$0280,$0200,$0007,$0280,$0000 
    dw $0004,$0200,$0000,$0001,$0000,$0000,$0001,$0100 
    dw $0100,$0004,$0100,$0000,$0001,$0140,$0040,$0009 
    dw $0140,$0000,$0005,$0140,$0000,$004C,$0040,$0000 
    dw $0001,$0440,$0400,$0003,$0040,$0000,$0001,$0050 
    dw $0010,$0004,$0050,$0000,$0084,$0010,$0000 
    dw Instruction_DemoInputObject_Delete 

InstList_DemoInput_GrappleBeam:
    dw $0010,$0000,$0000,$0001,$2000,$2000,$000C,$0000 
    dw $0000,$0001,$2000,$2000,$000C,$0000,$0000,$0001 
    dw $2000,$2000,$000C,$0000,$0000,$0001,$2000,$2000 
    dw $000C,$0000,$0000,$0001,$0010,$0010,$0022,$0010 
    dw $0000,$0001,$0050,$0040,$0010,$0050,$0000,$0001 
    dw $0650,$0600,$0006,$0650,$0000,$000C,$0450,$0000 
    dw $0001,$0550,$0100,$0004,$0550,$0000,$0012,$0150 
    dw $0000,$0006,$0110,$0000,$0001,$0150,$0040,$0007 
    dw $0150,$0000,$0001,$0550,$0400,$0004,$0550,$0000 
    dw $0016,$0450,$0000,$0001,$0550,$0100,$0005,$0550 
    dw $0000,$000B,$0150,$0000,$0007,$0110,$0000,$0001 
    dw $0150,$0040,$000A,$0150,$0000,$0001,$0550,$0400 
    dw $000C,$0550,$0000,$000E,$0150,$0000,$000A,$0110 
    dw $0000,$0001,$0150,$0040,$0008,$0150,$0000,$0001 
    dw $0550,$0400,$000C,$0550,$0000,$000E,$0150,$0000 
    dw $000A,$0110,$0000,$0001,$0150,$0040,$0008,$0150 
    dw $0000,$0001,$0550,$0400,$000D,$0550,$0000,$000E 
    dw $0150,$0000,$000A,$0110,$0000,$0001,$0150,$0040 
    dw $0009,$0150,$0000,$0001,$0550,$0400,$000C,$0550 
    dw $0000,$0008,$0150,$0000,$0004,$0100,$0000,$0020 
    dw $0000,$0000,$0001,$0400,$0400,$0005,$0400,$0000 
    dw $0001,$0200,$0200,$0005,$0200,$0000,$0028,$0000 
    dw $0000 
    dw Instruction_DemoInputObject_Delete 

InstList_DemoInput_IceBeam:
    dw $0021,$0000,$0000,$0001,$0040,$0040,$0005,$0040 
    dw $0000,$0006,$0000,$0000,$0001,$0040,$0040,$0005 
    dw $0040,$0000,$0012,$0000,$0000,$0001,$0200,$0200 
    dw $0017,$0200,$0000,$001C,$0000,$0000,$0001,$0080 
    dw $0080,$000E,$0080,$0000,$0001,$0480,$0400,$0005 
    dw $0480,$0000,$000B,$0400,$0000,$0001,$0440,$0040 
    dw $0006,$0440,$0000,$0008,$0400,$0000,$0007,$0000 
    dw $0000,$0001,$0200,$0200,$001D,$0200,$0000,$0009 
    dw $0000,$0000,$0001,$0200,$0200,$000E,$0200,$0000 
    dw $0001,$0280,$0080,$001D,$0280,$0000,$0038,$0200 
    dw $0000,$0001,$0280,$0080,$0016,$0280,$0000,$002B 
    dw $0200,$0000,$0001,$0080,$0080,$0010,$0080,$0000 
    dw $0001,$0480,$0400,$0008,$0480,$0000,$0005,$0400 
    dw $0000,$0001,$0440,$0040,$0008,$0440,$0000,$0008 
    dw $0400,$0000,$0008,$0000,$0000,$0001,$0200,$0200 
    dw $002B,$0200,$0000,$0001,$0280,$0080,$0010,$0280 
    dw $0000,$0012,$0200,$0000,$005D,$0000,$0000 
    dw Instruction_DemoInputObject_Delete 

InstList_DemoInput_GauntletEntrance:
    dw $0016,$0000,$0000,$0001,$0100,$0100,$0005,$0100 
    dw $0000,$0100,$0000,$0000 
    dw Instruction_DemoInputObject_Delete 

InstList_DemoInput_AdvancedGrappleBeam:
    dw $003F,$0000,$0000,$0001,$0100,$0100,$0005,$0100 
    dw $0000,$001E,$0000,$0000,$0001,$0200,$0200,$0005 
    dw $0200,$0000,$0016,$0000,$0000,$0001,$2000,$2000 
    dw $0004,$2000,$0000,$000D,$0000,$0000,$0001,$2000 
    dw $2000,$0005,$2000,$0000,$0008,$0000,$0000,$0001 
    dw $2000,$2000,$0006,$2000,$0000,$0007,$0000,$0000 
    dw $0001,$2000,$2000,$0005,$2000,$0000,$002F,$0000 
    dw $0000,$0001,$0200,$0200,$0014,$0200,$0000,$0002 
    dw $0000,$0000,$0001,$0100,$0100,$0006,$0100,$0000 
    dw $0009,$0000,$0000,$0001,$0040,$0040,$0019,$0040 
    dw $0000,$0001,$0440,$0400,$0005,$0440,$0000,$0001 
    dw $0540,$0100,$0002,$0540,$0000,$0006,$0140,$0000 
    dw $0027,$0040,$0000,$0001,$0240,$0200,$000D,$0240 
    dw $0000,$0034,$0040,$0000,$0001,$0140,$0100,$0007 
    dw $0140,$0000,$0037,$0040,$0000,$0001,$0240,$0200 
    dw $000F,$0240,$0000,$002F,$0040,$0000,$0001,$0140 
    dw $0100,$00B1,$0140,$0000,$0001,$01C0,$0080,$000B 
    dw $01C0,$0000,$00BA,$0180,$0000,$0003,$0100,$0000 
    dw $0046,$0000,$0000 
    dw Instruction_DemoInputObject_Delete 

InstList_DemoInput_IBJ:
    dw $0019,$0000,$0000,$0001,$0100,$0100,$0022,$0100 
    dw $0000,$0018,$0000,$0000,$0001,$0080,$0080,$000B 
    dw $0080,$0000,$0001,$0480,$0400,$0007,$0480,$0000 
    dw $0002,$0080,$0000,$0001,$0480,$0400,$0008,$0480 
    dw $0000,$0001,$04C0,$0040,$0003,$04C0,$0000,$000A 
    dw $00C0,$0000,$0002,$0080,$0000,$0020,$0000,$0000 
    dw $0001,$0040,$0040,$000B,$0040,$0000,$0025,$0000 
    dw $0000,$0001,$0040,$0040,$0009,$0040,$0000,$0026 
    dw $0000,$0000,$0001,$0040,$0040,$0009,$0040,$0000 
    dw $0026,$0000,$0000,$0001,$0040,$0040,$0008,$0040 
    dw $0000,$0027,$0000,$0000,$0001,$0040,$0040,$0009 
    dw $0040,$0000,$0028,$0000,$0000,$0001,$0040,$0040 
    dw $0008,$0040,$0000,$0028,$0000,$0000,$0001,$0040 
    dw $0040,$0009,$0040,$0000,$0026,$0000,$0000,$0001 
    dw $0040,$0040,$0008,$0040,$0000,$0028,$0000,$0000 
    dw $0001,$0040,$0040,$0007,$0040,$0000,$0029,$0000 
    dw $0000,$0001,$0040,$0040,$0007,$0040,$0000,$0029 
    dw $0000,$0000,$0001,$0040,$0040,$0007,$0040,$0000 
    dw $0028,$0000,$0000,$0001,$0040,$0040,$0008,$0040 
    dw $0000,$0027,$0000,$0000,$0001,$0040,$0040,$0007 
    dw $0040,$0000,$002A,$0000,$0000,$0001,$0040,$0040 
    dw $0007,$0040,$0000,$002A,$0000,$0000,$0001,$0040 
    dw $0040,$0007,$0040,$0000,$0028,$0000,$0000,$0001 
    dw $0040,$0040,$0007,$0040,$0000,$0028,$0000,$0000 
    dw $0001,$0040,$0040,$0007,$0040,$0000,$0010,$0000 
    dw $0000,$0001,$0100,$0100,$001E,$0100,$0000,$0017 
    dw $0000,$0000,$0001,$0800,$0800,$0009,$0800,$0000 
    dw $0008,$0000,$0000,$0001,$0800,$0800,$0005,$0800 
    dw $0000,$0001,$0000,$0000,$0001,$0800,$0800,$0009 
    dw $0000,$0000,$0001,$0200,$0200,$0004,$0200,$0000 
    dw $00C4,$0000,$0000 
    dw Instruction_DemoInputObject_Delete 

InstList_DemoInput_SBA:
    dw $001A,$0000,$0000,$0001,$2000,$2000,$0008,$2000 
    dw $0000,$0006,$0000,$0000,$0001,$2000,$2000,$0006 
    dw $2000,$0000,$0006,$0000,$0000,$0001,$2000,$2000 
    dw $0006,$2000,$0000,$0008,$0000,$0000,$0001,$0080 
    dw $0080,$0003,$0080,$0000,$0001,$0180,$0100,$0023 
    dw $0180,$0000,$0007,$0100,$0000,$0010,$0000,$0000 
    dw $0001,$0080,$0080,$0010,$0080,$0000,$0001,$0280 
    dw $0200,$0007,$0280,$0000,$0001,$02C0,$0040,$0004 
    dw $02C0,$0000,$000E,$0240,$0000,$0010,$0040,$0000 
    dw $0001,$00C0,$0080,$0008,$00C0,$0000,$0001,$01C0 
    dw $0100,$000B,$01C0,$0000,$0014,$0140,$0000,$0015 
    dw $0040,$0000,$0001,$0440,$0400,$0006,$0440,$0000 
    dw $0040,$0040,$0000,$0034,$0000,$0000 
    dw Instruction_DemoInputObject_Delete 

InstList_DemoInput_TourianEntrance:
    dw $0195,$0000,$0000 
    dw Instruction_DemoInputObject_Delete 

InstList_DemoInput_CrystalFlash:
    dw $001B,$0000,$0000,$0001,$0400,$0400,$0005,$0400 
    dw $0000,$0005,$0000,$0000,$0001,$0400,$0400,$0007 
    dw $0400,$0000,$0009,$0000,$0000,$0001,$2000,$2000 
    dw $0006,$2000,$0000,$0006,$0000,$0000,$0001,$2000 
    dw $2000,$0005,$2000,$0000,$0008,$0000,$0000,$0001 
    dw $2000,$2000,$0007,$2000,$0000,$0031,$0000,$0000 
    dw $0001,$0430,$0430,$0009,$0430,$0000,$0001,$0470 
    dw $0040,$0010,$0470,$0000,$001E,$0430,$0000,$0001 
    dw $0470,$0040,$00BE,$0470,$0000,$0003,$0070,$0000 
    dw $0001,$0030,$0000,$0001,$0010,$0000,$013C,$0000 
    dw $0000 
    dw Instruction_DemoInputObject_Delete 

DemoInputObjects_Title_LandingSite:
    dw RTS_9183BF 
    dw PreInstruction_DemoInput_Normal 
    dw InstList_DemoInput_LandingSite 

DemoInputObjects_Title_PseudoScrewAttack:
    dw RTS_9183BF 
    dw PreInstruction_DemoInput_Normal 
    dw InstList_DemoInput_PseudoScrewAttack 

DemoInputObjects_Title_SpeedBooster:
    dw RTS_9183BF 
    dw PreInstruction_DemoInput_Normal 
    dw InstList_DemoInput_SpeedBooster 

DemoInputObjects_Title_Dachora:
    dw RTS_9183BF 
    dw PreInstruction_DemoInput_Normal 
    dw InstList_DemoInput_Dachora 

DemoInputObjects_Title_RedBrinstarElevator:
    dw RTS_9183BF 
    dw PreInstruction_DemoInput_Normal 
    dw InstList_DemoInput_RedBrinstarElevator 

DemoInputObjects_Title_WreckedShipBasement:
    dw RTS_9183BF 
    dw PreInstruction_DemoInput_Normal 
    dw InstList_DemoInput_WreckedShipBasement 

DemoInputObjects_Title_LowerNorfairEntrance:
    dw RTS_9183BF 
    dw PreInstruction_DemoInput_Normal 
    dw InstList_DemoInput_LowerNorfairEntrance 

DemoInputObjects_Title_EyeDoor:
    dw RTS_9183BF 
    dw PreInstruction_DemoInput_Normal 
    dw InstList_DemoInput_EyeDoor 

DemoInputObjects_Title_Shinespark:
    dw RTS_9183BF 
    dw PreInstruction_DemoInput_Shinespark 
    dw InstList_DemoInput_Shinespark 

DemoInputObjects_Title_MissileDoor:
    dw RTS_9183BF 
    dw PreInstruction_DemoInput_Normal 
    dw InstList_DemoInput_MissileDoor 

DemoInputObjects_Title_Kraid:
    dw RTS_9183BF 
    dw PreInstruction_DemoInput_Normal 
    dw InstList_DemoInput_Kraid 

DemoInputObjects_Title_FireFleaRoom:
    dw RTS_9183BF 
    dw PreInstruction_DemoInput_Normal 
    dw InstList_DemoInput_FireFleaRoom 

DemoInputObjects_Title_ScrewAttack:
    dw RTS_9183BF 
    dw PreInstruction_DemoInput_Normal 
    dw InstList_DemoInput_ScrewAttack 

DemoInputObjects_Title_BrinstarDiagonalRoom:
    dw RTS_9183BF 
    dw PreInstruction_DemoInput_Normal 
    dw InstList_DemoInput_BrinstarDiagonalRoom 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_DemoInputObjects_Title_919EA6:
    dw RTS_9183BF 
    dw PreInstruction_DemoInput_Normal 
    dw UNUSED_InstList_DemoInput_9195BC 
endif ; !FEATURE_KEEP_UNREFERENCED

DemoInputObjects_Title_PreSporeSpawnHall:
    dw RTS_9183BF 
    dw PreInstruction_DemoInput_Normal 
    dw InstList_DemoInput_PreSporeSpawnHall 

DemoInputObjects_Title_GrappleBeam:
    dw RTS_9183BF 
    dw PreInstruction_DemoInput_Normal 
    dw InstList_DemoInput_GrappleBeam 

DemoInputObjects_Title_IceBeam:
    dw RTS_9183BF 
    dw PreInstruction_DemoInput_Normal 
    dw InstList_DemoInput_IceBeam 

DemoInputObjects_Title_GauntletEntrance:
    dw RTS_9183BF 
    dw PreInstruction_DemoInput_Normal 
    dw InstList_DemoInput_GauntletEntrance 

DemoInputObjects_Title_AdvancedGrappleBeam:
    dw RTS_9183BF 
    dw PreInstruction_DemoInput_Normal 
    dw InstList_DemoInput_AdvancedGrappleBeam 

DemoInputObjects_Title_IBJ:
    dw RTS_9183BF 
    dw PreInstruction_DemoInput_Normal 
    dw InstList_DemoInput_IBJ 

DemoInputObjects_Title_SBA:
    dw RTS_9183BF 
    dw PreInstruction_DemoInput_Normal 
    dw InstList_DemoInput_SBA 

DemoInputObjects_Title_TourianEntrance:
    dw RTS_9183BF 
    dw PreInstruction_DemoInput_Normal 
    dw InstList_DemoInput_TourianEntrance 

DemoInputObjects_Title_CrystalFlash:
    dw RTS_9183BF 
    dw PreInstruction_DemoInput_Normal 
    dw InstList_DemoInput_CrystalFlash 

TransitionTable:
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
    dw TransitionTable_19_FacingRIght_SpinJump 
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

TransitionTable_Terminator_91A0DE:
    dw $FFFF 

TransitionTable_00_9B_FacingForward:
    dw $0000,$0100,$0026,$0000,$0200,$0025,$FFFF 

TransitionTable_01_03_05_07_A4_A6_E0_E2_E4_E6_FacingRight:
    dw $0080,$0800,$0055,$0080,$0010,$0057,$0080,$0020 
    dw $0059,$0080,$0000,$004B,$0400,$0030,$00F1,$0400 
    dw $0010,$00F3,$0400,$0020,$00F5,$0400,$0000,$0035 
    dw $0000,$0260,$0078,$0000,$0250,$0076,$0000,$0230 
    dw $0025,$0000,$0030,$0003,$0000,$0110,$000F,$0000 
    dw $0120,$0011,$0000,$0900,$000F,$0000,$0500,$0011 
    dw $0000,$0240,$004A,$0000,$0200,$0025,$0000,$0800 
    dw $0003,$0000,$0010,$0005,$0000,$0020,$0007,$0000 
    dw $0100,$0009,$FFFF 

TransitionTable_02_04_06_08_A5_A7_E1_E3_E5_E7_FacingLeft:
    dw $0080,$0800,$0056,$0080,$0010,$0058,$0080,$0020 
    dw $005A,$0080,$0000,$004C,$0400,$0030,$00F2,$0400 
    dw $0010,$00F4,$0400,$0020,$00F6,$0400,$0000,$0036 
    dw $0000,$0160,$0077,$0000,$0150,$0075,$0000,$0130 
    dw $0026,$0000,$0030,$0004,$0000,$0210,$0010,$0000 
    dw $0220,$0012,$0000,$0A00,$0010,$0000,$0600,$0012 
    dw $0000,$0140,$0049,$0000,$0100,$0026,$0000,$0800 
    dw $0004,$0000,$0010,$0006,$0000,$0020,$0008,$0000 
    dw $0200,$000A,$FFFF 

TransitionTable_09_0D_0F_11_MovingRight:
    dw $0400,$0000,$0035,$0080,$0000,$0019,$0000,$0110 
    dw $000F,$0000,$0120,$0011,$0000,$0900,$000F,$0000 
    dw $0500,$0011,$0000,$0140,$000B,$0000,$0100,$0009 
    dw $0000,$0200,$0025,$0000,$0800,$0003,$0000,$0010 
    dw $0005,$0000,$0020,$0007,$FFFF 

TransitionTable_0A_0E_10_12_MovingLeft:
    dw $0400,$0000,$0036,$0080,$0000,$001A,$0000,$0210 
    dw $0010,$0000,$0220,$0012,$0000,$0A00,$0010,$0000 
    dw $0600,$0012,$0000,$0240,$000C,$0000,$0200,$000A 
    dw $0000,$0100,$0026,$0000,$0800,$0004,$0000,$0010 
    dw $0006,$0000,$0020,$0008,$FFFF 

TransitionTable_4B_55_57_59_FacingRight_NormalJumpTransition:
    dw $0000,$0280,$002F,$0000,$0880,$0015,$0000,$0480 
    dw $0017,$0000,$0090,$0069,$0000,$00A0,$006B,$0000 
    dw $0180,$0051,$0000,$00C0,$0013,$0000,$0040,$0013 
    dw $FFFF 

TransitionTable_4C_56_58_5A_FacingLeft_NormalJumpTransition:
    dw $0000,$0180,$0030,$0000,$0880,$0016,$0000,$0480 
    dw $0018,$0000,$0090,$006A,$0000,$00A0,$006C,$0000 
    dw $0280,$0052,$0000,$00C0,$0014,$0000,$0100,$0030 
    dw $0000,$0040,$0014,$FFFF 

TransitionTable_15_4D_51_69_6B_FacingRight_NormalJump:
    dw $0000,$0980,$0069,$0000,$0580,$006B,$0000,$0190 
    dw $0069,$0000,$01A0,$006B,$0000,$0900,$0069,$0000 
    dw $0500,$006B,$0000,$0280,$002F,$0000,$0880,$0015 
    dw $0000,$0480,$0017,$0000,$0090,$0069,$0000,$00A0 
    dw $006B,$0000,$0180,$0051,$0000,$00C0,$0013,$0000 
    dw $0200,$002F,$0000,$0800,$0015,$0000,$0400,$0017 
    dw $0000,$0010,$0069,$0000,$0020,$006B,$0000,$0100 
    dw $0051,$0000,$0080,$004D,$0000,$0040,$0013,$FFFF 

TransitionTable_16_4E_52_6A_6C_FacingLeft_NormalJump:
    dw $0000,$0A80,$006A,$0000,$0680,$006C,$0000,$0290 
    dw $006A,$0000,$02A0,$006C,$0000,$0A00,$006A,$0000 
    dw $0600,$006C,$0000,$0180,$0030,$0000,$0880,$0016 
    dw $0000,$0480,$0018,$0000,$0090,$006A,$0000,$00A0 
    dw $006C,$0000,$0280,$0052,$0000,$00C0,$0014,$0000 
    dw $0100,$0030,$0000,$0800,$0016,$0000,$0400,$0018 
    dw $0000,$0010,$006A,$0000,$0020,$006C,$0000,$0200 
    dw $0052,$0000,$0080,$004E,$0000,$0040,$0014,$FFFF 

TransitionTable_4F_FacingLeft_DamageBoost:
    dw $0000,$0280,$0052,$0000,$0180,$004F,$0000,$0080 
    dw $004E,$FFFF 

TransitionTable_50_FacingRight_DamageBoost:
    dw $0000,$0280,$0050,$0000,$0180,$0051,$0000,$0080 
    dw $004D,$FFFF 

TransitionTable_19_FacingRIght_SpinJump:
    dw $0040,$0000,$0013,$0040,$0100,$0013,$0000,$0840 
    dw $0015,$0000,$0440,$0017,$0000,$0050,$0069,$0000 
    dw $0060,$006B,$0000,$0180,$0019,$0000,$0800,$0015 
    dw $0000,$0010,$0069,$0000,$0020,$006B,$0000,$0400 
    dw $0017,$0000,$0100,$0019,$0000,$0200,$001A,$FFFF 

TransitionTable_1A_FacingLeft_SpinJump:
    dw $0040,$0000,$0014,$0040,$0200,$0014,$0000,$0840 
    dw $0016,$0000,$0440,$0018,$0000,$0050,$006A,$0000 
    dw $0060,$006C,$0000,$0280,$001A,$0000,$0800,$0016 
    dw $0000,$0010,$006A,$0000,$0020,$006C,$0000,$0400 
    dw $0018,$0000,$0200,$001A,$0000,$0100,$0019,$FFFF 

TransitionTable_1B_FacingRight_SpaceJump:
    dw $0040,$0000,$0013,$0040,$0100,$0013,$0000,$0840 
    dw $0015,$0000,$0440,$0017,$0000,$0050,$0069,$0000 
    dw $0060,$006B,$0000,$0180,$001B,$0000,$0800,$0015 
    dw $0000,$0010,$0069,$0000,$0020,$006B,$0000,$0400 
    dw $0017,$0000,$0100,$001B,$0000,$0200,$001C,$FFFF 

TransitionTable_1C_FacingLeft_SpaceJump:
    dw $0040,$0000,$0014,$0040,$0200,$0014,$0000,$0840 
    dw $0016,$0000,$0440,$0018,$0000,$0050,$006A,$0000 
    dw $0060,$006C,$0000,$0280,$001C,$0000,$0800,$0016 
    dw $0000,$0010,$006A,$0000,$0020,$006C,$0000,$0400 
    dw $0018,$0000,$0200,$001C,$0000,$0100,$001B,$FFFF 

TransitionTable_81_ScrewAttack:
    dw $0040,$0000,$0013,$0040,$0100,$0013,$0000,$0840 
    dw $0015,$0000,$0440,$0017,$0000,$0050,$0069,$0000 
    dw $0060,$006B,$0000,$0180,$0081,$0000,$0800,$0015 
    dw $0000,$0010,$0069,$0000,$0020,$006B,$0000,$0400 
    dw $0017,$0000,$0100,$0081,$0000,$0200,$0082,$FFFF 

TransitionTable_82_FacingLeft_ScrewAttack:
    dw $0040,$0000,$0014,$0040,$0200,$0014,$0000,$0840 
    dw $0016,$0000,$0440,$0018,$0000,$0050,$006A,$0000 
    dw $0060,$006C,$0000,$0280,$0082,$0000,$0800,$0016 
    dw $0000,$0010,$006A,$0000,$0020,$006C,$0000,$0400 
    dw $0018,$0000,$0200,$0082,$0000,$0100,$0081,$FFFF 

TransitionTable_1D_FaceRight_MorphBall_NoSpringBall_OnGround:
    dw $0800,$0000,$003D,$0080,$0000,$003D,$0000,$0100 
    dw $001E,$0000,$0200,$001F,$FFFF 

TransitionTable_1E_MoveRight_MorphBall_NoSpringBall_OnGround:
    dw $0800,$0000,$003D,$0080,$0000,$003D,$0000,$0100 
    dw $001E,$0000,$0200,$001F,$FFFF 

TransitionTable_1F_MoveLeft_MorphBall_NoSpringBall_OnGround:
    dw $0800,$0000,$003E,$0080,$0000,$003E,$0000,$0100 
    dw $001E,$0000,$0200,$001F,$FFFF 

TransitionTable_1D_FaceLeft_MorphBall_NoSpringBall_OnGround:
    dw $0800,$0000,$003E,$0080,$0000,$003E,$0000,$0100 
    dw $001E,$0000,$0200,$001F,$FFFF 

UNUSED_TransitionTable_20_21_22_24_91A666:
    dw $FFFF 

UNUSED_TransitionTable_23_91A668:
    dw $FFFF 

UNUSED_TransitionTable_42_91A66A:
    dw $FFFF 

TransitionTable_27_71_73_85_FacingRight_Crouching:
    dw $0800,$0030,$00F7,$0800,$0010,$00F9,$0800,$0020 
    dw $00FB,$0800,$0000,$003B,$0200,$0000,$0043,$0400 
    dw $0000,$0037,$0080,$0000,$004B,$0000,$0030,$0085 
    dw $0000,$0110,$0001,$0000,$0120,$0001,$0000,$0010 
    dw $0071,$0000,$0020,$0073,$0000,$0100,$0001,$FFFF 

TransitionTable_28_72_74_86_Crouching:
    dw $0800,$0030,$00F8,$0800,$0010,$00FA,$0800,$0020 
    dw $00FC,$0800,$0000,$003C,$0100,$0000,$0044,$0400 
    dw $0000,$0038,$0080,$0000,$004C,$0000,$0030,$0086 
    dw $0000,$0220,$0002,$0000,$0210,$0002,$0000,$0010 
    dw $0072,$0000,$0020,$0074,$0000,$0200,$0002,$FFFF 

TransitionTable_29_2B_6D_6F_FacingRight_Falling:
    dw $0000,$0900,$006D,$0000,$0500,$006F,$0000,$0A00 
    dw $0087,$0000,$0600,$0087,$0000,$0200,$0087,$0000 
    dw $0800,$002B,$0000,$0400,$002D,$0000,$0010,$006D 
    dw $0000,$0020,$006F,$0000,$0040,$0067,$0000,$0100 
    dw $0029,$FFFF 

TransitionTable_2A_2C_6E_70_FacingLeft_Falling:
    dw $0000,$0A00,$006E,$0000,$0600,$0070,$0000,$0900 
    dw $0088,$0000,$0500,$0088,$0000,$0100,$0088,$0000 
    dw $0800,$002C,$0000,$0400,$002E,$0000,$0010,$006E 
    dw $0000,$0020,$0070,$0000,$0040,$0068,$0000,$0200 
    dw $002A,$FFFF 

TransitionTable_31_FacingRight_MorphBall_NoSpringBall_InAir:
    dw $0800,$0000,$003D,$0080,$0000,$003D,$0000,$0100 
    dw $0031,$0000,$0200,$0032,$FFFF 

TransitionTable_32_FacingLeft_MorphBall_NoSpringBall_InAir:
    dw $0800,$0000,$003E,$0080,$0000,$003E,$0000,$0200 
    dw $0032,$0000,$0100,$0031,$FFFF 

UNUSED_TransitionTable_33_91A7C8:
    dw $FFFF 

UNUSED_TransitionTable_34_91A7CA:
    dw $FFFF 

UNUSED_TransitionTable_45_91A7CC:
    dw $0000,$0240,$0045,$0000,$0100,$0009,$0000,$0200 
    dw $0025,$FFFF 

UNUSED_TransitionTable_46_91A7E0:
    dw $0000,$0140,$0046,$0000,$0200,$000A,$0000,$0100 
    dw $0026,$FFFF 

UNUSED_TransitionTable_47_91A7F4:
    dw $FFFF 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_TransitionTable_PossiblyPartOfAbove_91A7F6:
    dw $0080,$0000,$004B,$0400,$0000,$0035,$0000,$0210 
    dw $0078,$0000,$0220,$0076,$0000,$0240,$004A,$0000 
    dw $0100,$0009,$0000,$0200,$0025,$0000,$0800,$0003 
    dw $0000,$0010,$0005,$0000,$0020,$0007,$FFFF 
endif ; !FEATURE_KEEP_UNREFERENCED

UNUSED_TransitionTable_48_91A834:
    dw $FFFF 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_TransitionTable_PossiblyPartOfAbove_91A836:
    dw $0080,$0000,$004C,$0400,$0000,$0036,$0000,$0120 
    dw $0077,$0000,$0110,$0075,$0000,$0140,$0049,$0000 
    dw $0200,$000A,$0000,$0100,$0026,$0000,$0800,$0004 
    dw $0000,$0010,$0006,$0000,$0020,$0008,$FFFF 
endif ; !FEATURE_KEEP_UNREFERENCED

TransitionTable_49_75_77_FacingLeft_Moonwalk:
    dw $0400,$0000,$0036,$0080,$0000,$00C0,$0080,$0010 
    dw $00C2,$0080,$0020,$00C4,$0000,$0160,$0077,$0000 
    dw $0150,$0075,$0000,$0140,$0049,$0000,$0200,$000A 
    dw $0000,$0100,$0026,$FFFF 

TransitionTable_4A_76_78_FacingRight_Moonwalk:
    dw $0400,$0000,$0035,$0080,$0000,$00BF,$0080,$0010 
    dw $00C1,$0080,$0020,$00C3,$0000,$0250,$0076,$0000 
    dw $0260,$0078,$0000,$0240,$004A,$0000,$0100,$0009 
    dw $0000,$0200,$0025,$FFFF 

TransitionTable_53_FacingRight_Knockback:
    dw $0000,$0280,$0050,$FFFF 

TransitionTable_54_FacingLeft_Knockback:
    dw $0000,$0180,$004F,$FFFF 

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

UNUSED_TransitionTable_5B_91A8FC:
    dw $0000,$0280,$0066,$FFFF 

UNUSED_TransitionTable_5C_91A904:
    dw $0000,$0180,$0065,$FFFF 

TransitionTable_79_7B_FacingRight_MorphBall_Spring_OnGround:
    dw $0800,$0000,$003D,$0080,$0000,$007F,$0000,$0100 
    dw $007B,$0000,$0200,$007C,$FFFF 

TransitionTable_7A_7C_FacingLeft_MorphBall_Spring_OnGround:
    dw $0800,$0000,$003E,$0080,$0000,$0080,$0000,$0100 
    dw $007B,$0000,$0200,$007C,$FFFF 

TransitionTable_7D_FacingRight_MorphBall_SpringBall_Falling:
    dw $0800,$0000,$003D,$0000,$0200,$007E,$0000,$0100 
    dw $007D,$FFFF 

TransitionTable_7E_FacingLeft_MorphBall_SpringBall_Falling:
    dw $0800,$0000,$003E,$0000,$0100,$007D,$0000,$0200 
    dw $007E,$FFFF 

TransitionTable_7F_FacingRight_MorphBall_SpringBall_InAir:
    dw $0800,$0000,$003D,$0000,$0100,$007F,$0000,$0200 
    dw $0080,$FFFF 

TransitionTable_80_FacingLeft_MorphBall_SpringBall_InAir:
    dw $0800,$0000,$003E,$0000,$0100,$007F,$0000,$0200 
    dw $0080,$FFFF 

UNUSED_TransitionTable_63_91A990:
    dw $0000,$0280,$0066,$FFFF 

UNUSED_TransitionTable_64_91A998:
    dw $0000,$0180,$0065,$FFFF 

UNUSED_TransitionTable_65_91A9A0:
    dw $0000,$0180,$0065,$0000,$0010,$0069,$0000,$0020 
    dw $006B,$0000,$0040,$0013,$0000,$0080,$0065,$0000 
    dw $0100,$0065,$FFFF 

UNUSED_TransitionTable_66_91A9C6:
    dw $0000,$0280,$0066,$0000,$0010,$006A,$0000,$0020 
    dw $006C,$0000,$0040,$0014,$0000,$0080,$0066,$0000 
    dw $0200,$0066,$FFFF 

TransitionTable_83_FacingRight_WallJump:
    dw $0400,$0000,$0037,$0000,$0200,$001A,$0000,$0010 
    dw $0069,$0000,$0020,$006B,$0000,$0040,$0013,$0000 
    dw $0080,$0083,$FFFF 

TransitionTable_84_FacingLeft_WallJump:
    dw $0400,$0000,$0038,$0000,$0100,$0019,$0000,$0010 
    dw $006A,$0000,$0020,$006C,$0000,$0040,$0014,$0000 
    dw $0080,$0084,$FFFF 

TransitionTable_89_CF_D1_FacingRight_RanIntoAWall:
    dw $0080,$0000,$004B,$0000,$0900,$000F,$0000,$0500 
    dw $0011,$0400,$0000,$0035,$0000,$0220,$0078,$0000 
    dw $0210,$0076,$0000,$0800,$0003,$0000,$0010,$0005 
    dw $0000,$0020,$0007,$0000,$0200,$0025,$0000,$0100 
    dw $0009,$FFFF 

TransitionTable_8A_D0_D2_FacingLeft_RanIntoAWall:
    dw $0080,$0000,$004C,$0000,$0A00,$0010,$0000,$0600 
    dw $0012,$0400,$0000,$0036,$0000,$0120,$0077,$0000 
    dw $0110,$0075,$0000,$0800,$0004,$0000,$0010,$0006 
    dw $0000,$0020,$0008,$0000,$0100,$0026,$0000,$0200 
    dw $000A,$FFFF 

TransitionTable_13_FaceRight_NormalJump_NotMoving_GunExtend:
    dw $0000,$0980,$0069,$0000,$0580,$006B,$0000,$0190 
    dw $0069,$0000,$01A0,$006B,$0000,$0900,$0069,$0000 
    dw $0500,$006B,$0000,$0280,$002F,$0000,$0880,$0015 
    dw $0000,$0480,$0017,$0000,$0090,$0069,$0000,$00A0 
    dw $006B,$0000,$0180,$0051,$0000,$00C0,$0013,$0000 
    dw $0200,$002F,$0000,$0800,$0015,$0000,$0400,$0017 
    dw $0000,$0010,$0069,$0000,$0020,$006B,$0000,$0100 
    dw $0051,$0000,$0040,$0013,$FFFF 

TransitionTable_14_FacingLeft_NormalJump_NotMoving_GunExtend:
    dw $0000,$0A80,$006A,$0000,$0680,$006C,$0000,$0290 
    dw $006A,$0000,$02A0,$006C,$0000,$0A00,$006A,$0000 
    dw $0600,$006C,$0000,$0180,$0030,$0000,$0880,$0016 
    dw $0000,$0480,$0018,$0000,$0090,$006A,$0000,$00A0 
    dw $006C,$0000,$0280,$0052,$0000,$00C0,$0014,$0000 
    dw $0100,$0030,$0000,$0800,$0016,$0000,$0400,$0018 
    dw $0000,$0010,$006A,$0000,$0020,$006C,$0000,$0200 
    dw $0052,$0000,$0040,$0014,$FFFF 

TransitionTable_17_FacingRight_NormalJump_AimingDown:
    dw $0400,$0000,$0037,$0000,$0980,$0069,$0000,$0580 
    dw $006B,$0000,$0190,$0069,$0000,$01A0,$006B,$0000 
    dw $01C0,$0013,$0000,$0900,$0069,$0000,$0500,$006B 
    dw $0000,$0280,$002F,$0000,$0880,$0015,$0000,$0480 
    dw $0017,$0000,$0090,$0069,$0000,$00A0,$006B,$0000 
    dw $0180,$0051,$0000,$00C0,$0013,$0000,$0200,$002F 
    dw $0000,$0800,$0015,$0000,$0400,$0017,$0000,$0010 
    dw $0069,$0000,$0020,$006B,$0000,$0100,$0051,$0000 
    dw $0080,$0017,$0000,$0040,$0013,$FFFF 

TransitionTable_18_FacingLeft_NormalJump_AimingDown:
    dw $0400,$0000,$0038,$0000,$0A80,$006A,$0000,$0680 
    dw $006C,$0000,$0290,$006A,$0000,$02A0,$006C,$0000 
    dw $02A0,$006C,$0000,$0A00,$006A,$0000,$0600,$006C 
    dw $0000,$0180,$0030,$0000,$0880,$0016,$0000,$0480 
    dw $0018,$0000,$0090,$006A,$0000,$00A0,$006C,$0000 
    dw $0280,$0052,$0000,$00C0,$0014,$0000,$0100,$0030 
    dw $0000,$0800,$0016,$0000,$0400,$0018,$0000,$0010 
    dw $006A,$0000,$0020,$006C,$0000,$0200,$0052,$0000 
    dw $0080,$0018,$0000,$0040,$0014,$FFFF 

TransitionTable_3D_FacingRight_Unmorphing:
    dw $0000,$0140,$0067,$0000,$0840,$002B,$0000,$0440 
    dw $002D,$FFFF 

TransitionTable_3E_FacingLeft_Unmorphing:
    dw $0000,$0240,$0068,$0000,$0840,$002C,$0000,$0440 
    dw $002E,$FFFF 

TransitionTable_25_FacingRight_Turning_Standing:
    dw $0000,$0280,$001A,$0080,$0000,$004C,$0000,$0200 
    dw $0025,$FFFF 

TransitionTable_26_FacingLeft_Turning_Standing:
    dw $0000,$0180,$0019,$0080,$0000,$004B,$0000,$0100 
    dw $0026,$FFFF 

TransitionTable_8B_FacingRight_Turning_Standing_AimingUp:
    dw $0080,$0200,$001A,$0080,$0000,$004C,$0000,$0200 
    dw $008B,$FFFF 

TransitionTable_8C_FacingLeft_Turning_Standing_AimingUp:
    dw $0080,$0100,$0019,$0080,$0000,$004B,$0000,$0100 
    dw $008C,$FFFF 

TransitionTable_8D_FacingRight_Turning_Standing_AimDownRight:
    dw $0080,$0200,$001A,$0080,$0000,$004C,$0000,$0200 
    dw $008D,$FFFF 

TransitionTable_8E_FacingLeft_Turning_Standing_AimDownLeft:
    dw $0080,$0100,$0019,$0080,$0000,$004B,$0000,$0100 
    dw $008E,$FFFF 

TransitionTable_C7_FacingRight_VerticalShinesparkWindup:
    dw $0000,$0880,$00CB,$0000,$0090,$00CD,$0000,$0180 
    dw $00C9,$FFFF 

TransitionTable_C8_FacingLeft_VerticalShinesparkWindup:
    dw $0000,$0880,$00CC,$0000,$0090,$00CE,$0000,$0280 
    dw $00CA,$FFFF 

TransitionTable_2D_FacingRight_Falling_AimingDown:
    dw $0400,$0000,$0037,$0000,$0900,$006D,$0000,$0500 
    dw $006F,$0000,$0800,$002B,$0000,$0400,$002D,$0000 
    dw $0200,$0087,$0000,$0010,$006D,$0000,$0020,$006F 
    dw $0000,$0040,$0067,$0000,$0100,$0029,$FFFF 

TransitionTable_2E_FacingLeft_Falling_AimingDown:
    dw $0400,$0000,$0038,$0000,$0A00,$006E,$0000,$0600 
    dw $0070,$0000,$0800,$002C,$0000,$0400,$002E,$0000 
    dw $0100,$0088,$0000,$0010,$006E,$0000,$0020,$0070 
    dw $0000,$0040,$0068,$0000,$0200,$002A,$FFFF 

UNUSED_TransitionTable_DF_91AE10:
    dw $0800,$0000,$00DE,$FFFF 

TransitionTable_BA_BB_BC_BD_BE_FacingLeft_GrabbedByDraygon:
    dw $0000,$0A40,$00BB,$0000,$0640,$00BD,$0000,$0240 
    dw $00BC,$0000,$0010,$00BB,$0000,$0020,$00BD,$0000 
    dw $0040,$00BC,$0000,$0200,$00BE,$0000,$0100,$00BE 
    dw $0000,$0800,$00BE,$0000,$0400,$00BE,$FFFF 

TransitionTable_EC_ED_EE_EF_F0_FacingRight_GrabbedByDraygon:
    dw $0000,$0940,$00ED,$0000,$0540,$00EF,$0000,$0140 
    dw $00EE,$0000,$0010,$00ED,$0000,$0020,$00EF,$0000 
    dw $0040,$00EE,$0000,$0200,$00F0,$0000,$0100,$00F0 
    dw $0000,$0800,$00F0,$0000,$0400,$00F0,$FFFF 

TransitionTable_0B_MovingRight_GunExtended:
    dw $0400,$0000,$0035,$0080,$0000,$0019,$0000,$0110 
    dw $000F,$0000,$0120,$0011,$0000,$0900,$000F,$0000 
    dw $0500,$0011,$0000,$0140,$000B,$0000,$0100,$000B 
    dw $0000,$0200,$0025,$0000,$0800,$0003,$0000,$0010 
    dw $0005,$0000,$0020,$0007,$FFFF 

TransitionTable_0C_MovingLeft_GunExtended:
    dw $0400,$0000,$0036,$0080,$0000,$001A,$0000,$0210 
    dw $0010,$0000,$0220,$0012,$0000,$0A00,$0010,$0000 
    dw $0600,$0012,$0000,$0240,$000C,$0000,$0200,$000C 
    dw $0000,$0100,$0026,$0000,$0800,$0004,$0000,$0010 
    dw $0006,$0000,$0020,$0008,$FFFF 

TransitionTable_67_FacingRight_Falling_GunExtended:
    dw $0000,$0900,$006D,$0000,$0500,$006F,$0000,$0800 
    dw $002B,$0000,$0400,$002D,$0000,$0200,$0087,$0000 
    dw $0010,$006D,$0000,$0020,$006F,$0000,$0040,$0067 
    dw $0000,$0100,$0067,$FFFF 

TransitionTable_68_FacingLeft_Falling_GunExtended:
    dw $0000,$0A00,$006E,$0000,$0600,$0070,$0000,$0800 
    dw $002C,$0000,$0400,$002E,$0000,$0100,$0088,$0000 
    dw $0010,$006E,$0000,$0020,$0070,$0000,$0040,$0068 
    dw $0000,$0200,$0068,$FFFF 

TransitionTable_BF_FacingRight_Moonwalking_TurnJumpLeft:
    dw $0000,$0280,$001A,$0080,$0000,$004C,$0000,$0200 
    dw $00BF,$FFFF 

TransitionTable_C0_FacingLeft_Moonwalking_TurnJumpRight:
    dw $0000,$0180,$0019,$0080,$0000,$004B,$0000,$0100 
    dw $00C0,$FFFF 

TransitionTable_C1_FaceRight_Moonwalk_TurnJumpLeft_AimUpRight:
    dw $0080,$0200,$001A,$0080,$0000,$004C,$0000,$0200 
    dw $00C1,$FFFF 

TransitionTable_C2_FaceLeft_Moonwalk_TurnJumpRight_AimUpLeft:
    dw $0080,$0100,$0019,$0080,$0000,$004B,$0000,$0100 
    dw $00C2,$FFFF 

TransitionTable_C3_FaceRight_Moonwalk_TurnJumpLeft_AimDownRight:
    dw $0080,$0200,$001A,$0080,$0000,$004C,$0000,$0200 
    dw $00C3,$FFFF 

TransitionTable_C4_FaceLeft_Moonwalk_TurnJumpRight_AimDownLeft:
    dw $0080,$0100,$0019,$0080,$0000,$004B,$0000,$0100 
    dw $00C4,$FFFF 

AnimationDelayTable:
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

AnimationDelays_09_0A_0B_0C_0D_0E_0F_10_11_12_45_46:
    db $02,$03,$02,$03,$02,$03,$02,$03,$02,$03,$FF 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_AnimationDelays_91B215:
    db $04,$04,$04,$04,$04,$04,$03,$04,$04,$03,$FF,$0A,$FF 
endif ; !FEATURE_KEEP_UNREFERENCED

AnimationDelays_03_04_85_86:
    db $02,$10,$FE,$01 

AnimationDelays_49_4A_75_76_77_78:
    db $10,$10,$10,$10,$10,$10,$FF 

AnimationDelays_A4_E6:
    db $05,$02,$F8,$01 

AnimationDelays_A5_E7:
    db $05,$02,$F8,$02 

AnimationDelays_A6:
    db $03,$05,$02,$F8,$01 

AnimationDelays_A7:
    db $03,$05,$02,$F8,$02 

AnimationDelays_E0:
    db $05,$02,$F8,$03 

AnimationDelays_E1:
    db $05,$02,$F8,$04 

AnimationDelays_E2:
    db $05,$02,$F8,$05 

AnimationDelays_E3:
    db $05,$02,$F8,$06 

AnimationDelays_E4:
    db $05,$02,$F8,$07 

AnimationDelays_E5:
    db $05,$02,$F8,$08 

AnimationDelays_E8:
    db $02,$02,$02,$10,$F7,$01,$FE,$01,$10,$10,$10,$10,$FE,$04,$03,$FD 
    db $01 

AnimationDelays_E9:
    db $02,$02,$10,$F7,$01,$FE,$01,$08,$10,$10,$10,$10,$FE,$04,$10,$10 
    db $10,$FD,$02,$10,$10,$10,$10,$10,$FE,$0E,$10,$FE,$11,$10,$FE,$01 

AnimationDelays_EA:
    db $10,$10,$10,$10,$FF,$03,$FD,$01 

AnimationDelays_EB:
    db $10,$10,$10,$10,$FF,$03,$FD,$02 

AnimationDelays_01_02:
    db $0A,$0A,$0A,$0A,$F6,$08,$08,$08,$08,$FE,$04 

AnimationDelays_27_28:
    db $0A,$0A,$0A,$0A,$F6,$08,$08,$08,$08,$FE,$04 

AnimationDelays_D5_D6_D9_DA:
    db $0F,$0F,$0F,$0F,$0F,$FF 

AnimationDelays_Various_91B2B4:
    db $10,$FF 

AnimationDelays_A8_A9_AA_AB:
    db $10,$FF 

AnimationDelays_AC_AD:
    db $02,$10,$FE,$01 

AnimationDelays_AE_AF:
    db $02,$10,$FE,$01 

AnimationDelays_B0_B1:
    db $02,$10,$FE,$01 

AnimationDelays_B2_B3:
    db $08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08 
    db $08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08 
    db $08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08 
    db $08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08 
    db $08,$08,$FE,$01 

AnimationDelays_4B:
    db $01,$FD,$4D 

AnimationDelays_4C:
    db $01,$FD,$4E 

AnimationDelays_55:
    db $01,$FD,$15,$00 

AnimationDelays_56:
    db $01,$FD,$16,$00 

AnimationDelays_57:
    db $01,$FD,$69,$00 

AnimationDelays_58:
    db $01,$FD,$6A,$00 

AnimationDelays_59:
    db $01,$FD,$6B,$00 

AnimationDelays_5A:
    db $01,$FD,$6C,$00 

AnimationDelays_4D_4E_C7_C8:
    db $03,$04,$04,$04,$04,$50,$FE,$01 

AnimationDelays_4F_50:
    db $08,$02,$02,$02,$02,$02,$02,$02,$02,$02,$FE,$01 

AnimationDelays_15_16:
    db $02,$10,$FE,$01 

AnimationDelays_17_18:
    db $02,$10,$FE,$01 

AnimationDelays_51_52:
    db $02,$03,$FE,$01 

AnimationDelays_13_14_69_6A_6B_6C:
    db $02,$10,$FE,$01 

AnimationDelays_29_2A:
    db $08,$06,$06,$FE,$01,$08,$10,$FE,$01 

AnimationDelays_67_68:
    db $08,$06,$06,$FE,$01,$08,$10,$FE,$01 

AnimationDelays_2B_2C:
    db $02,$10,$10,$FE,$01 

AnimationDelays_6D_6E_6F_70:
    db $02,$F0,$10,$FE,$01 

AnimationDelays_2D_2E:
    db $02,$10,$FE,$01 

AnimationDelays_53_54:
    db $02,$10,$FE,$01 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_AnimationDelays_91B36E:
    db $06,$06,$06,$08,$FF,$08,$08,$FF,$0A,$FF 
endif ; !FEATURE_KEEP_UNREFERENCED

AnimationDelays_Various_91B378:
    db $03,$03,$03,$03,$03,$03,$03,$03,$FF,$03,$FE,$0A 

AnimationDelays_19_1A:
    db $04,$03,$02,$03,$02,$03,$02,$03,$02,$FE,$08,$08,$FF 

AnimationDelays_1B_1C:
    db $04,$01,$01,$01,$01,$01,$01,$01,$01,$FE,$08,$08,$FF 

AnimationDelays_81_82:
    db $04,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01 
    db $01,$01,$01,$01,$01,$01,$01,$01,$01,$FE,$18,$08,$FF 

AnimationDelays_25:
    db $02,$02,$02,$F8,$02 

AnimationDelays_26:
    db $02,$02,$02,$F8,$01 

AnimationDelays_2F:
    db $02,$02,$02,$F8,$52 

AnimationDelays_30:
    db $02,$02,$02,$F8,$51 

AnimationDelays_43:
    db $02,$02,$02,$F8,$28 

AnimationDelays_44:
    db $02,$02,$02,$F8,$27 

AnimationDelays_87:
    db $02,$02,$02,$F8,$2A 

AnimationDelays_88:
    db $02,$02,$02,$F8,$29 

AnimationDelays_8B:
    db $02,$02,$02,$F8,$04 

AnimationDelays_8C:
    db $02,$02,$02,$F8,$03 

AnimationDelays_8D:
    db $02,$02,$02,$F8,$08 

AnimationDelays_8E:
    db $02,$02,$02,$F8,$07 

AnimationDelays_8F:
    db $02,$02,$02,$F8,$16 

AnimationDelays_90:
    db $02,$02,$02,$F8,$15 

AnimationDelays_91:
    db $02,$02,$02,$F8,$18 

AnimationDelays_92:
    db $02,$02,$02,$F8,$17 

AnimationDelays_93:
    db $02,$02,$02,$F8,$2C 

AnimationDelays_94:
    db $02,$02,$02,$F8,$2B 

AnimationDelays_95:
    db $02,$02,$02,$F8,$2E 

AnimationDelays_96:
    db $02,$02,$02,$F8,$2D 

AnimationDelays_97:
    db $02,$02,$02,$F8,$86 

AnimationDelays_98:
    db $02,$02,$02,$F8,$85 

AnimationDelays_99:
    db $02,$02,$02,$F8,$74 

AnimationDelays_9A:
    db $02,$02,$02,$F8,$73 

AnimationDelays_9C:
    db $02,$02,$02,$F8,$06 

AnimationDelays_9D:
    db $02,$02,$02,$F8,$05 

AnimationDelays_9E:
    db $02,$02,$02,$F8,$6A 

AnimationDelays_9F:
    db $02,$02,$02,$F8,$69 

AnimationDelays_A0:
    db $02,$02,$02,$F8,$6E 

AnimationDelays_A1:
    db $02,$02,$02,$F8,$6D 

AnimationDelays_A2:
    db $02,$02,$02,$F8,$72 

AnimationDelays_A3:
    db $02,$02,$02,$F8,$71 

AnimationDelays_BF:
    db $02,$02,$02,$F8,$1A 

AnimationDelays_C0:
    db $02,$02,$02,$F8,$19 

AnimationDelays_C1:
    db $02,$02,$02,$F8,$1A 

AnimationDelays_C2:
    db $02,$02,$02,$F8,$19 

AnimationDelays_C3:
    db $02,$02,$02,$F8,$1A 

AnimationDelays_C4:
    db $02,$02,$02,$F8,$19 

UNUSED_AnimationDelays_C6_91B479:
    db $02,$02,$02,$FD,$BA 

UNUSED_AnimationDelays_63_91B47E:
    db $04,$03,$FE,$01 

UNUSED_AnimationDelays_64_91B482:
    db $04,$03,$FE,$01 

UNUSED_AnimationDelays_65_66_91B486:
    db $03,$02,$02,$02,$02,$02,$02,$02,$02,$FE,$08 

AnimationDelays_83_84:
    db $05,$05,$FB,$03,$02,$03,$02,$03,$02,$03,$02,$FE,$08,$02,$01,$02 
    db $01,$02,$01,$02,$01,$FE,$08,$01,$01,$01,$01,$01,$01,$01,$01,$01 
    db $01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$FE 
    db $18 

AnimationDelays_35:
    db $03,$FD,$27 

AnimationDelays_36:
    db $03,$FD,$28 

AnimationDelays_37:
    db $03,$03,$F9 
    dw $0002 
    db $1D,$31,$79,$7D 

AnimationDelays_38:
    db $03,$03,$F9 
    dw $0002 
    db $41,$32,$7A,$7E 

UNUSED_AnimationDelays_39_91B4DA:
    db $00,$FD,$20 

UNUSED_AnimationDelays_3A_91B4DD:
    db $00,$FD,$42 

AnimationDelays_3B:
    db $03,$FD,$01 

AnimationDelays_3C:
    db $03,$FD,$02 

AnimationDelays_3D:
    db $03,$03,$FD,$27 

AnimationDelays_3E:
    db $03,$03,$FD,$28 

UNUSED_AnimationDelays_3F_91B4EE:
    db $00,$FC 
    dw $0002 
    db $1D,$79 

UNUSED_AnimationDelays_40_91B4F4:
    db $00,$FC 
    dw $0002 
    db $41,$7A 

UNUSED_AnimationDelays_DB_91B4FA:
    db $03,$03,$03,$F9 
    dw $0002 
    db $1D,$31,$79,$7D 

UNUSED_AnimationDelays_DC_91B504:
    db $03,$03,$03,$F9 
    dw $0002 
    db $DF,$DF,$DF,$DF 

UNUSED_AnimationDelays_DD_91B50E:
    db $03,$03,$03,$FD,$01 

UNUSED_AnimationDelays_DE_91B513:
    db $03,$03,$03,$FD,$BA 

AnimationDelays_F1:
    db $03,$FD,$85 

AnimationDelays_F2:
    db $03,$FD,$86 

AnimationDelays_F3:
    db $03,$FD,$71 

AnimationDelays_F4:
    db $03,$FD,$72 

AnimationDelays_F5:
    db $03,$FD,$73 

AnimationDelays_F6:
    db $03,$FD,$74 

AnimationDelays_F7:
    db $03,$FD,$03 

AnimationDelays_F8:
    db $03,$FD,$04 

AnimationDelays_F9:
    db $03,$FD,$05 

AnimationDelays_FA:
    db $03,$FD,$06 

AnimationDelays_FB:
    db $03,$FD,$07 

AnimationDelays_FC:
    db $03,$FD,$08 

AnimationDelays_BE_F0:
    db $06,$06,$06,$06,$06,$06,$FF 

AnimationDelays_C9_CA_CB_CC_CD_CE:
    db $08,$FF 

AnimationDelays_D3:
    db $03,$03,$01,$01,$FE,$02,$0C,$0C,$0C,$0C,$FE,$04,$03,$03,$03,$FD 
    db $01 

AnimationDelays_D4:
    db $03,$03,$01,$01,$FE,$02,$0C,$0C,$0C,$0C,$FE,$04,$03,$03,$03,$FD 
    db $02 

AnimationDelays_D7_D8:
    db $02,$02,$02,$02,$02,$02,$FE,$01 

AnimationDelays_0_9B:
    db $08,$FF,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03 
    db $03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03 
    db $03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03 
    db $03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03 
    db $03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03 
    db $03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$33,$02,$02,$02,$30 
    db $FE,$01 

AnimationDelayTable_Running_NoSpeedBooster_pointer:
    dw AnimationDelayTable_Running_NoSpeedBooster 

AnimationDelayTable_Running_NoSpeedBooster:
    db $02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$FF 

AnimationDelayTable_Running_SpeedBooster_pointers:
    dw AnimationDelayTable_Running_SpeedBooster_0 
    dw AnimationDelayTable_Running_SpeedBooster_1 
    dw AnimationDelayTable_Running_SpeedBooster_2 
    dw AnimationDelayTable_Running_SpeedBooster_3 
    dw AnimationDelayTable_Running_SpeedBooster_4 

AnimationDelayTable_Running_SpeedBooster_0:
    db $03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$FF 

AnimationDelayTable_Running_SpeedBooster_1:
    db $02,$03,$02,$03,$02,$03,$02,$03,$02,$03,$FF 

AnimationDelayTable_Running_SpeedBooster_2:
    db $02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$FF 

AnimationDelayTable_Running_SpeedBooster_3:
    db $01,$02,$01,$02,$01,$02,$01,$02,$01,$02,$FF 

AnimationDelayTable_Running_SpeedBooster_4:
    db $01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$FF 

SpeedBoostTimerResetValues:
    dw $0001,$0001,$0001,$0001,$0002 

PoseDefinitions_00_XDirection:
    db $00 

PoseDefinitions_movementType:
    db $00 

PoseDefinitions_newPose:
    db $FF 

PoseDefinitions_directionShotsFired:
    db $FF 

PoseDefinitions_YOffset:
    db $08,$00 

PoseDefinitions_YRadius:
    db $18,$00 

PoseDefinitions_01:
    db $08,$00,$FF,$02,$06,$00,$15,$00 

PoseDefinitions_02:
    db $04,$00,$FF,$07,$06,$00,$15,$00 

PoseDefinitions_03:
    db $08,$00,$01,$00,$06,$00,$15,$00 

PoseDefinitions_04:
    db $04,$00,$02,$09,$06,$00,$15,$00 

PoseDefinitions_05:
    db $08,$00,$01,$01,$06,$00,$15,$00 

PoseDefinitions_06:
    db $04,$00,$02,$08,$06,$00,$15,$00 

PoseDefinitions_07:
    db $08,$00,$01,$03,$06,$00,$15,$00 

PoseDefinitions_08:
    db $04,$00,$02,$06,$06,$00,$15,$00 

PoseDefinitions_09:
    db $08,$01,$01,$02,$06,$00,$15,$00 

PoseDefinitions_0A:
    db $04,$01,$02,$07,$06,$00,$15,$00 

PoseDefinitions_0B:
    db $08,$01,$01,$02,$06,$00,$15,$00 

PoseDefinitions_0C:
    db $04,$01,$02,$07,$06,$00,$15,$00 

PoseDefinitions_0D:
    db $08,$01,$01,$00,$06,$00,$15,$00 

PoseDefinitions_0E:
    db $04,$01,$02,$09,$06,$00,$15,$00 

PoseDefinitions_0F:
    db $08,$01,$01,$01,$06,$00,$15,$00 

PoseDefinitions_10:
    db $04,$01,$02,$08,$06,$00,$15,$00 

PoseDefinitions_11:
    db $08,$01,$01,$03,$06,$00,$15,$00 

PoseDefinitions_12:
    db $04,$01,$02,$06,$06,$00,$15,$00 

PoseDefinitions_13:
    db $08,$02,$FF,$02,$08,$00,$13,$00 

PoseDefinitions_14:
    db $04,$02,$FF,$07,$08,$00,$13,$00 

PoseDefinitions_15:
    db $08,$02,$51,$00,$08,$00,$13,$00 

PoseDefinitions_16:
    db $04,$02,$52,$09,$08,$00,$13,$00 

PoseDefinitions_17:
    db $08,$02,$FF,$04,$06,$00,$0A,$00 

PoseDefinitions_18:
    db $04,$02,$FF,$05,$06,$00,$0A,$00 

PoseDefinitions_19:
    db $08,$03,$FF,$FF,$00,$00,$0C,$00 

PoseDefinitions_1A:
    db $04,$03,$FF,$FF,$00,$00,$0C,$00 

PoseDefinitions_1B:
    db $08,$03,$FF,$FF,$00,$00,$0C,$00 

PoseDefinitions_1C:
    db $04,$03,$FF,$FF,$00,$00,$0C,$00 

PoseDefinitions_1D:
    db $08,$04,$FF,$FF,$00,$00,$07,$00 

PoseDefinitions_1E:
    db $08,$04,$1D,$FF,$00,$00,$07,$00 

PoseDefinitions_1F:
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
    db $04,$0E,$FF,$FB,$06,$00,$15,$00 

PoseDefinitions_26:
    db $08,$0E,$FF,$FB,$06,$00,$15,$00 

PoseDefinitions_27:
    db $08,$05,$27,$02,$00,$00,$10,$00 

PoseDefinitions_28:
    db $04,$05,$28,$07,$00,$00,$10,$00 

PoseDefinitions_29:
    db $08,$06,$FF,$02,$08,$00,$13,$00 

PoseDefinitions_2A:
    db $04,$06,$FF,$07,$08,$00,$13,$00 

PoseDefinitions_2B:
    db $08,$06,$29,$00,$08,$00,$13,$00 

PoseDefinitions_2C:
    db $04,$06,$2A,$09,$08,$00,$13,$00 

PoseDefinitions_2D:
    db $08,$06,$FF,$04,$06,$00,$0A,$00 

PoseDefinitions_2E:
    db $04,$06,$FF,$05,$06,$00,$0A,$00 

PoseDefinitions_2F:
    db $04,$17,$FF,$FB,$08,$00,$13,$00 

PoseDefinitions_30:
    db $08,$17,$FF,$FB,$08,$00,$13,$00 

PoseDefinitions_31:
    db $08,$08,$FF,$FF,$00,$00,$07,$00 

PoseDefinitions_32:
    db $04,$08,$FF,$FF,$00,$00,$07,$00 

UNUSED_PoseDefinitions_33_91B7C1:
    db $08,$09,$FF,$FF,$00,$00,$07,$00 

UNUSED_PoseDefinitions_34_91B7C9:
    db $04,$09,$FF,$FF,$00,$00,$07,$00 

PoseDefinitions_35:
    db $08,$0F,$FF,$02,$00,$00,$10,$00 

PoseDefinitions_36:
    db $04,$0F,$FF,$07,$00,$00,$10,$00 

PoseDefinitions_37:
    db $08,$0F,$FF,$FF,$00,$00,$07,$00 

PoseDefinitions_38:
    db $04,$0F,$FF,$FF,$00,$00,$07,$00 

UNUSED_PoseDefinitions_39_91B7F1:
    db $08,$0F,$FF,$FF,$00,$00,$07,$00 

UNUSED_PoseDefinitions_3A_91B7F9:
    db $04,$0F,$FF,$FF,$00,$00,$07,$00 

PoseDefinitions_3B:
    db $08,$0F,$FF,$02,$06,$00,$15,$00 

PoseDefinitions_3C:
    db $04,$0F,$FF,$07,$06,$00,$15,$00 

PoseDefinitions_3D:
    db $08,$0F,$FF,$FF,$00,$00,$10,$00 

PoseDefinitions_3E:
    db $04,$0F,$FF,$FF,$00,$00,$10,$00 

UNUSED_PoseDefinitions_3F_91B821:
    db $08,$0F,$FF,$FF,$00,$00,$07,$00 

UNUSED_PoseDefinitions_40_91B829:
    db $04,$0F,$FF,$FF,$00,$00,$07,$00 

PoseDefinitions_41:
    db $04,$04,$FF,$FF,$00,$00,$07,$00 

UNUSED_PoseDefinitions_42_91B839:
    db $04,$07,$FF,$FF,$00,$00,$07,$00 

PoseDefinitions_43:
    db $04,$0E,$FF,$FB,$00,$00,$10,$00 

PoseDefinitions_44:
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
    db $08,$10,$02,$07,$06,$00,$15,$00 

PoseDefinitions_4A:
    db $04,$10,$01,$02,$06,$00,$15,$00 

PoseDefinitions_4B:
    db $08,$02,$FF,$02,$03,$00,$13,$00 

PoseDefinitions_4C:
    db $04,$02,$FF,$07,$03,$00,$13,$00 

PoseDefinitions_4D:
    db $08,$02,$FF,$02,$08,$00,$13,$00 

PoseDefinitions_4E:
    db $04,$02,$FF,$07,$08,$00,$13,$00 

PoseDefinitions_4F:
    db $08,$19,$4E,$FF,$08,$00,$13,$00 

PoseDefinitions_50:
    db $04,$19,$4D,$FF,$08,$00,$13,$00 

PoseDefinitions_51:
    db $08,$02,$FF,$02,$08,$00,$13,$00 

PoseDefinitions_52:
    db $04,$02,$FF,$07,$08,$00,$13,$00 

PoseDefinitions_53:
    db $08,$0A,$FF,$FF,$06,$00,$15,$00 

PoseDefinitions_54:
    db $04,$0A,$FF,$FF,$06,$00,$15,$00 

PoseDefinitions_55:
    db $08,$02,$FF,$00,$03,$00,$13,$00 

PoseDefinitions_56:
    db $04,$02,$FF,$09,$03,$00,$13,$00 

PoseDefinitions_57:
    db $08,$02,$FF,$01,$03,$00,$13,$00 

PoseDefinitions_58:
    db $04,$02,$FF,$08,$03,$00,$13,$00 

PoseDefinitions_59:
    db $08,$02,$FF,$03,$03,$00,$13,$00 

PoseDefinitions_5A:
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
    db $08,$06,$FF,$02,$08,$00,$13,$00 

PoseDefinitions_68:
    db $04,$06,$FF,$07,$08,$00,$13,$00 

PoseDefinitions_69:
    db $08,$02,$51,$01,$08,$00,$13,$00 

PoseDefinitions_6A:
    db $04,$02,$52,$08,$08,$00,$13,$00 

PoseDefinitions_6B:
    db $08,$02,$51,$03,$08,$00,$13,$00 

PoseDefinitions_6C:
    db $04,$02,$52,$06,$08,$00,$13,$00 

PoseDefinitions_6D:
    db $08,$06,$29,$01,$08,$00,$13,$00 

PoseDefinitions_6E:
    db $04,$06,$2A,$08,$08,$00,$13,$00 

PoseDefinitions_6F:
    db $08,$06,$29,$03,$08,$00,$13,$00 

PoseDefinitions_70:
    db $04,$06,$2A,$06,$08,$00,$13,$00 

PoseDefinitions_71:
    db $08,$05,$27,$01,$00,$00,$10,$00 

PoseDefinitions_72:
    db $04,$05,$28,$08,$00,$00,$10,$00 

PoseDefinitions_73:
    db $08,$05,$27,$03,$00,$00,$10,$00 

PoseDefinitions_74:
    db $04,$05,$28,$06,$00,$00,$10,$00 

PoseDefinitions_75:
    db $08,$10,$06,$08,$06,$00,$15,$00 

PoseDefinitions_76:
    db $04,$10,$05,$01,$06,$00,$15,$00 

PoseDefinitions_77:
    db $08,$10,$08,$06,$06,$00,$15,$00 

PoseDefinitions_78:
    db $04,$10,$07,$03,$06,$00,$15,$00 

PoseDefinitions_79:
    db $08,$11,$FF,$FF,$00,$00,$07,$00 

PoseDefinitions_7A:
    db $04,$11,$FF,$FF,$00,$00,$07,$00 

PoseDefinitions_7B:
    db $08,$11,$79,$FF,$00,$00,$07,$00 

PoseDefinitions_7C:
    db $04,$11,$7A,$FF,$00,$00,$07,$00 

PoseDefinitions_7D:
    db $08,$13,$FF,$FF,$00,$00,$07,$00 

PoseDefinitions_7E:
    db $04,$13,$FF,$FF,$00,$00,$07,$00 

PoseDefinitions_7F:
    db $08,$12,$FF,$FF,$00,$00,$07,$00 

PoseDefinitions_80:
    db $04,$12,$FF,$FF,$00,$00,$07,$00 

PoseDefinitions_81:
    db $08,$03,$FF,$FF,$00,$00,$0C,$00 

PoseDefinitions_82:
    db $04,$03,$FF,$FF,$00,$00,$0C,$00 

PoseDefinitions_83:
    db $08,$14,$19,$FF,$08,$00,$13,$00 

PoseDefinitions_84:
    db $04,$14,$1A,$FF,$08,$00,$13,$00 

PoseDefinitions_85:
    db $08,$05,$27,$00,$00,$00,$10,$00 

PoseDefinitions_86:
    db $04,$05,$28,$09,$00,$00,$10,$00 

PoseDefinitions_87:
    db $04,$18,$FF,$FB,$08,$00,$13,$00 

PoseDefinitions_88:
    db $08,$18,$FF,$FB,$08,$00,$13,$00 

PoseDefinitions_89:
    db $08,$15,$FF,$02,$06,$00,$15,$00 

PoseDefinitions_8A:
    db $04,$15,$FF,$07,$06,$00,$15,$00 

PoseDefinitions_8B:
    db $04,$0E,$FF,$FA,$06,$00,$15,$00 

PoseDefinitions_8C:
    db $08,$0E,$FF,$FA,$06,$00,$15,$00 

PoseDefinitions_8D:
    db $04,$0E,$FF,$FC,$06,$00,$15,$00 

PoseDefinitions_8E:
    db $08,$0E,$FF,$FC,$06,$00,$15,$00 

PoseDefinitions_8F:
    db $04,$17,$FF,$FA,$08,$00,$13,$00 

PoseDefinitions_90:
    db $08,$17,$FF,$FA,$08,$00,$13,$00 

PoseDefinitions_91:
    db $04,$17,$FF,$FC,$08,$00,$13,$00 

PoseDefinitions_92:
    db $08,$17,$FF,$FC,$08,$00,$13,$00 

PoseDefinitions_93:
    db $04,$18,$FF,$FA,$08,$00,$13,$00 

PoseDefinitions_94:
    db $08,$18,$FF,$FA,$08,$00,$13,$00 

PoseDefinitions_95:
    db $04,$18,$FF,$FC,$08,$00,$13,$00 

PoseDefinitions_96:
    db $08,$18,$FF,$FC,$08,$00,$13,$00 

PoseDefinitions_97:
    db $04,$17,$28,$FA,$00,$00,$10,$00 

PoseDefinitions_98:
    db $08,$17,$28,$FA,$00,$00,$10,$00 

PoseDefinitions_99:
    db $04,$17,$28,$FC,$00,$00,$10,$00 

PoseDefinitions_9A:
    db $08,$17,$28,$FC,$00,$00,$10,$00 

PoseDefinitions_9B:
    db $00,$00,$FF,$FF,$08,$00,$18,$00 

PoseDefinitions_9C:
    db $04,$0E,$FF,$FA,$06,$00,$15,$00 

PoseDefinitions_9D:
    db $08,$0E,$FF,$FA,$06,$00,$15,$00 

PoseDefinitions_9E:
    db $04,$17,$FF,$FA,$08,$00,$13,$00 

PoseDefinitions_9F:
    db $08,$17,$FF,$FA,$08,$00,$13,$00 

PoseDefinitions_A0:
    db $04,$18,$FF,$FA,$08,$00,$13,$00 

PoseDefinitions_A1:
    db $08,$18,$FF,$FA,$08,$00,$13,$00 

PoseDefinitions_A2:
    db $04,$17,$28,$FA,$00,$00,$10,$00 

PoseDefinitions_A3:
    db $08,$17,$28,$FA,$00,$00,$10,$00 

PoseDefinitions_A4:
    db $08,$00,$FF,$02,$03,$00,$15,$00 

PoseDefinitions_A5:
    db $04,$00,$FF,$07,$03,$00,$15,$00 

PoseDefinitions_A6:
    db $08,$00,$FF,$02,$03,$00,$15,$00 

PoseDefinitions_A7:
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
    db $08,$16,$B2,$FF,$10,$00,$11,$00 

PoseDefinitions_B3:
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
    db $08,$16,$FF,$03,$00,$00,$10,$00 

PoseDefinitions_B9:
    db $04,$16,$FF,$06,$00,$00,$10,$00 

PoseDefinitions_BA:
    db $04,$1A,$FF,$07,$06,$00,$15,$00 

PoseDefinitions_BB:
    db $04,$1A,$BA,$08,$06,$00,$15,$00 

PoseDefinitions_BC:
    db $04,$1A,$BA,$07,$06,$00,$15,$00 

PoseDefinitions_BD:
    db $04,$1A,$BA,$06,$06,$00,$15,$00 

PoseDefinitions_BE:
    db $04,$1A,$BA,$FF,$06,$00,$15,$00 

PoseDefinitions_BF:
    db $04,$0E,$FF,$FB,$06,$00,$15,$00 

PoseDefinitions_C0:
    db $08,$0E,$FF,$FB,$06,$00,$15,$00 

PoseDefinitions_C1:
    db $04,$0E,$FF,$FA,$08,$00,$15,$00 

PoseDefinitions_C2:
    db $08,$0E,$FF,$FA,$08,$00,$15,$00 

PoseDefinitions_C3:
    db $04,$0E,$FF,$FC,$08,$00,$15,$00 

PoseDefinitions_C4:
    db $08,$0E,$FF,$FC,$08,$00,$15,$00 

UNUSED_PoseDefinitions_C5_91BC51:
    db $04,$1A,$FF,$FF,$00,$00,$07,$00 

UNUSED_PoseDefinitions_C6_91BC59:
    db $04,$1A,$FF,$FB,$06,$00,$15,$00 

PoseDefinitions_C7:
    db $08,$1B,$FF,$FF,$08,$00,$13,$00 

PoseDefinitions_C8:
    db $04,$1B,$FF,$FF,$08,$00,$13,$00 

PoseDefinitions_C9:
    db $08,$1B,$FF,$02,$08,$00,$13,$00 

PoseDefinitions_CA:
    db $04,$1B,$FF,$07,$08,$00,$13,$00 

PoseDefinitions_CB:
    db $08,$1B,$FF,$00,$08,$00,$13,$00 

PoseDefinitions_CC:
    db $04,$1B,$FF,$09,$08,$00,$13,$00 

PoseDefinitions_CD:
    db $08,$1B,$FF,$01,$08,$00,$13,$00 

PoseDefinitions_CE:
    db $04,$1B,$FF,$08,$08,$00,$13,$00 

PoseDefinitions_CF:
    db $08,$15,$89,$01,$06,$00,$15,$00 

PoseDefinitions_D0:
    db $04,$15,$8A,$08,$06,$00,$15,$00 

PoseDefinitions_D1:
    db $08,$15,$89,$03,$06,$00,$15,$00 

PoseDefinitions_D2:
    db $04,$15,$8A,$06,$06,$00,$15,$00 

PoseDefinitions_D3:
    db $08,$1B,$FF,$FF,$06,$00,$15,$00 

PoseDefinitions_D4:
    db $04,$1B,$FF,$FF,$06,$00,$15,$00 

PoseDefinitions_D5:
    db $08,$00,$FF,$02,$06,$00,$15,$00 

PoseDefinitions_D6:
    db $04,$00,$FF,$07,$06,$00,$15,$00 

PoseDefinitions_D7:
    db $08,$0A,$FF,$02,$06,$00,$15,$00 

PoseDefinitions_D8:
    db $04,$0A,$FF,$07,$06,$00,$15,$00 

PoseDefinitions_D9:
    db $08,$05,$FF,$02,$00,$00,$10,$00 

PoseDefinitions_DA:
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
    db $08,$00,$FF,$00,$03,$00,$15,$00 

PoseDefinitions_E1:
    db $04,$00,$FF,$09,$03,$00,$15,$00 

PoseDefinitions_E2:
    db $08,$00,$FF,$01,$03,$00,$15,$00 

PoseDefinitions_E3:
    db $04,$00,$FF,$08,$03,$00,$15,$00 

PoseDefinitions_E4:
    db $08,$00,$FF,$03,$03,$00,$15,$00 

PoseDefinitions_E5:
    db $04,$00,$FF,$06,$03,$00,$15,$00 

PoseDefinitions_E6:
    db $08,$00,$FF,$02,$03,$00,$15,$00 

PoseDefinitions_E7:
    db $04,$00,$FF,$07,$03,$00,$15,$00 

PoseDefinitions_E8:
    db $08,$1B,$FF,$FF,$FC,$00,$15,$00 

PoseDefinitions_E9:
    db $04,$1B,$FF,$FF,$FC,$00,$15,$00 

PoseDefinitions_EA:
    db $08,$1B,$FF,$FF,$FC,$00,$15,$00 

PoseDefinitions_EB:
    db $04,$1B,$FF,$FF,$FC,$00,$15,$00 

PoseDefinitions_EC:
    db $08,$1A,$FF,$02,$06,$00,$15,$00 

PoseDefinitions_ED:
    db $08,$1A,$EC,$01,$06,$00,$15,$00 

PoseDefinitions_EE:
    db $08,$1A,$EC,$02,$06,$00,$15,$00 

PoseDefinitionse_EF:
    db $08,$1A,$EC,$03,$06,$00,$15,$00 

PoseDefinitions_F0:
    db $08,$1A,$EC,$FF,$06,$00,$15,$00 

PoseDefinitions_F1:
    db $08,$0F,$FF,$00,$08,$00,$10,$00 

PoseDefinitions_F2:
    db $04,$0F,$FF,$09,$08,$00,$10,$00 

PoseDefinitions_F3:
    db $08,$0F,$FF,$01,$08,$00,$10,$00 

PoseDefinitions_F4:
    db $04,$0F,$FF,$08,$08,$00,$10,$00 

PoseDefinitions_F5:
    db $08,$0F,$FF,$03,$08,$00,$10,$00 

PoseDefinitions_F6:
    db $04,$0F,$FF,$06,$08,$00,$10,$00 

PoseDefinitions_F7:
    db $08,$0F,$FF,$00,$03,$00,$15,$00 

PoseDefinitions_F8:
    db $04,$0F,$FF,$09,$03,$00,$15,$00 

PoseDefinitions_F9:
    db $08,$0F,$FF,$01,$03,$00,$15,$00 

PoseDefinitions_FA:
    db $04,$0F,$FF,$08,$03,$00,$15,$00 

PoseDefinitions_FB:
    db $08,$0F,$FF,$03,$03,$00,$15,$00 

PoseDefinitions_FC:
    db $04,$0F,$FF,$06,$03,$00,$15,$00 

Calc_Xray_HDMADataTable_OffScreen:
    PHP 
    PHB 
    PHK 
    PLB 
    REP #$30 
    TXA 
    XBA 
    AND.W #$FF00 
    STA.B $16 
    STY.B $18 
    LDA.B $12 
    SEC 
    SBC.B $14 
    STA.B $1A 
    BPL + 
    LDA.W #$0100 
    CLC 
    ADC.B $1A 
    STA.B $1A 

  + LDA.B $12 
    CLC 
    ADC.B $14 
    STA.B $1C 
    CMP.W #$0101 
    BMI + 
    SEC 
    SBC.W #$0100 
    STA.B $1C 

  + LDA.B $14 
    BNE + 
    LDA.B $12 
    CMP.W #$0040 
    BEQ .strictlyHorizontal 
    CMP.W #$00C0 
    BEQ .strictlyHorizontal 

  + LDA.B $1A 
    CMP.W #$0080 
    BPL + 
    CMP.W #$0040 
    BPL .bottomHalf 
    LDA.B $1C 
    CMP.W #$0040 
    BMI .topHalf 
    BRA .right 


  + CMP.W #$00C0 
    BPL .topHalf 
    LDA.B $1C 
    CMP.W #$00C0 
    BMI .bottomHalf 
    BRA .left 


.right:
    LDY.W #$0000 
    BRA .merge 


.topHalf:
    LDY.W #$0002 
    BRA .merge 


.bottomHalf:
    LDY.W #$0004 
    BRA .merge 


.left:
    LDY.W #$0006 
    BRA .merge 


.strictlyHorizontal:
    LDY.W #$0008 

.merge:
    LDA.B $1A 
    CMP.W #$0080 
    BMI + 
    SEC 
    SBC.W #$0080 

  + ASL A 
    TAX 
    LDA.W AbsoluteTangentTable,X 
    STA.B $1E 
    LDA.B $1C 
    CMP.W #$0080 
    BMI + 
    SEC 
    SBC.W #$0080 

  + ASL A 
    TAX 
    LDA.W AbsoluteTangentTable,X 
    STA.B $20 
    TYX 
    JSR.W (.pointers,X) 
    PLB 
    PLP 
    RTL 


.pointers:
    dw Calc_Xray_HDMADataTable_OffScreen_AimedRight 
    dw Calc_Xray_HDMADataTable_OffScreen_AimedUpwards 
    dw Calc_Xray_HDMADataTable_OffScreen_AimedDownwards 
    dw Calc_Xray_HDMADataTable_OffScreen_AimedLeft 
    dw Calc_Xray_HDMADataTable_OffScreen_HorizontalLine 

Calc_Xray_HDMADataTable_OffScreen_AimedRight:
    PHP 
    REP #$30 
    LDA.B $18 
    DEC A 
    ASL A 
    TAY 
    LDA.B $16 
    STA.B $22 
    STA.B $24 

.loopLeftOffScreen:
    LDA.B $22 
    CLC 
    ADC.B $1E 
    STA.B $22 
    BCS + 
    DEY #2
    BPL .loopLeftOffScreen 
    STZ.B $12 
    JMP.W .leftEdgeEnd 


  + LDA.B $23 
    ORA.W #$FF00 
    STA.B [$00],Y 
    INY #2
    STY.B $12 
    TYA 
    SEC 
    SBC.W #$0004 
    TAY 

.loopLeftOnScreen:
    LDA.B $22 
    CLC 
    ADC.B $1E 
    STA.B $22 
    BCS ..loop 
    LDA.B $23 
    ORA.W #$FF00 
    STA.B [$00],Y 
    DEY #2
    BPL .loopLeftOnScreen 
    BRA .leftEdgeEnd 


..loop:
    LDA.W #$00FF 
    STA.B [$00],Y 
    DEY #2
    BPL ..loop 

.leftEdgeEnd:
    LDA.B $18 
    ASL A 
    TAY 

.loopRightOffScreen:
    LDA.B $24 
    CLC 
    ADC.B $20 
    STA.B $24 
    BCS + 
    INY #2
    CPY.W #$01CC 
    BMI .loopRightOffScreen 
    STY.B $14 
    JMP.W .rightEdgeEnd 


  + LDA.B $25 
    ORA.W #$FF00 
    STA.B [$00],Y 
    DEY #2
    STY.B $14 
    TYA 
    CLC 
    ADC.W #$0004 
    TAY 

.loopRightOnScreen:
    LDA.B $24 
    CLC 
    ADC.B $20 
    STA.B $24 
    BCS ..loop 
    LDA.B $25 
    ORA.W #$FF00 
    STA.B [$00],Y 
    INY #2
    CPY.W #$01CC 
    BMI .loopRightOnScreen 
    BRA .rightEdgeEnd 


..loop:
    LDA.W #$00FF 
    STA.B [$00],Y 
    INY #2
    CPY.W #$01CC 
    BMI ..loop 

.rightEdgeEnd:
    LDY.B $12 

..loop:
    LDA.W #$FF00 
    STA.B [$00],Y 
    INY #2
    CPY.B $14 
    BMI ..loop 
    BEQ ..loop 
    PLP 
    RTS 


Calc_Xray_HDMADataTable_OffScreen_AimedLeft:
    PHP 
    REP #$30 
    LDA.B $18 
    DEC A 
    ASL A 
    TAY 
    LDA.B $16 
    STA.B $22 
    STA.B $24 

.loopRightOffScreen:
    LDA.B $24 
    SEC 
    SBC.B $20 
    STA.B $24 
    BCC + 
    DEY #2
    BPL .loopRightOffScreen 
    STZ.B $12 
    JMP.W .rightEdgeEnd 


  + LDA.B $24 
    AND.W #$FF00 
    STA.B [$00],Y 
    INY #2
    STY.B $12 
    TYA 
    SEC 
    SBC.W #$0004 
    TAY 

.loopRightOnScreen:
    LDA.B $24 
    SEC 
    SBC.B $20 
    STA.B $24 
    BCC ..loop 
    LDA.B $24 
    AND.W #$FF00 
    STA.B [$00],Y 
    DEY #2
    BPL .loopRightOnScreen 
    BRA .rightEdgeEnd 


..loop:
    LDA.W #$00FF 
    STA.B [$00],Y 
    DEY #2
    BPL ..loop 

.rightEdgeEnd:
    LDA.B $18 
    ASL A 
    TAY 

.loopLeftOffScreen:
    LDA.B $22 
    SEC 
    SBC.B $1E 
    STA.B $22 
    BCC + 
    INY #2
    CPY.W #$01CC 
    BMI .loopLeftOffScreen 
    STY.B $14 
    JMP.W .leftEdgeEnd 


  + LDA.B $22 
    AND.W #$FF00 
    STA.B [$00],Y 
    DEY #2
    STY.B $14 
    TYA 
    CLC 
    ADC.W #$0004 
    TAY 

.leftOnScreen:
    LDA.B $22 
    SEC 
    SBC.B $1E 
    STA.B $22 
    BCC ..loop 
    LDA.B $22 
    AND.W #$FF00 
    STA.B [$00],Y 
    INY #2
    CPY.W #$01CC 
    BMI .leftOnScreen 
    BRA .leftEdgeEnd 


..loop:
    LDA.W #$00FF 
    STA.B [$00],Y 
    INY #2
    CPY.W #$01CC 
    BMI ..loop 

.leftEdgeEnd:
    LDY.B $12 

.leftHighByteFF:
    LDA.W #$FF00 
    STA.B [$00],Y 
    INY #2
    CPY.B $14 
    BMI .leftHighByteFF 
    BEQ .leftHighByteFF 
    PLP 
    RTS 


Calc_Xray_HDMADataTable_OffScreen_AimedUpwards:
    PHP 
    REP #$30 
    LDA.B $18 
    DEC A 
    ASL A 
    TAY 
    LDA.B $16 
    STA.B $22 
    STA.B $24 
    LDA.B $1A 
    CMP.W #$00C0 
    BPL + 
    LDX.W #$0000 
    BRA .merge 


  + LDA.B $1C 
    CMP.W #$00C0 
    BPL + 
    LDX.W #$0002 
    BRA .merge 


  + LDX.W #$0004 

.merge:
    LDA.B $18 
    ASL A 
    STA.B $1A 
    JSR.W (.pointers,X) 
    LDY.B $12 

.loop:
    LDA.W #$00FF 
    STA.B [$00],Y 
    INY #2
    CPY.W #$01CC 
    BMI .loop 
    PLP 
    RTS 


.pointers:
    dw Calc_Xray_HDMADataTable_OffScreen_AimedUpwards_UpRight 
    dw Calc_Xray_HDMADataTable_OffScreen_AimedUpwards_Up 
    dw Calc_Xray_HDMADataTable_OffScreen_AimedUpwards_UpLeft 

Calc_Xray_HDMADataTable_OffScreen_AimedUpwards_UpRight:
    PHP 
    REP #$30 
    PHY 

.loopLeftOffScreen:
    LDA.B $22 
    CLC 
    ADC.B $1E 
    STA.B $22 
    BCS + 
    DEY #2
    BPL .loopLeftOffScreen 
    STZ.B $12 
    BRA .leftEdgeEnd 


  + SEP #$20 
    LDA.B $23 
    STA.B [$00],Y 
    REP #$20 
    DEY #2
    BPL + 
    LDA.W #$0002 
    STA.B $12 
    BRA .leftEdgeEnd 


  + TYA 
    CLC 
    ADC.W #$0004 
    STA.B $12 

.loopLeftOnScreen:
    LDA.B $22 
    CLC 
    ADC.B $1E 
    STA.B $22 
    BCS .left8Bit 
    SEP #$20 
    LDA.B $23 
    STA.B [$00],Y 
    REP #$20 
    DEY #2
    BPL .loopLeftOnScreen 
    BRA .leftEdgeEnd 


.left8Bit:
    SEP #$20 

.loopLeft:
    LDA.B #$FF 
    STA.B [$00],Y 
    DEY #2
    BPL .loopLeft 

.leftEdgeEnd:
    REP #$20 
    PLY 
    INY 

.loopRightOffScreen:
    LDA.B $24 
    CLC 
    ADC.B $20 
    STA.B $24 
    BCS + 
    DEY #2
    BPL .loopRightOffScreen 
    LDA.W #$0001 
    STA.B $14 
    BRA .rightEdgeEnd 


  + SEP #$20 
    LDA.B $25 
    STA.B [$00],Y 
    REP #$20 
    DEY #2
    BPL + 
    LDA.W #$0003 
    STA.B $14 
    BRA .rightEdgeEnd 


  + TYA 
    CLC 
    ADC.W #$0004 
    STA.B $14 

.loopRightOnScreen:
    LDA.B $24 
    CLC 
    ADC.B $20 
    STA.B $24 
    BCS .right8Bit 
    SEP #$20 
    LDA.B $25 
    STA.B [$00],Y 
    REP #$20 
    DEY #2
    BPL .loopRightOnScreen 
    BRA .rightEdgeEnd 


.right8Bit:
    SEP #$20 

.loopFF:
    LDA.B #$FF 
    STA.B [$00],Y 
    DEY #2
    BPL .loopFF 

.rightEdgeEnd:
    SEP #$20 
    LDY.B $12 

.loop00:
    LDA.B #$00 
    STA.B [$00],Y 
    INY #2
    CPY.B $14 
    BMI .loop00 
    REP #$20 
    LDA.B $14 
    DEC A 
    STA.B $12 
    PLP 
    RTS 


Calc_Xray_HDMADataTable_OffScreen_AimedUpwards_Up:
    PHP 
    REP #$30 
    PHY 

.loopLeftOffScreen:
    LDA.B $22 
    SEC 
    SBC.B $1E 
    STA.B $22 
    BCC + 
    DEY #2
    BPL .loopLeftOffScreen 
    STZ.B $12 
    BRA .leftEdgeEnd 


  + SEP #$20 
    LDA.B $23 
    STA.B [$00],Y 
    REP #$20 
    DEY #2
    BPL + 
    LDA.W #$0002 
    STA.B $12 
    BRA .leftEdgeEnd 


  + TYA 
    CLC 
    ADC.W #$0004 
    STA.B $12 

.loopLeftOnScreen:
    LDA.B $22 
    SEC 
    SBC.B $1E 
    STA.B $22 
    BCC + 
    SEP #$20 
    LDA.B $23 
    STA.B [$00],Y 
    REP #$20 
    DEY #2
    BPL .loopLeftOnScreen 
    BRA .leftEdgeEnd 


  + SEP #$20 

.loopLeft:
    LDA.B #$00 
    STA.B [$00],Y 
    DEY #2
    BPL .loopLeft 

.leftEdgeEnd:
    REP #$20 
    PLY 
    INY 

.loopRightOffScreen:
    LDA.B $24 
    CLC 
    ADC.B $20 
    STA.B $24 
    BCS + 
    DEY #2
    BPL .loopRightOffScreen 
    LDA.W #$0001 
    STA.B $14 
    BRA .return 


  + SEP #$20 
    LDA.B $25 
    STA.B [$00],Y 
    REP #$20 
    DEY #2
    BPL + 
    LDA.W #$0003 
    STA.B $14 
    BRA .return 


  + TYA 
    CLC 
    ADC.W #$0004 
    STA.B $14 

.loopRightOnScreen:
    LDA.B $24 
    CLC 
    ADC.B $20 
    STA.B $24 
    BCS + 
    SEP #$20 
    LDA.B $25 
    STA.B [$00],Y 
    REP #$20 
    DEY #2
    BPL .loopRightOnScreen 
    BRA .return 


  + SEP #$20 

.loopRight:
    LDA.B #$FF 
    STA.B [$00],Y 
    DEY #2
    BPL .loopRight 

.return:
    REP #$20 
    PLP 
    RTS 


Calc_Xray_HDMADataTable_OffScreen_AimedUpwards_UpLeft:
    PHP 
    REP #$30 
    PHY 

.loopLeftOffScreen:
    LDA.B $22 
    SEC 
    SBC.B $1E 
    STA.B $22 
    BCC + 
    DEY #2
    BPL .loopLeftOffScreen 
    STZ.B $12 
    BRA .leftEdgeEnd 


  + SEP #$20 
    LDA.B $23 
    STA.B [$00],Y 
    REP #$20 
    DEY #2
    BPL + 
    LDA.W #$0002 
    STA.B $12 
    BRA .leftEdgeEnd 


  + TYA 
    CLC 
    ADC.W #$0004 
    STA.B $12 

.loopLeftOnScreen:
    LDA.B $22 
    SEC 
    SBC.B $1E 
    STA.B $22 
    BCC + 
    SEP #$20 
    LDA.B $23 
    STA.B [$00],Y 
    REP #$20 
    DEY #2
    BPL .loopLeftOnScreen 
    BRA .leftEdgeEnd 


  + SEP #$20 

.loopLeft:
    LDA.B #$00 
    STA.B [$00],Y 
    DEY #2
    BPL .loopLeft 

.leftEdgeEnd:
    REP #$20 
    PLY 
    INY 

.loopRightOffScreen:
    LDA.B $24 
    SEC 
    SBC.B $20 
    STA.B $24 
    BCC + 
    DEY #2
    BPL .loopRightOffScreen 
    LDA.W #$0001 
    STA.B $14 
    BRA .rightEdgeEnd 


  + SEP #$20 
    LDA.B $23 
    STA.B [$00],Y 
    REP #$20 
    DEY #2
    BPL + 
    LDA.W #$0003 
    STA.B $14 
    BRA .rightEdgeEnd 


  + TYA 
    CLC 
    ADC.W #$0004 
    STA.B $14 

.loopRightOnScreen:
    LDA.B $24 
    SEC 
    SBC.B $20 
    STA.B $24 
    BCC + 
    SEP #$20 
    LDA.B $25 
    STA.B [$00],Y 
    REP #$20 
    DEY #2
    BPL .loopRightOnScreen 
    BRA .rightEdgeEnd 


  + SEP #$20 

.loopRight:
    LDA.B #$00 
    STA.B [$00],Y 
    DEY #2
    BPL .loopRight 

.rightEdgeEnd:
    SEP #$20 
    LDY.B $14 

.endLoop:
    LDA.B #$FF 
    STA.B [$00],Y 
    INY #2
    CPY.B $12 
    BMI .endLoop 
    REP #$20 
    PLP 
    RTS 


Calc_Xray_HDMADataTable_OffScreen_AimedDownwards:
    PHP 
    REP #$30 
    LDA.B $18 
    ASL A 
    TAY 
    LDA.B $16 
    STA.B $22 
    STA.B $24 
    LDA.B $1C 
    CMP.W #$0080 
    BPL + 
    LDX.W #$0000 
    BRA .merge 


  + LDA.B $1A 
    CMP.W #$0080 
    BPL .index4 
    LDX.W #$0002 
    BRA .merge 


.index4:
    LDX.W #$0004 

.merge:
    JSR.W (.pointers,X) 
    LDY.B $12 
    LDA.W #$00FF 

.loop:
    STA.B [$00],Y 
    DEY #2
    BPL .loop 
    PLP 
    RTS 


.pointers:
    dw Calc_Xray_HDMADataTable_OffScreen_AimedDownwards_DownRight 
    dw Calc_Xray_HDMADataTable_OffScreen_AimedDownwards_Down 
    dw Calc_Xray_HDMADataTable_OffScreen_AimedDownwards_DownLeft 

Calc_Xray_HDMADataTable_OffScreen_AimedDownwards_DownRight:
    PHP 
    REP #$30 
    PHY 

.loopRightOffScreen:
    LDA.B $24 
    CLC 
    ADC.B $20 
    STA.B $24 
    BCS + 
    INY #2
    CPY.W #$01CC 
    BMI .loopRightOffScreen 
    STY.B $12 
    BRA .rightEdgeEnd 


  + LDA.B $25 
    STA.B [$00],Y 
    INY #2
    CPY.W #$01CC 
    BMI + 
    LDA.W #$01CA 
    STA.B $12 
    BRA .rightEdgeEnd 


  + TYA 
    SEC 
    SBC.W #$0004 
    STA.B $12 

.loopRightOnScreen:
    LDA.B $24 
    CLC 
    ADC.B $20 
    STA.B $24 
    BCS .loopRight 
    LDA.B $25 
    STA.B [$00],Y 
    INY #2
    CPY.W #$01CC 
    BMI .loopRightOnScreen 
    BRA .rightEdgeEnd 


.loopRight:
    LDA.W #$00FF 
    STA.B [$00],Y 
    INY #2
    CPY.W #$01CC 
    BMI .loopRight 

.rightEdgeEnd:
    PLY 
    INY 

.loopLeftOffScreen:
    LDA.B $22 
    CLC 
    ADC.B $1E 
    STA.B $22 
    BCS + 
    INY #2
    CPY.W #$01CC 
    BMI .loopLeftOffScreen 
    STY.B $14 
    BRA .leftEdgeEnd 


  + SEP #$20 
    LDA.B $23 
    STA.B [$00],Y 
    REP #$20 
    INY #2
    CPY.W #$01CC 
    BMI + 
    LDA.W #$01CB 
    STA.B $14 
    BRA .leftEdgeEnd 


  + TYA 
    SEC 
    SBC.W #$0004 
    STA.B $14 

.loopLeftOnScreen:
    LDA.B $22 
    CLC 
    ADC.B $1E 
    STA.B $22 
    BCS + 
    SEP #$20 
    LDA.B $23 
    STA.B [$00],Y 
    REP #$20 
    INY #2
    CPY.W #$01CC 
    BMI .loopLeftOnScreen 
    BRA .leftEdgeEnd 


  + SEP #$20 

.loopLeft:
    LDA.B #$FF 
    STA.B [$00],Y 
    INY #2
    CPY.W #$01CC 
    BMI .loopLeft 

.leftEdgeEnd:
    SEP #$20 
    LDY.B $12 

.loopEnd:
    LDA.B #$00 
    STA.B [$00],Y 
    DEY #2
    CPY.B $14 
    BPL .loopEnd 
    REP #$20 
    LDA.B $14 
    DEC A 
    STA.B $12 
    PLP 
    RTS 


Calc_Xray_HDMADataTable_OffScreen_AimedDownwards_Down:
    PHP 
    REP #$30 
    PHY 
    LDA.B $20 
    BNE .loopRightOffScreen 
    STY.B $12 
    LDA.W #$0000 

.loopClear:
    STA.B [$00],Y 
    INY #2
    CPY.W #$01CC 
    BMI .loopClear 
    BRA .rightEdgeEnd 


.loopRightOffScreen:
    LDA.B $24 
    SEC 
    SBC.B $20 
    STA.B $24 
    BCC + 
    INY #2
    CPY.W #$01CC 
    BMI .loopRightOffScreen 
    STY.B $12 
    BRA .rightEdgeEnd 


  + LDA.B $25 
    STA.B [$00],Y 
    INY #2
    CPY.W #$01CC 
    BMI + 
    LDA.W #$01CA 
    STA.B $12 
    BRA .rightEdgeEnd 


  + TYA 
    SEC 
    SBC.W #$0004 
    STA.B $12 

.loopRightOnScreen:
    LDA.B $24 
    SEC 
    SBC.B $20 
    STA.B $24 
    BCC ..loop 
    LDA.B $25 
    STA.B [$00],Y 
    INY #2
    CPY.W #$01CC 
    BMI .loopRightOnScreen 
    BRA .rightEdgeEnd 


..loop:
    LDA.W #$0000 
    STA.B [$00],Y 
    INY #2
    CPY.W #$01CC 
    BMI ..loop 

.rightEdgeEnd:
    PLY 
    INY 

.loopLeftOffScreen:
    LDA.B $22 
    CLC 
    ADC.B $1E 
    STA.B $22 
    BCS + 
    INY #2
    CPY.W #$01CC 
    BMI .loopLeftOffScreen 
    STY.B $14 
    BRA .return 


  + SEP #$20 
    LDA.B $23 
    STA.B [$00],Y 
    REP #$20 
    INY #2
    CPY.W #$01CC 
    BMI + 
    LDA.W #$01CB 
    STA.B $14 
    BRA .return 


  + TYA 
    SEC 
    SBC.W #$0004 
    STA.B $14 

.loopLeftOnScreen:
    LDA.B $22 
    CLC 
    ADC.B $1E 
    STA.B $22 
    BCS + 
    SEP #$20 
    LDA.B $23 
    STA.B [$00],Y 
    REP #$20 
    INY #2
    CPY.W #$01CC 
    BMI .loopLeftOnScreen 
    BRA .return 


  + SEP #$20 
    LDA.B #$FF 

..loop:
    STA.B [$00],Y 
    INY #2
    CPY.W #$01CC 
    BMI ..loop 
    REP #$20 

.return:
    PLP 
    RTS 


Calc_Xray_HDMADataTable_OffScreen_AimedDownwards_DownLeft:
    PHP 
    REP #$30 
    PHY 

.loopRightOffScreen:
    LDA.B $24 
    SEC 
    SBC.B $20 
    STA.B $24 
    BCC + 
    INY #2
    CPY.W #$01CC 
    BMI .loopRightOffScreen 
    STY.B $12 
    BRA .rightEdgeEnd 


  + LDA.B $25 
    STA.B [$00],Y 
    INY #2
    CPY.W #$01CC 
    BMI + 
    LDA.W #$01CA 
    STA.B $12 
    BRA .rightEdgeEnd 


  + TYA 
    SEC 
    SBC.W #$0004 
    STA.B $12 

.loopRightOnScreen:
    LDA.B $24 
    SEC 
    SBC.B $20 
    STA.B $24 
    BCC .loopRight 
    LDA.B $25 
    STA.B [$00],Y 
    INY #2
    CPY.W #$01CC 
    BMI .loopRightOnScreen 
    BRA .rightEdgeEnd 


.loopRight:
    LDA.W #$0000 
    STA.B [$00],Y 
    INY #2
    CPY.W #$01CC 
    BMI .loopRight 

.rightEdgeEnd:
    PLY 
    INY 

.loopLeftOffScreen:
    LDA.B $22 
    SEC 
    SBC.B $1E 
    STA.B $22 
    BCC + 
    INY #2
    CPY.W #$01CC 
    BMI .loopLeftOffScreen 
    STY.B $14 
    BRA .leftEdgeEnd 


  + SEP #$20 
    LDA.B $23 
    STA.B [$00],Y 
    REP #$20 
    INY #2
    CPY.W #$01CC 
    BMI + 
    LDA.W #$01CB 
    STA.B $14 
    BRA .leftEdgeEnd 


  + TYA 
    SEC 
    SBC.W #$0004 
    STA.B $14 

.loopLeftOnScreen:
    LDA.B $22 
    SEC 
    SBC.B $1E 
    STA.B $22 
    BCC + 
    SEP #$20 
    LDA.B $23 
    STA.B [$00],Y 
    REP #$20 
    INY #2
    CPY.W #$01CC 
    BMI .loopLeftOnScreen 
    BRA .leftEdgeEnd 


  + SEP #$20 

.loopLeft:
    LDA.B #$00 
    STA.B [$00],Y 
    INY #2
    CPY.W #$01CC 
    BMI .loopLeft 

.leftEdgeEnd:
    SEP #$20 
    LDY.B $14 

.loopEnd:
    LDA.B #$FF 
    STA.B [$00],Y 
    DEY #2
    CPY.B $12 
    BPL .loopEnd 
    REP #$20 
    PLP 
    RTS 


Calc_Xray_HDMADataTable_OffScreen_HorizontalLine:
    PHP 
    REP #$30 
    LDA.B $18 
    DEC A 
    ASL A 
    TAY 
    LDA.B $12 
    CMP.W #$0040 
    BNE + 
    LDA.W #$FF00 
    STA.B [$00],Y 
    BRA .next 


  + LDA.W #$FF00 
    STA.B [$00],Y 

.next:
    DEY #2
    .loopTop:
    LDA.B [$00],Y 
    CMP.W #$00FF 
    BEQ .loopBottom 
    LDA.W #$00FF 
    STA.B [$00],Y 
    DEY #2
    BPL .loopTop 

.loopBottom:
    LDA.B $18 
    ASL A 
    TAY 

.loop:
    LDA.B [$00],Y 
    CMP.W #$00FF 
    BEQ .return 
    LDA.W #$00FF 
    STA.B [$00],Y 
    INY #2
    CPY.W #$01CC 
    BMI .loop 

.return:
    PLP 
    RTS 


Calc_Xray_HDMADataTable_OnScreen:
    PHP 
    PHB 
    PHK 
    PLB 
    REP #$30 
    TXA 
    XBA 
    AND.W #$FF00 
    STA.B $16 
    STY.B $18 
    LDA.B $12 
    SEC 
    SBC.B $14 
    STA.B $1A 
    BPL + 
    LDA.W #$0100 
    CLC 
    ADC.B $1A 
    STA.B $1A 

  + LDA.B $12 
    CLC 
    ADC.B $14 
    STA.B $1C 
    CMP.W #$0101 
    BMI + 
    SEC 
    SBC.W #$0100 
    STA.B $1C 

  + LDA.B $14 
    BNE + 
    LDA.B $12 
    CMP.W #$0040 
    BEQ .strictlyHorizontal 
    CMP.W #$00C0 
    BEQ .strictlyHorizontal 

  + LDA.B $1A 
    CMP.W #$0080 
    BPL + 
    CMP.W #$0040 
    BPL .bottomHalf 
    LDA.B $1C 
    CMP.W #$0040 
    BMI .topHalf 
    BRA .right 


  + CMP.W #$00C0 
    BPL .topHalf 
    LDA.B $1C 
    CMP.W #$00C0 
    BMI .bottomHalf 
    BRA .left 


.right:
    LDY.W #$0000 
    BRA .merge 


.topHalf:
    LDY.W #$0002 
    BRA .merge 


.bottomHalf:
    LDY.W #$0004 
    BRA .merge 


.left:
    LDY.W #$0006 
    BRA .merge 


.strictlyHorizontal:
    LDY.W #$0008 

.merge:
    LDA.B $1A 
    CMP.W #$0080 
    BMI + 
    SEC 
    SBC.W #$0080 

  + ASL A 
    TAX 
    LDA.W AbsoluteTangentTable,X 
    STA.B $1E 
    LDA.B $1C 
    CMP.W #$0080 
    BMI + 
    SEC 
    SBC.W #$0080 

  + ASL A 
    TAX 
    LDA.W AbsoluteTangentTable,X 
    STA.B $20 
    TYX 
    STZ.W $0D1E 
    JSR.W (.pointers,X) 
    PLB 
    PLP 
    RTL 


.pointers:
    dw Calc_Xray_HDMADataTable_OnScreen_AimedRight 
    dw Calc_Xray_HDMADataTable_OnScreen_AimedUpwards 
    dw Calc_Xray_HDMADataTable_OnScreen_AimedDownwards 
    dw Calc_Xray_HDMADataTable_OnScreen_AimedLeft 
    dw Calc_Xray_HDMADataTable_OnScreen_HorizontalLine 

Calc_Xray_HDMADataTable_OnScreen_AimedRight:
    PHP 
    REP #$30 
    LDA.B $18 
    DEC A 
    ASL A 
    TAY 
    LDA.B $17 
    ORA.W #$FF00 
    STA.B [$00],Y 
    DEY #2
    LDA.B $16 
    STA.B $22 
    STA.B $24 

.loopLeftOnScreen:
    LDA.B $22 
    CLC 
    ADC.B $1E 
    STA.B $22 
    BCS .loopLeft 
    LDA.B $23 
    ORA.W #$FF00 
    STA.B [$00],Y 
    DEY #2
    BPL .loopLeftOnScreen 
    BRA .leftEdgeEnd 


.loopLeft:
    LDA.W #$00FF 
    STA.B [$00],Y 
    DEY #2
    BPL .loopLeft 

.leftEdgeEnd:
    LDA.B $18 
    ASL A 
    TAY 

.loopRightOnScreen:
    LDA.B $24 
    CLC 
    ADC.B $20 
    STA.B $24 
    BCS .loopRight 
    LDA.B $25 
    ORA.W #$FF00 
    STA.B [$00],Y 
    INY #2
    CPY.W #$01CC 
    BMI .loopRightOnScreen 
    BRA .return 


.loopRight:
    LDA.W #$00FF 
    STA.B [$00],Y 
    INY #2
    CPY.W #$01CC 
    BMI .loopRight 

.return:
    PLP 
    RTS 


Calc_Xray_HDMADataTable_OnScreen_AimedLeft:
    PHP 
    REP #$30 
    LDA.B $18 
    DEC A 
    ASL A 
    TAY 
    LDA.B $16 
    AND.W #$FF00 
    STA.B [$00],Y 
    DEY #2
    LDA.B $16 
    STA.B $22 
    STA.B $24 

.loopRightOnScreen:
    LDA.B $24 
    SEC 
    SBC.B $20 
    STA.B $24 
    BCC .loopRight 
    LDA.B $24 
    AND.W #$FF00 
    STA.B [$00],Y 
    DEY #2
    BPL .loopRightOnScreen 
    BRA .rightEdgeEnd 


.loopRight:
    LDA.W #$00FF 
    STA.B [$00],Y 
    DEY #2
    BPL .loopRight 

.rightEdgeEnd:
    LDA.B $18 
    ASL A 
    TAY 

.loopLeftOnScreen:
    LDA.B $22 
    SEC 
    SBC.B $1E 
    STA.B $22 
    BCC .loopLeft 
    LDA.B $22 
    AND.W #$FF00 
    STA.B [$00],Y 
    INY #2
    CPY.W #$01CC 
    BMI .loopLeftOnScreen 
    BRA .return 


.loopLeft:
    LDA.W #$00FF 
    STA.B [$00],Y 
    INY #2
    CPY.W #$01CC 
    BMI .loopLeft 

.return:
    PLP 
    RTS 


Calc_Xray_HDMADataTable_OnScreen_AimedUpwards:
    PHP 
    REP #$30 
    LDA.B $18 
    DEC A 
    ASL A 
    TAY 
    SEP #$20 
    LDA.B $17 
    STA.B [$00],Y 
    INY 
    LDA.B $17 
    STA.B [$00],Y 
    REP #$20 
    DEY #3
    LDA.B $16 
    STA.B $22 
    STA.B $24 
    LDA.B $1A 
    CMP.W #$00C0 
    BPL + 
    LDX.W #$0000 
    BRA .merge 


  + LDA.B $1C 
    CMP.W #$00C0 
    BPL + 
    LDX.W #$0002 
    BRA .merge 


  + LDX.W #$0004 

.merge:
    JSR.W (.pointers,X) 
    LDA.B $18 
    ASL A 
    TAY 

.loop:
    LDA.B [$00],Y 
    CMP.W #$00FF 
    BEQ .return 
    LDA.W #$00FF 
    STA.B [$00],Y 
    INY #2
    CPY.W #$01CC 
    BMI .loop 

.return:
    PLP 
    RTS 


.pointers:
    dw Calc_Xray_HDMADataTable_OnScreen_AimedUpwards_UpRight 
    dw Calc_Xray_HDMADataTable_OnScreen_AimedUpwards_Up 
    dw Calc_Xray_HDMADataTable_OnScreen_AimedUpwards_UpLeft 

Calc_Xray_HDMADataTable_OnScreen_AimedUpwards_UpRight:
    PHP 
    REP #$30 
    PHY 

.loopLeftOnScreen:
    LDA.B $22 
    CLC 
    ADC.B $1E 
    STA.B $22 
    BCS + 
    SEP #$20 
    LDA.B $23 
    STA.B [$00],Y 
    REP #$20 
    DEY #2
    BPL .loopLeftOnScreen 
    BRA .leftEdgeEnd 


  + STY.W $0D1E 
    SEP #$20 
    LDA.B #$FF 

.loopLeft:
    STA.B [$00],Y 
    DEY #2
    BPL .loopLeft 
    REP #$20 

.leftEdgeEnd:
    PLY 
    INY 

.loopRightOnScreen:
    LDA.B $24 
    CLC 
    ADC.B $20 
    STA.B $24 
    BCS + 
    SEP #$20 
    LDA.B $25 
    STA.B [$00],Y 
    REP #$20 
    DEY #2
    BPL .loopRightOnScreen 
    BRA .return 


  + SEP #$20 

.loopRight:
    LDA.B #$FF 
    STA.B [$00],Y 
    DEY #2
    BPL .loopRight 
    REP #$20 
    LDY.W $0D1E 
    BEQ .return 
    DEY #2
    BMI .return 
    LDA.W #$00FF 

.loopEnd:
    STA.B [$00],Y 
    DEY #2
    BPL .loopEnd 

.return:
    PLP 
    RTS 


Calc_Xray_HDMADataTable_OnScreen_AimedUpwards_Up:
    PHP 
    REP #$30 
    PHY 

.loopLeftOnScreen:
    LDA.B $22 
    SEC 
    SBC.B $1E 
    STA.B $22 
    BCC + 
    SEP #$20 
    LDA.B $23 
    STA.B [$00],Y 
    REP #$20 
    DEY #2
    BPL .loopLeftOnScreen 
    BRA .leftEdgeEnd 


  + SEP #$20 

.loopLeft:
    LDA.B #$00 
    STA.B [$00],Y 
    DEY #2
    BPL .loopLeft 
    REP #$20 

.leftEdgeEnd:
    PLY 
    INY 

.loopRightOnScreen:
    LDA.B $24 
    CLC 
    ADC.B $20 
    STA.B $24 
    BCS + 
    SEP #$20 
    LDA.B $25 
    STA.B [$00],Y 
    REP #$20 
    DEY #2
    BPL .loopRightOnScreen 
    BRA .return 


  + SEP #$20 

.loopRIght:
    LDA.B #$FF 
    STA.B [$00],Y 
    DEY #2
    BPL .loopRIght 

.return:
    PLP 
    RTS 


Calc_Xray_HDMADataTable_OnScreen_AimedUpwards_UpLeft:
    PHP 
    REP #$30 
    PHY 

.loopLeftOnScreen:
    LDA.B $22 
    SEC 
    SBC.B $1E 
    STA.B $22 
    BCC + 
    SEP #$20 
    LDA.B $23 
    STA.B [$00],Y 
    REP #$20 
    DEY #2
    BPL .loopLeftOnScreen 
    BRA .leftEdgeEnd 


  + SEP #$20 
    LDA.B #$00 

.loopLeft:
    STA.B [$00],Y 
    DEY #2
    BPL .loopLeft 
    REP #$20 

.leftEdgeEnd:
    PLY 
    INY 

.loopRightOnScreen:
    LDA.B $24 
    SEC 
    SBC.B $20 
    STA.B $24 
    BCC + 
    SEP #$20 
    LDA.B $25 
    STA.B [$00],Y 
    REP #$20 
    DEY #2
    BPL .loopRightOnScreen 
    BRA .return 


  + SEP #$20 
    PHY 
    LDA.B #$00 

.loopRight:
    STA.B [$00],Y 
    DEY #2
    BPL .loopRight 
    PLY 
    DEY 
    LDA.B #$FF 

.loopEnd:
    STA.B [$00],Y 
    DEY #2
    BPL .loopEnd 

.return:
    PLP 
    RTS 


Calc_Xray_HDMADataTable_OnScreen_AimedDownwards:
    PHP 
    REP #$30 
    LDA.B $18 
    DEC A 
    ASL A 
    TAY 
    SEP #$20 
    LDA.B $17 
    STA.B [$00],Y 
    INY 
    LDA.B $17 
    STA.B [$00],Y 
    REP #$20 
    INY 
    LDA.B $16 
    STA.B $22 
    STA.B $24 
    LDA.B $1C 
    CMP.W #$0080 
    BPL + 
    LDX.W #$0000 
    BRA .merge 


  + LDA.B $1A 
    CMP.W #$0080 
    BPL + 
    LDX.W #$0002 
    BRA .merge 


  + LDX.W #$0004 

.merge:
    JSR.W (.pointers,X) 
    LDA.B $18 
    DEC #2
    ASL A 
    TAY 

.loop:
    LDA.B [$00],Y 
    CMP.W #$00FF 
    BEQ .return 
    LDA.W #$00FF 
    STA.B [$00],Y 
    DEY #2
    BPL .loop 

.return:
    PLP 
    RTS 


.pointers:
    dw Calc_Xray_HDMADataTable_OnScreen_AimedDownwards_DownRight 
    dw Calc_Xray_HDMADataTable_OnScreen_AimedDownwards_Down 
    dw Calc_Xray_HDMADataTable_OnScreen_AimedDownwards_DownLeft 

Calc_Xray_HDMADataTable_OnScreen_AimedDownwards_DownRight:
    PHP 
    REP #$30 
    PHY 

.loopRightOnScreen:
    LDA.B $24 
    CLC 
    ADC.B $20 
    STA.B $24 
    BCS + 
    LDA.B $25 
    STA.B [$00],Y 
    INY #2
    CPY.W #$01CC 
    BMI .loopRightOnScreen 
    BRA .rightEdgeEnd 


  + STY.W $0D1E 
    LDA.W #$00FF 

.loopRight:
    STA.B [$00],Y 
    INY #2
    CPY.W #$01CC 
    BMI .loopRight 

.rightEdgeEnd:
    PLY 
    INY 

.loopLeftOnScreen:
    LDA.B $22 
    CLC 
    ADC.B $1E 
    STA.B $22 
    BCS + 
    SEP #$20 
    LDA.B $23 
    STA.B [$00],Y 
    REP #$20 
    INY #2
    CPY.W #$01CC 
    BMI .loopLeftOnScreen 
    BRA .return 


  + SEP #$20 

.loopLeft:
    LDA.B #$FF 
    STA.B [$00],Y 
    INY #2
    CPY.W #$01CC 
    BMI .loopLeft 
    REP #$20 
    LDY.W $0D1E 
    BEQ .return 
    INY #2
    CPY.W #$01CC 
    BPL .return 
    LDA.W #$00FF 

.loopEnd:
    STA.B [$00],Y 
    INY #2
    CPY.W #$01CC 
    BMI .loopEnd 

.return:
    PLP 
    RTS 


Calc_Xray_HDMADataTable_OnScreen_AimedDownwards_Down:
    PHP 
    REP #$30 
    PHY 

.loopRightOnScreen:
    LDA.B $24 
    SEC 
    SBC.B $20 
    STA.B $24 
    BCC .loopRight 
    LDA.B $25 
    STA.B [$00],Y 
    INY #2
    CPY.W #$01CC 
    BMI .loopRightOnScreen 
    BRA .rightEdgeEnd 


.loopRight:
    LDA.W #$0000 
    STA.B [$00],Y 
    INY #2
    CPY.W #$01CC 
    BMI .loopRight 

.rightEdgeEnd:
    PLY 
    INY 

.loopLeftOnScreen:
    LDA.B $22 
    CLC 
    ADC.B $1E 
    STA.B $22 
    BCS + 
    SEP #$20 
    LDA.B $23 
    STA.B [$00],Y 
    REP #$20 
    INY #2
    CPY.W #$01CC 
    BMI .loopLeftOnScreen 
    BRA .return 


  + SEP #$20 

.loopLeft:
    LDA.B #$FF 
    STA.B [$00],Y 
    INY #2
    CPY.W #$01CC 
    BMI .loopLeft 

.return:
    PLP 
    RTS 


Calc_Xray_HDMADataTable_OnScreen_AimedDownwards_DownLeft:
    PHP 
    REP #$30 
    PHY 

.loopRightOnScreen:
    LDA.B $24 
    SEC 
    SBC.B $20 
    STA.B $24 
    BCC .loopRight 
    LDA.B $25 
    STA.B [$00],Y 
    INY #2
    CPY.W #$01CC 
    BMI .loopRightOnScreen 
    BRA .rightEdgeEnd 


.loopRight:
    LDA.W #$0000 
    STA.B [$00],Y 
    INY #2
    CPY.W #$01CC 
    BMI .loopRight 

.rightEdgeEnd:
    PLY 
    INY 

.loopLeftOnScreen:
    LDA.B $22 
    SEC 
    SBC.B $1E 
    STA.B $22 
    BCC + 
    SEP #$20 
    LDA.B $23 
    STA.B [$00],Y 
    REP #$20 
    INY #2
    CPY.W #$01CC 
    BMI .loopLeftOnScreen 
    BRA .return 


  + SEP #$20 
    PHY 
    LDA.B #$00 

.loopLeft:
    STA.B [$00],Y 
    INY #2
    CPY.W #$01CC 
    BMI .loopLeft 
    PLY 
    DEY 
    LDA.B #$FF 

.loopEnd:
    STA.B [$00],Y 
    INY #2
    CPY.W #$01CC 
    BMI .loopEnd 

.return:
    PLP 
    RTS 


Calc_Xray_HDMADataTable_OnScreen_HorizontalLine:
    PHP 
    REP #$30 
    LDA.B $18 
    DEC A 
    ASL A 
    TAY 
    LDA.B $12 
    CMP.W #$0040 
    BNE .not40 
    LDA.B $17 
    ORA.W #$FF00 
    STA.B [$00],Y 
    BRA + 


.not40:
    LDA.B $16 
    AND.W #$FF00 
    STA.B [$00],Y 

  + DEY #2
    LDA.W #$00FF 

.loopUpper:
    STA.B [$00],Y 
    DEY #2
    BPL .loopUpper 
    LDA.B $18 
    ASL A 
    TAY 
    LDA.W #$00FF 

.loopLower:
    STA.B [$00],Y 
    INY #2
    CPY.W #$01CC 
    BMI .loopLower 
    PLP 
    RTS 


AbsoluteTangentTable:
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

XrayHandler:
    PHP 
    PHB 
    PHK 
    PLB 
    REP #$30 
    LDA.W $0A78 
    BNE .return 
    LDA.B $8B 
    BIT.W $09B6 
    BEQ .return 
    JSL.L XraySetup 
    BCC .return 
    JSL.L Spawn_HDMAObject 
    db $41,$28 
    dw InstList_HDMAObject_Xray_0 

.return:
    PLB 
    PLP 
    RTL 


XraySetup_1_FreezeTime_BackupBG2Registers:
    PHP 
    SEP #$30 
    LDA.B #$01 
    STA.W $0A78 
    LDA.B $B5 
    STA.W $1914,X 
    LDA.B $B6 
    STA.W $1915,X 
    LDA.B $B7 
    STA.W $1920,X 
    LDA.B $B8 
    STA.W $1921,X 
    LDA.B $59 
    STA.W $192C,X 
    PLP 
    RTL 


XraySetup_2_ReadBG1Tilemap_2ndScreen:
    PHP 
    REP #$30 
    LDX.W $0360 
    LDA.B $58 
    AND.W #$00FC 
    XBA 
    CLC 
    ADC.W #$0400 
    STA.W $0340,X 
    LDA.W #$0081 
    STA.W $0342,X 
    LDA.W #$0039 
    STA.W $0343,X 
    LDA.W #$6800 
    STA.W $0344,X 
    LDA.W #$007E 
    STA.W $0346,X 
    LDA.W #$0800 
    STA.W $0347,X 
    TXA 
    CLC 
    ADC.W #$0009 
    STA.W $0360 
    PLP 
    RTL 


XraySetup_3_ReadBG1Tilemap_1stScreen:
    PHP 
    REP #$30 
    LDX.W $0360 
    LDA.B $58 
    AND.W #$00FC 
    XBA 
    STA.W $0340,X 
    LDA.W #$0081 
    STA.W $0342,X 
    LDA.W #$0039 
    STA.W $0343,X 
    LDA.W #$6000 
    STA.W $0344,X 
    LDA.W #$007E 
    STA.W $0346,X 
    LDA.W #$0800 
    STA.W $0347,X 
    TXA 
    CLC 
    ADC.W #$0009 
    STA.W $0360 
    PLP 
    RTL 


XraySetup_4_BuildBG2Tilemap_ReadBG2Tilemap_1stScreen:
    PHP 
    REP #$30 
    LDA.W $091F 
    CLC 
    ADC.W $0915 
    AND.W #$00F0 
    ASL #2
    STA.B $18 
    LDA.W $091D 
    CLC 
    ADC.W $0911 
    AND.W #$00F0 
    LSR #3
    CLC 
    ADC.B $18 
    STA.B $18 
    LDA.W $091D 
    CLC 
    ADC.W $0911 
    AND.W #$0100 
    ASL #2
    CLC 
    ADC.B $18 
    STA.B $18 
    STZ.B $16 
    LDA.W #$0010 
    STA.B $14 

.loopCopyBG1Row:
    LDA.W #$0010 
    STA.B $12 
    LDA.B $18 
    AND.W #$07E0 
    STA.B $1A 
    LDA.B $18 
    AND.W #$001F 
    STA.B $1C 
    STZ.B $1E 

.loopCopyBG1Column:
    LDA.B $1C 
    CLC 
    ADC.B $1E 
    CMP.W #$0020 
    BMI + 
    LDA.B $1A 
    CLC 
    ADC.W #$0400 
    AND.W #$07E0 
    STA.B $1A 
    LDA.W #$0000 
    STA.B $1C 
    STA.B $1E 

  + LDA.B $1A 
    CLC 
    ADC.B $1C 
    ADC.B $1E 
    ASL A 
    TAX 
    LDA.L $7E6000,X 
    PHA 
    LDA.L $7E6002,X 
    PHA 
    LDA.L $7E6040,X 
    PHA 
    LDA.L $7E6042,X 
    LDX.B $16 
    STA.L $7E4042,X 
    PLA 
    STA.L $7E4040,X 
    PLA 
    STA.L $7E4002,X 
    PLA 
    STA.L $7E4000,X 
    LDA.B $16 
    CLC 
    ADC.W #$0004 
    STA.B $16 
    LDA.B $1E 
    ADC.W #$0002 
    STA.B $1E 
    DEC.B $12 
    BNE .loopCopyBG1Column 
    JSR.W CopyLastBG1BlockOfRowToXrayBG2Tilemap 
    LDA.B $18 
    AND.W #$0400 
    STA.B $20 
    LDA.B $18 
    CLC 
    ADC.W #$0040 
    AND.W #$03FF 
    CLC 
    ADC.B $20 
    STA.B $18 
    LDA.B $16 
    CLC 
    ADC.W #$0040 
    STA.B $16 
    DEC.B $14 
    BEQ + 
    JMP.W .loopCopyBG1Row 


  + LDA.W $0915 
    LSR #4
    XBA 
    ORA.W $07A5 
    STA.W $4202 
    LDA.W $0911 
    LSR #4
    CLC 
    ADC.W $4216 
    STA.B $22 
    STZ.B $16 
    LDA.W #$0010 
    STA.B $14 

.loopRevealedRow:
    JSR.W LoadRightHalfOfRevealed2xNBlock 
    LDA.W #$0010 
    STA.B $12 
    LDA.B $22 
    STA.B $24 

.loopRevealedColumn:
    JSR.W LoadRevealedBlock 
    DEC.B $12 
    BNE .loopRevealedColumn 
    LDA.B $16 
    PHA 
    CLC 
    ADC.W #$07C0 
    STA.B $16 
    JSR.W LoadRevealedBlock 
    PLA 
    CLC 
    ADC.W #$0040 
    STA.B $16 
    LDA.B $22 
    CLC 
    ADC.W $07A5 
    STA.B $22 
    DEC.B $14 
    BNE .loopRevealedRow 
    JSL.L Load_Item_and_Room_Special_Xray_Blocks 
    LDX.W $0360 
    LDA.B $59 
    AND.W #$00FC 
    XBA 
    STA.W $0340,X 
    LDA.W #$0081 
    STA.W $0342,X 
    LDA.W #$0039 
    STA.W $0343,X 
    LDA.W #$5000 
    STA.W $0344,X 
    LDA.W #$007E 
    STA.W $0346,X 
    LDA.W #$0800 
    STA.W $0347,X 
    TXA 
    CLC 
    ADC.W #$0009 
    STA.W $0360 
    PLP 
    RTL 


CopyLastBG1BlockOfRowToXrayBG2Tilemap:
    LDA.B $1A 
    STA.B $20 
    LDA.B $1C 
    CLC 
    ADC.B $1E 
    CMP.W #$0020 
    BMI + 
    LDA.B $20 
    CLC 
    ADC.W #$0400 
    AND.W #$07E0 
    STA.B $20 
    LDA.W #$0000 

  + CLC 
    ADC.B $20 
    ASL A 
    TAX 
    LDA.L $7E6000,X 
    PHA 
    LDA.L $7E6002,X 
    PHA 
    LDA.L $7E6040,X 
    PHA 
    LDA.L $7E6042,X 
    PHA 
    LDA.B $16 
    CLC 
    ADC.W #$07C0 
    TAX 
    PLA 
    STA.L $7E4042,X 
    PLA 
    STA.L $7E4040,X 
    PLA 
    STA.L $7E4002,X 
    PLA 
    STA.L $7E4000,X 
    RTS 


LoadRightHalfOfRevealed2xNBlock:
    LDX.B $22 
    DEX 
    JSR.W LoadRevealedBlockCommand 
    CMP.W #RevealedBlockCommand_Copy2x1BlockToXrayBG2Tilemap 
    BEQ .2x1 
    CMP.W #RevealedBlockCommand_Copy2x2BlockToXrayBG2Tilemap 
    BEQ .2x2 
    RTS 


.2x2:
    PHY 
    TYA 
    CLC 
    ADC.W #$0008 
    TAY 
    LDA.B ($03),Y 
    ASL #3
    TAX 
    LDA.L $7EA000,X 
    PHA 
    LDA.L $7EA002,X 
    PHA 
    LDA.L $7EA004,X 
    PHA 
    LDA.L $7EA006,X 
    LDX.B $16 
    STA.L $7E40C2,X 
    PLA 
    STA.L $7E40C0,X 
    PLA 
    STA.L $7E4082,X 
    PLA 
    STA.L $7E4080,X 
    PLY 

.2x1:
    TYA 
    CLC 
    ADC.W #$0004 
    TAY 
    LDA.B ($03),Y 
    ASL #3
    TAX 
    LDA.L $7EA000,X 
    PHA 
    LDA.L $7EA002,X 
    PHA 
    LDA.L $7EA004,X 
    PHA 
    LDA.L $7EA006,X 
    LDX.B $16 
    STA.L $7E4042,X 
    PLA 
    STA.L $7E4040,X 
    PLA 
    STA.L $7E4002,X 
    PLA 
    STA.L $7E4000,X 
    RTS 


LoadRevealedBlock:
    LDX.B $24 
    JSR.W LoadRevealedBlockCommand 
    CMP.W #$FFFF 
    BEQ LoadRevealedBlock_Done 
    JMP.W ($0000) 


LoadRevealedBlock_Done:
    LDA.B $16 
    CLC 
    ADC.W #$0004 
    STA.B $16 
    INC.B $24 
    RTS 


LoadRevealedBlockCommand:
    LDA.L $7F6402,X 
    AND.W #$00FF 
    STA.B $26 
    TXA 
    ASL A 
    TAX 
    LDA.L $7F0002,X 
    AND.W #$F000 
    STA.B $28 
    LDX.W #$0000 

.loopBlockType:
    LDA.W RevealedBlockTable_0_blockType,X 
    CMP.W #$FFFF 
    BEQ .return 
    CMP.B $28 
    BEQ + 
    INX #4
    BRA .loopBlockType 


  + LDA.W RevealedBlockTable_0_pointers,X 
    STA.B $00 
    LDY.W #$0000 

.loopBTS:
    LDA.B ($00),Y 
    CMP.W #$FFFF 
    BEQ .return 
    CMP.W #$FF00 
    BEQ + 
    CMP.B $26 
    BEQ + 
    INY #4
    BRA .loopBTS 


  + INY #2
    LDA.B ($00),Y 
    STA.B $03 
    LDY.W #$0000 
    LDA.B ($03),Y 
    STA.B $00 

.return:
    RTS 


CalculateBlockCoordinates:
    SEP #$20 
    LDA.B $24 
    STA.W $4204 
    LDA.B $25 
    STA.W $4205 
    LDA.W $07A5 
    STA.W $4206 
    REP #$20 
    NOP #6
    LDA.W $4214 
    STA.B $2C 
    LDA.W $4216 
    STA.B $2A 
    RTS 


GetBlockTypeAndBTS:
    LDA.B $2C 
    XBA 
    ORA.W $07A5 
    STA.W $4202 
    NOP #2
    LDA.B $2A 
    CLC 
    ADC.W $4216 
    TAX 
    LDA.L $7F6402,X 
    AND.W #$00FF 
    STA.B $2E 
    TXA 
    ASL A 
    TAX 
    LDA.L $7F0002,X 
    AND.W #$F000 
    STA.B $30 
    RTS 


RevealedBlockCommand_VerticalExtension:
    JSR.W CalculateBlockCoordinates 
    LDA.B $28 
    STA.B $30 
    LDA.B $26 
    BEQ Copy1x1BlockToXrayBG2TilemapIfScrollPLMTrigger 
    BIT.W #$0080 
    BEQ + 
    ORA.W #$FF00 

  + STA.B $2E 

RevealedBlockExtensionLoop_Vertical:
    LDA.B $2C 
    CLC 
    ADC.B $2E 
    BPL + 
    LDA.W #$00FF 
    JSR.W CopyBlockToXrayBG2Tilemap 
    JMP.W LoadRevealedBlock_Done 


  + STA.B $2C 
    JSR.W GetBlockTypeAndBTS 
    CMP.W #$D000 
    BEQ RevealedBlockExtensionLoop_Vertical 
    CMP.W #$5000 
    BNE Copy1x1BlockToXrayBG2TilemapIfScrollPLMTrigger 
    LDA.B $2E 
    BIT.W #$0080 
    BEQ RevealedBlockExtensionLoop_Vertical 
    EOR.W #$FF00 
    STA.B $2E 
    BRA RevealedBlockExtensionLoop_Horizontal 


RevealedBlockCommand_HorizontalExtension:
    JSR.W CalculateBlockCoordinates 
    LDA.B $28 
    STA.B $30 
    LDA.B $26 
    BEQ Copy1x1BlockToXrayBG2TilemapIfScrollPLMTrigger 
    BIT.W #$0080 
    BEQ + 
    ORA.W #$FF00 

  + STA.B $2E 

RevealedBlockExtensionLoop_Horizontal:
    LDA.B $2A 
    CLC 
    ADC.B $2E 
    BPL + 
    LDA.W #$00FF 
    JSR.W CopyBlockToXrayBG2Tilemap 
    JMP.W LoadRevealedBlock_Done 


  + STA.B $2A 
    JSR.W GetBlockTypeAndBTS 
    CMP.W #$D000 
    BEQ RevealedBlockExtensionLoop_Vertical 
    CMP.W #$5000 
    BNE Copy1x1BlockToXrayBG2TilemapIfScrollPLMTrigger 
    LDA.B $2E 
    BIT.W #$0080 
    BEQ RevealedBlockExtensionLoop_Horizontal 
    EOR.W #$FF00 
    STA.B $2E 
    BRA RevealedBlockExtensionLoop_Horizontal 


Copy1x1BlockToXrayBG2TilemapIfScrollPLMTrigger:
    LDA.W RevealedBlockTable_1_blockType 
    CMP.B $30 
    BNE .gotoDone 
    LDA.W RevealedBlockTable_1_pointers 
    STA.B $00 
    LDY.W #$0000 

.loop:
    LDA.B ($00),Y 
    CMP.W #$FFFF 
    BEQ .gotoDone 
    CMP.W #$FF00 
    BEQ + 
    CMP.B $2E 
    BEQ + 
    INY #4
    BRA .loop 


  + INY #2
    LDA.B ($00),Y 
    INC #2
    STA.B $03 
    LDY.W #$0000 
    JSR.W CopyRevealedBlockCommandArgumentToXrayBG2Tilemap 
    JMP.W LoadRevealedBlock_Done 


.gotoDone:
    JMP.W LoadRevealedBlock_Done 


RevealedBlockCommand_Copy1x1BlockToXrayBG2Tilemap:
    INY #2
    JSR.W CopyRevealedBlockCommandArgumentToXrayBG2Tilemap 
    JMP.W LoadRevealedBlock_Done 


RevealedBlockCommand_Copy1x1BlockToXrayBG2TilemapIfBrinstar:
    INY #2
    LDA.W $079F 
    CMP.W #$0001 
    BNE .gotoDone 
    JSR.W CopyRevealedBlockCommandArgumentToXrayBG2Tilemap 

.gotoDone:
    JMP.W LoadRevealedBlock_Done 


RevealedBlockCommand_Copy2x1BlockToXrayBG2Tilemap:
    INY #2
    JSR.W CopyRevealedBlockCommandArgumentToXrayBG2Tilemap 
    LDA.B $12 
    CMP.W #$0001 
    BEQ .gotoDone 
    INY #2
    JSR.W CopyRevealedBlockCommandArgumentToXrayBG2Tilemap_1BlockRight 

.gotoDone:
    JMP.W LoadRevealedBlock_Done 


RevealedBlockCommand_Copy1x2BlockToXrayBG2Tilemap:
    INY #2
    JSR.W CopyRevealedBlockCommandArgumentToXrayBG2Tilemap 
    INY #2
    JSR.W CopyRevealedBlockCommandArgumentToXrayBG2Tilemap_1BlockDown 
    JMP.W LoadRevealedBlock_Done 


RevealedBlockCommand_Copy2x2BlockToXrayBG2Tilemap:
    INY #2
    JSR.W CopyRevealedBlockCommandArgumentToXrayBG2Tilemap 
    INY #2
    LDA.B $12 
    CMP.W #$0001 
    BEQ + 
    JSR.W CopyRevealedBlockCommandArgumentToXrayBG2Tilemap_1BlockRight 

  + INY #2
    JSR.W CopyRevealedBlockCommandArgumentToXrayBG2Tilemap_1BlockDown 
    INY #2
    LDA.B $12 
    CMP.W #$0001 
    BEQ .gotoDone 
    LDA.B ($03),Y 
    ASL #3
    TAX 
    LDA.L $7EA000,X 
    PHA 
    LDA.L $7EA002,X 
    PHA 
    LDA.L $7EA004,X 
    PHA 
    LDA.L $7EA006,X 
    LDX.B $16 
    STA.L $7E40C6,X 
    PLA 
    STA.L $7E40C4,X 
    PLA 
    STA.L $7E4086,X 
    PLA 
    STA.L $7E4084,X 

.gotoDone:
    JMP.W LoadRevealedBlock_Done 


CopyRevealedBlockCommandArgumentToXrayBG2Tilemap:
    LDA.B ($03),Y 

CopyBlockToXrayBG2Tilemap:
    ASL #3
    TAX 
    LDA.L $7EA000,X 
    PHA 
    LDA.L $7EA002,X 
    PHA 
    LDA.L $7EA004,X 
    PHA 
    LDA.L $7EA006,X 
    LDX.B $16 
    STA.L $7E4042,X 
    PLA 
    STA.L $7E4040,X 
    PLA 
    STA.L $7E4002,X 
    PLA 
    STA.L $7E4000,X 
    RTS 


CopyRevealedBlockCommandArgumentToXrayBG2Tilemap_1BlockRight:
    LDA.B ($03),Y 
    ASL #3
    TAX 
    LDA.L $7EA000,X 
    PHA 
    LDA.L $7EA002,X 
    PHA 
    LDA.L $7EA004,X 
    PHA 
    LDA.L $7EA006,X 
    LDX.B $16 
    STA.L $7E4046,X 
    PLA 
    STA.L $7E4044,X 
    PLA 
    STA.L $7E4006,X 
    PLA 
    STA.L $7E4004,X 
    RTS 


CopyRevealedBlockCommandArgumentToXrayBG2Tilemap_1BlockDown:
    LDA.B ($03),Y 
    ASL #3
    TAX 
    LDA.L $7EA000,X 
    PHA 
    LDA.L $7EA002,X 
    PHA 
    LDA.L $7EA004,X 
    PHA 
    LDA.L $7EA006,X 
    LDX.B $16 
    STA.L $7E40C2,X 
    PLA 
    STA.L $7E40C0,X 
    PLA 
    STA.L $7E4082,X 
    PLA 
    STA.L $7E4080,X 
    RTS 


LoadBlockToXrayBG2Tilemap:
    PHP 
    PHX 
    PHY 
    REP #$30 
    STA.B $28 
    LDA.W $0911 
    LSR #4
    STA.B $18 
    TXA 
    SEC 
    SBC.B $18 
    BMI .return 
    STA.B $18 
    SBC.W #$0010 
    BPL .return 
    LDA.W $0915 
    LSR #4
    STA.B $1A 
    TYA 
    SEC 
    SBC.B $1A 
    BMI .return 
    STA.B $1A 
    SBC.W #$0010 
    BPL .return 
    LDA.B $1A 
    ASL #5
    CLC 
    ADC.B $18 
    ASL #2
    STA.B $16 
    LDA.B $28 
    BIT.W #$0800 
    BNE .YFlipped 
    AND.W #$03FF 
    JSR.W CopyBlockToXrayBG2Tilemap 
    BRA .return 


.YFlipped:
    AND.W #$03FF 
    JSR.W CopyYFlippedBlockToXrayBG2Tilemap 

.return:
    PLY 
    PLX 
    PLP 
    RTL 


CopyYFlippedBlockToXrayBG2Tilemap:
    ASL #3
    TAX 
    LDA.L $7EA000,X 
    PHA 
    LDA.L $7EA002,X 
    PHA 
    LDA.L $7EA004,X 
    PHA 
    LDA.L $7EA006,X 
    LDX.B $16 
    STA.L $7E4002,X 
    PLA 
    STA.L $7E4000,X 
    PLA 
    STA.L $7E4042,X 
    PLA 
    STA.L $7E4040,X 
    RTS 


XraySetup_5_ReadBG2Tilemap_2ndScreen:
    PHP 
    REP #$30 
    JSL.L CheckIfXrayShouldShowAnyBlocks 
    BEQ .noReveal 
    LDA.W $1840 
    BEQ + 
    LDA.W $091D 
    CLC 
    ADC.W $0911 
    STA.B $B1 
    LDA.W $091F 
    CLC 
    ADC.W $0915 
    STA.B $B3 

  + LDA.B $B1 
    AND.W #$000F 
    STA.B $B5 
    LDA.B $B3 
    AND.W #$000F 
    STA.B $B7 
    SEP #$20 
    LDA.B #$49 
    STA.B $59 
    REP #$20 

.noReveal:
    LDX.W $0360 
    LDA.B $59 
    AND.W #$00FC 
    XBA 
    CLC 
    ADC.W #$0400 
    STA.W $0340,X 
    LDA.W #$0081 
    STA.W $0342,X 
    LDA.W #$0039 
    STA.W $0343,X 
    LDA.W #$5800 
    STA.W $0344,X 
    LDA.W #$007E 
    STA.W $0346,X 
    LDA.W #$0800 
    STA.W $0347,X 
    TXA 
    CLC 
    ADC.W #$0009 
    STA.W $0360 
    PLP 
    RTL 


REP30_91D141:
    REP #$30 

CheckIfXrayShouldShowAnyBlocks:
    LDA.W $079B 
    CMP.W #RoomHeader_Statues 
    BEQ .return 
    CMP.W #RoomHeader_GlassTunnel 
    BEQ .return 
    LDA.W $196E 
    CMP.W #$0024 
    BEQ .return 
    LDA.W $179C 
    CMP.W #$0003 
    BEQ .return 
    CMP.W #$0006 
    BEQ .return 
    CMP.W #$0007 
    BEQ .return 
    CMP.W #$0008 
    BEQ .return 
    CMP.W #$000A 

.return:
    RTL 


XraySetup_6_TransferXrayTilemap_1stScreen:
    PHP 
    REP #$30 
    JSL.L CheckIfXrayShouldShowAnyBlocks 
    BEQ .return 
    LDX.W $0330 
    LDA.W #$0800 
    STA.B $D0,X 
    LDA.W #$4000 
    STA.B $D2,X 
    LDA.W #$007E 
    STA.B $D4,X 
    LDA.B $59 
    AND.W #$00FC 
    XBA 
    STA.B $D5,X 
    TXA 
    CLC 
    ADC.W #$0007 
    STA.W $0330 

.return:
    PLP 
    RTL 


XraySetup_7_InitializeXray_TransferXrayTilemap_2ndScreen:
    PHP 
    REP #$30 
    JSL.L CheckIfXrayShouldShowAnyBlocks 
    BEQ .dontShowBlocks 
    LDX.W $0330 
    LDA.W #$0800 
    STA.B $D0,X 
    LDA.W #$4800 
    STA.B $D2,X 
    LDA.W #$007E 
    STA.B $D4,X 
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

.dontShowBlocks:
    LDA.W #$00E4 
    STA.W $0A88 
    LDA.W #$9800 ; $7E
    STA.W $0A89 
    LDA.W #$00E4 
    STA.W $0A8B 
    LDA.W #$98C8 ; $7E
    STA.W $0A8C 
    LDA.W #$0098 
    STA.W $0A8E 
    LDA.W #$9990 ; $7E
    STA.W $0A8F 
    STZ.W $0A91 
    STZ.W $0A7A 
    STZ.W $0A7C 
    STZ.W $0A7E 
    LDA.W #$0000 
    STA.W $0A84 
    STZ.W $0A86 
    LDA.W $0A1E 
    AND.W #$00FF 
    CMP.W #$0004 
    BEQ .facingLeft 
    LDA.W #$0040 
    STA.W $0A82 
    BRA .return 


.facingLeft:
    LDA.W #$00C0 
    STA.W $0A82 

.return:
    PLP 
    RTL 


InstList_HDMAObject_Xray_0:
    dw Instruction_HDMAObject_HDMATableBank 
    db $00 
    dw Instruction_HDMAObject_IndirectHDMATableBank 
    db $7E 
    dw Instruction_HDMAObject_PreInstructionInY 
    dl PreInstruction_HDMAObject_XraySetup 
    dw Instruction_HDMAObject_CallExternalFunctionInY 
    dl XraySetup_1_FreezeTime_BackupBG2Registers 
    dw $0001,$0A88 
    dw Instruction_HDMAObject_CallExternalFunctionInY 
    dl XraySetup_2_ReadBG1Tilemap_2ndScreen 
    dw $0001,$0A88 
    dw Instruction_HDMAObject_CallExternalFunctionInY 
    dl XraySetup_3_ReadBG1Tilemap_1stScreen 
    dw $0001,$0A88 
    dw Instruction_HDMAObject_CallExternalFunctionInY 
    dl XraySetup_4_BuildBG2Tilemap_ReadBG2Tilemap_1stScreen 
    dw $0001,$0A88 
    dw Instruction_HDMAObject_CallExternalFunctionInY 
    dl XraySetup_5_ReadBG2Tilemap_2ndScreen 
    dw $0001,$0A88 
    dw Instruction_HDMAObject_CallExternalFunctionInY 
    dl XraySetup_6_TransferXrayTilemap_1stScreen 
    dw $0001,$0A88 
    dw Instruction_HDMAObject_CallExternalFunctionInY 
    dl XraySetup_7_InitializeXray_TransferXrayTilemap_2ndScreen 
    dw $0001,$0A88 
    dw Instruction_HDMAObject_CallExternalFunctionInY 
    dl XraySetup_8_BackdropColor 
    dw Instruction_HDMAObject_PreInstructionInY 
    dl PreInstruction_Xray_Main 

InstList_HDMAObject_Xray_1:
    dw $0001,$0A88 
    dw Instruction_HDMAObject_GotoY 
    dw InstList_HDMAObject_Xray_1 

PreInstruction_HDMAObject_XraySetup:
    PHP 
    REP #$30 
    PHX 
    LDX.W #$1000 
    LDA.W $196E 
    CMP.W #$0024 
    BEQ .fireflea 
    LDX.W #$2000 
    JSL.L CheckIfXrayShouldShowAnyBlocks 
    BEQ .setBackdropColorEnd 
    LDX.W #$4000 

.setBackdropColor:
    LDA.W #$0027 
    STA.B $74 
    LDA.W #$0047 
    STA.B $75 
    LDA.W #$0087 
    STA.B $76 

.setBackdropColorEnd:
    TXA 
    TSB.W $1986 
    PLX 
    PLP 
    RTL 


.fireflea:
    LDA.B $74 
    AND.W #$001F 
    CMP.W #$0007 
    BPL .setBackdropColorEnd 
    BRA .setBackdropColor 


XraySetup_8_BackdropColor:
    PHP 
    PHX 
    PHY 
    SEP #$20 
    LDA.B #$63 
    STA.L $7EC000 
    LDA.B #$0C 
    STA.L $7EC001 
    PLY 
    PLX 
    PLP 
    RTL 


RTS_91D2D1:
    PHP 
    REP #$30 
    PLP 
    RTS 


RevealedBlockTable_0_blockType:
    dw $0000 

RevealedBlockTable_0_pointers:
    dw RevealedBlockTable_Air_0 

RevealedBlockTable_1_blockType:
    dw $3000 

RevealedBlockTable_1_pointers:
    dw RevealedBlockTable_SpecialAir_0 
    dw $5000 
    dw RevealedBlockTable_HorizontalExtension_0 
    dw $A000 
    dw RevealedBlockTable_SpikeBlock_0 
    dw $B000 
    dw RevealedBlockTable_SpecialBlock 
    dw $C000 
    dw RevealedBlockTable_ShootableBlock 
    dw $D000 
    dw RevealedBlockTable_VerticalExtension_0 
    dw $E000 
    dw RevealedBlockTable_GrappleBlock 
    dw $F000 
    dw RevealedBlockTable_BombableBlock 
    dw $FFFF 

RevealedBlockTable_Air_0:
    dw $FF00 
    dw RevealedBlockTable_Air_1 
    dw $FFFF 

RevealedBlockTable_Air_1:
    dw RevealedBlockCommand_Copy1x1BlockToXrayBG2Tilemap 
    dw $00FF 

RevealedBlockTable_SpecialAir_0:
    dw $0046 
    dw RevealedBlockTable_SpecialAir_1 
    dw $FFFF 

RevealedBlockTable_SpecialAir_1:
    dw RevealedBlockCommand_Copy1x1BlockToXrayBG2Tilemap 
    dw $00FF 

RevealedBlockTable_HorizontalExtension_0:
    dw $FF00 
    dw RevealedBlockTable_HorizontalExtension_1 
    dw $FFFF 

RevealedBlockTable_HorizontalExtension_1:
    dw RevealedBlockCommand_HorizontalExtension 

RevealedBlockTable_SpikeBlock_0:
    dw $000E 
    dw RevealedBlockTable_SpikeBlock_1 
    dw $FFFF 

RevealedBlockTable_SpikeBlock_1:
    dw RevealedBlockCommand_Copy1x1BlockToXrayBG2Tilemap 
    dw $005F 

RevealedBlockTable_SpecialBlock:
    dw $0000 
    dw RevealedBlockTable_SpecialBlock_0 
    dw $0001 
    dw RevealedBlockTable_SpecialBlock_1 
    dw $0002 
    dw RevealedBlockTable_SpecialBlock_2 
    dw $0003 
    dw RevealedBlockTable_SpecialBlock_3 
    dw $0004 
    dw RevealedBlockTable_SpecialBlock_4 
    dw $0005 
    dw RevealedBlockTable_SpecialBlock_5 
    dw $0006 
    dw RevealedBlockTable_SpecialBlock_6 
    dw $0007 
    dw RevealedBlockTable_SpecialBlock_7 
    dw $0008 
    dw RevealedBlockTable_SpecialBlock_8 
    dw $0009 
    dw RevealedBlockTable_SpecialBlock_9 
    dw $000A 
    dw RevealedBlockTable_SpecialBlock_A 
    dw $000B 
    dw RevealedBlockTable_SpecialBlock_B 
    dw $000C 
    dw RevealedBlockTable_SpecialBlock_C 
    dw $000D 
    dw RevealedBlockTable_SpecialBlock_D 
    dw $000E 
    dw RevealedBlockTable_SpecialBlock_E 
    dw $000F 
    dw RevealedBlockTable_SpecialBlock_F 
    dw $0082 
    dw RevealedBlockTable_SpecialBlock_Brinstar 
    dw $0083 
    dw RevealedBlockTable_SpecialBlock_Brinstar 
    dw $0084 
    dw RevealedBlockTable_SpecialBlock_Brinstar 
    dw $0085 
    dw RevealedBlockTable_SpecialBlock_Brinstar 
    dw $FFFF 

RevealedBlockTable_SpecialBlock_0:
    dw RevealedBlockCommand_Copy1x1BlockToXrayBG2Tilemap 
    dw $00BC 

RevealedBlockTable_SpecialBlock_1:
    dw RevealedBlockCommand_Copy2x1BlockToXrayBG2Tilemap 
    dw $00BC,$00BC 

RevealedBlockTable_SpecialBlock_2:
    dw RevealedBlockCommand_Copy1x2BlockToXrayBG2Tilemap 
    dw $00BC,$00BC 

RevealedBlockTable_SpecialBlock_3:
    dw RevealedBlockCommand_Copy2x2BlockToXrayBG2Tilemap 
    dw $00BC,$00BC,$00BC,$00BC 

RevealedBlockTable_SpecialBlock_4:
    dw RevealedBlockCommand_Copy1x1BlockToXrayBG2Tilemap 
    dw $00BC 

RevealedBlockTable_SpecialBlock_5:
    dw RevealedBlockCommand_Copy2x1BlockToXrayBG2Tilemap 
    dw $00BC,$00BC 

RevealedBlockTable_SpecialBlock_6:
    dw RevealedBlockCommand_Copy1x2BlockToXrayBG2Tilemap 
    dw $00BC,$00BC 

RevealedBlockTable_SpecialBlock_7:
    dw RevealedBlockCommand_Copy2x2BlockToXrayBG2Tilemap 
    dw $00BC,$00BC,$00BC,$00BC 

RevealedBlockTable_SpecialBlock_8:
    dw RevealedBlockCommand_Copy1x1BlockToXrayBG2Tilemap 
    dw $00BC 

RevealedBlockTable_SpecialBlock_9:
    dw RevealedBlockCommand_Copy1x1BlockToXrayBG2Tilemap 
    dw $00BC 

RevealedBlockTable_SpecialBlock_A:
    dw RevealedBlockCommand_Copy1x1BlockToXrayBG2Tilemap 
    dw $00BC 

RevealedBlockTable_SpecialBlock_B:
    dw RevealedBlockCommand_Copy1x1BlockToXrayBG2Tilemap 
    dw $00BC 

RevealedBlockTable_SpecialBlock_C:
    dw RevealedBlockCommand_Copy1x1BlockToXrayBG2Tilemap 
    dw $00BC 

RevealedBlockTable_SpecialBlock_D:
    dw RevealedBlockCommand_Copy1x1BlockToXrayBG2Tilemap 
    dw $00BC 

RevealedBlockTable_SpecialBlock_E:
    dw RevealedBlockCommand_Copy1x1BlockToXrayBG2Tilemap 
    dw $00B6 

RevealedBlockTable_SpecialBlock_F:
    dw RevealedBlockCommand_Copy1x1BlockToXrayBG2Tilemap 
    dw $00B6 

RevealedBlockTable_SpecialBlock_Brinstar:
    dw RevealedBlockCommand_Copy1x1BlockToXrayBG2TilemapIfBrinstar 
    dw $00B6 

RevealedBlockTable_ShootableBlock:
    dw $0000 
    dw RevealedBlockTable_ShootableBlock_0 
    dw $0001 
    dw RevealedBlockTable_ShootableBlock_1 
    dw $0002 
    dw RevealedBlockTable_ShootableBlock_2 
    dw $0003 
    dw RevealedBlockTable_ShootableBlock_3 
    dw $0004 
    dw RevealedBlockTable_ShootableBlock_4 
    dw $0005 
    dw RevealedBlockTable_ShootableBlock_5 
    dw $0006 
    dw RevealedBlockTable_ShootableBlock_6 
    dw $0007 
    dw RevealedBlockTable_ShootableBlock_7 
    dw $0008 
    dw RevealedBlockTable_ShootableBlock_8 
    dw $0009 
    dw RevealedBlockTable_ShootableBlock_9 
    dw $000A 
    dw RevealedBlockTable_ShootableBlock_A 
    dw $000B 
    dw RevealedBlockTable_ShootableBlock_B 
    dw $000C 
    dw RevealedBlockTable_ShootableBlock_C 
    dw $000D 
    dw RevealedBlockTable_ShootableBlock_D 
    dw $000E 
    dw RevealedBlockTable_ShootableBlock_E 
    dw $000F 
    dw RevealedBlockTable_ShootableBlock_F 
    dw $FFFF 

RevealedBlockTable_ShootableBlock_0:
    dw RevealedBlockCommand_Copy1x1BlockToXrayBG2Tilemap 
    dw $0052 

RevealedBlockTable_ShootableBlock_1:
    dw RevealedBlockCommand_Copy2x1BlockToXrayBG2Tilemap 
    dw $0096,$0097 

RevealedBlockTable_ShootableBlock_2:
    dw RevealedBlockCommand_Copy1x2BlockToXrayBG2Tilemap 
    dw $0098,$00B8 

RevealedBlockTable_ShootableBlock_3:
    dw RevealedBlockCommand_Copy2x2BlockToXrayBG2Tilemap 
    dw $0099,$009A,$00B9,$00BA 

RevealedBlockTable_ShootableBlock_4:
    dw RevealedBlockCommand_Copy1x1BlockToXrayBG2Tilemap 
    dw $0052 

RevealedBlockTable_ShootableBlock_5:
    dw RevealedBlockCommand_Copy2x1BlockToXrayBG2Tilemap 
    dw $0096,$0097 

RevealedBlockTable_ShootableBlock_6:
    dw RevealedBlockCommand_Copy1x2BlockToXrayBG2Tilemap 
    dw $0098,$00B8 

RevealedBlockTable_ShootableBlock_7:
    dw RevealedBlockCommand_Copy2x2BlockToXrayBG2Tilemap 
    dw $0099,$009A,$00B9,$00BA 

RevealedBlockTable_ShootableBlock_8:
    dw RevealedBlockCommand_Copy1x1BlockToXrayBG2Tilemap 
    dw $0057 

RevealedBlockTable_ShootableBlock_9:
    dw RevealedBlockCommand_Copy1x1BlockToXrayBG2Tilemap 
    dw $0057 

RevealedBlockTable_ShootableBlock_A:
    dw RevealedBlockCommand_Copy1x1BlockToXrayBG2Tilemap 
    dw $009F 

RevealedBlockTable_ShootableBlock_B:
    dw RevealedBlockCommand_Copy1x1BlockToXrayBG2Tilemap 
    dw $009F 

RevealedBlockTable_ShootableBlock_C:
    dw RevealedBlockCommand_Copy1x1BlockToXrayBG2Tilemap 
    dw $009F 

RevealedBlockTable_ShootableBlock_D:
    dw RevealedBlockCommand_Copy1x1BlockToXrayBG2Tilemap 
    dw $009F 

RevealedBlockTable_ShootableBlock_E:
    dw RevealedBlockCommand_Copy1x1BlockToXrayBG2Tilemap 
    dw $009F 

RevealedBlockTable_ShootableBlock_F:
    dw RevealedBlockCommand_Copy1x1BlockToXrayBG2Tilemap 
    dw $009F 

RevealedBlockTable_VerticalExtension_0:
    dw $FF00 
    dw RevealedBlockTable_VerticalExtension_1 
    dw $FFFF 

RevealedBlockTable_VerticalExtension_1:
    dw RevealedBlockCommand_VerticalExtension 

RevealedBlockTable_GrappleBlock:
    dw $0000 
    dw RevealedBlockTable_GrappleBlock_0 
    dw $0001 
    dw RevealedBlockTable_GrappleBlock_1 
    dw $0002 
    dw RevealedBlockTable_GrappleBlock_2 
    dw $FFFF 

RevealedBlockTable_GrappleBlock_0:
    dw RevealedBlockCommand_Copy1x1BlockToXrayBG2Tilemap 
    dw $009B 

RevealedBlockTable_GrappleBlock_1:
    dw RevealedBlockCommand_Copy1x1BlockToXrayBG2Tilemap 
    dw $00B7 

RevealedBlockTable_GrappleBlock_2:
    dw RevealedBlockCommand_Copy1x1BlockToXrayBG2Tilemap 
    dw $00B7 

RevealedBlockTable_BombableBlock:
    dw $0000 
    dw RevealedBlockTable_BombableBlock_0 
    dw $0001 
    dw RevealedBlockTable_BombableBlock_1 
    dw $0002 
    dw RevealedBlockTable_BombableBlock_2 
    dw $0003 
    dw RevealedBlockTable_BombableBlock_3 
    dw $0004 
    dw RevealedBlockTable_BombableBlock_4 
    dw $0005 
    dw RevealedBlockTable_BombableBlock_5 
    dw $0006 
    dw RevealedBlockTable_BombableBlock_6 
    dw $0007 
    dw RevealedBlockTable_BombableBlock_7 
    dw $FFFF 

RevealedBlockTable_BombableBlock_0:
    dw RevealedBlockCommand_Copy1x1BlockToXrayBG2Tilemap 
    dw $0058 

RevealedBlockTable_BombableBlock_1:
    dw RevealedBlockCommand_Copy2x1BlockToXrayBG2Tilemap 
    dw $0058,$0058 

RevealedBlockTable_BombableBlock_2:
    dw RevealedBlockCommand_Copy1x2BlockToXrayBG2Tilemap 
    dw $0058,$0058 

RevealedBlockTable_BombableBlock_3:
    dw RevealedBlockCommand_Copy2x2BlockToXrayBG2Tilemap 
    dw $0058,$0058,$0058,$0058 

RevealedBlockTable_BombableBlock_4:
    dw RevealedBlockCommand_Copy1x1BlockToXrayBG2Tilemap 
    dw $0058 

RevealedBlockTable_BombableBlock_5:
    dw RevealedBlockCommand_Copy2x1BlockToXrayBG2Tilemap 
    dw $0058,$0058 

RevealedBlockTable_BombableBlock_6:
    dw RevealedBlockCommand_Copy1x2BlockToXrayBG2Tilemap 
    dw $0058,$0058 

RevealedBlockTable_BombableBlock_7:
    dw RevealedBlockCommand_Copy2x2BlockToXrayBG2Tilemap 
    dw $0058,$0058,$0058,$0058 

UNUSED_GameState1C_91D4DA:
    PHP 
    REP #$30 
    JMP.W ($0DEA) 


PLPRTL_91D4E0:
    PLP 
    RTL 


PLPRTL_91D4E2:
    PLP 
    RTL 


VariaSuit_Pickup:
    PHP 
    PHB 
    PHK 
    PLB 
    SEP #$30 
    LDA.B #$30 
    STA.W $0DF0 
    LDA.B #$50 
    STA.W $0DF1 
    LDA.B #$80 
    STA.W $0DF2 
    STZ.W $0DF3 
    REP #$30 
    JSL.L Cancel_SpeedBoosting 
    STZ.W $0B42 
    STZ.W $0B44 
    STZ.W $0B46 
    STZ.W $0B48 
    STZ.W $0B2C 
    STZ.W $0B2E 
    STZ.W $0B36 
    STZ.W $0B20 
    STZ.W $0B4A 
    STZ.W $0E18 
    STZ.W $0DEC 
    STZ.W $0DEE 
    LDA.W #$0100 
    STA.W $0DDC 
    LDX.W #$01FE 
    LDA.W #$00FF 

.loop:
    STA.L $7E9800,X 
    DEX #2
    BPL .loop 
    LDA.W $0A1F 
    AND.W #$00FF 
    CMP.W #$0003 
    BEQ .playSFX 
    CMP.W #$0014 
    BNE notSpinning 

.playSFX:
    LDA.W #$0032 
    JSL.L QueueSound_Lib1_Max9 

notSpinning:
    LDA.W $09A2 
    BIT.W #$0020 
    BNE .gravitySuitEquipped 
    LDA.W #$0000 
    STA.W $0A1C 
    BRA .initSamus 


.gravitySuitEquipped:
    LDA.W #$009B 
    STA.W $0A1C 

.initSamus:
    JSL.L InitializeSamusPose_1 
    JSL.L Set_Samus_AnimationFrame_if_PoseChanged 
    LDA.W #$0015 
    JSL.L Run_Samus_Command 
    LDA.W $0911 
    CLC 
    ADC.W #$0078 
    STA.W $0AF6 
    STA.W $0B10 
    LDA.W $0915 
    CLC 
    ADC.W #$0088 
    STA.W $0AFA 
    STA.W $0B14 
    LDA.W #$0056 
    JSL.L QueueSound_Lib2_Max6 
    JSL.L Spawn_HDMAObject 
    db $41,$26 
    dw InstList_HDMAObject_Window1Position_VariaSuitPickup 
    PLB 
    PLP 
    RTL 


InstList_HDMAObject_Window1Position_VariaSuitPickup:
    dw Instruction_HDMAObject_HDMATableBank 
    db $00 
    dw Instruction_HDMAObject_IndirectHDMATableBank 
    db $7E 
    dw Instruction_HDMAObject_CallExternalFunctionInY 
    dl InitializeSuitPickupHDMA 
    dw $0001,$0A88 
    dw Instruction_HDMAObject_PreInstructionInY 
    dl PreInstruction_VariaSuitPickup 
    dw Instruction_HDMAObject_Sleep 
    dw Instruction_HDMAObject_Delete 

GravitySuit_Pickup:
    PHP 
    PHB 
    PHK 
    PLB 
    SEP #$30 
    LDA.B #$30 
    STA.W $0DF0 
    LDA.B #$49 
    STA.W $0DF1 
    LDA.B #$90 
    STA.W $0DF2 
    LDA.B #$01 
    STA.W $0DF3 
    REP #$30 
    JSL.L Cancel_SpeedBoosting 
    STZ.W $0B42 
    STZ.W $0B44 
    STZ.W $0B46 
    STZ.W $0B48 
    STZ.W $0B2C 
    STZ.W $0B2E 
    STZ.W $0B36 
    STZ.W $0B20 
    STZ.W $0B4A 
    STZ.W $0E18 
    STZ.W $0DEC 
    STZ.W $0DEE 
    LDA.W #$0100 
    STA.W $0DDC 
    LDX.W #$01FE 
    LDA.W #$00FF 

.loop:
    STA.L $7E9800,X 
    DEX #2
    BPL .loop 
    LDA.W $0A1F 
    AND.W #$00FF 
    CMP.W #$0003 
    BEQ .playSFX 
    CMP.W #$0014 
    BNE .notSpinning 

.playSFX:
    LDA.W #$0032 
    JSL.L QueueSound_Lib1_Max9 

.notSpinning:
    LDA.W $09A2 
    BIT.W #$0001 
    BNE .gravitySuitEquipped 
    LDA.W #$0000 
    STA.W $0A1C 
    BRA .initSamus 


.gravitySuitEquipped:
    LDA.W #$009B 
    STA.W $0A1C 

.initSamus:
    JSL.L InitializeSamusPose_1 
    JSL.L Set_Samus_AnimationFrame_if_PoseChanged 
    LDA.W #$0015 
    JSL.L Run_Samus_Command 
    LDA.W $0911 
    CLC 
    ADC.W #$0078 
    STA.W $0AF6 
    STA.W $0B10 
    LDA.W $0915 
    CLC 
    ADC.W #$0088 
    STA.W $0AFA 
    STA.W $0B14 
    LDA.W #$0056 
    JSL.L QueueSound_Lib2_Max6 
    JSL.L Spawn_HDMAObject 
    db $41,$26 
    dw InstList_HDMAObject_Window1Position_GravitySuitPickup 
    PLB 
    PLP 
    RTL 


InstList_HDMAObject_Window1Position_GravitySuitPickup:
    dw Instruction_HDMAObject_HDMATableBank 
    db $00 
    dw Instruction_HDMAObject_IndirectHDMATableBank 
    db $7E 
    dw Instruction_HDMAObject_CallExternalFunctionInY 
    dl InitializeSuitPickupHDMA 
    dw $0001,$0A88 
    dw Instruction_HDMAObject_PreInstructionInY 
    dl PreInstruction_GravitySuitPickup 
    dw Instruction_HDMAObject_Sleep 
    dw Instruction_HDMAObject_Delete 

InitializeSuitPickupHDMA:
    PHP 
    PHB 
    PHK 
    PLB 
    SEP #$30 
    LDA.B #$13 
    STA.B $69 
    LDA.B #$13 
    STA.B $6C 
    LDA.B #$04 
    STA.B $6B 
    LDA.B #$04 
    STA.B $6D 
    LDA.B #$10 
    STA.B $6E 
    LDA.B #$00 
    STA.B $60 
    LDA.B #$02 
    STA.B $61 
    LDA.B #$20 
    STA.B $62 
    LDA.B #$33 
    STA.B $71 
    LDA.W $0DF0 
    STA.B $74 
    LDA.W $0DF1 
    STA.B $75 
    LDA.W $0DF2 
    STA.B $76 
    REP #$30 
    LDA.W #$00E4 
    STA.W $0A88 
    LDA.W #$9800 ; $7E
    STA.W $0A89 
    LDA.W #$00E4 
    STA.W $0A8B 
    LDA.W #$98C8 ; $7E
    STA.W $0A8C 
    LDA.W #$0098 
    STA.W $0A8E 
    LDA.W #$9990 ; $7E
    STA.W $0A8F 
    STZ.W $0A91 
    PLB 
    PLP 
    RTL 


HandleSamusPalette:
    PHP 
    PHB 
    PHK 
    PLB 
    REP #$30 
    LDA.W $0A4A 
    BPL .notHyper 
    JSR.W HandleMiscSamusPalette 
    PLB 
    PLP 
    RTL 


.notHyper:
    JSR.W HandleBeamChargePalettes 
    BCS .glowEnded 
    LDA.W $0ACC 
    ASL A 
    TAX 
    JSR.W (.special,X) 
    BCS .return 

.glowEnded:
    LDX.W $0A74 
    LDA.W .suits,X 
    TAX 
    JSR.W Load20BytesOfSamusPaletteInX 

.return:
    JSR.W HandleMiscSamusPalette 
    PLB 
    PLP 
    RTL 


.suits:
    dw SamusPalettes_PowerSuit 
    dw SamusPalettes_VariaSuit 
    dw SamusPalettes_GravitySuit 

.special:
    dw Handle_ScrewAttack_SpeedBoosting_Palette 
    dw HandleSpeedBoosterShinePalette 
    dw HandleMiscSamusPalette 
    dw $0000 
    dw $0000 
    dw $0000 
    dw HandleShinesparkingPalette 
    dw HandleCrystalFlashPalette 
    dw HandleXrayPalette 
    dw HandleVisorPalette 
    dw RTS_91DD31 

HandleBeamChargePalettes:
    LDA.W $0B18 
    BNE .chargedShotGlow 
    LDA.W $0D32 
    CMP.W #GrappleBeamFunction_Inactive 
    BNE .noChargeGlow 
    LDA.W $0CD0 
    BEQ .noChargeGlow 
    CMP.W #$003C 
    BMI .noChargeGlow 
    LDA.W $0A6E 
    CMP.W #$0004 
    BNE .notPseudoScrew 
    LDX.W $0A74 
    LDA.W SamusPaletteTable_PseudoScrewAttack_pointers,X 
    STA.B $24 
    BRA + 


.notPseudoScrew:
    LDX.W $0A74 
    LDA.W SamusPaletteTable_BeamCharge_pointers,X 
    STA.B $24 

  + LDA.W $0B62 
    CLC 
    ADC.B $24 
    TAX 
    LDA.W $0000,X 
    TAX 
    JSR.W Load20BytesOfSamusPaletteInX 
    LDA.W $0B62 
    INC #2
    CMP.W #$000C 
    BMI .setPaletteIndex 
    LDA.W #$0000 

.setPaletteIndex:
    STA.W $0B62 
    CLC 
    RTS 


.chargedShotGlow:
    LDA.W $0A76 
    BNE .hyperBeam 
    DEC.W $0B18 
    BEQ .returnCarrySet 
    LDX.W #$001C 
    LDA.W #$03FF 

.loop:
    STA.L $7EC182,X 
    DEX #2
    BPL .loop 
    CLC 
    RTS 


.returnCarrySet:
    SEC 
    RTS 


.noChargeGlow:
    STZ.W $0B62 
    JMP.W HandleVisorPalette 


.hyperBeam:
    LDA.W $0B18 
    BIT.W #$0001 
    BNE .decGlowTimer 
    AND.W #$001E 
    BEQ .endGlow 
    TAY 
    LDA.W SamusPaletteTable_HyperBeam,Y 
    TAX 
    JSR.W Load20BytesOfSamusPaletteInX 

.decGlowTimer:
    DEC.W $0B18 
    CLC 
    RTS 


.endGlow:
    STZ.W $0B18 
    SEC 
    RTS 


SamusPaletteTable_BeamCharge_pointers:
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

HandleVisorPalette:
    LDA.W $0ACC 
    CMP.W #$0008 
    BNE + 

.return:
    CLC 
    RTS 


  + LDA.W $1982 
    CMP.W #$0028 
    BEQ + 
    CMP.W #$002A 
    BNE .normal 

  + LDA.W $0A72 
    DEC A 
    STA.W $0A72 
    BIT.W #$00FF 
    BEQ + 
    BNE .return 

  + ORA.W #$0005 
    STA.W $0A72 
    XBA 
    AND.W #$00FF 
    TAX 
    LDA.L SamusPalettes_Visor,X 
    STA.L $7EC188 
    TXA 
    INC #2
    CMP.W #$000C 
    BMI + 
    LDA.W $0A72 
    AND.W #$00FF 
    ORA.W #$0600 
    STA.W $0A72 
    CLC 
    RTS 


  + XBA 
    STA.B $12 
    LDA.W $0A72 
    AND.W #$00FF 
    ORA.B $12 
    STA.W $0A72 
    CLC 
    RTS 


.normal:
    LDA.W #$0601 
    STA.W $0A72 
    CLC 
    RTS 


HandleMiscSamusPalette:
    LDA.W $0A4A 
    BNE .gotoSuperSpecial 
    LDA.W $0A48 
    BNE .timerNotExpired 
    RTS 


.gotoSuperSpecial:
    JMP.W .superSpecial 


.timerNotExpired:
    CMP.W #$0002 
    BNE .notHurtFrame2 
    LDA.W $1F51 
    BNE .noSFX 
    LDA.W $0A44 
    CMP.W #RTL_90E8D9 
    BNE .notDrained 
    LDA.W $0A1C 
    CMP.W #$0054 
    BEQ .noSFX 

.notDrained:
    LDA.W #$0035 
    JSL.L QueueSound_Lib1_Max6 
    BRA .notHurtFlash 


.noSFX:
    LDA.W $0A48 

.notHurtFrame2:
    CMP.W #$0007 
    BPL .hurtFlashDone 
    BIT.W #$0001 
    BEQ .notHurtFlash 
    LDX.W #SamusPalettes_HurtFlash 
    JSR.W Load20BytesOfSamusPaletteInX 
    BRA .hurtFlashDone 


.notHurtFlash:
    LDA.W $1F51 
    BEQ .loadPalette 
    LDX.W #SamusPalettes_Intro 
    JSR.W Load20BytesOfSamusPaletteInX 
    BRA .hurtFlashDone 


.loadPalette:
    JSL.L LoadSamusSuitPalette 

.hurtFlashDone:
    LDA.W $0A48 
    INC A 
    STA.W $0A48 
    CMP.W #$0028 
    BEQ .nonHurtSFX 
    CMP.W #$003C 
    BMI .returnUpper 
    STZ.W $0A48 

.returnUpper:
    RTS 


.nonHurtSFX:
    LDA.W $0D32 
    CMP.W #GrappleBeamFunction_Inactive 
    BNE .grappleActive 
    LDA.W $0A1F 
    AND.W #$00FF 
    CMP.W #$0003 
    BEQ .spinning 
    CMP.W #$0014 
    BEQ .spinning 
    LDA.W $0CD0 
    CMP.W #$0010 
    BMI .returnUpper 
    LDA.B $8B 
    BIT.W $09B2 
    BEQ .returnUpper 
    LDA.W #$0001 
    STA.W $0DC0 
    RTS 


.grappleActive:
    CMP.W #GrappleBeamFunction_HitNothing_Cancel 
    BPL .returnUpper 
    LDA.W #$0006 
    JSL.L QueueSound_Lib1_Max9 
    RTS 


.spinning:
    LDA.W #$001C 
    JSL.L Run_Samus_Command 
    RTS 


.superSpecial:
    BMI .acquiringHyperBeam 
    BIT.W #$0001 
    BEQ .loadPalette2 
    LDX.W $0A74 
    LDA.W .pointers,X 
    TAX 
    JSR.W Load20BytesOfSamusPaletteInX 
    BRA .incSuperSpecialFlags 


.loadPalette2:
    JSL.L LoadSamusSuitPalette 

.incSuperSpecialFlags:
    INC.W $0A4A 
    RTS 


.acquiringHyperBeam:
    LDA.W $0B62 
    ASL A 
    TAY 
    LDA.W .hyperBeamPalettes,Y 
    TAX 
    JSR.W Load20BytesOfSamusPaletteInX 
    DEC.W $0AD0 
    BEQ .timerExpired 
    BPL .returnLower 

.timerExpired:
    LDA.W $0ACE 
    STA.W $0AD0 
    LDA.W $0B62 
    INC A 
    STA.W $0B62 
    CMP.W #$000A 
    BMI .returnLower 
    STZ.W $0B62 

.returnLower:
    RTS 


.pointers:
    dw SamusPalettes_PowerSuit_SpeedBoosting_BabyMetroidDrain_3 
    dw SamusPalettes_VariaSuit_SpeedBoosting_BabyMetroidDrain_3 
    dw SamusPalettes_GravitySuit_SpeedBoosting_BabyMetroidDrain_3 

.hyperBeamPalettes:
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

Handle_ScrewAttack_SpeedBoosting_Palette:
    LDA.W $0A74 
    BIT.W #$0004 
    BNE .nonLiquidPhysics 
    JSL.L Get_Samus_BottomTop_Boundary 
    LDA.W $195E 
    BMI .negativeYPosition 
    CMP.B $14 
    BPL .nonLiquidPhysics 
    LDA.W $197E 
    BIT.W #$0004 
    BNE .nonLiquidPhysics 
    BRA .whyAreWeHere 


.negativeYPosition:
    LDA.W $1962 
    BMI .nonLiquidPhysics 
    CMP.B $14 
    BMI .whyAreWeHere 

.nonLiquidPhysics:
    LDA.W $0A1F 
    AND.W #$00FF 
    CMP.W #$0003 
    BEQ .spinJumping 
    CMP.W #$0014 
    BEQ .wallJumping 

.notScrewAttacking:
    LDA.W $0B3E 
    AND.W #$FF00 
    CMP.W #$0400 
    BEQ .speedBoosting 

.whyAreWeHere:
    SEC 
    RTS 


.spinJumping:
    LDA.W $09A2 
    BIT.W #$0008 
    BEQ .notScrewAttacking 
    LDA.W $0A96 
    BEQ .resetIndex 
    CMP.W #$001B 
    BPL .returnNormalPalette 
    BRA .merge 


.wallJumping:
    LDA.W $09A2 
    BIT.W #$0008 
    BEQ .returnWallJump 
    LDA.W $0A96 
    CMP.W #$0003 
    BMI .resetIndex 

.merge:
    LDX.W $0A74 
    LDA.W .screwAttackPaletteTablePointers,X 
    STA.B $24 
    LDA.W $0ACE 
    CLC 
    ADC.B $24 
    TAX 
    LDA.W $0000,X 
    TAX 
    JSR.W Load20BytesOfSamusPaletteInX 
    LDA.W $0ACE 
    INC #2
    CMP.W #$000C 
    BMI .storeIndex 
    LDA.W #$0000 

.storeIndex:
    STA.W $0ACE 
    SEC 
    RTS 


.resetIndex:
    STZ.W $0ACE 

.returnWallJump:
    SEC 
    RTS 


.returnNormalPalette:
    CLC 
    RTS 


.screwAttackPaletteTablePointers:
    dw ..powerSuit 
    dw ..variaSuit 
    dw ..gravitySuit 

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
    DEC.W $0AD0 
    BEQ .timerExpired 
    BPL .returnSpeedBooster 

.timerExpired:
    LDA.W #$0004 
    STA.W $0AD0 
    LDX.W $0A74 
    LDA.W .speedBoosterPaletteTablePointers,X 
    STA.B $24 
    LDA.W $0ACE 
    CLC 
    ADC.B $24 
    TAX 
    LDA.W $0000,X 
    TAX 
    JSR.W Load20BytesOfSamusPaletteInX 
    LDA.W $0ACE 
    INC #2
    CMP.W #$0008 
    BMI .storeIndexSpeedBooster 
    LDA.W #$0006 

.storeIndexSpeedBooster:
    STA.W $0ACE 

.returnSpeedBooster:
    SEC 
    RTS 


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

HandleSpeedBoosterShinePalette:
    LDA.W $0A68 
    CMP.W #$00AA 
    BNE .notAA 
    PHA 
    LDA.W #$000C 
    JSL.L QueueSound_Lib3_Max9 
    PLA 

.notAA:
    DEC A 
    STA.W $0A68 
    BEQ .finish 
    BMI .finish 
    LDX.W $0A74 
    LDA.W .speedBoosterShinePaletteTablePointers,X 
    STA.B $24 
    LDA.W $0ACE 
    CLC 
    ADC.B $24 
    TAX 
    LDA.W $0000,X 
    TAX 
    JSR.W Load20BytesOfSamusPaletteInX 
    LDA.W $0ACE 
    INC #2
    CMP.W #$000C 
    BMI .storeIndex 
    LDA.W #$0000 

.storeIndex:
    STA.W $0ACE 
    SEC 
    RTS 


.finish:
    STZ.W $0ACE 
    STZ.W $0ACC 
    CLC 
    RTS 


.speedBoosterShinePaletteTablePointers:
    dw ..powerSuit 
    dw ..variaSuit 
    dw ..gravitySuit 

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

HandleShinesparkingPalette:
    LDA.W $0A68 
    DEC A 
    STA.W $0A68 
    BEQ .finish 
    BMI .finish 
    LDX.W $0A74 
    LDA.W .shinesparkPaletteTablePointers,X 
    STA.B $24 
    LDA.W $0ACE 
    CLC 
    ADC.B $24 
    TAX 
    LDA.W $0000,X 
    TAX 
    JSR.W Load20BytesOfSamusPaletteInX 
    LDA.W $0ACE 
    INC #2
    CMP.W #$0008 
    BMI .storeIndex 
    LDA.W #$0000 

.storeIndex:
    STA.W $0ACE 
    SEC 
    RTS 


.finish:
    STZ.W $0ACC 
    STZ.W $0ACE 
    CLC 
    RTS 


.shinesparkPaletteTablePointers:
    dw ..powerSuit 
    dw ..variaSuit 
    dw ..gravitySuit 

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

HandleCrystalFlashPalette:
    LDA.W $0A68 
    BMI .finish 
    DEC A 
    STA.W $0A68 
    BEQ .specialPaletteTimerExpired 
    BPL .bubbleEnd 

.specialPaletteTimerExpired:
    LDA.W #$0005 
    STA.W $0A68 
    LDX.W $0ACE 
    LDA.W .bubblePaletteTablePointers,X 
    TAY 
    JSR.W SetCrystalFlashBubbleColors 
    LDA.W $0ACE 
    INC #2
    CMP.W #$000C 
    BMI .storeIndex 
    LDA.W #$0000 

.storeIndex:
    STA.W $0ACE 

.bubbleEnd:
    DEC.W $0DF2 
    BEQ .CFPaletteTimerExpired 
    BPL .returnCarrySet 

.CFPaletteTimerExpired:
    LDX.W $0AD0 
    LDA.W .crystalFlashPaletteTable_timers,X 
    STA.W $0DF2 
    LDA.W .crystalFlashPaletteTable_pointers,X 
    TAY 
    JSR.W SetCrystalFlashSamusColors 
    LDA.W $0AD0 
    CLC 
    ADC.W #$0004 
    CMP.W #$0028 
    BMI .storeTimer 
    LDA.W #$0000 

.storeTimer:
    STA.W $0AD0 

.returnCarrySet:
    SEC 
    RTS 


.finish:
    LDA.W $09A6 
    JSL.L Load_Beam_Palette_Setup 
    STZ.W $0ACC 
    STZ.W $0ACE 
    STZ.W $0AD0 
    STZ.W $0A68 
    CLC 
    RTS 


.crystalFlashPaletteTable_pointers:
    dw SamusPalettes_CrystalFlash_0 

.crystalFlashPaletteTable_timers:
    dw $000A 
    dw SamusPalettes_CrystalFlash_1 
    dw $000A 
    dw SamusPalettes_CrystalFlash_2 
    dw $000A 
    dw SamusPalettes_CrystalFlash_3 
    dw $000A 
    dw SamusPalettes_CrystalFlash_4 
    dw $000A 
    dw SamusPalettes_CrystalFlash_5 
    dw $000A 
    dw SamusPalettes_CrystalFlash_4 
    dw $000A 
    dw SamusPalettes_CrystalFlash_3 
    dw $000A 
    dw SamusPalettes_CrystalFlash_2 
    dw $000A 
    dw SamusPalettes_CrystalFlash_1 
    dw $000A 

.bubblePaletteTablePointers:
    dw SamusPalettes_CrystalFlash_0_bubble 
    dw SamusPalettes_CrystalFlash_1_bubble 
    dw SamusPalettes_CrystalFlash_2_bubble 
    dw SamusPalettes_CrystalFlash_3_bubble 
    dw SamusPalettes_CrystalFlash_4_bubble 
    dw SamusPalettes_CrystalFlash_5_bubble 

SetCrystalFlashSamusColors:
    PHB 
    PEA.W $9B00 
    PLB 
    PLB 
    LDA.W $0000,Y 
    STA.L $7EC1C0 
    LDA.W $0002,Y 
    STA.L $7EC1C2 
    LDA.W $0004,Y 
    STA.L $7EC1C4 
    LDA.W $0006,Y 
    STA.L $7EC1C6 
    LDA.W $0008,Y 
    STA.L $7EC1C8 
    LDA.W $000A,Y 
    STA.L $7EC1CA 
    LDA.W $000C,Y 
    STA.L $7EC1CC 
    LDA.W $000E,Y 
    STA.L $7EC1CE 
    LDA.W $0010,Y 
    STA.L $7EC1D0 
    LDA.W $0012,Y 
    STA.L $7EC1D2 
    PLB 
    RTS 


SetCrystalFlashBubbleColors:
    PHB 
    PEA.W $9B00 
    PLB 
    PLB 
    LDA.W $0000,Y 
    STA.L $7EC1D4 
    LDA.W $0002,Y 
    STA.L $7EC1D6 
    LDA.W $0004,Y 
    STA.L $7EC1D8 
    LDA.W $0006,Y 
    STA.L $7EC1DA 
    LDA.W $0008,Y 
    STA.L $7EC1DC 
    LDA.W $000A,Y 
    STA.L $7EC1DE 
    PLB 
    RTS 


HandleXrayPalette:
    LDA.W $0A80 
    BMI .finish 
    BNE .paletteSet 
    LDA.W $0A7A 
    CMP.W #$0002 
    BPL .notWidening 
    DEC.W $0AD0 
    BEQ .timerExpired 
    BPL .returnCarrySet 

.timerExpired:
    LDA.W #$0005 
    STA.W $0AD0 
    LDX.W $0ACE 
    LDA.L SamusPalettes_Visor,X 
    STA.L $7EC188 
    LDA.W $0ACE 
    CMP.W #$0004 
    BPL .returnCarrySet 
    INC #2
    STA.W $0ACE 

.returnCarrySet:
    SEC 
    RTS 


.notWidening:
    LDA.W #$0006 
    STA.W $0ACE 
    LDA.W #$0001 
    STA.W $0AD0 
    STA.W $0A80 

.paletteSet:
    DEC.W $0AD0 
    BEQ .resetTimer 
    BPL .returnCarrySet 

.resetTimer:
    LDA.W #$0005 
    STA.W $0AD0 
    LDX.W $0ACE 
    LDA.L SamusPalettes_Visor,X 
    STA.L $7EC188 
    LDA.W $0ACE 
    INC #2
    CMP.W #$000C 
    BMI .storeIndex 
    LDA.W #$0006 

.storeIndex:
    STA.W $0ACE 
    SEC 
    RTS 


.finish:
    STZ.W $0ACC 
    STZ.W $0ACE 
    STZ.W $0AD0 
    STZ.W $0A80 
    CLC 
    RTS 


RTS_91DD31:
    RTS 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_91DD32:
    db $01,$00,$00,$01,$00,$00,$01,$00,$00,$01,$01,$00,$01,$00,$01,$00 
    db $01,$00,$01,$00,$01,$00,$01,$00,$01,$00 

UNUSED_SetSamusPaletteToSolidWhite_91DD4C:
    PHP 
    PHB 
    PHK 
    PLB 
    REP #$30 
    LDX.W #UNUSED_SamusPalettes_9B9500 
    JSR.W Load20BytesOfSamusPaletteInX 
    PLB 
    PLP 
    RTL 
endif ; !FEATURE_KEEP_UNREFERENCED


Load20BytesOfSamusPaletteInX:
    PHP 
    REP #$30 
    PHB 
    PEA.W $9B00 
    PLB 
    PLB 
    LDA.W $0000,X 
    STA.L $7EC180 
    LDA.W $0002,X 
    STA.L $7EC182 
    LDA.W $0004,X 
    STA.L $7EC184 
    LDA.W $0006,X 
    STA.L $7EC186 
    LDA.W $0008,X 
    STA.L $7EC188 
    LDA.W $000A,X 
    STA.L $7EC18A 
    LDA.W $000C,X 
    STA.L $7EC18C 
    LDA.W $000E,X 
    STA.L $7EC18E 
    LDA.W $0010,X 
    STA.L $7EC190 
    LDA.W $0012,X 
    STA.L $7EC192 
    LDA.W $0014,X 
    STA.L $7EC194 
    LDA.W $0016,X 
    STA.L $7EC196 
    LDA.W $0018,X 
    STA.L $7EC198 
    LDA.W $001A,X 
    STA.L $7EC19A 
    LDA.W $001C,X 
    STA.L $7EC19C 
    LDA.W $001E,X 
    STA.L $7EC19E 
    PLB 
    PLP 
    RTS 


Load20BytesOfSamusTargetPaletteInX:
    PHP 
    REP #$30 
    PHB 
    PEA.W $9B00 
    PLB 
    PLB 
    LDA.W $0000,X 
    STA.L $7EC380 
    LDA.W $0002,X 
    STA.L $7EC382 
    LDA.W $0004,X 
    STA.L $7EC384 
    LDA.W $0006,X 
    STA.L $7EC386 
    LDA.W $0008,X 
    STA.L $7EC388 
    LDA.W $000A,X 
    STA.L $7EC38A 
    LDA.W $000C,X 
    STA.L $7EC38C 
    LDA.W $000E,X 
    STA.L $7EC38E 
    LDA.W $0010,X 
    STA.L $7EC390 
    LDA.W $0012,X 
    STA.L $7EC392 
    LDA.W $0014,X 
    STA.L $7EC394 
    LDA.W $0016,X 
    STA.L $7EC396 
    LDA.W $0018,X 
    STA.L $7EC398 
    LDA.W $001A,X 
    STA.L $7EC39A 
    LDA.W $001C,X 
    STA.L $7EC39C 
    LDA.W $001E,X 
    STA.L $7EC39E 
    PLB 
    PLP 
    RTS 


Cancel_SpeedBoosting:
    PHP 
    PHB 
    PHK 
    PLB 
    REP #$30 
    LDA.W $0B3C 
    BEQ .merge 
    STZ.W $0B3C 
    STZ.W $0B3E 
    STZ.W $0ACE 
    STZ.W $0AD0 
    LDA.W $09A2 
    BIT.W #$0020 
    BNE .gravity 
    BIT.W #$0001 
    BNE .varia 
    LDX.W #SamusPalettes_PowerSuit 
    JSR.W Load20BytesOfSamusPaletteInX 
    BRA .merge 


.varia:
    LDX.W #SamusPalettes_VariaSuit 
    JSR.W Load20BytesOfSamusPaletteInX 
    BRA .merge 


.gravity:
    LDX.W #SamusPalettes_GravitySuit 
    JSR.W Load20BytesOfSamusPaletteInX 

.merge:
    LDA.W $0AAE 
    BMI .return 
    LDA.W #$FFFF 
    STA.W $0AAE 
    LDA.W $0A1E 
    AND.W #$00FF 
    CMP.W #$0004 
    BEQ .negative8 
    LDA.W #$0008 
    STA.W $0AC0 
    STA.W $0AC2 
    BRA .return 


.negative8:
    LDA.W #$FFF8 
    STA.W $0AC0 
    STA.W $0AC2 

.return:
    PLB 
    PLP 
    RTL 


LoadSamusSuitPalette:
    PHP 
    PHB 
    PHK 
    PLB 
    REP #$30 
    LDA.W $09A2 
    BIT.W #$0020 
    BNE .gravitySuit 
    BIT.W #$0001 
    BNE .variaSuit 
    LDX.W #SamusPalettes_PowerSuit 
    JSR.W Load20BytesOfSamusPaletteInX 
    BRA .return 


.variaSuit:
    LDX.W #SamusPalettes_VariaSuit 
    JSR.W Load20BytesOfSamusPaletteInX 
    BRA .return 


.gravitySuit:
    LDX.W #SamusPalettes_GravitySuit 
    JSR.W Load20BytesOfSamusPaletteInX 

.return:
    PLB 
    PLP 
    RTL 


LoadSamusSuitTargetPalette:
    PHP 
    PHB 
    PHK 
    PLB 
    REP #$30 
    LDA.W $09A2 
    BIT.W #$0020 
    BNE .gravitySuit 
    BIT.W #$0001 
    BNE .variaSuit 
    LDX.W #SamusPalettes_PowerSuit 
    JSR.W Load20BytesOfSamusTargetPaletteInX 
    BRA .return 


.variaSuit:
    LDX.W #SamusPalettes_VariaSuit 
    JSR.W Load20BytesOfSamusTargetPaletteInX 
    BRA .return 


.gravitySuit:
    LDX.W #SamusPalettes_GravitySuit 
    JSR.W Load20BytesOfSamusTargetPaletteInX 

.return:
    PLB 
    PLP 
    RTL 


Restore_A_Energy_ToSamus:
    PHP 
    PHB 
    PHK 
    PLB 
    REP #$30 
    STA.B $12 
    LDA.W $09C2 
    CLC 
    ADC.B $12 
    STA.W $09C2 
    CMP.W $09C4 
    BMI .return 
    SEC 
    SBC.W $09C4 
    CLC 
    ADC.W $09D6 
    CMP.W $09D4 
    BMI .maxReserve 
    LDA.W $09D4 

.maxReserve:
    STA.W $09D6 
    BEQ .maxEnergy 
    LDA.W $09C0 
    BNE .maxEnergy 
    LDA.W #$0001 
    STA.W $09C0 

.maxEnergy:
    LDA.W $09C4 
    STA.W $09C2 

.return:
    PLB 
    PLP 
    RTL 


Deal_A_Damage_to_Samus:
    PHP 
    PHB 
    PHK 
    PLB 
    REP #$30 
    PHX 
    STA.B $12 
    TAX 
    BPL .noCrash 
    JML.L Crash_Handler 


.noCrash:
    CMP.W #$012C 
    BEQ .noDamage 
    LDA.W $0A78 
    BNE .return 
    LDA.W $09C2 
    SEC 
    SBC.B $12 
    STA.W $09C2 
    BPL .return 
    STZ.W $09C2 

.return:
    PLX 
    PLB 
    PLP 
    RTL 


.noDamage:
    NOP ; >.<
    BRA .return 


Restore_A_Missiles_ToSamus:
    PHP 
    PHB 
    PHK 
    PLB 
    REP #$30 
    CLC 
    ADC.W $09C6 
    STA.W $09C6 
    CMP.W $09C8 
    BMI .return 
    SEC 
    SBC.W $09C8 
    STA.B $12 
    LDA.W $09C8 
    CMP.W #$0063 
    BMI .lessThan99 
    LDA.B $12 
    CLC 
    ADC.W $09D8 
    STA.W $09D8 
    CMP.W #$0063 
    BMI .maxMissiles 
    LDA.W #$0063 
    STA.W $09D8 
    BRA .maxMissiles 


.lessThan99:
    LDA.B $12 
    CLC 
    ADC.W $09D8 
    STA.W $09D8 
    CMP.W $09C8 
    BMI .maxMissiles 
    LDA.W $09C8 
    STA.W $09D8 

.maxMissiles:
    LDA.W $09C8 
    STA.W $09C6 

.return:
    PLB 
    PLP 
    RTL 


Restore_A_SuperMissiles_ToSamus:
    PHP 
    PHB 
    PHK 
    PLB 
    REP #$30 
    CLC 
    ADC.W $09CA 
    STA.W $09CA 
    CMP.W $09CC 
    BMI .return 
    BEQ .return 
    LDA.W $09CC 
    STA.W $09CA 

.return:
    PLB 
    PLP 
    RTL 


Restore_A_PowerBombs_ToSamus:
    PHP 
    PHB 
    PHK 
    PLB 
    REP #$30 
    CLC 
    ADC.W $09CE 
    STA.W $09CE 
    CMP.W $09D0 
    BMI .return 
    BEQ .return 
    LDA.W $09D0 
    STA.W $09CE 

.return:
    PLB 
    PLP 
    RTL 


InitializeSamus:
    PHP 
    PHB 
    PHK 
    PLB 
    REP #$30 
    LDA.W $0DE0 
    STA.B $12 
    LDX.W #$0E0B 
    SEP #$20 
    LDA.B #$00 

.loopClearSamusRAM:
    STA.W $0000,X 
    DEX 
    CPX.W #$0A02 
    BPL .loopClearSamusRAM 
    REP #$20 
    LDA.W $0998 
    CMP.W #$0028 
    BEQ .demo 
    LDA.L $7ED914 
    CMP.W #$0022 
    BNE .notZebesLanding 
    LDA.W #RTL_90E8CD 
    STA.W $0A42 
    LDA.W #SamusNewStateHandler_SamusIsLocked 
    STA.W $0A44 
    LDA.W #SamusDrawingHandler_Default 
    STA.W $0A5C 
    LDA.W #$FFFF 
    STA.W $0A2E 
    STZ.W $0A30 
    STZ.W $0A32 
    JSL.L LoadSamusSuitPalette 
    LDA.W #SamusPoseInputHandler_Normal 
    STA.W $0A60 
    BRA .demo 


.notZebesLanding:
    LDA.W #RTL_90E8CD 
    STA.W $0A42 
    LDA.W #SamusNewStateHandler_SamusAppearance 
    STA.W $0A44 
    LDA.W #SamusDrawingHandler_Default 
    STA.W $0A5C 
    STZ.W $0A2E 
    STZ.W $0A30 
    STZ.W $0A32 
    LDA.W #SamusPoseInputHandler_Normal 
    STA.W $0A60 
    LDA.B $12 
    STA.W $0DE0 

.demo:
    LDA.W #$FFFF 
    STA.W $0A28 
    STA.W $0A2A 
    STA.W $0A2C 
    LDA.W $079F 
    CMP.W #$0006 
    BNE .notCeres 
    LDA.W #SamusTimerHackHandler_HandleTimer 
    STA.W $0A5A 
    BRA + 


.notCeres:
    LDA.W #RTS_90E90E 
    STA.W $0A5A 

  + LDA.W #SamusMovementHandler_Normal 
    STA.W $0A58 
    LDA.W #RTS_90F534 
    STA.W $0A5E 
    LDA.W #$0032 
    STA.W $0A12 
    LDA.W #$0601 
    STA.W $0A72 
    LDX.W #$0000 

.loopProjectilePreInstructions:
    LDA.W #RTS_90B169 
    STA.W $0C68,X 
    INX #2
    CPX.W #$0014 
    BMI .loopProjectilePreInstructions 
    LDA.W #GrappleBeamFunction_Inactive 
    STA.W $0D32 
    LDA.W #$0003 
    STA.W $0A46 
    STZ.W $0A48 
    STZ.W $0A4A 
    LDA.L SamusPhysicsConstants_CameraXSubOffsetFromSamusWhenTurning 
    STA.W $0DA4 
    LDA.L SamusPhysicsConstants_CameraXOffsetFromSamusWhenTurning 
    STA.W $0DA2 
    LDA.L SamusPhysicsConstants_CameraYSubOffsetFromSamusWhenTurning 
    STA.W $0DA8 
    LDA.L SamusPhysicsConstants_CameraYOffsetFromSamusWhenTurning 
    STA.W $0DA6 
    LDX.W #$01FE 
    LDA.W #$00FF 

.loopSamusHDMATables:
    STA.L $7E9800,X 
    DEX #2
    BPL .loopSamusHDMATables 
    LDA.L SamusPhysicsConstants_YSubAccelerationInAir 
    STA.W $0B32 
    LDA.L SamusPhysicsConstants_YAccelerationInAir 
    STA.W $0B34 
    LDA.W #$FFFF 
    STA.W $195E 
    STA.W $1962 
    JSL.L Update_Beam_Tiles_and_Palette 
    STZ.W $1F51 
    STZ.W $0A1C 
    STZ.W $0A1E 
    STZ.W $0A20 
    STZ.W $0A22 
    STZ.W $0A24 
    STZ.W $0A26 
    LDA.W #$FFFF 
    STA.W $0E1C 
    STZ.W $09D2 
    STZ.W $0A04 
    STZ.W $18A8 
    STZ.W $18AA 
    STZ.W $0A48 
    STZ.W $0DE0 
    LDA.W $0998 
    CMP.W #$0028 
    BNE .notDemo 
    JSR.W LoadDemoData 

.notDemo:
    LDA.W $09C2 
    STA.W $0A12 
    PLB 
    PLP 
    RTL 


XraySetup:
    PHP 
    PHB 
    PHK 
    PLB 
    REP #$30 
    LDA.W $0CCC 
    CMP.W #$0007 
    BNE + 
    LDA.W $0CD2 
    CMP.W #$0005 
    BNE + 
    LDA.W $0A66 
    CMP.W #$0002 
    BEQ .returnCarryClear 

  + LDA.W $0A1C 
    CMP.W #$00A4 
    BMI .notLanding 
    CMP.W #$00A8 
    BMI .returnCarryClear 
    CMP.W #$00E0 
    BMI .notLanding 
    CMP.W #$00E8 
    BMI .returnCarryClear 

.notLanding:
    LDA.W $0998 
    CMP.W #$0008 
    BNE .returnCarryClear 
    LDA.W $0592 
    BNE .returnCarryClear 
    LDA.W $0B2E 
    BNE .returnCarryClear 
    LDA.W $0B2C 
    BNE .returnCarryClear 
    LDA.W $0A11 
    AND.W #$00FF 
    TAX 
    LDA.W .allowedPoses,X 
    AND.W #$00FF 
    BEQ .returnCarryClear 
    LDA.W $0A1F 
    AND.W #$00FF 
    TAX 
    LDA.W .allowedPoses,X 
    AND.W #$00FF 
    CMP.W #$0001 
    BEQ .standing 
    CMP.W #$0002 
    BEQ .crouching 

.returnCarryClear:
    PLB 
    PLP 
    CLC 
    RTL 


.standing:
    LDA.W $0A1E 
    AND.W #$00FF 
    CMP.W #$0004 
    BEQ .standingLeft 
    LDA.W #$00D5 
    STA.W $0A2A 
    BRA .merge 


.standingLeft:
    LDA.W #$00D6 
    STA.W $0A2A 
    BRA .merge 


.crouching:
    LDA.W $0A1E 
    AND.W #$00FF 
    CMP.W #$0004 
    BEQ .crouchingLeft 
    LDA.W #$00D9 
    STA.W $0A2A 
    BRA .merge 


.crouchingLeft:
    LDA.W #$00DA 
    STA.W $0A2A 

.merge:
    LDA.W #$0001 
    STA.W $0A78 
    LDA.W #$0005 
    STA.W $0A30 
    LDX.W #$01FE 

.loop:
    LDA.W #$00FF 
    STA.L $7E9800,X 
    DEX #2
    BPL .loop 
    JSL.L Disable_Enemy_Projectiles 
    JSL.L Disable_PLMs 
    JSL.L Disable_AnimatedTilesObjects 
    JSL.L Disable_PaletteFXObjects 
    LDA.W #$0001 
    STA.W $0A88 
    LDA.W #$9800 ; $7E
    STA.W $0A89 
    STZ.W $0A8B 
    LDA.W #$98C8 ; $7E
    STA.W $0A8C 
    LDA.W #$0098 
    STA.W $0A8E 
    LDA.W #$9990 ; $7E
    STA.W $0A8F 
    STZ.W $0A91 
    STZ.W $0A7A 
    STZ.W $0A7C 
    STZ.W $0A7E 
    STZ.W $0A84 
    STZ.W $0A86 
    LDA.W $0A1E 
    AND.W #$00FF 
    CMP.W #$0004 
    BEQ + 
    LDA.W #$0040 
    STA.W $0A82 
    BRA .returnCarrySet 


  + LDA.W #$00C0 

.facingLeft:
    STA.W $0A82 

.returnCarrySet:
    PLB 
    PLP 
    SEC 
    RTL 


.allowedPoses:
    db $01,$01,$00,$00,$00,$02,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00 
    db $00,$00,$00,$00,$00,$01,$00,$00,$00,$00,$00,$00 

Set_NonXray_SamusPose:
    PHP 
    REP #$30 
    LDA.W $0A1F 
    AND.W #$00FF 
    CMP.W #$0005 
    BEQ .crouching 
    LDA.W $0A1E 
    AND.W #$00FF 
    CMP.W #$0004 
    BEQ .facingLeft 
    LDA.W #$0001 
    STA.W $0A1C 
    BRA .merge 


.facingLeft:
    LDA.W #$0002 
    STA.W $0A1C 
    BRA .merge 


.crouching:
    LDA.W $0A1E 
    AND.W #$00FF 
    CMP.W #$0004 
    BEQ .crouchingFacingLeft 
    LDA.W #$0027 
    STA.W $0A1C 
    BRA .merge 


.crouchingFacingLeft:
    LDA.W #$0028 
    STA.W $0A1C 

.merge:
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
    LDA.W #SamusMovementHandler_Normal 
    STA.W $0A58 
    LDA.W #SamusPoseInputHandler_Normal 
    STA.W $0A60 
    LDA.W #$FFFF 
    STA.W $0A80 
    LDA.W $0A1C 
    ASL #3
    TAX 
    LDA.L PoseDefinitions_YRadius,X 
    AND.W #$00FF 
    SEC 
    SBC.W $0B00 
    STA.B $12 
    BMI .unfreezeEnvironment 
    LDA.W $0AFA 
    SEC 
    SBC.B $12 
    STA.W $0AFA 
    STA.W $0B14 

.unfreezeEnvironment:
    JSL.L Enable_Enemy_Projectiles 
    JSL.L Enable_PLMs 
    JSL.L Enable_AnimatedTilesObjects 
    JSL.L Enable_PaletteFXObjects 
    PLP 
    RTL 


Debug_HandleSelectL_B:
    PHP 
    REP #$30 
    LDA.W $05C5 
    AND.W #$8000 
    BNE .checkTileViewer 
    JMP.W .handledInput 


.checkTileViewer:
    LDA.W $0DF6 
    BEQ .toggleOn 
    JMP.W .toggleOff 


.toggleOn:
    LDA.W #$0001 
    STA.W $0DF6 
    LDA.W $09A6 
    INC A 
    STA.W $09A6 
    AND.W #$0FFF 
    CMP.W #$000C 
    BMI + 
    LDA.W $09A6 
    AND.W #$F000 
    STA.W $09A6 

  + JSL.L Update_Beam_Tiles_and_Palette 
    LDA.W #$F33F ; Same extra bit (10) as GT Code
    STA.W $09A4 
    STA.W $09A2 
    LDA.W #$0384 
    STA.W $09C8 
    STA.W $09C6 
    LDA.W #$005A 
    STA.W $09CC 
    STA.W $09CA 
    LDA.W #$005A 
    STA.W $09D0 
    STA.W $09CE 
    LDA.W #$044B 
    STA.W $09C4 
    STA.W $09C2 
    LDA.W #$01F3 
    STA.W $09D6 
    STZ.W $09D8 
    LDA.W #$100F 
    STA.W $09A8 
    LDA.W $09A6 
    ORA.W #$1000 
    STA.W $09A6 
    JSL.L AddGrappleToHUDTilemap 
    JSL.L AddXrayToHUDTilemap 
    JSL.L AddMissilesToHUDTilemap 
    JSL.L AddSuperMissilesToHUDTilemap 
    JSL.L AddPowerBombsToHUDTilemap 
    BRA .handledInput 


.toggleOff:
    STZ.W $0DF6 

.handledInput:
    LDA.W $0DF6 
    BEQ .return 
    JSL.L Debug_SamusTileViewer 

.return:
    PLP 
    RTL 


MakeSamusFaceForward:
    PHP 
    PHB 
    PHK 
    PLB 
    REP #$30 
    PHX 
    LDA.W $09A2 
    BIT.W #$0020 
    BNE .suited 
    BIT.W #$0001 
    BNE .suited 
    LDA.W #$0000 
    STA.W $0A1C 
    BRA .initSamus 


.suited:
    LDA.W #$009B 
    STA.W $0A1C 

.initSamus:
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
    LDA.W $0B00 
    CMP.W #$0018 
    BEQ .facingForwardRadius18 
    LDA.W $0AFA 
    SEC 
    SBC.W #$0003 
    STA.W $0AFA 
    STA.W $0B14 

.facingForwardRadius18:
    LDA.W #SamusCurrentStateHandler_SamusIsLocked 
    STA.W $0A42 
    LDA.W #SamusNewStateHandler_SamusIsLocked 
    STA.W $0A44 
    LDA.W #$FFFF 
    STA.W $0A28 
    STA.W $0A2A 
    STA.W $0A2C 
    STZ.W $0A2E 
    STZ.W $0A30 
    STZ.W $0A32 
    LDA.W #$001F 
    JSL.L Run_Samus_Command 
    STZ.W $0B42 
    STZ.W $0B44 
    STZ.W $0B46 
    STZ.W $0B48 
    STZ.W $0B2C 
    STZ.W $0B2E 
    STZ.W $0B36 
    STZ.W $0B20 
    STZ.W $0B4A 
    STZ.W $0CD0 
    STZ.W $0CD6 
    STZ.W $0CD8 
    STZ.W $0CDA 
    STZ.W $0CDC 
    STZ.W $0CDE 
    STZ.W $0CE0 
    JSL.L LoadSamusSuitPalette 
    PLX 
    PLB 
    PLP 
    RTL 


DrainedSamusController:
    PHP 
    PHB 
    PHK 
    PLB 
    REP #$30 
    PHX 
    PHY 
    ASL A 
    TAX 
    JSR.W (.pointers,X) 
    BCC .return 
    LDA.W $0A20 
    STA.W $0A24 
    LDA.W $0A22 
    STA.W $0A26 
    LDA.W $0A1C 
    STA.W $0A20 
    LDA.W $0A1E 
    STA.W $0A22 
    LDA.W #$FFFF 
    STA.W $0A28 
    STA.W $0A2A 
    STA.W $0A2C 
    STZ.W $0A2E 
    STZ.W $0A30 
    STZ.W $0A32 

.return:
    PLY 
    PLX 
    PLB 
    PLP 
    RTL 


.pointers:
    dw DrainedSamusController_0_LetDrainedSamusFall 
    dw DrainedSamusController_1_PutSamusIntoStandingDrainedPose 
    dw DrainedSamusController_2_ReleaseSamusFromDrainedPose 
    dw DrainedSamusController_3_EnableHyperBeam 
    dw DrainedSamusController_4_SetSamusCrouchingFallingDrainedPose 

DrainedSamusController_0_LetDrainedSamusFall:
    LDA.W #$0015 
    SEC 
    SBC.W $0B00 
    STA.B $12 
    LDA.W $0AFA 
    SEC 
    SBC.B $12 
    STA.W $0AFA 
    STA.W $0B14 
    LDA.W $0A1E 
    AND.W #$00FF 
    CMP.W #$0004 
    BEQ .facingLeft 
    LDA.W #$00E8 
    STA.W $0A1C 
    BRA + 


.facingLeft:
    LDA.W #$00E9 
    STA.W $0A1C 

  + LDA.W #$0002 
    STA.W $0A9A 
    JSL.L InitializeSamusPose_1 
    JSL.L Set_Samus_AnimationFrame_if_PoseChanged 
    LDA.W $0A1C 
    ASL #3
    TAX 
    LDA.W PoseDefinitions_YRadius,X 
    AND.W #$00FF 
    STA.W $0B00 
    STZ.W $0B46 
    STZ.W $0B48 
    STZ.W $0B2C 
    STZ.W $0B2E 
    LDA.W #$0002 
    STA.W $0B36 
    STZ.W $0CD0 
    STZ.W $0CD6 
    STZ.W $0CD8 
    STZ.W $0CDA 
    STZ.W $0CDC 
    STZ.W $0CDE 
    STZ.W $0CE0 
    JSL.L LoadSamusSuitPalette 
    SEC 
    RTS 


DrainedSamusController_1_PutSamusIntoStandingDrainedPose:
    LDA.W #$0010 
    STA.W $0A94 
    STZ.W $0A96 
    LDA.W $0A1E 
    AND.W #$00FF 
    CMP.W #$0004 
    BEQ .facingLeft 
    LDA.W #$00EA 
    STA.W $0A1C 
    BRA + 


.facingLeft:
    LDA.W #$00EB 
    STA.W $0A1C 

  + LDA.W #RTS_90E90E 
    STA.W $0A5A 
    SEC 
    RTS 


DrainedSamusController_2_ReleaseSamusFromDrainedPose:
    LDA.W $0A1C 
    CMP.W #$00E8 
    BEQ .crouchingFalling 
    CMP.W #$00E9 
    BEQ .crouchingFalling 
    CMP.W #$00EA 
    BEQ .drainedStanding 
    CMP.W #$00EB 
    BNE .merge 

.drainedStanding:
    LDA.W #$0001 
    STA.W $0A94 
    LDA.W #$0004 
    STA.W $0A96 
    BRA .merge 


.crouchingFalling:
    LDA.W #$0001 
    STA.W $0A94 
    LDA.W #$000D 
    STA.W $0A96 

.merge:
    LDA.W $0A1C 
    ASL #3
    TAX 
    LDA.W PoseDefinitions_YRadius,X 
    AND.W #$00FF 
    STA.W $0B00 
    STZ.W $0B46 
    STZ.W $0B48 
    STZ.W $0B2C 
    STZ.W $0B2E 
    LDA.W #$0002 
    STA.W $0B36 
    SEC 
    RTS 


DrainedSamusController_3_EnableHyperBeam:
    LDA.W #$1009 
    STA.W $09A6 
    JSL.L Update_Beam_Tiles_and_Palette 
    LDY.W #PaletteFXObjects_HyperBeam 
    JSL.L Spawn_PaletteFXObject 
    LDA.W #$8000 
    STA.W $0A76 
    STZ.W $0DC0 
    CLC 
    RTS 


DrainedSamusController_4_SetSamusCrouchingFallingDrainedPose:
    LDA.W #$0010 
    STA.W $0A94 
    LDA.W #$0008 
    STA.W $0A96 
    LDA.W $0A1E 
    AND.W #$00FF 
    CMP.W #$0004 
    BEQ .facingLeft 
    LDA.W #$00E8 
    STA.W $0A1C 
    SEC 
    RTS 


.facingLeft:
    LDA.W #$00E9 
    STA.W $0A1C 
    SEC 
    RTS 


UpdateSamusPoseDueToChangeOfEquipment:
    PHP 
    PHB 
    PHK 
    PLB 
    REP #$30 
    LDA.W $0A1F 
    AND.W #$00FF 
    ASL A 
    TAX 
    JSR.W (.pointers,X) 
    LDA.W $09A2 
    BIT.W #$2000 
    BNE .speedBoosterEquipped 
    STZ.W $0AAE 
    STZ.W $0AC0 
    STZ.W $0AC2 
    STZ.W $0B3C 
    STZ.W $0B3E 
    STZ.W $0ACE 
    STZ.W $0AD0 
    STZ.W $0AB0 
    STZ.W $0AB2 
    STZ.W $0AB8 
    STZ.W $0ABA 
    BRA + 


.speedBoosterEquipped:
    LDA.W $0B3C 
    BEQ + 
    LDA.W $0B3E 
    BNE + 
    STA.W $0AD0 
    STZ.W $0ACE 
    LDA.W SpeedBoostTimerResetValues 
    STA.W $0B3E 

  + LDA.W $0D32 
    CMP.W #GrappleBeamFunction_Inactive 
    BEQ .checkCharge 
    LDA.W #$0002 
    JSL.L Load_Beam_Palette_External 
    LDA.W #$0006 
    JSL.L QueueSound_Lib1_Max6 
    BRA .playedSFX 


.checkCharge:
    LDA.W $09A6 
    BIT.W #$1000 
    BNE .chargeEquipped 
    STZ.W $0CD0 
    STZ.W $0CD6 
    STZ.W $0CD8 
    STZ.W $0CDA 
    STZ.W $0CDC 
    STZ.W $0CDE 
    STZ.W $0CE0 
    BRA .playedSFX 


.chargeEquipped:
    LDA.W $0CD0 
    CMP.W #$0010 
    BMI .playedSFX 
    LDA.W #$0041 
    JSL.L QueueSound_Lib1_Max6 

.playedSFX:
    JSL.L LoadSamusSuitPalette 
    LDA.W $09C2 
    CMP.W #$001F 
    BPL .return 
    LDA.W #$0002 
    JSL.L QueueSound_Lib3_Max6 

.return:
    PLB 
    PLP 
    RTL 


.pointers:
    dw UpdateSamusPoseEquipment_Standing 
    dw RTS_91E732 
    dw RTS_91E732 
    dw UpdateSamusPoseEquipment_SpinJumping 
    dw UpdateSamusPoseEquipment_MorphBall 
    dw RTS_91E732 
    dw RTS_91E732 
    dw RTS_91E732 
    dw UpdateSamusPoseEquipment_MorphBall 
    dw RTS_91E732 
    dw RTS_91E732 
    dw RTS_91E732 
    dw RTS_91E732 
    dw RTS_91E732 
    dw RTS_91E732 
    dw RTS_91E732 
    dw RTS_91E732 
    dw UpdateSamusPoseEquipment_SpringBall 
    dw UpdateSamusPoseEquipment_SpringBall 
    dw UpdateSamusPoseEquipment_SpringBall 
    dw UpdateSamusPoseEquipment_WallJumping 
    dw RTS_91E732 
    dw RTS_91E732 
    dw RTS_91E732 
    dw RTS_91E732 
    dw RTS_91E732 
    dw RTS_91E732 
    dw RTS_91E732 

UpdateSamusPreviousPose:
    LDA.W $0A20 
    STA.W $0A24 
    LDA.W $0A22 
    STA.W $0A26 
    LDA.W $0A1C 
    STA.W $0A20 
    LDA.W $0A1E 
    STA.W $0A22 
    RTS 


RTS_91E732:
    RTS 


UpdateSamusPoseEquipment_Standing:
    LDA.W $0A1C 
    CMP.W #$0000 ; >.<
    BEQ .facingForward 
    CMP.W #$009B 
    BEQ .suited 
    RTS 


.facingForward:
    LDA.W $09A2 
    BIT.W #$0001 
    BNE .upgradeSuit 
    BIT.W #$0020 
    BNE .upgradeSuit 
    RTS 


.upgradeSuit:
    LDA.W #$009B 
    STA.W $0A1C 
    BRA .poseChanged 


.suited:
    LDA.W $09A2 
    BIT.W #$0001 
    BNE .return 
    BIT.W #$0020 
    BNE .return 
    LDA.W #$0000 
    STA.W $0A1C 

.poseChanged:
    JSL.L InitializeSamusPose_1 
    JSL.L Set_Samus_AnimationFrame_if_PoseChanged 
    JSR.W UpdateSamusPreviousPose 

.return:
    RTS 


UpdateSamusPoseEquipment_SpinJumping:
    LDA.W $0A1E 
    AND.W #$00FF 
    CMP.W #$0004 
    BEQ .facingLeft 
    LDA.W #$0108 
    STA.W $0A22 
    BRA .checkSpaceScrew 


.facingLeft:
    LDA.W #$0104 
    STA.W $0A22 

.checkSpaceScrew:
    LDA.W $0A1C 
    CMP.W #$0081 
    BEQ .screwAttack 
    CMP.W #$0082 
    BEQ .screwAttack 
    CMP.W #$001B 
    BEQ .spaceJump 
    CMP.W #$001C 
    BEQ .spaceJump 
    BRA .merge 


.spaceJump:
    LDA.W $09A2 
    BIT.W #$0008 
    BNE .changeToScrewAttack 
    BIT.W #$0200 
    BEQ .changeToSpinJump 
    BRA .merge 


.screwAttack:
    LDA.W $09A2 
    BIT.W #$0008 
    BNE .merge 
    BIT.W #$0200 
    BNE .changeToSpaceJump 
    BRA .changeToSpinJump 


.changeToScrewAttack:
    LDA.W $0A1E 
    AND.W #$00FF 
    CMP.W #$0004 
    BEQ ..facingLeft 
    LDA.W #$0081 
    STA.W $0A1C 
    BRA .merge 


..facingLeft:
    LDA.W #$0082 
    STA.W $0A1C 
    BRA .merge 


.changeToSpaceJump:
    LDA.W $0A1E 
    AND.W #$00FF 
    CMP.W #$0004 
    BEQ ..facingLeft 
    LDA.W #$001B 
    STA.W $0A1C 
    BRA .merge 


..facingLeft:
    LDA.W #$001C 
    STA.W $0A1C 
    BRA .merge 


.changeToSpinJump:
    LDA.W $0A1E 
    AND.W #$00FF 
    CMP.W #$0004 
    BEQ ..facingLeft 
    LDA.W #$0019 
    STA.W $0A1C 
    BRA .merge 


..facingLeft:
    LDA.W #$001A 
    STA.W $0A1C 

.merge:
    JSL.L InitializeSamusPose_1 
    JSL.L Set_Samus_AnimationFrame_if_PoseChanged 
    LDA.W $0A1E 
    AND.W #$00FF 
    CMP.W #$0004 
    BEQ ..facingLeft 
    LDA.W #$0308 
    STA.W $0A22 
    BRA + 


..facingLeft:
    LDA.W #$0304 
    STA.W $0A22 

  + JSR.W UpdateSamusPreviousPose 
    RTS 


UpdateSamusPoseEquipment_MorphBall:
    LDA.W $09A2 
    BIT.W #$0002 
    BEQ .return 
    LDA.W $0A1E 
    AND.W #$00FF 
    CMP.W #$0004 
    BEQ .facingLeft 
    LDA.W #$0079 
    STA.W $0A1C 
    BRA + 


.facingLeft:
    LDA.W #$007A 
    STA.W $0A1C 

  + JSL.L InitializeSamusPose_1 
    JSL.L Set_Samus_AnimationFrame_if_PoseChanged 
    JSR.W UpdateSamusPreviousPose 

.return:
    RTS 


UpdateSamusPoseEquipment_SpringBall:
    LDA.W $09A2 
    BIT.W #$0002 
    BNE .return 
    LDA.W $0A1E 
    AND.W #$00FF 
    CMP.W #$0004 
    BEQ .facingLeft 
    LDA.W #$001D 
    STA.W $0A1C 
    BRA + 


.facingLeft:
    LDA.W #$0041 
    STA.W $0A1C 

  + JSL.L InitializeSamusPose_1 
    JSL.L Set_Samus_AnimationFrame_if_PoseChanged 
    JSR.W UpdateSamusPreviousPose 

.return:
    RTS 


UpdateSamusPoseEquipment_WallJumping:
    LDA.W $09A2 
    BIT.W #$0008 
    BNE .screwAttack 
    BIT.W #$0200 
    BNE .spaceJump 
    LDA.W #$0003 
    STA.W $0A96 
    RTS 


.spaceJump:
    LDA.W #$000D 
    STA.W $0A96 
    RTS 


.screwAttack:
    LDA.W #$0017 
    STA.W $0A96 
    RTS 


SetProspectiveSamusPoseAccordingToSolidVerticalCollision_PSP:
    PHP 
    PHB 
    PHK 
    PLB 
    REP #$30 
    LDA.W $0DC6 
    BEQ .return 
    AND.W #$00FF 
    ASL A 
    TAX 
    JSR.W (.pointers,X) 

.return:
    PLB 
    PLP 
    RTL 


.pointers:
    dw RTS_91EFC3 
    dw PSP_Landed 
    dw PSP_Falling 
    dw UNUSED_PSP_91E8D8 
    dw PSP_HitCeiling 
    dw PSP_WallJumpTriggered 

UNUSED_PSP_91E8D8:
    LDA.W $0A1C 
    STA.W $0A28 
    LDA.W #$0005 
    STA.W $0A2E 
    RTS 


PSP_HitCeiling:
    LDA.W $0A1C 
    STA.W $0A28 
    LDA.W #$0005 
    STA.W $0A2E 
    RTS 


PSP_Falling:
    LDA.W $0DC7 
    AND.W #$00FF 
    CMP.W #$0004 
    BNE .changed 
    RTS 


.changed:
    ASL #2
    TAX 
    LDA.W $0A1E 
    AND.W #$00FF 
    CMP.W #$0004 
    BEQ .facingLeft 
    LDA.W .right,X 
    STA.W $0A28 
    BRA + 


.facingLeft:
    LDA.W .left,X 
    STA.W $0A28 

  + LDA.W #$0005 
    STA.W $0A2E 
    RTS 


.right:
    dw $0029 

.left:
    dw $002A,$0031,$0032,$0033,$0034,$007D,$007E 

PSP_Landed:
    LDA.W $0DC7 
    AND.W #$00FF 
    CMP.W #$0004 
    BEQ .return 
    ASL A 
    TAX 
    JSR.W (.pointers,X) 
    BCC .solidVerticalCollision 
    LDA.W #$0000 
    STA.W $0A2E 
    RTS 


.solidVerticalCollision:
    LDA.W #$0005 
    STA.W $0A2E 

.return:
    RTS 


.pointers:
    dw PSP_Landed_Grounded 
    dw PSP_Landed_MorphBallGrounded 
    dw UNUSED_PSP_Landed_91EA48 
    dw PSP_Landed_SpringBallGrounded 
    dw RTS_91EFC3 
    dw UNUSED_PSP_Landed_5_91EAB6 

PSP_Landed_Grounded:
    LDA.W $0A23 
    AND.W #$00FF 
    CMP.W #$0003 
    BEQ .wasSpinning 
    CMP.W #$0014 
    BEQ .wasSpinning 
    LDA.W $0A1C 
    ASL #3
    TAX 
    LDA.W PoseDefinitions_directionShotsFired,X 
    AND.W #$00FF 
    CMP.W #$00FF 
    BEQ .noAim 
    CMP.W #$0002 
    BEQ .aimHorizontal 
    CMP.W #$0007 
    BEQ .aimHorizontal 

.landingFromNormalJumpNoFire:
    ASL A 
    TAX 
    LDA.W .directions,X 
    STA.W $0A28 
    CLC 
    RTS 


.landingFromNormalJumpNoShot:
    LDA.W PoseDefinitions_directionShotsFired,X 
    AND.W #$00FF 
    BRA .landingFromNormalJumpNoFire 


.aimHorizontal:
    LDA.B $8B 
    BIT.W $09B2 
    BEQ .landingFromNormalJumpNoShot 
    LDA.W $0A1E 
    AND.W #$00FF 
    CMP.W #$0004 
    BEQ ..facingLeft 
    LDA.W #$00E6 
    STA.W $0A28 
    CLC 
    RTS 


..facingLeft:
    LDA.W #$00E7 
    STA.W $0A28 
    CLC 
    RTS 


.noAim:
    LDA.W $0A1E 
    AND.W #$00FF 
    CMP.W #$0004 
    BEQ ..facingLeft 
    LDA.W #$00A4 
    STA.W $0A28 
    CLC 
    RTS 


..facingLeft:
    LDA.W #$00A5 
    STA.W $0A28 
    CLC 
    RTS 


.wasSpinning:
    LDA.W $0A1E 
    AND.W #$00FF 
    CMP.W #$0004 
    BEQ ..facingLeft 
    LDA.W #$00A6 
    STA.W $0A28 
    CLC 
    RTS 


..facingLeft:
    LDA.W #$00A7 
    STA.W $0A28 
    CLC 
    RTS 


.directions:
    db $E0,$00,$E2,$00,$A4,$00,$E4,$00,$A4,$00,$A5,$00,$E5,$00,$A5,$00 
    db $E3,$00,$E1,$00 

PSP_Landed_MorphBallGrounded:
    LDA.W $0B20 
    ASL A 
    TAX 
    JMP.W (.pointers,X) 


.pointers:
    dw PSP_Landed_MorphBallGrounded_NotBouncing 
    dw PSP_Landed_MorphBallGrounded_FirstBounce 
    dw PSP_Landed_MorphBallGrounded_SecondBounce 

PSP_Landed_MorphBallGrounded_NotBouncing:
    LDA.W $0B2E 
    CMP.W #$0003 
    BMI PSP_Landed_MorphBallGrounded_SecondBounce 
    LDA.W $0A1C 
    STA.W $0A28 
    CLC 
    RTS 


PSP_Landed_MorphBallGrounded_FirstBounce:
    LDA.W $0A1C 
    STA.W $0A28 
    CLC 
    RTS 


PSP_Landed_MorphBallGrounded_SecondBounce:
    LDA.W $0A1E 
    AND.W #$00FF 
    CMP.W #$0004 
    BEQ .facingLeft 
    LDA.W #$001D 
    STA.W $0A28 
    BRA .return 


.facingLeft:
    LDA.W #$0041 
    STA.W $0A28 

.return:
    CLC 
    RTS 


UNUSED_PSP_Landed_91EA48:
    LDA.W $0A1E 
    AND.W #$00FF 
    CMP.W #$0004 
    BEQ .facingLeft 
    LDA.W #$0020 
    STA.W $0A28 
    BRA .return 


.facingLeft:
    LDA.W #$0042 
    STA.W $0A28 

.return:
    CLC 
    RTS 


PSP_Landed_SpringBallGrounded:
    LDA.B $8B 
    BIT.W $09B4 
    BEQ .pressingJump 
    LDA.W $0A1C 
    STA.W $0A28 
    CLC 
    RTS 


.pressingJump:
    LDA.W $0B20 
    AND.W #$00FF 
    ASL A 
    TAX 
    JMP.W (.pointers,X) 


.pointers:
    dw PSP_Landed_SpringBallGrounded_NotBouncing 
    dw PSP_Landed_SpringBallGrounded_FirstBounce 
    dw PSP_Landed_SpringBallGrounded_SecondBounce 

PSP_Landed_SpringBallGrounded_NotBouncing:
    LDA.W $0B2E 
    CMP.W #$0003 
    BMI PSP_Landed_SpringBallGrounded_SecondBounce 
    LDA.W $0A1C 
    STA.W $0A28 
    CLC 
    RTS 


PSP_Landed_SpringBallGrounded_FirstBounce:
    LDA.W $0A1C 
    STA.W $0A28 
    CLC 
    RTS 


PSP_Landed_SpringBallGrounded_SecondBounce:
    LDA.W $0A1E 
    AND.W #$00FF 
    CMP.W #$0004 
    BEQ .facingLeft 
    LDA.W #$0079 
    STA.W $0A28 
    BRA .return 


.facingLeft:
    LDA.W #$007A 
    STA.W $0A28 

.return:
    CLC 
    RTS 


UNUSED_PSP_Landed_5_91EAB6:
    LDA.W $0A1C 
    STA.W $0A28 
    CLC 
    RTS 


PSP_WallJumpTriggered:
    LDA.W $0A1E 
    AND.W #$00FF 
    CMP.W #$0004 
    BEQ .facingLeft 
    LDA.W #$0083 
    STA.W $0A28 
    BRA + 


.facingLeft:
    LDA.W #$0084 
    STA.W $0A28 

  + LDA.W #$0005 
    STA.W $0A2E 
    RTS 


CheckIfProspectivePoseRunsIntoAWall:
    LDA.W $0DCE 
    BEQ .notKilledBySolidCollision 
    LDA.W $0A1F 
    AND.W #$00FF 
    CMP.W #$0001 
    BEQ .ranIntoWall 

.notKilledBySolidCollision:
    LDA.W $0A28 
    CMP.W #$FFFF 
    BEQ .returnPoseUnchanged 
    ASL #3
    TAX 
    LDA.W PoseDefinitions_movementType,X 
    AND.W #$00FF 
    CMP.W #$0001 
    BNE .returnPoseUnchanged 
    LDA.W $0A1E 
    AND.W #$00FF 
    CMP.W #$0004 
    BEQ .facingLeft 
    LDA.W #$0001 
    STA.B $12 
    STA.W $0B02 
    STZ.B $14 
    JSL.L Samus_vs_SolidEnemy_CollisionDetection 
    TAX 
    BNE .prospectivePoseRanIntoWall 
    LDA.W #$0001 
    STA.B $12 
    STA.W $0B02 
    STZ.B $14 
    BRA .moveSamus 


.facingLeft:
    LDA.W #$0001 
    STA.B $12 
    STZ.B $14 
    STZ.W $0B02 
    JSL.L Samus_vs_SolidEnemy_CollisionDetection 
    TAX 
    BNE .prospectivePoseRanIntoWall 
    LDA.W #$FFFF 
    STA.B $12 
    STZ.B $14 
    STZ.W $0B02 

.moveSamus:
    JSL.L MoveSamusRight_NoSolidEnemyCollision 
    BCC .returnPoseUnchanged 

.prospectivePoseRanIntoWall:
    LDA.W $0A28 
    BRA .setRanIntoWallPose 


.ranIntoWall:
    LDA.W $0A1C 

.setRanIntoWallPose:
    ASL #3
    TAX 
    LDA.W PoseDefinitions_directionShotsFired,X 
    AND.W #$00FF 
    ASL A 
    TAX 
    LDA.W .poses,X 
    STA.W $0A28 
    BRA .returnPoseChanged 


.returnPoseUnchanged:
    STZ.W $0DCE 
    CLC 
    RTS 


.returnPoseChanged:
    STZ.W $0DCE 
    SEC 
    RTS 


.poses:
    dw $0003,$00CF,$0089,$00D1,$0089,$008A,$00D2,$008A 
    dw $00D0,$0004 

UpdateSamusPose:
    PHP 
    PHB 
    PHK 
    PLB 
    REP #$30 
    LDA.W $0A2C 
    BMI .notSuperSpecialProspectivePose 
    PHA 
    LDA.W $0A32 
    CMP.W #$0003 
    BEQ .animationFinished 
    CMP.W #$0001 
    BNE .superSpecialProspectivePose 
    PLA 
    BRA .knockbackFinished 


.animationFinished:
    LDA.W $0A30 
    CMP.W #$0009 
    BNE .superSpecialProspectivePose 
    PLA 
    BRA .notSuperSpecialProspectivePose 


.superSpecialProspectivePose:
    PLA 
    STA.W $0A1C 
    JSL.L InitializeSamusPose_1 
    JSL.L Set_Samus_AnimationFrame_if_PoseChanged 

.knockbackFinished:
    LDA.W $0A32 
    ASL A 
    TAX 
    JSR.W (.superSpecialProspectivePoseChangeCommand,X) 
    BRA .poseChanged 


.notSuperSpecialProspectivePose:
    LDA.W $0A2A 
    BPL .specialProspectivePose 
    JSR.W CheckIfProspectivePoseRunsIntoAWall 
    LDA.W $0A28 
    BMI .return 
    BRA .prospectivePose 


.specialProspectivePose:
    STA.W $0A1C 
    JSL.L HandleSamusPoseChange 
    BCS .poseChanged 
    LDA.W $0A30 
    ASL A 
    TAX 
    JSR.W (.specialProspectivePoseChangeCommand,X) 
    BRA .poseChanged 


.prospectivePose:
    STA.W $0A1C 
    JSL.L HandleSamusPoseChange 
    BCS .poseChanged 
    LDA.W $0A2E 
    ASL A 
    TAX 
    JSR.W (.prospectivePoseChangeCommand,X) 

.poseChanged:
    LDA.W $0A20 
    STA.W $0A24 
    LDA.W $0A22 
    STA.W $0A26 
    LDA.W $0A1C 
    STA.W $0A20 
    LDA.W $0A1E 
    STA.W $0A22 

.return:
    STZ.W $0DC6 
    PLB 
    PLP 
    RTL 


.prospectivePoseChangeCommand:
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
    dw RTS_91EFC3 
    dw SuperSpecialProspectivePoseCmd_1_KnockbackFinished 
    dw SuperSpecialProspectivePoseCmd_2_ShinesparkFinished 
    dw SuperSpecialProspectivePoseCmd_3_TransitionAnimationFinished 
    dw SuperSpecialProspectivePoseCmd_4 
    dw SuperSpecialProspectivePoseCmd_5 
    dw SuperSpecialProspectivePoseCmd_6_StartGrappleWallJump 
    dw SuperSpecialProspectivePoseCmd_7_StartReleaseGrappleSwing 
    dw SuperSpecialProspectivePoseCmd_8_KnockbackAndTransAnimFinish 

ProspectivePoseCmd_1_Decelerate:
    LDA.W $0B46 
    BNE .nonZeroXSpeed 
    LDA.W $0B48 
    BNE .nonZeroXSpeed 
    JMP.W ProspectivePoseCmd_2_Stop 


.nonZeroXSpeed:
    LDA.W $0B44 
    CLC 
    ADC.W $0B48 
    STA.W $0B48 
    LDA.W $0B42 
    ADC.W $0B46 
    STA.W $0B46 
    LDA.W #$0002 
    STA.W $0B4A 
    JSL.L Cancel_SpeedBoosting 
    STZ.W $0B44 
    STZ.W $0B42 
    JSL.L PossiblyNoPurpose_91FB8E 
    RTS 


ProspectivePoseCmd_6_KillXSpeed:
    STZ.W $0B4A 
    STZ.W $0B46 
    STZ.W $0B48 ; fallthrough to ProspectivePoseCmd_8_KillRunSpeed

ProspectivePoseCmd_8_KillRunSpeed:
    JSL.L Cancel_SpeedBoosting 
    STZ.W $0B44 
    STZ.W $0B42 
    JSL.L PossiblyNoPurpose_91FB8E 
    RTS 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_91EC9D:
    LDA.W $0A1F 
    AND.W #$00FF 
    TAX 
    LDA.W .data,X 
    AND.W #$00FF 
    BNE + 
    RTS 


  + LDA.W #$0004 
    STA.W $0A94 
    RTS 


.data:
    db $00,$00,$02,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00 
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$02,$00,$00 
endif ; !FEATURE_KEEP_UNREFERENCED

ProspectivePoseCmd_2_Stop:
    STZ.W $0B4A 
    JSL.L Cancel_SpeedBoosting 
    RTS 


RTS_91ECD8:
    RTS 


RTS_91ECD9:
    RTS 


ProspectivePoseCmd_7_StartTransitionAnimation:
    LDA.W $0A1C 
    CMP.W #$00DB 
    BPL .aiming 
    SEC 
    SBC.W #$0035 
    ASL A 
    TAX 
    LDA.W .YRadii,X 
    STA.B $12 
    BEQ .notShrinking 
    STZ.B $14 

.shrinking:
    LDA.W $0A1C 
    ASL #3
    TAX 
    LDA.W PoseDefinitions_YRadius,X 
    AND.W #$00FF 
    STA.W $0B00 
    JSL.L BlockCollisionDetectionDueToChangeOfPose 

.notShrinking:
    LDA.W $0AFA 
    CLC 
    ADC.B $12 
    STA.W $0AFA 
    STA.W $0B14 
    LDA.W $0B20 
    BEQ .return 
    STZ.W $0B20 
    STZ.W $0B2C 
    STZ.W $0B2E 
    STZ.W $0B36 

.return:
    RTS 


.aiming:
    CMP.W #$00F1 
    BMI .return 
    CMP.W #$00F7 
    BPL .return 
    LDA.W #$0005 
    STA.B $12 
    STZ.B $14 
    BRA .shrinking 


.YRadii:
    dw $0005,$0005,$0009,$0009,$0000,$0000,$0000,$0000 
    dw $0000,$0000,$0000,$0000 

SpecialProspectivePoseCmd_1_StartKnockback:
    LDA.W $0A23 
    AND.W #$00FF 
    ASL A 
    TAX 
    JSR.W (.pointers,X) 
    JSL.L SetSamusYSpeedForKnockback 
    STZ.W $0A56 
    STZ.W $0A6E 
    LDA.W #$0001 
    STA.W $0A48 
    RTS 


.pointers:
    dw DetermineKnockbackDirection_Normal 
    dw DetermineKnockbackDirection_Normal 
    dw DetermineKnockbackDirection_Normal 
    dw DetermineKnockbackDirection_Normal 
    dw DetermineKnockbackDirection_Morphed 
    dw DetermineKnockbackDirection_Normal 
    dw DetermineKnockbackDirection_Falling 
    dw UNUSED_DetermineKnockbackDirection_MovementType7_91EE48 
    dw DetermineKnockbackDirection_Morphed 
    dw DetermineKnockbackDirection_Morphed 
    dw CLCRTS_91EDA2 
    dw CLCRTS_91EDA4 
    dw CLCRTS_91EDA4 
    dw DetermineKnockbackDirection_Normal 
    dw CLCRTS_91EDA4 
    dw CLCRTS_91EDA4 
    dw DetermineKnockbackDirection_Normal 
    dw DetermineKnockbackDirection_Morphed 
    dw DetermineKnockbackDirection_Morphed 
    dw DetermineKnockbackDirection_Morphed 
    dw DetermineKnockbackDirection_Normal 
    dw DetermineKnockbackDirection_Normal 
    dw CLCRTS_91EDA2 
    dw CLCRTS_91EDA4 
    dw CLCRTS_91EDA4 
    dw CLCRTS_91EDA4 
    dw CLCRTS_91EDA4 
    dw CLCRTS_91EDA4 

CLCRTS_91EDA2:
    CLC 
    RTS 


CLCRTS_91EDA4:
    CLC 
    RTS 


DetermineKnockbackDirection_Falling:
    LDA.W $0A5A 
    CMP.W #UNUSED_SamusTimerHackHandler_SpecialFalling_90E41B 
    BNE DetermineKnockbackDirection_Normal 
    CLC 
    RTS 


DetermineKnockbackDirection_Normal:
    LDA.W $0A1E 
    AND.W #$00FF 
    CMP.W #$0004 
    BEQ .facingLeft 
    LDA.W $0A54 
    BEQ .facingRightKnockbackLeft 
    LDA.B $8B 
    BIT.W #$0100 
    BNE .pressingRight 
    LDA.W #$0002 
    STA.W $0A52 
    BRA + 


.pressingRight:
    LDA.W #$0005 
    STA.W $0A52 
    BRA + 


.facingRightKnockbackLeft:
    LDA.B $8B 
    BIT.W #$0100 
    BNE ..pressingRight 
    LDA.W #$0001 
    STA.W $0A52 
    BRA + 


..pressingRight:
    LDA.W #$0004 
    STA.W $0A52 
    BRA + 


.facingLeft:
    LDA.W $0A54 
    BEQ .facingLeftKnockbackLeft 
    LDA.B $8B 
    BIT.W #$0200 
    BNE ..pressingLeft 
    LDA.W #$0002 
    STA.W $0A52 
    BRA + 


..pressingLeft:
    LDA.W #$0005 
    STA.W $0A52 
    BRA + 


.facingLeftKnockbackLeft:
    LDA.B $8B 
    BIT.W #$0200 
    BNE ..pressingLeft 
    LDA.W #$0001 
    STA.W $0A52 
    BRA + 


..pressingLeft:
    LDA.W #$0004 
    STA.W $0A52 

  + LDA.W #SamusMovementHandler_Knockback 
    STA.W $0A58 
    SEC 
    RTS 


DetermineKnockbackDirection_Morphed:
    LDA.W $0A1E 
    AND.W #$00FF 
    CMP.W #$0004 
    BEQ .facingLeft 
    LDA.W #$0002 
    STA.W $0A52 
    BRA + 


.facingLeft:
    LDA.W #$0001 
    STA.W $0A52 

  + LDA.W #SamusMovementHandler_Knockback 
    STA.W $0A58 
    CLC 
    RTS 


UNUSED_DetermineKnockbackDirection_MovementType7_91EE48:
    LDA.W $0A1E 
    AND.W #$00FF 
    CMP.W #$0004 
    BEQ .facingLeft 
    LDA.W #$0002 
    STA.W $0A52 
    BRA + 


.facingLeft:
    LDA.W #$0001 
    STA.W $0A52 

  + LDA.W #SamusMovementHandler_Knockback 
    STA.W $0A58 
    SEC 
    RTS 


UNUSED_SpecialProspectivePoseCmd_2_91EE69:
    STZ.W $0A52 
    LDA.W #SamusMovementHandler_Normal 
    STA.W $0A58 
    STZ.W $0B2E 
    STZ.W $0B2C 
    STZ.W $0B36 
    JSL.L AlignSamusBottomPositionWithPreviousPose 
    RTS 


SpecialProspectivePoseCmd_3_StartBombJump:
    LDA.W $0A56 
    AND.W #$00FF 
    ORA.W #$0800 
    STA.W $0A56 
    LDA.W #SamusMovementHandler_BombJump_Start 
    STA.W $0A58 
    LDA.W $0A60 
    CMP.W #SamusPoseInputHandler_Demo 
    BEQ .return 
    LDA.W #RTS_90E90E 
    STA.W $0A60 

.return:
    RTS 


UNUSED_SpecialProspectivePoseCmd_4_91EEA1:
    JSL.L Make_Samus_Jump 
    RTS 


SpecialProspectivePoseCmd_5_Xray:
    LDA.W $0A1F 
    AND.W #$00FF 
    BEQ .standing 
    CMP.W #$0005 
    BEQ .crouching 
    CMP.W #$0015 
    BEQ .standing 
    CMP.W #$0001 
    BEQ .standing 
    RTS 


.standing:
    LDA.W $0A1E 
    AND.W #$00FF 
    CMP.W #$0004 
    BEQ ..facingLeft 
    LDA.W #$0040 
    STA.W $0A82 
    BRA .merge 


..facingLeft:
    LDA.W #$00C0 
    STA.W $0A82 
    BRA .merge 


.crouching:
    LDA.W $0A1E 
    AND.W #$00FF 
    CMP.W #$0004 
    BEQ ..facingLeft 
    LDA.W #$0040 
    STA.W $0A82 
    BRA .merge 


..facingLeft:
    LDA.W #$00C0 
    STA.W $0A82 

.merge:
    LDA.W #$0002 
    STA.W $0A96 
    LDA.W #$003F 
    STA.W $0A94 
    LDA.W #SamusMovementHandler_Xray 
    STA.W $0A58 
    LDA.W #SamusPoseInputHandler_Xray 
    STA.W $0A60 
    LDA.W #$0008 
    STA.W $0ACC 
    LDA.W #$0001 
    STA.W $0AD0 
    STZ.W $0ACE 
    STZ.W $0A68 
    STZ.W $0CD0 
    STZ.W $0CD6 
    STZ.W $0CD8 
    STZ.W $0CDA 
    STZ.W $0CDC 
    STZ.W $0CDE 
    STZ.W $0CE0 
    LDA.W #$0009 
    JSL.L QueueSound_Lib1_Max6 
    RTS 


RTS_91EF39:
    RTS 


RTS_91EF3A:
    RTS 


UNUSED_SpecialProspectivePoseCmd_8_91EF3B:
    LDA.W $0AFA 
    SEC 
    SBC.W #$0005 
    STA.W $0AFA 
    STA.W $0B14 
    LDA.W #RTL_90E8CD 
    STA.W $0A42 
    RTS 


SpecialProspectivePoseCmd_9_ConnectingGrapple_Swinging:
    JSL.L SetSamusAnimationFrameAndPositionDuringGrappleSwinging 

ConnectingGrapple_KillSpeed_ClampScrollingSpeed:
    LDA.W $0AF6 
    SEC 
    SBC.W $0B10 
    BMI + 
    CMP.W #$000D 
    BMI .YPosition 
    LDA.W $0AF6 
    SEC 
    SBC.W #$000C 
    STA.W $0B10 
    BRA .YPosition 


  + CMP.W #$FFF4 
    BPL .YPosition 
    LDA.W $0AF6 
    CLC 
    ADC.W #$000C 
    STA.W $0B10 

.YPosition:
    LDA.W $0AFA 
    SEC 
    SBC.W $0B14 
    BMI + 
    CMP.W #$000D 
    BMI .killSpeed 
    LDA.W $0AFA 
    SEC 
    SBC.W #$000C 
    STA.W $0B14 
    BRA .killSpeed 


  + CMP.W #$FFF4 
    BPL .killSpeed 
    LDA.W $0AFA 
    CLC 
    ADC.W #$000C 
    STA.W $0B14 

.killSpeed:
    JSL.L Cancel_SpeedBoosting 
    STZ.W $0B46 
    STZ.W $0B48 
    STZ.W $0B2C 
    STZ.W $0B2E 
    STZ.W $0B42 
    STZ.W $0B44 
    RTS 


SpecialProspectivePoseCmd_A_ConnectingGrapple_StuckInPlace:
    JSL.L SetSamusAnimationFrameAndPositionForConnectingGrapple_Stuck 
    JMP.W ConnectingGrapple_KillSpeed_ClampScrollingSpeed 


RTS_91EFC3:
    RTS 


SpecialProspectivePoseCmd_5_SolidVerticalCollision:
    LDA.W $0DC6 
    AND.W #$00FF 
    ASL A 
    TAX 
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

RTS_91EFDE:
    RTS 


SolidVerticalCollision_HitCeiling:
    STZ.W $0B2C 
    STZ.W $0B2E 
    STZ.W $0B1A 
    LDA.W #$0002 
    STA.W $0B36 
    RTS 


SolidVerticalCollision_Falling:
    LDA.W $0B36 
    CMP.W #$0001 
    BEQ .fallingUp 
    STZ.W $0B20 
    STZ.W $0B2C 
    STZ.W $0B2E 
    LDA.W #$0001 
    STA.W $0B22 
    LDA.W #$0002 
    STA.W $0B36 

.fallingUp:
    STZ.W $0A18 
    RTS 


SolidVerticalCollision_Landed:
    JSR.W HandleLandingSoundEffectsAndGraphics 
    LDA.W $0DC7 
    AND.W #$00FF 
    CMP.W #$0004 
    BNE .change 
    JSR.W SolidVerticalCollision_Landed_SetSamusAsNotBouncing 
    RTS 


.change:
    ASL A 
    TAX 
    JSR.W (.pointers,X) 
    BCC .carryClear 
    RTS 


.carryClear:
    STZ.W $0A18 
    STZ.W $0B4A 
    STZ.W $0B46 
    STZ.W $0B48 
    JSR.W SolidVerticalCollision_Landed_SetSamusAsNotBouncing 
    RTS 


.pointers:
    dw SolidVerticalCollision_Landed_Grounded 
    dw SolidVerticalCollision_Landed_MorphBallGrounded 
    dw SolidVerticalCollision_Landed_2 
    dw SolidVerticalCollision_Landed_SpringBallGrounded 
    dw RTS_91EFC3 
    dw SolidVerticalCollision_5 

HandleLandingSoundEffectsAndGraphics:
    LDA.W $0A23 
    AND.W #$00FF 
    CMP.W #$0003 
    BEQ .spinJumping 
    CMP.W #$0014 
    BNE .notEndingSFX 

.spinJumping:
    LDA.W $1F51 
    BNE .notEndingSFX 
    LDA.W $0A20 
    CMP.W #$0081 
    BEQ .screwAttack 
    CMP.W #$0082 
    BEQ .screwAttack 
    LDA.W #$0032 
    JSL.L QueueSound_Lib1_Max6 
    BRA .notEndingSFX 


.screwAttack:
    LDA.W #$0034 
    JSL.L QueueSound_Lib1_Max6 

.notEndingSFX:
    LDA.W $0B2E 
    BEQ .zeroYSpeed 
    CMP.W #$0005 
    BPL .hardLanding 

.zeroYSpeed:
    LDA.W $0B2C 
    BEQ .return 
    LDA.W $1F51 
    BNE .merge 
    LDA.W #$0005 
    JSL.L QueueSound_Lib3_Max6 
    BRA .merge 


.hardLanding:
    LDA.W $1F51 
    BNE .merge 
    LDA.W #$0004 
    JSL.L QueueSound_Lib3_Max6 

.merge:
    JSR.W HandleLandingGraphics 

.return:
    RTS 


HandleLandingGraphics:
    LDA.W $079F 
    ASL A 
    TAX 
    JSR.W (.areaPointers,X) 
    RTS 


.areaPointers:
    dw HandleLandingGraphics_Crateria 
    dw HandleLandingGraphics_Brinstar 
    dw HandleLandingGraphics_Norfair_WreckedShip_HandleLandingDust 
    dw HandleLandingGraphics_Norfair_WreckedShip_HandleLandingDust 
    dw HandleLandingGraphics_Maridia_HandleLandingFootstepSplashes 
    dw HandleLandingGraphics_Tourian 
    dw DeleteLandingAtmosphericGraphics 
    dw DeleteLandingAtmosphericGraphics 

DeleteLandingAtmosphericGraphics:
    STZ.W $0AF0 
    STZ.W $0AF2 
    RTS 


HandleLandingGraphics_Crateria:
    LDA.W $1F51 
    BNE DeleteLandingAtmosphericGraphics 
    LDA.W $079D 
    CMP.W #$001C 
    BEQ .crateriaSpacePirateShaft 
    TAX 
    CPX.W #$0010 
    BPL .gotoDelete 
    LDA.W .data,X 
    AND.W #$00FF 
    BIT.W #$0001 
    BNE .landingSite 
    BIT.W #$0002 
    BNE .wreckedShipEntrance 
    BIT.W #$0004 
    BNE HandleLandingGraphics_Maridia_HandleLandingFootstepSplashes 

.gotoDelete:
    JMP.W DeleteLandingAtmosphericGraphics 


.crateriaSpacePirateShaft:
    JMP.W HandleLandingGraphics_Norfair_WreckedShip_HandleLandingDust 


.data:
    db $01,$00,$00,$00,$00,$02,$00,$04,$00,$04,$04,$04,$04,$00,$04,$00 
    db $00 

.wreckedShipEntrance:
    LDA.W $0AFA 
    CMP.W #$03B0 
    BPL HandleLandingGraphics_Maridia_HandleLandingFootstepSplashes 
    BRA DeleteLandingAtmosphericGraphics 


.landingSite:
    LDA.W $196E 
    CMP.W #$000A 
    BNE DeleteLandingAtmosphericGraphics 

HandleLandingGraphics_Maridia_HandleLandingFootstepSplashes:
    JSL.L Get_Samus_Bottom_Boundary 
    LDA.W $195E 
    BMI .negativeYPosition 
    CMP.B $12 
    BPL .nonLiquidPhysics 
    LDA.W $197E 
    BIT.W #$0004 
    BNE .nonLiquidPhysics 
    BRA .return 


.negativeYPosition:
    LDA.W $1962 
    BMI .nonLiquidPhysics 
    CMP.B $12 
    BMI .return 

.nonLiquidPhysics:
    LDA.W #$0100 
    STA.W $0AF0 
    STA.W $0AF2 
    LDA.W #$0003 
    STA.W $0AD8 
    STA.W $0ADA 
    LDA.W $0AF6 
    CLC 
    ADC.W #$0004 
    STA.W $0AE0 
    SEC 
    SBC.W #$0007 
    STA.W $0AE2 
    LDA.B $12 
    SEC 
    SBC.W #$0004 
    STA.W $0AE8 
    STA.W $0AEA 

.return:
    RTS 


HandleLandingGraphics_Norfair_WreckedShip_HandleLandingDust:
    JSL.L Get_Samus_Bottom_Boundary 
    LDA.W $195E 
    BMI .negativeYPosition 
    CMP.B $12 
    BPL .nonLiquidPhysics 
    LDA.W $197E 
    BIT.W #$0004 
    BNE .nonLiquidPhysics 
    BRA .return 


.negativeYPosition:
    LDA.W $1962 
    BMI .nonLiquidPhysics 
    CMP.B $12 
    BMI .return 

.nonLiquidPhysics:
    LDA.W #$0600 
    STA.W $0AF0 
    STA.W $0AF2 
    LDA.W #$0003 
    STA.W $0AD8 
    STA.W $0ADA 
    LDA.W $0AF6 
    CLC 
    ADC.W #$0008 
    STA.W $0AE0 
    SEC 
    SBC.W #$0010 
    STA.W $0AE2 
    LDA.B $12 
    STA.W $0AE8 
    STA.W $0AEA 

.return:
    RTS 


HandleLandingGraphics_Brinstar:
    LDA.W $079D 
    CMP.W #$0008 
    BEQ HandleLandingGraphics_Norfair_WreckedShip_HandleLandingDust ; fallthrough to HandleLandingGraphics_Tourian

HandleLandingGraphics_Tourian:
    LDA.W $079D 
    CMP.W #$0005 
    BMI .greaterThan4 
    CMP.W #$0009 
    BMI HandleLandingGraphics_Norfair_WreckedShip_HandleLandingDust 
    CMP.W #$000B 
    BEQ HandleLandingGraphics_Norfair_WreckedShip_HandleLandingDust 

.greaterThan4:
    STZ.W $0AF0 
    STZ.W $0AF2 
    RTS 


SolidVerticalCollision_Landed_SetSamusAsNotBouncing:
    STZ.W $0B22 
    STZ.W $0B1A 
    STZ.W $0B2A 
    STZ.W $0B2C 
    STZ.W $0B2E 
    STZ.W $0B36 
    STZ.W $0B38 
    STZ.W $0B20 
    RTS 


SolidVerticalCollision_Landed_Grounded:
    LDA.W $0A60 
    CMP.W #SamusPoseInputHandler_Demo 
    BEQ .return 
    LDA.W #SamusPoseInputHandler_AutoJumpHack 
    STA.W $0A60 

.return:
    CLC 
    RTS 


SolidVerticalCollision_Landed_MorphBallGrounded:
    LDA.W $0B20 
    ASL A 
    TAX 
    JMP.W (.pointers,X) 


.pointers:
    dw MorphBallBounce_MorphBall_NotBouncing 
    dw MorphBallBounce_MorphBall_FirstBounce 
    dw MorphBallBounce_MorphBall_SecondBounce 

MorphBallBounce_MorphBall_NotBouncing:
    LDA.W $0B2E 
    CMP.W #$0003 
    BMI MorphBallBounce_MorphBall_SecondBounce 
    INC.W $0B20 
    LDA.W #$0001 
    STA.W $0B36 
    LDA.L SamusPhysicsConstants_YSubSpeedWhenBouncingInMorphBall 
    STA.W $0B2C 
    LDA.L SamusPhysicsConstants_YSpeedWhenBouncingInMorphBall 
    STA.W $0B2E 
    SEC 
    RTS 


MorphBallBounce_MorphBall_FirstBounce:
    INC.W $0B20 
    LDA.W #$0001 
    STA.W $0B36 
    LDA.L SamusPhysicsConstants_YSubSpeedWhenBouncingInMorphBall 
    STA.W $0B2C 
    LDA.L SamusPhysicsConstants_YSpeedWhenBouncingInMorphBall 
    DEC A 
    STA.W $0B2E 
    SEC 
    RTS 


MorphBallBounce_MorphBall_SecondBounce:
    STZ.W $0B20 
    STZ.W $0B36 
    STZ.W $0B2C 
    STZ.W $0B2E 
    CLC 
    RTS 


SolidVerticalCollision_Landed_2:
    STZ.W $0B20 
    LDA.W #$0003 
    STA.W $0A46 
    CLC 
    RTS 


SolidVerticalCollision_Landed_SpringBallGrounded:
    LDA.B $8B 
    BIT.W $09B4 
    BEQ .notPressingJump 
    STZ.W $0B20 
    JSL.L Make_Samus_Jump 
    SEC 
    RTS 


.notPressingJump:
    LDA.W $0B20 
    AND.W #$00FF 
    ASL A 
    TAX 
    JMP.W (.pointers,X) 


.pointers:
    dw MorphBallBounce_SpringBall_NotBouncing 
    dw MorphBallBounce_SpringBall_FirstBounce 
    dw MorphBallBounce_SpringBall_SecondBounce 

MorphBallBounce_SpringBall_NotBouncing:
    LDA.W $0B2E 
    CMP.W #$0003 
    BMI MorphBallBounce_SpringBall_SecondBounce 
    LDA.W #$0601 
    STA.W $0B20 
    LDA.W #$0001 
    STA.W $0B36 
    LDA.L SamusPhysicsConstants_YSubSpeedWhenBouncingInMorphBall 
    STA.W $0B2C 
    LDA.L SamusPhysicsConstants_YSpeedWhenBouncingInMorphBall 
    STA.W $0B2E 
    SEC 
    RTS 


MorphBallBounce_SpringBall_FirstBounce:
    LDA.W #$0602 
    STA.W $0B20 
    LDA.W #$0001 
    STA.W $0B36 
    LDA.L SamusPhysicsConstants_YSubSpeedWhenBouncingInMorphBall 
    STA.W $0B2C 
    LDA.L SamusPhysicsConstants_YSpeedWhenBouncingInMorphBall 
    DEC A 
    STA.W $0B2E 
    SEC 
    RTS 


MorphBallBounce_SpringBall_SecondBounce:
    STZ.W $0B20 
    STZ.W $0B36 
    STZ.W $0B2C 
    STZ.W $0B2E 
    CLC 
    RTS 


SolidVerticalCollision_5:
    STZ.W $0B20 
    CLC 
    RTS 


SolidVerticalCollision_WallJumpTriggered:
    STZ.W $0B4A 
    STZ.W $0DCE 
    STZ.W $0B22 
    STZ.W $0B1A 
    STZ.W $0B46 
    STZ.W $0B48 
    STZ.W $0A18 
    LDA.W #$0005 
    JSL.L QueueSound_Lib3_Max6 
    RTS 


SolidVerticalCollision_6:
    LDA.W $0DCE 
    BEQ .return 
    LDA.W $0A23 
    AND.W #$00FF 
    CMP.W #$0009 
    BNE .return 
    LDA.W $0A1E 
    AND.W #$00FF 
    CMP.W #$0004 
    BEQ .disableHorizontalSlopeDetection 
    LDA.W #$0001 
    STA.W $0A46 
    BRA .returnClear0A18 


.disableHorizontalSlopeDetection:
    STZ.W $0A46 
    BRA .returnClear0A18 


.return:
    RTS 


.returnClear0A18:
    STZ.W $0A18 
    RTS 


SuperSpecialProspectivePoseCmd_1_KnockbackFinished:
    STZ.W $0A52 
    LDA.W #SamusMovementHandler_Normal 
    STA.W $0A58 
    STZ.W $0B20 
    STZ.W $0B2C 
    STZ.W $0B2E 
    LDA.W #$0001 
    STA.W $0B22 
    LDA.W #$0002 
    STA.W $0B36 
    JSL.L AlignSamusBottomPositionWithPreviousPose 
    LDA.W $0A60 
    CMP.W #SamusPoseInputHandler_Demo 
    BEQ .return 
    LDA.W #SamusPoseInputHandler_Normal 
    STA.W $0A60 

.return:
    RTS 


SuperSpecialProspectivePoseCmd_2_ShinesparkFinished:
    JSL.L AlignSamusBottomPositionWithPreviousPose 
    LDA.W #SamusMovementHandler_Normal 
    STA.W $0A58 
    LDA.W $0998 
    CMP.W #$002A 
    BEQ .demo 
    LDA.W #SamusPoseInputHandler_Normal 
    STA.W $0A60 
    RTS 


.demo:
    LDA.W #SamusPoseInputHandler_Demo 
    STA.W $0A60 
    RTS 


SuperSpecialProspectivePoseCmd_3_TransitionAnimationFinished:
    STZ.W $0B20 
    LDA.W $0A94 
    CLC 
    ADC.W $0A9C 
    STA.W $0A94 
    RTS 


SuperSpecialProspectivePoseCmd_4:
    LDA.W $0911 
    CLC 
    ADC.W #$0080 
    STA.W $0AF6 
    STA.W $0B10 
    LDA.W $0915 
    CLC 
    ADC.W #$0080 
    STA.W $0AFA 
    STA.W $0B14 
    RTS 


SuperSpecialProspectivePoseCmd_5:
    LDA.W $0AFA 
    CLC 
    ADC.W #$0005 
    STA.W $0AFA 
    STA.W $0B14 
    RTS 


SuperSpecialProspectivePoseCmd_6_StartGrappleWallJump:
    JSL.L HandleJumpTransition 
    RTS 


SuperSpecialProspectivePoseCmd_7_StartReleaseGrappleSwing:
    LDA.W $0AF6 
    SEC 
    SBC.W $0B10 
    BMI + 
    CMP.W #$000D 
    BMI .YPosition 
    LDA.W $0AF6 
    SEC 
    SBC.W #$000C 
    STA.W $0B10 
    BRA .YPosition 


  + CMP.W #$FFF4 
    BPL .YPosition 
    LDA.W $0AF6 
    CLC 
    ADC.W #$000C 
    STA.W $0B10 

.YPosition:
    LDA.W $0AFA 
    SEC 
    SBC.W $0B14 
    BMI + 
    CMP.W #$000D 
    BMI .return 
    LDA.W $0AFA 
    SEC 
    SBC.W #$000C 
    STA.W $0B14 
    BRA .return 


  + CMP.W #$FFF4 
    BPL .return 
    LDA.W $0AFA 
    CLC 
    ADC.W #$000C 
    STA.W $0B14 

.return:
    RTS 


SuperSpecialProspectivePoseCmd_8_KnockbackAndTransAnimFinish:
    JSR.W SuperSpecialProspectivePoseCmd_1_KnockbackFinished 
    JSR.W SuperSpecialProspectivePoseCmd_3_TransitionAnimationFinished 
    RTS 


HandleSamusPoseChange:
    PHP 
    PHB 
    PHK 
    PLB 
    REP #$30 
    LDA.W $0A1C 
    PHA 
    CMP.W $0A20 
    BEQ .noChange 
    JSR.W HandlePoseChangeCollision 
    JSL.L InitializeSamusPose_1 
    JSL.L HandleJumpTransition 
    JSL.L Set_Samus_AnimationFrame_if_PoseChanged 
    STZ.W $0A9A 

.noChange:
    PLA 
    CMP.W $0A1C 
    BNE .poseChange 
    PLB 
    PLP 
    CLC 
    RTL 


.poseChange:
    PLB 
    PLP 
    SEC 
    RTL 


InitializeSamusPose_1:
    PHP 
    PHB 
    PHK 
    PLB 
    REP #$30 
    LDA.W $0A1C 
    ASL #3
    TAX 
    LDA.W PoseDefinitions_00_XDirection,X 
    STA.W $0A1E 
    JSR.W InitializeSamusPose_2 
    LDA.W $0A23 
    AND.W #$00FF 
    CMP.W #$0003 
    BEQ .spinJumping 
    CMP.W #$0014 
    BNE .return 

.spinJumping:
    LDA.W $09A2 
    BIT.W #$0008 
    BEQ .return 
    JSL.L LoadSamusSuitPalette 

.return:
    PLB 
    PLP 
    RTL 


InitializeSamusPose_2:
    PHP 
    REP #$30 
    LDA.W $0A1F 
    AND.W #$00FF 
    ASL A 
    TAX 
    JSR.W (.pointers,X) 
    BCC .return 
    LDA.W $0A1C 
    ASL #3
    TAX 
    LDA.W PoseDefinitions_00_XDirection,X 
    STA.W $0A1E 
    AND.W #$FF00 
    CMP.W #$0E00 
    BNE .return 
    XBA 
    ASL A 
    TAX 
    JSR.W (.pointers,X) 
    LDA.W $0A1C 
    ASL #3
    TAX 
    LDA.W PoseDefinitions_00_XDirection,X 
    STA.W $0A1E 

.return:
    PLP 
    RTS 


.pointers:
    dw InitializeSamusPose_Standing 
    dw InitializeSamusPose_Running 
    dw InitializeSamusPose_NormalJumping 
    dw InitializeSamusPose_SpinJumping 
    dw InitializeSamusPose_MorphBall 
    dw InitializeSamusPose_Crouching 
    dw InitializeSamusPose_Falling 
    dw CLCRTS_91F4DA 
    dw InitializeSamusPose_MorphBall 
    dw CLCRTS_91F4DA 
    dw CLCRTS_91F4DA 
    dw CLCRTS_91F4DA 
    dw CLCRTS_91F4DA 
    dw CLCRTS_91F4DA 
    dw InitializeSamusPose_TurningAround_OnGround 
    dw InitializeSamusPose_TransitionPoses 
    dw InitializeSamusPose_Moonwalking 
    dw InitializeSamusPose_SpringBall 
    dw InitializeSamusPose_SpringBall 
    dw InitializeSamusPose_SpringBall 
    dw InitializeSamusPose_WallJumping 
    dw CLCRTS_91F4DA 
    dw CLCRTS_91F4DA 
    dw InitializeSamusPose_TurningAround_Jumping 
    dw InitializeSamusPose_TurningAround_Falling 
    dw InitializeSamusPose_DamageBoost 
    dw CLCRTS_91F4DA 
    dw InitializeSamusPose_Shinespark_CF_Drained_DamagedMB 

CLCRTS_91F4DA:
    CLC 
    RTS 


InitializeSamusPose_Standing:
    LDA.W $0A1C 
    ASL #3
    TAX 
    LDA.W PoseDefinitions_directionShotsFired,X 
    AND.W #$00FF 
    BEQ + 
    CMP.W #$0009 
    BNE .returnCarryClear 

  + LDA.W $0A20 
    ASL #3
    TAX 
    LDA.W PoseDefinitions_directionShotsFired,X 
    AND.W #$00FF 
    BEQ .up 
    CMP.W #$0009 
    BNE .returnCarryClear 

.up:
    LDA.W #$0001 
    STA.W $0A9A 

.returnCarryClear:
    CLC 
    RTS 


InitializeSamusPose_Running:
    LDA.W $0A23 
    AND.W #$00FF 
    CMP.W #$0001 
    BNE .notRunning 
    LDA.W #$8000 
    STA.W $0A9A 

.notRunning:
    LDA.W $0DF8 
    BEQ .returnCarryClear 
    LDA.W $0A1C 
    CMP.W #$0045 
    BEQ .turnLeft 
    CMP.W #$0046 
    BEQ .turnRight 
    BRA .returnCarryClear 


.turnLeft:
    LDA.W #$0025 
    STA.W $0A1C 
    BRA .returnCarrySet 


.turnRight:
    LDA.W #$0026 
    STA.W $0A1C 

.returnCarrySet:
    SEC 
    RTS 


.returnCarryClear:
    CLC 
    RTS 


InitializeSamusPose_NormalJumping:
    LDA.W $0A1C 
    CMP.W #$004E 
    BEQ .shinesparkFacingLeft 
    CMP.W #$004D 
    BEQ .shinesparkFacingRight 
    CMP.W #$0015 
    BEQ .shinesparkFacingRight 
    CMP.W #$0016 
    BEQ .shinesparkFacingLeft 
    CMP.W #$006A 
    BEQ .shinesparkFacingLeft 
    CMP.W #$0069 
    BNE .notShinespark 

.shinesparkFacingRight:
    LDA.W $0A68 
    BEQ .notShinespark 
    LDA.W #$00C7 
    STA.W $0A1C 
    BRA .shinesparkMerge 


.shinesparkFacingLeft:
    LDA.W $0A68 
    BEQ .notShinespark 
    LDA.W #$00C8 
    STA.W $0A1C 

.shinesparkMerge:
    JSL.L TriggerShinesparkWindup 
    LDA.W $0A23 
    AND.W #$00FF 
    CMP.W #$0002 
    BNE .returnCarrySet 
    LDA.W $0AFA 
    SEC 
    SBC.W #$0001 
    STA.W $0AFA 
    STA.W $0B14 

.returnCarrySet:
    SEC 
    RTS 


.notShinespark:
    LDA.W $0B42 
    BNE .nonZeroExtraRunSpeed 
    LDA.W $0B44 
    BNE .nonZeroExtraRunSpeed 
    STZ.W $0B4A 
    BRA + 


.nonZeroExtraRunSpeed:
    LDA.W #$0002 
    STA.W $0B4A 

  + LDA.W $0A1C 
    CMP.W #$0015 
    BEQ .normalJump 
    CMP.W #$0016 
    BNE .noAnimationSkip 

.normalJump:
    LDA.W $0A20 
    CMP.W #$0055 
    BEQ .skipArmCannonMovingUp 
    CMP.W #$0056 
    BNE .noAnimationSkip 

.skipArmCannonMovingUp:
    LDA.W #$0001 
    STA.W $0A9A 

.noAnimationSkip:
    LDA.B $8F 
    BIT.W $09B2 
    BEQ .returnCarryClear 
    LDA.W $0A1C 
    ASL #3
    TAX 
    LDA.W PoseDefinitions_directionShotsFired,X 
    AND.W #$00FF 
    ORA.W #$8000 
    STA.W $0B5E 

.returnCarryClear:
    CLC 
    RTS 


InitializeSamusPose_Crouching:
    LDA.W $0A1C 
    CMP.W #$0085 
    BEQ .crouchingAimingUp 
    CMP.W #$0086 
    BNE .returnCarryClear 

.crouchingAimingUp:
    LDA.W $0A20 
    CMP.W #$00F1 
    BEQ .skipArmCannonMovingUp 
    CMP.W #$00F2 
    BNE .returnCarryClear 

.skipArmCannonMovingUp:
    LDA.W #$0001 
    STA.W $0A9A 

.returnCarryClear:
    CLC 
    RTS 


InitializeSamusPose_Falling:
    LDA.W $0B42 
    BNE .nonZeroExtraRunSpeed 
    LDA.W $0B44 
    BNE .nonZeroExtraRunSpeed 
    STZ.W $0B4A 
    BRA .returnCarryClear 


.nonZeroExtraRunSpeed:
    LDA.W #$0002 
    STA.W $0B4A 

.returnCarryClear:
    CLC 
    RTS 


InitializeSamusPose_SpinJumping:
    LDA.W $0A23 
    AND.W #$00FF 
    CMP.W #$0003 
    BEQ .spinJumping 
    CMP.W #$0014 
    BNE .notTurningAround 

.spinJumping:
    LDA.W #$0001 
    STA.W $0A9A 
    LDA.W $0A22 
    AND.W #$000F 
    CMP.W #$0008 
    BEQ + 
    CMP.W #$0004 
    BNE .notTurningAround 
    LDA.W $0A1E 
    CMP.W #$0308 
    BEQ .speed 
    BRA .notTurningAround 


  + LDA.W $0A1E 
    CMP.W #$0304 
    BNE .notTurningAround 

.speed:
    LDA.W $0B44 
    CLC 
    ADC.W $0B48 
    STA.W $0B48 
    LDA.W $0B42 
    ADC.W $0B46 
    STA.W $0B46 
    JSL.L Cancel_SpeedBoosting 
    STZ.W $0B44 
    STZ.W $0B42 
    LDA.W #$0001 
    STA.W $0B4A 

.notTurningAround:
    LDA.W $0A1E 
    AND.W #$00FF 
    CMP.W #$0004 
    BEQ .facingLeft 
    LDA.W $09A2 
    BIT.W #$0020 
    BNE .nonLiquidPhysicsRight 
    JSL.L Get_Samus_BottomTop_Boundary 
    LDA.W $195E 
    BMI .negativeYPosition 
    CMP.B $14 
    BPL .nonLiquidPhysicsRight 
    LDA.W $197E 
    BIT.W #$0004 
    BNE .nonLiquidPhysicsRight 
    BRA .returnUpperCarryClear 


.negativeYPosition:
    LDA.W $1962 
    BMI .nonLiquidPhysicsRight 
    CMP.B $14 
    BMI .returnUpperCarryClear 

.nonLiquidPhysicsRight:
    LDA.W $09A2 
    BIT.W #$0008 
    BNE .screwAttackRight 
    BIT.W #$0200 
    BNE .spaceJumpRight 
    LDA.W $0A9A 
    BEQ .spinJumpRight 

.returnUpperCarryClear:
    CLC 
    RTS 


.spinJumpRight:
    LDA.W $1F51 
    BNE .returnUpperCarryClear 
    LDA.W #$0031 
    JSL.L QueueSound_Lib1_Max6 
    CLC 
    RTS 


.spaceJumpRight:
    LDA.W #$003E 
    JSL.L QueueSound_Lib1_Max6 
    LDA.W #$001B 
    STA.W $0A1C 
    CLC 
    RTS 


.screwAttackRight:
    LDA.W #$0081 
    STA.W $0A1C 
    BRA .screwAttackSFX 


.facingLeft:
    LDA.W $09A2 
    BIT.W #$0020 
    BNE .nonLiquidPhysicsLeft 
    JSL.L Get_Samus_BottomTop_Boundary 
    LDA.W $195E 
    BMI .negativeYPosition2 
    CMP.B $14 
    BPL .nonLiquidPhysicsLeft 
    LDA.W $197E 
    BIT.W #$0004 
    BNE .nonLiquidPhysicsLeft 
    BRA .returnMiddleCarryClear 


.negativeYPosition2:
    LDA.W $1962 
    BMI .nonLiquidPhysicsLeft 
    CMP.B $14 
    BMI .returnMiddleCarryClear 

.nonLiquidPhysicsLeft:
    LDA.W $09A2 
    BIT.W #$0008 
    BNE .screwAttackLeft 
    BIT.W #$0200 
    BNE .spaceJumpLeft 
    LDA.W $0A9A 
    BEQ .spinJumpLeft 

.returnMiddleCarryClear:
    CLC 
    RTS 


.spinJumpLeft:
    LDA.W $1F51 
    BNE .returnMiddleCarryClear 
    LDA.W #$0031 
    JSL.L QueueSound_Lib1_Max6 
    CLC 
    RTS 


.spaceJumpLeft:
    LDA.W #$003E 
    JSL.L QueueSound_Lib1_Max6 
    LDA.W #$001C 
    STA.W $0A1C 
    CLC 
    RTS 


.screwAttackLeft:
    LDA.W #$0082 
    STA.W $0A1C 

.screwAttackSFX:
    LDA.W $0A9A 
    BNE .returnLowerCarryClear 
    LDA.W #$0033 
    JSL.L QueueSound_Lib1_Max6 

.returnLowerCarryClear:
    CLC 
    RTS 


InitializeSamusPose_TransitionPoses:
    LDA.W $0A1C 
    CMP.W #$00F1 
    BPL .aiming 
    CMP.W #$00DB 
    BPL .unused 
    SEC 
    SBC.W #$0035 
    ASL A 
    TAX 

  - LDA.W #$0007 
    STA.W $0A2E 
    JSR.W (.pointers,X) 
    RTS 


.unused:
    SEC 
    SBC.W #$00DB 
    ASL A 
    TAX 
    JSR.W (.unusedPointers,X) 
    RTS 


.aiming:
    CMP.W #$00F7 
    BPL .startTransition 
    LDX.W #$0000 
    BRA - 


.startTransition:
    LDA.W #$0007 
    STA.W $0A2E 
    RTS 


.pointers:
    dw InitializeSamusPose_CrouchingTransition 
    dw InitializeSamusPose_CrouchingTransition 
    dw InitializeSamusPose_MorphingTransition 
    dw InitializeSamusPose_MorphingTransition 
    dw UNUSED_InitializeSamusPose_UnusedPose39_91F7F4 
    dw UNUSED_InitializeSamusPose_UnusedPose3A_91F840 
    dw CLCRTS_91F7CC 
    dw CLCRTS_91F7CC 
    dw CLCRTS_91F7CC 
    dw CLCRTS_91F7CC 
    dw CLCRTS_91F7CC 
    dw CLCRTS_91F7CC 

.unusedPointers:
    dw InitializeSamusPose_MorphingTransition ; Unused poses D8-DE
    dw InitializeSamusPose_MorphingTransition 
    dw CLCRTS_91F7CC 
    dw CLCRTS_91F7CC 

InitializeSamusPose_CrouchingTransition:
    LDA.W $0B3E 
    AND.W #$FF00 
    CMP.W #$0400 
    BMI .returnCarryClear 
    LDA.W #$00B4 
    STA.W $0A68 
    LDA.W #$0001 
    STA.W $0ACC 
    STZ.W $0ACE 

.returnCarryClear:
    CLC 
    RTS 


CLCRTS_91F7CC:
    CLC 
    RTS 


InitializeSamusPose_MorphingTransition:
    LDA.W $09A2 
    BIT.W #$0004 
    BEQ .noMorphBall 
    LDA.W $0A23 
    AND.W #$00FF 
    CMP.W #$0003 
    BNE .spinJumping 
    LDA.W #$0002 
    STA.W $0B4A 

.spinJumping:
    STZ.W $0CD4 
    CLC 
    RTS 


.noMorphBall:
    LDA.W $0A20 
    STA.W $0A1C 
    SEC 
    RTS 


UNUSED_InitializeSamusPose_UnusedPose39_91F7F4:
    LDA.W $0A23 
    AND.W #$00FF 
    CMP.W #$0008 
    BEQ .wasFalling 
    CMP.W #$0013 
    BEQ .wasFalling 
    LDA.W $09A2 
    BIT.W #$0000 
    BNE .returnCarryClear 
    BIT.W #$0002 
    BNE .facingRight 
    LDA.W #$001D 
    STA.W $0A1C 
    BRA .returnCarrySet 


.facingRight:
    LDA.W #$0079 
    STA.W $0A1C 
    BRA .returnCarrySet 


.wasFalling:
    LDA.W $09A2 
    BIT.W #$0000 
    BNE .returnCarryClear 
    BIT.W #$0002 
    BNE ..facingRight 
    LDA.W #$0031 
    STA.W $0A1C 
    BRA .returnCarrySet 


..facingRight:
    LDA.W #$007D 
    STA.W $0A1C 

.returnCarrySet:
    SEC 
    RTS 


.returnCarryClear:
    CLC 
    RTS 


UNUSED_InitializeSamusPose_UnusedPose3A_91F840:
    LDA.W $0A23 
    AND.W #$00FF 
    CMP.W #$0008 
    BEQ .wasFalling 
    CMP.W #$0013 
    BEQ .wasFalling 
    LDA.W $09A2 
    BIT.W #$0000 
    BNE .returnCarryClear 
    BIT.W #$0002 
    BNE .springBall 
    LDA.W #$0041 
    STA.W $0A1C 
    BRA .returnCarrySet 


.springBall:
    LDA.W #$007A 
    STA.W $0A1C 
    BRA .returnCarrySet 


.wasFalling:
    LDA.W $09A2 
    BIT.W #$0000 
    BNE .returnCarryClear 
    BIT.W #$0002 
    BNE ..springBall 
    LDA.W #$0032 
    STA.W $0A1C 
    BRA .returnCarrySet 


..springBall:
    LDA.W #$007E 
    STA.W $0A1C 

.returnCarrySet:
    SEC 
    RTS 


.returnCarryClear:
    CLC 
    RTS 


InitializeSamusPose_Moonwalking:
    LDA.W $09E4 
    BEQ .enabled 
    CLC 
    RTS 


.enabled:
    LDA.W $0A1E 
    AND.W #$00FF 
    CMP.W #$0004 
    BEQ .facingLeft 
    LDA.W #$0026 
    STA.W $0A1C 
    BRA .returnCarrySet 


.facingLeft:
    LDA.W #$0025 
    STA.W $0A1C 

.returnCarrySet:
    SEC 
    RTS 


InitializeSamusPose_DamageBoost:
    BRA .nonDeadCode 

    LDA.W $0A1E 
    AND.W #$00FF 
    CMP.W #$0004 
    BEQ .facingLeft 
    LDA.W #$0053 
    STA.W $0A1C 
    BRA .returnCarrySet 


.facingLeft:
    LDA.W #$0054 
    STA.W $0A1C 

.returnCarrySet:
    SEC 
    RTS 


.nonDeadCode:
    LDA.W #SamusMovementHandler_Normal 
    STA.W $0A58 
    CLC 
    RTS 


InitializeSamusPose_TurningAround_OnGround:
    LDA.W $0A20 
    BEQ .done 
    CMP.W #$009B 
    BEQ .done 
    ASL #3
    TAX 
    LDA.W PoseDefinitions_directionShotsFired,X 
    AND.W #$00FF 
    TAX 
    LDA.W $0A23 
    AND.W #$00FF 
    CMP.W #$0010 
    BNE .notMoonwalking 
    LDA.W $0A20 
    ASL #3
    TAY 
    LDA.W PoseDefinitions_directionShotsFired,Y 
    AND.W #$00FF 
    ORA.W #$0100 
    STA.W $0B5E 
    LDA.B $8B 
    BIT.W $09B4 
    BEQ .standing 
    LDA.W TurningSamusPoses_moonwalk,X 
    AND.W #$00FF 
    STA.W $0A1C 
    BRA .done 


.notMoonwalking:
    CMP.W #$0005 
    BEQ .crouching 

.standing:
    LDA.W TurningSamusPoses_standing,X 
    AND.W #$00FF 
    STA.W $0A1C 
    BRA .done 


.crouching:
    LDA.W TurningSamusPoses_crouching,X 
    AND.W #$00FF 
    STA.W $0A1C 

.done:
    LDA.W $0B44 
    CLC 
    ADC.W $0B48 
    STA.W $0B48 
    LDA.W $0B42 
    ADC.W $0B46 
    STA.W $0B46 
    STZ.W $0B44 
    STZ.W $0B42 
    LDA.W #$0001 
    STA.W $0B4A 
    SEC 
    RTS 


InitializeSamusPose_TurningAround_Jumping:
    LDA.W $0A20 
    ASL #3
    TAX 
    LDA.W PoseDefinitions_directionShotsFired,X 
    AND.W #$00FF 
    TAX 
    LDA.W TurningSamusPoses_jumpingInAir,X 
    AND.W #$00FF 
    STA.W $0A1C 
    LDA.W $0B44 
    CLC 
    ADC.W $0B48 
    STA.W $0B48 
    LDA.W $0B42 
    ADC.W $0B46 
    STA.W $0B46 
    STZ.W $0B44 
    STZ.W $0B42 
    LDA.W #$0001 
    STA.W $0B4A 
    SEC 
    RTS 


InitializeSamusPose_TurningAround_Falling:
    LDA.W $0A20 
    ASL #3
    TAX 
    LDA.W PoseDefinitions_directionShotsFired,X 
    AND.W #$00FF 
    TAX 
    LDA.W TurningSamusPoses_falling,X 
    AND.W #$00FF 
    STA.W $0A1C 
    LDA.W $0B44 
    CLC 
    ADC.W $0B48 
    STA.W $0B48 
    LDA.W $0B42 
    ADC.W $0B46 
    STA.W $0B46 
    STZ.W $0B44 
    STZ.W $0B42 
    LDA.W #$0001 
    STA.W $0B4A 
    SEC 
    RTS 


TurningSamusPoses_standing:
    db $8B,$9C,$25,$8D,$8D,$8E,$8E,$26,$9D,$8C 

TurningSamusPoses_crouching:
    db $97,$A2,$43,$99,$99,$9A,$9A,$44,$A3,$98 

TurningSamusPoses_jumpingInAir:
    db $8F,$9E,$2F,$91,$91,$92,$92,$30,$9F,$90 

TurningSamusPoses_falling:
    db $93,$A0,$87,$95,$95,$96,$96,$88,$A1,$94 

TurningSamusPoses_moonwalk:
    db $C1,$C1,$BF,$C3,$8D,$8E,$C4,$C0,$C2,$C2 

InitializeSamusPose_MorphBall:
    LDA.W $0A23 
    AND.W #$00FF 
    CMP.W #$0004 
    BEQ .preserveAnimationFrame 
    CMP.W #$0008 
    BNE .wasNotMorphBall 

.preserveAnimationFrame:
    LDA.W #$8000 
    STA.W $0A9A 

.wasNotMorphBall:
    JSR.W ApplyMomentumIfTurningInMorphBall 
    CLC 
    RTS 


ApplyMomentumIfTurningInMorphBall:
    LDA.W $0A22 
    AND.W #$00FF 
    CMP.W #$0008 
    BEQ .directionChanged 
    LDA.W $0A1E 
    AND.W #$00FF 
    CMP.W #$0008 
    BEQ .speed 
    BRA .return 


.directionChanged:
    LDA.W $0A1E 
    AND.W #$00FF 
    CMP.W #$0004 
    BNE .return 

.speed:
    LDA.W $0B44 
    CLC 
    ADC.W $0B48 
    STA.W $0B48 
    LDA.W $0B42 
    ADC.W $0B46 
    STA.W $0B46 
    JSL.L Cancel_SpeedBoosting 
    STZ.W $0B44 
    STZ.W $0B42 
    LDA.W #$0001 
    STA.W $0B4A 

.return:
    RTS 


InitializeSamusPose_SpringBall:
    LDA.W $0A23 
    AND.W #$00FF 
    CMP.W #$0011 
    BEQ .preserveAnimationFrame 
    CMP.W #$0012 
    BEQ .preserveAnimationFrame 
    CMP.W #$0013 
    BNE .wasNotSpringBall 

.preserveAnimationFrame:
    LDA.W #$8000 
    STA.W $0A9A 

.wasNotSpringBall:
    JSR.W ApplyMomentumIfTurningInMorphBall 
    CLC 
    RTS 


InitializeSamusPose_WallJumping:
    JSL.L Get_Samus_Bottom_Boundary 
    LDA.W $195E 
    BMI .negativeYPosition 
    CMP.B $12 
    BPL .nonLiquidPhysics 
    LDA.W $197E 
    BIT.W #$0004 
    BNE .nonLiquidPhysics 
    BRA .returnCarryClear 


.negativeYPosition:
    LDA.W $1962 
    BMI .nonLiquidPhysics 
    CMP.B $12 
    BMI .returnCarryClear 

.nonLiquidPhysics:
    LDA.W #$0600 
    STA.W $0AF2 
    LDA.W #$0003 
    STA.W $0ADA 
    LDA.B $12 
    STA.W $0AEA 
    LDA.W $0A1E 
    AND.W #$00FF 
    CMP.W #$0008 
    BEQ .facingRight 
    LDA.W $0AF6 
    CLC 
    ADC.W #$0006 
    STA.W $0AE2 
    CLC 
    RTS 


.facingRight:
    LDA.W $0AF6 
    SEC 
    SBC.W #$0006 
    STA.W $0AE2 

.returnCarryClear:
    CLC 
    RTS 


InitializeSamusPose_Shinespark_CF_Drained_DamagedMB:
    LDA.W $0A1C 
    CMP.W #$00CF 
    BPL .returnCarryClear 
    SEC 
    SBC.W #$00C9 
    ASL A 
    TAX 
    LDA.W .pointers,X 
    STA.W $0A58 
    LDA.W #RTS_90E90E 
    STA.W $0A60 
    STZ.W $0AAE 
    STZ.W $0AC0 
    STZ.W $0AC2 
    STZ.W $0AB0 
    STZ.W $0AB2 
    LDA.W #$000F 
    JSL.L QueueSound_Lib3_Max9 

.returnCarryClear:
    CLC 
    RTS 


.pointers:
    dw SamusMovementHandler_HorizontalShinespark 
    dw SamusMovementHandler_HorizontalShinespark 
    dw SamusMovementHandler_VerticalShinespark 
    dw SamusMovementHandler_VerticalShinespark 
    dw SamusMovementHandler_DiagonalShinespark 
    dw SamusMovementHandler_DiagonalShinespark 

Set_Samus_AnimationFrame_if_PoseChanged:
    PHP 
    PHB 
    PHK 
    PLB 
    REP #$30 
    LDA.W $09A2 
    BIT.W #$0020 
    BNE .normalGravity 
    LDA.W $0A1C 
    ASL #3
    TAX 
    LDA.L PoseDefinitions_YRadius,X 
    AND.W #$00FF 
    CLC 
    ADC.W $0AFA 
    DEC A 
    STA.B $12 
    LDA.W $195E 
    BMI .negativeYPosition 
    CMP.B $12 
    BMI .submergedInWater 
    BRA .normalGravity 


.negativeYPosition:
    LDA.W $1962 
    BMI .normalGravity 
    CMP.B $12 
    BMI .submergedInAcidLava 

.normalGravity:
    LDA.W $0A66 
    STA.B $12 
    BRA .merge 


.submergedInWater:
    LDA.W $197E 
    BIT.W #$0004 
    BNE .normalGravity 
    LDA.L SamusPhysicsConstants_AnimationDelayInWater 
    STA.B $12 
    BRA .merge 


.submergedInAcidLava:
    LDA.L SamusPhysicsConstants_AnimationDelayInLavaAcid 
    STA.B $12 

.merge:
    LDA.W $0A9A 
    BMI .return 
    LDA.W $0A1C 
    CMP.W $0A20 
    BEQ .return 
    LDA.W #$0000 
    CLC 
    ADC.W $0A9A 
    STA.W $0A96 
    TAY 
    LDA.W $0A1C 
    ASL A 
    TAX 
    TYA 
    CLC 
    ADC.W AnimationDelayTable,X 
    TAY 
    LDA.W $0000,Y 
    AND.W #$00FF 
    CLC 
    ADC.B $12 
    STA.W $0A94 

.return:
    PLB 
    PLP 
    RTL 


PossiblyNoPurpose_91FB8E:
    PHP 
    PHB 
    PHK 
    PLB 
    REP #$30 
    LDA.W $0A23 
    AND.W #$00FF 
    CMP.W #$0006 
    BEQ .return 
    LDA.W $0A1F 
    AND.W #$00FF 
    CMP.W #$0006 
    BEQ .falling 
    BRA .return 


.falling:
    STZ.W $0B2C 
    STZ.W $0B2E 
    LDA.W #$0002 
    STA.W $0B36 

.return:
    PLB 
    PLP 
    RTL 


HandleJumpTransition:
    PHP 
    PHB 
    PHK 
    PLB 
    REP #$30 
    LDA.W $0A1F 
    AND.W #$00FF 
    ASL A 
    TAX 
    JSR.W (.pointers,X) 
    PLB 
    PLP 
    RTL 


.pointers:
    dw RTS_91FC07 
    dw RTS_91FC07 
    dw HandleJumpTransition_NormalJumping 
    dw HandleJumpTransition_SpinJumping 
    dw RTS_91FC07 
    dw RTS_91FC07 
    dw RTS_91FC07 
    dw RTS_91FC07 
    dw RTS_91FC07 
    dw RTS_91FC07 
    dw RTS_91FC07 
    dw RTS_91FC07 
    dw RTS_91FC07 
    dw UNUSED_HandleJumpTransition_MovementTypeD_91FC42 
    dw RTS_91FC07 
    dw RTS_91FC07 
    dw RTS_91FC07 
    dw RTS_91FC07 
    dw HandleJumpTransition_SpringBall_InAir 
    dw RTS_91FC07 
    dw HandleJumpTransition_WallJumping 
    dw RTS_91FC07 
    dw RTS_91FC07 
    dw RTS_91FC07 
    dw RTS_91FC07 
    dw RTS_91FCAE 
    dw RTS_91FC07 
    dw RTS_91FC07 

RTS_91FC07:
    RTS 


HandleJumpTransition_WallJumping:
    LDA.W $0A23 
    AND.W #$00FF 
    CMP.W #$0014 
    BEQ .return 
    JSL.L Make_Samus_WallJump 

.return:
    RTS 


HandleJumpTransition_SpringBall_InAir:
    LDA.W $0A1C 
    CMP.W #$007F 
    BNE .facingLeft 
    LDA.W $0A23 
    AND.W #$00FF 
    CMP.W #$0011 
    BEQ .jump 
    BRA .return 


.facingLeft:
    CMP.W #$0080 
    BNE .return 
    LDA.W $0A23 
    AND.W #$00FF 
    CMP.W #$0011 
    BNE .return 

.jump:
    JSL.L Make_Samus_Jump 

.return:
    RTS 


UNUSED_HandleJumpTransition_MovementTypeD_91FC42:
    LDA.W $0A1C 
    CMP.W #$0065 
    BNE .notPose65 
    LDA.W $0A20 
    CMP.W #$0064 
    BEQ .jump 
    BRA .return 


.notPose65:
    CMP.W #$0066 
    BNE .return 
    LDA.W $0A20 
    CMP.W #$0063 
    BNE .return 

.jump:
    JSL.L Make_Samus_Jump 

.return:
    RTS 


HandleJumpTransition_NormalJumping:
    LDA.W $0A1C 
    CMP.W #$004B 
    BEQ .normalJump 
    CMP.W #$004C 
    BEQ .normalJump 
    CMP.W #$0055 
    BMI .return 
    CMP.W #$005B 
    BPL .return 

.normalJump:
    LDA.W $0A20 
    CMP.W #$0027 
    BEQ .crouchJump 
    CMP.W #$0028 
    BNE .jump 

.crouchJump:
    LDA.W $0AFA 
    SEC 
    SBC.W #$000A 
    STA.W $0AFA 

.jump:
    JSL.L Make_Samus_Jump 

.return:
    RTS 


HandleJumpTransition_SpinJumping:
    LDA.W $0A23 
    AND.W #$00FF 
    CMP.W #$0003 
    BEQ .return 
    CMP.W #$0014 
    BEQ .return 
    JSL.L Make_Samus_Jump 

.return:
    RTS 


RTS_91FCAE:
    RTS 


XraySamusPoseInputHandler:
    PHP 
    REP #$30 
    LDA.W $0A1F 
    AND.W #$00FF 
    CMP.W #$000E 
    BNE .notTurningOnGround 
    JMP.W .turningOnGround 


.notTurningOnGround:
    LDA.W $0A1E 
    AND.W #$00FF 
    CMP.W #$0004 
    BEQ .notTurningFacingLeft 
    LDA.B $8B 
    BIT.W $09AE 
    BEQ .returnMiddle 
    LDA.W #$0100 
    SEC 
    SBC.W $0A82 
    STA.W $0A82 
    LDA.W $0A1F 
    AND.W #$00FF 
    CMP.W #$0005 
    BEQ ..crouching 
    LDA.W #$0025 
    STA.W $0A1C 
    BRA .notTurningMerge 


..crouching:
    LDA.W #$0043 
    STA.W $0A1C 
    BRA .notTurningMerge 


.notTurningFacingLeft:
    LDA.B $8B 
    BIT.W $09B0 
    BEQ .returnMiddle 
    LDA.W #$0100 
    SEC 
    SBC.W $0A82 
    STA.W $0A82 
    LDA.W $0A1F 
    AND.W #$00FF 
    CMP.W #$0005 
    BEQ ..crouching 
    LDA.W #$0026 
    STA.W $0A1C 
    BRA .notTurningMerge 


..crouching:
    LDA.W #$0044 
    STA.W $0A1C 

.notTurningMerge:
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

.returnMiddle:
    PLP 
    RTL 


.turningOnGround:
    LDA.W $0A96 
    CMP.W #$0002 
    BNE .returnLower 
    LDA.W $0A94 
    CMP.W #$0001 
    BNE .returnLower 
    LDA.W $0A1E 
    AND.W #$00FF 
    CMP.W #$0004 
    BEQ .turningFacingLeft 
    LDA.W $0A1C 
    CMP.W #$0026 
    BNE ..crouching 
    LDA.W #$00D5 
    STA.W $0A1C 
    BRA .turningMerge 


..crouching:
    LDA.W #$00D9 
    STA.W $0A1C 
    BRA .turningMerge 


.turningFacingLeft:
    LDA.W $0A1C 
    CMP.W #$0025 
    BNE ..XrayCrouching 
    LDA.W #$00D6 
    STA.W $0A1C 
    BRA .turningMerge 


..XrayCrouching:
    LDA.W #$00DA 
    STA.W $0A1C 

.turningMerge:
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

.returnLower:
    PLP 
    RTL 


HandlePoseChangeCollision:
    PHP 
    REP #$30 
    LDA.W $0A1C 
    BEQ .returnUpper 
    CMP.W #$009B 
    BNE .notFacingForward 

.returnUpper:
    PLP 
    RTS 


.notFacingForward:
    STZ.W $0A34 
    STZ.W $0A36 
    LDA.W $0A1C 
    ASL #3
    TAX 
    LDA.L PoseDefinitions_YRadius,X 
    AND.W #$00FF 
    STA.B $12 
    LDA.W $0A20 
    ASL #3
    TAX 
    LDA.L PoseDefinitions_YRadius,X 
    AND.W #$00FF 
    CMP.B $12 
    BMI .larger 
    PLP 
    RTS 


.larger:
    STA.W $0B00 
    LDA.B $12 
    SEC 
    SBC.W $0B00 
    STA.W $0A3A 
    STA.B $12 
    STZ.B $14 
    LDA.W #$0002 
    STA.W $0B02 
    JSL.L Samus_vs_SolidEnemy_CollisionDetection 
    STA.W $0DD0 
    TAX 
    BEQ .noCollision 
    LDA.W #$0001 
    STA.W $0A34 

.noCollision:
    LDA.B $12 
    STA.W $0A3E 
    LDA.W $0A3A 
    STA.B $12 
    STZ.B $14 
    LDA.W #$0003 
    STA.W $0B02 
    JSL.L Samus_vs_SolidEnemy_CollisionDetection 
    STA.W $0DD0 
    TAX 
    BEQ .stillNoCollision 
    LDA.W $0A34 
    ORA.W #$0002 
    STA.W $0A34 

.stillNoCollision:
    LDA.B $12 
    STA.W $0A40 
    LDA.W $0A34 
    ASL A 
    TAX 
    JSR.W (.solidEnemyPointers,X) 
    BCS .revertPose 
    LDA.W $0A3A 
    EOR.W #$FFFF 
    INC A 
    STA.B $12 
    STZ.B $14 
    JSL.L BlockCollisionDetectionDueToChangeOfPose 
    BCC .noCollisionAgain 
    LDA.W #$0001 
    STA.W $0A36 

.noCollisionAgain:
    LDA.B $12 
    STA.W $0A38 
    LDA.W $0A3A 
    STA.B $12 
    STZ.B $14 
    JSL.L BlockCollisionDetectionDueToChangeOfPose 
    BCC .noCollisionFinal 
    LDA.W $0A36 
    ORA.W #$0002 
    STA.W $0A36 

.noCollisionFinal:
    LDA.B $12 
    STA.W $0A3C 
    LDA.W $0A36 
    ASL A 
    TAX 
    JSR.W (.blockPointers,X) 
    BCC .return 

.revertPose:
    LDA.W $0A20 
    STA.W $0A1C 

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

CLCRTS_91FE9A:
    CLC 
    RTS 


CLCRTS_91FE9C:
    CLC 
    RTS 


PoseChangeCollision_SolidEnemy_FromAbove:
    LDA.W $0A3A 
    SEC 
    SBC.W $0A3E 
    STA.B $12 
    STZ.B $14 
    LDA.W $0B00 
    PHA 
    LDA.W $0A1C 
    ASL #3
    TAX 
    LDA.L PoseDefinitions_YRadius,X 
    AND.W #$00FF 
    STA.W $0B00 
    LDA.W #$0003 
    STA.W $0B02 
    JSL.L Samus_vs_SolidEnemy_CollisionDetection 
    STA.W $0DD0 
    TAX 
    BNE .collision 
    LDA.B $12 
    STA.W $0A3E 
    PLA 
    STA.W $0B00 
    CLC 
    RTS 


.collision:
    PLA 
    STA.W $0B00 
    SEC 
    RTS 


PoseChangeCollision_SolidEnemy_FromBelow:
    LDA.W $0A3A 
    SEC 
    SBC.W $0A40 
    STA.B $12 
    STZ.B $14 
    LDA.W $0B00 
    PHA 
    LDA.W $0A1C 
    ASL #3
    TAX 
    LDA.L PoseDefinitions_YRadius,X 
    AND.W #$00FF 
    STA.W $0B00 
    LDA.W #$0002 
    STA.W $0B02 
    JSL.L Samus_vs_SolidEnemy_CollisionDetection 
    STA.W $0DD0 
    TAX 
    BNE .collision 
    LDA.B $12 
    STA.W $0A40 
    PLA 
    STA.W $0B00 
    CLC 
    RTS 


.collision:
    PLA 
    STA.W $0B00 
    SEC 
    RTS 


PoseChangeCollision_Block_FromAbove:
    LDA.W $0A3A 
    SEC 
    SBC.W $0A38 
    STA.B $12 
    STZ.B $14 
    JSL.L BlockCollisionDetectionDueToChangeOfPose 
    BCS .returnCarrySet 
    LDA.W $0A34 
    BIT.W #$0002 
    BNE HandleCollisionFromBothSidesDueToPoseChange 
    LDA.W $0AFA 
    CLC 
    ADC.B $12 
    STA.W $0AFA 
    STA.W $0B14 
    CLC 
    RTS 


.returnCarrySet:
    SEC 
    RTS 


PoseChangeCollision_Block_FromBelow:
    LDA.W $0A3A 
    SEC 
    SBC.W $0A3C 
    EOR.W #$FFFF 
    INC A 
    STA.B $12 
    STZ.B $14 
    JSL.L BlockCollisionDetectionDueToChangeOfPose 
    BCS .returnCarrySet 
    LDA.W $0A34 
    BIT.W #$0001 
    BNE HandleCollisionFromBothSidesDueToPoseChange 
    LDA.W $0AFA 
    SEC 
    SBC.B $12 
    STA.W $0AFA 
    STA.W $0B14 
    CLC 
    RTS 


.returnCarrySet:
    SEC 
    RTS 


PoseChangeCollision_NoCollision:
    LDA.W $0A34 
    ASL A 
    TAX 
    JMP.W (.pointers,X) 

    RTS ; >.<


.pointers:
    dw CLCRTS_91FF87 
    dw HandleBlockCollisionToPoseChange_NoCollision_Enemy_FromAbove 
    dw HandleBlockCollisionToPoseChange_NoCollision_Enemy_FromBelow 
    dw HandleCollisionFromBothSidesDueToPoseChange 

CLCRTS_91FF87:
    CLC 
    RTS 


HandleBlockCollisionToPoseChange_NoCollision_Enemy_FromAbove:
    LDA.W $0AFA 
    CLC 
    ADC.W $0A3E 
    STA.W $0AFA 
    STA.W $0B14 
    CLC 
    RTS 


HandleBlockCollisionToPoseChange_NoCollision_Enemy_FromBelow:
    LDA.W $0AFA 
    SEC 
    SBC.W $0A40 
    STA.W $0AFA 
    STA.W $0B14 
    CLC 
    RTS 


HandleCollisionFromBothSidesDueToPoseChange:
    LDA.W $0B00 
    CMP.W #$0008 
    BPL .notMorphBall 
    SEC 
    RTS 


.notMorphBall:
    LDA.W $0A1E 
    AND.W #$00FF 
    CMP.W #$0004 
    BEQ .facingLeft 
    LDA.W #$0027 
    BRA + 


.facingLeft:
    LDA.W #$0028 

  + STA.W $0A1C 
    ASL #3
    TAX 
    LDA.L PoseDefinitions_YRadius,X 
    AND.W #$00FF 
    STA.B $12 
    LDA.W $0B00 
    CMP.B $12 
    BPL .returnCarryClear 
    SEC 
    SBC.B $12 
    STA.B $12 
    LDA.W $0AFA 
    CLC 
    ADC.B $12 
    STA.W $0AFA 
    STA.W $0B14 

.returnCarryClear:
    CLC 
    RTS 


Freespace_Bank91_FFEE: 
; $12 bytes
