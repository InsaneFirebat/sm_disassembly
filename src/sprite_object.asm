SpriteObjectRom:
Create_Sprite_Object:
    PHX                                                                  ;B4BC26;
    PHY                                                                  ;B4BC27;
    PHP                                                                  ;B4BC28;
    PHB                                                                  ;B4BC29;
    PEA.W (SpriteObjectRom>>16)<<8                                       ;B4BC2A;
    PLB                                                                  ;B4BC2D;
    PLB                                                                  ;B4BC2E;
    REP #$30                                                             ;B4BC2F;
    LDX.W #!SpriteObjectMaxCount*2-2                                     ;B4BC31;

.loop:
    LDA.L SpriteObjects.pInstList,X                                      ;B4BC34;
    BEQ .found                                                           ;B4BC38;
    DEX                                                                  ;B4BC3A;
    DEX                                                                  ;B4BC3B;
    BPL .loop                                                            ;B4BC3C;
    BRA .return                                                          ;B4BC3E;


.found:
    LDA.W #$0000                                                         ;B4BC40;
    STA.L SpriteObjects.palGfxOffset,X                                   ;B4BC43;
    STA.L SpriteObjects.xSubPosition,X                                   ;B4BC47;
    STA.L SpriteObjects.ySubPosition,X                                   ;B4BC4B;
    STA.L SpriteObjects.frozen,X                                         ;B4BC4F;
    LDA.B $12                                                            ;B4BC53;
    STA.L SpriteObjects.xPosition,X                                      ;B4BC55;
    LDA.B $14                                                            ;B4BC59;
    STA.L SpriteObjects.yPosition,X                                      ;B4BC5B;
    LDA.B $18                                                            ;B4BC5F;
    STA.L SpriteObjects.palGfxOffset,X                                   ;B4BC61;
    LDA.B $16                                                            ;B4BC65;
    ASL A                                                                ;B4BC67;
    TAY                                                                  ;B4BC68;
    LDA.W SpriteObject_DrawInst_Pointers,Y                               ;B4BC69;
    STA.L SpriteObjects.pInstList,X                                      ;B4BC6C;
    PHX                                                                  ;B4BC70;
    TAX                                                                  ;B4BC71;
    LDA.L SpriteObjectInstruction.timerOrPAsm,X                          ;B4BC72;
    PLX                                                                  ;B4BC76;
    STA.L SpriteObjects.instTimer,X                                      ;B4BC77;
    STX.B $12                                                            ;B4BC7B;

.return:
    PLB                                                                  ;B4BC7D;
    PLP                                                                  ;B4BC7E;
    PLY                                                                  ;B4BC7F;
    PLX                                                                  ;B4BC80;
    RTL                                                                  ;B4BC81;


HandleSpriteObjects:
    PHX                                                                  ;B4BC82;
    PHY                                                                  ;B4BC83;
    PHP                                                                  ;B4BC84;
    PHB                                                                  ;B4BC85;
    PEA.W (SpriteObjectRom>>16)<<8                                       ;B4BC86;
    PLB                                                                  ;B4BC89;
    PLB                                                                  ;B4BC8A;
    REP #$30                                                             ;B4BC8B;
    LDA.W $0A78                                                          ;B4BC8D;
    ORA.W $185E                                                          ;B4BC90;
    BNE .return                                                          ;B4BC93;
    LDX.W #!SpriteObjectMaxCount*2-2                                     ;B4BC95;
    STX.W $1844                                                          ;B4BC98;

.loop:
    LDX.W $1844                                                          ;B4BC9B;
    LDA.L SpriteObjects.pInstList,X                                      ;B4BC9E;
    BEQ .next                                                            ;B4BCA2;
    LDA.L SpriteObjects.frozen,X                                         ;B4BCA4;
    BIT.W #$0001                                                         ;B4BCA8;
    BNE .next                                                            ;B4BCAB;
    LDA.L SpriteObjects.instTimer,X                                      ;B4BCAD;
    BMI .ASMInstruction                                                  ;B4BCB1;
    DEC A                                                                ;B4BCB3;
    STA.L SpriteObjects.instTimer,X                                      ;B4BCB4;
    BNE .next                                                            ;B4BCB8;
    LDA.L SpriteObjects.pInstList,X                                      ;B4BCBA;
    INC A                                                                ;B4BCBE;
    INC A                                                                ;B4BCBF;
    INC A                                                                ;B4BCC0;
    INC A                                                                ;B4BCC1;
    STA.L SpriteObjects.pInstList,X                                      ;B4BCC2;
    TAX                                                                  ;B4BCC6;
    LDA.L SpriteObjectInstruction.timerOrPAsm,X                          ;B4BCC7;
    CMP.W #$8000                                                         ;B4BCCB;
    BPL .ASMInstruction                                                  ;B4BCCE;
    LDX.W $1844                                                          ;B4BCD0;
    STA.L SpriteObjects.instTimer,X                                      ;B4BCD3;

.next:
    LDA.W $1844                                                          ;B4BCD7;
    DEC A                                                                ;B4BCDA;
    DEC A                                                                ;B4BCDB;
    STA.W $1844                                                          ;B4BCDC;
    BPL .loop                                                            ;B4BCDF;
    BRA .return                                                          ;B4BCE1;


.ASMInstruction:
    STA.B $12                                                            ;B4BCE3;
    PEA.W .next-1                                                        ;B4BCE5;
    JMP.W ($0012)                                                        ;B4BCE8;


.return:
    PLB                                                                  ;B4BCEB;
    PLP                                                                  ;B4BCEC;
    PLY                                                                  ;B4BCED;
    PLX                                                                  ;B4BCEE;
    RTL                                                                  ;B4BCEF;


Instruction_SpriteObject_GoBack4Bytes:
    LDX.W $1844                                                          ;B4BCF0;
    LDA.L SpriteObjects.pInstList,X                                      ;B4BCF3;
    DEC A                                                                ;B4BCF7;
    DEC A                                                                ;B4BCF8;
    DEC A                                                                ;B4BCF9;
    DEC A                                                                ;B4BCFA;
    STA.L SpriteObjects.pInstList,X                                      ;B4BCFB;
    LDA.W #$7FFF                                                         ;B4BCFF;
    STA.L SpriteObjects.instTimer,X                                      ;B4BD02;
    RTS                                                                  ;B4BD06;


Instruction_SpriteObject_Delete:
    LDX.W $1844                                                          ;B4BD07;
    LDA.W #$0000                                                         ;B4BD0A;
    STA.L SpriteObjects.pInstList,X                                      ;B4BD0D;
    RTS                                                                  ;B4BD11;


Instruction_SpriteObject_GotoParameter:
    LDX.W $1844                                                          ;B4BD12;
    LDA.L SpriteObjects.pInstList,X                                      ;B4BD15;
    TAX                                                                  ;B4BD19;
    LDA.L SpriteObjectInstruction.parameters+0,X                         ;B4BD1A;
    LDX.W $1844                                                          ;B4BD1E;
    STA.L SpriteObjects.pInstList,X                                      ;B4BD21;
    TAX                                                                  ;B4BD25;
    LDA.L SpriteObjectInstruction.timerOrPAsm,X                          ;B4BD26;
    LDX.W $1844                                                          ;B4BD2A;
    STA.L SpriteObjects.instTimer,X                                      ;B4BD2D;
    RTS                                                                  ;B4BD31;


DrawSpriteObjects:
    PHX                                                                  ;B4BD32;
    PHY                                                                  ;B4BD33;
    PHP                                                                  ;B4BD34;
    PHB                                                                  ;B4BD35;
    PEA.W (SpriteObjectRom>>16)<<8                                       ;B4BD36;
    PLB                                                                  ;B4BD39;
    PLB                                                                  ;B4BD3A;
    REP #$30                                                             ;B4BD3B;
    LDX.W #!SpriteObjectMaxCount*2-2                                     ;B4BD3D;

.loop:
    LDA.L SpriteObjects.pInstList,X                                      ;B4BD40;
    BEQ .next                                                            ;B4BD44;
    LDA.L SpriteObjects.xPosition,X                                      ;B4BD46;
    SEC                                                                  ;B4BD4A;
    SBC.W $0911                                                          ;B4BD4B;
    STA.B $14                                                            ;B4BD4E;
    CLC                                                                  ;B4BD50;
    ADC.W #$0010                                                         ;B4BD51;
    BMI .next                                                            ;B4BD54;
    CMP.W #$0120                                                         ;B4BD56;
    BPL .next                                                            ;B4BD59;
    LDA.L SpriteObjects.yPosition,X                                      ;B4BD5B;
    SEC                                                                  ;B4BD5F;
    SBC.W $0915                                                          ;B4BD60;
    STA.B $12                                                            ;B4BD63;
    BMI .next                                                            ;B4BD65;
    CMP.W #$0110                                                         ;B4BD67;
    BPL .next                                                            ;B4BD6A;
    LDA.L SpriteObjects.palGfxOffset,X                                   ;B4BD6C;
    AND.W #$0E00                                                         ;B4BD70;
    STA.B $03                                                            ;B4BD73;
    LDA.L SpriteObjects.palGfxOffset,X                                   ;B4BD75;
    AND.W #$01FF                                                         ;B4BD79;
    STA.B $00                                                            ;B4BD7C;
    PHX                                                                  ;B4BD7E;
    LDA.L SpriteObjects.pInstList,X                                      ;B4BD7F;
    TAX                                                                  ;B4BD83;
    LDA.L SpriteObjectInstruction.parameters+0,X                         ;B4BD84;
    TAY                                                                  ;B4BD88;
    JSL.L AddSpritemapToOAM_WithBaseTileNumber_8AB8                      ;B4BD89;
    PLX                                                                  ;B4BD8D;

.next:
    DEX                                                                  ;B4BD8E;
    DEX                                                                  ;B4BD8F;
    BPL .loop                                                            ;B4BD90;
    PLB                                                                  ;B4BD92;
    PLP                                                                  ;B4BD93;
    PLY                                                                  ;B4BD94;
    PLX                                                                  ;B4BD95;
    RTL                                                                  ;B4BD96;


ClearSpriteObjects:
; BUG: Doesn't clear $7E:EF78 due to wrong branch instruction,
; causes a crash during door transition if 32 sprite objects are created
    LDX.W #sizeof(SpriteObjects)-2                                       ;B4BD97;
    LDA.W #$0000                                                         ;B4BD9A;

.loop:
    STA.L SpriteObjects.all,X                                            ;B4BD9D;
    DEX                                                                  ;B4BDA1;
    DEX                                                                  ;B4BDA2;
    BNE .loop                                                            ;B4BDA3;
    RTL                                                                  ;B4BDA5;


SpriteObject_DrawInst_Empty:
    dw $0000                                                             ;B4BDA6;

SpriteObject_DrawInst_Pointers:
    dw UNUSED_InstList_SpriteObject_0_BeamCharge_B4BE5A                  ;B4BDA8;
    dw UNUSED_InstList_SpriteObject_1_MBElbowChargeParticles_B4BE6C      ;B4BDAA;
    dw UNSUED_InstList_SpriteObject_2_MBElbowChargeEnergy_B4BE86         ;B4BDAC;
    dw InstList_SpriteObject_3_SmallExplosion                            ;B4BDAE;
    dw UNUSED_InstList_SpriteObject_4_BombExplosion_B4BEBE               ;B4BDB0;
    dw UNUSED_InstList_SpriteObject_5_BeamTrail_B4BED4                   ;B4BDB2;
    dw InstList_SpriteObject_6_DudShot                                   ;B4BDB4;
    dw UNUSED_InstList_SpriteObject_7_PowerBomb_B4BF04                   ;B4BDB6;
    dw UNUSED_InstList_SpriteObject_8_ElevatorPad_B4BF12                 ;B4BDB8;
    dw InstList_SpriteObject_9_SmallDudShot                              ;B4BDBA;
    dw InstList_SpriteObject_A_SpacePirateLandingDustCloud               ;B4BDBC;
    dw UNUSED_InstList_SpriteObject_B_EyeDoorSweatDrop_B4BF44            ;B4BDBE;
    dw InstList_SpriteObject_C_Smoke                                     ;B4BDC0;
    dw UNUSED_InstList_SpriteObject_D_SmallEnergyDrop_B4BF8E             ;B4BDC2;
    dw UNUSED_InstList_SpriteObject_E_BigEnergyDrop_B4BFA0               ;B4BDC4;
    dw UNUSED_InstList_SpriteObject_F_Bomb_B4BFB2                        ;B4BDC6;
    dw UNUSED_InstList_SpriteObject_10_WeirdSmallEnergyDrop_B4BFC4       ;B4BDC8;
    dw UNUSED_InstList_SpriteObject_11_RockParticles_B4BFD2              ;B4BDCA;
    dw InstList_SpriteObject_12_ShortBigDustCloud                        ;B4BDCC;
    dw UNUSED_InstList_SpriteObject_13_ShortBigDustCloudBeam_B4C026      ;B4BDCE;
    dw UNUSED_InstList_SpriteObject_14_ShortBigDustCloudBeam_B4C040      ;B4BDD0;
    dw InstList_SpriteObject_15_BigDustCloud                             ;B4BDD2;
    dw UNUSED_InstList_SpriteObject_16_WeirdLongBeam_B4C080              ;B4BDD4;
    dw UNUSED_InstList_SpriteObject_17_WeirdLongFlickerBeam_B4C0FE       ;B4BDD6;
    dw InstList_SpriteObject_18_ShortDraygonBreathBubbles                ;B4BDD8;
    dw UNSUED_InstList_SpriteObject_19_SaveStationElectricity            ;B4BDDA;
    dw UNUSED_InstList_SpriteObject_1A_ExpandingVerticalGate_B4C154      ;B4BDDC;
    dw UNUSED_InstList_SpriteObject_1B_ContractingVerticalGate           ;B4BDDE;
    dw UNUSED_InstList_SpriteObject_1C_ElevatorPad_B4BF68                ;B4BDE0;
    dw InstList_SpriteObject_1D_BigExplosion                             ;B4BDE2;
    dw UNUSED_InstList_SpriteObject_1E_B4C198                            ;B4BDE4;
    dw UNUSED_InstList_SpriteObject_1F_B4C1AC                            ;B4BDE6;
    dw UNUSED_InstList_SpriteObject_20_B4C1C0                            ;B4BDE8;
    dw UNUSED_InstList_SpriteObject_21_B4C1D4                            ;B4BDEA;
    dw UNUSED_InstList_SpriteObject_22_B4C1E8                            ;B4BDEC;
    dw UNUSED_InstList_SpriteObject_23_B4C1FC                            ;B4BDEE;
    dw UNUSED_InstList_SpriteObject_24_B4C210                            ;B4BDF0;
    dw UNUSED_InstList_SpriteObject_25_B4C224                            ;B4BDF2;
    dw UNUSED_InstList_SpriteObject_26_B4C238                            ;B4BDF4;
    dw UNUSED_InstList_SpriteObject_27_B4C258                            ;B4BDF6;
    dw UNUSED_InstList_SpriteObject_28_B4C2A0                            ;B4BDF8;
    dw UNUSED_InstList_SpriteObject_29_B4C2BC                            ;B4BDFA;
    dw UNUSED_InstList_SpriteObject_2A_B4C304                            ;B4BDFC;
    dw InstList_SpriteObject_2B_PuromiBody                               ;B4BDFE;
    dw InstList_SpriteObject_2C_PuromiRightExplosion                     ;B4BE00;
    dw InstList_SpriteObject_2D_PuromiLeftExplosion                      ;B4BE02;
    dw InstList_SpriteObject_2E_PuromiSplash                             ;B4BE04;
    dw UNUSED_InstList_SpriteObject_2F_B4BE54                            ;B4BE06;
    dw InstList_SpriteObject_30_FallingSparkTrail                        ;B4BE08;
    dw UNSUED_InstList_SpriteObject_31_MetroidInsides_B4C3A2             ;B4BE0A;
    dw InstList_SpriteObject_32_MetroidElectricity                       ;B4BE0C;
    dw UNUSED_InstList_SpriteObject_33_B4C436                            ;B4BE0E;
    dw InstList_SpriteObject_34_MetroidShell                             ;B4BE10;
    dw UNUSED_InstList_SpriteObject_35_B4C536                            ;B4BE12;
    dw UNUSED_InstList_SpriteObject_36_B4C5B2                            ;B4BE14;
    dw InstList_SpriteObject_37_EnemyShot                                ;B4BE16;
    dw InstList_SpriteObject_38_YappingMawBaseFacingDown                 ;B4BE18;
    dw InstList_SpriteObject_39_YappingMawBaseFacingUp                   ;B4BE1A;
    dw UNUSED_InstList_SpriteObject_3A_B4C5E4                            ;B4BE1C;
    dw InstList_SpriteObject_3B_EvirFacingLeft                           ;B4BE1E;
    dw InstList_SpriteObject_3C_EvirFacingRight                          ;B4BE20;
    dw InstList_SpriteObject_3D_DraygonFoamingAtTheMouth                 ;B4BE22;

InstList_SpriteObject_3D_DraygonFoamingAtTheMouth:
    dw $0006                                                             ;B4BE24;
    dw SpriteObjectSpritemaps_3D_DraygonFoamingAtTheMouth_0              ;B4BE26;
    dw $0006                                                             ;B4BE28;
    dw SpriteObjectSpritemaps_3D_DraygonFoamingAtTheMouth_1              ;B4BE2A;
    dw $0007                                                             ;B4BE2C;
    dw SpriteObjectSpritemaps_3D_DraygonFoamingAtTheMouth_2              ;B4BE2E;
    dw $0007                                                             ;B4BE30;
    dw SpriteObjectSpritemaps_3D_DraygonFoamingAtTheMouth_3              ;B4BE32;
    dw $0008                                                             ;B4BE34;
    dw SpriteObjectSpritemaps_3D_DraygonFoamingAtTheMouth_4              ;B4BE36;
    dw $0008                                                             ;B4BE38;
    dw SpriteObjectSpritemaps_3D_DraygonFoamingAtTheMouth_5              ;B4BE3A;
    dw $0009                                                             ;B4BE3C;
    dw SpriteObjectSpritemaps_3D_DraygonFoamingAtTheMouth_6              ;B4BE3E;
    dw $0009                                                             ;B4BE40;
    dw SpriteObjectSpritemaps_3D_DraygonFoamingAtTheMouth_7              ;B4BE42;
    dw Instruction_SpriteObject_Delete                                   ;B4BE44;

UNUSED_InstList_SpriteObject_B4BE46:
    dw $0005                                                             ;B4BE46;
    dw UNUSED_SpriteObjectSpritemaps_B4DD3C                              ;B4BE48;
    dw $0005                                                             ;B4BE4A;
    dw UNUSED_SpriteObjectSpritemaps_B4DD43                              ;B4BE4C;
    dw $0005                                                             ;B4BE4E;
    dw UNUSED_SpriteObjectSpritemaps_B4DD4A                              ;B4BE50;
    dw Instruction_SpriteObject_Delete                                   ;B4BE52;

UNUSED_InstList_SpriteObject_2F_B4BE54:
    dw $0001                                                             ;B4BE54;
    dw UNUSED_SpriteObjectSpritemaps_2F_B4D594                           ;B4BE56;
    dw Instruction_SpriteObject_GoBack4Bytes                             ;B4BE58;

UNUSED_InstList_SpriteObject_0_BeamCharge_B4BE5A:
    dw $0003                                                             ;B4BE5A;
    dw UNUSED_SpriteObjectSpritemaps_0_BeamCharge_0_B4CAC9               ;B4BE5C;
    dw $0003                                                             ;B4BE5E;
    dw UNUSED_SpriteObjectSpritemaps_0_BeamCharge_1_B4CAD0               ;B4BE60;
    dw $0003                                                             ;B4BE62;
    dw UNUSED_SpriteObjectSpritemaps_0_BeamCharge_2_B4CAD7               ;B4BE64;
    dw $0003                                                             ;B4BE66;
    dw UNUSED_SpriteObjectSpritemaps_0_BeamCharge_3_B4CADE               ;B4BE68;
    dw Instruction_SpriteObject_Delete                                   ;B4BE6A;

UNUSED_InstList_SpriteObject_1_MBElbowChargeParticles_B4BE6C:
    dw $0005                                                             ;B4BE6C;
    dw UNUSED_SpriteObjectSpritemaps_1_MBElbowParticle_0_B4CAF4          ;B4BE6E;
    dw $0004                                                             ;B4BE70;
    dw UNUSED_SpriteObjectSpritemaps_1_MBElbowParticle_1_B4CB05          ;B4BE72;
    dw $0003                                                             ;B4BE74;
    dw UNUSED_SpriteObjectSpritemaps_1_MBElbowParticle_2_B4CB16          ;B4BE76;
    dw $0003                                                             ;B4BE78;
    dw UNUSED_SpriteObjectSpritemaps_1_MBElbowParticle_3_B4CB27          ;B4BE7A;
    dw $0003                                                             ;B4BE7C;
    dw UNUSED_SpriteObjectSpritemaps_1_MBElbowParticle_4_B4CB38          ;B4BE7E;
    dw $0003                                                             ;B4BE80;
    dw UNUSED_SpriteObjectSpritemaps_1_MBElbowParticle_5_B4CB49          ;B4BE82;
    dw Instruction_SpriteObject_Delete                                   ;B4BE84;

UNSUED_InstList_SpriteObject_2_MBElbowChargeEnergy_B4BE86:
    dw $0004                                                             ;B4BE86;
    dw UNUSED_SpriteObjectSpritemaps_2_MBElbowEnergy_0_B4CB5A            ;B4BE88;
    dw $0003                                                             ;B4BE8A;
    dw UNUSED_SpriteObjectSpritemaps_2_MBElbowEnergy_1_B4CB6B            ;B4BE8C;
    dw $0002                                                             ;B4BE8E;
    dw UNUSED_SpriteObjectSpritemaps_2_MBElbowEnergy_2_B4CB7C            ;B4BE90;
    dw $0002                                                             ;B4BE92;
    dw UNUSED_SpriteObjectSpritemaps_2_MBElbowEnergy_3_B4CB8D            ;B4BE94;
    dw $0002                                                             ;B4BE96;
    dw UNUSED_SpriteObjectSpritemaps_2_MBElbowEnergy_4_B4CB9E            ;B4BE98;
    dw $0002                                                             ;B4BE9A;
    dw UNUSED_SpriteObjectSpritemaps_2_MBElbowEnergy_5_B4CBAF            ;B4BE9C;
    dw $000C                                                             ;B4BE9E;
    dw SpriteObjectSpritemaps_3_SmallExplosion_0                         ;B4BEA0;
    dw Instruction_SpriteObject_Delete                                   ;B4BEA2;

InstList_SpriteObject_3_SmallExplosion:
    dw $0004                                                             ;B4BEA4;
    dw SpriteObjectSpritemaps_3_SmallExplosion_0                         ;B4BEA6;
    dw $0006                                                             ;B4BEA8;
    dw SpriteObjectSpritemaps_3_SmallExplosion_1                         ;B4BEAA;
    dw $0005                                                             ;B4BEAC;
    dw SpriteObjectSpritemaps_3_SmallExplosion_2                         ;B4BEAE;
    dw $0005                                                             ;B4BEB0;
    dw SpriteObjectSpritemaps_3_SmallExplosion_3                         ;B4BEB2;
    dw $0005                                                             ;B4BEB4;
    dw SpriteObjectSpritemaps_3_SmallExplosion_4                         ;B4BEB6;
    dw $0006                                                             ;B4BEB8;
    dw SpriteObjectSpritemaps_3_SmallExplosion_5                         ;B4BEBA;
    dw Instruction_SpriteObject_Delete                                   ;B4BEBC;

UNUSED_InstList_SpriteObject_4_BombExplosion_B4BEBE:
    dw $0003                                                             ;B4BEBE;
    dw UNSUED_SpriteObjectSpritemaps_4_BombExplosion_0_B4CC35            ;B4BEC0;
    dw $0003                                                             ;B4BEC2;
    dw UNSUED_SpriteObjectSpritemaps_4_BombExplosion_1_B4CC4B            ;B4BEC4;
    dw $0004                                                             ;B4BEC6;
    dw UNSUED_SpriteObjectSpritemaps_4_BombExplosion_2_B4CC61            ;B4BEC8;
    dw $0004                                                             ;B4BECA;
    dw UNSUED_SpriteObjectSpritemaps_4_BombExplosion_3_B4CC77            ;B4BECC;
    dw $0004                                                             ;B4BECE;
    dw UNSUED_SpriteObjectSpritemaps_4_BombExplosion_4_B4CC8D            ;B4BED0;
    dw Instruction_SpriteObject_Delete                                   ;B4BED2;

UNUSED_InstList_SpriteObject_5_BeamTrail_B4BED4:
    dw $0008                                                             ;B4BED4;
    dw UNSUED_SpriteObjectSpritemaps_5_BeamTrail_0_B4CCB9                ;B4BED6;
    dw $0008                                                             ;B4BED8;
    dw UNSUED_SpriteObjectSpritemaps_5_BeamTrail_1_B4CCC0                ;B4BEDA;
    dw $0008                                                             ;B4BEDC;
    dw UNSUED_SpriteObjectSpritemaps_5_BeamTrail_2_B4CCC7                ;B4BEDE;
    dw $0008                                                             ;B4BEE0;
    dw UNSUED_SpriteObjectSpritemaps_5_BeamTrail_3_B4CCCE                ;B4BEE2;
    dw $0018                                                             ;B4BEE4;
    dw UNUSED_SpriteObjectSpritemaps_2_MBElbowEnergy_3_B4CB8D            ;B4BEE6;
    dw Instruction_SpriteObject_Delete                                   ;B4BEE8;

InstList_SpriteObject_6_DudShot:
    dw $0004                                                             ;B4BEEA;
    dw SpriteObjectSpritemaps_6_DudShot_0                                ;B4BEEC;
    dw $0004                                                             ;B4BEEE;
    dw SpriteObjectSpritemaps_6_DudShot_1                                ;B4BEF0;
    dw $0004                                                             ;B4BEF2;
    dw SpriteObjectSpritemaps_6_DudShot_2                                ;B4BEF4;
    dw $0004                                                             ;B4BEF6;
    dw SpriteObjectSpritemaps_6_DudShot_3                                ;B4BEF8;
    dw $0004                                                             ;B4BEFA;
    dw SpriteObjectSpritemaps_6_DudShot_4                                ;B4BEFC;
    dw $0004                                                             ;B4BEFE;
    dw SpriteObjectSpritemaps_6_DudShot_5                                ;B4BF00;
    dw Instruction_SpriteObject_Delete                                   ;B4BF02;

UNUSED_InstList_SpriteObject_7_PowerBomb_B4BF04:
    dw $0005                                                             ;B4BF04;
    dw UNSUED_SpriteObjectSpritemaps_7_PowerBomb_0_B4CCD5                ;B4BF06;
    dw $0005                                                             ;B4BF08;
    dw UNSUED_SpriteObjectSpritemaps_7_PowerBomb_1_B4CCDC                ;B4BF0A;
    dw $0005                                                             ;B4BF0C;
    dw UNSUED_SpriteObjectSpritemaps_7_PowerBomb_2_B4CCE3                ;B4BF0E;
    dw Instruction_SpriteObject_Delete                                   ;B4BF10;

UNUSED_InstList_SpriteObject_8_ElevatorPad_B4BF12:
    dw $0001                                                             ;B4BF12;
    dw UNSUED_SpriteObjectSpritemaps_8_1C_ElevatorPad_0_B4CD57           ;B4BF14;
    dw $0001                                                             ;B4BF16;
    dw UNSUED_SpriteObjectSpritemaps_8_1C_ElevatorPad_1_B4CD6D           ;B4BF18;
    dw Instruction_SpriteObject_Delete                                   ;B4BF1A;

InstList_SpriteObject_9_SmallDudShot:
    dw $0005                                                             ;B4BF1C;
    dw SpriteObjectSpritemaps_A_PirateLandingDustCloud_0                 ;B4BF1E;
    dw $0005                                                             ;B4BF20;
    dw SpriteObjectSpritemaps_9_SmallDustCloud_0                         ;B4BF22;
    dw $0005                                                             ;B4BF24;
    dw SpriteObjectSpritemaps_9_SmallDustCloud_1                         ;B4BF26;
    dw $0005                                                             ;B4BF28;
    dw SpriteObjectSpritemaps_9_SmallDustCloud_2                         ;B4BF2A;
    dw $0005                                                             ;B4BF2C;
    dw SpriteObjectSpritemaps_9_SmallDustCloud_3                         ;B4BF2E;
    dw Instruction_SpriteObject_Delete                                   ;B4BF30;

InstList_SpriteObject_A_SpacePirateLandingDustCloud:
    dw $0003                                                             ;B4BF32;
    dw SpriteObjectSpritemaps_A_PirateLandingDustCloud_0                 ;B4BF34;
    dw $0003                                                             ;B4BF36;
    dw SpriteObjectSpritemaps_A_PirateLandingDustCloud_1                 ;B4BF38;
    dw $0003                                                             ;B4BF3A;
    dw SpriteObjectSpritemaps_A_PirateLandingDustCloud_2                 ;B4BF3C;
    dw $0003                                                             ;B4BF3E;
    dw SpriteObjectSpritemaps_A_PirateLandingDustCloud_3                 ;B4BF40;
    dw Instruction_SpriteObject_Delete                                   ;B4BF42;

UNUSED_InstList_SpriteObject_B_EyeDoorSweatDrop_B4BF44:
    dw $0005                                                             ;B4BF44;
    dw UNSUED_SpriteObjectSpritemaps_B_EyeDoorSweatDrop_0_B4CDD1         ;B4BF46;
    dw $0005                                                             ;B4BF48;
    dw UNSUED_SpriteObjectSpritemaps_B_EyeDoorSweatDrop_1_B4CDD8         ;B4BF4A;
    dw $0005                                                             ;B4BF4C;
    dw UNSUED_SpriteObjectSpritemaps_B_EyeDoorSweatDrop_2_B4CDDF         ;B4BF4E;
    dw $0005                                                             ;B4BF50;
    dw UNSUED_SpriteObjectSpritemaps_B_EyeDoorSweatDrop_3_B4CDE6         ;B4BF52;
    dw Instruction_SpriteObject_Delete                                   ;B4BF54;

InstList_SpriteObject_C_Smoke:
    dw $0008                                                             ;B4BF56;
    dw SpriteObjectSpritemaps_C_Smoke_0                                  ;B4BF58;
    dw $0008                                                             ;B4BF5A;
    dw SpriteObjectSpritemaps_C_Smoke_1                                  ;B4BF5C;
    dw $0008                                                             ;B4BF5E;
    dw SpriteObjectSpritemaps_C_Smoke_2                                  ;B4BF60;
    dw $0008                                                             ;B4BF62;
    dw SpriteObjectSpritemaps_C_Smoke_3                                  ;B4BF64;
    dw Instruction_SpriteObject_Delete                                   ;B4BF66;

UNUSED_InstList_SpriteObject_1C_ElevatorPad_B4BF68:
    dw $0001                                                             ;B4BF68;
    dw UNSUED_SpriteObjectSpritemaps_8_1C_ElevatorPad_0_B4CD57           ;B4BF6A;
    dw $0001                                                             ;B4BF6C;
    dw UNSUED_SpriteObjectSpritemaps_8_1C_ElevatorPad_1_B4CD6D           ;B4BF6E;
    dw Instruction_SpriteObject_GotoParameter                            ;B4BF70;
    dw UNUSED_InstList_SpriteObject_1C_ElevatorPad_B4BF68                ;B4BF72;

InstList_SpriteObject_1D_BigExplosion:
    dw $0005                                                             ;B4BF74;
    dw SpriteObjectSpritemaps_1D_BigExplosion_0                          ;B4BF76;
    dw $0005                                                             ;B4BF78;
    dw SpriteObjectSpritemaps_1D_BigExplosion_1                          ;B4BF7A;
    dw $0005                                                             ;B4BF7C;
    dw SpriteObjectSpritemaps_1D_BigExplosion_2                          ;B4BF7E;
    dw $0005                                                             ;B4BF80;
    dw SpriteObjectSpritemaps_1D_BigExplosion_3                          ;B4BF82;
    dw $0005                                                             ;B4BF84;
    dw SpriteObjectSpritemaps_1D_BigExplosion_4                          ;B4BF86;
    dw $0005                                                             ;B4BF88;
    dw SpriteObjectSpritemaps_1D_BigExplosion_5                          ;B4BF8A;
    dw Instruction_SpriteObject_Delete                                   ;B4BF8C;

UNUSED_InstList_SpriteObject_D_SmallEnergyDrop_B4BF8E:
    dw $0008                                                             ;B4BF8E;
    dw UNUSED_SpriteObjectSpritemaps_D_SmallEnergyDrop_0_B4CE1E          ;B4BF90;
    dw $0008                                                             ;B4BF92;
    dw UNUSED_SpriteObjectSpritemaps_D_SmallEnergyDrop_1_B4CE25          ;B4BF94;
    dw $0008                                                             ;B4BF96;
    dw UNUSED_SpriteObjectSpritemaps_D_SmallEnergyDrop_2_B4CE2C          ;B4BF98;
    dw $0008                                                             ;B4BF9A;
    dw UNUSED_SpriteObjectSpritemaps_D_SmallEnergyDrop_3_B4CE33          ;B4BF9C;
    dw Instruction_SpriteObject_Delete                                   ;B4BF9E;

UNUSED_InstList_SpriteObject_E_BigEnergyDrop_B4BFA0:
    dw $0008                                                             ;B4BFA0;
    dw UNUSED_SpriteObjectSpritemaps_E_BigEnergyDrop_0_B4CE3A            ;B4BFA2;
    dw $0008                                                             ;B4BFA4;
    dw UNUSED_SpriteObjectSpritemaps_E_BigEnergyDrop_1_B4CE50            ;B4BFA6;
    dw $0008                                                             ;B4BFA8;
    dw UNUSED_SpriteObjectSpritemaps_E_BigEnergyDrop_2_B4CE66            ;B4BFAA;
    dw $0008                                                             ;B4BFAC;
    dw UNUSED_SpriteObjectSpritemaps_E_BigEnergyDrop_3_B4CE7C            ;B4BFAE;
    dw Instruction_SpriteObject_Delete                                   ;B4BFB0;

UNUSED_InstList_SpriteObject_F_Bomb_B4BFB2:
    dw $0005                                                             ;B4BFB2;
    dw UNUSED_SpriteObjectSpritemaps_F_Bomb_0_B4CE83                     ;B4BFB4;
    dw $0005                                                             ;B4BFB6;
    dw UNUSED_SpriteObjectSpritemaps_F_Bomb_1_B4CE8A                     ;B4BFB8;
    dw $0005                                                             ;B4BFBA;
    dw UNUSED_SpriteObjectSpritemaps_F_Bomb_2_B4CE91                     ;B4BFBC;
    dw $0005                                                             ;B4BFBE;
    dw UNUSED_SpriteObjectSpritemaps_F_Bomb_3_B4CE98                     ;B4BFC0;
    dw Instruction_SpriteObject_Delete                                   ;B4BFC2;

UNUSED_InstList_SpriteObject_10_WeirdSmallEnergyDrop_B4BFC4:
    dw $0010                                                             ;B4BFC4;
    dw UNUSED_SpriteObjectSpritemaps_10_SmallEnergyDrop_0_B4CF87         ;B4BFC6;
    dw $0010                                                             ;B4BFC8;
    dw UNUSED_SpriteObjectSpritemaps_10_SmallEnergyDrop_1_B4CF8E         ;B4BFCA;
    dw $0010                                                             ;B4BFCC;
    dw UNUSED_SpriteObjectSpritemaps_10_SmallEnergyDrop_2_B4CF95         ;B4BFCE;
    dw Instruction_SpriteObject_Delete                                   ;B4BFD0;

UNUSED_InstList_SpriteObject_11_RockParticles_B4BFD2:
    dw $0002                                                             ;B4BFD2;
    dw UNUSED_SpriteObjectSpritemaps_11_RockParticles_0_B4C6D8           ;B4BFD4;
    dw $0002                                                             ;B4BFD6;
    dw UNUSED_SpriteObjectSpritemaps_11_RockParticles_1_B4C6EE           ;B4BFD8;
    dw $0002                                                             ;B4BFDA;
    dw UNUSED_SpriteObjectSpritemaps_11_RockParticles_2_B4C704           ;B4BFDC;
    dw $0002                                                             ;B4BFDE;
    dw UNUSED_SpriteObjectSpritemaps_11_RockParticles_3_B4C71A           ;B4BFE0;
    dw $0002                                                             ;B4BFE2;
    dw UNUSED_SpriteObjectSpritemaps_11_RockParticles_4_B4C730           ;B4BFE4;
    dw $0002                                                             ;B4BFE6;
    dw UNUSED_SpriteObjectSpritemaps_11_RockParticles_5_B4C746           ;B4BFE8;
    dw $0002                                                             ;B4BFEA;
    dw UNUSED_SpriteObjectSpritemaps_11_RockParticles_6_B4C75C           ;B4BFEC;
    dw $0002                                                             ;B4BFEE;
    dw UNUSED_SpriteObjectSpritemaps_11_RockParticles_7_B4C772           ;B4BFF0;
    dw $0002                                                             ;B4BFF2;
    dw UNUSED_SpriteObjectSpritemaps_11_RockParticles_8_B4C788           ;B4BFF4;
    dw $0002                                                             ;B4BFF6;
    dw UNUSED_SpriteObjectSpritemaps_11_RockParticles_9_B4C79E           ;B4BFF8;
    dw $0002                                                             ;B4BFFA;
    dw UNUSED_SpriteObjectSpritemaps_11_RockParticles_A_B4C7B4           ;B4BFFC;
    dw $0002                                                             ;B4BFFE;
    dw UNUSED_SpriteObjectSpritemaps_11_RockParticles_B_B4C7CA           ;B4C000;
    dw $0002                                                             ;B4C002;
    dw UNUSED_SpriteObjectSpritemaps_11_RockParticles_C_B4C7E0           ;B4C004;
    dw $0002                                                             ;B4C006;
    dw UNUSED_SpriteObjectSpritemaps_11_RockParticles_D_B4C7F6           ;B4C008;
    dw $0002                                                             ;B4C00A;
    dw UNUSED_SpriteObjectSpritemaps_11_RockParticles_E_B4C80C           ;B4C00C;
    dw $0002                                                             ;B4C00E;
    dw UNUSED_SpriteObjectSpritemaps_11_RockParticles_F_B4C822           ;B4C010;
    dw Instruction_SpriteObject_Delete                                   ;B4C012;

InstList_SpriteObject_12_ShortBigDustCloud:
    dw $0002                                                             ;B4C014;
    dw SpriteObjectSpritemaps_12_15_BigDustCloud_0                       ;B4C016;
    dw $0002                                                             ;B4C018;
    dw SpriteObjectSpritemaps_12_15_BigDustCloud_1                       ;B4C01A;
    dw $0002                                                             ;B4C01C;
    dw SpriteObjectSpritemaps_12_15_BigDustCloud_2                       ;B4C01E;
    dw $0002                                                             ;B4C020;
    dw SpriteObjectSpritemaps_12_15_BigDustCloud_3                       ;B4C022;
    dw Instruction_SpriteObject_Delete                                   ;B4C024;

UNUSED_InstList_SpriteObject_13_ShortBigDustCloudBeam_B4C026:
    dw $0003                                                             ;B4C026;
    dw SpriteObjectSpritemaps_13_14_15_BigDustCloud_4                    ;B4C028;
    dw $0003                                                             ;B4C02A;
    dw SpriteObjectSpritemaps_13_14_15_BigDustCloud_5                    ;B4C02C;
    dw $0003                                                             ;B4C02E;
    dw SpriteObjectSpritemaps_13_14_15_BigDustCloud_6                    ;B4C030;
    dw $0003                                                             ;B4C032;
    dw SpriteObjectSpritemaps_13_14_15_BigDustCloud_7                    ;B4C034;
    dw $0003                                                             ;B4C036;
    dw UNUSED_SpriteObjectSpritemaps_13_14_16_DustCloud_Beam_B4C8AC      ;B4C038;
    dw $0005                                                             ;B4C03A;
    dw UNUSED_SpriteObjectSpritemaps_13_14_16_DustCloud_Beam_B4C8B3      ;B4C03C;
    dw Instruction_SpriteObject_Delete                                   ;B4C03E;

UNUSED_InstList_SpriteObject_14_ShortBigDustCloudBeam_B4C040:
    dw $0003                                                             ;B4C040;
    dw SpriteObjectSpritemaps_13_14_15_BigDustCloud_4                    ;B4C042;
    dw $0003                                                             ;B4C044;
    dw SpriteObjectSpritemaps_13_14_15_BigDustCloud_5                    ;B4C046;
    dw $0003                                                             ;B4C048;
    dw SpriteObjectSpritemaps_13_14_15_BigDustCloud_6                    ;B4C04A;
    dw $0003                                                             ;B4C04C;
    dw SpriteObjectSpritemaps_13_14_15_BigDustCloud_7                    ;B4C04E;
    dw $0003                                                             ;B4C050;
    dw UNUSED_SpriteObjectSpritemaps_13_14_16_DustCloud_Beam_B4C8AC      ;B4C052;
    dw $0003                                                             ;B4C054;
    dw UNUSED_SpriteObjectSpritemaps_13_14_16_DustCloud_Beam_B4C8B3      ;B4C056;
    dw $0003                                                             ;B4C058;
    dw UNUSED_SpriteObjectSpritemaps_14_16_DustCloud_Beam_B4C8BA         ;B4C05A;
    dw Instruction_SpriteObject_Delete                                   ;B4C05C;

InstList_SpriteObject_15_BigDustCloud:
    dw $0005                                                             ;B4C05E;
    dw SpriteObjectSpritemaps_12_15_BigDustCloud_0                       ;B4C060;
    dw $0005                                                             ;B4C062;
    dw SpriteObjectSpritemaps_12_15_BigDustCloud_1                       ;B4C064;
    dw $0005                                                             ;B4C066;
    dw SpriteObjectSpritemaps_12_15_BigDustCloud_2                       ;B4C068;
    dw $0005                                                             ;B4C06A;
    dw SpriteObjectSpritemaps_12_15_BigDustCloud_3                       ;B4C06C;
    dw $0005                                                             ;B4C06E;
    dw SpriteObjectSpritemaps_13_14_15_BigDustCloud_4                    ;B4C070;
    dw $0005                                                             ;B4C072;
    dw SpriteObjectSpritemaps_13_14_15_BigDustCloud_5                    ;B4C074;
    dw $0005                                                             ;B4C076;
    dw SpriteObjectSpritemaps_13_14_15_BigDustCloud_6                    ;B4C078;
    dw $0005                                                             ;B4C07A;
    dw SpriteObjectSpritemaps_13_14_15_BigDustCloud_7                    ;B4C07C;
    dw Instruction_SpriteObject_Delete                                   ;B4C07E;

UNUSED_InstList_SpriteObject_16_WeirdLongBeam_B4C080:
    dw $0001                                                             ;B4C080;
    dw UNUSED_SpriteObjectSpritemaps_13_14_16_DustCloud_Beam_B4C8AC      ;B4C082;
    dw $0001                                                             ;B4C084;
    dw UNUSED_SpriteObjectSpritemaps_13_14_16_DustCloud_Beam_B4C8B3      ;B4C086;
    dw $0001                                                             ;B4C088;
    dw UNUSED_SpriteObjectSpritemaps_14_16_DustCloud_Beam_B4C8BA         ;B4C08A;
    dw $0001                                                             ;B4C08C;
    dw UNUSED_SpriteObjectSpritemaps_16_DustCloud_Beam_B4C8C6            ;B4C08E;
    dw $0001                                                             ;B4C090;
    dw UNUSED_SpriteObjectSpritemaps_16_DustCloud_Beam_B4C8D2            ;B4C092;
    dw $0001                                                             ;B4C094;
    dw UNUSED_SpriteObjectSpritemaps_16_DustCloud_Beam_B4C8E2            ;B4C096;
    dw $0001                                                             ;B4C098;
    dw UNUSED_SpriteObjectSpritemaps_16_17_DustCloud_Beam_B4C8F4         ;B4C09A;
    dw $0001                                                             ;B4C09C;
    dw UNUSED_SpriteObjectSpritemaps_16_17_DustCloud_Beam_B4C90A         ;B4C09E;
    dw $0001                                                             ;B4C0A0;
    dw UNUSED_SpriteObjectSpritemaps_16_17_DustCloud_Beam_B4C8F4         ;B4C0A2;
    dw $0001                                                             ;B4C0A4;
    dw UNUSED_SpriteObjectSpritemaps_16_17_DustCloud_Beam_B4C90A         ;B4C0A6;
    dw $0001                                                             ;B4C0A8;
    dw UNUSED_SpriteObjectSpritemaps_16_17_DustCloud_Beam_B4C8F4         ;B4C0AA;
    dw $0001                                                             ;B4C0AC;
    dw UNUSED_SpriteObjectSpritemaps_16_17_DustCloud_Beam_B4C90A         ;B4C0AE;
    dw $0001                                                             ;B4C0B0;
    dw UNUSED_SpriteObjectSpritemaps_16_17_DustCloud_Beam_B4C8F4         ;B4C0B2;
    dw $0001                                                             ;B4C0B4;
    dw UNUSED_SpriteObjectSpritemaps_16_17_DustCloud_Beam_B4C90A         ;B4C0B6;
    dw $0001                                                             ;B4C0B8;
    dw UNUSED_SpriteObjectSpritemaps_16_17_DustCloud_Beam_B4C8F4         ;B4C0BA;
    dw $0001                                                             ;B4C0BC;
    dw UNUSED_SpriteObjectSpritemaps_16_17_DustCloud_Beam_B4C90A         ;B4C0BE;
    dw $0001                                                             ;B4C0C0;
    dw UNUSED_SpriteObjectSpritemaps_16_17_DustCloud_Beam_B4C8F4         ;B4C0C2;
    dw $0001                                                             ;B4C0C4;
    dw UNUSED_SpriteObjectSpritemaps_16_17_DustCloud_Beam_B4C90A         ;B4C0C6;
    dw $0001                                                             ;B4C0C8;
    dw UNUSED_SpriteObjectSpritemaps_16_17_DustCloud_Beam_B4C8F4         ;B4C0CA;
    dw $0001                                                             ;B4C0CC;
    dw UNUSED_SpriteObjectSpritemaps_16_17_DustCloud_Beam_B4C90A         ;B4C0CE;
    dw $0001                                                             ;B4C0D0;
    dw UNUSED_SpriteObjectSpritemaps_16_17_DustCloud_Beam_B4C8F4         ;B4C0D2;
    dw $0001                                                             ;B4C0D4;
    dw UNUSED_SpriteObjectSpritemaps_16_17_DustCloud_Beam_B4C90A         ;B4C0D6;
    dw $0001                                                             ;B4C0D8;
    dw UNUSED_SpriteObjectSpritemaps_16_17_DustCloud_Beam_B4C8F4         ;B4C0DA;
    dw $0001                                                             ;B4C0DC;
    dw UNUSED_SpriteObjectSpritemaps_16_17_DustCloud_Beam_B4C90A         ;B4C0DE;
    dw $0001                                                             ;B4C0E0;
    dw UNUSED_SpriteObjectSpritemaps_16_17_DustCloud_Beam_B4C8F4         ;B4C0E2;
    dw $0001                                                             ;B4C0E4;
    dw UNUSED_SpriteObjectSpritemaps_16_17_DustCloud_Beam_B4C90A         ;B4C0E6;
    dw $0001                                                             ;B4C0E8;
    dw UNUSED_SpriteObjectSpritemaps_16_17_DustCloud_Beam_B4C8F4         ;B4C0EA;
    dw $0001                                                             ;B4C0EC;
    dw UNUSED_SpriteObjectSpritemaps_16_17_DustCloud_Beam_B4C90A         ;B4C0EE;
    dw $0001                                                             ;B4C0F0;
    dw UNUSED_SpriteObjectSpritemaps_16_17_DustCloud_Beam_B4C8F4         ;B4C0F2;
    dw $0001                                                             ;B4C0F4;
    dw UNUSED_SpriteObjectSpritemaps_16_17_DustCloud_Beam_B4C90A         ;B4C0F6;
    dw $0001                                                             ;B4C0F8;
    dw UNUSED_SpriteObjectSpritemaps_16_17_DustCloud_Beam_B4C8F4         ;B4C0FA;
    dw Instruction_SpriteObject_Delete                                   ;B4C0FC;

UNUSED_InstList_SpriteObject_17_WeirdLongFlickerBeam_B4C0FE:
    dw $0001                                                             ;B4C0FE;
    dw UNUSED_SpriteObjectSpritemaps_16_17_DustCloud_Beam_B4C8F4         ;B4C100;
    dw $0001                                                             ;B4C102;
    dw UNUSED_SpriteObjectSpritemaps_16_17_DustCloud_Beam_B4C90A         ;B4C104;
    dw $0001                                                             ;B4C106;
    dw UNUSED_SpriteObjectSpritemaps_16_17_DustCloud_Beam_B4C8F4         ;B4C108;
    dw Instruction_SpriteObject_Delete                                   ;B4C10A;

InstList_SpriteObject_18_ShortDraygonBreathBubbles:
    dw $0003                                                             ;B4C10C;
    dw SpriteObjectSpritemaps_18_ShortDraygonBreathBubbles_0             ;B4C10E;
    dw $0003                                                             ;B4C110;
    dw SpriteObjectSpritemaps_18_ShortDraygonBreathBubbles_1             ;B4C112;
    dw $0003                                                             ;B4C114;
    dw SpriteObjectSpritemaps_18_ShortDraygonBreathBubbles_2             ;B4C116;
    dw $0003                                                             ;B4C118;
    dw SpriteObjectSpritemaps_18_ShortDraygonBreathBubbles_3             ;B4C11A;
    dw $0003                                                             ;B4C11C;
    dw SpriteObjectSpritemaps_18_ShortDraygonBreathBubbles_4             ;B4C11E;
    dw $0003                                                             ;B4C120;
    dw SpriteObjectSpritemaps_18_ShortDraygonBreathBubbles_5             ;B4C122;
    dw $0003                                                             ;B4C124;
    dw SpriteObjectSpritemaps_18_ShortDraygonBreathBubbles_6             ;B4C126;
    dw $0003                                                             ;B4C128;
    dw SpriteObjectSpritemaps_18_ShortDraygonBreathBubbles_7             ;B4C12A;
    dw $0003                                                             ;B4C12C;
    dw SpriteObjectSpritemaps_18_ShortDraygonBreathBubbles_8             ;B4C12E;
    dw Instruction_SpriteObject_Delete                                   ;B4C130;

UNSUED_InstList_SpriteObject_19_SaveStationElectricity:
    dw $0001                                                             ;B4C132;
    dw UNUSED_SpriteObjectSpritemaps_19_SaveStationElect_0_B4C9A0        ;B4C134;
    dw $0001                                                             ;B4C136;
    dw UNUSED_SpriteObjectSpritemaps_19_SaveStationElect_1_B4C9B6        ;B4C138;
    dw $0001                                                             ;B4C13A;
    dw UNUSED_SpriteObjectSpritemaps_19_SaveStationElect_2_B4C9CC        ;B4C13C;
    dw $0001                                                             ;B4C13E;
    dw UNUSED_SpriteObjectSpritemaps_19_SaveStationElect_3_B4C9E2        ;B4C140;
    dw $0001                                                             ;B4C142;
    dw UNUSED_SpriteObjectSpritemaps_19_SaveStationElect_4_B4C9F8        ;B4C144;
    dw $0001                                                             ;B4C146;
    dw UNUSED_SpriteObjectSpritemaps_19_SaveStationElect_5_B4CA0E        ;B4C148;
    dw $0001                                                             ;B4C14A;
    dw UNUSED_SpriteObjectSpritemaps_19_SaveStationElect_6_B4CA24        ;B4C14C;
    dw $0001                                                             ;B4C14E;
    dw UNUSED_SpriteObjectSpritemaps_19_SaveStationElect_7_B4CA3A        ;B4C150;
    dw Instruction_SpriteObject_Delete                                   ;B4C152;

UNUSED_InstList_SpriteObject_1A_ExpandingVerticalGate_B4C154:
    dw $0010                                                             ;B4C154;
    dw UNUSED_SpriteObjectSpritemaps_1A_1B_VerticalGate_0_B4CA50         ;B4C156;
    dw $0010                                                             ;B4C158;
    dw UNUSED_SpriteObjectSpritemaps_1A_1B_VerticalGate_1_B4CA5C         ;B4C15A;
    dw $0010                                                             ;B4C15C;
    dw UNUSED_SpriteObjectSpritemaps_1A_1B_VerticalGate_2_B4CA63         ;B4C15E;
    dw $0010                                                             ;B4C160;
    dw UNUSED_SpriteObjectSpritemaps_1A_1B_VerticalGate_3_B4CA6F         ;B4C162;
    dw $0010                                                             ;B4C164;
    dw UNUSED_SpriteObjectSpritemaps_1A_1B_VerticalGate_4_B4CA7B         ;B4C166;
    dw $0010                                                             ;B4C168;
    dw UNUSED_SpriteObjectSpritemaps_1A_1B_VerticalGate_5_B4CA8C         ;B4C16A;
    dw $0010                                                             ;B4C16C;
    dw UNUSED_SpriteObjectSpritemaps_1A_1B_VerticalGate_6_B4CA9D         ;B4C16E;
    dw $0010                                                             ;B4C170;
    dw UNUSED_SpriteObjectSpritemaps_1A_1B_VerticalGate_7_B4CAB3         ;B4C172;
    dw Instruction_SpriteObject_Delete                                   ;B4C174;

UNUSED_InstList_SpriteObject_1B_ContractingVerticalGate:
    dw $0004                                                             ;B4C176;
    dw UNUSED_SpriteObjectSpritemaps_1A_1B_VerticalGate_7_B4CAB3         ;B4C178;
    dw $0004                                                             ;B4C17A;
    dw UNUSED_SpriteObjectSpritemaps_1A_1B_VerticalGate_6_B4CA9D         ;B4C17C;
    dw $0004                                                             ;B4C17E;
    dw UNUSED_SpriteObjectSpritemaps_1A_1B_VerticalGate_5_B4CA8C         ;B4C180;
    dw $0004                                                             ;B4C182;
    dw UNUSED_SpriteObjectSpritemaps_1A_1B_VerticalGate_4_B4CA7B         ;B4C184;
    dw $0004                                                             ;B4C186;
    dw UNUSED_SpriteObjectSpritemaps_1A_1B_VerticalGate_3_B4CA6F         ;B4C188;
    dw $0004                                                             ;B4C18A;
    dw UNUSED_SpriteObjectSpritemaps_1A_1B_VerticalGate_2_B4CA63         ;B4C18C;
    dw $0004                                                             ;B4C18E;
    dw UNUSED_SpriteObjectSpritemaps_1A_1B_VerticalGate_1_B4CA5C         ;B4C190;
    dw $0004                                                             ;B4C192;
    dw UNUSED_SpriteObjectSpritemaps_1A_1B_VerticalGate_0_B4CA50         ;B4C194;
    dw Instruction_SpriteObject_Delete                                   ;B4C196;

UNUSED_InstList_SpriteObject_1E_B4C198:
    dw $0005                                                             ;B4C198;
    dw UNUSED_SpriteObjectSpritemaps_1E_0_B4C630                         ;B4C19A;
    dw $0005                                                             ;B4C19C;
    dw UNUSED_SpriteObjectSpritemaps_1E_1_B4C637                         ;B4C19E;
    dw $0005                                                             ;B4C1A0;
    dw UNUSED_SpriteObjectSpritemaps_1E_0_B4C630                         ;B4C1A2;
    dw $0005                                                             ;B4C1A4;
    dw UNUSED_SpriteObjectSpritemaps_1E_2_B4C63E                         ;B4C1A6;
    dw Instruction_SpriteObject_GotoParameter                            ;B4C1A8;
    dw UNUSED_InstList_SpriteObject_1E_B4C198                            ;B4C1AA;

UNUSED_InstList_SpriteObject_1F_B4C1AC:
    dw $0005                                                             ;B4C1AC;
    dw UNUSED_SpriteObjectSpritemaps_1F_0_B4C645                         ;B4C1AE;
    dw $0005                                                             ;B4C1B0;
    dw UNUSED_SpriteObjectSpritemaps_1F_1_B4C645                         ;B4C1B2;
    dw $0005                                                             ;B4C1B4;
    dw UNUSED_SpriteObjectSpritemaps_1F_0_B4C645                         ;B4C1B6;
    dw $0005                                                             ;B4C1B8;
    dw UNUSED_SpriteObjectSpritemaps_1F_2_B4C653                         ;B4C1BA;
    dw Instruction_SpriteObject_GotoParameter                            ;B4C1BC;
    dw UNUSED_InstList_SpriteObject_1F_B4C1AC                            ;B4C1BE;

UNUSED_InstList_SpriteObject_20_B4C1C0:
    dw $0005                                                             ;B4C1C0;
    dw UNUSED_SpriteObjectSpritemaps_20_0_B4C65A                         ;B4C1C2;
    dw $0005                                                             ;B4C1C4;
    dw UNUSED_SpriteObjectSpritemaps_20_1_B4C661                         ;B4C1C6;
    dw $0005                                                             ;B4C1C8;
    dw UNUSED_SpriteObjectSpritemaps_20_0_B4C65A                         ;B4C1CA;
    dw $0005                                                             ;B4C1CC;
    dw UNUSED_SpriteObjectSpritemaps_20_2_B4C668                         ;B4C1CE;
    dw Instruction_SpriteObject_GotoParameter                            ;B4C1D0;
    dw UNUSED_InstList_SpriteObject_20_B4C1C0                            ;B4C1D2;

UNUSED_InstList_SpriteObject_21_B4C1D4:
    dw $0005                                                             ;B4C1D4;
    dw UNUSED_SpriteObjectSpritemaps_21_0_B4C66F                         ;B4C1D6;
    dw $0005                                                             ;B4C1D8;
    dw UNUSED_SpriteObjectSpritemaps_21_1_B4C676                         ;B4C1DA;
    dw $0005                                                             ;B4C1DC;
    dw UNUSED_SpriteObjectSpritemaps_21_0_B4C66F                         ;B4C1DE;
    dw $0005                                                             ;B4C1E0;
    dw UNUSED_SpriteObjectSpritemaps_21_2_B4C67D                         ;B4C1E2;
    dw Instruction_SpriteObject_GotoParameter                            ;B4C1E4;
    dw UNUSED_InstList_SpriteObject_21_B4C1D4                            ;B4C1E6;

UNUSED_InstList_SpriteObject_22_B4C1E8:
    dw $0005                                                             ;B4C1E8;
    dw UNUSED_SpriteObjectSpritemaps_22_0_B4C684                         ;B4C1EA;
    dw $0005                                                             ;B4C1EC;
    dw UNUSED_SpriteObjectSpritemaps_22_1_B4C68B                         ;B4C1EE;
    dw $0005                                                             ;B4C1F0;
    dw UNUSED_SpriteObjectSpritemaps_22_0_B4C684                         ;B4C1F2;
    dw $0005                                                             ;B4C1F4;
    dw UNUSED_SpriteObjectSpritemaps_22_2_B4C692                         ;B4C1F6;
    dw Instruction_SpriteObject_GotoParameter                            ;B4C1F8;
    dw UNUSED_InstList_SpriteObject_22_B4C1E8                            ;B4C1FA;

UNUSED_InstList_SpriteObject_23_B4C1FC:
    dw $0005                                                             ;B4C1FC;
    dw UNUSED_SpriteObjectSpritemaps_23_0_B4C699                         ;B4C1FE;
    dw $0005                                                             ;B4C200;
    dw UNUSED_SpriteObjectSpritemaps_23_1_B4C6A0                         ;B4C202;
    dw $0005                                                             ;B4C204;
    dw UNUSED_SpriteObjectSpritemaps_23_0_B4C699                         ;B4C206;
    dw $0005                                                             ;B4C208;
    dw UNUSED_SpriteObjectSpritemaps_23_2_B4C6A7                         ;B4C20A;
    dw Instruction_SpriteObject_GotoParameter                            ;B4C20C;
    dw UNUSED_InstList_SpriteObject_23_B4C1FC                            ;B4C20E;

UNUSED_InstList_SpriteObject_24_B4C210:
    dw $0005                                                             ;B4C210;
    dw UNUSED_SpriteObjectSpritemaps_24_0_B4C6AE                         ;B4C212;
    dw $0005                                                             ;B4C214;
    dw UNUSED_SpriteObjectSpritemaps_24_1_B4C6B5                         ;B4C216;
    dw $0005                                                             ;B4C218;
    dw UNUSED_SpriteObjectSpritemaps_24_0_B4C6AE                         ;B4C21A;
    dw $0005                                                             ;B4C21C;
    dw UNUSED_SpriteObjectSpritemaps_24_2_B4C6BC                         ;B4C21E;
    dw Instruction_SpriteObject_GotoParameter                            ;B4C220;
    dw UNUSED_InstList_SpriteObject_24_B4C210                            ;B4C222;

UNUSED_InstList_SpriteObject_25_B4C224:
    dw $0005                                                             ;B4C224;
    dw UNUSED_SpriteObjectSpritemaps_25_0_B4C6C3                         ;B4C226;
    dw $0005                                                             ;B4C228;
    dw UNUSED_SpriteObjectSpritemaps_25_1_B4C6CA                         ;B4C22A;
    dw $0005                                                             ;B4C22C;
    dw UNUSED_SpriteObjectSpritemaps_25_0_B4C6C3                         ;B4C22E;
    dw $0005                                                             ;B4C230;
    dw UNUSED_SpriteObjectSpritemaps_25_2_B4C6D1                         ;B4C232;
    dw Instruction_SpriteObject_GotoParameter                            ;B4C234;
    dw UNUSED_InstList_SpriteObject_25_B4C224                            ;B4C236;

UNUSED_InstList_SpriteObject_26_B4C238:
    dw $000A                                                             ;B4C238;
    dw UNUSED_SpriteObjectSpritemaps_26_0_B4D08B                         ;B4C23A;
    dw $000A                                                             ;B4C23C;
    dw UNUSED_SpriteObjectSpritemaps_26_0_B4D08B                         ;B4C23E;
    dw $000A                                                             ;B4C240;
    dw UNUSED_SpriteObjectSpritemaps_26_1_B4D0BA                         ;B4C242;
    dw $000A                                                             ;B4C244;
    dw UNUSED_SpriteObjectSpritemaps_26_2_B4D0E9                         ;B4C246;
    dw $000A                                                             ;B4C248;
    dw UNUSED_SpriteObjectSpritemaps_26_3_B4D118                         ;B4C24A;
    dw $000A                                                             ;B4C24C;
    dw UNUSED_SpriteObjectSpritemaps_26_4_B4D147                         ;B4C24E;
    dw $000A                                                             ;B4C250;
    dw UNUSED_SpriteObjectSpritemaps_26_5_B4D176                         ;B4C252;
    dw Instruction_SpriteObject_GotoParameter                            ;B4C254;
    dw UNUSED_InstList_SpriteObject_26_B4C238                            ;B4C256;

UNUSED_InstList_SpriteObject_27_B4C258:
    dw $000A                                                             ;B4C258;
    dw UNUSED_SpriteObjectSpritemaps_27_0_B4D1D4                         ;B4C25A;
    dw $000A                                                             ;B4C25C;
    dw UNUSED_SpriteObjectSpritemaps_27_1_B4D1EF                         ;B4C25E;
    dw $000A                                                             ;B4C260;
    dw UNUSED_SpriteObjectSpritemaps_27_2_B4D20A                         ;B4C262;
    dw $000A                                                             ;B4C264;
    dw UNUSED_SpriteObjectSpritemaps_27_3_B4D225                         ;B4C266;
    dw $000A                                                             ;B4C268;
    dw UNUSED_SpriteObjectSpritemaps_27_0_B4D1D4                         ;B4C26A;
    dw $000A                                                             ;B4C26C;
    dw UNUSED_SpriteObjectSpritemaps_27_1_B4D1EF                         ;B4C26E;
    dw $000A                                                             ;B4C270;
    dw UNUSED_SpriteObjectSpritemaps_27_2_B4D20A                         ;B4C272;
    dw $000A                                                             ;B4C274;
    dw UNUSED_SpriteObjectSpritemaps_27_3_B4D225                         ;B4C276;
    dw $000A                                                             ;B4C278;
    dw UNUSED_SpriteObjectSpritemaps_27_0_B4D1D4                         ;B4C27A;
    dw $000A                                                             ;B4C27C;
    dw UNUSED_SpriteObjectSpritemaps_27_1_B4D1EF                         ;B4C27E;
    dw $000A                                                             ;B4C280;
    dw UNUSED_SpriteObjectSpritemaps_27_2_B4D20A                         ;B4C282;
    dw $000A                                                             ;B4C284;
    dw UNUSED_SpriteObjectSpritemaps_27_3_B4D225                         ;B4C286;
    dw $000A                                                             ;B4C288;
    dw UNUSED_SpriteObjectSpritemaps_27_0_B4D1D4                         ;B4C28A;
    dw $000A                                                             ;B4C28C;
    dw UNUSED_SpriteObjectSpritemaps_27_1_B4D1EF                         ;B4C28E;
    dw $000A                                                             ;B4C290;
    dw UNUSED_SpriteObjectSpritemaps_27_2_B4D20A                         ;B4C292;
    dw $000A                                                             ;B4C294;
    dw UNUSED_SpriteObjectSpritemaps_27_3_B4D225                         ;B4C296;
    dw $0030                                                             ;B4C298;
    dw UNUSED_SpriteObjectSpritemaps_27_4_B4D245                         ;B4C29A;
    dw Instruction_SpriteObject_GotoParameter                            ;B4C29C;
    dw UNUSED_InstList_SpriteObject_27_B4C258                            ;B4C29E;

UNUSED_InstList_SpriteObject_28_B4C2A0:
    dw $000A                                                             ;B4C2A0;
    dw UNUSED_SpriteObjectSpritemaps_28_0_B4D2B3                         ;B4C2A2;
    dw $000A                                                             ;B4C2A4;
    dw UNUSED_SpriteObjectSpritemaps_28_1_B4D2E2                         ;B4C2A6;
    dw $000A                                                             ;B4C2A8;
    dw UNUSED_SpriteObjectSpritemaps_28_2_B4D311                         ;B4C2AA;
    dw $000A                                                             ;B4C2AC;
    dw UNUSED_SpriteObjectSpritemaps_28_3_B4D340                         ;B4C2AE;
    dw $000A                                                             ;B4C2B0;
    dw UNUSED_SpriteObjectSpritemaps_28_4_B4D36F                         ;B4C2B2;
    dw $000A                                                             ;B4C2B4;
    dw UNUSED_SpriteObjectSpritemaps_28_5_B4D39E                         ;B4C2B6;
    dw Instruction_SpriteObject_GotoParameter                            ;B4C2B8;
    dw UNUSED_InstList_SpriteObject_28_B4C2A0                            ;B4C2BA;

UNUSED_InstList_SpriteObject_29_B4C2BC:
    dw $000A                                                             ;B4C2BC;
    dw UNUSED_SpriteObjectSpritemaps_29_0_B4D3FC                         ;B4C2BE;
    dw $000A                                                             ;B4C2C0;
    dw UNUSED_SpriteObjectSpritemaps_29_1_B4D417                         ;B4C2C2;
    dw $000A                                                             ;B4C2C4;
    dw UNUSED_SpriteObjectSpritemaps_29_2_B4D432                         ;B4C2C6;
    dw $000A                                                             ;B4C2C8;
    dw UNUSED_SpriteObjectSpritemaps_29_3_B4D44D                         ;B4C2CA;
    dw $000A                                                             ;B4C2CC;
    dw UNUSED_SpriteObjectSpritemaps_29_0_B4D3FC                         ;B4C2CE;
    dw $000A                                                             ;B4C2D0;
    dw UNUSED_SpriteObjectSpritemaps_29_1_B4D417                         ;B4C2D2;
    dw $000A                                                             ;B4C2D4;
    dw UNUSED_SpriteObjectSpritemaps_29_2_B4D432                         ;B4C2D6;
    dw $000A                                                             ;B4C2D8;
    dw UNUSED_SpriteObjectSpritemaps_29_3_B4D44D                         ;B4C2DA;
    dw $000A                                                             ;B4C2DC;
    dw UNUSED_SpriteObjectSpritemaps_29_0_B4D3FC                         ;B4C2DE;
    dw $000A                                                             ;B4C2E0;
    dw UNUSED_SpriteObjectSpritemaps_29_1_B4D417                         ;B4C2E2;
    dw $000A                                                             ;B4C2E4;
    dw UNUSED_SpriteObjectSpritemaps_29_2_B4D432                         ;B4C2E6;
    dw $000A                                                             ;B4C2E8;
    dw UNUSED_SpriteObjectSpritemaps_29_3_B4D44D                         ;B4C2EA;
    dw $000A                                                             ;B4C2EC;
    dw UNUSED_SpriteObjectSpritemaps_29_0_B4D3FC                         ;B4C2EE;
    dw $000A                                                             ;B4C2F0;
    dw UNUSED_SpriteObjectSpritemaps_29_1_B4D417                         ;B4C2F2;
    dw $000A                                                             ;B4C2F4;
    dw UNUSED_SpriteObjectSpritemaps_29_2_B4D432                         ;B4C2F6;
    dw $000A                                                             ;B4C2F8;
    dw UNUSED_SpriteObjectSpritemaps_29_3_B4D44D                         ;B4C2FA;
    dw $0030                                                             ;B4C2FC;
    dw UNUSED_SpriteObjectSpritemaps_29_4_B4D46D                         ;B4C2FE;
    dw Instruction_SpriteObject_GotoParameter                            ;B4C300;
    dw UNUSED_InstList_SpriteObject_29_B4C2BC                            ;B4C302;

UNUSED_InstList_SpriteObject_2A_B4C304:
    dw $0001                                                             ;B4C304;
    dw UNUSED_SpriteObjectSpritemaps_2A_B4D2AC                           ;B4C306;
    dw Instruction_SpriteObject_GoBack4Bytes                             ;B4C308;

InstList_SpriteObject_2B_PuromiBody:
    dw $0003                                                             ;B4C30A;
    dw SpriteObjectSpritemaps_2B_Puromi_0                                ;B4C30C;
    dw $0003                                                             ;B4C30E;
    dw SpriteObjectSpritemaps_2B_Puromi_1                                ;B4C310;
    dw $0003                                                             ;B4C312;
    dw SpriteObjectSpritemaps_2B_Puromi_4                                ;B4C314;
    dw $0003                                                             ;B4C316;
    dw SpriteObjectSpritemaps_2B_Puromi_2                                ;B4C318;
    dw $0003                                                             ;B4C31A;
    dw SpriteObjectSpritemaps_2B_Puromi_3                                ;B4C31C;
    dw $0003                                                             ;B4C31E;
    dw SpriteObjectSpritemaps_2B_Puromi_5                                ;B4C320;
    dw $0003                                                             ;B4C322;
    dw SpriteObjectSpritemaps_2B_Puromi_0                                ;B4C324;
    dw $0003                                                             ;B4C326;
    dw SpriteObjectSpritemaps_2B_Puromi_1                                ;B4C328;
    dw $0003                                                             ;B4C32A;
    dw SpriteObjectSpritemaps_2B_Puromi_6                                ;B4C32C;
    dw $0003                                                             ;B4C32E;
    dw SpriteObjectSpritemaps_2B_Puromi_2                                ;B4C330;
    dw $0003                                                             ;B4C332;
    dw SpriteObjectSpritemaps_2B_Puromi_3                                ;B4C334;
    dw $0003                                                             ;B4C336;
    dw SpriteObjectSpritemaps_2B_Puromi_7                                ;B4C338;
    dw Instruction_SpriteObject_GotoParameter                            ;B4C33A;
    dw InstList_SpriteObject_2B_PuromiBody                               ;B4C33C;

InstList_SpriteObject_2C_PuromiRightExplosion:
    dw $0002                                                             ;B4C33E;
    dw SpriteObjectSpritemaps_2C_PuromiRightExplosion_0                  ;B4C340;
    dw $0002                                                             ;B4C342;
    dw SpriteObjectSpritemaps_2C_PuromiRightExplosion_1                  ;B4C344;
    dw $0002                                                             ;B4C346;
    dw SpriteObjectSpritemaps_2C_PuromiRightExplosion_2                  ;B4C348;
    dw $0002                                                             ;B4C34A;
    dw SpriteObjectSpritemaps_2C_PuromiRightExplosion_3                  ;B4C34C;
    dw $0002                                                             ;B4C34E;
    dw SpriteObjectSpritemaps_2C_PuromiRightExplosion_4                  ;B4C350;
    dw $0002                                                             ;B4C352;
    dw SpriteObjectSpritemaps_2C_PuromiRightExplosion_5                  ;B4C354;
    dw $0002                                                             ;B4C356;
    dw SpriteObjectSpritemaps_2C_PuromiRightExplosion_6                  ;B4C358;
    dw Instruction_SpriteObject_Delete                                   ;B4C35A;

InstList_SpriteObject_2D_PuromiLeftExplosion:
    dw $0002                                                             ;B4C35C;
    dw SpriteObjectSpritemaps_2D_PuromiLeftExplosion_0                   ;B4C35E;
    dw $0002                                                             ;B4C360;
    dw SpriteObjectSpritemaps_2D_PuromiLeftExplosion_1                   ;B4C362;
    dw $0002                                                             ;B4C364;
    dw SpriteObjectSpritemaps_2D_PuromiLeftExplosion_2                   ;B4C366;
    dw $0002                                                             ;B4C368;
    dw SpriteObjectSpritemaps_2D_PuromiLeftExplosion_3                   ;B4C36A;
    dw $0002                                                             ;B4C36C;
    dw SpriteObjectSpritemaps_2D_PuromiLeftExplosion_4                   ;B4C36E;
    dw $0002                                                             ;B4C370;
    dw SpriteObjectSpritemaps_2D_PuromiLeftExplosion_5                   ;B4C372;
    dw $0002                                                             ;B4C374;
    dw SpriteObjectSpritemaps_2D_PuromiLeftExplosion_6                   ;B4C376;
    dw Instruction_SpriteObject_Delete                                   ;B4C378;

InstList_SpriteObject_2E_PuromiSplash:
    dw $0002                                                             ;B4C37A;
    dw SpriteObjectSpritemaps_2E_PuromiSplash_0                          ;B4C37C;
    dw $0002                                                             ;B4C37E;
    dw SpriteObjectSpritemaps_2E_PuromiSplash_0                          ;B4C380;
    dw $0002                                                             ;B4C382;
    dw SpriteObjectSpritemaps_2E_PuromiSplash_1                          ;B4C384;
    dw $0002                                                             ;B4C386;
    dw SpriteObjectSpritemaps_2E_PuromiSplash_2                          ;B4C388;
    dw $0002                                                             ;B4C38A;
    dw SpriteObjectSpritemaps_2E_PuromiSplash_4                          ;B4C38C;
    dw Instruction_SpriteObject_Delete                                   ;B4C38E;

InstList_SpriteObject_30_FallingSparkTrail:
    dw $0003                                                             ;B4C390;
    dw SpriteObjectSpritemaps_30_FallingSparkTrail_0                     ;B4C392;
    dw $0003                                                             ;B4C394;
    dw SpriteObjectSpritemaps_30_FallingSparkTrail_1                     ;B4C396;
    dw $0003                                                             ;B4C398;
    dw SpriteObjectSpritemaps_30_FallingSparkTrail_2                     ;B4C39A;
    dw $0003                                                             ;B4C39C;
    dw SpriteObjectSpritemaps_30_FallingSparkTrail_3                     ;B4C39E;
    dw Instruction_SpriteObject_Delete                                   ;B4C3A0;

UNSUED_InstList_SpriteObject_31_MetroidInsides_B4C3A2:
    dw $0010                                                             ;B4C3A2;
    dw UNUSED_SpriteObjectSpritemaps_31_MetroidInsides_0_B4D653          ;B4C3A4;
    dw $0010                                                             ;B4C3A6;
    dw UNUSED_SpriteObjectSpritemaps_31_MetroidInsides_1_B4D67D          ;B4C3A8;
    dw $0006                                                             ;B4C3AA;
    dw UNUSED_SpriteObjectSpritemaps_31_MetroidInsides_2_B4D69D          ;B4C3AC;
    dw $000A                                                             ;B4C3AE;
    dw UNUSED_SpriteObjectSpritemaps_31_MetroidInsides_3_B4D6C7          ;B4C3B0;
    dw $0010                                                             ;B4C3B2;
    dw UNUSED_SpriteObjectSpritemaps_31_MetroidInsides_1_B4D67D          ;B4C3B4;
    dw Instruction_SpriteObject_GotoParameter                            ;B4C3B6;
    dw UNSUED_InstList_SpriteObject_31_MetroidInsides_B4C3A2             ;B4C3B8;

InstList_SpriteObject_32_MetroidElectricity:
    dw $0002                                                             ;B4C3BA;
    dw SpriteObjectSpritemaps_32_33_MetroidElectricity_0                 ;B4C3BC;
    dw $0003                                                             ;B4C3BE;
    dw SpriteObjectSpritemaps_32_33_MetroidElectricity_1                 ;B4C3C0;
    dw $0002                                                             ;B4C3C2;
    dw SpriteObjectSpritemaps_32_33_MetroidElectricity_2                 ;B4C3C4;
    dw $0001                                                             ;B4C3C6;
    dw SpriteObjectSpritemaps_32_33_MetroidElectricity_0                 ;B4C3C8;
    dw $0003                                                             ;B4C3CA;
    dw SpriteObjectSpritemaps_32_33_MetroidElectricity_2                 ;B4C3CC;
    dw $0004                                                             ;B4C3CE;
    dw SpriteObject_DrawInst_Empty                                       ;B4C3D0;
    dw $0004                                                             ;B4C3D2;
    dw SpriteObjectSpritemaps_32_33_MetroidElectricity_3                 ;B4C3D4;
    dw $0005                                                             ;B4C3D6;
    dw SpriteObjectSpritemaps_32_33_MetroidElectricity_4                 ;B4C3D8;
    dw $0002                                                             ;B4C3DA;
    dw SpriteObjectSpritemaps_32_33_MetroidElectricity_5                 ;B4C3DC;
    dw $0001                                                             ;B4C3DE;
    dw SpriteObjectSpritemaps_32_33_MetroidElectricity_4                 ;B4C3E0;
    dw $0004                                                             ;B4C3E2;
    dw SpriteObject_DrawInst_Empty                                       ;B4C3E4;
    dw $0002                                                             ;B4C3E6;
    dw SpriteObjectSpritemaps_32_MetroidElectricity_C                    ;B4C3E8;
    dw $0003                                                             ;B4C3EA;
    dw SpriteObjectSpritemaps_32_MetroidElectricity_D                    ;B4C3EC;
    dw $0004                                                             ;B4C3EE;
    dw SpriteObjectSpritemaps_32_MetroidElectricity_E                    ;B4C3F0;
    dw $0007                                                             ;B4C3F2;
    dw SpriteObject_DrawInst_Empty                                       ;B4C3F4;
    dw $0003                                                             ;B4C3F6;
    dw SpriteObjectSpritemaps_32_33_MetroidElectricity_9                 ;B4C3F8;
    dw $0002                                                             ;B4C3FA;
    dw SpriteObjectSpritemaps_32_33_MetroidElectricity_A                 ;B4C3FC;
    dw $0001                                                             ;B4C3FE;
    dw SpriteObjectSpritemaps_32_33_MetroidElectricity_B                 ;B4C400;
    dw $0002                                                             ;B4C402;
    dw SpriteObjectSpritemaps_32_33_MetroidElectricity_A                 ;B4C404;
    dw $0003                                                             ;B4C406;
    dw SpriteObjectSpritemaps_32_33_MetroidElectricity_B                 ;B4C408;
    dw $0004                                                             ;B4C40A;
    dw SpriteObject_DrawInst_Empty                                       ;B4C40C;
    dw $0004                                                             ;B4C40E;
    dw SpriteObjectSpritemaps_32_33_MetroidElectricity_F                 ;B4C410;
    dw $0002                                                             ;B4C412;
    dw SpriteObjectSpritemaps_32_33_MetroidElectricity_10                ;B4C414;
    dw $0002                                                             ;B4C416;
    dw SpriteObjectSpritemaps_32_33_MetroidElectricity_11                ;B4C418;
    dw $0003                                                             ;B4C41A;
    dw SpriteObjectSpritemaps_32_33_MetroidElectricity_F                 ;B4C41C;
    dw $0001                                                             ;B4C41E;
    dw SpriteObject_DrawInst_Empty                                       ;B4C420;
    dw $0004                                                             ;B4C422;
    dw SpriteObjectSpritemaps_32_MetroidElectricity_12                   ;B4C424;
    dw $0003                                                             ;B4C426;
    dw SpriteObjectSpritemaps_32_MetroidElectricity_13                   ;B4C428;
    dw $0003                                                             ;B4C42A;
    dw SpriteObjectSpritemaps_32_MetroidElectricity_14                   ;B4C42C;
    dw $0002                                                             ;B4C42E;
    dw SpriteObjectSpritemaps_32_MetroidElectricity_13                   ;B4C430;
    dw $0007                                                             ;B4C432;
    dw SpriteObject_DrawInst_Empty                                       ;B4C434;

UNUSED_InstList_SpriteObject_33_B4C436:
    dw $0002                                                             ;B4C436;
    dw SpriteObjectSpritemaps_32_33_MetroidElectricity_6                 ;B4C438;
    dw $0003                                                             ;B4C43A;
    dw SpriteObjectSpritemaps_32_33_MetroidElectricity_7                 ;B4C43C;
    dw $0004                                                             ;B4C43E;
    dw SpriteObjectSpritemaps_32_33_MetroidElectricity_8                 ;B4C440;
    dw $0002                                                             ;B4C442;
    dw SpriteObjectSpritemaps_32_33_MetroidElectricity_6                 ;B4C444;
    dw $0001                                                             ;B4C446;
    dw SpriteObjectSpritemaps_32_33_MetroidElectricity_8                 ;B4C448;
    dw $0003                                                             ;B4C44A;
    dw SpriteObject_DrawInst_Empty                                       ;B4C44C;
    dw $0002                                                             ;B4C44E;
    dw SpriteObjectSpritemaps_32_33_MetroidElectricity_15                ;B4C450;
    dw $0003                                                             ;B4C452;
    dw SpriteObjectSpritemaps_32_33_MetroidElectricity_16                ;B4C454;
    dw $0004                                                             ;B4C456;
    dw SpriteObjectSpritemaps_32_33_MetroidElectricity_17                ;B4C458;
    dw $0001                                                             ;B4C45A;
    dw SpriteObjectSpritemaps_32_33_MetroidElectricity_15                ;B4C45C;
    dw $0003                                                             ;B4C45E;
    dw SpriteObject_DrawInst_Empty                                       ;B4C460;
    dw $0003                                                             ;B4C462;
    dw SpriteObjectSpritemaps_32_33_MetroidElectricity_6                 ;B4C464;
    dw $0004                                                             ;B4C466;
    dw SpriteObjectSpritemaps_32_33_MetroidElectricity_8                 ;B4C468;
    dw $0020                                                             ;B4C46A;
    dw SpriteObject_DrawInst_Empty                                       ;B4C46C;
    dw $0002                                                             ;B4C46E;
    dw SpriteObjectSpritemaps_32_33_MetroidElectricity_0                 ;B4C470;
    dw $0001                                                             ;B4C472;
    dw SpriteObjectSpritemaps_32_33_MetroidElectricity_1                 ;B4C474;
    dw $0002                                                             ;B4C476;
    dw SpriteObjectSpritemaps_32_33_MetroidElectricity_2                 ;B4C478;
    dw $0001                                                             ;B4C47A;
    dw SpriteObjectSpritemaps_32_33_MetroidElectricity_0                 ;B4C47C;
    dw $0004                                                             ;B4C47E;
    dw SpriteObject_DrawInst_Empty                                       ;B4C480;
    dw $0003                                                             ;B4C482;
    dw SpriteObjectSpritemaps_32_33_MetroidElectricity_F                 ;B4C484;
    dw $0004                                                             ;B4C486;
    dw SpriteObjectSpritemaps_32_33_MetroidElectricity_10                ;B4C488;
    dw $0005                                                             ;B4C48A;
    dw SpriteObjectSpritemaps_32_33_MetroidElectricity_11                ;B4C48C;
    dw $0004                                                             ;B4C48E;
    dw SpriteObject_DrawInst_Empty                                       ;B4C490;
    dw $0002                                                             ;B4C492;
    dw SpriteObjectSpritemaps_32_33_MetroidElectricity_9                 ;B4C494;
    dw $0001                                                             ;B4C496;
    dw SpriteObjectSpritemaps_32_33_MetroidElectricity_A                 ;B4C498;
    dw $0003                                                             ;B4C49A;
    dw SpriteObjectSpritemaps_32_33_MetroidElectricity_B                 ;B4C49C;
    dw $0001                                                             ;B4C49E;
    dw SpriteObjectSpritemaps_32_33_MetroidElectricity_9                 ;B4C4A0;
    dw $0006                                                             ;B4C4A2;
    dw SpriteObject_DrawInst_Empty                                       ;B4C4A4;
    dw $0003                                                             ;B4C4A6;
    dw SpriteObjectSpritemaps_32_33_MetroidElectricity_3                 ;B4C4A8;
    dw $0004                                                             ;B4C4AA;
    dw SpriteObjectSpritemaps_32_33_MetroidElectricity_4                 ;B4C4AC;
    dw $0002                                                             ;B4C4AE;
    dw SpriteObjectSpritemaps_32_33_MetroidElectricity_5                 ;B4C4B0;
    dw Instruction_SpriteObject_GotoParameter                            ;B4C4B2;
    dw UNUSED_InstList_SpriteObject_33_B4C436                            ;B4C4B4;

InstList_SpriteObject_34_MetroidShell:
    dw $0001                                                             ;B4C4B6;
    dw SpriteObjectSpritemaps_34_35_36_MetroidShell_0                    ;B4C4B8;
    dw $0001                                                             ;B4C4BA;
    dw SpriteObject_DrawInst_Empty                                       ;B4C4BC;
    dw $0001                                                             ;B4C4BE;
    dw SpriteObjectSpritemaps_34_35_36_MetroidShell_0                    ;B4C4C0;
    dw $0001                                                             ;B4C4C2;
    dw SpriteObject_DrawInst_Empty                                       ;B4C4C4;
    dw $0001                                                             ;B4C4C6;
    dw SpriteObjectSpritemaps_34_35_36_MetroidShell_0                    ;B4C4C8;
    dw $0001                                                             ;B4C4CA;
    dw SpriteObject_DrawInst_Empty                                       ;B4C4CC;
    dw $0001                                                             ;B4C4CE;
    dw SpriteObjectSpritemaps_34_35_36_MetroidShell_0                    ;B4C4D0;
    dw $0001                                                             ;B4C4D2;
    dw SpriteObject_DrawInst_Empty                                       ;B4C4D4;
    dw $0001                                                             ;B4C4D6;
    dw SpriteObjectSpritemaps_34_35_36_MetroidShell_0                    ;B4C4D8;
    dw $0001                                                             ;B4C4DA;
    dw SpriteObject_DrawInst_Empty                                       ;B4C4DC;
    dw $0001                                                             ;B4C4DE;
    dw SpriteObjectSpritemaps_34_35_36_MetroidShell_0                    ;B4C4E0;
    dw $0001                                                             ;B4C4E2;
    dw SpriteObject_DrawInst_Empty                                       ;B4C4E4;
    dw $0001                                                             ;B4C4E6;
    dw SpriteObjectSpritemaps_34_35_36_MetroidShell_0                    ;B4C4E8;
    dw $0001                                                             ;B4C4EA;
    dw SpriteObject_DrawInst_Empty                                       ;B4C4EC;
    dw $0001                                                             ;B4C4EE;
    dw SpriteObjectSpritemaps_34_36_MetroidShell_1                       ;B4C4F0;
    dw $0001                                                             ;B4C4F2;
    dw SpriteObject_DrawInst_Empty                                       ;B4C4F4;
    dw $0001                                                             ;B4C4F6;
    dw SpriteObjectSpritemaps_34_36_MetroidShell_1                       ;B4C4F8;
    dw $0001                                                             ;B4C4FA;
    dw SpriteObject_DrawInst_Empty                                       ;B4C4FC;
    dw $0001                                                             ;B4C4FE;
    dw SpriteObjectSpritemaps_34_36_MetroidShell_1                       ;B4C500;
    dw $0001                                                             ;B4C502;
    dw SpriteObject_DrawInst_Empty                                       ;B4C504;
    dw $0001                                                             ;B4C506;
    dw SpriteObjectSpritemaps_34_36_MetroidShell_1                       ;B4C508;
    dw $0001                                                             ;B4C50A;
    dw SpriteObject_DrawInst_Empty                                       ;B4C50C;
    dw $0001                                                             ;B4C50E;
    dw SpriteObjectSpritemaps_34_36_MetroidShell_1                       ;B4C510;
    dw $0001                                                             ;B4C512;
    dw SpriteObject_DrawInst_Empty                                       ;B4C514;
    dw $0001                                                             ;B4C516;
    dw SpriteObjectSpritemaps_34_36_MetroidShell_1                       ;B4C518;
    dw $0001                                                             ;B4C51A;
    dw SpriteObject_DrawInst_Empty                                       ;B4C51C;
    dw $0001                                                             ;B4C51E;
    dw SpriteObjectSpritemaps_34_36_MetroidShell_1                       ;B4C520;
    dw $0001                                                             ;B4C522;
    dw SpriteObject_DrawInst_Empty                                       ;B4C524;
    dw $0001                                                             ;B4C526;
    dw SpriteObjectSpritemaps_34_36_MetroidShell_1                       ;B4C528;
    dw $0001                                                             ;B4C52A;
    dw SpriteObject_DrawInst_Empty                                       ;B4C52C;
    dw $0001                                                             ;B4C52E;
    dw SpriteObjectSpritemaps_34_35_36_MetroidShell_0                    ;B4C530;
    dw $0001                                                             ;B4C532;
    dw SpriteObject_DrawInst_Empty                                       ;B4C534;

UNUSED_InstList_SpriteObject_35_B4C536:
    dw $0001                                                             ;B4C536;
    dw SpriteObjectSpritemaps_34_35_36_MetroidShell_0                    ;B4C538;
    dw $0001                                                             ;B4C53A;
    dw SpriteObject_DrawInst_Empty                                       ;B4C53C;
    dw $0001                                                             ;B4C53E;
    dw SpriteObjectSpritemaps_34_35_36_MetroidShell_0                    ;B4C540;
    dw $0001                                                             ;B4C542;
    dw SpriteObject_DrawInst_Empty                                       ;B4C544;
    dw $0001                                                             ;B4C546;
    dw SpriteObjectSpritemaps_34_35_36_MetroidShell_0                    ;B4C548;
    dw $0001                                                             ;B4C54A;
    dw SpriteObject_DrawInst_Empty                                       ;B4C54C;
    dw $0001                                                             ;B4C54E;
    dw SpriteObjectSpritemaps_34_35_36_MetroidShell_0                    ;B4C550;
    dw $0001                                                             ;B4C552;
    dw SpriteObject_DrawInst_Empty                                       ;B4C554;
    dw $0001                                                             ;B4C556;
    dw SpriteObjectSpritemaps_34_35_36_MetroidShell_0                    ;B4C558;
    dw $0001                                                             ;B4C55A;
    dw SpriteObject_DrawInst_Empty                                       ;B4C55C;
    dw $0001                                                             ;B4C55E;
    dw SpriteObjectSpritemaps_34_35_36_MetroidShell_0                    ;B4C560;
    dw $0001                                                             ;B4C562;
    dw SpriteObject_DrawInst_Empty                                       ;B4C564;
    dw $0001                                                             ;B4C566;
    dw SpriteObjectSpritemaps_34_35_36_MetroidShell_2                    ;B4C568;
    dw $0001                                                             ;B4C56A;
    dw SpriteObject_DrawInst_Empty                                       ;B4C56C;
    dw $0001                                                             ;B4C56E;
    dw SpriteObjectSpritemaps_34_35_36_MetroidShell_2                    ;B4C570;
    dw $0001                                                             ;B4C572;
    dw SpriteObject_DrawInst_Empty                                       ;B4C574;
    dw $0001                                                             ;B4C576;
    dw SpriteObjectSpritemaps_34_35_36_MetroidShell_2                    ;B4C578;
    dw $0001                                                             ;B4C57A;
    dw SpriteObject_DrawInst_Empty                                       ;B4C57C;
    dw $0001                                                             ;B4C57E;
    dw SpriteObjectSpritemaps_34_35_36_MetroidShell_2                    ;B4C580;
    dw $0001                                                             ;B4C582;
    dw SpriteObject_DrawInst_Empty                                       ;B4C584;
    dw $0001                                                             ;B4C586;
    dw SpriteObjectSpritemaps_34_35_36_MetroidShell_2                    ;B4C588;
    dw $0001                                                             ;B4C58A;
    dw SpriteObject_DrawInst_Empty                                       ;B4C58C;
    dw $0001                                                             ;B4C58E;
    dw SpriteObjectSpritemaps_34_35_36_MetroidShell_2                    ;B4C590;
    dw $0001                                                             ;B4C592;
    dw SpriteObject_DrawInst_Empty                                       ;B4C594;
    dw $0001                                                             ;B4C596;
    dw SpriteObjectSpritemaps_34_35_36_MetroidShell_2                    ;B4C598;
    dw $0001                                                             ;B4C59A;
    dw SpriteObject_DrawInst_Empty                                       ;B4C59C;
    dw $0001                                                             ;B4C59E;
    dw SpriteObjectSpritemaps_34_35_36_MetroidShell_2                    ;B4C5A0;
    dw $0001                                                             ;B4C5A2;
    dw SpriteObject_DrawInst_Empty                                       ;B4C5A4;
    dw $0001                                                             ;B4C5A6;
    dw SpriteObjectSpritemaps_34_35_36_MetroidShell_2                    ;B4C5A8;
    dw $0001                                                             ;B4C5AA;
    dw SpriteObject_DrawInst_Empty                                       ;B4C5AC;
    dw Instruction_SpriteObject_GotoParameter                            ;B4C5AE;
    dw UNUSED_InstList_SpriteObject_35_B4C536                            ;B4C5B0;

UNUSED_InstList_SpriteObject_36_B4C5B2:
    dw $0010                                                             ;B4C5B2;
    dw SpriteObjectSpritemaps_34_35_36_MetroidShell_0                    ;B4C5B4;
    dw $0010                                                             ;B4C5B6;
    dw SpriteObjectSpritemaps_34_36_MetroidShell_1                       ;B4C5B8;
    dw $0010                                                             ;B4C5BA;
    dw SpriteObjectSpritemaps_34_35_36_MetroidShell_0                    ;B4C5BC;
    dw $0010                                                             ;B4C5BE;
    dw SpriteObjectSpritemaps_34_35_36_MetroidShell_2                    ;B4C5C0;
    dw Instruction_SpriteObject_GotoParameter                            ;B4C5C2;
    dw UNUSED_InstList_SpriteObject_36_B4C5B2                            ;B4C5C4;

InstList_SpriteObject_37_EnemyShot:
    dw $0002                                                             ;B4C5C6;
    dw SpriteObjectSpritemaps_37_EnemyShot_0                             ;B4C5C8;
    dw $0002                                                             ;B4C5CA;
    dw SpriteObjectSpritemaps_37_EnemyShot_1                             ;B4C5CC;
    dw $0002                                                             ;B4C5CE;
    dw SpriteObjectSpritemaps_37_EnemyShot_2                             ;B4C5D0;
    dw $0002                                                             ;B4C5D2;
    dw SpriteObjectSpritemaps_37_EnemyShot_3                             ;B4C5D4;
    dw Instruction_SpriteObject_Delete                                   ;B4C5D6;

InstList_SpriteObject_38_YappingMawBaseFacingDown:
    dw $0001                                                             ;B4C5D8;
    dw SpriteObjectSpritemaps_38_YappingMawBaseFacingDown                ;B4C5DA;
    dw Instruction_SpriteObject_GoBack4Bytes                             ;B4C5DC;

InstList_SpriteObject_39_YappingMawBaseFacingUp:
    dw $0001                                                             ;B4C5DE;
    dw SpriteObjectSpritemaps_39_YappingMawBaseFacingUp                  ;B4C5E0;
    dw Instruction_SpriteObject_GoBack4Bytes                             ;B4C5E2;

UNUSED_InstList_SpriteObject_3A_B4C5E4:
    dw $000A                                                             ;B4C5E4;
    dw UNUSED_SpriteObjectSpritemaps_3A_0_B4D8BD                         ;B4C5E6;
    dw $000A                                                             ;B4C5E8;
    dw UNUSED_SpriteObjectSpritemaps_3A_1_B4D905                         ;B4C5EA;
    dw $000A                                                             ;B4C5EC;
    dw UNUSED_SpriteObjectSpritemaps_3A_2_B4D957                         ;B4C5EE;
    dw $000A                                                             ;B4C5F0;
    dw UNUSED_SpriteObjectSpritemaps_3A_3_B4D9A9                         ;B4C5F2;
    dw $000A                                                             ;B4C5F4;
    dw UNUSED_SpriteObjectSpritemaps_3A_4_B4D9FB                         ;B4C5F6;
    dw $000A                                                             ;B4C5F8;
    dw UNUSED_SpriteObjectSpritemaps_3A_5_B4DA48                         ;B4C5FA;
    dw $000A                                                             ;B4C5FC;
    dw UNUSED_SpriteObjectSpritemaps_3A_6_B4DA90                         ;B4C5FE;
    dw $000A                                                             ;B4C600;
    dw UNUSED_SpriteObjectSpritemaps_3A_7_B4DAD8                         ;B4C602;
    dw Instruction_SpriteObject_GotoParameter                            ;B4C604;
    dw UNUSED_InstList_SpriteObject_3A_B4C5E4                            ;B4C606;

InstList_SpriteObject_3B_EvirFacingLeft:
    dw $000A                                                             ;B4C608;
    dw SpriteObjectSpritemaps_3B_EvirFacingLeft_0                        ;B4C60A;
    dw $000A                                                             ;B4C60C;
    dw SpriteObjectSpritemaps_3B_EvirFacingLeft_1                        ;B4C60E;
    dw $000A                                                             ;B4C610;
    dw SpriteObjectSpritemaps_3B_EvirFacingLeft_2                        ;B4C612;
    dw $000A                                                             ;B4C614;
    dw SpriteObjectSpritemaps_3B_EvirFacingLeft_3                        ;B4C616;
    dw Instruction_SpriteObject_GotoParameter                            ;B4C618;
    dw InstList_SpriteObject_3B_EvirFacingLeft                           ;B4C61A;

InstList_SpriteObject_3C_EvirFacingRight:
    dw $000A                                                             ;B4C61C;
    dw SpriteObjectSpritemaps_3C_EvirFacingRight_0                       ;B4C61E;
    dw $000A                                                             ;B4C620;
    dw SpriteObjectSpritemaps_3C_EvirFacingRight_1                       ;B4C622;
    dw $000A                                                             ;B4C624;
    dw SpriteObjectSpritemaps_3C_EvirFacingRight_2                       ;B4C626;
    dw $000A                                                             ;B4C628;
    dw SpriteObjectSpritemaps_3C_EvirFacingRight_3                       ;B4C62A;
    dw Instruction_SpriteObject_GotoParameter                            ;B4C62C;
    dw InstList_SpriteObject_3C_EvirFacingRight                          ;B4C62E;

UNUSED_SpriteObjectSpritemaps_1E_0_B4C630:
    dw $0001                                                             ;B4C630;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 0, 0, $100)

UNUSED_SpriteObjectSpritemaps_1E_1_B4C637:
    dw $0001                                                             ;B4C637;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 0, 0, $101)

UNUSED_SpriteObjectSpritemaps_1E_2_B4C63E:
    dw $0001                                                             ;B4C63E;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 0, 0, $102)

UNUSED_SpriteObjectSpritemaps_1F_0_B4C645:
    dw $0001                                                             ;B4C645;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 0, 0, $103)

UNUSED_SpriteObjectSpritemaps_1F_1_B4C645:
    dw $0001                                                             ;B4C64C;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 0, 0, $104)

UNUSED_SpriteObjectSpritemaps_1F_2_B4C653:
    dw $0001                                                             ;B4C653;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 0, 0, $105)

UNUSED_SpriteObjectSpritemaps_20_0_B4C65A:
    dw $0001                                                             ;B4C65A;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 0, 0, $106)

UNUSED_SpriteObjectSpritemaps_20_1_B4C661:
    dw $0001                                                             ;B4C661;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 0, 0, $107)

UNUSED_SpriteObjectSpritemaps_20_2_B4C668:
    dw $0001                                                             ;B4C668;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 0, 0, $108)

UNUSED_SpriteObjectSpritemaps_21_0_B4C66F:
    dw $0001                                                             ;B4C66F;
    %spritemapEntry(0, $1FC, $FC, 1, 0, 0, 0, $103)

UNUSED_SpriteObjectSpritemaps_21_1_B4C676:
    dw $0001                                                             ;B4C676;
    %spritemapEntry(0, $1FC, $FC, 1, 0, 0, 0, $104)

UNUSED_SpriteObjectSpritemaps_21_2_B4C67D:
    dw $0001                                                             ;B4C67D;
    %spritemapEntry(0, $1FC, $FC, 1, 0, 0, 0, $105)

UNUSED_SpriteObjectSpritemaps_22_0_B4C684:
    dw $0001                                                             ;B4C684;
    %spritemapEntry(0, $1FC, $FC, 1, 0, 0, 0, $100)

UNUSED_SpriteObjectSpritemaps_22_1_B4C68B:
    dw $0001                                                             ;B4C68B;
    %spritemapEntry(0, $1FC, $FC, 1, 0, 0, 0, $101)

UNUSED_SpriteObjectSpritemaps_22_2_B4C692:
    dw $0001                                                             ;B4C692;
    %spritemapEntry(0, $1FC, $FC, 1, 0, 0, 0, $102)

UNUSED_SpriteObjectSpritemaps_23_0_B4C699:
    dw $0001                                                             ;B4C699;
    %spritemapEntry(0, $1FC, $FC, 1, 1, 0, 0, $103)

UNUSED_SpriteObjectSpritemaps_23_1_B4C6A0:
    dw $0001                                                             ;B4C6A0;
    %spritemapEntry(0, $1FC, $FC, 1, 1, 0, 0, $104)

UNUSED_SpriteObjectSpritemaps_23_2_B4C6A7:
    dw $0001                                                             ;B4C6A7;
    %spritemapEntry(0, $1FC, $FC, 1, 1, 0, 0, $105)

UNUSED_SpriteObjectSpritemaps_24_0_B4C6AE:
    dw $0001                                                             ;B4C6AE;
    %spritemapEntry(0, $1FC, $FC, 0, 1, 0, 0, $106)

UNUSED_SpriteObjectSpritemaps_24_1_B4C6B5:
    dw $0001                                                             ;B4C6B5;
    %spritemapEntry(0, $1FC, $FC, 0, 1, 0, 0, $107)

UNUSED_SpriteObjectSpritemaps_24_2_B4C6BC:
    dw $0001                                                             ;B4C6BC;
    %spritemapEntry(0, $1FC, $FC, 0, 1, 0, 0, $108)

UNUSED_SpriteObjectSpritemaps_25_0_B4C6C3:
    dw $0001                                                             ;B4C6C3;
    %spritemapEntry(0, $1FC, $FC, 0, 1, 0, 0, $103)

UNUSED_SpriteObjectSpritemaps_25_1_B4C6CA:
    dw $0001                                                             ;B4C6CA;
    %spritemapEntry(0, $1FC, $FC, 0, 1, 0, 0, $104)

UNUSED_SpriteObjectSpritemaps_25_2_B4C6D1:
    dw $0001                                                             ;B4C6D1;
    %spritemapEntry(0, $1FC, $FC, 0, 1, 0, 0, $105)

UNUSED_SpriteObjectSpritemaps_11_RockParticles_0_B4C6D8:
    dw $0004                                                             ;B4C6D8;
    %spritemapEntry(0, $00, $F8, 0, 1, 3, 5, $2B)
    %spritemapEntry(0, $00, $00, 0, 1, 3, 5, $2B)
    %spritemapEntry(0, $1F8, $00, 0, 0, 3, 5, $2B)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 5, $2B)

UNUSED_SpriteObjectSpritemaps_11_RockParticles_1_B4C6EE:
    dw $0004                                                             ;B4C6EE;
    %spritemapEntry(0, $02, $F3, 0, 1, 3, 5, $2B)
    %spritemapEntry(0, $01, $FF, 0, 1, 3, 5, $2B)
    %spritemapEntry(0, $1F7, $FF, 0, 0, 3, 5, $2B)
    %spritemapEntry(0, $1F6, $F3, 0, 0, 3, 5, $2B)

UNUSED_SpriteObjectSpritemaps_11_RockParticles_2_B4C704:
    dw $0004                                                             ;B4C704;
    %spritemapEntry(0, $05, $EE, 0, 1, 3, 5, $2B)
    %spritemapEntry(0, $03, $FD, 0, 1, 3, 5, $2B)
    %spritemapEntry(0, $1F5, $FD, 0, 0, 3, 5, $2B)
    %spritemapEntry(0, $1F3, $EE, 0, 0, 3, 5, $2B)

UNUSED_SpriteObjectSpritemaps_11_RockParticles_3_B4C71A:
    dw $0004                                                             ;B4C71A;
    %spritemapEntry(0, $07, $EC, 0, 1, 3, 5, $2B)
    %spritemapEntry(0, $05, $FB, 0, 1, 3, 5, $2B)
    %spritemapEntry(0, $1F3, $FB, 0, 0, 3, 5, $2B)
    %spritemapEntry(0, $1F1, $EC, 0, 0, 3, 5, $2B)

UNUSED_SpriteObjectSpritemaps_11_RockParticles_4_B4C730:
    dw $0004                                                             ;B4C730;
    %spritemapEntry(0, $09, $EA, 0, 1, 3, 5, $2B)
    %spritemapEntry(0, $07, $FA, 0, 1, 3, 5, $2B)
    %spritemapEntry(0, $1F1, $FA, 0, 0, 3, 5, $2B)
    %spritemapEntry(0, $1EF, $EA, 0, 0, 3, 5, $2B)

UNUSED_SpriteObjectSpritemaps_11_RockParticles_5_B4C746:
    dw $0004                                                             ;B4C746;
    %spritemapEntry(0, $0A, $EA, 0, 1, 3, 5, $2B)
    %spritemapEntry(0, $08, $F9, 0, 1, 3, 5, $2B)
    %spritemapEntry(0, $1F0, $F9, 0, 0, 3, 5, $2B)
    %spritemapEntry(0, $1EE, $EA, 0, 0, 3, 5, $2B)

UNUSED_SpriteObjectSpritemaps_11_RockParticles_6_B4C75C:
    dw $0004                                                             ;B4C75C;
    %spritemapEntry(0, $0C, $EB, 0, 1, 3, 5, $2A)
    %spritemapEntry(0, $09, $FA, 0, 1, 3, 5, $2A)
    %spritemapEntry(0, $1EF, $FA, 0, 0, 3, 5, $2A)
    %spritemapEntry(0, $1EC, $EB, 0, 0, 3, 5, $2A)

UNUSED_SpriteObjectSpritemaps_11_RockParticles_7_B4C772:
    dw $0004                                                             ;B4C772;
    %spritemapEntry(0, $0E, $EC, 0, 1, 3, 5, $2A)
    %spritemapEntry(0, $0A, $FC, 0, 1, 3, 5, $2A)
    %spritemapEntry(0, $1EE, $FC, 0, 0, 3, 5, $2A)
    %spritemapEntry(0, $1EA, $EC, 0, 0, 3, 5, $2A)

UNUSED_SpriteObjectSpritemaps_11_RockParticles_8_B4C788:
    dw $0004                                                             ;B4C788;
    %spritemapEntry(0, $10, $ED, 0, 1, 3, 5, $29)
    %spritemapEntry(0, $0B, $FE, 0, 1, 3, 5, $29)
    %spritemapEntry(0, $1ED, $FE, 0, 0, 3, 5, $29)
    %spritemapEntry(0, $1E8, $ED, 0, 0, 3, 5, $29)

UNUSED_SpriteObjectSpritemaps_11_RockParticles_9_B4C79E:
    dw $0004                                                             ;B4C79E;
    %spritemapEntry(0, $12, $EE, 0, 1, 3, 5, $29)
    %spritemapEntry(0, $0C, $00, 0, 1, 3, 5, $29)
    %spritemapEntry(0, $1EC, $00, 0, 0, 3, 5, $29)
    %spritemapEntry(0, $1E6, $EE, 0, 0, 3, 5, $29)

UNUSED_SpriteObjectSpritemaps_11_RockParticles_A_B4C7B4:
    dw $0004                                                             ;B4C7B4;
    %spritemapEntry(0, $13, $F0, 0, 1, 3, 5, $28)
    %spritemapEntry(0, $0D, $02, 0, 1, 3, 5, $28)
    %spritemapEntry(0, $1E5, $F0, 0, 0, 3, 5, $28)
    %spritemapEntry(0, $1EB, $02, 0, 0, 3, 5, $28)

UNUSED_SpriteObjectSpritemaps_11_RockParticles_B_B4C7CA:
    dw $0004                                                             ;B4C7CA;
    %spritemapEntry(0, $14, $F2, 0, 1, 3, 5, $28)
    %spritemapEntry(0, $0E, $04, 0, 1, 3, 5, $28)
    %spritemapEntry(0, $1E4, $F2, 0, 0, 3, 5, $28)
    %spritemapEntry(0, $1EA, $04, 0, 0, 3, 5, $28)

UNUSED_SpriteObjectSpritemaps_11_RockParticles_C_B4C7E0:
    dw $0004                                                             ;B4C7E0;
    %spritemapEntry(0, $15, $F5, 0, 1, 3, 5, $28)
    %spritemapEntry(0, $0F, $07, 0, 1, 3, 5, $28)
    %spritemapEntry(0, $1E3, $F5, 0, 0, 3, 5, $28)
    %spritemapEntry(0, $1E9, $07, 0, 0, 3, 5, $28)

UNUSED_SpriteObjectSpritemaps_11_RockParticles_D_B4C7F6:
    dw $0004                                                             ;B4C7F6;
    %spritemapEntry(0, $16, $F9, 0, 1, 3, 5, $28)
    %spritemapEntry(0, $10, $0B, 0, 1, 3, 5, $28)
    %spritemapEntry(0, $1E2, $F9, 0, 0, 3, 5, $28)
    %spritemapEntry(0, $1E8, $0B, 0, 0, 3, 5, $28)

UNUSED_SpriteObjectSpritemaps_11_RockParticles_E_B4C80C:
    dw $0004                                                             ;B4C80C;
    %spritemapEntry(0, $17, $03, 0, 1, 3, 5, $28)
    %spritemapEntry(0, $11, $11, 0, 1, 3, 5, $28)
    %spritemapEntry(0, $1E1, $03, 0, 0, 3, 5, $28)
    %spritemapEntry(0, $1E7, $11, 0, 0, 3, 5, $28)

UNUSED_SpriteObjectSpritemaps_11_RockParticles_F_B4C822:
    dw $0004                                                             ;B4C822;
    %spritemapEntry(0, $18, $0A, 0, 1, 3, 5, $28)
    %spritemapEntry(0, $12, $18, 0, 1, 3, 5, $28)
    %spritemapEntry(0, $1E0, $0A, 0, 0, 3, 5, $28)
    %spritemapEntry(0, $1E6, $18, 0, 0, 3, 5, $28)

SpriteObjectSpritemaps_12_15_BigDustCloud_0:
    dw $0001                                                             ;B4C838;
    %spritemapEntry(0, $1F7, $F7, 0, 0, 3, 5, $48)

SpriteObjectSpritemaps_12_15_BigDustCloud_1:
    dw $0002                                                             ;B4C83F;
    %spritemapEntry(0, $01, $01, 0, 0, 3, 5, $48)
    %spritemapEntry(1, $1F3, $F3, 0, 0, 3, 5, $7C)

SpriteObjectSpritemaps_12_15_BigDustCloud_2:
    dw $0003                                                             ;B4C84B;
    %spritemapEntry(1, $1FD, $FD, 0, 0, 3, 5, $7C)
    %spritemapEntry(0, $1F7, $01, 0, 0, 3, 5, $48)
    %spritemapEntry(1, $1F3, $F3, 0, 0, 3, 5, $7E)

SpriteObjectSpritemaps_12_15_BigDustCloud_3:
    dw $0004                                                             ;B4C85C;
    %spritemapEntry(0, $01, $F7, 0, 0, 3, 5, $48)
    %spritemapEntry(1, $1FD, $FD, 0, 0, 3, 5, $7E)
    %spritemapEntry(1, $1F3, $FD, 0, 0, 3, 5, $7C)
    %spritemapEntry(1, $1F3, $F3, 0, 0, 3, 5, $9A)

SpriteObjectSpritemaps_13_14_15_BigDustCloud_4:
    dw $0004                                                             ;B4C872;
    %spritemapEntry(1, $1FD, $F3, 0, 0, 3, 5, $7C)
    %spritemapEntry(1, $1FD, $FD, 0, 0, 3, 5, $9A)
    %spritemapEntry(1, $1F3, $FD, 0, 0, 3, 5, $7E)
    %spritemapEntry(1, $1F3, $F3, 0, 0, 3, 5, $9C)

SpriteObjectSpritemaps_13_14_15_BigDustCloud_5:
    dw $0003                                                             ;B4C888;
    %spritemapEntry(1, $1FD, $F3, 0, 0, 3, 5, $7E)
    %spritemapEntry(1, $1FD, $FD, 0, 0, 3, 5, $9C)
    %spritemapEntry(1, $1F3, $FD, 0, 0, 3, 5, $9A)

SpriteObjectSpritemaps_13_14_15_BigDustCloud_6:
    dw $0002                                                             ;B4C899;
    %spritemapEntry(1, $1FD, $F3, 0, 0, 3, 5, $9A)
    %spritemapEntry(1, $1F3, $FD, 0, 0, 3, 5, $9C)

SpriteObjectSpritemaps_13_14_15_BigDustCloud_7:
    dw $0001                                                             ;B4C8A5;
    %spritemapEntry(1, $1FD, $F3, 0, 0, 3, 5, $9C)

UNUSED_SpriteObjectSpritemaps_13_14_16_DustCloud_Beam_B4C8AC:
    dw $0001                                                             ;B4C8AC;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $6B)

UNUSED_SpriteObjectSpritemaps_13_14_16_DustCloud_Beam_B4C8B3:
    dw $0001                                                             ;B4C8B3;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $6C)

UNUSED_SpriteObjectSpritemaps_14_16_DustCloud_Beam_B4C8BA:
    dw $0002                                                             ;B4C8BA;
    %spritemapEntry(0, $1F8, $FC, 0, 0, 3, 5, $6B)
    %spritemapEntry(0, $00, $FC, 0, 0, 3, 5, $6B)

UNUSED_SpriteObjectSpritemaps_16_DustCloud_Beam_B4C8C6:
    dw $0002                                                             ;B4C8C6;
    %spritemapEntry(0, $1F8, $FC, 0, 0, 3, 5, $6C)
    %spritemapEntry(0, $00, $FC, 0, 0, 3, 5, $6C)

UNUSED_SpriteObjectSpritemaps_16_DustCloud_Beam_B4C8D2:
    dw $0003                                                             ;B4C8D2;
    %spritemapEntry(0, $1F4, $FC, 0, 0, 3, 5, $6C)
    %spritemapEntry(0, $04, $FC, 0, 0, 3, 5, $6C)
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $6C)

UNUSED_SpriteObjectSpritemaps_16_DustCloud_Beam_B4C8E2:
    dw $0003                                                             ;B4C8E3;
    %spritemapEntry(0, $04, $FC, 0, 0, 3, 5, $6B)
    %spritemapEntry(0, $1F4, $FC, 0, 0, 3, 5, $6B)
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $6B)

UNUSED_SpriteObjectSpritemaps_16_17_DustCloud_Beam_B4C8F4:
    dw $0004                                                             ;B4C8F4;
    %spritemapEntry(0, $08, $FC, 0, 0, 3, 5, $6C)
    %spritemapEntry(0, $00, $FC, 0, 0, 3, 5, $6C)
    %spritemapEntry(0, $1F8, $FC, 0, 0, 3, 5, $6C)
    %spritemapEntry(0, $1F0, $FC, 0, 0, 3, 5, $6C)

UNUSED_SpriteObjectSpritemaps_16_17_DustCloud_Beam_B4C90A:
    dw $0004                                                             ;B4C90A;
    %spritemapEntry(0, $08, $FC, 0, 0, 3, 5, $6B)
    %spritemapEntry(0, $00, $FC, 0, 0, 3, 5, $6B)
    %spritemapEntry(0, $1F8, $FC, 0, 0, 3, 5, $6B)
    %spritemapEntry(0, $1F0, $FC, 0, 0, 3, 5, $6B)

SpriteObjectSpritemaps_18_ShortDraygonBreathBubbles_0:
    dw $0001                                                             ;B4C920;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $25)

SpriteObjectSpritemaps_18_ShortDraygonBreathBubbles_1:
    dw $0003                                                             ;B4C927;
    %spritemapEntry(0, $00, $F8, 0, 0, 3, 5, $25)
    %spritemapEntry(0, $1FA, $F6, 0, 0, 3, 5, $25)
    %spritemapEntry(0, $1FC, $FB, 0, 0, 3, 5, $25)

SpriteObjectSpritemaps_18_ShortDraygonBreathBubbles_2:
    dw $0003                                                             ;B4C938;
    %spritemapEntry(0, $01, $F7, 0, 0, 3, 5, $25)
    %spritemapEntry(0, $1F9, $F4, 0, 0, 3, 5, $25)
    %spritemapEntry(0, $1FB, $FA, 0, 0, 3, 5, $25)

SpriteObjectSpritemaps_18_ShortDraygonBreathBubbles_3:
    dw $0003                                                             ;B4C949;
    %spritemapEntry(0, $01, $F5, 0, 0, 3, 5, $43)
    %spritemapEntry(0, $1FC, $F8, 0, 0, 3, 5, $43)
    %spritemapEntry(0, $1FA, $F1, 0, 0, 3, 5, $43)

SpriteObjectSpritemaps_18_ShortDraygonBreathBubbles_4:
    dw $0003                                                             ;B4C95A;
    %spritemapEntry(0, $01, $F3, 0, 0, 3, 5, $43)
    %spritemapEntry(0, $1FC, $F5, 0, 0, 3, 5, $43)
    %spritemapEntry(0, $1FA, $EE, 0, 0, 3, 5, $43)

SpriteObjectSpritemaps_18_ShortDraygonBreathBubbles_5:
    dw $0003                                                             ;B4C96B;
    %spritemapEntry(0, $00, $F0, 0, 0, 3, 5, $40)
    %spritemapEntry(0, $1FC, $F4, 0, 0, 3, 5, $40)
    %spritemapEntry(0, $1FA, $ED, 0, 0, 3, 5, $40)

SpriteObjectSpritemaps_18_ShortDraygonBreathBubbles_6:
    dw $0003                                                             ;B4C97C;
    %spritemapEntry(0, $00, $EE, 0, 0, 3, 5, $40)
    %spritemapEntry(0, $1FC, $F2, 0, 0, 3, 5, $40)
    %spritemapEntry(0, $1FA, $EC, 0, 0, 3, 5, $40)

SpriteObjectSpritemaps_18_ShortDraygonBreathBubbles_7:
    dw $0002                                                             ;B4C98D;
    %spritemapEntry(0, $00, $EC, 0, 0, 3, 5, $40)
    %spritemapEntry(0, $1FC, $F0, 0, 0, 3, 5, $40)

SpriteObjectSpritemaps_18_ShortDraygonBreathBubbles_8:
    dw $0001                                                             ;B4C999;
    %spritemapEntry(0, $1FC, $EE, 0, 0, 3, 5, $40)

UNUSED_SpriteObjectSpritemaps_19_SaveStationElect_0_B4C9A0:
    dw $0004                                                             ;B4C9A0;
    %spritemapEntry(0, $08, $E0, 0, 0, 3, 5, $6F)
    %spritemapEntry(0, $00, $E0, 0, 0, 3, 5, $6F)
    %spritemapEntry(0, $1F8, $E0, 0, 0, 3, 5, $6F)
    %spritemapEntry(0, $1F0, $E0, 0, 0, 3, 5, $6F)

UNUSED_SpriteObjectSpritemaps_19_SaveStationElect_1_B4C9B6:
    dw $0004                                                             ;B4C9B6;
    %spritemapEntry(0, $08, $E8, 0, 0, 3, 5, $6F)
    %spritemapEntry(0, $00, $E8, 0, 0, 3, 5, $6F)
    %spritemapEntry(0, $1F8, $E8, 0, 0, 3, 5, $6F)
    %spritemapEntry(0, $1F0, $E8, 0, 0, 3, 5, $6F)

UNUSED_SpriteObjectSpritemaps_19_SaveStationElect_2_B4C9CC:
    dw $0004                                                             ;B4C9CC;
    %spritemapEntry(0, $08, $F0, 0, 0, 3, 5, $6F)
    %spritemapEntry(0, $00, $F0, 0, 0, 3, 5, $6F)
    %spritemapEntry(0, $1F8, $F0, 0, 0, 3, 5, $6F)
    %spritemapEntry(0, $1F0, $F0, 0, 0, 3, 5, $6F)

UNUSED_SpriteObjectSpritemaps_19_SaveStationElect_3_B4C9E2:
    dw $0004                                                             ;B4C9E2;
    %spritemapEntry(0, $08, $F8, 0, 0, 3, 5, $6F)
    %spritemapEntry(0, $00, $F8, 0, 0, 3, 5, $6F)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 5, $6F)
    %spritemapEntry(0, $1F0, $F8, 0, 0, 3, 5, $6F)

UNUSED_SpriteObjectSpritemaps_19_SaveStationElect_4_B4C9F8:
    dw $0004                                                             ;B4C9F8;
    %spritemapEntry(0, $08, $00, 0, 0, 3, 5, $6F)
    %spritemapEntry(0, $00, $00, 0, 0, 3, 5, $6F)
    %spritemapEntry(0, $1F8, $00, 0, 0, 3, 5, $6F)
    %spritemapEntry(0, $1F0, $00, 0, 0, 3, 5, $6F)

UNUSED_SpriteObjectSpritemaps_19_SaveStationElect_5_B4CA0E:
    dw $0004                                                             ;B4CA0E;
    %spritemapEntry(0, $08, $08, 0, 0, 3, 5, $6F)
    %spritemapEntry(0, $00, $08, 0, 0, 3, 5, $6F)
    %spritemapEntry(0, $1F8, $08, 0, 0, 3, 5, $6F)
    %spritemapEntry(0, $1F0, $08, 0, 0, 3, 5, $6F)

UNUSED_SpriteObjectSpritemaps_19_SaveStationElect_6_B4CA24:
    dw $0004                                                             ;B4CA24;
    %spritemapEntry(0, $08, $10, 0, 0, 3, 5, $6F)
    %spritemapEntry(0, $00, $10, 0, 0, 3, 5, $6F)
    %spritemapEntry(0, $1F8, $10, 0, 0, 3, 5, $6F)
    %spritemapEntry(0, $1F0, $10, 0, 0, 3, 5, $6F)

UNUSED_SpriteObjectSpritemaps_19_SaveStationElect_7_B4CA3A:
    dw $0004                                                             ;B4CA3A;
    %spritemapEntry(0, $08, $18, 0, 0, 3, 5, $6F)
    %spritemapEntry(0, $00, $18, 0, 0, 3, 5, $6F)
    %spritemapEntry(0, $1F8, $18, 0, 0, 3, 5, $6F)
    %spritemapEntry(0, $1F0, $18, 0, 0, 3, 5, $6F)

UNUSED_SpriteObjectSpritemaps_1A_1B_VerticalGate_0_B4CA50:
    dw $0002                                                             ;B4CA50;
    %spritemapEntry(0, $00, $FC, 0, 0, 3, 5, $BF)
    %spritemapEntry(0, $1F8, $FC, 0, 0, 3, 5, $BE)

UNUSED_SpriteObjectSpritemaps_1A_1B_VerticalGate_1_B4CA5C:
    dw $0001                                                             ;B4CA5C;
    %spritemapEntry(1, $1F8, $F8, 0, 0, 3, 5, $BE)

UNUSED_SpriteObjectSpritemaps_1A_1B_VerticalGate_2_B4CA63:
    dw $0002                                                             ;B4CA63;
    %spritemapEntry(1, $1F8, $FC, 0, 0, 3, 5, $BE)
    %spritemapEntry(1, $1F8, $F4, 0, 0, 3, 5, $BE)

UNUSED_SpriteObjectSpritemaps_1A_1B_VerticalGate_3_B4CA6F:
    dw $0002                                                             ;B4CA6F;
    %spritemapEntry(1, $1F8, $00, 0, 0, 3, 5, $BE)
    %spritemapEntry(1, $1F8, $F0, 0, 0, 3, 5, $BE)

UNUSED_SpriteObjectSpritemaps_1A_1B_VerticalGate_4_B4CA7B:
    dw $0003                                                             ;B4CA7B;
    %spritemapEntry(1, $1F8, $04, 0, 0, 3, 5, $BE)
    %spritemapEntry(1, $1F8, $F8, 0, 0, 3, 5, $BE)
    %spritemapEntry(1, $1F8, $EC, 0, 0, 3, 5, $BE)

UNUSED_SpriteObjectSpritemaps_1A_1B_VerticalGate_5_B4CA8C:
    dw $0003                                                             ;B4CA8C;
    %spritemapEntry(1, $1F8, $08, 0, 0, 3, 5, $BE)
    %spritemapEntry(1, $1F8, $F8, 0, 0, 3, 5, $BE)
    %spritemapEntry(1, $1F8, $E8, 0, 0, 3, 5, $BE)

UNUSED_SpriteObjectSpritemaps_1A_1B_VerticalGate_6_B4CA9D:
    dw $0004                                                             ;B4CA9D;
    %spritemapEntry(1, $1F8, $0C, 0, 0, 3, 5, $BE)
    %spritemapEntry(1, $1F8, $00, 0, 0, 3, 5, $BE)
    %spritemapEntry(1, $1F8, $F0, 0, 0, 3, 5, $BE)
    %spritemapEntry(1, $1F8, $E4, 0, 0, 3, 5, $BE)

UNUSED_SpriteObjectSpritemaps_1A_1B_VerticalGate_7_B4CAB3:
    dw $0004                                                             ;B4CAB3;
    %spritemapEntry(1, $1F8, $10, 0, 0, 3, 5, $BE)
    %spritemapEntry(1, $1F8, $00, 0, 0, 3, 5, $BE)
    %spritemapEntry(1, $1F8, $F0, 0, 0, 3, 5, $BE)
    %spritemapEntry(1, $1F8, $E0, 0, 0, 3, 5, $BE)

UNUSED_SpriteObjectSpritemaps_0_BeamCharge_0_B4CAC9:
    dw $0001                                                             ;B4CAC9;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 6, $53)

UNUSED_SpriteObjectSpritemaps_0_BeamCharge_1_B4CAD0:
    dw $0001                                                             ;B4CAD0;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 6, $52)

UNUSED_SpriteObjectSpritemaps_0_BeamCharge_2_B4CAD7:
    dw $0001                                                             ;B4CAD7;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 6, $51)

UNUSED_SpriteObjectSpritemaps_0_BeamCharge_3_B4CADE:
    dw $0004                                                             ;B4CADE;
    %spritemapEntry(0, $1F8, $00, 1, 0, 3, 6, $50)
    %spritemapEntry(0, $00, $00, 1, 1, 3, 6, $50)
    %spritemapEntry(0, $00, $F8, 0, 1, 3, 6, $50)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 6, $50)

UNUSED_SpriteObjectSpritemaps_1_MBElbowParticle_0_B4CAF4:
    dw $0003                                                             ;B4CAF4;
    %spritemapEntry(0, $00, $0C, 0, 0, 3, 5, $5B)
    %spritemapEntry(0, $08, $EC, 0, 0, 3, 5, $5B)
    %spritemapEntry(0, $1F0, $F4, 0, 0, 3, 5, $5B)

UNUSED_SpriteObjectSpritemaps_1_MBElbowParticle_1_B4CB05:
    dw $0003                                                             ;B4CB05;
    %spritemapEntry(0, $1FD, $0A, 0, 0, 3, 5, $5C)
    %spritemapEntry(0, $06, $EE, 0, 0, 3, 5, $5C)
    %spritemapEntry(0, $1F2, $F6, 0, 0, 3, 5, $5C)

UNUSED_SpriteObjectSpritemaps_1_MBElbowParticle_2_B4CB16:
    dw $0003                                                             ;B4CB16;
    %spritemapEntry(0, $1FC, $08, 0, 0, 3, 5, $5C)
    %spritemapEntry(0, $04, $F0, 0, 0, 3, 5, $5C)
    %spritemapEntry(0, $1F4, $F8, 0, 0, 3, 5, $5C)

UNUSED_SpriteObjectSpritemaps_1_MBElbowParticle_3_B4CB27:
    dw $0003                                                             ;B4CB27;
    %spritemapEntry(0, $02, $F2, 0, 0, 3, 5, $5D)
    %spritemapEntry(0, $1FB, $06, 0, 0, 3, 5, $5D)
    %spritemapEntry(0, $1F6, $FA, 0, 0, 3, 5, $5D)

UNUSED_SpriteObjectSpritemaps_1_MBElbowParticle_4_B4CB38:
    dw $0003                                                             ;B4CB38;
    %spritemapEntry(0, $1FB, $04, 0, 0, 3, 5, $5D)
    %spritemapEntry(0, $1F8, $FB, 0, 0, 3, 5, $5D)
    %spritemapEntry(0, $00, $F4, 0, 0, 3, 5, $5D)

UNUSED_SpriteObjectSpritemaps_1_MBElbowParticle_5_B4CB49:
    dw $0003                                                             ;B4CB49;
    %spritemapEntry(0, $1FB, $02, 0, 0, 3, 5, $5D)
    %spritemapEntry(0, $1FA, $FA, 0, 0, 3, 5, $5D)
    %spritemapEntry(0, $00, $F6, 0, 0, 3, 5, $5D)

UNUSED_SpriteObjectSpritemaps_2_MBElbowEnergy_0_B4CB5A:
    dw $0003                                                             ;B4CB5A;
    %spritemapEntry(0, $00, $EC, 1, 0, 3, 5, $5B)
    %spritemapEntry(0, $08, $0C, 1, 0, 3, 5, $5B)
    %spritemapEntry(0, $1F0, $04, 1, 0, 3, 5, $5B)

UNUSED_SpriteObjectSpritemaps_2_MBElbowEnergy_1_B4CB6B:
    dw $0003                                                             ;B4CB6B;
    %spritemapEntry(0, $1FE, $EE, 1, 0, 3, 5, $5C)
    %spritemapEntry(0, $06, $0A, 1, 0, 3, 5, $5C)
    %spritemapEntry(0, $1F2, $02, 1, 0, 3, 5, $5C)

UNUSED_SpriteObjectSpritemaps_2_MBElbowEnergy_2_B4CB7C:
    dw $0003                                                             ;B4CB7C;
    %spritemapEntry(0, $04, $08, 1, 0, 3, 5, $5C)
    %spritemapEntry(0, $1F4, $00, 1, 0, 3, 5, $5C)
    %spritemapEntry(0, $1FD, $F0, 1, 0, 3, 5, $5C)

UNUSED_SpriteObjectSpritemaps_2_MBElbowEnergy_3_B4CB8D:
    dw $0003                                                             ;B4CB8D;
    %spritemapEntry(0, $02, $06, 1, 0, 3, 5, $5D)
    %spritemapEntry(0, $1FC, $F2, 1, 0, 3, 5, $5D)
    %spritemapEntry(0, $1F6, $FE, 1, 0, 3, 5, $5D)

UNUSED_SpriteObjectSpritemaps_2_MBElbowEnergy_4_B4CB9E:
    dw $0003                                                             ;B4CB9E;
    %spritemapEntry(0, $1FC, $F4, 1, 0, 3, 5, $5D)
    %spritemapEntry(0, $1F8, $FC, 1, 0, 3, 5, $5D)
    %spritemapEntry(0, $00, $04, 1, 0, 3, 5, $5D)

UNUSED_SpriteObjectSpritemaps_2_MBElbowEnergy_5_B4CBAF:
    dw $0003                                                             ;B4CBAF;
    %spritemapEntry(0, $1FC, $F6, 1, 0, 3, 5, $5D)
    %spritemapEntry(0, $1FA, $FD, 1, 0, 3, 5, $5D)
    %spritemapEntry(0, $00, $02, 1, 0, 3, 5, $5D)

SpriteObjectSpritemaps_3_SmallExplosion_0:
    dw $0001                                                             ;B4CBC0;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $5F)

SpriteObjectSpritemaps_3_SmallExplosion_1:
    dw $0004                                                             ;B4CBC7;
    %spritemapEntry(0, $00, $00, 1, 1, 3, 5, $8A)
    %spritemapEntry(0, $1F8, $00, 1, 0, 3, 5, $8A)
    %spritemapEntry(0, $00, $F8, 0, 1, 3, 5, $8A)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 5, $8A)

SpriteObjectSpritemaps_3_SmallExplosion_2:
    dw $0004                                                             ;B4CBDD;
    %spritemapEntry(1, $00, $00, 1, 1, 3, 5, $90)
    %spritemapEntry(1, $1F0, $00, 1, 0, 3, 5, $90)
    %spritemapEntry(1, $00, $F0, 0, 1, 3, 5, $90)
    %spritemapEntry(1, $1F0, $F0, 0, 0, 3, 5, $90)

SpriteObjectSpritemaps_3_SmallExplosion_3:
    dw $0004                                                             ;B4CBF3;
    %spritemapEntry(1, $00, $00, 1, 1, 3, 5, $92)
    %spritemapEntry(1, $1F0, $00, 1, 0, 3, 5, $92)
    %spritemapEntry(1, $00, $F0, 0, 1, 3, 5, $92)
    %spritemapEntry(1, $1F0, $F0, 0, 0, 3, 5, $92)

SpriteObjectSpritemaps_3_SmallExplosion_4:
    dw $0004                                                             ;B4CC09;
    %spritemapEntry(1, $00, $00, 1, 1, 3, 5, $94)
    %spritemapEntry(1, $1F0, $00, 1, 0, 3, 5, $94)
    %spritemapEntry(1, $00, $F0, 0, 1, 3, 5, $94)
    %spritemapEntry(1, $1F0, $F0, 0, 0, 3, 5, $94)

SpriteObjectSpritemaps_3_SmallExplosion_5:
    dw $0004                                                             ;B4CC1F;
    %spritemapEntry(1, $00, $00, 1, 1, 3, 5, $96)
    %spritemapEntry(1, $1F0, $00, 1, 0, 3, 5, $96)
    %spritemapEntry(1, $00, $F0, 0, 1, 3, 5, $96)
    %spritemapEntry(1, $1F0, $F0, 0, 0, 3, 5, $96)

UNSUED_SpriteObjectSpritemaps_4_BombExplosion_0_B4CC35:
    dw $0004                                                             ;B4CC35;
    %spritemapEntry(0, $00, $00, 1, 1, 3, 5, $8B)
    %spritemapEntry(0, $1F8, $00, 1, 0, 3, 5, $8B)
    %spritemapEntry(0, $00, $F8, 0, 1, 3, 5, $8B)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 5, $8B)

UNSUED_SpriteObjectSpritemaps_4_BombExplosion_1_B4CC4B:
    dw $0004                                                             ;B4CC4B;
    %spritemapEntry(0, $00, $00, 1, 1, 3, 5, $7A)
    %spritemapEntry(0, $1F8, $00, 1, 0, 3, 5, $7A)
    %spritemapEntry(0, $00, $F8, 0, 1, 3, 5, $7A)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 5, $7A)

UNSUED_SpriteObjectSpritemaps_4_BombExplosion_2_B4CC61:
    dw $0004                                                             ;B4CC61;
    %spritemapEntry(1, $00, $00, 1, 1, 3, 5, $70)
    %spritemapEntry(1, $1F0, $00, 1, 0, 3, 5, $70)
    %spritemapEntry(1, $00, $F0, 0, 1, 3, 5, $70)
    %spritemapEntry(1, $1F0, $F0, 0, 0, 3, 5, $70)

UNSUED_SpriteObjectSpritemaps_4_BombExplosion_3_B4CC77:
    dw $0004                                                             ;B4CC77;
    %spritemapEntry(1, $00, $00, 1, 1, 3, 5, $72)
    %spritemapEntry(1, $1F0, $00, 1, 0, 3, 5, $72)
    %spritemapEntry(1, $00, $F0, 0, 1, 3, 5, $72)
    %spritemapEntry(1, $1F0, $F0, 0, 0, 3, 5, $72)

UNSUED_SpriteObjectSpritemaps_4_BombExplosion_4_B4CC8D:
    dw $0004                                                             ;B4CC8D;
    %spritemapEntry(1, $00, $00, 1, 1, 3, 5, $74)
    %spritemapEntry(1, $1F0, $00, 1, 0, 3, 5, $74)
    %spritemapEntry(1, $00, $F0, 0, 1, 3, 5, $74)
    %spritemapEntry(1, $1F0, $F0, 0, 0, 3, 5, $74)

UNSUED_SpriteObjectSpritemaps__B4CCA3:
    dw $0004                                                             ;B4CCA3;
    %spritemapEntry(0, $1F8, $00, 0, 0, 3, 5, $5E)
    %spritemapEntry(0, $00, $00, 0, 0, 3, 5, $5E)
    %spritemapEntry(0, $00, $F8, 0, 0, 3, 5, $5E)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 5, $5E)

UNSUED_SpriteObjectSpritemaps_5_BeamTrail_0_B4CCB9:
    dw $0001                                                             ;B4CCB9;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 6, $38)

UNSUED_SpriteObjectSpritemaps_5_BeamTrail_1_B4CCC0:
    dw $0001                                                             ;B4CCC0;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 6, $39)

UNSUED_SpriteObjectSpritemaps_5_BeamTrail_2_B4CCC7:
    dw $0001                                                             ;B4CCC7;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 6, $3A)

UNSUED_SpriteObjectSpritemaps_5_BeamTrail_3_B4CCCE:
    dw $0001                                                             ;B4CCCE;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 6, $3B)

UNSUED_SpriteObjectSpritemaps_7_PowerBomb_0_B4CCD5:
    dw $0001                                                             ;B4CCD5;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $26)

UNSUED_SpriteObjectSpritemaps_7_PowerBomb_1_B4CCDC:
    dw $0001                                                             ;B4CCDC;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $27)

UNSUED_SpriteObjectSpritemaps_7_PowerBomb_2_B4CCE3:
    dw $0001                                                             ;B4CCE3;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $7B)

UNSUED_SpriteObjectSpritemaps_B4CCEA:
    dw $0001                                                             ;B4CCEA;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $5F)

SpriteObjectSpritemaps_6_DudShot_0:
    dw $0001                                                             ;B4CCF1;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $53)

SpriteObjectSpritemaps_6_DudShot_1:
    dw $0001                                                             ;B4CCF8;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $51)

SpriteObjectSpritemaps_6_DudShot_2:
    dw $0004                                                             ;B4CCFF;
    %spritemapEntry(0, $00, $00, 1, 1, 3, 5, $60)
    %spritemapEntry(0, $00, $F8, 0, 1, 3, 5, $60)
    %spritemapEntry(0, $1F8, $00, 1, 0, 3, 5, $60)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 5, $60)

SpriteObjectSpritemaps_6_DudShot_3:
    dw $0004                                                             ;B4CD15;
    %spritemapEntry(0, $00, $00, 1, 1, 3, 5, $61)
    %spritemapEntry(0, $00, $F8, 0, 1, 3, 5, $61)
    %spritemapEntry(0, $1F8, $00, 1, 0, 3, 5, $61)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 5, $61)

SpriteObjectSpritemaps_6_DudShot_4:
    dw $0004                                                             ;B4CD2B;
    %spritemapEntry(0, $00, $00, 1, 1, 3, 5, $62)
    %spritemapEntry(0, $00, $F8, 0, 1, 3, 5, $62)
    %spritemapEntry(0, $1F8, $00, 1, 0, 3, 5, $62)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 5, $62)

SpriteObjectSpritemaps_6_DudShot_5:
    dw $0004                                                             ;B4CD41;
    %spritemapEntry(0, $00, $00, 1, 1, 3, 5, $63)
    %spritemapEntry(0, $00, $F8, 0, 1, 3, 5, $63)
    %spritemapEntry(0, $1F8, $00, 1, 0, 3, 5, $63)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 5, $63)

UNSUED_SpriteObjectSpritemaps_8_1C_ElevatorPad_0_B4CD57:
    dw $0004                                                             ;B4CD57;
    %spritemapEntry(0, $1F2, $FC, 0, 1, 3, 5, $6C)
    %spritemapEntry(0, $06, $FC, 0, 1, 3, 5, $6C)
    %spritemapEntry(0, $00, $FC, 0, 1, 3, 5, $6C)
    %spritemapEntry(0, $1F8, $FC, 0, 0, 3, 5, $6C)

UNSUED_SpriteObjectSpritemaps_8_1C_ElevatorPad_1_B4CD6D:
    dw $0004                                                             ;B4CD6D;
    %spritemapEntry(0, $00, $FC, 0, 1, 3, 5, $6E)
    %spritemapEntry(0, $08, $FC, 0, 1, 3, 5, $6D)
    %spritemapEntry(0, $1F8, $FC, 0, 0, 3, 5, $6E)
    %spritemapEntry(0, $1F0, $FC, 0, 0, 3, 5, $6D)

UNSUED_SpriteObjectSpritemaps_B4CD83:
    dw $0004                                                             ;B4CD83;
    %spritemapEntry(0, $1F0, $FE, 0, 0, 3, 5, $6F)
    %spritemapEntry(0, $08, $FE, 0, 0, 3, 5, $6F)
    %spritemapEntry(0, $00, $FE, 0, 0, 3, 5, $6F)
    %spritemapEntry(0, $1F8, $FE, 0, 0, 3, 5, $6F)

SpriteObjectSpritemaps_9_SmallDustCloud_0:
    dw $0001                                                             ;B4CD99;
    %spritemapEntry(1, $1F8, $F8, 0, 0, 3, 5, $7C)

SpriteObjectSpritemaps_9_SmallDustCloud_1:
    dw $0001                                                             ;B4CDA0;
    %spritemapEntry(1, $1F8, $F6, 0, 0, 3, 5, $7E)

SpriteObjectSpritemaps_9_SmallDustCloud_2:
    dw $0001                                                             ;B4CDA7;
    %spritemapEntry(1, $1F8, $F4, 0, 0, 3, 5, $9A)

SpriteObjectSpritemaps_9_SmallDustCloud_3:
    dw $0001                                                             ;B4CDAE;
    %spritemapEntry(1, $1F8, $F2, 0, 0, 3, 5, $9C)

SpriteObjectSpritemaps_A_PirateLandingDustCloud_0:
    dw $0001                                                             ;B4CDB5;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $48)

SpriteObjectSpritemaps_A_PirateLandingDustCloud_1:
    dw $0001                                                             ;B4CDBC;
    %spritemapEntry(0, $1FC, $FA, 0, 0, 3, 5, $49)

SpriteObjectSpritemaps_A_PirateLandingDustCloud_2:
    dw $0001                                                             ;B4CDC3;
    %spritemapEntry(0, $1FC, $F8, 0, 0, 3, 5, $4A)

SpriteObjectSpritemaps_A_PirateLandingDustCloud_3:
    dw $0001                                                             ;B4CDCA;
    %spritemapEntry(0, $1FC, $F6, 0, 0, 3, 5, $4B)

UNSUED_SpriteObjectSpritemaps_B_EyeDoorSweatDrop_0_B4CDD1:
    dw $0001                                                             ;B4CDD1;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $2C)

UNSUED_SpriteObjectSpritemaps_B_EyeDoorSweatDrop_1_B4CDD8:
    dw $0001                                                             ;B4CDD8;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $2D)

UNSUED_SpriteObjectSpritemaps_B_EyeDoorSweatDrop_2_B4CDDF:
    dw $0001                                                             ;B4CDDF;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $2E)

UNSUED_SpriteObjectSpritemaps_B_EyeDoorSweatDrop_3_B4CDE6:
    dw $0001                                                             ;B4CDE6;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $2F)

SpriteObjectSpritemaps_C_Smoke_0:
    dw $0001                                                             ;B4CDED;
    %spritemapEntry(1, $1F8, $F6, 0, 0, 3, 5, $76)

SpriteObjectSpritemaps_C_Smoke_1:
    dw $0001                                                             ;B4CDF4;
    %spritemapEntry(1, $1F8, $F4, 0, 0, 3, 5, $78)

SpriteObjectSpritemaps_C_Smoke_2:
    dw $0001                                                             ;B4CDFB;
    %spritemapEntry(1, $1F8, $F2, 0, 0, 3, 5, $98)

SpriteObjectSpritemaps_C_Smoke_3:
    dw $0001                                                             ;B4CE02;
    %spritemapEntry(1, $1F8, $F0, 0, 0, 3, 5, $9E)

UNUSED_SpriteObjectSpritemaps_B4CE09:
    dw $0001                                                             ;B4CE09;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $25)

UNUSED_SpriteObjectSpritemaps_B4CE10:
    dw $0001                                                             ;B4CE10;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $43)

UNUSED_SpriteObjectSpritemaps_B4CE17:
    dw $0001                                                             ;B4CE17;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $40)

UNUSED_SpriteObjectSpritemaps_D_SmallEnergyDrop_0_B4CE1E:
    dw $0001                                                             ;B4CE1E;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $3E)

UNUSED_SpriteObjectSpritemaps_D_SmallEnergyDrop_1_B4CE25:
    dw $0001                                                             ;B4CE25;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $3D)

UNUSED_SpriteObjectSpritemaps_D_SmallEnergyDrop_2_B4CE2C:
    dw $0001                                                             ;B4CE2C;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $41)

UNUSED_SpriteObjectSpritemaps_D_SmallEnergyDrop_3_B4CE33:
    dw $0001                                                             ;B4CE33;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $42)

UNUSED_SpriteObjectSpritemaps_E_BigEnergyDrop_0_B4CE3A:
    dw $0004                                                             ;B4CE3A;
    %spritemapEntry(0, $00, $00, 1, 1, 3, 5, $44)
    %spritemapEntry(0, $1F8, $00, 1, 0, 3, 5, $44)
    %spritemapEntry(0, $00, $F8, 0, 1, 3, 5, $44)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 5, $44)

UNUSED_SpriteObjectSpritemaps_E_BigEnergyDrop_1_B4CE50:
    dw $0004                                                             ;B4CE50;
    %spritemapEntry(0, $00, $00, 1, 1, 3, 5, $45)
    %spritemapEntry(0, $00, $F8, 0, 1, 3, 5, $45)
    %spritemapEntry(0, $1F8, $00, 1, 0, 3, 5, $45)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 5, $45)

UNUSED_SpriteObjectSpritemaps_E_BigEnergyDrop_2_B4CE66:
    dw $0004                                                             ;B4CE66;
    %spritemapEntry(0, $1F8, $00, 1, 0, 3, 5, $46)
    %spritemapEntry(0, $00, $00, 1, 1, 3, 5, $46)
    %spritemapEntry(0, $00, $F8, 0, 1, 3, 5, $46)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 5, $46)

UNUSED_SpriteObjectSpritemaps_E_BigEnergyDrop_3_B4CE7C:
    dw $0001                                                             ;B4CE7C;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $42)

UNUSED_SpriteObjectSpritemaps_F_Bomb_0_B4CE83:
    dw $0001                                                             ;B4CE83;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $4C)

UNUSED_SpriteObjectSpritemaps_F_Bomb_1_B4CE8A:
    dw $0001                                                             ;B4CE8A;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $4D)

UNUSED_SpriteObjectSpritemaps_F_Bomb_2_B4CE91:
    dw $0001                                                             ;B4CE91;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $4E)

UNUSED_SpriteObjectSpritemaps_F_Bomb_3_B4CE98:
    dw $0001                                                             ;B4CE98;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $4F)

UNUSED_SpriteObjectSpritemaps_B4CE9F:
    dw $0002                                                             ;B4CE9F;
    %spritemapEntry(0, $1FF, $FC, 0, 0, 3, 5, $55)
    %spritemapEntry(0, $1F7, $FC, 0, 0, 3, 5, $54)

UNUSED_SpriteObjectSpritemaps_B4CEAB:
    dw $0003                                                             ;B4CEAB;
    %spritemapEntry(0, $1FA, $F5, 0, 0, 3, 5, $56)
    %spritemapEntry(0, $02, $FD, 0, 0, 3, 5, $58)
    %spritemapEntry(0, $1FA, $FD, 0, 0, 3, 5, $57)

UNUSED_SpriteObjectSpritemaps_B4CEBC:
    dw $0002                                                             ;B4CEBC;
    %spritemapEntry(0, $1FD, $F7, 0, 0, 3, 5, $59)
    %spritemapEntry(0, $1FD, $FF, 0, 0, 3, 5, $5A)

UNUSED_SpriteObjectSpritemaps_B4CEC8:
    dw $0003                                                             ;B4CEC8;
    %spritemapEntry(0, $1FE, $F5, 0, 1, 3, 5, $56)
    %spritemapEntry(0, $1F6, $FD, 0, 1, 3, 5, $58)
    %spritemapEntry(0, $1FE, $FD, 0, 1, 3, 5, $57)

UNUSED_SpriteObjectSpritemaps_B4CED9:
    dw $0002                                                             ;B4CED9;
    %spritemapEntry(0, $1F9, $FC, 0, 1, 3, 5, $55)
    %spritemapEntry(0, $01, $FC, 0, 1, 3, 5, $54)

UNUSED_SpriteObjectSpritemaps_B4CEE5:
    dw $0003                                                             ;B4CEE5;
    %spritemapEntry(0, $1FE, $03, 1, 1, 3, 5, $56)
    %spritemapEntry(0, $1F6, $FB, 1, 1, 3, 5, $58)
    %spritemapEntry(0, $1FE, $FB, 1, 1, 3, 5, $57)

UNUSED_SpriteObjectSpritemaps_B4CEF6:
    dw $0002                                                             ;B4CEF6;
    %spritemapEntry(0, $1FD, $01, 1, 0, 3, 5, $59)
    %spritemapEntry(0, $1FD, $F9, 1, 0, 3, 5, $5A)

UNUSED_SpriteObjectSpritemaps_B4CF02:
    dw $0003                                                             ;B4CF02;
    %spritemapEntry(0, $1FA, $03, 1, 0, 3, 5, $56)
    %spritemapEntry(0, $02, $FB, 1, 0, 3, 5, $58)
    %spritemapEntry(0, $1FA, $FB, 1, 0, 3, 5, $57)

UNUSED_SpriteObjectSpritemaps_B4CF13:
    dw $0002                                                             ;B4CF13;
    %spritemapEntry(0, $00, $FC, 0, 0, 3, 5, $65)
    %spritemapEntry(0, $1F8, $FC, 0, 0, 3, 5, $64)

UNUSED_SpriteObjectSpritemaps_B4CF1F:
    dw $0003                                                             ;B4CF1F;
    %spritemapEntry(0, $02, $FE, 0, 0, 3, 5, $68)
    %spritemapEntry(0, $1FA, $FE, 0, 0, 3, 5, $67)
    %spritemapEntry(0, $1FA, $F6, 0, 0, 3, 5, $66)

UNUSED_SpriteObjectSpritemaps_B4CF30:
    dw $0002                                                             ;B4CF30;
    %spritemapEntry(0, $1FC, $F8, 0, 0, 3, 5, $69)
    %spritemapEntry(0, $1FC, $00, 0, 0, 3, 5, $6A)

UNUSED_SpriteObjectSpritemaps_B4CF3C:
    dw $0003                                                             ;B4CF3C;
    %spritemapEntry(0, $1F6, $FE, 0, 1, 3, 5, $68)
    %spritemapEntry(0, $1FE, $FE, 0, 1, 3, 5, $67)
    %spritemapEntry(0, $1FE, $F6, 0, 1, 3, 5, $66)

UNUSED_SpriteObjectSpritemaps_B4CF4D:
    dw $0002                                                             ;B4CF4D;
    %spritemapEntry(0, $1F8, $FC, 0, 1, 3, 5, $65)
    %spritemapEntry(0, $00, $FC, 0, 1, 3, 5, $64)

UNUSED_SpriteObjectSpritemaps_B4CF59:
    dw $0003                                                             ;B4CF59;
    %spritemapEntry(0, $1F6, $FA, 1, 1, 3, 5, $68)
    %spritemapEntry(0, $1FE, $FA, 1, 1, 3, 5, $67)
    %spritemapEntry(0, $1FE, $02, 1, 1, 3, 5, $66)

UNUSED_SpriteObjectSpritemaps_B4CF6A:
    dw $0002                                                             ;B4CF6A;
    %spritemapEntry(0, $1FC, $00, 1, 0, 3, 5, $69)
    %spritemapEntry(0, $1FC, $F8, 1, 0, 3, 5, $6A)

UNUSED_SpriteObjectSpritemaps_B4CF76:
    dw $0003                                                             ;B4CF76;
    %spritemapEntry(0, $02, $FA, 1, 0, 3, 5, $68)
    %spritemapEntry(0, $1FA, $FA, 1, 0, 3, 5, $67)
    %spritemapEntry(0, $1FA, $02, 1, 0, 3, 5, $66)

UNUSED_SpriteObjectSpritemaps_10_SmallEnergyDrop_0_B4CF87:
    dw $0001                                                             ;B4CF87;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $3C)

UNUSED_SpriteObjectSpritemaps_10_SmallEnergyDrop_1_B4CF8E:
    dw $0001                                                             ;B4CF8E;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $3D)

UNUSED_SpriteObjectSpritemaps_10_SmallEnergyDrop_2_B4CF95:
    dw $0001                                                             ;B4CF95;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $3E)

UNUSED_SpriteObjectSpritemaps_B4CF9C:
    dw $0001                                                             ;B4CF9C;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $3F)

SpriteObjectSpritemaps_1D_BigExplosion_0:
    dw $0004                                                             ;B4CFA3;
    %spritemapEntry(0, $00, $00, 1, 1, 3, 5, $8A)
    %spritemapEntry(0, $1F8, $00, 1, 0, 3, 5, $8A)
    %spritemapEntry(0, $00, $F8, 0, 1, 3, 5, $8A)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 5, $8A)

SpriteObjectSpritemaps_1D_BigExplosion_1:
    dw $0004                                                             ;B4CFB9;
    %spritemapEntry(1, $4200, $00, 1, 1, 3, 5, $90)
    %spritemapEntry(1, $4200, $F0, 0, 1, 3, 5, $90)
    %spritemapEntry(1, $43F0, $00, 1, 0, 3, 5, $90)
    %spritemapEntry(1, $43F0, $F0, 0, 0, 3, 5, $90)

SpriteObjectSpritemaps_1D_BigExplosion_2:
    dw $0004                                                             ;B4CFCF;
    %spritemapEntry(1, $4200, $00, 1, 1, 3, 5, $92)
    %spritemapEntry(1, $43F0, $00, 1, 0, 3, 5, $92)
    %spritemapEntry(1, $4200, $F0, 0, 1, 3, 5, $92)
    %spritemapEntry(1, $43F0, $F0, 0, 0, 3, 5, $92)

SpriteObjectSpritemaps_1D_BigExplosion_3:
    dw $000C                                                             ;B4CFE5;
    %spritemapEntry(0, $10, $00, 1, 1, 3, 5, $C2)
    %spritemapEntry(0, $10, $F8, 0, 1, 3, 5, $C2)
    %spritemapEntry(0, $00, $10, 1, 1, 3, 5, $B2)
    %spritemapEntry(0, $1F8, $10, 1, 0, 3, 5, $B2)
    %spritemapEntry(0, $1E8, $00, 1, 0, 3, 5, $C2)
    %spritemapEntry(0, $1E8, $F8, 0, 0, 3, 5, $C2)
    %spritemapEntry(0, $00, $E8, 0, 1, 3, 5, $B2)
    %spritemapEntry(0, $1F8, $E8, 0, 0, 3, 5, $B2)
    %spritemapEntry(1, $4200, $00, 1, 1, 3, 5, $B0)
    %spritemapEntry(1, $4200, $F0, 0, 1, 3, 5, $B0)
    %spritemapEntry(1, $43F0, $00, 1, 0, 3, 5, $B0)
    %spritemapEntry(1, $43F0, $F0, 0, 0, 3, 5, $B0)

SpriteObjectSpritemaps_1D_BigExplosion_4:
    dw $0008                                                             ;B4D023;
    %spritemapEntry(1, $4208, $00, 1, 1, 3, 5, $B5)
    %spritemapEntry(1, $4200, $08, 1, 1, 3, 5, $B3)
    %spritemapEntry(1, $43E8, $00, 1, 0, 3, 5, $B5)
    %spritemapEntry(1, $43F0, $08, 1, 0, 3, 5, $B3)
    %spritemapEntry(1, $4208, $F0, 0, 1, 3, 5, $B5)
    %spritemapEntry(1, $4200, $E8, 0, 1, 3, 5, $B3)
    %spritemapEntry(1, $43E8, $F0, 0, 0, 3, 5, $B5)
    %spritemapEntry(1, $43F0, $E8, 0, 0, 3, 5, $B3)

SpriteObjectSpritemaps_1D_BigExplosion_5:
    dw $000C                                                             ;B4D04D;
    %spritemapEntry(0, $00, $10, 1, 1, 3, 5, $BB)
    %spritemapEntry(0, $1F8, $10, 1, 0, 3, 5, $BB)
    %spritemapEntry(0, $00, $E8, 0, 1, 3, 5, $BB)
    %spritemapEntry(0, $1F8, $E8, 0, 0, 3, 5, $BB)
    %spritemapEntry(0, $10, $00, 1, 1, 3, 5, $B7)
    %spritemapEntry(0, $10, $F8, 0, 1, 3, 5, $B7)
    %spritemapEntry(0, $1E8, $00, 1, 0, 3, 5, $B7)
    %spritemapEntry(0, $1E8, $F8, 0, 0, 3, 5, $B7)
    %spritemapEntry(1, $4208, $08, 1, 1, 3, 5, $B8)
    %spritemapEntry(1, $43E8, $08, 1, 0, 3, 5, $B8)
    %spritemapEntry(1, $4208, $E8, 0, 1, 3, 5, $B8)
    %spritemapEntry(1, $43E8, $E8, 0, 0, 3, 5, $B8)

UNUSED_SpriteObjectSpritemaps_26_0_B4D08B:
    dw $0009                                                             ;B4D08B;
    %spritemapEntry(1, $1FE, $FB, 0, 0, 2, 0, $D6)
    %spritemapEntry(1, $1EE, $FB, 0, 0, 2, 0, $D4)
    %spritemapEntry(1, $1FE, $EB, 0, 0, 2, 0, $D2)
    %spritemapEntry(1, $1EE, $EB, 0, 0, 2, 0, $D0)
    %spritemapEntry(1, $02, $FB, 0, 0, 2, 0, $D8)
    %spritemapEntry(1, $01, $01, 0, 0, 2, 0, $D8)
    %spritemapEntry(1, $1FF, $07, 0, 0, 2, 0, $DC)
    %spritemapEntry(0, $1FE, $10, 0, 0, 2, 0, $F6)
    %spritemapEntry(0, $1FE, $08, 0, 0, 2, 0, $F5)

UNUSED_SpriteObjectSpritemaps_26_1_B4D0BA:
    dw $0009                                                             ;B4D0BA;
    %spritemapEntry(1, $1FE, $FB, 0, 0, 2, 0, $D6)
    %spritemapEntry(1, $1EE, $FB, 0, 0, 2, 0, $D4)
    %spritemapEntry(1, $1FE, $EB, 0, 0, 2, 0, $D2)
    %spritemapEntry(1, $1EE, $EB, 0, 0, 2, 0, $D0)
    %spritemapEntry(1, $02, $FC, 0, 0, 2, 0, $D8)
    %spritemapEntry(1, $01, $02, 0, 0, 2, 0, $D8)
    %spritemapEntry(1, $1FF, $07, 0, 0, 2, 0, $DC)
    %spritemapEntry(0, $1FE, $10, 0, 0, 2, 0, $F6)
    %spritemapEntry(0, $1FE, $08, 0, 0, 2, 0, $F5)

UNUSED_SpriteObjectSpritemaps_26_2_B4D0E9:
    dw $0009                                                             ;B4D0E9;
    %spritemapEntry(1, $1FE, $FB, 0, 0, 2, 0, $D6)
    %spritemapEntry(1, $1EE, $FB, 0, 0, 2, 0, $D4)
    %spritemapEntry(1, $1FE, $EB, 0, 0, 2, 0, $D2)
    %spritemapEntry(1, $1EE, $EB, 0, 0, 2, 0, $D0)
    %spritemapEntry(1, $02, $FD, 0, 0, 2, 0, $D8)
    %spritemapEntry(1, $01, $03, 0, 0, 2, 0, $D8)
    %spritemapEntry(1, $1FF, $08, 0, 0, 2, 0, $DC)
    %spritemapEntry(0, $1FE, $11, 0, 0, 2, 0, $F6)
    %spritemapEntry(0, $1FE, $09, 0, 0, 2, 0, $F5)

UNUSED_SpriteObjectSpritemaps_26_3_B4D118:
    dw $0009                                                             ;B4D118;
    %spritemapEntry(1, $1FE, $FB, 0, 0, 2, 0, $D6)
    %spritemapEntry(1, $1EE, $FB, 0, 0, 2, 0, $D4)
    %spritemapEntry(1, $1FE, $EB, 0, 0, 2, 0, $D2)
    %spritemapEntry(1, $1EE, $EB, 0, 0, 2, 0, $D0)
    %spritemapEntry(1, $02, $FD, 0, 0, 2, 0, $D8)
    %spritemapEntry(1, $01, $04, 0, 0, 2, 0, $D8)
    %spritemapEntry(1, $1FF, $09, 0, 0, 2, 0, $DC)
    %spritemapEntry(0, $1FE, $12, 0, 0, 2, 0, $F6)
    %spritemapEntry(0, $1FE, $0A, 0, 0, 2, 0, $F5)

UNUSED_SpriteObjectSpritemaps_26_4_B4D147:
    dw $0009                                                             ;B4D147;
    %spritemapEntry(1, $1FE, $FB, 0, 0, 2, 0, $D6)
    %spritemapEntry(1, $1EE, $FB, 0, 0, 2, 0, $D4)
    %spritemapEntry(1, $1FE, $EB, 0, 0, 2, 0, $D2)
    %spritemapEntry(1, $1EE, $EB, 0, 0, 2, 0, $D0)
    %spritemapEntry(1, $02, $FD, 0, 0, 2, 0, $D8)
    %spritemapEntry(1, $01, $04, 0, 0, 2, 0, $D8)
    %spritemapEntry(1, $1FF, $0A, 0, 0, 2, 0, $DC)
    %spritemapEntry(0, $1FE, $11, 0, 0, 2, 0, $F6)
    %spritemapEntry(0, $1FE, $09, 0, 0, 2, 0, $F5)

UNUSED_SpriteObjectSpritemaps_26_5_B4D176:
    dw $0009                                                             ;B4D176;
    %spritemapEntry(1, $1FE, $FB, 0, 0, 2, 0, $D6)
    %spritemapEntry(1, $1EE, $FB, 0, 0, 2, 0, $D4)
    %spritemapEntry(1, $1FE, $EB, 0, 0, 2, 0, $D2)
    %spritemapEntry(1, $1EE, $EB, 0, 0, 2, 0, $D0)
    %spritemapEntry(1, $02, $FC, 0, 0, 2, 0, $D8)
    %spritemapEntry(1, $01, $03, 0, 0, 2, 0, $D8)
    %spritemapEntry(1, $1FF, $09, 0, 0, 2, 0, $DC)
    %spritemapEntry(0, $1FE, $10, 0, 0, 2, 0, $F6)
    %spritemapEntry(0, $1FE, $08, 0, 0, 2, 0, $F5)

UNUSED_SpriteObjectSpritemaps_B4D1A5:
    dw $0009                                                             ;B4D1A5;
    %spritemapEntry(1, $1FE, $FB, 0, 0, 2, 0, $D6)
    %spritemapEntry(1, $1EE, $FB, 0, 0, 2, 0, $D4)
    %spritemapEntry(1, $1FE, $EB, 0, 0, 2, 0, $D2)
    %spritemapEntry(1, $1EE, $EB, 0, 0, 2, 0, $D0)
    %spritemapEntry(1, $02, $FB, 0, 0, 2, 0, $D8)
    %spritemapEntry(1, $01, $01, 0, 0, 2, 0, $D8)
    %spritemapEntry(1, $1FF, $07, 0, 0, 2, 0, $DC)
    %spritemapEntry(0, $1FE, $10, 0, 0, 2, 0, $F6)
    %spritemapEntry(0, $1FE, $08, 0, 0, 2, 0, $F5)

UNUSED_SpriteObjectSpritemaps_27_0_B4D1D4:
    dw $0005                                                             ;B4D1D4;
    %spritemapEntry(0, $00, $F8, 0, 0, 2, 0, $F3)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 2, 0, $F2)
    %spritemapEntry(0, $02, $FC, 0, 0, 2, 0, $F4)
    %spritemapEntry(0, $1FE, $F4, 0, 0, 2, 0, $F1)
    %spritemapEntry(0, $1F6, $F4, 0, 0, 2, 0, $F0)

UNUSED_SpriteObjectSpritemaps_27_1_B4D1EF:
    dw $0005                                                             ;B4D1EF;
    %spritemapEntry(0, $1FE, $F4, 0, 0, 2, 0, $F3)
    %spritemapEntry(0, $1F6, $F4, 0, 0, 2, 0, $F2)
    %spritemapEntry(0, $00, $F8, 0, 0, 2, 0, $F4)
    %spritemapEntry(0, $02, $FC, 0, 0, 2, 0, $F3)
    %spritemapEntry(0, $1FA, $FC, 0, 0, 2, 0, $F2)

UNUSED_SpriteObjectSpritemaps_27_2_B4D20A:
    dw $0005                                                             ;B4D20A;
    %spritemapEntry(0, $1FE, $F4, 0, 0, 2, 0, $F4)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 2, 0, $F2)
    %spritemapEntry(0, $00, $F8, 0, 0, 2, 0, $F3)
    %spritemapEntry(0, $02, $FC, 0, 0, 2, 0, $F1)
    %spritemapEntry(0, $1FA, $FC, 0, 0, 2, 0, $F0)

UNUSED_SpriteObjectSpritemaps_27_3_B4D225:
    dw $0006                                                             ;B4D225;
    %spritemapEntry(0, $1FE, $F4, 0, 0, 2, 0, $F3)
    %spritemapEntry(0, $1F6, $F4, 0, 0, 2, 0, $F2)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 2, 0, $F0)
    %spritemapEntry(0, $00, $F8, 0, 0, 2, 0, $F1)
    %spritemapEntry(0, $02, $FC, 0, 0, 2, 0, $F3)
    %spritemapEntry(0, $1FA, $FC, 0, 0, 2, 0, $F2)

UNUSED_SpriteObjectSpritemaps_27_4_B4D245:
    dw $0003                                                             ;B4D245;
    %spritemapEntry(0, $1FE, $F4, 0, 0, 2, 0, $F4)
    %spritemapEntry(0, $00, $F8, 0, 0, 2, 0, $F4)
    %spritemapEntry(0, $02, $FC, 0, 0, 2, 0, $F4)

UNUSED_SpriteObjectSpritemaps_B4D256:
    dw $0006                                                             ;B4D256;
    %spritemapEntry(0, $1FE, $F4, 0, 0, 2, 0, $F3)
    %spritemapEntry(0, $1F6, $F4, 0, 0, 2, 0, $F2)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 2, 0, $F2)
    %spritemapEntry(0, $00, $F8, 0, 0, 2, 0, $F3)
    %spritemapEntry(0, $02, $FC, 0, 0, 2, 0, $F3)
    %spritemapEntry(0, $1FA, $FC, 0, 0, 2, 0, $F2)

UNUSED_SpriteObjectSpritemaps_B4D276:
    dw $0006                                                             ;B4D276;
    %spritemapEntry(0, $1FE, $F4, 0, 0, 2, 0, $F1)
    %spritemapEntry(0, $1F6, $F4, 0, 0, 2, 0, $F0)
    %spritemapEntry(0, $00, $F8, 0, 0, 2, 0, $F1)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 2, 0, $F0)
    %spritemapEntry(0, $02, $FC, 0, 0, 2, 0, $F1)
    %spritemapEntry(0, $1FA, $FC, 0, 0, 2, 0, $F0)

UNUSED_SpriteObjectSpritemaps_B4D296:
    dw $0004                                                             ;B4D296;
    %spritemapEntry(0, $00, $00, 1, 0, 2, 0, $F8)
    %spritemapEntry(0, $1F8, $00, 1, 0, 2, 0, $F7)
    %spritemapEntry(0, $00, $F8, 0, 0, 2, 0, $F8)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 2, 0, $F7)

UNUSED_SpriteObjectSpritemaps_2A_B4D2AC:
    dw $0001                                                             ;B4D2AC;
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $DE)

UNUSED_SpriteObjectSpritemaps_28_0_B4D2B3:
    dw $0009                                                             ;B4D2B3;
    %spritemapEntry(1, $1F2, $FB, 0, 1, 2, 0, $D6)
    %spritemapEntry(1, $02, $FB, 0, 1, 2, 0, $D4)
    %spritemapEntry(1, $1F2, $EB, 0, 1, 2, 0, $D2)
    %spritemapEntry(1, $02, $EB, 0, 1, 2, 0, $D0)
    %spritemapEntry(1, $1EE, $FB, 0, 1, 2, 0, $D8)
    %spritemapEntry(1, $1EF, $01, 0, 1, 2, 0, $D8)
    %spritemapEntry(1, $1F1, $07, 0, 1, 2, 0, $DC)
    %spritemapEntry(0, $1FA, $10, 0, 1, 2, 0, $F6)
    %spritemapEntry(0, $1FA, $08, 0, 1, 2, 0, $F5)

UNUSED_SpriteObjectSpritemaps_28_1_B4D2E2:
    dw $0009                                                             ;B4D2E2;
    %spritemapEntry(1, $1F2, $FB, 0, 1, 2, 0, $D6)
    %spritemapEntry(1, $02, $FB, 0, 1, 2, 0, $D4)
    %spritemapEntry(1, $1F2, $EB, 0, 1, 2, 0, $D2)
    %spritemapEntry(1, $02, $EB, 0, 1, 2, 0, $D0)
    %spritemapEntry(1, $1EE, $FC, 0, 1, 2, 0, $D8)
    %spritemapEntry(1, $1EF, $02, 0, 1, 2, 0, $D8)
    %spritemapEntry(1, $1F1, $07, 0, 1, 2, 0, $DC)
    %spritemapEntry(0, $1FA, $10, 0, 1, 2, 0, $F6)
    %spritemapEntry(0, $1FA, $08, 0, 1, 2, 0, $F5)

UNUSED_SpriteObjectSpritemaps_28_2_B4D311:
    dw $0009                                                             ;B4D311;
    %spritemapEntry(1, $1F2, $FB, 0, 1, 2, 0, $D6)
    %spritemapEntry(1, $02, $FB, 0, 1, 2, 0, $D4)
    %spritemapEntry(1, $1F2, $EB, 0, 1, 2, 0, $D2)
    %spritemapEntry(1, $02, $EB, 0, 1, 2, 0, $D0)
    %spritemapEntry(1, $1EE, $FD, 0, 1, 2, 0, $D8)
    %spritemapEntry(1, $1EF, $03, 0, 1, 2, 0, $D8)
    %spritemapEntry(1, $1F1, $08, 0, 1, 2, 0, $DC)
    %spritemapEntry(0, $1FA, $11, 0, 1, 2, 0, $F6)
    %spritemapEntry(0, $1FA, $09, 0, 1, 2, 0, $F5)

UNUSED_SpriteObjectSpritemaps_28_3_B4D340:
    dw $0009                                                             ;B4D340;
    %spritemapEntry(1, $1F2, $FB, 0, 1, 2, 0, $D6)
    %spritemapEntry(1, $02, $FB, 0, 1, 2, 0, $D4)
    %spritemapEntry(1, $1F2, $EB, 0, 1, 2, 0, $D2)
    %spritemapEntry(1, $02, $EB, 0, 1, 2, 0, $D0)
    %spritemapEntry(1, $1EE, $FD, 0, 1, 2, 0, $D8)
    %spritemapEntry(1, $1EF, $04, 0, 1, 2, 0, $D8)
    %spritemapEntry(1, $1F1, $09, 0, 1, 2, 0, $DC)
    %spritemapEntry(0, $1FA, $12, 0, 1, 2, 0, $F6)
    %spritemapEntry(0, $1FA, $0A, 0, 1, 2, 0, $F5)

UNUSED_SpriteObjectSpritemaps_28_4_B4D36F:
    dw $0009                                                             ;B4D36F;
    %spritemapEntry(1, $1F2, $FB, 0, 1, 2, 0, $D6)
    %spritemapEntry(1, $02, $FB, 0, 1, 2, 0, $D4)
    %spritemapEntry(1, $1F2, $EB, 0, 1, 2, 0, $D2)
    %spritemapEntry(1, $02, $EB, 0, 1, 2, 0, $D0)
    %spritemapEntry(1, $1EE, $FD, 0, 1, 2, 0, $D8)
    %spritemapEntry(1, $1EF, $04, 0, 1, 2, 0, $D8)
    %spritemapEntry(1, $1F1, $0A, 0, 1, 2, 0, $DC)
    %spritemapEntry(0, $1FA, $11, 0, 1, 2, 0, $F6)
    %spritemapEntry(0, $1FA, $09, 0, 1, 2, 0, $F5)

UNUSED_SpriteObjectSpritemaps_28_5_B4D39E:
    dw $0009                                                             ;B4D39E;
    %spritemapEntry(1, $1F2, $FB, 0, 1, 2, 0, $D6)
    %spritemapEntry(1, $02, $FB, 0, 1, 2, 0, $D4)
    %spritemapEntry(1, $1F2, $EB, 0, 1, 2, 0, $D2)
    %spritemapEntry(1, $02, $EB, 0, 1, 2, 0, $D0)
    %spritemapEntry(1, $1EE, $FC, 0, 1, 2, 0, $D8)
    %spritemapEntry(1, $1EF, $03, 0, 1, 2, 0, $D8)
    %spritemapEntry(1, $1F1, $09, 0, 1, 2, 0, $DC)
    %spritemapEntry(0, $1FA, $10, 0, 1, 2, 0, $F6)
    %spritemapEntry(0, $1FA, $08, 0, 1, 2, 0, $F5)

UNUSED_SpriteObjectSpritemaps_B4D3CD:
    dw $0009                                                             ;B4D3CD;
    %spritemapEntry(1, $1F2, $FB, 0, 1, 2, 0, $D6)
    %spritemapEntry(1, $02, $FB, 0, 1, 2, 0, $D4)
    %spritemapEntry(1, $1F2, $EB, 0, 1, 2, 0, $D2)
    %spritemapEntry(1, $02, $EB, 0, 1, 2, 0, $D0)
    %spritemapEntry(1, $1EE, $FB, 0, 1, 2, 0, $D8)
    %spritemapEntry(1, $1EF, $01, 0, 1, 2, 0, $D8)
    %spritemapEntry(1, $1F1, $07, 0, 1, 2, 0, $DC)
    %spritemapEntry(0, $1FA, $10, 0, 1, 2, 0, $F6)
    %spritemapEntry(0, $1FA, $08, 0, 1, 2, 0, $F5)

UNUSED_SpriteObjectSpritemaps_29_0_B4D3FC:
    dw $0005                                                             ;B4D3FC;
    %spritemapEntry(0, $1F8, $F8, 0, 1, 2, 0, $F3)
    %spritemapEntry(0, $00, $F8, 0, 1, 2, 0, $F2)
    %spritemapEntry(0, $1FA, $F4, 0, 1, 2, 0, $F1)
    %spritemapEntry(0, $02, $F4, 0, 1, 2, 0, $F0)
    %spritemapEntry(0, $1F6, $FC, 0, 1, 2, 0, $F4)

UNUSED_SpriteObjectSpritemaps_29_1_B4D417:
    dw $0005                                                             ;B4D417;
    %spritemapEntry(0, $1FA, $F4, 0, 1, 2, 0, $F3)
    %spritemapEntry(0, $02, $F4, 0, 1, 2, 0, $F2)
    %spritemapEntry(0, $1F8, $F8, 0, 1, 2, 0, $F4)
    %spritemapEntry(0, $1F6, $FC, 0, 1, 2, 0, $F3)
    %spritemapEntry(0, $1FE, $FC, 0, 1, 2, 0, $F2)

UNUSED_SpriteObjectSpritemaps_29_2_B4D432:
    dw $0005                                                             ;B4D432;
    %spritemapEntry(0, $1FA, $F4, 0, 1, 2, 0, $F4)
    %spritemapEntry(0, $1F8, $F8, 0, 1, 2, 0, $F3)
    %spritemapEntry(0, $00, $F8, 0, 1, 2, 0, $F2)
    %spritemapEntry(0, $1F6, $FC, 0, 1, 2, 0, $F1)
    %spritemapEntry(0, $1FE, $FC, 0, 1, 2, 0, $F0)

UNUSED_SpriteObjectSpritemaps_29_3_B4D44D:
    dw $0006                                                             ;B4D44D;
    %spritemapEntry(0, $1FA, $F4, 0, 1, 2, 0, $F3)
    %spritemapEntry(0, $02, $F4, 0, 1, 2, 0, $F2)
    %spritemapEntry(0, $00, $F8, 0, 1, 2, 0, $F0)
    %spritemapEntry(0, $1F8, $F8, 0, 1, 2, 0, $F1)
    %spritemapEntry(0, $1F6, $FC, 0, 1, 2, 0, $F3)
    %spritemapEntry(0, $1FE, $FC, 0, 1, 2, 0, $F2)

UNUSED_SpriteObjectSpritemaps_29_4_B4D46D:
    dw $0003                                                             ;B4D46D;
    %spritemapEntry(0, $1F6, $FC, 0, 1, 2, 0, $F4)
    %spritemapEntry(0, $1F8, $F8, 0, 1, 2, 0, $F4)
    %spritemapEntry(0, $1FA, $F4, 0, 1, 2, 0, $F4)

UNUSED_SpriteObjectSpritemaps_B4D47E:
    dw $0006                                                             ;B4D47E;
    %spritemapEntry(0, $1FA, $F4, 0, 1, 2, 0, $F3)
    %spritemapEntry(0, $02, $F4, 0, 1, 2, 0, $F2)
    %spritemapEntry(0, $1F8, $F8, 0, 1, 2, 0, $F3)
    %spritemapEntry(0, $00, $F8, 0, 1, 2, 0, $F2)
    %spritemapEntry(0, $1F6, $FC, 0, 1, 2, 0, $F3)
    %spritemapEntry(0, $1FE, $FC, 0, 1, 2, 0, $F2)

UNUSED_SpriteObjectSpritemaps_B4D49E:
    dw $0006                                                             ;B4D49E;
    %spritemapEntry(0, $1FA, $F4, 0, 1, 2, 0, $F1)
    %spritemapEntry(0, $02, $F4, 0, 1, 2, 0, $F0)
    %spritemapEntry(0, $00, $F8, 0, 1, 2, 0, $F0)
    %spritemapEntry(0, $1F8, $F8, 0, 1, 2, 0, $F1)
    %spritemapEntry(0, $1F6, $FC, 0, 1, 2, 0, $F1)
    %spritemapEntry(0, $1FE, $FC, 0, 1, 2, 0, $F0)

SpriteObjectSpritemaps_2B_Puromi_0:
    dw $0001                                                             ;B4D4BE;
    %spritemapEntry(1, $1F9, $F8, 0, 0, 2, 1, $10A)

SpriteObjectSpritemaps_2B_Puromi_1:
    dw $0001                                                             ;B4D4C5;
    %spritemapEntry(1, $1F9, $F8, 0, 0, 2, 1, $108)

SpriteObjectSpritemaps_2B_Puromi_2:
    dw $0001                                                             ;B4D4CC;
    %spritemapEntry(1, $1F8, $F8, 1, 1, 2, 1, $10A)

SpriteObjectSpritemaps_2B_Puromi_3:
    dw $0001                                                             ;B4D4D3;
    %spritemapEntry(1, $1F8, $F8, 1, 1, 2, 1, $108)

SpriteObjectSpritemaps_2B_Puromi_4:
    dw $0001                                                             ;B4D4DA;
    %spritemapEntry(1, $1F9, $F8, 0, 0, 2, 1, $106)

SpriteObjectSpritemaps_2B_Puromi_5:
    dw $0001                                                             ;B4D4E1;
    %spritemapEntry(1, $1F9, $F8, 0, 0, 2, 1, $122)

SpriteObjectSpritemaps_2B_Puromi_6:
    dw $0001                                                             ;B4D4E8;
    %spritemapEntry(1, $1F8, $F8, 1, 1, 2, 1, $106)

SpriteObjectSpritemaps_2B_Puromi_7:
    dw $0001                                                             ;B4D4EF;
    %spritemapEntry(1, $1F8, $F8, 1, 1, 2, 1, $122)

SpriteObjectSpritemaps_2C_PuromiRightExplosion_0:
    dw $0001                                                             ;B4D4F6;
    %spritemapEntry(1, $1F9, $F9, 0, 0, 2, 1, $10E)

SpriteObjectSpritemaps_2C_PuromiRightExplosion_1:
    dw $0001                                                             ;B4D4FD;
    %spritemapEntry(1, $1FD, $F5, 0, 0, 2, 1, $120)

SpriteObjectSpritemaps_2C_PuromiRightExplosion_2:
    dw $0001                                                             ;B4D504;
    %spritemapEntry(1, $03, $EE, 0, 0, 2, 1, $104)

SpriteObjectSpritemaps_2C_PuromiRightExplosion_3:
    dw $0001                                                             ;B4D50B;
    %spritemapEntry(1, $05, $EC, 0, 0, 2, 1, $108)

SpriteObjectSpritemaps_2C_PuromiRightExplosion_4:
    dw $0001                                                             ;B4D512;
    %spritemapEntry(1, $05, $EC, 0, 0, 2, 1, $10C)

SpriteObjectSpritemaps_2C_PuromiRightExplosion_5:
    dw $0001                                                             ;B4D519;
    %spritemapEntry(1, $05, $EC, 0, 0, 2, 1, $126)

SpriteObjectSpritemaps_2C_PuromiRightExplosion_6:
    dw $0001                                                             ;B4D520;
    %spritemapEntry(1, $05, $EC, 0, 0, 2, 1, $12E)

SpriteObjectSpritemaps_2D_PuromiLeftExplosion_0:
    dw $0001                                                             ;B4D527;
    %spritemapEntry(1, $1F8, $F9, 0, 1, 2, 1, $10E)

SpriteObjectSpritemaps_2D_PuromiLeftExplosion_1:
    dw $0001                                                             ;B4D52E;
    %spritemapEntry(1, $1F4, $F5, 0, 1, 2, 1, $120)

SpriteObjectSpritemaps_2D_PuromiLeftExplosion_2:
    dw $0001                                                             ;B4D535;
    %spritemapEntry(1, $1EE, $EE, 0, 1, 2, 1, $104)

SpriteObjectSpritemaps_2D_PuromiLeftExplosion_3:
    dw $0001                                                             ;B4D53C;
    %spritemapEntry(1, $1EC, $EC, 0, 1, 2, 1, $108)

SpriteObjectSpritemaps_2D_PuromiLeftExplosion_4:
    dw $0001                                                             ;B4D543;
    %spritemapEntry(1, $1EC, $EC, 0, 1, 2, 1, $10C)

SpriteObjectSpritemaps_2D_PuromiLeftExplosion_5:
    dw $0001                                                             ;B4D54A;
    %spritemapEntry(1, $1EC, $EC, 0, 1, 2, 1, $126)

SpriteObjectSpritemaps_2D_PuromiLeftExplosion_6:
    dw $0001                                                             ;B4D551;
    %spritemapEntry(1, $1EB, $EC, 0, 0, 2, 1, $12E)

SpriteObjectSpritemaps_2E_PuromiSplash_0:
    dw $0002                                                             ;B4D558;
    %spritemapEntry(0, $1F1, $F8, 0, 1, 2, 1, $134)
    %spritemapEntry(0, $08, $F8, 0, 0, 2, 1, $134)

SpriteObjectSpritemaps_2E_PuromiSplash_1:
    dw $0002                                                             ;B4D564;
    %spritemapEntry(0, $1F1, $F8, 0, 1, 2, 1, $124)
    %spritemapEntry(0, $08, $F8, 0, 0, 2, 1, $124)

SpriteObjectSpritemaps_2E_PuromiSplash_2:
    dw $0002                                                             ;B4D570;
    %spritemapEntry(1, $1E9, $F0, 0, 1, 2, 1, $128)
    %spritemapEntry(1, $08, $F0, 0, 0, 2, 1, $128)

SpriteObjectSpritemaps_2E_PuromiSplash_3:
    dw $0002                                                             ;B4D57C;
    %spritemapEntry(1, $1E9, $F0, 0, 1, 2, 1, $12C)
    %spritemapEntry(1, $08, $F0, 0, 0, 2, 1, $12C)

SpriteObjectSpritemaps_2E_PuromiSplash_4:
    dw $0002                                                             ;B4D588;
    %spritemapEntry(1, $1E8, $F0, 0, 1, 2, 1, $12A)
    %spritemapEntry(1, $09, $F0, 0, 0, 2, 1, $12A)

UNUSED_SpriteObjectSpritemaps_2F_B4D594:
    dw $0001                                                             ;B4D594;
    %spritemapEntry(1, $1F8, $F8, 0, 0, 3, 1, $140)

SpriteObjectSpritemaps_30_FallingSparkTrail_0:
    dw $0001                                                             ;B4D59B;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 0, $107)

SpriteObjectSpritemaps_30_FallingSparkTrail_1:
    dw $0001                                                             ;B4D5A2;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 0, $108)

SpriteObjectSpritemaps_30_FallingSparkTrail_2:
    dw $0001                                                             ;B4D5A9;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 0, $109)

SpriteObjectSpritemaps_30_FallingSparkTrail_3:
    dw $0001                                                             ;B4D5B0;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 0, $10A)

SpriteObjectSpritemaps_34_35_36_MetroidShell_0:
    dw $000A                                                             ;B4D5B7;
    %spritemapEntry(0, $10, $04, 0, 1, 2, 0, $130)
    %spritemapEntry(0, $10, $FC, 0, 1, 2, 0, $120)
    %spritemapEntry(0, $10, $F4, 0, 1, 2, 0, $110)
    %spritemapEntry(0, $1E8, $04, 0, 0, 2, 0, $130)
    %spritemapEntry(0, $1E8, $FC, 0, 0, 2, 0, $120)
    %spritemapEntry(0, $1E8, $F4, 0, 0, 2, 0, $110)
    %spritemapEntry(1, $00, $FC, 0, 1, 2, 0, $121)
    %spritemapEntry(1, $00, $EC, 0, 0, 2, 0, $103)
    %spritemapEntry(1, $1F0, $FC, 0, 0, 2, 0, $121)
    %spritemapEntry(1, $1F0, $EC, 0, 0, 2, 0, $101)

SpriteObjectSpritemaps_34_36_MetroidShell_1:
    dw $000A                                                             ;B4D5EB;
    %spritemapEntry(0, $10, $FC, 0, 1, 2, 0, $12A)
    %spritemapEntry(0, $10, $04, 0, 1, 2, 0, $13A)
    %spritemapEntry(0, $10, $F4, 0, 0, 2, 0, $11F)
    %spritemapEntry(0, $1E8, $04, 0, 0, 2, 0, $13A)
    %spritemapEntry(0, $1E8, $FC, 0, 0, 2, 0, $12A)
    %spritemapEntry(0, $1E8, $F4, 0, 0, 2, 0, $11A)
    %spritemapEntry(1, $00, $EC, 0, 0, 2, 0, $10D)
    %spritemapEntry(1, $00, $FC, 0, 1, 2, 0, $12B)
    %spritemapEntry(1, $1F0, $FC, 0, 0, 2, 0, $12B)
    %spritemapEntry(1, $1F0, $EC, 0, 0, 2, 0, $10B)

SpriteObjectSpritemaps_34_35_36_MetroidShell_2:
    dw $000A                                                             ;B4D61F;
    %spritemapEntry(0, $1E8, $FC, 0, 0, 2, 0, $125)
    %spritemapEntry(0, $10, $04, 0, 1, 2, 0, $135)
    %spritemapEntry(0, $10, $FC, 0, 1, 2, 0, $125)
    %spritemapEntry(0, $10, $F4, 0, 1, 2, 0, $115)
    %spritemapEntry(0, $1E8, $04, 0, 0, 2, 0, $135)
    %spritemapEntry(0, $1E8, $F4, 0, 0, 2, 0, $115)
    %spritemapEntry(1, $00, $FC, 0, 1, 2, 0, $126)
    %spritemapEntry(1, $00, $EC, 0, 0, 2, 0, $108)
    %spritemapEntry(1, $1F0, $FC, 0, 0, 2, 0, $126)
    %spritemapEntry(1, $1F0, $EC, 0, 0, 2, 0, $106)

UNUSED_SpriteObjectSpritemaps_31_MetroidInsides_0_B4D653:
    dw $0008                                                             ;B4D653;
    %spritemapEntry(0, $10, $00, 0, 1, 2, 0, $160)
    %spritemapEntry(0, $10, $F8, 0, 1, 2, 0, $150)
    %spritemapEntry(0, $1E8, $00, 0, 0, 2, 0, $160)
    %spritemapEntry(0, $1E8, $F8, 0, 0, 2, 0, $150)
    %spritemapEntry(1, $00, $00, 0, 1, 2, 0, $161)
    %spritemapEntry(1, $00, $F0, 0, 1, 2, 0, $141)
    %spritemapEntry(1, $1F0, $00, 0, 0, 2, 0, $161)
    %spritemapEntry(1, $1F0, $F0, 0, 0, 2, 0, $141)

UNUSED_SpriteObjectSpritemaps_31_MetroidInsides_1_B4D67D:
    dw $0006                                                             ;B4D67D;
    %spritemapEntry(0, $10, $00, 0, 1, 2, 0, $163)
    %spritemapEntry(0, $1E8, $00, 0, 0, 2, 0, $163)
    %spritemapEntry(1, $00, $00, 0, 1, 2, 0, $164)
    %spritemapEntry(1, $00, $F0, 0, 1, 2, 0, $144)
    %spritemapEntry(1, $1F0, $00, 0, 0, 2, 0, $164)
    %spritemapEntry(1, $1F0, $F0, 0, 0, 2, 0, $144)

UNUSED_SpriteObjectSpritemaps_31_MetroidInsides_2_B4D69D:
    dw $0008                                                             ;B4D69D;
    %spritemapEntry(0, $10, $00, 0, 1, 2, 0, $166)
    %spritemapEntry(0, $10, $F8, 0, 1, 2, 0, $156)
    %spritemapEntry(0, $1E8, $00, 0, 0, 2, 0, $166)
    %spritemapEntry(0, $1E8, $F8, 0, 0, 2, 0, $156)
    %spritemapEntry(1, $00, $00, 0, 1, 2, 0, $167)
    %spritemapEntry(1, $00, $F0, 0, 1, 2, 0, $147)
    %spritemapEntry(1, $1F0, $00, 0, 0, 2, 0, $167)
    %spritemapEntry(1, $1F0, $F0, 0, 0, 2, 0, $147)

UNUSED_SpriteObjectSpritemaps_31_MetroidInsides_3_B4D6C7:
    dw $0008                                                             ;B4D6C7;
    %spritemapEntry(0, $10, $00, 0, 1, 2, 0, $169)
    %spritemapEntry(0, $10, $F8, 0, 1, 2, 0, $159)
    %spritemapEntry(0, $1E8, $00, 0, 0, 2, 0, $169)
    %spritemapEntry(0, $1E8, $F8, 0, 0, 2, 0, $159)
    %spritemapEntry(1, $00, $00, 0, 1, 2, 0, $16A)
    %spritemapEntry(1, $00, $F0, 0, 1, 2, 0, $14A)
    %spritemapEntry(1, $1F0, $00, 0, 0, 2, 0, $16A)
    %spritemapEntry(1, $1F0, $F0, 0, 0, 2, 0, $14A)

SpriteObjectSpritemaps_32_33_MetroidElectricity_0:
    dw $0003                                                             ;B4D6F1;
    %spritemapEntry(0, $00, $EC, 0, 0, 2, 0, $17C)
    %spritemapEntry(0, $1F8, $FC, 0, 0, 2, 0, $14D)
    %spritemapEntry(0, $1F0, $FC, 0, 0, 2, 0, $14C)

SpriteObjectSpritemaps_32_33_MetroidElectricity_1:
    dw $0003                                                             ;B4D702;
    %spritemapEntry(0, $00, $EC, 0, 0, 2, 0, $17D)
    %spritemapEntry(0, $1F8, $FC, 0, 0, 2, 0, $15D)
    %spritemapEntry(0, $1F0, $FC, 0, 0, 2, 0, $15C)

SpriteObjectSpritemaps_32_33_MetroidElectricity_2:
    dw $0003                                                             ;B4D713;
    %spritemapEntry(0, $00, $EC, 0, 0, 2, 0, $17E)
    %spritemapEntry(0, $1F8, $FC, 0, 0, 2, 0, $16D)
    %spritemapEntry(0, $1F0, $FC, 0, 0, 2, 0, $16C)

SpriteObjectSpritemaps_32_33_MetroidElectricity_3:
    dw $0004                                                             ;B4D724;
    %spritemapEntry(0, $08, $FC, 0, 0, 2, 0, $14F)
    %spritemapEntry(0, $00, $FC, 0, 0, 2, 0, $14E)
    %spritemapEntry(0, $1F8, $F4, 0, 0, 2, 0, $13D)
    %spritemapEntry(0, $1F8, $EC, 0, 0, 2, 0, $12D)

SpriteObjectSpritemaps_32_33_MetroidElectricity_4:
    dw $0004                                                             ;B4D73A;
    %spritemapEntry(0, $08, $FC, 0, 0, 2, 0, $15F)
    %spritemapEntry(0, $00, $FC, 0, 0, 2, 0, $15E)
    %spritemapEntry(0, $1F8, $F4, 0, 0, 2, 0, $13E)
    %spritemapEntry(0, $1F8, $EC, 0, 0, 2, 0, $12E)

SpriteObjectSpritemaps_32_33_MetroidElectricity_5:
    dw $0004                                                             ;B4D750;
    %spritemapEntry(0, $08, $FC, 0, 0, 2, 0, $16F)
    %spritemapEntry(0, $00, $FC, 0, 0, 2, 0, $16E)
    %spritemapEntry(0, $1F8, $F4, 0, 0, 2, 0, $13F)
    %spritemapEntry(0, $1F8, $EC, 0, 0, 2, 0, $12F)

SpriteObjectSpritemaps_32_33_MetroidElectricity_6:
    dw $0003                                                             ;B4D766;
    %spritemapEntry(0, $08, $FC, 0, 0, 2, 0, $14D)
    %spritemapEntry(0, $00, $FC, 0, 0, 2, 0, $14C)
    %spritemapEntry(0, $1F8, $EC, 0, 1, 2, 0, $17C)

SpriteObjectSpritemaps_32_33_MetroidElectricity_7:
    dw $0003                                                             ;B4D777;
    %spritemapEntry(0, $08, $FC, 0, 0, 2, 0, $15D)
    %spritemapEntry(0, $00, $FC, 0, 0, 2, 0, $15C)
    %spritemapEntry(0, $1F8, $EC, 0, 1, 2, 0, $17D)

SpriteObjectSpritemaps_32_33_MetroidElectricity_8:
    dw $0003                                                             ;B4D788;
    %spritemapEntry(0, $08, $FC, 0, 0, 2, 0, $16D)
    %spritemapEntry(0, $00, $FC, 0, 0, 2, 0, $16C)
    %spritemapEntry(0, $1F8, $EC, 0, 1, 2, 0, $17E)

SpriteObjectSpritemaps_32_33_MetroidElectricity_9:
    dw $0004                                                             ;B4D799;
    %spritemapEntry(0, $1F8, $FC, 0, 0, 2, 0, $14F)
    %spritemapEntry(0, $1F0, $FC, 0, 0, 2, 0, $14E)
    %spritemapEntry(0, $00, $F4, 0, 1, 2, 0, $13D)
    %spritemapEntry(0, $00, $EC, 0, 1, 2, 0, $12D)

SpriteObjectSpritemaps_32_33_MetroidElectricity_A:
    dw $0004                                                             ;B4D7AF;
    %spritemapEntry(0, $1F8, $FC, 0, 0, 2, 0, $16F)
    %spritemapEntry(0, $1F0, $FC, 0, 0, 2, 0, $16E)
    %spritemapEntry(0, $00, $F4, 0, 1, 2, 0, $13E)
    %spritemapEntry(0, $00, $EC, 0, 1, 2, 0, $12E)

SpriteObjectSpritemaps_32_33_MetroidElectricity_B:
    dw $0004                                                             ;B4D7C5;
    %spritemapEntry(0, $1F8, $FC, 0, 0, 2, 0, $15F)
    %spritemapEntry(0, $1F0, $FC, 0, 0, 2, 0, $15E)
    %spritemapEntry(0, $00, $F4, 0, 1, 2, 0, $13F)
    %spritemapEntry(0, $00, $EC, 0, 1, 2, 0, $12F)

SpriteObjectSpritemaps_32_MetroidElectricity_C:
    dw $0002                                                             ;B4D7DB;
    %spritemapEntry(0, $1F8, $FC, 0, 0, 2, 0, $14D)
    %spritemapEntry(0, $1F0, $FC, 0, 0, 2, 0, $14C)

SpriteObjectSpritemaps_32_MetroidElectricity_D:
    dw $0001                                                             ;B4D7E7;
    %spritemapEntry(0, $1F0, $FC, 0, 0, 2, 0, $15C)

SpriteObjectSpritemaps_32_MetroidElectricity_E:
    dw $0002                                                             ;B4D7EE;
    %spritemapEntry(0, $1F8, $FC, 0, 0, 2, 0, $16D)
    %spritemapEntry(0, $1F0, $FC, 0, 0, 2, 0, $16C)

SpriteObjectSpritemaps_32_33_MetroidElectricity_F:
    dw $0002                                                             ;B4D7FA;
    %spritemapEntry(0, $1F8, $F4, 0, 0, 2, 0, $13D)
    %spritemapEntry(0, $1F8, $EC, 0, 0, 2, 0, $12D)

SpriteObjectSpritemaps_32_33_MetroidElectricity_10:
    dw $0002                                                             ;B4D806;
    %spritemapEntry(0, $1F8, $F4, 0, 0, 2, 0, $13E)
    %spritemapEntry(0, $1F8, $EC, 0, 0, 2, 0, $12E)

SpriteObjectSpritemaps_32_33_MetroidElectricity_11:
    dw $0002                                                             ;B4D812;
    %spritemapEntry(0, $1F8, $F4, 0, 0, 2, 0, $13F)
    %spritemapEntry(0, $1F8, $EC, 0, 0, 2, 0, $12F)

SpriteObjectSpritemaps_32_MetroidElectricity_12:
    dw $0002                                                             ;B4D81E;
    %spritemapEntry(0, $08, $FC, 0, 0, 2, 0, $14D)
    %spritemapEntry(0, $00, $FC, 0, 0, 2, 0, $14C)

SpriteObjectSpritemaps_32_MetroidElectricity_13:
    dw $0002                                                             ;B4D82A;
    %spritemapEntry(0, $08, $FC, 0, 0, 2, 0, $15D)
    %spritemapEntry(0, $00, $FC, 0, 0, 2, 0, $15C)

SpriteObjectSpritemaps_32_MetroidElectricity_14:
    dw $0002                                                             ;B4D836;
    %spritemapEntry(0, $08, $FC, 0, 0, 2, 0, $16D)
    %spritemapEntry(0, $00, $FC, 0, 0, 2, 0, $16C)

SpriteObjectSpritemaps_32_33_MetroidElectricity_15:
    dw $0001                                                             ;B4D842;
    %spritemapEntry(0, $00, $EC, 0, 0, 2, 0, $17C)

SpriteObjectSpritemaps_32_33_MetroidElectricity_16:
    dw $0001                                                             ;B4D849;
    %spritemapEntry(0, $00, $EC, 0, 0, 2, 0, $17D)

SpriteObjectSpritemaps_32_33_MetroidElectricity_17:
    dw $0001                                                             ;B4D850;
    %spritemapEntry(0, $00, $EC, 0, 0, 2, 0, $17E)

SpriteObjectSpritemaps_37_EnemyShot_0:
    dw $0004                                                             ;B4D857;
    %spritemapEntry(0, $02, $02, 1, 1, 2, 6, $BC)
    %spritemapEntry(0, $1F6, $02, 1, 0, 2, 6, $BC)
    %spritemapEntry(0, $02, $F6, 0, 1, 2, 6, $BC)
    %spritemapEntry(0, $1F6, $F6, 0, 0, 2, 6, $BC)

SpriteObjectSpritemaps_37_EnemyShot_1:
    dw $0004                                                             ;B4D86D;
    %spritemapEntry(0, $04, $04, 1, 1, 2, 6, $BD)
    %spritemapEntry(0, $1F4, $04, 1, 0, 2, 6, $BD)
    %spritemapEntry(0, $04, $F4, 0, 1, 2, 6, $BD)
    %spritemapEntry(0, $1F4, $F4, 0, 0, 2, 6, $BD)

SpriteObjectSpritemaps_37_EnemyShot_2:
    dw $0004                                                             ;B4D883;
    %spritemapEntry(0, $07, $07, 1, 1, 2, 6, $CB)
    %spritemapEntry(0, $07, $F1, 0, 1, 2, 6, $CB)
    %spritemapEntry(0, $1F1, $07, 1, 0, 2, 6, $CB)
    %spritemapEntry(0, $1F1, $F1, 0, 0, 2, 6, $CB)

SpriteObjectSpritemaps_37_EnemyShot_3:
    dw $0004                                                             ;B4D899;
    %spritemapEntry(0, $0B, $0B, 1, 1, 2, 6, $CC)
    %spritemapEntry(0, $1ED, $0B, 1, 0, 2, 6, $CC)
    %spritemapEntry(0, $0B, $ED, 0, 1, 2, 6, $CC)
    %spritemapEntry(0, $1ED, $ED, 0, 0, 2, 6, $CC)

SpriteObjectSpritemaps_38_YappingMawBaseFacingDown:
    dw $0001                                                             ;B4D8AF;
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $10A)

SpriteObjectSpritemaps_39_YappingMawBaseFacingUp:
    dw $0001                                                             ;B4D8B6;
    %spritemapEntry(1, $1F8, $F8, 1, 0, 2, 0, $10A)

UNUSED_SpriteObjectSpritemaps_3A_0_B4D8BD:
    dw $000E                                                             ;B4D8BD;
    %spritemapEntry(0, $1FB, $00, 0, 0, 2, 0, $F3)
    %spritemapEntry(0, $1F3, $00, 0, 0, 2, 0, $F2)
    %spritemapEntry(0, $1FD, $04, 0, 0, 2, 0, $F4)
    %spritemapEntry(0, $1F9, $FD, 0, 0, 2, 0, $F1)
    %spritemapEntry(0, $1F1, $FD, 0, 0, 2, 0, $F0)
    %spritemapEntry(1, $1FE, $FB, 0, 0, 2, 0, $D6)
    %spritemapEntry(1, $1EE, $FB, 0, 0, 2, 0, $D4)
    %spritemapEntry(1, $1FE, $EB, 0, 0, 2, 0, $D2)
    %spritemapEntry(1, $1EE, $EB, 0, 0, 2, 0, $D0)
    %spritemapEntry(1, $02, $FB, 0, 0, 2, 0, $D8)
    %spritemapEntry(1, $01, $01, 0, 0, 2, 0, $DA)
    %spritemapEntry(1, $1FF, $07, 0, 0, 2, 0, $DC)
    %spritemapEntry(0, $1FE, $10, 0, 0, 2, 0, $F6)
    %spritemapEntry(0, $1FE, $08, 0, 0, 2, 0, $F5)

UNUSED_SpriteObjectSpritemaps_3A_1_B4D905:
    dw $0010                                                             ;B4D905;
    %spritemapEntry(0, $1F9, $FC, 0, 0, 2, 0, $F3)
    %spritemapEntry(0, $1F1, $FC, 0, 0, 2, 0, $F2)
    %spritemapEntry(0, $1FB, $00, 0, 0, 2, 0, $F4)
    %spritemapEntry(0, $1FD, $04, 0, 0, 2, 0, $F3)
    %spritemapEntry(0, $1F5, $04, 0, 0, 2, 0, $F2)
    %spritemapEntry(0, $1EE, $FB, 0, 0, 2, 0, $F9)
    %spritemapEntry(0, $1F6, $F3, 0, 0, 2, 0, $FC)
    %spritemapEntry(1, $1FE, $FB, 0, 0, 2, 0, $D6)
    %spritemapEntry(1, $1EE, $FB, 0, 0, 2, 0, $D4)
    %spritemapEntry(1, $1FE, $EB, 0, 0, 2, 0, $D2)
    %spritemapEntry(1, $1EE, $EB, 0, 0, 2, 0, $D0)
    %spritemapEntry(1, $02, $FC, 0, 0, 2, 0, $D8)
    %spritemapEntry(1, $01, $02, 0, 0, 2, 0, $DA)
    %spritemapEntry(1, $1FF, $07, 0, 0, 2, 0, $DC)
    %spritemapEntry(0, $1FE, $11, 0, 0, 2, 0, $F6)
    %spritemapEntry(0, $1FE, $09, 0, 0, 2, 0, $F5)

UNUSED_SpriteObjectSpritemaps_3A_2_B4D957:
    dw $0010                                                             ;B4D957;
    %spritemapEntry(0, $1FC, $04, 0, 0, 2, 0, $F1)
    %spritemapEntry(0, $1FC, $00, 0, 0, 2, 0, $F3)
    %spritemapEntry(0, $1F4, $04, 0, 0, 2, 0, $F0)
    %spritemapEntry(0, $1F4, $00, 0, 0, 2, 0, $F2)
    %spritemapEntry(0, $1F8, $FC, 0, 0, 2, 0, $F4)
    %spritemapEntry(0, $1EE, $FB, 0, 0, 2, 0, $FA)
    %spritemapEntry(0, $1F6, $F3, 0, 0, 2, 0, $FB)
    %spritemapEntry(1, $1FE, $FB, 0, 0, 2, 0, $D6)
    %spritemapEntry(1, $1EE, $FB, 0, 0, 2, 0, $D4)
    %spritemapEntry(1, $1FE, $EB, 0, 0, 2, 0, $D2)
    %spritemapEntry(1, $1EE, $EB, 0, 0, 2, 0, $D0)
    %spritemapEntry(1, $02, $FD, 0, 0, 2, 0, $D8)
    %spritemapEntry(1, $01, $03, 0, 0, 2, 0, $DA)
    %spritemapEntry(1, $1FF, $08, 0, 0, 2, 0, $DC)
    %spritemapEntry(0, $1FE, $12, 0, 0, 2, 0, $F6)
    %spritemapEntry(0, $1FE, $0A, 0, 0, 2, 0, $F5)

UNUSED_SpriteObjectSpritemaps_3A_3_B4D9A9:
    dw $0010                                                             ;B4D9A9;
    %spritemapEntry(0, $1FE, $04, 0, 0, 2, 0, $F3)
    %spritemapEntry(0, $1F6, $04, 0, 0, 2, 0, $F2)
    %spritemapEntry(0, $1F4, $01, 0, 0, 2, 0, $F0)
    %spritemapEntry(0, $1FC, $01, 0, 0, 2, 0, $F1)
    %spritemapEntry(0, $1FB, $FC, 0, 0, 2, 0, $F3)
    %spritemapEntry(0, $1F3, $FC, 0, 0, 2, 0, $F2)
    %spritemapEntry(0, $1EE, $FB, 0, 0, 2, 0, $F9)
    %spritemapEntry(1, $1FE, $FB, 0, 0, 2, 0, $D6)
    %spritemapEntry(1, $1EE, $FB, 0, 0, 2, 0, $D4)
    %spritemapEntry(1, $1FE, $EB, 0, 0, 2, 0, $D2)
    %spritemapEntry(1, $1EE, $EB, 0, 0, 2, 0, $D0)
    %spritemapEntry(1, $02, $FD, 0, 0, 2, 0, $D8)
    %spritemapEntry(1, $01, $04, 0, 0, 2, 0, $DA)
    %spritemapEntry(1, $1FF, $09, 0, 0, 2, 0, $DC)
    %spritemapEntry(0, $1FE, $12, 0, 0, 2, 0, $F6)
    %spritemapEntry(0, $1FE, $0A, 0, 0, 2, 0, $F5)

UNUSED_SpriteObjectSpritemaps_3A_4_B4D9FB:
    dw $000F                                                             ;B4D9FB;
    %spritemapEntry(0, $1FC, $00, 0, 0, 2, 0, $F3)
    %spritemapEntry(0, $1F4, $00, 0, 0, 2, 0, $F2)
    %spritemapEntry(0, $1FE, $04, 0, 0, 2, 0, $F4)
    %spritemapEntry(0, $1FA, $FD, 0, 0, 2, 0, $F1)
    %spritemapEntry(0, $1F2, $FD, 0, 0, 2, 0, $F0)
    %spritemapEntry(0, $1EE, $FB, 0, 0, 2, 0, $F9)
    %spritemapEntry(1, $1FE, $FB, 0, 0, 2, 0, $D6)
    %spritemapEntry(1, $1EE, $FB, 0, 0, 2, 0, $D4)
    %spritemapEntry(1, $1FE, $EB, 0, 0, 2, 0, $D2)
    %spritemapEntry(1, $1EE, $EB, 0, 0, 2, 0, $D0)
    %spritemapEntry(1, $02, $FD, 0, 0, 2, 0, $D8)
    %spritemapEntry(1, $01, $04, 0, 0, 2, 0, $DA)
    %spritemapEntry(1, $1FF, $0A, 0, 0, 2, 0, $DC)
    %spritemapEntry(0, $1FE, $12, 0, 0, 2, 0, $F6)
    %spritemapEntry(0, $1FE, $0A, 0, 0, 2, 0, $F5)

UNUSED_SpriteObjectSpritemaps_3A_5_B4DA48:
    dw $000E                                                             ;B4DA48;
    %spritemapEntry(0, $1FC, $00, 0, 0, 2, 0, $F4)
    %spritemapEntry(0, $1FE, $04, 0, 0, 2, 0, $F3)
    %spritemapEntry(0, $1FA, $FB, 0, 0, 2, 0, $F3)
    %spritemapEntry(0, $1F2, $FB, 0, 0, 2, 0, $F2)
    %spritemapEntry(0, $1F6, $04, 0, 0, 2, 0, $F2)
    %spritemapEntry(1, $1FE, $FB, 0, 0, 2, 0, $D6)
    %spritemapEntry(1, $1EE, $FB, 0, 0, 2, 0, $D4)
    %spritemapEntry(1, $1FE, $EB, 0, 0, 2, 0, $D2)
    %spritemapEntry(1, $1EE, $EB, 0, 0, 2, 0, $D0)
    %spritemapEntry(1, $02, $FC, 0, 0, 2, 0, $D8)
    %spritemapEntry(1, $01, $03, 0, 0, 2, 0, $DA)
    %spritemapEntry(1, $1FF, $0A, 0, 0, 2, 0, $DC)
    %spritemapEntry(0, $1FE, $11, 0, 0, 2, 0, $F6)
    %spritemapEntry(0, $1FE, $09, 0, 0, 2, 0, $F5)

UNUSED_SpriteObjectSpritemaps_3A_6_B4DA90:
    dw $000E                                                             ;B4DA90;
    %spritemapEntry(0, $1FE, $04, 0, 0, 2, 0, $F1)
    %spritemapEntry(0, $1F6, $04, 0, 0, 2, 0, $F0)
    %spritemapEntry(0, $1FA, $FC, 0, 0, 2, 0, $F4)
    %spritemapEntry(0, $1F4, $00, 0, 0, 2, 0, $F2)
    %spritemapEntry(0, $1FC, $00, 0, 0, 2, 0, $F3)
    %spritemapEntry(1, $1FE, $FB, 0, 0, 2, 0, $D6)
    %spritemapEntry(1, $1EE, $FB, 0, 0, 2, 0, $D4)
    %spritemapEntry(1, $1FE, $EB, 0, 0, 2, 0, $D2)
    %spritemapEntry(1, $1EE, $EB, 0, 0, 2, 0, $D0)
    %spritemapEntry(1, $02, $FB, 0, 0, 2, 0, $D8)
    %spritemapEntry(1, $01, $01, 0, 0, 2, 0, $DA)
    %spritemapEntry(1, $1FF, $08, 0, 0, 2, 0, $DC)
    %spritemapEntry(0, $1FE, $10, 0, 0, 2, 0, $F6)
    %spritemapEntry(0, $1FE, $08, 0, 0, 2, 0, $F5)

UNUSED_SpriteObjectSpritemaps_3A_7_B4DAD8:
    dw $000F                                                             ;B4DAD8;
    %spritemapEntry(0, $1FE, $04, 0, 0, 2, 0, $F3)
    %spritemapEntry(0, $1F6, $04, 0, 0, 2, 0, $F2)
    %spritemapEntry(0, $1FC, $01, 0, 0, 2, 0, $F1)
    %spritemapEntry(0, $1F4, $01, 0, 0, 2, 0, $F0)
    %spritemapEntry(0, $1FA, $FC, 0, 0, 2, 0, $F3)
    %spritemapEntry(0, $1F2, $FC, 0, 0, 2, 0, $F2)
    %spritemapEntry(1, $1FE, $FB, 0, 0, 2, 0, $D6)
    %spritemapEntry(1, $1EE, $FB, 0, 0, 2, 0, $D4)
    %spritemapEntry(1, $1FE, $EB, 0, 0, 2, 0, $D2)
    %spritemapEntry(1, $1EE, $EB, 0, 0, 2, 0, $D0)
    %spritemapEntry(1, $02, $FB, 0, 0, 2, 0, $D8)
    %spritemapEntry(1, $01, $01, 0, 0, 2, 0, $DA)
    %spritemapEntry(1, $1FF, $07, 0, 0, 2, 0, $DC)
    %spritemapEntry(0, $1FE, $0F, 0, 0, 2, 0, $F6)
    %spritemapEntry(0, $1FE, $07, 0, 0, 2, 0, $F5)

UNUSED_SpriteObjectSpritemaps_B4FB25:
    dw $0004                                                             ;B4DB25;
    %spritemapEntry(0, $00, $00, 1, 0, 2, 0, $F8)
    %spritemapEntry(0, $1F8, $00, 1, 0, 2, 0, $F7)
    %spritemapEntry(0, $00, $F8, 0, 0, 2, 0, $F8)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 2, 0, $F7)

UNUSED_SpriteObjectSpritemaps_B4FB3B:
    dw $0001                                                             ;B4DB3B;
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $DE)

SpriteObjectSpritemaps_3B_EvirFacingLeft_0:
    dw $000C                                                             ;B4DB42;
    %spritemapEntry(0, $00, $02, 0, 0, 2, 0, $F3)
    %spritemapEntry(0, $1F8, $02, 0, 0, 2, 0, $F2)
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 0, $F1)
    %spritemapEntry(0, $1F4, $FC, 0, 0, 2, 0, $F0)
    %spritemapEntry(1, $00, $FC, 0, 0, 2, 0, $D6)
    %spritemapEntry(1, $1F0, $FC, 0, 0, 2, 0, $D4)
    %spritemapEntry(1, $00, $EC, 0, 0, 2, 0, $D2)
    %spritemapEntry(1, $1F0, $EC, 0, 0, 2, 0, $D0)
    %spritemapEntry(1, $04, $FB, 0, 0, 2, 0, $D8)
    %spritemapEntry(1, $02, $02, 0, 0, 2, 0, $DC)
    %spritemapEntry(0, $00, $0F, 0, 0, 2, 0, $F6)
    %spritemapEntry(0, $00, $07, 0, 0, 2, 0, $F5)

SpriteObjectSpritemaps_3B_EvirFacingLeft_1:
    dw $000C                                                             ;B4DB80;
    %spritemapEntry(0, $1F8, $F4, 0, 0, 2, 0, $FC)
    %spritemapEntry(0, $00, $02, 0, 0, 2, 0, $F4)
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 0, $F3)
    %spritemapEntry(0, $1F4, $FC, 0, 0, 2, 0, $F2)
    %spritemapEntry(1, $00, $FC, 0, 0, 2, 0, $D6)
    %spritemapEntry(1, $1F0, $FC, 0, 0, 2, 0, $D4)
    %spritemapEntry(1, $00, $EC, 0, 0, 2, 0, $D2)
    %spritemapEntry(1, $1F0, $EC, 0, 0, 2, 0, $D0)
    %spritemapEntry(1, $04, $FC, 0, 0, 2, 0, $D8)
    %spritemapEntry(1, $02, $03, 0, 0, 2, 0, $DC)
    %spritemapEntry(0, $00, $0E, 0, 0, 2, 0, $F6)
    %spritemapEntry(0, $00, $06, 0, 0, 2, 0, $F5)

SpriteObjectSpritemaps_3B_EvirFacingLeft_2:
    dw $000C                                                             ;B4DBBE;
    %spritemapEntry(0, $1F8, $F4, 0, 0, 2, 0, $FB)
    %spritemapEntry(0, $00, $02, 0, 0, 2, 0, $F3)
    %spritemapEntry(0, $1F8, $02, 0, 0, 2, 0, $F2)
    %spritemapEntry(0, $1FA, $FC, 0, 0, 2, 0, $F4)
    %spritemapEntry(1, $00, $FC, 0, 0, 2, 0, $D6)
    %spritemapEntry(1, $1F0, $FC, 0, 0, 2, 0, $D4)
    %spritemapEntry(1, $00, $EC, 0, 0, 2, 0, $D2)
    %spritemapEntry(1, $1F0, $EC, 0, 0, 2, 0, $D0)
    %spritemapEntry(1, $04, $FD, 0, 0, 2, 0, $D8)
    %spritemapEntry(1, $02, $03, 0, 0, 2, 0, $DC)
    %spritemapEntry(0, $00, $0D, 0, 0, 2, 0, $F6)
    %spritemapEntry(0, $00, $05, 0, 0, 2, 0, $F5)

SpriteObjectSpritemaps_3B_EvirFacingLeft_3:
    dw $000D                                                             ;B4DBFC;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 0, $F3)
    %spritemapEntry(0, $1F4, $FC, 0, 0, 2, 0, $F2)
    %spritemapEntry(0, $1F0, $FC, 0, 0, 2, 0, $F9)
    %spritemapEntry(0, $00, $02, 0, 0, 2, 0, $F1)
    %spritemapEntry(0, $1F8, $02, 0, 0, 2, 0, $F0)
    %spritemapEntry(1, $00, $FC, 0, 0, 2, 0, $D6)
    %spritemapEntry(1, $1F0, $FC, 0, 0, 2, 0, $D4)
    %spritemapEntry(1, $00, $EC, 0, 0, 2, 0, $D2)
    %spritemapEntry(1, $1F0, $EC, 0, 0, 2, 0, $D0)
    %spritemapEntry(1, $04, $FD, 0, 0, 2, 0, $D8)
    %spritemapEntry(1, $02, $04, 0, 0, 2, 0, $DC)
    %spritemapEntry(0, $00, $0E, 0, 0, 2, 0, $F6)
    %spritemapEntry(0, $00, $06, 0, 0, 2, 0, $F5)

SpriteObjectSpritemaps_3C_EvirFacingRight_0:
    dw $000C                                                             ;B4DC3F;
    %spritemapEntry(0, $1F8, $02, 0, 1, 2, 0, $F3)
    %spritemapEntry(0, $00, $02, 0, 1, 2, 0, $F2)
    %spritemapEntry(0, $1FC, $FC, 0, 1, 2, 0, $F1)
    %spritemapEntry(0, $04, $FC, 0, 1, 2, 0, $F0)
    %spritemapEntry(1, $1F0, $FC, 0, 1, 2, 0, $D6)
    %spritemapEntry(1, $00, $FC, 0, 1, 2, 0, $D4)
    %spritemapEntry(1, $1F0, $EC, 0, 1, 2, 0, $D2)
    %spritemapEntry(1, $00, $EC, 0, 1, 2, 0, $D0)
    %spritemapEntry(1, $1EC, $FB, 0, 1, 2, 0, $D8)
    %spritemapEntry(1, $1EE, $02, 0, 1, 2, 0, $DC)
    %spritemapEntry(0, $1F8, $0F, 0, 1, 2, 0, $F6)
    %spritemapEntry(0, $1F8, $07, 0, 1, 2, 0, $F5)

SpriteObjectSpritemaps_3C_EvirFacingRight_1:
    dw $000C                                                             ;B4DC7D;
    %spritemapEntry(0, $00, $F4, 0, 1, 2, 0, $FC)
    %spritemapEntry(0, $1F8, $02, 0, 1, 2, 0, $F4)
    %spritemapEntry(0, $1FC, $FC, 0, 1, 2, 0, $F3)
    %spritemapEntry(0, $04, $FC, 0, 1, 2, 0, $F2)
    %spritemapEntry(1, $1F0, $FC, 0, 1, 2, 0, $D6)
    %spritemapEntry(1, $00, $FC, 0, 1, 2, 0, $D4)
    %spritemapEntry(1, $1F0, $EC, 0, 1, 2, 0, $D2)
    %spritemapEntry(1, $00, $EC, 0, 1, 2, 0, $D0)
    %spritemapEntry(1, $1EC, $FC, 0, 1, 2, 0, $D8)
    %spritemapEntry(1, $1EE, $03, 0, 1, 2, 0, $DC)
    %spritemapEntry(0, $1F8, $0E, 0, 1, 2, 0, $F6)
    %spritemapEntry(0, $1F8, $06, 0, 1, 2, 0, $F5)

SpriteObjectSpritemaps_3C_EvirFacingRight_2:
    dw $000C                                                             ;B4DCBB;
    %spritemapEntry(0, $00, $F4, 0, 1, 2, 0, $FB)
    %spritemapEntry(0, $1F8, $02, 0, 1, 2, 0, $F3)
    %spritemapEntry(0, $00, $02, 0, 1, 2, 0, $F2)
    %spritemapEntry(0, $1FE, $FC, 0, 1, 2, 0, $F4)
    %spritemapEntry(1, $1F0, $FC, 0, 1, 2, 0, $D6)
    %spritemapEntry(1, $00, $FC, 0, 1, 2, 0, $D4)
    %spritemapEntry(1, $1F0, $EC, 0, 1, 2, 0, $D2)
    %spritemapEntry(1, $00, $EC, 0, 1, 2, 0, $D0)
    %spritemapEntry(1, $1EC, $FD, 0, 1, 2, 0, $D8)
    %spritemapEntry(1, $1EE, $03, 0, 1, 2, 0, $DC)
    %spritemapEntry(0, $1F8, $0D, 0, 1, 2, 0, $F6)
    %spritemapEntry(0, $1F8, $05, 0, 1, 2, 0, $F5)

SpriteObjectSpritemaps_3C_EvirFacingRight_3:
    dw $000D                                                             ;B4DCF9;
    %spritemapEntry(0, $1FC, $FC, 0, 1, 2, 0, $F3)
    %spritemapEntry(0, $04, $FC, 0, 1, 2, 0, $F2)
    %spritemapEntry(0, $08, $FC, 0, 1, 2, 0, $F9)
    %spritemapEntry(0, $1F8, $02, 0, 1, 2, 0, $F1)
    %spritemapEntry(0, $00, $02, 0, 1, 2, 0, $F0)
    %spritemapEntry(1, $1F0, $FC, 0, 1, 2, 0, $D6)
    %spritemapEntry(1, $00, $FC, 0, 1, 2, 0, $D4)
    %spritemapEntry(1, $1F0, $EC, 0, 1, 2, 0, $D2)
    %spritemapEntry(1, $00, $EC, 0, 1, 2, 0, $D0)
    %spritemapEntry(1, $1EC, $FD, 0, 1, 2, 0, $D8)
    %spritemapEntry(1, $1EE, $04, 0, 1, 2, 0, $DC)
    %spritemapEntry(0, $1F8, $0E, 0, 1, 2, 0, $F6)
    %spritemapEntry(0, $1F8, $06, 0, 1, 2, 0, $F5)

UNUSED_SpriteObjectSpritemaps_B4DD3C:
    dw $0001                                                             ;B4DD3C;
    %spritemapEntry(1, $1F8, $F8, 0, 0, 3, 5, $1CA)

UNUSED_SpriteObjectSpritemaps_B4DD43:
    dw $0001                                                             ;B4DD43;
    %spritemapEntry(1, $1F8, $F8, 0, 0, 3, 5, $1CC)

UNUSED_SpriteObjectSpritemaps_B4DD4A:
    dw $0001                                                             ;B4DD4A;
    %spritemapEntry(1, $1F8, $F8, 0, 0, 3, 5, $1CE)

SpriteObjectSpritemaps_3D_DraygonFoamingAtTheMouth_0:
    dw $0001                                                             ;B4DD51;
    %spritemapEntry(1, $1F8, $F8, 0, 0, 3, 2, $1E0)

SpriteObjectSpritemaps_3D_DraygonFoamingAtTheMouth_1:
    dw $0001                                                             ;B4DD58;
    %spritemapEntry(1, $1F8, $F4, 0, 0, 3, 2, $1E2)

SpriteObjectSpritemaps_3D_DraygonFoamingAtTheMouth_2:
    dw $0001                                                             ;B4DD5F;
    %spritemapEntry(1, $1F8, $F0, 0, 0, 3, 2, $1E4)

SpriteObjectSpritemaps_3D_DraygonFoamingAtTheMouth_3:
    dw $0001                                                             ;B4DD66;
    %spritemapEntry(1, $1F8, $EC, 0, 0, 3, 2, $1E6)

SpriteObjectSpritemaps_3D_DraygonFoamingAtTheMouth_4:
    dw $0001                                                             ;B4DD6D;
    %spritemapEntry(1, $1F8, $E8, 0, 0, 3, 2, $1E8)

SpriteObjectSpritemaps_3D_DraygonFoamingAtTheMouth_5:
    dw $0001                                                             ;B4DD74;
    %spritemapEntry(1, $1F8, $E4, 0, 0, 3, 2, $1EA)

SpriteObjectSpritemaps_3D_DraygonFoamingAtTheMouth_6:
    dw $0001                                                             ;B4DD7B;
    %spritemapEntry(1, $1F8, $E0, 0, 0, 3, 2, $1EC)

SpriteObjectSpritemaps_3D_DraygonFoamingAtTheMouth_7:
    dw $0001                                                             ;B4DD82;
    %spritemapEntry(1, $1F8, $DC, 0, 0, 3, 2, $1EE)
