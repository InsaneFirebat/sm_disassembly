InterruptCommandPointers:
    dw Interrupt_Cmd0                                                    ;809616;
    dw Interrupt_Cmd2_DisableHVCounterInterrupts                         ;809618;
    dw Interrupt_Cmd4_MainGameplay_BeginHUDDrawing                       ;80961A;
    dw Interrupt_Cmd6_MainGameplay_EndHUDDrawing                         ;80961C;
    dw Interrupt_Cmd8_StartDoorTransition_BeginHUDDrawing                ;80961E;
    dw Interrupt_CmdA_StartDoorTransition_EndHUDDrawing                  ;809620;
    dw Interrupt_CmdC_Draygon_BeginHUDDrawing                            ;809622;
    dw Interrupt_CmdE_Draygon_EndHUDDrawing                              ;809624;
    dw Interrupt_Cmd10_VerticalDoorTransition_BeginHUDDrawing            ;809626;
    dw Interrupt_Cmd12_VerticalDoorTransition_EndHUDDrawing              ;809628;
    dw Interrupt_Cmd14_VerticalDoorTransition_EndDrawing                 ;80962A;
    dw Interrupt_Cmd16_HorizontalDoorTransition_BeginHUDDrawing          ;80962C;
    dw Interrupt_Cmd18_HorizontalDoorTransition_EndHUDDrawing            ;80962E;
    dw Interrupt_Cmd1A_HorizontalDoorTransition_EndDrawing               ;809630;

ExecuteDoorTransitionVRAMUpdate:
    SEP #$20                                                             ;809632;
    LDA.B #$80                                                           ;809634;
    STA.W $2100                                                          ;809636;
    LDX.W $05BE                                                          ;809639;
    STX.W $2116                                                          ;80963C;
    LDX.W #$1801                                                         ;80963F;
    STX.W $4310                                                          ;809642;
    LDX.W $05C0                                                          ;809645;
    STX.W $4312                                                          ;809648;
    LDA.W $05C2                                                          ;80964B;
    STA.W $4314                                                          ;80964E;
    LDX.W $05C3                                                          ;809651;
    STX.W $4315                                                          ;809654;
    LDA.B #$80                                                           ;809657;
    STA.W $2115                                                          ;809659;
    LDA.B #$02                                                           ;80965C;
    STA.W HW_MDMAEN                                                      ;80965E;
    LDA.B #$80                                                           ;809661;
    TRB.W $05BD                                                          ;809663;
    LDA.B #$0F                                                           ;809666;
    STA.W $2100                                                          ;809668;
    REP #$20                                                             ;80966B;
    RTS                                                                  ;80966D;


Interrupt_Cmd0:
    LDA.B $A7                                                            ;80966E;
    BEQ .returnZero                                                      ;809670;
    STZ.B $A7                                                            ;809672;
    BRA .return                                                          ;809674;


.returnZero:
    LDA.W #$0000                                                         ;809676;

.return:
    LDX.W #$0000                                                         ;809679;
    LDY.W #$0000                                                         ;80967C;
    RTS                                                                  ;80967F;


Interrupt_Cmd2_DisableHVCounterInterrupts:
    LDA.W #$0030                                                         ;809680;
    TRB.B $84                                                            ;809683;
    LDA.W #$0000                                                         ;809685;
    TAX                                                                  ;809688;
    TAY                                                                  ;809689;
    RTS                                                                  ;80968A;


Interrupt_Cmd4_MainGameplay_BeginHUDDrawing:
    SEP #$20                                                             ;80968B;
    LDA.B #$5A                                                           ;80968D;
    STA.W $2109                                                          ;80968F;
    STZ.W $2130                                                          ;809692;
    STZ.W $2131                                                          ;809695;
    LDA.B #$04                                                           ;809698;
    STA.W $212C                                                          ;80969A;
    REP #$20                                                             ;80969D;
    LDA.W #$0006                                                         ;80969F;
    LDY.W #$001F                                                         ;8096A2;
    LDX.W #$0098                                                         ;8096A5;
    RTS                                                                  ;8096A8;


Interrupt_Cmd6_MainGameplay_EndHUDDrawing:
    SEP #$20                                                             ;8096A9;
    LDA.B $70                                                            ;8096AB;
    STA.W $2130                                                          ;8096AD;
    LDA.B $73                                                            ;8096B0;
    STA.W $2131                                                          ;8096B2;
    LDA.B $5B                                                            ;8096B5;
    STA.W $2109                                                          ;8096B7;
    LDA.B $6A                                                            ;8096BA;
    STA.W $212C                                                          ;8096BC;
    REP #$20                                                             ;8096BF;
    LDA.B $A7                                                            ;8096C1;
    BEQ .setCommand4                                                     ;8096C3;
    STZ.B $A7                                                            ;8096C5;
    BRA .return                                                          ;8096C7;


.setCommand4:
    LDA.W #$0004                                                         ;8096C9;

.return:
    LDY.W #$0000                                                         ;8096CC;
    LDX.W #$0098                                                         ;8096CF;
    RTS                                                                  ;8096D2;


Interrupt_Cmd8_StartDoorTransition_BeginHUDDrawing:
    SEP #$20                                                             ;8096D3;
    LDA.B #$5A                                                           ;8096D5;
    STA.W $2109                                                          ;8096D7;
    LDA.B #$04                                                           ;8096DA;
    STA.W $212C                                                          ;8096DC;
    STZ.W $2130                                                          ;8096DF;
    STZ.W $2131                                                          ;8096E2;
    REP #$20                                                             ;8096E5;
    LDA.W #$000A                                                         ;8096E7;
    LDY.W #$001F                                                         ;8096EA;
    LDX.W #$0098                                                         ;8096ED;
    RTS                                                                  ;8096F0;


Interrupt_CmdA_StartDoorTransition_EndHUDDrawing:
    SEP #$20                                                             ;8096F1;
    LDA.W $07B3                                                          ;8096F3;
    ORA.W $07B1                                                          ;8096F6;
    BIT.B #$01                                                           ;8096F9;
    BEQ .BG1Sprites                                                      ;8096FB;
    LDA.B #$10                                                           ;8096FD;
    BRA .sprites                                                         ;8096FF;


.BG1Sprites:
    LDA.B #$11                                                           ;809701;

.sprites:
    STA.W $212C                                                          ;809703;
    REP #$20                                                             ;809706;
    LDA.B $A7                                                            ;809708;
    BEQ .command8                                                        ;80970A;
    STZ.B $A7                                                            ;80970C;
    BRA .return                                                          ;80970E;


.command8:
    LDA.W #$0008                                                         ;809710;

.return:
    LDY.W #$0000                                                         ;809713;
    LDX.W #$0098                                                         ;809716;
    RTS                                                                  ;809719;


Interrupt_CmdC_Draygon_BeginHUDDrawing:
    SEP #$20                                                             ;80971A;
    LDA.B #$04                                                           ;80971C;
    STA.W $212C                                                          ;80971E;
    STZ.W $2130                                                          ;809721;
    STZ.W $2131                                                          ;809724;
    REP #$20                                                             ;809727;
    LDA.W #$000E                                                         ;809729;
    LDY.W #$001F                                                         ;80972C;
    LDX.W #$0098                                                         ;80972F;
    RTS                                                                  ;809732;


Interrupt_CmdE_Draygon_EndHUDDrawing:
    SEP #$20                                                             ;809733;
    LDA.B $5B                                                            ;809735;
    STA.W $2109                                                          ;809737;
    LDA.B $70                                                            ;80973A;
    STA.W $2130                                                          ;80973C;
    LDA.B $73                                                            ;80973F;
    STA.W $2131                                                          ;809741;
    REP #$20                                                             ;809744;
    LDA.B $A7                                                            ;809746;
    BEQ .commandC                                                        ;809748;
    STZ.B $A7                                                            ;80974A;
    BRA .return                                                          ;80974C;


.commandC:
    LDA.W #$000C                                                         ;80974E;

.return:
    LDY.W #$0000                                                         ;809751;
    LDX.W #$0098                                                         ;809754;
    RTS                                                                  ;809757;


Interrupt_Cmd10_VerticalDoorTransition_BeginHUDDrawing:
    SEP #$20                                                             ;809758;
    LDA.B #$04                                                           ;80975A;
    STA.W $212C                                                          ;80975C;
    STZ.W $2130                                                          ;80975F;
    STZ.W $2131                                                          ;809762;
    REP #$20                                                             ;809765;
    LDA.W #$0012                                                         ;809767;
    LDY.W #$001F                                                         ;80976A;
    LDX.W #$0098                                                         ;80976D;
    RTS                                                                  ;809770;


Interrupt_Cmd12_VerticalDoorTransition_EndHUDDrawing:
    SEP #$20                                                             ;809771;
    LDA.W $07B3                                                          ;809773;
    ORA.W $07B1                                                          ;809776;
    BIT.B #$01                                                           ;809779;
    BEQ .BG1Sprites                                                      ;80977B;
    LDA.B #$10                                                           ;80977D;
    BRA .sprites                                                         ;80977F;


.BG1Sprites:
    LDA.B #$11                                                           ;809781;

.sprites:
    STA.W $212C                                                          ;809783;
    STZ.W $2130                                                          ;809786;
    STZ.W $2131                                                          ;809789;
    REP #$20                                                             ;80978C;
    LDX.W $05BC                                                          ;80978E;
    BPL .scrolling                                                       ;809791;
    JSR.W ExecuteDoorTransitionVRAMUpdate                                ;809793;

.scrolling:
    LDA.W $0931                                                          ;809796;
    BMI .return                                                          ;809799;
    JSL.L DoorTransitionScrolling                                        ;80979B;

.return:
    LDA.W #$0014                                                         ;80979F;
    LDY.W #$00D8                                                         ;8097A2;
    LDX.W #$0098                                                         ;8097A5;
    RTS                                                                  ;8097A8;


Interrupt_Cmd14_VerticalDoorTransition_EndDrawing:
    LDA.B $A7                                                            ;8097A9;
    BEQ .command10                                                       ;8097AB;
    STZ.B $A7                                                            ;8097AD;
    BRA .return                                                          ;8097AF;


.command10:
    LDA.W #$0010                                                         ;8097B1;

.return:
    LDY.W #$0000                                                         ;8097B4;
    LDX.W #$0098                                                         ;8097B7;
    STZ.W $05B4                                                          ;8097BA;
    INC.W $05B4                                                          ;8097BD;
    RTS                                                                  ;8097C0;


Interrupt_Cmd16_HorizontalDoorTransition_BeginHUDDrawing:
    SEP #$20                                                             ;8097C1;
    LDA.B #$04                                                           ;8097C3;
    STA.W $212C                                                          ;8097C5;
    STZ.W $2130                                                          ;8097C8;
    STZ.W $2131                                                          ;8097CB;
    REP #$20                                                             ;8097CE;
    LDA.W #$0018                                                         ;8097D0;
    LDY.W #$001F                                                         ;8097D3;
    LDX.W #$0098                                                         ;8097D6;
    RTS                                                                  ;8097D9;


Interrupt_Cmd18_HorizontalDoorTransition_EndHUDDrawing:
    SEP #$20                                                             ;8097DA;
    LDA.W $07B3                                                          ;8097DC;
    ORA.W $07B1                                                          ;8097DF;
    BIT.B #$01                                                           ;8097E2;
    BEQ .BG1Sprites                                                      ;8097E4;
    LDA.B #$10                                                           ;8097E6;
    BRA .sprites                                                         ;8097E8;


.BG1Sprites:
    LDA.B #$11                                                           ;8097EA;

.sprites:
    STA.W $212C                                                          ;8097EC;
    STZ.W $2130                                                          ;8097EF;
    STZ.W $2131                                                          ;8097F2;
    REP #$20                                                             ;8097F5;
    LDA.W $0931                                                          ;8097F7;
    BMI .return                                                          ;8097FA;
    JSL.L DoorTransitionScrolling                                        ;8097FC;

.return:
    LDA.W #$001A                                                         ;809800;
    LDY.W #$00A0                                                         ;809803;
    LDX.W #$0098                                                         ;809806;
    RTS                                                                  ;809809;


Interrupt_Cmd1A_HorizontalDoorTransition_EndDrawing:
    LDX.W $05BC                                                          ;80980A;
    BPL .nextCommand                                                     ;80980D;
    JSR.W ExecuteDoorTransitionVRAMUpdate                                ;80980F;

.nextCommand:
    LDA.B $A7                                                            ;809812;
    BEQ .command16                                                       ;809814;
    STZ.B $A7                                                            ;809816;
    BRA .return                                                          ;809818;


.command16:
    LDA.W #$0016                                                         ;80981A;

.return:
    LDY.W #$0000                                                         ;80981D;
    LDX.W #$0098                                                         ;809820;
    STZ.W $05B4                                                          ;809823;
    INC.W $05B4                                                          ;809826;
    RTS                                                                  ;809829;


EnableHVCounterInterrupts:
    PHP                                                                  ;80982A;
    REP #$30                                                             ;80982B;
    LDA.W #$0000                                                         ;80982D;
    STA.W $4209                                                          ;809830;
    LDA.W #$0098                                                         ;809833;
    STA.W $4207                                                          ;809836;
    LDA.W #$0030                                                         ;809839;
    TSB.B $84                                                            ;80983C;
    PLP                                                                  ;80983E;
    CLI                                                                  ;80983F;
    RTL                                                                  ;809840;


EnableHVCounterInterruptsNow:
    PHP                                                                  ;809841;
    REP #$30                                                             ;809842;
    LDA.W #$0000                                                         ;809844;
    STA.W $4209                                                          ;809847;
    LDA.W #$0098                                                         ;80984A;
    STA.W $4207                                                          ;80984D;
    LDA.W #$0030                                                         ;809850;
    TSB.B $84                                                            ;809853;
    SEP #$20                                                             ;809855;
    LDA.B $84                                                            ;809857;
    STA.W $4200                                                          ;809859;
    PLP                                                                  ;80985C;
    CLI                                                                  ;80985D;
    RTL                                                                  ;80985E;


DisableHVCounterInterrupts:
    PHP                                                                  ;80985F;
    REP #$30                                                             ;809860;
    LDA.W #$0030                                                         ;809862;
    TRB.B $84                                                            ;809865;
    PLP                                                                  ;809867;
    SEI                                                                  ;809868;
    RTL                                                                  ;809869;


IRQ:
    REP #$30                                                             ;80986A;
    JML.L .bank80                                                        ;80986C;


.bank80:
    PHB                                                                  ;809870;
    PHA                                                                  ;809871;
    PHX                                                                  ;809872;
    PHY                                                                  ;809873;
    PHK                                                                  ;809874;
    PLB                                                                  ;809875;
    LDA.W $4211                                                          ;809876;
    LDX.B $AB                                                            ;809879;
    JSR.W (InterruptCommandPointers,X)                                   ;80987B;
    STA.B $AB                                                            ;80987E;
    STY.W $4209                                                          ;809880;
    STX.W $4207                                                          ;809883;
    PLY                                                                  ;809886;
    PLX                                                                  ;809887;
    PLA                                                                  ;809888;
    PLB                                                                  ;809889;
    RTI                                                                  ;80988A;
