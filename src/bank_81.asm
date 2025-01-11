
org $818000


incsrc "sram.asm"
incsrc "oam.asm"
incsrc "game_over_menu.asm"
incsrc "file_select_menu.asm"
incsrc "file_select_map.asm"

NewSaveFile:
    REP #$30                                                             ;81B2CB;
    LDA.W #$0063                                                         ;81B2CD;
    STA.W Equipment.maxEnergy                                            ;81B2D0;
    STA.W Equipment.currentEnergy                                        ;81B2D3;
    LDA.W #$0000                                                         ;81B2D6;
    STA.W Equipment.maxMissiles                                          ;81B2D9;
    STA.W Equipment.currentMissiles                                      ;81B2DC;
    LDA.W #$0000                                                         ;81B2DF;
    STA.W Equipment.maxSuperMissiles                                     ;81B2E2;
    STA.W Equipment.currentSuperMissiles                                 ;81B2E5;
    LDA.W #$0000                                                         ;81B2E8;
    STA.W Equipment.maxPowerBombs                                        ;81B2EB;
    STA.W Equipment.currentPowerBombs                                    ;81B2EE;
    STZ.W Equipment.selectedHudItem                                      ;81B2F1;
    STZ.W Equipment.collectedBeams                                       ;81B2F4;
    STZ.W Equipment.equippedBeams                                        ;81B2F7;
    STZ.W Equipment.collectedItems                                       ;81B2FA;
    STZ.W Equipment.equippedItems                                        ;81B2FD;
    STZ.W Equipment.reserveTankMode                                      ;81B300;
    STZ.W Equipment.maxReserveEnergy                                     ;81B303;
    STZ.W Equipment.currentReserveEnergy                                 ;81B306;
    STZ.W Equipment.currentReserveMissiles                               ;81B309;
    LDA.W #$0800                                                         ;81B30C;
    STA.W Equipment.upBinding                                            ;81B30F;
    LDA.W #$0400                                                         ;81B312;
    STA.W Equipment.downBinding                                          ;81B315;
    LDA.W #$0200                                                         ;81B318;
    STA.W Equipment.leftBinding                                          ;81B31B;
    LDA.W #$0100                                                         ;81B31E;
    STA.W Equipment.rightBinding                                         ;81B321;
    LDA.W #$0080                                                         ;81B324;
    STA.W Equipment.jumpBinding                                          ;81B327;
    LDA.W #$8000                                                         ;81B32A;
    STA.W Equipment.runBinding                                           ;81B32D;
    LDA.W #$0040                                                         ;81B330;
    STA.W Equipment.shootBinding                                         ;81B333;
    LDA.W #$4000                                                         ;81B336;
    STA.W Equipment.itemCancelBinding                                    ;81B339;
    LDA.W #$2000                                                         ;81B33C;
    STA.W Equipment.itemSelectBinding                                    ;81B33F;
    LDA.W #$0010                                                         ;81B342;
    STA.W Equipment.aimUpBinding                                         ;81B345;
    LDA.W #$0020                                                         ;81B348;
    STA.W Equipment.aimDownBinding                                       ;81B34B;
    STZ.W Equipment.igtFrames                                            ;81B34E;
    STZ.W Equipment.igtSeconds                                           ;81B351;
    STZ.W Equipment.igtMinutes                                           ;81B354;
    STZ.W Equipment.igtHours                                             ;81B357;
    STZ.W Equipment.japaneseSubtitles                                    ;81B35A;
    STZ.W Equipment.moonwalkEnabled                                      ;81B35D;
    STZ.W Equipment.itemCancelInDoorTransition                           ;81B360;
    LDA.W #$0001                                                         ;81B363;
    STA.W Equipment.debug_disableSamusPlacementMode                      ;81B366;
    STA.W Equipment.unk09E8                                              ;81B369;
    LDX.W #$0000                                                         ;81B36C;
    LDA.W #$0000                                                         ;81B36F;

.loopClearEvents:
    STA.L $7ED830,X                                                      ;81B372;
    STA.L $7ED870,X                                                      ;81B376;
    STA.L $7ED870,X                                                      ;81B37A;
    STA.L $7ED8B0,X                                                      ;81B37E;
    STA.L $7ED8F0,X                                                      ;81B382;
    STA.L $7ED908,X                                                      ;81B386;
    STA.L $7ED8F8,X                                                      ;81B38A;
    STA.L $7ED900,X                                                      ;81B38E;
    INX                                                                  ;81B392;
    INX                                                                  ;81B393;
    CPX.W #$0008                                                         ;81B394;
    BMI .loopClearEvents                                                 ;81B397;
    LDA.W #$0000                                                         ;81B399;

.loopClearEventsAgain:
    STA.L $7ED830,X                                                      ;81B39C;
    STA.L $7ED870,X                                                      ;81B3A0;
    STA.L $7ED870,X                                                      ;81B3A4;
    STA.L $7ED8B0,X                                                      ;81B3A8;
    INX                                                                  ;81B3AC;
    INX                                                                  ;81B3AD;
    CPX.W #$0040                                                         ;81B3AE;
    BMI .loopClearEventsAgain                                            ;81B3B1;
    LDX.W #$0000                                                         ;81B3B3;
    LDA.W #$0000                                                         ;81B3B6;

.loopClearMapData:
    STA.L $7ECD52,X                                                      ;81B3B9;
    INX                                                                  ;81B3BD;
    INX                                                                  ;81B3BE;
    CPX.W #$0700                                                         ;81B3BF;
    BMI .loopClearMapData                                                ;81B3C2;
    RTS                                                                  ;81B3C4;


incsrc "menu_tilemap.asm"

Freespace_Bank81_EF1A:                                                   ;81EF1A;
; $FE6 bytes


ORG $81FF00
    db " Special thanks      "                                           ;81FF00; Special thanks 2 Genji Kubota & all debug staff
    db "  2          Genji Ku"                                           ;81FF15;
    db "bota         &       "                                           ;81FF2A;
    db " all debug staff.    "                                           ;81FF3F;
    db "            "                                                    ;81FF54;

; Thanks to P.JBoy for the bank logs at https://patrickjohnston.org/bank/index.html
; This disassembly relied heavily on his work
; Created with https://github.com/IsoFrieze/DiztinGUIsh

Freespace_Bank81_FF60:
; $A0 bytes
