Enable_PaletteFXObjects:
    PHP                                                                  ;8DC4C2;
    REP #$20                                                             ;8DC4C3;
    LDA.W #$8000                                                         ;8DC4C5;
    TSB.W $1E79                                                          ;8DC4C8;
    PLP                                                                  ;8DC4CB;
    RTL                                                                  ;8DC4CC;


Disable_PaletteFXObjects:
    PHP                                                                  ;8DC4CD;
    REP #$20                                                             ;8DC4CE;
    LDA.W #$8000                                                         ;8DC4D0;
    TRB.W $1E79                                                          ;8DC4D3;
    PLP                                                                  ;8DC4D6;
    RTL                                                                  ;8DC4D7;


Clear_PaletteFXObjects:
    PHP                                                                  ;8DC4D8;
    REP #$30                                                             ;8DC4D9;
    PHX                                                                  ;8DC4DB;
    LDX.W #$000E                                                         ;8DC4DC;

.loop:
    STZ.W $1E7D,X                                                        ;8DC4DF;
    DEX                                                                  ;8DC4E2;
    DEX                                                                  ;8DC4E3;
    BPL .loop                                                            ;8DC4E4;
    PLX                                                                  ;8DC4E6;
    PLP                                                                  ;8DC4E7;
    RTL                                                                  ;8DC4E8;


Spawn_PaletteFXObject:
    PHP                                                                  ;8DC4E9;
    PHB                                                                  ;8DC4EA;
    PHX                                                                  ;8DC4EB;
    PHK                                                                  ;8DC4EC;
    PLB                                                                  ;8DC4ED;
    LDX.W #$000E                                                         ;8DC4EE;

.loop:
    LDA.W $1E7D,X                                                        ;8DC4F1;
    BEQ .zero                                                            ;8DC4F4;
    DEX                                                                  ;8DC4F6;
    DEX                                                                  ;8DC4F7;
    BPL .loop                                                            ;8DC4F8;
    PLX                                                                  ;8DC4FA;
    PLB                                                                  ;8DC4FB;
    PLP                                                                  ;8DC4FC;
    SEC                                                                  ;8DC4FD;
    RTL                                                                  ;8DC4FE;


.zero:
    TYA                                                                  ;8DC4FF;
    STA.W $1E7D,X                                                        ;8DC500;
    STZ.W $1E8D,X                                                        ;8DC503;
    LDA.W #RTS_8DC526                                                    ;8DC506;
    STA.W $1EAD,X                                                        ;8DC509;
    LDA.W $0002,Y                                                        ;8DC50C;
    STA.W $1EBD,X                                                        ;8DC50F;
    LDA.W #$0001                                                         ;8DC512;
    STA.W $1ECD,X                                                        ;8DC515;
    STZ.W $1EDD,X                                                        ;8DC518;
    TXA                                                                  ;8DC51B;
    TYX                                                                  ;8DC51C;
    TAY                                                                  ;8DC51D;
    JSR.W ($0000,X)                                                      ;8DC51E;
    PLX                                                                  ;8DC521;
    PLB                                                                  ;8DC522;
    PLP                                                                  ;8DC523;
    CLC                                                                  ;8DC524;
    RTL                                                                  ;8DC525;


RTS_8DC526:
    RTS                                                                  ;8DC526;


PaletteFXObject_Handler:
    PHP                                                                  ;8DC527;
    PHB                                                                  ;8DC528;
    PHK                                                                  ;8DC529;
    PLB                                                                  ;8DC52A;
    REP #$30                                                             ;8DC52B;
    BIT.W $1E79                                                          ;8DC52D;
    BPL .return                                                          ;8DC530;
    LDX.W #$000E                                                         ;8DC532;

.loop:
    STX.W $1E7B                                                          ;8DC535;
    LDA.W $1E7D,X                                                        ;8DC538;
    BEQ .next                                                            ;8DC53B;
    JSR.W Process_PaleteFXObject                                         ;8DC53D;
    LDX.W $1E7B                                                          ;8DC540;

.next:
    DEX                                                                  ;8DC543;
    DEX                                                                  ;8DC544;
    BPL .loop                                                            ;8DC545;

.return:
    PLB                                                                  ;8DC547;
    PLP                                                                  ;8DC548;
    RTL                                                                  ;8DC549;


Process_PaleteFXObject:
    REP #$30                                                             ;8DC54A;
    JSR.W ($1EAD,X)                                                      ;8DC54C;
    LDX.W $1E7B                                                          ;8DC54F;
    DEC.W $1ECD,X                                                        ;8DC552;
    BNE Process_PaleteFXObject_return                                    ;8DC555;
    LDA.W $1EBD,X                                                        ;8DC557;
    TAY                                                                  ;8DC55A;

.loopDetermineColorIndex:
    LDA.W $0000,Y                                                        ;8DC55B;
    BPL .timer                                                           ;8DC55E;
    STA.B $12                                                            ;8DC560;
    INY                                                                  ;8DC562;
    INY                                                                  ;8DC563;
    PEA.W .loopDetermineColorIndex-1                                     ;8DC564;
    JMP.W ($0012)                                                        ;8DC567;


.timer:
    STA.W $1ECD,X                                                        ;8DC56A;
    LDA.W $1E8D,X                                                        ;8DC56D;
    TAX                                                                  ;8DC570;

.loopWriteColors:
    LDA.W $0002,Y                                                        ;8DC571;
    BPL .storeColor                                                      ;8DC574;
    STA.B $12                                                            ;8DC576;
    PEA.W .loopWriteColors-1                                             ;8DC578;
    JMP.W ($0012)                                                        ;8DC57B;


.storeColor:
    STA.L $7EC000,X                                                      ;8DC57E;
    INX                                                                  ;8DC582;
    INX                                                                  ;8DC583;
    INY                                                                  ;8DC584;
    INY                                                                  ;8DC585;
    JMP.W .loopWriteColors                                               ;8DC586;


Process_PaleteFXObject_done:
    LDX.W $1E7B                                                          ;8DC589;
    TYA                                                                  ;8DC58C;
    CLC                                                                  ;8DC58D;
    ADC.W #$0004                                                         ;8DC58E;
    STA.W $1EBD,X                                                        ;8DC591;

Process_PaleteFXObject_return:
    RTS                                                                  ;8DC594;


Instruction_PaletteFXObject_Done:
    PLA                                                                  ;8DC595;
    JMP.W Process_PaleteFXObject_done                                    ;8DC596;


Instruction_PaletteFXObject_ColorIndex_Plus4:
    TXA                                                                  ;8DC599;
    CLC                                                                  ;8DC59A;
    ADC.W #$0004                                                         ;8DC59B;
    TAX                                                                  ;8DC59E;
    INY                                                                  ;8DC59F;
    INY                                                                  ;8DC5A0;
    RTS                                                                  ;8DC5A1;


Instruction_PaletteFXObject_ColorIndex_Plus6:
    TXA                                                                  ;8DC5A2;
    CLC                                                                  ;8DC5A3;
    ADC.W #$0006                                                         ;8DC5A4;
    TAX                                                                  ;8DC5A7;
    INY                                                                  ;8DC5A8;
    INY                                                                  ;8DC5A9;
    RTS                                                                  ;8DC5AA;


Instruction_PaletteFXObject_ColorIndex_Plus8:
    TXA                                                                  ;8DC5AB;
    CLC                                                                  ;8DC5AC;
    ADC.W #$0008                                                         ;8DC5AD;
    TAX                                                                  ;8DC5B0;
    INY                                                                  ;8DC5B1;
    INY                                                                  ;8DC5B2;
    RTS                                                                  ;8DC5B3;


Instruction_PaletteFXObject_ColorIndex_Plus10:
    TXA                                                                  ;8DC5B4;
    CLC                                                                  ;8DC5B5;
    ADC.W #$0010                                                         ;8DC5B6;
    TAX                                                                  ;8DC5B9;
    INY                                                                  ;8DC5BA;
    INY                                                                  ;8DC5BB;
    RTS                                                                  ;8DC5BC;


Instruction_PaletteFXObject_ColorIndex_Plus12:
    TXA                                                                  ;8DC5BD;
    CLC                                                                  ;8DC5BE;
    ADC.W #$0012                                                         ;8DC5BF;
    TAX                                                                  ;8DC5C2;
    INY                                                                  ;8DC5C3;
    INY                                                                  ;8DC5C4;
    RTS                                                                  ;8DC5C5;


UNUSED_Instruction_PaletteFXObject_ColorIndex_Plus1E_8DC5C6:
    TXA                                                                  ;8DC5C6;
    CLC                                                                  ;8DC5C7;
    ADC.W #$001E                                                         ;8DC5C8;
    TAX                                                                  ;8DC5CB;
    INY                                                                  ;8DC5CC;
    INY                                                                  ;8DC5CD;
    RTS                                                                  ;8DC5CE;


Instruction_Delete_8DC5CF:
    STZ.W $1E7D,X                                                        ;8DC5CF;
    PLA                                                                  ;8DC5D2;
    RTS                                                                  ;8DC5D3;


Instruction_PaletteFXObject_PreInstructionInY:
    LDA.W $0000,Y                                                        ;8DC5D4;
    STA.W $1EAD,X                                                        ;8DC5D7;
    INY                                                                  ;8DC5DA;
    INY                                                                  ;8DC5DB;
    RTS                                                                  ;8DC5DC;


UNUSED_Inst_PaletteFXObject_ClearPreInstruction_8DC5DD:
    LDA.W #RTS_8DC5E3                                                    ;8DC5DD;
    STA.W $1EAD,X                                                        ;8DC5E0;

RTS_8DC5E3:
    RTS                                                                  ;8DC5E3;


UNUSED_Inst_PaletteFXObject_CallExternalFunctionInY_8DC5E4:
    LDA.W $0000,Y                                                        ;8DC5E4;
    STA.B $12                                                            ;8DC5E7;
    LDA.W $0001,Y                                                        ;8DC5E9;
    STA.B $13                                                            ;8DC5EC;
    PHY                                                                  ;8DC5EE;
    JSL.L .externalFunction                                              ;8DC5EF;
    PLY                                                                  ;8DC5F3;
    LDX.W $1E7B                                                          ;8DC5F4;
    INY                                                                  ;8DC5F7;
    INY                                                                  ;8DC5F8;
    INY                                                                  ;8DC5F9;
    RTS                                                                  ;8DC5FA;


.externalFunction:
    JML.W [$0012]                                                        ;8DC5FB;


UNUSED_Inst_PaletteFXObject_CallExternalFuncInYWithA_8DC5FE:
    LDA.W $0000,Y                                                        ;8DC5FE;
    STA.B $12                                                            ;8DC601;
    LDA.W $0001,Y                                                        ;8DC603;
    STA.B $13                                                            ;8DC606;
    LDA.W $0003,Y                                                        ;8DC608;
    PHY                                                                  ;8DC60B;
    JSL.L .externalFunction                                              ;8DC60C;
    PLY                                                                  ;8DC610;
    LDX.W $1E7B                                                          ;8DC611;
    TYA                                                                  ;8DC614;
    CLC                                                                  ;8DC615;
    ADC.W #$0005                                                         ;8DC616;
    TAY                                                                  ;8DC619;
    RTS                                                                  ;8DC61A;


.externalFunction:
    JML.W [$0012]                                                        ;8DC61B;


Instruction_PaletteFXObject_GotoY:
    LDA.W $0000,Y                                                        ;8DC61E;
    TAY                                                                  ;8DC621;
    RTS                                                                  ;8DC622;


UNUSED_Instruction_PaletteFXObject_GotoYPlusY_8DC623:
    STY.B $12                                                            ;8DC623;
    DEY                                                                  ;8DC625;
    LDA.W $0000,Y                                                        ;8DC626;
    XBA                                                                  ;8DC629;
    BMI .highByte                                                        ;8DC62A;
    AND.W #$00FF                                                         ;8DC62C;
    BRA +                                                                ;8DC62F;


.highByte:
    ORA.W #$FF00                                                         ;8DC631;

  + CLC                                                                  ;8DC634;
    ADC.B $12                                                            ;8DC635;
    TAY                                                                  ;8DC637;
    RTS                                                                  ;8DC638;


Instruction_PaletteFXObject_DecrementTimer_GotoYIfNonZero:
    DEC.W $1EDD,X                                                        ;8DC639;
    BNE Instruction_PaletteFXObject_GotoY                                ;8DC63C;
    INY                                                                  ;8DC63E;
    INY                                                                  ;8DC63F;
    RTS                                                                  ;8DC640;


UNUSED_Inst_PaletteFXObject_DecTimer_GotoYIfNonZero_8DC641:
    DEC.W $1EDD,X                                                        ;8DC641;
    BNE UNUSED_Instruction_PaletteFXObject_GotoYPlusY_8DC623             ;8DC644;
    INY                                                                  ;8DC646;
    RTS                                                                  ;8DC647;


Instruction_PaletteFXObject_TimerInY:
    SEP #$20                                                             ;8DC648;
    LDA.W $0000,Y                                                        ;8DC64A;
    STA.W $1EDD,X                                                        ;8DC64D;
    REP #$20                                                             ;8DC650;
    INY                                                                  ;8DC652;
    RTS                                                                  ;8DC653;


RTS_8DC654:
    RTS                                                                  ;8DC654;


Instruction_PaletteFXObject_ColorIndexInY:
    LDA.W $0000,Y                                                        ;8DC655;
    STA.W $1E8D,X                                                        ;8DC658;
    INY                                                                  ;8DC65B;
    INY                                                                  ;8DC65C;
    RTS                                                                  ;8DC65D;


UNUSED_Instruction_PaletteFXObject_QueueMusicTrackInY_8DC65E:
    LDA.W $0000,Y                                                        ;8DC65E;
    AND.W #$00FF                                                         ;8DC661;
    JSL.L QueueMusicDataOrTrack_8FrameDelay                              ;8DC664;
    INY                                                                  ;8DC668;
    RTS                                                                  ;8DC669;


UNUSED_Inst_PaletteFXObject_QueueSoundInY_Lib1_Max6_8DC66A:
    LDA.W $0000,Y                                                        ;8DC66A;
    JSL.L QueueSound_Lib1_Max6                                           ;8DC66D;
    INY                                                                  ;8DC671;
    RTS                                                                  ;8DC672;


UNUSED_Inst_PaletteFXObject_QueueSoundInY_Lib2_Max6_8DC673:
    LDA.W $0000,Y                                                        ;8DC673;
    JSL.L QueueSound_Lib2_Max6                                           ;8DC676;
    INY                                                                  ;8DC67A;
    RTS                                                                  ;8DC67B;


UNUSED_Inst_PaletteFXObject_QueueSoundInY_Lib3_Max6_8DC67C:
    LDA.W $0000,Y                                                        ;8DC67C;
    JSL.L QueueSound_Lib3_Max6                                           ;8DC67F;
    INY                                                                  ;8DC683;
    RTS                                                                  ;8DC684;


RTS_8DC685:
    RTS                                                                  ;8DC685;


UNUSED_8DC686:
    dw $1000,$C690,$C595,$C61E,$C686,$0180,$0000,$0000                   ;8DC686;

InstList_PaletteFXObject_FadeInSuperMetroidTitleLogo:
    dw Instruction_PaletteFXObject_ColorIndexInY                         ;8DC696;
    dw $0142,$0003,$0000,$0000,$0000,$0000,$0000,$0000                   ;8DC698;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;8DC6A8;
    dw $0000                                                             ;8DC6B8;
    dw Instruction_PaletteFXObject_Done                                  ;8DC6BA;
    dw $0003,$1084,$0084,$0064,$0064,$0044,$0024,$0004                   ;8DC6BC;
    dw $0004,$0003,$0002,$0401,$0400,$0C63,$0421,$0000                   ;8DC6CC;
    dw Instruction_PaletteFXObject_Done                                  ;8DC6DC;
    dw $0003,$2108,$0508,$00E8,$00C8,$0088,$0048,$0028                   ;8DC6DE;
    dw $0008,$0006,$0405,$0803,$0C01,$18C6,$0C42,$0400                   ;8DC6EE;
    dw Instruction_PaletteFXObject_Done                                  ;8DC6FE;
    dw $0003,$35AD,$05AD,$056D,$052D,$00CD,$008D,$004D                   ;8DC700;
    dw $000D,$000A,$0407,$0C05,$1422,$2529,$1484,$0400                   ;8DC710;
    dw Instruction_PaletteFXObject_Done                                  ;8DC720;
    dw $0003,$4631,$0A31,$05D1,$0591,$0531,$00B1,$0051                   ;8DC722;
    dw $0011,$000D,$080A,$1026,$1823,$318C,$1CA5,$0800                   ;8DC732;
    dw Instruction_PaletteFXObject_Done                                  ;8DC742;
    dw $0003,$5AD6,$0AD6,$0A56,$09F6,$0576,$00F6,$0076                   ;8DC744;
    dw $0016,$0011,$080C,$1428,$2044,$3DEF,$24E7,$0800                   ;8DC754;
    dw Instruction_PaletteFXObject_Done                                  ;8DC764;
    dw $0003,$6B5A,$0F5A,$0ADA,$0A5A,$05BA,$011A,$009A                   ;8DC766;
    dw $001A,$0014,$0C0F,$182A,$2845,$4A52,$2D08,$0C00                   ;8DC776;
    dw Instruction_PaletteFXObject_Done                                  ;8DC786;
    dw $0003,$7FFF,$13FF,$0F5F,$0EBF,$0A1F,$055F,$04BF                   ;8DC788;
    dw $001F,$0018,$1032,$204C,$3066,$5AB5,$354A,$1000                   ;8DC798;
    dw Instruction_PaletteFXObject_Done                                  ;8DC7A8;
    dw Instruction_Delete_8DC5CF                                         ;8DC7AA;

InstList_PaletteFXObject_FadeInNintendoBootLogo:
    dw Instruction_PaletteFXObject_ColorIndexInY                         ;8DC7AC;
    dw $0132                                                             ;8DC7AE;

InstList_PaletteFXObject_Common_FadeInLogo:
    dw $0003,$0C63,$0C20                                                 ;8DC7B0;
    dw Instruction_PaletteFXObject_Done                                  ;8DC7B6;
    dw $0003,$1CE7,$1C60                                                 ;8DC7B8;
    dw Instruction_PaletteFXObject_Done                                  ;8DC7BE;
    dw $0003,$2D6B,$2C80                                                 ;8DC7C0;
    dw Instruction_PaletteFXObject_Done                                  ;8DC7C6;
    dw $0003,$3DEF,$3CC0                                                 ;8DC7C8;
    dw Instruction_PaletteFXObject_Done                                  ;8DC7CE;
    dw $0003,$4E73,$4CE0                                                 ;8DC7D0;
    dw Instruction_PaletteFXObject_Done                                  ;8DC7D6;
    dw $0003,$5EF7,$5D20                                                 ;8DC7D8;
    dw Instruction_PaletteFXObject_Done                                  ;8DC7DE;
    dw $0003,$6F7B,$6D40                                                 ;8DC7E0;
    dw Instruction_PaletteFXObject_Done                                  ;8DC7E6;
    dw $0003,$7FFF,$7D80                                                 ;8DC7E8;
    dw Instruction_PaletteFXObject_Done                                  ;8DC7EE;
    dw Instruction_Delete_8DC5CF                                         ;8DC7F0;

InstList_PaletteFXObject_FadeInNintendoCopyright:
    dw Instruction_PaletteFXObject_ColorIndexInY                         ;8DC7F2;
    dw $0192                                                             ;8DC7F4;
    dw Instruction_PaletteFXObject_GotoY                                 ;8DC7F6;
    dw InstList_PaletteFXObject_Common_FadeInLogo                        ;8DC7F8;

InstList_PaletteFXObject_TitleScreenBabyMetroidTubeLight_0:
    dw Instruction_PaletteFXObject_ColorIndexInY                         ;8DC7FA;
    dw $0054                                                             ;8DC7FC;

InstList_PaletteFXObject_TitleScreenBabyMetroidTubeLight_1:
    dw $000A                                                             ;8DC7FE;
    dw $0113,$000F,$175C,$0299                                           ;8DC800;
    dw Instruction_PaletteFXObject_Done                                  ;8DC808;
    dw $000A,$00B0,$000C,$0AF9,$0236                                     ;8DC80A;
    dw Instruction_PaletteFXObject_Done                                  ;8DC814;
    dw $000A,$006D,$0009,$0296,$01D3                                     ;8DC816;
    dw Instruction_PaletteFXObject_Done                                  ;8DC820;
    dw $000A,$000A,$0006,$0233,$0170                                     ;8DC822;
    dw Instruction_PaletteFXObject_Done                                  ;8DC82C;
    dw $000A,$0007,$0003,$01D0,$010D                                     ;8DC82E;
    dw Instruction_PaletteFXObject_Done                                  ;8DC838;
    dw $000A,$000A,$0006,$0233,$0170                                     ;8DC83A;
    dw Instruction_PaletteFXObject_Done                                  ;8DC844;
    dw $000A,$006D,$0009,$0296,$01D3                                     ;8DC846;
    dw Instruction_PaletteFXObject_Done                                  ;8DC850;
    dw $000A,$00B0,$000C,$0AF9,$0236                                     ;8DC852;
    dw Instruction_PaletteFXObject_Done                                  ;8DC85C;
    dw Instruction_PaletteFXObject_GotoY                                 ;8DC85E;
    dw InstList_PaletteFXObject_TitleScreenBabyMetroidTubeLight_1        ;8DC860;

InstList_PaletteFXObject_TitleScreenFlickeringDisplays_0:
    dw Instruction_PaletteFXObject_ColorIndexInY                         ;8DC862;
    dw $005C                                                             ;8DC864;

InstList_PaletteFXObject_TitleScreenFlickeringDisplays_1:
    dw $0001,$13FF,$0BB1                                                 ;8DC866;
    dw Instruction_PaletteFXObject_Done                                  ;8DC86C;
    dw $0001,$00AC,$0145                                                 ;8DC86E;
    dw Instruction_PaletteFXObject_Done                                  ;8DC874;
    dw Instruction_PaletteFXObject_GotoY                                 ;8DC876;
    dw InstList_PaletteFXObject_TitleScreenFlickeringDisplays_1          ;8DC878;

InstList_PaletteFXObject_CutsceneGunshipEngineFlicker_0:
    dw Instruction_PaletteFXObject_ColorIndexInY                         ;8DC87A;
    dw $00BE                                                             ;8DC87C;

InstList_PaletteFXObject_CutsceneGunshipEngineFlicker_1:
    dw $0001,$7FFF                                                       ;8DC87E;
    dw Instruction_PaletteFXObject_Done                                  ;8DC882;
    dw $0001,$0000                                                       ;8DC884;
    dw Instruction_PaletteFXObject_Done                                  ;8DC888;
    dw Instruction_PaletteFXObject_GotoY                                 ;8DC88A;
    dw InstList_PaletteFXObject_CutsceneGunshipEngineFlicker_1           ;8DC88C;

InstList_PaletteFXObject_CutsceneCeresNavigationLight_Sprite:
    dw Instruction_PaletteFXObject_ColorIndexInY                         ;8DC88E;
    dw $01DA                                                             ;8DC890;

InstList_PaletteFXObject_Common_CeresNavigationLights:
    dw $0004,$001F,$0000                                                 ;8DC892;
    dw Instruction_PaletteFXObject_Done                                  ;8DC898;
    dw $0004,$001B,$0004                                                 ;8DC89A;
    dw Instruction_PaletteFXObject_Done                                  ;8DC8A0;
    dw $0004,$0016,$0009                                                 ;8DC8A2;
    dw Instruction_PaletteFXObject_Done                                  ;8DC8A8;
    dw $0004,$0012,$000D                                                 ;8DC8AA;
    dw Instruction_PaletteFXObject_Done                                  ;8DC8B0;
    dw $0004,$000D,$0012                                                 ;8DC8B2;
    dw Instruction_PaletteFXObject_Done                                  ;8DC8B8;
    dw $0004,$0009,$0016                                                 ;8DC8BA;
    dw Instruction_PaletteFXObject_Done                                  ;8DC8C0;
    dw $0004,$0004,$001B                                                 ;8DC8C2;
    dw Instruction_PaletteFXObject_Done                                  ;8DC8C8;
    dw $0004,$0000,$001F                                                 ;8DC8CA;
    dw Instruction_PaletteFXObject_Done                                  ;8DC8D0;
    dw $0004,$0004,$001B                                                 ;8DC8D2;
    dw Instruction_PaletteFXObject_Done                                  ;8DC8D8;
    dw $0004,$0009,$0016                                                 ;8DC8DA;
    dw Instruction_PaletteFXObject_Done                                  ;8DC8E0;
    dw $0004,$000D,$0012                                                 ;8DC8E2;
    dw Instruction_PaletteFXObject_Done                                  ;8DC8E8;
    dw $0004,$0012,$000D                                                 ;8DC8EA;
    dw Instruction_PaletteFXObject_Done                                  ;8DC8F0;
    dw $0004,$0016,$0009                                                 ;8DC8F2;
    dw Instruction_PaletteFXObject_Done                                  ;8DC8F8;
    dw $0004,$001B,$0004                                                 ;8DC8FA;
    dw Instruction_PaletteFXObject_Done                                  ;8DC900;
    dw Instruction_PaletteFXObject_GotoY                                 ;8DC902;
    dw InstList_PaletteFXObject_Common_CeresNavigationLights             ;8DC904;

InstList_PaletteFXObject_CutsceneCeresNavigationLights_BG:
    dw Instruction_PaletteFXObject_ColorIndexInY                         ;8DC906;
    dw $00DA                                                             ;8DC908;
    dw Instruction_PaletteFXObject_GotoY                                 ;8DC90A;
    dw InstList_PaletteFXObject_Common_CeresNavigationLights             ;8DC90C;

InstList_PaletteFXObject_FadeInPlanetZebesText:
    dw Instruction_PaletteFXObject_ColorIndexInY                         ;8DC90E;
    dw $0102,$0003,$0000,$0000,$0000                                     ;8DC910;
    dw Instruction_PaletteFXObject_Done                                  ;8DC91A;
    dw $0003,$1084,$0C63,$0421                                           ;8DC91C;
    dw Instruction_PaletteFXObject_Done                                  ;8DC924;
    dw $0003,$2529,$1CE7,$0C63                                           ;8DC926;
    dw Instruction_PaletteFXObject_Done                                  ;8DC92E;
    dw $0003,$35AD,$294A,$1084                                           ;8DC930;
    dw Instruction_PaletteFXObject_Done                                  ;8DC938;
    dw $0003,$4A52,$39CE,$18C6                                           ;8DC93A;
    dw Instruction_PaletteFXObject_Done                                  ;8DC942;
    dw $0003,$5AD6,$4631,$1CE7                                           ;8DC944;
    dw Instruction_PaletteFXObject_Done                                  ;8DC94C;
    dw $0003,$6F7B,$56B5,$2529                                           ;8DC94E;
    dw Instruction_PaletteFXObject_Done                                  ;8DC956;
    dw $0003,$7FFF,$6318,$294A                                           ;8DC958;
    dw Instruction_PaletteFXObject_Done                                  ;8DC960;
    dw Instruction_Delete_8DC5CF                                         ;8DC962;

InstList_PaletteFXObject_FadeOutPlanetZebesText:
    dw Instruction_PaletteFXObject_ColorIndexInY                         ;8DC964;
    dw $0102,$0003,$7FFF,$6318,$294A                                     ;8DC966;
    dw Instruction_PaletteFXObject_Done                                  ;8DC970;
    dw $0003,$6F7B,$56B5,$2529                                           ;8DC972;
    dw Instruction_PaletteFXObject_Done                                  ;8DC97A;
    dw $0003,$5AD6,$4631,$1CE7                                           ;8DC97C;
    dw Instruction_PaletteFXObject_Done                                  ;8DC984;
    dw $0003,$4A52,$39CE,$18C6                                           ;8DC986;
    dw Instruction_PaletteFXObject_Done                                  ;8DC98E;
    dw $0003,$35AD,$294A,$1084                                           ;8DC990;
    dw Instruction_PaletteFXObject_Done                                  ;8DC998;
    dw $0003,$2529,$1CE7,$0C63                                           ;8DC99A;
    dw Instruction_PaletteFXObject_Done                                  ;8DC9A2;
    dw $0003,$1084,$0C63,$0421                                           ;8DC9A4;
    dw Instruction_PaletteFXObject_Done                                  ;8DC9AC;
    dw $0003,$0000,$0000,$0000                                           ;8DC9AE;
    dw Instruction_PaletteFXObject_Done                                  ;8DC9B6;
    dw Instruction_Delete_8DC5CF                                         ;8DC9B8;

InstList_PaletteFXObject_OldMotherBrainFightBGLights_0:
    dw Instruction_PaletteFXObject_ColorIndexInY                         ;8DC9BA;
    dw $0028                                                             ;8DC9BC;

InstList_PaletteFXObject_OldMotherBrainFightBGLights_1:
    dw $0006,$7FFF,$6318,$294A                                           ;8DC9BE;
    dw Instruction_PaletteFXObject_Done                                  ;8DC9C6;
    dw $0006,$6F7B,$56B5,$2529                                           ;8DC9C8;
    dw Instruction_PaletteFXObject_Done                                  ;8DC9D0;
    dw $0006,$5AD6,$4631,$1CE7                                           ;8DC9D2;
    dw Instruction_PaletteFXObject_Done                                  ;8DC9DA;
    dw $0006,$4A52,$39CE,$18C6                                           ;8DC9DC;
    dw Instruction_PaletteFXObject_Done                                  ;8DC9E4;
    dw $0006,$35AD,$294A,$1084                                           ;8DC9E6;
    dw Instruction_PaletteFXObject_Done                                  ;8DC9EE;
    dw $0006,$2529,$1CE7,$0C63                                           ;8DC9F0;
    dw Instruction_PaletteFXObject_Done                                  ;8DC9F8;
    dw $0006,$1084,$0C63,$0421                                           ;8DC9FA;
    dw Instruction_PaletteFXObject_Done                                  ;8DCA02;
    dw $0006,$0000,$0000,$0000                                           ;8DCA04;
    dw Instruction_PaletteFXObject_Done                                  ;8DCA0C;
    dw $0006,$1084,$0C63,$0421                                           ;8DCA0E;
    dw Instruction_PaletteFXObject_Done                                  ;8DCA16;
    dw $0006,$2529,$1CE7,$0C63                                           ;8DCA18;
    dw Instruction_PaletteFXObject_Done                                  ;8DCA20;
    dw $0006,$35AD,$294A,$1084                                           ;8DCA22;
    dw Instruction_PaletteFXObject_Done                                  ;8DCA2A;
    dw $0006,$4A52,$39CE,$18C6                                           ;8DCA2C;
    dw Instruction_PaletteFXObject_Done                                  ;8DCA34;
    dw $0006,$5AD6,$4631,$1CE7                                           ;8DCA36;
    dw Instruction_PaletteFXObject_Done                                  ;8DCA3E;
    dw $0006,$6F7B,$56B5,$2529                                           ;8DCA40;
    dw Instruction_PaletteFXObject_Done                                  ;8DCA48;
    dw Instruction_PaletteFXObject_GotoY                                 ;8DCA4A;
    dw InstList_PaletteFXObject_OldMotherBrainFightBGLights_1            ;8DCA4C;

InstList_PaletteFXObject_GunshipGlow_0:
    dw Instruction_PaletteFXObject_ColorIndexInY                         ;8DCA4E;
    dw $01FE                                                             ;8DCA50;

InstList_PaletteFXObject_GunshipGlow_1:
    dw $0005,$0000                                                       ;8DCA52;
    dw Instruction_PaletteFXObject_Done                                  ;8DCA56;
    dw $0005,$0402                                                       ;8DCA58;
    dw Instruction_PaletteFXObject_Done                                  ;8DCA5C;
    dw $0005,$0404                                                       ;8DCA5E;
    dw Instruction_PaletteFXObject_Done                                  ;8DCA62;
    dw $0005,$0806                                                       ;8DCA64;
    dw Instruction_PaletteFXObject_Done                                  ;8DCA68;
    dw $0005,$0C08                                                       ;8DCA6A;
    dw Instruction_PaletteFXObject_Done                                  ;8DCA6E;
    dw $0005,$0C0A                                                       ;8DCA70;
    dw Instruction_PaletteFXObject_Done                                  ;8DCA74;
    dw $0005,$100C                                                       ;8DCA76;
    dw Instruction_PaletteFXObject_Done                                  ;8DCA7A;
    dw $0005,$180E                                                       ;8DCA7C;
    dw Instruction_PaletteFXObject_Done                                  ;8DCA80;
    dw $0005,$100C                                                       ;8DCA82;
    dw Instruction_PaletteFXObject_Done                                  ;8DCA86;
    dw $0005,$0C0A                                                       ;8DCA88;
    dw Instruction_PaletteFXObject_Done                                  ;8DCA8C;
    dw $0005,$0C08                                                       ;8DCA8E;
    dw Instruction_PaletteFXObject_Done                                  ;8DCA92;
    dw $0005,$0806                                                       ;8DCA94;
    dw Instruction_PaletteFXObject_Done                                  ;8DCA98;
    dw $0005,$0404                                                       ;8DCA9A;
    dw Instruction_PaletteFXObject_Done                                  ;8DCA9E;
    dw $0005,$0402                                                       ;8DCAA0;
    dw Instruction_PaletteFXObject_Done                                  ;8DCAA4;
    dw Instruction_PaletteFXObject_GotoY                                 ;8DCAA6;
    dw InstList_PaletteFXObject_GunshipGlow_1                            ;8DCAA8;

InstList_PaletteFXObject_FadeOutZoomedOutExplodingZebes:
    dw Instruction_PaletteFXObject_ColorIndexInY                         ;8DCAAA;
    dw $01E0,$0008,$2003,$0E9A,$05F9,$0596,$0133,$008E                   ;8DCAAC;
    dw $0009,$0005                                                       ;8DCABC;
    dw Instruction_PaletteFXObject_Done                                  ;8DCAC0;
    dw $0008,$2003,$01F5,$0154,$00F0,$008E,$0009,$0004                   ;8DCAC2;
    dw $0000                                                             ;8DCAD2;
    dw Instruction_PaletteFXObject_Done                                  ;8DCAD4;
    dw $0008,$0000,$0150,$00AF,$004B,$0009,$0004,$0000                   ;8DCAD6;
    dw $0000                                                             ;8DCAE6;
    dw Instruction_PaletteFXObject_Done                                  ;8DCAE8;
    dw $0008,$0000,$00AB,$000A,$0006,$0004,$0000,$0000                   ;8DCAEA;
    dw $0000                                                             ;8DCAFA;
    dw Instruction_PaletteFXObject_Done                                  ;8DCAFC;
    dw $0008,$0000,$0006,$0005,$0001,$0000,$0000,$0000                   ;8DCAFE;
    dw $0000                                                             ;8DCB0E;
    dw Instruction_PaletteFXObject_Done                                  ;8DCB10;
    dw $0008,$0000,$0001,$0000,$0000,$0000,$0000,$0000                   ;8DCB12;
    dw $0000                                                             ;8DCB22;
    dw Instruction_PaletteFXObject_Done                                  ;8DCB24;
    dw $0008,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;8DCB26;
    dw $0000                                                             ;8DCB36;
    dw Instruction_PaletteFXObject_Done                                  ;8DCB38;
    dw Instruction_Delete_8DC5CF                                         ;8DCB3A;

InstList_PaletteFXObject_WidePartOfZebesExplosion_Foreground:
    dw Instruction_PaletteFXObject_ColorIndexInY                         ;8DCB3C;
    dw $0002,$0004,$7C00,$0000,$0000,$0000,$0000,$0000                   ;8DCB3E;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;8DCB4E;
    dw $0000                                                             ;8DCB5E;
    dw Instruction_PaletteFXObject_Done                                  ;8DCB60;
    dw $0004,$7CA0,$7CA0,$0000,$0000,$0000,$0000,$0000                   ;8DCB62;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;8DCB72;
    dw Instruction_PaletteFXObject_Done                                  ;8DCB82;
    dw $0004,$7DE0,$7DE0,$7DE0,$0000,$0000,$0000,$0000                   ;8DCB84;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;8DCB94;
    dw Instruction_PaletteFXObject_Done                                  ;8DCBA4;
    dw $003C,$7DE0,$7DE0,$7DE0,$7DE0,$0000,$0000,$0000                   ;8DCBA6;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;8DCBB6;
    dw Instruction_PaletteFXObject_Done                                  ;8DCBC6;
    dw $0006,$7E80,$7E80,$7E80,$7E80,$7E80,$0000,$0000                   ;8DCBC8;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;8DCBD8;
    dw Instruction_PaletteFXObject_Done                                  ;8DCBE8;
    dw $0006,$7F20,$7F20,$7F20,$7F20,$7F20,$7F20,$0000                   ;8DCBEA;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;8DCBFA;
    dw Instruction_PaletteFXObject_Done                                  ;8DCC0A;
    dw $0006,$7FFD,$7FE9,$7FE9,$7FE9,$7FE9,$7FE9,$7FE9                   ;8DCC0C;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;8DCC1C;
    dw Instruction_PaletteFXObject_Done                                  ;8DCC2C;
    dw $0006,$7FFD,$7FFD,$7FF3,$7FF3,$7FF3,$7FF3,$7FF3                   ;8DCC2E;
    dw $7FE9,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;8DCC3E;
    dw Instruction_PaletteFXObject_Done                                  ;8DCC4E;
    dw $0006,$7FFD,$7FFD,$7FFD,$7FF8,$7FF8,$7FF8,$7FF8                   ;8DCC50;
    dw $7FE9,$2940,$0000,$0000,$0000,$0000,$0000,$0000                   ;8DCC60;
    dw Instruction_PaletteFXObject_Done                                  ;8DCC70;
    dw $0006,$7FFD,$7FFD,$7FFD,$7FFD,$7FFD,$7FFD,$7FF8                   ;8DCC72;
    dw $7FF8,$7FE9,$2940,$0000,$0000,$0000,$0000,$0000                   ;8DCC82;
    dw Instruction_PaletteFXObject_Done                                  ;8DCC92;
    dw $0006,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF                   ;8DCC94;
    dw $7FFF,$7FFF,$7FE9,$2940,$0000,$0000,$0000,$0000                   ;8DCCA4;
    dw Instruction_PaletteFXObject_Done                                  ;8DCCB4;
    dw $0006,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF                   ;8DCCB6;
    dw $7FFF,$7FFF,$7FFF,$7FE9,$2940,$0000,$0000,$0000                   ;8DCCC6;
    dw Instruction_PaletteFXObject_Done                                  ;8DCCD6;
    dw $0006,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF                   ;8DCCD8;
    dw $7FFF,$7FFF,$7FFF,$7FFF,$7FE9,$2940,$0000,$0000                   ;8DCCE8;
    dw Instruction_PaletteFXObject_Done                                  ;8DCCF8;
    dw $0006,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF                   ;8DCCFA;
    dw $7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FE9,$2940,$0000                   ;8DCD0A;
    dw Instruction_PaletteFXObject_Done                                  ;8DCD1A;
    dw $0006,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF                   ;8DCD1C;
    dw $7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FE9,$6B40                   ;8DCD2C;
    dw Instruction_PaletteFXObject_Done                                  ;8DCD3C;
    dw $0006,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF                   ;8DCD3E;
    dw $7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FF7                   ;8DCD4E;
    dw Instruction_PaletteFXObject_Done                                  ;8DCD5E;
    dw Instruction_Delete_8DC5CF                                         ;8DCD60;

InstList_PaletteFXObject_ZebesExplosionFinale:
    dw Instruction_PaletteFXObject_ColorIndexInY                         ;8DCD62;
    dw $0002,$0002,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF                   ;8DCD64;
    dw $7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF                   ;8DCD74;
    dw $7FFF                                                             ;8DCD84;
    dw Instruction_PaletteFXObject_Done                                  ;8DCD86;
    dw $0002,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF                   ;8DCD88;
    dw $7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$77BD                   ;8DCD98;
    dw Instruction_PaletteFXObject_Done                                  ;8DCDA8;
    dw $0002,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF                   ;8DCDAA;
    dw $7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$77BD,$6F7B                   ;8DCDBA;
    dw Instruction_PaletteFXObject_Done                                  ;8DCDCA;
    dw $0002,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF                   ;8DCDCC;
    dw $7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$77BD,$6F7B,$6318                   ;8DCDDC;
    dw Instruction_PaletteFXObject_Done                                  ;8DCDEC;
    dw $0002,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF                   ;8DCDEE;
    dw $7FFF,$7FFF,$7FFF,$7FFF,$77BD,$6F7B,$6318,$5AD6                   ;8DCDFE;
    dw Instruction_PaletteFXObject_Done                                  ;8DCE0E;
    dw $0002,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF                   ;8DCE10;
    dw $7FFF,$7FFF,$7FFF,$77BD,$6F7B,$6318,$5AD6,$5294                   ;8DCE20;
    dw Instruction_PaletteFXObject_Done                                  ;8DCE30;
    dw $0002,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF                   ;8DCE32;
    dw $7FFF,$7FFF,$77BD,$6F7B,$6318,$5AD6,$5294,$4A52                   ;8DCE42;
    dw Instruction_PaletteFXObject_Done                                  ;8DCE52;
    dw $0002,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF                   ;8DCE54;
    dw $7FFF,$77BD,$6F7B,$6318,$5AD6,$5294,$4A52,$4210                   ;8DCE64;
    dw Instruction_PaletteFXObject_Done                                  ;8DCE74;
    dw $0002,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF                   ;8DCE76;
    dw $77BD,$6F7B,$6318,$5AD6,$5294,$4A52,$4210,$35AD                   ;8DCE86;
    dw Instruction_PaletteFXObject_Done                                  ;8DCE96;
    dw $0002,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$77BD                   ;8DCE98;
    dw $6F7B,$6318,$5AD6,$5294,$4A52,$4210,$35AD,$2D6B                   ;8DCEA8;
    dw Instruction_PaletteFXObject_Done                                  ;8DCEB8;
    dw $0002,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$77BD,$6F7B                   ;8DCEBA;
    dw $6318,$5AD6,$5294,$4A52,$4210,$35AD,$2D6B,$2529                   ;8DCECA;
    dw Instruction_PaletteFXObject_Done                                  ;8DCEDA;
    dw $0002,$7FFF,$7FFF,$7FFF,$7FFF,$77BD,$6F7B,$6318                   ;8DCEDC;
    dw $5AD6,$5294,$4A52,$4210,$35AD,$2D6B,$2529,$1CE7                   ;8DCEEC;
    dw Instruction_PaletteFXObject_Done                                  ;8DCEFC;
    dw $0002,$7FFF,$7FFF,$7FFF,$77BD,$6F7B,$6318,$5AD6                   ;8DCEFE;
    dw $5294,$4A52,$4210,$35AD,$2D6B,$2529,$1CE7,$14A5                   ;8DCF0E;
    dw Instruction_PaletteFXObject_Done                                  ;8DCF1E;
    dw $0002,$7FFF,$7FFF,$77BD,$6F7B,$6318,$5AD6,$5294                   ;8DCF20;
    dw $4A52,$4210,$35AD,$2D6B,$2529,$1CE7,$14A5,$0842                   ;8DCF30;
    dw Instruction_PaletteFXObject_Done                                  ;8DCF40;
    dw $0002,$7FFF,$77BD,$6F7B,$6318,$5AD6,$5294,$4A52                   ;8DCF42;
    dw $4210,$35AD,$2D6B,$2529,$1CE7,$14A5,$0842,$0000                   ;8DCF52;
    dw Instruction_PaletteFXObject_Done                                  ;8DCF62;
    dw $0009,$7FFF,$77BD,$6F7B,$6318,$5AD6,$5294,$4A52                   ;8DCF64;
    dw $4210,$35AD,$2D6B,$2529,$1CE7,$14A5,$0842,$0000                   ;8DCF74;
    dw Instruction_PaletteFXObject_Done                                  ;8DCF84;
    dw $0009,$0000,$7FFF,$77BD,$6F7B,$6318,$5AD6,$5294                   ;8DCF86;
    dw $4A52,$4210,$35AD,$2D6B,$2529,$1CE7,$14A5,$0842                   ;8DCF96;
    dw Instruction_PaletteFXObject_Done                                  ;8DCFA6;
    dw $0009,$0842,$0000,$7FFF,$77BD,$6F7B,$6318,$5AD6                   ;8DCFA8;
    dw $5294,$4A52,$4210,$35AD,$2D6B,$2529,$1CE7,$14A5                   ;8DCFB8;
    dw Instruction_PaletteFXObject_Done                                  ;8DCFC8;
    dw $0009,$14A5,$0842,$0000,$7FFF,$77BD,$6F7B,$6318                   ;8DCFCA;
    dw $5AD6,$5294,$4A52,$4210,$35AD,$2D6B,$2529,$1CE7                   ;8DCFDA;
    dw Instruction_PaletteFXObject_Done                                  ;8DCFEA;
    dw $0009,$1CE7,$14A5,$0842,$0000,$7FFF,$77BD,$6F7B                   ;8DCFEC;
    dw $6318,$5AD6,$5294,$4A52,$4210,$35AD,$2D6B,$2529                   ;8DCFFC;
    dw Instruction_PaletteFXObject_Done                                  ;8DD00C;
    dw $0009,$2529,$1CE7,$14A5,$0842,$0000,$7FFF,$77BD                   ;8DD00E;
    dw $6F7B,$6318,$5AD6,$5294,$4A52,$4210,$35AD,$2D6B                   ;8DD01E;
    dw Instruction_PaletteFXObject_Done                                  ;8DD02E;
    dw $0009,$2D6B,$2529,$1CE7,$14A5,$0842,$0000,$7FFF                   ;8DD030;
    dw $77BD,$6F7B,$6318,$5AD6,$5294,$4A52,$4210,$35AD                   ;8DD040;
    dw Instruction_PaletteFXObject_Done                                  ;8DD050;
    dw $0009,$35AD,$2D6B,$2529,$1CE7,$14A5,$0842,$0000                   ;8DD052;
    dw $7FFF,$77BD,$6F7B,$6318,$5AD6,$5294,$4A52,$4210                   ;8DD062;
    dw Instruction_PaletteFXObject_Done                                  ;8DD072;
    dw $0009,$4A52,$35AD,$2D6B,$2529,$1CE7,$14A5,$0842                   ;8DD074;
    dw $0000,$7FFF,$77BD,$6F7B,$6318,$5AD6,$5294,$4A52                   ;8DD084;
    dw Instruction_PaletteFXObject_Done                                  ;8DD094;
    dw $0009,$5294,$4A52,$35AD,$2D6B,$2529,$1CE7,$14A5                   ;8DD096;
    dw $0842,$0000,$7FFF,$77BD,$6F7B,$6318,$5AD6,$5294                   ;8DD0A6;
    dw Instruction_PaletteFXObject_Done                                  ;8DD0B6;
    dw $0009,$5AD6,$5294,$4A52,$35AD,$2D6B,$2529,$1CE7                   ;8DD0B8;
    dw $14A5,$0842,$0000,$7FFF,$77BD,$6F7B,$6318,$5AD6                   ;8DD0C8;
    dw Instruction_PaletteFXObject_Done                                  ;8DD0D8;
    dw $0009,$6318,$5AD6,$5294,$4A52,$35AD,$2D6B,$2529                   ;8DD0DA;
    dw $1CE7,$14A5,$0842,$0000,$7FFF,$77BD,$6F7B,$6318                   ;8DD0EA;
    dw Instruction_PaletteFXObject_Done                                  ;8DD0FA;
    dw $0009,$6F7B,$6318,$5AD6,$5294,$4A52,$35AD,$2D6B                   ;8DD0FC;
    dw $2529,$1CE7,$14A5,$0842,$0000,$7FFF,$77BD,$6F7B                   ;8DD10C;
    dw Instruction_PaletteFXObject_Done                                  ;8DD11C;
    dw $0009,$77BD,$6F7B,$6318,$5AD6,$5294,$4A52,$35AD                   ;8DD11E;
    dw $2D6B,$2529,$1CE7,$14A5,$0842,$0000,$7FFF,$77BD                   ;8DD12E;
    dw Instruction_PaletteFXObject_Done                                  ;8DD13E;
    dw $0009,$7FFF,$77BD,$6F7B,$6318,$5AD6,$5294,$4A52                   ;8DD140;
    dw $35AD,$2D6B,$2529,$1CE7,$14A5,$0842,$0000,$7FFF                   ;8DD150;
    dw Instruction_PaletteFXObject_Done                                  ;8DD160;
    dw $0009,$7FFF,$77BD,$6F7B,$6318,$5AD6,$5294,$4A52                   ;8DD162;
    dw $4210,$35AD,$2D6B,$2529,$1CE7,$14A5,$0842,$0000                   ;8DD172;
    dw Instruction_PaletteFXObject_Done                                  ;8DD182;
    dw $0009,$7FFF,$7FFF,$77BD,$6F7B,$6318,$5AD6,$5294                   ;8DD184;
    dw $4A52,$4210,$35AD,$2D6B,$2529,$1CE7,$14A5,$0842                   ;8DD194;
    dw Instruction_PaletteFXObject_Done                                  ;8DD1A4;
    dw $0009,$7FFF,$7FFF,$7FFF,$77BD,$6F7B,$6318,$5AD6                   ;8DD1A6;
    dw $5294,$4A52,$4210,$35AD,$2D6B,$2529,$1CE7,$14A5                   ;8DD1B6;
    dw Instruction_PaletteFXObject_Done                                  ;8DD1C6;
    dw $0009,$7FFF,$7FFF,$7FFF,$7FFF,$77BD,$6F7B,$6318                   ;8DD1C8;
    dw $5AD6,$5294,$4A52,$4210,$35AD,$2D6B,$2529,$1CE7                   ;8DD1D8;
    dw Instruction_PaletteFXObject_Done                                  ;8DD1E8;
    dw $0009,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$77BD,$6F7B                   ;8DD1EA;
    dw $6318,$5AD6,$5294,$4A52,$4210,$35AD,$2D6B,$2529                   ;8DD1FA;
    dw Instruction_PaletteFXObject_Done                                  ;8DD20A;
    dw $0009,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$77BD                   ;8DD20C;
    dw $6F7B,$6318,$5AD6,$5294,$4A52,$4210,$35AD,$2D6B                   ;8DD21C;
    dw Instruction_PaletteFXObject_Done                                  ;8DD22C;
    dw $0009,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF                   ;8DD22E;
    dw $77BD,$6F7B,$6318,$5AD6,$5294,$4A52,$4210,$35AD                   ;8DD23E;
    dw Instruction_PaletteFXObject_Done                                  ;8DD24E;
    dw $0009,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF                   ;8DD250;
    dw $7FFF,$77BD,$6F7B,$6318,$5AD6,$5294,$4A52,$4210                   ;8DD260;
    dw Instruction_PaletteFXObject_Done                                  ;8DD270;
    dw $0009,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF                   ;8DD272;
    dw $7FFF,$7FFF,$77BD,$6F7B,$6318,$5AD6,$5294,$4A52                   ;8DD282;
    dw Instruction_PaletteFXObject_Done                                  ;8DD292;
    dw $0009,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF                   ;8DD294;
    dw $7FFF,$7FFF,$7FFF,$77BD,$6F7B,$6318,$5AD6,$5294                   ;8DD2A4;
    dw Instruction_PaletteFXObject_Done                                  ;8DD2B4;
    dw $0009,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF                   ;8DD2B6;
    dw $7FFF,$7FFF,$7FFF,$7FFF,$77BD,$6F7B,$6318,$5AD6                   ;8DD2C6;
    dw Instruction_PaletteFXObject_Done                                  ;8DD2D6;
    dw $0009,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF                   ;8DD2D8;
    dw $7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$77BD,$6F7B,$6318                   ;8DD2E8;
    dw Instruction_PaletteFXObject_Done                                  ;8DD2F8;
    dw $0009,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF                   ;8DD2FA;
    dw $7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$77BD,$6F7B                   ;8DD30A;
    dw Instruction_PaletteFXObject_Done                                  ;8DD31A;
    dw $0009,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF                   ;8DD31C;
    dw $7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$77BD                   ;8DD32C;
    dw Instruction_PaletteFXObject_Done                                  ;8DD33C;
    dw $0009,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF                   ;8DD33E;
    dw $7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF                   ;8DD34E;
    dw Instruction_PaletteFXObject_Done                                  ;8DD35E;
    dw Instruction_Delete_8DC5CF                                         ;8DD360;

InstList_PaletteFXObject_WidePartOfZebesExplosion_Background:
    dw Instruction_PaletteFXObject_ColorIndexInY                         ;8DD362;
    dw $0022                                                             ;8DD364;
    dw Instruction_PaletteFXObject_GotoY                                 ;8DD366;
    dw InstList_PaletteFXObject_Common_ZebesExplosion                    ;8DD368;

InstList_PaletteFXObject_WhiteOutSpaceDuringZebesExplosion:
    dw Instruction_PaletteFXObject_ColorIndexInY                         ;8DD36A;
    dw $0000                                                             ;8DD36C;

InstList_PaletteFXObject_Common_ZebesExplosion:
    dw $000E,$0000                                                       ;8DD36E;
    dw Instruction_PaletteFXObject_Done                                  ;8DD372;
    dw $000E,$0842                                                       ;8DD374;
    dw Instruction_PaletteFXObject_Done                                  ;8DD378;
    dw $000E,$1084                                                       ;8DD37A;
    dw Instruction_PaletteFXObject_Done                                  ;8DD37E;
    dw $000E,$1CE7                                                       ;8DD380;
    dw Instruction_PaletteFXObject_Done                                  ;8DD384;
    dw $000E,$2529                                                       ;8DD386;
    dw Instruction_PaletteFXObject_Done                                  ;8DD38A;
    dw $000E,$2D6B                                                       ;8DD38C;
    dw Instruction_PaletteFXObject_Done                                  ;8DD390;
    dw $000E,$35AD                                                       ;8DD392;
    dw Instruction_PaletteFXObject_Done                                  ;8DD396;
    dw $000E,$3DEF                                                       ;8DD398;
    dw Instruction_PaletteFXObject_Done                                  ;8DD39C;
    dw $000E,$4A52                                                       ;8DD39E;
    dw Instruction_PaletteFXObject_Done                                  ;8DD3A2;
    dw $000E,$5294                                                       ;8DD3A4;
    dw Instruction_PaletteFXObject_Done                                  ;8DD3A8;
    dw $000E,$5AD6                                                       ;8DD3AA;
    dw Instruction_PaletteFXObject_Done                                  ;8DD3AE;
    dw $000E,$6318                                                       ;8DD3B0;
    dw Instruction_PaletteFXObject_Done                                  ;8DD3B4;
    dw $000E,$6B5A                                                       ;8DD3B6;
    dw Instruction_PaletteFXObject_Done                                  ;8DD3BA;
    dw $000E,$77BD                                                       ;8DD3BC;
    dw Instruction_PaletteFXObject_Done                                  ;8DD3C0;
    dw $000E,$7FFF                                                       ;8DD3C2;
    dw Instruction_PaletteFXObject_Done                                  ;8DD3C6;
    dw Instruction_Delete_8DC5CF                                         ;8DD3C8;

InstList_PaletteFXObject_ZebesExplosionPlanetAfterGlow_0:
    dw Instruction_PaletteFXObject_ColorIndexInY                         ;8DD3CA;
    dw $01C2                                                             ;8DD3CC;

InstList_PaletteFXObject_ZebesExplosionPlanetAfterGlow_1:
    dw $0010,$6B9C,$5EBB,$49FA,$3D58,$2CD4,$408F,$288A                   ;8DD3CE;
    dw $1C47                                                             ;8DD3DE;
    dw Instruction_PaletteFXObject_Done                                  ;8DD3E0;
    dw $0010,$77FF,$6B1E,$565D,$49BB,$3516,$44B0,$288B                   ;8DD3E2;
    dw $1C48                                                             ;8DD3F2;
    dw Instruction_PaletteFXObject_Done                                  ;8DD3F4;
    dw $0010,$7FFF,$777F,$62BF,$561E,$3937,$48D1,$288C                   ;8DD3F6;
    dw $1C49                                                             ;8DD406;
    dw Instruction_PaletteFXObject_Done                                  ;8DD408;
    dw $0010,$7FFF,$7FDF,$7F7F,$6ABF,$3D58,$5113,$2CAE                   ;8DD40A;
    dw $206B                                                             ;8DD41A;
    dw Instruction_PaletteFXObject_Done                                  ;8DD41C;
    dw $0010,$7FFF,$777F,$62BF,$561E,$3937,$48D1,$288C                   ;8DD41E;
    dw $1C49                                                             ;8DD42E;
    dw Instruction_PaletteFXObject_Done                                  ;8DD430;
    dw $0010,$77FF,$6B1E,$565D,$49BB,$3516,$44B0,$288B                   ;8DD432;
    dw $1C48                                                             ;8DD442;
    dw Instruction_PaletteFXObject_Done                                  ;8DD444;
    dw Instruction_PaletteFXObject_GotoY                                 ;8DD446;
    dw InstList_PaletteFXObject_ZebesExplosionPlanetAfterGlow_1          ;8DD448;

InstList_PaletteFXObject_ExplodingZebesLava_0:
    dw Instruction_PaletteFXObject_ColorIndexInY                         ;8DD44A;
    dw $0080                                                             ;8DD44C;

InstList_PaletteFXObject_ExplodingZebesLava_1:
    dw $0009,$0012                                                       ;8DD44E;
    dw Instruction_PaletteFXObject_Done                                  ;8DD452;
    dw $0008,$000F                                                       ;8DD454;
    dw Instruction_PaletteFXObject_Done                                  ;8DD458;
    dw $0007,$000C                                                       ;8DD45A;
    dw Instruction_PaletteFXObject_Done                                  ;8DD45E;
    dw $0006,$0009                                                       ;8DD460;
    dw Instruction_PaletteFXObject_Done                                  ;8DD464;
    dw $0005,$0006                                                       ;8DD466;
    dw Instruction_PaletteFXObject_Done                                  ;8DD46A;
    dw $0005,$0003                                                       ;8DD46C;
    dw Instruction_PaletteFXObject_Done                                  ;8DD470;
    dw $0006,$0006                                                       ;8DD472;
    dw Instruction_PaletteFXObject_Done                                  ;8DD476;
    dw $0007,$0009                                                       ;8DD478;
    dw Instruction_PaletteFXObject_Done                                  ;8DD47C;
    dw $0008,$000C                                                       ;8DD47E;
    dw Instruction_PaletteFXObject_Done                                  ;8DD482;
    dw $0009,$000F                                                       ;8DD484;
    dw Instruction_PaletteFXObject_Done                                  ;8DD488;
    dw Instruction_PaletteFXObject_GotoY                                 ;8DD48A;
    dw InstList_PaletteFXObject_ExplodingZebesLava_1                     ;8DD48C;

InstList_PaletteFXObject_FadeOutExplodingZebesCrust:
    dw Instruction_PaletteFXObject_ColorIndexInY                         ;8DD48E;
    dw $0082,$0014,$0864,$0884,$0CA6,$10C7,$0CC8,$0D07                   ;8DD490;
    dw $0D0A,$0CEC,$0D2C,$112C,$118E,$0D70,$11F4,$1633                   ;8DD4A0;
    dw $1698                                                             ;8DD4B0;
    dw Instruction_PaletteFXObject_Done                                  ;8DD4B2;
    dw $0014,$0443,$0463,$0885,$0CA6,$08A7,$08E6,$08E8                   ;8DD4B4;
    dw $08CA,$08EA,$0CEA,$0D4C,$092E,$0DB1,$11D0,$1235                   ;8DD4C4;
    dw Instruction_PaletteFXObject_Done                                  ;8DD4D4;
    dw $0014,$0443,$0463,$0864,$0C85,$0886,$08C5,$08C7                   ;8DD4D6;
    dw $08A9,$08C9,$0CC9,$0D2A,$090C,$0D6F,$0D8E,$0DF2                   ;8DD4E6;
    dw Instruction_PaletteFXObject_Done                                  ;8DD4F6;
    dw $0014,$0422,$0442,$0463,$0864,$0465,$04A4,$04A6                   ;8DD4F8;
    dw $0487,$04A7,$08A7,$08E8,$04CA,$092C,$0D4B,$0D8F                   ;8DD508;
    dw Instruction_PaletteFXObject_Done                                  ;8DD518;
    dw $0014,$0422,$0442,$0443,$0863,$0464,$0483,$0485                   ;8DD51A;
    dw $0466,$0486,$0886,$08C7,$04A8,$08EA,$0909,$094C                   ;8DD52A;
    dw Instruction_PaletteFXObject_Done                                  ;8DD53A;
    dw $0014,$0021,$0021,$0422,$0442,$0443,$0462,$0463                   ;8DD53C;
    dw $0444,$0464,$0464,$0485,$0486,$04A7,$04C7,$04E9                   ;8DD54C;
    dw Instruction_PaletteFXObject_Done                                  ;8DD55C;
    dw $0014,$0001,$0021,$0021,$0421,$0022,$0041,$0042                   ;8DD55E;
    dw $0023,$0043,$0443,$0463,$0044,$0465,$0484,$04A6                   ;8DD56E;
    dw Instruction_PaletteFXObject_Done                                  ;8DD57E;
    dw $0014,$0000,$0000,$0000,$0000,$0001,$0020,$0021                   ;8DD580;
    dw $0001,$0021,$0021,$0021,$0022,$0022,$0042,$0043                   ;8DD590;
    dw Instruction_PaletteFXObject_Done                                  ;8DD5A0;
    dw Instruction_Delete_8DC5CF                                         ;8DD5A2;

InstList_PaletteFXObject_FadeOutExplodingZebesGreyClouds:
    dw Instruction_PaletteFXObject_ColorIndexInY                         ;8DD5A4;
    dw $00A2,$000E,$0842,$0C63,$1084,$14A5,$18C6,$1CE7                   ;8DD5A6;
    dw $2108,$2529,$2D6B,$318C,$39CE,$4631,$4A52,$5294                   ;8DD5B6;
    dw $6318                                                             ;8DD5C6;
    dw Instruction_PaletteFXObject_Done                                  ;8DD5C8;
    dw $000E,$0421,$0842,$0C63,$1084,$14A5,$18C6,$1CE7                   ;8DD5CA;
    dw $1CE7,$2529,$294A,$318C,$39CE,$3DEF,$4631,$56B5                   ;8DD5DA;
    dw Instruction_PaletteFXObject_Done                                  ;8DD5EA;
    dw $000E,$0421,$0842,$0C63,$0C63,$1084,$14A5,$18C6                   ;8DD5EC;
    dw $18C6,$2108,$2529,$294A,$318C,$35AD,$3DEF,$4A52                   ;8DD5FC;
    dw Instruction_PaletteFXObject_Done                                  ;8DD60C;
    dw $000E,$0421,$0421,$0842,$0C63,$0C63,$1084,$14A5                   ;8DD60E;
    dw $14A5,$18C6,$1CE7,$2108,$294A,$2D6B,$318C,$3DEF                   ;8DD61E;
    dw Instruction_PaletteFXObject_Done                                  ;8DD62E;
    dw $000E,$0421,$0421,$0842,$0842,$0C63,$0C63,$1084                   ;8DD630;
    dw $1084,$14A5,$18C6,$1CE7,$2108,$2529,$294A,$318C                   ;8DD640;
    dw Instruction_PaletteFXObject_Done                                  ;8DD650;
    dw $000E,$0000,$0421,$0421,$0421,$0842,$0842,$0C63                   ;8DD652;
    dw $0C63,$1084,$1084,$14A5,$18C6,$18C6,$1CE7,$2529                   ;8DD662;
    dw Instruction_PaletteFXObject_Done                                  ;8DD672;
    dw $000E,$0000,$0000,$0421,$0421,$0421,$0421,$0842                   ;8DD674;
    dw $0842,$0842,$0C63,$0C63,$1084,$1084,$14A5,$18C6                   ;8DD684;
    dw Instruction_PaletteFXObject_Done                                  ;8DD694;
    dw $000E,$0000,$0000,$0000,$0000,$0000,$0000,$0421                   ;8DD696;
    dw $0421,$0421,$0421,$0421,$0842,$0842,$0842,$0C63                   ;8DD6A6;
    dw Instruction_PaletteFXObject_Done                                  ;8DD6B6;
    dw Instruction_Delete_8DC5CF                                         ;8DD6B8;

InstList_PaletteFXObject_GunshipEmergingFromZebesExplosion:
    dw Instruction_PaletteFXObject_ColorIndexInY                         ;8DD6BA;
    dw $00A0,$0018,$0000,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF                   ;8DD6BC;
    dw $7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF                   ;8DD6CC;
    dw $7FFF,$7FFF                                                       ;8DD6DC;
    dw Instruction_PaletteFXObject_Done                                  ;8DD6E0;
    dw $0018,$0000,$6F7B,$6B7B,$6B5A,$6B5A,$6B7B,$6B7B                   ;8DD6E2;
    dw $6B7B,$6B5B,$6F7A,$6B7A,$6B7A,$6F7B,$6F5A,$6B5A                   ;8DD6F2;
    dw $6B5B                                                             ;8DD702;
    dw Instruction_PaletteFXObject_Done                                  ;8DD704;
    dw $0018,$0000,$5F18,$5AF8,$5AD6,$5AD6,$5B18,$5AF7                   ;8DD706;
    dw $5AF7,$5AD7,$5F16,$5AF6,$5AF6,$5EF7,$5ED6,$5AD6                   ;8DD716;
    dw $5AD7                                                             ;8DD726;
    dw Instruction_PaletteFXObject_Done                                  ;8DD728;
    dw $0018,$0000,$4EB5,$4694,$4652,$4631,$4A94,$4674                   ;8DD72A;
    dw $4673,$4653,$4EB1,$4A71,$4A71,$4E73,$4E52,$4A52                   ;8DD73A;
    dw $4A33                                                             ;8DD74A;
    dw Instruction_PaletteFXObject_Done                                  ;8DD74C;
    dw $0018,$0000,$4231,$3611,$35CE,$35AD,$3631,$3610                   ;8DD74E;
    dw $35F0,$35CF,$3E2D,$3A0D,$35ED,$41EF,$3DCE,$39AD                   ;8DD75E;
    dw $35AF                                                             ;8DD76E;
    dw Instruction_PaletteFXObject_Done                                  ;8DD770;
    dw $0018,$0000,$31CE,$21AD,$214A,$2108,$25AD,$218D                   ;8DD772;
    dw $216C,$214B,$2DC8,$2988,$2568,$316B,$2D4A,$2929                   ;8DD782;
    dw $250B                                                             ;8DD792;
    dw Instruction_PaletteFXObject_Done                                  ;8DD794;
    dw $0018,$0000,$216B,$112A,$10C6,$1084,$154A,$1109                   ;8DD796;
    dw $10E8,$10C7,$1D64,$1904,$14E4,$20E7,$1CC6,$18A5                   ;8DD7A6;
    dw $1487                                                             ;8DD7B6;
    dw Instruction_PaletteFXObject_Done                                  ;8DD7B8;
    dw $0018,$0000,$1508,$00C7,$0042,$0000,$04E7,$00A6                   ;8DD7BA;
    dw $0085,$0043,$1100,$08A0,$0460,$1484,$0C42,$0821                   ;8DD7CA;
    dw $0404                                                             ;8DD7DA;
    dw Instruction_PaletteFXObject_Done                                  ;8DD7DC;
    dw $0018,$0000,$1508,$00C7,$0042,$0000,$04E7,$00A6                   ;8DD7DE;
    dw $0085,$0043,$1100,$08A0,$0460,$1484,$0C42,$0821                   ;8DD7EE;
    dw $0000                                                             ;8DD7FE;
    dw Instruction_PaletteFXObject_Done                                  ;8DD800;
    dw $0018,$0000,$1D6B,$010A,$0063,$0000,$094A,$00E8                   ;8DD802;
    dw $00C7,$0064,$1560,$0CE0,$0880,$1CC6,$1063,$0C42                   ;8DD812;
    dw $0000                                                             ;8DD822;
    dw Instruction_PaletteFXObject_Done                                  ;8DD824;
    dw $0018,$0000,$25CE,$014C,$0064,$0000,$098C,$012B                   ;8DD826;
    dw $00E9,$0086,$1DE0,$1120,$08C0,$24E7,$1884,$1042                   ;8DD836;
    dw $0000                                                             ;8DD846;
    dw Instruction_PaletteFXObject_Done                                  ;8DD848;
    dw $0018,$0000,$2E31,$018F,$0085,$0000,$0DEF,$016D                   ;8DD84A;
    dw $012B,$00A7,$2240,$1560,$0CE0,$2D29,$1CA5,$1463                   ;8DD85A;
    dw $0000                                                             ;8DD86A;
    dw Instruction_PaletteFXObject_Done                                  ;8DD86C;
    dw $0018,$0000,$3295,$05F1,$00A7,$0000,$0E32,$01AF                   ;8DD86E;
    dw $014C,$00E9,$2AA0,$19C0,$0D00,$314A,$20C6,$1463                   ;8DD87E;
    dw $0000                                                             ;8DD88E;
    dw Instruction_PaletteFXObject_Done                                  ;8DD890;
    dw $0018,$0000,$3AF8,$0634,$00C8,$0000,$1295,$01F1                   ;8DD892;
    dw $018E,$010A,$2F00,$1E00,$1120,$398C,$24E7,$1884                   ;8DD8A2;
    dw $0000                                                             ;8DD8B2;
    dw Instruction_PaletteFXObject_Done                                  ;8DD8B4;
    dw $0018,$0000,$435B,$0676,$00C9,$0000,$12D7,$0234                   ;8DD8B6;
    dw $01B0,$012C,$3780,$2240,$1160,$41AD,$2D08,$1C84                   ;8DD8C6;
    dw $0000                                                             ;8DD8D6;
    dw Instruction_PaletteFXObject_Done                                  ;8DD8D8;
    dw $0018,$0000,$4BBE,$06B9,$00EA,$0000,$173A,$0276                   ;8DD8DA;
    dw $01F2,$014D,$3BE0,$2680,$1580,$49EF,$3129,$20A5                   ;8DD8EA;
    dw $0000                                                             ;8DD8FA;
    dw Instruction_PaletteFXObject_Done                                  ;8DD8FC;
    dw Instruction_Delete_8DC5CF                                         ;8DD8FE;

InstList_PaletteFXObject_HyperBeam_0:
    dw Instruction_PaletteFXObject_ColorIndexInY                         ;8DD900;
    dw $01C2                                                             ;8DD902;

InstList_PaletteFXObject_HyperBeam_1:
    dw $0002,$7FFF,$661F,$351F,$001F,$673F,$4E7F,$319F                   ;8DD904;
    dw $18DF                                                             ;8DD914;
    dw Instruction_PaletteFXObject_Done                                  ;8DD916;
    dw $0002,$7FFF,$36BD,$1D9B,$00D9,$6B9F,$4F3F,$2EDF                   ;8DD918;
    dw $0E7F                                                             ;8DD928;
    dw Instruction_PaletteFXObject_Done                                  ;8DD92A;
    dw $0002,$7FFF,$033B,$0216,$0173,$6BFF,$4BFF,$2BFF                   ;8DD92C;
    dw $03FF                                                             ;8DD93C;
    dw Instruction_PaletteFXObject_Done                                  ;8DD93E;
    dw $0002,$7FFF,$1F8E,$164B,$0D8A,$6BFD,$4BF9,$2BF5                   ;8DD940;
    dw $03F0                                                             ;8DD950;
    dw Instruction_PaletteFXObject_Done                                  ;8DD952;
    dw $0002,$7FFF,$3BE0,$2680,$1580,$6BFA,$4BF2,$2BEA                   ;8DD954;
    dw $03E0                                                             ;8DD964;
    dw Instruction_PaletteFXObject_Done                                  ;8DD966;
    dw $0002,$7FFF,$5F60,$4A40,$3540,$77B4,$5F8E,$4B28                   ;8DD968;
    dw $3301                                                             ;8DD978;
    dw Instruction_PaletteFXObject_Done                                  ;8DD97A;
    dw $0002,$7FFF,$7EC0,$6DE0,$54E0,$7F6E,$730A,$6665                   ;8DD97C;
    dw $5E22                                                             ;8DD98C;
    dw Instruction_PaletteFXObject_Done                                  ;8DD98E;
    dw $0002,$7FFF,$7D70,$650B,$4486,$7F37,$7A75,$71B2                   ;8DD990;
    dw $652E                                                             ;8DD9A0;
    dw Instruction_PaletteFXObject_Done                                  ;8DD9A2;
    dw $0002,$7FFF,$7C1F,$5816,$300C,$7EDF,$7DDF,$7CDF                   ;8DD9A4;
    dw $681A                                                             ;8DD9B4;
    dw Instruction_PaletteFXObject_Done                                  ;8DD9B6;
    dw $0002,$7FFF,$711F,$489B,$1816,$731F,$663F,$593F                   ;8DD9B8;
    dw $407D                                                             ;8DD9C8;
    dw Instruction_PaletteFXObject_Done                                  ;8DD9CA;
    dw Instruction_PaletteFXObject_GotoY                                 ;8DD9CC;
    dw InstList_PaletteFXObject_HyperBeam_1                              ;8DD9CE;

UNUSED_InstList_PaletteFXObject_8DD9D0:
    dw Instruction_PaletteFXObject_ColorIndexInY                         ;8DD9D0;
    dw $00A0,$0002,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF                   ;8DD9D2;
    dw $7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF                   ;8DD9E2;
    dw $7FFF,$7FFF                                                       ;8DD9F2;
    dw Instruction_PaletteFXObject_Done                                  ;8DD9F6;
    dw $0002,$739C,$77BD,$73BD,$73BD,$739C,$77BD,$73BD                   ;8DD9F8;
    dw $73BD,$73BD,$77BC,$77BC,$77BC,$77BD,$77BD,$77BD                   ;8DDA08;
    dw $77BD                                                             ;8DDA18;
    dw Instruction_PaletteFXObject_Done                                  ;8DDA1A;
    dw $0002,$6B5A,$6F9C,$6B7B,$6B7B,$6B5A,$6F7B,$6B7B                   ;8DDA1C;
    dw $6B7B,$6B7B,$6F9A,$6F7A,$6F7A,$6F7B,$6F7B,$6F7B                   ;8DDA2C;
    dw $739C                                                             ;8DDA3C;
    dw Instruction_PaletteFXObject_Done                                  ;8DDA3E;
    dw $0002,$6318,$675A,$635A,$6339,$6318,$675A,$635A                   ;8DDA40;
    dw $6339,$6339,$6758,$6758,$6738,$6739,$6739,$6739                   ;8DDA50;
    dw $6B5A                                                             ;8DDA60;
    dw Instruction_PaletteFXObject_Done                                  ;8DDA62;
    dw $0002,$5AD6,$6339,$5B18,$5AF7,$5AD6,$5F18,$5B18                   ;8DDA64;
    dw $5AF8,$5AF7,$5F36,$5F16,$5EF6,$62F7,$5EF7,$5EF7                   ;8DDA74;
    dw $6739                                                             ;8DDA84;
    dw Instruction_PaletteFXObject_Done                                  ;8DDA86;
    dw $0002,$5294,$5AF7,$52D7,$52B5,$5294,$56F7,$52D7                   ;8DDA88;
    dw $52D6,$52B6,$5AF4,$56D4,$56B4,$5AD6,$56B5,$56B5                   ;8DDA98;
    dw $5EF7                                                             ;8DDAA8;
    dw Instruction_PaletteFXObject_Done                                  ;8DDAAA;
    dw $0002,$4A52,$52D6,$4AB5,$4A73,$4A52,$4EB5,$4AB5                   ;8DDAAC;
    dw $4A94,$4A74,$52D2,$4EB2,$4E72,$5294,$4E73,$4E73                   ;8DDABC;
    dw $5AD6                                                             ;8DDACC;
    dw Instruction_PaletteFXObject_Done                                  ;8DDACE;
    dw $0002,$4210,$4A94,$4274,$4231,$4210,$4694,$4273                   ;8DDAD0;
    dw $4252,$4232,$4A90,$4670,$4630,$4A52,$4631,$4631                   ;8DDAE0;
    dw $5294                                                             ;8DDAF0;
    dw Instruction_PaletteFXObject_Done                                  ;8DDAF2;
    dw $0002,$39CE,$4673,$3A32,$39F0,$39CE,$3E52,$3A32                   ;8DDAF4;
    dw $3A11,$3A10,$426E,$3E2E,$3E0E,$4610,$41EF,$3DEF                   ;8DDB04;
    dw $4E73                                                             ;8DDB14;
    dw Instruction_PaletteFXObject_Done                                  ;8DDB16;
    dw $0002,$318C,$3E31,$3211,$31AE,$318C,$3631,$3210                   ;8DDB18;
    dw $31CF,$31CE,$3A2C,$360C,$35CC,$3DCE,$39AD,$35AD                   ;8DDB28;
    dw $4631                                                             ;8DDB38;
    dw Instruction_PaletteFXObject_Done                                  ;8DDB3A;
    dw $0002,$294A,$3610,$29CF,$296C,$294A,$2DEF,$29CF                   ;8DDB3C;
    dw $29AD,$298D,$360A,$2DCA,$2D8A,$35AD,$316B,$2D6B                   ;8DDB4C;
    dw $4210                                                             ;8DDB5C;
    dw Instruction_PaletteFXObject_Done                                  ;8DDB5E;
    dw Instruction_Delete_8DC5CF                                         ;8DDB60;

InstList_PaletteFXObject_SamusLoading_PowerSuit_0:
    dw Instruction_PaletteFXObject_ColorIndexInY                         ;8DDB62;
    dw $0180                                                             ;8DDB64;
    dw Instruction_PaletteFXObject_TimerInY                              ;8DDB66;
    db $24                                                               ;8DDB68;

InstList_PaletteFXObject_SamusLoading_PowerSuit_1:
    dw $0003,$3800,$0108,$03BD,$1405,$3BE0,$21A8,$579F                   ;8DDB69;
    dw $4AD2,$3A4E,$00BB,$02B5,$016B,$0252,$1104,$0074                   ;8DDB79;
    dw $000D                                                             ;8DDB89;
    dw Instruction_PaletteFXObject_Done                                  ;8DDB8B;
    dw $0003,$0000,$52AE,$5FBD,$65E5,$7FE0,$7388,$7FFF                   ;8DDB8D;
    dw $7FF2,$7FEE,$569B,$5F55,$5E0B,$53F6,$62E4,$5254                   ;8DDB9D;
    dw $51ED                                                             ;8DDBAD;
    dw Instruction_PaletteFXObject_Done                                  ;8DDBAF;
    dw Instruction_PaletteFXObject_DecrementTimer_GotoYIfNonZero         ;8DDBB1;
    dw InstList_PaletteFXObject_SamusLoading_PowerSuit_1                 ;8DDBB3;
    dw Instruction_PaletteFXObject_TimerInY                              ;8DDBB5;
    db $03                                                               ;8DDBB7;

InstList_PaletteFXObject_SamusLoading_PowerSuit_2:
    dw $0003,$3800,$0108,$03BD,$1405,$3BE0,$21A8,$579F                   ;8DDBB8;
    dw $4AD2,$3A4E,$00BB,$02B5,$016B,$0252,$1104,$0074                   ;8DDBC8;
    dw $000D                                                             ;8DDBD8;
    dw Instruction_PaletteFXObject_Done                                  ;8DDBDA;
    dw $0003,$0000,$52AE,$5FBD,$65E5,$7FE0,$7388,$7FFF                   ;8DDBDC;
    dw $7FF2,$7FEE,$569B,$5F55,$5E0B,$53F6,$62E4,$5254                   ;8DDBEC;
    dw $51ED                                                             ;8DDBFC;
    dw Instruction_PaletteFXObject_Done                                  ;8DDBFE;
    dw Instruction_PaletteFXObject_DecrementTimer_GotoYIfNonZero         ;8DDC00;
    dw InstList_PaletteFXObject_SamusLoading_PowerSuit_2                 ;8DDC02;
    dw Instruction_PaletteFXObject_TimerInY                              ;8DDC04;
    db $03                                                               ;8DDC06;

InstList_PaletteFXObject_SamusLoading_PowerSuit_3:
    dw $0003,$3800,$0108,$03BD,$1405,$3BE0,$21A8,$579F                   ;8DDC07;
    dw $4AD2,$3A4E,$00BB,$02B5,$016B,$0252,$1104,$0074                   ;8DDC17;
    dw $000D                                                             ;8DDC27;
    dw Instruction_PaletteFXObject_Done                                  ;8DDC29;
    dw $0003,$2003,$516E,$4BBD,$64A5,$7FE0,$7248,$7FFF                   ;8DDC2B;
    dw $7F72,$7EEE,$555B,$4AB5,$496B,$52B6,$61A4,$5114                   ;8DDC3B;
    dw $50AD                                                             ;8DDC4B;
    dw Instruction_PaletteFXObject_Done                                  ;8DDC4D;
    dw Instruction_PaletteFXObject_DecrementTimer_GotoYIfNonZero         ;8DDC4F;
    dw InstList_PaletteFXObject_SamusLoading_PowerSuit_3                 ;8DDC51;
    dw Instruction_PaletteFXObject_TimerInY                              ;8DDC53;
    db $02                                                               ;8DDC55;

InstList_PaletteFXObject_SamusLoading_PowerSuit_4:
    dw $0003,$3800,$0108,$03BD,$1405,$3BE0,$21A8,$579F                   ;8DDC56;
    dw $4AD2,$3A4E,$00BB,$02B5,$016B,$0252,$1104,$0074                   ;8DDC66;
    dw $000D                                                             ;8DDC76;
    dw Instruction_PaletteFXObject_Done                                  ;8DDC78;
    dw $0003,$2003,$28CE,$37BD,$3C05,$63E0,$49A8,$7F9F                   ;8DDC7A;
    dw $72D2,$624E,$28BB,$36B5,$356B,$2A16,$3904,$2874                   ;8DDC8A;
    dw $280D                                                             ;8DDC9A;
    dw Instruction_PaletteFXObject_Done                                  ;8DDC9C;
    dw Instruction_PaletteFXObject_DecrementTimer_GotoYIfNonZero         ;8DDC9E;
    dw InstList_PaletteFXObject_SamusLoading_PowerSuit_4                 ;8DDCA0;
    dw $0001,$3800,$0108,$03BD,$1405,$3BE0,$21A8,$579F                   ;8DDCA2;
    dw $4AD2,$3A4E,$00BB,$02B5,$016B,$0252,$1104,$0074                   ;8DDCB2;
    dw $000D                                                             ;8DDCC2;
    dw Instruction_PaletteFXObject_Done                                  ;8DDCC4;
    dw Instruction_Delete_8DC5CF                                         ;8DDCC6;

InstList_PaletteFXObject_SamusLoading_VairaSuit_0:
    dw Instruction_PaletteFXObject_ColorIndexInY                         ;8DDCC8;
    dw $0180                                                             ;8DDCCA;
    dw Instruction_PaletteFXObject_TimerInY                              ;8DDCCC;
    db $24                                                               ;8DDCCE;

InstList_PaletteFXObject_SamusLoading_VairaSuit_1:
    dw $0003,$0000,$0108,$02FF,$1405,$3BE0,$21A8,$579F                   ;8DDCCF;
    dw $4AD2,$3A4E,$00BB,$01BE,$008E,$0252,$1104,$0074                   ;8DDCDF;
    dw $000D                                                             ;8DDCEF;
    dw Instruction_PaletteFXObject_Done                                  ;8DDCF1;
    dw $0003,$0000,$79A8,$7B9F,$65E5,$7FE0,$7388,$7FFF                   ;8DDCF3;
    dw $7FF2,$7FEE,$569B,$765E,$752E,$524D,$62E4,$5254                   ;8DDD03;
    dw $51ED                                                             ;8DDD13;
    dw Instruction_PaletteFXObject_Done                                  ;8DDD15;
    dw Instruction_PaletteFXObject_DecrementTimer_GotoYIfNonZero         ;8DDD17;
    dw InstList_PaletteFXObject_SamusLoading_VairaSuit_1                 ;8DDD19;
    dw Instruction_PaletteFXObject_TimerInY                              ;8DDD1B;
    db $03                                                               ;8DDD1D;

InstList_PaletteFXObject_SamusLoading_VairaSuit_2:
    dw $0003,$0000,$0108,$02FF,$1405,$3BE0,$21A8,$579F                   ;8DDD1E;
    dw $4AD2,$3A4E,$00BB,$01BE,$008E,$0252,$1104,$0074                   ;8DDD2E;
    dw $000D                                                             ;8DDD3E;
    dw Instruction_PaletteFXObject_Done                                  ;8DDD40;
    dw $0003,$0000,$79A8,$7B9F,$65E5,$7FE0,$7388,$7FFF                   ;8DDD42;
    dw $7FF2,$7FEE,$569B,$765E,$752E,$524D,$62E4,$5254                   ;8DDD52;
    dw $51ED                                                             ;8DDD62;
    dw Instruction_PaletteFXObject_Done                                  ;8DDD64;
    dw Instruction_PaletteFXObject_DecrementTimer_GotoYIfNonZero         ;8DDD66;
    dw InstList_PaletteFXObject_SamusLoading_VairaSuit_2                 ;8DDD68;
    dw Instruction_PaletteFXObject_TimerInY                              ;8DDD6A;
    db $03                                                               ;8DDD6C;

InstList_PaletteFXObject_SamusLoading_VairaSuit_3:
    dw $0003,$0000,$0108,$02FF,$1405,$3BE0,$21A8,$579F                   ;8DDD6D;
    dw $4AD2,$3A4E,$00BB,$01BE,$008E,$0252,$1104,$0074                   ;8DDD7D;
    dw $000D                                                             ;8DDD8D;
    dw Instruction_PaletteFXObject_Done                                  ;8DDD8F;
    dw $0003,$2003,$5108,$52FF,$64A5,$7FE0,$7248,$7FFF                   ;8DDD91;
    dw $7F72,$7EEE,$555B,$51BE,$508E,$3E4D,$61A4,$5114                   ;8DDDA1;
    dw $50AD                                                             ;8DDDB1;
    dw Instruction_PaletteFXObject_Done                                  ;8DDDB3;
    dw Instruction_PaletteFXObject_DecrementTimer_GotoYIfNonZero         ;8DDDB5;
    dw InstList_PaletteFXObject_SamusLoading_VairaSuit_3                 ;8DDDB7;
    dw Instruction_PaletteFXObject_TimerInY                              ;8DDDB9;
    db $02                                                               ;8DDDBB;

InstList_PaletteFXObject_SamusLoading_VairaSuit_4:
    dw $0003,$0000,$0108,$02FF,$1405,$3BE0,$21A8,$579F                   ;8DDDBC;
    dw $4AD2,$3A4E,$00BB,$01BE,$008E,$0252,$1104,$0074                   ;8DDDCC;
    dw $000D                                                             ;8DDDDC;
    dw Instruction_PaletteFXObject_Done                                  ;8DDDDE;
    dw $0003,$2003,$2908,$2AFF,$3C05,$63E0,$49A8,$7F9F                   ;8DDDE0;
    dw $72D2,$624E,$28BB,$29BE,$288E,$2A4D,$3904,$2874                   ;8DDDF0;
    dw $280D                                                             ;8DDE00;
    dw Instruction_PaletteFXObject_Done                                  ;8DDE02;
    dw Instruction_PaletteFXObject_DecrementTimer_GotoYIfNonZero         ;8DDE04;
    dw InstList_PaletteFXObject_SamusLoading_VairaSuit_4                 ;8DDE06;
    dw $0001,$0000,$0108,$02FF,$1405,$3BE0,$21A8,$579F                   ;8DDE08;
    dw $4AD2,$3A4E,$00BB,$01BE,$008E,$0252,$1104,$0074                   ;8DDE18;
    dw $000D                                                             ;8DDE28;
    dw Instruction_PaletteFXObject_Done                                  ;8DDE2A;
    dw Instruction_Delete_8DC5CF                                         ;8DDE2C;

InstList_PaletteFXObject_SamusLoading_GravitySuit_0:
    dw Instruction_PaletteFXObject_ColorIndexInY                         ;8DDE2E;
    dw $0180                                                             ;8DDE30;
    dw Instruction_PaletteFXObject_TimerInY                              ;8DDE32;
    db $24                                                               ;8DDE34;

InstList_PaletteFXObject_SamusLoading_GravitySuit_1:
    dw $0003,$3800,$0108,$421F,$1405,$3BE0,$21A8,$579F                   ;8DDE35;
    dw $4AD2,$3A4E,$00BB,$5914,$30AA,$0274,$1104,$0074                   ;8DDE45;
    dw $000D                                                             ;8DDE55;
    dw Instruction_PaletteFXObject_Done                                  ;8DDE57;
    dw $0003,$0000,$52AE,$7FFF,$65E5,$7FE0,$7388,$7FFF                   ;8DDE59;
    dw $7FF2,$7FEE,$569B,$7EF4,$7E8A,$53F6,$62E4,$5254                   ;8DDE69;
    dw $51ED                                                             ;8DDE79;
    dw Instruction_PaletteFXObject_Done                                  ;8DDE7B;
    dw Instruction_PaletteFXObject_DecrementTimer_GotoYIfNonZero         ;8DDE7D;
    dw InstList_PaletteFXObject_SamusLoading_GravitySuit_1               ;8DDE7F;
    dw Instruction_PaletteFXObject_TimerInY                              ;8DDE81;
    db $03                                                               ;8DDE83;

InstList_PaletteFXObject_SamusLoading_GravitySuit_2:
    dw $0003,$3800,$0108,$421F,$1405,$3BE0,$21A8,$579F                   ;8DDE84;
    dw $4AD2,$3A4E,$00BB,$5914,$30AA,$0274,$1104,$0074                   ;8DDE94;
    dw $000D                                                             ;8DDEA4;
    dw Instruction_PaletteFXObject_Done                                  ;8DDEA6;
    dw $0003,$0000,$52AE,$7FFF,$65E5,$7FE0,$7388,$7FFF                   ;8DDEA8;
    dw $7FF2,$7FEE,$569B,$7EF4,$7E8A,$53F6,$62E4,$5254                   ;8DDEB8;
    dw $51ED                                                             ;8DDEC8;
    dw Instruction_PaletteFXObject_Done                                  ;8DDECA;
    dw Instruction_PaletteFXObject_DecrementTimer_GotoYIfNonZero         ;8DDECC;
    dw InstList_PaletteFXObject_SamusLoading_GravitySuit_2               ;8DDECE;
    dw Instruction_PaletteFXObject_TimerInY                              ;8DDED0;
    db $03                                                               ;8DDED2;

InstList_PaletteFXObject_SamusLoading_GravitySuit_3:
    dw $0003,$3800,$0108,$421F,$1405,$3BE0,$21A8,$579F                   ;8DDED3;
    dw $4AD2,$3A4E,$00BB,$5914,$30AA,$0274,$1104,$0074                   ;8DDEE3;
    dw $000D                                                             ;8DDEF3;
    dw Instruction_PaletteFXObject_Done                                  ;8DDEF5;
    dw $0003,$2003,$516E,$7EBF,$64A5,$7FE0,$7248,$7FFF                   ;8DDEF7;
    dw $7F72,$7EEE,$555B,$7DB4,$7D4A,$52B6,$61A4,$5114                   ;8DDF07;
    dw $50AD                                                             ;8DDF17;
    dw Instruction_PaletteFXObject_Done                                  ;8DDF19;
    dw Instruction_PaletteFXObject_DecrementTimer_GotoYIfNonZero         ;8DDF1B;
    dw InstList_PaletteFXObject_SamusLoading_GravitySuit_3               ;8DDF1D;
    dw Instruction_PaletteFXObject_TimerInY                              ;8DDF1F;
    db $02                                                               ;8DDF21;

InstList_PaletteFXObject_SamusLoading_GravitySuit_4:
    dw $0003,$3800,$0108,$421F,$1405,$3BE0,$21A8,$579F                   ;8DDF22;
    dw $4AD2,$3A4E,$00BB,$5914,$30AA,$0274,$1104,$0074                   ;8DDF32;
    dw $000D                                                             ;8DDF42;
    dw Instruction_PaletteFXObject_Done                                  ;8DDF44;
    dw $0003,$2003,$28CE,$6E1F,$3C05,$63E0,$49A8,$7F9F                   ;8DDF46;
    dw $72D2,$624E,$28BB,$7D14,$58AA,$2A16,$3904,$2874                   ;8DDF56;
    dw $280D                                                             ;8DDF66;
    dw Instruction_PaletteFXObject_Done                                  ;8DDF68;
    dw Instruction_PaletteFXObject_DecrementTimer_GotoYIfNonZero         ;8DDF6A;
    dw InstList_PaletteFXObject_SamusLoading_GravitySuit_4               ;8DDF6C;
    dw $0001,$3800,$0108,$421F,$1405,$3BE0,$21A8,$579F                   ;8DDF6E;
    dw $4AD2,$3A4E,$00BB,$5914,$30AA,$0274,$1104,$0074                   ;8DDF7E;
    dw $000D                                                             ;8DDF8E;
    dw Instruction_PaletteFXObject_Done                                  ;8DDF90;
    dw Instruction_Delete_8DC5CF                                         ;8DDF92;

InstList_PaletteFXObject_PostCreditsSuperMetroidIconGlare:
    dw Instruction_PaletteFXObject_ColorIndexInY                         ;8DDF94;
    dw $01E0,$0001,$2DEB,$119F,$10B2,$1088,$127F,$1153                   ;8DDF96;
    dw $10AC,$135F,$11D3,$10EC,$7BE4,$79C4,$4C84,$4BFF                   ;8DDFA6;
    dw $13FF,$28E7                                                       ;8DDFB6;
    dw Instruction_PaletteFXObject_Done                                  ;8DDFBA;
    dw $0001,$3A4E,$21FF,$2134,$210C,$22BF,$21B5,$212F                   ;8DDFBC;
    dw $237F,$2235,$216F,$7BE8,$7A28,$5508,$53FF,$23FF                   ;8DDFCC;
    dw $356B                                                             ;8DDFDC;
    dw Instruction_PaletteFXObject_Done                                  ;8DDFDE;
    dw $0001,$4691,$365F,$35B6,$35B0,$36FF,$3637,$35B2                   ;8DDFE0;
    dw $379F,$3697,$35F2,$7BED,$7A8D,$5DAD,$5BFF,$37FF                   ;8DDFF0;
    dw $45EF                                                             ;8DE000;
    dw Instruction_PaletteFXObject_Done                                  ;8DE002;
    dw $0001,$56F5,$46BF,$4658,$4633,$473F,$4699,$4655                   ;8DE004;
    dw $479F,$46D9,$4675,$7BF1,$7AD1,$6631,$63FF,$47FF                   ;8DE014;
    dw $5273                                                             ;8DE024;
    dw Instruction_PaletteFXObject_Done                                  ;8DE026;
    dw $0001,$6338,$5B1F,$5ADA,$5AD7,$5B7F,$5B1B,$5AD8                   ;8DE028;
    dw $5BBF,$5B3B,$5AF8,$7BF6,$7B36,$6ED6,$6BFF,$5BFF                   ;8DE038;
    dw $62F7                                                             ;8DE048;
    dw Instruction_PaletteFXObject_Done                                  ;8DE04A;
    dw $0001,$6F9B,$6B7F,$6B5C,$6B5B,$6BBF,$6B7D,$6B5B                   ;8DE04C;
    dw $6BDF,$6B9D,$6B7B,$7BFA,$7B9A,$775A,$73FF,$6BFF                   ;8DE05C;
    dw $6F7B                                                             ;8DE06C;
    dw Instruction_PaletteFXObject_Done                                  ;8DE06E;
    dw $0001,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF                   ;8DE070;
    dw $7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF                   ;8DE080;
    dw $7FFF                                                             ;8DE090;
    dw Instruction_PaletteFXObject_Done                                  ;8DE092;
    dw $0001,$6F9B,$6B7F,$6B5C,$6B5B,$6BBF,$6B7D,$6B5B                   ;8DE094;
    dw $6BDF,$6B9D,$6B7B,$7BFA,$7B9A,$775A,$73FF,$6BFF                   ;8DE0A4;
    dw $6F7B                                                             ;8DE0B4;
    dw Instruction_PaletteFXObject_Done                                  ;8DE0B6;
    dw $0001,$6338,$5B1F,$5ADA,$5AD7,$5B7F,$5B1B,$5AD8                   ;8DE0B8;
    dw $5BBF,$5B3B,$5AF8,$7BF6,$7B36,$6ED6,$6BFF,$5BFF                   ;8DE0C8;
    dw $62F7                                                             ;8DE0D8;
    dw Instruction_PaletteFXObject_Done                                  ;8DE0DA;
    dw $0001,$56F5,$46BF,$4658,$4633,$473F,$4699,$4655                   ;8DE0DC;
    dw $479F,$46D9,$4675,$7BF1,$7AD1,$6631,$63FF,$47FF                   ;8DE0EC;
    dw $5273                                                             ;8DE0FC;
    dw Instruction_PaletteFXObject_Done                                  ;8DE0FE;
    dw $0001,$4691,$365F,$35B6,$35B0,$36FF,$3637,$35B2                   ;8DE100;
    dw $379F,$3697,$35F2,$7BED,$7A8D,$5DAD,$5BFF,$37FF                   ;8DE110;
    dw $45EF                                                             ;8DE120;
    dw Instruction_PaletteFXObject_Done                                  ;8DE122;
    dw $0001,$3A4E,$21FF,$2134,$210C,$22BF,$21B5,$212F                   ;8DE124;
    dw $237F,$2235,$216F,$7BE8,$7A28,$5508,$53FF,$23FF                   ;8DE134;
    dw $356B                                                             ;8DE144;
    dw Instruction_PaletteFXObject_Done                                  ;8DE146;
    dw $0001,$2DEB,$119F,$10B2,$1088,$127F,$1153,$10AC                   ;8DE148;
    dw $135F,$11D3,$10EC,$7BE4,$79C4,$4C84,$4BFF,$13FF                   ;8DE158;
    dw $28E7                                                             ;8DE168;
    dw Instruction_PaletteFXObject_Done                                  ;8DE16A;
    dw $0001,$21A8,$013F,$0030,$0005,$025F,$00F2,$0029                   ;8DE16C;
    dw $035F,$0192,$0089,$7BE0,$7980,$4400,$43FF,$03FF                   ;8DE17C;
    dw $1C84                                                             ;8DE18C;
    dw Instruction_PaletteFXObject_Done                                  ;8DE18E;
    dw Instruction_Delete_8DC5CF                                         ;8DE190;

InstList_PaletteFXObject_Delete:
    dw Instruction_Delete_8DC5CF                                         ;8DE192;

PaletteFXObjects_FadeInSuperMetroidTitleLogo:
    dw RTS_8DC685                                                        ;8DE194;
    dw InstList_PaletteFXObject_FadeInSuperMetroidTitleLogo              ;8DE196;

PaletteFXObjects_FadeInNintendoBootLogoForUnusedCode:
    dw RTS_8DC685                                                        ;8DE198;
    dw InstList_PaletteFXObject_FadeInNintendoBootLogo                   ;8DE19A;

PaletteFXObjects_FadeInNintendoCopyright:
    dw RTS_8DC685                                                        ;8DE19C;
    dw InstList_PaletteFXObject_FadeInNintendoCopyright                  ;8DE19E;

PaletteFXObjects_TitleScreenBabyMetroidTubeLight:
    dw RTS_8DC685                                                        ;8DE1A0;
    dw InstList_PaletteFXObject_TitleScreenBabyMetroidTubeLight_0        ;8DE1A2;

PaletteFXObjects_TitleScreenFlickeringDisplays:
    dw RTS_8DC685                                                        ;8DE1A4;
    dw InstList_PaletteFXObject_TitleScreenFlickeringDisplays_0          ;8DE1A6;

PaletteFXObjects_CutsceneGunshipEngineFlicker:
    dw RTS_8DC685                                                        ;8DE1A8;
    dw InstList_PaletteFXObject_CutsceneGunshipEngineFlicker_0           ;8DE1AA;

PaletteFXObjects_CutsceneCeresNavigationLights_SpriteCeres:
    dw RTS_8DC685                                                        ;8DE1AC;
    dw InstList_PaletteFXObject_CutsceneCeresNavigationLight_Sprite      ;8DE1AE;

PaletteFXObjects_FadeInPlanetZebesText:
    dw RTS_8DC685                                                        ;8DE1B0;
    dw InstList_PaletteFXObject_FadeInPlanetZebesText                    ;8DE1B2;

PaletteFXObjects_FadeOutPlanetZebesText:
    dw RTS_8DC685                                                        ;8DE1B4;
    dw InstList_PaletteFXObject_FadeOutPlanetZebesText                   ;8DE1B6;

PaletteFXObjects_CutsceneCeresNavigationLights_BGCeres:
    dw RTS_8DC685                                                        ;8DE1B8;
    dw InstList_PaletteFXObject_CutsceneCeresNavigationLights_BG         ;8DE1BA;

PaletteFXObjects_OldMotherBrainFightBackgroundLights:
    dw Setup_PaletteFXObject_OldMotherBrainFightBackgroundLights         ;8DE1BC;
    dw InstList_PaletteFXObject_OldMotherBrainFightBGLights_0            ;8DE1BE;

PaletteFXObjects_GunshipGlow:
    dw RTS_8DC685                                                        ;8DE1C0;
    dw InstList_PaletteFXObject_GunshipGlow_0                            ;8DE1C2;

PaletteFXObjects_FadeOutZoomedOutExplodingZebes:
    dw RTS_8DC685                                                        ;8DE1C4;
    dw InstList_PaletteFXObject_FadeOutZoomedOutExplodingZebes           ;8DE1C6;

PaletteFXObjects_WidePartOfZebesExplosion_Foreground:
    dw RTS_8DC685                                                        ;8DE1C8;
    dw InstList_PaletteFXObject_WidePartOfZebesExplosion_Foreground      ;8DE1CA;

PaletteFXObjects_ZebesExplosionFinale:
    dw RTS_8DC685                                                        ;8DE1CC;
    dw InstList_PaletteFXObject_ZebesExplosionFinale                     ;8DE1CE;

PaletteFXObjects_WhiteOutSpaceDuringZebesExplosion:
    dw RTS_8DC685                                                        ;8DE1D0;
    dw InstList_PaletteFXObject_WhiteOutSpaceDuringZebesExplosion        ;8DE1D2;

PaletteFXObjects_ZebesExplosionPlanetAfterglow:
    dw RTS_8DC685                                                        ;8DE1D4;
    dw InstList_PaletteFXObject_ZebesExplosionPlanetAfterGlow_0          ;8DE1D6;

PaletteFXObjects_ExplodingZebesLava:
    dw RTS_8DC685                                                        ;8DE1D8;
    dw InstList_PaletteFXObject_ExplodingZebesLava_0                     ;8DE1DA;

PaletteFXObjects_FadeOutExplodingZebesCrust:
    dw RTS_8DC685                                                        ;8DE1DC;
    dw InstList_PaletteFXObject_FadeOutExplodingZebesCrust               ;8DE1DE;

PaletteFXObjects_FadeOutExplodingZebesGreyClouds:
    dw RTS_8DC685                                                        ;8DE1E0;
    dw InstList_PaletteFXObject_FadeOutExplodingZebesGreyClouds          ;8DE1E2;

PaletteFXObjects_GunshipEmergineFromZebesExplosion:
    dw RTS_8DC685                                                        ;8DE1E4;
    dw InstList_PaletteFXObject_GunshipEmergingFromZebesExplosion        ;8DE1E6;

PaletteFXObjects_WidePartOfZebesExplosion_Background:
    dw RTS_8DC685                                                        ;8DE1E8;
    dw InstList_PaletteFXObject_WidePartOfZebesExplosion_Background      ;8DE1EA;

UNUSED_PaletteFXObjects_8DE1EC:
    dw RTS_8DC685                                                        ;8DE1EC;
    dw UNUSED_InstList_PaletteFXObject_8DD9D0                            ;8DE1EE;

PaletteFXObjects_HyperBeam:
    dw RTS_8DC685                                                        ;8DE1F0;
    dw InstList_PaletteFXObject_HyperBeam_0                              ;8DE1F2;

PaletteFXObjects_SamusLoading_PowerSuit:
    dw RTS_8DC685                                                        ;8DE1F4;
    dw InstList_PaletteFXObject_SamusLoading_PowerSuit_0                 ;8DE1F6;

PaletteFXObjects_SamusLoading_VariaSuit:
    dw RTS_8DC685                                                        ;8DE1F8;
    dw InstList_PaletteFXObject_SamusLoading_VairaSuit_0                 ;8DE1FA;

PaletteFXObjects_SamusLoading_GravitySuit:
    dw RTS_8DC685                                                        ;8DE1FC;
    dw InstList_PaletteFXObject_SamusLoading_GravitySuit_0               ;8DE1FE;

PaletteFXObjects_PostCreditsSuperMetroidIcon:
    dw RTS_8DC685                                                        ;8DE200;
    dw InstList_PaletteFXObject_PostCreditsSuperMetroidIconGlare         ;8DE202;

Setup_PaletteFXObject_OldMotherBrainFightBackgroundLights:
    LDA.W #PreInstruction_PaletteFXObject_DeleteIfIntroPage2IsActive     ;8DE204;
    STA.W $1EAD,Y                                                        ;8DE207;
    RTS                                                                  ;8DE20A;


PreInstruction_PaletteFXObject_DeleteIfIntroPage2IsActive:
    LDA.W $1F51                                                          ;8DE20B;
    CMP.W #CinematicFunction_Intro_Page2                                 ;8DE20E;
    BNE .return                                                          ;8DE211;
    LDA.W #InstList_PaletteFXObject_Delete                               ;8DE213;
    STA.W $1EBD,X                                                        ;8DE216;
    LDA.W #$0001                                                         ;8DE219;
    STA.W $1ECD,X                                                        ;8DE21C;

.return:
    RTS                                                                  ;8DE21F;


InstList_PaletteFXObject_Nothing:
    dw Instruction_Delete_8DC5CF                                         ;8DE220;

InstList_PaletteFXObject_GreyOutTourianStatue_Draygon:
    dw Instruction_PaletteFXObject_ColorIndexInY                         ;8DE222;
    dw $00C0                                                             ;8DE224;
    dw Instruction_PaletteFXObject_GotoY                                 ;8DE226;
    dw InstList_PaletteFXObject_Common_GreyOutTourianStatue              ;8DE228;

InstList_PaletteFXObject_GreyOutTourianStatue_Kraid:
    dw Instruction_PaletteFXObject_ColorIndexInY                         ;8DE22A;
    dw $00E0                                                             ;8DE22C;
    dw Instruction_PaletteFXObject_GotoY                                 ;8DE22E;
    dw InstList_PaletteFXObject_Common_GreyOutTourianStatue              ;8DE230;

InstList_PaletteFXObject_GreyOutTourianStatue_Ridley:
    dw Instruction_PaletteFXObject_ColorIndexInY                         ;8DE232;
    dw $0120                                                             ;8DE234;
    dw Instruction_PaletteFXObject_GotoY                                 ;8DE236;
    dw InstList_PaletteFXObject_Common_GreyOutTourianStatue              ;8DE238;

InstList_PaletteFXObject_GreyOutTourianStatue_Phantoon:
    dw Instruction_PaletteFXObject_ColorIndexInY                         ;8DE23A;
    dw $0140                                                             ;8DE23C;

InstList_PaletteFXObject_Common_GreyOutTourianStatue:
    dw $0008,$0000,$57FF,$2BFF,$1F3C,$0278,$01B0,$010B                   ;8DE23E;
    dw $0087                                                             ;8DE24E;
    dw Instruction_PaletteFXObject_Done                                  ;8DE250;
    dw $0008,$3800,$5BDE,$33DE,$271A,$0E57,$09AF,$050A                   ;8DE252;
    dw $0486                                                             ;8DE262;
    dw Instruction_PaletteFXObject_Done                                  ;8DE264;
    dw $0008,$3800,$63DD,$3F9C,$2EF9,$1655,$118E,$0D0A                   ;8DE266;
    dw $0486                                                             ;8DE276;
    dw Instruction_PaletteFXObject_Done                                  ;8DE278;
    dw $0008,$3800,$67BC,$477B,$36D7,$2234,$198D,$1109                   ;8DE27A;
    dw $0885                                                             ;8DE28A;
    dw Instruction_PaletteFXObject_Done                                  ;8DE28C;
    dw $0008,$3800,$6F9B,$5359,$42D6,$2A32,$1D8D,$14E9                   ;8DE28E;
    dw $0885                                                             ;8DE29E;
    dw Instruction_PaletteFXObject_Done                                  ;8DE2A0;
    dw $0008,$3800,$737A,$5B38,$4AB4,$3611,$258C,$18E8                   ;8DE2A2;
    dw $0C84                                                             ;8DE2B2;
    dw Instruction_PaletteFXObject_Done                                  ;8DE2B4;
    dw $0008,$3800,$7B79,$66F6,$5293,$3E0F,$2D6B,$20E8                   ;8DE2B6;
    dw $0C84                                                             ;8DE2C6;
    dw Instruction_PaletteFXObject_Done                                  ;8DE2C8;
    dw $0008,$3800,$7F58,$6ED5,$5A71,$49EE,$356A,$24E7                   ;8DE2CA;
    dw $1083                                                             ;8DE2DA;
    dw Instruction_PaletteFXObject_Done                                  ;8DE2DC;
    dw Instruction_Delete_8DC5CF                                         ;8DE2DE;

PreInstruction_PaletteFXObject_DeleteIfEnemy0Died:
    LDA.W $0F8C                                                          ;8DE2E0;
    BNE .return                                                          ;8DE2E3;
    STZ.W $1E7D,X                                                        ;8DE2E5;

.return:
    RTS                                                                  ;8DE2E8;


InstList_PaletteFXObject_BombTorizoBelly_0:
    dw Instruction_PaletteFXObject_ColorIndexInY                         ;8DE2E9;
    dw $0132                                                             ;8DE2EB;
    dw Instruction_PaletteFXObject_PreInstructionInY                     ;8DE2ED;
    dw PreInstruction_PaletteFXObject_DeleteIfEnemy0Died                 ;8DE2EF;

InstList_PaletteFXObject_BombTorizoBelly_1:
    dw $000A,$6F7F,$51F8,$410E                                           ;8DE2F1;
    dw Instruction_PaletteFXObject_Done                                  ;8DE2F9;
    dw $0008,$56BC,$3935,$284B                                           ;8DE2FB;
    dw Instruction_PaletteFXObject_Done                                  ;8DE303;
    dw $0008,$4639,$28B2,$1828                                           ;8DE305;
    dw Instruction_PaletteFXObject_Done                                  ;8DE30D;
    dw $000A,$2D74,$100D,$0403                                           ;8DE30F;
    dw Instruction_PaletteFXObject_Done                                  ;8DE317;
    dw $0008,$4639,$28B2,$1828                                           ;8DE319;
    dw Instruction_PaletteFXObject_Done                                  ;8DE321;
    dw $0008,$56BC,$3935,$284B                                           ;8DE323;
    dw Instruction_PaletteFXObject_Done                                  ;8DE32B;
    dw Instruction_PaletteFXObject_GotoY                                 ;8DE32D;
    dw InstList_PaletteFXObject_BombTorizoBelly_1                        ;8DE32F;

InstList_PaletteFXObject_GoldenTorizoBelly_0:
    dw Instruction_PaletteFXObject_ColorIndexInY                         ;8DE331;
    dw $0132                                                             ;8DE333;
    dw Instruction_PaletteFXObject_PreInstructionInY                     ;8DE335;
    dw PreInstruction_PaletteFXObject_DeleteIfEnemy0Died                 ;8DE337;

InstList_PaletteFXObject_GoldenTorizoBelly_1:
    dw $000A,$73E0,$4F20,$2A20                                           ;8DE339;
    dw Instruction_PaletteFXObject_Done                                  ;8DE341;
    dw $0008,$5380,$2E20,$0920                                           ;8DE343;
    dw Instruction_PaletteFXObject_Done                                  ;8DE34B;
    dw $0008,$3AC0,$1560,$0480                                           ;8DE34D;
    dw Instruction_PaletteFXObject_Done                                  ;8DE355;
    dw $000A,$2200,$00A0,$0020                                           ;8DE357;
    dw Instruction_PaletteFXObject_Done                                  ;8DE35F;
    dw $0008,$3AC0,$1560,$0480                                           ;8DE361;
    dw Instruction_PaletteFXObject_Done                                  ;8DE369;
    dw $0008,$5380,$2E20,$0920                                           ;8DE36B;
    dw Instruction_PaletteFXObject_Done                                  ;8DE373;
    dw Instruction_PaletteFXObject_GotoY                                 ;8DE375;
    dw InstList_PaletteFXObject_GoldenTorizoBelly_1                      ;8DE377;

PreInstruction_PaletteFXObject_SamusInHeat:
    LDA.W Equipment.equippedItems                                        ;8DE379;
    AND.W #$0021                                                         ;8DE37C;
    BNE +                                                                ;8DE37F;
    LDA.W $0A4E                                                          ;8DE381;
    CLC                                                                  ;8DE384;
    ADC.W #$4000                                                         ;8DE385;
    STA.W $0A4E                                                          ;8DE388;
    LDA.W $0A50                                                          ;8DE38B;
    ADC.W #$0000                                                         ;8DE38E;
    STA.W $0A50                                                          ;8DE391;
    LDA.W $05B6                                                          ;8DE394;
    BIT.W #$0007                                                         ;8DE397;
    BNE +                                                                ;8DE39A;
    LDA.W #$0046                                                         ;8DE39C;
    CMP.W Equipment.currentEnergy                                        ;8DE39F;
    BCS +                                                                ;8DE3A2;
    LDA.W #$002D                                                         ;8DE3A4;
    JSL.L QueueSound_Lib3_Max6                                           ;8DE3A7;

  + LDA.W $1EED                                                          ;8DE3AB;
    CMP.W $1EEF                                                          ;8DE3AE;
    BEQ .return                                                          ;8DE3B1;
    STA.W $1EEF                                                          ;8DE3B3;
    ASL A                                                                ;8DE3B6;
    TAY                                                                  ;8DE3B7;
    LDA.W #$0001                                                         ;8DE3B8;
    STA.W $1ECD,X                                                        ;8DE3BB;
    LDA.W Equipment.equippedItems                                        ;8DE3BE;
    BIT.W #$0020                                                         ;8DE3C1;
    BEQ .checkVaria                                                      ;8DE3C4;
    LDA.W #.InstListPointers_gravity                                     ;8DE3C6;
    BRA .setInstListPointer                                              ;8DE3C9;


.checkVaria:
    BIT.W #$0001                                                         ;8DE3CB;
    BEQ .powerSuit                                                       ;8DE3CE;
    LDA.W #.InstListPointers_varia                                       ;8DE3D0;
    BRA .setInstListPointer                                              ;8DE3D3;


.powerSuit:
    LDA.W #.InstListPointers_power                                        ;8DE3D5;

.setInstListPointer:
    STA.B $12                                                            ;8DE3D8;
    LDA.B ($12),Y                                                        ;8DE3DA;
    STA.W $1EBD,X                                                        ;8DE3DC;

.return:
    RTS                                                                  ;8DE3DF;


  .InstListPointers
  ..gravity:
    dw InstList_PaletteFXObject_SamusInHeat_GravitySuit_2                ;8DE3E0;
    dw InstList_PaletteFXObject_SamusInHeat_GravitySuit_3                ;8DE3E2;
    dw InstList_PaletteFXObject_SamusInHeat_GravitySuit_4                ;8DE3E4;
    dw InstList_PaletteFXObject_SamusInHeat_GravitySuit_5                ;8DE3E6;
    dw InstList_PaletteFXObject_SamusInHeat_GravitySuit_6                ;8DE3E8;
    dw InstList_PaletteFXObject_SamusInHeat_GravitySuit_7                ;8DE3EA;
    dw InstList_PaletteFXObject_SamusInHeat_GravitySuit_8                ;8DE3EC;
    dw InstList_PaletteFXObject_SamusInHeat_GravitySuit_9                ;8DE3EE;
    dw InstList_PaletteFXObject_SamusInHeat_GravitySuit_A                ;8DE3F0;
    dw InstList_PaletteFXObject_SamusInHeat_GravitySuit_B                ;8DE3F2;
    dw InstList_PaletteFXObject_SamusInHeat_GravitySuit_C                ;8DE3F4;
    dw InstList_PaletteFXObject_SamusInHeat_GravitySuit_D                ;8DE3F6;
    dw InstList_PaletteFXObject_SamusInHeat_GravitySuit_E                ;8DE3F8;
    dw InstList_PaletteFXObject_SamusInHeat_GravitySuit_F                ;8DE3FA;
    dw InstList_PaletteFXObject_SamusInHeat_GravitySuit_10               ;8DE3FC;
    dw InstList_PaletteFXObject_SamusInHeat_GravitySuit_11               ;8DE3FE;

  ..varia:
    dw InstList_PaletteFXObject_SamusInHeat_VariaSuit_2                  ;8DE400;
    dw InstList_PaletteFXObject_SamusInHeat_VariaSuit_3                  ;8DE402;
    dw InstList_PaletteFXObject_SamusInHeat_VariaSuit_4                  ;8DE404;
    dw InstList_PaletteFXObject_SamusInHeat_VariaSuit_5                  ;8DE406;
    dw InstList_PaletteFXObject_SamusInHeat_VariaSuit_6                  ;8DE408;
    dw InstList_PaletteFXObject_SamusInHeat_VariaSuit_7                  ;8DE40A;
    dw InstList_PaletteFXObject_SamusInHeat_VariaSuit_8                  ;8DE40C;
    dw InstList_PaletteFXObject_SamusInHeat_VariaSuit_9                  ;8DE40E;
    dw InstList_PaletteFXObject_SamusInHeat_VariaSuit_A                  ;8DE410;
    dw InstList_PaletteFXObject_SamusInHeat_VariaSuit_B                  ;8DE412;
    dw InstList_PaletteFXObject_SamusInHeat_VariaSuit_C                  ;8DE414;
    dw InstList_PaletteFXObject_SamusInHeat_VariaSuit_D                  ;8DE416;
    dw InstList_PaletteFXObject_SamusInHeat_VariaSuit_E                  ;8DE418;
    dw InstList_PaletteFXObject_SamusInHeat_VariaSuit_F                  ;8DE41A;
    dw InstList_PaletteFXObject_SamusInHeat_VariaSuit_10                 ;8DE41C;
    dw InstList_PaletteFXObject_SamusInHeat_VariaSuit_11                 ;8DE41E;

  ..power:
    dw InstList_PaletteFXObject_SamusInHeat_PowerSuit_1                  ;8DE420;
    dw InstList_PaletteFXObject_SamusInHeat_PowerSuit_2                  ;8DE422;
    dw InstList_PaletteFXObject_SamusInHeat_PowerSuit_3                  ;8DE424;
    dw InstList_PaletteFXObject_SamusInHeat_PowerSuit_4                  ;8DE426;
    dw InstList_PaletteFXObject_SamusInHeat_PowerSuit_5                  ;8DE428;
    dw InstList_PaletteFXObject_SamusInHeat_PowerSuit_6                  ;8DE42A;
    dw InstList_PaletteFXObject_SamusInHeat_PowerSuit_7                  ;8DE42C;
    dw InstList_PaletteFXObject_SamusInHeat_PowerSuit_8                  ;8DE42E;
    dw InstList_PaletteFXObject_SamusInHeat_PowerSuit_9                  ;8DE430;
    dw InstList_PaletteFXObject_SamusInHeat_PowerSuit_A                  ;8DE432;
    dw InstList_PaletteFXObject_SamusInHeat_PowerSuit_B                  ;8DE434;
    dw InstList_PaletteFXObject_SamusInHeat_PowerSuit_C                  ;8DE436;
    dw InstList_PaletteFXObject_SamusInHeat_PowerSuit_D                  ;8DE438;
    dw InstList_PaletteFXObject_SamusInHeat_PowerSuit_E                  ;8DE43A;
    dw InstList_PaletteFXObject_SamusInHeat_PowerSuit_F                  ;8DE43C;
    dw InstList_PaletteFXObject_SamusInHeat_PowerSuit_10                 ;8DE43E;

Setup_PaletteFXObject_Norfair1_Tourian1:
    LDA.W Equipment.equippedItems                                        ;8DE440;
    BIT.W #$0020                                                         ;8DE443;
    BEQ .checkVaria                                                      ;8DE446;
    LDA.W #InstList_PaletteFXObject_SamusInHeat_GravitySuit_0            ;8DE448;
    BRA +                                                                ;8DE44B;


.checkVaria:
    BIT.W #$0001                                                         ;8DE44D;
    BEQ .powerSuit                                                       ;8DE450;
    LDA.W #InstList_PaletteFXObject_SamusInHeat_VariaSuit_0              ;8DE452;
    BRA +                                                                ;8DE455;


.powerSuit:
    LDA.W #InstList_PaletteFXObject_SamusInHeat_PowerSuit_0              ;8DE457;

  + STA.W $1EBD,Y                                                        ;8DE45A;
    RTS                                                                  ;8DE45D;


InstList_PaletteFXObject_SamusInHeat_PowerSuit_0:
    dw Instruction_PaletteFXObject_PreInstructionInY                     ;8DE45E;
    dw PreInstruction_PaletteFXObject_SamusInHeat                        ;8DE460;
    dw Instruction_PaletteFXObject_ColorIndexInY                         ;8DE462;
    dw $0182                                                             ;8DE464;

InstList_PaletteFXObject_SamusInHeat_PowerSuit_1:
    dw $0010,$0108,$03BD,$1405,$3BE0,$21A8,$579F,$4AD2                   ;8DE466;
    dw $3A4E,$00BB,$02B5,$016B,$0252,$1104,$0074,$000D                   ;8DE476;
    dw Instruction_PaletteFXObject_Done                                  ;8DE486;

InstList_PaletteFXObject_SamusInHeat_PowerSuit_2:
    dw $0004,$0109,$03BD,$1406,$3BE1,$25CA,$579F,$4AD3                   ;8DE488;
    dw $3A4F,$00BC,$02B6,$016C,$0253,$1105,$0075,$000E                   ;8DE498;
    dw Instruction_PaletteFXObject_Done                                  ;8DE4A8;

InstList_PaletteFXObject_SamusInHeat_PowerSuit_3:
    dw $0004,$0109,$03BD,$1406,$3BE1,$25CA,$579F,$4AD3                   ;8DE4AA;
    dw $3A4F,$00BC,$02B6,$016C,$0253,$1105,$0075,$000E                   ;8DE4BA;
    dw Instruction_PaletteFXObject_Done                                  ;8DE4CA;

InstList_PaletteFXObject_SamusInHeat_PowerSuit_4:
    dw $0005,$010A,$03BE,$1407,$3BE2,$25CC,$579F,$4AD4                   ;8DE4CC;
    dw $3A50,$00BC,$02B7,$016D,$0254,$1106,$0076,$000F                   ;8DE4DC;
    dw Instruction_PaletteFXObject_Done                                  ;8DE4EC;

InstList_PaletteFXObject_SamusInHeat_PowerSuit_5:
    dw $0006,$010A,$03BE,$1407,$3BE2,$25CC,$579F,$4AD4                   ;8DE4EE;
    dw $3A50,$00BC,$02B7,$016D,$0254,$1106,$0076,$000F                   ;8DE4FE;
    dw Instruction_PaletteFXObject_Done                                  ;8DE50E;

InstList_PaletteFXObject_SamusInHeat_PowerSuit_6:
    dw $0007,$010B,$03BE,$1408,$3BE3,$29EE,$579F,$4AD5                   ;8DE510;
    dw $3A51,$00BD,$02B8,$016E,$0255,$1107,$0077,$0010                   ;8DE520;
    dw Instruction_PaletteFXObject_Done                                  ;8DE530;

InstList_PaletteFXObject_SamusInHeat_PowerSuit_7:
    dw $0008,$010B,$03BE,$1408,$3BE3,$29EE,$579F,$4AD5                   ;8DE532;
    dw $3A51,$00BD,$02B8,$016E,$0255,$1107,$0077,$0010                   ;8DE542;
    dw Instruction_PaletteFXObject_Done                                  ;8DE552;

InstList_PaletteFXObject_SamusInHeat_PowerSuit_8:
    dw $0008,$010D,$03BE,$140A,$3BE5,$2E0F,$579F,$4AD7                   ;8DE554;
    dw $3A53,$00BD,$02BA,$0170,$0257,$1109,$0079,$0012                   ;8DE564;
    dw Instruction_PaletteFXObject_Done                                  ;8DE574;

InstList_PaletteFXObject_SamusInHeat_PowerSuit_9:
    dw $0008,$010D,$03BE,$140A,$3BE5,$2E0F,$579F,$4AD7                   ;8DE576;
    dw $3A53,$00BD,$02BA,$0170,$0257,$1109,$0079,$0012                   ;8DE586;
    dw Instruction_PaletteFXObject_Done                                  ;8DE596;

InstList_PaletteFXObject_SamusInHeat_PowerSuit_A:
    dw $0008,$010B,$03BE,$1408,$3BE3,$29EE,$579F,$4AD5                   ;8DE598;
    dw $3A51,$00BD,$02B8,$016E,$0255,$1107,$0077,$0010                   ;8DE5A8;
    dw Instruction_PaletteFXObject_Done                                  ;8DE5B8;

InstList_PaletteFXObject_SamusInHeat_PowerSuit_B:
    dw $0007,$010B,$03BE,$1408,$3BE3,$29EE,$579F,$4AD5                   ;8DE5BA;
    dw $3A51,$00BD,$02B8,$016E,$0255,$1107,$0077,$0010                   ;8DE5CA;
    dw Instruction_PaletteFXObject_Done                                  ;8DE5DA;

InstList_PaletteFXObject_SamusInHeat_PowerSuit_C:
    dw $0006,$010A,$03BE,$1407,$3BE2,$25CC,$579F,$4AD4                   ;8DE5DC;
    dw $3A50,$00BC,$02B7,$016D,$0254,$1106,$0076,$000F                   ;8DE5EC;
    dw Instruction_PaletteFXObject_Done                                  ;8DE5FC;

InstList_PaletteFXObject_SamusInHeat_PowerSuit_D:
    dw $0005,$010A,$03BE,$1407,$3BE2,$25CC,$579F,$4AD4                   ;8DE5FE;
    dw $3A50,$00BC,$02B7,$016D,$0254,$1106,$0076,$000F                   ;8DE60E;
    dw Instruction_PaletteFXObject_Done                                  ;8DE61E;

InstList_PaletteFXObject_SamusInHeat_PowerSuit_E:
    dw $0004,$0109,$03BD,$1406,$3BE1,$25CA,$579F,$4AD3                   ;8DE620;
    dw $3A4F,$00BC,$02B6,$016C,$0253,$1105,$0075,$000E                   ;8DE630;
    dw Instruction_PaletteFXObject_Done                                  ;8DE640;

InstList_PaletteFXObject_SamusInHeat_PowerSuit_F:
    dw $0004,$0109,$03BD,$1406,$3BE1,$25CA,$579F,$4AD3                   ;8DE642;
    dw $3A4F,$00BC,$02B6,$016C,$0253,$1105,$0075,$000E                   ;8DE652;
    dw Instruction_PaletteFXObject_Done                                  ;8DE662;

InstList_PaletteFXObject_SamusInHeat_PowerSuit_10:
    dw $0003,$0109,$03BD,$1406,$3BE1,$25CA,$579F,$4AD3                   ;8DE664;
    dw $3A4F,$00BC,$02B6,$016C,$0253,$1105,$0075,$000E                   ;8DE674;
    dw Instruction_PaletteFXObject_Done                                  ;8DE684;

InstList_PaletteFXObject_SamusInHeat_PowerSuit_11:
    dw Instruction_PaletteFXObject_GotoY                                 ;8DE686;
    dw InstList_PaletteFXObject_SamusInHeat_PowerSuit_1                  ;8DE688;

InstList_PaletteFXObject_SamusInHeat_VariaSuit_0:
    dw Instruction_PaletteFXObject_PreInstructionInY                     ;8DE68A;
    dw PreInstruction_PaletteFXObject_SamusInHeat                        ;8DE68C;

InstList_PaletteFXObject_SamusInHeat_VariaSuit_1:
    dw Instruction_PaletteFXObject_ColorIndexInY                         ;8DE68E;
    dw $0182                                                             ;8DE690;

InstList_PaletteFXObject_SamusInHeat_VariaSuit_2:
    dw $0010,$0108,$02FF,$1405,$3BE0,$21A8,$579F,$4AD2                   ;8DE692;
    dw $3A4E,$00BB,$01BE,$008E,$0252,$1104,$0074,$000D                   ;8DE6A2;
    dw Instruction_PaletteFXObject_Done                                  ;8DE6B2;

InstList_PaletteFXObject_SamusInHeat_VariaSuit_3:
    dw $0004,$0109,$02FF,$1406,$3BE1,$25CA,$579F,$4AD3                   ;8DE6B4;
    dw $3A4F,$00BC,$01BE,$008F,$0253,$1105,$0075,$000E                   ;8DE6C4;
    dw Instruction_PaletteFXObject_Done                                  ;8DE6D4;

InstList_PaletteFXObject_SamusInHeat_VariaSuit_4:
    dw $0004,$0109,$02FF,$1406,$3BE1,$25CA,$579F,$4AD3                   ;8DE6D6;
    dw $3A4F,$00BC,$01BE,$008F,$0253,$1105,$0075,$000E                   ;8DE6E6;
    dw Instruction_PaletteFXObject_Done                                  ;8DE6F6;

InstList_PaletteFXObject_SamusInHeat_VariaSuit_5:
    dw $0005,$010A,$02FF,$1407,$3BE2,$25CC,$579F,$4AD4                   ;8DE6F8;
    dw $3A50,$00BC,$01BE,$0090,$0254,$1106,$0076,$000F                   ;8DE708;
    dw Instruction_PaletteFXObject_Done                                  ;8DE718;

InstList_PaletteFXObject_SamusInHeat_VariaSuit_6:
    dw $0006,$010A,$02FF,$1407,$3BE2,$25CC,$579F,$4AD4                   ;8DE71A;
    dw $3A50,$00BC,$01BE,$0090,$0254,$1106,$0076,$000F                   ;8DE72A;
    dw Instruction_PaletteFXObject_Done                                  ;8DE73A;

InstList_PaletteFXObject_SamusInHeat_VariaSuit_7:
    dw $0007,$010B,$02FF,$1408,$3BE3,$29EE,$579F,$4AD5                   ;8DE73C;
    dw $3A51,$00BD,$01BE,$0091,$0255,$1107,$0077,$0010                   ;8DE74C;
    dw Instruction_PaletteFXObject_Done                                  ;8DE75C;

InstList_PaletteFXObject_SamusInHeat_VariaSuit_8:
    dw $0008,$010B,$02FF,$1408,$3BE3,$29EE,$579F,$4AD5                   ;8DE75E;
    dw $3A51,$00BD,$01BE,$0091,$0255,$1107,$0077,$0010                   ;8DE76E;
    dw Instruction_PaletteFXObject_Done                                  ;8DE77E;

InstList_PaletteFXObject_SamusInHeat_VariaSuit_9:
    dw $0008,$010D,$02FF,$140A,$3BE5,$2E0F,$579F,$4AD7                   ;8DE780;
    dw $3A53,$00BD,$01BF,$0093,$0257,$1109,$0079,$0012                   ;8DE790;
    dw Instruction_PaletteFXObject_Done                                  ;8DE7A0;

InstList_PaletteFXObject_SamusInHeat_VariaSuit_A:
    dw $0008,$010D,$02FF,$140A,$3BE5,$2E0F,$579F,$4AD7                   ;8DE7A2;
    dw $3A53,$00BD,$01BF,$0093,$0257,$1109,$0079,$0012                   ;8DE7B2;
    dw Instruction_PaletteFXObject_Done                                  ;8DE7C2;

InstList_PaletteFXObject_SamusInHeat_VariaSuit_B:
    dw $0008,$010B,$02FF,$1408,$3BE3,$29EE,$579F,$4AD5                   ;8DE7C4;
    dw $3A51,$00BD,$01BE,$0091,$0255,$1107,$0077,$0010                   ;8DE7D4;
    dw Instruction_PaletteFXObject_Done                                  ;8DE7E4;

InstList_PaletteFXObject_SamusInHeat_VariaSuit_C:
    dw $0007,$010B,$02FF,$1408,$3BE3,$29EE,$579F,$4AD5                   ;8DE7E6;
    dw $3A51,$00BD,$01BE,$0091,$0255,$1107,$0077,$0010                   ;8DE7F6;
    dw Instruction_PaletteFXObject_Done                                  ;8DE806;

InstList_PaletteFXObject_SamusInHeat_VariaSuit_D:
    dw $0006,$010A,$02FF,$1407,$3BE2,$25CC,$579F,$4AD4                   ;8DE808;
    dw $3A50,$00BC,$01BE,$0090,$0254,$1106,$0076,$000F                   ;8DE818;
    dw Instruction_PaletteFXObject_Done                                  ;8DE828;

InstList_PaletteFXObject_SamusInHeat_VariaSuit_E:
    dw $0005,$010A,$02FF,$1407,$3BE2,$25CC,$579F,$4AD4                   ;8DE82A;
    dw $3A50,$00BC,$01BE,$0090,$0254,$1106,$0076,$000F                   ;8DE83A;
    dw Instruction_PaletteFXObject_Done                                  ;8DE84A;

InstList_PaletteFXObject_SamusInHeat_VariaSuit_F:
    dw $0004,$0109,$02FF,$1406,$3BE1,$25CA,$579F,$4AD3                   ;8DE84C;
    dw $3A4F,$00BC,$01BE,$008F,$0253,$1105,$0075,$000E                   ;8DE85C;
    dw Instruction_PaletteFXObject_Done                                  ;8DE86C;

InstList_PaletteFXObject_SamusInHeat_VariaSuit_10:
    dw $0004,$0109,$02FF,$1406,$3BE1,$25CA,$579F,$4AD3                   ;8DE86E;
    dw $3A4F,$00BC,$01BE,$008F,$0253,$1105,$0075,$000E                   ;8DE87E;
    dw Instruction_PaletteFXObject_Done                                  ;8DE88E;

InstList_PaletteFXObject_SamusInHeat_VariaSuit_11:
    dw $0010,$0108,$02FF,$1405,$3BE0,$21A8,$579F,$4AD2                   ;8DE890;
    dw $3A4E,$00BB,$01BE,$008E,$0252,$1104,$0074,$000D                   ;8DE8A0;
    dw Instruction_PaletteFXObject_Done                                  ;8DE8B0;

InstList_PaletteFXObject_SamusInHeat_VariaSuit_12:
    dw Instruction_PaletteFXObject_GotoY                                 ;8DE8B2;
    dw InstList_PaletteFXObject_SamusInHeat_VariaSuit_2                  ;8DE8B4;

InstList_PaletteFXObject_SamusInHeat_GravitySuit_0:
    dw Instruction_PaletteFXObject_PreInstructionInY                     ;8DE8B6;
    dw PreInstruction_PaletteFXObject_SamusInHeat                        ;8DE8B8;

InstList_PaletteFXObject_SamusInHeat_GravitySuit_1:
    dw Instruction_PaletteFXObject_ColorIndexInY                         ;8DE8BA;
    dw $0182                                                             ;8DE8BC;

InstList_PaletteFXObject_SamusInHeat_GravitySuit_2:
    dw $0010,$0108,$421F,$1405,$3BE0,$21A8,$579F,$4AD2                   ;8DE8BE;
    dw $3A4E,$00BB,$5914,$30AA,$0274,$1104,$0074,$000D                   ;8DE8CE;
    dw Instruction_PaletteFXObject_Done                                  ;8DE8DE;

InstList_PaletteFXObject_SamusInHeat_GravitySuit_3:
    dw $0004,$0109,$421F,$1406,$3BE1,$25CA,$579F,$4AD3                   ;8DE8E0;
    dw $3A4F,$00BC,$5915,$30AB,$0253,$1105,$0075,$000E                   ;8DE8F0;
    dw Instruction_PaletteFXObject_Done                                  ;8DE900;

InstList_PaletteFXObject_SamusInHeat_GravitySuit_4:
    dw $0004,$0109,$421F,$1406,$3BE1,$25CA,$579F,$4AD3                   ;8DE902;
    dw $3A4F,$00BC,$5915,$30AB,$0253,$1105,$0075,$000E                   ;8DE912;
    dw Instruction_PaletteFXObject_Done                                  ;8DE922;

InstList_PaletteFXObject_SamusInHeat_GravitySuit_5:
    dw $0005,$010A,$421F,$1407,$3BE2,$25CC,$579F,$4AD4                   ;8DE924;
    dw $3A50,$00BC,$5916,$30AC,$0254,$1106,$0076,$000F                   ;8DE934;
    dw Instruction_PaletteFXObject_Done                                  ;8DE944;

InstList_PaletteFXObject_SamusInHeat_GravitySuit_6:
    dw $0006,$010A,$421F,$1407,$3BE2,$25CC,$579F,$4AD4                   ;8DE946;
    dw $3A50,$00BC,$5916,$30AC,$0254,$1106,$0076,$000F                   ;8DE956;
    dw Instruction_PaletteFXObject_Done                                  ;8DE966;

InstList_PaletteFXObject_SamusInHeat_GravitySuit_7:
    dw $0007,$010B,$421F,$1408,$3BE3,$29EE,$579F,$4AD5                   ;8DE968;
    dw $3A51,$00BD,$5917,$30AD,$0255,$1107,$0077,$0010                   ;8DE978;
    dw Instruction_PaletteFXObject_Done                                  ;8DE988;

InstList_PaletteFXObject_SamusInHeat_GravitySuit_8:
    dw $0008,$010B,$421F,$1408,$3BE3,$29EE,$579F,$4AD5                   ;8DE98A;
    dw $3A51,$00BD,$5917,$30AD,$0255,$1107,$0077,$0010                   ;8DE99A;
    dw Instruction_PaletteFXObject_Done                                  ;8DE9AA;

InstList_PaletteFXObject_SamusInHeat_GravitySuit_9:
    dw $0008,$010D,$421F,$140A,$3BE5,$2E0F,$579F,$4AD7                   ;8DE9AC;
    dw $3A53,$00BD,$5919,$30AF,$0257,$1109,$0079,$0012                   ;8DE9BC;
    dw Instruction_PaletteFXObject_Done                                  ;8DE9CC;

InstList_PaletteFXObject_SamusInHeat_GravitySuit_A:
    dw $0008,$010D,$421F,$140A,$3BE5,$2E0F,$579F,$4AD7                   ;8DE9CE;
    dw $3A53,$00BD,$5919,$30AF,$0257,$1109,$0079,$0012                   ;8DE9DE;
    dw Instruction_PaletteFXObject_Done                                  ;8DE9EE;

InstList_PaletteFXObject_SamusInHeat_GravitySuit_B:
    dw $0008,$010B,$421F,$1408,$3BE3,$29EE,$579F,$4AD5                   ;8DE9F0;
    dw $3A51,$00BD,$5917,$30AD,$0255,$1107,$0077,$0010                   ;8DEA00;
    dw Instruction_PaletteFXObject_Done                                  ;8DEA10;

InstList_PaletteFXObject_SamusInHeat_GravitySuit_C:
    dw $0007,$010B,$421F,$1408,$3BE3,$29EE,$579F,$4AD5                   ;8DEA12;
    dw $3A51,$00BD,$5917,$30AD,$0255,$1107,$0077,$0010                   ;8DEA22;
    dw Instruction_PaletteFXObject_Done                                  ;8DEA32;

InstList_PaletteFXObject_SamusInHeat_GravitySuit_D:
    dw $0006,$010A,$421F,$1407,$3BE2,$25CC,$579F,$4AD4                   ;8DEA34;
    dw $3A50,$00BC,$5916,$30AC,$0254,$1106,$0076,$000F                   ;8DEA44;
    dw Instruction_PaletteFXObject_Done                                  ;8DEA54;

InstList_PaletteFXObject_SamusInHeat_GravitySuit_E:
    dw $0005,$010A,$421F,$1407,$3BE2,$25CC,$579F,$4AD4                   ;8DEA56;
    dw $3A50,$00BC,$5916,$30AC,$0254,$1106,$0076,$000F                   ;8DEA66;
    dw Instruction_PaletteFXObject_Done                                  ;8DEA76;

InstList_PaletteFXObject_SamusInHeat_GravitySuit_F:
    dw $0004,$0109,$421F,$1406,$3BE1,$25CA,$579F,$4AD3                   ;8DEA78;
    dw $3A4F,$00BC,$5915,$30AB,$0253,$1105,$0075,$000E                   ;8DEA88;
    dw Instruction_PaletteFXObject_Done                                  ;8DEA98;

InstList_PaletteFXObject_SamusInHeat_GravitySuit_10:
    dw $0004,$0109,$421F,$1406,$3BE1,$25CA,$579F,$4AD3                   ;8DEA9A;
    dw $3A4F,$00BC,$5915,$30AB,$0253,$1105,$0075,$000E                   ;8DEAAA;
    dw Instruction_PaletteFXObject_Done                                  ;8DEABA;

InstList_PaletteFXObject_SamusInHeat_GravitySuit_11:
    dw $0010,$0108,$421F,$1405,$3BE0,$21A8,$579F,$4AD2                   ;8DEABC;
    dw $3A4E,$00BB,$5914,$30AA,$0274,$1104,$0074,$000D                   ;8DEACC;
    dw Instruction_PaletteFXObject_Done                                  ;8DEADC;
    dw Instruction_PaletteFXObject_GotoY                                 ;8DEADE;
    dw InstList_PaletteFXObject_SamusInHeat_GravitySuit_2                ;8DEAE0;

InstList_PaletteFXObject_WreckedShip1_0:
    dw Instruction_PaletteFXObject_ColorIndexInY                         ;8DEAE2;
    dw $0098                                                             ;8DEAE4;

InstList_PaletteFXObject_WreckedShip1_1:
    dw $000A,$1EA9,$0BB1                                                 ;8DEAE6;
    dw Instruction_PaletteFXObject_Done                                  ;8DEAEC;
    dw $000A,$1667,$034E                                                 ;8DEAEE;
    dw Instruction_PaletteFXObject_Done                                  ;8DEAF4;
    dw $000A,$0E25,$02EB                                                 ;8DEAF6;
    dw Instruction_PaletteFXObject_Done                                  ;8DEAFC;
    dw $000A,$05E3,$0288                                                 ;8DEAFE;
    dw Instruction_PaletteFXObject_Done                                  ;8DEB04;
    dw $000A,$01A1,$0225                                                 ;8DEB06;
    dw Instruction_PaletteFXObject_Done                                  ;8DEB0C;
    dw $000A,$05E3,$0288                                                 ;8DEB0E;
    dw Instruction_PaletteFXObject_Done                                  ;8DEB14;
    dw $000A,$0E25,$02EB                                                 ;8DEB16;
    dw Instruction_PaletteFXObject_Done                                  ;8DEB1C;
    dw $000A,$1667,$034E                                                 ;8DEB1E;
    dw Instruction_PaletteFXObject_Done                                  ;8DEB24;
    dw Instruction_PaletteFXObject_GotoY                                 ;8DEB26;
    dw InstList_PaletteFXObject_WreckedShip1_1                           ;8DEB28;

UNUSED_PreInstruction_PaletteFXObject_WaitUntilAreBossIsDead:
    LDA.W #$0001                                                         ;8DEB2A;
    JSL.L CheckIfBossBitsForCurrentAreaMatchAnyBitsInA                   ;8DEB2D;
    BCS .return                                                          ;8DEB31;
    PLA                                                                  ;8DEB33;
    LDA.W #$0001                                                         ;8DEB34;
    STA.W $1ECD,X                                                        ;8DEB37;

.return:
    RTS                                                                  ;8DEB3A;


InstList_PaletteFXObject_Crateria1_0:
    dw Instruction_PaletteFXObject_PreInstructionInY                     ;8DEB3B;
    dw PreInst_PaletteFXObject_RestartCrateria1IfSamusIsntLowEnough      ;8DEB3D;
    dw Instruction_PaletteFXObject_ColorIndexInY                         ;8DEB3F;
    dw $00A8                                                             ;8DEB41;

InstList_PaletteFXObject_Crateria1_1:
    dw $00F0,$2D6C,$294B,$252A,$2109,$1CE8,$18C7,$14A6                   ;8DEB43;
    dw $1085                                                             ;8DEB53;
    dw Instruction_PaletteFXObject_Done                                  ;8DEB55;
    dw Instruction_PaletteFXObject_TimerInY                              ;8DEB57;
    db $02                                                               ;8DEB59;

InstList_PaletteFXObject_Crateria1_2:
    dw $0002,$4632,$4211,$3DF0,$39CF,$35AE,$318D,$2D6C                   ;8DEB5A;
    dw $294B                                                             ;8DEB6A;
    dw Instruction_PaletteFXObject_Done                                  ;8DEB6C;
    dw $0001,$5EF8,$5AD7,$56B6,$5295,$4E74,$4A53,$4632                   ;8DEB6E;
    dw $4211                                                             ;8DEB7E;
    dw Instruction_PaletteFXObject_Done                                  ;8DEB80;
    dw $0001,$77BE,$739D,$6F7C,$6B5B,$673A,$6319,$5EF8                   ;8DEB82;
    dw $5AD7                                                             ;8DEB92;
    dw Instruction_PaletteFXObject_Done                                  ;8DEB94;
    dw $0001,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF                   ;8DEB96;
    dw $7FFF                                                             ;8DEBA6;
    dw Instruction_PaletteFXObject_Done                                  ;8DEBA8;
    dw $0001,$77BE,$739D,$6F7C,$6B5B,$673A,$6319,$5EF8                   ;8DEBAA;
    dw $5AD7                                                             ;8DEBBA;
    dw Instruction_PaletteFXObject_Done                                  ;8DEBBC;
    dw $0001,$5EF8,$5AD7,$56B6,$5295,$4E74,$4A53,$4632                   ;8DEBBE;
    dw $4211                                                             ;8DEBCE;
    dw Instruction_PaletteFXObject_Done                                  ;8DEBD0;
    dw $0002,$4632,$4211,$3DF0,$39CF,$35AE,$318D,$2D6C                   ;8DEBD2;
    dw $294B                                                             ;8DEBE2;
    dw Instruction_PaletteFXObject_Done                                  ;8DEBE4;
    dw Instruction_PaletteFXObject_DecrementTimer_GotoYIfNonZero         ;8DEBE6;
    dw InstList_PaletteFXObject_Crateria1_2                              ;8DEBE8;
    dw $00F0,$2D6C,$294B,$252A,$2109,$1CE8,$18C7,$14A6                   ;8DEBEA;
    dw $1085                                                             ;8DEBFA;
    dw Instruction_PaletteFXObject_Done                                  ;8DEBFC;
    dw Instruction_PaletteFXObject_TimerInY                              ;8DEBFE;
    db $01                                                               ;8DEC00;

InstList_PaletteFXObject_Crateria1_3:
    dw $0001,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF                   ;8DEC01;
    dw $7FFF                                                             ;8DEC11;
    dw Instruction_PaletteFXObject_Done                                  ;8DEC13;
    dw $0001,$77BE,$739D,$6F7C,$6B5B,$673A,$6319,$5EF8                   ;8DEC15;
    dw $5AD7                                                             ;8DEC25;
    dw Instruction_PaletteFXObject_Done                                  ;8DEC27;
    dw $0001,$5EF8,$5AD7,$56B6,$5295,$4E74,$4A53,$4632                   ;8DEC29;
    dw $4211                                                             ;8DEC39;
    dw Instruction_PaletteFXObject_Done                                  ;8DEC3B;
    dw $0002,$4632,$4211,$3DF0,$39CF,$35AE,$318D,$2D6C                   ;8DEC3D;
    dw $294B                                                             ;8DEC4D;
    dw Instruction_PaletteFXObject_Done                                  ;8DEC4F;
    dw Instruction_PaletteFXObject_DecrementTimer_GotoYIfNonZero         ;8DEC51;
    dw InstList_PaletteFXObject_Crateria1_3                              ;8DEC53;
    dw Instruction_PaletteFXObject_GotoY                                 ;8DEC55;
    dw InstList_PaletteFXObject_Crateria1_1                              ;8DEC57;

PreInst_PaletteFXObject_RestartCrateria1IfSamusIsntLowEnough:
    LDA.W $0AFA                                                          ;8DEC59;
    CMP.W #$0380                                                         ;8DEC5C;
    BCS .return                                                          ;8DEC5F;
    LDA.W #$0001                                                         ;8DEC61;
    STA.W $1ECD,X                                                        ;8DEC64;
    LDA.W #InstList_PaletteFXObject_Crateria1_1                          ;8DEC67;
    STA.W $1EBD,X                                                        ;8DEC6A;

.return:
    RTS                                                                  ;8DEC6D;


UNUSED_InstList_PaletteFXObject_DarkLightning_0_8DEC6E:
    dw Instruction_PaletteFXObject_PreInstructionInY                     ;8DEC6E;
    dw UNUSED_PreInst_PalFXObj_RestartDarkLightningIfSamus_8DED84        ;8DEC70;
    dw Instruction_PaletteFXObject_ColorIndexInY                         ;8DEC72;
    dw $0082                                                             ;8DEC74;

UNUSED_InstList_PaletteFXObject_DarkLightning_1_8DEC76:
    dw $00F0,$262B,$1548,$08E5,$1594,$14ED,$10A9,$0C86                   ;8DEC76;
    dw Instruction_PaletteFXObject_Done                                  ;8DEC86;
    dw Instruction_PaletteFXObject_TimerInY                              ;8DEC88;
    db $02                                                               ;8DEC8A;

UNUSED_InstList_PaletteFXObject_DarkLightning_2_8DEC8B:
    dw $0002,$1186,$00A3,$0040,$00EF,$0048,$0004,$0001                   ;8DEC8B;
    dw Instruction_PaletteFXObject_Done                                  ;8DEC9B;
    dw $0001,$00E1,$0000,$0000,$004A,$0003,$0000,$0000                   ;8DEC9D;
    dw Instruction_PaletteFXObject_Done                                  ;8DECAD;
    dw $0001,$0040,$0000,$0000,$0005,$0000,$0000,$0000                   ;8DECAF;
    dw Instruction_PaletteFXObject_Done                                  ;8DECBF;
    dw $0001,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;8DECC1;
    dw Instruction_PaletteFXObject_Done                                  ;8DECD1;
    dw $0001,$0040,$0000,$0000,$0005,$0000,$0000,$0000                   ;8DECD3;
    dw Instruction_PaletteFXObject_Done                                  ;8DECE3;
    dw $0001,$00E1,$0000,$0000,$004A,$0003,$0000,$0000                   ;8DECE5;
    dw Instruction_PaletteFXObject_Done                                  ;8DECF5;
    dw $0002,$1186,$00A3,$0040,$00EF,$0048,$0004,$0001                   ;8DECF7;
    dw Instruction_PaletteFXObject_Done                                  ;8DED07;
    dw Instruction_PaletteFXObject_DecrementTimer_GotoYIfNonZero         ;8DED09;
    dw UNUSED_InstList_PaletteFXObject_DarkLightning_2_8DEC8B            ;8DED0B;
    dw $00F0,$262B,$1548,$08E5,$1594,$14ED,$10A9,$0C86                   ;8DED0D;
    dw Instruction_PaletteFXObject_Done                                  ;8DED1D;
    dw $00F0,$262B,$1548,$08E5,$1594,$14ED,$10A9,$0C86                   ;8DED1F;
    dw Instruction_PaletteFXObject_Done                                  ;8DED2F;
    dw Instruction_PaletteFXObject_TimerInY                              ;8DED31;
    db $01                                                               ;8DED33;

UNUSED_InstList_PaletteFXObject_DarkLightning_3_8DED34:
    dw $0001,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;8DED34;
    dw Instruction_PaletteFXObject_Done                                  ;8DED44;
    dw $0001,$0040,$0000,$0000,$0005,$0000,$0000,$0000                   ;8DED46;
    dw Instruction_PaletteFXObject_Done                                  ;8DED56;
    dw $0001,$00E1,$0000,$0000,$004A,$0003,$0000,$0000                   ;8DED58;
    dw Instruction_PaletteFXObject_Done                                  ;8DED68;
    dw $0002,$1186,$00A3,$0040,$00EF,$0048,$0004,$0001                   ;8DED6A;
    dw Instruction_PaletteFXObject_Done                                  ;8DED7A;
    dw Instruction_PaletteFXObject_DecrementTimer_GotoYIfNonZero         ;8DED7C;
    dw UNUSED_InstList_PaletteFXObject_DarkLightning_3_8DED34            ;8DED7E;
    dw Instruction_PaletteFXObject_GotoY                                 ;8DED80;
    dw UNUSED_InstList_PaletteFXObject_DarkLightning_1_8DEC76            ;8DED82;

UNUSED_PreInst_PalFXObj_RestartDarkLightningIfSamus_8DED84:
    LDA.W $0AFA                                                          ;8DED84;
    CMP.W #$0380                                                         ;8DED87;
    BCS .return                                                          ;8DED8A;
    LDA.W #$0001                                                         ;8DED8C;
    STA.W $1ECD,X                                                        ;8DED8F;
    LDA.W #UNUSED_InstList_PaletteFXObject_DarkLightning_1_8DEC76        ;8DED92;
    STA.W $1EBD,X                                                        ;8DED95;

.return:
    RTS                                                                  ;8DED98;


InstList_PaletteFXObject_Brinstar1_0:
    dw Instruction_PaletteFXObject_ColorIndexInY                         ;8DED99;
    dw $00E2                                                             ;8DED9B;

InstList_PaletteFXObject_Brinstar1_1:
    dw $000A,$5D22,$4463,$1840                                           ;8DED9D;
    dw Instruction_PaletteFXObject_Done                                  ;8DEDA5;
    dw $000A,$5901,$4042,$1420                                           ;8DEDA7;
    dw Instruction_PaletteFXObject_Done                                  ;8DEDAF;
    dw $000A,$54E0,$3C21,$1000                                           ;8DEDB1;
    dw Instruction_PaletteFXObject_Done                                  ;8DEDB9;
    dw $000A,$50C0,$3C21,$1000                                           ;8DEDBB;
    dw Instruction_PaletteFXObject_Done                                  ;8DEDC3;
    dw $000A,$4CA0,$3800,$0C00                                           ;8DEDC5;
    dw Instruction_PaletteFXObject_Done                                  ;8DEDCD;
    dw $000A,$4880,$3800,$0C00                                           ;8DEDCF;
    dw Instruction_PaletteFXObject_Done                                  ;8DEDD7;
    dw $000A,$4460,$3400,$0800                                           ;8DEDD9;
    dw Instruction_PaletteFXObject_Done                                  ;8DEDE1;
    dw $000A,$4040,$3400,$0800                                           ;8DEDE3;
    dw Instruction_PaletteFXObject_Done                                  ;8DEDEB;
    dw $000A,$4460,$3400,$0800                                           ;8DEDED;
    dw Instruction_PaletteFXObject_Done                                  ;8DEDF5;
    dw $000A,$4880,$3800,$0C00                                           ;8DEDF7;
    dw Instruction_PaletteFXObject_Done                                  ;8DEDFF;
    dw $000A,$4CA0,$3800,$0C00                                           ;8DEE01;
    dw Instruction_PaletteFXObject_Done                                  ;8DEE09;
    dw $000A,$50C0,$3C21,$1000                                           ;8DEE0B;
    dw Instruction_PaletteFXObject_Done                                  ;8DEE13;
    dw $000A,$54E0,$3C21,$1000                                           ;8DEE15;
    dw Instruction_PaletteFXObject_Done                                  ;8DEE1D;
    dw $000A,$5901,$4042,$1420                                           ;8DEE1F;
    dw Instruction_PaletteFXObject_Done                                  ;8DEE27;
    dw Instruction_PaletteFXObject_GotoY                                 ;8DEE29;
    dw InstList_PaletteFXObject_Brinstar1_1                              ;8DEE2B;

InstList_PaletteFXObject_Brinstar8_0:
    dw Instruction_PaletteFXObject_PreInstructionInY                     ;8DEE2D;
    dw PreInstruction_PaletteFXObject_DeleteIfAreaMiniBossIsDead         ;8DEE2F;
    dw Instruction_PaletteFXObject_ColorIndexInY                         ;8DEE31;
    dw $00E2                                                             ;8DEE33;

InstList_PaletteFXObject_Brinstar8_1:
    dw $000A,$5D22,$4463,$1840                                           ;8DEE35;
    dw Instruction_PaletteFXObject_Done                                  ;8DEE3D;
    dw $000A,$5901,$4042,$1420                                           ;8DEE3F;
    dw Instruction_PaletteFXObject_Done                                  ;8DEE47;
    dw $000A,$54E0,$3C21,$1000                                           ;8DEE49;
    dw Instruction_PaletteFXObject_Done                                  ;8DEE51;
    dw $000A,$50C0,$3C21,$1000                                           ;8DEE53;
    dw Instruction_PaletteFXObject_Done                                  ;8DEE5B;
    dw $000A,$4CA0,$3800,$0C00                                           ;8DEE5D;
    dw Instruction_PaletteFXObject_Done                                  ;8DEE65;
    dw $000A,$4880,$3800,$0C00                                           ;8DEE67;
    dw Instruction_PaletteFXObject_Done                                  ;8DEE6F;
    dw $000A,$4460,$3400,$0800                                           ;8DEE71;
    dw Instruction_PaletteFXObject_Done                                  ;8DEE79;
    dw $000A,$4040,$3400,$0800                                           ;8DEE7B;
    dw Instruction_PaletteFXObject_Done                                  ;8DEE83;
    dw $000A,$4460,$3400,$0800                                           ;8DEE85;
    dw Instruction_PaletteFXObject_Done                                  ;8DEE8D;
    dw $000A,$4880,$3800,$0C00                                           ;8DEE8F;
    dw Instruction_PaletteFXObject_Done                                  ;8DEE97;
    dw $000A,$4CA0,$3800,$0C00                                           ;8DEE99;
    dw Instruction_PaletteFXObject_Done                                  ;8DEEA1;
    dw $000A,$50C0,$3C21,$1000                                           ;8DEEA3;
    dw Instruction_PaletteFXObject_Done                                  ;8DEEAB;
    dw $000A,$54E0,$3C21,$1000                                           ;8DEEAD;
    dw Instruction_PaletteFXObject_Done                                  ;8DEEB5;
    dw $000A,$5901,$4042,$1420                                           ;8DEEB7;
    dw Instruction_PaletteFXObject_Done                                  ;8DEEBF;
    dw Instruction_PaletteFXObject_GotoY                                 ;8DEEC1;
    dw InstList_PaletteFXObject_Brinstar8_1                              ;8DEEC3;

PreInstruction_PaletteFXObject_DeleteIfAreaMiniBossIsDead:
    PHX                                                                  ;8DEEC5;
    LDX.W $079F                                                          ;8DEEC6;
    LDA.L $7ED828,X                                                      ;8DEEC9;
    PLX                                                                  ;8DEECD;
    AND.W #$0002                                                         ;8DEECE;
    BEQ .return                                                          ;8DEED1;
    STZ.W $1E7D,X                                                        ;8DEED3;

.return:
    RTS                                                                  ;8DEED6;


InstList_PaletteFXObject_Brinstar2_0:
    dw Instruction_PaletteFXObject_ColorIndexInY                         ;8DEED7;
    dw $00C8                                                             ;8DEED9;

InstList_PaletteFXObject_Brinstar2_1:
    dw $000A,$4C17,$280F,$2409,$1C07,$1405,$0C03,$0802                   ;8DEEDB;
    dw $0401                                                             ;8DEEEB;
    dw Instruction_PaletteFXObject_Done                                  ;8DEEED;
    dw $000A,$4816,$240E,$2008,$1806,$1004,$0802,$0401                   ;8DEEEF;
    dw $0000                                                             ;8DEEFF;
    dw Instruction_PaletteFXObject_Done                                  ;8DEF01;
    dw $000A,$4415,$200D,$1C07,$1405,$0C03,$0401,$0000                   ;8DEF03;
    dw $0000                                                             ;8DEF13;
    dw Instruction_PaletteFXObject_Done                                  ;8DEF15;
    dw $000A,$4014,$1C0C,$1806,$1004,$0802,$0000,$0000                   ;8DEF17;
    dw $0000                                                             ;8DEF27;
    dw Instruction_PaletteFXObject_Done                                  ;8DEF29;
    dw $000A,$3C13,$180B,$1405,$0C03,$0401,$0000,$0000                   ;8DEF2B;
    dw $0000                                                             ;8DEF3B;
    dw Instruction_PaletteFXObject_Done                                  ;8DEF3D;
    dw $000A,$3812,$140A,$1004,$0802,$0000,$0000,$0000                   ;8DEF3F;
    dw $0000                                                             ;8DEF4F;
    dw Instruction_PaletteFXObject_Done                                  ;8DEF51;
    dw $000A,$3411,$1009,$0C03,$0401,$0000,$0000,$0000                   ;8DEF53;
    dw $0000                                                             ;8DEF63;
    dw Instruction_PaletteFXObject_Done                                  ;8DEF65;
    dw $000A,$3010,$0C08,$0802,$0000,$0000,$0000,$0000                   ;8DEF67;
    dw $0000                                                             ;8DEF77;
    dw Instruction_PaletteFXObject_Done                                  ;8DEF79;
    dw $000A,$3411,$1009,$0C03,$0401,$0000,$0000,$0000                   ;8DEF7B;
    dw $0000                                                             ;8DEF8B;
    dw Instruction_PaletteFXObject_Done                                  ;8DEF8D;
    dw $000A,$3812,$140A,$1004,$0802,$0000,$0000,$0000                   ;8DEF8F;
    dw $0000                                                             ;8DEF9F;
    dw Instruction_PaletteFXObject_Done                                  ;8DEFA1;
    dw $000A,$3C13,$180B,$1405,$0C03,$0401,$0000,$0000                   ;8DEFA3;
    dw $0000                                                             ;8DEFB3;
    dw Instruction_PaletteFXObject_Done                                  ;8DEFB5;
    dw $000A,$4014,$1C0C,$1806,$1004,$0802,$0000,$0000                   ;8DEFB7;
    dw $0000                                                             ;8DEFC7;
    dw Instruction_PaletteFXObject_Done                                  ;8DEFC9;
    dw $000A,$4415,$200D,$1C07,$1405,$0C03,$0401,$0000                   ;8DEFCB;
    dw $0000                                                             ;8DEFDB;
    dw Instruction_PaletteFXObject_Done                                  ;8DEFDD;
    dw $000A,$4816,$240E,$2008,$1806,$1004,$0802,$0401                   ;8DEFDF;
    dw $0000                                                             ;8DEFEF;
    dw Instruction_PaletteFXObject_Done                                  ;8DEFF1;
    dw Instruction_PaletteFXObject_GotoY                                 ;8DEFF3;
    dw InstList_PaletteFXObject_Brinstar2_1                              ;8DEFF5;

InstList_PaletteFXObject_Crateria80_Brinstar4_0:
    dw Instruction_PaletteFXObject_ColorIndexInY                         ;8DEFF7;
    dw $00E2                                                             ;8DEFF9;

InstList_PaletteFXObject_Crateria80_Brinstar4_1:
    dw $000A,$02BF,$017F,$0015                                           ;8DEFFB;
    dw Instruction_PaletteFXObject_ColorIndex_Plus12                     ;8DF003;
    dw $7FFF                                                             ;8DF005;
    dw Instruction_PaletteFXObject_Done                                  ;8DF007;
    dw $000A,$023B,$00FB,$0011                                           ;8DF009;
    dw Instruction_PaletteFXObject_ColorIndex_Plus12                     ;8DF011;
    dw $739C                                                             ;8DF013;
    dw Instruction_PaletteFXObject_Done                                  ;8DF015;
    dw $000A,$01D8,$0098,$000E                                           ;8DF017;
    dw Instruction_PaletteFXObject_ColorIndex_Plus12                     ;8DF01F;
    dw $5AD6                                                             ;8DF021;
    dw Instruction_PaletteFXObject_Done                                  ;8DF023;
    dw $000A,$0154,$0055,$000B                                           ;8DF025;
    dw Instruction_PaletteFXObject_ColorIndex_Plus12                     ;8DF02D;
    dw $4E73                                                             ;8DF02F;
    dw Instruction_PaletteFXObject_Done                                  ;8DF031;
    dw $000A,$00D0,$0010,$0007                                           ;8DF033;
    dw Instruction_PaletteFXObject_ColorIndex_Plus12                     ;8DF03B;
    dw $4631                                                             ;8DF03D;
    dw Instruction_PaletteFXObject_Done                                  ;8DF03F;
    dw $000A,$00AA,$000B,$0004                                           ;8DF041;
    dw Instruction_PaletteFXObject_ColorIndex_Plus12                     ;8DF049;
    dw $3DEF                                                             ;8DF04B;
    dw Instruction_PaletteFXObject_Done                                  ;8DF04D;
    dw UNUSED_Inst_PaletteFXObject_QueueSoundInY_Lib2_Max6_8DC673        ;8DF04F;
    db $18                                                               ;8DF051;
    dw $000A,$00D0,$0010,$0007                                           ;8DF052;
    dw Instruction_PaletteFXObject_ColorIndex_Plus12                     ;8DF05A;
    dw $4631                                                             ;8DF05C;
    dw Instruction_PaletteFXObject_Done                                  ;8DF05E;
    dw $000A,$0154,$0055,$000B                                           ;8DF060;
    dw Instruction_PaletteFXObject_ColorIndex_Plus12                     ;8DF068;
    dw $4E73                                                             ;8DF06A;
    dw Instruction_PaletteFXObject_Done                                  ;8DF06C;
    dw $000A,$01D8,$0098,$000E                                           ;8DF06E;
    dw Instruction_PaletteFXObject_ColorIndex_Plus12                     ;8DF076;
    dw $5AD6                                                             ;8DF078;
    dw Instruction_PaletteFXObject_Done                                  ;8DF07A;
    dw $000A,$023B,$00FB,$0011                                           ;8DF07C;
    dw Instruction_PaletteFXObject_ColorIndex_Plus12                     ;8DF084;
    dw $739C                                                             ;8DF086;
    dw Instruction_PaletteFXObject_Done                                  ;8DF088;
    dw Instruction_PaletteFXObject_GotoY                                 ;8DF08A;
    dw InstList_PaletteFXObject_Crateria80_Brinstar4_1                   ;8DF08C;

InstList_PaletteFXObject_Norfair2_0:
    dw Instruction_PaletteFXObject_ColorIndexInY                         ;8DF08E;
    dw $006A                                                             ;8DF090;

InstList_PaletteFXObject_Norfair2_1:
    dw Instruction_PaletteFXObject_1EED_InY                              ;8DF092;
    db $00                                                               ;8DF094;
    dw $0010,$09FD,$093B,$0459                                           ;8DF095;
    dw Instruction_PaletteFXObject_ColorIndex_Plus8                      ;8DF09D;
    dw $09FD,$4A52                                                       ;8DF09F;
    dw Instruction_PaletteFXObject_Done                                  ;8DF0A3;
    dw Instruction_PaletteFXObject_1EED_InY                              ;8DF0A5;
    db $01                                                               ;8DF0A7;
    dw $0004,$0E3D,$0D7C,$089A                                           ;8DF0A8;
    dw Instruction_PaletteFXObject_ColorIndex_Plus8                      ;8DF0B0;
    dw $0E3D,$4214                                                       ;8DF0B2;
    dw Instruction_PaletteFXObject_Done                                  ;8DF0B6;
    dw Instruction_PaletteFXObject_1EED_InY                              ;8DF0B8;
    db $02                                                               ;8DF0BA;
    dw $0004,$165E,$0DBC,$08FB                                           ;8DF0BB;
    dw Instruction_PaletteFXObject_ColorIndex_Plus8                      ;8DF0C3;
    dw $165E,$39F5                                                       ;8DF0C5;
    dw Instruction_PaletteFXObject_Done                                  ;8DF0C9;
    dw Instruction_PaletteFXObject_1EED_InY                              ;8DF0CB;
    db $03                                                               ;8DF0CD;
    dw $0005,$1A9E,$11FD,$0D3C                                           ;8DF0CE;
    dw Instruction_PaletteFXObject_ColorIndex_Plus8                      ;8DF0D6;
    dw $1A9E,$31D7                                                       ;8DF0D8;
    dw Instruction_PaletteFXObject_Done                                  ;8DF0DC;
    dw Instruction_PaletteFXObject_1EED_InY                              ;8DF0DE;
    db $04                                                               ;8DF0E0;
    dw $0006,$1EBE,$161D,$119C                                           ;8DF0E1;
    dw Instruction_PaletteFXObject_ColorIndex_Plus8                      ;8DF0E9;
    dw $1EBE,$29D9                                                       ;8DF0EB;
    dw Instruction_PaletteFXObject_Done                                  ;8DF0EF;
    dw Instruction_PaletteFXObject_1EED_InY                              ;8DF0F1;
    db $05                                                               ;8DF0F3;
    dw $0007,$22FE,$1A5E,$15DD                                           ;8DF0F4;
    dw Instruction_PaletteFXObject_ColorIndex_Plus8                      ;8DF0FC;
    dw $22FE,$21BA                                                       ;8DF0FE;
    dw Instruction_PaletteFXObject_Done                                  ;8DF102;
    dw Instruction_PaletteFXObject_1EED_InY                              ;8DF104;
    db $06                                                               ;8DF106;
    dw $0008,$2B1F,$1A9E,$163E                                           ;8DF107;
    dw Instruction_PaletteFXObject_ColorIndex_Plus8                      ;8DF10F;
    dw $2B1F,$199C                                                       ;8DF111;
    dw Instruction_PaletteFXObject_Done                                  ;8DF115;
    dw Instruction_PaletteFXObject_1EED_InY                              ;8DF117;
    db $07                                                               ;8DF119;
    dw $0008,$2F5F,$1EDF,$1A7F                                           ;8DF11A;
    dw Instruction_PaletteFXObject_ColorIndex_Plus8                      ;8DF122;
    dw $2F5F,$0D7F                                                       ;8DF124;
    dw Instruction_PaletteFXObject_Done                                  ;8DF128;
    dw Instruction_PaletteFXObject_1EED_InY                              ;8DF12A;
    db $08                                                               ;8DF12C;
    dw $0008,$2F5F,$1EDF,$1A7F                                           ;8DF12D;
    dw Instruction_PaletteFXObject_ColorIndex_Plus8                      ;8DF135;
    dw $2F5F,$0D7F                                                       ;8DF137;
    dw Instruction_PaletteFXObject_Done                                  ;8DF13B;
    dw Instruction_PaletteFXObject_1EED_InY                              ;8DF13D;
    db $09                                                               ;8DF13F;
    dw $0008,$2B1F,$1A9E,$163E                                           ;8DF140;
    dw Instruction_PaletteFXObject_ColorIndex_Plus8                      ;8DF148;
    dw $2B1F,$199C                                                       ;8DF14A;
    dw Instruction_PaletteFXObject_Done                                  ;8DF14E;
    dw Instruction_PaletteFXObject_1EED_InY                              ;8DF150;
    db $0A                                                               ;8DF152;
    dw $0007,$22FE,$1A5E,$15DD                                           ;8DF153;
    dw Instruction_PaletteFXObject_ColorIndex_Plus8                      ;8DF15B;
    dw $22FE,$21BA                                                       ;8DF15D;
    dw Instruction_PaletteFXObject_Done                                  ;8DF161;
    dw Instruction_PaletteFXObject_1EED_InY                              ;8DF163;
    db $0B                                                               ;8DF165;
    dw $0006,$1EBE,$161D,$119C                                           ;8DF166;
    dw Instruction_PaletteFXObject_ColorIndex_Plus8                      ;8DF16E;
    dw $1EBE,$29D9                                                       ;8DF170;
    dw Instruction_PaletteFXObject_Done                                  ;8DF174;
    dw Instruction_PaletteFXObject_1EED_InY                              ;8DF176;
    db $0C                                                               ;8DF178;
    dw $0005,$1A9E,$11FD,$0D3C                                           ;8DF179;
    dw Instruction_PaletteFXObject_ColorIndex_Plus8                      ;8DF181;
    dw $1A9E,$31D7                                                       ;8DF183;
    dw Instruction_PaletteFXObject_Done                                  ;8DF187;
    dw Instruction_PaletteFXObject_1EED_InY                              ;8DF189;
    db $0D                                                               ;8DF18B;
    dw $0004,$165E,$0DBC,$08FB                                           ;8DF18C;
    dw Instruction_PaletteFXObject_ColorIndex_Plus8                      ;8DF194;
    dw $165E,$39F5                                                       ;8DF196;
    dw Instruction_PaletteFXObject_Done                                  ;8DF19A;
    dw Instruction_PaletteFXObject_1EED_InY                              ;8DF19C;
    db $0E                                                               ;8DF19E;
    dw $0004,$0E3D,$0D7C,$089A                                           ;8DF19F;
    dw Instruction_PaletteFXObject_ColorIndex_Plus8                      ;8DF1A7;
    dw $0E3D,$4214                                                       ;8DF1A9;
    dw Instruction_PaletteFXObject_Done                                  ;8DF1AD;
    dw Instruction_PaletteFXObject_1EED_InY                              ;8DF1AF;
    db $0F                                                               ;8DF1B1;
    dw $0010,$09FD,$093B,$0459                                           ;8DF1B2;
    dw Instruction_PaletteFXObject_ColorIndex_Plus8                      ;8DF1BA;
    dw $09FD,$4A52                                                       ;8DF1BC;
    dw Instruction_PaletteFXObject_Done                                  ;8DF1C0;
    dw Instruction_PaletteFXObject_GotoY                                 ;8DF1C2;
    dw InstList_PaletteFXObject_Norfair2_1                               ;8DF1C4;

Instruction_PaletteFXObject_1EED_InY:
    LDA.W $0000,Y                                                        ;8DF1C6;
    AND.W #$00FF                                                         ;8DF1C9;
    STA.W $1EED                                                          ;8DF1CC;
    INY                                                                  ;8DF1CF;
    RTS                                                                  ;8DF1D0;


InstList_PaletteFXObject_Norfair4_0:
    dw Instruction_PaletteFXObject_ColorIndexInY                         ;8DF1D1;
    dw $0082                                                             ;8DF1D3;

InstList_PaletteFXObject_Norfair4_1:
    dw $0010,$09FD,$093B,$0459                                           ;8DF1D5;
    dw Instruction_PaletteFXObject_ColorIndex_Plus10                     ;8DF1DD;
    dw $4309,$0C77                                                       ;8DF1DF;
    dw Instruction_PaletteFXObject_Done                                  ;8DF1E3;
    dw $0004,$0E3D,$0D7C,$089A                                           ;8DF1E5;
    dw Instruction_PaletteFXObject_ColorIndex_Plus10                     ;8DF1ED;
    dw $36AC,$0CB8                                                       ;8DF1EF;
    dw Instruction_PaletteFXObject_Done                                  ;8DF1F3;
    dw $0004,$165E,$0DBC,$08FB                                           ;8DF1F5;
    dw Instruction_PaletteFXObject_ColorIndex_Plus10                     ;8DF1FD;
    dw $328F,$1119                                                       ;8DF1FF;
    dw Instruction_PaletteFXObject_Done                                  ;8DF203;
    dw $0005,$1A9E,$11FD,$0D3C                                           ;8DF205;
    dw Instruction_PaletteFXObject_ColorIndex_Plus10                     ;8DF20D;
    dw $2A52,$157A                                                       ;8DF20F;
    dw Instruction_PaletteFXObject_Done                                  ;8DF213;
    dw $0006,$1EBE,$161D,$119C                                           ;8DF215;
    dw Instruction_PaletteFXObject_ColorIndex_Plus10                     ;8DF21D;
    dw $2214,$15BB                                                       ;8DF21F;
    dw Instruction_PaletteFXObject_Done                                  ;8DF223;
    dw $0007,$22FE,$1A5E,$15DD                                           ;8DF225;
    dw Instruction_PaletteFXObject_ColorIndex_Plus10                     ;8DF22D;
    dw $1DF7,$1A1C                                                       ;8DF22F;
    dw Instruction_PaletteFXObject_Done                                  ;8DF233;
    dw $0008,$2B1F,$1A9E,$163E                                           ;8DF235;
    dw Instruction_PaletteFXObject_ColorIndex_Plus10                     ;8DF23D;
    dw $15BA,$1E7D                                                       ;8DF23F;
    dw Instruction_PaletteFXObject_Done                                  ;8DF243;
    dw $0008,$2F5F,$1EDF,$1A7F                                           ;8DF245;
    dw Instruction_PaletteFXObject_ColorIndex_Plus10                     ;8DF24D;
    dw $0D7F,$22FF                                                       ;8DF24F;
    dw Instruction_PaletteFXObject_Done                                  ;8DF253;
    dw $0008,$2F5F,$1EDF,$1A7F                                           ;8DF255;
    dw Instruction_PaletteFXObject_ColorIndex_Plus10                     ;8DF25D;
    dw $0D7F,$22FF                                                       ;8DF25F;
    dw Instruction_PaletteFXObject_Done                                  ;8DF263;
    dw $0008,$2B1F,$1A9E,$163E                                           ;8DF265;
    dw Instruction_PaletteFXObject_ColorIndex_Plus10                     ;8DF26D;
    dw $15BA,$1E7D                                                       ;8DF26F;
    dw Instruction_PaletteFXObject_Done                                  ;8DF273;
    dw $0007,$22FE,$1A5E,$15DD                                           ;8DF275;
    dw Instruction_PaletteFXObject_ColorIndex_Plus10                     ;8DF27D;
    dw $1DF7,$1A1C                                                       ;8DF27F;
    dw Instruction_PaletteFXObject_Done                                  ;8DF283;
    dw $0006,$1EBE,$161D,$119C                                           ;8DF285;
    dw Instruction_PaletteFXObject_ColorIndex_Plus10                     ;8DF28D;
    dw $2214,$15BB                                                       ;8DF28F;
    dw Instruction_PaletteFXObject_Done                                  ;8DF293;
    dw $0005,$1A9E,$11FD,$0D3C                                           ;8DF295;
    dw Instruction_PaletteFXObject_ColorIndex_Plus10                     ;8DF29D;
    dw $2A52,$157A                                                       ;8DF29F;
    dw Instruction_PaletteFXObject_Done                                  ;8DF2A3;
    dw $0004,$165E,$0DBC,$08FB                                           ;8DF2A5;
    dw Instruction_PaletteFXObject_ColorIndex_Plus10                     ;8DF2AD;
    dw $328F,$1119                                                       ;8DF2AF;
    dw Instruction_PaletteFXObject_Done                                  ;8DF2B3;
    dw $0004,$0E3D,$0D7C,$089A                                           ;8DF2B5;
    dw Instruction_PaletteFXObject_ColorIndex_Plus10                     ;8DF2BD;
    dw $36AC,$0CB8                                                       ;8DF2BF;
    dw Instruction_PaletteFXObject_Done                                  ;8DF2C3;
    dw $0010,$09FD,$093B,$0459                                           ;8DF2C5;
    dw Instruction_PaletteFXObject_ColorIndex_Plus10                     ;8DF2CD;
    dw $4309,$0C77                                                       ;8DF2CF;
    dw Instruction_PaletteFXObject_Done                                  ;8DF2D3;
    dw Instruction_PaletteFXObject_GotoY                                 ;8DF2D5;
    dw InstList_PaletteFXObject_Norfair4_1                               ;8DF2D7;

InstList_PaletteFXObject_Norfair8_0:
    dw Instruction_PaletteFXObject_ColorIndexInY                         ;8DF2D9;
    dw $00A2                                                             ;8DF2DB;

InstList_PaletteFXObject_Norfair8_1:
    dw $0010,$09FD,$093B,$0459                                           ;8DF2DD;
    dw Instruction_PaletteFXObject_ColorIndex_Plus10                     ;8DF2E5;
    dw $2DB3,$38CF                                                       ;8DF2E7;
    dw Instruction_PaletteFXObject_Done                                  ;8DF2EB;
    dw $0004,$0E3D,$0D7C,$089A                                           ;8DF2ED;
    dw Instruction_PaletteFXObject_ColorIndex_Plus10                     ;8DF2F5;
    dw $2594,$30D1                                                       ;8DF2F7;
    dw Instruction_PaletteFXObject_Done                                  ;8DF2FB;
    dw $0004,$165E,$0DBC,$08FB                                           ;8DF2FD;
    dw Instruction_PaletteFXObject_ColorIndex_Plus10                     ;8DF305;
    dw $2176,$28D3                                                       ;8DF307;
    dw Instruction_PaletteFXObject_Done                                  ;8DF30B;
    dw $0005,$1A9E,$11FD,$0D3C                                           ;8DF30D;
    dw Instruction_PaletteFXObject_ColorIndex_Plus10                     ;8DF315;
    dw $1D57,$24D5                                                       ;8DF317;
    dw Instruction_PaletteFXObject_Done                                  ;8DF31B;
    dw $0006,$1EBE,$161D,$119C                                           ;8DF31D;
    dw Instruction_PaletteFXObject_ColorIndex_Plus10                     ;8DF325;
    dw $1959,$20F7                                                       ;8DF327;
    dw Instruction_PaletteFXObject_Done                                  ;8DF32B;
    dw $0007,$22FE,$1A5E,$15DD                                           ;8DF32D;
    dw Instruction_PaletteFXObject_ColorIndex_Plus10                     ;8DF335;
    dw $153B,$18F9                                                       ;8DF337;
    dw Instruction_PaletteFXObject_Done                                  ;8DF33B;
    dw $0008,$2B1F,$1A9E,$163E                                           ;8DF33D;
    dw Instruction_PaletteFXObject_ColorIndex_Plus10                     ;8DF345;
    dw $111C,$14FB                                                       ;8DF347;
    dw Instruction_PaletteFXObject_Done                                  ;8DF34B;
    dw $0008,$2F5F,$1EDF,$1A7F                                           ;8DF34D;
    dw Instruction_PaletteFXObject_ColorIndex_Plus10                     ;8DF355;
    dw $0D1F,$0D1F                                                       ;8DF357;
    dw Instruction_PaletteFXObject_Done                                  ;8DF35B;
    dw $0008,$2F5F,$1EDF,$1A7F                                           ;8DF35D;
    dw Instruction_PaletteFXObject_ColorIndex_Plus10                     ;8DF365;
    dw $0D1F,$0D1F                                                       ;8DF367;
    dw Instruction_PaletteFXObject_Done                                  ;8DF36B;
    dw $0008,$2B1F,$1A9E,$163E                                           ;8DF36D;
    dw Instruction_PaletteFXObject_ColorIndex_Plus10                     ;8DF375;
    dw $111C,$14FB                                                       ;8DF377;
    dw Instruction_PaletteFXObject_Done                                  ;8DF37B;
    dw $0007,$22FE,$1A5E,$15DD                                           ;8DF37D;
    dw Instruction_PaletteFXObject_ColorIndex_Plus10                     ;8DF385;
    dw $153B,$18F9                                                       ;8DF387;
    dw Instruction_PaletteFXObject_Done                                  ;8DF38B;
    dw $0006,$1EBE,$161D,$119C                                           ;8DF38D;
    dw Instruction_PaletteFXObject_ColorIndex_Plus10                     ;8DF395;
    dw $1959,$20F7                                                       ;8DF397;
    dw Instruction_PaletteFXObject_Done                                  ;8DF39B;
    dw $0005,$1A9E,$11FD,$0D3C                                           ;8DF39D;
    dw Instruction_PaletteFXObject_ColorIndex_Plus10                     ;8DF3A5;
    dw $1D57,$24D5                                                       ;8DF3A7;
    dw Instruction_PaletteFXObject_Done                                  ;8DF3AB;
    dw $0004,$165E,$0DBC,$08FB                                           ;8DF3AD;
    dw Instruction_PaletteFXObject_ColorIndex_Plus10                     ;8DF3B5;
    dw $2176,$28D3                                                       ;8DF3B7;
    dw Instruction_PaletteFXObject_Done                                  ;8DF3BB;
    dw $0004,$0E3D,$0D7C,$089A                                           ;8DF3BD;
    dw Instruction_PaletteFXObject_ColorIndex_Plus10                     ;8DF3C5;
    dw $2594,$30D1                                                       ;8DF3C7;
    dw Instruction_PaletteFXObject_Done                                  ;8DF3CB;
    dw $0010,$09FD,$093B,$0459                                           ;8DF3CD;
    dw Instruction_PaletteFXObject_ColorIndex_Plus10                     ;8DF3D5;
    dw $2DB3,$38CF                                                       ;8DF3D7;
    dw Instruction_PaletteFXObject_Done                                  ;8DF3DB;
    dw Instruction_PaletteFXObject_GotoY                                 ;8DF3DD;
    dw InstList_PaletteFXObject_Norfair8_1                               ;8DF3DF;

InstList_PaletteFXObject_Norfair10_0:
    dw Instruction_PaletteFXObject_ColorIndexInY                         ;8DF3E1;
    dw $00C2                                                             ;8DF3E3;

InstList_PaletteFXObject_Norfair10_1:
    dw $0010,$09DA,$091A,$087A                                           ;8DF3E5;
    dw Instruction_PaletteFXObject_ColorIndex_Plus10                     ;8DF3ED;
    dw $08A8,$0C05                                                       ;8DF3EF;
    dw Instruction_PaletteFXObject_Done                                  ;8DF3F3;
    dw $0004,$0DDA,$093A,$089A                                           ;8DF3F5;
    dw Instruction_PaletteFXObject_ColorIndex_Plus10                     ;8DF3FD;
    dw $08AA,$0828                                                       ;8DF3FF;
    dw Instruction_PaletteFXObject_Done                                  ;8DF403;
    dw $0004,$0DFA,$0D5A,$08BA                                           ;8DF405;
    dw Instruction_PaletteFXObject_ColorIndex_Plus10                     ;8DF40D;
    dw $08AC,$084A                                                       ;8DF40F;
    dw Instruction_PaletteFXObject_Done                                  ;8DF413;
    dw $0005,$11FA,$0D7A,$08FA                                           ;8DF415;
    dw Instruction_PaletteFXObject_ColorIndex_Plus10                     ;8DF41D;
    dw $08CF,$086D                                                       ;8DF41F;
    dw Instruction_PaletteFXObject_Done                                  ;8DF423;
    dw $0006,$161A,$119A,$0D1A                                           ;8DF425;
    dw Instruction_PaletteFXObject_ColorIndex_Plus10                     ;8DF42D;
    dw $08D1,$0890                                                       ;8DF42F;
    dw Instruction_PaletteFXObject_Done                                  ;8DF433;
    dw $0007,$1A1A,$11BA,$0D3A                                           ;8DF435;
    dw Instruction_PaletteFXObject_ColorIndex_Plus10                     ;8DF43D;
    dw $08F4,$08B3                                                       ;8DF43F;
    dw Instruction_PaletteFXObject_Done                                  ;8DF443;
    dw $0008,$1A3A,$15DA,$0D7A                                           ;8DF445;
    dw Instruction_PaletteFXObject_ColorIndex_Plus10                     ;8DF44D;
    dw $08F6,$08D5                                                       ;8DF44F;
    dw Instruction_PaletteFXObject_Done                                  ;8DF453;
    dw $0008,$225A,$1A1A,$11BA                                           ;8DF455;
    dw Instruction_PaletteFXObject_ColorIndex_Plus10                     ;8DF45D;
    dw $091A,$091A                                                       ;8DF45F;
    dw Instruction_PaletteFXObject_Done                                  ;8DF463;
    dw $0008,$225A,$1A1A,$11BA                                           ;8DF465;
    dw Instruction_PaletteFXObject_ColorIndex_Plus10                     ;8DF46D;
    dw $091A,$091A                                                       ;8DF46F;
    dw Instruction_PaletteFXObject_Done                                  ;8DF473;
    dw $0008,$1A3A,$15DA,$0D7A                                           ;8DF475;
    dw Instruction_PaletteFXObject_ColorIndex_Plus10                     ;8DF47D;
    dw $08F6,$08D5                                                       ;8DF47F;
    dw Instruction_PaletteFXObject_Done                                  ;8DF483;
    dw $0007,$1A1A,$11BA,$0D3A                                           ;8DF485;
    dw Instruction_PaletteFXObject_ColorIndex_Plus10                     ;8DF48D;
    dw $08F4,$08B3                                                       ;8DF48F;
    dw Instruction_PaletteFXObject_Done                                  ;8DF493;
    dw $0006,$161A,$119A,$0D1A                                           ;8DF495;
    dw Instruction_PaletteFXObject_ColorIndex_Plus10                     ;8DF49D;
    dw $08D1,$0890                                                       ;8DF49F;
    dw Instruction_PaletteFXObject_Done                                  ;8DF4A3;
    dw $0005,$11FA,$0D7A,$08FA                                           ;8DF4A5;
    dw Instruction_PaletteFXObject_ColorIndex_Plus10                     ;8DF4AD;
    dw $08CF,$086D                                                       ;8DF4AF;
    dw Instruction_PaletteFXObject_Done                                  ;8DF4B3;
    dw $0004,$0DFA,$0D5A,$08BA                                           ;8DF4B5;
    dw Instruction_PaletteFXObject_ColorIndex_Plus10                     ;8DF4BD;
    dw $08AC,$084A                                                       ;8DF4BF;
    dw Instruction_PaletteFXObject_Done                                  ;8DF4C3;
    dw $0004,$0DDA,$093A,$089A                                           ;8DF4C5;
    dw Instruction_PaletteFXObject_ColorIndex_Plus10                     ;8DF4CD;
    dw $08AA,$0828                                                       ;8DF4CF;
    dw Instruction_PaletteFXObject_Done                                  ;8DF4D3;
    dw $0010,$09DA,$091A,$087A                                           ;8DF4D5;
    dw Instruction_PaletteFXObject_ColorIndex_Plus10                     ;8DF4DD;
    dw $08A8,$0C05                                                       ;8DF4DF;
    dw Instruction_PaletteFXObject_Done                                  ;8DF4E3;
    dw Instruction_PaletteFXObject_GotoY                                 ;8DF4E5;
    dw InstList_PaletteFXObject_Norfair10_1                              ;8DF4E7;

InstList_PaletteFXObject_Maridia1_0:
    dw Instruction_PaletteFXObject_ColorIndexInY                         ;8DF4E9;
    dw $0048                                                             ;8DF4EB;

InstList_PaletteFXObject_Maridia1_1:
    dw $000A,$3ED9,$2E57,$2A35,$25F3,$25D2,$1DB0,$196E                   ;8DF4ED;
    dw $112E                                                             ;8DF4FD;
    dw Instruction_PaletteFXObject_Done                                  ;8DF4FF;
    dw $000A,$2E57,$2A35,$25F3,$3ED9,$1DB0,$196E,$112E                   ;8DF501;
    dw $25D2                                                             ;8DF511;
    dw Instruction_PaletteFXObject_Done                                  ;8DF513;
    dw $000A,$2A35,$25F3,$3ED9,$2E57,$196E,$112E,$25D2                   ;8DF515;
    dw $1DB0                                                             ;8DF525;
    dw Instruction_PaletteFXObject_Done                                  ;8DF527;
    dw $000A,$25F3,$3ED9,$2E57,$2A35,$112E,$25D2,$1DB0                   ;8DF529;
    dw $196E                                                             ;8DF539;
    dw Instruction_PaletteFXObject_Done                                  ;8DF53B;
    dw Instruction_PaletteFXObject_GotoY                                 ;8DF53D;
    dw InstList_PaletteFXObject_Maridia1_1                               ;8DF53F;

InstList_PaletteFXObject_Maridia2_0:
    dw Instruction_PaletteFXObject_ColorIndexInY                         ;8DF541;
    dw $0050                                                             ;8DF543;

InstList_PaletteFXObject_Maridia2_1:
    dw $000A,$25D2,$1DB0,$196E,$112E                                     ;8DF545;
    dw Instruction_PaletteFXObject_Done                                  ;8DF54F;
    dw $000A,$1DB0,$196E,$112E,$25D2                                     ;8DF551;
    dw Instruction_PaletteFXObject_Done                                  ;8DF55B;
    dw $000A,$196E,$112E,$25D2,$1DB0                                     ;8DF55D;
    dw Instruction_PaletteFXObject_Done                                  ;8DF567;
    dw $000A,$112E,$25D2,$1DB0,$196E                                     ;8DF569;
    dw Instruction_PaletteFXObject_Done                                  ;8DF573;
    dw Instruction_PaletteFXObject_GotoY                                 ;8DF575;
    dw InstList_PaletteFXObject_Maridia2_1                               ;8DF577;

InstList_PaletteFXObject_Maridia4_0:
    dw Instruction_PaletteFXObject_ColorIndexInY                         ;8DF579;
    dw $0068                                                             ;8DF57B;

InstList_PaletteFXObject_Maridia4_1:
    dw $0002,$0400,$0C22,$1864,$2086,$2CC9,$1C65,$1043                   ;8DF57D;
    dw $0821                                                             ;8DF58D;
    dw Instruction_PaletteFXObject_Done                                  ;8DF58F;
    dw $0002,$0C22,$1864,$2086,$2CC9,$1C65,$1043,$0821                   ;8DF591;
    dw $0400                                                             ;8DF5A1;
    dw Instruction_PaletteFXObject_Done                                  ;8DF5A3;
    dw $0002,$1864,$2086,$2CC9,$1C65,$1043,$0821,$0400                   ;8DF5A5;
    dw $0C22                                                             ;8DF5B5;
    dw Instruction_PaletteFXObject_Done                                  ;8DF5B7;
    dw $0002,$2086,$2CC9,$1C65,$1043,$0821,$0400,$0C22                   ;8DF5B9;
    dw $1864                                                             ;8DF5C9;
    dw Instruction_PaletteFXObject_Done                                  ;8DF5CB;
    dw $0002,$2CC9,$1C65,$1043,$0821,$0400,$0C22,$1864                   ;8DF5CD;
    dw $2086                                                             ;8DF5DD;
    dw Instruction_PaletteFXObject_Done                                  ;8DF5DF;
    dw $0002,$1C65,$1043,$0821,$0400,$0C22,$1864,$2086                   ;8DF5E1;
    dw $2CC9                                                             ;8DF5F1;
    dw Instruction_PaletteFXObject_Done                                  ;8DF5F3;
    dw $0002,$1043,$0821,$0400,$0C22,$1864,$2086,$2CC9                   ;8DF5F5;
    dw $1C65                                                             ;8DF605;
    dw Instruction_PaletteFXObject_Done                                  ;8DF607;
    dw $0002,$0821,$0400,$0C22,$1864,$2086,$2CC9,$1C65                   ;8DF609;
    dw $1043                                                             ;8DF619;
    dw Instruction_PaletteFXObject_Done                                  ;8DF61B;
    dw Instruction_PaletteFXObject_GotoY                                 ;8DF61D;
    dw InstList_PaletteFXObject_Maridia4_1                               ;8DF61F;

PreInstruction_PaletteFXObject_DeleteIf2MoreObjectsSpawned:
    LDA.W $1E79,X                                                        ;8DF621;
    BEQ .return                                                          ;8DF624;
    STZ.W $1E7D,X                                                        ;8DF626;

.return:
    RTS                                                                  ;8DF629;


InstList_PaletteFXObject_Tourian4:
    dw Instruction_PaletteFXObject_ColorIndexInY                         ;8DF62A;
    dw $00E8                                                             ;8DF62C;
    dw Instruction_PaletteFXObject_GotoY                                 ;8DF62E;
    dw InstList_PaletteFXObject_Common_Tourian2_Tourian4_0               ;8DF630;

InstList_PaletteFXObject_Tourian2:
    dw Instruction_PaletteFXObject_ColorIndexInY                         ;8DF632;
    dw $00E8                                                             ;8DF634;

InstList_PaletteFXObject_Common_Tourian2_Tourian4_0:
    dw Instruction_PaletteFXObject_PreInstructionInY                     ;8DF636;
    dw PreInstruction_PaletteFXObject_DeleteIf2MoreObjectsSpawned        ;8DF638;

InstList_PaletteFXObject_Common_Tourian2_Tourian4_1:
    dw $000A,$5294                                                       ;8DF63A;
    dw Instruction_PaletteFXObject_ColorIndex_Plus6                      ;8DF63E;
    dw $0019,$0012,$5C00,$4000,$1084,$197F,$7FFF                         ;8DF640;
    dw Instruction_PaletteFXObject_Done                                  ;8DF64E;
    dw $000A,$4A52                                                       ;8DF650;
    dw Instruction_PaletteFXObject_ColorIndex_Plus6                      ;8DF654;
    dw $0016,$000F,$5000,$3400,$1084,$0D1C,$739C                         ;8DF656;
    dw Instruction_PaletteFXObject_Done                                  ;8DF664;
    dw $000A,$4210                                                       ;8DF666;
    dw Instruction_PaletteFXObject_ColorIndex_Plus6                      ;8DF66A;
    dw $0013,$000C,$4400,$2800,$1084,$00B9,$6739                         ;8DF66C;
    dw Instruction_PaletteFXObject_Done                                  ;8DF67A;
    dw $000A,$39CE                                                       ;8DF67C;
    dw Instruction_PaletteFXObject_ColorIndex_Plus6                      ;8DF680;
    dw $0010,$0009,$3800,$1C00,$1084,$0056,$5AD6                         ;8DF682;
    dw Instruction_PaletteFXObject_Done                                  ;8DF690;
    dw $000A,$318C                                                       ;8DF692;
    dw Instruction_PaletteFXObject_ColorIndex_Plus6                      ;8DF696;
    dw $000D,$0006,$2C00,$1000,$1084,$0013,$4E73                         ;8DF698;
    dw Instruction_PaletteFXObject_Done                                  ;8DF6A6;
    dw $000A,$294A                                                       ;8DF6A8;
    dw Instruction_PaletteFXObject_ColorIndex_Plus6                      ;8DF6AC;
    dw $000A,$0003,$2000,$0400,$1084,$0010,$4210                         ;8DF6AE;
    dw Instruction_PaletteFXObject_Done                                  ;8DF6BC;
    dw $000A,$294A                                                       ;8DF6BE;
    dw Instruction_PaletteFXObject_ColorIndex_Plus6                      ;8DF6C2;
    dw $000A,$0003,$2000,$0400,$1084,$0010,$4210                         ;8DF6C4;
    dw Instruction_PaletteFXObject_Done                                  ;8DF6D2;
    dw $000A,$318C                                                       ;8DF6D4;
    dw Instruction_PaletteFXObject_ColorIndex_Plus6                      ;8DF6D8;
    dw $000D,$0006,$2C00,$1000,$1084,$0013,$4E73                         ;8DF6DA;
    dw Instruction_PaletteFXObject_Done                                  ;8DF6E8;
    dw $000A,$39CE                                                       ;8DF6EA;
    dw Instruction_PaletteFXObject_ColorIndex_Plus6                      ;8DF6EE;
    dw $0010,$0009,$3800,$1C00,$1084,$0056,$5AD6                         ;8DF6F0;
    dw Instruction_PaletteFXObject_Done                                  ;8DF6FE;
    dw $000A,$4210                                                       ;8DF700;
    dw Instruction_PaletteFXObject_ColorIndex_Plus6                      ;8DF704;
    dw $0013,$000C,$4400,$2800,$1084,$00B9,$6739                         ;8DF706;
    dw Instruction_PaletteFXObject_Done                                  ;8DF714;
    dw $000A,$4A52                                                       ;8DF716;
    dw Instruction_PaletteFXObject_ColorIndex_Plus6                      ;8DF71A;
    dw $0016,$000F,$5000,$3400,$1084,$0D1C,$739C                         ;8DF71C;
    dw Instruction_PaletteFXObject_Done                                  ;8DF72A;
    dw Instruction_PaletteFXObject_GotoY                                 ;8DF72C;
    dw InstList_PaletteFXObject_Common_Tourian2_Tourian4_1               ;8DF72E;

Setup_PaletteFXObject_Brinstar8:
    PHX                                                                  ;8DF730;
    LDX.W $079F                                                          ;8DF731;
    LDA.L $7ED828,X                                                      ;8DF734;
    PLX                                                                  ;8DF738;
    AND.W #$0002                                                         ;8DF739;
    BEQ .return                                                          ;8DF73C;
    LDA.W #$0000                                                         ;8DF73E;
    STA.W $1E7D,Y                                                        ;8DF741;

.return:
    RTS                                                                  ;8DF744;


PaletteFXObjects_Nothing:
    dw RTS_8DC685                                                        ;8DF745;
    dw InstList_PaletteFXObject_Nothing                                  ;8DF747;

PaletteFXObjects_GreyOutTourianStatue_Draygon:
    dw RTS_8DC685                                                        ;8DF749;
    dw InstList_PaletteFXObject_GreyOutTourianStatue_Draygon             ;8DF74B;

PaletteFXObjects_GreyOutTourianStatue_Kraid:
    dw RTS_8DC685                                                        ;8DF74D;
    dw InstList_PaletteFXObject_GreyOutTourianStatue_Kraid               ;8DF74F;

PaletteFXObjects_GreyOutTourianStatue_Ridley:
    dw RTS_8DC685                                                        ;8DF751;
    dw InstList_PaletteFXObject_GreyOutTourianStatue_Ridley              ;8DF753;

PaletteFXObjects_GreyOutTourianStatue_Phantoon:
    dw RTS_8DC685                                                        ;8DF755;
    dw InstList_PaletteFXObject_GreyOutTourianStatue_Phantoon            ;8DF757;

PaletteFXObjects_BombTorizoBelly:
    dw RTS_8DC685                                                        ;8DF759;
    dw InstList_PaletteFXObject_BombTorizoBelly_0                        ;8DF75B;

PaletteFXObjects_GoldenTorizoBelly:
    dw RTS_8DC685                                                        ;8DF75D;
    dw InstList_PaletteFXObject_GoldenTorizoBelly_0                      ;8DF75F;

PaletteFXObjects_Norfair1_Tourian1:
    dw Setup_PaletteFXObject_Norfair1_Tourian1                           ;8DF761;
    dw InstList_PaletteFXObject_SamusInHeat_PowerSuit_0                  ;8DF763;

PaletteFXObjects_Crateria1_Lightning:
    dw RTS_8DC685                                                        ;8DF765;
    dw InstList_PaletteFXObject_Crateria1_0                              ;8DF767;

UNUSED_PaletteFXObjects_DarkLightning_8DF769:
    dw RTS_8DC685                                                        ;8DF769;
    dw UNUSED_InstList_PaletteFXObject_DarkLightning_0_8DEC6E            ;8DF76B;

PaletteFXObjects_WreckedShip1_GreenLights:
    dw RTS_8DC685                                                        ;8DF76D;
    dw InstList_PaletteFXObject_WreckedShip1_0                           ;8DF76F;

PaletteFXObjects_WreckedShip1_GreenLights_duplicate:
    dw RTS_8DC685                                                        ;8DF771;
    dw InstList_PaletteFXObject_WreckedShip1_0                           ;8DF773;

PaletteFXObjects_Brinstar1_BlueBackgroundSpores:
    dw RTS_8DC685                                                        ;8DF775;
    dw InstList_PaletteFXObject_Brinstar1_0                              ;8DF777;

PaletteFXObjects_Brinstar8_SporeSpawnBlueBackgroundSpores:
    dw Setup_PaletteFXObject_Brinstar8                                   ;8DF779;
    dw InstList_PaletteFXObject_Brinstar8_0                              ;8DF77B;

PaletteFXObjects_Brinstar2_RedBackgroundGlow:
    dw RTS_8DC685                                                        ;8DF77D;
    dw InstList_PaletteFXObject_Brinstar2_0                              ;8DF77F;

PaletteFXObjects_Crateria80_Brinstar4_BeaconFlashing:
    dw RTS_8DC685                                                        ;8DF781;
    dw InstList_PaletteFXObject_Crateria80_Brinstar4_0                   ;8DF783;

PaletteFXObjects_Norfair2:
    dw RTS_8DC685                                                        ;8DF785;
    dw InstList_PaletteFXObject_Norfair2_0                               ;8DF787;

PaletteFXObjects_Norfair4:
    dw RTS_8DC685                                                        ;8DF789;
    dw InstList_PaletteFXObject_Norfair4_0                               ;8DF78B;

PaletteFXObjects_Norfair8:
    dw RTS_8DC685                                                        ;8DF78D;
    dw InstList_PaletteFXObject_Norfair8_0                               ;8DF78F;

PaletteFXObjects_Norfair10:
    dw RTS_8DC685                                                        ;8DF791;
    dw InstList_PaletteFXObject_Norfair10_0                              ;8DF793;

PaletteFXObjects_Maridia1_SandPits:
    dw RTS_8DC685                                                        ;8DF795;
    dw InstList_PaletteFXObject_Maridia1_0                               ;8DF797;

PaletteFXObjects_Maridia2_SandFalls:
    dw RTS_8DC685                                                        ;8DF799;
    dw InstList_PaletteFXObject_Maridia2_0                               ;8DF79B;

PaletteFXObjects_Maridia4_BackgroundWaterfalls:
    dw RTS_8DC685                                                        ;8DF79D;
    dw InstList_PaletteFXObject_Maridia4_0                               ;8DF79F;

PaletteFXObjects_Tourian2_GlowingArkanoidBlocksAndRedOrbs:
    dw RTS_8DC685                                                        ;8DF7A1;
    dw InstList_PaletteFXObject_Tourian2                                 ;8DF7A3;

UNUSED_PaletteFXObjects_Tourian4_8DF7A5:
    dw RTS_8DC685                                                        ;8DF7A5;
    dw InstList_PaletteFXObject_Tourian4                                 ;8DF7A7;

InstList_PaletteFXObject_Tourian8_0:
    dw Instruction_PaletteFXObject_ColorIndexInY                         ;8DF7A9;
    dw $0132                                                             ;8DF7AB;

InstList_PaletteFXObject_Tourian8_1:
    dw $0002,$5294,$4210,$318C,$2108,$1084,$7FFF                         ;8DF7AD;
    dw Instruction_PaletteFXObject_Done                                  ;8DF7BB;
    dw $0002,$4E75,$3DF1,$2D6D,$1CE8,$0C64,$77BF                         ;8DF7BD;
    dw Instruction_PaletteFXObject_Done                                  ;8DF7CB;
    dw $0002,$4A55,$39D1,$2D6D,$1CE8,$0C64,$739F                         ;8DF7CD;
    dw Instruction_PaletteFXObject_Done                                  ;8DF7DB;
    dw $0002,$4636,$35B2,$294D,$18C9,$0844,$6B5F                         ;8DF7DD;
    dw Instruction_PaletteFXObject_Done                                  ;8DF7EB;
    dw $0002,$3DF6,$3192,$252D,$14A9,$0844,$673F                         ;8DF7ED;
    dw Instruction_PaletteFXObject_Done                                  ;8DF7FB;
    dw $0002,$39D7,$2D72,$210E,$1089,$0424,$5EFF                         ;8DF7FD;
    dw Instruction_PaletteFXObject_Done                                  ;8DF80B;
    dw $0002,$35B7,$2952,$1CEE,$1089,$0424,$5ADF                         ;8DF80D;
    dw Instruction_PaletteFXObject_Done                                  ;8DF81B;
    dw $0002,$3198,$2533,$18CE,$0C69,$0004,$529F                         ;8DF81D;
    dw Instruction_PaletteFXObject_Done                                  ;8DF82B;
    dw $0002,$35B7,$2952,$1CEE,$1089,$0424,$5ADF                         ;8DF82D;
    dw Instruction_PaletteFXObject_Done                                  ;8DF83B;
    dw $0002,$39D7,$2D72,$210E,$1089,$0424,$5EFF                         ;8DF83D;
    dw Instruction_PaletteFXObject_Done                                  ;8DF84B;
    dw $0002,$3DF6,$3192,$252D,$14A9,$0844,$673F                         ;8DF84D;
    dw Instruction_PaletteFXObject_Done                                  ;8DF85B;
    dw $0002,$4636,$35B2,$294D,$18C9,$0844,$6B5F                         ;8DF85D;
    dw Instruction_PaletteFXObject_Done                                  ;8DF86B;
    dw $0002,$4A55,$39D1,$2D6D,$1CE8,$0C64,$739F                         ;8DF86D;
    dw Instruction_PaletteFXObject_Done                                  ;8DF87B;
    dw $0002,$4E75,$3DF1,$2D6D,$1CE8,$0C64,$77BF                         ;8DF87D;
    dw Instruction_PaletteFXObject_Done                                  ;8DF88B;
    dw Instruction_PaletteFXObject_GotoY                                 ;8DF88D;
    dw InstList_PaletteFXObject_Tourian8_1                               ;8DF88F;

InstList_PaletteFXObject_Tourian10_0:
    dw Instruction_PaletteFXObject_ColorIndexInY                         ;8DF891;
    dw $0070                                                             ;8DF893;

InstList_PaletteFXObject_Tourian10_1:
    dw $0004,$081A,$0812,$042B,$0423                                     ;8DF895;
    dw Instruction_PaletteFXObject_Done                                  ;8DF89F;
    dw $0004,$0C37,$0C30,$042A,$0423                                     ;8DF8A1;
    dw Instruction_PaletteFXObject_Done                                  ;8DF8AB;
    dw $0004,$1054,$0C2E,$0849,$0422                                     ;8DF8AD;
    dw Instruction_PaletteFXObject_Done                                  ;8DF8B7;
    dw $0004,$1471,$104C,$0848,$0422                                     ;8DF8B9;
    dw Instruction_PaletteFXObject_Done                                  ;8DF8C3;
    dw $0004,$148E,$106A,$0C66,$0842                                     ;8DF8C5;
    dw Instruction_PaletteFXObject_Done                                  ;8DF8CF;
    dw $0004,$18AB,$1488,$0C65,$0842                                     ;8DF8D1;
    dw Instruction_PaletteFXObject_Done                                  ;8DF8DB;
    dw $0004,$1CC8,$1486,$1084,$0841                                     ;8DF8DD;
    dw Instruction_PaletteFXObject_Done                                  ;8DF8E7;
    dw $0004,$20E5,$18A4,$1083,$0841                                     ;8DF8E9;
    dw Instruction_PaletteFXObject_Done                                  ;8DF8F3;
    dw $0004,$1CC8,$1486,$1084,$0841                                     ;8DF8F5;
    dw Instruction_PaletteFXObject_Done                                  ;8DF8FF;
    dw $0004,$18AB,$1488,$0C65,$0842                                     ;8DF901;
    dw Instruction_PaletteFXObject_Done                                  ;8DF90B;
    dw $0004,$148E,$106A,$0C66,$0842                                     ;8DF90D;
    dw Instruction_PaletteFXObject_Done                                  ;8DF917;
    dw $0004,$1471,$104C,$0848,$0422                                     ;8DF919;
    dw Instruction_PaletteFXObject_Done                                  ;8DF923;
    dw $0004,$1054,$0C2E,$0849,$0422                                     ;8DF925;
    dw Instruction_PaletteFXObject_Done                                  ;8DF92F;
    dw $0004,$0C37,$0C30,$042A,$0423                                     ;8DF931;
    dw Instruction_PaletteFXObject_Done                                  ;8DF93B;
    dw Instruction_PaletteFXObject_GotoY                                 ;8DF93D;
    dw InstList_PaletteFXObject_Tourian10_1                              ;8DF93F;

InstList_PaletteFXObject_Tourian20:
    dw Instruction_PaletteFXObject_ColorIndexInY                         ;8DF941;
    dw $00A8                                                             ;8DF943;
    dw Instruction_PaletteFXObject_GotoY                                 ;8DF945;
    dw InstList_PaletteFXObject_Common_Tourian20_Tourian40               ;8DF947;

InstList_PaletteFXObject_Tourian40:
    dw Instruction_PaletteFXObject_ColorIndexInY                         ;8DF949;
    dw $00E8                                                             ;8DF94B;

InstList_PaletteFXObject_Common_Tourian20_Tourian40:
    dw $0002,$5294,$39CE,$2108,$1084,$0019,$0012                         ;8DF94D;
    dw Instruction_PaletteFXObject_ColorIndex_Plus8                      ;8DF95B;
    dw $7FFF                                                             ;8DF95D;
    dw Instruction_PaletteFXObject_Done                                  ;8DF95F;
    dw $0002,$4E75,$35AF,$1CE8,$0C64,$080D,$0809                         ;8DF961;
    dw Instruction_PaletteFXObject_ColorIndex_Plus8                      ;8DF96F;
    dw $77BF                                                             ;8DF971;
    dw Instruction_PaletteFXObject_Done                                  ;8DF973;
    dw $0002,$4A55,$318F,$1CE9,$0C64,$1000,$1000                         ;8DF975;
    dw Instruction_PaletteFXObject_ColorIndex_Plus8                      ;8DF983;
    dw $739F                                                             ;8DF985;
    dw Instruction_PaletteFXObject_Done                                  ;8DF987;
    dw $0002,$4636,$2D70,$18C9,$0844,$080D,$0809                         ;8DF989;
    dw Instruction_PaletteFXObject_ColorIndex_Plus8                      ;8DF997;
    dw $6B5F                                                             ;8DF999;
    dw Instruction_PaletteFXObject_Done                                  ;8DF99B;
    dw $0002,$3DF6,$2D70,$18CA,$0844,$0019,$0012                         ;8DF99D;
    dw Instruction_PaletteFXObject_ColorIndex_Plus8                      ;8DF9AB;
    dw $673F                                                             ;8DF9AD;
    dw Instruction_PaletteFXObject_Done                                  ;8DF9AF;
    dw $0002,$39D7,$2951,$14AA,$0424,$080D,$0809                         ;8DF9B1;
    dw Instruction_PaletteFXObject_ColorIndex_Plus8                      ;8DF9BF;
    dw $5EFF                                                             ;8DF9C1;
    dw Instruction_PaletteFXObject_Done                                  ;8DF9C3;
    dw $0002,$35B7,$2531,$14AB,$0424,$1000,$1000                         ;8DF9C5;
    dw Instruction_PaletteFXObject_ColorIndex_Plus8                      ;8DF9D3;
    dw $5ADF                                                             ;8DF9D5;
    dw Instruction_PaletteFXObject_Done                                  ;8DF9D7;
    dw $0002,$3198,$2112,$108B,$0004,$080D,$0809                         ;8DF9D9;
    dw Instruction_PaletteFXObject_ColorIndex_Plus8                      ;8DF9E7;
    dw $529F                                                             ;8DF9E9;
    dw Instruction_PaletteFXObject_Done                                  ;8DF9EB;
    dw $0002,$35B7,$2531,$14AB,$0424,$1000,$1000                         ;8DF9ED;
    dw Instruction_PaletteFXObject_ColorIndex_Plus8                      ;8DF9FB;
    dw $5ADF                                                             ;8DF9FD;
    dw Instruction_PaletteFXObject_Done                                  ;8DF9FF;
    dw $0002,$39D7,$2951,$14AA,$0424,$080D,$0809                         ;8DFA01;
    dw Instruction_PaletteFXObject_ColorIndex_Plus8                      ;8DFA0F;
    dw $5EFF                                                             ;8DFA11;
    dw Instruction_PaletteFXObject_Done                                  ;8DFA13;
    dw $0002,$3DF6,$2D70,$18CA,$0844,$0019,$0012                         ;8DFA15;
    dw Instruction_PaletteFXObject_ColorIndex_Plus8                      ;8DFA23;
    dw $673F                                                             ;8DFA25;
    dw Instruction_PaletteFXObject_Done                                  ;8DFA27;
    dw $0002,$4636,$2D70,$18C9,$0844,$080D,$0809                         ;8DFA29;
    dw Instruction_PaletteFXObject_ColorIndex_Plus8                      ;8DFA37;
    dw $6B5F                                                             ;8DFA39;
    dw Instruction_PaletteFXObject_Done                                  ;8DFA3B;
    dw $0002,$4A55,$318F,$1CE9,$0C64,$1000,$1000                         ;8DFA3D;
    dw Instruction_PaletteFXObject_ColorIndex_Plus8                      ;8DFA4B;
    dw $739F                                                             ;8DFA4D;
    dw Instruction_PaletteFXObject_Done                                  ;8DFA4F;
    dw $0002,$4E75,$35AF,$1CE8,$0C64,$080D,$0809                         ;8DFA51;
    dw Instruction_PaletteFXObject_ColorIndex_Plus8                      ;8DFA5F;
    dw $77BF                                                             ;8DFA61;
    dw Instruction_PaletteFXObject_Done                                  ;8DFA63;
    dw Instruction_PaletteFXObject_GotoY                                 ;8DFA65;
    dw InstList_PaletteFXObject_Common_Tourian20_Tourian40               ;8DFA67;

InstList_PaletteFXObject_Crateria8_0:
    dw Instruction_PaletteFXObject_ColorIndexInY                         ;8DFA69;
    dw $00A2                                                             ;8DFA6B;

InstList_PaletteFXObject_Crateria8_1:
    dw $0003,$5A73,$41AD,$28E7                                           ;8DFA6D;
    dw Instruction_PaletteFXObject_ColorIndex_Plus8                      ;8DFA75;
    dw $0019,$0012,$3460,$0C20                                           ;8DFA77;
    dw Instruction_PaletteFXObject_ColorIndex_Plus4                      ;8DFA7F;
    dw $7F9C                                                             ;8DFA81;
    dw Instruction_PaletteFXObject_Done                                  ;8DFA83;
    dw $0003,$4E14,$396E,$24C8                                           ;8DFA85;
    dw Instruction_PaletteFXObject_ColorIndex_Plus8                      ;8DFA8D;
    dw $0014,$000E,$4900,$1C60                                           ;8DFA8F;
    dw Instruction_PaletteFXObject_ColorIndex_Plus4                      ;8DFA97;
    dw $6F3C                                                             ;8DFA99;
    dw Instruction_PaletteFXObject_Done                                  ;8DFA9B;
    dw $0003,$41D5,$312E,$1CA8                                           ;8DFA9D;
    dw Instruction_PaletteFXObject_ColorIndex_Plus8                      ;8DFAA5;
    dw $000F,$000A,$5980,$2CA0                                           ;8DFAA7;
    dw Instruction_PaletteFXObject_ColorIndex_Plus4                      ;8DFAAF;
    dw $62FD                                                             ;8DFAB1;
    dw Instruction_PaletteFXObject_Done                                  ;8DFAB3;
    dw $0003,$3576,$28EF,$1889                                           ;8DFAB5;
    dw Instruction_PaletteFXObject_ColorIndex_Plus8                      ;8DFABD;
    dw $000A,$0005,$6E20,$38C0                                           ;8DFABF;
    dw Instruction_PaletteFXObject_ColorIndex_Plus4                      ;8DFAC7;
    dw $529D                                                             ;8DFAC9;
    dw Instruction_PaletteFXObject_Done                                  ;8DFACB;
    dw $0003,$2D17,$20D0,$1489                                           ;8DFACD;
    dw Instruction_PaletteFXObject_ColorIndex_Plus8                      ;8DFAD5;
    dw $0005,$0001,$7EA0,$4900                                           ;8DFAD7;
    dw Instruction_PaletteFXObject_ColorIndex_Plus4                      ;8DFADF;
    dw $423E                                                             ;8DFAE1;
    dw Instruction_PaletteFXObject_Done                                  ;8DFAE3;
    dw $0003,$20B8,$1891,$106A                                           ;8DFAE5;
    dw Instruction_PaletteFXObject_ColorIndex_Plus8                      ;8DFAED;
    dw $000A,$0005,$6E20,$38C0                                           ;8DFAEF;
    dw Instruction_PaletteFXObject_ColorIndex_Plus4                      ;8DFAF7;
    dw $31DE                                                             ;8DFAF9;
    dw Instruction_PaletteFXObject_Done                                  ;8DFAFB;
    dw $0003,$1479,$1051,$084A                                           ;8DFAFD;
    dw Instruction_PaletteFXObject_ColorIndex_Plus8                      ;8DFB05;
    dw $000F,$000A,$5980,$2CA0                                           ;8DFB07;
    dw Instruction_PaletteFXObject_ColorIndex_Plus4                      ;8DFB0F;
    dw $259F                                                             ;8DFB11;
    dw Instruction_PaletteFXObject_Done                                  ;8DFB13;
    dw $0003,$081A,$0812,$042B                                           ;8DFB15;
    dw Instruction_PaletteFXObject_ColorIndex_Plus8                      ;8DFB1D;
    dw $0014,$000E,$4900,$1C60                                           ;8DFB1F;
    dw Instruction_PaletteFXObject_ColorIndex_Plus4                      ;8DFB27;
    dw $153F                                                             ;8DFB29;
    dw Instruction_PaletteFXObject_Done                                  ;8DFB2B;
    dw $0003,$1479,$1051,$084A                                           ;8DFB2D;
    dw Instruction_PaletteFXObject_ColorIndex_Plus8                      ;8DFB35;
    dw $000F,$000A,$5980,$2CA0                                           ;8DFB37;
    dw Instruction_PaletteFXObject_ColorIndex_Plus4                      ;8DFB3F;
    dw $259F                                                             ;8DFB41;
    dw Instruction_PaletteFXObject_Done                                  ;8DFB43;
    dw $0003,$20B8,$1891,$106A                                           ;8DFB45;
    dw Instruction_PaletteFXObject_ColorIndex_Plus8                      ;8DFB4D;
    dw $000A,$0005,$6E20,$38C0                                           ;8DFB4F;
    dw Instruction_PaletteFXObject_ColorIndex_Plus4                      ;8DFB57;
    dw $31DE                                                             ;8DFB59;
    dw Instruction_PaletteFXObject_Done                                  ;8DFB5B;
    dw $0003,$2D17,$20D0,$1489                                           ;8DFB5D;
    dw Instruction_PaletteFXObject_ColorIndex_Plus8                      ;8DFB65;
    dw $0005,$0001,$7EA0,$4900                                           ;8DFB67;
    dw Instruction_PaletteFXObject_ColorIndex_Plus4                      ;8DFB6F;
    dw $423E                                                             ;8DFB71;
    dw Instruction_PaletteFXObject_Done                                  ;8DFB73;
    dw $0003,$3576,$28EF,$1889                                           ;8DFB75;
    dw Instruction_PaletteFXObject_ColorIndex_Plus8                      ;8DFB7D;
    dw $000A,$0005,$6E20,$38C0                                           ;8DFB7F;
    dw Instruction_PaletteFXObject_ColorIndex_Plus4                      ;8DFB87;
    dw $529D                                                             ;8DFB89;
    dw Instruction_PaletteFXObject_Done                                  ;8DFB8B;
    dw $0003,$41D5,$312E,$1CA8                                           ;8DFB8D;
    dw Instruction_PaletteFXObject_ColorIndex_Plus8                      ;8DFB95;
    dw $000F,$000A,$5980,$2CA0                                           ;8DFB97;
    dw Instruction_PaletteFXObject_ColorIndex_Plus4                      ;8DFB9F;
    dw $62FD                                                             ;8DFBA1;
    dw Instruction_PaletteFXObject_Done                                  ;8DFBA3;
    dw $0003,$4E14,$396E,$24C8                                           ;8DFBA5;
    dw Instruction_PaletteFXObject_ColorIndex_Plus8                      ;8DFBAD;
    dw $0014,$000E,$4900,$1C60                                           ;8DFBAF;
    dw Instruction_PaletteFXObject_ColorIndex_Plus4                      ;8DFBB7;
    dw $6F3C                                                             ;8DFBB9;
    dw Instruction_PaletteFXObject_Done                                  ;8DFBBB;
    dw Instruction_PaletteFXObject_GotoY                                 ;8DFBBD;
    dw InstList_PaletteFXObject_Crateria8_1                              ;8DFBBF;

InstList_PaletteFXObject_Crateria10_0:
    dw Instruction_PaletteFXObject_ColorIndexInY                         ;8DFBC1;
    dw $00D2                                                             ;8DFBC3;

InstList_PaletteFXObject_Crateria10_1:
    dw $0010,$35AD,$1CE7,$0C63                                           ;8DFBC5;
    dw Instruction_PaletteFXObject_Done                                  ;8DFBCD;
    dw $0001,$29D0,$150A,$0885                                           ;8DFBCF;
    dw Instruction_PaletteFXObject_Done                                  ;8DFBD7;
    dw $0001,$1E14,$114D,$08A7                                           ;8DFBD9;
    dw Instruction_PaletteFXObject_Done                                  ;8DFBE1;
    dw $0002,$0E37,$096F,$04A8                                           ;8DFBE3;
    dw Instruction_PaletteFXObject_Done                                  ;8DFBEB;
    dw $0001,$025A,$0192,$00CA                                           ;8DFBED;
    dw Instruction_PaletteFXObject_Done                                  ;8DFBF5;
    dw $0002,$35AD,$1CE7,$0C63                                           ;8DFBF7;
    dw Instruction_PaletteFXObject_Done                                  ;8DFBFF;
    dw $0001,$29D0,$150A,$0885                                           ;8DFC01;
    dw Instruction_PaletteFXObject_Done                                  ;8DFC09;
    dw $0001,$1E14,$114D,$08A7                                           ;8DFC0B;
    dw Instruction_PaletteFXObject_Done                                  ;8DFC13;
    dw $0001,$0E37,$096F,$04A8                                           ;8DFC15;
    dw Instruction_PaletteFXObject_Done                                  ;8DFC1D;
    dw $0001,$025A,$0192,$00CA                                           ;8DFC1F;
    dw Instruction_PaletteFXObject_Done                                  ;8DFC27;
    dw $0020,$35AD,$1CE7,$0C63                                           ;8DFC29;
    dw Instruction_PaletteFXObject_Done                                  ;8DFC31;
    dw $0002,$29D0,$150A,$0885                                           ;8DFC33;
    dw Instruction_PaletteFXObject_Done                                  ;8DFC3B;
    dw $0001,$1E14,$114D,$08A7                                           ;8DFC3D;
    dw Instruction_PaletteFXObject_Done                                  ;8DFC45;
    dw $0001,$0E37,$096F,$04A8                                           ;8DFC47;
    dw Instruction_PaletteFXObject_Done                                  ;8DFC4F;
    dw $0001,$025A,$0192,$00CA                                           ;8DFC51;
    dw Instruction_PaletteFXObject_Done                                  ;8DFC59;
    dw Instruction_PaletteFXObject_GotoY                                 ;8DFC5B;
    dw InstList_PaletteFXObject_Crateria10_1                             ;8DFC5D;

InstList_PaletteFXObject_Crateria20_0:
    dw Instruction_PaletteFXObject_ColorIndexInY                         ;8DFC5F;
    dw $00AA                                                             ;8DFC61;

InstList_PaletteFXObject_Crateria20_1:
    dw $0010,$28C8,$2484,$1C61                                           ;8DFC63;
    dw Instruction_PaletteFXObject_Done                                  ;8DFC6B;
    dw $0001,$398E,$296B,$1549                                           ;8DFC6D;
    dw Instruction_PaletteFXObject_Done                                  ;8DFC75;
    dw $0001,$4A74,$2E52,$1230                                           ;8DFC77;
    dw Instruction_PaletteFXObject_Done                                  ;8DFC7F;
    dw $0002,$5739,$3318,$0B18                                           ;8DFC81;
    dw Instruction_PaletteFXObject_Done                                  ;8DFC89;
    dw $0001,$67FF,$43FF,$03FF                                           ;8DFC8B;
    dw Instruction_PaletteFXObject_Done                                  ;8DFC93;
    dw $0002,$28C8,$2484,$1C61                                           ;8DFC95;
    dw Instruction_PaletteFXObject_Done                                  ;8DFC9D;
    dw $0001,$398E,$296B,$1549                                           ;8DFC9F;
    dw Instruction_PaletteFXObject_Done                                  ;8DFCA7;
    dw $0001,$4A74,$2E52,$1230                                           ;8DFCA9;
    dw Instruction_PaletteFXObject_Done                                  ;8DFCB1;
    dw $0001,$5739,$3318,$0B18                                           ;8DFCB3;
    dw Instruction_PaletteFXObject_Done                                  ;8DFCBB;
    dw $0001,$67FF,$43FF,$03FF                                           ;8DFCBD;
    dw Instruction_PaletteFXObject_Done                                  ;8DFCC5;
    dw $0020,$28C8,$2484,$1C61                                           ;8DFCC7;
    dw Instruction_PaletteFXObject_Done                                  ;8DFCCF;
    dw $0002,$398E,$296B,$1549                                           ;8DFCD1;
    dw Instruction_PaletteFXObject_Done                                  ;8DFCD9;
    dw $0001,$4A74,$2E52,$1230                                           ;8DFCDB;
    dw Instruction_PaletteFXObject_Done                                  ;8DFCE3;
    dw $0001,$5739,$3318,$0B18                                           ;8DFCE5;
    dw Instruction_PaletteFXObject_Done                                  ;8DFCED;
    dw $0001,$67FF,$43FF,$03FF                                           ;8DFCEF;
    dw Instruction_PaletteFXObject_Done                                  ;8DFCF7;
    dw Instruction_PaletteFXObject_GotoY                                 ;8DFCF9;
    dw InstList_PaletteFXObject_Crateria20_1                             ;8DFCFB;

InstList_PaletteFXObject_Crateria2_0:
    dw Instruction_PaletteFXObject_ColorIndexInY                         ;8DFCFD;
    dw $0082                                                             ;8DFCFF;

InstList_PaletteFXObject_Crateria2_1:
    dw $0008,$1D89,$0D06,$0CA3,$2D0E,$2D09,$28C5,$0C81                   ;8DFD01;
    dw Instruction_PaletteFXObject_Done                                  ;8DFD11;
    dw $0007,$1D8A,$0D07,$0CA4,$2D0E,$2D09,$28C5,$0421                   ;8DFD13;
    dw Instruction_PaletteFXObject_Done                                  ;8DFD23;
    dw $0006,$1D8A,$0D28,$0CC4,$2D0F,$2D0A,$28C6,$0423                   ;8DFD25;
    dw Instruction_PaletteFXObject_Done                                  ;8DFD35;
    dw $0005,$1D8B,$0D29,$0CC5,$2D0F,$2D0A,$28C6,$0424                   ;8DFD37;
    dw Instruction_PaletteFXObject_Done                                  ;8DFD47;
    dw $0004,$1DAB,$1149,$10C5,$2D0F,$2D0B,$28C7,$0845                   ;8DFD49;
    dw Instruction_PaletteFXObject_Done                                  ;8DFD59;
    dw $0003,$1DAC,$114A,$10C6,$2D0F,$2D0B,$28C7,$0846                   ;8DFD5B;
    dw Instruction_PaletteFXObject_Done                                  ;8DFD6B;
    dw $0002,$1DAC,$116B,$10E6,$2D10,$2D0C,$28C8,$0848                   ;8DFD6D;
    dw Instruction_PaletteFXObject_Done                                  ;8DFD7D;
    dw $0001,$1DAD,$116C,$10E7,$2D10,$2D0C,$28C8,$0015                   ;8DFD7F;
    dw Instruction_PaletteFXObject_Done                                  ;8DFD8F;
    dw $0002,$1DAC,$116B,$10E6,$2D10,$2D0C,$28C8,$0848                   ;8DFD91;
    dw Instruction_PaletteFXObject_Done                                  ;8DFDA1;
    dw $0003,$1DAC,$114A,$10C6,$2D0F,$2D0B,$28C7,$0846                   ;8DFDA3;
    dw Instruction_PaletteFXObject_Done                                  ;8DFDB3;
    dw $0004,$1DAB,$1149,$10C5,$2D0F,$2D0B,$28C7,$0845                   ;8DFDB5;
    dw Instruction_PaletteFXObject_Done                                  ;8DFDC5;
    dw $0005,$1D8B,$0D29,$0CC5,$2D0F,$2D0A,$28C6,$0424                   ;8DFDC7;
    dw Instruction_PaletteFXObject_Done                                  ;8DFDD7;
    dw $0006,$1D8A,$0D28,$0CC4,$2D0F,$2D0A,$28C6,$0423                   ;8DFDD9;
    dw Instruction_PaletteFXObject_Done                                  ;8DFDE9;
    dw $0007,$1D8A,$0D07,$0CA4,$2D0E,$2D09,$28C5,$0421                   ;8DFDEB;
    dw Instruction_PaletteFXObject_Done                                  ;8DFDFB;
    dw Instruction_PaletteFXObject_GotoY                                 ;8DFDFD;
    dw InstList_PaletteFXObject_Crateria2_1                              ;8DFDFF;

InstList_PaletteFXObject_Crateria4_0:
    dw Instruction_PaletteFXObject_ColorIndexInY                         ;8DFE01;
    dw $00A2                                                             ;8DFE03;

InstList_PaletteFXObject_Crateria4_1:
    dw $0031,$48D5,$38B0,$286A,$2488,$2067,$1846,$1425                   ;8DFE05;
    dw $1024,$0C23,$0C03,$0802                                           ;8DFE15;
    dw Instruction_PaletteFXObject_Done                                  ;8DFE1D;
    dw $0001,$3DD8,$31D5,$2991,$25B0,$218F,$1D8E,$0C23                   ;8DFE1F;
    dw $0C23,$0822,$0802,$0401                                           ;8DFE2F;
    dw Instruction_PaletteFXObject_Done                                  ;8DFE37;
    dw $0001,$32FC,$2EDA,$26D8,$26D7,$26D7,$22B7,$0802                   ;8DFE39;
    dw $0401,$0401,$0401,$0401                                           ;8DFE49;
    dw Instruction_PaletteFXObject_Done                                  ;8DFE51;
    dw $0001,$27FF,$27FF,$27FF,$27FF,$27FF,$27FF,$0000                   ;8DFE53;
    dw $0000,$0401,$0000,$0000                                           ;8DFE63;
    dw Instruction_PaletteFXObject_Done                                  ;8DFE6B;
    dw $0001,$32FC,$2EDA,$26D8,$26D7,$26D7,$22B7,$0802                   ;8DFE6D;
    dw $0401,$0401,$0401,$0401                                           ;8DFE7D;
    dw Instruction_PaletteFXObject_Done                                  ;8DFE85;
    dw $0011,$48D5,$38B0,$286A,$2488,$2067,$1846,$1425                   ;8DFE87;
    dw $1024,$0C23,$0C03,$0802                                           ;8DFE97;
    dw Instruction_PaletteFXObject_Done                                  ;8DFE9F;
    dw $0001,$32FC,$2EDA,$26D8,$26D7,$26D7,$22B7,$0802                   ;8DFEA1;
    dw $0401,$0401,$0401,$0401                                           ;8DFEB1;
    dw Instruction_PaletteFXObject_Done                                  ;8DFEB9;
    dw $0018,$48D5,$38B0,$286A,$2488,$2067,$1846,$1425                   ;8DFEBB;
    dw $1024,$0C23,$0C03,$0802                                           ;8DFECB;
    dw Instruction_PaletteFXObject_Done                                  ;8DFED3;
    dw $0001,$32FC,$2EDA,$26D8,$26D7,$26D7,$22B7,$0802                   ;8DFED5;
    dw $0401,$0401,$0401,$0401                                           ;8DFEE5;
    dw Instruction_PaletteFXObject_Done                                  ;8DFEED;
    dw $0001,$27FF,$27FF,$27FF,$27FF,$27FF,$27FF,$0000                   ;8DFEEF;
    dw $0000,$0401,$0000,$0000                                           ;8DFEFF;
    dw Instruction_PaletteFXObject_Done                                  ;8DFF07;
    dw $0001,$32FC,$2EDA,$26D8,$26D7,$26D7,$22B7,$0802                   ;8DFF09;
    dw $0401,$0401,$0401,$0401                                           ;8DFF19;
    dw Instruction_PaletteFXObject_Done                                  ;8DFF21;
    dw Instruction_PaletteFXObject_GotoY                                 ;8DFF23;
    dw InstList_PaletteFXObject_Crateria4_1                              ;8DFF25;

InstList_PaletteFXObject_Crateria40_0:
    dw Instruction_PaletteFXObject_ColorIndexInY                         ;8DFF27;
    dw $00AE                                                             ;8DFF29;

InstList_PaletteFXObject_Crateria40_1:
    dw $0031,$1425,$1024,$0C23,$0C03,$0802                               ;8DFF2B;
    dw Instruction_PaletteFXObject_Done                                  ;8DFF37;
    dw $0001,$0C23,$0C23,$0822,$0802,$0401                               ;8DFF39;
    dw Instruction_PaletteFXObject_Done                                  ;8DFF45;
    dw $0001,$0802,$0401,$0401,$0401,$0401                               ;8DFF47;
    dw Instruction_PaletteFXObject_Done                                  ;8DFF53;
    dw $0001,$0000,$0000,$0401,$0000,$0000                               ;8DFF55;
    dw Instruction_PaletteFXObject_Done                                  ;8DFF61;
    dw $0001,$0802,$0401,$0401,$0401,$0401                               ;8DFF63;
    dw Instruction_PaletteFXObject_Done                                  ;8DFF6F;
    dw $0011,$1425,$1024,$0C23,$0C03,$0802                               ;8DFF71;
    dw Instruction_PaletteFXObject_Done                                  ;8DFF7D;
    dw $0001,$0802,$0401,$0401,$0401,$0401                               ;8DFF7F;
    dw Instruction_PaletteFXObject_Done                                  ;8DFF8B;
    dw $0018,$1425,$1024,$0C23,$0C03,$0802                               ;8DFF8D;
    dw Instruction_PaletteFXObject_Done                                  ;8DFF99;
    dw $0001,$0802,$0401,$0401,$0401,$0401                               ;8DFF9B;
    dw Instruction_PaletteFXObject_Done                                  ;8DFFA7;
    dw $0001,$0000,$0000,$0401,$0000,$0000                               ;8DFFA9;
    dw Instruction_PaletteFXObject_Done                                  ;8DFFB5;
    dw $0001,$0802,$0401,$0401,$0401,$0401                               ;8DFFB7;
    dw Instruction_PaletteFXObject_Done                                  ;8DFFC3;
    dw Instruction_PaletteFXObject_GotoY                                 ;8DFFC5;
    dw InstList_PaletteFXObject_Crateria40_1                             ;8DFFC7;

PaletteFXObjects_Tourian8_ShutterRedFlashing:
    dw RTS_8DC685                                                        ;8DFFC9;
    dw InstList_PaletteFXObject_Tourian8_0                               ;8DFFCB;

PaletteFXObjects_Tourian10_BackgroundRedFlashing:
    dw RTS_8DC685                                                        ;8DFFCD;
    dw InstList_PaletteFXObject_Tourian10_0                              ;8DFFCF;

PaletteFXObjects_Tourian20_GeneralLevelRedFlashing:
    dw RTS_8DC685                                                        ;8DFFD1;
    dw InstList_PaletteFXObject_Tourian20                                ;8DFFD3;

PaletteFXObjects_Tourian40_RedFlashingArkanoidBlocksRedOrbs:
    dw RTS_8DC685                                                        ;8DFFD5;
    dw InstList_PaletteFXObject_Tourian40                                ;8DFFD7;

PaletteFXObjects_Crateria8_OldTourianRedFlashing:
    dw RTS_8DC685                                                        ;8DFFD9;
    dw InstList_PaletteFXObject_Crateria8_0                              ;8DFFDB;

PaletteFXObjects_Crateria10_OldTourianBGRailingsFlashYellow:
    dw RTS_8DC685                                                        ;8DFFDD;
    dw InstList_PaletteFXObject_Crateria10_0                             ;8DFFDF;

PaletteFXObjects_Crateria20_OldTourianBGPanelsFlashYellow:
    dw RTS_8DC685                                                        ;8DFFE1;
    dw InstList_PaletteFXObject_Crateria20_0                             ;8DFFE3;

PaletteFXObjects_Crateria2_UpperCrateriaRedFlashing:
    dw RTS_8DC685                                                        ;8DFFE5;
    dw InstList_PaletteFXObject_Crateria2_0                              ;8DFFE7;

PaletteFXObjects_Crateria4_YellowLightning:
    dw RTS_8DC685                                                        ;8DFFE9;
    dw InstList_PaletteFXObject_Crateria4_0                              ;8DFFEB;

PaletteFXObjects_Crateria40_SlightlyModifiesAPixelInCREBlock:
    dw RTS_8DC685                                                        ;8DFFED;
    dw InstList_PaletteFXObject_Crateria40_0                             ;8DFFEF;
