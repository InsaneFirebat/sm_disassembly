
incsrc freespace.asm


org $0000C1
RumbleData: skip 1 ; $C1
RumbleTime: skip 1 ; $C2
RumbleFlag: skip 1 ; $C3


macro rumbleWritePort()
    STA $4201
    BIT $4016 ; Strobe
endmacro

macro rumbleZeroPort()
    STZ $4201
    BIT $4016 ; Strobe
endmacro

macro rumble8(LeftRight, Time)
    ; strength (%xxxxyyyy - xxxx - left motor | yyyy - right motor)
    LDA.b #<LeftRight> : STA.b RumbleData
    ; length of time
    LDA.b #<Time> : STA.b RumbleTime
endmacro

macro rumble16(LeftRight, Time)
    LDA.w #(<Time><<8)|<LeftRight> : STA.b RumbleData
endmacro


org $809490
    JSR ControllerRumbleHandler
    BRA $00

org $848C10
    JSR CrumbleBlockBreaks

org $848C7C
    JSR CrumbleBlockContact

org $84D359
    JSR BombTorizoStatueCrumbles

org $84D52D
    JSR MaridiaTubeCracks

org $858122
    JSR SavingSFX

org $86C38A
    JSR BabyMetroidAttacked

org $86E6CD
    JSR SaveStationElectricity

org $86EB63
    JSR BotwoonBodyExplosions

org $888AA9
    JSR PowerBombExplosion

org $88E092
    JSR SuitPickupAnimation

org $8BA94F
    JSR MetroidEggHatched

org $8BB812
    JSR IntroMotherBrainExplosions1

org $8BB82E
    JMP IntroMotherBrainExplosions2

org $8BB9AF
    JSR IntroMotherBrainExplosions3

org $8BBE59
    JSR ShipFliesIntoCamera

org $8BC3B7
    JSR CeresExplodes1

org $8BC405
    JSR CeresExplodes2

org $8BC4A8
    JSR CeresPowerBomb

org $8BCA2B
    JSR ShipFliesToZebes1

org $8BCA32
    JSR ShipFliesToZebes2

org $8BF2DB
    JSR ZebesExplodes

org $8BF606
    JSR SamusShootsScreen

org $8FE942
    JSR CrocomireRoomShaking

org $909A2F
    JSR BombJump

org $90B843
    JSR ChargingBeam

org $90B8AA
    JSR UnchargedShot

org $90B9A1
    JSR ChargedShot

org $90BD5C
    JSR HyperBeam

org $90BEBF
    JSR Missiles

org $90BEC4
    JSR SuperMissiles

org $90D0CE
    JSR Shinespark

org $90D0FD
    JSR Shinespark

org $90D129
    JSR Shinespark

org $90D2C9
    JSR ShinesparkCrash

org $90DEF2
    JSR KnockbackTransitionFalling

org $90DEFA
    JSR KnockbackTransitionNormal

org $90DF15
    JSR KnockbackTransitionMorphed

org $90EA1A
    JSR PeriodicDamage

org $938152
    SEP #$20
    JSR BombExplodes

org $94933C
    JSR BlockCrumblesOnContact

org $A0868F
    JMP RoomShaking

org $A0A485
    JSR EnemyDiesOnContact

org $A2AB6E
    JSR ExitingShip1

org $A2AB85
    JSR ExitingShip2

org $A3952A
    JSR StandingOnElevator1

org $A39537
    JSR StandingOnElevator2

org $A48FB7
    JSR CollapseCrocomiresBridge

org $A4950F
    JSR CrocomireMelting

org $A49A1B
    JSR CrocomireBreaksWall1

org $A49A25
    JSR CrocomireBreaksWall2

org $A49A7E
    JSR CrocomireSkeletonCollapse

org $A5E9EB
    JSR SporeSpawnDeathExplosions

org $A68814
    JSR BoulderBounces

org $A688CB
    JSR BoulderBreaks

org $A69C58
    JSR MiniKraidDeathExplosions

org $A6AAE3
    JSR CeresRidleyFlyby

org $A6B889
    JSR RidleyPicksUpSamus

org $A6E009
    JSR RidleyTailHit

org $A6F78B
    JMP EarthquakeHandler1

org $A6F796
    JMP EarthquakeHandler2

org $A7D993
    JSR PhantoonDeathExplosions

org $A8A668
    JSR YappingMawGrabsSamus

org $A8BEA8
    JSR BeetomGrabsSamus

org $A9AF12
    JSR MotherBrainDeathExplosions

org $A9B013
    JSR MotherBrainDeathExplosions

org $A9BA3C
    JSR RainbowBeam

org $A9C560
    JSR BabyMetroidDrain

org $A9CDF4
    JSR BabyMetroidDeathExplosions

org $AAC878
    JSR TorizoJumpCollision

org $AAE57F
    JSR ChozoStatueGrabsMorphBall


%startfree(80)
ControllerRumbleHandler:
{
    SEP #$20
    LDA.b RumbleTime : BEQ .rumbleOff
    DEC.b RumbleTime
    BRA .continue

  .rumbleOff
    STZ.b RumbleData

  .continue
    ; HACK: apparently this is needed to work on hardware?
    LDA #$01 : STA $4016
    NOP #2
    STZ $4016
    NOP #2
    ; Read 16 Controller Bits
    LDA #$0F

  .readJoy2
    ; Controller I
    BIT $4016
    DEC : BPL .readJoy2

    ; Write 01110010 to the Controller Port
    LDA #$40
    %rumbleZeroPort()  ; 0
    %rumbleWritePort() ; 1
    BIT $4016          ; 1 (just strobing works: the IO port already has 1)
    BIT $4016          ; 1
    %rumbleZeroPort()  ; 0
    BIT $4016          ; 0
    %rumbleWritePort() ; 1
    %rumbleZeroPort()  ; 0

    ; Now we write the rumble intensity: rrrrllll (right and left motors)
    LDA.b RumbleData : LSR ; -7654321, C <- 0
    %rumbleWritePort()     ; bit7
    ROL                    ; 76543210
    %rumbleWritePort()     ; bit6
    ASL                    ; 6543210-
    %rumbleWritePort()     ; bit5
    ASL                    ; 543210--
    %rumbleWritePort()     ; bit4
    ASL                    ; 43210---
    %rumbleWritePort()     ; bit3
    ASL                    ; 3210----
    %rumbleWritePort()     ; bit2
    ASL                    ; 210-----
    %rumbleWritePort()     ; bit1
    ASL                    ; 10------
    %rumbleWritePort()     ; bit0
    RTS
}
%endfree(80)


%startfree(84)
CrumbleBlockBreaks:
{
    %rumble16($66, $1E)
    LDA $0000,Y
    RTS
}

CrumbleBlockContact:
{
    %rumble16($22, 3)
    LDA $0000,Y
    RTS
}

BombTorizoStatueCrumbles:
{
    %rumble16($11, 10)
    LDA $0000,Y
    RTS
}

MaridiaTubeCracks:
{
    %rumble16($22, $2E)
    LDY #$D904
}
%endfree(84)


%startfree(85)
SavingSFX:
{
    %rumble16($22, $A0)
    LDA #$00A0
    RTS
}
%endfree(85)


%startfree(86)
TorizoDeathExplosions:
{
    STA $1B23
    %rumble16($33, 7)
    RTS
}

BabyMetroidAttacked:
{
    LDA $1028 : CMP #$CAAF : BNE +
    %rumble16($55, 6)
+   JMP $C410
}

SaveStationElectricity:
{
    %rumble16($22, $A0)
    STA $1A93,Y
    RTS
}

BotwoonBodyExplosions:
{
    %rumble16($33, 8)
    LDA #$00A0
    RTS
}
%endfree(86)


%startfree(88)
PowerBombExplosion:
{
    %rumble16($44, $50)
    LDA #$0001
    RTS
}

SuitPickupAnimation:
{
    %rumble16($22, $C8)
    LDA $0DEE
    RTS
}
%endfree(88)


%startfree(8B)
MetroidEggHatched:
{
    %rumble16($22, 8)
    LDA #$000B
    RTS
}

IntroMotherBrainExplosions1:
{
    LDA #$FF66 : STA.b RumbleData
    JMP $B877
}

IntroMotherBrainExplosions2:
{
    JSR $B877
    LDY #$FF66 : STY.b RumbleData
    LDA $1A4B : CMP #$0060 : BPL .return
    LDY #$FF55 : STY.b RumbleData
    CMP #$0040 : BPL .return
    LDY #$FF44 : STY.b RumbleData
    CMP #$0020 : BPL .return
    LDY #$FF33 : STY.b RumbleData
    LDA $1A4B : BNE .return
    STZ.b RumbleData
    JMP $B836

  .return
    JMP $B845
}

IntroMotherBrainExplosions3:
{
    %rumble16($66, 6)
    LDA #$0A00
    RTS
}

ShipFliesIntoCamera:
{
    %rumble8($44, $35)
    LDA #$0001
    RTS
}

CeresExplodes1:
{
    %rumble8($AA, $60)
    LDA #$0000
    RTS
}

CeresExplodes2:
{
    %rumble16($44, $60)
    LDA #$0000
    RTS
}

CeresPowerBomb:
{
    %rumble16($33, $9C)
    LDA #$000C
    RTS
}

ShipFliesToZebes1:
{
    SEP #$20
    LDA.b RumbleFlag : BNE .return
    LDA #$44 : STA.b RumbleData
    LDA #$20 : STA.b RumbleTime : STA.b RumbleFlag
    REP #$20

  .return
    RTS
}

ShipFliesToZebes2:
{
    STA $1F51
    STZ.b RumbleFlag
    RTS
}

ZebesExplodes:
{
    %rumble8($55, $FF)
    LDA #$0002
    RTS
}

SamusShootsScreen:
{
    %rumble8($44, $30)
    LDA #$0E00
    RTS
}
%endfree(8B)


%startfree(8F)
CrocomireRoomShaking:
{
    %rumble16($44, 3)
    LDA $0915
    RTS
}
%endfree(8F)


%startfree(90)
BombJump:
{
    SEP #$20
    LDA #$44 : STA.b RumbleData
    LDA #$08 : STA.b RumbleTime
    REP #$30
    LDA $09A2
    RTS
}

ChargingBeam:
{
    LDA $0CD0 : BEQ .skipRumble
    PHA
    SEP #$20
    LDA.b RumbleData : CMP #$22 : BPL +
    LDA #$22 : STA.b RumbleData
+   LDA.b RumbleTime : BNE +
    LDA #$01 : STA.b RumbleTime
+   REP #$20
    PLA

  .skipRumble
    RTS
}

UnchargedShot:
{
    %rumble16($22, 8)
    LDX #$0000
    RTS
}

ChargedShot:
{
    %rumble16($33, 10)
    LDX #$0000
    RTS
}

HyperBeam:
{
    %rumble16($33, 10)
    LDA #$8000
    RTS
}

Missiles:
{
    %rumble16($33, 8)
    DEC $09C6
    RTS
}

SuperMissiles:
{
    %rumble16($44, 10)
    DEC $09CA
    RTS
}

Shinespark:
{
    %rumble16($22, 4)
    DEC $09C2
    RTS
}

ShinesparkCrash:
{
    %rumble16($66, 12)
    LDA $0A1E
    RTS
}

KnockbackTransitionFalling:
{
    SEP #$20
    LDA.b #$44 : CMP.b RumbleData : BCC +
    STA.b RumbleData
+   LDA $18AA : CMP.b RumbleTime : BCC +
    STA.b RumbleTime
+   REP #$20
    STZ $0A30
    RTS
}

KnockbackTransitionNormal:
{
    SEP #$20
    LDA.b #$44 : CMP.b RumbleData : BCC +
    STA.b RumbleData
+   LDA $18AA : CMP.b RumbleTime : BCC +
    STA.b RumbleTime
+   REP #$20
    LDA $0A1E
    RTS
}

KnockbackTransitionMorphed:
{
    SEP #$20
    LDA.b #$44 : CMP.b RumbleData : BCC +
    STA.b RumbleData
+   LDA $18AA : CMP.b RumbleTime : BCC +
    STA.b RumbleTime
+   REP #$20
    LDA $0A1C
    RTS
}

PeriodicDamage:
{
    LDA $0A4E : ORA $0A50 : BEQ +
    %rumble16($22, 3)
+   LDA $0A4C
    RTS
}
%endfree(90)


%startfree(93)
BombExplodes:
{
    LDA.b RumbleData : BNE +
    LDA #$11 : STA.b RumbleData
    LDA.b RumbleTime : CMP #$04 : BPL +
    LDA #$04 : STA.b RumbleTime
+   REP #$30
    LDA $8683
    RTS
}
%endfree(93)


%startfree(94)
BlockCrumblesOnContact:
{
    %rumble16($22, 3)
    LDA $936B,X
    RTS
}
%endfree(94)


%startfree(A0)
RoomShaking:
{
    LDA $0A78 : BNE .return
    LDA $1840 : BNE .return
    STA.b RumbleTime
    LDA $183E : TAX
    SEP #$20
    CMP #$24 : BPL .return
    LDA.w EarthquakeRumbleTable,X : STA.b RumbleData
    STZ.b RumbleFlag
    REP #$30
    TXA
    JMP $86A1

  .return
    JMP $870D
}

EarthquakeRumbleTable:
; horizontal, vertical, diagonal
    db $11, $11, $33 ;\
    db $22, $22, $44 ;} BG1 only
    db $33, $33, $55 ;/
    db $22, $22, $44 ;\
    db $33, $33, $55 ;} BG1 and BG2
    db $44, $44, $66 ;/
    db $44, $44, $66 ;\
    db $55, $55, $77 ;} BG1 and BG2 and enemies
    db $66, $66, $88 ;/
    db $33, $33, $55 ;\
    db $44, $44, $66 ;} BG2 only and enemies
    db $55, $55, $77 ;/

EnemyDiesOnContact:
{
    %rumble16($33, 6)
    LDA #$0006
    RTS
}
%endfree(A0)


%startfree(A2)
ExitingShip1:
{
    SEP #$20
    LDA.b RumbleFlag : BNE +
    LDA #$11 : STA.b RumbleData : STA.b RumbleFlag
    LDA #$FF : STA.b RumbleTime
+   REP #$20
    LDA $0FB0,X
    RTS
}

ExitingShip2:
{
    STZ.b RumbleTime
    LDA #$ABA5
    RTS
}
%endfree(A2)


%startfree(A3)
StandingOnElevator1:
{
    LDA $0A1C : BEQ .rumble
    CMP #$009B : BEQ .rumble
    LDA $0795
    RTS

  .rumble
    %rumble16($11, 1)
    LDA $0795
    RTS
}

StandingOnElevator2:
{
    %rumble16($11, 1)
    LDA $0E18
    RTS
}
%endfree(A3)


%startfree(A4)
CollapseCrocomiresBridge:
{
    %rumble16($66, 12)
    LDA #$0015
    RTS
}

CrocomireMelting:
{
    %rumble16($77, $70)
    LDA $0FBE
    RTS
}

CrocomireBreaksWall1:
{
    SEP #$20
    LDA.b RumbleFlag : BNE +
    LDA #$66 : STA.b RumbleData
    LDA #$50 : STA.b RumbleTime : STA.b RumbleFlag
    REP #$20
+   LDA $102E
    RTS
}

CrocomireBreaksWall2:
{
    STZ.b RumbleFlag
    STZ $0FB0
    RTS
}

CrocomireSkeletonCollapse:
{
    %rumble16($44, $4B)
    LDA #$0025
    RTS
}
%endfree(A4)


%startfree(A5)
SporeSpawnDeathExplosions:
{
    %rumble16($33, 9)
    LDA #$0025
    RTS
}
%endfree(A5)


%startfree(A6)
BoulderBounces:
{
    %rumble16($44, 8)
    LDA #$2000
    RTS
}

BoulderBreaks:
{
    %rumble16($22, 8)
    LDA #$0011
    RTS
}

MiniKraidDeathExplosions:
{
    %rumble16($55, $90)
    LDA #$0003
    RTS
}

CeresRidleyFlyby:
{
    SEP #$20
    STA.b RumbleTime
    LDA #$88 : STA.b RumbleData
    REP #$20
    LDA #$0040
    RTS
}

RidleyPicksUpSamus:
{
    %rumble16($44, 8)
    LDA $0FAC
    RTS
}

RidleyTailHit:
{
    %rumble16($44, 8)
    LDY #$0000
    RTS
}

EarthquakeHandler1:
{
    TYA : STA $183E
    LDA #$0022 : STA.b RumbleData
    LDA #$0002 : STA $1840
    STA RumbleTime
    RTL
}

EarthquakeHandler2:
{
    TYA : CLC : ADC #$0006 : STA $183E
    LDA #$0044 : STA.b RumbleData
    LDA #$0004 : STA $1840 : STA.b RumbleTime
    RTL
}
%endfree(A6)


%startfree(A7)
PhantoonDeathExplosions:
{
    %rumble16($44, 12)
    LDA $1032
    RTS
}
%endfree(A7)


%startfree(A8)
YappingMawGrabsSamus:
{
    %rumble16($44, 2)
    LDA #$0003
    RTS
}

BeetomGrabsSamus:
{
    %rumble16($44, 6)
    STA $18AA
    RTS
}
%endfree(A8)


%startfree(A9)
MotherBrainDeathExplosions:
{
    %rumble16($33, 8)
    JMP $B022
}

RainbowBeam:
{
    %rumble16($88, 3)
    JMP $BB2E
}

BabyMetroidDrain:
{
    %rumble16($33, 3)
    LDY #$FFFC
    RTS
}

BabyMetroidDeathExplosions:
{
    %rumble16($33, 4)
    LDA #$0013
    RTS
}
%endfree(A9)


%startfree(AA)
TorizoJumpCollision:
{
    LDA #$0033 : STA.b RumbleData
    LDA #$0020 : STA.b RumbleTime
    RTS
}

ChozoStatueGrabsMorphBall:
{
    %rumble16($33, 5)
    LDA #$001C
    RTS
}
%endfree(AA)


%printfreespace()
