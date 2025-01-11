Palette_Stoke:
    dw $3800,$3DB3,$292E,$1486,$1840,$3D92,$38CA,$1C61                   ;A28912;
    dw $24A7,$24A7,$2063,$1840,$0800,$0000,$0000,$0000                   ;A28922;

InstList_Stoke_MovingLeft_0:
    dw Instruction_Stoke_SetMovingLeft                                   ;A28932;

InstList_Stoke_MovingLeft_1:
    dw $0008                                                             ;A28934;
    dw Spritemap_Stoke_MovingLeft_0                                      ;A28936;
    dw $0010                                                             ;A28938;
    dw Spritemap_Stoke_MovingLeft_1                                      ;A2893A;
    dw $0008                                                             ;A2893C;
    dw Spritemap_Stoke_MovingLeft_2                                      ;A2893E;
    dw $0008                                                             ;A28940;
    dw Spritemap_Stoke_MovingLeft_3                                      ;A28942;
    dw Instruction_Common_GotoY                                          ;A28944;
    dw InstList_Stoke_MovingLeft_1                                       ;A28946;

InstList_Stoke_AttackingLeft:
    dw $0010                                                             ;A28948;
    dw Spritemap_Stoke_MovingLeft_2                                      ;A2894A;
    dw Instruction_Stoke_SpawnProjectileWithDirectionInY                 ;A2894C;
    dw $0000,$0010                                                       ;A2894E;
    dw Spritemap_Stoke_AttackingLeft                                     ;A28952;
    dw Instruction_Common_GotoY                                          ;A28954;
    dw InstList_Stoke_MovingLeft_0                                       ;A28956;

InstList_Stoke_MovingRight_0:
    dw Instruction_Stoke_SetMovingRight                                  ;A28958;

InstList_Stoke_MovingRight_1:
    dw $0008                                                             ;A2895A;
    dw Spritemap_Stoke_MovingRight_0                                     ;A2895C;
    dw $0010                                                             ;A2895E;
    dw Spritemap_Stoke_MovingRight_1                                     ;A28960;
    dw $0008                                                             ;A28962;
    dw Spritemap_Stoke_MovingRight_2                                     ;A28964;
    dw $0008                                                             ;A28966;
    dw Spritemap_Stoke_MovingRight_3                                     ;A28968;
    dw Instruction_Common_GotoY                                          ;A2896A;
    dw InstList_Stoke_MovingRight_1                                      ;A2896C;

InstList_Stoke_AttackingRight:
    dw $0010                                                             ;A2896E;
    dw Spritemap_Stoke_MovingRight_2                                     ;A28970;
    dw Instruction_Stoke_SpawnProjectileWithDirectionInY                 ;A28972;
    dw $0001,$0010                                                       ;A28974;
    dw Spritemap_Stoke_AttackingRight                                    ;A28978;
    dw Instruction_Common_GotoY                                          ;A2897A;
    dw InstList_Stoke_MovingRight_0                                      ;A2897C;

Instruction_Stoke_SpawnProjectileWithDirectionInY:
    PHY                                                                  ;A2897E;
    LDA.W $0000,Y                                                        ;A2897F;
    LDX.W $0E54                                                          ;A28982;
    LDY.W #UNUSED_EnemyProjectile_Stoke_86DBF2                           ;A28985;
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics                     ;A28988;
    PLY                                                                  ;A2898C;
    INY                                                                  ;A2898D;
    INY                                                                  ;A2898E;
    RTL                                                                  ;A2898F;


Instruction_Stoke_SetMovingLeft:
    LDX.W $0E54                                                          ;A28990;
    LDA.W #Function_Stoke_MovingLeft                                     ;A28993;
    STA.W EnemyData.work5,X                                              ;A28996;
    STZ.W EnemyData.work4,X                                              ;A28999;
    RTL                                                                  ;A2899C;


Instruction_Stoke_SetMovingRight:
    LDX.W $0E54                                                          ;A2899D;
    LDA.W #Function_Stoke_MovingRight                                    ;A289A0;
    STA.W EnemyData.work5,X                                              ;A289A3;
    LDA.W #$0001                                                         ;A289A6;
    STA.W EnemyData.work4,X                                              ;A289A9;
    RTL                                                                  ;A289AC;


InitAI_Stoke:
    LDX.W $0E54                                                          ;A289AD;
    LDA.W #Spritemap_CommonA2_Nothing                                    ;A289B0;
    STA.W EnemyData.pSpritemap,X                                         ;A289B3;
    LDA.W EnemyData.initParam1,X                                         ;A289B6;
    ASL A                                                                ;A289B9;
    ASL A                                                                ;A289BA;
    ASL A                                                                ;A289BB;
    TAY                                                                  ;A289BC;
    LDA.W CommonEnemySpeeds_LinearlyIncreasing,Y                         ;A289BD;
    STA.W EnemyData.work1,X                                              ;A289C0;
    LDA.W CommonEnemySpeeds_LinearlyIncreasing+2,Y                       ;A289C3;
    STA.W EnemyData.work0,X                                              ;A289C6;
    LDA.W CommonEnemySpeeds_LinearlyIncreasing+4,Y                       ;A289C9;
    STA.W EnemyData.work3,X                                              ;A289CC;
    LDA.W CommonEnemySpeeds_LinearlyIncreasing+6,Y                       ;A289CF;
    STA.W EnemyData.work2,X                                              ;A289D2;
    JSR.W SetStokeMovingLeftInstList                                     ;A289D5;
    LDA.W #Function_Stoke_MovingLeft                                     ;A289D8;
    STA.W EnemyData.work5,X                                              ;A289DB;
    LDA.W EnemyData.initParam0,X                                         ;A289DE;
    STA.W EnemyData.work4,X                                              ;A289E1;
    BEQ .return                                                          ;A289E4;
    JSR.W SetStokeMovingRightInstList                                    ;A289E6;
    LDA.W #Function_Stoke_MovingRight                                    ;A289E9;
    STA.W EnemyData.work5,X                                              ;A289EC;

.return:
    RTL                                                                  ;A289EF;


MainAI_Stoke:
    LDX.W $0E54                                                          ;A289F0;
    JSR.W ($0FB2,X)                                                      ;A289F3;
    RTL                                                                  ;A289F6;


SetStokeMovingLeftInstList:
    LDX.W $0E54                                                          ;A289F7;
    LDA.W #$0001                                                         ;A289FA;
    STA.W EnemyData.instTimer,X                                          ;A289FD;
    STZ.W EnemyData.loopCounter,X                                        ;A28A00;
    LDA.W #InstList_Stoke_MovingLeft_0                                   ;A28A03;
    STA.W EnemyData.pInstList,X                                          ;A28A06;
    RTS                                                                  ;A28A09;


SetStokeAttackingLeftInstList:
    LDX.W $0E54                                                          ;A28A0A;
    LDA.W #$0001                                                         ;A28A0D;
    STA.W EnemyData.instTimer,X                                          ;A28A10;
    STZ.W EnemyData.loopCounter,X                                        ;A28A13;
    LDA.W #InstList_Stoke_AttackingLeft                                  ;A28A16;
    STA.W EnemyData.pInstList,X                                          ;A28A19;
    RTS                                                                  ;A28A1C;


SetStokeMovingRightInstList:
    LDX.W $0E54                                                          ;A28A1D;
    LDA.W #$0001                                                         ;A28A20;
    STA.W EnemyData.instTimer,X                                          ;A28A23;
    STZ.W EnemyData.loopCounter,X                                        ;A28A26;
    LDA.W #InstList_Stoke_MovingRight_0                                  ;A28A29;
    STA.W EnemyData.pInstList,X                                          ;A28A2C;
    RTS                                                                  ;A28A2F;


SetStokeAttackingRightInstList:
    LDX.W $0E54                                                          ;A28A30;
    LDA.W #$0001                                                         ;A28A33;
    STA.W EnemyData.instTimer,X                                          ;A28A36;
    STZ.W EnemyData.loopCounter,X                                        ;A28A39;
    LDA.W #InstList_Stoke_AttackingRight                                 ;A28A3C;
    STA.W EnemyData.pInstList,X                                          ;A28A3F;
    RTS                                                                  ;A28A42;


Function_Stoke_MovingLeft:
    LDX.W $0E54                                                          ;A28A43;
    LDA.W EnemyData.work3,X                                              ;A28A46;
    STA.B $14                                                            ;A28A49;
    LDA.W EnemyData.work2,X                                              ;A28A4B;
    STA.B $12                                                            ;A28A4E;
    JSR.W StokeMovement                                                  ;A28A50;
    JSR.W DecideWhetherToAttack                                          ;A28A53;
    BCC .return                                                          ;A28A56;
    JSR.W SetStokeAttackingLeftInstList                                  ;A28A58;

.return:
    RTS                                                                  ;A28A5B;


Function_Stoke_MovingRight:
    LDX.W $0E54                                                          ;A28A5C;
    LDA.W EnemyData.work1,X                                              ;A28A5F;
    STA.B $14                                                            ;A28A62;
    LDA.W EnemyData.work0,X                                              ;A28A64;
    STA.B $12                                                            ;A28A67;
    JSR.W StokeMovement                                                  ;A28A69;
    JSR.W DecideWhetherToAttack                                          ;A28A6C;
    BCC .return                                                          ;A28A6F;
    JSR.W SetStokeAttackingRightInstList                                 ;A28A71;

.return:
    RTS                                                                  ;A28A74;


RTS_A28A75:
    RTS                                                                  ;A28A75;


StokeMovement:
    LDX.W $0E54                                                          ;A28A76;
    JSL.L MoveEnemyRightBy_14_12_IgnoreSlopes                            ;A28A79;
    BCC .notCollidedWithWall                                             ;A28A7D;
    JSR.W TurnStokeAround                                                ;A28A7F;
    BRA .return                                                          ;A28A82;


.notCollidedWithWall:
    LDA.W #$0002                                                         ;A28A84;
    STA.B $14                                                            ;A28A87;
    STZ.B $12                                                            ;A28A89;
    JSL.L CheckForVerticalSolidBlockCollision                            ;A28A8B;
    BCS .return                                                          ;A28A8F;
    JSR.W TurnStokeAround                                                ;A28A91;

.return:
    RTS                                                                  ;A28A94;


TurnStokeAround:
    LDX.W $0E54                                                          ;A28A95;
    JSR.W SetStokeMovingLeftInstList                                     ;A28A98;
    LDA.W EnemyData.work4,X                                              ;A28A9B;
    EOR.W #$0001                                                         ;A28A9E;
    BEQ .return                                                          ;A28AA1;
    JSR.W SetStokeMovingRightInstList                                    ;A28AA3;

.return:
    RTS                                                                  ;A28AA6;


DecideWhetherToAttack:
    LDX.W $0E54                                                          ;A28AA7;
    JSL.L GenerateRandomNumber                                           ;A28AAA;
    LDA.W $05E5                                                          ;A28AAE;
    CLC                                                                  ;A28AB1;
    ADC.W EnemyData.frameCounter,X                                       ;A28AB2;
    AND.W #$00FF                                                         ;A28AB5;
    CMP.W #$0002                                                         ;A28AB8;
    BPL .returnNoAttack                                                  ;A28ABB;
    LDA.W #RTS_A28A75                                                    ;A28ABD;
    STA.W EnemyData.work5,X                                              ;A28AC0;
    SEC                                                                  ;A28AC3;
    BRA .return                                                          ;A28AC4;


.returnNoAttack:
    CLC                                                                  ;A28AC6;

.return:
    RTS                                                                  ;A28AC7;


RTL_A28AC8:
    RTL                                                                  ;A28AC8;


RTL_A28AC9:
    RTL                                                                  ;A28AC9;


Spritemap_Stoke_MovingLeft_0:
    dw $0002                                                             ;A28ACA;
    %spritemapEntry(1, $43FE, $F8, 0, 0, 2, 0, $101)
    %spritemapEntry(1, $43F6, $F8, 0, 0, 2, 0, $100)

Spritemap_Stoke_MovingLeft_1:
    dw $0003                                                             ;A28AD6;
    %spritemapEntry(0, $1FE, $F0, 0, 0, 2, 0, $10F)
    %spritemapEntry(1, $43FE, $F8, 0, 0, 2, 0, $104)
    %spritemapEntry(1, $43F6, $F8, 0, 0, 2, 0, $103)

Spritemap_Stoke_MovingLeft_2:
    dw $0002                                                             ;A28AE7;
    %spritemapEntry(1, $43F6, $F8, 0, 0, 2, 0, $106)
    %spritemapEntry(1, $43FE, $F8, 0, 0, 2, 0, $101)

Spritemap_Stoke_MovingLeft_3:
    dw $0002                                                             ;A28AF3;
    %spritemapEntry(1, $43FE, $F8, 0, 0, 2, 0, $101)
    %spritemapEntry(1, $43F6, $F8, 0, 0, 2, 0, $108)

Spritemap_Stoke_AttackingLeft:
    dw $0004                                                             ;A28AFF;
    %spritemapEntry(0, $1FE, $F0, 0, 0, 2, 0, $10E)
    %spritemapEntry(0, $1F6, $F0, 0, 0, 2, 0, $10D)
    %spritemapEntry(1, $43FE, $F8, 0, 0, 2, 0, $10B)
    %spritemapEntry(1, $43F6, $F8, 0, 0, 2, 0, $10A)

Spritemap_Stoke_MovingRight_0:
    dw $0002                                                             ;A28B15;
    %spritemapEntry(1, $43F2, $F8, 0, 1, 2, 0, $101)
    %spritemapEntry(1, $43FA, $F8, 0, 1, 2, 0, $100)

Spritemap_Stoke_MovingRight_1:
    dw $0003                                                             ;A28B21;
    %spritemapEntry(0, $1FA, $F0, 0, 1, 2, 0, $10F)
    %spritemapEntry(1, $43F2, $F8, 0, 1, 2, 0, $104)
    %spritemapEntry(1, $43FA, $F8, 0, 1, 2, 0, $103)

Spritemap_Stoke_MovingRight_2:
    dw $0002                                                             ;A28B32;
    %spritemapEntry(1, $43FA, $F8, 0, 1, 2, 0, $106)
    %spritemapEntry(1, $43F2, $F8, 0, 1, 2, 0, $101)

Spritemap_Stoke_MovingRight_3:
    dw $0002                                                             ;A28B3E;
    %spritemapEntry(1, $43F2, $F8, 0, 1, 2, 0, $101)
    %spritemapEntry(1, $43FA, $F8, 0, 1, 2, 0, $108)

Spritemap_Stoke_AttackingRight:
    dw $0004                                                             ;A28B4A;
    %spritemapEntry(0, $1FA, $F0, 0, 1, 2, 0, $10E)
    %spritemapEntry(0, $02, $F0, 0, 1, 2, 0, $10D)
    %spritemapEntry(1, $43F2, $F8, 0, 1, 2, 0, $10B)
    %spritemapEntry(1, $43FA, $F8, 0, 1, 2, 0, $10A)
