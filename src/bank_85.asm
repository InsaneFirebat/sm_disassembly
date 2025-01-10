
org $858000


Large_MessageBox_TopBottomBorder_Tilemap:
    dw $000E,$000E,$000E,$284E,$284E,$284E,$284E,$284E                   ;858000;
    dw $284E,$280F,$280F,$280F,$280F,$280F,$280F,$280F                   ;858010;
    dw $280F,$280F,$280F,$280F,$280F,$280F,$280F,$280F                   ;858020;
    dw $280F,$280F,$280F,$284E,$284E,$000E,$000E,$000E                   ;858030;

Small_MessageBox_TopBottomBorder_Tilemap:
    dw $000E,$000E,$000E,$000E,$000E,$000E,$284E,$284E                   ;858040;
    dw $284E,$284E,$284E,$284E,$284E,$284E,$284E,$284E                   ;858050;
    dw $284E,$284E,$284E,$284E,$284E,$284E,$284E,$284E                   ;858060;
    dw $284E,$000E,$000E,$000E,$000E,$000E,$000E,$000E                   ;858070;

MessageBox_Routine:
    PHP                                                                  ;858080;
    PHB                                                                  ;858081;
    PHX                                                                  ;858082;
    PHY                                                                  ;858083;
    PHK                                                                  ;858084;
    PLB                                                                  ;858085;
    STA.W $1C1F                                                          ;858086;
    JSL.L Cancel_Sound_Effects                                           ;858089;
    JSR.W Initialise_PPU_for_MessageBoxes                                ;85808D;
    JSR.W Clear_MessageBox_BG3Tilemap                                    ;858090;
    JSR.W Initialise_MessageBox                                          ;858093;
    JSR.W Play_2_Lag_Frames_of_Music_and_Sound_Effects                   ;858096;
    JSR.W Open_MessageBox                                                ;858099;
    LDA.W $1C1F                                                          ;85809C;
    CMP.W #$001C                                                         ;85809F;
    BEQ .gunship                                                         ;8580A2;
    JSR.W Handle_MessageBox_Interaction                                  ;8580A4;
    JSR.W Close_MessageBox                                               ;8580A7;
    JSR.W Clear_MessageBox_BG3Tilemap                                    ;8580AA;
    JSR.W Restore_PPU                                                    ;8580AD;
    JSL.L Queue_Samus_Movement_SoundEffects                              ;8580B0;
    JSR.W Play_2_Lag_Frames_of_Music_and_Sound_Effects                   ;8580B4;
    JSR.W MaybeTriggerPauseScreen_or_ReturnSaveConfirmationSelection     ;8580B7;

.return:
    PLY                                                                  ;8580BA;
    PLX                                                                  ;8580BB;
    PLB                                                                  ;8580BC;
    PLP                                                                  ;8580BD;
    RTL                                                                  ;8580BE;


.gunship:
    JSR.W Handle_MessageBox_Interaction                                  ;8580BF;
    JSR.W Close_MessageBox                                               ;8580C2;
    LDA.W $05F9                                                          ;8580C5;
    CMP.W #$0002                                                         ;8580C8;
    BEQ .no                                                              ;8580CB;
    LDA.W #$0018                                                         ;8580CD;
    STA.W $1C1F                                                          ;8580D0;
    JSR.W Clear_MessageBox_BG3Tilemap                                    ;8580D3;
    JSR.W Play_Saving_Sound_Effect                                       ;8580D6;
    JSR.W Initialise_MessageBox                                          ;8580D9;
    JSR.W Play_2_Lag_Frames_of_Music_and_Sound_Effects                   ;8580DC;
    JSR.W Open_MessageBox                                                ;8580DF;
    JSR.W Handle_MessageBox_Interaction                                  ;8580E2;
    JSR.W Close_MessageBox                                               ;8580E5;

.no:
    JSR.W Clear_MessageBox_BG3Tilemap                                    ;8580E8;
    JSR.W Restore_PPU                                                    ;8580EB;
    JSL.L Queue_Samus_Movement_SoundEffects                              ;8580EE;
    JSR.W Play_2_Lag_Frames_of_Music_and_Sound_Effects                   ;8580F2;
    JSR.W MaybeTriggerPauseScreen_or_ReturnSaveConfirmationSelection     ;8580F5;
    BRA .return                                                          ;8580F8;


MaybeTriggerPauseScreen_or_ReturnSaveConfirmationSelection:
    REP #$30                                                             ;8580FA;
    LDA.W $1C1F                                                          ;8580FC;
    CMP.W #$0014                                                         ;8580FF;
    BNE .notMapPause                                                     ;858102;
    LDA.W #$000C                                                         ;858104;
    STA.W $0998                                                          ;858107;
    RTS                                                                  ;85810A;


.notMapPause:
    CMP.W #$001C                                                         ;85810B;
    BEQ .saveConfirmationSelection                                       ;85810E;
    CMP.W #$0017                                                         ;858110;
    BNE .return                                                          ;858113;

.saveConfirmationSelection:
    LDA.W $05F9                                                          ;858115;

.return:
    RTS                                                                  ;858118;


Play_Saving_Sound_Effect:
    REP #$30                                                             ;858119;
    LDA.W #$002E                                                         ;85811B;
    JSL.L QueueSound_Lib1_Max6                                           ;85811E;
    LDA.W #$00A0                                                         ;858122;

.loop:
    PHA                                                                  ;858125;
    JSL.L HandleMusicQueue                                               ;858126;
    JSL.L HandleSounds                                                   ;85812A;
    JSR.W Wait_for_Lag_Frame                                             ;85812E;
    PLA                                                                  ;858131;
    DEC A                                                                ;858132;
    BNE .loop                                                            ;858133;
    RTS                                                                  ;858135;


Wait_for_Lag_Frame:
    PHP                                                                  ;858136;
    SEP #$20                                                             ;858137;
    LDA.W $05B8                                                          ;858139;

.wait:
    CMP.W $05B8                                                          ;85813C;
    BEQ .wait                                                            ;85813F;
    PLP                                                                  ;858141;
    RTS                                                                  ;858142;


Initialise_PPU_for_MessageBoxes:
    REP #$20                                                             ;858143;
    STZ.W $05F9                                                          ;858145;
    JSR.W Wait_for_Lag_Frame                                             ;858148;
    SEP #$20                                                             ;85814B;
    STZ.W HW_HDMAEN                                                      ;85814D;
    LDA.B #$19                                                           ;858150;
    STA.W $2121                                                          ;858152;
    LDA.B #$B1                                                           ;858155;
    STA.W $2122                                                          ;858157;
    LDA.B #$0B                                                           ;85815A;
    STA.W $2122                                                          ;85815C;
    LDA.B #$1F                                                           ;85815F;
    STA.W $2122                                                          ;858161;
    LDA.B #$00                                                           ;858164;
    STA.W $2122                                                          ;858166;
    LDA.B $85                                                            ;858169;
    STA.L $7E33EA                                                        ;85816B;
    LDA.B $5B                                                            ;85816F;
    STA.L $7E33EB                                                        ;858171;
    LDA.B #$58                                                           ;858175;
    STA.B $5B                                                            ;858177;
    LDA.B #$17                                                           ;858179;
    STA.B $6A                                                            ;85817B;
    STZ.B $70                                                            ;85817D;
    STZ.B $73                                                            ;85817F;
    LDA.B #$20                                                           ;858181;
    STA.W $2132                                                          ;858183;
    LDA.B #$40                                                           ;858186;
    STA.W $2132                                                          ;858188;
    LDA.B #$80                                                           ;85818B;
    STA.W $2132                                                          ;85818D;
    LDA.W $2111                                                          ;858190;
    STZ.W $2111                                                          ;858193;
    STZ.W $2111                                                          ;858196;
    LDA.W $2112                                                          ;858199;
    STZ.W $2112                                                          ;85819C;
    STZ.W $2112                                                          ;85819F;
    REP #$30                                                             ;8581A2;
    LDX.W #$0080                                                         ;8581A4;
    LDA.W #$0000                                                         ;8581A7;

.loop:
    STA.L $7E3000,X                                                      ;8581AA;
    DEX                                                                  ;8581AE;
    DEX                                                                  ;8581AF;
    BPL .loop                                                            ;8581B0;
    JSR.W Wait_for_Lag_Frame                                             ;8581B2;
    REP #$20                                                             ;8581B5;
    LDA.W #$5880                                                         ;8581B7;
    STA.W $2116                                                          ;8581BA;
    LDA.W $2139                                                          ;8581BD;
    LDA.W #$3981                                                         ;8581C0;  (8-bit transfer looks wrong, bug?)
    STA.W $4310                                                          ;8581C3;
    LDA.W #$4100                                                         ;8581C6;
    STA.W $4312                                                          ;8581C9;
    LDA.W #$007E                                                         ;8581CC;
    STA.W $4314                                                          ;8581CF;
    LDA.W #$0700                                                         ;8581D2;
    STA.W $4315                                                          ;8581D5;
    STZ.W $4317                                                          ;8581D8;
    STZ.W $4319                                                          ;8581DB;
    SEP #$20                                                             ;8581DE;
    LDA.B #$80                                                           ;8581E0;
    STA.W $2115                                                          ;8581E2;
    LDA.B #$02                                                           ;8581E5;
    STA.W HW_MDMAEN                                                      ;8581E7;
    JSL.L HandleMusicQueue                                               ;8581EA;
    JSL.L HandleSounds                                                   ;8581EE;
    RTS                                                                  ;8581F2;


Clear_MessageBox_BG3Tilemap:
    REP #$30                                                             ;8581F3;
    LDX.W #$06FE                                                         ;8581F5;
    LDA.W .blankTile                                                     ;8581F8;

.loop:
    STA.L $7E3800,X                                                      ;8581FB;
    DEX                                                                  ;8581FF;
    DEX                                                                  ;858200;
    BPL .loop                                                            ;858201;
    JSR.W Wait_for_Lag_Frame                                             ;858203;
    LDA.W #$5880                                                         ;858206;
    STA.W $2116                                                          ;858209;
    LDA.W #$1801                                                         ;85820C;
    STA.W $4310                                                          ;85820F;
    LDA.W #$3800                                                         ;858212;
    STA.W $4312                                                          ;858215;
    LDA.W #$007E                                                         ;858218;
    STA.W $4314                                                          ;85821B;
    LDA.W #$0700                                                         ;85821E;
    STA.W $4315                                                          ;858221;
    STZ.W $4317                                                          ;858224;
    STZ.W $4319                                                          ;858227;
    SEP #$20                                                             ;85822A;
    LDA.B #$80                                                           ;85822C;
    STA.W $2115                                                          ;85822E;
    LDA.B #$02                                                           ;858231;
    STA.W HW_MDMAEN                                                      ;858233;
    JSL.L HandleMusicQueue                                               ;858236;
    JSL.L HandleSounds                                                   ;85823A;
    RTS                                                                  ;85823E;


.blankTile:
    db $0E,$00                                                           ;85823F;

Initialise_MessageBox:
    REP #$30                                                             ;858241;
    LDA.W $1C1F                                                          ;858243;
    DEC A                                                                ;858246;
    ASL A                                                                ;858247;
    STA.B $34                                                            ;858248;
    ASL A                                                                ;85824A;
    CLC                                                                  ;85824B;
    ADC.B $34                                                            ;85824C;
    TAX                                                                  ;85824E;
    PHX                                                                  ;85824F;
    JSR.W (MessageDefinitionsPointers_drawInitialMessageBox,X)           ;858250;
    PLX                                                                  ;858253;
    JSR.W (MessageDefinitionsPointers_modifyMessageBox,X)                ;858254;
    RTS                                                                  ;858257;


UNUSED_REP30_858258:
    REP #$30                                                             ;858258;

Write_Large_MessageBox_Tilemap:
    LDX.W #$0000                                                         ;85825A;

.topBorderLoop:
    LDA.W Large_MessageBox_TopBottomBorder_Tilemap,X                     ;85825D;
    STA.L $7E3200,X                                                      ;858260;
    INX                                                                  ;858264;
    INX                                                                  ;858265;
    CPX.W #$0040                                                         ;858266;
    BNE .topBorderLoop                                                   ;858269;
    LDY.W #$0000                                                         ;85826B;
    JSR.W Write_Message_Tilemap                                          ;85826E;
    LDA.W #$0020                                                         ;858271;
    STA.B $16                                                            ;858274;
    LDY.W #$0000                                                         ;858276;

.bottomBorderLoop:
    LDA.W Large_MessageBox_TopBottomBorder_Tilemap,Y                     ;858279;
    STA.L $7E3200,X                                                      ;85827C;
    INY                                                                  ;858280;
    INY                                                                  ;858281;
    INX                                                                  ;858282;
    INX                                                                  ;858283;
    DEC.B $16                                                            ;858284;
    BNE .bottomBorderLoop                                                ;858286;
    RTS                                                                  ;858288;


Write_Small_MessageBox_Tilemap:
    LDY.W #$0000                                                         ;858289;
    LDX.W #$0000                                                         ;85828C;

.topBorderLoop:
    LDA.W Small_MessageBox_TopBottomBorder_Tilemap,X                     ;85828F;
    STA.L $7E3200,X                                                      ;858292;
    INX                                                                  ;858296;
    INX                                                                  ;858297;
    CPX.W #$0040                                                         ;858298;
    BNE .topBorderLoop                                                   ;85829B;
    JSR.W Write_Message_Tilemap                                          ;85829D;
    LDA.W #$0020                                                         ;8582A0;
    STA.B $16                                                            ;8582A3;
    LDY.W #$0000                                                         ;8582A5;

.bottomBorderLoop:
    LDA.W Small_MessageBox_TopBottomBorder_Tilemap,Y                     ;8582A8;
    STA.L $7E3200,X                                                      ;8582AB;
    INY                                                                  ;8582AF;
    INY                                                                  ;8582B0;
    INX                                                                  ;8582B1;
    INX                                                                  ;8582B2;
    DEC.B $16                                                            ;8582B3;
    BNE .bottomBorderLoop                                                ;8582B5;
    RTS                                                                  ;8582B7;


Write_Message_Tilemap:
    JSR.W Wait_for_Lag_Frame                                             ;8582B8;
    JSL.L HandleMusicQueue                                               ;8582BB;
    JSL.L HandleSounds                                                   ;8582BF;
    REP #$30                                                             ;8582C3;
    LDA.W #$0070                                                         ;8582C5;
    STA.W $05A6                                                          ;8582C8;
    LDA.W #$007C                                                         ;8582CB;
    STA.W $05A4                                                          ;8582CE;
    STZ.W $05A2                                                          ;8582D1;
    LDX.W #$0000                                                         ;8582D4;
    LDA.W #$0000                                                         ;8582D7;

.zeroLoop:
    STA.L $7E3000,X                                                      ;8582DA;
    INX                                                                  ;8582DE;
    INX                                                                  ;8582DF;
    CPX.W #$00E0                                                         ;8582E0;
    BNE .zeroLoop                                                        ;8582E3;
    LDA.W $1C1F                                                          ;8582E5;
    DEC A                                                                ;8582E8;
    ASL A                                                                ;8582E9;
    STA.B $34                                                            ;8582EA;
    ASL A                                                                ;8582EC;
    CLC                                                                  ;8582ED;
    ADC.B $34                                                            ;8582EE;
    TAX                                                                  ;8582F0;
    LDA.W MessageDefinitionsPointers_messageTilemap,X                    ;8582F1;
    STA.B $00                                                            ;8582F4;
    LDA.W MessageDefinitionsPointers_nextEntryMessageTilemap,X           ;8582F6;
    SEC                                                                  ;8582F9;
    SBC.B $00                                                            ;8582FA;
    STA.B $09                                                            ;8582FC;
    LSR A                                                                ;8582FE;
    STA.B $16                                                            ;8582FF;
    LDA.B $09                                                            ;858301;
    CLC                                                                  ;858303;
    ADC.W #$0080                                                         ;858304;
    STA.B $09                                                            ;858307;
    LDX.W #$0040                                                         ;858309;
    LDY.W #$0000                                                         ;85830C;

.messageLoop:
    LDA.B ($00),Y                                                        ;85830F;
    STA.L $7E3200,X                                                      ;858311;
    INX                                                                  ;858315;
    INX                                                                  ;858316;
    INY                                                                  ;858317;
    INY                                                                  ;858318;
    DEC.B $16                                                            ;858319;
    BNE .messageLoop                                                     ;85831B;
    RTS                                                                  ;85831D;


Setup_PPU_for_Active_MessageBox:
    JSR.W Setup_MessageBox_BG3_Yscroll_HDMA                              ;85831E;
    JSR.W Wait_for_Lag_Frame                                             ;858321;
    REP #$20                                                             ;858324;
    LDA.W #$5800                                                         ;858326;
    CLC                                                                  ;858329;
    ADC.B $34                                                            ;85832A;
    STA.B $34                                                            ;85832C;
    STA.W $2116                                                          ;85832E;
    LDA.W #$1801                                                         ;858331;
    STA.W $4310                                                          ;858334;
    LDA.W #$3200                                                         ;858337;
    STA.W $4312                                                          ;85833A;
    LDA.W #$007E                                                         ;85833D;
    STA.W $4314                                                          ;858340;
    LDA.B $09                                                            ;858343;
    STA.W $4315                                                          ;858345;
    STZ.W $4317                                                          ;858348;
    STZ.W $4319                                                          ;85834B;
    SEP #$20                                                             ;85834E;
    LDA.B #$80                                                           ;858350;
    STA.W $2115                                                          ;858352;
    LDA.B #$02                                                           ;858355;
    STA.W HW_MDMAEN                                                      ;858357;
    JSL.L HandleMusicQueue                                               ;85835A;
    JSL.L HandleSounds                                                   ;85835E;
    RTS                                                                  ;858362;


Setup_MessageBox_BG3_Yscroll_HDMA:
    SEP #$20                                                             ;858363;
    LDA.B #$FF                                                           ;858365;
    STA.L $7E3380                                                        ;858367;
    LDA.B #$00                                                           ;85836B;
    STA.L $7E3381                                                        ;85836D;
    LDA.B #$30                                                           ;858371;
    STA.L $7E3382                                                        ;858373;
    LDA.B #$E1                                                           ;858377;
    STA.L $7E3383                                                        ;858379;
    LDA.B #$FE                                                           ;85837D;
    STA.L $7E3384                                                        ;85837F;
    LDA.B #$30                                                           ;858383;
    STA.L $7E3385                                                        ;858385;
    LDA.B #$00                                                           ;858389;
    STA.L $7E3386                                                        ;85838B;
    LDA.B #$42                                                           ;85838F;
    STA.W $4360                                                          ;858391;
    LDA.B #$12                                                           ;858394;
    STA.W $4361                                                          ;858396;
    LDA.B #$80                                                           ;858399;
    STA.W $4362                                                          ;85839B;
    STA.W $4365                                                          ;85839E;
    LDA.B #$33                                                           ;8583A1;
    STA.W $4363                                                          ;8583A3;
    STA.W $4366                                                          ;8583A6;
    LDA.B #$7E                                                           ;8583A9;
    STA.W $4364                                                          ;8583AB;
    STA.W $4367                                                          ;8583AE;
    STZ.W $4368                                                          ;8583B1;
    STZ.W $4369                                                          ;8583B4;
    STZ.W $436A                                                          ;8583B7;
    JSR.W Write_MessageBox_BG3_Yscroll_HDMA_DataTable                    ;8583BA;
    SEP #$20                                                             ;8583BD;
    LDA.B #$40                                                           ;8583BF;
    STA.W HW_HDMAEN                                                      ;8583C1;
    RTS                                                                  ;8583C4;


DrawShootButton_SetupPPUForLargeMessageBox:
    REP #$30                                                             ;8583C5;
    LDA.W $09B2                                                          ;8583C7;
    BRA DrawSpecialButton_SetupPPUForLargeMessageBox                     ;8583CA;


DrawRunButton_SetupPPUForLargeMessageBox:
    REP #$30                                                             ;8583CC;
    LDA.W $09B6                                                          ;8583CE;

DrawSpecialButton_SetupPPUForLargeMessageBox:
    LDY.W #$0000                                                         ;8583D1;
    BIT.W #$0080                                                         ;8583D4;
    BNE .found                                                           ;8583D7;
    LDY.W #$0002                                                         ;8583D9;
    BIT.W #$8000                                                         ;8583DC;
    BNE .found                                                           ;8583DF;
    LDY.W #$0004                                                         ;8583E1;
    BIT.W #$0040                                                         ;8583E4;
    BNE .found                                                           ;8583E7;
    LDY.W #$0006                                                         ;8583E9;
    BIT.W #$4000                                                         ;8583EC;
    BNE .found                                                           ;8583EF;
    LDY.W #$0008                                                         ;8583F1;
    BIT.W #$2000                                                         ;8583F4;
    BNE .found                                                           ;8583F7;
    LDY.W #$000A                                                         ;8583F9;
    BIT.W #$0020                                                         ;8583FC;
    BNE .found                                                           ;8583FF;
    LDY.W #$000C                                                         ;858401;
    BIT.W #$0010                                                         ;858404;
    BNE .found                                                           ;858407;
    LDY.W #$000E                                                         ;858409;

.found:
    LDA.W $1C1F                                                          ;85840C;
    DEC A                                                                ;85840F;
    ASL A                                                                ;858410;
    TAX                                                                  ;858411;
    LDA.W Special_Button_Tilemap_Offsets,X                               ;858412;
    TAX                                                                  ;858415;
    LDA.W .buttons,Y                                                     ;858416;
    STA.L $7E3200,X                                                      ;858419;
    LDA.W #$01A0                                                         ;85841D;
    STA.B $34                                                            ;858420;
    JSR.W Setup_PPU_for_Active_MessageBox                                ;858422;
    RTS                                                                  ;858425;


.buttons:
    dw $28E0,$3CE1,$2CF7,$38F8,$38D0,$38EB,$38F1,$284E                   ;858426;

Setup_PPU_for_Small_MessageBox:
    REP #$30                                                             ;858436;
    LDA.W #$01C0                                                         ;858438;
    STA.B $34                                                            ;85843B;
    JSR.W Setup_PPU_for_Active_MessageBox                                ;85843D;
    RTS                                                                  ;858440;


Setup_PPU_for_Large_MessageBox:
    REP #$30                                                             ;858441;
    LDA.W #$01A0                                                         ;858443;
    STA.B $34                                                            ;858446;
    JSR.W Setup_PPU_for_Active_MessageBox                                ;858448;
    RTS                                                                  ;85844B;


Open_MessageBox:
    REP #$30                                                             ;85844C;
    STZ.W $05A2                                                          ;85844E;

.loop:
    JSR.W Write_MessageBox_BG3_Yscroll_HDMA_DataTable                    ;858451;
    LDA.W $05A2                                                          ;858454;
    CLC                                                                  ;858457;
    ADC.W #$0200                                                         ;858458;
    STA.W $05A2                                                          ;85845B;
    CMP.W #$1800                                                         ;85845E;
    BMI .loop                                                            ;858461;
    LDA.W #$1800                                                         ;858463;
    STA.W $05A2                                                          ;858466;
    JSR.W Write_MessageBox_BG3_Yscroll_HDMA_DataTable                    ;858469;
    RTS                                                                  ;85846C;


Handle_MessageBox_Interaction:
    SEP #$20                                                             ;85846D;
    LDA.W $1C1F                                                          ;85846F;
    CMP.B #$17                                                           ;858472;
    BEQ .save                                                            ;858474;
    CMP.B #$1C                                                           ;858476;
    BEQ .save                                                            ;858478;
    LDX.W #$000A                                                         ;85847A;
    LDA.W $1C1F                                                          ;85847D;
    CMP.B #$14                                                           ;858480;
    BEQ .lagLoop                                                         ;858482;
    CMP.B #$15                                                           ;858484;
    BEQ .lagLoop                                                         ;858486;
    CMP.B #$16                                                           ;858488;
    BEQ .lagLoop                                                         ;85848A;
    CMP.B #$18                                                           ;85848C;
    BEQ .lagLoop                                                         ;85848E;
    LDX.W #$0168                                                         ;858490;

.lagLoop:
    JSR.W Wait_for_Lag_Frame                                             ;858493;
    PHX                                                                  ;858496;
    JSL.L HandleMusicQueue                                               ;858497;
    JSL.L HandleSounds                                                   ;85849B;
    PLX                                                                  ;85849F;
    DEX                                                                  ;8584A0;
    BNE .lagLoop                                                         ;8584A1;

.loopInput:
    LDA.W $4212                                                          ;8584A3;
    BIT.B #$01                                                           ;8584A6;
    BNE .loopInput                                                       ;8584A8;
    LDA.W $4218                                                          ;8584AA;
    BNE .busyReturn                                                      ;8584AD;
    LDA.W $4219                                                          ;8584AF;
    BEQ .loopInput                                                       ;8584B2;

.busyReturn:
    RTS                                                                  ;8584B4;


.save:
    REP #$30                                                             ;8584B5;
    STZ.W $05F9                                                          ;8584B7;

.saveInput:
    SEP #$30                                                             ;8584BA;
    LDX.B #$02                                                           ;8584BC;

.waitLoop:
    JSR.W Wait_for_Lag_Frame                                             ;8584BE;
    PHX                                                                  ;8584C1;
    JSL.L HandleMusicQueue                                               ;8584C2;
    JSL.L HandleSounds                                                   ;8584C6;
    PLX                                                                  ;8584CA;
    DEX                                                                  ;8584CB;
    BNE .waitLoop                                                        ;8584CC;
    JSL.L ReadControllerInput                                            ;8584CE;
    REP #$30                                                             ;8584D2;
    LDA.B $8F                                                            ;8584D4;
    BEQ .saveInput                                                       ;8584D6;
    BIT.W #$0080                                                         ;8584D8;
    BNE .inputA                                                          ;8584DB;
    BIT.W #$8000                                                         ;8584DD;
    BNE .inputB                                                          ;8584E0;
    BIT.W #$2300                                                         ;8584E2;
    BEQ .saveInput                                                       ;8584E5;
    JSR.W Toggle_Save_Confirmation_Selection                             ;8584E7;
    REP #$30                                                             ;8584EA;
    LDA.W #$0037                                                         ;8584EC;
    JSL.L QueueSound_Lib1_Max6                                           ;8584EF;
    REP #$30                                                             ;8584F3;
    BRA .saveInput                                                       ;8584F5;


.return:
    RTS                                                                  ;8584F7;


.inputA:
    LDA.W $05F9                                                          ;8584F8;
    BNE .return                                                          ;8584FB;
    BRA .return                                                          ;8584FD;


.inputB:
    LDA.W #$0002                                                         ;8584FF;
    STA.W $05F9                                                          ;858502;
    BRA .return                                                          ;858505;


Toggle_Save_Confirmation_Selection:
    LDA.W $05F9                                                          ;858507;
    EOR.W #$0002                                                         ;85850A;
    STA.W $05F9                                                          ;85850D;
    LDY.W #$0040                                                         ;858510;
    CMP.W #$0002                                                         ;858513;
    BNE +                                                                ;858516;
    LDY.W #$0080                                                         ;858518;

  + LDX.W #$0100                                                         ;85851B;
    LDA.W #$0020                                                         ;85851E;
    STA.B $34                                                            ;858521;

.loop:
    LDA.W UNUSED_MessageTilemaps_YES_859581,Y                            ;858523;
    STA.L $7E3200,X                                                      ;858526;
    INX                                                                  ;85852A;
    INX                                                                  ;85852B;
    INY                                                                  ;85852C;
    INY                                                                  ;85852D;
    DEC.B $34                                                            ;85852E;
    BNE .loop                                                            ;858530;
    JSR.W Wait_for_Lag_Frame                                             ;858532;
    REP #$20                                                             ;858535;
    LDA.W #$59A0                                                         ;858537;
    STA.B $34                                                            ;85853A;
    LDA.B $34                                                            ;85853C; >_<
    STA.W $2116                                                          ;85853E;
    LDA.W #$1801                                                         ;858541;
    STA.W $4310                                                          ;858544;
    LDA.W #$3200                                                         ;858547;
    STA.W $4312                                                          ;85854A;
    LDA.W #$007E                                                         ;85854D;
    STA.W $4314                                                          ;858550;
    LDA.W #$0180                                                         ;858553;
    STA.W $4315                                                          ;858556;
    STZ.W $4317                                                          ;858559;
    STZ.W $4319                                                          ;85855C;
    SEP #$20                                                             ;85855F;
    LDA.B #$80                                                           ;858561;
    STA.W $2115                                                          ;858563;
    LDA.B #$02                                                           ;858566;
    STA.W HW_MDMAEN                                                      ;858568;
    JSL.L HandleMusicQueue                                               ;85856B;
    JSL.L HandleSounds                                                   ;85856F;
    RTS                                                                  ;858573;


Play_2_Lag_Frames_of_Music_and_Sound_Effects:
    SEP #$30                                                             ;858574;
    LDX.B #$02                                                           ;858576;

.loop:
    JSR.W Wait_for_Lag_Frame                                             ;858578;
    PHX                                                                  ;85857B;
    JSL.L HandleMusicQueue                                               ;85857C;
    JSL.L HandleSounds                                                   ;858580;
    PLX                                                                  ;858584;
    DEX                                                                  ;858585;
    BNE .loop                                                            ;858586;
    RTS                                                                  ;858588;


Close_MessageBox:
    REP #$30                                                             ;858589;

.loop:
    JSR.W Write_MessageBox_BG3_Yscroll_HDMA_DataTable                    ;85858B;
    LDA.W $05A2                                                          ;85858E;
    SEC                                                                  ;858591;
    SBC.W #$0200                                                         ;858592;
    STA.W $05A2                                                          ;858595;
    BPL .loop                                                            ;858598;
    RTS                                                                  ;85859A;


Write_MessageBox_BG3_Yscroll_HDMA_DataTable:
    PHP                                                                  ;85859B;
    JSR.W Wait_for_Lag_Frame                                             ;85859C;
    REP #$30                                                             ;85859F;
    JSL.L HandleMusicQueue                                               ;8585A1;
    JSL.L HandleSounds                                                   ;8585A5;
    LDA.W #$7B00                                                         ;8585A9;
    SEC                                                                  ;8585AC;
    SBC.W $05A2                                                          ;8585AD;
    XBA                                                                  ;8585B0;
    AND.W #$00FF                                                         ;8585B1;
    STA.W $05A8                                                          ;8585B4;
    LDA.W #$0063                                                         ;8585B7;
    STA.W $05AA                                                          ;8585BA;
    LDA.W #$7C00                                                         ;8585BD;
    CLC                                                                  ;8585C0;
    ADC.W $05A2                                                          ;8585C1;
    XBA                                                                  ;8585C4;
    AND.W #$00FF                                                         ;8585C5;
    STA.W $05A4                                                          ;8585C8;
    LDA.W #$0094                                                         ;8585CB;
    STA.W $05A6                                                          ;8585CE;
    LDX.W #$00F6                                                         ;8585D1;
    LDY.W #$00F8                                                         ;8585D4;
    LDA.W #$001E                                                         ;8585D7;
    STA.B $14                                                            ;8585DA;

.loop:
    LDA.W $05AA                                                          ;8585DC;
    SEC                                                                  ;8585DF;
    SBC.W $05A8                                                          ;8585E0;
    STA.L $7E3000,X                                                      ;8585E3;
    DEC.W $05AA                                                          ;8585E7;
    DEC.W $05A8                                                          ;8585EA;
    DEX                                                                  ;8585ED;
    DEX                                                                  ;8585EE;
    PHX                                                                  ;8585EF;
    TYX                                                                  ;8585F0;
    LDA.W $05A6                                                          ;8585F1;
    SEC                                                                  ;8585F4;
    SBC.W $05A4                                                          ;8585F5;
    STA.L $7E3000,X                                                      ;8585F8;
    PLX                                                                  ;8585FC;
    INC.W $05A6                                                          ;8585FD;
    INC.W $05A4                                                          ;858600;
    INY                                                                  ;858603;
    INY                                                                  ;858604;
    DEC.B $14                                                            ;858605;
    BNE .loop                                                            ;858607;
    TYX                                                                  ;858609;
    LDA.W #$0000                                                         ;85860A;

.zeroLoop:
    STA.L $7E3000,X                                                      ;85860D;
    INX                                                                  ;858611;
    INX                                                                  ;858612;
    CPX.W #$01E0                                                         ;858613;
    BMI .zeroLoop                                                        ;858616;
    PLP                                                                  ;858618;
    RTS                                                                  ;858619;


Restore_PPU:
    REP #$20                                                             ;85861A;
    JSR.W Wait_for_Lag_Frame                                             ;85861C;
    REP #$20                                                             ;85861F;
    LDA.W #$5880                                                         ;858621;
    STA.W $2116                                                          ;858624;
    LDA.W #$1801                                                         ;858627;
    STA.W $4310                                                          ;85862A;
    LDA.W #$4100                                                         ;85862D;
    STA.W $4312                                                          ;858630;
    LDA.W #$007E                                                         ;858633;
    STA.W $4314                                                          ;858636;
    LDA.W #$0700                                                         ;858639;
    STA.W $4315                                                          ;85863C;
    STZ.W $4317                                                          ;85863F;
    STZ.W $4319                                                          ;858642;
    SEP #$20                                                             ;858645;
    LDA.B #$80                                                           ;858647;
    STA.W $2115                                                          ;858649;
    LDA.B #$02                                                           ;85864C;
    STA.W HW_MDMAEN                                                      ;85864E;
    JSR.W Wait_for_Lag_Frame                                             ;858651;
    SEP #$20                                                             ;858654;
    LDA.L $7E33EA                                                        ;858656;
    STA.B $85                                                            ;85865A;
    STA.W HW_HDMAEN                                                      ;85865C;
    LDA.L $7E33EB                                                        ;85865F;
    STA.B $5B                                                            ;858663;
    LDA.B $69                                                            ;858665;
    STA.B $6A                                                            ;858667;
    LDA.B $6E                                                            ;858669;
    STA.B $70                                                            ;85866B;
    LDA.B $71                                                            ;85866D;
    STA.B $73                                                            ;85866F;
    LDA.B #$19                                                           ;858671;
    STA.W $2121                                                          ;858673;
    LDA.L $7EC032                                                        ;858676;
    STA.W $2122                                                          ;85867A;
    LDA.L $7EC033                                                        ;85867D;
    STA.W $2122                                                          ;858681;
    LDA.L $7EC034                                                        ;858684;
    STA.W $2122                                                          ;858688;
    LDA.L $7EC035                                                        ;85868B;
    STA.W $2122                                                          ;85868F;
    JSL.L HDMAObjectHandler_HandleMusicQueue                             ;858692;
    JSL.L HandleSounds                                                   ;858696;
    RTS                                                                  ;85869A;


MessageDefinitionsPointers_modifyMessageBox:
    dw Setup_PPU_for_Small_MessageBox                                    ;85869B;

MessageDefinitionsPointers_drawInitialMessageBox:
    dw Write_Small_MessageBox_Tilemap                                    ;85869D;

MessageDefinitionsPointers_messageTilemap:
    dw MessageTilemaps_energyTank                                        ;85869F;
    dw DrawShootButton_SetupPPUForLargeMessageBox                        ;8586A1;
    dw Write_Large_MessageBox_Tilemap                                    ;8586A3;

MessageDefinitionsPointers_nextEntryMessageTilemap:
    dw MessageTilemaps_missile                                           ;8586A5;
    dw DrawShootButton_SetupPPUForLargeMessageBox                        ;8586A7;
    dw Write_Large_MessageBox_Tilemap                                    ;8586A9;
    dw MessageTilemaps_superMissile                                      ;8586AB;
    dw DrawShootButton_SetupPPUForLargeMessageBox                        ;8586AD;
    dw Write_Large_MessageBox_Tilemap                                    ;8586AF;
    dw MessageTilemaps_powerBomb                                         ;8586B1;
    dw DrawShootButton_SetupPPUForLargeMessageBox                        ;8586B3;
    dw Write_Large_MessageBox_Tilemap                                    ;8586B5;
    dw MessageTilemaps_grapplingBeam                                     ;8586B7;
    dw DrawRunButton_SetupPPUForLargeMessageBox                          ;8586B9;
    dw Write_Large_MessageBox_Tilemap                                    ;8586BB;
    dw MessageTilemaps_xrayScope                                         ;8586BD;
    dw Setup_PPU_for_Small_MessageBox                                    ;8586BF;
    dw Write_Small_MessageBox_Tilemap                                    ;8586C1;
    dw MessageTilemaps_variaSuit                                         ;8586C3;
    dw Setup_PPU_for_Small_MessageBox                                    ;8586C5;
    dw Write_Small_MessageBox_Tilemap                                    ;8586C7;
    dw MessageTilemaps_springBall                                        ;8586C9;
    dw Setup_PPU_for_Small_MessageBox                                    ;8586CB;
    dw Write_Small_MessageBox_Tilemap                                    ;8586CD;
    dw MessageTilemaps_morphingBall                                      ;8586CF;
    dw Setup_PPU_for_Small_MessageBox                                    ;8586D1;
    dw Write_Small_MessageBox_Tilemap                                    ;8586D3;
    dw MessageTilemaps_screwAttack                                       ;8586D5;
    dw Setup_PPU_for_Small_MessageBox                                    ;8586D7;
    dw Write_Small_MessageBox_Tilemap                                    ;8586D9;
    dw MessageTilemaps_hiJumpBoots                                       ;8586DB;
    dw Setup_PPU_for_Small_MessageBox                                    ;8586DD;
    dw Write_Small_MessageBox_Tilemap                                    ;8586DF;
    dw MessageTilemaps_spaceJump                                         ;8586E1;
    dw DrawRunButton_SetupPPUForLargeMessageBox                          ;8586E3;
    dw Write_Large_MessageBox_Tilemap                                    ;8586E5;
    dw MessageTilemaps_speedBooster                                      ;8586E7;
    dw Setup_PPU_for_Small_MessageBox                                    ;8586E9;
    dw Write_Small_MessageBox_Tilemap                                    ;8586EB;
    dw MessageTilemaps_chargeBeam                                        ;8586ED;
    dw Setup_PPU_for_Small_MessageBox                                    ;8586EF;
    dw Write_Small_MessageBox_Tilemap                                    ;8586F1;
    dw MessageTilemaps_iceBeam                                           ;8586F3;
    dw Setup_PPU_for_Small_MessageBox                                    ;8586F5;
    dw Write_Small_MessageBox_Tilemap                                    ;8586F7;
    dw MessageTilemaps_waveBeam                                          ;8586F9;
    dw Setup_PPU_for_Small_MessageBox                                    ;8586FB;
    dw Write_Small_MessageBox_Tilemap                                    ;8586FD;
    dw MessageTilemaps_spazer                                            ;8586FF;
    dw Setup_PPU_for_Small_MessageBox                                    ;858701;
    dw Write_Small_MessageBox_Tilemap                                    ;858703;
    dw MessageTilemaps_plasmaBeam                                        ;858705;
    dw DrawShootButton_SetupPPUForLargeMessageBox                        ;858707;
    dw Write_Large_MessageBox_Tilemap                                    ;858709;
    dw MessageTilemaps_bomb                                              ;85870B;
    dw Setup_PPU_for_Small_MessageBox                                    ;85870D;
    dw Write_Small_MessageBox_Tilemap                                    ;85870F;
    dw MessageTilemaps_map                                               ;858711;
    dw Setup_PPU_for_Small_MessageBox                                    ;858713;
    dw Write_Small_MessageBox_Tilemap                                    ;858715;
    dw MessageTilemaps_energyRecharge                                    ;858717;
    dw Setup_PPU_for_Small_MessageBox                                    ;858719;
    dw Write_Small_MessageBox_Tilemap                                    ;85871B;
    dw MessageTilemaps_missileReload                                     ;85871D;
    dw Setup_PPU_for_Large_MessageBox                                    ;85871F;
    dw Write_Small_MessageBox_Tilemap                                    ;858721;
    dw MessageTilemaps_save                                              ;858723;
    dw Setup_PPU_for_Small_MessageBox                                    ;858725;
    dw Write_Small_MessageBox_Tilemap                                    ;858727;
    dw MessageTilemaps_saveCompleted                                     ;858729;
    dw Setup_PPU_for_Small_MessageBox                                    ;85872B;
    dw Write_Small_MessageBox_Tilemap                                    ;85872D;
    dw MessageTilemaps_reserveTank                                       ;85872F;
    dw Setup_PPU_for_Small_MessageBox                                    ;858731;
    dw Write_Small_MessageBox_Tilemap                                    ;858733;
    dw MessageTilemaps_gravitySuit                                       ;858735;
    dw Setup_PPU_for_Small_MessageBox                                    ;858737;
    dw Write_Small_MessageBox_Tilemap                                    ;858739;
    dw MessageTilemaps_Terminator                                        ;85873B;
    dw Setup_PPU_for_Large_MessageBox                                    ;85873D;
    dw Write_Small_MessageBox_Tilemap                                    ;85873F;
    dw MessageTilemaps_save                                              ;858741;
    dw Setup_PPU_for_Small_MessageBox                                    ;858743;
    dw Write_Small_MessageBox_Tilemap                                    ;858745;
    dw MessageTilemaps_saveCompleted                                     ;858747;

Special_Button_Tilemap_Offsets:
    dw $0000,$012A,$012A,$012C,$012C,$012C,$0000,$0000                   ;858749;
    dw $0000,$0000,$0000,$0000,$0120,$0000,$0000,$0000                   ;858759;
    dw $0000,$0000,$012A,$0000,$0000,$0000,$0000,$0000                   ;858769;
    dw $0000,$0000,$0000                                                 ;858779;

MessageTilemaps_energyTank:
    dw $000E,$000E,$000E,$000E,$000E,$000E,$284E,$284E                   ;85877F;
    dw $284E,$284E,$28E4,$28ED,$28E4,$28F1,$28E6,$28F8                   ;85878F;
    dw $284E,$28F3,$28E0,$28ED,$28EA,$284E,$284E,$284E                   ;85879F;
    dw $284E,$000E,$000E,$000E,$000E,$000E,$000E,$000E                   ;8587AF;

MessageTilemaps_missile:
    dw $000E,$000E,$000E,$284E,$284E,$284E,$284E,$284E                   ;8587BF;
    dw $284E,$284E,$284E,$284E,$284E,$28EC,$28E8,$28F2                   ;8587CF;
    dw $28F2,$28E8,$28EB,$28E4,$284E,$284E,$284E,$284E                   ;8587DF;
    dw $284E,$284E,$284E,$284E,$284E,$000E,$000E,$000E                   ;8587EF;
    dw $000E,$000E,$000E,$284E,$284E,$284E,$284E,$284E                   ;8587FF;
    dw $284E,$284E,$284E,$284E,$284E,$284E,$284E,$284E                   ;85880F;
    dw $284E,$284E,$284E,$284E,$284E,$284E,$284E,$284E                   ;85881F;
    dw $284E,$284E,$284E,$284E,$284E,$000E,$000E,$000E                   ;85882F;
    dw $000E,$000E,$000E,$284E,$284E,$284E,$284E,$284E                   ;85883F;
    dw $284E,$304B,$3049,$704B,$284E,$284E,$284E,$284E                   ;85884F;
    dw $284E,$284E,$284E,$284E,$284E,$284E,$284E,$284E                   ;85885F;
    dw $284E,$284E,$284E,$284E,$284E,$000E,$000E,$000E                   ;85886F;
    dw $000E,$000E,$000E,$284E,$284E,$28B9,$28BA,$28BB                   ;85887F;
    dw $284E,$304C,$304A,$704C,$284E,$28C8,$284E,$28B0                   ;85888F;
    dw $28B1,$28B2,$28C0,$28C1,$28D1,$28E0,$28D3,$28B5                   ;85889F;
    dw $28B6,$28B7,$28CB,$284E,$284E,$000E,$000E,$000E                   ;8588AF;

MessageTilemaps_superMissile:
    dw $000E,$000E,$000E,$284E,$284E,$284E,$284E,$284E                   ;8588BF;
    dw $284E,$28F2,$28F4,$28EF,$28E4,$28F1,$284E,$28EC                   ;8588CF;
    dw $28E8,$28F2,$28F2,$28E8,$28EB,$28E4,$284E,$284E                   ;8588DF;
    dw $284E,$284E,$284E,$284E,$284E,$000E,$000E,$000E                   ;8588EF;
    dw $000E,$000E,$000E,$284E,$284E,$284E,$284E,$284E                   ;8588FF;
    dw $284E,$284E,$284E,$284E,$284E,$284E,$284E,$284E                   ;85890F;
    dw $284E,$284E,$284E,$284E,$284E,$284E,$284E,$284E                   ;85891F;
    dw $284E,$284E,$284E,$284E,$284E,$000E,$000E,$000E                   ;85892F;
    dw $000E,$000E,$000E,$284E,$284E,$284E,$284E,$284E                   ;85893F;
    dw $284E,$284E,$3034,$7034,$284E,$284E,$284E,$284E                   ;85894F;
    dw $284E,$284E,$284E,$284E,$284E,$284E,$284E,$284E                   ;85895F;
    dw $284E,$284E,$284E,$284E,$284E,$000E,$000E,$000E                   ;85896F;
    dw $000E,$000E,$000E,$284E,$284E,$284E,$28B9,$28BA                   ;85897F;
    dw $28BB,$284E,$3035,$7035,$284E,$28C8,$284E,$28B0                   ;85898F;
    dw $28B1,$28B2,$28C0,$28C1,$28D1,$3CE1,$28D3,$28B5                   ;85899F;
    dw $28B6,$28B7,$28CB,$284E,$284E,$000E,$000E,$000E                   ;8589AF;

MessageTilemaps_powerBomb:
    dw $000E,$000E,$000E,$284E,$284E,$284E,$284E,$284E                   ;8589BF;
    dw $284E,$284E,$284E,$28EF,$28EE,$28F6,$28E4,$28F1                   ;8589CF;
    dw $284E,$28E1,$28EE,$28EC,$28E1,$284E,$284E,$284E                   ;8589DF;
    dw $284E,$284E,$284E,$284E,$284E,$000E,$000E,$000E                   ;8589EF;
    dw $000E,$000E,$000E,$284E,$284E,$284E,$284E,$284E                   ;8589FF;
    dw $284E,$284E,$284E,$284E,$284E,$284E,$284E,$284E                   ;858A0F;
    dw $284E,$284E,$284E,$284E,$284E,$284E,$284E,$284E                   ;858A1F;
    dw $284E,$284E,$284E,$284E,$284E,$000E,$000E,$000E                   ;858A2F;
    dw $000E,$000E,$000E,$284E,$284E,$284E,$284E,$284E                   ;858A3F;
    dw $3036,$7036,$284E,$284E,$284E,$284E,$284E,$284E                   ;858A4F;
    dw $284E,$284E,$284E,$284E,$284E,$284E,$284E,$284E                   ;858A5F;
    dw $284E,$284E,$284E,$284E,$284E,$000E,$000E,$000E                   ;858A6F;
    dw $000E,$000E,$000E,$284E,$28B9,$28BA,$28BB,$284E                   ;858A7F;
    dw $3037,$7037,$284E,$28C8,$284E,$28C5,$28C6,$28C7                   ;858A8F;
    dw $284E,$28BE,$28BF,$28C0,$28C1,$28D1,$38F1,$28D3                   ;858A9F;
    dw $28B5,$28B6,$28B7,$28CB,$284E,$000E,$000E,$000E                   ;858AAF;

MessageTilemaps_grapplingBeam:
    dw $000E,$000E,$000E,$284E,$284E,$284E,$284E,$284E                   ;858ABF;
    dw $284E,$28E6,$28F1,$28E0,$28EF,$28EF,$28EB,$28E8                   ;858ACF;
    dw $28ED,$28E6,$284E,$28E1,$28E4,$28E0,$28EC,$284E                   ;858ADF;
    dw $284E,$284E,$284E,$284E,$284E,$000E,$000E,$000E                   ;858AEF;
    dw $000E,$000E,$000E,$284E,$284E,$284E,$284E,$284E                   ;858AFF;
    dw $284E,$284E,$284E,$284E,$284E,$284E,$284E,$284E                   ;858B0F;
    dw $284E,$284E,$284E,$284E,$284E,$284E,$284E,$284E                   ;858B1F;
    dw $284E,$284E,$284E,$284E,$284E,$000E,$000E,$000E                   ;858B2F;
    dw $000E,$000E,$000E,$284E,$284E,$284E,$284E,$284E                   ;858B3F;
    dw $3038,$7038,$284E,$284E,$284E,$284E,$284E,$284E                   ;858B4F;
    dw $284E,$284E,$284E,$284E,$284E,$284E,$284E,$284E                   ;858B5F;
    dw $284E,$284E,$284E,$284E,$284E,$000E,$000E,$000E                   ;858B6F;
    dw $000E,$000E,$000E,$284E,$28B9,$28BA,$28BB,$284E                   ;858B7F;
    dw $3039,$7039,$284E,$28B0,$28B1,$28B2,$284E,$28C8                   ;858B8F;
    dw $284E,$28B3,$28B4,$28C0,$28C1,$28D1,$38F8,$28D3                   ;858B9F;
    dw $28B5,$28B6,$28B7,$28CB,$284E,$000E,$000E,$000E                   ;858BAF;

MessageTilemaps_xrayScope:
    dw $000E,$000E,$000E,$284E,$284E,$284E,$284E,$284E                   ;858BBF;
    dw $284E,$284E,$284E,$28F7,$28CF,$28F1,$28E0,$28F8                   ;858BCF;
    dw $284E,$28F2,$28E2,$28EE,$28EF,$28E4,$284E,$284E                   ;858BDF;
    dw $284E,$284E,$284E,$284E,$284E,$000E,$000E,$000E                   ;858BEF;
    dw $000E,$000E,$000E,$284E,$284E,$284E,$284E,$284E                   ;858BFF;
    dw $284E,$284E,$284E,$284E,$284E,$284E,$284E,$284E                   ;858C0F;
    dw $284E,$284E,$284E,$284E,$284E,$284E,$284E,$284E                   ;858C1F;
    dw $284E,$284E,$284E,$284E,$284E,$000E,$000E,$000E                   ;858C2F;
    dw $000E,$000E,$000E,$284E,$284E,$284E,$284E,$284E                   ;858C3F;
    dw $303A,$703A,$284E,$284E,$284E,$284E,$284E,$284E                   ;858C4F;
    dw $284E,$284E,$284E,$284E,$284E,$284E,$284E,$284E                   ;858C5F;
    dw $284E,$284E,$284E,$284E,$284E,$000E,$000E,$000E                   ;858C6F;
    dw $000E,$000E,$000E,$284E,$28B9,$28BA,$28BB,$284E                   ;858C7F;
    dw $303B,$703B,$284E,$28B0,$28B1,$28B2,$284E,$28C8                   ;858C8F;
    dw $284E,$28B3,$28B4,$28C0,$28C1,$28D1,$2CF7,$28D3                   ;858C9F;
    dw $28B5,$28B6,$28B7,$28CB,$284E,$000E,$000E,$000E                   ;858CAF;

MessageTilemaps_variaSuit:
    dw $000E,$000E,$000E,$000E,$000E,$000E,$284E,$284E                   ;858CBF;
    dw $284E,$284E,$28F5,$28E0,$28F1,$28E8,$28E0,$284E                   ;858CCF;
    dw $28F2,$28F4,$28E8,$28F3,$284E,$284E,$284E,$284E                   ;858CDF;
    dw $284E,$000E,$000E,$000E,$000E,$000E,$000E,$000E                   ;858CEF;

MessageTilemaps_springBall:
    dw $000E,$000E,$000E,$000E,$000E,$000E,$284E,$284E                   ;858CFF;
    dw $284E,$284E,$28F2,$28EF,$28F1,$28E8,$28ED,$28E6                   ;858D0F;
    dw $284E,$28E1,$28E0,$28EB,$28EB,$284E,$284E,$284E                   ;858D1F;
    dw $284E,$000E,$000E,$000E,$000E,$000E,$000E,$000E                   ;858D2F;

MessageTilemaps_morphingBall:
    dw $000E,$000E,$000E,$000E,$000E,$000E,$284E,$284E                   ;858D3F;
    dw $284E,$28EC,$28EE,$28F1,$28EF,$28E7,$28E8,$28ED                   ;858D4F;
    dw $28E6,$284E,$28E1,$28E0,$28EB,$28EB,$284E,$284E                   ;858D5F;
    dw $284E,$000E,$000E,$000E,$000E,$000E,$000E,$000E                   ;858D6F;

MessageTilemaps_screwAttack:
    dw $000E,$000E,$000E,$000E,$000E,$000E,$284E,$284E                   ;858D7F;
    dw $284E,$28F2,$28E2,$28F1,$28E4,$28F6,$284E,$28E0                   ;858D8F;
    dw $28F3,$28F3,$28E0,$28E2,$28EA,$284E,$284E,$284E                   ;858D9F;
    dw $284E,$000E,$000E,$000E,$000E,$000E,$000E,$000E                   ;858DAF;

MessageTilemaps_hiJumpBoots:
    dw $000E,$000E,$000E,$000E,$000E,$000E,$284E,$284E                   ;858DBF;
    dw $284E,$28E7,$28E8,$28CF,$28E9,$28F4,$28EC,$28EF                   ;858DCF;
    dw $284E,$28E1,$28EE,$28EE,$28F3,$28F2,$284E,$284E                   ;858DDF;
    dw $284E,$000E,$000E,$000E,$000E,$000E,$000E,$000E                   ;858DEF;

MessageTilemaps_spaceJump:
    dw $000E,$000E,$000E,$000E,$000E,$000E,$284E,$284E                   ;858DFF;
    dw $284E,$284E,$28F2,$28EF,$28E0,$28E2,$28E4,$284E                   ;858E0F;
    dw $28E9,$28F4,$28EC,$28EF,$284E,$284E,$284E,$284E                   ;858E1F;
    dw $284E,$000E,$000E,$000E,$000E,$000E,$000E,$000E                   ;858E2F;

MessageTilemaps_speedBooster:
    dw $000E,$000E,$000E,$284E,$284E,$284E,$284E,$284E                   ;858E3F;
    dw $284E,$28F2,$28EF,$28E4,$28E4,$28E3,$284E,$28E1                   ;858E4F;
    dw $28EE,$28EE,$28F2,$28F3,$28E4,$28F1,$284E,$284E                   ;858E5F;
    dw $284E,$284E,$284E,$284E,$284E,$000E,$000E,$000E                   ;858E6F;
    dw $000E,$000E,$000E,$284E,$284E,$284E,$284E,$284E                   ;858E7F;
    dw $284E,$284E,$284E,$284E,$284E,$284E,$284E,$284E                   ;858E8F;
    dw $284E,$284E,$284E,$284E,$284E,$284E,$284E,$284E                   ;858E9F;
    dw $284E,$284E,$284E,$284E,$284E,$000E,$000E,$000E                   ;858EAF;
    dw $000E,$000E,$000E,$284E,$284E,$284E,$284E,$284E                   ;858EBF;
    dw $284E,$284E,$284E,$284E,$284E,$284E,$284E,$284E                   ;858ECF;
    dw $284E,$284E,$284E,$284E,$284E,$284E,$284E,$284E                   ;858EDF;
    dw $284E,$284E,$284E,$284E,$284E,$000E,$000E,$000E                   ;858EEF;
    dw $000E,$000E,$000E,$284E,$284E,$28B0,$28B1,$28B2                   ;858EFF;
    dw $284E,$28C8,$284E,$28B3,$28B4,$28C0,$28C1,$28D1                   ;858F0F;
    dw $38D0,$28D3,$28B5,$28B6,$28B7,$284E,$28C2,$284E                   ;858F1F;
    dw $28BC,$28BD,$28CB,$284E,$284E,$000E,$000E,$000E                   ;858F2F;

MessageTilemaps_chargeBeam:
    dw $000E,$000E,$000E,$000E,$000E,$000E,$284E,$284E                   ;858F3F;
    dw $284E,$284E,$28E2,$28E7,$28E0,$28F1,$28E6,$28E4                   ;858F4F;
    dw $284E,$28E1,$28E4,$28E0,$28EC,$284E,$284E,$284E                   ;858F5F;
    dw $284E,$000E,$000E,$000E,$000E,$000E,$000E,$000E                   ;858F6F;

MessageTilemaps_iceBeam:
    dw $000E,$000E,$000E,$000E,$000E,$000E,$284E,$284E                   ;858F7F;
    dw $284E,$284E,$284E,$28E8,$28E2,$28E4,$284E,$28E1                   ;858F8F;
    dw $28E4,$28E0,$28EC,$284E,$284E,$284E,$284E,$284E                   ;858F9F;
    dw $284E,$000E,$000E,$000E,$000E,$000E,$000E,$000E                   ;858FAF;

MessageTilemaps_waveBeam:
    dw $000E,$000E,$000E,$000E,$000E,$000E,$284E,$284E                   ;858FBF;
    dw $284E,$284E,$284E,$28F6,$28E0,$28F5,$28E4,$284E                   ;858FCF;
    dw $28E1,$28E4,$28E0,$28EC,$284E,$284E,$284E,$284E                   ;858FDF;
    dw $284E,$000E,$000E,$000E,$000E,$000E,$000E,$000E                   ;858FEF;

MessageTilemaps_spazer:
    dw $000E,$000E,$000E,$000E,$000E,$000E,$284E,$284E                   ;858FFF;
    dw $284E,$284E,$284E,$284E,$28F2,$28EF,$28E0,$28F9                   ;85900F;
    dw $28E4,$28F1,$284E,$284E,$284E,$284E,$284E,$284E                   ;85901F;
    dw $284E,$000E,$000E,$000E,$000E,$000E,$000E,$000E                   ;85902F;

MessageTilemaps_plasmaBeam:
    dw $000E,$000E,$000E,$000E,$000E,$000E,$284E,$284E                   ;85903F;
    dw $284E,$284E,$28EF,$28EB,$28E0,$28F2,$28EC,$28E0                   ;85904F;
    dw $284E,$28E1,$28E4,$28E0,$28EC,$284E,$284E,$284E                   ;85905F;
    dw $284E,$000E,$000E,$000E,$000E,$000E,$000E,$000E                   ;85906F;

MessageTilemaps_bomb:
    dw $000E,$000E,$000E,$284E,$284E,$284E,$284E,$284E                   ;85907F;
    dw $284E,$284E,$284E,$284E,$284E,$284E,$28E1,$28EE                   ;85908F;
    dw $28EC,$28E1,$284E,$284E,$284E,$284E,$284E,$284E                   ;85909F;
    dw $284E,$284E,$284E,$284E,$284E,$000E,$000E,$000E                   ;8590AF;
    dw $000E,$000E,$000E,$284E,$284E,$38DC,$284E,$284E                   ;8590BF;
    dw $284E,$284E,$284E,$284E,$284E,$284E,$284E,$284E                   ;8590CF;
    dw $284E,$284E,$284E,$284E,$284E,$284E,$284E,$284E                   ;8590DF;
    dw $284E,$284E,$284E,$284E,$284E,$000E,$000E,$000E                   ;8590EF;
    dw $000E,$000E,$000E,$284E,$284E,$3CDD,$3CDF,$284E                   ;8590FF;
    dw $284E,$284E,$284E,$284E,$284E,$284E,$284E,$284E                   ;85910F;
    dw $284E,$284E,$284E,$284E,$284E,$284E,$284E,$284E                   ;85911F;
    dw $284E,$284E,$284E,$284E,$284E,$000E,$000E,$000E                   ;85912F;
    dw $000E,$000E,$000E,$284E,$284E,$3CDE,$3CCC,$38CD                   ;85913F;
    dw $3CC9,$284E,$28C8,$284E,$28C5,$28C6,$28C7,$284E                   ;85914F;
    dw $28BE,$28BF,$28C0,$28C1,$28D1,$38EB,$28D3,$28B5                   ;85915F;
    dw $28B6,$28B7,$28CB,$284E,$284E,$000E,$000E,$000E                   ;85916F;

MessageTilemaps_map:
    dw $000E,$000E,$000E,$000E,$000E,$000E,$3C4E,$3C4E                   ;85917F;
    dw $3CEC,$3CE0,$3CEF,$3C4E,$3CE3,$3CE0,$3CF3,$3CE0                   ;85918F;
    dw $3C4E,$3CE0,$3CE2,$3CE2,$3CE4,$3CF2,$3CF2,$3C4E                   ;85919F;
    dw $3C4E,$000E,$000E,$000E,$000E,$000E,$000E,$000E                   ;8591AF;
    dw $000E,$000E,$000E,$000E,$000E,$000E,$3C4E,$3C4E                   ;8591BF;
    dw $3C4E,$3C4E,$3C4E,$3C4E,$3C4E,$3C4E,$3C4E,$3C4E                   ;8591CF;
    dw $3C4E,$3C4E,$3C4E,$3C4E,$3C4E,$3C4E,$3C4E,$3C4E                   ;8591DF;
    dw $3C4E,$000E,$000E,$000E,$000E,$000E,$000E,$000E                   ;8591EF;
    dw $000E,$000E,$000E,$000E,$000E,$000E,$3C4E,$3C4E                   ;8591FF;
    dw $3C4E,$3C4E,$3CE2,$3CEE,$3CEC,$3CEF,$3CEB,$3CE4                   ;85920F;
    dw $3CF3,$3CE4,$3CE3,$3CFA,$3C4E,$3C4E,$3C4E,$3C4E                   ;85921F;
    dw $3C4E,$000E,$000E,$000E,$000E,$000E,$000E,$000E                   ;85922F;

MessageTilemaps_energyRecharge:
    dw $000E,$000E,$000E,$000E,$000E,$000E,$3C4E,$3C4E                   ;85923F;
    dw $3CE4,$3CED,$3CE4,$3CF1,$3CE6,$3CF8,$3C4E,$3CF1                   ;85924F;
    dw $3CE4,$3CE2,$3CE7,$3CE0,$3CF1,$3CE6,$3CE4,$3C4E                   ;85925F;
    dw $3C4E,$000E,$000E,$000E,$000E,$000E,$000E,$000E                   ;85926F;
    dw $000E,$000E,$000E,$000E,$000E,$000E,$3C4E,$3C4E                   ;85927F;
    dw $3C4E,$3C4E,$3C4E,$3C4E,$3C4E,$3C4E,$3C4E,$3C4E                   ;85928F;
    dw $3C4E,$3C4E,$3C4E,$3C4E,$3C4E,$3C4E,$3C4E,$3C4E                   ;85929F;
    dw $3C4E,$000E,$000E,$000E,$000E,$000E,$000E,$000E                   ;8592AF;
    dw $000E,$000E,$000E,$000E,$000E,$000E,$3C4E,$3C4E                   ;8592BF;
    dw $3C4E,$3C4E,$3CE2,$3CEE,$3CEC,$3CEF,$3CEB,$3CE4                   ;8592CF;
    dw $3CF3,$3CE4,$3CE3,$3CFA,$3C4E,$3C4E,$3C4E,$3C4E                   ;8592DF;
    dw $3C4E,$000E,$000E,$000E,$000E,$000E,$000E,$000E                   ;8592EF;

MessageTilemaps_missileReload:
    dw $000E,$000E,$000E,$000E,$000E,$000E,$3C4E,$3C4E                   ;8592FF;
    dw $3CEC,$3CE8,$3CF2,$3CF2,$3CE8,$3CEB,$3CE4,$3C4E                   ;85930F;
    dw $3CF1,$3CE4,$3CEB,$3CEE,$3CE0,$3CE3,$3C4E,$3C4E                   ;85931F;
    dw $3C4E,$000E,$000E,$000E,$000E,$000E,$000E,$000E                   ;85932F;
    dw $000E,$000E,$000E,$000E,$000E,$000E,$3C4E,$3C4E                   ;85933F;
    dw $384E,$384E,$384E,$384E,$384E,$384E,$384E,$384E                   ;85934F;
    dw $384E,$384E,$384E,$384E,$384E,$384E,$3C4E,$3C4E                   ;85935F;
    dw $3C4E,$000E,$000E,$000E,$000E,$000E,$000E,$000E                   ;85936F;
    dw $000E,$000E,$000E,$000E,$000E,$000E,$3C4E,$3C4E                   ;85937F;
    dw $384E,$384E,$3CE2,$3CEE,$3CEC,$3CEF,$3CEB,$3CE4                   ;85938F;
    dw $3CF3,$3CE4,$3CE3,$3CFA,$384E,$384E,$3C4E,$3C4E                   ;85939F;
    dw $3C4E,$000E,$000E,$000E,$000E,$000E,$000E,$000E                   ;8593AF;

MessageTilemaps_save:
    dw $000E,$000E,$000E,$000E,$000E,$000E,$3C4E,$3C4E                   ;8593BF;
    dw $3CF6,$3CEE,$3CF4,$3CEB,$3CE3,$3C4E,$3CF8,$3CEE                   ;8593CF;
    dw $3CF4,$3C4E,$3CEB,$3CE8,$3CEA,$3CE4,$3C4E,$3C4E                   ;8593DF;
    dw $3C4E,$000E,$000E,$000E,$000E,$000E,$000E,$000E                   ;8593EF;
    dw $000E,$000E,$000E,$000E,$000E,$000E,$3C4E,$3C4E                   ;8593FF;
    dw $3CF3,$3CEE,$3C4E,$3CF2,$3CE0,$3CF5,$3CE4,$3CFE                   ;85940F;
    dw $3C4E,$3C4E,$3C4E,$3C4E,$3C4E,$3C4E,$3C4E,$3C4E                   ;85941F;
    dw $3C4E,$000E,$000E,$000E,$000E,$000E,$000E,$000E                   ;85942F;
    dw $000E,$000E,$000E,$000E,$000E,$000E,$3C4E,$3C4E                   ;85943F;
    dw $3C4E,$3C4E,$3C4E,$3C4E,$3C4E,$3C4E,$3C4E,$3C4E                   ;85944F;
    dw $3C4E,$3C4E,$3C4E,$3C4E,$3C4E,$3C4E,$3C4E,$3C4E                   ;85945F;
    dw $3C4E,$000E,$000E,$000E,$000E,$000E,$000E,$000E                   ;85946F;
    dw $000E,$000E,$000E,$000E,$000E,$000E,$3C4E,$3C4E                   ;85947F;
    dw $38CC,$38CD,$3CF8,$3CE4,$3CF2,$3C4E,$3C4E,$3C4E                   ;85948F;
    dw $3C4E,$3C4E,$3C4E,$2CED,$2CEE,$3C4E,$3C4E,$3C4E                   ;85949F;
    dw $3C4E,$000E,$000E,$000E,$000E,$000E,$000E,$000E                   ;8594AF;

MessageTilemaps_saveCompleted:
    dw $000E,$000E,$000E,$000E,$000E,$000E,$3C4E,$3C4E                   ;8594BF;
    dw $3CF2,$3CE0,$3CF5,$3CE4,$3C4E,$3CE2,$3CEE,$3CEC                   ;8594CF;
    dw $3CEF,$3CEB,$3CE4,$3CF3,$3CE4,$3CE3,$3CFA,$3C4E                   ;8594DF;
    dw $3C4E,$000E,$000E,$000E,$000E,$000E,$000E,$000E                   ;8594EF;

MessageTilemaps_reserveTank:
    dw $000E,$000E,$000E,$000E,$000E,$000E,$284E,$284E                   ;8594FF;
    dw $284E,$28F1,$28E4,$28F2,$28E4,$28F1,$28F5,$28E4                   ;85950F;
    dw $284E,$28F3,$28E0,$28ED,$28EA,$284E,$284E,$284E                   ;85951F;
    dw $284E,$000E,$000E,$000E,$000E,$000E,$000E,$000E                   ;85952F;

MessageTilemaps_gravitySuit:
    dw $000E,$000E,$000E,$000E,$000E,$000E,$284E,$284E                   ;85953F;
    dw $284E,$28E6,$28F1,$28E0,$28F5,$28E8,$28F3,$28F8                   ;85954F;
    dw $284E,$28F2,$28F4,$28E8,$28F3,$284E,$284E,$284E                   ;85955F;
    dw $284E,$000E,$000E,$000E,$000E,$000E,$000E,$000E                   ;85956F;

MessageTilemaps_Terminator:
    dw $0000                                                             ;85957F;

UNUSED_MessageTilemaps_YES_859581:
    dw $000E,$000E,$000E,$000E,$000E,$000E,$3C4E,$3C4E                   ;859581;
    dw $38CC,$38CD,$3CF8,$3CE4,$3CF2,$3C4E,$3C4E,$3C4E                   ;859591;
    dw $3C4E,$3C4E,$3C4E,$2CED,$2CEE,$3C4E,$3C4E,$3C4E                   ;8595A1;
    dw $3C4E,$000E,$000E,$000E,$000E,$000E,$000E,$000E                   ;8595B1;

MessageTilemaps_YES:
    dw $000E,$000E,$000E,$000E,$000E,$000E,$3C4E,$3C4E                   ;8595C1;
    dw $38CC,$38CD,$3CF8,$3CE4,$3CF2,$3C4E,$3C4E,$3C4E                   ;8595D1;
    dw $3C4E,$3C4E,$3C4E,$2CED,$2CEE,$3C4E,$3C4E,$3C4E                   ;8595E1;
    dw $3C4E,$000E,$000E,$000E,$000E,$000E,$000E,$000E                   ;8595F1;

MessageTilemaps_NO:
    dw $000E,$000E,$000E,$000E,$000E,$000E,$3C4E,$3C4E                   ;859601;
    dw $3C4E,$3C4E,$2CF8,$2CE4,$2CF2,$3C4E,$3C4E,$3C4E                   ;859611;
    dw $3C4E,$38CC,$38CD,$3CED,$3CEE,$3C4E,$3C4E,$3C4E                   ;859621;
    dw $3C4E,$000E,$000E,$000E,$000E,$000E,$000E,$000E                   ;859631;

MessageTilemaps_Terminator2:                                             ;859641;
    dw $0000

Freespace_Bank85_9643:                                                   ;859643;
; $69BD bytes
