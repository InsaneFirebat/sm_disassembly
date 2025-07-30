
macro anchor(desired)
    if !ANCHOR_LABELS
        warnpc <desired>
        org <desired>
    endif
endmacro

macro spritemapEntry(Size, XOffset, YOffset, YFlip, XFlip, Priority, Palette, Tile)
; Spritemap entry format is:
;     s000000xxxxxxxxx yyyyyyyy YXppPPPttttttttt
; Where:
;     s = size bit
;     x = sprite X offset
;     y = sprite Y offset
;     Y = Y flip
;     X = X flip
;     p = priority (relative to background)
;     P = palette (often unused)
;     t = tile number
    dw <Size><<15|<XOffset>
    db <YOffset>
    dw <YFlip><<15|<XFlip><<14|<Priority><<12|<Palette><<9|<Tile>
endmacro

macro PLMPopEntry(ID, X, Y, Param)
    dw <ID>
    db <X>, <Y>
    dw <Param>
endmacro

macro EnemyHeader(tileDataSize, palette, health, damage, width, height, bank, hurtAITime, cry, bossID, initAI, parts, unused, mainAI, grappleAI, hurtAI, frozenAI, timeIsFrozen, deathAnimation, powerBombReaction, variantIndex, enemyTouch, enemyShot, spritemap, tileData, layer, drops, vulnerabilities, name)
  .tileDataSize
    <tileDataSize>
  .palette
    <palette>
  .health
    <health>
  .damage
    <damage>
  .width
    <width>
  .height
    <height>
  .bank
    <bank>
  .hurtAITime
    <hurtAITime>
  .cry
    <cry>
  .bossID
    <bossID>
  .initAI
    <initAI>
  .parts
    <parts>
  .unused
    <unused>
  .mainAI
    <mainAI>
  .grappleAI
    <grappleAI>
  .hurtAI
    <hurtAI>
  .frozenAI
    <frozenAI>
  .timeIsFrozen
    <timeIsFrozen>
  .deathAnimation
    <deathAnimation>
    dd $00000000 ; unused
  .powerBombReaction
    <powerBombReaction>
  .variantIndex
    <variantIndex>
    dd $00000000 ; unused
  .enemyTouch
    <enemyTouch>
  .enemyShot
    <enemyShot>
  .spritemap
    <spritemap>
  .tileData
    <tileData>
  .layer
    <layer>
  .drops
    <drops>
  .vulnerabilities
    <vulnerabilities>
  .name
    <name>
endmacro

macro tileDataSize(arg)
    dw <arg>
endmacro

macro palette(arg)
    dw <arg>
endmacro

macro health(arg)
    dw <arg>
endmacro

macro damage(arg)
    dw <arg>
endmacro

macro width(arg)
    dw <arg>
endmacro

macro height(arg)
    dw <arg>
endmacro

macro bank(arg)
    db <arg>
endmacro

macro hurtAITime(arg)
    db <arg>
endmacro

macro cry(arg)
    dw <arg>
endmacro

macro bossID(arg)
    dw <arg>
endmacro

macro initAI(arg)
    dw <arg>
endmacro

macro parts(arg)
    dw <arg>
endmacro

macro unused(arg)
    dw <arg>
endmacro

macro mainAI(arg)
    dw <arg>
endmacro

macro grappleAI(arg)
    dw <arg>
endmacro

macro hurtAI(arg)
    dw <arg>
endmacro

macro frozenAI(arg)
    dw <arg>
endmacro

macro timeIsFrozen(arg)
    dw <arg>
endmacro

macro deathAnimation(arg)
    dw <arg>
endmacro

macro powerBombReaction(arg)
    dw <arg>
endmacro

macro variantIndex(arg)
    dw <arg>
endmacro

macro enemyTouch(arg)
    dw <arg>
endmacro

macro enemyShot(arg)
    dw <arg>
endmacro

macro spritemap(arg)
    dw <arg>
endmacro

macro tileData(arg)
    dl <arg>
endmacro

macro layer(arg)
    db <arg>
endmacro

macro drops(arg)
    dw <arg>
endmacro

macro vulnerabilities(arg)
    dw <arg>
endmacro

macro name(arg)
    dw <arg>
endmacro

macro DoorHeader(destination, elevator, direction, doorPos, screenPos, spawnDistance, doorASM)
  .destination
    <destination>
  .elevator
    <elevator>
  .direction
    <direction>
  .doorPositions
    <doorPos>
  .screenPositions
    <screenPos>
  .spawnDistance
    <spawnDistance>
  .doorASM
    <doorASM>
endmacro

macro destination(arg)
    dw <arg>
endmacro

macro elevator(arg)
    db <arg>
endmacro

macro direction(arg)
    db <arg>
endmacro

macro doorPos(X, Y)
  ..X
    db <X>
  ..Y
    db <Y>
endmacro

macro screenPos(X, Y)
  ..X
    db <X>
  ..Y
    db <Y>
endmacro

macro spawnDistance(arg)
    dw <arg>
endmacro

macro doorASM(arg)
    dw <arg>
endmacro

macro RoomHeader(room, area, positions, dimensions, scrollers, CRE, doorList)
; Room header format:
;      __________________________________________ Room index
;     |   _______________________________________ Area index
;     |  |    ___________________________________ X position (of top left corner) on the map
;     |  |   |   ________________________________ Y position (of top left corner) on the map
;     |  |   |  |    ____________________________ Room width (in units of screens = 16 blocks = 256 pixels)
;     |  |   |  |   |   _________________________ Room height (in units of screens = 16 blocks = 256 pixels)
;     |  |   |  |   |  |    _____________________ Up scroller
;     |  |   |  |   |  |   |   __________________ Down scroller
;     |  |   |  |   |  |   |  |    ______________ CRE bitset
;     |  |   |  |   |  |   |  |   |    __________ Door list pointer
;     |  |   |  |   |  |   |  |   |   |      ____ State conditions list
;     |  |   |  |   |  |   |  |   |   |     |
;     ii,aa, xx,yy, ww,hh, uu,dd, cc, dddd, [...]
  .room
    <room>
  .area
    <area>
  .position
    <positions>
  .dimensions
    <dimensions>
  .scrollers
    <scrollers>
  .CREBitset
    <CRE>
  .doorList
    <doorList>
endmacro

macro room(arg)
    db <arg>
endmacro

macro area(arg)
    db <arg>
endmacro

macro positions(X, Y)
  ..X
    db <X>
  ..Y
    db <Y>
endmacro

macro dimensions(width, height)
  ..width
    db <width>
  ..height
    db <height>
endmacro

macro scrollers(up, down)
  ..up
    db <up>
  ..down
    db <down>
endmacro

macro CRE(arg)
    db <arg>
endmacro

macro doorList(arg)
    dw <arg>
endmacro

macro stateChecks(...)
if <0> > 0
    <1>
endif
if <0> > 1
    <2>
endif
if <0> > 2
    <3>
endif
    dw Use_StatePointer_inX
endmacro

macro stateCheckDoor(arg)
    dw UNUSED_RoomStateCheck_Door_8FE5EB, <arg>
endmacro

macro stateCheckMainBoss(arg)
    dw RoomStateCheck_MainAreaBossIsDead
    dw <arg>
endmacro

macro stateCheckEventSet(event, state)
    dw RoomStateCheck_EventHasBeenSet
    db <event>
    dw <state>
endmacro

macro stateCheckBossDead(boss, state)
    dw RoomStateCheck_BossIsDead
    db <boss>
    dw <state>
endmacro

macro stateCheckMorph(arg)
    dw UNUSED_RoomStateCheck_Morphball_8FE640, <arg>
endmacro

macro stateCheckMorphMissiles(arg)
    dw RoomStateCheck_MorphballAndMissiles, <arg>
endmacro

macro stateCheckPowerBombs(arg)
    dw RoomStateCheck_PowerBombs, <arg>
endmacro

macro stateCheckSpeedBooster(arg)
    dw UNUSED_RoomStateCheck_SpeedBooster_8FE678, <arg>
endmacro

macro StateHeader(levelData, tileset, music, FX, enemyPop, enemySet, layer2Scrolls, scrollPointer, specialXray, mainASM, PLMPop, libraryBG, setupASM)
  .levelData
    <levelData>
  .tileset
    <tileset>
  .music
    <music>
  .FX
    <FX>
  .enemyPop
    <enemyPop>
  .enemySet
    <enemySet>
  .layer2Scrolls
    <layer2Scrolls>
  .scrollPointer
    <scrollPointer>
  .specialXray
    <specialXray>
  .mainASM
    <mainASM>
  .PLMPop
    <PLMPop>
  .libraryBG
    <libraryBG>
  .setupASM
    <setupASM>
endmacro

macro levelData(arg)
    dl <arg>
endmacro

macro tileset(arg)
    db <arg>
endmacro

macro music(dataIndex, track)
  ..dataIndex
    db <dataIndex>
  ..track
    db <track>
endmacro

macro FX(arg)
    dw <arg>
endmacro

macro enemyPop(arg)
    dw <arg>
endmacro

macro enemySet(arg)
    dw <arg>
endmacro

macro layer2Scrolls(X, Y)
  ..X
    db <X>
  ..Y
    db <Y>
endmacro

macro scrollPointer(arg)
    dw <arg>
endmacro

macro specialXray(arg)
    dw <arg>
endmacro

macro mainASM(arg)
    dw <arg>
endmacro

macro PLMPop(arg)
    dw <arg>
endmacro

macro libraryBG(arg)
    dw <arg>
endmacro

macro setupASM(arg)
    dw <arg>
endmacro

macro FXHeader(door, baseY, targetY, velocity, timer, FXType, layerBlendConfig, liquidOptions, paletteFX, animTiles, paletteBlend)
  .door
    <door>
  .baseY
    <baseY>
  .targetY
    <targetY>
  .velocity
    <velocity>
  .timer
    <timer>
  .FXType
    <FXType>
  .layerBlendConfig
    <layerBlendConfig>
  .liquidOptions
    <liquidOptions>
  .paletteFX
    <paletteFX>
  .animTiles
    <animTiles>
  .paletteBlend
    <paletteBlend>
endmacro

macro door(arg)
    dw <arg>
endmacro

macro baseY(arg)
    dw <arg>
endmacro

macro targetY(arg)
    dw <arg>
endmacro

macro velocity(arg)
    dw <arg>
endmacro

macro timer(arg)
    db <arg>
endmacro

macro FXType(arg)
    db <arg>
endmacro

macro layerBlendConfig(A, B)
  ..default
    db <A>
  ..layer3
    db <B>
endmacro

macro liquidOptions(arg)
    db <arg>
endmacro

macro paletteFX(arg)
    db <arg>
endmacro

macro animTiles(arg)
    db <arg>
endmacro

macro paletteBlend(arg)
    db <arg>
endmacro

macro EnemyProjectile(initialAI, preInst, instList, radius, properties, hitList, shotList)
  .initialAI
    <initialAI>
  .preInstruction
    <preInst>
  .instructionList
    <instList>
  .radius
    <radius>
  .properties
    <properties>
  .hitInstructionList
    <hitList>
  .shotInstructionList
    <shotList>
endmacro

macro preInst(arg)
    dw <arg>
endmacro

macro instList(arg)
    dw <arg>
endmacro

macro radius(X, Y)
  ..X
    db <X>
  ..Y
    db <Y>
endmacro

macro properties(arg)
    dw <arg>
endmacro

macro hitList(arg)
    dw <arg>
endmacro

macro shotList(arg)
    dw <arg>
endmacro

macro EnemyPopulations(ID, XPosition, YPosition, initParam, properties, extraProperties, speedParams)
    <ID>
    <XPosition>
    <YPosition>
    <initParam>
    <properties>
    <extraProperties>
    <speedParams>
endmacro

macro enemyID(arg)
    dw <arg>
endmacro

macro XPosition(arg)
    dw <arg>
endmacro

macro YPosition(arg)
    dw <arg>
endmacro

macro initParam(arg)
    dw <arg>
endmacro

macro extraProperties(arg)
    dw <arg>
endmacro

macro speedParams(speed1, speed2)
    dw <speed1>, <speed2>
endmacro

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
