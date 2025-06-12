
org $A78000


; Common to all enemy code banks
namespace CommonA7
incsrc "common_enemy_functions.asm"
namespace off


;;; $8687: Palette - enemy $E2BF/$E2FF/$E33F/$E37F/$E3BF/$E3FF/$E43F/$E47F (Kraid) ;;;
Palette_Kraid:
    dw $3800,$559D,$1816,$100D,$4B9F,$3F37,$36D0,$2E69                   ;A78687;
    dw $2608,$1DA6,$1125,$08C5,$0003,$6318,$7FFF,$0000                   ;A78697;


if !FEATURE_KEEP_UNREFERENCED
;;; $86A7: Unused. Palette ;;;
UNUSED_Palette_Kraid_A786A7:
; Clone of Palette_Kraid
    dw $3800,$559D,$1816,$100D,$4B9F,$3F37,$36D0,$2E69                   ;A786A7;
    dw $2608,$1DA6,$1125,$08C5,$0003,$6318,$7FFF,$0000                   ;A786B7;
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $86C7: Kraid room background palette ;;;
Palette_KraidRoomBackground:
; BG palette 6
    dw $0400,$2D6B,$2D6B,$2D6B,$1986,$14C2,$0840,$0400                   ;A786C7;
    dw $31ED,$18C6,$10C3,$0420,$0252,$2D6B,$4A52,$0000                   ;A786D7;


;;; $86E7: Instruction list - Kraid foot - initial ;;;
InstList_KraidFoot_Initial:
    dw $7FFF,ExtendedSpritemap_KraidFoot_Initial                         ;A786E7;
    dw Common_Instruction_Sleep                                          ;A786EB;


;;; $86ED: Instruction list - Kraid foot - Kraid is big - neutral ;;;
InstList_KraidFoot_KraidIsBig_Neutral:
    dw $7FFF,ExtendedSpritemap_KraidFoot_0                               ;A786ED;
    dw Common_Instruction_Sleep                                          ;A786F1;


;;; $86F3: Instruction list - Kraid foot - Kraid is big - walking forwards ;;;
InstList_KraidFoot_KraidIsBig_WalkingForward_0:
    dw Instruction_Kraid_NOP_A7B633                                      ;A786F3;
    dw $0004,ExtendedSpritemap_KraidFoot_0                               ;A786F5;
    dw $0004,ExtendedSpritemap_KraidFoot_1                               ;A786F9;
    dw $0004,ExtendedSpritemap_KraidFoot_2                               ;A786FD;
    dw $0004,ExtendedSpritemap_KraidFoot_3                               ;A78701;
    dw $0004,ExtendedSpritemap_KraidFoot_4                               ;A78705;
    dw $0004,ExtendedSpritemap_KraidFoot_5                               ;A78709;
    dw $0004,ExtendedSpritemap_KraidFoot_6                               ;A7870D;
    dw $0004,ExtendedSpritemap_KraidFoot_7                               ;A78711;
    dw $0004,ExtendedSpritemap_KraidFoot_8                               ;A78715;
    dw $0004,ExtendedSpritemap_KraidFoot_9                               ;A78719;
    dw $0004,ExtendedSpritemap_KraidFoot_A                               ;A7871D;
    dw $0003,ExtendedSpritemap_KraidFoot_B                               ;A78721;
    dw $0001,ExtendedSpritemap_KraidFoot_C                               ;A78725;
    dw $0001,ExtendedSpritemap_KraidFoot_D                               ;A78729;
    dw $0001,ExtendedSpritemap_KraidFoot_E                               ;A7872D;
    dw $0001,ExtendedSpritemap_KraidFoot_F                               ;A78731;
    dw $0001,ExtendedSpritemap_KraidFoot_10                              ;A78735;
    dw $0010,ExtendedSpritemap_KraidFoot_11                              ;A78739;
    dw Instruction_Kraid_DecrementYPosition                              ;A7873D;
    dw Instruction_Kraid_XPositionMinus3                                 ;A7873F;
    dw $0001,ExtendedSpritemap_KraidFoot_12                              ;A78741;
    dw Instruction_Kraid_DecrementYPosition                              ;A78745;
    dw Instruction_Kraid_XPositionMinus3                                 ;A78747;
    dw $0001,ExtendedSpritemap_KraidFoot_13                              ;A78749;
    dw Instruction_Kraid_NOP_A7B633                                      ;A7874D;
    dw $0003,ExtendedSpritemap_KraidFoot_13                              ;A7874F;
    dw Instruction_Kraid_DecrementYPosition                              ;A78753;
    dw Instruction_Kraid_XPositionMinus3                                 ;A78755;
    dw $0001,ExtendedSpritemap_KraidFoot_13                              ;A78757;
    dw Instruction_Kraid_NOP_A7B633                                      ;A7875B;
    dw $0003,ExtendedSpritemap_KraidFoot_13                              ;A7875D;
    dw Instruction_Kraid_DecrementYPosition                              ;A78761;
    dw Instruction_Kraid_XPositionMinus3                                 ;A78763;
    dw $0001,ExtendedSpritemap_KraidFoot_15                              ;A78765;
    dw Instruction_Kraid_NOP_A7B633                                      ;A78769;
    dw $0003,ExtendedSpritemap_KraidFoot_15                              ;A7876B;
    dw Instruction_Kraid_IncrementYPosition_SetScreenShaking             ;A7876F;
    dw Instruction_Kraid_XPositionMinus3                                 ;A78771;
    dw $0001,ExtendedSpritemap_KraidFoot_16                              ;A78773;
    dw Instruction_Kraid_IncrementYPosition_SetScreenShaking             ;A78777;
    dw Instruction_Kraid_XPositionMinus3                                 ;A78779;
    dw $0001,ExtendedSpritemap_KraidFoot_17                              ;A7877B;
    dw Instruction_Kraid_IncrementYPosition_SetScreenShaking             ;A7877F;
    dw Instruction_Kraid_XPositionMinus3                                 ;A78781;
    dw $0001,ExtendedSpritemap_KraidFoot_18                              ;A78783;
    dw Instruction_Kraid_IncrementYPosition_SetScreenShaking             ;A78787;
    dw Instruction_Kraid_XPositionMinus3                                 ;A78789;
    dw Instruction_Kraid_QueueSFX76_Lib2_Max6                            ;A7878B;
    dw $0001,ExtendedSpritemap_KraidFoot_19                              ;A7878D;
    dw Instruction_Kraid_NOP_A7B633                                      ;A78791;
    dw Instruction_Kraid_XPositionMinus3                                 ;A78793;
    dw $0001,ExtendedSpritemap_KraidFoot_1A                              ;A78795;
    dw Instruction_Kraid_XPositionMinus3                                 ;A78799;
    dw $0001,ExtendedSpritemap_KraidFoot_1B                              ;A7879B;
    dw Instruction_Kraid_XPositionMinus3                                 ;A7879F;
    dw $0001,ExtendedSpritemap_KraidFoot_1C                              ;A787A1;
    dw Instruction_Kraid_XPositionMinus3                                 ;A787A5;
    dw $0001,ExtendedSpritemap_KraidFoot_1D                              ;A787A7;
    dw Instruction_Kraid_XPositionMinus3                                 ;A787AB;
    dw $0001,ExtendedSpritemap_KraidFoot_1E                              ;A787AD;
    dw Instruction_Kraid_XPositionMinus3                                 ;A787B1;
    dw $0001,ExtendedSpritemap_KraidFoot_1F                              ;A787B3;
    dw $0001,ExtendedSpritemap_KraidFoot_0                               ;A787B7;

InstList_KraidFoot_KraidIsBig_WalkingForward_1:
    dw Common_Instruction_Sleep                                          ;A787BB;


;;; $87BD: Instruction list - Kraid foot - lunge forward ;;;
InstList_KraidFoot_LungeForward_0:
; This is just InstList_KraidFoot_KraidIsBig_WalkingForward_0 but faster
    dw Instruction_Kraid_NOP_A7B633                                      ;A787BD;
    dw $0001,ExtendedSpritemap_KraidFoot_0                               ;A787BF;
    dw $0001,ExtendedSpritemap_KraidFoot_1                               ;A787C3;
    dw $0001,ExtendedSpritemap_KraidFoot_2                               ;A787C7;
    dw $0001,ExtendedSpritemap_KraidFoot_3                               ;A787CB;
    dw $0001,ExtendedSpritemap_KraidFoot_4                               ;A787CF;
    dw $0001,ExtendedSpritemap_KraidFoot_5                               ;A787D3;
    dw $0001,ExtendedSpritemap_KraidFoot_6                               ;A787D7;
    dw $0001,ExtendedSpritemap_KraidFoot_7                               ;A787DB;
    dw $0001,ExtendedSpritemap_KraidFoot_8                               ;A787DF;
    dw $0001,ExtendedSpritemap_KraidFoot_9                               ;A787E3;
    dw $0001,ExtendedSpritemap_KraidFoot_A                               ;A787E7;
    dw $0001,ExtendedSpritemap_KraidFoot_B                               ;A787EB;
    dw $0001,ExtendedSpritemap_KraidFoot_C                               ;A787EF;
    dw $0001,ExtendedSpritemap_KraidFoot_D                               ;A787F3;
    dw $0001,ExtendedSpritemap_KraidFoot_E                               ;A787F7;
    dw $0001,ExtendedSpritemap_KraidFoot_F                               ;A787FB;
    dw $0001,ExtendedSpritemap_KraidFoot_10                              ;A787FF;
    dw $0004,ExtendedSpritemap_KraidFoot_11                              ;A78803;
    dw Instruction_Kraid_DecrementYPosition                              ;A78807;
    dw Instruction_Kraid_XPositionMinus3_duplicate                       ;A78809;
    dw $0001,ExtendedSpritemap_KraidFoot_12                              ;A7880B;
    dw Instruction_Kraid_DecrementYPosition                              ;A7880F;
    dw Instruction_Kraid_XPositionMinus3_duplicate                       ;A78811;
    dw $0001,ExtendedSpritemap_KraidFoot_13                              ;A78813;
    dw Instruction_Kraid_NOP_A7B633                                      ;A78817;
    dw $0001,ExtendedSpritemap_KraidFoot_13                              ;A78819;
    dw Instruction_Kraid_DecrementYPosition                              ;A7881D;
    dw Instruction_Kraid_XPositionMinus3_duplicate                       ;A7881F;
    dw $0001,ExtendedSpritemap_KraidFoot_13                              ;A78821;
    dw Instruction_Kraid_NOP_A7B633                                      ;A78825;
    dw $0001,ExtendedSpritemap_KraidFoot_13                              ;A78827;
    dw Instruction_Kraid_DecrementYPosition                              ;A7882B;
    dw Instruction_Kraid_XPositionMinus3_duplicate                       ;A7882D;
    dw $0001,ExtendedSpritemap_KraidFoot_15                              ;A7882F;
    dw Instruction_Kraid_NOP_A7B633                                      ;A78833;
    dw $0001,ExtendedSpritemap_KraidFoot_15                              ;A78835;
    dw Instruction_Kraid_IncrementYPosition_SetScreenShaking             ;A78839;
    dw Instruction_Kraid_XPositionMinus3_duplicate                       ;A7883B;
    dw $0001,ExtendedSpritemap_KraidFoot_16                              ;A7883D;
    dw Instruction_Kraid_IncrementYPosition_SetScreenShaking             ;A78841;
    dw Instruction_Kraid_XPositionMinus3_duplicate                       ;A78843;
    dw $0001,ExtendedSpritemap_KraidFoot_17                              ;A78845;
    dw Instruction_Kraid_IncrementYPosition_SetScreenShaking             ;A78849;
    dw Instruction_Kraid_XPositionMinus3_duplicate                       ;A7884B;
    dw $0001,ExtendedSpritemap_KraidFoot_18                              ;A7884D;
    dw Instruction_Kraid_IncrementYPosition_SetScreenShaking             ;A78851;
    dw Instruction_Kraid_XPositionMinus3_duplicate                       ;A78853;
    dw Instruction_Kraid_QueueSFX76_Lib2_Max6                            ;A78855;
    dw $0001,ExtendedSpritemap_KraidFoot_19                              ;A78857;
    dw Instruction_Kraid_NOP_A7B633                                      ;A7885B;
    dw Instruction_Kraid_XPositionMinus3_duplicate                       ;A7885D;
    dw $0001,ExtendedSpritemap_KraidFoot_1A                              ;A7885F;
    dw Instruction_Kraid_XPositionMinus3_duplicate                       ;A78863;
    dw $0001,ExtendedSpritemap_KraidFoot_1B                              ;A78865;
    dw Instruction_Kraid_XPositionMinus3_duplicate                       ;A78869;
    dw $0001,ExtendedSpritemap_KraidFoot_1C                              ;A7886B;
    dw Instruction_Kraid_XPositionMinus3_duplicate                       ;A7886F;
    dw $0001,ExtendedSpritemap_KraidFoot_1D                              ;A78871;
    dw Instruction_Kraid_XPositionMinus3_duplicate                       ;A78875;
    dw $0001,ExtendedSpritemap_KraidFoot_1E                              ;A78877;
    dw $0001,ExtendedSpritemap_KraidFoot_1F                              ;A7887B;
    dw Instruction_Kraid_XPositionMinus3_duplicate                       ;A7887F;
    dw $0001,ExtendedSpritemap_KraidFoot_0                               ;A78881;

InstList_KraidFoot_LungeForward_1:
    dw Common_Instruction_Sleep                                          ;A78885;


;;; $8887: Instruction list - Kraid foot - Kraid is big - walking backwards ;;;
InstList_KraidFoot_KraidIsBig_WalkingBackwards_0:
    dw Instruction_Kraid_NOP_A7B633                                      ;A78887;
    dw Instruction_Kraid_XPositionPlus3                                  ;A78889;
    dw $0004,ExtendedSpritemap_KraidFoot_22                              ;A7888B;
    dw Instruction_Kraid_XPositionPlus3                                  ;A7888F;
    dw $0001,ExtendedSpritemap_KraidFoot_20                              ;A78891;
    dw Instruction_Kraid_XPositionPlus3                                  ;A78895;
    dw $0001,ExtendedSpritemap_KraidFoot_1E                              ;A78897;
    dw Instruction_Kraid_XPositionPlus3                                  ;A7889B;
    dw $0001,ExtendedSpritemap_KraidFoot_1D                              ;A7889D;
    dw Instruction_Kraid_XPositionPlus3                                  ;A788A1;
    dw $0001,ExtendedSpritemap_KraidFoot_1C                              ;A788A3;
    dw Instruction_Kraid_XPositionPlus3                                  ;A788A7;
    dw $0001,ExtendedSpritemap_KraidFoot_1B                              ;A788A9;
    dw Instruction_Kraid_XPositionPlus3                                  ;A788AD;
    dw $0001,ExtendedSpritemap_KraidFoot_1A                              ;A788AF;
    dw Instruction_Kraid_DecrementYPosition                              ;A788B3;
    dw Instruction_Kraid_XPositionPlus3                                  ;A788B5;
    dw $0001,ExtendedSpritemap_KraidFoot_19                              ;A788B7;
    dw Instruction_Kraid_DecrementYPosition                              ;A788BB;
    dw Instruction_Kraid_XPositionPlus3                                  ;A788BD;
    dw $0001,ExtendedSpritemap_KraidFoot_18                              ;A788BF;
    dw Instruction_Kraid_DecrementYPosition                              ;A788C3;
    dw Instruction_Kraid_XPositionPlus3                                  ;A788C5;
    dw $0001,ExtendedSpritemap_KraidFoot_17                              ;A788C7;
    dw Instruction_Kraid_DecrementYPosition                              ;A788CB;
    dw Instruction_Kraid_XPositionPlus3                                  ;A788CD;
    dw $0001,ExtendedSpritemap_KraidFoot_16                              ;A788CF;
    dw Instruction_Kraid_IncrementYPosition_SetScreenShaking             ;A788D3;
    dw Instruction_Kraid_XPositionPlus3                                  ;A788D5;
    dw $0001,ExtendedSpritemap_KraidFoot_15                              ;A788D7;
    dw Instruction_Kraid_IncrementYPosition_SetScreenShaking             ;A788DB;
    dw Instruction_Kraid_XPositionPlus3                                  ;A788DD;
    dw $0001,ExtendedSpritemap_KraidFoot_14                              ;A788DF;
    dw Instruction_Kraid_IncrementYPosition_SetScreenShaking             ;A788E3;
    dw Instruction_Kraid_XPositionPlus3                                  ;A788E5;
    dw $0001,ExtendedSpritemap_KraidFoot_13                              ;A788E7;
    dw Instruction_Kraid_IncrementYPosition_SetScreenShaking             ;A788EB;
    dw Instruction_Kraid_QueueSFX76_Lib2_Max6                            ;A788ED;
    dw $0001,ExtendedSpritemap_KraidFoot_12                              ;A788EF;
    dw Instruction_Kraid_NOP_A7B633                                      ;A788F3;
    dw $0014,ExtendedSpritemap_KraidFoot_11                              ;A788F5;
    dw $0004,ExtendedSpritemap_KraidFoot_10                              ;A788F9;
    dw $0004,ExtendedSpritemap_KraidFoot_F                               ;A788FD;
    dw $0004,ExtendedSpritemap_KraidFoot_E                               ;A78901;
    dw $0004,ExtendedSpritemap_KraidFoot_D                               ;A78905;
    dw $0004,ExtendedSpritemap_KraidFoot_C                               ;A78909;
    dw $0004,ExtendedSpritemap_KraidFoot_B                               ;A7890D;
    dw $0004,ExtendedSpritemap_KraidFoot_A                               ;A78911;
    dw $0004,ExtendedSpritemap_KraidFoot_9                               ;A78915;
    dw $0001,ExtendedSpritemap_KraidFoot_8                               ;A78919;
    dw $0001,ExtendedSpritemap_KraidFoot_7                               ;A7891D;
    dw $0001,ExtendedSpritemap_KraidFoot_6                               ;A78921;
    dw $0001,ExtendedSpritemap_KraidFoot_5                               ;A78925;
    dw $0001,ExtendedSpritemap_KraidFoot_4                               ;A78929;
    dw $0001,ExtendedSpritemap_KraidFoot_3                               ;A7892D;
    dw $0001,ExtendedSpritemap_KraidFoot_2                               ;A78931;
    dw $0001,ExtendedSpritemap_KraidFoot_1                               ;A78935;

InstList_KraidFoot_KraidIsBig_WalkingBackwards_1:
    dw Common_Instruction_GotoY                                          ;A78939;
    dw InstList_KraidFoot_KraidIsBig_WalkingBackwards_0                  ;A7893B;


if !FEATURE_KEEP_UNREFERENCED
;;; $893D: Unused. Instruction list - Kraid foot - walking backwards - fast ;;;
UNUSED_InstList_KraidFoot_WalkingBackwards_Fast_A7893D:
    dw Instruction_Kraid_NOP_A7B633                                      ;A7893D;
    dw UNUSED_Instruction_Kraid_MoveRight_A7B683                         ;A7893F;
    dw $0004,ExtendedSpritemap_KraidFoot_22                              ;A78941;
    dw UNUSED_Instruction_Kraid_MoveRight_A7B683                         ;A78945;
    dw $0001,ExtendedSpritemap_KraidFoot_20                              ;A78947;
    dw UNUSED_Instruction_Kraid_MoveRight_A7B683                         ;A7894B;
    dw $0001,ExtendedSpritemap_KraidFoot_1E                              ;A7894D;
    dw UNUSED_Instruction_Kraid_MoveRight_A7B683                         ;A78951;
    dw $0001,ExtendedSpritemap_KraidFoot_1D                              ;A78953;
    dw UNUSED_Instruction_Kraid_MoveRight_A7B683                         ;A78957;
    dw $0001,ExtendedSpritemap_KraidFoot_1C                              ;A78959;
    dw UNUSED_Instruction_Kraid_MoveRight_A7B683                         ;A7895D;
    dw $0001,ExtendedSpritemap_KraidFoot_1B                              ;A7895F;
    dw UNUSED_Instruction_Kraid_MoveRight_A7B683                         ;A78963;
    dw $0001,ExtendedSpritemap_KraidFoot_1A                              ;A78965;
    dw Instruction_Kraid_DecrementYPosition                              ;A78969;
    dw UNUSED_Instruction_Kraid_MoveRight_A7B683                         ;A7896B;
    dw $0001,ExtendedSpritemap_KraidFoot_19                              ;A7896D;
    dw Instruction_Kraid_DecrementYPosition                              ;A78971;
    dw UNUSED_Instruction_Kraid_MoveRight_A7B683                         ;A78973;
    dw $0001,ExtendedSpritemap_KraidFoot_18                              ;A78975;
    dw Instruction_Kraid_DecrementYPosition                              ;A78979;
    dw UNUSED_Instruction_Kraid_MoveRight_A7B683                         ;A7897B;
    dw $0001,ExtendedSpritemap_KraidFoot_17                              ;A7897D;
    dw Instruction_Kraid_DecrementYPosition                              ;A78981;
    dw UNUSED_Instruction_Kraid_MoveRight_A7B683                         ;A78983;
    dw $0001,ExtendedSpritemap_KraidFoot_16                              ;A78985;
    dw Instruction_Kraid_IncrementYPosition_SetScreenShaking             ;A78989;
    dw UNUSED_Instruction_Kraid_MoveRight_A7B683                         ;A7898B;
    dw $0001,ExtendedSpritemap_KraidFoot_15                              ;A7898D;
    dw Instruction_Kraid_IncrementYPosition_SetScreenShaking             ;A78991;
    dw UNUSED_Instruction_Kraid_MoveRight_A7B683                         ;A78993;
    dw $0001,ExtendedSpritemap_KraidFoot_14                              ;A78995;
    dw Instruction_Kraid_IncrementYPosition_SetScreenShaking             ;A78999;
    dw UNUSED_Instruction_Kraid_MoveRight_A7B683                         ;A7899B;
    dw $0001,ExtendedSpritemap_KraidFoot_13                              ;A7899D;
    dw Instruction_Kraid_IncrementYPosition_SetScreenShaking             ;A789A1;
    dw Instruction_Kraid_QueueSFX76_Lib2_Max6                            ;A789A3;
    dw $0001,ExtendedSpritemap_KraidFoot_12                              ;A789A5;
    dw Instruction_Kraid_NOP_A7B633                                      ;A789A9;
    dw $0014,ExtendedSpritemap_KraidFoot_11                              ;A789AB;
    dw $0004,ExtendedSpritemap_KraidFoot_10                              ;A789AF;
    dw $0004,ExtendedSpritemap_KraidFoot_F                               ;A789B3;
    dw $0004,ExtendedSpritemap_KraidFoot_E                               ;A789B7;
    dw $0004,ExtendedSpritemap_KraidFoot_D                               ;A789BB;
    dw $0004,ExtendedSpritemap_KraidFoot_C                               ;A789BF;
    dw $0004,ExtendedSpritemap_KraidFoot_B                               ;A789C3;
    dw $0004,ExtendedSpritemap_KraidFoot_A                               ;A789C7;
    dw $0004,ExtendedSpritemap_KraidFoot_9                               ;A789CB;
    dw $0001,ExtendedSpritemap_KraidFoot_8                               ;A789CF;
    dw $0001,ExtendedSpritemap_KraidFoot_7                               ;A789D3;
    dw $0001,ExtendedSpritemap_KraidFoot_6                               ;A789D7;
    dw $0001,ExtendedSpritemap_KraidFoot_5                               ;A789DB;
    dw $0001,ExtendedSpritemap_KraidFoot_4                               ;A789DF;
    dw $0001,ExtendedSpritemap_KraidFoot_3                               ;A789E3;
    dw $0001,ExtendedSpritemap_KraidFoot_2                               ;A789E7;
    dw $0001,ExtendedSpritemap_KraidFoot_1                               ;A789EB;
    dw Common_Instruction_GotoY                                          ;A789EF;
    dw UNUSED_InstList_KraidFoot_WalkingBackwards_Fast_A7893D            ;A789F1;
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $89F3: Instruction list - Kraid arm - normal ;;;
InstList_KraidArm_Normal_0:
    dw $0006,ExtendedSpritemap_KraidArm_General_0                        ;A789F3;
    dw $0006,ExtendedSpritemap_KraidArm_General_1                        ;A789F7;
    dw $0006,ExtendedSpritemap_KraidArm_General_2                        ;A789FB;
    dw $0006,ExtendedSpritemap_KraidArm_General_3                        ;A789FF;
    dw $0006,ExtendedSpritemap_KraidArm_General_4                        ;A78A03;
    dw $0006,ExtendedSpritemap_KraidArm_General_5                        ;A78A07;
    dw $0006,ExtendedSpritemap_KraidArm_General_6                        ;A78A0B;
    dw $0006,ExtendedSpritemap_KraidArm_General_7                        ;A78A0F;
    dw $0006,ExtendedSpritemap_KraidArm_General_8                        ;A78A13;
    dw $0006,ExtendedSpritemap_KraidArm_General_9                        ;A78A17;
    dw $0006,ExtendedSpritemap_KraidArm_General_7                        ;A78A1B;
    dw $0006,ExtendedSpritemap_KraidArm_General_6                        ;A78A1F;
    dw $0006,ExtendedSpritemap_KraidArm_General_5                        ;A78A23;
    dw $0006,ExtendedSpritemap_KraidArm_General_4                        ;A78A27;
    dw $0006,ExtendedSpritemap_KraidArm_General_3                        ;A78A2B;
    dw $0006,ExtendedSpritemap_KraidArm_General_2                        ;A78A2F;
    dw $0006,ExtendedSpritemap_KraidArm_General_1                        ;A78A33;

InstList_KraidArm_Normal_1:
    dw $0020,ExtendedSpritemap_KraidArm_General_0                        ;A78A37;
    dw Instruction_KraidArm_SlowArmIfLessThanHalfHealth                  ;A78A3B;
    dw Common_Instruction_GotoY                                          ;A78A3D;
    dw InstList_KraidArm_Normal_0                                        ;A78A3F;


;;; $8A41: Instruction list - Kraid arm - slow ;;;
InstList_KraidArm_Slow:
    dw $0008,ExtendedSpritemap_KraidArm_General_0                        ;A78A41;
    dw $0008,ExtendedSpritemap_KraidArm_General_1                        ;A78A45;
    dw $0008,ExtendedSpritemap_KraidArm_General_2                        ;A78A49;
    dw $0008,ExtendedSpritemap_KraidArm_General_3                        ;A78A4D;
    dw $0008,ExtendedSpritemap_KraidArm_General_4                        ;A78A51;
    dw $0008,ExtendedSpritemap_KraidArm_General_5                        ;A78A55;
    dw $0008,ExtendedSpritemap_KraidArm_General_6                        ;A78A59;
    dw $0008,ExtendedSpritemap_KraidArm_General_7                        ;A78A5D;
    dw $0008,ExtendedSpritemap_KraidArm_General_8                        ;A78A61;
    dw $0008,ExtendedSpritemap_KraidArm_General_9                        ;A78A65;
    dw $0008,ExtendedSpritemap_KraidArm_General_7                        ;A78A69;
    dw $0008,ExtendedSpritemap_KraidArm_General_6                        ;A78A6D;
    dw $0008,ExtendedSpritemap_KraidArm_General_5                        ;A78A71;
    dw $0008,ExtendedSpritemap_KraidArm_General_4                        ;A78A75;
    dw $0008,ExtendedSpritemap_KraidArm_General_3                        ;A78A79;
    dw $0008,ExtendedSpritemap_KraidArm_General_2                        ;A78A7D;
    dw $0008,ExtendedSpritemap_KraidArm_General_1                        ;A78A81;
    dw $0030,ExtendedSpritemap_KraidArm_General_0                        ;A78A85;
    dw Instruction_KraidArm_SlowArmIfLessThanHalfHealth                  ;A78A89;
    dw Common_Instruction_GotoY                                          ;A78A8B;
    dw InstList_KraidArm_Slow                                            ;A78A8D;


;;; $8A8F: Instruction - slow Kraid arm if Kraid has less than half health ;;;
Instruction_KraidArm_SlowArmIfLessThanHalfHealth:
    LDA.W Enemy.health                                                   ;A78A8F;
    CMP.L Kraid.maxHealth_4_8                                            ;A78A92;
    BPL .return                                                          ;A78A96;
    LDA.W Enemy[1].instList                                              ;A78A98;
    CMP.W #InstList_KraidArm_Slow                                        ;A78A9B;
    BPL .return                                                          ;A78A9E;
    LDY.W #InstList_KraidArm_Slow                                        ;A78AA0;

  .return:
    RTL                                                                  ;A78AA3;


;;; $8AA4: Instruction list - Kraid arm - rising/sinking ;;;
InstList_KraidArm_RisingSinking:
; Same as InstList_KraidArm_Normal_0, but the spritemaps all have lower priority sprites
    dw $0006,ExtendedSpritemap_KraidArm_RisingSinking_0                  ;A78AA4;
    dw $0006,ExtendedSpritemap_KraidArm_RisingSinking_1                  ;A78AA8;
    dw $0006,ExtendedSpritemap_KraidArm_RisingSinking_2                  ;A78AAC;
    dw $0006,ExtendedSpritemap_KraidArm_RisingSinking_3                  ;A78AB0;
    dw $0006,ExtendedSpritemap_KraidArm_RisingSinking_4                  ;A78AB4;
    dw $0006,ExtendedSpritemap_KraidArm_RisingSinking_5                  ;A78AB8;
    dw $0006,ExtendedSpritemap_KraidArm_RisingSinking_6                  ;A78ABC;
    dw $0006,ExtendedSpritemap_KraidArm_RisingSinking_7                  ;A78AC0;
    dw $0006,ExtendedSpritemap_KraidArm_RisingSinking_8                  ;A78AC4;
    dw $0006,ExtendedSpritemap_KraidArm_RisingSinking_9                  ;A78AC8;
    dw $0006,ExtendedSpritemap_KraidArm_RisingSinking_7                  ;A78ACC;
    dw $0006,ExtendedSpritemap_KraidArm_RisingSinking_6                  ;A78AD0;
    dw $0006,ExtendedSpritemap_KraidArm_RisingSinking_5                  ;A78AD4;
    dw $0006,ExtendedSpritemap_KraidArm_RisingSinking_4                  ;A78AD8;
    dw $0006,ExtendedSpritemap_KraidArm_RisingSinking_3                  ;A78ADC;
    dw $0006,ExtendedSpritemap_KraidArm_RisingSinking_2                  ;A78AE0;
    dw $0006,ExtendedSpritemap_KraidArm_RisingSinking_1                  ;A78AE4;
    dw $0020,ExtendedSpritemap_KraidArm_RisingSinking_0                  ;A78AE8;
    dw Common_Instruction_GotoY                                          ;A78AEC;
    dw InstList_KraidArm_RisingSinking                                   ;A78AEE;


;;; $8AF0: Instruction list - Kraid arm - dying / preparing to lunge forward ;;;
InstList_KraidArm_Dying_PreparingToLungeForward:
    dw $0006,ExtendedSpritemap_KraidArm_General_0                        ;A78AF0;
    dw $0006,ExtendedSpritemap_KraidArm_Dying_PreparingToLungeForward_0  ;A78AF4;
    dw $7FFF,ExtendedSpritemap_KraidArm_Dying_PreparingToLungeForward_1  ;A78AF8;
    dw Common_Instruction_Sleep                                          ;A78AFC;


;;; $8AFE: Instruction list - Kraid lint - initial ;;;
InstList_KraidLint_Initial:
    dw $7FFF,Spritemap_KraidLint_Initial                                 ;A78AFE;
    dw Common_Instruction_Sleep                                          ;A78B02;


;;; $8B04: Instruction list - Kraid lint - Kraid is big ;;;
InstList_KraidLint_KraidIsBig:
    dw $7FFF,Spritemap_KraidLint_KraidIsBig                              ;A78B04;
    dw Common_Instruction_Sleep                                          ;A78B08;


;;; $8B0A: Instruction list - fingernail ;;;
InstList_KraidNail:
    dw $0003,Spritemap_KraidNail_0                                       ;A78B0A;
    dw $0003,Spritemap_KraidNail_1                                       ;A78B0E;
    dw $0003,Spritemap_KraidNail_2                                       ;A78B12;
    dw $0003,Spritemap_KraidNail_3                                       ;A78B16;
    dw $0003,Spritemap_KraidNail_4                                       ;A78B1A;
    dw $0003,Spritemap_KraidNail_5                                       ;A78B1E;
    dw $0003,Spritemap_KraidNail_6                                       ;A78B22;
    dw $0003,Spritemap_KraidNail_7                                       ;A78B26;
    dw Common_Instruction_GotoY                                          ;A78B2A;
    dw InstList_KraidNail                                                ;A78B2C;


;;; $8B2E: Unused. Extended spritemaps - Kraid arm ;;;
if !FEATURE_KEEP_UNREFERENCED
UNUSED_ExtendedSpritemap_KraidArm_A78B2E:
    dw $0002                                                             ;A78B2E;
    dw $0000,$0000
    dw Spritemap_KraidArm_General_A                                      ;A78B34;
    dw Hitbox_KraidArm_F                                                 ;A78B36;
    dw $FFF7,$FFF6                                                       ;A78B38;
    dw Spritemap_KraidArm_General_0                                      ;A78B3C;
    dw Hitbox_KraidArm_0                                                 ;A78B3E;

UNUSED_ExtendedSpritemap_KraidArm_A78B40:
    dw $0002                                                             ;A78B40;
    dw $FFF9,$FFF8
    dw Spritemap_KraidArm_General_1                                      ;A78B46;
    dw Hitbox_KraidArm_1                                                 ;A78B48;
    dw $0001,$0000                                                       ;A78B4A;
    dw Spritemap_KraidArm_General_A                                      ;A78B4E;
    dw Hitbox_KraidArm_F                                                 ;A78B50;

UNUSED_ExtendedSpritemap_KraidArm_A78B52:
    dw $0002                                                             ;A78B52;
    dw $FFF8,$FFF8
    dw Spritemap_KraidArm_General_2                                      ;A78B58;
    dw Hitbox_KraidArm_2                                                 ;A78B5A;
    dw $0000,$0000                                                       ;A78B5C;
    dw Spritemap_KraidArm_General_A                                      ;A78B60;
    dw Hitbox_KraidArm_F                                                 ;A78B62;

UNUSED_ExtendedSpritemap_KraidArm_A78B64:
    dw $0002                                                             ;A78B64;
    dw $FFF8,$FFF8
    dw Spritemap_KraidArm_General_3                                      ;A78B6A;
    dw Hitbox_KraidArm_3                                                 ;A78B6C;
    dw $0000,$0000                                                       ;A78B6E;
    dw Spritemap_KraidArm_General_A                                      ;A78B72;
    dw Hitbox_KraidArm_F                                                 ;A78B74;

UNUSED_ExtendedSpritemap_KraidArm_A78B76:
    dw $0002                                                             ;A78B76;
    dw $FFF6,$0001
    dw Spritemap_KraidArm_General_1                                      ;A78B7C;
    dw Hitbox_KraidArm_1                                                 ;A78B7E;
    dw $0000,$0000                                                       ;A78B80;
    dw Spritemap_KraidArm_General_7                                      ;A78B84;
    dw Hitbox_KraidArm_8                                                 ;A78B86;

UNUSED_ExtendedSpritemap_KraidArm_A78B88:
    dw $0002                                                             ;A78B88;
    dw $FFF6,$0000
    dw Spritemap_KraidArm_General_2                                      ;A78B8E;
    dw Hitbox_KraidArm_2                                                 ;A78B90;
    dw $0000,$0000                                                       ;A78B92;
    dw Spritemap_KraidArm_General_7                                      ;A78B96;
    dw Hitbox_KraidArm_8                                                 ;A78B98;

UNUSED_ExtendedSpritemap_KraidArm_A78B9A:
    dw $0002                                                             ;A78B9A;
    dw $FFF6,$0000
    dw Spritemap_KraidArm_General_3                                      ;A78BA0;
    dw Hitbox_KraidArm_3                                                 ;A78BA2;
    dw $0000,$0000                                                       ;A78BA4;
    dw Spritemap_KraidArm_General_7                                      ;A78BA8;
    dw Hitbox_KraidArm_8                                                 ;A78BAA;

UNUSED_ExtendedSpritemap_KraidArm_A78BAC:
    dw $0002                                                             ;A78BAC;
    dw $FFF6,$0000
    dw Spritemap_KraidArm_General_4                                      ;A78BB2;
    dw Hitbox_KraidArm_4                                                 ;A78BB4;
    dw $0000,$0000                                                       ;A78BB6;
    dw Spritemap_KraidArm_General_7                                      ;A78BBA;
    dw Hitbox_KraidArm_8                                                 ;A78BBC;

UNUSED_ExtendedSpritemap_KraidArm_A78BBE:
    dw $0002                                                             ;A78BBE;
    dw $FFFA,$0006
    dw Spritemap_KraidArm_General_2                                      ;A78BC4;
    dw Hitbox_KraidArm_2                                                 ;A78BC6;
    dw $0000,$0000                                                       ;A78BC8;
    dw Spritemap_KraidArm_General_8                                      ;A78BCC;
    dw Hitbox_KraidArm_9                                                 ;A78BCE;

UNUSED_ExtendedSpritemap_KraidArm_A78BD0:
    dw $0002                                                             ;A78BD0;
    dw $FFFA,$0006
    dw Spritemap_KraidArm_General_3                                      ;A78BD6;
    dw Hitbox_KraidArm_3                                                 ;A78BD8;
    dw $0000,$0000                                                       ;A78BDA;
    dw Spritemap_KraidArm_General_8                                      ;A78BDE;
    dw Hitbox_KraidArm_9                                                 ;A78BE0;

UNUSED_ExtendedSpritemap_KraidArm_A78BE2:
    dw $0002                                                             ;A78BE2;
    dw $FFF8,$0006
    dw Spritemap_KraidArm_General_4                                      ;A78BE8;
    dw Hitbox_KraidArm_4                                                 ;A78BEA;
    dw $0000,$0000                                                       ;A78BEC;
    dw Spritemap_KraidArm_General_8                                      ;A78BF0;
    dw Hitbox_KraidArm_9                                                 ;A78BF2;

UNUSED_ExtendedSpritemap_KraidArm_A78BF4:
    dw $0002                                                             ;A78BF4;
    dw $FFF8,$0006
    dw Spritemap_KraidArm_General_5                                      ;A78BFA;
    dw Hitbox_KraidArm_5                                                 ;A78BFC;
    dw $0000,$0000                                                       ;A78BFE;
    dw Spritemap_KraidArm_General_8                                      ;A78C02;
    dw Hitbox_KraidArm_9                                                 ;A78C04;

UNUSED_ExtendedSpritemap_KraidArm_A78C06:
    dw $0002                                                             ;A78C06;
    dw $0001,$000A
    dw Spritemap_KraidArm_General_3                                      ;A78C0C;
    dw Hitbox_KraidArm_3                                                 ;A78C0E;
    dw $0000,$0000                                                       ;A78C10;
    dw Spritemap_KraidArm_General_9                                      ;A78C14;
    dw Hitbox_KraidArm_A                                                 ;A78C16;

UNUSED_ExtendedSpritemap_KraidArm_A78C18:
    dw $0002                                                             ;A78C18;
    dw $0000,$000A
    dw Spritemap_KraidArm_General_4                                      ;A78C1E;
    dw Hitbox_KraidArm_4                                                 ;A78C20;
    dw $0000,$0000                                                       ;A78C22;
    dw Spritemap_KraidArm_General_9                                      ;A78C26;
    dw Hitbox_KraidArm_A                                                 ;A78C28;

UNUSED_ExtendedSpritemap_KraidArm_A78C2A:
    dw $0002                                                             ;A78C2A;
    dw $FFFF,$000C
    dw Spritemap_KraidArm_General_5                                      ;A78C30;
    dw Hitbox_KraidArm_5                                                 ;A78C32;
    dw $0000,$0000                                                       ;A78C34;
    dw Spritemap_KraidArm_General_9                                      ;A78C38;
    dw Hitbox_KraidArm_A                                                 ;A78C3A;

UNUSED_ExtendedSpritemap_KraidArm_A78C3C:
    dw $0002                                                             ;A78C3C;
    dw $0000,$000B
    dw Spritemap_KraidArm_General_6                                      ;A78C42;
    dw Hitbox_KraidArm_6                                                 ;A78C44;
    dw $0000,$0000                                                       ;A78C46;
    dw Spritemap_KraidArm_General_9                                      ;A78C4A;
    dw Hitbox_KraidArm_A                                                 ;A78C4C;

UNUSED_ExtendedSpritemap_KraidArm_A78C4E:
    dw $0001                                                             ;A78C4E;
    dw $0000,$0000
    dw Spritemap_KraidArm_General_D                                      ;A78C54;
    dw Hitbox_KraidArm_12                                                ;A78C56;

UNUSED_ExtendedSpritemap_KraidArm_A78C58:
    dw $0001                                                             ;A78C58;
    dw $0000,$0000
    dw Spritemap_KraidArm_General_C                                      ;A78C5E;
    dw Hitbox_KraidArm_11                                                ;A78C60;

UNUSED_ExtendedSpritemap_KraidArm_A78C62:
    dw $0001                                                             ;A78C62;
    dw $0000,$0000
    dw Spritemap_KraidArm_General_B                                      ;A78C68;
    dw Hitbox_KraidArm_10                                                ;A78C6A;
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $8C6C: Spritemap - Kraid lint - Kraid is big ;;;
Spritemap_KraidLint_KraidIsBig:
    dw $0005                                                             ;A78C6C;
    %spritemapEntry(0, $1F4, $08, 0, 0, 2, 0, $1C2)
    %spritemapEntry(1, $1E4, $00, 0, 0, 2, 0, $1B0)
    %spritemapEntry(1, $1F4, $F8, 0, 0, 2, 0, $1A2)
    %spritemapEntry(1, $1E4, $F8, 0, 0, 2, 0, $1A0)
    %spritemapEntry(1, $04, $F8, 0, 0, 2, 0, $1A9)


;;; $8C87: Unused. Extended spritemaps - Kraid foot ;;;
if !FEATURE_KEEP_UNREFERENCED
UNUSED_ExtendedSpritemap_KraidFoot_A78C87:
    dw $0001                                                             ;A78C87;
    dw $0000,$0000
    dw UNUSED_Spritemap_KraidFoot_A794DA                                 ;A78C8D;
    dw UNUSED_Hitbox_KraidFoot                                           ;A78C8F;

UNUSED_ExtendedSpritemap_KraidFoot_A78C91:
    dw $0002                                                             ;A78C91;
    dw $0000,$0000
    dw Spritemap_KraidFoot_0                                             ;A78C97;
    dw UNUSED_Hitbox_KraidFoot                                           ;A78C99;
    dw $000C,$0030                                                       ;A78C9B;
    dw Spritemap_KraidFoot_4                                             ;A78C9F;
    dw UNUSED_Hitbox_KraidFoot                                           ;A78CA1;

UNUSED_ExtendedSpritemap_KraidFoot_A78CA3:
    dw $0002                                                             ;A78CA3;
    dw $0000,$0000
    dw Spritemap_KraidFoot_1                                             ;A78CA9;
    dw UNUSED_Hitbox_KraidFoot                                           ;A78CAB;
    dw $0000,$0039                                                       ;A78CAD;
    dw Spritemap_KraidFoot_4                                             ;A78CB1;
    dw UNUSED_Hitbox_KraidFoot                                           ;A78CB3;

UNUSED_ExtendedSpritemap_KraidFoot_A78CB5:
    dw $0002                                                             ;A78CB5;
    dw $0000,$0000
    dw Spritemap_KraidFoot_2                                             ;A78CBB;
    dw UNUSED_Hitbox_KraidFoot                                           ;A78CBD;
    dw $FFF0,$003F                                                       ;A78CBF;
    dw Spritemap_KraidFoot_4                                             ;A78CC3;
    dw UNUSED_Hitbox_KraidFoot                                           ;A78CC5;

UNUSED_ExtendedSpritemap_KraidFoot_A78CC7:
    dw $0002                                                             ;A78CC7;
    dw $0000,$0000
    dw Spritemap_KraidFoot_3                                             ;A78CCD;
    dw UNUSED_Hitbox_KraidFoot                                           ;A78CCF;
    dw $FFDF,$003D                                                       ;A78CD1;
    dw Spritemap_KraidFoot_4                                             ;A78CD5;
    dw UNUSED_Hitbox_KraidFoot                                           ;A78CD7;

UNUSED_ExtendedSpritemap_KraidFoot_A78CD9:
    dw $0001                                                             ;A78CD9;
    dw $0000,$0000
    dw UNUSED_Spritemap_KraidFoot_A796CB                                 ;A78CDF;
    dw UNUSED_Hitbox_KraidFoot_A79461                                    ;A78CE1;
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $8CE3: Extended spritemaps - Kraid foot ;;;
ExtendedSpritemap_KraidFoot_0:
    dw $0002                                                             ;A78CE3;
    dw $0008,$0028
    dw Spritemap_KraidFoot_4                                             ;A78CE9;
    dw Hitbox_KraidFoot                                                  ;A78CEB;
    dw $0000,$0000                                                       ;A78CED;
    dw Spritemap_KraidFoot_0                                             ;A78CF1;
    dw Hitbox_KraidFoot                                                  ;A78CF3;

ExtendedSpritemap_KraidFoot_1:
    dw $0002                                                             ;A78CF5;
    dw $0006,$0027
    dw Spritemap_KraidFoot_4                                             ;A78CFB;
    dw Hitbox_KraidFoot                                                  ;A78CFD;
    dw $FFFE,$FFFF                                                       ;A78CFF;
    dw Spritemap_KraidFoot_0                                             ;A78D03;
    dw Hitbox_KraidFoot                                                  ;A78D05;

ExtendedSpritemap_KraidFoot_2:
    dw $0002                                                             ;A78D07;
    dw $0004,$0026
    dw Spritemap_KraidFoot_4                                             ;A78D0D;
    dw Hitbox_KraidFoot                                                  ;A78D0F;
    dw $FFFC,$FFFE                                                       ;A78D11;
    dw Spritemap_KraidFoot_0                                             ;A78D15;
    dw Hitbox_KraidFoot                                                  ;A78D17;

ExtendedSpritemap_KraidFoot_3:
    dw $0002                                                             ;A78D19;
    dw $0002,$0025
    dw Spritemap_KraidFoot_4                                             ;A78D1F;
    dw Hitbox_KraidFoot                                                  ;A78D21;
    dw $FFFA,$FFFD                                                       ;A78D23;
    dw Spritemap_KraidFoot_0                                             ;A78D27;
    dw Hitbox_KraidFoot                                                  ;A78D29;

ExtendedSpritemap_KraidFoot_4:
    dw $0002                                                             ;A78D2B;
    dw $0000,$0024
    dw Spritemap_KraidFoot_4                                             ;A78D31;
    dw Hitbox_KraidFoot                                                  ;A78D33;
    dw $FFF8,$FFFC                                                       ;A78D35;
    dw Spritemap_KraidFoot_0                                             ;A78D39;
    dw Hitbox_KraidFoot                                                  ;A78D3B;

ExtendedSpritemap_KraidFoot_5:
    dw $0002                                                             ;A78D3D;
    dw $FFFE,$0023
    dw Spritemap_KraidFoot_4                                             ;A78D43;
    dw Hitbox_KraidFoot                                                  ;A78D45;
    dw $0005,$FFF1                                                       ;A78D47;
    dw Spritemap_KraidFoot_1                                             ;A78D4B;
    dw Hitbox_KraidFoot                                                  ;A78D4D;

ExtendedSpritemap_KraidFoot_6:
    dw $0002                                                             ;A78D4F;
    dw $FFFC,$0022
    dw Spritemap_KraidFoot_4                                             ;A78D55;
    dw Hitbox_KraidFoot                                                  ;A78D57;
    dw $0003,$FFF0                                                       ;A78D59;
    dw Spritemap_KraidFoot_1                                             ;A78D5D;
    dw Hitbox_KraidFoot                                                  ;A78D5F;

ExtendedSpritemap_KraidFoot_7:
    dw $0002                                                             ;A78D61;
    dw $FFFA,$0021
    dw Spritemap_KraidFoot_4                                             ;A78D67;
    dw Hitbox_KraidFoot                                                  ;A78D69;
    dw $0001,$FFEF                                                       ;A78D6B;
    dw Spritemap_KraidFoot_1                                             ;A78D6F;
    dw Hitbox_KraidFoot                                                  ;A78D71;

ExtendedSpritemap_KraidFoot_8:
    dw $0002                                                             ;A78D73;
    dw $FFF8,$0020
    dw Spritemap_KraidFoot_4                                             ;A78D79;
    dw Hitbox_KraidFoot                                                  ;A78D7B;
    dw $FFFF,$FFEE                                                       ;A78D7D;
    dw Spritemap_KraidFoot_1                                             ;A78D81;
    dw Hitbox_KraidFoot                                                  ;A78D83;

ExtendedSpritemap_KraidFoot_9:
    dw $0002                                                             ;A78D85;
    dw $FFF6,$001F
    dw Spritemap_KraidFoot_4                                             ;A78D8B;
    dw Hitbox_KraidFoot                                                  ;A78D8D;
    dw $FFFD,$FFED                                                       ;A78D8F;
    dw Spritemap_KraidFoot_1                                             ;A78D93;
    dw Hitbox_KraidFoot                                                  ;A78D95;

ExtendedSpritemap_KraidFoot_A:
    dw $0002                                                             ;A78D97;
    dw $FFF4,$001D
    dw Spritemap_KraidFoot_4                                             ;A78D9D;
    dw Hitbox_KraidFoot                                                  ;A78D9F;
    dw $000C,$FFE6                                                       ;A78DA1;
    dw Spritemap_KraidFoot_2                                             ;A78DA5;
    dw Hitbox_KraidFoot                                                  ;A78DA7;

ExtendedSpritemap_KraidFoot_B:
    dw $0002                                                             ;A78DA9;
    dw $FFF2,$001C
    dw Spritemap_KraidFoot_4                                             ;A78DAF;
    dw Hitbox_KraidFoot                                                  ;A78DB1;
    dw $001A,$FFE9                                                       ;A78DB3;
    dw Spritemap_KraidFoot_3                                             ;A78DB7;
    dw Hitbox_KraidFoot                                                  ;A78DB9;

ExtendedSpritemap_KraidFoot_C:
    dw $0002                                                             ;A78DBB;
    dw $FFF0,$001E
    dw Spritemap_KraidFoot_4                                             ;A78DC1;
    dw Hitbox_KraidFoot                                                  ;A78DC3;
    dw $0018,$FFEB                                                       ;A78DC5;
    dw Spritemap_KraidFoot_3                                             ;A78DC9;
    dw Hitbox_KraidFoot                                                  ;A78DCB;

ExtendedSpritemap_KraidFoot_D:
    dw $0002                                                             ;A78DCD;
    dw $FFEE,$0020
    dw Spritemap_KraidFoot_4                                             ;A78DD3;
    dw Hitbox_KraidFoot                                                  ;A78DD5;
    dw $0016,$FFED                                                       ;A78DD7;
    dw Spritemap_KraidFoot_3                                             ;A78DDB;
    dw Hitbox_KraidFoot                                                  ;A78DDD;

ExtendedSpritemap_KraidFoot_E:
    dw $0002                                                             ;A78DDF;
    dw $FFEC,$0022
    dw Spritemap_KraidFoot_4                                             ;A78DE5;
    dw Hitbox_KraidFoot                                                  ;A78DE7;
    dw $0014,$FFEF                                                       ;A78DE9;
    dw Spritemap_KraidFoot_3                                             ;A78DED;
    dw Hitbox_KraidFoot                                                  ;A78DEF;

ExtendedSpritemap_KraidFoot_F:
    dw $0002                                                             ;A78DF1;
    dw $FFEA,$0024
    dw Spritemap_KraidFoot_4                                             ;A78DF7;
    dw Hitbox_KraidFoot                                                  ;A78DF9;
    dw $0012,$FFF1                                                       ;A78DFB;
    dw Spritemap_KraidFoot_3                                             ;A78DFF;
    dw Hitbox_KraidFoot                                                  ;A78E01;

ExtendedSpritemap_KraidFoot_10:
    dw $0002                                                             ;A78E03;
    dw $FFE8,$0026
    dw Spritemap_KraidFoot_4                                             ;A78E09;
    dw Hitbox_KraidFoot                                                  ;A78E0B;
    dw $0010,$FFF3                                                       ;A78E0D;
    dw Spritemap_KraidFoot_3                                             ;A78E11;
    dw Hitbox_KraidFoot                                                  ;A78E13;

ExtendedSpritemap_KraidFoot_11:
    dw $0002                                                             ;A78E15;
    dw $FFE6,$0028
    dw Spritemap_KraidFoot_4                                             ;A78E1B;
    dw Hitbox_KraidFoot                                                  ;A78E1D;
    dw $000E,$FFF5                                                       ;A78E1F;
    dw Spritemap_KraidFoot_3                                             ;A78E23;
    dw Hitbox_KraidFoot                                                  ;A78E25;

ExtendedSpritemap_KraidFoot_12:
    dw $0002                                                             ;A78E27;
    dw $FFE8,$0028
    dw Spritemap_KraidFoot_4                                             ;A78E2D;
    dw Hitbox_KraidFoot                                                  ;A78E2F;
    dw $0010,$FFF6                                                       ;A78E31;
    dw Spritemap_KraidFoot_3                                             ;A78E35;
    dw Hitbox_KraidFoot                                                  ;A78E37;

ExtendedSpritemap_KraidFoot_13:
    dw $0002                                                             ;A78E39;
    dw $FFEA,$0028
    dw Spritemap_KraidFoot_4                                             ;A78E3F;
    dw Hitbox_KraidFoot                                                  ;A78E41;
    dw $0012,$FFF6                                                       ;A78E43;
    dw Spritemap_KraidFoot_3                                             ;A78E47;
    dw Hitbox_KraidFoot                                                  ;A78E49;

ExtendedSpritemap_KraidFoot_14:
    dw $0002                                                             ;A78E4B;
    dw $FFEC,$0028
    dw Spritemap_KraidFoot_4                                             ;A78E51;
    dw Hitbox_KraidFoot                                                  ;A78E53;
    dw $0014,$FFF6                                                       ;A78E55;
    dw Spritemap_KraidFoot_3                                             ;A78E59;
    dw Hitbox_KraidFoot                                                  ;A78E5B;

ExtendedSpritemap_KraidFoot_15:
    dw $0002                                                             ;A78E5D;
    dw $FFEE,$0028
    dw Spritemap_KraidFoot_4                                             ;A78E63;
    dw Hitbox_KraidFoot                                                  ;A78E65;
    dw $0006,$FFF1                                                       ;A78E67;
    dw Spritemap_KraidFoot_2                                             ;A78E6B;
    dw Hitbox_KraidFoot                                                  ;A78E6D;

ExtendedSpritemap_KraidFoot_16:
    dw $0002                                                             ;A78E6F;
    dw $FFF0,$0028
    dw Spritemap_KraidFoot_4                                             ;A78E75;
    dw Hitbox_KraidFoot                                                  ;A78E77;
    dw $0008,$FFF1                                                       ;A78E79;
    dw Spritemap_KraidFoot_2                                             ;A78E7D;
    dw Hitbox_KraidFoot                                                  ;A78E7F;

ExtendedSpritemap_KraidFoot_17:
    dw $0002                                                             ;A78E81;
    dw $FFF2,$0028
    dw Spritemap_KraidFoot_4                                             ;A78E87;
    dw Hitbox_KraidFoot                                                  ;A78E89;
    dw $FFF9,$FFF6                                                       ;A78E8B;
    dw Spritemap_KraidFoot_1                                             ;A78E8F;
    dw Hitbox_KraidFoot                                                  ;A78E91;

ExtendedSpritemap_KraidFoot_18:
    dw $0002                                                             ;A78E93;
    dw $FFF4,$0028
    dw Spritemap_KraidFoot_4                                             ;A78E99;
    dw Hitbox_KraidFoot                                                  ;A78E9B;
    dw $FFFB,$FFF6                                                       ;A78E9D;
    dw Spritemap_KraidFoot_1                                             ;A78EA1;
    dw Hitbox_KraidFoot                                                  ;A78EA3;

ExtendedSpritemap_KraidFoot_19:
    dw $0002                                                             ;A78EA5;
    dw $FFF6,$0028
    dw Spritemap_KraidFoot_4                                             ;A78EAB;
    dw Hitbox_KraidFoot                                                  ;A78EAD;
    dw $FFFD,$FFF6                                                       ;A78EAF;
    dw Spritemap_KraidFoot_1                                             ;A78EB3;
    dw Hitbox_KraidFoot                                                  ;A78EB5;

ExtendedSpritemap_KraidFoot_1A:
    dw $0002                                                             ;A78EB7;
    dw $FFF8,$0028
    dw Spritemap_KraidFoot_4                                             ;A78EBD;
    dw Hitbox_KraidFoot                                                  ;A78EBF;
    dw $FFFF,$FFF6                                                       ;A78EC1;
    dw Spritemap_KraidFoot_1                                             ;A78EC5;
    dw Hitbox_KraidFoot                                                  ;A78EC7;

ExtendedSpritemap_KraidFoot_1B:
    dw $0002                                                             ;A78EC9;
    dw $FFFA,$0028
    dw Spritemap_KraidFoot_4                                             ;A78ECF;
    dw Hitbox_KraidFoot                                                  ;A78ED1;
    dw $0001,$FFF6                                                       ;A78ED3;
    dw Spritemap_KraidFoot_1                                             ;A78ED7;
    dw Hitbox_KraidFoot                                                  ;A78ED9;

ExtendedSpritemap_KraidFoot_1C:
    dw $0002                                                             ;A78EDB;
    dw $FFFC,$0028
    dw Spritemap_KraidFoot_4                                             ;A78EE1;
    dw Hitbox_KraidFoot                                                  ;A78EE3;
    dw $0003,$FFF6                                                       ;A78EE5;
    dw Spritemap_KraidFoot_1                                             ;A78EE9;
    dw Hitbox_KraidFoot                                                  ;A78EEB;

ExtendedSpritemap_KraidFoot_1D:
    dw $0002                                                             ;A78EED;
    dw $FFFE,$0028
    dw Spritemap_KraidFoot_4                                             ;A78EF3;
    dw Hitbox_KraidFoot                                                  ;A78EF5;
    dw $0005,$FFF6                                                       ;A78EF7;
    dw Spritemap_KraidFoot_1                                             ;A78EFB;
    dw Hitbox_KraidFoot                                                  ;A78EFD;

ExtendedSpritemap_KraidFoot_1E:
    dw $0002                                                             ;A78EFF;
    dw $0000,$0028
    dw Spritemap_KraidFoot_4                                             ;A78F05;
    dw Hitbox_KraidFoot                                                  ;A78F07;
    dw $0007,$FFF6                                                       ;A78F09;
    dw Spritemap_KraidFoot_1                                             ;A78F0D;
    dw Hitbox_KraidFoot                                                  ;A78F0F;

ExtendedSpritemap_KraidFoot_1F:
    dw $0002                                                             ;A78F11;
    dw $0002,$0028
    dw Spritemap_KraidFoot_4                                             ;A78F17;
    dw Hitbox_KraidFoot                                                  ;A78F19;
    dw $FFFA,$0000                                                       ;A78F1B;
    dw Spritemap_KraidFoot_0                                             ;A78F1F;
    dw Hitbox_KraidFoot                                                  ;A78F21;

ExtendedSpritemap_KraidFoot_20:
    dw $0002                                                             ;A78F23;
    dw $0004,$0028
    dw Spritemap_KraidFoot_4                                             ;A78F29;
    dw Hitbox_KraidFoot                                                  ;A78F2B;
    dw $FFFC,$0000                                                       ;A78F2D;
    dw Spritemap_KraidFoot_0                                             ;A78F31;
    dw Hitbox_KraidFoot                                                  ;A78F33;

ExtendedSpritemap_KraidFoot_21:
    dw $0002                                                             ;A78F35;
    dw $0006,$0028
    dw Spritemap_KraidFoot_4                                             ;A78F3B;
    dw Hitbox_KraidFoot                                                  ;A78F3D;
    dw $FFFE,$0000                                                       ;A78F3F;
    dw Spritemap_KraidFoot_0                                             ;A78F43;
    dw Hitbox_KraidFoot                                                  ;A78F45;

ExtendedSpritemap_KraidFoot_22:
    dw $0002                                                             ;A78F47;
    dw $0008,$0028
    dw Spritemap_KraidFoot_4                                             ;A78F4D;
    dw Hitbox_KraidFoot                                                  ;A78F4F;
    dw $0000,$0000                                                       ;A78F51;
    dw Spritemap_KraidFoot_0                                             ;A78F55;
    dw Hitbox_KraidFoot                                                  ;A78F57;


;;; $8F59: Extended spritemaps - Kraid arm ;;;
; General
ExtendedSpritemap_KraidArm_General_0:
    dw $0005                                                             ;A78F59;
    dw $FFDC,$FFDF
    dw Spritemap_KraidArm_General_0                                      ;A78F5F;
    dw Hitbox_KraidArm_0                                                 ;A78F61;
    dw $FFE4,$FFE8                                                       ;A78F63;
    dw Spritemap_KraidArm_General_A                                      ;A78F67;
    dw Hitbox_KraidArm_F                                                 ;A78F69;
    dw $0000,$0000                                                       ;A78F6B;
    dw Spritemap_KraidArm_General_D                                      ;A78F6F;
    dw Hitbox_KraidArm_12                                                ;A78F71;
    dw $FFDC,$FFD8                                                       ;A78F73;
    dw Spritemap_KraidArm_General_0                                      ;A78F77;
    dw Hitbox_KraidArm_0                                                 ;A78F79;
    dw $FFE4,$FFE1                                                       ;A78F7B;
    dw Spritemap_KraidArm_General_A                                      ;A78F7F;
    dw Hitbox_KraidArm_F                                                 ;A78F81;

ExtendedSpritemap_KraidArm_General_1:
    dw $0005                                                             ;A78F83;
    dw $FFDA,$FFDF
    dw Spritemap_KraidArm_General_1                                      ;A78F89;
    dw Hitbox_KraidArm_1                                                 ;A78F8B;
    dw $FFE2,$FFE6                                                       ;A78F8D;
    dw Spritemap_KraidArm_General_A                                      ;A78F91;
    dw Hitbox_KraidArm_F                                                 ;A78F93;
    dw $0000,$0000                                                       ;A78F95;
    dw Spritemap_KraidArm_General_D                                      ;A78F99;
    dw Hitbox_KraidArm_12                                                ;A78F9B;
    dw $FFDC,$FFD8                                                       ;A78F9D;
    dw Spritemap_KraidArm_General_0                                      ;A78FA1;
    dw Hitbox_KraidArm_0                                                 ;A78FA3;
    dw $FFE4,$FFE1                                                       ;A78FA5;
    dw Spritemap_KraidArm_General_A                                      ;A78FA9;
    dw Hitbox_KraidArm_F                                                 ;A78FAB;

ExtendedSpritemap_KraidArm_General_2:
    dw $0005                                                             ;A78FAD;
    dw $FFD0,$FFF3
    dw Spritemap_KraidArm_General_2                                      ;A78FB3;
    dw Hitbox_KraidArm_2                                                 ;A78FB5;
    dw $FFDA,$FFF3                                                       ;A78FB7;
    dw Spritemap_KraidArm_General_7                                      ;A78FBB;
    dw Hitbox_KraidArm_8                                                 ;A78FBD;
    dw $0000,$0000                                                       ;A78FBF;
    dw Spritemap_KraidArm_General_C                                      ;A78FC3;
    dw Hitbox_KraidArm_11                                                ;A78FC5;
    dw $FFD3,$FFE5                                                       ;A78FC7;
    dw Spritemap_KraidArm_General_1                                      ;A78FCB;
    dw Hitbox_KraidArm_1                                                 ;A78FCD;
    dw $FFDB,$FFED                                                       ;A78FCF;
    dw Spritemap_KraidArm_General_A                                      ;A78FD3;
    dw Hitbox_KraidArm_F                                                 ;A78FD5;

ExtendedSpritemap_KraidArm_General_3:
    dw $0005                                                             ;A78FD7;
    dw $FFD2,$FFF3
    dw Spritemap_KraidArm_General_3                                      ;A78FDD;
    dw Hitbox_KraidArm_3                                                 ;A78FDF;
    dw $FFDB,$FFF3                                                       ;A78FE1;
    dw Spritemap_KraidArm_General_7                                      ;A78FE5;
    dw Hitbox_KraidArm_8                                                 ;A78FE7;
    dw $0000,$0000                                                       ;A78FE9;
    dw Spritemap_KraidArm_General_C                                      ;A78FED;
    dw Hitbox_KraidArm_11                                                ;A78FEF;
    dw $FFD3,$FFED                                                       ;A78FF1;
    dw Spritemap_KraidArm_General_2                                      ;A78FF5;
    dw Hitbox_KraidArm_2                                                 ;A78FF7;
    dw $FFDC,$FFEE                                                       ;A78FF9;
    dw Spritemap_KraidArm_General_7                                      ;A78FFD;
    dw Hitbox_KraidArm_8                                                 ;A78FFF;

ExtendedSpritemap_KraidArm_General_4:
    dw $0005                                                             ;A79001;
    dw $FFD3,$0008
    dw Spritemap_KraidArm_General_4                                      ;A79007;
    dw Hitbox_KraidArm_4                                                 ;A79009;
    dw $FFDA,$0002                                                       ;A7900B;
    dw Spritemap_KraidArm_General_8                                      ;A7900F;
    dw Hitbox_KraidArm_9                                                 ;A79011;
    dw $0000,$0000                                                       ;A79013;
    dw Spritemap_KraidArm_General_B                                      ;A79017;
    dw Hitbox_KraidArm_10                                                ;A79019;
    dw $FFD2,$0003                                                       ;A7901B;
    dw Spritemap_KraidArm_General_3                                      ;A7901F;
    dw Hitbox_KraidArm_3                                                 ;A79021;
    dw $FFD9,$FFFD                                                       ;A79023;
    dw Spritemap_KraidArm_General_8                                      ;A79027;
    dw Hitbox_KraidArm_9                                                 ;A79029;

ExtendedSpritemap_KraidArm_General_5:
    dw $0005                                                             ;A7902B;
    dw $FFD4,$0008
    dw Spritemap_KraidArm_General_4                                      ;A79031;
    dw Hitbox_KraidArm_4                                                 ;A79033;
    dw $FFDB,$0002                                                       ;A79035;
    dw Spritemap_KraidArm_General_8                                      ;A79039;
    dw Hitbox_KraidArm_9                                                 ;A7903B;
    dw $0000,$0000                                                       ;A7903D;
    dw Spritemap_KraidArm_General_B                                      ;A79041;
    dw Hitbox_KraidArm_10                                                ;A79043;
    dw $FFD2,$0004                                                       ;A79045;
    dw Spritemap_KraidArm_General_4                                      ;A79049;
    dw Hitbox_KraidArm_4                                                 ;A7904B;
    dw $FFD9,$FFFE                                                       ;A7904D;
    dw Spritemap_KraidArm_General_8                                      ;A79051;
    dw Hitbox_KraidArm_9                                                 ;A79053;

ExtendedSpritemap_KraidArm_General_6:
    dw $0005                                                             ;A79055;
    dw $FFD9,$000A
    dw Spritemap_KraidArm_General_5                                      ;A7905B;
    dw Hitbox_KraidArm_5                                                 ;A7905D;
    dw $FFDA,$0000                                                       ;A7905F;
    dw Spritemap_KraidArm_General_9                                      ;A79063;
    dw Hitbox_KraidArm_A                                                 ;A79065;
    dw $0000,$0000                                                       ;A79067;
    dw Spritemap_KraidArm_General_B                                      ;A7906B;
    dw Hitbox_KraidArm_10                                                ;A7906D;
    dw $FFD5,$000A                                                       ;A7906F;
    dw Spritemap_KraidArm_General_5                                      ;A79073;
    dw Hitbox_KraidArm_5                                                 ;A79075;
    dw $FFD7,$FFFE                                                       ;A79077;
    dw Spritemap_KraidArm_General_9                                      ;A7907B;
    dw Hitbox_KraidArm_A                                                 ;A7907D;

ExtendedSpritemap_KraidArm_General_7:
    dw $0005                                                             ;A7907F;
    dw $FFD9,$000A
    dw Spritemap_KraidArm_General_5                                      ;A79085;
    dw Hitbox_KraidArm_5                                                 ;A79087;
    dw $FFDA,$0000                                                       ;A79089;
    dw Spritemap_KraidArm_General_9                                      ;A7908D;
    dw Hitbox_KraidArm_A                                                 ;A7908F;
    dw $0000,$0000                                                       ;A79091;
    dw Spritemap_KraidArm_General_B                                      ;A79095;
    dw Hitbox_KraidArm_10                                                ;A79097;
    dw $FFD5,$0009                                                       ;A79099;
    dw Spritemap_KraidArm_General_5                                      ;A7909D;
    dw Hitbox_KraidArm_5                                                 ;A7909F;
    dw $FFD7,$FFFE                                                       ;A790A1;
    dw Spritemap_KraidArm_General_9                                      ;A790A5;
    dw Hitbox_KraidArm_A                                                 ;A790A7;

ExtendedSpritemap_KraidArm_General_8:
    dw $0005                                                             ;A790A9;
    dw $FFD9,$000A
    dw Spritemap_KraidArm_General_6                                      ;A790AF;
    dw Hitbox_KraidArm_6                                                 ;A790B1;
    dw $FFDA,$0000                                                       ;A790B3;
    dw Spritemap_KraidArm_General_9                                      ;A790B7;
    dw Hitbox_KraidArm_A                                                 ;A790B9;
    dw $0000,$0000                                                       ;A790BB;
    dw Spritemap_KraidArm_General_B                                      ;A790BF;
    dw Hitbox_KraidArm_10                                                ;A790C1;
    dw $FFD5,$0009                                                       ;A790C3;
    dw Spritemap_KraidArm_General_5                                      ;A790C7;
    dw Hitbox_KraidArm_5                                                 ;A790C9;
    dw $FFD7,$FFFE                                                       ;A790CB;
    dw Spritemap_KraidArm_General_9                                      ;A790CF;
    dw Hitbox_KraidArm_A                                                 ;A790D1;

ExtendedSpritemap_KraidArm_General_9:
    dw $0005                                                             ;A790D3;
    dw $FFD9,$000A
    dw Spritemap_KraidArm_General_6                                      ;A790D9;
    dw Hitbox_KraidArm_6                                                 ;A790DB;
    dw $FFDA,$0000                                                       ;A790DD;
    dw Spritemap_KraidArm_General_9                                      ;A790E1;
    dw Hitbox_KraidArm_A                                                 ;A790E3;
    dw $0000,$0000                                                       ;A790E5;
    dw Spritemap_KraidArm_General_B                                      ;A790E9;
    dw Hitbox_KraidArm_10                                                ;A790EB;
    dw $FFD6,$0009                                                       ;A790ED;
    dw Spritemap_KraidArm_General_6                                      ;A790F1;
    dw Hitbox_KraidArm_6                                                 ;A790F3;
    dw $FFD6,$FFFE                                                       ;A790F5;
    dw Spritemap_KraidArm_General_9                                      ;A790F9;
    dw Hitbox_KraidArm_A                                                 ;A790FB;

; Rising/sinking
ExtendedSpritemap_KraidArm_RisingSinking_0:
    dw $0005                                                             ;A790FD;
    dw $FFDC,$FFDF
    dw Spritemap_KraidArm_RisingSinking_0                                ;A79103;
    dw Hitbox_KraidArm_0                                                 ;A79105;
    dw $FFE4,$FFE8                                                       ;A79107;
    dw Spritemap_KraidArm_RisingSinking_A                                ;A7910B;
    dw Hitbox_KraidArm_F                                                 ;A7910D;
    dw $0000,$0000                                                       ;A7910F;
    dw Spritemap_KraidArm_RisingSinking_D                                ;A79113;
    dw Hitbox_KraidArm_12                                                ;A79115;
    dw $FFDC,$FFD8                                                       ;A79117;
    dw Spritemap_KraidArm_RisingSinking_0                                ;A7911B;
    dw Hitbox_KraidArm_0                                                 ;A7911D;
    dw $FFE4,$FFE1                                                       ;A7911F;
    dw Spritemap_KraidArm_RisingSinking_A                                ;A79123;
    dw Hitbox_KraidArm_F                                                 ;A79125;

ExtendedSpritemap_KraidArm_RisingSinking_1:
    dw $0005                                                             ;A79127;
    dw $FFDA,$FFDF
    dw Spritemap_KraidArm_RisingSinking_1                                ;A7912D;
    dw Hitbox_KraidArm_1                                                 ;A7912F;
    dw $FFE2,$FFE6                                                       ;A79131;
    dw Spritemap_KraidArm_RisingSinking_A                                ;A79135;
    dw Hitbox_KraidArm_F                                                 ;A79137;
    dw $0000,$0000                                                       ;A79139;
    dw Spritemap_KraidArm_RisingSinking_D                                ;A7913D;
    dw Hitbox_KraidArm_12                                                ;A7913F;
    dw $FFDC,$FFD8                                                       ;A79141;
    dw Spritemap_KraidArm_RisingSinking_0                                ;A79145;
    dw Hitbox_KraidArm_0                                                 ;A79147;
    dw $FFE4,$FFE1                                                       ;A79149;
    dw Spritemap_KraidArm_RisingSinking_A                                ;A7914D;
    dw Hitbox_KraidArm_F                                                 ;A7914F;

ExtendedSpritemap_KraidArm_RisingSinking_2:
    dw $0005                                                             ;A79151;
    dw $FFD0,$FFF3
    dw Spritemap_KraidArm_RisingSinking_2                                ;A79157;
    dw Hitbox_KraidArm_2                                                 ;A79159;
    dw $FFDA,$FFF3                                                       ;A7915B;
    dw Spritemap_KraidArm_RisingSinking_7                                ;A7915F;
    dw Hitbox_KraidArm_8                                                 ;A79161;
    dw $0000,$0000                                                       ;A79163;
    dw Spritemap_KraidArm_RisingSinking_C                                ;A79167;
    dw Hitbox_KraidArm_11                                                ;A79169;
    dw $FFD3,$FFE5                                                       ;A7916B;
    dw Spritemap_KraidArm_RisingSinking_1                                ;A7916F;
    dw Hitbox_KraidArm_1                                                 ;A79171;
    dw $FFDB,$FFED                                                       ;A79173;
    dw Spritemap_KraidArm_RisingSinking_A                                ;A79177;
    dw Hitbox_KraidArm_F                                                 ;A79179;

ExtendedSpritemap_KraidArm_RisingSinking_3:
    dw $0005                                                             ;A7917B;
    dw $FFD2,$FFF3
    dw Spritemap_KraidArm_RisingSinking_3                                ;A79181;
    dw Hitbox_KraidArm_3                                                 ;A79183;
    dw $FFDB,$FFF3                                                       ;A79185;
    dw Spritemap_KraidArm_RisingSinking_7                                ;A79189;
    dw Hitbox_KraidArm_8                                                 ;A7918B;
    dw $0000,$0000                                                       ;A7918D;
    dw Spritemap_KraidArm_RisingSinking_C                                ;A79191;
    dw Hitbox_KraidArm_11                                                ;A79193;
    dw $FFD3,$FFED                                                       ;A79195;
    dw Spritemap_KraidArm_RisingSinking_2                                ;A79199;
    dw Hitbox_KraidArm_2                                                 ;A7919B;
    dw $FFDC,$FFEE                                                       ;A7919D;
    dw Spritemap_KraidArm_RisingSinking_7                                ;A791A1;
    dw Hitbox_KraidArm_8                                                 ;A791A3;

ExtendedSpritemap_KraidArm_RisingSinking_4:
    dw $0005                                                             ;A791A5;
    dw $FFD3,$0008
    dw Spritemap_KraidArm_RisingSinking_4                                ;A791AB;
    dw Hitbox_KraidArm_4                                                 ;A791AD;
    dw $FFDA,$0002                                                       ;A791AF;
    dw Spritemap_KraidArm_RisingSinking_8                                ;A791B3;
    dw Hitbox_KraidArm_9                                                 ;A791B5;
    dw $0000,$0000                                                       ;A791B7;
    dw Spritemap_KraidArm_RisingSinking_B                                ;A791BB;
    dw Hitbox_KraidArm_10                                                ;A791BD;
    dw $FFD2,$0003                                                       ;A791BF;
    dw Spritemap_KraidArm_RisingSinking_3                                ;A791C3;
    dw Hitbox_KraidArm_3                                                 ;A791C5;
    dw $FFD9,$FFFD                                                       ;A791C7;
    dw Spritemap_KraidArm_RisingSinking_8                                ;A791CB;
    dw Hitbox_KraidArm_9                                                 ;A791CD;

ExtendedSpritemap_KraidArm_RisingSinking_5:
    dw $0005                                                             ;A791CF;
    dw $FFD4,$0008
    dw Spritemap_KraidArm_RisingSinking_4                                ;A791D5;
    dw Hitbox_KraidArm_4                                                 ;A791D7;
    dw $FFDB,$0002                                                       ;A791D9;
    dw Spritemap_KraidArm_RisingSinking_8                                ;A791DD;
    dw Hitbox_KraidArm_9                                                 ;A791DF;
    dw $0000,$0000                                                       ;A791E1;
    dw Spritemap_KraidArm_RisingSinking_B                                ;A791E5;
    dw Hitbox_KraidArm_10                                                ;A791E7;
    dw $FFD2,$0004                                                       ;A791E9;
    dw Spritemap_KraidArm_RisingSinking_4                                ;A791ED;
    dw Hitbox_KraidArm_4                                                 ;A791EF;
    dw $FFD9,$FFFE                                                       ;A791F1;
    dw Spritemap_KraidArm_RisingSinking_8                                ;A791F5;
    dw Hitbox_KraidArm_9                                                 ;A791F7;

ExtendedSpritemap_KraidArm_RisingSinking_6:
    dw $0005                                                             ;A791F9;
    dw $FFD9,$000A
    dw Spritemap_KraidArm_RisingSinking_5                                ;A791FF;
    dw Hitbox_KraidArm_5                                                 ;A79201;
    dw $FFDA,$0000                                                       ;A79203;
    dw Spritemap_KraidArm_RisingSinking_9                                ;A79207;
    dw Hitbox_KraidArm_A                                                 ;A79209;
    dw $0000,$0000                                                       ;A7920B;
    dw Spritemap_KraidArm_RisingSinking_B                                ;A7920F;
    dw Hitbox_KraidArm_10                                                ;A79211;
    dw $FFD5,$000A                                                       ;A79213;
    dw Spritemap_KraidArm_RisingSinking_5                                ;A79217;
    dw Hitbox_KraidArm_5                                                 ;A79219;
    dw $FFD7,$FFFE                                                       ;A7921B;
    dw Spritemap_KraidArm_RisingSinking_9                                ;A7921F;
    dw Hitbox_KraidArm_A                                                 ;A79221;

ExtendedSpritemap_KraidArm_RisingSinking_7:
    dw $0005                                                             ;A79223;
    dw $FFD9,$000A
    dw Spritemap_KraidArm_RisingSinking_5                                ;A79229;
    dw Hitbox_KraidArm_5                                                 ;A7922B;
    dw $FFDA,$0000                                                       ;A7922D;
    dw Spritemap_KraidArm_RisingSinking_9                                ;A79231;
    dw Hitbox_KraidArm_A                                                 ;A79233;
    dw $0000,$0000                                                       ;A79235;
    dw Spritemap_KraidArm_RisingSinking_B                                ;A79239;
    dw Hitbox_KraidArm_10                                                ;A7923B;
    dw $FFD5,$0009                                                       ;A7923D;
    dw Spritemap_KraidArm_RisingSinking_5                                ;A79241;
    dw Hitbox_KraidArm_5                                                 ;A79243;
    dw $FFD7,$FFFE                                                       ;A79245;
    dw Spritemap_KraidArm_RisingSinking_9                                ;A79249;
    dw Hitbox_KraidArm_A                                                 ;A7924B;

ExtendedSpritemap_KraidArm_RisingSinking_8:
    dw $0005                                                             ;A7924D;
    dw $FFD9,$000A
    dw Spritemap_KraidArm_RisingSinking_6                                ;A79253;
    dw Hitbox_KraidArm_6                                                 ;A79255;
    dw $FFDA,$0000                                                       ;A79257;
    dw Spritemap_KraidArm_RisingSinking_9                                ;A7925B;
    dw Hitbox_KraidArm_A                                                 ;A7925D;
    dw $0000,$0000                                                       ;A7925F;
    dw Spritemap_KraidArm_RisingSinking_B                                ;A79263;
    dw Hitbox_KraidArm_10                                                ;A79265;
    dw $FFD5,$0009                                                       ;A79267;
    dw Spritemap_KraidArm_RisingSinking_5                                ;A7926B;
    dw Hitbox_KraidArm_5                                                 ;A7926D;
    dw $FFD7,$FFFE                                                       ;A7926F;
    dw Spritemap_KraidArm_RisingSinking_9                                ;A79273;
    dw Hitbox_KraidArm_A                                                 ;A79275;

ExtendedSpritemap_KraidArm_RisingSinking_9:
    dw $0005                                                             ;A79277;
    dw $FFD9,$000A
    dw Spritemap_KraidArm_RisingSinking_6                                ;A7927D;
    dw Hitbox_KraidArm_6                                                 ;A7927F;
    dw $FFDA,$0000                                                       ;A79281;
    dw Spritemap_KraidArm_RisingSinking_9                                ;A79285;
    dw Hitbox_KraidArm_A                                                 ;A79287;
    dw $0000,$0000                                                       ;A79289;
    dw Spritemap_KraidArm_RisingSinking_B                                ;A7928D;
    dw Hitbox_KraidArm_10                                                ;A7928F;
    dw $FFD6,$0009                                                       ;A79291;
    dw Spritemap_KraidArm_RisingSinking_6                                ;A79295;
    dw Hitbox_KraidArm_6                                                 ;A79297;
    dw $FFD6,$FFFE                                                       ;A79299;
    dw Spritemap_KraidArm_RisingSinking_9                                ;A7929D;
    dw Hitbox_KraidArm_A                                                 ;A7929F;

; Dying / preparing to lunge forward
ExtendedSpritemap_KraidArm_Dying_PreparingToLungeForward_0:
    dw $0001                                                             ;A792A1;
    dw $0000,$0000
    dw Spritemap_KraidArm_Dying_PreparingToLunge_0                       ;A792A7;
    dw Hitbox_KraidArm_Dying_PreparingToLungeForward_0                   ;A792A9;

ExtendedSpritemap_KraidArm_Dying_PreparingToLungeForward_1:
    dw $0001                                                             ;A792AB;
    dw $0000,$0000
    dw Spritemap_KraidArm_Dying_PreparingToLunge_1                       ;A792B1;
    dw Hitbox_KraidArm_Dying_PreparingToLungeForward_1                   ;A792B3;


;;; $92B5: Hitbox - Kraid lint ;;;
Hitbox_KraidLint:
    dw $0001                                                             ;A792B5;
    dw $FFE8,$FFFC,$0004,$0006                                           ;A792B7;
    dw EnemyTouch_KraidArm_KraidFoot_Normal                              ;A792BF;
    dw RTL_A794B5                                                        ;A792C1;


if !FEATURE_KEEP_UNREFERENCED
;;; $92C3: Unused. Hitbox - Kraid foot ;;;
UNUSED_Hitbox_KraidFoot:
    dw $0001                                                             ;A792C3;
    dw $FFF8,$FFF8,$0007,$0007
    dw EnemyTouch_KraidArm_KraidFoot_Normal                              ;A792CD;
    dw RTL_A794B5                                                        ;A792CF;
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $92D1: Hitboxes - Kraid arm ;;;
Hitbox_KraidArm_0:
    dw $0002                                                             ;A792D1;
    dw $FFF3,$FFF5,$FFFD,$FFFB
    dw EnemyTouch_KraidArm                                               ;A792DB;
    dw EnemyShot_KraidArm                                                ;A792DD;
    dw $FFF7,$FFFB,$0001,$0002                                           ;A792DF;
    dw EnemyTouch_KraidArm                                               ;A792E7;
    dw EnemyShot_KraidArm                                                ;A792E9;

Hitbox_KraidArm_1:
    dw $0001                                                             ;A792EB;
    dw $FFF0,$FFFB,$0001,$0002
    dw EnemyTouch_KraidArm                                               ;A792F5;
    dw EnemyShot_KraidArm                                                ;A792F7;

Hitbox_KraidArm_2:
    dw $0002                                                             ;A792F9;
    dw $FFF7,$FFFE,$0001,$0007
    dw EnemyTouch_KraidArm                                               ;A79303;
    dw EnemyShot_KraidArm                                                ;A79305;
    dw $FFF4,$0003,$FFFA,$000C                                           ;A79307;
    dw EnemyTouch_KraidArm                                               ;A7930F;
    dw EnemyShot_KraidArm                                                ;A79311;

Hitbox_KraidArm_3:
    dw $0001                                                             ;A79313;
    dw $FFFA,$FFFF,$0001,$000E
    dw EnemyTouch_KraidArm                                               ;A7931D;
    dw EnemyShot_KraidArm                                                ;A7931F;

Hitbox_KraidArm_4:
    dw $0002                                                             ;A79321;
    dw $FFFD,$FFFE,$0006,$0009
    dw EnemyTouch_KraidArm                                               ;A7932B;
    dw EnemyShot_KraidArm                                                ;A7932D;
    dw $0002,$0007,$000B,$000B                                           ;A7932F;
    dw EnemyTouch_KraidArm                                               ;A79337;
    dw EnemyShot_KraidArm                                                ;A79339;

Hitbox_KraidArm_5:
    dw $0001                                                             ;A7933B;
    dw $FFFF,$FFFC,$000E,$0004
    dw EnemyTouch_KraidArm                                               ;A79345;
    dw EnemyShot_KraidArm                                                ;A79347;

Hitbox_KraidArm_6:
    dw $0002                                                             ;A79349;
    dw $FFFD,$FFF9,$0006,$0002
    dw EnemyTouch_KraidArm                                               ;A79353;
    dw EnemyShot_KraidArm                                                ;A79355;
    dw $0004,$FFF4,$000A,$FFFF                                           ;A79357;
    dw EnemyTouch_KraidArm                                               ;A7935F;
    dw EnemyShot_KraidArm                                                ;A79361;

Hitbox_KraidArm_7:
    dw $0001                                                             ;A79363;
    dw $FFFC,$FFF2,$0003,$0001
    dw EnemyTouch_KraidArm_KraidFoot_Normal                              ;A7936D;
    dw EnemyShot_KraidArm                                                ;A7936F;

Hitbox_KraidArm_8:
    dw $0001                                                             ;A79371;
    dw $FFF1,$FFFB,$0002,$0004
    dw EnemyTouch_KraidArm                                               ;A7937B;
    dw EnemyShot_KraidArm                                                ;A7937D;

Hitbox_KraidArm_9:
    dw $0002                                                             ;A7937F;
    dw $FFF5,$0002,$FFFC,$000A
    dw EnemyTouch_KraidArm                                               ;A79389;
    dw EnemyShot_KraidArm                                                ;A7938B;
    dw $FFFA,$FFFD,$0003,$0005                                           ;A7938D;
    dw EnemyTouch_KraidArm                                               ;A79395;
    dw EnemyShot_KraidArm                                                ;A79397;

Hitbox_KraidArm_A:
    dw $0001                                                             ;A79399;
    dw $FFFC,$FFFE,$0003,$000D
    dw EnemyTouch_KraidArm                                               ;A793A3;
    dw EnemyShot_KraidArm                                                ;A793A5;

Hitbox_KraidArm_B:
    dw $0002                                                             ;A793A7;
    dw $0003,$0002,$000A,$000B
    dw EnemyTouch_KraidArm_KraidFoot_Normal                              ;A793B1;
    dw EnemyShot_KraidArm                                                ;A793B3;
    dw $FFFD,$FFFD,$0005,$0005                                           ;A793B5;
    dw EnemyTouch_KraidArm_KraidFoot_Normal                              ;A793BD;
    dw EnemyShot_KraidArm                                                ;A793BF;

Hitbox_KraidArm_C:
    dw $0001                                                             ;A793C1;
    dw $FFFD,$FFFB,$000E,$0004
    dw EnemyTouch_KraidArm_KraidFoot_Normal                              ;A793CB;
    dw EnemyShot_KraidArm                                                ;A793CD;

Hitbox_KraidArm_D:
    dw $0002                                                             ;A793CF;
    dw $0002,$FFF4,$000B,$FFFC
    dw EnemyTouch_KraidArm_KraidFoot_Normal                              ;A793D9;
    dw EnemyShot_KraidArm                                                ;A793DB;
    dw $FFFD,$FFF9,$0004,$0002                                           ;A793DD;
    dw EnemyTouch_KraidArm_KraidFoot_Normal                              ;A793E5;
    dw EnemyShot_KraidArm                                                ;A793E7;

Hitbox_KraidArm_E:
    dw $0001                                                             ;A793E9;
    dw $FFFC,$FFF1,$0005,$0002
    dw EnemyTouch_KraidArm_KraidFoot_Normal                              ;A793F3;
    dw EnemyShot_KraidArm                                                ;A793F5;

Hitbox_KraidArm_F:
    dw $0002                                                             ;A793F7;
    dw $FFF4,$FFF4,$FFFD,$FFFD
    dw EnemyTouch_KraidArm                                               ;A79401;
    dw EnemyShot_KraidArm                                                ;A79403;
    dw $FFFA,$FFFA,$0003,$0002                                           ;A79405;
    dw EnemyTouch_KraidArm                                               ;A7940D;
    dw EnemyShot_KraidArm                                                ;A7940F;

Hitbox_KraidArm_10:
    dw $0001                                                             ;A79411;
    dw $FFD3,$FFF7,$0004,$0008
    dw EnemyTouch_KraidArm_KraidFoot_Normal                              ;A7941B;
    dw EnemyShot_KraidArm                                                ;A7941D;

Hitbox_KraidArm_11:
    dw $0002                                                             ;A7941F;
    dw $FFE4,$FFEF,$FFF4,$0000
    dw EnemyTouch_KraidArm_KraidFoot_Normal                              ;A79429;
    dw EnemyShot_KraidArm                                                ;A7942B;
    dw $FFD6,$FFE9,$FFE4,$FFFA                                           ;A7942D;
    dw EnemyTouch_KraidArm_KraidFoot_Normal                              ;A79435;
    dw EnemyShot_KraidArm                                                ;A79437;

Hitbox_KraidArm_12:
    dw $0002                                                             ;A79439;
    dw $FFEA,$FFE7,$FFF8,$FFFB
    dw EnemyTouch_KraidArm_KraidFoot_Normal                              ;A79443;
    dw EnemyShot_KraidArm                                                ;A79445;
    dw $FFDD,$FFDD,$FFED,$FFEF                                           ;A79447;
    dw EnemyTouch_KraidArm_KraidFoot_Normal                              ;A7944F;
    dw EnemyShot_KraidArm                                                ;A79451;


;;; $9453: Hitbox - Kraid foot ;;;
Hitbox_KraidFoot:
    dw $0001                                                             ;A79453;
    dw $FFFA,$FFFA,$0006,$0006
    dw EnemyTouch_KraidArm_KraidFoot_Normal                              ;A7945D;
    dw RTL_A794B5                                                        ;A7945F;


if !FEATURE_KEEP_UNREFERENCED
;;; $9461: Unused. Hitbox - Kraid foot ;;;
UNUSED_Hitbox_KraidFoot_A79461:
    dw $0001                                                             ;A79461;
    dw $FFFE,$FFFD,$0002,$0003
    dw EnemyTouch_KraidArm_KraidFoot_Normal                              ;A7946B;
    dw RTL_A794B5                                                        ;A7946D;
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $946F: Hitboxes - Kraid arm - dying / preparing to lunge forward ;;;
Hitbox_KraidArm_Dying_PreparingToLungeForward_0:
    dw $0001                                                             ;A7946F;
    dw $FFC0,$FFD0,$FFE0,$FFF0
    dw EnemyTouch_KraidArm_KraidFoot_Normal                              ;A79479;
    dw EnemyShot_KraidArm                                                ;A7947B;

Hitbox_KraidArm_Dying_PreparingToLungeForward_1:
    dw $0001                                                             ;A7947D;
    dw $FFC0,$FFFC,$0000,$0004
    dw EnemyTouch_KraidArm_KraidFoot_Normal                              ;A79487;
    dw EnemyShot_KraidArm                                                ;A79489;


;;; $948B: Enemy touch - Kraid arm/foot - normal ;;;
EnemyTouch_KraidArm_KraidFoot_Normal:
    JSL.L NormalEnemyTouchAI_Internal                                    ;A7948B; fallthrough to RTL_A7948F


RTL_A7948F:
    RTL                                                                  ;A7948F;


;;; $9490: Enemy touch - enemy $E2FF (Kraid arm) ;;;
EnemyTouch_KraidArm:
    LDA.W SamusInvincibilityTimer                                        ;A79490;
    BEQ .SamusInvincible                                                 ;A79493;
    RTL                                                                  ;A79495;

  .SamusInvincible:
    JSR.W PushSamusBack                                                  ;A79496;
    LDA.W #Function_KraidLint_FireLint                                   ;A79499;
    STA.W Enemy[4].var0                                                  ;A7949C; fallthrough to EnemyTouch_Kraid


;;; $949F: Enemy touch - enemy $E2BF (Kraid) ;;;
EnemyTouch_Kraid:
    JSL.L NormalEnemyTouchAI_NoDeathCheck_External                       ;A7949F;
    RTL                                                                  ;A794A3;


;;; $94A4: Push Samus back ;;;
PushSamusBack:
    LDA.W #$0004                                                         ;A794A4;
    STA.W ExtraSamusXDisplacement                                        ;A794A7;
    LDA.W #$FFF8                                                         ;A794AA;
    STA.W ExtraSamusYDisplacement                                        ;A794AD;
    RTS                                                                  ;A794B0;


;;; $94B1: Normal enemy shot ;;;
NormalEnemyShot:
    JSL.L NormalEnemyShotAI_Internal                                     ;A794B1; fallthrough to RTL_A794B5


RTL_A794B5:
    RTL                                                                  ;A794B5;


;;; $94B6: Enemy shot - Kraid arm ;;;
EnemyShot_KraidArm:
    TYX                                                                  ;A794B6;
    JSR.W SpawnExplosionProjectile                                       ;A794B7;
    LDA.W SamusProjectile_Directions,Y                                   ;A794BA;
    ORA.W #$0010                                                         ;A794BD;
    STA.W SamusProjectile_Directions,Y                                   ;A794C0;
    RTL                                                                  ;A794C3;


if !FEATURE_KEEP_UNREFERENCED
;;; $94C4: Unused. Spritemap - Kraid lint ;;;
UNUSED_Spritemap_KraidLint_A794C4:
    dw $0004                                                             ;A794C4;
    %spritemapEntry(0, $00, $08, 0, 0, 2, 0, $1C2)
    %spritemapEntry(1, $1F0, $00, 0, 0, 2, 0, $1B0)
    %spritemapEntry(1, $00, $F8, 0, 0, 2, 0, $1A2)
    %spritemapEntry(1, $1F0, $F8, 0, 0, 2, 0, $1A0)


;;; $94DA: Unused. Spritemap - Kraid foot ;;;
UNUSED_Spritemap_KraidFoot_A794DA:
    dw $0001                                                             ;A794DA;
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $1A9)
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $94E1: Spritemaps - Kraid arm - general ;;;
Spritemap_KraidArm_General_0:
    dw $0001                                                             ;A794E1;
    %spritemapEntry(1, $1F2, $F4, 0, 0, 3, 0, $126)

Spritemap_KraidArm_General_1:
    dw $0002                                                             ;A794E8;
    %spritemapEntry(0, $1F9, $FB, 0, 0, 3, 0, $129)
    %spritemapEntry(0, $1F1, $FB, 0, 0, 3, 0, $128)

Spritemap_KraidArm_General_2:
    dw $0001                                                             ;A794F4;
    %spritemapEntry(1, $1F2, $FD, 0, 0, 3, 0, $12A)

Spritemap_KraidArm_General_3:
    dw $0002                                                             ;A794FB;
    %spritemapEntry(0, $1FA, $07, 0, 0, 3, 0, $139)
    %spritemapEntry(0, $1FA, $FF, 0, 0, 3, 0, $138)

Spritemap_KraidArm_General_4:
    dw $0001                                                             ;A79507;
    %spritemapEntry(1, $1FD, $FD, 1, 1, 3, 0, $126)

Spritemap_KraidArm_General_5:
    dw $0002                                                             ;A7950E;
    %spritemapEntry(0, $1FF, $FD, 1, 1, 3, 0, $129)
    %spritemapEntry(0, $07, $FD, 1, 1, 3, 0, $128)

Spritemap_KraidArm_General_6:
    dw $0001                                                             ;A7951A;
    %spritemapEntry(1, $1FD, $F4, 1, 1, 3, 0, $12A)

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Spritemap_KraidArm_General_A79521:
    dw $0002                                                             ;A79521;
    %spritemapEntry(0, $1FC, $F2, 1, 1, 3, 0, $139)
    %spritemapEntry(0, $1FC, $FA, 1, 1, 3, 0, $138)
endif ; !FEATURE_KEEP_UNREFERENCED

Spritemap_KraidArm_General_7:
    dw $0002                                                             ;A7952D;
    %spritemapEntry(0, $1FA, $FC, 1, 1, 3, 0, $12E)
    %spritemapEntry(0, $1F2, $FC, 1, 0, 3, 0, $12E)

Spritemap_KraidArm_General_8:
    dw $0001                                                             ;A79539;
    %spritemapEntry(1, $1F4, $FC, 1, 0, 3, 0, $12C)

Spritemap_KraidArm_General_9:
    dw $0002                                                             ;A79540;
    %spritemapEntry(0, $1FC, $06, 1, 0, 3, 0, $13E)
    %spritemapEntry(0, $1FC, $FE, 0, 0, 3, 0, $13E)

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Spritemap_KraidArm_General_A7954C:
    dw $0001                                                             ;A7954C;
    %spritemapEntry(1, $1FC, $FC, 0, 0, 3, 0, $12C)

UNUSED_Spritemap_KraidArm_General_A79553:
    dw $0002                                                             ;A79553;
    %spritemapEntry(0, $06, $FC, 0, 1, 3, 0, $12E)
    %spritemapEntry(0, $1FE, $FC, 0, 0, 3, 0, $12E)

UNUSED_Spritemap_KraidArm_General_A7955F:
    dw $0001                                                             ;A7955F;
    %spritemapEntry(1, $1FC, $F4, 0, 1, 3, 0, $12C)

UNUSED_Spritemap_KraidArm_General_A79566:
    dw $0002                                                             ;A79566;
    %spritemapEntry(0, $1FD, $FA, 1, 1, 3, 0, $13E)
    %spritemapEntry(0, $1FD, $F2, 0, 1, 3, 0, $13E)
endif ; !FEATURE_KEEP_UNREFERENCED

Spritemap_KraidArm_General_A:
    dw $0001                                                             ;A79572;
    %spritemapEntry(1, $1F4, $F4, 0, 0, 3, 0, $12C)

Spritemap_KraidArm_General_B:
    dw $0003                                                             ;A79579;
    %spritemapEntry(1, $1F4, $F8, 0, 0, 3, 0, $104)
    %spritemapEntry(1, $1E4, $F8, 0, 0, 3, 0, $102)
    %spritemapEntry(1, $1D4, $F8, 0, 0, 3, 0, $100)

Spritemap_KraidArm_General_C:
    dw $0008                                                             ;A7958A;
    %spritemapEntry(0, $1EC, $00, 0, 0, 3, 0, $11C)
    %spritemapEntry(0, $1FC, $F0, 0, 0, 3, 0, $10F)
    %spritemapEntry(0, $1F4, $F0, 0, 0, 3, 0, $10E)
    %spritemapEntry(0, $1E4, $E8, 0, 0, 3, 0, $10D)
    %spritemapEntry(0, $1DC, $F8, 0, 0, 3, 0, $10C)
    %spritemapEntry(1, $1F4, $F8, 0, 0, 3, 0, $10A)
    %spritemapEntry(1, $1E4, $F0, 0, 0, 3, 0, $108)
    %spritemapEntry(1, $1D4, $E8, 0, 0, 3, 0, $106)

Spritemap_KraidArm_General_D:
    dw $0008                                                             ;A795B4;
    %spritemapEntry(0, $1FC, $ED, 0, 0, 3, 0, $13F)
    %spritemapEntry(0, $1EC, $FD, 0, 0, 3, 0, $12F)
    %spritemapEntry(0, $1EC, $F5, 0, 0, 3, 0, $11F)
    %spritemapEntry(0, $1EC, $DD, 0, 0, 3, 0, $11E)
    %spritemapEntry(0, $1E4, $ED, 0, 0, 3, 0, $11D)
    %spritemapEntry(1, $1F4, $F5, 0, 0, 3, 0, $124)
    %spritemapEntry(1, $1EC, $E5, 0, 0, 3, 0, $122)
    %spritemapEntry(1, $1DC, $DD, 0, 0, 3, 0, $120)


;;; $95DE: Spritemaps - Kraid foot ;;;
Spritemap_KraidFoot_0:
    dw $0008                                                             ;A795DE;
    %spritemapEntry(1, $20, $1C, 0, 0, 3, 0, $15A)
    %spritemapEntry(1, $20, $14, 0, 0, 3, 0, $14A)
    %spritemapEntry(1, $10, $1C, 0, 0, 3, 0, $148)
    %spritemapEntry(0, $1F8, $0C, 0, 0, 3, 0, $14C)
    %spritemapEntry(1, $10, $0C, 0, 0, 3, 0, $146)
    %spritemapEntry(1, $00, $0C, 0, 0, 3, 0, $144)
    %spritemapEntry(1, $08, $FC, 0, 0, 3, 0, $142)
    %spritemapEntry(1, $1F8, $FC, 0, 0, 3, 0, $140)

Spritemap_KraidFoot_1:
    dw $0008                                                             ;A79608;
    %spritemapEntry(1, $12, $28, 0, 0, 3, 0, $168)
    %spritemapEntry(1, $0A, $28, 0, 0, 3, 0, $167)
    %spritemapEntry(1, $10, $18, 0, 0, 3, 0, $182)
    %spritemapEntry(1, $00, $18, 0, 0, 3, 0, $180)
    %spritemapEntry(1, $08, $08, 0, 0, 3, 0, $165)
    %spritemapEntry(1, $1F8, $08, 0, 0, 3, 0, $163)
    %spritemapEntry(1, $00, $F8, 0, 0, 3, 0, $161)
    %spritemapEntry(1, $1F8, $F8, 0, 0, 3, 0, $160)

Spritemap_KraidFoot_2:
    dw $0008                                                             ;A79632;
    %spritemapEntry(1, $1F9, $2C, 0, 0, 3, 0, $1AD)
    %spritemapEntry(1, $1F8, $1C, 0, 0, 3, 0, $18D)
    %spritemapEntry(1, $1F8, $0C, 0, 0, 3, 0, $16D)
    %spritemapEntry(1, $1F8, $FC, 0, 0, 3, 0, $14D)
    %spritemapEntry(1, $01, $2C, 0, 0, 3, 0, $1AE)
    %spritemapEntry(1, $00, $1C, 0, 0, 3, 0, $18E)
    %spritemapEntry(1, $00, $0C, 0, 0, 3, 0, $16E)
    %spritemapEntry(1, $00, $FC, 0, 0, 3, 0, $14E)

Spritemap_KraidFoot_3:
    dw $0008                                                             ;A7965C;
    %spritemapEntry(1, $1F0, $2C, 0, 0, 3, 0, $1A5)
    %spritemapEntry(1, $1E8, $2C, 0, 0, 3, 0, $1A4)
    %spritemapEntry(1, $1F8, $1C, 0, 0, 3, 0, $1CE)
    %spritemapEntry(1, $1E8, $1C, 0, 0, 3, 0, $1CC)
    %spritemapEntry(1, $00, $0C, 0, 0, 3, 0, $17A)
    %spritemapEntry(1, $1F0, $0C, 0, 0, 3, 0, $188)
    %spritemapEntry(1, $00, $FC, 0, 0, 3, 0, $186)
    %spritemapEntry(1, $1F0, $FC, 0, 0, 3, 0, $184)

Spritemap_KraidFoot_4:
    dw $000C                                                             ;A79686;
    %spritemapEntry(0, $1D8, $F4, 0, 0, 3, 0, $1C3)
    %spritemapEntry(0, $18, $F4, 0, 0, 3, 0, $19A)
    %spritemapEntry(1, $00, $F4, 0, 0, 3, 0, $1C8)
    %spritemapEntry(1, $1F0, $F4, 0, 0, 3, 0, $1C6)
    %spritemapEntry(1, $1E0, $F4, 0, 0, 3, 0, $1C4)
    %spritemapEntry(1, $1D0, $FC, 0, 0, 3, 0, $1A7)
    %spritemapEntry(1, $20, $FC, 0, 0, 3, 0, $1AB)
    %spritemapEntry(1, $20, $F4, 0, 0, 3, 0, $19B)
    %spritemapEntry(1, $10, $FC, 0, 0, 3, 0, $1DA)
    %spritemapEntry(1, $00, $FC, 0, 0, 3, 0, $1D8)
    %spritemapEntry(1, $1F0, $FC, 0, 0, 3, 0, $1D6)
    %spritemapEntry(1, $1E0, $FC, 0, 0, 3, 0, $1D4)


;;; $96C4: Unused. Spritemaps - Kraid foot ;;;
if !FEATURE_KEEP_UNREFERENCED
UNUSED_Spritemap_KraidFoot_A796C4:
    dw $0001                                                             ;A796C4;
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $1D0)

UNUSED_Spritemap_KraidFoot_A796CB:
    dw $0001                                                             ;A796CB;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 0, $1D2)
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $96D2: Kraid instruction list - roar ;;;
InstList_Kraid_Roar_0:
    dw $000A                                                             ;A796D2; Timer
    dw Tilemap_KraidHead_0                                               ;A796D4; Tilemap
    dw Hitbox_KraidMouth_0                                               ;A796D6; Vulnerable mouth hitbox
    dw $FFFF                                                             ;A796D8; Invulnerable mouth hitbox

InstList_Kraid_Roar_1:
    dw $000A                                                             ;A796DA; Timer
    dw Tilemap_KraidHead_1                                               ;A796DC; Tilemap
    dw Hitbox_KraidMouth_1                                               ;A796DE; Vulnerable mouth hitbox
    dw Hitbox_KraidMouth_5                                               ;A796E0; Invulnerable mouth hitbox

InstList_Kraid_Roar_2:
    dw $000A                                                             ;A796E2; Timer
    dw Tilemap_KraidHead_2                                               ;A796E4; Tilemap
    dw Hitbox_KraidMouth_2                                               ;A796E6; Vulnerable mouth hitbox
    dw Hitbox_KraidMouth_6                                               ;A796E8; Invulnerable mouth hitbox

InstList_Kraid_Roar_3:
    dw Instruction_Kraid_PlayRoarSFX                                     ;A796EA;

InstList_Kraid_Roar_4:
    dw $0040                                                             ;A796EC; Timer
    dw Tilemap_KraidHead_3                                               ;A796EE; Tilemap
    dw Hitbox_KraidMouth_3                                               ;A796F0; Vulnerable mouth hitbox
    dw Hitbox_KraidMouth_7                                               ;A796F2; Invulnerable mouth hitbox

InstList_Kraid_Roar_5:
    dw $000A                                                             ;A796F4; Timer
    dw Tilemap_KraidHead_2                                               ;A796F6; Tilemap
    dw Hitbox_KraidMouth_2                                               ;A796F8; Vulnerable mouth hitbox
    dw Hitbox_KraidMouth_6                                               ;A796FA; Invulnerable mouth hitbox

InstList_Kraid_Roar_6:
    dw $000A                                                             ;A796FC; Timer
    dw Tilemap_KraidHead_1                                               ;A796FE; Tilemap
    dw Hitbox_KraidMouth_1                                               ;A79700; Vulnerable mouth hitbox
    dw Hitbox_KraidMouth_5                                               ;A79702; Invulnerable mouth hitbox

InstList_Kraid_Roar_7:
    dw $000A                                                             ;A79704; Timer
    dw Tilemap_KraidHead_0                                               ;A79706; Tilemap
    dw Hitbox_KraidMouth_0                                               ;A79708; Vulnerable mouth hitbox
    dw $FFFF                                                             ;A7970A; Invulnerable mouth hitbox

InstList_Kraid_Roar_8:
    dw $FFFF                                                             ;A7970C;


;;; $970E: Kraid instruction list - dying roar ;;;
InstList_Kraid_DyingRoar_0:
    dw $0014                                                             ;A7970E; Timer
    dw Tilemap_KraidHead_0                                               ;A79710; Tilemap
    dw Hitbox_KraidMouth_0                                               ;A79712; Vulnerable mouth hitbox
    dw $FFFF                                                             ;A79714; Invulnerable mouth hitbox

InstList_Kraid_DyingRoar_1:
    dw $0014                                                             ;A79716; Timer
    dw Tilemap_KraidHead_1                                               ;A79718; Tilemap
    dw Hitbox_KraidMouth_1                                               ;A7971A; Vulnerable mouth hitbox
    dw Hitbox_KraidMouth_5                                               ;A7971C; Invulnerable mouth hitbox
    dw $0014                                                             ;A7971E; Timer
    dw Tilemap_KraidHead_2                                               ;A79720; Tilemap
    dw Hitbox_KraidMouth_2                                               ;A79722; Vulnerable mouth hitbox
    dw Hitbox_KraidMouth_6                                               ;A79724; Invulnerable mouth hitbox
    dw Instruction_Kraid_PlayRoarSFX                                     ;A79726;
    dw $00C0                                                             ;A79728; Timer
    dw Tilemap_KraidHead_3                                               ;A7972A; Tilemap
    dw Hitbox_KraidMouth_3                                               ;A7972C; Vulnerable mouth hitbox
    dw Hitbox_KraidMouth_7                                               ;A7972E; Invulnerable mouth hitbox
    dw $0014                                                             ;A79730; Timer
    dw Tilemap_KraidHead_2                                               ;A79732; Tilemap
    dw Hitbox_KraidMouth_2                                               ;A79734; Vulnerable mouth hitbox
    dw Hitbox_KraidMouth_6                                               ;A79736; Invulnerable mouth hitbox
    dw $0014                                                             ;A79738; Timer
    dw Tilemap_KraidHead_1                                               ;A7973A; Tilemap
    dw Hitbox_KraidMouth_1                                               ;A7973C; Vulnerable mouth hitbox
    dw Hitbox_KraidMouth_5                                               ;A7973E; Invulnerable mouth hitbox
    dw $0014                                                             ;A79740; Timer
    dw Tilemap_KraidHead_0                                               ;A79742; Tilemap
    dw Hitbox_KraidMouth_0                                               ;A79744; Vulnerable mouth hitbox
    dw $FFFF                                                             ;A79746; Invulnerable mouth hitbox
    dw $FFFF                                                             ;A79748;


;;; $974A: Kraid instruction list - eye glowing ;;;
InstList_Kraid_EyeGlowing_0:
    dw $0005                                                             ;A7974A; Timer
    dw Tilemap_KraidHead_0                                               ;A7974C; Tilemap
    dw Hitbox_KraidMouth_0                                               ;A7974E; Vulnerable mouth hitbox
    dw $FFFF                                                             ;A79750; Invulnerable mouth hitbox

InstList_Kraid_EyeGlowing_1:
    dw $000A                                                             ;A79752; Timer
    dw Tilemap_KraidHead_1                                               ;A79754; Tilemap
    dw Hitbox_KraidMouth_1                                               ;A79756; Vulnerable mouth hitbox
    dw Hitbox_KraidMouth_5                                               ;A79758; Invulnerable mouth hitbox
    dw $0005                                                             ;A7975A; Timer
    dw Tilemap_KraidHead_0                                               ;A7975C; Tilemap
    dw Hitbox_KraidMouth_0                                               ;A7975E; Vulnerable mouth hitbox
    dw $FFFF                                                             ;A79760; Invulnerable mouth hitbox
    dw $FFFF                                                             ;A79762;


;;; $9764: Kraid instruction list - dying ;;;
InstList_Kraid_Dying_0:
    dw $0019                                                             ;A79764; Timer
    dw Tilemap_KraidHead_0                                               ;A79766; Tilemap
    dw Hitbox_KraidMouth_0                                               ;A79768; Vulnerable mouth hitbox
    dw $FFFF                                                             ;A7976A; Invulnerable mouth hitbox

InstList_Kraid_Dying_1:
    dw $0019                                                             ;A7976C; Timer
    dw Tilemap_KraidHead_1                                               ;A7976E; Tilemap
    dw Hitbox_KraidMouth_1                                               ;A79770; Vulnerable mouth hitbox
    dw Hitbox_KraidMouth_5                                               ;A79772; Invulnerable mouth hitbox
    dw $0019                                                             ;A79774; Timer
    dw Tilemap_KraidHead_2                                               ;A79776; Tilemap
    dw Hitbox_KraidMouth_2                                               ;A79778; Vulnerable mouth hitbox
    dw Hitbox_KraidMouth_6                                               ;A7977A; Invulnerable mouth hitbox
    dw Instruction_Kraid_PlayDyingSFX                                    ;A7977C;
    dw $0040                                                             ;A7977E; Timer
    dw Tilemap_KraidHead_3                                               ;A79780; Tilemap
    dw Hitbox_KraidMouth_3                                               ;A79782; Vulnerable mouth hitbox
    dw Hitbox_KraidMouth_7                                               ;A79784; Invulnerable mouth hitbox
    dw $FFFF                                                             ;A79786;


;;; $9788: Kraid mouth hitboxes ;;;
;        _____________________ Left
;       |      _______________ Top
;       |     |      _________ Right
;       |     |     |      ___ Bottom
;       |     |     |     |
Hitbox_KraidMouth_0:
    dw $0010,$FF88,$0028,$FFA8                                           ;A79788;

Hitbox_KraidMouth_1:
    dw $0010,$FF88,$0028,$FF98                                           ;A79790;

Hitbox_KraidMouth_2:
    dw $0010,$FF80,$0028,$FF90                                           ;A79798;

Hitbox_KraidMouth_3:
    dw $0010,$FF80,$0028,$FF88                                           ;A797A0;

Hitbox_KraidMouth_4:
    dw $0000,$0000,$0000,$0000                                           ;A797A8; <-- Unused

Hitbox_KraidMouth_5:
    dw $0006,$FFA0,$0020,$FFB0                                           ;A797B0;

Hitbox_KraidMouth_6:
    dw $0000,$FF98,$0020,$FFB0                                           ;A797B8;

Hitbox_KraidMouth_7:
    dw $0000,$FF90,$0020,$FFB0                                           ;A797C0;


;;; $97C8: Kraid head tilemaps ;;;
; The last row of each of these tilemaps isn't actually drawn
Tilemap_KraidHead_0:
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338                   ;A797C8;
    dw $0338,$0338,$0338,$0338,$3C00,$3C01,$3C02,$3C03                   ;A797D8;
    dw $3C04,$3C05,$0338,$0338,$0338,$0338,$0338,$0338                   ;A797E8;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338                   ;A797F8;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338                   ;A79808;
    dw $0338,$0338,$3C06,$3C07,$3C08,$3C09,$3C0A,$3C0B                   ;A79818;
    dw $3C0C,$3C0D,$3C0E,$0338,$0338,$0338,$0338,$0338                   ;A79828;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338                   ;A79838;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338                   ;A79848;
    dw $0338,$0338,$3C0F,$3C10,$3C11,$3C12,$3C13,$3C14                   ;A79858;
    dw $3C15,$3C16,$3C17,$0338,$0338,$0338,$0338,$0338                   ;A79868;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338                   ;A79878;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338                   ;A79888;
    dw $0338,$3C18,$3C19,$3C1A,$3C1B,$3C1C,$3C1D,$3C1E                   ;A79898;
    dw $3C1F,$3C20,$3C21,$0338,$0338,$0338,$0338,$0338                   ;A798A8;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338                   ;A798B8;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338                   ;A798C8;
    dw $0338,$3C22,$3C23,$3C24,$3C25,$3C26,$3C27,$3C28                   ;A798D8;
    dw $3C29,$3C2A,$0338,$0338,$0338,$0338,$0338,$0338                   ;A798E8;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338                   ;A798F8;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338                   ;A79908;
    dw $3C2B,$3C2C,$3C2D,$3C2E,$3C2F,$3C30,$3C31,$3C32                   ;A79918;
    dw $3C33,$0338,$0338,$0338,$0338,$0338,$0338,$0338                   ;A79928;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338                   ;A79938;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338                   ;A79948;
    dw $0338,$3C34,$3C35,$3C36,$3C37,$3C38,$3C39,$3C3A                   ;A79958;
    dw $3C3B,$0338,$0338,$0338,$0338,$0338,$0338,$0338                   ;A79968;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338                   ;A79978;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$3C3C                   ;A79988;
    dw $3C3D,$3C3E,$3C3F,$3C40,$3C41,$3C42,$3C43,$3C44                   ;A79998;
    dw $3C45,$3C46,$0338,$0338,$0338,$0338,$0338,$0338                   ;A799A8;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338                   ;A799B8;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$3C47                   ;A799C8;
    dw $3C48,$3C49,$3C4A,$3C4B,$3C4C,$3C4D,$3C4E,$3C4F                   ;A799D8;
    dw $3C50,$3C51,$3C52,$0338,$0338,$0338,$0338,$0338                   ;A799E8;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338                   ;A799F8;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$3C53                   ;A79A08;
    dw $3C54,$3C55,$3C56,$3C57,$3C58,$3C59,$3C5A,$3C5B                   ;A79A18;
    dw $3C5C,$3C5D,$3C5E,$0338,$0338,$0338,$0338,$0338                   ;A79A28;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338                   ;A79A38;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$3C5F                   ;A79A48;
    dw $3C60,$3C61,$3D50,$3D50,$3C62,$3C63,$3C64,$3C65                   ;A79A58;
    dw $3C66,$3C67,$3C68,$0338,$0338,$0338,$0338,$0338                   ;A79A68;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338                   ;A79A78;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$3C69,$3C6A                   ;A79A88;
    dw $3D50,$3D50,$3D50,$3C6B,$3C6C,$3C6D,$3C6E,$3C6F                   ;A79A98;
    dw $3C70,$3C71,$3C72,$0338,$0338,$0338,$0338,$0338                   ;A79AA8;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338                   ;A79AB8;

Tilemap_KraidHead_1:
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338                   ;A79AC8;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338                   ;A79AD8;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338                   ;A79AE8;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338                   ;A79AF8;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338                   ;A79B08;
    dw $0338,$0338,$0338,$0338,$3C73,$3C74,$3C75,$3C76                   ;A79B18;
    dw $3C77,$0338,$0338,$0338,$0338,$0338,$0338,$0338                   ;A79B28;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338                   ;A79B38;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338                   ;A79B48;
    dw $0338,$0338,$0338,$3C78,$3C79,$3C7A,$3C7B,$3C7C                   ;A79B58;
    dw $3C7D,$3C7E,$3C7F,$0338,$0338,$0338,$0338,$0338                   ;A79B68;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338                   ;A79B78;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338                   ;A79B88;
    dw $0338,$0338,$3C80,$3C81,$3C82,$3C83,$3C84,$3C85                   ;A79B98;
    dw $3C86,$3C87,$3C88,$3C89,$0338,$0338,$0338,$0338                   ;A79BA8;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338                   ;A79BB8;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338                   ;A79BC8;
    dw $0338,$3C8A,$3C8B,$3C8C,$3C8D,$3C8E,$3C8F,$3C90                   ;A79BD8;
    dw $3C91,$3C92,$3C93,$3C94,$0338,$0338,$0338,$0338                   ;A79BE8;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338                   ;A79BF8;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$3C95                   ;A79C08;
    dw $0338,$3C96,$3C97,$3C98,$3C99,$3C9A,$3C9B,$3C9C                   ;A79C18;
    dw $3C9D,$3C9E,$3C9F,$3CA0,$0338,$0338,$0338,$0338                   ;A79C28;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338                   ;A79C38;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$3CA1                   ;A79C48;
    dw $3CA2,$3CA3,$3CA4,$3CA5,$3CA6,$3CA7,$3CA8,$3CA9                   ;A79C58;
    dw $3CAA,$3CAB,$3CAC,$3CAD,$0338,$0338,$0338,$0338                   ;A79C68;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338                   ;A79C78;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$3CAE                   ;A79C88;
    dw $3CAF,$3CB0,$3CB1,$3CB2,$3CB3,$3CB4,$3C43,$3C44                   ;A79C98;
    dw $3C45,$3C46,$0338,$0338,$0338,$0338,$0338,$0338                   ;A79CA8;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338                   ;A79CB8;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338                   ;A79CC8;
    dw $3CB5,$3CB6,$3CB7,$3CB8,$3C4C,$3C4D,$3C4E,$3C4F                   ;A79CD8;
    dw $3C50,$3C51,$3C52,$0338,$0338,$0338,$0338,$0338                   ;A79CE8;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338                   ;A79CF8;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$3CB9                   ;A79D08;
    dw $3CBA,$3CBB,$3C56,$3C57,$3C58,$3C59,$3C5A,$3C5B                   ;A79D18;
    dw $3C5C,$3C5D,$3C5E,$0338,$0338,$0338,$0338,$0338                   ;A79D28;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338                   ;A79D38;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$3C5F                   ;A79D48;
    dw $3C60,$3C61,$3D50,$3D50,$3C62,$3C63,$3C64,$3C65                   ;A79D58;
    dw $3C66,$3C67,$3C68,$0338,$0338,$0338,$0338,$0338                   ;A79D68;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338                   ;A79D78;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$3C69,$3C6A                   ;A79D88;
    dw $3D50,$3D50,$3D50,$3C6B,$3C6C,$3C6D,$3C6E,$3C6F                   ;A79D98;
    dw $3C70,$3C71,$3C72,$0338,$0338,$0338,$0338,$0338                   ;A79DA8;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338                   ;A79DB8;

Tilemap_KraidHead_2:
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338                   ;A79DC8;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338                   ;A79DD8;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338                   ;A79DE8;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338                   ;A79DF8;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338                   ;A79E08;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$3CBC,$0338                   ;A79E18;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338                   ;A79E28;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338                   ;A79E38;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338                   ;A79E48;
    dw $0338,$0338,$0338,$0338,$3CBD,$3CBE,$3CBF,$3CC0                   ;A79E58;
    dw $3CC1,$0338,$0338,$0338,$0338,$0338,$0338,$0338                   ;A79E68;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338                   ;A79E78;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338                   ;A79E88;
    dw $0338,$0338,$3CC2,$3CC3,$3CC4,$3CC5,$3CC6,$3CC7                   ;A79E98;
    dw $3CC8,$3CC9,$3CCA,$0338,$0338,$0338,$0338,$0338                   ;A79EA8;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338                   ;A79EB8;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338                   ;A79EC8;
    dw $3CCB,$3CCC,$3CCD,$3CCE,$3CCF,$3CD0,$3CD1,$3CD2                   ;A79ED8;
    dw $3CD3,$3CD4,$3D43,$0338,$0338,$0338,$0338,$0338                   ;A79EE8;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338                   ;A79EF8;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$3CD5                   ;A79F08;
    dw $3CD6,$3CD7,$3CD8,$3CD9,$3CDA,$3CDB,$3CDC,$3CDD                   ;A79F18;
    dw $3CDE,$3CDF,$3CE0,$3CE1,$0338,$0338,$0338,$0338                   ;A79F28;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338                   ;A79F38;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$3CE2                   ;A79F48;
    dw $3CE3,$3CE4,$3CE5,$3CE6,$3CE7,$3CE8,$3CE9,$3CEA                   ;A79F58;
    dw $3CEB,$3CEC,$3CED,$3CEE,$3CEF,$0338,$0338,$0338                   ;A79F68;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338                   ;A79F78;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338                   ;A79F88;
    dw $0338,$0338,$3CF0,$3CF1,$3CF2,$3CF3,$3CF4,$3CF5                   ;A79F98;
    dw $3CF6,$3CF7,$3CF8,$3CF9,$3CFA,$0338,$0338,$0338                   ;A79FA8;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338                   ;A79FB8;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338                   ;A79FC8;
    dw $3CFB,$3CFC,$3CB7,$3CFD,$3CFE,$3C4D,$3C4E,$3C4F                   ;A79FD8;
    dw $3C50,$3C51,$3CFF,$3D00,$3D44,$0338,$0338,$0338                   ;A79FE8;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338                   ;A79FF8;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$3CB9                   ;A7A008;
    dw $3CBA,$3CBB,$3C56,$3C57,$3C58,$3C59,$3C5A,$3C5B                   ;A7A018;
    dw $3C5C,$3C5D,$3C5E,$0338,$0338,$0338,$0338,$0338                   ;A7A028;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338                   ;A7A038;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$3C5F                   ;A7A048;
    dw $3C60,$3C61,$3D50,$3D50,$3C62,$3C63,$3C64,$3C65                   ;A7A058;
    dw $3C66,$3C67,$3C68,$0338,$0338,$0338,$0338,$0338                   ;A7A068;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338                   ;A7A078;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$3C69,$3C6A                   ;A7A088;
    dw $3D50,$3D50,$3D50,$3C6B,$3C6C,$3C6D,$3C6E,$3C6F                   ;A7A098;
    dw $3C70,$3C71,$3C72,$0338,$0338,$0338,$0338,$0338                   ;A7A0A8;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338                   ;A7A0B8;

Tilemap_KraidHead_3:
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338                   ;A7A0C8;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338                   ;A7A0D8;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338                   ;A7A0E8;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338                   ;A7A0F8;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338                   ;A7A108;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338                   ;A7A118;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338                   ;A7A128;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338                   ;A7A138;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338                   ;A7A148;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338                   ;A7A158;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338                   ;A7A168;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338                   ;A7A178;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338                   ;A7A188;
    dw $3D01,$3D02,$0338,$3D03,$3D04,$3D05,$3D06,$3D07                   ;A7A198;
    dw $3D08,$0338,$0338,$0338,$0338,$0338,$0338,$0338                   ;A7A1A8;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338                   ;A7A1B8;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338                   ;A7A1C8;
    dw $3D09,$3D0A,$3D0B,$3D0C,$3D0D,$3D0E,$3D0F,$3D10                   ;A7A1D8;
    dw $3D11,$3D12,$0338,$0338,$0338,$0338,$0338,$0338                   ;A7A1E8;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338                   ;A7A1F8;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338                   ;A7A208;
    dw $3D13,$3D14,$3D15,$3D16,$3D17,$3D18,$3D19,$3D1A                   ;A7A218;
    dw $3D1B,$3D1C,$0338,$0338,$0338,$0338,$0338,$0338                   ;A7A228;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338                   ;A7A238;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338                   ;A7A248;
    dw $0338,$0338,$3D1D,$3D1E,$3D1F,$3D20,$3D21,$3D22                   ;A7A258;
    dw $3D23,$3D24,$3D25,$0338,$0338,$0338,$0338,$0338                   ;A7A268;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338                   ;A7A278;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338                   ;A7A288;
    dw $0338,$0338,$3D26,$3D27,$3D28,$3D29,$3D2A,$3D2B                   ;A7A298;
    dw $3D2C,$3D2D,$3D2E,$0338,$0338,$0338,$0338,$0338                   ;A7A2A8;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338                   ;A7A2B8;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338                   ;A7A2C8;
    dw $3D2F,$3D30,$3CB7,$3D31,$3D32,$3D33,$3D34,$3D35                   ;A7A2D8;
    dw $3D36,$3C51,$3D37,$3D38,$0338,$0338,$0338,$0338                   ;A7A2E8;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338                   ;A7A2F8;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$3CB9                   ;A7A308;
    dw $3CBA,$3CBB,$3C56,$3C57,$3C58,$3C59,$3D39,$3D3A                   ;A7A318;
    dw $3D3B,$3D3C,$3D3D,$3D3E,$0338,$0338,$0338,$0338                   ;A7A328;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338                   ;A7A338;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$3C5F                   ;A7A348;
    dw $3C60,$3C61,$3D50,$3D50,$3C62,$3C63,$3C64,$3C65                   ;A7A358;
    dw $3C66,$3D3F,$3D40,$3D41,$0338,$0338,$0338,$0338                   ;A7A368;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338                   ;A7A378;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$3C69,$3C6A                   ;A7A388;
    dw $3D50,$3D50,$3D50,$3C6B,$3C6C,$3C6D,$3C6E,$3C6F                   ;A7A398;
    dw $3C70,$3C71,$3D42,$0338,$0338,$0338,$0338,$0338                   ;A7A3A8;
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338                   ;A7A3B8;


;;; $A3C8: Unused. Extended spritemaps - Kraid arm ;;;
if !FEATURE_KEEP_UNREFERENCED
UNUSED_ExtendedSpritemap_KraidArm_A7A3C8:
    dw $0002                                                             ;A7A3C8;
    dw $0000,$0000
    dw Spritemap_KraidArm_RisingSinking_A                                ;A7A3CE;
    dw Hitbox_KraidArm_F                                                 ;A7A3D0;
    dw $FFF7,$FFF6                                                       ;A7A3D2;
    dw Spritemap_KraidArm_RisingSinking_0                                ;A7A3D6;
    dw Hitbox_KraidArm_0                                                 ;A7A3D8;

UNUSED_ExtendedSpritemap_KraidArm_A7A3DA:
    dw $0002                                                             ;A7A3DA;
    dw $FFF9,$FFF8
    dw Spritemap_KraidArm_RisingSinking_1                                ;A7A3E0;
    dw Hitbox_KraidArm_1                                                 ;A7A3E2;
    dw $0001,$0000                                                       ;A7A3E4;
    dw Spritemap_KraidArm_RisingSinking_A                                ;A7A3E8;
    dw Hitbox_KraidArm_F                                                 ;A7A3EA;

UNUSED_ExtendedSpritemap_KraidArm_A7A3EC:
    dw $0002                                                             ;A7A3EC;
    dw $FFF6,$0001
    dw Spritemap_KraidArm_RisingSinking_1                                ;A7A3F2;
    dw Hitbox_KraidArm_1                                                 ;A7A3F4;
    dw $0000,$0000                                                       ;A7A3F6;
    dw Spritemap_KraidArm_RisingSinking_7                                ;A7A3FA;
    dw Hitbox_KraidArm_8                                                 ;A7A3FC;

UNUSED_ExtendedSpritemap_KraidArm_A7A3FE:
    dw $0002                                                             ;A7A3FE;
    dw $FFF6,$0000
    dw Spritemap_KraidArm_RisingSinking_2                                ;A7A404;
    dw Hitbox_KraidArm_2                                                 ;A7A406;
    dw $0000,$0000                                                       ;A7A408;
    dw Spritemap_KraidArm_RisingSinking_7                                ;A7A40C;
    dw Hitbox_KraidArm_8                                                 ;A7A40E;

UNUSED_ExtendedSpritemap_KraidArm_A7A410:
    dw $0002                                                             ;A7A410;
    dw $FFF6,$0000
    dw Spritemap_KraidArm_RisingSinking_3                                ;A7A416;
    dw Hitbox_KraidArm_3                                                 ;A7A418;
    dw $0000,$0000                                                       ;A7A41A;
    dw Spritemap_KraidArm_RisingSinking_7                                ;A7A41E;
    dw Hitbox_KraidArm_8                                                 ;A7A420;

UNUSED_ExtendedSpritemap_KraidArm_A7A422:
    dw $0002                                                             ;A7A422;
    dw $FFFA,$0006
    dw Spritemap_KraidArm_RisingSinking_3                                ;A7A428;
    dw Hitbox_KraidArm_3                                                 ;A7A42A;
    dw $0000,$0000                                                       ;A7A42C;
    dw Spritemap_KraidArm_RisingSinking_8                                ;A7A430;
    dw Hitbox_KraidArm_9                                                 ;A7A432;

UNUSED_ExtendedSpritemap_KraidArm_A7A434:
    dw $0002                                                             ;A7A434;
    dw $FFF8,$0006
    dw Spritemap_KraidArm_RisingSinking_4                                ;A7A43A;
    dw Hitbox_KraidArm_4                                                 ;A7A43C;
    dw $0000,$0000                                                       ;A7A43E;
    dw Spritemap_KraidArm_RisingSinking_8                                ;A7A442;
    dw Hitbox_KraidArm_9                                                 ;A7A444;

UNUSED_ExtendedSpritemap_KraidArm_A7A446:
    dw $0002                                                             ;A7A446;
    dw $FFF8,$0006
    dw Spritemap_KraidArm_RisingSinking_5                                ;A7A44C;
    dw Hitbox_KraidArm_5                                                 ;A7A44E;
    dw $0000,$0000                                                       ;A7A450;
    dw Spritemap_KraidArm_RisingSinking_8                                ;A7A454;
    dw Hitbox_KraidArm_9                                                 ;A7A456;

UNUSED_ExtendedSpritemap_KraidArm_A7A458:
    dw $0002                                                             ;A7A458;
    dw $FFFF,$000C
    dw Spritemap_KraidArm_RisingSinking_5                                ;A7A45E;
    dw Hitbox_KraidArm_5                                                 ;A7A460;
    dw $0000,$0000                                                       ;A7A462;
    dw Spritemap_KraidArm_RisingSinking_9                                ;A7A466;
    dw Hitbox_KraidArm_A                                                 ;A7A468;

UNUSED_ExtendedSpritemap_KraidArm_A7A46A:
    dw $0002                                                             ;A7A46A;
    dw $0000,$000B
    dw Spritemap_KraidArm_RisingSinking_6                                ;A7A470;
    dw Hitbox_KraidArm_6                                                 ;A7A472;
    dw $0000,$0000                                                       ;A7A474;
    dw Spritemap_KraidArm_RisingSinking_9                                ;A7A478;
    dw Hitbox_KraidArm_A                                                 ;A7A47A;
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $A47C: Spritemaps - Kraid arm - rising/sinking ;;;
Spritemap_KraidArm_RisingSinking_0:
    dw $0001                                                             ;A7A47C;
    %spritemapEntry(1, $1F2, $F4, 0, 0, 2, 0, $126)

Spritemap_KraidArm_RisingSinking_1:
    dw $0002                                                             ;A7A483;
    %spritemapEntry(0, $1F9, $FB, 0, 0, 2, 0, $129)
    %spritemapEntry(0, $1F1, $FB, 0, 0, 2, 0, $128)

Spritemap_KraidArm_RisingSinking_2:
    dw $0001                                                             ;A7A48F;
    %spritemapEntry(1, $1F2, $FD, 0, 0, 2, 0, $12A)

Spritemap_KraidArm_RisingSinking_3:
    dw $0002                                                             ;A7A496;
    %spritemapEntry(0, $1FA, $07, 0, 0, 2, 0, $139)
    %spritemapEntry(0, $1FA, $FF, 0, 0, 2, 0, $138)

Spritemap_KraidArm_RisingSinking_4:
    dw $0001                                                             ;A7A4A2;
    %spritemapEntry(1, $1FD, $FD, 1, 1, 2, 0, $126)

Spritemap_KraidArm_RisingSinking_5:
    dw $0002                                                             ;A7A4A9;
    %spritemapEntry(0, $1FF, $FD, 1, 1, 2, 0, $129)
    %spritemapEntry(0, $07, $FD, 1, 1, 2, 0, $128)

Spritemap_KraidArm_RisingSinking_6:
    dw $0001                                                             ;A7A4B5;
    %spritemapEntry(1, $1FD, $F4, 1, 1, 2, 0, $12A)

Spritemap_KraidArm_RisingSinking_7:
    dw $0002                                                             ;A7A4BC;
    %spritemapEntry(0, $1FA, $FC, 1, 1, 2, 0, $12E)
    %spritemapEntry(0, $1F2, $FC, 1, 0, 2, 0, $12E)

Spritemap_KraidArm_RisingSinking_8:
    dw $0001                                                             ;A7A4C8;
    %spritemapEntry(1, $1F4, $FC, 1, 0, 2, 0, $12C)

Spritemap_KraidArm_RisingSinking_9:
    dw $0002                                                             ;A7A4CF;
    %spritemapEntry(0, $1FC, $06, 1, 0, 2, 0, $13E)
    %spritemapEntry(0, $1FC, $FE, 0, 0, 2, 0, $13E)

Spritemap_KraidArm_RisingSinking_A:
    dw $0001                                                             ;A7A4DB;
    %spritemapEntry(1, $1F4, $F4, 0, 0, 2, 0, $12C)


;;; $A4E2: Unused. Extended spritemaps - Kraid arm ;;;
UNUSED_ExtendedSpritemap_KraidArm_A7A4E2:
    dw $0001                                                             ;A7A4E2;
    dw $0000,$0000
    dw Spritemap_KraidArm_RisingSinking_D                                ;A7A4E8;
    dw Hitbox_KraidArm_12                                                ;A7A4EA;

UNUSED_ExtendedSpritemap_KraidArm_A7A4EC:
    dw $0001                                                             ;A7A4EC;
    dw $0000,$0000
    dw Spritemap_KraidArm_RisingSinking_C                                ;A7A4F2;
    dw Hitbox_KraidArm_11                                                ;A7A4F4;

UNUSED_ExtendedSpritemap_KraidArm_A7A4F6:
    dw $0001                                                             ;A7A4F6;
    dw $0000,$0000
    dw Spritemap_KraidArm_RisingSinking_B                                ;A7A4FC;
    dw Hitbox_KraidArm_10                                                ;A7A4FE;


;;; $A500: Spritemaps - Kraid arm - rising/sinking ;;;
Spritemap_KraidArm_RisingSinking_B:
    dw $0003                                                             ;A7A500;
    %spritemapEntry(1, $1F4, $F8, 0, 0, 2, 0, $104)
    %spritemapEntry(1, $1E4, $F8, 0, 0, 2, 0, $102)
    %spritemapEntry(1, $1D4, $F8, 0, 0, 2, 0, $100)

Spritemap_KraidArm_RisingSinking_C:
    dw $0008                                                             ;A7A511;
    %spritemapEntry(0, $1EC, $00, 0, 0, 2, 0, $11C)
    %spritemapEntry(0, $1FC, $F0, 0, 0, 2, 0, $10F)
    %spritemapEntry(0, $1F4, $F0, 0, 0, 2, 0, $10E)
    %spritemapEntry(0, $1E4, $E8, 0, 0, 2, 0, $10D)
    %spritemapEntry(0, $1DC, $F8, 0, 0, 2, 0, $10C)
    %spritemapEntry(1, $1F4, $F8, 0, 0, 2, 0, $10A)
    %spritemapEntry(1, $1E4, $F0, 0, 0, 2, 0, $108)
    %spritemapEntry(1, $1D4, $E8, 0, 0, 2, 0, $106)

Spritemap_KraidArm_RisingSinking_D:
    dw $0008                                                             ;A7A53B;
    %spritemapEntry(0, $1FC, $ED, 0, 0, 2, 0, $13F)
    %spritemapEntry(0, $1EC, $FD, 0, 0, 2, 0, $12F)
    %spritemapEntry(0, $1EC, $F5, 0, 0, 2, 0, $11F)
    %spritemapEntry(0, $1EC, $DD, 0, 0, 2, 0, $11E)
    %spritemapEntry(0, $1E4, $ED, 0, 0, 2, 0, $11D)
    %spritemapEntry(1, $1F4, $F5, 0, 0, 2, 0, $124)
    %spritemapEntry(1, $1EC, $E5, 0, 0, 2, 0, $122)
    %spritemapEntry(1, $1DC, $DD, 0, 0, 2, 0, $120)


;;; $A565: Extended spritemap - Kraid foot - initial ;;;
ExtendedSpritemap_KraidFoot_Initial:
    dw $0002                                                             ;A7A565;
    dw $0008,$0028
    dw Spritemap_KraidFoot_6                                             ;A7A56B;
    dw Hitbox_KraidFoot                                                  ;A7A56D;
    dw $0000,$0000                                                       ;A7A56F;
    dw Spritemap_KraidFoot_5                                             ;A7A573;
    dw Hitbox_KraidFoot                                                  ;A7A575;


;;; $A577: Spritemaps - Kraid foot ;;;
Spritemap_KraidFoot_5:
    dw $0008                                                             ;A7A577;
    %spritemapEntry(1, $20, $1C, 0, 0, 2, 0, $15A)
    %spritemapEntry(1, $20, $14, 0, 0, 2, 0, $14A)
    %spritemapEntry(1, $10, $1C, 0, 0, 2, 0, $148)
    %spritemapEntry(0, $1F8, $0C, 0, 0, 2, 0, $14C)
    %spritemapEntry(1, $10, $0C, 0, 0, 2, 0, $146)
    %spritemapEntry(1, $00, $0C, 0, 0, 2, 0, $144)
    %spritemapEntry(1, $08, $FC, 0, 0, 2, 0, $142)
    %spritemapEntry(1, $1F8, $FC, 0, 0, 2, 0, $140)

Spritemap_KraidFoot_6:
    dw $000C                                                             ;A7A5A1;
    %spritemapEntry(0, $1D8, $F4, 0, 0, 2, 0, $1C3)
    %spritemapEntry(0, $18, $F4, 0, 0, 2, 0, $19A)
    %spritemapEntry(1, $00, $F4, 0, 0, 2, 0, $1C8)
    %spritemapEntry(1, $1F0, $F4, 0, 0, 2, 0, $1C6)
    %spritemapEntry(1, $1E0, $F4, 0, 0, 2, 0, $1C4)
    %spritemapEntry(1, $1D0, $FC, 0, 0, 2, 0, $1A7)
    %spritemapEntry(1, $20, $FC, 0, 0, 2, 0, $1AB)
    %spritemapEntry(1, $20, $F4, 0, 0, 2, 0, $19B)
    %spritemapEntry(1, $10, $FC, 0, 0, 2, 0, $1DA)
    %spritemapEntry(1, $00, $FC, 0, 0, 2, 0, $1D8)
    %spritemapEntry(1, $1F0, $FC, 0, 0, 2, 0, $1D6)
    %spritemapEntry(1, $1E0, $FC, 0, 0, 2, 0, $1D4)


;;; $A5DF: Spritemap - Kraid lint - initial ;;;
Spritemap_KraidLint_Initial:
    dw $0005                                                             ;A7A5DF;
    %spritemapEntry(0, $00, $08, 0, 0, 1, 0, $1C2)
    %spritemapEntry(1, $1F0, $00, 0, 0, 1, 0, $1B0)
    %spritemapEntry(1, $00, $F8, 0, 0, 1, 0, $1A2)
    %spritemapEntry(1, $1F0, $F8, 0, 0, 1, 0, $1A0)
    %spritemapEntry(1, $00, $08, 0, 0, 1, 0, $1A9)


;;; $A5FA: Unused. Spritemaps - Kraid lint ;;;
if !FEATURE_KEEP_UNREFERENCED
UNUSED_Spritemap_KraidLint_A7A5FA:
    dw $0004                                                             ;A7A5FA;
    %spritemapEntry(0, $00, $08, 0, 0, 1, 0, $1C2)
    %spritemapEntry(1, $1F0, $00, 0, 0, 1, 0, $1B0)
    %spritemapEntry(1, $00, $F8, 0, 0, 1, 0, $1A2)
    %spritemapEntry(1, $1F0, $F8, 0, 0, 1, 0, $1A0)

UNUSED_Spritemap_KraidLint_A7A610:
    dw $0001                                                             ;A7A610;
    %spritemapEntry(1, $1F8, $F8, 0, 0, 1, 0, $1A9)
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $A617: Spritemaps - Kraid fingernail ;;;
Spritemap_KraidNail_0:
    dw $0002                                                             ;A7A617;
    %spritemapEntry(1, $43F4, $F8, 0, 0, 2, 0, $12A)
    %spritemapEntry(1, $43FC, $F8, 0, 0, 2, 0, $12C)

Spritemap_KraidNail_1:
    dw $0004                                                             ;A7A623;
    %spritemapEntry(0, $1F9, $FB, 0, 0, 2, 0, $138)
    %spritemapEntry(0, $1F9, $03, 0, 0, 2, 0, $139)
    %spritemapEntry(0, $02, $F9, 0, 1, 2, 0, $12E)
    %spritemapEntry(0, $1FA, $F9, 0, 0, 2, 0, $12E)

Spritemap_KraidNail_2:
    dw $0002                                                             ;A7A639;
    %spritemapEntry(1, $43F9, $FB, 1, 1, 2, 0, $126)
    %spritemapEntry(1, $43F9, $F4, 0, 1, 2, 0, $12C)

Spritemap_KraidNail_3:
    dw $0004                                                             ;A7A645;
    %spritemapEntry(0, $1FC, $FF, 1, 1, 2, 0, $129)
    %spritemapEntry(0, $04, $FF, 1, 1, 2, 0, $128)
    %spritemapEntry(0, $1F9, $FE, 1, 1, 2, 0, $13E)
    %spritemapEntry(0, $1F9, $F6, 0, 1, 2, 0, $13E)

Spritemap_KraidNail_4:
    dw $0002                                                             ;A7A65B;
    %spritemapEntry(1, $43FC, $F8, 1, 1, 2, 0, $12A)
    %spritemapEntry(1, $43F4, $F8, 0, 0, 2, 0, $12C)

Spritemap_KraidNail_5:
    dw $0004                                                             ;A7A667;
    %spritemapEntry(0, $1FF, $FD, 1, 1, 2, 0, $138)
    %spritemapEntry(0, $1FF, $F5, 1, 1, 2, 0, $139)
    %spritemapEntry(0, $1FD, $FF, 1, 1, 2, 0, $12E)
    %spritemapEntry(0, $1F5, $FF, 1, 0, 2, 0, $12E)

Spritemap_KraidNail_6:
    dw $0002                                                             ;A7A67D;
    %spritemapEntry(1, $43F7, $F4, 0, 0, 2, 0, $126)
    %spritemapEntry(1, $43F7, $FC, 1, 0, 2, 0, $12C)

Spritemap_KraidNail_7:
    dw $0004                                                             ;A7A689;
    %spritemapEntry(0, $1FD, $F9, 0, 0, 2, 0, $129)
    %spritemapEntry(0, $1F5, $F9, 0, 0, 2, 0, $128)
    %spritemapEntry(0, $1FF, $03, 1, 0, 2, 0, $13E)
    %spritemapEntry(0, $1FF, $FB, 0, 0, 2, 0, $13E)


;;; $A69F: Spritemaps - Kraid arm - dying / preparing to lunge ;;;
Spritemap_KraidArm_Dying_PreparingToLunge_0:
    dw $000C                                                             ;A7A69F;
    %spritemapEntry(1, $43C1, $D8, 0, 0, 3, 1, $126)
    %spritemapEntry(1, $43CE, $E3, 0, 0, 3, 1, $12C)
    %spritemapEntry(1, $43C2, $D2, 0, 0, 3, 1, $126)
    %spritemapEntry(1, $43CF, $DD, 0, 0, 3, 1, $12C)
    %spritemapEntry(0, $1FF, $EF, 0, 0, 3, 1, $10F)
    %spritemapEntry(0, $1F7, $EF, 0, 0, 3, 1, $10E)
    %spritemapEntry(0, $1EF, $FF, 0, 0, 3, 1, $11C)
    %spritemapEntry(0, $1DF, $F7, 0, 0, 3, 1, $10C)
    %spritemapEntry(0, $1E7, $E7, 0, 0, 3, 1, $10D)
    %spritemapEntry(1, $43F7, $F7, 0, 0, 3, 1, $10A)
    %spritemapEntry(1, $43E7, $EF, 0, 0, 3, 1, $108)
    %spritemapEntry(1, $43D7, $E7, 0, 0, 3, 1, $106)

Spritemap_KraidArm_Dying_PreparingToLunge_1:
    dw $000B                                                             ;A7A6DD;
    %spritemapEntry(0, $1BD, $FE, 0, 0, 3, 1, $128)
    %spritemapEntry(0, $1C5, $FE, 0, 0, 3, 1, $129)
    %spritemapEntry(0, $1D4, $FE, 0, 1, 3, 1, $12E)
    %spritemapEntry(0, $1CC, $FE, 0, 0, 3, 1, $12E)
    %spritemapEntry(0, $1B9, $F9, 0, 0, 3, 1, $128)
    %spritemapEntry(0, $1C1, $F9, 0, 0, 3, 1, $129)
    %spritemapEntry(0, $1D0, $F9, 0, 1, 3, 1, $12E)
    %spritemapEntry(0, $1C8, $F9, 0, 0, 3, 1, $12E)
    %spritemapEntry(1, $43F4, $F8, 0, 0, 3, 1, $104)
    %spritemapEntry(1, $43E4, $F8, 0, 0, 3, 1, $102)
    %spritemapEntry(1, $43D4, $F8, 0, 0, 3, 1, $100)


;;; $A716: Kraid's room background ;;;
Tiles_KraidRoomBackground:
incbin "../data/Tiles_KraidRoomBackground.bin"


;;; $A916: Kraid constants ;;;
KraidLint_InitialFunctionTimers:
  .top:
    dw $0120                                                             ;A7A916;
  .middle:
    dw $00A0                                                             ;A7A918;
  .bottom:
    dw $0040                                                             ;A7A91A;

KraidForwardsSpeed:
    dw $0003                                                             ;A7A91C;

if !FEATURE_KEEP_UNREFERENCED
UNUSED_KraidConstant_A7A91E:
    dw $0005                                                             ;A7A91E;
endif ; !FEATURE_KEEP_UNREFERENCED

KraidBackwardsSpeed:
    dw $0003                                                             ;A7A920;

if !FEATURE_KEEP_UNREFERENCED
UNUSED_KraidBackwardsFastSpeed_A7A922:
    dw $0004                                                             ;A7A922;

UNUSED_KraidConstant_A7A924:
    dw $0110                                                             ;A7A924;
endif ; !FEATURE_KEEP_UNREFERENCED

KraidLint:
  .XSubSpeed:
    dw $8000                                                             ;A7A926;
  .XSpeed:
    dw $0003                                                             ;A7A928;


if !FEATURE_KEEP_UNREFERENCED
;;; $A92A: Unused. REP #$30 ;;;
UNUSED_REP30_A7A92A:
    REP #$30                                                             ;A7A92A;
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $A92C: Check if Kraid has died ;;;
CheckIfKraidHasDied:
;; Returns:
;;     A: 0 if Kraid is alive, 1 if Kraid is dead
    PHX                                                                  ;A7A92C;
    LDX.W AreaIndex                                                      ;A7A92D;
    LDA.L SRAMMirror_Boss,X                                              ;A7A930;
    BIT.W #$0001                                                         ;A7A934;
    BEQ .returnAlive                                                     ;A7A937;
    PLX                                                                  ;A7A939;
    LDA.W #$0001                                                         ;A7A93A;
    RTS                                                                  ;A7A93D;

  .returnAlive:
    PLX                                                                  ;A7A93E;
    LDA.W #$0000                                                         ;A7A93F;
    RTS                                                                  ;A7A942;


;;; $A943: Set enemy properties to dead ;;;
SetEnemyPropertiesToDead:
; Set enemy as intangible, flagged for deletion, invisible,
; not processed off-screen, not processing instructions and non-solid hitbox
    LDX.W EnemyIndex                                                     ;A7A943;
    LDA.W Enemy.properties,X                                             ;A7A946;
    ORA.W #$0700                                                         ;A7A949;
    AND.W #$F7FF                                                         ;A7A94C; >.< $57FF
    AND.W #$DFFF                                                         ;A7A94F;
    AND.W #$7FFF                                                         ;A7A952;
    STA.W Enemy.properties,X                                             ;A7A955;
    RTS                                                                  ;A7A958;


;;; $A959: Initialisation AI - enemy $E2BF (Kraid) ;;;
InitAI_Kraid:
; Note that BG1 tiles base address = (DP_BGTilesAddr & Fh) * 1000h, whereas this routine is using (DP_BGTilesAddr & Fh) * 100h,
; i.e. this routine only works because BG1 tiles base address = $0000
    SEP #$20                                                             ;A7A959;
    LDA.B #UnpauseHook_KraidIsAlive>>16                                  ;A7A95B;
    STA.W PauseHook_Unpause+2                                            ;A7A95D;
    LDA.B #PauseHook_Kraid>>16                                           ;A7A960;
    STA.W PauseHook_Pause+2                                              ;A7A962;
    REP #$20                                                             ;A7A965;
    LDA.W #UnpauseHook_KraidIsAlive                                      ;A7A967;
    STA.W PauseHook_Unpause                                              ;A7A96A;
    LDA.W #PauseHook_Kraid                                               ;A7A96D;
    STA.W PauseHook_Pause                                                ;A7A970;
    JSR.W CheckIfKraidHasDied                                            ;A7A973;
    BNE .dead                                                            ;A7A976;
    JMP.W .alive                                                         ;A7A978;

  .dead:
    LDX.W #$00C0                                                         ;A7A97B;
    LDY.W #$0000                                                         ;A7A97E;

  .loopBGPalette6:
    LDA.W Palette_KraidRoomBackground,Y                                  ;A7A981;
    STA.L TargetPalettes_BGP0,X                                          ;A7A984;
    INX                                                                  ;A7A988;
    INX                                                                  ;A7A989;
    INY                                                                  ;A7A98A;
    INY                                                                  ;A7A98B;
    CPY.W #$0020                                                         ;A7A98C;
    BMI .loopBGPalette6                                                  ;A7A98F;
    LDX.W #$07FE                                                         ;A7A991;
    LDA.W #$0338                                                         ;A7A994;

  .loopBG2Tilemap:
    STA.L EnemyBG2Tilemap,X                                              ;A7A997;
    DEX                                                                  ;A7A99B;
    DEX                                                                  ;A7A99C;
    BPL .loopBG2Tilemap                                                  ;A7A99D;
    LDA.W #$0000                                                         ;A7A99F;
    STA.L ExtraEnemy7800+4                                               ;A7A9A2;
    LDX.W VRAMWriteStack                                                 ;A7A9A6;
    LDA.W #$0200                                                         ;A7A9A9;
    STA.B VRAMWrite.size,X                                               ;A7A9AC;
    LDA.W #Tiles_KraidRoomBackground                                     ;A7A9AE;
    STA.B VRAMWrite.src,X                                                ;A7A9B1;
    SEP #$20                                                             ;A7A9B3;
    LDA.B #Tiles_KraidRoomBackground>>16                                 ;A7A9B5;
    STA.B VRAMWrite.src+2,X                                              ;A7A9B7;
    REP #$20                                                             ;A7A9B9;
    LDA.B DP_BGTilesAddr                                                 ;A7A9BB;
    AND.W #$000F                                                         ;A7A9BD;
    XBA                                                                  ;A7A9C0;
    CLC                                                                  ;A7A9C1;
    ADC.W #$3F00                                                         ;A7A9C2;
    STA.B VRAMWrite.dest,X                                               ;A7A9C5;
    TXA                                                                  ;A7A9C7;
    CLC                                                                  ;A7A9C8;
    ADC.W #$0007                                                         ;A7A9C9;
    STA.W VRAMWriteStack                                                 ;A7A9CC;
    JSR.W SpawnPLMToClearTheCeiling                                      ;A7A9CF;
    JSR.W SpawnPLMToClearTheSpikes                                       ;A7A9D2;
    LDA.W #Function_Kraid_FadeInRegularBG_ClearBG2TilemapTopHalf         ;A7A9D5;
    STA.W Kraid.function                                                 ;A7A9D8;
    RTL                                                                  ;A7A9DB;

  .alive:
    SEP #$20                                                             ;A7A9DC;
    LDA.B #$43                                                           ;A7A9DE;
    STA.B DP_BG2TilemapAddrSize                                          ;A7A9E0;
    REP #$20                                                             ;A7A9E2;
    LDA.W #$0002                                                         ;A7A9E4;
    STA.W CameraDistanceIndex                                            ;A7A9E7;
    LDA.W #$0000                                                         ;A7A9EA;
    STA.L Scrolls                                                        ;A7A9ED;
    LDA.W #$0001                                                         ;A7A9F1;
    STA.L Scrolls+2                                                      ;A7A9F4;
    LDA.W #$0144                                                         ;A7A9F8;
    STA.L Kraid.minimumSamusEjectionYPosition                            ;A7A9FB;
    LDX.W #$0000                                                         ;A7A9FF;
    LDA.W Enemy.health                                                   ;A7AA02;
    LSR                                                                  ;A7AA05;
    LSR                                                                  ;A7AA06;
    LSR                                                                  ;A7AA07;
    STA.B DP_Temp12                                                      ;A7AA08;

  .loopKraidHealth:
    STA.L Kraid.maxHealth_1_8,X                                          ;A7AA0A;
    CLC                                                                  ;A7AA0E;
    ADC.B DP_Temp12                                                      ;A7AA0F;
    INX                                                                  ;A7AA11;
    INX                                                                  ;A7AA12;
    CPX.W #$0010                                                         ;A7AA13;
    BMI .loopKraidHealth                                                 ;A7AA16;
    LDA.W #$DFFF                                                         ;A7AA18;
    STA.B DP_Temp12                                                      ;A7AA1B;
    LDX.W EnemyIndex                                                     ;A7AA1D;
    JSR.W SetupKraidGFXWithTheTilePriorityCleared                        ;A7AA20;
    LDA.W Enemy.health                                                   ;A7AA23;
    LSR                                                                  ;A7AA26;
    LSR                                                                  ;A7AA27;
    STA.L Kraid.maxHealth_1_4                                            ;A7AA28;
    CLC                                                                  ;A7AA2C;
    ADC.L Kraid.maxHealth_1_4                                            ;A7AA2D;
    STA.L Kraid.maxHealth_2_4                                            ;A7AA31;
    CLC                                                                  ;A7AA35;
    ADC.L Kraid.maxHealth_1_4                                            ;A7AA36;
    STA.L Kraid.maxHealth_3_4                                            ;A7AA3A;
    CLC                                                                  ;A7AA3E;
    ADC.L Kraid.maxHealth_1_4                                            ;A7AA3F;
    STA.L Kraid.maxHealth_4_4                                            ;A7AA43;
    LDA.W #$0000                                                         ;A7AA47;
    STA.L ExtraEnemy7800+$3E                                             ;A7AA4A;
    LDA.W #$00B0                                                         ;A7AA4E;
    STA.W Enemy.XPosition                                                ;A7AA51;
    LDA.W #$0250                                                         ;A7AA54;
    STA.W Enemy.YPosition                                                ;A7AA57;
    LDA.W Enemy.properties                                               ;A7AA5A;
    ORA.W #$0400                                                         ;A7AA5D;
    STA.W Enemy.properties                                               ;A7AA60;
    LDA.W #Function_Kraid_RestrictSamusXPositionToFirstScreen            ;A7AA63;
    STA.W Kraid.function                                                 ;A7AA66;
    LDA.W #$012C                                                         ;A7AA69;
    STA.W Kraid.functionTimer                                            ;A7AA6C;
    LDA.W #Function_Kraid_RaiseThruFloor_LoadTilemapTopHalf              ;A7AA6F;
    STA.L Kraid.nextFunction                                             ;A7AA72;
    LDA.W #$0040                                                         ;A7AA76;
    STA.W Kraid.instructionTimer                                         ;A7AA79;
    JSL.L DisableMinimap_MarkBossRoomTilesExplored                       ;A7AA7C;
    LDX.W #$003E                                                         ;A7AA80;
    LDA.W #$0338                                                         ;A7AA83;

  .loopKraidGFX:
    STA.L EnemyBG2Tilemap+$FC0,X                                         ;A7AA86;
    DEX                                                                  ;A7AA8A;
    DEX                                                                  ;A7AA8B;
    BPL .loopKraidGFX                                                    ;A7AA8C;
    LDA.W #$0005                                                         ;A7AA8E;
    STA.W EarthquakeType                                                 ;A7AA91;
    LDX.W #$0000                                                         ;A7AA94;

  .loopSpritePalette3:
    LDA.W .spritePalette3,X                                              ;A7AA97;
    STA.L TargetPalettes_SpriteP3,X                                      ;A7AA9A;
    INX                                                                  ;A7AA9E;
    INX                                                                  ;A7AA9F;
    CPX.W #$0020                                                         ;A7AAA0;
    BMI .loopSpritePalette3                                              ;A7AAA3;
    RTL                                                                  ;A7AAA5;

  .spritePalette3:
; Sprite palette 3 - Kraid rocks
    dw $0000,$0000,$0000,$0000,$0000,$0DF6,$0D92,$0CEC                   ;A7AAA6;
    dw $0CA9,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;A7AAB6;


;;; $AAC6: Set up Kraid graphics with the tile priority cleared ;;;
SetupKraidGFXWithTheTilePriorityCleared:
; $7E:2000..27FF = BG2 tilemap - Kraid top half
; $7E:2800..2DFF = BG2 tilemap - Kraid bottom half
    SEP #$20                                                             ;A7AAC6;
    LDA.B #Background_Brinstar_1A_Kraid_Upper                            ;A7AAC8;
    STA.L DP_DecompSrc                                                   ;A7AACA; >.<
    LDA.B #(Background_Brinstar_1A_Kraid_Upper>>8)                       ;A7AACE;
    STA.L DP_DecompSrc+1                                                 ;A7AAD0; >.<
    LDA.B #(Background_Brinstar_1A_Kraid_Upper>>16)                      ;A7AAD4;
    STA.L DP_DecompSrc+2                                                 ;A7AAD6; >.<
    LDA.B #$00                                                           ;A7AADA;
    STA.L DP_DecompDest                                                  ;A7AADC; >.<
    LDA.B #$40                                                           ;A7AAE0;
    STA.L DP_DecompDest+1                                                ;A7AAE2; >.<
    JSL.L Decompression_VariableDestination                              ;A7AAE6;
    LDA.B #Background_Brinstar_1A_Kraid_Lower_0                          ;A7AAEA;
    STA.L DP_DecompSrc                                                   ;A7AAEC; >.<
    LDA.B #(Background_Brinstar_1A_Kraid_Lower_0>>8)                     ;A7AAF0;
    STA.L DP_DecompSrc+1                                                 ;A7AAF2; >.<
    LDA.B #(Background_Brinstar_1A_Kraid_Lower_0>>16)                    ;A7AAF6;
    STA.L DP_DecompSrc+2                                                 ;A7AAF8; >.<
    LDA.B #$00                                                           ;A7AAFC;
    STA.L DP_DecompDest                                                  ;A7AAFE; >.<
    LDA.B #$20                                                           ;A7AB02;
    STA.L DP_DecompDest+1                                                ;A7AB04; >.<
    JSL.L Decompression_VariableDestination                              ;A7AB08;
    REP #$20                                                             ;A7AB0C;
    LDA.W #$0000                                                         ;A7AB0E;
    STA.L Kraid.hurtFrame                                                ;A7AB11;
    STA.L Kraid.hurtFrameTimer                                           ;A7AB15;
    LDX.W #$0000                                                         ;A7AB19;

  .loop0:
    LDA.L EnemyBG2Tilemap,X                                              ;A7AB1C;
    AND.W #$DFFF                                                         ;A7AB20;
    STA.L EnemyBG2Tilemap+$800,X                                         ;A7AB23;
    INX                                                                  ;A7AB27;
    INX                                                                  ;A7AB28;
    CPX.W #$0600                                                         ;A7AB29;
    BMI .loop0                                                           ;A7AB2C;
    LDX.W #$0000                                                         ;A7AB2E;

  .loop1:
    LDA.L BG2Tilemap,X                                                   ;A7AB31;
    AND.B DP_Temp12                                                      ;A7AB35;
    STA.L EnemyBG2Tilemap,X                                              ;A7AB37;
    INX                                                                  ;A7AB3B;
    INX                                                                  ;A7AB3C;
    CPX.W #$0800                                                         ;A7AB3D;
    BMI .loop1                                                           ;A7AB40;
    RTS                                                                  ;A7AB42;


;;; $AB43: Initialisation AI - enemy $E2FF (Kraid arm) ;;;
InitAI_KraidArm:
    JSR.W CheckIfKraidHasDied                                            ;A7AB43;
    BNE .dead                                                            ;A7AB46;
    LDA.W Enemy.palette                                                  ;A7AB48;
    STA.W Enemy[1].palette                                               ;A7AB4B;
    LDA.W #RTL_A7BA2D                                                    ;A7AB4E;
    STA.W Enemy[1].var0                                                  ;A7AB51;
    LDA.W #InstList_KraidArm_RisingSinking                               ;A7AB54;
    STA.W Enemy[1].instList                                              ;A7AB57;
    LDA.W #$0001                                                         ;A7AB5A;
    STA.W Enemy[1].instTimer                                             ;A7AB5D;
    STZ.W Enemy[1].var1                                                  ;A7AB60;
    RTL                                                                  ;A7AB63;

  .dead:
    JSR.W SetEnemyPropertiesToDead                                       ;A7AB64;
    RTL                                                                  ;A7AB67;


;;; $AB68: Initialisation AI - enemy $E33F (Kraid top lint) ;;;
InitAI_KraidLintTop:
    JSR.W CheckIfKraidHasDied                                            ;A7AB68;
    BNE .dead                                                            ;A7AB6B;
    LDA.W Enemy.palette                                                  ;A7AB6D;
    STA.W Enemy[2].palette                                               ;A7AB70;
    LDA.W #$7FFF                                                         ;A7AB73;
    STA.W Enemy[2].instTimer                                             ;A7AB76;
    LDA.W #InstList_KraidLint_Initial                                    ;A7AB79;
    STA.W Enemy[2].instList                                              ;A7AB7C;
    LDA.W #Spritemap_KraidLint_Initial                                   ;A7AB7F;
    STA.W Enemy[2].spritemap                                             ;A7AB82;
    LDA.W #RTL_A7B831                                                    ;A7AB85;
    STA.W Enemy[2].var0                                                  ;A7AB88;
    LDA.W #$7FFF                                                         ;A7AB8B;
    STA.W Enemy[2].var5                                                  ;A7AB8E;
    LDA.W #$0000                                                         ;A7AB91;
    STA.W Enemy[2].var2                                                  ;A7AB94;
    RTL                                                                  ;A7AB97;

  .dead:
    JSR.W SetEnemyPropertiesToDead                                       ;A7AB98;
    RTL                                                                  ;A7AB9B;


;;; $AB9C: Initialisation AI - enemy $E37F (Kraid middle lint) ;;;
InitAI_KraidLintMiddle:
    JSR.W CheckIfKraidHasDied                                            ;A7AB9C;
    BNE .dead                                                            ;A7AB9F;
    LDA.W Enemy.palette                                                  ;A7ABA1;
    STA.W Enemy[3].palette                                               ;A7ABA4;
    LDA.W #$7FFF                                                         ;A7ABA7;
    STA.W Enemy[3].instTimer                                             ;A7ABAA;
    LDA.W #InstList_KraidLint_Initial                                    ;A7ABAD;
    STA.W Enemy[3].instList                                              ;A7ABB0;
    LDA.W #Spritemap_KraidLint_Initial                                   ;A7ABB3;
    STA.W Enemy[3].spritemap                                             ;A7ABB6;
    LDA.W #RTL_A7B831                                                    ;A7ABB9;
    STA.W Enemy[3].var0                                                  ;A7ABBC;
    LDA.W #$FFF0                                                         ;A7ABBF;
    STA.W Enemy[3].var2                                                  ;A7ABC2;
    RTL                                                                  ;A7ABC5;

  .dead:
    JSR.W SetEnemyPropertiesToDead                                       ;A7ABC6;
    RTL                                                                  ;A7ABC9;


;;; $ABCA: Initialisation AI - enemy $E3BF (Kraid bottom lint) ;;;
InitAI_KraidLintBottom:
    JSR.W CheckIfKraidHasDied                                            ;A7ABCA;
    BNE .dead                                                            ;A7ABCD;
    LDA.W Enemy.palette                                                  ;A7ABCF;
    STA.W Enemy[4].palette                                               ;A7ABD2;
    LDA.W #$7FFF                                                         ;A7ABD5;
    STA.W Enemy[4].instTimer                                             ;A7ABD8;
    LDA.W #InstList_KraidLint_Initial                                    ;A7ABDB;
    STA.W Enemy[4].instList                                              ;A7ABDE;
    LDA.W #Spritemap_KraidLint_Initial                                   ;A7ABE1;
    STA.W Enemy[4].spritemap                                             ;A7ABE4;
    LDA.W #RTL_A7B831                                                    ;A7ABE7;
    STA.W Enemy[4].var0                                                  ;A7ABEA;
    LDA.W #$FFF0                                                         ;A7ABED;
    STA.W Enemy[4].var2                                                  ;A7ABF0;
    RTL                                                                  ;A7ABF3;

  .dead:
    JSR.W SetEnemyPropertiesToDead                                       ;A7ABF4;
    RTL                                                                  ;A7ABF7;


;;; $ABF8: Initialisation AI - enemy $E3FF (Kraid foot) ;;;
InitAI_KraidFoot:
    JSR.W CheckIfKraidHasDied                                            ;A7ABF8;
    BNE .dead                                                            ;A7ABFB;
    LDA.W Enemy.palette                                                  ;A7ABFD;
    STA.W Enemy[5].palette                                               ;A7AC00;
    LDA.W #InstList_KraidFoot_Initial                                    ;A7AC03;
    STA.W Enemy[5].instList                                              ;A7AC06;
    LDA.W #$0001                                                         ;A7AC09;
    STA.W Enemy[5].instTimer                                             ;A7AC0C;
    LDA.W #RTL_A7BA2D                                                    ;A7AC0F;
    STA.W Enemy[5].var0                                                  ;A7AC12;
    LDA.W #$0000                                                         ;A7AC15;
    STA.L ExtraEnemy7800+$140                                            ;A7AC18;
    RTL                                                                  ;A7AC1C;

  .dead:
    JSR.W SetEnemyPropertiesToDead                                       ;A7AC1D;
    RTL                                                                  ;A7AC20;


;;; $AC21: Main AI - enemy $E2BF (Kraid) ;;;
MainAI_Kraid:
    JSR.W KraidsMouth_vs_Projectile_CollisionHandling                    ;A7AC21;
    JSR.W KraidPaletteHandling                                           ;A7AC24;
    JSR.W KraidBody_vs_Projectile_CollisionHandling                      ;A7AC27;
    JSR.W KraidBody_vs_Samus_CollisionHandling                           ;A7AC2A;
    LDX.W EnemyIndex                                                     ;A7AC2D;
    LDA.B DP_BG1XScroll                                                  ;A7AC30;
    SEC                                                                  ;A7AC32;
    SBC.W BG1XOffset                                                     ;A7AC33;
    SBC.W Enemy.XPosition                                                ;A7AC36;
    ADC.W Enemy.XHitboxRadius                                            ;A7AC39;
    STA.B DP_BG2XScroll                                                  ;A7AC3C;
    LDA.W Layer1YPosition                                                ;A7AC3E;
    SEC                                                                  ;A7AC41;
    SBC.W Enemy.YPosition                                                ;A7AC42;
    ADC.W #$0098                                                         ;A7AC45;
    STA.B DP_BG2YScroll                                                  ;A7AC48;
    JMP.W (Kraid.function)                                               ;A7AC4A;


;;; $AC4D: Kraid function - Kraid gets big - break ceiling into platforms ;;;
Function_Kraid_KraidGetsBig_BreakCeilingIntoPlatforms:
    LDA.W NMI_FrameCounter                                               ;A7AC4D;
    AND.W #$0007                                                         ;A7AC50;
    BNE .nonZeroCounter                                                  ;A7AC53;
    JSR.W SpawnRandomEarthquakeProjectile                                ;A7AC55;

  .nonZeroCounter:
    LDY.W #$0001                                                         ;A7AC58;
    LDA.W Enemy.YPosition                                                ;A7AC5B;
    BIT.W #$0002                                                         ;A7AC5E;
    BEQ +                                                                ;A7AC61;
    LDY.W #$FFFF                                                         ;A7AC63;

+   STY.B DP_Temp12                                                      ;A7AC66;
    LDA.W Enemy.XPosition                                                ;A7AC68;
    CLC                                                                  ;A7AC6B;
    ADC.B DP_Temp12                                                      ;A7AC6C;
    STA.W Enemy.XPosition                                                ;A7AC6E;
    DEC.W Enemy.YPosition                                                ;A7AC71;
    LDA.W Enemy.YPosition                                                ;A7AC74;
    AND.W #$0003                                                         ;A7AC77;
    BNE .done                                                            ;A7AC7A;
    LDX.W Kraid.functionTimer                                            ;A7AC7C;
    CPX.W #$0012                                                         ;A7AC7F;
    BPL .done                                                            ;A7AC82;
    LDA.W .XPositions,X                                                  ;A7AC84;
    LDY.W #EnemyProjectile_KraidCeilingRocks                             ;A7AC87;
    LDX.W EnemyIndex                                                     ;A7AC8A;
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics                     ;A7AC8D;
    LDX.W Kraid.functionTimer                                            ;A7AC91;
    LDA.W .functionPointers,X                                            ;A7AC94;
    STA.B DP_Temp12                                                      ;A7AC97;
    JMP.W (DP_Temp12)                                                    ;A7AC99;

  .manualReturn:
; Manual return point for PLM spawning functions
    LDX.W Kraid.functionTimer                                            ;A7AC9C;
    INX                                                                  ;A7AC9F;
    INX                                                                  ;A7ACA0;
    STX.W Kraid.functionTimer                                            ;A7ACA1;

  .done:
    LDA.W Enemy.YPosition                                                ;A7ACA4;
    CMP.W #$0128                                                         ;A7ACA7;
    BPL .return                                                          ;A7ACAA;
    LDA.W #Function_Kraid_KraidGetsBig_SetBG2TilemapPriorityBits         ;A7ACAC;
    STA.W Kraid.function                                                 ;A7ACAF;

  .return:
    RTL                                                                  ;A7ACB2;

  .XPositions:
; Falling rocks X positions
    dw $0068,$00D8,$0028,$00A8,$0058,$00C8,$0038,$00B8,$0048             ;A7ACB3;

  .functionPointers:
; Ceiling break PLM spawning function pointers
    dw .spawnPLM4                                                        ;A7ACC5;
    dw .spawnPLM8                                                        ;A7ACC7;
    dw .spawnPLM0                                                        ;A7ACC9;
    dw .spawnPLM5                                                        ;A7ACCB;
    dw .spawnPLM3                                                        ;A7ACCD;
    dw .spawnPLM7                                                        ;A7ACCF;
    dw .spawnPLM1                                                        ;A7ACD1;
    dw .spawnPLM6                                                        ;A7ACD3;
    dw .spawnPLM2                                                        ;A7ACD5;

  .spawnPLM0:
    JSL.L Spawn_Hardcoded_PLM                                            ;A7ACD7;
    db $02,$12                                                           ;A7ACDB;
    dw PLMEntries_crumbleKraidCeilingBlockIntoBackground1                ;A7ACDD;
    JMP.W .manualReturn                                                  ;A7ACDF;

  .spawnPLM1:
    JSL.L Spawn_Hardcoded_PLM                                            ;A7ACE2;
    db $03,$12                                                           ;A7ACE6;
    dw PLMEntries_crumbleKraidCeilingBlockIntoBackground2                ;A7ACE8;
    JMP.W .manualReturn                                                  ;A7ACEA;

  .spawnPLM2:
    JSL.L Spawn_Hardcoded_PLM                                            ;A7ACED;
    db $04,$12                                                           ;A7ACF1;
    dw PLMEntries_crumbleKraidCeilingBlockIntoBackground3                ;A7ACF3;
    JMP.W .manualReturn                                                  ;A7ACF5;

  .spawnPLM3:
    JSL.L Spawn_Hardcoded_PLM                                            ;A7ACF8;
    db $05,$12                                                           ;A7ACFC;
    dw PLMEntries_crumbleKraidCeilingBlockIntoBackground2                ;A7ACFE;
    JMP.W .manualReturn                                                  ;A7AD00;

  .spawnPLM4:
    JSL.L Spawn_Hardcoded_PLM                                            ;A7AD03;
    db $06,$12                                                           ;A7AD07;
    dw PLMEntries_crumbleKraidCeilingBlockIntoBackground3                ;A7AD09;
    JMP.W .manualReturn                                                  ;A7AD0B;

  .spawnPLM5:
    JSL.L Spawn_Hardcoded_PLM                                            ;A7AD0E;
    db $0A,$12                                                           ;A7AD12;
    dw PLMEntries_crumbleKraidCeilingBlockIntoBackground3                ;A7AD14;
    JMP.W .manualReturn                                                  ;A7AD16;

  .spawnPLM6:
    JSL.L Spawn_Hardcoded_PLM                                            ;A7AD19;
    db $0B,$12                                                           ;A7AD1D;
    dw PLMEntries_crumbleKraidCeilingBlockIntoBackground2                ;A7AD1F;
    JMP.W .manualReturn                                                  ;A7AD21;

  .spawnPLM7:
    JSL.L Spawn_Hardcoded_PLM                                            ;A7AD24;
    db $0C,$12                                                           ;A7AD28;
    dw PLMEntries_crumbleKraidCeilingBlockIntoBackground3                ;A7AD2A;
    JMP.W .manualReturn                                                  ;A7AD2C;

  .spawnPLM8:
    JSL.L Spawn_Hardcoded_PLM                                            ;A7AD2F;
    db $0D,$12                                                           ;A7AD33;
    dw PLMEntries_crumbleKraidCeilingBlockIntoBackground2                ;A7AD35;
    JMP.W .manualReturn                                                  ;A7AD37;


;;; $AD3A: Kraid function - Kraid gets big - set BG2 tilemap priority bits ;;;
Function_Kraid_KraidGetsBig_SetBG2TilemapPriorityBits:
    LDX.W #$0000                                                         ;A7AD3A;

  .loop:
    LDA.L EnemyBG2Tilemap,X                                              ;A7AD3D;
    ORA.W #$2000                                                         ;A7AD41;
    STA.L EnemyBG2Tilemap,X                                              ;A7AD44;
    INX                                                                  ;A7AD48;
    INX                                                                  ;A7AD49;
    CPX.W #$1000                                                         ;A7AD4A;
    BMI .loop                                                            ;A7AD4D;
    LDA.W Enemy[1].properties                                            ;A7AD4F;
    AND.W #$FBFF                                                         ;A7AD52;
    STA.W Enemy[1].properties                                            ;A7AD55;
    LDA.W #Function_Kraid_KraidGetsBig_FinishUpdatingBG2Tilemap          ;A7AD58;
    STA.W Kraid.function                                                 ;A7AD5B;
    JMP.W UpdateBG2TilemapTopHalf                                        ;A7AD5E;


;;; $AD61: Kraid function - Kraid gets big - finish updating BG2 tilemap ;;;
Function_Kraid_KraidGetsBig_FinishUpdatingBG2Tilemap:
    LDA.W #Function_Kraid_KraidGetsBig_DrawRoomBackground                ;A7AD61;
    STA.W Kraid.function                                                 ;A7AD64;
    LDA.W #$0001                                                         ;A7AD67;
    STA.W Enemy[5].instTimer                                             ;A7AD6A;
    LDA.W #InstList_KraidFoot_KraidIsBig_Neutral                         ;A7AD6D;
    STA.W Enemy[5].instList                                              ;A7AD70;
    LDA.W #InstList_KraidLint_KraidIsBig                                 ;A7AD73;
    STA.W Enemy[2].instList                                              ;A7AD76;
    STA.W Enemy[3].instList                                              ;A7AD79;
    STA.W Enemy[4].instList                                              ;A7AD7C;
    LDA.W #Spritemap_KraidLint_KraidIsBig                                ;A7AD7F;
    STA.W Enemy[2].spritemap                                             ;A7AD82;
    STA.W Enemy[3].spritemap                                             ;A7AD85;
    STA.W Enemy[4].spritemap                                             ;A7AD88;
    JMP.W UpdateBG2TilemapBottomHalf                                     ;A7AD8B;


;;; $AD8E: Kraid function - Kraid gets big - draw room background ;;;
Function_Kraid_KraidGetsBig_DrawRoomBackground:
; Note that BG1 tiles base address = (DP_BGTilesAddr & Fh) * 1000h, whereas this routine is using (DP_BGTilesAddr & Fh) * 100h,
; i.e. this routine only works because BG1 tiles base address = $0000
    LDA.W #Function_Kraid_KraidGetsBig_FadeInRoomBackground              ;A7AD8E;
    STA.W Kraid.function                                                 ;A7AD91;
    STZ.W Enemy.var4                                                     ;A7AD94;
    STZ.W Kraid.functionTimer                                            ;A7AD97; fallthrough to DrawKraidsRoomBackground


;;; $AD9A: Draw Kraid's room background ;;;
DrawKraidsRoomBackground:
    LDX.W #$00C0                                                         ;A7AD9A;
    LDY.W #$0000                                                         ;A7AD9D;

  .loop:
    LDA.W Palette_KraidRoomBackground,Y                                  ;A7ADA0;
    STA.L TargetPalettes_BGP0,X                                          ;A7ADA3;
    INX                                                                  ;A7ADA7;
    INX                                                                  ;A7ADA8;
    INY                                                                  ;A7ADA9;
    INY                                                                  ;A7ADAA;
    CPY.W #$0020                                                         ;A7ADAB;
    BMI .loop                                                            ;A7ADAE;
    LDA.W #$0000                                                         ;A7ADB0;
    STA.L PaletteChangeNumerator                                         ;A7ADB3;
    LDX.W VRAMWriteStack                                                 ;A7ADB7;
    LDA.W #$0200                                                         ;A7ADBA;
    STA.B VRAMWrite.size,X                                               ;A7ADBD;
    LDA.W #Tiles_KraidRoomBackground                                     ;A7ADBF;
    STA.B VRAMWrite.src,X                                                ;A7ADC2;
    SEP #$20                                                             ;A7ADC4;
    LDA.B #Tiles_KraidRoomBackground>>16                                 ;A7ADC6;
    STA.B VRAMWrite.src+2,X                                              ;A7ADC8;
    REP #$20                                                             ;A7ADCA;
    LDA.B DP_BGTilesAddr                                                 ;A7ADCC;
    AND.W #$000F                                                         ;A7ADCE;
    XBA                                                                  ;A7ADD1;
    CLC                                                                  ;A7ADD2;
    ADC.W #$3F00                                                         ;A7ADD3;
    STA.B VRAMWrite.dest,X                                               ;A7ADD6;
    TXA                                                                  ;A7ADD8;
    CLC                                                                  ;A7ADD9;
    ADC.W #$0007                                                         ;A7ADDA;
    STA.W VRAMWriteStack                                                 ;A7ADDD;
    RTL                                                                  ;A7ADE0;


;;; $ADE1: Set up Kraid gets big - thinking ;;;
SetupKraidGetsBig_Thinking:
    LDA.W #Function_Kraid_KraidGetsBig_Thinking                          ;A7ADE1;
    STA.W Kraid.function                                                 ;A7ADE4;
    BRA SetLintYPositionsAndRandomThinkingTimer                          ;A7ADE7;


;;; $ADE9: Set up Kraid main loop - thinking ;;;
SetupKraidMainLoop_Thinking:
    LDA.W #Function_Kraid_MainLoop_Thinking                              ;A7ADE9;
    STA.W Kraid.function                                                 ;A7ADEC; fallthrough to SetLintYPositionsAndRandomThinkingTimer


;;; $ADEF: Set lint Y positions and random thinking timer ;;;
SetLintYPositionsAndRandomThinkingTimer:
    LDA.W Enemy.YPosition                                                ;A7ADEF;
    SEC                                                                  ;A7ADF2;
    SBC.W #$0014                                                         ;A7ADF3;
    STA.W Enemy[2].YPosition                                             ;A7ADF6;
    LDA.W Enemy.YPosition                                                ;A7ADF9;
    CLC                                                                  ;A7ADFC;
    ADC.W #$002E                                                         ;A7ADFD;
    STA.W Enemy[3].YPosition                                             ;A7AE00;
    LDA.W Enemy.YPosition                                                ;A7AE03;
    CLC                                                                  ;A7AE06;
    ADC.W #$0070                                                         ;A7AE07;
    STA.W Enemy[4].YPosition                                             ;A7AE0A;
    LDA.W RandomNumberSeed                                               ;A7AE0D;
    AND.W #$0007                                                         ;A7AE10;
    BNE .multiplyBy40                                                    ;A7AE13;
    LDA.W #$0002                                                         ;A7AE15;

  .multiplyBy40:
    ASL                                                                  ;A7AE18;
    ASL                                                                  ;A7AE19;
    ASL                                                                  ;A7AE1A;
    ASL                                                                  ;A7AE1B;
    ASL                                                                  ;A7AE1C;
    ASL                                                                  ;A7AE1D;
    STA.L Kraid.thinkingTimer                                            ;A7AE1E;
    RTS                                                                  ;A7AE22;


;;; $AE23: Kraid function - Kraid gets big - fade in room background ;;;
Function_Kraid_KraidGetsBig_FadeInRoomBackground:
    REP #$30                                                             ;A7AE23;
    JSL.L Advance_GradualColorChange_ofBGPalette6                        ;A7AE25;
    BCS .reachedTargetColor                                              ;A7AE29;
    RTL                                                                  ;A7AE2B;

  .reachedTargetColor:
    JSR.W SetupKraidGetsBig_Thinking                                     ;A7AE2C;
    LDX.W #$0080                                                         ;A7AE2F;
    LDA.W KraidLint_InitialFunctionTimers_top                            ;A7AE32;
    JSR.W EnableKraidLints                                               ;A7AE35;
    LDX.W #$00C0                                                         ;A7AE38;
    LDA.W KraidLint_InitialFunctionTimers_middle                         ;A7AE3B;
    JSR.W EnableKraidLints                                               ;A7AE3E;
    LDX.W #$0100                                                         ;A7AE41;
    LDA.W KraidLint_InitialFunctionTimers_bottom                         ;A7AE44;
    JSR.W EnableKraidLints                                               ;A7AE47;
    LDA.W #Function_KraidNail_Initialize                                 ;A7AE4A;
    STA.L ExtraEnemy7800+$180                                            ;A7AE4D;
    STA.L ExtraEnemy7800+$1C0                                            ;A7AE51;
    LDA.W #Function_Kraid_HandleFunctionTimer                            ;A7AE55;
    STA.W Enemy[6].var0                                                  ;A7AE58;
    STA.W Enemy[7].var0                                                  ;A7AE5B;
    LDA.W #$0040                                                         ;A7AE5E;
    STA.W Enemy[6].var5                                                  ;A7AE61;
    LDA.W #$0080                                                         ;A7AE64;
    STA.W Enemy[7].var5                                                  ;A7AE67;
    LDA.W #$0001                                                         ;A7AE6A;
    STA.W Enemy[1].var2                                                  ;A7AE6D;
    LDA.W #InstList_Kraid_Roar_1                                         ;A7AE70;
    STA.W Kraid.instListPointer                                          ;A7AE73;
    LDA.W #$0120                                                         ;A7AE76;
    STA.L Kraid.targetXPosition                                          ;A7AE79;
    LDA.W #Function_KraidFoot_Phase2Setup_WalkToStartingPoint            ;A7AE7D;
    STA.W Enemy[5].var0                                                  ;A7AE80;
    LDA.W #$0001                                                         ;A7AE83;
    STA.W Enemy[5].instTimer                                             ;A7AE86;
    LDA.W #InstList_KraidFoot_KraidIsBig_WalkingBackwards_0              ;A7AE89;
    STA.W Enemy[5].instList                                              ;A7AE8C;
    RTL                                                                  ;A7AE8F;


;;; $AE90: Enable Kraid lints ;;;
EnableKraidLints:
    STA.W Kraid.functionTimer,X                                          ;A7AE90;
    LDA.W #Function_KraidNail_HorizontallyAlignEnemyToKraid              ;A7AE93;
    STA.W Kraid.function,X                                               ;A7AE96;
    LDA.W #Function_KraidLint_ProduceLint                                ;A7AE99;
    STA.L Kraid.nextFunction,X                                           ;A7AE9C;
    STZ.W Kraid.instListPointer,X                                        ;A7AEA0;
    RTS                                                                  ;A7AEA3;


;;; $AEA4: Kraid function - Kraid main loop - thinking ;;;
Function_Kraid_MainLoop_Thinking:
; This is the function for which Kraid can be shot to trigger his mouth opening
    LDA.L Kraid.thinkingTimer                                            ;A7AEA4;
    BEQ .return                                                          ;A7AEA8;
    DEC                                                                  ;A7AEAA;
    STA.L Kraid.thinkingTimer                                            ;A7AEAB;
    BNE .return                                                          ;A7AEAF;
    LDA.W #Function_KraidMainLoop_AttackingWithMouthOpen                 ;A7AEB1;
    STA.W Kraid.function                                                 ;A7AEB4;
    LDA.W #InstList_Kraid_Roar_1                                         ;A7AEB7;
    STA.W Kraid.instListPointer                                          ;A7AEBA;
    LDA.W InstList_Kraid_Roar_0                                          ;A7AEBD;
    STA.W Kraid.instructionTimer                                         ;A7AEC0;

  .return:
    RTL                                                                  ;A7AEC3;


;;; $AEC4: Kraid function - Kraid gets big - thinking ;;;
Function_Kraid_KraidGetsBig_Thinking:
    LDA.L Kraid.thinkingTimer                                            ;A7AEC4;
    BEQ .return                                                          ;A7AEC8;
    DEC                                                                  ;A7AECA;
    STA.L Kraid.thinkingTimer                                            ;A7AECB;
    BNE .return                                                          ;A7AECF;
    LDA.W #Function_Kraid_KraidShot_KraidsMouthIsOpen                    ;A7AED1;
    STA.W Kraid.function                                                 ;A7AED4;
    LDA.W #InstList_Kraid_Roar_1                                         ;A7AED7;
    STA.W Kraid.instListPointer                                          ;A7AEDA;
    LDA.W InstList_Kraid_Roar_0                                          ;A7AEDD;
    STA.W Kraid.instructionTimer                                         ;A7AEE0;

  .return:
    RTL                                                                  ;A7AEE3;


;;; $AEE4: Kraid function - Kraid shot - Kraid's mouth is open ;;;
Function_Kraid_KraidShot_KraidsMouthIsOpen:
    JSR.W KraidInstListHandling                                          ;A7AEE4;
    CMP.W #$FFFF                                                         ;A7AEE7;
    BNE .return                                                          ;A7AEEA;
    LDA.W #Function_Kraid_MainLoop_Thinking                              ;A7AEEC;
    STA.W Kraid.function                                                 ;A7AEEF;
    LDA.W #$005A                                                         ;A7AEF2;
    STA.W Kraid.instructionTimer                                         ;A7AEF5;
    LDA.L Kraid.mouthReopenFlags                                         ;A7AEF8;
    BIT.W #$0004                                                         ;A7AEFC;
    BEQ .done                                                            ;A7AEFF;
    SEC                                                                  ;A7AF01;
    SBC.W #$0100                                                         ;A7AF02;
    STA.L Kraid.mouthReopenFlags                                         ;A7AF05;
    AND.W #$FF00                                                         ;A7AF09;
    BEQ .done                                                            ;A7AF0C;
    LDA.W #Function_Kraid_HandleFunctionTimer                            ;A7AF0E;
    STA.W Kraid.function                                                 ;A7AF11;
    LDA.W #$0040                                                         ;A7AF14;
    STA.W Kraid.functionTimer                                            ;A7AF17;
    LDA.W #Function_Kraid_KraidShot_InitializeEyeGlowing                 ;A7AF1A;
    STA.L Kraid.nextFunction                                             ;A7AF1D;
    LDA.W #$0002                                                         ;A7AF21;
    STA.L ExtraEnemy7800+2                                               ;A7AF24;

  .return:
    RTL                                                                  ;A7AF28;

  .done:
    LDA.W #$0000                                                         ;A7AF29;
    STA.L Kraid.mouthReopenFlags                                         ;A7AF2C;
    BRA .return                                                          ;A7AF30;


;;; $AF32: Kraid instruction list handling ;;;
KraidInstListHandling:
    LDA.W Kraid.instructionTimer                                         ;A7AF32;
    BEQ .return                                                          ;A7AF35;
    DEC.W Kraid.instructionTimer                                         ;A7AF37;
    BEQ ProcessKraidInstList                                             ;A7AF3A;

  .return:
    RTS                                                                  ;A7AF3C;


;;; $AF3D: Process Kraid instruction list ;;;
ProcessKraidInstList:
; Kraid instruction format
; If t & 8000h = 0:
;     tttt TTTT pppp mmmm
;     t: Timer
;     T: Tilemap pointer, fixed 2C0h bytes
;     p: Kraid projectile hitbox
;     m: Kraid's mouth projectile hitbox
; If p & 8000h != 0:
;     pppp
;     p: If FFFFh, terminator, otherwise pointer to function
    LDX.W Kraid.instListPointer                                          ;A7AF3D;
    LDA.W $0000,X                                                        ;A7AF40;
    CMP.W #$FFFF                                                         ;A7AF43;
    BEQ .return                                                          ;A7AF46;
    BMI .ASMInstruction                                                  ;A7AF48;
    STA.W Kraid.instructionTimer                                         ;A7AF4A;
    TXA                                                                  ;A7AF4D;
    CLC                                                                  ;A7AF4E;
    ADC.W #$0008                                                         ;A7AF4F;
    STA.W Kraid.instListPointer                                          ;A7AF52;
    LDA.W $0002,X                                                        ;A7AF55;
    TAY                                                                  ;A7AF58;
    PHX                                                                  ;A7AF59;
    LDX.W VRAMWriteStack                                                 ;A7AF5A;
    LDA.W #$02C0                                                         ;A7AF5D;
    STA.B VRAMWrite.size,X                                               ;A7AF60;
    INX                                                                  ;A7AF62;
    INX                                                                  ;A7AF63;
    STY.B VRAMWrite.size,X                                               ;A7AF64;
    INX                                                                  ;A7AF66;
    INX                                                                  ;A7AF67;
    SEP #$20                                                             ;A7AF68;
    LDA.B #Tilemap_KraidHead_0>>16                                       ;A7AF6A;
    STA.B VRAMWrite.size,X                                               ;A7AF6C;
    REP #$20                                                             ;A7AF6E;
    INX                                                                  ;A7AF70;
    LDA.B DP_BG2TilemapAddrSize                                          ;A7AF71;
    AND.W #$00FC                                                         ;A7AF73;
    XBA                                                                  ;A7AF76;
    STA.B VRAMWrite.size,X                                               ;A7AF77;
    INX                                                                  ;A7AF79;
    INX                                                                  ;A7AF7A;
    STX.W VRAMWriteStack                                                 ;A7AF7B;
    PLX                                                                  ;A7AF7E;
    LDA.W #$0001                                                         ;A7AF7F;

  .return:
    RTS                                                                  ;A7AF82;

  .ASMInstruction:
    STA.B DP_Temp12                                                      ;A7AF83;
    JMP.W (DP_Temp12)                                                    ;A7AF85;


;;; $AF88: Process next Kraid instruction ;;;
ProcessNextKraidInstruction:
    LDA.W Kraid.instListPointer                                          ;A7AF88;
    CLC                                                                  ;A7AF8B;
    ADC.W #$0002                                                         ;A7AF8C;
    STA.W Kraid.instListPointer                                          ;A7AF8F;
    BRA ProcessKraidInstList                                             ;A7AF92;


;;; $AF94: Kraid instruction - queue Kraid roar sound effect ;;;
Instruction_Kraid_PlayRoarSFX:
    PHX                                                                  ;A7AF94;
    LDA.W #$002D                                                         ;A7AF95;
    JSL.L QueueSound_Lib2_Max6                                           ;A7AF98;
    PLX                                                                  ;A7AF9C;
    BRA ProcessNextKraidInstruction                                      ;A7AF9D;


;;; $AF9F: Kraid instruction - queue Kraid dying sound effect ;;;
Instruction_Kraid_PlayDyingSFX:
    PHX                                                                  ;A7AF9F;
    LDA.W #$002E                                                         ;A7AFA0;
    JSL.L QueueSound_Lib2_Max15                                          ;A7AFA3;
    PLX                                                                  ;A7AFA7;
    BRA ProcessNextKraidInstruction                                      ;A7AFA8;


;;; $AFAA: Kraid's mouth / projectile collision handling ;;;
KraidsMouth_vs_Projectile_CollisionHandling:
; The loop over projectiles is pretty wrong
; Just because there are n active projectiles, that doesn't mean they're in the first n slots,
; so it is possible for Kraid to detect a collision with an early slot inactive projectile and miss a collision with a late slot active projectile
; The initial index is one slot beyond the supposed last projectile,
; so even if using the projectile counter made sense, this would erroneously consider an inactive projectile
; This routine has no handling for bombs, but if all 5 projectile slots are active, this will read the first bomb slot,
; making it technically possible to get a bomb interaction from Kraid (trigger mouth to open and kill projectile)
    REP #$30                                                             ;A7AFAA;
    PHX                                                                  ;A7AFAC;
    LDA.W Kraid.function                                                 ;A7AFAD;
    CMP.W #KraidDeath_SinkThroughFloor                                   ;A7AFB0;
    BMI .notDying                                                        ;A7AFB3;
    PLX                                                                  ;A7AFB5;
    RTS                                                                  ;A7AFB6;

  .notDying:
    LDA.W Kraid.instListPointer                                          ;A7AFB7;
    SEC                                                                  ;A7AFBA;
    SBC.W #$0008                                                         ;A7AFBB;
    TAX                                                                  ;A7AFBE;
    LDA.W $0006,X                                                        ;A7AFBF;
    CMP.W #$FFFF                                                         ;A7AFC2;
    BNE .notTerminator                                                   ;A7AFC5;
    LDY.W #$0000                                                         ;A7AFC7;
    JMP.W .noProjectiles                                                 ;A7AFCA;

  .notTerminator:
    TAX                                                                  ;A7AFCD;
    LDA.W #$0001                                                         ;A7AFCE;
    STA.W Enemy.var4                                                     ;A7AFD1;
    LDY.W #$0000                                                         ;A7AFD4;
    LDA.W $0000,X                                                        ;A7AFD7;
    CLC                                                                  ;A7AFDA;
    ADC.W Enemy.XPosition                                                ;A7AFDB;
    STA.B DP_Temp16                                                      ;A7AFDE;
    LDA.W $0002,X                                                        ;A7AFE0;
    CLC                                                                  ;A7AFE3;
    ADC.W Enemy.YPosition                                                ;A7AFE4;
    STA.B DP_Temp14                                                      ;A7AFE7;
    LDA.W $0006,X                                                        ;A7AFE9;
    CLC                                                                  ;A7AFEC;
    ADC.W Enemy.YPosition                                                ;A7AFED;
    STA.B DP_Temp12                                                      ;A7AFF0;
    LDA.W SamusProjectile_ProjectileCounter                              ;A7AFF2;
    BEQ .noProjectiles                                                   ;A7AFF5;
    ASL                                                                  ;A7AFF7;
    TAX                                                                  ;A7AFF8;

  .loop:
    LDA.W SamusProjectile_YPositions,X                                   ;A7AFF9;
    SEC                                                                  ;A7AFFC;
    SBC.W SamusProjectile_YRadii,X                                       ;A7AFFD;
    DEC                                                                  ;A7B000;
    CMP.B DP_Temp12                                                      ;A7B001;
    BPL .next                                                            ;A7B003;
    LDA.W SamusProjectile_YPositions,X                                   ;A7B005;
    CLC                                                                  ;A7B008;
    ADC.W SamusProjectile_YRadii,X                                       ;A7B009;
    CMP.B DP_Temp14                                                      ;A7B00C;
    BMI .next                                                            ;A7B00E;
    LDA.W SamusProjectile_XPositions,X                                   ;A7B010;
    CLC                                                                  ;A7B013;
    ADC.W SamusProjectile_XRadii,X                                       ;A7B014;
    CMP.B DP_Temp16                                                      ;A7B017;
    BMI .next                                                            ;A7B019;
    LDA.W SamusProjectile_Types,X                                        ;A7B01B;
    BIT.W #$0F00                                                         ;A7B01E;
    BNE .notBeam                                                         ;A7B021;
    BIT.W #$0010                                                         ;A7B023;
    BEQ .next                                                            ;A7B026;
    LDA.L Kraid.mouthReopenFlags                                         ;A7B028;
    ORA.W #$0001                                                         ;A7B02C;
    STA.L Kraid.mouthReopenFlags                                         ;A7B02F;

  .notBeam:
    PHX                                                                  ;A7B033;
    TXA                                                                  ;A7B034;
    LSR                                                                  ;A7B035;
    STA.W CollisionIndex                                                 ;A7B036;
    PHP                                                                  ;A7B039;
    JSL.L NormalEnemyShotAI_NoDeathCheck_NoEnemyShotGraphic_External     ;A7B03A;
    PLP                                                                  ;A7B03E;
    PLX                                                                  ;A7B03F;
    LDA.W SamusProjectile_Directions,X                                   ;A7B040;
    ORA.W #$0010                                                         ;A7B043;
    STA.W SamusProjectile_Directions,X                                   ;A7B046;
    LDY.W #$0001                                                         ;A7B049;

  .next:
    DEX                                                                  ;A7B04C;
    DEX                                                                  ;A7B04D;
    BPL .loop                                                            ;A7B04E;

  .noProjectiles:
    PLX                                                                  ;A7B050;
    CPY.W #$0000                                                         ;A7B051;
    BNE .collision                                                       ;A7B054;
    RTS                                                                  ;A7B056;

  .collision:
    LDA.W #$0006                                                         ;A7B057;
    STA.L Kraid.hurtFrame                                                ;A7B05A;
    LDA.W #$0002                                                         ;A7B05E;
    STA.L Kraid.hurtFrameTimer                                           ;A7B061;
    LDA.L Kraid.mouthReopenFlags                                         ;A7B065;
    BIT.W #$0002                                                         ;A7B069;
    BEQ .notChargedBeam                                                  ;A7B06C;
    ORA.W #$0004                                                         ;A7B06E;
    STA.L Kraid.mouthReopenFlags                                         ;A7B071;

  .notChargedBeam:
    LDA.W Enemy.health                                                   ;A7B075;
    CMP.W #$0001                                                         ;A7B078;
    BMI .dead                                                            ;A7B07B;
    RTS                                                                  ;A7B07D;

  .dead:
    LDA.W Kraid.function                                                 ;A7B07E;
    CMP.W #KraidDeath_Initialize                                         ;A7B081;
    BPL .return                                                          ;A7B084;
    LDA.W #KraidDeath_Initialize                                         ;A7B086;
    STA.W Kraid.function                                                 ;A7B089;
    LDA.W #$0000                                                         ;A7B08C;
    STA.L Kraid.mouthReopenFlags                                         ;A7B08F;
    LDA.W Enemy.properties                                               ;A7B093;
    ORA.W #$0400                                                         ;A7B096;
    STA.W Enemy.properties                                               ;A7B099;
    LDA.W #$DFFF                                                         ;A7B09C;
    STA.B DP_Temp12                                                      ;A7B09F;
    JSR.W SetupKraidGFXWithTheTilePriorityCleared                        ;A7B0A1;
    LDX.W #$0000                                                         ;A7B0A4;

  .loopSetIntangible:
    LDA.W Enemy.properties,X                                             ;A7B0A7;
    ORA.W #$0400                                                         ;A7B0AA;
    STA.W Enemy.properties,X                                             ;A7B0AD;
    TXA                                                                  ;A7B0B0;
    CLC                                                                  ;A7B0B1;
    ADC.W #$0040                                                         ;A7B0B2;
    TAX                                                                  ;A7B0B5;
    CPX.W #$0180                                                         ;A7B0B6;
    BMI .loopSetIntangible                                               ;A7B0B9;
    LDA.W Kraid.instListPointer                                          ;A7B0BB;
    CMP.W #InstList_Kraid_DyingRoar_0                                    ;A7B0BE;
    BPL .return                                                          ;A7B0C1;
    CLC                                                                  ;A7B0C3;
    ADC.W #$003C                                                         ;A7B0C4;
    STA.W Kraid.instListPointer                                          ;A7B0C7;

  .return:
    RTS                                                                  ;A7B0CA;


;;; $B0CB: Spawn explosion enemy projectile ;;;
SpawnExplosionProjectile:
    LDA.W SamusProjectile_XPositions,X                                   ;A7B0CB;
    STA.B DP_Temp12                                                      ;A7B0CE;
    LDA.W SamusProjectile_YPositions,X                                   ;A7B0D0;
    STA.B DP_Temp14                                                      ;A7B0D3;
    LDA.W SamusProjectile_Types,X                                        ;A7B0D5;
    LDY.W #$001D                                                         ;A7B0D8;
    BIT.W #$0200                                                         ;A7B0DB;
    BNE .superMissile                                                    ;A7B0DE;
    LDY.W #$0006                                                         ;A7B0E0;

  .superMissile:
    TYA                                                                  ;A7B0E3;
    LDY.W #EnemyProjectile_MiscDust                                      ;A7B0E4;
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics                  ;A7B0E7;
    LDA.W #$003D                                                         ;A7B0EB;
    JSL.L QueueSound_Lib1_Max6                                           ;A7B0EE;
    RTS                                                                  ;A7B0F2;


;;; $B0F3: Kraid body / Samus collision handling ;;;
KraidBody_vs_Samus_CollisionHandling:
    LDA.W Kraid.function                                                 ;A7B0F3;
    CMP.W #KraidDeath_Initialize                                         ;A7B0F6;
    BPL .return0                                                         ;A7B0F9;
    LDA.W SamusXPosition                                                 ;A7B0FB;
    CLC                                                                  ;A7B0FE;
    ADC.W SamusXRadius                                                   ;A7B0FF;
    STA.B DP_Temp12                                                      ;A7B102;
    LDA.W SamusYPosition                                                 ;A7B104;
    SEC                                                                  ;A7B107;
    SBC.W Enemy.YPosition                                                ;A7B108;
    LDX.W #$0000                                                         ;A7B10B;

  .loop:
    CMP.W HitboxDefinitionTable_KraidBody_bottom,X                       ;A7B10E;
    BPL +                                                                ;A7B111;
    CMP.W HitboxDefinitionTable_KraidBody_top,X                          ;A7B113;
    BPL +                                                                ;A7B116;
    INX                                                                  ;A7B118;
    INX                                                                  ;A7B119;
    INX                                                                  ;A7B11A;
    INX                                                                  ;A7B11B;
    BRA .loop                                                            ;A7B11C;

+   LDA.W HitboxDefinitionTable_KraidBody_left,X                         ;A7B11E;
    CLC                                                                  ;A7B121;
    ADC.W Enemy.XPosition                                                ;A7B122;
    SEC                                                                  ;A7B125;
    SBC.B DP_Temp12                                                      ;A7B126;
    BPL .return1                                                         ;A7B128;
    LDA.W SamusXPosition                                                 ;A7B12A;
    CMP.W #$0028                                                         ;A7B12D;
    BMI .lessThan28                                                      ;A7B130;
    SEC                                                                  ;A7B132;
    SBC.W #$0008                                                         ;A7B133;
    STA.W SamusXPosition                                                 ;A7B136;
    STA.W SamusPreviousXPosition                                         ;A7B139;

  .lessThan28:
    LDA.W SamusYPosition                                                 ;A7B13C;
    SEC                                                                  ;A7B13F;
    SBC.W #$0008                                                         ;A7B140;
    CMP.L Kraid.minimumSamusEjectionYPosition                            ;A7B143;
    BPL +                                                                ;A7B147;
    LDA.L Kraid.minimumSamusEjectionYPosition                            ;A7B149;

+   STA.W SamusYPosition                                                 ;A7B14D;
    STA.W SamusPreviousYPosition                                         ;A7B150;
    JSR.W PushSamusBack                                                  ;A7B153;
    LDA.W SamusInvincibilityTimer                                        ;A7B156;
    BNE .return1                                                         ;A7B159;
    JSL.L NormalEnemyTouchAI_Internal                                    ;A7B15B;

  .return0:
    RTS                                                                  ;A7B15F;

  .return1:
    RTS                                                                  ;A7B160; >.<


;;; $B161: Kraid body hitbox definition table ;;;
HitboxDefinitionTable_KraidBody:
;        _________ Bottom boundary offset (following entry used as top)
;       |      ___ Left boundary offset
;       |     |
  .bottom:
    dw $03FF                                                             ;A7B161;
  .left:
    dw       $FFD0                                                       ;A7B163;
  .top:
    dw $0010,$FFD0                                                       ;A7B165;
    dw $0000,$FFE0
    dw $FFE0,$FFE8
    dw $FFD0,$FFF8
    dw $FFB0,$0000
    dw $FF90,$0008
    dw $8000,$0008


;;; $B181: Kraid body / projectile collision handling ;;;
KraidBody_vs_Projectile_CollisionHandling:
; See projectile loop note in KraidsMouth_vs_Projectile_CollisionHandling
    PHX                                                                  ;A7B181;
    LDA.W Kraid.function                                                 ;A7B182;
    CMP.W #KraidDeath_SinkThroughFloor                                   ;A7B185;
    BMI .lessThanC537                                                    ;A7B188;
    PLX                                                                  ;A7B18A;
    RTS                                                                  ;A7B18B;

  .lessThanC537:
    STZ.W Enemy.var4                                                     ;A7B18C;
    LDA.L Kraid.mouthReopenFlags                                         ;A7B18F;
    AND.W #$FFFE                                                         ;A7B193;
    STA.L Kraid.mouthReopenFlags                                         ;A7B196;
    STZ.B $30                                                            ;A7B19A;
    LDA.W Kraid.instListPointer                                          ;A7B19C;
    SEC                                                                  ;A7B19F;
    SBC.W #$0008                                                         ;A7B1A0;
    TAX                                                                  ;A7B1A3;
    LDA.W $0004,X                                                        ;A7B1A4;
    TAX                                                                  ;A7B1A7;
    LDA.W $0000,X                                                        ;A7B1A8;
    CLC                                                                  ;A7B1AB;
    ADC.W Enemy.XPosition                                                ;A7B1AC;
    STA.B DP_Temp16                                                      ;A7B1AF;
    LDA.W $0002,X                                                        ;A7B1B1;
    CLC                                                                  ;A7B1B4;
    ADC.W Enemy.YPosition                                                ;A7B1B5;
    STA.B DP_Temp14                                                      ;A7B1B8;
    LDA.W $0006,X                                                        ;A7B1BA;
    CLC                                                                  ;A7B1BD;
    ADC.W Enemy.YPosition                                                ;A7B1BE;
    STA.B DP_Temp12                                                      ;A7B1C1;
    LDA.W SamusProjectile_ProjectileCounter                              ;A7B1C3;
    BEQ .noProjectiles                                                   ;A7B1C6;
    ASL                                                                  ;A7B1C8;
    TAX                                                                  ;A7B1C9;

  .loop:
    LDA.W SamusProjectile_YPositions,X                                   ;A7B1CA;
    SEC                                                                  ;A7B1CD;
    SBC.W SamusProjectile_YRadii,X                                       ;A7B1CE;
    DEC                                                                  ;A7B1D1;
    CMP.B DP_Temp12                                                      ;A7B1D2;
    BPL .body                                                            ;A7B1D4;
    LDA.W SamusProjectile_YPositions,X                                   ;A7B1D6;
    CLC                                                                  ;A7B1D9;
    ADC.W SamusProjectile_YRadii,X                                       ;A7B1DA;
    CMP.B DP_Temp14                                                      ;A7B1DD;
    BMI .next                                                            ;A7B1DF;
    LDA.W SamusProjectile_XPositions,X                                   ;A7B1E1;
    CLC                                                                  ;A7B1E4;
    ADC.W SamusProjectile_XRadii,X                                       ;A7B1E5;
    CMP.B DP_Temp16                                                      ;A7B1E8;
    BMI .next                                                            ;A7B1EA;

  .hit:
    JSR.W SpawnExplosionProjectile                                       ;A7B1EC;
    LDA.W SamusProjectile_Directions,X                                   ;A7B1EF;
    ORA.W #$0010                                                         ;A7B1F2;
    STA.W SamusProjectile_Directions,X                                   ;A7B1F5;
    LDA.W SamusProjectile_Types,X                                        ;A7B1F8;
    BIT.W #$0010                                                         ;A7B1FB;
    BEQ +                                                                ;A7B1FE;
    LDA.L Kraid.mouthReopenFlags                                         ;A7B200;
    ORA.W #$0001                                                         ;A7B204;
    STA.L Kraid.mouthReopenFlags                                         ;A7B207;

+   INC.B DP_Temp30                                                      ;A7B20B;

  .next:
    DEX                                                                  ;A7B20D;
    DEX                                                                  ;A7B20E;
    BPL .loop                                                            ;A7B20F;

  .noProjectiles:
    PLX                                                                  ;A7B211;
    LDY.B DP_Temp30                                                      ;A7B212;
    CPY.W #$0000                                                         ;A7B214;
    BEQ .return                                                          ;A7B217;
    LDA.W Kraid.function                                                 ;A7B219;
    CMP.W #Function_Kraid_MainLoop_Thinking                              ;A7B21C;
    BNE .return                                                          ;A7B21F;
    LDA.W #Function_Kraid_KraidShot_InitializeEyeGlowing                 ;A7B221;
    STA.W Kraid.function                                                 ;A7B224;
    LDA.L Kraid.mouthReopenFlags                                         ;A7B227;
    BIT.W #$0001                                                         ;A7B22B;
    BEQ .return                                                          ;A7B22E;
    ORA.W #$0302                                                         ;A7B230;
    STA.L Kraid.mouthReopenFlags                                         ;A7B233;

  .return:
    RTS                                                                  ;A7B237;

  .body:
    LDA.W SamusProjectile_XPositions,X                                   ;A7B238;
    CLC                                                                  ;A7B23B;
    ADC.W SamusProjectile_XRadii,X                                       ;A7B23C;
    STA.B DP_Temp12                                                      ;A7B23F;
    LDA.W SamusProjectile_YPositions,X                                   ;A7B241;
    SEC                                                                  ;A7B244;
    SBC.W Enemy.YPosition                                                ;A7B245;
    LDY.W #$0000                                                         ;A7B248;

  .loopBody:
    CMP.W HitboxDefinitionTable_KraidBody_bottom,Y                       ;A7B24B;
    BPL +                                                                ;A7B24E;
    CMP.W HitboxDefinitionTable_KraidBody_top,Y                          ;A7B250;
    BPL +                                                                ;A7B253;
    INY                                                                  ;A7B255;
    INY                                                                  ;A7B256;
    INY                                                                  ;A7B257;
    INY                                                                  ;A7B258;
    BRA .loopBody                                                        ;A7B259;

+   LDA.W HitboxDefinitionTable_KraidBody_left,Y                         ;A7B25B;
    CLC                                                                  ;A7B25E;
    ADC.W Enemy.XPosition                                                ;A7B25F;
    SEC                                                                  ;A7B262;
    SBC.B DP_Temp12                                                      ;A7B263;
    BPL .next                                                            ;A7B265;
    BRA .hit                                                             ;A7B267;


if !FEATURE_KEEP_UNREFERENCED
;;; $B269: Unused. Handle projectile damage and sound ;;;
UNUSED_HandleProjectileDamageAndSound:
; This is like a cut-down or custom version of $A0:A6DE (handles beam damage, freezing, and sound) for enemy 0 (probably Kraid) specifically.
; There's no freeze handling, bomb and power bomb vulnerabilities are swapped, and Enemy.var4 is a triple damage flag
    PHX                                                                  ;A7B269;
    PHY                                                                  ;A7B26A;
    TXY                                                                  ;A7B26B;
    LDX.W EnemyIndex                                                     ;A7B26C;
    LDA.W SamusProjectile_Damages,Y                                      ;A7B26F;
    STA.W EnemySpritemapEntryXPositionDuringCollision                    ;A7B272;
    LDA.W SamusProjectile_Types,Y                                        ;A7B275;
    STA.B DP_Temp12                                                      ;A7B278;
    LDA.W SamusProjectile_Types,Y                                        ;A7B27A;
    BIT.W #$0018                                                         ;A7B27D;
    BEQ .notPlasmaOrCharge                                               ;A7B280;
    LDA.W #$0010                                                         ;A7B282;
    STA.W Enemy.invincibilityTimer                                       ;A7B285;

  .notPlasmaOrCharge:
    LDX.W Enemy.ID                                                       ;A7B288;
    LDA.L EnemyHeaders_vulnerabilities,X                                 ;A7B28B;
    BNE .vulnerabilities                                                 ;A7B28F;
    LDA.W #EnemyVulnerabilities_Default                                  ;A7B291;

  .vulnerabilities:
    STA.B DP_Temp14                                                      ;A7B294;
    LDA.B DP_Temp12                                                      ;A7B296;
    BIT.W #$0F00                                                         ;A7B298;
    BNE .notBeam                                                         ;A7B29B;
    AND.W #$00FF                                                         ;A7B29D;
    CLC                                                                  ;A7B2A0;
    ADC.B DP_Temp14                                                      ;A7B2A1;
    TAX                                                                  ;A7B2A3;
    LDA.L EnemyVulnerabilities_power,X                                   ;A7B2A4;
    BRA .determinedVulnerability                                         ;A7B2A8;

  .notBeam:
    AND.W #$0F00                                                         ;A7B2AA;
    CMP.W #$0100                                                         ;A7B2AD;
    BEQ .superMissile                                                    ;A7B2B0;
    CMP.W #$0200                                                         ;A7B2B2;
    BNE .missileEnd                                                      ;A7B2B5;

  .superMissile:
    XBA                                                                  ;A7B2B7;
    CLC                                                                  ;A7B2B8;
    ADC.B DP_Temp14                                                      ;A7B2B9;
    TAX                                                                  ;A7B2BB;
    LDA.L EnemyVulnerabilities_plasmaIceWave,X                           ;A7B2BC;
    BRA .determinedVulnerability                                         ;A7B2C0;

  .missileEnd:
    CMP.W #$0300                                                         ;A7B2C2;
    BNE .notPowerBomb                                                    ;A7B2C5;
    LDX.B DP_Temp14                                                      ;A7B2C7;
    LDA.L EnemyVulnerabilities_bomb,X                                    ;A7B2C9;
    BRA .determinedVulnerability                                         ;A7B2CD;

  .notPowerBomb:
    CMP.W #$0500                                                         ;A7B2CF;
    BNE .return                                                          ;A7B2D2;
    LDX.B DP_Temp14                                                      ;A7B2D4;
    LDA.L EnemyVulnerabilities_powerBomb,X                               ;A7B2D6;

  .determinedVulnerability:
    AND.W #$00FF                                                         ;A7B2DA;
    STA.W Temp_Unknown0E32                                               ;A7B2DD;
    BEQ .return                                                          ;A7B2E0;
    LDA.W EnemySpritemapEntryXPositionDuringCollision                    ;A7B2E2;
    LSR                                                                  ;A7B2E5;
    STA.W $4202                                                          ;A7B2E6;
    SEP #$20                                                             ;A7B2E9;
    LDA.W Temp_Unknown0E32                                               ;A7B2EB;
    STA.W $4203                                                          ;A7B2EE;
    NOP                                                                  ;A7B2F1;
    NOP                                                                  ;A7B2F2;
    NOP                                                                  ;A7B2F3;
    NOP                                                                  ;A7B2F4;
    NOP                                                                  ;A7B2F5;
    REP #$20                                                             ;A7B2F6;
    LDA.W $4216                                                          ;A7B2F8;
    BEQ .return                                                          ;A7B2FB;
    STA.W EnemySpritemapEntryXPositionDuringCollision                    ;A7B2FD;
    LDA.W Enemy.health                                                   ;A7B300;
    SEC                                                                  ;A7B303;
    SBC.W EnemySpritemapEntryXPositionDuringCollision                    ;A7B304;
    LDA.W Enemy.health                                                   ;A7B307;
    SEC                                                                  ;A7B30A;
    SBC.W EnemySpritemapEntryXPositionDuringCollision                    ;A7B30B;
    STA.W Enemy.health                                                   ;A7B30E;
    LDA.W Enemy.var4                                                     ;A7B311;
    BEQ .tripleDamageEnd                                                 ;A7B314;
    LDA.W Enemy.health                                                   ;A7B316;
    SEC                                                                  ;A7B319;
    SBC.W EnemySpritemapEntryXPositionDuringCollision                    ;A7B31A;
    SEC                                                                  ;A7B31D;
    SBC.W EnemySpritemapEntryXPositionDuringCollision                    ;A7B31E;
    BPL .storeHealth                                                     ;A7B321;
    LDA.W #$0000                                                         ;A7B323;

  .storeHealth:
    STA.W Enemy.health                                                   ;A7B326;

  .tripleDamageEnd:
    LDX.W Enemy.ID                                                       ;A7B329;
    LDA.L EnemyHeaders_cry,X                                             ;A7B32C;
    JSL.L QueueSound_Lib2_Max6                                           ;A7B330;

  .return:
    PLY                                                                  ;A7B334;
    PLX                                                                  ;A7B335;
    RTS                                                                  ;A7B336;
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $B337: Kraid palette handling ;;;
KraidPaletteHandling:
    PHX                                                                  ;A7B337;
    PHY                                                                  ;A7B338;
    LDA.W Enemy.health                                                   ;A7B339;
    CMP.W #$0001                                                         ;A7B33C;
    BPL .alive                                                           ;A7B33F;
    STA.L Kraid.hurtFrame                                                ;A7B341;
    BRA +                                                                ;A7B345;

  .alive:
    LDA.L Kraid.hurtFrame                                                ;A7B347;
    BEQ .return                                                          ;A7B34B;
    LDA.L Kraid.hurtFrameTimer                                           ;A7B34D;
    DEC                                                                  ;A7B351;
    STA.L Kraid.hurtFrameTimer                                           ;A7B352;
    BNE .return                                                          ;A7B356;
    LDA.W #$0002                                                         ;A7B358;
    STA.L Kraid.hurtFrameTimer                                           ;A7B35B;
    LDA.L Kraid.hurtFrame                                                ;A7B35F;
    DEC                                                                  ;A7B363;
    STA.L Kraid.hurtFrame                                                ;A7B364;

+   JSR.W KraidHurtFlashHandling                                         ;A7B368;
    JSR.W KraidHealthBasedPaletteHandling                                ;A7B36B;

  .return:
    PLY                                                                  ;A7B36E;
    PLX                                                                  ;A7B36F;
    RTS                                                                  ;A7B370;


;;; $B371: Kraid hurt flash handling ;;;
KraidHurtFlashHandling:
; This routine is redundant/incorrect, KraidHealthBasedPaletteHandling handles the flash frames properly
    LDY.W #$0000                                                         ;A7B371;
    LDA.L Kraid.hurtFrame                                                ;A7B374;
    BIT.W #$0001                                                         ;A7B378;
    BNE .loopSetup                                                       ;A7B37B;
    LDY.W #$0020                                                         ;A7B37D;

  .loopSetup:
    LDX.W #$0000                                                         ;A7B380;

  .loop:
    LDA.W Palette_Kraid_Sprite_HurtFlash,Y                               ;A7B383;
    STA.L Palettes_SpriteP7,X                                            ;A7B386;
    INX                                                                  ;A7B38A;
    INX                                                                  ;A7B38B;
    INY                                                                  ;A7B38C;
    INY                                                                  ;A7B38D;
    CPX.W #$0020                                                         ;A7B38E;
    BMI .loop                                                            ;A7B391;
    RTS                                                                  ;A7B393;


;;; $B394: Kraid health-based palette handling ;;;
KraidHealthBasedPaletteHandling:
    LDY.W #$0000                                                         ;A7B394;
    LDA.L Kraid.hurtFrame                                                ;A7B397;
    BIT.W #$0001                                                         ;A7B39B;
    BNE .hurtFlashFrame                                                  ;A7B39E;
    LDX.W #$000E                                                         ;A7B3A0;
    LDA.W Enemy.health                                                   ;A7B3A3;

  .loop:
    CMP.L Kraid.maxHealth_1_8,X                                          ;A7B3A6;
    BPL .getIndex                                                        ;A7B3AA;
    DEX                                                                  ;A7B3AC;
    DEX                                                                  ;A7B3AD;
    BNE .loop                                                            ;A7B3AE;

  .getIndex:
    INX                                                                  ;A7B3B0;
    INX                                                                  ;A7B3B1;
    TXA                                                                  ;A7B3B2;
    ASL                                                                  ;A7B3B3;
    ASL                                                                  ;A7B3B4;
    ASL                                                                  ;A7B3B5;
    ASL                                                                  ;A7B3B6;
    TAY                                                                  ;A7B3B7;

  .hurtFlashFrame:
    LDX.W #$0000                                                         ;A7B3B8;

  .loopPalette:
    LDA.W Palette_Kraid_BG_HurtFlash,Y                                   ;A7B3BB;
    STA.L Palettes_BG12P7,X                                              ;A7B3BE;
    LDA.W Palette_Kraid_Sprite_HurtFlash,Y                               ;A7B3C2;
    STA.L Palettes_SpriteP7,X                                            ;A7B3C5;
    INY                                                                  ;A7B3C9;
    INY                                                                  ;A7B3CA;
    INX                                                                  ;A7B3CB;
    INX                                                                  ;A7B3CC;
    CPX.W #$0020                                                         ;A7B3CD;
    BMI .loopPalette                                                     ;A7B3D0;
    RTS                                                                  ;A7B3D2;


;;; $B3D3: Kraid BG palette 7 ;;;
Palette_Kraid_BG_HurtFlash:
; [Kraid hurt frame] is odd
    dw $7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF                   ;A7B3D3;
    dw $7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF                   ;A7B3D3;

Palette_Kraid_BG_1_8:
; [Kraid health] < [Kraid max health * 2/8]
    dw $0000,$559D,$1816,$100D,$127A,$0E17,$0DD3,$0970                   ;A7B3F3;
    dw $092D,$04CA,$0486,$0023,$0443,$3E52,$4AD5,$0000                   ;A7B403;

Palette_Kraid_BG_2_8:
; [Kraid health] >= [Kraid max health * 2/8]
    dw $3800,$559D,$1816,$100D,$1A9B,$1637,$11F3,$0D8F                   ;A7B413;
    dw $0D4C,$08E9,$04A6,$0043,$0443,$4273,$52F6,$0000                   ;A7B423;

Palette_Kraid_BG_3_8:
; [Kraid health] >= [Kraid max health * 3/8]
    dw $3800,$559D,$1816,$100D,$22DB,$1A77,$1A12,$15AE                   ;A7B433;
    dw $116C,$0D09,$08A6,$0444,$0423,$4A94,$5B38,$0000                   ;A7B443;

Palette_Kraid_BG_4_8:
; [Kraid health] >= [Kraid max health * 4/8]
    dw $3800,$559D,$1816,$100D,$2AFC,$2297,$1E32,$19CD                   ;A7B453;
    dw $158B,$1128,$08C6,$0464,$0423,$4EB5,$6359,$0000                   ;A7B463;

Palette_Kraid_BG_5_8:
; [Kraid health] >= [Kraid max health * 5/8]
    dw $3800,$559D,$1816,$100D,$331D,$2AB7,$2A91,$1E0C                   ;A7B473;
    dw $19AA,$1148,$0CE5,$0484,$0023,$52B5,$677B,$0000                   ;A7B483;

Palette_Kraid_BG_6_8:
; [Kraid health] >= [Kraid max health * 6/8]
    dw $3800,$559D,$1816,$100D,$3B3E,$32D7,$32B0,$222B                   ;A7B493;
    dw $1DC9,$1567,$0D05,$04A4,$0023,$56D6,$6F9C,$0000                   ;A7B4A3;

Palette_Kraid_BG_7_8:
; [Kraid health] >= [Kraid max health * 7/8]
    dw $3800,$559D,$1816,$100D,$437E,$3717,$32B0,$2A4A                   ;A7B4B3;
    dw $21E9,$1987,$1105,$08A5,$0003,$5EF7,$77DE,$0000                   ;A7B4C3;

Palette_Kraid_BG_8_8:
; [Kraid health] >= [Kraid max health * 8/8]
    dw $3800,$559D,$1816,$100D,$4B9F,$3F37,$36D0,$2E69                   ;A7B4D3;
    dw $2608,$1DA6,$1125,$08C5,$0003,$6318,$7FFF,$0000                   ;A7B4E3;

Palette_Kraid_Death:
    dw $3800,$0807,$0404,$0000,$127A,$0E17,$0DD3,$0970                   ;A7B4F3;
    dw $092D,$04CA,$0486,$0023,$0443,$3E52,$4AD5,$0000                   ;A7B503;


;;; $B513: Kraid sprite palette 7 ;;;
Palette_Kraid_Sprite_HurtFlash:
; [Kraid hurt frame] is odd
    dw $7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF                   ;A7B513;
    dw $7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF                   ;A7B523;

Palette_Kraid_Sprite_1_8:
; [Kraid health] < [Kraid max health * 2/8]
    dw $0000,$559D,$1816,$100D,$127A,$0E17,$0DD3,$0970                   ;A7B533;
    dw $092D,$04CA,$0486,$0023,$0443,$3E52,$4AD5,$0000                   ;A7B543;

Palette_Kraid_Sprite_2_8:
; [Kraid health] >= [Kraid max health * 2/8]
    dw $3800,$559D,$1816,$100D,$1A9B,$1637,$11F3,$0D8F                   ;A7B553;
    dw $0D4C,$08E9,$04A6,$0043,$0443,$4273,$52F6,$0000                   ;A7B563;

Palette_Kraid_Sprite_3_8:
; [Kraid health] >= [Kraid max health * 3/8]
    dw $3800,$559D,$1816,$100D,$22DB,$1A77,$1A12,$15AE                   ;A7B573;
    dw $116C,$0D09,$08A6,$0444,$0423,$4A94,$5B38,$0000                   ;A7B583;

Palette_Kraid_Sprite_4_8:
; [Kraid health] >= [Kraid max health * 4/8]
    dw $3800,$559D,$1816,$100D,$2AFC,$2297,$1E32,$19CD                   ;A7B593;
    dw $158B,$1128,$08C6,$0464,$0423,$4EB5,$6359,$0000                   ;A7B5A3;

Palette_Kraid_Sprite_5_8:
; [Kraid health] >= [Kraid max health * 5/8]
    dw $3800,$559D,$1816,$100D,$331D,$2AB7,$2A91,$1E0C                   ;A7B5B3;
    dw $19AA,$1148,$0CE5,$0484,$0023,$52B5,$677B,$0000                   ;A7B5C3;

Palette_Kraid_Sprite_6_8:
; [Kraid health] >= [Kraid max health * 6/8]
    dw $3800,$559D,$1816,$100D,$3B3E,$32D7,$32B0,$222B                   ;A7B5D3;
    dw $1DC9,$1567,$0D05,$04A4,$0023,$56D6,$6F9C,$0000                   ;A7B5E3;

Palette_Kraid_Sprite_7_8:
; [Kraid health] >= [Kraid max health * 7/8]
    dw $3800,$559D,$1816,$100D,$437E,$3717,$32B0,$2A4A                   ;A7B5F3;
    dw $21E9,$1987,$1105,$08A5,$0003,$5EF7,$77DE,$0000                   ;A7B603;

Palette_Kraid_Sprite_8_8:
; [Kraid health] >= [Kraid max health * 8/8]
    dw $3800,$559D,$1816,$100D,$4B9F,$3F37,$36D0,$2E69                   ;A7B613;
    dw $2608,$1DA6,$1125,$08C5,$0003,$6318,$7FFF,$0000                   ;A7B623;


;;; $B633: Instruction - NOP ;;;
Instruction_Kraid_NOP_A7B633:
    PHX                                                                  ;A7B633;
    PLX                                                                  ;A7B634;
    RTL                                                                  ;A7B635;


;;; $B636: Instruction - decrement Kraid Y position ;;;
Instruction_Kraid_DecrementYPosition:
    PHX                                                                  ;A7B636;
    DEC.W Enemy.YPosition                                                ;A7B637;
    PLX                                                                  ;A7B63A;
    RTL                                                                  ;A7B63B;


;;; $B63C: Instruction - increment Kraid Y position, set screen shaking ;;;
Instruction_Kraid_IncrementYPosition_SetScreenShaking:
    PHX                                                                  ;A7B63C;
    INC.W Enemy.YPosition                                                ;A7B63D;
    LDA.W #$0001                                                         ;A7B640;
    STA.W EarthquakeType                                                 ;A7B643;
    LDA.W #$000A                                                         ;A7B646;
    STA.W EarthquakeTimer                                                ;A7B649;
    PLX                                                                  ;A7B64C;
    RTL                                                                  ;A7B64D;


;;; $B64E: Instruction - queue quake sound effect ;;;
Instruction_Kraid_QueueSFX76_Lib2_Max6:
    PHX                                                                  ;A7B64E;
    PHY                                                                  ;A7B64F;
    LDA.W #$0076                                                         ;A7B650;
    JSL.L QueueSound_Lib2_Max6                                           ;A7B653;
    PLY                                                                  ;A7B657;
    PLX                                                                  ;A7B658;
    RTL                                                                  ;A7B659;


;;; $B65A: Instruction - Kraid X position -= 3 ;;;
Instruction_Kraid_XPositionMinus3:
    PHX                                                                  ;A7B65A;
    LDA.W Enemy.XPosition                                                ;A7B65B;
    SEC                                                                  ;A7B65E;
    SBC.W KraidForwardsSpeed                                             ;A7B65F;
    STA.W Enemy.XPosition                                                ;A7B662;
    PLX                                                                  ;A7B665;
    RTL                                                                  ;A7B666;


;;; $B667: Instruction - Kraid X position -= 3 ;;;
Instruction_Kraid_XPositionMinus3_duplicate:
    PHX                                                                  ;A7B667;
    LDA.W Enemy.XPosition                                                ;A7B668;
    SEC                                                                  ;A7B66B;
    SBC.W KraidForwardsSpeed                                             ;A7B66C;
    STA.W Enemy.XPosition                                                ;A7B66F;
    PLX                                                                  ;A7B672;
    RTL                                                                  ;A7B673;


;;; $B674: Instruction - Kraid X position += 3 ;;;
Instruction_Kraid_XPositionPlus3:
    PHX                                                                  ;A7B674;
    PHY                                                                  ;A7B675;
    LDA.W KraidBackwardsSpeed                                            ;A7B676;
    CLC                                                                  ;A7B679;
    ADC.W Enemy.XPosition                                                ;A7B67A;
    STA.W Enemy.XPosition                                                ;A7B67D;
    PLY                                                                  ;A7B680;
    PLX                                                                  ;A7B681;
    RTL                                                                  ;A7B682;


if !FEATURE_KEEP_UNREFERENCED
;;; $B683: Unused. Instruction - move Kraid right ;;;
UNUSED_Instruction_Kraid_MoveRight_A7B683:
    PHX                                                                  ;A7B683;
    PHY                                                                  ;A7B684;
    LDA.W Enemy.XPosition                                                ;A7B685;
    CMP.W #$0140                                                         ;A7B688;
    BMI .leftScreen                                                      ;A7B68B;
    LDA.L Kraid.targetXPosition                                          ;A7B68D;
    DEC                                                                  ;A7B691;
    STA.L Kraid.targetXPosition                                          ;A7B692;
    BNE .return                                                          ;A7B696;

  .leftScreen:
    LDX.W #$0000                                                         ;A7B698;
    STZ.B DP_Temp12                                                      ;A7B69B;
    LDA.W UNUSED_KraidBackwardsFastSpeed_A7A922                          ;A7B69D;
    STA.B DP_Temp14                                                      ;A7B6A0;
    JSL.L MoveEnemyRightBy_14_12_IgnoreSlopes                            ;A7B6A2;
    BCS .collision                                                       ;A7B6A6;

  .return:
    PLY                                                                  ;A7B6A8;
    PLX                                                                  ;A7B6A9;
    RTL                                                                  ;A7B6AA;

  .collision:
    LDA.W #$0000                                                         ;A7B6AB;
    STA.W EarthquakeType                                                 ;A7B6AE;
    LDA.W #$0007                                                         ;A7B6B1;
    STA.W EarthquakeTimer                                                ;A7B6B4;
    LDA.W Enemy.XPosition                                                ;A7B6B7;
    STA.W Enemy[5].XPosition                                             ;A7B6BA;
    BRA .return                                                          ;A7B6BD;
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $B6BF: Kraid function - Kraid shot - initialise Kraid eye glowing ;;;
Function_Kraid_KraidShot_InitializeEyeGlowing:
    LDA.W #Function_Kraid_KraidShot_KraidsMouthIsOpen                    ;A7B6BF;
    STA.W Kraid.function                                                 ;A7B6C2;
    LDA.W #Function_Kraid_KraidShot_GlowEye                              ;A7B6C5;
    STA.W Kraid.function                                                 ;A7B6C8;
    LDA.W #InstList_Kraid_EyeGlowing_1                                   ;A7B6CB;
    STA.W Kraid.instListPointer                                          ;A7B6CE;
    LDA.W InstList_Kraid_EyeGlowing_0                                    ;A7B6D1;
    STA.W Kraid.instructionTimer                                         ;A7B6D4; fallthrough to Function_Kraid_KraidShot_GlowEye


;;; $B6D7: Kraid function - Kraid shot - glow Kraid's eye ;;;
Function_Kraid_KraidShot_GlowEye:
    PHX                                                                  ;A7B6D7;
    PHY                                                                  ;A7B6D8;
    JSR.W KraidInstListHandling                                          ;A7B6D9;
    CMP.W #$FFFF                                                         ;A7B6DC;
    BNE .notTerminator                                                   ;A7B6DF;
    LDA.W #$0100                                                         ;A7B6E1;
    LDA.W Kraid.instructionTimer                                         ;A7B6E4;

  .notTerminator:
    LDX.W #$00E2                                                         ;A7B6E7;
    LDY.W #$0000                                                         ;A7B6EA;

  .loop:
    LDA.L Palettes,X                                                     ;A7B6ED;
    AND.W #$001F                                                         ;A7B6F1;
    CLC                                                                  ;A7B6F4;
    ADC.W #$0001                                                         ;A7B6F5;
    CMP.W #$001F                                                         ;A7B6F8;
    BMI +                                                                ;A7B6FB;
    INY                                                                  ;A7B6FD;
    LDA.W #$001F                                                         ;A7B6FE;

+   STA.B DP_Temp12                                                      ;A7B701;
    LDA.L Palettes,X                                                     ;A7B703;
    AND.W #$03E0                                                         ;A7B707;
    CLC                                                                  ;A7B70A;
    ADC.W #$0020                                                         ;A7B70B;
    CMP.W #$03E0                                                         ;A7B70E;
    BMI +                                                                ;A7B711;
    INY                                                                  ;A7B713;
    LDA.W #$03E0                                                         ;A7B714;

+   STA.B DP_Temp14                                                      ;A7B717;
    LDA.L Palettes,X                                                     ;A7B719;
    AND.W #$FC00                                                         ;A7B71D;
    ORA.B DP_Temp12                                                      ;A7B720;
    ORA.B DP_Temp14                                                      ;A7B722;
    STA.L Palettes,X                                                     ;A7B724;
    INX                                                                  ;A7B728;
    INX                                                                  ;A7B729;
    CPX.W #$00E8                                                         ;A7B72A;
    BMI .loop                                                            ;A7B72D;
    CPY.W #$0006                                                         ;A7B72F;
    BMI .return                                                          ;A7B732;
    LDA.W #Function_Kraid_KraidShot_UnglowEye                            ;A7B734;
    STA.W Kraid.function                                                 ;A7B737;

  .return:
    PLY                                                                  ;A7B73A;
    PLX                                                                  ;A7B73B;
    RTL                                                                  ;A7B73C;


;;; $B73D: Kraid function - Kraid shot - unglow Kraid's eye ;;;
Function_Kraid_KraidShot_UnglowEye:
    PHX                                                                  ;A7B73D;
    PHY                                                                  ;A7B73E;
    LDX.W #$000E                                                         ;A7B73F;
    LDA.W Enemy.health                                                   ;A7B742;

  .loopHealth:
    CMP.L Kraid.maxHealth_1_8,X                                          ;A7B745;
    BPL .getIndexY                                                       ;A7B749;
    DEX                                                                  ;A7B74B;
    DEX                                                                  ;A7B74C;
    BNE .loopHealth                                                      ;A7B74D;

  .getIndexY:
    INX                                                                  ;A7B74F;
    INX                                                                  ;A7B750;
    TXA                                                                  ;A7B751;
    ASL                                                                  ;A7B752;
    ASL                                                                  ;A7B753;
    ASL                                                                  ;A7B754;
    ASL                                                                  ;A7B755;
    TAY                                                                  ;A7B756;
    LDX.W #$00E2                                                         ;A7B757;
    STZ.B DP_Temp14                                                      ;A7B75A;

  .loop:
    LDA.L Palettes,X                                                     ;A7B75C;
    AND.W #$001F                                                         ;A7B760;
    STA.B DP_Temp12                                                      ;A7B763;
    LDA.W Palette_Kraid_BG_HurtFlash+2,Y                                 ;A7B765;
    AND.W #$001F                                                         ;A7B768;
    CMP.B DP_Temp12                                                      ;A7B76B;
    BEQ +                                                                ;A7B76D;
    INC.B DP_Temp14                                                      ;A7B76F;
    LDA.L Palettes,X                                                     ;A7B771;
    DEC                                                                  ;A7B775;
    STA.L Palettes,X                                                     ;A7B776;

+   LDA.L Palettes,X                                                     ;A7B77A;
    AND.W #$03E0                                                         ;A7B77E;
    STA.B DP_Temp12                                                      ;A7B781;
    LDA.W Palette_Kraid_BG_HurtFlash+2,Y                                 ;A7B783;
    AND.W #$03E0                                                         ;A7B786;
    CMP.B DP_Temp12                                                      ;A7B789;
    BEQ .next                                                            ;A7B78B;
    INC.B DP_Temp14                                                      ;A7B78D;
    LDA.L Palettes,X                                                     ;A7B78F;
    SEC                                                                  ;A7B793;
    SBC.W #$0020                                                         ;A7B794;
    STA.L Palettes,X                                                     ;A7B797;

  .next:
    INX                                                                  ;A7B79B;
    INX                                                                  ;A7B79C;
    INY                                                                  ;A7B79D;
    INY                                                                  ;A7B79E;
    CPX.W #$00E8                                                         ;A7B79F;
    BMI .loop                                                            ;A7B7A2;
    LDA.B DP_Temp14                                                      ;A7B7A4;
    BNE .return                                                          ;A7B7A6;
    LDA.W #Function_Kraid_KraidShot_KraidsMouthIsOpen                    ;A7B7A8;
    STA.W Kraid.function                                                 ;A7B7AB;
    LDA.W #InstList_Kraid_Roar_1                                         ;A7B7AE;
    STA.W Kraid.instListPointer                                          ;A7B7B1;
    LDA.W InstList_Kraid_Roar_0                                          ;A7B7B4;
    STA.W Kraid.instructionTimer                                         ;A7B7B7;

  .return:
    PLY                                                                  ;A7B7BA;
    PLX                                                                  ;A7B7BB;
    RTL                                                                  ;A7B7BC;


;;; $B7BD: Main AI - enemy $E2FF (Kraid arm) ;;;
MainAI_KraidArm:
    LDA.W Layer1YPosition                                                ;A7B7BD;
    CLC                                                                  ;A7B7C0;
    ADC.W #$00E0                                                         ;A7B7C1;
    STA.B DP_Temp12                                                      ;A7B7C4;
    LDA.W Enemy.YPosition                                                ;A7B7C6;
    SEC                                                                  ;A7B7C9;
    SBC.W #$002C                                                         ;A7B7CA;
    STA.W Enemy[1].YPosition                                             ;A7B7CD;
    TAY                                                                  ;A7B7D0;
    LDA.W Enemy[1].properties                                            ;A7B7D1;
    ORA.W #$0100                                                         ;A7B7D4;
    CPY.W Layer1YPosition                                                ;A7B7D7;
    BMI +                                                                ;A7B7DA;
    CPY.B DP_Temp12                                                      ;A7B7DC;
    BPL +                                                                ;A7B7DE;
    AND.W #$FEFF                                                         ;A7B7E0;

+   STA.W Enemy[1].properties                                            ;A7B7E3;
    LDA.W Enemy.XPosition                                                ;A7B7E6;
    CLC                                                                  ;A7B7E9;
    ADC.W #$0000                                                         ;A7B7EA;
    STA.W Enemy[1].XPosition                                             ;A7B7ED;
    LDA.L Kraid.mouthReopenFlags                                         ;A7B7F0;
    BIT.W #$FF00                                                         ;A7B7F4;
    BEQ .return                                                          ;A7B7F7;
    LDA.W Enemy[1].instTimer                                             ;A7B7F9;
    INC                                                                  ;A7B7FC;
    STA.W Enemy[1].instTimer                                             ;A7B7FD;

  .return:
    RTL                                                                  ;A7B800;


;;; $B801: Main AI - enemy $E33F (Kraid top lint) ;;;
MainAI_KraidLintTop:
    LDX.W #$0080                                                         ;A7B801;
    LDA.W #$7FFF                                                         ;A7B804;
    STA.W Enemy.instTimer,X                                              ;A7B807;
    JMP.W MainAI_KraidLintCommon                                         ;A7B80A;


;;; $B80D: Main AI - enemy $E37F (Kraid middle lint) ;;;
MainAI_KraidLintMiddle:
    LDX.W #$00C0                                                         ;A7B80D;
    LDA.W #$7FFF                                                         ;A7B810;
    STA.W Enemy.instTimer,X                                              ;A7B813;
    JMP.W MainAI_KraidLintCommon                                         ;A7B816;


;;; $B819: Main AI - enemy $E3BF (Kraid bottom lint) ;;;
MainAI_KraidLintBottom:
    LDX.W #$0100                                                         ;A7B819;
    LDA.W #$7FFF                                                         ;A7B81C;
    STA.W Enemy.instTimer,X                                              ;A7B81F; fallthrough to MainAI_KraidLintCommon


;;; $B822: Kraid lint main AI ;;;
MainAI_KraidLintCommon:
    JSR.W KraidLint_vs_Samus_CollisionHandling                           ;A7B822;
    LDA.W Layer1YPosition                                                ;A7B825;
    CLC                                                                  ;A7B828;
    ADC.W #$00E0                                                         ;A7B829;
    STA.B DP_Temp12                                                      ;A7B82C;
    JMP.W (Kraid.function,X)                                             ;A7B82E;


RTL_A7B831:
    RTL                                                                  ;A7B831;


;;; $B832: Kraid lint function - produce lint ;;;
Function_KraidLint_ProduceLint:
    LDA.W Enemy.properties,X                                             ;A7B832;
    AND.W #$FEFF                                                         ;A7B835; >.< #$FAFF
    AND.W #$FBFF                                                         ;A7B838;
    STA.W Enemy.properties,X                                             ;A7B83B;
    LDA.W Enemy.XPosition                                                ;A7B83E;
    CLC                                                                  ;A7B841;
    ADC.W Kraid.instructionTimer,X                                       ;A7B842;
    SEC                                                                  ;A7B845;
    SBC.W Kraid.instListPointer,X                                        ;A7B846;
    STA.W Enemy.XPosition,X                                              ;A7B849;
    LDA.W Kraid.instListPointer,X                                        ;A7B84C;
    CLC                                                                  ;A7B84F;
    ADC.W #$0001                                                         ;A7B850;
    STA.W Kraid.instListPointer,X                                        ;A7B853;
    CMP.W #$0020                                                         ;A7B856;
    BMI .return                                                          ;A7B859;
    LDA.W #Function_KraidLint_ChargeLint                                 ;A7B85B;
    STA.W Kraid.function,X                                               ;A7B85E;
    LDA.W #$001E                                                         ;A7B861;
    STA.W Kraid.functionTimer,X                                          ;A7B864;

  .return:
    RTL                                                                  ;A7B867;


;;; $B868: Kraid lint function - charge lint ;;;
Function_KraidLint_ChargeLint:
    LDY.W #$0000                                                         ;A7B868;
    LDA.W Kraid.functionTimer,X                                          ;A7B86B;
    BIT.W #$0001                                                         ;A7B86E;
    BEQ .zeroTimer                                                       ;A7B871;
    LDY.W #$0E00                                                         ;A7B873;

  .zeroTimer:
    TYA                                                                  ;A7B876;
    STA.W Enemy.palette,X                                                ;A7B877;
    LDA.W Enemy.XPosition                                                ;A7B87A;
    CLC                                                                  ;A7B87D;
    ADC.W Kraid.instructionTimer,X                                       ;A7B87E;
    SEC                                                                  ;A7B881;
    SBC.W Kraid.instListPointer,X                                        ;A7B882;
    STA.W Enemy.XPosition,X                                              ;A7B885;
    DEC.W Kraid.functionTimer,X                                          ;A7B888;
    BNE .return                                                          ;A7B88B;
    LDA.W #Function_KraidLint_FireLint                                   ;A7B88D;
    STA.W Kraid.function,X                                               ;A7B890;
    LDA.W #$001F                                                         ;A7B893;
    JSL.L QueueSound_Lib3_Max6                                           ;A7B896;

  .return:
    RTL                                                                  ;A7B89A;


;;; $B89B: Kraid lint function - fire lint ;;;
Function_KraidLint_FireLint:
    LDA.W Enemy.XSubPosition,X                                           ;A7B89B;
    SEC                                                                  ;A7B89E;
    SBC.W KraidLint_XSubSpeed                                            ;A7B89F;
    STA.W Enemy.XSubPosition,X                                           ;A7B8A2;
    LDA.W Enemy.XPosition,X                                              ;A7B8A5;
    SBC.W KraidLint_XSpeed                                               ;A7B8A8;
    STA.W Enemy.XPosition,X                                              ;A7B8AB;
    CMP.W #$0038                                                         ;A7B8AE;
    BPL .greaterThanEqualTo38                                            ;A7B8B1;
    PHA                                                                  ;A7B8B3;
    LDA.W Enemy.properties,X                                             ;A7B8B4;
    ORA.W #$0400                                                         ;A7B8B7;
    STA.W Enemy.properties,X                                             ;A7B8BA;
    PLA                                                                  ;A7B8BD;

  .greaterThanEqualTo38:
    CMP.W #$0020                                                         ;A7B8BE;
    BPL .greaterThanEqualTo20                                            ;A7B8C1;
    LDA.W Enemy.properties,X                                             ;A7B8C3;
    ORA.W #$0100                                                         ;A7B8C6;
    STA.W Enemy.properties,X                                             ;A7B8C9;
    LDA.W #Function_KraidNail_HorizontallyAlignEnemyToKraid              ;A7B8CC;
    STA.W Kraid.function,X                                               ;A7B8CF;
    LDA.W #$012C                                                         ;A7B8D2;
    STA.W Kraid.functionTimer,X                                          ;A7B8D5;
    LDA.W #Function_KraidLint_ProduceLint                                ;A7B8D8;
    STA.L Kraid.nextFunction,X                                           ;A7B8DB;
    STZ.W Kraid.instListPointer,X                                        ;A7B8DF;

  .greaterThanEqualTo20:
    JSL.L CheckIfEnemyIsTouchingSamusFromBelow                           ;A7B8E2;
    AND.W #$FFFF                                                         ;A7B8E6;
    BEQ .return                                                          ;A7B8E9;
    LDA.W ExtraSamusXSubDisplacement                                     ;A7B8EB;
    SEC                                                                  ;A7B8EE;
    SBC.W KraidLint_XSubSpeed                                            ;A7B8EF;
    STA.W ExtraSamusXSubDisplacement                                     ;A7B8F2;
    LDA.W ExtraSamusXDisplacement                                        ;A7B8F5;
    SBC.W KraidLint_XSpeed                                               ;A7B8F8;
    CMP.W #$FFF0                                                         ;A7B8FB;
    BPL .storeExtraDisplacement                                          ;A7B8FE;
    LDA.W #$FFF0                                                         ;A7B900;

  .storeExtraDisplacement:
    STA.W ExtraSamusXDisplacement                                        ;A7B903;

  .return:
    RTL                                                                  ;A7B906;


;;; $B907: Kraid fingernail function - wait until top lint X position >= 100h ;;;
Function_KraidNail_WaitUntilTopLintXPosition100Plus:
    LDA.W Enemy[2].XPosition                                             ;A7B907;
    CMP.W #$0100                                                         ;A7B90A;
    BMI .return                                                          ;A7B90D;
    LDA.L Kraid.nextFunction,X                                           ;A7B90F;
    STA.W Kraid.function,X                                               ;A7B913;
    LDA.W Enemy.properties,X                                             ;A7B916;
    AND.W #$FEFF                                                         ;A7B919; >.< #$FAFF
    AND.W #$FBFF                                                         ;A7B91C;
    STA.W Enemy.properties,X                                             ;A7B91F;

  .return:
    RTL                                                                  ;A7B922;


;;; $B923: Kraid lint function - horizontally align enemy to Kraid ;;;
Function_KraidNail_HorizontallyAlignEnemyToKraid:
    LDA.W Enemy.XPosition                                                ;A7B923;
    SEC                                                                  ;A7B926;
    SBC.W Enemy.XHitboxRadius,X                                          ;A7B927;
    STA.W Enemy.XPosition,X                                              ;A7B92A; fallthrough to Function_Kraid_HandleFunctionTimer


;;; $B92D: Kraid enemy function - handle Kraid enemy function timer ;;;
Function_Kraid_HandleFunctionTimer:
    LDA.W Kraid.functionTimer,X                                          ;A7B92D;
    BEQ .return                                                          ;A7B930;
    DEC.W Kraid.functionTimer,X                                          ;A7B932;
    BNE .return                                                          ;A7B935;
    LDA.L Kraid.nextFunction,X                                           ;A7B937;
    STA.W Kraid.function,X                                               ;A7B93B;

  .return:
    RTL                                                                  ;A7B93E;


;;; $B93F: Kraid foot function - start retreat ;;;
Function_KraidFoot_StartRetreat:
    LDX.W EnemyIndex                                                     ;A7B93F;
    LDA.W Kraid.functionTimer,X                                          ;A7B942;
    BEQ .return                                                          ;A7B945;
    DEC.W Kraid.functionTimer,X                                          ;A7B947;
    BNE .return                                                          ;A7B94A;
    LDA.L Kraid.nextFunction,X                                           ;A7B94C;
    STA.W Kraid.function,X                                               ;A7B950;
    LDA.W #InstList_KraidFoot_KraidIsBig_WalkingBackwards_0              ;A7B953;
    STA.W Enemy.instList,X                                               ;A7B956;
    LDA.W #$0001                                                         ;A7B959;
    STA.W Enemy.instTimer,X                                              ;A7B95C;

  .return:
    RTL                                                                  ;A7B95F;


;;; $B960: Kraid foot function - first phase - thinking ;;;
Function_KraidFoot_Phase1_Thinking:
    JSR.W HandleKraidPhase1                                              ;A7B960;
    BRA Function_Kraid_HandleFunctionTimer                               ;A7B963;


;;; $B965: Kraid function - process Kraid instruction ;;;
Function_Kraid_ProcessKraidInstruction:
    JSR.W KraidInstListHandling                                          ;A7B965;
    BRA Function_Kraid_HandleFunctionTimer                               ;A7B968;


;;; $B96A: Kraid lint / Samus collision handling ;;;
KraidLint_vs_Samus_CollisionHandling:
    LDA.W Enemy.properties,X                                             ;A7B96A;
    BIT.W #$0400                                                         ;A7B96D;
    BEQ .notIntangible                                                   ;A7B970;
    RTS                                                                  ;A7B972;

  .notIntangible:
    LDA.W SamusInvincibilityTimer                                        ;A7B973;
    BNE .return                                                          ;A7B976;
    LDA.W Enemy.XPosition,X                                              ;A7B978;
    CLC                                                                  ;A7B97B;
    ADC.W Hitbox_KraidLint+2                                             ;A7B97C;
    SEC                                                                  ;A7B97F;
    SBC.W #$0002                                                         ;A7B980;
    STA.B DP_Temp12                                                      ;A7B983;
    LDA.W SamusXPosition                                                 ;A7B985;
    CLC                                                                  ;A7B988;
    ADC.W SamusXRadius                                                   ;A7B989;
    CMP.B DP_Temp12                                                      ;A7B98C;
    BMI .return                                                          ;A7B98E;
    LDA.W SamusXPosition                                                 ;A7B990;
    SEC                                                                  ;A7B993;
    SBC.W SamusXRadius                                                   ;A7B994;
    CMP.B DP_Temp12                                                      ;A7B997;
    BPL .return                                                          ;A7B999;
    LDA.W Enemy.YPosition,X                                              ;A7B99B;
    CLC                                                                  ;A7B99E;
    ADC.W Hitbox_KraidLint+4                                             ;A7B99F;
    CLC                                                                  ;A7B9A2;
    ADC.W #$0002                                                         ;A7B9A3;
    STA.B DP_Temp16                                                      ;A7B9A6;
    LDA.W SamusYPosition                                                 ;A7B9A8;
    CLC                                                                  ;A7B9AB;
    ADC.W SamusYRadius                                                   ;A7B9AC;
    CMP.B DP_Temp16                                                      ;A7B9AF;
    BMI .return                                                          ;A7B9B1;
    LDA.W Enemy.YPosition,X                                              ;A7B9B3;
    CLC                                                                  ;A7B9B6;
    ADC.W Hitbox_KraidLint+8                                             ;A7B9B7;
    SEC                                                                  ;A7B9BA;
    SBC.W #$0002                                                         ;A7B9BB;
    STA.B DP_Temp18                                                      ;A7B9BE;
    LDA.W SamusYPosition                                                 ;A7B9C0;
    SEC                                                                  ;A7B9C3;
    SBC.W SamusYRadius                                                   ;A7B9C4;
    CMP.B DP_Temp18                                                      ;A7B9C7;
    BPL .return                                                          ;A7B9C9;
    LDA.W SamusXRadius                                                   ;A7B9CB;
    CLC                                                                  ;A7B9CE;
    ADC.W #$0010                                                         ;A7B9CF;
    EOR.W #$FFFF                                                         ;A7B9D2;
    CLC                                                                  ;A7B9D5;
    ADC.W ExtraSamusXDisplacement                                        ;A7B9D6;
    CMP.W #$0010                                                         ;A7B9D9;
    BMI +                                                                ;A7B9DC;
    LDA.W #$0010                                                         ;A7B9DE;

+   STA.W ExtraSamusXDisplacement                                        ;A7B9E1;
    PHX                                                                  ;A7B9E4;
    PHP                                                                  ;A7B9E5;
    JSL.L NormalEnemyTouchAI_Internal                                    ;A7B9E6;
    PLP                                                                  ;A7B9EA;
    PLX                                                                  ;A7B9EB;
    LDA.W Enemy.properties,X                                             ;A7B9EC;
    ORA.W #$0400                                                         ;A7B9EF;
    STA.W Enemy.properties,X                                             ;A7B9F2;

  .return:
    RTS                                                                  ;A7B9F5;


;;; $B9F6: Main AI - enemy $E3FF (Kraid foot) ;;;
MainAI_KraidFoot:
    LDA.W Enemy.XPosition                                                ;A7B9F6;
    STA.W Enemy[5].XPosition                                             ;A7B9F9;
    LDA.W Enemy.YPosition                                                ;A7B9FC;
    CLC                                                                  ;A7B9FF;
    ADC.W #$0064                                                         ;A7BA00;
    STA.W Enemy[5].YPosition                                             ;A7BA03;
    TAY                                                                  ;A7BA06;
    SEC                                                                  ;A7BA07;
    SBC.W #$00E0                                                         ;A7BA08;
    TAX                                                                  ;A7BA0B;
    LDA.W Enemy[5].properties                                            ;A7BA0C;
    AND.W #$FEFF                                                         ;A7BA0F;
    CPY.W Layer1YPosition                                                ;A7BA12;
    BPL .offScreen                                                       ;A7BA15;
    ORA.W #$0100                                                         ;A7BA17;
    BRA +                                                                ;A7BA1A;

  .offScreen:
    CPX.W Layer1YPosition                                                ;A7BA1C;
    BMI +                                                                ;A7BA1F;
    ORA.W #$0100                                                         ;A7BA21;

+   STA.W Enemy[5].properties                                            ;A7BA24;
    LDX.W EnemyIndex                                                     ;A7BA27;
    JMP.W (Enemy[5].var0)                                                ;A7BA2A;


;;; $BA2D: RTL. Kraid foot function ;;;
RTL_A7BA2D:
    RTL                                                                  ;A7BA2D;


;;; $BA2E: Kraid foot function - second phase - thinking ;;;
Function_KraidFoot_Phase2_Thinking:
    LDA.L ExtraEnemy7800+$140                                            ;A7BA2E;
    DEC                                                                  ;A7BA32;
    STA.L ExtraEnemy7800+$140                                            ;A7BA33;
    BNE .return                                                          ;A7BA37;
    LDX.W #$0000                                                         ;A7BA39;

  .loopXPositions:
    LDA.W Enemy.XPosition                                                ;A7BA3C;
    CMP.W .XPosition,X                                                   ;A7BA3F;
    BEQ +                                                                ;A7BA42;
    INX                                                                  ;A7BA44;
    INX                                                                  ;A7BA45;
    INX                                                                  ;A7BA46;
    INX                                                                  ;A7BA47;
    CPX.W #$0018                                                         ;A7BA48;
    BMI .loopXPositions                                                  ;A7BA4B;
    LDX.W #$0004                                                         ;A7BA4D;

+   LDA.W RandomNumberSeed                                               ;A7BA50;
    AND.W #$001C                                                         ;A7BA53;
    CMP.W #$0010                                                         ;A7BA56;
    BMI +                                                                ;A7BA59;
    LDA.W #$0010                                                         ;A7BA5B;

+   CLC                                                                  ;A7BA5E;
    ADC.W .movementDataPointer,X                                         ;A7BA5F;
    TAX                                                                  ;A7BA62;
    LDA.W $0002,X                                                        ;A7BA63;
    TAY                                                                  ;A7BA66;
    LDA.W $0000,X                                                        ;A7BA67;
    CMP.W Enemy.XPosition                                                ;A7BA6A;
    BPL .backwards                                                       ;A7BA6D;
    LDA.W $0000,X                                                        ;A7BA6F;
    JSR.W SetKraidWalkingForwards                                        ;A7BA72;
    RTL                                                                  ;A7BA75;

  .backwards:
    LDA.W $0000,X                                                        ;A7BA76;
    JSR.W SetKraidWalkingBackwards                                       ;A7BA79;

  .return:
    RTL                                                                  ;A7BA7C;

; Movement table
; If Kraid is at a listed X position, that entry is used, otherwise the default entry is used
; One of 5 corresponding movements is selected at random with chances 1/8, 1/8, 1/8, 1/8, 1/2

;        _________ Kraid X position
;       |      ___ Kraid movement data
;       |     |
  .XPosition:
    dw $00F0                                                             ;A7BA7D;
  .movementDataPointer:
    dw       .movementData0                                              ;A7BA7F;
    dw $0160,.movementData1                                              ;A7BA81;
    dw $0180,.movementData2                                              ;A7BA85;
    dw $00D0,.movementData3                                              ;A7BA89;
    dw $0140,.movementData4                                              ;A7BA8D;
    dw $0170,.movementData5                                              ;A7BA91;

;        _________ Kraid target X position
;       |      ___ Thinking timer
;       |     |
  .movementData0:
    dw $0180,$0158, $0180,$0158, $00D0,$002C, $0170,$002C, $0170,$002C   ;A7BA95;
  .movementData1:
    dw $00F0,$0100, $0180,$0158, $00D0,$002C, $0140,$002C, $0170,$002C   ;A7BAA9;
  .movementData2:
    dw $00F0,$0100, $0160,$0158, $00D0,$002C, $0140,$002C, $0170,$002C   ;A7BABD;
  .movementData3:
    dw $00F0,$0100, $0160,$0158, $0180,$0158, $0140,$002C, $0170,$002C   ;A7BAD1;
  .movementData4:
    dw $00F0,$0100, $0160,$0158, $0180,$0158, $00D0,$002C, $0170,$002C   ;A7BAE5;
  .movementData5:
    dw $00F0,$0100, $0180,$0158, $0170,$0158, $00D0,$002C, $0140,$002C   ;A7BAF9;


;;; $BB0D: Set Kraid walking backwards ;;;
SetKraidWalkingBackwards:
    STA.L Kraid.targetXPosition                                          ;A7BB0D;
    TYA                                                                  ;A7BB11;
    STA.L ExtraEnemy7800+$140                                            ;A7BB12;
    LDA.W #Function_KraidFoot_Phase2_WalkingBackward                     ;A7BB16;
    STA.W Enemy[5].var0                                                  ;A7BB19;
    LDA.W #$0001                                                         ;A7BB1C;
    STA.W Enemy[5].instTimer                                             ;A7BB1F;
    LDA.W #InstList_KraidFoot_KraidIsBig_WalkingBackwards_0              ;A7BB22;
    STA.W Enemy[5].instList                                              ;A7BB25;
    RTS                                                                  ;A7BB28;


;;; $BB29: Set Kraid walking forwards ;;;
SetKraidWalkingForwards:
    STA.L Kraid.targetXPosition                                          ;A7BB29;
    TYA                                                                  ;A7BB2D;
    STA.L ExtraEnemy7800+$140                                            ;A7BB2E;
    LDA.W #Function_KraidFoot_Phase2_WalkingForward                      ;A7BB32;
    STA.W Enemy[5].var0                                                  ;A7BB35;
    LDA.W #$0001                                                         ;A7BB38;
    STA.W Enemy[5].instTimer                                             ;A7BB3B;
    LDA.W #InstList_KraidFoot_KraidIsBig_WalkingForward_0                ;A7BB3E;
    STA.W Enemy[5].instList                                              ;A7BB41;
    RTS                                                                  ;A7BB44;


;;; $BB45: Kraid foot function - second phase - walking backwards ;;;
Function_KraidFoot_Phase2_WalkingBackward:
    LDA.L Kraid.targetXPosition                                          ;A7BB45;
    CMP.W Enemy.XPosition                                                ;A7BB49;
    BEQ .walking                                                         ;A7BB4C;
    BPL .return                                                          ;A7BB4E;
    STA.W Enemy.XPosition                                                ;A7BB50;

  .walking:
    LDA.W Enemy[5].instList                                              ;A7BB53;
    CMP.W #InstList_KraidFoot_KraidIsBig_WalkingBackwards_1              ;A7BB56;
    BMI .return                                                          ;A7BB59;
    LDA.W #Function_KraidFoot_Phase2_Thinking                            ;A7BB5B;
    STA.W Enemy[5].var0                                                  ;A7BB5E;
    LDA.W #$0001                                                         ;A7BB61;
    STA.W Enemy[5].instTimer                                             ;A7BB64;
    LDA.W #InstList_KraidFoot_KraidIsBig_Neutral                         ;A7BB67;
    STA.W Enemy[5].instList                                              ;A7BB6A;

  .return:
    RTL                                                                  ;A7BB6D;


;;; $BB6E: Kraid foot function - second phase setup - walk to starting spot ;;;
Function_KraidFoot_Phase2Setup_WalkToStartingPoint:
    LDA.L Kraid.targetXPosition                                          ;A7BB6E;
    CMP.W Enemy.XPosition                                                ;A7BB72;
    BEQ .walking                                                         ;A7BB75;
    BPL .return                                                          ;A7BB77;
    STA.W Enemy.XPosition                                                ;A7BB79;

  .walking:
    LDA.W Enemy[5].instList                                              ;A7BB7C;
    CMP.W #InstList_KraidFoot_KraidIsBig_WalkingBackwards_1              ;A7BB7F;
    BMI .return                                                          ;A7BB82;
    LDA.W #Function_Kraid_HandleFunctionTimer                            ;A7BB84;
    STA.W Enemy[5].var0                                                  ;A7BB87;
    LDA.W #$00B4                                                         ;A7BB8A;
    STA.W Enemy[5].var5                                                  ;A7BB8D;
    LDA.W #Function_KraidFoot_Phase2Setup_InitializePhase2               ;A7BB90;
    STA.L ExtraEnemy7800+$140                                            ;A7BB93;
    LDA.W #$0001                                                         ;A7BB97;
    STA.W Enemy[5].instTimer                                             ;A7BB9A;
    LDA.W #InstList_KraidFoot_KraidIsBig_Neutral                         ;A7BB9D;
    STA.W Enemy[5].instList                                              ;A7BBA0;

  .return:
    RTL                                                                  ;A7BBA3;


;;; $BBA4: Kraid foot function - second phase setup - initialise second phase ;;;
Function_KraidFoot_Phase2Setup_InitializePhase2:
    LDA.W #$0160                                                         ;A7BBA4;
    LDY.W #$00B4                                                         ;A7BBA7;
    JSR.W SetKraidWalkingBackwards                                       ;A7BBAA;
    RTL                                                                  ;A7BBAD;


;;; $BBAE: Kraid foot function - second phase - walking forwards ;;;
Function_KraidFoot_Phase2_WalkingForward:
    LDA.L Kraid.targetXPosition                                          ;A7BBAE;
    CMP.W Enemy.XPosition                                                ;A7BBB2;
    BMI .forwards                                                        ;A7BBB5;
    STA.W Enemy.XPosition                                                ;A7BBB7;
    LDA.W Enemy[5].instList                                              ;A7BBBA;
    CMP.W #InstList_KraidFoot_KraidIsBig_WalkingForward_1                ;A7BBBD;
    BNE .return                                                          ;A7BBC0;
    LDA.W #Function_KraidFoot_Phase2_Thinking                            ;A7BBC2;
    STA.W Enemy[5].var0                                                  ;A7BBC5;
    LDA.W #$0001                                                         ;A7BBC8;
    STA.W Enemy[5].instTimer                                             ;A7BBCB;
    LDA.W #InstList_KraidFoot_KraidIsBig_Neutral                         ;A7BBCE;
    STA.W Enemy[5].instList                                              ;A7BBD1;

  .return:
    RTL                                                                  ;A7BBD4;

  .forwards:
    LDA.W Enemy[5].instList                                              ;A7BBD5;
    CMP.W #InstList_KraidFoot_KraidIsBig_WalkingForward_1                ;A7BBD8;
    BNE .return                                                          ;A7BBDB;
    LDA.W #InstList_KraidFoot_KraidIsBig_WalkingForward_0                ;A7BBDD;
    STA.W Enemy[5].instList                                              ;A7BBE0;
    LDA.W #$0001                                                         ;A7BBE3;
    STA.W Enemy[5].instTimer                                             ;A7BBE6;
    RTL                                                                  ;A7BBE9;


;;; $BBEA: Kraid function - Kraid main loop - attacking with mouth open ;;;
Function_KraidMainLoop_AttackingWithMouthOpen:
    JSR.W KraidInstListHandling                                          ;A7BBEA;
    CMP.W #$FFFF                                                         ;A7BBED;
    BEQ .finishedInstructions                                            ;A7BBF0;
    LDA.W Kraid.instListPointer                                          ;A7BBF2;
    SEC                                                                  ;A7BBF5;
    SBC.W #$0008                                                         ;A7BBF6;
    TAX                                                                  ;A7BBF9;
    LDA.W $0002,X                                                        ;A7BBFA;
    CMP.W #Tilemap_KraidHead_3                                           ;A7BBFD;
    BNE .return                                                          ;A7BC00;
    LDA.W Kraid.instructionTimer                                         ;A7BC02;
    AND.W #$000F                                                         ;A7BC05;
    BNE .return                                                          ;A7BC08;
    LDY.W #EnemyProjectile_KraidRockSpit                                 ;A7BC0A;
    LDA.W RandomNumberSeed                                               ;A7BC0D;
    AND.W #$000E                                                         ;A7BC10;
    TAX                                                                  ;A7BC13;
    LDA.W .rockSpitXVelocities,X                                         ;A7BC14;
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics                     ;A7BC17;
    LDA.W #$001E                                                         ;A7BC1B;
    JSL.L QueueSound_Lib3_Max6                                           ;A7BC1E;

  .return:
    RTL                                                                  ;A7BC22;

  .finishedInstructions:
    JSR.W SetupKraidMainLoop_Thinking                                    ;A7BC23;
    LDA.W #$005A                                                         ;A7BC26;
    STA.W Kraid.instructionTimer                                         ;A7BC29;
    LDA.L Kraid.mouthReopenFlags                                         ;A7BC2C;
    BIT.W #$0004                                                         ;A7BC30;
    BEQ .done                                                            ;A7BC33;
    SEC                                                                  ;A7BC35;
    SBC.W #$0100                                                         ;A7BC36;
    STA.L Kraid.mouthReopenFlags                                         ;A7BC39;
    AND.W #$FF00                                                         ;A7BC3D;
    BEQ .done                                                            ;A7BC40;
    LDA.W #Function_Kraid_HandleFunctionTimer                            ;A7BC42;
    STA.W Kraid.function                                                 ;A7BC45;
    LDA.W #$0040                                                         ;A7BC48;
    STA.W Kraid.functionTimer                                            ;A7BC4B;
    LDA.W #Function_Kraid_KraidShot_InitializeEyeGlowing                 ;A7BC4E;
    STA.L Kraid.nextFunction                                             ;A7BC51;
    LDA.W #$0002                                                         ;A7BC55;
    STA.L ExtraEnemy7800+2                                               ;A7BC58;
    RTL                                                                  ;A7BC5C;

  .done:
    LDA.W #$0000                                                         ;A7BC5D;
    STA.L Kraid.mouthReopenFlags                                         ;A7BC60;
    RTL                                                                  ;A7BC64;

  .rockSpitXVelocities:
; Rock spit X velocities. Unit 1/100h px/frame
    dw $FC00,$FC40,$FB40,$FB80,$FB40,$FC00,$FB80,$FC40                   ;A7BC65;


if !FEATURE_KEEP_UNREFERENCED
;;; $BC75: Unused. Lunge forward if Samus is not invincible ;;;
UNUSED_KraidFoot_LungeForwardIfSamusIsNotInvincible_A7BC75:
; Possibly an old Samus / Kraid foot collision reaction
    LDA.W Enemy[5].instList                                              ;A7BC75;
    CMP.W #InstList_KraidFoot_LungeForward_1                             ;A7BC78;
    BMI .return                                                          ;A7BC7B;
    LDA.W SamusInvincibilityTimer                                        ;A7BC7D;
    BEQ .lunge                                                           ;A7BC80;
    LDA.W #Function_KraidFoot_Phase2_WalkingBackward                     ;A7BC82;
    STA.W Enemy[5].var0                                                  ;A7BC85;
    LDA.W Layer1XPosition                                                ;A7BC88;
    CLC                                                                  ;A7BC8B;
    ADC.W #$0120                                                         ;A7BC8C;
    CMP.W #$0120                                                         ;A7BC8F;
    BMI +                                                                ;A7BC92;
    LDA.W #$0120                                                         ;A7BC94;

+   STA.L Kraid.targetXPosition                                          ;A7BC97;
    LDA.W #$0001                                                         ;A7BC9B;
    STA.W Enemy[5].instTimer                                             ;A7BC9E;
    LDA.W #InstList_KraidFoot_KraidIsBig_WalkingBackwards_0              ;A7BCA1;
    STA.W Enemy[5].instList                                              ;A7BCA4;

  .return:
    RTL                                                                  ;A7BCA7;

  .lunge:
    LDA.W #$0001                                                         ;A7BCA8;
    STA.W Enemy[5].instTimer                                             ;A7BCAB;
    LDA.W #InstList_KraidFoot_LungeForward_0                             ;A7BCAE;
    STA.W Enemy[5].instList                                              ;A7BCB1;
    RTL                                                                  ;A7BCB4;


;;; $BCB5: Unused. Fire lint after [A] frames ;;;
UNUSED_Kraid_FireLintAfterAFrames_A7BCB5:
    STA.W Kraid.functionTimer,X                                          ;A7BCB5;
    LDA.W #Function_KraidNail_HorizontallyAlignEnemyToKraid              ;A7BCB8;
    STA.W Kraid.function,X                                               ;A7BCBB;
    LDA.W #Function_KraidLint_FireLint                                   ;A7BCBE;
    STA.L Kraid.nextFunction,X                                           ;A7BCC1;
    LDA.W Enemy.properties,X                                             ;A7BCC5;
    ORA.W #$0100                                                         ;A7BCC8;
    STA.W Enemy.properties,X                                             ;A7BCCB;
    RTS                                                                  ;A7BCCE;
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $BCCF: Enemy touch - enemy $E43F (Kraid good fingernail) ;;;
EnemyTouch_KraidNail:
    JSL.L NormalEnemyTouchAI_Internal                                    ;A7BCCF;
    LDX.W EnemyIndex                                                     ;A7BCD3;
    JSL.L EnemyDeath                                                     ;A7BCD6;
    LDX.W EnemyIndex                                                     ;A7BCDA;
    RTL                                                                  ;A7BCDD;


;;; $BCDE: Enemy touch - enemy $E47F (Kraid bad fingernail) ;;;
EnemyTouch_KraidNailBad:
    JSL.L NormalEnemyTouchAI_Internal                                    ;A7BCDE;
    LDX.W EnemyIndex                                                     ;A7BCE2;
    JSL.L EnemyDeath                                                     ;A7BCE5;
    LDX.W EnemyIndex                                                     ;A7BCE9;
    RTL                                                                  ;A7BCEC;


;;; $BCED: RTL ;;;
RTL_A7BCED:
    RTL                                                                  ;A7BCED;


;;; $BCEE: RTL ;;;
RTL_A7BCEE:
    RTL                                                                  ;A7BCEE;


;;; $BCEF: Initialisation AI - enemy $E43F (Kraid good fingernail) ;;;
InitAI_KraidNail:
    LDX.W EnemyIndex                                                     ;A7BCEF; fallthrough to InitAI_KraidNail_WithoutLoadingEnemyIndex


;;; $BCF2: Kraid's fingernails initialisation AI ;;;
InitAI_KraidNail_Common:
    LDA.W Enemy.palette                                                  ;A7BCF2;
    STA.W Enemy.palette,X                                                ;A7BCF5;
    LDA.W #$0028                                                         ;A7BCF8;
    STA.W Kraid.instListPointer,X                                        ;A7BCFB;
    LDA.W Enemy.properties,X                                             ;A7BCFE;
    ORA.W #$0100                                                         ;A7BD01;
    STA.W Enemy.properties,X                                             ;A7BD04;
    LDA.W #$7FFF                                                         ;A7BD07;
    STA.W Enemy.instTimer,X                                              ;A7BD0A;
    LDA.W #InstList_KraidNail                                            ;A7BD0D;
    STA.W Enemy.instList,X                                               ;A7BD10;
    LDA.W InstList_KraidNail+2                                           ;A7BD13;
    STA.W Enemy.spritemap,X                                              ;A7BD16;
    LDA.W #Function_KraidNail_Initialize                                 ;A7BD19;
    STA.L Kraid.nextFunction,X                                           ;A7BD1C;
    LDA.W #Function_Kraid_HandleFunctionTimer                            ;A7BD20;
    STA.W Kraid.function,X                                               ;A7BD23;
    LDA.W #$0040                                                         ;A7BD26;
    STA.W Kraid.functionTimer,X                                          ;A7BD29;
    RTL                                                                  ;A7BD2C;


;;; $BD2D: Initialisation AI - enemy $E47F (Kraid bad fingernail) ;;;
InitAI_KraidNailBad:
    LDX.W EnemyIndex                                                     ;A7BD2D;
    BRA InitAI_KraidNail_Common                                          ;A7BD30;


;;; $BD32: Main AI - enemy $E43F (Kraid good fingernail) ;;;
MainAI_KraidNail:
    REP #$30                                                             ;A7BD32;
    LDA.W Enemy.health                                                   ;A7BD34;
    CMP.W #$0001                                                         ;A7BD37;
    BMI .delete                                                          ;A7BD3A;
    JMP.W (Enemy[6].var0)                                                ;A7BD3C;

  .delete:
    LDA.W Enemy[6].properties                                            ;A7BD3F;
    ORA.W #$0300                                                         ;A7BD42;
    STA.W Enemy[6].properties                                            ;A7BD45;
    RTL                                                                  ;A7BD48;


;;; $BD49: Main AI - enemy $E47F (Kraid bad fingernail) ;;;
MainAI_KraidNailBad:
    REP #$30                                                             ;A7BD49;
    LDA.W Enemy.health                                                   ;A7BD4B;
    CMP.W #$0001                                                         ;A7BD4E;
    BMI .delete                                                          ;A7BD51;
    JMP.W (Enemy[7].var0)                                                ;A7BD53;

  .delete:
    LDA.W Enemy[7].properties                                            ;A7BD56;
    ORA.W #$0300                                                         ;A7BD59;
    STA.W Enemy[7].properties                                            ;A7BD5C;
    RTL                                                                  ;A7BD5F;


;;; $BD60: Kraid fingernail function - initialise fingernail ;;;
Function_KraidNail_Initialize:
    LDA.W RandomNumberSeed                                               ;A7BD60;
    AND.W #$0006                                                         ;A7BD63;
    TAY                                                                  ;A7BD66;
    LDA.W Enemy[6].var4                                                  ;A7BD67;
    LDX.W EnemyIndex                                                     ;A7BD6A;
    CPX.W #$0180                                                         ;A7BD6D;
    BNE +                                                                ;A7BD70;
    LDA.W Enemy[7].var4                                                  ;A7BD72;

+   CMP.W #$0000                                                         ;A7BD75;
    BPL .positiveYVelocity                                               ;A7BD78;
    LDA.W .upwardsVelocityPointers,Y                                     ;A7BD7A;
    BRA +                                                                ;A7BD7D;

  .positiveYVelocity:
    LDA.W .downwardsVelocityPointers,Y                                   ;A7BD7F;

+   TAY                                                                  ;A7BD82;
    LDA.W $0000,Y                                                        ;A7BD83;
    STA.W Kraid.instListPointer,X                                        ;A7BD86;
    LDA.W $0002,Y                                                        ;A7BD89;
    STA.W Kraid.instructionTimer,X                                       ;A7BD8C;
    LDA.W $0004,Y                                                        ;A7BD8F;
    STA.W Enemy.var3,X                                                   ;A7BD92;
    LDA.W $0006,Y                                                        ;A7BD95;
    STA.W Enemy.var4,X                                                   ;A7BD98;
    LDA.W #$0001                                                         ;A7BD9B;
    STA.W Enemy.init0,X                                                  ;A7BD9E;
    LDA.W Enemy.properties,X                                             ;A7BDA1;
    AND.W #$FEFF                                                         ;A7BDA4; >.< #$FAFF
    AND.W #$FBFF                                                         ;A7BDA7;
    STA.W Enemy.properties,X                                             ;A7BDAA;
    LDA.W #$0001                                                         ;A7BDAD;
    STA.W Enemy.instTimer,X                                              ;A7BDB0;
    LDA.W #InstList_KraidNail                                            ;A7BDB3;
    STA.W Enemy.instList,X                                               ;A7BDB6;
    LDA.W #Function_KraidNail_Fire                                       ;A7BDB9;
    STA.W Kraid.function,X                                               ;A7BDBC;
    LDA.W RandomNumberSeed                                               ;A7BDBF;
    BIT.W #$0001                                                         ;A7BDC2;
    BNE .horizontal                                                      ;A7BDC5;

  .diagonal:
    LDA.W #$0000                                                         ;A7BDC7;
    STA.L Kraid.maxHealth_2_8,X                                          ;A7BDCA;
    LDA.W Enemy.XPosition                                                ;A7BDCE;
    SEC                                                                  ;A7BDD1;
    SBC.W Enemy.XHitboxRadius                                            ;A7BDD2;
    SEC                                                                  ;A7BDD5;
    SBC.W Enemy.XHitboxRadius,X                                          ;A7BDD6;
    AND.W #$FFF0                                                         ;A7BDD9;
    STA.W Enemy.XPosition,X                                              ;A7BDDC;
    LDA.W Enemy[1].YPosition                                             ;A7BDDF;
    CLC                                                                  ;A7BDE2;
    ADC.W #$0080                                                         ;A7BDE3;
    STA.W Enemy.YPosition,X                                              ;A7BDE6;
    RTL                                                                  ;A7BDE9;

  .horizontal:
    LDA.L ExtraEnemy7800+$18E                                            ;A7BDEA;
    CPX.W #$01C0                                                         ;A7BDEE;
    BEQ .notKraidNailBad                                                 ;A7BDF1;
    LDA.L ExtraEnemy7800+$1CE                                            ;A7BDF3;

  .notKraidNailBad:
    CMP.W #$0001                                                         ;A7BDF7;
    BEQ .diagonal                                                        ;A7BDFA;
    LDA.W #$0001                                                         ;A7BDFC;
    STA.L Kraid.maxHealth_2_8,X                                          ;A7BDFF;
    LDA.W #$0032                                                         ;A7BE03;
    STA.W Enemy.XPosition,X                                              ;A7BE06;
    LDA.W #$00F0                                                         ;A7BE09;
    STA.W Enemy.YPosition,X                                              ;A7BE0C;
    LDA.W #$0000                                                         ;A7BE0F;
    STA.W Kraid.instListPointer,X                                        ;A7BE12;
    LDA.W #$0001                                                         ;A7BE15;
    STA.W Kraid.instructionTimer,X                                       ;A7BE18;
    LDA.W #$0000                                                         ;A7BE1B;
    STA.W Enemy.var3,X                                                   ;A7BE1E;
    LDA.W #$0000                                                         ;A7BE21;
    STA.W Enemy.var4,X                                                   ;A7BE24;
    LDA.W #Function_KraidNail_WaitUntilTopLintXPosition100Plus           ;A7BE27;
    STA.W Kraid.function,X                                               ;A7BE2A;
    LDA.W #Function_KraidNail_Fire                                       ;A7BE2D;
    STA.L Kraid.nextFunction,X                                           ;A7BE30;
    LDA.W Enemy.properties,X                                             ;A7BE34;
    ORA.W #$0500                                                         ;A7BE37;
    STA.W Enemy.properties,X                                             ;A7BE3A;
    RTL                                                                  ;A7BE3D;

  .upwardsVelocityPointers:
; Table of Kraid fingernail upwards velocities
    dw .upwards0                                                         ;A7BE3E;
    dw .upwards1                                                         ;A7BE40;
    dw .upwards2                                                         ;A7BE42;
    dw .upwards3                                                         ;A7BE44;

  .downwardsVelocityPointers:
; Table of Kraid fingernail downwards velocities
    dw .downwards0                                                       ;A7BE46;
    dw .downwards1                                                       ;A7BE48;
    dw .downwards2                                                       ;A7BE4A;
    dw .downwards3                                                       ;A7BE4C;

;        _____________________ X subvelocity
;       |      _______________ X velocity
;       |     |      _________ Y subvelocity
;       |     |     |      ___ Y velocity
;       |     |     |     |
  .upwards0:
    dw $0000,$FFFF,$0000,$0001                                           ;A7BE4E;
  .downwards0:
    dw $0000,$FFFF,$0000,$FFFF                                           ;A7BE56;
  .upwards1:
    dw $0000,$FFFF,$0000,$0001                                           ;A7BE5E;
  .downwards1:
    dw $0000,$FFFF,$0000,$FFFF                                           ;A7BE66;
  .upwards2:
    dw $0000,$FFFF,$0000,$0001                                           ;A7BE6E;
  .downwards2:
    dw $0000,$FFFF,$0000,$FFFF                                           ;A7BE76;
  .upwards3:
    dw $0000,$FFFF,$0000,$0001                                           ;A7BE7E;
  .downwards3:
    dw $0000,$FFFF,$0000,$FFFF                                           ;A7BE86;


;;; $BE8E: Kraid fingernail function - fire fingernail ;;;
Function_KraidNail_Fire:
; Note the three fixed point negation operations at $BE9E, $BEE2 and $BF06 are off by 1.0 when the low word is zero
    LDA.W Kraid.instListPointer,X                                        ;A7BE8E;
    STA.B DP_Temp12                                                      ;A7BE91;
    LDA.W Kraid.instructionTimer,X                                       ;A7BE93;
    STA.B DP_Temp14                                                      ;A7BE96;
    JSL.L MoveEnemyRightBy_14_12_IgnoreSlopes                            ;A7BE98;
    BCC .loopSetup                                                       ;A7BE9C;
    LDA.W Kraid.instListPointer,X                                        ;A7BE9E;
    EOR.W #$FFFF                                                         ;A7BEA1;
    INC                                                                  ;A7BEA4;
    STA.W Kraid.instListPointer,X                                        ;A7BEA5;
    LDA.W Kraid.instructionTimer,X                                       ;A7BEA8;
    EOR.W #$FFFF                                                         ;A7BEAB;
    INC                                                                  ;A7BEAE;
    STA.W Kraid.instructionTimer,X                                       ;A7BEAF;
    BRA .bounced                                                         ;A7BEB2;

  .loopSetup:
    LDY.W #$0000                                                         ;A7BEB4;

  .loop:
    LDA.W Enemy.YPosition                                                ;A7BEB7;
    CLC                                                                  ;A7BEBA;
    ADC.W .topBoundaryOffset,Y                                           ;A7BEBB;
    CMP.W Enemy.YPosition,X                                              ;A7BEBE;
    BMI +                                                                ;A7BEC1;
    INY                                                                  ;A7BEC3;
    INY                                                                  ;A7BEC4;
    INY                                                                  ;A7BEC5;
    INY                                                                  ;A7BEC6;
    BRA .loop                                                            ;A7BEC7;

+   LDA.W Enemy.XPosition                                                ;A7BEC9;
    CLC                                                                  ;A7BECC;
    ADC.W .leftBoundaryOffset,Y                                          ;A7BECD;
    STA.B DP_Temp12                                                      ;A7BED0;
    LDA.W Enemy.XPosition,X                                              ;A7BED2;
    CLC                                                                  ;A7BED5;
    ADC.W Enemy.XHitboxRadius,X                                          ;A7BED6;
    CMP.B DP_Temp12                                                      ;A7BED9;
    BMI .bounced                                                         ;A7BEDB;
    LDA.W Kraid.instructionTimer,X                                       ;A7BEDD;
    BMI .bounced                                                         ;A7BEE0;
    LDA.W Kraid.instListPointer,X                                        ;A7BEE2;
    EOR.W #$FFFF                                                         ;A7BEE5;
    INC                                                                  ;A7BEE8;
    STA.W Kraid.instListPointer,X                                        ;A7BEE9;
    LDA.W Kraid.instructionTimer,X                                       ;A7BEEC;
    EOR.W #$FFFF                                                         ;A7BEEF;
    INC                                                                  ;A7BEF2;
    STA.W Kraid.instructionTimer,X                                       ;A7BEF3;

  .bounced:
    LDA.W Enemy.var3,X                                                   ;A7BEF6;
    STA.B DP_Temp12                                                      ;A7BEF9;
    LDA.W Enemy.var4,X                                                   ;A7BEFB;
    STA.B DP_Temp14                                                      ;A7BEFE;
    JSL.L MoveEnemyDownBy_14_12                                          ;A7BF00;
    BCC .return                                                          ;A7BF04;
    LDA.W Enemy.var3,X                                                   ;A7BF06;
    EOR.W #$FFFF                                                         ;A7BF09;
    INC                                                                  ;A7BF0C;
    STA.W Enemy.var3,X                                                   ;A7BF0D;
    LDA.W Enemy.var4,X                                                   ;A7BF10;
    EOR.W #$FFFF                                                         ;A7BF13;
    ADC.W #$0000                                                         ;A7BF16;
    STA.W Enemy.var4,X                                                   ;A7BF19;

  .return:
    RTL                                                                  ;A7BF1C;

;        _________ Left boundary offset
;       |      ___ Top boundary offset
;       |     |
  .leftBoundaryOffset:
    dw $FFC0                                                             ;A7BF1D;
  .topBoundaryOffset:
    dw       $0010                                                       ;A7BF1F;
    dw $FFD8,$FFD8
    dw $FFF0,$FFA0
    dw $0008,$FF80


;;; $BF2D: Kraid foot function - first phase - prepare to lunge forward ;;;
Function_KraidFoot_Phase1_PrepareToLungeForward:
    JSR.W HandleKraidPhase1                                              ;A7BF2D;
    LDA.W Enemy[1].instList                                              ;A7BF30;
    CMP.W #InstList_KraidArm_Normal_1                                    ;A7BF33;
    BMI .return                                                          ;A7BF36;
    LDA.W #InstList_KraidArm_Dying_PreparingToLungeForward               ;A7BF38;
    STA.W Enemy[1].instList                                              ;A7BF3B;
    LDA.W #$0001                                                         ;A7BF3E;
    STA.W Enemy[1].instTimer                                             ;A7BF41;
    LDA.W #$0001                                                         ;A7BF44;
    STA.W Enemy[5].instTimer                                             ;A7BF47;
    LDA.W #InstList_KraidFoot_LungeForward_0                             ;A7BF4A;
    STA.W Enemy[5].instList                                              ;A7BF4D;
    LDA.W #Function_KraidFoot_Phase1_LungeForward                        ;A7BF50;
    STA.W Enemy[5].var0                                                  ;A7BF53;
    LDA.W #$0000                                                         ;A7BF56;
    STA.W Enemy[5].var5                                                  ;A7BF59;

  .return:
    RTL                                                                  ;A7BF5C;


;;; $BF5D: Kraid foot function - first phase - lunge forward ;;;
Function_KraidFoot_Phase1_LungeForward:
    JSR.W HandleKraidPhase1                                              ;A7BF5D;
    LDA.W Enemy.XPosition                                                ;A7BF60;
    CMP.W #$005C                                                         ;A7BF63;
    BPL +                                                                ;A7BF66;
    LDA.W #$005C                                                         ;A7BF68;
    STA.W Enemy.XPosition                                                ;A7BF6B;

+   LDA.W Enemy[5].instList                                              ;A7BF6E;
    CMP.W #InstList_KraidFoot_LungeForward_1                             ;A7BF71;
    BNE .return                                                          ;A7BF74;
    LDA.W Enemy.XPosition                                                ;A7BF76;
    CMP.W #$005C                                                         ;A7BF79;
    BEQ .done                                                            ;A7BF7C;
    LDA.W #$0001                                                         ;A7BF7E;
    STA.W Enemy[5].instTimer                                             ;A7BF81;
    LDA.W #InstList_KraidFoot_LungeForward_0                             ;A7BF84;
    STA.W Enemy[5].instList                                              ;A7BF87;
    RTL                                                                  ;A7BF8A;

  .done:
    LDA.W #Function_KraidFoot_Phase1_RetreatFromLunge                    ;A7BF8B;
    STA.L ExtraEnemy7800+$140                                            ;A7BF8E;
    LDA.W #Function_KraidFoot_StartRetreat                               ;A7BF92;
    STA.W Enemy[5].var0                                                  ;A7BF95;
    LDA.W #$0001                                                         ;A7BF98;
    STA.W Enemy[5].var5                                                  ;A7BF9B;
    LDA.W #$0001                                                         ;A7BF9E;
    STA.W Enemy[5].instTimer                                             ;A7BFA1;
    LDA.W #InstList_KraidFoot_KraidIsBig_Neutral                         ;A7BFA4;
    STA.W Enemy[5].instList                                              ;A7BFA7;

  .return:
    RTL                                                                  ;A7BFAA;


;;; $BFAB: Kraid foot function - first phase - retreat from lunge ;;;
Function_KraidFoot_Phase1_RetreatFromLunge:
    JSR.W HandleKraidPhase1                                              ;A7BFAB;
    LDA.W Enemy.XPosition                                                ;A7BFAE;
    CMP.W #$00B0                                                         ;A7BFB1;
    BMI +                                                                ;A7BFB4;
    LDA.W #$00B0                                                         ;A7BFB6;
    STA.W Enemy.XPosition                                                ;A7BFB9;

+   LDA.W Enemy[5].instList                                              ;A7BFBC;
    CMP.W #InstList_KraidFoot_KraidIsBig_WalkingBackwards_1              ;A7BFBF;
    BMI .return                                                          ;A7BFC2;
    LDA.W Enemy.XPosition                                                ;A7BFC4;
    CMP.W #$00B0                                                         ;A7BFC7;
    BEQ .done                                                            ;A7BFCA;
    LDA.W #InstList_KraidFoot_KraidIsBig_WalkingBackwards_0              ;A7BFCC;
    STA.W Enemy.instList,X                                               ;A7BFCF;
    LDA.W #$0001                                                         ;A7BFD2;
    STA.W Enemy.instTimer,X                                              ;A7BFD5;
    RTL                                                                  ;A7BFD8;

  .done:
    LDA.W #InstList_KraidArm_Normal_0                                    ;A7BFD9;
    STA.W Enemy[1].instList                                              ;A7BFDC;
    LDA.W #$0001                                                         ;A7BFDF;
    STA.W Enemy[1].instTimer                                             ;A7BFE2;
    LDA.W #$0001                                                         ;A7BFE5;
    STA.W Enemy[5].instTimer                                             ;A7BFE8;
    LDA.W #InstList_KraidFoot_KraidIsBig_Neutral                         ;A7BFEB;
    STA.W Enemy[5].instList                                              ;A7BFEE;
    LDA.W #Function_KraidFoot_Phase1_Thinking                            ;A7BFF1;
    STA.W Enemy[5].var0                                                  ;A7BFF4;
    LDA.W #$012C                                                         ;A7BFF7;
    STA.W Enemy[5].var5                                                  ;A7BFFA;
    LDA.W #Function_KraidFoot_Phase1_PrepareToLungeForward               ;A7BFFD;
    STA.L ExtraEnemy7800+$140                                            ;A7C000;

  .return:
    RTL                                                                  ;A7C004;


;;; $C005: Handle Kraid's first phase ;;;
HandleKraidPhase1:
; This routine contains the cause of the Kraid quick kill.

; In order to close Kraid's mouth once he's sustained enough damage,
; this routine is setting Kraid's instruction list pointer to one of his roar instructions where his mouth is closing
; ($96F4/$96FC/$9704/$970C) depending on what tilemap pointer he's set to have.

; When Kraid is shot and his instruction list pointer is $96EA/$96EC (the magic animation frame),
; his instruction list pointer is set to $96F4 accordingly,
; the instruction timer being set to 40h (as specified by the previous instruction),
; which is the cause of the animation freeze that allows Samus to quickly kill Kraid.

; The 40h frame delay makes sense in the usual context of the roar instruction list,
; as $96EC is the instruction list pointer used for keeping Kraid's mouth open during the roar sound effect.

; Easiest way to fix this is to set the Kraid instruction timer to Ah unconditionally (instead of hoping it's Ah from instruction list lookup).
; I.e. $C04C = LDA #$000A
    LDA.W Enemy.health                                                   ;A7C005;
    CMP.L Kraid.maxHealth_7_8                                            ;A7C008;
    BMI .getBig                                                          ;A7C00C;
    RTS                                                                  ;A7C00E;

  .getBig:
    LDA.W #Function_Kraid_ProcessKraidInstruction                        ;A7C00F;
    STA.W Kraid.function                                                 ;A7C012;
    LDA.W #$00B4                                                         ;A7C015;
    STA.W Kraid.functionTimer                                            ;A7C018;
    LDA.W #Function_Kraid_GetBig_ReleaseCamera                           ;A7C01B;
    STA.L Kraid.nextFunction                                             ;A7C01E;
    LDA.W Kraid.instListPointer                                          ;A7C022;
    TAX                                                                  ;A7C025;
    LDA.W $0002,X                                                        ;A7C026;
    LDY.W #$0032                                                         ;A7C029;
    CMP.W #Tilemap_KraidHead_0                                           ;A7C02C;
    BEQ +                                                                ;A7C02F;
    LDY.W #$002A                                                         ;A7C031;
    CMP.W #Tilemap_KraidHead_1                                           ;A7C034;
    BEQ +                                                                ;A7C037;
    LDY.W #$0022                                                         ;A7C039;
    CMP.W #Tilemap_KraidHead_2                                           ;A7C03C;
    BEQ +                                                                ;A7C03F;
    LDY.W #$001A                                                         ;A7C041;

+   TYA                                                                  ;A7C044;
    CLC                                                                  ;A7C045;
    ADC.W #InstList_Kraid_Roar_1                                         ;A7C046;
    STA.W Kraid.instListPointer                                          ;A7C049;
    LDA.W InstList_Kraid_Roar_0,Y                                        ;A7C04C;
    STA.W Kraid.instructionTimer                                         ;A7C04F;
    LDA.W #$0004                                                         ;A7C052;
    STA.W EarthquakeType                                                 ;A7C055;
    LDA.W #$0154                                                         ;A7C058;
    STA.W EarthquakeTimer                                                ;A7C05B;
    LDA.W #InstList_KraidFoot_Initial                                    ;A7C05E;
    STA.W Enemy[5].instList                                              ;A7C061;
    LDA.W #$0001                                                         ;A7C064;
    STA.W Enemy[5].instTimer                                             ;A7C067;
    LDA.W #RTL_A7BA2D                                                    ;A7C06A;
    STA.W Enemy[5].var0                                                  ;A7C06D;
    LDA.W #InstList_KraidArm_Normal_0                                    ;A7C070;
    STA.W Enemy[1].instList                                              ;A7C073;
    LDA.W #$0001                                                         ;A7C076;
    STA.W Enemy[1].instTimer                                             ;A7C079;
    LDA.W Enemy[2].properties                                            ;A7C07C;
    ORA.W #$0100                                                         ;A7C07F;
    STA.W Enemy[2].properties                                            ;A7C082;
    LDA.W Enemy[3].properties                                            ;A7C085;
    ORA.W #$0100                                                         ;A7C088;
    STA.W Enemy[3].properties                                            ;A7C08B;
    LDA.W Enemy[4].properties                                            ;A7C08E;
    ORA.W #$0100                                                         ;A7C091;
    STA.W Enemy[4].properties                                            ;A7C094;
    LDA.W Enemy[1].properties                                            ;A7C097;
    ORA.W #$0400                                                         ;A7C09A;
    STA.W Enemy[1].properties                                            ;A7C09D;
    RTS                                                                  ;A7C0A0;


;;; $C0A1: Kraid function - Kraid gets big - release camera ;;;
Function_Kraid_GetBig_ReleaseCamera:
    LDA.W #Function_Kraid_KraidGetsBig_BreakCeilingIntoPlatforms         ;A7C0A1;
    STA.W Kraid.function                                                 ;A7C0A4;
    LDA.W #$0202                                                         ;A7C0A7;
    STA.L Scrolls                                                        ;A7C0AA;
    LDA.W #$0101                                                         ;A7C0AE;
    STA.L Scrolls+2                                                      ;A7C0B1;
    LDA.W #$00A4                                                         ;A7C0B5;
    STA.L Kraid.minimumSamusEjectionYPosition                            ;A7C0B8;
    RTL                                                                  ;A7C0BC;


if !FEATURE_KEEP_UNREFERENCED
;;; $C0BD: Unused. Crumble first section of Kraid's spike floor ;;;
UNUSED_CrumbleFirstSectionOfKraidsSpikeFloor_A7C0BD:
; Assuming PLMEntries_crumbleKraidSpikeBlocks used to be a PLM that only crumbled one block
    JSL.L Spawn_Hardcoded_PLM                                            ;A7C0BD;
    db $06,$1B                                                           ;A7C0C1;
    dw PLMEntries_crumbleKraidSpikeBlocks                                ;A7C0C3;
    JSL.L Spawn_Hardcoded_PLM                                            ;A7C0C5;
    db $07,$1B                                                           ;A7C0C9;
    dw PLMEntries_crumbleKraidSpikeBlocks                                ;A7C0CB;
    JSL.L Spawn_Hardcoded_PLM                                            ;A7C0CD;
    db $08,$1B                                                           ;A7C0D1;
    dw PLMEntries_crumbleKraidSpikeBlocks                                ;A7C0D3;
    JSL.L Spawn_Hardcoded_PLM                                            ;A7C0D5;
    db $09,$1B                                                           ;A7C0D9;
    dw PLMEntries_crumbleKraidSpikeBlocks                                ;A7C0DB;
    JSL.L Spawn_Hardcoded_PLM                                            ;A7C0DD;
    db $0A,$1B                                                           ;A7C0E1;
    dw PLMEntries_crumbleKraidSpikeBlocks                                ;A7C0E3;
    JSL.L Spawn_Hardcoded_PLM                                            ;A7C0E5;
    db $0B,$1B                                                           ;A7C0E9;
    dw PLMEntries_crumbleKraidSpikeBlocks                                ;A7C0EB;
    JSL.L Spawn_Hardcoded_PLM                                            ;A7C0ED;
    db $0C,$1B                                                           ;A7C0F1;
    dw PLMEntries_crumbleKraidSpikeBlocks                                ;A7C0F3;
    JSL.L Spawn_Hardcoded_PLM                                            ;A7C0F5;
    db $0D,$1B                                                           ;A7C0F9;
    dw PLMEntries_crumbleKraidSpikeBlocks                                ;A7C0FB;
    JSL.L Spawn_Hardcoded_PLM                                            ;A7C0FD;
    db $0E,$1B                                                           ;A7C101;
    dw PLMEntries_crumbleKraidSpikeBlocks                                ;A7C103;
    RTS                                                                  ;A7C105;


;;; $C106: Unused. Crumble second section of Kraid's spike floor ;;;
UNUSED_CrumbleFirstSectionOfKraidsSpikeFloor_A7C106:
; Assuming PLMEntries_crumbleKraidSpikeBlocks used to be a PLM that only crumbled one block
    JSL.L Spawn_Hardcoded_PLM                                            ;A7C106;
    db $0F,$1B                                                           ;A7C10A;
    dw PLMEntries_crumbleKraidSpikeBlocks                                ;A7C10C;
    JSL.L Spawn_Hardcoded_PLM                                            ;A7C10E;
    db $10,$1B                                                           ;A7C112;
    dw PLMEntries_crumbleKraidSpikeBlocks                                ;A7C114;
    JSL.L Spawn_Hardcoded_PLM                                            ;A7C116;
    db $11,$1B                                                           ;A7C11A;
    dw PLMEntries_crumbleKraidSpikeBlocks                                ;A7C11C;
    JSL.L Spawn_Hardcoded_PLM                                            ;A7C11E;
    db $12,$1B                                                           ;A7C122;
    dw PLMEntries_crumbleKraidSpikeBlocks                                ;A7C124;
    JSL.L Spawn_Hardcoded_PLM                                            ;A7C126;
    db $13,$1B                                                           ;A7C12A;
    dw PLMEntries_crumbleKraidSpikeBlocks                                ;A7C12C;
    RTS                                                                  ;A7C12E;


;;; $C12F: Unused. Crumble third section of Kraid's spike floor ;;;
UNUSED_CrumbleFirstSectionOfKraidsSpikeFloor_A7C12F:
; Assuming PLMEntries_crumbleKraidSpikeBlocks used to be a PLM that only crumbled one block
    JSL.L Spawn_Hardcoded_PLM                                            ;A7C12F;
    db $14,$1B                                                           ;A7C133;
    dw PLMEntries_crumbleKraidSpikeBlocks                                ;A7C135;
    JSL.L Spawn_Hardcoded_PLM                                            ;A7C137;
    db $15,$1B                                                           ;A7C13B;
    dw PLMEntries_crumbleKraidSpikeBlocks                                ;A7C13D;
    JSL.L Spawn_Hardcoded_PLM                                            ;A7C13F;
    db $16,$1B                                                           ;A7C143;
    dw PLMEntries_crumbleKraidSpikeBlocks                                ;A7C145;
    JSL.L Spawn_Hardcoded_PLM                                            ;A7C147;
    db $17,$1B                                                           ;A7C14B;
    dw PLMEntries_crumbleKraidSpikeBlocks                                ;A7C14D;
    JSL.L Spawn_Hardcoded_PLM                                            ;A7C14F;
    db $18,$1B                                                           ;A7C153;
    dw PLMEntries_crumbleKraidSpikeBlocks                                ;A7C155;
    JSL.L Spawn_Hardcoded_PLM                                            ;A7C157;
    db $19,$1B                                                           ;A7C15B;
    dw PLMEntries_crumbleKraidSpikeBlocks                                ;A7C15D;
    JSL.L Spawn_Hardcoded_PLM                                            ;A7C15F;
    db $1A,$1B                                                           ;A7C163;
    dw PLMEntries_crumbleKraidSpikeBlocks                                ;A7C165;
    RTS                                                                  ;A7C167;
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $C168: Spawn PLM to clear the ceiling ;;;
SpawnPLMToClearTheCeiling:
    JSL.L Spawn_Hardcoded_PLM                                            ;A7C168;
    db $02,$12                                                           ;A7C16C;
    dw PLMEntries_clearKraidCeilingBlocks                                ;A7C16E;
    RTS                                                                  ;A7C170;


;;; $C171: Spawn PLM to clear the spikes ;;;
SpawnPLMToClearTheSpikes:
    JSL.L Spawn_Hardcoded_PLM                                            ;A7C171;
    db $05,$1B                                                           ;A7C175;
    dw PLMEntries_clearKraidSpikeBlocks                                  ;A7C177;
    RTS                                                                  ;A7C179;


if !FEATURE_KEEP_UNREFERENCED
;;; $C17A: Unused. Clear some of the spikes ;;;
UNUSED_ClearSomeOfTheSpikeBlocks_A7C17A:
; Assuming PLMEntries_clearKraidSpikeBlocks used to be a PLM that only crumbled one block
    JSL.L Spawn_Hardcoded_PLM                                            ;A7C17A;
    db $0B,$1B                                                           ;A7C17E;
    dw PLMEntries_clearKraidSpikeBlocks                                  ;A7C180;
    JSL.L Spawn_Hardcoded_PLM                                            ;A7C182;
    db $0C,$1B                                                           ;A7C186;
    dw PLMEntries_clearKraidSpikeBlocks                                  ;A7C188;
    JSL.L Spawn_Hardcoded_PLM                                            ;A7C18A;
    db $0D,$1B                                                           ;A7C18E;
    dw PLMEntries_clearKraidSpikeBlocks                                  ;A7C190;
    JSL.L Spawn_Hardcoded_PLM                                            ;A7C192;
    db $0E,$1B                                                           ;A7C196;
    dw PLMEntries_clearKraidSpikeBlocks                                  ;A7C198;
    JSL.L Spawn_Hardcoded_PLM                                            ;A7C19A;
    db $0F,$1B                                                           ;A7C19E;
    dw PLMEntries_clearKraidSpikeBlocks                                  ;A7C1A0;
    JSL.L Spawn_Hardcoded_PLM                                            ;A7C1A2;
    db $10,$1B                                                           ;A7C1A6;
    dw PLMEntries_clearKraidSpikeBlocks                                  ;A7C1A8;
    JSL.L Spawn_Hardcoded_PLM                                            ;A7C1AA;
    db $11,$1B                                                           ;A7C1AE;
    dw PLMEntries_clearKraidSpikeBlocks                                  ;A7C1B0;
    JSL.L Spawn_Hardcoded_PLM                                            ;A7C1B2;
    db $12,$1B                                                           ;A7C1B6;
    dw PLMEntries_clearKraidSpikeBlocks                                  ;A7C1B8;
    JSL.L Spawn_Hardcoded_PLM                                            ;A7C1BA;
    db $13,$1B                                                           ;A7C1BE;
    dw PLMEntries_clearKraidSpikeBlocks                                  ;A7C1C0;
    JSL.L Spawn_Hardcoded_PLM                                            ;A7C1C2;
    db $14,$1B                                                           ;A7C1C6;
    dw PLMEntries_clearKraidSpikeBlocks                                  ;A7C1C8;
    JSL.L Spawn_Hardcoded_PLM                                            ;A7C1CA;
    db $15,$1B                                                           ;A7C1CE;
    dw PLMEntries_clearKraidSpikeBlocks                                  ;A7C1D0;
    JSL.L Spawn_Hardcoded_PLM                                            ;A7C1D2;
    db $16,$1B                                                           ;A7C1D6;
    dw PLMEntries_clearKraidSpikeBlocks                                  ;A7C1D8;
    JSL.L Spawn_Hardcoded_PLM                                            ;A7C1DA;
    db $17,$1B                                                           ;A7C1DE;
    dw PLMEntries_clearKraidSpikeBlocks                                  ;A7C1E0;
    JSL.L Spawn_Hardcoded_PLM                                            ;A7C1E2;
    db $18,$1B                                                           ;A7C1E6;
    dw PLMEntries_clearKraidSpikeBlocks                                  ;A7C1E8;
    JSL.L Spawn_Hardcoded_PLM                                            ;A7C1EA;
    db $19,$1B                                                           ;A7C1EE;
    dw PLMEntries_clearKraidSpikeBlocks                                  ;A7C1F0;
    JSL.L Spawn_Hardcoded_PLM                                            ;A7C1F2;
    db $1A,$1B                                                           ;A7C1F6;
    dw PLMEntries_clearKraidSpikeBlocks                                  ;A7C1F8;
    RTS                                                                  ;A7C1FA;
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $C1FB: Unpause hook - Kraid is dead ;;;
UnpauseHook_KraidIsDead:
    PHP                                                                  ;A7C1FB;
    SEP #$20                                                             ;A7C1FC;
    JSL.L SetForceBlankAndWaitForNMI                                     ;A7C1FE;
    LDA.B #$00                                                           ;A7C202;
    STA.W $2116                                                          ;A7C204;
    LDA.B DP_BGTilesAddr                                                 ;A7C207;
    AND.B #$0F                                                           ;A7C209;
    ASL                                                                  ;A7C20B;
    ASL                                                                  ;A7C20C;
    ASL                                                                  ;A7C20D;
    ASL                                                                  ;A7C20E;
    CLC                                                                  ;A7C20F;
    ADC.B #$3F                                                           ;A7C210;
    STA.W $2117                                                          ;A7C212;
    LDA.B #$80                                                           ;A7C215;
    STA.W $2115                                                          ;A7C217;
    JSL.L SetupHDMATransfer                                              ;A7C21A;
    db $01,$01,$18                                                       ;A7C21E;
    dl Tiles_KraidRoomBackground                                         ;A7C221;
    dw $0200                                                             ;A7C224;
    LDA.B #$02                                                           ;A7C226;
    STA.W $420B                                                          ;A7C228;
    LDA.B #$00                                                           ;A7C22B;
    STA.W $2116                                                          ;A7C22D;
    LDA.B #$40                                                           ;A7C230;
    STA.W $2117                                                          ;A7C232;
    LDA.B #$80                                                           ;A7C235;
    STA.W $2115                                                          ;A7C237;
    JSL.L SetupHDMATransfer                                              ;A7C23A;
    db $01,$01,$18                                                       ;A7C23E;
    dl Tiles_Standard_BG3                                                ;A7C241;
    dw $0800                                                             ;A7C244;
    LDA.B #$02                                                           ;A7C246;
    STA.W $420B                                                          ;A7C248;
    JMP.W TransferKraidTopHalfTilemapToVRAM                              ;A7C24B;


;;; $C24E: Unpause hook - Kraid is alive ;;;
UnpauseHook_KraidIsAlive:
; DP_BGTilesAddr isn't being masked, so this code only works because BG1 tiles base address = $0000
    PHP                                                                  ;A7C24E;
    SEP #$20                                                             ;A7C24F;
    JSL.L SetForceBlankAndWaitForNMI                                     ;A7C251;
    LDA.B #$00                                                           ;A7C255;
    STA.W $2116                                                          ;A7C257;
    LDA.B DP_BGTilesAddr                                                 ;A7C25A;
    CLC                                                                  ;A7C25C;
    ADC.B #$3E                                                           ;A7C25D;
    STA.W $2117                                                          ;A7C25F;
    LDA.B #$80                                                           ;A7C262;
    STA.W $2115                                                          ;A7C264;
    JSL.L SetupHDMATransfer                                              ;A7C267;
    db $01,$01,$18                                                       ;A7C26B;
    dl CopyOfVRAMDuringPauseMenuKraidRoom                                ;A7C26E;
    dw $0400                                                             ;A7C271;
    LDA.B #$02                                                           ;A7C273;
    STA.W $420B                                                          ;A7C275; fallthrough to TransferKraidTopHalfTilemapToVRAM


;;; $C278: Transfer Kraid top half tilemap to VRAM ;;;
TransferKraidTopHalfTilemapToVRAM:
    LDA.B #$00                                                           ;A7C278;
    STA.W $2116                                                          ;A7C27A;
    LDA.B DP_BG2TilemapAddrSize                                          ;A7C27D;
    AND.B #$FC                                                           ;A7C27F;
    STA.W $2117                                                          ;A7C281;
    LDA.B #$80                                                           ;A7C284;
    STA.W $2115                                                          ;A7C286;
    JSL.L SetupHDMATransfer                                              ;A7C289;
    db $01,$01,$18                                                       ;A7C28D;
    dl EnemyBG2Tilemap                                                   ;A7C290;
    dw $0800                                                             ;A7C293;
    LDA.B #$02                                                           ;A7C295;
    STA.W $420B                                                          ;A7C297;
    JSL.L ClearForceBlankAndWaitForNMI                                   ;A7C29A;
    PLP                                                                  ;A7C29E;
    RTL                                                                  ;A7C29F;


;;; $C2A0: Unpause hook - Kraid is sinking ;;;
UnpauseHook_KraidIsSinking:
; DP_BGTilesAddr isn't being masked, so this code only works because BG1 tiles base address = $0000
; Note that this routine is spending a frame on each row of Kraid it erases (worst case, 28 frames),
; the forced blank isn't even being used to transfer the tilemap on demand... and only one transfer is being queued per frame...
; Also note that VRAMWriteStack is being loaded for no reason (guaranteed to be 0), in fact, if it wasn't guaranteed to be 0,
; this loading procedure would end up repeating every transfer that was requested before this routine was started.
    PHP                                                                  ;A7C2A0;
    SEP #$20                                                             ;A7C2A1;
    JSL.L SetForceBlankAndWaitForNMI                                     ;A7C2A3;
    LDA.B #$00                                                           ;A7C2A7;
    STA.W $2116                                                          ;A7C2A9;
    LDA.B DP_BGTilesAddr                                                 ;A7C2AC;
    CLC                                                                  ;A7C2AE;
    ADC.B #$3E                                                           ;A7C2AF;
    STA.W $2117                                                          ;A7C2B1;
    LDA.B #$80                                                           ;A7C2B4;
    STA.W $2115                                                          ;A7C2B6;
    JSL.L SetupHDMATransfer                                              ;A7C2B9;
    db $01,$01,$18                                                       ;A7C2BD;
    dl CopyOfVRAMDuringPauseMenuKraidRoom                                ;A7C2C0;
    dw $0400                                                             ;A7C2C3;
    LDA.B #$02                                                           ;A7C2C5;
    STA.W $420B                                                          ;A7C2C7;
    REP #$30                                                             ;A7C2CA;
    PHB                                                                  ;A7C2CC;
    PHK                                                                  ;A7C2CD;
    PLB                                                                  ;A7C2CE;
    LDA.W Enemy.YPosition                                                ;A7C2CF;
    CMP.W ShrinkingKraidTable_KraidYPosition                             ;A7C2D2;
    BMI .return                                                          ;A7C2D5;
    LDY.W #$0000                                                         ;A7C2D7;
    LDX.W VRAMWriteStack                                                 ;A7C2DA;

  .loop:
    REP #$30                                                             ;A7C2DD;
    LDA.W ShrinkingKraidTable_KraidYPosition,Y                           ;A7C2DF;
    CMP.W #$FFFF                                                         ;A7C2E2;
    BEQ .return                                                          ;A7C2E5;
    LDA.W Enemy.YPosition                                                ;A7C2E7;
    CMP.W ShrinkingKraidTable_KraidYPosition,Y                           ;A7C2EA;
    BMI .return                                                          ;A7C2ED;
    LDA.W #$0040                                                         ;A7C2EF;
    STA.B VRAMWrite.size,X                                               ;A7C2F2;
    LDA.W #EnemyBG2Tilemap+$FC0                                          ;A7C2F4;
    STA.B VRAMWrite.src,X                                                ;A7C2F7;
    LDA.W #EnemyBG2Tilemap>>16                                           ;A7C2F9;
    STA.B VRAMWrite.src+2,X                                              ;A7C2FC;
    LDA.B DP_BG2TilemapAddrSize                                          ;A7C2FE;
    AND.W #$00FC                                                         ;A7C300;
    XBA                                                                  ;A7C303;
    CLC                                                                  ;A7C304;
    ADC.W ShrinkingKraidTable_VRAMBG2TilemapOffset,Y                     ;A7C305;
    STA.B VRAMWrite.dest,X                                               ;A7C308;
    TXA                                                                  ;A7C30A;
    CLC                                                                  ;A7C30B;
    ADC.W #$0007                                                         ;A7C30C;
    STA.W VRAMWriteStack                                                 ;A7C30F;
    JSL.L WaitForNMI                                                     ;A7C312;
    TYA                                                                  ;A7C316;
    CLC                                                                  ;A7C317;
    ADC.W #$0006                                                         ;A7C318;
    TAY                                                                  ;A7C31B;
    BRA .loop                                                            ;A7C31C;

  .return:
    PLB                                                                  ;A7C31E;
    JSL.L SetForceBlankAndWaitForNMI                                     ;A7C31F;
    PLP                                                                  ;A7C323;
    RTL                                                                  ;A7C324;


;;; $C325: Pause hook - Kraid ;;;
PauseHook_Kraid:
; DP_BGTilesAddr is being masked as if its a tilemap register (completely wrong), so this code only works because BG1/2 tiles base address = $0000
    PHP                                                                  ;A7C325;
    REP #$30                                                             ;A7C326;
    LDX.W VRAMReadStack                                                  ;A7C328;
    LDA.B DP_BGTilesAddr                                                 ;A7C32B;
    AND.W #$00FC                                                         ;A7C32D;
    XBA                                                                  ;A7C330;
    CLC                                                                  ;A7C331;
    ADC.W #$3E00                                                         ;A7C332;
    STA.W VRAMRead.src,X                                                 ;A7C335;
    LDA.W #$0081                                                         ;A7C338;
    STA.W VRAMRead.control,X                                             ;A7C33B;
    LDA.W #$0039                                                         ;A7C33E;
    STA.W VRAMRead.target,X                                              ;A7C341;
    LDA.W #CopyOfVRAMDuringPauseMenuKraidRoom                            ;A7C344;
    STA.W VRAMRead.dest,X                                                ;A7C347;
    LDA.W #CopyOfVRAMDuringPauseMenuKraidRoom>>16                        ;A7C34A;
    STA.W VRAMRead.dest+2,X                                              ;A7C34D;
    LDA.W #$0400                                                         ;A7C350;
    STA.W VRAMRead.size,X                                                ;A7C353;
    TXA                                                                  ;A7C356;
    CLC                                                                  ;A7C357;
    ADC.W #$0009                                                         ;A7C358;
    STA.W VRAMReadStack                                                  ;A7C35B;
    PLP                                                                  ;A7C35E;
    RTL                                                                  ;A7C35F;


;;; $C360: Kraid death - initialise death ;;;
KraidDeath_Initialize:
    LDA.L Kraid.hurtFrame                                                ;A7C360;
    BEQ .notHurtFrame                                                    ;A7C364;
    RTL                                                                  ;A7C366;

  .notHurtFrame:
    LDX.W #$00C0                                                         ;A7C367;
    LDA.W #$0000                                                         ;A7C36A;

  .loopPalette6:
    STA.L TargetPalettes_BGP0,X                                          ;A7C36D;
    INX                                                                  ;A7C371;
    INX                                                                  ;A7C372;
    CPX.W #$00E0                                                         ;A7C373;
    BMI .loopPalette6                                                    ;A7C376;
    LDX.W #$001E                                                         ;A7C378;

  .loopPalette7:
    LDA.W Palette_Kraid_Death,X                                          ;A7C37B;
    STA.L Palettes_BG12P7,X                                              ;A7C37E;
    DEX                                                                  ;A7C382;
    DEX                                                                  ;A7C383;
    BPL .loopPalette7                                                    ;A7C384;
    LDA.W #InstList_KraidArm_Dying_PreparingToLungeForward               ;A7C386;
    STA.W Enemy[1].instList                                              ;A7C389;
    LDA.W #$0001                                                         ;A7C38C;
    STA.W Enemy[1].instTimer                                             ;A7C38F;
    LDA.W #KraidDeath_FadeOutBackground                                  ;A7C392;
    STA.W Kraid.function                                                 ;A7C395;
    LDA.W #InstList_Kraid_Dying_1                                        ;A7C398;
    STA.W Kraid.instListPointer                                          ;A7C39B;
    LDA.W InstList_Kraid_Dying_0                                         ;A7C39E;
    STA.W Kraid.instructionTimer                                         ;A7C3A1;
    LDX.W EnemyIndex                                                     ;A7C3A4;
    PHX                                                                  ;A7C3A7;
    LDA.W Enemy[6].properties                                            ;A7C3A8;
    AND.W #$BFFF                                                         ;A7C3AB;
    STA.W Enemy[6].properties                                            ;A7C3AE;
    LDA.W #$0180                                                         ;A7C3B1;
    STA.W EnemyIndex                                                     ;A7C3B4;
    JSL.L EnemyDeath                                                     ;A7C3B7;
    LDA.W Enemy[7].properties                                            ;A7C3BB;
    AND.W #$BFFF                                                         ;A7C3BE;
    STA.W Enemy[7].properties                                            ;A7C3C1;
    LDA.W #$01C0                                                         ;A7C3C4;
    STA.W EnemyIndex                                                     ;A7C3C7;
    JSL.L EnemyDeath                                                     ;A7C3CA;
    LDA.W #$0080                                                         ;A7C3CE;
    STA.W EnemyIndex                                                     ;A7C3D1;
    JSL.L EnemyDeath                                                     ;A7C3D4;
    LDA.W #$00C0                                                         ;A7C3D8;
    STA.W EnemyIndex                                                     ;A7C3DB;
    JSL.L EnemyDeath                                                     ;A7C3DE;
    LDA.W #$0100                                                         ;A7C3E2;
    STA.W EnemyIndex                                                     ;A7C3E5;
    JSL.L EnemyDeath                                                     ;A7C3E8;
    PLA                                                                  ;A7C3EC;
    STA.W EnemyIndex                                                     ;A7C3ED;
    JSL.L Spawn_Hardcoded_PLM                                            ;A7C3F0;
    db $05,$1B                                                           ;A7C3F4;
    dw PLMEntries_crumbleKraidSpikeBlocks                                ;A7C3F6;
    RTL                                                                  ;A7C3F8;


;;; $C3F9: Kraid death - fade out background ;;;
KraidDeath_FadeOutBackground:
; Note that BG1 tiles base address = (DP_BGTilesAddr & Fh) * 1000h, whereas this routine is using (DP_BGTilesAddr & Fh) * 100h,
; i.e. this routine only works because BG1 tiles base address = $0000
    JSR.W KraidInstListHandling                                          ;A7C3F9;
    JSL.L Advance_GradualColorChange_ofBGPalette6                        ;A7C3FC;
    BCC .return                                                          ;A7C400;
    LDA.W #KraidDeath_UpdateBG2TilemapTopHalf                            ;A7C402;
    STA.W Kraid.function                                                 ;A7C405;
    LDA.W #$0001                                                         ;A7C408;
    STA.L Kraid.hurtFrameTimer                                           ;A7C40B;
    STA.L Kraid.hurtFrame                                                ;A7C40F;
    JSR.W KraidPaletteHandling                                           ;A7C413;
    LDX.W #$0000                                                         ;A7C416;
    LDA.W #$0000                                                         ;A7C419;

  .loopClearRoomBackground:
    STA.L BG2Tilemap,X                                                   ;A7C41C;
    STA.L BG2Tilemap+2,X                                                 ;A7C420;
    INX                                                                  ;A7C424;
    INX                                                                  ;A7C425;
    INX                                                                  ;A7C426;
    INX                                                                  ;A7C427;
    CPX.W #$0200                                                         ;A7C428;
    BMI .loopClearRoomBackground                                         ;A7C42B;
    LDX.W VRAMWriteStack                                                 ;A7C42D;
    LDA.W #$0200                                                         ;A7C430;
    STA.B VRAMWrite.size,X                                               ;A7C433;
    LDA.W #BG2Tilemap                                                    ;A7C435;
    STA.B VRAMWrite.src,X                                                ;A7C438;
    SEP #$20                                                             ;A7C43A;
    LDA.B #BG2Tilemap>>16                                                ;A7C43C;
    STA.B VRAMWrite.src+2,X                                              ;A7C43E;
    REP #$20                                                             ;A7C440;
    LDA.B DP_BGTilesAddr                                                 ;A7C442;
    AND.W #$000F                                                         ;A7C444;
    XBA                                                                  ;A7C447;
    CLC                                                                  ;A7C448;
    ADC.W #$3F00                                                         ;A7C449;
    STA.B VRAMWrite.dest,X                                               ;A7C44C;
    TXA                                                                  ;A7C44E;
    CLC                                                                  ;A7C44F;
    ADC.W #$0007                                                         ;A7C450;
    STA.W VRAMWriteStack                                                 ;A7C453;

  .return:
    RTL                                                                  ;A7C456;


if !FEATURE_KEEP_UNREFERENCED
;;; $C457: Unused. Process Kraid instruction, except there's no ASM instructions ;;;
UNUSED_ProcessKraidInstruction_WithNoASMInstructions_A7C457:
    LDA.W Kraid.instructionTimer                                         ;A7C457;
    BEQ .return                                                          ;A7C45A;
    DEC.W Kraid.instructionTimer                                         ;A7C45C;
    BNE .return                                                          ;A7C45F;
    LDX.W Kraid.instListPointer                                          ;A7C461;
    LDA.W $0000,X                                                        ;A7C464;
    BPL .timer                                                           ;A7C467;
    LDA.W #$0000                                                         ;A7C469;
    STA.W Kraid.instructionTimer                                         ;A7C46C;
    RTS                                                                  ;A7C46F;

  .timer:
    STA.W Kraid.instructionTimer                                         ;A7C470;
    TXA                                                                  ;A7C473;
    CLC                                                                  ;A7C474;
    ADC.W #$0008                                                         ;A7C475;
    STA.W Kraid.instListPointer                                          ;A7C478;
    LDA.W $0002,X                                                        ;A7C47B;
    TAY                                                                  ;A7C47E;
    LDX.W VRAMWriteStack                                                 ;A7C47F;
    LDA.W #$02C0                                                         ;A7C482;
    STA.B VRAMWrite.size,X                                               ;A7C485;
    INX                                                                  ;A7C487;
    INX                                                                  ;A7C488;
    STY.B VRAMWrite.size,X                                               ;A7C489;
    INX                                                                  ;A7C48B;
    INX                                                                  ;A7C48C;
    SEP #$20                                                             ;A7C48D;
    LDA.B #Tilemap_KraidHead_0>>16                                       ;A7C48F;
    STA.B VRAMWrite.size,X                                               ;A7C491;
    REP #$20                                                             ;A7C493;
    INX                                                                  ;A7C495;
    LDA.B DP_BG2TilemapAddrSize                                          ;A7C496;
    AND.W #$00FC                                                         ;A7C498;
    XBA                                                                  ;A7C49B;
    STA.B VRAMWrite.size,X                                               ;A7C49C;
    INX                                                                  ;A7C49E;
    INX                                                                  ;A7C49F;
    STX.W VRAMWriteStack                                                 ;A7C4A0;

  .return:
    RTS                                                                  ;A7C4A3;
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $C4A4: Kraid death - update BG2 tilemap top half ;;;
KraidDeath_UpdateBG2TilemapTopHalf:
    JSR.W KraidInstListHandling                                          ;A7C4A4;
    LDA.W #KraidDeath_UpdateBG2TilemapBottomHalf                         ;A7C4A7;
    STA.W Kraid.function                                                 ;A7C4AA;
    LDA.W #Function_KraidNail_HorizontallyAlignEnemyToKraid              ;A7C4AD;
    STA.W Enemy[2].var0                                                  ;A7C4B0;
    STA.W Enemy[3].var0                                                  ;A7C4B3;
    STA.W Enemy[4].var0                                                  ;A7C4B6;
    LDA.W #$7FFF                                                         ;A7C4B9;
    STA.W Enemy[2].var5                                                  ;A7C4BC;
    STA.W Enemy[3].var5                                                  ;A7C4BF;
    STA.W Enemy[4].var5                                                  ;A7C4C2;
    JMP.W UpdateBG2TilemapTopHalf                                        ;A7C4C5;


;;; $C4C8: Kraid death - update BG2 tilemap bottom half ;;;
KraidDeath_UpdateBG2TilemapBottomHalf:
    JSR.W KraidInstListHandling                                          ;A7C4C8;
    SEP #$20                                                             ;A7C4CB;
    LDA.B #UnpauseHook_KraidIsSinking>>16                                ;A7C4CD;
    STA.W PauseHook_Unpause+2                                            ;A7C4CF;
    REP #$20                                                             ;A7C4D2;
    LDA.W #UnpauseHook_KraidIsSinking                                    ;A7C4D4;
    STA.W PauseHook_Unpause                                              ;A7C4D7;
    LDA.W #KraidDeath_SinkThroughFloor                                   ;A7C4DA;
    STA.W Kraid.function                                                 ;A7C4DD;
    LDA.W #$002B                                                         ;A7C4E0;
    STA.L KraidDeathSequenceQuakeSoundTimer                              ;A7C4E3;
    LDA.W Enemy.properties                                               ;A7C4E7;
    ORA.W #$8000                                                         ;A7C4EA;
    STA.W Enemy.properties                                               ;A7C4ED;
    LDA.W #$0001                                                         ;A7C4F0;
    STA.W EarthquakeType                                                 ;A7C4F3;
    LDA.W #$0100                                                         ;A7C4F6;
    STA.W EarthquakeTimer                                                ;A7C4F9;
    LDA.W #InstList_KraidArm_RisingSinking                               ;A7C4FC;
    STA.W Enemy[1].instList                                              ;A7C4FF;
    LDA.W #$0001                                                         ;A7C502;
    STA.W Enemy[1].instTimer                                             ;A7C505;
    LDA.W #InstList_KraidFoot_Initial                                    ;A7C508;
    STA.W Enemy[5].instList                                              ;A7C50B;
    LDA.W #$0001                                                         ;A7C50E;
    STA.W Enemy[5].instTimer                                             ;A7C511;
    LDA.W #RTL_A7BA2D                                                    ;A7C514;
    STA.W Enemy[5].var0                                                  ;A7C517;
    JMP.W UpdateBG2TilemapBottomHalf                                     ;A7C51A;


;;; $C51D: Play sound every half second ;;;
PlaySoundEveryHalfSecond:
    LDA.L KraidDeathSequenceQuakeSoundTimer                              ;A7C51D;
    DEC                                                                  ;A7C521;
    STA.L KraidDeathSequenceQuakeSoundTimer                              ;A7C522;
    BNE .return                                                          ;A7C526;
    LDA.W #$001E                                                         ;A7C528;
    JSL.L QueueSound_Lib3_Max6                                           ;A7C52B;
    LDA.W #$001E                                                         ;A7C52F;
    STA.L KraidDeathSequenceQuakeSoundTimer                              ;A7C532;

  .return:
    RTS                                                                  ;A7C536;


;;; $C537: Kraid death - Kraid sinks through floor ;;;
KraidDeath_SinkThroughFloor:
    JSR.W KraidInstListHandling                                          ;A7C537;
    JSR.W PlaySoundEveryHalfSecond                                       ;A7C53A;
    JSR.W HandleKraidSinking                                             ;A7C53D;
    INC.W Enemy.YPosition                                                ;A7C540;
    LDA.W Enemy.YPosition                                                ;A7C543;
    CMP.W #$0260                                                         ;A7C546;
    BMI .return                                                          ;A7C549;
    LDA.W Enemy.properties                                               ;A7C54B;
    AND.W #$FBFF                                                         ;A7C54E;
    STA.W Enemy.properties                                               ;A7C551;
    LDA.W #$0002                                                         ;A7C554;
    STA.W EnemyBG2TilemapSize                                            ;A7C557;
    LDY.W EnemyIndex                                                     ;A7C55A;
    LDX.W Enemy.ID,Y                                                     ;A7C55D;
    LDA.W #Common_RTL_A0804C                                                    ;A7C560;
    STA.L EnemyHeaders_enemyShot,X                                       ;A7C563;
    LDA.W Enemy[1].properties                                            ;A7C567;
    ORA.W #$0200                                                         ;A7C56A; >.< #$0600
    ORA.W #$0400                                                         ;A7C56D;
    STA.W Enemy[1].properties                                            ;A7C570;
    ORA.W #$0200                                                         ;A7C573; >.< #$0600
    ORA.W #$0400                                                         ;A7C576;
    AND.W #$F7FF                                                         ;A7C579; >.< #$57FF
    AND.W #$DFFF                                                         ;A7C57C;
    AND.W #$7FFF                                                         ;A7C57F;
    STA.W Enemy[2].properties                                            ;A7C582;
    STA.W Enemy[3].properties                                            ;A7C585;
    STA.W Enemy[4].properties                                            ;A7C588;
    STA.W Enemy[5].properties                                            ;A7C58B;
    LDA.W #Function_Kraid_FadeInRegularBG_ClearBG2TilemapTopHalf         ;A7C58E;
    STA.W Kraid.function                                                 ;A7C591;
    STZ.W CameraDistanceIndex                                            ;A7C594;
    JSL.L KraidDeathItemDropRoutine                                      ;A7C597;
    JMP.W DrawKraidsRoomBackground                                       ;A7C59B;

  .return:
    RTL                                                                  ;A7C59E;


;;; $C59F: Handle Kraid sinking ;;;
HandleKraidSinking:
; Note that Kraid *does* need to be cleared as he's sinking, otherwise he will wrap around from the ceiling
    LDY.W #$0000                                                         ;A7C59F;

  .loop:
    LDA.W ShrinkingKraidTable_KraidYPosition,Y                           ;A7C5A2;
    BMI .return                                                          ;A7C5A5;
    CMP.W Enemy.YPosition                                                ;A7C5A7;
    BEQ .found                                                           ;A7C5AA;
    TYA                                                                  ;A7C5AC;
    CLC                                                                  ;A7C5AD;
    ADC.W #$0006                                                         ;A7C5AE;
    TAY                                                                  ;A7C5B1;
    BRA .loop                                                            ;A7C5B2;

  .found:
    LDA.W ShrinkingKraidTable_VRAMBG2TilemapOffset,Y                     ;A7C5B4;
    BMI .executeFunction                                                 ;A7C5B7;
    LDX.W VRAMWriteStack                                                 ;A7C5B9;
    LDA.W #$0040                                                         ;A7C5BC;
    STA.B VRAMWrite.size,X                                               ;A7C5BF;
    LDA.W #EnemyBG2Tilemap+$FC0                                          ;A7C5C1;
    STA.B VRAMWrite.src,X                                                ;A7C5C4;
    SEP #$20                                                             ;A7C5C6;
    LDA.B #EnemyBG2Tilemap>>16                                           ;A7C5C8;
    STA.B VRAMWrite.src+2,X                                              ;A7C5CA;
    REP #$20                                                             ;A7C5CC;
    LDA.B DP_BG2TilemapAddrSize                                          ;A7C5CE;
    AND.W #$00FC                                                         ;A7C5D0;
    XBA                                                                  ;A7C5D3;
    CLC                                                                  ;A7C5D4;
    ADC.W ShrinkingKraidTable_VRAMBG2TilemapOffset,Y                     ;A7C5D5;
    STA.B VRAMWrite.dest,X                                               ;A7C5D8;
    TXA                                                                  ;A7C5DA;
    CLC                                                                  ;A7C5DB;
    ADC.W #$0007                                                         ;A7C5DC;
    STA.W VRAMWriteStack                                                 ;A7C5DF;

  .executeFunction:
    TYX                                                                  ;A7C5E2;
    JSR.W (ShrinkingKraidTable_functionPointer,X)                        ;A7C5E3;

  .return:
    RTS                                                                  ;A7C5E6;


;;; $C5E7: Sinking Kraid table ;;;
ShrinkingKraidTable:
;        _______________ Kraid Y position
;       |      _________ VRAM BG2 tilemap offset (from which to clear 20h words)
;       |     |      ___ Function
;       |     |     |
  .KraidYPosition:
    dw $0130                                                             ;A7C5E7; Crumble left platform - left
  .VRAMBG2TilemapOffset:
    dw       $08A0                                                       ;A7C5E9;
  .functionPointer:
    dw             CrumbleLeftPlatform_Left                              ;A7C5EB;
    dw $0138,$0880                                                       ;A7C5ED;
    dw             RTS_A7C6A6                                            ;A7C5F1;
    dw $0140,$0860                                                       ;A7C5F3;
    dw             RTS_A7C6A6                                            ;A7C5F7;
    dw $0148,$0840                                                       ;A7C5F9; Crumble right platform - middle
    dw             CrumbleRightPlatform_Middle                           ;A7C5FD;
    dw $0150,$0820                                                       ;A7C5FF;
    dw             RTS_A7C6A6                                            ;A7C603;
    dw $0158,$0800                                                       ;A7C605;
    dw             RTS_A7C6A6                                            ;A7C609;
    dw $0160,$03E0                                                       ;A7C60B; Crumble right platform - left
    dw             CrumbleRightPlatform_Left                             ;A7C60F;
    dw $0168,$03C0                                                       ;A7C611;
    dw             RTS_A7C6A6                                            ;A7C615;
    dw $0170,$03A0                                                       ;A7C617;
    dw             RTS_A7C6A6                                            ;A7C61B;
    dw $0178,$0380                                                       ;A7C61D;
    dw             RTS_A7C6A6                                            ;A7C621;
    dw $0180,$0360                                                       ;A7C623; Crumble left platform - right
    dw             CrumbleLeftPlatform_Right                             ;A7C627;
    dw $0188,$0340                                                       ;A7C629;
    dw             RTS_A7C6A6                                            ;A7C62D;
    dw $0190,$0320                                                       ;A7C62F;
    dw             RTS_A7C6A6                                            ;A7C633;
    dw $0198,$0300                                                       ;A7C635; Crumble left platform - middle
    dw             CrumbleLeftPlatform_Middle                            ;A7C639;
    dw $01A0,$02E0                                                       ;A7C63B;
    dw             RTS_A7C6A6                                            ;A7C63F;
    dw $01A8,$02C0                                                       ;A7C641;
    dw             RTS_A7C6A6                                            ;A7C645;
    dw $01B0,$02A0                                                       ;A7C647; Crumble right platform - right
    dw             CrumbleRightPlatform_Right                            ;A7C64B;
    dw $01B8,$0280                                                       ;A7C64D;
    dw             RTS_A7C6A6                                            ;A7C651;
    dw $01C0,$0260                                                       ;A7C653;
    dw             RTS_A7C6A6                                            ;A7C657;
    dw $01C8,$0240                                                       ;A7C659;
    dw             RTS_A7C6A6                                            ;A7C65D;
    dw $01D0,$0220                                                       ;A7C65F;
    dw             RTS_A7C6A6                                            ;A7C663;
    dw $01D8,$0200                                                       ;A7C665;
    dw             RTS_A7C6A6                                            ;A7C669;
    dw $01E0,$01E0                                                       ;A7C66B;
    dw             RTS_A7C6A6                                            ;A7C66F;
    dw $01E8,$01C0                                                       ;A7C671;
    dw             RTS_A7C6A6                                            ;A7C675;
    dw $01F0,$01A0                                                       ;A7C677;
    dw             RTS_A7C6A6                                            ;A7C67B;
    dw $01F8,$0180                                                       ;A7C67D;
    dw             RTS_A7C6A6                                            ;A7C681;
    dw $0200,$0160                                                       ;A7C683;
    dw             RTS_A7C6A6                                            ;A7C687;
    dw $0208,$0140                                                       ;A7C689;
    dw             RTS_A7C6A6                                            ;A7C68D;
    dw $FFFF                                                             ;A7C68F;


;;; $C691: Crumble left platform - left ;;;
CrumbleLeftPlatform_Left:
    LDA.W #$0070                                                         ;A7C691;
    LDY.W #EnemyProjectile_KraidCeilingRocks                             ;A7C694;
    LDX.W EnemyIndex                                                     ;A7C697;
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics                     ;A7C69A;
    JSL.L Spawn_Hardcoded_PLM                                            ;A7C69E; fallthrough to RTS_A7C6A6
    db $07,$12                                                           ;A7C6A2;
    dw PLMEntries_setKraidCeilingBlockToBackground2                      ;A7C6A4;

RTS_A7C6A6:
    RTS                                                                  ;A7C6A6;


;;; $C6A7: Crumble right platform - middle ;;;
CrumbleRightPlatform_Middle:
    LDA.W #$00F0                                                         ;A7C6A7;
    LDY.W #EnemyProjectile_KraidCeilingRocks                             ;A7C6AA;
    LDX.W EnemyIndex                                                     ;A7C6AD;
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics                     ;A7C6B0;
    JSL.L Spawn_Hardcoded_PLM                                            ;A7C6B4;
    db $0F,$12                                                           ;A7C6B8;
    dw PLMEntries_setKraidCeilingBlockToBackground2                      ;A7C6BA;
    RTS                                                                  ;A7C6BC;


;;; $C6BD: Crumble right platform - left ;;;
CrumbleRightPlatform_Left:
    LDA.W #$00E0                                                         ;A7C6BD;
    LDY.W #EnemyProjectile_KraidCeilingRocks                             ;A7C6C0;
    LDX.W EnemyIndex                                                     ;A7C6C3;
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics                     ;A7C6C6;
    JSL.L Spawn_Hardcoded_PLM                                            ;A7C6CA;
    db $0E,$12                                                           ;A7C6CE;
    dw PLMEntries_SetKraidCeilingBlockToBackground3                      ;A7C6D0;
    RTS                                                                  ;A7C6D2;


;;; $C6D3: Crumble left platform - right ;;;
CrumbleLeftPlatform_Right:
    LDA.W #$0090                                                         ;A7C6D3;
    LDY.W #EnemyProjectile_KraidCeilingRocks                             ;A7C6D6;
    LDX.W EnemyIndex                                                     ;A7C6D9;
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics                     ;A7C6DC;
    JSL.L Spawn_Hardcoded_PLM                                            ;A7C6E0;
    db $09,$12                                                           ;A7C6E4;
    dw PLMEntries_setKraidCeilingBlockToBackground2                      ;A7C6E6;
    RTS                                                                  ;A7C6E8;


;;; $C6E9: Crumble left platform - middle ;;;
CrumbleLeftPlatform_Middle:
    LDA.W #$0080                                                         ;A7C6E9;
    LDY.W #EnemyProjectile_KraidCeilingRocks                             ;A7C6EC;
    LDX.W EnemyIndex                                                     ;A7C6EF;
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics                     ;A7C6F2;
    JSL.L Spawn_Hardcoded_PLM                                            ;A7C6F6;
    db $08,$12                                                           ;A7C6FA;
    dw PLMEntries_SetKraidCeilingBlockToBackground3                      ;A7C6FC;
    RTS                                                                  ;A7C6FE;


;;; $C6FF: Crumble right platform - right ;;;
CrumbleRightPlatform_Right:
    LDA.W #$0100                                                         ;A7C6FF;
    LDY.W #EnemyProjectile_KraidCeilingRocks                             ;A7C702;
    LDX.W EnemyIndex                                                     ;A7C705;
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics                     ;A7C708;
    JSL.L Spawn_Hardcoded_PLM                                            ;A7C70C;
    db $10,$12                                                           ;A7C710;
    dw PLMEntries_SetKraidCeilingBlockToBackground3                      ;A7C712;
    RTS                                                                  ;A7C714;


;;; $C715: Kraid function - fade in regular background - clear BG2 tilemap top half ;;;
Function_Kraid_FadeInRegularBG_ClearBG2TilemapTopHalf:
    SEP #$20                                                             ;A7C715;
    LDA.B #$48                                                           ;A7C717;
    STA.B DP_BG2TilemapAddrSize                                          ;A7C719;
    REP #$20                                                             ;A7C71B;
    LDX.W #$07FE                                                         ;A7C71D;
    LDA.W #$0338                                                         ;A7C720;

  .loop:
    STA.L EnemyBG2Tilemap,X                                              ;A7C723;
    DEX                                                                  ;A7C727;
    DEX                                                                  ;A7C728;
    BPL .loop                                                            ;A7C729;
    LDX.W VRAMWriteStack                                                 ;A7C72B;
    LDA.W #$0400                                                         ;A7C72E;
    STA.B VRAMWrite.size,X                                               ;A7C731;
    LDA.W #EnemyBG2Tilemap                                               ;A7C733;
    STA.B VRAMWrite.src,X                                                ;A7C736;
    LDA.W #EnemyBG2Tilemap>>16                                           ;A7C738;
    STA.B VRAMWrite.src+2,X                                              ;A7C73B;
    LDA.W #$4800                                                         ;A7C73D;
    STA.B VRAMWrite.dest,X                                               ;A7C740;
    TXA                                                                  ;A7C742;
    CLC                                                                  ;A7C743;
    ADC.W #$0007                                                         ;A7C744;
    STA.W VRAMWriteStack                                                 ;A7C747;
    LDA.W #Function_Kraid_FadeInRegularBG_ClearBG2TilemapBottomHalf      ;A7C74A;
    STA.W Kraid.function                                                 ;A7C74D;
    RTL                                                                  ;A7C750;


;;; $C751: Kraid function - fade in regular background - clear BG2 tilemap bottom half ;;;
Function_Kraid_FadeInRegularBG_ClearBG2TilemapBottomHalf:
    LDX.W VRAMWriteStack                                                 ;A7C751;
    LDA.W #$0400                                                         ;A7C754;
    STA.B VRAMWrite.size,X                                               ;A7C757;
    LDA.W #EnemyBG2Tilemap                                               ;A7C759;
    STA.B VRAMWrite.src,X                                                ;A7C75C;
    LDA.W #EnemyBG2Tilemap>>16                                           ;A7C75E;
    STA.B VRAMWrite.src+2,X                                              ;A7C761;
    LDA.W #$4A00                                                         ;A7C763;
    STA.B VRAMWrite.dest,X                                               ;A7C766;
    TXA                                                                  ;A7C768;
    CLC                                                                  ;A7C769;
    ADC.W #$0007                                                         ;A7C76A;
    STA.W VRAMWriteStack                                                 ;A7C76D;
    LDA.W #Function_Kraid_FadeInRegularBG_LoadStandardBG3Tiles_0         ;A7C770;
    STA.W Kraid.function                                                 ;A7C773;
    RTL                                                                  ;A7C776;


;;; $C777: Kraid function - fade in regular background - load standard BG3 tiles 1/4 ;;;
Function_Kraid_FadeInRegularBG_LoadStandardBG3Tiles_0:
    LDA.W #UnpauseHook_KraidIsDead                                       ;A7C777;
    STA.W PauseHook_Unpause                                              ;A7C77A;
    LDA.W #Function_Kraid_FadeInRegularBG_LoadStandardBG3Tiles_1         ;A7C77D;
    STA.W Kraid.function                                                 ;A7C780;
    LDX.W VRAMWriteStack                                                 ;A7C783;
    LDA.W #$0400                                                         ;A7C786;
    STA.B VRAMWrite.size,X                                               ;A7C789;
    LDA.W #Tiles_Standard_BG3                                            ;A7C78B;
    STA.B VRAMWrite.src,X                                                ;A7C78E;
    LDA.W #Tiles_Standard_BG3>>16                                        ;A7C790;
    STA.B VRAMWrite.src+2,X                                              ;A7C793;
    LDA.W #$4000                                                         ;A7C795;
    STA.B VRAMWrite.dest,X                                               ;A7C798;
    TXA                                                                  ;A7C79A;
    CLC                                                                  ;A7C79B;
    ADC.W #$0007                                                         ;A7C79C;
    STA.W VRAMWriteStack                                                 ;A7C79F;
    RTL                                                                  ;A7C7A2;


;;; $C7A3: Kraid function - fade in regular background - load standard BG3 tiles 2/4 ;;;
Function_Kraid_FadeInRegularBG_LoadStandardBG3Tiles_1:
    LDA.W #Function_Kraid_FadeInRegularBG_LoadStandardBG3Tiles_2         ;A7C7A3;
    STA.W Kraid.function                                                 ;A7C7A6;
    LDX.W VRAMWriteStack                                                 ;A7C7A9;
    LDA.W #$0400                                                         ;A7C7AC;
    STA.B VRAMWrite.size,X                                               ;A7C7AF;
    LDA.W #Tiles_Standard_BG3+$400                                       ;A7C7B1;
    STA.B VRAMWrite.src,X                                                ;A7C7B4;
    LDA.W #Tiles_Standard_BG3>>16                                        ;A7C7B6;
    STA.B VRAMWrite.src+2,X                                              ;A7C7B9;
    LDA.W #$4200                                                         ;A7C7BB;
    STA.B VRAMWrite.dest,X                                               ;A7C7BE;
    TXA                                                                  ;A7C7C0;
    CLC                                                                  ;A7C7C1;
    ADC.W #$0007                                                         ;A7C7C2;
    STA.W VRAMWriteStack                                                 ;A7C7C5;
    RTL                                                                  ;A7C7C8;


;;; $C7C9: Kraid function - fade in regular background - load standard BG3 tiles 3/4 ;;;
Function_Kraid_FadeInRegularBG_LoadStandardBG3Tiles_2:
    LDA.W #Function_Kraid_FadeInRegularBG_LoadStandardBG3Tiles_3         ;A7C7C9;
    STA.W Kraid.function                                                 ;A7C7CC;
    LDX.W VRAMWriteStack                                                 ;A7C7CF;
    LDA.W #$0400                                                         ;A7C7D2;
    STA.B VRAMWrite.size,X                                               ;A7C7D5;
    LDA.W #Tiles_Standard_BG3+$800                                       ;A7C7D7;
    STA.B VRAMWrite.src,X                                                ;A7C7DA;
    LDA.W #Tiles_Standard_BG3>>16                                        ;A7C7DC;
    STA.B VRAMWrite.src+2,X                                              ;A7C7DF;
    LDA.W #$4400                                                         ;A7C7E1;
    STA.B VRAMWrite.dest,X                                               ;A7C7E4;
    TXA                                                                  ;A7C7E6;
    CLC                                                                  ;A7C7E7;
    ADC.W #$0007                                                         ;A7C7E8;
    STA.W VRAMWriteStack                                                 ;A7C7EB;
    RTL                                                                  ;A7C7EE;


;;; $C7EF: Kraid function - fade in regular background - load standard BG3 tiles 4/4 ;;;
Function_Kraid_FadeInRegularBG_LoadStandardBG3Tiles_3:
    LDA.W #Function_Kraid_FadeInRegularBG_FadeInBGPalette6               ;A7C7EF;
    STA.W Kraid.function                                                 ;A7C7F2;
    LDX.W VRAMWriteStack                                                 ;A7C7F5;
    LDA.W #$0400                                                         ;A7C7F8;
    STA.B VRAMWrite.size,X                                               ;A7C7FB;
    LDA.W #Tiles_Standard_BG3+$C00                                       ;A7C7FD;
    STA.B VRAMWrite.src,X                                                ;A7C800;
    LDA.W #Tiles_Standard_BG3>>16                                        ;A7C802;
    STA.B VRAMWrite.src+2,X                                              ;A7C805;
    LDA.W #$4600                                                         ;A7C807;
    STA.B VRAMWrite.dest,X                                               ;A7C80A;
    TXA                                                                  ;A7C80C;
    CLC                                                                  ;A7C80D;
    ADC.W #$0007                                                         ;A7C80E;
    STA.W VRAMWriteStack                                                 ;A7C811;
    RTL                                                                  ;A7C814;


;;; $C815: Kraid function - fade in regular background - fade in BG palette 6 ;;;
Function_Kraid_FadeInRegularBG_FadeInBGPalette6:
    JSL.L Advance_GradualColorChange_ofBGPalette6                        ;A7C815;
    BCC .return                                                          ;A7C819;
    LDA.W #$0003                                                         ;A7C81B;
    JSL.L QueueMusicDataOrTrack_8FrameDelay                              ;A7C81E;
    LDX.W AreaIndex                                                      ;A7C822;
    LDA.L SRAMMirror_Boss,X                                              ;A7C825;
    BIT.W #$0001                                                         ;A7C829;
    BNE .KraidIsDead                                                     ;A7C82C;
    ORA.W #$0001                                                         ;A7C82E;
    STA.L SRAMMirror_Boss,X                                              ;A7C831;
    LDA.W #Function_Kraid_FadeInRegularBG_SetToDead_KraidWasAlive        ;A7C835;
    STA.W Kraid.function                                                 ;A7C838;

  .return:
    RTL                                                                  ;A7C83B;

  .KraidIsDead:
    LDA.W #Function_Kraid_FadeInRegularBG_SetToDead_KraidWasDead         ;A7C83C;
    STA.W Kraid.function                                                 ;A7C83F;
    RTL                                                                  ;A7C842;


;;; $C843: Kraid function - fade in regular background - set enemy properties to dead - Kraid was alive ;;;
Function_Kraid_FadeInRegularBG_SetToDead_KraidWasAlive:
; Not entirely sure why this function exists
    JSR.W CheckIfKraidHasDied                                            ;A7C843;
    BEQ .setToDead                                                       ;A7C846;
    LDA.W Layer1XPosition                                                ;A7C848;
    BEQ .return                                                          ;A7C84B;

  .setToDead:
    JSR.W SetEnemyPropertiesToDead                                       ;A7C84D;

  .return:
    RTL                                                                  ;A7C850;


;;; $C851: Kraid function - fade in regular background - set enemy properties to dead - Kraid was dead ;;;
Function_Kraid_FadeInRegularBG_SetToDead_KraidWasDead:
; Not entirely sure why this function exists
    JSR.W CheckIfKraidHasDied                                            ;A7C851;
    BEQ .setToDead                                                       ;A7C854;
    LDA.W Layer1XPosition                                                ;A7C856;
    BEQ .return                                                          ;A7C859;

  .setToDead:
    JSR.W SetEnemyPropertiesToDead                                       ;A7C85B;

  .return:
    LDA.W #$FFFF                                                         ;A7C85E;
    STA.W PreviousLayer1XBlock                                           ;A7C861;
    RTL                                                                  ;A7C864;


;;; $C865: Kraid function - restrict Samus X position to first screen ;;;
Function_Kraid_RestrictSamusXPositionToFirstScreen:
    JSR.W RestrictSamusXPositionToFirstScreen                            ;A7C865;
    JMP.W Function_Kraid_HandleFunctionTimer                             ;A7C868;


;;; $C86B: Kraid function - raise Kraid through floor - load tilemap top half ;;;
Function_Kraid_RaiseThruFloor_LoadTilemapTopHalf:
    JSR.W RestrictSamusXPositionToFirstScreen                            ;A7C86B;
    LDA.W #Function_Kraid_RaiseThruFloor_LoadTilemapBottomHalf_ShakeScn  ;A7C86E;
    STA.W Kraid.function                                                          ;A7C871; fallthrough to UpdateBG2TilemapTopHalf


;;; $C874: Update BG2 tilemap top half ;;;
UpdateBG2TilemapTopHalf:
    LDX.W VRAMWriteStack                                                 ;A7C874;
    LDA.W #$0800                                                         ;A7C877;
    STA.B VRAMWrite.size,X                                               ;A7C87A;
    LDA.W #EnemyBG2Tilemap                                               ;A7C87C;
    STA.B VRAMWrite.src,X                                                ;A7C87F;
    SEP #$20                                                             ;A7C881;
    LDA.B #EnemyBG2Tilemap>>16                                           ;A7C883;
    STA.B VRAMWrite.src+2,X                                              ;A7C885;
    REP #$20                                                             ;A7C887;
    LDA.B DP_BG2TilemapAddrSize                                          ;A7C889;
    AND.W #$00FC                                                         ;A7C88B;
    XBA                                                                  ;A7C88E;
    STA.B VRAMWrite.dest,X                                               ;A7C88F;
    TXA                                                                  ;A7C891;
    CLC                                                                  ;A7C892;
    ADC.W #$0007                                                         ;A7C893;
    STA.W VRAMWriteStack                                                 ;A7C896;
    RTL                                                                  ;A7C899;


;;; $C89A: Kraid function - raise Kraid through floor - load tilemap bottom half and shake screen ;;;
Function_Kraid_RaiseThruFloor_LoadTilemapBottomHalf_ShakeScn:
    JSR.W RestrictSamusXPositionToFirstScreen                            ;A7C89A;
    LDA.W #Function_Kraid_RaiseThruFloor_SpawnRNGEarthquakeProjEvery10f  ;A7C89D;
    STA.W Kraid.function                                                 ;A7C8A0;
    LDA.W #$0078                                                         ;A7C8A3;
    STA.W Kraid.functionTimer                                            ;A7C8A6;
    LDA.W #$01F0                                                         ;A7C8A9;
    STA.W EarthquakeTimer                                                ;A7C8AC;
    LDA.W #$0005                                                         ;A7C8AF;
    JSL.L QueueMusicDataOrTrack_8FrameDelay                              ;A7C8B2; fallthrough to UpdateBG2TilemapBottomHalf


;;; $C8B6: Update BG2 tilemap bottom half ;;;
UpdateBG2TilemapBottomHalf:
    LDX.W VRAMWriteStack                                                 ;A7C8B6;
    LDA.W #$0800                                                         ;A7C8B9;
    STA.B VRAMWrite.size,X                                               ;A7C8BC;
    LDA.W #EnemyBG2Tilemap+$800                                          ;A7C8BE;
    STA.B VRAMWrite.src,X                                                ;A7C8C1;
    SEP #$20                                                             ;A7C8C3;
    LDA.B #EnemyBG2Tilemap>>16                                           ;A7C8C5;
    STA.B VRAMWrite.src+2,X                                              ;A7C8C7;
    REP #$20                                                             ;A7C8C9;
    LDA.B DP_BG2TilemapAddrSize                                          ;A7C8CB;
    AND.W #$00FC                                                         ;A7C8CD;
    XBA                                                                  ;A7C8D0;
    CLC                                                                  ;A7C8D1;
    ADC.W #$0800                                                         ;A7C8D2;
    STA.B VRAMWrite.dest,X                                               ;A7C8D5;
    TXA                                                                  ;A7C8D7;
    CLC                                                                  ;A7C8D8;
    ADC.W #$0007                                                         ;A7C8D9;
    STA.W VRAMWriteStack                                                 ;A7C8DC;
    RTL                                                                  ;A7C8DF;


;;; $C8E0: Kraid function - raise Kraid through floor - spawn random earthquake projectiles every 10h frames ;;;
Function_Kraid_RaiseThruFloor_SpawnRNGEarthquakeProjEvery10f:
    JSR.W RestrictSamusXPositionToFirstScreen                            ;A7C8E0;
    LDA.W Kraid.functionTimer                                            ;A7C8E3;
    DEC                                                                  ;A7C8E6;
    STA.W Kraid.functionTimer                                            ;A7C8E7;
    BNE .timerNotExpired                                                 ;A7C8EA;
    LDA.W #Function_Kraid_RaiseThruFloor_SpawnRNGEarthquakeProjEvery8f   ;A7C8EC;
    STA.W Kraid.function                                                 ;A7C8EF;
    LDA.W #$0060                                                         ;A7C8F2;
    STA.W Kraid.functionTimer                                            ;A7C8F5;
    RTL                                                                  ;A7C8F8;

  .timerNotExpired:
    AND.W #$000F                                                         ;A7C8F9;
    BNE .return                                                          ;A7C8FC;
    JSR.W SpawnRandomEarthquakeProjectile                                ;A7C8FE;

  .return:
    RTL                                                                  ;A7C901;


;;; $C902: Kraid function - raise Kraid through floor - spawn random earthquake projectiles every 8 frames ;;;
Function_Kraid_RaiseThruFloor_SpawnRNGEarthquakeProjEvery8f:
    JSR.W RestrictSamusXPositionToFirstScreen                            ;A7C902;
    LDA.W Kraid.functionTimer                                            ;A7C905;
    DEC                                                                  ;A7C908;
    STA.W Kraid.functionTimer                                            ;A7C909;
    BNE .timerNotExpired                                                 ;A7C90C;
    LDA.W #Function_Kraid_RaiseThruFloor_RaiseKraid                      ;A7C90E;
    STA.W Kraid.function                                                 ;A7C911;
    LDA.W #$0120                                                         ;A7C914;
    STA.W Kraid.functionTimer                                            ;A7C917;
    RTL                                                                  ;A7C91A;

  .timerNotExpired:
    AND.W #$0007                                                         ;A7C91B;
    BNE .return                                                          ;A7C91E;
    JSR.W SpawnRandomEarthquakeProjectile                                ;A7C920;

  .return:
    RTL                                                                  ;A7C923;


;;; $C924: Kraid function - raise Kraid through floor - raise Kraid ;;;
Function_Kraid_RaiseThruFloor_RaiseKraid:
    JSR.W RestrictSamusXPositionToFirstScreen                            ;A7C924;
    LDA.W EarthquakeTimer                                                ;A7C927;
    BIT.W #$0005                                                         ;A7C92A;
    BNE +                                                                ;A7C92D;
    JSR.W SpawnRandomEarthquakeProjectile                                ;A7C92F;

+   LDY.W #$0001                                                         ;A7C932;
    LDA.W Enemy.YPosition                                                ;A7C935;
    BIT.W #$0002                                                         ;A7C938;
    BNE +                                                                ;A7C93B;
    LDY.W #$FFFF                                                         ;A7C93D;

+   STY.B DP_Temp12                                                      ;A7C940;
    LDA.W Enemy.XPosition                                                ;A7C942;
    CLC                                                                  ;A7C945;
    ADC.B DP_Temp12                                                      ;A7C946;
    STA.W Enemy.XPosition                                                ;A7C948;
    LDA.W Enemy.YSubPosition                                             ;A7C94B;
    SEC                                                                  ;A7C94E;
    SBC.W #$8000                                                         ;A7C94F;
    STA.W Enemy.YSubPosition                                             ;A7C952;
    LDA.W Enemy.YPosition                                                ;A7C955;
    SBC.W #$0000                                                         ;A7C958;
    STA.W Enemy.YPosition                                                ;A7C95B;
    LDA.W Enemy.YPosition                                                ;A7C95E;
    CMP.W #$01C9                                                         ;A7C961;
    BPL .return                                                          ;A7C964;
    LDA.W #$00B0                                                         ;A7C966;
    STA.W Enemy.XPosition                                                ;A7C969;
    LDA.W #Function_KraidFoot_Phase1_Thinking                            ;A7C96C;
    STA.W Enemy[5].var0                                                  ;A7C96F;
    LDA.W #$012C                                                         ;A7C972;
    STA.W Enemy[5].var5                                                  ;A7C975;
    LDA.W #Function_KraidFoot_Phase1_PrepareToLungeForward               ;A7C978;
    STA.L ExtraEnemy7800+$140                                            ;A7C97B;
    LDA.W #InstList_Kraid_Roar_1                                         ;A7C97F;
    STA.W Kraid.instListPointer                                          ;A7C982;
    JSR.W SetupKraidMainLoop_Thinking                                    ;A7C985;
    LDA.W #InstList_KraidArm_Normal_0                                    ;A7C988;
    STA.W Enemy[1].instList                                              ;A7C98B;
    LDA.W #$0001                                                         ;A7C98E;
    STA.W Enemy[1].instTimer                                             ;A7C991;

  .return:
    RTL                                                                  ;A7C994;


;;; $C995: Spawn random earthquake projectile ;;;
SpawnRandomEarthquakeProjectile:
; This first part is dreadful, here's my optimisation:
; LDA $05E5 : AND #$003F : BIT #$0002 : BNE $03 : EOR #$FFFF
; CLC : ADC $0F7A : STA $12
; This generates a random number from:
; 3F, 3E, -3E, -3D, 3B, 3A, -3A, -39, 37, 36, -36, -35, 33, 32, -32, -31, 2F, 2E, -2E, -2D, 2B, 2A, -2A, -29, 27, 26, -26, -25, 23, 22, -22, -21, 1F, 1E, -1E, -1D, 1B, 1A, -1A, -19, 17, 16, -16, -15, 13, 12, -12, -11, 0F, 0E, -0E, -0D, 0B, 0A, -0A, -09, 07, 06, -06, -05, 03, 02, -02, -01
    LDA.W NMI_8bitFrameCounter                                           ;A7C995;
    BIT.W #$0002                                                         ;A7C998;
    LDA.W RandomNumberSeed                                               ;A7C99B;
    AND.W #$003F                                                         ;A7C99E;
    TAX                                                                  ;A7C9A1;
    LDA.W RandomNumberSeed                                               ;A7C9A2;
    BIT.W #$0002                                                         ;A7C9A5;
    BNE +                                                                ;A7C9A8;
    TXA                                                                  ;A7C9AA;
    EOR.W #$FFFF                                                         ;A7C9AB;
    TAX                                                                  ;A7C9AE;

+   TXA                                                                  ;A7C9AF;
    CLC                                                                  ;A7C9B0;
    ADC.W Enemy.XPosition                                                ;A7C9B1;
    STA.B DP_Temp12                                                      ;A7C9B4;
    LDA.W RandomNumberSeed                                               ;A7C9B6;
    AND.W #$3F00                                                         ;A7C9B9;
    XBA                                                                  ;A7C9BC;
    STA.B DP_Temp14                                                      ;A7C9BD;
    LDA.W #$01C0                                                         ;A7C9BF;
    SEC                                                                  ;A7C9C2;
    SBC.B DP_Temp14                                                      ;A7C9C3;
    STA.B DP_Temp14                                                      ;A7C9C5;
    LDA.W #$0015                                                         ;A7C9C7;
    STA.B DP_Temp16                                                      ;A7C9CA;
    STZ.B DP_Temp18                                                      ;A7C9CC;
    JSL.L Create_Sprite_Object                                           ;A7C9CE;
    LDY.W #EnemyProjectile_KraidFloorRocks_Left                          ;A7C9D2;
    LDA.W RandomNumberSeed                                               ;A7C9D5;
    BIT.W #$0010                                                         ;A7C9D8;
    BEQ .keepLeft                                                        ;A7C9DB;
    LDY.W #EnemyProjectile_KraidFloorRocks_Right                         ;A7C9DD;

  .keepLeft:
    LDX.W EnemyIndex                                                     ;A7C9E0;
    LDA.W RandomNumberSeed                                               ;A7C9E3;
    AND.W #$03F0                                                         ;A7C9E6;
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics                     ;A7C9E9;
    RTS                                                                  ;A7C9ED;


;;; $C9EE: Restrict Samus X position to first screen ;;;
RestrictSamusXPositionToFirstScreen:
    LDA.W SamusXPosition                                                 ;A7C9EE;
    SEC                                                                  ;A7C9F1;
    SBC.W #$0100                                                         ;A7C9F2;
    BMI .return                                                          ;A7C9F5;
    LDA.W #$0100                                                         ;A7C9F7;
    STA.W SamusXPosition                                                 ;A7C9FA;
    STA.W SamusPreviousXPosition                                         ;A7C9FD;

  .return:
    RTS                                                                  ;A7CA00;


;;; $CA01: Palette - enemy $E4BF/$E4FF/$E53F/$E57F (Phantoon) ;;;
Palette_Phantoon:
    dw $3800,$7FFF,$7EC0,$6DE0,$54E0,$0000,$0000,$0000                   ;A7CA01;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;A7CA11;


;;; $CA21: Palettes ;;;
if !FEATURE_KEEP_UNREFERENCED
UNUSED_Palette_Phantoon_A7CA21:
; Unused. Clone of Palette_Phantoon_HealthBased_7
    dw $0000,$477B,$2E52,$00C6,$0063,$3AB5,$2210,$116B                   ;A7CA21;
    dw $0508,$7FFF,$36B5,$19AD,$0929,$381D,$1814,$000A                   ;A7CA31;
endif ; !FEATURE_KEEP_UNREFERENCED

Palette_Phantoon_FadeOutTarget:
; Fade out target palette
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;A7CA41;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;A7CA51;

Palette_WreckedShipPoweredOn:
; Wrecked Ship powered on BG1/2 target palettes 0..6 (same as SCE)
    dw $0000,$02DF,$01D7,$00AC,$5EBB,$3DB3,$292E,$1486                   ;A7CA61;
    dw $0BB1,$48FB,$7FFF,$0000,$7FFF,$44E5,$7FFF,$0000                   ;A7CA71;
    dw $2003,$0BB1,$1EA9,$0145,$5EBB,$3DB3,$292E,$1486                   ;A7CA81;
    dw $6318,$1CE7,$1084,$0000,$7FFF,$02DF,$001F,$0000                   ;A7CA91;
    dw $2003,$72BC,$48FB,$1816,$6318,$6318,$6318,$6318                   ;A7CAA1;
    dw $6318,$6318,$6318,$6318,$6318,$6318,$7FFF,$0000                   ;A7CAB1;
    dw $0000,$72B2,$71C7,$4D03,$6318,$6318,$6318,$6318                   ;A7CAC1;
    dw $6318,$6318,$6318,$6318,$6318,$6318,$7FFF,$0000                   ;A7CAD1;
    dw $0000,$3EF4,$262E,$0D68,$3E94,$25CE,$0D08,$1484                   ;A7CAE1;
    dw $6E94,$55CE,$3D08,$2C84,$1EA9,$0BB1,$7FFF,$0000                   ;A7CAF1;
    dw $0000,$1246,$0145,$00C0,$3652,$1D8C,$04C6,$0484                   ;A7CB01;
    dw $6231,$496B,$30A5,$2021,$0015,$025B,$7FFF,$0000                   ;A7CB11;
    dw $0000,$6318,$6318,$6318,$6318,$6318,$6318,$6318                   ;A7CB21;
    dw $6318,$6318,$6318,$6318,$6318,$6318,$7FFF,$0000                   ;A7CB31;

; Health based palettes
Palette_Phantoon_HealthBased_0:
; Health <= 312
    dw $000E,$25DC,$1538,$0071,$0030,$1D79,$1117,$08B4                   ;A7CB41;
    dw $0092,$421F,$1D79,$0CF5,$0493,$1C1D,$0C19,$0013                   ;A7CB51;

Palette_Phantoon_HealthBased_1:
; Health > 312
    dw $000C,$2A1C,$1957,$0070,$002E,$2199,$1136,$08D3                   ;A7CB61;
    dw $0091,$4A5F,$1D99,$0CF4,$04B1,$201D,$0C18,$0012                   ;A7CB71;

Palette_Phantoon_HealthBased_2:
; Health > 624
    dw $000A,$2E5C,$1D96,$008E,$004C,$25D8,$1555,$08F1                   ;A7CB81;
    dw $00AF,$529F,$21D8,$1113,$04D0,$241D,$1017,$0011                   ;A7CB91;

Palette_Phantoon_HealthBased_3:
; Health > 936
    dw $0008,$327C,$21B5,$008C,$004A,$29F7,$1574,$0D10                   ;A7CBA1;
    dw $00AE,$5ADF,$25F7,$1131,$04CE,$281D,$1016,$000F                   ;A7CBB1;

Palette_Phantoon_HealthBased_4:
; Health > 1248
    dw $0006,$36BB,$21D4,$008B,$0048,$2E17,$1993,$0D0F                   ;A7CBC1;
    dw $00CC,$631F,$2A17,$1150,$04ED,$2C1D,$1016,$000E                   ;A7CBD1;

Palette_Phantoon_HealthBased_5:
; Health > 1560
    dw $0004,$3AFB,$25F3,$00A9,$0046,$3256,$1DB2,$0D2D                   ;A7CBE1;
    dw $00EB,$6B5F,$2E56,$156F,$04EB,$301D,$1415,$000C                   ;A7CBF1;

Palette_Phantoon_HealthBased_6:
; Health > 1872
    dw $0002,$3F3B,$2A12,$00A7,$0044,$3675,$1DF1,$0D4C                   ;A7CC01;
    dw $04E9,$77BF,$3275,$158E,$050A,$341D,$1414,$000B                   ;A7CC11;

Palette_Phantoon_HealthBased_7:
; Health > 2184
    dw $0000,$477B,$2E52,$00C6,$0063,$3AB5,$2210,$116B                   ;A7CC21;
    dw $0508,$7FFF,$36B5,$19AD,$0929,$381D,$1814,$000A                   ;A7CC31;


;;; $CC41: Instruction list - body - invulnerable ;;;
InstList_Phantoon_Body_Invulnerable:
    dw $0001,ExtendedSpritemap_Phantoon_Body_Invulnerable                ;A7CC41;
    dw Common_Instruction_Sleep                                          ;A7CC45;


;;; $CC47: Instruction list - body - full hitbox ;;;
InstList_Phantoon_Body_FullHitbox:
    dw $0001,ExtendedSpritemap_Phantoon_Body_FullHitbox                  ;A7CC47;
    dw Common_Instruction_Sleep                                          ;A7CC4B;


;;; $CC4D: Instruction list - body - eye hitbox only ;;;
InstList_Phantoon_Body_EyeHitboxOnly:
    dw $0001,ExtendedSpritemap_Phantoon_Body_EyeHitbox                   ;A7CC4D;
    dw Common_Instruction_Sleep                                          ;A7CC51;


;;; $CC53: Instruction list - eye - open ;;;
InstList_Phantoon_Eye_Open:
    dw $000A,ExtendedSpritemap_Phantoon_Eye_Opening                      ;A7CC53;
    dw $000A,ExtendedSpritemap_Phantoon_Eye_OpeningClosing               ;A7CC57;
    dw $0001,ExtendedSpritemap_Phantoon_Eye_Open                         ;A7CC5B;
    dw Common_Instruction_CallFunctionInY                                ;A7CC5F;
    dw PlayPhantoonMaterializationSFX                                    ;A7CC61;
    dw Common_Instruction_CallFunctionInY                                ;A7CC63;
    dw SetupEyeOpenPhantoonState                                         ;A7CC65;
    dw Common_Instruction_Sleep                                          ;A7CC67;


if !FEATURE_KEEP_UNREFERENCED
;;; $CC69: Unused. Instruction list - open (ignoring Samus) ;;;
UNUSED_InstList_Phantoon_Eye_Open_IgnoringSamus_A7CC69:
    dw $000A,ExtendedSpritemap_Phantoon_Eye_Opening                      ;A7CC69;
    dw $000A,ExtendedSpritemap_Phantoon_Eye_OpeningClosing               ;A7CC6D;
    dw $0001,ExtendedSpritemap_Phantoon_Eye_Open                         ;A7CC71;
    dw Common_Instruction_CallFunctionInY                                ;A7CC75;
    dw PlayPhantoonMaterializationSFX                                    ;A7CC77;
    dw Common_Instruction_Sleep                                          ;A7CC79;
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $CC7B: Instruction list - eye - closed ;;;
InstList_Phantoon_Eye_Closed:
    dw $0001,ExtendedSpritemap_Phantoon_Eye_Closed                       ;A7CC7B;
    dw Common_Instruction_Sleep                                          ;A7CC7F;


;;; $CC81: Instruction list - eye - close and pick new pattern ;;;
InstList_Phantoon_Eye_Close_PickNewPattern:
    dw $0001,ExtendedSpritemap_Phantoon_Eye_Open                         ;A7CC81;
    dw $000A,ExtendedSpritemap_Phantoon_Eye_OpeningClosing               ;A7CC85;
    dw Common_Instruction_CallFunctionInY                                ;A7CC89;
    dw PickNewPhantoonPattern                                            ;A7CC8B;
    dw Common_Instruction_GotoY                                          ;A7CC8D;
    dw InstList_Phantoon_Eye_Closed                                      ;A7CC8F;


;;; $CC91: Instruction list - eye - close ;;;
InstList_Phantoon_Eye_Close:
    dw $0001,ExtendedSpritemap_Phantoon_Eye_Open                         ;A7CC91;
    dw $000A,ExtendedSpritemap_Phantoon_Eye_OpeningClosing               ;A7CC95;
    dw Common_Instruction_GotoY                                          ;A7CC99;
    dw InstList_Phantoon_Eye_Closed                                      ;A7CC9B;


;;; $CC9D: Instruction list - eyeball - centred ;;;
InstList_Phantoon_Eyeball_Centered:
    dw $0001,ExtendedSpritemap_Phantoon_Eyeball_Centered                 ;A7CC9D;
    dw Common_Instruction_CallFunctionInY                                ;A7CCA1;
    dw PlayPhantoonMaterializationSFX                                    ;A7CCA3;
    dw Common_Instruction_Sleep                                          ;A7CCA5;


;;; $CCA7: Instruction list - eyeball - looking up ;;;
InstList_Phantoon_Eyeball_LookingUp:
    dw $0001,ExtendedSpritemap_Phantoon_Eyeball_LookingUp                ;A7CCA7;
    dw Common_Instruction_Sleep                                          ;A7CCAB;


;;; $CCAD: Instruction list - eyeball - looking up-right ;;;
InstList_Phantoon_Eyeball_LookingUpRight:
    dw $0001,ExtendedSpritemap_Phantoon_Eyeball_LookingUpRight           ;A7CCAD;
    dw Common_Instruction_Sleep                                          ;A7CCB1;


;;; $CCB3: Instruction list - eyeball - looking right ;;;
InstList_Phantoon_Eyeball_LookingRight:
    dw $0001,ExtendedSpritemap_Phantoon_Eyeball_LookingRight             ;A7CCB3;
    dw Common_Instruction_Sleep                                          ;A7CCB7;


;;; $CCB9: Instruction list - eyeball - looking down-right ;;;
InstList_Phantoon_Eyeball_LookingDownRight:
    dw $0001,ExtendedSpritemap_Phantoon_Eyeball_LookingDownRight         ;A7CCB9;
    dw Common_Instruction_Sleep                                          ;A7CCBD;


;;; $CCBF: Instruction list - eyeball - looking down ;;;
InstList_Phantoon_Eyeball_LookingDown:
    dw $0001,ExtendedSpritemap_Phantoon_Eyeball_LookingDown              ;A7CCBF;
    dw Common_Instruction_Sleep                                          ;A7CCC3;


;;; $CCC5: Instruction list - eyeball - looking down-left ;;;
InstList_Phantoon_Eyeball_LookingDownLeft:
    dw $0001,ExtendedSpritemap_Phantoon_Eyeball_LookingDownLeft          ;A7CCC5;
    dw Common_Instruction_Sleep                                          ;A7CCC9;


;;; $CCCB: Instruction list - eyeball - looking left ;;;
InstList_Phantoon_Eyeball_LookingLeft:
    dw $0001,ExtendedSpritemap_Phantoon_Eyeball_LookingLeft              ;A7CCCB;
    dw Common_Instruction_Sleep                                          ;A7CCCF;


;;; $CCD1: Instruction list - eyeball - looking up-left ;;;
InstList_Phantoon_Eyeball_LookingUpLeft:
    dw $0001,ExtendedSpritemap_Phantoon_Eyeball_LookingUpLeft            ;A7CCD1;
    dw Common_Instruction_Sleep                                          ;A7CCD5;


;;; $CCD7: Instruction list - tentacles ;;;
InstList_Phantoon_Tentacles:
    dw $0008,ExtendedSpritemap_Phantoon_Tentacles_0                      ;A7CCD7;
    dw $0008,ExtendedSpritemap_Phantoon_Tentacles_1                      ;A7CCDB;
    dw $0008,ExtendedSpritemap_Phantoon_Tentacles_2                      ;A7CCDF;
    dw $0008,ExtendedSpritemap_Phantoon_Tentacles_1                      ;A7CCE3;
    dw Common_Instruction_GotoY                                          ;A7CCE7;
    dw InstList_Phantoon_Tentacles                                       ;A7CCE9;


;;; $CCEB: Instruction list - mouth - spawn flame ;;;
InstList_Phantoon_Mouth_SpawnFlame:
    dw $0005,ExtendedSpritemap_Phantoon_Mouth_SpawningFlame_1            ;A7CCEB;
    dw $0005,ExtendedSpritemap_Phantoon_Mouth_SpawningFlame_0            ;A7CCEF;
    dw Common_Instruction_CallFunctionInY                                ;A7CCF3;
    dw SpawnCasualFlame                                                  ;A7CCF5;


;;; $CCF7: Instruction list - mouth - initial ;;;
InstList_Phantoon_Mouth_Initial:
    dw $0001,ExtendedSpritemap_Phantoon_Mouth_Normal                     ;A7CCF7;
    dw Common_Instruction_Sleep                                          ;A7CCFB;


;;; $CCFD: Casual flame timers ;;;
CasualFlameTimers:
  .pointers:
; List of pattern pointers
    dw CasualFlameTimers_pattern0                                        ;A7CCFD;
    dw CasualFlameTimers_pattern1                                        ;A7CCFF;
    dw CasualFlameTimers_pattern2                                        ;A7CD01;
    dw CasualFlameTimers_pattern3                                        ;A7CD03;

;        ________ Number of flames (length of pattern)
;       |       _ Timers. List is read backwards
;       |      |
  .pattern0:
    dw $0005, $00B4,$0020,$0020,$0020,$0020,$0020                        ;A7CD05;
  .pattern1:
    dw $0003, $00B4,$0010,$0010,$0010                                    ;A7CD13;
  .pattern2:
    dw $0007, $00B4,$0030,$0030,$0030,$0030,$0030,$0030,$0030            ;A7CD1D;
  .pattern3:
    dw $0007, $00B4,$0010,$0040,$0020,$0040,$0020,$0010,$0020            ;A7CD2F;


;;; $CD41: Phantoon figure-8 vulnerable window timers ;;;
Phantoon_Figure8_VulnerableWindowTimers:
    dw $003C,$001E,$000F,$001E,$003C,$001E,$000F,$003C                   ;A7CD41;


;;; $CD51: Empty HDMA table ;;;
EmptyHDMATable:
    db $00,$00                                                           ;A7CD51;


;;; $CD53: Phantoon eye closed timers ;;;
Phantoon_EyeClosedTimers:
    dw $02D0,$003C,$0168,$02D0,$0168,$003C,$0168,$02D0                   ;A7CD53;


;;; $CD63: Flame rain Phantoon hiding timers ;;;
Phantoon_FlameRain_HidingTimers:
    dw $003C,$0078,$001E,$003C,$001E,$003C,$001E,$001E                   ;A7CD63;


;;; $CD73: Figure-8 Phantoon acceleration ;;;
Phantoon_Figure8_SubAcceleration_SlowStage:
    dw $0600                                                             ;A7CD73;
Phantoon_Figure8_Acceleration_SlowStage:
    dw $0000                                                             ;A7CD75;
Phantoon_Figure8_SubAcceleration_FastStages:
    dw $1000                                                             ;A7CD77;
Phantoon_Figure8_Acceleration_FastStages:
    dw $0000                                                             ;A7CD79;


;;; $CD7B: Figure-8 speed caps ;;;
Phantoon_Figure8_SpeedCaps_Stage0Max:
    dw $0002                                                             ;A7CD7B;
Phantoon_Figure8_SpeedCaps_Stage1Max:
    dw $0007                                                             ;A7CD7D;
Phantoon_Figure8_SpeedCaps_Stage2Min:
    dw $0000                                                             ;A7CD7F;


;;; $CD81: Reverse figure-8 Phantoon acceleration ;;;
; Clone of Phantoon_Figure8_SubAcceleration_SlowStage
Phantoon_ReverseFigure8_SubAcceleration_SlowStage:
    dw $0600                                                             ;A7CD81;
Phantoon_ReverseFigure8_Acceleration_SlowStage:
    dw $0000                                                             ;A7CD83;
Phantoon_ReverseFigure8_SubAcceleration_FastStages:
    dw $1000                                                             ;A7CD85;
Phantoon_ReverseFigure8_Acceleration_FastStages:
    dw $0000                                                             ;A7CD87;


;;; $CD89: Reverse figure-8 speed caps ;;;
Phantoon_ReverseFigure8_SpeedCaps_Stage0Max:
    dw $FFFE                                                             ;A7CD89;
Phantoon_ReverseFigure8_SpeedCaps_Stage1Max:
    dw $FFF9                                                             ;A7CD8B;
Phantoon_ReverseFigure8_SpeedCaps_Stage2Min:
    dw $0000                                                             ;A7CD8D;


if !FEATURE_KEEP_UNREFERENCED
;;; $CD8F: Unused ;;;
UNUSED_Phantoon_A7CD8F:
    dw $8000,$0000,$000B,$8000,$0000,$FFF5                               ;A7CD8F;
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $CD9B: Wavy Phantoon constants ;;;
WavyPhantoonConstants_Intro_amplitudeDelta:
; Amplitude delta - intro wavy Phantoon
    dw $0040                                                             ;A7CD9B;

WavyPhantoonConstants_Intro_maxAmplitude:
; Max amplitude - intro wavy Phantoon
    dw $0C00                                                             ;A7CD9D;

WavyPhantoonConstants_Dying_amplitudeDelta:
; Amplitude delta - dying wavy Phantoon
    dw $0100                                                             ;A7CD9F;

WavyPhantoonConstants_Dying_maxAmplitude:
; Max amplitude - dying wavy Phantoon
    dw $F000                                                             ;A7CDA1;

WavyPhantoonConstants_phaseDelta:
; Wavy Phantoon phase delta
    dw $0008                                                             ;A7CDA3;


;;; $CDA5: Values for Enemy[1].var1 ;;;
Phantoon_Unknown0FEAValues_A7CDA5:
; Unknown purpose, Enemy[1].var1 is never read, written by Phantoon enemy shot
    db $06,$06,$08,$08,$06,$08,$06,$08                                   ;A7CDA5;


;;; $CDAD: Phantoon position table for flame rain ;;;
Phantoon_FlameRain_PositionTable:
;        _____________________ Phantoon figure-8 movement index
;       |      _______________ X position
;       |     |      _________ Y position
;       |     |     |
  .index:
    dw $0001                                                             ;A7CDAD;
  .XPosition:
    dw       $0080                                                       ;A7CDAF;
  .YPosition:
    dw             $0060,$0000                                           ;A7CDB1;
    dw $0047,$00A8,$0040,$0000
    dw $0088,$00D0,$0060,$0000
    dw $00C9,$00A8,$0080,$0000
    dw $0001,$0080,$0060,$0000
    dw $014E,$0058,$0040,$0000
    dw $018F,$0030,$0060,$0000
    dw $01D1,$0058,$0080,$0000


;;; $CDED: Materialisation sound effects ;;;
Phantoon_MaterializationSFX:
; Sound library 2
; Indexed by [$7E:9032] * 2
    dw $0079,$007A,$007B                                                 ;A7CDED;


;;; $CDF3: Initialisation AI - enemy $E4BF (Phantoon body) ;;;
InitAI_PhantoonBody:
    LDX.W #$0FFE                                                         ;A7CDF3;
    LDA.W #$0338                                                         ;A7CDF6;

  .loopBG2Tilemap:
    STA.L EnemyBG2Tilemap,X                                              ;A7CDF9;
    DEX                                                                  ;A7CDFD;
    DEX                                                                  ;A7CDFE;
    BPL .loopBG2Tilemap                                                  ;A7CDFF;
    LDX.W #$07FE                                                         ;A7CE01;
    LDA.W #$0000                                                         ;A7CE04;

  .loop9000:
    STA.L WavyPhantoonBG2XScrollIndirectHDMATable,X                      ;A7CE07;
    DEX                                                                  ;A7CE0B;
    DEX                                                                  ;A7CE0C;
    BPL .loop9000                                                        ;A7CE0D;
    LDX.W #$001E                                                         ;A7CE0F;
    LDA.W #$0000                                                         ;A7CE12;

  .loopBGPalette:
    STA.L TargetPalettes_BGP7,X                                          ;A7CE15;
    DEX                                                                  ;A7CE19;
    DEX                                                                  ;A7CE1A;
    BPL .loopBGPalette                                                   ;A7CE1B;
    LDA.W #$0360                                                         ;A7CE1D;
    STA.L EnemyBG2TilemapSize                                            ;A7CE20; >.<
    JSL.L DisableMinimap_MarkBossRoomTilesExplored                       ;A7CE24;
    LDX.W EnemyIndex                                                     ;A7CE28;
    LDA.W #$0078                                                         ;A7CE2B;
    STA.W Phantoon.functionTimer,X                                       ;A7CE2E;
    STZ.W Phantoon.flameCounter,X                                        ;A7CE31;
    STZ.W Phantoon.startingFlamesActivationFlag,X                        ;A7CE34;
    LDA.W #$0000                                                         ;A7CE37;
    STA.L PhantoonMaterializationSFXIndex                                ;A7CE3A;
    STZ.W Phantoon.wavyPhantoonMode                                      ;A7CE3E;
    STZ.W Enemy[1].init1                                                 ;A7CE41;
    LDA.W Enemy.properties                                               ;A7CE44;
    ORA.W #$0400                                                         ;A7CE47;
    STA.W Enemy.properties                                               ;A7CE4A;
    JSL.L Spawn_HDMAObject                                               ;A7CE4D; fallthrough to InitAI_Phantoon_Eye_Tentacles_Mouth
    db $01,$14                                                           ;A7CE51;
    dw HDMAObjectInstList_Phantoon_SemiTransparency                      ;A7CE53;


;;; $CE55: Initialisation AI - enemy $E4FF/$E53F/$E57F (Phantoon eye / tentacles / mouth) ;;;
InitAI_Phantoon_Eye_Tentacles_Mouth:
; Phantoon body also executes this as part of initialisation AI, so all Phantoon parts are doing this
    LDX.W EnemyIndex                                                     ;A7CE55;
    LDA.W #Common_Spritemap_Nothing                                      ;A7CE58;
    STA.W Enemy.spritemap,X                                              ;A7CE5B;
    LDA.W #$0001                                                         ;A7CE5E;
    STA.W Enemy.instTimer,X                                              ;A7CE61;
    STZ.W Enemy.loopCounter,X                                            ;A7CE64;
    LDA.W Enemy.palette                                                  ;A7CE67;
    STA.W Enemy.palette,X                                                ;A7CE6A;
    LDA.W Enemy.GFXOffset                                                ;A7CE6D;
    STA.W Enemy.GFXOffset,X                                              ;A7CE70;
    LDA.W Phantoon.flameRainTriggeredFlag,X                              ;A7CE73;
    ASL                                                                  ;A7CE76;
    TAY                                                                  ;A7CE77;
    LDA.W .instListPointers,Y                                            ;A7CE78;
    STA.W Enemy.instList,X                                               ;A7CE7B;
    LDA.W #Function_Phantoon_FightIntro_SpawnCircleOfFlames              ;A7CE7E;
    STA.W Phantoon.function,X                                            ;A7CE81;
    STZ.W Phantoon.semiTransparencyHDMAObjectControl                     ;A7CE84;
    LDA.W #$FFFF                                                         ;A7CE87;
    STA.W Phantoon.casualFlamePatternIndex                               ;A7CE8A;
    RTL                                                                  ;A7CE8D;

  .instListPointers:
    dw InstList_Phantoon_Body_Invulnerable                               ;A7CE8E;
    dw InstList_Phantoon_Eye_Closed                                      ;A7CE90;
    dw InstList_Phantoon_Tentacles                                       ;A7CE92;
    dw InstList_Phantoon_Mouth_Initial                                   ;A7CE94;


;;; $CE96: HDMA object instruction list - Phantoon semi-transparency ;;;
HDMAObjectInstList_Phantoon_SemiTransparency:
    dw Instruction_HDMAObject_HDMATableBank : db $A7                     ;A7CE96;
    dw $0001,EmptyHDMATable                                              ;A7CE99;
    dw Instruction_HDMAObject_PreInstructionInY                          ;A7CE9D;
    dl PreInstruction_PhantoonSemiTransparency                           ;A7CE9F;
    dw Instruction_HDMAObject_Sleep                                      ;A7CEA2;
    dw Instruction_HDMAObject_Delete                                     ;A7CEA4;


;;; $CEA6: Main AI - enemy $E4BF (Phantoon) ;;;
MainAI_Phantoon:
; Phantoon code is making a trend of returning if the current enemy index is not 0, then using indexed addressing anyway,
; and these routines are only called for enemy 0 in the first place >_<;
    LDX.W EnemyIndex                                                     ;A7CEA6;
    JSR.W Phantoon_BrokenNothingness                                     ;A7CEA9;
    PEA.W .manualReturn-1                                                ;A7CEAC;
    JMP.W (Phantoon.function,X)                                          ;A7CEAF;

  .manualReturn:
    TXA                                                                  ;A7CEB2;
    BNE .return                                                          ;A7CEB3;
    LDA.W Enemy.XPosition,X                                              ;A7CEB5;
    STA.W Enemy[1].XPosition,X                                           ;A7CEB8;
    STA.W Enemy[2].XPosition,X                                           ;A7CEBB;
    STA.W Enemy[3].XPosition,X                                           ;A7CEBE;
    LDA.W Enemy.YPosition,X                                              ;A7CEC1;
    STA.W Enemy[1].YPosition,X                                           ;A7CEC4;
    STA.W Enemy[2].YPosition,X                                           ;A7CEC7;
    STA.W Enemy[3].YPosition,X                                           ;A7CECA;
    LDA.W Phantoon.wavyPhantoonMode                                      ;A7CECD;
    BNE .return                                                          ;A7CED0;
    LDA.W Layer1XPosition                                                ;A7CED2;
    SEC                                                                  ;A7CED5;
    SBC.W Enemy.XPosition,X                                              ;A7CED6;
    SEC                                                                  ;A7CED9;
    SBC.W #$FFD8                                                         ;A7CEDA;
    STA.B DP_BG2XScroll                                                  ;A7CEDD;
    LDA.W Layer1YPosition                                                ;A7CEDF;
    SEC                                                                  ;A7CEE2;
    SBC.W Enemy.YPosition,X                                              ;A7CEE3;
    SEC                                                                  ;A7CEE6;
    SBC.W #$FFD8                                                         ;A7CEE7;
    STA.B DP_BG2YScroll                                                  ;A7CEEA;

  .return:
    RTL                                                                  ;A7CEEC;


;;; $CEED: Play Phantoon materialisation sound effect ;;;
PlayPhantoonMaterializationSFX:
    LDA.L PhantoonMaterializationSFXIndex                                ;A7CEED;
    ASL                                                                  ;A7CEF1;
    TAY                                                                  ;A7CEF2;
    LDA.W Phantoon_MaterializationSFX,Y                                  ;A7CEF3;
    JSL.L QueueSound_Lib2_Max6                                           ;A7CEF6;
    LDA.L PhantoonMaterializationSFXIndex                                ;A7CEFA;
    INC                                                                  ;A7CEFE;
    CMP.W #$0003                                                         ;A7CEFF;
    BMI .storeIndex                                                      ;A7CF02;
    LDA.W #$0000                                                         ;A7CF04;

  .storeIndex:
    STA.L PhantoonMaterializationSFXIndex                                ;A7CF07;
    RTS                                                                  ;A7CF0B;


;;; $CF0C: Broken nothingness ;;;
Phantoon_BrokenNothingness:
; This code doesn't do anything, it tries to modify $7E:9030 and forgot the $7E bit... and $7E:9030 is never read anywhere anyway
    TXA                                                                  ;A7CF0C;
    BNE .return                                                          ;A7CF0D;
    LDA.B DP_Controller1New                                              ;A7CF0F;
    BIT.W #$4000                                                         ;A7CF11;
    BEQ .return                                                          ;A7CF14;
    LDA.W $9030,X                                                        ;A7CF16; >.<
    BNE .nonZero                                                         ;A7CF19;
    LDA.W #$0001                                                         ;A7CF1B;
    STA.W $9030,X                                                        ;A7CF1E; >.<
    BRA .return                                                          ;A7CF21;

  .nonZero:
    STZ.W $9030,X                                                        ;A7CF23; >.<

  .return:
    RTS                                                                  ;A7CF26;


;;; $CF27: Grow/shrink Phantoon wave amplitude ;;;
GrowShrinkPhantoonWaveAmplitude:
;; Parameters:
;;     $12: Amplitude delta
;;     $14: Max amplitude
;; Returns:
;;     Carry: Set if completed wave cycle (amplitude has decreased below 0)
    LDA.W Phantoon.wavyPhantoonPhaseDeltaDirection                       ;A7CF27;
    BNE .shrinking                                                       ;A7CF2A;
    LDA.B DP_Temp14                                                      ;A7CF2C;
    AND.W #$FF00                                                         ;A7CF2E;
    XBA                                                                  ;A7CF31;
    STA.B DP_Temp16                                                      ;A7CF32;
    LDA.W Phantoon.wavyPhantoonPhaseAmplitude                            ;A7CF34;
    CLC                                                                  ;A7CF37;
    ADC.B DP_Temp12                                                      ;A7CF38;
    STA.W Phantoon.wavyPhantoonPhaseAmplitude                            ;A7CF3A;
    AND.W #$FF00                                                         ;A7CF3D;
    XBA                                                                  ;A7CF40;
    CMP.B DP_Temp16                                                      ;A7CF41;
    BMI .returnNotCompletedCycle                                         ;A7CF43;
    LDA.B DP_Temp14                                                      ;A7CF45;
    STA.W Phantoon.wavyPhantoonPhaseAmplitude                            ;A7CF47;
    BRA .returnNotCompletedCycle                                         ;A7CF4A;

  .shrinking:
    LDA.W Phantoon.wavyPhantoonPhaseAmplitude                            ;A7CF4C;
    SEC                                                                  ;A7CF4F;
    SBC.B DP_Temp12                                                      ;A7CF50;
    STA.W Phantoon.wavyPhantoonPhaseAmplitude                            ;A7CF52;
    BCS .returnNotCompletedCycle                                         ;A7CF55;
    STZ.W Phantoon.wavyPhantoonPhaseAmplitude                            ;A7CF57;
    SEC                                                                  ;A7CF5A;
    RTS                                                                  ;A7CF5B;

  .returnNotCompletedCycle:
    CLC                                                                  ;A7CF5C;
    RTS                                                                  ;A7CF5D;


;;; $CF5E: Spawn casual flame ;;;
SpawnCasualFlame:
    LDA.W #$0000                                                         ;A7CF5E;
    LDY.W #EnemyProjectile_PhantoonDestroyableFlames                     ;A7CF61;
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics                     ;A7CF64;
    LDA.W #$001D                                                         ;A7CF68;
    JSL.L QueueSound_Lib3_Max6                                           ;A7CF6B;
    RTS                                                                  ;A7CF6F;


;;; $CF70: Phantoon materialisation flame spiral ;;;
PhantoonMaterializationFlameSpiral:
    LDY.W #$0007                                                         ;A7CF70;

  .loop:
    PHY                                                                  ;A7CF73;
    TYA                                                                  ;A7CF74;
    ORA.W #$0600                                                         ;A7CF75;
    LDY.W #EnemyProjectile_PhantoonDestroyableFlames                     ;A7CF78;
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics                     ;A7CF7B;
    PLY                                                                  ;A7CF7F;
    DEY                                                                  ;A7CF80;
    BPL .loop                                                            ;A7CF81;
    LDA.W #$0028                                                         ;A7CF83;
    JSL.L QueueSound_Lib3_Max6                                           ;A7CF86;
    RTS                                                                  ;A7CF8A;


;;; $CF8B: Spawn flame rain enemy projectiles ;;;
SpawnFlameRainProjectiles:
;; Parameter:
;;     A: Pattern index. Range 0..7. Decides the placement of the first flame

; Uses a lookup table ($CFC2) to determine where to leave a gap.
;
; When called from $D7F7, the following patterns result:
;
; [A] | Value | Fireball pattern
; ----+-------+-----------------
; 0   | 5     | @@@@@@.@@
; 1   | 7     | @@@@@@@@.
; 2   | 0     | .@@@@@@@@
; 3   | 7     | @@@@@@@@.
; 4   | 5     | @@@@@@.@@
; 5   | 3     | @@@@.@@@@
; 6   | 1     | @@.@@@@@@
; 7   | 3     | @@@@.@@@@
    TAY                                                                  ;A7CF8B;
    LDA.W .firstFlamePositions,Y                                         ;A7CF8C;
    AND.W #$00FF                                                         ;A7CF8F;
    TAY                                                                  ;A7CF92;
    LDA.W #$0007                                                         ;A7CF93;
    STA.B DP_Temp12                                                      ;A7CF96;
    LDA.W #$0010                                                         ;A7CF98;
    STA.B DP_Temp14                                                      ;A7CF9B;

  .loop:
    TYA                                                                  ;A7CF9D;
    ORA.W #$0400                                                         ;A7CF9E;
    ORA.B DP_Temp14                                                      ;A7CFA1;
    PHY                                                                  ;A7CFA3;
    LDY.W #EnemyProjectile_PhantoonDestroyableFlames                     ;A7CFA4;
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics                     ;A7CFA7;
    PLY                                                                  ;A7CFAB;
    INY                                                                  ;A7CFAC;
    CPY.W #$0009                                                         ;A7CFAD;
    BMI +                                                                ;A7CFB0;
    LDY.W #$0000                                                         ;A7CFB2;

+   LDA.B DP_Temp14                                                      ;A7CFB5;
    CLC                                                                  ;A7CFB7;
    ADC.W #$0010                                                         ;A7CFB8;
    STA.B DP_Temp14                                                      ;A7CFBB;
    DEC.B DP_Temp12                                                      ;A7CFBD;
    BPL .loop                                                            ;A7CFBF;
    RTS                                                                  ;A7CFC1;

  .firstFlamePositions:
; Position of first flame
    db $05,$07,$00,$07,$05,$03,$01,$03                                   ;A7CFC2;


;;; $CFCA: Handle casual flames ;;;
HandleCasualFlames:
    DEC.W Phantoon.casualFlameTimer,X                                    ;A7CFCA;
    BEQ .timerExpired                                                    ;A7CFCD;
    BPL .return                                                          ;A7CFCF;

  .timerExpired:
    LDA.W Phantoon.casualFlamePatternIndex,X                             ;A7CFD1;
    BPL .positiveIndex                                                   ;A7CFD4;
    JSL.L GenerateRandomNumber                                           ;A7CFD6;
    AND.W #$0003                                                         ;A7CFDA;
    STA.W Phantoon.casualFlamePattern,X                                  ;A7CFDD;
    ASL                                                                  ;A7CFE0;
    TAY                                                                  ;A7CFE1;
    LDA.W CasualFlameTimers_pointers,Y                                   ;A7CFE2;
    TAY                                                                  ;A7CFE5;
    LDA.W $0000,Y                                                        ;A7CFE6;
    STA.W Phantoon.casualFlamePatternIndex,X                             ;A7CFE9;
    ASL                                                                  ;A7CFEC;
    STA.B DP_Temp12                                                      ;A7CFED;
    TYA                                                                  ;A7CFEF;
    CLC                                                                  ;A7CFF0;
    ADC.B DP_Temp12                                                      ;A7CFF1;
    TAY                                                                  ;A7CFF3;
    LDA.W $0002,Y                                                        ;A7CFF4;
    STA.W Phantoon.casualFlameTimer,X                                    ;A7CFF7;
    BRA .return                                                          ;A7CFFA;

  .positiveIndex:
    DEC.W Phantoon.casualFlamePatternIndex,X                             ;A7CFFC;
    BEQ .indexReachedZero                                                ;A7CFFF;
    BPL .nonZeroTimer                                                    ;A7D001;

  .indexReachedZero:
    LDA.W #$FFFF                                                         ;A7D003;
    STA.W Phantoon.casualFlamePatternIndex,X                             ;A7D006;
    LDA.W Phantoon.casualFlamePattern,X                                  ;A7D009;
    ASL                                                                  ;A7D00C;
    TAY                                                                  ;A7D00D;
    LDA.W CasualFlameTimers_pointers,Y                                   ;A7D00E;
    TAY                                                                  ;A7D011;
    LDA.W $0002,Y                                                        ;A7D012;
    STA.W Phantoon.casualFlameTimer,X                                    ;A7D015;
    BRA +                                                                ;A7D018;

  .nonZeroTimer:
    LDA.W Phantoon.casualFlamePatternIndex,X                             ;A7D01A;
    ASL                                                                  ;A7D01D;
    STA.B DP_Temp12                                                      ;A7D01E;
    LDA.W Phantoon.casualFlamePattern,X                                  ;A7D020;
    ASL                                                                  ;A7D023;
    TAY                                                                  ;A7D024;
    LDA.W CasualFlameTimers_pointers,Y                                   ;A7D025;
    CLC                                                                  ;A7D028;
    ADC.B DP_Temp12                                                      ;A7D029;
    TAY                                                                  ;A7D02B;
    LDA.W $0002,Y                                                        ;A7D02C;
    STA.W Phantoon.casualFlameTimer,X                                    ;A7D02F;

+   LDA.W #$0001                                                         ;A7D032;
    STA.W Enemy[3].instTimer,X                                           ;A7D035;
    LDA.W #InstList_Phantoon_Mouth_SpawnFlame                            ;A7D038;
    STA.W Enemy[3].instList,X                                            ;A7D03B;

  .return:
    RTS                                                                  ;A7D03E;


;;; $D03F: Set up eye open Phantoon state ;;;
SetupEyeOpenPhantoonState:
    STZ.W Phantoon.swoopingTriggeredFlag                                 ;A7D03F;
    LDA.W #$0001                                                         ;A7D042;
    STA.W Enemy.instTimer                                                ;A7D045;
    STA.W Enemy[1].instTimer                                             ;A7D048;
    LDA.W #InstList_Phantoon_Body_EyeHitboxOnly                          ;A7D04B;
    STA.W Enemy.instList                                                 ;A7D04E;
    LDA.W #InstList_Phantoon_Eyeball_Centered                            ;A7D051;
    STA.W Enemy[1].instList                                              ;A7D054;
    LDA.W Enemy.properties                                               ;A7D057;
    AND.W #$FBFF                                                         ;A7D05A;
    STA.W Enemy.properties                                               ;A7D05D;
    JSL.L GenerateRandomNumber                                           ;A7D060;
    AND.W #$0007                                                         ;A7D064;
    ASL                                                                  ;A7D067;
    TAY                                                                  ;A7D068;
    LDA.W Phantoon_Figure8_VulnerableWindowTimers,Y                      ;A7D069;
    STA.W Phantoon.functionTimer                                         ;A7D06C;
    LDA.W #Function_Phantoon_Figure8_VulnerableWindow                    ;A7D06F;
    STA.W Phantoon.function                                              ;A7D072;
    RTS                                                                  ;A7D075;


;;; $D076: Pick new Phantoon pattern ;;;
PickNewPhantoonPattern:
; When called by Function_Phantoon_HidingBeforeFigure8_PlacePhantoon, the Phantoon function set here is ignored,
; it is only used by the call from the Phantoon eye instruction list InstList_Phantoon_Eye_Close_PickNewPattern
    LDA.W #$003C                                                         ;A7D076;
    STA.W Phantoon.functionTimer                                         ;A7D079;
    JSL.L GenerateRandomNumber                                           ;A7D07C;
    AND.W #$0007                                                         ;A7D080;
    ASL                                                                  ;A7D083;
    TAY                                                                  ;A7D084;
    LDA.W Phantoon_EyeClosedTimers,Y                                     ;A7D085;
    STA.W Enemy[1].var0                                                  ;A7D088;
    LDA.W NMI_FrameCounter                                               ;A7D08B;
    BIT.W #$0001                                                         ;A7D08E;
    BNE .reversed                                                        ;A7D091;
    LDA.W Phantoon.reversedMovementFlag                                  ;A7D093;
    BEQ +                                                                ;A7D096;
    LDA.W Phantoon.movementIndex                                         ;A7D098;
    INC                                                                  ;A7D09B;
    STA.W Phantoon.movementIndex                                         ;A7D09C;
    CMP.W #$0216                                                         ;A7D09F;
    BMI +                                                                ;A7D0A2;
    STZ.W Phantoon.movementIndex                                         ;A7D0A4;

+   LDA.W #$0001                                                         ;A7D0A7;
    STA.W Phantoon.speed                                                 ;A7D0AA;
    STZ.W Phantoon.subSpeed                                              ;A7D0AD;
    STZ.W Phantoon.movementFlags                                         ;A7D0B0;
    STZ.W Phantoon.reversedMovementFlag                                  ;A7D0B3;
    BRA .merge                                                           ;A7D0B6;

  .reversed:
    LDA.W Phantoon.reversedMovementFlag                                  ;A7D0B8;
    BNE +                                                                ;A7D0BB;
    LDA.W Phantoon.movementIndex                                         ;A7D0BD;
    DEC                                                                  ;A7D0C0;
    STA.W Phantoon.movementIndex                                         ;A7D0C1;
    BPL +                                                                ;A7D0C4;
    LDA.W #$0215                                                         ;A7D0C6;
    STA.W Phantoon.movementIndex                                         ;A7D0C9;

+   STZ.W Phantoon.speed                                                 ;A7D0CC;
    STZ.W Phantoon.subSpeed                                              ;A7D0CF;
    STZ.W Phantoon.movementFlags                                         ;A7D0D2;
    LDA.W #$0001                                                         ;A7D0D5;
    STA.W Phantoon.reversedMovementFlag                                  ;A7D0D8;

  .merge:
    LDA.W Phantoon.flameRainTriggeredFlag                                ;A7D0DB;
    BNE +                                                                ;A7D0DE;
    LDA.W #Function_Phantoon_Figure8_Moving                              ;A7D0E0;
    STA.W Phantoon.function                                              ;A7D0E3;
    RTS                                                                  ;A7D0E6;

+   STZ.W Phantoon.fadeCompleteFlag                                      ;A7D0E7;
    LDA.W #Function_Phantoon_FlameRain_InitialFlameRain                  ;A7D0EA;
    STA.W Phantoon.function                                              ;A7D0ED;
    RTS                                                                  ;A7D0F0;


;;; $D0F1: Adjust speed and move Phantoon in figure-8 ;;;
AdjustSpeedAndMovePhantoonInFigure8:
    LDA.W Phantoon.reversedMovementFlag                                  ;A7D0F1;
    BNE .reversed                                                        ;A7D0F4;
    JSR.W UpdateFigure8PhantoonSpeed                                     ;A7D0F6;
    LDY.W #PhantoonMovementData                                          ;A7D0F9;
    LDA.W #$0216                                                         ;A7D0FC;
    STA.B DP_Temp14                                                      ;A7D0FF;
    JSR.W MovePhantoonInFigure8                                          ;A7D101;
    RTS                                                                  ;A7D104;

  .reversed:
    JSR.W UpdateReversedFigure8PhantoonSpeed                             ;A7D105;
    LDY.W #PhantoonMovementData                                          ;A7D108;
    LDA.W #$0215                                                         ;A7D10B;
    STA.B DP_Temp14                                                      ;A7D10E;
    JSR.W MovePhantoonInReverseFigure8                                   ;A7D110;
    RTS                                                                  ;A7D113;


;;; $D114: Update figure-8 Phantoon speed ;;;
UpdateFigure8PhantoonSpeed:
    LDA.W Phantoon.movementFlags                                         ;A7D114;
    BEQ .stage0                                                          ;A7D117;
    BIT.W #$0001                                                         ;A7D119;
    BNE .stage1                                                          ;A7D11C;
    BRA .stage2                                                          ;A7D11E;

  .stage0:
    LDA.W Phantoon.subSpeed                                              ;A7D120;
    CLC                                                                  ;A7D123;
    ADC.W Phantoon_Figure8_SubAcceleration_SlowStage                     ;A7D124;
    STA.W Phantoon.subSpeed                                              ;A7D127;
    LDA.W Phantoon.speed                                                 ;A7D12A;
    ADC.W Phantoon_Figure8_Acceleration_SlowStage                        ;A7D12D;
    STA.W Phantoon.speed                                                 ;A7D130;
    CMP.W Phantoon_Figure8_SpeedCaps_Stage0Max                           ;A7D133;
    BMI ..return                                                         ;A7D136;
    LDA.W Phantoon_Figure8_SpeedCaps_Stage0Max                           ;A7D138;
    DEC                                                                  ;A7D13B;
    STA.W Phantoon.speed                                                 ;A7D13C;
    STZ.W Phantoon.subSpeed                                              ;A7D13F;
    INC.W Phantoon.movementFlags                                         ;A7D142;

  ..return:
    RTS                                                                  ;A7D145;

  .stage1:
    LDA.W Phantoon.subSpeed                                              ;A7D146;
    CLC                                                                  ;A7D149;
    ADC.W Phantoon_Figure8_SubAcceleration_FastStages                    ;A7D14A;
    STA.W Phantoon.subSpeed                                              ;A7D14D;
    LDA.W Phantoon.speed                                                 ;A7D150;
    ADC.W Phantoon_Figure8_Acceleration_FastStages                       ;A7D153;
    STA.W Phantoon.speed                                                 ;A7D156;
    CMP.W Phantoon_Figure8_SpeedCaps_Stage1Max                           ;A7D159;
    BMI ..return                                                         ;A7D15C;
    LDA.W Phantoon_Figure8_SpeedCaps_Stage1Max                           ;A7D15E;
    STA.W Phantoon.speed                                                 ;A7D161;
    STZ.W Phantoon.subSpeed                                              ;A7D164;
    INC.W Phantoon.movementFlags                                         ;A7D167;

  ..return:
    RTS                                                                  ;A7D16A;

  .stage2:
    LDA.W Phantoon.subSpeed                                              ;A7D16B;
    SEC                                                                  ;A7D16E;
    SBC.W Phantoon_Figure8_SubAcceleration_FastStages                    ;A7D16F;
    STA.W Phantoon.subSpeed                                              ;A7D172;
    LDA.W Phantoon.speed                                                 ;A7D175;
    SBC.W Phantoon_Figure8_Acceleration_FastStages                       ;A7D178;
    STA.W Phantoon.speed                                                 ;A7D17B;
    CMP.W Phantoon_Figure8_SpeedCaps_Stage2Min                           ;A7D17E;
    BEQ .negativeSpeed                                                   ;A7D181;
    BPL .return                                                          ;A7D183;

  .negativeSpeed:
    LDA.W Phantoon_Figure8_SpeedCaps_Stage2Min                           ;A7D185;
    INC                                                                  ;A7D188;
    STA.W Phantoon.speed                                                 ;A7D189;
    STZ.W Phantoon.subSpeed                                              ;A7D18C;
    STZ.W Phantoon.movementFlags                                         ;A7D18F;

  .return:
    RTS                                                                  ;A7D192;


;;; $D193: Update reversed figure-8 Phantoon speed ;;;
UpdateReversedFigure8PhantoonSpeed:
    LDA.W Phantoon.movementFlags                                         ;A7D193;
    BEQ .stage0                                                          ;A7D196;
    BIT.W #$0001                                                         ;A7D198;
    BNE .stage1                                                          ;A7D19B;
    BRA .stage2                                                          ;A7D19D;

  .stage0:
    LDA.W Phantoon.subSpeed                                              ;A7D19F;
    SEC                                                                  ;A7D1A2;
    SBC.W Phantoon_ReverseFigure8_SubAcceleration_SlowStage              ;A7D1A3;
    STA.W Phantoon.subSpeed                                              ;A7D1A6;
    LDA.W Phantoon.speed                                                 ;A7D1A9;
    SBC.W Phantoon_ReverseFigure8_Acceleration_SlowStage                 ;A7D1AC;
    STA.W Phantoon.speed                                                 ;A7D1AF;
    CMP.W Phantoon_ReverseFigure8_SpeedCaps_Stage0Max                    ;A7D1B2;
    BEQ +                                                                ;A7D1B5;
    BPL .stage0_return                                                   ;A7D1B7;

+   LDA.W Phantoon_ReverseFigure8_SpeedCaps_Stage0Max                    ;A7D1B9;
    INC                                                                  ;A7D1BC;
    INC                                                                  ;A7D1BD;
    STA.W Phantoon.speed                                                 ;A7D1BE;
    STZ.W Phantoon.subSpeed                                              ;A7D1C1;
    INC.W Phantoon.movementFlags                                         ;A7D1C4;

  .stage0_return:
    RTS                                                                  ;A7D1C7;

  .stage1:
    LDA.W Phantoon.subSpeed                                              ;A7D1C8;
    SEC                                                                  ;A7D1CB;
    SBC.W Phantoon_ReverseFigure8_SubAcceleration_FastStages             ;A7D1CC;
    STA.W Phantoon.subSpeed                                              ;A7D1CF;
    LDA.W Phantoon.speed                                                 ;A7D1D2;
    SBC.W Phantoon_ReverseFigure8_Acceleration_FastStages                ;A7D1D5;
    STA.W Phantoon.speed                                                 ;A7D1D8;
    CMP.W Phantoon_ReverseFigure8_SpeedCaps_Stage1Max                    ;A7D1DB;
    BEQ +                                                                ;A7D1DE;
    BPL .stage1_return                                                   ;A7D1E0;

+   LDA.W Phantoon_ReverseFigure8_SpeedCaps_Stage1Max                    ;A7D1E2;
    INC                                                                  ;A7D1E5;
    STA.W Phantoon.speed                                                 ;A7D1E6;
    STZ.W Phantoon.subSpeed                                              ;A7D1E9;
    INC.W Phantoon.movementFlags                                         ;A7D1EC;

  .stage1_return:
    RTS                                                                  ;A7D1EF;

  .stage2:
    LDA.W Phantoon.subSpeed                                              ;A7D1F0;
    CLC                                                                  ;A7D1F3;
    ADC.W Phantoon_ReverseFigure8_SubAcceleration_FastStages             ;A7D1F4;
    STA.W Phantoon.subSpeed                                              ;A7D1F7;
    LDA.W Phantoon.speed                                                 ;A7D1FA;
    ADC.W Phantoon_ReverseFigure8_Acceleration_FastStages                ;A7D1FD;
    STA.W Phantoon.speed                                                 ;A7D200;
    CMP.W Phantoon_ReverseFigure8_SpeedCaps_Stage2Min                    ;A7D203;
    BMI ..return                                                         ;A7D206;
    LDA.W Phantoon_ReverseFigure8_SpeedCaps_Stage2Min                    ;A7D208;
    STA.W Phantoon.speed                                                 ;A7D20B;
    STZ.W Phantoon.subSpeed                                              ;A7D20E;
    STZ.W Phantoon.movementFlags                                         ;A7D211;

  ..return:
    RTS                                                                  ;A7D214;


;;; $D215: Move Phantoon in figure-8 ;;;
MovePhantoonInFigure8:
;; Parameters:
;;     Y: PhantoonMovementData
;;     $14: 216h (size of Phantoon movement data)
    LDA.W Phantoon.speed                                                 ;A7D215;
    STA.B DP_Temp16                                                      ;A7D218;
    BNE .loop                                                            ;A7D21A;
    RTS                                                                  ;A7D21C;

  .loop:
    PHY                                                                  ;A7D21D;
    LDA.W Phantoon.movementIndex                                         ;A7D21E;
    ASL                                                                  ;A7D221;
    STA.B DP_Temp12                                                      ;A7D222;
    TYA                                                                  ;A7D224;
    CLC                                                                  ;A7D225;
    ADC.B DP_Temp12                                                      ;A7D226;
    TAY                                                                  ;A7D228;
    LDA.W $0000,Y                                                        ;A7D229;
    AND.W #$00FF                                                         ;A7D22C;
    BIT.W #$0080                                                         ;A7D22F;
    BEQ +                                                                ;A7D232;
    ORA.W #$FF00                                                         ;A7D234;

+   STA.B DP_Temp12                                                      ;A7D237;
    LDA.W Enemy.XPosition                                                ;A7D239;
    CLC                                                                  ;A7D23C;
    ADC.B DP_Temp12                                                      ;A7D23D;
    STA.W Enemy.XPosition                                                ;A7D23F;
    LDA.W $0001,Y                                                        ;A7D242;
    AND.W #$00FF                                                         ;A7D245;
    BIT.W #$0080                                                         ;A7D248;
    BEQ +                                                                ;A7D24B;
    ORA.W #$FF00                                                         ;A7D24D;

+   STA.B DP_Temp12                                                      ;A7D250;
    LDA.W Enemy.YPosition                                                ;A7D252;
    CLC                                                                  ;A7D255;
    ADC.B DP_Temp12                                                      ;A7D256;
    STA.W Enemy.YPosition                                                ;A7D258;
    LDA.W Phantoon.movementIndex                                         ;A7D25B;
    INC                                                                  ;A7D25E;
    STA.W Phantoon.movementIndex                                         ;A7D25F;
    CMP.B DP_Temp14                                                      ;A7D262;
    BMI +                                                                ;A7D264;
    STZ.W Phantoon.movementIndex                                         ;A7D266;

+   PLY                                                                  ;A7D269;
    DEC.B DP_Temp16                                                      ;A7D26A;
    BEQ .return                                                          ;A7D26C;
    BRA .loop                                                            ;A7D26E;

  .return:
    RTS                                                                  ;A7D270;


;;; $D271: Move Phantoon in reverse figure-8 ;;;
MovePhantoonInReverseFigure8:
;; Parameters:
;;     Y: PhantoonMovementData
;;     $14: 215h (last index of Phantoon movement data)
    LDA.W Phantoon.speed                                                 ;A7D271;
    EOR.W #$FFFF                                                         ;A7D274;
    INC                                                                  ;A7D277;
    STA.B DP_Temp16                                                      ;A7D278;
    BNE .loop                                                            ;A7D27A;
    RTS                                                                  ;A7D27C;

  .loop:
    PHY                                                                  ;A7D27D;
    LDA.W Phantoon.movementIndex                                         ;A7D27E;
    ASL                                                                  ;A7D281;
    STA.B DP_Temp12                                                      ;A7D282;
    TYA                                                                  ;A7D284;
    CLC                                                                  ;A7D285;
    ADC.B DP_Temp12                                                      ;A7D286;
    TAY                                                                  ;A7D288;
    LDA.W $0000,Y                                                        ;A7D289;
    AND.W #$00FF                                                         ;A7D28C;
    BIT.W #$0080                                                         ;A7D28F;
    BEQ +                                                                ;A7D292;
    ORA.W #$FF00                                                         ;A7D294;

+   STA.B DP_Temp12                                                      ;A7D297;
    LDA.W Enemy.XPosition                                                ;A7D299;
    SEC                                                                  ;A7D29C;
    SBC.B DP_Temp12                                                      ;A7D29D;
    STA.W Enemy.XPosition                                                ;A7D29F;
    LDA.W $0001,Y                                                        ;A7D2A2;
    AND.W #$00FF                                                         ;A7D2A5;
    BIT.W #$0080                                                         ;A7D2A8;
    BEQ +                                                                ;A7D2AB;
    ORA.W #$FF00                                                         ;A7D2AD;

+   STA.B DP_Temp12                                                      ;A7D2B0;
    LDA.W Enemy.YPosition                                                ;A7D2B2;
    SEC                                                                  ;A7D2B5;
    SBC.B DP_Temp12                                                      ;A7D2B6;
    STA.W Enemy.YPosition                                                ;A7D2B8;
    LDA.W Phantoon.movementIndex                                         ;A7D2BB;
    DEC                                                                  ;A7D2BE;
    STA.W Phantoon.movementIndex                                         ;A7D2BF;
    BPL +                                                                ;A7D2C2;
    LDA.B DP_Temp14                                                      ;A7D2C4;
    STA.W Phantoon.movementIndex                                         ;A7D2C6;

+   PLY                                                                  ;A7D2C9;
    DEC.B DP_Temp16                                                      ;A7D2CA;
    BEQ .return                                                          ;A7D2CC;
    BRA .loop                                                            ;A7D2CE;

  .return:
    RTS                                                                  ;A7D2D0;


;;; $D2D1: Move Phantoon in swooping pattern ;;;
MovePhantoonInSwoopingPattern:
    LDA.W Phantoon.swoopingTargetXPosition                               ;A7D2D1;
    BMI .targetXNegative                                                 ;A7D2D4;
    CLC                                                                  ;A7D2D6;
    ADC.W #$0002                                                         ;A7D2D7;
    STA.W Phantoon.swoopingTargetXPosition                               ;A7D2DA;
    CMP.W #$0100                                                         ;A7D2DD;
    BMI .targetCalculated                                                ;A7D2E0;
    ORA.W #$8000                                                         ;A7D2E2;
    STA.W Phantoon.swoopingTargetXPosition                               ;A7D2E5;
    AND.W #$7FFF                                                         ;A7D2E8;
    BRA .targetCalculated                                                ;A7D2EB;

  .targetXNegative:
    SEC                                                                  ;A7D2ED;
    SBC.W #$0002                                                         ;A7D2EE;
    STA.W Phantoon.swoopingTargetXPosition                               ;A7D2F1;
    AND.W #$7FFF                                                         ;A7D2F4;
    BEQ +                                                                ;A7D2F7;
    BPL .targetCalculated                                                ;A7D2F9;

+   LDA.W #$0000                                                         ;A7D2FB;
    STA.W Phantoon.swoopingTargetXPosition                               ;A7D2FE;

  .targetCalculated:
    CMP.W Enemy.XPosition                                                ;A7D301;
    BMI .lessThanX                                                       ;A7D304;
    LDA.W Phantoon.swoopingXVelocity                                     ;A7D306;
    CMP.W #$0800                                                         ;A7D309;
    BPL +                                                                ;A7D30C;
    CLC                                                                  ;A7D30E;
    ADC.W #$0020                                                         ;A7D30F;
    STA.W Phantoon.swoopingXVelocity                                     ;A7D312;
    BRA +                                                                ;A7D315;

  .lessThanX:
    LDA.W Phantoon.swoopingXVelocity                                     ;A7D317;
    CMP.W #$F801                                                         ;A7D31A;
    BMI +                                                                ;A7D31D;
    SEC                                                                  ;A7D31F;
    SBC.W #$0020                                                         ;A7D320;
    STA.W Phantoon.swoopingXVelocity                                     ;A7D323;

+   LDA.W Phantoon.swoopingXVelocity                                     ;A7D326;
    XBA                                                                  ;A7D329;
    PHA                                                                  ;A7D32A;
    AND.W #$FF00                                                         ;A7D32B;
    STA.B DP_Temp14                                                      ;A7D32E;
    PLA                                                                  ;A7D330;
    AND.W #$00FF                                                         ;A7D331;
    BIT.W #$0080                                                         ;A7D334;
    BEQ +                                                                ;A7D337;
    ORA.W #$FF00                                                         ;A7D339;

+   STA.B DP_Temp12                                                      ;A7D33C;
    LDA.W Enemy.XSubPosition                                             ;A7D33E;
    CLC                                                                  ;A7D341;
    ADC.B DP_Temp14                                                      ;A7D342;
    STA.W Enemy.XSubPosition                                             ;A7D344;
    LDA.W Enemy.XPosition                                                ;A7D347;
    ADC.B DP_Temp12                                                      ;A7D34A;
    STA.W Enemy.XPosition                                                ;A7D34C;
    CMP.W #$FFC0                                                         ;A7D34F;
    BPL +                                                                ;A7D352;
    LDA.W #$FFC0                                                         ;A7D354;
    STA.W Enemy.XPosition                                                ;A7D357;
    BRA .checkDead                                                       ;A7D35A;

+   CMP.W #$01C0                                                         ;A7D35C;
    BMI .checkDead                                                       ;A7D35F;
    LDA.W #$01C0                                                         ;A7D361;
    STA.W Enemy.XPosition                                                ;A7D364;

  .checkDead:
    LDA.W Phantoon.function,X                                            ;A7D367;
    CMP.W #Function_Phantoon_Swooping_FatalDamage                        ;A7D36A;
    BNE .notDeathSwoop                                                   ;A7D36D;
    LDA.W #$0070                                                         ;A7D36F;
    BRA +                                                                ;A7D372;

  .notDeathSwoop:
    LDA.W SamusYPosition                                                 ;A7D374;
    SEC                                                                  ;A7D377;
    SBC.W #$0030                                                         ;A7D378;

+   CMP.W Enemy.YPosition                                                ;A7D37B;
    BMI .lessThanY                                                       ;A7D37E;
    LDA.W Phantoon.swoopingYVelocity                                     ;A7D380;
    CMP.W #$0600                                                         ;A7D383;
    BPL +                                                                ;A7D386;
    CLC                                                                  ;A7D388;
    ADC.W #$0040                                                         ;A7D389;
    STA.W Phantoon.swoopingYVelocity                                     ;A7D38C;
    BRA +                                                                ;A7D38F;

  .lessThanY:
    LDA.W Phantoon.swoopingYVelocity                                     ;A7D391;
    CMP.W #$FA01                                                         ;A7D394;
    BMI +                                                                ;A7D397;
    SEC                                                                  ;A7D399;
    SBC.W #$0040                                                         ;A7D39A;
    STA.W Phantoon.swoopingYVelocity                                     ;A7D39D;

+   LDA.W Phantoon.swoopingYVelocity                                     ;A7D3A0;
    XBA                                                                  ;A7D3A3;
    PHA                                                                  ;A7D3A4;
    AND.W #$FF00                                                         ;A7D3A5;
    STA.B DP_Temp14                                                      ;A7D3A8;
    PLA                                                                  ;A7D3AA;
    AND.W #$00FF                                                         ;A7D3AB;
    BIT.W #$0080                                                         ;A7D3AE;
    BEQ +                                                                ;A7D3B1;
    ORA.W #$FF00                                                         ;A7D3B3;

+   STA.B DP_Temp12                                                      ;A7D3B6;
    LDA.W Enemy.YSubPosition                                             ;A7D3B8;
    CLC                                                                  ;A7D3BB;
    ADC.B DP_Temp14                                                      ;A7D3BC;
    STA.W Enemy.YSubPosition                                             ;A7D3BE;
    LDA.W Enemy.YPosition                                                ;A7D3C1;
    ADC.B DP_Temp12                                                      ;A7D3C4;
    STA.W Enemy.YPosition                                                ;A7D3C6;
    CMP.W #$0040                                                         ;A7D3C9;
    BPL +                                                                ;A7D3CC;
    LDA.W #$0040                                                         ;A7D3CE;
    STA.W Enemy.YPosition                                                ;A7D3D1;
    RTS                                                                  ;A7D3D4;

+   CMP.W #$00D8                                                         ;A7D3D5;
    BMI .return                                                          ;A7D3D8;
    LDA.W #$00D8                                                         ;A7D3DA;
    STA.W Enemy.YPosition                                                ;A7D3DD;

  .return:
    RTS                                                                  ;A7D3E0;


;;; $D3E1: Start Phantoon swooping pattern ;;;
StartPhantoonSwoopingPattern:
    LDA.W #$0400                                                         ;A7D3E1;
    STA.W Phantoon.swoopingXVelocity                                     ;A7D3E4;
    STA.W Phantoon.swoopingYVelocity                                     ;A7D3E7;
    STZ.W Phantoon.swoopingTargetXPosition                               ;A7D3EA;
    LDA.W #Function_Phantoon_Swooping_Opaque                             ;A7D3ED;
    STA.W Phantoon.function,X                                            ;A7D3F0;
    LDA.W #$0168                                                         ;A7D3F3;
    STA.W Phantoon.functionTimer,X                                       ;A7D3F6;
    RTS                                                                  ;A7D3F9;


;;; $D3FA: Make Phantoon look towards Samus ;;;
MakePhantoonLookTowardsSamus:
    JSL.L DetermineDirectionOfSamusFromEnemy                             ;A7D3FA;
    ASL                                                                  ;A7D3FE;
    TAY                                                                  ;A7D3FF;
    LDA.W #$0001                                                         ;A7D400;
    STA.W Enemy[1].instTimer                                             ;A7D403;
    LDA.W .directionPointers,Y                                           ;A7D406;
    STA.W Enemy[1].instList                                              ;A7D409;
    RTS                                                                  ;A7D40C;

  .directionPointers:
    dw InstList_Phantoon_Eyeball_LookingUp                               ;A7D40D; Up
    dw InstList_Phantoon_Eyeball_LookingUpRight                          ;A7D40F; Up-right
    dw InstList_Phantoon_Eyeball_LookingRight                            ;A7D411; Right
    dw InstList_Phantoon_Eyeball_LookingDownRight                        ;A7D413; Down-right
    dw InstList_Phantoon_Eyeball_LookingDown                             ;A7D415; Down
    dw InstList_Phantoon_Eyeball_LookingDown                             ;A7D417;
    dw InstList_Phantoon_Eyeball_LookingDownLeft                         ;A7D419; Down-left
    dw InstList_Phantoon_Eyeball_LookingLeft                             ;A7D41B; Left
    dw InstList_Phantoon_Eyeball_LookingUpLeft                           ;A7D41D; Up-left
    dw InstList_Phantoon_Eyeball_LookingUp                               ;A7D41F;


;;; $D421: Start Phantoon death sequence ;;;
StartPhantoonDeathSequence:
    PHX                                                                  ;A7D421;
    LDA.W Phantoon.function,X                                            ;A7D422;
    CMP.W #Function_Phantoon_Swooping_Opaque                             ;A7D425;
    BEQ .swooping                                                        ;A7D428;
    CMP.W #Function_Phantoon_Swooping_FadeOut                            ;A7D42A;
    BEQ .swooping                                                        ;A7D42D;
    LDA.W #Function_Phantoon_DeathSequence_FadingInAndOut                ;A7D42F;
    STA.W Phantoon.function,X                                            ;A7D432;
    BRA +                                                                ;A7D435;

  .swooping:
    LDA.W #Function_Phantoon_Swooping_FatalDamage                        ;A7D437;
    STA.W Phantoon.function,X                                            ;A7D43A;

+   STZ.W Phantoon.reversedMovementFlag                                  ;A7D43D;
    STZ.W Phantoon.fadeCompleteFlag                                      ;A7D440;
    JSR.W MakePhantoonLookTowardsSamus                                   ;A7D443;
    LDX.W #$01FE                                                         ;A7D446;
    LDA.B DP_BG2XScroll                                                  ;A7D449;

  .loopBG2XScroll:
    STA.L WavyPhantoonBG2XScrollHDMADataTable,X                          ;A7D44B;
    DEX                                                                  ;A7D44F;
    DEX                                                                  ;A7D450;
    BPL .loopBG2XScroll                                                  ;A7D451;
    LDA.W LayerBlending_PhantoonSemiTransparencyFlag                     ;A7D453;
    ORA.W #$4000                                                         ;A7D456;
    STA.W LayerBlending_PhantoonSemiTransparencyFlag                     ;A7D459;
    LDA.W #$0001                                                         ;A7D45C;
    STA.W Enemy[3].init1                                                 ;A7D45F;
    PLX                                                                  ;A7D462;
    RTS                                                                  ;A7D463;


;;; $D464: Advance Phantoon fade out ;;;
AdvancePhantoonFadeOut_DenominatorInA:
;; Parameters:
;;     A: Palette change denominator
    PHX                                                                  ;A7D464;
    STA.B DP_Temp12                                                      ;A7D465;
    LDA.W NMI_FrameCounter                                               ;A7D467;
    BIT.W #$0001                                                         ;A7D46A;
    BNE .return                                                          ;A7D46D;
    LDA.W Phantoon.fadeCompleteFlag                                      ;A7D46F;
    BNE .return                                                          ;A7D472;
    LDA.B DP_Temp12                                                      ;A7D474;
    STA.W Phantoon.paletteChangeDenominator                              ;A7D476;
    JSR.W AdvancePhantoonFadeOut                                         ;A7D479;
    BCC .return                                                          ;A7D47C;
    LDA.W #$0001                                                         ;A7D47E;
    STA.W Phantoon.fadeCompleteFlag                                      ;A7D481;

  .return:
    PLX                                                                  ;A7D484;
    RTS                                                                  ;A7D485;


;;; $D486: Advance Phantoon fade in ;;;
AdvancePhantoonFadeIn_DenominatorInA:
;; Parameters:
;;     A: Palette change denominator
    PHX                                                                  ;A7D486;
    STA.B DP_Temp12                                                      ;A7D487;
    LDA.W NMI_FrameCounter                                               ;A7D489;
    BIT.W #$0001                                                         ;A7D48C;
    BNE .return                                                          ;A7D48F;
    LDA.W Phantoon.fadeCompleteFlag                                      ;A7D491;
    BNE .return                                                          ;A7D494;
    LDA.B DP_Temp12                                                      ;A7D496;
    STA.W Phantoon.paletteChangeDenominator                              ;A7D498;
    JSR.W AdvancePhantoonFadeIn                                          ;A7D49B;
    BCC .return                                                          ;A7D49E;
    LDA.W #$0001                                                         ;A7D4A0;
    STA.W Phantoon.fadeCompleteFlag                                      ;A7D4A3;

  .return:
    PLX                                                                  ;A7D4A6;
    RTS                                                                  ;A7D4A7;


;;; $D4A8: RTS ;;;
RTS_A7D4A8:
    RTS                                                                  ;A7D4A8;


;;; $D4A9: Phantoon function - fight intro - spawn circle of flames ;;;
Function_Phantoon_FightIntro_SpawnCircleOfFlames:
    DEC.W Phantoon.functionTimer,X                                       ;A7D4A9;
    BEQ .timerExpired                                                    ;A7D4AC;
    BPL .return                                                          ;A7D4AE;

  .timerExpired:
    LDA.W Phantoon.flameCounter                                          ;A7D4B0;
    LDY.W #EnemyProjectile_PhantoonStartingFlames                        ;A7D4B3;
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics                     ;A7D4B6;
    LDA.W #$001D                                                         ;A7D4BA;
    JSL.L QueueSound_Lib3_Max6                                           ;A7D4BD;
    LDA.W #$001E                                                         ;A7D4C1;
    STA.W Phantoon.functionTimer,X                                       ;A7D4C4;
    LDA.W Phantoon.flameCounter                                          ;A7D4C7;
    INC                                                                  ;A7D4CA;
    STA.W Phantoon.flameCounter                                          ;A7D4CB;
    CMP.W #$0008                                                         ;A7D4CE;
    BMI .return                                                          ;A7D4D1;
    STZ.W Phantoon.flameCounter                                          ;A7D4D3;
    STZ.W Phantoon.roundDamage,X                                         ;A7D4D6;
    LDA.W #Function_Phantoon_FightIntro_SpinCircleOfFlames               ;A7D4D9;
    STA.W Phantoon.function,X                                            ;A7D4DC;
    LDA.W #$001E                                                         ;A7D4DF;
    STA.W Phantoon.functionTimer,X                                       ;A7D4E2;
    JSL.L Spawn_Hardcoded_PLM                                            ;A7D4E5;
    db $00,$06                                                           ;A7D4E9;
    dw PLMEntries_drawPhantoonsDoorDuringBossFight                       ;A7D4EB;

  .return:
    RTS                                                                  ;A7D4ED;


;;; $D4EE: Phantoon function - fight intro - spin circle of flames ;;;
Function_Phantoon_FightIntro_SpinCircleOfFlames:
    DEC.W Phantoon.functionTimer,X                                       ;A7D4EE;
    BEQ .timerExpired                                                    ;A7D4F1;
    BPL .return                                                          ;A7D4F3;

  .timerExpired:
    LDA.W #$00F0                                                         ;A7D4F5;
    STA.W Phantoon.functionTimer,X                                       ;A7D4F8;
    LDA.W #$0001                                                         ;A7D4FB;
    STA.W Phantoon.startingFlamesActivationFlag,X                        ;A7D4FE;
    LDA.W #Function_Phantoon_FightIntro_StartWavyFadeIn                  ;A7D501;
    STA.W Phantoon.function,X                                            ;A7D504;

  .return:
    RTS                                                                  ;A7D507;


;;; $D508: Phantoon function - fight intro - start wavy fade in ;;;
Function_Phantoon_FightIntro_StartWavyFadeIn:
    DEC.W Phantoon.functionTimer,X                                       ;A7D508;
    BEQ .timerExpired                                                    ;A7D50B;
    BPL .return                                                          ;A7D50D;

  .timerExpired:
    STZ.W Phantoon.startingFlamesActivationFlag,X                        ;A7D50F;
    LDA.W LayerBlending_PhantoonSemiTransparencyFlag                     ;A7D512;
    ORA.W #$4000                                                         ;A7D515;
    STA.W LayerBlending_PhantoonSemiTransparencyFlag                     ;A7D518;
    LDA.W #Function_Phantoon_FightIntro_WavyFadeIn                       ;A7D51B;
    STA.W Phantoon.function,X                                            ;A7D51E;
    LDA.W #$8001                                                         ;A7D521;
    STA.W Phantoon.semiTransparencyHDMAObjectControl                     ;A7D524;
    LDA.W #$0078                                                         ;A7D527;
    STA.W Phantoon.functionTimer,X                                       ;A7D52A;
    LDA.W WavyPhantoonConstants_phaseDelta                               ;A7D52D;
    STA.B DP_Temp16                                                      ;A7D530;
    LDA.W #$0002                                                         ;A7D532;
    JSL.L Spawn_WavyPhantoon_HDMAObject                                  ;A7D535;
    LDA.W WavyPhantoonConstants_Intro_maxAmplitude                       ;A7D539;
    STA.W Phantoon.wavyPhantoonPhaseAmplitude                            ;A7D53C;
    STZ.W Phantoon.fadeCompleteFlag                                      ;A7D53F;
    LDA.W #$0005                                                         ;A7D542;
    JSL.L QueueMusicDataOrTrack_8FrameDelay                              ;A7D545;

  .return:
    RTS                                                                  ;A7D549;


;;; $D54A: Phantoon function - fight intro - wavy fade-in ;;;
Function_Phantoon_FightIntro_WavyFadeIn:
    LDA.W #$000C                                                         ;A7D54A;
    JSR.W AdvancePhantoonFadeIn_DenominatorInA                           ;A7D54D;
    LDA.W WavyPhantoonConstants_Intro_amplitudeDelta                     ;A7D550;
    STA.B DP_Temp12                                                      ;A7D553;
    LDA.W WavyPhantoonConstants_Intro_maxAmplitude                       ;A7D555;
    STA.B DP_Temp14                                                      ;A7D558;
    JSR.W GrowShrinkPhantoonWaveAmplitude                                ;A7D55A;
    BCS .done                                                            ;A7D55D;
    DEC.W Phantoon.functionTimer,X                                       ;A7D55F;
    BEQ .shrinking                                                       ;A7D562;
    BPL .return                                                          ;A7D564;

  .shrinking:
    LDA.W #$0001                                                         ;A7D566;
    STA.W Phantoon.wavyPhantoonPhaseDeltaDirection                       ;A7D569;
    BRA .return                                                          ;A7D56C;

  .done:
    LDA.W #Function_Phantoon_FightIntro_PickFirstPattern                 ;A7D56E;
    STA.W Phantoon.function,X                                            ;A7D571;
    LDA.W #$0001                                                         ;A7D574;
    STA.W Phantoon.semiTransparencyHDMAObjectControl                     ;A7D577;
    LDA.W #$001E                                                         ;A7D57A;
    STA.W Phantoon.functionTimer,X                                       ;A7D57D;

  .return:
    RTS                                                                  ;A7D580;


if !FEATURE_KEEP_UNREFERENCED
;;; $D581: Unused ;;;
UNUSED_Function_Phantoon_FightIntro_A7D581:
    LDX.W #$01FE                                                         ;A7D581;
    LDA.W #$0000                                                         ;A7D584;

  .loop:
    STA.L WavyPhantoonBG2XScrollHDMADataTable,X                          ;A7D587;
    DEX                                                                  ;A7D58B;
    DEX                                                                  ;A7D58C;
    BPL .loop                                                            ;A7D58D;
    LDA.W #Function_Phantoon_FightIntro_PickFirstPattern                 ;A7D58F;
    STA.W Phantoon.function,X                                            ;A7D592;
    RTS                                                                  ;A7D595;
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $D596: Phantoon function - fight intro - pick first pattern ;;;
Function_Phantoon_FightIntro_PickFirstPattern:
    DEC.W Phantoon.functionTimer,X                                       ;A7D596;
    BEQ .timerExpired                                                    ;A7D599;
    BPL .return                                                          ;A7D59B;

  .timerExpired:
    STZ.W Phantoon.wavyPhantoonMode                                      ;A7D59D;
    LDA.W #Function_Phantoon_Figure8_Moving                              ;A7D5A0;
    STA.W Phantoon.function,X                                            ;A7D5A3;
    LDA.W NMI_FrameCounter                                               ;A7D5A6;
    LSR                                                                  ;A7D5A9;
    AND.W #$0003                                                         ;A7D5AA;
    ASL                                                                  ;A7D5AD;
    TAY                                                                  ;A7D5AE;
    LDA.W Phantoon_EyeClosedTimers,Y                                     ;A7D5AF;
    STA.W Enemy[1].var0                                                  ;A7D5B2;
    JSL.L GenerateRandomNumber                                           ;A7D5B5;
    BIT.W #$0001                                                         ;A7D5B9;
    BNE .reversed                                                        ;A7D5BC;
    LDA.W #$0001                                                         ;A7D5BE;
    STA.W Phantoon.speed                                                 ;A7D5C1;
    STZ.W Phantoon.subSpeed                                              ;A7D5C4;
    STZ.W Phantoon.movementFlags                                         ;A7D5C7;
    STZ.W Phantoon.fadeCounter                                           ;A7D5CA;
    STZ.W Phantoon.movementIndex                                         ;A7D5CD;
    RTS                                                                  ;A7D5D0;

  .reversed:
    STZ.W Phantoon.speed                                                 ;A7D5D1;
    STZ.W Phantoon.subSpeed                                              ;A7D5D4;
    STZ.W Phantoon.movementFlags                                         ;A7D5D7;
    LDA.W #$0001                                                         ;A7D5DA;
    STA.W Phantoon.fadeCounter                                           ;A7D5DD;
    LDA.W #$0215                                                         ;A7D5E0;
    STA.W Phantoon.movementIndex                                         ;A7D5E3;

  .return:
    RTS                                                                  ;A7D5E6;


;;; $D5E7: Phantoon function - figure-8 - moving ;;;
Function_Phantoon_Figure8_Moving:
    JSR.W AdjustSpeedAndMovePhantoonInFigure8                            ;A7D5E7;
    JSR.W HandleCasualFlames                                             ;A7D5EA;
    DEC.W Enemy[1].var0                                                  ;A7D5ED;
    BEQ .timerExpired                                                    ;A7D5F0;
    BPL .return                                                          ;A7D5F2;

  .timerExpired:
    LDA.W #RTS_A7D4A8                                                    ;A7D5F4;
    STA.W Phantoon.function,X                                            ;A7D5F7;
    LDA.W #$0001                                                         ;A7D5FA;
    STA.W Enemy[1].instTimer                                             ;A7D5FD;
    LDA.W #InstList_Phantoon_Eye_Open                                    ;A7D600;
    STA.W Enemy[1].instList                                              ;A7D603;
    STZ.W Phantoon.flameRainTriggeredFlag                                ;A7D606;
    JSR.W PhantoonMaterializationFlameSpiral                             ;A7D609;

  .return:
    RTS                                                                  ;A7D60C;


;;; $D60D: Phantoon function - figure-8 - vulnerable window ;;;
Function_Phantoon_Figure8_VulnerableWindow:
    DEC.W Phantoon.functionTimer,X                                       ;A7D60D;
    BEQ .timerExpired                                                    ;A7D610;
    BPL .waiting                                                         ;A7D612;

  .timerExpired:
    STZ.W Phantoon.roundDamage,X                                         ;A7D614;
    LDA.W Phantoon.swoopingTriggeredFlag                                 ;A7D617;
    BEQ .swoopingNotTriggered                                            ;A7D61A;
    STZ.W Phantoon.swoopingTriggeredFlag                                 ;A7D61C;
    LDA.W #$003C                                                         ;A7D61F;
    STA.W Phantoon.functionTimer,X                                       ;A7D622;
    LDA.W #Function_Phantoon_Figure8_SwoopingTriggered                   ;A7D625;
    STA.W Phantoon.function,X                                            ;A7D628;
    BRA .waiting                                                         ;A7D62B;

  .swoopingNotTriggered:
    LDA.W #RTS_A7D4A8                                                    ;A7D62D;
    STA.W Phantoon.function,X                                            ;A7D630;
    LDA.W #$0001                                                         ;A7D633;
    STA.W Enemy.instTimer                                                ;A7D636;
    STA.W Enemy[1].instTimer                                             ;A7D639;
    LDA.W #InstList_Phantoon_Body_Invulnerable                           ;A7D63C;
    STA.W Enemy.instList                                                 ;A7D63F;
    LDA.W #InstList_Phantoon_Eye_Close_PickNewPattern                    ;A7D642;
    STA.W Enemy[1].instList                                              ;A7D645;
    LDA.W Enemy.properties                                               ;A7D648;
    ORA.W #$0400                                                         ;A7D64B;
    STA.W Enemy.properties                                               ;A7D64E;
    LDA.W #$0001                                                         ;A7D651;
    STA.W Phantoon.flameRainTriggeredFlag                                ;A7D654;
    RTS                                                                  ;A7D657;

  .waiting:
    JSR.W MakePhantoonLookTowardsSamus                                   ;A7D658;
    RTS                                                                  ;A7D65B;


;;; $D65C: Phantoon function - figure-8 - swooping triggered ;;;
Function_Phantoon_Figure8_SwoopingTriggered:
    JSR.W MakePhantoonLookTowardsSamus                                   ;A7D65C;
    LDA.W LayerBlending_PhantoonSemiTransparencyFlag                     ;A7D65F;
    AND.W #$BFFF                                                         ;A7D662;
    STA.W LayerBlending_PhantoonSemiTransparencyFlag                     ;A7D665;
    JSR.W StartPhantoonSwoopingPattern                                   ;A7D668;
    LDA.W #$0001                                                         ;A7D66B;
    STA.W Enemy.instTimer                                                ;A7D66E;
    LDA.W #InstList_Phantoon_Body_FullHitbox                             ;A7D671;
    STA.W Enemy.instList                                                 ;A7D674;
    RTS                                                                  ;A7D677;


;;; $D678: Phantoon function - swooping - opaque ;;;
Function_Phantoon_Swooping_Opaque:
    JSR.W MakePhantoonLookTowardsSamus                                   ;A7D678;
    JSR.W MovePhantoonInSwoopingPattern                                  ;A7D67B;
    DEC.W Phantoon.functionTimer,X                                       ;A7D67E;
    BEQ .timerExpired                                                    ;A7D681;
    BPL .return                                                          ;A7D683;

  .timerExpired:
    LDA.W #Function_Phantoon_Swooping_FadeOut                            ;A7D685;
    STA.W Phantoon.function,X                                            ;A7D688;
    LDA.W LayerBlending_PhantoonSemiTransparencyFlag                     ;A7D68B;
    ORA.W #$4000                                                         ;A7D68E;
    STA.W LayerBlending_PhantoonSemiTransparencyFlag                     ;A7D691;
    LDA.W #$0001                                                         ;A7D694;
    STA.W Enemy.instTimer                                                ;A7D697;
    STA.W Enemy[1].instTimer                                             ;A7D69A;
    LDA.W #InstList_Phantoon_Body_Invulnerable                           ;A7D69D;
    STA.W Enemy.instList                                                 ;A7D6A0;
    LDA.W #InstList_Phantoon_Eye_Close                                   ;A7D6A3;
    STA.W Enemy[1].instList                                              ;A7D6A6;
    LDA.W Enemy.properties                                               ;A7D6A9;
    ORA.W #$0400                                                         ;A7D6AC;
    STA.W Enemy.properties                                               ;A7D6AF;
    STZ.W Phantoon.fadeCompleteFlag                                      ;A7D6B2;
    STZ.W Phantoon.roundDamage,X                                         ;A7D6B5;

  .return:
    RTS                                                                  ;A7D6B8;


;;; $D6B9: Phantoon function - swooping - fading out ;;;
Function_Phantoon_Swooping_FadeOut:
    JSR.W MovePhantoonInSwoopingPattern                                  ;A7D6B9;
    LDA.W #$000C                                                         ;A7D6BC;
    JSR.W AdvancePhantoonFadeOut_DenominatorInA                          ;A7D6BF;
    LDA.W Phantoon.fadeCompleteFlag                                      ;A7D6C2;
    BEQ .return                                                          ;A7D6C5;
    LDA.W #Function_Phantoon_HidingBeforeFigure8_Hiding                  ;A7D6C7;
    STA.W Phantoon.function,X                                            ;A7D6CA;
    LDA.W #$0078                                                         ;A7D6CD;
    STA.W Phantoon.functionTimer,X                                       ;A7D6D0;

  .return:
    RTS                                                                  ;A7D6D3;


;;; $D6D4: Phantoon function - hiding before figure-8 - hiding ;;;
Function_Phantoon_HidingBeforeFigure8_Hiding:
    DEC.W Phantoon.functionTimer,X                                       ;A7D6D4;
    BEQ .timerExpired                                                    ;A7D6D7;
    BPL .return                                                          ;A7D6D9;

  .timerExpired:
    LDA.W #Function_Phantoon_HidingBeforeFigure8_PlacePhantoon           ;A7D6DB;
    STA.W Phantoon.function,X                                            ;A7D6DE;

  .return:
    RTS                                                                  ;A7D6E1;


;;; $D6E2: Phantoon function - hiding before figure-8 - place Phantoon ;;;
Function_Phantoon_HidingBeforeFigure8_PlacePhantoon:
    JSL.L GenerateRandomNumber                                           ;A7D6E2;
    BIT.W #$0001                                                         ;A7D6E6;
    BEQ .leftSidePattern                                                 ;A7D6E9;
    LDA.W #$0088                                                         ;A7D6EB;
    STA.W Phantoon.movementIndex                                         ;A7D6EE;
    LDA.W #$00D0                                                         ;A7D6F1;
    STA.W Enemy.XPosition                                                ;A7D6F4;
    LDA.W #$0060                                                         ;A7D6F7;
    STA.W Enemy.YPosition                                                ;A7D6FA;
    BRA +                                                                ;A7D6FD;

  .leftSidePattern:
    LDA.W #$018F                                                         ;A7D6FF;
    STA.W Phantoon.movementIndex                                         ;A7D702;
    LDA.W #$0030                                                         ;A7D705;
    STA.W Enemy.XPosition                                                ;A7D708;
    LDA.W #$0060                                                         ;A7D70B;
    STA.W Enemy.YPosition                                                ;A7D70E;

+   STZ.W Phantoon.fadeCounter                                           ;A7D711;
    LDA.W #$0001                                                         ;A7D714;
    STA.W Phantoon.speed                                                 ;A7D717;
    STZ.W Phantoon.subSpeed                                              ;A7D71A;
    STZ.W Phantoon.flameRainTriggeredFlag                                ;A7D71D;
    JSR.W PickNewPhantoonPattern                                         ;A7D720;
    LDA.W #Function_Phantoon_HidingBeforeFigure8_FadingIn                ;A7D723;
    STA.W Phantoon.function,X                                            ;A7D726;
    STZ.W Phantoon.fadeCompleteFlag                                      ;A7D729;
    RTS                                                                  ;A7D72C;


;;; $D72D: Phantoon function - hiding before figure-8 - fading in ;;;
Function_Phantoon_HidingBeforeFigure8_FadingIn:
    LDA.W #$000C                                                         ;A7D72D;
    JSR.W AdvancePhantoonFadeIn_DenominatorInA                           ;A7D730;
    LDA.W Phantoon.fadeCompleteFlag                                      ;A7D733;
    BEQ .return                                                          ;A7D736;
    LDA.W #Function_Phantoon_Figure8_Moving                              ;A7D738;
    STA.W Phantoon.function                                              ;A7D73B;

  .return:
    RTS                                                                  ;A7D73E;


;;; $D73F: Phantoon function - flame rain - show Phantoon ;;;
Function_Phantoon_FlameRain_ShowPhantoon:
    STZ.W Phantoon.fadeCompleteFlag                                      ;A7D73F;
    LDA.W LayerBlending_PhantoonSemiTransparencyFlag                     ;A7D742;
    AND.W #$BFFF                                                         ;A7D745;
    STA.W LayerBlending_PhantoonSemiTransparencyFlag                     ;A7D748;
    LDA.W #$0001                                                         ;A7D74B;
    STA.W Enemy.instTimer                                                ;A7D74E;
    STA.W Enemy[1].instTimer                                             ;A7D751;
    LDA.W #InstList_Phantoon_Body_FullHitbox                             ;A7D754;
    STA.W Enemy.instList                                                 ;A7D757;
    LDA.W #InstList_Phantoon_Eyeball_Centered                            ;A7D75A;
    STA.W Enemy[1].instList                                              ;A7D75D;
    LDA.W #Function_Phantoon_FlameRain_MakePhantoonVulnerable            ;A7D760;
    STA.W Phantoon.function,X                                            ;A7D763;
    RTS                                                                  ;A7D766;


;;; $D767: Phantoon function - flame rain - make Phantoon vulnerable ;;;
Function_Phantoon_FlameRain_MakePhantoonVulnerable:
    LDA.W #$0001                                                         ;A7D767;
    JSR.W AdvancePhantoonFadeIn_DenominatorInA                           ;A7D76A;
    LDA.W Phantoon.fadeCompleteFlag                                      ;A7D76D;
    BEQ .waiting                                                         ;A7D770;
    LDA.W Enemy.properties                                               ;A7D772;
    AND.W #$FBFF                                                         ;A7D775;
    STA.W Enemy.properties                                               ;A7D778;
    LDA.W #Function_Phantoon_FlameRain_VulnerableWindow                  ;A7D77B;
    STA.W Phantoon.function,X                                            ;A7D77E;
    LDA.W #$005A                                                         ;A7D781;
    STA.W Phantoon.functionTimer                                         ;A7D784;

  .waiting:
    RTS                                                                  ;A7D787;


;;; $D788: Phantoon function - flame rain - vulnerable window ;;;
Function_Phantoon_FlameRain_VulnerableWindow:
    DEC.W Phantoon.functionTimer,X                                       ;A7D788;
    BEQ .timerExpired                                                    ;A7D78B;
    BPL .return                                                          ;A7D78D;

  .timerExpired:
    STZ.W Phantoon.roundDamage,X                                         ;A7D78F;
    LDA.W Phantoon.swoopingTriggeredFlag                                 ;A7D792;
    BEQ .endVulnerableWindow                                             ;A7D795;
    STZ.W Phantoon.swoopingTriggeredFlag                                 ;A7D797;
    LDA.W #$0001                                                         ;A7D79A;
    STA.W Phantoon.flameRainTriggeredFlag                                ;A7D79D;
    JSR.W StartPhantoonSwoopingPattern                                   ;A7D7A0;
    RTS                                                                  ;A7D7A3;

  .endVulnerableWindow:
    LDA.W #Function_Phantoon_FlameRain_FadingOut                         ;A7D7A4;
    STA.W Phantoon.function,X                                            ;A7D7A7;
    STZ.W Phantoon.fadeCompleteFlag                                      ;A7D7AA;
    LDA.W #$0001                                                         ;A7D7AD;
    STA.W Enemy.instTimer                                                ;A7D7B0;
    STA.W Enemy[1].instTimer                                             ;A7D7B3;
    LDA.W #InstList_Phantoon_Body_Invulnerable                           ;A7D7B6;
    STA.W Enemy.instList                                                 ;A7D7B9;
    LDA.W #InstList_Phantoon_Eye_Close                                   ;A7D7BC;
    STA.W Enemy[1].instList                                              ;A7D7BF;
    LDA.W Enemy.properties                                               ;A7D7C2;
    ORA.W #$0400                                                         ;A7D7C5;
    STA.W Enemy.properties                                               ;A7D7C8;
    LDA.W LayerBlending_PhantoonSemiTransparencyFlag                     ;A7D7CB;
    ORA.W #$4000                                                         ;A7D7CE;
    STA.W LayerBlending_PhantoonSemiTransparencyFlag                     ;A7D7D1;

  .return:
    RTS                                                                  ;A7D7D4;


;;; $D7D5: Phantoon function - flame rain - fading out ;;;
Function_Phantoon_FlameRain_FadingOut:
    LDA.W #$000C                                                         ;A7D7D5;
    JSR.W AdvancePhantoonFadeOut_DenominatorInA                          ;A7D7D8;
    LDA.W Phantoon.fadeCompleteFlag                                      ;A7D7DB;
    BNE .fadeComplete                                                    ;A7D7DE;
    RTS                                                                  ;A7D7E0;

  .fadeComplete:
    LDA.W #Function_Phantoon_FlameRain_SubsequentFlameRain               ;A7D7E1;
    STA.W Phantoon.function,X                                            ;A7D7E4;
    JSL.L GenerateRandomNumber                                           ;A7D7E7;
    AND.W #$0007                                                         ;A7D7EB;
    ASL                                                                  ;A7D7EE;
    TAY                                                                  ;A7D7EF;
    LDA.W Phantoon_FlameRain_HidingTimers,Y                              ;A7D7F0;
    STA.W Phantoon.functionTimer,X                                       ;A7D7F3;
    RTS                                                                  ;A7D7F6;


;;; $D7F7: Phantoon function - flame rain - subsequent flame rain ;;;
Function_Phantoon_FlameRain_SubsequentFlameRain:
    DEC.W Phantoon.functionTimer,X                                       ;A7D7F7;
    BEQ .timerExpired                                                    ;A7D7FA;
    BPL .return                                                          ;A7D7FC;

  .timerExpired:
    JSL.L GenerateRandomNumber                                           ;A7D7FE;
    AND.W #$0007                                                         ;A7D802;
    PHA                                                                  ;A7D805;
    ASL                                                                  ;A7D806;
    ASL                                                                  ;A7D807;
    ASL                                                                  ;A7D808;
    TAY                                                                  ;A7D809;
    LDA.W Phantoon_FlameRain_PositionTable_index,Y                       ;A7D80A;
    STA.W Phantoon.movementIndex                                         ;A7D80D;
    LDA.W Phantoon_FlameRain_PositionTable_XPosition,Y                   ;A7D810;
    STA.W Enemy.XPosition                                                ;A7D813;
    LDA.W Phantoon_FlameRain_PositionTable_YPosition,Y                   ;A7D816;
    STA.W Enemy.YPosition                                                ;A7D819;
    STZ.W Phantoon.fadeCounter                                           ;A7D81C;
    LDA.W #Function_Phantoon_FlameRain_ShowPhantoon                      ;A7D81F;
    STA.W Phantoon.function,X                                            ;A7D822;
    PLA                                                                  ;A7D825;
    JSR.W SpawnFlameRainProjectiles                                      ;A7D826;

  .return:
    RTS                                                                  ;A7D829;


;;; $D82A: Phantoon function - flame rain - initial flame rain ;;;
Function_Phantoon_FlameRain_InitialFlameRain:
    LDA.W #$000C                                                         ;A7D82A;
    JSR.W AdvancePhantoonFadeOut_DenominatorInA                          ;A7D82D;
    JSR.W AdjustSpeedAndMovePhantoonInFigure8                            ;A7D830;
    JSR.W HandleCasualFlames                                             ;A7D833;
    DEC.W Enemy[1].var0                                                  ;A7D836;
    BEQ .timerExpired                                                    ;A7D839;
    BPL .return                                                          ;A7D83B;

  .timerExpired:
    STZ.W Phantoon.swoopingTriggeredFlag                                 ;A7D83D;
    LDA.W #Function_Phantoon_FlameRain_ShowPhantoon                      ;A7D840;
    STA.W Phantoon.function,X                                            ;A7D843;
    LDA.W Enemy.XPosition                                                ;A7D846;
    CMP.W #$0080                                                         ;A7D849;
    BMI .pattern0                                                        ;A7D84C;
    LDA.W #$0002                                                         ;A7D84E;
    JSR.W SpawnFlameRainProjectiles                                      ;A7D851;
    RTS                                                                  ;A7D854;

  .pattern0:
    LDA.W #$0000                                                         ;A7D855;
    JSR.W SpawnFlameRainProjectiles                                      ;A7D858;

  .return:
    RTS                                                                  ;A7D85B;


;;; $D85C: Phantoon function - enraged - fading out before rage ;;;
Function_Phantoon_Enraged_FadingOutBeforeRage:
    LDA.W #$000C                                                         ;A7D85C;
    JSR.W AdvancePhantoonFadeOut_DenominatorInA                          ;A7D85F;
    LDA.W Phantoon.fadeCompleteFlag                                      ;A7D862;
    BEQ .return                                                          ;A7D865;
    LDA.W #Function_Phantoon_Enraged_Hiding                              ;A7D867;
    STA.W Phantoon.function,X                                            ;A7D86A;
    LDA.W #$0078                                                         ;A7D86D;
    STA.W Phantoon.functionTimer,X                                       ;A7D870;

  .return:
    RTS                                                                  ;A7D873;


;;; $D874: Phantoon function - enraged - hiding ;;;
Function_Phantoon_Enraged_Hiding:
    DEC.W Phantoon.functionTimer,X                                       ;A7D874;
    BEQ .timerExpired                                                    ;A7D877;
    BPL .return                                                          ;A7D879;

  .timerExpired:
    LDA.W #Function_Phantoon_Enraged_FadingIn                            ;A7D87B;
    STA.W Phantoon.function,X                                            ;A7D87E;
    LDA.W #$0080                                                         ;A7D881;
    STA.W Enemy.XPosition                                                ;A7D884;
    LDA.W #$0020                                                         ;A7D887;
    STA.W Enemy.YPosition                                                ;A7D88A;
    STZ.W Phantoon.fadeCompleteFlag                                      ;A7D88D;

  .return:
    RTS                                                                  ;A7D890;


;;; $D891: Phantoon function - enraged - fading in ;;;
Function_Phantoon_Enraged_FadingIn:
    LDA.W #$000C                                                         ;A7D891;
    JSR.W AdvancePhantoonFadeIn_DenominatorInA                           ;A7D894;
    LDA.W Phantoon.fadeCompleteFlag                                      ;A7D897;
    BEQ .return                                                          ;A7D89A;
    LDA.W #Function_Phantoon_Enraged_Rage                                ;A7D89C;
    STA.W Phantoon.function                                              ;A7D89F;
    LDA.W #$0004                                                         ;A7D8A2;
    STA.W Phantoon.functionTimer,X                                       ;A7D8A5;
    STZ.W Phantoon.fadeCompleteFlag                                      ;A7D8A8;

  .return:
    RTS                                                                  ;A7D8AB;


;;; $D8AC: Phantoon function - enraged - rage ;;;
Function_Phantoon_Enraged_Rage:
    DEC.W Phantoon.functionTimer,X                                       ;A7D8AC;
    BEQ .timerExpired                                                    ;A7D8AF;
    BPL .return                                                          ;A7D8B1;

  .timerExpired:
    LDA.W Phantoon.rageRoundCounter                                      ;A7D8B3;
    BIT.W #$0001                                                         ;A7D8B6;
    BNE .oddWave                                                         ;A7D8B9;
    LDY.W #$0006                                                         ;A7D8BB;

  .loopEvenWave:
    PHY                                                                  ;A7D8BE;
    TYA                                                                  ;A7D8BF;
    ORA.W #$0200                                                         ;A7D8C0;
    LDY.W #EnemyProjectile_PhantoonDestroyableFlames                     ;A7D8C3;
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics                     ;A7D8C6;
    PLY                                                                  ;A7D8CA;
    DEY                                                                  ;A7D8CB;
    BPL .loopEvenWave                                                    ;A7D8CC;
    BRA .merge                                                           ;A7D8CE;

  .oddWave:
    LDY.W #$000F                                                         ;A7D8D0;

  .loopOddWave:
    PHY                                                                  ;A7D8D3;
    TYA                                                                  ;A7D8D4;
    ORA.W #$0200                                                         ;A7D8D5;
    LDY.W #EnemyProjectile_PhantoonDestroyableFlames                     ;A7D8D8;
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics                     ;A7D8DB;
    PLY                                                                  ;A7D8DF;
    DEY                                                                  ;A7D8E0;
    CPY.W #$0008                                                         ;A7D8E1;
    BPL .loopOddWave                                                     ;A7D8E4;

  .merge:
    LDA.W #$0029                                                         ;A7D8E6;
    JSL.L QueueSound_Lib3_Max6                                           ;A7D8E9;
    LDA.W Phantoon.rageRoundCounter                                      ;A7D8ED;
    INC                                                                  ;A7D8F0;
    STA.W Phantoon.rageRoundCounter                                      ;A7D8F1;
    CMP.W #$0008                                                         ;A7D8F4;
    BPL .doneRaging                                                      ;A7D8F7;
    LDA.W #$0080                                                         ;A7D8F9;
    STA.W Phantoon.functionTimer,X                                       ;A7D8FC;
    RTS                                                                  ;A7D8FF;

  .doneRaging:
    LDA.W #$0001                                                         ;A7D900;
    STA.W Enemy[1].instTimer                                             ;A7D903;
    LDA.W #InstList_Phantoon_Eye_Close                                   ;A7D906;
    STA.W Enemy[1].instList                                              ;A7D909;
    STZ.W Phantoon.fadeCompleteFlag                                      ;A7D90C;
    LDA.W #Function_Phantoon_Enraged_FadingOutAfterRage                  ;A7D90F;
    STA.W Phantoon.function,X                                            ;A7D912;

  .return:
    RTS                                                                  ;A7D915;


;;; $D916: Phantoon function - enraged - fading out after rage ;;;
Function_Phantoon_Enraged_FadingOutAfterRage:
    LDA.W #$000C                                                         ;A7D916;
    JSR.W AdvancePhantoonFadeOut_DenominatorInA                          ;A7D919;
    LDA.W Phantoon.fadeCompleteFlag                                      ;A7D91C;
    BEQ .return                                                          ;A7D91F;
    LDA.W #Function_Phantoon_HidingBeforeFigure8_Hiding                  ;A7D921;
    STA.W Phantoon.function,X                                            ;A7D924;
    LDA.W #$0078                                                         ;A7D927;
    STA.W Phantoon.functionTimer,X                                       ;A7D92A;

  .return:
    RTS                                                                  ;A7D92D;


;;; $D92E: Phantoon function - swooping - fatal damage ;;;
Function_Phantoon_Swooping_FatalDamage:
    JSR.W MakePhantoonLookTowardsSamus                                   ;A7D92E;
    JSR.W MovePhantoonInSwoopingPattern                                  ;A7D931;
    LDA.W Enemy.XPosition                                                ;A7D934;
    CMP.W #$0060                                                         ;A7D937;
    BMI .return                                                          ;A7D93A;
    CMP.W #$00A0                                                         ;A7D93C;
    BPL .return                                                          ;A7D93F;
    LDA.W #Function_Phantoon_DeathSequence_FadingInAndOut                ;A7D941;
    STA.W Phantoon.function,X                                            ;A7D944;

  .return:
    RTS                                                                  ;A7D947;


;;; $D948: Phantoon function - death sequence - fading in and out ;;;
Function_Phantoon_DeathSequence_FadingInAndOut:
    NOP                                                                  ;A7D948;
    LDA.W Phantoon.fadeCounter                                           ;A7D949;
    BIT.W #$0001                                                         ;A7D94C;
    BNE .advanceFade                                                     ;A7D94F;
    LDA.W #$000C                                                         ;A7D951;
    JSR.W AdvancePhantoonFadeOut_DenominatorInA                          ;A7D954;
    LDA.W Phantoon.fadeCompleteFlag                                      ;A7D957;
    BNE .fadeComplete                                                    ;A7D95A;
    BRA .return                                                          ;A7D95C;

  .advanceFade:
    LDA.W #$000C                                                         ;A7D95E;
    JSR.W AdvancePhantoonFadeIn_DenominatorInA                           ;A7D961;
    LDA.W Phantoon.fadeCompleteFlag                                      ;A7D964;
    BEQ .return                                                          ;A7D967;

  .fadeComplete:
    STZ.W Phantoon.fadeCompleteFlag                                      ;A7D969;
    LDA.W Phantoon.fadeCounter                                           ;A7D96C;
    INC                                                                  ;A7D96F;
    STA.W Phantoon.fadeCounter                                           ;A7D970;
    CMP.W #$000A                                                         ;A7D973;
    BMI .return                                                          ;A7D976;
    LDA.W #Function_Phantoon_DeathSequence_Exploding                     ;A7D978;
    STA.W Phantoon.function,X                                            ;A7D97B;
    LDA.W #$000F                                                         ;A7D97E;
    STA.W Phantoon.functionTimer,X                                       ;A7D981;
    STZ.W Phantoon.explosionIndex                                        ;A7D984;
    STZ.W Phantoon.explosionLoopCounter                                  ;A7D987;

  .return:
    RTS                                                                  ;A7D98A;


;;; $D98B: Phantoon function - death sequence - exploding ;;;
Function_Phantoon_DeathSequence_Exploding:
    DEC.W Phantoon.functionTimer,X                                       ;A7D98B;
    BEQ .timerExpired                                                    ;A7D98E;
    BMI .timerExpired                                                    ;A7D990;
    RTS                                                                  ;A7D992;

  .timerExpired:
    LDA.W Phantoon.explosionIndex                                        ;A7D993;
    ASL                                                                  ;A7D996;
    ASL                                                                  ;A7D997;
    TAY                                                                  ;A7D998;
    LDA.W .XOffset,Y                                                     ;A7D999;
    AND.W #$00FF                                                         ;A7D99C;
    BIT.W #$0080                                                         ;A7D99F;
    BEQ +                                                                ;A7D9A2;
    ORA.W #$FF00                                                         ;A7D9A4;

+   STA.B DP_Temp12                                                      ;A7D9A7;
    LDA.W Enemy.XPosition                                                ;A7D9A9;
    CLC                                                                  ;A7D9AC;
    ADC.B DP_Temp12                                                      ;A7D9AD;
    STA.B DP_Temp12                                                      ;A7D9AF;
    LDA.W .YOffset,Y                                                     ;A7D9B1;
    AND.W #$00FF                                                         ;A7D9B4;
    BIT.W #$0080                                                         ;A7D9B7;
    BEQ +                                                                ;A7D9BA;
    ORA.W #$FF00                                                         ;A7D9BC;

+   STA.B DP_Temp14                                                      ;A7D9BF;
    LDA.W Enemy.YPosition                                                ;A7D9C1;
    CLC                                                                  ;A7D9C4;
    ADC.B DP_Temp14                                                      ;A7D9C5;
    STA.B DP_Temp14                                                      ;A7D9C7;
    PHY                                                                  ;A7D9C9;
    LDA.W .explosionType,Y                                               ;A7D9CA;
    AND.W #$00FF                                                         ;A7D9CD;
    PHA                                                                  ;A7D9D0;
    LDY.W #EnemyProjectile_MiscDust                                      ;A7D9D1;
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics                  ;A7D9D4;
    PLA                                                                  ;A7D9D8;
    CMP.W #$001D                                                         ;A7D9D9;
    BNE .PhantoonExplosion                                               ;A7D9DC;
    LDA.W #$0024                                                         ;A7D9DE;
    JSL.L QueueSound_Lib2_Max6                                           ;A7D9E1;
    BRA +                                                                ;A7D9E5;

  .PhantoonExplosion:
    LDA.W #$002B                                                         ;A7D9E7;
    JSL.L QueueSound_Lib2_Max6                                           ;A7D9EA;

+   PLY                                                                  ;A7D9EE;
    LDA.W .timer,Y                                                       ;A7D9EF;
    AND.W #$00FF                                                         ;A7D9F2;
    STA.W Phantoon.functionTimer,X                                       ;A7D9F5;
    LDA.W Phantoon.explosionIndex                                        ;A7D9F8;
    INC                                                                  ;A7D9FB;
    STA.W Phantoon.explosionIndex                                        ;A7D9FC;
    CMP.W #$000D                                                         ;A7D9FF;
    BMI .return                                                          ;A7DA02;
    LDA.W #$0005                                                         ;A7DA04;
    STA.W Phantoon.explosionIndex                                        ;A7DA07;
    LDA.W Phantoon.explosionLoopCounter                                  ;A7DA0A;
    INC                                                                  ;A7DA0D;
    STA.W Phantoon.explosionLoopCounter                                  ;A7DA0E;
    CMP.W #$0003                                                         ;A7DA11;
    BMI .return                                                          ;A7DA14;
    LDA.W #Function_Phantoon_DeathSequence_SetupWavyMosaicPhantoon       ;A7DA16;
    STA.W Phantoon.function,X                                            ;A7DA19;

  .return:
    RTS                                                                  ;A7DA1C;

;        _______________ X offset
;       |    ___________ Y offset
;       |   |    _______ Explosion type. 3 = small, 1Dh = big
;       |   |   |    ___ Timer
;       |   |   |   |
  .XOffset:
    db $00                                                               ;A7DA1D;
  .YOffset:
    db     $00                                                           ;A7DA1E;
  .explosionType:
    db         $1D                                                       ;A7DA1F;
  .timer:                                                                ;A7DA20;
    db             $10 ;\
    db $20,$E0,$1D,$10 ;|
    db $E0,$20,$1D,$10 ;} Once
    db $E0,$E0,$1D,$10 ;|
    db $20,$20,$1D,$20 ;/
    db $E0,$F8,$1D,$08 ;\
    db $00,$00,$03,$08 ;|
    db $20,$F8,$1D,$08 ;|
    db $00,$00,$03,$08 ;|
    db $00,$18,$03,$08 ;} 3 times
    db $00,$30,$1D,$08 ;|
    db $E8,$18,$03,$08 ;|
    db $18,$18,$03,$08 ;/


;;; $DA51: Phantoon function - death sequence - set up wavy mosaic Phantoon ;;;
Function_Phantoon_DeathSequence_SetupWavyMosaicPhantoon:
    LDA.W WavyPhantoonConstants_phaseDelta                               ;A7DA51;
    STA.B DP_Temp16                                                      ;A7DA54;
    LDA.W #$0001                                                         ;A7DA56;
    JSL.L Spawn_WavyPhantoon_HDMAObject                                  ;A7DA59;
    STZ.W Phantoon.wavyPhantoonPhaseAmplitude                            ;A7DA5D;
    LDA.W #Function_Phantoon_DeathSequence_WavyMosaicPhantoon            ;A7DA60;
    STA.W Phantoon.function,X                                            ;A7DA63;
    LDA.W #$0002                                                         ;A7DA66;
    STA.W Phantoon.mosaicOptions                                         ;A7DA69;
    LDA.W Enemy.properties                                               ;A7DA6C;
    AND.W #$DFFF                                                         ;A7DA6F;
    ORA.W #$0500                                                         ;A7DA72;
    STA.W Enemy[1].properties                                            ;A7DA75;
    STA.W Enemy[2].properties                                            ;A7DA78;
    STA.W Enemy[3].properties                                            ;A7DA7B;
    LDA.W #$007E                                                         ;A7DA7E;
    JSL.L QueueSound_Lib2_Max6                                           ;A7DA81;
    RTS                                                                  ;A7DA85;


;;; $DA86: Phantoon function - death sequence - wavy mosaic Phantoon ;;;
Function_Phantoon_DeathSequence_WavyMosaicPhantoon:
    LDA.W WavyPhantoonConstants_Dying_amplitudeDelta                     ;A7DA86;
    STA.B DP_Temp12                                                      ;A7DA89;
    LDA.W WavyPhantoonConstants_Dying_maxAmplitude                       ;A7DA8B;
    STA.B DP_Temp14                                                      ;A7DA8E;
    JSR.W GrowShrinkPhantoonWaveAmplitude                                ;A7DA90;
    LDA.W Phantoon.mosaicOptions                                         ;A7DA93;
    CMP.W #$FFFF                                                         ;A7DA96;
    BEQ .doneMosaic                                                      ;A7DA99;
    LDA.W NMI_FrameCounter                                               ;A7DA9B;
    BIT.W #$000F                                                         ;A7DA9E;
    BNE .return                                                          ;A7DAA1;
    SEP #$20                                                             ;A7DAA3;
    LDA.W Phantoon.mosaicOptions                                         ;A7DAA5;
    CMP.B #$F2                                                           ;A7DAA8;
    BEQ .mosaicF2                                                        ;A7DAAA;
    CLC                                                                  ;A7DAAC;
    ADC.B #$10                                                           ;A7DAAD;
    STA.W Phantoon.mosaicOptions                                         ;A7DAAF;
    STA.B DP_Mosaic                                                      ;A7DAB2;
    REP #$20                                                             ;A7DAB4;
    BRA .return                                                          ;A7DAB6;

  .mosaicF2:
    REP #$20                                                             ;A7DAB8;
    LDA.W #$FFFF                                                         ;A7DABA;
    STA.W Phantoon.mosaicOptions                                         ;A7DABD;
    STZ.W Phantoon.fadeCompleteFlag                                      ;A7DAC0;
    BRA .return                                                          ;A7DAC3;

  .doneMosaic:
    LDA.W #$000C                                                         ;A7DAC5;
    JSR.W AdvancePhantoonFadeOut_DenominatorInA                          ;A7DAC8;
    LDA.W Phantoon.fadeCompleteFlag                                      ;A7DACB;
    BEQ .return                                                          ;A7DACE;
    LDA.W #Function_Phantoon_DeathSequence_ClearGraphics                 ;A7DAD0;
    STA.W Phantoon.function,X                                            ;A7DAD3;

  .return:
    RTS                                                                  ;A7DAD6;


;;; $DAD7: Phantoon function - death sequence - clear graphics ;;;
Function_Phantoon_DeathSequence_ClearGraphics:
    SEP #$20                                                             ;A7DAD7;
    STZ.B DP_Mosaic                                                      ;A7DAD9;
    REP #$20                                                             ;A7DADB;
    STZ.W Phantoon.wavyPhantoonMode                                      ;A7DADD;
    LDA.W LayerBlending_PhantoonSemiTransparencyFlag                     ;A7DAE0;
    AND.W #$BFFF                                                         ;A7DAE3;
    STA.W LayerBlending_PhantoonSemiTransparencyFlag                     ;A7DAE6;
    LDA.W #$FFFF                                                         ;A7DAE9;
    STA.W Phantoon.semiTransparencyHDMAObjectControl                     ;A7DAEC;
    LDA.W #Function_Phantoon_DeathSequence_ActivateWreckedShip           ;A7DAEF;
    STA.W Phantoon.function,X                                            ;A7DAF2;
    LDA.W #$003C                                                         ;A7DAF5;
    STA.W Phantoon.functionTimer,X                                       ;A7DAF8;
    STZ.W Phantoon.fadeCompleteFlag                                      ;A7DAFB;
    LDA.W #$0180                                                         ;A7DAFE;
    STA.W Enemy.XPosition                                                ;A7DB01;
    LDA.W #$0080                                                         ;A7DB04;
    STA.W Enemy.YPosition                                                ;A7DB07;
    LDX.W #$03FE                                                         ;A7DB0A;
    LDA.W #$0338                                                         ;A7DB0D;

  .loop:
    STA.L EnemyBG2Tilemap,X                                              ;A7DB10;
    DEX                                                                  ;A7DB14;
    DEX                                                                  ;A7DB15;
    BPL .loop                                                            ;A7DB16;
    LDX.W VRAMWriteStack                                                 ;A7DB18;
    LDA.W #$0400                                                         ;A7DB1B;
    STA.B VRAMWrite.size,X                                               ;A7DB1E;
    INX                                                                  ;A7DB20;
    INX                                                                  ;A7DB21;
    LDA.W #EnemyBG2Tilemap                                               ;A7DB22;
    STA.B VRAMWrite.size,X                                               ;A7DB25;
    INX                                                                  ;A7DB27;
    INX                                                                  ;A7DB28;
    SEP #$20                                                             ;A7DB29;
    LDA.B #EnemyBG2Tilemap>>16                                           ;A7DB2B;
    STA.B VRAMWrite.size,X                                               ;A7DB2D;
    REP #$20                                                             ;A7DB2F;
    INX                                                                  ;A7DB31;
    LDA.W #$4800                                                         ;A7DB32;
    STA.B VRAMWrite.size,X                                               ;A7DB35;
    INX                                                                  ;A7DB37;
    INX                                                                  ;A7DB38;
    STX.W VRAMWriteStack                                                 ;A7DB39;
    RTS                                                                  ;A7DB3C;


;;; $DB3D: Phantoon function - death sequence - activate Wrecked Ship ;;;
Function_Phantoon_DeathSequence_ActivateWreckedShip:
    PHX                                                                  ;A7DB3D;
    LDA.W Phantoon.functionTimer,X                                       ;A7DB3E;
    BEQ .timerExpired                                                    ;A7DB41;
    DEC.W Phantoon.functionTimer,X                                       ;A7DB43;
    PLX                                                                  ;A7DB46;
    RTS                                                                  ;A7DB47;

  .timerExpired:
    LDA.W NMI_FrameCounter                                               ;A7DB48;
    BIT.W #$0003                                                         ;A7DB4B;
    BNE .return                                                          ;A7DB4E;
    LDA.W #$000C                                                         ;A7DB50;
    STA.W Phantoon.paletteChangeDenominator                              ;A7DB53;
    JSR.W AdvanceWreckedShipPowerOnPaletteTransition                     ;A7DB56;
    BCC .return                                                          ;A7DB59;
    SEP #$20                                                             ;A7DB5B;
    LDA.B DP_MainScreenLayers                                            ;A7DB5D;
    ORA.B #$02                                                           ;A7DB5F;
    STA.B DP_MainScreenLayers                                            ;A7DB61;
    REP #$20                                                             ;A7DB63;
    JSL.L PhantoonDeathItemDropRoutine                                   ;A7DB65;
    LDA.W Enemy.properties                                               ;A7DB69;
    ORA.W #$0200                                                         ;A7DB6C;
    STA.W Enemy.properties                                               ;A7DB6F;
    STA.W Enemy[1].properties                                            ;A7DB72;
    STA.W Enemy[2].properties                                            ;A7DB75;
    STA.W Enemy[3].properties                                            ;A7DB78;
    LDX.W AreaIndex                                                      ;A7DB7B;
    LDA.L SRAMMirror_Boss,X                                              ;A7DB7E;
    ORA.W #$0001                                                         ;A7DB82;
    STA.L SRAMMirror_Boss,X                                              ;A7DB85;
    JSL.L Spawn_Hardcoded_PLM                                            ;A7DB89;
    db $00,$06                                                           ;A7DB8D;
    dw PLMEntries_restorePhantoonsDoorDuringBossFight                    ;A7DB8F;
    LDA.W #$0003                                                         ;A7DB91;
    JSL.L QueueMusicDataOrTrack_8FrameDelay                              ;A7DB94;

  .return:
    PLX                                                                  ;A7DB98;
    RTS                                                                  ;A7DB99;


;;; $DB9A: Advance Phantoon fade out ;;;
AdvancePhantoonFadeOut:
;; Returns:
;;     Carry: Set if reached target colour, clear otherwise
    REP #$30                                                             ;A7DB9A;
    LDA.W Phantoon.paletteChangeDenominator                              ;A7DB9C;
    INC                                                                  ;A7DB9F;
    CMP.W Phantoon.paletteChangeNumerator                                ;A7DBA0;
    BCS .advance                                                         ;A7DBA3;
    LDA.W #$0000                                                         ;A7DBA5;
    STA.W Phantoon.paletteChangeNumerator                                ;A7DBA8;
    SEC                                                                  ;A7DBAB;
    RTS                                                                  ;A7DBAC;

  .advance:
    LDX.W #$0000                                                         ;A7DBAD;

  .loop:
    PHX                                                                  ;A7DBB0;
    LDA.W Palette_Phantoon_FadeOutTarget,X                               ;A7DBB1;
    TAY                                                                  ;A7DBB4;
    LDA.L Palettes_BG12P7,X                                              ;A7DBB5;
    TAX                                                                  ;A7DBB9;
    LDA.W Phantoon.paletteChangeNumerator                                ;A7DBBA;
    JSR.W CalculateAthTransitionalColorFromXToY                          ;A7DBBD;
    PLX                                                                  ;A7DBC0;
    STA.L Palettes_BG12P7,X                                              ;A7DBC1;
    INX                                                                  ;A7DBC5;
    INX                                                                  ;A7DBC6;
    CPX.W #$0020                                                         ;A7DBC7;
    BCC .loop                                                            ;A7DBCA;
    LDA.W Phantoon.paletteChangeNumerator                                ;A7DBCC;
    INC                                                                  ;A7DBCF;
    STA.W Phantoon.paletteChangeNumerator                                ;A7DBD0;
    CLC                                                                  ;A7DBD3;
    RTS                                                                  ;A7DBD4;


;;; $DBD5: Advance Phantoon fade in ;;;
AdvancePhantoonFadeIn:
;; Returns:
;;     Carry: Set if reached target colour, clear otherwise
    REP #$30                                                             ;A7DBD5;
    LDA.W Phantoon.paletteChangeDenominator                              ;A7DBD7;
    INC                                                                  ;A7DBDA;
    CMP.W Phantoon.paletteChangeNumerator                                ;A7DBDB;
    BCS .advance                                                         ;A7DBDE;
    LDA.W #$0000                                                         ;A7DBE0;
    STA.W Phantoon.paletteChangeNumerator                                ;A7DBE3;
    SEC                                                                  ;A7DBE6;
    RTS                                                                  ;A7DBE7;

  .advance:
    LDX.W #$0000                                                         ;A7DBE8;

  .loop:
    PHX                                                                  ;A7DBEB;
    JSR.W GetPhantoonHealthBasedPaletteColor                             ;A7DBEC;
    LDA.L Palettes_BG12P7,X                                              ;A7DBEF;
    TAX                                                                  ;A7DBF3;
    LDA.W Phantoon.paletteChangeNumerator                                ;A7DBF4;
    JSR.W CalculateAthTransitionalColorFromXToY                          ;A7DBF7;
    PLX                                                                  ;A7DBFA;
    STA.L Palettes_BG12P7,X                                              ;A7DBFB;
    INX                                                                  ;A7DBFF;
    INX                                                                  ;A7DC00;
    CPX.W #$0020                                                         ;A7DC01;
    BCC .loop                                                            ;A7DC04;
    LDA.W Phantoon.paletteChangeNumerator                                ;A7DC06;
    INC                                                                  ;A7DC09;
    STA.W Phantoon.paletteChangeNumerator                                ;A7DC0A;
    CLC                                                                  ;A7DC0D;
    RTS                                                                  ;A7DC0E;


;;; $DC0F: Get Phantoon health-based palette colour [X] / 2 ;;;
GetPhantoonHealthBasedPaletteColor:
;; Returns:
;;     Y: [Palette_Phantoon_HealthBased_0 + clamp(([enemy health] - 1) / 312, 0, 7) * 20h + [X]]
    STX.B DP_Temp18                                                      ;A7DC0F;
    LDX.W EnemyIndex                                                     ;A7DC11;
    LDA.W #$09C4                                                         ;A7DC14;
    LSR                                                                  ;A7DC17; >.<
    LSR                                                                  ;A7DC18;
    LSR                                                                  ;A7DC19;
    STA.B DP_Temp12                                                      ;A7DC1A;
    STA.B DP_Temp14                                                      ;A7DC1C;
    STZ.B DP_Temp16                                                      ;A7DC1E;

  .loop:
    LDA.B DP_Temp14                                                      ;A7DC20;
    CMP.W Enemy.health,X                                                 ;A7DC22;
    BPL .getPointer                                                      ;A7DC25;
    LDA.B DP_Temp14                                                      ;A7DC27;
    CLC                                                                  ;A7DC29;
    ADC.B DP_Temp12                                                      ;A7DC2A;
    STA.B DP_Temp14                                                      ;A7DC2C;
    LDA.B DP_Temp16                                                      ;A7DC2E;
    INC                                                                  ;A7DC30;
    STA.B DP_Temp16                                                      ;A7DC31;
    CMP.W #$0007                                                         ;A7DC33;
    BMI .loop                                                            ;A7DC36;

  .getPointer:
    LDA.B DP_Temp16                                                      ;A7DC38;
    ASL                                                                  ;A7DC3A;
    TAY                                                                  ;A7DC3B;
    LDA.W .palettePointers,Y                                             ;A7DC3C;
    CLC                                                                  ;A7DC3F;
    ADC.B DP_Temp18                                                      ;A7DC40;
    TAY                                                                  ;A7DC42;
    LDA.W $0000,Y                                                        ;A7DC43;
    TAY                                                                  ;A7DC46;
    LDX.B DP_Temp18                                                      ;A7DC47;
    RTS                                                                  ;A7DC49;

  .palettePointers:
    dw Palette_Phantoon_HealthBased_0                                    ;A7DC4A;
    dw Palette_Phantoon_HealthBased_1                                    ;A7DC4C;
    dw Palette_Phantoon_HealthBased_2                                    ;A7DC4E;
    dw Palette_Phantoon_HealthBased_3                                    ;A7DC50;
    dw Palette_Phantoon_HealthBased_4                                    ;A7DC52;
    dw Palette_Phantoon_HealthBased_5                                    ;A7DC54;
    dw Palette_Phantoon_HealthBased_6                                    ;A7DC56;
    dw Palette_Phantoon_HealthBased_7                                    ;A7DC58;


;;; $DC5A: Advance Wrecked Ship power on palette transition ;;;
AdvanceWreckedShipPowerOnPaletteTransition:
;; Returns:
;;     Carry: Set if reached target colour, clear otherwise
    REP #$30                                                             ;A7DC5A;
    LDA.W Phantoon.paletteChangeDenominator                              ;A7DC5C;
    INC                                                                  ;A7DC5F;
    CMP.W Phantoon.paletteChangeNumerator                                ;A7DC60;
    BCS .advance                                                         ;A7DC63;
    LDA.W #$0000                                                         ;A7DC65;
    STA.W Phantoon.paletteChangeNumerator                                ;A7DC68;
    SEC                                                                  ;A7DC6B;
    RTS                                                                  ;A7DC6C;

  .advance:
    LDX.W #$0000                                                         ;A7DC6D;

  .loop:
    PHX                                                                  ;A7DC70;
    LDA.W Palette_WreckedShipPoweredOn,X                                 ;A7DC71;
    TAY                                                                  ;A7DC74;
    LDA.L Palettes,X                                                     ;A7DC75;
    TAX                                                                  ;A7DC79;
    LDA.W Phantoon.paletteChangeNumerator                                ;A7DC7A;
    JSR.W CalculateAthTransitionalColorFromXToY                          ;A7DC7D;
    PLX                                                                  ;A7DC80;
    STA.L Palettes,X                                                     ;A7DC81;
    INX                                                                  ;A7DC85;
    INX                                                                  ;A7DC86;
    CPX.W #$00E0                                                         ;A7DC87;
    BCC .loop                                                            ;A7DC8A;
    LDA.W Phantoon.paletteChangeNumerator                                ;A7DC8C;
    INC                                                                  ;A7DC8F;
    STA.W Phantoon.paletteChangeNumerator                                ;A7DC90;
    CLC                                                                  ;A7DC93;
    RTS                                                                  ;A7DC94;


;;; $DC95: Calculate the [A]th transitional colour from [X] to [Y] ;;;
CalculateAthTransitionalColorFromXToY:
;; Returns:
;;     A: Result colour

; Same as $82:DAA6, except palette change denominator is Phantoon.paletteChangeDenominator instead of $C402
    PHA                                                                  ;A7DC95;
    PHA                                                                  ;A7DC96;
    PHX                                                                  ;A7DC97;
    PHY                                                                  ;A7DC98;
    LDA.B $01,S                                                          ;A7DC99;
    AND.W #$001F                                                         ;A7DC9B;
    TAY                                                                  ;A7DC9E;
    LDA.B $03,S                                                          ;A7DC9F;
    AND.W #$001F                                                         ;A7DCA1;
    TAX                                                                  ;A7DCA4;
    LDA.B $05,S                                                          ;A7DCA5;
    JSR.W CalculateTheAthTransitionalColorComponentFromXToY              ;A7DCA7;
    STA.B $07,S                                                          ;A7DCAA;
    LDA.B $01,S                                                          ;A7DCAC;
    ASL                                                                  ;A7DCAE;
    ASL                                                                  ;A7DCAF;
    ASL                                                                  ;A7DCB0;
    XBA                                                                  ;A7DCB1;
    AND.W #$001F                                                         ;A7DCB2;
    TAY                                                                  ;A7DCB5;
    LDA.B $03,S                                                          ;A7DCB6;
    ASL                                                                  ;A7DCB8;
    ASL                                                                  ;A7DCB9;
    ASL                                                                  ;A7DCBA;
    XBA                                                                  ;A7DCBB;
    AND.W #$001F                                                         ;A7DCBC;
    TAX                                                                  ;A7DCBF;
    LDA.B $05,S                                                          ;A7DCC0;
    JSR.W CalculateTheAthTransitionalColorComponentFromXToY              ;A7DCC2;
    ASL                                                                  ;A7DCC5;
    ASL                                                                  ;A7DCC6;
    ASL                                                                  ;A7DCC7;
    ASL                                                                  ;A7DCC8;
    ASL                                                                  ;A7DCC9;
    ORA.B $07,S                                                          ;A7DCCA;
    STA.B $07,S                                                          ;A7DCCC;
    LDA.B $01,S                                                          ;A7DCCE;
    LSR                                                                  ;A7DCD0;
    LSR                                                                  ;A7DCD1;
    XBA                                                                  ;A7DCD2;
    AND.W #$001F                                                         ;A7DCD3;
    TAY                                                                  ;A7DCD6;
    LDA.B $03,S                                                          ;A7DCD7;
    LSR                                                                  ;A7DCD9;
    LSR                                                                  ;A7DCDA;
    XBA                                                                  ;A7DCDB;
    AND.W #$001F                                                         ;A7DCDC;
    TAX                                                                  ;A7DCDF;
    LDA.B $05,S                                                          ;A7DCE0;
    JSR.W CalculateTheAthTransitionalColorComponentFromXToY              ;A7DCE2;
    ASL                                                                  ;A7DCE5;
    ASL                                                                  ;A7DCE6;
    XBA                                                                  ;A7DCE7;
    ORA.B $07,S                                                          ;A7DCE8;
    STA.B $07,S                                                          ;A7DCEA;
    PLY                                                                  ;A7DCEC;
    PLX                                                                  ;A7DCED;
    PLA                                                                  ;A7DCEE;
    PLA                                                                  ;A7DCEF;
    RTS                                                                  ;A7DCF0;


;;; $DCF1: Calculate the [A]th transitional colour component from [X] to [Y] ;;;
CalculateTheAthTransitionalColorComponentFromXToY:
;; Returns:
;;     If [A] = 0:
;;         A = [X]
;;     If [A] = [Phantoon palette change denominator] + 1:
;;         A = [Y]
;;     Otherwise:
;;         A = [X] + ([Y] - [X]) / ([Phantoon palette change denominator] + 1 - [A])

; Same as $82:DAA6, except palette change denominator is Phantoon.paletteChangeDenominator instead of $C402
    CMP.W #$0000                                                         ;A7DCF1;
    BNE .notZero                                                         ;A7DCF4;
    TXA                                                                  ;A7DCF6;
    RTS                                                                  ;A7DCF7;

  .notZero:
    DEC                                                                  ;A7DCF8;
    CMP.W Phantoon.paletteChangeDenominator                              ;A7DCF9;
    BNE +                                                                ;A7DCFC;
    TYA                                                                  ;A7DCFE;
    RTS                                                                  ;A7DCFF;

+   PHX                                                                  ;A7DD00;
    INC                                                                  ;A7DD01;
    STA.B DP_Temp14                                                      ;A7DD02;
    TYA                                                                  ;A7DD04;
    SEC                                                                  ;A7DD05;
    SBC.B $01,S                                                          ;A7DD06;
    STA.B DP_Temp12                                                      ;A7DD08;
    BPL +                                                                ;A7DD0A;
    EOR.W #$FFFF                                                         ;A7DD0C;
    INC                                                                  ;A7DD0F;

+   SEP #$21                                                             ;A7DD10;
    STZ.W $4204                                                          ;A7DD12;
    STA.W $4205                                                          ;A7DD15;
    LDA.W Phantoon.paletteChangeDenominator                              ;A7DD18;
    SBC.B DP_Temp14                                                      ;A7DD1B;
    INC                                                                  ;A7DD1D;
    STA.W $4206                                                          ;A7DD1E;
    REP #$20                                                             ;A7DD21;
    NOP                                                                  ;A7DD23;
    NOP                                                                  ;A7DD24;
    NOP                                                                  ;A7DD25;
    NOP                                                                  ;A7DD26;
    NOP                                                                  ;A7DD27;
    LDA.W $4214                                                          ;A7DD28;
    BIT.B DP_Temp12                                                      ;A7DD2B;
    BPL +                                                                ;A7DD2D;
    EOR.W #$FFFF                                                         ;A7DD2F;
    INC                                                                  ;A7DD32;

+   STA.B DP_Temp12                                                      ;A7DD33;
    PLA                                                                  ;A7DD35;
    XBA                                                                  ;A7DD36;
    CLC                                                                  ;A7DD37;
    ADC.B DP_Temp12                                                      ;A7DD38;
    XBA                                                                  ;A7DD3A;
    AND.W #$00FF                                                         ;A7DD3B;
    RTS                                                                  ;A7DD3E;


;;; $DD3F: Hurt AI - enemy $E4BF (Phantoon) ;;;
HurtAI_Phantoon:
    PHP                                                                  ;A7DD3F;
    REP #$30                                                             ;A7DD40;
    LDA.W Enemy.flashTimer                                               ;A7DD42;
    CMP.W #$0008                                                         ;A7DD45;
    BEQ .healthBased                                                     ;A7DD48;
    LDA.W Enemy.frameCounter                                             ;A7DD4A;
    BIT.W #$0002                                                         ;A7DD4D;
    BNE .white                                                           ;A7DD50;
    LDA.W Enemy[2].init1                                                 ;A7DD52;
    BIT.W #$FF00                                                         ;A7DD55;
    BEQ .return                                                          ;A7DD58;

  .healthBased:
    LDX.W #$001E                                                         ;A7DD5A;

  .loopPalette:
    JSR.W GetPhantoonHealthBasedPaletteColor                             ;A7DD5D;
    TYA                                                                  ;A7DD60;
    STA.L Palettes_BG12P7,X                                              ;A7DD61;
    DEX                                                                  ;A7DD65;
    DEX                                                                  ;A7DD66;
    BPL .loopPalette                                                     ;A7DD67;
    LDA.W Enemy[2].init1                                                 ;A7DD69;
    AND.W #$00FF                                                         ;A7DD6C;
    STA.W Enemy[2].init1                                                 ;A7DD6F;
    BRA .return                                                          ;A7DD72;

  .white:
    LDA.W Enemy[2].init1                                                 ;A7DD74;
    BIT.W #$FF00                                                         ;A7DD77;
    BNE .return                                                          ;A7DD7A;
    LDX.W #$001E                                                         ;A7DD7C;

  .loopWhite:
    LDA.W #$7FFF                                                         ;A7DD7F;
    STA.L Palettes_BG12P7,X                                              ;A7DD82;
    DEX                                                                  ;A7DD86;
    DEX                                                                  ;A7DD87;
    BPL .loopWhite                                                       ;A7DD88;
    LDA.W Enemy[2].init1                                                 ;A7DD8A;
    ORA.W #$0100                                                         ;A7DD8D;
    STA.W Enemy[2].init1                                                 ;A7DD90;

  .return:
    PLP                                                                  ;A7DD93;
    RTL                                                                  ;A7DD94;


;;; $DD95: Enemy touch - enemy $E4BF (Phantoon) ;;;
EnemyTouch_Phantoon:
    JSL.L NormalEnemyTouchAI_NoDeathCheck_External                       ;A7DD95;
    RTL                                                                  ;A7DD99;


;;; $DD9A: RTL. Power bomb reaction - enemy $E4BF (Phantoon) ;;;
RTL_A7DD9A:
    RTL                                                                  ;A7DD9A;


;;; $DD9B: Enemy shot - enemy $E4BF (Phantoon) ;;;
EnemyShot_Phantoon:
    PHB                                                                  ;A7DD9B;
    LDA.W Phantoon.function                                              ;A7DD9C;
    CMP.W #Function_Phantoon_DeathSequence_FadingInAndOut                ;A7DD9F;
    BMI .notDead                                                         ;A7DDA2;
    PLB                                                                  ;A7DDA4;
    RTL                                                                  ;A7DDA5;

  .notDead:
    LDX.W EnemyIndex                                                     ;A7DDA6;
    LDA.W Enemy.health,X                                                 ;A7DDA9;
    PHA                                                                  ;A7DDAC;
    JSL.L NormalEnemyShotAI_NoDeathCheck_NoEnemyShotGraphic_External     ;A7DDAD;
    PLA                                                                  ;A7DDB1;
    STA.B DP_Temp12                                                      ;A7DDB2;
    LDA.W Enemy.health,X                                                 ;A7DDB4;
    BNE .alive                                                           ;A7DDB7;
    LDA.W #$0073                                                         ;A7DDB9;
    JSL.L QueueSound_Lib2_Max6                                           ;A7DDBC;
    LDA.W #$0001                                                         ;A7DDC0;
    STA.W Enemy[2].init1                                                 ;A7DDC3;
    LDA.W Enemy.properties                                               ;A7DDC6;
    ORA.W #$0400                                                         ;A7DDC9;
    STA.W Enemy.properties                                               ;A7DDCC;
    JSR.W StartPhantoonDeathSequence                                     ;A7DDCF;

  .returnUpper:
    PLB                                                                  ;A7DDD2;
    RTL                                                                  ;A7DDD3;

  .alive:
    LDA.W Enemy.AI,X                                                     ;A7DDD4;
    BIT.W #$0002                                                         ;A7DDD7;
    BEQ .returnUpper                                                     ;A7DDDA;
    LDA.W #$0073                                                         ;A7DDDC;
    JSL.L QueueSound_Lib2_Max6                                           ;A7DDDF;
    LDA.W Phantoon.function,X                                            ;A7DDE3;
    CMP.W #Function_Phantoon_Figure8_VulnerableWindow                    ;A7DDE6;
    BEQ .vulnerableWindow                                                ;A7DDE9;
    CMP.W #Function_Phantoon_FlameRain_VulnerableWindow                  ;A7DDEB;
    BEQ .vulnerableWindow                                                ;A7DDEE;
    CMP.W #Function_Phantoon_Swooping_Opaque                             ;A7DDF0;
    BEQ .swooping                                                        ;A7DDF3;
    JMP.W .return1036_2                                                  ;A7DDF5;

  .swooping:
    LDA.B DP_Temp12                                                      ;A7DDF8;
    SEC                                                                  ;A7DDFA;
    SBC.W Enemy.health,X                                                 ;A7DDFB;
    STA.B DP_Temp12                                                      ;A7DDFE;
    CMP.W #$012C                                                         ;A7DE00;
    BMI .overDamaged                                                     ;A7DE03;
    LDA.W CollisionIndex                                                 ;A7DE05;
    ASL                                                                  ;A7DE08;
    TAY                                                                  ;A7DE09;
    LDA.W SamusProjectile_Types,Y                                        ;A7DE0A;
    AND.W #$0F00                                                         ;A7DE0D;
    CMP.W #$0200                                                         ;A7DE10;
    BNE .overDamaged                                                     ;A7DE13;
    JMP.W .enraged                                                       ;A7DE15;

  .overDamaged:
    LDA.W Phantoon.roundDamage,X                                         ;A7DE18;
    CLC                                                                  ;A7DE1B;
    ADC.B DP_Temp12                                                      ;A7DE1C;
    STA.W Phantoon.roundDamage,X                                         ;A7DE1E;
    CMP.W #$012C                                                         ;A7DE21;
    BMI .return1036_2                                                    ;A7DE24;
    LDA.W #$0001                                                         ;A7DE26;
    STA.W Phantoon.functionTimer,X                                       ;A7DE29;
    BRA .return1036_2                                                    ;A7DE2C;

  .vulnerableWindow:
    LDA.B DP_Temp12                                                      ;A7DE2E;
    SEC                                                                  ;A7DE30;
    SBC.W Enemy.health,X                                                 ;A7DE31;
    STA.B DP_Temp12                                                      ;A7DE34;
    CMP.W #$012C                                                         ;A7DE36;
    BMI +                                                                ;A7DE39;
    LDA.W CollisionIndex                                                 ;A7DE3B;
    ASL                                                                  ;A7DE3E;
    TAY                                                                  ;A7DE3F;
    LDA.W SamusProjectile_Types,Y                                        ;A7DE40;
    AND.W #$0F00                                                         ;A7DE43;
    CMP.W #$0200                                                         ;A7DE46;
    BNE +                                                                ;A7DE49;
    JMP.W .enraged                                                       ;A7DE4B;

+   LDA.W Phantoon.roundDamage,X                                         ;A7DE4E;
    CLC                                                                  ;A7DE51;
    ADC.B DP_Temp12                                                      ;A7DE52;
    STA.W Phantoon.roundDamage,X                                         ;A7DE54;
    CMP.W #$012C                                                         ;A7DE57;
    BPL .nextRound                                                       ;A7DE5A;
    JSL.L GenerateRandomNumber                                           ;A7DE5C;
    AND.W #$0007                                                         ;A7DE60;
    TAY                                                                  ;A7DE63;
    LDA.W Phantoon_Unknown0FEAValues_A7CDA5,Y                            ;A7DE64;
    AND.W #$00FF                                                         ;A7DE67;
    STA.W Enemy[1].var1                                                  ;A7DE6A;
    TYA                                                                  ;A7DE6D;
    STA.W Enemy[3].init1                                                 ;A7DE6E;
    LDA.W #$0001                                                         ;A7DE71;
    STA.W Enemy[2].init1                                                 ;A7DE74;
    LDA.W Phantoon.swoopingTriggeredFlag                                 ;A7DE77;
    BNE .returnLower                                                     ;A7DE7A;
    LDA.W #$0001                                                         ;A7DE7C;
    STA.W Phantoon.swoopingTriggeredFlag                                 ;A7DE7F;
    LDA.W Phantoon.functionTimer,X                                       ;A7DE82;
    CMP.W #$0010                                                         ;A7DE85;
    BMI .returnLower                                                     ;A7DE88;
    LDA.W #$0010                                                         ;A7DE8A;
    STA.W Phantoon.functionTimer,X                                       ;A7DE8D;

  .returnLower:
    PLB                                                                  ;A7DE90;
    RTL                                                                  ;A7DE91;

  .return1036_2:
    LDA.W #$0002                                                         ;A7DE92;
    STA.W Enemy[2].init1                                                 ;A7DE95;
    PLB                                                                  ;A7DE98;
    RTL                                                                  ;A7DE99;

  .nextRound:
    LDA.W #Function_Phantoon_Swooping_FadeOut                            ;A7DE9A;
    STA.W Phantoon.function,X                                            ;A7DE9D;

  .nextRoundOrEnraged:
    STZ.W Phantoon.functionTimer,X                                       ;A7DEA0;
    STZ.W Phantoon.swoopingTriggeredFlag                                 ;A7DEA3;
    STZ.W Phantoon.roundDamage,X                                         ;A7DEA6;
    LDA.W LayerBlending_PhantoonSemiTransparencyFlag                     ;A7DEA9;
    ORA.W #$4000                                                         ;A7DEAC;
    STA.W LayerBlending_PhantoonSemiTransparencyFlag                     ;A7DEAF;
    LDA.W #$0001                                                         ;A7DEB2;
    STA.W Enemy.instTimer                                                ;A7DEB5;
    STA.W Enemy[1].instTimer                                             ;A7DEB8;
    LDA.W #InstList_Phantoon_Body_Invulnerable                           ;A7DEBB;
    STA.W Enemy.instList                                                 ;A7DEBE;
    LDA.W #InstList_Phantoon_Eye_Close                                   ;A7DEC1;
    STA.W Enemy[1].instList                                              ;A7DEC4;
    LDA.W Enemy.properties                                               ;A7DEC7;
    ORA.W #$0400                                                         ;A7DECA;
    STA.W Enemy.properties                                               ;A7DECD;
    STZ.W Phantoon.fadeCompleteFlag                                      ;A7DED0;
    BRA .return1036_2                                                    ;A7DED3;

  .enraged:
    LDA.W #Function_Phantoon_Enraged_FadingOutBeforeRage                 ;A7DED5;
    STA.W Phantoon.function,X                                            ;A7DED8;
    BRA .nextRoundOrEnraged                                              ;A7DEDB;


;;; $DEDD: Extended spritemaps ;;;
ExtendedSpritemap_Phantoon_Body_Invulnerable:
    dw $0001                                                             ;A7DEDD;
    dw $0000,$0000
    dw ExtendedTilemap_Phantoon_Body                                     ;A7DEE3;
    dw Hitbox_Phantoon_0                                                 ;A7DEE5;

ExtendedSpritemap_Phantoon_Body_FullHitbox:
    dw $0001                                                             ;A7DEE7;
    dw $0000,$0000
    dw ExtendedTilemap_Phantoon_Body                                     ;A7DEED;
    dw Hitbox_Phantoon_1                                                 ;A7DEEF;

ExtendedSpritemap_Phantoon_Body_EyeHitbox:
    dw $0001                                                             ;A7DEF1;
    dw $0000,$0000
    dw ExtendedTilemap_Phantoon_Body                                     ;A7DEF7;
    dw Hitbox_Phantoon_2                                                 ;A7DEF9;

ExtendedSpritemap_Phantoon_Eye_Closed:
    dw $0001                                                             ;A7DEFB;
    dw $0000,$0000
    dw ExtendedTilemap_Phantoon_Eye_Closed                               ;A7DF01;
    dw Hitbox_Phantoon_0                                                 ;A7DF03;

ExtendedSpritemap_Phantoon_Eye_Opening:
    dw $0001                                                             ;A7DF05;
    dw $0000,$0000
    dw ExtendedTilemap_Phantoon_Eye_Closed                               ;A7DF0B;
    dw Hitbox_Phantoon_0                                                 ;A7DF0D;

ExtendedSpritemap_Phantoon_Eye_OpeningClosing:
    dw $0001                                                             ;A7DF0F;
    dw $0000,$0000
    dw ExtendedTilemap_Phantoon_Eye_OpeningClosing                       ;A7DF15;
    dw Hitbox_Phantoon_0                                                 ;A7DF17;

ExtendedSpritemap_Phantoon_Eye_Open:
    dw $0001                                                             ;A7DF19;
    dw $0000,$0000
    dw ExtendedTilemap_Phantoon_Eye_Open                                 ;A7DF1F;
    dw Hitbox_Phantoon_0                                                 ;A7DF21;

ExtendedSpritemap_Phantoon_Eyeball_Centered:
    dw $0001                                                             ;A7DF23;
    dw $0000,$0000
    dw ExtendedTilemap_Phantoon_Eyeball_Centered                         ;A7DF29;
    dw Hitbox_Phantoon_0                                                 ;A7DF2B;

ExtendedSpritemap_Phantoon_Eyeball_LookingUp:
    dw $0001                                                             ;A7DF2D;
    dw $0000,$0000
    dw ExtendedTilemap_Phantoon_Eyeball_LookingUp                        ;A7DF33;
    dw Hitbox_Phantoon_0                                                 ;A7DF35;

ExtendedSpritemap_Phantoon_Eyeball_LookingDown:
    dw $0001                                                             ;A7DF37;
    dw $0000,$0000
    dw ExtendedTilemap_Phantoon_Eyeball_LookingDown                      ;A7DF3D;
    dw Hitbox_Phantoon_0                                                 ;A7DF3F;

ExtendedSpritemap_Phantoon_Eyeball_LookingLeft:
    dw $0001                                                             ;A7DF41;
    dw $0000,$0000
    dw ExtendedTilemap_Phantoon_Eyeball_LookingLeft                      ;A7DF47;
    dw Hitbox_Phantoon_0                                                 ;A7DF49;

ExtendedSpritemap_Phantoon_Eyeball_LookingRight:
    dw $0001                                                             ;A7DF4B;
    dw $0000,$0000
    dw ExtendedTilemap_Phantoon_Eyeball_LookingRight                     ;A7DF51;
    dw Hitbox_Phantoon_0                                                 ;A7DF53;

ExtendedSpritemap_Phantoon_Eyeball_LookingDownLeft:
    dw $0001                                                             ;A7DF55;
    dw $0000,$0000
    dw ExtendedTilemap_Phantoon_Eyeball_LookingDownLeft                  ;A7DF5B;
    dw Hitbox_Phantoon_0                                                 ;A7DF5D;

ExtendedSpritemap_Phantoon_Eyeball_LookingDownRight:
    dw $0001                                                             ;A7DF5F;
    dw $0000,$0000
    dw ExtendedTilemap_Phantoon_Eyeball_LookingDownRight                 ;A7DF65;
    dw Hitbox_Phantoon_0                                                 ;A7DF67;

ExtendedSpritemap_Phantoon_Eyeball_LookingUpLeft:
    dw $0001                                                             ;A7DF69;
    dw $0000,$0000
    dw ExtendedTilemap_Phantoon_Eyeball_LookingUpLeft                    ;A7DF6F;
    dw Hitbox_Phantoon_0                                                 ;A7DF71;

ExtendedSpritemap_Phantoon_Eyeball_LookingUpRight:
    dw $0001                                                             ;A7DF73;
    dw $0000,$0000
    dw ExtendedTilemap_Phantoon_Eyeball_LookingUpRight                   ;A7DF79;
    dw Hitbox_Phantoon_0                                                 ;A7DF7B;

if !FEATURE_KEEP_UNREFERENCED
UNUSED_ExtendedSpritemap_Phantoon_Tentacles_A7DF7D:
; Unused clone of ExtendedSpritemap_Phantoon_Tentacles_0
    dw $0002                                                             ;A7DF7D;
    dw $0000,$0000
    dw ExtendedTilemap_Phantoon_Tentacle_Left_0                          ;A7DF83;
    dw Hitbox_Phantoon_0                                                 ;A7DF85;
    dw $0000,$0000                                                       ;A7DF87;
    dw ExtendedTilemap_Phantoon_Tentacle_Right_0                         ;A7DF8B;
    dw Hitbox_Phantoon_0                                                 ;A7DF8D;

UNUSED_ExtendedSpritemap_Phantoon_Tentacles_A7DF8F:
; Unused clone of ExtendedSpritemap_Phantoon_Tentacles_1
    dw $0002                                                             ;A7DF8F;
    dw $0000,$0000
    dw ExtendedTilemap_Phantoon_Tentacle_Left_1                          ;A7DF95;
    dw Hitbox_Phantoon_0                                                 ;A7DF97;
    dw $0000,$0000                                                       ;A7DF99;
    dw ExtendedTilemap_Phantoon_Tentacle_Right_1                         ;A7DF9D;
    dw Hitbox_Phantoon_0                                                 ;A7DF9F;

UNUSED_ExtendedSpritemap_Phantoon_Tentacles_A7DFA1:
; Unused clone of ExtendedSpritemap_Phantoon_Tentacles_2
    dw $0002                                                             ;A7DFA1;
    dw $0000,$0000
    dw ExtendedTilemap_Phantoon_Tentacle_Left_2                          ;A7DFA7;
    dw Hitbox_Phantoon_0                                                 ;A7DFA9;
    dw $0000,$0000                                                       ;A7DFAB;
    dw ExtendedTilemap_Phantoon_Tentacle_Right_2                         ;A7DFAF;
    dw Hitbox_Phantoon_0                                                 ;A7DFB1;
endif ; !FEATURE_KEEP_UNREFERENCED

ExtendedSpritemap_Phantoon_Tentacles_0:
    dw $0002                                                             ;A7DFB3;
    dw $0000,$0000
    dw ExtendedTilemap_Phantoon_Tentacle_Left_0                          ;A7DFB9;
    dw Hitbox_Phantoon_0                                                 ;A7DFBB;
    dw $0000,$0000                                                       ;A7DFBD;
    dw ExtendedTilemap_Phantoon_Tentacle_Right_0                         ;A7DFC1;
    dw Hitbox_Phantoon_0                                                 ;A7DFC3;

ExtendedSpritemap_Phantoon_Tentacles_1:
    dw $0002                                                             ;A7DFC5;
    dw $0000,$0000
    dw ExtendedTilemap_Phantoon_Tentacle_Left_1                          ;A7DFCB;
    dw Hitbox_Phantoon_0                                                 ;A7DFCD;
    dw $0000,$0000                                                       ;A7DFCF;
    dw ExtendedTilemap_Phantoon_Tentacle_Right_1                         ;A7DFD3;
    dw Hitbox_Phantoon_0                                                 ;A7DFD5;

ExtendedSpritemap_Phantoon_Tentacles_2:
    dw $0002                                                             ;A7DFD7;
    dw $0000,$0000
    dw ExtendedTilemap_Phantoon_Tentacle_Left_2                          ;A7DFDD;
    dw Hitbox_Phantoon_0                                                 ;A7DFDF;
    dw $0000,$0000                                                       ;A7DFE1;
    dw ExtendedTilemap_Phantoon_Tentacle_Right_2                         ;A7DFE5;
    dw Hitbox_Phantoon_0                                                 ;A7DFE7;

ExtendedSpritemap_Phantoon_Mouth_Normal:
    dw $0001                                                             ;A7DFE9;
    dw $0000,$0000
    dw ExtendedTilemap_Phantoon_Mouth_0                                  ;A7DFEF;
    dw Hitbox_Phantoon_0                                                 ;A7DFF1;

ExtendedSpritemap_Phantoon_Mouth_SpawningFlame_0:
    dw $0001                                                             ;A7DFF3;
    dw $0000,$0000
    dw ExtendedTilemap_Phantoon_Mouth_1                                  ;A7DFF9;
    dw Hitbox_Phantoon_0                                                 ;A7DFFB;

ExtendedSpritemap_Phantoon_Mouth_SpawningFlame_1:
    dw $0001                                                             ;A7DFFD;
    dw $0000,$0000
    dw ExtendedTilemap_Phantoon_Mouth_2                                  ;A7E003;
    dw Hitbox_Phantoon_0                                                 ;A7E005;

if !FEATURE_KEEP_UNREFERENCED
UNUSED_ExtendedSpritemap_Phantoon_Mouth_SpawningFlame_A7E007:
    dw $0001                                                             ;A7E007;
    dw $0000,$0000
    dw ExtendedTilemap_Phantoon_Mouth_0                                  ;A7E00D;
    dw Hitbox_Phantoon_0                                                 ;A7E00F;
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $E011: RTL. Initialisation AI - enemy $E53F/$E57F (Phantoon) ;;;
RTL_A7E011:
    RTL                                                                  ;A7E011;


;;; $E012: Hitboxes ;;;
if !FEATURE_KEEP_UNREFERENCED
UNUSED_Hitbox_Phantoon_A7E012:
    dw $0001                                                             ;A7E012;
    dw $FFF7,$FFF0,$0008,$0010
    dw EnemyTouch_Phantoon                                               ;A7E01C;
    dw EnemyShot_Phantoon                                                ;A7E01E;
endif ; !FEATURE_KEEP_UNREFERENCED

Hitbox_Phantoon_0:
    dw $0001                                                             ;A7E020;
    dw $0000,$0000,$0000,$0000
    dw Common_RTL_A0804C                                                        ;A7E02A;
    dw Common_RTL_A0804C                                                        ;A7E02C;

Hitbox_Phantoon_1:
    dw $0005                                                             ;A7E02E;
    dw $FFDF,$FFD8,$0020,$0038
    dw EnemyTouch_Phantoon                                               ;A7E038;
    dw EnemyShot_Phantoon                                                ;A7E03A;
    dw $FFF7,$0016,$0008,$0027                                           ;A7E03C;
    dw EnemyTouch_Phantoon                                               ;A7E044;
    dw EnemyShot_Phantoon                                                ;A7E046;
    dw $FFE9,$0034,$FFF0,$0047                                           ;A7E048;
    dw EnemyTouch_Phantoon                                               ;A7E050;
    dw EnemyShot_Phantoon                                                ;A7E052;
    dw $000F,$0035,$0016,$0046                                           ;A7E054;
    dw EnemyTouch_Phantoon                                               ;A7E05C;
    dw EnemyShot_Phantoon                                                ;A7E05E;
    dw $FFF4,$0035,$000B,$0045                                           ;A7E060;
    dw EnemyTouch_Phantoon                                               ;A7E068;
    dw EnemyShot_Phantoon                                                ;A7E06A;

Hitbox_Phantoon_2:
    dw $0001                                                             ;A7E06C;
    dw $FFF7,$0016,$0008,$0027
    dw EnemyTouch_Phantoon                                               ;A7E076;
    dw EnemyShot_Phantoon                                                ;A7E078;


;;; $E07A: Spritemaps / extended tilemaps ;;;
if !FEATURE_KEEP_UNREFERENCED
UNUSED_Spritemap_PhantoonFlame_A7E07A:
    dw $0002                                                             ;A7E07A;
    %spritemapEntry(1, $1F8, $00, 0, 0, 2, 0, $106)
    %spritemapEntry(1, $1F8, $F0, 0, 0, 2, 0, $100)

UNUSED_Spritemap_PhantoonFlame_A7E086:
    dw $0002                                                             ;A7E086;
    %spritemapEntry(1, $1F8, $00, 0, 0, 2, 0, $108)
    %spritemapEntry(1, $1F8, $F0, 0, 0, 2, 0, $102)

UNUSED_Spritemap_PhantoonFlame_A7E092:
    dw $0002                                                             ;A7E092;
    %spritemapEntry(1, $1F8, $00, 0, 0, 2, 0, $10A)
    %spritemapEntry(1, $1F8, $F0, 0, 0, 2, 0, $104)

UNUSED_Spritemap_PhantoonFlame_A7E09E:
    dw $0002                                                             ;A7E09E;
    %spritemapEntry(1, $00, $F8, 0, 1, 2, 0, $10C)
    %spritemapEntry(1, $1F0, $F8, 0, 0, 2, 0, $10C)
endif ; !FEATURE_KEEP_UNREFERENCED


ExtendedTilemap_Phantoon_Body:                                           ;A7E0AA;
    dw $FFFE
    dw $2000,$000A,$2338,$2338,$2338,$3D32,$3D33,$7D33,$7D32,$2338,$2338,$2338
    dw $2040,$000A,$2338,$3D40,$3D41,$3D42,$3D43,$7D43,$7D42,$7D41,$7D40,$2338
    dw $2080,$000A,$2338,$3D50,$3D51,$3D52,$3D53,$7D53,$7D52,$7D51,$7D50,$2338
    dw $20C0,$000A,$3D78,$3D60,$3D61,$3D62,$3D63,$7D63,$7D62,$7D61,$7D60,$7D78
    dw $2100,$000A,$3D79,$3D70,$3D71,$3D72,$3D73,$7D73,$7D72,$7D71,$7D70,$7D79
    dw $2140,$000A,$BD78,$3D34,$3D35,$3D36,$3D37,$7D37,$7D36,$7D35,$7D34,$FD78
    dw $2180,$000A,$2338,$3D44,$3D45,$3D46,$3D47,$7D47,$7D46,$7D45,$7D44,$2338
    dw $21C0,$000A,$2338,$3D54,$3D55,$3D56,$3D57,$7D57,$7D56,$7D55,$7D54,$2338
    dw $2200,$000A,$2338,$3D64,$3D65,$3D66,$2338,$2338,$7D66,$7D65,$7D64,$2338
    dw $2240,$000A,$2338,$3D74,$3D75,$3D76,$2338,$2338,$7D76,$7D75,$7D74,$2338
    dw $2280,$000A,$2338,$2338,$3D38,$3D39,$3D3A,$7D3A,$7D39,$7D38,$2338,$2338
    dw $22C0,$000A,$2338,$2338,$3D48,$3D49,$3D4A,$7D4A,$7D49,$7D48,$2338,$2338
    dw $FFFF

ExtendedTilemap_Phantoon_Eye_Open:                                       ;A7E1CE;
    dw $FFFE
    dw $21C6,$0004, $3D56,$3D57,$7D57,$7D56
    dw $2206,$0004, $3D66,$3D67,$3D3F,$7D66
    dw $2246,$0004, $3D76,$3D77,$3D4F,$7D76
    dw $2286,$0004, $3D39,$3D3A,$7D3A,$7D39
    dw $FFFF

ExtendedTilemap_Phantoon_Eye_OpeningClosing:                             ;A7E202;
    dw $FFFE
    dw $21C6,$0004, $3D3D,$3D3E,$7D3E,$7D3D
    dw $2206,$0004, $3D4D,$3D4E,$3D5F,$7D4D
    dw $2246,$0004, $3D5D,$3D5E,$3D6F,$7D5D
    dw $2286,$0004, $3D6D,$3D6E,$7D6E,$7D6D
    dw $FFFF

ExtendedTilemap_Phantoon_Eye_Closed:                                     ;A7E236;
    dw $FFFE
    dw $21C6,$0004, $3D3B,$3D3C,$7D3C,$7D3B
    dw $2206,$0004, $3D4B,$3D4C,$7D4C,$7D4B
    dw $2246,$0004, $3D5B,$3D5C,$7D5C,$7D5B
    dw $2286,$0004, $3D6B,$3D6C,$7D6C,$7D6B
    dw $FFFF

ExtendedTilemap_Phantoon_Eyeball_Centered:                               ;A7E26A;
    dw $FFFE
    dw $2208,$0002, $3D67,$3D3F
    dw $2248,$0002, $3D77,$3D4F
    dw $FFFF

ExtendedTilemap_Phantoon_Eyeball_LookingUp:                              ;A7E27E;
    dw $FFFE
    dw $2208,$0002, $3D10,$3D11
    dw $2248,$0002, $3D20,$3D21
    dw $FFFF

ExtendedTilemap_Phantoon_Eyeball_LookingDown:                            ;A7E292;
    dw $FFFE
    dw $2208,$0002, $3D12,$3D13
    dw $2248,$0002, $3D22,$3D23
    dw $FFFF

ExtendedTilemap_Phantoon_Eyeball_LookingLeft:                            ;A7E2A6;
    dw $FFFE
    dw $2208,$0002, $3D14,$3D15
    dw $2248,$0002, $3D24,$3D25
    dw $FFFF

ExtendedTilemap_Phantoon_Eyeball_LookingRight:                           ;A7E2BA;
    dw $FFFE
    dw $2208,$0002, $3D16,$3D17
    dw $2248,$0002, $3D26,$3D27
    dw $FFFF

ExtendedTilemap_Phantoon_Eyeball_LookingDownLeft:                        ;A7E2CE;
    dw $FFFE
    dw $2208,$0002, $3D18,$3D19
    dw $2248,$0002, $3D28,$3D29
    dw $FFFF

ExtendedTilemap_Phantoon_Eyeball_LookingDownRight:                       ;A7E2E2;
    dw $FFFE
    dw $2208,$0002, $3D1A,$3D1B
    dw $2248,$0002, $3D2A,$3D2B
    dw $FFFF

ExtendedTilemap_Phantoon_Eyeball_LookingUpLeft:                          ;A7E2F6;
    dw $FFFE
    dw $2208,$0002, $3D1C,$3D1D
    dw $2248,$0002, $3D2C,$3D2D
    dw $FFFF

ExtendedTilemap_Phantoon_Eyeball_LookingUpRight:                         ;A7E30A;
    dw $FFFE
    dw $2208,$0002, $3D1E,$3D1F
    dw $2248,$0002, $3D2E,$3D2F
    dw $FFFF

ExtendedTilemap_Phantoon_Tentacle_Left_0:                                ;A7E31E;
    dw $FFFE
    dw $2304,$0001, $3D58
    dw $2344,$0001, $3D68
    dw $FFFF

ExtendedTilemap_Phantoon_Tentacle_Left_1:                                ;A7E32E;
    dw $FFFE
    dw $2304,$0001, $3D81
    dw $2344,$0001, $3D83
    dw $FFFF

ExtendedTilemap_Phantoon_Tentacle_Left_2:                                ;A7E33E;
    dw $FFFE
    dw $2304,$0001, $3D80
    dw $2344,$0001, $3D82
    dw $FFFF

ExtendedTilemap_Phantoon_Tentacle_Right_0:                               ;A7E34E;
    dw $FFFE
    dw $230E,$0001, $7D58
    dw $234E,$0001, $7D68
    dw $FFFF

ExtendedTilemap_Phantoon_Tentacle_Right_1:                               ;A7E35E;
    dw $FFFE
    dw $230E,$0001, $7D81
    dw $234E,$0001, $7D83
    dw $FFFF

ExtendedTilemap_Phantoon_Tentacle_Right_2:                               ;A7E36E;
    dw $FFFE
    dw $230E,$0001, $7D80
    dw $234E,$0001, $7D82
    dw $FFFF

ExtendedTilemap_Phantoon_Mouth_0:                                        ;A7E37E;
    dw $FFFE
    dw $2306,$0004, $3D59,$3D5A,$7D5A,$7D59
    dw $2346,$0004, $3D69,$3D6A,$7D6A,$7D69
    dw $FFFF

ExtendedTilemap_Phantoon_Mouth_1:                                        ;A7E39A;
    dw $FFFE
    dw $2306,$0004, $3D7A,$3D7B,$7D7B,$7D7A
    dw $2346,$0004, $3D7C,$3D7D,$7D7D,$7D7C
    dw $FFFF

ExtendedTilemap_Phantoon_Mouth_2:                                        ;A7E3B6;
    dw $FFFE
    dw $2306,$0004, $3D7E,$3D7F,$7D7F,$7D7E
    dw $2346,$0004, $3D30,$3D31,$7D31,$7D30
    dw $FFFF


;;; $E3D2: Phantoon movement data ;;;
PhantoonMovementData:
; List of (signed) X/Y offset pairs, 216h total
; Indexed by Phantoon.movementIndex
    db $00,$FF, $01,$00, $00,$FF, $01,$00, $00,$FF, $01,$FF, $00,$FF, $01,$00 ;A7E3D2;
    db $00,$FF, $01,$00, $00,$FF, $00,$FF, $01,$00, $00,$FF, $01,$00, $00,$FF ;A7E3E2;
    db $01,$00, $00,$FF, $00,$FF, $01,$00, $00,$FF, $01,$00, $00,$FF, $01,$00 ;A7E3F2;
    db $00,$FF, $01,$00, $00,$FF, $01,$00, $00,$FF, $00,$FF, $01,$00, $00,$FF ;A7E402;
    db $01,$00, $00,$FF, $01,$00, $00,$FF, $01,$00, $00,$FF, $01,$00, $00,$FF ;A7E412;
    db $01,$00, $01,$00, $00,$FF, $01,$00, $00,$FF, $01,$00, $00,$FF, $01,$00 ;A7E422;
    db $00,$FF, $01,$00, $01,$00, $00,$FF, $01,$00, $01,$00, $00,$FF, $01,$00 ;A7E432;
    db $01,$00, $00,$FF, $01,$00, $01,$00, $00,$FF, $01,$00, $01,$00, $01,$00 ;A7E442;
    db $01,$00, $00,$FF, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00 ;A7E452;
    db $01,$00, $01,$00, $01,$00, $01,$00, $01,$01, $01,$00, $01,$00, $01,$00 ;A7E462;
    db $01,$00, $00,$01, $01,$00, $01,$00, $01,$00, $00,$01, $01,$00, $01,$00 ;A7E472;
    db $00,$01, $01,$00, $01,$00, $01,$01, $01,$00, $01,$01, $01,$00, $00,$01 ;A7E482;
    db $01,$00, $01,$00, $00,$01, $01,$00, $00,$01, $01,$00, $01,$00, $00,$01 ;A7E492;
    db $01,$00, $00,$01, $01,$00, $00,$01, $01,$00, $01,$01, $01,$01, $01,$01 ;A7E4A2;
    db $01,$01, $00,$01, $01,$00, $00,$01, $01,$00, $00,$01, $01,$00, $00,$01 ;A7E4B2;
    db $00,$01, $01,$00, $00,$01, $00,$01, $01,$00, $00,$01, $00,$01, $01,$00 ;A7E4C2;
    db $00,$01, $00,$01, $00,$01, $01,$00, $00,$01, $00,$01, $00,$01, $00,$01 ;A7E4D2;
    db $00,$01, $00,$01, $00,$01, $00,$01, $FF,$00, $00,$01, $00,$01, $00,$01 ;A7E4E2;
    db $FF,$00, $00,$01, $00,$01, $FF,$01, $00,$01, $FF,$00, $00,$01, $00,$01 ;A7E4F2;
    db $FF,$00, $00,$01, $FF,$00, $00,$01, $FF,$00, $00,$01, $FF,$01, $00,$01 ;A7E502;
    db $FF,$00, $FF,$01, $FF,$01, $FF,$00, $00,$01, $FF,$00, $00,$01, $FF,$00 ;A7E512;
    db $00,$01, $FF,$00, $FF,$00, $00,$01, $FF,$00, $00,$01, $FF,$00, $FF,$00 ;A7E522;
    db $00,$01, $FF,$00, $FF,$01, $FF,$00, $FF,$01, $FF,$00, $FF,$00, $00,$01 ;A7E532;
    db $FF,$00, $FF,$00, $00,$01, $FF,$00, $FF,$00, $FF,$00, $00,$01, $FF,$00 ;A7E542;
    db $FF,$00, $FF,$00, $FF,$00, $FF,$01, $FF,$00, $FF,$00, $FF,$00, $FF,$00 ;A7E552;
    db $FF,$00, $FF,$00, $FF,$00, $FF,$00, $FF,$00, $FF,$00, $00,$FF, $FF,$00 ;A7E562;
    db $FF,$00, $FF,$00, $FF,$00, $00,$FF, $FF,$00, $FF,$00, $00,$FF, $FF,$00 ;A7E572;
    db $FF,$00, $00,$FF, $FF,$00, $FF,$00, $00,$FF, $FF,$00, $FF,$FF, $FF,$00 ;A7E582;
    db $00,$FF, $FF,$00, $00,$FF, $FF,$00, $FF,$FF, $FF,$FF, $FF,$00, $00,$FF ;A7E592;
    db $FF,$00, $00,$FF, $FF,$00, $00,$FF, $FF,$FF, $FF,$FF, $00,$FF, $FF,$00 ;A7E5A2;
    db $00,$FF, $FF,$00, $00,$FF, $FF,$00, $00,$FF, $FF,$00, $00,$FF, $FF,$FF ;A7E5B2;
    db $00,$FF, $FF,$00, $00,$FF, $FF,$00, $00,$FF, $FF,$00, $00,$FF, $00,$FF ;A7E5C2;
    db $FF,$00, $00,$FF, $FF,$00, $00,$FF, $00,$FF, $FF,$00, $00,$FF, $FF,$00 ;A7E5D2;
    db $00,$FF, $FF,$00, $00,$FF, $00,$FF, $FF,$00, $00,$FF, $FF,$00, $00,$FF ;A7E5E2;
    db $FF,$FF, $00,$FF, $FF,$00, $00,$FF, $FF,$00, $00,$FF, $00,$FF, $FF,$00 ;A7E5F2;
    db $00,$FF, $FF,$00, $00,$FF, $FF,$00, $00,$FF, $FF,$FF, $00,$FF, $FF,$00 ;A7E602;
    db $00,$FF, $FF,$00, $00,$FF, $FF,$00, $00,$FF, $FF,$00, $00,$FF, $FF,$FF ;A7E612;
    db $00,$FF, $FF,$00, $00,$FF, $FF,$00, $00,$FF, $FF,$00, $00,$FF, $FF,$00 ;A7E622;
    db $00,$FF, $FF,$00, $FF,$FF, $FF,$00, $00,$FF, $FF,$00, $00,$FF, $FF,$00 ;A7E632;
    db $FF,$FF, $FF,$00, $00,$FF, $FF,$00, $FF,$00, $00,$FF, $FF,$00, $FF,$00 ;A7E642;
    db $00,$FF, $FF,$00, $FF,$00, $00,$FF, $FF,$00, $FF,$00, $FF,$00, $FF,$00 ;A7E652;
    db $00,$FF, $FF,$00, $FF,$00, $FF,$00, $FF,$00, $FF,$00, $FF,$00, $FF,$00 ;A7E662;
    db $FF,$00, $FF,$00, $FF,$00, $FF,$01, $FF,$00, $FF,$00, $FF,$00, $FF,$00 ;A7E672;
    db $00,$01, $FF,$00, $FF,$00, $FF,$00, $00,$01, $FF,$00, $FF,$00, $00,$01 ;A7E682;
    db $FF,$00, $FF,$00, $FF,$01, $FF,$00, $FF,$01, $FF,$00, $00,$01, $FF,$00 ;A7E692;
    db $FF,$00, $00,$01, $FF,$00, $00,$01, $FF,$00, $FF,$00, $00,$01, $FF,$00 ;A7E6A2;
    db $00,$01, $FF,$00, $00,$01, $FF,$00, $00,$01, $FF,$00, $FF,$01, $FF,$01 ;A7E6B2;
    db $FF,$01, $00,$01, $FF,$00, $00,$01, $FF,$00, $00,$01, $FF,$00, $00,$01 ;A7E6C2;
    db $00,$01, $FF,$00, $00,$01, $FF,$01, $00,$01, $00,$01, $FF,$00, $00,$01 ;A7E6D2;
    db $00,$01, $00,$01, $FF,$00, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01 ;A7E6E2;
    db $00,$01, $00,$01, $00,$01, $01,$00, $00,$01, $00,$01, $00,$01, $01,$00 ;A7E6F2;
    db $00,$01, $00,$01, $01,$00, $00,$01, $00,$01, $01,$00, $00,$01, $00,$01 ;A7E702;
    db $01,$00, $00,$01, $01,$00, $00,$01, $01,$00, $00,$01, $01,$01, $01,$01 ;A7E712;
    db $00,$01, $01,$00, $01,$01, $01,$00, $00,$01, $01,$00, $00,$01, $01,$00 ;A7E722;
    db $00,$01, $01,$00, $01,$00, $00,$01, $01,$00, $00,$01, $01,$00, $01,$00 ;A7E732;
    db $00,$01, $01,$00, $01,$01, $01,$00, $01,$01, $01,$00, $01,$00, $00,$01 ;A7E742;
    db $01,$00, $01,$00, $00,$01, $01,$00, $01,$00, $01,$00, $00,$01, $01,$00 ;A7E752;
    db $01,$00, $01,$00, $01,$00, $01,$01, $01,$00, $01,$00, $01,$00, $01,$00 ;A7E762;
    db $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $00,$FF, $01,$00 ;A7E772;
    db $01,$00, $01,$00, $01,$00, $00,$FF, $01,$00, $01,$00, $00,$FF, $01,$00 ;A7E782;
    db $01,$00, $00,$FF, $01,$00, $01,$00, $00,$FF, $01,$00, $01,$00, $00,$FF ;A7E792;
    db $01,$00, $00,$FF, $01,$00, $00,$FF, $01,$00, $00,$FF, $01,$00, $01,$FF ;A7E7A2;
    db $01,$00, $00,$FF, $01,$00, $00,$FF, $01,$00, $00,$FF, $01,$00, $00,$FF ;A7E7B2;
    db $01,$00, $00,$FF, $00,$FF, $01,$00, $00,$FF, $01,$00, $00,$FF, $01,$00 ;A7E7C2;
    db $00,$FF, $01,$00, $00,$FF, $01,$00, $00,$FF, $00,$FF, $01,$00, $00,$FF ;A7E7D2;
    db $01,$00, $00,$FF, $01,$FF, $00,$FF, $01,$00, $00,$FF, $01,$00, $00,$FF ;A7E7E2;
    db $01,$FF, $00,$FF, $01,$00, $00,$FF, $01,$00, $00,$FF                   ;A7E7F2;


;;; $E7FE: Palette - enemy $E5BF (etecoon) ;;;
Palette_Etecoon:
    dw $3800,$5F97,$56F2,$2987,$00A0,$6355,$4AB0,$3A0B                   ;A7E7FE;
    dw $31C9,$57FF,$42F7,$2610,$158C,$03FF,$0279,$0029                   ;A7E80E;


;;; $E81E: Instruction list - look right at Samus and run left ;;;
InstList_Etecoon_LookRightAtSamusAndRunLeft:
    dw $0005,Spritemap_Etecoon_C                                         ;A7E81E;
    dw Common_Instruction_Sleep                                          ;A7E822;
    dw $0001,Spritemap_Etecoon_D                                         ;A7E824;


;;; $E828: Instruction list - running left ;;;
InstList_Etecoon_RunningLeft:
    dw $0005,Spritemap_Etecoon_0                                         ;A7E828;
    dw $0005,Spritemap_Etecoon_1                                         ;A7E82C;
    dw $0005,Spritemap_Etecoon_2                                         ;A7E830;
    dw $0005,Spritemap_Etecoon_1                                         ;A7E834;
    dw Common_Instruction_GotoY                                          ;A7E838;
    dw InstList_Etecoon_RunningLeft                                      ;A7E83A;


;;; $E83C: Instruction list - wall jump left ;;;
InstList_Etecoon_WallJump_0:
    dw $0008,Spritemap_Etecoon_7                                         ;A7E83C;

InstList_Etecoon_WallJump_1:
    dw $0003,Spritemap_Etecoon_3                                         ;A7E840;
    dw $0003,Spritemap_Etecoon_4                                         ;A7E844;
    dw $0003,Spritemap_Etecoon_5                                         ;A7E848;
    dw $0003,Spritemap_Etecoon_6                                         ;A7E84C;
    dw Common_Instruction_GotoY                                          ;A7E850;
    dw InstList_Etecoon_WallJump_1                                       ;A7E852;


;;; $E854: Instruction list - hopping - facing left ;;;
InstList_Etecoon_Hopping_FacingLeft:
    dw $0001,Spritemap_Etecoon_8                                         ;A7E854;
    dw Common_Instruction_Sleep                                          ;A7E858;
    dw $000C,Spritemap_Etecoon_9                                         ;A7E85A;
    dw $000C,Spritemap_Etecoon_A                                         ;A7E85E;


;;; $E862: Instruction list - hit ceiling ;;;
InstList_Etecoon_HitCeiling:
    dw $0006,Spritemap_Etecoon_B                                         ;A7E862;
    dw $000C,Spritemap_Etecoon_A                                         ;A7E866;
    dw $000C,Spritemap_Etecoon_9                                         ;A7E86A;
    dw Common_Instruction_Sleep                                          ;A7E86E;


;;; $E870: Instruction list - wall-jump left eligible ;;;
InstList_Etecoon_WallJumpLeftEligible:
    dw $0001,Spritemap_Etecoon_F                                         ;A7E870;
    dw Common_Instruction_Sleep                                          ;A7E874;


;;; $E876: Instruction list - look left at Samus and run right ;;;
InstList_Etecoon_LookLeftAtSamusAndRunRight:
    dw $0005,Spritemap_Etecoon_1E                                        ;A7E876;
    dw Common_Instruction_Sleep                                        ;A7E87A;
    dw $0001,Spritemap_Etecoon_1D                                        ;A7E87C;


;;; $E880: Instruction list - running right ;;;
InstList_Etecoon_RunningRight:
    dw $0005,Spritemap_Etecoon_10                                        ;A7E880;
    dw $0005,Spritemap_Etecoon_11                                        ;A7E884;
    dw $0005,Spritemap_Etecoon_12                                        ;A7E888;
    dw $0005,Spritemap_Etecoon_11                                        ;A7E88C;
    dw Common_Instruction_GotoY                                          ;A7E890;
    dw InstList_Etecoon_RunningRight                                     ;A7E892;


;;; $E894: Instruction list - wall jump right ;;;
InstList_Etecoon_WallJumpRight:
    dw $0008,Spritemap_Etecoon_17                                        ;A7E894;


;;; $E898: Instruction list - jumping right ;;;
InstList_Etecoon_JumpingRight:
    dw $0003,Spritemap_Etecoon_13                                        ;A7E898;
    dw $0003,Spritemap_Etecoon_14                                        ;A7E89C;
    dw $0003,Spritemap_Etecoon_15                                        ;A7E8A0;
    dw $0003,Spritemap_Etecoon_16                                        ;A7E8A4;
    dw Common_Instruction_GotoY                                          ;A7E8A8;
    dw InstList_Etecoon_JumpingRight                                     ;A7E8AA;


;;; $E8AC: Instruction list - hopping - facing right ;;;
InstList_Etecoon_Hopping_FacingRight:
    dw $0001,Spritemap_Etecoon_18                                        ;A7E8AC;
    dw Common_Instruction_Sleep                                          ;A7E8B0;
    dw $000C,Spritemap_Etecoon_19                                        ;A7E8B2;
    dw $000C,Spritemap_Etecoon_1A                                        ;A7E8B6;
    dw $0006,Spritemap_Etecoon_1B                                        ;A7E8BA;
    dw $000C,Spritemap_Etecoon_1A                                        ;A7E8BE;
    dw $000C,Spritemap_Etecoon_19                                        ;A7E8C2;
    dw Common_Instruction_Sleep                                        ;A7E8C6;


;;; $E8C8: Instruction list - wall-jump right eligible ;;;
InstList_Etecoon_WallJumpRightEligible:
    dw $0001,Spritemap_Etecoon_1F                                        ;A7E8C8;
    dw Common_Instruction_Sleep                                          ;A7E8CC;


;;; $E8CE: Instruction list - initial ;;;
InstList_Etecoon_Initial:
    dw $0008,Spritemap_Etecoon_18                                        ;A7E8CE;
    dw Common_Instruction_GotoY                                          ;A7E8D2;
    dw InstList_Etecoon_Initial                                          ;A7E8D4;


;;; $E8D6: Instruction list - flexing ;;;
InstList_Etecoon_Flexing_0:
    dw Common_Instruction_TimerInY                                       ;A7E8D6;
    dw $0004                                                             ;A7E8D8;

InstList_Etecoon_Flexing_1:
    dw $0008,Spritemap_Etecoon_18                                        ;A7E8DA;
    dw $0008,Spritemap_Etecoon_19                                        ;A7E8DE;
    dw $0008,Spritemap_Etecoon_1A                                        ;A7E8E2;
    dw $0008,Spritemap_Etecoon_1B                                        ;A7E8E6;
    dw $0008,Spritemap_Etecoon_1A                                        ;A7E8EA;
    dw $0008,Spritemap_Etecoon_19                                        ;A7E8EE;
    dw Common_Instruction_DecrementTimer_GotoYIfNonZero_duplicate        ;A7E8F2;
    dw InstList_Etecoon_Flexing_1                                        ;A7E8F4;
    dw $0020,Spritemap_Etecoon_1C                                        ;A7E8F6;
    dw $0020,Spritemap_Etecoon_1E                                        ;A7E8FA;
    dw Common_Instruction_Sleep                                          ;A7E8FE;


;;; $E900: Etecoon constants ;;;
EtecoonConstants:
  .initialYVelocityOfHopsAndFailedJumps:
; Initial Y velocity of hops and failed jump
    dw $FFFD,$0000                                                       ;A7E900;

  .initialYVelocityOfSuccessfulJump:
; Initial Y velocity of successful jump
    dw $FFFC,$0000                                                       ;A7E904;

  .XVelocityRight:
; X velocity - right
    dw $0002,$0000                                                       ;A7E908;

  .XVelocityLeft:
; X velocity - left
    dw $FFFE,$0000                                                       ;A7E90C;

  .SamusXProximityThresholdAtBottomOfRoom:
; Samus X proximity threshold at bottom of room
    dw $0040                                                             ;A7E910;


;;; $E912: Initialisation AI - enemy $E5BF (etecoon) ;;;
InitAI_Etecoon:
    LDX.W EnemyIndex                                                     ;A7E912;
    LDA.W Enemy.properties,X                                             ;A7E915;
    ORA.W #$2000                                                         ;A7E918;
    STA.W Enemy.properties,X                                             ;A7E91B;
    LDA.W #Common_Spritemap_Nothing                                      ;A7E91E;
    STA.W Enemy.spritemap,X                                              ;A7E921;
    LDA.W #$0001                                                         ;A7E924;
    STA.W Enemy.instTimer,X                                              ;A7E927;
    STZ.W Enemy.loopCounter,X                                            ;A7E92A;
    LDA.W #InstList_Etecoon_Initial                                      ;A7E92D;
    STA.W Enemy.instList,X                                               ;A7E930;
    LDA.W #Function_Etecoon_Initial                                      ;A7E933;
    STA.W Etecoon.function,X                                             ;A7E936;
    LDA.W #$FFFF                                                         ;A7E939;
    STA.W Etecoon.functionTimer,X                                        ;A7E93C;
    RTL                                                                  ;A7E93F;


;;; $E940: Main AI - enemy $E5BF (etecoon) ;;;
MainAI_Etecoon:
    LDX.W EnemyIndex                                                     ;A7E940;
    LDA.W Etecoon.ID,X                                                   ;A7E943;
    BIT.W #$FF00                                                         ;A7E946;
    BEQ .executeFunction                                                 ;A7E949;
    SEC                                                                  ;A7E94B;
    SBC.W #$0100                                                         ;A7E94C;
    STA.W Etecoon.ID,X                                                   ;A7E94F;
    BRA .return                                                          ;A7E952;

  .executeFunction:
    JMP.W (Etecoon.function,X)                                           ;A7E954;

  .return:
    RTL                                                                  ;A7E957;


;;; $E958: Freeze etecoon if quake active ;;;
FreezeEtecoonIfQuakeActive:
    LDA.W EarthquakeTimer                                                ;A7E958;
    BEQ .return                                                          ;A7E95B;
    LDA.W Etecoon.ID,X                                                   ;A7E95D;
    AND.W #$00FF                                                         ;A7E960;
    ORA.W #$8000                                                         ;A7E963;
    STA.W Etecoon.ID,X                                                   ;A7E966;
    LDA.W Enemy.instTimer,X                                              ;A7E969;
    CLC                                                                  ;A7E96C;
    ADC.W #$0080                                                         ;A7E96D;
    STA.W Enemy.instTimer,X                                              ;A7E970;

  .return:
    RTS                                                                  ;A7E973;


;;; $E974: Etecoon horizontal movement ;;;
EtecoonHorizontalMovement:
;; Returns:
;;     Carry: Set if collision, clear otherwise
    LDA.W Etecoon.YVelocity,X                                            ;A7E974;
    STA.B DP_Temp14                                                      ;A7E977;
    LDA.W Etecoon.YSubVelocity,X                                         ;A7E979;
    STA.B DP_Temp12                                                      ;A7E97C;
    JSL.L MoveEnemyRightBy_14_12_IgnoreSlopes                            ;A7E97E;
    RTS                                                                  ;A7E982;


;;; $E983: Etecoon vertical movement ;;;
EtecoonVerticalMovement:
;; Returns:
;;     Carry: Set if collision, clear otherwise
    LDA.W Etecoon.XVelocity,X                                            ;A7E983;
    STA.B DP_Temp14                                                      ;A7E986;
    LDA.W Etecoon.XSubVelocity,X                                         ;A7E988;
    STA.B DP_Temp12                                                      ;A7E98B;
    LDA.W Etecoon.XVelocity,X                                            ;A7E98D;
    CMP.W #$0005                                                         ;A7E990;
    BPL .move                                                            ;A7E993;
    LDA.W Etecoon.XSubVelocity,X                                         ;A7E995;
    CLC                                                                  ;A7E998;
    ADC.L SamusYSubAcceleration                                          ;A7E999; >.<
    STA.W Etecoon.XSubVelocity,X                                         ;A7E99D;
    LDA.W Etecoon.XVelocity,X                                            ;A7E9A0;
    ADC.L SamusYAcceleration                                             ;A7E9A3; >.<
    STA.W Etecoon.XVelocity,X                                            ;A7E9A7;

  .move:
    JSL.L MoveEnemyDownBy_14_12                                          ;A7E9AA;
    RTS                                                                  ;A7E9AE;


;;; $E9AF: Etecoon function - initial ;;;
Function_Etecoon_Initial:
    LDA.W DoorTransitionFlagEnemiesPause                                 ;A7E9AF;
    BEQ .notDoorTransition                                               ;A7E9B2;
    RTL                                                                  ;A7E9B4;

  .notDoorTransition:
    LDA.W Etecoon.functionTimer,X                                        ;A7E9B5;
    BPL .positive                                                        ;A7E9B8;
    LDA.W #$0080                                                         ;A7E9BA;
    JSL.L IsSamusWithingAPixelRowsOfEnemy                                ;A7E9BD;
    TAY                                                                  ;A7E9C1;
    BEQ .return                                                          ;A7E9C2;
    LDA.W Etecoon.ID,X                                                   ;A7E9C4;
    BIT.W #$0003                                                         ;A7E9C7;
    BNE .flex                                                            ;A7E9CA;
    LDA.W #$0035                                                         ;A7E9CC;
    JSL.L QueueSound_Lib2_Max15                                          ;A7E9CF;

  .flex:
    LDA.W #$0001                                                         ;A7E9D3;
    STA.W Enemy.instTimer,X                                              ;A7E9D6;
    LDA.W #InstList_Etecoon_Flexing_0                                    ;A7E9D9;
    STA.W Enemy.instList,X                                               ;A7E9DC;
    LDA.W #$0100                                                         ;A7E9DF;
    STA.W Etecoon.functionTimer,X                                        ;A7E9E2;
    RTL                                                                  ;A7E9E5;

  .positive:
    DEC.W Etecoon.functionTimer,X                                        ;A7E9E6;
    BEQ .hop                                                             ;A7E9E9;
    BPL .return                                                          ;A7E9EB;

  .hop:
    LDA.W #InstList_Etecoon_Hopping_FacingLeft                           ;A7E9ED;
    STA.W Enemy.instList,X                                               ;A7E9F0;
    LDA.W #Function_Etecoon_StartHop_BottomOfRoom                        ;A7E9F3;
    STA.W Etecoon.function,X                                             ;A7E9F6;
    LDA.W #$000B                                                         ;A7E9F9;
    STA.W Etecoon.functionTimer,X                                        ;A7E9FC;

  .return:
    RTL                                                                  ;A7E9FF;


;;; $EA00: Etecoon function - start hop - bottom of room ;;;
Function_Etecoon_StartHop_BottomOfRoom:
    DEC.W Etecoon.functionTimer,X                                        ;A7EA00;
    BEQ .timerExpired                                                    ;A7EA03;
    BPL .return                                                          ;A7EA05;

  .timerExpired:
    LDA.W EtecoonConstants_initialYVelocityOfHopsAndFailedJumps          ;A7EA07;
    STA.W Etecoon.XVelocity,X                                            ;A7EA0A;
    LDA.W EtecoonConstants_initialYVelocityOfHopsAndFailedJumps+2        ;A7EA0D;
    STA.W Etecoon.XSubVelocity,X                                         ;A7EA10;
    LDA.W Enemy.instList,X                                               ;A7EA13;
    INC                                                                  ;A7EA16;
    INC                                                                  ;A7EA17;
    STA.W Enemy.instList,X                                               ;A7EA18;
    LDA.W #$0001                                                         ;A7EA1B;
    STA.W Enemy.instTimer,X                                              ;A7EA1E;
    LDA.W #Function_Etecoon_Hopping_BottomOfRoom                         ;A7EA21;
    STA.W Etecoon.function,X                                             ;A7EA24;
    LDA.W SamusXPosition                                                 ;A7EA27;
    CMP.W #$0100                                                         ;A7EA2A;
    BMI .return                                                          ;A7EA2D;
    LDA.W #$0033                                                         ;A7EA2F;
    JSL.L QueueSound_Lib2_Max6                                           ;A7EA32;

  .return:
    RTL                                                                  ;A7EA36;


;;; $EA37: Etecoon function - hopping - bottom of room ;;;
Function_Etecoon_Hopping_BottomOfRoom:
    JSR.W EtecoonVerticalMovement                                        ;A7EA37;
    BCS .collision                                                       ;A7EA3A;
    RTL                                                                  ;A7EA3C;

  .collision:
    LDA.W Etecoon.XVelocity,X                                            ;A7EA3D;
    BPL .notRising                                                       ;A7EA40;
    STZ.W Etecoon.XVelocity,X                                            ;A7EA42;
    STZ.W Etecoon.XSubVelocity,X                                         ;A7EA45;
    LDA.W #$0003                                                         ;A7EA48;
    STA.W Enemy.instTimer,X                                              ;A7EA4B;
    LDA.W #InstList_Etecoon_HitCeiling                                   ;A7EA4E;
    STA.W Enemy.instList,X                                               ;A7EA51;
    RTL                                                                  ;A7EA54;

  .notRising:
    LDA.W #$0040                                                         ;A7EA55;
    JSL.L IsSamusWithingAPixelRowsOfEnemy                                ;A7EA58;
    TAY                                                                  ;A7EA5C;
    BEQ .hopMore                                                         ;A7EA5D;
    LDA.W EtecoonConstants_SamusXProximityThresholdAtBottomOfRoom        ;A7EA5F;
    JSL.L IsSamusWithinAPixelColumnsOfEnemy                              ;A7EA62;
    TAY                                                                  ;A7EA66;
    BEQ .hopMore                                                         ;A7EA67;
    JSL.L DetermineDirectionOfSamusFromEnemy                             ;A7EA69;
    CMP.W #$0005                                                         ;A7EA6D;
    BPL .left                                                            ;A7EA70;
    LDA.W #InstList_Etecoon_LookRightAtSamusAndRunLeft                   ;A7EA72;
    STA.W Enemy.instList,X                                               ;A7EA75;
    STZ.W Etecoon.direction,X                                            ;A7EA78;
    BRA +                                                                ;A7EA7B;

  .left:
    LDA.W #InstList_Etecoon_LookLeftAtSamusAndRunRight                   ;A7EA7D;
    STA.W Enemy.instList,X                                               ;A7EA80;
    LDA.W #$0001                                                         ;A7EA83;
    STA.W Etecoon.direction,X                                            ;A7EA86;

+   LDA.W #$0020                                                         ;A7EA89;
    STA.W Etecoon.functionTimer,X                                        ;A7EA8C;
    LDA.W #$0001                                                         ;A7EA8F;
    STA.W Enemy.instTimer,X                                              ;A7EA92;
    LDA.W #Function_Etecoon_LookAtSamus                                  ;A7EA95;
    STA.W Etecoon.function,X                                             ;A7EA98;
    RTL                                                                  ;A7EA9B;

  .hopMore:
    LDA.W #$000B                                                         ;A7EA9C;
    STA.W Etecoon.functionTimer,X                                        ;A7EA9F;
    LDA.W #Function_Etecoon_StartHop_BottomOfRoom                        ;A7EAA2;
    STA.W Etecoon.function,X                                             ;A7EAA5;
    LDA.W #$0001                                                         ;A7EAA8;
    STA.W Enemy.instTimer,X                                              ;A7EAAB;
    LDA.W #InstList_Etecoon_Hopping_FacingLeft                           ;A7EAAE;
    STA.W Enemy.instList,X                                               ;A7EAB1;
    RTL                                                                  ;A7EAB4;


;;; $EAB5: Etecoon function - look at Samus ;;;
Function_Etecoon_LookAtSamus:
    DEC.W Etecoon.functionTimer,X                                        ;A7EAB5;
    BEQ .timerExpired                                                    ;A7EAB8;
    BPL .return                                                          ;A7EABA;

  .timerExpired:
    LDA.W Enemy.instList,X                                               ;A7EABC;
    INC                                                                  ;A7EABF;
    INC                                                                  ;A7EAC0;
    STA.W Enemy.instList,X                                               ;A7EAC1;
    LDA.W #$0001                                                         ;A7EAC4;
    STA.W Enemy.instTimer,X                                              ;A7EAC7;
    LDA.W Etecoon.direction,X                                            ;A7EACA;
    BEQ .left                                                            ;A7EACD;
    LDA.W EtecoonConstants_XVelocityRight                                ;A7EACF;
    STA.W Etecoon.YVelocity,X                                            ;A7EAD2;
    LDA.W EtecoonConstants_XVelocityRight+2                              ;A7EAD5;
    STA.W Etecoon.YSubVelocity,X                                         ;A7EAD8;
    LDA.W #Function_Etecoon_RunningRight                                 ;A7EADB;
    STA.W Etecoon.function,X                                             ;A7EADE;
    BRA +                                                                ;A7EAE1;

  .left:
    LDA.W EtecoonConstants_XVelocityLeft                                 ;A7EAE3;
    STA.W Etecoon.YVelocity,X                                            ;A7EAE6;
    LDA.W EtecoonConstants_XVelocityLeft+2                               ;A7EAE9;
    STA.W Etecoon.YSubVelocity,X                                         ;A7EAEC;
    LDA.W #Function_Etecoon_RunningLeft                                  ;A7EAEF;
    STA.W Etecoon.function,X                                             ;A7EAF2;

+   LDA.W EtecoonConstants_initialYVelocityOfHopsAndFailedJumps          ;A7EAF5;
    STA.W Etecoon.XVelocity,X                                            ;A7EAF8;
    LDA.W EtecoonConstants_initialYVelocityOfHopsAndFailedJumps+2        ;A7EAFB;
    STA.W Etecoon.XSubVelocity,X                                         ;A7EAFE;

  .return:
    RTL                                                                  ;A7EB01;


;;; $EB02: Etecoon function - running left ;;;
Function_Etecoon_RunningLeft:
    JSR.W EtecoonHorizontalMovement                                      ;A7EB02;
    BCC .return                                                          ;A7EB05;
    LDA.W EtecoonConstants_XVelocityRight                                ;A7EB07;
    STA.W Etecoon.YVelocity,X                                            ;A7EB0A;
    LDA.W EtecoonConstants_XVelocityRight+2                              ;A7EB0D;
    STA.W Etecoon.YSubVelocity,X                                         ;A7EB10;
    LDA.W #Function_Etecoon_RunningRight                                 ;A7EB13;
    STA.W Etecoon.function,X                                             ;A7EB16;
    LDA.W #$0001                                                         ;A7EB19;
    STA.W Enemy.instTimer,X                                              ;A7EB1C;
    LDA.W #InstList_Etecoon_RunningRight                                 ;A7EB1F;
    STA.W Enemy.instList,X                                               ;A7EB22;
    LDA.W #$0001                                                         ;A7EB25;
    STA.W Etecoon.direction,X                                            ;A7EB28;

  .return:
    RTL                                                                  ;A7EB2B;


;;; $EB2C: Etecoon function - running right ;;;
Function_Etecoon_RunningRight:
    LDA.W #$0020                                                         ;A7EB2C;
    STA.B DP_Temp14                                                      ;A7EB2F;
    STZ.B DP_Temp12                                                      ;A7EB31;
    JSL.L CheckForHorizontalSolidBlockCollision                          ;A7EB33;
    BCC .move                                                            ;A7EB37;
    LDA.W #$0001                                                         ;A7EB39;
    STA.W Enemy.instTimer,X                                              ;A7EB3C;
    LDA.W #InstList_Etecoon_JumpingRight                                 ;A7EB3F;
    STA.W Enemy.instList,X                                               ;A7EB42;
    LDA.W #Function_Etecoon_Jumping                                      ;A7EB45;
    STA.W Etecoon.function,X                                             ;A7EB48;
    RTL                                                                  ;A7EB4B;

  .move:
    JSR.W EtecoonHorizontalMovement                                      ;A7EB4C;
    RTL                                                                  ;A7EB4F;


;;; $EB50: Etecoon function - jumping ;;;
Function_Etecoon_Jumping:
    JSR.W FreezeEtecoonIfQuakeActive                                     ;A7EB50;
    JSR.W EtecoonHorizontalMovement                                      ;A7EB53;
    BCC .noWall                                                          ;A7EB56;
    LDA.W Etecoon.direction,X                                            ;A7EB58;
    BNE .leftEligible                                                    ;A7EB5B;
    LDA.W #InstList_Etecoon_WallJumpRightEligible                        ;A7EB5D;
    STA.W Enemy.instList,X                                               ;A7EB60;
    LDA.W #$0001                                                         ;A7EB63;
    STA.W Etecoon.direction,X                                            ;A7EB66;
    BRA +                                                                ;A7EB69;

  .leftEligible:
    LDA.W #InstList_Etecoon_WallJumpLeftEligible                         ;A7EB6B;
    STA.W Enemy.instList,X                                               ;A7EB6E;
    STZ.W Etecoon.direction,X                                            ;A7EB71;

+   LDA.W #$0001                                                         ;A7EB74;
    STA.W Enemy.instTimer,X                                              ;A7EB77;
    LDA.W #Function_Etecoon_WallJump                                     ;A7EB7A;
    STA.W Etecoon.function,X                                             ;A7EB7D;
    LDA.W #$0008                                                         ;A7EB80;
    STA.W Etecoon.functionTimer,X                                        ;A7EB83;
    LDA.W SamusXPosition                                                 ;A7EB86;
    CMP.W #$0100                                                         ;A7EB89;
    BMI .returnUpper                                                     ;A7EB8C;
    LDA.W #$0032                                                         ;A7EB8E;
    JSL.L QueueSound_Lib2_Max6                                           ;A7EB91;

  .returnUpper:
    RTL                                                                  ;A7EB95;

  .noWall:
    JSR.W EtecoonVerticalMovement                                        ;A7EB96;
    BCC .returnLower                                                     ;A7EB99;
    LDA.W Etecoon.direction,X                                            ;A7EB9B;
    BNE .hopLeft                                                         ;A7EB9E;
    LDA.W #InstList_Etecoon_Hopping_FacingRight                          ;A7EBA0;
    STA.W Enemy.instList,X                                               ;A7EBA3;
    BRA +                                                                ;A7EBA6;

  .hopLeft:
    LDA.W #InstList_Etecoon_Hopping_FacingLeft                           ;A7EBA8;
    STA.W Enemy.instList,X                                               ;A7EBAB;

+   LDA.W #$0001                                                         ;A7EBAE;
    STA.W Enemy.instTimer,X                                              ;A7EBB1;
    LDA.W #$000B                                                         ;A7EBB4;
    STA.W Etecoon.functionTimer,X                                        ;A7EBB7;
    LDA.W #Function_Etecoon_LandedFromJump                               ;A7EBBA;
    STA.W Etecoon.function,X                                             ;A7EBBD;
    LDA.W EtecoonConstants_initialYVelocityOfHopsAndFailedJumps          ;A7EBC0;
    STA.W Etecoon.XVelocity,X                                            ;A7EBC3;
    LDA.W EtecoonConstants_initialYVelocityOfHopsAndFailedJumps+2        ;A7EBC6;
    STA.W Etecoon.XSubVelocity,X                                         ;A7EBC9;

  .returnLower:
    RTL                                                                  ;A7EBCC;


;;; $EBCD: Etecoon function - wall jump ;;;
Function_Etecoon_WallJump:
    JSR.W FreezeEtecoonIfQuakeActive                                     ;A7EBCD;
    DEC.W Etecoon.functionTimer,X                                        ;A7EBD0;
    BEQ .timerExpired                                                    ;A7EBD3;
    BPL .return                                                          ;A7EBD5;

  .timerExpired:
    LDA.W Etecoon.direction,X                                            ;A7EBD7;
    BEQ .left                                                            ;A7EBDA;
    LDA.W #InstList_Etecoon_WallJumpRight                                ;A7EBDC;
    STA.W Enemy.instList,X                                               ;A7EBDF;
    LDA.W EtecoonConstants_XVelocityRight                                ;A7EBE2;
    STA.W Etecoon.YVelocity,X                                            ;A7EBE5;
    LDA.W EtecoonConstants_XVelocityRight+2                              ;A7EBE8;
    STA.W Etecoon.YSubVelocity,X                                         ;A7EBEB;
    BRA +                                                                ;A7EBEE;

  .left:
    LDA.W #InstList_Etecoon_WallJump_0                                   ;A7EBF0;
    STA.W Enemy.instList,X                                               ;A7EBF3;
    LDA.W EtecoonConstants_XVelocityLeft                                 ;A7EBF6;
    STA.W Etecoon.YVelocity,X                                            ;A7EBF9;
    LDA.W EtecoonConstants_XVelocityLeft+2                               ;A7EBFC;
    STA.W Etecoon.YSubVelocity,X                                         ;A7EBFF;

+   LDA.W #$0001                                                         ;A7EC02;
    STA.W Enemy.instTimer,X                                              ;A7EC05;
    LDA.W #Function_Etecoon_Jumping                                      ;A7EC08;
    STA.W Etecoon.function,X                                             ;A7EC0B;
    LDA.W EtecoonConstants_initialYVelocityOfHopsAndFailedJumps          ;A7EC0E;
    STA.W Etecoon.XVelocity,X                                            ;A7EC11;
    LDA.W EtecoonConstants_initialYVelocityOfHopsAndFailedJumps+2        ;A7EC14;
    STA.W Etecoon.XSubVelocity,X                                         ;A7EC17;

  .return:
    RTL                                                                  ;A7EC1A;


;;; $EC1B: Etecoon function - landed from jump ;;;
Function_Etecoon_LandedFromJump:
    DEC.W Etecoon.functionTimer,X                                        ;A7EC1B;
    BEQ .timerExpired                                                    ;A7EC1E;
    BPL .return                                                          ;A7EC20;

  .timerExpired:
    LDA.W EtecoonConstants_initialYVelocityOfHopsAndFailedJumps          ;A7EC22;
    STA.W Etecoon.XVelocity,X                                            ;A7EC25;
    LDA.W EtecoonConstants_initialYVelocityOfHopsAndFailedJumps+2        ;A7EC28;
    STA.W Etecoon.XSubVelocity,X                                         ;A7EC2B;
    TXY                                                                  ;A7EC2E;
    LDA.W Etecoon.ID,X                                                   ;A7EC2F;
    AND.W #$00FF                                                         ;A7EC32;
    ASL                                                                  ;A7EC35;
    TAX                                                                  ;A7EC36;
    JSR.W (.pointers,X)                                                  ;A7EC37;
    LDA.W #$0001                                                         ;A7EC3A;
    STA.W Enemy.instTimer,X                                              ;A7EC3D;

  .return:
    RTL                                                                  ;A7EC40;

  .pointers:
    dw RunToLeftRunUpPoint                                               ;A7EC41;
    dw RunToRightRunUpPoint                                              ;A7EC43;
    dw HopAtCenterRunUpPoint                                             ;A7EC45;


;;; $EC47: Run to left run-up point ;;;
RunToLeftRunUpPoint:
    TYX                                                                  ;A7EC47;
    LDA.W #Function_Etecoon_RunToLeftRunUpPoint                          ;A7EC48;
    STA.W Etecoon.function,X                                             ;A7EC4B;
    LDA.W #InstList_Etecoon_RunningLeft                                  ;A7EC4E;
    STA.W Enemy.instList,X                                               ;A7EC51;
    LDA.W EtecoonConstants_XVelocityLeft                                 ;A7EC54;
    STA.W Etecoon.YVelocity,X                                            ;A7EC57;
    LDA.W EtecoonConstants_XVelocityLeft+2                               ;A7EC5A;
    STA.W Etecoon.YSubVelocity,X                                         ;A7EC5D;
    RTS                                                                  ;A7EC60;


;;; $EC61: Run to right run-up point ;;;
RunToRightRunUpPoint:
    TYX                                                                  ;A7EC61;
    LDA.W #Function_Etecoon_RunToRightRunUpPoint                         ;A7EC62;
    STA.W Etecoon.function,X                                             ;A7EC65;
    LDA.W #InstList_Etecoon_RunningRight                                 ;A7EC68;
    STA.W Enemy.instList,X                                               ;A7EC6B;
    LDA.W EtecoonConstants_XVelocityRight                                ;A7EC6E;
    STA.W Etecoon.YVelocity,X                                            ;A7EC71;
    LDA.W EtecoonConstants_XVelocityRight+2                              ;A7EC74;
    STA.W Etecoon.YSubVelocity,X                                         ;A7EC77;
    RTS                                                                  ;A7EC7A;


;;; $EC7B: Hop at center run-up point ;;;
HopAtCenterRunUpPoint:
    TYX                                                                  ;A7EC7B;
    LDA.W #Function_Etecoon_Hopping_TopOfRoom                            ;A7EC7C;
    STA.W Etecoon.function,X                                             ;A7EC7F;
    LDA.W Enemy.instList,X                                               ;A7EC82;
    INC                                                                  ;A7EC85;
    INC                                                                  ;A7EC86;
    STA.W Enemy.instList,X                                               ;A7EC87;
    LDA.W EtecoonConstants_XVelocityRight                                ;A7EC8A;
    STA.W Etecoon.YVelocity,X                                            ;A7EC8D;
    LDA.W EtecoonConstants_XVelocityRight+2                              ;A7EC90;
    STA.W Etecoon.YSubVelocity,X                                         ;A7EC93;
    RTS                                                                  ;A7EC96;


;;; $EC97: Etecoon function - run to left run-up point ;;;
Function_Etecoon_RunToLeftRunUpPoint:
    JSR.W EtecoonHorizontalMovement                                      ;A7EC97;
    LDA.W Enemy.XPosition,X                                              ;A7EC9A;
    CMP.W #$0219                                                         ;A7EC9D;
    BPL .return                                                          ;A7ECA0;
    LDA.W #$000B                                                         ;A7ECA2;
    STA.W Etecoon.functionTimer,X                                        ;A7ECA5;
    LDA.W #Function_Etecoon_StartHop_TopOfRoom                           ;A7ECA8;
    STA.W Etecoon.function,X                                             ;A7ECAB;
    LDA.W #$0001                                                         ;A7ECAE;
    STA.W Enemy.instTimer,X                                              ;A7ECB1;
    LDA.W #InstList_Etecoon_Hopping_FacingLeft                           ;A7ECB4;
    STA.W Enemy.instList,X                                               ;A7ECB7;

  .return:
    RTL                                                                  ;A7ECBA;


;;; $ECBB: Etecoon function - run to right run-up point ;;;
Function_Etecoon_RunToRightRunUpPoint:
    JSR.W EtecoonHorizontalMovement                                      ;A7ECBB;
    LDA.W Enemy.XPosition,X                                              ;A7ECBE;
    CMP.W #$0258                                                         ;A7ECC1;
    BMI .return                                                          ;A7ECC4;
    LDA.W #$000B                                                         ;A7ECC6;
    STA.W Etecoon.functionTimer,X                                        ;A7ECC9;
    LDA.W #Function_Etecoon_StartHop_TopOfRoom                           ;A7ECCC;
    STA.W Etecoon.function,X                                             ;A7ECCF;
    LDA.W #$0001                                                         ;A7ECD2;
    STA.W Enemy.instTimer,X                                              ;A7ECD5;
    LDA.W #InstList_Etecoon_Hopping_FacingLeft                           ;A7ECD8;
    STA.W Enemy.instList,X                                               ;A7ECDB;

  .return:
    RTL                                                                  ;A7ECDE;


;;; $ECDF: Etecoon function - running for successful morph tunnel jump ;;;
Function_Etecoon_RunningForSuccessfulMorphTunnelJump:
    JSR.W EtecoonHorizontalMovement                                      ;A7ECDF;
    LDA.W Enemy.XPosition,X                                              ;A7ECE2;
    CMP.W #$0258                                                         ;A7ECE5;
    BMI .return                                                          ;A7ECE8;
    LDA.W #Function_Etecoon_SuccessfulMorphTunnelJump                    ;A7ECEA;
    STA.W Etecoon.function,X                                             ;A7ECED;
    LDA.W EtecoonConstants_initialYVelocityOfSuccessfulJump              ;A7ECF0;
    STA.W Etecoon.XVelocity,X                                            ;A7ECF3;
    LDA.W EtecoonConstants_initialYVelocityOfSuccessfulJump+2            ;A7ECF6;
    STA.W Etecoon.XSubVelocity,X                                         ;A7ECF9;
    LDA.W #$0001                                                         ;A7ECFC;
    STA.W Enemy.instTimer,X                                              ;A7ECFF;
    LDA.W #InstList_Etecoon_JumpingRight                                 ;A7ED02;
    STA.W Enemy.instList,X                                               ;A7ED05;

  .return:
    RTL                                                                  ;A7ED08;


;;; $ED09: Etecoon function - successful morph tunnel jump ;;;
Function_Etecoon_SuccessfulMorphTunnelJump:
    JSR.W EtecoonHorizontalMovement                                      ;A7ED09;
    JSR.W EtecoonVerticalMovement                                        ;A7ED0C;
    LDA.W Enemy.XPosition,X                                              ;A7ED0F;
    CMP.W #$02A8                                                         ;A7ED12;
    BMI .return                                                          ;A7ED15;
    LDA.W #$0001                                                         ;A7ED17;
    STA.W Enemy.instTimer,X                                              ;A7ED1A;
    LDA.W #InstList_Etecoon_RunningRight                                 ;A7ED1D;
    STA.W Enemy.instList,X                                               ;A7ED20;
    LDA.W #Function_Etecoon_RunningThroughMorphTunnel                    ;A7ED23;
    STA.W Etecoon.function,X                                             ;A7ED26;

  .return:
    RTL                                                                  ;A7ED29;


;;; $ED2A: Etecoon function - running through morph tunnel ;;;
Function_Etecoon_RunningThroughMorphTunnel:
    JSR.W EtecoonHorizontalMovement                                      ;A7ED2A;
    LDA.W Enemy.XPosition,X                                              ;A7ED2D;
    CMP.W #$0348                                                         ;A7ED30;
    BMI .return                                                          ;A7ED33;
    LDA.W #$0001                                                         ;A7ED35;
    STA.W Enemy.instTimer,X                                              ;A7ED38;
    LDA.W #InstList_Etecoon_JumpingRight                                 ;A7ED3B;
    STA.W Enemy.instList,X                                               ;A7ED3E;
    LDA.W #Function_Etecoon_FallingFromMorphTunnelLedge                  ;A7ED41;
    STA.W Etecoon.function,X                                             ;A7ED44;
    LDA.W #$FFFF                                                         ;A7ED47;
    STA.W Etecoon.XVelocity,X                                            ;A7ED4A;
    LDA.W EtecoonConstants_initialYVelocityOfSuccessfulJump+2            ;A7ED4D;
    STA.W Etecoon.XSubVelocity,X                                         ;A7ED50;

  .return:
    RTL                                                                  ;A7ED53;


;;; $ED54: Etecoon function - falling from morph tunnel ledge ;;;
Function_Etecoon_FallingFromMorphTunnelLedge:
    JSR.W EtecoonHorizontalMovement                                      ;A7ED54;
    JSR.W EtecoonVerticalMovement                                        ;A7ED57;
    BCC .return                                                          ;A7ED5A;
    LDA.W #$000B                                                         ;A7ED5C;
    STA.W Etecoon.functionTimer,X                                        ;A7ED5F;
    LDA.W #$0001                                                         ;A7ED62;
    STA.W Enemy.instTimer,X                                              ;A7ED65;
    LDA.W #InstList_Etecoon_Hopping_FacingLeft                           ;A7ED68;
    STA.W Enemy.instList,X                                               ;A7ED6B;
    LDA.W #Function_Etecoon_StartHop_TopOfRoom                           ;A7ED6E;
    STA.W Etecoon.function,X                                             ;A7ED71;

  .return:
    RTL                                                                  ;A7ED74;


;;; $ED75: Etecoon function - hopping - top of room ;;;
Function_Etecoon_Hopping_TopOfRoom:
    JSR.W FreezeEtecoonIfQuakeActive                                     ;A7ED75;
    JSR.W EtecoonVerticalMovement                                        ;A7ED78;
    BCS .collision                                                       ;A7ED7B;
    RTL                                                                  ;A7ED7D;

  .collision:
    LDA.W Etecoon.XVelocity,X                                            ;A7ED7E;
    BPL .rising                                                          ;A7ED81;
    STZ.W Etecoon.XVelocity,X                                            ;A7ED83;
    STZ.W Etecoon.XSubVelocity,X                                         ;A7ED86;
    LDA.W #$0003                                                         ;A7ED89;
    STA.W Enemy.instTimer,X                                              ;A7ED8C;
    LDA.W #InstList_Etecoon_HitCeiling                                   ;A7ED8F;
    STA.W Enemy.instList,X                                               ;A7ED92;
    RTL                                                                  ;A7ED95;

  .rising:
    LDA.W #$000B                                                         ;A7ED96;
    STA.W Etecoon.functionTimer,X                                        ;A7ED99;
    LDA.W #$0001                                                         ;A7ED9C;
    STA.W Enemy.instTimer,X                                              ;A7ED9F;
    LDA.W #InstList_Etecoon_Hopping_FacingLeft                           ;A7EDA2;
    STA.W Enemy.instList,X                                               ;A7EDA5;
    LDA.W Etecoon.ID,X                                                   ;A7EDA8;
    BIT.W #$0002                                                         ;A7EDAB;
    BNE .successEtecoon                                                  ;A7EDAE;

  .hop:
    LDA.W #Function_Etecoon_StartHop_TopOfRoom                           ;A7EDB0;
    STA.W Etecoon.function,X                                             ;A7EDB3;
    BRA .return                                                          ;A7EDB6;

  .successEtecoon:
    LDA.W Enemy.XPosition,X                                              ;A7EDB8;
    CMP.W #$0340                                                         ;A7EDBB;
    BPL .hop                                                             ;A7EDBE;
    LDA.W #Function_Etecoon_HopUntilSamusIsNear                          ;A7EDC0;
    STA.W Etecoon.function,X                                             ;A7EDC3;

  .return:
    RTL                                                                  ;A7EDC6;


;;; $EDC7: Etecoon function - start hop - top of room ;;;
Function_Etecoon_StartHop_TopOfRoom:
    JSR.W FreezeEtecoonIfQuakeActive                                     ;A7EDC7;
    DEC.W Etecoon.functionTimer,X                                        ;A7EDCA;
    BEQ .timerExpired                                                    ;A7EDCD;
    BPL .return                                                          ;A7EDCF;

  .timerExpired:
    LDA.W Etecoon.direction,X                                            ;A7EDD1;
    CLC                                                                  ;A7EDD4;
    ADC.W #$0100                                                         ;A7EDD5;
    STA.W Etecoon.direction,X                                            ;A7EDD8;
    AND.W #$FF00                                                         ;A7EDDB;
    CMP.W #$0400                                                         ;A7EDDE;
    BMI .notFailedJump                                                   ;A7EDE1;
    LDA.W Etecoon.direction,X                                            ;A7EDE3;
    AND.W #$00FF                                                         ;A7EDE6;
    STA.W Etecoon.direction,X                                            ;A7EDE9;
    LDA.W Etecoon.ID,X                                                   ;A7EDEC;
    BIT.W #$0002                                                         ;A7EDEF;
    BNE .notFailedJump                                                   ;A7EDF2;
    LDA.W #Function_Etecoon_RunningForFailedMorphTunnelJump              ;A7EDF4;
    STA.W Etecoon.function,X                                             ;A7EDF7;
    LDA.W #InstList_Etecoon_RunningRight                                 ;A7EDFA;
    STA.W Enemy.instList,X                                               ;A7EDFD;
    LDA.W EtecoonConstants_XVelocityRight                                ;A7EE00;
    STA.W Etecoon.YVelocity,X                                            ;A7EE03;
    LDA.W EtecoonConstants_XVelocityRight+2                              ;A7EE06;
    STA.W Etecoon.YSubVelocity,X                                         ;A7EE09;
    BRA .merge                                                           ;A7EE0C;

  .notFailedJump:
    LDA.W #Function_Etecoon_Hopping_TopOfRoom                            ;A7EE0E;
    STA.W Etecoon.function,X                                             ;A7EE11;
    LDA.W Enemy.instList,X                                               ;A7EE14;
    INC                                                                  ;A7EE17;
    INC                                                                  ;A7EE18;
    STA.W Enemy.instList,X                                               ;A7EE19;

  .merge:
    LDA.W EtecoonConstants_initialYVelocityOfHopsAndFailedJumps          ;A7EE1C;
    STA.W Etecoon.XVelocity,X                                            ;A7EE1F;
    LDA.W EtecoonConstants_initialYVelocityOfHopsAndFailedJumps+2        ;A7EE22;
    STA.W Etecoon.XSubVelocity,X                                         ;A7EE25;
    LDA.W #$0001                                                         ;A7EE28;
    STA.W Enemy.instTimer,X                                              ;A7EE2B;
    LDA.W SamusXPosition                                                 ;A7EE2E;
    CMP.W #$0100                                                         ;A7EE31;
    BMI .return                                                          ;A7EE34;
    LDA.W #$0033                                                         ;A7EE36;
    JSL.L QueueSound_Lib2_Max6                                           ;A7EE39;

  .return:
    RTL                                                                  ;A7EE3D;


;;; $EE3E: Etecoon function - hop until Samus is near ;;;
Function_Etecoon_HopUntilSamusIsNear:
    JSR.W FreezeEtecoonIfQuakeActive                                     ;A7EE3E;
    DEC.W Etecoon.functionTimer,X                                        ;A7EE41;
    BEQ .timerExpired                                                    ;A7EE44;
    BPL .return                                                          ;A7EE46;

  .timerExpired:
    LDA.W #$0040                                                         ;A7EE48;
    JSL.L IsSamusWithingAPixelRowsOfEnemy                                ;A7EE4B;
    TAY                                                                  ;A7EE4F;
    BEQ .notClose                                                        ;A7EE50;
    LDA.W #$0030                                                         ;A7EE52;
    JSL.L IsSamusWithinAPixelColumnsOfEnemy                              ;A7EE55;
    TAY                                                                  ;A7EE59;
    BEQ .notClose                                                        ;A7EE5A;
    LDA.W #InstList_Etecoon_RunningRight                                 ;A7EE5C;
    STA.W Enemy.instList,X                                               ;A7EE5F;
    LDA.W #Function_Etecoon_RunningForSuccessfulMorphTunnelJump          ;A7EE62;
    STA.W Etecoon.function,X                                             ;A7EE65;
    BRA .skipSFX                                                         ;A7EE68;

  .notClose:
    LDA.W EtecoonConstants_initialYVelocityOfHopsAndFailedJumps          ;A7EE6A;
    STA.W Etecoon.XVelocity,X                                            ;A7EE6D;
    LDA.W EtecoonConstants_initialYVelocityOfHopsAndFailedJumps+2        ;A7EE70;
    STA.W Etecoon.XSubVelocity,X                                         ;A7EE73;
    LDA.W Enemy.instList,X                                               ;A7EE76;
    INC                                                                  ;A7EE79;
    INC                                                                  ;A7EE7A;
    STA.W Enemy.instList,X                                               ;A7EE7B;
    LDA.W #Function_Etecoon_Hopping_TopOfRoom                            ;A7EE7E;
    STA.W Etecoon.function,X                                             ;A7EE81;
    LDA.W SamusXPosition                                                 ;A7EE84;
    CMP.W #$0100                                                         ;A7EE87;
    BMI .skipSFX                                                         ;A7EE8A;
    LDA.W #$0033                                                         ;A7EE8C;
    JSL.L QueueSound_Lib2_Max6                                           ;A7EE8F;

  .skipSFX:
    LDA.W #$0001                                                         ;A7EE93;
    STA.W Enemy.instTimer,X                                              ;A7EE96;

  .return:
    RTL                                                                  ;A7EE99;


;;; $EE9A: Etecoon function - running for failed morph tunnel jump ;;;
Function_Etecoon_RunningForFailedMorphTunnelJump:
    JSR.W EtecoonHorizontalMovement                                      ;A7EE9A;
    LDA.W Enemy.XPosition,X                                              ;A7EE9D;
    CMP.W #$0258                                                         ;A7EEA0;
    BMI .return                                                          ;A7EEA3;
    LDA.W #Function_Etecoon_FailedTunnelJump                             ;A7EEA5;
    STA.W Etecoon.function,X                                             ;A7EEA8;
    LDA.W #$0001                                                         ;A7EEAB;
    STA.W Enemy.instTimer,X                                              ;A7EEAE;
    LDA.W #InstList_Etecoon_JumpingRight                                 ;A7EEB1;
    STA.W Enemy.instList,X                                               ;A7EEB4;

  .return:
    RTL                                                                  ;A7EEB7;


;;; $EEB8: Etecoon function - failed tunnel jump ;;;
Function_Etecoon_FailedTunnelJump:
    JSR.W EtecoonHorizontalMovement                                      ;A7EEB8;
    JSR.W EtecoonVerticalMovement                                        ;A7EEBB;
    BCC .return                                                          ;A7EEBE;
    LDA.W EtecoonConstants_XVelocityLeft                                 ;A7EEC0;
    STA.W Etecoon.YVelocity,X                                            ;A7EEC3;
    LDA.W EtecoonConstants_XVelocityLeft+2                               ;A7EEC6;
    STA.W Etecoon.YSubVelocity,X                                         ;A7EEC9;
    LDA.W #Function_Etecoon_RunningLeft                                  ;A7EECC;
    STA.W Etecoon.function,X                                             ;A7EECF;
    LDA.W EtecoonConstants_initialYVelocityOfHopsAndFailedJumps          ;A7EED2;
    STA.W Etecoon.XVelocity,X                                            ;A7EED5;
    LDA.W EtecoonConstants_initialYVelocityOfHopsAndFailedJumps+2        ;A7EED8;
    STA.W Etecoon.XSubVelocity,X                                         ;A7EEDB;
    LDA.W #$0001                                                         ;A7EEDE;
    STA.W Enemy.instTimer,X                                              ;A7EEE1;
    LDA.W #InstList_Etecoon_RunningLeft                                  ;A7EEE4;
    STA.W Enemy.instList,X                                               ;A7EEE7;

  .return:
    RTL                                                                  ;A7EEEA;


;;; $EEEB: RTL ;;;
RTL_A7EEEB:
    RTL                                                                  ;A7EEEB;


;;; $EEEC: RTL ;;;
RTL_A7EEEC:
    RTL                                                                  ;A7EEEC;


;;; $EEED: Spritemaps ;;;
Spritemap_Etecoon_0:
    dw $0003                                                             ;A7EEED;
    %spritemapEntry(0, $1F2, $FF, 0, 0, 3, 1, $129)
    %spritemapEntry(1, $43F5, $EF, 0, 0, 3, 1, $100)
    %spritemapEntry(1, $43FA, $F7, 0, 0, 3, 1, $102)

Spritemap_Etecoon_1:
    dw $0002                                                             ;A7EEFE;
    %spritemapEntry(1, $43F5, $F0, 0, 0, 3, 1, $100)
    %spritemapEntry(1, $43FA, $F8, 0, 0, 3, 1, $104)

Spritemap_Etecoon_2:
    dw $0002                                                             ;A7EF0A;
    %spritemapEntry(1, $43F5, $F1, 0, 0, 3, 1, $100)
    %spritemapEntry(1, $43FA, $F9, 0, 0, 3, 1, $106)

Spritemap_Etecoon_3:
    dw $0003                                                             ;A7EF16;
    %spritemapEntry(0, $00, $06, 0, 0, 3, 1, $126)
    %spritemapEntry(0, $1F8, $06, 0, 0, 3, 1, $125)
    %spritemapEntry(1, $43F8, $F6, 0, 0, 3, 1, $108)

Spritemap_Etecoon_4:
    dw $0003                                                             ;A7EF27;
    %spritemapEntry(0, $06, $F8, 0, 0, 3, 1, $127)
    %spritemapEntry(0, $06, $00, 0, 0, 3, 1, $128)
    %spritemapEntry(1, $43F6, $F8, 0, 0, 3, 1, $10A)

Spritemap_Etecoon_5:
    dw $0003                                                             ;A7EF38;
    %spritemapEntry(0, $00, $F2, 1, 0, 3, 1, $126)
    %spritemapEntry(0, $1F8, $F2, 1, 0, 3, 1, $125)
    %spritemapEntry(1, $43F8, $FA, 1, 1, 3, 1, $108)

Spritemap_Etecoon_6:
    dw $0003                                                             ;A7EF49;
    %spritemapEntry(0, $1F2, $F8, 0, 1, 3, 1, $127)
    %spritemapEntry(0, $1F2, $00, 0, 1, 3, 1, $128)
    %spritemapEntry(1, $43FA, $F8, 1, 1, 3, 1, $10A)

Spritemap_Etecoon_7:
    dw $0003                                                             ;A7EF5A;
    %spritemapEntry(0, $08, $02, 0, 0, 3, 1, $12E)
    %spritemapEntry(1, $43F3, $F3, 0, 0, 3, 1, $100)
    %spritemapEntry(1, $43F8, $FA, 0, 0, 3, 1, $10E)

Spritemap_Etecoon_8:
    dw $0007                                                             ;A7EF6B;
    %spritemapEntry(0, $01, $FE, 0, 1, 3, 1, $122)
    %spritemapEntry(0, $1F8, $FE, 0, 0, 3, 1, $122)
    %spritemapEntry(1, $43F8, $F2, 0, 1, 3, 1, $10C)
    %spritemapEntry(0, $1F9, $01, 0, 0, 3, 1, $124)
    %spritemapEntry(0, $00, $01, 0, 1, 3, 1, $124)
    %spritemapEntry(0, $1F9, $FA, 0, 0, 3, 1, $120)
    %spritemapEntry(0, $00, $FA, 0, 1, 3, 1, $120)

Spritemap_Etecoon_9:
    dw $0007                                                             ;A7EF90;
    %spritemapEntry(0, $1F7, $FC, 0, 0, 3, 1, $122)
    %spritemapEntry(0, $02, $FC, 0, 1, 3, 1, $122)
    %spritemapEntry(1, $43F8, $F1, 0, 1, 3, 1, $10C)
    %spritemapEntry(0, $1F9, $01, 0, 0, 3, 1, $123)
    %spritemapEntry(0, $00, $01, 0, 1, 3, 1, $123)
    %spritemapEntry(0, $1F9, $FA, 0, 0, 3, 1, $120)
    %spritemapEntry(0, $00, $FA, 0, 1, 3, 1, $120)

Spritemap_Etecoon_A:
    dw $0007                                                             ;A7EFB5;
    %spritemapEntry(0, $1F9, $01, 0, 0, 3, 1, $123)
    %spritemapEntry(0, $00, $01, 0, 1, 3, 1, $123)
    %spritemapEntry(1, $43F8, $EF, 0, 1, 3, 1, $10C)
    %spritemapEntry(0, $1F9, $F9, 0, 0, 3, 1, $120)
    %spritemapEntry(0, $00, $F9, 0, 1, 3, 1, $120)
    %spritemapEntry(0, $1F5, $F9, 0, 0, 3, 1, $121)
    %spritemapEntry(0, $04, $F9, 0, 1, 3, 1, $121)

Spritemap_Etecoon_B:
    dw $0007                                                             ;A7EFDA;
    %spritemapEntry(0, $1F9, $01, 0, 0, 3, 1, $123)
    %spritemapEntry(0, $00, $01, 0, 1, 3, 1, $123)
    %spritemapEntry(1, $43F8, $EF, 0, 1, 3, 1, $10C)
    %spritemapEntry(0, $1F9, $F9, 0, 0, 3, 1, $120)
    %spritemapEntry(0, $00, $F9, 0, 1, 3, 1, $120)
    %spritemapEntry(0, $1F5, $F7, 0, 0, 3, 1, $121)
    %spritemapEntry(0, $04, $F7, 0, 1, 3, 1, $121)

Spritemap_Etecoon_C:
    dw $0007                                                             ;A7EFFF;
    %spritemapEntry(1, $43F8, $F0, 0, 0, 3, 1, $100)
    %spritemapEntry(0, $02, $FC, 0, 1, 3, 1, $122)
    %spritemapEntry(0, $1F7, $FC, 0, 0, 3, 1, $122)
    %spritemapEntry(0, $1F9, $02, 0, 0, 3, 1, $124)
    %spritemapEntry(0, $00, $02, 0, 1, 3, 1, $124)
    %spritemapEntry(0, $1F9, $FA, 0, 0, 3, 1, $120)
    %spritemapEntry(0, $00, $FA, 0, 1, 3, 1, $120)

Spritemap_Etecoon_D:
    dw $0007                                                             ;A7F024;
    %spritemapEntry(0, $02, $FC, 0, 1, 3, 1, $122)
    %spritemapEntry(0, $1F7, $FC, 0, 0, 3, 1, $122)
    %spritemapEntry(1, $43F8, $F0, 0, 1, 3, 1, $10C)
    %spritemapEntry(0, $1F9, $02, 0, 0, 3, 1, $124)
    %spritemapEntry(0, $00, $02, 0, 1, 3, 1, $124)
    %spritemapEntry(0, $1F9, $FA, 0, 0, 3, 1, $120)
    %spritemapEntry(0, $00, $FA, 0, 1, 3, 1, $120)

Spritemap_Etecoon_E:
    dw $0007                                                             ;A7F049;
    %spritemapEntry(1, $43F8, $F0, 0, 1, 3, 1, $100)
    %spritemapEntry(0, $02, $FC, 0, 1, 3, 1, $122)
    %spritemapEntry(0, $1F7, $FC, 0, 0, 3, 1, $122)
    %spritemapEntry(0, $1F9, $02, 0, 0, 3, 1, $124)
    %spritemapEntry(0, $00, $02, 0, 1, 3, 1, $124)
    %spritemapEntry(0, $1F9, $FA, 0, 0, 3, 1, $120)
    %spritemapEntry(0, $00, $FA, 0, 1, 3, 1, $120)

Spritemap_Etecoon_F:
    dw $0005                                                             ;A7F06E;
    %spritemapEntry(1, $43F6, $F2, 0, 0, 3, 1, $100)
    %spritemapEntry(0, $00, $00, 0, 0, 3, 1, $12D)
    %spritemapEntry(0, $1F8, $00, 0, 0, 3, 1, $12C)
    %spritemapEntry(0, $00, $F8, 0, 0, 3, 1, $12B)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 1, $12A)

Spritemap_Etecoon_10:
    dw $0003                                                             ;A7F089;
    %spritemapEntry(0, $06, $FF, 0, 1, 3, 1, $129)
    %spritemapEntry(1, $43FB, $EF, 0, 1, 3, 1, $100)
    %spritemapEntry(1, $43F6, $F7, 0, 1, 3, 1, $102)

Spritemap_Etecoon_11:
    dw $0002                                                             ;A7F09A;
    %spritemapEntry(1, $43FB, $F0, 0, 1, 3, 1, $100)
    %spritemapEntry(1, $43F6, $F8, 0, 1, 3, 1, $104)

Spritemap_Etecoon_12:
    dw $0002                                                             ;A7F0A6;
    %spritemapEntry(1, $43FB, $F1, 0, 1, 3, 1, $100)
    %spritemapEntry(1, $43F6, $F9, 0, 1, 3, 1, $106)

Spritemap_Etecoon_13:
    dw $0003                                                             ;A7F0B2;
    %spritemapEntry(0, $1F8, $06, 0, 1, 3, 1, $126)
    %spritemapEntry(0, $00, $06, 0, 1, 3, 1, $125)
    %spritemapEntry(1, $43F8, $F6, 0, 1, 3, 1, $108)

Spritemap_Etecoon_14:
    dw $0003                                                             ;A7F0C3;
    %spritemapEntry(0, $1F2, $F8, 0, 1, 3, 1, $127)
    %spritemapEntry(0, $1F2, $00, 0, 1, 3, 1, $128)
    %spritemapEntry(1, $43FA, $F8, 0, 1, 3, 1, $10A)

Spritemap_Etecoon_15:
    dw $0003                                                             ;A7F0D4;
    %spritemapEntry(0, $1F8, $F2, 1, 1, 3, 1, $126)
    %spritemapEntry(0, $00, $F2, 1, 1, 3, 1, $125)
    %spritemapEntry(1, $43F8, $FA, 1, 0, 3, 1, $108)

Spritemap_Etecoon_16:
    dw $0003                                                             ;A7F0E5;
    %spritemapEntry(0, $06, $F8, 0, 0, 3, 1, $127)
    %spritemapEntry(0, $06, $00, 0, 0, 3, 1, $128)
    %spritemapEntry(1, $43F6, $F8, 1, 0, 3, 1, $10A)

Spritemap_Etecoon_17:
    dw $0003                                                             ;A7F0F6;
    %spritemapEntry(0, $1F0, $02, 0, 1, 3, 1, $12E)
    %spritemapEntry(1, $43FD, $F3, 0, 1, 3, 1, $100)
    %spritemapEntry(1, $43F8, $FA, 0, 1, 3, 1, $10E)

Spritemap_Etecoon_18:
    dw $0007                                                             ;A7F107;
    %spritemapEntry(0, $1F7, $FE, 0, 0, 3, 1, $122)
    %spritemapEntry(0, $00, $FE, 0, 1, 3, 1, $122)
    %spritemapEntry(1, $43F8, $F2, 0, 0, 3, 1, $10C)
    %spritemapEntry(0, $1FF, $01, 0, 1, 3, 1, $124)
    %spritemapEntry(0, $1F8, $01, 0, 0, 3, 1, $124)
    %spritemapEntry(0, $1FF, $FA, 0, 1, 3, 1, $120)
    %spritemapEntry(0, $1F8, $FA, 0, 0, 3, 1, $120)

Spritemap_Etecoon_19:
    dw $0007                                                             ;A7F12C;
    %spritemapEntry(0, $01, $FC, 0, 1, 3, 1, $122)
    %spritemapEntry(0, $1F6, $FC, 0, 0, 3, 1, $122)
    %spritemapEntry(1, $43F8, $F1, 0, 0, 3, 1, $10C)
    %spritemapEntry(0, $1FF, $01, 0, 1, 3, 1, $123)
    %spritemapEntry(0, $1F8, $01, 0, 0, 3, 1, $123)
    %spritemapEntry(0, $1FF, $FA, 0, 1, 3, 1, $120)
    %spritemapEntry(0, $1F8, $FA, 0, 0, 3, 1, $120)

Spritemap_Etecoon_1A:
    dw $0007                                                             ;A7F151;
    %spritemapEntry(0, $1FF, $01, 0, 1, 3, 1, $123)
    %spritemapEntry(0, $1F8, $01, 0, 0, 3, 1, $123)
    %spritemapEntry(1, $43F8, $EF, 0, 0, 3, 1, $10C)
    %spritemapEntry(0, $1FF, $F9, 0, 1, 3, 1, $120)
    %spritemapEntry(0, $1F8, $F9, 0, 0, 3, 1, $120)
    %spritemapEntry(0, $03, $F9, 0, 1, 3, 1, $121)
    %spritemapEntry(0, $1F4, $F9, 0, 0, 3, 1, $121)

Spritemap_Etecoon_1B:
    dw $0007                                                             ;A7F176;
    %spritemapEntry(0, $1FF, $01, 0, 1, 3, 1, $123)
    %spritemapEntry(0, $1F8, $01, 0, 0, 3, 1, $123)
    %spritemapEntry(1, $43F8, $EF, 0, 0, 3, 1, $10C)
    %spritemapEntry(0, $1FF, $F9, 0, 1, 3, 1, $120)
    %spritemapEntry(0, $1F8, $F9, 0, 0, 3, 1, $120)
    %spritemapEntry(0, $03, $F7, 0, 1, 3, 1, $121)
    %spritemapEntry(0, $1F4, $F7, 0, 0, 3, 1, $121)

Spritemap_Etecoon_1C:
    dw $0007                                                             ;A7F19B;
    %spritemapEntry(1, $43F8, $F0, 0, 1, 3, 1, $100)
    %spritemapEntry(0, $1F6, $FC, 0, 0, 3, 1, $122)
    %spritemapEntry(0, $01, $FC, 0, 1, 3, 1, $122)
    %spritemapEntry(0, $1FF, $02, 0, 1, 3, 1, $124)
    %spritemapEntry(0, $1F8, $02, 0, 0, 3, 1, $124)
    %spritemapEntry(0, $1FF, $FA, 0, 1, 3, 1, $120)
    %spritemapEntry(0, $1F8, $FA, 0, 0, 3, 1, $120)

Spritemap_Etecoon_1D:
    dw $0007                                                             ;A7F1C0;
    %spritemapEntry(0, $1F6, $FC, 0, 0, 3, 1, $122)
    %spritemapEntry(0, $01, $FC, 0, 1, 3, 1, $122)
    %spritemapEntry(1, $43F8, $F0, 0, 0, 3, 1, $10C)
    %spritemapEntry(0, $1FF, $02, 0, 1, 3, 1, $124)
    %spritemapEntry(0, $1F8, $02, 0, 0, 3, 1, $124)
    %spritemapEntry(0, $1FF, $FA, 0, 1, 3, 1, $120)
    %spritemapEntry(0, $1F8, $FA, 0, 0, 3, 1, $120)

Spritemap_Etecoon_1E:
    dw $0007                                                             ;A7F1E5;
    %spritemapEntry(1, $43F8, $F0, 0, 0, 3, 1, $100)
    %spritemapEntry(0, $1F6, $FC, 0, 0, 3, 1, $122)
    %spritemapEntry(0, $01, $FC, 0, 1, 3, 1, $122)
    %spritemapEntry(0, $1FF, $02, 0, 1, 3, 1, $124)
    %spritemapEntry(0, $1F8, $02, 0, 0, 3, 1, $124)
    %spritemapEntry(0, $1FF, $FA, 0, 1, 3, 1, $120)
    %spritemapEntry(0, $1F8, $FA, 0, 0, 3, 1, $120)

Spritemap_Etecoon_1F:
    dw $0005                                                             ;A7F20A;
    %spritemapEntry(1, $43FA, $F2, 0, 1, 3, 1, $100)
    %spritemapEntry(0, $1F8, $00, 0, 1, 3, 1, $12D)
    %spritemapEntry(0, $00, $00, 0, 1, 3, 1, $12C)
    %spritemapEntry(0, $1F8, $F8, 0, 1, 3, 1, $12B)
    %spritemapEntry(0, $00, $F8, 0, 1, 3, 1, $12A)


;;; $F225: Palettes ;;;
; Default
Palette_Dachora:
    dw $3800,$3F57,$2E4D,$00E2,$0060,$3AB0,$220B,$1166                   ;A7F225;
    dw $0924,$57FF,$42F7,$2610,$158C,$7C1F,$6018,$300A                   ;A7F235;

; Speed boosting
Palette_Dachora_SpeedBoosting_0:
    dw $1580,$3F57,$2E4D,$00E2,$0060,$3AB0,$220B,$1166                   ;A7F245;
    dw $0924,$57FF,$42F7,$2610,$158C,$7C1F,$6018,$300A                   ;A7F255;

Palette_Dachora_SpeedBoosting_1:
    dw $3800,$5357,$424D,$14E2,$1460,$4EB0,$360B,$2566                   ;A7F265;
    dw $1D24,$63FF,$56F7,$3A10,$298C,$7C1F,$6818,$440A                   ;A7F275;

Palette_Dachora_SpeedBoosting_2:
    dw $3800,$6B57,$5A4D,$2CE2,$2C60,$66B0,$4E0B,$3D66                   ;A7F285;
    dw $3524,$73FF,$6AF7,$5210,$418C,$7C1F,$7418,$5C0A                   ;A7F295;

Palette_Dachora_SpeedBoosting_3:
    dw $3800,$7F57,$6E4D,$40E2,$4060,$7AB0,$620B,$5166                   ;A7F2A5;
    dw $4924,$7FFF,$7EF7,$6610,$558C,$7C1F,$7C18,$700A                   ;A7F2B5;

; Shine (both stored and shinespark)
Palette_Dachora_Shine_0:
    dw $3800,$3F57,$2E4D,$00E2,$0060,$3AB0,$220B,$1166                   ;A7F2C5;
    dw $0924,$57FF,$42F7,$2610,$158C,$7C1F,$6018,$300A                   ;A7F2D5;

Palette_Dachora_Shine_1:
    dw $3800,$4B78,$3E90,$1967,$1906,$46F3,$326F,$25EB                   ;A7F2E5;
    dw $1DA9,$5FFF,$4F18,$3673,$29EF,$7CDF,$64D9,$3CCE                   ;A7F2F5;

Palette_Dachora_Shine_2:
    dw $3800,$579A,$4EF4,$320D,$31CC,$5336,$46D3,$3A70                   ;A7F305;
    dw $362E,$67FF,$5B5A,$46D6,$3E73,$7D9F,$699A,$4D92                   ;A7F315;

Palette_Dachora_Shine_3:
    dw $3800,$63BB,$5F37,$4AB3,$4A72,$6379,$5737,$52F5                   ;A7F325;
    dw $4ED4,$6FFF,$677B,$5B39,$52F7,$7E5F,$725C,$5E56                   ;A7F335;


;;; $F345: Instruction list - running left ;;;
InstList_Dachora_RunningLeft:
    dw $0005,Spritemap_Dachora_0                                         ;A7F345;
    dw $0005,Spritemap_Dachora_1                                         ;A7F349;
    dw $0005,Spritemap_Dachora_2                                         ;A7F34D;
    dw $0005,Spritemap_Dachora_3                                         ;A7F351;
    dw $0005,Spritemap_Dachora_4                                         ;A7F355;
    dw $0005,Spritemap_Dachora_5                                         ;A7F359;
    dw Common_Instruction_GotoY                                          ;A7F35D;
    dw InstList_Dachora_RunningLeft                                      ;A7F35F;

InstList_Dachora_RunningLeft_FastAnimation:
    dw $0003,Spritemap_Dachora_0                                         ;A7F361;
    dw $0003,Spritemap_Dachora_1                                         ;A7F365;
    dw $0003,Spritemap_Dachora_2                                         ;A7F369;
    dw $0003,Spritemap_Dachora_3                                         ;A7F36D;
    dw $0003,Spritemap_Dachora_4                                         ;A7F371;
    dw $0003,Spritemap_Dachora_5                                         ;A7F375;
    dw Common_Instruction_GotoY                                          ;A7F379;
    dw InstList_Dachora_RunningLeft_FastAnimation                        ;A7F37B;

InstList_Dachora_RunningLeft_VeryFastAnimation:
    dw $0001,Spritemap_Dachora_0                                         ;A7F37D;
    dw $0001,Spritemap_Dachora_1                                         ;A7F381;
    dw $0001,Spritemap_Dachora_2                                         ;A7F385;
    dw $0001,Spritemap_Dachora_3                                         ;A7F389;
    dw $0001,Spritemap_Dachora_4                                         ;A7F38D;
    dw $0001,Spritemap_Dachora_5                                         ;A7F391;
    dw Common_Instruction_GotoY                                          ;A7F395;
    dw InstList_Dachora_RunningLeft_VeryFastAnimation                    ;A7F397;


;;; $F399: Instruction list - idling - facing left ;;;
InstList_Dachora_Idling_FacingLeft:
    dw $0030,Spritemap_Dachora_8                                         ;A7F399;
    dw $000A,Spritemap_Dachora_B                                         ;A7F39D;
    dw $0007,Spritemap_Dachora_C                                         ;A7F3A1;
    dw $0007,Spritemap_Dachora_D                                         ;A7F3A5;
    dw $0007,Spritemap_Dachora_E                                         ;A7F3A9;
    dw $0007,Spritemap_Dachora_D                                         ;A7F3AD;
    dw $0007,Spritemap_Dachora_C                                         ;A7F3B1;
    dw $0007,Spritemap_Dachora_D                                         ;A7F3B5;
    dw $0007,Spritemap_Dachora_E                                         ;A7F3B9;
    dw $0007,Spritemap_Dachora_D                                         ;A7F3BD;
    dw $000A,Spritemap_Dachora_B                                         ;A7F3C1;
    dw Common_Instruction_GotoY                                          ;A7F3C5;
    dw InstList_Dachora_Idling_FacingLeft                                ;A7F3C7;


;;; $F3C9: Instruction list - blinking - facing left ;;;
InstList_Dachora_Blinking_FacingLeft:
    dw $000B,Spritemap_Dachora_8                                         ;A7F3C9;
    dw $0008,Spritemap_Dachora_9                                         ;A7F3CD;
    dw $0008,Spritemap_Dachora_A                                         ;A7F3D1;
    dw $0004,Spritemap_Dachora_8                                         ;A7F3D5;
    dw $0004,Spritemap_Dachora_9                                         ;A7F3D9;
    dw $0004,Spritemap_Dachora_A                                         ;A7F3DD;
    dw $000A,Spritemap_Dachora_8                                         ;A7F3E1;
    dw $0005,Spritemap_Dachora_9                                         ;A7F3E5;
    dw $000B,Spritemap_Dachora_A                                         ;A7F3E9;
    dw Common_Instruction_GotoY                                          ;A7F3ED;
    dw InstList_Dachora_Blinking_FacingLeft                              ;A7F3EF;


if !FEATURE_KEEP_UNREFERENCED
;;; $F3F1: Unused. Instruction list - charge shinespark - facing left ;;;
UNUSED_InstList_Dachora_ChargeShinespark_FacingLeft_A7F3F1:
    dw $0001,Spritemap_Dachora_6                                         ;A7F3F1;
    dw Common_Instruction_Sleep                                          ;A7F3F5;
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $F3F7: Instruction list - echo - facing left ;;;
InstList_Dachora_Echo_FacingLeft:
    dw $000A,Spritemap_Dachora_7                                         ;A7F3F7;
    dw Common_Instruction_GotoY                                          ;A7F3FB;
    dw InstList_Dachora_Echo_FacingLeft                                  ;A7F3FD;


;;; $F3FF: Instruction list - falling - facing left ;;;
InstList_Dachora_Falling_FacingLeft:
    dw $0005,Spritemap_Dachora_4                                         ;A7F3FF;
    dw Common_Instruction_GotoY                                          ;A7F403;
    dw InstList_Dachora_Falling_FacingLeft                               ;A7F405;


;;; $F407: Instruction list - running right ;;;
InstList_Dachora_RunningRight:
    dw $0005,Spritemap_Dachora_F                                         ;A7F407;
    dw $0005,Spritemap_Dachora_10                                        ;A7F40B;
    dw $0005,Spritemap_Dachora_11                                        ;A7F40F;
    dw $0005,Spritemap_Dachora_12                                        ;A7F413;
    dw $0005,Spritemap_Dachora_13                                        ;A7F417;
    dw $0005,Spritemap_Dachora_14                                        ;A7F41B;
    dw Common_Instruction_GotoY                                          ;A7F41F;
    dw InstList_Dachora_RunningRight                                     ;A7F421;

InstList_Dachora_RunningRight_FastAnimation:
    dw $0003,Spritemap_Dachora_F                                         ;A7F423;
    dw $0003,Spritemap_Dachora_10                                        ;A7F427;
    dw $0003,Spritemap_Dachora_11                                        ;A7F42B;
    dw $0003,Spritemap_Dachora_12                                        ;A7F42F;
    dw $0003,Spritemap_Dachora_13                                        ;A7F433;
    dw $0003,Spritemap_Dachora_14                                        ;A7F437;
    dw Common_Instruction_GotoY                                          ;A7F43B;
    dw InstList_Dachora_RunningRight_FastAnimation                       ;A7F43D;

InstList_Dachora_RunningRight_VeryFastAnimation:
    dw $0001,Spritemap_Dachora_F                                         ;A7F43F;
    dw $0001,Spritemap_Dachora_10                                        ;A7F443;
    dw $0001,Spritemap_Dachora_11                                        ;A7F447;
    dw $0001,Spritemap_Dachora_12                                        ;A7F44B;
    dw $0001,Spritemap_Dachora_13                                        ;A7F44F;
    dw $0001,Spritemap_Dachora_14                                        ;A7F453;
    dw Common_Instruction_GotoY                                          ;A7F457;
    dw InstList_Dachora_RunningRight_VeryFastAnimation                   ;A7F459;


;;; $F45B: Instruction list - idling - facing right ;;;
InstList_Dachora_Idling_FacingRight:
    dw $0030,Spritemap_Dachora_17                                        ;A7F45B;
    dw $000A,Spritemap_Dachora_1A                                        ;A7F45F;
    dw $0007,Spritemap_Dachora_1B                                        ;A7F463;
    dw $0007,Spritemap_Dachora_1C                                        ;A7F467;
    dw $0007,Spritemap_Dachora_1D                                        ;A7F46B;
    dw $0007,Spritemap_Dachora_1C                                        ;A7F46F;
    dw $0007,Spritemap_Dachora_1B                                        ;A7F473;
    dw $0007,Spritemap_Dachora_1C                                        ;A7F477;
    dw $0007,Spritemap_Dachora_1D                                        ;A7F47B;
    dw $0007,Spritemap_Dachora_1C                                        ;A7F47F;
    dw $000A,Spritemap_Dachora_1A                                        ;A7F483;
    dw Common_Instruction_GotoY                                          ;A7F487;
    dw InstList_Dachora_Idling_FacingRight                               ;A7F489;


;;; $F48B: Instruction list - blinking - facing right ;;;
InstList_Dachora_Blinking_FacingRight:
    dw $000B,Spritemap_Dachora_17                                        ;A7F48B;
    dw $0008,Spritemap_Dachora_18                                        ;A7F48F;
    dw $0008,Spritemap_Dachora_19                                        ;A7F493;
    dw $0004,Spritemap_Dachora_17                                        ;A7F497;
    dw $0004,Spritemap_Dachora_18                                        ;A7F49B;
    dw $0004,Spritemap_Dachora_19                                        ;A7F49F;
    dw $000A,Spritemap_Dachora_17                                        ;A7F4A3;
    dw $0005,Spritemap_Dachora_18                                        ;A7F4A7;
    dw $000B,Spritemap_Dachora_19                                        ;A7F4AB;
    dw Common_Instruction_GotoY                                          ;A7F4AF;
    dw InstList_Dachora_Blinking_FacingRight                             ;A7F4B1;


;;; $F4B3: Instruction list - charge shinespark - facing right ;;;
InstList_Dachora_ChargeShinespark_FacingRight:
    dw $0001,Spritemap_Dachora_15                                        ;A7F4B3;
    dw Common_Instruction_Sleep                                          ;A7F4B7;


;;; $F4B9: Instruction list - echo - facing right ;;;
InstList_Dachora_Echo_FacingRight:
    dw $000A,Spritemap_Dachora_16                                        ;A7F4B9;
    dw Common_Instruction_GotoY                                          ;A7F4BD;
    dw InstList_Dachora_Echo_FacingRight                                 ;A7F4BF;


;;; $F4C1: Instruction list - falling - facing right ;;;
InstList_Dachora_Falling_FacingRight:
    dw $0005,Spritemap_Dachora_13                                        ;A7F4C1;
    dw Common_Instruction_GotoY                                          ;A7F4C5;
    dw InstList_Dachora_Falling_FacingRight                              ;A7F4C7;


;;; $F4C9: Dachora constants ;;;
DachoraConstants_SamusProximityXThreshold:
; Max X distance between dachora and Samus before dachora starts running
    dw $0060                                                             ;A7F4C9;

UNUSED_DachoraConstants_maxXDistanceFromSamusToStop_A7F4CB:
; Unused max X distance between dachora and Samus before dachora stops running
    dw $0060                                                             ;A7F4CB;

DachoraConstants_blinkingDuration:
; Blinking duration, between dachora seeing Samus and starting to run
    dw $0078                                                             ;A7F4CD;

DachoraConstants_delayBeforeActivatingShinespark:
; Delay before activating shinespark
    dw $003C                                                             ;A7F4CF;

DachoraConstants_echoPositionUpdateInterval:
; Echo position update interval
    dw $0001                                                             ;A7F4D1;

DachoraConstants_echoLifetime:
; Echo lifetime
    dw $0008                                                             ;A7F4D3;

DachoraConstants_maxXSpeed:
; Max X speed
    dw $0008,$0000                                                       ;A7F4D5;

DachoraConstants_XAcceleration:
; X acceleration
    dw $0000,$1000                                                       ;A7F4D9;


;;; $F4DD: Initialisation AI - enemy $E5FF (dachora) ;;;
InitAI_Dachora:
    LDX.W EnemyIndex                                                     ;A7F4DD;
    LDA.W Enemy.properties,X                                             ;A7F4E0;
    ORA.W #$2000                                                         ;A7F4E3;
    STA.W Enemy.properties,X                                             ;A7F4E6;
    LDA.W #Common_Spritemap_Nothing                                      ;A7F4E9;
    STA.W Enemy.spritemap,X                                              ;A7F4EC;
    LDA.W #$0001                                                         ;A7F4EF;
    STA.W Enemy.instTimer,X                                              ;A7F4F2;
    STZ.W Enemy.loopCounter,X                                            ;A7F4F5;
    LDA.W Dachora.direction,X                                            ;A7F4F8;
    BMI .echo                                                            ;A7F4FB;
    BEQ .left                                                            ;A7F4FD;
    LDA.W #InstList_Dachora_Idling_FacingRight                           ;A7F4FF;
    STA.W Enemy.instList,X                                               ;A7F502;
    BRA +                                                                ;A7F505;

  .left:
    LDA.W #InstList_Dachora_Idling_FacingLeft                            ;A7F507;
    STA.W Enemy.instList,X                                               ;A7F50A;

+   LDA.W #Function_Dachora_WaitForSamusToBeNear                         ;A7F50D;
    STA.W Dachora.function,X                                             ;A7F510;
    RTL                                                                  ;A7F513;

  .echo:
    BIT.W #$0001                                                         ;A7F514;
    BEQ ..left                                                           ;A7F517;
    LDA.W #InstList_Dachora_Echo_FacingRight                             ;A7F519;
    STA.W Enemy.instList,X                                               ;A7F51C;
    BRA +                                                                ;A7F51F;

  ..left:
    LDA.W #InstList_Dachora_Echo_FacingLeft                              ;A7F521;
    STA.W Enemy.instList,X                                               ;A7F524;

+   LDA.W #Function_Dachora_Echo                                         ;A7F527;
    STA.W Dachora.function,X                                             ;A7F52A;
    RTL                                                                  ;A7F52D;


;;; $F52E: Main AI - enemy $E5FF (dachora) ;;;
MainAI_Dachora:
    LDX.W EnemyIndex                                                     ;A7F52E;
    JMP.W (Dachora.function,X)                                           ;A7F531;


;;; $F534: Unused. RTL ;;;
RTL_A7F534:
    RTL                                                                  ;A7F534;


;;; $F535: Load dachora palette ;;;
LoadDachoraPalette:
;; Parameters:
;;     Y: Palette source address
    PHP                                                                  ;A7F535;
    REP #$30                                                             ;A7F536;
    PHX                                                                  ;A7F538;
    LDA.W #Palettes_SpriteP0>>8&$FF00                                    ;A7F539;
    STA.B DP_Temp01                                                      ;A7F53C;
    LDA.W Enemy.palette,X                                                ;A7F53E;
    XBA                                                                  ;A7F541;
    LSR                                                                  ;A7F542;
    ASL                                                                  ;A7F543;
    TAX                                                                  ;A7F544;
    LDA.W .pointers,X                                                    ;A7F545;
    STA.B DP_Temp00                                                      ;A7F548;
    TYX                                                                  ;A7F54A;
    LDY.W #$0000                                                         ;A7F54B;

  .loop:
    LDA.W $0000,X                                                        ;A7F54E;
    STA.B [DP_Temp00],Y                                                  ;A7F551;
    INX                                                                  ;A7F553;
    INX                                                                  ;A7F554;
    INY                                                                  ;A7F555;
    INY                                                                  ;A7F556;
    CPY.W #$0020                                                         ;A7F557;
    BMI .loop                                                            ;A7F55A;
    PLX                                                                  ;A7F55C;
    PLP                                                                  ;A7F55D;
    RTS                                                                  ;A7F55E;

  .pointers:
; pointers to $7E
    dw Palettes_SpriteP0                                                 ;A7F55F;
    dw Palettes_SpriteP1                                                 ;A7F561;
    dw Palettes_SpriteP2                                                 ;A7F563;
    dw Palettes_SpriteP3                                                 ;A7F565;
    dw Palettes_SpriteP4C0                                               ;A7F567;
    dw Palettes_SpriteP5                                                 ;A7F569;
    dw Palettes_SpriteP6                                                 ;A7F56B;
    dw Palettes_SpriteP7                                                 ;A7F56D;


;;; $F56F: Unused. RTL ;;;
RTL_A7F56F:
    RTL                                                                  ;A7F56F;


;;; $F570: Dachora function - wait for Samus to be near ;;;
Function_Dachora_WaitForSamusToBeNear:
    LDA.W #$0001                                                         ;A7F570;
    STA.B DP_Temp14                                                      ;A7F573;
    STZ.B DP_Temp12                                                      ;A7F575;
    JSL.L MoveEnemyDownBy_14_12                                          ;A7F577;
    LDA.W #$0040                                                         ;A7F57B;
    JSL.L IsSamusWithingAPixelRowsOfEnemy                                ;A7F57E;
    TAY                                                                  ;A7F582;
    BEQ .return                                                          ;A7F583;
    LDA.W DachoraConstants_SamusProximityXThreshold                      ;A7F585;
    JSL.L IsSamusWithinAPixelColumnsOfEnemy                              ;A7F588;
    TAY                                                                  ;A7F58C;
    BEQ .return                                                          ;A7F58D;
    LDA.W Dachora.direction,X                                            ;A7F58F;
    BEQ .left                                                            ;A7F592;
    LDA.W #InstList_Dachora_Blinking_FacingRight                         ;A7F594;
    STA.W Enemy.instList,X                                               ;A7F597;
    BRA +                                                                ;A7F59A;

  .left:
    LDA.W #InstList_Dachora_Blinking_FacingLeft                          ;A7F59C;
    STA.W Enemy.instList,X                                               ;A7F59F;

+   LDA.W #$0001                                                         ;A7F5A2;
    STA.W Enemy.instTimer,X                                              ;A7F5A5;
    LDA.W #Function_Dachora_StartRunning                                 ;A7F5A8;
    STA.W Dachora.function,X                                             ;A7F5AB;
    LDA.W DachoraConstants_blinkingDuration                              ;A7F5AE;
    STA.W Dachora.functionTimer,X                                        ;A7F5B1;
    LDA.W #$001D                                                         ;A7F5B4;
    JSL.L QueueSound_Lib2_Max15                                          ;A7F5B7;

  .return:
    RTL                                                                  ;A7F5BB;


;;; $F5BC: Dachora function - start running ;;;
Function_Dachora_StartRunning:
    DEC.W Dachora.functionTimer,X                                        ;A7F5BC;
    BNE .return                                                          ;A7F5BF;
    LDA.W Dachora.direction,X                                            ;A7F5C1;
    BEQ .left                                                            ;A7F5C4;
    LDA.W #InstList_Dachora_RunningRight                                 ;A7F5C6;
    STA.W Enemy.instList,X                                               ;A7F5C9;
    LDA.W #Function_Dachora_RunningRight                                 ;A7F5CC;
    STA.W Dachora.function,X                                             ;A7F5CF;
    BRA +                                                                ;A7F5D2;

  .left:
    LDA.W #InstList_Dachora_RunningLeft                                  ;A7F5D4;
    STA.W Enemy.instList,X                                               ;A7F5D7;
    LDA.W #Function_Dachora_RunningLeft                                  ;A7F5DA;
    STA.W Dachora.function,X                                             ;A7F5DD;

+   LDA.W #$0001                                                         ;A7F5E0;
    STA.W Enemy.instTimer,X                                              ;A7F5E3;
    LDA.W #$0001                                                         ;A7F5E6;
    STA.W Dachora.paletteAnimationTimer,X                                ;A7F5E9;

  .return:
    RTL                                                                  ;A7F5EC;


;;; $F5ED: Dachora function - running left ;;;
Function_Dachora_RunningLeft:
    JSR.W AccelerateRunningDachora                                       ;A7F5ED;
    LDA.B DP_Temp14                                                      ;A7F5F0;
    EOR.W #$FFFF                                                         ;A7F5F2;
    STA.B DP_Temp14                                                      ;A7F5F5;
    LDA.B DP_Temp12                                                      ;A7F5F7;
    EOR.W #$FFFF                                                         ;A7F5F9;
    INC                                                                  ;A7F5FC;
    STA.B DP_Temp12                                                      ;A7F5FD;
    BNE +                                                                ;A7F5FF;
    INC.B DP_Temp14                                                      ;A7F601;

+   JSL.L MoveEnemyRightBy_14_12_IgnoreSlopes                            ;A7F603;
    BCS .stop                                                            ;A7F607;
    JSL.L AlignEnemyYPositionWIthNonSquareSlope                          ;A7F609;
    BRA .noWall                                                          ;A7F60D;

  .stop:
    LDA.W #InstList_Dachora_RunningRight                                 ;A7F60F;
    STA.W Enemy.instList,X                                               ;A7F612;
    LDA.W #Function_Dachora_RunningRight                                 ;A7F615;
    STA.W Dachora.function,X                                             ;A7F618;
    LDA.W #$0001                                                         ;A7F61B;
    STA.W Dachora.paletteAnimationTimer,X                                ;A7F61E;

  .merge:
    LDA.W #$0001                                                         ;A7F621;
    STA.W Dachora.direction,X                                            ;A7F624;
    LDA.W #$0001                                                         ;A7F627;
    STA.W Enemy.instTimer,X                                              ;A7F62A;
    STZ.W Dachora.speed,X                                                ;A7F62D;
    STZ.W Dachora.subSpeed,X                                             ;A7F630;
    LDY.W #Palette_Dachora                                               ;A7F633;
    JSR.W LoadDachoraPalette                                             ;A7F636;
    RTL                                                                  ;A7F639;

  .noWall:
    LDA.W Enemy.XPosition,X                                              ;A7F63A;
    CMP.W #$0060                                                         ;A7F63D;
    BMI .stop                                                            ;A7F640;
    RTL                                                                  ;A7F642;

; Unused branch
    LDA.W UNUSED_DachoraConstants_maxXDistanceFromSamusToStop_A7F4CB     ;A7F643; dead code
    JSL.L IsSamusWithinAPixelColumnsOfEnemy                              ;A7F646;
    TAY                                                                  ;A7F64A;
    BNE .stop                                                            ;A7F64B;
    LDA.W #InstList_Dachora_Idling_FacingRight                           ;A7F64D;
    STA.W Enemy.instList,X                                               ;A7F650;
    LDA.W #Function_Dachora_WaitForSamusToBeNear                         ;A7F653;
    STA.W Dachora.function,X                                             ;A7F656;
    STZ.W Dachora.paletteAnimationTimer,X                                ;A7F659;
    BRA .merge                                                           ;A7F65C;


;;; $F65E: Dachora function - running right ;;;
Function_Dachora_RunningRight:
    JSR.W AccelerateRunningDachora                                       ;A7F65E;
    JSL.L MoveEnemyRightBy_14_12_IgnoreSlopes                            ;A7F661;
    BCS .collision                                                       ;A7F665;
    JSL.L AlignEnemyYPositionWIthNonSquareSlope                          ;A7F667;
    BRA .noWall                                                          ;A7F66B;

  .collision:
    LDA.W #$0071                                                         ;A7F66D;
    JSL.L QueueSound_Lib2_Max15                                          ;A7F670;
    LDA.W #InstList_Dachora_RunningLeft                                  ;A7F674;
    STA.W Enemy.instList,X                                               ;A7F677;
    LDA.W #Function_Dachora_RunningLeft                                  ;A7F67A;
    STA.W Dachora.function,X                                             ;A7F67D;

  .merge:
    STZ.W Dachora.direction,X                                            ;A7F680;
    STZ.W Dachora.speed,X                                                ;A7F683;
    LDY.W #Palette_Dachora                                               ;A7F686;
    JSR.W LoadDachoraPalette                                             ;A7F689;

  .newAnimation:
    STZ.W Dachora.paletteAnimationTimer,X                                ;A7F68C;
    STZ.W Dachora.subSpeed,X                                             ;A7F68F;
    LDA.W #$0001                                                         ;A7F692;
    STA.W Enemy.instTimer,X                                              ;A7F695;
    RTL                                                                  ;A7F698;

  .noWall:
    LDA.W Enemy.XPosition,X                                              ;A7F699;
    CMP.W #$0480                                                         ;A7F69C;
    BPL +                                                                ;A7F69F;
    RTL                                                                  ;A7F6A1;

+   LDA.W #InstList_Dachora_ChargeShinespark_FacingRight                 ;A7F6A2;
    STA.W Enemy.instList,X                                               ;A7F6A5;
    LDA.W #Function_Dachora_ActivateShinespark                           ;A7F6A8;
    STA.W Dachora.function,X                                             ;A7F6AB;
    LDA.W DachoraConstants_delayBeforeActivatingShinespark               ;A7F6AE;
    STA.W Dachora.speed,X                                                ;A7F6B1;
    LDA.W Enemy.YPosition,X                                              ;A7F6B4;
    CLC                                                                  ;A7F6B7;
    ADC.W #$0008                                                         ;A7F6B8;
    STA.W Enemy.YPosition,X                                              ;A7F6BB;
    LDA.W #$003D                                                         ;A7F6BE;
    JSL.L QueueSound_Lib2_Max6                                           ;A7F6C1;
    BRA .newAnimation                                                    ;A7F6C5;

; Unused branch
    LDA.W #InstList_Dachora_Idling_FacingLeft                            ;A7F6C7; dead code
    STA.W Enemy.instList,X                                               ;A7F6CA;
    LDA.W #Function_Dachora_WaitForSamusToBeNear                         ;A7F6CD;
    STA.W Dachora.function,X                                             ;A7F6D0;
    BRA .merge                                                           ;A7F6D3;


;;; $F6D5: Accelerate running dachora ;;;
AccelerateRunningDachora:
;; Returns:
;;     $14.$12: X speed
    LDA.W Dachora.speed,X                                                ;A7F6D5;
    CMP.W DachoraConstants_maxXSpeed                                     ;A7F6D8;
    BMI .noPaletteChange                                                 ;A7F6DB;
    LDA.W Dachora.paletteAnimationTimer,X                                ;A7F6DD;
    CMP.W #$0001                                                         ;A7F6E0;
    BNE .animTimer                                                       ;A7F6E3;
    LDA.W #$0039                                                         ;A7F6E5;
    JSL.L QueueSound_Lib2_Max6                                           ;A7F6E8;

  .animTimer:
    LDA.W Dachora.paletteAnimationTimer,X                                ;A7F6EC;
    DEC                                                                  ;A7F6EF;
    STA.W Dachora.paletteAnimationTimer,X                                ;A7F6F0;
    AND.W #$00FF                                                         ;A7F6F3;
    BEQ .loadPalette                                                     ;A7F6F6;
    BPL .noPaletteChange                                                 ;A7F6F8;

  .loadPalette:
    LDA.W Dachora.paletteAnimationTimer,X                                ;A7F6FA;
    XBA                                                                  ;A7F6FD;
    AND.W #$00FF                                                         ;A7F6FE;
    ASL                                                                  ;A7F701;
    TAY                                                                  ;A7F702;
    LDA.W .pointers,Y                                                    ;A7F703;
    TAY                                                                  ;A7F706;
    JSR.W LoadDachoraPalette                                             ;A7F707;
    LDA.W Dachora.paletteAnimationTimer,X                                ;A7F70A;
    CLC                                                                  ;A7F70D;
    ADC.W #$0110                                                         ;A7F70E;
    STA.W Dachora.paletteAnimationTimer,X                                ;A7F711;
    CMP.W #$0410                                                         ;A7F714;
    BMI .noPaletteChange                                                 ;A7F717;
    LDA.W #$0310                                                         ;A7F719;
    STA.W Dachora.paletteAnimationTimer,X                                ;A7F71C;

  .noPaletteChange:
    LDA.W #$0001                                                         ;A7F71F;
    STA.B DP_Temp14                                                      ;A7F722;
    STZ.B DP_Temp12                                                      ;A7F724;
    JSL.L MoveEnemyDownBy_14_12                                          ;A7F726;
    LDA.W Dachora.speed,X                                                ;A7F72A;
    CMP.W DachoraConstants_maxXSpeed                                     ;A7F72D;
    BMI .increaseSpeed                                                   ;A7F730;
    LDA.W Dachora.subSpeed,X                                             ;A7F732;
    CMP.W DachoraConstants_maxXSpeed+2                                   ;A7F735;
    BMI .increaseSpeed                                                   ;A7F738;
    LDA.W DachoraConstants_maxXSpeed                                     ;A7F73A;
    STA.W Dachora.speed,X                                                ;A7F73D;
    STA.B DP_Temp14                                                      ;A7F740;
    LDA.W DachoraConstants_maxXSpeed+2                                   ;A7F742;
    STA.W Dachora.subSpeed,X                                             ;A7F745;
    STA.B DP_Temp12                                                      ;A7F748;
    BRA .return                                                          ;A7F74A;

  .increaseSpeed:
    LDA.W Dachora.subSpeed,X                                             ;A7F74C;
    CLC                                                                  ;A7F74F;
    ADC.W DachoraConstants_XAcceleration+2                               ;A7F750;
    STA.W Dachora.subSpeed,X                                             ;A7F753;
    STA.B DP_Temp12                                                      ;A7F756;
    LDA.W Dachora.speed,X                                                ;A7F758;
    ADC.W DachoraConstants_XAcceleration                                 ;A7F75B;
    STA.W Dachora.speed,X                                                ;A7F75E;
    STA.B DP_Temp14                                                      ;A7F761;
    CMP.W #$0004                                                         ;A7F763;
    BNE .checkMaxSpeed                                                   ;A7F766;
    LDA.B DP_Temp12                                                      ;A7F768;
    CMP.W #$0000                                                         ;A7F76A;
    BNE .return                                                          ;A7F76D;

  .maxSpeed:
    LDA.W Enemy.instList,X                                               ;A7F76F;
    CLC                                                                  ;A7F772;
    ADC.W #$001C                                                         ;A7F773;
    STA.W Enemy.instList,X                                               ;A7F776;
    RTS                                                                  ;A7F779;

  .checkMaxSpeed:
    CMP.W #$0008                                                         ;A7F77A;
    BNE .return                                                          ;A7F77D;
    LDA.B DP_Temp12                                                      ;A7F77F;
    CMP.W #$0000                                                         ;A7F781;
    BEQ .maxSpeed                                                        ;A7F784;

  .return:
    RTS                                                                  ;A7F786;

  .pointers:
    dw Palette_Dachora_SpeedBoosting_0                                   ;A7F787;
    dw Palette_Dachora_SpeedBoosting_1                                   ;A7F789;
    dw Palette_Dachora_SpeedBoosting_2                                   ;A7F78B;
    dw Palette_Dachora_SpeedBoosting_3                                   ;A7F78D;


;;; $F78F: Dachora function - activate shinespark ;;;
Function_Dachora_ActivateShinespark:
    JSR.W LoadDachoraShinePalette                                        ;A7F78F;
    DEC.W Dachora.functionTimer,X                                        ;A7F792;
    BNE .return                                                          ;A7F795;
    LDA.W Enemy.instList,X                                               ;A7F797;
    INC                                                                  ;A7F79A;
    INC                                                                  ;A7F79B;
    STA.W Enemy.instList,X                                               ;A7F79C;
    LDA.W #$0001                                                         ;A7F79F;
    STA.W Enemy.instTimer,X                                              ;A7F7A2;
    LDA.W #Function_Dachora_Shinesparking                                ;A7F7A5;
    STA.W Dachora.function,X                                             ;A7F7A8;
    STZ.W Enemy[1].var0,X                                                ;A7F7AB;
    STZ.W Enemy[1].var3,X                                                ;A7F7AE;
    STZ.W Enemy[2].var3,X                                                ;A7F7B1;
    STZ.W Enemy[3].var3,X                                                ;A7F7B4;
    STZ.W Enemy[4].var3,X                                                ;A7F7B7;
    STZ.W Dachora.YAcceleration,X                                        ;A7F7BA;
    STZ.W Dachora.YSubAcceleration,X                                     ;A7F7BD;
    LDA.W Enemy.YPosition,X                                              ;A7F7C0;
    SEC                                                                  ;A7F7C3;
    SBC.W #$0008                                                         ;A7F7C4;
    STA.W Enemy.YPosition,X                                              ;A7F7C7;
    LDA.W #$003B                                                         ;A7F7CA;
    JSL.L QueueSound_Lib2_Max6                                           ;A7F7CD;
    LDA.W Dachora.direction,X                                            ;A7F7D1;
    BEQ .left                                                            ;A7F7D4;
    LDA.W #InstList_Dachora_Echo_FacingRight                             ;A7F7D6;
    STA.W Enemy[1].instList,X                                            ;A7F7D9;
    STA.W Enemy[2].instList,X                                            ;A7F7DC;
    STA.W Enemy[3].instList,X                                            ;A7F7DF;
    STA.W Enemy[4].instList,X                                            ;A7F7E2;
    BRA +                                                                ;A7F7E5;

  .left:
    LDA.W #InstList_Dachora_Echo_FacingLeft                              ;A7F7E7;
    STA.W Enemy[1].instList,X                                            ;A7F7EA;
    STA.W Enemy[2].instList,X                                            ;A7F7ED;
    STA.W Enemy[3].instList,X                                            ;A7F7F0;
    STA.W Enemy[4].instList,X                                            ;A7F7F3;

+   LDA.W #$0001                                                         ;A7F7F6;
    STA.W Enemy[1].instTimer,X                                           ;A7F7F9;
    STA.W Enemy[2].instTimer,X                                           ;A7F7FC;
    STA.W Enemy[3].instTimer,X                                           ;A7F7FF;
    STA.W Enemy[4].instTimer,X                                           ;A7F802;

  .return:
    RTL                                                                  ;A7F805;


;;; $F806: Dachora function - shinesparking ;;;
Function_Dachora_Shinesparking:
    JSR.W LoadDachoraShinePalette                                        ;A7F806;
    JSR.W UpdateDachoraEchoPositions                                     ;A7F809;
    LDA.W Dachora.YSubAcceleration,X                                     ;A7F80C;
    CLC                                                                  ;A7F80F;
    ADC.L SamusYSubAcceleration                                          ;A7F810;
    STA.W Dachora.YSubAcceleration,X                                     ;A7F814;
    LDA.W Dachora.YAcceleration,X                                        ;A7F817;
    ADC.L SamusYAcceleration                                             ;A7F81A;
    STA.W Dachora.YAcceleration,X                                        ;A7F81E;
    LDA.W Dachora.subSpeed,X                                             ;A7F821;
    CLC                                                                  ;A7F824;
    ADC.W Dachora.YSubAcceleration,X                                     ;A7F825;
    STA.W Dachora.subSpeed,X                                             ;A7F828;
    STA.B DP_Temp12                                                      ;A7F82B;
    LDA.W Dachora.speed,X                                                ;A7F82D;
    ADC.W Dachora.YAcceleration,X                                        ;A7F830;
    STA.W Dachora.speed,X                                                ;A7F833;
    STA.B DP_Temp14                                                      ;A7F836;
    CMP.W #$000F                                                         ;A7F838;
    BMI +                                                                ;A7F83B;
    LDA.W #$000F                                                         ;A7F83D;
    STA.B DP_Temp14                                                      ;A7F840;

+   LDA.B DP_Temp14                                                      ;A7F842;
    EOR.W #$FFFF                                                         ;A7F844;
    STA.B DP_Temp14                                                      ;A7F847;
    LDA.B DP_Temp12                                                      ;A7F849;
    EOR.W #$FFFF                                                         ;A7F84B;
    INC                                                                  ;A7F84E;
    STA.B DP_Temp12                                                      ;A7F84F;
    BNE .move                                                            ;A7F851;
    INC.B DP_Temp14                                                      ;A7F853;

  .move:
    JSL.L MoveEnemyDownBy_14_12                                          ;A7F855;
    BCC .return                                                          ;A7F859;
    LDA.W Dachora.direction,X                                            ;A7F85B;
    BNE .right                                                           ;A7F85E;
    LDA.W #InstList_Dachora_Falling_FacingRight                          ;A7F860;
    STA.W Enemy.instList,X                                               ;A7F863;
    LDA.W #$0001                                                         ;A7F866;
    STA.W Dachora.direction,X                                            ;A7F869;
    BRA +                                                                ;A7F86C;

  .right:
    LDA.W #InstList_Dachora_Falling_FacingLeft                           ;A7F86E;
    STA.W Enemy.instList,X                                               ;A7F871;
    STZ.W Dachora.direction,X                                            ;A7F874;

+   LDA.W #Function_Dachora_Falling                                      ;A7F877;
    STA.W Dachora.function,X                                             ;A7F87A;
    LDA.W #$0001                                                         ;A7F87D;
    STA.W Enemy.instTimer,X                                              ;A7F880;
    STZ.W Dachora.speed,X                                                ;A7F883;
    STZ.W Dachora.subSpeed,X                                             ;A7F886;
    STZ.W Dachora.paletteAnimationTimer,X                                ;A7F889;
    LDY.W #Palette_Dachora                                               ;A7F88C;
    JSR.W LoadDachoraPalette                                             ;A7F88F;
    LDA.W #$003C                                                         ;A7F892;
    JSL.L QueueSound_Lib2_Max6                                           ;A7F895;

  .return:
    RTL                                                                  ;A7F899;


;;; $F89A: Update echo positions ;;;
UpdateDachoraEchoPositions:
    LDA.W Enemy[1].var0,X                                                ;A7F89A;
    BEQ .timerExpired                                                    ;A7F89D;
    DEC                                                                  ;A7F89F;
    STA.W Enemy[1].var0,X                                                ;A7F8A0;
    RTS                                                                  ;A7F8A3;

  .timerExpired:
    LDA.W DachoraConstants_echoPositionUpdateInterval                    ;A7F8A4;
    STA.W Enemy[1].var0,X                                                ;A7F8A7;
    LDA.W Enemy[1].var3,X                                                ;A7F8AA;
    BNE .echo1                                                           ;A7F8AD;
    LDA.W Enemy.XPosition,X                                              ;A7F8AF;
    STA.W Enemy[1].XPosition,X                                           ;A7F8B2;
    LDA.W Enemy.YPosition,X                                              ;A7F8B5;
    STA.W Enemy[1].YPosition,X                                           ;A7F8B8;
    LDA.W DachoraConstants_echoLifetime                                  ;A7F8BB;
    STA.W Enemy[1].var3,X                                                ;A7F8BE;
    RTS                                                                  ;A7F8C1;

  .echo1:
    LDA.W Enemy[2].var3,X                                                ;A7F8C2;
    BNE .echo2                                                           ;A7F8C5;
    LDA.W Enemy.XPosition,X                                              ;A7F8C7;
    STA.W Enemy[2].XPosition,X                                           ;A7F8CA;
    LDA.W Enemy.YPosition,X                                              ;A7F8CD;
    STA.W Enemy[2].YPosition,X                                           ;A7F8D0;
    LDA.W DachoraConstants_echoLifetime                                  ;A7F8D3;
    STA.W Enemy[2].var3,X                                                ;A7F8D6;
    RTS                                                                  ;A7F8D9;

  .echo2:
    LDA.W Enemy[3].var3,X                                                ;A7F8DA;
    BNE .echo3                                                           ;A7F8DD;
    LDA.W Enemy.XPosition,X                                              ;A7F8DF;
    STA.W Enemy[3].XPosition,X                                           ;A7F8E2;
    LDA.W Enemy.YPosition,X                                              ;A7F8E5;
    STA.W Enemy[3].YPosition,X                                           ;A7F8E8;
    LDA.W DachoraConstants_echoLifetime                                  ;A7F8EB;
    STA.W Enemy[3].var3,X                                                ;A7F8EE;
    RTS                                                                  ;A7F8F1;

  .echo3:
    LDA.W Enemy[4].var3,X                                                ;A7F8F2;
    BNE .return                                                          ;A7F8F5;
    LDA.W Enemy.XPosition,X                                              ;A7F8F7;
    STA.W Enemy[4].XPosition,X                                           ;A7F8FA;
    LDA.W Enemy.YPosition,X                                              ;A7F8FD;
    STA.W Enemy[4].YPosition,X                                           ;A7F900;
    LDA.W DachoraConstants_echoLifetime                                  ;A7F903;
    STA.W Enemy[4].var3,X                                                ;A7F906;

  .return:
    RTS                                                                  ;A7F909;


;;; $F90A: Load dachora shine palette ;;;
LoadDachoraShinePalette:
    LDA.W Dachora.paletteAnimationTimer,X                                ;A7F90A;
    XBA                                                                  ;A7F90D;
    AND.W #$00FF                                                         ;A7F90E;
    ASL                                                                  ;A7F911;
    TAY                                                                  ;A7F912;
    LDA.W .pointers,Y                                                    ;A7F913;
    TAY                                                                  ;A7F916;
    JSR.W LoadDachoraPalette                                             ;A7F917;
    LDA.W Dachora.paletteAnimationTimer,X                                ;A7F91A;
    CLC                                                                  ;A7F91D;
    ADC.W #$0100                                                         ;A7F91E;
    STA.W Dachora.paletteAnimationTimer,X                                ;A7F921;
    CMP.W #$0400                                                         ;A7F924;
    BMI .return                                                          ;A7F927;
    STZ.W Dachora.paletteAnimationTimer,X                                ;A7F929;

  .return:
    RTS                                                                  ;A7F92C;

  .pointers:
    dw Palette_Dachora_Shine_0                                           ;A7F92D;
    dw Palette_Dachora_Shine_1                                           ;A7F92F;
    dw Palette_Dachora_Shine_2                                           ;A7F931;
    dw Palette_Dachora_Shine_3                                           ;A7F933;


;;; $F935: Dachora function - falling ;;;
Function_Dachora_Falling:
    LDA.W Dachora.subSpeed,X                                             ;A7F935;
    CLC                                                                  ;A7F938;
    ADC.L SamusYSubAcceleration                                          ;A7F939;
    STA.W Dachora.subSpeed,X                                             ;A7F93D;
    STA.B DP_Temp12                                                      ;A7F940;
    LDA.W Dachora.speed,X                                                ;A7F942;
    ADC.L SamusYAcceleration                                             ;A7F945;
    STA.W Dachora.speed,X                                                ;A7F949;
    STA.B DP_Temp14                                                      ;A7F94C;
    CMP.W #$000A                                                         ;A7F94E;
    BMI +                                                                ;A7F951;
    LDA.W #$000A                                                         ;A7F953;
    STA.B DP_Temp14                                                      ;A7F956;
    STZ.B DP_Temp12                                                      ;A7F958;

+   JSL.L MoveEnemyDownBy_14_12                                          ;A7F95A;
    BCC .return                                                          ;A7F95E;
    LDA.W Dachora.direction,X                                            ;A7F960;
    BEQ .left                                                            ;A7F963;
    LDA.W #InstList_Dachora_RunningRight                                 ;A7F965;
    STA.W Enemy.instList,X                                               ;A7F968;
    LDA.W #Function_Dachora_RunningRight                                 ;A7F96B;
    STA.W Dachora.function,X                                             ;A7F96E;
    BRA +                                                                ;A7F971;

  .left:
    LDA.W #InstList_Dachora_RunningLeft                                  ;A7F973;
    STA.W Enemy.instList,X                                               ;A7F976;
    LDA.W #Function_Dachora_RunningLeft                                  ;A7F979;
    STA.W Dachora.function,X                                             ;A7F97C;

+   LDA.W #$0001                                                         ;A7F97F;
    STA.W Enemy.instTimer,X                                              ;A7F982;
    STZ.W Dachora.speed,X                                                ;A7F985;
    STZ.W Dachora.subSpeed,X                                             ;A7F988;

  .return:
    RTL                                                                  ;A7F98B;


;;; $F98C: Dachora function - echo ;;;
Function_Dachora_Echo:
    LDA.W Dachora.visibilityTimer,X                                      ;A7F98C;
    BEQ .invisible                                                       ;A7F98F;
    DEC                                                                  ;A7F991;
    STA.W Dachora.visibilityTimer,X                                      ;A7F992;
    TXA                                                                  ;A7F995;
    BIT.W #$0040                                                         ;A7F996;
    BEQ +                                                                ;A7F999;
    LDA.W NMI_FrameCounter                                               ;A7F99B;
    BIT.W #$0001                                                         ;A7F99E;
    BNE .visible                                                         ;A7F9A1;
    BRA .invisible                                                       ;A7F9A3;

+   LDA.W NMI_FrameCounter                                               ;A7F9A5;
    BIT.W #$0001                                                         ;A7F9A8;
    BEQ .visible                                                         ;A7F9AB;

  .invisible:
    LDA.W Enemy.properties,X                                             ;A7F9AD;
    ORA.W #$0100                                                         ;A7F9B0;
    STA.W Enemy.properties,X                                             ;A7F9B3;
    BRA .return                                                          ;A7F9B6;

  .visible:
    LDA.W Enemy.properties,X                                             ;A7F9B8;
    AND.W #$FEFF                                                         ;A7F9BB;
    STA.W Enemy.properties,X                                             ;A7F9BE;

  .return:
    RTL                                                                  ;A7F9C1;


;;; $F9C2: RTL ;;;
RTL_A7F9C2:
    RTL                                                                  ;A7F9C2;


;;; $F9C3: RTL ;;;
RTL_A7F9C3:
    RTL                                                                  ;A7F9C3;


;;; $F9C4: Spritemaps ;;;
Spritemap_Dachora_0:
    dw $0009                                                             ;A7F9C4;
    %spritemapEntry(0, $1F0, $F2, 0, 0, 3, 1, $110)
    %spritemapEntry(1, $43F8, $EA, 0, 0, 3, 1, $101)
    %spritemapEntry(0, $02, $F7, 0, 0, 3, 1, $11E)
    %spritemapEntry(0, $1FA, $F7, 0, 0, 3, 1, $10E)
    %spritemapEntry(0, $1F2, $03, 0, 0, 3, 1, $11F)
    %spritemapEntry(0, $1F2, $FB, 0, 0, 3, 1, $10F)
    %spritemapEntry(0, $1F2, $0F, 0, 0, 3, 1, $122)
    %spritemapEntry(1, $43FA, $07, 0, 0, 3, 1, $113)
    %spritemapEntry(1, $43FA, $FF, 0, 0, 3, 1, $103)

Spritemap_Dachora_1:
    dw $0009                                                             ;A7F9F3;
    %spritemapEntry(0, $1EF, $F3, 0, 0, 3, 1, $110)
    %spritemapEntry(1, $43F7, $EB, 0, 0, 3, 1, $101)
    %spritemapEntry(0, $02, $F8, 0, 0, 3, 1, $15F)
    %spritemapEntry(0, $1FA, $F8, 0, 0, 3, 1, $15E)
    %spritemapEntry(0, $1F2, $04, 0, 0, 3, 1, $11F)
    %spritemapEntry(0, $1F2, $FC, 0, 0, 3, 1, $10F)
    %spritemapEntry(1, $43FA, $08, 0, 0, 3, 1, $116)
    %spritemapEntry(0, $1F2, $08, 0, 0, 3, 1, $115)
    %spritemapEntry(1, $43FA, $00, 0, 0, 3, 1, $106)

Spritemap_Dachora_2:
    dw $000B                                                             ;A7FA22;
    %spritemapEntry(0, $1EE, $F1, 0, 0, 3, 1, $110)
    %spritemapEntry(1, $43F6, $E9, 0, 0, 3, 1, $101)
    %spritemapEntry(0, $1EA, $0E, 0, 0, 3, 1, $12D)
    %spritemapEntry(0, $02, $F6, 0, 0, 3, 1, $11E)
    %spritemapEntry(0, $1FA, $F6, 0, 0, 3, 1, $10E)
    %spritemapEntry(0, $1F2, $FA, 0, 0, 3, 1, $10F)
    %spritemapEntry(1, $43FA, $FE, 0, 0, 3, 1, $109)
    %spritemapEntry(1, $43F2, $FE, 0, 0, 3, 1, $108)
    %spritemapEntry(0, $0A, $0E, 0, 0, 3, 1, $12B)
    %spritemapEntry(0, $0A, $06, 0, 0, 3, 1, $11B)
    %spritemapEntry(1, $43F2, $06, 0, 0, 3, 1, $118)

Spritemap_Dachora_3:
    dw $0009                                                             ;A7FA5B;
    %spritemapEntry(0, $1F0, $F2, 0, 0, 3, 1, $110)
    %spritemapEntry(1, $43F8, $EA, 0, 0, 3, 1, $101)
    %spritemapEntry(0, $02, $F7, 0, 0, 3, 1, $15F)
    %spritemapEntry(0, $1FA, $F7, 0, 0, 3, 1, $15E)
    %spritemapEntry(0, $1F2, $0F, 0, 0, 3, 1, $152)
    %spritemapEntry(0, $1F2, $03, 0, 0, 3, 1, $11F)
    %spritemapEntry(0, $1F2, $FB, 0, 0, 3, 1, $10F)
    %spritemapEntry(1, $43FA, $07, 0, 0, 3, 1, $143)
    %spritemapEntry(1, $43FA, $FF, 0, 0, 3, 1, $133)

Spritemap_Dachora_4:
    dw $0009                                                             ;A7FA8A;
    %spritemapEntry(0, $1EF, $F3, 0, 0, 3, 1, $110)
    %spritemapEntry(1, $43F7, $EB, 0, 0, 3, 1, $101)
    %spritemapEntry(0, $1F4, $10, 0, 0, 3, 1, $152)
    %spritemapEntry(0, $1F2, $04, 0, 0, 3, 1, $11F)
    %spritemapEntry(0, $1F2, $FC, 0, 0, 3, 1, $10F)
    %spritemapEntry(0, $02, $F8, 0, 0, 3, 1, $11E)
    %spritemapEntry(0, $1FA, $F8, 0, 0, 3, 1, $10E)
    %spritemapEntry(1, $43FA, $08, 0, 0, 3, 1, $146)
    %spritemapEntry(1, $43FA, $00, 0, 0, 3, 1, $136)

Spritemap_Dachora_5:
    dw $000B                                                             ;A7FAB9;
    %spritemapEntry(0, $1EE, $F1, 0, 0, 3, 1, $110)
    %spritemapEntry(1, $43F6, $E9, 0, 0, 3, 1, $101)
    %spritemapEntry(0, $02, $F6, 0, 0, 3, 1, $15F)
    %spritemapEntry(0, $1FA, $F6, 0, 0, 3, 1, $15E)
    %spritemapEntry(0, $1EA, $0E, 0, 0, 3, 1, $15A)
    %spritemapEntry(0, $1F2, $FA, 0, 0, 3, 1, $10F)
    %spritemapEntry(1, $43FA, $FE, 0, 0, 3, 1, $139)
    %spritemapEntry(1, $43F2, $06, 0, 0, 3, 1, $148)
    %spritemapEntry(0, $0A, $06, 0, 0, 3, 1, $14B)
    %spritemapEntry(0, $0A, $0E, 0, 0, 3, 1, $15B)
    %spritemapEntry(1, $43F2, $FE, 0, 0, 3, 1, $138)

Spritemap_Dachora_6:
    dw $0008                                                             ;A7FAF2;
    %spritemapEntry(0, $1F6, $FD, 0, 0, 3, 1, $105)
    %spritemapEntry(0, $1ED, $FD, 0, 0, 3, 1, $110)
    %spritemapEntry(1, $43F5, $F5, 0, 0, 3, 1, $101)
    %spritemapEntry(0, $1F3, $08, 0, 0, 3, 1, $11F)
    %spritemapEntry(0, $1F3, $00, 0, 0, 3, 1, $10F)
    %spritemapEntry(0, $03, $FD, 0, 0, 3, 1, $11E)
    %spritemapEntry(0, $1FB, $FD, 0, 0, 3, 1, $10E)
    %spritemapEntry(1, $43FB, $05, 0, 0, 3, 1, $10C)

Spritemap_Dachora_7:
    dw $000A                                                             ;A7FB1C;
    %spritemapEntry(0, $03, $F1, 0, 0, 3, 1, $11E)
    %spritemapEntry(0, $1FB, $F1, 0, 0, 3, 1, $10E)
    %spritemapEntry(0, $1F3, $FD, 0, 0, 3, 1, $11F)
    %spritemapEntry(0, $1F3, $F5, 0, 0, 3, 1, $10F)
    %spritemapEntry(1, $43FB, $F9, 0, 0, 3, 1, $13C)
    %spritemapEntry(0, $1FE, $DF, 1, 1, 3, 1, $141)
    %spritemapEntry(1, $43FE, $E7, 1, 1, 3, 1, $120)
    %spritemapEntry(0, $03, $09, 0, 0, 3, 1, $15D)
    %spritemapEntry(0, $1FB, $09, 0, 0, 3, 1, $150)
    %spritemapEntry(0, $1FB, $11, 0, 0, 3, 1, $125)

Spritemap_Dachora_8:
    dw $0009                                                             ;A7FB50;
    %spritemapEntry(0, $1F0, $F3, 0, 0, 3, 1, $110)
    %spritemapEntry(1, $43F8, $EB, 0, 0, 3, 1, $101)
    %spritemapEntry(0, $1F3, $10, 0, 0, 3, 1, $151)
    %spritemapEntry(0, $03, $F8, 0, 0, 3, 1, $11E)
    %spritemapEntry(0, $1FB, $F8, 0, 0, 3, 1, $10E)
    %spritemapEntry(0, $1F3, $04, 0, 0, 3, 1, $11F)
    %spritemapEntry(0, $1F3, $FC, 0, 0, 3, 1, $10F)
    %spritemapEntry(1, $43FB, $08, 0, 0, 3, 1, $14C)
    %spritemapEntry(1, $43FB, $00, 0, 0, 3, 1, $13C)

Spritemap_Dachora_9:
    dw $000A                                                             ;A7FB7F;
    %spritemapEntry(0, $1F9, $F3, 0, 0, 3, 1, $140)
    %spritemapEntry(0, $1F0, $F3, 0, 0, 3, 1, $110)
    %spritemapEntry(1, $43F8, $EB, 0, 0, 3, 1, $101)
    %spritemapEntry(0, $1F3, $10, 0, 0, 3, 1, $151)
    %spritemapEntry(0, $03, $F8, 0, 0, 3, 1, $11E)
    %spritemapEntry(0, $1FB, $F8, 0, 0, 3, 1, $10E)
    %spritemapEntry(0, $1F3, $04, 0, 0, 3, 1, $11F)
    %spritemapEntry(0, $1F3, $FC, 0, 0, 3, 1, $10F)
    %spritemapEntry(1, $43FB, $08, 0, 0, 3, 1, $14C)
    %spritemapEntry(1, $43FB, $00, 0, 0, 3, 1, $13C)

Spritemap_Dachora_A:
    dw $000A                                                             ;A7FBB3;
    %spritemapEntry(0, $1F9, $F3, 0, 0, 3, 1, $105)
    %spritemapEntry(0, $1F0, $F3, 0, 0, 3, 1, $110)
    %spritemapEntry(1, $43F8, $EB, 0, 0, 3, 1, $101)
    %spritemapEntry(0, $1F3, $10, 0, 0, 3, 1, $151)
    %spritemapEntry(0, $03, $F8, 0, 0, 3, 1, $11E)
    %spritemapEntry(0, $1FB, $F8, 0, 0, 3, 1, $10E)
    %spritemapEntry(0, $1F3, $04, 0, 0, 3, 1, $11F)
    %spritemapEntry(0, $1F3, $FC, 0, 0, 3, 1, $10F)
    %spritemapEntry(1, $43FB, $08, 0, 0, 3, 1, $14C)
    %spritemapEntry(1, $43FB, $00, 0, 0, 3, 1, $13C)

Spritemap_Dachora_B:
    dw $0009                                                             ;A7FBE7;
    %spritemapEntry(0, $1E5, $09, 0, 0, 3, 1, $12A)
    %spritemapEntry(1, $43E3, $F9, 0, 0, 3, 1, $13E)
    %spritemapEntry(0, $03, $F8, 0, 0, 3, 1, $12F)
    %spritemapEntry(0, $1FB, $F8, 0, 0, 3, 1, $12E)
    %spritemapEntry(0, $1F3, $08, 0, 0, 3, 1, $145)
    %spritemapEntry(0, $1F3, $00, 0, 0, 3, 1, $135)
    %spritemapEntry(0, $1F3, $10, 0, 0, 3, 1, $151)
    %spritemapEntry(1, $43FB, $08, 0, 0, 3, 1, $14C)
    %spritemapEntry(1, $43FB, $00, 0, 0, 3, 1, $13C)

Spritemap_Dachora_C:
    dw $0009                                                             ;A7FC16;
    %spritemapEntry(0, $03, $F8, 0, 0, 3, 1, $12F)
    %spritemapEntry(0, $1FB, $F8, 0, 0, 3, 1, $12E)
    %spritemapEntry(0, $1EB, $11, 0, 0, 3, 1, $141)
    %spritemapEntry(1, $43E3, $01, 0, 0, 3, 1, $120)
    %spritemapEntry(0, $1F3, $08, 0, 0, 3, 1, $142)
    %spritemapEntry(0, $1F3, $00, 0, 0, 3, 1, $132)
    %spritemapEntry(0, $1F3, $10, 0, 0, 3, 1, $151)
    %spritemapEntry(1, $43FB, $08, 0, 0, 3, 1, $14C)
    %spritemapEntry(1, $43FB, $00, 0, 0, 3, 1, $13C)

Spritemap_Dachora_D:
    dw $0009                                                             ;A7FC45;
    %spritemapEntry(0, $03, $F8, 0, 0, 3, 1, $12F)
    %spritemapEntry(0, $1FB, $F8, 0, 0, 3, 1, $12E)
    %spritemapEntry(0, $1EB, $12, 0, 0, 3, 1, $141)
    %spritemapEntry(1, $43E3, $02, 0, 0, 3, 1, $120)
    %spritemapEntry(0, $1F3, $08, 0, 0, 3, 1, $142)
    %spritemapEntry(0, $1F3, $00, 0, 0, 3, 1, $132)
    %spritemapEntry(0, $1F3, $10, 0, 0, 3, 1, $151)
    %spritemapEntry(1, $43FB, $08, 0, 0, 3, 1, $14C)
    %spritemapEntry(1, $43FB, $00, 0, 0, 3, 1, $13C)

Spritemap_Dachora_E:
    dw $0009                                                             ;A7FC74;
    %spritemapEntry(0, $03, $F8, 0, 0, 3, 1, $12F)
    %spritemapEntry(0, $1FB, $F8, 0, 0, 3, 1, $12E)
    %spritemapEntry(0, $1EB, $13, 0, 0, 3, 1, $141)
    %spritemapEntry(1, $43E3, $03, 0, 0, 3, 1, $120)
    %spritemapEntry(0, $1F3, $08, 0, 0, 3, 1, $142)
    %spritemapEntry(0, $1F3, $00, 0, 0, 3, 1, $132)
    %spritemapEntry(0, $1F3, $10, 0, 0, 3, 1, $151)
    %spritemapEntry(1, $43FB, $08, 0, 0, 3, 1, $14C)
    %spritemapEntry(1, $43FB, $00, 0, 0, 3, 1, $13C)

Spritemap_Dachora_F:
    dw $0009                                                             ;A7FCA3;
    %spritemapEntry(0, $08, $F2, 0, 1, 3, 1, $110)
    %spritemapEntry(1, $43F8, $EA, 0, 1, 3, 1, $101)
    %spritemapEntry(0, $1F6, $F7, 0, 1, 3, 1, $11E)
    %spritemapEntry(0, $1FE, $F7, 0, 1, 3, 1, $10E)
    %spritemapEntry(0, $06, $03, 0, 1, 3, 1, $11F)
    %spritemapEntry(0, $06, $FB, 0, 1, 3, 1, $10F)
    %spritemapEntry(0, $06, $0F, 0, 1, 3, 1, $122)
    %spritemapEntry(1, $43F6, $07, 0, 1, 3, 1, $113)
    %spritemapEntry(1, $43F6, $FF, 0, 1, 3, 1, $103)

Spritemap_Dachora_10:
    dw $0009                                                             ;A7FCD2;
    %spritemapEntry(0, $09, $F3, 0, 1, 3, 1, $110)
    %spritemapEntry(1, $43F9, $EB, 0, 1, 3, 1, $101)
    %spritemapEntry(0, $1F6, $F8, 0, 1, 3, 1, $15F)
    %spritemapEntry(0, $1FE, $F8, 0, 1, 3, 1, $15E)
    %spritemapEntry(0, $06, $04, 0, 1, 3, 1, $11F)
    %spritemapEntry(0, $06, $FC, 0, 1, 3, 1, $10F)
    %spritemapEntry(1, $43F6, $08, 0, 1, 3, 1, $116)
    %spritemapEntry(0, $06, $08, 0, 1, 3, 1, $115)
    %spritemapEntry(1, $43F6, $00, 0, 1, 3, 1, $106)

Spritemap_Dachora_11:
    dw $000B                                                             ;A7FD01;
    %spritemapEntry(0, $0A, $F1, 0, 1, 3, 1, $110)
    %spritemapEntry(1, $43FA, $E9, 0, 1, 3, 1, $101)
    %spritemapEntry(0, $0E, $0E, 0, 1, 3, 1, $12D)
    %spritemapEntry(0, $1F6, $F6, 0, 1, 3, 1, $11E)
    %spritemapEntry(0, $1FE, $F6, 0, 1, 3, 1, $10E)
    %spritemapEntry(0, $06, $FA, 0, 1, 3, 1, $10F)
    %spritemapEntry(1, $43F6, $FE, 0, 1, 3, 1, $109)
    %spritemapEntry(1, $43FE, $FE, 0, 1, 3, 1, $108)
    %spritemapEntry(0, $1EE, $0E, 0, 1, 3, 1, $12B)
    %spritemapEntry(0, $1EE, $06, 0, 1, 3, 1, $11B)
    %spritemapEntry(1, $43FE, $06, 0, 1, 3, 1, $118)

Spritemap_Dachora_12:
    dw $0009                                                             ;A7FD3A;
    %spritemapEntry(0, $08, $F2, 0, 1, 3, 1, $110)
    %spritemapEntry(1, $43F8, $EA, 0, 1, 3, 1, $101)
    %spritemapEntry(0, $1F6, $F7, 0, 1, 3, 1, $15F)
    %spritemapEntry(0, $1FE, $F7, 0, 1, 3, 1, $15E)
    %spritemapEntry(0, $06, $0F, 0, 1, 3, 1, $152)
    %spritemapEntry(0, $06, $03, 0, 1, 3, 1, $11F)
    %spritemapEntry(0, $06, $FB, 0, 1, 3, 1, $10F)
    %spritemapEntry(1, $43F6, $07, 0, 1, 3, 1, $143)
    %spritemapEntry(1, $43F6, $FF, 0, 1, 3, 1, $133)

Spritemap_Dachora_13:
    dw $0009                                                             ;A7FD69;
    %spritemapEntry(0, $09, $F3, 0, 1, 3, 1, $110)
    %spritemapEntry(1, $43F9, $EB, 0, 1, 3, 1, $101)
    %spritemapEntry(0, $04, $10, 0, 1, 3, 1, $152)
    %spritemapEntry(0, $06, $04, 0, 1, 3, 1, $11F)
    %spritemapEntry(0, $06, $FC, 0, 1, 3, 1, $10F)
    %spritemapEntry(0, $1F6, $F8, 0, 1, 3, 1, $11E)
    %spritemapEntry(0, $1FE, $F8, 0, 1, 3, 1, $10E)
    %spritemapEntry(1, $43F6, $08, 0, 1, 3, 1, $146)
    %spritemapEntry(1, $43F6, $00, 0, 1, 3, 1, $136)

Spritemap_Dachora_14:
    dw $000B                                                             ;A7FD98;
    %spritemapEntry(0, $0A, $F1, 0, 1, 3, 1, $110)
    %spritemapEntry(1, $43FA, $E9, 0, 1, 3, 1, $101)
    %spritemapEntry(0, $1F6, $F6, 0, 1, 3, 1, $15F)
    %spritemapEntry(0, $1FE, $F6, 0, 1, 3, 1, $15E)
    %spritemapEntry(0, $0E, $0E, 0, 1, 3, 1, $15A)
    %spritemapEntry(0, $06, $FA, 0, 1, 3, 1, $10F)
    %spritemapEntry(1, $43F6, $FE, 0, 1, 3, 1, $139)
    %spritemapEntry(1, $43FE, $06, 0, 1, 3, 1, $148)
    %spritemapEntry(0, $1EE, $06, 0, 1, 3, 1, $14B)
    %spritemapEntry(0, $1EE, $0E, 0, 1, 3, 1, $15B)
    %spritemapEntry(1, $43FE, $FE, 0, 1, 3, 1, $138)

Spritemap_Dachora_15:
    dw $0008                                                             ;A7FDD1;
    %spritemapEntry(0, $02, $FD, 0, 1, 3, 1, $105)
    %spritemapEntry(0, $0B, $FD, 0, 1, 3, 1, $110)
    %spritemapEntry(1, $43FB, $F5, 0, 1, 3, 1, $101)
    %spritemapEntry(0, $05, $08, 0, 1, 3, 1, $11F)
    %spritemapEntry(0, $05, $00, 0, 1, 3, 1, $10F)
    %spritemapEntry(0, $1F5, $FD, 0, 1, 3, 1, $11E)
    %spritemapEntry(0, $1FD, $FD, 0, 1, 3, 1, $10E)
    %spritemapEntry(1, $43F5, $05, 0, 1, 3, 1, $10C)

Spritemap_Dachora_16:
    dw $000A                                                             ;A7FDFB;
    %spritemapEntry(0, $1F5, $F1, 0, 1, 3, 1, $11E)
    %spritemapEntry(0, $1FD, $F1, 0, 1, 3, 1, $10E)
    %spritemapEntry(0, $05, $FD, 0, 1, 3, 1, $11F)
    %spritemapEntry(0, $05, $F5, 0, 1, 3, 1, $10F)
    %spritemapEntry(1, $43F5, $F9, 0, 1, 3, 1, $13C)
    %spritemapEntry(0, $1FA, $DF, 1, 0, 3, 1, $141)
    %spritemapEntry(1, $43F2, $E7, 1, 0, 3, 1, $120)
    %spritemapEntry(0, $1F5, $09, 0, 1, 3, 1, $15D)
    %spritemapEntry(0, $1FD, $09, 0, 1, 3, 1, $150)
    %spritemapEntry(0, $1FD, $11, 0, 1, 3, 1, $125)

Spritemap_Dachora_17:
    dw $0009                                                             ;A7FE2F;
    %spritemapEntry(0, $08, $F3, 0, 1, 3, 1, $110)
    %spritemapEntry(1, $43F8, $EB, 0, 1, 3, 1, $101)
    %spritemapEntry(0, $05, $10, 0, 1, 3, 1, $151)
    %spritemapEntry(0, $1F5, $F8, 0, 1, 3, 1, $11E)
    %spritemapEntry(0, $1FD, $F8, 0, 1, 3, 1, $10E)
    %spritemapEntry(0, $05, $04, 0, 1, 3, 1, $11F)
    %spritemapEntry(0, $05, $FC, 0, 1, 3, 1, $10F)
    %spritemapEntry(1, $43F5, $08, 0, 1, 3, 1, $14C)
    %spritemapEntry(1, $43F5, $00, 0, 1, 3, 1, $13C)

Spritemap_Dachora_18:
    dw $000A                                                             ;A7FE5E;
    %spritemapEntry(0, $1FF, $F3, 0, 1, 3, 1, $140)
    %spritemapEntry(0, $08, $F3, 0, 1, 3, 1, $110)
    %spritemapEntry(1, $43F8, $EB, 0, 1, 3, 1, $101)
    %spritemapEntry(0, $05, $10, 0, 1, 3, 1, $151)
    %spritemapEntry(0, $1F5, $F8, 0, 1, 3, 1, $11E)
    %spritemapEntry(0, $1FD, $F8, 0, 1, 3, 1, $10E)
    %spritemapEntry(0, $05, $04, 0, 1, 3, 1, $11F)
    %spritemapEntry(0, $05, $FC, 0, 1, 3, 1, $10F)
    %spritemapEntry(1, $43F5, $08, 0, 1, 3, 1, $14C)
    %spritemapEntry(1, $43F5, $00, 0, 1, 3, 1, $13C)

Spritemap_Dachora_19:
    dw $000A                                                             ;A7FE92;
    %spritemapEntry(0, $1FF, $F3, 0, 1, 3, 1, $105)
    %spritemapEntry(0, $08, $F3, 0, 1, 3, 1, $110)
    %spritemapEntry(1, $43F8, $EB, 0, 1, 3, 1, $101)
    %spritemapEntry(0, $05, $10, 0, 1, 3, 1, $151)
    %spritemapEntry(0, $1F5, $F8, 0, 1, 3, 1, $11E)
    %spritemapEntry(0, $1FD, $F8, 0, 1, 3, 1, $10E)
    %spritemapEntry(0, $05, $04, 0, 1, 3, 1, $11F)
    %spritemapEntry(0, $05, $FC, 0, 1, 3, 1, $10F)
    %spritemapEntry(1, $43F5, $08, 0, 1, 3, 1, $14C)
    %spritemapEntry(1, $43F5, $00, 0, 1, 3, 1, $13C)

Spritemap_Dachora_1A:
    dw $0009                                                             ;A7FEC6;
    %spritemapEntry(0, $13, $09, 0, 1, 3, 1, $12A)
    %spritemapEntry(1, $420D, $F9, 0, 1, 3, 1, $13E)
    %spritemapEntry(0, $1F5, $F8, 0, 1, 3, 1, $12F)
    %spritemapEntry(0, $1FD, $F8, 0, 1, 3, 1, $12E)
    %spritemapEntry(0, $05, $08, 0, 1, 3, 1, $145)
    %spritemapEntry(0, $05, $00, 0, 1, 3, 1, $135)
    %spritemapEntry(0, $05, $10, 0, 1, 3, 1, $151)
    %spritemapEntry(1, $43F5, $08, 0, 1, 3, 1, $14C)
    %spritemapEntry(1, $43F5, $00, 0, 1, 3, 1, $13C)

Spritemap_Dachora_1B:
    dw $0009                                                             ;A7FEF5;
    %spritemapEntry(0, $1F5, $F8, 0, 1, 3, 1, $12F)
    %spritemapEntry(0, $1FD, $F8, 0, 1, 3, 1, $12E)
    %spritemapEntry(0, $0D, $11, 0, 1, 3, 1, $141)
    %spritemapEntry(1, $420D, $01, 0, 1, 3, 1, $120)
    %spritemapEntry(0, $05, $08, 0, 1, 3, 1, $142)
    %spritemapEntry(0, $05, $00, 0, 1, 3, 1, $132)
    %spritemapEntry(0, $05, $10, 0, 1, 3, 1, $151)
    %spritemapEntry(1, $43F5, $08, 0, 1, 3, 1, $14C)
    %spritemapEntry(1, $43F5, $00, 0, 1, 3, 1, $13C)

Spritemap_Dachora_1C:
    dw $0009                                                             ;A7FF24;
    %spritemapEntry(0, $1F5, $F8, 0, 1, 3, 1, $12F)
    %spritemapEntry(0, $1FD, $F8, 0, 1, 3, 1, $12E)
    %spritemapEntry(0, $0D, $12, 0, 1, 3, 1, $141)
    %spritemapEntry(1, $420D, $02, 0, 1, 3, 1, $120)
    %spritemapEntry(0, $05, $08, 0, 1, 3, 1, $142)
    %spritemapEntry(0, $05, $00, 0, 1, 3, 1, $132)
    %spritemapEntry(0, $05, $10, 0, 1, 3, 1, $151)
    %spritemapEntry(1, $43F5, $08, 0, 1, 3, 1, $14C)
    %spritemapEntry(1, $43F5, $00, 0, 1, 3, 1, $13C)

Spritemap_Dachora_1D:
    dw $0009                                                             ;A7FF53;
    %spritemapEntry(0, $1F5, $F8, 0, 1, 3, 1, $12F)
    %spritemapEntry(0, $1FD, $F8, 0, 1, 3, 1, $12E)
    %spritemapEntry(0, $0D, $13, 0, 1, 3, 1, $141)
    %spritemapEntry(1, $420D, $03, 0, 1, 3, 1, $120)
    %spritemapEntry(0, $05, $08, 0, 1, 3, 1, $142)
    %spritemapEntry(0, $05, $00, 0, 1, 3, 1, $132)
    %spritemapEntry(0, $05, $10, 0, 1, 3, 1, $151)
    %spritemapEntry(1, $43F5, $08, 0, 1, 3, 1, $14C)
    %spritemapEntry(1, $43F5, $00, 0, 1, 3, 1, $13C)


Freespace_BankA7_FF82:                                                   ;A7FF82;
; $7E bytes
