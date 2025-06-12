
org $A98000


; Common to all enemy code banks
namespace CommonA9
incsrc "common_enemy_functions.asm"
namespace off


;;; $8687: Initialisation AI - enemy $EC7F (Mother Brain body) ;;;
InitAI_MotherBrainBody:
    PHB                                                                  ;A98687;
    PEA.W $7E7E                                                          ;A98688;
    PLB                                                                  ;A9868B;
    PLB                                                                  ;A9868C;
    LDA.W #$0338                                                         ;A9868D;
    LDX.W #$0FFE                                                         ;A98690;

  .loopTilemap:
    STA.W EnemyBG2Tilemap,X                                              ;A98693;
    DEX                                                                  ;A98696;
    DEX                                                                  ;A98697;
    BPL .loopTilemap                                                     ;A98698;
    PLB                                                                  ;A9869A;
    LDA.W #InstList_MotherBrainHead_InitialDummy                         ;A9869B;
    JSR.W SetMotherBrainBodyInstList                                     ;A9869E;
    STZ.W Enemy.GFXOffset                                                ;A986A1;
    LDA.W Enemy.properties                                               ;A986A4;
    ORA.W #$1500                                                         ;A986A7;
    STA.W Enemy.properties                                               ;A986AA;
    LDA.W #$0000                                                         ;A986AD;
    STA.W Enemy.palette                                                  ;A986B0;
    LDY.W #Palette_MotherBrain_GlassShards+2                             ;A986B3;
    LDX.W #$0162                                                         ;A986B6;
    LDA.W #$000F                                                         ;A986B9;
    JSL.L WriteAColorsFromYToTargetColorIndexX                           ;A986BC;
    LDY.W #Palette_MotherBrain_TubeProjectiles+2                         ;A986C0;
    LDX.W #$01E2                                                         ;A986C3;
    LDA.W #$000F                                                         ;A986C6;
    JSL.L WriteAColorsFromYToTargetColorIndexX                           ;A986C9;
    LDA.W #$0000                                                         ;A986CD;
    STA.L MotherBrainBody.form                                           ;A986D0;
    STA.L MotherBrainBody.enableUnpauseHookFlag                          ;A986D4;
    LDA.W #$0002                                                         ;A986D8;
    STA.L MotherBrainBody.hitboxesEnabled                                ;A986DB;
    LDA.W #Function_MotherBrain_SetupBrainToBeDrawn                      ;A986DF;
    STA.W MotherBrainBody.brainFunction                                  ;A986E2;
    LDA.W #Function_MotherBrain_FirstPhase                               ;A986E5;
    STA.W MotherBrainBody.function                                       ;A986E8;
    LDA.W #$0001                                                         ;A986EB;
    JSL.L Load_FX_Entry                                                  ;A986EE;
    LDA.W #$0000                                                         ;A986F2;

  .loopProjectiles:
    PHA                                                                  ;A986F5;
    LDY.W #EnemyProjectile_MotherBrainTurret                             ;A986F6;
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics                  ;A986F9;
    PLA                                                                  ;A986FD;
    INC                                                                  ;A986FE;
    CMP.W #$000C                                                         ;A986FF;
    BCC .loopProjectiles                                                 ;A98702;
    RTL                                                                  ;A98704;


;;; $8705: Initialisation AI - enemy $EC3F (Mother Brain brain) ;;;
InitAI_MotherBrainHead:
    LDX.W #$0040                                                         ;A98705;
    LDY.W #CorpseRottingDefinitions_MotherBrain                          ;A98708;
    JSR.W InitializeEnemyCorpseRotting                                   ;A9870B;
    LDA.W #$0BB8                                                         ;A9870E;
    STA.W Enemy[1].health                                                ;A98711;
    LDA.W #InstList_MotherBrainHead_InitialDummy                         ;A98714;
    JSR.W SetMotherBrainHeadUnusedInstList                               ;A98717;
    STZ.W Enemy[1].GFXOffset                                             ;A9871A;
    LDA.W Enemy[1].properties                                            ;A9871D;
    ORA.W #$1100                                                         ;A98720;
    STA.W Enemy[1].properties                                            ;A98723;
    LDA.W #$0200                                                         ;A98726;
    STA.W Enemy[1].palette                                               ;A98729;
    STA.L MotherBrainBody.neckPalleteIndex                               ;A9872C;
    STA.L MotherBrainBody.brainPalleteIndex                              ;A98730;
    LDA.W #InstList_MotherBrainHead_Initial                              ;A98734;
    JSR.W SetMotherBrainHeadInstList                                     ;A98737;
    JSR.W SetupMotherBrainHeadNormalPalette                              ;A9873A;
    RTL                                                                  ;A9873D;


;;; $873E: Main AI / hurt AI - enemy $EC7F (Mother Brain body) ;;;
MainAI_HurtAI_MotherBrainBody:
    JSR.W MotherBrainPalette_HandleRoomPalette                           ;A9873E;
    PEA.W .manualReturn-1                                                ;A98741;
    JMP.W (MotherBrainBody.function)                                     ;A98744;

  .manualReturn:
    JSR.W HandleMotherBrainsPalette                                      ;A98747;
    JSR.W MotherBrain_vs_Samus_CollisionDetection                        ;A9874A;
    JSR.W ProcessMotherBrainInvincibilityPalette                         ;A9874D;
    LDA.L MotherBrainBody.enableUnpauseHookFlag                          ;A98750;
    BEQ .return                                                          ;A98754;
    LDA.W #UnpauseHook_MotherBrainBody>>8&$FF00                          ;A98756;
    STA.W PauseHook_Unpause+1                                            ;A98759;
    LDA.W #UnpauseHook_MotherBrainBody                                   ;A9875C;
    STA.W PauseHook_Unpause                                              ;A9875F;

  .return:
    RTL                                                                  ;A98762;


;;; $8763: Unpause hook - Mother Brain body ;;;
UnpauseHook_MotherBrainBody:
    LDA.L MotherBrainBody.rainbowBeamSFXIsPlayingFlag                    ;A98763;
    BEQ .noRainbowSFX                                                    ;A98767;
    LDA.W #$0040                                                         ;A98769;
    JSL.L QueueSound_Lib1_Max6                                           ;A9876C;

  .noRainbowSFX:
    LDA.W Enemy.properties2                                              ;A98770;
    AND.W #$0004                                                         ;A98773;
    BEQ .return                                                          ;A98776;
    LDA.W #$0800                                                         ;A98778;
    STA.W EnemyBG2TilemapSize                                            ;A9877B;
    LDA.W #$0001                                                         ;A9877E;
    STA.W RequestEnemyBG2TilemapTransferFlag                             ;A98781;

  .return:
    RTL                                                                  ;A98784;


;;; $8785: RTS ;;;
RTS_A98785:
    RTS                                                                  ;A98785;


;;; $8786: RTL ;;;
RTL_A98786:
    RTL                                                                  ;A98786;


;;; $8787: Power bomb reaction - enemy $EC3F/$EC7F (Mother Brain) ;;;
PowerBombReaction_MotherBrain:
    JSL.L NormalEnemyPowerBombAI_NoDeathCheck_External                   ;A98787; Fallthrough to MainAI_HurtAI_MotherBrainHead


;;; $878B: Main AI / hurt AI - enemy $EC3F (Mother Brain brain) ;;;
MainAI_HurtAI_MotherBrainHead:
; Power bomb reaction for enemy $EC7F falls through into here, possible bug?

; If set to invisible, then process a function that may set enemy graphics drawn hook to a function that draws Mother Brain.
; Why use the enemy graphics drawn hook instead of doing the work here?
    LDA.W #RTL_A98786>>8&$FF00                                           ;A9878B;
    STA.W EnemyGraphicsDrawnHook+1                                       ;A9878E;
    LDA.W #RTL_A98786                                                    ;A98791;
    STA.W EnemyGraphicsDrawnHook                                         ;A98794;
    LDA.W Enemy[1].properties                                            ;A98797;
    AND.W #$0100                                                         ;A9879A;
    BEQ RTL_A98786                                                       ;A9879D;
    JMP.W (MotherBrainBody.brainFunction)                                ;A9879F;


;;; $87A2: Mother Brain brain function - set up brain and neck to be drawn ;;;
Function_MotherBrain_SetupBrainAndNeckToBeDrawn:
    LDA.W TimeIsFrozenFlag                                               ;A987A2;
    BNE .timeIsFrozen                                                    ;A987A5;
    JSR.W HandleMotherBrainsNeck                                         ;A987A7;

  .timeIsFrozen:
    LDA.L MotherBrainBody.neckSegment4XPosition                          ;A987AA;
    STA.W Enemy[1].XPosition                                             ;A987AE;
    LDA.W #$FFEB                                                         ;A987B1;
    CLC                                                                  ;A987B4;
    ADC.L MotherBrainBody.neckSegment4YPosition                          ;A987B5;
    STA.W Enemy[1].YPosition                                             ;A987B9;
    LDA.W #EnemyGraphicsDrawnHook_MotherBrain_DrawBrainAndNeck>>8&$FF00  ;A987BC;
    STA.W EnemyGraphicsDrawnHook+1                                       ;A987BF;
    LDA.W #EnemyGraphicsDrawnHook_MotherBrain_DrawBrainAndNeck           ;A987C2;
    STA.W EnemyGraphicsDrawnHook                                         ;A987C5;
    RTL                                                                  ;A987C8;


;;; $87C9: Enemy graphics drawn hook - Mother Brain - draw brain and neck ;;;
EnemyGraphicsDrawnHook_MotherBrain_DrawBrainAndNeck:
    JSR.W DrawMotherBrainHead                                            ;A987C9;
    JSR.W DrawMotherBrainsNeck                                           ;A987CC;
    RTL                                                                  ;A987CF;


;;; $87D0: Mother Brain brain function - set up brain to be drawn ;;;
Function_MotherBrain_SetupBrainToBeDrawn:
    LDA.W #EnemyGraphicsDrawnHook_MotherBrain_DrawBrain>>8&$FF00         ;A987D0;
    STA.W EnemyGraphicsDrawnHook+1                                       ;A987D3;
    LDA.W #EnemyGraphicsDrawnHook_MotherBrain_DrawBrain                  ;A987D6;
    STA.W EnemyGraphicsDrawnHook                                         ;A987D9;
    RTL                                                                  ;A987DC;


;;; $87DD: Enemy graphics drawn hook - Mother Brain - draw brain ;;;
EnemyGraphicsDrawnHook_MotherBrain_DrawBrain:
    JSR.W DrawMotherBrainHead                                            ;A987DD;
    RTL                                                                  ;A987E0;


;;; $87E1: Mother Brain body function - first phase ;;;
Function_MotherBrain_FirstPhase:
    LDA.W #$0002                                                         ;A987E1;
    JSL.L CheckIfEvent_inA_HasHappened                                   ;A987E4;
    BCC .runCollisionDetection                                           ;A987E8;
    LDA.W EarthquakeTimer                                                ;A987EA;
    STA.L MotherBrainBody.brainMainShakeTimer                            ;A987ED;
    LDA.W SamusXPosition                                                 ;A987F1;
    CMP.W #$00EC                                                         ;A987F4;
    BPL .runCollisionDetection                                           ;A987F7;
    LDA.W Enemy[1].health                                                ;A987F9;
    BNE .runCollisionDetection                                           ;A987FC;
    LDA.W #$0001                                                         ;A987FE;
    STA.L MotherBrainBody.deleteTurretsRinkasFlag                        ;A98801;
    STA.L MotherBrainBody.form                                           ;A98805;
    JSL.L DisableMinimap_MarkBossRoomTilesExplored                       ;A98809;
    LDA.W #$0006                                                         ;A9880D;
    JSL.L QueueMusicDataOrTrack_8FrameDelay                              ;A98810;
    JSL.L SealMotherBrainsWallFunction_FakeDeath_Descent                 ;A98814;

  .runCollisionDetection:
    JSR.W MotherBrain_vs_Samus_CollisionDetection                        ;A98818;
    PLA                                                                  ;A9881B;
    RTL                                                                  ;A9881C;


;;; $881D: Mother Brain body function - fake death - descent - initial pause ;;;
Function_MotherBrainBody_FakeDeath_Descent_InitialPause:
    LDA.W #Function_MBBody_FakeDeath_Descent_LockSamus_SetScrollRegion   ;A9881D;
    STA.W MotherBrainBody.function                                       ;A98820;
    LDA.W #$0040                                                         ;A98823;
    STA.W MotherBrainBody.functionTimer                                  ;A98826; fallthrough to Function_MBBody_FakeDeath_Descent_LockSamus_SetScrollRegion


;;; $8829: Mother Brain body function - fake death - descent - lock Samus and set scroll region ;;;
Function_MBBody_FakeDeath_Descent_LockSamus_SetScrollRegion:
    DEC.W MotherBrainBody.functionTimer                                  ;A98829;
    BMI .timerExpired                                                    ;A9882C;
    RTS                                                                  ;A9882E;

  .timerExpired:
    LDA.W #$0000                                                         ;A9882F;
    JSL.L Run_Samus_Command                                              ;A98832;
    LDA.L Scrolls                                                        ;A98836;
    AND.W #$00FF                                                         ;A9883A;
    STA.L Scrolls                                                        ;A9883D;
    LDA.W #Function_MotherBrainBody_FakeDeath_Descent_QueueMusic         ;A98841;
    STA.W MotherBrainBody.function                                       ;A98844;
    LDA.W #$0020                                                         ;A98847;
    STA.W MotherBrainBody.functionTimer                                  ;A9884A; fallthrough to Function_MotherBrainBody_FakeDeath_Descent_QueueMusic


;;; $884D: Mother Brain body function - fake death - descent - queue Mother Brain music ;;;
Function_MotherBrainBody_FakeDeath_Descent_QueueMusic:
    DEC.W MotherBrainBody.functionTimer                                  ;A9884D;
    BPL Function_MBBody_FakeDeath_Descent_BeginScnFlashing_LowerAcid_return ;A98850;
    LDA.W #$0000                                                         ;A98852;
    JSL.L QueueMusicDataOrTrack_8FrameDelay                              ;A98855;
    LDA.W #$FF21                                                         ;A98859;
    JSL.L QueueMusicDataOrTrack_8FrameDelay                              ;A9885C;
    LDA.W #Function_MotherBrainBody_FakeDeath_Descent_UnlockSamus        ;A98860;
    STA.W MotherBrainBody.function                                       ;A98863;
    LDA.W #$000C                                                         ;A98866;
    STA.W MotherBrainBody.functionTimer                                  ;A98869; fallthrough to Function_MotherBrainBody_FakeDeath_Descent_UnlockSamus


;;; $886C: Mother Brain body function - fake death - descent - unlock Samus ;;;
Function_MotherBrainBody_FakeDeath_Descent_UnlockSamus:
    DEC.W MotherBrainBody.functionTimer                                  ;A9886C;
    BPL Function_MBBody_FakeDeath_Descent_BeginScnFlashing_LowerAcid_return ;A9886F;
    LDA.W #$0001                                                         ;A98871;
    JSL.L Run_Samus_Command                                              ;A98874;
    LDA.W #Function_MBBody_FakeDeath_Descent_BeginScnFlashing_LowerAcid  ;A98878;
    STA.W MotherBrainBody.function                                       ;A9887B;
    LDA.W #$0008                                                         ;A9887E;
    STA.W MotherBrainBody.functionTimer                                  ;A98881; fallthrough to Function_MBBody_FakeDeath_Descent_BeginScnFlashing_LowerAcid


;;; $8884: Mother Brain body function - fake death - descent - begin screen flashing and lower acid ;;;
Function_MBBody_FakeDeath_Descent_BeginScnFlashing_LowerAcid:
    DEC.W MotherBrainBody.functionTimer                                  ;A98884;
    BPL .return                                                          ;A98887;
    JSR.W MotherBrainPalette_BeginScreenFlashing                         ;A98889;
    LDA.W #$0002                                                         ;A9888C;
    JSL.L Load_FX_Entry                                                  ;A9888F;
    LDA.W #Function_MotherBrainBody_SpawnTubesFallingWhenLessThan4Proj   ;A98893;
    STA.W MotherBrainBody.subFunction                                    ;A98896;
    LDA.W #Function_MBBody_FakeDeath_Descent_TransitionMBPaletteToGrey   ;A98899;
    STA.W MotherBrainBody.function                                       ;A9889C;
    STZ.W MotherBrainBody.functionTimer                                  ;A9889F;
    LDA.W #$0000                                                         ;A988A2;
    STA.L MotherBrainBody.greyTransitionCounter                          ;A988A5;
    JSL.L Spawn_Hardcoded_PLM                                            ;A988A9;
    db $0E,$02                                                           ;A988AD;
    dw PLMEntries_clearCeilingBlockInMotherBrainsRoom                    ;A988AF;

  .return:
    RTS                                                                  ;A988B1;


Function_MBBody_FakeDeath_Descent_TransitionMBPaletteToGrey:
    DEC.W MotherBrainBody.functionTimer                                  ;A988B2;
    BPL Function_MBBody_FakeDeath_Descent_CollapseTubes                  ;A988B5;
    LDA.W #$0008                                                         ;A988B7;
    STA.W MotherBrainBody.functionTimer                                  ;A988BA;
    LDA.L MotherBrainBody.greyTransitionCounter                          ;A988BD;
    INC                                                                  ;A988C1;
    STA.L MotherBrainBody.greyTransitionCounter                          ;A988C2;
    DEC                                                                  ;A988C6;
    JSL.L TransitionMotherBrainPaletteToGrey_FakeDeath                   ;A988C7;
    BCC Function_MBBody_FakeDeath_Descent_CollapseTubes                  ;A988CB;
    LDA.W #Function_MBBody_FakeDeath_Descent_CollapseTubes               ;A988CD;
    STA.W MotherBrainBody.function                                       ;A988D0; fallthrough to Function_MBBody_FakeDeath_Descent_CollapseTubes


;;; $88D3: Mother Brain body function - fake death - descent - collapse tubes ;;;
Function_MBBody_FakeDeath_Descent_CollapseTubes:
    PEA.W .manualReturn-1                                                ;A988D3;
    JMP.W (MotherBrainBody.subFunction)                                  ;A988D6;

  .manualReturn:
    JSR.W HandleFakeDeathExplosions                                      ;A988D9;
    RTS                                                                  ;A988DC;


;;; $88DD: Handle fake death explosions ;;;
HandleFakeDeathExplosions:
    LDA.L MotherBrainBody.fakeDeathExplosionTimer                        ;A988DD;
    DEC                                                                  ;A988E1;
    BMI .timerExpired                                                    ;A988E2;
    STA.L MotherBrainBody.fakeDeathExplosionTimer                        ;A988E4;
    RTS                                                                  ;A988E8;

  .timerExpired:
    LDA.W #$0008                                                         ;A988E9;
    STA.L MotherBrainBody.fakeDeathExplosionTimer                        ;A988EC;
    LDA.L MotherBrainBody.fakeDeathExplosionIndex                        ;A988F0;
    DEC                                                                  ;A988F4;
    BPL +                                                                ;A988F5;
    LDA.W #$0007                                                         ;A988F7;

+   STA.L MotherBrainBody.fakeDeathExplosionIndex                        ;A988FA;
    ASL                                                                  ;A988FE;
    ASL                                                                  ;A988FF;
    TAX                                                                  ;A98900;
    LDA.W .XPosition,X                                                   ;A98901;
    STA.B DP_Temp12                                                      ;A98904;
    LDA.W .YPosition,X                                                   ;A98906;
    STA.B DP_Temp14                                                      ;A98909;
    LDY.W #$0003                                                         ;A9890B;
    LDA.W RandomNumberSeed                                               ;A9890E;
    CMP.W #$4000                                                         ;A98911;
    BCS +                                                                ;A98914;
    LDY.W #$000C                                                         ;A98916;

+   TYA                                                                  ;A98919;
    LDY.W #EnemyProjectile_MiscDust                                      ;A9891A;
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics                  ;A9891D;
    LDA.W #$0024                                                         ;A98921;
    JSL.L QueueSound_Lib2_Max3                                           ;A98924;
    RTS                                                                  ;A98928;

  .XPosition:
    dw $0088                                                             ;A98929;
  .YPosition:
    dw       $0074                                                       ;A9892B;
    dw $0078,$0084
    dw $007C,$005A
    dw $008A,$0092
    dw $0078,$0034
    dw $007C,$00AA
    dw $008A,$0048
    dw $0078,$00CE


;;; $8949: Mother brain body subfunction - wait until there are less than 4 enemy projectiles alive and spawn tubes falling enemy 0 ;;;
Function_MotherBrainBody_SpawnTubesFallingWhenLessThan4Proj:
    LDY.W #$0000                                                         ;A98949;
    TYX                                                                  ;A9894C;

  .loop:
    LDA.W EnemyProjectile_ID,Y                                           ;A9894D;
    BNE .nextProj                                                        ;A98950;
    INX                                                                  ;A98952;

  .nextProj:
    INY                                                                  ;A98953;
    INY                                                                  ;A98954;
    CPY.W #$0024                                                         ;A98955;
    BMI .loop                                                            ;A98958;
    CPX.W #$0004                                                         ;A9895A;
    BPL .tooManyProjs                                                    ;A9895D;
    RTS                                                                  ;A9895F;

  .tooManyProjs:
    LDX.W #EnemyPopulations_MotherBrainFallingTubes_BottomLeft           ;A98960;
    JSL.L SpawnEnemy                                                     ;A98963;
    LDA.W #Function_MotherBrainBody_ClearBottomLeftTube                  ;A98967;
    STA.W MotherBrainBody.subFunction                                    ;A9896A;
    RTS                                                                  ;A9896D;


;;; $896E: Mother brain body subfunction - clear bottom-left tube ;;;
Function_MotherBrainBody_ClearBottomLeftTube:
    JSL.L Spawn_Hardcoded_PLM                                            ;A9896E;
    db $05,$09                                                           ;A98972;
    dw PLMEntries_clearMotherBrainsBottomLeftTube                        ;A98974;
    LDA.W #Function_MotherBrainBody_SpawnTopRightTubeFallingProjectile   ;A98976;
    STA.W MotherBrainBody.subFunction                                    ;A98979;
    LDA.W #$0020                                                         ;A9897C;
    STA.W MotherBrainBody.bodySubFunctionTimer                           ;A9897F;
    RTS                                                                  ;A98982;


;;; $8983: Mother brain body subfunction - spawn top-right tube falling enemy projectile ;;;
Function_MotherBrainBody_SpawnTopRightTubeFallingProjectile:
    DEC.W MotherBrainBody.bodySubFunctionTimer                           ;A98983;
    BPL .return                                                          ;A98986;
    LDA.W #$0098                                                         ;A98988;
    STA.B DP_Temp12                                                      ;A9898B;
    LDA.W #$002F                                                         ;A9898D;
    STA.B DP_Temp14                                                      ;A98990;
    LDY.W #EnemyProjectile_MotherBrainTubeFalling_TopRight               ;A98992;
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics                  ;A98995;
    LDA.W #Function_MotherBrainBody_ClearCeilingBlockColumn9             ;A98999;
    STA.W MotherBrainBody.subFunction                                    ;A9899C;

  .return:
    RTS                                                                  ;A9899F;


;;; $89A0: Mother brain body subfunction - clear ceiling block column 9 ;;;
Function_MotherBrainBody_ClearCeilingBlockColumn9:
    JSL.L Spawn_Hardcoded_PLM                                            ;A989A0;
    db $09,$02                                                           ;A989A4;
    dw PLMEntries_clearCeilingBlockInMotherBrainsRoom                    ;A989A6;
    LDA.W #Function_MotherBrainBody_SpawnTopLeftTubeFallingProjectile    ;A989A8;
    STA.W MotherBrainBody.subFunction                                    ;A989AB;
    LDA.W #$0020                                                         ;A989AE;
    STA.W MotherBrainBody.bodySubFunctionTimer                           ;A989B1;
    RTS                                                                  ;A989B4;


;;; $89B5: Mother brain body subfunction - spawn top-left tube falling enemy projectile ;;;
Function_MotherBrainBody_SpawnTopLeftTubeFallingProjectile:
    DEC.W MotherBrainBody.bodySubFunctionTimer                           ;A989B5;
    BPL .return                                                          ;A989B8;
    LDA.W #$0068                                                         ;A989BA;
    STA.B DP_Temp12                                                      ;A989BD;
    LDA.W #$002F                                                         ;A989BF;
    STA.B DP_Temp14                                                      ;A989C2;
    LDY.W #EnemyProjectile_MotherBrainTubeFalling_TopLeft                ;A989C4;
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics                  ;A989C7;
    LDA.W #Function_MotherBrainBody_ClearCeilingBlockColumn6             ;A989CB;
    STA.W MotherBrainBody.subFunction                                    ;A989CE;

  .return:
    RTS                                                                  ;A989D1;


;;; $89D2: Mother brain body subfunction - clear ceiling block column 6 ;;;
Function_MotherBrainBody_ClearCeilingBlockColumn6:
    JSL.L Spawn_Hardcoded_PLM                                            ;A989D2;
    db $06,$02                                                           ;A989D6;
    dw PLMEntries_clearCeilingBlockInMotherBrainsRoom                    ;A989D8;
    LDA.W #Function_MotherBrainBody_SpawnTubesFalling1                   ;A989DA;
    STA.W MotherBrainBody.subFunction                                    ;A989DD;
    LDA.W #$0020                                                         ;A989E0;
    STA.W MotherBrainBody.bodySubFunctionTimer                           ;A989E3;
    RTS                                                                  ;A989E6;


;;; $89E7: Mother brain body subfunction - spawn tubes falling enemy 1 ;;;
Function_MotherBrainBody_SpawnTubesFalling1:
    DEC.W MotherBrainBody.bodySubFunctionTimer                           ;A989E7;
    BPL .return                                                          ;A989EA;
    LDX.W #EnemyPopulations_MotherBrainFallingTubes_BottomRight          ;A989EC;
    JSL.L SpawnEnemy                                                     ;A989EF;
    LDA.W #Function_MotherBrainBody_ClearBottomRightTube                 ;A989F3;
    STA.W MotherBrainBody.subFunction                                    ;A989F6;

  .return:
    RTS                                                                  ;A989F9;


;;; $89FA: Mother brain body subfunction - clear bottom-right tube ;;;
Function_MotherBrainBody_ClearBottomRightTube:
    JSL.L Spawn_Hardcoded_PLM                                            ;A989FA;
    db $0A,$09                                                           ;A989FE;
    dw PLMEntries_clearMotherBrainsBottomRightTube                       ;A98A00;
    LDA.W #Function_MotherBrainBody_SpawnTubesFalling2                   ;A98A02;
    STA.W MotherBrainBody.subFunction                                    ;A98A05;
    LDA.W #$0020                                                         ;A98A08;
    STA.W MotherBrainBody.bodySubFunctionTimer                           ;A98A0B;
    RTS                                                                  ;A98A0E;


;;; $8A0F: Mother brain body subfunction - spawn tubes falling enemy 2 ;;;
Function_MotherBrainBody_SpawnTubesFalling2:
    DEC.W MotherBrainBody.bodySubFunctionTimer                           ;A98A0F;
    BPL .return                                                          ;A98A12;
    LDX.W #EnemyPopulations_MotherBrainFallingTubes_BottomMiddleLeft     ;A98A14;
    JSL.L SpawnEnemy                                                     ;A98A17;
    LDA.W #Function_MotherBrainBody_ClearBottomMiddleLeftTube            ;A98A1B;
    STA.W MotherBrainBody.subFunction                                    ;A98A1E;

  .return:
    RTS                                                                  ;A98A21;


;;; $8A22: Mother brain body subfunction - clear bottom-middle-left tube ;;;
Function_MotherBrainBody_ClearBottomMiddleLeftTube:
    JSL.L Spawn_Hardcoded_PLM                                            ;A98A22;
    db $06,$0A                                                           ;A98A26;
    dw PLMEntries_clearMotherBrainsBottomMiddleSideTube                  ;A98A28;
    LDA.W #Function_MotherBrainBody_SpawnTopMiddleLeftTubeFallingProj    ;A98A2A;
    STA.W MotherBrainBody.subFunction                                    ;A98A2D;
    LDA.W #$0020                                                         ;A98A30;
    STA.W MotherBrainBody.bodySubFunctionTimer                           ;A98A33;
    RTS                                                                  ;A98A36;


;;; $8A37: Mother brain body subfunction - spawn top-middle-left tube falling enemy projectile ;;;
Function_MotherBrainBody_SpawnTopMiddleLeftTubeFallingProj:
    DEC.W MotherBrainBody.bodySubFunctionTimer                           ;A98A37;
    BPL .return                                                          ;A98A3A;
    LDA.W #$0078                                                         ;A98A3C;
    STA.B DP_Temp12                                                      ;A98A3F;
    LDA.W #$003B                                                         ;A98A41;
    STA.B DP_Temp14                                                      ;A98A44;
    LDY.W #EnemyProjectile_MotherBrainTubeFalling_TopMiddleLeft          ;A98A46;
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics                  ;A98A49;
    LDA.W #Function_MotherBrainBody_ClearCeilingTubeColumn7              ;A98A4D;
    STA.W MotherBrainBody.subFunction                                    ;A98A50;

  .return:
    RTS                                                                  ;A98A53;


;;; $8A54: Mother brain body subfunction - clear ceiling tube column 7 ;;;
Function_MotherBrainBody_ClearCeilingTubeColumn7:
    JSL.L Spawn_Hardcoded_PLM                                            ;A98A54;
    db $07,$02                                                           ;A98A58;
    dw PLMEntries_clearCeilingTubeInMotherBrainsRoom                     ;A98A5A;
    LDA.W #Function_MotherBrainBody_SpawnTopMiddleRightTubeFallingProj   ;A98A5C;
    STA.W MotherBrainBody.subFunction                                    ;A98A5F;
    LDA.W #$0020                                                         ;A98A62;
    STA.W MotherBrainBody.bodySubFunctionTimer                           ;A98A65;
    RTS                                                                  ;A98A68;


;;; $8A69: Mother brain body subfunction - spawn top-middle-right tube falling enemy projectile ;;;
Function_MotherBrainBody_SpawnTopMiddleRightTubeFallingProj:
    DEC.W MotherBrainBody.bodySubFunctionTimer                           ;A98A69;
    BPL .return                                                          ;A98A6C;
    LDA.W #$0088                                                         ;A98A6E;
    STA.B DP_Temp12                                                      ;A98A71;
    LDA.W #$003B                                                         ;A98A73;
    STA.B DP_Temp14                                                      ;A98A76;
    LDY.W #EnemyProjectile_MotherBrainTubeFalling_TopMiddleRight         ;A98A78;
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics                  ;A98A7B;
    LDA.W #Function_MotherBrainBody_ClearCeilingTubeColumn8              ;A98A7F;
    STA.W MotherBrainBody.subFunction                                    ;A98A82;

  .return:
    RTS                                                                  ;A98A85;


;;; $8A86: Mother brain body subfunction - clear ceiling tube column 8 ;;;
Function_MotherBrainBody_ClearCeilingTubeColumn8:
    JSL.L Spawn_Hardcoded_PLM                                            ;A98A86;
    db $08,$02                                                           ;A98A8A;
    dw PLMEntries_clearCeilingTubeInMotherBrainsRoom                     ;A98A8C;
    LDA.W #Function_MotherBrainBody_SpawnTubesFalling3                   ;A98A8E;
    STA.W MotherBrainBody.subFunction                                    ;A98A91;
    LDA.W #$0020                                                         ;A98A94;
    STA.W MotherBrainBody.bodySubFunctionTimer                           ;A98A97;
    RTS                                                                  ;A98A9A;


;;; $8A9B: Mother brain body subfunction - spawn tubes falling enemy 3 ;;;
Function_MotherBrainBody_SpawnTubesFalling3:
    DEC.W MotherBrainBody.bodySubFunctionTimer                           ;A98A9B;
    BPL .return                                                          ;A98A9E;
    LDX.W #EnemyPopulations_MotherBrainFallingTubes_BottomMiddleRight    ;A98AA0;
    JSL.L SpawnEnemy                                                     ;A98AA3;
    LDA.W #Function_MotherBrainBody_ClearBottomMiddleRightTube           ;A98AA7;
    STA.W MotherBrainBody.subFunction                                    ;A98AAA;

  .return:
    RTS                                                                  ;A98AAD;


;;; $8AAE: Mother brain body subfunction - clear bottom-middle-right tube ;;;
Function_MotherBrainBody_ClearBottomMiddleRightTube:
    JSL.L Spawn_Hardcoded_PLM                                            ;A98AAE;
    db $09,$0A                                                           ;A98AB2;
    dw PLMEntries_clearMotherBrainsBottomMiddleSideTube                  ;A98AB4;
    LDA.W #Function_MotherBrainBody_SpawnTubesFalling4                   ;A98AB6;
    STA.W MotherBrainBody.subFunction                                    ;A98AB9;
    LDA.W #$0002                                                         ;A98ABC;
    STA.W MotherBrainBody.bodySubFunctionTimer                           ;A98ABF;
    RTS                                                                  ;A98AC2;


;;; $8AC3: Mother brain body subfunction - spawn tubes falling enemy 4 ;;;
Function_MotherBrainBody_SpawnTubesFalling4:
    DEC.W MotherBrainBody.bodySubFunctionTimer                           ;A98AC3;
    BPL .return                                                          ;A98AC6;
    LDX.W #EnemyPopulations_MotherBrainFallingTubes_MainTube             ;A98AC8;
    JSL.L SpawnEnemy                                                     ;A98ACB;
    LDA.W #Function_MotherBrainBody_ClearBottomMiddleTubes               ;A98ACF;
    STA.W MotherBrainBody.subFunction                                    ;A98AD2;

  .return:
    RTS                                                                  ;A98AD5;


;;; $8AD6: Mother brain body subfunction - clear bottom-middle tubes ;;;
Function_MotherBrainBody_ClearBottomMiddleTubes:
    JSL.L Spawn_Hardcoded_PLM                                            ;A98AD6;
    db $07,$07                                                           ;A98ADA;
    dw PLMEntries_clearMotherBrainsBottomMiddleTubes                     ;A98ADC;
    LDA.W #.return                                                       ;A98ADE;
    STA.W MotherBrainBody.subFunction                                    ;A98AE1;

  .return:
    RTS                                                                  ;A98AE4;


;;; $8AE5: Mother Brain tubes falling enemy population entries ;;;
; Enemy population format is:
; ____________________________________________ Enemy ID
;        _____________________________________ X position
;       |      _______________________________ Y position
;       |     |      _________________________ Initialisation parameter (orientation in SMILE)
;       |     |     |      ___________________ Properties (special in SMILE)
;       |     |     |     |      _____________ Extra properties (special graphics bitset in SMILE)
;       |     |     |     |     |      _______ Parameter 1 (speed in SMILE)
;       |     |     |     |     |     |      _ Parameter 2 (speed2 in SMILE)
;       |     |     |     |     |     |     |
;       xxxx  yyyy  oooo  pppp  gggg  aaaa  bbbb

;  ______ Terminator
; |     _ Number of enemy deaths needed to clear current room
; |    |
; FFFF nn
EnemyPopulations_MotherBrainFallingTubes_BottomLeft:                     ;A98AE5;
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_MotherBrainTubes),
    %XPosition($0060),
    %YPosition($00B3),
    %initParam(InstList_MotherBrainTubes_0),
    %properties($A000),
    %extraProperties($0000),
    %speedParams(0, 0))

EnemyPopulations_MotherBrainFallingTubes_BottomRight:                    ;A98AF5;
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_MotherBrainTubes),
    %XPosition($00A0),
    %YPosition($00B3),
    %initParam(InstList_MotherBrainTubes_1),
    %properties($A000),
    %extraProperties($0000),
    %speedParams(2, 0))

EnemyPopulations_MotherBrainFallingTubes_BottomMiddleLeft:               ;A98B05;
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_MotherBrainTubes),
    %XPosition($0068),
    %YPosition($00BB),
    %initParam(InstList_MotherBrainTubes_2),
    %properties($A000),
    %extraProperties($0000),
    %speedParams(4, 0))

EnemyPopulations_MotherBrainFallingTubes_BottomMiddleRight:              ;A98B15;
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_MotherBrainTubes),
    %XPosition($0098),
    %YPosition($00BB),
    %initParam(InstList_MotherBrainTubes_3),
    %properties($A000),
    %extraProperties($0000),
    %speedParams(6, 0))

EnemyPopulations_MotherBrainFallingTubes_MainTube:                       ;A98B25;
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_MotherBrainTubes),
    %XPosition($0080),
    %YPosition($00A7),
    %initParam(InstList_MotherBrainTubes_4),
    %properties($A800),
    %extraProperties($0000),
    %speedParams(8, $20))


;;; $8B35: Initialisation AI - enemy $ECFF (Mother Brain tubes falling) ;;;
InitAI_MotherBrainTubes:
    LDX.W EnemyIndex                                                     ;A98B35;
    LDY.W MotherBrainTubes.tubeType,X                                    ;A98B38;
    LDA.W .XRadius,Y                                                     ;A98B3B;
    STA.W Enemy.XHitboxRadius,X                                          ;A98B3E;
    LDA.W .YRadius,Y                                                     ;A98B41;
    STA.W Enemy.YHitboxRadius,X                                          ;A98B44;
    LDA.W .YPositionThreshold,Y                                          ;A98B47;
    STA.W MotherBrainTubes.YPositionThreshold,X                          ;A98B4A;
    STZ.W MotherBrainTubes.smokeTimer,X                                  ;A98B4D;
    STZ.W MotherBrainTubes.smokeCounter,X                                ;A98B50;
    STZ.W MotherBrainTubes.YVelocity,X                                   ;A98B53;
    LDA.W .functionPointer,Y                                             ;A98B56;
    STA.W MotherBrainTubes.function,X                                    ;A98B59;
    RTL                                                                  ;A98B5C;

  .XRadius:
    dw $0010,$0010,$0008,$0008,$0010                                     ;A98B5D;

  .YRadius:
    dw $0020,$0020,$0018,$0018,$0020                                     ;A98B67;

  .YPositionThreshold:
    dw $00F8,$00F8,$00F0,$00F0,$00F6                                     ;A98B71;

  .functionPointer:
    dw Function_MotherBrainTubes_NonMainTube                             ;A98B7B;
    dw Function_MotherBrainTubes_NonMainTube                             ;A98B7D;
    dw Function_MotherBrainTubes_NonMainTube                             ;A98B7F;
    dw Function_MotherBrainTubes_NonMainTube                             ;A98B81;
    dw Function_MotherBrainTubes_MainTube_WaitingToFall                  ;A98B83;


;;; $8B85: Main AI - enemy $ECFF (Mother Brain tubes falling) ;;;
MainAI_MotherBrainTubes:
    JMP.W (MotherBrainTubes.function,X)                                  ;A98B85;


;;; $8B88: Mother Brain tubes falling function - non-main tube ;;;
Function_MotherBrainTubes_NonMainTube:
    LDA.W MotherBrainTubes.YVelocity,X                                   ;A98B88;
    CLC                                                                  ;A98B8B;
    ADC.W #$0006                                                         ;A98B8C;
    STA.W MotherBrainTubes.YVelocity,X                                   ;A98B8F;
    JSR.W AddADividedBy100ToEnemyYPosition                               ;A98B92;
    LDA.W Enemy.YPosition,X                                              ;A98B95;
    CMP.W MotherBrainTubes.YPositionThreshold,X                          ;A98B98;
    BPL ExplodeMotherBrainTubes                                          ;A98B9B; fallthrough to HandleFallingTubeSmoke


;;; $8B9D: Handle falling tube smoke ;;;
HandleFallingTubeSmoke:
    DEC.W MotherBrainTubes.smokeTimer,X                                  ;A98B9D;
    BPL .return                                                          ;A98BA0;
    JSR.W SpawnFallingTubeSmoke                                          ;A98BA2;

  .return:
    RTL                                                                  ;A98BA5;


;;; $8BA6: Explode Mother Brain tube ;;;
ExplodeMotherBrainTubes:
    LDA.W Enemy.properties,X                                             ;A98BA6;
    ORA.W #$0200                                                         ;A98BA9;
    STA.W Enemy.properties,X                                             ;A98BAC;
    LDA.W Enemy.XPosition,X                                              ;A98BAF;
    STA.B DP_Temp12                                                      ;A98BB2;
    LDA.W Enemy.YPosition,X                                              ;A98BB4;
    STA.B DP_Temp14                                                      ;A98BB7;
    LDA.W #$0003                                                         ;A98BB9;
    LDY.W #EnemyProjectile_MiscDust                                      ;A98BBC;
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics                  ;A98BBF;
    LDA.W #$0024                                                         ;A98BC3;
    JSL.L QueueSound_Lib2_Max3                                           ;A98BC6;
    RTL                                                                  ;A98BCA;


;;; $8BCB: Mother Brain tubes falling function - main tube - waiting to fall ;;;
Function_MotherBrainTubes_MainTube_WaitingToFall:
    DEC.W MotherBrainTubes.fallDelayTimer,X                              ;A98BCB;
    BPL HandleFallingTubeSmoke_return                                    ;A98BCE;
    LDA.W #Function_MotherBrainTubes_MainTube_Falling                    ;A98BD0;
    STA.W MotherBrainTubes.function,X                                    ;A98BD3; fallthrough to Function_MotherBrainTubes_MainTube_Falling


;;; $8BD6: Mother Brain tubes falling function - main tube - falling ;;;
Function_MotherBrainTubes_MainTube_Falling:
    LDA.W MotherBrainTubes.YVelocity,X                                   ;A98BD6;
    CLC                                                                  ;A98BD9;
    ADC.W #$0006                                                         ;A98BDA;
    STA.W MotherBrainTubes.YVelocity,X                                   ;A98BDD;
    JSR.W AddADividedBy100ToEnemyYPosition                               ;A98BE0;
    PHA                                                                  ;A98BE3;
    CMP.W #$00F4                                                         ;A98BE4;
    BMI .lessThanF4                                                      ;A98BE7;
    LDA.W Enemy.properties,X                                             ;A98BE9;
    ORA.W #$0100                                                         ;A98BEC;
    STA.W Enemy.properties,X                                             ;A98BEF;

  .lessThanF4:
    PLA                                                                  ;A98BF2;
    SEC                                                                  ;A98BF3;
    SBC.W #$0038                                                         ;A98BF4;
    CMP.W #$00C4                                                         ;A98BF7;
    STA.W Enemy[1].YPosition                                             ;A98BFA;
    BPL .greaterThanEqualToC4                                            ;A98BFD;
    JMP.W HandleFallingTubeSmoke                                         ;A98BFF;

  .greaterThanEqualToC4:
    JSR.W MotherBrainPalette_EndScreenFlashing                           ;A98C02;
    LDA.W #$0019                                                         ;A98C05;
    JSL.L EnableEarthquakeTypeInAFor20Frames                             ;A98C08;
    STZ.W HDMAObject_ChannelBitflags                                     ;A98C0C;
    STZ.W HDMAObject_ChannelBitflags+2                                   ;A98C0F;
    STZ.W MotherBrainBody.ZebetitesPaletteAnimationIndex,X               ;A98C12;
    LDA.W #$00C4                                                         ;A98C15;
    STA.W Enemy[1].YPosition                                             ;A98C18;
    LDA.W #$003B                                                         ;A98C1B;
    STA.W Enemy.XPosition                                                ;A98C1E;
    LDA.W #$0117                                                         ;A98C21;
    STA.W Enemy.YPosition                                                ;A98C24;
    JSR.W SetupMotherBrainsNeckForFakeDeathAscent                        ;A98C27;
    LDA.W #Function_MotherBrainBody_FakeDeath_Ascent_DrawRoomBG_Rows2_3  ;A98C2A;
    STA.W MotherBrainBody.function                                       ;A98C2D;
    LDX.W EnemyIndex                                                     ;A98C30;
    JMP.W ExplodeMotherBrainTubes                                        ;A98C33;


;;; $8C36: Spawn falling tube smoke ;;;
SpawnFallingTubeSmoke:
    LDA.W #$0008                                                         ;A98C36;
    STA.W MotherBrainTubes.smokeTimer,X                                  ;A98C39;
    LDA.W MotherBrainTubes.smokeCounter,X                                ;A98C3C;
    INC                                                                  ;A98C3F;
    AND.W #$0003                                                         ;A98C40;
    STA.W MotherBrainTubes.smokeCounter,X                                ;A98C43;
    ASL                                                                  ;A98C46;
    TAY                                                                  ;A98C47;
    LDA.W .data,Y                                                        ;A98C48;
    CLC                                                                  ;A98C4B;
    ADC.W Enemy.XPosition,X                                              ;A98C4C;
    STA.B DP_Temp12                                                      ;A98C4F;
    LDA.W #$00D0                                                         ;A98C51;
    STA.B DP_Temp14                                                      ;A98C54;
    LDA.W #$0009                                                         ;A98C56;
    LDY.W #EnemyProjectile_MiscDust                                      ;A98C59;
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics                  ;A98C5C;
    RTS                                                                  ;A98C60;

  .data:
    dw $FFF8,$0002,$FFFC,$0006                                           ;A98C61;


;;; $8C69: Instruction list - Mother Brain tubes falling 0 ;;;
InstList_MotherBrainTubes_0:
    dw $0001,Spritemaps_MotherBrainTubes_0                               ;A98C69;
    dw Common_Instruction_Sleep                                          ;A98C6D;


;;; $8C6F: Instruction list - Mother Brain tubes falling 1 ;;;
InstList_MotherBrainTubes_1:
    dw $0001,Spritemaps_MotherBrainTubes_1                               ;A98C6F;
    dw Common_Instruction_Sleep                                          ;A98C73;


;;; $8C75: Instruction list - Mother Brain tubes falling 2 ;;;
InstList_MotherBrainTubes_2:
    dw $0001,Spritemaps_MotherBrainTubes_2                               ;A98C75;
    dw Common_Instruction_Sleep                                          ;A98C79;


;;; $8C7B: Instruction list - Mother Brain tubes falling 3 ;;;
InstList_MotherBrainTubes_3:
    dw $0001,Spritemaps_MotherBrainTubes_3                               ;A98C7B;
    dw Common_Instruction_Sleep                                          ;A98C7F;


;;; $8C81: Instruction list - Mother Brain tubes falling 4 ;;;
InstList_MotherBrainTubes_4:
    dw $0001,Spritemaps_MotherBrainTubes_4                               ;A98C81;
    dw Common_Instruction_Sleep                                          ;A98C85;


;;; $8C87: Mother Brain body function - fake death - ascent - draw room background on BG1 - rows 2/3 ;;;
Function_MotherBrainBody_FakeDeath_Ascent_DrawRoomBG_Rows2_3:
    JSL.L Spawn_Hardcoded_PLM                                            ;A98C87;
    db $02,$02                                                           ;A98C8B;
    dw PLMEntries_motherBrainsBackgroundRow2                             ;A98C8D;
    JSL.L Spawn_Hardcoded_PLM                                            ;A98C8F;
    db $02,$03                                                           ;A98C93;
    dw PLMEntries_motherBrainsBackgroundRow3                             ;A98C95;
    LDA.W #Function_MotherBrainBody_FakeDeath_Ascent_DrawRoomBG_Rows4_5  ;A98C97;
    STA.W MotherBrainBody.function                                       ;A98C9A;
    RTS                                                                  ;A98C9D;


;;; $8C9E: Mother Brain body function - fake death - ascent - draw room background on BG1 - rows 4/5 ;;;
Function_MotherBrainBody_FakeDeath_Ascent_DrawRoomBG_Rows4_5:
    JSL.L Spawn_Hardcoded_PLM                                            ;A98C9E;
    db $02,$04                                                           ;A98CA2;
    dw PLMEntries_motherBrainsBackgroundRow4                             ;A98CA4;
    JSL.L Spawn_Hardcoded_PLM                                            ;A98CA6;
    db $02,$05                                                           ;A98CAA;
    dw PLMEntries_motherBrainsBackgroundRow5                             ;A98CAC;
    LDA.W #Function_MotherBrainBody_FakeDeath_Ascent_DrawRoomBG_Rows6_7  ;A98CAE;
    STA.W MotherBrainBody.function                                       ;A98CB1;
    RTS                                                                  ;A98CB4;


;;; $8CB5: Mother Brain body function - fake death - ascent - draw room background on BG1 - rows 6/7 ;;;
Function_MotherBrainBody_FakeDeath_Ascent_DrawRoomBG_Rows6_7:
    JSL.L Spawn_Hardcoded_PLM                                            ;A98CB5;
    db $02,$06                                                           ;A98CB9;
    dw PLMEntries_motherBrainsBackgroundRow6                             ;A98CBB;
    JSL.L Spawn_Hardcoded_PLM                                            ;A98CBD;
    db $02,$07                                                           ;A98CC1;
    dw PLMEntries_motherBrainsBackgroundRow7                             ;A98CC3;
    LDA.W #Function_MotherBrainBody_FakeDeath_Ascent_DrawRoomBG_Rows8_9  ;A98CC5;
    STA.W MotherBrainBody.function                                       ;A98CC8;
    RTS                                                                  ;A98CCB;


;;; $8CCC: Mother Brain body function - fake death - ascent - draw room background on BG1 - rows 8/9 ;;;
Function_MotherBrainBody_FakeDeath_Ascent_DrawRoomBG_Rows8_9:
    JSL.L Spawn_Hardcoded_PLM                                            ;A98CCC;
    db $02,$08                                                           ;A98CD0;
    dw PLMEntries_motherBrainsBackgroundRow8                             ;A98CD2;
    JSL.L Spawn_Hardcoded_PLM                                            ;A98CD4;
    db $02,$09                                                           ;A98CD8;
    dw PLMEntries_motherBrainsBackgroundRow9                             ;A98CDA;
    LDA.W #Function_MotherBrainBody_FakeDeath_Ascent_DrawRoomBG_RowsA_B  ;A98CDC;
    STA.W MotherBrainBody.function                                       ;A98CDF;
    RTS                                                                  ;A98CE2;


;;; $8CE3: Mother Brain body function - fake death - ascent - draw room background on BG1 - rows Ah/Bh ;;;
Function_MotherBrainBody_FakeDeath_Ascent_DrawRoomBG_RowsA_B:
    JSL.L Spawn_Hardcoded_PLM                                            ;A98CE3;
    db $02,$0A                                                           ;A98CE7;
    dw PLMEntries_motherBrainsBackgroundRowA                             ;A98CE9;
    JSL.L Spawn_Hardcoded_PLM                                            ;A98CEB;
    db $02,$0B                                                           ;A98CEF;
    dw PLMEntries_motherBrainsBackgroundRowB                             ;A98CF1;
    LDA.W #Function_MotherBrainBody_FakeDeath_Ascent_DrawRoomBG_RowsC_D  ;A98CF3;
    STA.W MotherBrainBody.function                                       ;A98CF6;
    RTS                                                                  ;A98CF9;


;;; $8CFA: Mother Brain body function - fake death - ascent - draw room background on BG1 - rows Ch/Dh ;;;
Function_MotherBrainBody_FakeDeath_Ascent_DrawRoomBG_RowsC_D:
    JSL.L Spawn_Hardcoded_PLM                                            ;A98CFA;
    db $02,$0C                                                           ;A98CFE;
    dw PLMEntries_motherBrainsBackgroundRowC                             ;A98D00;
    JSL.L Spawn_Hardcoded_PLM                                            ;A98D02;
    db $02,$0D                                                           ;A98D06;
    dw PLMEntries_motherBrainsBackgroundRowD                             ;A98D08;
    LDA.W #Function_MotherBrainBody_FakeDeath_Ascent_SetupMBPhase2GFX    ;A98D0A;
    STA.W MotherBrainBody.function                                       ;A98D0D;
    RTS                                                                  ;A98D10;


;;; $8D11: Mother Brain body function - fake death - ascent - set up Mother Brain phase 2 graphics ;;;
Function_MotherBrainBody_FakeDeath_Ascent_SetupMBPhase2GFX:
    LDA.W #$0101                                                         ;A98D11;
    STA.W Layer2ScrollX                                                  ;A98D14;
    LDA.B DP_BG2TilemapAddrSize                                          ;A98D17;
    AND.W #$FFFC                                                         ;A98D19;
    STA.B DP_BG2TilemapAddrSize                                          ;A98D1C;
    LDY.W #Palette_MotherBrain_Attacks+2                                 ;A98D1E;
    LDX.W #$0142                                                         ;A98D21;
    LDA.W #$000F                                                         ;A98D24;
    JSL.L WriteAColorsFromYtoColorIndexX                                 ;A98D27;
    LDY.W #Palette_MotherBrain_BackLeg+2                                 ;A98D2B;
    LDX.W #$0162                                                         ;A98D2E;
    LDA.W #$000F                                                         ;A98D31;
    JSL.L WriteAColorsFromYtoColorIndexX                                 ;A98D34;
    LDA.W #Function_MotherBrainBody_FakeDeath_Ascent_SetupMBPhase2Brain  ;A98D38;
    STA.W MotherBrainBody.function                                       ;A98D3B;
    LDA.W #$0001                                                         ;A98D3E;
    STA.W RequestEnemyBG2TilemapTransferFlag                             ;A98D41;
    STA.L MotherBrainBody.enableUnpauseHookFlag                          ;A98D44;
    RTS                                                                  ;A98D48;


;;; $8D49: Mother Brain body function - fake death - ascent - set up Mother Brain phase 2 brain ;;;
Function_MotherBrainBody_FakeDeath_Ascent_SetupMBPhase2Brain:
    LDA.W #$0034                                                         ;A98D49;
    STA.W LayerBlending_DefaultConfig                                    ;A98D4C;
    LDA.W #Function_MotherBrain_SetupBrainAndNeckToBeDrawn               ;A98D4F;
    STA.W MotherBrainBody.brainFunction                                  ;A98D52;
    LDA.W Enemy.properties                                               ;A98D55;
    AND.W #$FBFF                                                         ;A98D58;
    STA.W Enemy.properties                                               ;A98D5B;
    LDA.W Enemy[1].properties                                            ;A98D5E;
    AND.W #$FBFF                                                         ;A98D61;
    STA.W Enemy[1].properties                                            ;A98D64;
    LDA.W #$4650                                                         ;A98D67;
    STA.W Enemy[1].health                                                ;A98D6A;
    LDA.W #Function_MotherBrainBody_FakeDeath_Ascent_PauseForSuspense    ;A98D6D;
    STA.W MotherBrainBody.function                                       ;A98D70;
    LDA.W #$0080                                                         ;A98D73;
    STA.W MotherBrainBody.functionTimer                                  ;A98D76; fallthrough to Function_MotherBrainBody_FakeDeath_Ascent_PauseForSuspense


;;; $8D79: Mother Brain body function - fake death - ascent - pause for suspense ;;;
Function_MotherBrainBody_FakeDeath_Ascent_PauseForSuspense:
    DEC.W MotherBrainBody.functionTimer                                  ;A98D79;
    BMI .timerExpired                                                    ;A98D7C;
    RTS                                                                  ;A98D7E;

  .timerExpired:
    LDA.W #Function_MotherBrainBody_FakeDeath_Ascent_PrepareMBForRising  ;A98D7F;
    STA.W MotherBrainBody.function                                       ;A98D82;
    LDA.W #$0020                                                         ;A98D85;
    STA.W MotherBrainBody.functionTimer                                  ;A98D88; fallthrough to Function_MotherBrainBody_FakeDeath_Ascent_PrepareMBForRising


;;; $8D8B: Mother Brain body function - fake death - ascent - prepare Mother Brain for rising ;;;
Function_MotherBrainBody_FakeDeath_Ascent_PrepareMBForRising:
    DEC.W MotherBrainBody.functionTimer                                  ;A98D8B;
    BMI .timerExpired                                                    ;A98D8E;
    RTS                                                                  ;A98D90;

  .timerExpired:
    JSL.L Spawn_MotherBrainRising_HDMAObject                             ;A98D91;
    STA.L MotherBrainBody.HDMAObjectIndex                                ;A98D95;
    LDA.W Enemy[1].properties                                            ;A98D99;
    ORA.W #$0100                                                         ;A98D9C;
    STA.W Enemy[1].properties                                            ;A98D9F;
    LDA.W #InstList_MotherBrainHead_Initial                              ;A98DA2;
    JSR.W SetMotherBrainHeadInstList                                     ;A98DA5;
    LDA.W #Function_MotherBrainBody_FakeDeath_Ascent_LoadMBLegTiles      ;A98DA8;
    STA.W MotherBrainBody.function                                       ;A98DAB;
    LDA.W #$0100                                                         ;A98DAE;
    STA.W MotherBrainBody.functionTimer                                  ;A98DB1; fallthrough to Function_MotherBrainBody_FakeDeath_Ascent_LoadMBLegTiles


;;; $8DB4: Mother Brain body function - fake death - ascent - load Mother Brain's legs tiles ;;;
Function_MotherBrainBody_FakeDeath_Ascent_LoadMBLegTiles:
    LDX.W #MotherBrainFightSpriteTileTransferEntries_legs                ;A98DB4;
    JSR.W ProcessSpriteTilesTransfers                                    ;A98DB7;
    BCS .finishedLoading                                                 ;A98DBA;
    RTS                                                                  ;A98DBC;

  .finishedLoading:
    LDA.W #Function_MotherBrainBody_FakeDeath_Ascent_ContinuePausing     ;A98DBD;
    STA.W MotherBrainBody.function                                       ;A98DC0; fallthrough to Function_MotherBrainBody_FakeDeath_Ascent_ContinuePausing


;;; $8DC3: Mother Brain body function - fake death - ascent - continue pausing for suspense ;;;
Function_MotherBrainBody_FakeDeath_Ascent_ContinuePausing:
    DEC.W MotherBrainBody.functionTimer                                  ;A98DC3;
    BPL .return                                                          ;A98DC6;
    LDA.W #$003B                                                         ;A98DC8;
    STA.W Enemy.XPosition                                                ;A98DCB;
    LDA.W #$0117                                                         ;A98DCE;
    STA.W Enemy.YPosition                                                ;A98DD1;
    LDA.W #$FFE5                                                         ;A98DD4;
    STA.B DP_BG2XScroll                                                  ;A98DD7;
    LDA.W #$FF27                                                         ;A98DD9;
    STA.B DP_BG2YScroll                                                  ;A98DDC;
    LDA.W #$0007                                                         ;A98DDE;
    STA.L MotherBrainBody.hitboxesEnabled                                ;A98DE1;
    LDA.W #Function_MotherBrainBody_FakeDeath_Ascent_StartMusic_Quake    ;A98DE5;
    STA.W MotherBrainBody.function                                       ;A98DE8;

  .return:
    RTS                                                                  ;A98DEB;


;;; $8DEC: Mother Brain body function - fake death - ascent - start music and earthquake ;;;
Function_MotherBrainBody_FakeDeath_Ascent_StartMusic_Quake:
    LDA.W #InstList_MotherBrainBody_Crouched                             ;A98DEC;
    JSR.W SetMotherBrainBodyInstList                                     ;A98DEF;
    LDA.W #$0001                                                         ;A98DF2;
    STA.W Enemy[1].instTimer                                             ;A98DF5;
    LDA.W Enemy.properties                                               ;A98DF8;
    AND.W #$FEFF                                                         ;A98DFB;
    STA.W Enemy.properties                                               ;A98DFE;
    LDA.W #$003B                                                         ;A98E01;
    STA.W Enemy.XPosition                                                ;A98E04;
    LDA.W #$0117                                                         ;A98E07;
    STA.W Enemy.YPosition                                                ;A98E0A;
    LDA.W #$FFE5                                                         ;A98E0D;
    STA.B DP_BG2XScroll                                                  ;A98E10;
    LDA.W #$FF27                                                         ;A98E12;
    STA.B DP_BG2YScroll                                                  ;A98E15;
    LDA.W #$0005                                                         ;A98E17;
    JSL.L QueueMusicDataOrTrack_8FrameDelay                              ;A98E1A;
    LDA.W #$0002                                                         ;A98E1E;
    STA.W EarthquakeType                                                 ;A98E21;
    LDA.W #$0100                                                         ;A98E24;
    STA.W EarthquakeTimer                                                ;A98E27;
    LDA.W #$0050                                                         ;A98E2A;
    STA.L MotherBrainBody.neckAngleDelta                                 ;A98E2D;
    LDA.W #$0001                                                         ;A98E31;
    STA.L MotherBrainBody.enableNeckMovementFlag                         ;A98E34;
    LDA.W #$0008                                                         ;A98E38;
    STA.L MotherBrainBody.lowerNeckMovementIndex                         ;A98E3B;
    LDA.W #$0006                                                         ;A98E3F;
    STA.L MotherBrainBody.upperNeckMovementIndex                         ;A98E42;
    LDA.W #Function_MotherBrainBody_FakeDeath_Ascent_RaiseMotherBrain    ;A98E46;
    STA.W MotherBrainBody.function                                       ;A98E49;
    RTS                                                                  ;A98E4C;


;;; $8E4D: Mother Brain body function - fake death - ascent - raise Mother Brain ;;;
Function_MotherBrainBody_FakeDeath_Ascent_RaiseMotherBrain:
    LDA.W NMI_FrameCounter                                               ;A98E4D;
    AND.W #$0003                                                         ;A98E50;
    BNE Function_MBBody_FakeDeath_Ascent_WaitForMBUncrouch_return        ;A98E53;
    JSR.W SpawnDustCloudsForMotherBrainsAscent                           ;A98E55;
    LDA.W #$0002                                                         ;A98E58;
    STA.B DP_Temp12                                                      ;A98E5B;
    LDA.B DP_BG2YScroll                                                  ;A98E5D;
    CLC                                                                  ;A98E5F;
    ADC.B DP_Temp12                                                      ;A98E60;
    STA.B DP_BG2YScroll                                                  ;A98E62;
    LDA.W Enemy.YPosition                                                ;A98E64;
    SEC                                                                  ;A98E67;
    SBC.B DP_Temp12                                                      ;A98E68;
    STA.W Enemy.YPosition                                                ;A98E6A;
    CMP.W #$00BD                                                         ;A98E6D;
    BCS Function_MBBody_FakeDeath_Ascent_WaitForMBUncrouch_return        ;A98E70;
    LDA.W #$0140                                                         ;A98E72;
    STA.W EnemyBG2TilemapSize                                            ;A98E75;
    LDA.W #$00BC                                                         ;A98E78;
    STA.W Enemy.YPosition                                                ;A98E7B;
    STZ.W EarthquakeTimer                                                ;A98E7E;
    LDA.L MotherBrainBody.HDMAObjectIndex                                ;A98E81;
    TAX                                                                  ;A98E85;
    STZ.W HDMAObject_ChannelBitflags,X                                   ;A98E86;
    LDA.W #InstList_MotherBrainBody_StandingUpAfterCrouching_Slow        ;A98E89;
    JSR.W SetMotherBrainBodyInstList                                     ;A98E8C;
    LDA.W #Function_MBBody_FakeDeath_Ascent_WaitForMBUncrouch            ;A98E8F;
    STA.W MotherBrainBody.function                                       ;A98E92; fallthrough to Function_MotherBrainBody_FakeDeath_Ascent_WaitForMBUncrouch


;;; $8E95: Mother Brain body function - fake death - ascent - wait until Mother Brain has finished uncrouching ;;;
Function_MBBody_FakeDeath_Ascent_WaitForMBUncrouch:
    LDA.L MotherBrainBody.pose                                           ;A98E95;
    BEQ Function_MBBody_FakeDeath_Ascent_WaitForMBUncrouch_standing      ;A98E99;

  .return:
    RTS                                                                  ;A98E9B;


;;; $8EAA: Mother Brain body function - fake death - ascent - transition Mother Brain from grey and lower her head ;;;
Function_MBBody_FakeDeath_Ascent_WaitForMBUncrouch_standing:
    STA.L MotherBrainBody.greyTransitionCounter                          ;A98E9C;
    LDA.W #Function_MBBody_FakeDeath_Ascent_TransitionFromGreyLowerHead  ;A98EA0;
    STA.W MotherBrainBody.function                                       ;A98EA3;
    STZ.W MotherBrainBody.functionTimer                                  ;A98EA6;
    RTS                                                                  ;A98EA9;


;;; $8EAA: Mother Brain body function - fake death - ascent - transition Mother Brain from grey and lower her head ;;;
Function_MBBody_FakeDeath_Ascent_TransitionFromGreyLowerHead:
    DEC.W MotherBrainBody.functionTimer                                  ;A98EAA;
    BPL .return                                                          ;A98EAD;
    LDA.W #$0004                                                         ;A98EAF;
    STA.W MotherBrainBody.functionTimer                                  ;A98EB2;
    LDA.L MotherBrainBody.greyTransitionCounter                          ;A98EB5;
    INC                                                                  ;A98EB9;
    STA.L MotherBrainBody.greyTransitionCounter                          ;A98EBA;
    DEC                                                                  ;A98EBE;
    JSL.L TransitionMotherBrainPaletteFromGrey_FakeDeath                 ;A98EBF;
    BCC .return                                                          ;A98EC3;
    LDA.W #$0001                                                         ;A98EC5;
    STA.L MotherBrainBody.enableBrainPaletteHandlingFlag                 ;A98EC8;
    INC                                                                  ;A98ECC;
    STA.L MotherBrainBody.form                                           ;A98ECD;
    DEC                                                                  ;A98ED1;
    STA.L MotherBrainBody.enableDroolGenerationFlag                      ;A98ED2;
    LDA.W #$0006                                                         ;A98ED6;
    STA.L MotherBrainBody.lowerNeckMovementIndex                         ;A98ED9;
    STA.L MotherBrainBody.upperNeckMovementIndex                         ;A98EDD;
    LDA.W #$0500                                                         ;A98EE1;
    STA.L MotherBrainBody.neckAngleDelta                                 ;A98EE4;
    LDA.W #Function_MotherBrainBody_Phase2_Stretching_ShakeHeadMenacing  ;A98EE8;
    STA.W MotherBrainBody.function                                       ;A98EEB;
    LDA.W #$0017                                                         ;A98EEE;
    STA.W MotherBrainBody.functionTimer                                  ;A98EF1;

  .return:
    RTS                                                                  ;A98EF4;


;;; $8EF5: Mother Brain body function - second phase - stretching - shake head menacingly ;;;
Function_MotherBrainBody_Phase2_Stretching_ShakeHeadMenacing:
    DEC.W MotherBrainBody.functionTimer                                  ;A98EF5;
    BMI .timerExpired                                                    ;A98EF8;
    RTS                                                                  ;A98EFA;

  .timerExpired:
    LDA.W #InstList_MotherBrainHead_Stretching_Phase2_0                  ;A98EFB;
    JSR.W SetMotherBrainHeadInstList                                     ;A98EFE;
    LDA.W #Function_MotherBrainBody_Phase2_Stretching_BringHeadBackUp    ;A98F01;
    STA.W MotherBrainBody.function                                       ;A98F04;
    LDA.W #$0040                                                         ;A98F07;
    STA.L MotherBrainBody.neckAngleDelta                                 ;A98F0A;
    LDA.W #$0100                                                         ;A98F0E;
    STA.W MotherBrainBody.functionTimer                                  ;A98F11; fallthrough to Function_MotherBrainBody_Phase2_Stretching_BringHeadBackUp


;;; $8F14: Mother Brain body function - second phase - stretching - bring head back up ;;;
Function_MotherBrainBody_Phase2_Stretching_BringHeadBackUp:
    DEC.W MotherBrainBody.functionTimer                                  ;A98F14;
    BPL Function_MotherBrainBody_Phase2_Stretching_FinishStretching_return ;A98F17;
    LDA.W #$0002                                                         ;A98F19;
    STA.L MotherBrainBody.lowerNeckMovementIndex                         ;A98F1C;
    LDA.W #$0004                                                         ;A98F20;
    STA.L MotherBrainBody.upperNeckMovementIndex                         ;A98F23;
    LDA.W #Function_MotherBrainBody_Phase2_Stretching_FinishStretching   ;A98F27;
    STA.W MotherBrainBody.function                                       ;A98F2A;
    LDA.W #$0040                                                         ;A98F2D;
    STA.W MotherBrainBody.functionTimer                                  ;A98F30; fallthrough to Function_MotherBrainBody_Phase2_Stretching_FinishStretching


;;; $8F33: Mother Brain body function - second phase - stretching - finish stretching ;;;
Function_MotherBrainBody_Phase2_Stretching_FinishStretching:
    DEC.W MotherBrainBody.functionTimer                                  ;A98F33;
    BPL .return                                                          ;A98F36;
    LDA.W #$0001                                                         ;A98F38;
    STA.L MotherBrainBody.smallPurpleBreathGenerationEnabledFlag         ;A98F3B;
    LDA.W #Function_MotherBrainBody_Phase2_Thinking                      ;A98F3F;
    STA.W MotherBrainBody.function                                       ;A98F42;

  .return:
    RTS                                                                  ;A98F45;


;;; $8F46: Spawn dust clouds for Mother Brain's ascent ;;;
SpawnDustCloudsForMotherBrainsAscent:
    DEC.W MotherBrainBody.bodySubFunctionTimer                           ;A98F46;
    BPL .timerNotExpired                                                 ;A98F49;
    LDA.W #$0007                                                         ;A98F4B;
    STA.W MotherBrainBody.bodySubFunctionTimer                           ;A98F4E;

  .timerNotExpired:
    LDA.W MotherBrainBody.bodySubFunctionTimer                           ;A98F51;
    ASL                                                                  ;A98F54;
    TAX                                                                  ;A98F55;
    LDA.W .XPositions,X                                                  ;A98F56;
    STA.B DP_Temp12                                                      ;A98F59;
    LDA.W #$00D4                                                         ;A98F5B;
    STA.B DP_Temp14                                                      ;A98F5E;
    LDA.W RandomNumberSeed                                               ;A98F60;
    AND.W #$0100                                                         ;A98F63;
    XBA                                                                  ;A98F66;
    TAX                                                                  ;A98F67;
    LDA.W .explosionType,X                                               ;A98F68;
    AND.W #$00FF                                                         ;A98F6B;
    LDY.W #EnemyProjectile_MiscDust                                      ;A98F6E;
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics                  ;A98F71;
    LDA.W #$0029                                                         ;A98F75;
    JSL.L QueueSound_Lib2_Max3                                           ;A98F78;
    RTS                                                                  ;A98F7C;

  .explosionType:
; Explosion type. 9 = small dust cloud, Ch = smoke
    db $09,$12                                                           ;A98F7D;

  .XPositions:
; Explosion X positions
    dw $003D,$0054,$0020,$0035,$005A,$0043,$0067,$0029                   ;A98F7F;


;;; $8F8F: Mother Brain fight sprite tile transfer entries ;;;
MotherBrainFightSpriteTileTransferEntries:
; Size
; Source address
; VRAM address
; Zero terminator
  .legs:
; Mother Brain's legs
    dw $0200                                                             ;A98F8F;
    dl Tiles_MotherBrainLegs
    dw $7400

    dw $0200
    dl Tiles_MotherBrainLegs+$200
    dw $7500

    dw $0200
    dl Tiles_MotherBrainLegs+$400
    dw $7600

    dw $0200
    dl Tiles_MotherBrainLegs+$600
    dw $7700

    dw $0200
    dl Tiles_MotherBrainLegs+$800
    dw $7800

    dw $0200
    dl Tiles_MotherBrainLegs+$A00
    dw $7900

    dw $0200
    dl Tiles_MotherBrainLegs+$C00
    dw $7A00

    dw $0200
    dl Tiles_MotherBrainLegs+$E00
    dw $7B00

  .attacks:
; Bomb shells, death beam, unused graphics
    dw $0200                                                             ;A98FC7;
    dl Tiles_MotherBrain_BombShells_DeathBeam_UnusedGFX
    dw $7C00

    dw $0200
    dl Tiles_MotherBrain_BombShells_DeathBeam_UnusedGFX+$200
    dw $7D00

    dw $0200
    dl Tiles_MotherBrain_BombShells_DeathBeam_UnusedGFX+$400
    dw $7E00

    dw $0200
    dl Tiles_MotherBrain_BombShells_DeathBeam_UnusedGFX+$600
    dw $7F00

    dw $0000

  .babyMetroid:
; Baby Metroid
    dw $0200                                                             ;A98FE5;
    dl Tiles_BabyMetroid+$400
    dw $7C00

    dw $0200
    dl Tiles_BabyMetroid+$600
    dw $7D00

    dw $0200
    dl Tiles_BabyMetroid+$800
    dw $7E00

    dw $0200
    dl Tiles_BabyMetroid+$A00
    dw $7F00

    dw $0000

  .corpse:
; Mother Brain's corpse
    dw $01C0                                                             ;A99003;
    dl Tiles_CorpseMotherBrain
    dw $7A00

    dw $01C0
    dl Tiles_CorpseMotherBrain+$200
    dw $7B00

    dw $01C0
    dl Tiles_CorpseMotherBrain+$400
    dw $7C00

    dw $01C0
    dl Tiles_CorpseMotherBrain+$600
    dw $7D00

    dw $01C0
    dl Tiles_CorpseMotherBrain+$800
    dw $7E00

    dw $01C0
    dl Tiles_CorpseMotherBrain+$A00
    dw $7F00

    dw $0000

  .explodedDoor:
; Exploded escape door particles
    dw $0200                                                             ;A9902F;
    dl Tiles_MotherBrainExplodedEscapeDoorParticles
    dw $7000

    dw $0200
    dl Tiles_MotherBrainExplodedEscapeDoorParticles+$200
    dw $7100

    dw $0000


;;; $903F: Set up Mother Brain's neck for fake death ascent ;;;
SetupMotherBrainsNeckForFakeDeathAscent:
    LDA.W #$0002                                                         ;A9903F;
    STA.L MotherBrainBody.neckSegment0Distance                           ;A99042;
    LDA.W #$000A                                                         ;A99046;
    STA.L MotherBrainBody.neckSegment1Distance                           ;A99049;
    STA.L MotherBrainBody.neckSegment3Distance                           ;A9904D;
    LDA.W #$0014                                                         ;A99051;
    STA.L MotherBrainBody.neckSegment2Distance                           ;A99054;
    STA.L MotherBrainBody.neckSegment4Distance                           ;A99058;
    LDA.W #$4800                                                         ;A9905C;
    STA.L MotherBrainBody.lowerNeckAngle                                 ;A9905F;
    LDA.W #$5000                                                         ;A99063;
    STA.L MotherBrainBody.upperNeckAngle                                 ;A99066;
    LDA.W #$0100                                                         ;A9906A;
    STA.L MotherBrainBody.neckAngleDelta                                 ;A9906D;
    RTS                                                                  ;A99071;


;;; $9072: Handle Mother Brain's neck - lower ;;;
HandleMotherBrainsNeck_Lower:
    LDA.L MotherBrainBody.lowerNeckMovementIndex                         ;A99072;
    TAX                                                                  ;A99076;
    JMP.W (.pointers,X)                                                  ;A99077;

  .pointers:
    dw RTS_A99084                                                        ;A9907A;
    dw HandleMotherBrainsNeck_Lower_2_BobDown                            ;A9907C;
    dw HandleMotherBrainsNeck_Lower_4_BobUp                              ;A9907E;
    dw HandleMotherBrainsNeck_Lower_6_Lower                              ;A99080;
    dw HandleMotherBrainsNeck_Lower_8_Raise                              ;A99082;


;;; $9084: RTS. Handle Mother Brain's neck - lower - movement index = 0: nothing ;;;
RTS_A99084:
    RTS                                                                  ;A99084;


;;; $9085: Handle Mother Brain's neck - lower - movement index = 2: bob down ;;;
HandleMotherBrainsNeck_Lower_2_BobDown:
    LDA.L MotherBrainBody.lowerNeckAngle                                 ;A99085;
    SEC                                                                  ;A99089;
    SBC.L MotherBrainBody.neckAngleDelta                                 ;A9908A;
    CMP.W #$2800                                                         ;A9908E;
    BCS +                                                                ;A99091;
    LDA.W #$0004                                                         ;A99093;
    STA.L MotherBrainBody.lowerNeckMovementIndex                         ;A99096;
    LDA.W #$2800                                                         ;A9909A;

+   STA.L MotherBrainBody.lowerNeckAngle                                 ;A9909D;
    RTS                                                                  ;A990A1;


;;; $90A2: Handle Mother Brain's neck - lower - movement index = 4: bob up ;;;
HandleMotherBrainsNeck_Lower_4_BobUp:
    LDA.W Enemy[1].YPosition                                             ;A990A2;
    CMP.W #$003C                                                         ;A990A5;
    BMI .bobDown                                                         ;A990A8;
    LDA.L MotherBrainBody.lowerNeckAngle                                 ;A990AA;
    CLC                                                                  ;A990AE;
    ADC.L MotherBrainBody.neckAngleDelta                                 ;A990AF;
    CMP.W #$9000                                                         ;A990B3;
    BCC +                                                                ;A990B6;
    LDA.W #$0002                                                         ;A990B8;
    STA.L MotherBrainBody.lowerNeckMovementIndex                         ;A990BB;
    LDA.W #$9000                                                         ;A990BF;

+   STA.L MotherBrainBody.lowerNeckAngle                                 ;A990C2;
    RTS                                                                  ;A990C6;

  .bobDown:
    LDA.W #$0002                                                         ;A990C7;
    STA.L MotherBrainBody.lowerNeckMovementIndex                         ;A990CA;
    RTS                                                                  ;A990CE;


;;; $90CF: Handle Mother Brain's neck - lower - movement index = 6: lower ;;;
HandleMotherBrainsNeck_Lower_6_Lower:
    LDA.L MotherBrainBody.lowerNeckAngle                                 ;A990CF;
    SEC                                                                  ;A990D3;
    SBC.L MotherBrainBody.neckAngleDelta                                 ;A990D4;
    CMP.W #$3000                                                         ;A990D8;
    BCS +                                                                ;A990DB;
    LDA.W #$0000                                                         ;A990DD;
    STA.L MotherBrainBody.lowerNeckMovementIndex                         ;A990E0;
    LDA.W #$3000                                                         ;A990E4;

+   STA.L MotherBrainBody.lowerNeckAngle                                 ;A990E7;
    RTS                                                                  ;A990EB;


;;; $90EC: Handle Mother Brain's neck - lower - movement index = 8: raise ;;;
HandleMotherBrainsNeck_Lower_8_Raise:
    LDA.L MotherBrainBody.lowerNeckAngle                                 ;A990EC;
    CLC                                                                  ;A990F0;
    ADC.L MotherBrainBody.neckAngleDelta                                 ;A990F1;
    CMP.W #$9000                                                         ;A990F5;
    BCC +                                                                ;A990F8;
    LDA.W #$0000                                                         ;A990FA;
    STA.L MotherBrainBody.lowerNeckMovementIndex                         ;A990FD;
    LDA.W #$9000                                                         ;A99101;

+   STA.L MotherBrainBody.lowerNeckAngle                                 ;A99104;
    RTS                                                                  ;A99108;


;;; $9109: Handle Mother Brain's neck - upper ;;;
HandleMotherBrainsNeck_Upper:
    LDA.L MotherBrainBody.upperNeckMovementIndex                         ;A99109;
    TAX                                                                  ;A9910D;
    JMP.W (.pointers,X)                                                  ;A9910E;

  .pointers:
    dw RTS_A9911B                                                        ;A99111;
    dw HandleMotherBrainsNeck_Upper_3_BobDown                            ;A99113;
    dw HandleMotherBrainsNeck_Upper_4_BobUp                              ;A99115;
    dw HandleMotherBrainsNeck_Upper_6_Lower                              ;A99117;
    dw HandleMotherBrainsNeck_Upper_8_Raise                              ;A99119;


;;; $911B: RTS. Handle Mother Brain's neck - upper - movement index = 0: nothing ;;;
RTS_A9911B:
    RTS                                                                  ;A9911B;


;;; $911C: Handle Mother Brain's neck - upper - movement index = 2: bob down ;;;
HandleMotherBrainsNeck_Upper_3_BobDown:
    LDA.W Enemy[1].YPosition                                             ;A9911C;
    CLC                                                                  ;A9911F;
    ADC.W #$0004                                                         ;A99120;
    CMP.W SamusYPosition                                                 ;A99123;
    BMI +                                                                ;A99126;
    LDA.W #$0004                                                         ;A99128;
    STA.L MotherBrainBody.lowerNeckMovementIndex                         ;A9912B;
    STA.L MotherBrainBody.upperNeckMovementIndex                         ;A9912F;
    RTS                                                                  ;A99133;

+   LDA.L MotherBrainBody.upperNeckAngle                                 ;A99134;
    SEC                                                                  ;A99138;
    SBC.L MotherBrainBody.neckAngleDelta                                 ;A99139;
    CMP.W #$2000                                                         ;A9913D;
    BCS +                                                                ;A99140;
    LDA.W #$0004                                                         ;A99142;
    STA.L MotherBrainBody.upperNeckMovementIndex                         ;A99145;
    LDA.W #$2000                                                         ;A99149;

+   STA.L MotherBrainBody.upperNeckAngle                                 ;A9914C;
    RTS                                                                  ;A99150;


;;; $9151: Handle Mother Brain's neck - upper - movement index = 4: bob up ;;;
HandleMotherBrainsNeck_Upper_4_BobUp:
    LDA.L MotherBrainBody.lowerNeckAngle                                 ;A99151;
    CLC                                                                  ;A99155;
    ADC.W #$0800                                                         ;A99156;
    STA.B DP_Temp12                                                      ;A99159;
    LDA.L MotherBrainBody.upperNeckAngle                                 ;A9915B;
    CLC                                                                  ;A9915F;
    ADC.L MotherBrainBody.neckAngleDelta                                 ;A99160;
    CMP.B DP_Temp12                                                      ;A99164;
    BCC +                                                                ;A99166;
    LDA.W #$0002                                                         ;A99168;
    STA.L MotherBrainBody.upperNeckMovementIndex                         ;A9916B;
    LDA.B DP_Temp12                                                      ;A9916F;

+   STA.L MotherBrainBody.upperNeckAngle                                 ;A99171;
    RTS                                                                  ;A99175;


;;; $9176: Handle Mother Brain's neck - upper - movement index = 6: lower ;;;
HandleMotherBrainsNeck_Upper_6_Lower:
    LDA.L MotherBrainBody.upperNeckAngle                                 ;A99176;
    SEC                                                                  ;A9917A;
    SBC.L MotherBrainBody.neckAngleDelta                                 ;A9917B;
    CMP.W #$2000                                                         ;A9917F;
    BCS +                                                                ;A99182;
    LDA.W #$0000                                                         ;A99184;
    STA.L MotherBrainBody.upperNeckMovementIndex                         ;A99187;
    LDA.W #$2000                                                         ;A9918B;

+   STA.L MotherBrainBody.upperNeckAngle                                 ;A9918E;
    RTS                                                                  ;A99192;


;;; $9193: Handle Mother Brain's neck - upper - movement index = 8: raise ;;;
HandleMotherBrainsNeck_Upper_8_Raise:
    LDA.L MotherBrainBody.lowerNeckAngle                                 ;A99193;
    CLC                                                                  ;A99197;
    ADC.W #$0800                                                         ;A99198;
    STA.B DP_Temp12                                                      ;A9919B;
    LDA.L MotherBrainBody.upperNeckAngle                                 ;A9919D;
    CLC                                                                  ;A991A1;
    ADC.L MotherBrainBody.neckAngleDelta                                 ;A991A2;
    CMP.B DP_Temp12                                                      ;A991A6;
    BCC +                                                                ;A991A8;
    LDA.W #$0000                                                         ;A991AA;
    STA.L MotherBrainBody.upperNeckMovementIndex                         ;A991AD;
    LDA.B DP_Temp12                                                      ;A991B1;

+   STA.L MotherBrainBody.upperNeckAngle                                 ;A991B3;
    RTS                                                                  ;A991B7;


;;; $91B8: Handle Mother Brain's neck ;;;
HandleMotherBrainsNeck:
; See https://patrickjohnston.org/ASM/ROM%20data/Super%20Metroid/MB%20reference%20point.png about $7E:7814/16
    LDA.W #$FFB0                                                         ;A991B8;
    CLC                                                                  ;A991BB;
    ADC.W Enemy.XPosition                                                ;A991BC;
    STA.L MotherBrainBody.XPosition                                      ;A991BF;
    LDA.W #$002E                                                         ;A991C3;
    CLC                                                                  ;A991C6;
    ADC.W Enemy.YPosition                                                ;A991C7;
    STA.L MotherBrainBody.YPosition                                      ;A991CA;
    LDA.L MotherBrainBody.enableNeckMovementFlag                         ;A991CE;
    BEQ .neckMovementDisabled                                            ;A991D2;
    JSR.W HandleMotherBrainsNeck_Lower                                   ;A991D4;
    JSR.W HandleMotherBrainsNeck_Upper                                   ;A991D7;

  .neckMovementDisabled:
    LDA.L MotherBrainBody.lowerNeckAngle+1                               ;A991DA;
    AND.W #$00FF                                                         ;A991DE;
    STA.B DP_Temp12                                                      ;A991E1;
    LDA.L MotherBrainBody.neckSegment0Distance                           ;A991E3;
    JSL.L GetSineMathInA_A9C460                                          ;A991E7;
    CLC                                                                  ;A991EB;
    ADC.L MotherBrainBody.XPosition                                      ;A991EC;
    CLC                                                                  ;A991F0;
    ADC.W #$0070                                                         ;A991F1;
    STA.L MotherBrainBody.neckSegment0XPosition                          ;A991F4;
    LDA.L MotherBrainBody.neckSegment0Distance                           ;A991F8;
    JSL.L GetCosineMathInA_A9C465                                        ;A991FC;
    CLC                                                                  ;A99200;
    ADC.L MotherBrainBody.YPosition                                      ;A99201;
    CLC                                                                  ;A99205;
    ADC.W #$FFA0                                                         ;A99206;
    STA.L MotherBrainBody.neckSegment0YPosition                          ;A99209;
    LDA.L MotherBrainBody.neckSegment1Distance                           ;A9920D;
    JSL.L GetSineMathInA_A9C460                                          ;A99211;
    CLC                                                                  ;A99215;
    ADC.L MotherBrainBody.XPosition                                      ;A99216;
    CLC                                                                  ;A9921A;
    ADC.W #$0070                                                         ;A9921B;
    STA.L MotherBrainBody.neckSegment1XPosition                          ;A9921E;
    LDA.L MotherBrainBody.neckSegment1Distance                           ;A99222;
    JSL.L GetCosineMathInA_A9C465                                        ;A99226;
    CLC                                                                  ;A9922A;
    ADC.L MotherBrainBody.YPosition                                      ;A9922B;
    CLC                                                                  ;A9922F;
    ADC.W #$FFA0                                                         ;A99230;
    STA.L MotherBrainBody.neckSegment1YPosition                          ;A99233;
    LDA.L MotherBrainBody.neckSegment2Distance                           ;A99237;
    JSL.L GetSineMathInA_A9C460                                          ;A9923B;
    CLC                                                                  ;A9923F;
    ADC.L MotherBrainBody.XPosition                                      ;A99240;
    CLC                                                                  ;A99244;
    ADC.W #$0070                                                         ;A99245;
    STA.L MotherBrainBody.neckSegment2XPosition                          ;A99248;
    LDA.L MotherBrainBody.neckSegment2Distance                           ;A9924C;
    JSL.L GetCosineMathInA_A9C465                                        ;A99250;
    CLC                                                                  ;A99254;
    ADC.L MotherBrainBody.YPosition                                      ;A99255;
    CLC                                                                  ;A99259;
    ADC.W #$FFA0                                                         ;A9925A;
    STA.L MotherBrainBody.neckSegment2YPosition                          ;A9925D;
    LDA.L MotherBrainBody.upperNeckAngle+1                               ;A99261;
    AND.W #$00FF                                                         ;A99265;
    STA.B DP_Temp12                                                      ;A99268;
    LDA.L MotherBrainBody.neckSegment3Distance                           ;A9926A;
    JSL.L GetSineMathInA_A9C460                                          ;A9926E;
    CLC                                                                  ;A99272;
    ADC.L MotherBrainBody.neckSegment2XPosition                          ;A99273;
    STA.L MotherBrainBody.neckSegment3XPosition                          ;A99277;
    LDA.L MotherBrainBody.neckSegment3Distance                           ;A9927B;
    JSL.L GetCosineMathInA_A9C465                                        ;A9927F;
    CLC                                                                  ;A99283;
    ADC.L MotherBrainBody.neckSegment2YPosition                          ;A99284;
    STA.L MotherBrainBody.neckSegment3YPosition                          ;A99288;
    LDA.L MotherBrainBody.neckSegment4Distance                           ;A9928C;
    JSL.L GetSineMathInA_A9C460                                          ;A99290;
    CLC                                                                  ;A99294;
    ADC.L MotherBrainBody.neckSegment2XPosition                          ;A99295;
    STA.L MotherBrainBody.neckSegment4XPosition                          ;A99299;
    LDA.L MotherBrainBody.neckSegment4Distance                           ;A9929D;
    JSL.L GetCosineMathInA_A9C465                                        ;A992A1;
    CLC                                                                  ;A992A5;
    ADC.L MotherBrainBody.neckSegment2YPosition                          ;A992A6;
    STA.L MotherBrainBody.neckSegment4YPosition                          ;A992AA;
    RTS                                                                  ;A992AE;


;;; $92AF: Y = Mother Brain brain spritemap pointer ;;;
GetMotherBrainHeadSpritemapPointerInY:
    LDA.W TimeIsFrozenFlag                                               ;A992AF;
    BNE .timeFrozen                                                      ;A992B2;
    LDA.L MotherBrainBody.brainInstListPointer                           ;A992B4;
    BMI .processInstList                                                 ;A992B8;

  .noDraw:
    PLA                                                                  ;A992BA;
    RTS                                                                  ;A992BB;

  .timeFrozen:
    LDA.L MotherBrainBody.brainInstListPointer                           ;A992BC;
    BPL .noDraw                                                          ;A992C0;
    TAX                                                                  ;A992C2;
    LDY.W $0002,X                                                        ;A992C3;
    RTS                                                                  ;A992C6;

  .processInstList:
    TAX                                                                  ;A992C7;
    LDA.W $0000,X                                                        ;A992C8;
    BMI .ASMInstruction                                                  ;A992CB;
    CMP.L MotherBrainBody.brainInstructionTimer                          ;A992CD;
    BPL .tick                                                            ;A992D1;
    INX                                                                  ;A992D3;
    INX                                                                  ;A992D4;
    INX                                                                  ;A992D5;
    INX                                                                  ;A992D6;

  .loop:
    LDA.W $0000,X                                                        ;A992D7;
    BPL .specialInstruction                                              ;A992DA;

  .ASMInstruction:
    STA.B DP_Temp00                                                      ;A992DC;
    INX                                                                  ;A992DE;
    INX                                                                  ;A992DF;
    PEA.W .loop-1                                                        ;A992E0;
    JMP.W (DP_Temp00)                                                    ;A992E3;

  .specialInstruction:
    LDA.W #$0001                                                         ;A992E6;
    STA.L MotherBrainBody.brainInstructionTimer                          ;A992E9;
    TXA                                                                  ;A992ED;
    STA.L MotherBrainBody.brainInstListPointer                           ;A992EE;
    LDY.W $0002,X                                                        ;A992F2;
    RTS                                                                  ;A992F5;

  .tick:
    LDA.L MotherBrainBody.brainInstructionTimer                          ;A992F6;
    INC                                                                  ;A992FA;
    STA.L MotherBrainBody.brainInstructionTimer                          ;A992FB;
    LDY.W $0002,X                                                        ;A992FF;
    RTS                                                                  ;A99302;


;;; $9303: Draw Mother Brain's neck ;;;
DrawMotherBrainsNeck:
    LDA.W Enemy.properties                                               ;A99303;
    AND.W #$0100                                                         ;A99306;
    BEQ .visible                                                         ;A99309;
    RTS                                                                  ;A9930B;

  .visible:
    LDA.L MotherBrainBody.neckSegment4XPosition                          ;A9930C;
    STA.B DP_Temp12                                                      ;A99310;
    LDA.L MotherBrainBody.neckSegment4YPosition                          ;A99312;
    STA.B DP_Temp14                                                      ;A99316;
    JSR.W DrawMotherBrainNeckSegment                                     ;A99318;
    LDA.L MotherBrainBody.neckSegment3XPosition                          ;A9931B;
    STA.B DP_Temp12                                                      ;A9931F;
    LDA.L MotherBrainBody.neckSegment3YPosition                          ;A99321;
    STA.B DP_Temp14                                                      ;A99325;
    JSR.W DrawMotherBrainNeckSegment                                     ;A99327;
    LDA.L MotherBrainBody.neckSegment2XPosition                          ;A9932A;
    STA.B DP_Temp12                                                      ;A9932E;
    LDA.L MotherBrainBody.neckSegment2YPosition                          ;A99330;
    STA.B DP_Temp14                                                      ;A99334;
    JSR.W DrawMotherBrainNeckSegment                                     ;A99336;
    LDA.L MotherBrainBody.neckSegment1XPosition                          ;A99339;
    STA.B DP_Temp12                                                      ;A9933D;
    LDA.L MotherBrainBody.neckSegment1YPosition                          ;A9933F;
    STA.B DP_Temp14                                                      ;A99343;
    JSR.W DrawMotherBrainNeckSegment                                     ;A99345;
    LDA.L MotherBrainBody.neckSegment0XPosition                          ;A99348;
    STA.B DP_Temp12                                                      ;A9934C;
    LDA.L MotherBrainBody.neckSegment0YPosition                          ;A9934E;
    STA.B DP_Temp14                                                      ;A99352;
    JMP.W DrawMotherBrainNeckSegment                                     ;A99354;


;;; $9357: Draw Mother Brain brain ;;;
DrawMotherBrainHead:
; Note that the call to GetMotherBrainHeadSpritemapPointerInY can return out of *this* routine if no spritemap is to be drawn,
; and is assuming that nothing gets pushed to the stack by this routine
; (and also assuming this routine returns by RTS)
    LDA.L MotherBrainBody.smallPurpleBreathGenerationEnabledFlag         ;A99357;
    BEQ .getSpritemap                                                    ;A9935B;
    LDA.L MotherBrainBody.smallPurpleBreathActiveFlag                    ;A9935D;
    BNE .getSpritemap                                                    ;A99361;
    LDA.W RandomNumberSeed                                               ;A99363;
    BMI .getSpritemap                                                    ;A99366;
    LDY.W #EnemyProjectile_MotherBrainPurpleBreath_Small                 ;A99368;
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics                  ;A9936B;

  .getSpritemap:
    JSR.W GetMotherBrainHeadSpritemapPointerInY                          ;A9936F;
    LDA.L MotherBrainBody.brainPalleteIndex                              ;A99372;
    TAX                                                                  ;A99376;
    LDA.W Enemy[1].flashTimer                                            ;A99377;
    LSR                                                                  ;A9937A;
    BCC .evenInvincibilityTimer                                          ;A9937B;
    LDX.W #$0000                                                         ;A9937D;

  .evenInvincibilityTimer:
    STX.B DP_Temp16                                                      ;A99380;
    LDA.L MotherBrainBody.brainMainShakeTimer                            ;A99382;
    BEQ .nonZeroShakeTimer                                               ;A99386;
    DEC                                                                  ;A99388;
    STA.L MotherBrainBody.brainMainShakeTimer                            ;A99389;
    BRA +                                                                ;A9938D;

  .nonZeroShakeTimer:
    LDA.W Enemy[1].flashTimer                                            ;A9938F;
    BNE +                                                                ;A99392;
    LDA.W Enemy[1].shakeTimer                                            ;A99394;

+   AND.W #$0006                                                         ;A99397;
    TAX                                                                  ;A9939A;
    LDA.W ShakingOffsets_X,X                                             ;A9939B;
    CLC                                                                  ;A9939E;
    ADC.W Enemy[1].XPosition                                             ;A9939F;
    STA.B DP_Temp12                                                      ;A993A2;
    CLC                                                                  ;A993A4;
    ADC.W #$0020                                                         ;A993A5;
    SEC                                                                  ;A993A8;
    SBC.W Layer1XPosition                                                ;A993A9;
    BMI .return                                                          ;A993AC;
    LDA.W ShakingOffsets_Y,X                                             ;A993AE;
    CLC                                                                  ;A993B1;
    ADC.W Enemy[1].YPosition                                             ;A993B2;
    STA.B DP_Temp14                                                      ;A993B5;
    JMP.W AddSpritemapToOAM_RoomCoordinates                              ;A993B7;

  .return:
    RTS                                                                  ;A993BA;


;;; $93BB: Shaking offsets ;;;
; Used for Mother Brain brain shaking and when Shitroid shakes
ShakingOffsets_X:
    dw $0000,$FFFF,$0000,$0001                                           ;A993BB;

ShakingOffsets_Y:
    dw $0000,$0001,$FFFF,$0001                                           ;A993C3;


;;; $93CB: Draw Mother Brain neck segment ;;;
DrawMotherBrainNeckSegment:
;; Parameters:
;;     $12: Neck segment X position
;;     $14: Neck segment Y position
    LDA.W Enemy[1].flashTimer                                            ;A993CB;
    AND.W #$0006                                                         ;A993CE;
    TAX                                                                  ;A993D1;
    LDA.W ShakingOffsets_X,X                                             ;A993D2;
    CLC                                                                  ;A993D5;
    ADC.B DP_Temp12                                                      ;A993D6;
    STA.B DP_Temp12                                                      ;A993D8;
    LDA.W ShakingOffsets_Y,X                                             ;A993DA;
    CLC                                                                  ;A993DD;
    ADC.B DP_Temp14                                                      ;A993DE;
    STA.B DP_Temp14                                                      ;A993E0;
    LDA.L MotherBrainBody.neckPalleteIndex                               ;A993E2;
    STA.B DP_Temp16                                                      ;A993E6;
    LDY.W #Spritemaps_MotherBrain_5                                      ;A993E8;
    JMP.W AddSpritemapToOAM_RoomCoordinates                              ;A993EB; >.<


;;; $93EE: Add spritemap to OAM ;;;
AddSpritemapToOAM_RoomCoordinates:
;; Parameters:
;;     DB:YYYY = address of spritemap
;;     $12     = X position of spritemap centre
;;     $14     = Y position of spritemap centre
;;     $16     = palette bits of sprite (palette * 200h)

; Compared to the usual 'add spritemap to OAM' routine,
; this one's X/Y position parameters ($12/14) are room co-ordinates rather than screen co-ordinates,
; and this one doesn't draw sprites that start above the screen (and otherwise has no off-screen handling)

; Spritemap format is roughly:
;     nnnn         ; Number of entries (2 bytes)
;     xxxx yy aatt ; Entry 0 (5 bytes)
;     ...          ; Entry 1...
; Where:
;     n = number of entries
;     x = X offset of sprite from centre
;     y = Y offset of sprite from centre
;     a = attributes
;     t = tile number

; More specifically, a spritemap entry is:
;     s000000xxxxxxxxx yyyyyyyy YXppPPPttttttttt
; Where:
;     s = size bit
;     x = X offset of sprite from centre
;     y = Y offset of sprite from centre
;     Y = Y flip
;     X = X flip
;     P = palette
;     p = priority (relative to background)
;     t = tile number
    LDA.W $0000,Y                                                        ;A993EE;
    INY                                                                  ;A993F1;
    INY                                                                  ;A993F2;
    STA.B DP_Temp18                                                      ;A993F3;
    LDX.W OAMStack                                                       ;A993F5;
    CLC                                                                  ;A993F8;

  .loop:
    LDA.W $0001,Y                                                        ;A993F9;
    AND.W #$FF00                                                         ;A993FC;
    BPL +                                                                ;A993FF;
    ORA.W #$00FF                                                         ;A99401;

+   XBA                                                                  ;A99404;
    CLC                                                                  ;A99405;
    ADC.B DP_Temp14                                                      ;A99406;
    SEC                                                                  ;A99408;
    SBC.W Layer1YPosition                                                ;A99409;
    BMI .next                                                            ;A9940C;
    STA.B DP_Temp1A                                                      ;A9940E;
    LDA.W $0000,Y                                                        ;A99410;
    ADC.B DP_Temp12                                                      ;A99413;
    SEC                                                                  ;A99415;
    SBC.W Layer1XPosition                                                ;A99416;
    STA.W OAMLow,X                                                       ;A99419;
    AND.W #$0100                                                         ;A9941C;
    BEQ .checkSizeBit                                                    ;A9941F;
    LDA.L MapOfOAMIndexToHighOAM_address,X                               ;A99421;
    STA.B DP_Temp1C                                                      ;A99425;
    LDA.B (DP_Temp1C)                                                    ;A99427;
    ORA.L MapOfOAMIndex_highXPosBit,X                                    ;A99429;
    STA.B (DP_Temp1C)                                                    ;A9942D;

  .checkSizeBit:
    LDA.W $0000,Y                                                        ;A9942F;
    BPL +                                                                ;A99432;
    LDA.L MapOfOAMIndexToHighOAM_address,X                               ;A99434;
    STA.B DP_Temp1C                                                      ;A99438;
    LDA.B (DP_Temp1C)                                                    ;A9943A;
    ORA.L MapOfOAMIndex_sizeBit,X                                        ;A9943C;
    STA.B (DP_Temp1C)                                                    ;A99440;

+   LDA.B DP_Temp1A                                                      ;A99442;
    STA.W OAMLow+1,X                                                     ;A99444;
    LDA.W $0003,Y                                                        ;A99447;
    ORA.B DP_Temp16                                                      ;A9944A;
    STA.W OAMLow+2,X                                                     ;A9944C;
    TXA                                                                  ;A9944F;
    CLC                                                                  ;A99450;
    ADC.W #$0004                                                         ;A99451;
    AND.W #$01FF                                                         ;A99454;
    TAX                                                                  ;A99457;

  .next:
    TYA                                                                  ;A99458;
    CLC                                                                  ;A99459;
    ADC.W #$0005                                                         ;A9945A;
    TAY                                                                  ;A9945D;
    DEC.B DP_Temp18                                                      ;A9945E;
    BNE .loop                                                            ;A99460;
    STX.W OAMStack                                                       ;A99462;
    RTS                                                                  ;A99465;


;;; $9466: Calculate Mother Brain rainbow beam HDMA tables ;;;
Calculate_MotherBrain_RainbowBeam_HDMATables:
    PHB                                                                  ;A99466;
    PEA.W CalculateMotherBrainRainbowBeamHDMATables>>8&$FF00             ;A99467;
    PLB                                                                  ;A9946A;
    PLB                                                                  ;A9946B;
    JSL.L CalculateMotherBrainRainbowBeamHDMATables                      ;A9946C;
    PLB                                                                  ;A99470;
    RTL                                                                  ;A99471;


;;; $9472: Palette - enemy $EC3F/$EC7F/$ECFF (Mother Brain) ;;;
Palette_MotherBrain:
    dw $3800,$269F,$0159,$004C,$0004,$5739,$4273,$2DAD                   ;A99472;
    dw $14C6,$367F,$29F9,$2173,$150C,$0C86,$7FFF,$0000                   ;A99482;


;;; $9492: Mother Brain palettes ;;;
; Colour 0 is never read
Palette_MotherBrain_BackLeg:
; Sprite palette 3 - Mother Brain's back leg
    dw $3800,$0000,$0000,$0000,$0024,$29AD,$214A,$14E7                   ;A99492;
    dw $0C63,$0000,$0000,$0000,$0000,$0000,$29AD,$0000                   ;A994A2;

Palette_MotherBrain_Attacks:
; Sprite palette 2 - Mother Brain's attacks
    dw $3800,$7FE0,$6B20,$5640,$03FF,$02BF,$015F,$001F                   ;A994B2;
    dw $29F9,$2173,$150C,$6318,$4631,$294A,$7FFF,$0C63                   ;A994C2;

Palette_MotherBrain_BabyMetroid:
; Sprite palette 7 - Baby Metroid
    dw $3800,$57B8,$0B11,$1646,$00E3,$72FF,$2CDF,$24B9                   ;A994D2;
    dw $1CAF,$18A9,$4F9F,$3ED8,$2E12,$08CD,$7FFF,$0000                   ;A994E2;

Palette_MotherBrain_TubeProjectiles:
; Sprite palette 7 - tube enemy projectiles
    dw $3800,$6318,$6318,$0802,$5294,$39CE,$2108,$1084                   ;A994F2;
    dw $0019,$0012,$5C00,$4000,$1084,$197F,$7FFF,$0000                   ;A99502;

Palette_MotherBrain_GlassShards:
; Sprite palette 3 - glass shards
    dw $3800,$5294,$39CE,$2108,$7F8B,$6F0A,$5E88,$4E07                   ;A99512;
    dw $3986,$2905,$1883,$0802,$1084,$6318,$7FFF,$0000                   ;A99522;

Palette_MotherBrain_ExplodedDoor:
; Sprite palette 1 - exploded escape door particles
    dw $3800,$4D1F,$38B6,$246E,$1448,$47FF,$2EFA,$1616                   ;A99532;
    dw $0132,$5294,$4210,$318C,$2108,$1084,$7FFF,$0000                   ;A99542;


;;; $9552: Move Mother Brain body down by [A], scroll it left by [X] ;;;
MoveMotherBrainBodyDownByA_ScrollLeftByX:
; This function expects X to have been pushed
    PHA                                                                  ;A99552;
    CLC                                                                  ;A99553;
    ADC.W Enemy.YPosition                                                ;A99554;
    STA.W Enemy.YPosition                                                ;A99557;
    PLA                                                                  ;A9955A;
    EOR.W #$FFFF                                                         ;A9955B;
    INC                                                                  ;A9955E;
    CLC                                                                  ;A9955F;
    ADC.B DP_BG2YScroll                                                  ;A99560;
    STA.B DP_BG2YScroll                                                  ;A99562;
    TXA                                                                  ;A99564;
    CLC                                                                  ;A99565;
    ADC.W #$0022                                                         ;A99566;
    STA.B DP_Temp14                                                      ;A99569;
    LDA.W Enemy.XPosition                                                ;A9956B;
    EOR.W #$FFFF                                                         ;A9956E;
    INC                                                                  ;A99571;
    CLC                                                                  ;A99572;
    ADC.B DP_Temp14                                                      ;A99573;
    STA.B DP_BG2XScroll                                                  ;A99575;
    PLX                                                                  ;A99577;
    RTL                                                                  ;A99578;


;;; $9579: Move Mother Brain body down by [A] ;;;
MoveMotherBrainBodyDownByA:
    PHA                                                                  ;A99579;
    CLC                                                                  ;A9957A;
    ADC.W Enemy.YPosition                                                ;A9957B;
    STA.W Enemy.YPosition                                                ;A9957E;
    PLA                                                                  ;A99581;
    EOR.W #$FFFF                                                         ;A99582;
    INC                                                                  ;A99585;
    CLC                                                                  ;A99586;
    ADC.B DP_BG2YScroll                                                  ;A99587;
    STA.B DP_BG2YScroll                                                  ;A99589;
    LDA.W #$0000                                                         ;A9958B;
    SEC                                                                  ;A9958E;
    SBC.W Enemy.XPosition                                                ;A9958F;
    CLC                                                                  ;A99592;
    ADC.W #$0022                                                         ;A99593;
    STA.B DP_BG2XScroll                                                  ;A99596;
    RTL                                                                  ;A99598;


;;; $9599: Mother Brain footstep effect ;;;
MotherBrainFootstepEffect:
; Callers are setting A before calling this routine... Oh well
; The sound effect (that doesn't play) is a crunchy footstep that plays when Mother Brain is being attacked by Shitroid
    LDA.W #$0001                                                         ;A99599;
    STA.W EarthquakeType                                                 ;A9959C;
    LDA.W #$0004                                                         ;A9959F;
    STA.W EarthquakeTimer                                                ;A995A2;
    LDA.L MotherBrainBody.form                                           ;A995A5;
    CMP.W #$0003                                                         ;A995A9;
    BNE .return                                                          ;A995AC;
    LDA.W #$0016                                                         ;A995AE;
    STA.L QueueSound_Lib3_Max6                                           ;A995B1; >_<

  .return:
    RTS                                                                  ;A995B5;


;;; $95B6: Instruction - move Mother Brain body up by 10px, scroll it left by 4px ;;;
Instruction_MotherBrainBody_MoveBodyUpBy10_ScrollLeftBy4:
    PHX                                                                  ;A995B6;
    LDX.W #$0004                                                         ;A995B7;
    LDA.W #$FFF6                                                         ;A995BA;
    JMP.W MoveMotherBrainBodyDownByA_ScrollLeftByX                       ;A995BD;


;;; $95C0: Instruction - move Mother Brain body up by 16px, scroll it left by 4px ;;;
Instruction_MotherBrainBody_MoveBodyUpBy16_ScrollLeftBy4:
    PHX                                                                  ;A995C0;
    LDX.W #$0004                                                         ;A995C1;
    LDA.W #$FFF0                                                         ;A995C4;
    JMP.W MoveMotherBrainBodyDownByA_ScrollLeftByX                       ;A995C7;


;;; $95CA: Instruction - move Mother Brain body up by 12px, scroll it right by 2px ;;;
Instruction_MotherBrainBody_MoveBodyUpBy12_ScrollRightBy2:
    PHX                                                                  ;A995CA;
    LDX.W #$FFFE                                                         ;A995CB;
    LDA.W #$FFF4                                                         ;A995CE;
    JMP.W MoveMotherBrainBodyDownByA_ScrollLeftByX                       ;A995D1;


if !FEATURE_KEEP_UNREFERENCED
;;; $95D4: Unused. Instruction - scroll Mother Brain body right by 2px ;;;
UNUSED_Instruction_MotherBrainBody_MoveBodyRightBy2_A995D4:
    PHX                                                                  ;A995D4;
    LDX.W #$FFFE                                                         ;A995D5;
    LDA.W #$0000                                                         ;A995D8;
    JMP.W MoveMotherBrainBodyDownByA_ScrollLeftByX                       ;A995DB;
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $95DE: Instruction - move Mother Brain body down by 12px, scroll it left by 4px ;;;
Instruction_MotherBrainBody_MoveBodyDownBy12_ScrollLeftBy4:
    PHX                                                                  ;A995DE;
    LDX.W #$0004                                                         ;A995DF;
    LDA.W #$000C                                                         ;A995E2;
    JMP.W MoveMotherBrainBodyDownByA_ScrollLeftByX                       ;A995E5;


;;; $95E8: Instruction - move Mother Brain body down by 16px, scroll it right by 2px ;;;
Instruction_MotherBrainBody_MoveBodyDownBy16_ScrollRightBy2:
    PHX                                                                  ;A995E8;
    LDX.W #$FFFE                                                         ;A995E9;
    LDA.W #$0010                                                         ;A995EC;
    JMP.W MoveMotherBrainBodyDownByA_ScrollLeftByX                       ;A995EF;


;;; $95F2: Instruction - move Mother Brain body down by 10px, scroll it right by 2px ;;;
Instruction_MotherBrainBody_MoveBodyDownBy10_ScrollRightBy2:
    PHX                                                                  ;A995F2;
    LDX.W #$FFFE                                                         ;A995F3;
    LDA.W #$000A                                                         ;A995F6;
    JMP.W MoveMotherBrainBodyDownByA_ScrollLeftByX                       ;A995F9;


;;; $95FC: Instruction - move Mother Brain body up by 2px and right by 1px ;;;
Instruction_MotherBrainBody_MoveBodyUpBy2_ScrollRightBy1:
    LDA.W Enemy.XPosition                                                ;A995FC;
    CLC                                                                  ;A995FF;
    ADC.W #$0001                                                         ;A99600;
    STA.W Enemy.XPosition                                                ;A99603;
    LDA.W #$FFFE                                                         ;A99606;
    JMP.W MoveMotherBrainBodyDownByA                                     ;A99609;


;;; $960C: Instruction - move Mother Brain body right by 2px ;;;
Instruction_MotherBrainBody_MoveBodyRightBy2:
    LDA.W Enemy.XPosition                                                ;A9960C;
    CLC                                                                  ;A9960F;
    ADC.W #$0002                                                         ;A99610;
    STA.W Enemy.XPosition                                                ;A99613;
    LDA.W #$0000                                                         ;A99616;
    JMP.W MoveMotherBrainBodyDownByA                                     ;A99619;


;;; $961C: Instruction - move Mother Brain body up by 1px ;;;
Instruction_MotherBrainBody_MoveBodyUpBy1:
    LDA.W #$0001                                                         ;A9961C;
    JMP.W MoveMotherBrainBodyDownByA                                     ;A9961F;


;;; $9622: Instruction - move Mother Brain body up by 1px and right by 3px, do footstep effect ;;;
Instruction_MotherBrainBody_MoveBodyUpBy1_RightBy3_Footstep:
    LDA.W #$0022                                                         ;A99622;
    JSR.W MotherBrainFootstepEffect                                      ;A99625;
    LDA.W Enemy.XPosition                                                ;A99628;
    CLC                                                                  ;A9962B;
    ADC.W #$0003                                                         ;A9962C;
    STA.W Enemy.XPosition                                                ;A9962F;
    LDA.W #$0001                                                         ;A99632;
    JMP.W MoveMotherBrainBodyDownByA                                     ;A99635;


;;; $9638: Instruction - move Mother Brain body down by 2px and right by 15px ;;;
Instruction_MotherBrainBody_MoveBodyDownBy2_RightBy15:
    LDA.W Enemy.XPosition                                                ;A99638;
    CLC                                                                  ;A9963B;
    ADC.W #$000F                                                         ;A9963C;
    STA.W Enemy.XPosition                                                ;A9963F;
    LDA.W #$FFFE                                                         ;A99642;
    JMP.W MoveMotherBrainBodyDownByA                                     ;A99645;


;;; $9648: Instruction - move Mother Brain body down by 4px and right by 6px ;;;
Instruction_MotherBrainBody_MoveBodyDownBy4_RightBy6:
    LDA.W Enemy.XPosition                                                ;A99648;
    CLC                                                                  ;A9964B;
    ADC.W #$0006                                                         ;A9964C;
    STA.W Enemy.XPosition                                                ;A9964F;
    LDA.W #$FFFC                                                         ;A99652;
    JMP.W MoveMotherBrainBodyDownByA                                     ;A99655;


;;; $9658: Instruction - move Mother Brain body up by 4px and left by 2px ;;;
Instruction_MotherBrainBody_MoveBodyUpBy4_LeftBy2:
    LDA.W Enemy.XPosition                                                ;A99658;
    CLC                                                                  ;A9965B;
    ADC.W #$FFFE                                                         ;A9965C;
    STA.W Enemy.XPosition                                                ;A9965F;
    LDA.W #$0004                                                         ;A99662;
    JMP.W MoveMotherBrainBodyDownByA                                     ;A99665;


;;; $9668: Instruction - move Mother Brain body up by 2px and left by 1px, do footstep effect ;;;
Instruction_MotherBrainBody_MoveBodyUpBy2_LeftBy1_Footstep:
    LDA.W #$FFEF                                                         ;A99668;
    JSR.W MotherBrainFootstepEffect                                      ;A9966B;
    LDA.W Enemy.XPosition                                                ;A9966E;
    CLC                                                                  ;A99671;
    ADC.W #$FFFF                                                         ;A99672;
    STA.W Enemy.XPosition                                                ;A99675;
    LDA.W #$0002                                                         ;A99678;
    JMP.W MoveMotherBrainBodyDownByA                                     ;A9967B;


;;; $967E: Instruction - move Mother Brain body up by 2px and left by 1px, do footstep effect ;;;
Instruction_MotherBrainBody_MoveBodyUpBy2_LeftBy1_Footstep_duplicate:
    LDA.W #$000B                                                         ;A9967E;
    JSR.W MotherBrainFootstepEffect                                      ;A99681;
    LDA.W Enemy.XPosition                                                ;A99684;
    SEC                                                                  ;A99687;
    SBC.W #$0001                                                         ;A99688;
    STA.W Enemy.XPosition                                                ;A9968B;
    LDA.W #$0002                                                         ;A9968E;
    JMP.W MoveMotherBrainBodyDownByA                                     ;A99691;


;;; $9694: Instruction - move Mother Brain body left by 2px ;;;
Instruction_MotherBrainBody_MoveBodyLeftBy2:
    LDA.W Enemy.XPosition                                                ;A99694;
    SEC                                                                  ;A99697;
    SBC.W #$0002                                                         ;A99698;
    STA.W Enemy.XPosition                                                ;A9969B;
    LDA.W #$0000                                                         ;A9969E;
    JMP.W MoveMotherBrainBodyDownByA                                     ;A996A1;


;;; $96A4: Instruction - move Mother Brain body down by 1px ;;;
Instruction_MotherBrainBody_MoveBodyDownBy1:
    LDA.W #$FFFF                                                         ;A996A4;
    JMP.W MoveMotherBrainBodyDownByA                                     ;A996A7;


;;; $96AA: Instruction - move Mother Brain body down by 1px and left by 3px ;;;
Instruction_MotherBrainBody_MoveBodyDownBy1_LeftBy3:
    LDA.W Enemy.XPosition                                                ;A996AA;
    SEC                                                                  ;A996AD;
    SBC.W #$0003                                                         ;A996AE;
    STA.W Enemy.XPosition                                                ;A996B1;
    LDA.W #$FFFF                                                         ;A996B4;
    JMP.W MoveMotherBrainBodyDownByA                                     ;A996B7;


;;; $96BA: Instruction - move Mother Brain body up by 2px and left by 15px, do footstep effect ;;;
Instruction_MotherBrainBody_MoveBodyUpBy2_LeftBy15_Footstep:
    LDA.W #$FFDB                                                         ;A996BA;
    JSR.W MotherBrainFootstepEffect                                      ;A996BD;
    LDA.W Enemy.XPosition                                                ;A996C0;
    SEC                                                                  ;A996C3;
    SBC.W #$000F                                                         ;A996C4;
    STA.W Enemy.XPosition                                                ;A996C7;
    LDA.W #$0002                                                         ;A996CA;
    JMP.W MoveMotherBrainBodyDownByA                                     ;A996CD;


;;; $96D0: Instruction - move Mother Brain body up by 4px and left by 6px ;;;
Instruction_MotherBrainBody_MoveBodyUpBy4_LeftBy6:
    LDA.W Enemy.XPosition                                                ;A996D0;
    SEC                                                                  ;A996D3;
    SBC.W #$0006                                                         ;A996D4;
    STA.W Enemy.XPosition                                                ;A996D7;
    LDA.W #$0004                                                         ;A996DA;
    JMP.W MoveMotherBrainBodyDownByA                                     ;A996DD;


;;; $96E0: Instruction - move Mother Brain body down by 4px and right by 2px ;;;
Instruction_MotherBrainBody_MoveBodyDownBy4_RightBy2:
    LDA.W Enemy.XPosition                                                ;A996E0;
    SEC                                                                  ;A996E3;
    SBC.W #$FFFE                                                         ;A996E4;
    STA.W Enemy.XPosition                                                ;A996E7;
    LDA.W #$FFFC                                                         ;A996EA;
    JMP.W MoveMotherBrainBodyDownByA                                     ;A996ED;


;;; $96F0: Instruction - move Mother Brain body down by 2px and right by 1px ;;;
Instruction_MotherBrainBody_MoveBodyDownBy2_RightBy1:
    LDA.W Enemy.XPosition                                                ;A996F0;
    SEC                                                                  ;A996F3;
    SBC.W #$FFFF                                                         ;A996F4;
    STA.W Enemy.XPosition                                                ;A996F7;
    LDA.W #$FFFE                                                         ;A996FA;
    JMP.W MoveMotherBrainBodyDownByA                                     ;A996FD;


;;; $9700: Instruction - Mother Brain's pose = standing ;;;
Instruction_MotherBrainBody_SetPoseToStanding:
    LDA.W #$0000                                                         ;A99700;
    STA.L MotherBrainBody.pose                                           ;A99703;
    RTL                                                                  ;A99707;


;;; $9708: Instruction - Mother Brain's pose = walking ;;;
Instruction_MotherBrainBody_SetPoseToWalking:
    LDA.W #$0001                                                         ;A99708;
    STA.L MotherBrainBody.pose                                           ;A9970B;
    RTL                                                                  ;A9970F;


;;; $9710: Instruction - Mother Brain's pose = crouched ;;;
Instruction_MotherBrainBody_SetPoseToCrouching:
    LDA.W #$0003                                                         ;A99710;
    STA.L MotherBrainBody.pose                                           ;A99713;
    RTL                                                                  ;A99717;


;;; $9718: Instruction - Mother Brain's pose = crouching transition ;;;
Instruction_MotherBrainBody_SetPoseToCrouchingTransition:
    LDA.W #$0002                                                         ;A99718;
    STA.L MotherBrainBody.pose                                           ;A9971B;
    RTL                                                                  ;A9971F;


;;; $9720: Instruction - Mother Brain's pose = death beam mode ;;;
Instruction_MotherBrainBody_SetPoseToDeathBeamMode:
    LDA.W #$0004                                                         ;A99720;
    STA.L MotherBrainBody.pose                                           ;A99723;
    RTL                                                                  ;A99727;


;;; $9728: Instruction - Mother Brain's pose = leaning down ;;;
Instruction_MotherBrainBody_SetPoseToLeaningDown:
    LDA.W #$0006                                                         ;A99728;
    STA.L MotherBrainBody.pose                                           ;A9972B;
    RTL                                                                  ;A9972F;


;;; $9730: Instruction list - Mother Brain body - walking forwards - really fast ;;;
InstList_MotherBrainBody_WalkingForwards_ReallyFast:
    dw Instruction_MotherBrainBody_SetPoseToWalking                      ;A99730;
    dw $0002,ExtendedSpritemap_MotherBrainBody_Standing                  ;A99732;
    dw Instruction_MotherBrainBody_MoveBodyUpBy2_ScrollRightBy1          ;A99736;
    dw $0002,ExtendedSpritemap_MotherBrainBody_Walking_0                 ;A99738;
    dw Instruction_MotherBrainBody_MoveBodyRightBy2                      ;A9973C;
    dw $0002,ExtendedSpritemap_MotherBrainBody_Walking_1                 ;A9973E;
    dw Instruction_MotherBrainBody_MoveBodyUpBy1                         ;A99742;
    dw $0002,ExtendedSpritemap_MotherBrainBody_Walking_2                 ;A99744;
    dw Instruction_MotherBrainBody_MoveBodyUpBy1_RightBy3_Footstep       ;A99748;
    dw $0002,ExtendedSpritemap_MotherBrainBody_Walking_3                 ;A9974A;
    dw Instruction_MotherBrainBody_MoveBodyDownBy2_RightBy15             ;A9974E;
    dw $0002,ExtendedSpritemap_MotherBrainBody_Walking_4                 ;A99750;
    dw Instruction_MotherBrainBody_MoveBodyDownBy4_RightBy6              ;A99754;
    dw $0002,ExtendedSpritemap_MotherBrainBody_Walking_5                 ;A99756;
    dw Instruction_MotherBrainBody_MoveBodyUpBy4_LeftBy2                 ;A9975A;
    dw $0002,ExtendedSpritemap_MotherBrainBody_Walking_6                 ;A9975C;
    dw Instruction_MotherBrainBody_MoveBodyUpBy2_LeftBy1_Footstep        ;A99760;
    dw Instruction_MotherBrainBody_SetPoseToStanding                     ;A99762;
    dw $0002,ExtendedSpritemap_MotherBrainBody_Walking_7                 ;A99764;
    dw Common_Instruction_Sleep                                          ;A99768;


;;; $976A: Instruction list - Mother Brain body - walking forwards - fast ;;;
InstList_MotherBrainBody_WalkingForwards_Fast:
    dw Instruction_MotherBrainBody_SetPoseToWalking                      ;A9976A;
    dw $0004,ExtendedSpritemap_MotherBrainBody_Standing                  ;A9976C;
    dw Instruction_MotherBrainBody_MoveBodyUpBy2_ScrollRightBy1          ;A99770;
    dw $0004,ExtendedSpritemap_MotherBrainBody_Walking_0                 ;A99772;
    dw Instruction_MotherBrainBody_MoveBodyRightBy2                      ;A99776;
    dw $0004,ExtendedSpritemap_MotherBrainBody_Walking_1                 ;A99778;
    dw Instruction_MotherBrainBody_MoveBodyUpBy1                         ;A9977C;
    dw $0004,ExtendedSpritemap_MotherBrainBody_Walking_2                 ;A9977E;
    dw Instruction_MotherBrainBody_MoveBodyUpBy1_RightBy3_Footstep       ;A99782;
    dw $0004,ExtendedSpritemap_MotherBrainBody_Walking_3                 ;A99784;
    dw Instruction_MotherBrainBody_MoveBodyDownBy2_RightBy15             ;A99788;
    dw $0004,ExtendedSpritemap_MotherBrainBody_Walking_4                 ;A9978A;
    dw Instruction_MotherBrainBody_MoveBodyDownBy4_RightBy6              ;A9978E;
    dw $0004,ExtendedSpritemap_MotherBrainBody_Walking_5                 ;A99790;
    dw Instruction_MotherBrainBody_MoveBodyUpBy4_LeftBy2                 ;A99794;
    dw $0004,ExtendedSpritemap_MotherBrainBody_Walking_6                 ;A99796;
    dw Instruction_MotherBrainBody_MoveBodyUpBy2_LeftBy1_Footstep        ;A9979A;
    dw Instruction_MotherBrainBody_SetPoseToStanding                     ;A9979C;
    dw $0004,ExtendedSpritemap_MotherBrainBody_Walking_7                 ;A9979E;
    dw Common_Instruction_Sleep                                          ;A997A2;


;;; $97A4: Instruction list - Mother Brain body - walking forwards - medium ;;;
InstList_MotherBrainBody_WalkingForwards_Medium:
    dw Instruction_MotherBrainBody_SetPoseToWalking                      ;A997A4;
    dw $0006,ExtendedSpritemap_MotherBrainBody_Standing                  ;A997A6;
    dw Instruction_MotherBrainBody_MoveBodyUpBy2_ScrollRightBy1          ;A997AA;
    dw $0006,ExtendedSpritemap_MotherBrainBody_Walking_0                 ;A997AC;
    dw Instruction_MotherBrainBody_MoveBodyRightBy2                      ;A997B0;
    dw $0006,ExtendedSpritemap_MotherBrainBody_Walking_1                 ;A997B2;
    dw Instruction_MotherBrainBody_MoveBodyUpBy1                         ;A997B6;
    dw $0006,ExtendedSpritemap_MotherBrainBody_Walking_2                 ;A997B8;
    dw Instruction_MotherBrainBody_MoveBodyUpBy1_RightBy3_Footstep       ;A997BC;
    dw $0006,ExtendedSpritemap_MotherBrainBody_Walking_3                 ;A997BE;
    dw Instruction_MotherBrainBody_MoveBodyDownBy2_RightBy15             ;A997C2;
    dw $0006,ExtendedSpritemap_MotherBrainBody_Walking_4                 ;A997C4;
    dw Instruction_MotherBrainBody_MoveBodyDownBy4_RightBy6              ;A997C8;
    dw $0006,ExtendedSpritemap_MotherBrainBody_Walking_5                 ;A997CA;
    dw Instruction_MotherBrainBody_MoveBodyUpBy4_LeftBy2                 ;A997CE;
    dw $0006,ExtendedSpritemap_MotherBrainBody_Walking_6                 ;A997D0;
    dw Instruction_MotherBrainBody_MoveBodyUpBy2_LeftBy1_Footstep        ;A997D4;
    dw Instruction_MotherBrainBody_SetPoseToStanding                     ;A997D6;
    dw $0006,ExtendedSpritemap_MotherBrainBody_Walking_7                 ;A997D8;
    dw Common_Instruction_Sleep                                          ;A997DC;


;;; $97DE: Instruction list - Mother Brain body - walking forwards - slow ;;;
InstList_MotherBrainBody_WalkingForwards_Slow:
    dw Instruction_MotherBrainBody_SetPoseToWalking                      ;A997DE;
    dw $0008,ExtendedSpritemap_MotherBrainBody_Standing                  ;A997E0;
    dw Instruction_MotherBrainBody_MoveBodyUpBy2_ScrollRightBy1          ;A997E4;
    dw $0008,ExtendedSpritemap_MotherBrainBody_Walking_0                 ;A997E6;
    dw Instruction_MotherBrainBody_MoveBodyRightBy2                      ;A997EA;
    dw $0008,ExtendedSpritemap_MotherBrainBody_Walking_1                 ;A997EC;
    dw Instruction_MotherBrainBody_MoveBodyUpBy1                         ;A997F0;
    dw $0008,ExtendedSpritemap_MotherBrainBody_Walking_2                 ;A997F2;
    dw Instruction_MotherBrainBody_MoveBodyUpBy1_RightBy3_Footstep       ;A997F6;
    dw $0008,ExtendedSpritemap_MotherBrainBody_Walking_3                 ;A997F8;
    dw Instruction_MotherBrainBody_MoveBodyDownBy2_RightBy15             ;A997FC;
    dw $0008,ExtendedSpritemap_MotherBrainBody_Walking_4                 ;A997FE;
    dw Instruction_MotherBrainBody_MoveBodyDownBy4_RightBy6              ;A99802;
    dw $0008,ExtendedSpritemap_MotherBrainBody_Walking_5                 ;A99804;
    dw Instruction_MotherBrainBody_MoveBodyUpBy4_LeftBy2                 ;A99808;
    dw $0008,ExtendedSpritemap_MotherBrainBody_Walking_6                 ;A9980A;
    dw Instruction_MotherBrainBody_MoveBodyUpBy2_LeftBy1_Footstep        ;A9980E;
    dw Instruction_MotherBrainBody_SetPoseToStanding                     ;A99810;
    dw $0008,ExtendedSpritemap_MotherBrainBody_Walking_7                 ;A99812;
    dw Common_Instruction_Sleep                                          ;A99816;


;;; $9818: Instruction list - Mother Brain body - walking forwards - really slow ;;;
InstList_MotherBrainBody_WalkingForwards_ReallySlow:
    dw Instruction_MotherBrainBody_SetPoseToWalking                      ;A99818;
    dw $000A,ExtendedSpritemap_MotherBrainBody_Standing                  ;A9981A;
    dw Instruction_MotherBrainBody_MoveBodyUpBy2_ScrollRightBy1          ;A9981E;
    dw $000A,ExtendedSpritemap_MotherBrainBody_Walking_0                 ;A99820;
    dw Instruction_MotherBrainBody_MoveBodyRightBy2                      ;A99824;
    dw $000A,ExtendedSpritemap_MotherBrainBody_Walking_1                 ;A99826;
    dw Instruction_MotherBrainBody_MoveBodyUpBy1                         ;A9982A;
    dw $000A,ExtendedSpritemap_MotherBrainBody_Walking_2                 ;A9982C;
    dw Instruction_MotherBrainBody_MoveBodyUpBy1_RightBy3_Footstep       ;A99830;
    dw $000A,ExtendedSpritemap_MotherBrainBody_Walking_3                 ;A99832;
    dw Instruction_MotherBrainBody_MoveBodyDownBy2_RightBy15             ;A99836;
    dw $000A,ExtendedSpritemap_MotherBrainBody_Walking_4                 ;A99838;
    dw Instruction_MotherBrainBody_MoveBodyDownBy4_RightBy6              ;A9983C;
    dw $000A,ExtendedSpritemap_MotherBrainBody_Walking_5                 ;A9983E;
    dw Instruction_MotherBrainBody_MoveBodyUpBy4_LeftBy2                 ;A99842;
    dw $000A,ExtendedSpritemap_MotherBrainBody_Walking_6                 ;A99844;
    dw Instruction_MotherBrainBody_MoveBodyUpBy2_LeftBy1_Footstep        ;A99848;
    dw Instruction_MotherBrainBody_SetPoseToStanding                     ;A9984A;
    dw $000A,ExtendedSpritemap_MotherBrainBody_Walking_7                 ;A9984C;
    dw Common_Instruction_Sleep                                          ;A99850;


;;; $9852: Instruction list - Mother Brain body - walking backwards - slow ;;;
InstList_MotherBrainBody_WalkingBackwards_Slow:
    dw Instruction_MotherBrainBody_SetPoseToWalking                      ;A99852;
    dw $0008,ExtendedSpritemap_MotherBrainBody_Walking_7                 ;A99854;
    dw Instruction_MotherBrainBody_MoveBodyDownBy2_RightBy1              ;A99858;
    dw $0008,ExtendedSpritemap_MotherBrainBody_Walking_6                 ;A9985A;
    dw Instruction_MotherBrainBody_MoveBodyDownBy4_RightBy2              ;A9985E;
    dw $0008,ExtendedSpritemap_MotherBrainBody_Walking_5                 ;A99860;
    dw Instruction_MotherBrainBody_MoveBodyUpBy4_LeftBy6                 ;A99864;
    dw $0008,ExtendedSpritemap_MotherBrainBody_Walking_4                 ;A99866;
    dw Instruction_MotherBrainBody_MoveBodyUpBy2_LeftBy15_Footstep       ;A9986A;
    dw $0008,ExtendedSpritemap_MotherBrainBody_Walking_3                 ;A9986C;
    dw Instruction_MotherBrainBody_MoveBodyDownBy1_LeftBy3               ;A99870;
    dw $0008,ExtendedSpritemap_MotherBrainBody_Walking_2                 ;A99872;
    dw Instruction_MotherBrainBody_MoveBodyDownBy1                       ;A99876;
    dw $0008,ExtendedSpritemap_MotherBrainBody_Walking_1                 ;A99878;
    dw Instruction_MotherBrainBody_MoveBodyLeftBy2                       ;A9987C;
    dw $0008,ExtendedSpritemap_MotherBrainBody_Walking_0                 ;A9987E;
    dw Instruction_MotherBrainBody_MoveBodyUpBy2_LeftBy1_Footstep_duplicate ;A99882;
    dw Instruction_MotherBrainBody_SetPoseToStanding                     ;A99884;
    dw $0008,ExtendedSpritemap_MotherBrainBody_Standing                  ;A99886;
    dw Common_Instruction_Sleep                                          ;A9988A;


;;; $988C: Instruction list - Mother Brain body - walking backwards - really fast ;;;
InstList_MotherBrainBody_WalkingBackwards_ReallyFast:
    dw Instruction_MotherBrainBody_SetPoseToWalking                      ;A9988C;
    dw $0002,ExtendedSpritemap_MotherBrainBody_Walking_7                 ;A9988E;
    dw Instruction_MotherBrainBody_MoveBodyDownBy2_RightBy1              ;A99892;
    dw $0002,ExtendedSpritemap_MotherBrainBody_Walking_6                 ;A99894;
    dw Instruction_MotherBrainBody_MoveBodyDownBy4_RightBy2              ;A99898;
    dw $0002,ExtendedSpritemap_MotherBrainBody_Walking_5                 ;A9989A;
    dw Instruction_MotherBrainBody_MoveBodyUpBy4_LeftBy6                 ;A9989E;
    dw $0002,ExtendedSpritemap_MotherBrainBody_Walking_4                 ;A998A0;
    dw Instruction_MotherBrainBody_MoveBodyUpBy2_LeftBy15_Footstep       ;A998A4;
    dw $0002,ExtendedSpritemap_MotherBrainBody_Walking_3                 ;A998A6;
    dw Instruction_MotherBrainBody_MoveBodyDownBy1_LeftBy3               ;A998AA;
    dw $0002,ExtendedSpritemap_MotherBrainBody_Walking_2                 ;A998AC;
    dw Instruction_MotherBrainBody_MoveBodyDownBy1                       ;A998B0;
    dw $0002,ExtendedSpritemap_MotherBrainBody_Walking_1                 ;A998B2;
    dw Instruction_MotherBrainBody_MoveBodyLeftBy2                       ;A998B6;
    dw $0002,ExtendedSpritemap_MotherBrainBody_Walking_0                 ;A998B8;
    dw Instruction_MotherBrainBody_MoveBodyUpBy2_LeftBy1_Footstep_duplicate ;A998BC;
    dw Instruction_MotherBrainBody_SetPoseToStanding                     ;A998BE;
    dw $0002,ExtendedSpritemap_MotherBrainBody_Standing                  ;A998C0;
    dw Common_Instruction_Sleep                                          ;A998C4;


;;; $98C6: Instruction list - Mother Brain body - walking backwards - fast ;;;
InstList_MotherBrainBody_WalkingBackwards_Fast:
    dw Instruction_MotherBrainBody_SetPoseToWalking                      ;A998C6;
    dw $0004,ExtendedSpritemap_MotherBrainBody_Walking_7                 ;A998C8;
    dw Instruction_MotherBrainBody_MoveBodyDownBy2_RightBy1              ;A998CC;
    dw $0004,ExtendedSpritemap_MotherBrainBody_Walking_6                 ;A998CE;
    dw Instruction_MotherBrainBody_MoveBodyDownBy4_RightBy2              ;A998D2;
    dw $0004,ExtendedSpritemap_MotherBrainBody_Walking_5                 ;A998D4;
    dw Instruction_MotherBrainBody_MoveBodyUpBy4_LeftBy6                 ;A998D8;
    dw $0004,ExtendedSpritemap_MotherBrainBody_Walking_4                 ;A998DA;
    dw Instruction_MotherBrainBody_MoveBodyUpBy2_LeftBy15_Footstep       ;A998DE;
    dw $0004,ExtendedSpritemap_MotherBrainBody_Walking_3                 ;A998E0;
    dw Instruction_MotherBrainBody_MoveBodyDownBy1_LeftBy3               ;A998E4;
    dw $0004,ExtendedSpritemap_MotherBrainBody_Walking_2                 ;A998E6;
    dw Instruction_MotherBrainBody_MoveBodyDownBy1                       ;A998EA;
    dw $0004,ExtendedSpritemap_MotherBrainBody_Walking_1                 ;A998EC;
    dw Instruction_MotherBrainBody_MoveBodyLeftBy2                       ;A998F0;
    dw $0004,ExtendedSpritemap_MotherBrainBody_Walking_0                 ;A998F2;
    dw Instruction_MotherBrainBody_MoveBodyUpBy2_LeftBy1_Footstep_duplicate ;A998F6;
    dw Instruction_MotherBrainBody_SetPoseToStanding                     ;A998F8;
    dw $0004,ExtendedSpritemap_MotherBrainBody_Standing                  ;A998FA;
    dw Common_Instruction_Sleep                                          ;A998FE;


;;; $9900: Instruction list - Mother Brain body - walking backwards - medium ;;;
InstList_MotherBrainBody_WalkingBackwards_Medium:
    dw Instruction_MotherBrainBody_SetPoseToWalking                      ;A99900;
    dw $0006,ExtendedSpritemap_MotherBrainBody_Walking_7                 ;A99902;
    dw Instruction_MotherBrainBody_MoveBodyDownBy2_RightBy1              ;A99906;
    dw $0006,ExtendedSpritemap_MotherBrainBody_Walking_6                 ;A99908;
    dw Instruction_MotherBrainBody_MoveBodyDownBy4_RightBy2              ;A9990C;
    dw $0006,ExtendedSpritemap_MotherBrainBody_Walking_5                 ;A9990E;
    dw Instruction_MotherBrainBody_MoveBodyUpBy4_LeftBy6                 ;A99912;
    dw $0006,ExtendedSpritemap_MotherBrainBody_Walking_4                 ;A99914;
    dw Instruction_MotherBrainBody_MoveBodyUpBy2_LeftBy15_Footstep       ;A99918;
    dw $0006,ExtendedSpritemap_MotherBrainBody_Walking_3                 ;A9991A;
    dw Instruction_MotherBrainBody_MoveBodyDownBy1_LeftBy3               ;A9991E;
    dw $0006,ExtendedSpritemap_MotherBrainBody_Walking_2                 ;A99920;
    dw Instruction_MotherBrainBody_MoveBodyDownBy1                       ;A99924;
    dw $0006,ExtendedSpritemap_MotherBrainBody_Walking_1                 ;A99926;
    dw Instruction_MotherBrainBody_MoveBodyLeftBy2                       ;A9992A;
    dw $0006,ExtendedSpritemap_MotherBrainBody_Walking_0                 ;A9992C;
    dw Instruction_MotherBrainBody_MoveBodyUpBy2_LeftBy1_Footstep_duplicate ;A99930;
    dw Instruction_MotherBrainBody_SetPoseToStanding                     ;A99932;
    dw $0006,ExtendedSpritemap_MotherBrainBody_Standing                  ;A99934;
    dw Common_Instruction_Sleep                                          ;A99938;


;;; $993A: Instruction list - Mother Brain body - walking backwards - really slow ;;;
InstList_MotherBrainBody_WalkingBackwards_ReallySlow:
    dw Instruction_MotherBrainBody_SetPoseToWalking                      ;A9993A;
    dw $000A,ExtendedSpritemap_MotherBrainBody_Walking_7                 ;A9993C;
    dw Instruction_MotherBrainBody_MoveBodyDownBy2_RightBy1              ;A99940;
    dw $000A,ExtendedSpritemap_MotherBrainBody_Walking_6                 ;A99942;
    dw Instruction_MotherBrainBody_MoveBodyDownBy4_RightBy2              ;A99946;
    dw $000A,ExtendedSpritemap_MotherBrainBody_Walking_5                 ;A99948;
    dw Instruction_MotherBrainBody_MoveBodyUpBy4_LeftBy6                 ;A9994C;
    dw $000A,ExtendedSpritemap_MotherBrainBody_Walking_4                 ;A9994E;
    dw Instruction_MotherBrainBody_MoveBodyUpBy2_LeftBy15_Footstep       ;A99952;
    dw $000A,ExtendedSpritemap_MotherBrainBody_Walking_3                 ;A99954;
    dw Instruction_MotherBrainBody_MoveBodyDownBy1_LeftBy3               ;A99958;
    dw $000A,ExtendedSpritemap_MotherBrainBody_Walking_2                 ;A9995A;
    dw Instruction_MotherBrainBody_MoveBodyDownBy1                       ;A9995E;
    dw $000A,ExtendedSpritemap_MotherBrainBody_Walking_1                 ;A99960;
    dw Instruction_MotherBrainBody_MoveBodyLeftBy2                       ;A99964;
    dw $000A,ExtendedSpritemap_MotherBrainBody_Walking_0                 ;A99966;
    dw Instruction_MotherBrainBody_MoveBodyUpBy2_LeftBy1_Footstep_duplicate ;A9996A;
    dw Instruction_MotherBrainBody_SetPoseToStanding                     ;A9996C;
    dw $000A,ExtendedSpritemap_MotherBrainBody_Standing                  ;A9996E;
    dw Common_Instruction_Sleep                                          ;A99972;


;;; $9974: Instruction list - Mother Brain body - crouch and then stand up ;;;
InstList_MotherBrainBody_CrouchAndThenStandUp:
    dw Instruction_MotherBrainBody_SetPoseToCrouchingTransition          ;A99974;
    dw $0008,ExtendedSpritemap_MotherBrainBody_Standing                  ;A99976;
    dw Instruction_MotherBrainBody_MoveBodyDownBy12_ScrollLeftBy4        ;A9997A;
    dw $0008,ExtendedSpritemap_MotherBrainBody_LeaningDown               ;A9997C;
    dw Instruction_MotherBrainBody_MoveBodyDownBy16_ScrollRightBy2       ;A99980;
    dw $0008,ExtendedSpritemap_MotherBrainBody_Uncrouching               ;A99982;
    dw Instruction_MotherBrainBody_MoveBodyDownBy10_ScrollRightBy2       ;A99986;
    dw Instruction_MotherBrainBody_SetPoseToCrouching                    ;A99988;
    dw $0008,ExtendedSpritemap_MotherBrainBody_Crouched                  ;A9998A;
    dw $0008,ExtendedSpritemap_MotherBrainBody_Crouched                  ;A9998E;
    dw Instruction_MotherBrainBody_MoveBodyUpBy10_ScrollLeftBy4          ;A99992;
    dw Instruction_MotherBrainBody_SetPoseToCrouchingTransition          ;A99994;
    dw $0008,ExtendedSpritemap_MotherBrainBody_Uncrouching               ;A99996;
    dw Instruction_MotherBrainBody_MoveBodyUpBy16_ScrollLeftBy4          ;A9999A;
    dw $0008,ExtendedSpritemap_MotherBrainBody_LeaningDown               ;A9999C;
    dw Instruction_MotherBrainBody_MoveBodyUpBy12_ScrollRightBy2         ;A999A0;
    dw $0008,ExtendedSpritemap_MotherBrainBody_Standing                  ;A999A2;
    dw Instruction_MotherBrainBody_SetPoseToStanding                     ;A999A6;
    dw Common_Instruction_Sleep                                          ;A999A8;


;;; $99AA: Instruction list - Mother Brain body - standing up after crouching - slow ;;;
InstList_MotherBrainBody_StandingUpAfterCrouching_Slow:
    dw Instruction_MotherBrainBody_SetPoseToCrouchingTransition          ;A999AA;
    dw $0010,ExtendedSpritemap_MotherBrainBody_Crouched                  ;A999AC;
    dw Instruction_MotherBrainBody_MoveBodyUpBy10_ScrollLeftBy4          ;A999B0;
    dw $0010,ExtendedSpritemap_MotherBrainBody_Uncrouching               ;A999B2;
    dw Instruction_MotherBrainBody_MoveBodyUpBy16_ScrollLeftBy4          ;A999B6;
    dw $0010,ExtendedSpritemap_MotherBrainBody_LeaningDown               ;A999B8;
    dw Instruction_MotherBrainBody_MoveBodyUpBy12_ScrollRightBy2         ;A999BC;
    dw $0010,ExtendedSpritemap_MotherBrainBody_Standing                  ;A999BE;
    dw Instruction_MotherBrainBody_SetPoseToStanding                     ;A999C2;
    dw Common_Instruction_Sleep                                          ;A999C4;


;;; $99C6: Instruction list - Mother Brain body - standing up after crouching - fast ;;;
InstList_MotherBrainBody_StandingUpAfterCrouching_Fast:
    dw Instruction_MotherBrainBody_SetPoseToCrouchingTransition          ;A999C6;
    dw $0008,ExtendedSpritemap_MotherBrainBody_Crouched                  ;A999C8;
    dw Instruction_MotherBrainBody_MoveBodyUpBy10_ScrollLeftBy4          ;A999CC;
    dw $0008,ExtendedSpritemap_MotherBrainBody_Uncrouching               ;A999CE;
    dw Instruction_MotherBrainBody_MoveBodyUpBy16_ScrollLeftBy4          ;A999D2;
    dw $0008,ExtendedSpritemap_MotherBrainBody_LeaningDown               ;A999D4;
    dw Instruction_MotherBrainBody_MoveBodyUpBy12_ScrollRightBy2         ;A999D8;
    dw $0008,ExtendedSpritemap_MotherBrainBody_Standing                  ;A999DA;
    dw Instruction_MotherBrainBody_SetPoseToStanding                     ;A999DE;
    dw Common_Instruction_Sleep                                          ;A999E0;


;;; $99E2: Instruction list - Mother Brain body - standing up after leaning down ;;;
InstList_MotherBrainBody_StandingUpAfterLeaningDown:
    dw Instruction_MotherBrainBody_SetPoseToCrouchingTransition          ;A999E2;
    dw $0008,ExtendedSpritemap_MotherBrainBody_LeaningDown               ;A999E4;
    dw Instruction_MotherBrainBody_MoveBodyUpBy12_ScrollRightBy2         ;A999E8;
    dw $0008,ExtendedSpritemap_MotherBrainBody_Standing                  ;A999EA;
    dw Instruction_MotherBrainBody_SetPoseToStanding                     ;A999EE;
    dw Common_Instruction_Sleep                                          ;A999F0;


;;; $99F2: Instruction list - Mother Brain body - leaning down ;;;
InstList_MotherBrainBody_LeaningDown:
    dw Instruction_MotherBrainBody_SetPoseToCrouchingTransition          ;A999F2;
    dw $0008,ExtendedSpritemap_MotherBrainBody_Standing                  ;A999F4;
    dw Instruction_MotherBrainBody_MoveBodyDownBy12_ScrollLeftBy4        ;A999F8;
    dw Instruction_MotherBrainBody_SetPoseToLeaningDown                  ;A999FA;
    dw $0008,ExtendedSpritemap_MotherBrainBody_LeaningDown               ;A999FC;
    dw Common_Instruction_Sleep                                          ;A99A00;


;;; $9A02: Instruction list - Mother Brain body - crouched ;;;
InstList_MotherBrainBody_Crouched:
    dw Instruction_MotherBrainBody_SetPoseToCrouching                    ;A99A02;
    dw $0008,ExtendedSpritemap_MotherBrainBody_Crouched                  ;A99A04;
    dw Common_Instruction_Sleep                                          ;A99A08;


;;; $9A0A: Instruction list - Mother Brain body - crouch - slow ;;;
InstList_MotherBrainBody_Crouch_Slow:
    dw Instruction_MotherBrainBody_SetPoseToCrouchingTransition          ;A99A0A;
    dw $0008,ExtendedSpritemap_MotherBrainBody_Standing                  ;A99A0C;
    dw Instruction_MotherBrainBody_MoveBodyDownBy12_ScrollLeftBy4        ;A99A10;
    dw $0008,ExtendedSpritemap_MotherBrainBody_LeaningDown               ;A99A12;
    dw Instruction_MotherBrainBody_MoveBodyDownBy16_ScrollRightBy2       ;A99A16;
    dw $0008,ExtendedSpritemap_MotherBrainBody_Uncrouching               ;A99A18;
    dw Instruction_MotherBrainBody_MoveBodyDownBy10_ScrollRightBy2       ;A99A1C;
    dw Instruction_MotherBrainBody_SetPoseToCrouching                    ;A99A1E;
    dw $0008,ExtendedSpritemap_MotherBrainBody_Crouched                  ;A99A20;
    dw Common_Instruction_Sleep                                          ;A99A24;


;;; $9A26: Instruction list - Mother Brain body - crouch - fast ;;;
InstList_MotherBrainBody_Crouch_Fast:
    dw Instruction_MotherBrainBody_SetPoseToCrouchingTransition          ;A99A26;
    dw $0008,ExtendedSpritemap_MotherBrainBody_Standing                  ;A99A28;
    dw Instruction_MotherBrainBody_MoveBodyDownBy12_ScrollLeftBy4        ;A99A2C;
    dw $0002,ExtendedSpritemap_MotherBrainBody_LeaningDown               ;A99A2E;
    dw Instruction_MotherBrainBody_MoveBodyDownBy16_ScrollRightBy2       ;A99A32;
    dw $0002,ExtendedSpritemap_MotherBrainBody_Uncrouching               ;A99A34;
    dw Instruction_MotherBrainBody_MoveBodyDownBy10_ScrollRightBy2       ;A99A38;
    dw Instruction_MotherBrainBody_SetPoseToCrouching                    ;A99A3A;
    dw $0008,ExtendedSpritemap_MotherBrainBody_Crouched                  ;A99A3C;
    dw Common_Instruction_Sleep                                          ;A99A40;


;;; $9A42: Instruction list - Mother Brain body - death beam mode ;;;
InstList_MotherBrainBody_DeathBeamMode:
    dw Instruction_MotherBrainBody_SetPoseToDeathBeamMode                ;A99A42;
    dw $0001,ExtendedSpritemap_MotherBrainBody_Standing                  ;A99A44;
    dw $0001,ExtendedSpritemap_MotherBrainBrain_DeathBeamMode_0          ;A99A48;
    dw $0001,ExtendedSpritemap_MotherBrainBrain_DeathBeamMode_1          ;A99A4C;
    dw Instruction_MotherBrainBody_SpawnDustCloudExplosionProj           ;A99A50;
    dw $0024,$FFD8,$0001                                                 ;A99A52;
    dw $0001,ExtendedSpritemap_MotherBrainBrain_DeathBeamMode_1
    dw Instruction_MotherBrainBody_SpawnDustCloudExplosionProj           ;A99A5C;
    dw $0022,$FFD6,$0002                                                 ;A99A5E;
    dw $0001,ExtendedSpritemap_MotherBrainBrain_DeathBeamMode_1
    dw Instruction_MotherBrainBody_SpawnDustCloudExplosionProj           ;A99A68;
    dw $0024,$FFD8,$0001                                                 ;A99A6A;
    dw $0001,ExtendedSpritemap_MotherBrainBrain_DeathBeamMode_1
    dw Instruction_MotherBrainBody_SpawnDustCloudExplosionProj           ;A99A74;
    dw $0022,$FFD6,$0002                                                 ;A99A76;
    dw $0001,ExtendedSpritemap_MotherBrainBrain_DeathBeamMode_1
    dw Instruction_MotherBrainBody_SpawnDustCloudExplosionProj           ;A99A80;
    dw $0024,$FFD8,$0001                                                 ;A99A82;
    dw $0001,ExtendedSpritemap_MotherBrainBrain_DeathBeamMode_1
    dw Instruction_MotherBrainBody_SpawnDustCloudExplosionProj           ;A99A8C;
    dw $0022,$FFD6,$0002                                                 ;A99A8E;
    dw $0001,ExtendedSpritemap_MotherBrainBrain_DeathBeamMode_1
    dw Instruction_MotherBrainBody_SpawnDustCloudExplosionProj           ;A99A98;
    dw $0024,$FFD8,$0001                                                 ;A99A9A;
    dw $0001,ExtendedSpritemap_MotherBrainBrain_DeathBeamMode_1
    dw Instruction_MotherBrainBody_SpawnDustCloudExplosionProj           ;A99AA4;
    dw $0022,$FFD6,$0002                                                 ;A99AA6;
    dw $0001,ExtendedSpritemap_MotherBrainBrain_DeathBeamMode_1
    dw $0001,ExtendedSpritemap_MotherBrainBrain_DeathBeamMode_1          ;A99AB0;
    dw Instruction_MotherBrainBody_SpawnDeathBeamProjectile              ;A99AB4;
    dw $0001,ExtendedSpritemap_MotherBrainBrain_DeathBeamMode_2          ;A99AB6;
    dw $0001,ExtendedSpritemap_MotherBrainBrain_DeathBeamMode_3          ;A99ABA;
    dw $00F0,ExtendedSpritemap_MotherBrainBody_Standing                  ;A99ABE;
    dw Instruction_MotherBrainBody_IncrementDeathBeamAttackPhase         ;A99AC2;
    dw Instruction_MotherBrainBody_SetPoseToStanding                     ;A99AC4;
    dw Common_Instruction_Sleep                                          ;A99AC6;


;;; $9AC8: Instruction - spawn enemy projectile $E509 to offset ([[Y]], [[Y] + 2]) with parameter [[Y] + 4] ;;;
Instruction_MotherBrainBody_SpawnDustCloudExplosionProj:
; Offset is relative to Mother Brain body position
    PHY                                                                  ;A99AC8;
    PHX                                                                  ;A99AC9;
    LDA.W $0000,Y                                                        ;A99ACA;
    CLC                                                                  ;A99ACD;
    ADC.W Enemy.XPosition                                                ;A99ACE;
    STA.B DP_Temp12                                                      ;A99AD1;
    LDA.W $0002,Y                                                        ;A99AD3;
    CLC                                                                  ;A99AD6;
    ADC.W Enemy.YPosition                                                ;A99AD7;
    STA.B DP_Temp14                                                      ;A99ADA;
    LDA.W $0004,Y                                                        ;A99ADC;
    LDY.W #EnemyProjectile_MiscDust                                      ;A99ADF;
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics                  ;A99AE2;
    PLX                                                                  ;A99AE6;
    PLY                                                                  ;A99AE7;
    INY                                                                  ;A99AE8;
    INY                                                                  ;A99AE9;
    INY                                                                  ;A99AEA;
    INY                                                                  ;A99AEB;
    INY                                                                  ;A99AEC;
    INY                                                                  ;A99AED;
    RTL                                                                  ;A99AEE;


;;; $9AEF: Instruction - spawn death beam enemy projectile ;;;
Instruction_MotherBrainBody_SpawnDeathBeamProjectile:
    PHX                                                                  ;A99AEF;
    PHY                                                                  ;A99AF0;
    LDA.W #$0063                                                         ;A99AF1;
    JSL.L QueueSound_Lib2_Max6                                           ;A99AF4;
    LDX.W #$0040                                                         ;A99AF8;
    LDY.W #EnemyProjectile_MotherBrainRedBeam_Charging                   ;A99AFB;
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics                     ;A99AFE;
    PLY                                                                  ;A99B02;
    PLX                                                                  ;A99B03;
    RTL                                                                  ;A99B04;


;;; $9B05: Instruction - increment Mother Brain death beam attack phase ;;;
Instruction_MotherBrainBody_IncrementDeathBeamAttackPhase:
    LDA.L MotherBrainBody.deathBeamAttackPhase                           ;A99B05;
    INC                                                                  ;A99B09;
    STA.L MotherBrainBody.deathBeamAttackPhase                           ;A99B0A;
    RTL                                                                  ;A99B0E;


;;; $9B0F: Instruction - go to [[X]] ;;;
Instruction_MotherBrain_GotoX:
    LDA.W $0000,X                                                        ;A99B0F;
    TAX                                                                  ;A99B12;
    RTS                                                                  ;A99B13;


;;; $9B14: Instruction - enable Mother Brain neck movement and go to [[X]] ;;;
Instruction_MotherBrainHead_EnableNeckMovement_GotoX:
    LDA.W #$0001                                                         ;A99B14;
    STA.L MotherBrainBody.enableNeckMovementFlag                         ;A99B17;
    LDA.W $0000,X                                                        ;A99B1B;
    TAX                                                                  ;A99B1E;
    RTS                                                                  ;A99B1F;


;;; $9B20: Instruction - disable Mother Brain neck movement ;;;
Instruction_MotherBrainHead_DisableNeckMovement:
    LDA.W #$0000                                                         ;A99B20;
    STA.L MotherBrainBody.enableNeckMovementFlag                         ;A99B23;
    RTS                                                                  ;A99B27;


;;; $9B28: Instruction - queue sound [[X]], sound library 2, max queued sounds allowed = 6 ;;;
Instruction_MotherBrainHead_QueueSoundX_Lib2_Max6:
    LDA.W $0000,X                                                        ;A99B28;
    JSL.L QueueSound_Lib2_Max6                                           ;A99B2B;
    INX                                                                  ;A99B2F;
    INX                                                                  ;A99B30;
    RTS                                                                  ;A99B31;


;;; $9B32: Instruction - queue sound [[X]], sound library 3, max queued sounds allowed = 6 ;;;
Instruction_MotherBrainHead_QueueSoundX_Lib3_Max6:
    LDA.W $0000,X                                                        ;A99B32;
    JSL.L QueueSound_Lib3_Max6                                           ;A99B35;
    INX                                                                  ;A99B39;
    INX                                                                  ;A99B3A;
    RTS                                                                  ;A99B3B;


;;; $9B3C: Instruction - spawn Mother Brain's drool enemy projectile ;;;
Instruction_MotherBrainHead_SpawnDroolProjectile:
    LDA.L MotherBrainBody.enableDroolGenerationFlag                      ;A99B3C;
    BEQ .return                                                          ;A99B40;
    PHY                                                                  ;A99B42;
    LDA.L MotherBrainBody.droolProjectileParam                           ;A99B43;
    INC                                                                  ;A99B47;
    CMP.W #$0006                                                         ;A99B48;
    BMI +                                                                ;A99B4B;
    LDA.W #$0000                                                         ;A99B4D;

+   STA.L MotherBrainBody.droolProjectileParam                           ;A99B50;
    LDY.W #EnemyProjectile_MotherBrainDrool                              ;A99B54;
    LDA.L MotherBrainBody.neckAngleDelta                                 ;A99B57;
    CMP.W #$0080                                                         ;A99B5B;
    BMI .lessThan80                                                      ;A99B5E;
    LDY.W #EnemyProjectile_MotherBrainDyingDrool                         ;A99B60;

  .lessThan80:
    LDA.L MotherBrainBody.droolProjectileParam                           ;A99B63;
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics                  ;A99B67;
    PLY                                                                  ;A99B6B;

  .return:
    RTS                                                                  ;A99B6C;


;;; $9B6D: Instruction - spawn Mother Brain's purple breath - big enemy projectile ;;;
Instruction_MotherBrainHead_SpawnPurpleBreathBigProjectile:
    PHY                                                                  ;A99B6D;
    LDY.W #EnemyProjectile_MotherBrainPurpleBreath_Big                   ;A99B6E;
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics                  ;A99B71;
    PLY                                                                  ;A99B75;
    RTS                                                                  ;A99B76;


;;; $9B77: Instruction - Mother Brain brain main shake timer = 50 ;;;
Instruction_MotherBrainHead_SetMainShakeTimerTo50:
    LDA.W #$0032                                                         ;A99B77;
    STA.L MotherBrainBody.brainMainShakeTimer                            ;A99B7A;
    RTS                                                                  ;A99B7E;


;;; $9B7F: Instruction list - Mother Brain brain - stretching - phase 2 ;;;
InstList_MotherBrainHead_Stretching_Phase2_0:
    dw Instruction_MotherBrainHead_SetMainShakeTimerTo50                 ;A99B7F;
    dw $0002,Spritemaps_MotherBrain_2                                    ;A99B81;
    dw $0002,Spritemaps_MotherBrain_3                                    ;A99B85;
    dw Instruction_MotherBrainHead_SpawnDroolProjectile                  ;A99B89;
    dw $0002,Spritemaps_MotherBrain_3                                    ;A99B8B;
    dw Instruction_MotherBrainHead_SpawnPurpleBreathBigProjectile        ;A99B8F;
    dw Instruction_MotherBrainHead_QueueSoundX_Lib2_Max6,$007E           ;A99B91;
    dw Instruction_MotherBrainHead_SpawnDroolProjectile                  ;A99B95;
    dw $0010,Spritemaps_MotherBrain_4                                    ;A99B97;
    dw Instruction_MotherBrainHead_SpawnDroolProjectile                  ;A99B9B;
    dw $0010,Spritemaps_MotherBrain_4                                    ;A99B9D;
    dw Instruction_MotherBrainHead_SpawnDroolProjectile                  ;A99BA1;
    dw $0020,Spritemaps_MotherBrain_4                                    ;A99BA3;
    dw $0004,Spritemaps_MotherBrain_3                                    ;A99BA7;

InstList_MotherBrainHead_Stretching_Phase2_1:
    dw $0001,Spritemaps_MotherBrain_2                                    ;A99BAB;
    dw Instruction_MotherBrain_GotoX                                     ;A99BAF;
    dw InstList_MotherBrainHead_Stretching_Phase2_1                      ;A99BB1;


;;; $9BB3: Instruction list - Mother Brain brain - stretching - phase 3 ;;;
InstList_MotherBrainHead_Stretching_Phase3_0:
    dw Instruction_MotherBrainHead_SetMainShakeTimerTo50                 ;A99BB3;
    dw $0002,Spritemaps_MotherBrain_8                                    ;A99BB5;
    dw $0002,Spritemaps_MotherBrain_9                                    ;A99BB9;
    dw Instruction_MotherBrainHead_SpawnDroolProjectile                  ;A99BBD;
    dw $0002,Spritemaps_MotherBrain_9                                    ;A99BBF;
    dw Instruction_MotherBrainHead_SpawnPurpleBreathBigProjectile        ;A99BC3;
    dw Instruction_MotherBrainHead_QueueSoundX_Lib2_Max6,$007E           ;A99BC5;
    dw Instruction_MotherBrainHead_SpawnDroolProjectile                  ;A99BC9;
    dw $0010,Spritemaps_MotherBrain_A                                    ;A99BCB;
    dw Instruction_MotherBrainHead_SpawnDroolProjectile                  ;A99BCF;
    dw $0010,Spritemaps_MotherBrain_A                                    ;A99BD1;
    dw Instruction_MotherBrainHead_SpawnDroolProjectile                  ;A99BD5;
    dw $0020,Spritemaps_MotherBrain_A                                    ;A99BD7;
    dw $0004,Spritemaps_MotherBrain_9                                    ;A99BDB;

InstList_MotherBrainHead_Stretching_Phase3_1:
    dw $0001,Spritemaps_MotherBrain_8                                    ;A99BDF;
    dw Instruction_MotherBrain_GotoX                                     ;A99BE3;
    dw InstList_MotherBrainHead_Stretching_Phase3_1                      ;A99BE5;


;;; $9BE7: Instruction list - Mother Brain brain - hyper beam recoil ;;;
InstList_MotherBrainHead_HyperBeamRecoil_0:
    dw Instruction_MotherBrainHead_SetMainShakeTimerTo50                 ;A99BE7;
    dw $0002,Spritemaps_MotherBrain_8                                    ;A99BE9;
    dw $0002,Spritemaps_MotherBrain_9                                    ;A99BED;
    dw $0002,Spritemaps_MotherBrain_9                                    ;A99BF1;
    dw Instruction_MotherBrainHead_SpawnPurpleBreathBigProjectile        ;A99BF5;
    dw Instruction_MotherBrainHead_QueueSoundX_Lib2_Max6,$007E           ;A99BF7;
    dw $0010,Spritemaps_MotherBrain_A                                    ;A99BF9;
    dw $0010,Spritemaps_MotherBrain_A                                    ;A99BFF;
    dw $0020,Spritemaps_MotherBrain_A                                    ;A99C03;
    dw $0004,Spritemaps_MotherBrain_9                                    ;A99C07;

InstList_MotherBrainHead_HyperBeamRecoil_1:
    dw $0001,Spritemaps_MotherBrain_8                                    ;A99C0B;
    dw Instruction_MotherBrain_GotoX                                     ;A99C0F;
    dw InstList_MotherBrainHead_HyperBeamRecoil_1                        ;A99C11;


;;; $9C13: Instruction list - Mother Brain body - initial (dummy) ;;;
InstList_MotherBrainHead_InitialDummy:
    dw $0000,UNUSED_ExtendedSpritemap_MotherBrainBrain_A9A320            ;A99C13;
    dw Common_Instruction_Sleep                                          ;A99C17;


if !FEATURE_KEEP_UNREFERENCED
;;; $9C19: Unused. Instruction list - Mother Brain brain ;;;
UNUSED_InstList_MotherBrainHead_A99C19:
    dw $0008,Spritemaps_MotherBrain_2                                    ;A99C19;
    dw $0004,Spritemaps_MotherBrain_1                                    ;A99C1D;
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $9C21: Instruction list - Mother Brain brain - initial ;;;
InstList_MotherBrainHead_Initial:
    dw $0004,Spritemaps_MotherBrain_0                                    ;A99C21;
    dw Instruction_MotherBrain_GotoX                                     ;A99C25;
    dw InstList_MotherBrainHead_Initial                                  ;A99C27;


;;; $9C29: Instruction list - Mother Brain brain - decapitated ;;;
InstList_MotherBrainHead_Decapitated_0:
    dw $0008,Spritemaps_MotherBrain_8                                    ;A99C29;
    dw $0004,Spritemaps_MotherBrain_7                                    ;A99C2D;

InstList_MotherBrainHead_Decapitated_1:
    dw $0004,Spritemaps_MotherBrain_6                                    ;A99C31;
    dw Instruction_MotherBrain_GotoX                                     ;A99C35;
    dw InstList_MotherBrainHead_Decapitated_1                            ;A99C37;


;;; $9C39: Instruction list - Mother Brain brain - dying drool ;;;
InstList_MotherBrainHead_DyingDrool_0:
    dw Instruction_MotherBrainHead_SetMainShakeTimerTo50                 ;A99C39;
    dw $0004,Spritemaps_MotherBrain_8                                    ;A99C3B;
    dw $0004,Spritemaps_MotherBrain_9                                    ;A99C3F;
    dw Instruction_MotherBrainHead_QueueSoundX_Lib2_Max6,$007E           ;A99C43;

InstList_MotherBrainHead_DyingDrool_1:
    dw $0002,Spritemaps_MotherBrain_A                                    ;A99C47;
    dw Instruction_MotherBrainHead_SpawnDroolProjectile                  ;A99C4B;
    dw $0002,Spritemaps_MotherBrain_A                                    ;A99C4D;
    dw Instruction_MotherBrainHead_SpawnDroolProjectile                  ;A99C51;
    dw $0002,Spritemaps_MotherBrain_A                                    ;A99C53;
    dw Instruction_MotherBrainHead_SpawnDroolProjectile                  ;A99C57;
    dw $0002,Spritemaps_MotherBrain_A                                    ;A99C59;
    dw Instruction_MotherBrainHead_SpawnDroolProjectile                  ;A99C5D;

InstList_MotherBrainHead_DyingDrool_2:
    dw $0002,Spritemaps_MotherBrain_A                                    ;A99C5F;
    dw Instruction_MotherBrainHead_GotoDyingDroolInstList                ;A99C63;


;;; $9C65: Instruction - go to $9C5F or occasionally $9C47 ;;;
Instruction_MotherBrainHead_GotoDyingDroolInstList:
    LDX.W #InstList_MotherBrainHead_DyingDrool_2                         ;A99C65;
    LDA.W RandomNumberSeed                                               ;A99C68;
    AND.W #$0FFF                                                         ;A99C6B;
    CMP.W #$0FE0                                                         ;A99C6E;
    BCC .return                                                          ;A99C71;
    LDX.W #InstList_MotherBrainHead_DyingDrool_1                         ;A99C73;

  .return:
    RTS                                                                  ;A99C76;


;;; $9C77: Instruction list - Mother Brain brain - firing rainbow beam ;;;
InstList_MotherBrainHead_FiringRainbowBeam:
    dw $0001,Spritemaps_MotherBrain_2                                    ;A99C77;
    dw Instruction_MotherBrain_GotoX                                     ;A99C7B;
    dw InstList_MotherBrainHead_FiringRainbowBeam                        ;A99C7D;


if !FEATURE_KEEP_UNREFERENCED
;;; $9C7F: Unused. Instruction list - Mother Brain brain ;;;
UNUSED_InstList_MotherBrainHead_A99C7F:
    dw $0001,Spritemaps_MotherBrain_8                                    ;A99C7F;
    dw Instruction_MotherBrain_GotoX                                     ;A99C83;
    dw UNUSED_InstList_MotherBrainHead_A99C7F                            ;A99C85;
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $9C87: Instruction list - Mother Brain brain - neutral - phase 2 ;;;
; Includes firing death beam (which is done by body)
InstList_MotherBrainHead_Neutral_Phase2_0:
    dw $0004,Spritemaps_MotherBrain_0                                    ;A99C87;
    dw $0004,Spritemaps_MotherBrain_1                                    ;A99C8B;
    dw $0008,Spritemaps_MotherBrain_2                                    ;A99C8F;
    dw $0004,Spritemaps_MotherBrain_1                                    ;A99C93;
    dw $0004,Spritemaps_MotherBrain_0                                    ;A99C97;
    dw $0004,Spritemaps_MotherBrain_1                                    ;A99C9B;

InstList_MotherBrainHead_Neutral_Phase2_1:
    dw $0008,Spritemaps_MotherBrain_2                                    ;A99C9F;
    dw Instruction_MotherBrainHead_MaybeGotoNeutralPhase2                ;A99CA3;
    dw $0004,Spritemaps_MotherBrain_1                                    ;A99CA5;
    dw Instruction_MotherBrain_GotoX                                     ;A99CA9;
    dw InstList_MotherBrainHead_Neutral_Phase2_0                         ;A99CAB;


;;; $9CAD: Instruction - likely go to $9C9F ;;;
Instruction_MotherBrainHead_MaybeGotoNeutralPhase2:
    LDA.W RandomNumberSeed                                               ;A99CAD;
    CMP.W #$F000                                                         ;A99CB0;
    BCS .return                                                          ;A99CB3;
    LDX.W #InstList_MotherBrainHead_Neutral_Phase2_1                     ;A99CB5;

  .return:
    RTS                                                                  ;A99CB8;


;;; $9CB9: Instruction list - Mother Brain brain - neutral - phase 3 ;;;
; When Shitroid is making its final stand
InstList_MotherBrainHead_Neutral_Phase3_0:
    dw $0004,Spritemaps_MotherBrain_6                                    ;A99CB9;
    dw $0004,Spritemaps_MotherBrain_7                                    ;A99CBD;
    dw $0008,Spritemaps_MotherBrain_8                                    ;A99CC1;
    dw $0004,Spritemaps_MotherBrain_7                                    ;A99CC5;
    dw $0004,Spritemaps_MotherBrain_6                                    ;A99CC9;
    dw $0004,Spritemaps_MotherBrain_7                                    ;A99CCD;

InstList_MotherBrainHead_Neutral_Phase3_1:
    dw $0008,Spritemaps_MotherBrain_8                                    ;A99CD1;
    dw $0008,Spritemaps_MotherBrain_7                                    ;A99CD5;
    dw Instruction_MotherBrainHead_MaybeGotoNeutralPhase3                ;A99CD9;
    dw $0004,Spritemaps_MotherBrain_6                                    ;A99CDB;
    dw Instruction_MotherBrain_GotoX                                     ;A99CDF;
    dw InstList_MotherBrainHead_Neutral_Phase3_0                         ;A99CE1;

if !FEATURE_KEEP_UNREFERENCED
UNUSED_InstList_MotherBrainHead_Neutral_Phase3_A99CE3:
; Unused branch
    dw $0004,Spritemaps_MotherBrain_8                                    ;A99CE3;
    dw $0004,Spritemaps_MotherBrain_9                                    ;A99CE7;
    dw $0002,Spritemaps_MotherBrain_A                                    ;A99CEB;
    dw Instruction_MotherBrainHead_QueueSoundX_Lib2_Max6,$006F           ;A99CEF;
    dw $0002,Spritemaps_MotherBrain_A                                    ;A99CF1;
    dw $0002,Spritemaps_MotherBrain_A                                    ;A99CF7;
    dw $0002,Spritemaps_MotherBrain_A                                    ;A99CFB;
    dw $0002,Spritemaps_MotherBrain_A                                    ;A99CFF;
    dw $0004,Spritemaps_MotherBrain_9                                    ;A99D03;
    dw $0004,Spritemaps_MotherBrain_8                                    ;A99D07;
    dw Instruction_MotherBrainHead_GotoNeutralPhase3                     ;A99D0B;
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $9D0D: Instruction - likely go to $9CD1 ;;;
Instruction_MotherBrainHead_MaybeGotoNeutralPhase3:
; If [random number] & FFFh < EC0h:
;     X = $9CD1

; If $9D16 were a BCC, Mother Brain would do a cry sound effect occasionally whilst Shitroid makes its final stand
    LDA.W RandomNumberSeed                                               ;A99D0D;
    AND.W #$0FFF                                                         ;A99D10;
    CMP.W #$0F40                                                         ;A99D13;
    BRA +                                                                ;A99D16;

if !FEATURE_KEEP_UNREFERENCED
    LDX.W #UNUSED_InstList_MotherBrainHead_Neutral_Phase3_A99CE3         ;A99D18;
    RTS                                                                  ;A99D1B;
endif ; !FEATURE_KEEP_UNREFERENCED

+   CMP.W #$0EC0                                                         ;A99D1C;
    BCS Instruction_MotherBrainHead_GotoNeutralPhase3_return             ;A99D1F; fallthrough to Instruction_MotherBrainHead_GotoNeutralPhase3


;;; $9D21: Instruction - go to $9CD1 ;;;
Instruction_MotherBrainHead_GotoNeutralPhase3:
    LDX.W #InstList_MotherBrainHead_Neutral_Phase3_1                     ;A99D21;

  .return:
    RTS                                                                  ;A99D24;


;;; $9D25: Instruction list - Mother Brain brain - corpse ;;;
InstList_MotherBrainHead_Corpse_0:
    dw $0002,Spritemaps_MotherBrain_6                                    ;A99D25;
    dw $0002,Spritemaps_MotherBrain_7                                    ;A99D29;
    dw $0040,Spritemaps_MotherBrain_8                                    ;A99D2D;
    dw $0040,Spritemaps_MotherBrain_18                                   ;A99D31;

InstList_MotherBrainHead_Corpse_1:
    dw $0002,Spritemaps_MotherBrain_19                                   ;A99D35;
    dw Instruction_MotherBrain_GotoX                                     ;A99D39;
    dw InstList_MotherBrainHead_Corpse_1                                 ;A99D3B;


;;; $9D3D: Instruction list - Mother Brain brain - attacking - four blue rings - phase 2 ;;;
InstList_MotherBrainHead_Attacking_4OnionRings_Phase2:
    dw Instruction_MotherBrainHead_DisableNeckMovement                   ;A99D3D;
    dw $0004,Spritemaps_MotherBrain_2                                    ;A99D3F;
    dw $0004,Spritemaps_MotherBrain_3                                    ;A99D43;
    dw Instruction_MotherBrainHead_QueueSoundX_Lib2_Max6,$006F           ;A99D47;
    dw $0008,Spritemaps_MotherBrain_4                                    ;A99D49;
    dw Instruction_MotherBrainHead_AimOnionRingsAtSamus                  ;A99D4F;
    dw Instruction_MotherBrainHead_SpawnOnionRingsProjectile             ;A99D51;
    dw Instruction_MotherBrainHead_QueueSoundX_Lib3_Max6,$0017           ;A99D53;
    dw $0003,Spritemaps_MotherBrain_4                                    ;A99D55;
    dw Instruction_MotherBrainHead_AimOnionRingsAtSamus                  ;A99D5B;
    dw Instruction_MotherBrainHead_SpawnOnionRingsProjectile             ;A99D5D;
    dw $0003,Spritemaps_MotherBrain_4                                    ;A99D5F;
    dw Instruction_MotherBrainHead_AimOnionRingsAtSamus                  ;A99D63;
    dw Instruction_MotherBrainHead_SpawnOnionRingsProjectile             ;A99D65;
    dw $0003,Spritemaps_MotherBrain_4                                    ;A99D67;
    dw Instruction_MotherBrainHead_AimOnionRingsAtSamus                  ;A99D6B;
    dw Instruction_MotherBrainHead_SpawnOnionRingsProjectile             ;A99D6D;
    dw $0010,Spritemaps_MotherBrain_4                                    ;A99D6F;
    dw $0004,Spritemaps_MotherBrain_3                                    ;A99D73;
    dw $0010,Spritemaps_MotherBrain_2                                    ;A99D77;
    dw Instruction_MotherBrainHead_EnableNeckMovement_GotoX              ;A99D7B;
    dw InstList_MotherBrainHead_Neutral_Phase2_0                         ;A99D7D;


;;; $9D7F: Instruction list - Mother Brain brain - attacking - two blue rings - phase 2 ;;;
InstList_MotherBrainHead_Attacking_2OnionRings_Phase2:
    dw Instruction_MotherBrainHead_DisableNeckMovement                   ;A99D7F;
    dw $0004,Spritemaps_MotherBrain_2                                    ;A99D81;
    dw $0004,Spritemaps_MotherBrain_3                                    ;A99D85;
    dw Instruction_MotherBrainHead_QueueSoundX_Lib2_Max6,$006F           ;A99D89;
    dw $0008,Spritemaps_MotherBrain_4                                    ;A99D8B;
    dw Instruction_MotherBrainHead_AimOnionRingsAtSamus                  ;A99D91;
    dw Instruction_MotherBrainHead_SpawnOnionRingsProjectile             ;A99D93;
    dw Instruction_MotherBrainHead_QueueSoundX_Lib3_Max6,$0017           ;A99D95;
    dw $0003,Spritemaps_MotherBrain_4                                    ;A99D97;
    dw Instruction_MotherBrainHead_AimOnionRingsAtSamus                  ;A99D9D;
    dw Instruction_MotherBrainHead_SpawnOnionRingsProjectile             ;A99D9F;
    dw $0010,Spritemaps_MotherBrain_4                                    ;A99DA1;
    dw $0004,Spritemaps_MotherBrain_3                                    ;A99DA5;
    dw $0010,Spritemaps_MotherBrain_2                                    ;A99DA9;
    dw Instruction_MotherBrainHead_EnableNeckMovement_GotoX              ;A99DAD;
    dw InstList_MotherBrainHead_Neutral_Phase2_0                         ;A99DAF;


;;; $9DB1: Instruction list - Mother Brain brain - attacking Shitroid ;;;
InstList_MotherBrainHead_Attacking_BabyMetroid:
    dw Instruction_MotherBrainHead_IncBabyMetroidAttackCounter           ;A99DB1;
    dw Instruction_MotherBrainHead_DisableNeckMovement                   ;A99DB3;
    dw Instruction_MotherBrainHead_AimOnionRingsAtBabyMetroid            ;A99DB5;
    dw Instruction_MotherBrain_GotoX                                     ;A99DB7;
    dw InstList_MotherBrainHead_Attacking_4OnionRings_Phase3             ;A99DB9;


;;; $9DBB: Instruction list - Mother Brain brain - attacking Samus - four blue rings - phase 3 ;;;
InstList_MotherBrainHead_AttackingSamus_4OnionRings_Phase3:
    dw Instruction_MotherBrainHead_ResetBabyMetroidAttackCounter         ;A99DBB;
    dw Instruction_MotherBrainHead_DisableNeckMovement                   ;A99DBD;
    dw Instruction_MotherBrainHead_AimOnionRingsAtSamus                  ;A99DBF;


;;; $9DC1: Instruction list - Mother Brain brain - attacking - four blue rings - phase 3 ;;;
InstList_MotherBrainHead_Attacking_4OnionRings_Phase3:
    dw $0004,Spritemaps_MotherBrain_8                                    ;A99DC1;
    dw $0004,Spritemaps_MotherBrain_9                                    ;A99DC5;
    dw Instruction_MotherBrainHead_QueueBabyMetroidAttackSFX             ;A99DC9;
    dw $0008,Spritemaps_MotherBrain_A                                    ;A99DCB;
    dw Instruction_MotherBrainHead_SpawnOnionRingsProjectile             ;A99DCF;
    dw Instruction_MotherBrainHead_QueueSoundX_Lib3_Max6,$0017           ;A99DD1;
    dw $0003,Spritemaps_MotherBrain_A                                    ;A99DD3;
    dw Instruction_MotherBrainHead_SpawnOnionRingsProjectile             ;A99DD9;
    dw $0003,Spritemaps_MotherBrain_A                                    ;A99DDB;
    dw Instruction_MotherBrainHead_SpawnOnionRingsProjectile             ;A99DDF;
    dw $0003,Spritemaps_MotherBrain_A                                    ;A99DE1;
    dw Instruction_MotherBrainHead_SpawnOnionRingsProjectile             ;A99DE5;
    dw $0010,Spritemaps_MotherBrain_A                                    ;A99DE7;
    dw $0004,Spritemaps_MotherBrain_9                                    ;A99DEB;
    dw $0010,Spritemaps_MotherBrain_8                                    ;A99DEF;
    dw Instruction_MotherBrainHead_EnableNeckMovement_GotoX              ;A99DF3;
    dw InstList_MotherBrainHead_Neutral_Phase3_0                         ;A99DF5;


;;; $9DF7: Instruction - queue Shitroid attack sound effect ;;;
Instruction_MotherBrainHead_QueueBabyMetroidAttackSFX:
    PHY                                                                  ;A99DF7;
    LDA.L MotherBrainBody.BabyMetroidAttackCounter                       ;A99DF8;
    CMP.W #$000B                                                         ;A99DFC;
    BEQ .return                                                          ;A99DFF;
    LDA.W #$0000                                                         ;A99E01;
    ASL                                                                  ;A99E04;
    TAY                                                                  ;A99E05;
    LDA.W .sfx,Y                                                         ;A99E06;
    JSL.L QueueSound_Lib2_Max6                                           ;A99E09;

  .return:
    PLY                                                                  ;A99E0D;
    RTS                                                                  ;A99E0E;

  .sfx:
; (Should be) indexed by [Mother Brain Baby Metroid attack counter]
; 6Fh: Mother Brain's cry - low pitch
; 7Eh: Mother Brain's cry - high pitch
    dw $006F,$006F,$006F,$007E,$006F,$006F,$007E,$006F                   ;A99E0F;
    dw $006F,$007E,$007E,$006F,$006F                                     ;A99E1F;


;;; $9E29: Instruction - spawn Mother Brain blue ring enemy projectile ;;;
Instruction_MotherBrainHead_SpawnOnionRingsProjectile:
    PHY                                                                  ;A99E29;
    LDY.W #EnemyProjectile_MotherBrainOnionRings                         ;A99E2A;
    LDA.L MotherBrainBody.onionRingsTargetAngle                          ;A99E2D;
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics                  ;A99E31;
    PLY                                                                  ;A99E35;
    RTS                                                                  ;A99E36;


;;; $9E37: Instruction - aim Mother Brain blue rings at Shitroid ;;;
Instruction_MotherBrainHead_AimOnionRingsAtBabyMetroid:
    PHX                                                                  ;A99E37;
    PHY                                                                  ;A99E38;
    LDA.L MotherBrainBody.BabyMetroidEnemyIndex                          ;A99E39;
    TAX                                                                  ;A99E3D;
    LDA.W Enemy.XPosition,X                                              ;A99E3E;
    SEC                                                                  ;A99E41;
    SBC.W Enemy[1].XPosition                                             ;A99E42;
    SEC                                                                  ;A99E45;
    SBC.W #$000A                                                         ;A99E46;
    STA.B DP_Temp12                                                      ;A99E49;
    LDA.W Enemy.YPosition,X                                              ;A99E4B;
    SEC                                                                  ;A99E4E;
    SBC.W Enemy[1].YPosition                                             ;A99E4F;
    SEC                                                                  ;A99E52;
    SBC.W #$0010                                                         ;A99E53;
    STA.B DP_Temp14                                                      ;A99E56;
    JMP.W AimMotherBrainOnionRings                                       ;A99E58;


;;; $9E5B: Instruction - aim Mother Brain blue rings at Samus ;;;
Instruction_MotherBrainHead_AimOnionRingsAtSamus:
    PHX                                                                  ;A99E5B;
    PHY                                                                  ;A99E5C;
    LDA.W SamusXPosition                                                 ;A99E5D;
    SEC                                                                  ;A99E60;
    SBC.W Enemy[1].XPosition                                             ;A99E61;
    SEC                                                                  ;A99E64;
    SBC.W #$000A                                                         ;A99E65;
    STA.B DP_Temp12                                                      ;A99E68;
    LDA.W SamusYPosition                                                 ;A99E6A;
    SEC                                                                  ;A99E6D;
    SBC.W Enemy[1].YPosition                                             ;A99E6E;
    SEC                                                                  ;A99E71;
    SBC.W #$0010                                                         ;A99E72;
    STA.B DP_Temp14                                                      ;A99E75; fallthrough to AimMotherBrainOnionRings


;;; $9E77: Aim Mother Brain blue rings ;;;
AimMotherBrainOnionRings:
; $7E:7834 = clamp(80h - (angle of ([$12], [$14]) offset), 10h, 40h)
    JSL.L CalculateAngleOf_12_14_Offset                                  ;A99E77;
    SEC                                                                  ;A99E7B;
    SBC.W #$0080                                                         ;A99E7C;
    EOR.W #$FFFF                                                         ;A99E7F;
    INC                                                                  ;A99E82;
    AND.W #$00FF                                                         ;A99E83;
    SEP #$20                                                             ;A99E86;
    CMP.B #$10                                                           ;A99E88;
    BPL +                                                                ;A99E8A;
    CMP.B #$C0                                                           ;A99E8C;
    BMI .upperHalf                                                       ;A99E8E;
    LDA.B #$10                                                           ;A99E90;
    BRA .merge                                                           ;A99E92;

; 10h <= [A] < 90h (-10h < angle <= 70h)
+   CMP.B #$48                                                           ;A99E94;
    BCC .merge                                                           ;A99E96;

  .upperHalf:
    LDA.B #$48                                                           ;A99E98;

  .merge:
    REP #$20                                                             ;A99E9A;
    STA.L MotherBrainBody.onionRingsTargetAngle                          ;A99E9C;
    PLY                                                                  ;A99EA0;
    PLX                                                                  ;A99EA1;
    RTS                                                                  ;A99EA2;


;;; $9EA3: Instruction - increment Mother Brain Shitroid attack counter ;;;
Instruction_MotherBrainHead_IncBabyMetroidAttackCounter:
; 12 is the max due to the Instruction_MotherBrainHead_QueueBabyMetroidAttackSFX_sfx table
    LDA.L MotherBrainBody.BabyMetroidAttackCounter                       ;A99EA3;
    INC                                                                  ;A99EA7;
    CMP.W #$000C                                                         ;A99EA8;
    BCC .notMax12                                                        ;A99EAB;
    LDA.W #$000C                                                         ;A99EAD;

  .notMax12:
    STA.L MotherBrainBody.BabyMetroidAttackCounter                       ;A99EB0;
    RTS                                                                  ;A99EB4;


;;; $9EB5: Instruction - Mother Brain Shitroid attack counter = 0 ;;;
Instruction_MotherBrainHead_ResetBabyMetroidAttackCounter:
    LDA.W #$0000                                                         ;A99EB5;
    STA.L MotherBrainBody.BabyMetroidAttackCounter                       ;A99EB8;
    RTS                                                                  ;A99EBC;


;;; $9EBD: Instruction - spawn Mother Brain bomb enemy projectile with parameter [[X]] ;;;
Instruction_MotherBrainHead_SpawnBombProjectileWithParamX:
    PHY                                                                  ;A99EBD;
    LDA.W $0000,X                                                        ;A99EBE;
    LDY.W #EnemyProjectile_MotherBrainBomb                               ;A99EC1;
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics                  ;A99EC4;
    PLY                                                                  ;A99EC8;
    INX                                                                  ;A99EC9;
    INX                                                                  ;A99ECA;
    RTS                                                                  ;A99ECB;


;;; $9ECC: Instruction list - Mother Brain brain - attacking - bomb - phase 2 ;;;
InstList_MotherBrainHead_Attacking_Bomb_Phase2:
    dw $0004,Spritemaps_MotherBrain_0                                    ;A99ECC;
    dw $0004,Spritemaps_MotherBrain_1                                    ;A99ED0;
    dw $0008,Spritemaps_MotherBrain_2                                    ;A99ED4;
    dw Instruction_MotherBrainHead_DisableNeckMovement                   ;A99ED8;
    dw $0004,Spritemaps_MotherBrain_2                                    ;A99EDA;
    dw $0004,Spritemaps_MotherBrain_3                                    ;A99EDE;
    dw Instruction_MotherBrainHead_QueueSoundX_Lib2_Max6,$006F           ;A99EE2;
    dw $0008,Spritemaps_MotherBrain_4                                    ;A99EE4;
    dw Instruction_MotherBrainHead_SpawnBombProjectileWithParamX,$0007   ;A99EEA;
    dw Instruction_MotherBrainHead_SpawnPurpleBreathBigProjectile        ;A99EEE;
    dw $0020,Spritemaps_MotherBrain_4                                    ;A99EF0;
    dw $0004,Spritemaps_MotherBrain_3                                    ;A99EF4;
    dw $0010,Spritemaps_MotherBrain_2                                    ;A99EF8;
    dw Instruction_MotherBrainHead_EnableNeckMovement_GotoX              ;A99EFC;
    dw InstList_MotherBrainHead_Neutral_Phase2_0                         ;A99EFE;


;;; $9F00: Instruction list - Mother Brain brain - attacking - bomb - phase 3 ;;;
InstList_MotherBrainHead_Attacking_Bomb_Phase3:
    dw $0004,Spritemaps_MotherBrain_6                                    ;A99F00;
    dw $0004,Spritemaps_MotherBrain_7                                    ;A99F04;
    dw $0008,Spritemaps_MotherBrain_8                                    ;A99F08;
    dw Instruction_MotherBrainHead_DisableNeckMovement                   ;A99F0C;
    dw $0004,Spritemaps_MotherBrain_8                                    ;A99F0E;
    dw $0004,Spritemaps_MotherBrain_9                                    ;A99F12;
    dw Instruction_MotherBrainHead_QueueSoundX_Lib2_Max6,$006F           ;A99F16;
    dw $0008,Spritemaps_MotherBrain_A                                    ;A99F18;
    dw Instruction_MotherBrainHead_SpawnBombProjectileWithParamX,$0001   ;A99F1E;
    dw Instruction_MotherBrainHead_SpawnPurpleBreathBigProjectile        ;A99F22;
    dw $0020,Spritemaps_MotherBrain_A                                    ;A99F24;
    dw $0004,Spritemaps_MotherBrain_9                                    ;A99F28;
    dw $0010,Spritemaps_MotherBrain_8                                    ;A99F2C;
    dw Instruction_MotherBrainHead_EnableNeckMovement_GotoX              ;A99F30;
    dw InstList_MotherBrainHead_Neutral_Phase3_0                         ;A99F32;


;;; $9F34: Instruction list - Mother Brain brain - attacking - laser ;;;
InstList_MotherBrainHead_Attacking_Laser:
    dw $0010,Spritemaps_MotherBrain_1                                    ;A99F34;
    dw $0004,Spritemaps_MotherBrain_2                                    ;A99F38;
    dw InstList_MotherBrainHead_SpawnLaserProjectile                     ;A99F3C;
    dw $0020,Spritemaps_MotherBrain_2                                    ;A99F3E;
    dw Instruction_MotherBrainHead_EnableNeckMovement_GotoX              ;A99F42;
    dw InstList_MotherBrainHead_Neutral_Phase2_0                         ;A99F44;


;;; $9F46: Instruction - spawn Mother Brain laser enemy projectile ;;;
InstList_MotherBrainHead_SpawnLaserProjectile:
    LDA.W #$0000                                                         ;A99F46;
    STA.L MotherBrainBody.enableNeckMovementFlag                         ;A99F49;
    PHY                                                                  ;A99F4D;
    LDA.W Enemy[1].XPosition                                             ;A99F4E;
    CLC                                                                  ;A99F51;
    ADC.W #$0010                                                         ;A99F52;
    STA.B DP_Temp12                                                      ;A99F55;
    LDA.W Enemy[1].YPosition                                             ;A99F57;
    CLC                                                                  ;A99F5A;
    ADC.W #$0004                                                         ;A99F5B;
    STA.B DP_Temp14                                                      ;A99F5E;
    LDA.W #$0001                                                         ;A99F60;
    LDY.W #EnemyProjectile_PirateMotherBrainLaser                        ;A99F63;
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics                  ;A99F66;
    PLY                                                                  ;A99F6A;
    RTS                                                                  ;A99F6B;


;;; $9F6C: Instruction list - Mother Brain brain - charging rainbow beam ;;;
InstList_MotherBrainHead_ChargingRainbowBeam_0:
    dw Instruction_MotherBrainHead_SetupEffectsForRainbowBeamCharge      ;A99F6C;
    dw $0004,Spritemaps_MotherBrain_2                                    ;A99F6E;
    dw $0004,Spritemaps_MotherBrain_1                                    ;A99F72;
    dw $0002,Spritemaps_MotherBrain_0                                    ;A99F76;

InstList_MotherBrainHead_ChargingRainbowBeam_1:
    dw Instruction_MotherBrainHead_SpawnRainbowBeamChargingProj          ;A99F7A;
    dw $001E,Spritemaps_MotherBrain_0                                    ;A99F7C;
    dw Instruction_MotherBrain_GotoX                                     ;A99F80;
    dw InstList_MotherBrainHead_ChargingRainbowBeam_1                    ;A99F82;


;;; $9F84: Instruction - spawn Mother Brain's rainbow beam charging enemy projectile ;;;
Instruction_MotherBrainHead_SpawnRainbowBeamChargingProj:
    PHY                                                                  ;A99F84;
    LDY.W #EnemyProjectile_MotherBrainRainbowBeam_Charging               ;A99F85;
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics                  ;A99F88;
    PLY                                                                  ;A99F8C;
    RTS                                                                  ;A99F8D;


;;; $9F8E: Instruction - set up effects for Mother Brain charging rainbow beam ;;;
Instruction_MotherBrainHead_SetupEffectsForRainbowBeamCharge:
    LDA.W #$0000                                                         ;A99F8E;
    STA.L MotherBrainBody.smallPurpleBreathGenerationEnabledFlag         ;A99F91;
    JSR.W SetupMotherBrainHeadPaletteForChargingHerLaser                 ;A99F95;
    LDA.W #$007F                                                         ;A99F98;
    JSL.L QueueSound_Lib2_Max6                                           ;A99F9B;
    RTS                                                                  ;A99F9F;


;;; $9FA0: Extended spritemap entries - Mother Brain body ;;;
ExtendedSpritemap_MotherBrainBody_Standing:
    dw $0009                                                             ;A99FA0;
    dw $0012,$003A
    dw Spritemaps_MotherBrain_13                                         ;A99FA6;
    dw Hitbox_MotherBrainBody_3                                          ;A99FA8;
    dw $001E,$001D                                                       ;A99FAA;
    dw Spritemaps_MotherBrain_F                                          ;A99FAE;
    dw Hitbox_MotherBrainBody_2                                          ;A99FB0;
    dw $0019,$001E                                                       ;A99FB2;
    dw Spritemaps_MotherBrain_11                                         ;A99FB6;
    dw Hitbox_MotherBrainBody_2                                          ;A99FB8;
    dw $0000,$FFFC                                                       ;A99FBA;
    dw Spritemaps_MotherBrain_B                                          ;A99FBE;
    dw Hitbox_MotherBrainBody_2                                          ;A99FC0;
    dw $0000,$0000                                                       ;A99FC2;
    dw ExtendedTilemaps_MotherBrain_0                                    ;A99FC6;
    dw Hitbox_MotherBrainBody_6                                          ;A99FC8;
    dw $0000,$0000                                                       ;A99FCA;
    dw ExtendedTilemaps_MotherBrain_1                                    ;A99FCE;
    dw Hitbox_MotherBrainBody_8                                          ;A99FD0;
    dw $FFF6,$0038                                                       ;A99FD2;
    dw Spritemaps_MotherBrain_17                                         ;A99FD6;
    dw Hitbox_MotherBrainBody_5                                          ;A99FD8;
    dw $0007,$001C                                                       ;A99FDA;
    dw Spritemaps_MotherBrain_15                                         ;A99FDE;
    dw Hitbox_MotherBrainBody_4                                          ;A99FE0;
    dw $0002,$001D                                                       ;A99FE2;
    dw Spritemaps_MotherBrain_16                                         ;A99FE6;
    dw Hitbox_MotherBrainBody_4                                          ;A99FE8;

ExtendedSpritemap_MotherBrainBody_Walking_0:
    dw $000A                                                             ;A99FEA;
    dw $001C,$002F
    dw Spritemaps_MotherBrain_13                                         ;A99FF0;
    dw Hitbox_MotherBrainBody_3                                          ;A99FF2;
    dw $0026,$0013                                                       ;A99FF4;
    dw Spritemaps_MotherBrain_F                                          ;A99FF8;
    dw Hitbox_MotherBrainBody_2                                          ;A99FFA;
    dw $0021,$0013                                                       ;A99FFC;
    dw Spritemaps_MotherBrain_11                                         ;A9A000;
    dw Hitbox_MotherBrainBody_2                                          ;A9A002;
    dw $0000,$FFFD                                                       ;A9A004;
    dw Spritemaps_MotherBrain_C                                          ;A9A008;
    dw Hitbox_MotherBrainBody_2                                          ;A9A00A;
    dw $0000,$0002                                                       ;A9A00C;
    dw ExtendedTilemaps_MotherBrain_0                                    ;A9A010;
    dw Hitbox_MotherBrainBody_6                                          ;A9A012;
    dw $0000,$0000                                                       ;A9A014;
    dw ExtendedTilemaps_MotherBrain_1                                    ;A9A018;
    dw Hitbox_MotherBrainBody_8                                          ;A9A01A;
    dw $FFF5,$003A                                                       ;A9A01C;
    dw Spritemaps_MotherBrain_17                                         ;A9A020;
    dw Hitbox_MotherBrainBody_5                                          ;A9A022;
    dw $0006,$001F                                                       ;A9A024;
    dw Spritemaps_MotherBrain_15                                         ;A9A028;
    dw Hitbox_MotherBrainBody_4                                          ;A9A02A;
    dw $0001,$0021                                                       ;A9A02C;
    dw Spritemaps_MotherBrain_16                                         ;A9A030;
    dw Hitbox_MotherBrainBody_4                                          ;A9A032;
    dw $FFE7,$FFFD                                                       ;A9A034;
    dw Spritemaps_MotherBrain_14                                         ;A9A038;
    dw Hitbox_MotherBrainBody_4                                          ;A9A03A;

ExtendedSpritemap_MotherBrainBody_Walking_1:
    dw $000A                                                             ;A9A03C;
    dw $0028,$0030
    dw Spritemaps_MotherBrain_13                                         ;A9A042;
    dw Hitbox_MotherBrainBody_3                                          ;A9A044;
    dw $0026,$0013                                                       ;A9A046;
    dw Spritemaps_MotherBrain_F                                          ;A9A04A;
    dw Hitbox_MotherBrainBody_2                                          ;A9A04C;
    dw $0023,$0013                                                       ;A9A04E;
    dw Spritemaps_MotherBrain_10                                         ;A9A052;
    dw Hitbox_MotherBrainBody_2                                          ;A9A054;
    dw $0000,$FFFD                                                       ;A9A056;
    dw Spritemaps_MotherBrain_C                                          ;A9A05A;
    dw Hitbox_MotherBrainBody_2                                          ;A9A05C;
    dw $0000,$0002                                                       ;A9A05E;
    dw ExtendedTilemaps_MotherBrain_0                                    ;A9A062;
    dw Hitbox_MotherBrainBody_6                                          ;A9A064;
    dw $0000,$0000                                                       ;A9A066;
    dw ExtendedTilemaps_MotherBrain_1                                    ;A9A06A;
    dw Hitbox_MotherBrainBody_8                                          ;A9A06C;
    dw $FFF3,$003A                                                       ;A9A06E;
    dw Spritemaps_MotherBrain_17                                         ;A9A072;
    dw Hitbox_MotherBrainBody_5                                          ;A9A074;
    dw $0005,$001F                                                       ;A9A076;
    dw Spritemaps_MotherBrain_15                                         ;A9A07A;
    dw Hitbox_MotherBrainBody_4                                          ;A9A07C;
    dw $FFFF,$0021                                                       ;A9A07E;
    dw Spritemaps_MotherBrain_16                                         ;A9A082;
    dw Hitbox_MotherBrainBody_4                                          ;A9A084;
    dw $FFE6,$FFFD                                                       ;A9A086;
    dw Spritemaps_MotherBrain_14                                         ;A9A08A;
    dw Hitbox_MotherBrainBody_4                                          ;A9A08C;

ExtendedSpritemap_MotherBrainBody_Walking_2:
    dw $000A                                                             ;A9A08E;
    dw $0028,$0033
    dw Spritemaps_MotherBrain_13                                         ;A9A094;
    dw Hitbox_MotherBrainBody_3                                          ;A9A096;
    dw $0026,$0015                                                       ;A9A098;
    dw Spritemaps_MotherBrain_F                                          ;A9A09C;
    dw Hitbox_MotherBrainBody_2                                          ;A9A09E;
    dw $0023,$0016                                                       ;A9A0A0;
    dw Spritemaps_MotherBrain_10                                         ;A9A0A4;
    dw Hitbox_MotherBrainBody_2                                          ;A9A0A6;
    dw $FFFF,$FFFE                                                       ;A9A0A8;
    dw Spritemaps_MotherBrain_C                                          ;A9A0AC;
    dw Hitbox_MotherBrainBody_2                                          ;A9A0AE;
    dw $0000,$0001                                                       ;A9A0B0;
    dw ExtendedTilemaps_MotherBrain_0                                    ;A9A0B4;
    dw Hitbox_MotherBrainBody_6                                          ;A9A0B6;
    dw $0000,$0000                                                       ;A9A0B8;
    dw ExtendedTilemaps_MotherBrain_1                                    ;A9A0BC;
    dw Hitbox_MotherBrainBody_8                                          ;A9A0BE;
    dw $FFF3,$0039                                                       ;A9A0C0;
    dw Spritemaps_MotherBrain_17                                         ;A9A0C4;
    dw Hitbox_MotherBrainBody_5                                          ;A9A0C6;
    dw $0005,$001E                                                       ;A9A0C8;
    dw Spritemaps_MotherBrain_15                                         ;A9A0CC;
    dw Hitbox_MotherBrainBody_4                                          ;A9A0CE;
    dw $FFFF,$0020                                                       ;A9A0D0;
    dw Spritemaps_MotherBrain_16                                         ;A9A0D4;
    dw Hitbox_MotherBrainBody_4                                          ;A9A0D6;
    dw $FFE6,$FFFC                                                       ;A9A0D8;
    dw Spritemaps_MotherBrain_14                                         ;A9A0DC;
    dw Hitbox_MotherBrainBody_4                                          ;A9A0DE;

ExtendedSpritemap_MotherBrainBody_Walking_3:
    dw $0009                                                             ;A9A0E0;
    dw $0024,$003A
    dw Spritemaps_MotherBrain_13                                         ;A9A0E6;
    dw Hitbox_MotherBrainBody_3                                          ;A9A0E8;
    dw $0021,$001D                                                       ;A9A0EA;
    dw Spritemaps_MotherBrain_F                                          ;A9A0EE;
    dw Hitbox_MotherBrainBody_2                                          ;A9A0F0;
    dw $001F,$001E                                                       ;A9A0F2;
    dw Spritemaps_MotherBrain_10                                         ;A9A0F6;
    dw Hitbox_MotherBrainBody_2                                          ;A9A0F8;
    dw $0001,$FFFC                                                       ;A9A0FA;
    dw Spritemaps_MotherBrain_B                                          ;A9A0FE;
    dw Hitbox_MotherBrainBody_2                                          ;A9A100;
    dw $0000,$0000                                                       ;A9A102;
    dw ExtendedTilemaps_MotherBrain_0                                    ;A9A106;
    dw Hitbox_MotherBrainBody_6                                          ;A9A108;
    dw $0000,$0000                                                       ;A9A10A;
    dw ExtendedTilemaps_MotherBrain_1                                    ;A9A10E;
    dw Hitbox_MotherBrainBody_8                                          ;A9A110;
    dw $FFF0,$0038                                                       ;A9A112;
    dw Spritemaps_MotherBrain_17                                         ;A9A116;
    dw Hitbox_MotherBrainBody_5                                          ;A9A118;
    dw $0003,$001C                                                       ;A9A11A;
    dw Spritemaps_MotherBrain_15                                         ;A9A11E;
    dw Hitbox_MotherBrainBody_4                                          ;A9A120;
    dw $FFFC,$001E                                                       ;A9A122;
    dw Spritemaps_MotherBrain_16                                         ;A9A126;
    dw Hitbox_MotherBrainBody_4                                          ;A9A128;

ExtendedSpritemap_MotherBrainBody_Walking_4:
    dw $0009                                                             ;A9A12A;
    dw $0015,$003C
    dw Spritemaps_MotherBrain_13                                         ;A9A130;
    dw Hitbox_MotherBrainBody_3                                          ;A9A132;
    dw $001D,$001F                                                       ;A9A134;
    dw Spritemaps_MotherBrain_F                                          ;A9A138;
    dw Hitbox_MotherBrainBody_2                                          ;A9A13A;
    dw $001B,$0020                                                       ;A9A13C;
    dw Spritemaps_MotherBrain_11                                         ;A9A140;
    dw Hitbox_MotherBrainBody_2                                          ;A9A142;
    dw $FFFE,$FFFE                                                       ;A9A144;
    dw Spritemaps_MotherBrain_B                                          ;A9A148;
    dw Hitbox_MotherBrainBody_2                                          ;A9A14A;
    dw $0000,$0002                                                       ;A9A14C;
    dw ExtendedTilemaps_MotherBrain_0                                    ;A9A150;
    dw Hitbox_MotherBrainBody_6                                          ;A9A152;
    dw $0000,$0000                                                       ;A9A154;
    dw ExtendedTilemaps_MotherBrain_1                                    ;A9A158;
    dw Hitbox_MotherBrainBody_8                                          ;A9A15A;
    dw $FFF0,$0034                                                       ;A9A15C;
    dw Spritemaps_MotherBrain_17                                         ;A9A160;
    dw Hitbox_MotherBrainBody_5                                          ;A9A162;
    dw $0000,$001A                                                       ;A9A164;
    dw Spritemaps_MotherBrain_15                                         ;A9A168;
    dw Hitbox_MotherBrainBody_4                                          ;A9A16A;
    dw $FFFB,$001C                                                       ;A9A16C;
    dw Spritemaps_MotherBrain_16                                         ;A9A170;
    dw Hitbox_MotherBrainBody_4                                          ;A9A172;

ExtendedSpritemap_MotherBrainBody_Walking_5:
    dw $0009                                                             ;A9A174;
    dw $000F,$0040
    dw Spritemaps_MotherBrain_13                                         ;A9A17A;
    dw Hitbox_MotherBrainBody_3                                          ;A9A17C;
    dw $001E,$0023                                                       ;A9A17E;
    dw Spritemaps_MotherBrain_F                                          ;A9A182;
    dw Hitbox_MotherBrainBody_2                                          ;A9A184;
    dw $001A,$0025                                                       ;A9A186;
    dw Spritemaps_MotherBrain_12                                         ;A9A18A;
    dw Hitbox_MotherBrainBody_2                                          ;A9A18C;
    dw $FFFE,$FFFF                                                       ;A9A18E;
    dw Spritemaps_MotherBrain_B                                          ;A9A192;
    dw Hitbox_MotherBrainBody_2                                          ;A9A194;
    dw $0000,$0006                                                       ;A9A196;
    dw ExtendedTilemaps_MotherBrain_0                                    ;A9A19A;
    dw Hitbox_MotherBrainBody_6                                          ;A9A19C;
    dw $0000,$0000                                                       ;A9A19E;
    dw ExtendedTilemaps_MotherBrain_1                                    ;A9A1A2;
    dw Hitbox_MotherBrainBody_8                                          ;A9A1A4;
    dw $FFF6,$002F                                                       ;A9A1A6;
    dw Spritemaps_MotherBrain_17                                         ;A9A1AA;
    dw Hitbox_MotherBrainBody_5                                          ;A9A1AC;
    dw $0004,$0016                                                       ;A9A1AE;
    dw Spritemaps_MotherBrain_15                                         ;A9A1B2;
    dw Hitbox_MotherBrainBody_4                                          ;A9A1B4;
    dw $FFFF,$0018                                                       ;A9A1B6;
    dw Spritemaps_MotherBrain_16                                         ;A9A1BA;
    dw Hitbox_MotherBrainBody_4                                          ;A9A1BC;

ExtendedSpritemap_MotherBrainBody_Walking_6:
    dw $0009                                                             ;A9A1BE;
    dw $0011,$003C
    dw Spritemaps_MotherBrain_13                                         ;A9A1C4;
    dw Hitbox_MotherBrainBody_3                                          ;A9A1C6;
    dw $001E,$0020                                                       ;A9A1C8;
    dw Spritemaps_MotherBrain_F                                          ;A9A1CC;
    dw Hitbox_MotherBrainBody_2                                          ;A9A1CE;
    dw $0018,$0020                                                       ;A9A1D0;
    dw Spritemaps_MotherBrain_11                                         ;A9A1D4;
    dw Hitbox_MotherBrainBody_2                                          ;A9A1D6;
    dw $FFFF,$FFFE                                                       ;A9A1D8;
    dw Spritemaps_MotherBrain_B                                          ;A9A1DC;
    dw Hitbox_MotherBrainBody_2                                          ;A9A1DE;
    dw $0000,$0002                                                       ;A9A1E0;
    dw ExtendedTilemaps_MotherBrain_0                                    ;A9A1E4;
    dw Hitbox_MotherBrainBody_6                                          ;A9A1E6;
    dw $0000,$0000                                                       ;A9A1E8;
    dw ExtendedTilemaps_MotherBrain_1                                    ;A9A1EC;
    dw Hitbox_MotherBrainBody_8                                          ;A9A1EE;
    dw $FFF8,$002F                                                       ;A9A1F0;
    dw Spritemaps_MotherBrain_17                                         ;A9A1F4;
    dw Hitbox_MotherBrainBody_5                                          ;A9A1F6;
    dw $0007,$0015                                                       ;A9A1F8;
    dw Spritemaps_MotherBrain_15                                         ;A9A1FC;
    dw Hitbox_MotherBrainBody_4                                          ;A9A1FE;
    dw $0003,$0017                                                       ;A9A200;
    dw Spritemaps_MotherBrain_16                                         ;A9A204;
    dw Hitbox_MotherBrainBody_4                                          ;A9A206;

ExtendedSpritemap_MotherBrainBody_Walking_7:
    dw $0009                                                             ;A9A208;
    dw $0012,$003A
    dw Spritemaps_MotherBrain_13                                         ;A9A20E;
    dw Hitbox_MotherBrainBody_3                                          ;A9A210;
    dw $001F,$001E                                                       ;A9A212;
    dw Spritemaps_MotherBrain_F                                          ;A9A216;
    dw Hitbox_MotherBrainBody_2                                          ;A9A218;
    dw $0019,$001E                                                       ;A9A21A;
    dw Spritemaps_MotherBrain_11                                         ;A9A21E;
    dw Hitbox_MotherBrainBody_2                                          ;A9A220;
    dw $FFFF,$FFFD                                                       ;A9A222;
    dw Spritemaps_MotherBrain_B                                          ;A9A226;
    dw Hitbox_MotherBrainBody_2                                          ;A9A228;
    dw $0000,$0000                                                       ;A9A22A;
    dw ExtendedTilemaps_MotherBrain_0                                    ;A9A22E;
    dw Hitbox_MotherBrainBody_6                                          ;A9A230;
    dw $0000,$0000                                                       ;A9A232;
    dw ExtendedTilemaps_MotherBrain_1                                    ;A9A236;
    dw Hitbox_MotherBrainBody_8                                          ;A9A238;
    dw $FFF6,$0038                                                       ;A9A23A;
    dw Spritemaps_MotherBrain_17                                         ;A9A23E;
    dw Hitbox_MotherBrainBody_5                                          ;A9A240;
    dw $0007,$001C                                                       ;A9A242;
    dw Spritemaps_MotherBrain_15                                         ;A9A246;
    dw Hitbox_MotherBrainBody_4                                          ;A9A248;
    dw $0002,$001F                                                       ;A9A24A;
    dw Spritemaps_MotherBrain_16                                         ;A9A24E;
    dw Hitbox_MotherBrainBody_4                                          ;A9A250;

ExtendedSpritemap_MotherBrainBody_Crouched:
    dw $0007                                                             ;A9A252;
    dw $0012,$0014
    dw Spritemaps_MotherBrain_13                                         ;A9A258;
    dw Hitbox_MotherBrainBody_3                                          ;A9A25A;
    dw $0022,$FFF7                                                       ;A9A25C;
    dw Spritemaps_MotherBrain_F                                          ;A9A260;
    dw Hitbox_MotherBrainBody_2                                          ;A9A262;
    dw $001F,$FFFA                                                       ;A9A264;
    dw Spritemaps_MotherBrain_12                                         ;A9A268;
    dw Hitbox_MotherBrainBody_2                                          ;A9A26A;
    dw $FFFB,$0003                                                       ;A9A26C;
    dw Spritemaps_MotherBrain_E                                          ;A9A270;
    dw Hitbox_MotherBrainBody_2                                          ;A9A272;
    dw $0000,$FFDA                                                       ;A9A274;
    dw ExtendedTilemaps_MotherBrain_0                                    ;A9A278;
    dw Hitbox_MotherBrainBody_6                                          ;A9A27A;
    dw $0004,$0000                                                       ;A9A27C;
    dw ExtendedTilemaps_MotherBrain_1                                    ;A9A280;
    dw Hitbox_MotherBrainBody_8                                          ;A9A282;
    dw $FFF6,$0012                                                       ;A9A284;
    dw Spritemaps_MotherBrain_17                                         ;A9A288;
    dw Hitbox_MotherBrainBody_5                                          ;A9A28A;

ExtendedSpritemap_MotherBrainBody_Uncrouching:
    dw $0009                                                             ;A9A28C;
    dw $0012,$001E
    dw Spritemaps_MotherBrain_13                                         ;A9A292;
    dw Hitbox_MotherBrainBody_3                                          ;A9A294;
    dw $0024,$0002                                                       ;A9A296;
    dw Spritemaps_MotherBrain_F                                          ;A9A29A;
    dw Hitbox_MotherBrainBody_2                                          ;A9A29C;
    dw $001F,$0004                                                       ;A9A29E;
    dw Spritemaps_MotherBrain_12                                         ;A9A2A2;
    dw Hitbox_MotherBrainBody_2                                          ;A9A2A4;
    dw $FFFB,$FFFE                                                       ;A9A2A6;
    dw Spritemaps_MotherBrain_D                                          ;A9A2AA;
    dw Hitbox_MotherBrainBody_2                                          ;A9A2AC;
    dw $0000,$FFE4                                                       ;A9A2AE;
    dw ExtendedTilemaps_MotherBrain_0                                    ;A9A2B2;
    dw Hitbox_MotherBrainBody_6                                          ;A9A2B4;
    dw $FFFE,$0000                                                       ;A9A2B6;
    dw ExtendedTilemaps_MotherBrain_1                                    ;A9A2BA;
    dw Hitbox_MotherBrainBody_8                                          ;A9A2BC;
    dw $FFF6,$001C                                                       ;A9A2BE;
    dw Spritemaps_MotherBrain_17                                         ;A9A2C2;
    dw Hitbox_MotherBrainBody_5                                          ;A9A2C4;
    dw $0007,$0000                                                       ;A9A2C6;
    dw Spritemaps_MotherBrain_15                                         ;A9A2CA;
    dw Hitbox_MotherBrainBody_4                                          ;A9A2CC;
    dw $0002,$0001                                                       ;A9A2CE;
    dw Spritemaps_MotherBrain_16                                         ;A9A2D2;
    dw Hitbox_MotherBrainBody_4                                          ;A9A2D4;

ExtendedSpritemap_MotherBrainBody_LeaningDown:
    dw $0009                                                             ;A9A2D6;
    dw $0012,$002E
    dw Spritemaps_MotherBrain_13                                         ;A9A2DC;
    dw Hitbox_MotherBrainBody_3                                          ;A9A2DE;
    dw $001F,$0011                                                       ;A9A2E0;
    dw Spritemaps_MotherBrain_F                                          ;A9A2E4;
    dw Hitbox_MotherBrainBody_2                                          ;A9A2E6;
    dw $001A,$0012                                                       ;A9A2E8;
    dw Spritemaps_MotherBrain_11                                         ;A9A2EC;
    dw Hitbox_MotherBrainBody_2                                          ;A9A2EE;
    dw $FFFB,$FFFC                                                       ;A9A2F0;
    dw Spritemaps_MotherBrain_C                                          ;A9A2F4;
    dw Hitbox_MotherBrainBody_2                                          ;A9A2F6;
    dw $0000,$FFF4                                                       ;A9A2F8;
    dw ExtendedTilemaps_MotherBrain_0                                    ;A9A2FC;
    dw Hitbox_MotherBrainBody_6                                          ;A9A2FE;
    dw $FFFE,$0000                                                       ;A9A300;
    dw ExtendedTilemaps_MotherBrain_1                                    ;A9A304;
    dw Hitbox_MotherBrainBody_8                                          ;A9A306;
    dw $FFF6,$002C                                                       ;A9A308;
    dw Spritemaps_MotherBrain_17                                         ;A9A30C;
    dw Hitbox_MotherBrainBody_5                                          ;A9A30E;
    dw $0007,$0010                                                       ;A9A310;
    dw Spritemaps_MotherBrain_15                                         ;A9A314;
    dw Hitbox_MotherBrainBody_4                                          ;A9A316;
    dw $0002,$0011                                                       ;A9A318;
    dw Spritemaps_MotherBrain_16                                         ;A9A31C;
    dw Hitbox_MotherBrainBody_4                                          ;A9A31E;

UNUSED_ExtendedSpritemap_MotherBrainBrain_A9A320:
    dw $0001                                                             ;A9A320;
    dw $0000,$0000
    dw Spritemaps_MotherBrain_0                                          ;A9A326;
    dw Hitbox_MotherBrainBody_0                                          ;A9A328;

if !FEATURE_KEEP_UNREFERENCED
UNUSED_ExtendedSpritemap_MotherBrainBrain_A9A32A:
    dw $0001                                                             ;A9A32A;
    dw $0000,$0000
    dw Spritemaps_MotherBrain_1                                          ;A9A330;
    dw Hitbox_MotherBrainBody_0                                          ;A9A332;

UNUSED_ExtendedSpritemap_MotherBrainBrain_A9A334:
    dw $0001                                                             ;A9A334;
    dw $0000,$0000
    dw Spritemaps_MotherBrain_2                                          ;A9A33A;
    dw Hitbox_MotherBrainBody_0                                          ;A9A33C;

UNUSED_ExtendedSpritemap_MotherBrainBrain_A9A33E:
    dw $0001                                                             ;A9A33E;
    dw $0000,$0000
    dw Spritemaps_MotherBrain_3                                          ;A9A344;
    dw Hitbox_MotherBrainBody_0                                          ;A9A346;

UNUSED_ExtendedSpritemap_MotherBrainBrain_A9A348:
    dw $0001                                                             ;A9A348;
    dw $0000,$0000
    dw Spritemaps_MotherBrain_4                                          ;A9A34E;
    dw Hitbox_MotherBrainBody_0                                          ;A9A350;

UNUSED_ExtendedSpritemap_MotherBrainBrain_A9A352:
    dw $0001                                                             ;A9A352;
    dw $0000,$0000
    dw Spritemaps_MotherBrain_6                                          ;A9A358;
    dw Hitbox_MotherBrainBody_1                                          ;A9A35A;

UNUSED_ExtendedSpritemap_MotherBrainBrain_A9A35C:
    dw $0001                                                             ;A9A35C;
    dw $0000,$0000
    dw Spritemaps_MotherBrain_7                                          ;A9A362;
    dw Hitbox_MotherBrainBody_1                                          ;A9A364;

UNUSED_ExtendedSpritemap_MotherBrainBrain_A9A366:
    dw $0001                                                             ;A9A366;
    dw $0000,$0000
    dw Spritemaps_MotherBrain_8                                          ;A9A36C;
    dw Hitbox_MotherBrainBody_1                                          ;A9A36E;

UNUSED_ExtendedSpritemap_MotherBrainBrain_A9A370:
    dw $0001                                                             ;A9A370;
    dw $0000,$0000
    dw Spritemaps_MotherBrain_9                                          ;A9A376;
    dw Hitbox_MotherBrainBody_1                                          ;A9A378;

UNUSED_ExtendedSpritemap_MotherBrainBrain_A9A37A:
    dw $0001                                                             ;A9A37A;
    dw $0000,$0000
    dw Spritemaps_MotherBrain_A                                          ;A9A380;
    dw Hitbox_MotherBrainBody_1                                          ;A9A382;
endif ; !FEATURE_KEEP_UNREFERENCED

ExtendedSpritemap_MotherBrainBrain_DeathBeamMode_0:
    dw $0009                                                             ;A9A384;
    dw $0012,$003A
    dw Spritemaps_MotherBrain_13                                         ;A9A38A;
    dw Hitbox_MotherBrainBody_3                                          ;A9A38C;
    dw $001E,$001D                                                       ;A9A38E;
    dw Spritemaps_MotherBrain_F                                          ;A9A392;
    dw Hitbox_MotherBrainBody_2                                          ;A9A394;
    dw $0019,$001E                                                       ;A9A396;
    dw Spritemaps_MotherBrain_11                                         ;A9A39A;
    dw Hitbox_MotherBrainBody_2                                          ;A9A39C;
    dw $0000,$FFFC                                                       ;A9A39E;
    dw Spritemaps_MotherBrain_B                                          ;A9A3A2;
    dw Hitbox_MotherBrainBody_2                                          ;A9A3A4;
    dw $0000,$0000                                                       ;A9A3A6;
    dw ExtendedTilemaps_MotherBrain_0                                    ;A9A3AA;
    dw Hitbox_MotherBrainBody_6                                          ;A9A3AC;
    dw $0000,$0000                                                       ;A9A3AE;
    dw ExtendedTilemaps_MotherBrain_2                                    ;A9A3B2;
    dw Hitbox_MotherBrainBody_9                                          ;A9A3B4;
    dw $FFF6,$0038                                                       ;A9A3B6;
    dw Spritemaps_MotherBrain_17                                         ;A9A3BA;
    dw Hitbox_MotherBrainBody_5                                          ;A9A3BC;
    dw $0007,$001C                                                       ;A9A3BE;
    dw Spritemaps_MotherBrain_15                                         ;A9A3C2;
    dw Hitbox_MotherBrainBody_4                                          ;A9A3C4;
    dw $0002,$001D                                                       ;A9A3C6;
    dw Spritemaps_MotherBrain_16                                         ;A9A3CA;
    dw Hitbox_MotherBrainBody_4                                          ;A9A3CC;

ExtendedSpritemap_MotherBrainBrain_DeathBeamMode_1:
    dw $0009                                                             ;A9A3CE;
    dw $0012,$003A
    dw Spritemaps_MotherBrain_13                                         ;A9A3D4;
    dw Hitbox_MotherBrainBody_3                                          ;A9A3D6;
    dw $001E,$001D                                                       ;A9A3D8;
    dw Spritemaps_MotherBrain_F                                          ;A9A3DC;
    dw Hitbox_MotherBrainBody_2                                          ;A9A3DE;
    dw $0019,$001E                                                       ;A9A3E0;
    dw Spritemaps_MotherBrain_11                                         ;A9A3E4;
    dw Hitbox_MotherBrainBody_2                                          ;A9A3E6;
    dw $0000,$FFFC                                                       ;A9A3E8;
    dw Spritemaps_MotherBrain_B                                          ;A9A3EC;
    dw Hitbox_MotherBrainBody_2                                          ;A9A3EE;
    dw $0000,$0000                                                       ;A9A3F0;
    dw ExtendedTilemaps_MotherBrain_0                                    ;A9A3F4;
    dw Hitbox_MotherBrainBody_6                                          ;A9A3F6;
    dw $0000,$0000                                                       ;A9A3F8;
    dw ExtendedTilemaps_MotherBrain_3                                    ;A9A3FC;
    dw Hitbox_MotherBrainBody_A                                          ;A9A3FE;
    dw $FFF6,$0038                                                       ;A9A400;
    dw Spritemaps_MotherBrain_17                                         ;A9A404;
    dw Hitbox_MotherBrainBody_5                                          ;A9A406;
    dw $0007,$001C                                                       ;A9A408;
    dw Spritemaps_MotherBrain_15                                         ;A9A40C;
    dw Hitbox_MotherBrainBody_4                                          ;A9A40E;
    dw $0002,$001D                                                       ;A9A410;
    dw Spritemaps_MotherBrain_16                                         ;A9A414;
    dw Hitbox_MotherBrainBody_4                                          ;A9A416;

ExtendedSpritemap_MotherBrainBrain_DeathBeamMode_2:
    dw $0009                                                             ;A9A418;
    dw $0012,$003A
    dw Spritemaps_MotherBrain_13                                         ;A9A41E;
    dw Hitbox_MotherBrainBody_3                                          ;A9A420;
    dw $001E,$001D                                                       ;A9A422;
    dw Spritemaps_MotherBrain_F                                          ;A9A426;
    dw Hitbox_MotherBrainBody_2                                          ;A9A428;
    dw $0019,$001E                                                       ;A9A42A;
    dw Spritemaps_MotherBrain_11                                         ;A9A42E;
    dw Hitbox_MotherBrainBody_2                                          ;A9A430;
    dw $0000,$FFFC                                                       ;A9A432;
    dw Spritemaps_MotherBrain_B                                          ;A9A436;
    dw Hitbox_MotherBrainBody_2                                          ;A9A438;
    dw $0000,$0000                                                       ;A9A43A;
    dw ExtendedTilemaps_MotherBrain_0                                    ;A9A43E;
    dw Hitbox_MotherBrainBody_6                                          ;A9A440;
    dw $0000,$0000                                                       ;A9A442;
    dw ExtendedTilemaps_MotherBrain_4                                    ;A9A446;
    dw Hitbox_MotherBrainBody_B                                          ;A9A448;
    dw $FFF6,$0038                                                       ;A9A44A;
    dw Spritemaps_MotherBrain_17                                         ;A9A44E;
    dw Hitbox_MotherBrainBody_5                                          ;A9A450;
    dw $0007,$001C                                                       ;A9A452;
    dw Spritemaps_MotherBrain_15                                         ;A9A456;
    dw Hitbox_MotherBrainBody_4                                          ;A9A458;
    dw $0002,$001D                                                       ;A9A45A;
    dw Spritemaps_MotherBrain_16                                         ;A9A45E;
    dw Hitbox_MotherBrainBody_4                                          ;A9A460;

ExtendedSpritemap_MotherBrainBrain_DeathBeamMode_3:
    dw $0009                                                             ;A9A462;
    dw $0012,$003A
    dw Spritemaps_MotherBrain_13                                         ;A9A468;
    dw Hitbox_MotherBrainBody_3                                          ;A9A46A;
    dw $001E,$001D                                                       ;A9A46C;
    dw Spritemaps_MotherBrain_F                                          ;A9A470;
    dw Hitbox_MotherBrainBody_2                                          ;A9A472;
    dw $0019,$001E                                                       ;A9A474;
    dw Spritemaps_MotherBrain_11                                         ;A9A478;
    dw Hitbox_MotherBrainBody_2                                          ;A9A47A;
    dw $0000,$FFFC                                                       ;A9A47C;
    dw Spritemaps_MotherBrain_B                                          ;A9A480;
    dw Hitbox_MotherBrainBody_2                                          ;A9A482;
    dw $0000,$0000                                                       ;A9A484;
    dw ExtendedTilemaps_MotherBrain_0                                    ;A9A488;
    dw Hitbox_MotherBrainBody_6                                          ;A9A48A;
    dw $0000,$0000                                                       ;A9A48C;
    dw ExtendedTilemaps_MotherBrain_5                                    ;A9A490;
    dw Hitbox_MotherBrainBody_C                                          ;A9A492;
    dw $FFF6,$0038                                                       ;A9A494;
    dw Spritemaps_MotherBrain_17                                         ;A9A498;
    dw Hitbox_MotherBrainBody_5                                          ;A9A49A;
    dw $0007,$001C                                                       ;A9A49C;
    dw Spritemaps_MotherBrain_15                                         ;A9A4A0;
    dw Hitbox_MotherBrainBody_4                                          ;A9A4A2;
    dw $0002,$001D                                                       ;A9A4A4;
    dw Spritemaps_MotherBrain_16                                         ;A9A4A8;
    dw Hitbox_MotherBrainBody_4                                          ;A9A4AA;


;;; $A4AC: Hitboxes - Mother Brain body ;;;
Hitbox_MotherBrainBody_0:
    dw $0001                                                             ;A9A4AC;
    dw $FFEC,$FFEB,$0010,$0017
    dw EnemyTouch_MotherBrainHead                                        ;A9A4B6;
    dw EnemyShot_MotherBrainHead                                         ;A9A4B8;

Hitbox_MotherBrainBody_1:
    dw $0001                                                             ;A9A4BA;
    dw $FFEC,$FFEB,$0013,$0017
    dw EnemyTouch_MotherBrainHead                                        ;A9A4C4;
    dw EnemyShot_MotherBrainHead                                         ;A9A4C6;

Hitbox_MotherBrainBody_2:
    dw $0000                                                             ;A9A4C8;

Hitbox_MotherBrainBody_3:
    dw $0001                                                             ;A9A4CA;
    dw $FFE9,$FFFF,$0017,$0007
    dw RTL_A9B5C5                                                        ;A9A4D4;
    dw EnemyShot_MotherBrainBody                                         ;A9A4D6;

Hitbox_MotherBrainBody_4:
    dw $0000                                                             ;A9A4D8;

Hitbox_MotherBrainBody_5:
    dw $0001                                                             ;A9A4DA;
    dw $FFE9,$FFFE,$0017,$0007
    dw RTL_A9B5C5                                                        ;A9A4E4;
    dw EnemyShot_MotherBrainBody                                         ;A9A4E6;

Hitbox_MotherBrainBody_6:
    dw $0002                                                             ;A9A4E8;
    dw $FFE0,$FFE8,$0014,$0034
    dw RTL_A9B5C5                                                        ;A9A4F2;
    dw EnemyShot_MotherBrainBody                                         ;A9A4F4;
    dw $FFE8,$FFD6,$000D,$FFE7                                           ;A9A4F6;
    dw RTL_A9B5C5                                                        ;A9A4FE;
    dw EnemyShot_MotherBrainBody                                         ;A9A500;

Hitbox_MotherBrainBody_7:
    dw $0000                                                             ;A9A502;

Hitbox_MotherBrainBody_8:
    dw $0002                                                             ;A9A504;
    dw $0004,$FFC5,$001C,$FFE8
    dw RTL_A9B5C5                                                        ;A9A50E;
    dw EnemyShot_MotherBrainBody                                         ;A9A510;
    dw $001C,$FFD7,$0039,$FFE2                                           ;A9A512;
    dw RTL_A9B5C5                                                        ;A9A51A;
    dw EnemyShot_MotherBrainBody                                         ;A9A51C;

Hitbox_MotherBrainBody_9:
    dw $0002                                                             ;A9A51E;
    dw $0004,$FFC5,$001C,$FFE8
    dw RTL_A9B5C5                                                        ;A9A528;
    dw EnemyShot_MotherBrainBody                                         ;A9A52A;
    dw $001C,$FFD7,$0036,$FFE2                                           ;A9A52C;
    dw RTL_A9B5C5                                                        ;A9A534;
    dw EnemyShot_MotherBrainBody                                         ;A9A536;

Hitbox_MotherBrainBody_A:
    dw $0002                                                             ;A9A538;
    dw $0004,$FFC5,$001C,$FFE8
    dw RTL_A9B5C5                                                        ;A9A542;
    dw EnemyShot_MotherBrainBody                                         ;A9A544;
    dw $001D,$FFD5,$002D,$FFE8                                           ;A9A546;
    dw RTL_A9B5C5                                                        ;A9A54E;
    dw EnemyShot_MotherBrainBody                                         ;A9A550;

Hitbox_MotherBrainBody_B:
    dw $0002                                                             ;A9A552;
    dw $0004,$FFC5,$001C,$FFE8
    dw RTL_A9B5C5                                                        ;A9A55C;
    dw EnemyShot_MotherBrainBody                                         ;A9A55E;
    dw $001D,$FFD0,$0044,$FFD8                                           ;A9A560;
    dw RTL_A9B5C5                                                        ;A9A568;
    dw EnemyShot_MotherBrainBody                                         ;A9A56A;

Hitbox_MotherBrainBody_C:
    dw $0002                                                             ;A9A56C;
    dw $0004,$FFC5,$001C,$FFE8
    dw RTL_A9B5C5                                                        ;A9A576;
    dw EnemyShot_MotherBrainBody                                         ;A9A578;
    dw $001C,$FFD7,$003A,$FFE1                                           ;A9A57A;
    dw RTL_A9B5C5                                                        ;A9A582;
    dw EnemyShot_MotherBrainBody                                         ;A9A584;


;;; $A586: Mother Brain spritemaps ;;;
Spritemaps_MotherBrain_0:
    dw $000B                                                             ;A9A586;
    %spritemapEntry(0, $0C, $01, 0, 0, 2, 0, $133)
    %spritemapEntry(1, $02, $09, 0, 0, 2, 0, $100)
    %spritemapEntry(1, $1E8, $04, 0, 0, 2, 0, $108)
    %spritemapEntry(1, $1F8, $04, 0, 0, 2, 0, $102)
    %spritemapEntry(1, $1F8, $F4, 0, 0, 2, 0, $120)
    %spritemapEntry(1, $08, $00, 0, 0, 2, 0, $104)
    %spritemapEntry(1, $08, $F0, 0, 0, 2, 0, $11E)
    %spritemapEntry(1, $08, $E8, 0, 0, 2, 0, $10E)
    %spritemapEntry(1, $1F8, $E4, 0, 0, 2, 0, $10A)
    %spritemapEntry(0, $1F0, $EC, 0, 0, 2, 0, $122)
    %spritemapEntry(1, $1E8, $F4, 0, 0, 2, 0, $106)

Spritemaps_MotherBrain_1:
    dw $000B                                                             ;A9A5BF;
    %spritemapEntry(0, $0C, $01, 0, 0, 2, 0, $132)
    %spritemapEntry(1, $02, $09, 0, 0, 2, 0, $100)
    %spritemapEntry(1, $1E8, $04, 0, 0, 2, 0, $108)
    %spritemapEntry(1, $1F8, $04, 0, 0, 2, 0, $102)
    %spritemapEntry(1, $1F8, $F4, 0, 0, 2, 0, $120)
    %spritemapEntry(1, $08, $00, 0, 0, 2, 0, $104)
    %spritemapEntry(1, $08, $F0, 0, 0, 2, 0, $11E)
    %spritemapEntry(1, $08, $E8, 0, 0, 2, 0, $10E)
    %spritemapEntry(1, $1F8, $E4, 0, 0, 2, 0, $10A)
    %spritemapEntry(0, $1F0, $EC, 0, 0, 2, 0, $122)
    %spritemapEntry(1, $1E8, $F4, 0, 0, 2, 0, $106)

Spritemaps_MotherBrain_2:
    dw $000A                                                             ;A9A5F8;
    %spritemapEntry(1, $02, $09, 0, 0, 2, 0, $100)
    %spritemapEntry(1, $1E8, $04, 0, 0, 2, 0, $108)
    %spritemapEntry(1, $1F8, $04, 0, 0, 2, 0, $102)
    %spritemapEntry(1, $1F8, $F4, 0, 0, 2, 0, $120)
    %spritemapEntry(1, $08, $00, 0, 0, 2, 0, $104)
    %spritemapEntry(1, $08, $F0, 0, 0, 2, 0, $11E)
    %spritemapEntry(1, $08, $E8, 0, 0, 2, 0, $10E)
    %spritemapEntry(1, $1F8, $E4, 0, 0, 2, 0, $10A)
    %spritemapEntry(0, $1F0, $EC, 0, 0, 2, 0, $122)
    %spritemapEntry(1, $1E8, $F4, 0, 0, 2, 0, $106)

Spritemaps_MotherBrain_3:
    dw $000A                                                             ;A9A62C;
    %spritemapEntry(1, $1FF, $0E, 0, 0, 2, 0, $124)
    %spritemapEntry(1, $1E8, $04, 0, 0, 2, 0, $108)
    %spritemapEntry(1, $1F8, $04, 0, 0, 2, 0, $102)
    %spritemapEntry(1, $1F8, $F4, 0, 0, 2, 0, $120)
    %spritemapEntry(1, $08, $00, 0, 0, 2, 0, $104)
    %spritemapEntry(1, $08, $F0, 0, 0, 2, 0, $11E)
    %spritemapEntry(1, $08, $E8, 0, 0, 2, 0, $10E)
    %spritemapEntry(1, $1F8, $E4, 0, 0, 2, 0, $10A)
    %spritemapEntry(0, $1F0, $EC, 0, 0, 2, 0, $122)
    %spritemapEntry(1, $1E8, $F4, 0, 0, 2, 0, $106)

Spritemaps_MotherBrain_4:
    dw $000A                                                             ;A9A660;
    %spritemapEntry(1, $1FC, $10, 0, 0, 2, 0, $126)
    %spritemapEntry(1, $1E8, $04, 0, 0, 2, 0, $108)
    %spritemapEntry(1, $1F8, $04, 0, 0, 2, 0, $102)
    %spritemapEntry(1, $1F8, $F4, 0, 0, 2, 0, $120)
    %spritemapEntry(1, $08, $00, 0, 0, 2, 0, $104)
    %spritemapEntry(1, $08, $F0, 0, 0, 2, 0, $11E)
    %spritemapEntry(1, $08, $E8, 0, 0, 2, 0, $10E)
    %spritemapEntry(1, $1F8, $E4, 0, 0, 2, 0, $10A)
    %spritemapEntry(0, $1F0, $EC, 0, 0, 2, 0, $122)
    %spritemapEntry(1, $1E8, $F4, 0, 0, 2, 0, $106)

Spritemaps_MotherBrain_5:
    dw $0001                                                             ;A9A694;
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $12A)

Spritemaps_MotherBrain_6:
    dw $000C                                                             ;A9A69B;
    %spritemapEntry(0, $0C, $01, 0, 0, 2, 0, $133)
    %spritemapEntry(1, $02, $09, 0, 0, 2, 0, $100)
    %spritemapEntry(1, $08, $00, 0, 0, 2, 0, $104)
    %spritemapEntry(0, $08, $E8, 0, 0, 2, 0, $123)
    %spritemapEntry(1, $08, $F0, 0, 0, 2, 0, $13E)
    %spritemapEntry(1, $1F8, $E4, 0, 0, 2, 0, $13C)
    %spritemapEntry(1, $1F8, $F4, 0, 0, 2, 0, $128)
    %spritemapEntry(1, $1F8, $04, 0, 0, 2, 0, $102)
    %spritemapEntry(0, $1F0, $0C, 0, 0, 2, 0, $14B)
    %spritemapEntry(0, $1F0, $EC, 0, 0, 2, 0, $14A)
    %spritemapEntry(1, $1E8, $F4, 0, 0, 2, 0, $10C)
    %spritemapEntry(1, $1E8, $FC, 0, 0, 2, 0, $11C)

Spritemaps_MotherBrain_7:
    dw $000C                                                             ;A9A6D9;
    %spritemapEntry(0, $0C, $01, 0, 0, 2, 0, $132)
    %spritemapEntry(1, $02, $09, 0, 0, 2, 0, $100)
    %spritemapEntry(1, $08, $00, 0, 0, 2, 0, $104)
    %spritemapEntry(0, $08, $E8, 0, 0, 2, 0, $123)
    %spritemapEntry(1, $08, $F0, 0, 0, 2, 0, $13E)
    %spritemapEntry(1, $1F8, $E4, 0, 0, 2, 0, $13C)
    %spritemapEntry(1, $1F8, $F4, 0, 0, 2, 0, $128)
    %spritemapEntry(1, $1F8, $04, 0, 0, 2, 0, $102)
    %spritemapEntry(0, $1F0, $0C, 0, 0, 2, 0, $14B)
    %spritemapEntry(0, $1F0, $EC, 0, 0, 2, 0, $14A)
    %spritemapEntry(1, $1E8, $F4, 0, 0, 2, 0, $10C)
    %spritemapEntry(1, $1E8, $FC, 0, 0, 2, 0, $11C)

Spritemaps_MotherBrain_8:
    dw $000B                                                             ;A9A717;
    %spritemapEntry(1, $02, $09, 0, 0, 2, 0, $100)
    %spritemapEntry(1, $08, $00, 0, 0, 2, 0, $104)
    %spritemapEntry(0, $08, $E8, 0, 0, 2, 0, $123)
    %spritemapEntry(1, $08, $F0, 0, 0, 2, 0, $13E)
    %spritemapEntry(1, $1F8, $E4, 0, 0, 2, 0, $13C)
    %spritemapEntry(1, $1F8, $F4, 0, 0, 2, 0, $128)
    %spritemapEntry(1, $1F8, $04, 0, 0, 2, 0, $102)
    %spritemapEntry(0, $1F0, $0C, 0, 0, 2, 0, $14B)
    %spritemapEntry(0, $1F0, $EC, 0, 0, 2, 0, $14A)
    %spritemapEntry(1, $1E8, $F4, 0, 0, 2, 0, $10C)
    %spritemapEntry(1, $1E8, $FC, 0, 0, 2, 0, $11C)

Spritemaps_MotherBrain_9:
    dw $000B                                                             ;A9A750;
    %spritemapEntry(1, $1FF, $0E, 0, 0, 2, 0, $124)
    %spritemapEntry(1, $08, $00, 0, 0, 2, 0, $104)
    %spritemapEntry(0, $08, $E8, 0, 0, 2, 0, $123)
    %spritemapEntry(1, $08, $F0, 0, 0, 2, 0, $13E)
    %spritemapEntry(1, $1F8, $E4, 0, 0, 2, 0, $13C)
    %spritemapEntry(1, $1F8, $F4, 0, 0, 2, 0, $128)
    %spritemapEntry(1, $1F8, $04, 0, 0, 2, 0, $102)
    %spritemapEntry(0, $1F0, $0C, 0, 0, 2, 0, $14B)
    %spritemapEntry(0, $1F0, $EC, 0, 0, 2, 0, $14A)
    %spritemapEntry(1, $1E8, $F4, 0, 0, 2, 0, $10C)
    %spritemapEntry(1, $1E8, $FC, 0, 0, 2, 0, $11C)

Spritemaps_MotherBrain_A:
    dw $000B                                                             ;A9A789;
    %spritemapEntry(1, $1FC, $10, 0, 0, 2, 0, $126)
    %spritemapEntry(1, $08, $00, 0, 0, 2, 0, $104)
    %spritemapEntry(0, $08, $E8, 0, 0, 2, 0, $123)
    %spritemapEntry(1, $08, $F0, 0, 0, 2, 0, $13E)
    %spritemapEntry(1, $1F8, $E4, 0, 0, 2, 0, $13C)
    %spritemapEntry(1, $1F8, $F4, 0, 0, 2, 0, $128)
    %spritemapEntry(1, $1F8, $04, 0, 0, 2, 0, $102)
    %spritemapEntry(0, $1F0, $0C, 0, 0, 2, 0, $14B)
    %spritemapEntry(0, $1F0, $EC, 0, 0, 2, 0, $14A)
    %spritemapEntry(1, $1E8, $F4, 0, 0, 2, 0, $10C)
    %spritemapEntry(1, $1E8, $FC, 0, 0, 2, 0, $11C)

Spritemaps_MotherBrain_B:
    dw $0009                                                             ;A9A7C2;
    %spritemapEntry(0, $1C, $1C, 0, 0, 3, 1, $17B)
    %spritemapEntry(1, $14, $0C, 0, 0, 3, 1, $15A)
    %spritemapEntry(1, $0C, $14, 0, 0, 3, 1, $169)
    %spritemapEntry(0, $0C, $0C, 0, 0, 3, 1, $166)
    %spritemapEntry(0, $14, $04, 1, 1, 3, 1, $178)
    %spritemapEntry(0, $04, $14, 0, 0, 3, 1, $178)
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 1, $147)
    %spritemapEntry(1, $1FC, $04, 0, 0, 3, 1, $157)
    %spritemapEntry(1, $04, $FC, 0, 0, 3, 1, $148)

Spritemaps_MotherBrain_C:
    dw $0006                                                             ;A9A7F1;
    %spritemapEntry(1, $1D, $03, 0, 0, 3, 1, $15E)
    %spritemapEntry(1, $1D, $0B, 0, 0, 3, 1, $16E)
    %spritemapEntry(1, $0D, $0B, 0, 0, 3, 1, $162)
    %spritemapEntry(1, $0D, $FB, 0, 0, 3, 1, $160)
    %spritemapEntry(1, $1FD, $03, 0, 0, 3, 1, $16C)
    %spritemapEntry(1, $1FD, $FB, 0, 0, 3, 1, $15C)

Spritemaps_MotherBrain_D:
    dw $0008                                                             ;A9A811;
    %spritemapEntry(0, $28, $00, 1, 0, 3, 1, $177)
    %spritemapEntry(0, $28, $F8, 0, 0, 3, 1, $177)
    %spritemapEntry(1, $18, $00, 1, 0, 3, 1, $143)
    %spritemapEntry(1, $18, $F0, 0, 0, 3, 1, $143)
    %spritemapEntry(1, $10, $00, 1, 0, 3, 1, $142)
    %spritemapEntry(1, $00, $00, 1, 0, 3, 1, $140)
    %spritemapEntry(1, $10, $F0, 0, 0, 3, 1, $142)
    %spritemapEntry(1, $00, $F0, 0, 0, 3, 1, $140)

Spritemaps_MotherBrain_E:
    dw $0006                                                             ;A9A83B;
    %spritemapEntry(1, $1D, $ED, 1, 0, 3, 1, $15E)
    %spritemapEntry(1, $1D, $E5, 1, 0, 3, 1, $16E)
    %spritemapEntry(1, $0D, $E5, 1, 0, 3, 1, $162)
    %spritemapEntry(1, $0D, $F5, 1, 0, 3, 1, $160)
    %spritemapEntry(1, $1FD, $ED, 1, 0, 3, 1, $16C)
    %spritemapEntry(1, $1FD, $F5, 1, 0, 3, 1, $15C)

Spritemaps_MotherBrain_F:
    dw $0001                                                             ;A9A85B;
    %spritemapEntry(1, $1F8, $F8, 0, 0, 3, 1, $164)

Spritemaps_MotherBrain_10:
    dw $0002                                                             ;A9A862;
    %spritemapEntry(1, $1F8, $10, 0, 0, 3, 1, $188)
    %spritemapEntry(1, $1F8, $00, 0, 0, 3, 1, $145)

Spritemaps_MotherBrain_11:
    dw $0002                                                             ;A9A86E;
    %spritemapEntry(1, $1F3, $10, 0, 0, 3, 1, $18A)
    %spritemapEntry(1, $1F7, $00, 0, 0, 3, 1, $181)

Spritemaps_MotherBrain_12:
    dw $0004                                                             ;A9A87A;
    %spritemapEntry(0, $1FB, $0E, 0, 0, 3, 1, $176)
    %spritemapEntry(1, $1EB, $0E, 0, 0, 3, 1, $186)
    %spritemapEntry(1, $1FB, $FE, 0, 0, 3, 1, $184)
    %spritemapEntry(1, $1F3, $FE, 0, 0, 3, 1, $183)

Spritemaps_MotherBrain_13:
    dw $0004                                                             ;A9A890;
    %spritemapEntry(0, $10, $00, 0, 0, 3, 1, $190)
    %spritemapEntry(0, $08, $00, 0, 0, 3, 1, $180)
    %spritemapEntry(1, $1F8, $F8, 0, 0, 3, 1, $18E)
    %spritemapEntry(1, $1E8, $F8, 0, 0, 3, 1, $18C)

Spritemaps_MotherBrain_14:
    dw $0009                                                             ;A9A8A6;
    %spritemapEntry(0, $1C, $1C, 0, 0, 2, 3, $17B)
    %spritemapEntry(1, $14, $0C, 0, 0, 2, 3, $15A)
    %spritemapEntry(1, $0C, $14, 0, 0, 2, 3, $169)
    %spritemapEntry(0, $0C, $0C, 0, 0, 2, 3, $166)
    %spritemapEntry(0, $14, $04, 1, 1, 2, 3, $178)
    %spritemapEntry(0, $04, $14, 0, 0, 2, 3, $178)
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 3, $147)
    %spritemapEntry(1, $1FC, $04, 0, 0, 2, 3, $157)
    %spritemapEntry(1, $04, $FC, 0, 0, 2, 3, $148)

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Spritemaps_MotherBrain_A9A8D5:
    dw $0006                                                             ;A9A8D5;
    %spritemapEntry(1, $1D, $03, 0, 0, 2, 3, $15E)
    %spritemapEntry(1, $1D, $0B, 0, 0, 2, 3, $16E)
    %spritemapEntry(1, $0D, $0B, 0, 0, 2, 3, $162)
    %spritemapEntry(1, $0D, $FB, 0, 0, 2, 3, $160)
    %spritemapEntry(1, $1FD, $03, 0, 0, 2, 3, $16C)
    %spritemapEntry(1, $1FD, $FB, 0, 0, 2, 3, $15C)

UNUSED_Spritemaps_MotherBrain_A9A8F5:
    dw $0008                                                             ;A9A8F5;
    %spritemapEntry(0, $28, $00, 1, 0, 2, 3, $177)
    %spritemapEntry(0, $28, $F8, 0, 0, 2, 3, $177)
    %spritemapEntry(1, $18, $00, 1, 0, 2, 3, $143)
    %spritemapEntry(1, $18, $F0, 0, 0, 2, 3, $143)
    %spritemapEntry(1, $10, $00, 1, 0, 2, 3, $142)
    %spritemapEntry(1, $00, $00, 1, 0, 2, 3, $140)
    %spritemapEntry(1, $10, $F0, 0, 0, 2, 3, $142)
    %spritemapEntry(1, $00, $F0, 0, 0, 2, 3, $140)

UNUSED_Spritemaps_MotherBrain_A9A91F:
    dw $0006                                                             ;A9A91F;
    %spritemapEntry(1, $1D, $ED, 1, 0, 2, 3, $15E)
    %spritemapEntry(1, $1D, $E5, 1, 0, 2, 3, $16E)
    %spritemapEntry(1, $0D, $E5, 1, 0, 2, 3, $162)
    %spritemapEntry(1, $0D, $F5, 1, 0, 2, 3, $160)
    %spritemapEntry(1, $1FD, $ED, 1, 0, 2, 3, $16C)
    %spritemapEntry(1, $1FD, $F5, 1, 0, 2, 3, $15C)
endif ; !FEATURE_KEEP_UNREFERENCED

Spritemaps_MotherBrain_15:
    dw $0001                                                             ;A9A93F;
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 3, $164)

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Spritemaps_MotherBrain_A9A946:
    dw $0002                                                             ;A9A946;
    %spritemapEntry(1, $1F8, $10, 0, 0, 2, 3, $188)
    %spritemapEntry(1, $1F8, $00, 0, 0, 2, 3, $145)

UNUSED_Spritemaps_MotherBrain_A9A952:
    dw $0002                                                             ;A9A952;
    %spritemapEntry(1, $1F3, $10, 0, 0, 2, 3, $18A)
    %spritemapEntry(1, $1F7, $00, 0, 0, 2, 3, $181)
endif ; !FEATURE_KEEP_UNREFERENCED

Spritemaps_MotherBrain_16:
    dw $0004                                                             ;A9A95E;
    %spritemapEntry(0, $1FB, $0E, 0, 0, 2, 3, $176)
    %spritemapEntry(1, $1EB, $0E, 0, 0, 2, 3, $186)
    %spritemapEntry(1, $1FB, $FE, 0, 0, 2, 3, $184)
    %spritemapEntry(1, $1F3, $FE, 0, 0, 2, 3, $183)

Spritemaps_MotherBrain_17:
    dw $0004                                                             ;A9A974;
    %spritemapEntry(0, $10, $00, 0, 0, 2, 3, $190)
    %spritemapEntry(0, $08, $00, 0, 0, 2, 3, $180)
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 3, $18E)
    %spritemapEntry(1, $1E8, $F8, 0, 0, 2, 3, $18C)


ExtendedTilemaps_MotherBrain_0:                                          ;A9A98A;
    dw $FFFE
    dw $2080,$0004, $2338,$2338,$31B7,$31B8
    dw $20C0,$0004, $2338,$31B9,$31BA,$31BB
    dw $2100,$0004, $2338,$31BC,$31BD,$31BE
    dw $2140,$000A, $31BF,$31C0,$31C1,$31C2,$31C3,$31C4,$31C5,$31C6,$31C7,$31C8
    dw $2180,$000A, $31CA,$31CB,$31CC,$31CD,$31CE,$31CF,$31D0,$2338,$2338,$2338
    dw $21C0,$000A, $31D1,$31D2,$31D3,$31D4,$31D5,$31D6,$31D7,$31D8,$2338,$2338
    dw $2200,$000A, $31D9,$31DA,$31DB,$31DC,$31DD,$31DE,$31DF,$31E0,$2338,$2338
    dw $2240,$000A, $31E1,$31E2,$31E3,$31E4,$31E5,$31E6,$31E7,$2338,$2338,$2338
    dw $2280,$000A, $2338,$31E8,$31E9,$31EA,$31EB,$31EC,$31ED,$2338,$2338,$2338
    dw $22C0,$0004, $2338,$2338,$31EE,$31EF
    dw $FFFF

if !FEATURE_KEEP_UNREFERENCED
UNUSED_ExtendedTilemaps_MotherBrain_A9AA4E:                              ;A9AA4E;
    dw $FFFE
    dw $2084,$0002, $2338,$2338
    dw $20C2,$0003, $2338,$2338,$2338
    dw $2102,$0003, $2338,$2338,$2338
    dw $2140,$000A, $2338,$2338,$2338,$2338,$2338,$2338,$2338,$2338,$2338,$2338
    dw $2180,$0007, $2338,$2338,$2338,$2338,$2338,$2338,$2338
    dw $21C0,$0008, $2338,$2338,$2338,$2338,$2338,$2338,$2338,$2338
    dw $2200,$0008, $2338,$2338,$2338,$2338,$2338,$2338,$2338,$2338
    dw $2240,$0007, $2338,$2338,$2338,$2338,$2338,$2338,$2338
    dw $2282,$0006, $2338,$2338,$2338,$2338,$2338,$2338
    dw $22C4,$0002, $2338,$2338
    dw $FFFF
endif ; !FEATURE_KEEP_UNREFERENCED

ExtendedTilemaps_MotherBrain_1:                                          ;A9AAEA;
    dw $FFFE
    dw $2006,$000B, $2338,$2338,$3167,$3168,$3169,$2338,$2338,$2338,$2338,$2338,$2338
    dw $2046,$000B, $2338,$316A,$316B,$316C,$316D,$316E,$2338,$2338,$2338,$2338,$2338
    dw $2086,$000B, $31B8,$316F,$3170,$3171,$3172,$3173,$3174,$3186,$3187,$2338,$2338
    dw $20C6,$000B, $31BB,$3177,$3178,$3179,$317A,$317B,$317C,$3188,$3189,$2338,$2338
    dw $2106,$000B, $31BE,$317F,$3180,$3181,$3182,$3183,$3184,$3185,$2338,$2338,$2338
    dw $FFFF

ExtendedTilemaps_MotherBrain_2:                                          ;A9AB70;
    dw $FFFE
    dw $2006,$000B, $2338,$2338,$3167,$3168,$3169,$2338,$2338,$2338,$2338,$2338,$2338
    dw $2046,$000B, $2338,$316A,$316B,$316C,$316D,$316E,$2338,$2338,$2338,$2338,$2338
    dw $2086,$000B, $31B8,$316F,$3170,$3171,$3172,$3173,$3174,$3175,$3176,$2338,$2338
    dw $20C6,$000B, $31BB,$3177,$3178,$3179,$317A,$317B,$317C,$317D,$317E,$2338,$2338
    dw $2106,$000B, $31BE,$317F,$3180,$3181,$3182,$3183,$3184,$3185,$2338,$2338,$2338
    dw $FFFF

ExtendedTilemaps_MotherBrain_3:                                          ;A9ABF6;
    dw $FFFE
    dw $2006,$0001, $2338
    dw $200A,$0002, $318A,$318B
    dw $2018,$0002, $2338,$2338
    dw $2046,$0001, $2338
    dw $204A,$0003, $318C,$318D,$318E
    dw $2058,$0002, $2338,$2338
    dw $2086,$000B, $31B8,$318F,$3190,$3191,$3192,$3193,$3194,$2338,$2338,$2338,$2338
    dw $20C6,$000B, $31BB,$3195,$3196,$3197,$3198,$3199,$319A,$319B,$2338,$2338,$2338
    dw $2106,$0001, $31BE
    dw $210C,$0004, $319C,$319D,$319E,$319F
    dw $2118,$0002, $2338,$2338
    dw $FFFF

ExtendedTilemaps_MotherBrain_4:                                          ;A9AC76;
    dw $FFFE
    dw $200A,$0003, $3167,$31A0,$31A1
    dw $2046,$0001, $31B6
    dw $204A,$0004, $31A2,$31A3,$31A4,$31A5
    dw $2056,$0003, $31A6,$31A7,$31A8
    dw $2088,$000A, $316F,$31A9,$31AA,$31AB,$31AC,$31AD,$31AE,$31AF,$31B0,$31B1
    dw $20C8,$0007, $3177,$3178,$3178,$31B2,$31B3,$31B4,$31B5
    dw $2106,$0001, $31BE
    dw $210C,$0004, $319C,$319D,$319E,$319F
    dw $2118,$0002, $2338,$2338
    dw $FFFF

ExtendedTilemaps_MotherBrain_5:                                          ;A9ACE4;
    dw $FFFE
    dw $200C,$0002, $3168,$3169
    dw $2046,$0001, $2338
    dw $204A,$0004, $316B,$316C,$316D,$316E
    dw $2056,$0003, $2338,$2338,$2338
    dw $208A,$0009, $3170,$3171,$3172,$3173,$3174,$3186,$3187,$2338,$2338
    dw $20CC,$0006, $3179,$317A,$317B,$317C,$3188,$3189
    dw $210C,$0004, $3181,$3182,$3183,$3184
    dw $FFFF

Spritemaps_MotherBrain_18:
    dw $0009                                                             ;A9AD3E;
    %spritemapEntry(1, $08, $08, 0, 0, 2, 0, $1E4)
    %spritemapEntry(1, $1F8, $08, 0, 0, 2, 0, $1E2)
    %spritemapEntry(1, $1E8, $08, 0, 0, 2, 0, $1E0)
    %spritemapEntry(1, $08, $F8, 0, 0, 2, 0, $1C4)
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $1C2)
    %spritemapEntry(1, $1E8, $F8, 0, 0, 2, 0, $1C0)
    %spritemapEntry(1, $08, $E8, 0, 0, 2, 0, $1A4)
    %spritemapEntry(1, $1F8, $E8, 0, 0, 2, 0, $1A2)
    %spritemapEntry(1, $1E8, $E8, 0, 0, 2, 0, $1A0)

Spritemaps_MotherBrain_19:
    dw $000A                                                             ;A9AD6D;
    %spritemapEntry(1, $14, $08, 0, 0, 2, 0, $1EC)
    %spritemapEntry(1, $04, $08, 0, 0, 2, 0, $1EA)
    %spritemapEntry(1, $1F4, $08, 0, 0, 2, 0, $1E8)
    %spritemapEntry(1, $1E4, $08, 0, 0, 2, 0, $1E6)
    %spritemapEntry(1, $04, $F8, 0, 0, 2, 0, $1CA)
    %spritemapEntry(1, $1F4, $F8, 0, 0, 2, 0, $1C8)
    %spritemapEntry(1, $1E4, $F8, 0, 0, 2, 0, $1C6)
    %spritemapEntry(1, $04, $E8, 0, 0, 2, 0, $1AA)
    %spritemapEntry(1, $1F4, $E8, 0, 0, 2, 0, $1A8)
    %spritemapEntry(1, $1E4, $E8, 0, 0, 2, 0, $1A6)

Spritemaps_MotherBrainTubes_0:
    dw $000A                                                             ;A9ADA1;
    %spritemapEntry(0, $08, $E4, 0, 0, 2, 7, $15D)
    %spritemapEntry(0, $08, $DC, 0, 0, 2, 7, $14D)
    %spritemapEntry(0, $00, $E4, 0, 0, 2, 7, $15D)
    %spritemapEntry(0, $00, $DC, 0, 0, 2, 7, $14D)
    %spritemapEntry(1, $43F0, $DC, 0, 0, 2, 7, $142)
    %spritemapEntry(0, $1F8, $1C, 0, 0, 2, 7, $151)
    %spritemapEntry(0, $1F0, $1C, 0, 0, 2, 7, $150)
    %spritemapEntry(1, $43F0, $FC, 0, 0, 2, 7, $147)
    %spritemapEntry(1, $43F0, $EC, 1, 0, 2, 7, $140)
    %spritemapEntry(1, $43F0, $0C, 0, 0, 2, 7, $140)

Spritemaps_MotherBrainTubes_1:
    dw $000A                                                             ;A9ADD5;
    %spritemapEntry(0, $1F0, $E4, 0, 1, 2, 7, $15D)
    %spritemapEntry(0, $1F0, $DC, 0, 1, 2, 7, $14D)
    %spritemapEntry(0, $1F8, $E4, 0, 1, 2, 7, $15D)
    %spritemapEntry(0, $1F8, $DC, 0, 1, 2, 7, $14D)
    %spritemapEntry(1, $4200, $DC, 0, 1, 2, 7, $142)
    %spritemapEntry(0, $00, $1C, 0, 1, 2, 7, $151)
    %spritemapEntry(0, $08, $1C, 0, 1, 2, 7, $150)
    %spritemapEntry(1, $4200, $FC, 0, 1, 2, 7, $147)
    %spritemapEntry(1, $4200, $EC, 1, 1, 2, 7, $140)
    %spritemapEntry(1, $4200, $0C, 0, 1, 2, 7, $140)

Spritemaps_MotherBrainTubes_2:
    dw $0008                                                             ;A9AE09;
    %spritemapEntry(1, $43F8, $E4, 0, 0, 2, 7, $144)
    %spritemapEntry(0, $00, $14, 0, 0, 2, 7, $151)
    %spritemapEntry(0, $1F8, $14, 0, 0, 2, 7, $150)
    %spritemapEntry(1, $43F8, $04, 0, 0, 2, 7, $14B)
    %spritemapEntry(0, $00, $FC, 0, 0, 2, 7, $151)
    %spritemapEntry(0, $1F8, $FC, 0, 0, 2, 7, $150)
    %spritemapEntry(0, $00, $F4, 0, 0, 2, 7, $151)
    %spritemapEntry(0, $1F8, $F4, 0, 0, 2, 7, $150)

Spritemaps_MotherBrainTubes_3:
    dw $0008                                                             ;A9AE33;
    %spritemapEntry(1, $43F8, $E4, 0, 1, 2, 7, $144)
    %spritemapEntry(0, $1F8, $14, 0, 1, 2, 7, $151)
    %spritemapEntry(0, $00, $14, 0, 1, 2, 7, $150)
    %spritemapEntry(1, $43F8, $04, 0, 0, 2, 7, $14B)
    %spritemapEntry(0, $1F8, $FC, 0, 1, 2, 7, $151)
    %spritemapEntry(0, $00, $FC, 0, 1, 2, 7, $150)
    %spritemapEntry(0, $1F8, $F4, 0, 1, 2, 7, $151)
    %spritemapEntry(0, $00, $F4, 0, 1, 2, 7, $150)

Spritemaps_MotherBrainTubes_4:
    dw $001A                                                             ;A9AE5D;
    %spritemapEntry(0, $00, $E0, 0, 1, 2, 7, $170)
    %spritemapEntry(0, $1F8, $E0, 0, 0, 2, 7, $170)
    %spritemapEntry(0, $00, $D8, 0, 1, 2, 7, $160)
    %spritemapEntry(0, $1F8, $D8, 0, 0, 2, 7, $160)
    %spritemapEntry(0, $08, $28, 0, 0, 2, 7, $16D)
    %spritemapEntry(0, $00, $28, 0, 0, 2, 7, $16D)
    %spritemapEntry(0, $1F8, $28, 0, 0, 2, 7, $16D)
    %spritemapEntry(0, $1F0, $28, 0, 0, 2, 7, $16D)
    %spritemapEntry(0, $08, $20, 0, 0, 2, 7, $16D)
    %spritemapEntry(0, $00, $20, 0, 0, 2, 7, $16D)
    %spritemapEntry(0, $1F8, $20, 0, 0, 2, 7, $16D)
    %spritemapEntry(0, $1F0, $20, 0, 0, 2, 7, $16D)
    %spritemapEntry(0, $08, $18, 0, 0, 2, 7, $16C)
    %spritemapEntry(0, $00, $18, 0, 0, 2, 7, $16C)
    %spritemapEntry(0, $1F8, $18, 0, 0, 2, 7, $16C)
    %spritemapEntry(0, $1F0, $18, 0, 0, 2, 7, $16C)
    %spritemapEntry(1, $4200, $F8, 0, 1, 2, 7, $149)
    %spritemapEntry(1, $43F0, $F8, 0, 0, 2, 7, $149)
    %spritemapEntry(1, $4200, $08, 0, 1, 2, 7, $146)
    %spritemapEntry(1, $43F0, $08, 0, 0, 2, 7, $146)
    %spritemapEntry(1, $4200, $E8, 0, 0, 2, 7, $140)
    %spritemapEntry(1, $43F0, $E8, 0, 0, 2, 7, $140)
    %spritemapEntry(1, $4200, $D8, 1, 1, 2, 7, $14E)
    %spritemapEntry(1, $43F0, $D8, 1, 0, 2, 7, $14E)
    %spritemapEntry(1, $4200, $D0, 1, 1, 2, 7, $15E)
    %spritemapEntry(1, $43F0, $D0, 1, 0, 2, 7, $15E)


;;; $AEE1: Mother Brain body function - third phase - death sequence - move to back of room ;;;
Function_MBBody_Phase3_DeathSequence_MoveToBackOfRoom:
    LDA.W Enemy.properties                                               ;A9AEE1;
    ORA.W #$0400                                                         ;A9AEE4;
    STA.W Enemy.properties                                               ;A9AEE7;
    LDA.W Enemy[1].properties                                            ;A9AEEA;
    ORA.W #$0400                                                         ;A9AEED;
    STA.W Enemy[1].properties                                            ;A9AEF0;
    LDA.W #$0000                                                         ;A9AEF3;
    STA.L MotherBrainBody.hitboxesEnabled                                ;A9AEF6;
    LDY.W #$0006                                                         ;A9AEFA;
    LDA.W #$0028                                                         ;A9AEFD;
    JSR.W MakeMotherBrainWalkBackwards                                   ;A9AF00;
    BCS .arrivedAtBack                                                   ;A9AF03;
    RTS                                                                  ;A9AF05;

  .arrivedAtBack:
    LDA.W #Function_MBBody_Phase3_DeathSequence_IdleWhilstExploding      ;A9AF06;
    STA.W MotherBrainBody.function                                       ;A9AF09;
    LDA.W #$0080                                                         ;A9AF0C;
    STA.W MotherBrainBody.functionTimer                                  ;A9AF0F; fallthrough to Function_MBBody_Phase3_DeathSequence_IdleWhilstExploding


;;; $AF12: Mother Brain body function - third phase - death sequence - idle whilst exploding ;;;
Function_MBBody_Phase3_DeathSequence_IdleWhilstExploding:
    JSR.W GenerateSmokyExplosionsAroundMotherBrainBody                   ;A9AF12;
    DEC.W MotherBrainBody.functionTimer                                  ;A9AF15;
    BPL .return                                                          ;A9AF18;
    LDA.W #Function_MBBody_Phase3_DeathSequence_StumbleToMiddleOfRoom    ;A9AF1A;
    STA.W MotherBrainBody.function                                       ;A9AF1D;

  .return:
    RTS                                                                  ;A9AF20;


;;; $AF21: Mother Brain body function - third phase - death sequence - stumble to middle of room and drool ;;;
Function_MBBody_Phase3_DeathSequence_StumbleToMiddleOfRoom:
    JSR.W GenerateSmokyExplosionsAroundMotherBrainBody                   ;A9AF21;
    LDY.W #$0002                                                         ;A9AF24;
    LDA.W #$0060                                                         ;A9AF27;
    JSR.W MakeMotherBrainWalkForwards                                    ;A9AF2A;
    BCC Function_MBBody_Phase3_DeathSequence_IdleWhilstExploding_return  ;A9AF2D;
    LDA.W #InstList_MotherBrainHead_DyingDrool_0                         ;A9AF2F;
    JSR.W SetMotherBrainHeadInstList                                     ;A9AF32;
    LDA.W #$0006                                                         ;A9AF35;
    STA.L MotherBrainBody.lowerNeckMovementIndex                         ;A9AF38;
    STA.L MotherBrainBody.upperNeckMovementIndex                         ;A9AF3C;
    LDA.W #$0500                                                         ;A9AF40;
    STA.L MotherBrainBody.neckAngleDelta                                 ;A9AF43;
    LDA.W #Function_MBBody_Phase3_DeathSequence_DisableBrainEffects      ;A9AF47;
    STA.W MotherBrainBody.function                                       ;A9AF4A;
    LDA.W #$0020                                                         ;A9AF4D;
    STA.W MotherBrainBody.functionTimer                                  ;A9AF50;
    RTS                                                                  ;A9AF53;


;;; $AF54: Mother Brain body function - third phase - death sequence - disable brain effects ;;;
Function_MBBody_Phase3_DeathSequence_DisableBrainEffects:
    JSR.W GenerateSmokyExplosionsAroundMotherBrainBody                   ;A9AF54;
    DEC.W MotherBrainBody.functionTimer                                  ;A9AF57;
    BPL Function_MBBody_Phase3_DeathSequence_IdleWhilstExploding_return  ;A9AF5A;
    LDA.W #$0000                                                         ;A9AF5C;
    STA.L MotherBrainBody.lowerNeckMovementIndex                         ;A9AF5F;
    STA.L MotherBrainBody.upperNeckMovementIndex                         ;A9AF63;
    STA.L MotherBrainBody.enableDroolGenerationFlag                      ;A9AF67;
    STA.L MotherBrainBody.smallPurpleBreathGenerationEnabledFlag         ;A9AF6B;
    STA.L MotherBrainBody.enableBrainPaletteHandlingFlag                 ;A9AF6F;
    STA.L MotherBrainBody.enableHealthBasedPaletteHandlingFlag           ;A9AF73;
    LDX.W #$001C                                                         ;A9AF77;

  .loopPalette:
    LDA.L Palettes_SpriteP1+2,X                                          ;A9AF7A;
    STA.L Palettes_SpriteP7+2,X                                          ;A9AF7E;
    DEX                                                                  ;A9AF82;
    DEX                                                                  ;A9AF83;
    BPL .loopPalette                                                     ;A9AF84;
    JSL.L MotherBrainHealthBasedPaletteHandling                          ;A9AF86;
    LDA.W #$0E00                                                         ;A9AF8A;
    STA.L MotherBrainBody.brainPalleteIndex                              ;A9AF8D;
    STZ.W MotherBrainBody.subFunction                                    ;A9AF91;
    STZ.W MotherBrainBody.bodySubFunctionTimer                           ;A9AF94;
    LDA.W #Function_MBBody_Phase3_DeathSequence_SetupBodyFadeOut         ;A9AF97;
    STA.W MotherBrainBody.function                                       ;A9AF9A; fallthrough to Function_MBBody_Phase3_DeathSequence_SetupBodyFadeOut


;;; $AF9D: Mother Brain body function - third phase - death sequence - set up body fade out ;;;
Function_MBBody_Phase3_DeathSequence_SetupBodyFadeOut:
; Function timer is already negative coming into this function...
    JSR.W GenerateMixedExplosionsAroundMotherBrainBody                   ;A9AF9D;
    DEC.W MotherBrainBody.functionTimer                                  ;A9AFA0;
    BMI .timerExpired                                                    ;A9AFA3;
    RTS                                                                  ;A9AFA5;

  .timerExpired:
    LDA.W #$0000                                                         ;A9AFA6;
    STA.L MotherBrainBody.greyTransitionCounter                          ;A9AFA9;
    LDA.W #Function_MBBody_Phase3_DeathSequence_FadeOutBody              ;A9AFAD;
    STA.W MotherBrainBody.function                                       ;A9AFB0;
    STZ.W MotherBrainBody.functionTimer                                  ;A9AFB3; fallthrough to Function_MBBody_Phase3_DeathSequence_FadeOutBody


;;; $AFB6: Mother Brain body function - third phase - death sequence - fade out body ;;;
Function_MBBody_Phase3_DeathSequence_FadeOutBody:
    JSL.L HandleMotherBrainBodyFlickering                                ;A9AFB6;
    JSR.W GenerateMixedExplosionsAroundMotherBrainBody                   ;A9AFBA;
    DEC.W MotherBrainBody.functionTimer                                  ;A9AFBD;
    BPL .returnUpper                                                     ;A9AFC0;
    LDA.W #$0010                                                         ;A9AFC2;
    STA.W MotherBrainBody.functionTimer                                  ;A9AFC5;
    LDA.L MotherBrainBody.greyTransitionCounter                          ;A9AFC8;
    INC                                                                  ;A9AFCC;
    STA.L MotherBrainBody.greyTransitionCounter                          ;A9AFCD;
    DEC                                                                  ;A9AFD1;
    JSL.L FadeMotherBrainPaletteToBlack                                  ;A9AFD2;
    BCS .fadedToBlack                                                    ;A9AFD6;

  .returnUpper:
    RTS                                                                  ;A9AFD8;

  .fadedToBlack:
    LDA.W #$02C6                                                         ;A9AFD9;
    STA.W EnemyBG2TilemapSize                                            ;A9AFDC;
    TAX                                                                  ;A9AFDF;
    PHB                                                                  ;A9AFE0;
    PEA.W $7E7E                                                          ;A9AFE1;
    PLB                                                                  ;A9AFE4;
    PLB                                                                  ;A9AFE5;
    LDA.W #$0338                                                         ;A9AFE6; >.< off by one, causing a few black pixels to remain

  .loopTilemap:
    STA.W EnemyBG2Tilemap,X                                              ;A9AFE9;
    DEX                                                                  ;A9AFEC;
    DEX                                                                  ;A9AFED;
    BPL .loopTilemap                                                     ;A9AFEE;
    PLB                                                                  ;A9AFF0;
    LDA.W #$0001                                                         ;A9AFF1;
    STA.W RequestEnemyBG2TilemapTransferFlag                             ;A9AFF4;
    LDA.W Enemy.properties                                               ;A9AFF7;
    ORA.W #$0100                                                         ;A9AFFA;
    AND.W #$DFFF                                                         ;A9AFFD;
    STA.W Enemy.properties                                               ;A9B000;
    STZ.W Enemy.properties2                                              ;A9B003;
    LDA.W #Function_MBBody_Phase3_DeathSequence_FinalFewExplosions       ;A9B006;
    STA.W MotherBrainBody.function                                       ;A9B009;
    LDA.W #$0010                                                         ;A9B00C;
    STA.W MotherBrainBody.functionTimer                                  ;A9B00F;

  .returnLower:
    RTS                                                                  ;A9B012;


;;; $B013: Mother Brain body function - third phase - death sequence - final few explosions ;;;
Function_MBBody_Phase3_DeathSequence_FinalFewExplosions:
    JSR.W GenerateMixedExplosionsAroundMotherBrainBody                   ;A9B013;
    DEC.W MotherBrainBody.functionTimer                                  ;A9B016;
    BPL Function_MBBody_Phase3_DeathSequence_FadeOutBody_returnLower     ;A9B019;
    LDA.W #Function_MBBody_Phase3_DeathSequence_RealizeDecapitation      ;A9B01B;
    STA.W MotherBrainBody.function                                       ;A9B01E;
    RTS                                                                  ;A9B021;


;;; $B022: Generate smoky explosions around Mother Brain body ;;;
GenerateSmokyExplosionsAroundMotherBrainBody:
    LDA.W #MotherBrainExplosionParameters_1                              ;A9B022;
    STA.B DP_Temp16                                                      ;A9B025;
    LDA.W #$0002                                                         ;A9B027;
    STA.B DP_Temp18                                                      ;A9B02A;
    LDA.W #$0010                                                         ;A9B02C;
    BRA GenerateExplosionsAroundMotherBrainBody                          ;A9B02F;


;;; $B031: Generate mixed explosions around Mother Brain body ;;;
GenerateMixedExplosionsAroundMotherBrainBody:
    LDA.W #MotherBrainExplosionParameters_0                              ;A9B031;
    STA.B DP_Temp16                                                      ;A9B034;
    LDA.W #$0004                                                         ;A9B036;
    STA.B DP_Temp18                                                      ;A9B039;
    LDA.W #$0008                                                         ;A9B03B; fallthrough to GenerateExplosionsAroundMotherBrainBody


;;; $B03E: Generate explosions around Mother Brain body ;;;
GenerateExplosionsAroundMotherBrainBody:
;; Parameters:
;;     A: Mother Brain death explosion interval length
;;     $16: Explosion type set pointer
;;     $18: Number of simultaneous explosions
    DEC.W MotherBrainBody.deathExplosionIntervalTimer                    ;A9B03E;
    BPL Function_MBBody_Phase3_DeathSequence_FadeOutBody_returnLower     ;A9B041;
    STA.W MotherBrainBody.deathExplosionIntervalTimer                    ;A9B043;
    DEC.W MotherBrainBody.deathExplosionIndex                            ;A9B046;
    BPL .getIndex                                                        ;A9B049;
    LDA.W #$0006                                                         ;A9B04B;
    STA.W MotherBrainBody.deathExplosionIndex                            ;A9B04E;

  .getIndex:
    LDA.W MotherBrainBody.deathExplosionIndex                            ;A9B051;
    ASL                                                                  ;A9B054;
    ASL                                                                  ;A9B055;
    ASL                                                                  ;A9B056;
    ASL                                                                  ;A9B057;
    TAX                                                                  ;A9B058;
    LDA.B DP_Temp18                                                      ;A9B059;

  .loop:
    PHA                                                                  ;A9B05B;
    PHX                                                                  ;A9B05C;
    LDA.W .XOffset,X                                                     ;A9B05D;
    STA.B DP_Temp12                                                      ;A9B060;
    LDA.W .YOffset,X                                                     ;A9B062;
    STA.B DP_Temp14                                                      ;A9B065;
    LDX.B DP_Temp16                                                      ;A9B067;
    LDY.W $0000,X                                                        ;A9B069;
    JSL.L GenerateRandomNumber                                           ;A9B06C;
    CMP.W #$4000                                                         ;A9B070;
    BCC .random                                                          ;A9B073;
    LDY.W $0002,X                                                        ;A9B075;
    CMP.W #$E000                                                         ;A9B078;
    BCC .random                                                          ;A9B07B;
    LDY.W $0004,X                                                        ;A9B07D;

  .random:
    TYA                                                                  ;A9B080;
    LDY.W #EnemyProjectile_MotherBrainDeathExplosion                     ;A9B081;
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics                  ;A9B084;
    PLX                                                                  ;A9B088;
    PLA                                                                  ;A9B089;
    INX                                                                  ;A9B08A;
    INX                                                                  ;A9B08B;
    INX                                                                  ;A9B08C;
    INX                                                                  ;A9B08D;
    DEC                                                                  ;A9B08E;
    BNE .loop                                                            ;A9B08F;
    LDA.W #$0013                                                         ;A9B091;
    JSL.L QueueSound_Lib3_Max3                                           ;A9B094;
    RTS                                                                  ;A9B098;

  .XOffset:
    dw $0024                                                             ;A9B099;
  .YOffset:
    dw       $FFDB                                                       ;A9B09B;
    dw              $FFED,$FFF1, $FFFC,$000D, $001D,$0019
    dw $0011,$FFC9, $001E,$FFEA, $FFFD,$FFFB, $0000,$0028
    dw $0034,$FFDE, $FFFD,$FFF1, $000C,$0013, $0019,$002C
    dw $0004,$FFD5, $FFF4,$FFEA, $000D,$FFFE, $FFF8,$0034
    dw $FFFE,$FFDF, $000A,$FFF6, $FFF2,$0010, $0006,$003B
    dw $0014,$FFD7, $0004,$FFEA, $FFEC,$0003, $FFE5,$0039
    dw $000A,$FFE1, $FFEC,$FFF8, $0000,$0017, $001E,$003D


MotherBrainExplosionParameters:
; Enemy projectile parameters
;     0: small explosion
;     1: smoke
;     2: big explosion
;        _______________ 25% chance
;       |      _________ 62.5% chance
;       |     |      ___ 12.5% chance
;       |     |     |
  .0:
    dw $0000,$0001,$0002                                                 ;A9B109;
  .1:
    dw $0001,$0001,$0001                                                 ;A9B10F;


;;; $B115: Mother Brain body function - third phase - death sequence - realise decapitation ;;;
Function_MBBody_Phase3_DeathSequence_RealizeDecapitation:
    LDA.W #InstList_MotherBrainHead_Decapitated_0                        ;A9B115;
    JSR.W SetMotherBrainHeadInstList                                     ;A9B118;
    LDA.W #Function_MotherBrain_SetupBrainToBeDrawn                      ;A9B11B;
    STA.W MotherBrainBody.brainFunction                                  ;A9B11E;
    LDA.W #$0000                                                         ;A9B121;
    STA.W MotherBrainBody.functionTimer                                  ;A9B124;
    LDA.W #Function_MBBody_Phase3_DeathSequence_BrainFallsToGround       ;A9B127;
    STA.W MotherBrainBody.function                                       ;A9B12A; fallthrough to Function_MBBody_Phase3_DeathSequence_BrainFallsToGround


;;; $B12D: Mother Brain body function - third phase - death sequence - brain falls to ground ;;;
Function_MBBody_Phase3_DeathSequence_BrainFallsToGround:
    LDA.W MotherBrainBody.functionTimer                                  ;A9B12D;
    CLC                                                                  ;A9B130;
    ADC.W #$0020                                                         ;A9B131;
    STA.W MotherBrainBody.functionTimer                                  ;A9B134;
    XBA                                                                  ;A9B137;
    AND.W #$00FF                                                         ;A9B138;
    CLC                                                                  ;A9B13B;
    ADC.W Enemy[1].YPosition                                             ;A9B13C;
    CMP.W #$00C4                                                         ;A9B13F;
    BCC .hitGround                                                       ;A9B142;
    LDA.W #$0002                                                         ;A9B144;
    JSL.L EnableEarthquakeTypeInAFor20Frames                             ;A9B147;
    LDA.W #Function_MBBody_Phase3_DeathSequence_LoadCorpseTiles          ;A9B14B;
    STA.W MotherBrainBody.function                                       ;A9B14E;
    LDA.W #$0100                                                         ;A9B151;
    STA.W MotherBrainBody.functionTimer                                  ;A9B154;
    LDA.W #$00C4                                                         ;A9B157;

  .hitGround:
    STA.W Enemy[1].YPosition                                             ;A9B15A;
    RTS                                                                  ;A9B15D;


;;; $B15E: Mother Brain body function - third phase - death sequence - load corpse tiles ;;;
Function_MBBody_Phase3_DeathSequence_LoadCorpseTiles:
    LDX.W #MotherBrainFightSpriteTileTransferEntries_corpse              ;A9B15E;
    JSR.W ProcessSpriteTilesTransfers                                    ;A9B161;
    BCC .return                                                          ;A9B164;
    LDA.W #Function_MBBody_Phase3_DeathSequence_SetupFadeToGrey          ;A9B166;
    STA.W MotherBrainBody.function                                       ;A9B169;
    LDA.W #$0020                                                         ;A9B16C;
    STA.W MotherBrainBody.functionTimer                                  ;A9B16F;

  .return:
    RTS                                                                  ;A9B172;


;;; $B173: Mother Brain body function - third phase - death sequence - set up fade to grey ;;;
Function_MBBody_Phase3_DeathSequence_SetupFadeToGrey:
    DEC.W MotherBrainBody.functionTimer                                  ;A9B173;
    BPL Function_MBBody_Phase3_DeathSequence_LoadCorpseTiles_return      ;A9B176;
    LDA.W #$0000                                                         ;A9B178;
    STA.L MotherBrainBody.greyTransitionCounter                          ;A9B17B;
    LDA.W #Function_MBBody_Phase3_DeathSequence_FadeToGrey               ;A9B17F;
    STA.W MotherBrainBody.function                                       ;A9B182;
    STZ.W MotherBrainBody.functionTimer                                  ;A9B185;
    RTS                                                                  ;A9B188;


;;; $B189: Mother Brain body function - third phase - death sequence - fade to grey ;;;
Function_MBBody_Phase3_DeathSequence_FadeToGrey:
    DEC.W MotherBrainBody.functionTimer                                  ;A9B189;
    BPL .return                                                          ;A9B18C;
    LDA.L MotherBrainBody.greyTransitionCounter                          ;A9B18E;
    INC                                                                  ;A9B192;
    STA.L MotherBrainBody.greyTransitionCounter                          ;A9B193;
    DEC                                                                  ;A9B197;
    JSL.L TransitionMotherBrainPaletteToGrey_RealDeath                   ;A9B198;
    BCS .finishedTransition                                              ;A9B19C;
    LDA.W #$0010                                                         ;A9B19E;
    STA.W MotherBrainBody.functionTimer                                  ;A9B1A1;

  .return:
    RTS                                                                  ;A9B1A4;

  .finishedTransition:
    LDA.W #InstList_MotherBrainHead_Corpse_0                             ;A9B1A5;
    JSR.W SetMotherBrainHeadInstList                                     ;A9B1A8;
    LDA.W #Function_MBBody_Phase3_DeathSequence_CorpseTipsOver           ;A9B1AB;
    STA.W MotherBrainBody.function                                       ;A9B1AE;
    LDA.W #$0100                                                         ;A9B1B1;
    STA.W MotherBrainBody.functionTimer                                  ;A9B1B4;
    RTS                                                                  ;A9B1B7;


;;; $B1B8: Mother Brain body function - third phase - death sequence - corpse tips over ;;;
Function_MBBody_Phase3_DeathSequence_CorpseTipsOver:
    DEC.W MotherBrainBody.functionTimer                                  ;A9B1B8;
    BMI .timerExpired                                                    ;A9B1BB;
    RTS                                                                  ;A9B1BD;

  .timerExpired:
    LDA.W #Function_MBBody_Phase3_DeathSequence_CorpseRotsAway           ;A9B1BE;
    STA.W MotherBrainBody.function                                       ;A9B1C1;
    LDA.W Enemy[1].properties                                            ;A9B1C4;
    ORA.W #$0400                                                         ;A9B1C7;
    STA.W Enemy[1].properties                                            ;A9B1CA;
    LDA.W #$0000                                                         ;A9B1CD;
    STA.L MotherBrainBody.hitboxesEnabled                                ;A9B1D0;
    RTS                                                                  ;A9B1D4;


;;; $B1D5: Mother Brain body function - third phase - death sequence - corpse rots away ;;;
Function_MBBody_Phase3_DeathSequence_CorpseRotsAway:
    LDX.W #$0040                                                         ;A9B1D5;
    JSR.W ProcessCorpseRotting                                           ;A9B1D8;
    BCC .finishedRotting                                                 ;A9B1DB;
    LDX.W #$0040                                                         ;A9B1DD;
    LDA.L MotherBrainBody.corpseRottingVRAMTransfersPointer,X            ;A9B1E0;
    TAX                                                                  ;A9B1E4;
    JMP.W ProcessCorpseRottingVRAMTransfers                              ;A9B1E5;

  .finishedRotting:
    LDA.W Enemy[1].properties                                            ;A9B1E8;
    ORA.W #$0100                                                         ;A9B1EB;
    AND.W #$DFFF                                                         ;A9B1EE;
    STA.W Enemy[1].properties                                            ;A9B1F1;
    STZ.W Enemy[1].properties2                                           ;A9B1F4;
    LDA.W #$0000                                                         ;A9B1F7;
    JSL.L QueueMusicDataOrTrack_8FrameDelay                              ;A9B1FA;
    LDA.W #$FF24                                                         ;A9B1FE;
    JSL.L QueueMusicDataOrTrack_8FrameDelay                              ;A9B201;
    LDA.W #Function_MBBody_Phase3_DeathSequence_20FrameDelay             ;A9B205;
    STA.W MotherBrainBody.function                                       ;A9B208;
    LDA.W #$0014                                                         ;A9B20B;
    STA.W MotherBrainBody.functionTimer                                  ;A9B20E; fallthrough to Function_MBBody_Phase3_DeathSequence_20FrameDelay


;;; $B211: Mother Brain body function - third phase - death sequence - 20 frame delay ;;;
Function_MBBody_Phase3_DeathSequence_20FrameDelay:
    DEC.W MotherBrainBody.functionTimer                                  ;A9B211;
    BPL .return                                                          ;A9B214;
    STZ.W Enemy[1].XPosition                                             ;A9B216;
    STZ.W Enemy[1].YPosition                                             ;A9B219;
    LDA.W #Function_MBBody_Phase3_DeathSequence_LoadEscapeTimerTiles     ;A9B21C;
    STA.W MotherBrainBody.function                                       ;A9B21F;

  .return:
    RTS                                                                  ;A9B222;


;;; $B223: Corpse rotting rot entry finished hook - Mother Brain ;;;
CorpseRottingRotEntryFinishedHook_MotherBrain:
    PHX                                                                  ;A9B223;
    LDA.W RandomNumberSeed                                               ;A9B224;
    AND.W #$001F                                                         ;A9B227;
    CLC                                                                  ;A9B22A;
    ADC.W Enemy[1].XPosition                                             ;A9B22B;
    CLC                                                                  ;A9B22E;
    ADC.W #$FFF0                                                         ;A9B22F;
    STA.B DP_Temp12                                                      ;A9B232;
    LDA.W Enemy[1].YPosition                                             ;A9B234;
    CLC                                                                  ;A9B237;
    ADC.W #$0010                                                         ;A9B238;
    STA.B DP_Temp14                                                      ;A9B23B;
    LDA.W #$000A                                                         ;A9B23D;
    LDY.W #EnemyProjectile_MiscDust                                      ;A9B240;
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics                  ;A9B243;
    LDA.W NumberOfTimesMainEnemyRoutineExecuted                          ;A9B247;
    AND.W #$0007                                                         ;A9B24A;
    BNE .return                                                          ;A9B24D;
    LDA.W #$0010                                                         ;A9B24F;
    JSL.L QueueSound_Lib2_Max3                                           ;A9B252;

  .return:
    PLX                                                                  ;A9B256;
    RTS                                                                  ;A9B257;


;;; $B258: Mother Brain body function - third phase - death sequence - load escape timer tiles ;;;
Function_MBBody_Phase3_DeathSequence_LoadEscapeTimerTiles:
    PHB                                                                  ;A9B258;
    PEA.W ZebesEscapeTimerSpriteTileTransferEntries>>8&$FF00             ;A9B259;
    PLB                                                                  ;A9B25C;
    PLB                                                                  ;A9B25D;
    LDX.W #ZebesEscapeTimerSpriteTileTransferEntries_size                ;A9B25E;
    JSR.W ProcessSpriteTilesTransfers                                    ;A9B261;
    PLB                                                                  ;A9B264;
    BCC Function_MBBody_Phase3_DeathSequence_StartEscape_return          ;A9B265;
    LDA.W #Function_MBBody_Phase3_DeathSequence_StartEscape              ;A9B267;
    STA.W MotherBrainBody.function                                       ;A9B26A; fallthrough to Function_MBBody_Phase3_DeathSequence_StartEscapeSequence


;;; $B26D: Mother Brain body function - third phase - death sequence - start escape sequence ;;;
Function_MBBody_Phase3_DeathSequence_StartEscape:
    LDX.W #MotherBrainFightSpriteTileTransferEntries_explodedDoor        ;A9B26D;
    JSR.W ProcessSpriteTilesTransfers                                    ;A9B270;
    BCC .return                                                          ;A9B273;
    LDY.W #Palette_MotherBrain_ExplodedDoor+2                            ;A9B275;
    LDX.W #$0122                                                         ;A9B278;
    LDA.W #$000E                                                         ;A9B27B;
    JSL.L WriteAColorsFromYtoColorIndexX                                 ;A9B27E;
    LDA.W #$0007                                                         ;A9B282;
    JSL.L QueueMusicDataOrTrack_8FrameDelay                              ;A9B285;
    LDA.W #$0005                                                         ;A9B289;
    STA.W EarthquakeType                                                 ;A9B28C;
    LDA.W #$FFFF                                                         ;A9B28F;
    STA.W EarthquakeTimer                                                ;A9B292;
    LDY.W #PaletteFXObjects_Tourian8_ShutterRedFlashing                  ;A9B295;
    JSL.L Spawn_PaletteFXObject                                          ;A9B298;
    LDY.W #PaletteFXObjects_Tourian10_BackgroundRedFlashing              ;A9B29C;
    JSL.L Spawn_PaletteFXObject                                          ;A9B29F;
    LDY.W #PaletteFXObjects_Tourian20_GeneralLevelRedFlashing            ;A9B2A3;
    JSL.L Spawn_PaletteFXObject                                          ;A9B2A6;
    LDY.W #PaletteFXObjects_Tourian40_RedFlashingArkanoidBlocksRedOrbs   ;A9B2AA;
    JSL.L Spawn_PaletteFXObject                                          ;A9B2AD;
    LDA.W #$0000                                                         ;A9B2B1;
    STA.L MotherBrainBody.enableUnpauseHookFlag                          ;A9B2B4;
    JSL.L SetupZebesEscapeTypewriter                                     ;A9B2B8;
    LDA.W #$0020                                                         ;A9B2BC;
    STA.W MotherBrainBody.functionTimer                                  ;A9B2BF;
    LDY.W #Function_MBBody_Phase3_DeathSequence_SpawnTimeBombSetJapanText;A9B2C2;
    LDA.W JapanText                                                      ;A9B2C5;
    BNE .keepJapanText                                                   ;A9B2C8;
    LDY.W #Function_MBBody_Phase3_DeathSequence_TypeOutZebesEscapeText   ;A9B2CA;

  .keepJapanText:
    STY.W MotherBrainBody.function                                       ;A9B2CD;

  .return:
    RTS                                                                  ;A9B2D0;


;;; $B2D1: Mother Brain body function - third phase - death sequence - spawn time bomb set Japanese text ;;;
Function_MBBody_Phase3_DeathSequence_SpawnTimeBombSetJapanText:
    DEC.W MotherBrainBody.functionTimer                                  ;A9B2D1;
    BPL Function_MBBody_Phase3_DeathSequence_TypeOutZebesEscapeText      ;A9B2D4;
    LDA.W #Function_MBBody_Phase3_DeathSequence_TypeOutZebesEscapeText   ;A9B2D6;
    STA.W MotherBrainBody.function                                       ;A9B2D9;
    LDY.W #EnemyProjectile_TimeBombSetJapanText                          ;A9B2DC;
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics                  ;A9B2DF; fallthrough to Function_MBBody_Phase3_DeathSequence_TypeOutZebesEscapeText


;;; $B2E3: Mother Brain body function - third phase - death sequence - type out Zebes escape text ;;;
Function_MBBody_Phase3_DeathSequence_TypeOutZebesEscapeText:
    LDA.W #$2610                                                         ;A9B2E3;
    JSL.L HandleTypewriterText_External                                  ;A9B2E6;
    BCC .return                                                          ;A9B2EA;
    LDA.W #Function_MBBody_Phase3_DeathSequence_DoorExploding_StartTimer ;A9B2EC;
    STA.W MotherBrainBody.function                                       ;A9B2EF;
    LDA.W #$0020                                                         ;A9B2F2;
    STA.W MotherBrainBody.functionTimer                                  ;A9B2F5;

  .return:
    RTS                                                                  ;A9B2F8;


;;; $B2F9: Mother Brain body function - third phase - death sequence - escape door is exploding, start escape timer ;;;
Function_MBBody_Phase3_DeathSequence_DoorExploding_StartTimer:
    JSL.L GenerateEscapeDoorExplosion                                    ;A9B2F9;
    DEC.W MotherBrainBody.functionTimer                                  ;A9B2FD;
    BPL .return                                                          ;A9B300;
    LDA.W #$000F                                                         ;A9B302;
    JSL.L Run_Samus_Command                                              ;A9B305;
    LDA.W #$0002                                                         ;A9B309;
    STA.W TimerStatus                                                    ;A9B30C;
    JSL.L SetBossBitsInAForCurrentArea                                   ;A9B30F;
    LDA.W #$000E                                                         ;A9B313;
    JSL.L MarkEvent_inA                                                  ;A9B316;
    LDA.W #Function_MBBody_Phase3_DeathSequence_BlowUpEscapeDoor         ;A9B31A;
    STA.W MotherBrainBody.function                                       ;A9B31D;
    LDA.W #$0000                                                         ;A9B320;
    STA.W MotherBrainBody.deathExplosionIntervalTimer                    ;A9B323;
    STA.W MotherBrainBody.escapeDoorIndex                                ;A9B326;

  .return:
    RTS                                                                  ;A9B329;


;;; $B32A: Mother Brain body function - third phase - death sequence - blow up escape door ;;;
Function_MBBody_Phase3_DeathSequence_BlowUpEscapeDoor:
    JSR.W ExplodeMotherBrainEscapeDoor                                   ;A9B32A;
    LDA.W #Function_MBBody_Phase3_DeathSequence_KeepEarthquakeGoing      ;A9B32D;
    STA.W MotherBrainBody.function                                       ;A9B330;
    JSL.L Spawn_Hardcoded_PLM                                            ;A9B333;
    db $00,$06                                                           ;A9B337;
    dw PLMEntries_motherBrainsRoomEscapeDoor                             ;A9B339;
    RTS                                                                  ;A9B33B;


;;; $B33C: Mother Brain body function - third phase - death sequence - keep earthquake going ;;;
Function_MBBody_Phase3_DeathSequence_KeepEarthquakeGoing:
; Final MB body function
    LDA.W EarthquakeTimer                                                ;A9B33C;
    BNE .return                                                          ;A9B33F;
    DEC                                                                  ;A9B341;
    STA.W EarthquakeTimer                                                ;A9B342;

  .return:
    RTS                                                                  ;A9B345;


;;; $B346: Generate escape door explosion ;;;
GenerateEscapeDoorExplosion:
    LDA.W MotherBrainBody.deathExplosionIntervalTimer                    ;A9B346;
    DEC                                                                  ;A9B349;
    STA.W MotherBrainBody.deathExplosionIntervalTimer                    ;A9B34A;
    BPL .return                                                          ;A9B34D;
    LDA.W #$0004                                                         ;A9B34F;
    STA.W MotherBrainBody.deathExplosionIntervalTimer                    ;A9B352;
    LDA.W MotherBrainBody.escapeDoorIndex                                ;A9B355;
    DEC                                                                  ;A9B358;
    STA.W MotherBrainBody.escapeDoorIndex                                ;A9B359;
    BPL .max3                                                            ;A9B35C;
    LDA.W #$0003                                                         ;A9B35E;
    STA.W MotherBrainBody.escapeDoorIndex                                ;A9B361;

  .max3:
    LDA.W MotherBrainBody.escapeDoorIndex                                ;A9B364;
    ASL                                                                  ;A9B367;
    ASL                                                                  ;A9B368;
    TAY                                                                  ;A9B369;
    LDA.W .data0,Y                                                       ;A9B36A;
    STA.B DP_Temp12                                                      ;A9B36D;
    LDA.W .data1,Y                                                       ;A9B36F;
    STA.B DP_Temp14                                                      ;A9B372;
    LDY.W #$0003                                                         ;A9B374;
    JSL.L GenerateRandomNumber                                           ;A9B377;
    CMP.W #$4000                                                         ;A9B37B;
    BCS .keepExplosion                                                   ;A9B37E;
    LDY.W #$000C                                                         ;A9B380;

  .keepExplosion:
    TYA                                                                  ;A9B383;
    LDY.W #EnemyProjectile_MiscDust                                      ;A9B384;
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics                  ;A9B387;
    LDA.W #$0024                                                         ;A9B38B;
    JSL.L QueueSound_Lib2_Max3                                           ;A9B38E;

  .return:
    RTL                                                                  ;A9B392;

  .data0:
    dw $0008                                                             ;A9B393;
  .data1:
    dw       $006C                                                       ;A9B395;
    dw $0018,$0080, $0009,$0090, $0018,$0074


;;; $B3A3: Explode Mother Brain escape door ;;;
ExplodeMotherBrainEscapeDoor:
    LDA.W #$0000                                                         ;A9B3A3;

  .loop:
    PHA                                                                  ;A9B3A6;
    LDY.W #EnemyProjectile_MotherBrainExplodedEscapeDoorParticles        ;A9B3A7;
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics                  ;A9B3AA;
    PLA                                                                  ;A9B3AE;
    INC                                                                  ;A9B3AF;
    CMP.W #$0008                                                         ;A9B3B0;
    BCC .loop                                                            ;A9B3B3;
    RTS                                                                  ;A9B3B5;


;;; $B3B6: Mother Brain / Samus collision detection ;;;
MotherBrain_vs_Samus_CollisionDetection:
    LDA.L MotherBrainBody.hitboxesEnabled                                ;A9B3B6;
    STA.B DP_Temp1A                                                      ;A9B3BA;
    LSR.B DP_Temp1A                                                      ;A9B3BC;
    BCC .checkBrain                                                      ;A9B3BE;
    LDA.W Enemy.XPosition                                                ;A9B3C0;
    STA.B DP_Temp12                                                      ;A9B3C3;
    LDA.W Enemy.YPosition                                                ;A9B3C5;
    STA.B DP_Temp14                                                      ;A9B3C8;
    LDX.W #HitboxDefinitions_MotherBrainBody                             ;A9B3CA;
    JSR.W MotherBrainPart_vs_Samus_CollisionDetection                    ;A9B3CD;
    BCS .return                                                          ;A9B3D0;

  .checkBrain:
    LSR.B DP_Temp1A                                                      ;A9B3D2;
    BCC .checkNeck                                                       ;A9B3D4;
    LDA.W Enemy[1].XPosition                                             ;A9B3D6;
    STA.B DP_Temp12                                                      ;A9B3D9;
    LDA.W Enemy[1].YPosition                                             ;A9B3DB;
    STA.B DP_Temp14                                                      ;A9B3DE;
    LDX.W #HitboxDefinitions_MotherBrainHead                             ;A9B3E0;
    JSR.W MotherBrainPart_vs_Samus_CollisionDetection                    ;A9B3E3;
    BCS .return                                                          ;A9B3E6;

  .checkNeck:
    LSR.B DP_Temp1A                                                      ;A9B3E8;
    BCC .return                                                          ;A9B3EA;
    LDA.L MotherBrainBody.neckSegment1XPosition                          ;A9B3EC;
    STA.B DP_Temp12                                                      ;A9B3F0;
    LDA.L MotherBrainBody.neckSegment1YPosition                          ;A9B3F2;
    STA.B DP_Temp14                                                      ;A9B3F6;
    LDX.W #HitboxDefinitions_MotherBrainNeck                             ;A9B3F8;
    JSR.W MotherBrainPart_vs_Samus_CollisionDetection                    ;A9B3FB;
    BCS .return                                                          ;A9B3FE;
    LDA.L MotherBrainBody.neckSegment2XPosition                          ;A9B400;
    STA.B DP_Temp12                                                      ;A9B404;
    LDA.L MotherBrainBody.neckSegment2YPosition                          ;A9B406;
    STA.B DP_Temp14                                                      ;A9B40A;
    LDX.W #HitboxDefinitions_MotherBrainNeck                             ;A9B40C;
    JSR.W MotherBrainPart_vs_Samus_CollisionDetection                    ;A9B40F;
    BCS .return                                                          ;A9B412;
    LDA.L MotherBrainBody.neckSegment3XPosition                          ;A9B414;
    STA.B DP_Temp12                                                      ;A9B418;
    LDA.L MotherBrainBody.neckSegment3YPosition                          ;A9B41A;
    STA.B DP_Temp14                                                      ;A9B41E;
    LDX.W #HitboxDefinitions_MotherBrainNeck                             ;A9B420;
    JSR.W MotherBrainPart_vs_Samus_CollisionDetection                    ;A9B423;

  .return:
    RTS                                                                  ;A9B426;


;;; $B427: Mother Brain hitbox definitions ;;;
; Used to detect collision with Samus

; Hitbox format is:
;      ________________________ Number of entries
;     |      __________________ Left offset
;     |     |     _____________ Top offset
;     |     |    |     ________ Right offset
;     |     |    |    |     ___ Bottom offset
;     |     |    |    |    |
;     nnnn, llll,tttt,rrrr,bbbb, ...
HitboxDefinitions_MotherBrainBody:
    dw $0002                                                             ;A9B427;
    dw $FFE0,$FFE8,$002A,$0038
    dw $FFE8,$FFD6,$001C,$FFE7

HitboxDefinitions_MotherBrainHead:
    dw $0002                                                             ;A9B439;
    dw $FFE8,$FFEA,$0016,$0000
    dw $FFEA,$0001,$0010,$0014

HitboxDefinitions_MotherBrainNeck:
    dw $0001                                                             ;A9B44B;
    dw $FFF8,$FFF8,$0008,$0008


;;; $B455: Mother Brain part / Samus collision detection ;;;
MotherBrainPart_vs_Samus_CollisionDetection:
;; Parameters:
;;     X: Hitbox definition
;;     $12: Hitbox X position
;;     $14: Hitbox Y position
;; Returns:
;;     Carry: Set if collision
    LDA.W $0000,X                                                        ;A9B455;
    BEQ .returnNoCollision                                               ;A9B458;
    STA.B DP_Temp16                                                      ;A9B45A;
    INX                                                                  ;A9B45C;
    INX                                                                  ;A9B45D;

  .loop:
    LDA.W SamusYPosition                                                 ;A9B45E;
    SEC                                                                  ;A9B461;
    SBC.B DP_Temp14                                                      ;A9B462;
    BPL .SamusBelowHitbox                                                ;A9B464;
    EOR.W #$FFFF                                                         ;A9B466;
    INC                                                                  ;A9B469;
    STA.B DP_Temp18                                                      ;A9B46A;
    LDA.W $0002,X                                                        ;A9B46C;
    BRA +                                                                ;A9B46F;

  .SamusBelowHitbox:
    STA.B DP_Temp18                                                      ;A9B471;
    LDA.W $0006,X                                                        ;A9B473;

+   BPL +                                                                ;A9B476;
    EOR.W #$FFFF                                                         ;A9B478;
    INC                                                                  ;A9B47B;

+   CLC                                                                  ;A9B47C;
    ADC.W SamusYRadius                                                   ;A9B47D;
    SEC                                                                  ;A9B480;
    SBC.B DP_Temp18                                                      ;A9B481;
    BMI .next                                                            ;A9B483;
    LDA.W SamusXPosition                                                 ;A9B485;
    SEC                                                                  ;A9B488;
    SBC.B DP_Temp12                                                      ;A9B489;
    BPL .SamusRightOfHitbox                                              ;A9B48B;
    EOR.W #$FFFF                                                         ;A9B48D;
    INC                                                                  ;A9B490;
    STA.B DP_Temp18                                                      ;A9B491;
    LDA.W $0000,X                                                        ;A9B493;
    BRA +                                                                ;A9B496;

  .SamusRightOfHitbox:
    STA.B DP_Temp18                                                      ;A9B498;
    LDA.W $0004,X                                                        ;A9B49A;

+   BPL +                                                                ;A9B49D;
    EOR.W #$FFFF                                                         ;A9B49F;
    INC                                                                  ;A9B4A2;

+   CLC                                                                  ;A9B4A3;
    ADC.W SamusXRadius                                                   ;A9B4A4;
    SEC                                                                  ;A9B4A7;
    SBC.B DP_Temp18                                                      ;A9B4A8;
    BPL .hit                                                             ;A9B4AA;

  .next:
    DEC.B DP_Temp16                                                      ;A9B4AC;
    BEQ .returnNoCollision                                               ;A9B4AE;
    TXA                                                                  ;A9B4B0;
    CLC                                                                  ;A9B4B1;
    ADC.W #$0008                                                         ;A9B4B2;
    TAX                                                                  ;A9B4B5;
    JMP.W .loop                                                          ;A9B4B6;

  .returnNoCollision:
    CLC                                                                  ;A9B4B9;
    RTS                                                                  ;A9B4BA;

  .hit:
    CMP.W #$0004                                                         ;A9B4BB;
    BPL .min4                                                            ;A9B4BE;
    LDA.W #$0004                                                         ;A9B4C0;

  .min4:
    STA.W ExtraSamusXDisplacement                                        ;A9B4C3;
    LDA.W #$0004                                                         ;A9B4C6;
    STA.W ExtraSamusYDisplacement                                        ;A9B4C9;
    STZ.W ExtraSamusXSubDisplacement                                     ;A9B4CC;
    STZ.W ExtraSamusYSubDisplacement                                     ;A9B4CF;
    LDA.W #$0060                                                         ;A9B4D2;
    STA.W SamusInvincibilityTimer                                        ;A9B4D5;
    LDA.W #$0005                                                         ;A9B4D8;
    STA.W SamusKnockbackTimer                                            ;A9B4DB;
    LDA.W #$0001                                                         ;A9B4DE;
    STA.W KnockbackXDirection                                            ;A9B4E1;
    LDA.W SamusYPosition                                                 ;A9B4E4;
    CMP.W #$00C0                                                         ;A9B4E7;
    BPL .SamusInAir                                                      ;A9B4EA;
    LDA.W #$0002                                                         ;A9B4EC;
    STA.W SamusYDirection                                                ;A9B4EF;

  .SamusInAir:
    LDA.W Enemy.XPosition                                                ;A9B4F2;
    CLC                                                                  ;A9B4F5;
    ADC.W #$0018                                                         ;A9B4F6;
    CMP.W SamusXPosition                                                 ;A9B4F9;
    BPL .returnCollision                                                 ;A9B4FC;
    JSR.W HurtSamus_A9B5E1                                               ;A9B4FE;

  .returnCollision:
    SEC                                                                  ;A9B501;
    RTS                                                                  ;A9B502;


;;; $B503: Enemy shot - enemy $EC7F (Mother Brain body) ;;;
EnemyShot_MotherBrainBody:
    JML.L CreateADudShot_Internal                                        ;A9B503; fallthrough to EnemyShot_MotherBrainHead


;;; $B507: Enemy shot - enemy $EC3F (Mother Brain brain) ;;;
EnemyShot_MotherBrainHead:
; This code assumes that Mother Brain's glass is the first spawned PLM (index 4Eh)
    LDA.L MotherBrainBody.form                                           ;A9B507;
    BNE .notFirstPhase                                                   ;A9B50B;
    LDA.W CollisionIndex                                                 ;A9B50D;
    ASL                                                                  ;A9B510;
    TAY                                                                  ;A9B511;
    LDA.W SamusProjectile_Types+1,Y                                      ;A9B512;
    AND.W #$0007                                                         ;A9B515;
    TAY                                                                  ;A9B518;
    LDA.W .projectileType,Y                                              ;A9B519;
    AND.W #$00FF                                                         ;A9B51C;
    BEQ .return                                                          ;A9B51F;
    LDX.W #$004E                                                         ;A9B521;
    CLC                                                                  ;A9B524;
    ADC.W PLM_RoomArgs,X                                                 ;A9B525;
    STA.W PLM_RoomArgs,X                                                 ;A9B528;
    LDA.W #$006E                                                         ;A9B52B;
    JSL.L QueueSound_Lib2_Max6                                           ;A9B52E;
    LDY.W #$000D                                                         ;A9B532;
    LDA.W Enemy[1].flashTimer                                            ;A9B535;
    BEQ +                                                                ;A9B538;
    LSR                                                                  ;A9B53A;
    BCC +                                                                ;A9B53B;
    INY                                                                  ;A9B53D;

+   STY.W Enemy[1].flashTimer                                            ;A9B53E;
    JSL.L NormalEnemyShotAI_NoDeathCheck_NoEnemyShotGraphic_External     ;A9B541;

  .return:
    RTL                                                                  ;A9B545;

  .projectileType:                                                       ;A9B546;
    db $00 ; Beam
    db $01 ; Missile
    db $01 ; Super missile
    db $00 ; Power bomb
    db $00 ; Unused
    db $00 ; Bomb
    db $00 ; Unused
    db $00 ; Beam explosion

  .notFirstPhase:
    JSR.W MotherBrainShotReaction_Phase2_3                               ;A9B54E;
    LDA.L MotherBrainBody.form                                           ;A9B551;
    CMP.W #$0001                                                         ;A9B555;
    BNE .gotoNormalShotAI                                                ;A9B558;
    JML.L CreateADudShot_Internal                                        ;A9B55A;

  .gotoNormalShotAI:
    JML.L NormalEnemyShotAI_NoDeathCheck_NoEnemyShotGraphic_External     ;A9B55E;


;;; $B562: Mother Brain second/third phase shot reaction ;;;
MotherBrainShotReaction_Phase2_3:
    LDA.L MotherBrainBody.form                                           ;A9B562;
    CMP.W #$0004                                                         ;A9B566;
    BNE .notBeam                                                         ;A9B569;
    JSR.W DetermineMotherBrainShotReactionType                           ;A9B56B;
    CMP.W #$0002                                                         ;A9B56E;
    BNE .notBeam                                                         ;A9B571;
    JMP.W MotherBrainBeamShotReaction_Phase3                             ;A9B573;

  .notBeam:
    JSR.W DetermineMotherBrainShotReactionType                           ;A9B576;
    DEC                                                                  ;A9B579;
    BEQ .superMissile                                                    ;A9B57A;
    LDA.L MotherBrainBody.walkCounter                                    ;A9B57C;
    SEC                                                                  ;A9B580;
    SBC.W #$0100                                                         ;A9B581;
    BPL .done                                                            ;A9B584;

  .superMissile:
    LDA.W #$0000                                                         ;A9B586;

  .done:
    STA.L MotherBrainBody.walkCounter                                    ;A9B589;
    RTS                                                                  ;A9B58D;


;;; $B58E: Determine Mother Brain shot reaction type ;;;
DetermineMotherBrainShotReactionType:
; Return [$B5A1 + (collided projectile type)]
    LDA.W CollisionIndex                                                 ;A9B58E;
    ASL                                                                  ;A9B591;
    TAY                                                                  ;A9B592;
    LDA.W SamusProjectile_Types+1,Y                                      ;A9B593;
    AND.W #$0007                                                         ;A9B596;
    TAY                                                                  ;A9B599;
    LDA.W .projectileTypes,Y                                             ;A9B59A;
    AND.W #$00FF                                                         ;A9B59D;
    RTS                                                                  ;A9B5A0;

  .projectileTypes:                                                      ;A9B5A1;
    db $02 ; Beam
    db $01 ; Missile
    db $01 ; Super missile
    db $00 ; Power bomb
    db $00 ; Unused
    db $00 ; Bomb
    db $00 ; Unused
    db $00 ; Beam explosion


;;; $B5A9: Mother Brain third phase beam shot reaction ;;;
MotherBrainBeamShotReaction_Phase3:
    LDA.L MotherBrainBody.walkCounter                                    ;A9B5A9;
    SEC                                                                  ;A9B5AD;
    SBC.W #$010A                                                         ;A9B5AE;
    BPL .maxCounter                                                      ;A9B5B1;
    LDA.W #Function_MotherBrainNeck_SetupHyperBeamRecoil                 ;A9B5B3;
    STA.L MotherBrainBody.neckFunction                                   ;A9B5B6;
    LDA.W #$0000                                                         ;A9B5BA;
    STA.W MotherBrainBody.functionTimer                                  ;A9B5BD;

  .maxCounter:
    STA.L MotherBrainBody.walkCounter                                    ;A9B5C0;
    RTS                                                                  ;A9B5C4;


;;; $B5C5: RTL. Enemy touch - enemy $EC7F (Mother Brain body) ;;;
RTL_A9B5C5:
    RTL                                                                  ;A9B5C5;


;;; $B5C6: Enemy touch - enemy $EC3F (Mother Brain brain) ;;;
EnemyTouch_MotherBrainHead:
; I'm pretty sure it's impossible to touch Mother Brain brain due to the custom hitboxes
; Editor's note: it is possible to trigger this routine by damage boosting into MB's head
    LDA.W MovementType                                                   ;A9B5C6;
    AND.W #$00FF                                                         ;A9B5C9;
    CMP.W #$0003                                                         ;A9B5CC;
    BNE .return                                                          ;A9B5CF;
    LDY.W #$000D                                                         ;A9B5D1;
    LDA.W Enemy[1].flashTimer                                            ;A9B5D4;
    BEQ +                                                                ;A9B5D7;
    LSR                                                                  ;A9B5D9;
    BCC +                                                                ;A9B5DA;
    INY                                                                  ;A9B5DC;

+   STY.W Enemy[1].flashTimer                                            ;A9B5DD;

  .return:
    RTL                                                                  ;A9B5E0;


;;; $B5E1: Hurt Samus ;;;
HurtSamus_A9B5E1:
    JSL.L DealSuitAdjustedEnemyDamageToSamus                             ;A9B5E1;
    LDA.W #$0060                                                         ;A9B5E5;
    STA.W SamusInvincibilityTimer                                        ;A9B5E8;
    LDA.W #$0005                                                         ;A9B5EB;
    STA.W SamusKnockbackTimer                                            ;A9B5EE;
    LDY.W #$0000                                                         ;A9B5F1;
    LDX.W EnemyIndex                                                     ;A9B5F4;
    LDA.W SamusXPosition                                                 ;A9B5F7;
    SEC                                                                  ;A9B5FA;
    SBC.W Enemy.XPosition,X                                              ;A9B5FB;
    BMI .left                                                            ;A9B5FE;
    INY                                                                  ;A9B600;

  .left:
    STY.W KnockbackXDirection                                            ;A9B601;
    RTS                                                                  ;A9B604;


;;; $B605: Mother Brain body function - second phase - thinking ;;;
Function_MotherBrainBody_Phase2_Thinking:
; 4500 is a quarter of full health
    LDA.W Enemy[1].health                                                ;A9B605;
    BNE .notDead                                                         ;A9B608;
    LDA.W #Function_MotherBrainBody_Phase2_FiringRainbowBeam_ExtendNeck  ;A9B60A;
    STA.W MotherBrainBody.function                                       ;A9B60D;
    JMP.W Function_MotherBrainBody_Phase2_FiringRainbowBeam_ExtendNeck   ;A9B610;

  .notDead:
    LDA.L MotherBrainBody.pose                                           ;A9B613;
    BEQ .standing                                                        ;A9B617;
    RTS                                                                  ;A9B619;

  .standing:
    LDA.W Enemy[1].health                                                ;A9B61A;
    CMP.W #$1194                                                         ;A9B61D;
    BMI .lowHealth                                                       ;A9B620;
    LDA.W RandomNumberSeed                                               ;A9B622;
    CMP.W #$1000                                                         ;A9B625;
    BCC .tryAttack                                                       ;A9B628;
    JMP.W HandleMotherBrainWalking                                       ;A9B62A;

  .tryAttack:
    LDA.W #Function_MotherBrainBody_Phase2_TryAttack                     ;A9B62D;
    STA.W MotherBrainBody.function                                       ;A9B630;
    RTS                                                                  ;A9B633;

  .lowHealth:
    LDA.W RandomNumberSeed                                               ;A9B634;
    CMP.W #$2000                                                         ;A9B637;
    BCS +                                                                ;A9B63A;
    JMP.W HandleMotherBrainWalking                                       ;A9B63C;

+   CMP.W #$A000                                                         ;A9B63F;
    BCS .tryAttack                                                       ;A9B642;
    LDA.W #Function_MotherBrainBody_Phase2_FiringDeathBeam               ;A9B644;
    STA.W MotherBrainBody.function                                       ;A9B647;
    RTS                                                                  ;A9B64A;


;;; $B64B: Mother Brain body function - second phase - try attack ;;;
Function_MotherBrainBody_Phase2_TryAttack:
    LDA.L MotherBrainBody.attackPhase                                    ;A9B64B;
    ASL                                                                  ;A9B64F;
    TAX                                                                  ;A9B650;
    JMP.W (.pointers,X)                                                  ;A9B651;

  .pointers:
    dw TryMotherBrainAttack_Phase2_TryAttack                             ;A9B654;
    dw TryMotherBrainPhase2Attack_Cooldown                               ;A9B656;
    dw TryMotherBrainPhase2Attack_EndAttack                              ;A9B658;


;;; $B65A: Try Mother Brain phase 2 attack - try attack ;;;
TryMotherBrainAttack_Phase2_TryAttack:
; [Mother Brain attack phase] = 0
; Call to DecideMotherBrainPhase2AttackStrategy returns from *this* routine if it decided a particular attack,
; must have nothing pushed to the stack
; The call to DecideMotherBrainPhase2AttackStrategy always returns from this routine if Samus is in (almost) any in-air movement type,
; hence the Y proximity condition to use RNG thresholds pointer .SamusClose is (almost) never true
    LDA.W #$0040                                                         ;A9B65A;
    STA.W MotherBrainBody.attackCooldown                                 ;A9B65D;
    LDA.L MotherBrainBody.attackPhase                                    ;A9B660;
    INC                                                                  ;A9B664;
    STA.L MotherBrainBody.attackPhase                                    ;A9B665;
    JSR.W DecideMotherBrainPhase2AttackStrategy                          ;A9B669;
    LDX.W #.default                                                      ;A9B66C;
    LDA.W Enemy[1].YPosition                                             ;A9B66F;
    CLC                                                                  ;A9B672;
    ADC.W #$0004                                                         ;A9B673;
    SEC                                                                  ;A9B676;
    SBC.W SamusYPosition                                                 ;A9B677;
    BPL +                                                                ;A9B67A;
    EOR.W #$FFFF                                                         ;A9B67C;
    INC                                                                  ;A9B67F;

+   CMP.W #$0020                                                         ;A9B680;
    BCS .SamusFar                                                        ;A9B683;
    LDX.W #.SamusClose                                                   ;A9B685;

  .SamusFar:
    SEP #$20                                                             ;A9B688;
    LDY.W #$0000                                                         ;A9B68A;
    LDA.W RandomNumberSeed                                               ;A9B68D;
    CMP.W $0000,X                                                        ;A9B690;
    BCC +                                                                ;A9B693;
    INY                                                                  ;A9B695;
    INY                                                                  ;A9B696;
    CMP.W $0001,X                                                        ;A9B697;
    BCC +                                                                ;A9B69A;
    INY                                                                  ;A9B69C;
    INY                                                                  ;A9B69D;
    CMP.W $0002,X                                                        ;A9B69E;
    BCC +                                                                ;A9B6A1;
    INY                                                                  ;A9B6A3;
    INY                                                                  ;A9B6A4;

+   TYX                                                                  ;A9B6A5;
    REP #$20                                                             ;A9B6A6;
    LDA.W .instListPointers,X                                            ;A9B6A8;
    CMP.W #InstList_MotherBrainHead_Attacking_Bomb_Phase2                ;A9B6AB;
    BEQ .bomb                                                            ;A9B6AE;
    CMP.W #InstList_MotherBrainHead_Attacking_Laser                      ;A9B6B0;
    BEQ .laser                                                           ;A9B6B3;
    JSR.W SetMotherBrainHeadInstList                                     ;A9B6B5;

  .return:
    RTS                                                                  ;A9B6B8;

  .bomb:
    LDA.L MotherBrainBody.bombCounter                                    ;A9B6B9;
    CMP.W #$0001                                                         ;A9B6BD;
    BPL .return                                                          ;A9B6C0;
    LDA.W #Function_MotherBrainBody_FiringBomb_DecideOnWalking           ;A9B6C2;
    STA.W MotherBrainBody.function                                       ;A9B6C5;
    JMP.W Function_MotherBrainBody_FiringBomb_DecideOnWalking            ;A9B6C8;

  .laser:
    LDA.W #Function_MBBody_Phase2_FiringLaser_PositionHeadQuickly        ;A9B6CB;
    STA.W MotherBrainBody.function                                       ;A9B6CE;
    JMP.W Function_MBBody_Phase2_FiringLaser_PositionHeadQuickly         ;A9B6D1;

  .instListPointers:
; Mother Brain brain instruction list pointers
    dw InstList_MotherBrainHead_Neutral_Phase2_0                         ;A9B6D4;
    dw InstList_MotherBrainHead_Attacking_4OnionRings_Phase2             ;A9B6D6;
    dw InstList_MotherBrainHead_Attacking_Laser                          ;A9B6D8;
    dw InstList_MotherBrainHead_Attacking_Bomb_Phase2                    ;A9B6DA;

; RNG thresholds
  .default:
; Default
    db $40,$80,$C0                                                       ;A9B6DC;
  .SamusClose:
; Samus Y position is within 2 rows of Mother Brain's Y position + 4
    db $10,$20,$D0                                                       ;A9B6DF;


;;; $B6E2: Decide Mother Brain phase 2 attack strategy ;;;
DecideMotherBrainPhase2AttackStrategy:
; If Samus is in the air, 50/50 for blue rings or laser
; Else, 50% chance to do bomb
    LDA.W MovementType                                                   ;A9B6E2;
    AND.W #$00FF                                                         ;A9B6E5;
    ASL                                                                  ;A9B6E8;
    TAX                                                                  ;A9B6E9;
    LDA.W .poses,X                                                       ;A9B6EA;
    BNE .aimAtGround                                                     ;A9B6ED;
    LDA.W RandomNumberSeed                                               ;A9B6EF;
    AND.W #$00FF                                                         ;A9B6F2;
    CMP.W #$0080                                                         ;A9B6F5;
    BMI .callersReturn                                                   ;A9B6F8;
    LDA.W #InstList_MotherBrainHead_Attacking_4OnionRings_Phase2         ;A9B6FA;
    JSR.W SetMotherBrainHeadInstList                                     ;A9B6FD;
    PLA                                                                  ;A9B700;
    RTS                                                                  ;A9B701;

  .callersReturn:
    PLA                                                                  ;A9B702;
    LDA.W #Function_MBBody_Phase2_FiringLaser_PositionHeadQuickly        ;A9B703;
    STA.W MotherBrainBody.function                                       ;A9B706;
    JMP.W Function_MBBody_Phase2_FiringLaser_PositionHeadQuickly         ;A9B709;

  .aimAtGround:
    LDA.W RandomNumberSeed                                               ;A9B70C;
    AND.W #$00FF                                                         ;A9B70F;
    CMP.W #$0080                                                         ;A9B712;
    BPL +                                                                ;A9B715;
    RTS                                                                  ;A9B717;

+   LDA.L MotherBrainBody.bombCounter                                    ;A9B718;
    CMP.W #$0001                                                         ;A9B71C;
    BPL .return                                                          ;A9B71F;
    LDA.W #Function_MotherBrainBody_FiringBomb_DecideOnWalking           ;A9B721;
    STA.W MotherBrainBody.function                                       ;A9B724;
    PLA                                                                  ;A9B727;
    JMP.W Function_MotherBrainBody_FiringBomb_DecideOnWalking            ;A9B728;

  .return:
    RTS                                                                  ;A9B72B;

  .poses:                                                                ;A9B72C;
    dw $FFFF ; 0: Standing
    dw $FFEF ; 1: Running
    dw $0000 ; 2: Normal jumping
    dw $0000 ; 3: Spin jumping
    dw $FFFF ; 4: Morph ball - on ground
    dw $FFFF ; 5: Crouching
    dw $0000 ; 6: Falling
    dw $FFFF ; 7: Unused
    dw $0000 ; 8: Morph ball - falling
    dw $0000 ; 9: Unused
    dw $FFFF ; Ah: Knockback / crystal flash ending
    dw $0000 ; Bh: Unused
    dw $0000 ; Ch: Unused
    dw $0000 ; Dh: Unused
    dw $FFEF ; Eh: Turning around - on ground
    dw $FFFF ; Fh: Crouching/standing/morphing/unmorphing transition
    dw $FFFF ; 10h: Moonwalking
    dw $FFFF ; 11h: Spring ball - on ground
    dw $0000 ; 12h: Spring ball - in air
    dw $0000 ; 13h: Spring ball - falling
    dw $0000 ; 14h: Wall jumping
    dw $FFEF ; 15h: Ran into a wall
    dw $FFFF ; 16h: Grappling
    dw $FFFF ; 17h: Turning around - jumping
    dw $FFFF ; 18h: Turning around - falling
    dw $FFFF ; 19h: Damage boost
    dw $FFFF ; 1Ah: Grabbed by Draygon
    dw $FFFF ; 1Bh: Shinespark / crystal flash / drained by metroid / damaged by MB's attacks


;;; $B764: Try Mother Brain phase 2 attack - cooldown ;;;
TryMotherBrainPhase2Attack_Cooldown:
; [Mother Brain attack phase] = 1
    DEC.W MotherBrainBody.attackCooldown                                 ;A9B764;
    BNE .return                                                          ;A9B767;
    LDA.L MotherBrainBody.attackPhase                                    ;A9B769;
    INC                                                                  ;A9B76D;
    STA.L MotherBrainBody.attackPhase                                    ;A9B76E;

  .return:
    RTS                                                                  ;A9B772;


;;; $B773: Try Mother Brain phase 2 attack - end attack ;;;
TryMotherBrainPhase2Attack_EndAttack:
; [Mother Brain attack phase] = 2
    LDA.W #$0000                                                         ;A9B773;
    STA.L MotherBrainBody.attackPhase                                    ;A9B776;
    LDA.W #Function_MotherBrainBody_Phase2_Thinking                      ;A9B77A;
    STA.W MotherBrainBody.function                                       ;A9B77D;
    RTS                                                                  ;A9B780;


;;; $B781: Mother Brain body function - firing bomb - decide on walking ;;;
Function_MotherBrainBody_FiringBomb_DecideOnWalking:
    LDA.W RandomNumberSeed                                               ;A9B781;
    CMP.W #$FF80                                                         ;A9B784;
    BCS MotherBrainFiringBomb_DecideOnCrouching                          ;A9B787;
    LDX.W #$0040                                                         ;A9B789;
    CMP.W #$6000                                                         ;A9B78C;
    BCS +                                                                ;A9B78F;
    LDX.W #$0060                                                         ;A9B791;

+   TXA                                                                  ;A9B794;
    CMP.W Enemy.XPosition                                                ;A9B795;
    BPL MotherBrainFiringBomb_DecideOnCrouching                          ;A9B798;
    STA.W MotherBrainBody.bodyTargetXPosition                            ;A9B79A;
    LDY.W #$0006                                                         ;A9B79D;
    JSR.W MakeMotherBrainWalkBackwards                                   ;A9B7A0;
    BCS MotherBrainFiringBomb_DecideOnCrouching                          ;A9B7A3;
    LDA.W #Function_MotherBrainBody_FiringBomb_WalkingBackwards          ;A9B7A5;
    STA.W MotherBrainBody.function                                       ;A9B7A8;

  .return:
    RTS                                                                  ;A9B7AB;


;;; $B7AC: Mother Brain body function - firing bomb - walking backwards ;;;
Function_MotherBrainBody_FiringBomb_WalkingBackwards:
    LDY.W #$0006                                                         ;A9B7AC;
    LDA.W MotherBrainBody.bodyTargetXPosition                            ;A9B7AF;
    JSR.W MakeMotherBrainWalkBackwards                                   ;A9B7B2;
    BCC Function_MotherBrainBody_FiringBomb_DecideOnWalking_return       ;A9B7B5; fallthrough to MotherBrainFiringBomb_DecideOnCrouching


;;; $B7B7: Mother Brain firing bomb - decide on crouching ;;;
MotherBrainFiringBomb_DecideOnCrouching:
    JSL.L GenerateRandomNumber                                           ;A9B7B7;
    CMP.W #$8000                                                         ;A9B7BB;
    BCC MotherBrainFiringBomb_FireBomb                                   ;A9B7BE;
    LDA.W #Function_MotherBrainBody_FiringBomb_Crouch                    ;A9B7C0;
    STA.W MotherBrainBody.function                                       ;A9B7C3; fallthrough to Function_MotherBrainBody_FiringBomb_Crouch


;;; $B7C6: Mother Brain body function - firing bomb - crouch ;;;
Function_MotherBrainBody_FiringBomb_Crouch:
    JSR.W MakeMotherBrainCrouch                                          ;A9B7C6;
    BCC Function_MotherBrainBody_FiringBomb_DecideOnWalking_return       ;A9B7C9; fallthrough to MotherBrainFiringBomb_FireBomb


;;; $B7CB: Mother Brain firing bomb - fire bomb ;;;
MotherBrainFiringBomb_FireBomb:
    LDY.W #InstList_MotherBrainHead_Attacking_Bomb_Phase2                ;A9B7CB;
    LDA.L MotherBrainBody.phase2CorpseState                              ;A9B7CE;
    BEQ .notCorpse                                                       ;A9B7D2;
    LDY.W #InstList_MotherBrainHead_Attacking_Bomb_Phase3                ;A9B7D4;

  .notCorpse:
    TYA                                                                  ;A9B7D7;
    JSR.W SetMotherBrainHeadInstList                                     ;A9B7D8;
    LDA.W #Function_MotherBrainBody_FiringBomb_FiredBomb                 ;A9B7DB;
    STA.W MotherBrainBody.function                                       ;A9B7DE;
    LDA.W #$002C                                                         ;A9B7E1;
    STA.W MotherBrainBody.functionTimer                                  ;A9B7E4;
    RTS                                                                  ;A9B7E7;


;;; $B7E8: Mother Brain body function - firing bomb - fired bomb ;;;
Function_MotherBrainBody_FiringBomb_FiredBomb:
    DEC.W MotherBrainBody.functionTimer                                  ;A9B7E8;
    BPL MotherBrainFiringBomb_FinishFiringBomb_return                    ;A9B7EB;
    JSR.W MakeMotherBrainStandUp                                         ;A9B7ED;
    BCS MotherBrainFiringBomb_FinishFiringBomb                           ;A9B7F0;
    LDA.W #Function_MotherBrainBody_FiringBomb_StandUp                   ;A9B7F2;
    STA.W MotherBrainBody.function                                       ;A9B7F5; fallthrough to Function_MotherBrainBody_FiringBomb_StandUp


;;; $B7F8: Mother Brain body function - firing bomb - stand up ;;;
Function_MotherBrainBody_FiringBomb_StandUp:
    JSR.W MakeMotherBrainStandUp                                         ;A9B7F8;
    BCC MotherBrainFiringBomb_FinishFiringBomb_return                    ;A9B7FB; fallthrough to MotherBrainFiringBomb_FinishFiringBomb


;;; $B7FD: Mother Brain firing bomb - finish firing bomb ;;;
MotherBrainFiringBomb_FinishFiringBomb:
    LDY.W #Function_MotherBrainBody_Phase2_Thinking                      ;A9B7FD;
    LDA.L MotherBrainBody.phase2CorpseState                              ;A9B800;
    BEQ .notCorpse                                                       ;A9B804;
    LDY.W #Function_MotherBrainBody_Phase2_KillBabyMetroid_Attack        ;A9B806;

  .notCorpse:
    TYA                                                                  ;A9B809;
    STA.W MotherBrainBody.function                                       ;A9B80A;

  .return:
    RTS                                                                  ;A9B80D;


;;; $B80E: Mother Brain body function - second phase - firing laser - position head quickly ;;;
Function_MBBody_Phase2_FiringLaser_PositionHeadQuickly:
    LDX.W #$0008                                                         ;A9B80E;
    LDA.W Enemy[1].YPosition                                             ;A9B811;
    CMP.W SamusYPosition                                                 ;A9B814;
    BPL +                                                                ;A9B817;
    LDX.W #$0006                                                         ;A9B819;

+   TXA                                                                  ;A9B81C;
    STA.L MotherBrainBody.lowerNeckMovementIndex                         ;A9B81D;
    STA.L MotherBrainBody.upperNeckMovementIndex                         ;A9B821;
    LDA.W #$0200                                                         ;A9B825;
    STA.L MotherBrainBody.neckAngleDelta                                 ;A9B828;
    LDA.W #Function_MBBody_Phase2_FiringLaser_PositionHeadSlowlyAndFire  ;A9B82C;
    STA.W MotherBrainBody.function                                       ;A9B82F;
    LDA.W #$0004                                                         ;A9B832;
    STA.W MotherBrainBody.functionTimer                                  ;A9B835;
    RTS                                                                  ;A9B838;


;;; $B839: Mother Brain body function - second phase - firing laser - position head slowly and fire ;;;
Function_MBBody_Phase2_FiringLaser_PositionHeadSlowlyAndFire:
    DEC.W MotherBrainBody.functionTimer                                  ;A9B839;
    BMI .timerExpired                                                    ;A9B83C;
    RTS                                                                  ;A9B83E;

  .timerExpired:
    LDY.W #$0100                                                         ;A9B83F;
    LDA.L MotherBrainBody.neckAngleDelta                                 ;A9B842;
    BPL +                                                                ;A9B846;
    LDY.W #$FF00                                                         ;A9B848;

+   TYA                                                                  ;A9B84B;
    STA.L MotherBrainBody.neckAngleDelta                                 ;A9B84C;
    LDA.W #InstList_MotherBrainHead_Attacking_Laser                      ;A9B850;
    JSR.W SetMotherBrainHeadInstList                                     ;A9B853;
    LDA.W #Function_MotherBrainBody_Phase2_FiringLaser_FinishAttack      ;A9B856;
    STA.W MotherBrainBody.function                                       ;A9B859;
    LDA.W #$0010                                                         ;A9B85C;
    STA.W MotherBrainBody.functionTimer                                  ;A9B85F;
    RTS                                                                  ;A9B862;


;;; $B863: Mother Brain body function - second phase - firing laser - finish attack ;;;
Function_MotherBrainBody_Phase2_FiringLaser_FinishAttack:
    DEC.W MotherBrainBody.functionTimer                                  ;A9B863;
    BMI .timerExpired                                                    ;A9B866;
    RTS                                                                  ;A9B868;

  .timerExpired:
    LDA.W #$0004                                                         ;A9B869;
    STA.L MotherBrainBody.lowerNeckMovementIndex                         ;A9B86C;
    STA.L MotherBrainBody.upperNeckMovementIndex                         ;A9B870;
    LDA.W #Function_MotherBrainBody_Phase2_Thinking                      ;A9B874;
    STA.W MotherBrainBody.function                                       ;A9B877;
    JMP.W Function_MotherBrainBody_Phase2_Thinking                       ;A9B87A;


;;; $B87D: Mother Brain body function - second phase - firing death beam ;;;
Function_MotherBrainBody_Phase2_FiringDeathBeam:
    LDA.L MotherBrainBody.deathBeamAttackPhase                           ;A9B87D;
    ASL                                                                  ;A9B881;
    TAX                                                                  ;A9B882;
    JSR.W (.pointers,X)                                                  ;A9B883;
    RTS                                                                  ;A9B886;

  .pointers:
    dw MotherBrainPhase2_FiringDeathBeam_BackUp                          ;A9B887;
    dw MotherBrainPhase2_FiringDeathBeam_WaitForAnyActiveBombs           ;A9B889;
    dw RTS_A9B8C8                                                        ;A9B88B;
    dw MotherBrainPhase2_FiringDeathBeam_Finish                          ;A9B88D;


;;; $B88F: Mother Brain second phase - firing death beam - back up ;;;
MotherBrainPhase2_FiringDeathBeam_BackUp:
; [Mother Brain death beam attack phase] = 0
    LDY.W #$0008                                                         ;A9B88F;
    LDA.W #$0028                                                         ;A9B892;
    JSR.W MakeMotherBrainWalkBackwards                                   ;A9B895;
    BCC .return                                                          ;A9B898;
    LDA.W #$0008                                                         ;A9B89A;
    STA.L MotherBrainBody.lowerNeckMovementIndex                         ;A9B89D;
    LDA.W #$0006                                                         ;A9B8A1;
    STA.L MotherBrainBody.upperNeckMovementIndex                         ;A9B8A4;
    LDA.L MotherBrainBody.deathBeamAttackPhase                           ;A9B8A8;
    INC                                                                  ;A9B8AC;
    STA.L MotherBrainBody.deathBeamAttackPhase                           ;A9B8AD;

  .return:
    RTS                                                                  ;A9B8B1;


;;; $B8B2: Mother Brain second phase - firing death beam - wait for any active bombs ;;;
MotherBrainPhase2_FiringDeathBeam_WaitForAnyActiveBombs:
; [Mother Brain death beam attack phase] = 1
    LDA.L MotherBrainBody.bombCounter                                    ;A9B8B2;
    BNE .return                                                          ;A9B8B6;
    LDA.W #InstList_MotherBrainBody_DeathBeamMode                        ;A9B8B8;
    JSR.W SetMotherBrainBodyInstList                                     ;A9B8BB;
    LDA.L MotherBrainBody.deathBeamAttackPhase                           ;A9B8BE;
    INC                                                                  ;A9B8C2;
    STA.L MotherBrainBody.deathBeamAttackPhase                           ;A9B8C3;

  .return:
    RTS                                                                  ;A9B8C7;


;;; $B8C8: RTS ;;;
RTS_A9B8C8:
; [Mother Brain death beam attack phase] = 2
    RTS                                                                  ;A9B8C8;


;;; $B8C9: Mother Brain second phase - firing death beam - finish ;;;
MotherBrainPhase2_FiringDeathBeam_Finish:
; [Mother Brain death beam attack phase] = 4
    LDA.W #InstList_MotherBrainHead_Neutral_Phase2_0                     ;A9B8C9;
    JSR.W SetMotherBrainHeadInstList                                     ;A9B8CC;
    LDA.W #$0002                                                         ;A9B8CF;
    STA.L MotherBrainBody.lowerNeckMovementIndex                         ;A9B8D2;
    LDA.W #$0004                                                         ;A9B8D6;
    STA.L MotherBrainBody.upperNeckMovementIndex                         ;A9B8D9;
    LDA.W #$0000                                                         ;A9B8DD;
    STA.L MotherBrainBody.deathBeamAttackPhase                           ;A9B8E0;
    LDA.W #Function_MotherBrainBody_Phase2_Thinking                      ;A9B8E4;
    STA.W MotherBrainBody.function                                       ;A9B8E7;
    RTS                                                                  ;A9B8EA;


;;; $B8EB: Mother Brain body function - second phase - firing rainbow beam - extend neck ;;;
Function_MotherBrainBody_Phase2_FiringRainbowBeam_ExtendNeck:
    LDA.W #InstList_MotherBrainHead_Neutral_Phase2_0                     ;A9B8EB;
    JSR.W SetMotherBrainHeadInstList                                     ;A9B8EE;
    LDA.W #$0040                                                         ;A9B8F1;
    STA.L MotherBrainBody.neckAngleDelta                                 ;A9B8F4;
    LDA.W #$0001                                                         ;A9B8F8;
    STA.L MotherBrainBody.enableNeckMovementFlag                         ;A9B8FB;
    LDA.W #$0002                                                         ;A9B8FF;
    STA.L MotherBrainBody.lowerNeckMovementIndex                         ;A9B902;
    LDA.W #$0004                                                         ;A9B906;
    STA.L MotherBrainBody.upperNeckMovementIndex                         ;A9B909;
    LDA.W #Function_MBBody_Phase2_FiringRainbowBeam_StartCharging        ;A9B90D;
    STA.W MotherBrainBody.function                                       ;A9B910;
    LDA.W #$0100                                                         ;A9B913;
    STA.W MotherBrainBody.functionTimer                                  ;A9B916;

  .return:
    RTS                                                                  ;A9B919;


;;; $B91A: Mother Brain body function - second phase - firing rainbow beam - start charging rainbow beam ;;;
Function_MBBody_Phase2_FiringRainbowBeam_StartCharging:
    DEC.W MotherBrainBody.functionTimer                                  ;A9B91A;
    BPL Function_MotherBrainBody_Phase2_FiringRainbowBeam_ExtendNeck_return ;A9B91D;
    LDA.W #InstList_MotherBrainHead_ChargingRainbowBeam_0                ;A9B91F;
    JSR.W SetMotherBrainHeadInstList                                     ;A9B922;
    LDA.W #Function_MotherBrainBody_Phase2_FiringRainbowBeam_RetractNeck ;A9B925;
    STA.W MotherBrainBody.function                                       ;A9B928; fallthrough to Function_MotherBrainBody_Phase2_FiringRainbowBeam_RetractNeck


;;; $B92B: Mother Brain body function - second phase - firing rainbow beam - retract neck ;;;
Function_MotherBrainBody_Phase2_FiringRainbowBeam_RetractNeck:
    LDA.W #$0028                                                         ;A9B92B;
    JSR.W MakeMBWalkBackwardsReallySlowTowardsXPositionInA_RetractHead   ;A9B92E;
    BCC Function_MotherBrainBody_Phase2_FiringRainbowBeam_ExtendNeck_return ;A9B931;
    LDA.W #Function_MBBody_Phase2_FiringRainbowBeam_WaitForBeamToCharge  ;A9B933;
    STA.W MotherBrainBody.function                                       ;A9B936;
    LDA.W #$0100                                                         ;A9B939;
    STA.W MotherBrainBody.functionTimer                                  ;A9B93C; fallthrough to Function_MBBody_Phase2_FiringRainbowBeam_WaitForBeamToCharge


;;; $B93F: Mother Brain body function - second phase - firing rainbow beam - wait for beam to charge ;;;
Function_MBBody_Phase2_FiringRainbowBeam_WaitForBeamToCharge:
    DEC.W MotherBrainBody.functionTimer                                  ;A9B93F;
    BPL Function_MotherBrainBody_Phase2_FiringRainbowBeam_ExtendNeck_return ;A9B942;
    LDA.W #$0071                                                         ;A9B944;
    JSL.L QueueSound_Lib2_Max6                                           ;A9B947;
    LDA.W #Function_MBBody_Phase2_FiringRainbowBeam_ExtendNeckDown       ;A9B94B;
    STA.W MotherBrainBody.function                                       ;A9B94E; fallthrough to Function_MBBody_Phase2_FiringRainbowBeam_ExtendNeckDown


;;; $B951: Mother Brain body function - second phase - firing rainbow beam - extend neck down ;;;
Function_MBBody_Phase2_FiringRainbowBeam_ExtendNeckDown:
    LDA.W #$0008                                                         ;A9B951;
    STA.W SamusProjectile_CooldownTimer                                  ;A9B954;
    LDA.W #$0006                                                         ;A9B957;
    STA.L MotherBrainBody.lowerNeckMovementIndex                         ;A9B95A;
    STA.L MotherBrainBody.upperNeckMovementIndex                         ;A9B95E;
    LDA.W #$0500                                                         ;A9B962;
    STA.L MotherBrainBody.neckAngleDelta                                 ;A9B965;
    LDA.W #Function_MBBody_Phase2_FiringRainbowBeam_StartFiringRainbowBeam ;A9B969;
    STA.W MotherBrainBody.function                                       ;A9B96C;
    LDA.W #$0010                                                         ;A9B96F;
    STA.W MotherBrainBody.functionTimer                                  ;A9B972; fallthough to Function_MBBody_Phase2_FiringRainbowBeam_StartFiringRainbowBeam


;;; $B975: Mother Brain body function - second phase - firing rainbow beam - start firing rainbow beam ;;;
Function_MBBody_Phase2_FiringRainbowBeam_StartFiringRainbowBeam:
    JSR.W AimMotherBrainRainbowBeam_IncreaseWidth                        ;A9B975;
    LDA.W SamusProjectile_PowerBombFlag                                  ;A9B978;
    BNE .return                                                          ;A9B97B;
    DEC.W MotherBrainBody.functionTimer                                  ;A9B97D;
    BMI .timerExpired                                                    ;A9B980;

  .return:
    RTS                                                                  ;A9B982;

  .timerExpired:
    LDA.W SamusProjectile_PowerBombFlag                                  ;A9B983;
    BNE .return                                                          ;A9B986; >_<
    STZ.W SamusProjectile_CooldownTimer                                  ;A9B988;
    JSR.W ResetMotherBrainBodyRainbowBeamPaletteAnimationIndex           ;A9B98B;
    LDA.W #InstList_MotherBrainHead_FiringRainbowBeam                    ;A9B98E;
    JSR.W SetMotherBrainHeadInstList                                     ;A9B991;
    LDA.W #$0200                                                         ;A9B994;
    STA.L MotherBrainBody.rainbowBeamAngularWidth                        ;A9B997;
    JSL.L Spawn_MotherBrainRainbowBeam_HDMAObject                        ;A9B99B;
    STA.L MotherBrainBody.HDMAObjectIndex                                ;A9B99F;
    LDA.W #$0040                                                         ;A9B9A3;
    STA.L MotherBrainBody.neckAngleDelta                                 ;A9B9A6;
    LDA.W #$0001                                                         ;A9B9AA;
    STA.L MotherBrainBody.enableNeckMovementFlag                         ;A9B9AD;
    LDA.W #$0002                                                         ;A9B9B1;
    STA.L MotherBrainBody.lowerNeckMovementIndex                         ;A9B9B4;
    LDA.W #$0004                                                         ;A9B9B8;
    STA.L MotherBrainBody.upperNeckMovementIndex                         ;A9B9BB;
    STZ.W MotherBrainBody.rainbowBeamExplosionIndex                      ;A9B9BF;
    STZ.W MotherBrainBody.rainbowBeamExplosionTimer                      ;A9B9C2;
    LDA.W #$0005                                                         ;A9B9C5;
    LDY.W Energy                                                         ;A9B9C8;
    CPY.W #$02BC                                                         ;A9B9CB;
    BPL .greaterThan2BC                                                  ;A9B9CE;
    LDA.W #$0018                                                         ;A9B9D0;

  .greaterThan2BC:
    JSL.L Run_Samus_Command                                              ;A9B9D3;
    LDA.W #$0006                                                         ;A9B9D7;
    STA.L MotherBrainBody.numberOfTimesToQueueRainbowBeamSFX             ;A9B9DA;
    LDA.W #Function_MBBody_Phase2_FiringRainbowBeam_MoveSamusTowardWall  ;A9B9DE;
    STA.W MotherBrainBody.function                                       ;A9B9E1;
    RTS                                                                  ;A9B9E4;


;;; $B9E5: Mother Brain body function - second phase - firing rainbow beam - move Samus towards wall ;;;
Function_MBBody_Phase2_FiringRainbowBeam_MoveSamusTowardWall:
    JSR.W PlayMotherBrainRainbowBeamSFX                                  ;A9B9E5;
    JSR.W HandleMotherBrainBodyRainbowBeamPalette                        ;A9B9E8;
    JSR.W AimMotherBrainRainbowBeam_IncreaseWidth                        ;A9B9EB;
    JSR.W HandleMotherBrainRainbowBeamExplosions                         ;A9B9EE;
    JSR.W MoveSamusTowardsWallDueToRainbowBeam                           ;A9B9F1;
    BCC .return                                                          ;A9B9F4;
    LDA.W #Function_MBBody_Phase2_FiringRainbowBeam_1FrameDelay          ;A9B9F6;
    STA.W MotherBrainBody.function                                       ;A9B9F9;
    STZ.W MotherBrainBody.functionTimer                                  ;A9B9FC;

  .return:
    RTS                                                                  ;A9B9FF;


;;; $BA00: Mother Brain body function - second phase - firing rainbow beam - 1 frame delay ;;;
Function_MBBody_Phase2_FiringRainbowBeam_1FrameDelay:
    JSR.W PlayMotherBrainRainbowBeamSFX                                  ;A9BA00;
    JSR.W HandleMotherBrainBodyRainbowBeamPalette                        ;A9BA03;
    JSR.W AimMotherBrainRainbowBeam_IncreaseWidth                        ;A9BA06;
    JSR.W HandleMotherBrainRainbowBeamExplosions                         ;A9BA09;
    JSR.W MoveSamusTowardsWallDueToRainbowBeam                           ;A9BA0C;
    DEC.W MotherBrainBody.functionTimer                                  ;A9BA0F;
    BPL .return                                                          ;A9BA12;
    LDA.W #$0008                                                         ;A9BA14;
    STA.W EarthquakeType                                                 ;A9BA17;
    LDA.W #$0008                                                         ;A9BA1A;
    STA.W EarthquakeTimer                                                ;A9BA1D;
    LDA.W #Function_MBBody_Phase2_FiringRainbowBeam_StartDrainingSamus   ;A9BA20;
    STA.W MotherBrainBody.function                                       ;A9BA23;

  .return:
    RTS                                                                  ;A9BA26;


;;; $BA27: Mother Brain body function - second phase - firing rainbow beam - start draining Samus ;;;
Function_MBBody_Phase2_FiringRainbowBeam_StartDrainingSamus:
    LDA.W #Function_MBBody_Phase2_FiringRainbowBeam_DrainingSamus        ;A9BA27;
    STA.W MotherBrainBody.function                                       ;A9BA2A;
    LDA.W #$012B                                                         ;A9BA2D;
    STA.W MotherBrainBody.functionTimer                                  ;A9BA30;
    STA.W EarthquakeTimer                                                ;A9BA33;
    LDA.W #$0008                                                         ;A9BA36;
    STA.W EarthquakeType                                                 ;A9BA39; fallthough to Function_MBBody_Phase2_FiringRainbowBeam_DrainingSamus


;;; $BA3C: Mother Brain body function - second phase - firing rainbow beam - draining Samus ;;;
Function_MBBody_Phase2_FiringRainbowBeam_DrainingSamus:
    JSR.W PlayMotherBrainRainbowBeamSFX                                  ;A9BA3C;
    JSR.W HandleMotherBrainBodyRainbowBeamPalette                        ;A9BA3F;
    JSR.W AimMotherBrainRainbowBeam_IncreaseWidth                        ;A9BA42;
    JSR.W HandleMotherBrainRainbowBeamExplosions                         ;A9BA45;
    JSL.L DamageSamusDueToRainbowBeam                                    ;A9BA48;
    JSR.W DecrementAmmoDueToRainbowBeam                                  ;A9BA4C;
    JSR.W MoveSamusTowardsMiddleOfWall                                   ;A9BA4F;
    DEC.W MotherBrainBody.functionTimer                                  ;A9BA52;
    BPL Function_MBBody_Phase2_FiringRainbowBeam_FinishFiring_return     ;A9BA55;
    LDA.W #Function_MBBody_Phase2_FiringRainbowBeam_FinishFiring         ;A9BA57;
    STA.W MotherBrainBody.function                                       ;A9BA5A;
    RTS                                                                  ;A9BA5D;


;;; $BA5E: Mother Brain body function - second phase - firing rainbow beam - finish firing rainbow beam ;;;
Function_MBBody_Phase2_FiringRainbowBeam_FinishFiring:
    JSR.W PlayMotherBrainRainbowBeamSFX                                  ;A9BA5E;
    JSR.W HandleMotherBrainBodyRainbowBeamPalette                        ;A9BA61;
    JSR.W AimMotherBrainRainbowBeam                                      ;A9BA64;
    JSR.W HandleMotherBrainRainbowBeamExplosions                         ;A9BA67;
    LDA.L MotherBrainBody.rainbowBeamAngularWidth                        ;A9BA6A;
    SEC                                                                  ;A9BA6E;
    SBC.W #$0180                                                         ;A9BA6F;
    STA.L MotherBrainBody.rainbowBeamAngularWidth                        ;A9BA72;
    CMP.W #$0200                                                         ;A9BA76;
    BPL .return                                                          ;A9BA79;
    LDA.W #$0200                                                         ;A9BA7B;
    STA.L MotherBrainBody.rainbowBeamAngularWidth                        ;A9BA7E;
    LDA.W #$FF00                                                         ;A9BA82;
    STA.W MotherBrainBody.customSamusXVelocity                           ;A9BA85;
    STZ.W MotherBrainBody.customSamusYVelocity                           ;A9BA88;
    LDA.L MotherBrainBody.HDMAObjectIndex                                ;A9BA8B;
    TAX                                                                  ;A9BA8F;
    STZ.W HDMAObject_ChannelBitflags,X                                   ;A9BA90;
    STZ.W EarthquakeTimer                                                ;A9BA93;
    LDA.W #InstList_MotherBrainHead_Neutral_Phase2_0                     ;A9BA96;
    JSR.W SetMotherBrainHeadInstList                                     ;A9BA99;
    JSR.W SetupMotherBrainHeadNormalPalette                              ;A9BA9C;
    JSR.W WriteMotherBrainDefaultPalette                                 ;A9BA9F;
    LDA.W #$0002                                                         ;A9BAA2;
    JSL.L QueueSound_Lib1_Max6                                           ;A9BAA5;
    LDA.W #$0000                                                         ;A9BAA9;
    STA.L MotherBrainBody.rainbowBeamSFXIsPlayingFlag                    ;A9BAAC;
    LDA.W #$0001                                                         ;A9BAB0;
    JSL.L Run_Samus_Command                                              ;A9BAB3;
    LDA.W #$0008                                                         ;A9BAB7;
    STA.W SamusProjectile_CooldownTimer                                  ;A9BABA;
    LDA.W #Function_MBBody_Phase2_FiringRainbowBeam_LetSamusFall         ;A9BABD;
    STA.W MotherBrainBody.function                                       ;A9BAC0;

  .return:
    RTS                                                                  ;A9BAC3;


;;; $BAC4: Mother Brain body function - second phase - firing rainbow beam - let Samus fall ;;;
Function_MBBody_Phase2_FiringRainbowBeam_LetSamusFall:
    LDA.W #$0000                                                         ;A9BAC4;
    JSL.L DrainedSamusController                                         ;A9BAC7;
    LDA.W #Function_MBBody_Phase2_FiringRainbowBeam_WaitForSamusToLand   ;A9BACB;
    STA.W MotherBrainBody.function                                       ;A9BACE; fallthrough to Function_MBBody_Phase2_FiringRainbowBeam_WaitForSamusToLand


;;; $BAD1: Mother Brain body function - second phase - firing rainbow beam - wait for Samus to hit ground ;;;
Function_MBBody_Phase2_FiringRainbowBeam_WaitForSamusToLand:
    JSR.W MoveSamusForFallingAfterRainbowBeam                            ;A9BAD1;
    BCC .return                                                          ;A9BAD4;
    LDA.W #Function_MBBody_Phase2_FiringRainbowBeam_LowerHead            ;A9BAD6;
    STA.W MotherBrainBody.function                                       ;A9BAD9;

  .return:
    RTS                                                                  ;A9BADC;


;;; $BADD: Mother Brain body function - second phase - firing rainbow beam - lower head ;;;
Function_MBBody_Phase2_FiringRainbowBeam_LowerHead:
    LDA.W #$0040                                                         ;A9BADD;
    STA.L MotherBrainBody.neckAngleDelta                                 ;A9BAE0;
    LDA.W #$0001                                                         ;A9BAE4;
    STA.L MotherBrainBody.enableNeckMovementFlag                         ;A9BAE7;
    LDA.W #$0002                                                         ;A9BAEB;
    STA.L MotherBrainBody.lowerNeckMovementIndex                         ;A9BAEE;
    LDA.W #$0004                                                         ;A9BAF2;
    STA.L MotherBrainBody.upperNeckMovementIndex                         ;A9BAF5;
    LDA.W #Function_MBBody_Phase2_FiringRainbowBeam_DecideNextAction     ;A9BAF9;
    STA.W MotherBrainBody.function                                       ;A9BAFC;
    LDA.W #$0080                                                         ;A9BAFF;
    STA.W MotherBrainBody.functionTimer                                  ;A9BB02;

  .return:
    RTS                                                                  ;A9BB05;


;;; $BB06: Mother Brain body function - second phase - firing rainbow beam - decide next action ;;;
Function_MBBody_Phase2_FiringRainbowBeam_DecideNextAction:
    DEC.W MotherBrainBody.functionTimer                                  ;A9BB06;
    BPL Function_MBBody_Phase2_FiringRainbowBeam_LowerHead_return        ;A9BB09;
    LDA.W Energy                                                         ;A9BB0B;
    CMP.W #$0190                                                         ;A9BB0E;
    BMI .lessThan190                                                     ;A9BB11;
    LDA.W #Function_MotherBrainBody_Phase2_FiringRainbowBeam_ExtendNeck  ;A9BB13;
    STA.W MotherBrainBody.function                                       ;A9BB16;
    RTS                                                                  ;A9BB19;

  .lessThan190:
    LDY.W #$000A                                                         ;A9BB1A;
    LDA.W Enemy.XPosition                                                ;A9BB1D;
    CLC                                                                  ;A9BB20;
    ADC.W #$0010                                                         ;A9BB21;
    JSR.W MakeMotherBrainWalkForwards                                    ;A9BB24;
    LDA.W #Function_MBBody_Phase2_FinishSamusOff_GetSamusToLowEnergy     ;A9BB27;
    STA.W MotherBrainBody.function                                       ;A9BB2A;
    RTS                                                                  ;A9BB2D;


;;; $BB2E: Play Mother Brain rainbow beam sound effect ;;;
PlayMotherBrainRainbowBeamSFX:
    LDA.L MotherBrainBody.numberOfTimesToQueueRainbowBeamSFX             ;A9BB2E;
    BMI .return                                                          ;A9BB32;
    DEC                                                                  ;A9BB34;
    STA.L MotherBrainBody.numberOfTimesToQueueRainbowBeamSFX             ;A9BB35;
    LDA.W #$0040                                                         ;A9BB39;
    JSL.L QueueSound_Lib1_Max6                                           ;A9BB3C;
    LDA.W #$0001                                                         ;A9BB40;
    STA.L MotherBrainBody.rainbowBeamSFXIsPlayingFlag                    ;A9BB43;

  .return:
    RTS                                                                  ;A9BB47;


;;; $BB48: Make Mother Brain walk backwards really slow towards X position [A] and retract head ;;;
MakeMBWalkBackwardsReallySlowTowardsXPositionInA_RetractHead:
    LDY.W #$000A                                                         ;A9BB48;
    JSR.W MakeMotherBrainWalkBackwards                                   ;A9BB4B;
    BCS RetractMotherBrainsHead                                          ;A9BB4E;
    RTS                                                                  ;A9BB50;


;;; $BB51: Retract Mother Brain's head ;;;
RetractMotherBrainsHead:
    LDA.W #$0050                                                         ;A9BB51;
    STA.L MotherBrainBody.neckAngleDelta                                 ;A9BB54;
    LDA.W #$0001                                                         ;A9BB58;
    STA.L MotherBrainBody.enableNeckMovementFlag                         ;A9BB5B;
    LDA.W #$0008                                                         ;A9BB5F;
    STA.L MotherBrainBody.lowerNeckMovementIndex                         ;A9BB62;
    LDA.W #$0006                                                         ;A9BB66;
    STA.L MotherBrainBody.upperNeckMovementIndex                         ;A9BB69;
    RTS                                                                  ;A9BB6D;


;;; $BB6E: Aim Mother Brain rainbow beam and increase width ;;;
AimMotherBrainRainbowBeam_IncreaseWidth:
    LDA.L MotherBrainBody.rainbowBeamAngularWidth                        ;A9BB6E;
    CLC                                                                  ;A9BB72;
    ADC.W #$0180                                                         ;A9BB73;
    CMP.W #$0C00                                                         ;A9BB76;
    BMI +                                                                ;A9BB79;
    LDA.W #$0C00                                                         ;A9BB7B;

+   STA.L MotherBrainBody.rainbowBeamAngularWidth                        ;A9BB7E; fallthrough to AimMotherBrainRainbowBeam


;;; $BB82: Aim Mother Brain rainbow beam ;;;
AimMotherBrainRainbowBeam:
    LDA.W SamusXPosition                                                 ;A9BB82;
    SEC                                                                  ;A9BB85;
    SBC.W Enemy[1].XPosition                                             ;A9BB86;
    SEC                                                                  ;A9BB89;
    SBC.W #$0010                                                         ;A9BB8A;
    STA.B DP_Temp12                                                      ;A9BB8D;
    LDA.W SamusYPosition                                                 ;A9BB8F;
    SEC                                                                  ;A9BB92;
    SBC.W Enemy[1].YPosition                                             ;A9BB93;
    SEC                                                                  ;A9BB96;
    SBC.W #$0004                                                         ;A9BB97;
    STA.B DP_Temp14                                                      ;A9BB9A;
    JSL.L CalculateAngleOf_12_14_Offset                                  ;A9BB9C;
    SEC                                                                  ;A9BBA0;
    SBC.W #$0080                                                         ;A9BBA1;
    EOR.W #$FFFF                                                         ;A9BBA4;
    INC                                                                  ;A9BBA7;
    AND.W #$00FF                                                         ;A9BBA8;
    STA.L MotherBrainBody.rainbowBeamAngle                               ;A9BBAB;
    RTS                                                                  ;A9BBAF;


if !FEATURE_KEEP_UNREFERENCED
;;; $BBB0: Calculate Mother Brain rainbow beam HDMA tables ;;;
UNUSED_CalculateMotherBrainRainbowBeamHDMATables_long_A9BBB0:
    JSL.L Calculate_MotherBrain_RainbowBeam_HDMATables                   ;A9BBB0;
    RTS                                                                  ;A9BBB4;
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $BBB5: Move Samus towards wall due to rainbow beam ;;;
MoveSamusTowardsWallDueToRainbowBeam:
;; Returns:
;;     Carry: Set if reached wall (X position EBh), clear otherwise
    LDA.W #$1000                                                         ;A9BBB5;
    JSR.W MoveSamusHorizontallyTowardsWall                               ;A9BBB8;
    BCS .return                                                          ;A9BBBB;
    LDA.L MotherBrainBody.rainbowBeamAngle                               ;A9BBBD;
    STA.B DP_Temp12                                                      ;A9BBC1;
    LDA.W #$1000                                                         ;A9BBC3;
    JSL.L CalculateYVelocityFromSpeedAndAngle                            ;A9BBC6;
    JSR.W MoveSamusVerticallyTowardsCeilingFloor                         ;A9BBCA;
    CLC                                                                  ;A9BBCD;

  .return:
    RTS                                                                  ;A9BBCE;


;;; $BBCF: Move Samus towards middle of wall ;;;
MoveSamusTowardsMiddleOfWall:
    LDA.W #$0040                                                         ;A9BBCF;
    LDY.W #$007C                                                         ;A9BBD2;
    CPY.W SamusYPosition                                                 ;A9BBD5;
    BPL .lessThanEqualTo7C                                               ;A9BBD8;
    EOR.W #$FFFF                                                         ;A9BBDA;
    INC                                                                  ;A9BBDD;

  .lessThanEqualTo7C:
    JMP.W MoveSamusVerticallyTowardsCeilingFloor                         ;A9BBDE;


;;; $BBE1: Move Samus for falling after rainbow beam ;;;
MoveSamusForFallingAfterRainbowBeam:
;; Returns:
;;     Carry: Set if reached floor (not in Y position range 30h..BFh), clear otherwise
    LDA.W MotherBrainBody.customSamusXVelocity                           ;A9BBE1;
    CLC                                                                  ;A9BBE4;
    ADC.W #$0002                                                         ;A9BBE5;
    BMI +                                                                ;A9BBE8;
    LDA.W #$0000                                                         ;A9BBEA;

+   STA.W MotherBrainBody.customSamusXVelocity                           ;A9BBED;
    JSR.W MoveSamusHorizontallyTowardsWall                               ;A9BBF0;
    LDA.W MotherBrainBody.customSamusYVelocity                           ;A9BBF3;
    CLC                                                                  ;A9BBF6;
    ADC.W #$0018                                                         ;A9BBF7;
    STA.W MotherBrainBody.customSamusYVelocity                           ;A9BBFA; fallthrough to MoveSamusVerticallyTowardsCeilingFloor


;;; $BBFD: Move Samus vertically towards ceiling/floor ;;;
MoveSamusVerticallyTowardsCeilingFloor:
;; Parameters:
;;     A: Y velocity. Units of 1/100h px
;; Returns:
;;     Carry: Set if reached ceiling/floor (not in Y position range 30h..BFh), clear otherwise
    SEP #$20                                                             ;A9BBFD;
    CLC                                                                  ;A9BBFF;
    ADC.W SamusYSubPosition+1                                            ;A9BC00;
    STA.W SamusYSubPosition+1                                            ;A9BC03;
    STA.W SamusPreviousYSubPosition+1                                    ;A9BC06;
    REP #$20                                                             ;A9BC09;
    AND.W #$FF00                                                         ;A9BC0B;
    XBA                                                                  ;A9BC0E;
    BPL +                                                                ;A9BC0F;
    ORA.W #$FF00                                                         ;A9BC11;

+   ADC.W SamusYPosition                                                 ;A9BC14;
    CMP.W #$0030                                                         ;A9BC17;
    BMI .load30                                                          ;A9BC1A;
    CMP.W #$00C0                                                         ;A9BC1C;
    BPL .loadC0                                                          ;A9BC1F;
    STA.W SamusYPosition                                                 ;A9BC21;
    STA.W SamusPreviousYPosition                                         ;A9BC24;
    CLC                                                                  ;A9BC27;
    RTS                                                                  ;A9BC28;

  .load30:
    LDA.W #$0030                                                         ;A9BC29;
    BRA +                                                                ;A9BC2C;

  .loadC0:
    LDA.W #$00C0                                                         ;A9BC2E;

+   STA.W SamusYPosition                                                 ;A9BC31;
    STA.W SamusPreviousYPosition                                         ;A9BC34;
    STZ.W SamusYSubPosition                                              ;A9BC37;
    STZ.W SamusPreviousYSubPosition                                      ;A9BC3A;
    SEC                                                                  ;A9BC3D;
    RTS                                                                  ;A9BC3E;


;;; $BC3F: Move Samus horizontally towards wall ;;;
MoveSamusHorizontallyTowardsWall:
;; Parameters:
;;     A: X velocity. Units of 1/100h px
;; Returns:
;;     Carry: Set if reached wall (X position EBh), clear otherwise
    SEP #$20                                                             ;A9BC3F;
    CLC                                                                  ;A9BC41;
    ADC.W SamusXSubPosition+1                                            ;A9BC42;
    STA.W SamusXSubPosition+1                                            ;A9BC45;
    STA.W SamusPreviousXSubPosition+1                                    ;A9BC48;
    REP #$20                                                             ;A9BC4B;
    AND.W #$FF00                                                         ;A9BC4D;
    XBA                                                                  ;A9BC50;
    BPL +                                                                ;A9BC51;
    ORA.W #$FF00                                                         ;A9BC53;

+   ADC.W SamusXPosition                                                 ;A9BC56;
    CMP.W #$00EB                                                         ;A9BC59;
    BPL .greaterThanEqualToEB                                            ;A9BC5C;
    STA.W SamusXPosition                                                 ;A9BC5E;
    STA.W SamusPreviousXPosition                                         ;A9BC61;
    RTS                                                                  ;A9BC64;

  .greaterThanEqualToEB:
    LDA.W #$00EB                                                         ;A9BC65;
    STA.W SamusXPosition                                                 ;A9BC68;
    STA.W SamusPreviousXPosition                                         ;A9BC6B;
    STZ.W SamusXSubPosition                                              ;A9BC6E;
    STZ.W SamusPreviousXSubPosition                                      ;A9BC71;
    SEC                                                                  ;A9BC74;
    RTS                                                                  ;A9BC75;


;;; $BC76: Handle Mother Brain rainbow beam explosions ;;;
HandleMotherBrainRainbowBeamExplosions:
    DEC.W MotherBrainBody.rainbowBeamExplosionTimer                      ;A9BC76;
    BMI .timerExpired                                                    ;A9BC79;
    RTS                                                                  ;A9BC7B;

  .timerExpired:
    LDA.W #$0008                                                         ;A9BC7C;
    STA.W MotherBrainBody.rainbowBeamExplosionTimer                      ;A9BC7F;
    INC.W MotherBrainBody.rainbowBeamExplosionIndex                      ;A9BC82;
    LDA.W MotherBrainBody.rainbowBeamExplosionIndex                      ;A9BC85;
    AND.W #$0007                                                         ;A9BC88;
    ASL                                                                  ;A9BC8B;
    TAX                                                                  ;A9BC8C;
    LDA.W .data0,X                                                       ;A9BC8D;
    STA.B DP_Temp12                                                      ;A9BC90;
    LDA.W .data1,X                                                       ;A9BC92;
    STA.B DP_Temp14                                                      ;A9BC95;
    LDY.W #EnemyProjectile_MotherBrainRainbowBeam_Explosion              ;A9BC97;
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics                  ;A9BC9A;
    LDA.W #$0024                                                         ;A9BC9E;
    JSL.L QueueSound_Lib2_Max6                                           ;A9BCA1;
    RTS                                                                  ;A9BCA5;

  .data0:
    dw $FFF8,$0006,$FFFC,$0002,$0003,$FFFA,$0008,$0000                   ;A9BCA6;

  .data1:
    dw $FFF9,$0002,$0005,$FFFC,$0006,$FFFE,$FFFA,$0007                   ;A9BCB6;


;;; $BCC6: Mother Brain body rainbow beam palette animation index = 0 ;;;
ResetMotherBrainBodyRainbowBeamPaletteAnimationIndex:
    LDA.W #$0000                                                         ;A9BCC6;
    STA.L MotherBrainBody.rainbowBeamPaletteAnimationIndex               ;A9BCC9;
    RTS                                                                  ;A9BCCD;


;;; $BCCE: Write Mother Brain default palette ;;;
WriteMotherBrainDefaultPalette:
; DB should be set to $A9
    LDY.W #Palette_MotherBrain+2                                         ;A9BCCE;
    LDX.W #$0082                                                         ;A9BCD1;
    LDA.W #$000F                                                         ;A9BCD4;
    JSL.L WriteAColorsFromYtoColorIndexX                                 ;A9BCD7;
    LDY.W #Palette_MotherBrain+2                                         ;A9BCDB;
    LDX.W #$0122                                                         ;A9BCDE;
    LDA.W #$000F                                                         ;A9BCE1;
    JSL.L WriteAColorsFromYtoColorIndexX                                 ;A9BCE4;
    LDY.W #Palette_MotherBrain_BackLeg+2                                 ;A9BCE8;
    LDX.W #$0162                                                         ;A9BCEB;
    LDA.W #$000F                                                         ;A9BCEE;
    JSL.L WriteAColorsFromYtoColorIndexX                                 ;A9BCF1;
    RTS                                                                  ;A9BCF5;


;;; $BCF6: Write Mother Brain second phase death palette ;;;
WriteMotherBrainPhase2DeathPalette:
    LDA.L MotherBrainPhase2DeathBeforeGreyPalette_Pointers               ;A9BCF6;
    TAY                                                                  ;A9BCFA;
    BRA WriteMotherBrainPalette                                          ;A9BCFB;


;;; $BCFD: Handle Mother Brain body rainbow beam palette ;;;
HandleMotherBrainBodyRainbowBeamPalette:
    LDA.W Enemy.frameCounter                                             ;A9BCFD;
    AND.W #$0002                                                         ;A9BD00;
    BNE .loadIndex                                                       ;A9BD03;
    RTS                                                                  ;A9BD05;

  .loadIndex:
    LDA.L MotherBrainBody.rainbowBeamPaletteAnimationIndex               ;A9BD06;

  .restart:
    TAX                                                                  ;A9BD0A;
    LDA.L MotherBrainBodyRainbowBeamPalette_Pointers,X                   ;A9BD0B;
    BEQ .restart                                                         ;A9BD0F;
    INX                                                                  ;A9BD11;
    INX                                                                  ;A9BD12;
    TXA                                                                  ;A9BD13;
    STA.L MotherBrainBody.rainbowBeamPaletteAnimationIndex               ;A9BD14;
    LDA.L MotherBrainBodyRainbowBeamPalette_Pointers-2,X                 ;A9BD18;
    TAY                                                                  ;A9BD1C; fallthrough to WriteMotherBrainPalette


;;; $BD1D: Write Mother Brain palette ;;;
WriteMotherBrainPalette:
    PHB                                                                  ;A9BD1D;
    PEA.W MotherBrainHealthBasedPalettes_BrainBody>>8&$FF00              ;A9BD1E;
    PLB                                                                  ;A9BD21;
    PLB                                                                  ;A9BD22;
    PHY                                                                  ;A9BD23;
    LDX.W #$0082                                                         ;A9BD24;
    LDA.W #$000F                                                         ;A9BD27;
    JSL.L WriteAColorsFromYtoColorIndexX                                 ;A9BD2A;
    PLY                                                                  ;A9BD2E;
    LDX.W #$0122                                                         ;A9BD2F;
    LDA.W #$000F                                                         ;A9BD32;
    JSL.L WriteAColorsFromYtoColorIndexX                                 ;A9BD35;
    LDX.W #$0162                                                         ;A9BD39;
    LDA.W #$000F                                                         ;A9BD3C;
    JSL.L WriteAColorsFromYtoColorIndexX                                 ;A9BD3F;
    PLB                                                                  ;A9BD43;
    RTS                                                                  ;A9BD44;


;;; $BD45: Mother Brain body function - second phase - finish Samus off - get Samus to low health ;;;
Function_MBBody_Phase2_FinishSamusOff_GetSamusToLowEnergy:
; NOPing the branch at $A9:BD5F counter-intuitively causes MB to never effectively launch an attack,
; I guess she never gets the chance to spawn a projectile when she's constantly switching attacks
    LDA.W #$0050                                                         ;A9BD45;
    JSL.L Suit_Damage_Division                                           ;A9BD48;
    ASL                                                                  ;A9BD4C;
    ASL                                                                  ;A9BD4D;
    ADC.W #$0014                                                         ;A9BD4E;
    CMP.W Energy                                                         ;A9BD51;
    BPL .done                                                            ;A9BD54;
    LDA.W RandomNumberSeed                                               ;A9BD56;
    AND.W #$0FFF                                                         ;A9BD59;
    CMP.W #$0FA0                                                         ;A9BD5C;
    BCC .noAttack                                                        ;A9BD5F;
    LDA.W #$00A0                                                         ;A9BD61;
    JSL.L Suit_Damage_Division                                           ;A9BD64;
    CLC                                                                  ;A9BD68;
    ADC.W #$0014                                                         ;A9BD69;
    CMP.W Energy                                                         ;A9BD6C;
    BPL .onionRings                                                      ;A9BD6F;
    LDY.W #InstList_MotherBrainHead_Attacking_Bomb_Phase2                ;A9BD71;
    LDA.W RandomNumberSeed                                               ;A9BD74;
    AND.W #$0FFF                                                         ;A9BD77;
    CMP.W #$0FF0                                                         ;A9BD7A;
    BCS .doAttack                                                        ;A9BD7D;

  .onionRings:
    LDY.W #InstList_MotherBrainHead_Attacking_2OnionRings_Phase2         ;A9BD7F;

  .doAttack:
    TYA                                                                  ;A9BD82;
    JMP.W SetMotherBrainHeadInstList                                     ;A9BD83;

  .noAttack:
    LDA.W Enemy.frameCounter                                             ;A9BD86;
    AND.W #$001F                                                         ;A9BD89;
    BNE .return                                                          ;A9BD8C;
    JMP.W MaybeMakeMotherBrainStandUpOrLeanDown                          ;A9BD8E;

  .done:
    LDA.W #Function_MotherBrainBody_Phase2_FinishSamusOff_StandUp        ;A9BD91;
    STA.W MotherBrainBody.function                                       ;A9BD94;

  .return:
    RTS                                                                  ;A9BD97;


;;; $BD98: Mother Brain body function - second phase - finish Samus off - stand up ;;;
Function_MotherBrainBody_Phase2_FinishSamusOff_StandUp:
    JSR.W MakeMotherBrainStandUp                                         ;A9BD98;
    BCC Function_MBBody_Phase2_FinishSamusOff_LoadBabyMetroid_return     ;A9BD9B;
    LDA.W #Function_MBBody_Phase2_FinishSamusOff_AdmireJobWellDone       ;A9BD9D;
    STA.W MotherBrainBody.function                                       ;A9BDA0;
    LDA.W #$0010                                                         ;A9BDA3;
    STA.W MotherBrainBody.functionTimer                                  ;A9BDA6; fallthrough to Function_MBBody_Phase2_FinishSamusOff_AdmireJobWellDone


;;; $BDA9: Mother Brain body function - second phase - finish Samus off - admire job well done ;;;
Function_MBBody_Phase2_FinishSamusOff_AdmireJobWellDone:
    DEC.W MotherBrainBody.functionTimer                                  ;A9BDA9;
    BPL Function_MBBody_Phase2_FinishSamusOff_LoadBabyMetroid_return     ;A9BDAC;
    LDA.W #InstList_MotherBrainHead_Stretching_Phase2_0                  ;A9BDAE;
    JSR.W SetMotherBrainHeadInstList                                     ;A9BDB1;
    LDA.W #Function_MBBody_Phase2_FinishSamusOff_ChargeFinalRainbowBeam  ;A9BDB4;
    STA.W MotherBrainBody.function                                       ;A9BDB7;
    LDA.W #$0100                                                         ;A9BDBA;
    STA.W MotherBrainBody.functionTimer                                  ;A9BDBD;
    RTS                                                                  ;A9BDC0;


;;; $BDC1: Mother Brain body function - second phase - finish Samus off - charge final rainbow beam ;;;
Function_MBBody_Phase2_FinishSamusOff_ChargeFinalRainbowBeam:
    DEC.W MotherBrainBody.functionTimer                                  ;A9BDC1;
    BPL Function_MBBody_Phase2_FinishSamusOff_LoadBabyMetroid_return     ;A9BDC4;
    LDA.W #InstList_MotherBrainHead_ChargingRainbowBeam_0                ;A9BDC6;
    JSR.W SetMotherBrainHeadInstList                                     ;A9BDC9;
    LDA.W #Function_MBBody_Phase2_FinishSamusOff_LoadBabyMetroid         ;A9BDCC;
    STA.W MotherBrainBody.function                                       ;A9BDCF; fallthough to Function_MBBody_Phase2_FinishSamusOff_LoadBabyMetroid


;;; $BDD2: Mother Brain body function - second phase - finish Samus off - charge final rainbow beam / load Shitroid ;;;
Function_MBBody_Phase2_FinishSamusOff_LoadBabyMetroid:
    LDX.W #MotherBrainFightSpriteTileTransferEntries_babyMetroid         ;A9BDD2;
    JSR.W ProcessSpriteTilesTransfers                                    ;A9BDD5;
    BCC .return                                                          ;A9BDD8;
    JSR.W RetractMotherBrainsHead                                        ;A9BDDA;
    JSR.W SpawnBabyMetroidCutscene                                       ;A9BDDD;
    LDA.W #Function_MBBody_Phase2_FinishSamusOff_FireFinalRainbowBeam    ;A9BDE0;
    STA.W MotherBrainBody.function                                       ;A9BDE3;
    LDA.W #$0100                                                         ;A9BDE6;
    STA.W MotherBrainBody.functionTimer                                  ;A9BDE9;

  .return:
    RTS                                                                  ;A9BDEC;


;;; $BDED: Mother Brain body function - second phase - finish Samus off - fire final rainbow beam ;;;
Function_MBBody_Phase2_FinishSamusOff_FireFinalRainbowBeam:
    DEC.W MotherBrainBody.functionTimer                                  ;A9BDED;
    BPL Function_MBBody_Phase2_FinishSamusOff_LoadBabyMetroid_return     ;A9BDF0;
    JSR.W ResetMotherBrainBodyRainbowBeamPaletteAnimationIndex           ;A9BDF2;
    LDA.W #InstList_MotherBrainHead_FiringRainbowBeam                    ;A9BDF5;
    JSR.W SetMotherBrainHeadInstList                                     ;A9BDF8;
    LDA.W #$0006                                                         ;A9BDFB;
    STA.L MotherBrainBody.lowerNeckMovementIndex                         ;A9BDFE;
    STA.L MotherBrainBody.upperNeckMovementIndex                         ;A9BE02;
    LDA.W #$0500                                                         ;A9BE06;
    STA.L MotherBrainBody.neckAngleDelta                                 ;A9BE09;
    LDA.W #$0071                                                         ;A9BE0D;
    JSL.L QueueSound_Lib2_Max6                                           ;A9BE10;
    LDA.W #.return                                                       ;A9BE14;
    STA.W MotherBrainBody.function                                       ;A9BE17;

  .return:
    RTS                                                                  ;A9BE1A;


;;; $BE1B: Spawn Shitroid in cutscene ;;;
SpawnBabyMetroidCutscene:
    LDX.W #PopulationData_BabyMetroidCutscene                            ;A9BE1B;
    JSL.L SpawnEnemy                                                     ;A9BE1E;
    TXA                                                                  ;A9BE22;
    STA.L MotherBrainBody.BabyMetroidEnemyIndex                          ;A9BE23;
    RTS                                                                  ;A9BE27;


PopulationData_BabyMetroidCutscene:
; Enemy population format is:
; ____________________________________________ Enemy ID
;        _____________________________________ X position
;       |      _______________________________ Y position
;       |     |      _________________________ Initialisation parameter (orientation in SMILE)
;       |     |     |      ___________________ Properties (special in SMILE)
;       |     |     |     |      _____________ Extra properties (special graphics bitset in SMILE)
;       |     |     |     |     |      _______ Parameter 1 (speed in SMILE)
;       |     |     |     |     |     |      _ Parameter 2 (speed2 in SMILE)
;       |     |     |     |     |     |     |
;       xxxx  yyyy  oooo  pppp  gggg  aaaa  bbbb

;  ______ Terminator
; |     _ Number of enemy deaths needed to clear current room
; |    |
; FFFF nn
    dw EnemyHeaders_BabyMetroidCutscene                                  ;A9BE28;
    dw $0180,$0040                                                       ;A9BE2A;
    dw InstList_BabyMetroid_Initial                                      ;A9BE2E;
    dw $2800,$0000,$0000,$0000                                           ;A9BE30;


;;; $BE38: Mother Brain body function - drained by Shitroid - taken aback by Shitroid ;;;
Function_MotherBrainBody_DrainedByBabyMetroid_TakenAback:
    LDA.W #$0003                                                         ;A9BE38;
    STA.L MotherBrainBody.form                                           ;A9BE3B;
    LDA.W #$0008                                                         ;A9BE3F;
    STA.L MotherBrainBody.lowerNeckMovementIndex                         ;A9BE42;
    STA.L MotherBrainBody.upperNeckMovementIndex                         ;A9BE46;
    LDA.W #$0700                                                         ;A9BE4A;
    STA.L MotherBrainBody.neckAngleDelta                                 ;A9BE4D;
    LDA.W #Function_MotherBrainBody_DrainedByBabyMetroid_RegainBalance   ;A9BE51;
    STA.W MotherBrainBody.function                                       ;A9BE54;
    LDA.W #$0030                                                         ;A9BE57;
    STA.W MotherBrainBody.functionTimer                                  ;A9BE5A; fallthrough to Function_MotherBrainBody_DrainedByBabyMetroid_RegainBalance


;;; $BE5D: Mother Brain body function - drained by Shitroid - regain balance ;;;
Function_MotherBrainBody_DrainedByBabyMetroid_RegainBalance:
    JSR.W HandleMotherBrainBodyRainbowBeamPalette                        ;A9BE5D;
    DEC.W MotherBrainBody.functionTimer                                  ;A9BE60;
    BPL .return                                                          ;A9BE63;
    LDA.W #Function_MBBody_DrainedByBabyMetroid_FiringRainbowBeam        ;A9BE65;
    STA.W MotherBrainBody.function                                       ;A9BE68;
    LDA.W #Function_MotherBrainBody_PainfulWalking_WalkForwards          ;A9BE6B;
    STA.L MotherBrainBody.painfulWalkingFunction                         ;A9BE6E;
    LDA.W #$0000                                                         ;A9BE72;
    STA.L MotherBrainBody.painfulWalkingStage                            ;A9BE75;
    LDA.W #$0002                                                         ;A9BE79;
    STA.L MotherBrainBody.painfulWalkingAnimationDelay                   ;A9BE7C;
    LDA.W #$0001                                                         ;A9BE80;
    LDA.L MotherBrainBody.enableNeckMovementFlag                         ;A9BE83;
    LDA.W #$0002                                                         ;A9BE87;
    STA.L MotherBrainBody.lowerNeckMovementIndex                         ;A9BE8A;
    LDA.W #$0004                                                         ;A9BE8E;
    STA.L MotherBrainBody.upperNeckMovementIndex                         ;A9BE91;

  .return:
    RTS                                                                  ;A9BE95;


;;; $BE96: Mother Brain body function - drained by Shitroid - firing rainbow beam ;;;
Function_MBBody_DrainedByBabyMetroid_FiringRainbowBeam:
    LDA.L MotherBrainBody.brainMainShakeTimer                            ;A9BE96;
    BNE +                                                                ;A9BE9A;
    LDA.W #$0032                                                         ;A9BE9C;
    STA.L MotherBrainBody.brainMainShakeTimer                            ;A9BE9F;

+   JSR.W HandleMotherBrainBodyRainbowBeamPalette                        ;A9BEA3;
    LDA.L MotherBrainBody.painfulWalkingFunction                         ;A9BEA6;
    STA.B DP_Temp12                                                      ;A9BEAA;
    PEA.W .manualReturn-1                                                ;A9BEAC;
    JMP.W (DP_Temp12)                                                    ;A9BEAF;

  .manualReturn:
    LDA.L MotherBrainBody.painfulWalkingStage                            ;A9BEB2;
    ASL                                                                  ;A9BEB6;
    TAY                                                                  ;A9BEB7;
    LDA.W .walkingAnimationDelays,Y                                      ;A9BEB8;
    AND.W #$00FF                                                         ;A9BEBB;
    STA.L MotherBrainBody.painfulWalkingAnimationDelay                   ;A9BEBE;
    LDA.W .neckAngleDeltas,Y                                             ;A9BEC2;
    STA.L MotherBrainBody.neckAngleDelta                                 ;A9BEC5;
    LDA.L MotherBrainBody.painfulWalkingStage                            ;A9BEC9;
    CMP.W #$0006                                                         ;A9BECD;
    BNE .return                                                          ;A9BED0;
    LDA.W #$0000                                                         ;A9BED2;
    STA.L MotherBrainBody.rainbowBeamSFXIsPlayingFlag                    ;A9BED5;
    STA.L MotherBrainBody.enableBrainPaletteHandlingFlag                 ;A9BED9;
    JSR.W WriteMotherBrainPhase2DeathPalette                             ;A9BEDD;
    LDA.W #$0002                                                         ;A9BEE0;
    JSL.L QueueSound_Lib1_Max6                                           ;A9BEE3;
    LDA.W #Function_MBBody_DrainedByBabyMetroid_RainbowBeamHasRunOut     ;A9BEE7;
    STA.W MotherBrainBody.function                                       ;A9BEEA;

  .return:
    RTS                                                                  ;A9BEED;

  .walkingAnimationDelays:
    dw $0002,$0002,$0006,$0006,$0008,$0008,$000A,$000A                   ;A9BEEE;

  .neckAngleDeltas:
    dw $0500,$0500,$0200,$0200,$00C0,$00C0,$0040,$0040                   ;A9BEFE;


;;; $BF0E: Mother Brain body function - drained by Shitroid - rainbow beam has run out ;;;
Function_MBBody_DrainedByBabyMetroid_RainbowBeamHasRunOut:
    LDA.L MotherBrainBody.painfulWalkingFunction                         ;A9BF0E;
    STA.B DP_Temp12                                                      ;A9BF12;
    PEA.W .manualReturn-1                                                ;A9BF14;
    JMP.W (DP_Temp12)                                                    ;A9BF17;

  .manualReturn:
    LDA.L MotherBrainBody.painfulWalkingStage                            ;A9BF1A;
    CMP.W #$0008                                                         ;A9BF1E;
    BMI Function_MBBody_DrainedByBabyMetroid_GoIntoLowPowerMode_return   ;A9BF21;
    LDA.W #$0040                                                         ;A9BF23;
    STA.L MotherBrainBody.neckAngleDelta                                 ;A9BF26;
    LDA.W #$0008                                                         ;A9BF2A;
    STA.L MotherBrainBody.lowerNeckMovementIndex                         ;A9BF2D;
    STA.L MotherBrainBody.upperNeckMovementIndex                         ;A9BF31;
    LDA.W #InstList_MotherBrainHead_DyingDrool_0                         ;A9BF35;
    JSR.W SetMotherBrainHeadInstList                                     ;A9BF38;
    LDA.W #Function_MBBody_DrainedByBabyMetroid_MoveToBackOfRoom         ;A9BF3B;
    STA.W MotherBrainBody.function                                       ;A9BF3E; fallthrough to Function_MBBody_DrainedByBabyMetroid_MoveToBackOfRoom


;;; $BF41: Mother Brain body function - drained by Shitroid - move to back of room ;;;
Function_MBBody_DrainedByBabyMetroid_MoveToBackOfRoom:
    LDA.W #$0028                                                         ;A9BF41;
    JSR.W MakeMotherBrainWalkBackwards                                   ;A9BF44;
    BCC Function_MBBody_DrainedByBabyMetroid_GoIntoLowPowerMode_return   ;A9BF47;
    LDA.W #Function_MBBody_DrainedByBabyMetroid_GoIntoLowPowerMode       ;A9BF49;
    STA.W MotherBrainBody.function                                       ;A9BF4C;
    LDA.W #$0000                                                         ;A9BF4F;
    STA.L MotherBrainBody.upperNeckMovementIndex                         ;A9BF52; fallthrough to Function_MBBody_DrainedByBabyMetroid_GoIntoLowPowerMode


;;; $BF56: Mother Brain body function - drained by Shitroid - go into low power mode ;;;
Function_MBBody_DrainedByBabyMetroid_GoIntoLowPowerMode:
    LDA.L MotherBrainBody.lowerNeckMovementIndex                         ;A9BF56;
    ORA.L MotherBrainBody.upperNeckMovementIndex                         ;A9BF5A;
    BNE .return                                                          ;A9BF5E;
    STA.L MotherBrainBody.enableDroolGenerationFlag                      ;A9BF60;
    LDA.L MotherBrainBody.pose                                           ;A9BF64;
    BNE .return                                                          ;A9BF68;
    LDA.W #InstList_MotherBrainBody_Crouch_Fast                          ;A9BF6A;
    JSR.W SetMotherBrainBodyInstList                                     ;A9BF6D;
    LDA.W #Function_MBBody_DrainedByBabyMetroid_PrepareTransitionToGrey  ;A9BF70;
    STA.W MotherBrainBody.function                                       ;A9BF73;
    LDA.W #$0040                                                         ;A9BF76;
    STA.W MotherBrainBody.functionTimer                                  ;A9BF79;

  .return:
    RTS                                                                  ;A9BF7C;


;;; $BF7D: Mother Brain body function - drained by Shitroid - prepare transition to grey ;;;
Function_MBBody_DrainedByBabyMetroid_PrepareTransitionToGrey:
    DEC.W MotherBrainBody.functionTimer                                  ;A9BF7D;
    BPL Function_MBBody_DrainedByBabyMetroid_GoIntoLowPowerMode_return   ;A9BF80;
    LDA.W #$0000                                                         ;A9BF82;
    STA.L MotherBrainBody.greyTransitionCounter                          ;A9BF85;
    LDA.W #Function_MBBody_DrainedByBabyMetroid_TransitionToGrey         ;A9BF89;
    STA.W MotherBrainBody.function                                       ;A9BF8C;
    LDA.W #$0010                                                         ;A9BF8F;
    STA.W MotherBrainBody.functionTimer                                  ;A9BF92; fallthrough to Function_MBBody_DrainedByBabyMetroid_TransitionToGrey


;;; $BF95: Mother Brain body function - drained by Shitroid - transition to grey ;;;
Function_MBBody_DrainedByBabyMetroid_TransitionToGrey:
    DEC.W MotherBrainBody.functionTimer                                  ;A9BF95;
    BPL Function_MBBody_DrainedByBabyMetroid_GoIntoLowPowerMode_return   ;A9BF98;
    LDA.W #$0010                                                         ;A9BF9A;
    STA.W MotherBrainBody.functionTimer                                  ;A9BF9D;
    LDA.L MotherBrainBody.greyTransitionCounter                          ;A9BFA0;
    INC                                                                  ;A9BFA4;
    STA.L MotherBrainBody.greyTransitionCounter                          ;A9BFA5;
    DEC                                                                  ;A9BFA9;
    JSL.L TransitionMotherBrainPaletteToGrey_DrainedByBabyMetroid        ;A9BFAA;
    BCC Function_MBBody_DrainedByBabyMetroid_GoIntoLowPowerMode_return   ;A9BFAE;
    LDA.W #$8CA0                                                         ;A9BFB0; 36,000 HP
    STA.W Enemy[1].health                                                ;A9BFB3;
    LDA.W #$0001                                                         ;A9BFB6;
    STA.L MotherBrainBody.phase2CorpseState                              ;A9BFB9;
    DEC                                                                  ;A9BFBD;
    STA.L MotherBrainBody.smallPurpleBreathGenerationEnabledFlag         ;A9BFBE;
    LDA.W #$0002                                                         ;A9BFC2;
    STA.L MotherBrainBody.form                                           ;A9BFC5;
    LDA.W #Function_MotherBrainBody_Phase2_ReviveSelf_InanimateGrey      ;A9BFC9;
    STA.W MotherBrainBody.function                                       ;A9BFCC;
    RTS                                                                  ;A9BFCF;


;;; $BFD0: Mother Brain painful walking function - walk forwards  ;;;
Function_MotherBrainBody_PainfulWalking_WalkForwards:
    LDA.L MotherBrainBody.painfulWalkingAnimationDelay                   ;A9BFD0;
    TAY                                                                  ;A9BFD4;
    LDA.W #$0048                                                         ;A9BFD5;
    JSR.W MakeMotherBrainWalkForwards                                    ;A9BFD8;
    BCC .return                                                          ;A9BFDB;
    LDA.W #Function_MotherBrainBody_PainfulWalking_WalkingForwards       ;A9BFDD;
    STA.L MotherBrainBody.painfulWalkingFunction                         ;A9BFE0;
    JSR.W SetMotherBrainPainfulWalkingFunctionTimer                      ;A9BFE4;

  .return:
    RTS                                                                  ;A9BFE7;


;;; $BFE8: Mother Brain painful walking function - walking forwards ;;;
Function_MotherBrainBody_PainfulWalking_WalkingForwards:
    LDA.L MotherBrainBody.painfulWalkingFunctionTimer                    ;A9BFE8;
    DEC                                                                  ;A9BFEC;
    STA.L MotherBrainBody.painfulWalkingFunctionTimer                    ;A9BFED;
    BNE .return                                                          ;A9BFF1;
    LDA.L MotherBrainBody.painfulWalkingStage                            ;A9BFF3;
    INC                                                                  ;A9BFF7;
    STA.L MotherBrainBody.painfulWalkingStage                            ;A9BFF8;
    LDA.W #Function_MotherBrainBody_PainfulWalking_WalkBackwards         ;A9BFFC;
    STA.L MotherBrainBody.painfulWalkingFunction                         ;A9BFFF;

  .return:
    RTS                                                                  ;A9C003;


;;; $C004: Mother Brain painful walking function - walk backwards ;;;
Function_MotherBrainBody_PainfulWalking_WalkBackwards:
    LDA.L MotherBrainBody.painfulWalkingAnimationDelay                   ;A9C004;
    TAY                                                                  ;A9C008;
    LDA.W #$0028                                                         ;A9C009;
    JSR.W MakeMotherBrainWalkBackwards                                   ;A9C00C;
    BCC .return                                                          ;A9C00F;
    LDA.W #Function_MotherBrainBody_PainfulWalking_WalkingBackwards      ;A9C011;
    STA.L MotherBrainBody.painfulWalkingFunction                         ;A9C014;
    JSR.W SetMotherBrainPainfulWalkingFunctionTimer                      ;A9C018;

  .return:
    RTS                                                                  ;A9C01B;


;;; $C01C: Mother Brain painful walking function - walking backwards ;;;
Function_MotherBrainBody_PainfulWalking_WalkingBackwards:
    LDA.L MotherBrainBody.painfulWalkingFunctionTimer                    ;A9C01C;
    DEC                                                                  ;A9C020;
    STA.L MotherBrainBody.painfulWalkingFunctionTimer                    ;A9C021;
    BNE .return                                                          ;A9C025;
    LDA.L MotherBrainBody.painfulWalkingStage                            ;A9C027;
    INC                                                                  ;A9C02B;
    STA.L MotherBrainBody.painfulWalkingStage                            ;A9C02C;
    LDA.W #Function_MotherBrainBody_PainfulWalking_WalkForwards          ;A9C030;
    STA.L MotherBrainBody.painfulWalkingFunction                         ;A9C033;

  .return:
    RTS                                                                  ;A9C037;


;;; $C038: Set Mother Brain painful walking function timer ;;;
SetMotherBrainPainfulWalkingFunctionTimer:
    LDA.L MotherBrainBody.painfulWalkingStage                            ;A9C038;
    ASL                                                                  ;A9C03C;
    TAY                                                                  ;A9C03D;
    LDA.W .timers,Y                                                      ;A9C03E;
    AND.W #$00FF                                                         ;A9C041;
    STA.L MotherBrainBody.painfulWalkingFunctionTimer                    ;A9C044;
    RTS                                                                  ;A9C048;

  .timers:
    dw $0010,$0010,$0020,$0020,$0030,$0030,$0040,$0040                   ;A9C049;


;;; $C059: Mother Brain body function - second phase - revive self - inanimate grey ;;;
Function_MotherBrainBody_Phase2_ReviveSelf_InanimateGrey:
    LDA.W #Function_MotherBrainBody_Phase2_ReviveSelf_ShowSignsOfLife    ;A9C059;
    STA.W MotherBrainBody.function                                       ;A9C05C;
    LDA.W #$0300                                                         ;A9C05F;
    STA.W MotherBrainBody.functionTimer                                  ;A9C062;

  .return:
    RTS                                                                  ;A9C065;


;;; $C066: Mother Brain body function - second phase - revive self - show signs of life ;;;
Function_MotherBrainBody_Phase2_ReviveSelf_ShowSignsOfLife:
    DEC.W MotherBrainBody.functionTimer                                  ;A9C066;
    BPL Function_MotherBrainBody_Phase2_ReviveSelf_InanimateGrey_return  ;A9C069;
    LDA.W #$0001                                                         ;A9C06B;
    STA.L MotherBrainBody.smallPurpleBreathGenerationEnabledFlag         ;A9C06E;
    STA.L MotherBrainBody.enableDroolGenerationFlag                      ;A9C072;
    LDA.W #Function_MBBody_Phase2_ReviveSelf_PrepareTransitionToGrey     ;A9C076;
    STA.W MotherBrainBody.function                                       ;A9C079;
    LDA.W #$00E0                                                         ;A9C07C;
    STA.W MotherBrainBody.functionTimer                                  ;A9C07F; fallthrough to Function_MBBody_Phase2_ReviveSelf_PrepareTransitionToGrey


;;; $C082: Mother Brain body function - second phase - revive self - prepare transition from grey ;;;
Function_MBBody_Phase2_ReviveSelf_PrepareTransitionToGrey:
    LDA.W #Function_MBBody_Phase2_ReviveSelf_TransitionFromGrey          ;A9C082;
    STA.W MotherBrainBody.function                                       ;A9C085;
    LDA.W #$0000                                                         ;A9C088;
    STA.L MotherBrainBody.greyTransitionCounter                          ;A9C08B; fallthrough to Function_MBBody_Phase2_ReviveSelf_TransitionFromGrey


;;; $C08F: Mother Brain body function - second phase - revive self - transition from grey ;;;
Function_MBBody_Phase2_ReviveSelf_TransitionFromGrey:
    DEC.W MotherBrainBody.functionTimer                                  ;A9C08F;
    BPL Function_MotherBrainBody_Phase2_ReviveSelf_InanimateGrey_return  ;A9C092;
    LDA.W #$0010                                                         ;A9C094;
    STA.W MotherBrainBody.functionTimer                                  ;A9C097;
    LDA.L MotherBrainBody.greyTransitionCounter                          ;A9C09A;
    INC                                                                  ;A9C09E;
    STA.L MotherBrainBody.greyTransitionCounter                          ;A9C09F;
    DEC                                                                  ;A9C0A3;
    JSL.L TransitionMotherBrainPaletteFromGrey_DrainedByBabyMetroid      ;A9C0A4;
    BCC Function_MotherBrainBody_Phase2_ReviveSelf_InanimateGrey_return  ;A9C0A8;
    LDA.W #Function_MotherBrainBody_Phase2_ReviveSelf_WakeUp             ;A9C0AA;
    STA.W MotherBrainBody.function                                       ;A9C0AD;
    LDA.W #$0001                                                         ;A9C0B0;
    STA.L MotherBrainBody.enableBrainPaletteHandlingFlag                 ;A9C0B3;
    JSR.W SetupMotherBrainHeadNormalPalette                              ;A9C0B7; fallthrough to Function_MotherBrainBody_Phase2_ReviveSelf_WakeUp


;;; $C0BA: Mother Brain body function - second phase - revive self - wake up ;;;
Function_MotherBrainBody_Phase2_ReviveSelf_WakeUp:
    JSR.W MakeMotherBrainStandUp                                         ;A9C0BA;
    BCC Function_MotherBrainBody_Phase2_ReviveSelf_InanimateGrey_return  ;A9C0BD;
    LDA.W #$0006                                                         ;A9C0BF;
    STA.L MotherBrainBody.lowerNeckMovementIndex                         ;A9C0C2;
    STA.L MotherBrainBody.upperNeckMovementIndex                         ;A9C0C6;
    LDA.W #$0500                                                         ;A9C0CA;
    STA.L MotherBrainBody.neckAngleDelta                                 ;A9C0CD;
    LDA.W #$0001                                                         ;A9C0D1;
    STA.L MotherBrainBody.enableNeckMovementFlag                         ;A9C0D4;
    LDA.W #Function_MotherBrainBody_Phase2_ReviveSelf_WakeUpStretch      ;A9C0D8;
    STA.W MotherBrainBody.function                                       ;A9C0DB;
    LDA.W #$0010                                                         ;A9C0DE;
    STA.W MotherBrainBody.functionTimer                                  ;A9C0E1; fallthrough to Function_MotherBrainBody_Phase2_ReviveSelf_WakeUpStretch


;;; $C0E4: Mother Brain body function - second phase - revive self - wake-up stretch ;;;
Function_MotherBrainBody_Phase2_ReviveSelf_WakeUpStretch:
    DEC.W MotherBrainBody.functionTimer                                  ;A9C0E4;
    BPL Function_MBBody_Phase2_ReviveSelf_WalkUpToBabyMetroid_return     ;A9C0E7;
    LDA.W #InstList_MotherBrainHead_Stretching_Phase3_0                  ;A9C0E9;
    JSR.W SetMotherBrainHeadInstList                                     ;A9C0EC;
    LDA.W #Function_MBBody_Phase2_ReviveSelf_WalkUpToBabyMetroid         ;A9C0EF;
    STA.W MotherBrainBody.function                                       ;A9C0F2;
    LDA.W #$0080                                                         ;A9C0F5;
    STA.W MotherBrainBody.functionTimer                                  ;A9C0F8; fallthrough to Function_MBBody_Phase2_ReviveSelf_WalkUpToBabyMetroid


;;; $C0FB: Mother Brain body function - second phase - revive self - walk up to Shitroid ;;;
Function_MBBody_Phase2_ReviveSelf_WalkUpToBabyMetroid:
    DEC.W MotherBrainBody.functionTimer                                  ;A9C0FB;
    BPL .return                                                          ;A9C0FE;
    LDY.W #$0004                                                         ;A9C100;
    LDA.W #$0050                                                         ;A9C103;
    JSR.W MakeMotherBrainWalkForwards                                    ;A9C106;
    BCC .return                                                          ;A9C109;
    LDA.W #Func_MBBody_Phase2_ReviveSelf_PrepareNeckForBabyMetroidDeath  ;A9C10B;
    STA.W MotherBrainBody.function                                       ;A9C10E;
    LDA.W #$0002                                                         ;A9C111;
    STA.L MotherBrainBody.phase2CorpseState                              ;A9C114;
    DEC                                                                  ;A9C118;
    STA.L MotherBrainBody.enableHealthBasedPaletteHandlingFlag           ;A9C119;

  .return:
    RTS                                                                  ;A9C11D;


;;; $C11E: Mother Brain body function - second phase - revive self - prepare neck for Shitroid murder ;;;
Func_MBBody_Phase2_ReviveSelf_PrepareNeckForBabyMetroidDeath:
    LDA.W #$0000                                                         ;A9C11E;
    STA.L MotherBrainBody.BabyMetroidAttackCounter                       ;A9C121;
    LDA.W #$0001                                                         ;A9C125;
    STA.L MotherBrainBody.enableNeckMovementFlag                         ;A9C128;
    LDA.W #$0002                                                         ;A9C12C;
    STA.L MotherBrainBody.lowerNeckMovementIndex                         ;A9C12F;
    LDA.W #$0004                                                         ;A9C133;
    STA.L MotherBrainBody.upperNeckMovementIndex                         ;A9C136;
    LDA.W #$0040                                                         ;A9C13A;
    STA.L MotherBrainBody.neckAngleDelta                                 ;A9C13D;
    LDA.W #Func_MBBody_Phase2_ReviveSelf_FinishPrepForBabyMetroidDeath   ;A9C141;
    STA.W MotherBrainBody.function                                       ;A9C144; fallthrough to Func_MBBody_Phase2_ReviveSelf_FinishPrepForBabyMetroidDeath


;;; $C147: Mother Brain body function - second phase - revive self - finish preparing for Shitroid murder ;;;
Func_MBBody_Phase2_ReviveSelf_FinishPrepForBabyMetroidDeath:
    JSR.W MakeMotherBrainStandUp                                         ;A9C147;
    BCS .standing                                                        ;A9C14A;
    RTS                                                                  ;A9C14C;

  .standing:
    LDA.W #Function_MotherBrainBody_Phase2_KillBabyMetroid_Attack        ;A9C14D;
    STA.W MotherBrainBody.function                                       ;A9C150;
    LDY.W #$000A                                                         ;A9C153;
    LDA.W #$0050                                                         ;A9C156;
    JSR.W MakeMotherBrainWalkForwards                                    ;A9C159; fallthrough to Function_MotherBrainBody_Phase2_KillBabyMetroid_Attack


;;; $C15C: Mother Brain body function - second phase - murder Shitroid - attack Shitroid ;;;
Function_MotherBrainBody_Phase2_KillBabyMetroid_Attack:
    JSR.W MaybeMakeMotherBrainStandUpOrLeanDown                          ;A9C15C;
    LDA.W RandomNumberSeed                                               ;A9C15F;
    BMI +                                                                ;A9C162;
    RTS                                                                  ;A9C164;

+   LDY.W #InstList_MotherBrainHead_AttackingSamus_4OnionRings_Phase3    ;A9C165;
    LDA.L MotherBrainBody.BabyMetroidEnemyIndex                          ;A9C168;
    BEQ .zeroIndex                                                       ;A9C16C;
    LDY.W #InstList_MotherBrainHead_Attacking_BabyMetroid                ;A9C16E;

  .zeroIndex:
    TYA                                                                  ;A9C171;
    JSR.W SetMotherBrainHeadInstList                                     ;A9C172;
    LDA.W #Function_MBBody_Phase2_KillBabyMetroid_AttackCooldown         ;A9C175;
    STA.W MotherBrainBody.function                                       ;A9C178;
    LDA.W #$0040                                                         ;A9C17B;
    STA.W MotherBrainBody.functionTimer                                  ;A9C17E;

  .return:
    RTS                                                                  ;A9C181;


;;; $C182: Mother Brain body function - second phase - murder Shitroid - Shitroid attack cooldown ;;;
Function_MBBody_Phase2_KillBabyMetroid_AttackCooldown:
    DEC.W MotherBrainBody.functionTimer                                  ;A9C182;
    BPL Function_MotherBrainBody_Phase2_KillBabyMetroid_Attack_return    ;A9C185;
    LDA.W #Function_MotherBrainBody_Phase2_KillBabyMetroid_Attack        ;A9C187;
    STA.W MotherBrainBody.function                                       ;A9C18A; fallthrough to RTS_A9C18D


RTS_A9C18D:
    RTS                                                                  ;A9C18D;


;;; $C18E: Mother Brain body function - second phase - prepare for final Shitroid attack ;;;
Function_MBBody_Phase2_PrepareForFinalBabyMetroidAttack:
; This isn't waiting for Mother Brain to finish standing up (bug?)
    JSR.W MakeMotherBrainStandUp                                         ;A9C18E;
    LDY.W #$0004                                                         ;A9C191;
    LDA.W #$0040                                                         ;A9C194;
    JMP.W MakeMotherBrainWalkBackwards                                   ;A9C197;


;;; $C19A: Mother Brain body function - second phase - execute final Shitroid attack ;;;
Function_MBBody_Phase2_ExecuteFinalBabyMetroidAttack:
    LDA.W #InstList_MotherBrainHead_Attacking_BabyMetroid                ;A9C19A;
    JSR.W SetMotherBrainHeadInstList                                     ;A9C19D;
    LDA.W #.return                                                       ;A9C1A0;
    STA.W MotherBrainBody.function                                       ;A9C1A3;

  .return:
    RTS                                                                  ;A9C1A6;


;;; $C1A7: Maybe make Mother Brain stand up or lean down ;;;
MaybeMakeMotherBrainStandUpOrLeanDown:
    LDA.L MotherBrainBody.pose                                           ;A9C1A7;
    BEQ .standing                                                        ;A9C1AB;
    CMP.W #$0006                                                         ;A9C1AD;
    BNE .return                                                          ;A9C1B0;
    LDA.W RandomNumberSeed                                               ;A9C1B2;
    AND.W #$00FF                                                         ;A9C1B5;
    CMP.W #$00C0                                                         ;A9C1B8;
    BCC .return                                                          ;A9C1BB;
    JMP.W MakeMotherBrainStandUp                                         ;A9C1BD;

  .standing:
    LDA.W RandomNumberSeed                                               ;A9C1C0;
    AND.W #$00FF                                                         ;A9C1C3;
    CMP.W #$00C0                                                         ;A9C1C6;
    BCC .return                                                          ;A9C1C9;
    JMP.W MakeMotherBrainLeanDown                                        ;A9C1CB;

  .return:
    RTS                                                                  ;A9C1CE;


;;; $C1CF: Mother Brain body function - third phase - recover from cutscene - make some distance ;;;
Function_MBBody_Phase3_RecoverFromCutscene_MakeSomeDistance:
    LDA.W #$0004                                                         ;A9C1CF;
    STA.L MotherBrainBody.form                                           ;A9C1D2;
    LDA.W #Function_MBBody_Phase3_RecoverFromCutscene_SetupForFighting   ;A9C1D6;
    STA.W MotherBrainBody.function                                       ;A9C1D9;
    LDA.W #$0020                                                         ;A9C1DC;
    STA.W MotherBrainBody.functionTimer                                  ;A9C1DF;
    LDA.W Enemy.XPosition                                                ;A9C1E2;
    SEC                                                                  ;A9C1E5;
    SBC.W #$000E                                                         ;A9C1E6;
    LDY.W #$0002                                                         ;A9C1E9;
    JSR.W MakeMotherBrainWalkBackwards                                   ;A9C1EC;

  .return:
    RTS                                                                  ;A9C1EF;


;;; $C1F0: Mother Brain body function - third phase - recover from cutscene - set up for fighting ;;;
Function_MBBody_Phase3_RecoverFromCutscene_SetupForFighting:
    DEC.W MotherBrainBody.functionTimer                                  ;A9C1F0;
    BPL Function_MBBody_Phase3_RecoverFromCutscene_MakeSomeDistance_return ;A9C1F3;
    LDA.W #Function_MBBody_Phase3_Fighting_Main                          ;A9C1F5;
    STA.W MotherBrainBody.function                                       ;A9C1F8;
    LDA.W #Function_MotherBrainNeck_Normal                               ;A9C1FB;
    STA.L MotherBrainBody.neckFunction                                   ;A9C1FE;
    LDA.W #Function_MotherBrainBody_Walking_TryToInchForward             ;A9C202;
    STA.L MotherBrainBody.walkingFunction                                ;A9C205; fallthrough to Function_MBBody_Phase3_Fighting_Main


;;; $C209: Mother Brain body function - third phase - fighting - main ;;;
Function_MBBody_Phase3_Fighting_Main:
    LDA.W Enemy[1].health                                                ;A9C209;
    BNE .notDead                                                         ;A9C20C;
    LDA.W #Function_MBBody_Phase3_DeathSequence_MoveToBackOfRoom         ;A9C20E;
    STA.W MotherBrainBody.function                                       ;A9C211;

  .return:
    RTS                                                                  ;A9C214;

  .notDead:
    JSR.W MotherBrainPhase3NeckHandler                                   ;A9C215;
    JSR.W MotherBrainPhase3WalkingHandler                                ;A9C218;
    LDA.L MotherBrainBody.pose                                           ;A9C21B;
    BNE Function_MBBody_Phase3_Fighting_Main_return                      ;A9C21F;
    LDA.L MotherBrainBody.disableAttacks                                 ;A9C221;
    BNE Function_MBBody_Phase3_Fighting_Main_return                      ;A9C225;
    LDA.W RandomNumberSeed                                               ;A9C227;
    BPL Function_MBBody_Phase3_Fighting_Main_return                      ;A9C22A;
    LDY.W #InstList_MotherBrainHead_Attacking_Bomb_Phase3                ;A9C22C;
    LDA.W RandomNumberSeed                                               ;A9C22F;
    AND.W #$00FF                                                         ;A9C232;
    CMP.W #$0080                                                         ;A9C235;
    BCC .lessThan80                                                      ;A9C238;
    LDY.W #InstList_MotherBrainHead_AttackingSamus_4OnionRings_Phase3    ;A9C23A;

  .lessThan80:
    TYA                                                                  ;A9C23D;
    JSR.W SetMotherBrainHeadInstList                                     ;A9C23E;
    LDA.W #Function_MBBody_Phase3_Fighting_AttackCooldown                ;A9C241;
    STA.W MotherBrainBody.function                                       ;A9C244;
    LDA.W #$0040                                                         ;A9C247;
    STA.W MotherBrainBody.functionTimer                                  ;A9C24A;
    RTS                                                                  ;A9C24D;


;;; $C24E: Mother Brain body function - third phase - fighting - attack cooldown ;;;
Function_MBBody_Phase3_Fighting_AttackCooldown:
    DEC.W MotherBrainBody.functionTimer                                  ;A9C24E;
    BPL Function_MBBody_Phase3_Fighting_Main_return                      ;A9C251;
    LDA.W #Function_MBBody_Phase3_Fighting_Main                          ;A9C253;
    STA.W MotherBrainBody.function                                       ;A9C256;
    RTS                                                                  ;A9C259;


;;; $C25A: Mother Brain third phase walking handler ;;;
MotherBrainPhase3WalkingHandler:
    LDA.L MotherBrainBody.pose                                           ;A9C25A;
    BEQ .standing                                                        ;A9C25E;
    RTS                                                                  ;A9C260;

  .standing:
    LDA.L MotherBrainBody.walkingFunction                                ;A9C261;
    STA.B DP_Temp12                                                      ;A9C265;
    JMP.W (DP_Temp12)                                                    ;A9C267;


;;; $C26A: Mother Brain walking function - try to inch forward ;;;
Function_MotherBrainBody_Walking_TryToInchForward:
    LDA.L MotherBrainBody.walkCounter                                    ;A9C26A;
    BEQ .walkLeft                                                        ;A9C26E;
    CLC                                                                  ;A9C270;
    ADC.W #$0020                                                         ;A9C271;
    STA.L MotherBrainBody.walkCounter                                    ;A9C274;
    CMP.W #$0100                                                         ;A9C278;
    BCC .return                                                          ;A9C27B;
    LDA.W Enemy.XPosition                                                ;A9C27D;
    INC                                                                  ;A9C280;
    STA.L MotherBrainBody.targetXPosition                                ;A9C281;
    LDA.W RandomNumberSeed                                               ;A9C285;
    AND.W #$0002                                                         ;A9C288;
    CLC                                                                  ;A9C28B;
    ADC.W #$0004                                                         ;A9C28C;
    TAY                                                                  ;A9C28F;
    LDA.L MotherBrainBody.targetXPosition                                ;A9C290;
    JSR.W MakeMotherBrainWalkForwards                                    ;A9C294;
    BCC .return                                                          ;A9C297;
    LDA.W #$0080                                                         ;A9C299;
    STA.L MotherBrainBody.walkCounter                                    ;A9C29C;

  .return:
    RTS                                                                  ;A9C2A0;

  .walkLeft:
    LDA.W Enemy.XPosition                                                ;A9C2A1;
    SEC                                                                  ;A9C2A4;
    SBC.W #$000E                                                         ;A9C2A5;
    STA.L MotherBrainBody.targetXPosition                                ;A9C2A8;
    LDA.W #Function_MotherBrainBody_Walking_RetreatQuickly               ;A9C2AC;
    STA.L MotherBrainBody.walkingFunction                                ;A9C2AF; fallthrough to Function_MotherBrainBody_Walking_RetreatQuickly


;;; $C2B3: Mother Brain walking function - retreat quickly ;;;
Function_MotherBrainBody_Walking_RetreatQuickly:
    LDA.L MotherBrainBody.targetXPosition                                ;A9C2B3;
    LDY.W #$0002                                                         ;A9C2B7;
    JSR.W MakeMotherBrainWalkBackwards                                   ;A9C2BA;
    BCC .return                                                          ;A9C2BD;
    LDA.W Enemy.XPosition                                                ;A9C2BF;
    SEC                                                                  ;A9C2C2;
    SBC.W #$000E                                                         ;A9C2C3;
    STA.L MotherBrainBody.targetXPosition                                ;A9C2C6;
    LDA.W #Function_MotherBrainBody_Walking_RetreatSlowly                ;A9C2CA;
    STA.L MotherBrainBody.walkingFunction                                ;A9C2CD;

  .return:
    RTS                                                                  ;A9C2D1;


;;; $C2D2: Mother Brain walking function - retreat slowly ;;;
Function_MotherBrainBody_Walking_RetreatSlowly:
    LDA.L MotherBrainBody.targetXPosition                                ;A9C2D2;
    LDY.W #$0004                                                         ;A9C2D6;
    JSR.W MakeMotherBrainWalkBackwards                                   ;A9C2D9;
    BCS .reachedTargetX                                                  ;A9C2DC;
    RTS                                                                  ;A9C2DE;

  .reachedTargetX:
    LDA.W #$0040                                                         ;A9C2DF;
    JMP.W SetMotherBrainWalkingFunctionToTryToInchForward                ;A9C2E2;


if !FEATURE_KEEP_UNREFERENCED
;;; $C2E5: Unused. Mother Brain walking function - crouch ;;;
UNUSED_Function_MotherBrainBody_Walking_Crouch_A9C2E5:
    JSR.W MakeMotherBrainCrouch                                          ;A9C2E5;
    BCC .return                                                          ;A9C2E8;
    LDA.W #UNUSED_Function_MotherBrainBody_Walking_Crouching_A9C2F9      ;A9C2EA;
    STA.L MotherBrainBody.walkingFunction                                ;A9C2ED;
    LDA.W #$0040                                                         ;A9C2F1;
    STA.L MotherBrainBody.crouchTimer                                    ;A9C2F4;

  .return:
    RTS                                                                  ;A9C2F8;


;;; $C2F9: Unused. Mother Brain walking function - crouching ;;;
UNUSED_Function_MotherBrainBody_Walking_Crouching_A9C2F9:
    LDA.L MotherBrainBody.crouchTimer                                    ;A9C2F9;
    DEC                                                                  ;A9C2FD;
    STA.L MotherBrainBody.crouchTimer                                    ;A9C2FE;
    BPL UNUSED_Function_MotherBrainBody_Walking_Crouch_A9C2E5_return     ;A9C302;
    LDA.W #UNUSED_Function_MotherBrainBody_Walking_StandUp_A9C30B        ;A9C304;
    STA.L MotherBrainBody.walkingFunction                                ;A9C307; fallthrough to UNUSED_Function_MotherBrainBody_Walking_StandUp_A9C30B


;;; $C30B: Unused. Mother Brain walking function - stand up ;;;
UNUSED_Function_MotherBrainBody_Walking_StandUp_A9C30B:
    JSR.W MakeMotherBrainStandUp                                         ;A9C30B;
    BCC UNUSED_Function_MotherBrainBody_Walking_Crouch_A9C2E5_return     ;A9C30E;
    LDA.W #$00C0                                                         ;A9C310; fallthrough to SetMotherBrainWalkingFunctionToTryToInchForward
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $C313: Set Mother Brain walking function to try to inch forward ;;;
SetMotherBrainWalkingFunctionToTryToInchForward:
    STA.L MotherBrainBody.walkCounter                                    ;A9C313;
    LDA.W #Function_MotherBrainBody_Walking_TryToInchForward             ;A9C317;
    STA.L MotherBrainBody.walkingFunction                                ;A9C31A;
    LDA.W Enemy.XPosition                                                ;A9C31E;
    INC                                                                  ;A9C321;
    STA.L MotherBrainBody.targetXPosition                                ;A9C322;
    RTS                                                                  ;A9C326;


;;; $C327: Mother Brain third phase neck handler ;;;
MotherBrainPhase3NeckHandler:
    LDA.L MotherBrainBody.neckFunction                                   ;A9C327;
    STA.B DP_Temp12                                                      ;A9C32B;
    JMP.W (DP_Temp12)                                                    ;A9C32D;


;;; $C330: Mother Brain neck function - normal ;;;
Function_MotherBrainNeck_Normal:
    LDA.W #$0001                                                         ;A9C330;
    STA.L MotherBrainBody.lowerNeckMovementIndex                         ;A9C333; >_<
    LDA.W #$0080                                                         ;A9C337;
    STA.L MotherBrainBody.neckAngleDelta                                 ;A9C33A;
    LDA.W #$0002                                                         ;A9C33E;
    STA.L MotherBrainBody.lowerNeckMovementIndex                         ;A9C341;
    LDA.W #$0004                                                         ;A9C345;
    STA.L MotherBrainBody.upperNeckMovementIndex                         ;A9C348;
    LDA.W #.return                                                       ;A9C34C;
    STA.L MotherBrainBody.neckFunction                                   ;A9C34F;

  .return:
    RTS                                                                  ;A9C353;


;;; $C354: Mother Brain neck function - set up recoil recovery ;;;
Function_MotherBrainNeck_SetupRecoilRecovery:
    LDA.W #$0001                                                         ;A9C354;
    STA.L MotherBrainBody.enableNeckMovementFlag                         ;A9C357;
    LDA.W #$0500                                                         ;A9C35B;
    STA.L MotherBrainBody.neckAngleDelta                                 ;A9C35E;
    LDA.W #$0006                                                         ;A9C362;
    STA.L MotherBrainBody.lowerNeckMovementIndex                         ;A9C365;
    STA.L MotherBrainBody.upperNeckMovementIndex                         ;A9C369;
    LDA.W #Function_MotherBrainNeck_RecoilRecovery                       ;A9C36D;
    STA.L MotherBrainBody.neckFunction                                   ;A9C370;
    LDA.W #$0010                                                         ;A9C374;
    STA.L MotherBrainBody.neckFunctionTimer                              ;A9C377; fallthrough to Function_MotherBrainNeck_RecoilRecovery


;;; $C37B: Mother Brain neck function - recoil recovery ;;;
Function_MotherBrainNeck_RecoilRecovery:
    LDA.L MotherBrainBody.neckFunctionTimer                              ;A9C37B;
    DEC                                                                  ;A9C37F;
    BMI .timerExpired                                                    ;A9C380;
    STA.L MotherBrainBody.neckFunctionTimer                              ;A9C382;
    RTS                                                                  ;A9C386;

  .timerExpired:
    LDA.W #InstList_MotherBrainHead_AttackingSamus_4OnionRings_Phase3    ;A9C387;
    JSR.W SetMotherBrainHeadInstList                                     ;A9C38A;
    LDA.W #Function_MotherBrainNeck_Normal                               ;A9C38D;
    STA.L MotherBrainBody.neckFunction                                   ;A9C390;
    RTS                                                                  ;A9C394;


;;; $C395: Mother Brain neck function - set up hyper beam recoil ;;;
Function_MotherBrainNeck_SetupHyperBeamRecoil:
; Set by shot reaction if far enough left
    LDA.W #$0001                                                         ;A9C395;
    STA.L MotherBrainBody.enableNeckMovementFlag                         ;A9C398;
    STA.L MotherBrainBody.disableAttacks                                 ;A9C39C;
    LDA.W #InstList_MotherBrainHead_HyperBeamRecoil_0                    ;A9C3A0;
    JSR.W SetMotherBrainHeadInstList                                     ;A9C3A3;
    LDA.W #$0032                                                         ;A9C3A6;
    STA.L MotherBrainBody.brainMainShakeTimer                            ;A9C3A9;
    LDA.W #$0900                                                         ;A9C3AD;
    STA.L MotherBrainBody.neckAngleDelta                                 ;A9C3B0;
    LDA.W #$0008                                                         ;A9C3B4;
    STA.L MotherBrainBody.lowerNeckMovementIndex                         ;A9C3B7;
    STA.L MotherBrainBody.upperNeckMovementIndex                         ;A9C3BB;
    LDA.W #Function_MotherBrainNeck_HyperBeamRecoil                      ;A9C3BF;
    STA.L MotherBrainBody.neckFunction                                   ;A9C3C2;
    LDA.W #$000B                                                         ;A9C3C6;
    STA.L MotherBrainBody.neckFunctionTimer                              ;A9C3C9; fallthrough to Function_MotherBrainNeck_HyperBeamRecoil


;;; $C3CD: Mother Brain neck function - hyper beam recoil ;;;
Function_MotherBrainNeck_HyperBeamRecoil:
    LDA.L MotherBrainBody.neckFunctionTimer                              ;A9C3CD;
    DEC                                                                  ;A9C3D1;
    BMI .timerExpired                                                    ;A9C3D2;
    STA.L MotherBrainBody.neckFunctionTimer                              ;A9C3D4;
    RTS                                                                  ;A9C3D8;

  .timerExpired:
    LDA.W #$0080                                                         ;A9C3D9;
    STA.L MotherBrainBody.neckAngleDelta                                 ;A9C3DC;
    LDA.W #$0000                                                         ;A9C3E0;
    STA.L MotherBrainBody.disableAttacks                                 ;A9C3E3;
    LDA.W #Function_MotherBrainNeck_SetupRecoilRecovery                  ;A9C3E7;
    STA.L MotherBrainBody.neckFunction                                   ;A9C3EA;
    RTS                                                                  ;A9C3EE;


;;; $C3EF: Move enemy according to enemy velocity ;;;
MoveEnemyAccordingToVelocity:
    LDX.W EnemyIndex                                                     ;A9C3EF;
    LDA.W BabyMetroid.XVelocity,X                                        ;A9C3F2;
    SEP #$20                                                             ;A9C3F5;
    CLC                                                                  ;A9C3F7;
    ADC.W Enemy.XSubPosition+1,X                                         ;A9C3F8;
    STA.W Enemy.XSubPosition+1,X                                         ;A9C3FB;
    REP #$20                                                             ;A9C3FE;
    AND.W #$FF00                                                         ;A9C400;
    XBA                                                                  ;A9C403;
    BPL +                                                                ;A9C404;
    ORA.W #$FF00                                                         ;A9C406;

+   ADC.W Enemy.XPosition,X                                              ;A9C409;
    STA.W Enemy.XPosition,X                                              ;A9C40C;
    LDA.W BabyMetroid.YVelocity,X                                        ;A9C40F;
    SEP #$20                                                             ;A9C412;
    CLC                                                                  ;A9C414;
    ADC.W Enemy.YSubPosition+1,X                                         ;A9C415;
    STA.W Enemy.YSubPosition+1,X                                         ;A9C418;
    REP #$20                                                             ;A9C41B;
    AND.W #$FF00                                                         ;A9C41D;
    XBA                                                                  ;A9C420;
    BPL +                                                                ;A9C421;
    ORA.W #$FF00                                                         ;A9C423;

+   ADC.W Enemy.YPosition,X                                              ;A9C426;
    STA.W Enemy.YPosition,X                                              ;A9C429;
    RTL                                                                  ;A9C42C;


;;; $C42D: Set Mother Brain body instruction list ;;;
SetMotherBrainBodyInstList:
    STA.W Enemy.instList                                                 ;A9C42D;
    LDA.W #$0001                                                         ;A9C430;
    STA.W Enemy.instTimer                                                ;A9C433;
    STZ.W Enemy.loopCounter                                              ;A9C436;
    RTS                                                                  ;A9C439;


;;; $C43A: Set Mother Brain brain unused instruction list ;;;
SetMotherBrainHeadUnusedInstList:
    STA.W Enemy[1].instList                                              ;A9C43A;
    LDA.W #$0001                                                         ;A9C43D;
    STA.W Enemy[1].instTimer                                             ;A9C440;
    STZ.W Enemy[1].loopCounter                                           ;A9C443;
    RTS                                                                  ;A9C446;


;;; $C447: Set Mother Brain brain instruction list ;;;
SetMotherBrainHeadInstList:
    STA.L MotherBrainBody.brainInstListPointer                           ;A9C447;
    LDA.W #$0001                                                         ;A9C44B;
    STA.L MotherBrainBody.brainInstructionTimer                          ;A9C44E;
    RTS                                                                  ;A9C452;


;;; $C453: Set enemy instruction list ;;;
SetEnemyInstList:
    STA.W Enemy.instList,X                                               ;A9C453;
    LDA.W #$0001                                                         ;A9C456;
    STA.W Enemy.instTimer,X                                              ;A9C459;
    STZ.W Enemy.loopCounter,X                                            ;A9C45C;
    RTL                                                                  ;A9C45F;


;;; $C460: A = sin([$12] * pi / 80h) * ±[A] ;;;
GetSineMathInA_A9C460:
    TAY                                                                  ;A9C460;
    LDA.B DP_Temp12                                                      ;A9C461;
    BRA GetSineMathInA_A9C46C                                            ;A9C463;


;;; $C465: A = cos([$12] * pi / 80h) * ±[A] ;;;
GetCosineMathInA_A9C465:
    TAY                                                                  ;A9C465;
    LDA.B DP_Temp12                                                      ;A9C466;
    CLC                                                                  ;A9C468;
    ADC.W #$0040                                                         ;A9C469; fallthrough to GetSineMathInA_A9C46C


;;; $C46C: A = sin([A] * pi / 80h) * ±[Y] ;;;
GetSineMathInA_A9C46C:
; Uses the fast (signed) multiplication registers(!)
    PHX                                                                  ;A9C46C;
    ASL                                                                  ;A9C46D;
    AND.W #$01FE                                                         ;A9C46E;
    TAX                                                                  ;A9C471;
    LDA.L SineCosineTables_8bitSine_SignExtended,X                       ;A9C472;
    SEP #$20                                                             ;A9C476;
    STA.L $00211B                                                        ;A9C478;
    XBA                                                                  ;A9C47C;
    STA.L $00211B                                                        ;A9C47D;
    TYA                                                                  ;A9C481;
    STA.L $00211C                                                        ;A9C482;
    REP #$20                                                             ;A9C486;
    LDA.L $002135                                                        ;A9C488;
    PLX                                                                  ;A9C48C;
    RTL                                                                  ;A9C48D;


if !FEATURE_KEEP_UNREFERENCED
;;; $C48E: Unused. Enemy X position += [A] / 100h ;;;
UNUSED_AddADividedBy100ToEnemyXPosition_A9C48E:
    SEP #$20                                                             ;A9C48E;
    CLC                                                                  ;A9C490;
    ADC.W Enemy.XSubPosition+1,X                                         ;A9C491;
    STA.W Enemy.XSubPosition+1,X                                         ;A9C494;
    REP #$20                                                             ;A9C497;
    AND.W #$FF00                                                         ;A9C499;
    XBA                                                                  ;A9C49C;
    BPL +                                                                ;A9C49D;
    ORA.W #$FF00                                                         ;A9C49F;

+   ADC.W Enemy.XPosition,X                                              ;A9C4A2;
    STA.W Enemy.XPosition,X                                              ;A9C4A5;
    RTS                                                                  ;A9C4A8;
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $C4A9: Enemy Y position += [A] / 100h ;;;
AddADividedBy100ToEnemyYPosition:
    SEP #$20                                                             ;A9C4A9;
    CLC                                                                  ;A9C4AB;
    ADC.W Enemy.YSubPosition+1,X                                         ;A9C4AC;
    STA.W Enemy.YSubPosition+1,X                                         ;A9C4AF;
    REP #$20                                                             ;A9C4B2;
    AND.W #$FF00                                                         ;A9C4B4;
    XBA                                                                  ;A9C4B7;
    BPL +                                                                ;A9C4B8;
    ORA.W #$FF00                                                         ;A9C4BA;

+   ADC.W Enemy.YPosition,X                                              ;A9C4BD;
    STA.W Enemy.YPosition,X                                              ;A9C4C0;
    RTS                                                                  ;A9C4C3;


;;; $C4C4: Decrement ammo due to rainbow beam ;;;
DecrementAmmoDueToRainbowBeam:
    LDA.W NumberOfTimesMainEnemyRoutineExecuted                          ;A9C4C4;
    AND.W #$0003                                                         ;A9C4C7;
    BNE .superMissiles                                                   ;A9C4CA;
    LDA.W Missiles                                                       ;A9C4CC;
    BEQ .superMissiles                                                   ;A9C4CF;
    SEC                                                                  ;A9C4D1;
    SBC.W .decrementValue                                                ;A9C4D2;
    CMP.W #$0001                                                         ;A9C4D5;
    BPL .writeMissiles                                                   ;A9C4D8;
    LDA.W SelectedHUDItem                                                ;A9C4DA;
    CMP.W #$0001                                                         ;A9C4DD;
    BNE .resetAutoCancel                                                 ;A9C4E0;
    LDA.W #$0000                                                         ;A9C4E2;
    STA.W SelectedHUDItem                                                ;A9C4E5;

  .resetAutoCancel:
    LDA.W #$0000                                                         ;A9C4E8;
    STA.W AutoCancelHUDItemIndex                                         ;A9C4EB;

  .writeMissiles:
    STA.W Missiles                                                       ;A9C4EE;

  .superMissiles:
    LDA.W NumberOfTimesMainEnemyRoutineExecuted                          ;A9C4F1;
    AND.W #$0003                                                         ;A9C4F4;
    BNE .powerBombs                                                      ;A9C4F7;
    LDA.W SuperMissiles                                                  ;A9C4F9;
    BEQ .powerBombs                                                      ;A9C4FC;
    SEC                                                                  ;A9C4FE;
    SBC.W .decrementValue                                                ;A9C4FF;
    CMP.W #$0001                                                         ;A9C502;
    BPL .writeSuperMissiles                                              ;A9C505;
    LDA.W SelectedHUDItem                                                ;A9C507;
    CMP.W #$0002                                                         ;A9C50A;
    BNE ..resetAutoCancel                                                ;A9C50D;
    LDA.W #$0000                                                         ;A9C50F;
    STA.W SelectedHUDItem                                                ;A9C512;

  ..resetAutoCancel:
    LDA.W #$0000                                                         ;A9C515;
    STA.W AutoCancelHUDItemIndex                                         ;A9C518;

  .writeSuperMissiles:
    STA.W SuperMissiles                                                  ;A9C51B;

  .powerBombs:
    LDA.W PowerBombs                                                     ;A9C51E;
    BEQ .return                                                          ;A9C521;
    SEC                                                                  ;A9C523;
    SBC.W .decrementValue                                                ;A9C524;
    CMP.W #$0001                                                         ;A9C527;
    BPL .writePowerBombs                                                 ;A9C52A;
    LDA.W SelectedHUDItem                                                ;A9C52C;
    CMP.W #$0003                                                         ;A9C52F;
    BNE ..resetAutoCancel                                                ;A9C532;
    LDA.W #$0000                                                         ;A9C534;
    STA.W SelectedHUDItem                                                ;A9C537;

  ..resetAutoCancel:
    LDA.W #$0000                                                         ;A9C53A;
    STA.W AutoCancelHUDItemIndex                                         ;A9C53D;

  .writePowerBombs:
    STA.W PowerBombs                                                     ;A9C540;

  .return:
    RTS                                                                  ;A9C543;

  .decrementValue:
; Amount of ammo to decrement
    dw $0001                                                             ;A9C544;


;;; $C546: Handle playing gaining/losing incremental health sound effect ;;;
HandlePlayingGainingLosingIncrementalEnergySFX:
    PHA                                                                  ;A9C546;
    LDA.W Energy                                                         ;A9C547;
    CMP.W #$0051                                                         ;A9C54A;
    BMI .return                                                          ;A9C54D;
    LDA.W NumberOfTimesMainEnemyRoutineExecuted                          ;A9C54F;
    AND.W #$0007                                                         ;A9C552;
    BNE .return                                                          ;A9C555;
    LDA.W #$002D                                                         ;A9C557;
    JSL.L QueueSound_Lib3_Max3                                           ;A9C55A;

  .return:
    PLA                                                                  ;A9C55E;
    RTS                                                                  ;A9C55F;


;;; $C560: Damage Samus due to Shitroid ;;;
DamageSamusDueToBabyMetroid:
    LDY.W #$FFFC                                                         ;A9C560;
    LDA.W EquippedItems                                                  ;A9C563;
    LSR                                                                  ;A9C566;
    BCC .varia                                                           ;A9C567;
    LDY.W #$FFFD                                                         ;A9C569;

  .varia:
    TYA                                                                  ;A9C56C;
    ADC.W Energy                                                         ;A9C56D;
    CMP.W #$0002                                                         ;A9C570;
    BPL .done                                                            ;A9C573;
    CLC                                                                  ;A9C575;
    LDA.W #$0001                                                         ;A9C576;

  .done:
    STA.W Energy                                                         ;A9C579;
    RTL                                                                  ;A9C57C;


;;; $C57D: Damage Samus due to rainbow beam ;;;
DamageSamusDueToRainbowBeam:
;; Returns:
;;     Carry: Set if Samus' health has reached zero, clear otherwise
    LDY.W #$FFFE                                                         ;A9C57D;
    LDA.W EquippedItems                                                  ;A9C580;
    LSR                                                                  ;A9C583;
    BCC .varia                                                           ;A9C584;
    LDY.W #$FFFE                                                         ;A9C586;

  .varia:
    TYA                                                                  ;A9C589;
    ADC.W Energy                                                         ;A9C58A;
    CMP.W #$0001                                                         ;A9C58D;
    BPL .done                                                            ;A9C590;
    CLC                                                                  ;A9C592;
    LDA.W #$0000                                                         ;A9C593;

  .done:
    STA.W Energy                                                         ;A9C596;
    PHP                                                                  ;A9C599;
    JSR.W HandlePlayingGainingLosingIncrementalEnergySFX                 ;A9C59A;
    PLP                                                                  ;A9C59D;
    RTL                                                                  ;A9C59E;


;;; $C59F: Heal Samus due to Shitroid ;;;
HealSamusDueToBabyMetroid:
;; Returns:
;;     Carry: Clear if Samus' health has reached max, set otherwise
    LDA.W #$0001                                                         ;A9C59F;
    CLC                                                                  ;A9C5A2;
    ADC.W Energy                                                         ;A9C5A3;
    CMP.W MaxEnergy                                                      ;A9C5A6;
    BMI .notMaxed                                                        ;A9C5A9;
    LDA.W MaxEnergy                                                      ;A9C5AB;
    STA.W Energy                                                         ;A9C5AE;
    JSR.W HandlePlayingGainingLosingIncrementalEnergySFX                 ;A9C5B1;
    CLC                                                                  ;A9C5B4;
    RTL                                                                  ;A9C5B5;

  .notMaxed:
    STA.W Energy                                                         ;A9C5B6;
    JSR.W HandlePlayingGainingLosingIncrementalEnergySFX                 ;A9C5B9;
    SEC                                                                  ;A9C5BC;
    RTL                                                                  ;A9C5BD;


;;; $C5BE: Process sprite tiles transfers ;;;
ProcessSpriteTilesTransfers:
;; Parameters:
;;     X: Pointer to start of a list of sprite tiles transfers, one entry processed per call
;; Returns:
;;     Carry: Set if finished list

; When not currently processing a list, $7E:8004 is 0;
; otherwise, $7E:8004 is the pointer to the next entry to process from the list initially passed in X
; (X is only used by the call initiating the list processing)

; This routine is being used to spread large VRAM transfers over multiple frames (as 1C0h or 200h byte chunks),
; but it could just as easily be called for doing small animations
    LDA.L MotherBrainBody.spriteTilesTransferEntryPointer                ;A9C5BE;
    BNE +                                                                ;A9C5C2;
    TXA                                                                  ;A9C5C4;

+   TAX                                                                  ;A9C5C5;
    LDY.W VRAMWriteStack                                                 ;A9C5C6;
    LDA.W $0000,X                                                        ;A9C5C9;
    BEQ +                                                                ;A9C5CC;
    STA.W VRAMWrite.size,Y                                               ;A9C5CE; >.<
    LDA.W $0003,X                                                        ;A9C5D1;
    STA.W VRAMWrite.src+1,Y                                              ;A9C5D4; >.<
    LDA.W $0002,X                                                        ;A9C5D7;
    STA.W VRAMWrite.src,Y                                                ;A9C5DA; >.<
    LDA.W $0005,X                                                        ;A9C5DD;
    STA.W VRAMWrite.dest,Y                                               ;A9C5E0; >.<
    TYA                                                                  ;A9C5E3;
    CLC                                                                  ;A9C5E4;
    ADC.W #$0007                                                         ;A9C5E5;
    STA.W VRAMWriteStack                                                 ;A9C5E8;
    TXA                                                                  ;A9C5EB;
    ADC.W #$0007                                                         ;A9C5EC;
    STA.L MotherBrainBody.spriteTilesTransferEntryPointer                ;A9C5EF;
    TAX                                                                  ;A9C5F3;
    LDA.W $0000,X                                                        ;A9C5F4;
    BEQ +                                                                ;A9C5F7;
    CLC                                                                  ;A9C5F9;
    RTS                                                                  ;A9C5FA;

+   STA.L MotherBrainBody.spriteTilesTransferEntryPointer                ;A9C5FB;
    SEC                                                                  ;A9C5FF;
    RTS                                                                  ;A9C600;


;;; $C601: Make Mother Brain walk forwards ;;;
MakeMotherBrainWalkForwards:
;; Parameters:
;;     A: Target X position. Maximum of 7Fh
;;     Y: Animation delay
;; Returns:
;;     Carry: Set if reached target, clear otherwise
    CMP.W Enemy.XPosition                                                ;A9C601;
    BMI .returnReachedTarget                                             ;A9C604;
    LDA.L MotherBrainBody.pose                                           ;A9C606;
    BNE .returnNotReached                                                ;A9C60A;
    LDA.W Enemy.XPosition                                                ;A9C60C;
    CMP.W #$0080                                                         ;A9C60F;
    BPL .returnReachedTarget                                             ;A9C612;
    LDA.W .pointers,Y                                                    ;A9C614;
    JSR.W SetMotherBrainBodyInstList                                     ;A9C617;

  .returnNotReached:
    CLC                                                                  ;A9C61A;
    RTS                                                                  ;A9C61B;

  .returnReachedTarget:
    SEC                                                                  ;A9C61C;
    RTS                                                                  ;A9C61D;

  .pointers:
    dw .pointers                                                         ;A9C61E;
    dw InstList_MotherBrainBody_WalkingForwards_ReallyFast               ;A9C620;
    dw InstList_MotherBrainBody_WalkingForwards_Fast                     ;A9C622;
    dw InstList_MotherBrainBody_WalkingForwards_Medium                   ;A9C624;
    dw InstList_MotherBrainBody_WalkingForwards_Slow                     ;A9C626;
    dw InstList_MotherBrainBody_WalkingForwards_ReallySlow               ;A9C628;


if !FEATURE_KEEP_UNREFERENCED
;;; $C62A: Unused. Make Mother Brain walk backwards ;;;
UNUSED_MakeMotherBrainWalkBackwards_A9C62A:
; Allows her to go back further than MakeMotherBrainWalkBackwards does
    CMP.W Enemy.XPosition                                                ;A9C62A;
    BPL .returnCarrySet                                                  ;A9C62D;
    LDA.L MotherBrainBody.pose                                           ;A9C62F;
    BNE .returnCarryClear                                                ;A9C633;
    LDA.W Enemy.XPosition                                                ;A9C635;
    CMP.W #$0010                                                         ;A9C638;
    BMI .returnCarrySet                                                  ;A9C63B;
    LDA.W MakeMotherBrainWalkBackwards_pointers,Y                        ;A9C63D;
    JSR.W SetMotherBrainBodyInstList                                     ;A9C640;

  .returnCarryClear:
    CLC                                                                  ;A9C643;
    RTS                                                                  ;A9C644;

  .returnCarrySet:
    SEC                                                                  ;A9C645;
    RTS                                                                  ;A9C646;
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $C647: Make Mother Brain walk backwards ;;;
MakeMotherBrainWalkBackwards:
;; Parameters:
;;     A: Target X position. Minimum of 2Fh
;;     Y: Speed (actually animation delay)
;; Returns:
;;     Carry: Set if reached target, clear otherwise
    CMP.W Enemy.XPosition                                                ;A9C647;
    BPL .returnTargetReached                                             ;A9C64A;
    LDA.L MotherBrainBody.pose                                           ;A9C64C;
    BNE .returnNotReached                                                ;A9C650;
    LDA.W Enemy.XPosition                                                ;A9C652;
    CMP.W #$0030                                                         ;A9C655;
    BMI .returnTargetReached                                             ;A9C658;
    LDA.W MakeMotherBrainWalkBackwards_pointers,Y                        ;A9C65A;
    JSR.W SetMotherBrainBodyInstList                                     ;A9C65D;

  .returnNotReached:
    CLC                                                                  ;A9C660;
    RTS                                                                  ;A9C661;

  .returnTargetReached:
    SEC                                                                  ;A9C662;
    RTS                                                                  ;A9C663;

  .pointers:
    dw .pointers                                                         ;A9C664;
    dw InstList_MotherBrainBody_WalkingBackwards_ReallyFast              ;A9C666;
    dw InstList_MotherBrainBody_WalkingBackwards_Fast                    ;A9C668;
    dw InstList_MotherBrainBody_WalkingBackwards_Medium                  ;A9C66A;
    dw InstList_MotherBrainBody_WalkingBackwards_Slow                    ;A9C66C;
    dw InstList_MotherBrainBody_WalkingBackwards_ReallySlow              ;A9C66E;


;;; $C670: Make Mother Brain stand up ;;;
MakeMotherBrainStandUp:
;; Returns:
;;     Carry: Set if standing, clear otherwise
    LDA.L MotherBrainBody.pose                                           ;A9C670;
    BEQ .returnStanding                                                  ;A9C674;
    LDY.W #InstList_MotherBrainBody_StandingUpAfterCrouching_Fast        ;A9C676;
    CMP.W #$0003                                                         ;A9C679;
    BEQ .standFast                                                       ;A9C67C;
    CMP.W #$0006                                                         ;A9C67E;
    BNE .returnNotStanding                                               ;A9C681;
    LDY.W #InstList_MotherBrainBody_StandingUpAfterLeaningDown           ;A9C683;

  .standFast:
    TYA                                                                  ;A9C686;
    JSR.W SetMotherBrainBodyInstList                                     ;A9C687;

  .returnNotStanding:
    CLC                                                                  ;A9C68A;
    RTS                                                                  ;A9C68B;

  .returnStanding:
    SEC                                                                  ;A9C68C;
    RTS                                                                  ;A9C68D;


;;; $C68E: Make Mother Brain crouch ;;;
MakeMotherBrainCrouch:
;; Returns:
;;     Carry: Set if crouched, clear otherwise
    LDA.L MotherBrainBody.pose                                           ;A9C68E;
    BEQ .crouchSlow                                                      ;A9C692;
    CMP.W #$0003                                                         ;A9C694;
    BNE .notCrouched                                                     ;A9C697;
    SEC                                                                  ;A9C699;
    RTS                                                                  ;A9C69A;

  .crouchSlow:
    LDA.W #InstList_MotherBrainBody_Crouch_Slow                          ;A9C69B;

  .setToCrouch:
    JSR.W SetMotherBrainBodyInstList                                     ;A9C69E;

  .notCrouched:
    CLC                                                                  ;A9C6A1;
    RTS                                                                  ;A9C6A2;


;;; $C6A3: Make Mother Brain lean down ;;;
MakeMotherBrainLeanDown:
;; Returns:
;;     Carry: Set if leaning down, clear otherwise
    LDA.L MotherBrainBody.pose                                           ;A9C6A3;
    BEQ .leanDown                                                        ;A9C6A7;
    CMP.W #$0006                                                         ;A9C6A9;
    BNE .notLeaningDown                                                  ;A9C6AC;
    SEC                                                                  ;A9C6AE;
    RTS                                                                  ;A9C6AF;

  .leanDown:
    LDA.W #InstList_MotherBrainBody_LeaningDown                          ;A9C6B0;
    JSR.W SetMotherBrainBodyInstList                                     ;A9C6B3;

  .notLeaningDown:
    CLC                                                                  ;A9C6B6;
    RTS                                                                  ;A9C6B7;


;;; $C6B8: Handle Mother Brain walking ;;;
HandleMotherBrainWalking:
    LDA.L MotherBrainBody.pose                                           ;A9C6B8;
    BEQ .standing                                                        ;A9C6BC;
    RTS                                                                  ;A9C6BE;

  .standing:
    LDA.L MotherBrainBody.walkCounter                                    ;A9C6BF;
    BEQ .walkBackwards                                                   ;A9C6C3;
    CLC                                                                  ;A9C6C5;
    ADC.W #$0006                                                         ;A9C6C6;
    STA.L MotherBrainBody.walkCounter                                    ;A9C6C9;
    CMP.W #$0100                                                         ;A9C6CD;
    BCC .maybeWalkForwardsIfFarLeft                                      ;A9C6D0;

  .walkForwards:
    LDA.W #$0080                                                         ;A9C6D2;
    STA.L MotherBrainBody.walkCounter                                    ;A9C6D5;
    LDA.W Enemy.XPosition                                                ;A9C6D9;
    CMP.W #$0080                                                         ;A9C6DC;
    BPL .return                                                          ;A9C6DF;
    LDA.W #InstList_MotherBrainBody_WalkingForwards_Medium               ;A9C6E1;
    JMP.W SetMotherBrainBodyInstList                                     ;A9C6E4;

  .walkBackwards:
    LDA.W #$0001                                                         ;A9C6E7;
    STA.L MotherBrainBody.walkCounter                                    ;A9C6EA;
    LDA.W Enemy.XPosition                                                ;A9C6EE;
    CMP.W #$0030                                                         ;A9C6F1;
    BMI .maybeWalkForwards                                               ;A9C6F4;
    LDA.W #InstList_MotherBrainBody_WalkingBackwards_Fast                ;A9C6F6;
    JMP.W SetMotherBrainBodyInstList                                     ;A9C6F9;

  .maybeWalkForwardsIfFarLeft:
    LDA.W Enemy.XPosition                                                ;A9C6FC;
    CMP.W #$0030                                                         ;A9C6FF;
    BPL .return                                                          ;A9C702;

  .maybeWalkForwards:
    LDA.W RandomNumberSeed                                               ;A9C704;
    AND.W #$0FFF                                                         ;A9C707;
    CMP.W #$0FC0                                                         ;A9C70A;
    BPL .walkForwards                                                    ;A9C70D;

  .return:
    RTS                                                                  ;A9C70F;


;;; $C710: Initialisation AI - enemy $ECBF (Shitroid in cutscene) ;;;
InitAI_BabyMetroidCutscene:
    LDX.W EnemyIndex                                                     ;A9C710;
    LDA.W Enemy.properties,X                                             ;A9C713;
    ORA.W #$3000                                                         ;A9C716;
    STA.W Enemy.properties,X                                             ;A9C719;
    LDA.W #$0E00                                                         ;A9C71C;
    STA.W Enemy.palette,X                                                ;A9C71F;
    LDA.W #InstList_BabyMetroid_Initial                                  ;A9C722;
    STA.W Enemy.instList,X                                               ;A9C725;
    LDA.W #$0001                                                         ;A9C728;
    STA.W Enemy.instTimer,X                                              ;A9C72B;
    STA.L BabyMetroidCutscene.crySFXFlag,X                               ;A9C72E;
    STZ.W Enemy.loopCounter,X                                            ;A9C732;
    LDA.W #$000A                                                         ;A9C735;
    STA.W BabyMetroidCutscene.paletteHandlerDelay,X                      ;A9C738;
    LDA.W #$00A0                                                         ;A9C73B;
    STA.W Enemy.GFXOffset,X                                              ;A9C73E;
    LDA.W #$0140                                                         ;A9C741;
    STA.W Enemy.XPosition,X                                              ;A9C744;
    LDA.W #$0060                                                         ;A9C747;
    STA.W Enemy.YPosition,X                                              ;A9C74A;
    STZ.W BabyMetroidCutscene.XVelocity,X                                ;A9C74D;
    STZ.W BabyMetroidCutscene.YVelocity,X                                ;A9C750;
    LDA.W #$0000                                                         ;A9C753;
    STA.L BabyMetroidCutscene.healthBasedPaletteFlag,X                   ;A9C756;
    LDA.W #Function_BabyMetroidCutscene_DashOntoScreen                   ;A9C75A;
    STA.W BabyMetroidCutscene.function,X                                 ;A9C75D;
    LDA.W #$00F8                                                         ;A9C760;
    STA.W BabyMetroidCutscene.functionTimer,X                            ;A9C763;
    LDA.W #HandleBabyMetroidCutscenePalette_Normal                       ;A9C766;
    STA.L BabyMetroidCutscene.paletteFunction,X                          ;A9C769;
    LDY.W #Palette_MotherBrain_BabyMetroid+2                             ;A9C76D;
    LDX.W #$01E2                                                         ;A9C770;
    LDA.W #$000F                                                         ;A9C773;
    JMP.W WriteAColorsFromYtoColorIndexX                                 ;A9C776;


;;; $C779: Main AI - enemy $ECBF (Shitroid in cutscene) ;;;
MainAI_BabyMetroidCutscene:
    LDX.W EnemyIndex                                                     ;A9C779;
    STZ.W Enemy.shakeTimer,X                                             ;A9C77C;
    JSR.W (BabyMetroidCutscene.function,X)                               ;A9C77F;
    JSL.L MoveEnemyAccordingToVelocity                                   ;A9C782;
    JSR.W HandleBabyMetroidFlashing                                      ;A9C786;
    JSR.W HandleBabyMetroidHealthBasedPalette                            ;A9C789;
    LDX.W EnemyIndex                                                     ;A9C78C;
    LDA.L BabyMetroidCutscene.paletteFunction,X                          ;A9C78F;
    STA.B DP_Temp12                                                      ;A9C793;
    PEA.W .manualReturn-1                                                ;A9C795;
    JMP.W (DP_Temp12)                                                    ;A9C798;

  .manualReturn:
    RTL                                                                  ;A9C79B;


;;; $C79C: Handle Shitroid flashing ;;;
HandleBabyMetroidFlashing:
    LDY.W #$0E00                                                         ;A9C79C;
    LDA.L BabyMetroidCutscene.flashTimer,X                               ;A9C79F;
    BEQ .return                                                          ;A9C7A3;
    DEC                                                                  ;A9C7A5;
    STA.L BabyMetroidCutscene.flashTimer,X                               ;A9C7A6;
    AND.W #$0002                                                         ;A9C7AA;
    BEQ .return                                                          ;A9C7AD;
    LDY.W #$0000                                                         ;A9C7AF;

  .return:
    TYA                                                                  ;A9C7B2;
    STA.W Enemy.palette,X                                                ;A9C7B3;
    RTS                                                                  ;A9C7B6;


;;; $C7B7: Handle playing Shitroid cry ;;;
HandlePlayingBabyMetroidCutsceneCrySFX:
    LDA.L MotherBrainBody.playBabyMetroidCryFlag                         ;A9C7B7;
    BEQ .return                                                          ;A9C7BB;
    LDA.W #$0000                                                         ;A9C7BD;
    STA.L MotherBrainBody.playBabyMetroidCryFlag                         ;A9C7C0;
    LDA.W #$0072                                                         ;A9C7C4;
    JSL.L QueueSound_Lib2_Max6                                           ;A9C7C7;

  .return:
    RTS                                                                  ;A9C7CB;


;;; $C7CC: Shitroid function - dash onto screen ;;;
Function_BabyMetroidCutscene_DashOntoScreen:
    DEC.W BabyMetroidCutscene.functionTimer,X                            ;A9C7CC;
    BMI .timerExpired                                                    ;A9C7CF;
    RTS                                                                  ;A9C7D1;

  .timerExpired:
    LDA.W #$D800                                                         ;A9C7D2;
    STA.L BabyMetroidCutscene.angle,X                                    ;A9C7D5;
    LDA.W #$0A00                                                         ;A9C7D9;
    STA.L BabyMetroidCutscene.speed,X                                    ;A9C7DC;
    LDA.W #Function_BabyMetroidCutscene_CurveTowardMotherBrainHead       ;A9C7E0;
    STA.W BabyMetroidCutscene.function,X                                 ;A9C7E3;
    LDA.W #$000A                                                         ;A9C7E6;
    STA.W BabyMetroidCutscene.functionTimer,X                            ;A9C7E9; fallthrough to Function_BabyMetroidCutscene_CurveTowardMotherBrainHead


;;; $C7EC: Shitroid function - curve towards Mother Brain brain ;;;
Function_BabyMetroidCutscene_CurveTowardMotherBrainHead:
    LDA.W #$FE80                                                         ;A9C7EC;
    STA.B DP_Temp12                                                      ;A9C7EF;
    LDA.W #$B000                                                         ;A9C7F1;
    STA.B DP_Temp14                                                      ;A9C7F4;
    LDA.W #$0A00                                                         ;A9C7F6;
    STA.B DP_Temp16                                                      ;A9C7F9;
    JSR.W UpdateBabyMetroidCutsceneSpeedAndAngle                         ;A9C7FB;
    DEC.W BabyMetroidCutscene.functionTimer,X                            ;A9C7FE;
    BMI .timerExpired                                                    ;A9C801;
    RTS                                                                  ;A9C803;

  .timerExpired:
    LDA.W #Function_BabyMetroidCutscene_GetRightUpInMotherBrainsFace     ;A9C804;
    STA.W BabyMetroidCutscene.function,X                                 ;A9C807;
    LDA.W #$0009                                                         ;A9C80A;
    STA.W BabyMetroidCutscene.functionTimer,X                            ;A9C80D;
    RTS                                                                  ;A9C810;


;;; $C811: Shitroid function - get right up in Mother Brain's face ;;;
Function_BabyMetroidCutscene_GetRightUpInMotherBrainsFace:
    LDA.W #$FA00                                                         ;A9C811;
    STA.B DP_Temp12                                                      ;A9C814;
    LDA.W #$8200                                                         ;A9C816;
    STA.B DP_Temp14                                                      ;A9C819;
    LDA.W #$0E00                                                         ;A9C81B;
    STA.B DP_Temp16                                                      ;A9C81E;
    JSR.W UpdateBabyMetroidCutsceneSpeedAndAngle                         ;A9C820;
    LDA.W Enemy[1].XPosition                                             ;A9C823;
    STA.B DP_Temp12                                                      ;A9C826;
    LDA.W Enemy[1].YPosition                                             ;A9C828;
    STA.B DP_Temp14                                                      ;A9C82B;
    LDA.W #$0004                                                         ;A9C82D;
    STA.B DP_Temp16                                                      ;A9C830;
    STA.B DP_Temp18                                                      ;A9C832;
    JSL.L CheckForEnemyCollisionWithRectangle                            ;A9C834;
    BCC .timerExpired                                                    ;A9C838;
    DEC.W BabyMetroidCutscene.functionTimer,X                            ;A9C83A;
    BMI .timerExpired                                                    ;A9C83D;
    RTS                                                                  ;A9C83F;

  .timerExpired:
    STA.W BabyMetroidCutscene.function,X                                 ;A9C840; >.<
    LDA.W #Function_BabyMetroidCutscene_LatchOntoMotherBrain             ;A9C843;
    STA.W BabyMetroidCutscene.function,X                                 ;A9C846;
    LDA.W #$0001                                                         ;A9C849;
    JSL.L DrainedSamusController                                         ;A9C84C;
    RTS                                                                  ;A9C850;


;;; $C851: Shitroid function - latch onto Mother Brain ;;;
Function_BabyMetroidCutscene_LatchOntoMotherBrain:
    LDA.W Enemy[1].XPosition                                             ;A9C851;
    STA.B DP_Temp12                                                      ;A9C854;
    LDA.W Enemy[1].YPosition                                             ;A9C856;
    CLC                                                                  ;A9C859;
    ADC.W #$FFE8                                                         ;A9C85A;
    STA.B DP_Temp14                                                      ;A9C85D;
    LDY.W #$0000                                                         ;A9C85F;
    JSR.W GradduallyAccelerateTowardsPoint_1A_400                        ;A9C862;
    LDA.W #$0008                                                         ;A9C865;
    STA.B DP_Temp16                                                      ;A9C868;
    STA.B DP_Temp18                                                      ;A9C86A;
    JSL.L CheckForEnemyCollisionWithRectangle                            ;A9C86C;
    BCS .return                                                          ;A9C870;
    LDA.W #Function_BabyMetroidCutscene_SetMotherBrainToStumbleBack      ;A9C872;
    STA.W BabyMetroidCutscene.function,X                                 ;A9C875;

  .return:
    RTS                                                                  ;A9C878;


;;; $C879: Shitroid function - set Mother Brain to stumble back ;;;
Function_BabyMetroidCutscene_SetMotherBrainToStumbleBack:
    LDY.W #$0002                                                         ;A9C879;
    LDA.W Enemy.XPosition                                                ;A9C87C;
    DEC                                                                  ;A9C87F;
    JSR.W MakeMotherBrainWalkBackwards                                   ;A9C880;
    LDA.W #Function_BabyMetroidCutscene_ActivateRainbowBeamAndMBBody     ;A9C883;
    STA.W BabyMetroidCutscene.function,X                                 ;A9C886; fallthrough to Function_BabyMetroidCutscene_ActivateRainbowBeamAndMBBody


;;; $C889: Shitroid function - activate rainbow beam and Mother Brain body ;;;
Function_BabyMetroidCutscene_ActivateRainbowBeamAndMBBody:
    LDA.W Enemy[1].XPosition                                             ;A9C889;
    CLC                                                                  ;A9C88C;
    ADC.W #$0000                                                         ;A9C88D;
    STA.B DP_Temp12                                                      ;A9C890;
    LDA.W Enemy[1].YPosition                                             ;A9C892;
    CLC                                                                  ;A9C895;
    ADC.W #$FFE8                                                         ;A9C896;
    STA.B DP_Temp14                                                      ;A9C899;
    LDA.W #$0200                                                         ;A9C89B;
    JSR.W AccelerateBabyMetroidTowardsPoint                              ;A9C89E;
    BCS .reachedTarget                                                   ;A9C8A1;
    RTS                                                                  ;A9C8A3;

  .reachedTarget:
    STZ.W BabyMetroidCutscene.XVelocity,X                                ;A9C8A4;
    STZ.W BabyMetroidCutscene.YVelocity,X                                ;A9C8A7;
    LDA.W Enemy[1].XPosition                                             ;A9C8AA;
    STA.W Enemy.XPosition,X                                              ;A9C8AD;
    LDA.W Enemy[1].YPosition                                             ;A9C8B0;
    CLC                                                                  ;A9C8B3;
    ADC.W #$FFE8                                                         ;A9C8B4;
    STA.W Enemy.YPosition,X                                              ;A9C8B7;
    LDA.W #InstList_BabyMetroid_DrainingMotherBrain                      ;A9C8BA;
    JSL.L SetEnemyInstList                                               ;A9C8BD;
    LDA.W #Function_BabyMetroidCutscene_WaitForMBToTurnToCorpse          ;A9C8C1;
    STA.W BabyMetroidCutscene.function,X                                 ;A9C8C4;
    LDA.W #$0001                                                         ;A9C8C7;
    STA.W BabyMetroidCutscene.paletteHandlerDelay,X                      ;A9C8CA;
    LDA.W #Function_MotherBrainBody_DrainedByBabyMetroid_TakenAback      ;A9C8CD;
    STA.W MotherBrainBody.function                                       ;A9C8D0;
    LDA.W #$0040                                                         ;A9C8D3;
    JSL.L QueueSound_Lib1_Max6                                           ;A9C8D6;
    LDA.W #$0001                                                         ;A9C8DA;
    STA.L MotherBrainBody.rainbowBeamSFXIsPlayingFlag                    ;A9C8DD;
    RTS                                                                  ;A9C8E1;


;;; $C8E2: Shitroid function - wait for Mother Brain to turn to corpse ;;;
Function_BabyMetroidCutscene_WaitForMBToTurnToCorpse:
    LDA.W Enemy.frameCounter,X                                           ;A9C8E2;
    AND.W #$0006                                                         ;A9C8E5;
    TAY                                                                  ;A9C8E8;
    LDA.W ShakingOffsets_X,Y                                             ;A9C8E9;
    CLC                                                                  ;A9C8EC;
    ADC.W Enemy[1].XPosition                                             ;A9C8ED;
    STA.W Enemy.XPosition,X                                              ;A9C8F0;
    LDA.W ShakingOffsets_Y,Y                                             ;A9C8F3;
    CLC                                                                  ;A9C8F6;
    ADC.W Enemy[1].YPosition                                             ;A9C8F7;
    CLC                                                                  ;A9C8FA;
    ADC.W #$FFE8                                                         ;A9C8FB;
    STA.W Enemy.YPosition,X                                              ;A9C8FE;
    LDA.L MotherBrainBody.phase2CorpseState                              ;A9C901;
    BNE .turnedToCorpse                                                  ;A9C905;
    RTS                                                                  ;A9C907;

  .turnedToCorpse:
    LDA.W #Function_BabyMetroidCutscene_StopDraining                     ;A9C908;
    STA.W BabyMetroidCutscene.function,X                                 ;A9C90B;
    LDA.W #$0040                                                         ;A9C90E;
    STA.W BabyMetroidCutscene.functionTimer,X                            ;A9C911;
    RTS                                                                  ;A9C914;


;;; $C915: Shitroid function - stop draining ;;;
Function_BabyMetroidCutscene_StopDraining:
    LDA.W Enemy[1].XPosition                                             ;A9C915;
    STA.W Enemy.XPosition,X                                              ;A9C918;
    LDA.W Enemy[1].YPosition                                             ;A9C91B;
    CLC                                                                  ;A9C91E;
    ADC.W #$FFE8                                                         ;A9C91F;
    STA.W Enemy.YPosition,X                                              ;A9C922;
    DEC.W BabyMetroidCutscene.functionTimer,X                            ;A9C925;
    BMI .timerExpired                                                    ;A9C928;
    RTS                                                                  ;A9C92A;

  .timerExpired:
    LDA.W #InstList_BabyMetroid_Initial                                  ;A9C92B;
    JSL.L SetEnemyInstList                                               ;A9C92E;
    LDA.W #$000A                                                         ;A9C932;
    STA.W BabyMetroidCutscene.paletteHandlerDelay,X                      ;A9C935;
    LDA.W #Function_BabyMetroidCutscene_LetGo_SpawnDustClouds            ;A9C938;
    STA.W BabyMetroidCutscene.function,X                                 ;A9C93B;
    LDA.W #$0020                                                         ;A9C93E;
    STA.W BabyMetroidCutscene.functionTimer,X                            ;A9C941;
    STZ.W BabyMetroidCutscene.XVelocity,X                                ;A9C944;
    STZ.W BabyMetroidCutscene.YVelocity,X                                ;A9C947;
    RTS                                                                  ;A9C94A;


;;; $C94B: Shitroid function - let go and spawn dust clouds ;;;
Function_BabyMetroidCutscene_LetGo_SpawnDustClouds:
    DEC.W BabyMetroidCutscene.functionTimer,X                            ;A9C94B;
    BPL Function_BabyMetroidCutscene_MoveToTheCeiling                    ;A9C94E;
    JSR.W SpawnThreeDustCloudsOnMotherBrainHead                          ;A9C950;
    LDA.W #Function_BabyMetroidCutscene_MoveToTheCeiling                 ;A9C953;
    STA.W BabyMetroidCutscene.function,X                                 ;A9C956; fallthrough to Function_BabyMetroidCutscene_MoveToTheCeiling


;;; $C959: Shitroid function - move up to ceiling ;;;
Function_BabyMetroidCutscene_MoveToTheCeiling:
    LDA.W Enemy[1].XPosition                                             ;A9C959;
    STA.B DP_Temp12                                                      ;A9C95C;
    LDA.W #$0000                                                         ;A9C95E;
    STA.B DP_Temp14                                                      ;A9C961;
    LDY.W #$0000                                                         ;A9C963;
    JSR.W GradduallyAccelerateTowardsPoint_1A_400                        ;A9C966;
    LDA.W #$0004                                                         ;A9C969;
    STA.B DP_Temp16                                                      ;A9C96C;
    STA.B DP_Temp18                                                      ;A9C96E;
    JSL.L CheckForEnemyCollisionWithRectangle                            ;A9C970;
    BCC .collision                                                       ;A9C974;
    RTS                                                                  ;A9C976;

  .collision:
    LDA.W #$0004                                                         ;A9C977;
    JSL.L DrainedSamusController                                         ;A9C97A;
    LDA.W #Function_BabyMetroidCutscene_MoveToSamus                      ;A9C97E;
    STA.W BabyMetroidCutscene.function,X                                 ;A9C981;
    LDA.W #BabyMetroidCutscene_MovementTable_CeilingToSamus              ;A9C984;
    STA.L BabyMetroidCutscene.movementTablePointer,X                     ;A9C987;
    RTS                                                                  ;A9C98B;


;;; $C98C: Spawn three dust clouds on Mother Brain brain ;;;
SpawnThreeDustCloudsOnMotherBrainHead:
    LDA.W #$FFF8                                                         ;A9C98C;
    STA.B DP_Temp14                                                      ;A9C98F;
    LDA.W #$FFF0                                                         ;A9C991;
    JSR.W SpawnDustCloudAtMotherBrainHeadPosition_OffsetByA_14           ;A9C994;
    LDA.W #$FFF0                                                         ;A9C997;
    STA.B DP_Temp14                                                      ;A9C99A;
    LDA.W #$0000                                                         ;A9C99C;
    JSR.W SpawnDustCloudAtMotherBrainHeadPosition_OffsetByA_14           ;A9C99F;
    LDA.W #$FFF8                                                         ;A9C9A2;
    STA.B DP_Temp14                                                      ;A9C9A5;
    LDA.W #$0010                                                         ;A9C9A7; fallthrough to SpawnDustCloudAtMotherBrainHeadPosition_OffsetByA_14


;;; $C9AA: Spawn dust cloud at Mother Brain brain position offset by ([A], [$14]) ;;;
SpawnDustCloudAtMotherBrainHeadPosition_OffsetByA_14:
    CLC                                                                  ;A9C9AA;
    ADC.W Enemy[1].XPosition                                             ;A9C9AB;
    STA.B DP_Temp12                                                      ;A9C9AE;
    LDA.B DP_Temp14                                                      ;A9C9B0;
    CLC                                                                  ;A9C9B2;
    ADC.W Enemy[1].YPosition                                             ;A9C9B3;
    STA.B DP_Temp14                                                      ;A9C9B6;
    LDA.W #$0009                                                         ;A9C9B8;
    LDY.W #EnemyProjectile_MiscDust                                      ;A9C9BB;
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics                  ;A9C9BE;
    RTS                                                                  ;A9C9C2;


;;; $C9C3: Shitroid function - move to Samus ;;;
Function_BabyMetroidCutscene_MoveToSamus:
; Is this used for the sidehopper attack too?! Note the enemy index being 80h instead of C0h
    LDA.W #$0000                                                         ;A9C9C3;
    STA.L BabyMetroidCutscene.crySFXFlag,X                               ;A9C9C6;
    INC                                                                  ;A9C9CA;
    STA.L BabyMetroidCutscene.healthBasedPaletteFlag,X                   ;A9C9CB;
    LDA.W RandomNumberSeed                                               ;A9C9CF;
    AND.W #$0FFF                                                         ;A9C9D2;
    CMP.W #$0FA0                                                         ;A9C9D5;
    BCC .skipSFX                                                         ;A9C9D8;
    LDA.W #$0052                                                         ;A9C9DA;
    JSL.L QueueSound_Lib2_Max6                                           ;A9C9DD;

  .skipSFX:
    LDA.L BabyMetroidCutscene.movementTablePointer,X                     ;A9C9E1;
    TAY                                                                  ;A9C9E5;
    LDA.W $0000,Y                                                        ;A9C9E6;
    STA.B DP_Temp12                                                      ;A9C9E9;
    LDA.W $0002,Y                                                        ;A9C9EB;
    STA.B DP_Temp14                                                      ;A9C9EE;
    LDA.W $0006,Y                                                        ;A9C9F0;
    STA.B DP_Temp16                                                      ;A9C9F3;
    LDA.W $0004,Y                                                        ;A9C9F5;
    PHY                                                                  ;A9C9F8;
    TAY                                                                  ;A9C9F9;
    PEA.W .manualReturn-1                                                ;A9C9FA;
    JMP.W (DP_Temp16)                                                    ;A9C9FD;

  .manualReturn:
    PLY                                                                  ;A9CA00;
    LDA.W #$0004                                                         ;A9CA01;
    STA.B DP_Temp16                                                      ;A9CA04;
    STA.B DP_Temp18                                                      ;A9CA06;
    JSL.L CheckForEnemyCollisionWithRectangle                            ;A9CA08;
    BCS .return                                                          ;A9CA0C;
    LDA.W $0008,Y                                                        ;A9CA0E;
    BMI .function                                                        ;A9CA11;
    LDA.L BabyMetroidCutscene.movementTablePointer,X                     ;A9CA13;
    CLC                                                                  ;A9CA17;
    ADC.W #$0008                                                         ;A9CA18;
    STA.L BabyMetroidCutscene.movementTablePointer,X                     ;A9CA1B;

  .return:
    RTS                                                                  ;A9CA1F;

  .function:
    STA.W BabyMetroidCutscene.function,X                                 ;A9CA20;
    RTS                                                                  ;A9CA23;


;;; $CA24: Shitroid movement table - ceiling -> Samus ;;;
BabyMetroidCutscene_MovementTable_CeilingToSamus:
; GradduallyAccelerateTowardsPoint_1A_8 - $1A = 8
; GradduallyAccelerateTowardsPoint_1A_10 - $1A = 10h (faster off-screen movement)
;        ____________________ Target X position (or next enemy function if $8000+)
;       |      ______________ Target Y position
;       |     |      ________ Acceleration divisor table index (0 is slowest acceleration)
;       |     |     |
    dw $00A0,$0078,$0000                                                 ;A9CA24;
    dw GradduallyAccelerateTowardsPoint_1A_10                            ;A9CA2A;
    dw $0130,$007A,$0000                                                 ;A9CA2C;
    dw GradduallyAccelerateTowardsPoint_1A_10                            ;A9CA32;
    dw $00C0,$0040,$0000                                                 ;A9CA34;
    dw GradduallyAccelerateTowardsPoint_1A_10                            ;A9CA3A;
    dw $00C0,$0070,$0000                                                 ;A9CA3C;
    dw GradduallyAccelerateTowardsPoint_1A_10                            ;A9CA42;
    dw $00E0,$0080,$0000                                                 ;A9CA44;
    dw GradduallyAccelerateTowardsPoint_1A_10                            ;A9CA4A;
    dw $00CD,$0090,$0000                                                 ;A9CA4C;
    dw GradduallyAccelerateTowardsPoint_1A_8                             ;A9CA52;
    dw $00CC,$00A0,$0000                                                 ;A9CA54;
    dw GradduallyAccelerateTowardsPoint_1A_8                             ;A9CA5A;
    dw $00CB,$00B0,$0000                                                 ;A9CA5C;
    dw GradduallyAccelerateTowardsPoint_1A_8                             ;A9CA62;
    dw Function_BabyMetroidCutscene_LatchOntoSamus                       ;A9CA64;


;;; $CA66: Shitroid function - latch onto Samus ;;;
Function_BabyMetroidCutscene_LatchOntoSamus:
    LDA.W SamusXPosition                                                 ;A9CA66;
    STA.B DP_Temp12                                                      ;A9CA69;
    LDA.W SamusYPosition                                                 ;A9CA6B;
    SEC                                                                  ;A9CA6E;
    SBC.W #$0014                                                         ;A9CA6F;
    STA.B DP_Temp14                                                      ;A9CA72;
    LDY.W #$0000                                                         ;A9CA74;
    JMP.W GradduallyAccelerateTowardsPoint_1A_400                        ;A9CA77;


;;; $CA7A: Shitroid function - heal Samus up to full health ;;;
Function_BabyMetroidCutscene_HealSamusUpToFullEnergy:
    LDA.W #$0000                                                         ;A9CA7A;
    STA.L BabyMetroidCutscene.crySFXFlag,X                               ;A9CA7D;
    JSR.W HandlePlayingBabyMetroidCutsceneCrySFX                         ;A9CA81;
    LDA.W Enemy.frameCounter,X                                           ;A9CA84;
    AND.W #$0006                                                         ;A9CA87;
    TAY                                                                  ;A9CA8A;
    LDA.W ShakingOffsets_X,Y                                             ;A9CA8B;
    CLC                                                                  ;A9CA8E;
    ADC.W SamusXPosition                                                 ;A9CA8F;
    STA.W Enemy.XPosition,X                                              ;A9CA92;
    LDA.W ShakingOffsets_Y,Y                                             ;A9CA95;
    CLC                                                                  ;A9CA98;
    ADC.W SamusYPosition                                                 ;A9CA99;
    SEC                                                                  ;A9CA9C;
    SBC.W #$0014                                                         ;A9CA9D;
    STA.W Enemy.YPosition,X                                              ;A9CAA0;
    JSL.L HealSamusDueToBabyMetroid                                      ;A9CAA3;
    BCS .return                                                          ;A9CAA7;
    LDA.W MaxReserveEnergy                                               ;A9CAA9;
    STA.W ReserveEnergy                                                  ;A9CAAC;
    LDA.W #Function_BabyMetroidCutscene_IdleUntilRunOutOfHealth          ;A9CAAF;
    STA.W BabyMetroidCutscene.function,X                                 ;A9CAB2;
    LDA.W #.return                                                       ;A9CAB5;
    STA.L BabyMetroidCutscene.paletteFunction,X                          ;A9CAB8;

  .return:
    RTS                                                                  ;A9CABC;


;;; $CABD: Shitroid function - idle until run out of health ;;;
Function_BabyMetroidCutscene_IdleUntilRunOutOfHealth:
    JSR.W HandlePlayingBabyMetroidCutsceneCrySFX                         ;A9CABD;
    LDA.L BabyMetroidCutscene.flashTimer,X                               ;A9CAC0;
    BEQ .checkHealth                                                     ;A9CAC4;
    AND.W #$0006                                                         ;A9CAC6;
    TAY                                                                  ;A9CAC9;
    LDA.W ShakingOffsets_X,Y                                             ;A9CACA;
    ASL                                                                  ;A9CACD;
    CLC                                                                  ;A9CACE;
    ADC.W SamusXPosition                                                 ;A9CACF;
    STA.W Enemy.XPosition,X                                              ;A9CAD2;
    LDA.W ShakingOffsets_Y,Y                                             ;A9CAD5;
    ASL                                                                  ;A9CAD8;
    CLC                                                                  ;A9CAD9;
    ADC.W SamusYPosition                                                 ;A9CADA;
    SEC                                                                  ;A9CADD;
    SBC.W #$0014                                                         ;A9CADE;
    STA.W Enemy.YPosition,X                                              ;A9CAE1;

  .checkHealth:
    LDA.W Enemy.health,X                                                 ;A9CAE4;
    BEQ .zeroHealth                                                      ;A9CAE7;
    RTS                                                                  ;A9CAE9;

  .zeroHealth:
    LDA.W #$0140                                                         ;A9CAEA;
    STA.W Enemy.health,X                                                 ;A9CAED;
    LDA.W #Function_BabyMetroidCutscene_ReleaseSamus                     ;A9CAF0;
    STA.W BabyMetroidCutscene.function,X                                 ;A9CAF3;
    LDA.W #$000A                                                         ;A9CAF6;
    STA.W BabyMetroidCutscene.paletteHandlerDelay,X                      ;A9CAF9;
    STZ.W BabyMetroidCutscene.paletteFrameTimer,X                        ;A9CAFC;
    LDA.W #HandleBabyMetroidCutscenePalette_LowHealth                    ;A9CAFF;
    STA.L BabyMetroidCutscene.paletteFunction,X                          ;A9CB02;
    LDA.W #$0001                                                         ;A9CB06;
    STA.L BabyMetroidCutscene.crySFXFlag,X                               ;A9CB09;
    DEC                                                                  ;A9CB0D;
    STA.L BabyMetroidCutscene.healthBasedPaletteFlag,X                   ;A9CB0E;
    RTS                                                                  ;A9CB12;


;;; $CB13: Shitroid function - release Samus ;;;
Function_BabyMetroidCutscene_ReleaseSamus:
    LDA.W #$0072                                                         ;A9CB13;
    JSL.L QueueSound_Lib2_Max6                                           ;A9CB16;
    LDA.W #$0001                                                         ;A9CB1A;
    STA.L BabyMetroidCutscene.speed+$40                                  ;A9CB1D;
    LDA.W #Function_BabyMetroidCutscene_StaredownMotherBrain             ;A9CB21;
    STA.W BabyMetroidCutscene.function,X                                 ;A9CB24;
    LDA.W #Function_MBBody_Phase2_PrepareForFinalBabyMetroidAttack       ;A9CB27;
    STA.W MotherBrainBody.function                                       ;A9CB2A; fallthrough to Function_BabyMetroidCutscene_StaredownMotherBrain


;;; $CB2D: Shitroid function - stare down Mother Brain ;;;
Function_BabyMetroidCutscene_StaredownMotherBrain:
    LDA.W SamusXPosition                                                 ;A9CB2D;
    SEC                                                                  ;A9CB30;
    SBC.W #$0004                                                         ;A9CB31;
    STA.B DP_Temp12                                                      ;A9CB34;
    LDA.W #$0060                                                         ;A9CB36;
    STA.B DP_Temp14                                                      ;A9CB39;
    LDY.W #$0000                                                         ;A9CB3B;
    JSR.W GradduallyAccelerateTowardsPoint_1A_10                         ;A9CB3E;
    LDA.W #$0004                                                         ;A9CB41;
    STA.B DP_Temp16                                                      ;A9CB44;
    STA.B DP_Temp18                                                      ;A9CB46;
    JSL.L CheckForEnemyCollisionWithRectangle                            ;A9CB48;
    BCC .collision                                                       ;A9CB4C;
    RTS                                                                  ;A9CB4E;

  .collision:
    LDA.W #Function_BabyMetroidCutscene_FlyOffScreen                     ;A9CB4F;
    STA.W BabyMetroidCutscene.function,X                                 ;A9CB52;
    RTS                                                                  ;A9CB55;


;;; $CB56: Shitroid function - fly off-screen ;;;
Function_BabyMetroidCutscene_FlyOffScreen:
    LDA.W #$0110                                                         ;A9CB56;
    STA.B DP_Temp12                                                      ;A9CB59;
    LDA.W #$0040                                                         ;A9CB5B;
    STA.B DP_Temp14                                                      ;A9CB5E;
    LDY.W #$0000                                                         ;A9CB60;
    JSR.W GradduallyAccelerateTowardsPoint_1A_10                         ;A9CB63;
    LDA.W #$0004                                                         ;A9CB66;
    STA.B DP_Temp16                                                      ;A9CB69;
    STA.B DP_Temp18                                                      ;A9CB6B;
    JSL.L CheckForEnemyCollisionWithRectangle                            ;A9CB6D;
    BCC .collision                                                       ;A9CB71;
    RTS                                                                  ;A9CB73;

  .collision:
    LDA.W #Function_BabyMetroidCutscene_MoveToFinalChargeStartPosition   ;A9CB74;
    STA.W BabyMetroidCutscene.function,X                                 ;A9CB77;
    RTS                                                                  ;A9CB7A;


;;; $CB7B: Shitroid function - move to final charge start position ;;;
Function_BabyMetroidCutscene_MoveToFinalChargeStartPosition:
    LDA.W #$0131                                                         ;A9CB7B;
    STA.B DP_Temp12                                                      ;A9CB7E;
    LDA.W #$00A0                                                         ;A9CB80;
    STA.B DP_Temp14                                                      ;A9CB83;
    LDY.W #$0000                                                         ;A9CB85;
    JSR.W GradduallyAccelerateTowardsPoint_1A_10                         ;A9CB88;
    LDA.W #$0004                                                         ;A9CB8B;
    STA.B DP_Temp16                                                      ;A9CB8E;
    STA.B DP_Temp18                                                      ;A9CB90;
    JSL.L CheckForEnemyCollisionWithRectangle                            ;A9CB92;
    BCC .collision                                                       ;A9CB96;
    RTS                                                                  ;A9CB98;

  .collision:
    LDA.W #$004F                                                         ;A9CB99;
    STA.W Enemy.health,X                                                 ;A9CB9C;
    LDA.W #$0000                                                         ;A9CB9F;
    STA.L BabyMetroidCutscene.speed+$40                                  ;A9CBA2;
    LDA.W #Function_MBBody_Phase2_ExecuteFinalBabyMetroidAttack          ;A9CBA6;
    STA.W MotherBrainBody.function                                       ;A9CBA9;
    LDA.W #Function_BabyMetroidCutscene_InitiateFinalCharge              ;A9CBAC;
    STA.W BabyMetroidCutscene.function,X                                 ;A9CBAF;
    RTS                                                                  ;A9CBB2;


;;; $CBB3: Shitroid function - initiate final charge ;;;
Function_BabyMetroidCutscene_InitiateFinalCharge:
    LDA.W #$0122                                                         ;A9CBB3;
    STA.B DP_Temp12                                                      ;A9CBB6;
    LDA.W #$0080                                                         ;A9CBB8;
    STA.B DP_Temp14                                                      ;A9CBBB;
    LDY.W #$000A                                                         ;A9CBBD;
    JSR.W GradduallyAccelerateTowardsPoint_1A_400                        ;A9CBC0;
    LDA.W #$0004                                                         ;A9CBC3;
    STA.B DP_Temp16                                                      ;A9CBC6;
    STA.B DP_Temp18                                                      ;A9CBC8;
    JSL.L CheckForEnemyCollisionWithRectangle                            ;A9CBCA;
    BCC .collision                                                       ;A9CBCE;
    RTS                                                                  ;A9CBD0;

  .collision:
    LDA.W #Function_BabyMetroidCutscene_FinalCharge                      ;A9CBD1;
    STA.W BabyMetroidCutscene.function,X                                 ;A9CBD4;
    RTS                                                                  ;A9CBD7;


;;; $CBD8: Shitroid function - final charge ;;;
Function_BabyMetroidCutscene_FinalCharge:
    LDA.W Enemy[1].XPosition                                             ;A9CBD8;
    STA.B DP_Temp12                                                      ;A9CBDB;
    LDA.W #$FFE0                                                         ;A9CBDD;
    CLC                                                                  ;A9CBE0;
    ADC.W Enemy[1].YPosition                                             ;A9CBE1;
    STA.B DP_Temp14                                                      ;A9CBE4;
    LDY.W #$000C                                                         ;A9CBE6;
    JSR.W GradduallyAccelerateTowardsPoint_1A_400                        ;A9CBE9;
    LDA.W Enemy.health,X                                                 ;A9CBEC;
    BEQ .zeroHealth                                                      ;A9CBEF;
    RTS                                                                  ;A9CBF1;

  .zeroHealth:
    LDA.W #Function_BabyMetroidCutscene_PrepareForHyperBeam_return       ;A9CBF2;
    STA.L BabyMetroidCutscene.paletteFunction,X                          ;A9CBF5;
    LDA.W #$10A0                                                         ;A9CBF9;
    STA.W Enemy.GFXOffset,X                                              ;A9CBFC;
    LDA.W #$0019                                                         ;A9CBFF;
    JSL.L QueueSound_Lib3_Max6                                           ;A9CC02;
    JSL.L FadeOutBackgroundForBabyMetroidDeathSequence                   ;A9CC06;
    LDA.W #InstList_BabyMetroid_TookFatalBlow                            ;A9CC0A;
    JSL.L SetEnemyInstList                                               ;A9CC0D;
    STZ.W BabyMetroidCutscene.XVelocity,X                                ;A9CC11;
    STZ.W BabyMetroidCutscene.YVelocity,X                                ;A9CC14;
    LDA.W #RTS_A9C18D                                                    ;A9CC17;
    STA.W MotherBrainBody.function                                       ;A9CC1A;
    LDA.W #$0000                                                         ;A9CC1D;
    JSL.L QueueMusicDataOrTrack_8FrameDelay                              ;A9CC20;
    LDA.W #Function_BabyMetroidCutscene_TakeFinalBlow                    ;A9CC24;
    STA.W BabyMetroidCutscene.function,X                                 ;A9CC27;
    LDA.W #$0010                                                         ;A9CC2A;
    STA.W BabyMetroidCutscene.functionTimer,X                            ;A9CC2D;
    LDA.W Enemy.XPosition,X                                              ;A9CC30;
    STA.L BabyMetroidCutscene.shakingOriginXPosition,X                   ;A9CC33;
    LDA.W Enemy.YPosition,X                                              ;A9CC37;
    STA.L BabyMetroidCutscene.shakingOriginYPosition,X                   ;A9CC3A; fallthrough to Function_BabyMetroidCutscene_TakeFinalBlow


;;; $CC3E: Shitroid function - Shitroid takes fatal blow ;;;
Function_BabyMetroidCutscene_TakeFinalBlow:
    JSR.W ShakeBabyMetroidCutscene                                       ;A9CC3E;
    DEC.W BabyMetroidCutscene.functionTimer,X                            ;A9CC41;
    BPL Function_BabyMetroidCutscene_PrepareForHyperBeam_return          ;A9CC44;
    LDA.L BabyMetroidCutscene.shakingOriginXPosition,X                   ;A9CC46;
    STA.W Enemy.XPosition,X                                              ;A9CC4A;
    LDA.L BabyMetroidCutscene.shakingOriginYPosition,X                   ;A9CC4D;
    STA.W Enemy.YPosition,X                                              ;A9CC51;
    LDA.W #Function_BabyMetroidCutscene_PlaySamusTheme                   ;A9CC54;
    STA.W BabyMetroidCutscene.function,X                                 ;A9CC57;
    LDA.W #$0038                                                         ;A9CC5A;
    STA.W BabyMetroidCutscene.functionTimer,X                            ;A9CC5D; fallthrough to Function_BabyMetroidCutscene_PlaySamusTheme


;;; $CC60: Shitroid function - play Samus theme ;;;
Function_BabyMetroidCutscene_PlaySamusTheme:
    DEC.W BabyMetroidCutscene.functionTimer,X                            ;A9CC60;
    BPL Function_BabyMetroidCutscene_PrepareForHyperBeam_return          ;A9CC63;
    LDA.W #$FF48                                                         ;A9CC65;
    JSL.L QueueMusicDataOrTrack_8FrameDelay                              ;A9CC68;
    LDA.W #$0005                                                         ;A9CC6C;
    JSL.L QueueMusicDataOrTrack_8FrameDelay                              ;A9CC6F;
    LDA.W #Function_BabyMetroidCutscene_PrepareForHyperBeam              ;A9CC73;
    STA.W BabyMetroidCutscene.function,X                                 ;A9CC76;
    LDA.W #$000C                                                         ;A9CC79;
    STA.W BabyMetroidCutscene.functionTimer,X                            ;A9CC7C; fallthrough to Function_BabyMetroidCutscene_PrepareForHyperBeam


;;; $CC7F: Shitroid function - prepare Samus for hyper beam acquisition ;;;
Function_BabyMetroidCutscene_PrepareForHyperBeam:
    DEC.W BabyMetroidCutscene.functionTimer,X                            ;A9CC7F;
    BPL .return                                                          ;A9CC82;
    LDA.W #$0019                                                         ;A9CC84;
    JSL.L Run_Samus_Command                                              ;A9CC87;
    LDA.W #SamusRainbowPaletteFunction_ActivateRainbowWhenEnemyIsLow     ;A9CC8B;
    STA.L MotherBrainBody.SamusRainbowPaletteFunction                    ;A9CC8E;
    LDA.W #Function_BabyMetroidCutscene_DeathSequence                    ;A9CC92;
    STA.W BabyMetroidCutscene.function,X                                 ;A9CC95;

  .return:
    RTS                                                                  ;A9CC98;


;;; $CC99: Shitroid function - death sequence ;;;
Function_BabyMetroidCutscene_DeathSequence:
    JSR.W HandleSamusRainbowPaletteAnimation                             ;A9CC99;
    JSR.W AccelerateBabyMetroidDownwards                                 ;A9CC9C;
    JSR.W FadeBabyMetroidCutsceneToBlack                                 ;A9CC9F;
    BCS .fadedToBlack                                                    ;A9CCA2;
    JSR.W HandleBabyMetroidCutsceneDeathExplosions                       ;A9CCA4;
    JMP.W HandleEnemyBlinking                                            ;A9CCA7;

  .fadedToBlack:
    LDA.W Enemy.properties,X                                             ;A9CCAA;
    ORA.W #$0100                                                         ;A9CCAD;
    STA.W Enemy.properties,X                                             ;A9CCB0;
    LDA.W #Function_BabyMetroidCutscene_UnloadTiles                      ;A9CCB3;
    STA.W BabyMetroidCutscene.function,X                                 ;A9CCB6;
    LDA.W #$0080                                                         ;A9CCB9;
    STA.W BabyMetroidCutscene.functionTimer,X                            ;A9CCBC;

  .return:
    RTS                                                                  ;A9CCBF;


;;; $CCC0: Shitroid function - unload Shitroid tiles ;;;
Function_BabyMetroidCutscene_UnloadTiles:
    JSR.W HandleSamusRainbowPaletteAnimation                             ;A9CCC0;
    DEC.W BabyMetroidCutscene.functionTimer,X                            ;A9CCC3;
    BPL Function_BabyMetroidCutscene_DeathSequence_return                ;A9CCC6;
    PHX                                                                  ;A9CCC8;
    LDX.W #MotherBrainFightSpriteTileTransferEntries_attacks             ;A9CCC9;
    JSR.W ProcessSpriteTilesTransfers                                    ;A9CCCC;
    PLX                                                                  ;A9CCCF;
    BCC Function_BabyMetroidCutscene_DeathSequence_return                ;A9CCD0;
    LDA.W #Function_BabyMetroidCutscene_LetSamusRainbowSomeMore          ;A9CCD2;
    STA.W BabyMetroidCutscene.function,X                                 ;A9CCD5;
    LDA.W #$00B0                                                         ;A9CCD8;
    STA.W BabyMetroidCutscene.functionTimer,X                            ;A9CCDB; fallthrough to Function_BabyMetroidCutscene_LetSamusRainbowSomeMore


;;; $CCDE: Shitroid function - let Samus rainbow some more ;;;
Function_BabyMetroidCutscene_LetSamusRainbowSomeMore:
    DEC.W BabyMetroidCutscene.functionTimer,X                            ;A9CCDE;
    BPL Function_BabyMetroidCutscene_DeathSequence_return                ;A9CCE1;
    LDA.W #Function_BabyMetroidCutscene_FinalCutscene                    ;A9CCE3;
    STA.W BabyMetroidCutscene.function,X                                 ;A9CCE6;
    LDA.W #$0000                                                         ;A9CCE9;
    STA.L MotherBrainBody.roomLightsTransitionCounter                    ;A9CCEC; fallthrough to Function_BabyMetroidCutscene_FinalCutscene


;;; $CCF0: Shitroid function - finish cutscene ;;;
Function_BabyMetroidCutscene_FinalCutscene:
    LDA.L MotherBrainBody.roomLightsTransitionCounter                    ;A9CCF0;
    INC                                                                  ;A9CCF4;
    STA.L MotherBrainBody.roomLightsTransitionCounter                    ;A9CCF5;
    DEC                                                                  ;A9CCF9;
    PHX                                                                  ;A9CCFA;
    JSL.L FadeInBackgroundForMotherBrainPhase3                           ;A9CCFB;
    PLX                                                                  ;A9CCFF;
    BCC Function_BabyMetroidCutscene_DeathSequence_return                ;A9CD00;
    LDA.W #Function_MBBody_Phase3_RecoverFromCutscene_MakeSomeDistance   ;A9CD02;
    STA.W MotherBrainBody.function                                       ;A9CD05;
    LDA.W #$0017                                                         ;A9CD08;
    JSL.L Run_Samus_Command                                              ;A9CD0B;
    LDA.W #$0003                                                         ;A9CD0F;
    JSL.L DrainedSamusController                                         ;A9CD12;
    LDA.W Enemy.properties,X                                             ;A9CD16;
    ORA.W #$0200                                                         ;A9CD19;
    STA.W Enemy.properties,X                                             ;A9CD1C;
    LDA.W #$0000                                                         ;A9CD1F;
    STA.L MotherBrainBody.BabyMetroidEnemyIndex                          ;A9CD22;
    RTS                                                                  ;A9CD26;


;;; $CD27: Handle Samus rainbow palette animation ;;;
HandleSamusRainbowPaletteAnimation:
    LDA.L MotherBrainBody.SamusRainbowPaletteFunction                    ;A9CD27;
    STA.B DP_Temp12                                                      ;A9CD2B;
    JMP.W (DP_Temp12)                                                    ;A9CD2D;


;;; $CD30: Samus rainbow palette function - activate rainbow when enemy is low enough ;;;
SamusRainbowPaletteFunction_ActivateRainbowWhenEnemyIsLow:
    LDA.W Enemy.YPosition,X                                              ;A9CD30;
    CLC                                                                  ;A9CD33;
    ADC.W #$0010                                                         ;A9CD34;
    CMP.W SamusYPosition                                                 ;A9CD37;
    BMI .return                                                          ;A9CD3A;
    LDA.W #$0016                                                         ;A9CD3C;
    JSL.L Run_Samus_Command                                              ;A9CD3F;
    LDA.W #SamusRainbowPaletteFunction_GraduallySlowAnimationDown        ;A9CD43;
    STA.L MotherBrainBody.SamusRainbowPaletteFunction                    ;A9CD46;

  .return:
    RTS                                                                  ;A9CD4A;


;;; $CD4B: Samus rainbow palette function - gradually slow animation down ;;;
SamusRainbowPaletteFunction_GraduallySlowAnimationDown:
; This Samus rainbow palette animation counter thing is dumb
    LDA.L MotherBrainBody.SamusRainbowPaletteAnimationCounter            ;A9CD4B;
    CLC                                                                  ;A9CD4F;
    ADC.W #$0300                                                         ;A9CD50;
    STA.L MotherBrainBody.SamusRainbowPaletteAnimationCounter            ;A9CD53;
    BCC .return                                                          ;A9CD57;
    LDA.W SpecialSamusPaletteFrame                                       ;A9CD59;
    INC                                                                  ;A9CD5C;
    CMP.W #$000A                                                         ;A9CD5D;
    BMI .stillSlowing                                                    ;A9CD60;
    LDA.W #$000A                                                         ;A9CD62;

  .stillSlowing:
    STA.W SpecialSamusPaletteFrame                                       ;A9CD65;

  .return:
    RTS                                                                  ;A9CD68;


;;; $CD69: Fade Shitroid to black ;;;
FadeBabyMetroidCutsceneToBlack:
;; Returns:
;;     Carry: Set if faded to black, clear otherwise
    LDA.W Enemy.YPosition,X                                              ;A9CD69;
    CMP.W #$0080                                                         ;A9CD6C;
    BMI .returnNotFaded                                                  ;A9CD6F;
    PHB                                                                  ;A9CD71;
    PEA.W BabyMetroidFadingToBlackPalettes>>8&$FF00                      ;A9CD72;
    PLB                                                                  ;A9CD75;
    PLB                                                                  ;A9CD76;
    LDA.L BabyMetroidCutscene.fadeToBlackPaletteTimer,X                  ;A9CD77;
    DEC                                                                  ;A9CD7B;
    BMI .advancePalette                                                  ;A9CD7C;
    STA.L BabyMetroidCutscene.fadeToBlackPaletteTimer,X                  ;A9CD7E;
    PLB                                                                  ;A9CD82;

  .returnNotFaded:
    CLC                                                                  ;A9CD83;
    RTS                                                                  ;A9CD84;

  .advancePalette:
    LDA.W #$0008                                                         ;A9CD85;
    STA.L BabyMetroidCutscene.fadeToBlackPaletteTimer,X                  ;A9CD88;
    LDA.L BabyMetroidCutscene.fadeToBlackPaletteIndex,X                  ;A9CD8C;
    INC                                                                  ;A9CD90;
    CMP.W #$0007                                                         ;A9CD91;
    BMI .fadeToBlack                                                     ;A9CD94;
    PLB                                                                  ;A9CD96;
    SEC                                                                  ;A9CD97;
    RTS                                                                  ;A9CD98;

  .fadeToBlack:
    PHX                                                                  ;A9CD99;
    STA.L BabyMetroidCutscene.fadeToBlackPaletteIndex,X                  ;A9CD9A;
    ASL                                                                  ;A9CD9E;
    TAX                                                                  ;A9CD9F;
    LDY.W BabyMetroidFadingToBlackPalettes,X                             ;A9CDA0;
    LDX.W #$01E2                                                         ;A9CDA3;
    LDA.W #$000E                                                         ;A9CDA6;
    JSL.L WriteAColorsFromYtoColorIndexX                                 ;A9CDA9;
    PLX                                                                  ;A9CDAD;
    PLB                                                                  ;A9CDAE;
    CLC                                                                  ;A9CDAF;
    RTS                                                                  ;A9CDB0;


;;; $CDB1: Handle Shitroid death explosions ;;;
HandleBabyMetroidCutsceneDeathExplosions:
    LDA.L BabyMetroidCutscene.deathExplosionTimer,X                      ;A9CDB1;
    DEC                                                                  ;A9CDB5;
    BMI .timerExpired                                                    ;A9CDB6;
    STA.L BabyMetroidCutscene.deathExplosionTimer,X                      ;A9CDB8;
    RTS                                                                  ;A9CDBC;

  .timerExpired:
    LDA.W #$0004                                                         ;A9CDBD;
    STA.L BabyMetroidCutscene.deathExplosionTimer,X                      ;A9CDC0;
    LDA.L MotherBrainBody.walkCounter,X                                  ;A9CDC4;
    INC                                                                  ;A9CDC8;
    CMP.W #$000A                                                         ;A9CDC9;
    BMI +                                                                ;A9CDCC;
    LDA.W #$0000                                                         ;A9CDCE;

+   STA.L MotherBrainBody.walkCounter,X                                  ;A9CDD1;
    ASL                                                                  ;A9CDD5;
    ASL                                                                  ;A9CDD6;
    TAY                                                                  ;A9CDD7;
    LDA.W .XOffsets,Y                                                    ;A9CDD8;
    CLC                                                                  ;A9CDDB;
    ADC.W Enemy.XPosition,X                                              ;A9CDDC;
    STA.B DP_Temp12                                                      ;A9CDDF;
    LDA.W .YOffsets,Y                                                    ;A9CDE1;
    CLC                                                                  ;A9CDE4;
    ADC.W Enemy.YPosition,X                                              ;A9CDE5;
    STA.B DP_Temp14                                                      ;A9CDE8;
    LDA.W #$0003                                                         ;A9CDEA;
    LDY.W #EnemyProjectile_MiscDust                                      ;A9CDED;
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics                  ;A9CDF0;
    LDA.W #$0013                                                         ;A9CDF4;
    JSL.L QueueSound_Lib3_Max3                                           ;A9CDF7;
    RTS                                                                  ;A9CDFB;

; Explosion offset table
;        __________ X offset
;       |      ____ Y offset
;       |     |
  .XOffsets:
    dw       $FFE8                                                       ;A9CDFC;
  .YOffsets:
    dw $FFE8                                                             ;A9CDFE;
    dw $FFEC,$0014
    dw $0010,$FFE2
    dw $001E,$FFFD
    dw $000E,$FFF3
    dw $FFFE,$0012
    dw $FFFE,$FFE0
    dw $FFE1,$0008
    dw $FFFC,$FFF6
    dw $0013,$0013


;;; $CE24: Handle enemy blinking ;;;
HandleEnemyBlinking:
    LDA.W Enemy.frameCounter,X                                           ;A9CE24;
    AND.W #$0001                                                         ;A9CE27;
    BEQ .invisible                                                       ;A9CE2A;
    LDA.W Enemy.properties,X                                             ;A9CE2C;
    AND.W #$FEFF                                                         ;A9CE2F;
    STA.W Enemy.properties,X                                             ;A9CE32;
    RTS                                                                  ;A9CE35;

  .invisible:
    LDA.W Enemy.properties,X                                             ;A9CE36;
    ORA.W #$0100                                                         ;A9CE39;
    STA.W Enemy.properties,X                                             ;A9CE3C;
    RTS                                                                  ;A9CE3F;


;;; $CE40: Accelerate Shitroid downwards ;;;
AccelerateBabyMetroidDownwards:
    LDA.W BabyMetroid.XVelocity,X                                        ;A9CE40;
    BPL +                                                                ;A9CE43;
    EOR.W #$FFFF                                                         ;A9CE45;
    INC                                                                  ;A9CE48;

+   SEC                                                                  ;A9CE49;
    SBC.W #$0020                                                         ;A9CE4A;
    BPL +                                                                ;A9CE4D;
    LDA.W #$0000                                                         ;A9CE4F;

+   BIT.W BabyMetroid.XVelocity,X                                        ;A9CE52;
    BPL +                                                                ;A9CE55;
    EOR.W #$FFFF                                                         ;A9CE57;
    INC                                                                  ;A9CE5A;

+   STA.W BabyMetroid.XVelocity,X                                        ;A9CE5B;
    LDA.W BabyMetroid.YVelocity,X                                        ;A9CE5E;
    CLC                                                                  ;A9CE61;
    ADC.W #$0002                                                         ;A9CE62;
    STA.W BabyMetroid.YVelocity,X                                        ;A9CE65;
    RTS                                                                  ;A9CE68;


;;; $CE69: Handle Shitroid health-based palette ;;;
HandleBabyMetroidHealthBasedPalette:
    LDA.L BabyMetroidCutscene.healthBasedPaletteFlag,X                   ;A9CE69;
    BEQ .return                                                          ;A9CE6D;
    LDA.W Enemy.health,X                                                 ;A9CE6F;
    CMP.W #$0A00                                                         ;A9CE72;
    BMI .health80                                                        ;A9CE75;

  .return:
    RTS                                                                  ;A9CE77;

  .health80:
    LDY.W #$0002                                                         ;A9CE78;
    CMP.W #$08C0                                                         ;A9CE7B;
    BPL .setPalette                                                      ;A9CE7E;
    LDY.W #$0004                                                         ;A9CE80;
    CMP.W #$0780                                                         ;A9CE83;
    BPL .setPalette                                                      ;A9CE86;
    LDY.W #$0006                                                         ;A9CE88;
    CMP.W #$0640                                                         ;A9CE8B;
    BPL .setPalette                                                      ;A9CE8E;
    LDY.W #$0008                                                         ;A9CE90;
    CMP.W #$0500                                                         ;A9CE93;
    BPL .setPalette                                                      ;A9CE96;
    LDY.W #$000A                                                         ;A9CE98;
    CMP.W #$03C0                                                         ;A9CE9B;
    BPL .setPalette                                                      ;A9CE9E;
    LDY.W #$000C                                                         ;A9CEA0;
    CMP.W #$0280                                                         ;A9CEA3;
    BPL .setPalette                                                      ;A9CEA6;
    LDY.W #$000E                                                         ;A9CEA8;

  .setPalette:
    PHB                                                                  ;A9CEAB;
    PEA.W BabyMetroidHealthBasedPalette_Shell>>8&$FF00                   ;A9CEAC;
    PLB                                                                  ;A9CEAF;
    PLB                                                                  ;A9CEB0;
    PHY                                                                  ;A9CEB1;
    LDA.W BabyMetroidHealthBasedPalette_Shell,Y                          ;A9CEB2;
    TAY                                                                  ;A9CEB5;
    LDX.W #$01E2                                                         ;A9CEB6;
    LDA.W #$0004                                                         ;A9CEB9;
    JSL.L WriteAColorsFromYtoColorIndexX                                 ;A9CEBC;
    LDX.W #$01F4                                                         ;A9CEC0;
    LDA.W #$0005                                                         ;A9CEC3;
    JSL.L WriteAColorsFromYtoColorIndexX                                 ;A9CEC6;
    PLY                                                                  ;A9CECA;
    LDA.W BabyMetroidHealthBasedPalette_Innards,Y                        ;A9CECB;
    TAY                                                                  ;A9CECE;
    LDX.W #$01EA                                                         ;A9CECF;
    LDA.W #$0005                                                         ;A9CED2;
    JSL.L WriteAColorsFromYtoColorIndexX                                 ;A9CED5;
    PLB                                                                  ;A9CED9;
    RTS                                                                  ;A9CEDA;


;;; $CEDB: Shake Shitroid ;;;
ShakeBabyMetroidCutscene:
; Decrementing velocity might be setting up initial velocity for the later calls to AccelerateBabyMetroidDownwards, pretty weird stuff...
    LDA.W BabyMetroidCutscene.YVelocity,X                                ;A9CEDB;
    CLC                                                                  ;A9CEDE;
    ADC.W #$FFFF                                                         ;A9CEDF;
    STA.W BabyMetroidCutscene.YVelocity,X                                ;A9CEE2;
    LDA.W Enemy.frameCounter,X                                           ;A9CEE5;
    AND.W #$0006                                                         ;A9CEE8;
    TAY                                                                  ;A9CEEB;
    LDA.W ShakingOffsets_X,Y                                             ;A9CEEC;
    CLC                                                                  ;A9CEEF;
    ADC.L BabyMetroidCutscene.shakingOriginXPosition,X                   ;A9CEF0;
    STA.W Enemy.XPosition,X                                              ;A9CEF4;
    LDA.W ShakingOffsets_Y,Y                                             ;A9CEF7;
    CLC                                                                  ;A9CEFA;
    ADC.L BabyMetroidCutscene.shakingOriginYPosition,X                   ;A9CEFB;
    STA.W Enemy.YPosition,X                                              ;A9CEFF;
    RTS                                                                  ;A9CF02;


;;; $CF03: Enemy touch - enemy $ECBF (Shitroid in cutscene) ;;;
EnemyTouch_BabyMetroidCutscene:
    LDX.W EnemyIndex                                                     ;A9CF03;
    LDA.W BabyMetroidCutscene.function,X                                 ;A9CF06;
    CMP.W #Function_BabyMetroidCutscene_LatchOntoSamus                   ;A9CF09;
    BNE .return                                                          ;A9CF0C;
    LDA.W SamusXPosition                                                 ;A9CF0E;
    STA.B DP_Temp12                                                      ;A9CF11;
    LDA.W SamusYPosition                                                 ;A9CF13;
    SEC                                                                  ;A9CF16;
    SBC.W #$0014                                                         ;A9CF17;
    STA.B DP_Temp14                                                      ;A9CF1A;
    LDA.W #$0010                                                         ;A9CF1C;
    JSR.W AccelerateBabyMetroidTowardsPoint                              ;A9CF1F;
    BCC .return                                                          ;A9CF22;
    STZ.W BabyMetroidCutscene.XVelocity,X                                ;A9CF24;
    STZ.W BabyMetroidCutscene.YVelocity,X                                ;A9CF27;
    LDA.W #Function_BabyMetroidCutscene_HealSamusUpToFullEnergy          ;A9CF2A;
    STA.W BabyMetroidCutscene.function,X                                 ;A9CF2D;

  .return:
    RTL                                                                  ;A9CF30;


;;; $CF31: Update Shitroid speed and angle ;;;
UpdateBabyMetroidCutsceneSpeedAndAngle:
;; Parameters:
;;     $12: Angle delta
;;     $14: Target angle
;;     $16: Target speed
    LDA.B DP_Temp16                                                      ;A9CF31;
    CMP.L BabyMetroidCutscene.speed,X                                    ;A9CF33;
    BEQ .speedCalculated                                                 ;A9CF37;
    BPL .notReachedTargedSpeed                                           ;A9CF39;
    LDA.L BabyMetroidCutscene.speed,X                                    ;A9CF3B;
    SEC                                                                  ;A9CF3F;
    SBC.W #$0020                                                         ;A9CF40;
    CMP.B DP_Temp16                                                      ;A9CF43;
    BPL .setSpeed                                                        ;A9CF45;
    LDA.B DP_Temp16                                                      ;A9CF47;

  .setSpeed:
    STA.L BabyMetroidCutscene.speed,X                                    ;A9CF49;
    BRA .speedCalculated                                                 ;A9CF4D;

  .notReachedTargedSpeed:
    LDA.L BabyMetroidCutscene.speed,X                                    ;A9CF4F;
    CLC                                                                  ;A9CF53;
    ADC.W #$0020                                                         ;A9CF54;
    CMP.B DP_Temp16                                                      ;A9CF57;
    BMI ..setSpeed                                                       ;A9CF59;
    LDA.B DP_Temp16                                                      ;A9CF5B;

  ..setSpeed:
    STA.L BabyMetroidCutscene.speed,X                                    ;A9CF5D;

  .speedCalculated:
    LDA.B DP_Temp12                                                      ;A9CF61;
    BMI .negativeAngleDelta                                              ;A9CF63;
    CLC                                                                  ;A9CF65;
    ADC.L BabyMetroidCutscene.angle,X                                    ;A9CF66;
    CMP.B DP_Temp14                                                      ;A9CF6A;
    BMI .setAngle                                                        ;A9CF6C;
    BRA .maxAngle                                                        ;A9CF6E;

  .negativeAngleDelta:
    CLC                                                                  ;A9CF70;
    ADC.L BabyMetroidCutscene.angle,X                                    ;A9CF71;
    CMP.B DP_Temp14                                                      ;A9CF75;
    BPL .setAngle                                                        ;A9CF77;

  .maxAngle:
    LDA.B DP_Temp14                                                      ;A9CF79;

  .setAngle:
    STA.L BabyMetroidCutscene.angle,X                                    ;A9CF7B;
    XBA                                                                  ;A9CF7F;
    AND.W #$00FF                                                         ;A9CF80;
    STA.B DP_Temp12                                                      ;A9CF83;
    LDA.L BabyMetroidCutscene.speed,X                                    ;A9CF85;
    JSL.L CalculateXVelocityFromSpeedAndAngle                            ;A9CF89;
    LDX.W EnemyIndex                                                     ;A9CF8D;
    STA.W BabyMetroidCutscene.XVelocity,X                                ;A9CF90;
    LDA.L BabyMetroidCutscene.speed,X                                    ;A9CF93;
    JSL.L CalculateYVelocityFromSpeedAndAngle                            ;A9CF97;
    LDX.W EnemyIndex                                                     ;A9CF9B;
    STA.W BabyMetroidCutscene.YVelocity,X                                ;A9CF9E;
    RTS                                                                  ;A9CFA1;


;;; $CFA2: Instruction list - Shitroid - initial ;;;
InstList_BabyMetroid_Initial:
    dw $0010,Spritemap_BabyMetroid_0                                     ;A9CFA2;
    dw $0010,Spritemap_BabyMetroid_1                                     ;A9CFA6;
    dw $0010,Spritemap_BabyMetroid_2                                     ;A9CFAA;
    dw $0010,Spritemap_BabyMetroid_1                                     ;A9CFAE;
    dw Instruction_BabyMetroid_GotoInitial                               ;A9CFB2;


;;; $CFB4: Instruction - go to InstList_BabyMetroid_Initial ;;;
Instruction_BabyMetroid_GotoInitial:
    LDY.W #InstList_BabyMetroid_Initial                                  ;A9CFB4;
    RTL                                                                  ;A9CFB7;


;;; $CFB8: Instruction list - Shitroid - draining Mother Brain ;;;
InstList_BabyMetroid_DrainingMotherBrain:
    dw $0008,Spritemap_BabyMetroid_0                                     ;A9CFB8;
    dw $0008,Spritemap_BabyMetroid_1                                     ;A9CFBC;
    dw $0005,Spritemap_BabyMetroid_2                                     ;A9CFC0;
    dw $0002,Spritemap_BabyMetroid_1                                     ;A9CFC4;
    dw Instruction_BabyMetroid_GotoDrainingMotherBrain                   ;A9CFC8;


;;; $CFCA: Instruction - go to InstList_BabyMetroid_DrainingMotherBrain ;;;
Instruction_BabyMetroid_GotoDrainingMotherBrain:
    LDY.W #InstList_BabyMetroid_DrainingMotherBrain                      ;A9CFCA;
    RTL                                                                  ;A9CFCD;


;;; $CFCE: Instruction list - Shitroid - took fatal blow ;;;
InstList_BabyMetroid_TookFatalBlow:
    dw $0080,Spritemap_BabyMetroid_2                                     ;A9CFCE;
    dw Common_Instruction_Sleep                                          ;A9CFD2;


;;; $CFD4: Process Mother Brain invincibility palette ;;;
ProcessMotherBrainInvincibilityPalette:
    LDA.L MotherBrainBody.form                                           ;A9CFD4;
    CMP.W #$0004                                                         ;A9CFD8;
    BNE .return                                                          ;A9CFDB;
    LDA.W Enemy[1].flashTimer                                            ;A9CFDD;
    LSR                                                                  ;A9CFE0;
    BEQ .return                                                          ;A9CFE1;
    BCS .return                                                          ;A9CFE3;
    LDX.W #$001C                                                         ;A9CFE5;

  .loop:
    LDA.L Palettes_SpriteP0+2,X                                          ;A9CFE8;
    STA.L Palettes_SpriteP1+2,X                                          ;A9CFEC;
    STA.L Palettes_SpriteP3+2,X                                          ;A9CFF0;
    STA.L Palettes_BG12P4+2,X                                            ;A9CFF4;
    DEX                                                                  ;A9CFF8;
    DEX                                                                  ;A9CFF9;
    BPL .loop                                                            ;A9CFFA;

  .return:
    RTS                                                                  ;A9CFFC;


;;; $CFFD: Begin screen flashing ;;;
MotherBrainPalette_BeginScreenFlashing:
; Called on end of MB first phase
    LDA.W #InstList_RoomPalette_FirstPhaseEnded                          ;A9CFFD;
    STA.L MotherBrainBody.roomPaletteInstListPointer                     ;A9D000;
    LDA.W #$0001                                                         ;A9D004;
    STA.L MotherBrainBody.roomPaletteInstructionTimer                    ;A9D007;
    RTS                                                                  ;A9D00B;


;;; $D00C: End screen flashing ;;;
MotherBrainPalette_EndScreenFlashing:
    LDA.W #$0000                                                         ;A9D00C;
    STA.L MotherBrainBody.roomPaletteInstListPointer                     ;A9D00F;
    STA.L MotherBrainBody.roomPaletteInstructionTimer                    ;A9D013;
    LDY.W #RoomPalettes_Phase1Ended_0                                    ;A9D017;
    BRA MotherBrainPalette_WriteRoomPalette                              ;A9D01A;


;;; $D01C: Handle room palette ;;;
MotherBrainPalette_HandleRoomPalette:
    LDA.W #MotherBrainBody.roomPaletteInstListPointer                    ;A9D01C;
    JSR.W HandleRoomPaletteInstList                                      ;A9D01F;
    BCS MotherBrainPalette_WriteRoomPalette                              ;A9D022;
    RTS                                                                  ;A9D024;


;;; $D025: Write room palette ;;;
MotherBrainPalette_WriteRoomPalette:
; BG palette 3: Room background
; BG palette 5: Room level graphics
; BG palette 7: ???
    LDX.W #$0068                                                         ;A9D025;
    LDA.W #$000C                                                         ;A9D028;
    JSL.L WriteAColorsFromYtoColorIndexX                                 ;A9D02B;
    PHY                                                                  ;A9D02F;
    LDX.W #$00A6                                                         ;A9D030;
    LDA.W #$000C                                                         ;A9D033;
    JSL.L WriteAColorsFromYtoColorIndexX                                 ;A9D036;
    PLY                                                                  ;A9D03A;
    LDX.W #$00E6                                                         ;A9D03B;
    LDA.W #$000C                                                         ;A9D03E;
    JSL.L WriteAColorsFromYtoColorIndexX                                 ;A9D041;
    RTS                                                                  ;A9D045;


;;; $D046: Room palette instruction list - first phase ended ;;;
InstList_RoomPalette_FirstPhaseEnded:
    dw $0002,RoomPalettes_Phase1Ended_0                                  ;A9D046;
    dw $0002,RoomPalettes_Phase1Ended_1                                  ;A9D04A;
    dw $0002,RoomPalettes_Phase1Ended_2                                  ;A9D04E;
    dw $0002,RoomPalettes_Phase1Ended_3                                  ;A9D052;
    dw $0002,RoomPalettes_Phase1Ended_0                                  ;A9D056;
    dw $0002,RoomPalettes_Phase1Ended_1                                  ;A9D05A;
    dw $0002,RoomPalettes_Phase1Ended_0                                  ;A9D05E;
    dw $0002,RoomPalettes_Phase1Ended_3                                  ;A9D062;
    dw $0002,RoomPalettes_Phase1Ended_1                                  ;A9D066;
    dw $0002,RoomPalettes_Phase1Ended_0                                  ;A9D06A;
    dw $0002,RoomPalettes_Phase1Ended_3                                  ;A9D06E;
    dw $0002,RoomPalettes_Phase1Ended_2                                  ;A9D072;
    dw $0002,RoomPalettes_Phase1Ended_0                                  ;A9D076;
    dw $0002,RoomPalettes_Phase1Ended_2                                  ;A9D07A;
    dw Instruction_MotherBrain_GotoX                                     ;A9D07E;
    dw InstList_RoomPalette_FirstPhaseEnded                              ;A9D080;


;;; $D082: Room palettes - first phase ended ;;;
; Line 0: Room background (BG1/2 palette 3 colours 4..Fh)
; Line 1: Room level graphics (BG1/2 palette 5/7 colours 3..Eh)
RoomPalettes_Phase1Ended_0:                                              ;A9D082;
    dw $4A16,$3991,$2D2C,$1CA7,$20E5,$18A4,$1083,$0841,$0000,$0000,$02DF,$0000
    dw $0802,$5294,$39CE,$2108,$1084,$0019,$0012,$5C00,$4000,$1084,$197F,$7FFF

RoomPalettes_Phase1Ended_1:                                              ;A9D0B2;
    dw $4EB9,$4656,$3E12,$31CF,$35EE,$2DCD,$29AC,$258B,$1D4A,$1D4A,$1F3F,$1D4A
    dw $254C,$3DEF,$2D6B,$18C6,$0C63,$0013,$000E,$4400,$3000,$0C63,$1517,$5EF7

RoomPalettes_Phase1Ended_2:                                              ;A9D0E2;
    dw $575C,$4F3A,$4B19,$46D7,$46F6,$46D6,$42D6,$3EB5,$3EB5,$3EB5,$3F9F,$3EB5
    dw $3EB5,$294A,$1CE7,$1084,$0842,$000D,$0009,$3000,$2000,$0842,$0CD0,$4210

RoomPalettes_Phase1Ended_3:                                              ;A9D112;
    dw $5BFF,$5BFF,$5BFF,$5BFF,$5BFF,$5BFF,$5BFF,$5BFF,$5BFF,$5BFF,$5BFF,$5BFF
    dw $5BFF,$14A5,$1084,$0842,$0421,$0006,$0005,$1800,$1000,$0421,$0868,$2108


;;; $D142: Unused. Set invalid room palette instruction list ;;;
UNSUED_SetInvalidRoomPaletteInstructionList_A9D142:
    LDA.W #MotherBrainPalettes_TransitionToGrey                          ;A9D142;
    STA.L MotherBrainBody.roomPaletteInstListPointer                     ;A9D145;
    LDA.W #$0001                                                         ;A9D149;
    STA.L MotherBrainBody.roomPaletteInstructionTimer                    ;A9D14C;
    RTS                                                                  ;A9D150;


;;; $D151: Unused. Set invalid room palette instruction list ;;;
UNSUED_SetInvalidRoomPaletteInstructionList_A9D151:
    LDA.W #MotherBrainPalettes_TransitionFromGrey                        ;A9D151;
    STA.L MotherBrainBody.roomPaletteInstListPointer                     ;A9D154;
    LDA.W #$0001                                                         ;A9D158;
    STA.L MotherBrainBody.roomPaletteInstructionTimer                    ;A9D15B;
    RTS                                                                  ;A9D15F;


if !FEATURE_KEEP_UNREFERENCED
;;; $D160: Unused. Handle Mother Brain's palette ;;;
UNUSED_HandleMotherBrainsPalette_A9D160:
    LDA.W #MotherBrainBody.roomPaletteInstListPointer                    ;A9D160;
    JSR.W HandleRoomPaletteInstList                                      ;A9D163;
    BCC .return                                                          ;A9D166;
    PHY                                                                  ;A9D168;
    LDX.W #$0082                                                         ;A9D169;
    LDA.W #$000D                                                         ;A9D16C;
    JSL.L WriteAColorsFromYtoColorIndexX                                 ;A9D16F;
    PLY                                                                  ;A9D173;
    LDX.W #$0122                                                         ;A9D174;
    LDA.W #$000D                                                         ;A9D177;
    JSL.L WriteAColorsFromYtoColorIndexX                                 ;A9D17A;
    LDX.W #$0168                                                         ;A9D17E;
    LDA.W #$0005                                                         ;A9D181;
    JSL.L WriteAColorsFromYtoColorIndexX                                 ;A9D184;
    LDX.W #$017C                                                         ;A9D188;
    LDA.W $0000,Y                                                        ;A9D18B;
    STA.W $0000,X                                                        ;A9D18E;

  .return:
    RTS                                                                  ;A9D191;
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $D192: Handle room palette instruction list ;;;
HandleRoomPaletteInstList:
;; Parameter:
;;     A: MotherBrainBody.roomPaletteInstListPointer. Mother Brain's room palette instruction list pointer
;; Returns:
;;     Carry: Set if palette data should be updated
;;     Y: If carry set. Pointer to room palette data. 18h bytes for background, 18h bytes for level graphics
    STA.B DP_Temp00                                                      ;A9D192;
    INC                                                                  ;A9D194;
    INC                                                                  ;A9D195;
    STA.B DP_Temp03                                                      ;A9D196;
    SEP #$20                                                             ;A9D198;
    LDA.B #$7E                                                           ;A9D19A;
    STA.B DP_Temp02                                                      ;A9D19C;
    STA.B DP_Temp05                                                      ;A9D19E;
    REP #$20                                                             ;A9D1A0;
    LDA.B [DP_Temp00]                                                    ;A9D1A2;
    BMI .pointer                                                         ;A9D1A4;
    CLC                                                                  ;A9D1A6;
    RTS                                                                  ;A9D1A7;

  .pointer:
    TAX                                                                  ;A9D1A8;
    LDA.W $0000,X                                                        ;A9D1A9;
    BMI .instruction                                                     ;A9D1AC;
    CMP.B [DP_Temp03]                                                    ;A9D1AE;
    BNE .tick                                                            ;A9D1B0;
    INX                                                                  ;A9D1B2;
    INX                                                                  ;A9D1B3;
    INX                                                                  ;A9D1B4;
    INX                                                                  ;A9D1B5;

  .loop:
    LDA.W $0000,X                                                        ;A9D1B6;
    BEQ .terminator                                                      ;A9D1B9;
    BPL .specialInstruction                                              ;A9D1BB;

  .instruction:
    STA.B DP_Temp06                                                      ;A9D1BD;
    INX                                                                  ;A9D1BF;
    INX                                                                  ;A9D1C0;
    PEA.W .loop-1                                                        ;A9D1C1;
    JMP.W (DP_Temp06)                                                    ;A9D1C4;

  .specialInstruction:
    LDA.W #$0001                                                         ;A9D1C7;
    STA.B [DP_Temp03]                                                    ;A9D1CA;
    TXA                                                                  ;A9D1CC;
    STA.B [DP_Temp00]                                                    ;A9D1CD;
    LDY.W $0002,X                                                        ;A9D1CF;
    SEC                                                                  ;A9D1D2;
    RTS                                                                  ;A9D1D3;

  .tick:
    LDA.B [DP_Temp03]                                                    ;A9D1D4;
    INC                                                                  ;A9D1D6;
    STA.B [DP_Temp03]                                                    ;A9D1D7;
    LDY.W $0002,X                                                        ;A9D1D9;
    SEC                                                                  ;A9D1DC;
    RTS                                                                  ;A9D1DD;

  .terminator:
    STA.B [DP_Temp00]                                                    ;A9D1DE;
    STA.B [DP_Temp03]                                                    ;A9D1E0;
    CLC                                                                  ;A9D1E2;
    RTS                                                                  ;A9D1E3;


;;; $D1E4: Handle Mother Brain's palette ;;;
HandleMotherBrainsPalette:
    LDA.L MotherBrainBody.enableBrainPaletteHandlingFlag                 ;A9D1E4;
    BEQ .disabled                                                        ;A9D1E8;
    JSR.W HandleMotherBrainHeadPalette                                   ;A9D1EA;

  .disabled:
    LDA.L MotherBrainBody.enableHealthBasedPaletteHandlingFlag           ;A9D1ED;
    BEQ .return                                                          ;A9D1F1;
    JSL.L MotherBrainHealthBasedPaletteHandling                          ;A9D1F3;

  .return:
    RTS                                                                  ;A9D1F7;


;;; $D1F8: Set up Mother Brain brain normal palette ;;;
SetupMotherBrainHeadNormalPalette:
; Mother Brain brain palette timer reset value = Ah
; Mother Brain brain palette set = 0
    LDA.W #$000A                                                         ;A9D1F8;
    STA.W MotherBrainBody.brainPaletteTimerResetValue                    ;A9D1FB;
    RTS                                                                  ;A9D1FE;


;;; $D1FF: Set up Mother Brain brain palette for charging her laser ;;;
SetupMotherBrainHeadPaletteForChargingHerLaser:
; Mother Brain brain palette timer reset value = 2
; Mother Brain brain palette set = 2
    LDA.W #$0202                                                         ;A9D1FF;
    STA.W MotherBrainBody.brainPaletteTimerResetValue                    ;A9D202;
    RTS                                                                  ;A9D205;


;;; $D206: Handle Mother Brain brain palette ;;;
HandleMotherBrainHeadPalette:
    LDA.L MotherBrainBody.form                                           ;A9D206;
    DEC                                                                  ;A9D20A;
    BEQ .return                                                          ;A9D20B;
    SEP #$20                                                             ;A9D20D;
    LDA.W MotherBrainBody.brainPaletteTimer                              ;A9D20F;
    BEQ .zero                                                            ;A9D212;
    DEC                                                                  ;A9D214;
    STA.W MotherBrainBody.brainPaletteTimer                              ;A9D215;

  .return:
    REP #$20                                                             ;A9D218;
    RTS                                                                  ;A9D21A;

  .zero:
    XBA                                                                  ;A9D21B;
    LDA.W MotherBrainBody.brainPaletteSet                                ;A9D21C;
    TAX                                                                  ;A9D21F;
    LDY.W .pointers,X                                                    ;A9D220;
    STY.B DP_Temp12                                                      ;A9D223;
    LDA.W MotherBrainBody.brainPaletteTimerResetValue                    ;A9D225;
    STA.W MotherBrainBody.brainPaletteTimer                              ;A9D228;
    LDA.W MotherBrainBody.brainPaletteCounter                            ;A9D22B;
    BNE .zeroCounter                                                     ;A9D22E;
    LDY.W MotherBrainBody.brainFunction                                  ;A9D230;
    CPY.W #Function_MotherBrain_SetupBrainAndNeckToBeDrawn               ;A9D233;
    BNE .return                                                          ;A9D236;

  .zeroCounter:
    INC                                                                  ;A9D238;
    AND.B #$07                                                           ;A9D239;
    STA.W MotherBrainBody.brainPaletteCounter                            ;A9D23B;
    REP #$20                                                             ;A9D23E;
    AND.W #$00FF                                                         ;A9D240;
    ASL                                                                  ;A9D243;
    ASL                                                                  ;A9D244;
    ASL                                                                  ;A9D245;
    ADC.B DP_Temp12                                                      ;A9D246;
    TAY                                                                  ;A9D248;
    LDX.W #$0122                                                         ;A9D249;
    LDA.L MotherBrainBody.brainPalleteIndex                              ;A9D24C;
    CMP.W #$0200                                                         ;A9D250;
    BEQ +                                                                ;A9D253;
    LDX.W #$01E2                                                         ;A9D255;

+   LDA.W #$0003                                                         ;A9D258;
    JSL.L WriteAColorsFromYtoColorIndexX                                 ;A9D25B;
    RTS                                                                  ;A9D25F;

  .pointers:
    dw .normalPaletteSet                                                 ;A9D260;
    dw .chargingLaserPaletteSet                                          ;A9D262;

  .normalPaletteSet:                                                     ;A9D264;
; Normal palette set
    dw $2EDF,$019B,$008E, $0006
    dw $269F,$0159,$004C, $0004
    dw $1E5D,$0117,$000A, $0002
    dw $161B,$00D5,$0008, $0000
    dw $161B,$00D5,$0008, $0000
    dw $1E5D,$0117,$000A, $0002
    dw $269F,$0159,$004C, $0004
    dw $2EDF,$019B,$008E, $0006

  .chargingLaserPaletteSet:                                              ;A9D2A4;
; Charging her laser palette set
    dw $269F,$0159,$004C, $0004
    dw $229F,$0179,$008E, $0067
    dw $1A9F,$01BA,$00F1, $00CB
    dw $16BF,$01FB,$0153, $012E
    dw $16BF,$01FB,$0153, $012E
    dw $1A9F,$01BA,$00F1, $00CB
    dw $229F,$0179,$008E, $0067
    dw $269F,$0159,$004C, $0004


;;; $D2E4: Write [A] colours from [DB]:[Y] to colour index [X] ;;;
WriteAColorsFromYtoColorIndexX:
    STA.B DP_Temp12                                                      ;A9D2E4;

  .loop:
    LDA.W $0000,Y                                                        ;A9D2E6;
    STA.L Palettes,X                                                     ;A9D2E9;
    INX                                                                  ;A9D2ED;
    INX                                                                  ;A9D2EE;
    INY                                                                  ;A9D2EF;
    INY                                                                  ;A9D2F0;
    DEC.B DP_Temp12                                                      ;A9D2F1;
    BNE .loop                                                            ;A9D2F3;
    RTL                                                                  ;A9D2F5;


;;; $D2F6: Write [A] colours from [DB]:[Y] to target colour index [X] ;;;
WriteAColorsFromYToTargetColorIndexX:
    STA.B DP_Temp12                                                      ;A9D2F6;

  .loop:
    LDA.W $0000,Y                                                        ;A9D2F8;
    STA.L TargetPalettes_BGP0,X                                          ;A9D2FB;
    INX                                                                  ;A9D2FF;
    INX                                                                  ;A9D300;
    INY                                                                  ;A9D301;
    INY                                                                  ;A9D302;
    DEC.B DP_Temp12                                                      ;A9D303;
    BNE .loop                                                            ;A9D305;
    RTL                                                                  ;A9D307;


;;; $D308: Initialisation AI - enemy $ED3F (torizo corpse) ;;;
InitAI_CorpseTorizo:
    PHB                                                                  ;A9D308;
    PEA.W $7E7E                                                          ;A9D309;
    PLB                                                                  ;A9D30C;
    PLB                                                                  ;A9D30D;
    LDA.W #$0000                                                         ;A9D30E;
    LDX.W #$0FFE                                                         ;A9D311;

  .loop:
    STA.W EnemyBG2Tilemap,X                                              ;A9D314;
    DEX                                                                  ;A9D317;
    DEX                                                                  ;A9D318;
    BPL .loop                                                            ;A9D319;
    PLB                                                                  ;A9D31B;
    LDA.W #Function_CorpseTorizo_WaitForSamusCollision                   ;A9D31C;
    STA.W CorpseTorizo.function                                          ;A9D31F;
    LDA.W Enemy.properties                                               ;A9D322;
    ORA.W #$A000                                                         ;A9D325;
    STA.W Enemy.properties                                               ;A9D328;
    LDA.W #InstList_CorpseTorizo                                         ;A9D32B;
    STA.W Enemy.instList                                                 ;A9D32E;
    LDA.W #$0001                                                         ;A9D331;
    STA.W Enemy.instTimer                                                ;A9D334;
    STZ.W Enemy.loopCounter                                              ;A9D337;
    LDA.W #$0200                                                         ;A9D33A;
    STA.W Enemy.palette                                                  ;A9D33D;
    STZ.W CorpseTorizo.XVelocity                                         ;A9D340;
    LDA.W #$0008                                                         ;A9D343;
    STA.W CorpseTorizo.YVelocity                                         ;A9D346;
    LDA.W #$0000                                                         ;A9D349;
    STA.L CorpseTorizo.preRotDelayTimer                                  ;A9D34C;
    LDA.W #$000F                                                         ;A9D350;
    STA.L CorpseTorizo.sandHeapYPixelRowToCopy                           ;A9D353;
    LDA.W #$0000                                                         ;A9D357;
    STA.L CorpseTorizo.sandHeapFormationTimer                            ;A9D35A;
    LDX.W #$0000                                                         ;A9D35E;
    LDY.W #CorpseRottingDefinitions_Torizo                               ;A9D361;
    JSR.W InitializeEnemyCorpseRotting                                   ;A9D364;
    RTL                                                                  ;A9D367;


;;; $D368: Main AI - enemy $ED3F (torizo corpse) ;;;
MainAI_CorpseTorizo:
    LDA.W Enemy.properties                                               ;A9D368;
    AND.W #$0400                                                         ;A9D36B;
    BNE .noCollision                                                     ;A9D36E;
    JSR.W CorpseTorizo_vs_Samus_CollisionDetection                       ;A9D370;
    BCC .noCollision                                                     ;A9D373;
    LDA.W Enemy.properties                                               ;A9D375;
    ORA.W #$0400                                                         ;A9D378;
    STA.W Enemy.properties                                               ;A9D37B;
    LDA.W #Function_CorpseTorizo_Rotting                                 ;A9D37E;
    STA.W CorpseTorizo.function                                          ;A9D381;

  .noCollision:
    LDA.W #EnemyGraphicsDrawnHook_CorpseTorizo>>8&$FF00                  ;A9D384;
    STA.W EnemyGraphicsDrawnHook+1                                       ;A9D387;
    LDA.W #EnemyGraphicsDrawnHook_CorpseTorizo                           ;A9D38A;
    STA.W EnemyGraphicsDrawnHook                                         ;A9D38D;
    LDX.W #$0000                                                         ;A9D390;
    JSR.W (CorpseTorizo.function,X)                                      ;A9D393;
    JSR.W ProcessCorpseTorizoRottingVRAMTransfers                        ;A9D396;
    RTL                                                                  ;A9D399;


;;; $D39A: Enemy graphics drawn hook - torizo corpse ;;;
EnemyGraphicsDrawnHook_CorpseTorizo:
    STZ.B DP_Temp16                                                      ;A9D39A;
    LDA.W #$0128                                                         ;A9D39C;
    STA.B DP_Temp12                                                      ;A9D39F;
    LDA.W #$00BB                                                         ;A9D3A1;
    STA.B DP_Temp14                                                      ;A9D3A4;
    LDY.W #Spritemaps_CorpseTorizo_SandHeap                              ;A9D3A6;
    JSR.W AddSpritemapToOAM_RoomCoordinates                              ;A9D3A9;
    RTL                                                                  ;A9D3AC;


;;; $D3AD: Torizo corpse function - wait for Samus collision ;;;
Function_CorpseTorizo_WaitForSamusCollision:
    CPX.W EnemyIndexSamusCollidesLeft                                    ;A9D3AD;
    BEQ .collision                                                       ;A9D3B0;
    CPX.W EnemyIndexSamusCollidesRight                                   ;A9D3B2;
    BEQ .collision                                                       ;A9D3B5;
    CPX.W EnemyIndexSamusCollidesUp                                      ;A9D3B7;
    BEQ .collision                                                       ;A9D3BA;
    CPX.W EnemyIndexSamusCollidesDown                                    ;A9D3BC;
    BNE .return                                                          ;A9D3BF;

  .collision:
    LDA.W #Function_CorpseTorizo_PreRotDelay                             ;A9D3C1;
    STA.W CorpseTorizo.function                                          ;A9D3C4;

  .return:
    RTS                                                                  ;A9D3C7;


;;; $D3C8: Torizo corpse function - pre-rot delay ;;;
Function_CorpseTorizo_PreRotDelay:
    LDA.L CorpseTorizo.preRotDelayTimer                                  ;A9D3C8;
    INC                                                                  ;A9D3CC;
    STA.L CorpseTorizo.preRotDelayTimer                                  ;A9D3CD;
    CMP.W #$0010                                                         ;A9D3D1;
    BCS .done                                                            ;A9D3D4;
    RTS                                                                  ;A9D3D6;

  .done:
    LDA.W Enemy.properties                                               ;A9D3D7;
    ORA.W #$0400                                                         ;A9D3DA;
    STA.W Enemy.properties                                               ;A9D3DD;
    LDA.W #Function_CorpseTorizo_Rotting                                 ;A9D3E0;
    STA.W CorpseTorizo.function                                          ;A9D3E3; fallthrough to Function_CorpseTorizo_Rotting


;;; $D3E6: Torizo corpse function - rotting ;;;
Function_CorpseTorizo_Rotting:
    LDA.L CorpseTorizo.sandHeapFormationTimer                            ;A9D3E6;
    INC                                                                  ;A9D3EA;
    STA.L CorpseTorizo.sandHeapFormationTimer                            ;A9D3EB;
    CMP.W #$000F                                                         ;A9D3EF;
    BCC .sandHeapFormed                                                  ;A9D3F2;
    LDA.W #$0000                                                         ;A9D3F4;
    STA.L CorpseTorizo.sandHeapFormationTimer                            ;A9D3F7;
    LDA.L CorpseTorizo.sandHeapYPixelRowToCopy                           ;A9D3FB;
    BEQ .sandHeapFormed                                                  ;A9D3FF;
    JSR.W CopyLineOfSandHeapTileData                                     ;A9D401;
    LDA.L CorpseTorizo.sandHeapYPixelRowToCopy                           ;A9D404;
    DEC                                                                  ;A9D408;
    STA.L CorpseTorizo.sandHeapYPixelRowToCopy                           ;A9D409;

  .sandHeapFormed:
    LDA.W CorpseTorizo.YVelocity                                         ;A9D40D;
    CLC                                                                  ;A9D410;
    ADC.W #$0001                                                         ;A9D411;
    STA.W CorpseTorizo.YVelocity                                         ;A9D414;
    LDX.W #$0000                                                         ;A9D417;
    JSL.L MoveEnemyAccordingToVelocity                                   ;A9D41A;
    JSR.W ProcessCorpseRotting                                           ;A9D41E;
    BCS .return                                                          ;A9D421;
    LDA.W #Function_CorpseTorizo_WaitForSamusCollision_return            ;A9D423;
    STA.W CorpseTorizo.function                                          ;A9D426;

  .return:
    RTS                                                                  ;A9D429;


;;; $D42A: Power bomb reaction - enemy $ED3F (torizo corpse) ;;;
PowerBombReaction_CorpseTorizo:
    LDA.W Enemy.properties                                               ;A9D42A;
    AND.W #$0400                                                         ;A9D42D;
    BEQ EnemyTouch_EnemyShot_CorpseTorizo                                ;A9D430;
    RTL                                                                  ;A9D432;


;;; $D433: Enemy touch / enemy shot - enemy $ED3F (torizo corpse) ;;;
EnemyTouch_EnemyShot_CorpseTorizo:
    LDA.W Enemy.properties                                               ;A9D433;
    ORA.W #$0400                                                         ;A9D436;
    STA.W Enemy.properties                                               ;A9D439;
    LDA.W #Function_CorpseTorizo_Rotting                                 ;A9D43C;
    STA.W CorpseTorizo.function                                          ;A9D43F;
    RTL                                                                  ;A9D442;


;;; $D443: Torizo corpse / Samus collision detection ;;;
CorpseTorizo_vs_Samus_CollisionDetection:
;; Returns:
;;     Carry: Set if collision, otherwise clear
    LDA.W Enemy.XPosition                                                ;A9D443;
    STA.B DP_Temp12                                                      ;A9D446;
    LDA.W Enemy.YPosition                                                ;A9D448;
    STA.B DP_Temp14                                                      ;A9D44B;
    LDX.W #HitboxDefinition_CorpseTorizo                                 ;A9D44D;
    LDA.W $0000,X                                                        ;A9D450;
    BEQ .returnNoCollision                                               ;A9D453;
    STA.B DP_Temp16                                                      ;A9D455;
    INX                                                                  ;A9D457;
    INX                                                                  ;A9D458;

  .loop:
    LDA.W SamusYPosition                                                 ;A9D459;
    SEC                                                                  ;A9D45C;
    SBC.B DP_Temp14                                                      ;A9D45D;
    BPL .SamusBelow                                                      ;A9D45F;
    EOR.W #$FFFF                                                         ;A9D461;
    INC                                                                  ;A9D464;
    STA.B DP_Temp18                                                      ;A9D465;
    LDA.W $0002,X                                                        ;A9D467;
    BRA .checkY                                                          ;A9D46A;

  .SamusBelow:
    STA.B DP_Temp18                                                      ;A9D46C;
    LDA.W $0006,X                                                        ;A9D46E;

  .checkY:
    BPL +                                                                ;A9D471;
    EOR.W #$FFFF                                                         ;A9D473;
    INC                                                                  ;A9D476;

+   CLC                                                                  ;A9D477;
    ADC.W SamusYRadius                                                   ;A9D478;
    SEC                                                                  ;A9D47B;
    SBC.B DP_Temp18                                                      ;A9D47C;
    BMI .next                                                            ;A9D47E;
    LDA.W SamusXPosition                                                 ;A9D480;
    SEC                                                                  ;A9D483;
    SBC.B DP_Temp12                                                      ;A9D484;
    BPL .SamusToTheRight                                                 ;A9D486;
    EOR.W #$FFFF                                                         ;A9D488;
    INC                                                                  ;A9D48B;
    STA.B DP_Temp18                                                      ;A9D48C;
    LDA.W $0000,X                                                        ;A9D48E;
    BRA .checkX                                                          ;A9D491;

  .SamusToTheRight:
    STA.B DP_Temp18                                                      ;A9D493;
    LDA.W $0004,X                                                        ;A9D495;

  .checkX:
    BPL +                                                                ;A9D498;
    EOR.W #$FFFF                                                         ;A9D49A;
    INC                                                                  ;A9D49D;

+   CLC                                                                  ;A9D49E;
    ADC.W SamusXRadius                                                   ;A9D49F;
    SEC                                                                  ;A9D4A2;
    SBC.B DP_Temp18                                                      ;A9D4A3;
    BPL .collision                                                       ;A9D4A5;

  .next:
    DEC.B DP_Temp16                                                      ;A9D4A7;
    BEQ .returnNoCollision                                               ;A9D4A9;
    TXA                                                                  ;A9D4AB;
    CLC                                                                  ;A9D4AC;
    ADC.W #$0008                                                         ;A9D4AD;
    TAX                                                                  ;A9D4B0;
    JMP.W .loop                                                          ;A9D4B1;

  .returnNoCollision:
    CLC                                                                  ;A9D4B4;
    RTS                                                                  ;A9D4B5;

  .collision:
    CMP.W #$0004                                                         ;A9D4B6;
    BPL .min4                                                            ;A9D4B9;
    LDA.W #$0004                                                         ;A9D4BB;

  .min4:
    STA.W ExtraSamusXDisplacement                                        ;A9D4BE;
    LDA.W #$0004                                                         ;A9D4C1;
    STA.W ExtraSamusYDisplacement                                        ;A9D4C4;
    STZ.W ExtraSamusXSubDisplacement                                     ;A9D4C7;
    STZ.W ExtraSamusYSubDisplacement                                     ;A9D4CA;
    SEC                                                                  ;A9D4CD;
    RTS                                                                  ;A9D4CE;


;;; $D4CF: Process torizo corpse corpse rotting VRAM transfers ;;;
ProcessCorpseTorizoRottingVRAMTransfers:
    LDA.L MotherBrainBody.form                                           ;A9D4CF;
    INC                                                                  ;A9D4D3;
    STA.L MotherBrainBody.form                                           ;A9D4D4;
    LSR                                                                  ;A9D4D8;
    BCS .odd                                                             ;A9D4D9;
    LDX.W #$0000                                                         ;A9D4DB;
    LDY.W VRAMWriteStack                                                 ;A9D4DE;
    LDA.W .size0,X                                                       ;A9D4E1;

  .loopEven:
    STA.W VRAMWrite.size,Y                                               ;A9D4E4; >.<
    LDA.W .bank0,X                                                       ;A9D4E7;
    STA.W VRAMWrite.src+1,Y                                              ;A9D4EA; >.<
    LDA.W .src0,X                                                        ;A9D4ED;
    STA.W VRAMWrite.src,Y                                                ;A9D4F0; >.<
    LDA.W .dest0,X                                                       ;A9D4F3;
    STA.W VRAMWrite.dest,Y                                               ;A9D4F6; >.<
    TYA                                                                  ;A9D4F9;
    CLC                                                                  ;A9D4FA;
    ADC.W #$0007                                                         ;A9D4FB;
    TAY                                                                  ;A9D4FE;
    TXA                                                                  ;A9D4FF;
    ADC.W #$0008                                                         ;A9D500;
    TAX                                                                  ;A9D503;
    LDA.W .size0,X                                                       ;A9D504;
    BNE .loopEven                                                        ;A9D507;
    STA.L MotherBrainBody.spriteTilesTransferEntryPointer                ;A9D509;
    TYA                                                                  ;A9D50D;
    STA.W VRAMWriteStack                                                 ;A9D50E;
    RTS                                                                  ;A9D511;

  .odd:
    LDX.W #$0000                                                         ;A9D512;
    LDY.W VRAMWriteStack                                                 ;A9D515;
    LDA.W .size1,X                                                       ;A9D518;

  .loopOdd:
    STA.W VRAMWrite.size,Y                                               ;A9D51B; >.<
    LDA.W .bank1,X                                                       ;A9D51E;
    STA.W VRAMWrite.src+1,Y                                              ;A9D521; >.<
    LDA.W .src1,X                                                        ;A9D524;
    STA.W VRAMWrite.src,Y                                                ;A9D527; >.<
    LDA.W .dest1,X                                                       ;A9D52A;
    STA.W VRAMWrite.dest,Y                                               ;A9D52D; >.<
    TYA                                                                  ;A9D530;
    CLC                                                                  ;A9D531;
    ADC.W #$0007                                                         ;A9D532;
    TAY                                                                  ;A9D535;
    TXA                                                                  ;A9D536;
    ADC.W #$0008                                                         ;A9D537;
    TAX                                                                  ;A9D53A;
    LDA.W .size1,X                                                       ;A9D53B;
    BNE .loopOdd                                                         ;A9D53E;
    STA.L MotherBrainBody.spriteTilesTransferEntryPointer                ;A9D540;
    TYA                                                                  ;A9D544;
    STA.W VRAMWriteStack                                                 ;A9D545;
    RTS                                                                  ;A9D548;

; Corpse rotting VRAM transfers
;                        __________________ Size
;                       |     _____________ Source bank * 100h
;                       |    |     ________ Source address
;                       |    |    |     ___ VRAM address
;                       |    |    |    |
  .size0:
    dw $00C0                                                             ;A9D549;
  .bank0:
    dw       $7E00                                                       ;A9D54B;
  .src0:
    dw             $2060                                                 ;A9D54D;
  .dest0:
    dw                   $7090                                           ;A9D54F;
    dw $00C0,$7E00,$21A0,$7190
    dw $0100,$7E00,$22C0,$7280
    dw $0100,$7E00,$2400,$7380
    dw $0100,$7E00,$2540,$7480
    dw $0100,$7E00,$2680,$7580
    dw $0120,$7E00,$9620,$7100
    dw $0000

  .size1:
    dw $0100                                                             ;A9D583;
  .bank1:
    dw       $7E00                                                       ;A9D585;
  .src1:
    dw             $27C0                                                 ;A9D587;
  .dest1:
    dw                   $7680                                           ;A9D589;
    dw $0100,$7E00,$2900,$7780
    dw $0100,$7E00,$2A40,$7880
    dw $0120,$7E00,$2B60,$7970
    dw $0140,$7E00,$2C80,$7A60
    dw $0140,$7E00,$2DC0,$7B60
    dw $0100,$7E00,$9500,$7000
    dw $0000


;;; $D5BD: Corpse rotting rot entry finished hook - torizo corpse ;;;
CorpseRottingRotEntryFinishedHook_CorpseTorizo:
    PHX                                                                  ;A9D5BD;
    LDA.W RandomNumberSeed                                               ;A9D5BE;
    AND.W #$001F                                                         ;A9D5C1;
    CLC                                                                  ;A9D5C4;
    ADC.W #$0110                                                         ;A9D5C5;
    STA.B DP_Temp12                                                      ;A9D5C8;
    LDA.W #$00BC                                                         ;A9D5CA;
    STA.B DP_Temp14                                                      ;A9D5CD;
    LDA.W #$000A                                                         ;A9D5CF;
    LDY.W #EnemyProjectile_MiscDust                                      ;A9D5D2;
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics                  ;A9D5D5;
    LDA.W NumberOfTimesMainEnemyRoutineExecuted                          ;A9D5D9;
    AND.W #$0007                                                         ;A9D5DC;
    BNE .return                                                          ;A9D5DF;
    LDA.W #$0010                                                         ;A9D5E1;
    JSL.L QueueSound_Lib2_Max6                                           ;A9D5E4;

  .return:
    PLX                                                                  ;A9D5E8;
    RTS                                                                  ;A9D5E9;


;;; $D5EA: Copy line of sand heap tile data ;;;
CopyLineOfSandHeapTileData:
;; Parameters:
;;     A: Y pixel row to copy

; Tile data calculations:
;     Tiles are 20h bytes
;     Each sand heap graphics row is 9 tiles = 120h bytes
;
;     Pixel (x, y) of tile at pointer p is:
;           ([p + y * 2]       >> 7 - x & 1)
;         | ([p + y * 2 + 1]   >> 7 - x & 1) << 1
;         | ([p + y * 2 + 10h] >> 7 - x & 1) << 2
;         | ([p + y * 2 + 11h] >> 7 - x & 1) << 3
;
;     Hence, pixel row y of tile at pointer p is the bytes
;         [p + y * 2], [p + y * 2 + 1], [p + y * 2 + 10h], [p + y * 2 + 11h]
    ASL                                                                  ;A9D5EA;
    PHA                                                                  ;A9D5EB;
    TAX                                                                  ;A9D5EC;
    LDA.W .destOffsets,X                                                 ;A9D5ED;
    TAY                                                                  ;A9D5F0;
    PLX                                                                  ;A9D5F1;
    LDA.W .srcOffsets,X                                                  ;A9D5F2;
    TAX                                                                  ;A9D5F5;
    PHB                                                                  ;A9D5F6;
    PEA.W $7E7E                                                          ;A9D5F7;
    PLB                                                                  ;A9D5FA;
    PLB                                                                  ;A9D5FB;
    LDA.L Tiles_CorpseTorizo,X                                           ;A9D5FC;
    STA.W TorizoCorpseRottingGFX,Y                                       ;A9D600;
    LDA.L Tiles_CorpseTorizo+$10,X                                       ;A9D603;
    STA.W TorizoCorpseRottingGFX+$10,Y                                   ;A9D607;
    LDA.L Tiles_CorpseTorizo+$20,X                                       ;A9D60A;
    STA.W TorizoCorpseRottingGFX+$20,Y                                   ;A9D60E;
    LDA.L Tiles_CorpseTorizo+$30,X                                       ;A9D611;
    STA.W TorizoCorpseRottingGFX+$30,Y                                   ;A9D615;
    LDA.L Tiles_CorpseTorizo+$40,X                                       ;A9D618;
    STA.W TorizoCorpseRottingGFX+$40,Y                                   ;A9D61C;
    LDA.L Tiles_CorpseTorizo+$50,X                                       ;A9D61F;
    STA.W TorizoCorpseRottingGFX+$50,Y                                   ;A9D623;
    LDA.L Tiles_CorpseTorizo+$60,X                                       ;A9D626;
    STA.W TorizoCorpseRottingGFX+$60,Y                                   ;A9D62A;
    LDA.L Tiles_CorpseTorizo+$70,X                                       ;A9D62D;
    STA.W TorizoCorpseRottingGFX+$70,Y                                   ;A9D631;
    LDA.L Tiles_CorpseTorizo+$80,X                                       ;A9D634;
    STA.W TorizoCorpseRottingGFX+$80,Y                                   ;A9D638;
    LDA.L Tiles_CorpseTorizo+$90,X                                       ;A9D63B;
    STA.W TorizoCorpseRottingGFX+$90,Y                                   ;A9D63F;
    LDA.L Tiles_CorpseTorizo+$A0,X                                       ;A9D642;
    STA.W TorizoCorpseRottingGFX+$A0,Y                                   ;A9D646;
    LDA.L Tiles_CorpseTorizo+$B0,X                                       ;A9D649;
    STA.W TorizoCorpseRottingGFX+$B0,Y                                   ;A9D64D;
    LDA.L Tiles_CorpseTorizo+$C0,X                                       ;A9D650;
    STA.W TorizoCorpseRottingGFX+$C0,Y                                   ;A9D654;
    LDA.L Tiles_CorpseTorizo+$D0,X                                       ;A9D657;
    STA.W TorizoCorpseRottingGFX+$D0,Y                                   ;A9D65B;
    LDA.L Tiles_CorpseTorizo+$E0,X                                       ;A9D65E;
    STA.W TorizoCorpseRottingGFX+$E0,Y                                   ;A9D662;
    LDA.L Tiles_CorpseTorizo+$F0,X                                       ;A9D665;
    STA.W TorizoCorpseRottingGFX+$F0,Y                                   ;A9D669;
    LDA.L Tiles_CorpseTorizo+$100,X                                      ;A9D66C;
    STA.W TorizoCorpseRottingGFX+$100,Y                                  ;A9D670;
    LDA.L Tiles_CorpseTorizo+$110,X                                      ;A9D673;
    STA.W TorizoCorpseRottingGFX+$110,Y                                  ;A9D677;
    PLB                                                                  ;A9D67A;
    RTS                                                                  ;A9D67B;

  .destOffsets:
    dw $0000,$0002,$0004,$0006,$0008,$000A,$000C,$000E                   ;A9D67C;
    dw $0120,$0122,$0124,$0126,$0128,$012A,$012C,$012E                   ;A9D68C;

  .srcOffsets:
    dw $0000,$0002,$0004,$0006,$0008,$000A,$000C,$000E                   ;A9D69C;
    dw $0200,$0202,$0204,$0206,$0208,$020A,$020C,$020E                   ;A9D6AC;


;;; $D6BC: Palette - enemy $ED3F (torizo corpse) ;;;
Palette_CorpseTorizo:
    dw $3800,$4F38,$3A52,$0CA5,$0042,$42D5,$2DEF,$218B                   ;A9D6BC;
    dw $1528,$4F38,$42B4,$3631,$29CD,$1949,$0CC6,$0042                   ;A9D6CC;


;;; $D6DC: Instruction list - torizo corpse ;;;
InstList_CorpseTorizo:
    dw $0001,Spritemaps_CorpseTorizo                                     ;A9D6DC;
    dw Common_Instruction_Sleep                                          ;A9D6E0;


;;; $D6E2: Torizo corpse spritemaps ;;;
Spritemaps_CorpseTorizo:
    dw $0019                                                             ;A9D6E2;
    %spritemapEntry(0, $1E8, $14, 0, 0, 2, 1, $197)
    %spritemapEntry(1, $4218, $CC, 0, 0, 2, 1, $10D)
    %spritemapEntry(1, $4208, $CC, 0, 0, 2, 1, $10B)
    %spritemapEntry(1, $43F8, $CC, 0, 0, 2, 1, $109)
    %spritemapEntry(1, $4220, $DC, 0, 0, 2, 1, $12E)
    %spritemapEntry(1, $4210, $DC, 0, 0, 2, 1, $12C)
    %spritemapEntry(1, $4200, $DC, 0, 0, 2, 1, $12A)
    %spritemapEntry(1, $43F0, $DC, 0, 0, 2, 1, $128)
    %spritemapEntry(1, $4220, $EC, 0, 0, 2, 1, $14E)
    %spritemapEntry(1, $4210, $EC, 0, 0, 2, 1, $14C)
    %spritemapEntry(1, $4200, $EC, 0, 0, 2, 1, $14A)
    %spritemapEntry(1, $43F0, $EC, 0, 0, 2, 1, $148)
    %spritemapEntry(1, $4220, $FC, 0, 0, 2, 1, $16E)
    %spritemapEntry(1, $4210, $FC, 0, 0, 2, 1, $16C)
    %spritemapEntry(1, $4200, $FC, 0, 0, 2, 1, $16A)
    %spritemapEntry(1, $43F0, $FC, 0, 0, 2, 1, $168)
    %spritemapEntry(1, $4220, $0C, 0, 0, 2, 1, $18E)
    %spritemapEntry(1, $4210, $0C, 0, 0, 2, 1, $18C)
    %spritemapEntry(1, $4200, $0C, 0, 0, 2, 1, $18A)
    %spritemapEntry(1, $43F0, $0C, 0, 0, 2, 1, $188)
    %spritemapEntry(1, $4220, $1C, 0, 0, 2, 1, $1AE)
    %spritemapEntry(1, $4210, $1C, 0, 0, 2, 1, $1AC)
    %spritemapEntry(1, $4200, $1C, 0, 0, 2, 1, $1AA)
    %spritemapEntry(1, $43F0, $1C, 0, 0, 2, 1, $1A8)
    %spritemapEntry(1, $43E0, $1C, 0, 0, 2, 1, $1A6)

Spritemaps_CorpseTorizo_SandHeap:
    dw $0005                                                             ;A9D761;
    %spritemapEntry(0, $18, $FE, 0, 0, 2, 1, $118)
    %spritemapEntry(1, $4208, $F6, 0, 0, 2, 1, $106)
    %spritemapEntry(1, $43F8, $F6, 0, 0, 2, 1, $104)
    %spritemapEntry(1, $43E8, $F6, 0, 0, 2, 1, $102)
    %spritemapEntry(1, $43D8, $F6, 0, 0, 2, 1, $100)


;;; $D77C: Torizo corpse hitbox definition ;;;
HitboxDefinition_CorpseTorizo:
; [word] Number of entries
; [entries]
;
; Entry format:
;     [word] Left offset
;     [word] Top offset
;     [word] Right offset
;     [word] Bottom offset
    dw $0007                                                             ;A9D77C;
    dw $FFE1,$0025,$FFF5,$002B
    dw $0010,$0025,$0026,$002B
    dw $FFE8,$0012,$FFF3,$0024
    dw $000B,$001A,$0019,$0024
    dw $FFF6,$FFE2,$0010,$0018
    dw $FFF9,$FFD4,$0022,$FFE1
    dw $0011,$FFE1,$0028,$FFF9


;;; $D7B6: Initialisation AI - enemy $ED7F/$EDBF (sidehopper corpse) ;;;
InitAI_CorpseSidehopper:
    LDX.W EnemyIndex                                                     ;A9D7B6;
    LDA.W Enemy.init0,X                                                  ;A9D7B9;
    TAX                                                                  ;A9D7BC;
    JMP.W (.pointers,X)                                                  ;A9D7BD;

  .pointers:
    dw CorpseSidehopperInit_Param1_0_InitiallyAlive                      ;A9D7C0;
    dw CorpseSidehopperInit_Param1_2_InitiallyDead                       ;A9D7C2;


;;; $D7C4: Sidehopper corpse initialisation - enemy parameter 1 = 0 (initially alive) ;;;
CorpseSidehopperInit_Param1_0_InitiallyAlive:
; Palette 1 is loaded by Shitroid from Palette_CorpseSidehopper
    LDX.W EnemyIndex                                                     ;A9D7C4;
    LDA.W Enemy.properties,X                                             ;A9D7C7;
    AND.W #$7FFF                                                         ;A9D7CA;
    ORA.W #$0800                                                         ;A9D7CD;
    STA.W Enemy.properties,X                                             ;A9D7D0;
    LDA.W Enemy.properties                                               ;A9D7D3;
    AND.W #$0100                                                         ;A9D7D6;
    BEQ .visible                                                         ;A9D7D9;
    LDA.W Enemy.properties,X                                             ;A9D7DB;
    ORA.W #$0200                                                         ;A9D7DE;
    STA.W Enemy.properties,X                                             ;A9D7E1;

  .visible:
    LDA.W #$0000                                                         ;A9D7E4;
    STA.L CorpseSidehopper.drainedPaletteIndex,X                         ;A9D7E7;
    LDA.W #$0060                                                         ;A9D7EB;
    STA.L CorpseSidehopper.XVelocity,X                                   ;A9D7EE;
    LDA.W #$0100                                                         ;A9D7F2;
    STA.L CorpseSidehopper.YVelocity,X                                   ;A9D7F5;
    LDA.W #$01E8                                                         ;A9D7F9;
    STA.W Enemy.XPosition,X                                              ;A9D7FC;
    LDA.W #$00B8                                                         ;A9D7FF;
    STA.W Enemy.YPosition,X                                              ;A9D802;
    LDA.W #Function_CorpseSidehopper_Alive_WaitingForActivation          ;A9D805;
    STA.W CorpseSidehopper.function,X                                    ;A9D808;
    LDA.W #$0200                                                         ;A9D80B;
    STA.W Enemy.palette,X                                                ;A9D80E;
    LDA.W #$0015                                                         ;A9D811;
    STA.W Enemy.YHitboxRadius,X                                          ;A9D814;
    LDA.W #InstList_CorpseSidehopper_Alive_Idle                          ;A9D817;
    JSL.L SetEnemyInstList                                               ;A9D81A;
    LDY.W #CorpseRottingDefinitions_Sidehopper_Param1_0                  ;A9D81E;
    JSR.W InitializeEnemyCorpseRotting                                   ;A9D821;
    RTL                                                                  ;A9D824;


;;; $D825: Sidehopper corpse initialisation - enemy parameter 1 = 2 (initially dead) ;;;
CorpseSidehopperInit_Param1_2_InitiallyDead:
; Palette 7 is loaded by Shitroid from Palette_CorpseCommon
    LDX.W EnemyIndex                                                     ;A9D825;
    LDA.W #$FFFF                                                         ;A9D828;
    STA.L CorpseSidehopper.drainedPaletteIndex,X                         ;A9D82B;
    LDA.W #Function_CorpseSidehopper_Dead_WaitForSamusCollision          ;A9D82F;
    STA.W CorpseSidehopper.function,X                                    ;A9D832;
    LDA.W #$0E00                                                         ;A9D835;
    STA.W Enemy.palette,X                                                ;A9D838;
    LDA.W #InstList_CorpseSidehopper_Alive_Dead                          ;A9D83B;
    JSL.L SetEnemyInstList                                               ;A9D83E;
    LDY.W #CorpseRottingDefinitions_Sidehopper_Param1_2                  ;A9D842;
    JSR.W InitializeEnemyCorpseRotting                                   ;A9D845;
    RTL                                                                  ;A9D848;


;;; $D849: Initialisation AI - enemy $EDFF (zoomer corpse) ;;;
InitAI_CorpseZoomer:
    LDX.W EnemyIndex                                                     ;A9D849;
    LDA.W #$0E00                                                         ;A9D84C;
    STA.W Enemy.palette,X                                                ;A9D84F;
    LDA.W #Function_CorpseZoomer_WaitForSamusCollision                   ;A9D852;
    STA.W Corpse.function,X                                              ;A9D855;
    LDY.W Enemy.init0,X                                                  ;A9D858;
    LDA.W .instListPointers,Y                                            ;A9D85B;
    JSL.L SetEnemyInstList                                               ;A9D85E;
    LDA.W .corpseRottingDefinitionPointers,Y                             ;A9D862;
    TAY                                                                  ;A9D865;
    JSR.W InitializeEnemyCorpseRotting                                   ;A9D866;
    RTL                                                                  ;A9D869;

  .instListPointers:
; Enemy instruction list pointers
    dw InstList_CorpseZoomer_Param1_0                                    ;A9D86A;
    dw InstList_CorpseZoomer_Param1_2                                    ;A9D86C;
    dw InstList_CorpseZoomer_Param1_4                                    ;A9D86E;

  .corpseRottingDefinitionPointers:
; Corpse rotting definition pointers
    dw CorpseRottingDefinitions_Zoomer_Param1_0                          ;A9D870;
    dw CorpseRottingDefinitions_Zoomer_Param1_2                          ;A9D872;
    dw CorpseRottingDefinitions_Zoomer_Param1_4                          ;A9D874;


;;; $D876: Initialisation AI - enemy $EE3F (ripper corpse) ;;;
InitAI_CorpseRipper:
    LDX.W EnemyIndex                                                     ;A9D876;
    LDA.W #$0E00                                                         ;A9D879;
    STA.W Enemy.palette,X                                                ;A9D87C;
    LDA.W #Function_CorpseRipper_WaitForSamusCollision                   ;A9D87F;
    STA.W Corpse.function,X                                              ;A9D882;
    LDY.W Enemy.init0,X                                                  ;A9D885;
    LDA.W .instListPointers,Y                                            ;A9D888;
    JSL.L SetEnemyInstList                                               ;A9D88B;
    LDA.W .corpseRottingDefinitionPointers,Y                             ;A9D88F;
    TAY                                                                  ;A9D892;
    JSR.W InitializeEnemyCorpseRotting                                   ;A9D893;
    RTL                                                                  ;A9D896;

  .instListPointers:
; Enemy instruction list pointers
    dw InstList_CorpseRipper_Param1_0                                    ;A9D897;
    dw InstList_CorpseRipper_Param1_2                                    ;A9D899;

  .corpseRottingDefinitionPointers:
; Corpse rotting definition pointers
    dw CorpseRottingDefinitions_Ripper_Param1_0                          ;A9D89B;
    dw CorpseRottingDefinitions_Ripper_Param1_2                          ;A9D89D;


;;; $D89F: Initialisation AI - enemy $EE7F (skree corpse) ;;;
InitAI_CorpseSkree:
    LDX.W EnemyIndex                                                     ;A9D89F;
    LDA.W #$0E00                                                         ;A9D8A2;
    STA.W Enemy.palette,X                                                ;A9D8A5;
    LDA.W #Function_CorpseSkree_WaitForSamusCollision                    ;A9D8A8;
    STA.W Corpse.function,X                                              ;A9D8AB;
    LDY.W Enemy.init0,X                                                  ;A9D8AE;
    LDA.W .instListPointers,Y                                            ;A9D8B1;
    JSL.L SetEnemyInstList                                               ;A9D8B4;
    LDA.W .corpseRottingDefinitionPointers,Y                             ;A9D8B8;
    TAY                                                                  ;A9D8BB;
    JSR.W InitializeEnemyCorpseRotting                                   ;A9D8BC;
    RTL                                                                  ;A9D8BF;

  .instListPointers:
; Enemy instruction list pointers
    dw InstList_CorpseSkree_Param1_0                                     ;A9D8C0;
    dw InstList_CorpseSkree_Param1_2                                     ;A9D8C2;
    dw InstList_CorpseSkree_Param1_4                                     ;A9D8C4;

  .corpseRottingDefinitionPointers:
; Corpse rotting definition pointers
    dw CorpseRottingDefinitions_Skree_Param1_0                           ;A9D8C6;
    dw CorpseRottingDefinitions_Skree_Param1_2                           ;A9D8C8;
    dw CorpseRottingDefinitions_Skree_Param1_4                           ;A9D8CA;


;;; $D8CC: Power bomb reaction - enemy $ED7F (sidehopper corpse) ;;;
PowerBombReaction_CorpseSidehopper:
    LDX.W EnemyIndex                                                     ;A9D8CC;
    LDA.L CorpseSidehopper.drainedPaletteIndex,X                         ;A9D8CF;
    CMP.W #$0008                                                         ;A9D8D3;
    BCC MainAI_HurtAI_CorpseEnemies                                      ;A9D8D6;
    JMP.W EnemyShot_CorpseSidehopper                                     ;A9D8D8;


;;; $D8DB: Main AI / hurt AI - enemy $ED7F/$EDBF/$EDFF/$EE3F/$EE7F (dead monsters) ;;;
MainAI_HurtAI_CorpseEnemies:
    LDX.W EnemyIndex                                                     ;A9D8DB;
    JSR.W (Corpse.function,X)                                            ;A9D8DE;
    RTL                                                                  ;A9D8E1;


;;; $D8E2: Sidehopper corpse function - alive - waiting for activation ;;;
Function_CorpseSidehopper_Alive_WaitingForActivation:
    LDA.W Layer1XPosition                                                ;A9D8E2;
    CMP.W #$0201                                                         ;A9D8E5;
    BMI .activate                                                        ;A9D8E8;
    RTS                                                                  ;A9D8EA;

  .activate:
    LDA.W #Function_CorpseSidehopper_Hopping                             ;A9D8EB;
    STA.W CorpseSidehopper.function,X                                    ;A9D8EE; fallthrough to Function_CorpseSidehopper_Hopping


;;; $D8F1: Sidehopper corpse function - hopping ;;;
Function_CorpseSidehopper_Hopping:
    JSR.W CorpseSidehopperMovement                                       ;A9D8F1;
    BCC .return                                                          ;A9D8F4;
    LDA.L CorpseSidehopper.hopIndex,X                                    ;A9D8F6;
    INC                                                                  ;A9D8FA;
    AND.W #$0003                                                         ;A9D8FB;
    STA.L CorpseSidehopper.hopIndex,X                                    ;A9D8FE;
    LDA.W #InstList_CorpseSidehopper_Alive_Hopping                       ;A9D902;
    JSL.L SetEnemyInstList                                               ;A9D905;
    LDA.W #.return                                                       ;A9D909;
    STA.W CorpseSidehopper.function,X                                    ;A9D90C;

  .return:
    RTS                                                                  ;A9D90F;


;;; $D910: Sidehopper corpse function - start idling ;;;
Function_CorpseSidehopper_StartIdling:
    LDA.W #Function_CorpseSidehopper_Idling                              ;A9D910;
    STA.W CorpseSidehopper.function,X                                    ;A9D913;
    LDA.W #$0040                                                         ;A9D916;
    STA.W CorpseSidehopper.functionTimer,X                               ;A9D919;
    RTS                                                                  ;A9D91C;


;;; $D91D: Sidehopper corpse function - idling ;;;
Function_CorpseSidehopper_Idling:
    DEC.W CorpseSidehopper.functionTimer,X                               ;A9D91D;
    BPL .return                                                          ;A9D920;
    LDA.L CorpseSidehopper.drainedPaletteIndex,X                         ;A9D922;
    BEQ .notDone                                                         ;A9D926;
    LDA.W #Function_CorpseSidehopper_BeingDrained                        ;A9D928;
    STA.W CorpseSidehopper.function,X                                    ;A9D92B;
    RTS                                                                  ;A9D92E;

  .notDone:
    LDA.W #Function_CorpseSidehopper_Hopping                             ;A9D92F;
    STA.W CorpseSidehopper.function,X                                    ;A9D932;
    LDA.W #InstList_CorpseSidehopper_Alive_Idle                          ;A9D935;
    JSL.L SetEnemyInstList                                               ;A9D938;
    LDA.L CorpseSidehopper.hopIndex,X                                    ;A9D93C;
    ASL                                                                  ;A9D940;
    TAY                                                                  ;A9D941;
    LDA.W .YVelocity,Y                                                   ;A9D942;
    STA.L CorpseSidehopper.YVelocity,X                                   ;A9D945;
    LDA.W .XVelocity,Y                                                   ;A9D949;
    STA.L CorpseSidehopper.XVelocity,X                                   ;A9D94C;

  .return:
    RTS                                                                  ;A9D950;

; Hop initial velocities
  .YVelocity:
    dw $FE00,$FE00,$FE00,$FC00                                           ;A9D951;
  .XVelocity:
    dw $01C0,$0120,$0120,$0300                                           ;A9D959;


;;; $D961: Sidehopper corpse movement ;;;
CorpseSidehopperMovement:
;; Returns:
;;     Carry: Set if collision, clear otherwise
    LDA.L CorpseSidehopper.XVelocity,X                                   ;A9D961;
    JSR.W CorpseSidehopperMovement_Horizontal                            ;A9D965;
    LDY.W #$0020                                                         ;A9D968;
    LDA.L CorpseSidehopper.YVelocity,X                                   ;A9D96B;
    BMI .rising                                                          ;A9D96F;
    LDY.W #$0080                                                         ;A9D971;

  .rising:
    TYA                                                                  ;A9D974;
    CLC                                                                  ;A9D975;
    ADC.L CorpseSidehopper.YVelocity,X                                   ;A9D976;
    STA.L CorpseSidehopper.YVelocity,X                                   ;A9D97A;
    STA.B DP_Temp12                                                      ;A9D97E;
    LDA.W Enemy.XPosition,X                                              ;A9D980;
    CMP.W #$0220                                                         ;A9D983;
    BMI .lessThan220                                                     ;A9D986;
    LDA.B DP_Temp12                                                      ;A9D988;
    SEP #$20                                                             ;A9D98A;
    STA.B DP_Temp13                                                      ;A9D98C;
    STZ.B DP_Temp12                                                      ;A9D98E;
    REP #$20                                                             ;A9D990;
    AND.W #$FF00                                                         ;A9D992;
    BPL +                                                                ;A9D995;
    ORA.W #$00FF                                                         ;A9D997;

+   XBA                                                                  ;A9D99A;
    STA.B DP_Temp14                                                      ;A9D99B;
    JSL.L MoveEnemyDownBy_14_12                                          ;A9D99D;
    RTS                                                                  ;A9D9A1;

  .lessThan220:
    LDA.B DP_Temp12                                                      ;A9D9A2;
    SEP #$20                                                             ;A9D9A4;
    CLC                                                                  ;A9D9A6;
    ADC.W Enemy.YSubPosition+1,X                                         ;A9D9A7;
    STA.W Enemy.YSubPosition+1,X                                         ;A9D9AA;
    REP #$20                                                             ;A9D9AD;
    AND.W #$FF00                                                         ;A9D9AF;
    XBA                                                                  ;A9D9B2;
    BPL +                                                                ;A9D9B3;
    ORA.W #$FF00                                                         ;A9D9B5;

+   ADC.W Enemy.YPosition,X                                              ;A9D9B8;
    STA.W Enemy.YPosition,X                                              ;A9D9BB;
    CMP.W #$00B8                                                         ;A9D9BE;
    BMI .lessThanB8                                                      ;A9D9C1;
    SEC                                                                  ;A9D9C3;
    RTS                                                                  ;A9D9C4;

  .lessThanB8:
    CLC                                                                  ;A9D9C5;
    RTS                                                                  ;A9D9C6;


;;; $D9C7: Sidehopper corpse horizontal movement ;;;
CorpseSidehopperMovement_Horizontal:
;; Parameters:
;;     A: Distance to move (signed)
    STA.B DP_Temp12                                                      ;A9D9C7;
    LDA.W Enemy.XPosition,X                                              ;A9D9C9;
    CMP.W #$0220                                                         ;A9D9CC;
    BMI .lessThan220                                                     ;A9D9CF;
    LDA.B DP_Temp12                                                      ;A9D9D1;
    SEP #$20                                                             ;A9D9D3;
    STA.B DP_Temp13                                                      ;A9D9D5;
    STZ.B DP_Temp12                                                      ;A9D9D7;
    REP #$20                                                             ;A9D9D9;
    AND.W #$FF00                                                         ;A9D9DB;
    BPL +                                                                ;A9D9DE;
    ORA.W #$00FF                                                         ;A9D9E0;

+   XBA                                                                  ;A9D9E3;
    STA.B DP_Temp14                                                      ;A9D9E4;
    JSL.L MoveEnemyRightBy_14_12_IgnoreSlopes                            ;A9D9E6;
    RTS                                                                  ;A9D9EA;

  .lessThan220:
    LDA.B DP_Temp12                                                      ;A9D9EB;
    SEP #$20                                                             ;A9D9ED;
    CLC                                                                  ;A9D9EF;
    ADC.W Enemy.XSubPosition+1,X                                         ;A9D9F0;
    STA.W Enemy.XSubPosition+1,X                                         ;A9D9F3;
    REP #$20                                                             ;A9D9F6;
    AND.W #$FF00                                                         ;A9D9F8;
    XBA                                                                  ;A9D9FB;
    BPL +                                                                ;A9D9FC;
    ORA.W #$FF00                                                         ;A9D9FE;

+   ADC.W Enemy.XPosition,X                                              ;A9DA01;
    STA.W Enemy.XPosition,X                                              ;A9DA04;
    RTS                                                                  ;A9DA07;


;;; $DA08: Sidehopper corpse function - being drained ;;;
Function_CorpseSidehopper_BeingDrained:
    LDA.L CorpseSidehopper.drainedPaletteTimer,X                         ;A9DA08;
    INC                                                                  ;A9DA0C;
    STA.L CorpseSidehopper.drainedPaletteTimer,X                         ;A9DA0D;
    CMP.W #$0008                                                         ;A9DA11;
    BCC .return                                                          ;A9DA14;
    LDA.W #$0000                                                         ;A9DA16;
    STA.L CorpseSidehopper.drainedPaletteTimer,X                         ;A9DA19;
    LDA.L CorpseSidehopper.drainedPaletteIndex,X                         ;A9DA1D;
    DEC                                                                  ;A9DA21;
    ASL                                                                  ;A9DA22;
    ASL                                                                  ;A9DA23;
    ASL                                                                  ;A9DA24;
    ASL                                                                  ;A9DA25;
    ASL                                                                  ;A9DA26;
    ADC.W #Palette_SidehopperCorpseBeingDrained_0                        ;A9DA27;
    TAY                                                                  ;A9DA2A;
    LDX.W #$0122                                                         ;A9DA2B;
    LDA.W #$000F                                                         ;A9DA2E;
    JSL.L WriteAColorsFromYtoColorIndexX                                 ;A9DA31;
    LDX.W EnemyIndex                                                     ;A9DA35;
    LDA.L CorpseSidehopper.drainedPaletteIndex,X                         ;A9DA38;
    INC                                                                  ;A9DA3C;
    STA.L CorpseSidehopper.drainedPaletteIndex,X                         ;A9DA3D;
    CMP.W #$0008                                                         ;A9DA41;
    BCC .return                                                          ;A9DA44;
    LDA.W #InstList_CorpseSidehopper_Alive_Corpse                        ;A9DA46;
    JSL.L SetEnemyInstList                                               ;A9DA49;
    LDA.W #Function_CorpseSidehopper_Dead_WaitForSamusCollision          ;A9DA4D;
    STA.W CorpseSidehopper.function,X                                    ;A9DA50;
    LDA.W Enemy.properties,X                                             ;A9DA53;
    ORA.W #$8000                                                         ;A9DA56;
    STA.W Enemy.properties,X                                             ;A9DA59;
    LDA.W #$000C                                                         ;A9DA5C;
    STA.W Enemy.YHitboxRadius,X                                          ;A9DA5F;

  .return:
    RTS                                                                  ;A9DA62;


;;; $DA63: RTS ;;;
RTS_A9DA63:
    RTS                                                                  ;A9DA63;


;;; $DA64: Sidehopper corpse function - dead - wait for Samus collision ;;;
Function_CorpseSidehopper_Dead_WaitForSamusCollision:
    LDY.W #Function_CorpseSidehopper_PreRotDelay                         ;A9DA64;
    BRA CorpseCommonAI_WaitForSamusCollision                             ;A9DA67;


;;; $DA69: Zoomer corpse function - wait for Samus collision ;;;
Function_CorpseZoomer_WaitForSamusCollision:
    LDY.W #Function_CorpseZoomer_PreRotDelay                             ;A9DA69;
    BRA CorpseCommonAI_WaitForSamusCollision                             ;A9DA6C;


;;; $DA6E: Skree corpse function - wait for Samus collision ;;;
Function_CorpseSkree_WaitForSamusCollision:
    LDY.W #Function_CorpseSkree_PreRotDelay                              ;A9DA6E;
    BRA CorpseCommonAI_WaitForSamusCollision                             ;A9DA71;


;;; $DA73: Ripper corpse function - wait for Samus collision ;;;
Function_CorpseRipper_WaitForSamusCollision:
    LDY.W #Function_CorpseRipper_PreRotDelay                             ;A9DA73; fallthrough to CorpseCommonAI_WaitForSamusCollision


;;; $DA76: Dead monsters shared AI - wait for Samus collision ;;;
CorpseCommonAI_WaitForSamusCollision:
;; Parameters:
;;     Y: New enemy function if collision occurred
    CPX.W EnemyIndexSamusCollidesLeft                                    ;A9DA76;
    BEQ .collision                                                       ;A9DA79;
    CPX.W EnemyIndexSamusCollidesRight                                   ;A9DA7B;
    BEQ .collision                                                       ;A9DA7E;
    CPX.W EnemyIndexSamusCollidesUp                                      ;A9DA80;
    BEQ .collision                                                       ;A9DA83;
    CPX.W EnemyIndexSamusCollidesDown                                    ;A9DA85;
    BNE .return                                                          ;A9DA88;

  .collision:
    TYA                                                                  ;A9DA8A;
    STA.W Corpse.function,X                                              ;A9DA8B;

  .return:
    RTS                                                                  ;A9DA8E;


;;; $DA8F: Sidehopper corpse function - pre-rot delay ;;;
Function_CorpseSidehopper_PreRotDelay:
    LDY.W #Function_CorpseSidehopper_Rotting                             ;A9DA8F;
    BRA CorpseCommonAI_PreRotDelay                                       ;A9DA92;


;;; $DA94: Zoomer corpse function - pre-rot delay ;;;
Function_CorpseZoomer_PreRotDelay:
    LDY.W #Function_CorpseZoomer_Rotting                                 ;A9DA94;
    BRA CorpseCommonAI_PreRotDelay                                       ;A9DA97;


;;; $DA99: Ripper corpse function - pre-rot delay ;;;
Function_CorpseRipper_PreRotDelay:
    LDY.W #Function_CorpseRipper_Rotting                                 ;A9DA99;
    BRA CorpseCommonAI_PreRotDelay                                       ;A9DA9C;


;;; $DA9E: Skree corpse function - pre-rot delay ;;;
Function_CorpseSkree_PreRotDelay:
    LDY.W #Function_CorpseSkree_Rotting                                  ;A9DA9E; fallthrough to CorpseCommonAI_PreRotDelay


;;; $DAA1: Dead monsters shared AI - pre-rot delay ;;;
CorpseCommonAI_PreRotDelay:
;; Parameters:
;;     Y: Rotting enemy function
    INC.W Corpse.preRotDelayTimer,X                                      ;A9DAA1;
    LDA.W Corpse.preRotDelayTimer,X                                      ;A9DAA4;
    CMP.W #$0010                                                         ;A9DAA7;
    BCC .return                                                          ;A9DAAA;
    TYA                                                                  ;A9DAAC;
    STA.W Corpse.function,X                                              ;A9DAAD;
    LDA.W Enemy.properties,X                                             ;A9DAB0;
    ORA.W #$0400                                                         ;A9DAB3;
    STA.W Enemy.properties,X                                             ;A9DAB6;

  .return:
    RTS                                                                  ;A9DAB9;


;;; $DABA: Sidehopper corpse function - rotting ;;;
Function_CorpseSidehopper_Rotting:
; The LDA at $DAC2 looks like it was supposed to be for RTS_A9DA63, but since the sidehopper is intangible at this point, it doesn't really matter
    JSR.W ProcessCorpseRotting                                           ;A9DABA;
    LDX.W EnemyIndex                                                     ;A9DABD;
    BCS .process                                                         ;A9DAC0;
    LDA.W #Function_CorpseSidehopper_Dead_WaitForSamusCollision          ;A9DAC2;
    STA.W CorpseSidehopper.function,X                                    ;A9DAC5;

  .process:
    LDA.L Corpse.VRAMTransfersPointer,X                                  ;A9DAC8;
    TAX                                                                  ;A9DACC;
    JMP.W ProcessCorpseRottingVRAMTransfers                              ;A9DACD;


;;; $DAD0: Zoomer corpse function - rotting ;;;
Function_CorpseZoomer_Rotting:
    JSR.W ProcessCorpseRotting                                           ;A9DAD0;
    LDX.W EnemyIndex                                                     ;A9DAD3;
    BCS .process                                                         ;A9DAD6;
    LDA.W #RTS_A9DA63                                                    ;A9DAD8;
    STA.W Corpse.function,X                                              ;A9DADB;

  .process:
    LDA.L Corpse.VRAMTransfersPointer,X                                  ;A9DADE;
    TAX                                                                  ;A9DAE2;
    JMP.W ProcessCorpseRottingVRAMTransfers                              ;A9DAE3;


;;; $DAE6: Ripper corpse function - rotting ;;;
Function_CorpseRipper_Rotting:
    JSR.W ProcessCorpseRotting                                           ;A9DAE6;
    LDX.W EnemyIndex                                                     ;A9DAE9;
    BCS .process                                                         ;A9DAEC;
    LDA.W #RTS_A9DA63                                                    ;A9DAEE;
    STA.W Corpse.function,X                                              ;A9DAF1;

  .process:
    LDA.L Corpse.VRAMTransfersPointer,X                                  ;A9DAF4;
    TAX                                                                  ;A9DAF8;
    JMP.W ProcessCorpseRottingVRAMTransfers                              ;A9DAF9;


;;; $DAFC: Skree corpse function - rotting ;;;
Function_CorpseSkree_Rotting:
    JSR.W ProcessCorpseRotting                                           ;A9DAFC;
    LDX.W EnemyIndex                                                     ;A9DAFF;
    BCS .process                                                         ;A9DB02;
    LDA.W #RTS_A9DA63                                                    ;A9DB04;
    STA.W Corpse.function,X                                              ;A9DB07;

  .process:
    LDA.L Corpse.VRAMTransfersPointer,X                                  ;A9DB0A;
    TAX                                                                  ;A9DB0E;
    JMP.W ProcessCorpseRottingVRAMTransfers                              ;A9DB0F;


;;; $DB12: Process corpse rotting ;;;
ProcessCorpseRotting:
; n_entries = Corpse.backupSpriteHeight
; for (i_entry = 0; i_entry < n_entries; ++i_entry):
; {
;     p_entries = Corpse.rotTablePointer
;     y = [[p_entries]]
;     t = [[p_entries] + 2]
;
;     If y < 0:
;         next
;
;     If t != 0:
;     {
;         Decrement t
;         If t >= 4:
;             next
;     }
;
;     Corpse.rotEntryYOffset = y
;     y_tile = y / 8
;     y_pixel = y % 8
;
;     X = [$A9:0000 + Corpse.backupTileDataRowOffsetsPointer + y_tile * 2] + y_pixel * 2 (tile data offset of pixel row y)
;     If y_pixel < 6:
;         Y = [X]
;     Else:
;         Y = [X] + (tile row size - Ch) (tile data offset of pixel row y - 6 of next tile row)
;
;     If t != 0:
;     {
;         If i_entry < (height - 2):
;             Execute Corpse.backupRotEntryCopyFunction (copy pixel row down)
;         Else:
;             Execute Corpse.backupRotEntryMoveFunction (move pixel row down)
;     }
;     Else:
;     {
;         Execute Corpse.backupRotEntryMoveFunction (move pixel row down)
;         If y + 2 < (height - 1):
;             y += 2
;         Else:
;         {
;             Execute Corpse.backupRotEntryFinishedHook (rot entry finished hook)
;             If i_entry >= (height - 1):
;                 Return carry clear (finished rotting)
;
;             y = -1
;         }
;     }
; }
;
; Return carry set
    PHB                                                                  ;A9DB12;
    PEA.W $7E7E                                                          ;A9DB13;
    PLB                                                                  ;A9DB16;
    PLB                                                                  ;A9DB17;
    LDA.W Corpse.spriteHeight,X                                          ;A9DB18;
    STA.W Corpse.backupSpriteHeight                                      ;A9DB1B;
    LDA.W Corpse.spriteHeightMinus1,X                                    ;A9DB1E;
    STA.W Corpse.backupSpriteHeightMinus1                                ;A9DB21;
    LDA.W Corpse.spriteHeightMinus2,X                                    ;A9DB24;
    STA.W Corpse.backupSpriteHeightMinus2                                ;A9DB27;
    LDA.W Corpse.interTileDataOffset,X                                   ;A9DB2A;
    STA.W Corpse.backupInterTileDataOffset                               ;A9DB2D;
    LDA.W Corpse.rotEntryFinishedHook,X                                  ;A9DB30;
    STA.W Corpse.backupRotEntryFinishedHook                              ;A9DB33;
    LDA.W Corpse.tileDataRowOffsetsPointer,X                             ;A9DB36;
    STA.W Corpse.backupTileDataRowOffsetsPointer                         ;A9DB39;
    LDA.W Corpse.rotEntryCopyFunction,X                                  ;A9DB3C;
    STA.W Corpse.backupRotEntryCopyFunction                              ;A9DB3F;
    LDA.W Corpse.rotEntryMoveFunction,X                                  ;A9DB42;
    STA.W Corpse.backupRotEntryMoveFunction                              ;A9DB45;
    LDA.W Corpse.rotTablePointer,X                                       ;A9DB48;
    TAX                                                                  ;A9DB4B;
    LDA.W #$0000                                                         ;A9DB4C;

  .loop:
    PHA                                                                  ;A9DB4F;
    LDA.W $0000,X                                                        ;A9DB50;
    BMI .next                                                            ;A9DB53;
    LDA.W $0002,X                                                        ;A9DB55;
    BEQ .timerExpired                                                    ;A9DB58;
    DEC                                                                  ;A9DB5A;
    STA.W $0002,X                                                        ;A9DB5B;
    CMP.W #$0004                                                         ;A9DB5E;
    BCS .next                                                            ;A9DB61;
    LDA.W Corpse.backupRotEntryCopyFunction                              ;A9DB63;
    STA.B DP_Temp12                                                      ;A9DB66;
    LDA.B $01,S                                                          ;A9DB68;
    CMP.W Corpse.backupSpriteHeightMinus2                                ;A9DB6A;
    BCC +                                                                ;A9DB6D;
    LDA.W Corpse.backupRotEntryMoveFunction                              ;A9DB6F;
    STA.B DP_Temp12                                                      ;A9DB72;

+   LDA.W Corpse.backupTileDataRowOffsetsPointer                         ;A9DB74;
    STA.B DP_Temp14                                                      ;A9DB77;
    LDA.W #$00A9                                                         ;A9DB79;
    STA.B DP_Temp16                                                      ;A9DB7C;
    PHX                                                                  ;A9DB7E;
    LDA.W $0000,X                                                        ;A9DB7F;
    JSR.W CopyMoveCorpseRottingRotEntry                                  ;A9DB82;
    PLX                                                                  ;A9DB85;
    BRA .next                                                            ;A9DB86;

  .timerExpired:
    PHX                                                                  ;A9DB88;
    LDA.W Corpse.backupRotEntryMoveFunction                              ;A9DB89;
    STA.B DP_Temp12                                                      ;A9DB8C;
    LDA.W Corpse.backupTileDataRowOffsetsPointer                         ;A9DB8E;
    STA.B DP_Temp14                                                      ;A9DB91;
    LDA.W #$00A9                                                         ;A9DB93;
    STA.B DP_Temp16                                                      ;A9DB96;
    LDA.W $0000,X                                                        ;A9DB98;
    JSR.W CopyMoveCorpseRottingRotEntry                                  ;A9DB9B;
    PLX                                                                  ;A9DB9E;
    LDA.W $0000,X                                                        ;A9DB9F;
    CLC                                                                  ;A9DBA2;
    ADC.W #$0002                                                         ;A9DBA3;
    CMP.W Corpse.backupSpriteHeightMinus1                                ;A9DBA6;
    BCC .store                                                           ;A9DBA9;
    LDA.W Corpse.backupRotEntryFinishedHook                              ;A9DBAB;
    STA.B DP_Temp12                                                      ;A9DBAE;
    PHK                                                                  ;A9DBB0;
    PLB                                                                  ;A9DBB1;
    PEA.W .manualReturn-1                                                ;A9DBB2;
    JMP.W (DP_Temp12)                                                    ;A9DBB5;

  .manualReturn:
    PEA.W $7E7E                                                          ;A9DBB8;
    PLB                                                                  ;A9DBBB;
    PLB                                                                  ;A9DBBC;
    LDA.B $01,S                                                          ;A9DBBD;
    CMP.W Corpse.backupSpriteHeightMinus1                                ;A9DBBF;
    BCS .returnFinishedRotting                                           ;A9DBC2;
    LDA.W #$FFFF                                                         ;A9DBC4;

  .store:
    STA.W $0000,X                                                        ;A9DBC7;

  .next:
    TXA                                                                  ;A9DBCA;
    CLC                                                                  ;A9DBCB;
    ADC.W #$0004                                                         ;A9DBCC;
    TAX                                                                  ;A9DBCF;
    PLA                                                                  ;A9DBD0;
    INC                                                                  ;A9DBD1;
    CMP.W Corpse.backupSpriteHeight                                      ;A9DBD2;
    BPL .returnNotFinished                                               ;A9DBD5;
    JMP.W .loop                                                          ;A9DBD7;

  .returnNotFinished:
    PLB                                                                  ;A9DBDA;
    RTS                                                                  ;A9DBDB;

  .returnFinishedRotting:
    PLA                                                                  ;A9DBDC;
    PLB                                                                  ;A9DBDD;
    CLC                                                                  ;A9DBDE;
    RTS                                                                  ;A9DBDF;


;;; $DBE0: Copy/move corpse rotting rot entry ;;;
CopyMoveCorpseRottingRotEntry:
;; Parameters:
;;     A: Corpse rotting rot entry Y offset
;;     $12: Corpse rotting rot entry copy/move function
;;     $14: Corpse rotting tile data row offsets pointer

; DB must be $7E
    STA.W Corpse.rotEntryYOffset                                         ;A9DBE0;
    TAY                                                                  ;A9DBE3;
    AND.W #$FFF8                                                         ;A9DBE4;
    LSR                                                                  ;A9DBE7;
    LSR                                                                  ;A9DBE8;
    TAX                                                                  ;A9DBE9;
    TYA                                                                  ;A9DBEA;
    AND.W #$0007                                                         ;A9DBEB;
    CMP.W #$0006                                                         ;A9DBEE;
    BCS .greaterThan5                                                    ;A9DBF1;
    TXY                                                                  ;A9DBF3;
    ASL                                                                  ;A9DBF4;
    ADC.B [DP_Temp14],Y                                                  ;A9DBF5;
    TAX                                                                  ;A9DBF7;
    TAY                                                                  ;A9DBF8;
    JMP.W (DP_Temp12)                                                    ;A9DBF9;

  .greaterThan5:
    TXY                                                                  ;A9DBFC;
    ASL                                                                  ;A9DBFD;
    ADC.B [DP_Temp14],Y                                                  ;A9DBFE;
    TAX                                                                  ;A9DC00;
    ADC.W Corpse.backupInterTileDataOffset                               ;A9DC01;
    TAY                                                                  ;A9DC04;
    JMP.W (DP_Temp12)                                                    ;A9DC05;


;;; $DC08: Corpse rotting rot entry finished hook - normal ;;;
CorpseRotEntryFinishedHook_Normal:
    PHX                                                                  ;A9DC08;
    LDA.W RandomNumberSeed                                               ;A9DC09;
    AND.W #$001A                                                         ;A9DC0C;
    LDX.W EnemyIndex                                                     ;A9DC0F;
    CLC                                                                  ;A9DC12;
    ADC.W Enemy.XPosition,X                                              ;A9DC13;
    CLC                                                                  ;A9DC16;
    ADC.W #$FFF2                                                         ;A9DC17;
    STA.B DP_Temp12                                                      ;A9DC1A;
    LDA.W Enemy.YPosition,X                                              ;A9DC1C;
    CLC                                                                  ;A9DC1F;
    ADC.W #$0010                                                         ;A9DC20;
    STA.B DP_Temp14                                                      ;A9DC23;
    LDA.W #$000A                                                         ;A9DC25;
    LDY.W #EnemyProjectile_MiscDust                                      ;A9DC28;
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics                  ;A9DC2B;
    LDA.W NumberOfTimesMainEnemyRoutineExecuted                          ;A9DC2F;
    AND.W #$0007                                                         ;A9DC32;
    BNE .return                                                          ;A9DC35;
    LDA.W #$0010                                                         ;A9DC37;
    JSL.L QueueSound_Lib2_Max3                                           ;A9DC3A;

  .return:
    PLX                                                                  ;A9DC3E;
    RTS                                                                  ;A9DC3F;


;;; $DC40: Initialise corpse rotting data table ;;;
InitializeCorpseRottingDataTable:
;; Parameters:
;;     A: Height
;;     X: Corpse rotting data table pointer

; Make table of decreasing Y offsets with increasing timers
    DEC                                                                  ;A9DC40;
    STZ.B DP_Temp12                                                      ;A9DC41;

  .loop:
    PHA                                                                  ;A9DC43;
    STA.L MotherBrainCorpseRottingGFX&$FF0000,X                          ;A9DC44;
    LDA.B DP_Temp12                                                      ;A9DC48;
    INX                                                                  ;A9DC4A;
    INX                                                                  ;A9DC4B;
    STA.L MotherBrainCorpseRottingGFX&$FF0000,X                          ;A9DC4C;
    INX                                                                  ;A9DC50;
    INX                                                                  ;A9DC51;
    LDA.B DP_Temp12                                                      ;A9DC52;
    CLC                                                                  ;A9DC54;
    ADC.W #$0002                                                         ;A9DC55;
    STA.B DP_Temp12                                                      ;A9DC58;
    PLA                                                                  ;A9DC5A;
    DEC                                                                  ;A9DC5B;
    BPL .loop                                                            ;A9DC5C;
    RTS                                                                  ;A9DC5E;


;;; $DC5F: Initialise enemy corpse rotting ;;;
InitializeEnemyCorpseRotting:
;; Parameters:
;;     X: Enemy index
;;     Y: Corpse rotting definition pointer
    LDA.W $0000,Y                                                        ;A9DC5F;
    STA.L MotherBrainBody.corpseRottingRotTablePointer,X                 ;A9DC62;
    LDA.W $0002,Y                                                        ;A9DC66;
    STA.L MotherBrainBody.corpseRottingVRAMTransfersPointer,X            ;A9DC69;
    LDA.W $0004,Y                                                        ;A9DC6D;
    STA.L MotherBrainBody.corpseRottingRotEntryCopyFunction,X            ;A9DC70;
    LDA.W $0006,Y                                                        ;A9DC74;
    STA.L MotherBrainBody.corpseRottingRotEntryMoveFunction,X            ;A9DC77;
    LDA.W $000E,Y                                                        ;A9DC7B;
    STA.L MotherBrainBody.corpseRottingRotEntryFinishedHook,X            ;A9DC7E;
    LDA.W $000C,Y                                                        ;A9DC82;
    STA.L MotherBrainBody.corpseRottingTileDataRowOffsetsPointer,X       ;A9DC85;
    PHY                                                                  ;A9DC89;
    TAY                                                                  ;A9DC8A;
    LDA.W $0002,Y                                                        ;A9DC8B;
    SEC                                                                  ;A9DC8E;
    SBC.W #$000C                                                         ;A9DC8F;
    STA.L MotherBrainBody.corpseRottingInterTileDataOffset,X             ;A9DC92;
    PLY                                                                  ;A9DC96;
    LDA.W $0008,Y                                                        ;A9DC97;
    STA.L MotherBrainBody.corpseRottingSpriteHeight,X                    ;A9DC9A;
    DEC                                                                  ;A9DC9E;
    STA.L MotherBrainBody.corpseRottingSpriteHeightMinus1,X              ;A9DC9F;
    DEC                                                                  ;A9DCA3;
    STA.L MotherBrainBody.corpseRottingSpriteHeightMinus2,X              ;A9DCA4;
    LDX.W $0000,Y                                                        ;A9DCA8;
    LDA.W $0008,Y                                                        ;A9DCAB;
    JSR.W InitializeCorpseRottingDataTable                               ;A9DCAE;
    LDA.W $000A,Y                                                        ;A9DCB1;
    STA.B DP_Temp12                                                      ;A9DCB4;
    JMP.W (DP_Temp12)                                                    ;A9DCB6;


;;; $DCB9: Process corpse rotting VRAM transfers ;;;
ProcessCorpseRottingVRAMTransfers:
;; Parameters:
;;     X: Corpse rotting VRAM transfers pointer. Format: size, source bank, source address, VRAM address (all 16 bit)
    LDY.W VRAMWriteStack                                                 ;A9DCB9;
    LDA.W $0000,X                                                        ;A9DCBC;

  .loop:
    STA.W VRAMWrite.size,Y                                               ;A9DCBF; >.<
    LDA.W $0002,X                                                        ;A9DCC2;
    STA.W VRAMWrite.src+1,Y                                              ;A9DCC5; >.<
    LDA.W $0004,X                                                        ;A9DCC8;
    STA.W VRAMWrite.src,Y                                                ;A9DCCB; >.<
    LDA.W $0006,X                                                        ;A9DCCE;
    STA.W VRAMWrite.dest,Y                                               ;A9DCD1; >.<
    TYA                                                                  ;A9DCD4;
    CLC                                                                  ;A9DCD5;
    ADC.W #$0007                                                         ;A9DCD6;
    TAY                                                                  ;A9DCD9;
    TXA                                                                  ;A9DCDA;
    ADC.W #$0008                                                         ;A9DCDB;
    TAX                                                                  ;A9DCDE;
    LDA.W $0000,X                                                        ;A9DCDF;
    BNE .loop                                                            ;A9DCE2;
    STA.L MotherBrainBody.spriteTilesTransferEntryPointer                ;A9DCE4;
    TYA                                                                  ;A9DCE8;
    STA.W VRAMWriteStack                                                 ;A9DCE9;
    RTS                                                                  ;A9DCEC;


;;; $DCED: Power bomb reaction - enemy $EDFF (zoomer corpse) ;;;
PowerBombReaction_CorpseZoomer:
    LDX.W EnemyIndex                                                     ;A9DCED;
    LDA.W Enemy.properties,X                                             ;A9DCF0;
    AND.W #$0400                                                         ;A9DCF3;
    BNE CorpseCommonContactReaction_return                               ;A9DCF6; fallthrough to EnemyTouch_EnemyShot_CorpseZoomer


;;; $DCF8: Enemy touch / enemy shot - enemy $EDFF (zoomer corpse) ;;;
EnemyTouch_EnemyShot_CorpseZoomer:
    LDA.W #Function_CorpseZoomer_Rotting                                 ;A9DCF8;
    BRA CorpseCommonContactReaction                                      ;A9DCFB;


;;; $DCFD: Power bomb reaction - enemy $EE3F (ripper corpse) ;;;
PowerBombReaction_CorpseRipper:
    LDX.W EnemyIndex                                                     ;A9DCFD;
    LDA.W Enemy.properties,X                                             ;A9DD00;
    AND.W #$0400                                                         ;A9DD03;
    BNE CorpseCommonContactReaction_return                               ;A9DD06; fallthrough to EnemyTouch_EnemyShot_CorpseRipper


;;; $DD08: Enemy touch / enemy shot - enemy $EE3F (ripper corpse) ;;;
EnemyTouch_EnemyShot_CorpseRipper:
    LDA.W #Function_CorpseRipper_Rotting                                 ;A9DD08;
    BRA CorpseCommonContactReaction                                      ;A9DD0B;


;;; $DD0D: Power bomb reaction - enemy $EE7F (skree corpse) ;;;
PowerBombReaction_CorpseSkree:
    LDX.W EnemyIndex                                                     ;A9DD0D;
    LDA.W Enemy.properties,X                                             ;A9DD10;
    AND.W #$0400                                                         ;A9DD13;
    BNE CorpseCommonContactReaction_return                               ;A9DD16; fallthrough to EnemyTouch_EnemyShot_CorpseSkree


;;; $DD18: Enemy touch / enemy shot - enemy $EE7F (skree corpse) ;;;
EnemyTouch_EnemyShot_CorpseSkree:
    LDA.W #Function_CorpseSkree_Rotting                                  ;A9DD18;
    BRA CorpseCommonContactReaction                                      ;A9DD1B;


;;; $DD1D: Enemy shot - enemy $ED7F (sidehopper corpse) ;;;
EnemyShot_CorpseSidehopper:
; Also power bomb reaction / enemy touch / enemy shot - enemy $EDBF (sidehopper corpse, part 2)
    LDX.W EnemyIndex                                                     ;A9DD1D;
    LDA.W Enemy.properties,X                                             ;A9DD20;
    AND.W #$0400                                                         ;A9DD23;
    BNE CorpseCommonContactReaction_return                               ;A9DD26;
    LDA.L CorpseSidehopper.drainedPaletteIndex,X                         ;A9DD28;
    CMP.W #$0008                                                         ;A9DD2C;
    BCC CorpseCommonContactReaction_return                               ;A9DD2F; fallthrough to CorpseSidehopperContactReaction_Rottable


;;; $DD31: Sidehopper corpse contact reaction - rottable ;;;
CorpseSidehopperContactReaction_Rottable:
    LDA.W #Function_CorpseSidehopper_Rotting                             ;A9DD31; fallthrough to CorpseCommonContactReaction


;;; $DD34: Dead enemies shared contact reaction ;;;
CorpseCommonContactReaction:
;; Parameters:
;;     A: Rotting enemy function
    LDX.W EnemyIndex                                                     ;A9DD34;
    STA.W Corpse.function,X                                              ;A9DD37;
    LDA.W Enemy.properties,X                                             ;A9DD3A;
    ORA.W #$0C00                                                         ;A9DD3D;
    STA.W Enemy.properties,X                                             ;A9DD40;

  .return:
    RTL                                                                  ;A9DD43;


;;; $DD44: Enemy touch - enemy $ED7F (sidehopper corpse) ;;;
EnemyTouch_CorpseSidehopper:
    LDX.W EnemyIndex                                                     ;A9DD44;
    LDA.L CorpseSidehopper.drainedPaletteIndex,X                         ;A9DD47;
    CMP.W #$0008                                                         ;A9DD4B;
    BCS CorpseSidehopperContactReaction_Rottable                         ;A9DD4E;
    LDX.W EnemyIndex                                                     ;A9DD50;
    JSL.L NormalEnemyTouchAI_NoDeathCheck_External                       ;A9DD53;
    RTL                                                                  ;A9DD57;


;;; $DD58: Corpse rotting definitions ;;;
CorpseRottingDefinitions_Torizo:
;                        ______________________________________ 0: Corpse rotting rot table pointer (bank $7E)
;                       |     _________________________________ 2: Corpse rotting VRAM transfers pointer
;                       |    |     ____________________________ 4: Corpse rotting rot entry copy function
;                       |    |    |     _______________________ 6: Corpse rotting rot entry move function
;                       |    |    |    |     __________________ 8: Height
;                       |    |    |    |    |     _____________ Ah: Initialisation function pointer
;                       |    |    |    |    |    |     ________ Ch: Tile data row offsets pointer
;                       |    |    |    |    |    |    |     ___ Eh: Corpse rotting rot entry finished hook
;                       |    |    |    |    |    |    |    |
  .rotTablePointer:
    dw CorpseRottingTable                                                ;A9DD58;
  .VRAMTransferPointer:
    dw $0000                                                             ;A9DD5A;
  .rotEntryCopyFunction:
    dw CorpseRottingRotEntry_Copy_Torizo                                 ;A9DD5C;
  .rotEntryMoveFunction:
    dw CorpseRottingRotEntry_Move_Torizo                                 ;A9DD5E;
  .height:
    dw $0060                                                             ;A9DD60;
  .initFunctionPointer:
    dw CorpseRottingInit_Torizo                                          ;A9DD62;
  .tileDataRowOffsetsPointer:
    dw CorpseRottingTileRowOffsets_Torizo                                ;A9DD64;
  .rotEntryFinishedHook:
    dw CorpseRottingRotEntryFinishedHook_CorpseTorizo                    ;A9DD66;

CorpseRottingDefinitions_Sidehopper_Param1_0:
    dw CorpseRottingTable                                                ;A9DD68; 0: Corpse rotting rot table pointer (bank $7E)
    dw CorpseRottingVRAMTransferDefinitions_Sidehopper_Param1_0          ;A9DD6A; 2: Corpse rotting VRAM transfers pointer
    dw CorpseRottingRotEntry_Copy_Sidehopper_Param1_0                    ;A9DD6C; 4: Corpse rotting rot entry copy function
    dw CorpseRottingRotEntry_Move_Sidehopper_Param1_0                    ;A9DD6E; 6: Corpse rotting rot entry move function
    dw $0028                                                             ;A9DD70; 8: Height
    dw CorpseRottingInit_Sidehopper_Param1_0                             ;A9DD72; Ah: Initialisation function pointer
    dw CorpseRottingTileRowOffsets_Sidehopper                            ;A9DD74; Ch: Tile data row offsets pointer
    dw CorpseRotEntryFinishedHook_Normal                                 ;A9DD76; Eh: Corpse rotting rot entry finished hook

CorpseRottingDefinitions_Sidehopper_Param1_2:
    dw CorpseRottingTable+$A0                                            ;A9DD78; 0: Corpse rotting rot table pointer (bank $7E)
    dw CorpseRottingVRAMTransferDefinitions_Sidehopper_Param1_2          ;A9DD7A; 2: Corpse rotting VRAM transfers pointer
    dw CorpseRottingRotEntry_Copy_Sidehopper_Param1_2                    ;A9DD7C; 4: Corpse rotting rot entry copy function
    dw CorpseRottingRotEntry_Move_Sidehopper_Param1_2                    ;A9DD7E; 6: Corpse rotting rot entry move function
    dw $0028                                                             ;A9DD80; 8: Height
    dw CorpseRottingInit_Sidehopper_Param1_2                             ;A9DD82; Ah: Initialisation function pointer
    dw CorpseRottingTileRowOffsets_Sidehopper                            ;A9DD84; Ch: Tile data row offsets pointer
    dw CorpseRotEntryFinishedHook_Normal                                 ;A9DD86; Eh: Corpse rotting rot entry finished hook

CorpseRottingDefinitions_Zoomer_Param1_0:
    dw CorpseRottingTable+$2C0                                           ;A9DD88; 0: Corpse rotting rot table pointer (bank $7E)
    dw CorpseRottingVRAMTransferDefinitions_Zoomer_Param1_0              ;A9DD8A; 2: Corpse rotting VRAM transfers pointer
    dw CorpseRottingRotEntry_Copy_Zoomer_Param1_0                        ;A9DD8C; 4: Corpse rotting rot entry copy function
    dw CorpseRottingRotEntry_Move_Zoomer_Param1_0                        ;A9DD8E; 6: Corpse rotting rot entry move function
    dw $0010                                                             ;A9DD90; 8: Height
    dw CorpseRottingInit_Zoomer_Param1_0                                 ;A9DD92; Ah: Initialisation function pointer
    dw CorpseRottingTileRowOffsets_Zoomer                                ;A9DD94; Ch: Tile data row offsets pointer
    dw CorpseRotEntryFinishedHook_Normal                                 ;A9DD96; Eh: Corpse rotting rot entry finished hook

CorpseRottingDefinitions_Zoomer_Param1_2:
    dw CorpseRottingTable+$300                                           ;A9DD98; 0: Corpse rotting rot table pointer (bank $7E)
    dw CorpseRottingVRAMTransferDefinitions_Zoomer_Param1_2              ;A9DD9A; 2: Corpse rotting VRAM transfers pointer
    dw CorpseRottingRotEntry_Copy_Zoomer_Param1_2                        ;A9DD9C; 4: Corpse rotting rot entry copy function
    dw CorpseRottingRotEntry_Move_Zoomer_Param1_2                        ;A9DD9E; 6: Corpse rotting rot entry move function
    dw $0010                                                             ;A9DDA0; 8: Height
    dw CorpseRottingInit_Zoomer_Param1_2                                 ;A9DDA2; Ah: Initialisation function pointer
    dw CorpseRottingTileRowOffsets_Zoomer                                ;A9DDA4; Ch: Tile data row offsets pointer
    dw CorpseRotEntryFinishedHook_Normal                                 ;A9DDA6; Eh: Corpse rotting rot entry finished hook

CorpseRottingDefinitions_Zoomer_Param1_4:
    dw CorpseRottingTable+$340                                           ;A9DDA8; 0: Corpse rotting rot table pointer (bank $7E)
    dw CorpseRottingVRAMTransferDefinitions_Zoomer_Param1_4              ;A9DDAA; 2: Corpse rotting VRAM transfers pointer
    dw CorpseRottingRotEntry_Copy_Zoomer_Param1_4                        ;A9DDAC; 4: Corpse rotting rot entry copy function
    dw CorpseRottingRotEntry_Move_Zoomer_Param1_4                        ;A9DDAE; 6: Corpse rotting rot entry move function
    dw $0010                                                             ;A9DDB0; 8: Height
    dw CorpseRottingInit_Zoomer_Param1_4                                 ;A9DDB2; Ah: Initialisation function pointer
    dw CorpseRottingTileRowOffsets_Zoomer                                ;A9DDB4; Ch: Tile data row offsets pointer
    dw CorpseRotEntryFinishedHook_Normal                                 ;A9DDB6; Eh: Corpse rotting rot entry finished hook

CorpseRottingDefinitions_Ripper_Param1_0:
    dw CorpseRottingTable+$380                                           ;A9DDB8; 0: Corpse rotting rot table pointer (bank $7E)
    dw CorpseRottingVRAMTransferDefinitions_Ripper_Param1_0              ;A9DDBA; 2: Corpse rotting VRAM transfers pointer
    dw CorpseRottingRotEntry_Copy_Ripper_Param1_0                        ;A9DDBC; 4: Corpse rotting rot entry copy function
    dw CorpseRottingRotEntry_Move_Ripper_Param1_0                        ;A9DDBE; 6: Corpse rotting rot entry move function
    dw $0010                                                             ;A9DDC0; 8: Height
    dw CorpseRottingInit_Ripper_Param1_0                                 ;A9DDC2; Ah: Initialisation function pointer
    dw CorpseRottingTileRowOffsets_Ripper                                ;A9DDC4; Ch: Tile data row offsets pointer
    dw CorpseRotEntryFinishedHook_Normal                                 ;A9DDC6; Eh: Corpse rotting rot entry finished hook

CorpseRottingDefinitions_Ripper_Param1_2:
    dw CorpseRottingTable+$3C0                                           ;A9DDC8; 0: Corpse rotting rot table pointer (bank $7E)
    dw CorpseRottingVRAMTransferDefinitions_Ripper_Param1_2              ;A9DDCA; 2: Corpse rotting VRAM transfers pointer
    dw CorpseRottingRotEntry_Copy_Ripper_Param1_2                        ;A9DDCC; 4: Corpse rotting rot entry copy function
    dw CorpseRottingRotEntry_Move_Ripper_Param1_2                        ;A9DDCE; 6: Corpse rotting rot entry move function
    dw $0010                                                             ;A9DDD0; 8: Height
    dw CorpseRottingInit_Ripper_Param1_2                                 ;A9DDD2; Ah: Initialisation function pointer
    dw CorpseRottingTileRowOffsets_Ripper                                ;A9DDD4; Ch: Tile data row offsets pointer
    dw CorpseRotEntryFinishedHook_Normal                                 ;A9DDD6; Eh: Corpse rotting rot entry finished hook

CorpseRottingDefinitions_Skree_Param1_0:
    dw CorpseRottingTable+$140                                           ;A9DDD8; 0: Corpse rotting rot table pointer (bank $7E)
    dw CorpseRottingVRAMTransferDefinitions_Skree_Param1_0               ;A9DDDA; 2: Corpse rotting VRAM transfers pointer
    dw CorpseRottingRotEntry_Copy_Skree_Param1_0                         ;A9DDDC; 4: Corpse rotting rot entry copy function
    dw CorpseRottingRotEntry_Move_Skree_Param1_0                         ;A9DDDE; 6: Corpse rotting rot entry move function
    dw $0020                                                             ;A9DDE0; 8: Height
    dw CorpseRottingInit_Skree_Param1_0                                  ;A9DDE2; Ah: Initialisation function pointer
    dw CorpseRottingTileRowOffsets_Skree                                 ;A9DDE4; Ch: Tile data row offsets pointer
    dw CorpseRotEntryFinishedHook_Normal                                 ;A9DDE6; Eh: Corpse rotting rot entry finished hook

CorpseRottingDefinitions_Skree_Param1_2:
    dw CorpseRottingTable+$1C0                                           ;A9DDE8; 0: Corpse rotting rot table pointer (bank $7E)
    dw CorpseRottingVRAMTransferDefinitions_Skree_Param1_2               ;A9DDEA; 2: Corpse rotting VRAM transfers pointer
    dw CorpseRottingRotEntry_Copy_Skree_Param1_2                         ;A9DDEC; 4: Corpse rotting rot entry copy function
    dw CorpseRottingRotEntry_Move_Skree_Param1_2                         ;A9DDEE; 6: Corpse rotting rot entry move function
    dw $0020                                                             ;A9DDF0; 8: Height
    dw CorpseRottingInit_Skree_Param1_2                                  ;A9DDF2; Ah: Initialisation function pointer
    dw CorpseRottingTileRowOffsets_Skree                                 ;A9DDF4; Ch: Tile data row offsets pointer
    dw CorpseRotEntryFinishedHook_Normal                                 ;A9DDF6; Eh: Corpse rotting rot entry finished hook

CorpseRottingDefinitions_Skree_Param1_4:
    dw CorpseRottingTable+$240                                           ;A9DDF8; 0: Corpse rotting rot table pointer (bank $7E)
    dw CorpseRottingVRAMTransferDefinitions_Skree_Param1_4               ;A9DDFA; 2: Corpse rotting VRAM transfers pointer
    dw CorpseRottingRotEntry_Copy_Skree_Param1_4                         ;A9DDFC; 4: Corpse rotting rot entry copy function
    dw CorpseRottingRotEntry_Move_Skree_Param1_4                         ;A9DDFE; 6: Corpse rotting rot entry move function
    dw $0020                                                             ;A9DE00; 8: Height
    dw CorpseRottingInit_Skree_Param1_4                                  ;A9DE02; Ah: Initialisation function pointer
    dw CorpseRottingTileRowOffsets_Skree                                 ;A9DE04; Ch: Tile data row offsets pointer
    dw CorpseRotEntryFinishedHook_Normal                                 ;A9DE06; Eh: Corpse rotting rot entry finished hook

CorpseRottingDefinitions_MotherBrain:
    dw CorpseRottingTable+$700                                           ;A9DE08; 0: Corpse rotting rot table pointer (bank $7E)
    dw CorpseRottingVRAMTransferDefinitions_MotherBrain                  ;A9DE0A; 2: Corpse rotting VRAM transfers pointer
    dw CorpseRottingRotEntry_Copy_MotherBrain                            ;A9DE0C; 4: Corpse rotting rot entry copy function
    dw CorpseRottingRotEntry_Move_MotherBrain                            ;A9DE0E; 6: Corpse rotting rot entry move function
    dw $0030                                                             ;A9DE10; 8: Height
    dw CorpseRottingInit_MotherBrain                                     ;A9DE12; Ah: Initialisation function pointer
    dw CorpseRottingTileRowOffsets_MotherBrain                           ;A9DE14; Ch: Tile data row offsets pointer
    dw CorpseRottingRotEntryFinishedHook_MotherBrain                     ;A9DE16; Eh: Corpse rotting rot entry finished hook


;;; $DE18: Corpse rotting initialisation function - torizo ;;;
CorpseRottingInit_Torizo:
; $7E:2000..213F: Row 0
; $7E:2140..227F: Row 1
; $7E:2280..23BF: Row 2
; $7E:23C0..24FF: Row 3
; $7E:2500..263F: Row 4
; $7E:2640..277F: Row 5
; $7E:2780..28BF: Row 6
; $7E:28C0..29FF: Row 7
; $7E:2A00..2B3F: Row 8
; $7E:2B40..2C7F: Row 9
; $7E:2C80..2DBF: Row Ah
; $7E:2DC0..2EFF: Row Bh
    PHB                                                                  ;A9DE18;
    LDX.W #Tiles_CorpseTorizo+$120                                       ;A9DE19;
    LDY.W #CorpseRottingGFX_Torizo+$60                                   ;A9DE1C;
    LDA.W #$00BF                                                         ;A9DE1F;
    MVN $7E,Tiles_CorpseTorizo>>16                                       ;A9DE22;
    PLB                                                                  ;A9DE25;
    PHB                                                                  ;A9DE26;
    LDX.W #Tiles_CorpseTorizo+$320                                       ;A9DE27;
    LDY.W #CorpseRottingGFX_Torizo+$1A0                                  ;A9DE2A;
    LDA.W #$00BF                                                         ;A9DE2D;
    MVN $7E,Tiles_CorpseTorizo>>16                                       ;A9DE30;
    PLB                                                                  ;A9DE33;
    PHB                                                                  ;A9DE34;
    LDX.W #Tiles_CorpseTorizo+$500                                       ;A9DE35;
    LDY.W #CorpseRottingGFX_Torizo+$2C0                                  ;A9DE38;
    LDA.W #$00FF                                                         ;A9DE3B;
    MVN $7E,Tiles_CorpseTorizo>>16                                       ;A9DE3E;
    PLB                                                                  ;A9DE41;
    PHB                                                                  ;A9DE42;
    LDX.W #Tiles_CorpseTorizo+$700                                       ;A9DE43;
    LDY.W #CorpseRottingGFX_Torizo+$400                                  ;A9DE46;
    LDA.W #$00FF                                                         ;A9DE49;
    MVN $7E,Tiles_CorpseTorizo>>16                                       ;A9DE4C;
    PLB                                                                  ;A9DE4F;
    PHB                                                                  ;A9DE50;
    LDX.W #Tiles_CorpseTorizo+$900                                       ;A9DE51;
    LDY.W #CorpseRottingGFX_Torizo+$540                                  ;A9DE54;
    LDA.W #$00FF                                                         ;A9DE57;
    MVN $7E,Tiles_CorpseTorizo>>16                                       ;A9DE5A;
    PLB                                                                  ;A9DE5D;
    PHB                                                                  ;A9DE5E;
    LDX.W #Tiles_CorpseTorizo+$B00                                       ;A9DE5F;
    LDY.W #CorpseRottingGFX_Torizo+$680                                  ;A9DE62;
    LDA.W #$00FF                                                         ;A9DE65;
    MVN $7E,Tiles_CorpseTorizo>>16                                       ;A9DE68;
    PLB                                                                  ;A9DE6B;
    PHB                                                                  ;A9DE6C;
    LDX.W #Tiles_CorpseTorizo+$D00                                       ;A9DE6D;
    LDY.W #CorpseRottingGFX_Torizo+$7C0                                  ;A9DE70;
    LDA.W #$00FF                                                         ;A9DE73;
    MVN $7E,Tiles_CorpseTorizo>>16                                       ;A9DE76;
    PLB                                                                  ;A9DE79;
    PHB                                                                  ;A9DE7A;
    LDX.W #Tiles_CorpseTorizo+$F00                                       ;A9DE7B;
    LDY.W #CorpseRottingGFX_Torizo+$900                                  ;A9DE7E;
    LDA.W #$00FF                                                         ;A9DE81;
    MVN $7E,Tiles_CorpseTorizo>>16                                       ;A9DE84;
    PLB                                                                  ;A9DE87;
    PHB                                                                  ;A9DE88;
    LDX.W #Tiles_CorpseTorizo+$1100                                      ;A9DE89;
    LDY.W #CorpseRottingGFX_Torizo+$A40                                  ;A9DE8C;
    LDA.W #$00FF                                                         ;A9DE8F;
    MVN $7E,Tiles_CorpseTorizo>>16                                       ;A9DE92;
    PLB                                                                  ;A9DE95;
    PHB                                                                  ;A9DE96;
    LDX.W #Tiles_CorpseTorizo+$12E0                                      ;A9DE97;
    LDY.W #CorpseRottingGFX_Torizo+$B60                                  ;A9DE9A;
    LDA.W #$011F                                                         ;A9DE9D;
    MVN $7E,Tiles_CorpseTorizo>>16                                       ;A9DEA0;
    PLB                                                                  ;A9DEA3;
    PHB                                                                  ;A9DEA4;
    LDX.W #Tiles_CorpseTorizo+$14C0                                      ;A9DEA5;
    LDY.W #CorpseRottingGFX_Torizo+$C80                                  ;A9DEA8;
    LDA.W #$013F                                                         ;A9DEAB;
    MVN $7E,Tiles_CorpseTorizo>>16                                       ;A9DEAE;
    PLB                                                                  ;A9DEB1;
    PHB                                                                  ;A9DEB2;
    LDX.W #Tiles_CorpseTorizo+$16C0                                      ;A9DEB3;
    LDY.W #CorpseRottingGFX_Torizo+$DC0                                  ;A9DEB6;
    LDA.W #$013F                                                         ;A9DEB9;
    MVN $7E,Tiles_CorpseTorizo>>16                                       ;A9DEBC;
    PLB                                                                  ;A9DEBF;
    RTS                                                                  ;A9DEC0;


;;; $DEC1: Corpse rotting initialisation function - sidehopper - enemy parameter 1 = 0 ;;;
CorpseRottingInit_Sidehopper_Param1_0:
; $7E:2000..209F: Row 0
; $7E:20A0..213F: Row 1
; $7E:2140..21DF: Row 2
; $7E:21E0..227F: Row 3
; $7E:2280..231F: Row 4
    PHB                                                                  ;A9DEC1;
    LDX.W #Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree+$40               ;A9DEC2;
    LDY.W #CorpseRottingGFX_Sidehopper0+$40                              ;A9DEC5;
    LDA.W #$005F                                                         ;A9DEC8;
    MVN $7E,Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree>>16              ;A9DECB;
    PLB                                                                  ;A9DECE;
    PHB                                                                  ;A9DECF;
    LDX.W #Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree+$200              ;A9DED0;
    LDY.W #CorpseRottingGFX_Sidehopper0+$A0                              ;A9DED3;
    LDA.W #$009F                                                         ;A9DED6;
    MVN $7E,Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree>>16              ;A9DED9;
    PLB                                                                  ;A9DEDC;
    PHB                                                                  ;A9DEDD;
    LDX.W #Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree+$400              ;A9DEDE;
    LDY.W #CorpseRottingGFX_Sidehopper0+$140                             ;A9DEE1;
    LDA.W #$009F                                                         ;A9DEE4;
    MVN $7E,Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree>>16              ;A9DEE7;
    PLB                                                                  ;A9DEEA;
    PHB                                                                  ;A9DEEB;
    LDX.W #Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree+$600              ;A9DEEC;
    LDY.W #CorpseRottingGFX_Sidehopper0+$1E0                             ;A9DEEF;
    LDA.W #$009F                                                         ;A9DEF2;
    MVN $7E,Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree>>16              ;A9DEF5;
    PLB                                                                  ;A9DEF8;
    PHB                                                                  ;A9DEF9;
    LDX.W #Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree+$800              ;A9DEFA;
    LDY.W #CorpseRottingGFX_Sidehopper0+$280                             ;A9DEFD;
    LDA.W #$009F                                                         ;A9DF00;
    MVN $7E,Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree>>16              ;A9DF03;
    PLB                                                                  ;A9DF06;
    RTS                                                                  ;A9DF07;


;;; $DF08: Corpse rotting initialisation function - sidehopper - enemy parameter 1 = 2 ;;;
CorpseRottingInit_Sidehopper_Param1_2:
; $7E:2320..23BF: Row 0
; $7E:23C0..245F: Row 1
; $7E:2460..24FF: Row 2
; $7E:2500..259F: Row 3
; $7E:25A0..263F: Row 4
    PHB                                                                  ;A9DF08;
    LDX.W #Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree+$120              ;A9DF09;
    LDY.W #CorpseRottingGFX_Sidehopper2                                  ;A9DF0C;
    LDA.W #$003F                                                         ;A9DF0F;
    MVN $7E,Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree>>16              ;A9DF12;
    PLB                                                                  ;A9DF15;
    PHB                                                                  ;A9DF16;
    LDX.W #Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree+$320              ;A9DF17;
    LDY.W #CorpseRottingGFX_Sidehopper2+$A0                              ;A9DF1A;
    LDA.W #$009F                                                         ;A9DF1D;
    MVN $7E,Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree>>16              ;A9DF20;
    PLB                                                                  ;A9DF23;
    PHB                                                                  ;A9DF24;
    LDX.W #Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree+$520              ;A9DF25;
    LDY.W #CorpseRottingGFX_Sidehopper2+$140                             ;A9DF28;
    LDA.W #$009F                                                         ;A9DF2B;
    MVN $7E,Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree>>16              ;A9DF2E;
    PLB                                                                  ;A9DF31;
    PHB                                                                  ;A9DF32;
    LDX.W #Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree+$720              ;A9DF33;
    LDY.W #CorpseRottingGFX_Sidehopper2+$1E0                             ;A9DF36;
    LDA.W #$009F                                                         ;A9DF39;
    MVN $7E,Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree>>16              ;A9DF3C;
    PLB                                                                  ;A9DF3F;
    PHB                                                                  ;A9DF40;
    LDX.W #Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree+$920              ;A9DF41;
    LDY.W #CorpseRottingGFX_Sidehopper2+$280                             ;A9DF44;
    LDA.W #$009F                                                         ;A9DF47;
    MVN $7E,Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree>>16              ;A9DF4A;
    PLB                                                                  ;A9DF4D;
    RTS                                                                  ;A9DF4E;


;;; $DF4F: Corpse rotting initialisation function - zoomer - enemy parameter 1 = 0 ;;;
CorpseRottingInit_Zoomer_Param1_0:
; $7E:2940..99
; $7E:29A0..FF
    PHB                                                                  ;A9DF4F;
    LDX.W #Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree+$A60              ;A9DF50;
    LDY.W #CorpseRottingGFX_Zoomer0                                      ;A9DF53;
    LDA.W #$005F                                                         ;A9DF56;
    MVN $7E,Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree>>16              ;A9DF59;
    PLB                                                                  ;A9DF5C;
    PHB                                                                  ;A9DF5D;
    LDX.W #Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree+$C60              ;A9DF5E;
    LDY.W #CorpseRottingGFX_Zoomer0+$60                                  ;A9DF61;
    LDA.W #$005F                                                         ;A9DF64;
    MVN $7E,Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree>>16              ;A9DF67;
    PLB                                                                  ;A9DF6A;
    RTS                                                                  ;A9DF6B;


;;; $DF6C: Corpse rotting initialisation function - zoomer - enemy parameter 1 = 2 ;;;
CorpseRottingInit_Zoomer_Param1_2:
; $7E:2A00..5F: Row 0
; $7E:2A60..BF: Row 1
    PHB                                                                  ;A9DF6C;
    LDX.W #Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree+$AC0              ;A9DF6D;
    LDY.W #CorpseRottingGFX_Zoomer2                                      ;A9DF70;
    LDA.W #$005F                                                         ;A9DF73;
    MVN $7E,Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree>>16              ;A9DF76;
    PLB                                                                  ;A9DF79;
    PHB                                                                  ;A9DF7A;
    LDX.W #Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree+$CC0              ;A9DF7B;
    LDY.W #CorpseRottingGFX_Zoomer2+$60                                  ;A9DF7E;
    LDA.W #$005F                                                         ;A9DF81;
    MVN $7E,Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree>>16              ;A9DF84;
    PLB                                                                  ;A9DF87;
    RTS                                                                  ;A9DF88;


;;; $DF89: Corpse rotting initialisation function - zoomer - enemy parameter 1 = 4 ;;;
CorpseRottingInit_Zoomer_Param1_4:
; $7E:2AC0..2B1F: Row 0
; $7E:2B20..2B7F: Row 1
    PHB                                                                  ;A9DF89;
    LDX.W #Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree+$B20              ;A9DF8A;
    LDY.W #CorpseRottingGFX_Zoomer4                                      ;A9DF8D;
    LDA.W #$005F                                                         ;A9DF90;
    MVN $7E,Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree>>16              ;A9DF93;
    PLB                                                                  ;A9DF96;
    PHB                                                                  ;A9DF97;
    LDX.W #Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree+$D20              ;A9DF98;
    LDY.W #CorpseRottingGFX_Zoomer4+$60                                  ;A9DF9B;
    LDA.W #$005F                                                         ;A9DF9E;
    MVN $7E,Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree>>16              ;A9DFA1;
    PLB                                                                  ;A9DFA4;
    RTS                                                                  ;A9DFA5;


;;; $DFA6: Corpse rotting initialisation function - ripper - enemy parameter 1 = 0 ;;;
CorpseRottingInit_Ripper_Param1_0:
; $7E:2B80..2BDF: Row 0
; $7E:2BE0..2C3F: Row 1
    PHB                                                                  ;A9DFA6;
    LDX.W #Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree+$A00              ;A9DFA7;
    LDY.W #CorpseRottingGFX_Ripper0                                      ;A9DFAA;
    LDA.W #$005F                                                         ;A9DFAD;
    MVN $7E,Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree>>16              ;A9DFB0;
    PLB                                                                  ;A9DFB3;
    PHB                                                                  ;A9DFB4;
    LDX.W #Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree+$C00              ;A9DFB5;
    LDY.W #CorpseRottingGFX_Ripper0+$60                                  ;A9DFB8;
    LDA.W #$005F                                                         ;A9DFBB;
    MVN $7E,Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree>>16              ;A9DFBE;
    PLB                                                                  ;A9DFC1;
    RTS                                                                  ;A9DFC2;


;;; $DFC3: Corpse rotting initialisation function - ripper - enemy parameter 1 = 2 ;;;
CorpseRottingInit_Ripper_Param1_2:
; $7E:2C40..2C9F: Row 0
; $7E:2CA0..2CFF: Row 1
    PHB                                                                  ;A9DFC3;
    LDX.W #Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree+$B80              ;A9DFC4;
    LDY.W #CorpseRottingGFX_Ripper2                                      ;A9DFC7;
    LDA.W #$005F                                                         ;A9DFCA;
    MVN $7E,Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree>>16              ;A9DFCD;
    PLB                                                                  ;A9DFD0;
    PHB                                                                  ;A9DFD1;
    LDX.W #Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree+$D80              ;A9DFD2;
    LDY.W #CorpseRottingGFX_Ripper2+$60                                  ;A9DFD5;
    LDA.W #$005F                                                         ;A9DFD8;
    MVN $7E,Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree>>16              ;A9DFDB;
    PLB                                                                  ;A9DFDE;
    RTS                                                                  ;A9DFDF;


;;; $DFE0: Corpse rotting initialisation function - skree - enemy parameter 1 = 0 ;;;
CorpseRottingInit_Skree_Param1_0:
; $7E:2640..267F: Row 0
; $7E:2680..26BF: Row 1
; $7E:26C0..26FF: Row 2
; $7E:2700..273F: Row 3
    PHB                                                                  ;A9DFE0;
    LDX.W #Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree+$2A0              ;A9DFE1;
    LDY.W #CorpseRottingGFX_Skree0                                       ;A9DFE4;
    LDA.W #$003F                                                         ;A9DFE7;
    MVN $7E,Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree>>16              ;A9DFEA;
    PLB                                                                  ;A9DFED;
    PHB                                                                  ;A9DFEE;
    LDX.W #Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree+$4A0              ;A9DFEF;
    LDY.W #CorpseRottingGFX_Skree0+$40                                   ;A9DFF2;
    LDA.W #$003F                                                         ;A9DFF5;
    MVN $7E,Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree>>16              ;A9DFF8;
    PLB                                                                  ;A9DFFB;
    PHB                                                                  ;A9DFFC;
    LDX.W #Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree+$6A0              ;A9DFFD;
    LDY.W #CorpseRottingGFX_Skree0+$80                                   ;A9E000;
    LDA.W #$003F                                                         ;A9E003;
    MVN $7E,Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree>>16              ;A9E006;
    PLB                                                                  ;A9E009;
    PHB                                                                  ;A9E00A;
    LDX.W #Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree+$8A0              ;A9E00B;
    LDY.W #CorpseRottingGFX_Skree0+$C0                                   ;A9E00E;
    LDA.W #$003F                                                         ;A9E011;
    MVN $7E,Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree>>16              ;A9E014;
    PLB                                                                  ;A9E017;
    RTS                                                                  ;A9E018;


;;; $E019: Corpse rotting initialisation function - skree - enemy parameter 1 = 2 ;;;
CorpseRottingInit_Skree_Param1_2:
; $7E:2740..277F: Row 0
; $7E:2780..27BF: Row 1
; $7E:27C0..27FF: Row 2
; $7E:2800..283F: Row 3
    PHB                                                                  ;A9E019;
    LDX.W #Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree+$E0               ;A9E01A;
    LDY.W #CorpseRottingGFX_Skree2                                       ;A9E01D;
    LDA.W #$003F                                                         ;A9E020;
    MVN $7E,Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree>>16              ;A9E023;
    PLB                                                                  ;A9E026;
    PHB                                                                  ;A9E027;
    LDX.W #Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree+$2E0              ;A9E028;
    LDY.W #CorpseRottingGFX_Skree2+$40                                   ;A9E02B;
    LDA.W #$003F                                                         ;A9E02E;
    MVN $7E,Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree>>16              ;A9E031;
    PLB                                                                  ;A9E034;
    PHB                                                                  ;A9E035;
    LDX.W #Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree+$4E0              ;A9E036;
    LDY.W #CorpseRottingGFX_Skree2+$80                                   ;A9E039;
    LDA.W #$003F                                                         ;A9E03C;
    MVN $7E,Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree>>16              ;A9E03F;
    PLB                                                                  ;A9E042;
    PHB                                                                  ;A9E043;
    LDX.W #Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree+$6E0              ;A9E044;
    LDY.W #CorpseRottingGFX_Skree2+$C0                                   ;A9E047;
    LDA.W #$003F                                                         ;A9E04A;
    MVN $7E,Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree>>16              ;A9E04D;
    PLB                                                                  ;A9E050;
    RTS                                                                  ;A9E051;


;;; $E052: Corpse rotting initialisation function - skree - enemy parameter 1 = 4 ;;;
CorpseRottingInit_Skree_Param1_4:
; $7E:2840..287F: Row 0
; $7E:2880..28BF: Row 1
; $7E:28C0..28FF: Row 2
; $7E:2900..293F: Row 3
    PHB                                                                  ;A9E052;
    LDX.W #Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree+$1C0              ;A9E053;
    LDY.W #CorpseRottingGFX_Skree4                                       ;A9E056;
    LDA.W #$003F                                                         ;A9E059;
    MVN $7E,Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree>>16              ;A9E05C;
    PLB                                                                  ;A9E05F;
    PHB                                                                  ;A9E060;
    LDX.W #Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree+$3C0              ;A9E061;
    LDY.W #CorpseRottingGFX_Skree4+$40                                   ;A9E064;
    LDA.W #$003F                                                         ;A9E067;
    MVN $7E,Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree>>16              ;A9E06A;
    PLB                                                                  ;A9E06D;
    PHB                                                                  ;A9E06E;
    LDX.W #Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree+$5C0              ;A9E06F;
    LDY.W #CorpseRottingGFX_Skree4+$80                                   ;A9E072;
    LDA.W #$003F                                                         ;A9E075;
    MVN $7E,Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree>>16              ;A9E078;
    PLB                                                                  ;A9E07B;
    PHB                                                                  ;A9E07C;
    LDX.W #Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree+$7C0              ;A9E07D;
    LDY.W #CorpseRottingGFX_Skree4+$C0                                   ;A9E080;
    LDA.W #$003F                                                         ;A9E083;
    MVN $7E,Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree>>16              ;A9E086;
    PLB                                                                  ;A9E089;
    RTS                                                                  ;A9E08A;


;;; $E08B: Corpse rotting initialisation function - Mother Brain ;;;
CorpseRottingInit_MotherBrain:
; $7E:9000..90DF: Row 0
; $7E:90E0..91BF: Row 1
; $7E:91C0..929F: Row 2
; $7E:92A0..937F: Row 3
; $7E:9380..945F: Row 4
; $7E:9460..953F: Row 5

; $B7:CE00 is the two frames of Mother Brain's corpse side-by-side, this function extracts only the right-side frame (the gaps are blank tiles)
    PHB                                                                  ;A9E08B;
    LDX.W #Tiles_CorpseMotherBrain+$C0                                   ;A9E08C;
    LDY.W #MotherBrainCorpseRottingGFX                                   ;A9E08F;
    LDA.W #$00BF                                                         ;A9E092;
    MVN $7E,Tiles_CorpseMotherBrain>>16                                  ;A9E095;
    PLB                                                                  ;A9E098;
    PHB                                                                  ;A9E099;
    LDX.W #Tiles_CorpseMotherBrain+$2C0                                  ;A9E09A;
    LDY.W #MotherBrainCorpseRottingGFX+$E0                               ;A9E09D;
    LDA.W #$00BF                                                         ;A9E0A0;
    MVN $7E,Tiles_CorpseMotherBrain>>16                                  ;A9E0A3;
    PLB                                                                  ;A9E0A6;
    PHB                                                                  ;A9E0A7;
    LDX.W #Tiles_CorpseMotherBrain+$4C0                                  ;A9E0A8;
    LDY.W #MotherBrainCorpseRottingGFX+$1C0                              ;A9E0AB;
    LDA.W #$00BF                                                         ;A9E0AE;
    MVN $7E,Tiles_CorpseMotherBrain>>16                                  ;A9E0B1;
    PLB                                                                  ;A9E0B4;
    PHB                                                                  ;A9E0B5;
    LDX.W #Tiles_CorpseMotherBrain+$6C0                                  ;A9E0B6;
    LDY.W #MotherBrainCorpseRottingGFX+$2A0                              ;A9E0B9;
    LDA.W #$00BF                                                         ;A9E0BC;
    MVN $7E,Tiles_CorpseMotherBrain>>16                                  ;A9E0BF;
    PLB                                                                  ;A9E0C2;
    PHB                                                                  ;A9E0C3;
    LDX.W #Tiles_CorpseMotherBrain+$8C0                                  ;A9E0C4;
    LDY.W #MotherBrainCorpseRottingGFX+$380                              ;A9E0C7;
    LDA.W #$00DF                                                         ;A9E0CA;
    MVN $7E,Tiles_CorpseMotherBrain>>16                                  ;A9E0CD;
    PLB                                                                  ;A9E0D0;
    PHB                                                                  ;A9E0D1;
    LDX.W #Tiles_CorpseMotherBrain+$AC0                                  ;A9E0D2;
    LDY.W #MotherBrainCorpseRottingGFX+$460                              ;A9E0D5;
    LDA.W #$00DF                                                         ;A9E0D8;
    MVN $7E,Tiles_CorpseMotherBrain>>16                                  ;A9E0DB;
    PLB                                                                  ;A9E0DE;
    RTS                                                                  ;A9E0DF;


;;; $E0E0: Corpse rotting VRAM transfer definitions ;;;
; Size, source bank, source address, VRAM address
CorpseRottingVRAMTransferDefinitions_Sidehopper_Param1_0:
; Sidehopper - enemy parameter 1 = 0
    dw $0060,$7E00,$2040,$7020                                           ;A9E0E0;
    dw $00A0,$7E00,$20A0,$7100
    dw $00A0,$7E00,$2140,$7200
    dw $00A0,$7E00,$21E0,$7300
    dw $00A0,$7E00,$2280,$7400
    dw $0000

CorpseRottingVRAMTransferDefinitions_Sidehopper_Param1_2:
; Sidehopper - enemy parameter 1 = 2
    dw $0040,$7E00,$2320,$7090                                           ;A9E10A;
    dw $00A0,$7E00,$23C0,$7190
    dw $00A0,$7E00,$2460,$7290
    dw $00A0,$7E00,$2500,$7390
    dw $00A0,$7E00,$25A0,$7490
    dw $0000

CorpseRottingVRAMTransferDefinitions_Zoomer_Param1_0:
; Zoomer - enemy parameter 1 = 0
    dw $0060,$7E00,$2940,$7530                                           ;A9E134;
    dw $0060,$7E00,$29A0,$7630
    dw $0000

CorpseRottingVRAMTransferDefinitions_Zoomer_Param1_2:
; Zoomer - enemy parameter 1 = 2
    dw $0060,$7E00,$2A00,$7560                                           ;A9E146;
    dw $0060,$7E00,$2A60,$7660
    dw $0000

CorpseRottingVRAMTransferDefinitions_Zoomer_Param1_4:
; Zoomer - enemy parameter 1 = 4
    dw $0060,$7E00,$2AC0,$7590                                           ;A9E158;
    dw $0060,$7E00,$2B20,$7690
    dw $0000

CorpseRottingVRAMTransferDefinitions_Ripper_Param1_0:
; Ripper - enemy parameter 1 = 0
    dw $0060,$7E00,$2B80,$7500                                           ;A9E16A;
    dw $0060,$7E00,$2BE0,$7600
    dw $0000

CorpseRottingVRAMTransferDefinitions_Ripper_Param1_2:
; Ripper - enemy parameter 1 = 2
    dw $0060,$7E00,$2C40,$75C0                                           ;A9E17C;
    dw $0060,$7E00,$2CA0,$76C0
    dw $0000

CorpseRottingVRAMTransferDefinitions_Skree_Param1_0:
; Skree - enemy parameter 1 = 0
    dw $0040,$7E00,$2640,$7150                                           ;A9E18E;
    dw $0040,$7E00,$2680,$7250
    dw $0040,$7E00,$26C0,$7350
    dw $0040,$7E00,$2700,$7450
    dw $0000

CorpseRottingVRAMTransferDefinitions_Skree_Param1_2:
; Skree - enemy parameter 1 = 2
    dw $0040,$7E00,$2740,$7070                                           ;A9E1B0;
    dw $0040,$7E00,$2780,$7170
    dw $0040,$7E00,$27C0,$7270
    dw $0040,$7E00,$2800,$7370
    dw $0000

CorpseRottingVRAMTransferDefinitions_Skree_Param1_4:
; Skree - enemy parameter 1 = 4
    dw $0040,$7E00,$2840,$70E0                                           ;A9E1D2;
    dw $0040,$7E00,$2880,$71E0
    dw $0040,$7E00,$28C0,$72E0
    dw $0040,$7E00,$2900,$73E0
    dw $0000

CorpseRottingVRAMTransferDefinitions_MotherBrain:
; Mother Brain
    dw $0060,$7E00,$9040,$7A80                                           ;A9E1F4;
    dw $00A0,$7E00,$9100,$7B70
    dw $00C0,$7E00,$91C0,$7C60
    dw $00C0,$7E00,$92A0,$7D60
    dw $00E0,$7E00,$9380,$7E60
    dw $00E0,$7E00,$9460,$7F60
    dw $0000


;;; $E226: Corpse rotting tile row offsets ;;;
CorpseRottingTileRowOffsets:
  .Torizo:
    dw $0000,$0140,$0280,$03C0,$0500,$0640,$0780,$08C0                   ;A9E226;
    dw $0A00,$0B40,$0C80,$0DC0,$0F00                                     ;A9E236;

  .Sidehopper:
    dw $0000,$00A0,$0140,$01E0,$0280,$0320                               ;A9E240;

  .Zoomer:
    dw $0000,$0060,$00C0                                                 ;A9E24C;

  .Ripper:
    dw $0000,$0060,$00C0                                                 ;A9E252;

  .Skree:
    dw $0000,$0040,$0080,$00C0,$0100                                     ;A9E258;

  .MotherBrain:
    dw $0000,$00E0,$01C0,$02A0,$0380,$0460,$0540,$0620                   ;A9E262;


;;; $E272: Corpse rotting rot entry move function - torizo ;;;
CorpseRottingRotEntry_Move_Torizo:
;; Parameters:
;;     X: Source pixel row tile data offset
;;     Y: Destination pixel row tile data offset

; DB must be $7E
; Clears pixel row in dest and copies a pixel row from source to one pixel down in dest

; Tile data calculations:
;     Tiles are 20h bytes
;
;     Pixel (x, y) of tile at pointer p is:
;           ([p + y * 2]       >> 7 - x & 1)
;         | ([p + y * 2 + 1]   >> 7 - x & 1) << 1
;         | ([p + y * 2 + 10h] >> 7 - x & 1) << 2
;         | ([p + y * 2 + 11h] >> 7 - x & 1) << 3
;
;     Hence, pixel row y of tile at pointer p is the bytes
;         [p + y * 2], [p + y * 2 + 1], [p + y * 2 + 10h], [p + y * 2 + 11h]

; Column 0 is only used by rows Ah..Bh
; Column 1 is only used by rows 9..Bh
; Column 2 is only used by rows 2..Bh
; Column 9 is only used by rows 2..Bh
; (See $B7:A800)
    LDA.W Corpse.rotEntryYOffset                                         ;A9E272;
    CMP.W #$0050                                                         ;A9E275;
    BCC .column1                                                         ;A9E278;
    CMP.W #$005E                                                         ;A9E27A;
    BPL .offsetGreaterThan5D                                             ;A9E27D;
    LDA.W CorpseRottingGFX_Torizo,X                                      ;A9E27F;
    STA.W CorpseRottingGFX_Torizo+2,Y                                    ;A9E282;
    LDA.W CorpseRottingGFX_Torizo+$10,X                                  ;A9E285;
    STA.W CorpseRottingGFX_Torizo+$12,Y                                  ;A9E288;

  .offsetGreaterThan5D:
    STZ.W CorpseRottingGFX_Torizo,X                                      ;A9E28B;
    STZ.W CorpseRottingGFX_Torizo+$10,X                                  ;A9E28E;

  .column1:
    LDA.W Corpse.rotEntryYOffset                                         ;A9E291;
    CMP.W #$0048                                                         ;A9E294;
    BCC .column2                                                         ;A9E297;
    CMP.W #$005E                                                         ;A9E299;
    BPL ..offsetGreaterThan5E                                            ;A9E29C;
    LDA.W CorpseRottingGFX_Torizo+$20,X                                  ;A9E29E;
    STA.W CorpseRottingGFX_Torizo+$22,Y                                  ;A9E2A1;
    LDA.W CorpseRottingGFX_Torizo+$30,X                                  ;A9E2A4;
    STA.W CorpseRottingGFX_Torizo+$32,Y                                  ;A9E2A7;

  ..offsetGreaterThan5E:
    STZ.W CorpseRottingGFX_Torizo+$20,X                                  ;A9E2AA;
    STZ.W CorpseRottingGFX_Torizo+$30,X                                  ;A9E2AD;

  .column2:
    LDA.W Corpse.rotEntryYOffset                                         ;A9E2B0;
    CMP.W #$0010                                                         ;A9E2B3;
    BCC .column3                                                         ;A9E2B6;
    CMP.W #$005E                                                         ;A9E2B8;
    BPL ..offsetGreaterThan5E                                            ;A9E2BB;
    LDA.W CorpseRottingGFX_Torizo+$40,X                                  ;A9E2BD;
    STA.W CorpseRottingGFX_Torizo+$42,Y                                  ;A9E2C0;
    LDA.W CorpseRottingGFX_Torizo+$50,X                                  ;A9E2C3;
    STA.W CorpseRottingGFX_Torizo+$52,Y                                  ;A9E2C6;

  ..offsetGreaterThan5E:
    STZ.W CorpseRottingGFX_Torizo+$40,X                                  ;A9E2C9;
    STZ.W CorpseRottingGFX_Torizo+$50,X                                  ;A9E2CC;

  .column3:
    LDA.W Corpse.rotEntryYOffset                                         ;A9E2CF;
    CMP.W #$005E                                                         ;A9E2D2;
    BPL ..offsetGreaterThan5E                                            ;A9E2D5;
    LDA.W CorpseRottingGFX_Torizo+$60,X                                  ;A9E2D7;
    STA.W CorpseRottingGFX_Torizo+$62,Y                                  ;A9E2DA;
    LDA.W CorpseRottingGFX_Torizo+$70,X                                  ;A9E2DD;
    STA.W CorpseRottingGFX_Torizo+$72,Y                                  ;A9E2E0;

  ..offsetGreaterThan5E:
    STZ.W CorpseRottingGFX_Torizo+$60,X                                  ;A9E2E3;
    STZ.W CorpseRottingGFX_Torizo+$70,X                                  ;A9E2E6;
    LDA.W Corpse.rotEntryYOffset                                         ;A9E2E9;
    CMP.W #$005E                                                         ;A9E2EC;
    BPL +                                                                ;A9E2EF;
    LDA.W CorpseRottingGFX_Torizo+$80,X                                  ;A9E2F1;
    STA.W CorpseRottingGFX_Torizo+$82,Y                                  ;A9E2F4;
    LDA.W CorpseRottingGFX_Torizo+$90,X                                  ;A9E2F7;
    STA.W CorpseRottingGFX_Torizo+$92,Y                                  ;A9E2FA;

+   STZ.W CorpseRottingGFX_Torizo+$80,X                                  ;A9E2FD;
    STZ.W CorpseRottingGFX_Torizo+$90,X                                  ;A9E300;
    LDA.W Corpse.rotEntryYOffset                                         ;A9E303;
    CMP.W #$005E                                                         ;A9E306;
    BPL +                                                                ;A9E309;
    LDA.W CorpseRottingGFX_Torizo+$A0,X                                  ;A9E30B;
    STA.W CorpseRottingGFX_Torizo+$A2,Y                                  ;A9E30E;
    LDA.W CorpseRottingGFX_Torizo+$B0,X                                  ;A9E311;
    STA.W CorpseRottingGFX_Torizo+$B2,Y                                  ;A9E314;

+   STZ.W CorpseRottingGFX_Torizo+$A0,X                                  ;A9E317;
    STZ.W CorpseRottingGFX_Torizo+$B0,X                                  ;A9E31A;
    LDA.W Corpse.rotEntryYOffset                                         ;A9E31D;
    CMP.W #$005E                                                         ;A9E320;
    BPL +                                                                ;A9E323;
    LDA.W CorpseRottingGFX_Torizo+$C0,X                                  ;A9E325;
    STA.W CorpseRottingGFX_Torizo+$C2,Y                                  ;A9E328;
    LDA.W CorpseRottingGFX_Torizo+$D0,X                                  ;A9E32B;
    STA.W CorpseRottingGFX_Torizo+$D2,Y                                  ;A9E32E;

+   STZ.W CorpseRottingGFX_Torizo+$C0,X                                  ;A9E331;
    STZ.W CorpseRottingGFX_Torizo+$D0,X                                  ;A9E334;
    LDA.W Corpse.rotEntryYOffset                                         ;A9E337;
    CMP.W #$005E                                                         ;A9E33A;
    BPL +                                                                ;A9E33D;
    LDA.W CorpseRottingGFX_Torizo+$E0,X                                  ;A9E33F;
    STA.W CorpseRottingGFX_Torizo+$E2,Y                                  ;A9E342;
    LDA.W CorpseRottingGFX_Torizo+$F0,X                                  ;A9E345;
    STA.W CorpseRottingGFX_Torizo+$F2,Y                                  ;A9E348;

+   STZ.W CorpseRottingGFX_Torizo+$E0,X                                  ;A9E34B;
    STZ.W CorpseRottingGFX_Torizo+$F0,X                                  ;A9E34E;
    LDA.W Corpse.rotEntryYOffset                                         ;A9E351;
    CMP.W #$005E                                                         ;A9E354;
    BPL +                                                                ;A9E357;
    LDA.W CorpseRottingGFX_Torizo+$100,X                                 ;A9E359;
    STA.W CorpseRottingGFX_Torizo+$102,Y                                 ;A9E35C;
    LDA.W CorpseRottingGFX_Torizo+$110,X                                 ;A9E35F;
    STA.W CorpseRottingGFX_Torizo+$112,Y                                 ;A9E362;

+   STZ.W CorpseRottingGFX_Torizo+$100,X                                 ;A9E365;
    STZ.W CorpseRottingGFX_Torizo+$110,X                                 ;A9E368;
    LDA.W Corpse.rotEntryYOffset                                         ;A9E36B;
    CMP.W #$0010                                                         ;A9E36E;
    BCC .return                                                          ;A9E371;
    CMP.W #$005E                                                         ;A9E373;
    BPL +                                                                ;A9E376;
    LDA.W CorpseRottingGFX_Torizo+$120,X                                 ;A9E378;
    STA.W CorpseRottingGFX_Torizo+$122,Y                                 ;A9E37B;
    LDA.W CorpseRottingGFX_Torizo+$130,X                                 ;A9E37E;
    STA.W CorpseRottingGFX_Torizo+$132,Y                                 ;A9E381;

+   STZ.W CorpseRottingGFX_Torizo+$120,X                                 ;A9E384;
    STZ.W CorpseRottingGFX_Torizo+$130,X                                 ;A9E387;

  .return:
    RTS                                                                  ;A9E38A;


;;; $E38B: Corpse rotting rot entry copy function - torizo ;;;
CorpseRottingRotEntry_Copy_Torizo:
;; Parameters:
;;     X: Source pixel row tile data offset
;;     Y: Destination pixel row tile data offset

; DB must be $7E
; Copies a pixel row from source to one pixel down in dest

; Tile data calculations:
;     Tiles are 20h bytes
;
;     Pixel (x, y) of tile at pointer p is:
;           ([p + y * 2]       >> 7 - x & 1)
;         | ([p + y * 2 + 1]   >> 7 - x & 1) << 1
;         | ([p + y * 2 + 10h] >> 7 - x & 1) << 2
;         | ([p + y * 2 + 11h] >> 7 - x & 1) << 3
;
;     Hence, pixel row y of tile at pointer p is the bytes
;         [p + y * 2], [p + y * 2 + 1], [p + y * 2 + 10h], [p + y * 2 + 11h]

; Column 0 is only used by rows Ah..Bh
; Column 1 is only used by rows 9..Bh
; Column 2 is only used by rows 2..Bh
; Column 9 is only used by rows 2..Bh
; (See $B7:A800)
    LDA.W Corpse.rotEntryYOffset                                         ;A9E38B;
    CMP.W #$0050                                                         ;A9E38E;
    BCC +                                                                ;A9E391;
    CMP.W #$005E                                                         ;A9E393;
    BPL +                                                                ;A9E396;
    LDA.W CorpseRottingGFX_Torizo,X                                      ;A9E398;
    STA.W CorpseRottingGFX_Torizo+2,Y                                    ;A9E39B;
    LDA.W CorpseRottingGFX_Torizo+$10,X                                  ;A9E39E;
    STA.W CorpseRottingGFX_Torizo+$12,Y                                  ;A9E3A1;

+   LDA.W Corpse.rotEntryYOffset                                         ;A9E3A4;
    CMP.W #$0048                                                         ;A9E3A7;
    BCC +                                                                ;A9E3AA;
    CMP.W #$005E                                                         ;A9E3AC;
    BPL +                                                                ;A9E3AF;
    LDA.W CorpseRottingGFX_Torizo+$20,X                                  ;A9E3B1;
    STA.W CorpseRottingGFX_Torizo+$22,Y                                  ;A9E3B4;
    LDA.W CorpseRottingGFX_Torizo+$30,X                                  ;A9E3B7;
    STA.W CorpseRottingGFX_Torizo+$32,Y                                  ;A9E3BA;

+   LDA.W Corpse.rotEntryYOffset                                         ;A9E3BD;
    CMP.W #$0010                                                         ;A9E3C0;
    BCC +                                                                ;A9E3C3;
    CMP.W #$005E                                                         ;A9E3C5;
    BPL +                                                                ;A9E3C8;
    LDA.W CorpseRottingGFX_Torizo+$40,X                                  ;A9E3CA;
    STA.W CorpseRottingGFX_Torizo+$42,Y                                  ;A9E3CD;
    LDA.W CorpseRottingGFX_Torizo+$50,X                                  ;A9E3D0;
    STA.W CorpseRottingGFX_Torizo+$52,Y                                  ;A9E3D3;

+   LDA.W Corpse.rotEntryYOffset                                         ;A9E3D6;
    CMP.W #$005E                                                         ;A9E3D9;
    BPL +                                                                ;A9E3DC;
    LDA.W CorpseRottingGFX_Torizo+$60,X                                  ;A9E3DE;
    STA.W CorpseRottingGFX_Torizo+$62,Y                                  ;A9E3E1;
    LDA.W CorpseRottingGFX_Torizo+$70,X                                  ;A9E3E4;
    STA.W CorpseRottingGFX_Torizo+$72,Y                                  ;A9E3E7;

+   LDA.W Corpse.rotEntryYOffset                                         ;A9E3EA;
    CMP.W #$005E                                                         ;A9E3ED;
    BPL +                                                                ;A9E3F0;
    LDA.W CorpseRottingGFX_Torizo+$80,X                                  ;A9E3F2;
    STA.W CorpseRottingGFX_Torizo+$82,Y                                  ;A9E3F5;
    LDA.W CorpseRottingGFX_Torizo+$90,X                                  ;A9E3F8;
    STA.W CorpseRottingGFX_Torizo+$92,Y                                  ;A9E3FB;

+   LDA.W Corpse.rotEntryYOffset                                         ;A9E3FE;
    CMP.W #$005E                                                         ;A9E401;
    BPL +                                                                ;A9E404;
    LDA.W CorpseRottingGFX_Torizo+$A0,X                                  ;A9E406;
    STA.W CorpseRottingGFX_Torizo+$A2,Y                                  ;A9E409;
    LDA.W CorpseRottingGFX_Torizo+$B0,X                                  ;A9E40C;
    STA.W CorpseRottingGFX_Torizo+$B2,Y                                  ;A9E40F;

+   LDA.W Corpse.rotEntryYOffset                                         ;A9E412;
    CMP.W #$005E                                                         ;A9E415;
    BPL +                                                                ;A9E418;
    LDA.W CorpseRottingGFX_Torizo+$C0,X                                  ;A9E41A;
    STA.W CorpseRottingGFX_Torizo+$C2,Y                                  ;A9E41D;
    LDA.W CorpseRottingGFX_Torizo+$D0,X                                  ;A9E420;
    STA.W CorpseRottingGFX_Torizo+$D2,Y                                  ;A9E423;

+   LDA.W Corpse.rotEntryYOffset                                         ;A9E426;
    CMP.W #$005E                                                         ;A9E429;
    BPL +                                                                ;A9E42C;
    LDA.W CorpseRottingGFX_Torizo+$E0,X                                  ;A9E42E;
    STA.W CorpseRottingGFX_Torizo+$E2,Y                                  ;A9E431;
    LDA.W CorpseRottingGFX_Torizo+$F0,X                                  ;A9E434;
    STA.W CorpseRottingGFX_Torizo+$F2,Y                                  ;A9E437;

+   LDA.W Corpse.rotEntryYOffset                                         ;A9E43A;
    CMP.W #$005E                                                         ;A9E43D;
    BPL +                                                                ;A9E440;
    LDA.W CorpseRottingGFX_Torizo+$100,X                                 ;A9E442;
    STA.W CorpseRottingGFX_Torizo+$102,Y                                 ;A9E445;
    LDA.W CorpseRottingGFX_Torizo+$110,X                                 ;A9E448;
    STA.W CorpseRottingGFX_Torizo+$112,Y                                 ;A9E44B;

+   LDA.W Corpse.rotEntryYOffset                                         ;A9E44E;
    CMP.W #$0010                                                         ;A9E451;
    BCC .return                                                          ;A9E454;
    CMP.W #$005E                                                         ;A9E456;
    BPL .return                                                          ;A9E459;
    LDA.W CorpseRottingGFX_Torizo+$120,X                                 ;A9E45B;
    STA.W CorpseRottingGFX_Torizo+$122,Y                                 ;A9E45E;
    LDA.W CorpseRottingGFX_Torizo+$130,X                                 ;A9E461;
    STA.W CorpseRottingGFX_Torizo+$132,Y                                 ;A9E464;

  .return:
    RTS                                                                  ;A9E467;


;;; $E468: Corpse rotting rot entry move function - sidehopper - enemy parameter 1 = 0 ;;;
CorpseRottingRotEntry_Move_Sidehopper_Param1_0:
;; Parameters:
;;     X: Source pixel row tile data offset
;;     Y: Destination pixel row tile data offset

; DB must be $7E
; Clears pixel row in dest and copies a pixel row from source to one pixel down in dest

; Tile data calculations:
;     Tiles are 20h bytes
;
;     Pixel (x, y) of tile at pointer p is:
;           ([p + y * 2]       >> 7 - x & 1)
;         | ([p + y * 2 + 1]   >> 7 - x & 1) << 1
;         | ([p + y * 2 + 10h] >> 7 - x & 1) << 2
;         | ([p + y * 2 + 11h] >> 7 - x & 1) << 3
;
;     Hence, pixel row y of tile at pointer p is the bytes
;         [p + y * 2], [p + y * 2 + 1], [p + y * 2 + 10h], [p + y * 2 + 11h]
    LDA.W Corpse.rotEntryYOffset                                         ;A9E468;
    CMP.W #$0008                                                         ;A9E46B;
    BCC .column1                                                         ;A9E46E;
    CMP.W #$0026                                                         ;A9E470;
    BPL .offsetGreaterThan25                                             ;A9E473;
    LDA.W CorpseRottingGFX_Torizo,X                                      ;A9E475;
    STA.W CorpseRottingGFX_Torizo+2,Y                                    ;A9E478;
    LDA.W CorpseRottingGFX_Torizo+$10,X                                  ;A9E47B;
    STA.W CorpseRottingGFX_Torizo+$12,Y                                  ;A9E47E;

  .offsetGreaterThan25:
    STZ.W CorpseRottingGFX_Torizo,X                                      ;A9E481;
    STZ.W CorpseRottingGFX_Torizo+$10,X                                  ;A9E484;

  .column1:
    LDA.W Corpse.rotEntryYOffset                                         ;A9E487;
    CMP.W #$0008                                                         ;A9E48A;
    BCC .column2                                                         ;A9E48D;
    CMP.W #$0026                                                         ;A9E48F;
    BPL ..offsetGreaterThan25                                            ;A9E492;
    LDA.W CorpseRottingGFX_Torizo+$20,X                                  ;A9E494;
    STA.W CorpseRottingGFX_Torizo+$22,Y                                  ;A9E497;
    LDA.W CorpseRottingGFX_Torizo+$30,X                                  ;A9E49A;
    STA.W CorpseRottingGFX_Torizo+$32,Y                                  ;A9E49D;

  ..offsetGreaterThan25:
    STZ.W CorpseRottingGFX_Torizo+$20,X                                  ;A9E4A0;
    STZ.W CorpseRottingGFX_Torizo+$30,X                                  ;A9E4A3;

  .column2:
    LDA.W Corpse.rotEntryYOffset                                         ;A9E4A6;
    CMP.W #$0026                                                         ;A9E4A9;
    BPL +                                                                ;A9E4AC;
    LDA.W CorpseRottingGFX_Torizo+$40,X                                  ;A9E4AE;
    STA.W CorpseRottingGFX_Torizo+$42,Y                                  ;A9E4B1;
    LDA.W CorpseRottingGFX_Torizo+$50,X                                  ;A9E4B4;
    STA.W CorpseRottingGFX_Torizo+$52,Y                                  ;A9E4B7;

+   STZ.W CorpseRottingGFX_Torizo+$40,X                                  ;A9E4BA;
    STZ.W CorpseRottingGFX_Torizo+$50,X                                  ;A9E4BD;
    LDA.W Corpse.rotEntryYOffset                                         ;A9E4C0;
    CMP.W #$0026                                                         ;A9E4C3;
    BPL +                                                                ;A9E4C6;
    LDA.W CorpseRottingGFX_Torizo+$60,X                                  ;A9E4C8;
    STA.W CorpseRottingGFX_Torizo+$62,Y                                  ;A9E4CB;
    LDA.W CorpseRottingGFX_Torizo+$70,X                                  ;A9E4CE;
    STA.W CorpseRottingGFX_Torizo+$72,Y                                  ;A9E4D1;

+   STZ.W CorpseRottingGFX_Torizo+$60,X                                  ;A9E4D4;
    STZ.W CorpseRottingGFX_Torizo+$70,X                                  ;A9E4D7;
    LDA.W Corpse.rotEntryYOffset                                         ;A9E4DA;
    CMP.W #$0026                                                         ;A9E4DD;
    BPL +                                                                ;A9E4E0;
    LDA.W CorpseRottingGFX_Torizo+$80,X                                  ;A9E4E2;
    STA.W CorpseRottingGFX_Torizo+$82,Y                                  ;A9E4E5;
    LDA.W CorpseRottingGFX_Torizo+$90,X                                  ;A9E4E8;
    STA.W CorpseRottingGFX_Torizo+$92,Y                                  ;A9E4EB;

+   STZ.W CorpseRottingGFX_Torizo+$80,X                                  ;A9E4EE;
    STZ.W CorpseRottingGFX_Torizo+$90,X                                  ;A9E4F1;
    RTS                                                                  ;A9E4F4;


;;; $E4F5: Corpse rotting rot entry copy function - sidehopper - enemy parameter 1 = 0 ;;;
CorpseRottingRotEntry_Copy_Sidehopper_Param1_0:
;; Parameters:
;;     X: Source pixel row tile data offset
;;     Y: Destination pixel row tile data offset

; DB must be $7E
; Copies a pixel row from source to one pixel down in dest

; Tile data calculations:
;     Tiles are 20h bytes
;
;     Pixel (x, y) of tile at pointer p is:
;           ([p + y * 2]       >> 7 - x & 1)
;         | ([p + y * 2 + 1]   >> 7 - x & 1) << 1
;         | ([p + y * 2 + 10h] >> 7 - x & 1) << 2
;         | ([p + y * 2 + 11h] >> 7 - x & 1) << 3
;
;     Hence, pixel row y of tile at pointer p is the bytes
;         [p + y * 2], [p + y * 2 + 1], [p + y * 2 + 10h], [p + y * 2 + 11h]
    LDA.W Corpse.rotEntryYOffset                                         ;A9E4F5;
    CMP.W #$0008                                                         ;A9E4F8;
    BCC +                                                                ;A9E4FB;
    CMP.W #$0026                                                         ;A9E4FD;
    BPL +                                                                ;A9E500;
    LDA.W CorpseRottingGFX_Sidehopper0,X                                 ;A9E502;
    STA.W CorpseRottingGFX_Sidehopper0+2,Y                               ;A9E505;
    LDA.W CorpseRottingGFX_Sidehopper0+$10,X                             ;A9E508;
    STA.W CorpseRottingGFX_Sidehopper0+$12,Y                             ;A9E50B;

+   LDA.W Corpse.rotEntryYOffset                                         ;A9E50E;
    CMP.W #$0008                                                         ;A9E511;
    BCC +                                                                ;A9E514;
    CMP.W #$0026                                                         ;A9E516;
    BPL +                                                                ;A9E519;
    LDA.W CorpseRottingGFX_Sidehopper0+$20,X                             ;A9E51B;
    STA.W CorpseRottingGFX_Sidehopper0+$22,Y                             ;A9E51E;
    LDA.W CorpseRottingGFX_Sidehopper0+$30,X                             ;A9E521;
    STA.W CorpseRottingGFX_Sidehopper0+$32,Y                             ;A9E524;

+   LDA.W Corpse.rotEntryYOffset                                         ;A9E527;
    CMP.W #$0026                                                         ;A9E52A;
    BPL +                                                                ;A9E52D;
    LDA.W CorpseRottingGFX_Sidehopper0+$40,X                             ;A9E52F;
    STA.W CorpseRottingGFX_Sidehopper0+$42,Y                             ;A9E532;
    LDA.W CorpseRottingGFX_Sidehopper0+$50,X                             ;A9E535;
    STA.W CorpseRottingGFX_Sidehopper0+$52,Y                             ;A9E538;

+   LDA.W Corpse.rotEntryYOffset                                         ;A9E53B;
    CMP.W #$0026                                                         ;A9E53E;
    BPL +                                                                ;A9E541;
    LDA.W CorpseRottingGFX_Sidehopper0+$60,X                             ;A9E543;
    STA.W CorpseRottingGFX_Sidehopper0+$62,Y                             ;A9E546;
    LDA.W CorpseRottingGFX_Sidehopper0+$70,X                             ;A9E549;
    STA.W CorpseRottingGFX_Sidehopper0+$72,Y                             ;A9E54C;

+   LDA.W Corpse.rotEntryYOffset                                         ;A9E54F;
    CMP.W #$0026                                                         ;A9E552;
    BPL .return                                                          ;A9E555;
    LDA.W CorpseRottingGFX_Sidehopper0+$80,X                             ;A9E557;
    STA.W CorpseRottingGFX_Sidehopper0+$82,Y                             ;A9E55A;
    LDA.W CorpseRottingGFX_Sidehopper0+$90,X                             ;A9E55D;
    STA.W CorpseRottingGFX_Sidehopper0+$92,Y                             ;A9E560;

  .return:
    RTS                                                                  ;A9E563;


;;; $E564: Corpse rotting rot entry move function - sidehopper - enemy parameter 1 = 2 ;;;
CorpseRottingRotEntry_Move_Sidehopper_Param1_2:
;; Parameters:
;;     X: Source pixel row tile data offset
;;     Y: Destination pixel row tile data offset

; DB must be $7E
; Clears pixel row in dest and copies a pixel row from source to one pixel down in dest

; Tile data calculations:
;     Tiles are 20h bytes
;
;     Pixel (x, y) of tile at pointer p is:
;           ([p + y * 2]       >> 7 - x & 1)
;         | ([p + y * 2 + 1]   >> 7 - x & 1) << 1
;         | ([p + y * 2 + 10h] >> 7 - x & 1) << 2
;         | ([p + y * 2 + 11h] >> 7 - x & 1) << 3
;
;     Hence, pixel row y of tile at pointer p is the bytes
;         [p + y * 2], [p + y * 2 + 1], [p + y * 2 + 10h], [p + y * 2 + 11h]
    LDA.W Corpse.rotEntryYOffset                                         ;A9E564;
    CMP.W #$0026                                                         ;A9E567;
    BPL +                                                                ;A9E56A;
    LDA.W CorpseRottingGFX_Sidehopper2,X                                 ;A9E56C;
    STA.W CorpseRottingGFX_Sidehopper2+2,Y                               ;A9E56F;
    LDA.W CorpseRottingGFX_Sidehopper2+$10,X                             ;A9E572;
    STA.W CorpseRottingGFX_Sidehopper2+$12,Y                             ;A9E575;

+   STZ.W CorpseRottingGFX_Sidehopper2,X                                 ;A9E578;
    STZ.W CorpseRottingGFX_Sidehopper2+$10,X                             ;A9E57B;
    LDA.W Corpse.rotEntryYOffset                                         ;A9E57E;
    CMP.W #$0026                                                         ;A9E581;
    BPL +                                                                ;A9E584;
    LDA.W CorpseRottingGFX_Sidehopper2+$20,X                             ;A9E586;
    STA.W CorpseRottingGFX_Sidehopper2+$22,Y                             ;A9E589;
    LDA.W CorpseRottingGFX_Sidehopper2+$30,X                             ;A9E58C;
    STA.W CorpseRottingGFX_Sidehopper2+$32,Y                             ;A9E58F;

+   STZ.W CorpseRottingGFX_Sidehopper2+$20,X                             ;A9E592;
    STZ.W CorpseRottingGFX_Sidehopper2+$30,X                             ;A9E595;
    LDA.W Corpse.rotEntryYOffset                                         ;A9E598;
    CMP.W #$0008                                                         ;A9E59B;
    BCC .column3                                                         ;A9E59E;
    CMP.W #$0026                                                         ;A9E5A0;
    BPL +                                                                ;A9E5A3;
    LDA.W CorpseRottingGFX_Sidehopper2+$40,X                             ;A9E5A5;
    STA.W CorpseRottingGFX_Sidehopper2+$42,Y                             ;A9E5A8;
    LDA.W CorpseRottingGFX_Sidehopper2+$50,X                             ;A9E5AB;
    STA.W CorpseRottingGFX_Sidehopper2+$52,Y                             ;A9E5AE;

+   STZ.W CorpseRottingGFX_Sidehopper2+$40,X                             ;A9E5B1;
    STZ.W CorpseRottingGFX_Sidehopper2+$50,X                             ;A9E5B4;

  .column3:
    LDA.W Corpse.rotEntryYOffset                                         ;A9E5B7;
    CMP.W #$0008                                                         ;A9E5BA;
    BCC .column4                                                         ;A9E5BD;
    CMP.W #$0026                                                         ;A9E5BF;
    BPL +                                                                ;A9E5C2;
    LDA.W CorpseRottingGFX_Sidehopper2+$60,X                             ;A9E5C4;
    STA.W CorpseRottingGFX_Sidehopper2+$62,Y                             ;A9E5C7;
    LDA.W CorpseRottingGFX_Sidehopper2+$70,X                             ;A9E5CA;
    STA.W CorpseRottingGFX_Sidehopper2+$72,Y                             ;A9E5CD;

+   STZ.W CorpseRottingGFX_Sidehopper2+$60,X                             ;A9E5D0;
    STZ.W CorpseRottingGFX_Sidehopper2+$70,X                             ;A9E5D3;

  .column4:
    LDA.W Corpse.rotEntryYOffset                                         ;A9E5D6;
    CMP.W #$0008                                                         ;A9E5D9;
    BCC .return                                                          ;A9E5DC;
    CMP.W #$0026                                                         ;A9E5DE;
    BPL +                                                                ;A9E5E1;
    LDA.W CorpseRottingGFX_Sidehopper2+$80,X                             ;A9E5E3;
    STA.W CorpseRottingGFX_Sidehopper2+$82,Y                             ;A9E5E6;
    LDA.W CorpseRottingGFX_Sidehopper2+$90,X                             ;A9E5E9;
    STA.W CorpseRottingGFX_Sidehopper2+$92,Y                             ;A9E5EC;

+   STZ.W CorpseRottingGFX_Sidehopper2+$80,X                             ;A9E5EF;
    STZ.W CorpseRottingGFX_Sidehopper2+$90,X                             ;A9E5F2;

  .return:
    RTS                                                                  ;A9E5F5;


;;; $E5F6: Corpse rotting rot entry copy function - sidehopper - enemy parameter 1 = 2 ;;;
CorpseRottingRotEntry_Copy_Sidehopper_Param1_2:
;; Parameters:
;;     X: Source pixel row tile data offset
;;     Y: Destination pixel row tile data offset

; DB must be $7E
; Copies a pixel row from source to one pixel down in dest

; Tile data calculations:
;     Tiles are 20h bytes
;
;     Pixel (x, y) of tile at pointer p is:
;           ([p + y * 2]       >> 7 - x & 1)
;         | ([p + y * 2 + 1]   >> 7 - x & 1) << 1
;         | ([p + y * 2 + 10h] >> 7 - x & 1) << 2
;         | ([p + y * 2 + 11h] >> 7 - x & 1) << 3
;
;     Hence, pixel row y of tile at pointer p is the bytes
;         [p + y * 2], [p + y * 2 + 1], [p + y * 2 + 10h], [p + y * 2 + 11h]
    LDA.W Corpse.rotEntryYOffset                                         ;A9E5F6;
    CMP.W #$0026                                                         ;A9E5F9;
    BPL +                                                                ;A9E5FC;
    LDA.W CorpseRottingGFX_Sidehopper2,X                                 ;A9E5FE;
    STA.W CorpseRottingGFX_Sidehopper2+2,Y                               ;A9E601;
    LDA.W CorpseRottingGFX_Sidehopper2+$10,X                             ;A9E604;
    STA.W CorpseRottingGFX_Sidehopper2+$12,Y                             ;A9E607;

+   LDA.W Corpse.rotEntryYOffset                                         ;A9E60A;
    CMP.W #$0026                                                         ;A9E60D;
    BPL +                                                                ;A9E610;
    LDA.W CorpseRottingGFX_Sidehopper2+$20,X                             ;A9E612;
    STA.W CorpseRottingGFX_Sidehopper2+$22,Y                             ;A9E615;
    LDA.W CorpseRottingGFX_Sidehopper2+$30,X                             ;A9E618;
    STA.W CorpseRottingGFX_Sidehopper2+$32,Y                             ;A9E61B;

+   LDA.W Corpse.rotEntryYOffset                                         ;A9E61E;
    CMP.W #$0008                                                         ;A9E621;
    BCC +                                                                ;A9E624;
    CMP.W #$0026                                                         ;A9E626;
    BPL +                                                                ;A9E629;
    LDA.W CorpseRottingGFX_Sidehopper2+$40,X                             ;A9E62B;
    STA.W CorpseRottingGFX_Sidehopper2+$42,Y                             ;A9E62E;
    LDA.W CorpseRottingGFX_Sidehopper2+$50,X                             ;A9E631;
    STA.W CorpseRottingGFX_Sidehopper2+$52,Y                             ;A9E634;

+   LDA.W Corpse.rotEntryYOffset                                         ;A9E637;
    CMP.W #$0008                                                         ;A9E63A;
    BCC +                                                                ;A9E63D;
    CMP.W #$0026                                                         ;A9E63F;
    BPL +                                                                ;A9E642;
    LDA.W CorpseRottingGFX_Sidehopper2+$60,X                             ;A9E644;
    STA.W CorpseRottingGFX_Sidehopper2+$62,Y                             ;A9E647;
    LDA.W CorpseRottingGFX_Sidehopper2+$70,X                             ;A9E64A;
    STA.W CorpseRottingGFX_Sidehopper2+$72,Y                             ;A9E64D;

+   LDA.W Corpse.rotEntryYOffset                                         ;A9E650;
    CMP.W #$0008                                                         ;A9E653;
    BCC .return                                                          ;A9E656;
    CMP.W #$0026                                                         ;A9E658;
    BPL .return                                                          ;A9E65B;
    LDA.W CorpseRottingGFX_Sidehopper2+$80,X                             ;A9E65D;
    STA.W CorpseRottingGFX_Sidehopper2+$82,Y                             ;A9E660;
    LDA.W CorpseRottingGFX_Sidehopper2+$90,X                             ;A9E663;
    STA.W CorpseRottingGFX_Sidehopper2+$92,Y                             ;A9E666;

  .return:
    RTS                                                                  ;A9E669;


;;; $E66A: Corpse rotting rot entry move function - zoomer - enemy parameter 1 = 0 ;;;
CorpseRottingRotEntry_Move_Zoomer_Param1_0:
;; Parameters:
;;     X: Source pixel row tile data offset
;;     Y: Destination pixel row tile data offset

; DB must be $7E
; Clears pixel row in dest and copies a pixel row from source to one pixel down in dest

; Tile data calculations:
;     Tiles are 20h bytes
;
;     Pixel (x, y) of tile at pointer p is:
;           ([p + y * 2]       >> 7 - x & 1)
;         | ([p + y * 2 + 1]   >> 7 - x & 1) << 1
;         | ([p + y * 2 + 10h] >> 7 - x & 1) << 2
;         | ([p + y * 2 + 11h] >> 7 - x & 1) << 3
;
;     Hence, pixel row y of tile at pointer p is the bytes
;         [p + y * 2], [p + y * 2 + 1], [p + y * 2 + 10h], [p + y * 2 + 11h]
    LDA.W Corpse.rotEntryYOffset                                         ;A9E66A;
    CMP.W #$000E                                                         ;A9E66D;
    BPL +                                                                ;A9E670;
    LDA.W CorpseRottingGFX_Zoomer0,X                                     ;A9E672;
    STA.W CorpseRottingGFX_Zoomer0+2,Y                                   ;A9E675;
    LDA.W CorpseRottingGFX_Zoomer0+$10,X                                 ;A9E678;
    STA.W CorpseRottingGFX_Zoomer0+$12,Y                                 ;A9E67B;

+   STZ.W CorpseRottingGFX_Zoomer0,X                                     ;A9E67E;
    STZ.W CorpseRottingGFX_Zoomer0+$10,X                                 ;A9E681;
    LDA.W Corpse.rotEntryYOffset                                         ;A9E684;
    CMP.W #$000E                                                         ;A9E687;
    BPL +                                                                ;A9E68A;
    LDA.W CorpseRottingGFX_Zoomer0+$20,X                                 ;A9E68C;
    STA.W CorpseRottingGFX_Zoomer0+$22,Y                                 ;A9E68F;
    LDA.W CorpseRottingGFX_Zoomer0+$30,X                                 ;A9E692;
    STA.W CorpseRottingGFX_Zoomer0+$32,Y                                 ;A9E695;

+   STZ.W CorpseRottingGFX_Zoomer0+$20,X                                 ;A9E698;
    STZ.W CorpseRottingGFX_Zoomer0+$30,X                                 ;A9E69B;
    LDA.W Corpse.rotEntryYOffset                                         ;A9E69E;
    CMP.W #$000E                                                         ;A9E6A1;
    BPL +                                                                ;A9E6A4;
    LDA.W CorpseRottingGFX_Zoomer0+$40,X                                 ;A9E6A6;
    STA.W CorpseRottingGFX_Zoomer0+$42,Y                                 ;A9E6A9;
    LDA.W CorpseRottingGFX_Zoomer0+$50,X                                 ;A9E6AC;
    STA.W CorpseRottingGFX_Zoomer0+$52,Y                                 ;A9E6AF;

+   STZ.W CorpseRottingGFX_Zoomer0+$40,X                                 ;A9E6B2;
    STZ.W CorpseRottingGFX_Zoomer0+$50,X                                 ;A9E6B5;
    RTS                                                                  ;A9E6B8;


;;; $E6B9: Corpse rotting rot entry copy function - zoomer - enemy parameter 1 = 0 ;;;
CorpseRottingRotEntry_Copy_Zoomer_Param1_0:
;; Parameters:
;;     X: Source pixel row tile data offset
;;     Y: Destination pixel row tile data offset

; DB must be $7E
; Copies a pixel row from source to one pixel down in dest

; Tile data calculations:
;     Tiles are 20h bytes
;
;     Pixel (x, y) of tile at pointer p is:
;           ([p + y * 2]       >> 7 - x & 1)
;         | ([p + y * 2 + 1]   >> 7 - x & 1) << 1
;         | ([p + y * 2 + 10h] >> 7 - x & 1) << 2
;         | ([p + y * 2 + 11h] >> 7 - x & 1) << 3
;
;     Hence, pixel row y of tile at pointer p is the bytes
;         [p + y * 2], [p + y * 2 + 1], [p + y * 2 + 10h], [p + y * 2 + 11h]
    LDA.W Corpse.rotEntryYOffset                                         ;A9E6B9;
    CMP.W #$000E                                                         ;A9E6BC;
    BPL +                                                                ;A9E6BF;
    LDA.W CorpseRottingGFX_Zoomer0,X                                     ;A9E6C1;
    STA.W CorpseRottingGFX_Zoomer0+2,Y                                   ;A9E6C4;
    LDA.W CorpseRottingGFX_Zoomer0+$10,X                                 ;A9E6C7;
    STA.W CorpseRottingGFX_Zoomer0+$12,Y                                 ;A9E6CA;

+   LDA.W Corpse.rotEntryYOffset                                         ;A9E6CD;
    CMP.W #$000E                                                         ;A9E6D0;
    BPL +                                                                ;A9E6D3;
    LDA.W CorpseRottingGFX_Zoomer0+$20,X                                 ;A9E6D5;
    STA.W CorpseRottingGFX_Zoomer0+$22,Y                                 ;A9E6D8;
    LDA.W CorpseRottingGFX_Zoomer0+$30,X                                 ;A9E6DB;
    STA.W CorpseRottingGFX_Zoomer0+$32,Y                                 ;A9E6DE;

+   LDA.W Corpse.rotEntryYOffset                                         ;A9E6E1;
    CMP.W #$000E                                                         ;A9E6E4;
    BPL .return                                                          ;A9E6E7;
    LDA.W CorpseRottingGFX_Zoomer0+$40,X                                 ;A9E6E9;
    STA.W CorpseRottingGFX_Zoomer0+$42,Y                                 ;A9E6EC;
    LDA.W CorpseRottingGFX_Zoomer0+$50,X                                 ;A9E6EF;
    STA.W CorpseRottingGFX_Zoomer0+$52,Y                                 ;A9E6F2;

  .return:
    RTS                                                                  ;A9E6F5;


;;; $E6F6: Corpse rotting rot entry move function - zoomer - enemy parameter 1 = 2 ;;;
CorpseRottingRotEntry_Move_Zoomer_Param1_2:
;; Parameters:
;;     X: Source pixel row tile data offset
;;     Y: Destination pixel row tile data offset

; DB must be $7E
; Clears pixel row in dest and copies a pixel row from source to one pixel down in dest

; Tile data calculations:
;     Tiles are 20h bytes
;
;     Pixel (x, y) of tile at pointer p is:
;           ([p + y * 2]       >> 7 - x & 1)
;         | ([p + y * 2 + 1]   >> 7 - x & 1) << 1
;         | ([p + y * 2 + 10h] >> 7 - x & 1) << 2
;         | ([p + y * 2 + 11h] >> 7 - x & 1) << 3
;
;     Hence, pixel row y of tile at pointer p is the bytes
;         [p + y * 2], [p + y * 2 + 1], [p + y * 2 + 10h], [p + y * 2 + 11h]
    LDA.W Corpse.rotEntryYOffset                                         ;A9E6F6;
    CMP.W #$000E                                                         ;A9E6F9;
    BPL +                                                                ;A9E6FC;
    LDA.W CorpseRottingGFX_Zoomer2,X                                     ;A9E6FE;
    STA.W CorpseRottingGFX_Zoomer2+2,Y                                   ;A9E701;
    LDA.W CorpseRottingGFX_Zoomer2+$10,X                                 ;A9E704;
    STA.W CorpseRottingGFX_Zoomer2+$12,Y                                 ;A9E707;

+   STZ.W CorpseRottingGFX_Zoomer2,X                                     ;A9E70A;
    STZ.W CorpseRottingGFX_Zoomer2+$10,X                                 ;A9E70D;
    LDA.W Corpse.rotEntryYOffset                                         ;A9E710;
    CMP.W #$000E                                                         ;A9E713;
    BPL +                                                                ;A9E716;
    LDA.W CorpseRottingGFX_Zoomer2+$20,X                                 ;A9E718;
    STA.W CorpseRottingGFX_Zoomer2+$22,Y                                 ;A9E71B;
    LDA.W CorpseRottingGFX_Zoomer2+$30,X                                 ;A9E71E;
    STA.W CorpseRottingGFX_Zoomer2+$32,Y                                 ;A9E721;

+   STZ.W CorpseRottingGFX_Zoomer2+$20,X                                 ;A9E724;
    STZ.W CorpseRottingGFX_Zoomer2+$30,X                                 ;A9E727;
    LDA.W Corpse.rotEntryYOffset                                         ;A9E72A;
    CMP.W #$000E                                                         ;A9E72D;
    BPL +                                                                ;A9E730;
    LDA.W CorpseRottingGFX_Zoomer2+$40,X                                 ;A9E732;
    STA.W CorpseRottingGFX_Zoomer2+$42,Y                                 ;A9E735;
    LDA.W CorpseRottingGFX_Zoomer2+$50,X                                 ;A9E738;
    STA.W CorpseRottingGFX_Zoomer2+$52,Y                                 ;A9E73B;

+   STZ.W CorpseRottingGFX_Zoomer2+$40,X                                 ;A9E73E;
    STZ.W CorpseRottingGFX_Zoomer2+$50,X                                 ;A9E741;
    RTS                                                                  ;A9E744;


;;; $E745: Corpse rotting rot entry copy function - zoomer - enemy parameter 1 = 2 ;;;
CorpseRottingRotEntry_Copy_Zoomer_Param1_2:
;; Parameters:
;;     X: Source pixel row tile data offset
;;     Y: Destination pixel row tile data offset

; DB must be $7E
; Copies a pixel row from source to one pixel down in dest

; Tile data calculations:
;     Tiles are 20h bytes
;
;     Pixel (x, y) of tile at pointer p is:
;           ([p + y * 2]       >> 7 - x & 1)
;         | ([p + y * 2 + 1]   >> 7 - x & 1) << 1
;         | ([p + y * 2 + 10h] >> 7 - x & 1) << 2
;         | ([p + y * 2 + 11h] >> 7 - x & 1) << 3
;
;     Hence, pixel row y of tile at pointer p is the bytes
;         [p + y * 2], [p + y * 2 + 1], [p + y * 2 + 10h], [p + y * 2 + 11h]
    LDA.W Corpse.rotEntryYOffset                                         ;A9E745;
    CMP.W #$000E                                                         ;A9E748;
    BPL +                                                                ;A9E74B;
    LDA.W CorpseRottingGFX_Zoomer2,X                                     ;A9E74D;
    STA.W CorpseRottingGFX_Zoomer2+2,Y                                   ;A9E750;
    LDA.W CorpseRottingGFX_Zoomer2+$10,X                                 ;A9E753;
    STA.W CorpseRottingGFX_Zoomer2+$12,Y                                 ;A9E756;

+   LDA.W Corpse.rotEntryYOffset                                         ;A9E759;
    CMP.W #$000E                                                         ;A9E75C;
    BPL +                                                                ;A9E75F;
    LDA.W CorpseRottingGFX_Zoomer2+$20,X                                 ;A9E761;
    STA.W CorpseRottingGFX_Zoomer2+$22,Y                                 ;A9E764;
    LDA.W CorpseRottingGFX_Zoomer2+$30,X                                 ;A9E767;
    STA.W CorpseRottingGFX_Zoomer2+$32,Y                                 ;A9E76A;

+   LDA.W Corpse.rotEntryYOffset                                         ;A9E76D;
    CMP.W #$000E                                                         ;A9E770;
    BPL .return                                                          ;A9E773;
    LDA.W CorpseRottingGFX_Zoomer2+$40,X                                 ;A9E775;
    STA.W CorpseRottingGFX_Zoomer2+$42,Y                                 ;A9E778;
    LDA.W CorpseRottingGFX_Zoomer2+$50,X                                 ;A9E77B;
    STA.W CorpseRottingGFX_Zoomer2+$52,Y                                 ;A9E77E;

  .return:
    RTS                                                                  ;A9E781;


;;; $E782: Corpse rotting rot entry move function - zoomer - enemy parameter 1 = 4 ;;;
CorpseRottingRotEntry_Move_Zoomer_Param1_4:
;; Parameters:
;;     X: Source pixel row tile data offset
;;     Y: Destination pixel row tile data offset

; DB must be $7E
; Clears pixel row in dest and copies a pixel row from source to one pixel down in dest

; Tile data calculations:
;     Tiles are 20h bytes
;
;     Pixel (x, y) of tile at pointer p is:
;           ([p + y * 2]       >> 7 - x & 1)
;         | ([p + y * 2 + 1]   >> 7 - x & 1) << 1
;         | ([p + y * 2 + 10h] >> 7 - x & 1) << 2
;         | ([p + y * 2 + 11h] >> 7 - x & 1) << 3
;
;     Hence, pixel row y of tile at pointer p is the bytes
;         [p + y * 2], [p + y * 2 + 1], [p + y * 2 + 10h], [p + y * 2 + 11h]
    LDA.W Corpse.rotEntryYOffset                                         ;A9E782;
    CMP.W #$000E                                                         ;A9E785;
    BPL +                                                                ;A9E788;
    LDA.W CorpseRottingGFX_Zoomer4,X                                     ;A9E78A;
    STA.W CorpseRottingGFX_Zoomer4+2,Y                                   ;A9E78D;
    LDA.W CorpseRottingGFX_Zoomer4+$10,X                                 ;A9E790;
    STA.W CorpseRottingGFX_Zoomer4+$12,Y                                 ;A9E793;

+   STZ.W CorpseRottingGFX_Zoomer4,X                                     ;A9E796;
    STZ.W CorpseRottingGFX_Zoomer4+$10,X                                 ;A9E799;
    LDA.W Corpse.rotEntryYOffset                                         ;A9E79C;
    CMP.W #$000E                                                         ;A9E79F;
    BPL +                                                                ;A9E7A2;
    LDA.W CorpseRottingGFX_Zoomer4+$20,X                                 ;A9E7A4;
    STA.W CorpseRottingGFX_Zoomer4+$22,Y                                 ;A9E7A7;
    LDA.W CorpseRottingGFX_Zoomer4+$30,X                                 ;A9E7AA;
    STA.W CorpseRottingGFX_Zoomer4+$32,Y                                 ;A9E7AD;

+   STZ.W CorpseRottingGFX_Zoomer4+$20,X                                 ;A9E7B0;
    STZ.W CorpseRottingGFX_Zoomer4+$30,X                                 ;A9E7B3;
    LDA.W Corpse.rotEntryYOffset                                         ;A9E7B6;
    CMP.W #$000E                                                         ;A9E7B9;
    BPL +                                                                ;A9E7BC;
    LDA.W CorpseRottingGFX_Zoomer4+$40,X                                 ;A9E7BE;
    STA.W CorpseRottingGFX_Zoomer4+$42,Y                                 ;A9E7C1;
    LDA.W CorpseRottingGFX_Zoomer4+$50,X                                 ;A9E7C4;
    STA.W CorpseRottingGFX_Zoomer4+$52,Y                                 ;A9E7C7;

+   STZ.W CorpseRottingGFX_Zoomer4+$40,X                                 ;A9E7CA;
    STZ.W CorpseRottingGFX_Zoomer4+$50,X                                 ;A9E7CD;
    RTS                                                                  ;A9E7D0;


;;; $E7D1: Corpse rotting rot entry copy function - zoomer - enemy parameter 1 = 4 ;;;
CorpseRottingRotEntry_Copy_Zoomer_Param1_4:
;; Parameters:
;;     X: Source pixel row tile data offset
;;     Y: Destination pixel row tile data offset

; DB must be $7E
; Copies a pixel row from source to one pixel down in dest

; Tile data calculations:
;     Tiles are 20h bytes
;
;     Pixel (x, y) of tile at pointer p is:
;           ([p + y * 2]       >> 7 - x & 1)
;         | ([p + y * 2 + 1]   >> 7 - x & 1) << 1
;         | ([p + y * 2 + 10h] >> 7 - x & 1) << 2
;         | ([p + y * 2 + 11h] >> 7 - x & 1) << 3
;
;     Hence, pixel row y of tile at pointer p is the bytes
;         [p + y * 2], [p + y * 2 + 1], [p + y * 2 + 10h], [p + y * 2 + 11h]
    LDA.W Corpse.rotEntryYOffset                                         ;A9E7D1;
    CMP.W #$000E                                                         ;A9E7D4;
    BPL +                                                                ;A9E7D7;
    LDA.W CorpseRottingGFX_Zoomer4,X                                     ;A9E7D9;
    STA.W CorpseRottingGFX_Zoomer4+2,Y                                   ;A9E7DC;
    LDA.W CorpseRottingGFX_Zoomer4+$10,X                                 ;A9E7DF;
    STA.W CorpseRottingGFX_Zoomer4+$12,Y                                 ;A9E7E2;

+   LDA.W Corpse.rotEntryYOffset                                         ;A9E7E5;
    CMP.W #$000E                                                         ;A9E7E8;
    BPL +                                                                ;A9E7EB;
    LDA.W CorpseRottingGFX_Zoomer4+$20,X                                 ;A9E7ED;
    STA.W CorpseRottingGFX_Zoomer4+$22,Y                                 ;A9E7F0;
    LDA.W CorpseRottingGFX_Zoomer4+$30,X                                 ;A9E7F3;
    STA.W CorpseRottingGFX_Zoomer4+$32,Y                                 ;A9E7F6;

+   LDA.W Corpse.rotEntryYOffset                                         ;A9E7F9;
    CMP.W #$000E                                                         ;A9E7FC;
    BPL .return                                                          ;A9E7FF;
    LDA.W CorpseRottingGFX_Zoomer4+$40,X                                 ;A9E801;
    STA.W CorpseRottingGFX_Zoomer4+$42,Y                                 ;A9E804;
    LDA.W CorpseRottingGFX_Zoomer4+$50,X                                 ;A9E807;
    STA.W CorpseRottingGFX_Zoomer4+$52,Y                                 ;A9E80A;

  .return:
    RTS                                                                  ;A9E80D;


;;; $E80E: Corpse rotting rot entry move function - ripper - enemy parameter 1 = 0 ;;;
CorpseRottingRotEntry_Move_Ripper_Param1_0:
;; Parameters:
;;     X: Source pixel row tile data offset
;;     Y: Destination pixel row tile data offset

; DB must be $7E
; Clears pixel row in dest and copies a pixel row from source to one pixel down in dest

; Tile data calculations:
;     Tiles are 20h bytes
;
;     Pixel (x, y) of tile at pointer p is:
;           ([p + y * 2]       >> 7 - x & 1)
;         | ([p + y * 2 + 1]   >> 7 - x & 1) << 1
;         | ([p + y * 2 + 10h] >> 7 - x & 1) << 2
;         | ([p + y * 2 + 11h] >> 7 - x & 1) << 3
;
;     Hence, pixel row y of tile at pointer p is the bytes
;         [p + y * 2], [p + y * 2 + 1], [p + y * 2 + 10h], [p + y * 2 + 11h]
    LDA.W Corpse.rotEntryYOffset                                         ;A9E80E;
    CMP.W #$000E                                                         ;A9E811;
    BPL +                                                                ;A9E814;
    LDA.W CorpseRottingGFX_Ripper0,X                                     ;A9E816;
    STA.W CorpseRottingGFX_Ripper0+2,Y                                   ;A9E819;
    LDA.W CorpseRottingGFX_Ripper0+$10,X                                 ;A9E81C;
    STA.W CorpseRottingGFX_Ripper0+$12,Y                                 ;A9E81F;

+   STZ.W CorpseRottingGFX_Ripper0,X                                     ;A9E822;
    STZ.W CorpseRottingGFX_Ripper0+$10,X                                 ;A9E825;
    LDA.W Corpse.rotEntryYOffset                                         ;A9E828;
    CMP.W #$000E                                                         ;A9E82B;
    BPL +                                                                ;A9E82E;
    LDA.W CorpseRottingGFX_Ripper0+$20,X                                 ;A9E830;
    STA.W CorpseRottingGFX_Ripper0+$22,Y                                 ;A9E833;
    LDA.W CorpseRottingGFX_Ripper0+$30,X                                 ;A9E836;
    STA.W CorpseRottingGFX_Ripper0+$32,Y                                 ;A9E839;

+   STZ.W CorpseRottingGFX_Ripper0+$20,X                                 ;A9E83C;
    STZ.W CorpseRottingGFX_Ripper0+$30,X                                 ;A9E83F;
    LDA.W Corpse.rotEntryYOffset                                         ;A9E842;
    CMP.W #$000E                                                         ;A9E845;
    BPL +                                                                ;A9E848;
    LDA.W CorpseRottingGFX_Ripper0+$40,X                                 ;A9E84A;
    STA.W CorpseRottingGFX_Ripper0+$42,Y                                 ;A9E84D;
    LDA.W CorpseRottingGFX_Ripper0+$50,X                                 ;A9E850;
    STA.W CorpseRottingGFX_Ripper0+$52,Y                                 ;A9E853;

+   STZ.W CorpseRottingGFX_Ripper0+$40,X                                 ;A9E856;
    STZ.W CorpseRottingGFX_Ripper0+$50,X                                 ;A9E859;
    RTS                                                                  ;A9E85C;


;;; $E85D: Corpse rotting rot entry copy function - ripper - enemy parameter 1 = 0 ;;;
CorpseRottingRotEntry_Copy_Ripper_Param1_0:
;; Parameters:
;;     X: Source pixel row tile data offset
;;     Y: Destination pixel row tile data offset

; DB must be $7E
; Copies a pixel row from source to one pixel down in dest

; Tile data calculations:
;     Tiles are 20h bytes
;
;     Pixel (x, y) of tile at pointer p is:
;           ([p + y * 2]       >> 7 - x & 1)
;         | ([p + y * 2 + 1]   >> 7 - x & 1) << 1
;         | ([p + y * 2 + 10h] >> 7 - x & 1) << 2
;         | ([p + y * 2 + 11h] >> 7 - x & 1) << 3
;
;     Hence, pixel row y of tile at pointer p is the bytes
;         [p + y * 2], [p + y * 2 + 1], [p + y * 2 + 10h], [p + y * 2 + 11h]
    LDA.W Corpse.rotEntryYOffset                                         ;A9E85D;
    CMP.W #$000E                                                         ;A9E860;
    BPL +                                                                ;A9E863;
    LDA.W CorpseRottingGFX_Ripper0,X                                     ;A9E865;
    STA.W CorpseRottingGFX_Ripper0+2,Y                                   ;A9E868;
    LDA.W CorpseRottingGFX_Ripper0+$10,X                                 ;A9E86B;
    STA.W CorpseRottingGFX_Ripper0+$12,Y                                 ;A9E86E;

+   LDA.W Corpse.rotEntryYOffset                                         ;A9E871;
    CMP.W #$000E                                                         ;A9E874;
    BPL +                                                                ;A9E877;
    LDA.W CorpseRottingGFX_Ripper0+$20,X                                 ;A9E879;
    STA.W CorpseRottingGFX_Ripper0+$22,Y                                 ;A9E87C;
    LDA.W CorpseRottingGFX_Ripper0+$30,X                                 ;A9E87F;
    STA.W CorpseRottingGFX_Ripper0+$32,Y                                 ;A9E882;

+   LDA.W Corpse.rotEntryYOffset                                         ;A9E885;
    CMP.W #$000E                                                         ;A9E888;
    BPL .return                                                          ;A9E88B;
    LDA.W CorpseRottingGFX_Ripper0+$40,X                                 ;A9E88D;
    STA.W CorpseRottingGFX_Ripper0+$42,Y                                 ;A9E890;
    LDA.W CorpseRottingGFX_Ripper0+$50,X                                 ;A9E893;
    STA.W CorpseRottingGFX_Ripper0+$52,Y                                 ;A9E896;

  .return:
    RTS                                                                  ;A9E899;


;;; $E89A: Corpse rotting rot entry move function - ripper - enemy parameter 1 = 2 ;;;
CorpseRottingRotEntry_Move_Ripper_Param1_2:
;; Parameters:
;;     X: Source pixel row tile data offset
;;     Y: Destination pixel row tile data offset

; DB must be $7E
; Clears pixel row in dest and copies a pixel row from source to one pixel down in dest

; Tile data calculations:
;     Tiles are 20h bytes
;
;     Pixel (x, y) of tile at pointer p is:
;           ([p + y * 2]       >> 7 - x & 1)
;         | ([p + y * 2 + 1]   >> 7 - x & 1) << 1
;         | ([p + y * 2 + 10h] >> 7 - x & 1) << 2
;         | ([p + y * 2 + 11h] >> 7 - x & 1) << 3
;
;     Hence, pixel row y of tile at pointer p is the bytes
;         [p + y * 2], [p + y * 2 + 1], [p + y * 2 + 10h], [p + y * 2 + 11h]
    LDA.W Corpse.rotEntryYOffset                                         ;A9E89A;
    CMP.W #$000E                                                         ;A9E89D;
    BPL +                                                                ;A9E8A0;
    LDA.W CorpseRottingGFX_Ripper2,X                                     ;A9E8A2;
    STA.W CorpseRottingGFX_Ripper2+2,Y                                   ;A9E8A5;
    LDA.W CorpseRottingGFX_Ripper2+$10,X                                 ;A9E8A8;
    STA.W CorpseRottingGFX_Ripper2+$12,Y                                 ;A9E8AB;

+   STZ.W CorpseRottingGFX_Ripper2,X                                     ;A9E8AE;
    STZ.W CorpseRottingGFX_Ripper2+$10,X                                 ;A9E8B1;
    LDA.W Corpse.rotEntryYOffset                                         ;A9E8B4;
    CMP.W #$000E                                                         ;A9E8B7;
    BPL +                                                                ;A9E8BA;
    LDA.W CorpseRottingGFX_Ripper2+$20,X                                 ;A9E8BC;
    STA.W CorpseRottingGFX_Ripper2+$22,Y                                 ;A9E8BF;
    LDA.W CorpseRottingGFX_Ripper2+$30,X                                 ;A9E8C2;
    STA.W CorpseRottingGFX_Ripper2+$32,Y                                 ;A9E8C5;

+   STZ.W CorpseRottingGFX_Ripper2+$20,X                                 ;A9E8C8;
    STZ.W CorpseRottingGFX_Ripper2+$30,X                                 ;A9E8CB;
    LDA.W Corpse.rotEntryYOffset                                         ;A9E8CE;
    CMP.W #$000E                                                         ;A9E8D1;
    BPL +                                                                ;A9E8D4;
    LDA.W CorpseRottingGFX_Ripper2+$40,X                                 ;A9E8D6;
    STA.W CorpseRottingGFX_Ripper2+$42,Y                                 ;A9E8D9;
    LDA.W CorpseRottingGFX_Ripper2+$50,X                                 ;A9E8DC;
    STA.W CorpseRottingGFX_Ripper2+$52,Y                                 ;A9E8DF;

+   STZ.W CorpseRottingGFX_Ripper2+$40,X                                 ;A9E8E2;
    STZ.W CorpseRottingGFX_Ripper2+$50,X                                 ;A9E8E5;
    RTS                                                                  ;A9E8E8;


;;; $E8E9: Corpse rotting rot entry copy function - ripper - enemy parameter 1 = 2 ;;;
CorpseRottingRotEntry_Copy_Ripper_Param1_2:
;; Parameters:
;;     X: Source pixel row tile data offset
;;     Y: Destination pixel row tile data offset

; DB must be $7E
; Copies a pixel row from source to one pixel down in dest

; Tile data calculations:
;     Tiles are 20h bytes
;
;     Pixel (x, y) of tile at pointer p is:
;           ([p + y * 2]       >> 7 - x & 1)
;         | ([p + y * 2 + 1]   >> 7 - x & 1) << 1
;         | ([p + y * 2 + 10h] >> 7 - x & 1) << 2
;         | ([p + y * 2 + 11h] >> 7 - x & 1) << 3
;
;     Hence, pixel row y of tile at pointer p is the bytes
;         [p + y * 2], [p + y * 2 + 1], [p + y * 2 + 10h], [p + y * 2 + 11h]
    LDA.W Corpse.rotEntryYOffset                                         ;A9E8E9;
    CMP.W #$000E                                                         ;A9E8EC;
    BPL +                                                                ;A9E8EF;
    LDA.W CorpseRottingGFX_Ripper2,X                                     ;A9E8F1;
    STA.W CorpseRottingGFX_Ripper2+2,Y                                   ;A9E8F4;
    LDA.W CorpseRottingGFX_Ripper2+$10,X                                 ;A9E8F7;
    STA.W CorpseRottingGFX_Ripper2+$12,Y                                 ;A9E8FA;

+   LDA.W Corpse.rotEntryYOffset                                         ;A9E8FD;
    CMP.W #$000E                                                         ;A9E900;
    BPL +                                                                ;A9E903;
    LDA.W CorpseRottingGFX_Ripper2+$20,X                                 ;A9E905;
    STA.W CorpseRottingGFX_Ripper2+$22,Y                                 ;A9E908;
    LDA.W CorpseRottingGFX_Ripper2+$30,X                                 ;A9E90B;
    STA.W CorpseRottingGFX_Ripper2+$32,Y                                 ;A9E90E;

+   LDA.W Corpse.rotEntryYOffset                                         ;A9E911;
    CMP.W #$000E                                                         ;A9E914;
    BPL .return                                                          ;A9E917;
    LDA.W CorpseRottingGFX_Ripper2+$40,X                                 ;A9E919;
    STA.W CorpseRottingGFX_Ripper2+$42,Y                                 ;A9E91C;
    LDA.W CorpseRottingGFX_Ripper2+$50,X                                 ;A9E91F;
    STA.W CorpseRottingGFX_Ripper2+$52,Y                                 ;A9E922;

  .return:
    RTS                                                                  ;A9E925;


;;; $E926: Corpse rotting rot entry move function - skree - enemy parameter 1 = 0 ;;;
CorpseRottingRotEntry_Move_Skree_Param1_0:
;; Parameters:
;;     X: Source pixel row tile data offset
;;     Y: Destination pixel row tile data offset

; DB must be $7E
; Clears pixel row in dest and copies a pixel row from source to one pixel down in dest

; Tile data calculations:
;     Tiles are 20h bytes
;
;     Pixel (x, y) of tile at pointer p is:
;           ([p + y * 2]       >> 7 - x & 1)
;         | ([p + y * 2 + 1]   >> 7 - x & 1) << 1
;         | ([p + y * 2 + 10h] >> 7 - x & 1) << 2
;         | ([p + y * 2 + 11h] >> 7 - x & 1) << 3
;
;     Hence, pixel row y of tile at pointer p is the bytes
;         [p + y * 2], [p + y * 2 + 1], [p + y * 2 + 10h], [p + y * 2 + 11h]
    LDA.W Corpse.rotEntryYOffset                                         ;A9E926;
    CMP.W #$001E                                                         ;A9E929;
    BPL +                                                                ;A9E92C;
    LDA.W CorpseRottingGFX_Skree0,X                                      ;A9E92E;
    STA.W CorpseRottingGFX_Skree0+2,Y                                    ;A9E931;
    LDA.W CorpseRottingGFX_Skree0+$10,X                                  ;A9E934;
    STA.W CorpseRottingGFX_Skree0+$12,Y                                  ;A9E937;

+   STZ.W CorpseRottingGFX_Skree0,X                                      ;A9E93A;
    STZ.W CorpseRottingGFX_Skree0+$10,X                                  ;A9E93D;
    LDA.W Corpse.rotEntryYOffset                                         ;A9E940;
    CMP.W #$001E                                                         ;A9E943;
    BPL +                                                                ;A9E946;
    LDA.W CorpseRottingGFX_Skree0+$20,X                                  ;A9E948;
    STA.W CorpseRottingGFX_Skree0+$22,Y                                  ;A9E94B;
    LDA.W CorpseRottingGFX_Skree0+$30,X                                  ;A9E94E;
    STA.W CorpseRottingGFX_Skree0+$32,Y                                  ;A9E951;

+   STZ.W CorpseRottingGFX_Skree0+$20,X                                  ;A9E954;
    STZ.W CorpseRottingGFX_Skree0+$30,X                                  ;A9E957;
    RTS                                                                  ;A9E95A;


;;; $E95B: Corpse rotting rot entry copy function - skree - enemy parameter 1 = 0 ;;;
CorpseRottingRotEntry_Copy_Skree_Param1_0:
;; Parameters:
;;     X: Source pixel row tile data offset
;;     Y: Destination pixel row tile data offset

; DB must be $7E
; Copies a pixel row from source to one pixel down in dest

; Tile data calculations:
;     Tiles are 20h bytes
;
;     Pixel (x, y) of tile at pointer p is:
;           ([p + y * 2]       >> 7 - x & 1)
;         | ([p + y * 2 + 1]   >> 7 - x & 1) << 1
;         | ([p + y * 2 + 10h] >> 7 - x & 1) << 2
;         | ([p + y * 2 + 11h] >> 7 - x & 1) << 3
;
;     Hence, pixel row y of tile at pointer p is the bytes
;         [p + y * 2], [p + y * 2 + 1], [p + y * 2 + 10h], [p + y * 2 + 11h]
    LDA.W Corpse.rotEntryYOffset                                         ;A9E95B;
    CMP.W #$001E                                                         ;A9E95E;
    BPL +                                                                ;A9E961;
    LDA.W CorpseRottingGFX_Skree0,X                                      ;A9E963;
    STA.W CorpseRottingGFX_Skree0+2,Y                                    ;A9E966;
    LDA.W CorpseRottingGFX_Skree0+$10,X                                  ;A9E969;
    STA.W CorpseRottingGFX_Skree0+$12,Y                                  ;A9E96C;

+   LDA.W Corpse.rotEntryYOffset                                         ;A9E96F;
    CMP.W #$001E                                                         ;A9E972;
    BPL .return                                                          ;A9E975;
    LDA.W CorpseRottingGFX_Skree0+$20,X                                  ;A9E977;
    STA.W CorpseRottingGFX_Skree0+$22,Y                                  ;A9E97A;
    LDA.W CorpseRottingGFX_Skree0+$30,X                                  ;A9E97D;
    STA.W CorpseRottingGFX_Skree0+$32,Y                                  ;A9E980;

  .return:
    RTS                                                                  ;A9E983;


;;; $E984: Corpse rotting rot entry move function - skree - enemy parameter 1 = 2 ;;;
CorpseRottingRotEntry_Move_Skree_Param1_2:
;; Parameters:
;;     X: Source pixel row tile data offset
;;     Y: Destination pixel row tile data offset

; DB must be $7E
; Clears pixel row in dest and copies a pixel row from source to one pixel down in dest

; Tile data calculations:
;     Tiles are 20h bytes
;
;     Pixel (x, y) of tile at pointer p is:
;           ([p + y * 2]       >> 7 - x & 1)
;         | ([p + y * 2 + 1]   >> 7 - x & 1) << 1
;         | ([p + y * 2 + 10h] >> 7 - x & 1) << 2
;         | ([p + y * 2 + 11h] >> 7 - x & 1) << 3
;
;     Hence, pixel row y of tile at pointer p is the bytes
;         [p + y * 2], [p + y * 2 + 1], [p + y * 2 + 10h], [p + y * 2 + 11h]
    LDA.W Corpse.rotEntryYOffset                                         ;A9E984;
    CMP.W #$001E                                                         ;A9E987;
    BPL +                                                                ;A9E98A;
    LDA.W CorpseRottingGFX_Skree2,X                                      ;A9E98C;
    STA.W CorpseRottingGFX_Skree2+2,Y                                    ;A9E98F;
    LDA.W CorpseRottingGFX_Skree2+$10,X                                  ;A9E992;
    STA.W CorpseRottingGFX_Skree2+$12,Y                                  ;A9E995;

+   STZ.W CorpseRottingGFX_Skree2,X                                      ;A9E998;
    STZ.W CorpseRottingGFX_Skree2+$10,X                                  ;A9E99B;
    LDA.W Corpse.rotEntryYOffset                                         ;A9E99E;
    CMP.W #$001E                                                         ;A9E9A1;
    BPL +                                                                ;A9E9A4;
    LDA.W CorpseRottingGFX_Skree2+$20,X                                  ;A9E9A6;
    STA.W CorpseRottingGFX_Skree2+$22,Y                                  ;A9E9A9;
    LDA.W CorpseRottingGFX_Skree2+$30,X                                  ;A9E9AC;
    STA.W CorpseRottingGFX_Skree2+$32,Y                                  ;A9E9AF;

+   STZ.W CorpseRottingGFX_Skree2+$20,X                                  ;A9E9B2;
    STZ.W CorpseRottingGFX_Skree2+$30,X                                  ;A9E9B5;
    RTS                                                                  ;A9E9B8;


;;; $E9B9: Corpse rotting rot entry copy function - skree - enemy parameter 1 = 2 ;;;
CorpseRottingRotEntry_Copy_Skree_Param1_2:
;; Parameters:
;;     X: Source pixel row tile data offset
;;     Y: Destination pixel row tile data offset

; DB must be $7E
; Copies a pixel row from source to one pixel down in dest

; Tile data calculations:
;     Tiles are 20h bytes
;
;     Pixel (x, y) of tile at pointer p is:
;           ([p + y * 2]       >> 7 - x & 1)
;         | ([p + y * 2 + 1]   >> 7 - x & 1) << 1
;         | ([p + y * 2 + 10h] >> 7 - x & 1) << 2
;         | ([p + y * 2 + 11h] >> 7 - x & 1) << 3
;
;     Hence, pixel row y of tile at pointer p is the bytes
;         [p + y * 2], [p + y * 2 + 1], [p + y * 2 + 10h], [p + y * 2 + 11h]
    LDA.W Corpse.rotEntryYOffset                                         ;A9E9B9;
    CMP.W #$001E                                                         ;A9E9BC;
    BPL +                                                                ;A9E9BF;
    LDA.W CorpseRottingGFX_Skree2,X                                      ;A9E9C1;
    STA.W CorpseRottingGFX_Skree2+2,Y                                    ;A9E9C4;
    LDA.W CorpseRottingGFX_Skree2+$10,X                                  ;A9E9C7;
    STA.W CorpseRottingGFX_Skree2+$12,Y                                  ;A9E9CA;

+   LDA.W Corpse.rotEntryYOffset                                         ;A9E9CD;
    CMP.W #$001E                                                         ;A9E9D0;
    BPL .return                                                          ;A9E9D3;
    LDA.W CorpseRottingGFX_Skree2+$20,X                                  ;A9E9D5;
    STA.W CorpseRottingGFX_Skree2+$22,Y                                  ;A9E9D8;
    LDA.W CorpseRottingGFX_Skree2+$30,X                                  ;A9E9DB;
    STA.W CorpseRottingGFX_Skree2+$32,Y                                  ;A9E9DE;

  .return:
    RTS                                                                  ;A9E9E1;


;;; $E9E2: Corpse rotting rot entry move function - skree - enemy parameter 1 = 4 ;;;
CorpseRottingRotEntry_Move_Skree_Param1_4:
;; Parameters:
;;     X: Source pixel row tile data offset
;;     Y: Destination pixel row tile data offset

; DB must be $7E
; Clears pixel row in dest and copies a pixel row from source to one pixel down in dest

; Tile data calculations:
;     Tiles are 20h bytes
;
;     Pixel (x, y) of tile at pointer p is:
;           ([p + y * 2]       >> 7 - x & 1)
;         | ([p + y * 2 + 1]   >> 7 - x & 1) << 1
;         | ([p + y * 2 + 10h] >> 7 - x & 1) << 2
;         | ([p + y * 2 + 11h] >> 7 - x & 1) << 3
;
;     Hence, pixel row y of tile at pointer p is the bytes
;         [p + y * 2], [p + y * 2 + 1], [p + y * 2 + 10h], [p + y * 2 + 11h]
    LDA.W Corpse.rotEntryYOffset                                         ;A9E9E2;
    CMP.W #$001E                                                         ;A9E9E5;
    BPL +                                                                ;A9E9E8;
    LDA.W CorpseRottingGFX_Skree4,X                                      ;A9E9EA;
    STA.W CorpseRottingGFX_Skree4+2,Y                                    ;A9E9ED;
    LDA.W CorpseRottingGFX_Skree4+$10,X                                  ;A9E9F0;
    STA.W CorpseRottingGFX_Skree4+$12,Y                                  ;A9E9F3;

+   STZ.W CorpseRottingGFX_Skree4,X                                      ;A9E9F6;
    STZ.W CorpseRottingGFX_Skree4+$10,X                                  ;A9E9F9;
    LDA.W Corpse.rotEntryYOffset                                         ;A9E9FC;
    CMP.W #$001E                                                         ;A9E9FF;
    BPL +                                                                ;A9EA02;
    LDA.W CorpseRottingGFX_Skree4+$20,X                                  ;A9EA04;
    STA.W CorpseRottingGFX_Skree4+$22,Y                                  ;A9EA07;
    LDA.W CorpseRottingGFX_Skree4+$30,X                                  ;A9EA0A;
    STA.W CorpseRottingGFX_Skree4+$32,Y                                  ;A9EA0D;

+   STZ.W CorpseRottingGFX_Skree4+$20,X                                  ;A9EA10;
    STZ.W CorpseRottingGFX_Skree4+$30,X                                  ;A9EA13;
    RTS                                                                  ;A9EA16;


;;; $EA17: Corpse rotting rot entry copy function - skree - enemy parameter 1 = 4 ;;;
CorpseRottingRotEntry_Copy_Skree_Param1_4:
;; Parameters:
;;     X: Source pixel row tile data offset
;;     Y: Destination pixel row tile data offset

; DB must be $7E
; Copies a pixel row from source to one pixel down in dest

; Tile data calculations:
;     Tiles are 20h bytes
;
;     Pixel (x, y) of tile at pointer p is:
;           ([p + y * 2]       >> 7 - x & 1)
;         | ([p + y * 2 + 1]   >> 7 - x & 1) << 1
;         | ([p + y * 2 + 10h] >> 7 - x & 1) << 2
;         | ([p + y * 2 + 11h] >> 7 - x & 1) << 3
;
;     Hence, pixel row y of tile at pointer p is the bytes
;         [p + y * 2], [p + y * 2 + 1], [p + y * 2 + 10h], [p + y * 2 + 11h]
    LDA.W Corpse.rotEntryYOffset                                         ;A9EA17;
    CMP.W #$001E                                                         ;A9EA1A;
    BPL +                                                                ;A9EA1D;
    LDA.W CorpseRottingGFX_Skree4,X                                      ;A9EA1F;
    STA.W CorpseRottingGFX_Skree4+2,Y                                    ;A9EA22;
    LDA.W CorpseRottingGFX_Skree4+$10,X                                  ;A9EA25;
    STA.W CorpseRottingGFX_Skree4+$12,Y                                  ;A9EA28;

+   LDA.W Corpse.rotEntryYOffset                                         ;A9EA2B;
    CMP.W #$001E                                                         ;A9EA2E;
    BPL .return                                                          ;A9EA31;
    LDA.W CorpseRottingGFX_Skree4+$20,X                                  ;A9EA33;
    STA.W CorpseRottingGFX_Skree4+$22,Y                                  ;A9EA36;
    LDA.W CorpseRottingGFX_Skree4+$30,X                                  ;A9EA39;
    STA.W CorpseRottingGFX_Skree4+$32,Y                                  ;A9EA3C;

  .return:
    RTS                                                                  ;A9EA3F;


;;; $EA40: Corpse rotting rot entry move function - Mother Brain ;;;
CorpseRottingRotEntry_Move_MotherBrain:
;; Parameters:
;;     X: Source pixel row tile data offset
;;     Y: Destination pixel row tile data offset

; DB must be $7E
; Clears pixel row in dest and copies a pixel row from source to one pixel down in dest

; Tile data calculations:
;     Tiles are 20h bytes
;
;     Pixel (x, y) of tile at pointer p is:
;           ([p + y * 2]       >> 7 - x & 1)
;         | ([p + y * 2 + 1]   >> 7 - x & 1) << 1
;         | ([p + y * 2 + 10h] >> 7 - x & 1) << 2
;         | ([p + y * 2 + 11h] >> 7 - x & 1) << 3
;
;     Hence, pixel row y of tile at pointer p is the bytes
;         [p + y * 2], [p + y * 2 + 1], [p + y * 2 + 10h], [p + y * 2 + 11h]

; Column 0 is only used by rows 2..5
; Column 1 is only used by rows 1..5
; Column 5 is only used by rows 1..5
; Column 6 is only used by rows 4..5
; (See $B7:CE00 right side)
    LDA.W Corpse.rotEntryYOffset                                         ;A9EA40;
    CMP.W #$0010                                                         ;A9EA43;
    BCC .column1                                                         ;A9EA46;
    CMP.W #$002E                                                         ;A9EA48;
    BPL +                                                                ;A9EA4B;
    LDA.W MotherBrainCorpseRottingGFX,X                                  ;A9EA4D;
    STA.W MotherBrainCorpseRottingGFX+2,Y                                ;A9EA50;
    LDA.W MotherBrainCorpseRottingGFX+$10,X                              ;A9EA53;
    STA.W MotherBrainCorpseRottingGFX+$12,Y                              ;A9EA56;

+   STZ.W MotherBrainCorpseRottingGFX,X                                  ;A9EA59;
    STZ.W MotherBrainCorpseRottingGFX+$10,X                              ;A9EA5C;

  .column1:
    LDA.W Corpse.rotEntryYOffset                                         ;A9EA5F;
    CMP.W #$0008                                                         ;A9EA62;
    BCC .column2                                                         ;A9EA65;
    CMP.W #$002E                                                         ;A9EA67;
    BPL +                                                                ;A9EA6A;
    LDA.W MotherBrainCorpseRottingGFX+$20,X                              ;A9EA6C;
    STA.W MotherBrainCorpseRottingGFX+$22,Y                              ;A9EA6F;
    LDA.W MotherBrainCorpseRottingGFX+$30,X                              ;A9EA72;
    STA.W MotherBrainCorpseRottingGFX+$32,Y                              ;A9EA75;

+   STZ.W MotherBrainCorpseRottingGFX+$20,X                              ;A9EA78;
    STZ.W MotherBrainCorpseRottingGFX+$30,X                              ;A9EA7B;

  .column2:
    LDA.W Corpse.rotEntryYOffset                                         ;A9EA7E;
    CMP.W #$002E                                                         ;A9EA81;
    BPL +                                                                ;A9EA84;
    LDA.W MotherBrainCorpseRottingGFX+$40,X                              ;A9EA86;
    STA.W MotherBrainCorpseRottingGFX+$42,Y                              ;A9EA89;
    LDA.W MotherBrainCorpseRottingGFX+$50,X                              ;A9EA8C;
    STA.W MotherBrainCorpseRottingGFX+$52,Y                              ;A9EA8F;

+   STZ.W MotherBrainCorpseRottingGFX+$40,X                              ;A9EA92;
    STZ.W MotherBrainCorpseRottingGFX+$50,X                              ;A9EA95;
    LDA.W Corpse.rotEntryYOffset                                         ;A9EA98;
    CMP.W #$002E                                                         ;A9EA9B;
    BPL +                                                                ;A9EA9E;
    LDA.W MotherBrainCorpseRottingGFX+$60,X                              ;A9EAA0;
    STA.W MotherBrainCorpseRottingGFX+$62,Y                              ;A9EAA3;
    LDA.W MotherBrainCorpseRottingGFX+$70,X                              ;A9EAA6;
    STA.W MotherBrainCorpseRottingGFX+$72,Y                              ;A9EAA9;

+   STZ.W MotherBrainCorpseRottingGFX+$60,X                              ;A9EAAC;
    STZ.W MotherBrainCorpseRottingGFX+$70,X                              ;A9EAAF;
    LDA.W Corpse.rotEntryYOffset                                         ;A9EAB2;
    CMP.W #$002E                                                         ;A9EAB5;
    BPL +                                                                ;A9EAB8;
    LDA.W MotherBrainCorpseRottingGFX+$80,X                              ;A9EABA;
    STA.W MotherBrainCorpseRottingGFX+$82,Y                              ;A9EABD;
    LDA.W MotherBrainCorpseRottingGFX+$90,X                              ;A9EAC0;
    STA.W MotherBrainCorpseRottingGFX+$92,Y                              ;A9EAC3;

+   STZ.W MotherBrainCorpseRottingGFX+$80,X                              ;A9EAC6;
    STZ.W MotherBrainCorpseRottingGFX+$90,X                              ;A9EAC9;
    LDA.W Corpse.rotEntryYOffset                                         ;A9EACC;
    CMP.W #$0008                                                         ;A9EACF;
    BCC .column6                                                         ;A9EAD2;
    CMP.W #$002E                                                         ;A9EAD4;
    BPL +                                                                ;A9EAD7;
    LDA.W MotherBrainCorpseRottingGFX+$A0,X                              ;A9EAD9;
    STA.W MotherBrainCorpseRottingGFX+$A2,Y                              ;A9EADC;
    LDA.W MotherBrainCorpseRottingGFX+$B0,X                              ;A9EADF;
    STA.W MotherBrainCorpseRottingGFX+$B2,Y                              ;A9EAE2;

+   STZ.W MotherBrainCorpseRottingGFX+$A0,X                              ;A9EAE5;
    STZ.W MotherBrainCorpseRottingGFX+$B0,X                              ;A9EAE8;

  .column6:
    LDA.W Corpse.rotEntryYOffset                                         ;A9EAEB;
    CMP.W #$0020                                                         ;A9EAEE;
    BCC .return                                                          ;A9EAF1;
    CMP.W #$002E                                                         ;A9EAF3;
    BPL +                                                                ;A9EAF6;
    LDA.W MotherBrainCorpseRottingGFX+$C0,X                              ;A9EAF8;
    STA.W MotherBrainCorpseRottingGFX+$C2,Y                              ;A9EAFB;
    LDA.W MotherBrainCorpseRottingGFX+$D0,X                              ;A9EAFE;
    STA.W MotherBrainCorpseRottingGFX+$D2,Y                              ;A9EB01;

+   STZ.W MotherBrainCorpseRottingGFX+$C0,X                              ;A9EB04;
    STZ.W MotherBrainCorpseRottingGFX+$D0,X                              ;A9EB07;

  .return:
    RTS                                                                  ;A9EB0A;


;;; $EB0B: Corpse rotting rot entry copy function - Mother Brain ;;;
CorpseRottingRotEntry_Copy_MotherBrain:
;; Parameters:
;;     X: Source pixel row tile data offset
;;     Y: Destination pixel row tile data offset

; DB must be $7E
; Copies a pixel row from source to one pixel down in dest

; Tile data calculations:
;     Tiles are 20h bytes
;
;     Pixel (x, y) of tile at pointer p is:
;           ([p + y * 2]       >> 7 - x & 1)
;         | ([p + y * 2 + 1]   >> 7 - x & 1) << 1
;         | ([p + y * 2 + 10h] >> 7 - x & 1) << 2
;         | ([p + y * 2 + 11h] >> 7 - x & 1) << 3
;
;     Hence, pixel row y of tile at pointer p is the bytes
;         [p + y * 2], [p + y * 2 + 1], [p + y * 2 + 10h], [p + y * 2 + 11h]

; Column 0 is only used by rows 2..5
; Column 1 is only used by rows 1..5
; Column 5 is only used by rows 1..5
; Column 6 is only used by rows 4..5
; (See $B7:CE00 right side)
    LDA.W Corpse.rotEntryYOffset                                         ;A9EB0B;
    CMP.W #$0010                                                         ;A9EB0E;
    BCC +                                                                ;A9EB11;
    CMP.W #$002E                                                         ;A9EB13;
    BPL +                                                                ;A9EB16;
    LDA.W MotherBrainCorpseRottingGFX,X                                  ;A9EB18;
    STA.W MotherBrainCorpseRottingGFX+2,Y                                ;A9EB1B;
    LDA.W MotherBrainCorpseRottingGFX+$10,X                              ;A9EB1E;
    STA.W MotherBrainCorpseRottingGFX+$12,Y                              ;A9EB21;

+   LDA.W Corpse.rotEntryYOffset                                         ;A9EB24;
    CMP.W #$0008                                                         ;A9EB27;
    BCC +                                                                ;A9EB2A;
    CMP.W #$002E                                                         ;A9EB2C;
    BPL +                                                                ;A9EB2F;
    LDA.W MotherBrainCorpseRottingGFX+$20,X                              ;A9EB31;
    STA.W MotherBrainCorpseRottingGFX+$22,Y                              ;A9EB34;
    LDA.W MotherBrainCorpseRottingGFX+$30,X                              ;A9EB37;
    STA.W MotherBrainCorpseRottingGFX+$32,Y                              ;A9EB3A;

+   LDA.W Corpse.rotEntryYOffset                                         ;A9EB3D;
    CMP.W #$002E                                                         ;A9EB40;
    BPL +                                                                ;A9EB43;
    LDA.W MotherBrainCorpseRottingGFX+$40,X                              ;A9EB45;
    STA.W MotherBrainCorpseRottingGFX+$42,Y                              ;A9EB48;
    LDA.W MotherBrainCorpseRottingGFX+$50,X                              ;A9EB4B;
    STA.W MotherBrainCorpseRottingGFX+$52,Y                              ;A9EB4E;

+   LDA.W Corpse.rotEntryYOffset                                         ;A9EB51;
    CMP.W #$002E                                                         ;A9EB54;
    BPL +                                                                ;A9EB57;
    LDA.W MotherBrainCorpseRottingGFX+$60,X                              ;A9EB59;
    STA.W MotherBrainCorpseRottingGFX+$62,Y                              ;A9EB5C;
    LDA.W MotherBrainCorpseRottingGFX+$70,X                              ;A9EB5F;
    STA.W MotherBrainCorpseRottingGFX+$72,Y                              ;A9EB62;

+   LDA.W Corpse.rotEntryYOffset                                         ;A9EB65;
    CMP.W #$002E                                                         ;A9EB68;
    BPL +                                                                ;A9EB6B;
    LDA.W MotherBrainCorpseRottingGFX+$80,X                              ;A9EB6D;
    STA.W MotherBrainCorpseRottingGFX+$82,Y                              ;A9EB70;
    LDA.W MotherBrainCorpseRottingGFX+$90,X                              ;A9EB73;
    STA.W MotherBrainCorpseRottingGFX+$92,Y                              ;A9EB76;

+   LDA.W Corpse.rotEntryYOffset                                         ;A9EB79;
    CMP.W #$0008                                                         ;A9EB7C;
    BCC +                                                                ;A9EB7F;
    CMP.W #$002E                                                         ;A9EB81;
    BPL +                                                                ;A9EB84;
    LDA.W MotherBrainCorpseRottingGFX+$A0,X                              ;A9EB86;
    STA.W MotherBrainCorpseRottingGFX+$A2,Y                              ;A9EB89;
    LDA.W MotherBrainCorpseRottingGFX+$B0,X                              ;A9EB8C;
    STA.W MotherBrainCorpseRottingGFX+$B2,Y                              ;A9EB8F;

+   LDA.W Corpse.rotEntryYOffset                                         ;A9EB92;
    CMP.W #$0020                                                         ;A9EB95;
    BCC .return                                                          ;A9EB98;
    CMP.W #$002E                                                         ;A9EB9A;
    BPL .return                                                          ;A9EB9D;
    LDA.W MotherBrainCorpseRottingGFX+$C0,X                              ;A9EB9F;
    STA.W MotherBrainCorpseRottingGFX+$C2,Y                              ;A9EBA2;
    LDA.W MotherBrainCorpseRottingGFX+$D0,X                              ;A9EBA5;
    STA.W MotherBrainCorpseRottingGFX+$D2,Y                              ;A9EBA8;

  .return:
    RTS                                                                  ;A9EBAB;


;;; $EBAC: Palette - enemy $EDBF (sidehopper, part 2) ;;;
Palette_CorpseSidehopper2:
; This palette is loaded by the enemy set of the Baby Metroid room, but that palette is overwritten by Baby Metroid init AI, making this effectively unused
    dw $3800,$4EDA,$3A35,$2990,$14EB,$77E9,$5706,$3A44                   ;A9EBAC;
    dw $1D62,$2FBA,$22F6,$1A33,$1170,$08CD,$639F,$0446                   ;A9EBBC;


;;; $EBCC: Palettes - sidehopper corpse being drained ;;;
Palette_SidehopperCorpseBeingDrained_0:
    dw $3800,$7FFF,$56E0,$3180,$18C0,$6BC0,$5EC0,$4A20                   ;A9EBCC;
    dw $35A0,$7FFF,$039C,$0237,$00D1,$03FF,$0237,$00D1                   ;A9EBDC;

Palette_SidehopperCorpseBeingDrained_1:
    dw $3800,$77DF,$52C5,$2962,$14A1,$67A5,$56A4,$4203                   ;A9EBEC;
    dw $3182,$77FF,$0F7B,$01F4,$00CF,$037B,$01F3,$00AF                   ;A9EBFC;

Palette_SidehopperCorpseBeingDrained_2:
    dw $3800,$6FBF,$4ECA,$2544,$10A2,$5F8B,$4E88,$3DE6                   ;A9EC0C;
    dw $2D85,$6FFF,$1B5A,$05D1,$00CC,$06D6,$0190,$00AC                   ;A9EC1C;

Palette_SidehopperCorpseBeingDrained_3:
    dw $3800,$6BBF,$4AAE,$1D05,$0C83,$5B50,$466C,$35EA                   ;A9EC2C;
    dw $2567,$67FF,$2B39,$058F,$00AA,$0652,$014C,$048A                   ;A9EC3C;

Palette_SidehopperCorpseBeingDrained_4:
    dw $3800,$639F,$46B3,$18E7,$0884,$5336,$3E50,$31CD                   ;A9EC4C;
    dw $216A,$5FFF,$3718,$096C,$00A7,$09AD,$00E9,$0487                   ;A9EC5C;

Palette_SidehopperCorpseBeingDrained_5:
    dw $3800,$5B7F,$4298,$10C9,$0465,$4F1B,$3634,$29B0                   ;A9EC6C;
    dw $1D4C,$57FF,$42F7,$0929,$00A5,$0929,$00A5,$0465                   ;A9EC7C;

Palette_SidehopperCorpseBeingDrained_6:
    dw $3800,$57FF,$42F7,$0929,$00A5,$7FFF,$4231,$0043                   ;A9EC8C;
    dw $4B3F,$42DB,$3678,$2E14,$2190,$192C,$0CC9,$0465                   ;A9EC9C;


;;; $ECAC: Instruction list - sidehopper corpse - alive - hopping ;;;
InstList_CorpseSidehopper_Alive_Hopping:
    dw $0002,Spritemap_CorpseSidehopper_Alive_0                          ;A9ECAC;
    dw $0004,Spritemap_CorpseSidehopper_Alive_1                          ;A9ECB0;
    dw $0005,Spritemap_CorpseSidehopper_Alive_0                          ;A9ECB4;
    dw $0030,Spritemap_CorpseSidehopper_Alive_1                          ;A9ECB8;
    dw $0005,Spritemap_CorpseSidehopper_Alive_0                          ;A9ECBC;
    dw $0004,Spritemap_CorpseSidehopper_Alive_1                          ;A9ECC0;
    dw $0005,Spritemap_CorpseSidehopper_Alive_0                          ;A9ECC4;
    dw $0004,Spritemap_CorpseSidehopper_Alive_1                          ;A9ECC8;
    dw Instruction_SidehopperCorpse_EndHop                               ;A9ECCC;
    dw Common_Instruction_Sleep                                          ;A9ECCE;


;;; $ECD0: Instruction - end hop ;;;
Instruction_SidehopperCorpse_EndHop:
    PHY                                                                  ;A9ECD0;
    LDY.W #Function_CorpseSidehopper_StartIdling                         ;A9ECD1;
    LDA.L CorpseSidehopper.drainedPaletteIndex,X                         ;A9ECD4;
    BEQ .setFunctionPointerInY                                           ;A9ECD8;
    LDY.W #Function_CorpseSidehopper_BeingDrained                        ;A9ECDA;

  .setFunctionPointerInY:
    TYA                                                                  ;A9ECDD;
    STA.W CorpseSidehopper.function,X                                    ;A9ECDE;
    PLY                                                                  ;A9ECE1;
    RTL                                                                  ;A9ECE2;


;;; $ECE3: Instruction list - sidehopper corpse - alive - idle ;;;
InstList_CorpseSidehopper_Alive_Idle:
    dw $0001,Spritemap_CorpseSidehopper_Alive_2                          ;A9ECE3;
    dw Common_Instruction_Sleep                                          ;A9ECE7;


;;; $ECE9: Instruction list - sidehopper corpse - alive - corpse ;;;
InstList_CorpseSidehopper_Alive_Corpse:
    dw $0001,Spritemap_CorpseSidehopper_Dead_0                           ;A9ECE9;
    dw Common_Instruction_Sleep                                          ;A9ECED;


;;; $ECEF: Instruction list - sidehopper corpse - dead ;;;
InstList_CorpseSidehopper_Alive_Dead:
    dw $0001,Spritemap_CorpseSidehopper_Dead_1                           ;A9ECEF;
    dw Common_Instruction_Sleep                                          ;A9ECF3;


;;; $ECF5: Instruction list - zoomer corpse - enemy parameter 1 = 0 ;;;
InstList_CorpseZoomer_Param1_0:
    dw $0001,Spritemap_CorpseZoomer_0                                    ;A9ECF5;
    dw Common_Instruction_Sleep                                          ;A9ECF9;


;;; $ECFB: Instruction list - zoomer corpse - enemy parameter 1 = 2 ;;;
InstList_CorpseZoomer_Param1_2:
    dw $0001,Spritemap_CorpseZoomer_1                                    ;A9ECFB;
    dw Common_Instruction_Sleep                                          ;A9ECFF;


;;; $ED01: Instruction list - zoomer corpse - enemy parameter 1 = 4 ;;;
InstList_CorpseZoomer_Param1_4:
    dw $0001,Spritemap_CorpseZoomer_2                                    ;A9ED01;
    dw Common_Instruction_Sleep                                          ;A9ED05;


;;; $ED07: Instruction list - ripper corpse - enemy parameter 1 = 0 ;;;
InstList_CorpseRipper_Param1_0:
    dw $0001,Spritemap_CorpseRipper_0                                    ;A9ED07;
    dw Common_Instruction_Sleep                                          ;A9ED0B;


;;; $ED0D: Instruction list - ripper corpse - enemy parameter 1 = 2 ;;;
InstList_CorpseRipper_Param1_2:
    dw $0001,Spritemap_CorpseRipper_1                                    ;A9ED0D;
    dw Common_Instruction_Sleep                                          ;A9ED11;


;;; $ED13: Instruction list - skree corpse - enemy parameter 1 = 0 ;;;
InstList_CorpseSkree_Param1_0:
    dw $0001,Spritemap_CorpseSkree_0                                     ;A9ED13;
    dw Common_Instruction_Sleep                                          ;A9ED17;


;;; $ED19: Instruction list - skree corpse - enemy parameter 1 = 2 ;;;
InstList_CorpseSkree_Param1_2:
    dw $0001,Spritemap_CorpseSkree_1                                     ;A9ED19;
    dw Common_Instruction_Sleep                                          ;A9ED1D;


;;; $ED1F: Instruction list - skree corpse - enemy parameter 1 = 4 ;;;
InstList_CorpseSkree_Param1_4:
    dw $0001,Spritemap_CorpseSkree_2                                     ;A9ED1F;
    dw Common_Instruction_Sleep                                          ;A9ED23;


;;; $ED25: Dead monster spritemaps ;;;
Spritemap_CorpseSidehopper_Dead_0:
    dw $0008                                                             ;A9ED25;
    %spritemapEntry(1, $420C, $02, 0, 1, 2, 0, $130)
    %spritemapEntry(1, $420C, $F2, 0, 1, 2, 0, $110)
    %spritemapEntry(1, $43FC, $FA, 0, 0, 2, 0, $123)
    %spritemapEntry(1, $43FC, $EA, 0, 0, 2, 0, $103)
    %spritemapEntry(1, $43F4, $FA, 0, 0, 2, 0, $122)
    %spritemapEntry(1, $43F4, $EA, 0, 0, 2, 0, $102)
    %spritemapEntry(1, $43E4, $02, 0, 0, 2, 0, $130)
    %spritemapEntry(1, $43E4, $F2, 0, 0, 2, 0, $110)

Spritemap_CorpseSidehopper_Dead_1:
    dw $0008                                                             ;A9ED4F;
    %spritemapEntry(1, $420C, $FE, 0, 1, 2, 0, $129)
    %spritemapEntry(1, $420C, $EE, 0, 1, 2, 0, $109)
    %spritemapEntry(1, $43F4, $06, 0, 0, 2, 0, $13B)
    %spritemapEntry(1, $43F4, $F6, 0, 0, 2, 0, $11B)
    %spritemapEntry(1, $43FC, $06, 0, 0, 2, 0, $13C)
    %spritemapEntry(1, $43FC, $F6, 0, 0, 2, 0, $11C)
    %spritemapEntry(1, $43E4, $FE, 0, 0, 2, 0, $129)
    %spritemapEntry(1, $43E4, $EE, 0, 0, 2, 0, $109)

Spritemap_CorpseZoomer_0:
    dw $0002                                                             ;A9ED79;
    %spritemapEntry(1, $43FC, $F8, 0, 0, 2, 0, $154)
    %spritemapEntry(1, $43F4, $F8, 0, 0, 2, 0, $153)

Spritemap_CorpseZoomer_1:
    dw $0002                                                             ;A9ED85;
    %spritemapEntry(1, $43FC, $F8, 0, 0, 2, 0, $157)
    %spritemapEntry(1, $43F4, $F8, 0, 0, 2, 0, $156)

Spritemap_CorpseZoomer_2:
    dw $0002                                                             ;A9ED91;
    %spritemapEntry(1, $43FC, $F8, 0, 0, 2, 0, $15A)
    %spritemapEntry(1, $43F4, $F8, 0, 0, 2, 0, $159)

Spritemap_CorpseRipper_0:
    dw $0002                                                             ;A9ED9D;
    %spritemapEntry(1, $43FC, $F8, 0, 0, 2, 0, $151)
    %spritemapEntry(1, $43F4, $F8, 0, 0, 2, 0, $150)

Spritemap_CorpseRipper_1:
    dw $0002                                                             ;A9EDA9;
    %spritemapEntry(1, $43FC, $F8, 0, 0, 2, 0, $15D)
    %spritemapEntry(1, $43F4, $F8, 0, 0, 2, 0, $15C)

Spritemap_CorpseSkree_0:
    dw $0004                                                             ;A9EDB5;
    %spritemapEntry(1, $43FC, $04, 0, 1, 3, 0, $135)
    %spritemapEntry(1, $43FC, $F4, 0, 1, 3, 0, $115)
    %spritemapEntry(1, $43F4, $04, 0, 0, 3, 0, $135)
    %spritemapEntry(1, $43F4, $F4, 0, 0, 3, 0, $115)

Spritemap_CorpseSkree_1:
    dw $0004                                                             ;A9EDCB;
    %spritemapEntry(1, $43FC, $04, 0, 1, 3, 0, $127)
    %spritemapEntry(1, $43FC, $F4, 0, 1, 3, 0, $107)
    %spritemapEntry(1, $43F4, $04, 0, 0, 3, 0, $127)
    %spritemapEntry(1, $43F4, $F4, 0, 0, 3, 0, $107)

Spritemap_CorpseSkree_2:
    dw $0004                                                             ;A9EDE1;
    %spritemapEntry(1, $43FC, $04, 0, 1, 3, 0, $12E)
    %spritemapEntry(1, $43FC, $F4, 0, 1, 3, 0, $10E)
    %spritemapEntry(1, $43F4, $04, 0, 0, 3, 0, $12E)
    %spritemapEntry(1, $43F4, $F4, 0, 0, 3, 0, $10E)

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Spritemap_Corpse_A9EDF7:
    dw $000A                                                             ;A9EDF7;
    %spritemapEntry(0, $0C, $FC, 0, 0, 2, 7, $10C)
    %spritemapEntry(0, $14, $FC, 0, 0, 2, 7, $10D)
    %spritemapEntry(0, $04, $FC, 0, 0, 2, 7, $10B)
    %spritemapEntry(0, $1F4, $FC, 0, 0, 2, 7, $10D)
    %spritemapEntry(0, $1EC, $FC, 0, 0, 2, 7, $10C)
    %spritemapEntry(0, $1E4, $FC, 0, 0, 2, 7, $10B)
    %spritemapEntry(0, $08, $FC, 0, 0, 2, 7, $106)
    %spritemapEntry(0, $00, $FC, 0, 0, 2, 7, $105)
    %spritemapEntry(0, $1F8, $FC, 0, 0, 2, 7, $101)
    %spritemapEntry(0, $1F0, $FC, 0, 0, 2, 7, $100)

UNUSED_Spritemap_Corpse_A9EE2B:
    dw $0003                                                             ;A9EE2B;
    %spritemapEntry(0, $04, $FA, 0, 0, 2, 7, $10D)
    %spritemapEntry(0, $1FC, $FA, 0, 0, 2, 7, $10C)
    %spritemapEntry(0, $1F4, $FA, 0, 0, 2, 7, $10B)
endif ; !FEATURE_KEEP_UNREFERENCED

Spritemap_CorpseSidehopper_Alive_0:
    dw $0007                                                             ;A9EE3C;
    %spritemapEntry(0, $00, $EC, 0, 0, 2, 0, $171)
    %spritemapEntry(0, $1F8, $EC, 0, 0, 2, 0, $170)
    %spritemapEntry(1, $420C, $04, 0, 1, 2, 0, $176)
    %spritemapEntry(1, $43E4, $04, 0, 0, 2, 0, $176)
    %spritemapEntry(1, $4208, $F4, 0, 1, 2, 0, $174)
    %spritemapEntry(1, $43E8, $F4, 0, 0, 2, 0, $174)
    %spritemapEntry(1, $43F8, $F4, 0, 0, 2, 0, $180)

Spritemap_CorpseSidehopper_Alive_1:
    dw $0007                                                             ;A9EE61;
    %spritemapEntry(1, $43F8, $F6, 0, 0, 2, 0, $182)
    %spritemapEntry(1, $420D, $04, 0, 1, 2, 0, $17A)
    %spritemapEntry(1, $43E3, $04, 0, 0, 2, 0, $17A)
    %spritemapEntry(1, $4208, $F4, 0, 1, 2, 0, $178)
    %spritemapEntry(1, $43E8, $F4, 0, 0, 2, 0, $178)
    %spritemapEntry(0, $00, $EE, 0, 0, 2, 0, $171)
    %spritemapEntry(0, $1F8, $EE, 0, 0, 2, 0, $170)

Spritemap_CorpseSidehopper_Alive_2:
    dw $000B                                                             ;A9EE86;
    %spritemapEntry(0, $10, $0C, 0, 1, 2, 0, $172)
    %spritemapEntry(0, $08, $0C, 0, 1, 2, 0, $173)
    %spritemapEntry(0, $1F0, $0C, 0, 0, 2, 0, $173)
    %spritemapEntry(0, $1E8, $0C, 0, 0, 2, 0, $172)
    %spritemapEntry(1, $4208, $FC, 0, 1, 2, 0, $17E)
    %spritemapEntry(1, $43E8, $FC, 0, 0, 2, 0, $17E)
    %spritemapEntry(1, $4208, $EC, 0, 1, 2, 0, $17C)
    %spritemapEntry(1, $43E8, $EC, 0, 0, 2, 0, $17C)
    %spritemapEntry(0, $00, $E3, 0, 0, 2, 0, $171)
    %spritemapEntry(0, $1F8, $E3, 0, 0, 2, 0, $170)
    %spritemapEntry(1, $43F8, $EB, 0, 0, 2, 0, $180)


if !FEATURE_KEEP_UNREFERENCED
;;; $EEBF: Unused. A = [Y] / [A] ;;;
UNUSED_GetYDividedByA_A9EEBF:
    STY.W $4204                                                          ;A9EEBF;
    SEP #$20                                                             ;A9EEC2;
    STA.W $4206                                                          ;A9EEC4;
    REP #$20                                                             ;A9EEC7;
    XBA                                                                  ;A9EEC9;
    XBA                                                                  ;A9EECA;
    NOP                                                                  ;A9EECB;
    NOP                                                                  ;A9EECC;
    LDA.W $4214                                                          ;A9EECD;
    RTS                                                                  ;A9EED0;
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $EED1: Check for enemy collision with enemy ;;;
CheckForEnemyCollisionWithEnemy:
;; Parameters:
;;     X: Enemy index
;;     Y: Other enemy index
;; Returns:
;;     Carry: Clear if collision, set otherwise
    LDA.W Enemy.XHitboxRadius,Y                                          ;A9EED1;
    CLC                                                                  ;A9EED4;
    ADC.W Enemy.XHitboxRadius,X                                          ;A9EED5;
    INC                                                                  ;A9EED8;
    STA.B DP_Temp12                                                      ;A9EED9;
    LDA.W Enemy.XPosition,Y                                              ;A9EEDB;
    SEC                                                                  ;A9EEDE;
    SBC.W Enemy.XPosition,X                                              ;A9EEDF;
    BPL +                                                                ;A9EEE2;
    EOR.W #$FFFF                                                         ;A9EEE4;
    INC                                                                  ;A9EEE7;

+   CMP.B DP_Temp12                                                      ;A9EEE8;
    BCS .return                                                          ;A9EEEA;
    LDA.W Enemy.YHitboxRadius,Y                                          ;A9EEEC;
    CLC                                                                  ;A9EEEF;
    ADC.W Enemy.YHitboxRadius,X                                          ;A9EEF0;
    INC                                                                  ;A9EEF3;
    STA.B DP_Temp12                                                      ;A9EEF4;
    LDA.W Enemy.YPosition,Y                                              ;A9EEF6;
    SEC                                                                  ;A9EEF9;
    SBC.W Enemy.YPosition,X                                              ;A9EEFA;
    BPL +                                                                ;A9EEFD;
    EOR.W #$FFFF                                                         ;A9EEFF;
    INC                                                                  ;A9EF02;

+   CMP.B DP_Temp12                                                      ;A9EF03;

  .return:
    RTL                                                                  ;A9EF05;


;;; $EF06: Check for enemy collision with rectangle ;;;
CheckForEnemyCollisionWithRectangle:
;; Parameters:
;;     $12: Rectangle centre X position
;;     $14: Rectangle centre Y position
;;     $16: Rectangle X radius
;;     $18: Rectangle Y radius
;; Returns:
;;     Carry: Clear if collision, set otherwise
    LDA.B DP_Temp16                                                      ;A9EF06;
    CLC                                                                  ;A9EF08;
    ADC.W Enemy.XHitboxRadius,X                                          ;A9EF09;
    INC                                                                  ;A9EF0C;
    STA.B DP_Temp1A                                                      ;A9EF0D;
    LDA.B DP_Temp12                                                      ;A9EF0F;
    SEC                                                                  ;A9EF11;
    SBC.W Enemy.XPosition,X                                              ;A9EF12;
    BPL +                                                                ;A9EF15;
    EOR.W #$FFFF                                                         ;A9EF17;
    INC                                                                  ;A9EF1A;

+   CMP.B DP_Temp1A                                                      ;A9EF1B;
    BCS .return                                                          ;A9EF1D;
    LDA.B DP_Temp18                                                      ;A9EF1F;
    CLC                                                                  ;A9EF21;
    ADC.W Enemy.YHitboxRadius,X                                          ;A9EF22;
    INC                                                                  ;A9EF25;
    STA.B DP_Temp1A                                                      ;A9EF26;
    LDA.B DP_Temp14                                                      ;A9EF28;
    SEC                                                                  ;A9EF2A;
    SBC.W Enemy.YPosition,X                                              ;A9EF2B;
    BPL +                                                                ;A9EF2E;
    EOR.W #$FFFF                                                         ;A9EF30;
    INC                                                                  ;A9EF33;

+   CMP.B DP_Temp1A                                                      ;A9EF34;

  .return:
    RTL                                                                  ;A9EF36;


;;; $EF37: Initialisation AI - enemy $EEBF (Shitroid) ;;;
InitAI_BabyMetroid:
    PHB                                                                  ;A9EF37;
    PEA.W $7E7E                                                          ;A9EF38;
    PLB                                                                  ;A9EF3B;
    PLB                                                                  ;A9EF3C;
    LDA.W #$0000                                                         ;A9EF3D;
    LDX.W #$0FFE                                                         ;A9EF40;

  .loop:
    STA.W CorpseRottingGFX_Torizo,X                                      ;A9EF43;
    DEX                                                                  ;A9EF46;
    DEX                                                                  ;A9EF47;
    BPL .loop                                                            ;A9EF48;
    PLB                                                                  ;A9EF4A;
    LDX.W EnemyIndex                                                     ;A9EF4B;
    LDA.W Enemy.properties,X                                             ;A9EF4E;
    ORA.W #$3000                                                         ;A9EF51;
    STA.W Enemy.properties,X                                             ;A9EF54;
    LDA.W #$0400                                                         ;A9EF57;
    STA.W Enemy.palette,X                                                ;A9EF5A;
    LDA.W #InstList_BabyMetroid_Normal                                   ;A9EF5D;
    STA.W Enemy.instList,X                                               ;A9EF60;
    LDA.W #$0001                                                         ;A9EF63;
    STA.W Enemy.instTimer,X                                              ;A9EF66;
    STZ.W Enemy.loopCounter,X                                            ;A9EF69;
    LDA.W #Function_BabyMetroid_WaitForCamera                            ;A9EF6C;
    BIT.W Layer1XPosition                                                ;A9EF6F;
    BPL .notLeftDoor                                                     ;A9EF72;
    LDA.W Enemy.properties,X                                             ;A9EF74;
    ORA.W #$0500                                                         ;A9EF77;
    STA.W Enemy.properties,X                                             ;A9EF7A;
    LDA.W #Function_BabyMetroid_Disappeared                              ;A9EF7D;

  .notLeftDoor:
    STA.W BabyMetroid.function,X                                         ;A9EF80;
    STZ.W BabyMetroid.XVelocity,X                                        ;A9EF83;
    STZ.W BabyMetroid.YVelocity,X                                        ;A9EF86;
    LDA.W #$000A                                                         ;A9EF89;
    STA.W BabyMetroid.paletteHandlerDelay,X                              ;A9EF8C;
    STZ.W BabyMetroid.contactReactionFlag,X                              ;A9EF8F;
    LDY.W #Palette_CorpseSidehopper                                      ;A9EF92;
    LDX.W #$0120                                                         ;A9EF95;
    LDA.W #$0010                                                         ;A9EF98;
    JSL.L WriteAColorsFromYToTargetColorIndexX                           ;A9EF9B;
    LDY.W #Palette_BabyMetroid                                           ;A9EF9F;
    LDX.W #$0140                                                         ;A9EFA2;
    LDA.W #$0010                                                         ;A9EFA5;
    JSL.L WriteAColorsFromYToTargetColorIndexX                           ;A9EFA8;
    LDY.W #Palette_CorpseCommon                                          ;A9EFAC;
    LDX.W #$01E0                                                         ;A9EFAF;
    LDA.W #$0010                                                         ;A9EFB2;
    JSL.L WriteAColorsFromYToTargetColorIndexX                           ;A9EFB5;
    RTL                                                                  ;A9EFB9;


;;; $EFBA: Power bomb reaction - enemy $EEBF (Shitroid) ;;;
PowerBombReaction_BabyMetroid:
    LDX.W EnemyIndex                                                     ;A9EFBA;
    LDA.W BabyMetroid.contactReactionFlag,X                              ;A9EFBD;
    BEQ MainAI_BabyMetroid                                               ;A9EFC0;
    JSR.W SignalBabyMetroidToLeave                                       ;A9EFC2; fallthrough to MainAI_BabyMetroid


;;; $EFC5: Main AI - enemy $EEBF (Shitroid) ;;;
MainAI_BabyMetroid:
    LDX.W EnemyIndex                                                     ;A9EFC5;
    LDA.W #$7FFF                                                         ;A9EFC8;
    STA.W Enemy.health,X                                                 ;A9EFCB;
    JSR.W (BabyMetroid.function,X)                                       ;A9EFCE;
    JSL.L MoveEnemyAccordingToVelocity                                   ;A9EFD1;
    LDA.L PaletteChangeNumerator                                         ;A9EFD5;
    BNE .return                                                          ;A9EFD9;
    JSR.W HandleNormalBabyMetroidPalette                                 ;A9EFDB;

  .return:
    RTL                                                                  ;A9EFDE;


;;; $EFDF: Shitroid function - disappeared ;;;
Function_BabyMetroid_Disappeared:
    STZ.W BabyMetroid.XVelocity,X                                        ;A9EFDF;
    STZ.W BabyMetroid.YVelocity,X                                        ;A9EFE2;
    RTS                                                                  ;A9EFE5;


;;; $EFE6: Shitroid function - wait for camera ;;;
Function_BabyMetroid_WaitForCamera:
    LDA.W Layer1XPosition                                                ;A9EFE6;
    CMP.W #$0201                                                         ;A9EFE9;
    BPL .return                                                          ;A9EFEC;
    LDA.W #$0200                                                         ;A9EFEE;
    STA.W Layer1XPosition                                                ;A9EFF1;
    LDA.L Scrolls                                                        ;A9EFF4;
    AND.W #$00FF                                                         ;A9EFF8;
    STA.L Scrolls                                                        ;A9EFFB;
    LDA.L Scrolls+2                                                      ;A9EFFF;
    AND.W #$00FF                                                         ;A9F003;
    STA.L Scrolls+2                                                      ;A9F006;
    JSL.L Spawn_Hardcoded_PLM                                            ;A9F00A;
    db $30,$03                                                           ;A9F00E;
    dw PLMEntries_createBabyMetroidInvisibleWall                         ;A9F010;
    JSL.L Spawn_Hardcoded_PLM                                            ;A9F012;
    db $1F,$03                                                           ;A9F016;
    dw PLMEntries_createBabyMetroidInvisibleWall                         ;A9F018;
    LDX.W EnemyIndex                                                     ;A9F01A;
    LDA.W #Function_BabyMetroid_LetSidehopperLiveForABit                 ;A9F01D;
    STA.W BabyMetroid.function,X                                         ;A9F020;
    LDA.W #$0001                                                         ;A9F023;
    STA.L BabyMetroid.crySFXFlag,X                                       ;A9F026;

  .return:
    RTS                                                                  ;A9F02A;


;;; $F02B: Shitroid function - let sidehopper live for a bit ;;;
Function_BabyMetroid_LetSidehopperLiveForABit:
    LDA.W #Function_BabyMetroid_QueueBattleMusic                         ;A9F02B;
    STA.W BabyMetroid.function,X                                         ;A9F02E;
    LDA.W #$01D0                                                         ;A9F031;
    STA.W BabyMetroid.functionTimer,X                                    ;A9F034; fallthrough to Function_BabyMetroid_QueueBattleMusic


;;; $F037: Shitroid function - queue battle music ;;;
Function_BabyMetroid_QueueBattleMusic:
    DEC.W BabyMetroid.functionTimer,X                                    ;A9F037;
    BPL Function_BabyMetroid_RushToMiddleOfRoom_return                   ;A9F03A;
    LDA.W #$0005                                                         ;A9F03C;
    JSL.L QueueMusicDataOrTrack_8FrameDelay                              ;A9F03F;
    LDA.W #Function_BabyMetroid_RushToMiddleOfRoom                       ;A9F043;
    STA.W BabyMetroid.function,X                                         ;A9F046; fallthrough to Function_BabyMetroid_RushToMiddleOfRoom


;;; $F049: Shitroid function - rush to middle of room ;;;
Function_BabyMetroid_RushToMiddleOfRoom:
    LDA.W #$0248                                                         ;A9F049;
    STA.B DP_Temp12                                                      ;A9F04C;
    LDA.W #$004A                                                         ;A9F04E;
    STA.B DP_Temp14                                                      ;A9F051;
    LDY.W #$000F                                                         ;A9F053;
    JSR.W GradduallyAccelerateTowardsPoint_1A_400                        ;A9F056;
    LDA.W #$0001                                                         ;A9F059;
    STA.B DP_Temp16                                                      ;A9F05C;
    STA.B DP_Temp18                                                      ;A9F05E;
    JSL.L CheckForEnemyCollisionWithRectangle                            ;A9F060;
    BCS .return                                                          ;A9F064;
    LDA.W #Function_BabyMetroid_RushToSidehopper                         ;A9F066;
    STA.W BabyMetroid.function,X                                         ;A9F069;

  .return:
    RTS                                                                  ;A9F06C;


;;; $F06D: Shitroid function - rush to sidehopper ;;;
Function_BabyMetroid_RushToSidehopper:
    LDA.W Enemy[1].XPosition,X                                           ;A9F06D;
    STA.B DP_Temp12                                                      ;A9F070;
    LDA.W Enemy[1].YPosition,X                                           ;A9F072;
    CLC                                                                  ;A9F075;
    ADC.W #$FFE0                                                         ;A9F076;
    STA.B DP_Temp14                                                      ;A9F079;
    LDY.W #$000F                                                         ;A9F07B;
    JSR.W GradduallyAccelerateTowardsPoint_1A_400                        ;A9F07E;
    TXA                                                                  ;A9F081;
    CLC                                                                  ;A9F082;
    ADC.W #$0040                                                         ;A9F083;
    TAY                                                                  ;A9F086;
    JSL.L CheckForEnemyCollisionWithEnemy                                ;A9F087;
    BCS .return                                                          ;A9F08B;
    LDA.W #Function_BabyMetroid_LatchOntoSidehopper                      ;A9F08D;
    STA.W BabyMetroid.function,X                                         ;A9F090;

  .return:
    RTS                                                                  ;A9F093;


;;; $F094: Shitroid function - latch onto sidehopper ;;;
Function_BabyMetroid_LatchOntoSidehopper:
    LDA.W Enemy[1].XPosition,X                                           ;A9F094;
    STA.B DP_Temp12                                                      ;A9F097;
    LDA.W Enemy[1].YPosition,X                                           ;A9F099;
    CLC                                                                  ;A9F09C;
    ADC.W #$FFE0                                                         ;A9F09D;
    STA.B DP_Temp14                                                      ;A9F0A0;
    LDA.W #$0200                                                         ;A9F0A2;
    JSR.W AccelerateBabyMetroidTowardsPoint                              ;A9F0A5;
    BCS .reachedTarget                                                   ;A9F0A8;
    RTS                                                                  ;A9F0AA;

  .reachedTarget:
    STZ.W BabyMetroid.XVelocity,X                                        ;A9F0AB;
    STZ.W BabyMetroid.YVelocity,X                                        ;A9F0AE;
    LDA.W Enemy[1].XPosition,X                                           ;A9F0B1;
    STA.W Enemy.XPosition,X                                              ;A9F0B4;
    LDA.W Enemy[1].YPosition,X                                           ;A9F0B7;
    CLC                                                                  ;A9F0BA;
    ADC.W #$FFE0                                                         ;A9F0BB;
    STA.W Enemy.YPosition,X                                              ;A9F0BE;
    LDA.W #InstList_BabyMetroid_LatchedOn                                ;A9F0C1;
    STA.W Enemy.instList,X                                               ;A9F0C4;
    LDA.W #$0001                                                         ;A9F0C7;
    STA.W Enemy.instTimer,X                                              ;A9F0CA;
    STZ.W Enemy.loopCounter,X                                            ;A9F0CD;
    LDA.W #Function_BabyMetroid_DrainingSidehopper                       ;A9F0D0;
    STA.W BabyMetroid.function,X                                         ;A9F0D3;
    LDA.W #$0001                                                         ;A9F0D6;
    STA.W BabyMetroid.paletteHandlerDelay,X                              ;A9F0D9;
    STZ.W BabyMetroid.contactReactionFlag,X                              ;A9F0DC;
    LDA.W #$0140                                                         ;A9F0DF;
    STA.W BabyMetroid.functionTimer,X                                    ;A9F0E2;
    RTS                                                                  ;A9F0E5;


;;; $F0E6: Shitroid function - draining sidehopper ;;;
Function_BabyMetroid_DrainingSidehopper:
    LDA.W Enemy.frameCounter,X                                           ;A9F0E6;
    AND.W #$0006                                                         ;A9F0E9;
    TAY                                                                  ;A9F0EC;
    LDA.W ShakingOffsets_X,Y                                             ;A9F0ED;
    ADC.W Enemy[1].XPosition,X                                           ;A9F0F0;
    STA.W Enemy.XPosition,X                                              ;A9F0F3;
    LDA.W ShakingOffsets_Y,Y                                             ;A9F0F6;
    CLC                                                                  ;A9F0F9;
    ADC.W Enemy[1].YPosition,X                                           ;A9F0FA;
    CLC                                                                  ;A9F0FD;
    ADC.W #$FFE0                                                         ;A9F0FE;
    STA.W Enemy.YPosition,X                                              ;A9F101;
    DEC.W BabyMetroid.functionTimer,X                                    ;A9F104;
    BNE .return                                                          ;A9F107;
    LDA.W #Function_BabyMetroid_MakeSidehopperRottable                   ;A9F109;
    STA.W BabyMetroid.function,X                                         ;A9F10C;
    LDA.W #InstList_BabyMetroid_FinishDraining                           ;A9F10F;
    STA.W Enemy.instList,X                                               ;A9F112;
    LDA.W #$0001                                                         ;A9F115;
    STA.W Enemy.instTimer,X                                              ;A9F118;
    STZ.W Enemy.loopCounter,X                                            ;A9F11B;
    LDA.W #$000A                                                         ;A9F11E;
    STA.W BabyMetroid.paletteHandlerDelay,X                              ;A9F121;

  .return:
    RTS                                                                  ;A9F124;


;;; $F125: Shitroid function - make sidehopper rottable ;;;
Function_BabyMetroid_MakeSidehopperRottable:
    LDA.W #$0001                                                         ;A9F125;
    STA.L MotherBrainBody.painfulWalkingFunction                         ;A9F128;
    LDA.W #Function_BabyMetroid_MoveUp_UnlockCamera                      ;A9F12C;
    STA.W BabyMetroid.function,X                                         ;A9F12F;
    LDA.W #$00C0                                                         ;A9F132;
    STA.W BabyMetroid.functionTimer,X                                    ;A9F135; fallthrough to Function_BabyMetroid_MoveUp_UnlockCamera


;;; $F138: Shitroid function - move up and unlock camera ;;;
Function_BabyMetroid_MoveUp_UnlockCamera:
    LDA.W Enemy.XPosition,X                                              ;A9F138;
    STA.B DP_Temp12                                                      ;A9F13B;
    LDA.W #$0068                                                         ;A9F13D;
    STA.B DP_Temp14                                                      ;A9F140;
    LDY.W #$0000                                                         ;A9F142;
    JSR.W GradduallyAccelerateTowardsPoint_1A_400                        ;A9F145;
    DEC.W BabyMetroid.functionTimer,X                                    ;A9F148;
    BPL .return                                                          ;A9F14B;
    LDA.W #Function_BabyMetroid_StareDownSamus                           ;A9F14D;
    STA.W BabyMetroid.function,X                                         ;A9F150;
    LDA.W #$0001                                                         ;A9F153;
    STA.W BabyMetroid.contactReactionFlag,X                              ;A9F156;
    LDA.L Scrolls                                                        ;A9F159;
    ORA.W #$0100                                                         ;A9F15D;
    STA.L Scrolls                                                        ;A9F160;
    LDA.L Scrolls+2                                                      ;A9F164;
    ORA.W #$0100                                                         ;A9F168;
    STA.L Scrolls+2                                                      ;A9F16B;
    JSL.L Spawn_Hardcoded_PLM                                            ;A9F16F;
    db $30,$03                                                           ;A9F173;
    dw PLMEntries_clearBabyMetroidInvisibleWall                          ;A9F175;
    JSL.L Spawn_Hardcoded_PLM                                            ;A9F177;
    db $1F,$03                                                           ;A9F17B;
    dw PLMEntries_clearBabyMetroidInvisibleWall                          ;A9F17D;

  .return:
    RTS                                                                  ;A9F17F;


;;; $F180: Shitroid function - stare down Samus ;;;
Function_BabyMetroid_StareDownSamus:
; Shitroid moves towards Samus' X position and usually Y position 50h
; With a 0.78125% chance, Shitroid will move towards Samus' Y position instead for 20h frames
; 0.78125% chance per frame ~= 37.5% chance per second
; Shitroid will latch onto Samus when one of:
;     their X positions have been close for a while
;     they touch and Samus wasn't spin jumping (see enemy touch)
;     Samus X position < 200h
    LDA.W Enemy.XPosition,X                                              ;A9F180;
    SEC                                                                  ;A9F183;
    SBC.W SamusXPosition                                                 ;A9F184;
    BPL +                                                                ;A9F187;
    EOR.W #$FFFF                                                         ;A9F189;
    INC                                                                  ;A9F18C;

+   CMP.W #$0008                                                         ;A9F18D;
    BCS .notClose                                                        ;A9F190;
    LDA.L BabyMetroid.stareDownContactTimer,X                            ;A9F192;
    ADC.W #$0002                                                         ;A9F196;
    BRA +                                                                ;A9F199;

  .notClose:
    LDA.L BabyMetroid.stareDownContactTimer,X                            ;A9F19B;
    BEQ +                                                                ;A9F19F;
    SEC                                                                  ;A9F1A1;
    SBC.W #$0001                                                         ;A9F1A2;
    BPL +                                                                ;A9F1A5;
    LDA.W #$0000                                                         ;A9F1A7;

+   STA.L BabyMetroid.stareDownContactTimer,X                            ;A9F1AA;
    CMP.W #$0100                                                         ;A9F1AE;
    BCS .done                                                            ;A9F1B1;
    LDA.W SamusXPosition                                                 ;A9F1B3;
    CMP.W #$0200                                                         ;A9F1B6;
    BMI .done                                                            ;A9F1B9;
    LDA.L BabyMetroid.aggroTimer,X                                       ;A9F1BB;
    BEQ .zeroAggroTimer                                                  ;A9F1BF;
    DEC                                                                  ;A9F1C1;
    STA.L BabyMetroid.aggroTimer,X                                       ;A9F1C2;
    LDY.W SamusYPosition                                                 ;A9F1C6;
    BRA .notRareChance                                                   ;A9F1C9;

  .zeroAggroTimer:
    LDY.W #$0050                                                         ;A9F1CB;
    LDA.W RandomNumberSeed                                               ;A9F1CE;
    AND.W #$0FFF                                                         ;A9F1D1;
    CMP.W #$0FE0                                                         ;A9F1D4;
    BCC .notRareChance                                                   ;A9F1D7;
    LDA.W #$0020                                                         ;A9F1D9;
    STA.L BabyMetroid.aggroTimer,X                                       ;A9F1DC;

  .notRareChance:
    STY.B DP_Temp14                                                      ;A9F1E0;
    LDA.W SamusXPosition                                                 ;A9F1E2;
    STA.B DP_Temp12                                                      ;A9F1E5;
    LDX.W EnemyIndex                                                     ;A9F1E7;
    LDY.W #$000A                                                         ;A9F1EA;
    JMP.W GradduallyAccelerateTowardsPoint_1A_400                        ;A9F1ED;

  .done:
    LDX.W EnemyIndex                                                     ;A9F1F0;
    LDA.W #Function_BabyMetroid_LatchOntoSamus                           ;A9F1F3;
    STA.W BabyMetroid.function,X                                         ;A9F1F6;
    RTS                                                                  ;A9F1F9;


;;; $F1FA: Shitroid function - latch onto Samus ;;;
Function_BabyMetroid_LatchOntoSamus:
; See enemy touch
    LDA.W SamusXPosition                                                 ;A9F1FA;
    STA.B DP_Temp12                                                      ;A9F1FD;
    LDA.W SamusYPosition                                                 ;A9F1FF;
    SEC                                                                  ;A9F202;
    SBC.W #$0020                                                         ;A9F203;
    STA.B DP_Temp14                                                      ;A9F206;
    LDY.W #$000F                                                         ;A9F208;
    JMP.W GradduallyAccelerateTowardsPoint_1A_400                        ;A9F20B;


;;; $F20E: Shitroid function - start draining Samus ;;;
Function_BabyMetroid_StartDrainingSamus:
    LDA.W #$0012                                                         ;A9F20E;
    JSL.L Run_Samus_Command                                              ;A9F211;
    LDA.W #Function_BabyMetroid_DrainingSamus                            ;A9F215;
    STA.W BabyMetroid.function                                           ;A9F218; fallthrough to Function_BabyMetroid_DrainingSamus


;;; $F21B: Shitroid function - draining Samus ;;;
Function_BabyMetroid_DrainingSamus:
    LDA.W Energy                                                         ;A9F21B;
    CMP.W #$0002                                                         ;A9F21E;
    BCC .done                                                            ;A9F221;
    LDA.W #$0008                                                         ;A9F223;
    STA.W SamusProjectile_CooldownTimer                                  ;A9F226;
    LDA.W #$0005                                                         ;A9F229;
    STA.W SamusProjectile_BombCounter                                    ;A9F22C;
    LDA.W #$0002                                                         ;A9F22F;
    STA.W XSpeedDivisor                                                  ;A9F232;
    LDA.W SamusYSpeed                                                    ;A9F235;
    CMP.W #$0004                                                         ;A9F238;
    BMI .lessThan4                                                       ;A9F23B;
    LDA.W #$0002                                                         ;A9F23D;
    STA.W SamusYSpeed                                                    ;A9F240;

  .lessThan4:
    LDA.W Enemy.frameCounter,X                                           ;A9F243;
    AND.W #$0006                                                         ;A9F246;
    TAY                                                                  ;A9F249;
    LDA.W ShakingOffsets_X,Y                                             ;A9F24A;
    ADC.W SamusXPosition                                                 ;A9F24D;
    STA.W Enemy.XPosition,X                                              ;A9F250;
    LDA.W ShakingOffsets_Y,Y                                             ;A9F253;
    CLC                                                                  ;A9F256;
    ADC.W #$FFEC                                                         ;A9F257;
    CLC                                                                  ;A9F25A;
    ADC.W SamusYPosition                                                 ;A9F25B;
    STA.W Enemy.YPosition,X                                              ;A9F25E;
    JSL.L DamageSamusDueToBabyMetroid                                    ;A9F261;
    RTS                                                                  ;A9F265;

  .done:
    STZ.W XSpeedDivisor                                                  ;A9F266;
    STZ.W SamusProjectile_BombCounter                                    ;A9F269;
    LDA.W #Function_BabyMetroid_StartHeelRealization                     ;A9F26C;
    STA.W BabyMetroid.function,X                                         ;A9F26F;
    STZ.W BabyMetroid.XVelocity,X                                        ;A9F272;
    STZ.W BabyMetroid.YVelocity,X                                        ;A9F275;
    LDA.W #InstList_BabyMetroid_FinishDraining                           ;A9F278;
    JSL.L SetEnemyInstList                                               ;A9F27B;
    LDA.W #$000A                                                         ;A9F27F;
    STA.W BabyMetroid.paletteHandlerDelay,X                              ;A9F282;
    LDA.W #$0013                                                         ;A9F285;
    JSL.L Run_Samus_Command                                              ;A9F288;
    LDA.W #$0000                                                         ;A9F28C;
    JSL.L DrainedSamusController                                         ;A9F28F;
    LDA.W #$0000                                                         ;A9F293;
    STA.L BabyMetroid.crySFXFlag,X                                       ;A9F296;
    LDA.W #$0007                                                         ;A9F29A;
    JSL.L QueueMusicDataOrTrack_8FrameDelay                              ;A9F29D;
    RTS                                                                  ;A9F2A1;


;;; $F2A2: Shitroid function - start heel realisation ;;;
Function_BabyMetroid_StartHeelRealization:
    LDA.W #Function_BabyMetroid_HeelRealization                          ;A9F2A2;
    STA.W BabyMetroid.function,X                                         ;A9F2A5;
    LDA.W #$0078                                                         ;A9F2A8;
    STA.W BabyMetroid.functionTimer,X                                    ;A9F2AB; fallthrough to Function_BabyMetroid_HeelRealization


;;; $F2AE: Shitroid function - heel realisation ;;;
Function_BabyMetroid_HeelRealization:
    DEC.W BabyMetroid.functionTimer,X                                    ;A9F2AE;
    BMI .timerExpired                                                    ;A9F2B1;
    RTS                                                                  ;A9F2B3;

  .timerExpired:
    LDA.W #Function_BabyMetroid_BackOffGuiltily                          ;A9F2B4;
    STA.W BabyMetroid.function,X                                         ;A9F2B7;
    LDA.W #$00C0                                                         ;A9F2BA;
    STA.W BabyMetroid.functionTimer,X                                    ;A9F2BD; fallthrough to Function_BabyMetroid_BackOffGuiltily


;;; $F2C0: Shitroid function - back off guiltily ;;;
Function_BabyMetroid_BackOffGuiltily:
    LDA.W SamusXPosition                                                 ;A9F2C0;
    STA.B DP_Temp12                                                      ;A9F2C3;
    LDA.W #$0068                                                         ;A9F2C5;
    STA.B DP_Temp14                                                      ;A9F2C8;
    LDX.W EnemyIndex                                                     ;A9F2CA;
    LDY.W #$0000                                                         ;A9F2CD;
    JSR.W GradduallyAccelerateTowardsPoint_1A_400                        ;A9F2D0;
    DEC.W BabyMetroid.functionTimer,X                                    ;A9F2D3;
    BMI .timerExpired                                                    ;A9F2D6;
    RTS                                                                  ;A9F2D8;

  .timerExpired:
    LDA.W #$007D                                                         ;A9F2D9;
    JSL.L QueueSound_Lib2_Max6                                           ;A9F2DC;
    LDA.W #Function_BabyMetroid_GoLeftGuiltily                           ;A9F2E0;
    STA.W BabyMetroid.function,X                                         ;A9F2E3;
    LDA.W #$0058                                                         ;A9F2E6;
    STA.W BabyMetroid.functionTimer,X                                    ;A9F2E9;
    LDA.W #InstList_BabyMetroid_LatchedOn                                ;A9F2EC;
    STA.W Enemy.instList,X                                               ;A9F2EF;
    LDA.W #$0001                                                         ;A9F2F2;
    STA.W Enemy.instTimer,X                                              ;A9F2F5;
    STZ.W Enemy.loopCounter,X                                            ;A9F2F8; fallthrough to Function_BabyMetroid_GoLeftGuiltily


;;; $F2FB: Shitroid function - go left guiltily ;;;
Function_BabyMetroid_GoLeftGuiltily:
    LDA.W SamusXPosition                                                 ;A9F2FB;
    CLC                                                                  ;A9F2FE;
    ADC.W #$FFC0                                                         ;A9F2FF;
    STA.B DP_Temp12                                                      ;A9F302;
    LDA.W #$0064                                                         ;A9F304;
    STA.B DP_Temp14                                                      ;A9F307;
    LDX.W EnemyIndex                                                     ;A9F309;
    LDY.W #$0000                                                         ;A9F30C;
    JSR.W GradduallyAccelerateTowardsPoint_1A_400                        ;A9F30F;
    DEC.W BabyMetroid.functionTimer,X                                    ;A9F312;
    BMI .timerExpired                                                    ;A9F315;
    RTS                                                                  ;A9F317;

  .timerExpired:
    LDA.W #Function_BabyMetroid_GoRightGuiltily                          ;A9F318;
    STA.W BabyMetroid.function,X                                         ;A9F31B;
    LDA.W #$0058                                                         ;A9F31E;
    STA.W BabyMetroid.functionTimer,X                                    ;A9F321; fallthrough to Function_BabyMetroid_GoRightGuiltily


;;; $F324: Shitroid function - go right guiltily ;;;
Function_BabyMetroid_GoRightGuiltily:
    LDA.W SamusXPosition                                                 ;A9F324;
    CLC                                                                  ;A9F327;
    ADC.W #$0060                                                         ;A9F328;
    STA.B DP_Temp12                                                      ;A9F32B;
    LDA.W #$0068                                                         ;A9F32D;
    STA.B DP_Temp14                                                      ;A9F330;
    LDX.W EnemyIndex                                                     ;A9F332;
    LDY.W #$0000                                                         ;A9F335;
    JSR.W GradduallyAccelerateTowardsPoint_1A_400                        ;A9F338;
    DEC.W BabyMetroid.functionTimer,X                                    ;A9F33B;
    BMI .timerExpired                                                    ;A9F33E;
    RTS                                                                  ;A9F340;

  .timerExpired:
    LDX.W EnemyIndex                                                     ;A9F341;
    LDA.W #Function_BabyMetroid_SamusRecovering                          ;A9F344;
    STA.W BabyMetroid.function,X                                         ;A9F347;
    LDA.W #$0100                                                         ;A9F34A;
    STA.W BabyMetroid.functionTimer,X                                    ;A9F34D;
    LDA.W #InstList_BabyMetroid_Remorse                                  ;A9F350;
    STA.W Enemy.instList,X                                               ;A9F353;
    LDA.W #$0001                                                         ;A9F356;
    STA.W Enemy.instTimer,X                                              ;A9F359;
    STZ.W Enemy.loopCounter,X                                            ;A9F35C;
    RTS                                                                  ;A9F35F;


;;; $F360: Shitroid function - flee remorsefully ;;;
Function_BabyMetroid_FleeRemorsefully:
    LDA.W #$0052                                                         ;A9F360;
    JSL.L QueueSound_Lib2_Max6                                           ;A9F363;
    LDA.W #Function_BabyMetroid_Fleeing                                  ;A9F367;
    STA.W BabyMetroid.function,X                                         ;A9F36A; fallthrough to Function_BabyMetroid_Fleeing


;;; $F36D: Shitroid function - fleeing ;;;
Function_BabyMetroid_Fleeing:
    LDA.W #$FF80                                                         ;A9F36D;
    STA.B DP_Temp12                                                      ;A9F370;
    LDA.W #$0040                                                         ;A9F372;
    STA.B DP_Temp14                                                      ;A9F375;
    LDX.W EnemyIndex                                                     ;A9F377;
    LDY.W #$0000                                                         ;A9F37A;
    JSR.W GradduallyAccelerateTowardsPoint_1A_400                        ;A9F37D;
    LDA.W #$0008                                                         ;A9F380;
    STA.B DP_Temp16                                                      ;A9F383;
    STA.B DP_Temp18                                                      ;A9F385;
    JSL.L CheckForEnemyCollisionWithRectangle                            ;A9F387;
    BCS .return                                                          ;A9F38B;
    STZ.W BabyMetroid.XVelocity,X                                        ;A9F38D;
    STZ.W BabyMetroid.YVelocity,X                                        ;A9F390;
    LDA.W Enemy.properties,X                                             ;A9F393;
    AND.W #$DEFF                                                         ;A9F396;
    STA.W Enemy.properties,X                                             ;A9F399;
    LDA.W #Function_BabyMetroid_Disappeared                              ;A9F39C;
    STA.W BabyMetroid.function,X                                         ;A9F39F;

  .return:
    RTS                                                                  ;A9F3A2;


;;; $F3A3: Shitroid function - Samus recovering ;;;
Function_BabyMetroid_SamusRecovering:
    DEC.W BabyMetroid.functionTimer,X                                    ;A9F3A3;
    BMI .timerExpired                                                    ;A9F3A6;
    JMP.W GraduallyAccelerateTowardSamus                                 ;A9F3A8;

  .timerExpired:
    LDA.W #$0002                                                         ;A9F3AB;
    JSL.L DrainedSamusController                                         ;A9F3AE;
    LDA.W #$0001                                                         ;A9F3B2;
    STA.W BabyMetroid.contactReactionFlag,X                              ;A9F3B5;
    LDA.W #Function_BabyMetroid_Remorse                                  ;A9F3B8;
    STA.W BabyMetroid.function,X                                         ;A9F3BB; fallthrough to Function_BabyMetroid_Remorse


;;; $F3BE: Shitroid function - remorse ;;;
Function_BabyMetroid_Remorse:
    JSR.W GraduallyAccelerateTowardSamus                                 ;A9F3BE;
    BCS MakeBabyMetroidFlee                                              ;A9F3C1;
    RTS                                                                  ;A9F3C3;


;;; $F3C4: Make Shitroid flee ;;;
MakeBabyMetroidFlee:
    LDA.W #Function_BabyMetroid_FleeRemorsefully                         ;A9F3C4;
    STA.W BabyMetroid.function,X                                         ;A9F3C7;
    RTS                                                                  ;A9F3CA;


;;; $F3CB: Signal Shitroid to leave ;;;
SignalBabyMetroidToLeave:
    LDA.W BabyMetroid.function,X                                         ;A9F3CB;
    CMP.W #Function_BabyMetroid_Remorse                                  ;A9F3CE;
    BEQ MakeBabyMetroidFlee                                              ;A9F3D1;
    RTS                                                                  ;A9F3D3;


;;; $F3D4: Gradually accelerate towards Samus ;;;
GraduallyAccelerateTowardSamus:
;; Returns:
;;     Carry: Set if ready to flee, clear otherwise

; Similar to Function_BabyMetroid_StareDownSamus
    LDA.W Enemy.XPosition,X                                              ;A9F3D4;
    SEC                                                                  ;A9F3D7;
    SBC.W SamusXPosition                                                 ;A9F3D8;
    BPL +                                                                ;A9F3DB;
    EOR.W #$FFFF                                                         ;A9F3DD;
    INC                                                                  ;A9F3E0;

+   CMP.W #$0002                                                         ;A9F3E1;
    BCS .notClose                                                        ;A9F3E4;
    LDA.L BabyMetroid.stareDownContactTimer,X                            ;A9F3E6;
    ADC.W #$0002                                                         ;A9F3EA;
    BRA +                                                                ;A9F3ED;

  .notClose:
    LDA.L BabyMetroid.stareDownContactTimer,X                            ;A9F3EF;
    BEQ +                                                                ;A9F3F3;
    SEC                                                                  ;A9F3F5;
    SBC.W #$0001                                                         ;A9F3F6;
    BPL +                                                                ;A9F3F9;
    LDA.W #$0000                                                         ;A9F3FB;

+   STA.L BabyMetroid.stareDownContactTimer,X                            ;A9F3FE;
    LDA.L BabyMetroid.aggroTimer,X                                       ;A9F402;
    BEQ .zeroAggroTimer                                                  ;A9F406;
    DEC                                                                  ;A9F408;
    STA.L BabyMetroid.aggroTimer,X                                       ;A9F409;
    LDA.W SamusYPosition                                                 ;A9F40D;
    CLC                                                                  ;A9F410;
    ADC.W #$FFEE                                                         ;A9F411;
    TAY                                                                  ;A9F414;
    BRA +                                                                ;A9F415;

  .zeroAggroTimer:
    LDY.W #$0050                                                         ;A9F417;
    LDA.W RandomNumberSeed                                               ;A9F41A;
    AND.W #$0FFF                                                         ;A9F41D;
    CMP.W #$0FE0                                                         ;A9F420;
    BCC +                                                                ;A9F423;
    LDA.W #$0020                                                         ;A9F425;
    STA.L BabyMetroid.aggroTimer,X                                       ;A9F428;

+   STY.B DP_Temp14                                                      ;A9F42C;
    LDA.W SamusXPosition                                                 ;A9F42E;
    STA.B DP_Temp12                                                      ;A9F431;
    LDX.W EnemyIndex                                                     ;A9F433;
    LDY.W #$0008                                                         ;A9F436;
    JSR.W GradduallyAccelerateTowardsPoint_1A_400                        ;A9F439;
    LDA.L BabyMetroid.stareDownContactTimer,X                            ;A9F43C;
    CMP.W #$0400                                                         ;A9F440;
    BCS .returnReadyToFlee                                               ;A9F443;
    LDA.W SamusXPosition                                                 ;A9F445;
    CMP.W #$0080                                                         ;A9F448;
    BMI .returnReadyToFlee                                               ;A9F44B;
    CLC                                                                  ;A9F44D;
    RTS                                                                  ;A9F44E;

  .returnReadyToFlee:
    SEC                                                                  ;A9F44F;
    RTS                                                                  ;A9F450;


;;; $F451: Gradually accelerate towards point - $1A = 400h ;;;
GradduallyAccelerateTowardsPoint_1A_400:
    LDA.W #$0400                                                         ;A9F451;
    STA.B DP_Temp1A                                                      ;A9F454;
    BRA GradduallyAccelerateTowardsPoint                                 ;A9F456;


;;; $F458: Gradually accelerate towards point - $1A = 4 ;;;
GradduallyAccelerateTowardsPoint_1A_4:
    LDA.W #$0004                                                         ;A9F458;
    STA.B DP_Temp1A                                                      ;A9F45B;
    BRA GradduallyAccelerateTowardsPoint                                 ;A9F45D;


;;; $F45F: Gradually accelerate towards point - $1A = 8 ;;;
GradduallyAccelerateTowardsPoint_1A_8:
    LDA.W #$0008                                                         ;A9F45F;
    STA.B DP_Temp1A                                                      ;A9F462;
    BRA GradduallyAccelerateTowardsPoint                                 ;A9F464;


;;; $F466: Gradually accelerate towards point - $1A = 10h ;;;
GradduallyAccelerateTowardsPoint_1A_10:
    LDA.W #$0010                                                         ;A9F466;
    STA.B DP_Temp1A                                                      ;A9F469; fallthrough to GradduallyAccelerateTowardsPoint


;;; $F46B: Gradually accelerate towards point ;;;
GradduallyAccelerateTowardsPoint:
;; Parameters:
;;     Y: Acceleration divisor table index. Range 0..Fh, lower = slower
;;     $12: Target X position
;;     $14: Target Y position
;;     $1A: Extra X speed if enemy is moving the wrong way and is horizontally off-screen. Unit is 1/100h px/frame
    LDA.W GradualAccelerationDivisorTable,Y                              ;A9F46B;
    AND.W #$00FF                                                         ;A9F46E;
    STA.B DP_Temp18                                                      ;A9F471;
    JSR.W GraduallyAccelerateHorizontally                                ;A9F473;
    LDA.W Enemy.YPosition,X                                              ;A9F476;
    SEC                                                                  ;A9F479;
    SBC.B DP_Temp14                                                      ;A9F47A;
    BEQ .return                                                          ;A9F47C;
    BPL .up                                                              ;A9F47E;
    EOR.W #$FFFF                                                         ;A9F480;
    INC                                                                  ;A9F483;
    STA.W $4204                                                          ;A9F484;
    SEP #$20                                                             ;A9F487;
    LDA.B DP_Temp18                                                      ;A9F489;
    STA.W $4206                                                          ;A9F48B;
    REP #$20                                                             ;A9F48E;
    XBA                                                                  ;A9F490;
    XBA                                                                  ;A9F491;
    NOP                                                                  ;A9F492;
    NOP                                                                  ;A9F493;
    LDA.W $4214                                                          ;A9F494;
    BNE +                                                                ;A9F497;
    INC                                                                  ;A9F499;

+   STA.B DP_Temp16                                                      ;A9F49A;
    LDA.W BabyMetroid.YVelocity,X                                        ;A9F49C;
    BPL .movingDown                                                      ;A9F49F;
    CLC                                                                  ;A9F4A1;
    ADC.W #$0008                                                         ;A9F4A2;
    ADC.B DP_Temp16                                                      ;A9F4A5;

  .movingDown:
    ADC.B DP_Temp16                                                      ;A9F4A7;
    CMP.W #$0500                                                         ;A9F4A9;
    BMI .storeDownwardVelocity                                           ;A9F4AC;
    LDA.W #$0500                                                         ;A9F4AE;

  .storeDownwardVelocity:
    STA.W BabyMetroid.YVelocity,X                                        ;A9F4B1;

  .return:
    RTS                                                                  ;A9F4B4;

  .up:
    STA.W $4204                                                          ;A9F4B5;
    SEP #$20                                                             ;A9F4B8;
    LDA.B DP_Temp18                                                      ;A9F4BA;
    STA.W $4206                                                          ;A9F4BC;
    REP #$20                                                             ;A9F4BF;
    XBA                                                                  ;A9F4C1;
    XBA                                                                  ;A9F4C2;
    NOP                                                                  ;A9F4C3;
    NOP                                                                  ;A9F4C4;
    LDA.W $4214                                                          ;A9F4C5;
    BNE +                                                                ;A9F4C8;
    INC                                                                  ;A9F4CA;

+   STA.B DP_Temp16                                                      ;A9F4CB;
    LDA.W BabyMetroid.YVelocity,X                                        ;A9F4CD;
    BMI .movingUp                                                        ;A9F4D0;
    SEC                                                                  ;A9F4D2;
    SBC.W #$0008                                                         ;A9F4D3;
    SBC.B DP_Temp16                                                      ;A9F4D6;

  .movingUp:
    SBC.B DP_Temp16                                                      ;A9F4D8;
    CMP.W #$FB00                                                         ;A9F4DA;
    BPL .storeUpwardVelocity                                             ;A9F4DD;
    LDA.W #$FB00                                                         ;A9F4DF;

  .storeUpwardVelocity:
    STA.W BabyMetroid.YVelocity,X                                        ;A9F4E2;
    RTS                                                                  ;A9F4E5;


;;; $F4E6: Gradually accelerate horizontally ;;;
GraduallyAccelerateHorizontally:
;; Parameters:
;;     $12: Target X position
;;     $18: Acceleration divisor
;;     $1A: Extra speed if enemy is moving the wrong way and is off-screen. Unit is 1/100h px/frame

; Given initial X position x_0 and assuming initial X velocity 0, solving
;     x''(t) = (8 + ([$12] - x(t)) / [$18]) / 100h
; gives
;     x(t) = [$12] + 8 * [$18] - ([$12] + 8 * [$18] - x_0) cos(t / (10h * sqrt([$18])))

; Which takes 10h * sqrt([$18]) arccos(8 * [$18] / ([$12] + 8 * [$18] - x_0)) frames to reach the target position,
;     with [$18] = 10h, that's 40h arccos(80h / ([$12] + 80h - x_0)) frames (range 0..78)
;     with [$18] = 1, that's 10h arccos(8 / ([$12] + 8 - x_0)) frames (range 0..24)
    LDA.W Enemy.XPosition,X                                              ;A9F4E6;
    SEC                                                                  ;A9F4E9;
    SBC.B DP_Temp12                                                      ;A9F4EA;
    BEQ .return                                                          ;A9F4EC;
    BPL .left                                                            ;A9F4EE;
    EOR.W #$FFFF                                                         ;A9F4F0;
    INC                                                                  ;A9F4F3;
    STA.W $4204                                                          ;A9F4F4;
    SEP #$20                                                             ;A9F4F7;
    LDA.B DP_Temp18                                                      ;A9F4F9;
    STA.W $4206                                                          ;A9F4FB;
    REP #$20                                                             ;A9F4FE;
    XBA                                                                  ;A9F500;
    XBA                                                                  ;A9F501;
    NOP                                                                  ;A9F502;
    NOP                                                                  ;A9F503;
    LDA.W $4214                                                          ;A9F504;
    BNE +                                                                ;A9F507;
    INC                                                                  ;A9F509;

+   STA.B DP_Temp16                                                      ;A9F50A;
    LDA.W BabyMetroid.XVelocity,X                                        ;A9F50C;
    BPL .movingRight                                                     ;A9F50F;
    PHA                                                                  ;A9F511;
    JSL.L CheckIfEnemyIsVagulyOnScreen                                   ;A9F512;
    PLA                                                                  ;A9F516;
    BCC .onScreenRight                                                   ;A9F517;
    ADC.B DP_Temp1A                                                      ;A9F519;

  .onScreenRight:
    CLC                                                                  ;A9F51B;
    ADC.W #$0008                                                         ;A9F51C;
    ADC.B DP_Temp16                                                      ;A9F51F;

  .movingRight:
    ADC.B DP_Temp16                                                      ;A9F521;
    CMP.W #$0800                                                         ;A9F523;
    BMI .storeRightwardVelocity                                          ;A9F526;
    LDA.W #$0800                                                         ;A9F528;

  .storeRightwardVelocity:
    STA.W BabyMetroid.XVelocity,X                                        ;A9F52B;

  .return:
    RTS                                                                  ;A9F52E;

  .left:
    STA.W $4204                                                          ;A9F52F;
    SEP #$20                                                             ;A9F532;
    LDA.B DP_Temp18                                                      ;A9F534;
    STA.W $4206                                                          ;A9F536;
    REP #$20                                                             ;A9F539;
    XBA                                                                  ;A9F53B;
    XBA                                                                  ;A9F53C;
    NOP                                                                  ;A9F53D;
    NOP                                                                  ;A9F53E;
    LDA.W $4214                                                          ;A9F53F;
    BNE +                                                                ;A9F542;
    INC                                                                  ;A9F544;

+   STA.B DP_Temp16                                                      ;A9F545;
    LDA.W BabyMetroid.XVelocity,X                                        ;A9F547;
    BMI .movingLeft                                                      ;A9F54A;
    PHA                                                                  ;A9F54C;
    JSL.L CheckIfEnemyIsVagulyOnScreen                                   ;A9F54D;
    PLA                                                                  ;A9F551;
    BCC ..onScreen                                                       ;A9F552;
    SBC.B DP_Temp1A                                                      ;A9F554;

  ..onScreen:
    SEC                                                                  ;A9F556;
    SBC.W #$0008                                                         ;A9F557;
    SBC.B DP_Temp16                                                      ;A9F55A;

  .movingLeft:
    SBC.B DP_Temp16                                                      ;A9F55C;
    CMP.W #$F800                                                         ;A9F55E;
    BPL .storeLeftwardVelocity                                           ;A9F561;
    LDA.W #$F800                                                         ;A9F563;

  .storeLeftwardVelocity:
    STA.W BabyMetroid.XVelocity,X                                        ;A9F566;
    RTS                                                                  ;A9F569;


;;; $F56A: Gradual acceleration divisor table ;;;
GradualAccelerationDivisorTable:
    db $10,$0F,$0E,$0D,$0C,$0B,$0A,$09,$08,$07,$06,$05,$04,$03,$02,$01   ;A9F56A;


;;; $F57A: Check if enemy is vaguely on screen ;;;
CheckIfEnemyIsVagulyOnScreen:
;; Returns:
;;     Carry: Set if off-screen, otherwise clear
    LDA.W Enemy.YPosition,X                                              ;A9F57A;
    BMI .returnOffScreen                                                 ;A9F57D;
    CLC                                                                  ;A9F57F;
    ADC.W #$0060                                                         ;A9F580;
    SEC                                                                  ;A9F583;
    SBC.W Layer1YPosition                                                ;A9F584;
    BMI .returnOffScreen                                                 ;A9F587;
    CMP.W #$01A0                                                         ;A9F589;
    BPL .returnOffScreen                                                 ;A9F58C;
    LDA.W Enemy.XPosition,X                                              ;A9F58E;
    BMI .returnOffScreen                                                 ;A9F591;
    CLC                                                                  ;A9F593;
    ADC.W #$0010                                                         ;A9F594;
    SEC                                                                  ;A9F597;
    SBC.W Layer1XPosition                                                ;A9F598;
    BMI .returnOffScreen                                                 ;A9F59B;
    CMP.W #$0120                                                         ;A9F59D;
    BPL .returnOffScreen                                                 ;A9F5A0;
    CLC                                                                  ;A9F5A2;
    RTL                                                                  ;A9F5A3;

  .returnOffScreen:
    SEC                                                                  ;A9F5A4;
    RTL                                                                  ;A9F5A5;


;;; $F5A6: Accelerate Shitroid towards point ;;;
AccelerateBabyMetroidTowardsPoint:
;; Parameters:
;;     A: Acceleration. Unit is 1/100h px/frame^2
;;     $12: Target X position
;;     $14: Target Y position
;; Returns:
;;     Carry: Set if reached target position
    STA.B DP_Temp16                                                      ;A9F5A6;
    STZ.B DP_Temp1C                                                      ;A9F5A8;
    JSR.W AccelerateBabyMetroidTowardsXPosition                          ;A9F5AA;
    JSR.W AccelerateBabyMetroidTowardsYPosition                          ;A9F5AD;
    LSR.B DP_Temp1C                                                      ;A9F5B0;
    LSR.B DP_Temp1C                                                      ;A9F5B2;
    RTS                                                                  ;A9F5B4;


;;; $F5B5: Accelerate Shitroid towards Y position ;;;
AccelerateBabyMetroidTowardsYPosition:
;; Parameters:
;;     $14: Target Y position
;;     $16: Acceleration. Unit is 1/100h px/frame^2

; Increments $1C if reached target position
    LDA.W Enemy.YPosition,X                                              ;A9F5B5;
    SEC                                                                  ;A9F5B8;
    SBC.B DP_Temp14                                                      ;A9F5B9;
    BEQ .reachedTarget                                                   ;A9F5BB;
    BPL .up                                                              ;A9F5BD;
    LDA.W BabyMetroid.YVelocity,X                                        ;A9F5BF;
    CLC                                                                  ;A9F5C2;
    ADC.B DP_Temp16                                                      ;A9F5C3;
    CMP.W #$0500                                                         ;A9F5C5;
    BMI +                                                                ;A9F5C8;
    LDA.W #$0500                                                         ;A9F5CA;

+   STA.W BabyMetroid.YVelocity,X                                        ;A9F5CD;
    AND.W #$FF00                                                         ;A9F5D0;
    XBA                                                                  ;A9F5D3;
    BPL +                                                                ;A9F5D4;
    ORA.W #$FF00                                                         ;A9F5D6;

+   CLC                                                                  ;A9F5D9;
    ADC.W Enemy.YPosition,X                                              ;A9F5DA;
    CMP.B DP_Temp14                                                      ;A9F5DD;
    BMI .returnUpper                                                     ;A9F5DF;
    STZ.W BabyMetroid.YVelocity,X                                        ;A9F5E1;
    LDA.B DP_Temp14                                                      ;A9F5E4;

  .reachedTarget:
    INC.B DP_Temp1C                                                      ;A9F5E6;

  .returnUpper:
    RTS                                                                  ;A9F5E8;

  .up:
    LDA.W BabyMetroid.YVelocity,X                                        ;A9F5E9;
    SEC                                                                  ;A9F5EC;
    SBC.B DP_Temp16                                                      ;A9F5ED;
    CMP.W #$FB00                                                         ;A9F5EF;
    BPL +                                                                ;A9F5F2;
    LDA.W #$FB00                                                         ;A9F5F4;

+   STA.W BabyMetroid.YVelocity,X                                        ;A9F5F7;
    AND.W #$FF00                                                         ;A9F5FA;
    XBA                                                                  ;A9F5FD;
    BPL +                                                                ;A9F5FE;
    ORA.W #$FF00                                                         ;A9F600;

+   CLC                                                                  ;A9F603;
    ADC.W Enemy.YPosition,X                                              ;A9F604;
    CMP.B DP_Temp14                                                      ;A9F607;
    BEQ .resetVelocity                                                   ;A9F609;
    BPL .returnLower                                                     ;A9F60B;

  .resetVelocity:
    STZ.W BabyMetroid.YVelocity,X                                        ;A9F60D;
    LDA.B DP_Temp14                                                      ;A9F610;
    INC.B DP_Temp1C                                                      ;A9F612;

  .returnLower:
    RTS                                                                  ;A9F614;


;;; $F615: Accelerate Shitroid towards X position ;;;
AccelerateBabyMetroidTowardsXPosition:
;; Parameters:
;;     $12: Target X position
;;     $16: Acceleration. Unit is 1/100h px/frame^2

; Increments $1C if reached target position
    LDA.W Enemy.XPosition,X                                              ;A9F615;
    SEC                                                                  ;A9F618;
    SBC.B DP_Temp12                                                      ;A9F619;
    BPL .left                                                            ;A9F61B;
    EOR.W #$FFFF                                                         ;A9F61D;
    INC                                                                  ;A9F620;
    LDA.W BabyMetroid.XVelocity,X                                        ;A9F621;
    CLC                                                                  ;A9F624;
    ADC.B DP_Temp16                                                      ;A9F625;
    CMP.W #$0500                                                         ;A9F627;
    BMI +                                                                ;A9F62A;
    LDA.W #$0500                                                         ;A9F62C;

+   STA.W BabyMetroid.XVelocity,X                                        ;A9F62F;
    AND.W #$FF00                                                         ;A9F632;
    XBA                                                                  ;A9F635;
    BPL +                                                                ;A9F636;
    ORA.W #$FF00                                                         ;A9F638;

+   CLC                                                                  ;A9F63B;
    ADC.W Enemy.XPosition,X                                              ;A9F63C;
    CMP.B DP_Temp12                                                      ;A9F63F;
    BMI .returnUpper                                                     ;A9F641;
    STZ.W BabyMetroid.XVelocity,X                                        ;A9F643;
    LDA.B DP_Temp12                                                      ;A9F646;
    INC.B DP_Temp1C                                                      ;A9F648;

  .returnUpper:
    RTS                                                                  ;A9F64A;

  .left:
    LDA.W BabyMetroid.XVelocity,X                                        ;A9F64B;
    SEC                                                                  ;A9F64E;
    SBC.B DP_Temp16                                                      ;A9F64F;
    CMP.W #$FB00                                                         ;A9F651;
    BPL +                                                                ;A9F654;
    LDA.W #$FB00                                                         ;A9F656;

+   STA.W BabyMetroid.XVelocity,X                                        ;A9F659;
    AND.W #$FF00                                                         ;A9F65C;
    XBA                                                                  ;A9F65F;
    BPL +                                                                ;A9F660;
    ORA.W #$FF00                                                         ;A9F662;

+   CLC                                                                  ;A9F665;
    ADC.W Enemy.XPosition,X                                              ;A9F666;
    CMP.B DP_Temp12                                                      ;A9F669;
    BEQ .resetVelocity                                                   ;A9F66B;
    BPL .returnLower                                                     ;A9F66D;

  .resetVelocity:
    STZ.W BabyMetroid.XVelocity,X                                        ;A9F66F;
    LDA.B DP_Temp12                                                      ;A9F672;
    INC.B DP_Temp1C                                                      ;A9F674;

  .returnLower:
    RTS                                                                  ;A9F676;


;;; $F677: Handle normal Shitroid palette ;;;
HandleNormalBabyMetroidPalette:
    LDA.W #$014A                                                         ;A9F677;
    STA.B DP_Temp12                                                      ;A9F67A;
    LDA.W #BabyMetroidColors_Normal                                      ;A9F67C;
    STA.B DP_Temp16                                                      ;A9F67F;
    BRA HandleBabyMetroidPalette                                         ;A9F681;


;;; $F683: Handle Shitroid in cutscene palette - normal ;;;
HandleBabyMetroidCutscenePalette_Normal:
    LDA.W #$01EA                                                         ;A9F683;
    STA.B DP_Temp12                                                      ;A9F686;
    LDA.W #BabyMetroidColors_Normal                                      ;A9F688;
    STA.B DP_Temp16                                                      ;A9F68B;
    BRA HandleBabyMetroidPalette                                         ;A9F68D;


;;; $F68F: Handle Shitroid in cutscene palette - low health ;;;
HandleBabyMetroidCutscenePalette_LowHealth:
    LDA.W #$01EA                                                         ;A9F68F;
    STA.B DP_Temp12                                                      ;A9F692;
    LDA.W #BabyMetroidColors_LowHealth                                   ;A9F694;
    STA.B DP_Temp16                                                      ;A9F697; fallthrough to HandleBabyMetroidPalette


;;; $F699: Handle Shitroid palette ;;;
HandleBabyMetroidPalette:
;; Parameters:
;;     $12: Colour index
;;     $16: Colour table pointer

; Also handles Shitroid cry sound effect
    LDX.W EnemyIndex                                                     ;A9F699;
    SEP #$20                                                             ;A9F69C;
    LDA.W BabyMetroid.paletteHandlerTimer,X                              ;A9F69E;
    BEQ .timerExpired                                                    ;A9F6A1;
    DEC                                                                  ;A9F6A3;
    STA.W BabyMetroid.paletteHandlerTimer,X                              ;A9F6A4;
    REP #$20                                                             ;A9F6A7;
    RTS                                                                  ;A9F6A9;

  .timerExpired:
    LDA.W BabyMetroid.paletteHandlerDelay,X                              ;A9F6AA;
    STA.W BabyMetroid.paletteHandlerTimer,X                              ;A9F6AD;
    LDA.W BabyMetroid.paletteFrameTimer,X                                ;A9F6B0;
    INC                                                                  ;A9F6B3;
    AND.B #$07                                                           ;A9F6B4;
    STA.W BabyMetroid.paletteFrameTimer,X                                ;A9F6B6;
    REP #$20                                                             ;A9F6B9;
    AND.W #$00FF                                                         ;A9F6BB;
    JSR.W HandleBabyMetroidCrySFX                                        ;A9F6BE;
    ASL                                                                  ;A9F6C1;
    ASL                                                                  ;A9F6C2;
    ASL                                                                  ;A9F6C3;
    ADC.B DP_Temp16                                                      ;A9F6C4;
    TAY                                                                  ;A9F6C6;
    LDX.B DP_Temp12                                                      ;A9F6C7;
    LDA.W #$0004                                                         ;A9F6C9;
    JSL.L WriteAColorsFromYtoColorIndexX                                 ;A9F6CC;
    RTS                                                                  ;A9F6D0;


;;; $F6D1: Shitroid colours - normal ;;;
BabyMetroidColors_Normal:                                                ;A9F6D1;
    dw $72FF,$2CDF,$24B9,$1CAF
    dw $5E5F,$183F,$1014,$080A
    dw $49BA,$041A,$000F,$0005
    dw $3515,$0015,$000A,$0005
    dw $3515,$0015,$000A,$0005
    dw $49BA,$041A,$000F,$0005
    dw $5E5F,$183F,$1014,$080A
    dw $72FF,$2CDF,$24B9,$1CAF


;;; $F711: Shitroid colours - low health ;;;
BabyMetroidColors_LowHealth:                                             ;A9F711;
    dw $5990,$3870,$346D,$3068
    dw $494D,$306D,$284A,$2446
    dw $3D0B,$244B,$2048,$1844
    dw $2CC8,$1C48,$1425,$0C22
    dw $2CC8,$1C48,$1425,$0C22
    dw $3D0B,$244B,$2048,$1844
    dw $494D,$306D,$284A,$2446
    dw $5990,$3870,$346D,$3068


;;; $F751: Handle Shitroid cry sound effect ;;;
HandleBabyMetroidCrySFX:
;; Parameters:
;;     A: Enemy palette frame timer
    CMP.W #$0005                                                         ;A9F751;
    BEQ .timerExpired                                                    ;A9F754;
    RTS                                                                  ;A9F756;

  .timerExpired:
    PHA                                                                  ;A9F757;
    PHY                                                                  ;A9F758;
    LDA.L BabyMetroid.crySFXFlag,X                                       ;A9F759;
    BEQ .return                                                          ;A9F75D;
    LDA.L BabyMetroid.crySFXTimer,X                                      ;A9F75F;
    INC                                                                  ;A9F763;
    STA.L BabyMetroid.crySFXTimer,X                                      ;A9F764;
    CMP.W #$0004                                                         ;A9F768;
    BCC .return                                                          ;A9F76B;
    LDA.W #$0000                                                         ;A9F76D;
    STA.L BabyMetroid.crySFXTimer,X                                      ;A9F770;
    LDA.W #$0072                                                         ;A9F774;
    LDY.W BabyMetroid.paletteHandlerDelay,X                              ;A9F777;
    CPY.W #$000A                                                         ;A9F77A;
    BCS .queueSFX                                                        ;A9F77D;
    LDA.W #$0078                                                         ;A9F77F;

  .queueSFX:
    JSL.L QueueSound_Lib2_Max6                                           ;A9F782;

  .return:
    PLY                                                                  ;A9F786;
    PLA                                                                  ;A9F787;
    RTS                                                                  ;A9F788;


;;; $F789: Enemy touch - enemy $EEBF (Shitroid) ;;;
EnemyTouch_BabyMetroid:
    LDX.W EnemyIndex                                                     ;A9F789;
    LDA.W BabyMetroid.contactReactionFlag,X                              ;A9F78C;
    BEQ .return                                                          ;A9F78F;
    JSR.W SignalBabyMetroidToLeave                                       ;A9F791;
    LDA.W MovementType                                                   ;A9F794;
    AND.W #$00FF                                                         ;A9F797;
    CMP.W #$0003                                                         ;A9F79A;
    BNE .notSpinJumping                                                  ;A9F79D;
    LDA.W SamusXPosition                                                 ;A9F79F;
    CMP.W #$0200                                                         ;A9F7A2;
    BPL .repelled                                                        ;A9F7A5;

  .notSpinJumping:
    LDA.W BabyMetroid.function,X                                         ;A9F7A7;
    CMP.W #Function_BabyMetroid_LatchOntoSamus                           ;A9F7AA;
    BEQ .latchedOntoSamus                                                ;A9F7AD;
    CMP.W #Function_BabyMetroid_StareDownSamus                           ;A9F7AF;
    BNE .return                                                          ;A9F7B2;
    LDA.W #Function_BabyMetroid_LatchOntoSamus                           ;A9F7B4;
    STA.W BabyMetroid.function,X                                         ;A9F7B7;

  .return:
    RTL                                                                  ;A9F7BA;

  .latchedOntoSamus:
    LDA.W SamusXPosition                                                 ;A9F7BB;
    STA.B DP_Temp12                                                      ;A9F7BE;
    LDA.W SamusYPosition                                                 ;A9F7C0;
    SEC                                                                  ;A9F7C3;
    SBC.W #$0020                                                         ;A9F7C4;
    STA.B DP_Temp14                                                      ;A9F7C7;
    LDA.W #$0200                                                         ;A9F7C9;
    JSR.W AccelerateBabyMetroidTowardsPoint                              ;A9F7CC;
    BCC .return                                                          ;A9F7CF;
    LDX.W EnemyIndex                                                     ;A9F7D1;
    LDA.W #InstList_BabyMetroid_LatchedOn                                ;A9F7D4;
    STA.W Enemy.instList,X                                               ;A9F7D7;
    LDA.W #$0001                                                         ;A9F7DA;
    STA.W Enemy.instTimer,X                                              ;A9F7DD;
    STZ.W Enemy.loopCounter,X                                            ;A9F7E0;
    LDA.W #$0001                                                         ;A9F7E3;
    STA.W BabyMetroid.paletteHandlerDelay,X                              ;A9F7E6;
    STZ.W BabyMetroid.contactReactionFlag,X                              ;A9F7E9;
    STZ.W BabyMetroid.XVelocity,X                                        ;A9F7EC;
    STZ.W BabyMetroid.YVelocity,X                                        ;A9F7EF;
    LDA.W #Function_BabyMetroid_StartDrainingSamus                       ;A9F7F2;
    STA.W BabyMetroid.function,X                                         ;A9F7F5;
    RTL                                                                  ;A9F7F8;

  .repelled:
    LDA.W SamusXPosition                                                 ;A9F7F9;
    SEC                                                                  ;A9F7FC;
    SBC.W Enemy.XPosition,X                                              ;A9F7FD;
    STA.B DP_Temp12                                                      ;A9F800;
    LDA.W SamusYPosition                                                 ;A9F802;
    SEC                                                                  ;A9F805;
    SBC.W Enemy.YPosition,X                                              ;A9F806;
    STA.B DP_Temp14                                                      ;A9F809;
    JSL.L CalculateAngleOf_12_14_Offset                                  ;A9F80B;
    SEC                                                                  ;A9F80F;
    SBC.W #$0080                                                         ;A9F810;
    EOR.W #$FFFF                                                         ;A9F813;
    INC                                                                  ;A9F816;
    CLC                                                                  ;A9F817;
    ADC.W #$0080                                                         ;A9F818;
    AND.W #$00FF                                                         ;A9F81B;
    STA.B DP_Temp12                                                      ;A9F81E;
    LDA.W #$0040                                                         ;A9F820;
    PHA                                                                  ;A9F823;
    JSL.L CalculateXVelocityFromSpeedAndAngle                            ;A9F824;
    LDX.W EnemyIndex                                                     ;A9F828;
    CLC                                                                  ;A9F82B;
    ADC.W BabyMetroid.XVelocity,X                                        ;A9F82C;
    STA.W BabyMetroid.XVelocity,X                                        ;A9F82F;
    PLA                                                                  ;A9F832;
    JSL.L CalculateYVelocityFromSpeedAndAngle                            ;A9F833;
    LDX.W EnemyIndex                                                     ;A9F837;
    CLC                                                                  ;A9F83A;
    ADC.W BabyMetroid.YVelocity,X                                        ;A9F83B;
    STA.W BabyMetroid.YVelocity,X                                        ;A9F83E;
    RTL                                                                  ;A9F841;


;;; $F842: Enemy shot - enemy $EEBF (Shitroid) ;;;
EnemyShot_BabyMetroid:
    LDX.W EnemyIndex                                                     ;A9F842;
    LDA.W BabyMetroid.contactReactionFlag,X                              ;A9F845;
    BEQ .return                                                          ;A9F848;
    JSR.W SignalBabyMetroidToLeave                                       ;A9F84A;
    LDA.W SamusProjectile_XPositions                                     ;A9F84D;
    SEC                                                                  ;A9F850;
    SBC.W Enemy.XPosition,X                                              ;A9F851;
    STA.B DP_Temp12                                                      ;A9F854;
    LDA.W SamusProjectile_YPositions                                     ;A9F856;
    SEC                                                                  ;A9F859;
    SBC.W Enemy.YPosition,X                                              ;A9F85A;
    STA.B DP_Temp14                                                      ;A9F85D;
    JSL.L CalculateAngleOf_12_14_Offset                                  ;A9F85F;
    SEC                                                                  ;A9F863;
    SBC.W #$0080                                                         ;A9F864;
    EOR.W #$FFFF                                                         ;A9F867;
    INC                                                                  ;A9F86A;
    CLC                                                                  ;A9F86B;
    ADC.W #$0080                                                         ;A9F86C;
    AND.W #$00FF                                                         ;A9F86F;
    STA.B DP_Temp12                                                      ;A9F872;
    LDA.W CollisionIndex                                                 ;A9F874;
    ASL                                                                  ;A9F877;
    TAX                                                                  ;A9F878;
    LDA.W SamusProjectile_Damages,X                                      ;A9F879;
    ASL                                                                  ;A9F87C;
    ASL                                                                  ;A9F87D;
    ASL                                                                  ;A9F87E;
    CMP.W #$00F0                                                         ;A9F87F;
    BCC +                                                                ;A9F882;
    LDA.W #$00F0                                                         ;A9F884;

+   PHA                                                                  ;A9F887;
    JSL.L CalculateXVelocityFromSpeedAndAngle                            ;A9F888;
    LDX.W EnemyIndex                                                     ;A9F88C;
    CLC                                                                  ;A9F88F;
    ADC.W BabyMetroid.XVelocity,X                                        ;A9F890;
    STA.W BabyMetroid.XVelocity,X                                        ;A9F893;
    PLA                                                                  ;A9F896;
    JSL.L CalculateYVelocityFromSpeedAndAngle                            ;A9F897;
    LDX.W EnemyIndex                                                     ;A9F89B;
    CLC                                                                  ;A9F89E;
    ADC.W BabyMetroid.YVelocity,X                                        ;A9F89F;
    STA.W BabyMetroid.YVelocity,X                                        ;A9F8A2;

  .return:
    RTL                                                                  ;A9F8A5;


;;; $F8A6: Palette - enemy $ED7F/$EDFF/$EE3F/$EE7F (dead monsters) ;;;
Palette_CorpseCommon:
    dw $3800,$57FF,$42F7,$0929,$00A5,$7FFF,$4231,$0043                   ;A9F8A6;
    dw $4B3F,$42DB,$3678,$2E14,$2190,$192C,$0CC9,$0465                   ;A9F8B6;


;;; $F8C6: Palette - Shitroid's sidehopper ;;;
Palette_CorpseSidehopper:
    dw $3800,$7FFF,$56E0,$3180,$18C0,$6BC0,$5EC0,$4A20                   ;A9F8C6;
    dw $35A0,$7FFF,$039C,$0237,$00D1,$03FF,$0237,$00D1                   ;A9F8D6;


;;; $F8E6: Palette - enemy $ECBF/$EEBF (Shitroid) ;;;
Palette_BabyMetroid:
    dw $3800,$57B8,$0B11,$1646,$00E3,$72FF,$2CDF,$24B9                   ;A9F8E6;
    dw $1CAF,$18A9,$4F9F,$3ED8,$2E12,$08CD,$7FFF,$0000                   ;A9F8F6;


;;; $F906: Instruction list - finish draining ;;;
InstList_BabyMetroid_FinishDraining:
    dw $0080,Spritemap_BabyMetroid_2                                     ;A9F906;
    dw $0010,Spritemap_BabyMetroid_1                                     ;A9F90A;


;;; $F90E: Instruction list - normal ;;;
InstList_BabyMetroid_Normal:
    dw $0010,Spritemap_BabyMetroid_0                                     ;A9F90E;
    dw $0010,Spritemap_BabyMetroid_1                                     ;A9F912;
    dw $0010,Spritemap_BabyMetroid_2                                     ;A9F916;
    dw $0010,Spritemap_BabyMetroid_1                                     ;A9F91A;
    dw Instruction_BabyMetroid_GotoNormal                                ;A9F91E;


;;; $F920: Instruction - go to InstList_BabyMetroid_Normal ;;;
Instruction_BabyMetroid_GotoNormal:
    LDY.W #InstList_BabyMetroid_Normal                                   ;A9F920;
    RTL                                                                  ;A9F923;


;;; $F924: Instruction list - latched on ;;;
InstList_BabyMetroid_LatchedOn:
    dw $0008,Spritemap_BabyMetroid_0                                     ;A9F924;
    dw $0008,Spritemap_BabyMetroid_1                                     ;A9F928;
    dw $0005,Spritemap_BabyMetroid_2                                     ;A9F92C;
    dw $0002,Spritemap_BabyMetroid_1                                     ;A9F930;
    dw Instruction_GotoLatchedOn                                         ;A9F934;


;;; $F936: Instruction - go to InstList_BabyMetroid_LatchedOn ;;;
Instruction_GotoLatchedOn:
    LDY.W #InstList_BabyMetroid_LatchedOn                                ;A9F936;
    RTL                                                                  ;A9F939;


;;; $F93A: Instruction list - remorse ;;;
InstList_BabyMetroid_Remorse:
    dw $000A,Spritemap_BabyMetroid_0                                     ;A9F93A;
    dw $000A,Spritemap_BabyMetroid_1                                     ;A9F93E;
    dw $000A,Spritemap_BabyMetroid_2                                     ;A9F942;
    dw $000A,Spritemap_BabyMetroid_1                                     ;A9F946;
    dw $000A,Spritemap_BabyMetroid_0                                     ;A9F94A;
    dw $000A,Spritemap_BabyMetroid_1                                     ;A9F94E;
    dw $000A,Spritemap_BabyMetroid_2                                     ;A9F952;
    dw $000A,Spritemap_BabyMetroid_1                                     ;A9F956;
    dw Instruction_BabyMetroid_GotoY_OrPlayRemorseSFX                    ;A9F95A;
    dw InstList_BabyMetroid_Remorse                                      ;A9F95C;
    dw $0006,Spritemap_BabyMetroid_0                                     ;A9F95E;
    dw $0005,Spritemap_BabyMetroid_1                                     ;A9F962;
    dw $0004,Spritemap_BabyMetroid_2                                     ;A9F966;
    dw $0003,Spritemap_BabyMetroid_1                                     ;A9F96A;
    dw $0002,Spritemap_BabyMetroid_0                                     ;A9F96E;
    dw $0003,Spritemap_BabyMetroid_1                                     ;A9F972;
    dw $0004,Spritemap_BabyMetroid_2                                     ;A9F976;
    dw $0005,Spritemap_BabyMetroid_1                                     ;A9F97A;
    dw $0006,Spritemap_BabyMetroid_0                                     ;A9F97E;
    dw $0007,Spritemap_BabyMetroid_1                                     ;A9F982;
    dw $0008,Spritemap_BabyMetroid_2                                     ;A9F986;
    dw $0009,Spritemap_BabyMetroid_1                                     ;A9F98A;
    dw Instruction_BabyMetroid_GotoRemorse                               ;A9F98E;


;;; $F990: Instruction - go to InstList_BabyMetroid_Remorse ;;;
Instruction_BabyMetroid_GotoRemorse:
    LDY.W #InstList_BabyMetroid_Remorse                                  ;A9F990;
    RTL                                                                  ;A9F993;


;;; $F994: Instruction - go to [[Y]] or queue Shitroid feels remorse sound effect ;;;
Instruction_BabyMetroid_GotoY_OrPlayRemorseSFX:
    LDA.W RandomNumberSeed                                               ;A9F994;
    BPL .gotoY                                                           ;A9F997;
    LDA.W #$0052                                                         ;A9F999;
    JSL.L QueueSound_Lib2_Max6                                           ;A9F99C;
    INY                                                                  ;A9F9A0;
    INY                                                                  ;A9F9A1;
    RTL                                                                  ;A9F9A2;

  .gotoY:
    LDA.W $0000,Y                                                        ;A9F9A3;
    TAY                                                                  ;A9F9A6;
    RTL                                                                  ;A9F9A7;


;;; $F9A8: Shitroid spritemaps ;;;
Spritemap_BabyMetroid_0:
    dw $001E                                                             ;A9F9A8;
    %spritemapEntry(0, $00, $18, 0, 1, 2, 0, $120)
    %spritemapEntry(0, $1F8, $18, 0, 0, 2, 0, $120)
    %spritemapEntry(1, $4208, $18, 0, 1, 2, 0, $105)
    %spritemapEntry(1, $43E8, $18, 0, 0, 2, 0, $105)
    %spritemapEntry(1, $4210, $18, 0, 1, 2, 0, $104)
    %spritemapEntry(1, $43E0, $18, 0, 0, 2, 0, $104)
    %spritemapEntry(1, $4200, $08, 0, 1, 2, 0, $148)
    %spritemapEntry(1, $43F0, $08, 0, 0, 2, 0, $148)
    %spritemapEntry(1, $4208, $08, 0, 1, 2, 0, $147)
    %spritemapEntry(1, $4218, $08, 0, 1, 2, 0, $145)
    %spritemapEntry(1, $43E8, $08, 0, 0, 2, 0, $147)
    %spritemapEntry(1, $43D8, $08, 0, 0, 2, 0, $145)
    %spritemapEntry(1, $4218, $F8, 0, 1, 2, 0, $125)
    %spritemapEntry(1, $4208, $F8, 0, 1, 2, 0, $127)
    %spritemapEntry(1, $4200, $F8, 0, 1, 2, 0, $128)
    %spritemapEntry(1, $43F0, $F8, 0, 0, 2, 0, $128)
    %spritemapEntry(1, $43E8, $F8, 0, 0, 2, 0, $127)
    %spritemapEntry(1, $43D8, $F8, 0, 0, 2, 0, $125)
    %spritemapEntry(0, $18, $E0, 0, 1, 2, 0, $131)
    %spritemapEntry(1, $4218, $E8, 0, 1, 2, 0, $140)
    %spritemapEntry(1, $4208, $E8, 0, 1, 2, 0, $142)
    %spritemapEntry(1, $4208, $D8, 0, 1, 2, 0, $122)
    %spritemapEntry(1, $4200, $D8, 0, 1, 2, 0, $123)
    %spritemapEntry(1, $4200, $E8, 0, 1, 2, 0, $143)
    %spritemapEntry(1, $43F0, $E8, 0, 0, 2, 0, $143)
    %spritemapEntry(1, $43F0, $D8, 0, 0, 2, 0, $123)
    %spritemapEntry(0, $1E0, $E0, 0, 0, 2, 0, $131)
    %spritemapEntry(1, $43D8, $E8, 0, 0, 2, 0, $140)
    %spritemapEntry(1, $43E8, $E8, 0, 0, 2, 0, $142)
    %spritemapEntry(1, $43E8, $D8, 0, 0, 2, 0, $122)

Spritemap_BabyMetroid_1:
    dw $001E                                                             ;A9FA40;
    %spritemapEntry(1, $4200, $08, 0, 1, 2, 0, $14E)
    %spritemapEntry(1, $43F0, $08, 0, 0, 2, 0, $14E)
    %spritemapEntry(1, $4218, $08, 0, 1, 2, 0, $145)
    %spritemapEntry(1, $4210, $08, 0, 1, 2, 0, $12E)
    %spritemapEntry(1, $43E0, $08, 0, 0, 2, 0, $12E)
    %spritemapEntry(1, $43D8, $08, 0, 0, 2, 0, $145)
    %spritemapEntry(0, $0D, $28, 0, 1, 2, 0, $130)
    %spritemapEntry(0, $1EB, $28, 0, 0, 2, 0, $130)
    %spritemapEntry(1, $4200, $18, 0, 1, 2, 0, $102)
    %spritemapEntry(1, $4210, $18, 0, 1, 2, 0, $100)
    %spritemapEntry(1, $43F0, $18, 0, 0, 2, 0, $102)
    %spritemapEntry(1, $43E0, $18, 0, 0, 2, 0, $100)
    %spritemapEntry(1, $4200, $F8, 0, 1, 2, 0, $128)
    %spritemapEntry(1, $43F0, $F8, 0, 0, 2, 0, $128)
    %spritemapEntry(1, $4208, $F8, 0, 1, 2, 0, $127)
    %spritemapEntry(1, $4218, $F8, 0, 1, 2, 0, $125)
    %spritemapEntry(1, $43E8, $F8, 0, 0, 2, 0, $127)
    %spritemapEntry(1, $43D8, $F8, 0, 0, 2, 0, $125)
    %spritemapEntry(1, $4200, $E8, 0, 1, 2, 0, $143)
    %spritemapEntry(1, $4200, $D8, 0, 1, 2, 0, $123)
    %spritemapEntry(1, $43F0, $E8, 0, 0, 2, 0, $143)
    %spritemapEntry(1, $43F0, $D8, 0, 0, 2, 0, $123)
    %spritemapEntry(1, $4218, $E8, 0, 1, 2, 0, $140)
    %spritemapEntry(1, $4208, $E8, 0, 1, 2, 0, $142)
    %spritemapEntry(1, $4208, $D8, 0, 1, 2, 0, $122)
    %spritemapEntry(1, $43E8, $E8, 0, 0, 2, 0, $142)
    %spritemapEntry(1, $43E8, $D8, 0, 0, 2, 0, $122)
    %spritemapEntry(1, $43D8, $E8, 0, 0, 2, 0, $140)
    %spritemapEntry(0, $18, $E0, 0, 1, 2, 0, $131)
    %spritemapEntry(0, $1E0, $E0, 0, 0, 2, 0, $131)

Spritemap_BabyMetroid_2:
    dw $001E                                                             ;A9FAD8;
    %spritemapEntry(1, $4208, $F8, 0, 1, 2, 0, $127)
    %spritemapEntry(1, $43E8, $F8, 0, 0, 2, 0, $127)
    %spritemapEntry(0, $15, $28, 0, 1, 2, 0, $121)
    %spritemapEntry(0, $1E3, $28, 0, 0, 2, 0, $121)
    %spritemapEntry(1, $4200, $18, 0, 1, 2, 0, $14C)
    %spritemapEntry(1, $4210, $18, 0, 1, 2, 0, $14A)
    %spritemapEntry(1, $4200, $08, 0, 1, 2, 0, $12C)
    %spritemapEntry(1, $4210, $08, 0, 1, 2, 0, $12A)
    %spritemapEntry(1, $43F0, $18, 0, 0, 2, 0, $14C)
    %spritemapEntry(1, $43E0, $18, 0, 0, 2, 0, $14A)
    %spritemapEntry(1, $43F0, $08, 0, 0, 2, 0, $12C)
    %spritemapEntry(1, $43E0, $08, 0, 0, 2, 0, $12A)
    %spritemapEntry(1, $4218, $08, 0, 1, 2, 0, $145)
    %spritemapEntry(1, $43D8, $08, 0, 0, 2, 0, $145)
    %spritemapEntry(1, $4200, $F8, 0, 1, 2, 0, $128)
    %spritemapEntry(1, $43F0, $F8, 0, 0, 2, 0, $128)
    %spritemapEntry(1, $4218, $F8, 0, 1, 2, 0, $125)
    %spritemapEntry(1, $43D8, $F8, 0, 0, 2, 0, $125)
    %spritemapEntry(0, $18, $E0, 0, 1, 2, 0, $131)
    %spritemapEntry(0, $1E0, $E0, 0, 0, 2, 0, $131)
    %spritemapEntry(1, $4200, $E8, 0, 1, 2, 0, $143)
    %spritemapEntry(1, $4200, $D8, 0, 1, 2, 0, $123)
    %spritemapEntry(1, $43F0, $E8, 0, 0, 2, 0, $143)
    %spritemapEntry(1, $43F0, $D8, 0, 0, 2, 0, $123)
    %spritemapEntry(1, $4208, $E8, 0, 1, 2, 0, $142)
    %spritemapEntry(1, $4208, $D8, 0, 1, 2, 0, $122)
    %spritemapEntry(1, $43E8, $E8, 0, 0, 2, 0, $142)
    %spritemapEntry(1, $43E8, $D8, 0, 0, 2, 0, $122)
    %spritemapEntry(1, $4218, $E8, 0, 1, 2, 0, $140)
    %spritemapEntry(1, $43D8, $E8, 0, 0, 2, 0, $140)


Freespace_BankA9_FB70:                                                   ;A9FB70;
; $490 bytes
