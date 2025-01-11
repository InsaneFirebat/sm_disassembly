FileSelectMap_Index0_GameOptionsToAreaSelectMap_ClearBG2:
    REP #$30                                                             ;81A32A;
    JSR.W ClearMenuTilemap                                               ;81A32C;
    LDX.W $0330                                                          ;81A32F;
    LDA.W #$0800                                                         ;81A332;
    STA.B $D0,X                                                          ;81A335;
    LDA.W #$3600                                                         ;81A337;
    STA.B $D2,X                                                          ;81A33A;
    LDA.W #$007E                                                         ;81A33C;
    STA.B $D4,X                                                          ;81A33F;
    LDA.B $59                                                            ;81A341;
    AND.W #$00FC                                                         ;81A343;
    XBA                                                                  ;81A346;
    STA.B $D5,X                                                          ;81A347;
    TXA                                                                  ;81A349;
    CLC                                                                  ;81A34A;
    ADC.W #$0007                                                         ;81A34B;
    STA.W $0330                                                          ;81A34E;
    LDA.W #$0000                                                         ;81A351;
    STA.L $7EC400                                                        ;81A354;
    JSR.W LoadFileSelectPalettes                                         ;81A358;
    LDX.W #$0000                                                         ;81A35B;

.loop:
    LDA.L $7EC000,X                                                      ;81A35E;
    STA.L $7EC200,X                                                      ;81A362;
    INX                                                                  ;81A366;
    INX                                                                  ;81A367;
    CPX.W #$0040                                                         ;81A368;
    BMI .loop                                                            ;81A36B;
    LDA.W #$0000                                                         ;81A36D;
    STA.L $7EC21C                                                        ;81A370;
    STA.L $7EC23C                                                        ;81A374;
    INC.W $0727                                                          ;81A378;
    RTS                                                                  ;81A37B;


FileSelectMap_Index1_GameOptionsToAreaSelectMap_FadeOut:
    REP #$30                                                             ;81A37C;
    LDX.W #$0000                                                         ;81A37E;
    LDY.W #$0040                                                         ;81A381;
    JSL.L Advance_GradualColorChange_ofPaletteRAM                        ;81A384;
    BCC .return                                                          ;81A388;
    STZ.B $B3                                                            ;81A38A;
    STZ.B $B1                                                            ;81A38C;
    STZ.B $B7                                                            ;81A38E;
    STZ.B $B5                                                            ;81A390;
    LDX.W #$0000                                                         ;81A392;
    LDA.W $079F                                                          ;81A395;

.loopMapAreaIndex:
    CMP.W FileSelectMapArea_IndexTable,X                                 ;81A398;
    BEQ +                                                                ;81A39B;
    INX                                                                  ;81A39D;
    INX                                                                  ;81A39E;
    CPX.W #$000C                                                         ;81A39F;
    BMI .loopMapAreaIndex                                                ;81A3A2;
    LDX.W #$0000                                                         ;81A3A4;

  + TXA                                                                  ;81A3A7;
    LSR A                                                                ;81A3A8;
    STA.W $0950                                                          ;81A3A9;
    LDX.W #$0000                                                         ;81A3AC;

.loopAreaColors:
    PHX                                                                  ;81A3AF;
    CPX.W $079F                                                          ;81A3B0;
    BEQ .loadForegroundColors                                            ;81A3B3;
    JSR.W LoadInactiveAreaMapForegroundColors                            ;81A3B5;
    BRA +                                                                ;81A3B8;


.loadForegroundColors:
    JSR.W LoadActiveAreaMapForegroundColors                              ;81A3BA;

  + PLX                                                                  ;81A3BD;
    INX                                                                  ;81A3BE;
    CPX.W #$0006                                                         ;81A3BF;
    BMI .loopAreaColors                                                  ;81A3C2;
    INC.W $0727                                                          ;81A3C4;
    STZ.W $0787                                                          ;81A3C7;
    SEP #$20                                                             ;81A3CA;
    LDA.B #$02                                                           ;81A3CC;
    STA.B $69                                                            ;81A3CE;

.return:
    RTS                                                                  ;81A3D0;


UNUSED_REP30_81A3D1:
    REP #$30                                                             ;81A3D1;

LoadActiveAreaMapForegroundColors:
    TXA                                                                  ;81A3D3;
    ASL A                                                                ;81A3D4;
    TAX                                                                  ;81A3D5;
    LDA.W AreaSelectMap_ForegroundPaletteTable_indices_active,X          ;81A3D6;
    TAY                                                                  ;81A3D9;
    BRA LoadAreaMapForegroundColors                                      ;81A3DA;


LoadInactiveAreaMapForegroundColors:
    TXA                                                                  ;81A3DC;
    ASL A                                                                ;81A3DD;
    TAX                                                                  ;81A3DE;
    LDA.W AreaSelectMap_ForegroundPaletteTable_indices_inactive,X        ;81A3DF;
    TAY                                                                  ;81A3E2;

LoadAreaMapForegroundColors:
    LDA.W AreaSelectMap_ForegroundPaletteTable_data,Y                    ;81A3E3;
    CMP.W #$FFFF                                                         ;81A3E6;
    BEQ .return                                                          ;81A3E9;
    PHY                                                                  ;81A3EB;
    PHA                                                                  ;81A3EC;
    LDA.W AreaSelectMap_ForegroundPaletteTable_RAM,Y                     ;81A3ED;
    TAX                                                                  ;81A3F0;
    PLY                                                                  ;81A3F1;
    LDA.W #$0005                                                         ;81A3F2;
    STA.B $12                                                            ;81A3F5;

.loopColors:
    LDA.W AreaSelectMap_ForgegroundPaletteTable,Y                        ;81A3F7;
    STA.L $7EC000,X                                                      ;81A3FA;
    INX                                                                  ;81A3FE;
    INX                                                                  ;81A3FF;
    INY                                                                  ;81A400;
    INY                                                                  ;81A401;
    DEC.B $12                                                            ;81A402;
    BNE .loopColors                                                      ;81A404;
    PLY                                                                  ;81A406;
    INY                                                                  ;81A407;
    INY                                                                  ;81A408;
    INY                                                                  ;81A409;
    INY                                                                  ;81A40A;
    BRA LoadAreaMapForegroundColors                                      ;81A40B;


.return:
    RTS                                                                  ;81A40D;


;;; $A40E: Area select map foreground palette data ;;;
AreaSelectMap_ForgegroundPaletteTable:
;              2                              Ch                             16h
    dw $0000, $7FE0,$7EA0,$7D40,$7C00,$4000, $01DB,$0196,$0150,$00EB,$00A5, $033B,$0296,$01F0,$014B,$00A5 ; 0.   Active.   WS-Crateria,  Crateria, Crateria
    dw $0400, $6400,$4C00,$3400,$1C00,$0400, $0013,$000F,$000A,$0006,$0001, $0BB1,$0B0D,$0669,$05A4,$0100 ; 20h. Active.   Maridia,      Norfair,  Brinstar
    dw $0000, $7FE0,$7EA0,$7D40,$7C00,$4000, $6417,$4C12,$380D,$2007,$0802, $5280,$4620,$39C0,$2940,$14A5 ; 40h. Active.   Wrecked Ship, Tourian,  Wrecked Ship
    dw $0000, $35AD,$2D6B,$2529,$18C6,$1084, $4A52,$3DEF,$318C,$2108,$14A5, $56B5,$4A52,$39CE,$2D6B,$1CE7 ; 60h. Inactive. WS-Crateria,  Crateria, Crateria
    dw $0000, $18C6,$14A5,$1084,$0842,$0421, $1084,$0C63,$0842,$0421,$0000, $2108,$1CE7,$14A5,$1084,$0842 ; 80h. Inactive. Maridia,      Norfair,  Brinstar
    dw $0000, $35AD,$2D6B,$2529,$18C6,$1084, $294A,$2108,$1CE7,$14A5,$0C63, $4A52,$3DEF,$318C,$2108,$14A5 ; A0h. Inactive. Wrecked Ship, Tourian,  Wrecked Ship


;;; $A4CE: Area select map foreground palette table ;;;
AreaSelectMap_ForegroundPaletteTable:
; Area select map foreground palette table indices (relative to $A4E6)
  .indices
  ..active
    dw $0000,$000A,$0010,$0016,$0024,$002A                               ;81A4CE;

  ..inactive
    dw $0030,$003A,$0040,$0046,$0054,$005A                               ;81A4DA;

;        _________ Palette data index (relative to $A40E)
;       |      ___ Palette RAM index (relative to $7E:C000)
;       |     |
  .data
    dw $000C                                                             ;81A4E6;
  .RAM
    dw       $00AC ; Active - Crateria - orange
    dw $0016,$00B6 ; Active - Crateria - yellow
    dw $FFFF

    dw $0036,$00D6 ; Active - Brinstar
    dw $FFFF

    dw $002C,$00CC ; Active - Norfair
    dw $FFFF

    dw $0002,$00A2 ; Active - Wrecked Ship - part that overlaps with Crateria
    dw $0042,$00E2 ; Active - Wrecked Ship - dark blue
    dw $0056,$00F6 ; Active - Wrecked Ship - light blue
    dw $FFFF

    dw $0022,$00C2 ; Active - Maridia
    dw $FFFF

    dw $004C,$00EC ; Active - Tourian
    dw $FFFF

    dw $006C,$00AC ; Inactive - Crateria - dark greys
    dw $0076,$00B6 ; Inactive - Crateria - light greys
    dw $FFFF

    dw $0096,$00D6 ; Inactive - Brinstar
    dw $FFFF

    dw $008C,$00CC ; Inactive - Norfair
    dw $FFFF

    dw $0062,$00A2 ; Inactive - Wrecked Ship - part that overlaps with Crateria
    dw $00A2,$00E2 ; Inactive - Wrecked Ship - dark greys
    dw $00B6,$00F6 ; Inactive - Wrecked Ship - light greys
    dw $FFFF

    dw $0082,$00C2 ; Inactive - Maridia
    dw $FFFF

    dw $00AC,$00EC ; Inactive - Tourian
    dw $FFFF

FileSelectMap_Index2_11_Load_AreaSelect_ForegroundTilemap:
    REP #$30                                                             ;81A546;
    LDX.W $0330                                                          ;81A548;
    LDA.W #$0800                                                         ;81A54B;
    STA.B $D0,X                                                          ;81A54E;
    LDA.W #Tilemap_AreaSelect_Foreground                                 ;81A550;
    STA.B $D2,X                                                          ;81A553;
    LDA.W #Tilemap_AreaSelect_Foreground>>16                             ;81A555;
    STA.B $D4,X                                                          ;81A558;
    LDA.B $58                                                            ;81A55A;
    AND.W #$00FC                                                         ;81A55C;
    XBA                                                                  ;81A55F;
    STA.B $D5,X                                                          ;81A560;
    TXA                                                                  ;81A562;
    CLC                                                                  ;81A563;
    ADC.W #$0007                                                         ;81A564;
    STA.W $0330                                                          ;81A567;
    LDA.B $51                                                            ;81A56A;
    AND.W #$FF00                                                         ;81A56C;
    ORA.W #$000F                                                         ;81A56F;
    STA.B $51                                                            ;81A572;
    INC.W $0727                                                          ;81A574;
    RTS                                                                  ;81A577;


FileSelectMap_Index12_RoomSelectMapToAreaSelectMap:
    REP #$30                                                             ;81A578;
    INC.W $0727                                                          ;81A57A;
    LDY.W $079F                                                          ;81A57D;
    BRA Load_AreaSelect_BackgroundTilemap                                ;81A580;


FileSelectMap_Index3_GameOptionsToAreaSelectMap:
    REP #$30                                                             ;81A582;
    INC.W $0727                                                          ;81A584;
    LDY.W $079F                                                          ;81A587;

Load_AreaSelect_BackgroundTilemap:
    LDX.W $0330                                                          ;81A58A;
    LDA.W #$0800                                                         ;81A58D;
    STA.B $D0,X                                                          ;81A590;
    TYA                                                                  ;81A592;
    XBA                                                                  ;81A593;
    ASL A                                                                ;81A594;
    ASL A                                                                ;81A595;
    ASL A                                                                ;81A596;
    CLC                                                                  ;81A597;
    ADC.W #Tilemap_AreaSelect_Background_Crateria                        ;81A598;
    STA.B $D2,X                                                          ;81A59B;
    LDA.W #Tilemap_AreaSelect_Background_Crateria>>16                    ;81A59D;
    STA.B $D4,X                                                          ;81A5A0;
    LDA.B $5A                                                            ;81A5A2;
    AND.W #$00FC                                                         ;81A5A4;
    XBA                                                                  ;81A5A7;
    STA.B $D5,X                                                          ;81A5A8;
    TXA                                                                  ;81A5AA;
    CLC                                                                  ;81A5AB;
    ADC.W #$0007                                                         ;81A5AC;
    STA.W $0330                                                          ;81A5AF;
    RTS                                                                  ;81A5B2;


FileSelectMap_Index4_13_PrepareTransitionToAreaSelectMap:
    SEP #$20                                                             ;81A5B3;
    LDA.B #$04                                                           ;81A5B5;
    STA.B $6B                                                            ;81A5B7;
    STA.W $212D                                                          ;81A5B9;
    LDA.B #$04                                                           ;81A5BC;
    STA.B $6D                                                            ;81A5BE;
    STA.W $212F                                                          ;81A5C0;
    LDA.B #$02                                                           ;81A5C3;
    STA.B $6F                                                            ;81A5C5;
    STA.W $2130                                                          ;81A5C7;
    LDA.B #$25                                                           ;81A5CA;
    STA.B $72                                                            ;81A5CC;
    STA.W $2131                                                          ;81A5CE;
    LDA.B #$80                                                           ;81A5D1;
    STA.B $76                                                            ;81A5D3;
    LDA.B #$40                                                           ;81A5D5;
    STA.B $75                                                            ;81A5D7;
    LDA.B #$20                                                           ;81A5D9;
    STA.B $74                                                            ;81A5DB;
    JSR.W Setup_Initial_ExpandingSquareTransition_HDMA                   ;81A5DD;
    LDA.B #$0C                                                           ;81A5E0;
    STA.B $85                                                            ;81A5E2;
    STA.W HW_HDMAEN                                                      ;81A5E4;
    JSR.W Config_Window1_ExpandingSquareTransition                       ;81A5E7;
    STZ.W $18B0                                                          ;81A5EA;
    STZ.W $18B1                                                          ;81A5ED;
    INC.W $0727                                                          ;81A5F0;
    REP #$30                                                             ;81A5F3;
    RTS                                                                  ;81A5F5;


Config_Window1_ExpandingSquareTransition:
    SEP #$20                                                             ;81A5F6;
    LDA.B #$13                                                           ;81A5F8;
    STA.B $69                                                            ;81A5FA;
    STA.W $212C                                                          ;81A5FC;
    LDA.B #$13                                                           ;81A5FF;
    STA.B $6C                                                            ;81A601;
    STA.W $212E                                                          ;81A603;
    LDA.B #$23                                                           ;81A606;
    STA.B $60                                                            ;81A608;
    STA.W $2123                                                          ;81A60A;
    LDA.B #$03                                                           ;81A60D;
    STA.B $61                                                            ;81A60F;
    STA.W $2124                                                          ;81A611;
    LDA.B #$23                                                           ;81A614;
    STA.B $62                                                            ;81A616;
    STA.W $2125                                                          ;81A618;
    RTS                                                                  ;81A61B;


Setup_Initial_ExpandingSquareTransition_HDMA:
    SEP #$20                                                             ;81A61C;
    LDA.B #$00                                                           ;81A61E;
    STA.L $7E9E20                                                        ;81A620;
    STA.L $7E9E21                                                        ;81A624;
    DEC A                                                                ;81A628;
    STA.L $7E9E22                                                        ;81A629;
    STA.L $7E9E23                                                        ;81A62D;
    LDA.B #$7F                                                           ;81A631;
    STA.L $7E9E32                                                        ;81A633;
    LDA.B #$81                                                           ;81A637;
    STA.L $7E9E36                                                        ;81A639;
    LDA.B #$6F                                                           ;81A63D;
    STA.L $7E9E00                                                        ;81A63F;
    LDA.B #$22                                                           ;81A643;
    STA.L $7E9E01                                                        ;81A645;
    LDA.B #$9E                                                           ;81A649;
    STA.L $7E9E02                                                        ;81A64B;
    LDA.B #$01                                                           ;81A64F;
    STA.L $7E9E03                                                        ;81A651;
    LDA.B #$32                                                           ;81A655;
    STA.L $7E9E04                                                        ;81A657;
    LDA.B #$9E                                                           ;81A65B;
    STA.L $7E9E05                                                        ;81A65D;
    LDA.B #$01                                                           ;81A661;
    STA.L $7E9E06                                                        ;81A663;
    LDA.B #$32                                                           ;81A667;
    STA.L $7E9E07                                                        ;81A669;
    LDA.B #$9E                                                           ;81A66D;
    STA.L $7E9E08                                                        ;81A66F;
    LDA.B #$6F                                                           ;81A673;
    STA.L $7E9E09                                                        ;81A675;
    LDA.B #$20                                                           ;81A679;
    STA.L $7E9E0A                                                        ;81A67B;
    LDA.B #$9E                                                           ;81A67F;
    STA.L $7E9E0B                                                        ;81A681;
    LDA.B #$40                                                           ;81A685;
    STA.W $4320                                                          ;81A687;
    LDA.B #$26                                                           ;81A68A;
    STA.W $4321                                                          ;81A68C;
    LDA.B #$00                                                           ;81A68F;
    STA.W $4322                                                          ;81A691;
    LDA.B #$9E                                                           ;81A694;
    STA.W $4323                                                          ;81A696;
    LDA.B #$7E                                                           ;81A699;
    STA.W $4324                                                          ;81A69B;
    STA.W $4327                                                          ;81A69E;
    STZ.W $4325                                                          ;81A6A1;
    STZ.W $4326                                                          ;81A6A4;
    STZ.W $4328                                                          ;81A6A7;
    STZ.W $4329                                                          ;81A6AA;
    STZ.W $432A                                                          ;81A6AD;
    LDA.B #$6F                                                           ;81A6B0;
    STA.L $7E9E10                                                        ;81A6B2;
    LDA.B #$20                                                           ;81A6B6;
    STA.L $7E9E11                                                        ;81A6B8;
    LDA.B #$9E                                                           ;81A6BC;
    STA.L $7E9E12                                                        ;81A6BE;
    LDA.B #$01                                                           ;81A6C2;
    STA.L $7E9E13                                                        ;81A6C4;
    LDA.B #$36                                                           ;81A6C8;
    STA.L $7E9E14                                                        ;81A6CA;
    LDA.B #$9E                                                           ;81A6CE;
    STA.L $7E9E15                                                        ;81A6D0;
    LDA.B #$01                                                           ;81A6D4;
    STA.L $7E9E16                                                        ;81A6D6;
    LDA.B #$36                                                           ;81A6DA;
    STA.L $7E9E17                                                        ;81A6DC;
    LDA.B #$9E                                                           ;81A6E0;
    STA.L $7E9E18                                                        ;81A6E2;
    LDA.B #$6F                                                           ;81A6E6;
    STA.L $7E9E19                                                        ;81A6E8;
    LDA.B #$20                                                           ;81A6EC;
    STA.L $7E9E1A                                                        ;81A6EE;
    LDA.B #$9E                                                           ;81A6F2;
    STA.L $7E9E1B                                                        ;81A6F4;
    LDA.B #$40                                                           ;81A6F8;
    STA.W $4330                                                          ;81A6FA;
    LDA.B #$27                                                           ;81A6FD;
    STA.W $4331                                                          ;81A6FF;
    LDA.B #$10                                                           ;81A702;
    STA.W $4332                                                          ;81A704;
    LDA.B #$9E                                                           ;81A707;
    STA.W $4333                                                          ;81A709;
    LDA.B #$7E                                                           ;81A70C;
    STA.W $4334                                                          ;81A70E;
    STA.W $4337                                                          ;81A711;
    STZ.W $4335                                                          ;81A714;
    STZ.W $4336                                                          ;81A717;
    STZ.W $4338                                                          ;81A71A;
    STZ.W $4339                                                          ;81A71D;
    STZ.W $433A                                                          ;81A720;
    RTS                                                                  ;81A723;


ExpandingSquareTransitionSpeed:
    db $04                                                               ;81A724;

FileSelectMap_Index5_GameOptionsToAreaSelectMap_ExpSqrTrans:
    REP #$30                                                             ;81A725;
    JSR.W DrawAreaSelectMapLabels                                        ;81A727;
    SEP #$20                                                             ;81A72A;
    LDA.L $7E9E00                                                        ;81A72C;
    SEC                                                                  ;81A730;
    SBC.W ExpandingSquareTransitionSpeed                                 ;81A731;
    BMI +                                                                ;81A734;
    STA.L $7E9E00                                                        ;81A736;
    STA.L $7E9E09                                                        ;81A73A;
    STA.L $7E9E10                                                        ;81A73E;
    STA.L $7E9E19                                                        ;81A742;
    LDA.L $7E9E03                                                        ;81A746;
    CLC                                                                  ;81A74A;
    ADC.W ExpandingSquareTransitionSpeed                                 ;81A74B;
    STA.L $7E9E03                                                        ;81A74E;
    STA.L $7E9E06                                                        ;81A752;
    STA.L $7E9E13                                                        ;81A756;
    STA.L $7E9E16                                                        ;81A75A;
    LDA.L $7E9E32                                                        ;81A75E;
    SEC                                                                  ;81A762;
    SBC.W ExpandingSquareTransitionSpeed                                 ;81A763;
    STA.L $7E9E32                                                        ;81A766;
    LDA.L $7E9E36                                                        ;81A76A;
    CLC                                                                  ;81A76E;
    ADC.W ExpandingSquareTransitionSpeed                                 ;81A76F;
    STA.L $7E9E36                                                        ;81A772;
    RTS                                                                  ;81A776;


  + INC.W $0727                                                          ;81A777;
    LDA.B $69                                                            ;81A77A;
    AND.B #$FD                                                           ;81A77C;
    STA.B $69                                                            ;81A77E;
    LDA.B $6C                                                            ;81A780;
    AND.B #$00                                                           ;81A782;
    STA.B $6C                                                            ;81A784;
    LDA.B $6D                                                            ;81A786;
    AND.B #$00                                                           ;81A788;
    STA.B $6D                                                            ;81A78A;
    LDA.B #$18                                                           ;81A78C;
    STA.B $B7                                                            ;81A78E;
    LDA.B #$00                                                           ;81A790;
    STA.B $B8                                                            ;81A792;
    REP #$30                                                             ;81A794;
    LDA.W #$0001                                                         ;81A796;
    STA.W $073B                                                          ;81A799;
    LDX.W #$0000                                                         ;81A79C;

.copyTilemap:
    LDA.L Tilemap_BG2PauseScreen_BG2RoomSelectMap_0,X                    ;81A79F;
    STA.L $7E4000,X                                                      ;81A7A3;
    INX                                                                  ;81A7A7;
    INX                                                                  ;81A7A8;
    CPX.W #$0640                                                         ;81A7A9;
    BMI .copyTilemap                                                     ;81A7AC;
    LDA.W #$2801                                                         ;81A7AE;

.loopTilemap:
    STA.L $7E4000,X                                                      ;81A7B1;
    INX                                                                  ;81A7B5;
    INX                                                                  ;81A7B6;
    CPX.W #$0800                                                         ;81A7B7;
    BMI .loopTilemap                                                     ;81A7BA;
    LDA.W #$4154                                                         ;81A7BC;
    STA.B $00                                                            ;81A7BF;
    LDA.W #$007E                                                         ;81A7C1;
    STA.B $02                                                            ;81A7C4;
    JSL.L DrawRoomSelectMap_AreaLabel                                    ;81A7C6;
    LDY.W #$0140                                                         ;81A7CA;
    LDX.W #$077E                                                         ;81A7CD;

.loopMapControls:
    LDA.W Tilemap_RoomSelectMap_Controls,Y                               ;81A7D0;
    STA.L $7E4000,X                                                      ;81A7D3;
    DEX                                                                  ;81A7D7;
    DEX                                                                  ;81A7D8;
    DEY                                                                  ;81A7D9;
    DEY                                                                  ;81A7DA;
    BNE .loopMapControls                                                 ;81A7DB;
    LDX.W $0330                                                          ;81A7DD;
    LDA.W #$0800                                                         ;81A7E0;
    STA.B $D0,X                                                          ;81A7E3;
    LDA.W #$4000                                                         ;81A7E5;
    STA.B $D2,X                                                          ;81A7E8;
    LDA.W #$007E                                                         ;81A7EA;
    STA.B $D4,X                                                          ;81A7ED;
    LDA.B $59                                                            ;81A7EF;
    AND.W #$00FC                                                         ;81A7F1;
    XBA                                                                  ;81A7F4;
    STA.B $D5,X                                                          ;81A7F5;
    TXA                                                                  ;81A7F7;
    CLC                                                                  ;81A7F8;
    ADC.W #$0007                                                         ;81A7F9;
    STA.W $0330                                                          ;81A7FC;
    RTS                                                                  ;81A7FF;


FineSelectMap_Index6_AreaSelectMap:
    REP #$30                                                             ;81A800;
    LDA.B $8F                                                            ;81A802;
    BIT.W #$0A00                                                         ;81A804;
    BEQ +                                                                ;81A807;
    LDA.W $05D1                                                          ;81A809;
    BEQ .checkB                                                          ;81A80C;
    JMP.W FineSelectMap_Index6_AreaSelectMap_Debug                       ;81A80E;


  + BIT.W #$2500                                                         ;81A811;
    BEQ .checkB                                                          ;81A814;
    LDA.W $05D1                                                          ;81A816;
    BEQ .checkB                                                          ;81A819;
    JMP.W FineSelectMap_Index6_AreaSelectMap_Debug_debugNext             ;81A81B;


.checkB:
    BIT.W #$8000                                                         ;81A81E;
    BEQ +                                                                ;81A821;
    LDA.W #$0016                                                         ;81A823;
    STA.W $0727                                                          ;81A826;
    JMP.W DrawAreaSelectMapLabels                                        ;81A829;


  + BIT.W #$1080                                                         ;81A82C;
    BEQ JMP_DrawAreaSelectMapLabels                                      ;81A82F;
    LDA.W #$0038                                                         ;81A831;
    JSL.L QueueSound_Lib1_Max6                                           ;81A834;
    JMP.W Select_FileSelectMap_Area                                      ;81A838;


JMP_DrawAreaSelectMapLabels:
    JMP.W DrawAreaSelectMapLabels                                        ;81A83B;


FineSelectMap_Index6_AreaSelectMap_Debug:
    STZ.B $18                                                            ;81A83E;
    LDA.B $16                                                            ;81A840;
    STA.B $18                                                            ;81A842;
    LDA.W $0950                                                          ;81A844;
    JSR.W A_equals_A_Minus_1_Mod_6                                       ;81A847;
    JSR.W Debug_Check_FileSelectMapArea_CanBeSelected                    ;81A84A;
    BNE .selected                                                        ;81A84D;
    LDA.B $1C                                                            ;81A84F;
    JSR.W A_equals_A_Minus_1_Mod_6                                       ;81A851;
    JSR.W Debug_Check_FileSelectMapArea_CanBeSelected                    ;81A854;
    BNE .selected                                                        ;81A857;
    LDA.B $1C                                                            ;81A859;
    JSR.W A_equals_A_Minus_1_Mod_6                                       ;81A85B;
    JSR.W Debug_Check_FileSelectMapArea_CanBeSelected                    ;81A85E;
    BEQ JMP_DrawAreaSelectMapLabels                                      ;81A861;

.selected:
    LDA.W #$0037                                                         ;81A863;
    JSL.L QueueSound_Lib1_Max6                                           ;81A866;
    JSR.W Switch_Active_FileSelectMapArea                                ;81A86A;
    JMP.W DrawAreaSelectMapLabels                                        ;81A86D;


FineSelectMap_Index6_AreaSelectMap_Debug_debugNext:
    LDA.W #$0006                                                         ;81A870;
    STA.B $16                                                            ;81A873;
    LDA.W $0950                                                          ;81A875;
    STA.B $1C                                                            ;81A878;

.loop:
    LDA.B $1C                                                            ;81A87A;
    JSR.W A_equals_A_Plus_1_Mod_6                                        ;81A87C;
    JSR.W Debug_Check_FileSelectMapArea_CanBeSelected                    ;81A87F;
    BNE .switch                                                          ;81A882;
    DEC.B $16                                                            ;81A884;
    BNE .loop                                                            ;81A886;
    JMP.W DrawAreaSelectMapLabels                                        ;81A888;


.switch:
    JSR.W Switch_Active_FileSelectMapArea                                ;81A88B;
    LDA.W #$0037                                                         ;81A88E;
    JSL.L QueueSound_Lib1_Max6                                           ;81A891;
    JMP.W DrawAreaSelectMapLabels                                        ;81A895;


A_equals_A_Minus_1_Mod_6:
    DEC A                                                                ;81A898;
    BPL .return                                                          ;81A899;
    LDA.W #$0005                                                         ;81A89B;

.return:
    RTS                                                                  ;81A89E;


A_equals_A_Plus_1_Mod_6:
    INC A                                                                ;81A89F;
    CMP.W #$0006                                                         ;81A8A0;
    BMI .return                                                          ;81A8A3;
    LDA.W #$0000                                                         ;81A8A5;

.return:
    RTS                                                                  ;81A8A8;


Select_FileSelectMap_Area:
    INC.W $0727                                                          ;81A8A9;
    LDA.W $05D1                                                          ;81A8AC;
    BNE .debugEnabled                                                    ;81A8AF;
    LDA.L $7ED918                                                        ;81A8B1;
    STA.W $079F                                                          ;81A8B5;
    LDA.L $7ED916                                                        ;81A8B8;
    STA.W $078B                                                          ;81A8BC;
    JMP.W JMP_DrawAreaSelectMapLabels                                    ;81A8BF;


.debugEnabled:
    LDA.W $0950                                                          ;81A8C2;
    ASL A                                                                ;81A8C5;
    TAX                                                                  ;81A8C6;
    LDA.W FileSelectMapArea_IndexTable,X                                 ;81A8C7;
    STA.W $079F                                                          ;81A8CA;
    ASL A                                                                ;81A8CD;
    TAX                                                                  ;81A8CE;
    LDA.L $7ED8F8,X                                                      ;81A8CF;
    STA.B $12                                                            ;81A8D3;
    LDX.W #$0000                                                         ;81A8D5;
    LDA.W #$0082                                                         ;81A8D8;
    STA.B $02                                                            ;81A8DB;
    LDA.W #MapIcon_PositionTablePointers_savePoints                      ;81A8DD;
    STA.B $00                                                            ;81A8E0;
    LDA.W $079F                                                          ;81A8E2;
    ASL A                                                                ;81A8E5;
    TAY                                                                  ;81A8E6;
    LDA.B [$00],Y                                                        ;81A8E7;

.crash:
    BEQ .crash                                                           ;81A8E9;
    STA.B $00                                                            ;81A8EB;
    LDA.W #$0010                                                         ;81A8ED;
    STA.B $14                                                            ;81A8F0;

.loopSavesElevators:
    LSR.B $12                                                            ;81A8F2;
    BCC +                                                                ;81A8F4;
    TXA                                                                  ;81A8F6;
    ASL A                                                                ;81A8F7;
    ASL A                                                                ;81A8F8;
    TAY                                                                  ;81A8F9;
    LDA.B [$00],Y                                                        ;81A8FA;
    CMP.W #$FFFE                                                         ;81A8FC;
    BEQ +                                                                ;81A8FF;
    CMP.W #$FFFF                                                         ;81A901;
    BNE .found                                                           ;81A904;
    LDX.W #$FFFF                                                         ;81A906;

  + INX                                                                  ;81A909;
    DEC.B $14                                                            ;81A90A;
    BNE .loopSavesElevators                                              ;81A90C;
    LDA.W #$0008                                                         ;81A90E;

.loopDebugSavePoints:
    TXA                                                                  ;81A911;
    ASL A                                                                ;81A912;
    ASL A                                                                ;81A913;
    TAY                                                                  ;81A914;
    LDA.B [$00],Y                                                        ;81A915;
    CMP.W #$FFFE                                                         ;81A917;
    BEQ +                                                                ;81A91A;
    CMP.W #$FFFF                                                         ;81A91C;
    BNE .found                                                           ;81A91F;
    LDX.W #$FFFF                                                         ;81A921;

  + INX                                                                  ;81A924;
    DEC.B $14                                                            ;81A925;
    BNE .loopDebugSavePoints                                             ;81A927;

.crash2:
    BRA .crash2                                                          ;81A929;


.found:
    STX.W $078B                                                          ;81A92B;
    JMP.W JMP_DrawAreaSelectMapLabels                                    ;81A92E;


Debug_Check_FileSelectMapArea_CanBeSelected:
    STA.B $1C                                                            ;81A931;
    ASL A                                                                ;81A933;
    TAX                                                                  ;81A934;
    LDA.W FileSelectMapArea_IndexTable,X                                 ;81A935;
    ASL A                                                                ;81A938;
    TAX                                                                  ;81A939;
    LDA.L $7ED8F8,X                                                      ;81A93A;
    BNE .return                                                          ;81A93E;
    PHB                                                                  ;81A940;
    LDA.W #$8200                                                         ;81A941;
    PHA                                                                  ;81A944;
    PLB                                                                  ;81A945;
    PLB                                                                  ;81A946;
    LDA.L MapIcon_PositionTablePointers_savePoints,X                     ;81A947;
    CLC                                                                  ;81A94B;
    ADC.W #$0040                                                         ;81A94C;
    TAX                                                                  ;81A94F;
    LDA.W $0000,X                                                        ;81A950;
    PLB                                                                  ;81A953;
    CMP.W #$FFFF                                                         ;81A954;

.return:
    RTS                                                                  ;81A957;


Switch_Active_FileSelectMapArea:
    LDA.W $0950                                                          ;81A958;
    ASL A                                                                ;81A95B;
    TAX                                                                  ;81A95C;
    LDA.W FileSelectMapArea_IndexTable,X                                 ;81A95D;
    TAX                                                                  ;81A960;
    JSR.W LoadInactiveAreaMapForegroundColors                            ;81A961;
    LDA.B $1C                                                            ;81A964;
    STA.W $0950                                                          ;81A966;
    ASL A                                                                ;81A969;
    TAX                                                                  ;81A96A;
    LDA.W FileSelectMapArea_IndexTable,X                                 ;81A96B;
    TAX                                                                  ;81A96E;
    JSR.W LoadActiveAreaMapForegroundColors                              ;81A96F;
    LDA.W $0950                                                          ;81A972;
    ASL A                                                                ;81A975;
    TAX                                                                  ;81A976;
    LDA.W FileSelectMapArea_IndexTable,X                                 ;81A977;
    TAY                                                                  ;81A97A;
    JMP.W Load_AreaSelect_BackgroundTilemap                              ;81A97B;


DrawAreaSelectMapLabels:
    STZ.B $03                                                            ;81A97E;
    LDX.W #$0080                                                         ;81A980;
    LDY.W #$0010                                                         ;81A983;
    LDA.L AreaSelect_SpritemapBaseIndex                                  ;81A986;
    JSL.L AddSpritemapFrom_82C569_TableToOAM                             ;81A98A;
    STZ.B $1C                                                            ;81A98E;

.loopAreas:
    LDX.W #$0200                                                         ;81A990;
    LDA.B $1C                                                            ;81A993;
    CMP.W $0950                                                          ;81A995;
    BNE +                                                                ;81A998;
    LDX.W #$0000                                                         ;81A99A;

  + STX.B $03                                                            ;81A99D;
    LDA.B $1C                                                            ;81A99F;
    ASL A                                                                ;81A9A1;
    TAX                                                                  ;81A9A2;
    LDA.W FileSelectMapArea_IndexTable,X                                 ;81A9A3;
    ASL A                                                                ;81A9A6;
    TAX                                                                  ;81A9A7;
    PHB                                                                  ;81A9A8;
    LDA.W #$8200                                                         ;81A9A9;
    PHA                                                                  ;81A9AC;
    PLB                                                                  ;81A9AD;
    PLB                                                                  ;81A9AE;
    LDA.L $7ED8F8,X                                                      ;81A9AF;
    STA.B $24                                                            ;81A9B3;
    LDA.L MapIcon_PositionTablePointers_savePoints,X                     ;81A9B5;
    TAX                                                                  ;81A9B9;
    LDA.W #$0010                                                         ;81A9BA;
    STA.B $1E                                                            ;81A9BD;

.loopSavePoints:
    LDA.W $0000,X                                                        ;81A9BF;
    CMP.W #$FFFF                                                         ;81A9C2;
    BEQ .PLBNext                                                         ;81A9C5;
    LSR.B $24                                                            ;81A9C7;
    BCC +                                                                ;81A9C9;
    CMP.W #$FFFE                                                         ;81A9CB;
    BNE .foundUsedSavePoint                                              ;81A9CE;

  + TXA                                                                  ;81A9D0;
    CLC                                                                  ;81A9D1;
    ADC.W #$0004                                                         ;81A9D2;
    TAX                                                                  ;81A9D5;
    DEC.B $1E                                                            ;81A9D6;
    BNE .loopSavePoints                                                  ;81A9D8;
    LDA.W $05D1                                                          ;81A9DA;
    BEQ .PLBNext                                                         ;81A9DD;
    LDA.W $0000,X                                                        ;81A9DF;
    CMP.W #$FFFF                                                         ;81A9E2;
    BEQ .PLBNext                                                         ;81A9E5;

.foundUsedSavePoint:
    PLB                                                                  ;81A9E7;
    LDA.B $1C                                                            ;81A9E8;
    ASL A                                                                ;81A9EA;
    TAX                                                                  ;81A9EB;
    LDA.W FileSelectMapArea_IndexTable,X                                 ;81A9EC;
    ASL A                                                                ;81A9EF;
    ASL A                                                                ;81A9F0;
    TAX                                                                  ;81A9F1;
    LDA.W FileSelectMap_Labels_Positions_Y,X                             ;81A9F2;
    TAY                                                                  ;81A9F5;
    LDA.W FileSelectMap_Labels_Positions_X,X                             ;81A9F6;
    PHA                                                                  ;81A9F9;
    LDA.B $1C                                                            ;81A9FA;
    ASL A                                                                ;81A9FC;
    TAX                                                                  ;81A9FD;
    LDA.W FileSelectMapArea_IndexTable,X                                 ;81A9FE;
    CLC                                                                  ;81AA01;
    ADC.L AreaSelect_SpritemapBaseIndex                                  ;81AA02;
    INC A                                                                ;81AA06;
    PLX                                                                  ;81AA07;
    JSL.L AddSpritemapFrom_82C569_TableToOAM                             ;81AA08;

.next:
    INC.B $1C                                                            ;81AA0C;
    LDA.B $1C                                                            ;81AA0E;
    CMP.W #$0006                                                         ;81AA10;
    BPL .return                                                          ;81AA13;
    JMP.W .loopAreas                                                     ;81AA15;


.return:
    RTS                                                                  ;81AA18;


.PLBNext:
    PLB                                                                  ;81AA19;
    BRA .next                                                            ;81AA1A;


FileSelectMap_Labels_Positions:
  .X
    dw $005B                                                             ;81AA1C;

  .Y
    dw $0032       ; Crateria
    dw $002A,$007F ; Brinstar
    dw $005E,$00B5 ; Norfair
    dw $00CE,$0050 ; Wrecked Ship
    dw $00CE,$009F ; Maridia
    dw $0087,$008B ; Tourian

RoomSelectMap_ExpandingSquare_Velocities:
  .leftSub
    dw $3C00                                                             ;81AA34; Crateria
  .left
    dw $FFFE                                                             ;81AA36;
  .rightSub
    dw $3400                                                             ;81AA38;
  .right
    dw $0003                                                             ;81AA3A;
  .topSub
    dw $0800                                                             ;81AA3C;
  .top
    dw $FFFF                                                             ;81AA3E;
  .bottomSub
    dw $0000                                                             ;81AA40;
  .bottom
    dw $0004                                                             ;81AA42;

    dw $3800,$FFFF,$0000,$0004,$A400,$FFFD,$6800,$0002 ; Brinstar
    dw $F000,$FFFD,$9400,$0003,$0000,$FFFC,$A800,$0001 ; Norfair
    dw $0000,$FFFC,$F800,$0000,$7400,$FFFE,$6800,$0003 ; Wrecked Ship
    dw $0000,$FFFC,$F800,$0000,$EC00,$FFFC,$E000,$0001 ; Maridia
    dw $2000,$FFFC,$7800,$0003,$0000,$FFFC,$5C00,$0003 ; Tourian

RoomSelectMap_ExpandingSquare_Timers:
    dw $0033 ; Crateria                                                  ;81AA94;
    dw $0035 ; Brinstar
    dw $002D ; Norfair
    dw $0033 ; Wrecked Ship
    dw $0033 ; Maridia
    dw $0022 ; Tourian

FileSelectMapArea_IndexTable:
; Maps file select map area index ($0950) to area index ($079F)
    dw $0000 ; Crateria                                                  ;81AAA0;
    dw $0003 ; Wrecked Ship
    dw $0005 ; Tourian
    dw $0001 ; Brinstar
    dw $0004 ; Maridia
    dw $0002 ; Norfair

FileSelectMap_Index7_AreaSelectMapToRoomSelectMap:
    REP #$30                                                             ;81AAAC;
    JSR.W DrawAreaSelectMapLabels                                        ;81AAAE;
    SEP #$20                                                             ;81AAB1;
    JSR.W Setup_Initial_ExpandingSquareTransition_HDMA                   ;81AAB3;
    LDA.B #$13                                                           ;81AAB6;
    STA.B $69                                                            ;81AAB8;
    LDA.B #$13                                                           ;81AABA;
    STA.B $6C                                                            ;81AABC;
    LDA.B #$32                                                           ;81AABE;
    STA.B $60                                                            ;81AAC0;
    STA.W $2123                                                          ;81AAC2;
    LDA.B #$02                                                           ;81AAC5;
    STA.B $61                                                            ;81AAC7;
    STA.W $2124                                                          ;81AAC9;
    LDA.B #$05                                                           ;81AACC;
    STA.B $72                                                            ;81AACE;
    STA.W $2131                                                          ;81AAD0;
    LDA.B #$22                                                           ;81AAD3;
    STA.B $62                                                            ;81AAD5;
    STA.W $2125                                                          ;81AAD7;
    LDA.B #$30                                                           ;81AADA;
    STA.B $5D                                                            ;81AADC;
    LDA.B #$00                                                           ;81AADE;
    STA.L $7E9E09                                                        ;81AAE0;
    STA.L $7E9E19                                                        ;81AAE4;
    REP #$30                                                             ;81AAE8;
    LDA.W #$4154                                                         ;81AAEA;
    STA.B $00                                                            ;81AAED;
    LDA.W #$007E                                                         ;81AAEF;
    STA.B $02                                                            ;81AAF2;
    JSL.L DrawRoomSelectMap_AreaLabel                                    ;81AAF4;
    LDX.W $0330                                                          ;81AAF8;
    LDA.W #$0200                                                         ;81AAFB;
    STA.B $D0,X                                                          ;81AAFE;
    LDA.W #$4000                                                         ;81AB00;
    STA.B $D2,X                                                          ;81AB03;
    LDA.W #$007E                                                         ;81AB05;
    STA.B $D4,X                                                          ;81AB08;
    LDA.B $59                                                            ;81AB0A;
    AND.W #$00FC                                                         ;81AB0C;
    XBA                                                                  ;81AB0F;
    STA.B $D5,X                                                          ;81AB10;
    TXA                                                                  ;81AB12;
    CLC                                                                  ;81AB13;
    ADC.W #$0007                                                         ;81AB14;
    STA.W $0330                                                          ;81AB17;
    LDA.W $079F                                                          ;81AB1A;
    ASL A                                                                ;81AB1D;
    TAX                                                                  ;81AB1E;
    LDA.W RoomSelectMap_ExpandingSquare_Timers,X                         ;81AB1F;
    STA.L $7E9E50                                                        ;81AB22;
    TXA                                                                  ;81AB26;
    ASL A                                                                ;81AB27;
    TAX                                                                  ;81AB28;
    LDA.W FileSelectMap_Labels_Positions_X,X                             ;81AB29;
    STA.L $7E9E32                                                        ;81AB2C;
    STA.L $7E9E36                                                        ;81AB30;
    LDA.W FileSelectMap_Labels_Positions_Y,X                             ;81AB34;
    STA.L $7E9E3A                                                        ;81AB37;
    STA.L $7E9E3E                                                        ;81AB3B;
    LDA.W #$0000                                                         ;81AB3F;
    STA.L $7E9E30                                                        ;81AB42;
    STA.L $7E9E34                                                        ;81AB46;
    STA.L $7E9E38                                                        ;81AB4A;
    STA.L $7E9E3C                                                        ;81AB4E;
    TXA                                                                  ;81AB52;
    ASL A                                                                ;81AB53;
    ASL A                                                                ;81AB54;
    TAX                                                                  ;81AB55;
    LDA.W RoomSelectMap_ExpandingSquare_Velocities_leftSub,X             ;81AB56;
    STA.L $7E9E40                                                        ;81AB59;
    LDA.W RoomSelectMap_ExpandingSquare_Velocities_left,X                ;81AB5D;
    STA.L $7E9E42                                                        ;81AB60;
    LDA.W RoomSelectMap_ExpandingSquare_Velocities_rightSub,X            ;81AB64;
    STA.L $7E9E44                                                        ;81AB67;
    LDA.W RoomSelectMap_ExpandingSquare_Velocities_right,X               ;81AB6B;
    STA.L $7E9E46                                                        ;81AB6E;
    LDA.W RoomSelectMap_ExpandingSquare_Velocities_topSub,X              ;81AB72;
    STA.L $7E9E48                                                        ;81AB75;
    LDA.W RoomSelectMap_ExpandingSquare_Velocities_top,X                 ;81AB79;
    STA.L $7E9E4A                                                        ;81AB7C;
    LDA.W RoomSelectMap_ExpandingSquare_Velocities_bottomSub,X           ;81AB80;
    STA.L $7E9E4C                                                        ;81AB83;
    LDA.W RoomSelectMap_ExpandingSquare_Velocities_bottom,X              ;81AB87;
    STA.L $7E9E4E                                                        ;81AB8A;
    SEP #$20                                                             ;81AB8E;
    JSR.W Setup_FileSelectMap_ExpandingSquareTransition_HDMA             ;81AB90;
    LDA.B #$0C                                                           ;81AB93;
    STA.B $85                                                            ;81AB95;
    STA.W HW_HDMAEN                                                      ;81AB97;
    REP #$20                                                             ;81AB9A;
    INC.W $0727                                                          ;81AB9C;
    LDA.W #$003B                                                         ;81AB9F;
    JSL.L QueueSound_Lib1_Max6                                           ;81ABA2;
    RTS                                                                  ;81ABA6;


Setup_FileSelectMap_ExpandingSquareTransition_HDMA:
    SEP #$20                                                             ;81ABA7;
    LDX.W #$0000                                                         ;81ABA9;
    LDA.L $7E9E3A                                                        ;81ABAC;
    LDY.W #$9E22                                                         ;81ABB0; $7E
    JSR.W AddExpandingSquareTransition_LeftPos_IndirectHDMATable         ;81ABB3;
    LDY.W #$9E20                                                         ;81ABB6; $7E
    JSR.W AddExpandingSquareTransition_RightPos_IndirectHDMATable        ;81ABB9;
    LDA.L $7E9E3E                                                        ;81ABBC;
    SEC                                                                  ;81ABC0;
    SBC.L $7E9E3A                                                        ;81ABC1;
    BNE +                                                                ;81ABC5;
    LDA.B #$01                                                           ;81ABC7;

  + LDY.W #$9E32                                                         ;81ABC9; $7E
    JSR.W AddExpandingSquareTransition_LeftPos_IndirectHDMATable         ;81ABCC;
    LDY.W #$9E36                                                         ;81ABCF; $7E
    JSR.W AddExpandingSquareTransition_RightPos_IndirectHDMATable        ;81ABD2;
    LDA.B #$E0                                                           ;81ABD5;
    SEC                                                                  ;81ABD7;
    SBC.L $7E9E3E                                                        ;81ABD8;
    BNE +                                                                ;81ABDC;
    LDA.B #$01                                                           ;81ABDE;

  + LDY.W #$9E22                                                         ;81ABE0; $7E
    JSR.W AddExpandingSquareTransition_LeftPos_IndirectHDMATable         ;81ABE3;
    LDY.W #$9E20                                                         ;81ABE6; $7E
    JSR.W AddExpandingSquareTransition_RightPos_IndirectHDMATable        ;81ABE9;
    LDA.B #$00                                                           ;81ABEC;
    STA.L $7E9E00,X                                                      ;81ABEE;
    STA.L $7E9E10,X                                                      ;81ABF2;
    RTS                                                                  ;81ABF6;


AddExpandingSquareTransition_LeftPos_IndirectHDMATable:
    PHA                                                                  ;81ABF7;
    PHY                                                                  ;81ABF8;
    PHP                                                                  ;81ABF9;
    SEP #$20                                                             ;81ABFA;
    BIT.B #$80                                                           ;81ABFC;
    BNE +                                                                ;81ABFE;
    STA.L $7E9E00,X                                                      ;81AC00;
    REP #$20                                                             ;81AC04;
    TYA                                                                  ;81AC06;
    STA.L $7E9E01,X                                                      ;81AC07;
    PLP                                                                  ;81AC0B;
    PLY                                                                  ;81AC0C;
    PLA                                                                  ;81AC0D;
    RTS                                                                  ;81AC0E;

    SEP #$20                                                             ;81AC0F;

  + SEC                                                                  ;81AC11;
    SBC.B #$7F                                                           ;81AC12;
    STA.L $7E9E00,X                                                      ;81AC14;
    LDA.B #$7F                                                           ;81AC18;
    STA.L $7E9E03,X                                                      ;81AC1A;
    REP #$20                                                             ;81AC1E;
    TYA                                                                  ;81AC20;
    STA.L $7E9E01,X                                                      ;81AC21;
    STA.L $7E9E04,X                                                      ;81AC25;
    PLP                                                                  ;81AC29;
    PLY                                                                  ;81AC2A;
    PLA                                                                  ;81AC2B;
    RTS                                                                  ;81AC2C;


AddExpandingSquareTransition_RightPos_IndirectHDMATable:
    PHP                                                                  ;81AC2D;
    SEP #$20                                                             ;81AC2E;
    BIT.B #$80                                                           ;81AC30;
    BNE +                                                                ;81AC32;
    STA.L $7E9E10,X                                                      ;81AC34;
    REP #$20                                                             ;81AC38;
    TYA                                                                  ;81AC3A;
    STA.L $7E9E11,X                                                      ;81AC3B;
    INX                                                                  ;81AC3F;
    INX                                                                  ;81AC40;
    INX                                                                  ;81AC41;
    PLP                                                                  ;81AC42;
    RTS                                                                  ;81AC43;

    SEP #$20                                                             ;81AC44;

  + SEC                                                                  ;81AC46;
    SBC.B #$7F                                                           ;81AC47;
    STA.L $7E9E10,X                                                      ;81AC49;
    LDA.B #$7F                                                           ;81AC4D;
    STA.L $7E9E13,X                                                      ;81AC4F;
    REP #$20                                                             ;81AC53;
    TYA                                                                  ;81AC55;
    STA.L $7E9E11,X                                                      ;81AC56;
    STA.L $7E9E14,X                                                      ;81AC5A;
    TXA                                                                  ;81AC5E;
    CLC                                                                  ;81AC5F;
    ADC.W #$0006                                                         ;81AC60;
    TAX                                                                  ;81AC63;
    PLP                                                                  ;81AC64;
    RTS                                                                  ;81AC65;


FileSelectMap_Index8_AreaSelectMapToRoomSelectMap:
    REP #$30                                                             ;81AC66;
    JSR.W HandleRoomSelectMap_ExpandingSquareTransition                  ;81AC68;
    BPL +                                                                ;81AC6B;
    INC.W $0727                                                          ;81AC6D;
    SEP #$20                                                             ;81AC70;
    LDA.B #$02                                                           ;81AC72;
    STA.B $69                                                            ;81AC74;
    LDA.B #$00                                                           ;81AC76;
    STA.B $6C                                                            ;81AC78;
    STA.B $6D                                                            ;81AC7A;
    STA.B $6B                                                            ;81AC7C;

  + REP #$30                                                             ;81AC7E;
    JSR.W DrawAreaSelectMapLabels                                        ;81AC80;
    RTS                                                                  ;81AC83;


HandleRoomSelectMap_ExpandingSquareTransition:
    LDA.L $7E9E30                                                        ;81AC84;
    CLC                                                                  ;81AC88;
    ADC.L $7E9E40                                                        ;81AC89;
    STA.L $7E9E30                                                        ;81AC8D;
    LDA.L $7E9E32                                                        ;81AC91;
    ADC.L $7E9E42                                                        ;81AC95;
    CMP.W #$0001                                                         ;81AC99;
    BPL +                                                                ;81AC9C;
    LDA.W #$0001                                                         ;81AC9E;

  + STA.L $7E9E32                                                        ;81ACA1;
    LDA.L $7E9E34                                                        ;81ACA5;
    CLC                                                                  ;81ACA9;
    ADC.L $7E9E44                                                        ;81ACAA;
    STA.L $7E9E34                                                        ;81ACAE;
    LDA.L $7E9E36                                                        ;81ACB2;
    ADC.L $7E9E46                                                        ;81ACB6;
    CMP.W #$0100                                                         ;81ACBA;
    BMI +                                                                ;81ACBD;
    LDA.W #$00FF                                                         ;81ACBF;

  + STA.L $7E9E36                                                        ;81ACC2;
    LDA.L $7E9E38                                                        ;81ACC6;
    CLC                                                                  ;81ACCA;
    ADC.L $7E9E48                                                        ;81ACCB;
    STA.L $7E9E38                                                        ;81ACCF;
    LDA.L $7E9E3A                                                        ;81ACD3;
    ADC.L $7E9E4A                                                        ;81ACD7;
    CMP.W #$0001                                                         ;81ACDB;
    BPL +                                                                ;81ACDE;
    LDA.W #$0001                                                         ;81ACE0;

  + STA.L $7E9E3A                                                        ;81ACE3;
    LDA.L $7E9E3C                                                        ;81ACE7;
    CLC                                                                  ;81ACEB;
    ADC.L $7E9E4C                                                        ;81ACEC;
    STA.L $7E9E3C                                                        ;81ACF0;
    LDA.L $7E9E3E                                                        ;81ACF4;
    ADC.L $7E9E4E                                                        ;81ACF8;
    CMP.W #$00E0                                                         ;81ACFC;
    BMI +                                                                ;81ACFF;
    LDA.W #$00E0                                                         ;81AD01;

  + STA.L $7E9E3E                                                        ;81AD04;
    JSR.W Setup_FileSelectMap_ExpandingSquareTransition_HDMA             ;81AD08;
    REP #$20                                                             ;81AD0B;
    LDA.L $7E9E50                                                        ;81AD0D;
    DEC A                                                                ;81AD11;
    STA.L $7E9E50                                                        ;81AD12;
    RTS                                                                  ;81AD16;


FileSelectMap_Index9_AreaSelectMapToRoomSelectMap_Init:
    REP #$30                                                             ;81AD17;
    JSL.L LoadMirrorOfCurrentAreasMapExplored                            ;81AD19;
    JSL.L DrawRoomSelectMap                                              ;81AD1D;
    JSL.L LoadFromLoadStation                                            ;81AD21;
    JSL.L Disable_HDMAObjects                                            ;81AD25;
    JSL.L Wait_End_VBlank_Clear_HDMA                                     ;81AD29;
    PHB                                                                  ;81AD2D;
    SEP #$20                                                             ;81AD2E;
    LDA.B #$8F                                                           ;81AD30;
    PHA                                                                  ;81AD32;
    PLB                                                                  ;81AD33;
    LDX.W $079B                                                          ;81AD34;
    LDA.W $0001,X                                                        ;81AD37;
    AND.B #$FF                                                           ;81AD3A;
    STA.W $079F                                                          ;81AD3C;
    LDA.W $0002,X                                                        ;81AD3F;
    AND.B #$FF                                                           ;81AD42;
    STA.W $07A1                                                          ;81AD44;
    LDA.W $0003,X                                                        ;81AD47;
    AND.B #$FF                                                           ;81AD4A;
    STA.W $07A3                                                          ;81AD4C;
    PLB                                                                  ;81AD4F;
    REP #$20                                                             ;81AD50;
    JSL.L Setup_MapScrolling_for_FileSelectMap                           ;81AD52;
    LDA.W $05B0                                                          ;81AD56;
    CLC                                                                  ;81AD59;
    ADC.W #$0018                                                         ;81AD5A;
    STA.W $05B0                                                          ;81AD5D;
    LDA.W #$0018                                                         ;81AD60;
    STA.B $B7                                                            ;81AD63;
    LDA.B $69                                                            ;81AD65;
    AND.W #$FFFB                                                         ;81AD67;
    STA.B $69                                                            ;81AD6A;
    INC.W $0727                                                          ;81AD6C;
    STZ.W $05FD                                                          ;81AD6F;
    STZ.W $05FF                                                          ;81AD72;
    STZ.W $0776                                                          ;81AD75;
    STZ.W $0778                                                          ;81AD78;
    STZ.W $077A                                                          ;81AD7B;
    RTS                                                                  ;81AD7E;


FileSelectMap_IndexA_RoomSelectMap:
    REP #$30                                                             ;81AD7F;
    JSL.L Draw_FileSelectMap_Icons                                       ;81AD81;
    JSR.W Handle_FileSelectMap_ScrollArrows                              ;81AD85;
    JSL.L MapScrolling                                                   ;81AD88;
    JSL.L Display_Map_Elevator_Destinations                              ;81AD8C;
    LDA.W $05D1                                                          ;81AD90;
    BEQ +                                                                ;81AD93;
    LDA.B $91                                                            ;81AD95;
    BIT.W #$2000                                                         ;81AD97;
    BNE .debug                                                           ;81AD9A;

  + LDA.B $8F                                                            ;81AD9C;
    BIT.W #$8000                                                         ;81AD9E;
    BNE .exit                                                            ;81ADA1;
    BIT.W #$1080                                                         ;81ADA3;
    BEQ .earlyReturn                                                     ;81ADA6;
    INC.W $0727                                                          ;81ADA8;
    LDA.W #$0038                                                         ;81ADAB;
    JSL.L QueueSound_Lib1_Max6                                           ;81ADAE;

.earlyReturn:
    RTS                                                                  ;81ADB2;


.exit:
    LDA.W $0727                                                          ;81ADB3;
    CLC                                                                  ;81ADB6;
    ADC.W #$0005                                                         ;81ADB7;
    STA.W $0727                                                          ;81ADBA;
    LDX.W #$0000                                                         ;81ADBD;
    LDA.W $079F                                                          ;81ADC0;

.loopMapAreaIndex:
    CMP.W FileSelectMapArea_IndexTable,X                                 ;81ADC3;
    BEQ +                                                                ;81ADC6;
    INX                                                                  ;81ADC8;
    INX                                                                  ;81ADC9;
    CPX.W #$000C                                                         ;81ADCA;
    BMI .loopMapAreaIndex                                                ;81ADCD;
    STZ.W $0950                                                          ;81ADCF;
    RTS                                                                  ;81ADD2;


  + TXA                                                                  ;81ADD3;
    LSR A                                                                ;81ADD4;
    STA.W $0950                                                          ;81ADD5;
    LDA.W #$003C                                                         ;81ADD8;
    JSL.L QueueSound_Lib1_Max6                                           ;81ADDB;
    RTS                                                                  ;81ADDF;


.debug:
    LDA.W #$0038                                                         ;81ADE0;
    JSL.L QueueSound_Lib1_Max6                                           ;81ADE3;
    PHB                                                                  ;81ADE7;
    SEP #$20                                                             ;81ADE8;
    LDA.B #$82                                                           ;81ADEA;
    STA.B $02                                                            ;81ADEC;
    PHA                                                                  ;81ADEE;
    PLB                                                                  ;81ADEF;
    REP #$20                                                             ;81ADF0;
    LDA.W $079F                                                          ;81ADF2;
    ASL A                                                                ;81ADF5;
    TAX                                                                  ;81ADF6;
    LDA.L $7ED8F8,X                                                      ;81ADF7;
    STA.B $18                                                            ;81ADFB;
    LDA.W $078B                                                          ;81ADFD;

.loopIndex:
    LSR.B $18                                                            ;81AE00;
    DEC A                                                                ;81AE02;
    BPL .loopIndex                                                       ;81AE03;
    LDA.W $079F                                                          ;81AE05;
    ASL A                                                                ;81AE08;
    CLC                                                                  ;81AE09;
    ADC.W #MapIcon_PositionTablePointers_savePoints                      ;81AE0A;
    TAX                                                                  ;81AE0D;
    LDA.W $0000,X                                                        ;81AE0E;

.crash:
    BEQ .crash                                                           ;81AE11;
    STA.B $00                                                            ;81AE13;
    LDA.W $078B                                                          ;81AE15;
    ASL A                                                                ;81AE18;
    ASL A                                                                ;81AE19;
    TAY                                                                  ;81AE1A;
    LDA.B [$00],Y                                                        ;81AE1B;
    STA.B $12                                                            ;81AE1D;
    INY                                                                  ;81AE1F;
    INY                                                                  ;81AE20;
    LDA.B [$00],Y                                                        ;81AE21;
    STA.B $14                                                            ;81AE23;
    LDA.W $078B                                                          ;81AE25;
    CMP.W #$0010                                                         ;81AE28;
    BPL .debugSavePoints                                                 ;81AE2B;
    BRA .savesElevators                                                  ;81AE2D;


.loopSavesElevators:
    LSR.B $18                                                            ;81AE2F;
    BCC .savesElevators                                                  ;81AE31;
    LDA.W $078B                                                          ;81AE33;
    ASL A                                                                ;81AE36;
    ASL A                                                                ;81AE37;
    TAY                                                                  ;81AE38;
    LDA.B [$00],Y                                                        ;81AE39;
    CMP.W #$FFFE                                                         ;81AE3B;
    BEQ .savesElevators                                                  ;81AE3E;
    CMP.W #$FFFF                                                         ;81AE40;
    BNE .found                                                           ;81AE43;

.savesElevators:
    INC.W $078B                                                          ;81AE45;
    LDA.W $078B                                                          ;81AE48;
    CMP.W #$0010                                                         ;81AE4B;
    BMI .loopSavesElevators                                              ;81AE4E;

.loopDebugSavePoints:
    LDA.W $078B                                                          ;81AE50;
    ASL A                                                                ;81AE53;
    ASL A                                                                ;81AE54;
    TAY                                                                  ;81AE55;
    LDA.B [$00],Y                                                        ;81AE56;
    CMP.W #$FFFF                                                         ;81AE58;
    BEQ .finishedDebugSavePoints                                         ;81AE5B;
    CMP.W #$FFFE                                                         ;81AE5D;
    BNE .found                                                           ;81AE60;

.debugSavePoints:
    INC.W $078B                                                          ;81AE62;
    BRA .loopDebugSavePoints                                             ;81AE65;


.finishedDebugSavePoints:
    STZ.W $078B                                                          ;81AE67;
    LDA.W $079F                                                          ;81AE6A;
    ASL A                                                                ;81AE6D;
    TAX                                                                  ;81AE6E;
    LDA.L $7ED8F8,X                                                      ;81AE6F;
    STA.B $18                                                            ;81AE73;
    BRA .loopSavesElevators                                              ;81AE75;


.found:
    LDA.W $078B                                                          ;81AE77;
    ASL A                                                                ;81AE7A;
    ASL A                                                                ;81AE7B;
    TAY                                                                  ;81AE7C;
    LDA.B [$00],Y                                                        ;81AE7D;
    CMP.B $B1                                                            ;81AE7F;
    BMI +                                                                ;81AE81;
    SEC                                                                  ;81AE83;
    SBC.W #$0100                                                         ;81AE84;
    CMP.B $B1                                                            ;81AE87;
    BMI .noXScroll                                                       ;81AE89;

  + LDA.B [$00],Y                                                        ;81AE8B;
    SEC                                                                  ;81AE8D;
    SBC.B $12                                                            ;81AE8E;
    CLC                                                                  ;81AE90;
    ADC.B $B1                                                            ;81AE91;
    BPL +                                                                ;81AE93;
    LDA.W #$0000                                                         ;81AE95;
    BRA .storeXScroll                                                    ;81AE98;


  + CMP.W $05AC                                                          ;81AE9A;
    BMI .storeXScroll                                                    ;81AE9D;
    LDA.W $05AC                                                          ;81AE9F;

.storeXScroll:
    STA.B $B1                                                            ;81AEA2;

.noXScroll:
    INY                                                                  ;81AEA4;
    INY                                                                  ;81AEA5;
    LDA.B [$00],Y                                                        ;81AEA6;
    CMP.B $B3                                                            ;81AEA8;
    BMI +                                                                ;81AEAA;
    SEC                                                                  ;81AEAC;
    SBC.W #$00A1                                                         ;81AEAD;
    CMP.B $B3                                                            ;81AEB0;
    BMI .return                                                          ;81AEB2;

  + LDA.B [$00],Y                                                        ;81AEB4;
    SEC                                                                  ;81AEB6;
    SBC.B $14                                                            ;81AEB7;
    CLC                                                                  ;81AEB9;
    ADC.B $B3                                                            ;81AEBA;
    CMP.W $05B0                                                          ;81AEBC;
    BMI +                                                                ;81AEBF;
    LDA.W $05B0                                                          ;81AEC1;

  + STA.B $B3                                                            ;81AEC4;

.return:
    PLB                                                                  ;81AEC6;
    RTS                                                                  ;81AEC7;


UNUSED_REP30_81AEC8:
    REP #$30                                                             ;81AEC8;

Handle_FileSelectMap_ScrollArrows:
    PHP                                                                  ;81AECA;
    PHB                                                                  ;81AECB;
    PHK                                                                  ;81AECC;
    PLB                                                                  ;81AECD;
    REP #$20                                                             ;81AECE;
    LDA.W $05AC                                                          ;81AED0;
    SEC                                                                  ;81AED3;
    SBC.W #$0018                                                         ;81AED4;
    CMP.B $B1                                                            ;81AED7;
    BPL +                                                                ;81AED9;
    LDX.W #MapScroll_ArrowData_mapScrollDirection_left                   ;81AEDB;
    JSL.L Draw_MapScrollArrow_and_Check_Scroll_in_that_Direction         ;81AEDE;

  + LDA.W $05AE                                                          ;81AEE2;
    CLC                                                                  ;81AEE5;
    ADC.W #$0018                                                         ;81AEE6;
    SEC                                                                  ;81AEE9;
    SBC.W #$0100                                                         ;81AEEA;
    CMP.B $B1                                                            ;81AEED;
    BMI +                                                                ;81AEEF;
    LDX.W #MapScroll_ArrowData_mapScrollDirection_right                  ;81AEF1;
    JSL.L Draw_MapScrollArrow_and_Check_Scroll_in_that_Direction         ;81AEF4;

  + LDA.W $05B0                                                          ;81AEF8;
    SEC                                                                  ;81AEFB;
    SBC.W #$0040                                                         ;81AEFC;
    CMP.B $B3                                                            ;81AEFF;
    BPL +                                                                ;81AF01;
    LDX.W #MapScroll_ArrowData_mapScrollDirection_up                     ;81AF03;
    JSL.L Draw_MapScrollArrow_and_Check_Scroll_in_that_Direction         ;81AF06;

  + LDA.W $05B2                                                          ;81AF0A;
    SEC                                                                  ;81AF0D;
    SBC.W #$0091                                                         ;81AF0E;
    CMP.B $B3                                                            ;81AF11;
    BMI .cancelScrollDown                                                ;81AF13;
    LDX.W #MapScroll_ArrowData_mapScrollDirection_down                   ;81AF15;
    JSL.L Draw_MapScrollArrow_and_Check_Scroll_in_that_Direction         ;81AF18;

.return:
    PLB                                                                  ;81AF1C;
    PLP                                                                  ;81AF1D;
    RTS                                                                  ;81AF1E;


.cancelScrollDown:
    LDA.W $05FD                                                          ;81AF1F;
    CMP.W MapScroll_ArrowData_mapScrollDirection_end                     ;81AF22;
    BNE .return                                                          ;81AF25;
    STZ.W $05FB                                                          ;81AF27;
    STZ.W $05FD                                                          ;81AF2A;
    STZ.W $05FF                                                          ;81AF2D;
    BRA .return                                                          ;81AF30;


MapScroll_ArrowData_mapScrollDirection:
;        ___________________________ X position
;       |      _____________________ Y position
;       |     |      _______________ Pause screen animation ID
;       |     |     |      _________ Necessary input
;       |     |     |     |      ___ Map scrolling direction
;       |     |     |     |     |
  .left
    dw $0010,$0060,$0009,$0200,$0001                                     ;81AF32;

  .right
    dw $00F0,$0060,$0008,$0100,$0002                                     ;81AF3C;

  .up
    dw $0080,$0020,$0006,$0800,$0003                                     ;81AF46;

  .down
    dw $0080,$00A0,$0007,$0400                                           ;81AF50;

  .end
    dw $0004                                                             ;81AF58;

FileSelectMap_IndexB_C_RoomSelectMapToLoadingGameData:
    JSL.L Draw_FileSelectMap_Icons                                       ;81AF5A;
    JSL.L Display_Map_Elevator_Destinations                              ;81AF5E;
    INC.W $0727                                                          ;81AF62;
    RTS                                                                  ;81AF65;


FileSelectMap_IndexD_RoomSelectMapToAreaSelectMap_FadeOut:
    JSL.L Draw_FileSelectMap_Icons                                       ;81AF66;
    JSL.L Display_Map_Elevator_Destinations                              ;81AF6A;
    JSL.L HandleFadingOut                                                ;81AF6E;
    LDA.B $51                                                            ;81AF72;
    AND.W #$000F                                                         ;81AF74;
    BNE .return                                                          ;81AF77;
    INC.W $0727                                                          ;81AF79;
    LDA.W #$0020                                                         ;81AF7C;
    STA.W $0F7A                                                          ;81AF7F;

.return:
    RTS                                                                  ;81AF82;


FileSelectMap_IndexE_RoomSelectMapToLoadingGameData_Wait:
    LDA.W $0F7A                                                          ;81AF83;
    DEC A                                                                ;81AF86;
    STA.W $0F7A                                                          ;81AF87;
    BNE .return                                                          ;81AF8A;
    JSL.L SetForceBlankAndWaitForNMI                                     ;81AF8C;
    INC.W $0998                                                          ;81AF90;
    STZ.W $0727                                                          ;81AF93;

.return:
    RTS                                                                  ;81AF96;


FileSelectMap_IndexF_RoomSelectMapToAreaSelectMap_ClearBG1:
    SEP #$20                                                             ;81AF97;
    LDA.B #$12                                                           ;81AF99;
    STA.B $69                                                            ;81AF9B;
    REP #$30                                                             ;81AF9D;
    LDA.W #$000F                                                         ;81AF9F;
    LDX.W #$07FE                                                         ;81AFA2;

.loop:
    STA.L $7E3000,X                                                      ;81AFA5;
    DEX                                                                  ;81AFA9;
    DEX                                                                  ;81AFAA;
    BPL .loop                                                            ;81AFAB;
    LDX.W $0330                                                          ;81AFAD;
    LDA.W #$0800                                                         ;81AFB0;
    STA.B $D0,X                                                          ;81AFB3;
    LDA.W #$3000                                                         ;81AFB5;
    STA.B $D2,X                                                          ;81AFB8;
    LDA.W #$007E                                                         ;81AFBA;
    STA.B $D4,X                                                          ;81AFBD;
    LDA.B $58                                                            ;81AFBF;
    AND.W #$00FC                                                         ;81AFC1;
    XBA                                                                  ;81AFC4;
    STA.B $D5,X                                                          ;81AFC5;
    TXA                                                                  ;81AFC7;
    CLC                                                                  ;81AFC8;
    ADC.W #$0007                                                         ;81AFC9;
    STA.W $0330                                                          ;81AFCC;
    INC.W $0727                                                          ;81AFCF;
    RTS                                                                  ;81AFD2;


FileSelectMap_Index10_RoomSelectMapToAreaSelectMap_LoadPal:
    REP #$30                                                             ;81AFD3;
    JSR.W LoadMenuPalettes                                               ;81AFD5;
    LDX.W #$0000                                                         ;81AFD8;

.loop:
    PHX                                                                  ;81AFDB;
    JSR.W LoadInactiveAreaMapForegroundColors                            ;81AFDC;
    PLX                                                                  ;81AFDF;
    INX                                                                  ;81AFE0;
    CPX.W #$0006                                                         ;81AFE1;
    BMI .loop                                                            ;81AFE4;
    LDX.W $079F                                                          ;81AFE6;
    JSR.W LoadActiveAreaMapForegroundColors                              ;81AFE9;
    LDY.W $079F                                                          ;81AFEC;
    JSR.W Load_AreaSelect_BackgroundTilemap                              ;81AFEF;
    INC.W $0727                                                          ;81AFF2;
    RTS                                                                  ;81AFF5;


FileSelectMap_Index14_PrepContractSquareTransToAreaSelect:
    SEP #$20                                                             ;81AFF6;
    LDA.B #$00                                                           ;81AFF8;
    STA.B $85                                                            ;81AFFA;
    REP #$30                                                             ;81AFFC;
    LDA.W #$003C                                                         ;81AFFE;
    JSL.L QueueSound_Lib1_Max6                                           ;81B001;
    LDA.W $079F                                                          ;81B005;
    ASL A                                                                ;81B008;
    TAX                                                                  ;81B009;
    LDA.W RoomSelectMap_ExpandingSquare_Timers,X                         ;81B00A;
    SEC                                                                  ;81B00D;
    SBC.W #$000C                                                         ;81B00E;
    STA.L $7E9E50                                                        ;81B011;
    TXA                                                                  ;81B015;
    ASL A                                                                ;81B016;
    ASL A                                                                ;81B017;
    ASL A                                                                ;81B018;
    TAX                                                                  ;81B019;
    LDA.W RoomSelectMap_ExpandingSquare_Velocities_leftSub,X             ;81B01A;
    STA.L $7E9E40                                                        ;81B01D;
    LDA.W RoomSelectMap_ExpandingSquare_Velocities_left,X                ;81B021;
    STA.L $7E9E42                                                        ;81B024;
    LDA.W RoomSelectMap_ExpandingSquare_Velocities_rightSub,X            ;81B028;
    STA.L $7E9E44                                                        ;81B02B;
    LDA.W RoomSelectMap_ExpandingSquare_Velocities_right,X               ;81B02F;
    STA.L $7E9E46                                                        ;81B032;
    LDA.W RoomSelectMap_ExpandingSquare_Velocities_topSub,X              ;81B036;
    STA.L $7E9E48                                                        ;81B039;
    LDA.W RoomSelectMap_ExpandingSquare_Velocities_top,X                 ;81B03D;
    STA.L $7E9E4A                                                        ;81B040;
    LDA.W RoomSelectMap_ExpandingSquare_Velocities_bottomSub,X           ;81B044;
    STA.L $7E9E4C                                                        ;81B047;
    LDA.W RoomSelectMap_ExpandingSquare_Velocities_bottom,X              ;81B04B;
    STA.L $7E9E4E                                                        ;81B04E;
    LDA.W #$0008                                                         ;81B052;
    STA.L $7E9E32                                                        ;81B055;
    LDA.W #$00F8                                                         ;81B059;
    STA.L $7E9E36                                                        ;81B05C;
    LDA.W #$0008                                                         ;81B060;
    STA.L $7E9E3A                                                        ;81B063;
    LDA.W #$00D8                                                         ;81B067;
    STA.L $7E9E3E                                                        ;81B06A;
    LDA.W #$0000                                                         ;81B06E;
    STA.L $7E9E30                                                        ;81B071;
    STA.L $7E9E34                                                        ;81B075;
    STA.L $7E9E38                                                        ;81B079;
    STA.L $7E9E3C                                                        ;81B07D;
    JSR.W Setup_FileSelectMap_ExpandingSquareTransition_HDMA             ;81B081;
    INC.W $0727                                                          ;81B084;
    SEP #$20                                                             ;81B087;
    LDA.B #$0C                                                           ;81B089;
    STA.B $85                                                            ;81B08B;
    STA.W HW_HDMAEN                                                      ;81B08D;
    LDA.B #$32                                                           ;81B090;
    STA.B $60                                                            ;81B092;
    STA.W $2123                                                          ;81B094;
    LDA.B #$02                                                           ;81B097;
    STA.B $61                                                            ;81B099;
    STA.W $2124                                                          ;81B09B;
    LDA.B #$30                                                           ;81B09E;
    STA.B $5D                                                            ;81B0A0;
    LDA.B #$22                                                           ;81B0A2;
    STA.B $62                                                            ;81B0A4;
    LDA.B #$00                                                           ;81B0A6;
    STA.L $7E9E09                                                        ;81B0A8;
    STA.L $7E9E19                                                        ;81B0AC;
    LDA.B #$00                                                           ;81B0B0;
    STA.B $B3                                                            ;81B0B2;
    STA.B $B4                                                            ;81B0B4;
    STA.B $B1                                                            ;81B0B6;
    STA.B $B2                                                            ;81B0B8;
    RTS                                                                  ;81B0BA;


FileSelectMap_Index15_RoomSelectMapToAreaSelectMap:
    REP #$30                                                             ;81B0BB;
    LDA.L $7E9E30                                                        ;81B0BD;
    SEC                                                                  ;81B0C1;
    SBC.L $7E9E40                                                        ;81B0C2;
    STA.L $7E9E30                                                        ;81B0C6;
    LDA.L $7E9E32                                                        ;81B0CA;
    SBC.L $7E9E42                                                        ;81B0CE;
    STA.L $7E9E32                                                        ;81B0D2;
    LDA.L $7E9E34                                                        ;81B0D6;
    SEC                                                                  ;81B0DA;
    SBC.L $7E9E44                                                        ;81B0DB;
    STA.L $7E9E34                                                        ;81B0DF;
    LDA.L $7E9E36                                                        ;81B0E3;
    SBC.L $7E9E46                                                        ;81B0E7;
    STA.L $7E9E36                                                        ;81B0EB;
    LDA.L $7E9E38                                                        ;81B0EF;
    SEC                                                                  ;81B0F3;
    SBC.L $7E9E48                                                        ;81B0F4;
    STA.L $7E9E38                                                        ;81B0F8;
    LDA.L $7E9E3A                                                        ;81B0FC;
    SBC.L $7E9E4A                                                        ;81B100;
    STA.L $7E9E3A                                                        ;81B104;
    LDA.L $7E9E3C                                                        ;81B108;
    SEC                                                                  ;81B10C;
    SBC.L $7E9E4C                                                        ;81B10D;
    STA.L $7E9E3C                                                        ;81B111;
    LDA.L $7E9E3E                                                        ;81B115;
    SBC.L $7E9E4E                                                        ;81B119;
    STA.L $7E9E3E                                                        ;81B11D;
    JSR.W Setup_FileSelectMap_ExpandingSquareTransition_HDMA             ;81B121;
    REP #$20                                                             ;81B124;
    JSR.W DrawAreaSelectMapLabels                                        ;81B126;
    LDA.L $7E9E50                                                        ;81B129;
    DEC A                                                                ;81B12D;
    STA.L $7E9E50                                                        ;81B12E;
    BPL .return                                                          ;81B132;
    LDA.W $0727                                                          ;81B134;
    SEC                                                                  ;81B137;
    SBC.W #$000F                                                         ;81B138;
    STA.W $0727                                                          ;81B13B;
    SEP #$20                                                             ;81B13E;
    LDA.B #$11                                                           ;81B140;
    STA.B $69                                                            ;81B142;
    LDA.B #$00                                                           ;81B144;
    STA.B $6C                                                            ;81B146;
    STA.B $6D                                                            ;81B148;

.return:
    RTS                                                                  ;81B14A;


Tilemap_RoomSelectMap_Controls:
    dw $2801,$2801,$2801,$2801,$2801,$2801,$2801,$2801                   ;81B14B;
    dw $2801,$2801,$2801,$2801,$2801,$2801,$2801,$2801                   ;81B15B;
    dw $2801,$2801,$2801,$2801,$2801,$2801,$2801,$2801                   ;81B16B;
    dw $2801,$2801,$2801,$2801,$2801,$2801,$2801,$2801                   ;81B17B;
    dw $2801,$2801,$2801,$2801,$2801,$2801,$2801,$2801                   ;81B18B;
    dw $2801,$2801,$2801,$2801,$2801,$2801,$2801,$2801                   ;81B19B;
    dw $2801,$2801,$2801,$2801,$2801,$2801,$2801,$2801                   ;81B1AB;
    dw $2801,$2801,$2801,$2801,$2801,$2801,$2801,$2801                   ;81B1BB;
    dw $2801,$2801,$2801,$28B6,$28B7,$283C,$2830,$283F                   ;81B1CB;
    dw $2801,$2801,$2801,$2801,$2801,$2850,$6850,$2801                   ;81B1DB;
    dw $2801,$2801,$2801,$2801,$2801,$2801,$2851,$2852                   ;81B1EB;
    dw $2801,$2801,$2801,$2801,$2801,$2801,$2801,$2801                   ;81B1FB;
    dw $2801,$2801,$2801,$28C6,$28C7,$2842,$2832,$2841                   ;81B20B;
    dw $283E,$283B,$283B,$2801,$2801,$2860,$6860,$2842                   ;81B21B;
    dw $2843,$2830,$2841,$2843,$2801,$2801,$2861,$2862                   ;81B22B;
    dw $2832,$2830,$283D,$2832,$2834,$283B,$2801,$2801                   ;81B23B;
    dw $2801,$2801,$2801,$2801,$2801,$2801,$2801,$2801                   ;81B24B;
    dw $2801,$2801,$2801,$2801,$2801,$2801,$2801,$2801                   ;81B25B;
    dw $2801,$2801,$2801,$2801,$2801,$2801,$2801,$2801                   ;81B26B;
    dw $2801,$2801,$2801,$2801,$2801,$2801,$2801,$2801                   ;81B27B;
    dw $2801,$2801,$2801,$2801,$2801,$2801,$2801,$2801                   ;81B28B;
    dw $2801,$2801,$2801,$2801,$2801,$2801,$2801,$2801                   ;81B29B;
    dw $2801,$2801,$2801,$2801,$2801,$2801,$2801,$2801                   ;81B2AB;
    dw $2801,$2801,$2801,$2801,$2801,$2801,$2801,$2801                   ;81B2BB;
