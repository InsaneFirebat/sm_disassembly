
; "Mode 7 object" instructions and pre-instructions for intro subtitles

if !PAL == 0
if !FEATURE_KEEP_UNREFERENCED
;;; $B4EB: Unused. Instruction - load Japanese intro text - non-existent ;;;
UNUSED_Instruction_LoadIntroSubtitle_NonExistent:
; Used by UNUSED_Mode7Objects_8BD43D
    PHY                                                                  ;8BB4EB;
    JSL.L Disable_CinematicBGTilemap_Updates                             ;8BB4EC;
    LDA.L Palettes_Intro_nonExistentIntroText1                           ;8BB4F0;
    STA.L Palettes_BG3P4HighlightedHUDItemBackgroundOutline              ;8BB4F4;
    LDA.L Palettes_Intro_nonExistentIntroText2                           ;8BB4F8;
    STA.L Palettes_BG3P4HighlightedHUDItemBackground                     ;8BB4FC;
    LDA.L Palettes_Intro_nonExistentIntroText3                           ;8BB500;
    STA.L Palettes_BG3P4HighlightedHUDItemOutline                        ;8BB504;
    LDY.W #InstList_Mode7Object_Page1                                    ;8BB508;
    JSR.W LoadIntroSubtitleTiles                                         ;8BB50B;
    LDY.W #InstList_Mode7Object_Page1                                    ;8BB50E;
    JSR.W LoadIntroSubtitleTiles                                         ;8BB511;
    JSR.W TransferSubtitleTilesToVRAM                                    ;8BB514;
    PLY                                                                  ;8BB517;
    RTS                                                                  ;8BB518;
endif ; !FEATURE_KEEP_UNREFERENCED
endif


;;; $B519: Instruction - enable cinematic BG tilemap updates ;;;
Instruction_EnableCinematicBGTilemapUpdates:
if !PAL == 0
    JSL.L Enable_CinematicBGTilemap_Updates                              ;8BB519;
endif
    RTS                                                                  ;8BB51D;


;;; $B51E: Instruction - load Japanese intro text - page 1 ;;;
Instruction_LoadIntroSubtitlePage1:
    PHY                                                                  ;8BB51E;
if !PAL == 0
    JSL.L Disable_CinematicBGTilemap_Updates                             ;8BB51F;
endif
    LDA.L Palettes_Intro_nonExistentIntroText1                           ;8BB523;
    STA.L Palettes_BG3P4HighlightedHUDItemBackgroundOutline              ;8BB527;
    LDA.L Palettes_Intro_nonExistentIntroText2                           ;8BB52B;
    STA.L Palettes_BG3P4HighlightedHUDItemBackground                     ;8BB52F;
    LDA.L Palettes_Intro_nonExistentIntroText3                           ;8BB533;
    STA.L Palettes_BG3P4HighlightedHUDItemOutline                        ;8BB537;
    JSR.W BlankOut_Subtitle_Tiles                                        ;8BB53B;
if !PAL == 0
    LDY.W #IntroSubtitleData_Page1_TopLine                               ;8BB53E;
    JSR.W LoadIntroSubtitleTiles                                         ;8BB541;
    LDY.W #IntroSubtitleData_Page1_BottomLine                            ;8BB544;
    JSR.W LoadIntroSubtitleTiles                                         ;8BB547;
    JSR.W TransferSubtitleTilesToVRAM                                    ;8BB54A;
else
    LDA.W AltText  
    BNE .French
    LDA.W #IntroSubtitleTilemaps_German_Page1_Subpage1
    STA.B DP_Temp00
    LDA.W #$0100
    STA.B DP_Temp12
    JSR.W LoadIntroSubtitleTilemapTopRow
    BRA .return

  .French
    LDA.W #IntroSubtitleTilemaps_French_Page1
    STA.B DP_Temp00
    LDA.W #$0100
    STA.B DP_Temp12
    JSR.W LoadIntroSubtitleTilemapTopRow
endif

  .return
    PLY                                                                  ;8BB54D;
    RTS                                                                  ;8BB54E;


;;; $B54F: Instruction - enable cinematic BG tilemap updates ;;;
Instruction_EnableCinematicBGTilemapUpdates_duplicate:
    JSL.L Enable_CinematicBGTilemap_Updates                              ;8BB54F;
    RTS                                                                  ;8BB553;


if !PAL != 0
PreInstruction_LoadIntroSubtitlePage1_Subpage2:
    LDA.B DP_Controller1New
    BEQ .return
    LDA.W #InstList_EnableCinematicBGTilemapUpdates_Page1DoneInput
    STA.W Mode7Object_InstListPointers,X
    LDA.W #$0001
    STA.W Mode7Object_InstructionTimers,X
    LDA.W #RTS_8B93D9
    STA.W Mode7Object_PreInstructions,X
    JSR.W BlankOut_Subtitle_Tiles
    LDA.W #IntroSubtitleTilemaps_German_Page1_Subpage2
    STA.B DP_Temp00
    LDA.W #$0100
    STA.B DP_Temp12
    JSR.W LoadIntroSubtitleTilemapTopRow
    LDA.W #$003C
    STA.W CinematicSpriteObject_IntroSubtitleTimer 
    
  .return
    RTS


Instruction_EnableCinematicBGTilemapUpdates_Page1DoneInput:
    JSL.L Enable_CinematicBGTilemap_Updates
    LDA.W #CinematicFunction_Intro_WaitForInput_SetupMotherBrainFight
    STA.W CinematicFunction
    RTS
endif


;;; $B554: Instruction - load Japanese intro text - page 2 - subpage 1 ;;;
Instruction_LoadIntroSubtitlePage2_Subpage1:
    PHY                                                                  ;8BB554;
if !PAL == 0
    JSL.L Disable_CinematicBGTilemap_Updates                             ;8BB555;
endif
    LDA.L Palettes_Intro_nonExistentIntroText1                           ;8BB559;
    STA.L Palettes_BG3P4HighlightedHUDItemBackgroundOutline              ;8BB55D;
    LDA.L Palettes_Intro_nonExistentIntroText2                           ;8BB561;
    STA.L Palettes_BG3P4HighlightedHUDItemBackground                     ;8BB565;
    LDA.L Palettes_Intro_nonExistentIntroText3                           ;8BB569;
    STA.L Palettes_BG3P4HighlightedHUDItemOutline                        ;8BB56D;
    JSR.W BlankOut_Subtitle_Tiles                                        ;8BB571;
if !PAL == 0
    LDY.W #IntroSubtitleData_Page2_Subpage1_TopLine                      ;8BB574;
    JSR.W LoadIntroSubtitleTiles                                         ;8BB577;
    LDY.W #IntroSubtitleData_Page2_Subpage1_BottomLine                   ;8BB57A;
    JSR.W LoadIntroSubtitleTiles                                         ;8BB57D;
    JSR.W TransferSubtitleTilesToVRAM                                    ;8BB580;
else
    LDA.W AltText  
    BNE .French
    LDA.W #IntroSubtitleTilemaps_German_Page2_Subpage1
    STA.B DP_Temp00
    LDA.W #$0100
    STA.B DP_Temp12
    JSR.W LoadIntroSubtitleTilemapTopRow
    BRA .return
    
  .French
    LDA.W #IntroSubtitleTilemaps_French_Page2
    STA.B DP_Temp00
    LDA.W #$0100
    STA.B DP_Temp12
    JSR.W LoadIntroSubtitleTilemapTopRow
endif

  .return
    PLY                                                                  ;8BB583;
    RTS                                                                  ;8BB584;


;;; $B585: Pre-instruction - mode 7 object $D40D (page 2 - subpage 2) ;;;
Instruction_LoadIntroSubtitlePage2_Subpage2:
    LDA.B DP_Controller1New                                              ;8BB585;
    BEQ .return                                                          ;8BB587;
    LDA.W #InstList_EnableCinematicBGTilemapUpdates_Page2DoneInput       ;8BB589;
    STA.W Mode7Object_InstListPointers,X                                 ;8BB58C;
    LDA.W #$0001                                                         ;8BB58F;
    STA.W Mode7Object_InstructionTimers,X                                ;8BB592;
    LDA.W #RTS_8B93D9                                                    ;8BB595;
    STA.W Mode7Object_PreInstructions,X                                  ;8BB598;
if !PAL == 0
    JSL.L Disable_CinematicBGTilemap_Updates                             ;8BB59B;
endif
    JSR.W BlankOut_Subtitle_Tiles                                        ;8BB59F;
if !PAL == 0
    LDY.W #IntroSubtitleData_Page2_Subpage2_TopLine                      ;8BB5A2;
    JSR.W LoadIntroSubtitleTiles                                         ;8BB5A5;
    LDY.W #IntroSubtitleData_Page2_Subpage2_BottomLine                   ;8BB5A8;
    JSR.W LoadIntroSubtitleTiles                                         ;8BB5AB;
    JSR.W TransferSubtitleTilesToVRAM                                    ;8BB5AE;
else
    LDA.W #IntroSubtitleTilemaps_German_Page2_Subpage2
    STA.B DP_Temp00
    LDA.W #$0100
    STA.B DP_Temp12
    JSR.W LoadIntroSubtitleTilemapTopRow
endif
    LDA.W #$003C                                                         ;8BB5B1;
    STA.W CinematicSpriteObject_IntroSubtitleTimer                       ;8BB5B4;

  .return:
    RTS                                                                  ;8BB5B7;


;;; $B5B8: Instruction - enable cinematic BG tilemap updates and page 2 done input ;;;
Instruction_EnableCinematicBGTilemapUpdates_Page2DoneInput:
    JSL.L Enable_CinematicBGTilemap_Updates                              ;8BB5B8;
    LDA.W #CinematicFunc_Intro_WaitForInput_SetupBabyMetroidDiscovery    ;8BB5BC;
    STA.W CinematicFunction                                              ;8BB5BF;
    RTS                                                                  ;8BB5C2;


;;; $B5C3: Instruction - load Japanese intro text - page 3 - subpage 1 ;;;
Instruction_LoadIntroSubtitlePage3_Subpage1:
    PHY                                                                  ;8BB5C3;
if !PAL == 0
    JSL.L Disable_CinematicBGTilemap_Updates                             ;8BB5C4;
endif
    LDA.L Palettes_Intro_nonExistentIntroText1                           ;8BB5C8;
    STA.L Palettes_BG3P4HighlightedHUDItemBackgroundOutline              ;8BB5CC;
    LDA.L Palettes_Intro_nonExistentIntroText2                           ;8BB5D0;
    STA.L Palettes_BG3P4HighlightedHUDItemBackground                     ;8BB5D4;
    LDA.L Palettes_Intro_nonExistentIntroText3                           ;8BB5D8;
    STA.L Palettes_BG3P4HighlightedHUDItemOutline                        ;8BB5DC;
    JSR.W BlankOut_Subtitle_Tiles                                        ;8BB5E0;
if !PAL == 0
    LDY.W #IntroSubtitleData_Page3_Subpage1                              ;8BB5E3;
    JSR.W LoadIntroSubtitleTiles                                         ;8BB5E6;
    JSR.W TransferSubtitleTilesToVRAM                                    ;8BB5E9;
else
    LDA.W AltText  
    BNE .French
    LDA.W #IntroSubtitleTilemaps_German_Page3_Subpage1
    STA.B DP_Temp00
    LDA.W #$0100
    STA.B DP_Temp12
    JSR.W LoadIntroSubtitleTilemapTopRow
    BRA .return
    
  .French
    LDA.W #IntroSubtitleTilemaps_French_Page3
    STA.B DP_Temp00
    LDA.W #$0100
    STA.B DP_Temp12
    JSR.W LoadIntroSubtitleTilemapTopRow
endif

  .return:
    PLY                                                                  ;8BB5EC;
    RTS                                                                  ;8BB5ED;


;;; $B5EE: Pre-instruction - mode 7 object $D419 (page 3 - subpage 2) ;;;
PreInstruction_LoadIntroSubtitlePage3_Subpage2:
    LDA.B DP_Controller1New                                              ;8BB5EE;
    BEQ .return                                                          ;8BB5F0;
    LDA.W #InstList_EnableCinematicBGTilemapUpdates_Page3DoneInput       ;8BB5F2;
    STA.W Mode7Object_InstListPointers,X                                 ;8BB5F5;
    LDA.W #$0001                                                         ;8BB5F8;
    STA.W Mode7Object_InstructionTimers,X                                ;8BB5FB;
    LDA.W #RTS_8B93D9                                                    ;8BB5FE;
    STA.W Mode7Object_PreInstructions,X                                  ;8BB601;
if !PAL == 0
    JSL.L Disable_CinematicBGTilemap_Updates                             ;8BB604;
endif
    JSR.W BlankOut_Subtitle_Tiles                                        ;8BB608;
if !PAL == 0
    LDY.W #IntroSubtitleData_Page3_Subpage2                              ;8BB60B;
    JSR.W LoadIntroSubtitleTiles                                         ;8BB60E;
    JSR.W TransferSubtitleTilesToVRAM                                    ;8BB611;
else
    LDA.W #IntroSubtitleTilemaps_German_Page3_Subpage2
    STA.B DP_Temp00
    LDA.W #$0080
    STA.B DP_Temp12
    JSR.W LoadIntroSubtitleTilemapTopRow
endif
    LDA.W #$003C                                                         ;8BB614;
    STA.W CinematicSpriteObject_IntroSubtitleTimer                       ;8BB617;

  .return:
    RTS                                                                  ;8BB61A;


;;; $B61B: Instruction - enable cinematic BG tilemap updates and page 3 done input ;;;
Instruction_EnableCinematicBGTilemapUpdates_Page3DoneInput:
    JSL.L Enable_CinematicBGTilemap_Updates                              ;8BB61B;
    LDA.W #CinematicFunc_Intro_WaitForInput_SetupBabyMetroidDelivery     ;8BB61F;
    STA.W CinematicFunction                                              ;8BB622;
    RTS                                                                  ;8BB625;


;;; $B626: Instruction - load Japanese intro text - page 4 - subpage 1 ;;;
Instruction_LoadIntroSubtitlePage4_Subpage1:
    PHY                                                                  ;8BB626;
if !PAL == 0
    JSL.L Disable_CinematicBGTilemap_Updates                             ;8BB627;
endif
    LDA.L Palettes_Intro_nonExistentIntroText1                           ;8BB62B;
    STA.L Palettes_BG3P4HighlightedHUDItemBackgroundOutline              ;8BB62F;
    LDA.L Palettes_Intro_nonExistentIntroText2                           ;8BB633;
    STA.L Palettes_BG3P4HighlightedHUDItemBackground                     ;8BB637;
    LDA.L Palettes_Intro_nonExistentIntroText3                           ;8BB63B;
    STA.L Palettes_BG3P4HighlightedHUDItemOutline                        ;8BB63F;
    JSR.W BlankOut_Subtitle_Tiles                                        ;8BB643;
if !PAL == 0
    LDY.W #IntroSubtitleData_Page4_Subpage1_TopLine                      ;8BB646;
    JSR.W LoadIntroSubtitleTiles                                         ;8BB649;
    LDY.W #IntroSubtitleData_Page4_Subpage1_BottomLine                   ;8BB64C;
    JSR.W LoadIntroSubtitleTiles                                         ;8BB64F;
    JSR.W TransferSubtitleTilesToVRAM                                    ;8BB652;
else
    LDA.W AltText  
    BNE .French
    LDA.W #IntroSubtitleTilemaps_German_Page4_Subpage1
    STA.B DP_Temp00
    LDA.W #$0100
    STA.B DP_Temp12
    JSR.W LoadIntroSubtitleTilemapTopRow
    BRA .return
    
  .French
    LDA.W #IntroSubtitleTilemaps_French_Page4_Subpage1
    STA.B DP_Temp00
    LDA.W #$0100
    STA.B DP_Temp12
    JSR.W LoadIntroSubtitleTilemapTopRow
endif

  .return:
    PLY                                                                  ;8BB655;
    RTS                                                                  ;8BB656;


;;; $B657: Pre-instruction - mode 7 object $D425 (page 4 - subpage 2) ;;;
PreInstruction_LoadIntroSubtitlePage4_Subpage2:
    LDA.B DP_Controller1New                                              ;8BB657;
    BEQ .return                                                          ;8BB659;
    LDA.W #InstList_EnableCinematicBGTilemapUpdates_Page4DoneInput       ;8BB65B;
    STA.W Mode7Object_InstListPointers,X                                 ;8BB65E;
    LDA.W #$0001                                                         ;8BB661;
    STA.W Mode7Object_InstructionTimers,X                                ;8BB664;
    LDA.W #RTS_8B93D9                                                    ;8BB667;
    STA.W Mode7Object_PreInstructions,X                                  ;8BB66A;
if !PAL == 0
    JSL.L Disable_CinematicBGTilemap_Updates                             ;8BB66D;
endif
    JSR.W BlankOut_Subtitle_Tiles                                        ;8BB671;
if !PAL == 0
    LDY.W #IntroSubtitleData_Page4_Subpage2_TopLine                      ;8BB674;
    JSR.W LoadIntroSubtitleTiles                                         ;8BB677;
    LDY.W #IntroSubtitleData_Page4_Subpage2_BottomLine                   ;8BB67A;
    JSR.W LoadIntroSubtitleTiles                                         ;8BB67D;
    JSR.W TransferSubtitleTilesToVRAM                                    ;8BB680;
else
    LDA.W AltText  
    BNE .French
    LDA.W #IntroSubtitleTilemaps_German_Page4_Subpage2
    STA.B DP_Temp00
    LDA.W #$0080
    STA.B DP_Temp12
    JSR.W LoadIntroSubtitleTilemapTopRow
    BRA .merge
    
  .French:
    LDA.W #IntroSubtitleTilemaps_French_Page4_Subpage2_top
    STA.B DP_Temp00
    LDA.W #$0080
    STA.B DP_Temp12
    JSR.W LoadIntroSubtitleTilemapTopRow
    LDA.W #IntroSubtitleTilemaps_French_Page4_Subpage2_bottom
    STA.B DP_Temp00
    LDA.W #$0080
    STA.B DP_Temp12
    JSR.W LoadIntroSubtitleTilemapBottomRow
  
  .merge
endif
    LDA.W #$003C                                                         ;8BB683;
    STA.W CinematicSpriteObject_IntroSubtitleTimer                       ;8BB686;

  .return:
    RTS                                                                  ;8BB689;


;;; $B68A: Instruction - enable cinematic BG tilemap updates and page 4 done input ;;;
Instruction_EnableCinematicBGTilemapUpdates_Page4DoneInput:
    JSL.L Enable_CinematicBGTilemap_Updates                              ;8BB68A;
    LDA.W #CinematicFunc_Intro_WaitForInput_SetupBabyMetroidExamined     ;8BB68E;
    STA.W CinematicFunction                                              ;8BB691;
    RTS                                                                  ;8BB694;


;;; $B695: Instruction - load Japanese intro text - page 5 - subpage 1 ;;;
Instruction_LoadIntroSubtitlePage5_Subpage1:
    PHY                                                                  ;8BB695;
if !PAL == 0
    JSL.L Disable_CinematicBGTilemap_Updates                             ;8BB696;
endif
    LDA.L Palettes_Intro_nonExistentIntroText1                           ;8BB69A;
    STA.L Palettes_BG3P4HighlightedHUDItemBackgroundOutline              ;8BB69E;
    LDA.L Palettes_Intro_nonExistentIntroText2                           ;8BB6A2;
    STA.L Palettes_BG3P4HighlightedHUDItemBackground                     ;8BB6A6;
    LDA.L Palettes_Intro_nonExistentIntroText3                           ;8BB6AA;
    STA.L Palettes_BG3P4HighlightedHUDItemOutline                        ;8BB6AE;
    JSR.W BlankOut_Subtitle_Tiles                                        ;8BB6B2;
if !PAL == 0
    LDY.W #IntroSubtitleData_Page5_Subpage1                              ;8BB6B5;
    JSR.W LoadIntroSubtitleTiles                                         ;8BB6B8;
    JSR.W TransferSubtitleTilesToVRAM                                    ;8BB6BB;
else
    LDA.W AltText  
    BNE .French
    LDA.W #IntroSubtitleTilemaps_German_Page5_Subpage1
    STA.B DP_Temp00
    LDA.W #$0100
    STA.B DP_Temp12
    JSR.W LoadIntroSubtitleTilemapTopRow
    BRA .return
    
  .French
    LDA.W #IntroSubtitleTilemaps_French_Page5
    STA.B DP_Temp00
    LDA.W #$0100
    STA.B DP_Temp12
    JSR.W LoadIntroSubtitleTilemapTopRow
endif

  .return:
    PLY                                                                  ;8BB6BE;
    RTS                                                                  ;8BB6BF;


;;; $B6C0: Pre-instruction - mode 7 object $D431 (page 5 - subpage 2) ;;;
PreInstruction_LoadIntroSubtitlePage5_Subpage2:
    LDA.B DP_Controller1New                                              ;8BB6C0;
    BEQ .return                                                          ;8BB6C2;
    LDA.W #InstList_EnableCinematicBGTilemapUpdates_Page5DoneInput       ;8BB6C4;
    STA.W Mode7Object_InstListPointers,X                                 ;8BB6C7;
    LDA.W #$0001                                                         ;8BB6CA;
    STA.W Mode7Object_InstructionTimers,X                                ;8BB6CD;
    LDA.W #RTS_8B93D9                                                    ;8BB6D0;
    STA.W Mode7Object_PreInstructions,X                                  ;8BB6D3;
if !PAL == 0
    JSL.L Disable_CinematicBGTilemap_Updates                             ;8BB6D6;
endif
    JSR.W BlankOut_Subtitle_Tiles                                        ;8BB6DA;
if !PAL == 0
    LDY.W #IntroSubtitleData_Page5_Subpage2                              ;8BB6DD;
    JSR.W LoadIntroSubtitleTiles                                         ;8BB6E0;
    JSR.W TransferSubtitleTilesToVRAM                                    ;8BB6E3;
else
    LDA.W #IntroSubtitleTilemaps_German_Page5_Subpage2
    STA.B DP_Temp00
    LDA.W #$0100
    STA.B DP_Temp12
    JSR.W LoadIntroSubtitleTilemapTopRow
endif
    LDA.W #$003C                                                         ;8BB6E6;
    STA.W CinematicSpriteObject_IntroSubtitleTimer                       ;8BB6E9;

  .return:
    RTS                                                                  ;8BB6EC;


;;; $B6ED: Instruction - enable cinematic BG tilemap updates and page 5 done input ;;;
Instruction_EnableCinematicBGTilemapUpdates_Page5DoneInput:
    JSL.L Enable_CinematicBGTilemap_Updates                              ;8BB6ED;
    LDA.W #CinematicFunction_Intro_WaitForInput_ClearText                ;8BB6F1;
    STA.W CinematicFunction                                              ;8BB6F4;
    RTS                                                                  ;8BB6F7;


;;; $B6F8: Instruction - load Japanese intro text - page 6 ;;;
Instruction_LoadIntroSubtitlePage6:
    PHY                                                                  ;8BB6F8;
if !PAL == 0
    JSL.L Disable_CinematicBGTilemap_Updates                             ;8BB6F9;
endif
    JSR.W BlankOut_Subtitle_Tiles                                        ;8BB6FD;
if !PAL == 0
    LDY.W #IntroSubtitleData_Page6                                       ;8BB700;
    JSR.W LoadIntroSubtitleTiles                                         ;8BB703;
    JSR.W TransferSubtitleTilesToVRAM                                    ;8BB706;
else
    LDA.W AltText  
    BNE .French
    LDA.W #IntroSubtitleTilemaps_German_Page6
    STA.B DP_Temp00
    LDA.W #$0100
    STA.B DP_Temp12
    JSR.W LoadIntroSubtitleTilemapTopRow
    BRA .return
    
  .French
    LDA.W #IntroSubtitleTilemaps_French_Page6
    STA.B DP_Temp00
    LDA.W #$0100
    STA.B DP_Temp12
    JSR.W LoadIntroSubtitleTilemapTopRow
endif

  .return:
    PLY                                                                  ;8BB709;
    RTS                                                                  ;8BB70A;


;;; $B70B: Instruction - enable cinematic BG tilemap updates ;;;
Instruction_EnableCinematicBGTilemapUpdates_duplicate_again:
    JSL.L Enable_CinematicBGTilemap_Updates                              ;8BB70B;
    RTS                                                                  ;8BB70F;
